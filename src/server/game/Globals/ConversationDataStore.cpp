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


#include "ConversationDataStore.h"
#include "DatabaseEnv.h"
#include "Log.h"
#include "MapUtils.h"
#include "ObjectMgr.h"
#include "Timer.h"

void ConversationDataStore::LoadConversationTemplates()
{
    uint32 oldMSTime = getMSTime();

    _conversationTemplateStore.clear();

    //                                               0               1    2           3         4
    QueryResult result = WorldDatabase.Query("SELECT ConversationId, Idx, CreatureId, Duration, Text FROM conversation_line");
    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 conversations. DB table `conversation_line` is empty.");
        return;
    }

    uint32 count = 0;
    do
    {
        Field* fields = result->Fetch();

        uint32 conversationId = fields[0].GetUInt32();
        uint8 idx             = fields[1].GetUInt8();
        uint32 creatureId     = fields[2].GetUInt32();
        uint32 duration       = fields[3].GetUInt32();

        if (creatureId && !sObjectMgr->GetCreatureTemplate(creatureId))
        {
            TC_LOG_ERROR("sql.sql", "Table `conversation_line` references an invalid creature id ({}) for Conversation {} and Idx {}, skipped.", creatureId, conversationId, idx);
            continue;
        }

        if (!duration)
        {
            TC_LOG_ERROR("sql.sql", "Table `conversation_line` has no Duration for Conversation {} and Idx {}, skipped.", conversationId, idx);
            continue;
        }

        ConversationTemplate& conversation = _conversationTemplateStore[conversationId];
        conversation.Id = conversationId;

        ConversationLine& line = conversation.Lines[idx];
        line.CreatureId = creatureId;
        line.Duration = duration;
        ObjectMgr::AddLocaleString(fields[4].GetString(), LOCALE_enUS, line.Text);
        ++count;
    } while (result->NextRow());

    //                                                    0               1    2       3
    if (QueryResult locales = WorldDatabase.Query("SELECT ConversationId, Idx, Locale, Text FROM conversation_line_locale"))
    {
        do
        {
            Field* fields = locales->Fetch();

            uint32 conversationId = fields[0].GetUInt32();
            uint8 idx             = fields[1].GetUInt8();

            LocaleConstant locale = GetLocaleByName(fields[2].GetString());
            if (locale == LOCALE_enUS)
                continue;

            ConversationTemplate* conversation = Trinity::Containers::MapGetValuePtr(_conversationTemplateStore, conversationId);
            ConversationLine* line = conversation ? Trinity::Containers::MapGetValuePtr(conversation->Lines, idx) : nullptr;
            if (!line)
            {
                TC_LOG_ERROR("sql.sql", "Table `conversation_line_locale` references a non existing line (Conversation {}, Idx {}), skipped.", conversationId, idx);
                continue;
            }

            ObjectMgr::AddLocaleString(fields[3].GetString(), locale, line->Text);
        } while (locales->NextRow());
    }

    TC_LOG_INFO("server.loading", ">> Loaded {} conversations with {} lines in {} ms", _conversationTemplateStore.size(), count, GetMSTimeDiffToNow(oldMSTime));
}

ConversationTemplate const* ConversationDataStore::GetConversationTemplate(uint32 conversationId) const
{
    return Trinity::Containers::MapGetValuePtr(_conversationTemplateStore, conversationId);
}

ConversationDataStore* ConversationDataStore::Instance()
{
    static ConversationDataStore instance;
    return &instance;
}
