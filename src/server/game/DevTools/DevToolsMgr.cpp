/*
 * This file is part of the TrinityCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "DevToolsMgr.h"
#include "BuiltInConfig.h"
#include "ConditionMgr.h"
#include "Creature.h"
#include "DatabaseEnv.h"
#include "Log.h"
#include "Map.h"
#include "MapManager.h"
#include "MovementDefines.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "PoolMgr.h"
#include "SmartScriptMgr.h"
#include "StringConvert.h"
#include "StringFormat.h"
#include "Util.h"
#include <algorithm>
#include <filesystem>
#include <fstream>

namespace
{
    // distance between the player and the creatures spawned in front of them
    constexpr float SPAWN_DISTANCE = 3.0f;

    // Texts coming from the client or the database end up in SQL comments
    std::string ToSingleLine(std::string text)
    {
        std::ranges::replace_if(text, [](char c) { return c == '\r' || c == '\n'; }, ' ');
        return text;
    }

    uint64 CountRows(std::string_view table, std::string_view where)
    {
        QueryResult result = WorldDatabase.PQuery("SELECT COUNT(*) FROM `{}` WHERE {}", table, where);
        return result ? (*result)[0].GetUInt64() : 0;
    }
}

DevToolsMgr* DevToolsMgr::instance()
{
    static DevToolsMgr instance;
    return &instance;
}

bool DevToolsMgr::DeleteCreatureSpawn(Creature const* creature, std::string& message)
{
    ObjectGuid::LowType const spawnId = creature->GetSpawnId();
    CreatureData const* data = spawnId ? sObjectMgr->GetCreatureData(spawnId) : nullptr;
    if (!data)
    {
        message = "This creature is not a spawn of the world database.";
        return false;
    }

    if (IsCreatureSpawnHidden(spawnId))
    {
        message = Trinity::StringFormat("Spawn {} is already deleted.", spawnId);
        return false;
    }

    // spawned with the DevTools and not committed yet: there is nothing to delete, the spawn is cancelled
    auto pendingSpawn = std::ranges::find_if(_changes, [spawnId](DevToolsChange const& change)
    {
        return change.Type == DevToolsChangeType::SpawnCreature && change.SpawnId == spawnId;
    });
    if (pendingSpawn != _changes.end())
    {
        message = "Cancelled: " + pendingSpawn->Label;
        return Undo(pendingSpawn->Id, message);
    }

    DevToolsChange& change = _changes.emplace_back();
    change.Id = _nextChangeId++;
    change.SpawnId = spawnId;
    change.Label = Trinity::StringFormat("Delete {} (entry {}, spawn {})", ToSingleLine(creature->GetName()), data->id, spawnId);

    change.Sql = Trinity::StringFormat("-- Delete creature spawn {} ({}, entry {}) on map {} at ({:.2f}, {:.2f}, {:.2f})\n",
        spawnId, ToSingleLine(creature->GetName()), data->id, data->mapId,
        data->spawnPoint.GetPositionX(), data->spawnPoint.GetPositionY(), data->spawnPoint.GetPositionZ());
    change.Sql += Trinity::StringFormat("DELETE FROM `creature` WHERE `guid` = {};\n", spawnId);

    // rows referencing the spawn, same tables as Creature::DeleteFromDB plus the scripts and movement data
    std::pair<std::string_view, std::string> const linkedRows[] =
    {
        { "creature_addon",             Trinity::StringFormat("`guid` = {}", spawnId) },
        { "creature_movement_override", Trinity::StringFormat("`SpawnId` = {}", spawnId) },
        { "spawn_group",                Trinity::StringFormat("`spawnType` = {} AND `spawnId` = {}", uint32(SPAWN_TYPE_CREATURE), spawnId) },
        { "pool_members",               Trinity::StringFormat("`type` = {} AND `spawnId` = {}", uint32(SPAWN_TYPE_CREATURE), spawnId) },
        { "linked_respawn",             Trinity::StringFormat("(`guid` = {0} AND `linkType` IN ({1}, {2})) OR (`linkedGuid` = {0} AND `linkType` IN ({1}, {3}))",
                                            spawnId, uint32(LINKED_RESPAWN_CREATURE_TO_CREATURE), uint32(LINKED_RESPAWN_CREATURE_TO_GO), uint32(LINKED_RESPAWN_GO_TO_CREATURE)) },
        { "game_event_creature",        Trinity::StringFormat("`guid` = {}", spawnId) },
        { "game_event_model_equip",     Trinity::StringFormat("`guid` = {}", spawnId) },
        { "creature_formations",        Trinity::StringFormat("`leaderGUID` = {0} OR `memberGUID` = {0}", spawnId) },
        { "smart_scripts",              Trinity::StringFormat("`entryorguid` = -{} AND `source_type` = {}", spawnId, uint32(SMART_SCRIPT_TYPE_CREATURE)) },
        { "conditions",                 Trinity::StringFormat("`SourceTypeOrReferenceId` = {} AND `SourceEntry` = -{} AND `SourceId` = {}",
                                            uint32(CONDITION_SOURCE_TYPE_SMART_EVENT), spawnId, uint32(SMART_SCRIPT_TYPE_CREATURE)) },
    };

    for (auto const& [table, where] : linkedRows)
    {
        if (uint64 count = CountRows(table, where))
        {
            change.Sql += Trinity::StringFormat("DELETE FROM `{}` WHERE {};\n", table, where);
            change.Details += Trinity::StringFormat("{}: {} row(s)\n", table, count);
        }
    }

    // the waypoint path goes with the spawn, unless other creatures use it
    if (CreatureAddon const* addon = sObjectMgr->GetCreatureAddon(spawnId); addon && addon->path_id)
    {
        uint64 const otherUsers = CountRows("creature_addon", Trinity::StringFormat("`path_id` = {} AND `guid` <> {}", addon->path_id, spawnId))
            + CountRows("creature_template_addon", Trinity::StringFormat("`path_id` = {}", addon->path_id));
        if (otherUsers)
            change.Details += Trinity::StringFormat("waypoint_data: path {} kept, used by other creatures\n", addon->path_id);
        else
        {
            change.Sql += Trinity::StringFormat("DELETE FROM `waypoint_data` WHERE `id` = {};\n", addon->path_id);
            change.Details += Trinity::StringFormat("waypoint_data: path {}, {} point(s)\n", addon->path_id,
                CountRows("waypoint_data", Trinity::StringFormat("`id` = {}", addon->path_id)));
        }
    }

    // references from other scripts are not deleted, they need a manual review
    if (uint64 count = CountRows("smart_scripts", Trinity::StringFormat("`target_type` = {} AND `target_param1` = {} AND NOT (`entryorguid` = -{} AND `source_type` = {})",
        uint32(SMART_TARGET_CREATURE_GUID), spawnId, spawnId, uint32(SMART_SCRIPT_TYPE_CREATURE))))
    {
        change.Sql += Trinity::StringFormat("-- WARNING: {} row(s) of other smart_scripts target this spawn\n", count);
        change.Details += Trinity::StringFormat("WARNING: {} row(s) of other smart_scripts target this spawn\n", count);
    }

    _hiddenCreatureSpawns.insert(spawnId);
    sMapMgr->DoForAllMapsWithMapId(data->mapId, [spawnId](Map* map)
    {
        map->DespawnAll(SPAWN_TYPE_CREATURE, spawnId);
    });

    TC_LOG_INFO("misc", "DevToolsMgr: {}", change.Label);
    message = change.Label;
    return true;
}

bool DevToolsMgr::SpawnCreature(Player* player, uint32 entry, std::string& message)
{
    CreatureTemplate const* creatureTemplate = sObjectMgr->GetCreatureTemplate(entry);
    if (!creatureTemplate)
    {
        message = Trinity::StringFormat("Creature entry {} does not exist.", entry);
        return false;
    }

    if (player->GetTransport())
    {
        message = "Spawning on a transport is not supported.";
        return false;
    }

    Map* map = player->GetMap();
    Position position = player->GetFirstCollisionPosition(SPAWN_DISTANCE, 0.0f);
    position.SetOrientation(position.GetAbsoluteAngle(player));

    // a temporary creature gives the default values, as for .npc add (see Creature::SaveToDB)
    Creature* creature = Creature::CreateCreature(entry, map, player->GetPhaseMaskForSpawn(), position);
    if (!creature)
    {
        message = Trinity::StringFormat("Could not create creature entry {}.", entry);
        return false;
    }

    // the world database is not written, the spawn only exists in memory until the update file is applied
    ObjectGuid::LowType const spawnId = sObjectMgr->GenerateCreatureSpawnId();
    CreatureData& data = sObjectMgr->NewOrExistCreatureData(spawnId);
    data.spawnId = spawnId;
    data.spawnGroupData = sObjectMgr->GetDefaultSpawnGroup();
    data.id = entry;
    data.mapId = map->GetId();
    data.spawnPoint.Relocate(position);
    data.phaseMask = player->GetPhaseMaskForSpawn();
    data.spawnMask = 1 << map->GetSpawnMode();
    data.spawntimesecs = creature->GetRespawnDelay();
    data.equipmentId = creature->GetCurrentEquipmentId();
    data.curhealth = creature->GetHealth();
    data.curmana = creature->GetPower(POWER_MANA);
    data.movementType = IDLE_MOTION_TYPE;

    creature->CleanupsBeforeDelete();
    delete creature;

    if (!Creature::CreateCreatureFromDB(spawnId, map))
    {
        sObjectMgr->DeleteCreatureData(spawnId);
        message = Trinity::StringFormat("Could not spawn creature entry {}.", entry);
        return false;
    }

    sObjectMgr->AddCreatureToGrid(spawnId, &data);

    std::string const name = ToSingleLine(creatureTemplate->Name);
    DevToolsChange& change = _changes.emplace_back();
    change.Id = _nextChangeId++;
    change.Type = DevToolsChangeType::SpawnCreature;
    change.SpawnId = spawnId;
    change.Label = Trinity::StringFormat("Spawn {} (entry {}, spawn {})", name, entry, spawnId);
    change.Details = Trinity::StringFormat("map {} at ({:.2f}, {:.2f}, {:.2f})\n", data.mapId,
        data.spawnPoint.GetPositionX(), data.spawnPoint.GetPositionY(), data.spawnPoint.GetPositionZ());

    change.Sql = Trinity::StringFormat("-- Spawn creature {} ({}, entry {}) on map {} at ({:.2f}, {:.2f}, {:.2f})\n",
        spawnId, name, entry, data.mapId, data.spawnPoint.GetPositionX(), data.spawnPoint.GetPositionY(), data.spawnPoint.GetPositionZ());
    change.Sql += Trinity::StringFormat("DELETE FROM `creature` WHERE `guid` = {};\n", spawnId);
    change.Sql += "INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, "
        "`spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES\n";
    change.Sql += Trinity::StringFormat("({}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {});\n",
        spawnId, data.id, data.mapId, uint32(data.spawnMask), data.phaseMask, data.displayid, int32(data.equipmentId),
        data.spawnPoint.GetPositionX(), data.spawnPoint.GetPositionY(), data.spawnPoint.GetPositionZ(), data.spawnPoint.GetOrientation(),
        data.spawntimesecs, data.wander_distance, data.currentwaypoint, data.curhealth, data.curmana, uint32(data.movementType),
        data.npcflag, data.unit_flags, data.dynamicflags);

    TC_LOG_INFO("misc", "DevToolsMgr: {}", change.Label);
    message = change.Label;
    return true;
}

bool DevToolsMgr::Undo(uint32 changeId, std::string& error)
{
    auto itr = std::ranges::find(_changes, changeId, &DevToolsChange::Id);
    if (itr == _changes.end())
    {
        error = Trinity::StringFormat("Change {} does not exist or is already committed.", changeId);
        return false;
    }

    ObjectGuid::LowType const spawnId = itr->SpawnId;
    DevToolsChangeType const type = itr->Type;
    TC_LOG_INFO("misc", "DevToolsMgr: undo {}", itr->Label);
    _changes.erase(itr);

    // same as Creature::DeleteFromDB, without the database
    if (type == DevToolsChangeType::SpawnCreature)
    {
        if (CreatureData const* data = sObjectMgr->GetCreatureData(spawnId))
        {
            sMapMgr->DoForAllMapsWithMapId(data->mapId, [spawnId](Map* map)
            {
                map->DespawnAll(SPAWN_TYPE_CREATURE, spawnId);
                map->RemoveRespawnTime(SPAWN_TYPE_CREATURE, spawnId);
            });
            sObjectMgr->DeleteCreatureData(spawnId);
        }
        return true;
    }

    _hiddenCreatureSpawns.erase(spawnId);

    // respawn it where its grid is loaded, the other grids load it again by themselves.
    // Pooled spawns are left to their pool
    CreatureData const* data = sObjectMgr->GetCreatureData(spawnId);
    if (!data || sPoolMgr->IsPartOfAPool<Creature>(spawnId))
        return true;

    sMapMgr->DoForAllMapsWithMapId(data->mapId, [spawnId, data](Map* map)
    {
        if (!(data->spawnMask & (1 << map->GetSpawnMode())) || !map->IsGridLoaded(data->spawnPoint) || !map->ShouldBeSpawnedOnGridLoad<Creature>(spawnId))
            return;

        Creature::CreateCreatureFromDB(spawnId, map);
    });
    return true;
}

std::string DevToolsMgr::Commit(std::string const& description, std::string& error)
{
    if (_changes.empty())
    {
        error = "There is no change to commit.";
        return {};
    }

    std::filesystem::path const directory = std::filesystem::path(BuiltInConfig::GetSourceDirectory()) / "sql" / "updates" / "world" / "3.3.5";
    std::error_code ec;
    if (!std::filesystem::is_directory(directory, ec))
    {
        error = Trinity::StringFormat("Directory {} not found, check SourceDirectory in worldserver.conf.", directory.string());
        return {};
    }

    // next free name of the day: YYYY_MM_DD_NN_world.sql
    time_t const now = time(nullptr);
    tm localTime;
    localtime_r(&now, &localTime);
    std::string const day = Trinity::StringFormat("{:04}_{:02}_{:02}_", localTime.tm_year + 1900, localTime.tm_mon + 1, localTime.tm_mday);

    uint32 nextIndex = 0;
    for (std::filesystem::directory_entry const& entry : std::filesystem::directory_iterator(directory, ec))
    {
        std::string const name = entry.path().filename().string();
        if (!name.starts_with(day))
            continue;

        std::size_t const indexEnd = name.find('_', day.size());
        if (Optional<uint32> index = Trinity::StringTo<uint32>(std::string_view(name).substr(day.size(), indexEnd - day.size())))
            nextIndex = std::max(nextIndex, *index + 1);
    }

    std::string const fileName = Trinity::StringFormat("{}{:02}_world.sql", day, nextIndex);

    // binary keeps the \n line endings of the other update files
    std::ofstream file(directory / fileName, std::ios::out | std::ios::binary);
    file << "-- " << (description.empty() ? "ISC DevTools changes" : ToSingleLine(description)) << '\n';
    for (DevToolsChange const& change : _changes)
        file << '\n' << change.Sql;

    file.close();
    if (!file)
    {
        error = Trinity::StringFormat("Could not write {}.", (directory / fileName).string());
        return {};
    }

    TC_LOG_INFO("misc", "DevToolsMgr: {} change(s) committed to {}", _changes.size(), fileName);
    _changes.clear();
    return fileName;
}
