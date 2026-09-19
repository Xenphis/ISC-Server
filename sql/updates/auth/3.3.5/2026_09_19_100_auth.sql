DELETE FROM `rbac_permissions` WHERE `id`=853;
INSERT INTO `rbac_permissions` (`id`,`name`) VALUES
(853,'Command: reload conversation_line');

DELETE FROM `rbac_linked_permissions` WHERE `linkedId`=853;
INSERT INTO `rbac_linked_permissions` (`id`,`linkedId`) VALUES
(196,853);
