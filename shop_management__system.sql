-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2025 at 11:43 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_management__system`
--

-- --------------------------------------------------------

--
-- Table structure for table `dailysales`
--

CREATE TABLE `dailysales` (
  `salesID` int(11) NOT NULL,
  `salesDate` date NOT NULL,
  `totalSalesAmount` float NOT NULL CHECK (`totalSalesAmount` >= 0),
  `totalTransactions` int(11) NOT NULL CHECK (`totalTransactions` >= 0),
  `totalItemsSold` int(11) NOT NULL CHECK (`totalItemsSold` >= 0),
  `totalCost` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dailysales`
--

INSERT INTO `dailysales` (`salesID`, `salesDate`, `totalSalesAmount`, `totalTransactions`, `totalItemsSold`, `totalCost`) VALUES
(1, '2024-12-08', 925, 5, 25, 0),
(5, '2024-12-08', 2830, 8, 122, 0);

--
-- Triggers `dailysales`
--
DELIMITER $$
CREATE TRIGGER `after_daily_sales_insert` AFTER INSERT ON `dailysales` FOR EACH ROW BEGIN
    INSERT INTO MonthlyProfit (profitMonth, totalSalesAmount, totalCostAmount, totalProfit)
    VALUES (
        DATE_FORMAT(NEW.salesDate, '%Y-%m-01'), 
        NEW.totalSalesAmount,
        0, 
        NEW.totalSalesAmount
    )
    ON DUPLICATE KEY UPDATE
        totalSalesAmount = totalSalesAmount + NEW.totalSalesAmount,
        totalProfit = totalProfit + NEW.totalSalesAmount;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_daily_sales_update` AFTER UPDATE ON `dailysales` FOR EACH ROW BEGIN
    UPDATE MonthlyProfit
    SET 
        totalSalesAmount = totalSalesAmount + (NEW.totalSalesAmount - OLD.totalSalesAmount),
        totalProfit = totalProfit + (NEW.totalSalesAmount - OLD.totalSalesAmount)
    WHERE profitMonth = DATE_FORMAT(NEW.salesDate, '%Y-%m-01');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_monthly_profit` AFTER INSERT ON `dailysales` FOR EACH ROW BEGIN
    INSERT INTO MonthlyProfit (profitMonth, totalSalesAmount, totalProfit)
    VALUES (DATE_FORMAT(NEW.salesDate, '%Y-%m-01'), NEW.totalSalesAmount, NEW.totalSalesAmount - NEW.totalCost)
    ON DUPLICATE KEY UPDATE
        totalSalesAmount = totalSalesAmount + NEW.totalSalesAmount,
        totalProfit = totalProfit + (NEW.totalSalesAmount - NEW.totalCost);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employeeID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `startDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employeeID`, `name`, `position`, `salary`, `startDate`) VALUES
(1, 'Bissosto Kew ekjon', 'Cashier', 25000.00, '2022-01-01'),
(2, 'Syful', 'Manager', 45000.00, '2021-05-15'),
(3, 'Bomb smith', 'Stock Keeper', 20000.00, '2023-02-10'),
(4, 'Kono ekta Nam', 'Sales Assistant', 22000.00, '2023-07-20'),
(5, 'Adam Smith', 'Accountant', 30000.00, '2020-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `employeeschedule`
--

CREATE TABLE `employeeschedule` (
  `scheduleID` int(11) NOT NULL,
  `employeeID` int(11) NOT NULL,
  `workDate` date NOT NULL,
  `shift` enum('Morning','Afternoon','Night') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employeeschedule`
--

INSERT INTO `employeeschedule` (`scheduleID`, `employeeID`, `workDate`, `shift`) VALUES
(1, 1, '2024-11-29', 'Morning'),
(2, 1, '2024-11-30', 'Afternoon'),
(3, 2, '2024-11-29', 'Morning'),
(4, 3, '2024-11-29', 'Night'),
(5, 4, '2024-11-30', 'Morning'),
(6, 5, '2024-11-30', 'Afternoon');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `itemCode` int(11) NOT NULL,
  `itemName` varchar(50) NOT NULL,
  `price` float NOT NULL CHECK (`price` > 0),
  `quantity` int(11) NOT NULL CHECK (`quantity` >= 0),
  `expirationDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`itemCode`, `itemName`, `price`, `quantity`, `expirationDate`) VALUES
(101, 'Milk', 25, 40, '2024-12-31'),
(102, 'Bread', 50, 90, '2024-11-30'),
(103, 'Eggs', 30, 192, '2022-12-15'),
(104, 'Butter', 20, 75, '2021-12-25'),
(105, 'Cheese', 40, 120, '2024-11-28'),
(106, 'Soap', 65, 70, '2026-12-31'),
(107, 'Juice', 35, 80, '2028-11-30'),
(108, 'Chips', 10, 185, '2023-12-15'),
(109, 'Lacchi', 25, 10, '2024-12-25'),
(110, 'Ice-Cream', 100, 45, '2027-11-28');

--
-- Triggers `items`
--
DELIMITER $$
CREATE TRIGGER `handle_expired_items` BEFORE DELETE ON `items` FOR EACH ROW BEGIN
    IF OLD.expirationDate < CURDATE() THEN
        INSERT INTO ExpiredItems (itemCode, itemName, expirationDate)
        VALUES (OLD.itemCode, OLD.itemName, OLD.expirationDate);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `monitor_inventory_levels` AFTER UPDATE ON `items` FOR EACH ROW BEGIN
    IF NEW.quantity < 10 THEN
        INSERT INTO LowStockAlerts (itemCode, itemName, quantity)
        VALUES (NEW.itemCode, NEW.itemName, NEW.quantity);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `monthlyprofit`
--

CREATE TABLE `monthlyprofit` (
  `monthlyProfitID` int(11) NOT NULL,
  `totalSalesAmount` float NOT NULL,
  `totalCostAmount` float NOT NULL,
  `totalProfit` float NOT NULL,
  `profitMonth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `monthlyprofit`
--

INSERT INTO `monthlyprofit` (`monthlyProfitID`, `totalSalesAmount`, `totalCostAmount`, `totalProfit`, `profitMonth`) VALUES
(2, 125, 0, 125, '0000-00-00'),
(3, 125, 0, 125, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `salessummary`
--

CREATE TABLE `salessummary` (
  `salesSummaryID` int(11) NOT NULL,
  `itemCode` int(11) NOT NULL,
  `totalQuantitySold` int(11) NOT NULL CHECK (`totalQuantitySold` >= 0),
  `totalSalesAmount` float NOT NULL CHECK (`totalSalesAmount` >= 0),
  `saleMonth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salessummary`
--

INSERT INTO `salessummary` (`salesSummaryID`, `itemCode`, `totalQuantitySold`, `totalSalesAmount`, `saleMonth`) VALUES
(1, 101, 5, 125, '0000-00-00'),
(2, 103, 8, 240, '0000-00-00'),
(3, 109, 38, 950, '0000-00-00'),
(4, 108, 10, 100, '0000-00-00'),
(5, 108, 5, 50, '2024-12-01');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transactionID` int(11) NOT NULL,
  `itemCode` int(11) NOT NULL,
  `quantitySold` int(11) NOT NULL CHECK (`quantitySold` >= 0),
  `totalPrice` float NOT NULL CHECK (`totalPrice` >= 0),
  `saleDate` date NOT NULL,
  `employeeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transactionID`, `itemCode`, `quantitySold`, `totalPrice`, `saleDate`, `employeeID`) VALUES
(1, 101, 5, 125, '2024-12-07', NULL),
(2, 102, 5, 250, '2024-12-07', NULL),
(3, 102, 5, 250, '2024-12-07', NULL),
(5, 101, 5, 125, '0000-00-00', NULL),
(6, 103, 8, 240, '0000-00-00', NULL),
(9, 109, 38, 950, '0000-00-00', NULL),
(10, 108, 10, 100, '0000-00-00', NULL),
(11, 108, 5, 50, '2024-12-07', NULL);

--
-- Triggers `transactions`
--
DELIMITER $$
CREATE TRIGGER `after_transaction_insert` AFTER INSERT ON `transactions` FOR EACH ROW BEGIN
    -- Update the stock in Items table
    UPDATE Items 
    SET quantity = quantity - NEW.quantitySold
    WHERE itemCode = NEW.itemCode;
    
    -- Insert or update daily sales data
    INSERT INTO DailySales (salesDate, totalSalesAmount, totalTransactions, totalItemsSold)
    VALUES (
        NEW.saleDate,
        NEW.totalPrice,
        1,
        NEW.quantitySold
    )
    ON DUPLICATE KEY UPDATE
        totalSalesAmount = totalSalesAmount + NEW.totalPrice,
        totalTransactions = totalTransactions + 1,
        totalItemsSold = totalItemsSold + NEW.quantitySold;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `automated_sell` BEFORE INSERT ON `transactions` FOR EACH ROW BEGIN
    DECLARE itemPrice FLOAT;
    SELECT price INTO itemPrice 
    FROM Items 
    WHERE itemCode = NEW.itemCode;

    SET NEW.totalPrice = NEW.quantitySold * itemPrice;

    IF NEW.saleDate IS NULL THEN
        SET NEW.saleDate = CURDATE();
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `track_sales` AFTER INSERT ON `transactions` FOR EACH ROW BEGIN
    INSERT INTO SalesSummary (itemCode, totalQuantitySold, totalSalesAmount, saleMonth)
    VALUES (NEW.itemCode, NEW.quantitySold, NEW.totalPrice, DATE_FORMAT(NEW.saleDate, '%Y-%m-01'))
    ON DUPLICATE KEY UPDATE
        totalQuantitySold = totalQuantitySold + NEW.quantitySold,
        totalSalesAmount = totalSalesAmount + NEW.totalPrice;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_daily_sales` AFTER INSERT ON `transactions` FOR EACH ROW BEGIN
    INSERT INTO DailySales (salesDate, totalSalesAmount, totalTransactions, totalItemsSold)
    VALUES (NEW.saleDate, NEW.totalPrice, 1, NEW.quantitySold)
    ON DUPLICATE KEY UPDATE
        totalSalesAmount = totalSalesAmount + NEW.totalPrice,
        totalTransactions = totalTransactions + 1,
        totalItemsSold = totalItemsSold + NEW.quantitySold;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dailysales`
--
ALTER TABLE `dailysales`
  ADD PRIMARY KEY (`salesID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employeeID`);

--
-- Indexes for table `employeeschedule`
--
ALTER TABLE `employeeschedule`
  ADD PRIMARY KEY (`scheduleID`),
  ADD KEY `employeeID` (`employeeID`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`itemCode`);

--
-- Indexes for table `monthlyprofit`
--
ALTER TABLE `monthlyprofit`
  ADD PRIMARY KEY (`monthlyProfitID`);

--
-- Indexes for table `salessummary`
--
ALTER TABLE `salessummary`
  ADD PRIMARY KEY (`salesSummaryID`),
  ADD KEY `itemCode` (`itemCode`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transactionID`),
  ADD KEY `itemCode` (`itemCode`),
  ADD KEY `employeeID` (`employeeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dailysales`
--
ALTER TABLE `dailysales`
  MODIFY `salesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employeeschedule`
--
ALTER TABLE `employeeschedule`
  MODIFY `scheduleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `monthlyprofit`
--
ALTER TABLE `monthlyprofit`
  MODIFY `monthlyProfitID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `salessummary`
--
ALTER TABLE `salessummary`
  MODIFY `salesSummaryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transactionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dailysales`
--
ALTER TABLE `dailysales`
  ADD CONSTRAINT `dailysales_ibfk_1` FOREIGN KEY (`salesID`) REFERENCES `transactions` (`transactionID`);

--
-- Constraints for table `employeeschedule`
--
ALTER TABLE `employeeschedule`
  ADD CONSTRAINT `employeeschedule_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employees` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salessummary`
--
ALTER TABLE `salessummary`
  ADD CONSTRAINT `salessummary_ibfk_1` FOREIGN KEY (`itemCode`) REFERENCES `items` (`itemCode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`itemCode`) REFERENCES `items` (`itemCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`employeeID`) REFERENCES `employees` (`employeeID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
