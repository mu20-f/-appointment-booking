-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2024 at 01:55 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appointmentscheduler`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `username`, `email`, `phone`, `appointment_date`, `appointment_time`) VALUES
(56, 'Mu20_f', 'mustafafares2029@gmail.com', '0503201179', '2024-04-01', '12:00:00'),
(57, 'steav', 'mustafafares2029@gmail.com', '0503201179', '2024-04-01', '17:00:00'),
(58, 'Mu20_f', 'mustafafares2029@gmail.com', '0503201179', '2024-04-01', '13:00:00'),
(59, 'Mu20_f', 'mustafafares2029@gmail.com', '0503201179', '2024-04-01', '14:00:00'),
(60, 'Mu20_f', 'mustafafares2029@gmail.com', '0503201179', '2024-04-01', '15:00:00'),
(61, 'Mu20_f', 'mustafafares2029@gmail.com', '0503201179', '2024-04-01', '15:00:00'),
(62, 'Mu20_f', 'mustafafares2029@gmail.com', '0503201179', '2024-04-01', '19:00:00'),
(63, 'Mu20_f', 'mustafafares2029@gmail.com', '0503201179', '2024-04-01', '18:00:00'),
(64, 'Mu20_f', 'mustafafares2029@gmail.com', '0503201179', '2024-04-01', '20:00:00'),
(65, 'Mu20_f', 'mustafafares2029@gmail.com', '0503201179', '2024-04-01', '16:00:00'),
(66, 'Mu20_f', 'mustafafares2029@gmail.com', '0503201179', '2024-04-01', '21:00:00'),
(67, 'Mu20_f', 'mustafafares2029@gmail.com', '0503201179', '2024-03-23', '13:00:00'),
(68, 'Mu20_f', 'mustafafares2029@gmail.com', '1234567890', '2024-03-27', '14:00:00'),
(69, 'Mu20_f', 'mustafafares2029@gmail.com', '0503201179', '2024-04-03', '12:00:00'),
(70, 'Mu20_f', 'mustafafares2029@gmail.com', '0503201179', '2024-03-30', '14:00:00'),
(71, 'Mu20_f', 'mustafafares2029@gmail.com', '0503201179', '2024-03-30', '18:00:00'),
(72, 'ameen', 'mustafafares2029@gmail.com', '0503201179', '2024-03-23', '14:00:00'),
(73, 'مصطفى', 'mustafafares2029@gmail.com', '0503201179', '2024-04-03', '16:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
