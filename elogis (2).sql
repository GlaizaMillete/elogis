-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2023 at 07:35 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elogis`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` int(20) NOT NULL,
  `Name` varchar(55) DEFAULT NULL,
  `Age` int(55) NOT NULL,
  `Address` varchar(55) DEFAULT NULL,
  `contact_no` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_ID`, `Name`, `Age`, `Address`, `contact_no`) VALUES
(1, 'Mary Armenta', 15, 'Daraga', 63122348972),
(2, 'Glaiza Millete', 18, 'San Joaquin', 63912435687),
(101, 'Jade B. Raposa', 25, 'St.Domingo', 639123456789),
(102, 'Ian Bueno', 20, 'Masbate', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `Delivery_ID` int(20) DEFAULT NULL,
  `Customer_ID` int(20) DEFAULT NULL,
  `Delivery_Date` date DEFAULT NULL,
  `Order_No` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`Delivery_ID`, `Customer_ID`, `Delivery_Date`, `Order_No`) VALUES
(1001, 101, '2022-12-05', 20001);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_No` int(20) NOT NULL,
  `Product_Name` varchar(55) DEFAULT NULL,
  `Product_Quantity` varchar(55) DEFAULT NULL,
  `Product_Description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_No`, `Product_Name`, `Product_Quantity`, `Product_Description`) VALUES
(220, 'Bench Goals Body Spray', '1', 'helps you stand out in the crowd');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `Seller_ID` int(20) DEFAULT NULL,
  `Name` varchar(55) DEFAULT NULL,
  `Product_No` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`Seller_ID`, `Name`, `Product_No`) VALUES
(3001, 'Glaiza', 220);

-- --------------------------------------------------------

--
-- Table structure for table `shoppingorder`
--

CREATE TABLE `shoppingorder` (
  `Customer_ID` int(20) DEFAULT NULL,
  `Order_No` int(20) NOT NULL,
  `Order_Name` varchar(55) DEFAULT NULL,
  `Order_Date` date DEFAULT NULL,
  `Product_No` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shoppingorder`
--

INSERT INTO `shoppingorder` (`Customer_ID`, `Order_No`, `Order_Name`, `Order_Date`, `Product_No`) VALUES
(101, 20001, 'Bench Goals Body Spray', '2022-12-05', 220);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `Order_No` int(20) NOT NULL,
  `Payment_ID` int(55) DEFAULT NULL,
  `Amount` int(100) DEFAULT NULL,
  `Payment_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`Order_No`, `Payment_ID`, `Amount`, `Payment_Date`) VALUES
(20001, 1001, 500, '2022-12-05'),
(20002, 1002, 1000, '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD KEY `Order_No` (`Order_No`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_No`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD KEY `Product_No` (`Product_No`);

--
-- Indexes for table `shoppingorder`
--
ALTER TABLE `shoppingorder`
  ADD PRIMARY KEY (`Order_No`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Product_No` (`Product_No`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`Order_No`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`Order_No`) REFERENCES `transaction` (`Order_No`);

--
-- Constraints for table `seller`
--
ALTER TABLE `seller`
  ADD CONSTRAINT `seller_ibfk_1` FOREIGN KEY (`Product_No`) REFERENCES `product` (`Product_No`);

--
-- Constraints for table `shoppingorder`
--
ALTER TABLE `shoppingorder`
  ADD CONSTRAINT `shoppingorder_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `shoppingorder_ibfk_2` FOREIGN KEY (`Product_No`) REFERENCES `product` (`Product_No`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
