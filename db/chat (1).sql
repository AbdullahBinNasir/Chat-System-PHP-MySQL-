-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2024 at 10:05 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `chatrooms`
--

CREATE TABLE `chatrooms` (
  `id` int(11) NOT NULL,
  `room_name` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `msg` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chatrooms`
--

INSERT INTO `chatrooms` (`id`, `room_name`, `created_on`, `user_id`, `userid`, `msg`) VALUES
(5, '', '2024-08-14 04:58:36', NULL, 12, 'Hello Everyone'),
(6, '', '2024-08-14 04:58:50', NULL, 10, 'Hi Shamsi');

-- --------------------------------------------------------

--
-- Table structure for table `chat_message`
--

CREATE TABLE `chat_message` (
  `chat_message_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `chat_message` text NOT NULL,
  `timestamp` datetime NOT NULL,
  `status` enum('Yes','No') NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_message`
--

INSERT INTO `chat_message` (`chat_message_id`, `from_user_id`, `to_user_id`, `chat_message`, `timestamp`, `status`) VALUES
(5, 12, 10, 'Hello Abdullah Nasir', '2024-08-14 09:59:06', 'Yes'),
(6, 10, 12, 'Hello Sir', '2024-08-14 09:59:23', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `chat_user_table`
--

CREATE TABLE `chat_user_table` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_profile` varchar(255) NOT NULL,
  `user_status` varchar(50) NOT NULL,
  `user_created_on` datetime NOT NULL,
  `user_verification_code` varchar(255) NOT NULL,
  `user_login_status` varchar(50) NOT NULL,
  `user_token` varchar(255) NOT NULL,
  `user_connection_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_user_table`
--

INSERT INTO `chat_user_table` (`user_id`, `user_name`, `user_email`, `user_password`, `user_profile`, `user_status`, `user_created_on`, `user_verification_code`, `user_login_status`, `user_token`, `user_connection_id`) VALUES
(10, 'Abdullah Nasir', 'abdullahnasir2207@gmail.com', 'Abdullah', 'images/1723619162.png', 'Enable', '2024-08-14 09:06:02', '2de1dd97b28231d158eafb771ece4260', 'Login', '5b9cf5e0a6af9034afb95730838b24a0', '211'),
(12, 'Shamsi', 'a.dshamsi227@gmail.com', 'Abdullah', 'images/1723622290.png', 'Enable', '2024-08-14 09:58:10', 'cc85d3e8b2ed75fc23a8ca03bd894520', 'Login', 'e7bd9539bef2e843bc576f43a21e98e0', '205');

-- --------------------------------------------------------

--
-- Table structure for table `privatechat`
--

CREATE TABLE `privatechat` (
  `chat_message_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `chat_message` text NOT NULL,
  `timestamp` datetime NOT NULL,
  `status` enum('Yes','No') DEFAULT 'No',
  `msg` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chatrooms`
--
ALTER TABLE `chatrooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_message`
--
ALTER TABLE `chat_message`
  ADD PRIMARY KEY (`chat_message_id`),
  ADD KEY `from_user_id` (`from_user_id`),
  ADD KEY `to_user_id` (`to_user_id`);

--
-- Indexes for table `chat_user_table`
--
ALTER TABLE `chat_user_table`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `privatechat`
--
ALTER TABLE `privatechat`
  ADD PRIMARY KEY (`chat_message_id`),
  ADD KEY `from_user_id` (`from_user_id`),
  ADD KEY `to_user_id` (`to_user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chatrooms`
--
ALTER TABLE `chatrooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `chat_message`
--
ALTER TABLE `chat_message`
  MODIFY `chat_message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `chat_user_table`
--
ALTER TABLE `chat_user_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `privatechat`
--
ALTER TABLE `privatechat`
  MODIFY `chat_message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat_message`
--
ALTER TABLE `chat_message`
  ADD CONSTRAINT `chat_message_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `chat_user_table` (`user_id`),
  ADD CONSTRAINT `chat_message_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `chat_user_table` (`user_id`);

--
-- Constraints for table `privatechat`
--
ALTER TABLE `privatechat`
  ADD CONSTRAINT `privatechat_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `chat_user_table` (`user_id`),
  ADD CONSTRAINT `privatechat_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `chat_user_table` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
