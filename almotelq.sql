-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 25, 2021 at 07:29 PM
-- Server version: 5.7.32-0ubuntu0.18.04.1
-- PHP Version: 7.3.24-3+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `almotelq`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL,
  `vendor_id` int(10) UNSIGNED NOT NULL,
  `vendor_service_id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `phone_number` varchar(225) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `service_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `service_amount` decimal(8,2) NOT NULL,
  `tax_percentage` int(11) DEFAULT NULL,
  `tax_amount` decimal(8,2) NOT NULL,
  `total_service_amount` decimal(8,2) NOT NULL,
  `booking_amount` decimal(8,2) NOT NULL,
  `commission_percentage` int(11) NOT NULL,
  `commission_amount` decimal(8,2) NOT NULL,
  `total_payable_amount` decimal(8,2) NOT NULL,
  `remaining_amount` decimal(8,2) NOT NULL,
  `booking_payment_status` enum('0','1') NOT NULL DEFAULT '0',
  `booking_payment_date` datetime DEFAULT NULL,
  `remaining_payment_status` enum('0','1') DEFAULT '0',
  `remaining_payment_date` datetime DEFAULT NULL,
  `is_rating` enum('0','1') DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `status`, `user_id`, `vendor_id`, `vendor_service_id`, `user_name`, `phone_number`, `email`, `service_name`, `appointment_date`, `appointment_time`, `service_amount`, `tax_percentage`, `tax_amount`, `total_service_amount`, `booking_amount`, `commission_percentage`, `commission_amount`, `total_payable_amount`, `remaining_amount`, `booking_payment_status`, `booking_payment_date`, `remaining_payment_status`, `remaining_payment_date`, `is_rating`, `created_at`, `updated_at`, `deleted_at`) VALUES
(43, 1, 28, 20, 36, 'Shivam', '8349877407', 'ramlal@gmail.com', 'Aakash Service', '2021-01-08', '10:00:00', '5000.00', 15, '907.50', '6957.50', '695.75', 10, '695.75', '6957.50', '6261.75', '1', '2020-12-29 08:06:13', '1', '2020-12-29 08:06:53', '0', '2020-12-29 08:04:57', '2020-12-29 08:13:42', NULL),
(44, 1, 28, 20, 27, 'Shivam', '8349877407', 'ramlal@gmail.com', 'Hair cuting', '2021-01-06', '10:15:00', '209.00', 15, '31.35', '240.35', '24.04', 10, '24.04', '240.35', '216.32', '1', '2020-12-29 08:16:05', '0', NULL, '0', '2020-12-29 08:15:38', '2020-12-29 08:16:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_ratings`
--

CREATE TABLE `app_ratings` (
  `app_rating_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `rating` int(10) UNSIGNED DEFAULT NULL,
  `review` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_ratings`
--

INSERT INTO `app_ratings` (`app_rating_id`, `user_id`, `rating`, `review`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 7, 1, 'best', '2020-10-09 02:56:50', '2020-10-09 02:56:50', '2020-10-09 12:26:50');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `category_name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `category_image` varchar(225) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_name_ar`, `category_image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Eyebrows', 'الحاجبين', '3.png', '2020-09-15 11:19:18', '2020-12-24 09:02:55', NULL),
(2, 'Eyelashes', 'رموش العين', '2.png', '2020-09-15 11:19:18', '2020-12-24 09:03:06', NULL),
(3, 'Hairstyles', 'تسريحات الشعر', '4.png', '2020-09-15 11:19:18', '2020-12-24 09:03:21', NULL),
(4, 'Haircut', 'حلاقة شعر', '1.png', '2020-09-15 11:19:18', '2020-12-24 09:03:35', NULL),
(5, 'Makeup', 'ميك أب', '5.png', '2020-09-15 11:19:18', '2020-12-24 09:03:45', NULL),
(8, 'Spa', 'منتجع صحي', 'kf05E3JV9d_1600578997.png', '2020-09-20 01:05:02', '2020-12-24 09:03:58', NULL),
(9, 'Tattoos', 'الأوشام', '4.png', '2020-09-15 11:19:18', '2020-12-24 09:04:14', NULL),
(10, 'Painting', 'لوحة', '1.png', '2020-09-15 11:19:18', '2020-12-24 09:04:29', NULL),
(11, 'Lips', 'الشفاه', '5.png', '2020-09-15 11:19:18', '2020-12-24 09:04:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `chat_id` int(10) UNSIGNED NOT NULL,
  `chat_unique_id` varchar(225) NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL,
  `receiver_id` int(10) UNSIGNED NOT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `read_status` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`chat_id`, `chat_unique_id`, `sender_id`, `receiver_id`, `message`, `read_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'chat16021381204054', 6, 7, 'Hi Vendor', '0', '2020-10-07 20:52:00', '2020-10-07 20:52:00', NULL),
(2, 'chat16021381204054', 6, 7, 'Hi Vendor', '0', '2020-10-07 20:52:12', '2020-10-07 20:52:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `commission_id` int(10) UNSIGNED NOT NULL,
  `type` enum('1','2','3','4') NOT NULL DEFAULT '1',
  `price` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `commissions`
--

INSERT INTO `commissions` (`commission_id`, `type`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', '30.00', '2020-02-12 10:59:53', '2020-02-12 10:59:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `day_id` int(10) UNSIGNED NOT NULL,
  `day_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `day_status` enum('0','1') DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`day_id`, `day_name`, `day_status`, `start_time`, `end_time`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Sunday', '0', '09:45:00', '06:45:00', '2020-09-15 12:23:09', '2020-09-15 12:23:09', NULL),
(2, 'Monday', '0', '09:45:00', '06:45:00', '2020-09-15 12:23:09', '2020-09-15 12:23:09', NULL),
(3, 'Tuesday', '0', '09:45:00', '06:45:00', '2020-09-15 12:23:09', '2020-09-15 12:23:09', NULL),
(4, 'Wednesday', '0', '09:45:00', '06:45:00', '2020-09-15 12:23:09', '2020-09-15 12:23:09', NULL),
(5, 'Thursday', '0', '09:45:00', '06:45:00', '2020-09-15 12:23:09', '2020-09-15 12:23:09', NULL),
(6, 'Friday', '0', '09:45:00', '06:45:00', '2020-09-15 12:23:09', '2020-09-15 12:23:09', NULL),
(7, 'Saturday', '0', '09:45:00', '06:45:00', '2020-09-15 12:23:09', '2020-09-15 12:23:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `document_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` enum('1','2') NOT NULL COMMENT '1=Driving Licence,2=Driving Insurance',
  `document` varchar(225) DEFAULT NULL,
  `approve_status` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '0=unapproved,1=approved,2=rejected',
  `rejected_reason` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`document_id`, `user_id`, `type`, `document`, `approve_status`, `rejected_reason`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 7, '1', 'Image1', '0', NULL, NULL, NULL, NULL),
(2, 7, '1', 'Image1', '0', NULL, NULL, NULL, NULL),
(3, 7, '1', 'Image1', '0', NULL, NULL, NULL, NULL),
(4, 7, '1', 'Image1', '0', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `landing_pages`
--

CREATE TABLE `landing_pages` (
  `id` int(11) UNSIGNED NOT NULL,
  `section` varchar(255) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT '1',
  `title` text,
  `sub_title` text,
  `description` text,
  `link` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `landing_pages`
--

INSERT INTO `landing_pages` (`id`, `section`, `order`, `title`, `sub_title`, `description`, `link`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'home_top_slider', 1, 'Expert Service you Can Trust', 'Special Feature', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. 1', NULL, NULL, '2021-01-25 12:30:22', NULL, NULL),
(2, 'special_feature', 1, 'Expert Employee', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web', '', NULL, NULL, '2021-01-25 14:50:13', NULL, NULL),
(3, 'special_feature', 2, 'Affordable Package', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs..', 'fsdf', NULL, NULL, '2021-01-25 15:28:50', NULL, NULL),
(4, 'special_feature', 3, '100% Satisfaction', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web', 'fsdf', NULL, NULL, '2021-01-25 15:28:54', NULL, NULL),
(5, 'our_vision', 1, 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs.', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs.', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs.', NULL, NULL, '2021-01-25 15:28:54', NULL, NULL),
(14, 'online_marketing', 1, 'Digital Marketing', 'By ALMOTELQ', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum.', NULL, 'WaMBpY59iB.1611575927.png', '2021-01-25 16:40:04', NULL, NULL),
(15, 'trading', 1, 'Digital Trading', 'By ALMOTELQ', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum', NULL, 'CRioswopDx.1611575990.jpg', '2021-01-25 16:40:10', NULL, NULL),
(16, 'develop', 1, 'Development', 'By ALMOTELQ', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum.', NULL, 'YWIXBkLls3.1611576087.png', '2021-01-25 16:40:10', NULL, NULL),
(17, 'online_services', 1, 'Online Service', 'By ALMOTELQ', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum', NULL, 'DMYvyNmmxH.1611576188.png', '2021-01-25 16:44:49', NULL, NULL),
(25, 'online_marketing', 2, 'Grow Your Bussiness', 'By ALMOTELQ', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs.', NULL, 'uiDVd6Y1Tk.1611575945.jpg', '2021-01-25 17:23:58', NULL, NULL),
(28, 'online_marketing', 3, 'Online Marketing', 'By ALMOTELQ', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum.', NULL, 'qssOLNtjuH.1611575852.jpg', '2021-01-25 17:24:55', NULL, NULL),
(29, 'trading', 2, 'Bull & Bear', 'By ALMOTELQ', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs.', NULL, 'BsTVnLN2KJ.1611576021.jpg', '2021-01-25 17:29:54', NULL, NULL),
(30, 'trading', 3, 'Earn Profit', 'By ALMOTELQ', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs.', NULL, 'IODhIOJssK.1611576056.jpg', '2021-01-25 17:30:25', NULL, NULL),
(31, 'develop', 2, 'Your idea, Our work', 'By ALMOTELQ', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs.', NULL, 'W1iJoIduC9.1611576121.jpg', '2021-01-25 17:31:29', NULL, NULL),
(32, 'develop', 3, 'Put everything on internet', 'By ALMOTELQ', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs.', NULL, 'fBdzS9DGEe.1611576154.jpeg', '2021-01-25 17:32:03', NULL, NULL),
(33, 'online_services', 2, '24 hour customer support', 'By ALMOTELQ', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs.', NULL, 'NIHyHCrjB7.1611576219.jpg', '2021-01-25 17:33:09', NULL, NULL),
(34, 'online_services', 3, 'Online Digital Service', 'By ALMOTELQ', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphlipsum as it is sometimes knowr web designs.', NULL, 'cWUbmVYgVV.1611576255.jpg', '2021-01-25 17:33:49', NULL, NULL),
(41, 'portfolio', 1, 'National thermal Power corporation Limited', NULL, NULL, 'Titlefdsfs', 'Vgm7x6Ay7s.1611578175.jpeg', '2021-01-25 17:48:20', NULL, NULL),
(42, 'portfolio', 2, 'Test Product', NULL, NULL, 'Titlefdsfs', 'Tfj6tvaSZj.1611578195.jpg', '2021-01-25 18:06:26', NULL, NULL),
(46, 'online_marketing', 4, NULL, NULL, NULL, NULL, NULL, '2021-01-25 18:17:43', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `landing_page_images`
--

CREATE TABLE `landing_page_images` (
  `id` int(11) UNSIGNED NOT NULL,
  `section` varchar(100) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT '1',
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL,
  `receiver_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `message` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `json_data` text CHARACTER SET utf8 COLLATE utf8_bin,
  `read_status` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `sender_id`, `receiver_id`, `title`, `message`, `json_data`, `read_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(146, 20, 46, 'Booking Rejected', 'Your booking rejected by ambuj tripathi', '{\"key\":\"Order_Rejected\",\"title\":\"Booking Rejected\",\"message\":\"Your booking rejected by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":46,\"id\":\"105\"}', '0', '2020-12-24 08:49:22', '2020-12-24 08:49:22', NULL),
(147, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"107\"}', '1', '2020-12-24 08:50:39', '2020-12-29 08:20:17', NULL),
(148, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"108\"}', '1', '2020-12-24 08:54:32', '2020-12-29 08:20:17', NULL),
(149, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"109\"}', '1', '2020-12-24 08:55:38', '2020-12-29 08:20:17', NULL),
(150, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"110\"}', '1', '2020-12-24 08:56:09', '2020-12-29 08:20:17', NULL),
(151, 46, 44, 'New booking', 'You have a new booking by Noraaaaa', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Noraaaaa\",\"sender_id\":46,\"receiver_id\":44,\"id\":112}', '1', '2020-12-24 09:37:59', '2020-12-25 11:13:48', NULL),
(152, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"116\"}', '1', '2020-12-25 01:23:26', '2020-12-29 08:20:17', NULL),
(153, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"116\"}', '1', '2020-12-25 01:23:37', '2020-12-29 08:20:17', NULL),
(154, 20, 28, 'Booking Accepted', 'Your booking accepted by ambuj tripathi', '{\"key\":\"Order_Accepted\",\"title\":\"Booking Accepted\",\"message\":\"Your booking accepted by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"116\"}', '1', '2020-12-25 01:24:55', '2020-12-29 06:12:54', NULL),
(155, 20, 28, 'Booking Accepted', 'Your booking accepted by ambuj tripathi', '{\"key\":\"Order_Accepted\",\"title\":\"Booking Accepted\",\"message\":\"Your booking accepted by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"110\"}', '1', '2020-12-25 01:25:04', '2020-12-29 06:12:54', NULL),
(156, 20, 28, 'Booking Accepted', 'Your booking accepted by ambuj tripathi', '{\"key\":\"Order_Accepted\",\"title\":\"Booking Accepted\",\"message\":\"Your booking accepted by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"115\"}', '1', '2020-12-25 01:25:09', '2020-12-29 06:12:54', NULL),
(157, 20, 28, 'Booking Accepted', 'Your booking accepted by ambuj tripathi', '{\"key\":\"Order_Accepted\",\"title\":\"Booking Accepted\",\"message\":\"Your booking accepted by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"109\"}', '1', '2020-12-25 01:25:15', '2020-12-29 06:12:54', NULL),
(158, 20, 28, 'Booking Accepted', 'Your booking accepted by ambuj tripathi', '{\"key\":\"Order_Accepted\",\"title\":\"Booking Accepted\",\"message\":\"Your booking accepted by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"108\"}', '1', '2020-12-25 01:25:20', '2020-12-29 06:12:54', NULL),
(159, 20, 28, 'Booking Accepted', 'Your booking accepted by ambuj tripathi', '{\"key\":\"Order_Accepted\",\"title\":\"Booking Accepted\",\"message\":\"Your booking accepted by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"107\"}', '1', '2020-12-25 01:25:26', '2020-12-29 06:12:54', NULL),
(160, 20, 28, 'Booking Accepted', 'Your booking accepted by ambuj tripathi', '{\"key\":\"Order_Accepted\",\"title\":\"Booking Accepted\",\"message\":\"Your booking accepted by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"101\"}', '1', '2020-12-25 01:25:40', '2020-12-29 06:12:54', NULL),
(161, 20, 28, 'Booking Accepted', 'Your booking accepted by ambuj tripathi', '{\"key\":\"Order_Accepted\",\"title\":\"Booking Accepted\",\"message\":\"Your booking accepted by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"100\"}', '1', '2020-12-25 01:25:45', '2020-12-29 06:12:54', NULL),
(162, 20, 28, 'Booking Completed', 'Your booking completed by ambuj tripathi', '{\"key\":\"Order_Completed\",\"title\":\"Booking Completed\",\"message\":\"Your booking completed by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"116\"}', '1', '2020-12-25 01:25:57', '2020-12-29 06:12:54', NULL),
(163, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"117\"}', '1', '2020-12-25 03:05:20', '2020-12-29 08:20:17', NULL),
(164, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"117\"}', '1', '2020-12-25 03:05:50', '2020-12-29 08:20:17', NULL),
(165, 20, 28, 'Booking Completed', 'Your booking completed by ambuj tripathi', '{\"key\":\"Order_Completed\",\"title\":\"Booking Completed\",\"message\":\"Your booking completed by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"110\"}', '1', '2020-12-25 04:24:09', '2020-12-29 06:12:54', NULL),
(166, 20, 28, 'Booking Completed', 'Your booking completed by ambuj tripathi', '{\"key\":\"Order_Completed\",\"title\":\"Booking Completed\",\"message\":\"Your booking completed by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"110\"}', '1', '2020-12-25 04:24:10', '2020-12-29 06:12:54', NULL),
(167, 20, 28, 'Booking Completed', 'Your booking completed by ambuj tripathi', '{\"key\":\"Order_Completed\",\"title\":\"Booking Completed\",\"message\":\"Your booking completed by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"109\"}', '1', '2020-12-25 04:24:24', '2020-12-29 06:12:54', NULL),
(168, 20, 28, 'Booking Completed', 'Your booking completed by ambuj tripathi', '{\"key\":\"Order_Completed\",\"title\":\"Booking Completed\",\"message\":\"Your booking completed by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"109\"}', '1', '2020-12-25 04:24:24', '2020-12-29 06:12:54', NULL),
(169, 20, 28, 'Booking Completed', 'Your booking completed by ambuj tripathi', '{\"key\":\"Order_Completed\",\"title\":\"Booking Completed\",\"message\":\"Your booking completed by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"109\"}', '1', '2020-12-25 04:24:25', '2020-12-29 06:12:54', NULL),
(170, 20, 28, 'Booking Completed', 'Your booking completed by ambuj tripathi', '{\"key\":\"Order_Completed\",\"title\":\"Booking Completed\",\"message\":\"Your booking completed by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"109\"}', '1', '2020-12-25 04:24:26', '2020-12-29 06:12:54', NULL),
(171, 20, 28, 'Booking Completed', 'Your booking completed by ambuj tripathi', '{\"key\":\"Order_Completed\",\"title\":\"Booking Completed\",\"message\":\"Your booking completed by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"108\"}', '1', '2020-12-25 04:24:37', '2020-12-29 06:12:54', NULL),
(172, 20, 28, 'Booking Completed', 'Your booking completed by ambuj tripathi', '{\"key\":\"Order_Completed\",\"title\":\"Booking Completed\",\"message\":\"Your booking completed by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"107\"}', '1', '2020-12-25 04:25:09', '2020-12-29 06:12:54', NULL),
(173, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"118\"}', '1', '2020-12-25 05:30:04', '2020-12-29 08:20:17', NULL),
(174, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"119\"}', '1', '2020-12-25 05:33:41', '2020-12-29 08:20:17', NULL),
(175, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"119\"}', '1', '2020-12-25 05:33:54', '2020-12-29 08:20:17', NULL),
(176, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"120\"}', '1', '2020-12-25 05:39:25', '2020-12-29 08:20:17', NULL),
(177, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"120\"}', '1', '2020-12-25 05:39:37', '2020-12-29 08:20:17', NULL),
(178, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"122\"}', '1', '2020-12-25 05:45:23', '2020-12-29 08:20:17', NULL),
(179, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"122\"}', '1', '2020-12-25 05:45:34', '2020-12-29 08:20:17', NULL),
(180, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"123\"}', '1', '2020-12-25 06:10:26', '2020-12-29 08:20:17', NULL),
(181, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"123\"}', '1', '2020-12-25 06:10:35', '2020-12-29 08:20:17', NULL),
(182, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"1\"}', '1', '2020-12-25 06:15:28', '2020-12-29 08:20:17', NULL),
(183, 20, 28, 'Booking Accepted', 'Your booking accepted by ambuj tripathi', '{\"key\":\"Order_Accepted\",\"title\":\"Booking Accepted\",\"message\":\"Your booking accepted by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"1\"}', '1', '2020-12-25 06:51:27', '2020-12-29 06:12:54', NULL),
(184, 20, 28, 'Booking Completed', 'Your booking completed by ambuj tripathi', '{\"key\":\"Order_Completed\",\"title\":\"Booking Completed\",\"message\":\"Your booking completed by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"1\"}', '1', '2020-12-25 06:56:40', '2020-12-29 06:12:54', NULL),
(185, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"2\"}', '1', '2020-12-25 07:00:29', '2020-12-29 08:20:17', NULL),
(186, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"4\"}', '1', '2020-12-25 07:02:32', '2020-12-29 08:20:17', NULL),
(187, 20, 28, 'Booking Accepted', 'Your booking accepted by ambuj tripathi', '{\"key\":\"Order_Accepted\",\"title\":\"Booking Accepted\",\"message\":\"Your booking accepted by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"4\"}', '1', '2020-12-25 07:05:13', '2020-12-29 06:12:54', NULL),
(188, 20, 28, 'Booking Completed', 'Your booking completed by ambuj tripathi', '{\"key\":\"Order_Completed\",\"title\":\"Booking Completed\",\"message\":\"Your booking completed by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"4\"}', '1', '2020-12-25 07:05:34', '2020-12-29 06:12:54', NULL),
(189, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"5\"}', '1', '2020-12-25 07:28:16', '2020-12-29 08:20:17', NULL),
(190, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"6\"}', '1', '2020-12-25 07:28:55', '2020-12-29 08:20:17', NULL),
(191, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"7\"}', '1', '2020-12-25 08:28:15', '2020-12-29 08:20:17', NULL),
(192, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"9\"}', '1', '2020-12-25 08:49:31', '2020-12-29 08:20:17', NULL),
(193, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"11\"}', '1', '2020-12-25 08:53:53', '2020-12-29 08:20:17', NULL),
(194, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"12\"}', '1', '2020-12-25 08:56:07', '2020-12-29 08:20:17', NULL),
(195, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"21\"}', '1', '2020-12-25 09:08:50', '2020-12-29 08:20:17', NULL),
(196, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"22\"}', '1', '2020-12-25 09:09:28', '2020-12-29 08:20:17', NULL),
(197, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"23\"}', '1', '2020-12-25 09:28:56', '2020-12-29 08:20:17', NULL),
(198, 20, 28, 'Booking Accepted', 'Your booking accepted by ambuj tripathi', '{\"key\":\"Order_Accepted\",\"title\":\"Booking Accepted\",\"message\":\"Your booking accepted by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"31\"}', '1', '2020-12-28 01:10:25', '2020-12-29 06:12:54', NULL),
(199, 20, 28, 'Booking Rejected', 'Your booking rejected by ambuj tripathi', '{\"key\":\"Order_Rejected\",\"title\":\"Booking Rejected\",\"message\":\"Your booking rejected by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"20\"}', '1', '2020-12-28 01:11:05', '2020-12-29 06:12:54', NULL),
(200, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"32\"}', '1', '2020-12-28 03:10:28', '2020-12-29 08:20:17', NULL),
(201, 20, 28, 'Booking Accepted', 'Your booking accepted by ambuj tripathi', '{\"key\":\"Order_Accepted\",\"title\":\"Booking Accepted\",\"message\":\"Your booking accepted by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"32\"}', '1', '2020-12-28 03:46:52', '2020-12-29 06:12:54', NULL),
(202, 20, 28, 'Booking Completed', 'Your booking completed by ambuj tripathi', '{\"key\":\"Order_Completed\",\"title\":\"Booking Completed\",\"message\":\"Your booking completed by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"32\"}', '1', '2020-12-29 03:57:12', '2020-12-29 06:12:54', NULL),
(203, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"42\"}', '1', '2020-12-29 08:02:19', '2020-12-29 08:20:17', NULL),
(204, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"43\"}', '1', '2020-12-29 08:06:13', '2020-12-29 08:20:17', NULL),
(205, 20, 28, 'Booking Accepted', 'Your booking accepted by ambuj tripathi', '{\"key\":\"Order_Accepted\",\"title\":\"Booking Accepted\",\"message\":\"Your booking accepted by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"43\"}', '0', '2020-12-29 08:13:42', '2020-12-29 08:13:42', NULL),
(206, 28, 20, 'New booking', 'You have a new booking by Shivam', '{\"key\":\"new_order\",\"title\":\"New booking\",\"message\":\"You have a new booking by Shivam\",\"sender_id\":28,\"receiver_id\":20,\"id\":\"44\"}', '1', '2020-12-29 08:16:05', '2020-12-29 08:20:17', NULL),
(207, 20, 28, 'Booking Accepted', 'Your booking accepted by ambuj tripathi', '{\"key\":\"Order_Accepted\",\"title\":\"Booking Accepted\",\"message\":\"Your booking accepted by ambuj tripathi\",\"sender_id\":20,\"receiver_id\":28,\"id\":\"44\"}', '0', '2020-12-29 08:16:38', '2020-12-29 08:16:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `type` enum('1','2') NOT NULL COMMENT '1==about_us,2==terms&conditions',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content_es` text CHARACTER SET utf8 COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `type`, `content`, `content_es`) VALUES
(1, '1', '<div class=\"body\" style=\"padding: 10px 15px;\">\r\n	<h3 class=\"section-heading\" style=\"text-align: center; font-size: 22px;\">Privacy Policy</h3>\r\n\r\n	<!-------------------Englis pp--------------------->\r\n	<h4 class=\"sub-heading french\">B&A GROUP built the YoPO a Commercial app. This SERVICE is provided by B&A GROUP and is intended for use as is.</h4>\r\n\r\n	<p>This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.</p>\r\n\r\n	<p>If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.</p>\r\n\r\n	<p>The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at YoPo unless otherwise defined in this Privacy Policy.</p>\r\n\r\n\r\n\r\n	<h4 class=\"sub-heading\">Information Collection and Use</h4>\r\n	<p>For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to Username, Password, adrees, social security number or tax id number  Mobile number. id witth picture, and one selfie. The information that we request will be retained by us and used as described in this privacy policy.</p>\r\n\r\n	<p>The app does use third party services that may collect information used to identify you.</p>\r\n\r\n	<p>Link to privacy policy of third party service providers used by the app</p>\r\n\r\n	<p>Payment will be charged to iTunes Account at confirmation of purchase</p>\r\n\r\n	<p>Subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period\r\n	Account will be charged for renewal within 24-hours prior to the end of the current period, and identify the cost of the renewal\r\n	Subscriptions may be managed by the user and auto-renewal may be turned off by going to the user\'s Account Settings after purchase</p>\r\n	\r\n	<h4 class=\"sub-heading\">Log Data</h4>\r\n	<p>We want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (', '<div class=\"body\" style=\"padding: 10px 15px;\">\r\n	<h3 class=\"section-heading\" style=\"text-align: center; font-size: 22px;\">Pol'),
(2, '2', '<div class=\"body\" style=\"padding: 10px 15px;\">\r\n	<h3 class=\"section-heading\" style=\"text-align: center; font-size: 22px;\">TERMS AND CONDITIONS</h3>\r\n\r\n	<h4>TERMS OF USE</h4>\r\n	<p>By downloading, browsing, accessing or using this mobile application (', '<div class=\"body\" style=\"padding: 10px 15px;\">\r\n	<h3 class=\"section-heading\" style=\"text-align: center; font-size: 22px;\">T');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_name_ar` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `offer` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_name`, `product_name_ar`, `product_image`, `price`, `offer`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'English', 'Arabic', '1GvucnwbR2_1604661397.jpg', 0.00, '134', 20, '2020-11-06 06:16:37', '2021-01-21 10:26:24', NULL),
(2, 'Product 1', '', 'xpM1sHSddT_1604737881.jpg', 123.00, '345', 20, '2020-11-07 03:31:21', '2020-11-07 03:31:21', NULL),
(3, 'Product 34', '', '99Zt0TmXOa_1605866548.jpg', 123.00, '110', 20, '2020-11-20 05:02:28', '2020-11-20 05:02:28', NULL),
(4, 'SEPHORA COLLECTION Into the Stars Palette - A 130-piece palette', '', '6CB8r5IooL_1606171293.jpg', 550.00, '450', 31, '2020-11-23 17:41:33', '2020-11-23 17:41:33', NULL),
(5, 'Abcde', '', '8POrsCpU1p_1606305696.jpg', 500.00, 'Free', 20, '2020-11-25 07:01:36', '2020-11-25 07:01:36', NULL),
(6, 'Gzjanana', '', 'Moo8NsXL7h_1606309644.jpg', 0.00, 'Gahaba', 20, '2020-11-25 08:07:24', '2020-11-25 08:07:24', NULL),
(7, 'Cutting trail', '', 'zxjqqVroe3_1606393881.jpg', 200.00, 'Free trail', 34, '2020-11-26 07:31:21', '2020-11-26 07:31:21', NULL),
(8, 'Hair color', '', 'Jp6hvJbbZe_1606394836.jpg', 550.00, '10% discount', 34, '2020-11-26 07:47:16', '2020-11-26 07:47:16', NULL),
(9, 'Makeup', '', 'h4klieisp5_1608044717.jpg', 120.00, '90', 41, '2020-12-15 10:05:17', '2020-12-15 10:05:17', NULL),
(10, 'Makeup', '', 'h9PhTxoVu6_1608044748.jpg', 77.00, '50', 41, '2020-12-15 10:05:48', '2020-12-15 10:05:48', NULL),
(11, '?????', '', 'FIfPx9bphN_1609166284.jpg', 80.00, '50', 49, '2020-12-28 09:38:04', '2020-12-28 09:38:04', NULL),
(12, 'en1', 'ar1', '', 2323.00, '234', 20, '2021-01-21 00:38:32', '2021-01-21 00:39:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supports`
--

CREATE TABLE `supports` (
  `support_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `support_type` enum('1','2') NOT NULL,
  `user_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `phone_number` varchar(225) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_bin,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supports`
--

INSERT INTO `supports` (`support_id`, `user_id`, `support_type`, `user_name`, `phone_number`, `email`, `message`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 7, '2', 'Ganesh Vendor', '1234567890', 'ganesh_vendor@mailinator.com', 'This', '2020-10-09 03:33:32', '2020-10-09 03:33:32', NULL),
(2, 7, '1', 'Ganesh Vendor', '1234567890', 'ganesh_vendor@mailinator.com', 'This', '2020-10-09 03:33:53', '2020-10-09 03:33:53', NULL),
(3, 32, '2', 'ajay', '9630156770', 'ajay2@gmail.com', 'zxcsdwrewrwe', '2020-11-21 04:52:38', '2020-11-21 04:52:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history`
--

CREATE TABLE `transaction_history` (
  `transaction_history_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `appointment_id` int(10) DEFAULT NULL,
  `transaction_id` varchar(225) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `transaction_status` enum('1','2') DEFAULT NULL COMMENT '1=success,2=failed',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_history`
--

INSERT INTO `transaction_history` (`transaction_history_id`, `user_id`, `appointment_id`, `transaction_id`, `currency`, `amount`, `transaction_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 28, 1, 'f9d76791-8491-4e60-9a3a-4cd130086994', 'SAR', '500.00', '1', '2020-12-25 11:15:39', '2020-12-25 11:15:39', NULL),
(2, 28, 1, 'be489da7-40bd-4c3b-9cf8-f1065a9702c9', 'SAR', '5825.00', '1', '2020-12-25 11:54:53', '2020-12-25 11:54:53', NULL),
(3, 28, 1, '3b73aacf-1c56-4f68-a132-f5d2973ea690', 'SAR', '5825.00', '1', '2020-12-25 11:56:21', '2020-12-25 11:56:21', NULL),
(4, 28, 2, '3d7e1066-d399-4865-9ef2-280ae5784f84', 'SAR', '500.00', '1', '2020-12-25 12:00:39', '2020-12-25 12:00:39', NULL),
(5, 28, 4, '766b2a0f-ee99-48b7-aaf9-3a79a48aa6a3', 'SAR', '1200.00', '1', '2020-12-25 12:02:44', '2020-12-25 12:02:44', NULL),
(6, 28, 5, '7b5c1737-01ae-4d5c-932b-2f29ae40e6d0', 'SAR', '500.00', '1', '2020-12-25 12:28:34', '2020-12-25 12:28:34', NULL),
(7, 28, 6, '75e785d3-2ff3-409e-a152-cb5896ff4088', 'SAR', '500.00', '1', '2020-12-25 12:29:05', '2020-12-25 12:29:05', NULL),
(8, 28, 1, '6aa50d50-014f-4e5c-8ecb-4ba3f9718ad7', 'SAR', '5825.00', '1', '2020-12-25 12:56:05', '2020-12-25 12:56:05', NULL),
(9, 28, 6, '42c2a705-363c-4d9a-9fc8-511c15c283c3', 'SAR', '5825.00', '1', '2020-12-25 12:56:07', '2020-12-25 12:56:07', NULL),
(10, 28, 7, 'dc5c9b67-dfd3-4c57-9ee8-08b7b4495ffa', 'SAR', '500.00', '1', '2020-12-25 13:28:24', '2020-12-25 13:28:24', NULL),
(11, 28, 1, 'ad3ef359-8d47-4e3b-ab79-6ee5bbc8ca7f', 'SAR', '5825.00', '1', '2020-12-25 13:36:37', '2020-12-25 13:36:37', NULL),
(12, 28, 9, '07ab360b-408e-4f75-9888-1f325f467e56', 'SAR', '550.00', '1', '2020-12-25 13:49:36', '2020-12-25 13:49:36', NULL),
(13, 28, 9, '84d6d273-b0ca-46e3-a30a-3e3b52094a1c', 'SAR', '434400.00', '1', '2020-12-25 13:50:26', '2020-12-25 13:50:26', NULL),
(14, 28, 11, '07f52816-1ac4-4969-9bc6-979ce9656230', 'SAR', '633.00', '1', '2020-12-25 13:54:02', '2020-12-25 13:54:02', NULL),
(15, 28, 12, 'b863ad70-5d69-4857-9e97-afb31df9eeb1', 'SAR', '57500.00', '1', '2020-12-25 13:56:51', '2020-12-25 13:56:51', NULL),
(16, 28, 21, '11350c37-e7d5-4862-93f2-bdae53b16a0c', 'SAR', '57500.00', '', '2020-12-25 14:08:58', '2020-12-25 14:08:58', NULL),
(17, 28, 22, '3339ed37-ab1c-4e96-b84c-706b5ea2a2d7', 'SAR', '57500.00', '1', '2020-12-25 14:09:37', '2020-12-25 14:09:37', NULL),
(18, 28, 23, 'dfd95bb8-9266-4b12-a025-5a12dc0a007c', 'SAR', '633.00', '1', '2020-12-25 14:29:04', '2020-12-25 14:29:04', NULL),
(19, 28, 32, '7e4932ac-4611-49e8-b270-93912b9b404b', 'SAR', '2300.00', '1', '2020-12-28 08:10:46', '2020-12-28 08:10:46', NULL),
(20, 28, 42, 'e7333a15-b4e0-43f6-a618-247a4afe4d8f', 'SAR', '626175.00', '', '2020-12-29 13:02:30', '2020-12-29 13:02:30', NULL),
(21, 28, 43, 'eb728ae9-fbdc-4e8a-ad0a-91fd945a569a', 'SAR', '69575.00', '', '2020-12-29 13:06:24', '2020-12-29 13:06:24', NULL),
(22, 28, 43, 'eb728ae9-fbdc-4e8a-ad0a-91fd945a569a', 'SAR', '69575.00', '', '2020-12-29 13:06:42', '2020-12-29 13:06:42', NULL),
(23, 28, 43, 'eb728ae9-fbdc-4e8a-ad0a-91fd945a569a', 'SAR', '69575.00', '', '2020-12-29 13:06:43', '2020-12-29 13:06:43', NULL),
(24, 28, 43, 'ac714d04-d189-403a-a601-f66431e0f9f0', 'SAR', '626175.00', '1', '2020-12-29 13:07:03', '2020-12-29 13:07:03', NULL),
(25, 28, 44, '8e6484b1-9515-468c-a920-db25cfc9f3ca', 'SAR', '2404.00', '1', '2020-12-29 13:16:15', '2020-12-29 13:16:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=admin,2=users,3=vendor',
  `vendor_type` enum('1','2','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '1=artist,2=Salon Owner',
  `specialist` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_id` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `first_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verify_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=male,2=female',
  `profile_image` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_verify_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0=otp_not_verified,1=otp_verified',
  `active_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=deactivate,1 activate',
  `approve_status` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0=pending,1=approved,2=rejected',
  `api_status` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=step_1,1=step_2,2=step_3',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=off,1=on',
  `device_type` enum('android','ios','web','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` enum('en','es') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `description` text COLLATE utf8mb4_unicode_ci,
  `description_ar` int(11) DEFAULT NULL,
  `registration_card` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_1` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_2` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_3` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `availability_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `service_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `vendor_type`, `specialist`, `social_type`, `social_id`, `user_name`, `first_name`, `last_name`, `email`, `email_verify_status`, `phone_number`, `gender`, `profile_image`, `address`, `lat`, `lng`, `otp`, `otp_verify_status`, `active_status`, `approve_status`, `api_status`, `password`, `remember_token`, `notification_status`, `device_type`, `device_token`, `language`, `description`, `description_ar`, `registration_card`, `document_1`, `document_2`, `document_3`, `availability_status`, `service_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', '1', NULL, '', NULL, 'Admin Admin', 'Admin', 'Admin', 'admin@mailinator.com', '1', '95751645491', NULL, 'Image_1', NULL, '22.719568', '75.857727', '0491', '0', '1', '1', '0', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', NULL, '1', 'web', 'mamama', 'en', NULL, 0, 'ZRpRKMmO0E_1600506355.jpg', 'GrwPqBKocj_1600506415.jpg', 'jXS58zIDpw_1600506422.jpg', '4iSCS9wB9P_1600506436.jpg', '0', '0', '2020-02-09 18:30:00', '2021-01-25 03:37:55', NULL),
(20, '3', '2', '1', '1', NULL, 'ambuj tripathi', NULL, NULL, 'raju@gmail.com', '1', '7566380832', NULL, 'ETbHiiDPnk_1609132560.jpg', 'Khargone - Indore Hwy, Vishnu Puri Colony, Indore, Madhya Pradesh, India', '22.7004812', '75.875831', '2279', '0', '1', '1', '0', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', NULL, '1', 'android', 'null', 'en', 'xcxvdfgfd fgfd fgfdg fgfdg fgfdg', 0, NULL, NULL, NULL, NULL, '1', '1', '2020-11-04 03:02:05', '2021-01-16 00:21:35', NULL),
(28, '2', '1', NULL, '1', NULL, 'Shivam', NULL, NULL, 'ramlal@gmail.com', '1', '8349877407', NULL, 'zTQ2HkGDjX_1608548320.jpg', 'Vishnu Puri Main Road, Bhawarkua, Vishnu Puri Colony, Indore, Madhya Pradesh 452001, India', '22.7139', NULL, '3184', '0', '1', '0', '0', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', NULL, '1', 'android', 'null', 'en', 'asa sdaksd', 0, NULL, NULL, NULL, NULL, '0', '0', '2020-11-10 07:24:35', '2021-01-13 21:42:40', NULL),
(31, '3', '2', '2', '1', NULL, 'Beauty Center', NULL, NULL, 'null', '1', '0533755044', NULL, 'vD6UZjUAM5_1606320594.jpg', 'Saudi Arabia, Riyadh', '23.3423', '34.2323', '7397', '0', '1', '0', '0', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', NULL, '1', 'android', 'null', 'en', 'مركز الجمال لخدمات التجميل والعناية بالبشرة والشعر', 0, 'ULxsEjkkio_1605169092.jpg', '2DZjOO12CQ_1605169160.jpg', 'oKHoL9Fayv_1605169146.jpg', 'y4ERuizOMW_1605169151.jpg', '1', '1', '2020-11-12 03:17:11', '2020-12-22 06:30:53', NULL),
(34, '3', '1', NULL, '1', NULL, 'Buety 123', NULL, NULL, NULL, '1', '9584741316', NULL, 'X1bapdnckW_1606394741.jpg', '109 Angus Rd, Monroe, LA 71202, USA', '32.3794408', NULL, '8797', '0', '1', '0', '0', '$2y$10$ExamjU1FsSKJ.gJBmj.7Pen0jRyg7Y4RrNxQTkkMifAeDY3emahTm', NULL, '1', 'android', 'null', 'en', NULL, 0, NULL, NULL, NULL, NULL, '1', '1', '2020-11-26 00:37:51', '2020-11-26 07:45:41', NULL),
(41, '3', '1', NULL, '1', NULL, 'Jamali', NULL, NULL, NULL, '1', '0533355555', NULL, 'uHfVzPFseh_1608044908.jpg', '4302 Ath Thumamah Road, Al Munsiyah, Riyadh 13421 6955, Saudi Arabia', '24.84595486336168', NULL, '3574', '0', '1', '0', '0', '$2y$10$cV4KQ.lHT5Kt57uE/.dYbuY3ZNhhvIVFRo.yggN43QEv5Y4JdK0uq', NULL, '1', 'ios', '32482c43f93e11f337e1030a9b5b766faf12f2ad5b81f2b6828d87fecf215228', 'en', NULL, 0, 'AKfLfPIn3J_1608044317.jpg', 'bAloCWrEyP_1608044342.jpg', 'b1QpuP0z5Y_1608044354.jpg', 'g85i5caJR4_1608044385.jpg', '1', '1', '2020-12-15 09:58:12', '2020-12-15 10:08:28', NULL),
(44, '3', '1', '2', '1', NULL, 'Norah', NULL, NULL, NULL, '1', '0552560808', NULL, 'l9FdzRM79S_1608637601.jpg', '8229, Al Mutamarat, Riyadh 12711 3952, Saudi Arabia', '24.676822344798037', '46.68829321034767', '8355', '0', '1', '0', '0', '$2y$10$bVQOsB0u7Ym.96Op70.L0OFihriHZw1.PZxu1/gXpymLXSueeA8S6', NULL, '1', 'ios', 'd95a6b4b02e042d01766778c9f8fa396ae3c5a1f24a71c6541c970598f894de3', 'en', NULL, 0, 'ZTqr48fzTb_1608636796.jpg', 'Zp16bkpeDK_1608636812.jpg', 'ZPvdZT7NCW_1608636823.jpg', '8k8GleTz24_1608636837.jpg', '1', '1', '2020-12-22 06:32:55', '2020-12-22 06:50:47', NULL),
(45, '2', '1', NULL, '1', NULL, 'Noraaaaaa', NULL, NULL, '0533755055', '1', '0533755055', '2', NULL, '8229, Al Mutamarat, Riyadh 12711 3952, Saudi Arabia', '24.676835233947795', '46.68828834582308', '1468', '0', '1', '0', '0', '$2y$10$muexuNtj5EJCCcliuRzv/OnCve6pfunBn8GRniLDyYr5gwskHJOqO', NULL, '1', 'ios', '060123e6e2d6be3dea82ea27da0504812d54914dd7c8f18a16d07c0c3971e3a1', '', NULL, 0, NULL, NULL, NULL, NULL, '0', '0', '2020-12-22 07:06:56', '2020-12-22 07:06:56', NULL),
(46, '2', '1', NULL, '1', NULL, 'Noraaaaa', NULL, NULL, '0533755045', '1', '0533755045', '2', 'DiPEjIYb8l_1608642059.jpg', '8229, Al Mutamarat, Riyadh 12711 3952, Saudi Arabia', '24.676875441659455', '46.68827490248233', '3503', '0', '1', '0', '0', '$2y$10$9J3WmdJ.VcSxfAAwpzJSO.O1Z86clhuWFj95oIoku2D/0aprVJonu', NULL, '1', 'ios', '060123e6e2d6be3dea82ea27da0504812d54914dd7c8f18a16d07c0c3971e3a1', '', 'باحثة', 0, NULL, NULL, NULL, NULL, '0', '0', '2020-12-22 07:32:32', '2020-12-22 08:12:55', NULL),
(47, '2', '1', NULL, '1', NULL, 'ismail', NULL, NULL, '9893658094', '1', '9893658094', '1', NULL, '\"DSK Vishwa, Dhayari, Pune, Maharashtra, India\"', '18.4427627', '73.7992634', '2769', '0', '1', '0', '0', '$2y$10$COaX/2Ok2IjMgIRkkdhmteeGQMwZIoW/mqeZ1qA6XYts0NKJycw6C', NULL, '1', 'ios', 'null', 'en', NULL, 0, NULL, NULL, NULL, NULL, '0', '0', '2020-12-24 00:57:40', '2020-12-24 00:57:40', NULL),
(48, '2', '0', NULL, '1', NULL, 'Norah', NULL, NULL, '0552560282', '1', '0552560282', '2', NULL, '3884, Al Munsiyah, Riyadh 13249 7259, Saudi Arabia', '24.83546958930809', '46.76127780613369', '8758', '0', '1', '0', '0', '$2y$10$SW6ZKbpBrv2ikUCMRUO4veaNfj5eWdlLouQ4.ueXcu/IY7nfaAz9e', NULL, '1', 'android', 'null', '', NULL, 0, NULL, NULL, NULL, NULL, '0', '0', '2020-12-28 09:27:45', '2020-12-28 09:27:45', NULL),
(49, '3', '1', '2', '1', NULL, 'مك اب', NULL, NULL, NULL, '1', '0552560282', NULL, NULL, '7596 Ad Daywan, Al Hamra, Riyadh 13216 2802, Saudi Arabia', '24.774265', '46.738586', '5476', '0', '1', '1', '0', '$2y$10$jyZQsTP0SzRmEMDz74JVo.7L1Gf/a7lel6fmXfxrE8RsJvfs.gRj.', NULL, '1', 'android', 'aff51819f19b7c5c2a7d2e226176b1868734a530e7635fc58f3e3d3866f44ece', '', NULL, 0, '6k2NRnzw4a_1609165909.jpg', 'xi5Q7fkmo0_1609165923.jpg', '8b0QfVRICG_1609165936.jpg', 'Ju1DGJ73bM_1609165953.jpg', '1', '1', '2020-12-28 09:31:09', '2021-01-16 00:21:39', NULL),
(50, '2', '0', NULL, '1', NULL, 'Nan', NULL, NULL, '0555544440', '1', '0555544440', '2', NULL, 'Al Qamari, Al Munsiyah, Riyadh 11564, Saudi Arabia', '24.8374568', '46.75990609999999', '1871', '0', '1', '0', '0', '$2y$10$zx..OnPSQmy2UBOfz5JSTOlAYXhnKZwaoOW5BpgxH/5ECzx.KVN06', NULL, '1', 'android', 'null', '', NULL, 0, NULL, NULL, NULL, NULL, '0', '0', '2020-12-28 09:40:18', '2020-12-28 09:41:10', NULL),
(51, '3', '1', '2', '1', NULL, 'نورة', NULL, NULL, NULL, '1', '05566778899', NULL, NULL, '7596 Ad Daywan, Al Hamra, Riyadh 13216 2802, Saudi Arabia', '24.774265', '46.738586', '4479', '0', '1', '0', '0', '$2y$10$NghiEI/JL1QqZERbmwD67.9hd.UBWC03umiwPKnYzXm9ntkqJvC.S', NULL, '1', 'android', 'aff51819f19b7c5c2a7d2e226176b1868734a530e7635fc58f3e3d3866f44ece', '', NULL, 0, NULL, NULL, NULL, NULL, '1', '0', '2020-12-28 10:46:24', '2020-12-28 10:48:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_days`
--

CREATE TABLE `vendor_days` (
  `vendor_day_id` int(10) UNSIGNED NOT NULL,
  `vendor_id` int(10) UNSIGNED NOT NULL,
  `day_id` int(10) DEFAULT NULL,
  `day_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `day_status` enum('0','1') DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_days`
--

INSERT INTO `vendor_days` (`vendor_day_id`, `vendor_id`, `day_id`, `day_name`, `day_status`, `start_time`, `end_time`, `created_at`, `updated_at`, `deleted_at`) VALUES
(36, 7, 1, 'Sunday', '1', '09:45:00', '06:45:00', '2020-10-26 12:33:50', '2020-10-26 12:33:50', NULL),
(37, 7, 2, 'Monday', '0', '09:45:00', '06:45:00', '2020-10-26 12:33:50', '2020-10-26 12:33:50', NULL),
(38, 7, 3, 'Tuesday', '1', '09:45:00', '06:45:00', '2020-10-26 12:33:50', '2020-10-26 12:33:50', NULL),
(39, 7, 4, 'Wednesday', '1', '09:45:00', '06:45:00', '2020-10-26 12:33:50', '2020-10-26 12:33:50', NULL),
(40, 7, 5, 'Thursday', '0', '09:45:00', '06:45:00', '2020-10-26 12:33:50', '2020-10-26 12:33:50', NULL),
(41, 7, 6, 'Friday', '1', '09:45:00', '06:45:00', '2020-10-26 12:33:50', '2020-10-26 12:33:50', NULL),
(42, 7, 7, 'Saturday', '1', '09:45:00', '06:45:00', '2020-10-26 12:33:50', '2020-10-26 12:33:50', NULL),
(43, 17, 1, 'Sunday', '1', '09:45:00', '06:45:00', '2020-10-31 10:36:19', '2020-10-31 10:36:19', NULL),
(44, 17, 2, 'Monday', '1', '09:45:00', '06:45:00', '2020-10-31 10:36:19', '2020-10-31 10:36:19', NULL),
(45, 17, 3, 'Tuesday', '1', '09:45:00', '06:45:00', '2020-10-31 10:36:19', '2020-10-31 10:36:19', NULL),
(46, 17, 4, 'Wednesday', '1', '09:45:00', '06:45:00', '2020-10-31 10:36:19', '2020-10-31 10:36:19', NULL),
(47, 17, 5, 'Thursday', '1', '09:45:00', '06:45:00', '2020-10-31 10:36:19', '2020-10-31 10:36:19', NULL),
(48, 17, 6, 'Friday', '1', '09:45:00', '06:45:00', '2020-10-31 10:36:19', '2020-10-31 10:36:19', NULL),
(49, 17, 7, 'Saturday', '1', '09:45:00', '06:45:00', '2020-10-31 10:36:19', '2020-10-31 10:36:19', NULL),
(50, 18, 1, 'Sunday', '1', '09:45:00', '06:45:00', '2020-10-31 13:10:56', '2020-10-31 13:10:56', NULL),
(51, 18, 2, 'Monday', '1', '09:45:00', '06:45:00', '2020-10-31 13:10:56', '2020-10-31 13:10:56', NULL),
(52, 18, 3, 'Tuesday', '1', '09:45:00', '06:45:00', '2020-10-31 13:10:56', '2020-10-31 13:10:56', NULL),
(53, 18, 4, 'Wednesday', '1', '09:45:00', '06:45:00', '2020-10-31 13:10:56', '2020-10-31 13:10:56', NULL),
(54, 18, 5, 'Thursday', '1', '09:45:00', '06:45:00', '2020-10-31 13:10:56', '2020-10-31 13:10:56', NULL),
(55, 18, 6, 'Friday', '1', '09:45:00', '06:45:00', '2020-10-31 13:10:56', '2020-10-31 13:10:56', NULL),
(56, 18, 7, 'Saturday', '1', '09:45:00', '06:45:00', '2020-10-31 13:10:56', '2020-10-31 13:10:56', NULL),
(71, 22, 1, 'Sunday', '1', '09:45:00', '06:45:00', '2020-11-04 16:05:56', '2020-11-04 16:05:56', NULL),
(72, 22, 2, 'Monday', '0', '09:45:00', '06:45:00', '2020-11-04 16:05:56', '2020-11-04 16:05:56', NULL),
(73, 22, 3, 'Tuesday', '0', '09:45:00', '06:45:00', '2020-11-04 16:05:56', '2020-11-04 16:05:56', NULL),
(74, 22, 4, 'Wednesday', '0', '09:45:00', '06:45:00', '2020-11-04 16:05:56', '2020-11-04 16:05:56', NULL),
(75, 22, 5, 'Thursday', '0', '09:45:00', '06:45:00', '2020-11-04 16:05:56', '2020-11-04 16:05:56', NULL),
(76, 22, 6, 'Friday', '0', '09:45:00', '06:45:00', '2020-11-04 16:05:56', '2020-11-04 16:05:56', NULL),
(77, 22, 7, 'Saturday', '0', '09:45:00', '06:45:00', '2020-11-04 16:05:56', '2020-11-04 16:05:56', NULL),
(99, 33, 1, 'Sunday', '0', '09:45:00', '06:45:00', '2020-11-25 15:38:25', '2020-11-25 15:38:25', NULL),
(100, 33, 2, 'Monday', '0', '09:45:00', '06:45:00', '2020-11-25 15:38:25', '2020-11-25 15:38:25', NULL),
(101, 33, 3, 'Tuesday', '0', '09:45:00', '06:45:00', '2020-11-25 15:38:25', '2020-11-25 15:38:25', NULL),
(102, 33, 4, 'Wednesday', '0', '09:45:00', '06:45:00', '2020-11-25 15:38:25', '2020-11-25 15:38:25', NULL),
(103, 33, 5, 'Thursday', '0', '09:45:00', '06:45:00', '2020-11-25 15:38:25', '2020-11-25 15:38:25', NULL),
(104, 33, 6, 'Friday', '0', '09:45:00', '06:45:00', '2020-11-25 15:38:25', '2020-11-25 15:38:25', NULL),
(105, 33, 7, 'Saturday', '0', '09:45:00', '06:45:00', '2020-11-25 15:38:25', '2020-11-25 15:38:25', NULL),
(106, 31, 1, 'Sunday', '1', '17:00:00', '23:59:00', '2020-11-26 02:46:51', '2020-11-26 02:46:51', NULL),
(107, 31, 2, 'Monday', '1', '09:45:00', '06:45:00', '2020-11-26 02:46:51', '2020-11-26 02:46:51', NULL),
(108, 31, 3, 'Tuesday', '1', '09:45:00', '18:45:00', '2020-11-26 02:46:51', '2020-11-26 02:46:51', NULL),
(109, 31, 4, 'Wednesday', '1', '09:45:00', '06:45:00', '2020-11-26 02:46:51', '2020-11-26 02:46:51', NULL),
(110, 31, 5, 'Thursday', '1', '09:45:00', '06:45:00', '2020-11-26 02:46:51', '2020-11-26 02:46:51', NULL),
(111, 31, 6, 'Friday', '1', '09:45:00', '06:45:00', '2020-11-26 02:46:51', '2020-11-26 02:46:51', NULL),
(112, 31, 7, 'Saturday', '1', '11:24:00', '06:45:00', '2020-11-26 02:46:51', '2020-11-26 02:46:51', NULL),
(134, 34, 1, 'Sunday', '1', '07:15:00', '12:00:00', '2020-11-26 13:45:01', '2020-11-26 13:45:01', NULL),
(135, 34, 2, 'Monday', '1', '09:45:00', '06:45:00', '2020-11-26 13:45:01', '2020-11-26 13:45:01', NULL),
(136, 34, 3, 'Tuesday', '0', '09:45:00', '06:45:00', '2020-11-26 13:45:01', '2020-11-26 13:45:01', NULL),
(137, 34, 4, 'Wednesday', '0', '09:45:00', '06:45:00', '2020-11-26 13:45:01', '2020-11-26 13:45:01', NULL),
(138, 34, 5, 'Thursday', '0', '09:45:00', '06:45:00', '2020-11-26 13:45:01', '2020-11-26 13:45:01', NULL),
(139, 34, 6, 'Friday', '1', '09:45:00', '06:45:00', '2020-11-26 13:45:01', '2020-11-26 13:45:01', NULL),
(140, 34, 7, 'Saturday', '0', '09:45:00', '06:45:00', '2020-11-26 13:45:01', '2020-11-26 13:45:01', NULL),
(169, 39, 1, 'Sunday', '1', '09:45:00', '17:37:00', '2020-12-14 13:06:09', '2020-12-14 13:06:09', NULL),
(170, 39, 2, 'Monday', '1', '09:45:00', '20:00:00', '2020-12-14 13:06:09', '2020-12-14 13:06:09', NULL),
(171, 39, 3, 'Tuesday', '1', '09:45:00', '06:45:00', '2020-12-14 13:06:09', '2020-12-14 13:06:09', NULL),
(172, 39, 4, 'Wednesday', '1', '09:45:00', '06:45:00', '2020-12-14 13:06:09', '2020-12-14 13:06:09', NULL),
(173, 39, 5, 'Thursday', '1', '09:45:00', '06:45:00', '2020-12-14 13:06:09', '2020-12-14 13:06:09', NULL),
(174, 39, 6, 'Friday', '1', '09:45:00', '06:45:00', '2020-12-14 13:06:09', '2020-12-14 13:06:09', NULL),
(175, 39, 7, 'Saturday', '1', '09:45:00', '06:45:00', '2020-12-14 13:06:09', '2020-12-14 13:06:09', NULL),
(190, 41, 1, 'Sunday', '0', '15:00:00', '23:59:00', '2020-12-15 20:22:10', '2020-12-15 20:22:10', NULL),
(191, 41, 2, 'Monday', '0', '15:00:00', '17:55:00', '2020-12-15 20:22:10', '2020-12-15 20:22:10', NULL),
(192, 41, 3, 'Tuesday', '0', '15:00:00', '06:45:00', '2020-12-15 20:22:10', '2020-12-15 20:22:10', NULL),
(193, 41, 4, 'Wednesday', '0', '15:00:00', '18:08:00', '2020-12-15 20:22:10', '2020-12-15 20:22:10', NULL),
(194, 41, 5, 'Thursday', '0', '15:00:00', '06:45:00', '2020-12-15 20:22:10', '2020-12-15 20:22:10', NULL),
(195, 41, 6, 'Friday', '1', '12:00:00', '06:45:00', '2020-12-15 20:22:10', '2020-12-15 20:22:10', NULL),
(196, 41, 7, 'Saturday', '1', '09:45:00', '06:45:00', '2020-12-15 20:22:10', '2020-12-15 20:22:10', NULL),
(197, 44, 1, 'Sunday', '1', '09:45:00', '23:00:00', '2020-12-22 12:35:23', '2020-12-22 12:35:23', NULL),
(198, 44, 2, 'Monday', '1', '09:45:00', '11:00:00', '2020-12-22 12:35:23', '2020-12-22 12:35:23', NULL),
(199, 44, 3, 'Tuesday', '1', '09:45:00', '10:00:00', '2020-12-22 12:35:23', '2020-12-22 12:35:23', NULL),
(200, 44, 4, 'Wednesday', '1', '09:45:00', '21:00:00', '2020-12-22 12:35:23', '2020-12-22 12:35:23', NULL),
(201, 44, 5, 'Thursday', '1', '09:45:00', '08:00:00', '2020-12-22 12:35:23', '2020-12-22 12:35:23', NULL),
(202, 44, 6, 'Friday', '0', '09:45:00', '06:45:00', '2020-12-22 12:35:23', '2020-12-22 12:35:23', NULL),
(203, 44, 7, 'Saturday', '0', '09:45:00', '06:45:00', '2020-12-22 12:35:23', '2020-12-22 12:35:23', NULL),
(239, 49, 1, 'Sunday', '1', '09:45:00', '18:00:00', '2020-12-28 15:52:04', '2020-12-28 15:52:04', NULL),
(240, 49, 2, 'Monday', '1', '09:45:00', '06:45:00', '2020-12-28 15:52:04', '2020-12-28 15:52:04', NULL),
(241, 49, 3, 'Tuesday', '1', '09:45:00', '06:45:00', '2020-12-28 15:52:04', '2020-12-28 15:52:04', NULL),
(242, 49, 4, 'Wednesday', '1', '09:45:00', '06:45:00', '2020-12-28 15:52:04', '2020-12-28 15:52:04', NULL),
(243, 49, 5, 'Thursday', '1', '09:45:00', '06:45:00', '2020-12-28 15:52:04', '2020-12-28 15:52:04', NULL),
(244, 49, 6, 'Friday', '1', '09:45:00', '06:45:00', '2020-12-28 15:52:04', '2020-12-28 15:52:04', NULL),
(245, 49, 7, 'Saturday', '1', '09:45:00', '06:45:00', '2020-12-28 15:52:04', '2020-12-28 15:52:04', NULL),
(246, 51, 1, 'Sunday', '1', '09:45:00', '23:00:00', '2020-12-28 16:48:08', '2020-12-28 16:48:08', NULL),
(247, 51, 2, 'Monday', '1', '09:45:00', '23:00:00', '2020-12-28 16:48:08', '2020-12-28 16:48:08', NULL),
(248, 51, 3, 'Tuesday', '1', '09:45:00', '23:00:00', '2020-12-28 16:48:08', '2020-12-28 16:48:08', NULL),
(249, 51, 4, 'Wednesday', '1', '09:45:00', '23:00:00', '2020-12-28 16:48:08', '2020-12-28 16:48:08', NULL),
(250, 51, 5, 'Thursday', '1', '09:45:00', '23:00:00', '2020-12-28 16:48:08', '2020-12-28 16:48:08', NULL),
(251, 51, 6, 'Friday', '0', '09:45:00', '06:45:00', '2020-12-28 16:48:08', '2020-12-28 16:48:08', NULL),
(252, 51, 7, 'Saturday', '1', '09:45:00', '23:00:00', '2020-12-28 16:48:08', '2020-12-28 16:48:08', NULL),
(337, 20, 1, 'Sunday', '1', '09:45:00', '18:45:00', '2020-12-29 12:54:32', '2020-12-29 12:54:32', NULL),
(338, 20, 2, 'Monday', '1', '06:00:00', '19:00:00', '2020-12-29 12:54:32', '2020-12-29 12:54:32', NULL),
(339, 20, 3, 'Tuesday', '1', '09:45:00', '18:45:00', '2020-12-29 12:54:32', '2020-12-29 12:54:32', NULL),
(340, 20, 4, 'Wednesday', '1', '09:45:00', '23:40:00', '2020-12-29 12:54:32', '2020-12-29 12:54:32', NULL),
(341, 20, 5, 'Thursday', '1', '09:45:00', '18:45:00', '2020-12-29 12:54:32', '2020-12-29 12:54:32', NULL),
(342, 20, 6, 'Friday', '1', '09:45:00', '18:45:00', '2020-12-29 12:54:32', '2020-12-29 12:54:32', NULL),
(343, 20, 7, 'Saturday', '1', '09:45:00', '18:45:00', '2020-12-29 12:54:32', '2020-12-29 12:54:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_portfolios`
--

CREATE TABLE `vendor_portfolios` (
  `vendor_portfolio_id` int(10) UNSIGNED NOT NULL,
  `vendor_id` int(10) UNSIGNED NOT NULL,
  `type` enum('1','2','3') NOT NULL DEFAULT '1',
  `portfolio_image` varchar(225) DEFAULT 'NULL',
  `thumb` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_portfolios`
--

INSERT INTO `vendor_portfolios` (`vendor_portfolio_id`, `vendor_id`, `type`, `portfolio_image`, `thumb`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 7, '1', 'jAeMded01B_1600232804.jpg', NULL, '2020-09-16 01:06:44', '2020-09-16 11:03:57', NULL),
(2, 13, '1', 'WbaAPw8kb5_1602914439.png', NULL, '2020-10-17 02:00:40', '2020-10-17 02:00:40', NULL),
(3, 13, '2', 'gtaoKxgoGb_1602914452.png', NULL, '2020-10-17 02:00:52', '2020-10-17 02:00:52', NULL),
(4, 20, '1', 'lnwYxebfdK_1604745501.jpg', NULL, '2020-11-07 06:38:21', '2020-11-07 06:38:21', NULL),
(5, 20, '2', 'zi7LYvOXju_1604745572.mp4', NULL, '2020-11-07 06:39:32', '2020-11-07 06:39:32', NULL),
(6, 31, '1', 'PetbOFuNwY_1605169547.jpg', NULL, '2020-11-12 04:25:47', '2020-11-12 04:25:47', NULL),
(7, 31, '1', '9ntTS4So5n_1605169555.jpg', NULL, '2020-11-12 04:25:55', '2020-11-12 04:25:55', NULL),
(8, 20, '1', 'gBU82LctN8_1605959918.jpg', NULL, '2020-11-21 07:58:38', '2020-12-21 07:24:38', '2020-12-21 07:24:38'),
(9, 20, '2', 'BYIwl5Cj7z_1606111788.MOV', NULL, '2020-11-23 02:09:48', '2020-12-29 03:13:13', '2020-12-29 03:13:13'),
(10, 20, '1', 'iD6PE7RTTk_1606112115.jpg', NULL, '2020-11-23 02:15:15', '2020-11-23 02:15:15', NULL),
(11, 20, '1', 'mjydpjTIuN_1606305390.jpg', NULL, '2020-11-25 07:56:30', '2020-12-21 07:25:00', '2020-12-21 07:25:00'),
(12, 31, '1', 'uK0uQ4YZYn_1606320545.jpg', NULL, '2020-11-25 12:09:05', '2020-11-25 12:09:05', NULL),
(13, 31, '1', 'mEDCoZvl8f_1606320552.jpg', NULL, '2020-11-25 12:09:12', '2020-11-25 12:09:12', NULL),
(14, 31, '1', 'HosVEZZnkt_1606320559.jpg', NULL, '2020-11-25 12:09:19', '2020-11-25 12:09:19', NULL),
(15, 31, '1', 'm89VP7sUKz_1606320567.jpg', NULL, '2020-11-25 12:09:27', '2020-11-25 12:09:27', NULL),
(16, 31, '1', 'eCQUfMQFyh_1606320573.jpg', NULL, '2020-11-25 12:09:34', '2020-11-25 12:09:34', NULL),
(17, 31, '1', 'iV5EuTUMTJ_1606320622.jpg', NULL, '2020-11-25 12:10:22', '2020-11-25 12:10:22', NULL),
(18, 34, '1', '3nY1CTB7Wv_1606394764.jpg', NULL, '2020-11-26 08:46:04', '2020-11-26 08:46:04', NULL),
(19, 34, '1', '6s9lwKuKDX_1606394784.jpg', NULL, '2020-11-26 08:46:24', '2020-11-26 08:46:24', NULL),
(20, 20, '2', 'SsvCjYUKE1_1606467460.MOV', NULL, '2020-11-27 04:57:40', '2020-12-28 08:50:47', '2020-12-28 08:50:47'),
(21, 41, '1', 'BkeWVSY6Ql_1608047404.jpg', NULL, '2020-12-15 11:50:04', '2020-12-15 11:50:04', NULL),
(22, 41, '1', 'tIXCIM4gnw_1608047416.jpg', NULL, '2020-12-15 11:50:16', '2020-12-15 11:50:16', NULL),
(23, 41, '1', 'VvedPB9bSS_1608047426.jpg', NULL, '2020-12-15 11:50:26', '2020-12-15 11:50:26', NULL),
(24, 41, '1', 'XeA858WVPl_1608047435.jpg', NULL, '2020-12-15 11:50:35', '2020-12-15 11:50:35', NULL),
(25, 41, '1', 'H6bHLXSn7i_1608047447.jpg', NULL, '2020-12-15 11:50:47', '2020-12-15 11:50:47', NULL),
(26, 41, '2', 'SWqBCyqrME_1608047484.MOV', NULL, '2020-12-15 11:51:24', '2020-12-22 04:48:34', '2020-12-22 04:48:34'),
(27, 20, '2', 'UNl1jCv4sc_1608549669.mp4', NULL, '2020-12-21 07:21:09', '2020-12-21 07:24:08', '2020-12-21 07:24:08'),
(30, 20, '2', '5yzyepZltq_1608551366.mp4', '5fe08bc6ad8ed1608551366.png', '2020-12-21 07:49:26', '2020-12-21 07:49:26', NULL),
(31, 20, '2', 'MaOMqXenv0_1608551799.mp4', '5fe08d7760a701608551799.png', '2020-12-21 07:56:39', '2020-12-21 07:56:39', NULL),
(32, 20, '2', 'F0JnpRjPIm_1608553575.mp4', '5fe09467044ee1608553575.png', '2020-12-21 08:26:15', '2020-12-21 08:26:15', NULL),
(33, 20, '1', 'ZQ8SegCF4M_1608623302.jpg', NULL, '2020-12-22 03:48:22', '2020-12-22 03:48:22', NULL),
(34, 44, '1', 'PIxprXNeJE_1608637435.jpg', NULL, '2020-12-22 07:43:55', '2020-12-22 07:43:55', NULL),
(35, 44, '1', 'MkZfVhbV5a_1608637457.jpg', NULL, '2020-12-22 07:44:17', '2020-12-22 07:44:17', NULL),
(36, 44, '1', 'AMk8kiKouU_1608637471.jpg', NULL, '2020-12-22 07:44:31', '2020-12-22 07:44:31', NULL),
(37, 20, '1', 'kmX076UyPF_1609132401.jpg', NULL, '2020-12-28 01:13:21', '2020-12-28 01:13:35', '2020-12-28 01:13:35'),
(38, 20, '2', 'uGjUwmVwLR_1609152514.mp4', 'uGjUwmVwLR_1609152514.png', '2020-12-28 06:48:34', '2020-12-28 06:48:34', NULL),
(39, 20, '2', '9RCwJgT79n_1609153464.mp4', '9RCwJgT79n_1609153464.png', '2020-12-28 07:04:25', '2020-12-28 07:04:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_ratings`
--

CREATE TABLE `vendor_ratings` (
  `vendor_rating_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `vendor_id` int(10) UNSIGNED NOT NULL,
  `appointment_id` int(10) UNSIGNED DEFAULT NULL,
  `rating` int(10) UNSIGNED NOT NULL,
  `review` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor_ratings`
--

INSERT INTO `vendor_ratings` (`vendor_rating_id`, `user_id`, `vendor_id`, `appointment_id`, `rating`, `review`, `created_at`, `updated_at`, `deleted_at`) VALUES
(23, 28, 20, 6, 4, 'ertert', '2020-12-25 07:38:53', '2020-12-25 07:38:53', NULL),
(24, 28, 20, 5, 4, 'retert', '2020-12-25 07:39:26', '2020-12-25 07:39:26', NULL),
(25, 28, 20, 4, 3, 'edwqwqe', '2020-12-25 08:09:23', '2020-12-25 08:09:23', NULL),
(26, 28, 20, 20, 5, 'Ndhsnd', '2020-12-28 01:49:29', '2020-12-28 01:49:29', NULL),
(27, 28, 20, 32, 5, 'asasas', '2020-12-28 03:18:31', '2020-12-28 03:18:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_services`
--

CREATE TABLE `vendor_services` (
  `vendor_service_id` int(10) UNSIGNED NOT NULL,
  `vendor_id` int(10) UNSIGNED NOT NULL,
  `service_for` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=men,2=women',
  `category_id` int(10) UNSIGNED NOT NULL,
  `service_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `service_name_ar` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin,
  `description_ar` text CHARACTER SET utf8 COLLATE utf8_bin,
  `service_image` varchar(255) DEFAULT NULL,
  `service_cost` int(11) DEFAULT '0',
  `booking_amount` int(11) DEFAULT '0',
  `rate` decimal(10,2) NOT NULL,
  `time_slots` varchar(225) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_services`
--

INSERT INTO `vendor_services` (`vendor_service_id`, `vendor_id`, `service_for`, `category_id`, `service_name`, `service_name_ar`, `description`, `description_ar`, `service_image`, `service_cost`, `booking_amount`, `rate`, `time_slots`, `created_at`, `updated_at`, `deleted_at`) VALUES
(12, 20, '1', 4, 'Ahh', NULL, NULL, NULL, 'ZeajjuiMzQ_1604654842.jpg', 12, 12, '12.00', NULL, '2020-11-06 04:27:22', '2020-12-25 13:01:33', '2020-11-21 06:51:45'),
(13, 20, '1', 3, 'Service 1', NULL, NULL, NULL, 'jEXGMBIjMD_1604738061.jpg', 123, 123, '123.00', NULL, '2020-11-07 03:34:21', '2020-12-25 13:01:39', '2020-11-02 23:00:00'),
(18, 20, '1', 4, 'Saloon', NULL, NULL, NULL, '8gCLRXw186_1605866783.jpg', 62, 62, '61.60', NULL, '2020-11-20 05:06:23', '2020-12-25 13:01:44', NULL),
(19, 20, '2', 2, 'Beauty', NULL, NULL, NULL, 'T4vqvCQ8yk_1606305251.jpg', 110, 110, '110.00', NULL, '2020-11-25 06:54:11', '2020-12-25 13:01:48', '2020-12-24 05:04:04'),
(25, 20, '2', 3, 'Hair red color', NULL, NULL, NULL, '5CpRviqKHc_1607408032.jpg', 55, 55, '55.00', NULL, '2020-12-08 01:13:52', '2020-12-25 12:55:43', NULL),
(26, 20, '2', 5, 'Nail colour', NULL, NULL, NULL, 'tgdgHWLGi7_1607408404.jpg', 110, 110, '110.00', NULL, '2020-12-08 01:20:04', '2020-12-25 13:01:56', '2020-12-24 05:04:00'),
(27, 20, '1', 2, 'Hair cuting', 'قص الشعر', NULL, NULL, 'ap8etRIy0e_1607681899.jpg', 209, 209, '209.00', NULL, '2020-12-11 05:18:19', '2021-01-21 09:54:27', NULL),
(28, 20, '1', 3, 'Hair was', NULL, NULL, NULL, '7JGFDvXK7f_1607938175.jpg', 219, 219, '218.90', NULL, '2020-12-14 04:29:35', '2020-12-25 13:02:08', NULL),
(32, 20, '2', 5, 'Facail plus hair wash', NULL, 'test des', NULL, 'VvmPQbDNbi_1608553544.jpg', 731, 731, '730.59', NULL, '2020-12-15 08:09:29', '2020-12-25 13:02:13', NULL),
(35, 20, '2', 3, 'Nali palish', NULL, NULL, NULL, '1MsLEfUbB8_1608272130.jpg', 230, 230, '229.90', NULL, '2020-12-18 01:15:30', '2020-12-25 13:02:19', NULL),
(36, 20, '2', 3, 'Aakash Service', NULL, 'Lorem inspem', NULL, 'BdKsL5qYTu_1608549234.jpg', 5000, 550, '6050.00', NULL, '2020-12-21 06:06:35', '2020-12-21 06:13:54', NULL),
(37, 20, '2', 5, 'Face  massage', NULL, 'Hhdbd', NULL, 'G4VeDDjEUl_1608623220.jpg', 200, 200, '200.00', NULL, '2020-12-22 02:46:16', '2020-12-28 04:27:54', '2020-12-28 04:27:54'),
(38, 44, '2', 11, 'Lips', 'Arabic Lips', NULL, NULL, 'BJ9A9r5QIk_1608636990.jpg', 99, 99, '99.00', NULL, '2020-12-22 06:36:30', '2021-01-21 10:21:04', NULL),
(39, 44, '2', 3, '???', NULL, 'للشعر', NULL, 'krZbdCqZJX_1608637782.jpg', 143, 143, '143.00', NULL, '2020-12-22 06:49:42', '2020-12-25 13:02:34', NULL),
(40, 20, '2', 9, 'Scgh', NULL, 'xdcsadsa', NULL, 'SL4965Kl6Y_1608802693.jpg', 5000, 5000, '5000.00', NULL, '2020-12-24 04:38:13', '2020-12-28 00:12:01', '2020-12-28 00:12:01'),
(41, 44, '2', 4, 'Gggg', NULL, 'Gfrrrr', NULL, 'PAGEQCoacV_1609012021.jpg', 220, 220, '220.00', NULL, '2020-12-26 14:47:01', '2020-12-26 14:47:01', NULL),
(42, 49, '2', 5, 'مكياج', NULL, 'null', NULL, 'EhVNKMXxFM_1609166150.jpg', 200, 200, '200.00', NULL, '2020-12-28 09:35:50', '2020-12-28 09:36:45', NULL),
(43, 49, '2', 5, 'مكياج', NULL, NULL, NULL, 'rYxNu5oGgH_1609166158.jpg', 200, 200, '200.00', NULL, '2020-12-28 09:35:58', '2020-12-28 09:35:58', NULL),
(44, 20, '1', 1, 'ennn', NULL, NULL, NULL, NULL, 100, 100, '100.00', NULL, '2021-01-21 00:33:24', '2021-01-21 00:33:24', NULL),
(45, 20, '1', 1, 'ennn', NULL, NULL, NULL, NULL, 100, 100, '100.00', NULL, '2021-01-21 00:33:46', '2021-01-21 00:33:46', NULL),
(46, 20, '1', 1, 'ennn', NULL, NULL, NULL, NULL, 100, 100, '100.00', NULL, '2021-01-21 00:34:10', '2021-01-21 00:34:10', NULL),
(47, 20, '1', 1, 'ennn', 'arrrrr11111', NULL, NULL, NULL, 100, 100, '100.00', NULL, '2021-01-21 00:34:23', '2021-01-21 00:35:03', NULL),
(48, 20, '1', 1, 'ennn', 'arrrrr', NULL, NULL, NULL, 100, 100, '100.00', NULL, '2021-01-21 02:41:27', '2021-01-21 02:41:27', NULL),
(49, 20, '1', 1, 'ennn', 'arrrrr', NULL, '0', NULL, 100, 100, '100.00', NULL, '2021-01-21 02:42:33', '2021-01-21 02:42:33', NULL),
(50, 20, '1', 1, 'ennn', 'arrrrr', NULL, '0', NULL, 100, 100, '100.00', NULL, '2021-01-21 02:42:39', '2021-01-21 02:42:39', NULL),
(51, 20, '1', 1, 'ennn', 'arrrrr', NULL, 'arrrrrr', NULL, 100, 100, '100.00', NULL, '2021-01-21 02:43:42', '2021-01-21 02:43:42', NULL),
(52, 20, '1', 1, 'ennn', 'arrrrr', 'ennnnnnn', 'arrrrrr', NULL, 100, 100, '100.00', NULL, '2021-01-21 02:44:23', '2021-01-21 02:44:23', NULL),
(53, 20, '1', 1, 'ennn', 'arrrrr', 'ennnnnnn', 'arrrrrr', NULL, 100, 100, '100.00', NULL, '2021-01-21 02:44:52', '2021-01-21 02:44:52', NULL),
(54, 20, '1', 1, 'ennn', 'arrrrr', 'ennnnnnn', 'arrrrrr', NULL, 100, 100, '100.00', NULL, '2021-01-21 02:45:03', '2021-01-21 02:45:03', NULL),
(55, 20, '1', 1, 'ennnfsdafsafsadffsdfdsf', 'arrrrr', 'ennnnnnn', 'arrrrrr', NULL, 100, 100, '100.00', NULL, '2021-01-21 02:45:23', '2021-01-21 02:45:23', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `app_ratings`
--
ALTER TABLE `app_ratings`
  ADD PRIMARY KEY (`app_rating_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`chat_id`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`commission_id`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`day_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`document_id`);

--
-- Indexes for table `landing_pages`
--
ALTER TABLE `landing_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `landing_page_images`
--
ALTER TABLE `landing_page_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supports`
--
ALTER TABLE `supports`
  ADD PRIMARY KEY (`support_id`);

--
-- Indexes for table `transaction_history`
--
ALTER TABLE `transaction_history`
  ADD PRIMARY KEY (`transaction_history_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_days`
--
ALTER TABLE `vendor_days`
  ADD PRIMARY KEY (`vendor_day_id`);

--
-- Indexes for table `vendor_portfolios`
--
ALTER TABLE `vendor_portfolios`
  ADD PRIMARY KEY (`vendor_portfolio_id`);

--
-- Indexes for table `vendor_ratings`
--
ALTER TABLE `vendor_ratings`
  ADD PRIMARY KEY (`vendor_rating_id`);

--
-- Indexes for table `vendor_services`
--
ALTER TABLE `vendor_services`
  ADD PRIMARY KEY (`vendor_service_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `app_ratings`
--
ALTER TABLE `app_ratings`
  MODIFY `app_rating_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `chat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `commission_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `day_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `document_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `landing_pages`
--
ALTER TABLE `landing_pages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `landing_page_images`
--
ALTER TABLE `landing_page_images`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `supports`
--
ALTER TABLE `supports`
  MODIFY `support_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `transaction_history`
--
ALTER TABLE `transaction_history`
  MODIFY `transaction_history_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `vendor_days`
--
ALTER TABLE `vendor_days`
  MODIFY `vendor_day_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344;
--
-- AUTO_INCREMENT for table `vendor_portfolios`
--
ALTER TABLE `vendor_portfolios`
  MODIFY `vendor_portfolio_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `vendor_ratings`
--
ALTER TABLE `vendor_ratings`
  MODIFY `vendor_rating_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `vendor_services`
--
ALTER TABLE `vendor_services`
  MODIFY `vendor_service_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
