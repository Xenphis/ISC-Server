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

#include "IscOpcodes.h"
#include "WorldSession.h"
#include <array>
#include <iomanip>
#include <sstream>

namespace
{
    std::array<IscOpcodeHandler, NUM_ISC_OPCODES> const IscOpcodeTable = []
    {
        std::array<IscOpcodeHandler, NUM_ISC_OPCODES> table = { };

#define DEFINE_ISC_HANDLER(opcode, handler) table[opcode] = IscOpcodeHandler{ #opcode, handler }
#define DEFINE_ISC_SERVER_OPCODE(opcode) table[opcode] = IscOpcodeHandler{ #opcode, nullptr }
        /*0x001*/ DEFINE_ISC_SERVER_OPCODE(ISC_SMSG_CONVERSATION);
        /*0x002*/ DEFINE_ISC_HANDLER(ISC_CMSG_DEVTOOLS_SYNC,              &WorldSession::HandleIscDevToolsSync);
        /*0x003*/ DEFINE_ISC_HANDLER(ISC_CMSG_DEVTOOLS_DELETE_CREATURE,   &WorldSession::HandleIscDevToolsDeleteCreature);
        /*0x004*/ DEFINE_ISC_HANDLER(ISC_CMSG_DEVTOOLS_UNDO,              &WorldSession::HandleIscDevToolsUndo);
        /*0x005*/ DEFINE_ISC_HANDLER(ISC_CMSG_DEVTOOLS_COMMIT,            &WorldSession::HandleIscDevToolsCommit);
        /*0x006*/ DEFINE_ISC_SERVER_OPCODE(ISC_SMSG_DEVTOOLS_CHANGES);
        /*0x007*/ DEFINE_ISC_SERVER_OPCODE(ISC_SMSG_DEVTOOLS_RESULT);
        /*0x008*/ DEFINE_ISC_HANDLER(ISC_CMSG_DEVTOOLS_SPAWN_CREATURE,    &WorldSession::HandleIscDevToolsSpawnCreature);
#undef DEFINE_ISC_HANDLER
#undef DEFINE_ISC_SERVER_OPCODE

        return table;
    }();
}

IscOpcodeHandler const* GetIscOpcodeHandler(uint16 opcode)
{
    if (opcode >= NUM_ISC_OPCODES || !IscOpcodeTable[opcode].Name)
        return nullptr;

    return &IscOpcodeTable[opcode];
}

std::string GetIscOpcodeNameForLogging(uint16 opcode)
{
    std::ostringstream ss;
    ss << '[';

    if (IscOpcodeHandler const* handler = GetIscOpcodeHandler(opcode))
        ss << handler->Name;
    else
        ss << "UNKNOWN ISC OPCODE";

    ss << " 0x" << std::hex << std::setw(4) << std::setfill('0') << std::uppercase << opcode << std::nouppercase << std::dec << " (" << opcode << ")]";
    return ss.str();
}
