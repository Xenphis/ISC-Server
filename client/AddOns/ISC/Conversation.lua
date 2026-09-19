-- Conversation prototype, inspired by the retail talking head:
-- shows the lines of an ISC_SMSG_CONVERSATION one after another, with the speaker portrait
ISC = ISC or {}

local EMOTE_TALK = 60               -- AnimationData.dbc, played by the portrait when supported
local CAMERA_RETRY_TIME = 0.15      -- SetCamera(0) is not always honored while the model loads, DBM retries it too
local QUESTION_MARK_MODEL = "Interface\\Buttons\\talktomequestionmark.mdx"

-- units whose model the client can show like its unit frames do, party tokens will cover companions
local UNIT_TOKENS = { "player", "target", "focus", "mouseover", "npc", "pet", "targettarget",
    "party1", "party2", "party3", "party4", "partypet1", "partypet2", "partypet3", "partypet4" }

local conversation, lineIndex, remaining, speakerToken
local cameraTime = 0

local frame = CreateFrame("Frame", "ISCConversationFrame", UIParent)
frame:SetWidth(520)
frame:SetHeight(130)
frame:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 160)
frame:SetFrameStrata("HIGH")
frame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true, tileSize = 32, edgeSize = 32,
    insets = { left = 11, right = 12, top = 12, bottom = 11 },
})
frame:EnableMouse(true)
frame:Hide()

local portraitBorder = CreateFrame("Frame", nil, frame)
portraitBorder:SetWidth(100)
portraitBorder:SetHeight(100)
portraitBorder:SetPoint("LEFT", frame, "LEFT", 16, 0)
portraitBorder:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8X8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    edgeSize = 12,
    insets = { left = 3, right = 3, top = 3, bottom = 3 },
})
portraitBorder:SetBackdropColor(0, 0, 0, 1)

local model = CreateFrame("PlayerModel", nil, portraitBorder)
model:SetPoint("TOPLEFT", portraitBorder, "TOPLEFT", 4, -4)
model:SetPoint("BOTTOMRIGHT", portraitBorder, "BOTTOMRIGHT", -4, 4)

local nameText = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
nameText:SetPoint("TOPLEFT", portraitBorder, "TOPRIGHT", 14, -4)
nameText:SetPoint("RIGHT", frame, "RIGHT", -36, 0)
nameText:SetJustifyH("LEFT")

local lineText = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
lineText:SetPoint("TOPLEFT", nameText, "BOTTOMLEFT", 0, -8)
lineText:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -44, 18)
lineText:SetJustifyH("LEFT")
lineText:SetJustifyV("TOP")

local function FindUnitToken(guid)
    guid = guid:upper()
    for _, token in ipairs(UNIT_TOKENS) do
        local unitGuid = UnitGUID(token)
        if unitGuid and unitGuid:upper() == guid then
            return token
        end
    end
end

-- Same approach as the 3D unit frames (oUF): the unit model when the client knows the speaker,
-- otherwise the creature model, otherwise a question mark
local function SetPortrait(actor)
    model:ClearModel()

    speakerToken = FindUnitToken(actor.guid)
    if not speakerToken and not (actor.creatureEntry > 0 and model.SetCreature) then
        model:SetModelScale(4.25)
        model:SetPosition(0, 0, -1.5)
        model:SetModel(QUESTION_MARK_MODEL)
        cameraTime = 0
        return
    end

    -- the model must be set before the rest of the model API (see DBM boss preview)
    if speakerToken then
        model:SetUnit(speakerToken)
    else
        model:SetCreature(actor.creatureEntry)
    end
    model:SetModelScale(1)
    model:SetPosition(0, 0, 0)
    if model.SetSequence then
        model:SetSequence(EMOTE_TALK)
    end
    model:SetCamera(0)
    cameraTime = CAMERA_RETRY_TIME
end

local function Stop()
    conversation, speakerToken = nil, nil
    if frame:IsShown() then
        PlaySound("igQuestListClose")
        frame:Hide()
    end
end

local function ShowLine(index)
    local line = conversation and conversation[index]
    if not line then
        Stop()
        return
    end

    lineIndex, remaining = index, line.duration / 1000
    nameText:SetText(line.actor.name)
    lineText:SetText(line.text)
    SetPortrait(line.actor)

    -- like retail, the line is also written in the chat
    local info = ChatTypeInfo["MONSTER_SAY"]
    DEFAULT_CHAT_FRAME:AddMessage(CHAT_MONSTER_SAY_GET:format(line.actor.name) .. line.text, info.r, info.g, info.b)
end

local function Start(lines)
    conversation = lines
    if not frame:IsShown() then
        PlaySound("igQuestListOpen")
        -- no fade in: PlayerModel frames mishandle alpha changes since 3.3
        frame:Show()
    end
    ShowLine(1)
end

frame:SetScript("OnUpdate", function(self, elapsed)
    if cameraTime > 0 then
        cameraTime = cameraTime - elapsed
        model:SetCamera(0)
    end

    remaining = remaining - elapsed
    if remaining <= 0 then
        ShowLine(lineIndex + 1)
    end
end)

-- a click skips to the next line
frame:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" then
        ShowLine(lineIndex + 1)
    end
end)

-- refresh the portrait when the speaker unit changes, like oUF portraits
frame:RegisterEvent("UNIT_MODEL_CHANGED")
frame:RegisterEvent("UNIT_PORTRAIT_UPDATE")
frame:SetScript("OnEvent", function(self, event, unit)
    if conversation and speakerToken and unit and UnitIsUnit(unit, speakerToken) then
        SetPortrait(conversation[lineIndex].actor)
    end
end)

local closeButton = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
closeButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -4, -4)
closeButton:SetScript("OnClick", Stop)

local nextButton = CreateFrame("Button", nil, frame)
nextButton:SetWidth(28)
nextButton:SetHeight(28)
nextButton:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -12, 12)
nextButton:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
nextButton:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
nextButton:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
nextButton:SetScript("OnClick", function()
    ShowLine(lineIndex + 1)
end)

ISC.RegisterHandler(ISC.Opcodes.ISC_SMSG_CONVERSATION, function(packet)
    local actors, lines = {}, {}

    for i = 1, packet:ReadUInt8() do
        local name = packet:ReadString()
        local guid = packet:ReadGuid()
        local creatureEntry = packet:ReadUInt32()
        actors[i] = { name = name, guid = guid, creatureEntry = creatureEntry }
    end

    for i = 1, packet:ReadUInt8() do
        local actorIndex = packet:ReadUInt8()
        local duration = packet:ReadUInt32()
        local text = packet:ReadString()
        local actor = actors[actorIndex + 1]
        if actor then
            lines[#lines + 1] = { actor = actor, duration = duration, text = text }
        end
    end

    if #lines > 0 then
        Start(lines)
    end
end)
