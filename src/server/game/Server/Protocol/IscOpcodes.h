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

#ifndef TRINITYCORE_ISC_OPCODES_H
#define TRINITYCORE_ISC_OPCODES_H

#include "Define.h"
#include <string>

class IscPacket;
class WorldSession;

/// Opcodes of the ISC protocol, see IscProtocol.h
/// Keep in sync with client/AddOns/ISC/Opcodes.lua
enum IscOpcodes : uint16
{
    ISC_NULL_OPCODE                                 = 0x000,
    NUM_ISC_OPCODES
};

struct IscOpcodeHandler
{
    char const* Name;
    void (WorldSession::*Handler)(IscPacket& packet);   // nullptr for opcodes sent by the server
};

/// Returns nullptr for unknown opcodes
IscOpcodeHandler const* GetIscOpcodeHandler(uint16 opcode);

/// Lookup opcode name for human understandable logging
std::string GetIscOpcodeNameForLogging(uint16 opcode);

#endif
