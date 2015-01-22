-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 13, 2012 at 03:06 PM
-- Server version: 5.1.46
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rht01u`
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
('gp12-axc', NULL, NULL, 'G52GRP'),
('gp12-azn', NULL, NULL, 'G52GRP');

-- --------------------------------------------------------

--
-- Table structure for table `Modules`
--

CREATE TABLE IF NOT EXISTS `Modules` (
  `MCode` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `Weighting` int(11) NOT NULL,
  PRIMARY KEY (`MCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Modules`
--

INSERT INTO `Modules` (`MCode`, `Weighting`) VALUES
('G52GRP', 16);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `PeerMark`
--

INSERT INTO `PeerMark` (`PID`, `SID1`, `SID2`, `PResearch`, `PCreative`, `PCooperation`, `Pcommunication`, `PQuality`, `PAttendance`, `GName`, `PComment`) VALUES
(1, 2345678, 1234567, '4', '2', '1', '3', '2', '2', 'gp12-axc', 'ewaeewawewa');

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE IF NOT EXISTS `Student` (
  `SID` int(11) NOT NULL,
  `fullName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SComplete` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`SID`, `fullName`, `SComplete`) VALUES
(1234567, 'John Doe', NULL),
(2345678, 'Jane Doe', NULL),
(3456789, 'Aaron Aaronson', NULL),
(4567890, 'Thomas Anderson', NULL),
(5678901, 'Inigo Montoya', NULL);

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
(1234567, 'G52GRP'),
(2345678, 'G52GRP');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Groups`
--
ALTER TABLE `Groups`
  ADD CONSTRAINT `fk_grps_mod` FOREIGN KEY (`MCode`) REFERENCES `Modules` (`MCode`);

--
-- Constraints for table `PeerMark`
--
ALTER TABLE `PeerMark`
  ADD CONSTRAINT `fk_pmrk_grp` FOREIGN KEY (`GName`) REFERENCES `Groups` (`GName`),
  ADD CONSTRAINT `fk_pmrk_stud1` FOREIGN KEY (`SID1`) REFERENCES `Student` (`SID`),
  ADD CONSTRAINT `fk_pmrk_stud2` FOREIGN KEY (`SID2`) REFERENCES `Student` (`SID`);

--
-- Constraints for table `StudentModList`
--
ALTER TABLE `StudentModList`
  ADD CONSTRAINT `fk_studmod_stud` FOREIGN KEY (`SID`) REFERENCES `Student` (`SID`),
  ADD CONSTRAINT `fk_studmod_mod` FOREIGN KEY (`MCode`) REFERENCES `Modules` (`MCode`);
