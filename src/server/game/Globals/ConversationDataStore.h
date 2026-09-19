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


#ifndef TRINITYCORE_CONVERSATION_DATA_STORE_H
#define TRINITYCORE_CONVERSATION_DATA_STORE_H

#include "Define.h"
#include <map>
#include <string>
#include <vector>

/// Simplified take on master's conversations: the client addon plays the lines, the server only stores them.
/// Loaded from `conversation_line` and `conversation_line_locale`, sent with WorldSession::SendConversation
struct ConversationLine
{
    uint32 CreatureId;              // speaker, 0 for the player the conversation is sent to
    uint32 Duration;                // in ms
    std::vector<std::string> Text;  // indexed by LocaleConstant
};

struct ConversationTemplate
{
    uint32 Id;
    std::map<uint8, ConversationLine> Lines;    // by Idx, played in that order
};

class TC_GAME_API ConversationDataStore
{
public:
    void LoadConversationTemplates();

    ConversationTemplate const* GetConversationTemplate(uint32 conversationId) const;

    static ConversationDataStore* Instance();

private:
    std::map<uint32, ConversationTemplate> _conversationTemplateStore;
};

#define sConversationDataStore ConversationDataStore::Instance()

#endif
