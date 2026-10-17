DROP TABLE IF EXISTS `creature_static_flags_override`;
CREATE TABLE `creature_static_flags_override` (
  `SpawnId` bigint unsigned NOT NULL,
  `DifficultyId` tinyint unsigned NOT NULL DEFAULT '0',
  `StaticFlags1` int unsigned DEFAULT NULL,
  `StaticFlags2` int unsigned DEFAULT NULL,
  `StaticFlags3` int unsigned DEFAULT NULL,
  `StaticFlags4` int unsigned DEFAULT NULL,
  PRIMARY KEY (`SpawnId`, `DifficultyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
