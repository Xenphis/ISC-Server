-- ISC packet: reads and writes values like the server ByteBuffer (little-endian, null-terminated strings)
ISC = ISC or {}

local Packet = {}
Packet.__index = Packet

local byte, char, sub, find, concat = string.byte, string.char, string.sub, string.find, table.concat
local floor, frexp, ldexp, huge = math.floor, math.frexp, math.ldexp, math.huge

-- Creates a packet: pass data to read a received message, omit it to write a new one
function ISC.Packet(opcode, data)
    return setmetatable({ opcode = opcode, data = data, pos = 1, parts = {} }, Packet)
end

function Packet:GetOpcode()
    return self.opcode
end

-- Returns the written payload
function Packet:GetData()
    return concat(self.parts)
end

local function WriteUnsigned(self, value, size)
    value = floor(value)
    assert(value >= 0 and value < 256 ^ size, "ISC: value out of range")
    local bytes = {}
    for i = 1, size do
        bytes[i] = value % 256
        value = floor(value / 256)
    end
    self.parts[#self.parts + 1] = char(unpack(bytes))
end

local function WriteSigned(self, value, size)
    value = floor(value)
    local limit = 2 ^ (8 * size - 1)
    assert(value >= -limit and value < limit, "ISC: value out of range")
    if value < 0 then
        value = value + 2 * limit
    end
    WriteUnsigned(self, value, size)
end

local function ReadUnsigned(self, size)
    local pos = self.pos
    if pos + size - 1 > #self.data then
        error(("ISC: read past the end of packet 0x%03X"):format(self.opcode), 3)
    end
    local value, multiplier = 0, 1
    for i = pos, pos + size - 1 do
        value = value + byte(self.data, i) * multiplier
        multiplier = multiplier * 256
    end
    self.pos = pos + size
    return value
end

local function ReadSigned(self, size)
    local value = ReadUnsigned(self, size)
    local limit = 2 ^ (8 * size - 1)
    if value >= limit then
        value = value - 2 * limit
    end
    return value
end

function Packet:WriteUInt8(value) WriteUnsigned(self, value, 1) end
function Packet:WriteUInt16(value) WriteUnsigned(self, value, 2) end
function Packet:WriteUInt32(value) WriteUnsigned(self, value, 4) end
function Packet:WriteInt8(value) WriteSigned(self, value, 1) end
function Packet:WriteInt16(value) WriteSigned(self, value, 2) end
function Packet:WriteInt32(value) WriteSigned(self, value, 4) end

function Packet:ReadUInt8() return ReadUnsigned(self, 1) end
function Packet:ReadUInt16() return ReadUnsigned(self, 2) end
function Packet:ReadUInt32() return ReadUnsigned(self, 4) end
function Packet:ReadInt8() return ReadSigned(self, 1) end
function Packet:ReadInt16() return ReadSigned(self, 2) end
function Packet:ReadInt32() return ReadSigned(self, 4) end

function Packet:WriteBool(value) WriteUnsigned(self, value and 1 or 0, 1) end
function Packet:ReadBool() return ReadUnsigned(self, 1) ~= 0 end

-- IEEE 754 single precision, like the server float
function Packet:WriteFloat(value)
    local bits
    if value ~= value then
        bits = 0x7FC00000
    else
        local sign = 0
        if value < 0 or (value == 0 and 1 / value < 0) then
            sign = 0x80000000
            value = -value
        end

        if value == huge then
            bits = sign + 0x7F800000
        elseif value == 0 then
            bits = sign
        else
            local mantissa, exponent = frexp(value)
            exponent = exponent + 126
            if exponent <= 0 then
                -- subnormal, rounding may carry into the smallest normal
                bits = sign + floor(ldexp(mantissa, 23 + exponent) + 0.5)
            else
                mantissa = floor((mantissa * 2 - 1) * 2 ^ 23 + 0.5)
                if mantissa == 2 ^ 23 then
                    mantissa = 0
                    exponent = exponent + 1
                end
                if exponent >= 255 then
                    bits = sign + 0x7F800000
                else
                    bits = sign + exponent * 2 ^ 23 + mantissa
                end
            end
        end
    end
    WriteUnsigned(self, bits, 4)
end

function Packet:ReadFloat()
    local bits = ReadUnsigned(self, 4)
    local sign = bits >= 0x80000000 and -1 or 1
    local exponent = floor(bits / 2 ^ 23) % 256
    local mantissa = bits % 2 ^ 23
    if exponent == 255 then
        return mantissa == 0 and sign * huge or 0 / 0
    elseif exponent == 0 then
        return sign * ldexp(mantissa, -149)
    end
    return sign * ldexp(mantissa + 2 ^ 23, exponent - 150)
end

function Packet:WriteString(value)
    value = tostring(value)
    assert(not find(value, "\0", 1, true), "ISC: strings cannot contain null characters")
    self.parts[#self.parts + 1] = value .. "\0"
end

function Packet:ReadString()
    local data, pos = self.data, self.pos
    local finish = find(data, "\0", pos, true)
    if not finish then
        error(("ISC: unterminated string in packet 0x%03X"):format(self.opcode), 2)
    end
    self.pos = finish + 1
    return sub(data, pos, finish - 1)
end

-- GUIDs travel as uint64 and are exposed as "0x%016X" strings, like UnitGUID
function Packet:WriteGuid(guid)
    local hex = tostring(guid or "0"):gsub("^0[xX]", "")
    assert(#hex <= 16 and not find(hex, "[^%x]"), "ISC: invalid guid")
    hex = ("0"):rep(16 - #hex) .. hex
    WriteUnsigned(self, tonumber(sub(hex, 9, 16), 16), 4)
    WriteUnsigned(self, tonumber(sub(hex, 1, 8), 16), 4)
end

function Packet:ReadGuid()
    local low = ReadUnsigned(self, 4)
    local high = ReadUnsigned(self, 4)
    -- 16-bit halves: %X overflows above 2^31 on the 32-bit client
    return ("0x%04X%04X%04X%04X"):format(floor(high / 65536), high % 65536, floor(low / 65536), low % 65536)
end
