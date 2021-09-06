-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 15, 2021 at 11:54 PM
-- Server version: 5.7.30-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `judiciary`
--

-- --------------------------------------------------------

--
-- Table structure for table `accused`
--

CREATE TABLE `accused` (
  `accused_id` int(11) NOT NULL,
  `accused_national_id` int(11) NOT NULL,
  `accused_name` varchar(255) NOT NULL,
  `accused_alias` varchar(255) NOT NULL,
  `accused_address` varchar(255) NOT NULL,
  `accused_age` int(11) NOT NULL,
  `accused_status` text NOT NULL,
  `accused_photo` varchar(100) NOT NULL,
  `accused_email` varchar(255) NOT NULL,
  `accused_mobile` int(11) NOT NULL,
  `accused_login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accused`
--

INSERT INTO `accused` (`accused_id`, `accused_national_id`, `accused_name`, `accused_alias`, `accused_address`, `accused_age`, `accused_status`, `accused_photo`, `accused_email`, `accused_mobile`, `accused_login_id`) VALUES
(1, 32945710, 'new', 'newest', '234 Thika', 31, 'accused', '453560011.png', 'new@gmail.com', 31567809, 16),
(2, 34596098, 'name', 'namest', '324 Nairobi', 25, 'accused', '817389819.png', 'name@gmail.com', 721341076, 17);

-- --------------------------------------------------------

--
-- Table structure for table `attorneys`
--

CREATE TABLE `attorneys` (
  `attorney_id` int(11) NOT NULL,
  `attorney_name` varchar(255) NOT NULL,
  `attorney_email` varchar(255) NOT NULL,
  `attorney_mobile` int(11) NOT NULL,
  `attorney_firm` varchar(255) NOT NULL,
  `attorney_login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attorneys`
--

INSERT INTO `attorneys` (`attorney_id`, `attorney_name`, `attorney_email`, `attorney_mobile`, `attorney_firm`, `attorney_login_id`) VALUES
(1, 'samuel', 'samuel@gmail.com', 721345098, 'firm', 5);

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `case_type_id` int(11) NOT NULL,
  `case_type_name` varchar(255) NOT NULL,
  `case_type` varchar(100) NOT NULL,
  `case_type_desc` varchar(500) NOT NULL,
  `case_status` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cases`
--

INSERT INTO `cases` (`case_type_id`, `case_type_name`, `case_type`, `case_type_desc`, `case_status`) VALUES
(1, 'Chicken Theft', 'criminal', 'This is a criminal case', 'NotAssigned'),
(2, 'egg theft', 'civil', 'Egg was stolen in the afternoon', 'NotAssigned');

-- --------------------------------------------------------

--
-- Table structure for table `case_accused`
--

CREATE TABLE `case_accused` (
  `case_accused_id` int(11) NOT NULL,
  `case_accused_accused_id` int(11) NOT NULL,
  `case_accused_case_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `case_accused`
--

INSERT INTO `case_accused` (`case_accused_id`, `case_accused_accused_id`, `case_accused_case_id`) VALUES
(1, 2, 1),
(3, 1, 1),
(4, 2, 2),
(5, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `case_file`
--

CREATE TABLE `case_file` (
  `case_id` int(11) NOT NULL,
  `case_ref_no` varchar(100) NOT NULL,
  `case_status` text NOT NULL,
  `case_details` varchar(500) NOT NULL,
  `case_case_type_id` int(11) NOT NULL,
  `case_judge_id` int(11) NOT NULL,
  `case_ob_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `case_file`
--

INSERT INTO `case_file` (`case_id`, `case_ref_no`, `case_status`, `case_details`, `case_case_type_id`, `case_judge_id`, `case_ob_id`) VALUES
(1, '5678', 'Assigned', 'This is the case assigment details', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `case_victims`
--

CREATE TABLE `case_victims` (
  `case_victim_id` int(11) NOT NULL,
  `case_victim_victim_id` int(11) NOT NULL,
  `case_victim_case_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `case_victims`
--

INSERT INTO `case_victims` (`case_victim_id`, `case_victim_victim_id`, `case_victim_case_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `evidence`
--

CREATE TABLE `evidence` (
  `evidence_id` int(11) NOT NULL,
  `evidence_desc` varchar(500) NOT NULL,
  `evidence_officer_id` int(11) NOT NULL,
  `evidence_case_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `evidence`
--

INSERT INTO `evidence` (`evidence_id`, `evidence_desc`, `evidence_officer_id`, `evidence_case_id`) VALUES
(1, 'This is the new evidence', 1, 1),
(2, 'This is the egg stealing description that was stolen in the evening', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `investigation_officer`
--

CREATE TABLE `investigation_officer` (
  `officer_id` int(11) NOT NULL,
  `officer_name` varchar(255) NOT NULL,
  `officer_email` varchar(255) NOT NULL,
  `officer_mobile` int(11) NOT NULL,
  `officer_rank` text NOT NULL,
  `officer_login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `investigation_officer`
--

INSERT INTO `investigation_officer` (`officer_id`, `officer_name`, `officer_email`, `officer_mobile`, `officer_rank`, `officer_login_id`) VALUES
(1, 'Martin', 'martin@gmail.com', 721345876, 'OCS', 8);

-- --------------------------------------------------------

--
-- Table structure for table `judges`
--

CREATE TABLE `judges` (
  `judge_id` int(11) NOT NULL,
  `judge_name` varchar(255) NOT NULL,
  `judge_email` varchar(255) NOT NULL,
  `judge_mobile` int(11) NOT NULL,
  `judge_status` text NOT NULL,
  `judge_login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `judges`
--

INSERT INTO `judges` (`judge_id`, `judge_name`, `judge_email`, `judge_mobile`, `judge_status`, `judge_login_id`) VALUES
(1, 'Mark', 'mark@gmail.com', 721345098, 'Assigned', 2);

-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

CREATE TABLE `logins` (
  `login_id` int(11) NOT NULL,
  `login_user_name` varchar(255) NOT NULL,
  `login_password` varchar(255) NOT NULL,
  `login_rank` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logins`
--

INSERT INTO `logins` (`login_id`, `login_user_name`, `login_password`, `login_rank`) VALUES
(1, 'admin', '1efa9898363bc3243fda0f783c8bf3af ', 'admin'),
(2, 'mark@gmail.com', 'ab3d1af06f623a97fa3024d4f61bed68', 'judge'),
(3, '', 'd41d8cd98f00b204e9800998ecf8427e', 'attorney'),
(4, 'samuel@gmail.com', 'ab3d1af06f623a97fa3024d4f61bed68', 'attorney'),
(5, 'samuel@gmail.com', 'ab3d1af06f623a97fa3024d4f61bed68', 'attorney'),
(8, 'martin@gmail.com', 'de1626d408da509e38c71b83ca81db0f', 'officer'),
(9, 'amos@gmail.com', '4db09c170350ee86dbe6979ff027474f', 'victim'),
(10, 'amos@gmail.com', '4db09c170350ee86dbe6979ff027474f', 'victim'),
(11, 'new@gmail.com', 'f43c62400f3de43efcc7b3d829e4b288', 'accused'),
(12, 'new@gmail.com', 'f43c62400f3de43efcc7b3d829e4b288', 'accused'),
(13, 'new@gmail.com', 'f43c62400f3de43efcc7b3d829e4b288', 'accused'),
(14, 'new@gmail.com', 'f43c62400f3de43efcc7b3d829e4b288', 'accused'),
(15, 'new@gmail.com', 'f43c62400f3de43efcc7b3d829e4b288', 'accused'),
(16, 'new@gmail.com', 'f43c62400f3de43efcc7b3d829e4b288', 'accused'),
(17, 'name@gmail.com', '845fde24b7f063ecdd78522dcb9d1091', 'accused'),
(18, 'namu@gmail.com', 'ed2849ec008713c6df2a77f0c1b5b247', 'victim');

-- --------------------------------------------------------

--
-- Table structure for table `ob`
--

CREATE TABLE `ob` (
  `ob_id` int(11) NOT NULL,
  `ob_date_lodged` datetime NOT NULL,
  `ob_time_lodged` varchar(100) NOT NULL,
  `ob_incident_place` varchar(255) NOT NULL,
  `ob_incident_time` varchar(100) NOT NULL,
  `ob_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ob`
--

INSERT INTO `ob` (`ob_id`, `ob_date_lodged`, `ob_time_lodged`, `ob_incident_place`, `ob_incident_time`, `ob_desc`) VALUES
(1, '2021-03-04 00:00:00', '4pm', 'Kariobangi', '12', 'Ob description Here');

-- --------------------------------------------------------

--
-- Table structure for table `petition`
--

CREATE TABLE `petition` (
  `petition_id` int(11) NOT NULL,
  `petition_date` datetime NOT NULL,
  `petition_verdict_id` int(11) NOT NULL,
  `petition_details` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petition`
--

INSERT INTO `petition` (`petition_id`, `petition_date`, `petition_verdict_id`, `petition_details`) VALUES
(2, '2021-03-10 00:00:00', 1, 'This is the petition for this verdict');

-- --------------------------------------------------------

--
-- Table structure for table `verdict`
--

CREATE TABLE `verdict` (
  `verdict_id` int(11) NOT NULL,
  `verdict_case_id` int(11) NOT NULL,
  `verdict_date` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `verdict_desc` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `verdict`
--

INSERT INTO `verdict` (`verdict_id`, `verdict_case_id`, `verdict_date`, `modified_at`, `created_at`, `verdict_desc`) VALUES
(1, 1, '2021-03-09 00:00:00', '2021-03-12 00:14:56', '2021-03-12 05:14:56', 'This is the verdict of this cases made today');

-- --------------------------------------------------------

--
-- Table structure for table `victims`
--

CREATE TABLE `victims` (
  `victim_id` int(11) NOT NULL,
  `victim_national_id` int(11) NOT NULL,
  `victim_name` varchar(255) NOT NULL,
  `victim_dob` datetime NOT NULL,
  `victim_address` varchar(255) NOT NULL,
  `victim_email` varchar(255) NOT NULL,
  `victim_mobile` int(11) NOT NULL,
  `victim_login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `victims`
--

INSERT INTO `victims` (`victim_id`, `victim_national_id`, `victim_name`, `victim_dob`, `victim_address`, `victim_email`, `victim_mobile`, `victim_login_id`) VALUES
(1, 31245609, 'amos', '1996-02-07 00:00:00', '234 Thika', 'amos@gmail.com', 721340845, 10),
(2, 31987623, 'namu', '1983-03-10 00:00:00', 'Nairobi 234', 'namu@gmail.com', 721340985, 18);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accused`
--
ALTER TABLE `accused`
  ADD PRIMARY KEY (`accused_id`),
  ADD KEY `accused_login_id` (`accused_login_id`);

--
-- Indexes for table `attorneys`
--
ALTER TABLE `attorneys`
  ADD PRIMARY KEY (`attorney_id`),
  ADD KEY `attorney_login_id` (`attorney_login_id`);

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`case_type_id`);

--
-- Indexes for table `case_accused`
--
ALTER TABLE `case_accused`
  ADD PRIMARY KEY (`case_accused_id`),
  ADD KEY `case_accused_accused_id` (`case_accused_accused_id`),
  ADD KEY `case_accused_case_id` (`case_accused_case_id`);

--
-- Indexes for table `case_file`
--
ALTER TABLE `case_file`
  ADD PRIMARY KEY (`case_id`),
  ADD KEY `case_case_type_id` (`case_case_type_id`),
  ADD KEY `case_judge_id` (`case_judge_id`),
  ADD KEY `case_ob_id` (`case_ob_id`);

--
-- Indexes for table `case_victims`
--
ALTER TABLE `case_victims`
  ADD PRIMARY KEY (`case_victim_id`),
  ADD KEY `case_victim_victim_id` (`case_victim_victim_id`),
  ADD KEY `case_victim_case_id` (`case_victim_case_id`);

--
-- Indexes for table `evidence`
--
ALTER TABLE `evidence`
  ADD PRIMARY KEY (`evidence_id`),
  ADD KEY `evidence_officer_id` (`evidence_officer_id`),
  ADD KEY `evidence_case_id` (`evidence_case_id`);

--
-- Indexes for table `investigation_officer`
--
ALTER TABLE `investigation_officer`
  ADD PRIMARY KEY (`officer_id`),
  ADD KEY `officer_login_id` (`officer_login_id`);

--
-- Indexes for table `judges`
--
ALTER TABLE `judges`
  ADD PRIMARY KEY (`judge_id`),
  ADD KEY `judge_login_id` (`judge_login_id`);

--
-- Indexes for table `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `ob`
--
ALTER TABLE `ob`
  ADD PRIMARY KEY (`ob_id`);

--
-- Indexes for table `petition`
--
ALTER TABLE `petition`
  ADD PRIMARY KEY (`petition_id`),
  ADD KEY `petition_verdict_id` (`petition_verdict_id`);

--
-- Indexes for table `verdict`
--
ALTER TABLE `verdict`
  ADD PRIMARY KEY (`verdict_id`),
  ADD KEY `verdict_case_id` (`verdict_case_id`);

--
-- Indexes for table `victims`
--
ALTER TABLE `victims`
  ADD PRIMARY KEY (`victim_id`),
  ADD KEY `victim_login_id` (`victim_login_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accused`
--
ALTER TABLE `accused`
  MODIFY `accused_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `attorneys`
--
ALTER TABLE `attorneys`
  MODIFY `attorney_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cases`
--
ALTER TABLE `cases`
  MODIFY `case_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `case_accused`
--
ALTER TABLE `case_accused`
  MODIFY `case_accused_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `case_file`
--
ALTER TABLE `case_file`
  MODIFY `case_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `case_victims`
--
ALTER TABLE `case_victims`
  MODIFY `case_victim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `evidence`
--
ALTER TABLE `evidence`
  MODIFY `evidence_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `investigation_officer`
--
ALTER TABLE `investigation_officer`
  MODIFY `officer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `judges`
--
ALTER TABLE `judges`
  MODIFY `judge_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `logins`
--
ALTER TABLE `logins`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `ob`
--
ALTER TABLE `ob`
  MODIFY `ob_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `petition`
--
ALTER TABLE `petition`
  MODIFY `petition_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `verdict`
--
ALTER TABLE `verdict`
  MODIFY `verdict_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `victims`
--
ALTER TABLE `victims`
  MODIFY `victim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
