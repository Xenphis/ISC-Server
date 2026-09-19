-- ISC protocol transport, see src/server/game/Server/Protocol/IscProtocol.h for the wire format
ISC = ISC or {}

local CLIENT_PREFIX = "CISC"    -- client -> server
local SERVER_PREFIX = "SISC"    -- server -> client
local FRAME_HEADER_SIZE = 6     -- uint16 messageId, uint16 index, uint16 count
local MAX_FRAME_DATA = 180      -- message bytes per frame, the frame then encodes to 248 base64 characters

local byte, char, sub, concat = string.byte, string.char, string.sub, table.concat
local floor, ceil = math.floor, math.ceil

local handlers = {}
local pending = {}
local nextMessageId = 0

local function UInt16(value)
    return char(value % 256, floor(value / 256) % 256)
end

local function ReadUInt16(data, pos)
    local low, high = byte(data, pos, pos + 1)
    return low + high * 256
end

-- Calls handler(packet) for every message received with this opcode
function ISC.RegisterHandler(opcode, handler)
    handlers[opcode] = handler
end

-- Sends a packet created with ISC.Packet(opcode)
function ISC.Send(packet)
    local message = UInt16(packet:GetOpcode()) .. packet:GetData()
    local count = ceil(#message / MAX_FRAME_DATA)
    assert(count < 65536, "ISC: message too large")

    local messageId = nextMessageId
    nextMessageId = (nextMessageId + 1) % 65536

    local player = UnitName("player")
    for index = 0, count - 1 do
        local data = sub(message, index * MAX_FRAME_DATA + 1, (index + 1) * MAX_FRAME_DATA)
        local frame = UInt16(messageId) .. UInt16(index) .. UInt16(count) .. data
        SendAddonMessage(CLIENT_PREFIX, ISC.Base64.Encode(frame), "WHISPER", player)
    end
end

local function Dispatch(message)
    local opcode = ReadUInt16(message, 1)
    local handler = handlers[opcode]
    if not handler then
        return
    end

    local ok, err = pcall(handler, ISC.Packet(opcode, sub(message, 3)))
    if not ok then
        geterrorhandler()(err)
    end
end

-- Frames of different messages may interleave: the server sends from several threads
local function OnFrame(text)
    local frame = ISC.Base64.Decode(text)
    if not frame or #frame < FRAME_HEADER_SIZE then
        return
    end

    local messageId = ReadUInt16(frame, 1)
    local index = ReadUInt16(frame, 3)
    local count = ReadUInt16(frame, 5)

    local message = pending[messageId]
    if index == 0 then
        message = count > 0 and { count = count, nextIndex = 0, parts = {} } or nil
    elseif not message or index ~= message.nextIndex or count ~= message.count then
        message = nil
    end
    pending[messageId] = message
    if not message then
        return
    end

    message.parts[#message.parts + 1] = sub(frame, FRAME_HEADER_SIZE + 1)
    message.nextIndex = index + 1
    if message.nextIndex < message.count then
        return
    end

    pending[messageId] = nil
    local data = concat(message.parts)
    if #data >= 2 then
        Dispatch(data)
    end
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("CHAT_MSG_ADDON")
eventFrame:SetScript("OnEvent", function(self, event, prefix, text, channel, sender)
    if prefix == SERVER_PREFIX and channel == "WHISPER" and sender == UnitName("player") then
        OnFrame(text)
    end
end)
