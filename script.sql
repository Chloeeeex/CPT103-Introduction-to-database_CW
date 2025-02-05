-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2022-12-04 10:19:12
-- 服务器版本： 10.4.21-MariaDB
-- PHP 版本： 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `CW3`
--
CREATE DATABASE IF NOT EXISTS `CW3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `CW3`;

-- --------------------------------------------------------

--
-- 表的结构 `Basic_Information`
--

CREATE TABLE `Basic_Information` (
  `Drinks` varchar(300) DEFAULT NULL,
  `Design` varchar(500) DEFAULT NULL,
  `Design_ID` int(5) NOT NULL,
  `Volume(ml)` int(5) DEFAULT NULL,
  `Material` varchar(100) DEFAULT NULL,
  `TotalCal` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `Drink_Ingredient`
--

CREATE TABLE `Drink_Ingredient` (
  `Drinks` varchar(300) DEFAULT NULL,
  `Ingredient` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `Maintain_Information`for Task1!
--

CREATE TABLE `Maintain_Information` (
  `Machine_ID` varchar(10) NOT NULL,
  `TeamName` varchar(10) DEFAULT NULL,
  `Location` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `Nutrition`
--

CREATE TABLE `Nutrition` (
  `Drinks` varchar(300) NOT NULL,
  `Saturated Fat(g/100ml)` int(4) DEFAULT 0,
  `Trans-fatty acid(g/100ml)` int(4) DEFAULT 0,
  `Cholesterol(mg/100ml)` int(4) DEFAULT 0,
  `Carbohydrate(g/100ml)` int(4) DEFAULT 0,
  `Protein(g/100ml)` int(4) DEFAULT 0,
  `Vitamin D(mcg/100ml)` int(4) DEFAULT 0,
  `Calcium(mg/100ml)` int(4) DEFAULT 0,
  `Magnesium(mg/100ml)` int(4) DEFAULT 0,
  `Potassium(mg/100ml)` int(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `Serial_Information`
--

CREATE TABLE `Serial_Information` (
  `Serial` varchar(300) NOT NULL,
  `Design_ID` int(5) DEFAULT NULL,
  `Machine_ID` varchar(10) DEFAULT NULL,
  `State` tinyint(1) DEFAULT NULL,
  `Production_Date` date DEFAULT NULL,
  `Expiry_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- --------------------------------------------------------

--
-- 表的结构 `Team_Information`
--

CREATE TABLE `Team_Information` (
  `TeamName` varchar(10) NOT NULL,
  `Tele` varchar(16) DEFAULT NULL,
  `Truck` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- --------------------------------------------------------

--
-- 表的结构 `Staff_Information` for Task2!
--

CREATE TABLE `Staff_Information` (
  `Staff_ID` int(7) NOT NULL,
  `Staff_Name` varchar(100) NOT NULL,
  `Dept(TeamName)` varchar(10) DEFAULT NULL,
  `Staff_Tele` int(13) NOT NULL,
  `Salary` int(10) DEFAULT NULL,
  `Manager_ID` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- --------------------------------------------------------

--
-- 表的结构 `Maintain_Information` for Task2!(Updated from what for Task1)
--

CREATE TABLE `Maintain_Information` (
  `Machine_ID` varchar(10) NOT NULL,
  `Staff_ID` int(7) DEFAULT NULL,
  `Location` varchar(1000) DEFAULT NULL,
  `MaintainDay` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- 转储表的索引
--

--
-- 表的索引 `Basic_Information`
--
ALTER TABLE `Basic_Information`
  ADD PRIMARY KEY (`Design_ID`),
  ADD KEY `DB_fk` (`Drinks`);

--
-- 表的索引 `Drink_Ingredient`
--
ALTER TABLE `Drink_Ingredient`
  ADD KEY `DID_fk` (`Drinks`);

--
-- 表的索引 `Maintain_Information` for Task1!
--
ALTER TABLE `Maintain_Information`
  ADD PRIMARY KEY (`Machine_ID`),
  ADD KEY `MT_fk` (`TeamName`);

--
-- 表的索引 `Nutrition`
--
ALTER TABLE `Nutrition`
  ADD PRIMARY KEY (`Drinks`);

--
-- 表的索引 `Serial_Information`
--
ALTER TABLE `Serial_Information`
  ADD PRIMARY KEY (`Serial`),
  ADD KEY `SD_fk` (`Design_ID`),
  ADD KEY `SM_fk` (`Machine_ID`);

--
-- 表的索引 `Team_Information` 
--
ALTER TABLE `Team_Information`
  ADD PRIMARY KEY (`TeamName`),
  ADD UNIQUE KEY `Tele` (`Tele`),
  ADD UNIQUE KEY `Truck` (`Truck`);

--
-- 表的索引 `Staff_Information` for Task2!
--
ALTER TABLE `Staff_Information`
  ADD PRIMARY KEY (`Staff_ID`),
  ADD KEY `ST_fk` (`Dept(TeamName)`);

--  
-- 表的索引 `Maintain_Information`for Task2!(Updated from what for Task1)
--
ALTER TABLE `Maintain_Information`
  ADD PRIMARY KEY (`Machine_ID`),
  ADD KEY `MT_fk` (`TeamName`);

--
-- 限制导出的表
--

--
-- 限制表 `Basic_Information`
--
ALTER TABLE `Basic_Information`
  ADD CONSTRAINT `DB_fk` FOREIGN KEY (`Drinks`) REFERENCES `Nutrition` (`Drinks`);

--
-- 限制表 `Drink_Ingredient`
--
ALTER TABLE `Drink_Ingredient`
  ADD CONSTRAINT `DID_fk` FOREIGN KEY (`Drinks`) REFERENCES `Nutrition` (`Drinks`);

--
-- 限制表 `Maintain_Information` for Task1!
--
ALTER TABLE `Maintain_Information`
  ADD CONSTRAINT `MT_fk` FOREIGN KEY (`TeamName`) REFERENCES `Team_Information` (`TeamName`);

--
-- 限制表 `Serial_Information`
--
ALTER TABLE `Serial_Information`
  ADD CONSTRAINT `SD_fk` FOREIGN KEY (`Design_ID`) REFERENCES `Basic_Information` (`Design_ID`),
  ADD CONSTRAINT `SM_fk` FOREIGN KEY (`Machine_ID`) REFERENCES `Maintain_Information` (`Machine_ID`);

--
-- 限制表 `Staff_Information` for Task2!
--
ALTER TABLE `Staff_Information`
  ADD CONSTRAINT `ST_fk` FOREIGN KEY (`Dept(TeamName)`) REFERENCES `Team_Information` (`TeamName`);

--
-- 限制表 `Maintain_Information` for Task2!(Updated from what for Task1)
--
ALTER TABLE `Maintain_Information`
  ADD CONSTRAINT `MS_fk` FOREIGN KEY (`Staff_ID`) REFERENCES `Staff_Information` (`Staff_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
