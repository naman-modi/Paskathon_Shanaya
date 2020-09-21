-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 17, 2020 at 11:28 PM
-- Server version: 5.7.27-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shanaya`
--

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `contact` bigint(10) NOT NULL,
  `website_url` varchar(100) NOT NULL,
  `adv_provider_name` varchar(40) NOT NULL,
  `victim` tinyint(1) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `age` tinyint(4) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `description` varchar(500) NOT NULL,
  `images` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `records`
--

INSERT INTO `records` (`id`, `name`, `email_id`, `contact`, `website_url`, `adv_provider_name`, `victim`, `city`, `state`, `date`, `age`, `gender`, `description`, `images`) VALUES
(1, 'Shreya Hot Singhal', 'shreya@gmail.com', 435784754, 'kef', 'vnirbiorqb', 1, 'pune', 'maha', '2020-01-22', 20, 'female', 'i cried so much', 'pasc.sql'),
(2, 'Ved Dandekar', 'ved@gmail.com', 9834689427, 'www.google.com', 'Monster.com', 0, 'Mumbai', 'Maharashtra', '2019-11-14', 45, 'male', 'Ruined my life', 'pasc.sql'),
(4, 'Naman', 'nama@gmail.com', 9834639427, 'www.google.com', 'Monster.com', 1, 'Bangalore', 'Karnataka', '2019-09-23', 12, 'Female', 'Ruined my life', 'pasc.sql'),
(5, 'Ved Dandekar', 'ved@gmail.com', 9834689427, 'www.google.com', 'Monster.com', 0, 'New Delhi', 'New Delhi', '2019-07-14', 34, 'male', 'Ruined my life', 'pasc.sql'),
(6, 'Ved Dandekar', 'ved@gmail.com', 9834689427, 'www.google.com', 'Monster.com', 1, 'Mumbai', 'Maharashtra', '2019-11-14', 12, 'male', 'Ruined my life', 'pasc.sql'),
(7, 'Shreya', 'shreya@gmail.com', 9834689427, 'www.google.com', 'trivago', 0, 'New Delhi', 'New Delhi', '2019-02-14', 24, 'female', 'Ruined my life', 'pasc.sql'),
(8, 'Shreya', 'shreya@gmail.com', 9834689427, 'www.facebook.com', 'trivago', 0, 'Meerut', 'Uttar Pradesh', '2019-02-14', 24, 'female', 'Ruined my life', 'pasc.sql'),
(9, 'Shreya', 'shreya@gmail.com', 9834689427, 'www.facebook.com', 'hellois', 1, 'Pune', 'Maharashtra', '2019-06-14', 54, 'female', 'Ruined my life', 'pasc.sql'),
(10, 'Shanaya', 'shreya@gmail.com', 9834689427, 'www.facebook.com', 'hellois', 1, 'Pune', 'Maharashtra', '2019-07-14', 14, 'female', 'Ruined my life', 'pasc.sql'),
(11, 'Pranav', 'pranav@gmail.com', 9834689427, 'www.google.com', 'hellois', 1, 'Nashik', 'Maharashtra', '2019-03-14', 54, 'male', 'Ruined my life', 'pasc.sql'),
(12, 'Pranav', 'pranav@gmail.com', 9834689427, 'www.google.com', 'hellois', 1, 'Surat', 'Gujarat', '2019-09-14', 19, 'male', 'Ruined my life', 'pasc.sql'),
(13, 'Pranav', 'pranav@gmail.com', 9834689427, 'www.coep.com', 'hellois', 1, 'Surat', 'Gujarat', '2019-11-14', 22, 'male', 'Ruined my life', 'pasc.sql'),
(14, 'Ankita', 'pranav@gmail.com', 9834634562, 'www.google.com', 'hellois', 1, 'Kochi', 'Kerala', '2019-01-23', 33, 'female', 'Ruined my life', 'pasc.sql'),
(15, 'Ankita', 'pranav@gmail.com', 9834634562, 'www.google.com', 'hellois', 1, 'Kochi', 'Kerala', '2019-01-23', 33, 'female', 'Ruined my life', 'pasc.sql'),
(16, 'Ankita', 'pranav@gmail.com', 9834634562, 'www.hibernate.com', 'hellois', 1, 'Kanpur', 'Uttar Pradesh', '2019-03-23', 43, 'female', 'Ruined my life', 'pasc.sql'),
(17, 'Ankita', 'pranav@gmail.com', 9834634562, 'www.hibernate.com', 'hellois', 1, 'Kanpur', 'Uttar Pradesh', '2019-03-23', 43, 'female', 'Ruined my life', 'pasc.sql'),
(18, 'Shivani', 'shivv@gmail.com', 9834634562, 'www.google.com', 'hellois', 1, 'Bangalore', 'Karnataka', '2019-05-12', 28, 'female', 'Ruined my life', 'pasc.sql'),
(19, 'Shivani', 'shiv@gmail.com', 9834634562, 'www.google.com', 'hellois', 1, 'Calicut', 'Andhra Pradesh', '2019-10-13', 36, 'female', 'Ruined my life', 'pasc.sql'),
(20, 'Vasu', 'susu@gmail.com', 9834634562, 'www.google.com', 'hellois', 1, 'New Delhi', 'Delhi', '2019-05-12', 18, 'male', 'Ruined my life', 'pasc.sql'),
(21, 'Vasu', 'susu@gmail.com', 9834634562, 'www.getlost.com', 'hellois', 1, 'New Delhi', 'Delhi', '2019-08-12', 8, 'male', 'Ruined my life', 'pasc.sql'),
(22, 'Vasuda', 'susu@gmail.com', 9834634562, 'www.google.com', 'hellois', 1, 'Chennai', 'Tamil Nadu', '2019-05-12', 38, 'female', 'Ruined my life', 'pasc.sql');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `records`
--
ALTER TABLE `records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
