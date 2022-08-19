-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2022 at 10:37 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wallet`
--

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `accno` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `debit` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `time` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`accno`, `balance`, `debit`, `action`, `time`) VALUES
(1, 600, 200, 'debit', '2022-08-18 08:30:47.000000'),
(1, 1600, 1000, 'credit', '2022-08-18 09:04:54.000000'),
(2, 2500, 500, 'credit', '2022-08-18 09:05:26.000000'),
(1, 1800, 200, 'credit', '2022-08-18 13:32:18.000000'),
(1, -200, 2000, 'debit', '2022-08-19 06:54:21.000000'),
(1, 1800, 2000, 'credit', '2022-08-19 06:55:07.000000'),
(1, 1600, 200, 'debit', '2022-08-19 07:00:18.000000'),
(1, 1400, 200, 'debit', '2022-08-19 07:06:45.000000'),
(1, 1800, 400, 'credit', '2022-08-19 07:06:51.000000'),
(1, 1600, 200, 'debit', '2022-08-19 08:08:26.000000'),
(1, 1800, 200, 'credit', '2022-08-19 08:12:26.000000'),
(1, 4800, 3000, 'credit', '2022-08-19 08:15:47.000000'),
(1, 5000, 200, 'credit', '2022-08-19 08:21:57.000000');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `acc_no` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `balance` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`acc_no`, `name`, `username`, `password`, `balance`) VALUES
(1, 'Tejas', 'tejas910', 'tejas910', '5000'),
(2, 'Suraj', 'suraj2212', 'suraj2212', '2500');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`acc_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
