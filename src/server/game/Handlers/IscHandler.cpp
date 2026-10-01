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

#include "WorldSession.h"
#include "ChatPackets.h"
#include "ConversationDataStore.h"
#include "Creature.h"
#include "DBCStores.h"
#include "DevToolsMgr.h"
#include "IscProtocol.h"
#include "Log.h"
#include "ObjectAccessor.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "RBAC.h"
#include "Util.h"
#include "World.h"
#include <algorithm>
#include <cctype>

namespace
{
    // Same variables as the quest texts: $n name, $r race, $c class, $gmale:female;
    std::string ReplaceTextVariables(std::string_view text, Player const* player, LocaleConstant dbcLocale)
    {
        std::string result;
        result.reserve(text.size());

        for (std::size_t i = 0; i < text.size(); ++i)
        {
            if (text[i] != '$' || i + 1 == text.size())
            {
                result += text[i];
                continue;
            }

            switch (std::tolower(static_cast<unsigned char>(text[i + 1])))
            {
                case 'n':
                    result += player->GetName();
                    ++i;
                    break;
                case 'r':
                    if (ChrRacesEntry const* race = sChrRacesStore.LookupEntry(player->GetRace()))
                        result += race->Name[dbcLocale];
                    ++i;
                    break;
                case 'c':
                    if (ChrClassesEntry const* playerClass = sChrClassesStore.LookupEntry(player->GetClass()))
                        result += playerClass->Name[dbcLocale];
                    ++i;
                    break;
                case 'g':
                {
                    std::size_t const colon = text.find(':', i + 2);
                    std::size_t const end = colon != std::string_view::npos ? text.find(';', colon + 1) : std::string_view::npos;
                    if (end == std::string_view::npos)
                    {
                        result += text[i];
                        break;
                    }

                    if (player->GetNativeGender() == GENDER_FEMALE)
                        result += text.substr(colon + 1, end - colon - 1);
                    else
                        result += text.substr(i + 2, colon - i - 2);
                    i = end;
                    break;
                }
                default:
                    result += text[i];
                    break;
            }
        }

        return result;
    }
}

bool WorldSession::HandleIscAddonMessage(std::string const& msg, std::string target)
{
    // addon messages are received as "prefix\tframe"
    std::string_view const text(msg);
    if (text.size() <= Isc::CLIENT_PREFIX.size() || !StringStartsWith(text, Isc::CLIENT_PREFIX) || text[Isc::CLIENT_PREFIX.size()] != '\t')
        return false;

    // the client whispers its frames to itself
    if (!normalizePlayerName(target) || target != GetPlayer()->GetName())
        return false;

    Optional<IscPacket> packet = _iscReassembler->Feed(msg.substr(Isc::CLIENT_PREFIX.size() + 1));
    if (!packet)
        return true;

    IscOpcodeHandler const* opcodeHandler = GetIscOpcodeHandler(packet->GetOpcode());
    if (!opcodeHandler || !opcodeHandler->Handler)
    {
        TC_LOG_ERROR("network", "WorldSession::HandleIscAddonMessage: received unexpected {} from {}", GetIscOpcodeNameForLogging(packet->GetOpcode()), GetPlayerInfo());
        return true;
    }

    try
    {
        (this->*opcodeHandler->Handler)(*packet);
    }
    catch (ByteBufferException const&)
    {
        TC_LOG_ERROR("network", "WorldSession::HandleIscAddonMessage: ByteBufferException occured while parsing {} from {}. Skipped packet.",
            GetIscOpcodeNameForLogging(packet->GetOpcode()), GetPlayerInfo());
    }

    return true;
}

void WorldSession::SendIscPacket(IscPacket const& packet)
{
    Player* player = GetPlayer();
    if (!player)
        return;

    for (std::string const& frame : Isc::EncodeFrames(_iscNextMessageId++, packet))
    {
        WorldPackets::Chat::Chat chat;
        chat.Initialize(CHAT_MSG_WHISPER, LANG_ADDON, player, player, std::string(Isc::SERVER_PREFIX) + '\t' + frame);
        SendPacket(chat.Write());
    }
}

bool WorldSession::SendConversation(uint32 conversationId)
{
    Player* player = GetPlayer();
    ConversationTemplate const* conversation = sConversationDataStore->GetConversationTemplate(conversationId);
    if (!player || !conversation)
        return false;

    LocaleConstant const locale = GetSessionDbLocaleIndex();

    // one actor per speaker, the client finds a unit with its guid to show it like the unit frames do
    std::vector<uint32> actors;
    for (auto const& [_, line] : conversation->Lines)
        if (std::ranges::find(actors, line.CreatureId) == actors.end())
            actors.push_back(line.CreatureId);

    IscPacket packet(ISC_SMSG_CONVERSATION);
    packet << uint8(actors.size());                                 // actors: name, guid, creature entry (0: not a creature)
    for (uint32 creatureId : actors)
    {
        if (!creatureId)
        {
            packet << player->GetName() << player->GetGUID() << uint32(0);
            continue;
        }

        CreatureTemplate const* creatureTemplate = sObjectMgr->GetCreatureTemplate(creatureId);    // checked at load
        std::string name = creatureTemplate->Name;
        if (CreatureLocale const* creatureLocale = sObjectMgr->GetCreatureLocale(creatureId))
            ObjectMgr::GetLocaleString(creatureLocale->Name, locale, name);

        Creature const* creature = player->FindNearestCreature(creatureId, player->GetVisibilityRange());
        packet << name << (creature ? creature->GetGUID() : ObjectGuid::Empty) << uint32(creatureId);
    }

    packet << uint8(conversation->Lines.size());                    // lines: actor index, duration in ms, text
    for (auto const& [_, line] : conversation->Lines)
    {
        std::string_view text = ObjectMgr::GetLocaleString(line.Text, LOCALE_enUS);
        ObjectMgr::GetLocaleString(line.Text, locale, text);

        packet << uint8(std::ranges::find(actors, line.CreatureId) - actors.begin()) << uint32(line.Duration) << ReplaceTextVariables(text, player, GetSessionDbcLocale());
    }

    SendIscPacket(packet);
    return true;
}

bool WorldSession::CanUseIscDevTools()
{
    if (sWorld->getBoolConfig(CONFIG_DEVTOOLS_ENABLE) && HasPermission(rbac::RBAC_PERM_COMMAND_NPC_DELETE))
        return true;

    SendIscDevToolsResult(false, "DevTools are disabled (DevTools.Enable) or your account lacks the permission.");
    return false;
}

void WorldSession::HandleIscDevToolsSync(IscPacket& /*packet*/)
{
    if (CanUseIscDevTools())
        SendIscDevToolsChanges();
}

void WorldSession::HandleIscDevToolsDeleteCreature(IscPacket& packet)
{
    ObjectGuid guid;
    packet >> guid;

    if (!CanUseIscDevTools())
        return;

    Creature* creature = ObjectAccessor::GetCreature(*GetPlayer(), guid);
    if (!creature)
    {
        SendIscDevToolsResult(false, "Creature not found.");
        return;
    }

    std::string message;
    bool const success = sDevToolsMgr->DeleteCreatureSpawn(creature, message);
    SendIscDevToolsResult(success, message);
    SendIscDevToolsChanges();
}

void WorldSession::HandleIscDevToolsSpawnCreature(IscPacket& packet)
{
    uint32 entry;
    packet >> entry;

    if (!CanUseIscDevTools())
        return;

    std::string message;
    bool const success = sDevToolsMgr->SpawnCreature(GetPlayer(), entry, message);
    SendIscDevToolsResult(success, message);
    SendIscDevToolsChanges();
}

void WorldSession::HandleIscDevToolsUndo(IscPacket& packet)
{
    uint32 changeId;
    packet >> changeId;

    if (!CanUseIscDevTools())
        return;

    std::string error;
    if (!sDevToolsMgr->Undo(changeId, error))
        SendIscDevToolsResult(false, error);

    SendIscDevToolsChanges();
}

void WorldSession::HandleIscDevToolsCommit(IscPacket& packet)
{
    std::string description;
    packet >> description;

    if (!CanUseIscDevTools())
        return;

    std::string error;
    std::string const fileName = sDevToolsMgr->Commit(description, error);
    if (!fileName.empty())
        SendIscDevToolsResult(true, "Written to sql/updates/world/3.3.5/" + fileName + ", applied at the next restart.");
    else
        SendIscDevToolsResult(false, error);

    SendIscDevToolsChanges();
}

void WorldSession::SendIscDevToolsChanges()
{
    std::vector<DevToolsChange> const& changes = sDevToolsMgr->GetChanges();

    IscPacket packet(ISC_SMSG_DEVTOOLS_CHANGES);
    packet << uint32(changes.size());                               // changes: id, label, details
    for (DevToolsChange const& change : changes)
        packet << uint32(change.Id) << change.Label << change.Details;

    SendIscPacket(packet);
}

void WorldSession::SendIscDevToolsResult(bool success, std::string const& message)
{
    IscPacket packet(ISC_SMSG_DEVTOOLS_RESULT);
    packet << bool(success) << message;
    SendIscPacket(packet);
}
