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

#include "IscProtocol.h"
#include "Base64.h"
#include "Errors.h"
#include <algorithm>
#include <limits>

namespace
{
    void WriteUInt16(std::vector<uint8>& buffer, uint16 value)
    {
        buffer.push_back(uint8(value & 0xFF));
        buffer.push_back(uint8(value >> 8));
    }

    uint16 ReadUInt16(std::vector<uint8> const& buffer, std::size_t offset)
    {
        return uint16(buffer[offset] | (buffer[offset + 1] << 8));
    }
}

std::vector<std::string> Isc::EncodeFrames(uint16 messageId, IscPacket const& packet)
{
    std::vector<uint8> message;
    message.reserve(MESSAGE_HEADER_SIZE + packet.size());
    WriteUInt16(message, packet.GetOpcode());
    if (!packet.empty())
        message.insert(message.end(), packet.contents(), packet.contents() + packet.size());

    std::size_t const count = (message.size() + MAX_FRAME_DATA - 1) / MAX_FRAME_DATA;
    ASSERT(count <= std::numeric_limits<uint16>::max(), "ISC message too large (" SZFMTD " bytes)", message.size());

    std::vector<std::string> frames;
    frames.reserve(count);
    for (std::size_t index = 0; index < count; ++index)
    {
        std::size_t const offset = index * MAX_FRAME_DATA;
        std::size_t const length = std::min(MAX_FRAME_DATA, message.size() - offset);

        std::vector<uint8> frame;
        frame.reserve(FRAME_HEADER_SIZE + length);
        WriteUInt16(frame, messageId);
        WriteUInt16(frame, uint16(index));
        WriteUInt16(frame, uint16(count));
        frame.insert(frame.end(), message.begin() + offset, message.begin() + offset + length);

        frames.push_back(Trinity::Encoding::Base64::Encode(frame));
    }

    return frames;
}

Optional<IscPacket> Isc::Reassembler::Feed(std::string const& frame)
{
    if (frame.size() > MAX_FRAME_LENGTH)
    {
        Reset();
        return {};
    }

    Optional<std::vector<uint8>> decoded = Trinity::Encoding::Base64::Decode(frame);
    if (!decoded || decoded->size() < FRAME_HEADER_SIZE)
    {
        Reset();
        return {};
    }

    uint16 const messageId = ReadUInt16(*decoded, 0);
    uint16 const index = ReadUInt16(*decoded, 2);
    uint16 const count = ReadUInt16(*decoded, 4);

    if (index == 0)
    {
        // a new message replaces any unfinished one
        Reset();
        if (!count)
            return {};

        _messageId = messageId;
        _count = count;
    }
    else if (!_count || messageId != _messageId || index != _nextIndex || count != _count)
    {
        Reset();
        return {};
    }

    if (_data.size() + decoded->size() - FRAME_HEADER_SIZE > _maxMessageSize)
    {
        Reset();
        return {};
    }

    _data.insert(_data.end(), decoded->begin() + FRAME_HEADER_SIZE, decoded->end());
    _nextIndex = uint16(index + 1);
    if (_nextIndex < _count)
        return {};

    if (_data.size() < MESSAGE_HEADER_SIZE)
    {
        Reset();
        return {};
    }

    std::size_t const payloadSize = _data.size() - MESSAGE_HEADER_SIZE;
    IscPacket packet(IscOpcodes(ReadUInt16(_data, 0)), payloadSize);
    if (payloadSize)
        packet.append(_data.data() + MESSAGE_HEADER_SIZE, payloadSize);

    Reset();
    return packet;
}

void Isc::Reassembler::Reset()
{
    _data.clear();
    _messageId = 0;
    _nextIndex = 0;
    _count = 0;
}
