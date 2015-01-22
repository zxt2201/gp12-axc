-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 18, 2013 at 10:00 PM
-- Server version: 5.5.25
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `xxz12u`
--

-- --------------------------------------------------------

--
-- Table structure for table `Groups`
--

CREATE TABLE `Groups` (
  `GName` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `GMark` int(11) DEFAULT NULL,
  `GCompleted` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `MCode` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`GName`),
  KEY `fk_grps_mod` (`MCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Groups`
--

INSERT INTO `Groups` (`GName`, `GMark`, `GCompleted`, `MCode`) VALUES
('ap12-axc', NULL, NULL, 'G52APR'),
('ap12-azn', NULL, NULL, 'G52APR'),
('ap12-wee', NULL, NULL, 'G52APR'),
('ap12-yut', NULL, NULL, 'G52APR'),
('gp12-axc', NULL, NULL, 'G52GRP'),
('gp12-azn', NULL, NULL, 'G52GRP'),
('if12-axc', NULL, NULL, 'G52IFR'),
('if12-wee', NULL, NULL, 'G52IFR'),
('lr12-him', NULL, NULL, 'G52ILR');

-- --------------------------------------------------------

--
-- Table structure for table `Modules`
--

CREATE TABLE `Modules` (
  `MCode` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `Weighting` float NOT NULL,
  PRIMARY KEY (`MCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Modules`
--

INSERT INTO `Modules` (`MCode`, `Weighting`) VALUES
('G52ADS', 0.5),
('G52APR', 0.9),
('G52GRP', 0.7),
('G52IFR', 0.5),
('G52PAS', 0.9),
('G52ILR', 9);

-- --------------------------------------------------------

--
-- Table structure for table `PeerMark`
--

CREATE TABLE `PeerMark` (
  `PID` int(11) NOT NULL AUTO_INCREMENT,
  `SID1` int(11) NOT NULL,
  `SID2` int(11) NOT NULL,
  `PResearch` enum('0','1','2','3','4') COLLATE utf8_unicode_ci NOT NULL,
  `PCreative` enum('0','1','2','3','4') COLLATE utf8_unicode_ci NOT NULL,
  `PCooperation` enum('0','1','2','3','4') COLLATE utf8_unicode_ci NOT NULL,
  `Pcommunication` enum('0','1','2','3','4') COLLATE utf8_unicode_ci NOT NULL,
  `PQuality` enum('0','1','2','3','4') COLLATE utf8_unicode_ci NOT NULL,
  `PAttendance` enum('0','1','2','3','4') COLLATE utf8_unicode_ci NOT NULL,
  `GName` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `PComment` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`PID`),
  KEY `fk_pmrk_grp` (`GName`),
  KEY `fk_pmrk_stud1` (`SID1`),
  KEY `fk_pmrk_stud2` (`SID2`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=63 ;

--
-- Dumping data for table `PeerMark`
--

INSERT INTO `PeerMark` (`PID`, `SID1`, `SID2`, `PResearch`, `PCreative`, `PCooperation`, `Pcommunication`, `PQuality`, `PAttendance`, `GName`, `PComment`) VALUES
(11, 4102907, 4181358, '', '', '', '', '', '1', 'ap12-wee', 'juy'),
(13, 4119163, 4177303, '', '', '', '', '', '', 'if12-wee', ''),
(24, 4113313, 4190007, '', '', '', '', '', '', 'if12-wee', ''),
(25, 4113313, 4119163, '', '', '', '', '', '', 'if12-wee', ''),
(26, 4113313, 4183408, '', '', '', '', '', '', 'if12-wee', ''),
(31, 4100000, 4100001, '1', '2', '0', '2', '2', '4', 'if12-axc', ''),
(32, 4100000, 4100002, '0', '2', '3', '2', '1', '0', 'if12-axc', ''),
(33, 4100000, 4100003, '0', '1', '1', '2', '1', '0', 'if12-axc', ''),
(34, 4100000, 4100004, '4', '4', '4', '3', '1', '0', 'if12-axc', ''),
(35, 4100000, 4100005, '1', '1', '1', '1', '0', '0', 'if12-axc', ''),
(36, 4100001, 4100005, '1', '3', '1', '2', '0', '0', 'if12-axc', ''),
(37, 4100001, 4100004, '0', '2', '1', '2', '0', '0', 'if12-axc', ''),
(38, 4100001, 4100003, '0', '1', '1', '2', '0', '0', 'if12-axc', ''),
(39, 4100001, 4100002, '0', '1', '1', '1', '0', '0', 'if12-axc', ''),
(40, 4100001, 4100000, '0', '4', '3', '1', '2', '0', 'if12-axc', ''),
(43, 4100002, 4100000, '1', '2', '3', '4', '0', '2', 'if12-axc', ''),
(44, 4100002, 4100001, '4', '2', '3', '4', '4', '2', 'if12-axc', ''),
(45, 4100002, 4100003, '0', '2', '3', '0', '2', '2', 'if12-axc', ''),
(46, 4100002, 4100004, '4', '0', '3', '1', '4', '2', 'if12-axc', ''),
(47, 4100002, 4100005, '4', '4', '4', '1', '4', '4', 'if12-axc', ''),
(48, 4100003, 4100000, '1', '3', '1', '0', '2', '2', 'if12-axc', ''),
(49, 4100003, 4100001, '1', '3', '1', '0', '2', '2', 'if12-axc', ''),
(50, 4100003, 4100002, '4', '4', '4', '4', '2', '2', 'if12-axc', ''),
(51, 4100003, 4100004, '4', '4', '4', '4', '4', '2', 'if12-axc', ''),
(52, 4100003, 4100005, '4', '4', '4', '4', '4', '4', 'if12-axc', ''),
(53, 4100004, 4100005, '1', '4', '4', '4', '4', '4', 'if12-axc', ''),
(54, 4100004, 4100003, '3', '2', '4', '4', '4', '4', 'if12-axc', ''),
(55, 4100004, 4100002, '3', '2', '1', '4', '1', '4', 'if12-axc', ''),
(56, 4100004, 4100001, '3', '2', '1', '1', '1', '4', 'if12-axc', ''),
(57, 4100004, 4100000, '0', '2', '1', '1', '1', '4', 'if12-axc', ''),
(58, 4100005, 4100000, '0', '4', '2', '3', '1', '4', 'if12-axc', ''),
(59, 4100005, 4100001, '0', '4', '2', '3', '1', '4', 'if12-axc', ''),
(60, 4100005, 4100002, '0', '2', '2', '3', '1', '4', 'if12-axc', ''),
(61, 4100005, 4100003, '4', '2', '2', '4', '1', '4', 'if12-axc', ''),
(62, 4100005, 4100004, '4', '3', '2', '4', '3', '4', 'if12-axc', ''),
(27, 4100000, 4100001, '0', '4', '1', '0', '1', '2', 'gp12-axc', 'He was alright'),
(29, 4100000, 4100002, '0', '1', '4', '3', '4', '1', 'gp12-axc', '');

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `SID` int(11) NOT NULL,
  `fullName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`SID`, `fullName`) VALUES
(22, 'hehe'),
(4100000, 'Austin'),
(4100001, 'Ryan'),
(4100002, 'Raffi'),
(4100003, 'Dan'),
(4100004, 'Ben'),
(4100005, 'Tom'),
(4102907, 'Mandla'),
(4113313, 'Ian Ashley'),
(4119163, 'Thomas'),
(4145983, 'Abdulrahman'),
(4160476, 'Adam'),
(4160923, 'Huda Khedr A M'),
(4163371, 'James'),
(4163682, 'Aiman Mohammedrida A'),
(4166495, 'Samuel Thomas'),
(4168579, 'Martin'),
(4169215, 'Luke'),
(4173622, 'Mark'),
(4176521, 'Miles'),
(4177303, 'Alastair'),
(4177627, 'Daniel Philip'),
(4177895, 'Yatman'),
(4178147, 'Jack'),
(4178259, 'Joseph'),
(4178366, 'Ezenwoko'),
(4178577, 'Paula Rebecca'),
(4178586, 'Karl'),
(4178676, 'Alexander James Lee'),
(4178861, 'Luke'),
(4179035, 'Thomas'),
(4179174, 'James Vivek'),
(4179303, 'Liam'),
(4179498, 'Philip'),
(4179640, 'Brad'),
(4179767, 'Jacob'),
(4179989, 'Prasun'),
(4179998, 'Fredric'),
(4180609, 'Justin David'),
(4180823, 'Rowan Seann'),
(4180914, 'Jamie'),
(4181024, 'Rehan'),
(4181031, 'James'),
(4181358, 'Lakhvir'),
(4181366, 'James'),
(4181791, 'Jordan Daniel'),
(4182123, 'Faisal'),
(4182166, 'Elliott Robert'),
(4182189, 'Addam'),
(4182199, 'Matthew Shane'),
(4182211, 'Colm'),
(4182212, 'Craig'),
(4182642, 'Haider Waseem'),
(4182658, 'Brendan'),
(4182668, 'William'),
(4182769, 'Stephen'),
(4182845, 'Hal'),
(4183012, 'Leigh-Anne'),
(4183052, 'Mert'),
(4183085, 'Elliot'),
(4183408, 'Thomas'),
(4183787, 'Jack'),
(4183850, 'Evan'),
(4183870, 'Daniel'),
(4184239, 'Frank'),
(4184256, 'Adam'),
(4184259, 'Samuel'),
(4184380, 'Julijanas'),
(4184598, 'Liam James'),
(4184606, 'Lawrence'),
(4184640, 'Vincent Arcadio Neville'),
(4185111, 'Nicholas'),
(4185137, 'Kristian'),
(4185276, 'Jordan'),
(4185338, 'William'),
(4185360, 'Oyedipo Daniel'),
(4185416, 'Martin Robert'),
(4185708, 'Edward'),
(4185801, 'Joseph David'),
(4185826, 'Chryzia Danica'),
(4186212, 'Sanjay'),
(4186441, 'Luke'),
(4186462, 'Paula Louise'),
(4186818, 'Amy Mayu'),
(4186925, 'Isaac'),
(4187730, 'Craig'),
(4187811, 'Charles Thomas'),
(4187816, 'Callum Daniel'),
(4188161, 'Alexander'),
(4188230, 'Matthew'),
(4188277, 'Steven John'),
(4188335, 'Harry'),
(4188678, 'Samuel'),
(4189314, 'Houman'),
(4189398, 'Thomas Mark'),
(4189432, 'Roshan'),
(4189481, 'Kamil Sebastian'),
(4189581, 'Steven'),
(4189651, 'Aaron Yik Ting'),
(4189671, 'Natalie Olivia Ellen'),
(4189726, 'Mingzhou'),
(4189730, 'Robert'),
(4189903, 'Alex'),
(4189956, 'Jack'),
(4190007, 'Terrel'),
(4190322, 'Adam'),
(4190341, 'Artur Grzegorz'),
(4191736, 'Burak'),
(4191906, 'Khaled Ali Salman Ahmed'),
(4192040, 'Harold'),
(4192199, 'Sam'),
(4192847, 'Jaravee'),
(4192901, 'Allan Kipkoech'),
(4193668, 'Yves'),
(4193839, 'Edwin'),
(4193878, 'Amurkhan'),
(4194039, 'Ipalibo'),
(4194779, 'Oluwatosin Olufemi'),
(4195148, 'Shayoke'),
(4195252, 'Muyu'),
(4195330, 'Duc Huy'),
(4195471, 'Siir'),
(4195618, 'Jia Shen'),
(4195651, 'Lee'),
(4195749, 'Jamie'),
(4195956, 'Matthew'),
(4444101, 'Daniel Morris'),
(4444102, 'Bobby Harris'),
(4444103, 'Tim Brown'),
(4444261, 'Blue Jones'),
(4444281, 'Larry Haines'),
(6666666, 'Yushin'),
(8888888, 'Jakub');

-- --------------------------------------------------------

--
-- Table structure for table `StudentModList`
--

CREATE TABLE `StudentModList` (
  `SID` int(11) NOT NULL,
  `MCode` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SID`,`MCode`),
  KEY `fk_studmod_mod` (`MCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `StudentModList`
--

INSERT INTO `StudentModList` (`SID`, `MCode`) VALUES
(4100000, 'G52GRP'),
(4100001, 'G52GRP'),
(4100002, 'G52GRP'),
(4100003, 'G52GRP'),
(4100004, 'G52GRP'),
(4100005, 'G52GRP'),
(4102907, 'G52IFR'),
(4113313, 'G52IFR');

-- --------------------------------------------------------

--
-- Table structure for table `StuGroup`
--

CREATE TABLE `StuGroup` (
  `SID` int(11) NOT NULL,
  `GName` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `IMark` int(11) DEFAULT NULL,
  `SComplete` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`SID`,`GName`),
  KEY `fk_studgroup_group` (`GName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

INSERT INTO `StuGroup` (`SID`, `GName`, `IMark`) VALUES
(4100000, 'gp12-axc', NULL),
(4100001, 'gp12-axc', NULL),
(4100002, 'gp12-axc', NULL),
(4100003, 'gp12-azn', NULL),
(4100004, 'gp12-azn', NULL),
(4100005, 'gp12-azn', NULL),
(4444101, 'lr12-him', NULL),
(4444102, 'ap12-axc', NULL),
(4444103, 'ap12-axc', NULL),
(4444261, 'ap12-yut', NULL),
(4444281, 'ap12-yut', NULL);

--
-- Table structure for table `Temp`
--

CREATE TABLE IF NOT EXISTS `Temp` (
  `SID` int(11) NOT NULL,
  `fullName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Groups`
--
ALTER TABLE `Groups`
  ADD CONSTRAINT `fk_grps_mod` FOREIGN KEY (`MCode`) REFERENCES `Modules` (`MCode`) ON DELETE CASCADE;

--
-- Constraints for table `PeerMark`
--
ALTER TABLE `PeerMark`
  ADD CONSTRAINT `fk_pmrk_grp` FOREIGN KEY (`GName`) REFERENCES `Groups` (`GName`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pmrk_stud1` FOREIGN KEY (`SID1`) REFERENCES `Student` (`SID`),
  ADD CONSTRAINT `fk_pmrk_stud2` FOREIGN KEY (`SID2`) REFERENCES `Student` (`SID`);

--
-- Constraints for table `StudentModList`
--
ALTER TABLE `StudentModList`
  ADD CONSTRAINT `fk_studmod_mod` FOREIGN KEY (`MCode`) REFERENCES `Modules` (`MCode`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_studmod_stud` FOREIGN KEY (`SID`) REFERENCES `Student` (`SID`);

--
-- Constraints for table `StuGroup`
--
ALTER TABLE `StuGroup`
  ADD CONSTRAINT `fk_studgroup_grp` FOREIGN KEY (`GName`) REFERENCES `Groups` (`GName`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_studgroup_stud` FOREIGN KEY (`SID`) REFERENCES `Student` (`SID`);
