DROP TABLE IF EXISTS `creature_static_flag_template`;
CREATE TABLE `creature_static_flag_template` (
  `CreatureId` int unsigned NOT NULL DEFAULT '0',
  `StaticFlags1` int unsigned NOT NULL DEFAULT '0',
  `StaticFlags2` int unsigned NOT NULL DEFAULT '0',
  `StaticFlags3` int unsigned NOT NULL DEFAULT '0',
  `StaticFlags4` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CreatureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
