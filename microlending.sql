-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2018 at 12:09 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `microlending`
--

-- --------------------------------------------------------

--
-- Table structure for table `ml_bankfund`
--

CREATE TABLE `ml_bankfund` (
  `id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `name` varchar(3000) NOT NULL,
  `description` text NOT NULL,
  `dateadded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ml_email`
--

CREATE TABLE `ml_email` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `email` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ml_entity`
--

CREATE TABLE `ml_entity` (
  `id` int(11) NOT NULL,
  `firstname` varchar(1000) NOT NULL,
  `lastname` varchar(1000) NOT NULL,
  `middlename` varchar(1000) NOT NULL,
  `gender` int(11) NOT NULL,
  `maritalstatus` int(11) NOT NULL,
  `address` varchar(2000) NOT NULL,
  `city` varchar(2000) NOT NULL,
  `subdivision` varchar(2000) NOT NULL,
  `zipcode` varchar(1000) NOT NULL,
  `country` varchar(1000) NOT NULL,
  `brithdate` date NOT NULL,
  `email` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `mobilennumber` int(11) NOT NULL,
  `profilepic` int(11) NOT NULL,
  `dateadded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notes` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ml_genderlist`
--

CREATE TABLE `ml_genderlist` (
  `id` int(11) NOT NULL,
  `name` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `dateadded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `code` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ml_image`
--

CREATE TABLE `ml_image` (
  `id` int(11) NOT NULL,
  `name` varchar(2000) NOT NULL,
  `caption` text NOT NULL,
  `filelocation` varchar(2000) NOT NULL,
  `notes` text NOT NULL,
  `dateadded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ml_loan`
--

CREATE TABLE `ml_loan` (
  `id` int(11) NOT NULL,
  `tranid` int(11) NOT NULL,
  `startdate` date NOT NULL,
  `guarantor` int(11) NOT NULL,
  `loanstatus` int(11) NOT NULL,
  `tenure` int(11) NOT NULL,
  `comments` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ml_maritalstatus`
--

CREATE TABLE `ml_maritalstatus` (
  `id` int(11) NOT NULL,
  `name` varchar(2000) NOT NULL,
  `code` varchar(1000) NOT NULL,
  `description` text NOT NULL,
  `dateadded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ml_menulink`
--

CREATE TABLE `ml_menulink` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `description` text NOT NULL,
  `urllink` varchar(2000) NOT NULL,
  `menutype` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ml_menutypelist`
--

CREATE TABLE `ml_menutypelist` (
  `id` int(11) NOT NULL,
  `name` varchar(2000) NOT NULL,
  `code` varchar(1000) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ml_operationcode`
--

CREATE TABLE `ml_operationcode` (
  `id` int(11) NOT NULL,
  `name` varchar(2000) NOT NULL,
  `code` varchar(1000) NOT NULL,
  `details` text NOT NULL,
  `dateadded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ml_phone`
--

CREATE TABLE `ml_phone` (
  `id` int(11) NOT NULL,
  `name` varchar(2000) NOT NULL,
  `code` varchar(1000) NOT NULL,
  `description` text NOT NULL,
  `dateadded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ml_systemlog`
--

CREATE TABLE `ml_systemlog` (
  `id` int(11) NOT NULL,
  `recordid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `operationid` int(11) NOT NULL,
  `dateadded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ml_transactions`
--

CREATE TABLE `ml_transactions` (
  `id` int(11) NOT NULL,
  `transtypeid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `amount` float NOT NULL,
  `entityid` int(11) NOT NULL,
  `customerid` int(11) NOT NULL,
  `comments` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ml_transactiontypelist`
--

CREATE TABLE `ml_transactiontypelist` (
  `id` int(11) NOT NULL,
  `name` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(1000) NOT NULL,
  `dateadded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ml_updatelog`
--

CREATE TABLE `ml_updatelog` (
  `id` int(11) NOT NULL,
  `syslogid` int(11) NOT NULL,
  `fieldname` varchar(1000) NOT NULL,
  `fromValue` text NOT NULL,
  `toValue` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ml_useraccessdef`
--

CREATE TABLE `ml_useraccessdef` (
  `id` int(11) NOT NULL,
  `useraccessid` int(11) NOT NULL,
  `recordoprationid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ml_usercredentials`
--

CREATE TABLE `ml_usercredentials` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `username` varchar(2000) NOT NULL,
  `password` varchar(4000) NOT NULL,
  `salt` varchar(4000) NOT NULL,
  `lastupdate` datetime NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ml_userrole`
--

CREATE TABLE `ml_userrole` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `userroleid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ml_userrolelist`
--

CREATE TABLE `ml_userrolelist` (
  `id` int(11) NOT NULL,
  `name` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `dateadded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usercode` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ml_bankfund`
--
ALTER TABLE `ml_bankfund`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_email`
--
ALTER TABLE `ml_email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_entity`
--
ALTER TABLE `ml_entity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_genderlist`
--
ALTER TABLE `ml_genderlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_image`
--
ALTER TABLE `ml_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_loan`
--
ALTER TABLE `ml_loan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_maritalstatus`
--
ALTER TABLE `ml_maritalstatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_menulink`
--
ALTER TABLE `ml_menulink`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_menutypelist`
--
ALTER TABLE `ml_menutypelist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_operationcode`
--
ALTER TABLE `ml_operationcode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_phone`
--
ALTER TABLE `ml_phone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_systemlog`
--
ALTER TABLE `ml_systemlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_transactions`
--
ALTER TABLE `ml_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_transactiontypelist`
--
ALTER TABLE `ml_transactiontypelist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_updatelog`
--
ALTER TABLE `ml_updatelog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_useraccessdef`
--
ALTER TABLE `ml_useraccessdef`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_usercredentials`
--
ALTER TABLE `ml_usercredentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_userrole`
--
ALTER TABLE `ml_userrole`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_userrolelist`
--
ALTER TABLE `ml_userrolelist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ml_bankfund`
--
ALTER TABLE `ml_bankfund`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ml_email`
--
ALTER TABLE `ml_email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ml_entity`
--
ALTER TABLE `ml_entity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ml_genderlist`
--
ALTER TABLE `ml_genderlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ml_image`
--
ALTER TABLE `ml_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ml_loan`
--
ALTER TABLE `ml_loan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ml_maritalstatus`
--
ALTER TABLE `ml_maritalstatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ml_menulink`
--
ALTER TABLE `ml_menulink`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ml_menutypelist`
--
ALTER TABLE `ml_menutypelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ml_operationcode`
--
ALTER TABLE `ml_operationcode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ml_phone`
--
ALTER TABLE `ml_phone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ml_systemlog`
--
ALTER TABLE `ml_systemlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ml_transactions`
--
ALTER TABLE `ml_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ml_transactiontypelist`
--
ALTER TABLE `ml_transactiontypelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ml_updatelog`
--
ALTER TABLE `ml_updatelog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ml_useraccessdef`
--
ALTER TABLE `ml_useraccessdef`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ml_usercredentials`
--
ALTER TABLE `ml_usercredentials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ml_userrole`
--
ALTER TABLE `ml_userrole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ml_userrolelist`
--
ALTER TABLE `ml_userrolelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
