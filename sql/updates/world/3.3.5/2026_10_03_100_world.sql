-- Entry 38 (Defias Thug)
DELETE FROM `smart_scripts` WHERE `entryorguid`=3800 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3800, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 89, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Move random (distance 5)'),
(3800, 9, 1, 0, 0, 0, 100, 0, 19000, 19000, 0, 0, 0, 53, 0, 6411920, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 19s - Start path 6411920 (walk, no repeat)');
DELETE FROM `smart_scripts` WHERE `entryorguid`=3801 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3801, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 89, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Move random (distance 5)'),
(3801, 9, 1, 0, 0, 0, 100, 0, 19000, 19000, 0, 0, 0, 53, 0, 6420080, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 19s - Start path 6420080 (walk, no repeat)');
DELETE FROM `smart_scripts` WHERE `entryorguid`=38 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (6411920,6420080);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(38, 0, 1, 0, 40, 0, 100, 0, 10, 6411920, 0, 0, 0, 80, 3800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 10 of path 6411920 - Start timed actionlist 3800'),
(38, 0, 2, 0, 40, 0, 100, 0, 11, 6420080, 0, 0, 0, 80, 3801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 11 of path 6420080 - Start timed actionlist 3801');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=6411920 AND `point` IN (10);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=6420080 AND `point` IN (11);

-- Entry 9097 (Scarshield Legionnaire)
DELETE FROM `smart_scripts` WHERE `entryorguid`=909700 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(909700, 9, 0, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 0, 90, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 2s - Set UNIT_FIELD_BYTES_1 1 (sit)'),
(909700, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 5, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Play emote 7'),
(909700, 9, 2, 0, 0, 0, 100, 0, 22000, 22000, 0, 0, 0, 90, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 22s - Set UNIT_FIELD_BYTES_1 0 (stand)');
DELETE FROM `smart_scripts` WHERE `entryorguid`=909701 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(909701, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 3.89208, 'After 0s - Set orientation 3.89208'),
(909701, 9, 1, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 0, 17, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 7s - Set emote state 69'),
(909701, 9, 2, 0, 0, 0, 100, 0, 9000, 9000, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 9s - Set emote state 0');
DELETE FROM `smart_scripts` WHERE `entryorguid`=9097 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (11043600);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(9097, 0, 3, 0, 40, 0, 100, 0, 2, 11043600, 0, 0, 0, 80, 909700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 11043600 - Start timed actionlist 909700'),
(9097, 0, 4, 0, 40, 0, 100, 0, 4, 11043600, 0, 0, 0, 80, 909701, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 11043600 - Start timed actionlist 909701');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=11043600 AND `point` IN (2,4);

-- Entry 10432 (Vectus) - waypoint behaviour moved to C++ script boss_vectus
DELETE FROM `creature_text` WHERE `CreatureID`=10432 AND `BroadcastTextId` IN (7191,7193,7194);
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(10432, 0, 0, 'The Lich King''s forces are building.  It is imperative that our timetable supports his plans.', 12, 0, 100, 0, 0, 0, 7194, 0, 'Vectus'),
(10432, 1, 0, 'Tomorrow we will begin training of our promising dragons, so don''t forget your chew toys.', 12, 0, 100, 0, 0, 0, 7193, 0, 'Vectus'),
(10432, 2, 0, 'Our oldest clutch of dragons are still far from maturity, but with patience and study, we are confident the dragonflight will soon be ready.', 12, 0, 100, 0, 0, 0, 7191, 0, 'Vectus');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=3904400 AND `point` IN (2,3,4);

-- Entry 10899 (Goraluk Anvilcrack)
DELETE FROM `smart_scripts` WHERE `entryorguid`=1089900 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1089900, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 5.75959, 'After 0s - Set orientation 5.75959'),
(1089900, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 0, 17, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 3s - Set emote state 69');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1089901 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1089901, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0.715585, 'After 0s - Set orientation 0.715585'),
(1089901, 9, 1, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 0, 17, 133, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 4s - Set emote state 133'),
(1089901, 9, 2, 0, 0, 0, 100, 0, 35000, 35000, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 35s - Set emote state 0');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1089902 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1089902, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 1.80131, 'After 0s - Set orientation 1.80131'),
(1089902, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 17, 28, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Set emote state 28'),
(1089902, 9, 2, 0, 0, 0, 100, 0, 21000, 21000, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 21s - Set emote state 0');
DELETE FROM `smart_scripts` WHERE `entryorguid`=10899 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (11028480);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(10899, 0, 3, 0, 40, 0, 100, 0, 2, 11028480, 0, 0, 0, 80, 1089900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 11028480 - Start timed actionlist 1089900'),
(10899, 0, 4, 0, 40, 0, 100, 0, 8, 11028480, 0, 0, 0, 80, 1089901, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 11028480 - Start timed actionlist 1089901'),
(10899, 0, 5, 0, 40, 0, 100, 0, 11, 11028480, 0, 0, 0, 80, 1089902, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 11 of path 11028480 - Start timed actionlist 1089902');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=11028480 AND `point` IN (2,8,11);

-- Entry 16580 (Thrallmar Grunt)
DELETE FROM `smart_scripts` WHERE `entryorguid`=1658000 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1658000, 9, 0, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 0, 5, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 2s - Play emote 7');
DELETE FROM `smart_scripts` WHERE `entryorguid`=16580 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (4603120);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(16580, 0, 1, 0, 40, 0, 100, 0, 2, 4603120, 0, 0, 0, 80, 1658000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 4603120 - Start timed actionlist 1658000');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=4603120 AND `point` IN (2);

-- Entry 16907 (Bleeding Hollow Peon)
DELETE FROM `smart_scripts` WHERE `entryorguid`=1690700 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1690700, 9, 0, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 0, 17, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 2s - Set emote state 69'),
(1690700, 9, 1, 0, 0, 0, 100, 0, 40000, 40000, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 40s - Set emote state 0');
DELETE FROM `smart_scripts` WHERE `entryorguid`=16907 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (4690240,4690560,4690800,4690880,4691040);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(16907, 0, 3, 0, 40, 0, 100, 0, 6, 4690240, 0, 0, 0, 80, 1690700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 4690240 - Start timed actionlist 1690700'),
(16907, 0, 4, 0, 40, 0, 100, 0, 12, 4690240, 0, 0, 0, 80, 1690700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 12 of path 4690240 - Start timed actionlist 1690700'),
(16907, 0, 5, 0, 40, 0, 100, 0, 3, 4690560, 0, 0, 0, 80, 1690700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 4690560 - Start timed actionlist 1690700'),
(16907, 0, 6, 0, 40, 0, 100, 0, 12, 4690560, 0, 0, 0, 80, 1690700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 12 of path 4690560 - Start timed actionlist 1690700'),
(16907, 0, 7, 0, 40, 0, 100, 0, 2, 4690800, 0, 0, 0, 80, 1690700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 4690800 - Start timed actionlist 1690700'),
(16907, 0, 8, 0, 40, 0, 100, 0, 6, 4690800, 0, 0, 0, 80, 1690700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 4690800 - Start timed actionlist 1690700'),
(16907, 0, 9, 0, 40, 0, 100, 0, 5, 4690880, 0, 0, 0, 80, 1690700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 4690880 - Start timed actionlist 1690700'),
(16907, 0, 10, 0, 40, 0, 100, 0, 12, 4690880, 0, 0, 0, 80, 1690700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 12 of path 4690880 - Start timed actionlist 1690700'),
(16907, 0, 11, 0, 40, 0, 100, 0, 3, 4691040, 0, 0, 0, 80, 1690700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 4691040 - Start timed actionlist 1690700'),
(16907, 0, 12, 0, 40, 0, 100, 0, 11, 4691040, 0, 0, 0, 80, 1690700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 11 of path 4691040 - Start timed actionlist 1690700');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=4690240 AND `point` IN (6,12);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=4690560 AND `point` IN (3,12);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=4690800 AND `point` IN (2,6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=4690880 AND `point` IN (5,12);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=4691040 AND `point` IN (3,11);

-- Entry 16924 (Sergeant Kan'ren)
DELETE FROM `smart_scripts` WHERE `entryorguid`=16924 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (4696160);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(16924, 0, 1, 0, 40, 0, 100, 0, 7, 4696160, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 4696160 - Talk (BroadcastText 12833)');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=4696160 AND `point` IN (7);

-- Entry 17146 (Kil'sorrow Spellbinder) - waypoint behaviour moved to C++ script npc_nagrand_banner
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=4816480 AND `point` IN (3,4,7,8,10,11);

-- Entry 17222 (Artificer Daelo)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=17222 AND `AIName`='';
DELETE FROM `creature_text` WHERE `CreatureID`=17222 AND `BroadcastTextId` IN (13572,13576,13580);
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(17222, 0, 0, 'This won''t do at all! We have to secure the foundation or the entire structure will crumble!', 12, 7, 100, 0, 0, 0, 13572, 0, 'Artificer Daelo'),
(17222, 1, 0, 'I have much to do! Why can they not leave me to my work?', 12, 0, 100, 0, 0, 0, 13580, 0, 'Artificer Daelo'),
(17222, 2, 0, 'By the foul teat of Kil''Jaeden''s rotted torso, the entire backside is blown out! How can someone be expected to live in here? I''ve seen enough!', 12, 7, 100, 0, 0, 0, 13576, 0, 'Artificer Daelo');
DELETE FROM `smart_scripts` WHERE `entryorguid`=17222 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (6766560);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(17222, 0, 0, 0, 40, 0, 100, 0, 1, 6766560, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 6766560 - Talk (BroadcastText 13572)'),
(17222, 0, 1, 0, 40, 0, 100, 0, 3, 6766560, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 6766560 - Talk (BroadcastText 13580)'),
(17222, 0, 2, 0, 40, 0, 100, 0, 5, 6766560, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 6766560 - Talk (BroadcastText 13576)');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=6766560 AND `point` IN (1,3,5);

-- Entry 17259 (Bonechewer Hungerer)
DELETE FROM `smart_scripts` WHERE `entryorguid`=1725900 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1725900, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0.907571, 'After 0s - Set orientation 0.907571'),
(1725900, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 17, 234, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Set emote state 234');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1725901 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1725901, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 3.29867, 'After 0s - Set orientation 3.29867'),
(1725901, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 17, 234, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Set emote state 234');
DELETE FROM `smart_scripts` WHERE `entryorguid`=17259 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (16209280);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(17259, 0, 5, 0, 40, 0, 100, 0, 4, 16209280, 0, 0, 0, 80, 1725900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 16209280 - Start timed actionlist 1725900'),
(17259, 0, 6, 0, 40, 0, 100, 0, 10, 16209280, 0, 0, 0, 80, 1725901, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 10 of path 16209280 - Start timed actionlist 1725901');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=16209280 AND `point` IN (4,10);

-- Entry 17264 (Bonechewer Ravener)
DELETE FROM `smart_scripts` WHERE `entryorguid`=1726400 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1726400, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 2.33874, 'After 0s - Set orientation 2.33874'),
(1726400, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 17, 234, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Set emote state 234');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1726401 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1726401, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0.191986, 'After 0s - Set orientation 0.191986'),
(1726401, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 17, 234, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Set emote state 234');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1726402 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1726402, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 5.11381, 'After 0s - Set orientation 5.11381'),
(1726402, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 17, 234, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Set emote state 234');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1726403 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1726403, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 4.79965, 'After 0s - Set orientation 4.79965'),
(1726403, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 17, 234, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Set emote state 234');
DELETE FROM `smart_scripts` WHERE `entryorguid`=17264 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (16210000,16210160);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(17264, 0, 1, 0, 40, 0, 100, 0, 6, 16210000, 0, 0, 0, 80, 1726400, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 16210000 - Start timed actionlist 1726400'),
(17264, 0, 2, 0, 40, 0, 100, 0, 12, 16210000, 0, 0, 0, 80, 1726401, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 12 of path 16210000 - Start timed actionlist 1726401'),
(17264, 0, 3, 0, 40, 0, 100, 0, 4, 16210160, 0, 0, 0, 80, 1726402, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 16210160 - Start timed actionlist 1726402'),
(17264, 0, 4, 0, 40, 0, 100, 0, 10, 16210160, 0, 0, 0, 80, 1726403, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 10 of path 16210160 - Start timed actionlist 1726403');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=16210000 AND `point` IN (6,12);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=16210160 AND `point` IN (4,10);

-- Entry 17703 (Messenger Hermesius)
DELETE FROM `smart_scripts` WHERE `entryorguid`=17703 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (5076000);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(17703, 0, 1, 0, 40, 0, 100, 0, 17, 5076000, 0, 0, 0, 5, 133, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 17 of path 5076000 - Play emote 133');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5076000 AND `point` IN (17);

-- Entry 17882 (The Black Stalker) - waypoint behaviour moved to C++ script boss_the_black_stalker
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=4346960 AND `point` IN (2,4,6);

-- Entry 17901 (Keleth)
DELETE FROM `creature_text` WHERE `CreatureID`=17901 AND `BroadcastTextId` IN (14565,14567);
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(17901, 0, 0, 'The wind speaks of our enemies'' movements, Ashyen.  The naga will attack again.', 12, 0, 100, 0, 0, 0, 14565, 0, 'Keleth'),
(17901, 1, 0, 'Very well.  When that decision is made, I will be ready.  Let us hope it won''t be too late.', 12, 0, 100, 0, 0, 0, 14567, 0, 'Keleth');
DELETE FROM `smart_scripts` WHERE `entryorguid`=17901 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (5089120);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(17901, 0, 6, 0, 40, 0, 100, 0, 16, 5089120, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 16 of path 5089120 - Talk (BroadcastText 14565)'),
(17901, 0, 7, 0, 40, 0, 100, 0, 18, 5089120, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 18 of path 5089120 - Talk (BroadcastText 14567)');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5089120 AND `point` IN (16,18);

-- Entry 18274 (Consortium Overseer)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=18274 AND `AIName`='';
DELETE FROM `creature_text` WHERE `CreatureID`=18274 AND `BroadcastTextId` IN (16960);
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(18274, 0, 0, 'Try to keep appraisal errors to a minimum.  I''d hate to tell Gezhe we''ve overpaid on another gem shipment this month.', 12, 0, 100, 0, 0, 0, 16960, 0, 'Consortium Overseer');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1827400 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1827400, 9, 0, 0, 0, 0, 100, 0, 15000, 15000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 15s - Talk (BroadcastText 16960)');
DELETE FROM `smart_scripts` WHERE `entryorguid`=18274 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (5245280);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(18274, 0, 0, 0, 40, 0, 100, 0, 4, 5245280, 0, 0, 0, 80, 1827400, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 5245280 - Start timed actionlist 1827400');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5245280 AND `point` IN (4);

-- Entry 18296 (Sunspring Post Orphan)
DELETE FROM `creature_text` WHERE `CreatureID`=18296 AND `BroadcastTextId` IN (15119);
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(18296, 1, 0, 'Don''t go close to the lake! It''s haunted!', 12, 1, 100, 0, 0, 0, 15119, 0, 'Sunspring Post Orphan');
DELETE FROM `smart_scripts` WHERE `entryorguid`=18296 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (6777440);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(18296, 0, 1, 0, 40, 0, 100, 0, 5, 6777440, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 6777440 - Talk (BroadcastText 15119)');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=6777440 AND `point` IN (5);

-- Entry 18302 (Matron Drakia)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=18302 AND `AIName`='';
DELETE FROM `creature_text` WHERE `CreatureID`=18302 AND `BroadcastTextId` IN (15144);
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(18302, 0, 0, 'I will do my best to take care of the children, Greatmother.', 12, 1, 100, 0, 0, 0, 15144, 0, 'Matron Drakia');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1830200 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1830200, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Talk (BroadcastText 15144)'),
(1830200, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 17, 68, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Set emote state 68');
DELETE FROM `smart_scripts` WHERE `entryorguid`=18302 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (5251040);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(18302, 0, 0, 0, 40, 0, 100, 0, 1, 5251040, 0, 0, 0, 80, 1830200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 5251040 - Start timed actionlist 1830200'),
(18302, 0, 1, 0, 40, 0, 100, 0, 3, 5251040, 0, 0, 0, 17, 68, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 5251040 - Set emote state 68'),
(18302, 0, 2, 0, 40, 0, 100, 0, 6, 5251040, 0, 0, 0, 17, 68, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 5251040 - Set emote state 68'),
(18302, 0, 3, 0, 40, 0, 100, 0, 7, 5251040, 0, 0, 0, 17, 68, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 5251040 - Set emote state 68'),
(18302, 0, 4, 0, 40, 0, 100, 0, 8, 5251040, 0, 0, 0, 17, 68, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 5251040 - Set emote state 68'),
(18302, 0, 5, 0, 40, 0, 100, 0, 9, 5251040, 0, 0, 0, 17, 68, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 9 of path 5251040 - Set emote state 68');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5251040 AND `point` IN (1,3,6,7,8,9);

-- Entry 18419 (Bloodwarder Greenkeeper)
DELETE FROM `smart_scripts` WHERE `entryorguid`=1841900 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1841900, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 17, 378, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Set emote state 378');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1841901 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1841901, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 17, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Set emote state 69');
DELETE FROM `smart_scripts` WHERE `entryorguid`=18419 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (6639440,6639520);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(18419, 0, 5, 0, 40, 0, 100, 0, 1, 6639440, 0, 0, 0, 80, 1841900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 6639440 - Start timed actionlist 1841900'),
(18419, 0, 6, 0, 40, 0, 100, 0, 2, 6639440, 0, 0, 0, 80, 1841901, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 6639440 - Start timed actionlist 1841901'),
(18419, 0, 7, 0, 40, 0, 100, 0, 1, 6639520, 0, 0, 0, 80, 1841900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 6639520 - Start timed actionlist 1841900'),
(18419, 0, 8, 0, 40, 0, 100, 0, 2, 6639520, 0, 0, 0, 80, 1841901, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 6639520 - Start timed actionlist 1841901');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=6639440 AND `point` IN (1,2);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=6639520 AND `point` IN (1,2);

-- Entry 18556 (Phasing Soldier)
DELETE FROM `smart_scripts` WHERE `entryorguid`=1855600 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1855600, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 11, 32754, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Cast spell 32754 on self'),
(1855600, 9, 1, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 0, 28, 32754, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 30s - Remove aura 32754 from self');
DELETE FROM `smart_scripts` WHERE `entryorguid`=18556 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (8371040,8376400,8376480,8380960);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(18556, 0, 1, 0, 40, 0, 100, 0, 7, 8371040, 0, 0, 0, 80, 1855600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 8371040 - Start timed actionlist 1855600'),
(18556, 0, 2, 0, 40, 0, 100, 0, 6, 8376400, 0, 0, 0, 80, 1855600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 8376400 - Start timed actionlist 1855600'),
(18556, 0, 3, 0, 40, 0, 100, 0, 4, 8376480, 0, 0, 0, 80, 1855600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 8376480 - Start timed actionlist 1855600'),
(18556, 0, 4, 0, 40, 0, 100, 0, 7, 8380960, 0, 0, 0, 80, 1855600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 8380960 - Start timed actionlist 1855600');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8371040 AND `point` IN (7);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8376400 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8376480 AND `point` IN (4);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8380960 AND `point` IN (7);

-- Entry 18557 (Phasing Cleric)
DELETE FROM `smart_scripts` WHERE `entryorguid`=1855700 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1855700, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 11, 32754, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Cast spell 32754 on self'),
(1855700, 9, 1, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 0, 28, 32754, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 30s - Remove aura 32754 from self');
DELETE FROM `smart_scripts` WHERE `entryorguid`=18557 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (8381040,8381120,8381680,8381920);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(18557, 0, 4, 0, 40, 0, 100, 0, 8, 8381040, 0, 0, 0, 80, 1855700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 8381040 - Start timed actionlist 1855700'),
(18557, 0, 5, 0, 40, 0, 100, 0, 6, 8381120, 0, 0, 0, 80, 1855700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 8381120 - Start timed actionlist 1855700'),
(18557, 0, 6, 0, 40, 0, 100, 0, 2, 8381680, 0, 0, 0, 80, 1855700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 8381680 - Start timed actionlist 1855700'),
(18557, 0, 7, 0, 40, 0, 100, 0, 8, 8381920, 0, 0, 0, 80, 1855700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 8381920 - Start timed actionlist 1855700');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8381040 AND `point` IN (8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8381120 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8381680 AND `point` IN (2);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8381920 AND `point` IN (8);

-- Entry 18558 (Phasing Sorcerer)
DELETE FROM `smart_scripts` WHERE `entryorguid`=1855800 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1855800, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 11, 32754, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Cast spell 32754 on self'),
(1855800, 9, 1, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 0, 28, 32754, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 30s - Remove aura 32754 from self');
DELETE FROM `smart_scripts` WHERE `entryorguid`=18558 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (8382000,8382320,8382400,8382560,8382640,8382720,8382800);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(18558, 0, 6, 0, 40, 0, 100, 0, 8, 8382000, 0, 0, 0, 80, 1855800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 8382000 - Start timed actionlist 1855800'),
(18558, 0, 7, 0, 40, 0, 100, 0, 6, 8382320, 0, 0, 0, 80, 1855800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 8382320 - Start timed actionlist 1855800'),
(18558, 0, 8, 0, 40, 0, 100, 0, 3, 8382400, 0, 0, 0, 80, 1855800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 8382400 - Start timed actionlist 1855800'),
(18558, 0, 9, 0, 40, 0, 100, 0, 8, 8382560, 0, 0, 0, 80, 1855800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 8382560 - Start timed actionlist 1855800'),
(18558, 0, 10, 0, 40, 0, 100, 0, 6, 8382640, 0, 0, 0, 80, 1855800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 8382640 - Start timed actionlist 1855800'),
(18558, 0, 11, 0, 40, 0, 100, 0, 8, 8382720, 0, 0, 0, 80, 1855800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 8382720 - Start timed actionlist 1855800'),
(18558, 0, 12, 0, 40, 0, 100, 0, 5, 8382800, 0, 0, 0, 80, 1855800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 8382800 - Start timed actionlist 1855800');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8382000 AND `point` IN (8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8382320 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8382400 AND `point` IN (3);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8382560 AND `point` IN (8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8382640 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8382720 AND `point` IN (8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8382800 AND `point` IN (5);

-- Entry 18559 (Phasing Stalker)
DELETE FROM `smart_scripts` WHERE `entryorguid`=1855900 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1855900, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 11, 32754, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Cast spell 32754 on self'),
(1855900, 9, 1, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 0, 28, 32754, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 30s - Remove aura 32754 from self');
DELETE FROM `smart_scripts` WHERE `entryorguid`=18559 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (8360080,8360240,8362080,8362720,8362800);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(18559, 0, 6, 0, 40, 0, 100, 0, 2, 8360080, 0, 0, 0, 80, 1855900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 8360080 - Start timed actionlist 1855900'),
(18559, 0, 7, 0, 40, 0, 100, 0, 5, 8360240, 0, 0, 0, 80, 1855900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 8360240 - Start timed actionlist 1855900'),
(18559, 0, 8, 0, 40, 0, 100, 0, 3, 8362080, 0, 0, 0, 80, 1855900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 8362080 - Start timed actionlist 1855900'),
(18559, 0, 9, 0, 40, 0, 100, 0, 12, 8362720, 0, 0, 0, 80, 1855900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 12 of path 8362720 - Start timed actionlist 1855900'),
(18559, 0, 10, 0, 40, 0, 100, 0, 4, 8362800, 0, 0, 0, 80, 1855900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 8362800 - Start timed actionlist 1855900');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8360080 AND `point` IN (2);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8360240 AND `point` IN (5);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8362080 AND `point` IN (3);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8362720 AND `point` IN (12);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8362800 AND `point` IN (4);

-- Entry 18667 (Blackheart the Inciter) - waypoint behaviour moved to C++ script boss_blackheart_the_inciter
DELETE FROM `creature_text` WHERE `CreatureID`=18667 AND `GroupID` IN (4,5);
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(18667, 4, 0, 'This... no... good...', 12, 0, 100, 0, 0, 0, 17569, 0, 'Blackheart the Inciter'),
(18667, 5, 0, 'You''ll be sorry!', 12, 0, 100, 0, 0, 0, 17563, 0, 'Blackheart the Inciter');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5354960 AND `point` IN (2,3);

-- Entry 18688 (Ancient Orc Ancestor)
DELETE FROM `smart_scripts` WHERE `entryorguid`=1868801 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1868801, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Force despawn (timer 1000)');
DELETE FROM `smart_scripts` WHERE `entryorguid`=18688 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (1147120,1147200,1147360,1198160,1198240,1848880,1973600,1980880,1983520,2008000,2124720,2125120,2544560,2546640,2565760,3238000,3238080,3616320);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(18688, 0, 1, 0, 40, 0, 100, 0, 12, 1147120, 0, 0, 0, 80, 1868801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 12 of path 1147120 - Start timed actionlist 1868801'),
(18688, 0, 2, 0, 40, 0, 100, 0, 13, 1147200, 0, 0, 0, 80, 1868801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 1147200 - Start timed actionlist 1868801'),
(18688, 0, 3, 0, 40, 0, 100, 0, 12, 1147360, 0, 0, 0, 80, 1868801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 12 of path 1147360 - Start timed actionlist 1868801'),
(18688, 0, 4, 0, 40, 0, 100, 0, 18, 1198160, 0, 0, 0, 80, 1868801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 18 of path 1198160 - Start timed actionlist 1868801'),
(18688, 0, 5, 0, 40, 0, 100, 0, 17, 1198240, 0, 0, 0, 80, 1868801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 17 of path 1198240 - Start timed actionlist 1868801'),
(18688, 0, 6, 0, 40, 0, 100, 0, 21, 1848880, 0, 0, 0, 80, 1868801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 21 of path 1848880 - Start timed actionlist 1868801'),
(18688, 0, 7, 0, 40, 0, 100, 0, 23, 1973600, 0, 0, 0, 80, 1868801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 23 of path 1973600 - Start timed actionlist 1868801'),
(18688, 0, 8, 0, 40, 0, 100, 0, 15, 1980880, 0, 0, 0, 80, 1868801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 15 of path 1980880 - Start timed actionlist 1868801'),
(18688, 0, 9, 0, 40, 0, 100, 0, 14, 1983520, 0, 0, 0, 80, 1868801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 14 of path 1983520 - Start timed actionlist 1868801'),
(18688, 0, 10, 0, 40, 0, 100, 0, 9, 2008000, 0, 0, 0, 80, 1868801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 9 of path 2008000 - Start timed actionlist 1868801'),
(18688, 0, 11, 0, 40, 0, 100, 0, 18, 2124720, 0, 0, 0, 80, 1868801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 18 of path 2124720 - Start timed actionlist 1868801'),
(18688, 0, 12, 0, 40, 0, 100, 0, 6, 2125120, 0, 0, 0, 80, 1868801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 2125120 - Start timed actionlist 1868801'),
(18688, 0, 13, 0, 40, 0, 100, 0, 7, 2544560, 0, 0, 0, 80, 1868801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 2544560 - Start timed actionlist 1868801'),
(18688, 0, 14, 0, 40, 0, 100, 0, 12, 2546640, 0, 0, 0, 80, 1868801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 12 of path 2546640 - Start timed actionlist 1868801'),
(18688, 0, 15, 0, 40, 0, 100, 0, 17, 2565760, 0, 0, 0, 80, 1868801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 17 of path 2565760 - Start timed actionlist 1868801'),
(18688, 0, 16, 0, 40, 0, 100, 0, 23, 3238000, 0, 0, 0, 80, 1868801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 23 of path 3238000 - Start timed actionlist 1868801'),
(18688, 0, 17, 0, 40, 0, 100, 0, 27, 3238080, 0, 0, 0, 80, 1868801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 27 of path 3238080 - Start timed actionlist 1868801'),
(18688, 0, 18, 0, 40, 0, 100, 0, 23, 3616320, 0, 0, 0, 80, 1868801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 23 of path 3616320 - Start timed actionlist 1868801');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=1147120 AND `point` IN (12);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=1147200 AND `point` IN (13);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=1147360 AND `point` IN (12);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=1198160 AND `point` IN (18);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=1198240 AND `point` IN (17);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=1848880 AND `point` IN (21);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=1973600 AND `point` IN (23);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=1980880 AND `point` IN (15);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=1983520 AND `point` IN (14);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=2008000 AND `point` IN (9);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=2124720 AND `point` IN (18);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=2125120 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=2544560 AND `point` IN (7);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=2546640 AND `point` IN (12);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=2565760 AND `point` IN (17);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=3238000 AND `point` IN (23);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=3238080 AND `point` IN (27);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=3616320 AND `point` IN (23);

-- Entry 18947 (Solanin)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=18947 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=1894700 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1894700, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Talk (BroadcastText 16099)'),
(1894700, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 5, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Play emote 6'),
(1894700, 9, 2, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 6s - Talk (BroadcastText 16100)'),
(1894700, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Play emote 1');
DELETE FROM `smart_scripts` WHERE `entryorguid`=18947 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (5440720);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(18947, 0, 0, 0, 40, 0, 100, 0, 1, 5440720, 0, 0, 0, 5, 16, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 5440720 - Play emote 16'),
(18947, 0, 1, 0, 40, 0, 100, 0, 2, 5440720, 0, 0, 0, 5, 16, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 5440720 - Play emote 16'),
(18947, 0, 2, 0, 40, 0, 100, 0, 6, 5440720, 0, 0, 0, 80, 1894700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 5440720 - Start timed actionlist 1894700');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5440720 AND `point` IN (1,2,6);

-- Entry 18999 (Allerian Defender)
DELETE FROM `smart_scripts` WHERE `entryorguid`=1899901 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1899901, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 2.80998, 'After 1s - Set orientation 2.80998');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1899902 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1899902, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 6.02139, 'After 1s - Set orientation 6.02139');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1899903 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1899903, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 6.16101, 'After 1s - Set orientation 6.16101');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1899904 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1899904, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 6.00393, 'After 1s - Set orientation 6.00393');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1899905 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1899905, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 4.72984, 'After 1s - Set orientation 4.72984');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1899906 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1899906, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 6.0912, 'After 1s - Set orientation 6.0912');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1899907 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1899907, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 1.81514, 'After 1s - Set orientation 1.81514');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1899908 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1899908, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 3.56047, 'After 1s - Set orientation 3.56047');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1899909 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1899909, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 2.37365, 'After 1s - Set orientation 2.37365');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1899910 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1899910, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 2.16421, 'After 1s - Set orientation 2.16421');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1899911 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1899911, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0.349066, 'After 1s - Set orientation 0.349066');
DELETE FROM `smart_scripts` WHERE `entryorguid`=18999 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (5463200,5463360,5463680);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(18999, 0, 1, 0, 40, 0, 100, 0, 2, 5463200, 0, 0, 0, 80, 1899901, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 5463200 - Start timed actionlist 1899901'),
(18999, 0, 2, 0, 40, 0, 100, 0, 5, 5463200, 0, 0, 0, 80, 1899902, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 5463200 - Start timed actionlist 1899902'),
(18999, 0, 3, 0, 40, 0, 100, 0, 7, 5463200, 0, 0, 0, 80, 1899903, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 5463200 - Start timed actionlist 1899903'),
(18999, 0, 4, 0, 40, 0, 100, 0, 9, 5463200, 0, 0, 0, 80, 1899904, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 9 of path 5463200 - Start timed actionlist 1899904'),
(18999, 0, 5, 0, 40, 0, 100, 0, 2, 5463360, 0, 0, 0, 80, 1899905, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 5463360 - Start timed actionlist 1899905'),
(18999, 0, 6, 0, 40, 0, 100, 0, 5, 5463360, 0, 0, 0, 80, 1899906, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 5463360 - Start timed actionlist 1899906'),
(18999, 0, 7, 0, 40, 0, 100, 0, 8, 5463360, 0, 0, 0, 80, 1899907, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 5463360 - Start timed actionlist 1899907'),
(18999, 0, 8, 0, 40, 0, 100, 0, 11, 5463360, 0, 0, 0, 80, 1899908, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 11 of path 5463360 - Start timed actionlist 1899908'),
(18999, 0, 9, 0, 40, 0, 100, 0, 5, 5463680, 0, 0, 0, 80, 1899909, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 5463680 - Start timed actionlist 1899909'),
(18999, 0, 10, 0, 40, 0, 100, 0, 11, 5463680, 0, 0, 0, 80, 1899910, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 11 of path 5463680 - Start timed actionlist 1899910'),
(18999, 0, 11, 0, 40, 0, 100, 0, 15, 5463680, 0, 0, 0, 80, 1899911, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 15 of path 5463680 - Start timed actionlist 1899911'),
(18999, 0, 12, 0, 40, 0, 100, 0, 19, 5463680, 0, 0, 0, 80, 1899910, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 19 of path 5463680 - Start timed actionlist 1899910');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5463200 AND `point` IN (2,5,7,9);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5463360 AND `point` IN (2,5,8,11);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5463680 AND `point` IN (5,11,15,19);

-- Entry 19003 (Allerian Horseman)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=19003 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=1900300 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1900300, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0.191986, 'After 1s - Set orientation 0.191986');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1900301 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1900301, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 2.32129, 'After 1s - Set orientation 2.32129');
DELETE FROM `smart_scripts` WHERE `entryorguid`=19003 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (5464640,5464720);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(19003, 0, 0, 0, 40, 0, 100, 0, 2, 5464640, 0, 0, 0, 80, 1900300, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 5464640 - Start timed actionlist 1900300'),
(19003, 0, 1, 0, 40, 0, 100, 0, 10, 5464720, 0, 0, 0, 80, 1900301, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 10 of path 5464720 - Start timed actionlist 1900301');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5464640 AND `point` IN (2);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5464720 AND `point` IN (10);

-- Entry 19201 (Mountain Gronn)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=19201 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=1920100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1920100, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 89, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Move random (distance 8)'),
(1920100, 9, 1, 0, 0, 0, 100, 0, 59000, 59000, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 59s - Force despawn (timer 1000)');
DELETE FROM `smart_scripts` WHERE `entryorguid`=19201 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (5498640,5498720);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(19201, 0, 0, 0, 40, 0, 100, 0, 18, 5498640, 0, 0, 0, 80, 1920100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 18 of path 5498640 - Start timed actionlist 1920100'),
(19201, 0, 1, 0, 40, 0, 100, 0, 21, 5498720, 0, 0, 0, 80, 1920100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 21 of path 5498720 - Start timed actionlist 1920100');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5498640 AND `point` IN (18);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5498720 AND `point` IN (21);

-- Entry 19312 (Drillmaster Zurok)
DELETE FROM `smart_scripts` WHERE `entryorguid`=19312 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (5511840);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(19312, 0, 2, 0, 40, 0, 100, 0, 2, 5511840, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 5511840 - Play emote 1'),
(19312, 0, 3, 0, 40, 0, 100, 0, 4, 5511840, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 5511840 - Play emote 1');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5511840 AND `point` IN (2,4);

-- Entry 19475 (Harbinger Haronem)
DELETE FROM `smart_scripts` WHERE `entryorguid`=19475 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (7727360);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(19475, 0, 2, 0, 40, 0, 100, 0, 8, 7727360, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 7727360 - Talk (BroadcastText 25086)');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7727360 AND `point` IN (8);

-- Entry 19568 (Unending Voidwraith)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=19568 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=19568 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (5598240,5598400,5598560,5598960,5599040,5599120,5599280,5599440,5599520,5599840,5599920);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(19568, 0, 0, 0, 40, 0, 100, 0, 6, 5598240, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 3990.15, 1735.37, 270.177, 0, 'On WP 6 of path 5598240 - Teleport to (3990.15,1735.37,270.177,0) map 530'),
(19568, 0, 1, 0, 40, 0, 100, 0, 3, 5598400, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 4001.01, 1683.55, 137.226, 0, 'On WP 3 of path 5598400 - Teleport to (4001.01,1683.55,137.226,0) map 530'),
(19568, 0, 2, 0, 40, 0, 100, 0, 5, 5598560, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 3696.55, 1954.49, 134.377, 0, 'On WP 5 of path 5598560 - Teleport to (3696.55,1954.49,134.377,0) map 530'),
(19568, 0, 3, 0, 40, 0, 100, 0, 4, 5598960, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 3915.08, 2111.54, 274.422, 0, 'On WP 4 of path 5598960 - Teleport to (3915.08,2111.54,274.422,0) map 530'),
(19568, 0, 4, 0, 40, 0, 100, 0, 2, 5599040, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 3887.31, 2258.43, 214.298, 0, 'On WP 2 of path 5599040 - Teleport to (3887.31,2258.43,214.298,0) map 530'),
(19568, 0, 5, 0, 40, 0, 100, 0, 3, 5599120, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 3726.48, 1961.26, 249.912, 0, 'On WP 3 of path 5599120 - Teleport to (3726.48,1961.26,249.912,0) map 530'),
(19568, 0, 6, 0, 40, 0, 100, 0, 3, 5599280, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 4044.87, 2025.38, 267.544, 0, 'On WP 3 of path 5599280 - Teleport to (4044.87,2025.38,267.544,0) map 530'),
(19568, 0, 7, 0, 40, 0, 100, 0, 3, 5599440, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 4148.98, 2042.91, 164.712, 0, 'On WP 3 of path 5599440 - Teleport to (4148.98,2042.91,164.712,0) map 530'),
(19568, 0, 8, 0, 40, 0, 100, 0, 4, 5599520, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 3827.96, 1979.83, 275.021, 0, 'On WP 4 of path 5599520 - Teleport to (3827.96,1979.83,275.021,0) map 530'),
(19568, 0, 9, 0, 40, 0, 100, 0, 3, 5599840, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 4151.25, 2042.39, 245.592, 0, 'On WP 3 of path 5599840 - Teleport to (4151.25,2042.39,245.592,0) map 530'),
(19568, 0, 10, 0, 40, 0, 100, 0, 7, 5599920, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 3957.74, 1894.36, 269.926, 0, 'On WP 7 of path 5599920 - Teleport to (3957.74,1894.36,269.926,0) map 530');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5598240 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5598400 AND `point` IN (3);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5598560 AND `point` IN (5);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5598960 AND `point` IN (4);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5599040 AND `point` IN (2);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5599120 AND `point` IN (3);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5599280 AND `point` IN (3);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5599440 AND `point` IN (3);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5599520 AND `point` IN (4);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5599840 AND `point` IN (3);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5599920 AND `point` IN (7);

-- Entry 19610 (Irradiated Worker)
DELETE FROM `creature_text` WHERE `CreatureID`=19610 AND `BroadcastTextId` IN (17035);
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(19610, 9, 0, 'I have another reading from the nether.', 12, 0, 100, 0, 0, 0, 17035, 0, 'Irradiated Worker');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1961000 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1961000, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 1, 9, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Talk (BroadcastText 17035)'),
(1961000, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 17, 25, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Set emote state 25');
DELETE FROM `smart_scripts` WHERE `entryorguid`=19610 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (5602560);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(19610, 0, 0, 0, 40, 0, 100, 0, 5, 5602560, 0, 0, 0, 80, 1961000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 5602560 - Start timed actionlist 1961000'),
(19610, 0, 1, 0, 40, 0, 100, 0, 12, 5602560, 0, 0, 0, 17, 233, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 12 of path 5602560 - Set emote state 233');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5602560 AND `point` IN (5,12);

-- Entry 19612 (Irradiated Manager)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=19612 AND `AIName`='';
DELETE FROM `creature_text` WHERE `CreatureID`=19612 AND `BroadcastTextId` IN (17045,17056);
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(19612, 0, 0, 'Well hand it over and let''s see what you''ve got!', 12, 0, 100, 0, 0, 0, 17045, 0, 'Irradiated Manager'),
(19612, 1, 0, 'Great Gazlowe!', 12, 0, 100, 0, 0, 0, 17056, 0, 'Irradiated Manager');
DELETE FROM `smart_scripts` WHERE `entryorguid`=1961200 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1961200, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Talk (BroadcastText 17045)'),
(1961200, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 17, 25, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Set emote state 25');
DELETE FROM `smart_scripts` WHERE `entryorguid`=19612 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (5602960);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(19612, 0, 0, 0, 40, 0, 100, 0, 2, 5602960, 0, 0, 0, 80, 1961200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 5602960 - Start timed actionlist 1961200'),
(19612, 0, 1, 0, 40, 0, 100, 0, 3, 5602960, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 5602960 - Talk (BroadcastText 17056)');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5602960 AND `point` IN (2,3);

-- Entry 19882 (Jero'me)
DELETE FROM `creature_text` WHERE `CreatureID`=19882 AND `BroadcastTextId` IN (17485,17486);
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(19882, 0, 0, 'Hey, you there.  Want some candy?', 12, 1, 100, 0, 0, 0, 17486, 0, 'Jero''me'),
(19882, 1, 0, 'Bip!', 12, 1, 100, 0, 0, 0, 17485, 0, 'Jero''me');
DELETE FROM `smart_scripts` WHERE `entryorguid`=19882 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (5682240);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(19882, 0, 1, 0, 40, 0, 100, 0, 1, 5682240, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 5682240 - Talk (BroadcastText 17486)'),
(19882, 0, 2, 0, 40, 0, 100, 0, 3, 5682240, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 5682240 - Talk (BroadcastText 17485)'),
(19882, 0, 3, 0, 40, 0, 100, 0, 5, 5682240, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 5682240 - Talk (BroadcastText 17485)'),
(19882, 0, 4, 0, 40, 0, 100, 0, 8, 5682240, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 5682240 - Talk (BroadcastText 17485)');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5682240 AND `point` IN (1,3,5,8);

-- Entry 19995 (Bladespire Brute)
DELETE FROM `smart_scripts` WHERE `entryorguid`=19995 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (5712400);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(19995, 0, 7, 0, 40, 0, 100, 0, 14, 5712400, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 14 of path 5712400 - Play emote 1');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5712400 AND `point` IN (14);

-- Entry 20512 (Tormented Soul)
DELETE FROM `smart_scripts` WHERE `entryorguid`=2051200 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2051200, 9, 0, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 0, 17, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 3s - Set emote state 69'),
(2051200, 9, 1, 0, 0, 0, 100, 0, 14000, 14000, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 14s - Play emote 0');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2051201 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2051201, 9, 0, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 0, 17, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 3s - Set emote state 69'),
(2051201, 9, 1, 0, 0, 0, 100, 0, 54000, 54000, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 54s - Play emote 0');
DELETE FROM `smart_scripts` WHERE `entryorguid`=20512 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (5809200,5809280,5809760,5810240,5810720,5810800);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(20512, 0, 3, 0, 40, 0, 100, 0, 7, 5809200, 0, 0, 0, 80, 2051200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 5809200 - Start timed actionlist 2051200'),
(20512, 0, 4, 0, 40, 0, 100, 0, 13, 5809200, 0, 0, 0, 80, 2051200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 5809200 - Start timed actionlist 2051200'),
(20512, 0, 5, 0, 40, 0, 100, 0, 5, 5809280, 0, 0, 0, 5, 274, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 5809280 - Play emote 274'),
(20512, 0, 6, 0, 40, 0, 100, 0, 8, 5809280, 0, 0, 0, 5, 274, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 5809280 - Play emote 274'),
(20512, 0, 7, 0, 40, 0, 100, 0, 19, 5809280, 0, 0, 0, 5, 274, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 19 of path 5809280 - Play emote 274'),
(20512, 0, 8, 0, 40, 0, 100, 0, 3, 5809760, 0, 0, 0, 80, 2051201, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 5809760 - Start timed actionlist 2051201'),
(20512, 0, 9, 0, 40, 0, 100, 0, 7, 5809760, 0, 0, 0, 80, 2051201, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 5809760 - Start timed actionlist 2051201'),
(20512, 0, 10, 0, 40, 0, 100, 0, 4, 5810240, 0, 0, 0, 5, 274, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 5810240 - Play emote 274'),
(20512, 0, 11, 0, 40, 0, 100, 0, 15, 5810240, 0, 0, 0, 5, 274, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 15 of path 5810240 - Play emote 274'),
(20512, 0, 12, 0, 40, 0, 100, 0, 21, 5810240, 0, 0, 0, 5, 274, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 21 of path 5810240 - Play emote 274'),
(20512, 0, 13, 0, 40, 0, 100, 0, 8, 5810720, 0, 0, 0, 80, 2051201, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 5810720 - Start timed actionlist 2051201'),
(20512, 0, 14, 0, 40, 0, 100, 0, 15, 5810720, 0, 0, 0, 80, 2051200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 15 of path 5810720 - Start timed actionlist 2051200'),
(20512, 0, 15, 0, 40, 0, 100, 0, 19, 5810720, 0, 0, 0, 80, 2051200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 19 of path 5810720 - Start timed actionlist 2051200'),
(20512, 0, 16, 0, 40, 0, 100, 0, 4, 5810800, 0, 0, 0, 80, 2051201, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 5810800 - Start timed actionlist 2051201'),
(20512, 0, 17, 0, 40, 0, 100, 0, 13, 5810800, 0, 0, 0, 80, 2051201, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 5810800 - Start timed actionlist 2051201'),
(20512, 0, 18, 0, 40, 0, 100, 0, 28, 5810800, 0, 0, 0, 80, 2051201, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 28 of path 5810800 - Start timed actionlist 2051201');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5809200 AND `point` IN (7,13);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5809280 AND `point` IN (5,8,19);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5809760 AND `point` IN (3,7);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5810240 AND `point` IN (4,15,21);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5810720 AND `point` IN (8,15,19);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5810800 AND `point` IN (4,13,28);

-- Entry 21065 (Tormented Citizen)
DELETE FROM `smart_scripts` WHERE `entryorguid`=2106500 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2106500, 9, 0, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 0, 17, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 2s - Set emote state 69'),
(2106500, 9, 1, 0, 0, 0, 100, 0, 26000, 26000, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 26s - Play emote 0');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2106501 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2106501, 9, 0, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 0, 17, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 2s - Set emote state 69'),
(2106501, 9, 1, 0, 0, 0, 100, 0, 11000, 11000, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 11s - Play emote 0');
DELETE FROM `smart_scripts` WHERE `entryorguid`=21065 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (5923360,5923760);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(21065, 0, 5, 0, 40, 0, 100, 0, 4, 5923360, 0, 0, 0, 80, 2106500, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 5923360 - Start timed actionlist 2106500'),
(21065, 0, 6, 0, 40, 0, 100, 0, 18, 5923360, 0, 0, 0, 80, 2106500, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 18 of path 5923360 - Start timed actionlist 2106500'),
(21065, 0, 7, 0, 40, 0, 100, 0, 24, 5923360, 0, 0, 0, 80, 2106501, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 24 of path 5923360 - Start timed actionlist 2106501'),
(21065, 0, 8, 0, 40, 0, 100, 0, 8, 5923760, 0, 0, 0, 80, 2106501, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 5923760 - Start timed actionlist 2106501'),
(21065, 0, 9, 0, 40, 0, 100, 0, 14, 5923760, 0, 0, 0, 80, 2106501, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 14 of path 5923760 - Start timed actionlist 2106501'),
(21065, 0, 10, 0, 40, 0, 100, 0, 21, 5923760, 0, 0, 0, 80, 2106501, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 21 of path 5923760 - Start timed actionlist 2106501');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5923360 AND `point` IN (4,18,24);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5923760 AND `point` IN (8,14,21);

-- Entry 21151 (Borgrim Stouthammer)
DELETE FROM `creature_text` WHERE `CreatureID`=21151 AND `BroadcastTextId` IN (18816);
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(21151, 1, 0, 'Right.  We just busted our tails to haul all of this stuff up here, and you want to work more?', 12, 7, 100, 0, 0, 0, 18816, 0, 'Borgrim Stouthammer');
DELETE FROM `smart_scripts` WHERE `entryorguid`=21151 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (5937200);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(21151, 0, 1, 0, 40, 0, 100, 0, 5, 5937200, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 5937200 - Talk (BroadcastText 18816)');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5937200 AND `point` IN (5);

-- Entry 21403 (Invis Legion Hold Caster)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=21403 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=21403 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (5990240,5990320,5990400,5990480);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(21403, 0, 0, 0, 40, 0, 100, 0, 1, 5990240, 0, 0, 0, 11, 36804, 0, 0, 0, 0, 0, 19, 21404, 30, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 5990240 - Cast spell 36804 on closest creature 21404'),
(21403, 0, 1, 0, 40, 0, 100, 0, 1, 5990320, 0, 0, 0, 11, 36804, 0, 0, 0, 0, 0, 19, 21404, 30, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 5990320 - Cast spell 36804 on closest creature 21404'),
(21403, 0, 2, 0, 40, 0, 100, 0, 1, 5990400, 0, 0, 0, 11, 36804, 0, 0, 0, 0, 0, 19, 21404, 30, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 5990400 - Cast spell 36804 on closest creature 21404'),
(21403, 0, 3, 0, 40, 0, 100, 0, 1, 5990480, 0, 0, 0, 11, 36804, 0, 0, 0, 0, 0, 19, 21404, 30, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 5990480 - Cast spell 36804 on closest creature 21404');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5990240 AND `point` IN (1);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5990320 AND `point` IN (1);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5990400 AND `point` IN (1);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5990480 AND `point` IN (1);

-- Entry 21500 (Morgroron)
DELETE FROM `smart_scripts` WHERE `entryorguid`=2150000 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2150000, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Play emote 1');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2150001 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2150001, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 2.79253, 'After 1s - Set orientation 2.79253'),
(2150001, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Play emote 1'),
(2150001, 9, 2, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 0, 5, 15, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 5s - Play emote 15');
DELETE FROM `smart_scripts` WHERE `entryorguid`=21500 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (6032560);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(21500, 0, 3, 0, 40, 0, 100, 0, 3, 6032560, 0, 0, 0, 80, 2150000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 6032560 - Start timed actionlist 2150000'),
(21500, 0, 4, 0, 40, 0, 100, 0, 6, 6032560, 0, 0, 0, 80, 2150000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 6032560 - Start timed actionlist 2150000'),
(21500, 0, 5, 0, 40, 0, 100, 0, 9, 6032560, 0, 0, 0, 80, 2150000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 9 of path 6032560 - Start timed actionlist 2150000'),
(21500, 0, 6, 0, 40, 0, 100, 0, 10, 6032560, 0, 0, 0, 80, 2150001, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 10 of path 6032560 - Start timed actionlist 2150001');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=6032560 AND `point` IN (3,6,9,10);

-- Entry 21501 (Makazradon)
DELETE FROM `smart_scripts` WHERE `entryorguid`=21501 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (6759280);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(21501, 0, 3, 0, 40, 0, 100, 0, 3, 6759280, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 6759280 - Play emote 1'),
(21501, 0, 4, 0, 40, 0, 100, 0, 6, 6759280, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 6759280 - Play emote 1'),
(21501, 0, 5, 0, 40, 0, 100, 0, 10, 6759280, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 10 of path 6759280 - Play emote 1'),
(21501, 0, 6, 0, 40, 0, 100, 0, 13, 6759280, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 6759280 - Play emote 1'),
(21501, 0, 7, 0, 40, 0, 100, 0, 14, 6759280, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 14 of path 6759280 - Play emote 1'),
(21501, 0, 8, 0, 40, 0, 100, 0, 16, 6759280, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 16 of path 6759280 - Play emote 1'),
(21501, 0, 9, 0, 40, 0, 100, 0, 19, 6759280, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 19 of path 6759280 - Play emote 1'),
(21501, 0, 10, 0, 40, 0, 100, 0, 22, 6759280, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 22 of path 6759280 - Play emote 1'),
(21501, 0, 11, 0, 40, 0, 100, 0, 28, 6759280, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 28 of path 6759280 - Play emote 1'),
(21501, 0, 12, 0, 40, 0, 100, 0, 31, 6759280, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 31 of path 6759280 - Play emote 1');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=6759280 AND `point` IN (3,6,10,13,14,16,19,22,28,31);

-- Entry 22396 (Draaca Longtail)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=22396 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=22396 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (6298480);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(22396, 0, 0, 0, 40, 0, 100, 0, 5, 6298480, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 6298480 - Play emote 1');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=6298480 AND `point` IN (5);

-- Entry 23550 (Valgarde Yeoman)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=23550 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=2355000 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2355000, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 3, 0, 21614, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Morph to model 21614');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2355001 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2355001, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 3, 0, 21612, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Morph to model 21612');
DELETE FROM `smart_scripts` WHERE `entryorguid`=23550 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (7052160,7052240,16185360);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(23550, 0, 0, 0, 40, 0, 100, 0, 3, 7052160, 0, 0, 0, 80, 2355000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 7052160 - Start timed actionlist 2355000'),
(23550, 0, 1, 0, 40, 0, 100, 0, 8, 7052160, 0, 0, 0, 80, 2355001, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 7052160 - Start timed actionlist 2355001'),
(23550, 0, 2, 0, 40, 0, 100, 0, 8, 7052240, 0, 0, 0, 80, 2355001, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 7052240 - Start timed actionlist 2355001'),
(23550, 0, 3, 0, 40, 0, 100, 0, 13, 7052240, 0, 0, 0, 80, 2355000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 7052240 - Start timed actionlist 2355000'),
(23550, 0, 4, 0, 40, 0, 100, 0, 2, 16185360, 0, 0, 0, 80, 2355001, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 16185360 - Start timed actionlist 2355001'),
(23550, 0, 5, 0, 40, 0, 100, 0, 5, 16185360, 0, 0, 0, 80, 2355000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 16185360 - Start timed actionlist 2355000');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7052160 AND `point` IN (3,8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7052240 AND `point` IN (8,13);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=16185360 AND `point` IN (2,5);

-- Entry 23552 (Valgarde Yeoman)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=23552 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=2355200 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2355200, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 3, 0, 21612, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Morph to model 21612');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2355201 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2355201, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 3, 0, 21614, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Morph to model 21614');
DELETE FROM `smart_scripts` WHERE `entryorguid`=23552 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (9633440);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(23552, 0, 0, 0, 40, 0, 100, 0, 4, 9633440, 0, 0, 0, 80, 2355200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 9633440 - Start timed actionlist 2355200'),
(23552, 0, 1, 0, 40, 0, 100, 0, 10, 9633440, 0, 0, 0, 80, 2355201, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 10 of path 9633440 - Start timed actionlist 2355201');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9633440 AND `point` IN (4,10);

-- Entry 23718 (Mack)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=23718 AND `AIName`='';
DELETE FROM `creature_text` WHERE `CreatureID`=23718 AND `BroadcastTextId` IN (22206,22211,22216);
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(23718, 0, 0, 'Ahh, my precious Ameenah! How wonderful to see you again.', 12, 0, 100, 0, 0, 0, 22216, 0, 'Mack'),
(23718, 1, 0, 'Yer wearin down, princess. I can sense it!', 12, 0, 100, 0, 0, 0, 22211, 0, 'Mack'),
(23718, 2, 0, 'Hmm, don''t mind if I do!', 12, 0, 100, 0, 0, 0, 22206, 0, 'Mack');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2371800 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2371800, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Talk (BroadcastText 22216)'),
(2371800, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 17, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Set emote state 1');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2371801 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2371801, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Talk (BroadcastText 22211)'),
(2371801, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 17, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Set emote state 1');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2371802 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2371802, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Talk (BroadcastText 22206)'),
(2371802, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 17, 68, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Set emote state 68');
DELETE FROM `smart_scripts` WHERE `entryorguid`=23718 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (7558720);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(23718, 0, 0, 0, 40, 0, 100, 0, 1, 7558720, 0, 0, 0, 80, 2371800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 7558720 - Start timed actionlist 2371800'),
(23718, 0, 1, 0, 40, 0, 100, 0, 2, 7558720, 0, 0, 0, 80, 2371801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 7558720 - Start timed actionlist 2371801'),
(23718, 0, 2, 0, 40, 0, 100, 0, 3, 7558720, 0, 0, 0, 80, 2371802, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 7558720 - Start timed actionlist 2371802'),
(23718, 0, 3, 0, 40, 0, 100, 0, 4, 7558720, 0, 0, 0, 17, 61, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 7558720 - Set emote state 61');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7558720 AND `point` IN (1,2,3,4);

-- Entry 23844 (Westguard Officer)
DELETE FROM `smart_scripts` WHERE `entryorguid`=23844 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (7936640);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(23844, 0, 6, 0, 40, 0, 100, 0, 12, 7936640, 0, 0, 0, 5, 66, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 12 of path 7936640 - Play emote 66');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7936640 AND `point` IN (12);

-- Entry 24019 (Glacion)
DELETE FROM `smart_scripts` WHERE `entryorguid`=24019 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (9270320);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(24019, 0, 2, 0, 40, 0, 40, 0, 5, 9270320, 0, 0, 0, 4, 7274, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 9270320 - Play sound 7274'),
(24019, 0, 3, 0, 40, 0, 40, 0, 12, 9270320, 0, 0, 0, 4, 7274, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 12 of path 9270320 - Play sound 7274'),
(24019, 0, 4, 0, 40, 0, 40, 0, 19, 9270320, 0, 0, 0, 4, 7274, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 19 of path 9270320 - Play sound 7274'),
(24019, 0, 5, 0, 40, 0, 40, 0, 26, 9270320, 0, 0, 0, 4, 7274, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 26 of path 9270320 - Play sound 7274');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9270320 AND `point` IN (5,12,19,26);

-- Entry 24040 (McGoyver)
DELETE FROM `smart_scripts` WHERE `entryorguid`=2404000 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2404000, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 4.97788, 'After 1s - Set orientation 4.97788'),
(2404000, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 17, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Set emote state 69');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2404001 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2404001, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 5.70399, 'After 1s - Set orientation 5.70399'),
(2404001, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 17, 173, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Set emote state 173');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2404002 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2404002, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0.436332, 'After 1s - Set orientation 0.436332'),
(2404002, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 17, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Set emote state 69');
DELETE FROM `smart_scripts` WHERE `entryorguid`=24040 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (7051760);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(24040, 0, 5, 0, 40, 0, 100, 0, 2, 7051760, 0, 0, 0, 80, 2404000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 7051760 - Start timed actionlist 2404000'),
(24040, 0, 6, 0, 40, 0, 100, 0, 4, 7051760, 0, 0, 0, 80, 2404001, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 7051760 - Start timed actionlist 2404001'),
(24040, 0, 7, 0, 40, 0, 100, 0, 5, 7051760, 0, 0, 0, 80, 2404002, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 7051760 - Start timed actionlist 2404002');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7051760 AND `point` IN (2,4,5);

-- Entry 24250 (Dragonflayer Fleshripper)
DELETE FROM `smart_scripts` WHERE `entryorguid`=2425001 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2425001, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 17, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Set emote state 69');
DELETE FROM `smart_scripts` WHERE `entryorguid`=24250 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (7013520,7013600,7013680);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(24250, 0, 5, 0, 40, 0, 100, 0, 2, 7013520, 0, 0, 0, 80, 2425001, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 7013520 - Start timed actionlist 2425001'),
(24250, 0, 6, 0, 40, 0, 100, 0, 3, 7013520, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 7013520 - Set emote state 0'),
(24250, 0, 7, 0, 40, 0, 100, 0, 6, 7013520, 0, 0, 0, 80, 2425001, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 7013520 - Start timed actionlist 2425001'),
(24250, 0, 8, 0, 40, 0, 100, 0, 7, 7013520, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 7013520 - Set emote state 0'),
(24250, 0, 9, 0, 40, 0, 100, 0, 2, 7013600, 0, 0, 0, 80, 2425001, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 7013600 - Start timed actionlist 2425001'),
(24250, 0, 10, 0, 40, 0, 100, 0, 3, 7013600, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 7013600 - Set emote state 0'),
(24250, 0, 11, 0, 40, 0, 100, 0, 6, 7013600, 0, 0, 0, 80, 2425001, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 7013600 - Start timed actionlist 2425001'),
(24250, 0, 12, 0, 40, 0, 100, 0, 7, 7013600, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 7013600 - Set emote state 0'),
(24250, 0, 13, 0, 40, 0, 100, 0, 3, 7013680, 0, 0, 0, 80, 2425001, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 7013680 - Start timed actionlist 2425001'),
(24250, 0, 14, 0, 40, 0, 100, 0, 4, 7013680, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 7013680 - Set emote state 0'),
(24250, 0, 15, 0, 40, 0, 100, 0, 6, 7013680, 0, 0, 0, 80, 2425001, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 7013680 - Start timed actionlist 2425001'),
(24250, 0, 16, 0, 40, 0, 100, 0, 7, 7013680, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 7013680 - Set emote state 0'),
(24250, 0, 17, 0, 40, 0, 100, 0, 9, 7013680, 0, 0, 0, 80, 2425001, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 9 of path 7013680 - Start timed actionlist 2425001'),
(24250, 0, 18, 0, 40, 0, 100, 0, 10, 7013680, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 10 of path 7013680 - Set emote state 0');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7013520 AND `point` IN (2,3,6,7);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7013600 AND `point` IN (2,3,6,7);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7013680 AND `point` IN (3,4,6,7,9,10);

-- Entry 24400 (Steel Gate Archaeologist)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=24400 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=24400 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (8252880,8253600,8905200,8905520);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(24400, 0, 0, 0, 40, 0, 100, 0, 4, 8252880, 0, 0, 0, 5, 16, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 8252880 - Play emote 16'),
(24400, 0, 1, 0, 40, 0, 100, 0, 36, 8253600, 0, 0, 0, 5, 16, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 36 of path 8253600 - Play emote 16'),
(24400, 0, 2, 0, 40, 0, 100, 0, 4, 8905200, 0, 0, 0, 5, 16, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 8905200 - Play emote 16'),
(24400, 0, 3, 0, 40, 0, 100, 0, 10, 8905200, 0, 0, 0, 5, 25, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 10 of path 8905200 - Play emote 25'),
(24400, 0, 4, 0, 40, 0, 100, 0, 11, 8905200, 0, 0, 0, 5, 16, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 11 of path 8905200 - Play emote 16'),
(24400, 0, 5, 0, 40, 0, 100, 0, 3, 8905520, 0, 0, 0, 5, 16, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 8905520 - Play emote 16'),
(24400, 0, 6, 0, 40, 0, 100, 0, 4, 8905520, 0, 0, 0, 5, 16, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 8905520 - Play emote 16'),
(24400, 0, 7, 0, 40, 0, 100, 0, 14, 8905520, 0, 0, 0, 5, 16, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 14 of path 8905520 - Play emote 16');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8252880 AND `point` IN (4);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8253600 AND `point` IN (36);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8905200 AND `point` IN (4,10,11);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8905520 AND `point` IN (3,4,14);

-- Entry 24688 (Wretched Skulker)
DELETE FROM `creature_text` WHERE `CreatureID`=24688 AND `BroadcastTextId` IN (23842);
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(24688, 0, 0, 'I''ll never stop. Never...', 12, 0, 100, 0, 0, 0, 23842, 0, 'Wretched Skulker');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2468800 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2468800, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Talk (BroadcastText 23842)'),
(2468800, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 17, 398, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Set emote state 398');
DELETE FROM `smart_scripts` WHERE `entryorguid`=24688 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (7746000);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(24688, 0, 2, 0, 40, 0, 100, 0, 1, 7746000, 0, 0, 0, 17, 398, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 7746000 - Set emote state 398'),
(24688, 0, 3, 0, 40, 0, 100, 0, 2, 7746000, 0, 0, 0, 80, 2468800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 7746000 - Start timed actionlist 2468800');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7746000 AND `point` IN (1,2);

-- Entry 24812 (Storm Giant)
DELETE FROM `smart_scripts` WHERE `entryorguid`=2481200 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2481200, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 28, 44385, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Remove aura 44385 from self'),
(2481200, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 1.26624, 'After 0s - Set orientation 1.26624'),
(2481200, 9, 2, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 2.31755, 'After 17s - Set orientation 2.31755'),
(2481200, 9, 3, 0, 0, 0, 100, 0, 18000, 18000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 1.33832, 'After 18s - Set orientation 1.33832'),
(2481200, 9, 4, 0, 0, 0, 100, 0, 31000, 31000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 2.41372, 'After 31s - Set orientation 2.41372'),
(2481200, 9, 5, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 2.52903, 'After 17s - Set orientation 2.52903'),
(2481200, 9, 6, 0, 0, 0, 100, 0, 13000, 13000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 4.18812, 'After 13s - Set orientation 4.18812'),
(2481200, 9, 7, 0, 0, 0, 100, 0, 16000, 16000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 3.9892, 'After 16s - Set orientation 3.9892'),
(2481200, 9, 8, 0, 0, 0, 100, 0, 14000, 14000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 2.95678, 'After 14s - Set orientation 2.95678'),
(2481200, 9, 9, 0, 0, 0, 100, 0, 20000, 20000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0.742216, 'After 20s - Set orientation 0.742216');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2481201 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2481201, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 28, 44385, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Remove aura 44385 from self'),
(2481201, 9, 1, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 1.21163, 'After 17s - Set orientation 1.21163'),
(2481201, 9, 2, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 1.55871, 'After 17s - Set orientation 1.55871');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2481202 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2481202, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 28, 44385, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Remove aura 44385 from self'),
(2481202, 9, 1, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 1.13962, 'After 6s - Set orientation 1.13962');
DELETE FROM `smart_scripts` WHERE `entryorguid`=24812 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (9454160,9455280);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(24812, 0, 3, 0, 40, 0, 100, 0, 1, 9454160, 0, 0, 0, 11, 44385, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 9454160 - Cast spell 44385 on self'),
(24812, 0, 4, 0, 40, 0, 100, 0, 65, 9454160, 0, 0, 0, 80, 2481200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 65 of path 9454160 - Start timed actionlist 2481200'),
(24812, 0, 5, 0, 40, 0, 100, 0, 66, 9454160, 0, 0, 0, 11, 44385, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 66 of path 9454160 - Cast spell 44385 on self'),
(24812, 0, 6, 0, 40, 0, 100, 0, 140, 9454160, 0, 0, 0, 80, 2481201, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 140 of path 9454160 - Start timed actionlist 2481201'),
(24812, 0, 7, 0, 40, 0, 100, 0, 141, 9454160, 0, 0, 0, 11, 44385, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 141 of path 9454160 - Cast spell 44385 on self'),
(24812, 0, 8, 0, 40, 0, 100, 0, 155, 9454160, 0, 0, 0, 80, 2481202, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 155 of path 9454160 - Start timed actionlist 2481202'),
(24812, 0, 9, 0, 40, 0, 100, 0, 1, 9455280, 0, 0, 0, 80, 2481200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 9455280 - Start timed actionlist 2481200'),
(24812, 0, 10, 0, 40, 0, 100, 0, 2, 9455280, 0, 0, 0, 11, 44385, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 9455280 - Cast spell 44385 on self'),
(24812, 0, 11, 0, 40, 0, 100, 0, 17, 9455280, 0, 0, 0, 80, 2481200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 17 of path 9455280 - Start timed actionlist 2481200'),
(24812, 0, 12, 0, 40, 0, 100, 0, 18, 9455280, 0, 0, 0, 11, 44385, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 18 of path 9455280 - Cast spell 44385 on self'),
(24812, 0, 13, 0, 40, 0, 100, 0, 47, 9455280, 0, 0, 0, 80, 2481200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 47 of path 9455280 - Start timed actionlist 2481200'),
(24812, 0, 14, 0, 40, 0, 100, 0, 48, 9455280, 0, 0, 0, 11, 44385, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 48 of path 9455280 - Cast spell 44385 on self');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9454160 AND `point` IN (1,65,66,140,141,155);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9455280 AND `point` IN (1,2,17,18,47,48);

-- Entry 24938 (Shattered Sun Marksman)
DELETE FROM `smart_scripts` WHERE `entryorguid`=2493800 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2493800, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Force despawn (timer 1000)');
DELETE FROM `smart_scripts` WHERE `entryorguid`=24938 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (7732480,7732640);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(24938, 0, 2, 0, 40, 0, 100, 0, 8, 7732480, 0, 0, 0, 80, 2493800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 7732480 - Start timed actionlist 2493800'),
(24938, 0, 3, 0, 40, 0, 100, 0, 10, 7732640, 0, 0, 0, 80, 2493800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 10 of path 7732640 - Start timed actionlist 2493800');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7732480 AND `point` IN (8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7732640 AND `point` IN (10);

-- Entry 24976 (Dawnblade Blood Knight)
DELETE FROM `creature_text` WHERE `CreatureID`=24976 AND `BroadcastTextId` IN (24425);
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(24976, 0, 0, 'Charge!', 12, 0, 100, 0, 0, 0, 24425, 0, 'Dawnblade Blood Knight');
DELETE FROM `smart_scripts` WHERE `entryorguid`=24976 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (7544720,7546000);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(24976, 0, 4, 0, 40, 0, 100, 0, 1, 7544720, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 7544720 - Talk (BroadcastText 24425)'),
(24976, 0, 5, 0, 40, 0, 100, 0, 1, 7546000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 7546000 - Talk (BroadcastText 24425)');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7544720 AND `point` IN (1);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7546000 AND `point` IN (1);

-- Entry 25115 (Shattered Sun Warrior)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=25115 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=2511500 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2511500, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Force despawn (timer 1000)');
DELETE FROM `smart_scripts` WHERE `entryorguid`=25115 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (7727440,7732560);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(25115, 0, 0, 0, 40, 0, 100, 0, 7, 7727440, 0, 0, 0, 80, 2511500, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 7727440 - Start timed actionlist 2511500'),
(25115, 0, 1, 0, 40, 0, 100, 0, 10, 7732560, 0, 0, 0, 80, 2511500, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 10 of path 7732560 - Start timed actionlist 2511500');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7727440 AND `point` IN (7);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7732560 AND `point` IN (10);

-- Entry 25235 (Hilda Stoneforge)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=25235 AND `AIName`='';
DELETE FROM `creature_text` WHERE `CreatureID`=25235 AND `BroadcastTextId` IN (24439,24443);
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(25235, 0, 0, 'We''re running low on iron, lads!  I don''t want to see a single bar go to waste, ye hear me now?', 12, 0, 100, 0, 0, 0, 24439, 0, 'Hilda Stoneforge'),
(25235, 1, 0, 'Not bad.  Try that trick I told you about when you temper the steel.', 12, 7, 100, 0, 0, 0, 24443, 0, 'Hilda Stoneforge');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2523500 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2523500, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 17, 16, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Set emote state 16'),
(2523500, 9, 1, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 0, 17, 26, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 5s - Set emote state 26'),
(2523500, 9, 2, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 4.67122, 'After 1s - Set orientation 4.67122'),
(2523500, 9, 3, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 0, 5, 22, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 4s - Play emote 22'),
(2523500, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Talk (BroadcastText 24439)');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2523501 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2523501, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Talk (BroadcastText 24443)');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2523502 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2523502, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 17, 233, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Set emote state 233');
DELETE FROM `smart_scripts` WHERE `entryorguid`=25235 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (8779120);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(25235, 0, 0, 0, 40, 0, 100, 0, 2, 8779120, 0, 0, 0, 80, 2523500, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 8779120 - Start timed actionlist 2523500'),
(25235, 0, 1, 0, 40, 0, 100, 0, 4, 8779120, 0, 0, 0, 80, 2523501, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 8779120 - Start timed actionlist 2523501'),
(25235, 0, 2, 0, 40, 0, 100, 0, 7, 8779120, 0, 0, 0, 80, 2523501, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 8779120 - Start timed actionlist 2523501'),
(25235, 0, 3, 0, 40, 0, 100, 0, 10, 8779120, 0, 0, 0, 80, 2523502, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 10 of path 8779120 - Start timed actionlist 2523502');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8779120 AND `point` IN (2,4,7,10);

-- Entry 25271 (Valiance Keep Worker)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=25271 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=25271 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (9059680,9060080,9060160);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(25271, 0, 0, 0, 40, 0, 100, 0, 3, 9059680, 0, 0, 0, 5, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 9059680 - Play emote 69'),
(25271, 0, 1, 0, 40, 0, 100, 0, 7, 9059680, 0, 0, 0, 5, 381, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 9059680 - Play emote 381'),
(25271, 0, 2, 0, 40, 0, 100, 0, 13, 9059680, 0, 0, 0, 5, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 9059680 - Play emote 69'),
(25271, 0, 3, 0, 40, 0, 100, 0, 11, 9060080, 0, 0, 0, 5, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 11 of path 9060080 - Play emote 69'),
(25271, 0, 4, 0, 40, 0, 100, 0, 22, 9060080, 0, 0, 0, 5, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 22 of path 9060080 - Play emote 69'),
(25271, 0, 5, 0, 40, 0, 100, 0, 13, 9060160, 0, 0, 0, 5, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 9060160 - Play emote 69'),
(25271, 0, 6, 0, 40, 0, 100, 0, 26, 9060160, 0, 0, 0, 5, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 26 of path 9060160 - Play emote 69');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9059680 AND `point` IN (3,7,13);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9060080 AND `point` IN (11,22);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9060160 AND `point` IN (13,26);

-- Entry 25349 (Scourge Plague Spreader)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=25349 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=2534900 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2534900, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 11, 45612, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Cast spell 45612 on self'),
(2534900, 9, 1, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 0, 11, 45609, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 2s - Cast spell 45609 on self');
DELETE FROM `smart_scripts` WHERE `entryorguid`=25349 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (7770320,7770400,7770960);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(25349, 0, 0, 0, 40, 0, 100, 0, 1, 7770320, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 7770320 - Start timed actionlist 2534900'),
(25349, 0, 1, 0, 40, 0, 100, 0, 2, 7770320, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 7770320 - Start timed actionlist 2534900'),
(25349, 0, 2, 0, 40, 0, 100, 0, 3, 7770320, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 7770320 - Start timed actionlist 2534900'),
(25349, 0, 3, 0, 40, 0, 100, 0, 4, 7770320, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 7770320 - Start timed actionlist 2534900'),
(25349, 0, 4, 0, 40, 0, 100, 0, 5, 7770320, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 7770320 - Start timed actionlist 2534900'),
(25349, 0, 5, 0, 40, 0, 100, 0, 6, 7770320, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 7770320 - Start timed actionlist 2534900'),
(25349, 0, 6, 0, 40, 0, 100, 0, 7, 7770320, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 7770320 - Start timed actionlist 2534900'),
(25349, 0, 7, 0, 40, 0, 100, 0, 8, 7770320, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 7770320 - Start timed actionlist 2534900'),
(25349, 0, 8, 0, 40, 0, 100, 0, 9, 7770320, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 9 of path 7770320 - Start timed actionlist 2534900'),
(25349, 0, 9, 0, 40, 0, 100, 0, 10, 7770320, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 10 of path 7770320 - Start timed actionlist 2534900'),
(25349, 0, 10, 0, 40, 0, 100, 0, 11, 7770320, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 11 of path 7770320 - Start timed actionlist 2534900'),
(25349, 0, 11, 0, 40, 0, 100, 0, 12, 7770320, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 12 of path 7770320 - Start timed actionlist 2534900'),
(25349, 0, 12, 0, 40, 0, 100, 0, 13, 7770320, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 7770320 - Start timed actionlist 2534900'),
(25349, 0, 13, 0, 40, 0, 100, 0, 1, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 14, 0, 40, 0, 100, 0, 2, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 15, 0, 40, 0, 100, 0, 3, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 16, 0, 40, 0, 100, 0, 4, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 17, 0, 40, 0, 100, 0, 5, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 18, 0, 40, 0, 100, 0, 6, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 19, 0, 40, 0, 100, 0, 7, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 20, 0, 40, 0, 100, 0, 8, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 21, 0, 40, 0, 100, 0, 9, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 9 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 22, 0, 40, 0, 100, 0, 10, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 10 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 23, 0, 40, 0, 100, 0, 11, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 11 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 24, 0, 40, 0, 100, 0, 12, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 12 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 25, 0, 40, 0, 100, 0, 13, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 26, 0, 40, 0, 100, 0, 14, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 14 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 27, 0, 40, 0, 100, 0, 15, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 15 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 28, 0, 40, 0, 100, 0, 16, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 16 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 29, 0, 40, 0, 100, 0, 17, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 17 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 30, 0, 40, 0, 100, 0, 18, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 18 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 31, 0, 40, 0, 100, 0, 19, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 19 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 32, 0, 40, 0, 100, 0, 20, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 20 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 33, 0, 40, 0, 100, 0, 21, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 21 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 34, 0, 40, 0, 100, 0, 22, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 22 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 35, 0, 40, 0, 100, 0, 23, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 23 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 36, 0, 40, 0, 100, 0, 24, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 24 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 37, 0, 40, 0, 100, 0, 25, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 25 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 38, 0, 40, 0, 100, 0, 26, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 26 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 39, 0, 40, 0, 100, 0, 27, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 27 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 40, 0, 40, 0, 100, 0, 28, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 28 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 41, 0, 40, 0, 100, 0, 29, 7770400, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 29 of path 7770400 - Start timed actionlist 2534900'),
(25349, 0, 42, 0, 40, 0, 100, 0, 1, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 43, 0, 40, 0, 100, 0, 2, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 44, 0, 40, 0, 100, 0, 3, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 45, 0, 40, 0, 100, 0, 4, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 46, 0, 40, 0, 100, 0, 5, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 47, 0, 40, 0, 100, 0, 6, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 48, 0, 40, 0, 100, 0, 7, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 49, 0, 40, 0, 100, 0, 8, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 50, 0, 40, 0, 100, 0, 9, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 9 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 51, 0, 40, 0, 100, 0, 10, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 10 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 52, 0, 40, 0, 100, 0, 11, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 11 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 53, 0, 40, 0, 100, 0, 12, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 12 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 54, 0, 40, 0, 100, 0, 13, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 55, 0, 40, 0, 100, 0, 14, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 14 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 56, 0, 40, 0, 100, 0, 15, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 15 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 57, 0, 40, 0, 100, 0, 16, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 16 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 58, 0, 40, 0, 100, 0, 17, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 17 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 59, 0, 40, 0, 100, 0, 18, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 18 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 60, 0, 40, 0, 100, 0, 19, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 19 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 61, 0, 40, 0, 100, 0, 20, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 20 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 62, 0, 40, 0, 100, 0, 21, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 21 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 63, 0, 40, 0, 100, 0, 22, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 22 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 64, 0, 40, 0, 100, 0, 23, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 23 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 65, 0, 40, 0, 100, 0, 24, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 24 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 66, 0, 40, 0, 100, 0, 25, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 25 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 67, 0, 40, 0, 100, 0, 26, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 26 of path 7770960 - Start timed actionlist 2534900'),
(25349, 0, 68, 0, 40, 0, 100, 0, 27, 7770960, 0, 0, 0, 80, 2534900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 27 of path 7770960 - Start timed actionlist 2534900');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7770320 AND `point` IN (1,2,3,4,5,6,7,8,9,10,11,12,13);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7770400 AND `point` IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7770960 AND `point` IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27);

-- Entry 25465 (Kel'Thuzad)
DELETE FROM `smart_scripts` WHERE `entryorguid`=2546501 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2546501, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 5.84679, 'After 1s - Set orientation 5.84679');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2546502 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2546502, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 1.48722, 'After 1s - Set orientation 1.48722');
DELETE FROM `smart_scripts` WHERE `entryorguid`=25465 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (8569680);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(25465, 0, 2, 0, 40, 0, 100, 0, 1, 8569680, 0, 0, 0, 5, 30, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 8569680 - Play emote 30'),
(25465, 0, 3, 0, 40, 0, 100, 0, 2, 8569680, 0, 0, 0, 80, 2546501, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 8569680 - Start timed actionlist 2546501'),
(25465, 0, 4, 0, 40, 0, 100, 0, 3, 8569680, 0, 0, 0, 80, 2546502, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 8569680 - Start timed actionlist 2546502');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8569680 AND `point` IN (1,2,3);

-- Entry 25885 (Whirligig Wafflefry)
DELETE FROM `smart_scripts` WHERE `entryorguid`=25885 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (7727520);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(25885, 0, 6, 0, 40, 0, 100, 0, 4, 7727520, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 7727520 - Talk (BroadcastText 25073)'),
(25885, 0, 7, 0, 40, 0, 100, 0, 5, 7727520, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 7727520 - Talk (BroadcastText 25074)'),
(25885, 0, 8, 0, 40, 0, 100, 0, 6, 7727520, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 7727520 - Talk (BroadcastText 25075)'),
(25885, 0, 9, 0, 40, 0, 100, 0, 7, 7727520, 0, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 7727520 - Talk (BroadcastText 25076)');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7727520 AND `point` IN (4,5,6,7);

-- Entry 26044 (Durkot Wolfbrother)
DELETE FROM `smart_scripts` WHERE `entryorguid`=2604400 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2604400, 9, 0, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 0, 11, 68442, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 2s - Cast spell 68442 on self'),
(2604400, 9, 1, 0, 0, 0, 100, 0, 8000, 8000, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 8s - Play emote 1'),
(2604400, 9, 2, 0, 0, 0, 100, 0, 8000, 8000, 0, 0, 0, 28, 68442, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 8s - Remove aura 68442 from self');
DELETE FROM `smart_scripts` WHERE `entryorguid`=26044 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (10045280);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26044, 0, 1, 0, 40, 0, 100, 0, 6, 10045280, 0, 0, 0, 80, 2604400, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 10045280 - Start timed actionlist 2604400'),
(26044, 0, 2, 0, 40, 0, 100, 0, 25, 10045280, 0, 0, 0, 80, 2604400, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 25 of path 10045280 - Start timed actionlist 2604400');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10045280 AND `point` IN (6,25);

-- Entry 26217 (Westfall Brigade Footman)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=26217 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=2621700 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2621700, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 5.37, 'After 0s - Set orientation 5.37'),
(2621700, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 17, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Set emote state 69');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2621701 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2621701, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Play emote 1'),
(2621701, 9, 1, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 0, 5, 25, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 2s - Play emote 25');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2621702 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2621702, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 17, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Set emote state 69');
DELETE FROM `smart_scripts` WHERE `entryorguid`=26217 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (8430720);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26217, 0, 0, 0, 40, 0, 100, 0, 2, 8430720, 0, 0, 0, 80, 2621700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 8430720 - Start timed actionlist 2621700'),
(26217, 0, 1, 0, 40, 0, 100, 0, 6, 8430720, 0, 0, 0, 80, 2621701, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 8430720 - Start timed actionlist 2621701'),
(26217, 0, 2, 0, 40, 0, 100, 0, 9, 8430720, 0, 0, 0, 80, 2621702, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 9 of path 8430720 - Start timed actionlist 2621702');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8430720 AND `point` IN (2,6,9);

-- Entry 26417 (Runed Giant)
DELETE FROM `smart_scripts` WHERE `entryorguid`=2641702 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2641702, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 3632.08, -5536.6, 12.9124, 1.18737, 'After 1s - Teleport to (3632.08,-5536.6,12.9124,1.18737) map 571');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2641703 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2641703, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 3658.67, -5436.73, 26.487, 0.949674, 'After 1s - Teleport to (3658.67,-5436.73,26.487,0.949674) map 571');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2641704 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2641704, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 4370.97, -4934.86, 29.1214, 0.982114, 'After 1s - Teleport to (4370.97,-4934.86,29.1214,0.982114) map 571');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2641705 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2641705, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 4374.84, -4770.08, 52.848, 1.1487, 'After 1s - Teleport to (4374.84,-4770.08,52.848,1.1487) map 571');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2641706 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2641706, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 4306.51, -4766.24, 56.8766, 0.465818, 'After 1s - Teleport to (4306.51,-4766.24,56.8766,0.465818) map 571');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2641707 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2641707, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 4463.83, -4644.89, 84.6203, 2.40181, 'After 1s - Teleport to (4463.83,-4644.89,84.6203,2.40181) map 571');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2641708 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2641708, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 4353.19, -4571.79, 118.402, 1.35635, 'After 1s - Teleport to (4353.19,-4571.79,118.402,1.35635) map 571');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2641709 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2641709, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 3940.79, -4923.88, 81.667, 0.583063, 'After 1s - Teleport to (3940.79,-4923.88,81.667,0.583063) map 571');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2641710 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2641710, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 3863.01, -5340.63, 4.19676, 0.484555, 'After 1s - Teleport to (3863.01,-5340.63,4.19676,0.484555) map 571');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2641711 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2641711, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 3879.8, -4989.44, 85.9219, 0.275225, 'After 1s - Teleport to (3879.8,-4989.44,85.9219,0.275225) map 571');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2641712 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2641712, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 3707.78, -5226.12, 125.551, 6.2721, 'After 1s - Teleport to (3707.78,-5226.12,125.551,6.2721) map 571');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2641713 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2641713, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 4131.99, -4889.01, 60.1083, 0.369627, 'After 1s - Teleport to (4131.99,-4889.01,60.1083,0.369627) map 571');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2641714 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2641714, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 4116.99, -5024.95, 30.5289, 0.607674, 'After 1s - Teleport to (4116.99,-5024.95,30.5289,0.607674) map 571');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2641715 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2641715, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 3859.19, -5204.08, 71.2207, 5.69976, 'After 1s - Teleport to (3859.19,-5204.08,71.2207,5.69976) map 571');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2641716 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2641716, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 4051.38, -5111.15, 12.6903, 0.341522, 'After 1s - Teleport to (4051.38,-5111.15,12.6903,0.341522) map 571');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2641717 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2641717, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 3922.52, -5267.12, 7.26294, 0.90739, 'After 1s - Teleport to (3922.52,-5267.12,7.26294,0.90739) map 571');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2641718 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2641718, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 4137.97, -4969.12, 36.8373, 1.16219, 'After 1s - Teleport to (4137.97,-4969.12,36.8373,1.16219) map 571');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2641719 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2641719, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 4182, -4758.6, 71.2506, 6.20304, 'After 1s - Teleport to (4182,-4758.6,71.2506,6.20304) map 571');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2641720 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2641720, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 4388.64, -4820.43, 41.3801, 0.994674, 'After 1s - Teleport to (4388.64,-4820.43,41.3801,0.994674) map 571');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2641721 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2641721, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 3521.14, -5462.94, 168.445, 0.93554, 'After 1s - Teleport to (3521.14,-5462.94,168.445,0.93554) map 571');
DELETE FROM `smart_scripts` WHERE `entryorguid`=26417 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (8039040,8039440,8040800,8040880,8040960,8041040,8041120,8041200,8041280,8041360,8041440,8041520,8041600,8041760,8041840,8041920,8042080,8042160,8042240,8042400);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26417, 0, 5, 0, 40, 0, 100, 0, 5, 8039040, 0, 0, 0, 80, 2641702, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 8039040 - Start timed actionlist 2641702'),
(26417, 0, 6, 0, 40, 0, 100, 0, 6, 8039440, 0, 0, 0, 80, 2641703, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 8039440 - Start timed actionlist 2641703'),
(26417, 0, 7, 0, 40, 0, 100, 0, 1, 8040800, 0, 0, 0, 80, 2641704, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 8040800 - Start timed actionlist 2641704'),
(26417, 0, 8, 0, 40, 0, 100, 0, 3, 8040880, 0, 0, 0, 80, 2641705, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 8040880 - Start timed actionlist 2641705'),
(26417, 0, 9, 0, 40, 0, 100, 0, 6, 8040960, 0, 0, 0, 80, 2641706, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 8040960 - Start timed actionlist 2641706'),
(26417, 0, 10, 0, 40, 0, 100, 0, 8, 8041040, 0, 0, 0, 80, 2641707, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 8041040 - Start timed actionlist 2641707'),
(26417, 0, 11, 0, 40, 0, 100, 0, 13, 8041120, 0, 0, 0, 80, 2641708, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 8041120 - Start timed actionlist 2641708'),
(26417, 0, 12, 0, 40, 0, 100, 0, 8, 8041200, 0, 0, 0, 80, 2641709, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 8041200 - Start timed actionlist 2641709'),
(26417, 0, 13, 0, 40, 0, 100, 0, 7, 8041280, 0, 0, 0, 80, 2641710, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 8041280 - Start timed actionlist 2641710'),
(26417, 0, 14, 0, 40, 0, 100, 0, 7, 8041360, 0, 0, 0, 80, 2641711, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 8041360 - Start timed actionlist 2641711'),
(26417, 0, 15, 0, 40, 0, 100, 0, 7, 8041440, 0, 0, 0, 80, 2641712, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 8041440 - Start timed actionlist 2641712'),
(26417, 0, 16, 0, 40, 0, 100, 0, 8, 8041520, 0, 0, 0, 80, 2641713, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 8041520 - Start timed actionlist 2641713'),
(26417, 0, 17, 0, 40, 0, 100, 0, 6, 8041600, 0, 0, 0, 80, 2641714, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 8041600 - Start timed actionlist 2641714'),
(26417, 0, 18, 0, 40, 0, 100, 0, 3, 8041760, 0, 0, 0, 80, 2641715, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 8041760 - Start timed actionlist 2641715'),
(26417, 0, 19, 0, 40, 0, 100, 0, 4, 8041840, 0, 0, 0, 80, 2641716, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 8041840 - Start timed actionlist 2641716'),
(26417, 0, 20, 0, 40, 0, 100, 0, 8, 8041920, 0, 0, 0, 80, 2641717, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 8041920 - Start timed actionlist 2641717'),
(26417, 0, 21, 0, 40, 0, 100, 0, 2, 8042080, 0, 0, 0, 80, 2641718, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 8042080 - Start timed actionlist 2641718'),
(26417, 0, 22, 0, 40, 0, 100, 0, 8, 8042160, 0, 0, 0, 80, 2641719, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 8042160 - Start timed actionlist 2641719'),
(26417, 0, 23, 0, 40, 0, 100, 0, 6, 8042240, 0, 0, 0, 80, 2641720, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 8042240 - Start timed actionlist 2641720'),
(26417, 0, 24, 0, 40, 0, 100, 0, 4, 8042400, 0, 0, 0, 80, 2641721, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 8042400 - Start timed actionlist 2641721');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8039040 AND `point` IN (5);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8039440 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8040800 AND `point` IN (1);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8040880 AND `point` IN (3);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8040960 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8041040 AND `point` IN (8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8041120 AND `point` IN (13);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8041200 AND `point` IN (8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8041280 AND `point` IN (7);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8041360 AND `point` IN (7);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8041440 AND `point` IN (7);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8041520 AND `point` IN (8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8041600 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8041760 AND `point` IN (3);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8041840 AND `point` IN (4);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8041920 AND `point` IN (8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8042080 AND `point` IN (2);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8042160 AND `point` IN (8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8042240 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8042400 AND `point` IN (4);

-- Entry 27072 (Amberpine Footman)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=27072 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=2707200 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2707200, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 5.3516, 'After 1s - Set orientation 5.3516');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2707201 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2707201, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 1.42, 'After 1s - Set orientation 1.42');
DELETE FROM `smart_scripts` WHERE `entryorguid`=27072 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (9116720);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(27072, 0, 0, 0, 40, 0, 100, 0, 1, 9116720, 0, 0, 0, 80, 2707200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 9116720 - Start timed actionlist 2707200'),
(27072, 0, 1, 0, 40, 0, 100, 0, 4, 9116720, 0, 0, 0, 80, 2707201, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 9116720 - Start timed actionlist 2707201');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9116720 AND `point` IN (1,4);

-- Entry 27300 (Initiate Vernon)
DELETE FROM `smart_scripts` WHERE `entryorguid`=2730000 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2730000, 9, 0, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 0, 17, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 2s - Set emote state 69'),
(2730000, 9, 1, 0, 0, 0, 100, 0, 15000, 15000, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 15s - Set emote state 0');
DELETE FROM `smart_scripts` WHERE `entryorguid`=27300 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (8904560);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(27300, 0, 5, 0, 40, 0, 100, 0, 1, 8904560, 0, 0, 0, 80, 2730000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 8904560 - Start timed actionlist 2730000'),
(27300, 0, 6, 0, 40, 0, 100, 0, 2, 8904560, 0, 0, 0, 80, 2730000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 8904560 - Start timed actionlist 2730000');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8904560 AND `point` IN (1,2);

-- Entry 27361 (Wintergarde Blacksmith)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=27361 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=2736100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2736100, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 4.2214, 'After 1s - Set orientation 4.2214'),
(2736100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 17, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Set emote state 69');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2736101 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2736101, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 5.3582, 'After 1s - Set orientation 5.3582'),
(2736101, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 17, 173, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Set emote state 173');
DELETE FROM `smart_scripts` WHERE `entryorguid`=27361 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (10701040);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(27361, 0, 0, 0, 40, 0, 100, 0, 1, 10701040, 0, 0, 0, 80, 2736100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 10701040 - Start timed actionlist 2736100'),
(27361, 0, 1, 0, 40, 0, 100, 0, 2, 10701040, 0, 0, 0, 80, 2736101, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 10701040 - Start timed actionlist 2736101');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10701040 AND `point` IN (1,2);

-- Entry 27393 (Valiance Keep Fisherman)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=27393 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=2739300 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2739300, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 17, 379, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Set emote state 379');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2739301 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2739301, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 17, 26, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Set emote state 26'),
(2739301, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 11, 56745, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Cast spell 56745 on self'),
(2739301, 9, 2, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 0, 11, 56745, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 3s - Cast spell 56745 on self');
DELETE FROM `smart_scripts` WHERE `entryorguid`=27393 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (7662480);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(27393, 0, 0, 0, 40, 0, 100, 0, 2, 7662480, 0, 0, 0, 80, 2739300, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 7662480 - Start timed actionlist 2739300'),
(27393, 0, 1, 0, 40, 0, 100, 0, 5, 7662480, 0, 0, 0, 80, 2739300, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 7662480 - Start timed actionlist 2739300'),
(27393, 0, 2, 0, 40, 0, 100, 0, 6, 7662480, 0, 0, 0, 80, 2739301, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 7662480 - Start timed actionlist 2739301');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7662480 AND `point` IN (2,5,6);

-- Entry 27566 (Unu'pe Villager)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=27566 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=2756600 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2756600, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 17, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Set emote state 69');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2756601 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2756601, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 17, 173, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Set emote state 173');
DELETE FROM `smart_scripts` WHERE `entryorguid`=27566 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (8990320,8990720);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(27566, 0, 0, 0, 40, 0, 100, 0, 1, 8990320, 0, 0, 0, 80, 2756600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 8990320 - Start timed actionlist 2756600'),
(27566, 0, 1, 0, 40, 0, 100, 0, 2, 8990320, 0, 0, 0, 80, 2756601, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 8990320 - Start timed actionlist 2756601'),
(27566, 0, 2, 0, 40, 0, 100, 0, 8, 8990720, 0, 0, 0, 80, 2756600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 8990720 - Start timed actionlist 2756600'),
(27566, 0, 3, 0, 40, 0, 100, 0, 16, 8990720, 0, 0, 0, 80, 2756600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 16 of path 8990720 - Start timed actionlist 2756600');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8990320 AND `point` IN (1,2);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8990720 AND `point` IN (8,16);

-- Entry 28406 (Death Knight Initiate) - waypoint behaviour moved to C++ script npc_death_knight_initiate
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10361360 AND `point` IN (8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10361440 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10362320 AND `point` IN (9);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10362400 AND `point` IN (7);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10362480 AND `point` IN (10);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10363520 AND `point` IN (9);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10363680 AND `point` IN (11);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10363760 AND `point` IN (18);

-- Entry 28500 (Master Siegesmith Corvus)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=28500 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=2850000 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2850000, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 17, 233, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Set emote state 233');
DELETE FROM `smart_scripts` WHERE `entryorguid`=28500 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (10286160);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(28500, 0, 0, 0, 40, 0, 100, 0, 1, 10286160, 0, 0, 0, 80, 2850000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 10286160 - Start timed actionlist 2850000'),
(28500, 0, 1, 0, 40, 0, 100, 0, 5, 10286160, 0, 0, 0, 80, 2850000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 10286160 - Start timed actionlist 2850000'),
(28500, 0, 2, 0, 40, 0, 100, 0, 8, 10286160, 0, 0, 0, 17, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 10286160 - Set emote state 1'),
(28500, 0, 3, 0, 40, 0, 100, 0, 12, 10286160, 0, 0, 0, 80, 2850000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 12 of path 10286160 - Start timed actionlist 2850000'),
(28500, 0, 4, 0, 40, 0, 100, 0, 13, 10286160, 0, 0, 0, 80, 2850000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 10286160 - Start timed actionlist 2850000');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10286160 AND `point` IN (1,5,8,12,13);

-- Entry 28504 (Jin'Alai Medicine Man)
DELETE FROM `smart_scripts` WHERE `entryorguid`=2850400 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2850400, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 3.00197, 'After 0s - Set orientation 3.00197'),
(2850400, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 11, 51733, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Cast spell 51733 on self');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2850401 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2850401, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 11, 51733, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Cast spell 51733 on self');
DELETE FROM `smart_scripts` WHERE `entryorguid`=28504 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (8820800,8821120);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(28504, 0, 7, 0, 40, 0, 100, 0, 1, 8820800, 0, 0, 0, 80, 2850400, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 8820800 - Start timed actionlist 2850400'),
(28504, 0, 8, 0, 40, 0, 100, 0, 2, 8820800, 0, 0, 0, 80, 2850401, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 8820800 - Start timed actionlist 2850401'),
(28504, 0, 9, 0, 40, 0, 100, 0, 1, 8821120, 0, 0, 0, 80, 2850401, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 8821120 - Start timed actionlist 2850401'),
(28504, 0, 10, 0, 40, 0, 100, 0, 3, 8821120, 0, 0, 0, 80, 2850401, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 8821120 - Start timed actionlist 2850401');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8820800 AND `point` IN (1,2);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8821120 AND `point` IN (1,3);

-- Entry 28505 (Enslaved Laborer)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=28505 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=2850500 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2850500, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 17, 233, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Set emote state 233');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2850501 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2850501, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 5, 18, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Play emote 18');
DELETE FROM `smart_scripts` WHERE `entryorguid`=28505 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (10286320);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(28505, 0, 0, 0, 40, 0, 100, 0, 1, 10286320, 0, 0, 0, 80, 2850500, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 10286320 - Start timed actionlist 2850500'),
(28505, 0, 1, 0, 40, 0, 100, 0, 2, 10286320, 0, 0, 0, 80, 2850501, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 10286320 - Start timed actionlist 2850501'),
(28505, 0, 2, 0, 40, 0, 100, 0, 3, 10286320, 0, 0, 0, 80, 2850501, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 10286320 - Start timed actionlist 2850501'),
(28505, 0, 3, 0, 40, 0, 100, 0, 4, 10286320, 0, 0, 0, 80, 2850500, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 10286320 - Start timed actionlist 2850500'),
(28505, 0, 4, 0, 40, 0, 100, 0, 5, 10286320, 0, 0, 0, 80, 2850500, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 10286320 - Start timed actionlist 2850500');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10286320 AND `point` IN (1,2,3,4,5);

-- Entry 28506 (Mindless Laborer)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=28506 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=2850600 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2850600, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 17, 438, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Set emote state 438');
DELETE FROM `smart_scripts` WHERE `entryorguid`=28506 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (10286400);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(28506, 0, 0, 0, 40, 0, 100, 0, 1, 10286400, 0, 0, 0, 80, 2850600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 10286400 - Start timed actionlist 2850600'),
(28506, 0, 1, 0, 40, 0, 100, 0, 2, 10286400, 0, 0, 0, 80, 2850600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 10286400 - Start timed actionlist 2850600'),
(28506, 0, 2, 0, 40, 0, 100, 0, 3, 10286400, 0, 0, 0, 80, 2850600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 10286400 - Start timed actionlist 2850600'),
(28506, 0, 3, 0, 40, 0, 100, 0, 4, 10286400, 0, 0, 0, 80, 2850600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 10286400 - Start timed actionlist 2850600');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10286400 AND `point` IN (1,2,3,4);

-- Entry 28576 (Citizen of Havenshire)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=28576 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=2857600 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2857600, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Force despawn (timer 1000)');
DELETE FROM `smart_scripts` WHERE `entryorguid`=28576 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (10312800,10313520,10313840,10313920,10314000,10314160,10314720,10314800,10314880,10315120,10315680,10315840,10315920,10316560);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(28576, 0, 0, 0, 40, 0, 100, 0, 9, 10312800, 0, 0, 0, 80, 2857600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 9 of path 10312800 - Start timed actionlist 2857600'),
(28576, 0, 1, 0, 40, 0, 100, 0, 8, 10313520, 0, 0, 0, 80, 2857600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 10313520 - Start timed actionlist 2857600'),
(28576, 0, 2, 0, 40, 0, 100, 0, 14, 10313840, 0, 0, 0, 80, 2857600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 14 of path 10313840 - Start timed actionlist 2857600'),
(28576, 0, 3, 0, 40, 0, 100, 0, 6, 10313920, 0, 0, 0, 80, 2857600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 10313920 - Start timed actionlist 2857600'),
(28576, 0, 4, 0, 40, 0, 100, 0, 10, 10314000, 0, 0, 0, 80, 2857600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 10 of path 10314000 - Start timed actionlist 2857600'),
(28576, 0, 5, 0, 40, 0, 100, 0, 8, 10314160, 0, 0, 0, 80, 2857600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 10314160 - Start timed actionlist 2857600'),
(28576, 0, 6, 0, 40, 0, 100, 0, 15, 10314720, 0, 0, 0, 80, 2857600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 15 of path 10314720 - Start timed actionlist 2857600'),
(28576, 0, 7, 0, 40, 0, 100, 0, 13, 10314800, 0, 0, 0, 80, 2857600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 10314800 - Start timed actionlist 2857600'),
(28576, 0, 8, 0, 40, 0, 100, 0, 15, 10314880, 0, 0, 0, 80, 2857600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 15 of path 10314880 - Start timed actionlist 2857600'),
(28576, 0, 9, 0, 40, 0, 100, 0, 6, 10315120, 0, 0, 0, 80, 2857600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 10315120 - Start timed actionlist 2857600'),
(28576, 0, 10, 0, 40, 0, 100, 0, 10, 10315680, 0, 0, 0, 80, 2857600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 10 of path 10315680 - Start timed actionlist 2857600'),
(28576, 0, 11, 0, 40, 0, 100, 0, 13, 10315840, 0, 0, 0, 80, 2857600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 10315840 - Start timed actionlist 2857600'),
(28576, 0, 12, 0, 40, 0, 100, 0, 9, 10315920, 0, 0, 0, 80, 2857600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 9 of path 10315920 - Start timed actionlist 2857600'),
(28576, 0, 13, 0, 40, 0, 100, 0, 20, 10316560, 0, 0, 0, 80, 2857600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 20 of path 10316560 - Start timed actionlist 2857600');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10312800 AND `point` IN (9);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10313520 AND `point` IN (8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10313840 AND `point` IN (14);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10313920 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10314000 AND `point` IN (10);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10314160 AND `point` IN (8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10314720 AND `point` IN (15);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10314800 AND `point` IN (13);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10314880 AND `point` IN (15);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10315120 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10315680 AND `point` IN (10);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10315840 AND `point` IN (13);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10315920 AND `point` IN (9);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10316560 AND `point` IN (20);

-- Entry 28577 (Citizen of Havenshire)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=28577 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=2857700 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2857700, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Force despawn (timer 1000)');
DELETE FROM `smart_scripts` WHERE `entryorguid`=28577 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (10317920,10318800,10318880,10319040,10319200,10319280,10319760,10319840,10319920);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(28577, 0, 0, 0, 40, 0, 100, 0, 10, 10317920, 0, 0, 0, 80, 2857700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 10 of path 10317920 - Start timed actionlist 2857700'),
(28577, 0, 1, 0, 40, 0, 100, 0, 13, 10318800, 0, 0, 0, 80, 2857700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 10318800 - Start timed actionlist 2857700'),
(28577, 0, 2, 0, 40, 0, 100, 0, 9, 10318880, 0, 0, 0, 80, 2857700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 9 of path 10318880 - Start timed actionlist 2857700'),
(28577, 0, 3, 0, 40, 0, 100, 0, 17, 10319040, 0, 0, 0, 80, 2857700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 17 of path 10319040 - Start timed actionlist 2857700'),
(28577, 0, 4, 0, 40, 0, 100, 0, 27, 10319200, 0, 0, 0, 80, 2857700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 27 of path 10319200 - Start timed actionlist 2857700'),
(28577, 0, 5, 0, 40, 0, 100, 0, 13, 10319280, 0, 0, 0, 80, 2857700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 10319280 - Start timed actionlist 2857700'),
(28577, 0, 6, 0, 40, 0, 100, 0, 13, 10319760, 0, 0, 0, 80, 2857700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 10319760 - Start timed actionlist 2857700'),
(28577, 0, 7, 0, 40, 0, 100, 0, 7, 10319840, 0, 0, 0, 80, 2857700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 10319840 - Start timed actionlist 2857700'),
(28577, 0, 8, 0, 40, 0, 100, 0, 8, 10319920, 0, 0, 0, 80, 2857700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 10319920 - Start timed actionlist 2857700');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10317920 AND `point` IN (10);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10318800 AND `point` IN (13);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10318880 AND `point` IN (9);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10319040 AND `point` IN (17);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10319200 AND `point` IN (27);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10319280 AND `point` IN (13);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10319760 AND `point` IN (13);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10319840 AND `point` IN (7);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10319920 AND `point` IN (8);

-- Entry 28600 (Heb'Drakkar Headhunter)
DELETE FROM `smart_scripts` WHERE `entryorguid`=2860000 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2860000, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 5, 38, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 0s - Play emote 38'),
(2860000, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 4, 6675, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Play sound 6675'),
(2860000, 9, 2, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 17, 375, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Set emote state 375');
DELETE FROM `smart_scripts` WHERE `entryorguid`=28600 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (9068400,9069120);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(28600, 0, 2, 0, 40, 0, 100, 0, 1, 9068400, 0, 0, 0, 80, 2860000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 9068400 - Start timed actionlist 2860000'),
(28600, 0, 3, 0, 40, 0, 100, 0, 3, 9069120, 0, 0, 0, 11, 52059, 0, 0, 0, 0, 0, 19, 28387, 30, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 9069120 - Cast spell 52059 on closest creature 28387');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9068400 AND `point` IN (1);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9069120 AND `point` IN (3);

-- Entry 28706 (Olisarra the Kind)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=28706 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=28706 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (7922320);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(28706, 0, 0, 0, 40, 0, 100, 0, 3, 7922320, 0, 0, 0, 11, 746, 0, 0, 0, 0, 0, 19, 32652, 1, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 7922320 - Cast spell 746 on closest creature 32652'),
(28706, 0, 1, 0, 40, 0, 100, 0, 7, 7922320, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 7922320 - Play emote 1');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7922320 AND `point` IN (3,7);

-- Entry 28822 (Scarlet Miner)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=28822 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=2882200 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2882200, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Force despawn (timer 1000)');
DELETE FROM `smart_scripts` WHERE `entryorguid`=28822 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (10310800,10311120,10311440,10311520,10311600,10311840,10311920,10312080,10312320,10312400);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(28822, 0, 0, 0, 40, 0, 100, 0, 52, 10310800, 0, 0, 0, 80, 2882200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 52 of path 10310800 - Start timed actionlist 2882200'),
(28822, 0, 1, 0, 40, 0, 100, 0, 41, 10311120, 0, 0, 0, 80, 2882200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 41 of path 10311120 - Start timed actionlist 2882200'),
(28822, 0, 2, 0, 40, 0, 100, 0, 35, 10311440, 0, 0, 0, 80, 2882200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 35 of path 10311440 - Start timed actionlist 2882200'),
(28822, 0, 3, 0, 40, 0, 100, 0, 13, 10311520, 0, 0, 0, 80, 2882200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 10311520 - Start timed actionlist 2882200'),
(28822, 0, 4, 0, 40, 0, 100, 0, 15, 10311600, 0, 0, 0, 80, 2882200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 15 of path 10311600 - Start timed actionlist 2882200'),
(28822, 0, 5, 0, 40, 0, 100, 0, 13, 10311840, 0, 0, 0, 80, 2882200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 10311840 - Start timed actionlist 2882200'),
(28822, 0, 6, 0, 40, 0, 100, 0, 32, 10311920, 0, 0, 0, 80, 2882200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 32 of path 10311920 - Start timed actionlist 2882200'),
(28822, 0, 7, 0, 40, 0, 100, 0, 48, 10312080, 0, 0, 0, 80, 2882200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 48 of path 10312080 - Start timed actionlist 2882200'),
(28822, 0, 8, 0, 40, 0, 100, 0, 8, 10312320, 0, 0, 0, 80, 2882200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 10312320 - Start timed actionlist 2882200'),
(28822, 0, 9, 0, 40, 0, 100, 0, 21, 10312400, 0, 0, 0, 80, 2882200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 21 of path 10312400 - Start timed actionlist 2882200');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10310800 AND `point` IN (52);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10311120 AND `point` IN (41);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10311440 AND `point` IN (35);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10311520 AND `point` IN (13);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10311600 AND `point` IN (15);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10311840 AND `point` IN (13);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10311920 AND `point` IN (32);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10312080 AND `point` IN (48);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10312320 AND `point` IN (8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10312400 AND `point` IN (21);

-- Entry 28828 (Ansari)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=28828 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=2882800 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2882800, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 4.15388, 'After 1s - Set orientation 4.15388');
DELETE FROM `smart_scripts` WHERE `entryorguid`=28828 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (8843120);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(28828, 0, 0, 0, 40, 0, 100, 0, 2, 8843120, 0, 0, 0, 80, 2882800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 8843120 - Start timed actionlist 2882800');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8843120 AND `point` IN (2);

-- Entry 28829 (Saree)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=28829 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=2882900 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2882900, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 3.68265, 'After 1s - Set orientation 3.68265');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2882901 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2882901, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 3.7001, 'After 1s - Set orientation 3.7001');
DELETE FROM `smart_scripts` WHERE `entryorguid`=28829 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (8846720);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(28829, 0, 0, 0, 40, 0, 100, 0, 1, 8846720, 0, 0, 0, 80, 2882900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 8846720 - Start timed actionlist 2882900'),
(28829, 0, 1, 0, 40, 0, 100, 0, 2, 8846720, 0, 0, 0, 80, 2882901, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 8846720 - Start timed actionlist 2882901');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8846720 AND `point` IN (1,2);

-- Entry 28830 (Ra'wiri)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=28830 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=2883000 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2883000, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 2.61799, 'After 1s - Set orientation 2.61799');
DELETE FROM `smart_scripts` WHERE `entryorguid`=28830 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (8852080);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(28830, 0, 0, 0, 40, 0, 100, 0, 9, 8852080, 0, 0, 0, 80, 2883000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 9 of path 8852080 - Start timed actionlist 2883000');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8852080 AND `point` IN (9);

-- Entry 28832 (Chin'ika)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=28832 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=2883200 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2883200, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 1.32645, 'After 1s - Set orientation 1.32645');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2883201 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2883201, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0.541052, 'After 1s - Set orientation 0.541052');
DELETE FROM `smart_scripts` WHERE `entryorguid`=28832 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (8876160);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(28832, 0, 0, 0, 40, 0, 100, 0, 2, 8876160, 0, 0, 0, 80, 2883200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 8876160 - Start timed actionlist 2883200'),
(28832, 0, 1, 0, 40, 0, 100, 0, 3, 8876160, 0, 0, 0, 80, 2883201, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 8876160 - Start timed actionlist 2883201');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8876160 AND `point` IN (2,3);

-- Entry 28897 (Scarlet Ghoul)
DELETE FROM `smart_scripts` WHERE `entryorguid`=2889700 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2889700, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Force despawn (timer 1000)');
DELETE FROM `smart_scripts` WHERE `entryorguid`=28897 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (6631920,6633200,6753440,6753840,6754560,6754880,6754960,6755120);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(28897, 0, 6, 0, 40, 0, 100, 0, 13, 6631920, 0, 0, 0, 80, 2889700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 6631920 - Start timed actionlist 2889700'),
(28897, 0, 7, 0, 40, 0, 100, 0, 12, 6633200, 0, 0, 0, 80, 2889700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 12 of path 6633200 - Start timed actionlist 2889700'),
(28897, 0, 8, 0, 40, 0, 100, 0, 11, 6753440, 0, 0, 0, 80, 2889700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 11 of path 6753440 - Start timed actionlist 2889700'),
(28897, 0, 9, 0, 40, 0, 100, 0, 11, 6753840, 0, 0, 0, 80, 2889700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 11 of path 6753840 - Start timed actionlist 2889700'),
(28897, 0, 10, 0, 40, 0, 100, 0, 9, 6754560, 0, 0, 0, 80, 2889700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 9 of path 6754560 - Start timed actionlist 2889700'),
(28897, 0, 11, 0, 40, 0, 100, 0, 9, 6754880, 0, 0, 0, 80, 2889700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 9 of path 6754880 - Start timed actionlist 2889700'),
(28897, 0, 12, 0, 40, 0, 100, 0, 8, 6754960, 0, 0, 0, 80, 2889700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 6754960 - Start timed actionlist 2889700'),
(28897, 0, 13, 0, 40, 0, 100, 0, 8, 6755120, 0, 0, 0, 80, 2889700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 6755120 - Start timed actionlist 2889700');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=6631920 AND `point` IN (13);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=6633200 AND `point` IN (12);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=6753440 AND `point` IN (11);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=6753840 AND `point` IN (11);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=6754560 AND `point` IN (9);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=6754880 AND `point` IN (9);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=6754960 AND `point` IN (8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=6755120 AND `point` IN (8);

-- Entry 29102 (Hearthglen Crusader) - waypoint behaviour moved to C++ script npc_hearthglen_crusader
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_hearthglen_crusader' WHERE `entry`=29102;
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10445360 AND `point` IN (5);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10445600 AND `point` IN (7);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10448640 AND `point` IN (5);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10449200 AND `point` IN (8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10452240 AND `point` IN (8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10452880 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10452960 AND `point` IN (5);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10453040 AND `point` IN (9);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10453520 AND `point` IN (12);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10453680 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10454000 AND `point` IN (8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10454080 AND `point` IN (14);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10454160 AND `point` IN (7);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10454320 AND `point` IN (8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10454560 AND `point` IN (6);

-- Entry 29103 (Tirisfal Crusader) - waypoint behaviour moved to C++ script npc_hearthglen_crusader
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_hearthglen_crusader' WHERE `entry`=29103;
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10459440 AND `point` IN (7);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10460320 AND `point` IN (4);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10463040 AND `point` IN (11);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10463120 AND `point` IN (5);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10463280 AND `point` IN (8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10463360 AND `point` IN (7);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10463520 AND `point` IN (7);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10463680 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10463840 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10464080 AND `point` IN (5);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10464160 AND `point` IN (7);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10464240 AND `point` IN (9);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10464320 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10464400 AND `point` IN (7);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10464480 AND `point` IN (9);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10464720 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10464800 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10464880 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10464960 AND `point` IN (9);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10465040 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10465520 AND `point` IN (11);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10465600 AND `point` IN (8);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10466000 AND `point` IN (7);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10466160 AND `point` IN (7);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10466320 AND `point` IN (6);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10466400 AND `point` IN (9);

-- Entry 29185 (Volatile Ghoul)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=29185 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=2918500 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2918500, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 11, 26047, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Cast spell 26047 on self'),
(2918500, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 3s - Set emote state 0');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2918501 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2918501, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Force despawn (timer 1000)');
DELETE FROM `smart_scripts` WHERE `entryorguid`=29185 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (10428960,10429040,10429840);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29185, 0, 0, 0, 40, 0, 100, 0, 1, 10428960, 0, 0, 0, 80, 2918500, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 10428960 - Start timed actionlist 2918500'),
(29185, 0, 1, 0, 40, 0, 100, 0, 4, 10428960, 0, 0, 0, 80, 2918501, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 10428960 - Start timed actionlist 2918501'),
(29185, 0, 2, 0, 40, 0, 100, 0, 1, 10429040, 0, 0, 0, 80, 2918500, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 10429040 - Start timed actionlist 2918500'),
(29185, 0, 3, 0, 40, 0, 100, 0, 10, 10429040, 0, 0, 0, 80, 2918501, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 10 of path 10429040 - Start timed actionlist 2918501'),
(29185, 0, 4, 0, 40, 0, 100, 0, 1, 10429840, 0, 0, 0, 80, 2918500, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 10429840 - Start timed actionlist 2918500'),
(29185, 0, 5, 0, 40, 0, 100, 0, 18, 10429840, 0, 0, 0, 80, 2918501, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 18 of path 10429840 - Start timed actionlist 2918501');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10428960 AND `point` IN (1,4);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10429040 AND `point` IN (1,10);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10429840 AND `point` IN (1,18);

-- Entry 29186 (Rampaging Abomination)
DELETE FROM `smart_scripts` WHERE `entryorguid`=2918600 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2918600, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Force despawn (timer 1000)');
DELETE FROM `smart_scripts` WHERE `entryorguid`=29186 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (10430080,10430320);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29186, 0, 2, 0, 40, 0, 100, 0, 18, 10430080, 0, 0, 0, 80, 2918600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 18 of path 10430080 - Start timed actionlist 2918600'),
(29186, 0, 3, 0, 40, 0, 100, 0, 26, 10430320, 0, 0, 0, 80, 2918600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 26 of path 10430320 - Start timed actionlist 2918600');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10430080 AND `point` IN (18);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10430320 AND `point` IN (26);

-- Entry 29375 (Stormforged Iron Giant)
DELETE FROM `smart_scripts` WHERE `entryorguid`=2937500 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2937500, 9, 0, 0, 0, 0, 100, 0, 13000, 13000, 0, 0, 0, 5, 53, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 13s - Play emote 53');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2937501 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2937501, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Force despawn (timer 1000)');
DELETE FROM `smart_scripts` WHERE `entryorguid`=29375 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (5921360,5921440,9114880,9114960);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29375, 0, 2, 0, 40, 0, 100, 0, 1, 5921360, 0, 0, 0, 80, 2937500, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 5921360 - Start timed actionlist 2937500'),
(29375, 0, 3, 0, 40, 0, 100, 0, 16, 5921440, 0, 0, 0, 80, 2937501, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 16 of path 5921440 - Start timed actionlist 2937501'),
(29375, 0, 4, 0, 40, 0, 100, 0, 1, 9114880, 0, 0, 0, 80, 2937500, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 9114880 - Start timed actionlist 2937500'),
(29375, 0, 5, 0, 40, 0, 100, 0, 2, 9114960, 0, 0, 0, 80, 2937500, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 9114960 - Start timed actionlist 2937500');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5921360 AND `point` IN (1);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5921440 AND `point` IN (16);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9114880 AND `point` IN (1);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9114960 AND `point` IN (2);

-- Entry 29407 (Snowblind Devotee)
DELETE FROM `smart_scripts` WHERE `entryorguid`=2940700 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2940700, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 5, 36, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Play emote 36');
DELETE FROM `smart_scripts` WHERE `entryorguid`=29407 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (9384640,9384800);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29407, 0, 1, 0, 40, 0, 100, 0, 12, 9384640, 0, 0, 0, 80, 2940700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 12 of path 9384640 - Start timed actionlist 2940700'),
(29407, 0, 2, 0, 40, 0, 100, 0, 1, 9384800, 0, 0, 0, 80, 2940700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 9384800 - Start timed actionlist 2940700'),
(29407, 0, 3, 0, 40, 0, 100, 0, 2, 9384800, 0, 0, 0, 80, 2940700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 9384800 - Start timed actionlist 2940700'),
(29407, 0, 4, 0, 40, 0, 100, 0, 3, 9384800, 0, 0, 0, 80, 2940700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 9384800 - Start timed actionlist 2940700');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9384640 AND `point` IN (12);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9384800 AND `point` IN (1,2,3);

-- Entry 29432 (Gino)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=29432 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=29432 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (1630632);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29432, 0, 0, 0, 40, 0, 100, 0, 3, 1630632, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 1630632 - Play emote 1'),
(29432, 0, 1, 0, 40, 0, 100, 0, 5, 1630632, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0.104771, 'On WP 5 of path 1630632 - Set orientation 0.104771');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=1630632 AND `point` IN (3,5);

-- Entry 29503 (Fjorn)
DELETE FROM `smart_scripts` WHERE `entryorguid`=2950300 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2950300, 9, 0, 0, 0, 0, 100, 0, 13000, 13000, 0, 0, 0, 5, 53, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 13s - Play emote 53');
DELETE FROM `smart_scripts` WHERE `entryorguid`=29503 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (7064640);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29503, 0, 2, 0, 40, 0, 100, 0, 7, 7064640, 0, 0, 0, 80, 2950300, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 7064640 - Start timed actionlist 2950300');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7064640 AND `point` IN (7);

-- Entry 29506 (Orland Schaeffer)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=29506 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=29506 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (8165680);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29506, 0, 0, 0, 40, 0, 100, 0, 2, 8165680, 0, 0, 0, 5, 233, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 8165680 - Play emote 233'),
(29506, 0, 1, 0, 40, 0, 100, 0, 3, 8165680, 0, 0, 0, 5, 233, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 8165680 - Play emote 233'),
(29506, 0, 2, 0, 40, 0, 100, 0, 4, 8165680, 0, 0, 0, 5, 233, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 8165680 - Play emote 233'),
(29506, 0, 3, 0, 40, 0, 100, 0, 5, 8165680, 0, 0, 0, 5, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 8165680 - Play emote 69'),
(29506, 0, 4, 0, 40, 0, 100, 0, 6, 8165680, 0, 0, 0, 5, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 6 of path 8165680 - Play emote 69'),
(29506, 0, 5, 0, 40, 0, 100, 0, 7, 8165680, 0, 0, 0, 5, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 7 of path 8165680 - Play emote 69');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8165680 AND `point` IN (2,3,4,5,6,7);

-- Entry 29640 (Josie Birch)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=29640 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=29640 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (9182480);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29640, 0, 0, 0, 40, 0, 100, 0, 3, 9182480, 0, 0, 0, 11, 746, 0, 0, 0, 0, 0, 19, 32651, 1, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 9182480 - Cast spell 746 on closest creature 32651'),
(29640, 0, 1, 0, 40, 0, 100, 0, 4, 9182480, 0, 0, 0, 5, 16, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 9182480 - Play emote 16'),
(29640, 0, 2, 0, 40, 0, 100, 0, 8, 9182480, 0, 0, 0, 11, 746, 0, 0, 0, 0, 0, 19, 32650, 1, 0, 0, 0, 0, 0, 0, 'On WP 8 of path 9182480 - Cast spell 746 on closest creature 32650');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9182480 AND `point` IN (3,4,8);

-- Entry 30436 (Halig Fireforge)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=30436 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=30436 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (9959760);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(30436, 0, 0, 0, 40, 0, 100, 0, 1, 9959760, 0, 0, 0, 17, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 9959760 - Set emote state 69'),
(30436, 0, 1, 0, 40, 0, 100, 0, 2, 9959760, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 9959760 - Play emote 0');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9959760 AND `point` IN (1,2);

-- Entry 32373 (Gatekeeper Melindra)
DELETE FROM `smart_scripts` WHERE `entryorguid`=3237300 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3237300, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 3.3185, 'After 1s - Set orientation 3.3185');
DELETE FROM `smart_scripts` WHERE `entryorguid`=3237301 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3237301, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 1.804, 'After 1s - Set orientation 1.804');
DELETE FROM `smart_scripts` WHERE `entryorguid`=3237302 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3237302, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 4.9747, 'After 1s - Set orientation 4.9747');
DELETE FROM `smart_scripts` WHERE `entryorguid`=32373 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (5676080);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(32373, 0, 3, 0, 40, 0, 100, 0, 1, 5676080, 0, 0, 0, 80, 3237300, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 5676080 - Start timed actionlist 3237300'),
(32373, 0, 4, 0, 40, 0, 100, 0, 2, 5676080, 0, 0, 0, 80, 3237301, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 5676080 - Start timed actionlist 3237301'),
(32373, 0, 5, 0, 40, 0, 100, 0, 3, 5676080, 0, 0, 0, 80, 3237300, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 5676080 - Start timed actionlist 3237300'),
(32373, 0, 6, 0, 40, 0, 100, 0, 4, 5676080, 0, 0, 0, 80, 3237302, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 5676080 - Start timed actionlist 3237302');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5676080 AND `point` IN (1,2,3,4);

-- Entry 32374 (Librarian Belleford)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=32374 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=3237400 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3237400, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 4.9635, 'After 1s - Set orientation 4.9635');
DELETE FROM `smart_scripts` WHERE `entryorguid`=3237401 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3237401, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 3.3859, 'After 1s - Set orientation 3.3859');
DELETE FROM `smart_scripts` WHERE `entryorguid`=32374 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (5777120);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(32374, 0, 0, 0, 40, 0, 100, 0, 2, 5777120, 0, 0, 0, 80, 3237400, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 5777120 - Start timed actionlist 3237400'),
(32374, 0, 1, 0, 40, 0, 100, 0, 3, 5777120, 0, 0, 0, 80, 3237400, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 5777120 - Start timed actionlist 3237400'),
(32374, 0, 2, 0, 40, 0, 100, 0, 4, 5777120, 0, 0, 0, 80, 3237401, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 5777120 - Start timed actionlist 3237401');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=5777120 AND `point` IN (2,3,4);

-- Entry 32403 (Sandra Bartan)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=32403 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=32403 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (8778800);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(32403, 0, 0, 0, 40, 0, 100, 0, 14, 8778800, 0, 0, 0, 5, 69, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 14 of path 8778800 - Play emote 69');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8778800 AND `point` IN (14);

-- Entry 32631 (Alfred Copperworth)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=32631 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=3263100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3263100, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 4.83456, 'After 1s - Set orientation 4.83456'),
(3263100, 9, 1, 0, 0, 0, 100, 0, 13000, 13000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 4.39823, 'After 13s - Set orientation 4.39823');
DELETE FROM `smart_scripts` WHERE `entryorguid`=3263101 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3263101, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0.331613, 'After 1s - Set orientation 0.331613');
DELETE FROM `smart_scripts` WHERE `entryorguid`=3263102 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3263102, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 2.37365, 'After 1s - Set orientation 2.37365');
DELETE FROM `smart_scripts` WHERE `entryorguid`=32631 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (8556800);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(32631, 0, 0, 0, 40, 0, 100, 0, 17, 8556800, 0, 0, 0, 80, 3263100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 17 of path 8556800 - Start timed actionlist 3263100'),
(32631, 0, 1, 0, 40, 0, 100, 0, 21, 8556800, 0, 0, 0, 80, 3263101, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 21 of path 8556800 - Start timed actionlist 3263101'),
(32631, 0, 2, 0, 40, 0, 100, 0, 23, 8556800, 0, 0, 0, 80, 3263102, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 23 of path 8556800 - Start timed actionlist 3263102');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8556800 AND `point` IN (17,21,23);

-- Entry 32737 (Archmage John Nicholas)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=32737 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=3273700 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3273700, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 3.12414, 'After 1s - Set orientation 3.12414');
DELETE FROM `smart_scripts` WHERE `entryorguid`=3273701 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3273701, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 5.46288, 'After 1s - Set orientation 5.46288');
DELETE FROM `smart_scripts` WHERE `entryorguid`=32737 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (16282000);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(32737, 0, 0, 0, 40, 0, 100, 0, 1, 16282000, 0, 0, 0, 80, 3273700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 16282000 - Start timed actionlist 3273700'),
(32737, 0, 1, 0, 40, 0, 100, 0, 2, 16282000, 0, 0, 0, 80, 3273701, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 2 of path 16282000 - Start timed actionlist 3273701');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=16282000 AND `point` IN (1,2);

-- Entry 32746 (Geffon the Unruly)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=32746 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=3274600 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3274600, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Force despawn (timer 1000)');
DELETE FROM `smart_scripts` WHERE `entryorguid`=32746 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (9445120);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(32746, 0, 0, 0, 40, 0, 100, 0, 31, 9445120, 0, 0, 0, 80, 3274600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 31 of path 9445120 - Start timed actionlist 3274600');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9445120 AND `point` IN (31);

-- Entry 32906 (Freya) - waypoint behaviour moved to C++ script boss_freya
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10924320 AND `point` IN (4,10,18);

-- Entry 33293 (XT-002 Deconstructor) - waypoint behaviour moved to C++ script boss_xt002
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10884320 AND `point` IN (3,9,13);

-- Entry 35808 (Swift Alliance Steed)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=35808 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=3580800 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3580800, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 5, 402, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Play emote 402');
DELETE FROM `smart_scripts` WHERE `entryorguid`=35808 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (6809200);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(35808, 0, 0, 0, 40, 0, 100, 0, 3, 6809200, 0, 0, 0, 80, 3580800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 3 of path 6809200 - Start timed actionlist 3580800');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=6809200 AND `point` IN (3);

-- Entry 36223 (Swift Horde Wolf)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=36223 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=3622300 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3622300, 9, 0, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 0, 17, 418, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 2s - Set emote state 418'),
(3622300, 9, 1, 0, 0, 0, 100, 0, 8000, 8000, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 8s - Set emote state 0');
DELETE FROM `smart_scripts` WHERE `entryorguid`=36223 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (6641760);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(36223, 0, 0, 0, 40, 0, 100, 0, 1, 6641760, 0, 0, 0, 80, 3622300, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 1 of path 6641760 - Start timed actionlist 3622300');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=6641760 AND `point` IN (1);

-- Entry 37776 (Apprentice Nelphi)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=37776 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=3777600 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3777600, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 5.42797, 'After 1s - Set orientation 5.42797');
DELETE FROM `smart_scripts` WHERE `entryorguid`=3777601 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3777601, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 1.48353, 'After 1s - Set orientation 1.48353');
DELETE FROM `smart_scripts` WHERE `entryorguid`=3777602 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3777602, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 5.77704, 'After 1s - Set orientation 5.77704');
DELETE FROM `smart_scripts` WHERE `entryorguid`=37776 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (8098880);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(37776, 0, 0, 0, 40, 0, 100, 0, 4, 8098880, 0, 0, 0, 80, 3777600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 4 of path 8098880 - Start timed actionlist 3777600'),
(37776, 0, 1, 0, 40, 0, 100, 0, 13, 8098880, 0, 0, 0, 80, 3777601, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 8098880 - Start timed actionlist 3777601'),
(37776, 0, 2, 0, 40, 0, 100, 0, 16, 8098880, 0, 0, 0, 80, 3777602, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 16 of path 8098880 - Start timed actionlist 3777602');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=8098880 AND `point` IN (4,13,16);

-- Entry 37780 (Dark Ranger Vorel)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=37780 AND `AIName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid`=3778000 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3778000, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 2.84489, 'After 1s - Set orientation 2.84489');
DELETE FROM `smart_scripts` WHERE `entryorguid`=3778001 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3778001, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 4.72984, 'After 1s - Set orientation 4.72984');
DELETE FROM `smart_scripts` WHERE `entryorguid`=3778002 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3778002, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 2.49582, 'After 1s - Set orientation 2.49582');
DELETE FROM `smart_scripts` WHERE `entryorguid`=37780 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (10691920);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(37780, 0, 0, 0, 40, 0, 100, 0, 5, 10691920, 0, 0, 0, 80, 3778000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 5 of path 10691920 - Start timed actionlist 3778000'),
(37780, 0, 1, 0, 40, 0, 100, 0, 15, 10691920, 0, 0, 0, 80, 3778001, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 15 of path 10691920 - Start timed actionlist 3778001'),
(37780, 0, 2, 0, 40, 0, 100, 0, 18, 10691920, 0, 0, 0, 80, 3778002, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 18 of path 10691920 - Start timed actionlist 3778002');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=10691920 AND `point` IN (5,15,18);

-- Entry 38047 (Blood Elf Pilgrim)
DELETE FROM `smart_scripts` WHERE `entryorguid`=3804700 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3804700, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Force despawn (timer 1000)');
DELETE FROM `smart_scripts` WHERE `entryorguid`=38047 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (9836640,9837920,9838960);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(38047, 0, 0, 0, 40, 0, 100, 0, 13, 9836640, 0, 0, 0, 80, 3804700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 9836640 - Start timed actionlist 3804700'),
(38047, 0, 1, 0, 40, 0, 100, 0, 12, 9837920, 0, 0, 0, 80, 3804700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 12 of path 9837920 - Start timed actionlist 3804700'),
(38047, 0, 2, 0, 40, 0, 100, 0, 13, 9838960, 0, 0, 0, 80, 3804700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 13 of path 9838960 - Start timed actionlist 3804700');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9836640 AND `point` IN (13);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9837920 AND `point` IN (12);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9838960 AND `point` IN (13);

-- Entry 38048 (High Elf Pilgrim)
DELETE FROM `smart_scripts` WHERE `entryorguid`=3804800 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3804800, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'After 1s - Force despawn (timer 1000)');
DELETE FROM `smart_scripts` WHERE `entryorguid`=38048 AND `source_type`=0 AND `event_type`=40 AND `event_param2` IN (9833200,9899040);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(38048, 0, 0, 0, 40, 0, 100, 0, 11, 9833200, 0, 0, 0, 80, 3804800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 11 of path 9833200 - Start timed actionlist 3804800'),
(38048, 0, 1, 0, 40, 0, 100, 0, 14, 9899040, 0, 0, 0, 80, 3804800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP 14 of path 9899040 - Start timed actionlist 3804800');
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9833200 AND `point` IN (11);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=9899040 AND `point` IN (14);

-- Paths not used by any creature
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=231296 AND `point` IN (10);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7069600 AND `point` IN (3,9);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7070000 AND `point` IN (3,9);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7070080 AND `point` IN (3,8,13);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7070160 AND `point` IN (3,7);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=7070240 AND `point` IN (3,10);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=16185120 AND `point` IN (2,5);

-- Actions pointing to non-existent waypoint_scripts
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=4696080 AND `point` IN (15);
UPDATE `waypoint_data` SET `action`=0 WHERE `id`=4966240 AND `point` IN (10,11,12);

-- Waypoint_scripts cleanup
DELETE FROM `waypoint_scripts` WHERE `id` NOT IN (SELECT `action` FROM `waypoint_data` WHERE `action` <> 0);
