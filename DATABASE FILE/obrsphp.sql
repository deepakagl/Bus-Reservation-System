SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `booked` (
  `id` int(30) NOT NULL,
  `schedule_id` int(30) NOT NULL,
  `ref_no` text NOT NULL,
  `name` varchar(250) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '1=Paid, 0- Unpaid',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `bus` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `bus_number` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = inactive, 1 = active',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `bus` (`id`, `name`, `bus_number`, `status`, `date_updated`) VALUES
(1, 'Mysore Roadways', 'KA15JH8971', 1, '2022-06-24 18:59:55'),
(2, 'GMysore Roadways', 'KA15JH8977', 1, '2022-06-24 19:00:21'),
(3, 'Mysore Roadways', 'KA15JH8922', 1, '2022-06-24 19:00:37'),
(4, 'Mysore Roadways', 'KA15JH6871', 1, '2022-06-24 19:00:51'),
(5, 'Shantirath', 'KA15JH5671', 1, '2022-06-24 19:01:13'),
(6, 'BoltBus', 'KA15JH8222', 1, '2022-06-24 19:01:18'),
(7, 'Volvo', 'KA15JH8781', 1, '2022-06-24 19:01:38'),
(8, 'Shantirath', 'KA15JH8231', 1, '2022-06-24 19:01:54'),
(9, 'Volvo', 'KA15JH8441', 1, '2022-06-24 19:02:14'),
(10, 'Crazy travel', 'KA15JH2271', 1, '2022-06-24 19:02:38'),
(11, 'Crazy travel', 'KA15JH6971', 1, '2022-06-24 19:02:54');

CREATE TABLE `location` (
  `id` int(30) NOT NULL,
  `terminal_name` text NOT NULL,
  `city` varchar(250) NOT NULL,
  `state` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0= inactive , 1= active',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `location` (`id`, `terminal_name`, `city`, `state`, `status`, `date_updated`) VALUES
(1, 'Kengeri', 'Banglore', 'Karnataka', 1, '2022-06-24 19:10:58'),
(2, 'Majestic', 'Banglore', 'Karnataka', 1, '2022-06-24 19:12:12'),
(3, 'Hebbal', 'Banglore', 'Karnataka', 1, '2022-06-24 19:13:08'),
(4, 'GT Road', 'Dhanbad', 'Jharkhand', 1, '2022-06-24 19:13:35'),
(5, 'Mysore palace', 'Mysore', 'Karnataka', 1, '2022-06-24 19:12:49'),
(6, 'Airport', 'Mysore', 'Karnataka', 1, '2022-06-24 19:14:05'),
(7, 'Railway station', 'Mysore', 'Karnataka', 1, '2022-06-24 19:13:51'),
(8, 'Bus stand', 'Salem', 'Tamil Nadu', 1, '2022-06-24 19:13:18'),
(9, 'Lake point', 'Ooty', 'Tamil Nadu', 1, '2022-06-24 19:09:37'),
(10, 'Railway station', 'Patna', 'Bihar', 1, '2022-06-24 19:14:25'),
(11, 'Airport', 'Darbhanga', 'Bihar', 1, '2022-06-25 22:05:24'),
(12, 'Railway station', 'Bhagalpur', 'Bihar', 1, '2022-06-25 22:06:11');


CREATE TABLE `schedule_list` (
  `id` int(30) NOT NULL,
  `bus_id` int(30) NOT NULL,
  `from_location` int(30) NOT NULL,
  `to_location` int(30) NOT NULL,
  `departure_time` datetime NOT NULL,
  `eta` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `availability` int(11) NOT NULL,
  `price` text NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `schedule_list` (`id`, `bus_id`, `from_location`, `to_location`, `departure_time`, `eta`, `status`, `availability`, `price`, `date_updated`) VALUES
(1, 11, 1, 5, '2022-06-25 15:00:00', '2022-06-25 20:00:00', 1, 25, '50', '2022-06-25 17:27:08'),
(2, 6, 1, 4, '2022-06-25 20:00:00', '2022-06-25 01:00:00', 1, 30, '26', '2022-06-25 09:09:20'),
(3, 1, 3, 9, '2022-06-26 10:00:00', '2022-06-26 16:00:00', 1, 32, '33', '2022-06-25 09:10:46'),
(4, 9, 4, 1, '2022-06-26 08:00:00', '2022-06-26 19:00:00', 1, 30, '65', '2022-06-25 09:11:55'),
(5, 7, 8, 10, '2022-06-27 10:00:00', '2022-06-27 19:00:00', 1, 33, '80', '2022-06-25 09:13:02'),
(6, 4, 7, 6, '2022-06-26 11:00:00', '2022-06-25 13:00:00', 1, 35, '43', '2022-06-25 09:17:10'),
(7, 8, 9, 4, '2022-06-27 15:00:00', '2022-06-27 23:00:00', 1, 34, '75', '2022-06-25 09:18:08'),
(8, 3, 6, 2, '2022-06-27 12:00:00', '2022-06-25 17:00:00', 1, 31, '68', '2022-06-25 09:20:35'),
(9, 10, 11, 12, '2022-06-26 10:00:00', '2022-06-26 13:00:00', 1, 38, '65', '2022-06-25 17:36:18');

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(150) NOT NULL,
  `user_type` tinyint(1) NOT NULL DEFAULT '1',
  `username` varchar(25) NOT NULL,
  `password` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT ' 0 = incative , 1 = active',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`id`, `name`, `user_type`, `username`, `password`, `status`, `date_updated`) VALUES
(1, 'Administrator', 1, 'admin', '81dc9bdb52d04dc20036dbd8313ed055', 1, '2022-06-25 20:13:42'),
(3, 'AdminWilly', 2, 'willy', 'f2d0ff370380124029c2b807a924156c', 1, '2022-06-25 20:14:01'),
(4, 'AdminLea', 1, 'leadmin', 'f2d0ff370380124029c2b807a924156c', 1, '2022-06-25 20:14:03');


ALTER TABLE `booked`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `schedule_list`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `booked`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `bus`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `location`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `schedule_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
