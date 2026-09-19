-- ISC conversations, played by the ISC client addon (see WorldSession::SendConversation)
-- Text variables: $n name, $r race, $c class, $gmale:female; (player the conversation is sent to)
-- SmartAI: action SMART_ACTION_CREATE_CONVERSATION (143), action_param1 = ConversationId, played for the player targets
DROP TABLE IF EXISTS `conversation_line`;
CREATE TABLE `conversation_line` (
  `ConversationId` int unsigned NOT NULL,
  `Idx` tinyint unsigned NOT NULL COMMENT 'lines are played in this order',
  `CreatureId` int unsigned NOT NULL DEFAULT '0' COMMENT 'speaker, creature_template entry, 0 for the player',
  `Duration` int unsigned NOT NULL COMMENT 'in ms',
  `Text` text NOT NULL,
  PRIMARY KEY (`ConversationId`,`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ISC Conversation System';

DROP TABLE IF EXISTS `conversation_line_locale`;
CREATE TABLE `conversation_line_locale` (
  `ConversationId` int unsigned NOT NULL,
  `Idx` tinyint unsigned NOT NULL,
  `Locale` varchar(4) NOT NULL,
  `Text` text NOT NULL,
  PRIMARY KEY (`ConversationId`,`Idx`,`Locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ISC Conversation System';

DELETE FROM `command` WHERE `name` IN ('debug conversation','reload conversation_line');
INSERT INTO `command` (`name`,`help`) VALUES
('debug conversation','Syntax: .debug conversation #conversationId\r\n\r\nPlays the conversation #conversationId from `conversation_line` in the ISC client addon.'),
('reload conversation_line','Syntax: .reload conversation_line\r\nReload conversation_line and conversation_line_locale tables.');

-- Example: a conversation between a creature and the player
-- INSERT INTO `conversation_line` (`ConversationId`, `Idx`, `CreatureId`, `Duration`, `Text`) VALUES
-- (1, 0, @ENTRY, 6000, 'At last, $n. The winds from the north carry grim tidings.'),
-- (1, 1, 0, 4000, 'I came as soon as I got your message. What happened?'),
-- (1, 2, @ENTRY, 5000, 'Not here. Meet me at the camp, and trust no one.');
-- INSERT INTO `conversation_line_locale` (`ConversationId`, `Idx`, `Locale`, `Text`) VALUES
-- (1, 0, 'frFR', 'Enfin, $n. Les vents du nord apportent de sombres nouvelles.');
