-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2018 at 05:43 AM
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
-- Table structure for table `ml_banktransaction`
--

CREATE TABLE `ml_banktransaction` (
  `id` int(11) NOT NULL,
  `entityid` int(11) NOT NULL,
  `transactiontype` int(11) NOT NULL,
  `amount` float NOT NULL,
  `transactiondate` date NOT NULL,
  `comments` text NOT NULL,
  `bankfund` int(11) NOT NULL
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
  `birthdate` date NOT NULL,
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
-- Table structure for table `ml_loanstatus`
--

CREATE TABLE `ml_loanstatus` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `code` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `dateadded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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
-- Table structure for table `ml_menuhierarhy`
--

CREATE TABLE `ml_menuhierarhy` (
  `id` int(11) NOT NULL,
  `parentmenu` int(11) NOT NULL,
  `childmenu` int(11) NOT NULL,
  `dateadded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isactive` tinyint(1) NOT NULL
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
  `recordoperationid` int(11) NOT NULL
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
-- Indexes for table `ml_banktransaction`
--
ALTER TABLE `ml_banktransaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bankfund` (`bankfund`),
  ADD KEY `entityid` (`entityid`),
  ADD KEY `transactiontype` (`transactiontype`);

--
-- Indexes for table `ml_email`
--
ALTER TABLE `ml_email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_entity`
--
ALTER TABLE `ml_entity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gender` (`gender`),
  ADD KEY `phone` (`phone`),
  ADD KEY `email` (`email`),
  ADD KEY `profilepic` (`profilepic`),
  ADD KEY `maritalstatus` (`maritalstatus`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `tranid` (`tranid`),
  ADD KEY `guarantor` (`guarantor`),
  ADD KEY `loanstatus` (`loanstatus`);

--
-- Indexes for table `ml_loanstatus`
--
ALTER TABLE `ml_loanstatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_maritalstatus`
--
ALTER TABLE `ml_maritalstatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_menuhierarhy`
--
ALTER TABLE `ml_menuhierarhy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parentmenu` (`parentmenu`),
  ADD KEY `childmenu` (`childmenu`);

--
-- Indexes for table `ml_menulink`
--
ALTER TABLE `ml_menulink`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menutype` (`menutype`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `operationid` (`operationid`);

--
-- Indexes for table `ml_transactions`
--
ALTER TABLE `ml_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entityid` (`entityid`),
  ADD KEY `customerid` (`customerid`),
  ADD KEY `transtypeid` (`transtypeid`);

--
-- Indexes for table `ml_transactiontypelist`
--
ALTER TABLE `ml_transactiontypelist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_updatelog`
--
ALTER TABLE `ml_updatelog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `syslogid` (`syslogid`);

--
-- Indexes for table `ml_useraccessdef`
--
ALTER TABLE `ml_useraccessdef`
  ADD PRIMARY KEY (`id`),
  ADD KEY `useraccessid` (`useraccessid`),
  ADD KEY `recordoperationid` (`recordoperationid`);

--
-- Indexes for table `ml_usercredentials`
--
ALTER TABLE `ml_usercredentials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `ml_userrole`
--
ALTER TABLE `ml_userrole`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `userroleid` (`userroleid`);

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
-- AUTO_INCREMENT for table `ml_banktransaction`
--
ALTER TABLE `ml_banktransaction`
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
-- AUTO_INCREMENT for table `ml_loanstatus`
--
ALTER TABLE `ml_loanstatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ml_maritalstatus`
--
ALTER TABLE `ml_maritalstatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ml_menuhierarhy`
--
ALTER TABLE `ml_menuhierarhy`
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

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ml_banktransaction`
--
ALTER TABLE `ml_banktransaction`
  ADD CONSTRAINT `ml_banktransaction_ibfk_1` FOREIGN KEY (`bankfund`) REFERENCES `ml_bankfund` (`id`),
  ADD CONSTRAINT `ml_banktransaction_ibfk_2` FOREIGN KEY (`entityid`) REFERENCES `ml_entity` (`id`),
  ADD CONSTRAINT `ml_banktransaction_ibfk_3` FOREIGN KEY (`transactiontype`) REFERENCES `ml_transactiontypelist` (`id`);

--
-- Constraints for table `ml_entity`
--
ALTER TABLE `ml_entity`
  ADD CONSTRAINT `ml_entity_ibfk_1` FOREIGN KEY (`gender`) REFERENCES `ml_genderlist` (`id`),
  ADD CONSTRAINT `ml_entity_ibfk_2` FOREIGN KEY (`phone`) REFERENCES `ml_phone` (`id`),
  ADD CONSTRAINT `ml_entity_ibfk_3` FOREIGN KEY (`email`) REFERENCES `ml_email` (`id`),
  ADD CONSTRAINT `ml_entity_ibfk_4` FOREIGN KEY (`profilepic`) REFERENCES `ml_image` (`id`),
  ADD CONSTRAINT `ml_entity_ibfk_5` FOREIGN KEY (`profilepic`) REFERENCES `ml_image` (`id`),
  ADD CONSTRAINT `ml_entity_ibfk_6` FOREIGN KEY (`maritalstatus`) REFERENCES `ml_maritalstatus` (`id`);

--
-- Constraints for table `ml_loan`
--
ALTER TABLE `ml_loan`
  ADD CONSTRAINT `ml_loan_ibfk_1` FOREIGN KEY (`tranid`) REFERENCES `ml_transactions` (`id`),
  ADD CONSTRAINT `ml_loan_ibfk_2` FOREIGN KEY (`guarantor`) REFERENCES `ml_entity` (`id`),
  ADD CONSTRAINT `ml_loan_ibfk_3` FOREIGN KEY (`loanstatus`) REFERENCES `ml_loanstatus` (`id`);

--
-- Constraints for table `ml_menuhierarhy`
--
ALTER TABLE `ml_menuhierarhy`
  ADD CONSTRAINT `ml_menuhierarhy_ibfk_1` FOREIGN KEY (`parentmenu`) REFERENCES `ml_menulink` (`id`),
  ADD CONSTRAINT `ml_menuhierarhy_ibfk_2` FOREIGN KEY (`childmenu`) REFERENCES `ml_menulink` (`id`);

--
-- Constraints for table `ml_menulink`
--
ALTER TABLE `ml_menulink`
  ADD CONSTRAINT `ml_menulink_ibfk_1` FOREIGN KEY (`menutype`) REFERENCES `ml_menutypelist` (`id`);

--
-- Constraints for table `ml_systemlog`
--
ALTER TABLE `ml_systemlog`
  ADD CONSTRAINT `ml_systemlog_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `ml_entity` (`id`),
  ADD CONSTRAINT `ml_systemlog_ibfk_2` FOREIGN KEY (`operationid`) REFERENCES `ml_operationcode` (`id`);

--
-- Constraints for table `ml_transactions`
--
ALTER TABLE `ml_transactions`
  ADD CONSTRAINT `ml_transactions_ibfk_1` FOREIGN KEY (`entityid`) REFERENCES `ml_entity` (`id`),
  ADD CONSTRAINT `ml_transactions_ibfk_2` FOREIGN KEY (`customerid`) REFERENCES `ml_entity` (`id`),
  ADD CONSTRAINT `ml_transactions_ibfk_3` FOREIGN KEY (`transtypeid`) REFERENCES `ml_transactiontypelist` (`id`);

--
-- Constraints for table `ml_updatelog`
--
ALTER TABLE `ml_updatelog`
  ADD CONSTRAINT `ml_updatelog_ibfk_1` FOREIGN KEY (`syslogid`) REFERENCES `ml_systemlog` (`id`);

--
-- Constraints for table `ml_useraccessdef`
--
ALTER TABLE `ml_useraccessdef`
  ADD CONSTRAINT `ml_useraccessdef_ibfk_1` FOREIGN KEY (`useraccessid`) REFERENCES `ml_userrolelist` (`id`),
  ADD CONSTRAINT `ml_useraccessdef_ibfk_2` FOREIGN KEY (`recordoperationid`) REFERENCES `ml_operationcode` (`id`);

--
-- Constraints for table `ml_usercredentials`
--
ALTER TABLE `ml_usercredentials`
  ADD CONSTRAINT `ml_usercredentials_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `ml_entity` (`id`);

--
-- Constraints for table `ml_userrole`
--
ALTER TABLE `ml_userrole`
  ADD CONSTRAINT `ml_userrole_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `ml_entity` (`id`),
  ADD CONSTRAINT `ml_userrole_ibfk_2` FOREIGN KEY (`userroleid`) REFERENCES `ml_userrolelist` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
