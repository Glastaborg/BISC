-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2022 at 07:17 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bisc`
--

-- --------------------------------------------------------

--
-- Table structure for table `abouts`
--

CREATE TABLE `abouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mission_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mission_desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vision_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vision_desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `abouts`
--

INSERT INTO `abouts` (`id`, `title`, `slug`, `description`, `image_path`, `video_id`, `mission_title`, `mission_desc`, `vision_title`, `vision_desc`, `status`, `created_at`, `updated_at`) VALUES
(3, 'About Us', 'about-us', '<p>Business Consulting offers a wide range of services to businesses either before or during tough financial times. What sets us apart from other firms in the industry is over three decades of combined legal and business expertise.<br><br>Whether your business is struggling to avoid bankruptcy or trying its best to prepare for it, The visual hierarchy of this item requires additional work. Focus on better defining which areas of this item should demand more attention and creating a logical structure to the design.</p>\n', 'about.png', 'I4QRclr-A9o', 'Our Mission', 'Our mission is to provide expert intelligence and security consulting services, through a team of highly trained and dedicated professionals and best practices, while upholding the highest standards of integrity, reliability, and customer satisfaction.', 'Our Vision', 'To be the leading and trusted provider of comprehensive security solutions, mitigate complex security risks, empower informed decisions, and stay ahead of emerging threats in an ever-evolving landscape.
', 1, '2021-11-07 14:26:20', '2021-11-08 12:33:29');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `category_id`, `title`, `slug`, `description`, `image_path`, `video_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Common so wicket appear to sudden', 'common-so-wicket-appear-to-sudden', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', '1_1604079615.jpg', NULL, 1, '2020-10-30 11:40:15', '2020-10-30 11:40:15'),
(2, 2, 'Announcing me stimulated continuing', 'announcing-me-stimulated-continuing', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', '2_1604079646.jpg', NULL, 1, '2020-10-30 11:40:46', '2020-10-30 11:40:46'),
(3, 3, 'Least their above going stand', 'least-their-above-going-stand', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', '3_1604079678.jpg', NULL, 1, '2020-10-30 11:41:18', '2020-10-30 11:41:18'),
(4, 4, 'Improve your business if you need.', 'improve-your-business-if-you-need', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', '4_1604079717.jpg', NULL, 1, '2020-10-30 11:41:57', '2020-10-30 11:41:57'),
(5, 1, 'Our operations worldwide have been neutral.', 'our-operations-worldwide-have-been-neutral', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', '22_1604079765.jpg', NULL, 1, '2020-10-30 11:42:45', '2020-10-30 11:42:45'),
(6, 3, 'What planning process needs?', 'what-planning-process-needs', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', '24_1604079828.jpg', NULL, 1, '2020-10-30 11:43:48', '2020-10-30 11:43:48');

-- --------------------------------------------------------

--
-- Table structure for table `article_categories`
--

CREATE TABLE `article_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_categories`
--

INSERT INTO `article_categories` (`id`, `title`, `slug`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Development', 'development', NULL, 1, '2020-10-30 11:36:02', '2020-11-25 06:21:22'),
(2, 'Consulting', 'consulting', NULL, 1, '2020-10-30 11:36:10', '2020-10-30 11:36:10'),
(3, 'Finance', 'finance', NULL, 1, '2020-10-30 11:36:19', '2020-10-30 11:36:19'),
(4, 'Branding', 'branding', NULL, 1, '2020-10-30 11:36:27', '2020-10-30 11:36:27');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `title`, `slug`, `description`, `image_path`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nomant', 'nomant', NULL, 'clients-1_1604081500.png', NULL, 1, '2020-10-30 12:07:54', '2020-10-30 12:11:40'),
(2, 'Muchmore', 'muchmore', NULL, 'clients-2_1604081536.png', 'https://www.hitechparks.com/', 1, '2020-10-30 12:12:16', '2020-11-21 01:53:22'),
(3, 'Bussinex', 'bussinex', NULL, 'clients-3_1604081554.png', NULL, 1, '2020-10-30 12:12:34', '2020-10-30 12:12:34'),
(4, 'Hitchau', 'hitchau', NULL, 'clients-4_1604081593.png', 'https://www.hitechparks.com/', 1, '2020-10-30 12:13:13', '2020-10-30 12:13:13');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `subject`, `message`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Habib', 'example@mail.com', '+0123456789', 'We Need Your Team Support', 'I\'ve been looking for this throughout the web and can\'t even find anyone else even asking this, let alone a solution...\r\n\r\nIs there a way to change the color of the highlight area within a text input when text is selected? Not the highlight border or the background, but the portion that appears around the text when you have the text actually selected.', 1, '2020-11-03 20:49:02', '2020-11-03 20:49:02'),
(5, 'Habib', 'admin@mail.com', '+0123456789', 'We Need Your Team Support', '<br/>', 1, '2020-11-03 20:50:35', '2020-11-03 20:50:35'),
(8, 'Hi Tech Parks', 'hitechparks@gmail.com', '', 'Need Pricing for Custom Order', 'Need Pricing for Custom Order', 1, '2020-11-24 23:27:54', '2020-11-24 23:27:54'),
(9, 'Hi Tech Parks', 'hitechparks@gmail.com', NULL, 'We Need Your Team Support', 'We Need Your Team Support', 1, '2020-11-25 00:00:16', '2020-11-25 00:00:16');

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`id`, `title`, `slug`, `description`, `icon`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Satisfied Customers', 'satisfied-customers', '<p><br></p>', NULL, 230, 1, '2020-10-30 12:27:14', '2020-10-30 12:27:14'),
(2, 'Professional Agents', 'professional-agents', NULL, NULL, 89, 1, '2020-10-30 12:27:31', '2020-10-30 12:27:31'),
(3, 'Hours Support', 'hours-support', NULL, NULL, 49, 1, '2020-10-30 12:27:50', '2020-10-30 12:27:50'),
(4, 'Project Finished', 'project-finished', NULL, NULL, 2348, 1, '2020-10-30 12:28:04', '2020-10-30 12:28:04');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `title`, `slug`, `department`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Data Scientist', 'data-scientist', 'IT', NULL, 1, '2020-10-30 11:52:35', '2020-10-30 11:52:35'),
(2, 'Ui/Ux Designer', 'uiux-designer', 'IT', NULL, 1, '2020-10-30 11:52:53', '2020-10-30 11:52:53'),
(3, 'Programmer', 'programmer', 'IT', NULL, 1, '2020-10-30 11:53:12', '2020-10-30 11:53:12');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `title`, `slug`, `description`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(17, 'Your Quote Request Placed', 'quote-placed', '[company]<br>Address: [address], [city].<br><br>Hi, [name]. This is just to inform you that. Your ordered [services] are on progress now. We will update you whenever we take action.<br><br>Regards', NULL, 1, NULL, '2021-11-08 12:45:20'),
(18, 'Your Quote Request Estimated', 'quote-estimated', '[company]<br>Address: [address], [city].<br><br>Hi, [name]. This is just to inform you that. Your ordered [services] are on progress now. We will update you whenever we take action.<br><br>Regards', NULL, 1, NULL, '2021-11-08 12:45:36'),
(19, 'Your Quote Request Approved', 'quote-approved', '[company]<br>Address: [address], [city].<br><br>Hi, [name]. This is just to inform you that. Your ordered [services] are on progress now. We will update you whenever we take action.<br><br>Regards', NULL, 1, NULL, '2021-11-08 12:45:46'),
(20, 'Your Quote Request Rejected', 'quote-rejected', '[company]<br>Address: [address], [city].<br><br>Hi, [name]. This is just to inform you that. Your ordered [services] are on progress now. We will update you whenever we take action.<br><br>Regards', NULL, 1, NULL, '2021-11-08 12:46:00'),
(21, 'You Received a Payment Invoice', 'invoice-send', '[company]<br>Address: [address], [city].<br><br>Hi, [name]. This is just to inform you that. Your ordered [services] are on progress now. We will update you whenever we take action.<br><br>Regards', NULL, 1, NULL, '2021-11-08 12:46:18'),
(22, 'Your Payment Has Been Successfully Received', 'invoice-paid', '[company]<br>Address: [address], [city].<br><br>Hi, [name]. This is just to inform you that. Your ordered [services] are on progress now. We will update you whenever we take action.<br><br>Regards', NULL, 1, NULL, '2021-11-08 12:46:30'),
(23, 'You Have Cancelled a Payment Request', 'invoice-cancelled', '[company]<br>Address: [address], [city].<br><br>Hi, [name]. This is just to inform you that. Your ordered [services] are on progress now. We will update you whenever we take action.<br><br>Regards', NULL, 1, NULL, '2021-11-08 12:46:42'),
(24, 'This email is to notify that your subscription has been successful', 'subscription', '<p>This is just to inform you that. Your subscription on our platform is successful. now. We will update you whenever we take action.<br><br>Regards<br></p>', NULL, 1, NULL, '2021-11-08 12:46:58');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `category_id`, `title`, `slug`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'Do I need a business plan?', 'do-i-need-a-business-plan', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', 1, '2020-10-30 12:02:06', '2020-10-30 12:02:06'),
(2, 1, 'How long should a business plan be?', 'how-long-should-a-business-plan-be', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', 1, '2020-10-30 12:02:43', '2020-10-30 12:02:43'),
(3, 1, 'Where do I start?', 'where-do-i-start', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', 1, '2020-10-30 12:03:19', '2020-10-30 12:03:19'),
(4, 2, 'Do you give any offer for premium customer?', 'do-you-give-any-offer-for-premium-customer', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', 1, '2020-10-30 12:03:53', '2020-10-30 12:03:53'),
(5, 1, 'Why Would a Successful Entrepreneur Hire a Coach?', 'why-would-a-successful-entrepreneur-hire-a-coach', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', 1, '2020-10-30 12:04:20', '2020-10-30 12:04:20'),
(6, 3, 'Waht makes your financial projects special?', 'waht-makes-your-financial-projects-special', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', 1, '2020-10-30 12:05:01', '2020-10-30 12:05:01'),
(7, 2, 'Can I offer my items for free on a promotional basis?', 'can-i-offer-my-items-for-free-on-a-promotional-basis', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', 1, '2020-10-30 12:05:34', '2020-10-30 12:05:34'),
(8, 2, 'Is there a limit to the number of guests should plan in a day?', 'is-there-a-limit-to-the-number-of-guests-should-plan-in-a-day', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', 1, '2020-10-30 12:06:02', '2020-10-30 12:06:02');

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `title`, `slug`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Technical', 'technical', NULL, 1, '2020-10-30 11:37:15', '2020-10-30 11:37:15'),
(2, 'Sales', 'sales', NULL, 1, '2020-10-30 11:37:52', '2020-10-30 11:37:52'),
(3, 'Marketing', 'marketing', NULL, 1, '2020-10-30 11:38:48', '2020-10-30 11:38:48');

-- --------------------------------------------------------

--
-- Table structure for table `get_quotes`
--

CREATE TABLE `get_quotes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefer_contact` int(11) DEFAULT NULL,
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pre_delivery_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `where_find` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `invoice_time` date DEFAULT NULL,
  `mail_status` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `get_quotes`
--

INSERT INTO `get_quotes` (`id`, `name`, `email`, `phone`, `address`, `city`, `company`, `website`, `prefer_contact`, `quantity`, `message`, `file_path`, `pre_delivery_time`, `where_find`, `amount`, `invoice_time`, `mail_status`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Habib R', 'example@mail.com', '+0123456789', 'Mirpur', 'Dhaka', NULL, NULL, 1, NULL, 'Nothing... Will say something...', 'sundrob_1606308059.JPG', NULL, NULL, '580.00', NULL, 0, 1, '2020-11-25 06:40:59', '2020-11-25 06:54:24'),
(5, 'Habib', 'hitechparks@gmail.com', '+0123456789', 'Mirpur', 'Dhaka', 'Hi-Tech Parks', NULL, 2, NULL, 'The detach method. Similarly, if you want to remove a certain entity relationship from the pivot table, you can use detach method. For instance,', NULL, NULL, NULL, '500.00', NULL, 0, 3, '2020-11-25 06:43:47', '2020-11-25 07:03:52');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quote_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(8,2) DEFAULT NULL,
  `invoice_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `service_charge` decimal(8,2) DEFAULT NULL,
  `tax` decimal(8,2) DEFAULT NULL,
  `shipping` decimal(8,2) DEFAULT NULL,
  `invoice_date` datetime NOT NULL,
  `due_date` datetime DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms_conditions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attach` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_type` int(11) DEFAULT NULL,
  `estimate_flag` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `quote_id`, `name`, `email`, `phone`, `address`, `city`, `company`, `total_amount`, `discount_amount`, `invoice_amount`, `service_charge`, `tax`, `shipping`, `invoice_date`, `due_date`, `message`, `terms_conditions`, `reference`, `attach`, `invoice_type`, `estimate_flag`, `status`, `created_at`, `updated_at`) VALUES
(11, NULL, 'Habib R', 'example@mail.com', NULL, 'Mirpur', NULL, NULL, '800.00', NULL, '800.00', '780.00', '20.00', NULL, '2020-11-25 12:49:30', NULL, '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<br></p>', NULL, 'Habib', 'sundrob10_1606308570.JPG', 5, 0, 1, '2020-11-25 06:49:30', '2020-11-25 06:49:30'),
(12, 4, 'Habib R', 'example@mail.com', NULL, 'Mirpur', 'Dhaka', NULL, '580.00', '30.00', '550.00', '500.00', '20.00', '60.00', '2020-11-25 12:54:24', '2020-11-30 00:00:00', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<br></p>', NULL, NULL, NULL, 0, 0, 1, '2020-11-25 06:54:24', '2020-11-25 06:54:24'),
(13, 5, 'Habib', 'hitechparks@gmail.com', NULL, 'Mirpur', 'Dhaka', 'Hi-Tech Parks', '500.00', '50.00', '200.00', '500.00', NULL, NULL, '2020-11-25 12:59:53', NULL, '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<br></p>', NULL, NULL, NULL, 1, 0, 2, '2020-11-25 06:59:53', '2020-11-25 07:05:17');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` tinyint(1) NOT NULL DEFAULT 1,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `description`, `direction`, `default`, `status`, `created_at`, `updated_at`) VALUES
(2, 'English', 'en', NULL, 1, 1, 1, '2021-11-07 14:26:20', '2021-11-07 14:32:29');

-- --------------------------------------------------------

--
-- Table structure for table `live_chats`
--

CREATE TABLE `live_chats` (
  `id` int(10) UNSIGNED NOT NULL,
  `whatsapp_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_greeting` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_position` tinyint(1) NOT NULL DEFAULT 1,
  `whatsapp_status` tinyint(1) NOT NULL DEFAULT 1,
  `facebook_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_greeting_in` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_greeting_out` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_position` tinyint(1) NOT NULL DEFAULT 1,
  `facebook_status` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `live_chats`
--

INSERT INTO `live_chats` (`id`, `whatsapp_no`, `whatsapp_title`, `whatsapp_greeting`, `whatsapp_color`, `whatsapp_position`, `whatsapp_status`, `facebook_id`, `facebook_greeting_in`, `facebook_greeting_out`, `facebook_color`, `facebook_position`, `facebook_status`, `status`, `created_at`, `updated_at`) VALUES
(3, '+8801740473189', 'Chat with us on WhatsApp!', 'Hello, how can we help you?', '#04145F', 1, 1, '1808009959448230', 'Hello, how can we help you?', 'Hello, how can we help you?', '#04145F', 1, 1, 0, '2021-11-07 14:26:20', '2021-11-07 14:37:54');

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `key` text COLLATE utf8mb4_bin NOT NULL,
  `value` text COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `ltm_translations`
--

INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'auth', 'login_title', 'Login Into Admin Panel.', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(2, 1, 'en', 'auth', 'register_title', 'Create Your Account.', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(3, 1, 'en', 'auth', 'verify_title', 'Please Check Your Email to Verify Yourself.', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(4, 1, 'en', 'auth', 'email_title', 'Enter Your Account Email Address.', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(5, 1, 'en', 'auth', 'reset_title', 'Enter Your New Password.', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(6, 1, 'en', 'auth', 'login', 'Login', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(7, 1, 'en', 'auth', 'register', 'Register', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(8, 1, 'en', 'auth', 'verify', 'Verify', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(9, 1, 'en', 'auth', 'reset', 'Reset Password', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(10, 1, 'en', 'auth', 'name', 'Name', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(11, 1, 'en', 'auth', 'email', 'E-Mail Address', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(12, 1, 'en', 'auth', 'password', 'Password', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(13, 1, 'en', 'auth', 'confirm_password', 'Confirm Password', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(14, 1, 'en', 'auth', 'remember', 'Remember Me', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(15, 1, 'en', 'auth', 'forgot_password', 'Forgot Your Password?', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(16, 1, 'en', 'auth', 'dont_have_account', 'Don\'t Have An Account?', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(17, 1, 'en', 'auth', 'verify_your_email', 'Verify Your Email Address', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(18, 1, 'en', 'auth', 'verify_email_sent', 'A fresh verification link has been sent to your email address.', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(19, 1, 'en', 'auth', 'check_your_email', 'Before proceeding, please check your email for a verification link.', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(20, 1, 'en', 'auth', 'not_receive_email', 'If you did not receive the email', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(21, 1, 'en', 'auth', 'send_another_request', 'click here to request another', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(22, 1, 'en', 'auth', 'send_reset_link', 'Send Password Reset Link', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(23, 1, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(24, 1, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(25, 1, 'en', 'common', 'read_more', 'Read More', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(26, 1, 'en', 'common', 'view_more', 'View More', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(27, 1, 'en', 'common', 'get_start', 'Get Start', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(28, 1, 'en', 'common', 'contact_us', 'Contact Us', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(29, 1, 'en', 'common', 'go_home', 'Go Home', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(30, 1, 'en', 'common', 'category', 'Category', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(31, 1, 'en', 'common', 'categories', 'Categories', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(32, 1, 'en', 'common', 'all', 'All', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(33, 1, 'en', 'common', 'currency', '$', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(34, 1, 'en', 'common', 'footer_links', 'Useful Links', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(35, 1, 'en', 'common', 'recent_posts', 'Recent Posts', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(36, 1, 'en', 'contact', 'email', 'Email', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(37, 1, 'en', 'contact', 'phone', 'Call Us', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(38, 1, 'en', 'contact', 'office_time', 'Office Time', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(39, 1, 'en', 'contact', 'address', 'Address', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(40, 1, 'en', 'contact', 'your_name', 'Your Name *', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(41, 1, 'en', 'contact', 'phone_no', 'Phone No', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(42, 1, 'en', 'contact', 'email_address', 'Email Address *', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(43, 1, 'en', 'contact', 'subject', 'Subject *', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(44, 1, 'en', 'contact', 'your_massage', 'Your Massage *', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(45, 1, 'en', 'contact', 'send', 'Send', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(46, 1, 'en', 'dashboard', 'welcome', 'Welcome !', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(47, 1, 'en', 'dashboard', 'hello', 'Hello', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(48, 1, 'en', 'dashboard', 'home', 'Home', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(49, 1, 'en', 'dashboard', 'admin', 'Admin', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(50, 1, 'en', 'dashboard', 'navigation', 'Navigation', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(51, 1, 'en', 'dashboard', 'logout', 'Logout', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(52, 1, 'en', 'dashboard', 'list', 'List', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(53, 1, 'en', 'dashboard', 'select', 'Select', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(54, 1, 'en', 'dashboard', 'please_provide', 'Please Provide', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(55, 1, 'en', 'dashboard', 'setup', 'Setup', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(56, 1, 'en', 'dashboard', 'save', 'Save', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(57, 1, 'en', 'dashboard', 'send', 'Send', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(58, 1, 'en', 'dashboard', 'update', 'Update', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(59, 1, 'en', 'dashboard', 'change', 'Change', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(60, 1, 'en', 'dashboard', 'confirm', 'Confirm', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(61, 1, 'en', 'dashboard', 'close', 'Close', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(62, 1, 'en', 'dashboard', 'cancel', 'Cancel', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(63, 1, 'en', 'dashboard', 'create', 'Create', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(64, 1, 'en', 'dashboard', 'add_new', 'Add New', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(65, 1, 'en', 'dashboard', 'delete', 'Delete', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(66, 1, 'en', 'dashboard', 'remove', 'Remove', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(67, 1, 'en', 'dashboard', 'refresh', 'Refresh', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(68, 1, 'en', 'dashboard', 'back', 'Back', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(69, 1, 'en', 'dashboard', 'approve', 'Approve', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(70, 1, 'en', 'dashboard', 'estimate', 'Estimate', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(71, 1, 'en', 'dashboard', 'reject', 'Reject', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(72, 1, 'en', 'dashboard', 'download', 'Download', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(73, 1, 'en', 'dashboard', 'print', 'Print', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(74, 1, 'en', 'dashboard', 'attach', 'Attach', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(75, 1, 'en', 'dashboard', 'quote', 'Quote|Quotes', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(76, 1, 'en', 'dashboard', 'create_invoice', 'Create Invoice', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(77, 1, 'en', 'dashboard', 'add', 'Add', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(78, 1, 'en', 'dashboard', 'edit', 'Edit', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(79, 1, 'en', 'dashboard', 'view', 'View', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(80, 1, 'en', 'dashboard', 'are_you_sure', 'Are You Sure?', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(81, 1, 'en', 'dashboard', 'delete_warning', 'You will not be able to recover this!', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(82, 1, 'en', 'dashboard', 'success', 'Success', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(83, 1, 'en', 'dashboard', 'error', 'Error', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(84, 1, 'en', 'dashboard', 'created_successfully', 'Created Successfully!', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(85, 1, 'en', 'dashboard', 'updated_successfully', 'Updated Successfully!', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(86, 1, 'en', 'dashboard', 'deleted_successfully', 'Deleted Successfully!', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(87, 1, 'en', 'dashboard', 'sent_successfully', 'Sent Successfully!', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(88, 1, 'en', 'dashboard', 'task_updated', 'Task Updated', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(89, 1, 'en', 'dashboard', 'password_invalid', 'Current password is invalid!', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(90, 1, 'en', 'dashboard', 'email_invalid', 'You are entered same email address!', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(91, 1, 'en', 'dashboard', 'dashboard', 'Dashboard', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(92, 1, 'en', 'dashboard', 'invoice', 'Invoice', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(93, 1, 'en', 'dashboard', 'blog', 'Blog|Blogs', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(94, 1, 'en', 'dashboard', 'blog_list', 'Blog List|Blog List', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(95, 1, 'en', 'dashboard', 'blog_category', 'Blog Category|Blog Categories', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(96, 1, 'en', 'dashboard', 'portfolio', 'Portfolio|Portfolios', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(97, 1, 'en', 'dashboard', 'portfolio_list', 'Portfolio List|Portfolio List', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(98, 1, 'en', 'dashboard', 'portfolio_category', 'Portfolio Category|Portfolio Categories', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(99, 1, 'en', 'dashboard', 'service', 'Service|Services', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(100, 1, 'en', 'dashboard', 'pricing', 'Pricing|Pricings', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(101, 1, 'en', 'dashboard', 'team', 'Our Team', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(102, 1, 'en', 'dashboard', 'member', 'Member|Member List', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(103, 1, 'en', 'dashboard', 'designation', 'Designation', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(104, 1, 'en', 'dashboard', 'faq', 'FAQ|FAQs', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(105, 1, 'en', 'dashboard', 'faq_list', 'FAQ List|FAQ List', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(106, 1, 'en', 'dashboard', 'faq_category', 'FAQ Category|FAQ Categories', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(107, 1, 'en', 'dashboard', 'slider', 'Slider|Sliders', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(108, 1, 'en', 'dashboard', 'partner', 'Partner|Partners', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(109, 1, 'en', 'dashboard', 'testimonial', 'Testimonial|Testimonials', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(110, 1, 'en', 'dashboard', 'work_process', 'Work Process|Work Processes', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(111, 1, 'en', 'dashboard', 'feature', 'Why Choose Us|Why Choose Us', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(112, 1, 'en', 'dashboard', 'counter', 'Counter|Counters', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(113, 1, 'en', 'dashboard', 'email', 'Email', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(114, 1, 'en', 'dashboard', 'subscriber', 'Subscriber|Subscribers', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(115, 1, 'en', 'dashboard', 'about', 'About Us', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(116, 1, 'en', 'dashboard', 'page', 'Page|Pages', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(117, 1, 'en', 'dashboard', 'page_setup', 'Page Setup|Pages Setup', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(118, 1, 'en', 'dashboard', 'footer_page', 'Footer Page|Footer Pages', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(119, 1, 'en', 'dashboard', 'section', 'Section|Sections', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(120, 1, 'en', 'dashboard', 'template', 'Email Template', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(121, 1, 'en', 'dashboard', 'live_chat', 'LiveChat|LiveChats', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(122, 1, 'en', 'dashboard', 'language', 'Language|Languages', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(123, 1, 'en', 'dashboard', 'translation', 'Translation|Translations', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(124, 1, 'en', 'dashboard', 'setting', 'Setting|Settings', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(125, 1, 'en', 'dashboard', 'general_setting', 'General Setting|General Settings', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(126, 1, 'en', 'dashboard', 'no', 'No', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(127, 1, 'en', 'dashboard', 'sl', 'SL', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(128, 1, 'en', 'dashboard', 'title', 'Title', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(129, 1, 'en', 'dashboard', 'category', 'Category', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(130, 1, 'en', 'dashboard', 'short_desc', 'Short Details', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(131, 1, 'en', 'dashboard', 'description', 'Description', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(132, 1, 'en', 'dashboard', 'thumbnail', 'Thumbnail', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(133, 1, 'en', 'dashboard', 'youtube_video', 'Youtube Video', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(134, 1, 'en', 'dashboard', 'youtube_video_id', 'Youtube Video ID', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(135, 1, 'en', 'dashboard', 'icon', 'Icon', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(136, 1, 'en', 'dashboard', 'value', 'Value', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(137, 1, 'en', 'dashboard', 'status', 'Status', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(138, 1, 'en', 'dashboard', 'action', 'Action', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(139, 1, 'en', 'dashboard', 'logo', 'Logo', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(140, 1, 'en', 'dashboard', 'photo', 'Photo', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(141, 1, 'en', 'dashboard', 'name', 'Name', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(142, 1, 'en', 'dashboard', 'phone', 'Phone', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(143, 1, 'en', 'dashboard', 'subject', 'Subject', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(144, 1, 'en', 'dashboard', 'message', 'Message', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(145, 1, 'en', 'dashboard', 'department', 'Department', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(146, 1, 'en', 'dashboard', 'organization', 'Organization', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(147, 1, 'en', 'dashboard', 'price', 'Price', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(148, 1, 'en', 'dashboard', 'old_price', 'Old Price', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(149, 1, 'en', 'dashboard', 'duration', 'Duration', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(150, 1, 'en', 'dashboard', 'features', 'Features', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(151, 1, 'en', 'dashboard', 'feature_name', 'Feature Name', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(152, 1, 'en', 'dashboard', 'add_feature', 'Add Feature', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(153, 1, 'en', 'dashboard', 'web_link', 'Web Link', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(154, 1, 'en', 'dashboard', 'whatsapp', 'WhatsApp No', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(155, 1, 'en', 'dashboard', 'shortcode', 'Shortcode', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(156, 1, 'en', 'dashboard', 'locale', 'Locale', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(157, 1, 'en', 'dashboard', 'date', 'Date', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(158, 1, 'en', 'dashboard', 'mission_title', 'Mission Title', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(159, 1, 'en', 'dashboard', 'mission_description', 'Mission Description', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(160, 1, 'en', 'dashboard', 'vision_title', 'Vision Title', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(161, 1, 'en', 'dashboard', 'vision_description', 'Vision Description', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(162, 1, 'en', 'dashboard', 'quote_no', 'Quote No.', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(163, 1, 'en', 'dashboard', 'quote_placed', 'Quote Placed', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(164, 1, 'en', 'dashboard', 'invoice_no', 'Invoice No', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(165, 1, 'en', 'dashboard', 'invoice_date', 'Invoice Date', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(166, 1, 'en', 'dashboard', 'invoice_type', 'Invoice Type', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(167, 1, 'en', 'dashboard', 'total_blogs', 'Total Blogs', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(168, 1, 'en', 'dashboard', 'total_portfolios', 'Total Portfolios', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(169, 1, 'en', 'dashboard', 'total_services', 'Total Services', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(170, 1, 'en', 'dashboard', 'total_faqs', 'Total FAQs', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(171, 1, 'en', 'dashboard', 'total_members', 'Total Members', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(172, 1, 'en', 'dashboard', 'total_partners', 'Total Partners', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(173, 1, 'en', 'dashboard', 'total_emails', 'Total Emails', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(174, 1, 'en', 'dashboard', 'total_subscribers', 'Total Subscribers', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(175, 1, 'en', 'dashboard', 'site_info', 'Site Info', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(176, 1, 'en', 'dashboard', 'contact_info', 'Contact Info', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(177, 1, 'en', 'dashboard', 'social_info', 'Social Info', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(178, 1, 'en', 'dashboard', 'customization', 'Customization', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(179, 1, 'en', 'dashboard', 'account', 'Account', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(180, 1, 'en', 'dashboard', 'admin_mail_address', 'Change Mail Address', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(181, 1, 'en', 'dashboard', 'admin_change_password', 'Change Password', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(182, 1, 'en', 'dashboard', 'site_title', 'Site Title', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(183, 1, 'en', 'dashboard', 'meta_title', 'Meta Title', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(184, 1, 'en', 'dashboard', 'meta_description', 'Meta Description', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(185, 1, 'en', 'dashboard', 'meta_desc_length', 'Max length 160 characters', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(186, 1, 'en', 'dashboard', 'meta_keywords', 'Meta Keywords', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(187, 1, 'en', 'dashboard', 'keywords_separate', 'Separate Every Keyword by Using (,) Symbol', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(188, 1, 'en', 'dashboard', 'site_logo', 'Site Logo', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(189, 1, 'en', 'dashboard', 'site_favicon', 'Site Favicon', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(190, 1, 'en', 'dashboard', 'footer_text', 'Footer Text', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(191, 1, 'en', 'dashboard', 'phone_no_1', 'Phone No 1', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(192, 1, 'en', 'dashboard', 'phone_no_2', 'Phone No 2', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(193, 1, 'en', 'dashboard', 'email_address_1', 'Email Address 1', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(194, 1, 'en', 'dashboard', 'email_address_2', 'Email Address 2', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(195, 1, 'en', 'dashboard', 'contact_address', 'Contact Address', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(196, 1, 'en', 'dashboard', 'contact_mail', 'Contact Mail', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(197, 1, 'en', 'dashboard', 'office_hours', 'Office Hours', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(198, 1, 'en', 'dashboard', 'open_close_times', 'Open-Close Times', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(199, 1, 'en', 'dashboard', 'google_map', 'Google Map', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(200, 1, 'en', 'dashboard', 'embed_code', 'Embed Code', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(201, 1, 'en', 'dashboard', 'custom_css', 'Custom CSS', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(202, 1, 'en', 'dashboard', 'mail_address', 'Mail Address', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(203, 1, 'en', 'dashboard', 'old_password', 'Old Password', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(204, 1, 'en', 'dashboard', 'new_password', 'New Password', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(205, 1, 'en', 'dashboard', 'confirm_password', 'Confirm Password', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(206, 1, 'en', 'dashboard', 'website', 'Website URL', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(207, 1, 'en', 'dashboard', 'facebook', 'Facebook URL', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(208, 1, 'en', 'dashboard', 'twitter', 'Twitter URL', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(209, 1, 'en', 'dashboard', 'linkedin', 'Linkedin URL', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(210, 1, 'en', 'dashboard', 'instagram', 'Instagram URL', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(211, 1, 'en', 'dashboard', 'pinterest', 'Pinterest URL', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(212, 1, 'en', 'dashboard', 'youtube', 'Youtube URL', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(213, 1, 'en', 'dashboard', 'skype', 'Skype ID', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(214, 1, 'en', 'dashboard', 'inc_country_code', 'inc. country code', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(215, 1, 'en', 'dashboard', 'whatsapp_live_chat', 'WhatsApp Live Chat', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(216, 1, 'en', 'dashboard', 'whatsapp_header_title', 'Header Title', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(217, 1, 'en', 'dashboard', 'whatsapp_greeting_message', 'Greeting Message', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(218, 1, 'en', 'dashboard', 'messenger_live_chat', 'Messenger Live Chat', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(219, 1, 'en', 'dashboard', 'facebook_page_id', 'Facebook Page ID', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(220, 1, 'en', 'dashboard', 'facebook_login_greeting', 'Login Greeting', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(221, 1, 'en', 'dashboard', 'facebook_logout_greeting', 'Logout Greeting', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(222, 1, 'en', 'dashboard', 'select_status', 'Select Status', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(223, 1, 'en', 'dashboard', 'active', 'Active', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(224, 1, 'en', 'dashboard', 'inactive', 'Inactive', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(225, 1, 'en', 'dashboard', 'display', 'Display', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(226, 1, 'en', 'dashboard', 'pending', 'Pending', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(227, 1, 'en', 'dashboard', 'paid', 'Paid', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(228, 1, 'en', 'dashboard', 'canceled', 'Canceled', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(229, 1, 'en', 'dashboard', 'estimated', 'Estimated', '2022-08-21 11:13:08', '2022-08-21 11:13:08'),
(230, 1, 'en', 'dashboard', 'approved', 'Approved', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(231, 1, 'en', 'dashboard', 'rejected', 'Rejected', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(232, 1, 'en', 'dashboard', 'default', 'Default', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(233, 1, 'en', 'dashboard', 'make_default', 'Make Default', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(234, 1, 'en', 'dashboard', 'image_size', 'Best Resolution Height- :height PX, Width- :width PX', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(235, 1, 'en', 'dashboard', 'prefer_cells', 'Prefer to use :cells cells', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(236, 1, 'en', 'dashboard', 'sidebar', 'Action', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(237, 1, 'en', 'dashboard', 'advance', 'Advance', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(238, 1, 'en', 'dashboard', 'interval', 'Interval', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(239, 1, 'en', 'dashboard', 'milestone', 'Milestone', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(240, 1, 'en', 'dashboard', 'final', 'Final', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(241, 1, 'en', 'dashboard', 'full', 'Full', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(242, 1, 'en', 'dashboard', 'due_date', 'Due Date', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(243, 1, 'en', 'dashboard', 'invoice_status', 'Invoice Status', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(244, 1, 'en', 'dashboard', 'billing_address', 'Billing Address', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(245, 1, 'en', 'dashboard', 'company', 'Company', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(246, 1, 'en', 'dashboard', 'address', 'Address', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(247, 1, 'en', 'dashboard', 'city', 'City', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(248, 1, 'en', 'dashboard', 'quote_files', 'Customer Files', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(249, 1, 'en', 'dashboard', 'reference', 'Reference', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(250, 1, 'en', 'dashboard', 'services', 'Services', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(251, 1, 'en', 'dashboard', 'note', 'Note', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(252, 1, 'en', 'dashboard', 'service_bill', 'Service Bill', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(253, 1, 'en', 'dashboard', 'tax_charge', 'Tax Charge', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(254, 1, 'en', 'dashboard', 'shipping_charge', 'Shipping Charge', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(255, 1, 'en', 'dashboard', 'total', 'Total', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(256, 1, 'en', 'dashboard', 'discount', 'Discount', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(257, 1, 'en', 'dashboard', 'payable', 'Payable', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(258, 1, 'en', 'dashboard', 'total_amount', 'Total Amount', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(259, 1, 'en', 'dashboard', 'discount_amount', 'Discount Amount', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(260, 1, 'en', 'dashboard', 'invoice_amount', 'Invoice Amount', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(261, 1, 'en', 'dashboard', 'send_mail', 'Send Mail', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(262, 1, 'en', 'dashboard', 'prefer_contact', 'Prefer contact?', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(263, 1, 'en', 'dashboard', 'no_value', 'No value', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(264, 1, 'en', 'dashboard', 'template-quote-placed', 'Quote Placed', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(265, 1, 'en', 'dashboard', 'template-quote-estimated', 'Quote Estimated', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(266, 1, 'en', 'dashboard', 'template-quote-approved', 'Quote Approved', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(267, 1, 'en', 'dashboard', 'template-quote-rejected', 'Quote Rejected', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(268, 1, 'en', 'dashboard', 'template-invoice-send', 'Invoice Send', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(269, 1, 'en', 'dashboard', 'template-invoice-paid', 'Invoice Paid', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(270, 1, 'en', 'dashboard', 'template-invoice-cancelled', 'Invoice Cancelled', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(271, 1, 'en', 'dashboard', 'template-subscription', 'Subscription', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(272, 1, 'en', 'email', 'pay_btn', 'Pay By Paypal', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(273, 1, 'en', 'email', 'attach_btn', 'Download Attachments', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(274, 1, 'en', 'email', 'hello', 'Hello', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(275, 1, 'en', 'email', 'name', 'Name', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(276, 1, 'en', 'email', 'email', 'Email', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(277, 1, 'en', 'email', 'phone', 'Phone', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(278, 1, 'en', 'email', 'company', 'Company', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(279, 1, 'en', 'email', 'address', 'Address', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(280, 1, 'en', 'email', 'city', 'City', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(281, 1, 'en', 'email', 'reference', 'Reference', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(282, 1, 'en', 'email', 'bill', 'Total Bill', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(283, 1, 'en', 'email', 'service_charge', 'Service Bill', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(284, 1, 'en', 'email', 'tax', 'Tax Charge', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(285, 1, 'en', 'email', 'shipping', 'Shipping Charge', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(286, 1, 'en', 'email', 'total_amount', 'Total Amount', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(287, 1, 'en', 'email', 'discount_amount', 'Discount Amount', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(288, 1, 'en', 'email', 'payable_amount', 'Payable Amount', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(289, 1, 'en', 'email', 'quote_id', 'Quote ID', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(290, 1, 'en', 'email', 'invoice_id', 'Invoice ID', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(291, 1, 'en', 'email', 'service_bill', 'Service Bill', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(292, 1, 'en', 'email', 'invoice', 'Invoice', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(293, 1, 'en', 'email', 'invoice_date', 'Invoice Date', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(294, 1, 'en', 'email', 'due_date', 'Due Date', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(295, 1, 'en', 'email', 'quote', 'Quote', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(296, 1, 'en', 'email', 'services', 'Services', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(297, 1, 'en', 'email', 'invoice_type', 'Invoice Type', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(298, 1, 'en', 'email', 'estimate', 'Estimate', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(299, 1, 'en', 'email', 'advance', 'Advance', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(300, 1, 'en', 'email', 'interval', 'Interval', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(301, 1, 'en', 'email', 'milestone', 'Milestone', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(302, 1, 'en', 'email', 'final', 'Final', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(303, 1, 'en', 'email', 'full', 'Full', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(304, 1, 'en', 'email', 'thanks', 'Thanks', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(305, 1, 'en', 'email', 'send_successfully', 'Mail Send Successfully!', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(306, 1, 'en', 'email', 'receiver_not_found', 'Receiver Not Configured!', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(307, 1, 'en', 'email', 'quote_submitted', 'Quote Request Submitted', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(308, 1, 'en', 'email', 'new_quote_request', 'You Have New Quote Request!', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(309, 1, 'en', 'email', 'payment_cancelled', 'Your payment request has cancelled!', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(310, 1, 'en', 'email', 'got_new_payment', 'You got a new payment!', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(311, 1, 'en', 'email', 'something_is_wrong', 'Something is wrong.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(312, 1, 'en', 'email', 'payment_successfull', 'You have successfully make the payment.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(313, 1, 'en', 'email', 'login_dashboard_to_check', 'Please login your application dashboard to see the more details. Thank you.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(314, 1, 'en', 'form', 'your_name', 'Your Name *', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(315, 1, 'en', 'form', 'phone_no', 'Phone No *', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(316, 1, 'en', 'form', 'email_address', 'Email Address *', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(317, 1, 'en', 'form', 'address', 'Address *', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(318, 1, 'en', 'form', 'city', 'City *', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(319, 1, 'en', 'form', 'company', 'Company (Optional)', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(320, 1, 'en', 'form', 'prefer_contact', 'What do you prefer for contact? *', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(321, 1, 'en', 'form', 'phone', 'Phone', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(322, 1, 'en', 'form', 'email', 'Email', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(323, 1, 'en', 'form', 'services', 'Services (You can choose multiple)', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(324, 1, 'en', 'form', 'your_massage', 'Write Your Quotation Detail Here... *', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(325, 1, 'en', 'form', 'upload_file', 'Upload File (Optional)', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(326, 1, 'en', 'form', 'submit', 'Submit Now', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(327, 1, 'en', 'navbar', 'home', 'Home', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(328, 1, 'en', 'navbar', 'about', 'About Us', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(329, 1, 'en', 'navbar', 'services', 'Services', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(330, 1, 'en', 'navbar', 'service-detail', 'Service Detail', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(331, 1, 'en', 'navbar', 'portfolios', 'Portfolios', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(332, 1, 'en', 'navbar', 'portfolio-detail', 'Portfolio Detail', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(333, 1, 'en', 'navbar', 'pricing', 'Pricing', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(334, 1, 'en', 'navbar', 'blog', 'Blog', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(335, 1, 'en', 'navbar', 'blog-detail', 'Blog Detail', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(336, 1, 'en', 'navbar', 'faqs', 'FAQs', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(337, 1, 'en', 'navbar', 'contact', 'Contact Us', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(338, 1, 'en', 'navbar', 'get_quote', 'Get A Quote', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(339, 1, 'en', 'navbar', 'error', 'Error 404', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(340, 1, 'en', 'navbar', 'payment_feedback', 'Payment Feedback', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(341, 1, 'en', 'pagination', 'previous', '&laquo; Previous', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(342, 1, 'en', 'pagination', 'next', 'Next &raquo;', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(343, 1, 'en', 'passwords', 'password', 'Passwords must be at least eight characters and match the confirmation.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(344, 1, 'en', 'passwords', 'reset', 'Your password has been reset!', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(345, 1, 'en', 'passwords', 'sent', 'We have e-mailed your password reset link!', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(346, 1, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(347, 1, 'en', 'passwords', 'user', 'We can\'t find a user with that e-mail address.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(348, 1, 'en', 'search', 'search_field', 'Search.....', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(349, 1, 'en', 'search', 'no_result', 'No Result Found!', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(350, 1, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(351, 1, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(352, 1, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(353, 1, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(354, 1, 'en', 'validation', 'alpha', 'The :attribute may only contain letters.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(355, 1, 'en', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, dashes and underscores.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(356, 1, 'en', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(357, 1, 'en', 'validation', 'array', 'The :attribute must be an array.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(358, 1, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(359, 1, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(360, 1, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(361, 1, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(362, 1, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(363, 1, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(364, 1, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(365, 1, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(366, 1, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(367, 1, 'en', 'validation', 'date_equals', 'The :attribute must be a date equal to :date.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(368, 1, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(369, 1, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(370, 1, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(371, 1, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(372, 1, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(373, 1, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(374, 1, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(375, 1, 'en', 'validation', 'ends_with', 'The :attribute must end with one of the following: :values', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(376, 1, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(377, 1, 'en', 'validation', 'file', 'The :attribute must be a file.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(378, 1, 'en', 'validation', 'filled', 'The :attribute field must have a value.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(379, 1, 'en', 'validation', 'gt.numeric', 'The :attribute must be greater than :value.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(380, 1, 'en', 'validation', 'gt.file', 'The :attribute must be greater than :value kilobytes.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(381, 1, 'en', 'validation', 'gt.string', 'The :attribute must be greater than :value characters.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(382, 1, 'en', 'validation', 'gt.array', 'The :attribute must have more than :value items.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(383, 1, 'en', 'validation', 'gte.numeric', 'The :attribute must be greater than or equal :value.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(384, 1, 'en', 'validation', 'gte.file', 'The :attribute must be greater than or equal :value kilobytes.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(385, 1, 'en', 'validation', 'gte.string', 'The :attribute must be greater than or equal :value characters.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(386, 1, 'en', 'validation', 'gte.array', 'The :attribute must have :value items or more.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(387, 1, 'en', 'validation', 'image', 'The :attribute must be an image.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(388, 1, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(389, 1, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(390, 1, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(391, 1, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(392, 1, 'en', 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(393, 1, 'en', 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(394, 1, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(395, 1, 'en', 'validation', 'lt.numeric', 'The :attribute must be less than :value.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(396, 1, 'en', 'validation', 'lt.file', 'The :attribute must be less than :value kilobytes.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(397, 1, 'en', 'validation', 'lt.string', 'The :attribute must be less than :value characters.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(398, 1, 'en', 'validation', 'lt.array', 'The :attribute must have less than :value items.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(399, 1, 'en', 'validation', 'lte.numeric', 'The :attribute must be less than or equal :value.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(400, 1, 'en', 'validation', 'lte.file', 'The :attribute must be less than or equal :value kilobytes.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(401, 1, 'en', 'validation', 'lte.string', 'The :attribute must be less than or equal :value characters.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(402, 1, 'en', 'validation', 'lte.array', 'The :attribute must not have more than :value items.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(403, 1, 'en', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(404, 1, 'en', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(405, 1, 'en', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(406, 1, 'en', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(407, 1, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(408, 1, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(409, 1, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(410, 1, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(411, 1, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(412, 1, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(413, 1, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(414, 1, 'en', 'validation', 'not_regex', 'The :attribute format is invalid.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(415, 1, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(416, 1, 'en', 'validation', 'present', 'The :attribute field must be present.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(417, 1, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(418, 1, 'en', 'validation', 'required', 'The :attribute field is required.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(419, 1, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(420, 1, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(421, 1, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(422, 1, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values are present.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(423, 1, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(424, 1, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(425, 1, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(426, 1, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(427, 1, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(428, 1, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(429, 1, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(430, 1, 'en', 'validation', 'starts_with', 'The :attribute must start with one of the following: :values', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(431, 1, 'en', 'validation', 'string', 'The :attribute must be a string.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(432, 1, 'en', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(433, 1, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(434, 1, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(435, 1, 'en', 'validation', 'url', 'The :attribute format is invalid.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(436, 1, 'en', 'validation', 'uuid', 'The :attribute must be a valid UUID.', '2022-08-21 11:13:09', '2022-08-21 11:13:09'),
(437, 1, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2022-08-21 11:13:09', '2022-08-21 11:13:09');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `designation_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `designation_id`, `title`, `slug`, `description`, `image_path`, `facebook`, `twitter`, `instagram`, `linkedin`, `email`, `phone`, `whatsapp`, `website`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Amir Bubhan', 'amir-bubhan', NULL, '2_1604080555.jpg', 'https://www.facebook.com/HiTechParks/', 'https://twitter.com/hitechparks', 'https://www.hitechparks.com/', 'https://www.linkedin.com/company/hi-techparks/', 'example@mail.com', '+0123456789', NULL, NULL, 1, '2020-10-30 11:55:55', '2020-10-30 11:55:55'),
(2, 3, 'Robick Rona', 'robick-rona', NULL, '3_1604080603.jpg', 'https://www.facebook.com/HiTechParks/', 'https://twitter.com/hitechparks', 'https://www.hitechparks.com/', 'https://www.linkedin.com/company/hi-techparks/', 'example@mail.com', '+0123456789', NULL, NULL, 1, '2020-10-30 11:56:43', '2020-10-30 12:00:57'),
(3, 2, 'Jessica Jones', 'jessica-jones', NULL, '4_1604080632.jpg', 'https://www.facebook.com/HiTechParks/', 'https://twitter.com/hitechparks', 'https://www.hitechparks.com/', 'https://www.linkedin.com/company/hi-techparks/', 'example@mail.com', '+0123456789', NULL, NULL, 1, '2020-10-30 11:57:12', '2020-10-30 11:57:12'),
(4, 3, 'Peater Priston', 'peater-priston', NULL, '6_1604080689.jpg', 'https://www.facebook.com/HiTechParks/', 'https://twitter.com/hitechparks', 'https://www.hitechparks.com/', 'https://www.linkedin.com/company/hi-techparks/', 'example@mail.com', '+0123456789', NULL, NULL, 1, '2020-10-30 11:58:09', '2020-10-30 11:58:09'),
(5, 2, 'Botania Joni', 'botania-joni', NULL, '9_1604080735.jpg', 'https://www.facebook.com/HiTechParks/', 'https://twitter.com/hitechparks', 'https://www.hitechparks.com/', 'https://www.linkedin.com/company/hi-techparks/', 'example@mail.com', '+0123456789', NULL, NULL, 1, '2020-10-30 11:58:55', '2020-10-30 11:58:55'),
(6, 3, 'David Gade', 'david-gade', NULL, '8_1604080775.jpg', 'https://www.facebook.com/HiTechParks/', 'https://twitter.com/hitechparks', NULL, 'https://www.linkedin.com/company/hi-techparks/', 'example@mail.com', '+0123456789', NULL, NULL, 1, '2020-10-30 11:59:35', '2020-10-30 11:59:35');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_06_21_034842_create_article_categories_table', 1),
(4, '2019_06_21_174850_create_articles_table', 1),
(5, '2019_06_23_085924_create_faq_categories_table', 1),
(6, '2019_06_23_090734_create_faqs_table', 1),
(7, '2019_06_23_125726_create_settings_table', 1),
(8, '2020_10_19_181445_create_portfolio_categories_table', 1),
(9, '2020_10_20_054101_create_portfolios_table', 1),
(10, '2020_10_20_064637_create_portfolio_category_table', 1),
(11, '2020_10_20_065345_create_designations_table', 1),
(12, '2020_10_20_160810_create_members_table', 1),
(13, '2020_10_20_190635_create_clients_table', 1),
(14, '2020_10_21_065124_create_testimonials_table', 1),
(15, '2020_10_21_073444_create_sliders_table', 1),
(16, '2020_10_21_081243_create_services_table', 1),
(17, '2020_10_21_160828_create_work_processes_table', 1),
(18, '2020_10_22_155439_create_why_choose_us_table', 1),
(19, '2020_10_22_163117_create_counters_table', 1),
(20, '2020_10_22_171933_create_contacts_table', 1),
(21, '2020_10_22_175247_create_subscribers_table', 1),
(22, '2020_10_22_182912_create_socials_table', 1),
(23, '2020_10_23_132746_create_pages_table', 1),
(24, '2020_10_23_140659_create_pricings_table', 1),
(25, '2020_10_23_172412_create_sections_table', 1),
(26, '2020_10_27_181842_create_abouts_table', 1),
(27, '2020_11_10_174625_create_live_chats_table', 2),
(28, '2020_11_14_081146_create_email_templates_table', 3),
(29, '2020_11_12_171920_create_get_quotes_table', 4),
(30, '2020_11_12_181128_create_serviceables_table', 4),
(31, '2020_11_14_183701_create_invoices_table', 5),
(32, '2019_03_21_160417_create_languages_table', 6),
(33, '2021_10_20_191833_create_page_setups_table', 6),
(34, '2014_04_02_193005_create_translations_table', 7),
(35, '2019_12_14_000001_create_personal_access_tokens_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `description`, `image_path`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Privacy & Policy', 'privacy-policy', '<p><br><h4>What is Lorem Ipsum?</h4><p><br>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><br></p><h4>Why do we use it?</h4><p><br>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br><br></p><h4>Where does it come from?</h4><p><br>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br><br>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.<br></p></p>\n', 'noimage.jpg', 1, '2020-10-30 12:47:49', '2020-10-30 12:47:49'),
(2, 'Terms & Conditions', 'terms-conditions', '<p><br><h4>What is Lorem Ipsum?</h4><p><br>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><br></p><h4>Why do we use it?</h4><p><br>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br><br></p><h4>Where does it come from?</h4><p><br>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br><br>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.<br><br></p></p>\n', 'noimage.jpg', 1, '2020-10-30 12:48:49', '2020-10-30 12:48:49'),
(3, 'Disclaimer', 'disclaimer', '<p><br><h4>What is Lorem Ipsum?</h4><p><br>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><br></p><h4>Why do we use it?</h4><p><br>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br><br></p><h4>Where does it come from?</h4><p><br>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br><br>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.<br><br></p></p>\n', 'noimage.jpg', 1, '2020-10-30 12:49:28', '2020-10-30 12:49:28');

-- --------------------------------------------------------

--
-- Table structure for table `page_setups`
--

CREATE TABLE `page_setups` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_setups`
--

INSERT INTO `page_setups` (`id`, `title`, `slug`, `meta_title`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(10, 'Home', 'home', 'Home', NULL, NULL, 1, NULL, NULL),
(11, 'About Us', 'about-us', 'About Us', NULL, NULL, 1, NULL, NULL),
(12, 'Services', 'services', 'Services', NULL, NULL, 1, NULL, NULL),
(13, 'Portfolio', 'portfolio', 'Portfolio', NULL, NULL, 1, NULL, NULL),
(14, 'Pricing', 'pricing', 'Pricing', NULL, NULL, 1, NULL, NULL),
(15, 'Blog', 'blog', 'Blog', NULL, NULL, 1, NULL, NULL),
(16, 'FAQs', 'faqs', 'FAQs', NULL, NULL, 1, NULL, NULL),
(17, 'Contact Us', 'contact-us', 'Contact Us', NULL, NULL, 1, NULL, NULL),
(18, 'Get A Quote', 'get-quote', 'Get A Quote', NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolios`
--

CREATE TABLE `portfolios` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `portfolios`
--

INSERT INTO `portfolios` (`id`, `title`, `slug`, `description`, `image_path`, `video_id`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Startup Funding', 'startup-funding', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', '1_1604078770.jpg', NULL, NULL, 1, '2020-10-30 11:26:10', '2020-10-30 11:26:10'),
(2, 'Accounting Advisory', 'accounting-advisory', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', '2_1604078816.jpg', 'I4QRclr-A9o', NULL, 1, '2020-10-30 11:26:56', '2020-10-30 11:26:56'),
(3, 'Merger & Acquisition', 'merger-acquisition', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', '3_1604078850.jpg', 'I4QRclr-A9o', NULL, 1, '2020-10-30 11:27:30', '2020-10-30 11:27:30'),
(4, 'Assets For Technology', 'assets-for-technology', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', '4_1604078886.jpg', 'I4QRclr-A9o', NULL, 1, '2020-10-30 11:28:06', '2020-10-30 11:28:06'),
(5, 'Business Matching', 'business-matching', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', '5_1604078920.jpg', NULL, NULL, 1, '2020-10-30 11:28:40', '2020-10-30 11:28:40'),
(6, 'Tessellation Walls', 'tessellation-walls', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', '6_1604079038.jpg', 'I4QRclr-A9o', NULL, 1, '2020-10-30 11:30:38', '2020-10-30 11:30:38');

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_categories`
--

CREATE TABLE `portfolio_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `portfolio_categories`
--

INSERT INTO `portfolio_categories` (`id`, `title`, `slug`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Development', 'development', NULL, 1, '2020-10-30 11:23:29', '2020-10-30 11:23:29'),
(2, 'Consulting', 'consulting', NULL, 1, '2020-10-30 11:23:42', '2020-10-30 11:23:42'),
(3, 'Finance', 'finance', NULL, 1, '2020-10-30 11:24:00', '2020-10-30 11:24:00'),
(4, 'Branding', 'branding', NULL, 1, '2020-10-30 11:24:15', '2020-10-30 11:24:15');

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_category`
--

CREATE TABLE `portfolio_category` (
  `portfolio_id` int(10) UNSIGNED NOT NULL,
  `portfolio_category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `portfolio_category`
--

INSERT INTO `portfolio_category` (`portfolio_id`, `portfolio_category_id`) VALUES
(1, 1),
(1, 3),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 2),
(5, 4),
(6, 2),
(6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pricings`
--

CREATE TABLE `pricings` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pricings`
--

INSERT INTO `pricings` (`id`, `title`, `slug`, `price`, `old_price`, `duration`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Basic', 'basic', '12', NULL, 'Year', '[\"Demo file\",\"Update\",\"File compressed\",\"Commercial use\",\"Support\",\"2 database\",\"Documetation\"]', 1, '2020-10-30 11:48:52', '2020-10-30 11:48:52'),
(2, 'Regular', 'regular', '29', NULL, 'Year', '[\"Demo file\",\"Update\",\"File compressed\",\"Commercial use\",\"Support\",\"5 database\",\"Documetation\"]', 1, '2020-10-30 11:50:12', '2020-10-30 11:50:12'),
(3, 'Extended', 'extended', '59', NULL, 'Year', '[\"Demo file\",\"Update\",\"File compressed\",\"Commercial use\",\"Support\",\"8 database\",\"Documetation\"]', 1, '2020-10-30 11:51:24', '2020-10-30 11:51:24');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `title`, `slug`, `description`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(31, 'Latest Blog', 'blog', '<p>While mirth large of on front. Ye he greater related adapted proceed entered an.<br></p>', NULL, 1, NULL, '2021-11-08 12:36:33'),
(32, 'Our Portfolios', 'portfolio', NULL, NULL, 1, NULL, '2021-11-08 12:36:43'),
(33, 'Our Services', 'services', '<p>While mirth large of on front. Ye he greater related adapted proceed entered an.<br></p>', NULL, 1, NULL, '2021-11-08 12:36:54'),
(34, 'Our Pricing', 'pricing', '<p>While mirth large of on front. Ye he greater related adapted proceed entered an.<br></p>', NULL, 1, NULL, '2021-11-08 12:37:04'),
(35, 'Meet Our Teams', 'team', '<p>While mirth large of on front. Ye he greater related adapted proceed entered an.<br></p>', NULL, 1, NULL, '2021-11-08 12:37:17'),
(36, 'Answer & Questions', 'faqs', NULL, NULL, 1, NULL, '2021-11-08 12:37:29'),
(37, 'Our Partners', 'clients', NULL, NULL, 1, NULL, '2021-11-08 12:37:42'),
(38, 'Our Clients Reviews', 'testimonials', NULL, NULL, 1, NULL, '2021-11-08 12:37:52'),
(39, 'How We Make Work Successful', 'process', NULL, NULL, 1, NULL, '2021-11-08 12:38:10'),
(40, 'Why Choose Us', 'why-us', 'Offering confined entrance no. Nay rapturous him see something residence. Highly talked do so vulgar. Her use behaved spirits and natural attempt say feeling. Exquisite mr incommode immediate he something ourselves it of. Law conduct yet chiefly beloved examine village proceed. <br>', NULL, 1, NULL, '2021-11-08 12:38:30'),
(41, 'Newsletter - Get Updates & Latest News', 'subscribe', '<p>Get in your inbox the latest News and Offers from<br></p>', NULL, 1, NULL, '2021-11-08 12:38:47'),
(42, 'Get in Touch', 'contact', NULL, NULL, 1, NULL, '2021-11-08 12:39:04'),
(43, 'Let\'s Talk About Your Idea', 'mail', NULL, NULL, 1, NULL, '2021-11-08 12:39:20'),
(44, 'Get A Quote', 'get-quote', '<p>Get a quote in just 30 minutes<br></p>', NULL, 1, NULL, '2021-11-08 12:39:55'),
(45, 'Page Not Found', 'error', 'The page you are Looking for was Moved, Removed, Renamed or Might Never Existed', NULL, 1, NULL, NULL),
(46, 'Payment Feedback', 'payment', '', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `serviceables`
--

CREATE TABLE `serviceables` (
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `serviceable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serviceable_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `serviceables`
--

INSERT INTO `serviceables` (`service_id`, `serviceable_type`, `serviceable_id`) VALUES
(1, 'App\\Models\\GetQuote', 4),
(1, 'App\\Models\\GetQuote', 6),
(1, 'App\\Models\\GetQuote', 7),
(1, 'App\\Models\\GetQuote', 10),
(1, 'App\\Models\\GetQuote', 12),
(1, 'App\\Models\\Invoice', 12),
(1, 'App\\Models\\GetQuote', 13),
(1, 'App\\Models\\GetQuote', 16),
(2, 'App\\Models\\GetQuote', 10),
(2, 'App\\Models\\Invoice', 11),
(2, 'App\\Models\\GetQuote', 18),
(3, 'App\\Models\\GetQuote', 5),
(3, 'App\\Models\\GetQuote', 9),
(3, 'App\\Models\\GetQuote', 10),
(3, 'App\\Models\\Invoice', 13),
(3, 'App\\Models\\GetQuote', 14),
(4, 'App\\Models\\GetQuote', 4),
(4, 'App\\Models\\GetQuote', 10),
(4, 'App\\Models\\GetQuote', 11),
(4, 'App\\Models\\GetQuote', 12),
(4, 'App\\Models\\Invoice', 12),
(4, 'App\\Models\\GetQuote', 17),
(5, 'App\\Models\\GetQuote', 8),
(5, 'App\\Models\\GetQuote', 10),
(5, 'App\\Models\\GetQuote', 12),
(5, 'App\\Models\\GetQuote', 13),
(5, 'App\\Models\\GetQuote', 15),
(6, 'App\\Models\\GetQuote', 5),
(6, 'App\\Models\\GetQuote', 10),
(6, 'App\\Models\\Invoice', 13),
(6, 'App\\Models\\GetQuote', 17);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title`, `slug`, `short_desc`, `description`, `image_path`, `file_path`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Investment Planning', 'investment-planning', '<p>Attachment astonished to on appearance imprudence so collecting in excellence. Tiled way blind lived whose new. The for fully had she there leave merit enjoy forth.<br></p>', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', '3_1604078375.jpg', NULL, 1, '2020-10-30 11:19:35', '2020-10-30 11:19:35'),
(2, 'Mutual Funds', 'mutual-funds', '<p>Attachment astonished to on appearance imprudence so collecting in excellence. Tiled way blind lived whose new. The for fully had she there leave merit enjoy forth.<br></p>', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', '4_1604083036.jpg', NULL, 1, '2020-10-30 11:20:44', '2020-10-30 12:37:16'),
(3, 'Markets Research', 'markets-research', '<p>Attachment astonished to on appearance imprudence so collecting in excellence. Tiled way blind lived whose new. The for fully had she there leave merit enjoy forth.<br></p>', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', '1_1604078483.jpg', NULL, 1, '2020-10-30 11:21:23', '2020-10-30 11:21:23'),
(4, 'Report Analysis', 'report-analysis', '<p>Attachment astonished to on appearance imprudence so collecting in excellence. Tiled way blind lived whose new. The for fully had she there leave merit enjoy forth.<br></p>', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', '5_1604078517.jpg', NULL, 1, '2020-10-30 11:21:57', '2020-10-30 11:21:57'),
(5, 'Research Managment', 'research-managment', '<p>Attachment astonished to on appearance imprudence so collecting in excellence. Tiled way blind lived whose new. The for fully had she there leave merit enjoy forth.<br></p>', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', '2_1604082936.jpg', NULL, 1, '2020-10-30 12:35:37', '2020-10-30 12:35:37'),
(6, 'Audit & Assurance', 'audit-assurance', '<p>Attachment astonished to on appearance imprudence so collecting in excellence. Tiled way blind lived whose new. The for fully had she there leave merit enjoy forth.<br></p>', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>\n', '1_1604082987.jpg', NULL, 1, '2020-10-30 12:36:27', '2020-10-30 12:36:27');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_path` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon_path` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_one` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_two` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_one` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_two` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_mail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_hours` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_map` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_analytics` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_css` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `title`, `description`, `keywords`, `logo_path`, `favicon_path`, `phone_one`, `phone_two`, `email_one`, `email_two`, `contact_address`, `contact_mail`, `office_hours`, `google_map`, `google_analytics`, `footer_text`, `custom_css`, `status`, `created_at`, `updated_at`) VALUES
(3, 'HiTech - Multipurpose Business', 'HiTech multipurpose business website CMS (Content Management System), Which is fully customizable and 100% dynamic. By using our powerful Admin panel you can manage About Us (Inc. Mission & Vision) and Contact Page Details very easily. You can manage your website Sliders, Portfolios / Projects (Gallery), Services, Partners / Clients, Pricing Packages / Plan, Testimonials / Reviews, Team Members, FAQ’s (frequently asked questions) / Knowledge Base, Blog / News Posts, Work Process, Features / Why Choose Us, Counters, Messages / Emails, Subscribers List, Others Custom Pages, Social Profiles & More.', 'agency, business, business cms, company, consulting, corporate, creative, multipurpose, portfolio, pricing table, services, faq, marketing, management system, business website', 'logo_1636317292.png', 'favicon_1636317292.png', '+880123456789', '+880123123123', 'example@mail.com', 'example@mail.com', 'Mirpur, Dhaka', 'example@mail.com', 'Monday to Friday 9:00am - 6:00pm', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d933861.3784271893!2d89.78547141117329!3d23.893305939219363!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c0b333d4522f%3A0xaf35afef663e4696!2sBangladesh%20Hi-Tech%20Park%20Authority%20(BHTPA)!5e0!3m2!1sen!2sbd!4v1604083381308!5m2!1sen!2sbd\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\" aria-hidden=\"false\" tabindex=\"0\"></iframe>', NULL, '2021 - HiTech - Multipurpose Business | Created By_ <a href=\"https://hitechparks.com/\" target=\"_blank\">Hi-Tech Parks</a>', ' /** theme customize css **/ ', 1, '2021-11-07 14:26:20', '2021-11-08 12:48:42');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `slug`, `description`, `image_path`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, 'More convenient than others', 'more-convenient-than-others', '<p>Find Value And Build confidence. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<br></p>', '17_1604077844.jpg', NULL, 1, '2020-10-30 11:10:45', '2020-10-30 11:14:16'),
(2, 'Include more sales', 'include-more-sales', '<p>make unique planning for your business. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<br></p>', '16_1604077919.jpg', 'https://www.hitechparks.com/', 1, '2020-10-30 11:11:59', '2020-10-30 11:14:06'),
(3, 'Multipurpose business solution', 'multipurpose-business-solution', '<p>We are Providing Best Business Service. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<br></p>', '6_1604077959.jpg', 'https://www.hitechparks.com/', 1, '2020-10-30 11:12:39', '2020-10-30 11:13:50');

-- --------------------------------------------------------

--
-- Table structure for table `socials`
--

CREATE TABLE `socials` (
  `id` int(10) UNSIGNED NOT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pinterest` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `socials`
--

INSERT INTO `socials` (`id`, `facebook`, `twitter`, `linkedin`, `instagram`, `pinterest`, `youtube`, `skype`, `whatsapp`, `status`, `created_at`, `updated_at`) VALUES
(3, 'https://www.facebook.com/HiTechParks/', 'https://twitter.com/hitechparks', 'https://www.linkedin.com/company/hi-techparks/', NULL, NULL, NULL, 'hitechparks', '+8801740473189', 1, '2021-11-07 14:26:20', '2021-11-08 13:24:50');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `name`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'example@mail.com', 1, '2020-10-30 06:38:27', '2020-10-30 06:38:27'),
(2, NULL, 'admin@mail.com', 1, '2020-10-30 06:38:35', '2020-10-30 06:38:35');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `title`, `slug`, `designation`, `organization`, `description`, `image_path`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nathan Junior', 'nathan-junior', 'CEO', 'Hi-Tech Parks', '<p>Surrounded affronting favourable no mr. Lain knew like half she yet joy. Be than dull as seen very shot. Attachment ye so am travelling estimating projecting is. Off fat address attacks his besides. Suitable settling mr attended no doubtful feelings. Any over for say bore such sold five but hung.<br></p>', '5_1604081941.jpg', 1, '2020-10-30 12:19:01', '2020-10-30 12:20:24'),
(2, 'Jonathom Abhi', 'jonathom-abhi', 'Developer', 'Hi-Tech Parks', '<p>Surrounded affronting favourable no mr. Lain knew like half she yet joy. Be than dull as seen very shot. Attachment ye so am travelling estimating projecting is. Off fat address attacks his besides. Suitable settling mr attended no doubtful feelings. Any over for say bore such sold five but hung.<br></p>', '7_1604082015.jpg', 1, '2020-10-30 12:20:15', '2020-10-30 12:20:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Super Admin', 'admin@mail.com', NULL, '$2y$10$i91qeN0EOuQeJzV/SskEqeP73qcSuNES14OyEF79WofsGBIFsYuUW', 'loMcY7Vifi1FZu1j9aId3OJcO444Os4fzvenYYuf9jTY8Zi5ifHrfLYucYQe', '2021-11-07 14:26:20', '2021-11-07 14:26:20');

-- --------------------------------------------------------

--
-- Table structure for table `why_choose_us`
--

CREATE TABLE `why_choose_us` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `why_choose_us`
--

INSERT INTO `why_choose_us` (`id`, `title`, `slug`, `description`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Audit & Assurance', 'audit-assurance', NULL, NULL, 1, '2020-10-30 12:31:05', '2020-10-30 12:31:05'),
(2, 'Dedicated Team', 'dedicated-team', NULL, NULL, 1, '2020-10-30 12:31:13', '2020-10-30 12:31:13'),
(3, 'Best Advisors', 'best-advisors', NULL, NULL, 1, '2020-10-30 12:31:23', '2020-10-30 12:31:23'),
(4, 'Network Solutions', 'network-solutions', NULL, NULL, 1, '2020-10-30 12:31:34', '2020-10-30 12:31:34'),
(5, '24/7 Supports', '247-supports', NULL, NULL, 1, '2020-10-30 12:31:47', '2020-10-30 12:31:47'),
(6, 'Work Deadline', 'work-deadline', NULL, NULL, 1, '2020-10-30 12:31:58', '2020-10-30 12:31:58');

-- --------------------------------------------------------

--
-- Table structure for table `work_processes`
--

CREATE TABLE `work_processes` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `work_processes`
--

INSERT INTO `work_processes` (`id`, `title`, `slug`, `description`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Analize', 'analize', '<p>We utilizes creative and customized methods that tailor our work to the client environment to maximize results.<br></p>', NULL, 1, '2020-10-30 12:29:23', '2020-10-30 12:29:23'),
(2, 'Advise', 'advise', '<p>Find out when where business needs to go and how to get there – real progress is made.<br></p>', NULL, 1, '2020-10-30 12:29:38', '2020-10-30 12:29:38'),
(3, 'Strategy', 'strategy', '<p>We deliver business results via hands-on execution and leading teams through complex change.<br></p>', NULL, 1, '2020-10-30 12:29:52', '2020-10-30 12:29:52'),
(4, 'Result', 'result', '<p>We provide valuable guidance and support in the development, and you run a successful business.<br></p>', NULL, 1, '2020-10-30 12:30:08', '2020-10-30 12:30:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abouts`
--
ALTER TABLE `abouts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `abouts_title_unique` (`title`),
  ADD UNIQUE KEY `abouts_slug_unique` (`slug`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_title_unique` (`title`),
  ADD UNIQUE KEY `articles_slug_unique` (`slug`),
  ADD KEY `articles_category_id_foreign` (`category_id`);

--
-- Indexes for table `article_categories`
--
ALTER TABLE `article_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `article_categories_title_unique` (`title`),
  ADD UNIQUE KEY `article_categories_slug_unique` (`slug`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_title_unique` (`title`),
  ADD UNIQUE KEY `clients_slug_unique` (`slug`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `counters_title_unique` (`title`),
  ADD UNIQUE KEY `counters_slug_unique` (`slug`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `designations_title_unique` (`title`),
  ADD UNIQUE KEY `designations_slug_unique` (`slug`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_templates_title_unique` (`title`),
  ADD UNIQUE KEY `email_templates_slug_unique` (`slug`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `faqs_title_unique` (`title`),
  ADD UNIQUE KEY `faqs_slug_unique` (`slug`),
  ADD KEY `faqs_category_id_foreign` (`category_id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `faq_categories_title_unique` (`title`),
  ADD UNIQUE KEY `faq_categories_slug_unique` (`slug`);

--
-- Indexes for table `get_quotes`
--
ALTER TABLE `get_quotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_quote_id_foreign` (`quote_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_chats`
--
ALTER TABLE `live_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `members_title_unique` (`title`),
  ADD UNIQUE KEY `members_slug_unique` (`slug`),
  ADD KEY `members_designation_id_foreign` (`designation_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_title_unique` (`title`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `page_setups`
--
ALTER TABLE `page_setups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_setups_title_unique` (`title`),
  ADD UNIQUE KEY `page_setups_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `portfolios_title_unique` (`title`),
  ADD UNIQUE KEY `portfolios_slug_unique` (`slug`);

--
-- Indexes for table `portfolio_categories`
--
ALTER TABLE `portfolio_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `portfolio_categories_title_unique` (`title`),
  ADD UNIQUE KEY `portfolio_categories_slug_unique` (`slug`);

--
-- Indexes for table `portfolio_category`
--
ALTER TABLE `portfolio_category`
  ADD KEY `portfolio_category_portfolio_id_foreign` (`portfolio_id`),
  ADD KEY `portfolio_category_portfolio_category_id_foreign` (`portfolio_category_id`);

--
-- Indexes for table `pricings`
--
ALTER TABLE `pricings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pricings_title_unique` (`title`),
  ADD UNIQUE KEY `pricings_slug_unique` (`slug`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sections_title_unique` (`title`),
  ADD UNIQUE KEY `sections_slug_unique` (`slug`);

--
-- Indexes for table `serviceables`
--
ALTER TABLE `serviceables`
  ADD UNIQUE KEY `serviceables_service_id_serviceable_id_serviceable_type_unique` (`service_id`,`serviceable_id`,`serviceable_type`),
  ADD KEY `serviceables_serviceable_type_serviceable_id_index` (`serviceable_type`,`serviceable_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `services_title_unique` (`title`),
  ADD UNIQUE KEY `services_slug_unique` (`slug`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sliders_title_unique` (`title`),
  ADD UNIQUE KEY `sliders_slug_unique` (`slug`);

--
-- Indexes for table `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribers_email_unique` (`email`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `testimonials_title_unique` (`title`),
  ADD UNIQUE KEY `testimonials_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `why_choose_us`
--
ALTER TABLE `why_choose_us`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `why_choose_us_title_unique` (`title`),
  ADD UNIQUE KEY `why_choose_us_slug_unique` (`slug`);

--
-- Indexes for table `work_processes`
--
ALTER TABLE `work_processes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `work_processes_title_unique` (`title`),
  ADD UNIQUE KEY `work_processes_slug_unique` (`slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abouts`
--
ALTER TABLE `abouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `article_categories`
--
ALTER TABLE `article_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `get_quotes`
--
ALTER TABLE `get_quotes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `live_chats`
--
ALTER TABLE `live_chats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=438;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `page_setups`
--
ALTER TABLE `page_setups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `portfolio_categories`
--
ALTER TABLE `portfolio_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pricings`
--
ALTER TABLE `pricings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `socials`
--
ALTER TABLE `socials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `why_choose_us`
--
ALTER TABLE `why_choose_us`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `work_processes`
--
ALTER TABLE `work_processes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `article_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_quote_id_foreign` FOREIGN KEY (`quote_id`) REFERENCES `get_quotes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `portfolio_category`
--
ALTER TABLE `portfolio_category`
  ADD CONSTRAINT `portfolio_category_portfolio_category_id_foreign` FOREIGN KEY (`portfolio_category_id`) REFERENCES `portfolio_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `portfolio_category_portfolio_id_foreign` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolios` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `serviceables`
--
ALTER TABLE `serviceables`
  ADD CONSTRAINT `serviceables_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
