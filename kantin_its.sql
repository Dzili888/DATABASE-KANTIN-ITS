-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2026 at 07:32 AM
-- Server version: 8.4.8
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kantin_its`
--

-- --------------------------------------------------------

--
-- Table structure for table `CUSTOMER`
--

CREATE TABLE `CUSTOMER` (
  `ID_CUST` int NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `TYPE` enum('STUDENT','STAFF','PUBLIC') NOT NULL,
  `HOBBY` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `CUSTOMER`
--

INSERT INTO `CUSTOMER` (`ID_CUST`, `NAME`, `TYPE`, `HOBBY`) VALUES
(1, 'ALBERT', 'STUDENT', NULL),
(2, 'ARIS', 'STAFF', NULL),
(3, 'ROGER', 'PUBLIC', 'BL');

-- --------------------------------------------------------

--
-- Table structure for table `SELLER`
--

CREATE TABLE `SELLER` (
  `SELLER_ID` int NOT NULL,
  `NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `TENANT`
--

CREATE TABLE `TENANT` (
  `TENANT_ID` int NOT NULL,
  `ID_CUST` int NOT NULL,
  `SELLER_ID` int NOT NULL,
  `TYPE` enum('FOOD','BEVERAGE') NOT NULL DEFAULT 'FOOD',
  `STOCK` int NOT NULL
) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CUSTOMER`
--
ALTER TABLE `CUSTOMER`
  ADD PRIMARY KEY (`ID_CUST`);

--
-- Indexes for table `SELLER`
--
ALTER TABLE `SELLER`
  ADD PRIMARY KEY (`SELLER_ID`);

--
-- Indexes for table `TENANT`
--
ALTER TABLE `TENANT`
  ADD PRIMARY KEY (`TENANT_ID`),
  ADD KEY `ID_CUST` (`ID_CUST`),
  ADD KEY `SELLER_ID` (`SELLER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `CUSTOMER`
--
ALTER TABLE `CUSTOMER`
  MODIFY `ID_CUST` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `SELLER`
--
ALTER TABLE `SELLER`
  MODIFY `SELLER_ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `TENANT`
--
ALTER TABLE `TENANT`
  MODIFY `TENANT_ID` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `TENANT`
--
ALTER TABLE `TENANT`
  ADD CONSTRAINT `TENANT_ibfk_1` FOREIGN KEY (`ID_CUST`) REFERENCES `CUSTOMER` (`ID_CUST`),
  ADD CONSTRAINT `TENANT_ibfk_2` FOREIGN KEY (`SELLER_ID`) REFERENCES `SELLER` (`SELLER_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
