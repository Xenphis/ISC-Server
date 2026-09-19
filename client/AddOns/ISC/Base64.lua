-- Standard base64 with padding, identical to Trinity::Encoding::Base64 on the server
ISC = ISC or {}

local Base64 = {}
ISC.Base64 = Base64

local byte, char, concat = string.byte, string.char, table.concat
local floor = math.floor

local ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local PADDING = byte("=")

local encodeTable, decodeTable = {}, {}
for i = 1, #ALPHABET do
    encodeTable[i - 1] = ALPHABET:sub(i, i)
    decodeTable[byte(ALPHABET, i)] = i - 1
end

function Base64.Encode(data)
    local out = {}
    for i = 1, #data, 3 do
        local a, b, c = byte(data, i, i + 2)
        local n = a * 65536 + (b or 0) * 256 + (c or 0)
        out[#out + 1] = encodeTable[floor(n / 262144)] .. encodeTable[floor(n / 4096) % 64]
            .. (b and encodeTable[floor(n / 64) % 64] or "=") .. (c and encodeTable[n % 64] or "=")
    end
    return concat(out)
end

-- Returns nil for invalid input
function Base64.Decode(text)
    local length = #text
    if length % 4 ~= 0 then
        return nil
    end

    local out = {}
    for i = 1, length, 4 do
        local s1, s2, s3, s4 = byte(text, i, i + 3)
        local pad3, pad4 = s3 == PADDING, s4 == PADDING
        if (pad3 or pad4) and i + 3 ~= length or pad3 and not pad4 then
            return nil
        end

        local v1, v2 = decodeTable[s1], decodeTable[s2]
        local v3 = pad3 and 0 or decodeTable[s3]
        local v4 = pad4 and 0 or decodeTable[s4]
        if not (v1 and v2 and v3 and v4) then
            return nil
        end

        local n = v1 * 262144 + v2 * 4096 + v3 * 64 + v4
        local a, b, c = floor(n / 65536), floor(n / 256) % 256, n % 256
        if pad3 then
            out[#out + 1] = char(a)
        elseif pad4 then
            out[#out + 1] = char(a, b)
        else
            out[#out + 1] = char(a, b, c)
        end
    end
    return concat(out)
end
