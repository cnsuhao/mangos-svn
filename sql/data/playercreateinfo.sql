-- phpMyAdmin SQL Dump
-- version 2.6.2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Sep 21, 2005 at 09:03 AM
-- Server version: 4.1.12
-- PHP Version: 5.0.4
-- 
-- Database: `mangos`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `playercreateinfo`
-- 
-- Creation: Sep 21, 2005 at 08:58 AM
-- Last update: Sep 21, 2005 at 09:01 AM
-- 

DROP TABLE IF EXISTS `playercreateinfo`;
CREATE TABLE IF NOT EXISTS `playercreateinfo` (
  `Index` tinyint(3) unsigned NOT NULL auto_increment,
  `race` tinyint(3) unsigned NOT NULL default '0',
  `class` tinyint(3) unsigned NOT NULL default '0',
  `mapID` mediumint(8) unsigned NOT NULL default '0',
  `zoneID` mediumint(8) unsigned NOT NULL default '0',
  `positionX` float NOT NULL default '0',
  `positionY` float NOT NULL default '0',
  `positionZ` float NOT NULL default '0',
  `displayID` smallint(5) unsigned NOT NULL default '0',
  `BaseStrength` tinyint(3) unsigned NOT NULL default '0',
  `BaseAgility` tinyint(3) unsigned NOT NULL default '0',
  `BaseStamina` tinyint(3) unsigned NOT NULL default '0',
  `BaseIntellect` tinyint(3) unsigned NOT NULL default '0',
  `BaseSpirit` tinyint(3) unsigned NOT NULL default '0',
  `BaseHealth` mediumint(8) unsigned NOT NULL default '0',
  `BaseMana` mediumint(8) unsigned NOT NULL default '0',
  `BaseRage` mediumint(8) unsigned NOT NULL default '0',
  `BaseFocus` mediumint(8) unsigned NOT NULL default '0',
  `BaseEnergy` mediumint(8) unsigned NOT NULL default '0',
  `attackpower` mediumint(8) unsigned NOT NULL default '0',
  `mindmg` float NOT NULL default '0',
  `maxdmg` float NOT NULL default '0',
  PRIMARY KEY  (`Index`)
) TYPE=MyISAM AUTO_INCREMENT=44 ;

-- 
-- Dumping data for table `playercreateinfo`
-- 

INSERT INTO `playercreateinfo` VALUES (1, 1, 1, 0, 12, -8949, -132, 83, 49, 23, 20, 22, 20, 20, 60, 0, 1000, 0, 0, 29, 5, 6);
INSERT INTO `playercreateinfo` VALUES (2, 2, 1, 1, 14, -618, -4251, 38, 51, 26, 17, 24, 17, 23, 80, 0, 1000, 0, 0, 35, 6, 6);
INSERT INTO `playercreateinfo` VALUES (3, 3, 1, 0, 1, -6240, 331, 382, 53, 25, 16, 25, 19, 19, 90, 0, 1000, 0, 0, 33, 5, 6);
INSERT INTO `playercreateinfo` VALUES (4, 4, 1, 1, 141, 10311, 832, 1326, 55, 20, 25, 21, 20, 20, 50, 0, 1000, 0, 0, 21, 4, 4);
INSERT INTO `playercreateinfo` VALUES (5, 5, 1, 0, 85, 1676, 1677, 121, 57, 22, 18, 23, 18, 25, 70, 0, 1000, 0, 0, 27, 4, 5);
INSERT INTO `playercreateinfo` VALUES (6, 6, 1, 1, 215, -2917, -257, 52, 59, 28, 15, 24, 15, 22, 80, 0, 1000, 0, 0, 39, 6, 7);
INSERT INTO `playercreateinfo` VALUES (7, 7, 1, 0, 1, -6240, 331, 382, 1563, 18, 23, 21, 23, 20, 50, 0, 1000, 0, 0, 10, 3, 4);
INSERT INTO `playercreateinfo` VALUES (8, 8, 1, 1, 14, -618, -4251, 38, 1478, 24, 22, 23, 16, 21, 70, 0, 1000, 0, 0, 29, 5, 7);
INSERT INTO `playercreateinfo` VALUES (9, 1, 2, 0, 12, -8949, -132, 83, 49, 22, 20, 22, 20, 21, 58, 80, 0, 0, 0, 27, 4, 5);
INSERT INTO `playercreateinfo` VALUES (10, 3, 2, 0, 1, -6240, 331, 382, 53, 24, 16, 25, 19, 20, 88, 79, 0, 0, 0, 31, 5, 6);
INSERT INTO `playercreateinfo` VALUES (15, 4, 3, 1, 141, 10311, 832, 1326, 55, 17, 28, 20, 20, 21, 46, 85, 0, 0, 0, 26, 4, 5);
INSERT INTO `playercreateinfo` VALUES (11, 2, 3, 1, 14, -618, -4251, 38, 51, 23, 20, 23, 17, 24, 76, 82, 0, 0, 0, 25, 4, 5);
INSERT INTO `playercreateinfo` VALUES (12, 3, 3, 0, 1, -6240, 331, 382, 53, 22, 19, 24, 19, 20, 86, 84, 0, 0, 0, 24, 4, 5);
INSERT INTO `playercreateinfo` VALUES (16, 6, 3, 1, 215, -2917, -257, 52, 59, 25, 18, 23, 15, 23, 76, 80, 0, 0, 0, 16, 5, 7);
INSERT INTO `playercreateinfo` VALUES (17, 8, 3, 1, 14, -618, -4251, 38, 1478, 21, 25, 22, 16, 22, 66, 81, 0, 0, 0, 16, 5, 7);
INSERT INTO `playercreateinfo` VALUES (18, 1, 4, 0, 12, -8949, -132, 83, 49, 21, 23, 21, 20, 20, 55, 0, 0, 0, 100, 27, 10, 13);
INSERT INTO `playercreateinfo` VALUES (19, 2, 4, 1, 14, -618, -4251, 38, 51, 24, 20, 23, 17, 23, 75, 0, 0, 0, 100, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (20, 3, 4, 0, 1, -6240, 331, 382, 53, 23, 19, 24, 19, 19, 85, 0, 0, 0, 100, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (21, 4, 4, 1, 141, 10311, 832, 1326, 55, 18, 28, 20, 20, 20, 45, 0, 0, 0, 100, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (22, 5, 4, 0, 85, 1676, 1677, 121, 57, 20, 21, 22, 18, 25, 65, 0, 0, 0, 100, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (23, 7, 4, 0, 1, -6340, 331, 382, 1563, 16, 26, 20, 23, 20, 45, 0, 0, 0, 100, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (24, 8, 4, 1, 14, -618, -4251, 38, 1478, 22, 25, 22, 16, 21, 65, 0, 0, 0, 100, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (25, 1, 5, 0, 12, -8949, -132, 83, 49, 20, 20, 20, 22, 23, 52, 160, 0, 0, 0, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (26, 3, 5, 0, 1, -6240, 331, 382, 53, 22, 16, 23, 21, 22, 82, 145, 0, 0, 0, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (27, 4, 5, 1, 141, 10311, 832, 1326, 55, 17, 25, 19, 22, 23, 51, 160, 0, 0, 0, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (28, 5, 5, 0, 85, 1676, 1677, 121, 57, 19, 18, 21, 20, 28, 62, 130, 0, 0, 0, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (29, 8, 5, 1, 14, -618, -4251, 38, 1478, 21, 22, 21, 18, 24, 62, 128, 0, 0, 0, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (30, 2, 7, 1, 14, -618, -4251, 38, 51, 24, 17, 23, 18, 25, 77, 73, 0, 0, 0, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (31, 6, 7, 1, 215, -2917, -257, 52, 59, 26, 15, 23, 16, 24, 77, 71, 0, 0, 0, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (32, 8, 7, 1, 14, -618, -4251, 38, 1478, 22, 22, 22, 17, 23, 67, 72, 0, 0, 0, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (34, 1, 8, 0, 12, -8949, -132, 83, 49, 20, 20, 20, 23, 22, 52, 165, 0, 0, 0, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (35, 5, 8, 0, 85, 1676, 1677, 121, 57, 19, 18, 21, 21, 27, 62, 135, 0, 0, 0, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (36, 7, 8, 0, 1, -6340, 331, 382, 1563, 15, 23, 19, 26, 22, 51, 210, 0, 0, 0, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (37, 8, 8, 1, 14, -618, -4251, 38, 1478, 21, 22, 21, 19, 23, 62, 119, 0, 0, 0, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (38, 1, 9, 0, 12, -8949, -132, 83, 49, 20, 20, 21, 22, 22, 53, 140, 0, 0, 0, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (39, 2, 9, 1, 14, -618, -4251, 38, 51, 23, 17, 23, 19, 25, 73, 109, 0, 0, 0, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (40, 5, 9, 0, 85, 1676, 1677, 121, 57, 19, 18, 22, 20, 27, 63, 110, 0, 0, 0, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (41, 7, 9, 0, 1, -6340, 331, 382, 1563, 15, 23, 20, 25, 22, 43, 185, 0, 0, 0, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (42, 4, 11, 1, 141, 10311, 832, 1326, 55, 18, 25, 19, 22, 22, 53, 100, 0, 0, 0, 30, 4, 4);
INSERT INTO `playercreateinfo` VALUES (43, 6, 11, 1, 215, -2917, -257, 52, 59, 26, 15, 22, 17, 24, 74, 67, 0, 0, 0, 30, 4, 4);
