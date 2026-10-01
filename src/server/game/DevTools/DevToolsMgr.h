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

#ifndef TRINITY_DEVTOOLSMGR_H
#define TRINITY_DEVTOOLSMGR_H

#include "Define.h"
#include "ObjectGuid.h"
#include <string>
#include <unordered_set>
#include <vector>

class Creature;
class Player;

enum class DevToolsChangeType : uint8
{
    DeleteCreature,
    SpawnCreature
};

/// A world database change made in game, kept in memory until it is committed to a SQL update file
struct DevToolsChange
{
    uint32 Id = 0;
    DevToolsChangeType Type = DevToolsChangeType::DeleteCreature;
    ObjectGuid::LowType SpawnId = 0;
    std::string Label;                  // one line, shown in the change list
    std::string Details;                // linked rows and warnings (position for a spawn), one per line
    std::string Sql;                    // idempotent statements written to the update file
};

/// Backend of the ISC DevTools addon (client/AddOns/ISC_DevTools).
/// Changes are only applied in memory: the world database is changed when the generated
/// update file is applied by the DBUpdater, at the next startup
class TC_GAME_API DevToolsMgr
{
    public:
        static DevToolsMgr* instance();

        /// Checked by Creature::LoadFromDB, so a deleted spawn neither loads with its grid nor respawns.
        /// Only written from the world thread while maps are not updated, read from map threads
        bool IsCreatureSpawnHidden(ObjectGuid::LowType spawnId) const { return _hiddenCreatureSpawns.contains(spawnId); }

        /// Despawns the creature spawn everywhere and records the SQL deleting it with its linked rows.
        /// A spawn made with SpawnCreature and not committed yet is cancelled instead.
        /// message receives the change label, or the error
        bool DeleteCreatureSpawn(Creature const* creature, std::string& message);

        /// Spawns the creature in front of the player, turned toward the player, and records the SQL inserting it.
        /// The spawn only exists in memory until the update file is applied.
        /// message receives the change label, or the error
        bool SpawnCreature(Player* player, uint32 entry, std::string& message);

        /// Cancels a change that is not committed yet
        bool Undo(uint32 changeId, std::string& error);

        /// Writes the pending changes to sql/updates/world/3.3.5 and clears them, returns the file name
        std::string Commit(std::string const& description, std::string& error);

        std::vector<DevToolsChange> const& GetChanges() const { return _changes; }

    private:
        std::vector<DevToolsChange> _changes;
        uint32 _nextChangeId = 1;

        // stay hidden after a commit, until the restart applies the update file
        std::unordered_set<ObjectGuid::LowType> _hiddenCreatureSpawns;
};

#define sDevToolsMgr DevToolsMgr::instance()

#endif // TRINITY_DEVTOOLSMGR_H
