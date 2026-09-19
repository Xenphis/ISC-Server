--
DELETE FROM `command` WHERE `name`='debug conversation';
INSERT INTO `command` (`name`,`help`) VALUES
('debug conversation','Syntax: .debug conversation\r\n\r\nShows a test conversation between the selected creature and you in the ISC client addon.');
