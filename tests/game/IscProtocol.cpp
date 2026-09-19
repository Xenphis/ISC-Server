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

#include "tc_catch2.h"

#include "Base64.h"
#include "IscProtocol.h"
#include <iterator>

namespace
{
    IscPacket MakePacket(std::size_t payloadSize)
    {
        IscPacket packet(ISC_NULL_OPCODE, payloadSize);
        for (std::size_t i = 0; i < payloadSize; ++i)
            packet << uint8(i * 7 + 1);
        return packet;
    }

    std::vector<uint8> Payload(IscPacket const& packet)
    {
        if (packet.empty())
            return {};

        return std::vector<uint8>(packet.contents(), packet.contents() + packet.size());
    }

    std::string MakeFrame(uint16 messageId, uint16 index, uint16 count, std::vector<uint8> const& data)
    {
        std::vector<uint8> frame = { uint8(messageId), uint8(messageId >> 8), uint8(index), uint8(index >> 8), uint8(count), uint8(count >> 8) };
        frame.insert(frame.end(), data.begin(), data.end());
        return Trinity::Encoding::Base64::Encode(frame);
    }
}

TEST_CASE("ISC frames round trip", "[IscProtocol]")
{
    // sizes around frame boundaries: a frame carries MAX_FRAME_DATA bytes of message, the opcode takes 2 of them
    std::size_t const payloadSizes[] = { 0, 1, 178, 179, 358, 359, 5000 };
    std::size_t const frameCounts[] = { 1, 1, 1, 2, 2, 3, 28 };

    for (std::size_t i = 0; i < std::size(payloadSizes); ++i)
    {
        INFO("payload size " << payloadSizes[i]);
        IscPacket const packet = MakePacket(payloadSizes[i]);

        std::vector<std::string> const frames = Isc::EncodeFrames(42, packet);
        REQUIRE(frames.size() == frameCounts[i]);

        Isc::Reassembler reassembler;
        Optional<IscPacket> result;
        for (std::size_t index = 0; index < frames.size(); ++index)
        {
            REQUIRE(frames[index].size() <= Isc::MAX_FRAME_LENGTH);
            REQUIRE(frames[index].size() % 4 == 0);

            result = reassembler.Feed(frames[index]);
            REQUIRE(result.has_value() == (index + 1 == frames.size()));
        }

        REQUIRE(result->GetOpcode() == ISC_NULL_OPCODE);
        REQUIRE(Payload(*result) == Payload(packet));
    }
}

TEST_CASE("ISC frame headers", "[IscProtocol]")
{
    std::vector<std::string> const frames = Isc::EncodeFrames(0xABCD, MakePacket(400));
    REQUIRE(frames.size() == 3);

    for (std::size_t index = 0; index < frames.size(); ++index)
    {
        Optional<std::vector<uint8>> const frame = Trinity::Encoding::Base64::Decode(frames[index]);
        REQUIRE(frame.has_value());
        REQUIRE(frame->size() > Isc::FRAME_HEADER_SIZE);
        REQUIRE(((*frame)[0] | ((*frame)[1] << 8)) == 0xABCD);
        REQUIRE(std::size_t((*frame)[2] | ((*frame)[3] << 8)) == index);
        REQUIRE(((*frame)[4] | ((*frame)[5] << 8)) == 3);
    }
}

TEST_CASE("ISC reassembler rejects invalid frames", "[IscProtocol]")
{
    Isc::Reassembler reassembler;
    std::vector<std::string> const frames = Isc::EncodeFrames(7, MakePacket(400));
    REQUIRE(frames.size() == 3);

    SECTION("invalid base64")
    {
        REQUIRE_FALSE(reassembler.Feed("#not base64!").has_value());
    }

    SECTION("frame too long")
    {
        REQUIRE_FALSE(reassembler.Feed(std::string(Isc::MAX_FRAME_LENGTH + 4, 'A')).has_value());
    }

    SECTION("frame shorter than its header")
    {
        REQUIRE_FALSE(reassembler.Feed(Trinity::Encoding::Base64::Encode({ 1, 2, 3 })).has_value());
    }

    SECTION("message without frames")
    {
        REQUIRE_FALSE(reassembler.Feed(MakeFrame(1, 0, 0, { 1, 0 })).has_value());
    }

    SECTION("message shorter than its opcode")
    {
        REQUIRE_FALSE(reassembler.Feed(MakeFrame(1, 0, 1, { 1 })).has_value());
    }

    SECTION("frames out of order")
    {
        REQUIRE_FALSE(reassembler.Feed(frames[0]).has_value());
        REQUIRE_FALSE(reassembler.Feed(frames[2]).has_value());
        REQUIRE_FALSE(reassembler.Feed(frames[1]).has_value());
    }

    SECTION("message too large")
    {
        Isc::Reassembler small(200);
        REQUIRE_FALSE(small.Feed(frames[0]).has_value());
        REQUIRE_FALSE(small.Feed(frames[1]).has_value());
        REQUIRE_FALSE(small.Feed(frames[2]).has_value());
    }

    SECTION("recovers with the next message")
    {
        REQUIRE_FALSE(reassembler.Feed(frames[1]).has_value());
        REQUIRE_FALSE(reassembler.Feed(frames[0]).has_value());
        REQUIRE_FALSE(reassembler.Feed(frames[1]).has_value());
        REQUIRE(reassembler.Feed(frames[2]).has_value());
    }

    SECTION("a new message replaces an unfinished one")
    {
        std::vector<std::string> const other = Isc::EncodeFrames(8, MakePacket(10));
        REQUIRE_FALSE(reassembler.Feed(frames[0]).has_value());

        Optional<IscPacket> const result = reassembler.Feed(other[0]);
        REQUIRE(result.has_value());
        REQUIRE(result->size() == 10);
    }
}
