-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 14, 2012 at 03:20 PM
-- Server version: 5.1.46
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `xxz12u`
--

-- --------------------------------------------------------

--
-- Table structure for table `Groups`
--

CREATE TABLE IF NOT EXISTS `Groups` (
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
('gp12-axc', NULL, NULL, 'G52GRP'),
('gp12-azn', NULL, NULL, 'G52GRP'),
('if12-axc', NULL, NULL, 'G52IFR'),
('if12-wee', NULL, NULL, 'G52IFR');

-- --------------------------------------------------------

--
-- Table structure for table `Modules`
--

CREATE TABLE IF NOT EXISTS `Modules` (
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
('G52PAS', 0.9);

-- --------------------------------------------------------

--
-- Table structure for table `PeerMark`
--

CREATE TABLE IF NOT EXISTS `PeerMark` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=31 ;

--
-- Dumping data for table `PeerMark`
--

INSERT INTO `PeerMark` (`PID`, `SID1`, `SID2`, `PResearch`, `PCreative`, `PCooperation`, `Pcommunication`, `PQuality`, `PAttendance`, `GName`, `PComment`) VALUES
(10, 4145983, 4119163, '0', '0', '0', '2', '0', '1', 'if12-axc', 'weqe'),
(11, 4102907, 4181358, '', '', '', '', '', '1', 'if12-axc', 'juy'),
(13, 4119163, 4177303, '', '', '', '', '', '', 'if12-wee', ''),
(14, 4102907, 4182199, '', '', '', '', '', '', 'if12-axc', ''),
(15, 4102907, 4183408, '', '', '', '', '', '', 'if12-axc', ''),
(16, 4102907, 4186818, '', '', '', '', '', '', 'if12-axc', ''),
(17, 4113313, 4186818, '', '', '', '', '', '', 'if12-axc', ''),
(18, 4113313, 4160476, '', '', '', '', '', '', 'if12-axc', ''),
(19, 4113313, 4189432, '', '', '', '', '', '', 'if12-axc', ''),
(24, 4113313, 4190007, '', '', '', '', '', '', 'if12-wee', ''),
(25, 4113313, 4119163, '', '', '', '', '', '', 'if12-wee', ''),
(26, 4113313, 4183408, '', '', '', '', '', '', 'if12-wee', ''),
(29, 4100000, 4100000, '', '', '', '', '', '', 'gp12-axc', ''),
(27, 4100000, 4100001, '0','4','1','0','1','2', 'gp12-axc',	'He was alright'),
(27, 4100000, 4100002, '0','1','1','0','3','4', 'gp12-axc',	'Meh');

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE IF NOT EXISTS `Student` (
  `SID` int(11) NOT NULL,
  `fullName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SComplete` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`SID`, `fullName`, `SComplete`) VALUES
(4100000, 'Austin', 'N'),
(4100001, 'Ryan', 'N'),
(4100002, 'Raffi', 'N'),
(4100003, 'Dan', 'N'),
(4100004, 'Ben', 'N'),
(4100005, 'Tom', 'N'),
(4102907, 'Mandla', 'Y'),
(4113313, 'Ian Ashley', 'Y'),
(4119163, 'Thomas', 'Y'),
(4145983, 'Abdulrahman', 'Y'),
(4160476, 'Adam', 'N'),
(4160923, 'Huda Khedr A M', 'N'),
(4163371, 'James', 'N'),
(4163682, 'Aiman Mohammedrida A', 'N'),
(4166495, 'Samuel Thomas', 'N'),
(4168579, 'Martin', 'N'),
(4169215, 'Luke', 'N'),
(4173622, 'Mark', 'N'),
(4176521, 'Miles', 'N'),
(4177303, 'Alastair', 'N'),
(4177627, 'Daniel Philip', 'N'),
(4177895, 'Yatman', 'N'),
(4178147, 'Jack', 'N'),
(4178259, 'Joseph', 'N'),
(4178366, 'Ezenwoko', 'N'),
(4178577, 'Paula Rebecca', 'N'),
(4178586, 'Karl', 'N'),
(4178676, 'Alexander James Lee', 'N'),
(4178861, 'Luke', 'N'),
(4179035, 'Thomas', 'N'),
(4179174, 'James Vivek', 'N'),
(4179303, 'Liam', 'N'),
(4179498, 'Philip', 'N'),
(4179640, 'Brad', 'N'),
(4179767, 'Jacob', 'N'),
(4179989, 'Prasun', 'N'),
(4179998, 'Fredric', 'N'),
(4180609, 'Justin David', 'N'),
(4180823, 'Rowan Seann', 'N'),
(4180914, 'Jamie', 'N'),
(4181024, 'Rehan', 'N'),
(4181031, 'James', 'N'),
(4181358, 'Lakhvir', 'N'),
(4181366, 'James', 'N'),
(4181791, 'Jordan Daniel', 'N'),
(4182123, 'Faisal', 'N'),
(4182166, 'Elliott Robert', 'N'),
(4182189, 'Addam', 'N'),
(4182199, 'Matthew Shane', 'N'),
(4182211, 'Colm', 'N'),
(4182212, 'Craig', 'N'),
(4182642, 'Haider Waseem', 'N'),
(4182658, 'Brendan', 'N'),
(4182668, 'William', 'N'),
(4182769, 'Stephen', 'N'),
(4182845, 'Hal', 'N'),
(4183012, 'Leigh-Anne', 'N'),
(4183052, 'Mert', 'N'),
(4183085, 'Elliot', 'N'),
(4183408, 'Thomas', 'N'),
(4183787, 'Jack', 'N'),
(4183850, 'Evan', 'N'),
(4183870, 'Daniel', 'N'),
(4184239, 'Frank', 'N'),
(4184256, 'Adam', 'N'),
(4184259, 'Samuel', 'N'),
(4184380, 'Julijanas', 'N'),
(4184598, 'Liam James', 'N'),
(4184606, 'Lawrence', 'N'),
(4184640, 'Vincent Arcadio Neville', 'N'),
(4185111, 'Nicholas', 'N'),
(4185137, 'Kristian', 'N'),
(4185276, 'Jordan', 'N'),
(4185338, 'William', 'N'),
(4185360, 'Oyedipo Daniel', 'N'),
(4185416, 'Martin Robert', 'N'),
(4185708, 'Edward', 'N'),
(4185801, 'Joseph David', 'N'),
(4185826, 'Chryzia Danica', 'N'),
(4186212, 'Sanjay', 'N'),
(4186441, 'Luke', 'N'),
(4186462, 'Paula Louise', 'N'),
(4186818, 'Amy Mayu', 'N'),
(4186925, 'Isaac', 'N'),
(4187730, 'Craig', 'N'),
(4187811, 'Charles Thomas', 'N'),
(4187816, 'Callum Daniel', 'N'),
(4188161, 'Alexander', 'N'),
(4188230, 'Matthew', 'N'),
(4188277, 'Steven John', 'N'),
(4188335, 'Harry', 'N'),
(4188678, 'Samuel', 'N'),
(4189314, 'Houman', 'N'),
(4189398, 'Thomas Mark', 'N'),
(4189432, 'Roshan', 'N'),
(4189481, 'Kamil Sebastian', 'N'),
(4189581, 'Steven', 'N'),
(4189651, 'Aaron Yik Ting', 'N'),
(4189671, 'Natalie Olivia Ellen', 'N'),
(4189726, 'Mingzhou', 'N'),
(4189730, 'Robert', 'N'),
(4189903, 'Alex', 'N'),
(4189956, 'Jack', 'N'),
(4190007, 'Terrel', 'N'),
(4190322, 'Adam', 'N'),
(4190341, 'Artur Grzegorz', 'N'),
(4191736, 'Burak', 'N'),
(4191906, 'Khaled Ali Salman Ahmed', 'N'),
(4192040, 'Harold', 'N'),
(4192199, 'Sam', 'N'),
(4192847, 'Jaravee', 'N'),
(4192901, 'Allan Kipkoech', 'N'),
(4193668, 'Yves', 'N'),
(4193839, 'Edwin', 'N'),
(4193878, 'Amurkhan', 'N'),
(4194039, 'Ipalibo', 'N'),
(4194779, 'Oluwatosin Olufemi', 'N'),
(4195148, 'Shayoke', 'N'),
(4195252, 'Muyu', 'N'),
(4195330, 'Duc Huy', 'N'),
(4195471, 'Siir', 'N'),
(4195618, 'Jia Shen', 'N'),
(4195651, 'Lee', 'N'),
(4195749, 'Jamie', 'N'),
(4195956, 'Matthew', 'N'),
(6666666, 'Yushin', 'N'),
(8888888, 'Jakub', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `StudentModList`
--

CREATE TABLE IF NOT EXISTS `StudentModList` (
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


CREATE TABLE IF NOT EXISTS `StuGroup` (
  `SID` int(11) NOT NULL,
  `GName` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `IMark` int(11) NULL,
  PRIMARY KEY (`SID`,`GName`),
  KEY `fk_studgroup_group` (`GName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO  `dxm01u`.`StuGroup` (`SID` ,`GName` ,`IMark`) VALUES 
(4100000, 'gp12-axc', ''),
(4100001, 'gp12-axc', ''),
(4100002, 'gp12-axc', ''),
(4100003, 'gp12-azn', ''),
(4100004, 'gp12-azn', ''),
(4100005, 'gp12-azn', ''),
(4444101, 'lr12-him', ''),
(4444102, 'ap12-axc', ''),
(4444103, 'ap12-axc', ''),
(4444261, 'ap12-yut', ''),
(4444281, 'ap12-yut', '');


--Add Temporary Table for storing CSV imports

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
  ADD CONSTRAINT `fk_pmrk_stud1` FOREIGN KEY (`SID1`) REFERENCES `Student` (`SID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pmrk_stud2` FOREIGN KEY (`SID2`) REFERENCES `Student` (`SID`) ON DELETE CASCADE;

--
-- Constraints for table `StudentModList`
--
ALTER TABLE `StudentModList`
  ADD CONSTRAINT `fk_studmod_stud` FOREIGN KEY (`SID`) REFERENCES `Student` (`SID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_studmod_mod` FOREIGN KEY (`MCode`) REFERENCES `Modules` (`MCode`) ON DELETE CASCADE;
  
 ALTER TABLE `StuGroup`
  ADD CONSTRAINT `fk_studgroup_stud` FOREIGN KEY (`SID`) REFERENCES `Student` (`SID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_studgroup_grp` FOREIGN KEY (`GName`) REFERENCES `Groups` (`GName`) ON DELETE CASCADE;
