-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 04, 2018 at 01:22 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbentc`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblaccount`
--

DROP TABLE IF EXISTS `tblaccount`;
CREATE TABLE IF NOT EXISTS `tblaccount` (
  `intAccountID` int(11) NOT NULL AUTO_INCREMENT,
  `intAUserID` int(11) NOT NULL,
  `strAUsername` varchar(45) DEFAULT NULL,
  `strAPassword` varchar(45) DEFAULT NULL,
  `intAStatusID` int(11) DEFAULT NULL,
  `intAUserTypeID` int(11) NOT NULL,
  PRIMARY KEY (`intAccountID`),
  KEY `fk_tbladmin_tbluserinfo1_idx` (`intAUserID`),
  KEY `fk_tblaccount_tblstatus1_idx` (`intAStatusID`),
  KEY `fk_tblaccount_tblusertype1_idx` (`intAUserTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblaccount`
--

INSERT INTO `tblaccount` (`intAccountID`, `intAUserID`, `strAUsername`, `strAPassword`, `intAStatusID`, `intAUserTypeID`) VALUES
(1, 1, 'admin', 'admin', 1, 1),
(2, 2, 'reign', 'reign123', 1, 2),
(3, 3, 'kazukun', '5436', 1, 2),
(4, 4, 'mailchan', '9876', 1, 2),
(22, 17, 'emman', 'reign123', 1, 2),
(23, 18, 'espie', 'espie', 1, 2),
(24, 19, 'sana', 'sana', 1, 2),
(25, 20, 'moguri', 'jiritjirit', 1, 2),
(26, 21, 'numbernine', 'nine', 1, 2),
(27, 22, 'numbernine', 'numbernine', 1, 2),
(28, 23, 'minari', 'password', 1, 2),
(29, 24, 'kyungwan', 'password', 1, 2),
(30, 25, 'ccna', 'test', 1, 2),
(31, 26, 'ccnptest', 'ccnptest', 1, 2),
(32, 27, 'cybersectest@gmail.com', 'password', 1, 2),
(33, 28, 'cybersecu', 'cybersecu', 1, 2),
(34, 29, 'ccnatestu', 'ccnatestu', 1, 2),
(35, 30, 'joshua', 'ganila', 1, 2),
(36, 31, 'sendo123', 'sendo123', 1, 2),
(50, 32, 'jon', 'jon', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tblactivities`
--

DROP TABLE IF EXISTS `tblactivities`;
CREATE TABLE IF NOT EXISTS `tblactivities` (
  `intActID` int(11) NOT NULL AUTO_INCREMENT,
  `strActDesc` varchar(45) DEFAULT NULL,
  `intAStatusID` int(11) DEFAULT NULL,
  PRIMARY KEY (`intActID`),
  KEY `fk_tblschedact_tblstatus1_idx` (`intAStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblactivities`
--

INSERT INTO `tblactivities` (`intActID`, `strActDesc`, `intAStatusID`) VALUES
(1, 'Lecture', 1),
(2, 'Hands-on CLI', 1),
(3, 'Hands-on Equipments', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblattachment`
--

DROP TABLE IF EXISTS `tblattachment`;
CREATE TABLE IF NOT EXISTS `tblattachment` (
  `intAttachmentID` int(11) NOT NULL AUTO_INCREMENT,
  `strAFile` varchar(80) NOT NULL,
  `intAStatusID` int(11) DEFAULT NULL,
  PRIMARY KEY (`intAttachmentID`),
  KEY `fk_tblattachment_tblstatus1_idx` (`intAStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblattachment`
--

INSERT INTO `tblattachment` (`intAttachmentID`, `strAFile`, `intAStatusID`) VALUES
(1, 'document/modules', 1),
(2, 'document/quizzes/quiz1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblcompanydet`
--

DROP TABLE IF EXISTS `tblcompanydet`;
CREATE TABLE IF NOT EXISTS `tblcompanydet` (
  `intCompDetID` int(11) NOT NULL AUTO_INCREMENT,
  `strCDAccNum` varchar(25) DEFAULT NULL,
  `strCDAccName` varchar(50) DEFAULT NULL,
  `intCDStatus` int(11) DEFAULT NULL,
  `strBankName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`intCompDetID`),
  KEY `fk_tblcompanydet_tblstatus1_idx` (`intCDStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblcompanydet`
--

INSERT INTO `tblcompanydet` (`intCompDetID`, `strCDAccNum`, `strCDAccName`, `intCDStatus`, `strBankName`) VALUES
(1, '004020-0066-47', ' EYENET TRAINING CENTER', 1, 'BANK OF THE PHILIPPINE ISLANDS (BPI)');

-- --------------------------------------------------------

--
-- Table structure for table `tblcourse`
--

DROP TABLE IF EXISTS `tblcourse`;
CREATE TABLE IF NOT EXISTS `tblcourse` (
  `intCID` int(11) NOT NULL AUTO_INCREMENT,
  `strCName` varchar(45) NOT NULL,
  `strCDetails` text,
  `intCAttachID` int(11) DEFAULT NULL,
  `fltCFee` float NOT NULL,
  `intCStatusID` int(11) DEFAULT NULL,
  PRIMARY KEY (`intCID`),
  KEY `fk_tblcourse_tblattachment1_idx` (`intCAttachID`),
  KEY `fk_tblcourse_tblstatus1_idx` (`intCStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblcourse`
--

INSERT INTO `tblcourse` (`intCID`, `strCName`, `strCDetails`, `intCAttachID`, `fltCFee`, `intCStatusID`) VALUES
(1, 'CCNA', 'Cisco Certified Network Associate', NULL, 10000, 1),
(2, 'CCNP', 'Cisco Certified Network Professional', NULL, 15000, 1),
(3, 'Cyber Sec', 'Cyber Security', NULL, 1600, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbldocuconfirm`
--

DROP TABLE IF EXISTS `tbldocuconfirm`;
CREATE TABLE IF NOT EXISTS `tbldocuconfirm` (
  `intDocuConfirm` int(11) NOT NULL AUTO_INCREMENT,
  `intDCAttachID` int(11) NOT NULL,
  `strDCDetails` text,
  `intDCDocuRequestID` int(11) NOT NULL,
  `intDCStatusID` int(11) DEFAULT NULL,
  PRIMARY KEY (`intDocuConfirm`),
  KEY `fk_tbldocuconfirm_tblAttachment1_idx` (`intDCAttachID`),
  KEY `fk_tbldocuconfirm_tbldocurequest1_idx` (`intDCDocuRequestID`),
  KEY `fk_tbldocuconfirm_tblstatus1_idx` (`intDCStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbldocuconfirm`
--

INSERT INTO `tbldocuconfirm` (`intDocuConfirm`, `intDCAttachID`, `strDCDetails`, `intDCDocuRequestID`, `intDCStatusID`) VALUES
(1, 1, 'Approved Request on the Modules', 1, 2),
(2, 2, 'Approved Request on the copy of quizzes', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbldocurequest`
--

DROP TABLE IF EXISTS `tbldocurequest`;
CREATE TABLE IF NOT EXISTS `tbldocurequest` (
  `intDocuRequestID` int(11) NOT NULL AUTO_INCREMENT,
  `intDRUserID` int(11) NOT NULL,
  `strDRName` varchar(45) DEFAULT NULL,
  `intDRStatusID` int(11) DEFAULT NULL,
  PRIMARY KEY (`intDocuRequestID`),
  KEY `fk_tbldocurequest_tbluser1_idx` (`intDRUserID`),
  KEY `fk_tbldocurequest_tblstatus1_idx` (`intDRStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbldocurequest`
--

INSERT INTO `tbldocurequest` (`intDocuRequestID`, `intDRUserID`, `strDRName`, `intDRStatusID`) VALUES
(1, 2, 'Modules', 1),
(2, 3, 'Quizzes', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tblequipments`
--

DROP TABLE IF EXISTS `tblequipments`;
CREATE TABLE IF NOT EXISTS `tblequipments` (
  `intEquipID` int(11) NOT NULL AUTO_INCREMENT,
  `strEDesc` varchar(45) DEFAULT NULL,
  `strEState` varchar(45) DEFAULT NULL,
  `intEEquipTypeID` int(11) NOT NULL,
  `intEPieces` int(11) NOT NULL,
  `intEUserID` int(11) NOT NULL,
  `intEStatusID` int(11) DEFAULT NULL,
  PRIMARY KEY (`intEquipID`),
  KEY `fk_tblequipments_tbletype1_idx` (`intEEquipTypeID`),
  KEY `fk_tblequipments_tbluser1_idx` (`intEUserID`),
  KEY `fk_tblequipments_tblstatus1_idx` (`intEStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblequipments`
--

INSERT INTO `tblequipments` (`intEquipID`, `strEDesc`, `strEState`, `intEEquipTypeID`, `intEPieces`, `intEUserID`, `intEStatusID`) VALUES
(1, '1841', 'Working', 2, 10, 1, 1),
(2, '2900', 'Working', 1, 12, 1, 1),
(3, '1841', 'Not Working', 2, 5, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblequiptype`
--

DROP TABLE IF EXISTS `tblequiptype`;
CREATE TABLE IF NOT EXISTS `tblequiptype` (
  `intEquipTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `strETName` varchar(45) DEFAULT NULL,
  `intETStatusID` int(11) DEFAULT NULL,
  PRIMARY KEY (`intEquipTypeID`),
  KEY `fk_tblequiptype_tblstatus1_idx` (`intETStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblequiptype`
--

INSERT INTO `tblequiptype` (`intEquipTypeID`, `strETName`, `intETStatusID`) VALUES
(1, 'Switch', 1),
(2, 'Router', 1),
(3, 'VoIP', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblinquiry`
--

DROP TABLE IF EXISTS `tblinquiry`;
CREATE TABLE IF NOT EXISTS `tblinquiry` (
  `intInquiryID` int(11) NOT NULL AUTO_INCREMENT,
  `datIDate` date DEFAULT NULL,
  `strISubject` varchar(45) DEFAULT NULL,
  `strGuestName` varchar(45) DEFAULT NULL,
  `strGuestEmail` varchar(45) DEFAULT NULL,
  `strIMessage` text,
  `intIStatusID` int(11) DEFAULT NULL,
  PRIMARY KEY (`intInquiryID`),
  UNIQUE KEY `intInquirySchedID_UNIQUE` (`strISubject`),
  KEY `fk_tblinquiry_tblstatus1_idx` (`intIStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblinquiry`
--

INSERT INTO `tblinquiry` (`intInquiryID`, `datIDate`, `strISubject`, `strGuestName`, `strGuestEmail`, `strIMessage`, `intIStatusID`) VALUES
(1, '2018-01-01', 'Inquire about promo package', 'Kotaro', 'kotarochancutie12@gmail.com', 'Hi! I am calling your landline but no one is answering. Mag-iinquire lang sana ako about sa course outline nyo and ano inclusives ng course package nyo.', 3),
(2, '2018-01-10', 'Available schedule on March', 'Ryuu', 'ryuuniichan@gmail.com', 'Hello, may available slots na po ba for the month of March', 4),
(3, '2018-02-16', 'Enrollment Details', 'Inno', 'Inooneechama@gmail.com', 'Hi may I ask about the enrollment details and processing before ako mag-enroll? May iclaclarify lang sana ako.', 2),
(4, '2018-02-22', 'Cyber Security Training', 'Takuma', 'takumakun@gmail.com', 'Hi! Ask ko lang po if may naset na po kayong date for Cyber Security for the month of April?', 1),
(5, '2018-02-24', 'Reign Enrollment', 'Reign', 'r_em11.malto@yahoo.com', 'enroll enroll enroll', NULL),
(6, NULL, '', 'tagafklja;slfj;', '', '', NULL),
(7, NULL, 'CCNA', 'Joshua Ganila', 'ganilajoshua@gmail.com', 'ano po?', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tblinquirylist`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `tblinquirylist`;
CREATE TABLE IF NOT EXISTS `tblinquirylist` (
`intInquiryID` int(11)
,`strISubject` varchar(45)
,`strGuestName` varchar(45)
,`strIMessage` text
,`intIStatusID` int(11)
,`datIDate` varchar(72)
);

-- --------------------------------------------------------

--
-- Table structure for table `tblmessage`
--

DROP TABLE IF EXISTS `tblmessage`;
CREATE TABLE IF NOT EXISTS `tblmessage` (
  `intMessageID` int(11) NOT NULL AUTO_INCREMENT,
  `intMSender` int(11) NOT NULL,
  `intMReceiver` int(11) NOT NULL,
  `strMSubject` varchar(45) DEFAULT NULL,
  `strMessage` text,
  `datMDate` date DEFAULT NULL,
  `intMAttachID` int(11) DEFAULT NULL,
  `intMStatusID` int(11) DEFAULT NULL,
  PRIMARY KEY (`intMessageID`),
  KEY `fk_tblmessage_tbluser1_idx` (`intMSender`),
  KEY `fk_tblmessage_tbluser2_idx` (`intMReceiver`),
  KEY `fk_tblmessage_tblAttachment1_idx` (`intMAttachID`),
  KEY `fk_tblmessage_tblstatus1_idx` (`intMStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmessage`
--

INSERT INTO `tblmessage` (`intMessageID`, `intMSender`, `intMReceiver`, `strMSubject`, `strMessage`, `datMDate`, `intMAttachID`, `intMStatusID`) VALUES
(1, 1, 2, 'Welcome!', 'This is Eyenet Training Center if you have concerns over something you can ask us anything about your concerns. Thanks!', '2018-01-22', NULL, 4),
(2, 2, 1, 'About CCNA', 'Hi! I just want to ask if you could be giving the quizzes yesterday, I was absent due to personal reasons. Thanks', '2018-01-22', NULL, 3),
(3, 1, 2, 'Confirmation', 'Sure thing ma\'am. We\'ll attach it here. ', '2018-01-22', 2, 2),
(4, 2, 1, '', 'Got it. Thanks', '2018-01-23', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblpayment`
--

DROP TABLE IF EXISTS `tblpayment`;
CREATE TABLE IF NOT EXISTS `tblpayment` (
  `intPaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `intPCompanyDetID` int(11) DEFAULT NULL,
  `intPSchedID` int(11) NOT NULL,
  `intPPayType` int(11) NOT NULL,
  `datPDate` date DEFAULT NULL,
  `strPDetails` text,
  `fltPayment` float DEFAULT NULL,
  `intPStatusID` int(11) DEFAULT NULL,
  PRIMARY KEY (`intPaymentID`),
  KEY `fk_tblstudent_tblpayment1_idx` (`intPCompanyDetID`),
  KEY `fk_tblpayment_tblsched1_idx` (`intPSchedID`),
  KEY `fk_tblpayment_tblPayType1_idx` (`intPPayType`),
  KEY `fk_tblpayment_tblstatus1_idx` (`intPStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblpayment`
--

INSERT INTO `tblpayment` (`intPaymentID`, `intPCompanyDetID`, `intPSchedID`, `intPPayType`, `datPDate`, `strPDetails`, `fltPayment`, `intPStatusID`) VALUES
(1, 1, 1, 1, '2018-01-08', 'Will be paid in the bank', 1200, 2),
(2, 1, 2, 2, '2018-01-05', 'Installment fee for the course', 5000, 1),
(3, 1, 1, 3, '2018-01-13', 'Full tuition fee ', 10000, 3),
(4, 1, 3, 1, '2018-02-08', 'Reservation fee via bank', 2000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblpaytype`
--

DROP TABLE IF EXISTS `tblpaytype`;
CREATE TABLE IF NOT EXISTS `tblpaytype` (
  `intPayTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `strPayTypeName` varchar(45) DEFAULT NULL,
  `intPTStatusID` int(11) DEFAULT NULL,
  PRIMARY KEY (`intPayTypeID`),
  KEY `fk_tblPayType_tblstatus1_idx` (`intPTStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblpaytype`
--

INSERT INTO `tblpaytype` (`intPayTypeID`, `strPayTypeName`, `intPTStatusID`) VALUES
(1, 'Reservation', 1),
(2, 'Installment', 1),
(3, 'Full', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblproctor`
--

DROP TABLE IF EXISTS `tblproctor`;
CREATE TABLE IF NOT EXISTS `tblproctor` (
  `intProctorID` int(11) NOT NULL AUTO_INCREMENT,
  `strProctorName` varchar(80) DEFAULT NULL,
  `strPConNum` varchar(20) DEFAULT NULL,
  `intProcStatusID` int(11) DEFAULT NULL,
  PRIMARY KEY (`intProctorID`),
  KEY `fk_tblproctor_tblstatus1_idx` (`intProcStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblproctor`
--

INSERT INTO `tblproctor` (`intProctorID`, `strProctorName`, `strPConNum`, `intProcStatusID`) VALUES
(1, 'Prof. Mc. Jyronn Medina', '09234585312', 1),
(2, 'Prof. Aris Palumbarit', '09234954720', 1),
(3, 'Prof. Dino Myer', '09348573919', 1),
(4, 'Prof. Garry Del Mundo', '09853853289', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblsched`
--

DROP TABLE IF EXISTS `tblsched`;
CREATE TABLE IF NOT EXISTS `tblsched` (
  `intSchedID` int(11) NOT NULL AUTO_INCREMENT,
  `strSDesc` varchar(45) DEFAULT NULL,
  `datStartDate` date DEFAULT NULL,
  `datEndDate` date DEFAULT NULL,
  `strSRemarks` text,
  `intSCourseID` int(11) NOT NULL,
  `intSStatusID` int(11) NOT NULL,
  `intProctorID` int(11) DEFAULT NULL,
  PRIMARY KEY (`intSchedID`),
  KEY `fk_tblsched_tblcourse1_idx` (`intSCourseID`),
  KEY `fk_tblsched_tblproctor1_idx` (`intProctorID`),
  KEY `fk_tblsched_tblstatus1_idx` (`intSStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblsched`
--

INSERT INTO `tblsched` (`intSchedID`, `strSDesc`, `datStartDate`, `datEndDate`, `strSRemarks`, `intSCourseID`, `intSStatusID`, `intProctorID`) VALUES
(1, 'ccna-class1', '2018-01-07', '2018-02-04', 'First Sunday Batch of the Year 2018', 1, 2, 1),
(2, 'ccna-class2', '2018-02-11', '2018-03-11', 'Slots Completed', 1, 4, 2),
(3, 'ccnp-class1', '2018-03-10', '2018-04-07', '3 slots available', 2, 1, 3),
(4, 'cybersec-class1', '2018-02-26', '2018-03-02', 'Cancelled', 3, 7, 2),
(5, 'ccna-class3', '2018-02-25', '2018-02-15', 'CCNA Final', 1, 1, 1),
(6, 'ccna-class4', '2018-02-25', '2018-02-25', 'Remarks', 1, 1, 1),
(7, 'ccna-class5', '2018-02-25', '2018-02-25', 'MAmamamamama', 1, 1, 1),
(8, 'CCNA - Class 6', '2018-03-03', '2018-03-04', 'Description', 1, 3, 1),
(9, 'zzzz', '2018-01-01', '2018-02-20', 'zxcxc', 1, 1, 1),
(10, 'Cybersec Class 4', '2018-01-01', '2020-03-02', 'no Remarks', 3, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tblschedact`
--

DROP TABLE IF EXISTS `tblschedact`;
CREATE TABLE IF NOT EXISTS `tblschedact` (
  `intSchedActID` int(11) NOT NULL AUTO_INCREMENT,
  `intSASchedID` int(11) DEFAULT NULL,
  `intSAActivitiesID` int(11) DEFAULT NULL,
  `strSADetails` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`intSchedActID`),
  KEY `fk_tblschedact_tblsched_idx` (`intSASchedID`),
  KEY `fk_tblschedact_tblact1_idx` (`intSAActivitiesID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblschedact`
--

INSERT INTO `tblschedact` (`intSchedActID`, `intSASchedID`, `intSAActivitiesID`, `strSADetails`) VALUES
(1, 1, 1, '2 days Lecture'),
(2, 1, 2, '1 and a half of a day Hands-on(CLI)'),
(3, 1, 3, '1 and a half day Hands-on(Equipments) '),
(4, 2, 1, '3 days lecture'),
(5, 2, 2, '2 days hands-on(CLI)'),
(6, 3, 1, '3 days Lecture'),
(7, 3, 3, '2 days Hands-on (Equipment)'),
(8, 1, 1, 'Lecture 3'),
(9, 3, 3, ''),
(10, 3, 3, 'Hands ooo'),
(11, 1, 1, 'ssss'),
(12, 1, 1, 'ssss'),
(13, 1, 1, 'ssss'),
(14, 1, 1, 'ssss'),
(15, 1, 1, 'ssss'),
(16, 1, 1, 'ssss'),
(17, 1, 3, 'ssss'),
(18, 10, 2, 'Hands off');

-- --------------------------------------------------------

--
-- Table structure for table `tblschedline`
--

DROP TABLE IF EXISTS `tblschedline`;
CREATE TABLE IF NOT EXISTS `tblschedline` (
  `intSchedListID` int(11) NOT NULL AUTO_INCREMENT,
  `strSchedListDesc` varchar(45) DEFAULT NULL,
  `intSLSchedID` int(11) DEFAULT NULL,
  `intSLUserID` int(11) DEFAULT NULL,
  PRIMARY KEY (`intSchedListID`),
  KEY `fk_tblschedline_tbluser1_idx` (`intSLUserID`),
  KEY `fk_tblschedline_tblsched_idx` (`intSLSchedID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblschedline`
--

INSERT INTO `tblschedline` (`intSchedListID`, `strSchedListDesc`, `intSLSchedID`, `intSLUserID`) VALUES
(1, 'Stud1-Sched1', 1, 2),
(2, 'Stud1-Sched2', 2, 3),
(3, 'Stud1-Sched3', 3, 4),
(4, 'reign', 1, 1),
(5, 'ccna', 5, 23),
(6, 'ccna', 2, 24),
(7, 'ccna for 25', 7, 25),
(8, 'ccnp for 26', 3, 26),
(9, 'cybersec for 27', 4, 27),
(10, 'cybersec for 28', 4, 28),
(11, 'ccna for 29', 8, 29),
(12, 'ccna for 30', 5, 30),
(13, 'cybersec for 31', 4, 31),
(17, 'cybersec for 32', 10, 32);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tblschedlist`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `tblschedlist`;
CREATE TABLE IF NOT EXISTS `tblschedlist` (
`intSchedID` int(11)
,`strCName` varchar(45)
,`strCDetails` text
,`strSDesc` varchar(45)
,`strStatusDesc` varchar(50)
,`datStartDate` varchar(72)
,`datEndDate` varchar(72)
,`strSRemarks` text
,`strStatusColor` varchar(45)
,`strProctorName` varchar(80)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tblschedview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `tblschedview`;
CREATE TABLE IF NOT EXISTS `tblschedview` (
`intSchedID` int(11)
,`strSDesc` varchar(45)
,`datStartDate` varchar(72)
,`datEndDate` varchar(72)
,`strSRemarks` text
,`intSCourseID` int(11)
,`intSStatusID` int(11)
,`intProctorID` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `tblstatus`
--

DROP TABLE IF EXISTS `tblstatus`;
CREATE TABLE IF NOT EXISTS `tblstatus` (
  `intStatusID` int(11) NOT NULL AUTO_INCREMENT,
  `strStatusDesc` varchar(50) DEFAULT NULL,
  `strStatusColor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`intStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblstatus`
--

INSERT INTO `tblstatus` (`intStatusID`, `strStatusDesc`, `strStatusColor`) VALUES
(1, 'Active', 'green label'),
(2, 'Inactive', 'black label'),
(3, 'Pending', 'orange label'),
(4, 'Ongoing', 'blue label'),
(5, 'Paid with Remaining Balance', 'olive label'),
(6, 'Fully paid', 'green label'),
(7, 'Cancelled', 'red label');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

DROP TABLE IF EXISTS `tbluser`;
CREATE TABLE IF NOT EXISTS `tbluser` (
  `intUserID` int(11) NOT NULL AUTO_INCREMENT,
  `strUFName` varchar(45) NOT NULL,
  `strUMName` varchar(45) DEFAULT NULL,
  `strULName` varchar(45) NOT NULL,
  `strUMobNum` varchar(16) DEFAULT NULL,
  `strUTelNum` varchar(9) DEFAULT NULL,
  `strUEmail` varchar(45) DEFAULT NULL,
  `datUBirthday` date DEFAULT NULL,
  `intUPaymentID` int(11) DEFAULT NULL,
  `intUInquiryID` int(11) DEFAULT NULL,
  `intUStatusID` int(11) DEFAULT NULL,
  `intUDocuConfirmID` int(11) DEFAULT NULL,
  `intUSchedID` int(11) DEFAULT NULL,
  PRIMARY KEY (`intUserID`),
  UNIQUE KEY `intUserInfoMobNum_UNIQUE` (`strUMobNum`),
  KEY `fk_tbluserinfo_tblInquiry1_idx` (`intUInquiryID`),
  KEY `fk_tbluser_tblpayment1_idx` (`intUPaymentID`),
  KEY `fk_tbluser_tbldocuconfirm1_idx` (`intUDocuConfirmID`),
  KEY `fk_tbluser_tblstatus1_idx` (`intUStatusID`),
  KEY `fk_tbluser_tblsched1_idx` (`intUSchedID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`intUserID`, `strUFName`, `strUMName`, `strULName`, `strUMobNum`, `strUTelNum`, `strUEmail`, `datUBirthday`, `intUPaymentID`, `intUInquiryID`, `intUStatusID`, `intUDocuConfirmID`, `intUSchedID`) VALUES
(1, 'Care', 'Bear', 'Cutie', '09345678912', '9876543', 'qwerty12345@gmail.com', '1998-03-09', NULL, NULL, 1, NULL, NULL),
(2, 'Aira', 'Collins', 'Smith', '09123456789', '1234567', 'qwerty@gmail.com', '1989-07-22', 1, 1, 1, 1, NULL),
(3, 'Kazuma', 'Ayuzawa', 'Hiroshi', '09751234561', '6723418', 'meowchan@yahoo.com', '1994-02-01', 2, NULL, 2, 2, NULL),
(4, 'Hance', 'Stanford', 'Pressman', '09128765493', '7508020', 'mailchan@rocketmail.com', '1996-05-21', 4, 2, 1, 1, NULL),
(5, 'Reign Emmanuel', 'Orillosa', 'Malto', '09286519686', '3681590', 'reignshirley@gmail.com', '1999-04-11', NULL, NULL, 1, NULL, NULL),
(16, 'Shirley Anne ', 'Valencia ', 'Tianan ', '09127546259', '3865190', 'anne.tianan@gmai.com', '1998-06-12', NULL, NULL, 1, NULL, NULL),
(17, 'Emmanuel', 'Orillosa', 'Reign', '0924907918', '3865190', 'ermalto110@gmail.com', '1999-04-11', NULL, NULL, 1, NULL, NULL),
(18, 'Esperanza', 'Orillosa', 'Malto', '09124555566', '5369018', 'esperanza@yahoo.com.ph', '1970-06-10', NULL, NULL, 1, NULL, NULL),
(19, 'Sana', '', 'Minatozaki', '09121113333', '1537598', 'sanachang@gmail.com', '1996-12-26', NULL, NULL, 1, NULL, NULL),
(20, 'Momoring', '', 'Hirai', '09125556666', '1234659', 'moguri@gmail.com', '1996-11-11', NULL, NULL, 1, NULL, NULL),
(21, 'Nayeon', '', 'Im', '09107591532', '3214867', 'imnayeon@gmail.com', '1995-04-15', NULL, NULL, 1, NULL, NULL),
(22, 'Nayeon', '', 'Im', '09101537594', '7591534', 'imnayeon@gmail.com', '1999-01-19', NULL, NULL, 1, NULL, NULL),
(23, 'Mina', 'Sharon', 'Myoui', '0987654321', '1475963', 'minari@yahoo.com', '1996-11-01', NULL, NULL, 1, NULL, NULL),
(24, 'Jungyeon', '', 'Yoo', '09123965478', '9632147', 'kyung@yahoo.com', '1996-11-01', NULL, NULL, 1, NULL, NULL),
(25, 'CCNA test', 'CCNA test', 'ccna Test', '09102684071', '1532167', 'ccnatest@yahoo.com', '1999-11-04', NULL, NULL, 1, NULL, NULL),
(26, 'CCNP Test', 'CCNP Test', 'CCNP Test', '09104864071', '0321578', 'ccnptest@gmail.com', '1999-04-11', NULL, NULL, 1, NULL, NULL),
(27, 'Cybersec Test', 'Cybersec Test', 'Cybersec Test', '09104564071', '0411186', 'cybersectest@gmail.com', '1999-11-04', NULL, NULL, 1, NULL, NULL),
(28, 'Cybersec test user', 'Cybersec test user', 'Cybersec test user', '09970079999', '0445566', 'cybersectestuser@gmail.com', '1999-11-01', NULL, NULL, 1, NULL, NULL),
(29, 'ccna test user', 'ccna test user', 'ccna test user', '09124907888', '3845967', 'ccnatestu@yahoo.com', '1999-11-01', NULL, NULL, 1, NULL, NULL),
(30, 'Joshua', 'Jamarolin', 'Ganila', '09272783766', '', 'ganilajoshua@gmail.com', '1999-01-10', NULL, NULL, 1, NULL, NULL),
(31, 'Sendo', '', 'De Guia', '', '', 'sendo@gmail.com', '2000-02-22', NULL, NULL, 1, NULL, NULL),
(32, 'Jon Loven', 'Albano', 'Bunque', '09199691903', '0323232', 'jon@xyz.com', '1998-04-28', NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tblusercoursedetails`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `tblusercoursedetails`;
CREATE TABLE IF NOT EXISTS `tblusercoursedetails` (
`intSLUserID` int(11)
,`strUFName` varchar(45)
,`strULName` varchar(45)
,`strUMName` varchar(45)
,`strUMobNum` varchar(16)
,`strUTelNum` varchar(9)
,`strUEmail` varchar(45)
,`datUBirthday` date
,`strSchedListDesc` varchar(45)
,`strCName` varchar(45)
,`strCDetails` text
,`intSchedID` int(11)
,`strSDesc` varchar(45)
,`datStartDate` date
,`datEndDate` date
);

-- --------------------------------------------------------

--
-- Table structure for table `tblusertype`
--

DROP TABLE IF EXISTS `tblusertype`;
CREATE TABLE IF NOT EXISTS `tblusertype` (
  `intUserTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `strUTName` varchar(45) NOT NULL,
  `intUTStatusID` int(11) DEFAULT NULL,
  PRIMARY KEY (`intUserTypeID`),
  KEY `fk_tblusertype_tblstatus1_idx` (`intUTStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblusertype`
--

INSERT INTO `tblusertype` (`intUserTypeID`, `strUTName`, `intUTStatusID`) VALUES
(1, 'Admin', 1),
(2, 'User', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vcoursesched`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vcoursesched`;
CREATE TABLE IF NOT EXISTS `vcoursesched` (
`intSCourseID` int(11)
,`strSDesc` varchar(45)
,`datStartDate` date
,`datEndDate` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vscheduserd`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vscheduserd`;
CREATE TABLE IF NOT EXISTS `vscheduserd` (
`intSLUserID` int(11)
,`strUFName` varchar(45)
,`strULName` varchar(45)
,`strUMName` varchar(45)
,`strUMobNum` varchar(16)
,`strUTelNum` varchar(9)
,`strUEmail` varchar(45)
,`datUBirthday` date
,`strSchedListDesc` varchar(45)
,`strCName` varchar(45)
,`strCDetails` text
,`intSchedID` int(11)
,`strSDesc` varchar(45)
,`datStartDate` date
,`datEndDate` date
);

-- --------------------------------------------------------

--
-- Structure for view `tblinquirylist`
--
DROP TABLE IF EXISTS `tblinquirylist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tblinquirylist`  AS  select `tblinquiry`.`intInquiryID` AS `intInquiryID`,`tblinquiry`.`strISubject` AS `strISubject`,`tblinquiry`.`strGuestName` AS `strGuestName`,`tblinquiry`.`strIMessage` AS `strIMessage`,`tblinquiry`.`intIStatusID` AS `intIStatusID`,date_format(`tblinquiry`.`datIDate`,'%M %d,%Y') AS `datIDate` from `tblinquiry` ;

-- --------------------------------------------------------

--
-- Structure for view `tblschedlist`
--
DROP TABLE IF EXISTS `tblschedlist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tblschedlist`  AS  select `s`.`intSchedID` AS `intSchedID`,`c`.`strCName` AS `strCName`,`c`.`strCDetails` AS `strCDetails`,`s`.`strSDesc` AS `strSDesc`,`t`.`strStatusDesc` AS `strStatusDesc`,date_format(`s`.`datStartDate`,'%M %d,%Y') AS `datStartDate`,date_format(`s`.`datEndDate`,'%M %d,%Y') AS `datEndDate`,`s`.`strSRemarks` AS `strSRemarks`,`t`.`strStatusColor` AS `strStatusColor`,`p`.`strProctorName` AS `strProctorName` from (((`tblsched` `s` join `tblstatus` `t` on((`s`.`intSStatusID` = `t`.`intStatusID`))) join `tblcourse` `c` on((`c`.`intCID` = `s`.`intSCourseID`))) join `tblproctor` `p` on((`p`.`intProctorID` = `s`.`intProctorID`))) order by `s`.`intSchedID` desc ;

-- --------------------------------------------------------

--
-- Structure for view `tblschedview`
--
DROP TABLE IF EXISTS `tblschedview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tblschedview`  AS  select `tblsched`.`intSchedID` AS `intSchedID`,`tblsched`.`strSDesc` AS `strSDesc`,date_format(`tblsched`.`datStartDate`,'%M %d,%Y') AS `datStartDate`,date_format(`tblsched`.`datEndDate`,'%M %d,%Y') AS `datEndDate`,`tblsched`.`strSRemarks` AS `strSRemarks`,`tblsched`.`intSCourseID` AS `intSCourseID`,`tblsched`.`intSStatusID` AS `intSStatusID`,`tblsched`.`intProctorID` AS `intProctorID` from `tblsched` ;

-- --------------------------------------------------------

--
-- Structure for view `tblusercoursedetails`
--
DROP TABLE IF EXISTS `tblusercoursedetails`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tblusercoursedetails`  AS  select `l`.`intSLUserID` AS `intSLUserID`,`u`.`strUFName` AS `strUFName`,`u`.`strULName` AS `strULName`,`u`.`strUMName` AS `strUMName`,`u`.`strUMobNum` AS `strUMobNum`,`u`.`strUTelNum` AS `strUTelNum`,`u`.`strUEmail` AS `strUEmail`,`u`.`datUBirthday` AS `datUBirthday`,`l`.`strSchedListDesc` AS `strSchedListDesc`,`c`.`strCName` AS `strCName`,`c`.`strCDetails` AS `strCDetails`,`s`.`intSchedID` AS `intSchedID`,`s`.`strSDesc` AS `strSDesc`,`s`.`datStartDate` AS `datStartDate`,`s`.`datEndDate` AS `datEndDate` from (((`tblschedline` `l` join `tblsched` `s` on((`l`.`intSLSchedID` = `s`.`intSchedID`))) join `tblcourse` `c` on((`c`.`intCID` = `s`.`intSCourseID`))) join `tbluser` `u` on((`l`.`intSLUserID` = `u`.`intUserID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vcoursesched`
--
DROP TABLE IF EXISTS `vcoursesched`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vcoursesched`  AS  select `s`.`intSCourseID` AS `intSCourseID`,`s`.`strSDesc` AS `strSDesc`,`s`.`datStartDate` AS `datStartDate`,`s`.`datEndDate` AS `datEndDate` from (`tblsched` `s` join `tblcourse` `c` on((`c`.`intCID` = `s`.`intSCourseID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vscheduserd`
--
DROP TABLE IF EXISTS `vscheduserd`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vscheduserd`  AS  select `l`.`intSLUserID` AS `intSLUserID`,`u`.`strUFName` AS `strUFName`,`u`.`strULName` AS `strULName`,`u`.`strUMName` AS `strUMName`,`u`.`strUMobNum` AS `strUMobNum`,`u`.`strUTelNum` AS `strUTelNum`,`u`.`strUEmail` AS `strUEmail`,`u`.`datUBirthday` AS `datUBirthday`,`l`.`strSchedListDesc` AS `strSchedListDesc`,`c`.`strCName` AS `strCName`,`c`.`strCDetails` AS `strCDetails`,`s`.`intSchedID` AS `intSchedID`,`s`.`strSDesc` AS `strSDesc`,`s`.`datStartDate` AS `datStartDate`,`s`.`datEndDate` AS `datEndDate` from (((`tblschedline` `l` join `tblsched` `s` on((`l`.`intSLSchedID` = `s`.`intSchedID`))) join `tblcourse` `c` on((`c`.`intCID` = `s`.`intSCourseID`))) join `tbluser` `u` on((`l`.`intSLUserID` = `u`.`intUserID`))) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblaccount`
--
ALTER TABLE `tblaccount`
  ADD CONSTRAINT `fk_tblaccount_tblstatus1` FOREIGN KEY (`intAStatusID`) REFERENCES `tblstatus` (`intStatusID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblaccount_tblusertype1` FOREIGN KEY (`intAUserTypeID`) REFERENCES `tblusertype` (`intUserTypeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbladmin_tbluserinfo1` FOREIGN KEY (`intAUserID`) REFERENCES `tbluser` (`intUserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblactivities`
--
ALTER TABLE `tblactivities`
  ADD CONSTRAINT `fk_tblactivities_tblstatus1` FOREIGN KEY (`intAStatusID`) REFERENCES `tblstatus` (`intStatusID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblattachment`
--
ALTER TABLE `tblattachment`
  ADD CONSTRAINT `fk_tblattachment_tblstatus1` FOREIGN KEY (`intAStatusID`) REFERENCES `tblstatus` (`intStatusID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblcompanydet`
--
ALTER TABLE `tblcompanydet`
  ADD CONSTRAINT `fk_tblcompanydet_tblstatus1` FOREIGN KEY (`intCDStatus`) REFERENCES `tblstatus` (`intStatusID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblcourse`
--
ALTER TABLE `tblcourse`
  ADD CONSTRAINT `fk_tblcourse_tblattachment1` FOREIGN KEY (`intCAttachID`) REFERENCES `tblattachment` (`intAttachmentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblcourse_tblstatus1` FOREIGN KEY (`intCStatusID`) REFERENCES `tblstatus` (`intStatusID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbldocuconfirm`
--
ALTER TABLE `tbldocuconfirm`
  ADD CONSTRAINT `fk_tbldocuconfirm_tblAttachment1` FOREIGN KEY (`intDCAttachID`) REFERENCES `tblattachment` (`intAttachmentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbldocuconfirm_tbldocurequest1` FOREIGN KEY (`intDCDocuRequestID`) REFERENCES `tbldocurequest` (`intDocuRequestID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbldocuconfirm_tblstatus1` FOREIGN KEY (`intDCStatusID`) REFERENCES `tblstatus` (`intStatusID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbldocurequest`
--
ALTER TABLE `tbldocurequest`
  ADD CONSTRAINT `fk_tbldocurequest_tblstatus1` FOREIGN KEY (`intDRStatusID`) REFERENCES `tblstatus` (`intStatusID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbldocurequest_tbluser1` FOREIGN KEY (`intDRUserID`) REFERENCES `tbluser` (`intUserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblequipments`
--
ALTER TABLE `tblequipments`
  ADD CONSTRAINT `fk_tblequipments_tbletype1` FOREIGN KEY (`intEEquipTypeID`) REFERENCES `tblequiptype` (`intEquipTypeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblequipments_tblstatus1` FOREIGN KEY (`intEStatusID`) REFERENCES `tblstatus` (`intStatusID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblequipments_tbluser1` FOREIGN KEY (`intEUserID`) REFERENCES `tbluser` (`intUserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblequiptype`
--
ALTER TABLE `tblequiptype`
  ADD CONSTRAINT `fk_tblequiptype_tblstatus1` FOREIGN KEY (`intETStatusID`) REFERENCES `tblstatus` (`intStatusID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblinquiry`
--
ALTER TABLE `tblinquiry`
  ADD CONSTRAINT `fk_tblinquiry_tblstatus1` FOREIGN KEY (`intIStatusID`) REFERENCES `tblstatus` (`intStatusID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblmessage`
--
ALTER TABLE `tblmessage`
  ADD CONSTRAINT `fk_tblmessage_tblAttachment1` FOREIGN KEY (`intMAttachID`) REFERENCES `tblattachment` (`intAttachmentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblmessage_tblstatus1` FOREIGN KEY (`intMStatusID`) REFERENCES `tblstatus` (`intStatusID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblmessage_tbluser1` FOREIGN KEY (`intMSender`) REFERENCES `tbluser` (`intUserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblmessage_tbluser2` FOREIGN KEY (`intMReceiver`) REFERENCES `tbluser` (`intUserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblpayment`
--
ALTER TABLE `tblpayment`
  ADD CONSTRAINT `fk_tblpayment_tblPayType1` FOREIGN KEY (`intPPayType`) REFERENCES `tblpaytype` (`intPayTypeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblpayment_tblinquiry1` FOREIGN KEY (`intPStatusID`) REFERENCES `tblinquiry` (`intIStatusID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblpayment_tblsched1` FOREIGN KEY (`intPSchedID`) REFERENCES `tblsched` (`intSchedID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblpayment_tblstatus1` FOREIGN KEY (`intPStatusID`) REFERENCES `tblstatus` (`intStatusID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblstudent_tblpayment1` FOREIGN KEY (`intPCompanyDetID`) REFERENCES `tblcompanydet` (`intCompDetID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblpaytype`
--
ALTER TABLE `tblpaytype`
  ADD CONSTRAINT `fk_tblPayType_tblstatus1` FOREIGN KEY (`intPTStatusID`) REFERENCES `tblstatus` (`intStatusID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblproctor`
--
ALTER TABLE `tblproctor`
  ADD CONSTRAINT `fk_tblproctor_tblstatus1` FOREIGN KEY (`intProcStatusID`) REFERENCES `tblstatus` (`intStatusID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblsched`
--
ALTER TABLE `tblsched`
  ADD CONSTRAINT `fk_tblsched_tblcourse1` FOREIGN KEY (`intSCourseID`) REFERENCES `tblcourse` (`intCID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblsched_tblproctor1` FOREIGN KEY (`intProctorID`) REFERENCES `tblproctor` (`intProctorID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblsched_tblstatus1` FOREIGN KEY (`intSStatusID`) REFERENCES `tblstatus` (`intStatusID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblschedact`
--
ALTER TABLE `tblschedact`
  ADD CONSTRAINT `fk_tblschedact_tblact1` FOREIGN KEY (`intSAActivitiesID`) REFERENCES `tblactivities` (`intActID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblschedact_tblsched1` FOREIGN KEY (`intSASchedID`) REFERENCES `tblsched` (`intSchedID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblschedline`
--
ALTER TABLE `tblschedline`
  ADD CONSTRAINT `fk_tblschedline_tblsched` FOREIGN KEY (`intSLSchedID`) REFERENCES `tblsched` (`intSchedID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblschedline_tbluser1` FOREIGN KEY (`intSLUserID`) REFERENCES `tbluser` (`intUserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD CONSTRAINT `fk_tbluser_tbldocuconfirm1` FOREIGN KEY (`intUDocuConfirmID`) REFERENCES `tbldocuconfirm` (`intDocuConfirm`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbluser_tblpayment1` FOREIGN KEY (`intUPaymentID`) REFERENCES `tblpayment` (`intPaymentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbluser_tblsched1` FOREIGN KEY (`intUSchedID`) REFERENCES `tblsched` (`intSchedID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbluser_tblstatus1` FOREIGN KEY (`intUStatusID`) REFERENCES `tblstatus` (`intStatusID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbluserinfo_tblInquiry1` FOREIGN KEY (`intUInquiryID`) REFERENCES `tblinquiry` (`intInquiryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblusertype`
--
ALTER TABLE `tblusertype`
  ADD CONSTRAINT `fk_tblusertype_tblstatus1` FOREIGN KEY (`intUTStatusID`) REFERENCES `tblstatus` (`intStatusID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
