-- creature_immunities: reusable immunity sets referenced by creature_template.CreatureImmunitiesId
DROP TABLE IF EXISTS `creature_immunities`;
CREATE TABLE `creature_immunities` (
  `ID` int NOT NULL,
  `SchoolMask` tinyint NOT NULL DEFAULT '0',
  `DispelTypeMask` smallint NOT NULL DEFAULT '0',
  `MechanicsMask` bigint NOT NULL DEFAULT '0',
  `Effects` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Auras` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ImmuneAoE` tinyint(1) NOT NULL DEFAULT '0',
  `ImmuneChain` tinyint(1) NOT NULL DEFAULT '0',
  `Comment` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `creature_template` ADD COLUMN `CreatureImmunitiesId` int NOT NULL DEFAULT '0' AFTER `RegenHealth`;

-- migrate every distinct (spell_school_immune_mask, mechanic_immune_mask) pair to one immunity set
-- old mechanic mask uses bit (mechanic - 1), new MechanicsMask uses bit (mechanic): shift left by one
INSERT INTO `creature_immunities` (`ID`, `SchoolMask`, `DispelTypeMask`, `MechanicsMask`, `Effects`, `Auras`, `ImmuneAoE`, `ImmuneChain`, `Comment`)
SELECT -(ROW_NUMBER() OVER (ORDER BY `spell_school_immune_mask`, `mechanic_immune_mask`)) - 1,
    `spell_school_immune_mask`, 0, CAST(`mechanic_immune_mask` AS UNSIGNED) << 1, '', '', 0, 0, ''
FROM (SELECT DISTINCT `spell_school_immune_mask`, `mechanic_immune_mask` FROM `creature_template`
      WHERE `spell_school_immune_mask` <> 0 OR `mechanic_immune_mask` <> 0) AS `combos`;

UPDATE `creature_template` ct
JOIN `creature_immunities` ci ON ci.`SchoolMask` = ct.`spell_school_immune_mask` AND ci.`MechanicsMask` = (CAST(ct.`mechanic_immune_mask` AS UNSIGNED) << 1) AND ci.`ID` < 0
SET ct.`CreatureImmunitiesId` = ci.`ID`
WHERE ct.`spell_school_immune_mask` <> 0 OR ct.`mechanic_immune_mask` <> 0;

ALTER TABLE `creature_template` DROP COLUMN `mechanic_immune_mask`, DROP COLUMN `spell_school_immune_mask`;
