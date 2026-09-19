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

#ifndef TRINITYCORE_ISC_PACKET_H
#define TRINITYCORE_ISC_PACKET_H

#include "ByteBuffer.h"
#include "IscOpcodes.h"

/// Payload of an ISC protocol message, read and written like a WorldPacket.
/// Kept as a distinct type so it can never be sent as a native packet, see WorldSession::SendIscPacket
class IscPacket : public ByteBuffer
{
public:
    explicit IscPacket(IscOpcodes opcode, size_t reserve = 64) : ByteBuffer(reserve), _opcode(opcode) { }

    IscOpcodes GetOpcode() const { return _opcode; }

private:
    IscOpcodes _opcode;
};

#endif
