DROP TABLE IF EXISTS `creature_template_sparring`;
CREATE TABLE `creature_template_sparring` (
  `Entry` int unsigned NOT NULL,
  `NoNPCDamageBelowHealthPct` float NOT NULL,
  PRIMARY KEY (`Entry`,`NoNPCDamageBelowHealthPct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- transition from old sparring system (Thorim pre-phase NPCs, UnitAI::ShouldSparWith)
DELETE FROM `creature_template_sparring` WHERE `Entry` IN (32882, 32883, 32885, 32886, 32907, 32908);
INSERT INTO `creature_template_sparring` (`Entry`, `NoNPCDamageBelowHealthPct`) VALUES
(32882, 100),
(32883, 100),
(32885, 100),
(32907, 100),
(32908, 100);
