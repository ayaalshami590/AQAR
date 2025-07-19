-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2025 at 02:55 AM
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
-- Database: `aqar`
--

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `property_id`) VALUES
(1, 1, 3),
(2, 1, 11),
(3, 2, 1),
(4, 2, 10),
(5, 3, 5),
(6, 3, 15),
(7, 4, 8),
(8, 4, 18),
(9, 5, 6),
(10, 5, 20);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `city` varchar(50) NOT NULL,
  `area` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `city`, `area`) VALUES
(1, 'دمشق', 'المزة'),
(2, 'دمشق', 'كفر سوسة'),
(3, 'دمشق', 'القدس'),
(4, 'حمص', 'الكرامة'),
(5, 'حمص', 'الإنشاءات'),
(6, 'حمص', 'الضاحية');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `property_type` enum('house','villa','land','commercial') NOT NULL,
  `transaction_type` enum('sale','rent') NOT NULL,
  `location_id` int(11) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `size` decimal(10,2) NOT NULL,
  `communication_number` varchar(20) NOT NULL,
  `rooms` int(11) DEFAULT 0,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `property_type`, `transaction_type`, `location_id`, `price`, `size`, `communication_number`, `rooms`, `user_id`) VALUES
(1, 'house', 'sale', 1, 250000000.00, 180.00, '0912345678', 4, 1),
(2, 'villa', 'rent', 1, 1500000.00, 300.00, '0934567890', 6, 2),
(3, 'commercial', 'sale', 1, 500000000.00, 120.00, '0945678901', 0, 3),
(4, 'land', 'sale', 2, 80000000.00, 500.00, '0956789012', 0, 4),
(5, 'house', 'rent', 2, 600000.00, 150.00, '0967890123', 3, 5),
(6, 'villa', 'sale', 2, 350000000.00, 250.00, '0978901234', 5, 1),
(7, 'commercial', 'rent', 3, 800000.00, 80.00, '0989012345', 0, 2),
(8, 'house', 'sale', 3, 180000000.00, 160.00, '0990123456', 3, 3),
(9, 'land', 'rent', 3, 500000.00, 700.00, '0911234567', 0, 4),
(10, 'villa', 'sale', 4, 420000000.00, 280.00, '0922345678', 4, 5),
(11, 'house', 'rent', 4, 700000.00, 140.00, '0933456789', 3, 1),
(12, 'commercial', 'sale', 4, 75000000.00, 90.00, '0944567890', 0, 2),
(13, 'land', 'sale', 5, 65000000.00, 400.00, '0955678901', 0, 3),
(14, 'house', 'sale', 5, 195000000.00, 170.00, '0966789012', 4, 4),
(15, 'villa', 'rent', 5, 1200000.00, 220.00, '0977890123', 4, 5),
(16, 'commercial', 'rent', 6, 950000.00, 70.00, '0988901234', 0, 1),
(17, 'land', 'sale', 6, 95000000.00, 600.00, '0999012345', 0, 2),
(18, 'house', 'rent', 6, 550000.00, 130.00, '0910123456', 2, 3),
(19, 'villa', 'sale', 6, 280000000.00, 200.00, '0921234567', 3, 4),
(20, 'commercial', 'sale', 6, 60000000.00, 85.00, '0932345678', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `property_photos`
--

CREATE TABLE `property_photos` (
  `id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `photo_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_photos`
--

INSERT INTO `property_photos` (`id`, `property_id`, `photo_url`) VALUES
(1, 1, '/photos/damascus1_1.jpg'),
(2, 1, '/photos/damascus1_2.jpg'),
(3, 2, '/photos/damascus2_1.jpg'),
(4, 3, '/photos/damascus3_1.jpg'),
(5, 4, '/photos/damascus4_1.jpg'),
(6, 5, '/photos/damascus5_1.jpg'),
(7, 6, '/photos/damascus6_1.jpg'),
(8, 7, '/photos/damascus7_1.jpg'),
(9, 8, '/photos/damascus8_1.jpg'),
(10, 9, '/photos/damascus9_1.jpg'),
(11, 10, '/photos/homs1_1.jpg'),
(12, 11, '/photos/homs2_1.jpg'),
(13, 12, '/photos/homs3_1.jpg'),
(14, 13, '/photos/homs4_1.jpg'),
(15, 14, '/photos/homs5_1.jpg'),
(16, 15, '/photos/homs6_1.jpg'),
(17, 16, '/photos/homs7_1.jpg'),
(18, 17, '/photos/homs8_1.jpg'),
(19, 18, '/photos/homs9_1.jpg'),
(20, 19, '/photos/homs10_1.jpg'),
(21, 20, '/photos/homs11_1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'محمد علي', 'mohamed@example.com', '123456'),
(2, 'فاطمة حسن', 'fatima@example.com', 'abcdef'),
(3, 'خالد إبراهيم', 'khaled@example.com', 'myp@ss'),
(4, 'سارة أحمد', 'sara@example.com', 'sara123'),
(5, 'عمر عبدالله', 'omar@example.com', '0m@r_pass');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `property_photos`
--
ALTER TABLE `property_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `property_photos`
--
ALTER TABLE `property_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`);

--
-- Constraints for table `properties`
--
ALTER TABLE `properties`
  ADD CONSTRAINT `properties_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `properties_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

--
-- Constraints for table `property_photos`
--
ALTER TABLE `property_photos`
  ADD CONSTRAINT `property_photos_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
