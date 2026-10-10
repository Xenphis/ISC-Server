-- Remove all quest content (quests are being redesigned from scratch).
-- Quest definitions and their texts
TRUNCATE TABLE `quest_template`;
TRUNCATE TABLE `quest_template_addon`;
TRUNCATE TABLE `quest_template_locale`;
TRUNCATE TABLE `quest_details`;
TRUNCATE TABLE `quest_offer_reward`;
TRUNCATE TABLE `quest_offer_reward_locale`;
TRUNCATE TABLE `quest_request_items`;
TRUNCATE TABLE `quest_request_items_locale`;
TRUNCATE TABLE `quest_greeting`;
TRUNCATE TABLE `quest_greeting_locale`;
TRUNCATE TABLE `quest_mail_sender`;
TRUNCATE TABLE `quest_poi`;
TRUNCATE TABLE `quest_poi_points`;
TRUNCATE TABLE `quest_pool_members`;
TRUNCATE TABLE `quest_pool_template`;

-- Quest givers, quest enders and quest items
TRUNCATE TABLE `creature_queststarter`;
TRUNCATE TABLE `creature_questender`;
TRUNCATE TABLE `creature_questitem`;
TRUNCATE TABLE `gameobject_queststarter`;
TRUNCATE TABLE `gameobject_questender`;
TRUNCATE TABLE `gameobject_questitem`;
TRUNCATE TABLE `areatrigger_involvedrelation`;

-- Game events, faction change and dungeon finder rewards tied to quests
TRUNCATE TABLE `game_event_creature_quest`;
TRUNCATE TABLE `game_event_gameobject_quest`;
TRUNCATE TABLE `game_event_quest_condition`;
TRUNCATE TABLE `game_event_seasonal_questrelation`;
TRUNCATE TABLE `player_factionchange_quests`;
TRUNCATE TABLE `lfg_dungeon_rewards`;

-- Quest disables
DELETE FROM `disables` WHERE `sourceType`=1;

-- Quest requirements on other systems
DELETE FROM `spell_area` WHERE `quest_start`<>0 OR `quest_end`<>0;
UPDATE `access_requirement` SET `quest_done_A`=0, `quest_done_H`=0 WHERE `quest_done_A`<>0 OR `quest_done_H`<>0;
UPDATE `item_template` SET `startquest`=0 WHERE `startquest`<>0;
UPDATE `creature_template` SET `npcflag`=`npcflag` & ~2 WHERE `npcflag` & 2;
UPDATE `creature` SET `npcflag`=`npcflag` & ~2 WHERE `npcflag` & 2;

-- Loot only obtainable while on a quest can never drop anymore
DELETE FROM `creature_loot_template` WHERE `QuestRequired`=1;
DELETE FROM `disenchant_loot_template` WHERE `QuestRequired`=1;
DELETE FROM `fishing_loot_template` WHERE `QuestRequired`=1;
DELETE FROM `gameobject_loot_template` WHERE `QuestRequired`=1;
DELETE FROM `item_loot_template` WHERE `QuestRequired`=1;
DELETE FROM `mail_loot_template` WHERE `QuestRequired`=1;
DELETE FROM `milling_loot_template` WHERE `QuestRequired`=1;
DELETE FROM `pickpocketing_loot_template` WHERE `QuestRequired`=1;
DELETE FROM `prospecting_loot_template` WHERE `QuestRequired`=1;
DELETE FROM `reference_loot_template` WHERE `QuestRequired`=1;
DELETE FROM `skinning_loot_template` WHERE `QuestRequired`=1;
DELETE FROM `spell_loot_template` WHERE `QuestRequired`=1;

-- Conditions: drop every condition set that tests quest state (8 rewarded, 9 taken, 14 none, 28 complete,
-- 43 daily done, 47 state, 48 objective progress) or that is a quest condition source (19, 20)
DROP TEMPORARY TABLE IF EXISTS `tmp_quest_conditions`;
CREATE TEMPORARY TABLE `tmp_quest_conditions` AS
    SELECT DISTINCT `SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`
    FROM `conditions`
    WHERE `ConditionTypeOrReference` IN (8,9,14,28,43,47,48) OR `SourceTypeOrReferenceId` IN (19,20);

-- Condition sets that reference a dropped reference template (negative source = reference template id)
DROP TEMPORARY TABLE IF EXISTS `tmp_quest_condition_refs`;
CREATE TEMPORARY TABLE `tmp_quest_condition_refs` AS
    SELECT DISTINCT `SourceTypeOrReferenceId` FROM `tmp_quest_conditions` WHERE `SourceTypeOrReferenceId` < 0;
INSERT INTO `tmp_quest_conditions`
    SELECT DISTINCT c.`SourceTypeOrReferenceId`, c.`SourceGroup`, c.`SourceEntry`, c.`SourceId`
    FROM `conditions` c
    JOIN `tmp_quest_condition_refs` r ON c.`ConditionTypeOrReference` = r.`SourceTypeOrReferenceId`;
DROP TEMPORARY TABLE `tmp_quest_condition_refs`;

DELETE c FROM `conditions` c
JOIN `tmp_quest_conditions` t
  ON c.`SourceTypeOrReferenceId`=t.`SourceTypeOrReferenceId` AND c.`SourceGroup`=t.`SourceGroup`
 AND c.`SourceEntry`=t.`SourceEntry` AND c.`SourceId`=t.`SourceId`;
DROP TEMPORARY TABLE `tmp_quest_conditions`;

-- SmartAI: quest script type (5), quest events (19 accepted, 20 rewarded, 47-51) and quest actions
-- (6 fail, 7 offer, 15 area explored/event, 26 group event, 33 killed monster, 152, 153)
DELETE FROM `smart_scripts` WHERE `source_type`=5
   OR `event_type` IN (19,20,47,48,49,50,51)
   OR `action_type` IN (6,7,15,26,33,152,153);

-- Remove link events that lost their parent (repeated to follow chains), then clear links pointing at deleted events
DELETE c FROM `smart_scripts` c
LEFT JOIN `smart_scripts` p ON p.`entryorguid`=c.`entryorguid` AND p.`source_type`=c.`source_type` AND p.`link`=c.`id` AND p.`id`<>c.`id`
WHERE c.`event_type`=61 AND p.`id` IS NULL;
DELETE c FROM `smart_scripts` c
LEFT JOIN `smart_scripts` p ON p.`entryorguid`=c.`entryorguid` AND p.`source_type`=c.`source_type` AND p.`link`=c.`id` AND p.`id`<>c.`id`
WHERE c.`event_type`=61 AND p.`id` IS NULL;
DELETE c FROM `smart_scripts` c
LEFT JOIN `smart_scripts` p ON p.`entryorguid`=c.`entryorguid` AND p.`source_type`=c.`source_type` AND p.`link`=c.`id` AND p.`id`<>c.`id`
WHERE c.`event_type`=61 AND p.`id` IS NULL;
UPDATE `smart_scripts` p
LEFT JOIN `smart_scripts` c ON c.`entryorguid`=p.`entryorguid` AND c.`source_type`=p.`source_type` AND c.`id`=p.`link`
SET p.`link`=0
WHERE p.`link`<>0 AND c.`id` IS NULL;
