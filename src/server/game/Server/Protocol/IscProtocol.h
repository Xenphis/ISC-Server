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

#ifndef TRINITYCORE_ISC_PROTOCOL_H
#define TRINITYCORE_ISC_PROTOCOL_H

#include "IscPacket.h"
#include "Optional.h"
#include <string>
#include <string_view>
#include <vector>

/*
 * ISC protocol: custom opcodes exchanged between the server and the ISC client addon (client/AddOns/ISC),
 * carried by addon messages, the only channel a stock 3.3.5a client offers to addons.
 *
 * Transport
 *   client -> server: SendAddonMessage("CISC", frame, "WHISPER", <own name>), handled in WorldSession::HandleIscAddonMessage
 *   server -> client: CHAT_MSG_WHISPER in LANG_ADDON from the player to himself, text "SISC\t" + frame
 *
 * Frame: standard base64 with padding, at most MAX_FRAME_LENGTH characters, decoding to
 *   uint16 messageId, uint16 index, uint16 count, then at most MAX_FRAME_DATA bytes of the message
 *
 * Message: the data of its frames concatenated in index order
 *   uint16 opcode (IscOpcodes), then the payload as written by ByteBuffer (strings are null-terminated)
 *
 * All integers are little-endian. A frame with index 0 starts a new message.
 * Keep in sync with client/AddOns/ISC/Protocol.lua
 */
namespace Isc
{
    constexpr std::string_view CLIENT_PREFIX = "CISC";
    constexpr std::string_view SERVER_PREFIX = "SISC";
    static_assert(CLIENT_PREFIX.size() == SERVER_PREFIX.size());

    // an addon message holds at most 255 characters: prefix, tab separator and frame
    constexpr std::size_t MAX_ADDON_MESSAGE_LENGTH = 255;
    constexpr std::size_t MAX_FRAME_LENGTH = (MAX_ADDON_MESSAGE_LENGTH - CLIENT_PREFIX.size() - 1) / 4 * 4;   // 248
    constexpr std::size_t FRAME_HEADER_SIZE = 6;
    constexpr std::size_t MAX_FRAME_DATA = MAX_FRAME_LENGTH / 4 * 3 - FRAME_HEADER_SIZE;                     // 180
    constexpr std::size_t MESSAGE_HEADER_SIZE = 2;
    constexpr std::size_t MAX_CLIENT_MESSAGE_SIZE = 16 * 1024;

    /// Splits a packet into frames, without prefix
    TC_GAME_API std::vector<std::string> EncodeFrames(uint16 messageId, IscPacket const& packet);

    /// Rebuilds packets from frames received in order
    class TC_GAME_API Reassembler
    {
    public:
        explicit Reassembler(std::size_t maxMessageSize = MAX_CLIENT_MESSAGE_SIZE) : _maxMessageSize(maxMessageSize) { }

        /// Returns the packet when the last frame of its message is fed, nothing for other or invalid frames
        Optional<IscPacket> Feed(std::string const& frame);

    private:
        void Reset();

        std::size_t _maxMessageSize;
        std::vector<uint8> _data;
        uint16 _messageId = 0;
        uint16 _nextIndex = 0;
        uint16 _count = 0;      // 0 when no message is in progress
    };
}

#endif
