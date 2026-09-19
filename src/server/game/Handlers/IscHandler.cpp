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
#include "IscProtocol.h"
#include "Log.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "Util.h"

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
