-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2024 at 10:41 PM
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
-- Database: `bagisto`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `address_type` varchar(191) NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `address1` varchar(191) NOT NULL,
  `address2` varchar(191) DEFAULT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `postcode` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `vat_id` varchar(191) DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'only for customer_addresses',
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `address_type`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address1`, `address2`, `city`, `state`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `additional`, `created_at`, `updated_at`) VALUES
(1, 'customer', 2, NULL, NULL, 'Isaac', 'Kyeremeh', NULL, 'Jay Clothing', 'Juba Ridge', '', 'Accra', 'Greater Accra', 'GH', '00233', NULL, '0559866650', NULL, 0, NULL, '2024-02-06 14:45:24', '2024-02-06 14:45:24'),
(2, 'cart_billing', 2, 1, NULL, 'Isaac', 'Kyeremeh', NULL, 'Jay Clothing', 'Juba Ridge', '', 'Accra', 'Greater Accra', 'GH', '00233', 'user@example.com', '0559866650', NULL, 0, NULL, '2024-02-06 14:45:30', '2024-02-06 14:45:30'),
(3, 'cart_shipping', 2, 1, NULL, 'Isaac', 'Kyeremeh', NULL, 'Jay Clothing', 'Juba Ridge', '', 'Accra', 'Greater Accra', 'GH', '00233', 'user@example.com', '0559866650', NULL, 0, NULL, '2024-02-06 14:45:30', '2024-02-06 14:45:30'),
(4, 'order_shipping', NULL, NULL, 1, 'Isaac', 'Kyeremeh', NULL, 'Jay Clothing', 'Juba Ridge', '', 'Accra', 'Greater Accra', 'GH', '00233', 'user@example.com', '0559866650', NULL, 0, NULL, '2024-02-06 14:46:35', '2024-02-06 14:46:35'),
(5, 'order_billing', NULL, NULL, 1, 'Isaac', 'Kyeremeh', NULL, 'Jay Clothing', 'Juba Ridge', '', 'Accra', 'Greater Accra', 'GH', '00233', 'user@example.com', '0559866650', NULL, 0, NULL, '2024-02-06 14:46:35', '2024-02-06 14:46:35');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) DEFAULT NULL,
  `api_token` varchar(80) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `role_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `api_token`, `status`, `role_id`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Example', 'admin@example.com', '$2y$10$DJEhdV4DneOl2nl9aZTeB.VOPpMMQBgXdhJ/qfBkSWU8xYiSwQtyi', 'VjTKzYTHi4GnrEX26SJ27gFt0wMvQ9EzdHWgjKhyvzpReDAzDewWYlTdVj0WNpNMjNMB5wCn9HLVPyb9', 1, 1, NULL, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `admin_name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `swatch_type` varchar(191) DEFAULT NULL,
  `validation` varchar(191) DEFAULT NULL,
  `regex` varchar(191) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `is_unique` tinyint(1) NOT NULL DEFAULT 0,
  `is_filterable` tinyint(1) NOT NULL DEFAULT 0,
  `is_comparable` tinyint(1) NOT NULL DEFAULT 0,
  `is_configurable` tinyint(1) NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT 0,
  `value_per_locale` tinyint(1) NOT NULL DEFAULT 0,
  `value_per_channel` tinyint(1) NOT NULL DEFAULT 0,
  `default_value` int(11) DEFAULT NULL,
  `enable_wysiwyg` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES
(1, 'sku', 'SKU', 'text', NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(2, 'name', 'Name', 'text', NULL, NULL, NULL, 3, 1, 0, 0, 1, 0, 0, 0, 1, 1, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(3, 'url_key', 'URL Key', 'text', NULL, NULL, NULL, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(4, 'tax_category_id', 'Tax Category', 'select', NULL, NULL, NULL, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(5, 'new', 'New', 'boolean', NULL, NULL, NULL, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(6, 'featured', 'Featured', 'boolean', NULL, NULL, NULL, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(7, 'visible_individually', 'Visible Individually', 'boolean', NULL, NULL, NULL, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(8, 'status', 'Status', 'boolean', NULL, NULL, NULL, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(9, 'short_description', 'Short Description', 'textarea', NULL, NULL, NULL, 11, 1, 0, 0, 0, 0, 0, 0, 1, 1, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(10, 'description', 'Description', 'textarea', NULL, NULL, NULL, 12, 1, 0, 0, 1, 0, 0, 0, 1, 1, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(11, 'price', 'Price', 'price', NULL, 'decimal', NULL, 13, 1, 0, 1, 1, 0, 0, 0, 0, 0, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(12, 'cost', 'Cost', 'price', NULL, 'decimal', NULL, 14, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(13, 'special_price', 'Special Price', 'price', NULL, 'decimal', NULL, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(14, 'special_price_from', 'Special Price From', 'date', NULL, NULL, NULL, 16, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(15, 'special_price_to', 'Special Price To', 'date', NULL, NULL, NULL, 17, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(16, 'meta_title', 'Meta Title', 'textarea', NULL, NULL, NULL, 18, 0, 0, 0, 0, 0, 0, 0, 1, 1, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(17, 'meta_keywords', 'Meta Keywords', 'textarea', NULL, NULL, NULL, 20, 0, 0, 0, 0, 0, 0, 0, 1, 1, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(18, 'meta_description', 'Meta Description', 'textarea', NULL, NULL, NULL, 21, 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(19, 'length', 'Length', 'text', NULL, 'decimal', NULL, 22, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(20, 'width', 'Width', 'text', NULL, 'decimal', NULL, 23, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(21, 'height', 'Height', 'text', NULL, 'decimal', NULL, 24, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(22, 'weight', 'Weight', 'text', NULL, 'decimal', NULL, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(23, 'color', 'Color', 'select', 'dropdown', NULL, NULL, 26, 1, 1, 1, 0, 1, 1, 0, 0, 0, NULL, 0, '2024-01-28 05:00:29', '2024-02-13 17:39:55'),
(24, 'size', 'Size', 'select', 'dropdown', NULL, NULL, 27, 0, 0, 1, 0, 1, 1, 0, 0, 0, NULL, 0, '2024-01-28 05:00:29', '2024-01-31 13:10:46'),
(25, 'brand', 'Brand', 'select', 'dropdown', NULL, NULL, 28, 0, 0, 1, 0, 0, 1, 1, 0, 0, NULL, 0, '2024-01-28 05:00:29', '2024-02-13 17:46:20'),
(26, 'guest_checkout', 'Guest Checkout', 'boolean', NULL, NULL, NULL, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(27, 'product_number', 'Product Number', 'text', NULL, NULL, NULL, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(28, 'manage_stock', 'Manage Stock', 'boolean', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2024-01-28 05:00:29', '2024-01-28 05:00:29');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_families`
--

CREATE TABLE `attribute_families` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_families`
--

INSERT INTO `attribute_families` (`id`, `code`, `name`, `status`, `is_user_defined`) VALUES
(1, 'default', 'Default', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_groups`
--

CREATE TABLE `attribute_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_family_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `column` int(11) NOT NULL DEFAULT 1,
  `position` int(11) NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_groups`
--

INSERT INTO `attribute_groups` (`id`, `attribute_family_id`, `name`, `column`, `position`, `is_user_defined`) VALUES
(1, 1, 'General', 1, 1, 0),
(2, 1, 'Description', 1, 2, 0),
(3, 1, 'Meta Description', 1, 3, 0),
(4, 1, 'Price', 2, 1, 0),
(5, 1, 'Shipping', 2, 2, 0),
(6, 1, 'Settings', 2, 3, 0),
(7, 1, 'Inventories', 2, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_group_mappings`
--

CREATE TABLE `attribute_group_mappings` (
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `attribute_group_id` int(10) UNSIGNED NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_group_mappings`
--

INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 1, 4),
(4, 1, 5),
(5, 6, 1),
(6, 6, 2),
(7, 6, 3),
(8, 6, 4),
(9, 2, 1),
(10, 2, 2),
(11, 4, 1),
(12, 4, 2),
(13, 4, 3),
(14, 4, 4),
(15, 4, 5),
(16, 3, 1),
(17, 3, 2),
(18, 3, 3),
(19, 5, 1),
(20, 5, 2),
(21, 5, 3),
(22, 5, 4),
(23, 1, 6),
(24, 1, 7),
(25, 1, 8),
(26, 6, 5),
(27, 1, 2),
(28, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_options`
--

CREATE TABLE `attribute_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `admin_name` varchar(191) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `swatch_value` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_options`
--

INSERT INTO `attribute_options` (`id`, `attribute_id`, `admin_name`, `sort_order`, `swatch_value`) VALUES
(1, 23, 'Red', 1, NULL),
(2, 23, 'Green', 2, NULL),
(3, 23, 'Yellow', 3, NULL),
(4, 23, 'Black', 4, NULL),
(5, 23, 'White', 5, NULL),
(6, 24, 'S', 1, NULL),
(7, 24, 'M', 2, NULL),
(8, 24, 'L', 3, NULL),
(9, 24, 'XL', 4, NULL),
(10, 25, 'BACKBONE', NULL, NULL),
(11, 23, 'Camo green', NULL, NULL),
(12, 23, 'Olive', NULL, NULL),
(13, 23, 'Camo Black', NULL, NULL),
(14, 23, 'Camo Desert', NULL, NULL),
(15, 23, 'Camo Snake Black', NULL, NULL),
(16, 23, 'Beige', NULL, NULL),
(17, 23, 'Cp', NULL, NULL),
(18, 23, '# 2Cp', NULL, NULL),
(19, 25, 'CARWORNIC', NULL, NULL),
(20, 24, '7', NULL, NULL),
(21, 24, '7.5', NULL, NULL),
(22, 24, '8', NULL, NULL),
(23, 24, '8.5', NULL, NULL),
(24, 24, '9', NULL, NULL),
(25, 24, '9.5', NULL, NULL),
(26, 24, '10', NULL, NULL),
(27, 24, '10.5', NULL, NULL),
(28, 24, '11', NULL, NULL),
(29, 24, '11.5', NULL, NULL),
(30, 25, 'IODSON', NULL, NULL),
(31, 25, 'RIELD', NULL, NULL),
(32, 23, 'Coyote', NULL, NULL),
(33, 23, 'Sand', NULL, NULL),
(34, 25, 'GLOCK', NULL, NULL),
(35, 23, 'pistol black', NULL, NULL),
(36, 25, 'Heckler & Koch', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_option_translations`
--

CREATE TABLE `attribute_option_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_option_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `label` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_option_translations`
--

INSERT INTO `attribute_option_translations` (`id`, `attribute_option_id`, `locale`, `label`) VALUES
(1, 1, 'en', 'Red'),
(2, 2, 'en', 'Green'),
(3, 3, 'en', 'Yellow'),
(4, 4, 'en', 'Black'),
(5, 5, 'en', 'White'),
(6, 6, 'en', 'S'),
(7, 7, 'en', 'M'),
(8, 8, 'en', 'L'),
(9, 9, 'en', 'XL'),
(10, 10, 'en', 'BACKBONE'),
(11, 10, 'fr', 'BACKBONE'),
(12, 10, 'nl', 'BACKBONE'),
(13, 10, 'tr', 'BACKBONE'),
(14, 10, 'es', 'BACKBONE'),
(15, 10, 'de', 'BACKBONE'),
(16, 10, 'it', 'BACKBONE'),
(17, 10, 'ru', 'BACKBONE'),
(18, 10, 'uk', 'BACKBONE'),
(19, 1, 'fr', ''),
(20, 1, 'nl', ''),
(21, 1, 'tr', ''),
(22, 1, 'es', ''),
(23, 1, 'de', ''),
(24, 1, 'it', ''),
(25, 1, 'ru', ''),
(26, 1, 'uk', ''),
(27, 2, 'fr', ''),
(28, 2, 'nl', ''),
(29, 2, 'tr', ''),
(30, 2, 'es', ''),
(31, 2, 'de', ''),
(32, 2, 'it', ''),
(33, 2, 'ru', ''),
(34, 2, 'uk', ''),
(35, 3, 'fr', ''),
(36, 3, 'nl', ''),
(37, 3, 'tr', ''),
(38, 3, 'es', ''),
(39, 3, 'de', ''),
(40, 3, 'it', ''),
(41, 3, 'ru', ''),
(42, 3, 'uk', ''),
(43, 4, 'fr', ''),
(44, 4, 'nl', ''),
(45, 4, 'tr', ''),
(46, 4, 'es', ''),
(47, 4, 'de', ''),
(48, 4, 'it', ''),
(49, 4, 'ru', ''),
(50, 4, 'uk', ''),
(51, 5, 'fr', ''),
(52, 5, 'nl', ''),
(53, 5, 'tr', ''),
(54, 5, 'es', ''),
(55, 5, 'de', ''),
(56, 5, 'it', ''),
(57, 5, 'ru', ''),
(58, 5, 'uk', ''),
(59, 11, 'en', 'Camo green'),
(60, 11, 'fr', ''),
(61, 11, 'nl', ''),
(62, 11, 'tr', ''),
(63, 11, 'es', ''),
(64, 11, 'de', ''),
(65, 11, 'it', ''),
(66, 11, 'ru', ''),
(67, 11, 'uk', ''),
(68, 12, 'en', 'Olive'),
(69, 12, 'fr', 'Olive'),
(70, 12, 'nl', 'Olive'),
(71, 12, 'tr', 'Olive'),
(72, 12, 'es', 'Olive'),
(73, 12, 'de', 'Olive'),
(74, 12, 'it', 'Olive'),
(75, 12, 'ru', 'Olive'),
(76, 12, 'uk', 'Olive'),
(77, 13, 'en', 'Camo Black'),
(78, 13, 'fr', ''),
(79, 13, 'nl', ''),
(80, 13, 'tr', ''),
(81, 13, 'es', ''),
(82, 13, 'de', ''),
(83, 13, 'it', ''),
(84, 13, 'ru', ''),
(85, 13, 'uk', ''),
(86, 14, 'en', 'Camo Desert'),
(87, 14, 'fr', ''),
(88, 14, 'nl', ''),
(89, 14, 'tr', ''),
(90, 14, 'es', ''),
(91, 14, 'de', ''),
(92, 14, 'it', ''),
(93, 14, 'ru', ''),
(94, 14, 'uk', ''),
(95, 15, 'en', 'Camo Snake Black'),
(96, 15, 'fr', ''),
(97, 15, 'nl', ''),
(98, 15, 'tr', ''),
(99, 15, 'es', ''),
(100, 15, 'de', ''),
(101, 15, 'it', ''),
(102, 15, 'ru', ''),
(103, 15, 'uk', ''),
(104, 16, 'en', 'Beige'),
(105, 16, 'fr', ''),
(106, 16, 'nl', ''),
(107, 16, 'tr', ''),
(108, 16, 'es', ''),
(109, 16, 'de', ''),
(110, 16, 'it', ''),
(111, 16, 'ru', ''),
(112, 16, 'uk', ''),
(113, 17, 'en', 'Cp'),
(114, 17, 'fr', ''),
(115, 17, 'nl', ''),
(116, 17, 'tr', ''),
(117, 17, 'es', ''),
(118, 17, 'de', ''),
(119, 17, 'it', ''),
(120, 17, 'ru', ''),
(121, 17, 'uk', ''),
(122, 18, 'en', '# 2Cp'),
(123, 18, 'fr', ''),
(124, 18, 'nl', ''),
(125, 18, 'tr', ''),
(126, 18, 'es', ''),
(127, 18, 'de', ''),
(128, 18, 'it', ''),
(129, 18, 'ru', ''),
(130, 18, 'uk', ''),
(131, 19, 'en', 'CARWORNIC'),
(132, 19, 'fr', 'CARWORNIC'),
(133, 19, 'nl', 'CARWORNIC'),
(134, 19, 'tr', 'CARWORNIC'),
(135, 19, 'es', 'CARWORNIC'),
(136, 19, 'de', 'CARWORNIC'),
(137, 19, 'it', 'CARWORNIC'),
(138, 19, 'ru', 'CARWORNIC'),
(139, 19, 'uk', 'CARWORNIC'),
(140, 6, 'fr', ''),
(141, 6, 'nl', ''),
(142, 6, 'tr', ''),
(143, 6, 'es', ''),
(144, 6, 'de', ''),
(145, 6, 'it', ''),
(146, 6, 'ru', ''),
(147, 6, 'uk', ''),
(148, 7, 'fr', ''),
(149, 7, 'nl', ''),
(150, 7, 'tr', ''),
(151, 7, 'es', ''),
(152, 7, 'de', ''),
(153, 7, 'it', ''),
(154, 7, 'ru', ''),
(155, 7, 'uk', ''),
(156, 8, 'fr', ''),
(157, 8, 'nl', ''),
(158, 8, 'tr', ''),
(159, 8, 'es', ''),
(160, 8, 'de', ''),
(161, 8, 'it', ''),
(162, 8, 'ru', ''),
(163, 8, 'uk', ''),
(164, 9, 'fr', ''),
(165, 9, 'nl', ''),
(166, 9, 'tr', ''),
(167, 9, 'es', ''),
(168, 9, 'de', ''),
(169, 9, 'it', ''),
(170, 9, 'ru', ''),
(171, 9, 'uk', ''),
(172, 20, 'en', '7'),
(173, 20, 'fr', ''),
(174, 20, 'nl', ''),
(175, 20, 'tr', ''),
(176, 20, 'es', ''),
(177, 20, 'de', ''),
(178, 20, 'it', ''),
(179, 20, 'ru', ''),
(180, 20, 'uk', ''),
(181, 21, 'en', '7.5'),
(182, 21, 'fr', ''),
(183, 21, 'nl', ''),
(184, 21, 'tr', ''),
(185, 21, 'es', ''),
(186, 21, 'de', ''),
(187, 21, 'it', ''),
(188, 21, 'ru', ''),
(189, 21, 'uk', ''),
(190, 22, 'en', '8'),
(191, 22, 'fr', ''),
(192, 22, 'nl', ''),
(193, 22, 'tr', ''),
(194, 22, 'es', ''),
(195, 22, 'de', ''),
(196, 22, 'it', ''),
(197, 22, 'ru', ''),
(198, 22, 'uk', ''),
(199, 23, 'en', '8.5'),
(200, 23, 'fr', ''),
(201, 23, 'nl', ''),
(202, 23, 'tr', ''),
(203, 23, 'es', ''),
(204, 23, 'de', ''),
(205, 23, 'it', ''),
(206, 23, 'ru', ''),
(207, 23, 'uk', ''),
(208, 24, 'en', '9'),
(209, 24, 'fr', ''),
(210, 24, 'nl', ''),
(211, 24, 'tr', ''),
(212, 24, 'es', ''),
(213, 24, 'de', ''),
(214, 24, 'it', ''),
(215, 24, 'ru', ''),
(216, 24, 'uk', ''),
(217, 25, 'en', '9.5'),
(218, 25, 'fr', ''),
(219, 25, 'nl', ''),
(220, 25, 'tr', ''),
(221, 25, 'es', ''),
(222, 25, 'de', ''),
(223, 25, 'it', ''),
(224, 25, 'ru', ''),
(225, 25, 'uk', ''),
(226, 26, 'en', '10'),
(227, 26, 'fr', ''),
(228, 26, 'nl', ''),
(229, 26, 'tr', ''),
(230, 26, 'es', ''),
(231, 26, 'de', ''),
(232, 26, 'it', ''),
(233, 26, 'ru', ''),
(234, 26, 'uk', ''),
(235, 27, 'en', '10.5'),
(236, 27, 'fr', ''),
(237, 27, 'nl', ''),
(238, 27, 'tr', ''),
(239, 27, 'es', ''),
(240, 27, 'de', ''),
(241, 27, 'it', ''),
(242, 27, 'ru', ''),
(243, 27, 'uk', ''),
(244, 28, 'en', '11'),
(245, 28, 'fr', ''),
(246, 28, 'nl', ''),
(247, 28, 'tr', ''),
(248, 28, 'es', ''),
(249, 28, 'de', ''),
(250, 28, 'it', ''),
(251, 28, 'ru', ''),
(252, 28, 'uk', ''),
(253, 29, 'en', '11.5'),
(254, 29, 'fr', ''),
(255, 29, 'nl', ''),
(256, 29, 'tr', ''),
(257, 29, 'es', ''),
(258, 29, 'de', ''),
(259, 29, 'it', ''),
(260, 29, 'ru', ''),
(261, 29, 'uk', ''),
(262, 30, 'en', 'IODSON'),
(263, 30, 'fr', ''),
(264, 30, 'nl', ''),
(265, 30, 'tr', ''),
(266, 30, 'es', ''),
(267, 30, 'de', ''),
(268, 30, 'it', ''),
(269, 30, 'ru', ''),
(270, 30, 'uk', ''),
(271, 31, 'en', 'RIELD'),
(272, 31, 'fr', 'RIELD'),
(273, 31, 'nl', 'RIELD'),
(274, 31, 'tr', 'RIELD'),
(275, 31, 'es', 'RIELD'),
(276, 31, 'de', 'RIELD'),
(277, 31, 'it', 'RIELD'),
(278, 31, 'ru', 'RIELD'),
(279, 31, 'uk', 'RIELD'),
(280, 32, 'en', 'Coyote'),
(281, 32, 'fr', 'Coyote'),
(282, 32, 'nl', 'Coyote'),
(283, 32, 'tr', 'Coyote'),
(284, 32, 'es', 'Coyote'),
(285, 32, 'de', 'Coyote'),
(286, 32, 'it', 'Coyote'),
(287, 32, 'ru', 'Coyote'),
(288, 32, 'uk', 'Coyote'),
(289, 33, 'en', 'Sand'),
(290, 33, 'fr', 'Sand'),
(291, 33, 'nl', 'Sand'),
(292, 33, 'tr', 'Sand'),
(293, 33, 'es', 'Sand'),
(294, 33, 'de', 'Sand'),
(295, 33, 'it', 'Sand'),
(296, 33, 'ru', 'Sand'),
(297, 33, 'uk', 'Sand'),
(298, 34, 'en', 'GLOCK'),
(299, 34, 'fr', 'GLOCK'),
(300, 34, 'nl', 'GLOCK'),
(301, 34, 'tr', 'GLOCK'),
(302, 34, 'es', 'GLOCK'),
(303, 34, 'de', 'GLOCK'),
(304, 34, 'it', 'GLOCK'),
(305, 34, 'ru', 'GLOCK'),
(306, 34, 'uk', 'GLOCK'),
(307, 35, 'en', 'pistol black'),
(308, 35, 'fr', ''),
(309, 35, 'nl', ''),
(310, 35, 'tr', ''),
(311, 35, 'es', ''),
(312, 35, 'de', ''),
(313, 35, 'it', ''),
(314, 35, 'ru', ''),
(315, 35, 'uk', ''),
(316, 36, 'en', 'Heckler & Koch'),
(317, 36, 'fr', 'Heckler & Koch'),
(318, 36, 'nl', 'Heckler & Koch'),
(319, 36, 'tr', 'Heckler & Koch'),
(320, 36, 'es', 'Heckler & Koch'),
(321, 36, 'de', 'Heckler & Koch'),
(322, 36, 'it', 'Heckler & Koch'),
(323, 36, 'ru', 'Heckler & Koch'),
(324, 36, 'uk', 'Heckler & Koch');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_translations`
--

CREATE TABLE `attribute_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_translations`
--

INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES
(1, 1, 'en', 'SKU'),
(2, 2, 'en', 'Name'),
(3, 3, 'en', 'URL Key'),
(4, 4, 'en', 'Tax Category'),
(5, 5, 'en', 'New'),
(6, 6, 'en', 'Featured'),
(7, 7, 'en', 'Visible Individually'),
(8, 8, 'en', 'Status'),
(9, 9, 'en', 'Short Description'),
(10, 10, 'en', 'Description'),
(11, 11, 'en', 'Price'),
(12, 12, 'en', 'Cost'),
(13, 13, 'en', 'Special Price'),
(14, 14, 'en', 'Special Price From'),
(15, 15, 'en', 'Special Price To'),
(16, 16, 'en', 'Meta Description'),
(17, 17, 'en', 'Meta Keywords'),
(18, 18, 'en', 'Meta Description'),
(19, 19, 'en', 'Width'),
(20, 20, 'en', 'Height'),
(21, 21, 'en', 'Depth'),
(22, 22, 'en', 'Weight'),
(23, 23, 'en', 'Color'),
(24, 24, 'en', 'Size'),
(25, 25, 'en', 'Brand'),
(26, 26, 'en', 'Allow Guest Checkout'),
(27, 27, 'en', 'Product Number'),
(28, 25, 'fr', ''),
(29, 25, 'nl', ''),
(30, 25, 'tr', ''),
(31, 25, 'es', ''),
(32, 25, 'de', ''),
(33, 25, 'it', ''),
(34, 25, 'ru', ''),
(35, 25, 'uk', ''),
(36, 23, 'fr', ''),
(37, 23, 'nl', ''),
(38, 23, 'tr', ''),
(39, 23, 'es', ''),
(40, 23, 'de', ''),
(41, 23, 'it', ''),
(42, 23, 'ru', ''),
(43, 23, 'uk', ''),
(44, 24, 'fr', ''),
(45, 24, 'nl', ''),
(46, 24, 'tr', ''),
(47, 24, 'es', ''),
(48, 24, 'de', ''),
(49, 24, 'it', ''),
(50, 24, 'ru', ''),
(51, 24, 'uk', '');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_email` varchar(191) DEFAULT NULL,
  `customer_first_name` varchar(191) DEFAULT NULL,
  `customer_last_name` varchar(191) DEFAULT NULL,
  `shipping_method` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT 0,
  `items_count` int(11) DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(191) DEFAULT NULL,
  `base_currency_code` varchar(191) DEFAULT NULL,
  `channel_currency_code` varchar(191) DEFAULT NULL,
  `cart_currency_code` varchar(191) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `tax_total` decimal(12,4) DEFAULT 0.0000,
  `base_tax_total` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `checkout_method` varchar(191) DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `applied_cart_rule_ids` varchar(191) DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 'user@example.com', 'Isaac', 'Kyeremeh', 'flatrate_flatrate', NULL, 0, 2, 2.0000, NULL, 'GHS', 'GHS', 'GHS', 'GHS', 1278.0000, 1278.0000, 1258.0000, 1258.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 2, 1, '2024-02-06 14:32:54', '2024-02-06 14:46:45'),
(2, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'GHS', 'GHS', 'GHS', 'GHS', 425.0000, 425.0000, 425.0000, 425.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2024-02-07 02:33:10', '2024-02-07 05:06:48');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sku` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_weight` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `price` decimal(12,4) NOT NULL DEFAULT 1.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `custom_price` decimal(12,4) DEFAULT NULL,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_percent` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `cart_id` int(10) UNSIGNED NOT NULL,
  `tax_category_id` int(10) UNSIGNED DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES
(1, 1, '01', 'simple', 'BACKBONE Mens Army Military Battle Dress Uniform BDU Shirt Camo Top Jacket', NULL, 1.3200, 1.3200, 1.3200, 670.0000, 670.0000, NULL, 670.0000, 670.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, '{\"quantity\":1,\"product_id\":1}', '2024-02-06 14:32:54', '2024-02-06 14:46:34'),
(2, 1, '04', 'simple', 'IODSON Men\'s Military Tactical Boots with Side Zipper, Puncture Resistant Work Boots, Army Jungle Boots', NULL, 2.2000, 2.2000, 2.2000, 588.0000, 588.0000, NULL, 588.0000, 588.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 4, 1, NULL, NULL, '{\"quantity\":1,\"product_id\":4}', '2024-02-06 14:32:59', '2024-02-06 14:46:34'),
(3, 1, '03', 'simple', 'CARWORNIC Men\'s Tactical Combat Shirt, 1/4 Zipper Long Sleeve Camo Army Military T Shirt 2#Cp', NULL, 1.3200, 1.3200, 1.3200, 425.0000, 425.0000, NULL, 425.0000, 425.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 3, 2, NULL, NULL, '{\"product_id\":\"3\",\"is_buy_now\":\"0\",\"quantity\":1,\"rating\":\"0\"}', '2024-02-07 02:33:10', '2024-02-07 05:06:48');

-- --------------------------------------------------------

--
-- Table structure for table `cart_item_inventories`
--

CREATE TABLE `cart_item_inventories` (
  `id` int(10) UNSIGNED NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `inventory_source_id` int(10) UNSIGNED DEFAULT NULL,
  `cart_item_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_payment`
--

CREATE TABLE `cart_payment` (
  `id` int(10) UNSIGNED NOT NULL,
  `method` varchar(191) NOT NULL,
  `method_title` varchar(191) DEFAULT NULL,
  `cart_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cart_payment`
--

INSERT INTO `cart_payment` (`id`, `method`, `method_title`, `cart_id`, `created_at`, `updated_at`) VALUES
(5, 'moneytransfer', 'Money Transfer', 1, '2024-02-06 14:46:31', '2024-02-06 14:46:31');

-- --------------------------------------------------------

--
-- Table structure for table `cart_rules`
--

CREATE TABLE `cart_rules` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `coupon_type` int(11) NOT NULL DEFAULT 1,
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT 0,
  `usage_per_customer` int(11) NOT NULL DEFAULT 0,
  `uses_per_coupon` int(11) NOT NULL DEFAULT 0,
  `times_used` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `condition_type` tinyint(1) NOT NULL DEFAULT 1,
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `end_other_rules` tinyint(1) NOT NULL DEFAULT 0,
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT 0,
  `action_type` varchar(191) DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `discount_quantity` int(11) NOT NULL DEFAULT 1,
  `discount_step` varchar(191) NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_channels`
--

CREATE TABLE `cart_rule_channels` (
  `cart_rule_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_coupons`
--

CREATE TABLE `cart_rule_coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) DEFAULT NULL,
  `usage_limit` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `usage_per_customer` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `times_used` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `expired_at` date DEFAULT NULL,
  `cart_rule_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_coupon_usage`
--

CREATE TABLE `cart_rule_coupon_usage` (
  `id` int(10) UNSIGNED NOT NULL,
  `times_used` int(11) NOT NULL DEFAULT 0,
  `cart_rule_coupon_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_customers`
--

CREATE TABLE `cart_rule_customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `times_used` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `cart_rule_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_customer_groups`
--

CREATE TABLE `cart_rule_customer_groups` (
  `cart_rule_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_translations`
--

CREATE TABLE `cart_rule_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `label` text DEFAULT NULL,
  `cart_rule_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_shipping_rates`
--

CREATE TABLE `cart_shipping_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `carrier` varchar(191) NOT NULL,
  `carrier_title` varchar(191) NOT NULL,
  `method` varchar(191) NOT NULL,
  `method_title` varchar(191) NOT NULL,
  `method_description` varchar(191) DEFAULT NULL,
  `price` double DEFAULT 0,
  `base_price` double DEFAULT 0,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `is_calculate_tax` tinyint(1) NOT NULL DEFAULT 1,
  `cart_address_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cart_shipping_rates`
--

INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`) VALUES
(15, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 20, 20, 0.0000, 0.0000, 1, 3, '2024-02-06 14:46:27', '2024-02-06 14:46:27'),
(16, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 1, 3, '2024-02-06 14:46:27', '2024-02-06 14:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rules`
--

CREATE TABLE `catalog_rules` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `starts_from` date DEFAULT NULL,
  `ends_till` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `condition_type` tinyint(1) NOT NULL DEFAULT 1,
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `end_other_rules` tinyint(1) NOT NULL DEFAULT 0,
  `action_type` varchar(191) DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rule_channels`
--

CREATE TABLE `catalog_rule_channels` (
  `catalog_rule_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rule_customer_groups`
--

CREATE TABLE `catalog_rule_customer_groups` (
  `catalog_rule_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rule_products`
--

CREATE TABLE `catalog_rule_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT 0,
  `action_type` varchar(191) DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED NOT NULL,
  `catalog_rule_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rule_product_prices`
--

CREATE TABLE `catalog_rule_product_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `rule_date` date NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED NOT NULL,
  `catalog_rule_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `logo_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `display_mode` varchar(191) DEFAULT 'products_and_description',
  `_lft` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `_rgt` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `banner_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `position`, `logo_path`, `status`, `display_mode`, `_lft`, `_rgt`, `parent_id`, `additional`, `banner_path`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, 'products_and_description', 1, 56, NULL, NULL, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(7, 2, 'category/7/a0zvKLmEZATlGyaVf19VV6QdoDoegnKg0BYSvZNd.webp', 1, 'products_and_description', 14, 25, 1, NULL, NULL, '2024-01-30 04:32:33', '2024-02-09 17:21:41'),
(8, 0, NULL, 1, 'products_and_description', 15, 16, 7, NULL, NULL, '2024-01-30 04:44:28', '2024-02-09 17:21:41'),
(9, 0, NULL, 1, 'products_and_description', 17, 18, 7, NULL, NULL, '2024-01-30 04:47:23', '2024-02-09 17:21:41'),
(10, 0, NULL, 1, 'products_and_description', 19, 20, 7, NULL, NULL, '2024-01-30 04:49:24', '2024-02-09 17:21:41'),
(11, 0, NULL, 1, 'products_and_description', 21, 22, 7, NULL, NULL, '2024-01-30 04:50:44', '2024-02-09 17:21:41'),
(12, 0, NULL, 1, 'products_and_description', 23, 24, 7, NULL, NULL, '2024-01-30 04:53:21', '2024-02-09 17:21:41'),
(13, 3, 'category/13/7IETTWmfEsPyJ1xfb7D3eXICgtaFn06vXQuMFz4W.webp', 1, 'products_and_description', 26, 35, 1, NULL, NULL, '2024-01-30 04:57:32', '2024-02-08 18:22:34'),
(14, 0, NULL, 1, 'products_and_description', 27, 28, 13, NULL, NULL, '2024-01-30 04:58:43', '2024-02-08 18:22:35'),
(15, 0, NULL, 1, 'products_and_description', 29, 30, 13, NULL, NULL, '2024-01-30 05:00:34', '2024-02-08 18:22:35'),
(16, 0, NULL, 1, 'products_and_description', 31, 32, 13, NULL, NULL, '2024-01-30 05:03:48', '2024-02-08 18:22:35'),
(17, 0, NULL, 1, 'products_and_description', 33, 34, 13, NULL, NULL, '2024-01-30 05:06:40', '2024-02-08 18:22:35'),
(18, 4, 'category/18/wDfePdfEDqJoolFpfoZyOohUg40PufW3KLquJxVS.webp', 1, 'products_and_description', 36, 43, 1, NULL, NULL, '2024-01-30 05:14:18', '2024-02-13 16:56:55'),
(19, 0, NULL, 1, 'products_and_description', 37, 38, 18, NULL, NULL, '2024-01-30 05:16:15', '2024-02-13 16:56:55'),
(20, 0, NULL, 1, 'products_and_description', 39, 40, 18, NULL, NULL, '2024-01-30 05:19:07', '2024-02-13 16:56:55'),
(21, 0, NULL, 1, 'products_and_description', 41, 42, 18, NULL, NULL, '2024-01-30 05:28:14', '2024-02-13 16:56:55'),
(24, 5, NULL, 1, 'products_and_description', 44, 55, 1, NULL, NULL, '2024-01-30 05:46:19', '2024-01-30 05:46:19'),
(25, 0, NULL, 1, 'products_and_description', 45, 46, 24, NULL, NULL, '2024-01-30 05:53:11', '2024-01-30 05:53:11'),
(26, 0, NULL, 1, 'products_and_description', 47, 48, 24, NULL, NULL, '2024-01-30 06:00:01', '2024-01-30 06:00:01'),
(27, 0, NULL, 1, 'products_and_description', 49, 50, 24, NULL, NULL, '2024-01-30 06:02:28', '2024-01-30 06:02:28'),
(28, 0, NULL, 1, 'products_and_description', 51, 52, 24, NULL, NULL, '2024-01-30 06:03:43', '2024-01-30 06:03:43'),
(29, 0, NULL, 1, 'products_and_description', 53, 54, 24, NULL, NULL, '2024-01-30 06:05:27', '2024-01-30 06:05:27');

-- --------------------------------------------------------

--
-- Table structure for table `category_filterable_attributes`
--

CREATE TABLE `category_filterable_attributes` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `category_filterable_attributes`
--

INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES
(7, 11),
(7, 23),
(7, 24),
(7, 25),
(8, 11),
(8, 23),
(8, 24),
(8, 25),
(9, 11),
(9, 23),
(9, 24),
(9, 25),
(10, 11),
(10, 23),
(10, 24),
(10, 25),
(11, 11),
(11, 23),
(11, 24),
(11, 25),
(12, 11),
(12, 23),
(12, 24),
(12, 25),
(13, 11),
(13, 23),
(13, 24),
(13, 25),
(14, 11),
(14, 23),
(14, 24),
(14, 25),
(15, 11),
(15, 23),
(15, 24),
(15, 25),
(16, 11),
(16, 23),
(16, 24),
(16, 25),
(17, 11),
(17, 23),
(17, 24),
(17, 25),
(18, 11),
(18, 23),
(18, 24),
(18, 25),
(19, 11),
(19, 23),
(19, 24),
(19, 25),
(20, 11),
(20, 23),
(20, 24),
(20, 25),
(21, 11),
(21, 23),
(21, 24),
(21, 25),
(24, 11),
(24, 23),
(24, 24),
(24, 25),
(25, 11),
(25, 23),
(25, 24),
(25, 25),
(26, 11),
(26, 23),
(26, 24),
(26, 25),
(27, 11),
(27, 23),
(27, 24),
(27, 25),
(28, 11),
(28, 23),
(28, 24),
(28, 25),
(29, 11),
(29, 23),
(29, 24),
(29, 25);

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `slug` varchar(191) NOT NULL,
  `url_path` varchar(2048) NOT NULL,
  `description` text DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `locale_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `category_id`, `name`, `slug`, `url_path`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `locale_id`, `locale`) VALUES
(1, 1, 'Root', 'root', '', 'Root', '', '', '', NULL, 'en'),
(2, 1, 'Raíz', 'root', '', 'Raíz', '', '', '', NULL, 'es'),
(3, 1, 'Racine', 'root', '', 'Racine', '', '', '', NULL, 'fr'),
(4, 1, 'Hoofdcategorie', 'root', '', 'Hoofdcategorie', '', '', '', NULL, 'nl'),
(5, 1, 'Kök', 'root', '', 'Kök', '', '', '', NULL, 'tr'),
(51, 7, 'Apparel', 'apparel', 'apparel', '<p>Uniforms,&nbsp;Tactical clothing,&nbsp;Outerwear (jackets, coats),&nbsp;Boots and footwear,&nbsp;Headgear (hats, helmets)</p>', 'Apparel', '', '', 1, 'en'),
(52, 7, 'Apparel', 'apparel', 'apparel', '<p>Uniforms,&nbsp;Tactical clothing,&nbsp;Outerwear (jackets, coats),&nbsp;Boots and footwear,&nbsp;Headgear (hats, helmets)</p>', 'Apparel', '', '', 3, 'nl'),
(53, 7, 'Apparel', 'apparel', 'apparel', '<p>Uniforms,&nbsp;Tactical clothing,&nbsp;Outerwear (jackets, coats),&nbsp;Boots and footwear,&nbsp;Headgear (hats, helmets)</p>', 'Apparel', '', '', 5, 'es'),
(54, 7, 'Apparel', 'apparel', 'apparel', '<p>Uniforms,&nbsp;Tactical clothing,&nbsp;Outerwear (jackets, coats),&nbsp;Boots and footwear,&nbsp;Headgear (hats, helmets)</p>', 'Apparel', '', '', 2, 'fr'),
(55, 7, 'Apparel', 'apparel', 'apparel', '<p>Uniforms,&nbsp;Tactical clothing,&nbsp;Outerwear (jackets, coats),&nbsp;Boots and footwear,&nbsp;Headgear (hats, helmets)</p>', 'Apparel', '', '', 6, 'de'),
(56, 7, 'Apparel', 'apparel', 'apparel', '<p>Uniforms,&nbsp;Tactical clothing,&nbsp;Outerwear (jackets, coats),&nbsp;Boots and footwear,&nbsp;Headgear (hats, helmets)</p>', 'Apparel', '', '', 7, 'it'),
(57, 7, 'Apparel', 'apparel', 'apparel', '<p>Uniforms,&nbsp;Tactical clothing,&nbsp;Outerwear (jackets, coats),&nbsp;Boots and footwear,&nbsp;Headgear (hats, helmets)</p>', 'Apparel', '', '', 8, 'ru'),
(58, 7, 'Apparel', 'apparel', 'apparel', '<p>Uniforms,&nbsp;Tactical clothing,&nbsp;Outerwear (jackets, coats),&nbsp;Boots and footwear,&nbsp;Headgear (hats, helmets)</p>', 'Apparel', '', '', 4, 'tr'),
(59, 7, 'Apparel', 'apparel', 'apparel', '<p>Uniforms,&nbsp;Tactical clothing,&nbsp;Outerwear (jackets, coats),&nbsp;Boots and footwear,&nbsp;Headgear (hats, helmets)</p>', 'Apparel', '', '', 9, 'uk'),
(60, 8, 'Uniforms', 'uniforms', 'apparel/uniforms', '<p>Uniforms</p>', '', '', 'uniform', 1, 'en'),
(61, 8, 'Uniforms', 'uniforms', 'apparel/uniforms', '<p>Uniforms</p>', '', '', '', 3, 'nl'),
(62, 8, 'Uniforms', 'uniforms', 'apparel/uniforms', '<p>Uniforms</p>', '', '', '', 5, 'es'),
(63, 8, 'Uniforms', 'uniforms', 'apparel/uniforms', '<p>Uniforms</p>', '', '', '', 2, 'fr'),
(64, 8, 'Uniforms', 'uniforms', 'apparel/uniforms', '<p>Uniforms</p>', '', '', '', 6, 'de'),
(65, 8, 'Uniforms', 'uniforms', 'apparel/uniforms', '<p>Uniforms</p>', '', '', '', 7, 'it'),
(66, 8, 'Uniforms', 'uniforms', 'apparel/uniforms', '<p>Uniforms</p>', '', '', '', 8, 'ru'),
(67, 8, 'Uniforms', 'uniforms', 'apparel/uniforms', '<p>Uniforms</p>', '', '', '', 4, 'tr'),
(68, 8, 'Uniforms', 'uniforms', 'apparel/uniforms', '<p>Uniforms</p>', '', '', '', 9, 'uk'),
(69, 9, 'Outwears', 'outwears', 'apparel/outwears', '<p>Outwears</p>', 'Outwears', '', 'Outwears', 1, 'en'),
(70, 9, 'Outwears', 'outwears', 'apparel/outwears', '<p>Outwears</p>', 'Outwears', '', 'Outwears', 3, 'nl'),
(71, 9, 'Outwears', 'outwears', 'apparel/outwears', '<p>Outwears</p>', 'Outwears', '', 'Outwears', 5, 'es'),
(72, 9, 'Outwears', 'outwears', 'apparel/outwears', '<p>Outwears</p>', 'Outwears', '', 'Outwears', 2, 'fr'),
(73, 9, 'Outwears', 'outwears', 'apparel/outwears', '<p>Outwears</p>', 'Outwears', '', 'Outwears', 6, 'de'),
(74, 9, 'Outwears', 'outwears', 'apparel/outwears', '<p>Outwears</p>', 'Outwears', '', 'Outwears', 7, 'it'),
(75, 9, 'Outwears', 'outwears', 'apparel/outwears', '<p>Outwears</p>', 'Outwears', '', 'Outwears', 8, 'ru'),
(76, 9, 'Outwears', 'outwears', 'apparel/outwears', '<p>Outwears</p>', 'Outwears', '', 'Outwears', 4, 'tr'),
(77, 9, 'Outwears', 'outwears', 'apparel/outwears', '<p>Outwears</p>', 'Outwears', '', 'Outwears', 9, 'uk'),
(78, 10, 'Tactical Clothing', 'tactical-clothing', 'apparel/tactical-clothing', '<p><span>Tactical clothing</span></p>', 'Tactical Clothing', '', 'Tactical clothing', 1, 'en'),
(79, 10, 'Tactical clothing', 'tactical-clothing', 'apparel/tactical-clothing', '<p><span>Tactical clothing</span></p>', 'Tactical clothing', '', 'Tactical clothing', 3, 'nl'),
(80, 10, 'Tactical clothing', 'tactical-clothing', 'apparel/tactical-clothing', '<p><span>Tactical clothing</span></p>', 'Tactical clothing', '', 'Tactical clothing', 5, 'es'),
(81, 10, 'Tactical clothing', 'tactical-clothing', 'apparel/tactical-clothing', '<p><span>Tactical clothing</span></p>', 'Tactical clothing', '', 'Tactical clothing', 2, 'fr'),
(82, 10, 'Tactical clothing', 'tactical-clothing', 'apparel/tactical-clothing', '<p><span>Tactical clothing</span></p>', 'Tactical clothing', '', 'Tactical clothing', 6, 'de'),
(83, 10, 'Tactical clothing', 'tactical-clothing', 'apparel/tactical-clothing', '<p><span>Tactical clothing</span></p>', 'Tactical clothing', '', 'Tactical clothing', 7, 'it'),
(84, 10, 'Tactical clothing', 'tactical-clothing', 'apparel/tactical-clothing', '<p><span>Tactical clothing</span></p>', 'Tactical clothing', '', 'Tactical clothing', 8, 'ru'),
(85, 10, 'Tactical clothing', 'tactical-clothing', 'apparel/tactical-clothing', '<p><span>Tactical clothing</span></p>', 'Tactical clothing', '', 'Tactical clothing', 4, 'tr'),
(86, 10, 'Tactical clothing', 'tactical-clothing', 'apparel/tactical-clothing', '<p><span>Tactical clothing</span></p>', 'Tactical clothing', '', 'Tactical clothing', 9, 'uk'),
(87, 11, 'Boots and Footwear', 'boots-and-footwear', 'apparel/boots-and-footwear', '<p>Boots and Footwear</p>', 'Boots and Footwear', '', 'Boots and Footwear', 1, 'en'),
(88, 11, 'Boots and Footwear', 'boots-and-footwear', 'apparel/boots-and-footwear', '<p>Boots and Footwear</p>', 'Boots and Footwear', '', 'Boots and Footwear', 3, 'nl'),
(89, 11, 'Boots and Footwear', 'boots-and-footwear', 'apparel/boots-and-footwear', '<p>Boots and Footwear</p>', 'Boots and Footwear', '', 'Boots and Footwear', 5, 'es'),
(90, 11, 'Boots and Footwear', 'boots-and-footwear', 'apparel/boots-and-footwear', '<p>Boots and Footwear</p>', 'Boots and Footwear', '', 'Boots and Footwear', 2, 'fr'),
(91, 11, 'Boots and Footwear', 'boots-and-footwear', 'apparel/boots-and-footwear', '<p>Boots and Footwear</p>', 'Boots and Footwear', '', 'Boots and Footwear', 6, 'de'),
(92, 11, 'Boots and Footwear', 'boots-and-footwear', 'apparel/boots-and-footwear', '<p>Boots and Footwear</p>', 'Boots and Footwear', '', 'Boots and Footwear', 7, 'it'),
(93, 11, 'Boots and Footwear', 'boots-and-footwear', 'apparel/boots-and-footwear', '<p>Boots and Footwear</p>', 'Boots and Footwear', '', 'Boots and Footwear', 8, 'ru'),
(94, 11, 'Boots and Footwear', 'boots-and-footwear', 'apparel/boots-and-footwear', '<p>Boots and Footwear</p>', 'Boots and Footwear', '', 'Boots and Footwear', 4, 'tr'),
(95, 11, 'Boots and Footwear', 'boots-and-footwear', 'apparel/boots-and-footwear', '<p>Boots and Footwear</p>', 'Boots and Footwear', '', 'Boots and Footwear', 9, 'uk'),
(96, 12, 'Headgear', 'headgear', 'apparel/headgear', '<p>Headgear (hats, helmets)</p>', 'Headgear', 'Headgear(hats, helmets)', 'hats, helmets', 1, 'en'),
(97, 12, 'Headgear', 'headgear', 'apparel/headgear', '<p>Headgear (hats, helmets)</p>', 'Headgear', 'Headgear(hats, helmets)', 'hats, helmets', 3, 'nl'),
(98, 12, 'Headgear', 'headgear', 'apparel/headgear', '<p>Headgear (hats, helmets)</p>', 'Headgear', 'Headgear(hats, helmets)', 'hats, helmets', 5, 'es'),
(99, 12, 'Headgear', 'headgear', 'apparel/headgear', '<p>Headgear (hats, helmets)</p>', 'Headgear', 'Headgear(hats, helmets)', 'hats, helmets', 2, 'fr'),
(100, 12, 'Headgear', 'headgear', 'apparel/headgear', '<p>Headgear (hats, helmets)</p>', 'Headgear', 'Headgear(hats, helmets)', 'hats, helmets', 6, 'de'),
(101, 12, 'Headgear', 'headgear', 'apparel/headgear', '<p>Headgear (hats, helmets)</p>', 'Headgear', 'Headgear(hats, helmets)', 'hats, helmets', 7, 'it'),
(102, 12, 'Headgear', 'headgear', 'apparel/headgear', '<p>Headgear (hats, helmets)</p>', 'Headgear', 'Headgear(hats, helmets)', 'hats, helmets', 8, 'ru'),
(103, 12, 'Headgear', 'headgear', 'apparel/headgear', '<p>Headgear (hats, helmets)</p>', 'Headgear', 'Headgear(hats, helmets)', 'hats, helmets', 4, 'tr'),
(104, 12, 'Headgear', 'headgear', 'apparel/headgear', '<p>Headgear (hats, helmets)</p>', 'Headgear', 'Headgear(hats, helmets)', 'hats, helmets', 9, 'uk'),
(105, 13, 'Gear and Equipment', 'gear-and-equipment', 'gear-and-equipment', '<p>Tactical vests and plate carriers,&nbsp;Backpacks and bags,&nbsp;Belts and holsters,&nbsp;Tactical gloves,&nbsp;Knee and elbow pads</p>', 'Gear and Equipment', '', 'Tactical vests and plate carriers, Backpacks and bags, Belts and holsters, Tactical gloves, Knee and elbow pads', 1, 'en'),
(106, 13, 'Gear and Equipment', 'gear-and-equipment', 'gear-and-equipment', '<p>Tactical vests and plate carriers,&nbsp;Backpacks and bags,&nbsp;Belts and holsters,&nbsp;Tactical gloves,&nbsp;Knee and elbow pads</p>', 'Gear and Equipment', '', 'Tactical vests and plate carriers, Backpacks and bags, Belts and holsters, Tactical gloves, Knee and elbow pads', 3, 'nl'),
(107, 13, 'Gear and Equipment', 'gear-and-equipment', 'gear-and-equipment', '<p>Tactical vests and plate carriers,&nbsp;Backpacks and bags,&nbsp;Belts and holsters,&nbsp;Tactical gloves,&nbsp;Knee and elbow pads</p>', 'Gear and Equipment', '', 'Tactical vests and plate carriers, Backpacks and bags, Belts and holsters, Tactical gloves, Knee and elbow pads', 5, 'es'),
(108, 13, 'Gear and Equipment', 'gear-and-equipment', 'gear-and-equipment', '<p>Tactical vests and plate carriers,&nbsp;Backpacks and bags,&nbsp;Belts and holsters,&nbsp;Tactical gloves,&nbsp;Knee and elbow pads</p>', 'Gear and Equipment', '', 'Tactical vests and plate carriers, Backpacks and bags, Belts and holsters, Tactical gloves, Knee and elbow pads', 2, 'fr'),
(109, 13, 'Gear and Equipment', 'gear-and-equipment', 'gear-and-equipment', '<p>Tactical vests and plate carriers,&nbsp;Backpacks and bags,&nbsp;Belts and holsters,&nbsp;Tactical gloves,&nbsp;Knee and elbow pads</p>', 'Gear and Equipment', '', 'Tactical vests and plate carriers, Backpacks and bags, Belts and holsters, Tactical gloves, Knee and elbow pads', 6, 'de'),
(110, 13, 'Gear and Equipment', 'gear-and-equipment', 'gear-and-equipment', '<p>Tactical vests and plate carriers,&nbsp;Backpacks and bags,&nbsp;Belts and holsters,&nbsp;Tactical gloves,&nbsp;Knee and elbow pads</p>', 'Gear and Equipment', '', 'Tactical vests and plate carriers, Backpacks and bags, Belts and holsters, Tactical gloves, Knee and elbow pads', 7, 'it'),
(111, 13, 'Gear and Equipment', 'gear-and-equipment', 'gear-and-equipment', '<p>Tactical vests and plate carriers,&nbsp;Backpacks and bags,&nbsp;Belts and holsters,&nbsp;Tactical gloves,&nbsp;Knee and elbow pads</p>', 'Gear and Equipment', '', 'Tactical vests and plate carriers, Backpacks and bags, Belts and holsters, Tactical gloves, Knee and elbow pads', 8, 'ru'),
(112, 13, 'Gear and Equipment', 'gear-and-equipment', 'gear-and-equipment', '<p>Tactical vests and plate carriers,&nbsp;Backpacks and bags,&nbsp;Belts and holsters,&nbsp;Tactical gloves,&nbsp;Knee and elbow pads</p>', 'Gear and Equipment', '', 'Tactical vests and plate carriers, Backpacks and bags, Belts and holsters, Tactical gloves, Knee and elbow pads', 4, 'tr'),
(113, 13, 'Gear and Equipment', 'gear-and-equipment', 'gear-and-equipment', '<p>Tactical vests and plate carriers,&nbsp;Backpacks and bags,&nbsp;Belts and holsters,&nbsp;Tactical gloves,&nbsp;Knee and elbow pads</p>', 'Gear and Equipment', '', 'Tactical vests and plate carriers, Backpacks and bags, Belts and holsters, Tactical gloves, Knee and elbow pads', 9, 'uk'),
(114, 14, 'Tactical Vests and Plate Carriers', 'tactical-vests-and-plate-carriers', 'gear-and-equipment/tactical-vests-and-plate-carriers', '<p><span>Tactical vests and plate carriers</span></p>', 'Tactical Vests and Plate Carriers', '', 'Tactical vests and plate carriers', 1, 'en'),
(115, 14, 'Tactical vests and plate carriers', 'tactical-vests-and-plate-carriers', 'gear-and-equipment/tactical-vests-and-plate-carriers', '<p><span>Tactical vests and plate carriers</span></p>', 'Tactical Vests and Plate Carriers', '', 'Tactical vests and plate carriers', 3, 'nl'),
(116, 14, 'Tactical vests and plate carriers', 'tactical-vests-and-plate-carriers', 'gear-and-equipment/tactical-vests-and-plate-carriers', '<p><span>Tactical vests and plate carriers</span></p>', 'Tactical Vests and Plate Carriers', '', 'Tactical vests and plate carriers', 5, 'es'),
(117, 14, 'Tactical vests and plate carriers', 'tactical-vests-and-plate-carriers', 'gear-and-equipment/tactical-vests-and-plate-carriers', '<p><span>Tactical vests and plate carriers</span></p>', 'Tactical Vests and Plate Carriers', '', 'Tactical vests and plate carriers', 2, 'fr'),
(118, 14, 'Tactical vests and plate carriers', 'tactical-vests-and-plate-carriers', 'gear-and-equipment/tactical-vests-and-plate-carriers', '<p><span>Tactical vests and plate carriers</span></p>', 'Tactical Vests and Plate Carriers', '', 'Tactical vests and plate carriers', 6, 'de'),
(119, 14, 'Tactical vests and plate carriers', 'tactical-vests-and-plate-carriers', 'gear-and-equipment/tactical-vests-and-plate-carriers', '<p><span>Tactical vests and plate carriers</span></p>', 'Tactical Vests and Plate Carriers', '', 'Tactical vests and plate carriers', 7, 'it'),
(120, 14, 'Tactical vests and plate carriers', 'tactical-vests-and-plate-carriers', 'gear-and-equipment/tactical-vests-and-plate-carriers', '<p><span>Tactical vests and plate carriers</span></p>', 'Tactical Vests and Plate Carriers', '', 'Tactical vests and plate carriers', 8, 'ru'),
(121, 14, 'Tactical vests and plate carriers', 'tactical-vests-and-plate-carriers', 'gear-and-equipment/tactical-vests-and-plate-carriers', '<p><span>Tactical vests and plate carriers</span></p>', 'Tactical Vests and Plate Carriers', '', 'Tactical vests and plate carriers', 4, 'tr'),
(122, 14, 'Tactical vests and plate carriers', 'tactical-vests-and-plate-carriers', 'gear-and-equipment/tactical-vests-and-plate-carriers', '<p><span>Tactical vests and plate carriers</span></p>', 'Tactical Vests and Plate Carriers', '', 'Tactical vests and plate carriers', 9, 'uk'),
(123, 15, 'Backpacks and Bags', 'backpacks-and-bags', 'gear-and-equipment/backpacks-and-bags', '<p>Backpacks and bags</p>', 'Backpacks&Bags', '', 'Backpacks and bags', 1, 'en'),
(124, 15, 'Backpacks and Bags', 'backpacks-and-bags', 'gear-and-equipment/backpacks-and-bags', '<p>Backpacks and bags</p>', 'Backpacks and Bags', '', 'Backpacks and bags', 3, 'nl'),
(125, 15, 'Backpacks and Bags', 'backpacks-and-bags', 'gear-and-equipment/backpacks-and-bags', '<p>Backpacks and bags</p>', 'Backpacks and Bags', '', 'Backpacks and bags', 5, 'es'),
(126, 15, 'Backpacks and Bags', 'backpacks-and-bags', 'gear-and-equipment/backpacks-and-bags', '<p>Backpacks and bags</p>', 'Backpacks and Bags', '', 'Backpacks and bags', 2, 'fr'),
(127, 15, 'Backpacks and Bags', 'backpacks-and-bags', 'gear-and-equipment/backpacks-and-bags', '<p>Backpacks and bags</p>', 'Backpacks and Bags', '', 'Backpacks and bags', 6, 'de'),
(128, 15, 'Backpacks and Bags', 'backpacks-and-bags', 'gear-and-equipment/backpacks-and-bags', '<p>Backpacks and bags</p>', 'Backpacks and Bags', '', 'Backpacks and bags', 7, 'it'),
(129, 15, 'Backpacks and Bags', 'backpacks-and-bags', 'gear-and-equipment/backpacks-and-bags', '<p>Backpacks and bags</p>', 'Backpacks and Bags', '', 'Backpacks and bags', 8, 'ru'),
(130, 15, 'Backpacks and Bags', 'backpacks-and-bags', 'gear-and-equipment/backpacks-and-bags', '<p>Backpacks and bags</p>', 'Backpacks and Bags', '', 'Backpacks and bags', 4, 'tr'),
(131, 15, 'Backpacks and Bags', 'backpacks-and-bags', 'gear-and-equipment/backpacks-and-bags', '<p>Backpacks and bags</p>', 'Backpacks and Bags', '', 'Backpacks and bags', 9, 'uk'),
(132, 16, 'Belts and Holsters', 'belts-and-holsters', 'gear-and-equipment/belts-and-holsters', '<p>Belts and Holsters</p>', 'Belts&Holsters', '', 'Belts and Holsters', 1, 'en'),
(133, 16, 'Belts and Holsters', 'belts-and-holsters', 'gear-and-equipment/belts-and-holsters', '<p>Belts and Holsters</p>', 'Belts and Holsters', '', 'Belts and Holsters', 3, 'nl'),
(134, 16, 'Belts and Holsters', 'belts-and-holsters', 'gear-and-equipment/belts-and-holsters', '<p>Belts and Holsters</p>', 'Belts and Holsters', '', 'Belts and Holsters', 5, 'es'),
(135, 16, 'Belts and Holsters', 'belts-and-holsters', 'gear-and-equipment/belts-and-holsters', '<p>Belts and Holsters</p>', 'Belts and Holsters', '', 'Belts and Holsters', 2, 'fr'),
(136, 16, 'Belts and Holsters', 'belts-and-holsters', 'gear-and-equipment/belts-and-holsters', '<p>Belts and Holsters</p>', 'Belts and Holsters', '', 'Belts and Holsters', 6, 'de'),
(137, 16, 'Belts and Holsters', 'belts-and-holsters', 'gear-and-equipment/belts-and-holsters', '<p>Belts and Holsters</p>', 'Belts and Holsters', '', 'Belts and Holsters', 7, 'it'),
(138, 16, 'Belts and Holsters', 'belts-and-holsters', 'gear-and-equipment/belts-and-holsters', '<p>Belts and Holsters</p>', 'Belts and Holsters', '', 'Belts and Holsters', 8, 'ru'),
(139, 16, 'Belts and Holsters', 'belts-and-holsters', 'gear-and-equipment/belts-and-holsters', '<p>Belts and Holsters</p>', 'Belts and Holsters', '', 'Belts and Holsters', 4, 'tr'),
(140, 16, 'Belts and Holsters', 'belts-and-holsters', 'gear-and-equipment/belts-and-holsters', '<p>Belts and Holsters</p>', 'Belts and Holsters', '', 'Belts and Holsters', 9, 'uk'),
(141, 17, 'Tactical Gloves', 'tactical-gloves', 'gear-and-equipment/tactical-gloves', '<p>Tactical Gloves</p>', 'Tactical Gloves', '', 'Tactical Gloves', 1, 'en'),
(142, 17, 'Tactical Gloves', 'tactical-gloves', 'gear-and-equipment/tactical-gloves', '<p>Tactical Gloves</p>', 'Tactical Gloves', '', 'Tactical Gloves', 3, 'nl'),
(143, 17, 'Tactical Gloves', 'tactical-gloves', 'gear-and-equipment/tactical-gloves', '<p>Tactical Gloves</p>', 'Tactical Gloves', '', 'Tactical Gloves', 5, 'es'),
(144, 17, 'Tactical Gloves', 'tactical-gloves', 'gear-and-equipment/tactical-gloves', '<p>Tactical Gloves</p>', 'Tactical Gloves', '', 'Tactical Gloves', 2, 'fr'),
(145, 17, 'Tactical Gloves', 'tactical-gloves', 'gear-and-equipment/tactical-gloves', '<p>Tactical Gloves</p>', 'Tactical Gloves', '', 'Tactical Gloves', 6, 'de'),
(146, 17, 'Tactical Gloves', 'tactical-gloves', 'gear-and-equipment/tactical-gloves', '<p>Tactical Gloves</p>', 'Tactical Gloves', '', 'Tactical Gloves', 7, 'it'),
(147, 17, 'Tactical Gloves', 'tactical-gloves', 'gear-and-equipment/tactical-gloves', '<p>Tactical Gloves</p>', 'Tactical Gloves', '', 'Tactical Gloves', 8, 'ru'),
(148, 17, 'Tactical Gloves', 'tactical-gloves', 'gear-and-equipment/tactical-gloves', '<p>Tactical Gloves</p>', 'Tactical Gloves', '', 'Tactical Gloves', 4, 'tr'),
(149, 17, 'Tactical Gloves', 'tactical-gloves', 'gear-and-equipment/tactical-gloves', '<p>Tactical Gloves</p>', 'Tactical Gloves', '', 'Tactical Gloves', 9, 'uk'),
(150, 18, 'Firearms and Accessories', 'firearms-and-accessories', 'firearms-and-accessories', '<p>Handguns,&nbsp;Rifles,&nbsp;Ammunition,&nbsp;Gun cleaning kits,&nbsp;Optics and scopes,&nbsp;Gun cases and safes</p>', 'Firearms&Accessories', '', 'Handguns, Rifles, Ammunition, Gun cleaning kits, Optics and scopes, Gun cases and safes', 1, 'en'),
(151, 18, 'Firearms and Accessories:', 'firearms-and-accessories', 'firearms-and-accessories', '<p>Handguns,&nbsp;Rifles,&nbsp;Ammunition,&nbsp;Gun cleaning kits,&nbsp;Optics and scopes,&nbsp;Gun cases and safes</p>', 'Firearms and Accessories:', '', 'Handguns, Rifles, Ammunition, Gun cleaning kits, Optics and scopes, Gun cases and safes', 3, 'nl'),
(152, 18, 'Firearms and Accessories:', 'firearms-and-accessories', 'firearms-and-accessories', '<p>Handguns,&nbsp;Rifles,&nbsp;Ammunition,&nbsp;Gun cleaning kits,&nbsp;Optics and scopes,&nbsp;Gun cases and safes</p>', 'Firearms and Accessories:', '', 'Handguns, Rifles, Ammunition, Gun cleaning kits, Optics and scopes, Gun cases and safes', 5, 'es'),
(153, 18, 'Firearms and Accessories:', 'firearms-and-accessories', 'firearms-and-accessories', '<p>Handguns,&nbsp;Rifles,&nbsp;Ammunition,&nbsp;Gun cleaning kits,&nbsp;Optics and scopes,&nbsp;Gun cases and safes</p>', 'Firearms and Accessories:', '', 'Handguns, Rifles, Ammunition, Gun cleaning kits, Optics and scopes, Gun cases and safes', 2, 'fr'),
(154, 18, 'Firearms and Accessories:', 'firearms-and-accessories', 'firearms-and-accessories', '<p>Handguns,&nbsp;Rifles,&nbsp;Ammunition,&nbsp;Gun cleaning kits,&nbsp;Optics and scopes,&nbsp;Gun cases and safes</p>', 'Firearms and Accessories:', '', 'Handguns, Rifles, Ammunition, Gun cleaning kits, Optics and scopes, Gun cases and safes', 6, 'de'),
(155, 18, 'Firearms and Accessories:', 'firearms-and-accessories', 'firearms-and-accessories', '<p>Handguns,&nbsp;Rifles,&nbsp;Ammunition,&nbsp;Gun cleaning kits,&nbsp;Optics and scopes,&nbsp;Gun cases and safes</p>', 'Firearms and Accessories:', '', 'Handguns, Rifles, Ammunition, Gun cleaning kits, Optics and scopes, Gun cases and safes', 7, 'it'),
(156, 18, 'Firearms and Accessories:', 'firearms-and-accessories', 'firearms-and-accessories', '<p>Handguns,&nbsp;Rifles,&nbsp;Ammunition,&nbsp;Gun cleaning kits,&nbsp;Optics and scopes,&nbsp;Gun cases and safes</p>', 'Firearms and Accessories:', '', 'Handguns, Rifles, Ammunition, Gun cleaning kits, Optics and scopes, Gun cases and safes', 8, 'ru'),
(157, 18, 'Firearms and Accessories:', 'firearms-and-accessories', 'firearms-and-accessories', '<p>Handguns,&nbsp;Rifles,&nbsp;Ammunition,&nbsp;Gun cleaning kits,&nbsp;Optics and scopes,&nbsp;Gun cases and safes</p>', 'Firearms and Accessories:', '', 'Handguns, Rifles, Ammunition, Gun cleaning kits, Optics and scopes, Gun cases and safes', 4, 'tr'),
(158, 18, 'Firearms and Accessories:', 'firearms-and-accessories', 'firearms-and-accessories', '<p>Handguns,&nbsp;Rifles,&nbsp;Ammunition,&nbsp;Gun cleaning kits,&nbsp;Optics and scopes,&nbsp;Gun cases and safes</p>', 'Firearms and Accessories:', '', 'Handguns, Rifles, Ammunition, Gun cleaning kits, Optics and scopes, Gun cases and safes', 9, 'uk'),
(159, 19, 'Handguns', 'handguns', 'firearms-and-accessories/handguns', '<p><span>Handguns</span></p>', 'Handguns', '', 'Handguns', 1, 'en'),
(160, 19, 'Handguns', 'handguns', 'firearms-and-accessories/handguns', '<p><span>Handguns</span></p>', 'Handguns', '', 'Handguns', 3, 'nl'),
(161, 19, 'Handguns', 'handguns', 'firearms-and-accessories/handguns', '<p><span>Handguns</span></p>', 'Handguns', '', 'Handguns', 5, 'es'),
(162, 19, 'Handguns', 'handguns', 'firearms-and-accessories/handguns', '<p><span>Handguns</span></p>', 'Handguns', '', 'Handguns', 2, 'fr'),
(163, 19, 'Handguns', 'handguns', 'firearms-and-accessories/handguns', '<p><span>Handguns</span></p>', 'Handguns', '', 'Handguns', 6, 'de'),
(164, 19, 'Handguns', 'handguns', 'firearms-and-accessories/handguns', '<p><span>Handguns</span></p>', 'Handguns', '', 'Handguns', 7, 'it'),
(165, 19, 'Handguns', 'handguns', 'firearms-and-accessories/handguns', '<p><span>Handguns</span></p>', 'Handguns', '', 'Handguns', 8, 'ru'),
(166, 19, 'Handguns', 'handguns', 'firearms-and-accessories/handguns', '<p><span>Handguns</span></p>', 'Handguns', '', 'Handguns', 4, 'tr'),
(167, 19, 'Handguns', 'handguns', 'firearms-and-accessories/handguns', '<p><span>Handguns</span></p>', 'Handguns', '', 'Handguns', 9, 'uk'),
(168, 20, 'Rifles', 'rifles', 'firearms-and-accessories/rifles', '<p><span>Rifles</span></p>', 'Rifles', '', 'Rifles00', 1, 'en'),
(169, 20, 'Rifles', 'rifles', 'firearms-and-accessories/rifles', '<p><span>Rifles</span></p>', 'Rifles', '', 'Rifles00', 3, 'nl'),
(170, 20, 'Rifles', 'rifles', 'firearms-and-accessories/rifles', '<p><span>Rifles</span></p>', 'Rifles', '', 'Rifles00', 5, 'es'),
(171, 20, 'Rifles', 'rifles', 'firearms-and-accessories/rifles', '<p><span>Rifles</span></p>', 'Rifles', '', 'Rifles00', 2, 'fr'),
(172, 20, 'Rifles', 'rifles', 'firearms-and-accessories/rifles', '<p><span>Rifles</span></p>', 'Rifles', '', 'Rifles00', 6, 'de'),
(173, 20, 'Rifles', 'rifles', 'firearms-and-accessories/rifles', '<p><span>Rifles</span></p>', 'Rifles', '', 'Rifles00', 7, 'it'),
(174, 20, 'Rifles', 'rifles', 'firearms-and-accessories/rifles', '<p><span>Rifles</span></p>', 'Rifles', '', 'Rifles00', 8, 'ru'),
(175, 20, 'Rifles', 'rifles', 'firearms-and-accessories/rifles', '<p><span>Rifles</span></p>', 'Rifles', '', 'Rifles00', 4, 'tr'),
(176, 20, 'Rifles', 'rifles', 'firearms-and-accessories/rifles', '<p><span>Rifles</span></p>', 'Rifles', '', 'Rifles00', 9, 'uk'),
(177, 21, 'Ammunition', 'ammunition', 'firearms-and-accessories/ammunition', '<p>Ammunition</p>', 'Ammunition', '', 'Ammunition, ammo', 1, 'en'),
(178, 21, 'Ammunition', 'ammunition', 'firearms-and-accessories/ammunition', '<p>Ammunition</p>', 'Ammunition', '', 'Ammunition, ammo', 3, 'nl'),
(179, 21, 'Ammunition', 'ammunition', 'firearms-and-accessories/ammunition', '<p>Ammunition</p>', 'Ammunition', '', 'Ammunition, ammo', 5, 'es'),
(180, 21, 'Ammunition', 'ammunition', 'firearms-and-accessories/ammunition', '<p>Ammunition</p>', 'Ammunition', '', 'Ammunition, ammo', 2, 'fr'),
(181, 21, 'Ammunition', 'ammunition', 'firearms-and-accessories/ammunition', '<p>Ammunition</p>', 'Ammunition', '', 'Ammunition, ammo', 6, 'de'),
(182, 21, 'Ammunition', 'ammunition', 'firearms-and-accessories/ammunition', '<p>Ammunition</p>', 'Ammunition', '', 'Ammunition, ammo', 7, 'it'),
(183, 21, 'Ammunition', 'ammunition', 'firearms-and-accessories/ammunition', '<p>Ammunition</p>', 'Ammunition', '', 'Ammunition, ammo', 8, 'ru'),
(184, 21, 'Ammunition', 'ammunition', 'firearms-and-accessories/ammunition', '<p>Ammunition</p>', 'Ammunition', '', 'Ammunition, ammo', 4, 'tr'),
(185, 21, 'Ammunition', 'ammunition', 'firearms-and-accessories/ammunition', '<p>Ammunition</p>', 'Ammunition', '', 'Ammunition, ammo', 9, 'uk'),
(204, 24, 'Electronics and Communication', 'electronics-and-communication', 'electronics-and-communication', '<p>Tactical flashlights,&nbsp;Night vision goggles,&nbsp;Radios and communication devices,&nbsp;GPS devices</p>', 'Electronics&Communication', '', 'Tactical flashlights, Night vision goggles, Radios and communication devices, GPS devices', 1, 'en'),
(205, 24, 'Electronics and Communication', 'electronics-and-communication', 'electronics-and-communication', '<p>Tactical flashlights,&nbsp;Night vision goggles,&nbsp;Radios and communication devices,&nbsp;GPS devices</p>', 'Electronics&Communication', '', 'Tactical flashlights, Night vision goggles, Radios and communication devices, GPS devices', 3, 'nl'),
(206, 24, 'Electronics and Communication', 'electronics-and-communication', 'electronics-and-communication', '<p>Tactical flashlights,&nbsp;Night vision goggles,&nbsp;Radios and communication devices,&nbsp;GPS devices</p>', 'Electronics&Communication', '', 'Tactical flashlights, Night vision goggles, Radios and communication devices, GPS devices', 5, 'es'),
(207, 24, 'Electronics and Communication', 'electronics-and-communication', 'electronics-and-communication', '<p>Tactical flashlights,&nbsp;Night vision goggles,&nbsp;Radios and communication devices,&nbsp;GPS devices</p>', 'Electronics&Communication', '', 'Tactical flashlights, Night vision goggles, Radios and communication devices, GPS devices', 2, 'fr'),
(208, 24, 'Electronics and Communication', 'electronics-and-communication', 'electronics-and-communication', '<p>Tactical flashlights,&nbsp;Night vision goggles,&nbsp;Radios and communication devices,&nbsp;GPS devices</p>', 'Electronics&Communication', '', 'Tactical flashlights, Night vision goggles, Radios and communication devices, GPS devices', 6, 'de'),
(209, 24, 'Electronics and Communication', 'electronics-and-communication', 'electronics-and-communication', '<p>Tactical flashlights,&nbsp;Night vision goggles,&nbsp;Radios and communication devices,&nbsp;GPS devices</p>', 'Electronics&Communication', '', 'Tactical flashlights, Night vision goggles, Radios and communication devices, GPS devices', 7, 'it'),
(210, 24, 'Electronics and Communication', 'electronics-and-communication', 'electronics-and-communication', '<p>Tactical flashlights,&nbsp;Night vision goggles,&nbsp;Radios and communication devices,&nbsp;GPS devices</p>', 'Electronics&Communication', '', 'Tactical flashlights, Night vision goggles, Radios and communication devices, GPS devices', 8, 'ru'),
(211, 24, 'Electronics and Communication', 'electronics-and-communication', 'electronics-and-communication', '<p>Tactical flashlights,&nbsp;Night vision goggles,&nbsp;Radios and communication devices,&nbsp;GPS devices</p>', 'Electronics&Communication', '', 'Tactical flashlights, Night vision goggles, Radios and communication devices, GPS devices', 4, 'tr'),
(212, 24, 'Electronics and Communication', 'electronics-and-communication', 'electronics-and-communication', '<p>Tactical flashlights,&nbsp;Night vision goggles,&nbsp;Radios and communication devices,&nbsp;GPS devices</p>', 'Electronics&Communication', '', 'Tactical flashlights, Night vision goggles, Radios and communication devices, GPS devices', 9, 'uk'),
(213, 25, 'Tactical Flashlights', 'tactical-flashlights', 'electronics-and-communication/tactical-flashlights', '<p>Tactical flashlights</p>', 'Tactical Flashlights', '', 'Tactical flashlights, flashlight', 1, 'en'),
(214, 25, 'Tactical Flashlights', 'tactical-flashlights', 'electronics-and-communication/tactical-flashlights', '<p>Tactical flashlights</p>', 'Tactical Flashlights', '', 'Tactical flashlights, flashlight', 3, 'nl'),
(215, 25, 'Tactical Flashlights', 'tactical-flashlights', 'electronics-and-communication/tactical-flashlights', '<p>Tactical flashlights</p>', 'Tactical Flashlights', '', 'Tactical flashlights, flashlight', 5, 'es'),
(216, 25, 'Tactical Flashlights', 'tactical-flashlights', 'electronics-and-communication/tactical-flashlights', '<p>Tactical flashlights</p>', 'Tactical Flashlights', '', 'Tactical flashlights, flashlight', 2, 'fr'),
(217, 25, 'Tactical Flashlights', 'tactical-flashlights', 'electronics-and-communication/tactical-flashlights', '<p>Tactical flashlights</p>', 'Tactical Flashlights', '', 'Tactical flashlights, flashlight', 6, 'de'),
(218, 25, 'Tactical Flashlights', 'tactical-flashlights', 'electronics-and-communication/tactical-flashlights', '<p>Tactical flashlights</p>', 'Tactical Flashlights', '', 'Tactical flashlights, flashlight', 7, 'it'),
(219, 25, 'Tactical Flashlights', 'tactical-flashlights', 'electronics-and-communication/tactical-flashlights', '<p>Tactical flashlights</p>', 'Tactical Flashlights', '', 'Tactical flashlights, flashlight', 8, 'ru'),
(220, 25, 'Tactical Flashlights', 'tactical-flashlights', 'electronics-and-communication/tactical-flashlights', '<p>Tactical flashlights</p>', 'Tactical Flashlights', '', 'Tactical flashlights, flashlight', 4, 'tr'),
(221, 25, 'Tactical Flashlights', 'tactical-flashlights', 'electronics-and-communication/tactical-flashlights', '<p>Tactical flashlights</p>', 'Tactical Flashlights', '', 'Tactical flashlights, flashlight', 9, 'uk'),
(222, 26, 'Night Vision Goggles', 'night-vision-goggles', 'electronics-and-communication/night-vision-goggles', '<p>Night vision goggles</p>', 'Night Vision Goggles', '', 'Night vision goggles, Night vision, Goggles', 1, 'en'),
(223, 26, 'Night Vision Goggles', 'night-vision-goggles', 'electronics-and-communication/night-vision-goggles', '<p>Night vision goggles</p>', 'Night Vision Goggles', '', 'Night vision goggles, Night vision, Goggles', 3, 'nl'),
(224, 26, 'Night Vision Goggles', 'night-vision-goggles', 'electronics-and-communication/night-vision-goggles', '<p>Night vision goggles</p>', 'Night Vision Goggles', '', 'Night vision goggles, Night vision, Goggles', 5, 'es'),
(225, 26, 'Night Vision Goggles', 'night-vision-goggles', 'electronics-and-communication/night-vision-goggles', '<p>Night vision goggles</p>', 'Night Vision Goggles', '', 'Night vision goggles, Night vision, Goggles', 2, 'fr'),
(226, 26, 'Night Vision Goggles', 'night-vision-goggles', 'electronics-and-communication/night-vision-goggles', '<p>Night vision goggles</p>', 'Night Vision Goggles', '', 'Night vision goggles, Night vision, Goggles', 6, 'de'),
(227, 26, 'Night Vision Goggles', 'night-vision-goggles', 'electronics-and-communication/night-vision-goggles', '<p>Night vision goggles</p>', 'Night Vision Goggles', '', 'Night vision goggles, Night vision, Goggles', 7, 'it'),
(228, 26, 'Night Vision Goggles', 'night-vision-goggles', 'electronics-and-communication/night-vision-goggles', '<p>Night vision goggles</p>', 'Night Vision Goggles', '', 'Night vision goggles, Night vision, Goggles', 8, 'ru'),
(229, 26, 'Night Vision Goggles', 'night-vision-goggles', 'electronics-and-communication/night-vision-goggles', '<p>Night vision goggles</p>', 'Night Vision Goggles', '', 'Night vision goggles, Night vision, Goggles', 4, 'tr'),
(230, 26, 'Night Vision Goggles', 'night-vision-goggles', 'electronics-and-communication/night-vision-goggles', '<p>Night vision goggles</p>', 'Night Vision Goggles', '', 'Night vision goggles, Night vision, Goggles', 9, 'uk'),
(231, 27, 'Radios and Communication Devices', 'radios-and-communication-devices', 'electronics-and-communication/radios-and-communication-devices', '<p>Radios and Communication Devices</p>', 'Radios&Communication Devices', '', 'Radios and communication devices, Radios, communication devices', 1, 'en'),
(232, 27, 'Radios and Communication Devices', 'radios-and-communication-devices', 'electronics-and-communication/radios-and-communication-devices', '<p>Radios and Communication Devices</p>', 'Radios&Communication Devices', '', 'Radios and communication devices, Radios, communication devices', 3, 'nl'),
(233, 27, 'Radios and Communication Devices', 'radios-and-communication-devices', 'electronics-and-communication/radios-and-communication-devices', '<p>Radios and Communication Devices</p>', 'Radios&Communication Devices', '', 'Radios and communication devices, Radios, communication devices', 5, 'es'),
(234, 27, 'Radios and Communication Devices', 'radios-and-communication-devices', 'electronics-and-communication/radios-and-communication-devices', '<p>Radios and Communication Devices</p>', 'Radios&Communication Devices', '', 'Radios and communication devices, Radios, communication devices', 2, 'fr'),
(235, 27, 'Radios and Communication Devices', 'radios-and-communication-devices', 'electronics-and-communication/radios-and-communication-devices', '<p>Radios and Communication Devices</p>', 'Radios&Communication Devices', '', 'Radios and communication devices, Radios, communication devices', 6, 'de'),
(236, 27, 'Radios and Communication Devices', 'radios-and-communication-devices', 'electronics-and-communication/radios-and-communication-devices', '<p>Radios and Communication Devices</p>', 'Radios&Communication Devices', '', 'Radios and communication devices, Radios, communication devices', 7, 'it'),
(237, 27, 'Radios and Communication Devices', 'radios-and-communication-devices', 'electronics-and-communication/radios-and-communication-devices', '<p>Radios and Communication Devices</p>', 'Radios&Communication Devices', '', 'Radios and communication devices, Radios, communication devices', 8, 'ru'),
(238, 27, 'Radios and Communication Devices', 'radios-and-communication-devices', 'electronics-and-communication/radios-and-communication-devices', '<p>Radios and Communication Devices</p>', 'Radios&Communication Devices', '', 'Radios and communication devices, Radios, communication devices', 4, 'tr'),
(239, 27, 'Radios and Communication Devices', 'radios-and-communication-devices', 'electronics-and-communication/radios-and-communication-devices', '<p>Radios and Communication Devices</p>', 'Radios&Communication Devices', '', 'Radios and communication devices, Radios, communication devices', 9, 'uk'),
(240, 28, 'GPS Devices', 'gps-devices', 'electronics-and-communication/gps-devices', '<p>GPS devices</p>', 'GPS Devices', '', 'GPS devices, GPS', 1, 'en'),
(241, 28, 'GPS Devices', 'gps-devices', 'electronics-and-communication/gps-devices', '<p>GPS devices</p>', 'GPS Devices', '', 'GPS devices, GPS', 3, 'nl'),
(242, 28, 'GPS Devices', 'gps-devices', 'electronics-and-communication/gps-devices', '<p>GPS devices</p>', 'GPS Devices', '', 'GPS devices, GPS', 5, 'es'),
(243, 28, 'GPS Devices', 'gps-devices', 'electronics-and-communication/gps-devices', '<p>GPS devices</p>', 'GPS Devices', '', 'GPS devices, GPS', 2, 'fr'),
(244, 28, 'GPS Devices', 'gps-devices', 'electronics-and-communication/gps-devices', '<p>GPS devices</p>', 'GPS Devices', '', 'GPS devices, GPS', 6, 'de'),
(245, 28, 'GPS Devices', 'gps-devices', 'electronics-and-communication/gps-devices', '<p>GPS devices</p>', 'GPS Devices', '', 'GPS devices, GPS', 7, 'it'),
(246, 28, 'GPS Devices', 'gps-devices', 'electronics-and-communication/gps-devices', '<p>GPS devices</p>', 'GPS Devices', '', 'GPS devices, GPS', 8, 'ru'),
(247, 28, 'GPS Devices', 'gps-devices', 'electronics-and-communication/gps-devices', '<p>GPS devices</p>', 'GPS Devices', '', 'GPS devices, GPS', 4, 'tr'),
(248, 28, 'GPS Devices', 'gps-devices', 'electronics-and-communication/gps-devices', '<p>GPS devices</p>', 'GPS Devices', '', 'GPS devices, GPS', 9, 'uk'),
(249, 29, 'Batteries and Chargers', 'batteries-and-chargers', 'electronics-and-communication/batteries-and-chargers', '<p>Batteries and chargers</p>', 'Batteries&Chargers', '', 'Batteries and chargers, Batteries, Chargers', 1, 'en'),
(250, 29, 'Batteries and Chargers', 'batteries-and-chargers', 'electronics-and-communication/batteries-and-chargers', '<p>Batteries and chargers</p>', 'Batteries&Chargers', '', 'Batteries and chargers, Batteries, Chargers', 3, 'nl'),
(251, 29, 'Batteries and Chargers', 'batteries-and-chargers', 'electronics-and-communication/batteries-and-chargers', '<p>Batteries and chargers</p>', 'Batteries&Chargers', '', 'Batteries and chargers, Batteries, Chargers', 5, 'es'),
(252, 29, 'Batteries and Chargers', 'batteries-and-chargers', 'electronics-and-communication/batteries-and-chargers', '<p>Batteries and chargers</p>', 'Batteries&Chargers', '', 'Batteries and chargers, Batteries, Chargers', 2, 'fr'),
(253, 29, 'Batteries and Chargers', 'batteries-and-chargers', 'electronics-and-communication/batteries-and-chargers', '<p>Batteries and chargers</p>', 'Batteries&Chargers', '', 'Batteries and chargers, Batteries, Chargers', 6, 'de'),
(254, 29, 'Batteries and Chargers', 'batteries-and-chargers', 'electronics-and-communication/batteries-and-chargers', '<p>Batteries and chargers</p>', 'Batteries&Chargers', '', 'Batteries and chargers, Batteries, Chargers', 7, 'it'),
(255, 29, 'Batteries and Chargers', 'batteries-and-chargers', 'electronics-and-communication/batteries-and-chargers', '<p>Batteries and chargers</p>', 'Batteries&Chargers', '', 'Batteries and chargers, Batteries, Chargers', 8, 'ru'),
(256, 29, 'Batteries and Chargers', 'batteries-and-chargers', 'electronics-and-communication/batteries-and-chargers', '<p>Batteries and chargers</p>', 'Batteries&Chargers', '', 'Batteries and chargers, Batteries, Chargers', 4, 'tr'),
(257, 29, 'Batteries and Chargers', 'batteries-and-chargers', 'electronics-and-communication/batteries-and-chargers', '<p>Batteries and chargers</p>', 'Batteries&Chargers', '', 'Batteries and chargers, Batteries, Chargers', 9, 'uk');

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE `channels` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `timezone` varchar(191) DEFAULT NULL,
  `theme` varchar(191) DEFAULT NULL,
  `hostname` varchar(191) DEFAULT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `favicon` varchar(191) DEFAULT NULL,
  `home_seo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`home_seo`)),
  `is_maintenance_on` tinyint(1) NOT NULL DEFAULT 0,
  `allowed_ips` text DEFAULT NULL,
  `root_category_id` int(10) UNSIGNED DEFAULT NULL,
  `default_locale_id` int(10) UNSIGNED NOT NULL,
  `base_currency_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `channels`
--

INSERT INTO `channels` (`id`, `code`, `timezone`, `theme`, `hostname`, `logo`, `favicon`, `home_seo`, `is_maintenance_on`, `allowed_ips`, `root_category_id`, `default_locale_id`, `base_currency_id`, `created_at`, `updated_at`) VALUES
(1, 'default', NULL, 'default', '127.0.0.1:8000', NULL, NULL, NULL, 1, '', 1, 1, 3, NULL, '2024-02-07 03:18:54');

-- --------------------------------------------------------

--
-- Table structure for table `channel_currencies`
--

CREATE TABLE `channel_currencies` (
  `channel_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `channel_currencies`
--

INSERT INTO `channel_currencies` (`channel_id`, `currency_id`) VALUES
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `channel_inventory_sources`
--

CREATE TABLE `channel_inventory_sources` (
  `channel_id` int(10) UNSIGNED NOT NULL,
  `inventory_source_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `channel_inventory_sources`
--

INSERT INTO `channel_inventory_sources` (`channel_id`, `inventory_source_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `channel_locales`
--

CREATE TABLE `channel_locales` (
  `channel_id` int(10) UNSIGNED NOT NULL,
  `locale_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `channel_locales`
--

INSERT INTO `channel_locales` (`channel_id`, `locale_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `channel_translations`
--

CREATE TABLE `channel_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `maintenance_mode_text` text DEFAULT NULL,
  `home_seo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`home_seo`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `channel_translations`
--

INSERT INTO `channel_translations` (`id`, `channel_id`, `locale`, `name`, `description`, `maintenance_mode_text`, `home_seo`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Default', NULL, NULL, '{\"meta_title\":\"Army store\",\"meta_description\":\"Army store meta description\",\"meta_keywords\":\"Army store meta keyword\"}', NULL, '2024-01-29 16:43:16'),
(2, 1, 'fr', 'Default', NULL, NULL, '{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}', NULL, NULL),
(3, 1, 'nl', 'Default', NULL, NULL, '{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}', NULL, NULL),
(4, 1, 'tr', 'Default', NULL, NULL, '{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}', NULL, NULL),
(5, 1, 'es', 'Default', NULL, NULL, '{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_pages`
--

CREATE TABLE `cms_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `layout` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cms_pages`
--

INSERT INTO `cms_pages` (`id`, `layout`, `created_at`, `updated_at`) VALUES
(1, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(2, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(3, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(4, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(5, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(6, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(7, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(8, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(9, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(10, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(11, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29');

-- --------------------------------------------------------

--
-- Table structure for table `cms_page_channels`
--

CREATE TABLE `cms_page_channels` (
  `cms_page_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cms_page_channels`
--

INSERT INTO `cms_page_channels` (`cms_page_id`, `channel_id`) VALUES
(6, 1),
(7, 1),
(9, 1),
(10, 1),
(11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_page_translations`
--

CREATE TABLE `cms_page_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_title` varchar(191) NOT NULL,
  `url_key` varchar(191) NOT NULL,
  `html_content` longtext DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `locale` varchar(191) NOT NULL,
  `cms_page_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cms_page_translations`
--

INSERT INTO `cms_page_translations` (`id`, `page_title`, `url_key`, `html_content`, `meta_title`, `meta_description`, `meta_keywords`, `locale`, `cms_page_id`) VALUES
(1, 'About Us', 'about-us', '<div class=\"static-container\"><div class=\"mb-5\">About us page content</div></div>', 'about us', '', 'aboutus', 'en', 1),
(2, 'Return Policy', 'return-policy', '<div class=\"static-container\"><div class=\"mb-5\">Return policy page content</div></div>', 'return policy', '', 'return, policy', 'en', 2),
(3, 'Refund Policy', 'refund-policy', '<div class=\"static-container\"><div class=\"mb-5\">Refund policy page content</div></div>', 'Refund policy', '', 'refund, policy', 'en', 3),
(4, 'Terms & Conditions', 'terms-conditions', '<div class=\"static-container\"><div class=\"mb-5\">Terms & conditions page content</div></div>', 'Terms & Conditions', '', 'term, conditions', 'en', 4),
(5, 'Terms of use', 'terms-of-use', '<div class=\"static-container\"><div class=\"mb-5\">Terms of use page content</div></div>', 'Terms of use', '', 'term, use', 'en', 5),
(6, 'Contact Us', 'contact-us', '<div class=\"static-container\">\r\n<div class=\"mb-5\">\r\n<p><strong>Contact Us for Army Store</strong></p>\r\n<p>We value your feedback, inquiries, and concerns. Our dedicated customer service team is here to assist you. Please find below the contact information for reaching us:</p>\r\n<p><strong>1. Email:</strong></p>\r\n<ul>\r\n<li>General Inquiries: [<a target=\"_new\">info@armystore.com</a>]</li>\r\n<li>Customer Support: [<a target=\"_new\">support@</a><a target=\"_new\">armystore</a><a target=\"_new\">.com</a>]</li>\r\n<li>Returns and Exchanges: [<a target=\"_new\">returns@</a><a target=\"_new\">armystore</a><a target=\"_new\">.com</a>]</li>\r\n</ul>\r\n<p><strong>2. Phone:</strong></p>\r\n<ul>\r\n<li>Customer Support Hotline: 0205015724\r\n<ul>\r\n<li>Business Hours: 08:00 17:30 GMT</li>\r\n</ul>\r\n</li>\r\n</ul>\r\n<p><strong>3. Live Chat:</strong></p>\r\n<ul>\r\n<li>In progress</li>\r\n</ul>\r\n<p><strong>4. Mailing Address:</strong></p>\r\n<ul>\r\n<li>Burma Camp</li>\r\n<li><span>HRQV+248</span></li>\r\n<li>Accra, Greater Accra, 00233</li>\r\n<li>Ghana</li>\r\n</ul>\r\n<p><strong>5. Social Media:</strong></p>\r\n<ul>\r\n<li>Connect with us on social media for updates, promotions, and direct messaging:\r\n<ul>\r\n<li>[Facebook]: <a href=\"https://www.facebook.com/GhArmedForcesOfficial\" title=\"Facebook\">Facebook</a></li>\r\n<li>[Twitter]: <a href=\"https://twitter.com/GhArmedForces\" title=\"Twitter\">Twitter</a></li>\r\n<li>[Instagram]: <a href=\"https://www.instagram.com/gharmedforcesofficial/\" title=\"Instagram\">Instagram</a></li>\r\n</ul>\r\n</li>\r\n</ul>\r\n<p><strong>6. Online Contact Form:</strong></p>\r\n<ul>\r\n<li>You can also reach us by filling out the contact form on our website [link to the contact form].</li>\r\n</ul>\r\n<p><strong>7. Military Community Support:</strong></p>\r\n<ul>\r\n<li>If you are a military service member or a family member, please let us know. We may have special offers or considerations for you.</li>\r\n</ul>\r\n<p><strong>8. Feedback:</strong></p>\r\n<ul>\r\n<li>We value your feedback! If you have any suggestions or comments about our products or services, please share them with us at [<a target=\"_new\">feedback@armystore.com</a>].</li>\r\n</ul>\r\n<p>Our team is committed to providing you with the best customer service experience. We aim to respond to inquiries promptly and address your needs efficiently. Thank you for choosing Army Store. We appreciate your business and look forward to assisting you!</p>\r\n</div>\r\n</div>', 'Contact Us', '', 'contact, us', 'en', 6),
(7, 'Customer Service', 'customer-service', '<div class=\"static-container\">\r\n<div class=\"mb-5\">Customer service page content\r\n<div class=\"flex-1 overflow-hidden\">\r\n<div class=\"react-scroll-to-bottom--css-jbfwr-79elbk h-full\">\r\n<div class=\"react-scroll-to-bottom--css-jbfwr-1n7m0yu\">\r\n<div class=\"flex flex-col pb-9 text-sm\">\r\n<div class=\"w-full text-token-text-primary\" data-testid=\"conversation-turn-7\">\r\n<div class=\"px-4 py-2 justify-center text-base md:gap-6 m-auto\">\r\n<div class=\"flex flex-1 text-base mx-auto gap-3 md:px-5 lg:px-1 xl:px-5 md:max-w-3xl lg:max-w-[40rem] xl:max-w-[48rem] group final-completion\">\r\n<div class=\"relative flex w-full flex-col lg:w-[calc(100%-115px)] agent-turn\">\r\n<div class=\"flex-col gap-1 md:gap-3\">\r\n<div class=\"flex flex-grow flex-col max-w-full\">\r\n<div data-message-author-role=\"assistant\" data-message-id=\"ca9af67f-359b-47ea-8497-3d0d43d41f0f\" class=\"min-h-[20px] text-message flex flex-col items-start gap-3 whitespace-pre-wrap break-words [.text-message+&amp;]:mt-5 overflow-x-auto\">\r\n<div class=\"markdown prose w-full break-words dark:prose-invert light\">\r\n<p><strong>ustomer Service Policy for [Your Military E-Commerce Website] - Army Store</strong></p>\r\n<p>At the Army Store, we are dedicated to providing exceptional customer service to our valued patrons. Our commitment is to ensure your satisfaction throughout the entire shopping experience. Please familiarize yourself with our Customer Service Policy outlined below.</p>\r\n<p><strong>1. Contact Information:</strong></p>\r\n<ul>\r\n<li>Our customer service team is available to assist you via email at [customer support email] and by phone at glastaborg@support.com.</li>\r\n<li>Business hours for customer support are 08:00&ndash;17:30.</li>\r\n<li>We strive to respond to emails and inquiries promptly, typically within [insert timeframe].</li>\r\n</ul>\r\n<p><strong>2. Product Information and Assistance:</strong></p>\r\n<ul>\r\n<li>Our website provides detailed product descriptions, specifications, and sizing information to help you make informed purchasing decisions.</li>\r\n<li>If you have any questions or need further assistance regarding our products, please reach out to our customer service team.</li>\r\n</ul>\r\n<p><strong>3. Order Inquiries:</strong></p>\r\n<ul>\r\n<li>For questions about your order status, tracking information, or any issues related to the order process, contact our customer support team with your order number and relevant details.</li>\r\n</ul>\r\n<p><strong>4. Returns and Exchanges:</strong></p>\r\n<ul>\r\n<li>Please refer to our Return and Exchange Policy for information on initiating returns or exchanges.</li>\r\n<li>Our customer service team is available to guide you through the return process and address any concerns you may have.</li>\r\n</ul>\r\n<p><strong>5. Feedback and Suggestions:</strong></p>\r\n<ul>\r\n<li>We welcome your feedback and suggestions, as they help us improve our services. Feel free to share your thoughts with our customer service team.</li>\r\n</ul>\r\n<p><strong>6. Privacy and Security:</strong></p>\r\n<ul>\r\n<li>Your privacy and the security of your personal information are of utmost importance to us. Our customer service team is committed to handling your information with care and in accordance with our privacy policy.</li>\r\n</ul>\r\n<p><strong>7. Problem Resolution:</strong></p>\r\n<ul>\r\n<li>In the rare event of any issues or concerns, our customer service team will work diligently to resolve the matter promptly and to your satisfaction.</li>\r\n</ul>\r\n<p><strong>8. Communication Channels:</strong></p>\r\n<ul>\r\n<li>We offer multiple communication channels for your convenience, including email, phone, and potentially live chat [if applicable]. Choose the method that suits you best.</li>\r\n</ul>\r\n<p><strong>9. Customer Education:</strong></p>\r\n<ul>\r\n<li>Our customer service team is here to assist and educate you on our products, services, and policies. Please don\'t hesitate to ask any questions or seek clarification.</li>\r\n</ul>\r\n<p><strong>10. Military Community Support:</strong></p>\r\n<ul>\r\n<li>We proudly support the military community. If you are a military service member or a family member, please inform our customer service team for potential special offers or considerations.</li>\r\n</ul>\r\n<p>By choosing [Your Military E-Commerce Website], you agree to adhere to the terms and conditions outlined in this Customer Service Policy. We appreciate your trust and patronage, and we look forward to serving you with the utmost dedication.</p>\r\n<p>Thank you for being a valued customer of the Army Store!</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"w-full pt-2 md:pt-0 dark:border-white/20 md:border-transparent md:dark:border-transparent md:w-[calc(100%-.5rem)]\"><form class=\"stretch mx-2 flex flex-row gap-3 last:mb-2 md:mx-4 md:last:mb-6 lg:mx-auto lg:max-w-2xl xl:max-w-3xl\">\r\n<div class=\"relative flex h-full flex-1 items-stretch md:flex-col\">\r\n<div class=\"flex w-full items-center\">\r\n<div class=\"overflow-hidden [&amp;:has(textarea:focus)]:border-token-border-xheavy [&amp;:has(textarea:focus)]:shadow-[0_2px_6px_rgba(0,0,0,.05)] flex flex-col w-full dark:border-token-border-heavy flex-grow relative border border-token-border-heavy dark:text-white rounded-2xl bg-white dark:bg-gray-800 shadow-[0_0_0_2px_rgba(255,255,255,0.95)] dark:shadow-[0_0_0_2px_rgba(52,53,65,0.95)]\">\r\n<div data-grammarly-part=\"button\">\r\n<div>\r\n<div>\r\n<div class=\"amkYk\">\r\n<div>\r\n<div class=\"ptGJG\">\r\n<div class=\"E_a24 EjMyF\">\r\n<div class=\"VNMHv BWwwG\">\r\n<div class=\"L704q\">\r\n<div data-purpose=\"animation-wrapper\">\r\n<div class=\"k1mI2\">\r\n<div class=\"BHWNr\">\r\n<div class=\"R7Ehf fspWv\">&nbsp;</div>\r\n</div>\r\n</div>\r\n<div class=\"fDZiE\" data-grammarly-part=\"gbuttonBadge\"></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div data-grammarly-part=\"highlights\">\r\n<div>\r\n<div>\r\n<div></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</form></div>\r\n</div>\r\n</div>', 'Customer Service', '', 'customer, service', 'en', 7),
(8, 'What\'s New', 'whats-new', '<div class=\"static-container\"><div class=\"mb-5\">What\'s New page content</div></div>', 'What\'s New', '', 'new', 'en', 8),
(9, 'Payment Policy', 'payment-policy', '<div class=\"static-container\">\r\n<div class=\"mb-5\">\r\n<p><strong>Payment Policy for Army Store</strong></p>\r\n<p>Thank you for choosing Army Store To ensure a seamless and secure shopping experience, please review our Payment Policy outlined below.</p>\r\n<p><strong>1. Accepted Payment Methods:</strong></p>\r\n<ul>\r\n<li>We accept the following payment methods:\r\n<ul>\r\n<li>Credit and Debit Cards (Visa, MasterCard, American Express, Discover)</li>\r\n<li>PayPal</li>\r\n<li>Mobile Money</li>\r\n</ul>\r\n</li>\r\n</ul>\r\n<p><strong>2. Secure Transactions:</strong></p>\r\n<ul>\r\n<li>Your financial security is our top priority. All transactions on our website are encrypted and securely processed to protect your personal and payment information.</li>\r\n</ul>\r\n<p><strong>3. Order Confirmation:</strong></p>\r\n<ul>\r\n<li>Upon successful completion of your order, you will receive an order confirmation email containing details of your purchase.</li>\r\n<li>Please review the order confirmation to ensure accuracy. If you notice any discrepancies, contact our customer support team immediately.</li>\r\n</ul>\r\n<p><strong>4. Currency:</strong></p>\r\n<ul>\r\n<li>All transactions are processed in [your chosen currency]. Please be aware that currency exchange rates may apply if you are using a credit/debit card in a different currency.</li>\r\n</ul>\r\n<p><strong>5. Payment Authorization:</strong></p>\r\n<ul>\r\n<li>By placing an order on our website, you authorize the payment for the total amount specified during the checkout process.</li>\r\n<li>If you choose to pay via credit or debit card, please ensure that you have sufficient funds available.</li>\r\n</ul>\r\n<p><strong>6. Payment Security:</strong></p>\r\n<ul>\r\n<li>We do not store your credit card information on our servers after the transaction is complete.</li>\r\n<li>In the event of a refund or additional charges, your payment information will be securely handled in compliance with relevant privacy and security standards.</li>\r\n</ul>\r\n<p><strong>7. Billing Information:</strong></p>\r\n<ul>\r\n<li>It is your responsibility to provide accurate and up-to-date billing information during the checkout process.</li>\r\n<li>Incorrect or incomplete billing information may result in delays or complications with your order.</li>\r\n</ul>\r\n<p><strong>8. Payment Verification:</strong></p>\r\n<ul>\r\n<li>For security purposes, we may conduct additional verification checks on certain orders. This may include confirming the legitimacy of the payment method and contacting you for further information.</li>\r\n</ul>\r\n<p><strong>9. Refunds and Returns:</strong></p>\r\n<ul>\r\n<li>Please refer to our Refund and Return Policy for information regarding the process of returns and refunds.</li>\r\n</ul>\r\n<p><strong>10. Contact Information:</strong></p>\r\n<ul>\r\n<li>For any questions or concerns related to payments, please contact our customer support team at [customer support email/phone number].</li>\r\n</ul>\r\n<p>By making a purchase on Army Store , you acknowledge and agree to comply with the terms and conditions outlined in this Payment Policy. We appreciate your trust and look forward to serving your military product needs.</p>\r\n<p>Thank you for choosing Army Store!</p>\r\n</div>\r\n</div>', 'Payment Policy', '', 'payment, policy', 'en', 9),
(10, 'Shipping Policy', 'shipping-policy', '<div class=\"static-container\">\r\n<div class=\"mb-5\">\r\n<p>Thank you for choosing the <span>Army Store</span> for your military-related product needs. We are committed to providing you with the best shopping experience, including transparent and reliable shipping services. Please take a moment to review our shipping policy.</p>\r\n<p><strong>1. Order Processing:</strong></p>\r\n<ul>\r\n<li>All orders are processed within 1-2 business days after payment confirmation.</li>\r\n<li>Orders placed on weekends or holidays will be processed on the next business day.</li>\r\n<li>We strive to ship orders as quickly as possible, but processing times may vary during peak seasons or promotions.</li>\r\n</ul>\r\n<p><strong>2. Shipping Methods:</strong></p>\r\n<ul>\r\n<li>We offer various shipping methods, including standard and expedited options.</li>\r\n<li>The availability of shipping methods may depend on the destination and the nature of the products being shipped.</li>\r\n</ul>\r\n<p><strong>3. Shipping Destinations:</strong></p>\r\n<ul>\r\n<li>We currently ship to addresses within [list of countries or regions]. For military addresses (APO/FPO), please make sure to provide accurate and complete information to ensure successful delivery.</li>\r\n</ul>\r\n<p><strong>4. Shipping Rates:</strong></p>\r\n<ul>\r\n<li>Shipping rates are calculated based on the weight of the products, the shipping method selected, and the destination.</li>\r\n<li>You can view the shipping cost during the checkout process before finalizing your purchase.</li>\r\n</ul>\r\n<p><strong>5. Military Addresses (APO/FPO):</strong></p>\r\n<ul>\r\n<li>We proudly support our military personnel by shipping to APO/FPO addresses.</li>\r\n<li>Please ensure accurate information is provided, including the unit, box, and APO/FPO/DPO address, to facilitate smooth delivery to military bases.</li>\r\n</ul>\r\n<p><strong>6. Tracking Information:</strong></p>\r\n<ul>\r\n<li>Once your order is shipped, you will receive an email with tracking information.</li>\r\n<li>Please use the provided tracking number to monitor the status of your shipment.</li>\r\n</ul>\r\n<p><strong>7. Customs and Import Duties:</strong></p>\r\n<ul>\r\n<li>Customers are responsible for any customs and import duties that may apply to their order.</li>\r\n<li>Customs policies vary by country, and customers should check with their local customs office for information on potential charges.</li>\r\n</ul>\r\n<p><strong>8. Delivery Timeframes:</strong></p>\r\n<ul>\r\n<li>Delivery times vary based on the shipping method chosen and the destination.</li>\r\n<li>While we make every effort to meet estimated delivery times, external factors, such as customs delays, may impact delivery schedules.</li>\r\n</ul>\r\n<p><strong>9. Lost or Stolen Packages:</strong></p>\r\n<ul>\r\n<li>In the unfortunate event that a package is lost or stolen during transit, please contact our customer support team. We will work with you to resolve the issue and, if necessary, initiate an investigation with the shipping carrier.</li>\r\n</ul>\r\n<p><strong>10. Contact Information:</strong></p>\r\n<p>For any questions or concerns regarding your order or shipping, please contact our customer support team at glastaborg@gmail.com/+233 205015724.</p>\r\n<p>By shopping with Army Store, you agree to abide by the terms and conditions outlined in this Shipping Policy. We appreciate your trust and look forward to serving your military product needs.</p>\r\n<p>Thank you for supporting our military community!</p>\r\n</div>\r\n</div>', 'Shipping Policy', '', 'shipping, policy', 'en', 10),
(11, 'Privacy Policy', 'privacy-policy', '<div class=\"static-container\">\r\n<div class=\"mb-5\">\r\n<p><strong>Privacy Policy for Army Store</strong></p>\r\n<p>Effective Date: January 20th, 2024</p>\r\n<p>Welcome to the Army Store (http://127.0.0.1:8000/). This privacy policy is designed to inform you about our practices regarding the collection, use, and disclosure of information that we may collect from users of our site.</p>\r\n<p><strong>1. Information We Collect:</strong></p>\r\n<p>a. <strong>Personal Information:</strong><br>We may collect personally identifiable information, such as your name, address, email address, and phone number, when you register on our site, place an order, or subscribe to our newsletter.</p>\r\n<p>b. <strong>Payment Information:</strong><br>To facilitate transactions on our site, we collect payment information, such as credit card details. This information is processed securely through trusted third-party payment gateways.</p>\r\n<p>c. <strong>Device Information:</strong><br>We may automatically collect information about the device you use to access our site, including your IP address, browser type, and operating system.</p>\r\n<p>d. <strong>Cookies:</strong><br>We use cookies to enhance your experience on our site. Cookies are small pieces of data stored on your device that help us track and analyze user behavior.</p>\r\n<p><strong>2. How We Use Your Information:</strong></p>\r\n<p>a. <strong>Order Processing:</strong><br>We use your personal information to process and fulfill orders, including shipping and billing.</p>\r\n<p>b. <strong>Communication:</strong><br>We may use your email address to send you order updates, newsletters, and promotional materials. You can opt out of these communications at any time.</p>\r\n<p>c. <strong>Improving User Experience:</strong><br>We analyze the collected data to improve our website\'s functionality, content, and user experience.</p>\r\n<p>3. <strong>Information Sharing:</strong></p>\r\n<p>a. <strong>Third-Party Service Providers:</strong><br>We may share your information with trusted third-party service providers, such as payment processors and shipping companies, to facilitate transactions and deliver orders.</p>\r\n<p>b. <strong>Legal Compliance:</strong><br>We may disclose your information when required by law or in response to legal requests.</p>\r\n<p>4. <strong>Security:</strong></p>\r\n<p>We implement reasonable security measures to protect your information from unauthorized access, disclosure, alteration, and destruction. However, no data transmission over the internet or electronic storage is entirely secure, and we cannot guarantee absolute security.</p>\r\n<p>5. <strong>Your Choices:</strong></p>\r\n<p>a. <strong>Opt-Out:</strong><br>You can opt out of receiving promotional emails by following the instructions provided in the email or contacting us directly.</p>\r\n<p>b. <strong>Cookies:</strong><br>You can disable cookies in your browser settings, but this may affect your ability to use some features of our Site.</p>\r\n<p>6. <strong>Children\'s Privacy:</strong></p>\r\n<p>Our site is not directed at individuals under the age of 18. We do not knowingly collect personal information from children. If you believe that we have inadvertently collected information from a child, please contact us immediately.</p>\r\n<p>7. <strong>Changes to this Privacy Policy:</strong></p>\r\n<p>We reserve the right to update or modify this privacy policy at any time. Changes will be effective immediately upon posting on the site, and your continued use of the site constitutes your acceptance of the revised policy.</p>\r\n<p>8. Contact Us:</p>\r\n<p>If you have any questions about this privacy policy or our data practices, please contact us at glastaborg@support.com.</p>\r\n<p>By using our Site, you agree to the terms of this Privacy Policy.</p>\r\n</div>\r\n</div>', 'Privacy Policy', '', 'privacy, policy', 'en', 11);

-- --------------------------------------------------------

--
-- Table structure for table `compare_items`
--

CREATE TABLE `compare_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `core_config`
--

CREATE TABLE `core_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `value` text NOT NULL,
  `channel_code` varchar(191) DEFAULT NULL,
  `locale_code` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `core_config`
--

INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES
(1, 'catalog.products.guest_checkout.allow_guest_checkout', '1', NULL, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(2, 'emails.general.notifications.emails.general.notifications.verification', '1', NULL, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(3, 'emails.general.notifications.emails.general.notifications.registration', '1', NULL, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(4, 'emails.general.notifications.emails.general.notifications.customer', '1', NULL, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(5, 'emails.general.notifications.emails.general.notifications.new_order', '1', NULL, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(6, 'emails.general.notifications.emails.general.notifications.new_admin', '1', NULL, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(7, 'emails.general.notifications.emails.general.notifications.new_invoice', '1', NULL, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(8, 'emails.general.notifications.emails.general.notifications.new_refund', '1', NULL, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(9, 'emails.general.notifications.emails.general.notifications.new_shipment', '1', NULL, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(10, 'emails.general.notifications.emails.general.notifications.new_inventory_source', '1', NULL, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(11, 'emails.general.notifications.emails.general.notifications.cancel_order', '1', NULL, NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(12, 'customer.settings.social_login.enable_facebook', '1', 'default', NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(13, 'customer.settings.social_login.enable_twitter', '1', 'default', NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(14, 'customer.settings.social_login.enable_google', '1', 'default', NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(15, 'customer.settings.social_login.enable_linkedin', '1', 'default', NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(16, 'customer.settings.social_login.enable_github', '1', 'default', NULL, '2024-01-28 05:00:29', '2024-01-28 05:00:29'),
(17, 'catalog.rich_snippets.products.enable', 'value', NULL, NULL, '2024-01-30 19:16:45', '2024-02-07 02:42:03'),
(18, 'catalog.rich_snippets.products.show_sku', 'value', NULL, NULL, '2024-01-30 19:16:45', '2024-02-07 02:42:03'),
(19, 'catalog.rich_snippets.products.show_weight', 'value', NULL, NULL, '2024-01-30 19:16:45', '2024-02-07 02:42:03'),
(20, 'catalog.rich_snippets.products.show_categories', 'value', NULL, NULL, '2024-01-30 19:16:45', '2024-02-07 02:42:04'),
(21, 'catalog.rich_snippets.products.show_images', 'value', NULL, NULL, '2024-01-30 19:16:45', '2024-02-07 02:42:04'),
(22, 'catalog.rich_snippets.products.show_reviews', 'value', NULL, NULL, '2024-01-30 19:16:45', '2024-02-07 02:42:04'),
(23, 'catalog.rich_snippets.products.show_ratings', 'value', NULL, NULL, '2024-01-30 19:16:45', '2024-02-07 02:42:04'),
(24, 'catalog.rich_snippets.products.show_offers', 'value', NULL, NULL, '2024-01-30 19:16:45', '2024-02-07 02:42:04'),
(25, 'catalog.rich_snippets.categories.enable', 'value', NULL, NULL, '2024-01-30 19:16:45', '2024-02-06 19:01:39'),
(26, 'catalog.rich_snippets.categories.show_search_input_field', 'value', NULL, NULL, '2024-01-30 19:16:46', '2024-02-06 19:01:39'),
(27, 'emails.configure.email_settings.sender_name', 'armystore', 'default', NULL, '2024-02-02 16:59:10', '2024-02-02 16:59:10'),
(28, 'emails.configure.email_settings.shop_email_from', 'shop@example.com', 'default', NULL, '2024-02-02 16:59:10', '2024-02-02 16:59:10'),
(29, 'emails.configure.email_settings.admin_name', 'glastaborg', 'default', NULL, '2024-02-02 16:59:10', '2024-02-02 16:59:10'),
(30, 'emails.configure.email_settings.admin_email', 'glastaborg@support.com', 'default', NULL, '2024-02-02 16:59:10', '2024-02-02 16:59:10'),
(31, 'taxes.catalogue.pricing.tax_inclusive', 'on', NULL, NULL, '2024-02-06 19:02:50', '2024-02-06 19:02:50'),
(32, 'taxes.catalogue.default_location_calculation.country', 'GH', NULL, NULL, '2024-02-06 19:02:50', '2024-02-06 19:02:50'),
(33, 'taxes.catalogue.default_location_calculation.state', '', NULL, NULL, '2024-02-06 19:02:50', '2024-02-06 19:02:50'),
(34, 'taxes.catalogue.default_location_calculation.post_code', '', NULL, NULL, '2024-02-06 19:02:51', '2024-02-06 19:02:51');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AX', 'Åland Islands'),
(3, 'AL', 'Albania'),
(4, 'DZ', 'Algeria'),
(5, 'AS', 'American Samoa'),
(6, 'AD', 'Andorra'),
(7, 'AO', 'Angola'),
(8, 'AI', 'Anguilla'),
(9, 'AQ', 'Antarctica'),
(10, 'AG', 'Antigua & Barbuda'),
(11, 'AR', 'Argentina'),
(12, 'AM', 'Armenia'),
(13, 'AW', 'Aruba'),
(14, 'AC', 'Ascension Island'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia & Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BR', 'Brazil'),
(32, 'IO', 'British Indian Ocean Territory'),
(33, 'VG', 'British Virgin Islands'),
(34, 'BN', 'Brunei'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CA', 'Canada'),
(41, 'IC', 'Canary Islands'),
(42, 'CV', 'Cape Verde'),
(43, 'BQ', 'Caribbean Netherlands'),
(44, 'KY', 'Cayman Islands'),
(45, 'CF', 'Central African Republic'),
(46, 'EA', 'Ceuta & Melilla'),
(47, 'TD', 'Chad'),
(48, 'CL', 'Chile'),
(49, 'CN', 'China'),
(50, 'CX', 'Christmas Island'),
(51, 'CC', 'Cocos (Keeling) Islands'),
(52, 'CO', 'Colombia'),
(53, 'KM', 'Comoros'),
(54, 'CG', 'Congo - Brazzaville'),
(55, 'CD', 'Congo - Kinshasa'),
(56, 'CK', 'Cook Islands'),
(57, 'CR', 'Costa Rica'),
(58, 'CI', 'Côte d’Ivoire'),
(59, 'HR', 'Croatia'),
(60, 'CU', 'Cuba'),
(61, 'CW', 'Curaçao'),
(62, 'CY', 'Cyprus'),
(63, 'CZ', 'Czechia'),
(64, 'DK', 'Denmark'),
(65, 'DG', 'Diego Garcia'),
(66, 'DJ', 'Djibouti'),
(67, 'DM', 'Dominica'),
(68, 'DO', 'Dominican Republic'),
(69, 'EC', 'Ecuador'),
(70, 'EG', 'Egypt'),
(71, 'SV', 'El Salvador'),
(72, 'GQ', 'Equatorial Guinea'),
(73, 'ER', 'Eritrea'),
(74, 'EE', 'Estonia'),
(75, 'ET', 'Ethiopia'),
(76, 'EZ', 'Eurozone'),
(77, 'FK', 'Falkland Islands'),
(78, 'FO', 'Faroe Islands'),
(79, 'FJ', 'Fiji'),
(80, 'FI', 'Finland'),
(81, 'FR', 'France'),
(82, 'GF', 'French Guiana'),
(83, 'PF', 'French Polynesia'),
(84, 'TF', 'French Southern Territories'),
(85, 'GA', 'Gabon'),
(86, 'GM', 'Gambia'),
(87, 'GE', 'Georgia'),
(88, 'DE', 'Germany'),
(89, 'GH', 'Ghana'),
(90, 'GI', 'Gibraltar'),
(91, 'GR', 'Greece'),
(92, 'GL', 'Greenland'),
(93, 'GD', 'Grenada'),
(94, 'GP', 'Guadeloupe'),
(95, 'GU', 'Guam'),
(96, 'GT', 'Guatemala'),
(97, 'GG', 'Guernsey'),
(98, 'GN', 'Guinea'),
(99, 'GW', 'Guinea-Bissau'),
(100, 'GY', 'Guyana'),
(101, 'HT', 'Haiti'),
(102, 'HN', 'Honduras'),
(103, 'HK', 'Hong Kong SAR China'),
(104, 'HU', 'Hungary'),
(105, 'IS', 'Iceland'),
(106, 'IN', 'India'),
(107, 'ID', 'Indonesia'),
(108, 'IR', 'Iran'),
(109, 'IQ', 'Iraq'),
(110, 'IE', 'Ireland'),
(111, 'IM', 'Isle of Man'),
(112, 'IL', 'Israel'),
(113, 'IT', 'Italy'),
(114, 'JM', 'Jamaica'),
(115, 'JP', 'Japan'),
(116, 'JE', 'Jersey'),
(117, 'JO', 'Jordan'),
(118, 'KZ', 'Kazakhstan'),
(119, 'KE', 'Kenya'),
(120, 'KI', 'Kiribati'),
(121, 'XK', 'Kosovo'),
(122, 'KW', 'Kuwait'),
(123, 'KG', 'Kyrgyzstan'),
(124, 'LA', 'Laos'),
(125, 'LV', 'Latvia'),
(126, 'LB', 'Lebanon'),
(127, 'LS', 'Lesotho'),
(128, 'LR', 'Liberia'),
(129, 'LY', 'Libya'),
(130, 'LI', 'Liechtenstein'),
(131, 'LT', 'Lithuania'),
(132, 'LU', 'Luxembourg'),
(133, 'MO', 'Macau SAR China'),
(134, 'MK', 'Macedonia'),
(135, 'MG', 'Madagascar'),
(136, 'MW', 'Malawi'),
(137, 'MY', 'Malaysia'),
(138, 'MV', 'Maldives'),
(139, 'ML', 'Mali'),
(140, 'MT', 'Malta'),
(141, 'MH', 'Marshall Islands'),
(142, 'MQ', 'Martinique'),
(143, 'MR', 'Mauritania'),
(144, 'MU', 'Mauritius'),
(145, 'YT', 'Mayotte'),
(146, 'MX', 'Mexico'),
(147, 'FM', 'Micronesia'),
(148, 'MD', 'Moldova'),
(149, 'MC', 'Monaco'),
(150, 'MN', 'Mongolia'),
(151, 'ME', 'Montenegro'),
(152, 'MS', 'Montserrat'),
(153, 'MA', 'Morocco'),
(154, 'MZ', 'Mozambique'),
(155, 'MM', 'Myanmar (Burma)'),
(156, 'NA', 'Namibia'),
(157, 'NR', 'Nauru'),
(158, 'NP', 'Nepal'),
(159, 'NL', 'Netherlands'),
(160, 'NC', 'New Caledonia'),
(161, 'NZ', 'New Zealand'),
(162, 'NI', 'Nicaragua'),
(163, 'NE', 'Niger'),
(164, 'NG', 'Nigeria'),
(165, 'NU', 'Niue'),
(166, 'NF', 'Norfolk Island'),
(167, 'KP', 'North Korea'),
(168, 'MP', 'Northern Mariana Islands'),
(169, 'NO', 'Norway'),
(170, 'OM', 'Oman'),
(171, 'PK', 'Pakistan'),
(172, 'PW', 'Palau'),
(173, 'PS', 'Palestinian Territories'),
(174, 'PA', 'Panama'),
(175, 'PG', 'Papua New Guinea'),
(176, 'PY', 'Paraguay'),
(177, 'PE', 'Peru'),
(178, 'PH', 'Philippines'),
(179, 'PN', 'Pitcairn Islands'),
(180, 'PL', 'Poland'),
(181, 'PT', 'Portugal'),
(182, 'PR', 'Puerto Rico'),
(183, 'QA', 'Qatar'),
(184, 'RE', 'Réunion'),
(185, 'RO', 'Romania'),
(186, 'RU', 'Russia'),
(187, 'RW', 'Rwanda'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'São Tomé & Príncipe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SX', 'Sint Maarten'),
(198, 'SK', 'Slovakia'),
(199, 'SI', 'Slovenia'),
(200, 'SB', 'Solomon Islands'),
(201, 'SO', 'Somalia'),
(202, 'ZA', 'South Africa'),
(203, 'GS', 'South Georgia & South Sandwich Islands'),
(204, 'KR', 'South Korea'),
(205, 'SS', 'South Sudan'),
(206, 'ES', 'Spain'),
(207, 'LK', 'Sri Lanka'),
(208, 'BL', 'St. Barthélemy'),
(209, 'SH', 'St. Helena'),
(210, 'KN', 'St. Kitts & Nevis'),
(211, 'LC', 'St. Lucia'),
(212, 'MF', 'St. Martin'),
(213, 'PM', 'St. Pierre & Miquelon'),
(214, 'VC', 'St. Vincent & Grenadines'),
(215, 'SD', 'Sudan'),
(216, 'SR', 'Suriname'),
(217, 'SJ', 'Svalbard & Jan Mayen'),
(218, 'SZ', 'Swaziland'),
(219, 'SE', 'Sweden'),
(220, 'CH', 'Switzerland'),
(221, 'SY', 'Syria'),
(222, 'TW', 'Taiwan'),
(223, 'TJ', 'Tajikistan'),
(224, 'TZ', 'Tanzania'),
(225, 'TH', 'Thailand'),
(226, 'TL', 'Timor-Leste'),
(227, 'TG', 'Togo'),
(228, 'TK', 'Tokelau'),
(229, 'TO', 'Tonga'),
(230, 'TT', 'Trinidad & Tobago'),
(231, 'TA', 'Tristan da Cunha'),
(232, 'TN', 'Tunisia'),
(233, 'TR', 'Turkey'),
(234, 'TM', 'Turkmenistan'),
(235, 'TC', 'Turks & Caicos Islands'),
(236, 'TV', 'Tuvalu'),
(237, 'UM', 'U.S. Outlying Islands'),
(238, 'VI', 'U.S. Virgin Islands'),
(239, 'UG', 'Uganda'),
(240, 'UA', 'Ukraine'),
(241, 'AE', 'United Arab Emirates'),
(242, 'GB', 'United Kingdom'),
(243, 'UN', 'United Nations'),
(244, 'US', 'United States'),
(245, 'UY', 'Uruguay'),
(246, 'UZ', 'Uzbekistan'),
(247, 'VU', 'Vanuatu'),
(248, 'VA', 'Vatican City'),
(249, 'VE', 'Venezuela'),
(250, 'VN', 'Vietnam'),
(251, 'WF', 'Wallis & Futuna'),
(252, 'EH', 'Western Sahara'),
(253, 'YE', 'Yemen'),
(254, 'ZM', 'Zambia'),
(255, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `country_states`
--

CREATE TABLE `country_states` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `country_code` varchar(191) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL,
  `default_name` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `country_states`
--

INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES
(1, 244, 'US', 'AL', 'Alabama'),
(2, 244, 'US', 'AK', 'Alaska'),
(3, 244, 'US', 'AS', 'American Samoa'),
(4, 244, 'US', 'AZ', 'Arizona'),
(5, 244, 'US', 'AR', 'Arkansas'),
(6, 244, 'US', 'AE', 'Armed Forces Africa'),
(7, 244, 'US', 'AA', 'Armed Forces Americas'),
(8, 244, 'US', 'AE', 'Armed Forces Canada'),
(9, 244, 'US', 'AE', 'Armed Forces Europe'),
(10, 244, 'US', 'AE', 'Armed Forces Middle East'),
(11, 244, 'US', 'AP', 'Armed Forces Pacific'),
(12, 244, 'US', 'CA', 'California'),
(13, 244, 'US', 'CO', 'Colorado'),
(14, 244, 'US', 'CT', 'Connecticut'),
(15, 244, 'US', 'DE', 'Delaware'),
(16, 244, 'US', 'DC', 'District of Columbia'),
(17, 244, 'US', 'FM', 'Federated States Of Micronesia'),
(18, 244, 'US', 'FL', 'Florida'),
(19, 244, 'US', 'GA', 'Georgia'),
(20, 244, 'US', 'GU', 'Guam'),
(21, 244, 'US', 'HI', 'Hawaii'),
(22, 244, 'US', 'ID', 'Idaho'),
(23, 244, 'US', 'IL', 'Illinois'),
(24, 244, 'US', 'IN', 'Indiana'),
(25, 244, 'US', 'IA', 'Iowa'),
(26, 244, 'US', 'KS', 'Kansas'),
(27, 244, 'US', 'KY', 'Kentucky'),
(28, 244, 'US', 'LA', 'Louisiana'),
(29, 244, 'US', 'ME', 'Maine'),
(30, 244, 'US', 'MH', 'Marshall Islands'),
(31, 244, 'US', 'MD', 'Maryland'),
(32, 244, 'US', 'MA', 'Massachusetts'),
(33, 244, 'US', 'MI', 'Michigan'),
(34, 244, 'US', 'MN', 'Minnesota'),
(35, 244, 'US', 'MS', 'Mississippi'),
(36, 244, 'US', 'MO', 'Missouri'),
(37, 244, 'US', 'MT', 'Montana'),
(38, 244, 'US', 'NE', 'Nebraska'),
(39, 244, 'US', 'NV', 'Nevada'),
(40, 244, 'US', 'NH', 'New Hampshire'),
(41, 244, 'US', 'NJ', 'New Jersey'),
(42, 244, 'US', 'NM', 'New Mexico'),
(43, 244, 'US', 'NY', 'New York'),
(44, 244, 'US', 'NC', 'North Carolina'),
(45, 244, 'US', 'ND', 'North Dakota'),
(46, 244, 'US', 'MP', 'Northern Mariana Islands'),
(47, 244, 'US', 'OH', 'Ohio'),
(48, 244, 'US', 'OK', 'Oklahoma'),
(49, 244, 'US', 'OR', 'Oregon'),
(50, 244, 'US', 'PW', 'Palau'),
(51, 244, 'US', 'PA', 'Pennsylvania'),
(52, 244, 'US', 'PR', 'Puerto Rico'),
(53, 244, 'US', 'RI', 'Rhode Island'),
(54, 244, 'US', 'SC', 'South Carolina'),
(55, 244, 'US', 'SD', 'South Dakota'),
(56, 244, 'US', 'TN', 'Tennessee'),
(57, 244, 'US', 'TX', 'Texas'),
(58, 244, 'US', 'UT', 'Utah'),
(59, 244, 'US', 'VT', 'Vermont'),
(60, 244, 'US', 'VI', 'Virgin Islands'),
(61, 244, 'US', 'VA', 'Virginia'),
(62, 244, 'US', 'WA', 'Washington'),
(63, 244, 'US', 'WV', 'West Virginia'),
(64, 244, 'US', 'WI', 'Wisconsin'),
(65, 244, 'US', 'WY', 'Wyoming'),
(66, 40, 'CA', 'AB', 'Alberta'),
(67, 40, 'CA', 'BC', 'British Columbia'),
(68, 40, 'CA', 'MB', 'Manitoba'),
(69, 40, 'CA', 'NL', 'Newfoundland and Labrador'),
(70, 40, 'CA', 'NB', 'New Brunswick'),
(71, 40, 'CA', 'NS', 'Nova Scotia'),
(72, 40, 'CA', 'NT', 'Northwest Territories'),
(73, 40, 'CA', 'NU', 'Nunavut'),
(74, 40, 'CA', 'ON', 'Ontario'),
(75, 40, 'CA', 'PE', 'Prince Edward Island'),
(76, 40, 'CA', 'QC', 'Quebec'),
(77, 40, 'CA', 'SK', 'Saskatchewan'),
(78, 40, 'CA', 'YT', 'Yukon Territory'),
(79, 88, 'DE', 'NDS', 'Niedersachsen'),
(80, 88, 'DE', 'BAW', 'Baden-Württemberg'),
(81, 88, 'DE', 'BAY', 'Bayern'),
(82, 88, 'DE', 'BER', 'Berlin'),
(83, 88, 'DE', 'BRG', 'Brandenburg'),
(84, 88, 'DE', 'BRE', 'Bremen'),
(85, 88, 'DE', 'HAM', 'Hamburg'),
(86, 88, 'DE', 'HES', 'Hessen'),
(87, 88, 'DE', 'MEC', 'Mecklenburg-Vorpommern'),
(88, 88, 'DE', 'NRW', 'Nordrhein-Westfalen'),
(89, 88, 'DE', 'RHE', 'Rheinland-Pfalz'),
(90, 88, 'DE', 'SAR', 'Saarland'),
(91, 88, 'DE', 'SAS', 'Sachsen'),
(92, 88, 'DE', 'SAC', 'Sachsen-Anhalt'),
(93, 88, 'DE', 'SCN', 'Schleswig-Holstein'),
(94, 88, 'DE', 'THE', 'Thüringen'),
(95, 16, 'AT', 'WI', 'Wien'),
(96, 16, 'AT', 'NO', 'Niederösterreich'),
(97, 16, 'AT', 'OO', 'Oberösterreich'),
(98, 16, 'AT', 'SB', 'Salzburg'),
(99, 16, 'AT', 'KN', 'Kärnten'),
(100, 16, 'AT', 'ST', 'Steiermark'),
(101, 16, 'AT', 'TI', 'Tirol'),
(102, 16, 'AT', 'BL', 'Burgenland'),
(103, 16, 'AT', 'VB', 'Vorarlberg'),
(104, 220, 'CH', 'AG', 'Aargau'),
(105, 220, 'CH', 'AI', 'Appenzell Innerrhoden'),
(106, 220, 'CH', 'AR', 'Appenzell Ausserrhoden'),
(107, 220, 'CH', 'BE', 'Bern'),
(108, 220, 'CH', 'BL', 'Basel-Landschaft'),
(109, 220, 'CH', 'BS', 'Basel-Stadt'),
(110, 220, 'CH', 'FR', 'Freiburg'),
(111, 220, 'CH', 'GE', 'Genf'),
(112, 220, 'CH', 'GL', 'Glarus'),
(113, 220, 'CH', 'GR', 'Graubünden'),
(114, 220, 'CH', 'JU', 'Jura'),
(115, 220, 'CH', 'LU', 'Luzern'),
(116, 220, 'CH', 'NE', 'Neuenburg'),
(117, 220, 'CH', 'NW', 'Nidwalden'),
(118, 220, 'CH', 'OW', 'Obwalden'),
(119, 220, 'CH', 'SG', 'St. Gallen'),
(120, 220, 'CH', 'SH', 'Schaffhausen'),
(121, 220, 'CH', 'SO', 'Solothurn'),
(122, 220, 'CH', 'SZ', 'Schwyz'),
(123, 220, 'CH', 'TG', 'Thurgau'),
(124, 220, 'CH', 'TI', 'Tessin'),
(125, 220, 'CH', 'UR', 'Uri'),
(126, 220, 'CH', 'VD', 'Waadt'),
(127, 220, 'CH', 'VS', 'Wallis'),
(128, 220, 'CH', 'ZG', 'Zug'),
(129, 220, 'CH', 'ZH', 'Zürich'),
(130, 206, 'ES', 'A Coruсa', 'A Coruña'),
(131, 206, 'ES', 'Alava', 'Alava'),
(132, 206, 'ES', 'Albacete', 'Albacete'),
(133, 206, 'ES', 'Alicante', 'Alicante'),
(134, 206, 'ES', 'Almeria', 'Almeria'),
(135, 206, 'ES', 'Asturias', 'Asturias'),
(136, 206, 'ES', 'Avila', 'Avila'),
(137, 206, 'ES', 'Badajoz', 'Badajoz'),
(138, 206, 'ES', 'Baleares', 'Baleares'),
(139, 206, 'ES', 'Barcelona', 'Barcelona'),
(140, 206, 'ES', 'Burgos', 'Burgos'),
(141, 206, 'ES', 'Caceres', 'Caceres'),
(142, 206, 'ES', 'Cadiz', 'Cadiz'),
(143, 206, 'ES', 'Cantabria', 'Cantabria'),
(144, 206, 'ES', 'Castellon', 'Castellon'),
(145, 206, 'ES', 'Ceuta', 'Ceuta'),
(146, 206, 'ES', 'Ciudad Real', 'Ciudad Real'),
(147, 206, 'ES', 'Cordoba', 'Cordoba'),
(148, 206, 'ES', 'Cuenca', 'Cuenca'),
(149, 206, 'ES', 'Girona', 'Girona'),
(150, 206, 'ES', 'Granada', 'Granada'),
(151, 206, 'ES', 'Guadalajara', 'Guadalajara'),
(152, 206, 'ES', 'Guipuzcoa', 'Guipuzcoa'),
(153, 206, 'ES', 'Huelva', 'Huelva'),
(154, 206, 'ES', 'Huesca', 'Huesca'),
(155, 206, 'ES', 'Jaen', 'Jaen'),
(156, 206, 'ES', 'La Rioja', 'La Rioja'),
(157, 206, 'ES', 'Las Palmas', 'Las Palmas'),
(158, 206, 'ES', 'Leon', 'Leon'),
(159, 206, 'ES', 'Lleida', 'Lleida'),
(160, 206, 'ES', 'Lugo', 'Lugo'),
(161, 206, 'ES', 'Madrid', 'Madrid'),
(162, 206, 'ES', 'Malaga', 'Malaga'),
(163, 206, 'ES', 'Melilla', 'Melilla'),
(164, 206, 'ES', 'Murcia', 'Murcia'),
(165, 206, 'ES', 'Navarra', 'Navarra'),
(166, 206, 'ES', 'Ourense', 'Ourense'),
(167, 206, 'ES', 'Palencia', 'Palencia'),
(168, 206, 'ES', 'Pontevedra', 'Pontevedra'),
(169, 206, 'ES', 'Salamanca', 'Salamanca'),
(170, 206, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(171, 206, 'ES', 'Segovia', 'Segovia'),
(172, 206, 'ES', 'Sevilla', 'Sevilla'),
(173, 206, 'ES', 'Soria', 'Soria'),
(174, 206, 'ES', 'Tarragona', 'Tarragona'),
(175, 206, 'ES', 'Teruel', 'Teruel'),
(176, 206, 'ES', 'Toledo', 'Toledo'),
(177, 206, 'ES', 'Valencia', 'Valencia'),
(178, 206, 'ES', 'Valladolid', 'Valladolid'),
(179, 206, 'ES', 'Vizcaya', 'Vizcaya'),
(180, 206, 'ES', 'Zamora', 'Zamora'),
(181, 206, 'ES', 'Zaragoza', 'Zaragoza'),
(182, 81, 'FR', '1', 'Ain'),
(183, 81, 'FR', '2', 'Aisne'),
(184, 81, 'FR', '3', 'Allier'),
(185, 81, 'FR', '4', 'Alpes-de-Haute-Provence'),
(186, 81, 'FR', '5', 'Hautes-Alpes'),
(187, 81, 'FR', '6', 'Alpes-Maritimes'),
(188, 81, 'FR', '7', 'Ardèche'),
(189, 81, 'FR', '8', 'Ardennes'),
(190, 81, 'FR', '9', 'Ariège'),
(191, 81, 'FR', '10', 'Aube'),
(192, 81, 'FR', '11', 'Aude'),
(193, 81, 'FR', '12', 'Aveyron'),
(194, 81, 'FR', '13', 'Bouches-du-Rhône'),
(195, 81, 'FR', '14', 'Calvados'),
(196, 81, 'FR', '15', 'Cantal'),
(197, 81, 'FR', '16', 'Charente'),
(198, 81, 'FR', '17', 'Charente-Maritime'),
(199, 81, 'FR', '18', 'Cher'),
(200, 81, 'FR', '19', 'Corrèze'),
(201, 81, 'FR', '2A', 'Corse-du-Sud'),
(202, 81, 'FR', '2B', 'Haute-Corse'),
(203, 81, 'FR', '21', 'Côte-d\'Or'),
(204, 81, 'FR', '22', 'Côtes-d\'Armor'),
(205, 81, 'FR', '23', 'Creuse'),
(206, 81, 'FR', '24', 'Dordogne'),
(207, 81, 'FR', '25', 'Doubs'),
(208, 81, 'FR', '26', 'Drôme'),
(209, 81, 'FR', '27', 'Eure'),
(210, 81, 'FR', '28', 'Eure-et-Loir'),
(211, 81, 'FR', '29', 'Finistère'),
(212, 81, 'FR', '30', 'Gard'),
(213, 81, 'FR', '31', 'Haute-Garonne'),
(214, 81, 'FR', '32', 'Gers'),
(215, 81, 'FR', '33', 'Gironde'),
(216, 81, 'FR', '34', 'Hérault'),
(217, 81, 'FR', '35', 'Ille-et-Vilaine'),
(218, 81, 'FR', '36', 'Indre'),
(219, 81, 'FR', '37', 'Indre-et-Loire'),
(220, 81, 'FR', '38', 'Isère'),
(221, 81, 'FR', '39', 'Jura'),
(222, 81, 'FR', '40', 'Landes'),
(223, 81, 'FR', '41', 'Loir-et-Cher'),
(224, 81, 'FR', '42', 'Loire'),
(225, 81, 'FR', '43', 'Haute-Loire'),
(226, 81, 'FR', '44', 'Loire-Atlantique'),
(227, 81, 'FR', '45', 'Loiret'),
(228, 81, 'FR', '46', 'Lot'),
(229, 81, 'FR', '47', 'Lot-et-Garonne'),
(230, 81, 'FR', '48', 'Lozère'),
(231, 81, 'FR', '49', 'Maine-et-Loire'),
(232, 81, 'FR', '50', 'Manche'),
(233, 81, 'FR', '51', 'Marne'),
(234, 81, 'FR', '52', 'Haute-Marne'),
(235, 81, 'FR', '53', 'Mayenne'),
(236, 81, 'FR', '54', 'Meurthe-et-Moselle'),
(237, 81, 'FR', '55', 'Meuse'),
(238, 81, 'FR', '56', 'Morbihan'),
(239, 81, 'FR', '57', 'Moselle'),
(240, 81, 'FR', '58', 'Nièvre'),
(241, 81, 'FR', '59', 'Nord'),
(242, 81, 'FR', '60', 'Oise'),
(243, 81, 'FR', '61', 'Orne'),
(244, 81, 'FR', '62', 'Pas-de-Calais'),
(245, 81, 'FR', '63', 'Puy-de-Dôme'),
(246, 81, 'FR', '64', 'Pyrénées-Atlantiques'),
(247, 81, 'FR', '65', 'Hautes-Pyrénées'),
(248, 81, 'FR', '66', 'Pyrénées-Orientales'),
(249, 81, 'FR', '67', 'Bas-Rhin'),
(250, 81, 'FR', '68', 'Haut-Rhin'),
(251, 81, 'FR', '69', 'Rhône'),
(252, 81, 'FR', '70', 'Haute-Saône'),
(253, 81, 'FR', '71', 'Saône-et-Loire'),
(254, 81, 'FR', '72', 'Sarthe'),
(255, 81, 'FR', '73', 'Savoie'),
(256, 81, 'FR', '74', 'Haute-Savoie'),
(257, 81, 'FR', '75', 'Paris'),
(258, 81, 'FR', '76', 'Seine-Maritime'),
(259, 81, 'FR', '77', 'Seine-et-Marne'),
(260, 81, 'FR', '78', 'Yvelines'),
(261, 81, 'FR', '79', 'Deux-Sèvres'),
(262, 81, 'FR', '80', 'Somme'),
(263, 81, 'FR', '81', 'Tarn'),
(264, 81, 'FR', '82', 'Tarn-et-Garonne'),
(265, 81, 'FR', '83', 'Var'),
(266, 81, 'FR', '84', 'Vaucluse'),
(267, 81, 'FR', '85', 'Vendée'),
(268, 81, 'FR', '86', 'Vienne'),
(269, 81, 'FR', '87', 'Haute-Vienne'),
(270, 81, 'FR', '88', 'Vosges'),
(271, 81, 'FR', '89', 'Yonne'),
(272, 81, 'FR', '90', 'Territoire-de-Belfort'),
(273, 81, 'FR', '91', 'Essonne'),
(274, 81, 'FR', '92', 'Hauts-de-Seine'),
(275, 81, 'FR', '93', 'Seine-Saint-Denis'),
(276, 81, 'FR', '94', 'Val-de-Marne'),
(277, 81, 'FR', '95', 'Val-d\'Oise'),
(278, 185, 'RO', 'AB', 'Alba'),
(279, 185, 'RO', 'AR', 'Arad'),
(280, 185, 'RO', 'AG', 'Argeş'),
(281, 185, 'RO', 'BC', 'Bacău'),
(282, 185, 'RO', 'BH', 'Bihor'),
(283, 185, 'RO', 'BN', 'Bistriţa-Năsăud'),
(284, 185, 'RO', 'BT', 'Botoşani'),
(285, 185, 'RO', 'BV', 'Braşov'),
(286, 185, 'RO', 'BR', 'Brăila'),
(287, 185, 'RO', 'B', 'Bucureşti'),
(288, 185, 'RO', 'BZ', 'Buzău'),
(289, 185, 'RO', 'CS', 'Caraş-Severin'),
(290, 185, 'RO', 'CL', 'Călăraşi'),
(291, 185, 'RO', 'CJ', 'Cluj'),
(292, 185, 'RO', 'CT', 'Constanţa'),
(293, 185, 'RO', 'CV', 'Covasna'),
(294, 185, 'RO', 'DB', 'Dâmboviţa'),
(295, 185, 'RO', 'DJ', 'Dolj'),
(296, 185, 'RO', 'GL', 'Galaţi'),
(297, 185, 'RO', 'GR', 'Giurgiu'),
(298, 185, 'RO', 'GJ', 'Gorj'),
(299, 185, 'RO', 'HR', 'Harghita'),
(300, 185, 'RO', 'HD', 'Hunedoara'),
(301, 185, 'RO', 'IL', 'Ialomiţa'),
(302, 185, 'RO', 'IS', 'Iaşi'),
(303, 185, 'RO', 'IF', 'Ilfov'),
(304, 185, 'RO', 'MM', 'Maramureş'),
(305, 185, 'RO', 'MH', 'Mehedinţi'),
(306, 185, 'RO', 'MS', 'Mureş'),
(307, 185, 'RO', 'NT', 'Neamţ'),
(308, 185, 'RO', 'OT', 'Olt'),
(309, 185, 'RO', 'PH', 'Prahova'),
(310, 185, 'RO', 'SM', 'Satu-Mare'),
(311, 185, 'RO', 'SJ', 'Sălaj'),
(312, 185, 'RO', 'SB', 'Sibiu'),
(313, 185, 'RO', 'SV', 'Suceava'),
(314, 185, 'RO', 'TR', 'Teleorman'),
(315, 185, 'RO', 'TM', 'Timiş'),
(316, 185, 'RO', 'TL', 'Tulcea'),
(317, 185, 'RO', 'VS', 'Vaslui'),
(318, 185, 'RO', 'VL', 'Vâlcea'),
(319, 185, 'RO', 'VN', 'Vrancea'),
(320, 80, 'FI', 'Lappi', 'Lappi'),
(321, 80, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa'),
(322, 80, 'FI', 'Kainuu', 'Kainuu'),
(323, 80, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala'),
(324, 80, 'FI', 'Pohjois-Savo', 'Pohjois-Savo'),
(325, 80, 'FI', 'Etelä-Savo', 'Etelä-Savo'),
(326, 80, 'FI', 'Etelä-Pohjanmaa', 'Etelä-Pohjanmaa'),
(327, 80, 'FI', 'Pohjanmaa', 'Pohjanmaa'),
(328, 80, 'FI', 'Pirkanmaa', 'Pirkanmaa'),
(329, 80, 'FI', 'Satakunta', 'Satakunta'),
(330, 80, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa'),
(331, 80, 'FI', 'Keski-Suomi', 'Keski-Suomi'),
(332, 80, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi'),
(333, 80, 'FI', 'Etelä-Karjala', 'Etelä-Karjala'),
(334, 80, 'FI', 'Päijät-Häme', 'Päijät-Häme'),
(335, 80, 'FI', 'Kanta-Häme', 'Kanta-Häme'),
(336, 80, 'FI', 'Uusimaa', 'Uusimaa'),
(337, 80, 'FI', 'Itä-Uusimaa', 'Itä-Uusimaa'),
(338, 80, 'FI', 'Kymenlaakso', 'Kymenlaakso'),
(339, 80, 'FI', 'Ahvenanmaa', 'Ahvenanmaa'),
(340, 74, 'EE', 'EE-37', 'Harjumaa'),
(341, 74, 'EE', 'EE-39', 'Hiiumaa'),
(342, 74, 'EE', 'EE-44', 'Ida-Virumaa'),
(343, 74, 'EE', 'EE-49', 'Jõgevamaa'),
(344, 74, 'EE', 'EE-51', 'Järvamaa'),
(345, 74, 'EE', 'EE-57', 'Läänemaa'),
(346, 74, 'EE', 'EE-59', 'Lääne-Virumaa'),
(347, 74, 'EE', 'EE-65', 'Põlvamaa'),
(348, 74, 'EE', 'EE-67', 'Pärnumaa'),
(349, 74, 'EE', 'EE-70', 'Raplamaa'),
(350, 74, 'EE', 'EE-74', 'Saaremaa'),
(351, 74, 'EE', 'EE-78', 'Tartumaa'),
(352, 74, 'EE', 'EE-82', 'Valgamaa'),
(353, 74, 'EE', 'EE-84', 'Viljandimaa'),
(354, 74, 'EE', 'EE-86', 'Võrumaa'),
(355, 125, 'LV', 'LV-DGV', 'Daugavpils'),
(356, 125, 'LV', 'LV-JEL', 'Jelgava'),
(357, 125, 'LV', 'Jēkabpils', 'Jēkabpils'),
(358, 125, 'LV', 'LV-JUR', 'Jūrmala'),
(359, 125, 'LV', 'LV-LPX', 'Liepāja'),
(360, 125, 'LV', 'LV-LE', 'Liepājas novads'),
(361, 125, 'LV', 'LV-REZ', 'Rēzekne'),
(362, 125, 'LV', 'LV-RIX', 'Rīga'),
(363, 125, 'LV', 'LV-RI', 'Rīgas novads'),
(364, 125, 'LV', 'Valmiera', 'Valmiera'),
(365, 125, 'LV', 'LV-VEN', 'Ventspils'),
(366, 125, 'LV', 'Aglonas novads', 'Aglonas novads'),
(367, 125, 'LV', 'LV-AI', 'Aizkraukles novads'),
(368, 125, 'LV', 'Aizputes novads', 'Aizputes novads'),
(369, 125, 'LV', 'Aknīstes novads', 'Aknīstes novads'),
(370, 125, 'LV', 'Alojas novads', 'Alojas novads'),
(371, 125, 'LV', 'Alsungas novads', 'Alsungas novads'),
(372, 125, 'LV', 'LV-AL', 'Alūksnes novads'),
(373, 125, 'LV', 'Amatas novads', 'Amatas novads'),
(374, 125, 'LV', 'Apes novads', 'Apes novads'),
(375, 125, 'LV', 'Auces novads', 'Auces novads'),
(376, 125, 'LV', 'Babītes novads', 'Babītes novads'),
(377, 125, 'LV', 'Baldones novads', 'Baldones novads'),
(378, 125, 'LV', 'Baltinavas novads', 'Baltinavas novads'),
(379, 125, 'LV', 'LV-BL', 'Balvu novads'),
(380, 125, 'LV', 'LV-BU', 'Bauskas novads'),
(381, 125, 'LV', 'Beverīnas novads', 'Beverīnas novads'),
(382, 125, 'LV', 'Brocēnu novads', 'Brocēnu novads'),
(383, 125, 'LV', 'Burtnieku novads', 'Burtnieku novads'),
(384, 125, 'LV', 'Carnikavas novads', 'Carnikavas novads'),
(385, 125, 'LV', 'Cesvaines novads', 'Cesvaines novads'),
(386, 125, 'LV', 'Ciblas novads', 'Ciblas novads'),
(387, 125, 'LV', 'LV-CE', 'Cēsu novads'),
(388, 125, 'LV', 'Dagdas novads', 'Dagdas novads'),
(389, 125, 'LV', 'LV-DA', 'Daugavpils novads'),
(390, 125, 'LV', 'LV-DO', 'Dobeles novads'),
(391, 125, 'LV', 'Dundagas novads', 'Dundagas novads'),
(392, 125, 'LV', 'Durbes novads', 'Durbes novads'),
(393, 125, 'LV', 'Engures novads', 'Engures novads'),
(394, 125, 'LV', 'Garkalnes novads', 'Garkalnes novads'),
(395, 125, 'LV', 'Grobiņas novads', 'Grobiņas novads'),
(396, 125, 'LV', 'LV-GU', 'Gulbenes novads'),
(397, 125, 'LV', 'Iecavas novads', 'Iecavas novads'),
(398, 125, 'LV', 'Ikšķiles novads', 'Ikšķiles novads'),
(399, 125, 'LV', 'Ilūkstes novads', 'Ilūkstes novads'),
(400, 125, 'LV', 'Inčukalna novads', 'Inčukalna novads'),
(401, 125, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads'),
(402, 125, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads'),
(403, 125, 'LV', 'Jaunpils novads', 'Jaunpils novads'),
(404, 125, 'LV', 'LV-JL', 'Jelgavas novads'),
(405, 125, 'LV', 'LV-JK', 'Jēkabpils novads'),
(406, 125, 'LV', 'Kandavas novads', 'Kandavas novads'),
(407, 125, 'LV', 'Kokneses novads', 'Kokneses novads'),
(408, 125, 'LV', 'Krimuldas novads', 'Krimuldas novads'),
(409, 125, 'LV', 'Krustpils novads', 'Krustpils novads'),
(410, 125, 'LV', 'LV-KR', 'Krāslavas novads'),
(411, 125, 'LV', 'LV-KU', 'Kuldīgas novads'),
(412, 125, 'LV', 'Kārsavas novads', 'Kārsavas novads'),
(413, 125, 'LV', 'Lielvārdes novads', 'Lielvārdes novads'),
(414, 125, 'LV', 'LV-LM', 'Limbažu novads'),
(415, 125, 'LV', 'Lubānas novads', 'Lubānas novads'),
(416, 125, 'LV', 'LV-LU', 'Ludzas novads'),
(417, 125, 'LV', 'Līgatnes novads', 'Līgatnes novads'),
(418, 125, 'LV', 'Līvānu novads', 'Līvānu novads'),
(419, 125, 'LV', 'LV-MA', 'Madonas novads'),
(420, 125, 'LV', 'Mazsalacas novads', 'Mazsalacas novads'),
(421, 125, 'LV', 'Mālpils novads', 'Mālpils novads'),
(422, 125, 'LV', 'Mārupes novads', 'Mārupes novads'),
(423, 125, 'LV', 'Naukšēnu novads', 'Naukšēnu novads'),
(424, 125, 'LV', 'Neretas novads', 'Neretas novads'),
(425, 125, 'LV', 'Nīcas novads', 'Nīcas novads'),
(426, 125, 'LV', 'LV-OG', 'Ogres novads'),
(427, 125, 'LV', 'Olaines novads', 'Olaines novads'),
(428, 125, 'LV', 'Ozolnieku novads', 'Ozolnieku novads'),
(429, 125, 'LV', 'LV-PR', 'Preiļu novads'),
(430, 125, 'LV', 'Priekules novads', 'Priekules novads'),
(431, 125, 'LV', 'Priekuļu novads', 'Priekuļu novads'),
(432, 125, 'LV', 'Pārgaujas novads', 'Pārgaujas novads'),
(433, 125, 'LV', 'Pāvilostas novads', 'Pāvilostas novads'),
(434, 125, 'LV', 'Pļaviņu novads', 'Pļaviņu novads'),
(435, 125, 'LV', 'Raunas novads', 'Raunas novads'),
(436, 125, 'LV', 'Riebiņu novads', 'Riebiņu novads'),
(437, 125, 'LV', 'Rojas novads', 'Rojas novads'),
(438, 125, 'LV', 'Ropažu novads', 'Ropažu novads'),
(439, 125, 'LV', 'Rucavas novads', 'Rucavas novads'),
(440, 125, 'LV', 'Rugāju novads', 'Rugāju novads'),
(441, 125, 'LV', 'Rundāles novads', 'Rundāles novads'),
(442, 125, 'LV', 'LV-RE', 'Rēzeknes novads'),
(443, 125, 'LV', 'Rūjienas novads', 'Rūjienas novads'),
(444, 125, 'LV', 'Salacgrīvas novads', 'Salacgrīvas novads'),
(445, 125, 'LV', 'Salas novads', 'Salas novads'),
(446, 125, 'LV', 'Salaspils novads', 'Salaspils novads'),
(447, 125, 'LV', 'LV-SA', 'Saldus novads'),
(448, 125, 'LV', 'Saulkrastu novads', 'Saulkrastu novads'),
(449, 125, 'LV', 'Siguldas novads', 'Siguldas novads'),
(450, 125, 'LV', 'Skrundas novads', 'Skrundas novads'),
(451, 125, 'LV', 'Skrīveru novads', 'Skrīveru novads'),
(452, 125, 'LV', 'Smiltenes novads', 'Smiltenes novads'),
(453, 125, 'LV', 'Stopiņu novads', 'Stopiņu novads'),
(454, 125, 'LV', 'Strenču novads', 'Strenču novads'),
(455, 125, 'LV', 'Sējas novads', 'Sējas novads'),
(456, 125, 'LV', 'LV-TA', 'Talsu novads'),
(457, 125, 'LV', 'LV-TU', 'Tukuma novads'),
(458, 125, 'LV', 'Tērvetes novads', 'Tērvetes novads'),
(459, 125, 'LV', 'Vaiņodes novads', 'Vaiņodes novads'),
(460, 125, 'LV', 'LV-VK', 'Valkas novads'),
(461, 125, 'LV', 'LV-VM', 'Valmieras novads'),
(462, 125, 'LV', 'Varakļānu novads', 'Varakļānu novads'),
(463, 125, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads'),
(464, 125, 'LV', 'Vecumnieku novads', 'Vecumnieku novads'),
(465, 125, 'LV', 'LV-VE', 'Ventspils novads'),
(466, 125, 'LV', 'Viesītes novads', 'Viesītes novads'),
(467, 125, 'LV', 'Viļakas novads', 'Viļakas novads'),
(468, 125, 'LV', 'Viļānu novads', 'Viļānu novads'),
(469, 125, 'LV', 'Vārkavas novads', 'Vārkavas novads'),
(470, 125, 'LV', 'Zilupes novads', 'Zilupes novads'),
(471, 125, 'LV', 'Ādažu novads', 'Ādažu novads'),
(472, 125, 'LV', 'Ērgļu novads', 'Ērgļu novads'),
(473, 125, 'LV', 'Ķeguma novads', 'Ķeguma novads'),
(474, 125, 'LV', 'Ķekavas novads', 'Ķekavas novads'),
(475, 131, 'LT', 'LT-AL', 'Alytaus Apskritis'),
(476, 131, 'LT', 'LT-KU', 'Kauno Apskritis'),
(477, 131, 'LT', 'LT-KL', 'Klaipėdos Apskritis'),
(478, 131, 'LT', 'LT-MR', 'Marijampolės Apskritis'),
(479, 131, 'LT', 'LT-PN', 'Panevėžio Apskritis'),
(480, 131, 'LT', 'LT-SA', 'Šiaulių Apskritis'),
(481, 131, 'LT', 'LT-TA', 'Tauragės Apskritis'),
(482, 131, 'LT', 'LT-TE', 'Telšių Apskritis'),
(483, 131, 'LT', 'LT-UT', 'Utenos Apskritis'),
(484, 131, 'LT', 'LT-VL', 'Vilniaus Apskritis'),
(485, 31, 'BR', 'AC', 'Acre'),
(486, 31, 'BR', 'AL', 'Alagoas'),
(487, 31, 'BR', 'AP', 'Amapá'),
(488, 31, 'BR', 'AM', 'Amazonas'),
(489, 31, 'BR', 'BA', 'Bahia'),
(490, 31, 'BR', 'CE', 'Ceará'),
(491, 31, 'BR', 'ES', 'Espírito Santo'),
(492, 31, 'BR', 'GO', 'Goiás'),
(493, 31, 'BR', 'MA', 'Maranhão'),
(494, 31, 'BR', 'MT', 'Mato Grosso'),
(495, 31, 'BR', 'MS', 'Mato Grosso do Sul'),
(496, 31, 'BR', 'MG', 'Minas Gerais'),
(497, 31, 'BR', 'PA', 'Pará'),
(498, 31, 'BR', 'PB', 'Paraíba'),
(499, 31, 'BR', 'PR', 'Paraná'),
(500, 31, 'BR', 'PE', 'Pernambuco'),
(501, 31, 'BR', 'PI', 'Piauí'),
(502, 31, 'BR', 'RJ', 'Rio de Janeiro'),
(503, 31, 'BR', 'RN', 'Rio Grande do Norte'),
(504, 31, 'BR', 'RS', 'Rio Grande do Sul'),
(505, 31, 'BR', 'RO', 'Rondônia'),
(506, 31, 'BR', 'RR', 'Roraima'),
(507, 31, 'BR', 'SC', 'Santa Catarina'),
(508, 31, 'BR', 'SP', 'São Paulo'),
(509, 31, 'BR', 'SE', 'Sergipe'),
(510, 31, 'BR', 'TO', 'Tocantins'),
(511, 31, 'BR', 'DF', 'Distrito Federal'),
(512, 59, 'HR', 'HR-01', 'Zagrebačka županija'),
(513, 59, 'HR', 'HR-02', 'Krapinsko-zagorska županija'),
(514, 59, 'HR', 'HR-03', 'Sisačko-moslavačka županija'),
(515, 59, 'HR', 'HR-04', 'Karlovačka županija'),
(516, 59, 'HR', 'HR-05', 'Varaždinska županija'),
(517, 59, 'HR', 'HR-06', 'Koprivničko-križevačka županija'),
(518, 59, 'HR', 'HR-07', 'Bjelovarsko-bilogorska županija'),
(519, 59, 'HR', 'HR-08', 'Primorsko-goranska županija'),
(520, 59, 'HR', 'HR-09', 'Ličko-senjska županija'),
(521, 59, 'HR', 'HR-10', 'Virovitičko-podravska županija'),
(522, 59, 'HR', 'HR-11', 'Požeško-slavonska županija'),
(523, 59, 'HR', 'HR-12', 'Brodsko-posavska županija'),
(524, 59, 'HR', 'HR-13', 'Zadarska županija'),
(525, 59, 'HR', 'HR-14', 'Osječko-baranjska županija'),
(526, 59, 'HR', 'HR-15', 'Šibensko-kninska županija'),
(527, 59, 'HR', 'HR-16', 'Vukovarsko-srijemska županija'),
(528, 59, 'HR', 'HR-17', 'Splitsko-dalmatinska županija'),
(529, 59, 'HR', 'HR-18', 'Istarska županija'),
(530, 59, 'HR', 'HR-19', 'Dubrovačko-neretvanska županija'),
(531, 59, 'HR', 'HR-20', 'Međimurska županija'),
(532, 59, 'HR', 'HR-21', 'Grad Zagreb'),
(533, 106, 'IN', 'AN', 'Andaman and Nicobar Islands'),
(534, 106, 'IN', 'AP', 'Andhra Pradesh'),
(535, 106, 'IN', 'AR', 'Arunachal Pradesh'),
(536, 106, 'IN', 'AS', 'Assam'),
(537, 106, 'IN', 'BR', 'Bihar'),
(538, 106, 'IN', 'CH', 'Chandigarh'),
(539, 106, 'IN', 'CT', 'Chhattisgarh'),
(540, 106, 'IN', 'DN', 'Dadra and Nagar Haveli'),
(541, 106, 'IN', 'DD', 'Daman and Diu'),
(542, 106, 'IN', 'DL', 'Delhi'),
(543, 106, 'IN', 'GA', 'Goa'),
(544, 106, 'IN', 'GJ', 'Gujarat'),
(545, 106, 'IN', 'HR', 'Haryana'),
(546, 106, 'IN', 'HP', 'Himachal Pradesh'),
(547, 106, 'IN', 'JK', 'Jammu and Kashmir'),
(548, 106, 'IN', 'JH', 'Jharkhand'),
(549, 106, 'IN', 'KA', 'Karnataka'),
(550, 106, 'IN', 'KL', 'Kerala'),
(551, 106, 'IN', 'LD', 'Lakshadweep'),
(552, 106, 'IN', 'MP', 'Madhya Pradesh'),
(553, 106, 'IN', 'MH', 'Maharashtra'),
(554, 106, 'IN', 'MN', 'Manipur'),
(555, 106, 'IN', 'ML', 'Meghalaya'),
(556, 106, 'IN', 'MZ', 'Mizoram'),
(557, 106, 'IN', 'NL', 'Nagaland'),
(558, 106, 'IN', 'OR', 'Odisha'),
(559, 106, 'IN', 'PY', 'Puducherry'),
(560, 106, 'IN', 'PB', 'Punjab'),
(561, 106, 'IN', 'RJ', 'Rajasthan'),
(562, 106, 'IN', 'SK', 'Sikkim'),
(563, 106, 'IN', 'TN', 'Tamil Nadu'),
(564, 106, 'IN', 'TG', 'Telangana'),
(565, 106, 'IN', 'TR', 'Tripura'),
(566, 106, 'IN', 'UP', 'Uttar Pradesh'),
(567, 106, 'IN', 'UT', 'Uttarakhand'),
(568, 106, 'IN', 'WB', 'West Bengal'),
(569, 176, 'PY', 'PY-16', 'Alto Paraguay'),
(570, 176, 'PY', 'PY-10', 'Alto Paraná'),
(571, 176, 'PY', 'PY-13', 'Amambay'),
(572, 176, 'PY', 'PY-ASU', 'Asunción'),
(573, 176, 'PY', 'PY-19', 'Boquerón'),
(574, 176, 'PY', 'PY-5', 'Caaguazú'),
(575, 176, 'PY', 'PY-6', 'Caazapá'),
(576, 176, 'PY', 'PY-14', 'Canindeyú'),
(577, 176, 'PY', 'PY-11', 'Central'),
(578, 176, 'PY', 'PY-1', 'Concepción'),
(579, 176, 'PY', 'PY-3', 'Cordillera'),
(580, 176, 'PY', 'PY-4', 'Guairá'),
(581, 176, 'PY', 'PY-7', 'Itapúa'),
(582, 176, 'PY', 'PY-8', 'Misiones'),
(583, 176, 'PY', 'PY-9', 'Paraguarí'),
(584, 176, 'PY', 'PY-15', 'Presidente Hayes'),
(585, 176, 'PY', 'PY-2', 'San Pedro'),
(586, 176, 'PY', 'PY-12', 'Ñeembucú');

-- --------------------------------------------------------

--
-- Table structure for table `country_state_translations`
--

CREATE TABLE `country_state_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_state_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `default_name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `country_state_translations`
--

INSERT INTO `country_state_translations` (`id`, `country_state_id`, `locale`, `default_name`) VALUES
(1, 1, 'ar', 'ألاباما'),
(2, 2, 'ar', 'ألاسكا'),
(3, 3, 'ar', 'ساموا الأمريكية'),
(4, 4, 'ar', 'أريزونا'),
(5, 5, 'ar', 'أركنساس'),
(6, 6, 'ar', 'القوات المسلحة أفريقيا'),
(7, 7, 'ar', 'القوات المسلحة الأمريكية'),
(8, 8, 'ar', 'القوات المسلحة الكندية'),
(9, 9, 'ar', 'القوات المسلحة أوروبا'),
(10, 10, 'ar', 'القوات المسلحة الشرق الأوسط'),
(11, 11, 'ar', 'القوات المسلحة في المحيط الهادئ'),
(12, 12, 'ar', 'كاليفورنيا'),
(13, 13, 'ar', 'كولورادو'),
(14, 14, 'ar', 'كونيتيكت'),
(15, 15, 'ar', 'ديلاوير'),
(16, 16, 'ar', 'مقاطعة كولومبيا'),
(17, 17, 'ar', 'ولايات ميكرونيزيا الموحدة'),
(18, 18, 'ar', 'فلوريدا'),
(19, 19, 'ar', 'جورجيا'),
(20, 20, 'ar', 'غوام'),
(21, 21, 'ar', 'هاواي'),
(22, 22, 'ar', 'ايداهو'),
(23, 23, 'ar', 'إلينوي'),
(24, 24, 'ar', 'إنديانا'),
(25, 25, 'ar', 'أيوا'),
(26, 26, 'ar', 'كانساس'),
(27, 27, 'ar', 'كنتاكي'),
(28, 28, 'ar', 'لويزيانا'),
(29, 29, 'ar', 'مين'),
(30, 30, 'ar', 'جزر مارشال'),
(31, 31, 'ar', 'ماريلاند'),
(32, 32, 'ar', 'ماساتشوستس'),
(33, 33, 'ar', 'ميشيغان'),
(34, 34, 'ar', 'مينيسوتا'),
(35, 35, 'ar', 'ميسيسيبي'),
(36, 36, 'ar', 'ميسوري'),
(37, 37, 'ar', 'مونتانا'),
(38, 38, 'ar', 'نبراسكا'),
(39, 39, 'ar', 'نيفادا'),
(40, 40, 'ar', 'نيو هامبشاير'),
(41, 41, 'ar', 'نيو جيرسي'),
(42, 42, 'ar', 'المكسيك جديدة'),
(43, 43, 'ar', 'نيويورك'),
(44, 44, 'ar', 'شمال كارولينا'),
(45, 45, 'ar', 'شمال داكوتا'),
(46, 46, 'ar', 'جزر مريانا الشمالية'),
(47, 47, 'ar', 'أوهايو'),
(48, 48, 'ar', 'أوكلاهوما'),
(49, 49, 'ar', 'ولاية أوريغون'),
(50, 50, 'ar', 'بالاو'),
(51, 51, 'ar', 'بنسلفانيا'),
(52, 52, 'ar', 'بورتوريكو'),
(53, 53, 'ar', 'جزيرة رود'),
(54, 54, 'ar', 'كارولينا الجنوبية'),
(55, 55, 'ar', 'جنوب داكوتا'),
(56, 56, 'ar', 'تينيسي'),
(57, 57, 'ar', 'تكساس'),
(58, 58, 'ar', 'يوتا'),
(59, 59, 'ar', 'فيرمونت'),
(60, 60, 'ar', 'جزر فيرجن'),
(61, 61, 'ar', 'فرجينيا'),
(62, 62, 'ar', 'واشنطن'),
(63, 63, 'ar', 'فرجينيا الغربية'),
(64, 64, 'ar', 'ولاية ويسكونسن'),
(65, 65, 'ar', 'وايومنغ'),
(66, 66, 'ar', 'ألبرتا'),
(67, 67, 'ar', 'كولومبيا البريطانية'),
(68, 68, 'ar', 'مانيتوبا'),
(69, 69, 'ar', 'نيوفاوندلاند ولابرادور'),
(70, 70, 'ar', 'برونزيك جديد'),
(71, 71, 'ar', 'مقاطعة نفوفا سكوشيا'),
(72, 72, 'ar', 'الاقاليم الشمالية الغربية'),
(73, 73, 'ar', 'نونافوت'),
(74, 74, 'ar', 'أونتاريو'),
(75, 75, 'ar', 'جزيرة الأمير ادوارد'),
(76, 76, 'ar', 'كيبيك'),
(77, 77, 'ar', 'ساسكاتشوان'),
(78, 78, 'ar', 'إقليم يوكون'),
(79, 79, 'ar', 'Niedersachsen'),
(80, 80, 'ar', 'بادن فورتمبيرغ'),
(81, 81, 'ar', 'بايرن ميونيخ'),
(82, 82, 'ar', 'برلين'),
(83, 83, 'ar', 'براندنبورغ'),
(84, 84, 'ar', 'بريمن'),
(85, 85, 'ar', 'هامبورغ'),
(86, 86, 'ar', 'هيسن'),
(87, 87, 'ar', 'مكلنبورغ-فوربومرن'),
(88, 88, 'ar', 'نوردراين فيستفالن'),
(89, 89, 'ar', 'راينلاند-بفالز'),
(90, 90, 'ar', 'سارلاند'),
(91, 91, 'ar', 'ساكسن'),
(92, 92, 'ar', 'سكسونيا أنهالت'),
(93, 93, 'ar', 'شليسفيغ هولشتاين'),
(94, 94, 'ar', 'تورنغن'),
(95, 95, 'ar', 'فيينا'),
(96, 96, 'ar', 'النمسا السفلى'),
(97, 97, 'ar', 'النمسا العليا'),
(98, 98, 'ar', 'سالزبورغ'),
(99, 99, 'ar', 'Каринтия'),
(100, 100, 'ar', 'STEIERMARK'),
(101, 101, 'ar', 'تيرول'),
(102, 102, 'ar', 'بورغنلاند'),
(103, 103, 'ar', 'فورارلبرغ'),
(104, 104, 'ar', 'أرجاو'),
(105, 105, 'ar', 'Appenzell Innerrhoden'),
(106, 106, 'ar', 'أبنزل أوسيرهودن'),
(107, 107, 'ar', 'برن'),
(108, 108, 'ar', 'كانتون ريف بازل'),
(109, 109, 'ar', 'بازل شتات'),
(110, 110, 'ar', 'فرايبورغ'),
(111, 111, 'ar', 'Genf'),
(112, 112, 'ar', 'جلاروس'),
(113, 113, 'ar', 'غراوبوندن'),
(114, 114, 'ar', 'العصر الجوارسي أو الجوري'),
(115, 115, 'ar', 'لوزيرن'),
(116, 116, 'ar', 'في Neuenburg'),
(117, 117, 'ar', 'نيدوالدن'),
(118, 118, 'ar', 'أوبوالدن'),
(119, 119, 'ar', 'سانت غالن'),
(120, 120, 'ar', 'شافهاوزن'),
(121, 121, 'ar', 'سولوتورن'),
(122, 122, 'ar', 'شفيتس'),
(123, 123, 'ar', 'ثورجو'),
(124, 124, 'ar', 'تيتشينو'),
(125, 125, 'ar', 'أوري'),
(126, 126, 'ar', 'وادت'),
(127, 127, 'ar', 'اليس'),
(128, 128, 'ar', 'زوغ'),
(129, 129, 'ar', 'زيورخ'),
(130, 130, 'ar', 'Corunha'),
(131, 131, 'ar', 'ألافا'),
(132, 132, 'ar', 'الباسيتي'),
(133, 133, 'ar', 'اليكانتي'),
(134, 134, 'ar', 'الميريا'),
(135, 135, 'ar', 'أستورياس'),
(136, 136, 'ar', 'أفيلا'),
(137, 137, 'ar', 'بطليوس'),
(138, 138, 'ar', 'البليار'),
(139, 139, 'ar', 'برشلونة'),
(140, 140, 'ar', 'برغش'),
(141, 141, 'ar', 'كاسيريس'),
(142, 142, 'ar', 'كاديز'),
(143, 143, 'ar', 'كانتابريا'),
(144, 144, 'ar', 'كاستيلون'),
(145, 145, 'ar', 'سبتة'),
(146, 146, 'ar', 'سيوداد ريال'),
(147, 147, 'ar', 'قرطبة'),
(148, 148, 'ar', 'كوينكا'),
(149, 149, 'ar', 'جيرونا'),
(150, 150, 'ar', 'غرناطة'),
(151, 151, 'ar', 'غوادالاخارا'),
(152, 152, 'ar', 'بجويبوزكوا'),
(153, 153, 'ar', 'هويلفا'),
(154, 154, 'ar', 'هويسكا'),
(155, 155, 'ar', 'خاين'),
(156, 156, 'ar', 'لاريوخا'),
(157, 157, 'ar', 'لاس بالماس'),
(158, 158, 'ar', 'ليون'),
(159, 159, 'ar', 'يدا'),
(160, 160, 'ar', 'لوغو'),
(161, 161, 'ar', 'مدريد'),
(162, 162, 'ar', 'ملقة'),
(163, 163, 'ar', 'مليلية'),
(164, 164, 'ar', 'مورسيا'),
(165, 165, 'ar', 'نافارا'),
(166, 166, 'ar', 'أورينس'),
(167, 167, 'ar', 'بلنسية'),
(168, 168, 'ar', 'بونتيفيدرا'),
(169, 169, 'ar', 'سالامانكا'),
(170, 170, 'ar', 'سانتا كروز دي تينيريفي'),
(171, 171, 'ar', 'سيغوفيا'),
(172, 172, 'ar', 'اشبيلية'),
(173, 173, 'ar', 'سوريا'),
(174, 174, 'ar', 'تاراغونا'),
(175, 175, 'ar', 'تيرويل'),
(176, 176, 'ar', 'توليدو'),
(177, 177, 'ar', 'فالنسيا'),
(178, 178, 'ar', 'بلد الوليد'),
(179, 179, 'ar', 'فيزكايا'),
(180, 180, 'ar', 'زامورا'),
(181, 181, 'ar', 'سرقسطة'),
(182, 182, 'ar', 'عين'),
(183, 183, 'ar', 'أيسن'),
(184, 184, 'ar', 'اليي'),
(185, 185, 'ar', 'ألب البروفنس العليا'),
(186, 186, 'ar', 'أوتس ألب'),
(187, 187, 'ar', 'ألب ماريتيم'),
(188, 188, 'ar', 'ARDECHE'),
(189, 189, 'ar', 'Ardennes'),
(190, 190, 'ar', 'آردن'),
(191, 191, 'ar', 'أوب'),
(192, 192, 'ar', 'اود'),
(193, 193, 'ar', 'أفيرون'),
(194, 194, 'ar', 'بوكاس دو رون'),
(195, 195, 'ar', 'كالفادوس'),
(196, 196, 'ar', 'كانتال'),
(197, 197, 'ar', 'شارانت'),
(198, 198, 'ar', 'سيين إت مارن'),
(199, 199, 'ar', 'شير'),
(200, 200, 'ar', 'كوريز'),
(201, 201, 'ar', 'سود كورس-دو-'),
(202, 202, 'ar', 'هوت كورس'),
(203, 203, 'ar', 'كوستا دوركوريز'),
(204, 204, 'ar', 'كوتس دورمور'),
(205, 205, 'ar', 'كروز'),
(206, 206, 'ar', 'دوردوني'),
(207, 207, 'ar', 'دوبس'),
(208, 208, 'ar', 'DrômeFinistère'),
(209, 209, 'ar', 'أور'),
(210, 210, 'ar', 'أور ولوار'),
(211, 211, 'ar', 'فينيستير'),
(212, 212, 'ar', 'جارد'),
(213, 213, 'ar', 'هوت غارون'),
(214, 214, 'ar', 'الخيام'),
(215, 215, 'ar', 'جيروند'),
(216, 216, 'ar', 'هيرولت'),
(217, 217, 'ar', 'إيل وفيلان'),
(218, 218, 'ar', 'إندر'),
(219, 219, 'ar', 'أندر ولوار'),
(220, 220, 'ar', 'إيسر'),
(221, 221, 'ar', 'العصر الجوارسي أو الجوري'),
(222, 222, 'ar', 'اندز'),
(223, 223, 'ar', 'لوار وشير'),
(224, 224, 'ar', 'لوار'),
(225, 225, 'ar', 'هوت-لوار'),
(226, 226, 'ar', 'وار أتلانتيك'),
(227, 227, 'ar', 'لورا'),
(228, 228, 'ar', 'كثيرا'),
(229, 229, 'ar', 'الكثير غارون'),
(230, 230, 'ar', 'لوزر'),
(231, 231, 'ar', 'مين-إي-لوار'),
(232, 232, 'ar', 'المانش'),
(233, 233, 'ar', 'مارن'),
(234, 234, 'ar', 'هوت مارن'),
(235, 235, 'ar', 'مايين'),
(236, 236, 'ar', 'مورت وموزيل'),
(237, 237, 'ar', 'ميوز'),
(238, 238, 'ar', 'موربيهان'),
(239, 239, 'ar', 'موسيل'),
(240, 240, 'ar', 'نيفر'),
(241, 241, 'ar', 'نورد'),
(242, 242, 'ar', 'إيل دو فرانس'),
(243, 243, 'ar', 'أورن'),
(244, 244, 'ar', 'با-دو-كاليه'),
(245, 245, 'ar', 'بوي دي دوم'),
(246, 246, 'ar', 'البرانيس ​​الأطلسية'),
(247, 247, 'ar', 'أوتس-بيرينيهs'),
(248, 248, 'ar', 'بيرينيه-أورينتال'),
(249, 249, 'ar', 'بس رين'),
(250, 250, 'ar', 'أوت رين'),
(251, 251, 'ar', 'رون [3]'),
(252, 252, 'ar', 'هوت-سون'),
(253, 253, 'ar', 'سون ولوار'),
(254, 254, 'ar', 'سارت'),
(255, 255, 'ar', 'سافوا'),
(256, 256, 'ar', 'هاوت سافوي'),
(257, 257, 'ar', 'باريس'),
(258, 258, 'ar', 'سين البحرية'),
(259, 259, 'ar', 'سيين إت مارن'),
(260, 260, 'ar', 'إيفلين'),
(261, 261, 'ar', 'دوكس سفرس'),
(262, 262, 'ar', 'السوم'),
(263, 263, 'ar', 'تارن'),
(264, 264, 'ar', 'تارن وغارون'),
(265, 265, 'ar', 'فار'),
(266, 266, 'ar', 'فوكلوز'),
(267, 267, 'ar', 'تارن'),
(268, 268, 'ar', 'فيين'),
(269, 269, 'ar', 'هوت فيين'),
(270, 270, 'ar', 'الفوج'),
(271, 271, 'ar', 'يون'),
(272, 272, 'ar', 'تيريتوير-دي-بلفور'),
(273, 273, 'ar', 'إيسون'),
(274, 274, 'ar', 'هوت دو سين'),
(275, 275, 'ar', 'سين سان دوني'),
(276, 276, 'ar', 'فال دو مارن'),
(277, 277, 'ar', 'فال دواز'),
(278, 278, 'ar', 'ألبا'),
(279, 279, 'ar', 'اراد'),
(280, 280, 'ar', 'ARGES'),
(281, 281, 'ar', 'باكاو'),
(282, 282, 'ar', 'بيهور'),
(283, 283, 'ar', 'بيستريتا ناسود'),
(284, 284, 'ar', 'بوتوساني'),
(285, 285, 'ar', 'براشوف'),
(286, 286, 'ar', 'برايلا'),
(287, 287, 'ar', 'بوخارست'),
(288, 288, 'ar', 'بوزاو'),
(289, 289, 'ar', 'كاراس سيفيرين'),
(290, 290, 'ar', 'كالاراسي'),
(291, 291, 'ar', 'كلوج'),
(292, 292, 'ar', 'كونستانتا'),
(293, 293, 'ar', 'كوفاسنا'),
(294, 294, 'ar', 'دامبوفيتا'),
(295, 295, 'ar', 'دولج'),
(296, 296, 'ar', 'جالاتي'),
(297, 297, 'ar', 'Giurgiu'),
(298, 298, 'ar', 'غيورغيو'),
(299, 299, 'ar', 'هارغيتا'),
(300, 300, 'ar', 'هونيدوارا'),
(301, 301, 'ar', 'ايالوميتا'),
(302, 302, 'ar', 'ياشي'),
(303, 303, 'ar', 'إيلفوف'),
(304, 304, 'ar', 'مارامريس'),
(305, 305, 'ar', 'MEHEDINTI'),
(306, 306, 'ar', 'موريس'),
(307, 307, 'ar', 'نيامتس'),
(308, 308, 'ar', 'أولت'),
(309, 309, 'ar', 'براهوفا'),
(310, 310, 'ar', 'ساتو ماري'),
(311, 311, 'ar', 'سالاج'),
(312, 312, 'ar', 'سيبيو'),
(313, 313, 'ar', 'سوسيفا'),
(314, 314, 'ar', 'تيليورمان'),
(315, 315, 'ar', 'تيم هو'),
(316, 316, 'ar', 'تولسيا'),
(317, 317, 'ar', 'فاسلوي'),
(318, 318, 'ar', 'فالسيا'),
(319, 319, 'ar', 'فرانتشا'),
(320, 320, 'ar', 'Lappi'),
(321, 321, 'ar', 'Pohjois-Pohjanmaa'),
(322, 322, 'ar', 'كاينو'),
(323, 323, 'ar', 'Pohjois-كارجالا'),
(324, 324, 'ar', 'Pohjois-سافو'),
(325, 325, 'ar', 'Etelä-سافو'),
(326, 326, 'ar', 'Etelä-Pohjanmaa'),
(327, 327, 'ar', 'Pohjanmaa'),
(328, 328, 'ar', 'بيركنما'),
(329, 329, 'ar', 'ساتا كونتا'),
(330, 330, 'ar', 'كسكي-Pohjanmaa'),
(331, 331, 'ar', 'كسكي-سومي'),
(332, 332, 'ar', 'Varsinais-سومي'),
(333, 333, 'ar', 'Etelä-كارجالا'),
(334, 334, 'ar', 'Päijät-Häme'),
(335, 335, 'ar', 'كانتا-HAME'),
(336, 336, 'ar', 'أوسيما'),
(337, 337, 'ar', 'أوسيما'),
(338, 338, 'ar', 'كومنلاكسو'),
(339, 339, 'ar', 'Ahvenanmaa'),
(340, 340, 'ar', 'Harjumaa'),
(341, 341, 'ar', 'هيوما'),
(342, 342, 'ar', 'المؤسسة الدولية للتنمية فيروما'),
(343, 343, 'ar', 'جوغفما'),
(344, 344, 'ar', 'يارفا'),
(345, 345, 'ar', 'انيما'),
(346, 346, 'ar', 'اني فيريوما'),
(347, 347, 'ar', 'بولفاما'),
(348, 348, 'ar', 'بارنوما'),
(349, 349, 'ar', 'Raplamaa'),
(350, 350, 'ar', 'Saaremaa'),
(351, 351, 'ar', 'Tartumaa'),
(352, 352, 'ar', 'Valgamaa'),
(353, 353, 'ar', 'Viljandimaa'),
(354, 354, 'ar', 'روايات Salacgr novvas'),
(355, 355, 'ar', 'داوجافبيلس'),
(356, 356, 'ar', 'يلغافا'),
(357, 357, 'ar', 'يكاب'),
(358, 358, 'ar', 'يورمال'),
(359, 359, 'ar', 'يابايا'),
(360, 360, 'ar', 'ليباج أبريس'),
(361, 361, 'ar', 'ريزكن'),
(362, 362, 'ar', 'ريغا'),
(363, 363, 'ar', 'مقاطعة ريغا'),
(364, 364, 'ar', 'فالميرا'),
(365, 365, 'ar', 'فنتسبيلز'),
(366, 366, 'ar', 'روايات Aglonas'),
(367, 367, 'ar', 'Aizkraukles novads'),
(368, 368, 'ar', 'Aizkraukles novads'),
(369, 369, 'ar', 'Aknīstes novads'),
(370, 370, 'ar', 'Alojas novads'),
(371, 371, 'ar', 'روايات Alsungas'),
(372, 372, 'ar', 'ألكسنس أبريز'),
(373, 373, 'ar', 'روايات أماتاس'),
(374, 374, 'ar', 'قرود الروايات'),
(375, 375, 'ar', 'روايات أوسيس'),
(376, 376, 'ar', 'بابيت الروايات'),
(377, 377, 'ar', 'Baldones الروايات'),
(378, 378, 'ar', 'بالتينافاس الروايات'),
(379, 379, 'ar', 'روايات بالفو'),
(380, 380, 'ar', 'Bauskas الروايات'),
(381, 381, 'ar', 'Beverīnas novads'),
(382, 382, 'ar', 'Novads Brocēnu'),
(383, 383, 'ar', 'Novads Burtnieku'),
(384, 384, 'ar', 'Carnikavas novads'),
(385, 385, 'ar', 'Cesvaines novads'),
(386, 386, 'ar', 'Ciblas novads'),
(387, 387, 'ar', 'تسو أبريس'),
(388, 388, 'ar', 'Dagdas novads'),
(389, 389, 'ar', 'Daugavpils novads'),
(390, 390, 'ar', 'روايات دوبيليس'),
(391, 391, 'ar', 'ديربيس الروايات'),
(392, 392, 'ar', 'ديربيس الروايات'),
(393, 393, 'ar', 'يشرك الروايات'),
(394, 394, 'ar', 'Garkalnes novads'),
(395, 395, 'ar', 'Grobiņas novads'),
(396, 396, 'ar', 'غولبينيس الروايات'),
(397, 397, 'ar', 'إيكافاس روايات'),
(398, 398, 'ar', 'Ikškiles novads'),
(399, 399, 'ar', 'Ilūkstes novads'),
(400, 400, 'ar', 'روايات Inčukalna'),
(401, 401, 'ar', 'Jaunjelgavas novads'),
(402, 402, 'ar', 'Jaunpiebalgas novads'),
(403, 403, 'ar', 'روايات Jaunpiebalgas'),
(404, 404, 'ar', 'Jelgavas novads'),
(405, 405, 'ar', 'جيكابيلس أبريز'),
(406, 406, 'ar', 'روايات كاندافاس'),
(407, 407, 'ar', 'Kokneses الروايات'),
(408, 408, 'ar', 'Krimuldas novads'),
(409, 409, 'ar', 'Krustpils الروايات'),
(410, 410, 'ar', 'Krāslavas Apriņķis'),
(411, 411, 'ar', 'كولدوغاس أبريز'),
(412, 412, 'ar', 'Kārsavas novads'),
(413, 413, 'ar', 'روايات ييلفاريس'),
(414, 414, 'ar', 'ليمباو أبريز'),
(415, 415, 'ar', 'روايات لباناس'),
(416, 416, 'ar', 'روايات لودزاس'),
(417, 417, 'ar', 'مقاطعة ليجاتني'),
(418, 418, 'ar', 'مقاطعة ليفاني'),
(419, 419, 'ar', 'مادونا روايات'),
(420, 420, 'ar', 'Mazsalacas novads'),
(421, 421, 'ar', 'روايات مالبلز'),
(422, 422, 'ar', 'Mārupes novads'),
(423, 423, 'ar', 'نوفاو نوكشنو'),
(424, 424, 'ar', 'روايات نيريتاس'),
(425, 425, 'ar', 'روايات نيكاس'),
(426, 426, 'ar', 'أغنام الروايات'),
(427, 427, 'ar', 'أولينيس الروايات'),
(428, 428, 'ar', 'روايات Ozolnieku'),
(429, 429, 'ar', 'بريسيو أبرييس'),
(430, 430, 'ar', 'Priekules الروايات'),
(431, 431, 'ar', 'كوندادو دي بريكوي'),
(432, 432, 'ar', 'Pärgaujas novads'),
(433, 433, 'ar', 'روايات بافيلوستاس'),
(434, 434, 'ar', 'بلافيناس مقاطعة'),
(435, 435, 'ar', 'روناس روايات'),
(436, 436, 'ar', 'Riebiņu novads'),
(437, 437, 'ar', 'روجاس روايات'),
(438, 438, 'ar', 'Novads روباو'),
(439, 439, 'ar', 'روكافاس روايات'),
(440, 440, 'ar', 'روغاجو روايات'),
(441, 441, 'ar', 'رندلس الروايات'),
(442, 442, 'ar', 'Radzeknes novads'),
(443, 443, 'ar', 'Rūjienas novads'),
(444, 444, 'ar', 'بلدية سالاسغريفا'),
(445, 445, 'ar', 'روايات سالاس'),
(446, 446, 'ar', 'Salaspils novads'),
(447, 447, 'ar', 'روايات سالدوس'),
(448, 448, 'ar', 'Novuls Saulkrastu'),
(449, 449, 'ar', 'سيغولداس روايات'),
(450, 450, 'ar', 'Skrundas novads'),
(451, 451, 'ar', 'مقاطعة Skrīveri'),
(452, 452, 'ar', 'يبتسم الروايات'),
(453, 453, 'ar', 'روايات Stopiņu'),
(454, 454, 'ar', 'روايات Stren novu'),
(455, 455, 'ar', 'سجاس روايات'),
(456, 456, 'ar', 'روايات تالسو'),
(457, 457, 'ar', 'توكوما الروايات'),
(458, 458, 'ar', 'Tērvetes novads'),
(459, 459, 'ar', 'Vaiņodes novads'),
(460, 460, 'ar', 'فالكاس الروايات'),
(461, 461, 'ar', 'فالميراس الروايات'),
(462, 462, 'ar', 'مقاطعة فاكلاني'),
(463, 463, 'ar', 'Vecpiebalgas novads'),
(464, 464, 'ar', 'روايات Vecumnieku'),
(465, 465, 'ar', 'فنتسبيلس الروايات'),
(466, 466, 'ar', 'Viesītes Novads'),
(467, 467, 'ar', 'Viļakas novads'),
(468, 468, 'ar', 'روايات فيناو'),
(469, 469, 'ar', 'Vārkavas novads'),
(470, 470, 'ar', 'روايات زيلوبس'),
(471, 471, 'ar', 'مقاطعة أدازي'),
(472, 472, 'ar', 'مقاطعة Erglu'),
(473, 473, 'ar', 'مقاطعة كيغمس'),
(474, 474, 'ar', 'مقاطعة كيكافا'),
(475, 475, 'ar', 'Alytaus Apskritis'),
(476, 476, 'ar', 'كاونو ابكريتيس'),
(477, 477, 'ar', 'Klaipėdos apskritis'),
(478, 478, 'ar', 'Marijampol\'s apskritis'),
(479, 479, 'ar', 'Panevėžio apskritis'),
(480, 480, 'ar', 'uliaulių apskritis'),
(481, 481, 'ar', 'Taurag\'s apskritis'),
(482, 482, 'ar', 'Telšių apskritis'),
(483, 483, 'ar', 'Utenos apskritis'),
(484, 484, 'ar', 'فيلنياوس ابكريتيس'),
(485, 485, 'ar', 'فدان'),
(486, 486, 'ar', 'ألاغواس'),
(487, 487, 'ar', 'أمابا'),
(488, 488, 'ar', 'أمازوناس'),
(489, 489, 'ar', 'باهيا'),
(490, 490, 'ar', 'سيارا'),
(491, 491, 'ar', 'إسبيريتو سانتو'),
(492, 492, 'ar', 'غوياس'),
(493, 493, 'ar', 'مارانهاو'),
(494, 494, 'ar', 'ماتو جروسو'),
(495, 495, 'ar', 'ماتو جروسو دو سول'),
(496, 496, 'ar', 'ميناس جريس'),
(497, 497, 'ar', 'بارا'),
(498, 498, 'ar', 'بارايبا'),
(499, 499, 'ar', 'بارانا'),
(500, 500, 'ar', 'بيرنامبوكو'),
(501, 501, 'ar', 'بياوي'),
(502, 502, 'ar', 'ريو دي جانيرو'),
(503, 503, 'ar', 'ريو غراندي دو نورتي'),
(504, 504, 'ar', 'ريو غراندي دو سول'),
(505, 505, 'ar', 'روندونيا'),
(506, 506, 'ar', 'رورايما'),
(507, 507, 'ar', 'سانتا كاتارينا'),
(508, 508, 'ar', 'ساو باولو'),
(509, 509, 'ar', 'سيرغيبي'),
(510, 510, 'ar', 'توكانتينز'),
(511, 511, 'ar', 'وفي مقاطعة الاتحادية'),
(512, 512, 'ar', 'Zagrebačka زوبانيا'),
(513, 513, 'ar', 'Krapinsko-zagorska زوبانيا'),
(514, 514, 'ar', 'Sisačko-moslavačka زوبانيا'),
(515, 515, 'ar', 'كارلوفيتش شوبانيا'),
(516, 516, 'ar', 'فارادينسكا زوبانيجا'),
(517, 517, 'ar', 'Koprivničko-križevačka زوبانيجا'),
(518, 518, 'ar', 'بيلوفارسكو-بيلوجورسكا'),
(519, 519, 'ar', 'بريمورسكو غورانسكا سوبانيا'),
(520, 520, 'ar', 'ليكو سينيسكا زوبانيا'),
(521, 521, 'ar', 'Virovitičko-podravska زوبانيا'),
(522, 522, 'ar', 'Požeško-slavonska županija'),
(523, 523, 'ar', 'Brodsko-posavska županija'),
(524, 524, 'ar', 'زادارسكا زوبانيجا'),
(525, 525, 'ar', 'Osječko-baranjska županija'),
(526, 526, 'ar', 'شيبنسكو-كنينسكا سوبانيا'),
(527, 527, 'ar', 'Virovitičko-podravska زوبانيا'),
(528, 528, 'ar', 'Splitsko-dalmatinska زوبانيا'),
(529, 529, 'ar', 'Istarska زوبانيا'),
(530, 530, 'ar', 'Dubrovačko-neretvanska زوبانيا'),
(531, 531, 'ar', 'Međimurska زوبانيا'),
(532, 532, 'ar', 'غراد زغرب'),
(533, 533, 'ar', 'جزر أندامان ونيكوبار'),
(534, 534, 'ar', 'ولاية اندرا براديش'),
(535, 535, 'ar', 'اروناتشال براديش'),
(536, 536, 'ar', 'أسام'),
(537, 537, 'ar', 'بيهار'),
(538, 538, 'ar', 'شانديغار'),
(539, 539, 'ar', 'تشهاتيسجاره'),
(540, 540, 'ar', 'دادرا ونجار هافيلي'),
(541, 541, 'ar', 'دامان وديو'),
(542, 542, 'ar', 'دلهي'),
(543, 543, 'ar', 'غوا'),
(544, 544, 'ar', 'غوجارات'),
(545, 545, 'ar', 'هاريانا'),
(546, 546, 'ar', 'هيماشال براديش'),
(547, 547, 'ar', 'جامو وكشمير'),
(548, 548, 'ar', 'جهارخاند'),
(549, 549, 'ar', 'كارناتاكا'),
(550, 550, 'ar', 'ولاية كيرالا'),
(551, 551, 'ar', 'اكشادويب'),
(552, 552, 'ar', 'ماديا براديش'),
(553, 553, 'ar', 'ماهاراشترا'),
(554, 554, 'ar', 'مانيبور'),
(555, 555, 'ar', 'ميغالايا'),
(556, 556, 'ar', 'ميزورام'),
(557, 557, 'ar', 'ناجالاند'),
(558, 558, 'ar', 'أوديشا'),
(559, 559, 'ar', 'بودوتشيري'),
(560, 560, 'ar', 'البنجاب'),
(561, 561, 'ar', 'راجستان'),
(562, 562, 'ar', 'سيكيم'),
(563, 563, 'ar', 'تاميل نادو'),
(564, 564, 'ar', 'تيلانجانا'),
(565, 565, 'ar', 'تريبورا'),
(566, 566, 'ar', 'ولاية اوتار براديش'),
(567, 567, 'ar', 'أوتارانتشال'),
(568, 568, 'ar', 'البنغال الغربية'),
(569, 1, 'es', 'Alabama'),
(570, 2, 'es', 'Alaska'),
(571, 3, 'es', 'American Samoa'),
(572, 4, 'es', 'Arizona'),
(573, 5, 'es', 'Arkansas'),
(574, 6, 'es', 'Armed Forces Africa'),
(575, 7, 'es', 'Armed Forces Americas'),
(576, 8, 'es', 'Armed Forces Canada'),
(577, 9, 'es', 'Armed Forces Europe'),
(578, 10, 'es', 'Armed Forces Middle East'),
(579, 11, 'es', 'Armed Forces Pacific'),
(580, 12, 'es', 'California'),
(581, 13, 'es', 'Colorado'),
(582, 14, 'es', 'Connecticut'),
(583, 15, 'es', 'Delaware'),
(584, 16, 'es', 'District of Columbia'),
(585, 17, 'es', 'Federated States Of Micronesia'),
(586, 18, 'es', 'Florida'),
(587, 19, 'es', 'Georgia'),
(588, 20, 'es', 'Guam'),
(589, 21, 'es', 'Hawaii'),
(590, 22, 'es', 'Idaho'),
(591, 23, 'es', 'Illinois'),
(592, 24, 'es', 'Indiana'),
(593, 25, 'es', 'Iowa'),
(594, 26, 'es', 'Kansas'),
(595, 27, 'es', 'Kentucky'),
(596, 28, 'es', 'Louisiana'),
(597, 29, 'es', 'Maine'),
(598, 30, 'es', 'Marshall Islands'),
(599, 31, 'es', 'Maryland'),
(600, 32, 'es', 'Massachusetts'),
(601, 33, 'es', 'Michigan'),
(602, 34, 'es', 'Minnesota'),
(603, 35, 'es', 'Mississippi'),
(604, 36, 'es', 'Missouri'),
(605, 37, 'es', 'Montana'),
(606, 38, 'es', 'Nebraska'),
(607, 39, 'es', 'Nevada'),
(608, 40, 'es', 'New Hampshire'),
(609, 41, 'es', 'New Jersey'),
(610, 42, 'es', 'New Mexico'),
(611, 43, 'es', 'New York'),
(612, 44, 'es', 'North Carolina'),
(613, 45, 'es', 'North Dakota'),
(614, 46, 'es', 'Northern Mariana Islands'),
(615, 47, 'es', 'Ohio'),
(616, 48, 'es', 'Oklahoma'),
(617, 49, 'es', 'Oregon'),
(618, 50, 'es', 'Palau'),
(619, 51, 'es', 'Pennsylvania'),
(620, 52, 'es', 'Puerto Rico'),
(621, 53, 'es', 'Rhode Island'),
(622, 54, 'es', 'South Carolina'),
(623, 55, 'es', 'South Dakota'),
(624, 56, 'es', 'Tennessee'),
(625, 57, 'es', 'Texas'),
(626, 58, 'es', 'Utah'),
(627, 59, 'es', 'Vermont'),
(628, 60, 'es', 'Virgin Islands'),
(629, 61, 'es', 'Virginia'),
(630, 62, 'es', 'Washington'),
(631, 63, 'es', 'West Virginia'),
(632, 64, 'es', 'Wisconsin'),
(633, 65, 'es', 'Wyoming'),
(634, 66, 'es', 'Alberta'),
(635, 67, 'es', 'British Columbia'),
(636, 68, 'es', 'Manitoba'),
(637, 69, 'es', 'Newfoundland and Labrador'),
(638, 70, 'es', 'New Brunswick'),
(639, 71, 'es', 'Nova Scotia'),
(640, 72, 'es', 'Northwest Territories'),
(641, 73, 'es', 'Nunavut'),
(642, 74, 'es', 'Ontario'),
(643, 75, 'es', 'Prince Edward Island'),
(644, 76, 'es', 'Quebec'),
(645, 77, 'es', 'Saskatchewan'),
(646, 78, 'es', 'Yukon Territory'),
(647, 79, 'es', 'Niedersachsen'),
(648, 80, 'es', 'Baden-Württemberg'),
(649, 81, 'es', 'Bayern'),
(650, 82, 'es', 'Berlin'),
(651, 83, 'es', 'Brandenburg'),
(652, 84, 'es', 'Bremen'),
(653, 85, 'es', 'Hamburg'),
(654, 86, 'es', 'Hessen'),
(655, 87, 'es', 'Mecklenburg-Vorpommern'),
(656, 88, 'es', 'Nordrhein-Westfalen'),
(657, 89, 'es', 'Rheinland-Pfalz'),
(658, 90, 'es', 'Saarland'),
(659, 91, 'es', 'Sachsen'),
(660, 92, 'es', 'Sachsen-Anhalt'),
(661, 93, 'es', 'Schleswig-Holstein'),
(662, 94, 'es', 'Thüringen'),
(663, 95, 'es', 'Wien'),
(664, 96, 'es', 'Niederösterreich'),
(665, 97, 'es', 'Oberösterreich'),
(666, 98, 'es', 'Salzburg'),
(667, 99, 'es', 'Kärnten'),
(668, 100, 'es', 'Steiermark'),
(669, 101, 'es', 'Tirol'),
(670, 102, 'es', 'Burgenland'),
(671, 103, 'es', 'Vorarlberg'),
(672, 104, 'es', 'Aargau'),
(673, 105, 'es', 'Appenzell Innerrhoden'),
(674, 106, 'es', 'Appenzell Ausserrhoden'),
(675, 107, 'es', 'Bern'),
(676, 108, 'es', 'Basel-Landschaft'),
(677, 109, 'es', 'Basel-Stadt'),
(678, 110, 'es', 'Freiburg'),
(679, 111, 'es', 'Genf'),
(680, 112, 'es', 'Glarus'),
(681, 113, 'es', 'Graubünden'),
(682, 114, 'es', 'Jura'),
(683, 115, 'es', 'Luzern'),
(684, 116, 'es', 'Neuenburg'),
(685, 117, 'es', 'Nidwalden'),
(686, 118, 'es', 'Obwalden'),
(687, 119, 'es', 'St. Gallen'),
(688, 120, 'es', 'Schaffhausen'),
(689, 121, 'es', 'Solothurn'),
(690, 122, 'es', 'Schwyz'),
(691, 123, 'es', 'Thurgau'),
(692, 124, 'es', 'Tessin'),
(693, 125, 'es', 'Uri'),
(694, 126, 'es', 'Waadt'),
(695, 127, 'es', 'Wallis'),
(696, 128, 'es', 'Zug'),
(697, 129, 'es', 'Zürich'),
(698, 130, 'es', 'La Coruña'),
(699, 131, 'es', 'Álava'),
(700, 132, 'es', 'Albacete'),
(701, 133, 'es', 'Alicante'),
(702, 134, 'es', 'Almería'),
(703, 135, 'es', 'Asturias'),
(704, 136, 'es', 'Ávila'),
(705, 137, 'es', 'Badajoz'),
(706, 138, 'es', 'Baleares'),
(707, 139, 'es', 'Barcelona'),
(708, 140, 'es', 'Burgos'),
(709, 141, 'es', 'Cáceres'),
(710, 142, 'es', 'Cádiz'),
(711, 143, 'es', 'Cantabria'),
(712, 144, 'es', 'Castellón'),
(713, 145, 'es', 'Ceuta'),
(714, 146, 'es', 'Ciudad Real'),
(715, 147, 'es', 'Córdoba'),
(716, 148, 'es', 'Cuenca'),
(717, 149, 'es', 'Gerona'),
(718, 150, 'es', 'Granada'),
(719, 151, 'es', 'Guadalajara'),
(720, 152, 'es', 'Guipúzcoa'),
(721, 153, 'es', 'Huelva'),
(722, 154, 'es', 'Huesca'),
(723, 155, 'es', 'Jaén'),
(724, 156, 'es', 'La Rioja'),
(725, 157, 'es', 'Las Palmas'),
(726, 158, 'es', 'León'),
(727, 159, 'es', 'Lérida'),
(728, 160, 'es', 'Lugo'),
(729, 161, 'es', 'Madrid'),
(730, 162, 'es', 'Málaga'),
(731, 163, 'es', 'Melilla'),
(732, 164, 'es', 'Murcia'),
(733, 165, 'es', 'Navarra'),
(734, 166, 'es', 'Orense'),
(735, 167, 'es', 'Palencia'),
(736, 168, 'es', 'Pontevedra'),
(737, 169, 'es', 'Salamanca'),
(738, 170, 'es', 'Santa Cruz de Tenerife'),
(739, 171, 'es', 'Segovia'),
(740, 172, 'es', 'Sevilla'),
(741, 173, 'es', 'Soria'),
(742, 174, 'es', 'Tarragona'),
(743, 175, 'es', 'Teruel'),
(744, 176, 'es', 'Toledo'),
(745, 177, 'es', 'Valencia'),
(746, 178, 'es', 'Valladolid'),
(747, 179, 'es', 'Vizcaya'),
(748, 180, 'es', 'Zamora'),
(749, 181, 'es', 'Zaragoza'),
(750, 182, 'es', 'Ain'),
(751, 183, 'es', 'Aisne'),
(752, 184, 'es', 'Allier'),
(753, 185, 'es', 'Alpes-de-Haute-Provence'),
(754, 186, 'es', 'Hautes-Alpes'),
(755, 187, 'es', 'Alpes-Maritimes'),
(756, 188, 'es', 'Ardèche'),
(757, 189, 'es', 'Ardennes'),
(758, 190, 'es', 'Ariège'),
(759, 191, 'es', 'Aube'),
(760, 192, 'es', 'Aude'),
(761, 193, 'es', 'Aveyron'),
(762, 194, 'es', 'Bouches-du-Rhône'),
(763, 195, 'es', 'Calvados'),
(764, 196, 'es', 'Cantal'),
(765, 197, 'es', 'Charente'),
(766, 198, 'es', 'Charente-Maritime'),
(767, 199, 'es', 'Cher'),
(768, 200, 'es', 'Corrèze'),
(769, 201, 'es', 'Corse-du-Sud'),
(770, 202, 'es', 'Haute-Corse'),
(771, 203, 'es', 'Côte-d\'Or'),
(772, 204, 'es', 'Côtes-d\'Armor'),
(773, 205, 'es', 'Creuse'),
(774, 206, 'es', 'Dordogne'),
(775, 207, 'es', 'Doubs'),
(776, 208, 'es', 'Drôme'),
(777, 209, 'es', 'Eure'),
(778, 210, 'es', 'Eure-et-Loir'),
(779, 211, 'es', 'Finistère'),
(780, 212, 'es', 'Gard'),
(781, 213, 'es', 'Haute-Garonne'),
(782, 214, 'es', 'Gers'),
(783, 215, 'es', 'Gironde'),
(784, 216, 'es', 'Hérault'),
(785, 217, 'es', 'Ille-et-Vilaine'),
(786, 218, 'es', 'Indre'),
(787, 219, 'es', 'Indre-et-Loire'),
(788, 220, 'es', 'Isère'),
(789, 221, 'es', 'Jura'),
(790, 222, 'es', 'Landes'),
(791, 223, 'es', 'Loir-et-Cher'),
(792, 224, 'es', 'Loire'),
(793, 225, 'es', 'Haute-Loire'),
(794, 226, 'es', 'Loire-Atlantique'),
(795, 227, 'es', 'Loiret'),
(796, 228, 'es', 'Lot'),
(797, 229, 'es', 'Lot-et-Garonne'),
(798, 230, 'es', 'Lozère'),
(799, 231, 'es', 'Maine-et-Loire'),
(800, 232, 'es', 'Manche'),
(801, 233, 'es', 'Marne'),
(802, 234, 'es', 'Haute-Marne'),
(803, 235, 'es', 'Mayenne'),
(804, 236, 'es', 'Meurthe-et-Moselle'),
(805, 237, 'es', 'Meuse'),
(806, 238, 'es', 'Morbihan'),
(807, 239, 'es', 'Moselle'),
(808, 240, 'es', 'Nièvre'),
(809, 241, 'es', 'Nord'),
(810, 242, 'es', 'Oise'),
(811, 243, 'es', 'Orne'),
(812, 244, 'es', 'Pas-de-Calais'),
(813, 245, 'es', 'Puy-de-Dôme'),
(814, 246, 'es', 'Pyrénées-Atlantiques'),
(815, 247, 'es', 'Hautes-Pyrénées'),
(816, 248, 'es', 'Pyrénées-Orientales'),
(817, 249, 'es', 'Bas-Rhin'),
(818, 250, 'es', 'Haut-Rhin'),
(819, 251, 'es', 'Rhône'),
(820, 252, 'es', 'Haute-Saône'),
(821, 253, 'es', 'Saône-et-Loire'),
(822, 254, 'es', 'Sarthe'),
(823, 255, 'es', 'Savoie'),
(824, 256, 'es', 'Haute-Savoie'),
(825, 257, 'es', 'Paris'),
(826, 258, 'es', 'Seine-Maritime'),
(827, 259, 'es', 'Seine-et-Marne'),
(828, 260, 'es', 'Yvelines'),
(829, 261, 'es', 'Deux-Sèvres'),
(830, 262, 'es', 'Somme'),
(831, 263, 'es', 'Tarn'),
(832, 264, 'es', 'Tarn-et-Garonne'),
(833, 265, 'es', 'Var'),
(834, 266, 'es', 'Vaucluse'),
(835, 267, 'es', 'Vendée'),
(836, 268, 'es', 'Vienne'),
(837, 269, 'es', 'Haute-Vienne'),
(838, 270, 'es', 'Vosges'),
(839, 271, 'es', 'Yonne'),
(840, 272, 'es', 'Territoire-de-Belfort'),
(841, 273, 'es', 'Essonne'),
(842, 274, 'es', 'Hauts-de-Seine'),
(843, 275, 'es', 'Seine-Saint-Denis'),
(844, 276, 'es', 'Val-de-Marne'),
(845, 277, 'es', 'Val-d\'Oise'),
(846, 278, 'es', 'Alba'),
(847, 279, 'es', 'Arad'),
(848, 280, 'es', 'Argeş'),
(849, 281, 'es', 'Bacău'),
(850, 282, 'es', 'Bihor'),
(851, 283, 'es', 'Bistriţa-Năsăud'),
(852, 284, 'es', 'Botoşani'),
(853, 285, 'es', 'Braşov'),
(854, 286, 'es', 'Brăila'),
(855, 287, 'es', 'Bucureşti'),
(856, 288, 'es', 'Buzău'),
(857, 289, 'es', 'Caraş-Severin'),
(858, 290, 'es', 'Călăraşi'),
(859, 291, 'es', 'Cluj'),
(860, 292, 'es', 'Constanţa'),
(861, 293, 'es', 'Covasna'),
(862, 294, 'es', 'Dâmboviţa'),
(863, 295, 'es', 'Dolj'),
(864, 296, 'es', 'Galaţi'),
(865, 297, 'es', 'Giurgiu'),
(866, 298, 'es', 'Gorj'),
(867, 299, 'es', 'Harghita'),
(868, 300, 'es', 'Hunedoara'),
(869, 301, 'es', 'Ialomiţa'),
(870, 302, 'es', 'Iaşi'),
(871, 303, 'es', 'Ilfov'),
(872, 304, 'es', 'Maramureş'),
(873, 305, 'es', 'Mehedinţi'),
(874, 306, 'es', 'Mureş'),
(875, 307, 'es', 'Neamţ'),
(876, 308, 'es', 'Olt'),
(877, 309, 'es', 'Prahova'),
(878, 310, 'es', 'Satu-Mare'),
(879, 311, 'es', 'Sălaj'),
(880, 312, 'es', 'Sibiu'),
(881, 313, 'es', 'Suceava'),
(882, 314, 'es', 'Teleorman'),
(883, 315, 'es', 'Timiş'),
(884, 316, 'es', 'Tulcea'),
(885, 317, 'es', 'Vaslui'),
(886, 318, 'es', 'Vâlcea'),
(887, 319, 'es', 'Vrancea'),
(888, 320, 'es', 'Lappi'),
(889, 321, 'es', 'Pohjois-Pohjanmaa'),
(890, 322, 'es', 'Kainuu'),
(891, 323, 'es', 'Pohjois-Karjala'),
(892, 324, 'es', 'Pohjois-Savo'),
(893, 325, 'es', 'Etelä-Savo'),
(894, 326, 'es', 'Etelä-Pohjanmaa'),
(895, 327, 'es', 'Pohjanmaa'),
(896, 328, 'es', 'Pirkanmaa'),
(897, 329, 'es', 'Satakunta'),
(898, 330, 'es', 'Keski-Pohjanmaa'),
(899, 331, 'es', 'Keski-Suomi'),
(900, 332, 'es', 'Varsinais-Suomi'),
(901, 333, 'es', 'Etelä-Karjala'),
(902, 334, 'es', 'Päijät-Häme'),
(903, 335, 'es', 'Kanta-Häme'),
(904, 336, 'es', 'Uusimaa'),
(905, 337, 'es', 'Itä-Uusimaa'),
(906, 338, 'es', 'Kymenlaakso'),
(907, 339, 'es', 'Ahvenanmaa'),
(908, 340, 'es', 'Harjumaa'),
(909, 341, 'es', 'Hiiumaa'),
(910, 342, 'es', 'country_state_ida-Virumaa'),
(911, 343, 'es', 'Jõgevamaa'),
(912, 344, 'es', 'Järvamaa'),
(913, 345, 'es', 'Läänemaa'),
(914, 346, 'es', 'Lääne-Virumaa'),
(915, 347, 'es', 'Põlvamaa'),
(916, 348, 'es', 'Pärnumaa'),
(917, 349, 'es', 'Raplamaa'),
(918, 350, 'es', 'Saaremaa'),
(919, 351, 'es', 'Tartumaa'),
(920, 352, 'es', 'Valgamaa'),
(921, 353, 'es', 'Viljandimaa'),
(922, 354, 'es', 'Võrumaa'),
(923, 355, 'es', 'Daugavpils'),
(924, 356, 'es', 'Jelgava'),
(925, 357, 'es', 'Jēkabpils'),
(926, 358, 'es', 'Jūrmala'),
(927, 359, 'es', 'Liepāja'),
(928, 360, 'es', 'Liepājas novads'),
(929, 361, 'es', 'Rēzekne'),
(930, 362, 'es', 'Rīga'),
(931, 363, 'es', 'Rīgas novads'),
(932, 364, 'es', 'Valmiera'),
(933, 365, 'es', 'Ventspils'),
(934, 366, 'es', 'Aglonas novads'),
(935, 367, 'es', 'Aizkraukles novads'),
(936, 368, 'es', 'Aizputes novads'),
(937, 369, 'es', 'Aknīstes novads'),
(938, 370, 'es', 'Alojas novads'),
(939, 371, 'es', 'Alsungas novads'),
(940, 372, 'es', 'Alūksnes novads'),
(941, 373, 'es', 'Amatas novads'),
(942, 374, 'es', 'Apes novads'),
(943, 375, 'es', 'Auces novads'),
(944, 376, 'es', 'Babītes novads'),
(945, 377, 'es', 'Baldones novads'),
(946, 378, 'es', 'Baltinavas novads'),
(947, 379, 'es', 'Balvu novads'),
(948, 380, 'es', 'Bauskas novads'),
(949, 381, 'es', 'Beverīnas novads'),
(950, 382, 'es', 'Brocēnu novads'),
(951, 383, 'es', 'Burtnieku novads'),
(952, 384, 'es', 'Carnikavas novads'),
(953, 385, 'es', 'Cesvaines novads'),
(954, 386, 'es', 'Ciblas novads'),
(955, 387, 'es', 'Cēsu novads'),
(956, 388, 'es', 'Dagdas novads'),
(957, 389, 'es', 'Daugavpils novads'),
(958, 390, 'es', 'Dobeles novads'),
(959, 391, 'es', 'Dundagas novads'),
(960, 392, 'es', 'Durbes novads'),
(961, 393, 'es', 'Engures novads'),
(962, 394, 'es', 'Garkalnes novads'),
(963, 395, 'es', 'Grobiņas novads'),
(964, 396, 'es', 'Gulbenes novads'),
(965, 397, 'es', 'Iecavas novads'),
(966, 398, 'es', 'Ikšķiles novads'),
(967, 399, 'es', 'Ilūkstes novads'),
(968, 400, 'es', 'Inčukalna novads'),
(969, 401, 'es', 'Jaunjelgavas novads'),
(970, 402, 'es', 'Jaunpiebalgas novads'),
(971, 403, 'es', 'Jaunpils novads'),
(972, 404, 'es', 'Jelgavas novads'),
(973, 405, 'es', 'Jēkabpils novads'),
(974, 406, 'es', 'Kandavas novads'),
(975, 407, 'es', 'Kokneses novads'),
(976, 408, 'es', 'Krimuldas novads'),
(977, 409, 'es', 'Krustpils novads'),
(978, 410, 'es', 'Krāslavas novads'),
(979, 411, 'es', 'Kuldīgas novads'),
(980, 412, 'es', 'Kārsavas novads'),
(981, 413, 'es', 'Lielvārdes novads'),
(982, 414, 'es', 'Limbažu novads'),
(983, 415, 'es', 'Lubānas novads'),
(984, 416, 'es', 'Ludzas novads'),
(985, 417, 'es', 'Līgatnes novads'),
(986, 418, 'es', 'Līvānu novads'),
(987, 419, 'es', 'Madonas novads'),
(988, 420, 'es', 'Mazsalacas novads'),
(989, 421, 'es', 'Mālpils novads'),
(990, 422, 'es', 'Mārupes novads'),
(991, 423, 'es', 'Naukšēnu novads'),
(992, 424, 'es', 'Neretas novads'),
(993, 425, 'es', 'Nīcas novads'),
(994, 426, 'es', 'Ogres novads'),
(995, 427, 'es', 'Olaines novads'),
(996, 428, 'es', 'Ozolnieku novads'),
(997, 429, 'es', 'Preiļu novads'),
(998, 430, 'es', 'Priekules novads'),
(999, 431, 'es', 'Priekuļu novads'),
(1000, 432, 'es', 'Pārgaujas novads'),
(1001, 433, 'es', 'Pāvilostas novads'),
(1002, 434, 'es', 'Pļaviņu novads'),
(1003, 435, 'es', 'Raunas novads'),
(1004, 436, 'es', 'Riebiņu novads'),
(1005, 437, 'es', 'Rojas novads'),
(1006, 438, 'es', 'Ropažu novads'),
(1007, 439, 'es', 'Rucavas novads'),
(1008, 440, 'es', 'Rugāju novads'),
(1009, 441, 'es', 'Rundāles novads'),
(1010, 442, 'es', 'Rēzeknes novads'),
(1011, 443, 'es', 'Rūjienas novads'),
(1012, 444, 'es', 'Salacgrīvas novads'),
(1013, 445, 'es', 'Salas novads'),
(1014, 446, 'es', 'Salaspils novads'),
(1015, 447, 'es', 'Saldus novads'),
(1016, 448, 'es', 'Saulkrastu novads'),
(1017, 449, 'es', 'Siguldas novads'),
(1018, 450, 'es', 'Skrundas novads'),
(1019, 451, 'es', 'Skrīveru novads'),
(1020, 452, 'es', 'Smiltenes novads'),
(1021, 453, 'es', 'Stopiņu novads'),
(1022, 454, 'es', 'Strenču novads'),
(1023, 455, 'es', 'Sējas novads'),
(1024, 456, 'es', 'Talsu novads'),
(1025, 457, 'es', 'Tukuma novads'),
(1026, 458, 'es', 'Tērvetes novads'),
(1027, 459, 'es', 'Vaiņodes novads'),
(1028, 460, 'es', 'Valkas novads'),
(1029, 461, 'es', 'Valmieras novads'),
(1030, 462, 'es', 'Varakļānu novads'),
(1031, 463, 'es', 'Vecpiebalgas novads'),
(1032, 464, 'es', 'Vecumnieku novads'),
(1033, 465, 'es', 'Ventspils novads'),
(1034, 466, 'es', 'Viesītes novads'),
(1035, 467, 'es', 'Viļakas novads'),
(1036, 468, 'es', 'Viļānu novads'),
(1037, 469, 'es', 'Vārkavas novads'),
(1038, 470, 'es', 'Zilupes novads'),
(1039, 471, 'es', 'Ādažu novads'),
(1040, 472, 'es', 'Ērgļu novads'),
(1041, 473, 'es', 'Ķeguma novads'),
(1042, 474, 'es', 'Ķekavas novads'),
(1043, 475, 'es', 'Alytaus Apskritis'),
(1044, 476, 'es', 'Kauno Apskritis'),
(1045, 477, 'es', 'Klaipėdos Apskritis'),
(1046, 478, 'es', 'Marijampolės Apskritis'),
(1047, 479, 'es', 'Panevėžio Apskritis'),
(1048, 480, 'es', 'Šiaulių Apskritis'),
(1049, 481, 'es', 'Tauragės Apskritis'),
(1050, 482, 'es', 'Telšių Apskritis'),
(1051, 483, 'es', 'Utenos Apskritis'),
(1052, 484, 'es', 'Vilniaus Apskritis'),
(1053, 485, 'es', 'Acre'),
(1054, 486, 'es', 'Alagoas'),
(1055, 487, 'es', 'Amapá'),
(1056, 488, 'es', 'Amazonas'),
(1057, 489, 'es', 'Bahía'),
(1058, 490, 'es', 'Ceará'),
(1059, 491, 'es', 'Espíritu Santo'),
(1060, 492, 'es', 'Goiás'),
(1061, 493, 'es', 'Maranhão'),
(1062, 494, 'es', 'Mato Grosso'),
(1063, 495, 'es', 'Mato Grosso del Sur'),
(1064, 496, 'es', 'Minas Gerais'),
(1065, 497, 'es', 'Pará'),
(1066, 498, 'es', 'Paraíba'),
(1067, 499, 'es', 'Paraná'),
(1068, 500, 'es', 'Pernambuco'),
(1069, 501, 'es', 'Piauí'),
(1070, 502, 'es', 'Río de Janeiro'),
(1071, 503, 'es', 'Río Grande del Norte'),
(1072, 504, 'es', 'Río Grande del Sur'),
(1073, 505, 'es', 'Rondônia'),
(1074, 506, 'es', 'Roraima'),
(1075, 507, 'es', 'Santa Catarina'),
(1076, 508, 'es', 'São Paulo'),
(1077, 509, 'es', 'Sergipe'),
(1078, 510, 'es', 'Tocantins'),
(1079, 511, 'es', 'Distrito Federal'),
(1080, 512, 'es', 'Zagrebačka županija'),
(1081, 513, 'es', 'Krapinsko-zagorska županija'),
(1082, 514, 'es', 'Sisačko-moslavačka županija'),
(1083, 515, 'es', 'Karlovačka županija'),
(1084, 516, 'es', 'Varaždinska županija'),
(1085, 517, 'es', 'Koprivničko-križevačka županija'),
(1086, 518, 'es', 'Bjelovarsko-bilogorska županija'),
(1087, 519, 'es', 'Primorsko-goranska županija'),
(1088, 520, 'es', 'Ličko-senjska županija'),
(1089, 521, 'es', 'Virovitičko-podravska županija'),
(1090, 522, 'es', 'Požeško-slavonska županija'),
(1091, 523, 'es', 'Brodsko-posavska županija'),
(1092, 524, 'es', 'Zadarska županija'),
(1093, 525, 'es', 'Osječko-baranjska županija'),
(1094, 526, 'es', 'Šibensko-kninska županija'),
(1095, 527, 'es', 'Vukovarsko-srijemska županija'),
(1096, 528, 'es', 'Splitsko-dalmatinska županija'),
(1097, 529, 'es', 'Istarska županija'),
(1098, 530, 'es', 'Dubrovačko-neretvanska županija'),
(1099, 531, 'es', 'Međimurska županija'),
(1100, 532, 'es', 'Grad Zagreb'),
(1101, 533, 'es', 'Andaman and Nicobar Islands'),
(1102, 534, 'es', 'Andhra Pradesh'),
(1103, 535, 'es', 'Arunachal Pradesh'),
(1104, 536, 'es', 'Assam'),
(1105, 537, 'es', 'Bihar'),
(1106, 538, 'es', 'Chandigarh'),
(1107, 539, 'es', 'Chhattisgarh'),
(1108, 540, 'es', 'Dadra and Nagar Haveli'),
(1109, 541, 'es', 'Daman and Diu'),
(1110, 542, 'es', 'Delhi'),
(1111, 543, 'es', 'Goa'),
(1112, 544, 'es', 'Gujarat'),
(1113, 545, 'es', 'Haryana'),
(1114, 546, 'es', 'Himachal Pradesh'),
(1115, 547, 'es', 'Jammu and Kashmir'),
(1116, 548, 'es', 'Jharkhand'),
(1117, 549, 'es', 'Karnataka'),
(1118, 550, 'es', 'Kerala'),
(1119, 551, 'es', 'Lakshadweep'),
(1120, 552, 'es', 'Madhya Pradesh'),
(1121, 553, 'es', 'Maharashtra'),
(1122, 554, 'es', 'Manipur'),
(1123, 555, 'es', 'Meghalaya'),
(1124, 556, 'es', 'Mizoram'),
(1125, 557, 'es', 'Nagaland'),
(1126, 558, 'es', 'Odisha'),
(1127, 559, 'es', 'Puducherry'),
(1128, 560, 'es', 'Punjab'),
(1129, 561, 'es', 'Rajasthan'),
(1130, 562, 'es', 'Sikkim'),
(1131, 563, 'es', 'Tamil Nadu'),
(1132, 564, 'es', 'Telangana'),
(1133, 565, 'es', 'Tripura'),
(1134, 566, 'es', 'Uttar Pradesh'),
(1135, 567, 'es', 'Uttarakhand'),
(1136, 568, 'es', 'West Bengal'),
(1137, 569, 'es', 'Alto Paraguay'),
(1138, 570, 'es', 'Alto Paraná'),
(1139, 571, 'es', 'Amambay'),
(1140, 572, 'es', 'Asunción'),
(1141, 573, 'es', 'Boquerón'),
(1142, 574, 'es', 'Caaguazú'),
(1143, 575, 'es', 'Caazapá'),
(1144, 576, 'es', 'Canindeyú'),
(1145, 577, 'es', 'Central'),
(1146, 578, 'es', 'Concepción'),
(1147, 579, 'es', 'Cordillera'),
(1148, 580, 'es', 'Guairá'),
(1149, 581, 'es', 'Itapúa'),
(1150, 582, 'es', 'Misiones'),
(1151, 583, 'es', 'Paraguarí'),
(1152, 584, 'es', 'Presidente Hayes'),
(1153, 585, 'es', 'San Pedro'),
(1154, 586, 'es', 'Ñeembucú'),
(1155, 1, 'fa', 'آلاباما'),
(1156, 2, 'fa', 'آلاسکا'),
(1157, 3, 'fa', 'ساموآ آمریکایی'),
(1158, 4, 'fa', 'آریزونا'),
(1159, 5, 'fa', 'آرکانزاس'),
(1160, 6, 'fa', 'نیروهای مسلح آفریقا'),
(1161, 7, 'fa', 'Armed Forces America'),
(1162, 8, 'fa', 'نیروهای مسلح کانادا'),
(1163, 9, 'fa', 'نیروهای مسلح اروپا'),
(1164, 10, 'fa', 'نیروهای مسلح خاورمیانه'),
(1165, 11, 'fa', 'نیروهای مسلح اقیانوس آرام'),
(1166, 12, 'fa', 'کالیفرنیا'),
(1167, 13, 'fa', 'کلرادو'),
(1168, 14, 'fa', 'کانکتیکات'),
(1169, 15, 'fa', 'دلاور'),
(1170, 16, 'fa', 'منطقه کلمبیا'),
(1171, 17, 'fa', 'ایالات فدرال میکرونزی'),
(1172, 18, 'fa', 'فلوریدا'),
(1173, 19, 'fa', 'جورجیا'),
(1174, 20, 'fa', 'گوام'),
(1175, 21, 'fa', 'هاوایی'),
(1176, 22, 'fa', 'آیداهو'),
(1177, 23, 'fa', 'ایلینویز'),
(1178, 24, 'fa', 'ایندیانا'),
(1179, 25, 'fa', 'آیووا'),
(1180, 26, 'fa', 'کانزاس'),
(1181, 27, 'fa', 'کنتاکی'),
(1182, 28, 'fa', 'لوئیزیانا'),
(1183, 29, 'fa', 'ماین'),
(1184, 30, 'fa', 'مای'),
(1185, 31, 'fa', 'مریلند'),
(1186, 32, 'fa', ' '),
(1187, 33, 'fa', 'میشیگان'),
(1188, 34, 'fa', 'مینه سوتا'),
(1189, 35, 'fa', 'می سی سی پی'),
(1190, 36, 'fa', 'میسوری'),
(1191, 37, 'fa', 'مونتانا'),
(1192, 38, 'fa', 'نبراسکا'),
(1193, 39, 'fa', 'نواد'),
(1194, 40, 'fa', 'نیوهمپشایر'),
(1195, 41, 'fa', 'نیوجرسی'),
(1196, 42, 'fa', 'نیومکزیکو'),
(1197, 43, 'fa', 'نیویورک'),
(1198, 44, 'fa', 'کارولینای شمالی'),
(1199, 45, 'fa', 'داکوتای شمالی'),
(1200, 46, 'fa', 'جزایر ماریانای شمالی'),
(1201, 47, 'fa', 'اوهایو'),
(1202, 48, 'fa', 'اوکلاهما'),
(1203, 49, 'fa', 'اورگان'),
(1204, 50, 'fa', 'پالائو'),
(1205, 51, 'fa', 'پنسیلوانیا'),
(1206, 52, 'fa', 'پورتوریکو'),
(1207, 53, 'fa', 'رود آیلند'),
(1208, 54, 'fa', 'کارولینای جنوبی'),
(1209, 55, 'fa', 'داکوتای جنوبی'),
(1210, 56, 'fa', 'تنسی'),
(1211, 57, 'fa', 'تگزاس'),
(1212, 58, 'fa', 'یوتا'),
(1213, 59, 'fa', 'ورمونت'),
(1214, 60, 'fa', 'جزایر ویرجین'),
(1215, 61, 'fa', 'ویرجینیا'),
(1216, 62, 'fa', 'واشنگتن'),
(1217, 63, 'fa', 'ویرجینیای غربی'),
(1218, 64, 'fa', 'ویسکانسین'),
(1219, 65, 'fa', 'وایومینگ'),
(1220, 66, 'fa', 'آلبرتا'),
(1221, 67, 'fa', 'بریتیش کلمبیا'),
(1222, 68, 'fa', 'مانیتوبا'),
(1223, 69, 'fa', 'نیوفاندلند و لابرادور'),
(1224, 70, 'fa', 'نیوبرانزویک'),
(1225, 71, 'fa', 'نوا اسکوشیا'),
(1226, 72, 'fa', 'سرزمینهای شمال غربی'),
(1227, 73, 'fa', 'نوناووت'),
(1228, 74, 'fa', 'انتاریو'),
(1229, 75, 'fa', 'جزیره پرنس ادوارد'),
(1230, 76, 'fa', 'کبک'),
(1231, 77, 'fa', 'ساسکاتچوان'),
(1232, 78, 'fa', 'قلمرو یوکان'),
(1233, 79, 'fa', 'نیدرزاکسن'),
(1234, 80, 'fa', 'بادن-وورتمبرگ'),
(1235, 81, 'fa', 'بایرن'),
(1236, 82, 'fa', 'برلین'),
(1237, 83, 'fa', 'براندنبورگ'),
(1238, 84, 'fa', 'برمن'),
(1239, 85, 'fa', 'هامبور'),
(1240, 86, 'fa', 'هسن'),
(1241, 87, 'fa', 'مکلنبورگ-وورپومرن'),
(1242, 88, 'fa', 'نوردراین-وستفالن'),
(1243, 89, 'fa', 'راینلاند-پلاتینات'),
(1244, 90, 'fa', 'سارلند'),
(1245, 91, 'fa', 'ساچسن'),
(1246, 92, 'fa', 'ساچسن-آنهالت'),
(1247, 93, 'fa', 'شلسویگ-هولشتاین'),
(1248, 94, 'fa', 'تورینگی'),
(1249, 95, 'fa', 'وین'),
(1250, 96, 'fa', 'اتریش پایین'),
(1251, 97, 'fa', 'اتریش فوقانی'),
(1252, 98, 'fa', 'سالزبورگ'),
(1253, 99, 'fa', 'کارنتا'),
(1254, 100, 'fa', 'Steiermar'),
(1255, 101, 'fa', 'تیرول'),
(1256, 102, 'fa', 'بورگنلن'),
(1257, 103, 'fa', 'Vorarlber'),
(1258, 104, 'fa', 'آرگ'),
(1259, 105, 'fa', ''),
(1260, 106, 'fa', 'اپنزلسرهودن'),
(1261, 107, 'fa', 'بر'),
(1262, 108, 'fa', 'بازل-لندشفت'),
(1263, 109, 'fa', 'بازل استاد'),
(1264, 110, 'fa', 'فرایبورگ'),
(1265, 111, 'fa', 'گنف'),
(1266, 112, 'fa', 'گلاروس'),
(1267, 113, 'fa', 'Graubünde'),
(1268, 114, 'fa', 'ژورا'),
(1269, 115, 'fa', 'لوزرن'),
(1270, 116, 'fa', 'نوینبور'),
(1271, 117, 'fa', 'نیدالد'),
(1272, 118, 'fa', 'اوبولدن'),
(1273, 119, 'fa', 'سنت گالن'),
(1274, 120, 'fa', 'شافهاوز'),
(1275, 121, 'fa', 'سولوتور'),
(1276, 122, 'fa', 'شووی'),
(1277, 123, 'fa', 'تورگاو'),
(1278, 124, 'fa', 'تسسی'),
(1279, 125, 'fa', 'اوری'),
(1280, 126, 'fa', 'وادت'),
(1281, 127, 'fa', 'والی'),
(1282, 128, 'fa', 'ز'),
(1283, 129, 'fa', 'زوریخ'),
(1284, 130, 'fa', 'کورونا'),
(1285, 131, 'fa', 'آلاوا'),
(1286, 132, 'fa', 'آلبوم'),
(1287, 133, 'fa', 'آلیکانت'),
(1288, 134, 'fa', 'آلمریا'),
(1289, 135, 'fa', 'آستوریا'),
(1290, 136, 'fa', 'آویلا'),
(1291, 137, 'fa', 'باداژوز'),
(1292, 138, 'fa', 'ضرب و شتم'),
(1293, 139, 'fa', 'بارسلون'),
(1294, 140, 'fa', 'بورگو'),
(1295, 141, 'fa', 'کاسر'),
(1296, 142, 'fa', 'کادی'),
(1297, 143, 'fa', 'کانتابریا'),
(1298, 144, 'fa', 'کاستلون'),
(1299, 145, 'fa', 'سوت'),
(1300, 146, 'fa', 'سیوداد واقعی'),
(1301, 147, 'fa', 'کوردوب'),
(1302, 148, 'fa', 'Cuenc'),
(1303, 149, 'fa', 'جیرون'),
(1304, 150, 'fa', 'گراناد'),
(1305, 151, 'fa', 'گوادالاجار'),
(1306, 152, 'fa', 'Guipuzcoa'),
(1307, 153, 'fa', 'هولوا'),
(1308, 154, 'fa', 'هوسک'),
(1309, 155, 'fa', 'جی'),
(1310, 156, 'fa', 'لا ریوجا'),
(1311, 157, 'fa', 'لاس پالماس'),
(1312, 158, 'fa', 'لئو'),
(1313, 159, 'fa', 'Lleid'),
(1314, 160, 'fa', 'لوگ'),
(1315, 161, 'fa', 'مادری'),
(1316, 162, 'fa', 'مالاگ'),
(1317, 163, 'fa', 'ملیلی'),
(1318, 164, 'fa', 'مورسیا'),
(1319, 165, 'fa', 'ناوار'),
(1320, 166, 'fa', 'اورنس'),
(1321, 167, 'fa', 'پالنسی'),
(1322, 168, 'fa', 'پونتوودر'),
(1323, 169, 'fa', 'سالامانک'),
(1324, 170, 'fa', 'سانتا کروز د تنریفه'),
(1325, 171, 'fa', 'سوگویا'),
(1326, 172, 'fa', 'سوی'),
(1327, 173, 'fa', 'سوریا'),
(1328, 174, 'fa', 'تاراگونا'),
(1329, 175, 'fa', 'ترئو'),
(1330, 176, 'fa', 'تولدو'),
(1331, 177, 'fa', 'والنسیا'),
(1332, 178, 'fa', 'والادولی'),
(1333, 179, 'fa', 'ویزکایا'),
(1334, 180, 'fa', 'زامور'),
(1335, 181, 'fa', 'ساراگوز'),
(1336, 182, 'fa', 'عی'),
(1337, 183, 'fa', 'آیز'),
(1338, 184, 'fa', 'آلی'),
(1339, 185, 'fa', 'آلپ-دو-هاوت-پرووانس'),
(1340, 186, 'fa', 'هاوتس آلپ'),
(1341, 187, 'fa', 'Alpes-Maritime'),
(1342, 188, 'fa', 'اردچه'),
(1343, 189, 'fa', 'آرد'),
(1344, 190, 'fa', 'محاصر'),
(1345, 191, 'fa', 'آبه'),
(1346, 192, 'fa', 'Aud'),
(1347, 193, 'fa', 'آویرون'),
(1348, 194, 'fa', 'BOCAS DO Rhône'),
(1349, 195, 'fa', 'نوعی عرق'),
(1350, 196, 'fa', 'کانتینال'),
(1351, 197, 'fa', 'چارنت'),
(1352, 198, 'fa', 'چارنت-دریایی'),
(1353, 199, 'fa', 'چ'),
(1354, 200, 'fa', 'کور'),
(1355, 201, 'fa', 'کرس دو ساد'),
(1356, 202, 'fa', 'هاوت کورس'),
(1357, 203, 'fa', 'کوستا دورکرز'),
(1358, 204, 'fa', 'تخت دارمور'),
(1359, 205, 'fa', 'درهم'),
(1360, 206, 'fa', 'دوردگن'),
(1361, 207, 'fa', 'دوب'),
(1362, 208, 'fa', 'تعریف اول'),
(1363, 209, 'fa', 'یور'),
(1364, 210, 'fa', 'Eure-et-Loi'),
(1365, 211, 'fa', 'فمینیست'),
(1366, 212, 'fa', 'باغ'),
(1367, 213, 'fa', 'اوت-گارون'),
(1368, 214, 'fa', 'گر'),
(1369, 215, 'fa', 'جیروند'),
(1370, 216, 'fa', 'هیر'),
(1371, 217, 'fa', 'هشدار داده می شود'),
(1372, 218, 'fa', 'ایندور'),
(1373, 219, 'fa', 'Indre-et-Loir'),
(1374, 220, 'fa', 'ایزر'),
(1375, 221, 'fa', 'یور'),
(1376, 222, 'fa', 'لندز'),
(1377, 223, 'fa', 'Loir-et-Che'),
(1378, 224, 'fa', 'وام گرفتن'),
(1379, 225, 'fa', 'Haute-Loir'),
(1380, 226, 'fa', 'Loire-Atlantiqu'),
(1381, 227, 'fa', 'لیرت'),
(1382, 228, 'fa', 'لوط'),
(1383, 229, 'fa', 'لوت و گارون'),
(1384, 230, 'fa', 'لوزر'),
(1385, 231, 'fa', 'ماین et-Loire'),
(1386, 232, 'fa', 'مانچ'),
(1387, 233, 'fa', 'مارن'),
(1388, 234, 'fa', 'هاوت-مارن'),
(1389, 235, 'fa', 'مایین'),
(1390, 236, 'fa', 'مورته-et-Moselle'),
(1391, 237, 'fa', 'مسخره کردن'),
(1392, 238, 'fa', 'موربیان'),
(1393, 239, 'fa', 'موزل'),
(1394, 240, 'fa', 'Nièvr'),
(1395, 241, 'fa', 'نورد'),
(1396, 242, 'fa', 'اوی'),
(1397, 243, 'fa', 'ارن'),
(1398, 244, 'fa', 'پاس-کاله'),
(1399, 245, 'fa', 'Puy-de-Dôm'),
(1400, 246, 'fa', 'Pyrénées-Atlantiques'),
(1401, 247, 'fa', 'Hautes-Pyrénée'),
(1402, 248, 'fa', 'Pyrénées-Orientales'),
(1403, 249, 'fa', 'بس راین'),
(1404, 250, 'fa', 'هاوت-رین'),
(1405, 251, 'fa', 'رو'),
(1406, 252, 'fa', 'Haute-Saône'),
(1407, 253, 'fa', 'Saône-et-Loire'),
(1408, 254, 'fa', 'سارته'),
(1409, 255, 'fa', 'ساووی'),
(1410, 256, 'fa', 'هاو-ساووی'),
(1411, 257, 'fa', 'پاری'),
(1412, 258, 'fa', 'Seine-Maritime'),
(1413, 259, 'fa', 'Seine-et-Marn'),
(1414, 260, 'fa', 'ایولینز'),
(1415, 261, 'fa', 'Deux-Sèvres'),
(1416, 262, 'fa', 'سمی'),
(1417, 263, 'fa', 'ضعف'),
(1418, 264, 'fa', 'Tarn-et-Garonne'),
(1419, 265, 'fa', 'وار'),
(1420, 266, 'fa', 'ووکلوز'),
(1421, 267, 'fa', 'وندیه'),
(1422, 268, 'fa', 'وین'),
(1423, 269, 'fa', 'هاوت-وین'),
(1424, 270, 'fa', 'رأی دادن'),
(1425, 271, 'fa', 'یون'),
(1426, 272, 'fa', 'سرزمین-دو-بلفورت'),
(1427, 273, 'fa', 'اسون'),
(1428, 274, 'fa', 'هاوتز دی سی'),
(1429, 275, 'fa', 'Seine-Saint-Deni'),
(1430, 276, 'fa', 'والد مارن'),
(1431, 277, 'fa', 'Val-d\'Ois'),
(1432, 278, 'fa', 'آلبا'),
(1433, 279, 'fa', 'آرا'),
(1434, 280, 'fa', 'Argeș'),
(1435, 281, 'fa', 'باکو'),
(1436, 282, 'fa', 'بیهور'),
(1437, 283, 'fa', 'بیستریا-نسوود'),
(1438, 284, 'fa', 'بوتانی'),
(1439, 285, 'fa', 'برازوف'),
(1440, 286, 'fa', 'Brăila'),
(1441, 287, 'fa', 'București'),
(1442, 288, 'fa', 'بوز'),
(1443, 289, 'fa', 'کارا- Severin'),
(1444, 290, 'fa', 'کالیراسی'),
(1445, 291, 'fa', 'كلوژ'),
(1446, 292, 'fa', 'کنستانس'),
(1447, 293, 'fa', 'کواسنا'),
(1448, 294, 'fa', 'Dâmbovița'),
(1449, 295, 'fa', 'دال'),
(1450, 296, 'fa', 'گالشی'),
(1451, 297, 'fa', 'جورجیو'),
(1452, 298, 'fa', 'گور'),
(1453, 299, 'fa', 'هارگیتا'),
(1454, 300, 'fa', 'هوندهار'),
(1455, 301, 'fa', 'ایالومیشا'),
(1456, 302, 'fa', 'Iași'),
(1457, 303, 'fa', 'Ilfo'),
(1458, 304, 'fa', 'Maramureș'),
(1459, 305, 'fa', 'Mehedinți'),
(1460, 306, 'fa', 'Mureș'),
(1461, 307, 'fa', 'Neamț'),
(1462, 308, 'fa', 'اولت'),
(1463, 309, 'fa', 'پرهوا'),
(1464, 310, 'fa', 'ستو ماره'),
(1465, 311, 'fa', 'سلاج'),
(1466, 312, 'fa', 'سیبیو'),
(1467, 313, 'fa', 'سوساو'),
(1468, 314, 'fa', 'تلورمان'),
(1469, 315, 'fa', 'تیمیچ'),
(1470, 316, 'fa', 'تولسا'),
(1471, 317, 'fa', 'واسلوئی'),
(1472, 318, 'fa', 'Vâlcea'),
(1473, 319, 'fa', 'ورانسا'),
(1474, 320, 'fa', 'لاپی'),
(1475, 321, 'fa', 'Pohjois-Pohjanmaa'),
(1476, 322, 'fa', 'کائینو'),
(1477, 323, 'fa', 'Pohjois-Karjala'),
(1478, 324, 'fa', 'Pohjois-Savo'),
(1479, 325, 'fa', 'اتل-ساوو'),
(1480, 326, 'fa', 'کسکی-پوهانما'),
(1481, 327, 'fa', 'Pohjanmaa'),
(1482, 328, 'fa', 'پیرکانما'),
(1483, 329, 'fa', 'ساتاکونتا'),
(1484, 330, 'fa', 'کسکی-پوهانما'),
(1485, 331, 'fa', 'کسکی-سوومی'),
(1486, 332, 'fa', 'Varsinais-Suomi'),
(1487, 333, 'fa', 'اتلی کرجالا'),
(1488, 334, 'fa', 'Päijät-HAM'),
(1489, 335, 'fa', 'کانتا-هوم'),
(1490, 336, 'fa', 'یوسیما'),
(1491, 337, 'fa', 'اوسیم'),
(1492, 338, 'fa', 'کیمنلاکو'),
(1493, 339, 'fa', 'آونوانما'),
(1494, 340, 'fa', 'هارژوم'),
(1495, 341, 'fa', 'سلا'),
(1496, 342, 'fa', 'آیدا-ویروما'),
(1497, 343, 'fa', 'Jõgevamaa'),
(1498, 344, 'fa', 'جوروماا'),
(1499, 345, 'fa', 'لونما'),
(1500, 346, 'fa', 'لون-ویروما'),
(1501, 347, 'fa', 'پالوماا'),
(1502, 348, 'fa', 'پورنوما'),
(1503, 349, 'fa', 'Raplama'),
(1504, 350, 'fa', 'ساارما'),
(1505, 351, 'fa', 'تارتوما'),
(1506, 352, 'fa', 'والگام'),
(1507, 353, 'fa', 'ویلجاندیم'),
(1508, 354, 'fa', 'Võrumaa'),
(1509, 355, 'fa', 'داگاوپیل'),
(1510, 356, 'fa', 'جلگاو'),
(1511, 357, 'fa', 'جکابیل'),
(1512, 358, 'fa', 'جرمل'),
(1513, 359, 'fa', 'لیپجا'),
(1514, 360, 'fa', 'شهرستان لیپاج'),
(1515, 361, 'fa', 'روژن'),
(1516, 362, 'fa', 'راگ'),
(1517, 363, 'fa', 'شهرستان ریگ'),
(1518, 364, 'fa', 'والمییرا'),
(1519, 365, 'fa', 'Ventspils'),
(1520, 366, 'fa', 'آگلوناس نوادا'),
(1521, 367, 'fa', 'تازه کاران آیزکرایکلس'),
(1522, 368, 'fa', 'تازه واردان'),
(1523, 369, 'fa', 'شهرستا'),
(1524, 370, 'fa', 'نوازندگان آلوجاس'),
(1525, 371, 'fa', 'تازه های آلسونگاس'),
(1526, 372, 'fa', 'شهرستان آلوکس'),
(1527, 373, 'fa', 'تازه کاران آماتاس'),
(1528, 374, 'fa', 'میمون های تازه'),
(1529, 375, 'fa', 'نوادا را آویز می کند'),
(1530, 376, 'fa', 'شهرستان بابی'),
(1531, 377, 'fa', 'Baldones novad'),
(1532, 378, 'fa', 'نوین های بالتیناوا'),
(1533, 379, 'fa', 'Balvu novad'),
(1534, 380, 'fa', 'نوازندگان باسکاس'),
(1535, 381, 'fa', 'شهرستان بورین'),
(1536, 382, 'fa', 'شهرستان بروچن'),
(1537, 383, 'fa', 'بوردنیکو نوآوران'),
(1538, 384, 'fa', 'تازه کارنیکاوا'),
(1539, 385, 'fa', 'نوازان سزوینس'),
(1540, 386, 'fa', 'نوادگان Cibla'),
(1541, 387, 'fa', 'شهرستان Cesis'),
(1542, 388, 'fa', 'تازه های داگدا'),
(1543, 389, 'fa', 'داوگاوپیلز نوادا'),
(1544, 390, 'fa', 'دابل نوادی'),
(1545, 391, 'fa', 'تازه کارهای دنداگاس'),
(1546, 392, 'fa', 'نوباد دوربس'),
(1547, 393, 'fa', 'مشغول تازه کارها است'),
(1548, 394, 'fa', 'گرکالنس نواد'),
(1549, 395, 'fa', 'یا شهرستان گروبی'),
(1550, 396, 'fa', 'تازه های گلبنس'),
(1551, 397, 'fa', 'Iecavas novads'),
(1552, 398, 'fa', 'شهرستان ایسکل'),
(1553, 399, 'fa', 'ایالت ایلکست'),
(1554, 400, 'fa', 'کنددو د اینچوکالن'),
(1555, 401, 'fa', 'نوجواد Jaunjelgavas'),
(1556, 402, 'fa', 'تازه های Jaunpiebalgas'),
(1557, 403, 'fa', 'شهرستان جونپیلس'),
(1558, 404, 'fa', 'شهرستان جگلو'),
(1559, 405, 'fa', 'شهرستان جکابیل'),
(1560, 406, 'fa', 'شهرستان کنداوا'),
(1561, 407, 'fa', 'شهرستان کوکنز'),
(1562, 408, 'fa', 'شهرستان کریمولد'),
(1563, 409, 'fa', 'شهرستان کرستپیل'),
(1564, 410, 'fa', 'شهرستان کراسلاو'),
(1565, 411, 'fa', 'کاندادو د کلدیگا'),
(1566, 412, 'fa', 'کاندادو د کارساوا'),
(1567, 413, 'fa', 'شهرستان لیولوارد'),
(1568, 414, 'fa', 'شهرستان لیمباشی'),
(1569, 415, 'fa', 'ای ولسوالی لوبون'),
(1570, 416, 'fa', 'شهرستان لودزا'),
(1571, 417, 'fa', 'شهرستان لیگات'),
(1572, 418, 'fa', 'شهرستان لیوانی'),
(1573, 419, 'fa', 'شهرستان مادونا'),
(1574, 420, 'fa', 'شهرستان مازسال'),
(1575, 421, 'fa', 'شهرستان مالپیلس'),
(1576, 422, 'fa', 'شهرستان Mārupe'),
(1577, 423, 'fa', 'ا کنددو د نوکشنی'),
(1578, 424, 'fa', 'کاملاً یک شهرستان'),
(1579, 425, 'fa', 'شهرستان نیکا'),
(1580, 426, 'fa', 'شهرستان اوگر'),
(1581, 427, 'fa', 'شهرستان اولین'),
(1582, 428, 'fa', 'شهرستان اوزولنیکی'),
(1583, 429, 'fa', 'شهرستان پرلیلی'),
(1584, 430, 'fa', 'شهرستان Priekule'),
(1585, 431, 'fa', 'Condado de Priekuļi'),
(1586, 432, 'fa', 'شهرستان در حال حرکت'),
(1587, 433, 'fa', 'شهرستان پاویلوستا'),
(1588, 4, 'fa', 'شهرستان Plavinas'),
(1589, 435, 'fa', 'شهرستان راونا'),
(1590, 436, 'fa', 'شهرستان ریبیشی'),
(1591, 437, 'fa', 'شهرستان روجا'),
(1592, 438, 'fa', 'شهرستان روپازی'),
(1593, 439, 'fa', 'شهرستان روساوا'),
(1594, 440, 'fa', 'شهرستان روگی'),
(1595, 441, 'fa', 'شهرستان راندل'),
(1596, 442, 'fa', 'شهرستان ریزکن'),
(1597, 443, 'fa', 'شهرستان روژینا'),
(1598, 444, 'fa', 'شهرداری Salacgriva'),
(1599, 445, 'fa', 'منطقه جزیره'),
(1600, 446, 'fa', 'شهرستان Salaspils'),
(1601, 447, 'fa', 'شهرستان سالدوس'),
(1602, 448, 'fa', 'شهرستان ساولکرستی'),
(1603, 449, 'fa', 'شهرستان سیگولدا'),
(1604, 450, 'fa', 'شهرستان Skrunda'),
(1605, 451, 'fa', 'شهرستان Skrīveri'),
(1606, 452, 'fa', 'شهرستان Smiltene'),
(1607, 453, 'fa', 'شهرستان ایستینی'),
(1608, 454, 'fa', 'شهرستان استرنشی'),
(1609, 455, 'fa', 'منطقه کاشت'),
(1610, 456, 'fa', 'شهرستان تالسی'),
(1611, 457, 'fa', 'توکومس'),
(1612, 458, 'fa', 'شهرستان تورت'),
(1613, 459, 'fa', 'یا شهرستان وایودود'),
(1614, 460, 'fa', 'شهرستان والکا'),
(1615, 461, 'fa', 'شهرستان Valmiera'),
(1616, 462, 'fa', 'شهرستان وارکانی'),
(1617, 463, 'fa', 'شهرستان Vecpiebalga'),
(1618, 464, 'fa', 'شهرستان وکومنیکی'),
(1619, 465, 'fa', 'شهرستان ونتسپیل'),
(1620, 466, 'fa', 'کنددو د بازدید'),
(1621, 467, 'fa', 'شهرستان ویلاکا'),
(1622, 468, 'fa', 'شهرستان ویلانی'),
(1623, 469, 'fa', 'شهرستان واركاوا'),
(1624, 470, 'fa', 'شهرستان زیلوپ'),
(1625, 471, 'fa', 'شهرستان آدازی'),
(1626, 472, 'fa', 'شهرستان ارگلو'),
(1627, 473, 'fa', 'شهرستان کگومس'),
(1628, 474, 'fa', 'شهرستان ککاوا'),
(1629, 475, 'fa', 'شهرستان Alytus'),
(1630, 476, 'fa', 'شهرستان Kaunas'),
(1631, 477, 'fa', 'شهرستان کلایپدا'),
(1632, 478, 'fa', 'شهرستان ماریجامپولی'),
(1633, 479, 'fa', 'شهرستان پانویسیز'),
(1634, 480, 'fa', 'شهرستان سیاولیا'),
(1635, 481, 'fa', 'شهرستان تاجیج'),
(1636, 482, 'fa', 'شهرستان تلشیا'),
(1637, 483, 'fa', 'شهرستان اوتنا'),
(1638, 484, 'fa', 'شهرستان ویلنیوس'),
(1639, 485, 'fa', 'جریب');
INSERT INTO `country_state_translations` (`id`, `country_state_id`, `locale`, `default_name`) VALUES
(1640, 486, 'fa', 'حالت'),
(1641, 487, 'fa', 'آمپá'),
(1642, 488, 'fa', 'آمازون'),
(1643, 489, 'fa', 'باهی'),
(1644, 490, 'fa', 'سارا'),
(1645, 491, 'fa', 'روح القدس'),
(1646, 492, 'fa', 'برو'),
(1647, 493, 'fa', 'مارانهائ'),
(1648, 494, 'fa', 'ماتو گروسو'),
(1649, 495, 'fa', 'Mato Grosso do Sul'),
(1650, 496, 'fa', 'ایالت میناس گرایس'),
(1651, 497, 'fa', 'پار'),
(1652, 498, 'fa', 'حالت'),
(1653, 499, 'fa', 'پارانا'),
(1654, 500, 'fa', 'حال'),
(1655, 501, 'fa', 'پیازو'),
(1656, 502, 'fa', 'ریو دوژانیرو'),
(1657, 503, 'fa', 'ریو گراند دو نورته'),
(1658, 504, 'fa', 'ریو گراند دو سول'),
(1659, 505, 'fa', 'Rondôni'),
(1660, 506, 'fa', 'Roraim'),
(1661, 507, 'fa', 'سانتا کاتارینا'),
(1662, 508, 'fa', 'پ'),
(1663, 509, 'fa', 'Sergip'),
(1664, 510, 'fa', 'توکانتین'),
(1665, 511, 'fa', 'منطقه فدرال'),
(1666, 512, 'fa', 'شهرستان زاگرب'),
(1667, 513, 'fa', 'Condado de Krapina-Zagorj'),
(1668, 514, 'fa', 'شهرستان سیساک-موسلاوینا'),
(1669, 515, 'fa', 'شهرستان کارلوواک'),
(1670, 516, 'fa', 'شهرداری واراžدین'),
(1671, 517, 'fa', 'Condo de Koprivnica-Križevci'),
(1672, 518, 'fa', 'محل سکونت د بیلوار-بلوگورا'),
(1673, 519, 'fa', 'Condado de Primorje-Gorski kotar'),
(1674, 520, 'fa', 'شهرستان لیکا-سنج'),
(1675, 521, 'fa', 'Condado de Virovitica-Podravina'),
(1676, 522, 'fa', 'شهرستان پوژگا-اسلاونیا'),
(1677, 523, 'fa', 'Condado de Brod-Posavina'),
(1678, 524, 'fa', 'شهرستان زجر'),
(1679, 525, 'fa', 'Condado de Osijek-Baranja'),
(1680, 526, 'fa', 'Condo de Sibenik-Knin'),
(1681, 527, 'fa', 'Condado de Vukovar-Srijem'),
(1682, 528, 'fa', 'شهرستان اسپلیت-Dalmatia'),
(1683, 529, 'fa', 'شهرستان ایستیا'),
(1684, 530, 'fa', 'Condado de Dubrovnik-Neretva'),
(1685, 531, 'fa', 'شهرستان Međimurje'),
(1686, 532, 'fa', 'شهر زاگرب'),
(1687, 533, 'fa', 'جزایر آندامان و نیکوبار'),
(1688, 534, 'fa', 'آندرا پرادش'),
(1689, 535, 'fa', 'آروناچال پرادش'),
(1690, 536, 'fa', 'آسام'),
(1691, 537, 'fa', 'Biha'),
(1692, 538, 'fa', 'چاندیگار'),
(1693, 539, 'fa', 'چاتیسگار'),
(1694, 540, 'fa', 'دادرا و نگار هاولی'),
(1695, 541, 'fa', 'دامان و دیو'),
(1696, 542, 'fa', 'دهلی'),
(1697, 543, 'fa', 'گوا'),
(1698, 544, 'fa', 'گجرات'),
(1699, 545, 'fa', 'هاریانا'),
(1700, 546, 'fa', 'هیماچال پرادش'),
(1701, 547, 'fa', 'جامو و کشمیر'),
(1702, 548, 'fa', 'جهخند'),
(1703, 549, 'fa', 'کارناتاکا'),
(1704, 550, 'fa', 'کرال'),
(1705, 551, 'fa', 'لاکشادوپ'),
(1706, 552, 'fa', 'مادیا پرادش'),
(1707, 553, 'fa', 'ماهاراشترا'),
(1708, 554, 'fa', 'مانی پور'),
(1709, 555, 'fa', 'مگالایا'),
(1710, 556, 'fa', 'مزورام'),
(1711, 557, 'fa', 'ناگلند'),
(1712, 558, 'fa', 'ادیشا'),
(1713, 559, 'fa', 'میناکاری'),
(1714, 560, 'fa', 'پنجا'),
(1715, 561, 'fa', 'راجستان'),
(1716, 562, 'fa', 'سیکیم'),
(1717, 563, 'fa', 'تامیل نادو'),
(1718, 564, 'fa', 'تلنگانا'),
(1719, 565, 'fa', 'تریپورا'),
(1720, 566, 'fa', 'اوتار پرادش'),
(1721, 567, 'fa', 'اوتاراکند'),
(1722, 568, 'fa', 'بنگال غرب'),
(1723, 1, 'pt_BR', 'Alabama'),
(1724, 2, 'pt_BR', 'Alaska'),
(1725, 3, 'pt_BR', 'Samoa Americana'),
(1726, 4, 'pt_BR', 'Arizona'),
(1727, 5, 'pt_BR', 'Arkansas'),
(1728, 6, 'pt_BR', 'Forças Armadas da África'),
(1729, 7, 'pt_BR', 'Forças Armadas das Américas'),
(1730, 8, 'pt_BR', 'Forças Armadas do Canadá'),
(1731, 9, 'pt_BR', 'Forças Armadas da Europa'),
(1732, 10, 'pt_BR', 'Forças Armadas do Oriente Médio'),
(1733, 11, 'pt_BR', 'Forças Armadas do Pacífico'),
(1734, 12, 'pt_BR', 'California'),
(1735, 13, 'pt_BR', 'Colorado'),
(1736, 14, 'pt_BR', 'Connecticut'),
(1737, 15, 'pt_BR', 'Delaware'),
(1738, 16, 'pt_BR', 'Distrito de Columbia'),
(1739, 17, 'pt_BR', 'Estados Federados da Micronésia'),
(1740, 18, 'pt_BR', 'Florida'),
(1741, 19, 'pt_BR', 'Geórgia'),
(1742, 20, 'pt_BR', 'Guam'),
(1743, 21, 'pt_BR', 'Havaí'),
(1744, 22, 'pt_BR', 'Idaho'),
(1745, 23, 'pt_BR', 'Illinois'),
(1746, 24, 'pt_BR', 'Indiana'),
(1747, 25, 'pt_BR', 'Iowa'),
(1748, 26, 'pt_BR', 'Kansas'),
(1749, 27, 'pt_BR', 'Kentucky'),
(1750, 28, 'pt_BR', 'Louisiana'),
(1751, 29, 'pt_BR', 'Maine'),
(1752, 30, 'pt_BR', 'Ilhas Marshall'),
(1753, 31, 'pt_BR', 'Maryland'),
(1754, 32, 'pt_BR', 'Massachusetts'),
(1755, 33, 'pt_BR', 'Michigan'),
(1756, 34, 'pt_BR', 'Minnesota'),
(1757, 35, 'pt_BR', 'Mississippi'),
(1758, 36, 'pt_BR', 'Missouri'),
(1759, 37, 'pt_BR', 'Montana'),
(1760, 38, 'pt_BR', 'Nebraska'),
(1761, 39, 'pt_BR', 'Nevada'),
(1762, 40, 'pt_BR', 'New Hampshire'),
(1763, 41, 'pt_BR', 'Nova Jersey'),
(1764, 42, 'pt_BR', 'Novo México'),
(1765, 43, 'pt_BR', 'Nova York'),
(1766, 44, 'pt_BR', 'Carolina do Norte'),
(1767, 45, 'pt_BR', 'Dakota do Norte'),
(1768, 46, 'pt_BR', 'Ilhas Marianas do Norte'),
(1769, 47, 'pt_BR', 'Ohio'),
(1770, 48, 'pt_BR', 'Oklahoma'),
(1771, 4, 'pt_BR', 'Oregon'),
(1772, 50, 'pt_BR', 'Palau'),
(1773, 51, 'pt_BR', 'Pensilvânia'),
(1774, 52, 'pt_BR', 'Porto Rico'),
(1775, 53, 'pt_BR', 'Rhode Island'),
(1776, 54, 'pt_BR', 'Carolina do Sul'),
(1777, 55, 'pt_BR', 'Dakota do Sul'),
(1778, 56, 'pt_BR', 'Tennessee'),
(1779, 57, 'pt_BR', 'Texas'),
(1780, 58, 'pt_BR', 'Utah'),
(1781, 59, 'pt_BR', 'Vermont'),
(1782, 60, 'pt_BR', 'Ilhas Virgens'),
(1783, 61, 'pt_BR', 'Virginia'),
(1784, 62, 'pt_BR', 'Washington'),
(1785, 63, 'pt_BR', 'West Virginia'),
(1786, 64, 'pt_BR', 'Wisconsin'),
(1787, 65, 'pt_BR', 'Wyoming'),
(1788, 66, 'pt_BR', 'Alberta'),
(1789, 67, 'pt_BR', 'Colúmbia Britânica'),
(1790, 68, 'pt_BR', 'Manitoba'),
(1791, 69, 'pt_BR', 'Terra Nova e Labrador'),
(1792, 70, 'pt_BR', 'New Brunswick'),
(1793, 7, 'pt_BR', 'Nova Escócia'),
(1794, 72, 'pt_BR', 'Territórios do Noroeste'),
(1795, 73, 'pt_BR', 'Nunavut'),
(1796, 74, 'pt_BR', 'Ontario'),
(1797, 75, 'pt_BR', 'Ilha do Príncipe Eduardo'),
(1798, 76, 'pt_BR', 'Quebec'),
(1799, 77, 'pt_BR', 'Saskatchewan'),
(1800, 78, 'pt_BR', 'Território yukon'),
(1801, 79, 'pt_BR', 'Niedersachsen'),
(1802, 80, 'pt_BR', 'Baden-Wurttemberg'),
(1803, 81, 'pt_BR', 'Bayern'),
(1804, 82, 'pt_BR', 'Berlim'),
(1805, 83, 'pt_BR', 'Brandenburg'),
(1806, 84, 'pt_BR', 'Bremen'),
(1807, 85, 'pt_BR', 'Hamburgo'),
(1808, 86, 'pt_BR', 'Hessen'),
(1809, 87, 'pt_BR', 'Mecklenburg-Vorpommern'),
(1810, 88, 'pt_BR', 'Nordrhein-Westfalen'),
(1811, 8, 'pt_BR', 'Renânia-Palatinado'),
(1812, 90, 'pt_BR', 'Sarre'),
(1813, 91, 'pt_BR', 'Sachsen'),
(1814, 92, 'pt_BR', 'Sachsen-Anhalt'),
(1815, 93, 'pt_BR', 'Schleswig-Holstein'),
(1816, 94, 'pt_BR', 'Turíngia'),
(1817, 95, 'pt_BR', 'Viena'),
(1818, 96, 'pt_BR', 'Baixa Áustria'),
(1819, 97, 'pt_BR', 'Oberösterreich'),
(1820, 98, 'pt_BR', 'Salzburg'),
(1821, 99, 'pt_BR', 'Caríntia'),
(1822, 100, 'pt_BR', 'Steiermark'),
(1823, 101, 'pt_BR', 'Tirol'),
(1824, 102, 'pt_BR', 'Burgenland'),
(1825, 103, 'pt_BR', 'Vorarlberg'),
(1826, 104, 'pt_BR', 'Aargau'),
(1827, 105, 'pt_BR', 'Appenzell Innerrhoden'),
(1828, 106, 'pt_BR', 'Appenzell Ausserrhoden'),
(1829, 107, 'pt_BR', 'Bern'),
(1830, 108, 'pt_BR', 'Basel-Landschaft'),
(1831, 109, 'pt_BR', 'Basel-Stadt'),
(1832, 110, 'pt_BR', 'Freiburg'),
(1833, 111, 'pt_BR', 'Genf'),
(1834, 112, 'pt_BR', 'Glarus'),
(1835, 113, 'pt_BR', 'Grisons'),
(1836, 114, 'pt_BR', 'Jura'),
(1837, 115, 'pt_BR', 'Luzern'),
(1838, 116, 'pt_BR', 'Neuenburg'),
(1839, 117, 'pt_BR', 'Nidwalden'),
(1840, 118, 'pt_BR', 'Obwalden'),
(1841, 119, 'pt_BR', 'St. Gallen'),
(1842, 120, 'pt_BR', 'Schaffhausen'),
(1843, 121, 'pt_BR', 'Solothurn'),
(1844, 122, 'pt_BR', 'Schwyz'),
(1845, 123, 'pt_BR', 'Thurgau'),
(1846, 124, 'pt_BR', 'Tessin'),
(1847, 125, 'pt_BR', 'Uri'),
(1848, 126, 'pt_BR', 'Waadt'),
(1849, 127, 'pt_BR', 'Wallis'),
(1850, 128, 'pt_BR', 'Zug'),
(1851, 129, 'pt_BR', 'Zurique'),
(1852, 130, 'pt_BR', 'Corunha'),
(1853, 131, 'pt_BR', 'Álava'),
(1854, 132, 'pt_BR', 'Albacete'),
(1855, 133, 'pt_BR', 'Alicante'),
(1856, 134, 'pt_BR', 'Almeria'),
(1857, 135, 'pt_BR', 'Astúrias'),
(1858, 136, 'pt_BR', 'Avila'),
(1859, 137, 'pt_BR', 'Badajoz'),
(1860, 138, 'pt_BR', 'Baleares'),
(1861, 139, 'pt_BR', 'Barcelona'),
(1862, 140, 'pt_BR', 'Burgos'),
(1863, 141, 'pt_BR', 'Caceres'),
(1864, 142, 'pt_BR', 'Cadiz'),
(1865, 143, 'pt_BR', 'Cantábria'),
(1866, 144, 'pt_BR', 'Castellon'),
(1867, 145, 'pt_BR', 'Ceuta'),
(1868, 146, 'pt_BR', 'Ciudad Real'),
(1869, 147, 'pt_BR', 'Cordoba'),
(1870, 148, 'pt_BR', 'Cuenca'),
(1871, 149, 'pt_BR', 'Girona'),
(1872, 150, 'pt_BR', 'Granada'),
(1873, 151, 'pt_BR', 'Guadalajara'),
(1874, 152, 'pt_BR', 'Guipuzcoa'),
(1875, 153, 'pt_BR', 'Huelva'),
(1876, 154, 'pt_BR', 'Huesca'),
(1877, 155, 'pt_BR', 'Jaen'),
(1878, 156, 'pt_BR', 'La Rioja'),
(1879, 157, 'pt_BR', 'Las Palmas'),
(1880, 158, 'pt_BR', 'Leon'),
(1881, 159, 'pt_BR', 'Lleida'),
(1882, 160, 'pt_BR', 'Lugo'),
(1883, 161, 'pt_BR', 'Madri'),
(1884, 162, 'pt_BR', 'Málaga'),
(1885, 163, 'pt_BR', 'Melilla'),
(1886, 164, 'pt_BR', 'Murcia'),
(1887, 165, 'pt_BR', 'Navarra'),
(1888, 166, 'pt_BR', 'Ourense'),
(1889, 167, 'pt_BR', 'Palencia'),
(1890, 168, 'pt_BR', 'Pontevedra'),
(1891, 169, 'pt_BR', 'Salamanca'),
(1892, 170, 'pt_BR', 'Santa Cruz de Tenerife'),
(1893, 171, 'pt_BR', 'Segovia'),
(1894, 172, 'pt_BR', 'Sevilla'),
(1895, 173, 'pt_BR', 'Soria'),
(1896, 174, 'pt_BR', 'Tarragona'),
(1897, 175, 'pt_BR', 'Teruel'),
(1898, 176, 'pt_BR', 'Toledo'),
(1899, 177, 'pt_BR', 'Valencia'),
(1900, 178, 'pt_BR', 'Valladolid'),
(1901, 179, 'pt_BR', 'Vizcaya'),
(1902, 180, 'pt_BR', 'Zamora'),
(1903, 181, 'pt_BR', 'Zaragoza'),
(1904, 182, 'pt_BR', 'Ain'),
(1905, 183, 'pt_BR', 'Aisne'),
(1906, 184, 'pt_BR', 'Allier'),
(1907, 185, 'pt_BR', 'Alpes da Alta Provença'),
(1908, 186, 'pt_BR', 'Altos Alpes'),
(1909, 187, 'pt_BR', 'Alpes-Maritimes'),
(1910, 188, 'pt_BR', 'Ardèche'),
(1911, 189, 'pt_BR', 'Ardennes'),
(1912, 190, 'pt_BR', 'Ariege'),
(1913, 191, 'pt_BR', 'Aube'),
(1914, 192, 'pt_BR', 'Aude'),
(1915, 193, 'pt_BR', 'Aveyron'),
(1916, 194, 'pt_BR', 'BOCAS DO Rhône'),
(1917, 195, 'pt_BR', 'Calvados'),
(1918, 196, 'pt_BR', 'Cantal'),
(1919, 197, 'pt_BR', 'Charente'),
(1920, 198, 'pt_BR', 'Charente-Maritime'),
(1921, 199, 'pt_BR', 'Cher'),
(1922, 200, 'pt_BR', 'Corrèze'),
(1923, 201, 'pt_BR', 'Corse-du-Sud'),
(1924, 202, 'pt_BR', 'Alta Córsega'),
(1925, 203, 'pt_BR', 'Costa d\'OrCorrèze'),
(1926, 204, 'pt_BR', 'Cotes d\'Armor'),
(1927, 205, 'pt_BR', 'Creuse'),
(1928, 206, 'pt_BR', 'Dordogne'),
(1929, 207, 'pt_BR', 'Doubs'),
(1930, 208, 'pt_BR', 'DrômeFinistère'),
(1931, 209, 'pt_BR', 'Eure'),
(1932, 210, 'pt_BR', 'Eure-et-Loir'),
(1933, 211, 'pt_BR', 'Finistère'),
(1934, 212, 'pt_BR', 'Gard'),
(1935, 213, 'pt_BR', 'Haute-Garonne'),
(1936, 214, 'pt_BR', 'Gers'),
(1937, 215, 'pt_BR', 'Gironde'),
(1938, 216, 'pt_BR', 'Hérault'),
(1939, 217, 'pt_BR', 'Ille-et-Vilaine'),
(1940, 218, 'pt_BR', 'Indre'),
(1941, 219, 'pt_BR', 'Indre-et-Loire'),
(1942, 220, 'pt_BR', 'Isère'),
(1943, 221, 'pt_BR', 'Jura'),
(1944, 222, 'pt_BR', 'Landes'),
(1945, 223, 'pt_BR', 'Loir-et-Cher'),
(1946, 224, 'pt_BR', 'Loire'),
(1947, 22, 'pt_BR', 'Haute-Loire'),
(1948, 226, 'pt_BR', 'Loire-Atlantique'),
(1949, 227, 'pt_BR', 'Loiret'),
(1950, 228, 'pt_BR', 'Lot'),
(1951, 229, 'pt_BR', 'Lot e Garona'),
(1952, 230, 'pt_BR', 'Lozère'),
(1953, 231, 'pt_BR', 'Maine-et-Loire'),
(1954, 232, 'pt_BR', 'Manche'),
(1955, 233, 'pt_BR', 'Marne'),
(1956, 234, 'pt_BR', 'Haute-Marne'),
(1957, 235, 'pt_BR', 'Mayenne'),
(1958, 236, 'pt_BR', 'Meurthe-et-Moselle'),
(1959, 237, 'pt_BR', 'Meuse'),
(1960, 238, 'pt_BR', 'Morbihan'),
(1961, 239, 'pt_BR', 'Moselle'),
(1962, 240, 'pt_BR', 'Nièvre'),
(1963, 241, 'pt_BR', 'Nord'),
(1964, 242, 'pt_BR', 'Oise'),
(1965, 243, 'pt_BR', 'Orne'),
(1966, 244, 'pt_BR', 'Pas-de-Calais'),
(1967, 24, 'pt_BR', 'Puy-de-Dôme'),
(1968, 246, 'pt_BR', 'Pirineus Atlânticos'),
(1969, 247, 'pt_BR', 'Hautes-Pyrénées'),
(1970, 248, 'pt_BR', 'Pirineus Orientais'),
(1971, 249, 'pt_BR', 'Bas-Rhin'),
(1972, 250, 'pt_BR', 'Alto Reno'),
(1973, 251, 'pt_BR', 'Rhône'),
(1974, 252, 'pt_BR', 'Haute-Saône'),
(1975, 253, 'pt_BR', 'Saône-et-Loire'),
(1976, 25, 'pt_BR', 'Sarthe'),
(1977, 255, 'pt_BR', 'Savoie'),
(1978, 256, 'pt_BR', 'Alta Sabóia'),
(1979, 257, 'pt_BR', 'Paris'),
(1980, 258, 'pt_BR', 'Seine-Maritime'),
(1981, 259, 'pt_BR', 'Seine-et-Marne'),
(1982, 260, 'pt_BR', 'Yvelines'),
(1983, 261, 'pt_BR', 'Deux-Sèvres'),
(1984, 262, 'pt_BR', 'Somme'),
(1985, 263, 'pt_BR', 'Tarn'),
(1986, 264, 'pt_BR', 'Tarn-et-Garonne'),
(1987, 265, 'pt_BR', 'Var'),
(1988, 266, 'pt_BR', 'Vaucluse'),
(1989, 267, 'pt_BR', 'Compradora'),
(1990, 268, 'pt_BR', 'Vienne'),
(1991, 269, 'pt_BR', 'Haute-Vienne'),
(1992, 270, 'pt_BR', 'Vosges'),
(1993, 271, 'pt_BR', 'Yonne'),
(1994, 272, 'pt_BR', 'Território de Belfort'),
(1995, 273, 'pt_BR', 'Essonne'),
(1996, 274, 'pt_BR', 'Altos do Sena'),
(1997, 275, 'pt_BR', 'Seine-Saint-Denis'),
(1998, 276, 'pt_BR', 'Val-de-Marne'),
(1999, 277, 'pt_BR', 'Val-d\'Oise'),
(2000, 278, 'pt_BR', 'Alba'),
(2001, 279, 'pt_BR', 'Arad'),
(2002, 280, 'pt_BR', 'Arges'),
(2003, 281, 'pt_BR', 'Bacau'),
(2004, 282, 'pt_BR', 'Bihor'),
(2005, 283, 'pt_BR', 'Bistrita-Nasaud'),
(2006, 284, 'pt_BR', 'Botosani'),
(2007, 285, 'pt_BR', 'Brașov'),
(2008, 286, 'pt_BR', 'Braila'),
(2009, 287, 'pt_BR', 'Bucareste'),
(2010, 288, 'pt_BR', 'Buzau'),
(2011, 289, 'pt_BR', 'Caras-Severin'),
(2012, 290, 'pt_BR', 'Călărași'),
(2013, 291, 'pt_BR', 'Cluj'),
(2014, 292, 'pt_BR', 'Constanta'),
(2015, 29, 'pt_BR', 'Covasna'),
(2016, 294, 'pt_BR', 'Dambovita'),
(2017, 295, 'pt_BR', 'Dolj'),
(2018, 296, 'pt_BR', 'Galati'),
(2019, 297, 'pt_BR', 'Giurgiu'),
(2020, 298, 'pt_BR', 'Gorj'),
(2021, 299, 'pt_BR', 'Harghita'),
(2022, 300, 'pt_BR', 'Hunedoara'),
(2023, 301, 'pt_BR', 'Ialomita'),
(2024, 302, 'pt_BR', 'Iasi'),
(2025, 303, 'pt_BR', 'Ilfov'),
(2026, 304, 'pt_BR', 'Maramures'),
(2027, 305, 'pt_BR', 'Maramures'),
(2028, 306, 'pt_BR', 'Mures'),
(2029, 307, 'pt_BR', 'alemão'),
(2030, 308, 'pt_BR', 'Olt'),
(2031, 309, 'pt_BR', 'Prahova'),
(2032, 310, 'pt_BR', 'Satu-Mare'),
(2033, 311, 'pt_BR', 'Salaj'),
(2034, 312, 'pt_BR', 'Sibiu'),
(2035, 313, 'pt_BR', 'Suceava'),
(2036, 314, 'pt_BR', 'Teleorman'),
(2037, 315, 'pt_BR', 'Timis'),
(2038, 316, 'pt_BR', 'Tulcea'),
(2039, 317, 'pt_BR', 'Vaslui'),
(2040, 318, 'pt_BR', 'dale'),
(2041, 319, 'pt_BR', 'Vrancea'),
(2042, 320, 'pt_BR', 'Lappi'),
(2043, 321, 'pt_BR', 'Pohjois-Pohjanmaa'),
(2044, 322, 'pt_BR', 'Kainuu'),
(2045, 323, 'pt_BR', 'Pohjois-Karjala'),
(2046, 324, 'pt_BR', 'Pohjois-Savo'),
(2047, 325, 'pt_BR', 'Sul Savo'),
(2048, 326, 'pt_BR', 'Ostrobothnia do sul'),
(2049, 327, 'pt_BR', 'Pohjanmaa'),
(2050, 328, 'pt_BR', 'Pirkanmaa'),
(2051, 329, 'pt_BR', 'Satakunta'),
(2052, 330, 'pt_BR', 'Keski-Pohjanmaa'),
(2053, 331, 'pt_BR', 'Keski-Suomi'),
(2054, 332, 'pt_BR', 'Varsinais-Suomi'),
(2055, 333, 'pt_BR', 'Carélia do Sul'),
(2056, 334, 'pt_BR', 'Päijät-Häme'),
(2057, 335, 'pt_BR', 'Kanta-Häme'),
(2058, 336, 'pt_BR', 'Uusimaa'),
(2059, 337, 'pt_BR', 'Uusimaa'),
(2060, 338, 'pt_BR', 'Kymenlaakso'),
(2061, 339, 'pt_BR', 'Ahvenanmaa'),
(2062, 340, 'pt_BR', 'Harjumaa'),
(2063, 341, 'pt_BR', 'Hiiumaa'),
(2064, 342, 'pt_BR', 'Ida-Virumaa'),
(2065, 343, 'pt_BR', 'Condado de Jõgeva'),
(2066, 344, 'pt_BR', 'Condado de Järva'),
(2067, 345, 'pt_BR', 'Läänemaa'),
(2068, 346, 'pt_BR', 'Condado de Lääne-Viru'),
(2069, 347, 'pt_BR', 'Condado de Põlva'),
(2070, 348, 'pt_BR', 'Condado de Pärnu'),
(2071, 349, 'pt_BR', 'Raplamaa'),
(2072, 350, 'pt_BR', 'Saaremaa'),
(2073, 351, 'pt_BR', 'Tartumaa'),
(2074, 352, 'pt_BR', 'Valgamaa'),
(2075, 353, 'pt_BR', 'Viljandimaa'),
(2076, 354, 'pt_BR', 'Võrumaa'),
(2077, 355, 'pt_BR', 'Daugavpils'),
(2078, 356, 'pt_BR', 'Jelgava'),
(2079, 357, 'pt_BR', 'Jekabpils'),
(2080, 358, 'pt_BR', 'Jurmala'),
(2081, 359, 'pt_BR', 'Liepaja'),
(2082, 360, 'pt_BR', 'Liepaja County'),
(2083, 361, 'pt_BR', 'Rezekne'),
(2084, 362, 'pt_BR', 'Riga'),
(2085, 363, 'pt_BR', 'Condado de Riga'),
(2086, 364, 'pt_BR', 'Valmiera'),
(2087, 365, 'pt_BR', 'Ventspils'),
(2088, 366, 'pt_BR', 'Aglonas novads'),
(2089, 367, 'pt_BR', 'Aizkraukles novads'),
(2090, 368, 'pt_BR', 'Aizputes novads'),
(2091, 369, 'pt_BR', 'Condado de Akniste'),
(2092, 370, 'pt_BR', 'Alojas novads'),
(2093, 371, 'pt_BR', 'Alsungas novads'),
(2094, 372, 'pt_BR', 'Aluksne County'),
(2095, 373, 'pt_BR', 'Amatas novads'),
(2096, 374, 'pt_BR', 'Macacos novads'),
(2097, 375, 'pt_BR', 'Auces novads'),
(2098, 376, 'pt_BR', 'Babītes novads'),
(2099, 377, 'pt_BR', 'Baldones novads'),
(2100, 378, 'pt_BR', 'Baltinavas novads'),
(2101, 379, 'pt_BR', 'Balvu novads'),
(2102, 380, 'pt_BR', 'Bauskas novads'),
(2103, 381, 'pt_BR', 'Condado de Beverina'),
(2104, 382, 'pt_BR', 'Condado de Broceni'),
(2105, 383, 'pt_BR', 'Burtnieku novads'),
(2106, 384, 'pt_BR', 'Carnikavas novads'),
(2107, 385, 'pt_BR', 'Cesvaines novads'),
(2108, 386, 'pt_BR', 'Ciblas novads'),
(2109, 387, 'pt_BR', 'Cesis county'),
(2110, 388, 'pt_BR', 'Dagdas novads'),
(2111, 389, 'pt_BR', 'Daugavpils novads'),
(2112, 390, 'pt_BR', 'Dobeles novads'),
(2113, 391, 'pt_BR', 'Dundagas novads'),
(2114, 392, 'pt_BR', 'Durbes novads'),
(2115, 393, 'pt_BR', 'Engad novads'),
(2116, 394, 'pt_BR', 'Garkalnes novads'),
(2117, 395, 'pt_BR', 'O condado de Grobiņa'),
(2118, 396, 'pt_BR', 'Gulbenes novads'),
(2119, 397, 'pt_BR', 'Iecavas novads'),
(2120, 398, 'pt_BR', 'Ikskile county'),
(2121, 399, 'pt_BR', 'Ilūkste county'),
(2122, 400, 'pt_BR', 'Condado de Inčukalns'),
(2123, 401, 'pt_BR', 'Jaunjelgavas novads'),
(2124, 402, 'pt_BR', 'Jaunpiebalgas novads'),
(2125, 403, 'pt_BR', 'Jaunpils novads'),
(2126, 404, 'pt_BR', 'Jelgavas novads'),
(2127, 405, 'pt_BR', 'Jekabpils county'),
(2128, 406, 'pt_BR', 'Kandavas novads'),
(2129, 407, 'pt_BR', 'Kokneses novads'),
(2130, 408, 'pt_BR', 'Krimuldas novads'),
(2131, 409, 'pt_BR', 'Krustpils novads'),
(2132, 410, 'pt_BR', 'Condado de Kraslava'),
(2133, 411, 'pt_BR', 'Condado de Kuldīga'),
(2134, 412, 'pt_BR', 'Condado de Kārsava'),
(2135, 413, 'pt_BR', 'Condado de Lielvarde'),
(2136, 414, 'pt_BR', 'Condado de Limbaži'),
(2137, 415, 'pt_BR', 'O distrito de Lubāna'),
(2138, 416, 'pt_BR', 'Ludzas novads'),
(2139, 417, 'pt_BR', 'Ligatne county'),
(2140, 418, 'pt_BR', 'Livani county'),
(2141, 419, 'pt_BR', 'Madonas novads'),
(2142, 420, 'pt_BR', 'Mazsalacas novads'),
(2143, 421, 'pt_BR', 'Mālpils county'),
(2144, 422, 'pt_BR', 'Mārupe county'),
(2145, 423, 'pt_BR', 'O condado de Naukšēni'),
(2146, 424, 'pt_BR', 'Neretas novads'),
(2147, 425, 'pt_BR', 'Nīca county'),
(2148, 426, 'pt_BR', 'Ogres novads'),
(2149, 427, 'pt_BR', 'Olaines novads'),
(2150, 428, 'pt_BR', 'Ozolnieku novads'),
(2151, 429, 'pt_BR', 'Preiļi county'),
(2152, 430, 'pt_BR', 'Priekules novads'),
(2153, 431, 'pt_BR', 'Condado de Priekuļi'),
(2154, 432, 'pt_BR', 'Moving county'),
(2155, 433, 'pt_BR', 'Condado de Pavilosta'),
(2156, 434, 'pt_BR', 'Condado de Plavinas'),
(2157, 435, 'pt_BR', 'Raunas novads'),
(2158, 436, 'pt_BR', 'Condado de Riebiņi'),
(2159, 437, 'pt_BR', 'Rojas novads'),
(2160, 438, 'pt_BR', 'Ropazi county'),
(2161, 439, 'pt_BR', 'Rucavas novads'),
(2162, 440, 'pt_BR', 'Rugāji county'),
(2163, 441, 'pt_BR', 'Rundāle county'),
(2164, 442, 'pt_BR', 'Rezekne county'),
(2165, 443, 'pt_BR', 'Rūjiena county'),
(2166, 444, 'pt_BR', 'O município de Salacgriva'),
(2167, 445, 'pt_BR', 'Salas novads'),
(2168, 446, 'pt_BR', 'Salaspils novads'),
(2169, 447, 'pt_BR', 'Saldus novads'),
(2170, 448, 'pt_BR', 'Saulkrastu novads'),
(2171, 449, 'pt_BR', 'Siguldas novads'),
(2172, 450, 'pt_BR', 'Skrundas novads'),
(2173, 451, 'pt_BR', 'Skrīveri county'),
(2174, 452, 'pt_BR', 'Smiltenes novads'),
(2175, 453, 'pt_BR', 'Condado de Stopini'),
(2176, 454, 'pt_BR', 'Condado de Strenči'),
(2177, 455, 'pt_BR', 'Região de semeadura'),
(2178, 456, 'pt_BR', 'Talsu novads'),
(2179, 457, 'pt_BR', 'Tukuma novads'),
(2180, 458, 'pt_BR', 'Condado de Tērvete'),
(2181, 459, 'pt_BR', 'O condado de Vaiņode'),
(2182, 460, 'pt_BR', 'Valkas novads'),
(2183, 461, 'pt_BR', 'Valmieras novads'),
(2184, 462, 'pt_BR', 'Varaklani county'),
(2185, 463, 'pt_BR', 'Vecpiebalgas novads'),
(2186, 464, 'pt_BR', 'Vecumnieku novads'),
(2187, 465, 'pt_BR', 'Ventspils novads'),
(2188, 466, 'pt_BR', 'Condado de Viesite'),
(2189, 467, 'pt_BR', 'Condado de Vilaka'),
(2190, 468, 'pt_BR', 'Vilani county'),
(2191, 469, 'pt_BR', 'Condado de Varkava'),
(2192, 470, 'pt_BR', 'Zilupes novads'),
(2193, 471, 'pt_BR', 'Adazi county'),
(2194, 472, 'pt_BR', 'Erglu county'),
(2195, 473, 'pt_BR', 'Kegums county'),
(2196, 474, 'pt_BR', 'Kekava county'),
(2197, 475, 'pt_BR', 'Alytaus Apskritis'),
(2198, 476, 'pt_BR', 'Kauno Apskritis'),
(2199, 477, 'pt_BR', 'Condado de Klaipeda'),
(2200, 478, 'pt_BR', 'Marijampolė county'),
(2201, 479, 'pt_BR', 'Panevezys county'),
(2202, 480, 'pt_BR', 'Siauliai county'),
(2203, 481, 'pt_BR', 'Taurage county'),
(2204, 482, 'pt_BR', 'Telšiai county'),
(2205, 483, 'pt_BR', 'Utenos Apskritis'),
(2206, 484, 'pt_BR', 'Vilniaus Apskritis'),
(2207, 485, 'pt_BR', 'Acre'),
(2208, 486, 'pt_BR', 'Alagoas'),
(2209, 487, 'pt_BR', 'Amapá'),
(2210, 488, 'pt_BR', 'Amazonas'),
(2211, 489, 'pt_BR', 'Bahia'),
(2212, 490, 'pt_BR', 'Ceará'),
(2213, 491, 'pt_BR', 'Espírito Santo'),
(2214, 492, 'pt_BR', 'Goiás'),
(2215, 493, 'pt_BR', 'Maranhão'),
(2216, 494, 'pt_BR', 'Mato Grosso'),
(2217, 495, 'pt_BR', 'Mato Grosso do Sul'),
(2218, 496, 'pt_BR', 'Minas Gerais'),
(2219, 497, 'pt_BR', 'Pará'),
(2220, 498, 'pt_BR', 'Paraíba'),
(2221, 499, 'pt_BR', 'Paraná'),
(2222, 500, 'pt_BR', 'Pernambuco'),
(2223, 501, 'pt_BR', 'Piauí'),
(2224, 502, 'pt_BR', 'Rio de Janeiro'),
(2225, 503, 'pt_BR', 'Rio Grande do Norte'),
(2226, 504, 'pt_BR', 'Rio Grande do Sul'),
(2227, 505, 'pt_BR', 'Rondônia'),
(2228, 506, 'pt_BR', 'Roraima'),
(2229, 507, 'pt_BR', 'Santa Catarina'),
(2230, 508, 'pt_BR', 'São Paulo'),
(2231, 509, 'pt_BR', 'Sergipe'),
(2232, 510, 'pt_BR', 'Tocantins'),
(2233, 511, 'pt_BR', 'Distrito Federal'),
(2234, 512, 'pt_BR', 'Condado de Zagreb'),
(2235, 513, 'pt_BR', 'Condado de Krapina-Zagorje'),
(2236, 514, 'pt_BR', 'Condado de Sisak-Moslavina'),
(2237, 515, 'pt_BR', 'Condado de Karlovac'),
(2238, 516, 'pt_BR', 'Concelho de Varaždin'),
(2239, 517, 'pt_BR', 'Condado de Koprivnica-Križevci'),
(2240, 518, 'pt_BR', 'Condado de Bjelovar-Bilogora'),
(2241, 519, 'pt_BR', 'Condado de Primorje-Gorski kotar'),
(2242, 520, 'pt_BR', 'Condado de Lika-Senj'),
(2243, 521, 'pt_BR', 'Condado de Virovitica-Podravina'),
(2244, 522, 'pt_BR', 'Condado de Požega-Slavonia'),
(2245, 523, 'pt_BR', 'Condado de Brod-Posavina'),
(2246, 524, 'pt_BR', 'Condado de Zadar'),
(2247, 525, 'pt_BR', 'Condado de Osijek-Baranja'),
(2248, 526, 'pt_BR', 'Condado de Šibenik-Knin'),
(2249, 527, 'pt_BR', 'Condado de Vukovar-Srijem'),
(2250, 528, 'pt_BR', 'Condado de Split-Dalmácia'),
(2251, 529, 'pt_BR', 'Condado de Ístria'),
(2252, 530, 'pt_BR', 'Condado de Dubrovnik-Neretva'),
(2253, 531, 'pt_BR', 'Međimurska županija'),
(2254, 532, 'pt_BR', 'Grad Zagreb'),
(2255, 533, 'pt_BR', 'Ilhas Andaman e Nicobar'),
(2256, 534, 'pt_BR', 'Andhra Pradesh'),
(2257, 535, 'pt_BR', 'Arunachal Pradesh'),
(2258, 536, 'pt_BR', 'Assam'),
(2259, 537, 'pt_BR', 'Bihar'),
(2260, 538, 'pt_BR', 'Chandigarh'),
(2261, 539, 'pt_BR', 'Chhattisgarh'),
(2262, 540, 'pt_BR', 'Dadra e Nagar Haveli'),
(2263, 541, 'pt_BR', 'Daman e Diu'),
(2264, 542, 'pt_BR', 'Delhi'),
(2265, 543, 'pt_BR', 'Goa'),
(2266, 544, 'pt_BR', 'Gujarat'),
(2267, 545, 'pt_BR', 'Haryana'),
(2268, 546, 'pt_BR', 'Himachal Pradesh'),
(2269, 547, 'pt_BR', 'Jammu e Caxemira'),
(2270, 548, 'pt_BR', 'Jharkhand'),
(2271, 549, 'pt_BR', 'Karnataka'),
(2272, 550, 'pt_BR', 'Kerala'),
(2273, 551, 'pt_BR', 'Lakshadweep'),
(2274, 552, 'pt_BR', 'Madhya Pradesh'),
(2275, 553, 'pt_BR', 'Maharashtra'),
(2276, 554, 'pt_BR', 'Manipur'),
(2277, 555, 'pt_BR', 'Meghalaya'),
(2278, 556, 'pt_BR', 'Mizoram'),
(2279, 557, 'pt_BR', 'Nagaland'),
(2280, 558, 'pt_BR', 'Odisha'),
(2281, 559, 'pt_BR', 'Puducherry'),
(2282, 560, 'pt_BR', 'Punjab'),
(2283, 561, 'pt_BR', 'Rajasthan'),
(2284, 562, 'pt_BR', 'Sikkim'),
(2285, 563, 'pt_BR', 'Tamil Nadu'),
(2286, 564, 'pt_BR', 'Telangana'),
(2287, 565, 'pt_BR', 'Tripura'),
(2288, 566, 'pt_BR', 'Uttar Pradesh'),
(2289, 567, 'pt_BR', 'Uttarakhand'),
(2290, 568, 'pt_BR', 'Bengala Ocidental');

-- --------------------------------------------------------

--
-- Table structure for table `country_translations`
--

CREATE TABLE `country_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `country_translations`
--

INSERT INTO `country_translations` (`id`, `country_id`, `locale`, `name`) VALUES
(1, 1, 'ar', 'أفغانستان'),
(2, 2, 'ar', 'جزر آلاند'),
(3, 3, 'ar', 'ألبانيا'),
(4, 4, 'ar', 'الجزائر'),
(5, 5, 'ar', 'ساموا الأمريكية'),
(6, 6, 'ar', 'أندورا'),
(7, 7, 'ar', 'أنغولا'),
(8, 8, 'ar', 'أنغيلا'),
(9, 9, 'ar', 'القارة القطبية الجنوبية'),
(10, 10, 'ar', 'أنتيغوا وبربودا'),
(11, 11, 'ar', 'الأرجنتين'),
(12, 12, 'ar', 'أرمينيا'),
(13, 13, 'ar', 'أروبا'),
(14, 14, 'ar', 'جزيرة الصعود'),
(15, 15, 'ar', 'أستراليا'),
(16, 16, 'ar', 'النمسا'),
(17, 17, 'ar', 'أذربيجان'),
(18, 18, 'ar', 'الباهاما'),
(19, 19, 'ar', 'البحرين'),
(20, 20, 'ar', 'بنغلاديش'),
(21, 21, 'ar', 'بربادوس'),
(22, 22, 'ar', 'روسيا البيضاء'),
(23, 23, 'ar', 'بلجيكا'),
(24, 24, 'ar', 'بليز'),
(25, 25, 'ar', 'بنين'),
(26, 26, 'ar', 'برمودا'),
(27, 27, 'ar', 'بوتان'),
(28, 28, 'ar', 'بوليفيا'),
(29, 29, 'ar', 'البوسنة والهرسك'),
(30, 30, 'ar', 'بوتسوانا'),
(31, 31, 'ar', 'البرازيل'),
(32, 32, 'ar', 'إقليم المحيط البريطاني الهندي'),
(33, 33, 'ar', 'جزر فيرجن البريطانية'),
(34, 34, 'ar', 'بروناي'),
(35, 35, 'ar', 'بلغاريا'),
(36, 36, 'ar', 'بوركينا فاسو'),
(37, 37, 'ar', 'بوروندي'),
(38, 38, 'ar', 'كمبوديا'),
(39, 39, 'ar', 'الكاميرون'),
(40, 40, 'ar', 'كندا'),
(41, 41, 'ar', 'جزر الكناري'),
(42, 42, 'ar', 'الرأس الأخضر'),
(43, 43, 'ar', 'الكاريبي هولندا'),
(44, 44, 'ar', 'جزر كايمان'),
(45, 45, 'ar', 'جمهورية افريقيا الوسطى'),
(46, 46, 'ar', 'سبتة ومليلية'),
(47, 47, 'ar', 'تشاد'),
(48, 48, 'ar', 'تشيلي'),
(49, 49, 'ar', 'الصين'),
(50, 50, 'ar', 'جزيرة الكريسماس'),
(51, 51, 'ar', 'جزر كوكوس (كيلينغ)'),
(52, 52, 'ar', 'كولومبيا'),
(53, 53, 'ar', 'جزر القمر'),
(54, 54, 'ar', 'الكونغو - برازافيل'),
(55, 55, 'ar', 'الكونغو - كينشاسا'),
(56, 56, 'ar', 'جزر كوك'),
(57, 57, 'ar', 'كوستاريكا'),
(58, 58, 'ar', 'ساحل العاج'),
(59, 59, 'ar', 'كرواتيا'),
(60, 60, 'ar', 'كوبا'),
(61, 61, 'ar', 'كوراساو'),
(62, 62, 'ar', 'قبرص'),
(63, 63, 'ar', 'التشيك'),
(64, 64, 'ar', 'الدنمارك'),
(65, 65, 'ar', 'دييغو غارسيا'),
(66, 66, 'ar', 'جيبوتي'),
(67, 67, 'ar', 'دومينيكا'),
(68, 68, 'ar', 'جمهورية الدومنيكان'),
(69, 69, 'ar', 'الإكوادور'),
(70, 70, 'ar', 'مصر'),
(71, 71, 'ar', 'السلفادور'),
(72, 72, 'ar', 'غينيا الإستوائية'),
(73, 73, 'ar', 'إريتريا'),
(74, 74, 'ar', 'استونيا'),
(75, 75, 'ar', 'أثيوبيا'),
(76, 76, 'ar', 'منطقة اليورو'),
(77, 77, 'ar', 'جزر فوكلاند'),
(78, 78, 'ar', 'جزر فاروس'),
(79, 79, 'ar', 'فيجي'),
(80, 80, 'ar', 'فنلندا'),
(81, 81, 'ar', 'فرنسا'),
(82, 82, 'ar', 'غيانا الفرنسية'),
(83, 83, 'ar', 'بولينيزيا الفرنسية'),
(84, 84, 'ar', 'المناطق الجنوبية لفرنسا'),
(85, 85, 'ar', 'الغابون'),
(86, 86, 'ar', 'غامبيا'),
(87, 87, 'ar', 'جورجيا'),
(88, 88, 'ar', 'ألمانيا'),
(89, 89, 'ar', 'غانا'),
(90, 90, 'ar', 'جبل طارق'),
(91, 91, 'ar', 'اليونان'),
(92, 92, 'ar', 'الأرض الخضراء'),
(93, 93, 'ar', 'غرينادا'),
(94, 94, 'ar', 'جوادلوب'),
(95, 95, 'ar', 'غوام'),
(96, 96, 'ar', 'غواتيمالا'),
(97, 97, 'ar', 'غيرنسي'),
(98, 98, 'ar', 'غينيا'),
(99, 99, 'ar', 'غينيا بيساو'),
(100, 100, 'ar', 'غيانا'),
(101, 101, 'ar', 'هايتي'),
(102, 102, 'ar', 'هندوراس'),
(103, 103, 'ar', 'هونج كونج SAR الصين'),
(104, 104, 'ar', 'هنغاريا'),
(105, 105, 'ar', 'أيسلندا'),
(106, 106, 'ar', 'الهند'),
(107, 107, 'ar', 'إندونيسيا'),
(108, 108, 'ar', 'إيران'),
(109, 109, 'ar', 'العراق'),
(110, 110, 'ar', 'أيرلندا'),
(111, 111, 'ar', 'جزيرة آيل أوف مان'),
(112, 112, 'ar', 'إسرائيل'),
(113, 113, 'ar', 'إيطاليا'),
(114, 114, 'ar', 'جامايكا'),
(115, 115, 'ar', 'اليابان'),
(116, 116, 'ar', 'جيرسي'),
(117, 117, 'ar', 'الأردن'),
(118, 118, 'ar', 'كازاخستان'),
(119, 119, 'ar', 'كينيا'),
(120, 120, 'ar', 'كيريباس'),
(121, 121, 'ar', 'كوسوفو'),
(122, 122, 'ar', 'الكويت'),
(123, 123, 'ar', 'قرغيزستان'),
(124, 124, 'ar', 'لاوس'),
(125, 125, 'ar', 'لاتفيا'),
(126, 126, 'ar', 'لبنان'),
(127, 127, 'ar', 'ليسوتو'),
(128, 128, 'ar', 'ليبيريا'),
(129, 129, 'ar', 'ليبيا'),
(130, 130, 'ar', 'ليختنشتاين'),
(131, 131, 'ar', 'ليتوانيا'),
(132, 132, 'ar', 'لوكسمبورغ'),
(133, 133, 'ar', 'ماكاو SAR الصين'),
(134, 134, 'ar', 'مقدونيا'),
(135, 135, 'ar', 'مدغشقر'),
(136, 136, 'ar', 'مالاوي'),
(137, 137, 'ar', 'ماليزيا'),
(138, 138, 'ar', 'جزر المالديف'),
(139, 139, 'ar', 'مالي'),
(140, 140, 'ar', 'مالطا'),
(141, 141, 'ar', 'جزر مارشال'),
(142, 142, 'ar', 'مارتينيك'),
(143, 143, 'ar', 'موريتانيا'),
(144, 144, 'ar', 'موريشيوس'),
(145, 145, 'ar', 'ضائع'),
(146, 146, 'ar', 'المكسيك'),
(147, 147, 'ar', 'ميكرونيزيا'),
(148, 148, 'ar', 'مولدوفا'),
(149, 149, 'ar', 'موناكو'),
(150, 150, 'ar', 'منغوليا'),
(151, 151, 'ar', 'الجبل الأسود'),
(152, 152, 'ar', 'مونتسيرات'),
(153, 153, 'ar', 'المغرب'),
(154, 154, 'ar', 'موزمبيق'),
(155, 155, 'ar', 'ميانمار (بورما)'),
(156, 156, 'ar', 'ناميبيا'),
(157, 157, 'ar', 'ناورو'),
(158, 158, 'ar', 'نيبال'),
(159, 159, 'ar', 'نيبال'),
(160, 160, 'ar', 'كاليدونيا الجديدة'),
(161, 161, 'ar', 'نيوزيلاندا'),
(162, 162, 'ar', 'نيكاراغوا'),
(163, 163, 'ar', 'النيجر'),
(164, 164, 'ar', 'نيجيريا'),
(165, 165, 'ar', 'نيوي'),
(166, 166, 'ar', 'جزيرة نورفولك'),
(167, 167, 'ar', 'كوريا الشماليه'),
(168, 168, 'ar', 'جزر مريانا الشمالية'),
(169, 169, 'ar', 'النرويج'),
(170, 170, 'ar', 'سلطنة عمان'),
(171, 171, 'ar', 'باكستان'),
(172, 172, 'ar', 'بالاو'),
(173, 173, 'ar', 'الاراضي الفلسطينية'),
(174, 174, 'ar', 'بناما'),
(175, 175, 'ar', 'بابوا غينيا الجديدة'),
(176, 176, 'ar', 'باراغواي'),
(177, 177, 'ar', 'بيرو'),
(178, 178, 'ar', 'الفلبين'),
(179, 179, 'ar', 'جزر بيتكيرن'),
(180, 180, 'ar', 'بولندا'),
(181, 181, 'ar', 'البرتغال'),
(182, 182, 'ar', 'بورتوريكو'),
(183, 183, 'ar', 'دولة قطر'),
(184, 184, 'ar', 'جمع شمل'),
(185, 185, 'ar', 'رومانيا'),
(186, 186, 'ar', 'روسيا'),
(187, 187, 'ar', 'رواندا'),
(188, 188, 'ar', 'ساموا'),
(189, 189, 'ar', 'سان مارينو'),
(190, 190, 'ar', 'سانت كيتس ونيفيس'),
(191, 191, 'ar', 'المملكة العربية السعودية'),
(192, 192, 'ar', 'السنغال'),
(193, 193, 'ar', 'صربيا'),
(194, 194, 'ar', 'سيشيل'),
(195, 195, 'ar', 'سيراليون'),
(196, 196, 'ar', 'سنغافورة'),
(197, 197, 'ar', 'سينت مارتن'),
(198, 198, 'ar', 'سلوفاكيا'),
(199, 199, 'ar', 'سلوفينيا'),
(200, 200, 'ar', 'جزر سليمان'),
(201, 201, 'ar', 'الصومال'),
(202, 202, 'ar', 'جنوب أفريقيا'),
(203, 203, 'ar', 'جورجيا الجنوبية وجزر ساندويتش الجنوبية'),
(204, 204, 'ar', 'كوريا الجنوبية'),
(205, 205, 'ar', 'جنوب السودان'),
(206, 206, 'ar', 'إسبانيا'),
(207, 207, 'ar', 'سيريلانكا'),
(208, 208, 'ar', 'سانت بارتيليمي'),
(209, 209, 'ar', 'سانت هيلانة'),
(210, 210, 'ar', 'سانت كيتس ونيفيس'),
(211, 211, 'ar', 'شارع لوسيا'),
(212, 212, 'ar', 'سانت مارتن'),
(213, 213, 'ar', 'سانت بيير وميكلون'),
(214, 214, 'ar', 'سانت فنسنت وجزر غرينادين'),
(215, 215, 'ar', 'السودان'),
(216, 216, 'ar', 'سورينام'),
(217, 217, 'ar', 'سفالبارد وجان ماين'),
(218, 218, 'ar', 'سوازيلاند'),
(219, 219, 'ar', 'السويد'),
(220, 220, 'ar', 'سويسرا'),
(221, 221, 'ar', 'سوريا'),
(222, 222, 'ar', 'تايوان'),
(223, 223, 'ar', 'طاجيكستان'),
(224, 224, 'ar', 'تنزانيا'),
(225, 225, 'ar', 'تايلاند'),
(226, 226, 'ar', 'تيمور'),
(227, 227, 'ar', 'توجو'),
(228, 228, 'ar', 'توكيلاو'),
(229, 229, 'ar', 'تونغا'),
(230, 230, 'ar', 'ترينيداد وتوباغو'),
(231, 231, 'ar', 'تريستان دا كونها'),
(232, 232, 'ar', 'تونس'),
(233, 233, 'ar', 'ديك رومي'),
(234, 234, 'ar', 'تركمانستان'),
(235, 235, 'ar', 'جزر تركس وكايكوس'),
(236, 236, 'ar', 'توفالو'),
(237, 237, 'ar', 'جزر الولايات المتحدة البعيدة'),
(238, 238, 'ar', 'جزر فيرجن الأمريكية'),
(239, 239, 'ar', 'أوغندا'),
(240, 240, 'ar', 'أوكرانيا'),
(241, 241, 'ar', 'الإمارات العربية المتحدة'),
(242, 242, 'ar', 'المملكة المتحدة'),
(243, 243, 'ar', 'الأمم المتحدة'),
(244, 244, 'ar', 'الولايات المتحدة الأمريكية'),
(245, 245, 'ar', 'أوروغواي'),
(246, 246, 'ar', 'أوزبكستان'),
(247, 247, 'ar', 'فانواتو'),
(248, 248, 'ar', 'مدينة الفاتيكان'),
(249, 249, 'ar', 'فنزويلا'),
(250, 250, 'ar', 'فيتنام'),
(251, 251, 'ar', 'واليس وفوتونا'),
(252, 252, 'ar', 'الصحراء الغربية'),
(253, 253, 'ar', 'اليمن'),
(254, 254, 'ar', 'زامبيا'),
(255, 255, 'ar', 'زيمبابوي'),
(256, 1, 'es', 'Afganistán'),
(257, 2, 'es', 'Islas Åland'),
(258, 3, 'es', 'Albania'),
(259, 4, 'es', 'Argelia'),
(260, 5, 'es', 'Samoa Americana'),
(261, 6, 'es', 'Andorra'),
(262, 7, 'es', 'Angola'),
(263, 8, 'es', 'Anguila'),
(264, 9, 'es', 'Antártida'),
(265, 10, 'es', 'Antigua y Barbuda'),
(266, 11, 'es', 'Argentina'),
(267, 12, 'es', 'Armenia'),
(268, 13, 'es', 'Aruba'),
(269, 14, 'es', 'Isla Ascensión'),
(270, 15, 'es', 'Australia'),
(271, 16, 'es', 'Austria'),
(272, 17, 'es', 'Azerbaiyán'),
(273, 18, 'es', 'Bahamas'),
(274, 19, 'es', 'Bahrein'),
(275, 20, 'es', 'Bangladesh'),
(276, 21, 'es', 'Barbados'),
(277, 22, 'es', 'Bielorrusia'),
(278, 23, 'es', 'Bélgica'),
(279, 24, 'es', 'Belice'),
(280, 25, 'es', 'Benín'),
(281, 26, 'es', 'Islas Bermudas'),
(282, 27, 'es', 'Bhután'),
(283, 28, 'es', 'Bolivia'),
(284, 29, 'es', 'Bosnia y Herzegovina'),
(285, 30, 'es', 'Botsuana'),
(286, 31, 'es', 'Brasil'),
(287, 32, 'es', 'Territorio Británico del Océano índico'),
(288, 33, 'es', 'Islas Vírgenes Británicas'),
(289, 34, 'es', 'Brunéi'),
(290, 35, 'es', 'Bulgaria'),
(291, 36, 'es', 'Burkina Faso'),
(292, 37, 'es', 'Burundi'),
(293, 38, 'es', 'Camboya'),
(294, 39, 'es', 'Camerún'),
(295, 40, 'es', 'Canadá'),
(296, 41, 'es', 'Islas Canarias'),
(297, 42, 'es', 'Cabo Verde'),
(298, 43, 'es', 'Caribe Neerlandés'),
(299, 44, 'es', 'Islas Caimán'),
(300, 45, 'es', 'República Centroafricana'),
(301, 46, 'es', 'Ceuta y Melilla'),
(302, 47, 'es', 'Chad'),
(303, 48, 'es', 'Chile'),
(304, 49, 'es', 'China'),
(305, 50, 'es', 'Isla de Navidad'),
(306, 51, 'es', 'Islas Cocos'),
(307, 52, 'es', 'Colombia'),
(308, 53, 'es', 'Comoras'),
(309, 54, 'es', 'República del Congo'),
(310, 55, 'es', 'República Democrática del Congo'),
(311, 56, 'es', 'Islas Cook'),
(312, 57, 'es', 'Costa Rica'),
(313, 58, 'es', 'Costa de Marfil'),
(314, 59, 'es', 'Croacia'),
(315, 60, 'es', 'Cuba'),
(316, 61, 'es', 'Curazao'),
(317, 62, 'es', 'Chipre'),
(318, 63, 'es', 'República Checa'),
(319, 64, 'es', 'Dinamarca'),
(320, 65, 'es', 'Diego García'),
(321, 66, 'es', 'Yibuti'),
(322, 67, 'es', 'Dominica'),
(323, 68, 'es', 'República Dominicana'),
(324, 69, 'es', 'Ecuador'),
(325, 70, 'es', 'Egipto'),
(326, 71, 'es', 'El Salvador'),
(327, 72, 'es', 'Guinea Ecuatorial'),
(328, 73, 'es', 'Eritrea'),
(329, 74, 'es', 'Estonia'),
(330, 75, 'es', 'Etiopía'),
(331, 76, 'es', 'Europa'),
(332, 77, 'es', 'Islas Malvinas'),
(333, 78, 'es', 'Islas Feroe'),
(334, 79, 'es', 'Fiyi'),
(335, 80, 'es', 'Finlandia'),
(336, 81, 'es', 'Francia'),
(337, 82, 'es', 'Guayana Francesa'),
(338, 83, 'es', 'Polinesia Francesa'),
(339, 84, 'es', 'Territorios Australes y Antárticas Franceses'),
(340, 85, 'es', 'Gabón'),
(341, 86, 'es', 'Gambia'),
(342, 87, 'es', 'Georgia'),
(343, 88, 'es', 'Alemania'),
(344, 89, 'es', 'Ghana'),
(345, 90, 'es', 'Gibraltar'),
(346, 91, 'es', 'Grecia'),
(347, 92, 'es', 'Groenlandia'),
(348, 93, 'es', 'Granada'),
(349, 94, 'es', 'Guadalupe'),
(350, 95, 'es', 'Guam'),
(351, 96, 'es', 'Guatemala'),
(352, 97, 'es', 'Guernsey'),
(353, 98, 'es', 'Guinea'),
(354, 99, 'es', 'Guinea-Bisáu'),
(355, 100, 'es', 'Guyana'),
(356, 101, 'es', 'Haití'),
(357, 102, 'es', 'Honduras'),
(358, 103, 'es', 'Hong Kong'),
(359, 104, 'es', 'Hungría'),
(360, 105, 'es', 'Islandia'),
(361, 106, 'es', 'India'),
(362, 107, 'es', 'Indonesia'),
(363, 108, 'es', 'Irán'),
(364, 109, 'es', 'Irak'),
(365, 110, 'es', 'Irlanda'),
(366, 111, 'es', 'Isla de Man'),
(367, 112, 'es', 'Israel'),
(368, 113, 'es', 'Italia'),
(369, 114, 'es', 'Jamaica'),
(370, 115, 'es', 'Japón'),
(371, 116, 'es', 'Jersey'),
(372, 117, 'es', 'Jordania'),
(373, 118, 'es', 'Kazajistán'),
(374, 119, 'es', 'Kenia'),
(375, 120, 'es', 'Kiribati'),
(376, 121, 'es', 'Kosovo'),
(377, 122, 'es', 'Kuwait'),
(378, 123, 'es', 'Kirguistán'),
(379, 124, 'es', 'Laos'),
(380, 125, 'es', 'Letonia'),
(381, 126, 'es', 'Líbano'),
(382, 127, 'es', 'Lesoto'),
(383, 128, 'es', 'Liberia'),
(384, 129, 'es', 'Libia'),
(385, 130, 'es', 'Liechtenstein'),
(386, 131, 'es', 'Lituania'),
(387, 132, 'es', 'Luxemburgo'),
(388, 133, 'es', 'Macao'),
(389, 134, 'es', 'Macedonia'),
(390, 135, 'es', 'Madagascar'),
(391, 136, 'es', 'Malaui'),
(392, 137, 'es', 'Malasia'),
(393, 138, 'es', 'Maldivas'),
(394, 139, 'es', 'Malí'),
(395, 140, 'es', 'Malta'),
(396, 141, 'es', 'Islas Marshall'),
(397, 142, 'es', 'Martinica'),
(398, 143, 'es', 'Mauritania'),
(399, 144, 'es', 'Mauricio'),
(400, 145, 'es', 'Mayotte'),
(401, 146, 'es', 'México'),
(402, 147, 'es', 'Micronesia'),
(403, 148, 'es', 'Moldavia'),
(404, 149, 'es', 'Mónaco'),
(405, 150, 'es', 'Mongolia'),
(406, 151, 'es', 'Montenegro'),
(407, 152, 'es', 'Montserrat'),
(408, 153, 'es', 'Marruecos'),
(409, 154, 'es', 'Mozambique'),
(410, 155, 'es', 'Birmania'),
(411, 156, 'es', 'Namibia'),
(412, 157, 'es', 'Nauru'),
(413, 158, 'es', 'Nepal'),
(414, 159, 'es', 'Holanda'),
(415, 160, 'es', 'Nueva Caledonia'),
(416, 161, 'es', 'Nueva Zelanda'),
(417, 162, 'es', 'Nicaragua'),
(418, 163, 'es', 'Níger'),
(419, 164, 'es', 'Nigeria'),
(420, 165, 'es', 'Niue'),
(421, 166, 'es', 'Isla Norfolk'),
(422, 167, 'es', 'Corea del Norte'),
(423, 168, 'es', 'Islas Marianas del Norte'),
(424, 169, 'es', 'Noruega'),
(425, 170, 'es', 'Omán'),
(426, 171, 'es', 'Pakistán'),
(427, 172, 'es', 'Palaos'),
(428, 173, 'es', 'Palestina'),
(429, 174, 'es', 'Panamá'),
(430, 175, 'es', 'Papúa Nueva Guinea'),
(431, 176, 'es', 'Paraguay'),
(432, 177, 'es', 'Perú'),
(433, 178, 'es', 'Filipinas'),
(434, 179, 'es', 'Islas Pitcairn'),
(435, 180, 'es', 'Polonia'),
(436, 181, 'es', 'Portugal'),
(437, 182, 'es', 'Puerto Rico'),
(438, 183, 'es', 'Catar'),
(439, 184, 'es', 'Reunión'),
(440, 185, 'es', 'Rumania'),
(441, 186, 'es', 'Rusia'),
(442, 187, 'es', 'Ruanda'),
(443, 188, 'es', 'Samoa'),
(444, 189, 'es', 'San Marino'),
(445, 190, 'es', 'Santo Tomé y Príncipe'),
(446, 191, 'es', 'Arabia Saudita'),
(447, 192, 'es', 'Senegal'),
(448, 193, 'es', 'Serbia'),
(449, 194, 'es', 'Seychelles'),
(450, 195, 'es', 'Sierra Leona'),
(451, 196, 'es', 'Singapur'),
(452, 197, 'es', 'San Martín'),
(453, 198, 'es', 'Eslovaquia'),
(454, 199, 'es', 'Eslovenia'),
(455, 200, 'es', 'Islas Salomón'),
(456, 201, 'es', 'Somalia'),
(457, 202, 'es', 'Sudáfrica'),
(458, 203, 'es', 'Islas Georgias del Sur y Sandwich del Sur'),
(459, 204, 'es', 'Corea del Sur'),
(460, 205, 'es', 'Sudán del Sur'),
(461, 206, 'es', 'España'),
(462, 207, 'es', 'Sri Lanka'),
(463, 208, 'es', 'San Bartolomé'),
(464, 209, 'es', 'Santa Elena'),
(465, 210, 'es', 'San Cristóbal y Nieves'),
(466, 211, 'es', 'Santa Lucía'),
(467, 212, 'es', 'San Martín'),
(468, 213, 'es', 'San Pedro y Miquelón'),
(469, 214, 'es', 'San Vicente y las Granadinas'),
(470, 215, 'es', 'Sudán'),
(471, 216, 'es', 'Surinam'),
(472, 217, 'es', 'Svalbard y Jan Mayen'),
(473, 218, 'es', 'Suazilandia'),
(474, 219, 'es', 'Suecia'),
(475, 220, 'es', 'Suiza'),
(476, 221, 'es', 'Siri'),
(477, 222, 'es', 'Taiwán'),
(478, 223, 'es', 'Tayikistán'),
(479, 224, 'es', 'Tanzania'),
(480, 225, 'es', 'Tailandia'),
(481, 226, 'es', 'Timor Oriental'),
(482, 227, 'es', 'Togo'),
(483, 228, 'es', 'Tokelau'),
(484, 229, 'es', 'Tonga'),
(485, 230, 'es', 'Trinidad y Tobago'),
(486, 231, 'es', 'Tristán de Acuña'),
(487, 232, 'es', 'Túnez'),
(488, 233, 'es', 'Turquía'),
(489, 234, 'es', 'Turkmenistán'),
(490, 235, 'es', 'Islas Turcas y Caicos'),
(491, 236, 'es', 'Tuvalu'),
(492, 237, 'es', 'Islas Ultramarinas Menores de los Estados Unidos'),
(493, 238, 'es', 'Islas Vírgenes de los Estados Unidos'),
(494, 239, 'es', 'Uganda'),
(495, 240, 'es', 'Ucrania'),
(496, 241, 'es', 'Emiratos árabes Unidos'),
(497, 242, 'es', 'Reino Unido'),
(498, 243, 'es', 'Naciones Unidas'),
(499, 244, 'es', 'Estados Unidos'),
(500, 245, 'es', 'Uruguay'),
(501, 246, 'es', 'Uzbekistán'),
(502, 247, 'es', 'Vanuatu'),
(503, 248, 'es', 'Ciudad del Vaticano'),
(504, 249, 'es', 'Venezuela'),
(505, 250, 'es', 'Vietnam'),
(506, 251, 'es', 'Wallis y Futuna'),
(507, 252, 'es', 'Sahara Occidental'),
(508, 253, 'es', 'Yemen'),
(509, 254, 'es', 'Zambia'),
(510, 255, 'es', 'Zimbabue'),
(511, 1, 'fa', 'افغانستان'),
(512, 2, 'fa', 'جزایر الند'),
(513, 3, 'fa', 'آلبانی'),
(514, 4, 'fa', 'الجزایر'),
(515, 5, 'fa', 'ساموآ آمریکایی'),
(516, 6, 'fa', 'آندورا'),
(517, 7, 'fa', 'آنگولا'),
(518, 8, 'fa', 'آنگولا'),
(519, 9, 'fa', 'جنوبگان'),
(520, 10, 'fa', 'آنتیگوا و باربودا'),
(521, 11, 'fa', 'آرژانتین'),
(522, 12, 'fa', 'ارمنستان'),
(523, 13, 'fa', 'آروبا'),
(524, 14, 'fa', 'جزیره صعود'),
(525, 15, 'fa', 'استرالیا'),
(526, 16, 'fa', 'اتریش'),
(527, 17, 'fa', 'آذربایجان'),
(528, 18, 'fa', 'باهاما'),
(529, 19, 'fa', 'بحرین'),
(530, 20, 'fa', 'بنگلادش'),
(531, 21, 'fa', 'باربادوس'),
(532, 22, 'fa', 'بلاروس'),
(533, 23, 'fa', 'بلژیک'),
(534, 24, 'fa', 'بلژیک'),
(535, 25, 'fa', 'بنین'),
(536, 26, 'fa', 'برمودا'),
(537, 27, 'fa', 'بوتان'),
(538, 28, 'fa', 'بولیوی'),
(539, 29, 'fa', 'بوسنی و هرزگوین'),
(540, 30, 'fa', 'بوتسوانا'),
(541, 31, 'fa', 'برزیل'),
(542, 32, 'fa', 'قلمرو اقیانوس هند انگلیس'),
(543, 33, 'fa', 'جزایر ویرجین انگلیس'),
(544, 34, 'fa', 'برونئی'),
(545, 35, 'fa', 'بلغارستان'),
(546, 36, 'fa', 'بورکینا فاسو'),
(547, 37, 'fa', 'بوروندی'),
(548, 38, 'fa', 'کامبوج'),
(549, 39, 'fa', 'کامرون'),
(550, 40, 'fa', 'کانادا'),
(551, 41, 'fa', 'جزایر قناری'),
(552, 42, 'fa', 'کیپ ورد'),
(553, 43, 'fa', 'کارائیب هلند'),
(554, 44, 'fa', 'Cayman Islands'),
(555, 45, 'fa', 'جمهوری آفریقای مرکزی'),
(556, 46, 'fa', 'سوتا و ملیلا'),
(557, 47, 'fa', 'چاد'),
(558, 48, 'fa', 'شیلی'),
(559, 49, 'fa', 'چین'),
(560, 50, 'fa', 'جزیره کریسمس'),
(561, 51, 'fa', 'جزایر کوکو (Keeling)'),
(562, 52, 'fa', 'کلمبیا'),
(563, 53, 'fa', 'کومور'),
(564, 54, 'fa', 'کنگو - برزاویل'),
(565, 55, 'fa', 'کنگو - کینشاسا'),
(566, 56, 'fa', 'جزایر کوک'),
(567, 57, 'fa', 'کاستاریکا'),
(568, 58, 'fa', 'ساحل عاج'),
(569, 59, 'fa', 'کرواسی'),
(570, 60, 'fa', 'کوبا'),
(571, 61, 'fa', 'کوراسائو'),
(572, 62, 'fa', 'قبرس'),
(573, 63, 'fa', 'چک'),
(574, 64, 'fa', 'دانمارک'),
(575, 65, 'fa', 'دیگو گارسیا'),
(576, 66, 'fa', 'جیبوتی'),
(577, 67, 'fa', 'دومینیکا'),
(578, 68, 'fa', 'جمهوری دومینیکن'),
(579, 69, 'fa', 'اکوادور'),
(580, 70, 'fa', 'مصر'),
(581, 71, 'fa', 'السالوادور'),
(582, 72, 'fa', 'گینه استوایی'),
(583, 73, 'fa', 'اریتره'),
(584, 74, 'fa', 'استونی'),
(585, 75, 'fa', 'اتیوپی'),
(586, 76, 'fa', 'منطقه یورو'),
(587, 77, 'fa', 'جزایر فالکلند'),
(588, 78, 'fa', 'جزایر فارو'),
(589, 79, 'fa', 'فیجی'),
(590, 80, 'fa', 'فنلاند'),
(591, 81, 'fa', 'فرانسه'),
(592, 82, 'fa', 'گویان فرانسه'),
(593, 83, 'fa', 'پلی‌نزی فرانسه'),
(594, 84, 'fa', 'سرزمین های جنوبی فرانسه'),
(595, 85, 'fa', 'گابن'),
(596, 86, 'fa', 'گامبیا'),
(597, 87, 'fa', 'جورجیا'),
(598, 88, 'fa', 'آلمان'),
(599, 89, 'fa', 'غنا'),
(600, 90, 'fa', 'جبل الطارق'),
(601, 91, 'fa', 'یونان'),
(602, 92, 'fa', 'گرینلند'),
(603, 93, 'fa', 'گرنادا'),
(604, 94, 'fa', 'گوادلوپ'),
(605, 95, 'fa', 'گوام'),
(606, 96, 'fa', 'گواتمالا'),
(607, 97, 'fa', 'گورنسی'),
(608, 98, 'fa', 'گینه'),
(609, 99, 'fa', 'گینه بیسائو'),
(610, 100, 'fa', 'گویان'),
(611, 101, 'fa', 'هائیتی'),
(612, 102, 'fa', 'هندوراس'),
(613, 103, 'fa', 'هنگ کنگ SAR چین'),
(614, 104, 'fa', 'مجارستان'),
(615, 105, 'fa', 'ایسلند'),
(616, 106, 'fa', 'هند'),
(617, 107, 'fa', 'اندونزی'),
(618, 108, 'fa', 'ایران'),
(619, 109, 'fa', 'عراق'),
(620, 110, 'fa', 'ایرلند'),
(621, 111, 'fa', 'جزیره من'),
(622, 112, 'fa', 'اسرائيل'),
(623, 113, 'fa', 'ایتالیا'),
(624, 114, 'fa', 'جامائیکا'),
(625, 115, 'fa', 'ژاپن'),
(626, 116, 'fa', 'پیراهن ورزشی'),
(627, 117, 'fa', 'اردن'),
(628, 118, 'fa', 'قزاقستان'),
(629, 119, 'fa', 'کنیا'),
(630, 120, 'fa', 'کیریباتی'),
(631, 121, 'fa', 'کوزوو'),
(632, 122, 'fa', 'کویت'),
(633, 123, 'fa', 'قرقیزستان'),
(634, 124, 'fa', 'لائوس'),
(635, 125, 'fa', 'لتونی'),
(636, 126, 'fa', 'لبنان'),
(637, 127, 'fa', 'لسوتو'),
(638, 128, 'fa', 'لیبریا'),
(639, 129, 'fa', 'لیبی'),
(640, 130, 'fa', 'لیختن اشتاین'),
(641, 131, 'fa', 'لیتوانی'),
(642, 132, 'fa', 'لوکزامبورگ'),
(643, 133, 'fa', 'ماکائو SAR چین'),
(644, 134, 'fa', 'مقدونیه'),
(645, 135, 'fa', 'ماداگاسکار'),
(646, 136, 'fa', 'مالاوی'),
(647, 137, 'fa', 'مالزی'),
(648, 138, 'fa', 'مالدیو'),
(649, 139, 'fa', 'مالی'),
(650, 140, 'fa', 'مالت'),
(651, 141, 'fa', 'جزایر مارشال'),
(652, 142, 'fa', 'مارتینیک'),
(653, 143, 'fa', 'موریتانی'),
(654, 144, 'fa', 'موریس'),
(655, 145, 'fa', 'گمشده'),
(656, 146, 'fa', 'مکزیک'),
(657, 147, 'fa', 'میکرونزی'),
(658, 148, 'fa', 'مولداوی'),
(659, 149, 'fa', 'موناکو'),
(660, 150, 'fa', 'مغولستان'),
(661, 151, 'fa', 'مونته نگرو'),
(662, 152, 'fa', 'مونتسرات'),
(663, 153, 'fa', 'مراکش'),
(664, 154, 'fa', 'موزامبیک'),
(665, 155, 'fa', 'میانمار (برمه)'),
(666, 156, 'fa', 'ناميبيا'),
(667, 157, 'fa', 'نائورو'),
(668, 158, 'fa', 'نپال'),
(669, 159, 'fa', 'هلند'),
(670, 160, 'fa', 'کالدونیای جدید'),
(671, 161, 'fa', 'نیوزلند'),
(672, 162, 'fa', 'نیکاراگوئه'),
(673, 163, 'fa', 'نیجر'),
(674, 164, 'fa', 'نیجریه'),
(675, 165, 'fa', 'نیو'),
(676, 166, 'fa', 'جزیره نورفولک'),
(677, 167, 'fa', 'کره شمالی'),
(678, 168, 'fa', 'جزایر ماریانای شمالی'),
(679, 169, 'fa', 'نروژ'),
(680, 170, 'fa', 'عمان'),
(681, 171, 'fa', 'پاکستان'),
(682, 172, 'fa', 'پالائو'),
(683, 173, 'fa', 'سرزمین های فلسطینی'),
(684, 174, 'fa', 'پاناما'),
(685, 175, 'fa', 'پاپوا گینه نو'),
(686, 176, 'fa', 'پاراگوئه'),
(687, 177, 'fa', 'پرو'),
(688, 178, 'fa', 'فیلیپین'),
(689, 179, 'fa', 'جزایر پیکریرن'),
(690, 180, 'fa', 'لهستان'),
(691, 181, 'fa', 'کشور پرتغال'),
(692, 182, 'fa', 'پورتوریکو'),
(693, 183, 'fa', 'قطر'),
(694, 184, 'fa', 'تجدید دیدار'),
(695, 185, 'fa', 'رومانی'),
(696, 186, 'fa', 'روسیه'),
(697, 187, 'fa', 'رواندا'),
(698, 188, 'fa', 'ساموآ'),
(699, 189, 'fa', 'سان مارینو'),
(700, 190, 'fa', 'سنت کیتس و نوویس'),
(701, 191, 'fa', 'عربستان سعودی'),
(702, 192, 'fa', 'سنگال'),
(703, 193, 'fa', 'صربستان'),
(704, 194, 'fa', 'سیشل'),
(705, 195, 'fa', 'سیرالئون'),
(706, 196, 'fa', 'سنگاپور'),
(707, 197, 'fa', 'سینت ماارتن'),
(708, 198, 'fa', 'اسلواکی'),
(709, 199, 'fa', 'اسلوونی'),
(710, 200, 'fa', 'جزایر سلیمان'),
(711, 201, 'fa', 'سومالی'),
(712, 202, 'fa', 'آفریقای جنوبی'),
(713, 203, 'fa', 'جزایر جورجیا جنوبی و جزایر ساندویچ جنوبی'),
(714, 204, 'fa', 'کره جنوبی'),
(715, 205, 'fa', 'سودان جنوبی'),
(716, 206, 'fa', 'اسپانیا'),
(717, 207, 'fa', 'سری لانکا'),
(718, 208, 'fa', 'سنت بارتلی'),
(719, 209, 'fa', 'سنت هلنا'),
(720, 210, 'fa', 'سنت کیتز و نوویس'),
(721, 211, 'fa', 'سنت لوسیا'),
(722, 212, 'fa', 'سنت مارتین'),
(723, 213, 'fa', 'سنت پیر و میکلون'),
(724, 214, 'fa', 'سنت وینسنت و گرنادینها'),
(725, 215, 'fa', 'سودان'),
(726, 216, 'fa', 'سورینام'),
(727, 217, 'fa', 'اسوالبارد و جان ماین'),
(728, 218, 'fa', 'سوازیلند'),
(729, 219, 'fa', 'سوئد'),
(730, 220, 'fa', 'سوئیس'),
(731, 221, 'fa', 'سوریه'),
(732, 222, 'fa', 'تایوان'),
(733, 223, 'fa', 'تاجیکستان'),
(734, 224, 'fa', 'تانزانیا'),
(735, 225, 'fa', 'تایلند'),
(736, 226, 'fa', 'تیمور-لست'),
(737, 227, 'fa', 'رفتن'),
(738, 228, 'fa', 'توکلو'),
(739, 229, 'fa', 'تونگا'),
(740, 230, 'fa', 'ترینیداد و توباگو'),
(741, 231, 'fa', 'تریستان دا کانونا'),
(742, 232, 'fa', 'تونس'),
(743, 233, 'fa', 'بوقلمون'),
(744, 234, 'fa', 'ترکمنستان'),
(745, 235, 'fa', 'جزایر تورکس و کایکوس'),
(746, 236, 'fa', 'تووالو'),
(747, 237, 'fa', 'جزایر دور افتاده ایالات متحده آمریکا'),
(748, 238, 'fa', 'جزایر ویرجین ایالات متحده'),
(749, 239, 'fa', 'اوگاندا'),
(750, 240, 'fa', 'اوکراین'),
(751, 241, 'fa', 'امارات متحده عربی'),
(752, 242, 'fa', 'انگلستان'),
(753, 243, 'fa', 'سازمان ملل'),
(754, 244, 'fa', 'ایالات متحده'),
(755, 245, 'fa', 'اروگوئه'),
(756, 246, 'fa', 'ازبکستان'),
(757, 247, 'fa', 'وانواتو'),
(758, 248, 'fa', 'شهر واتیکان'),
(759, 249, 'fa', 'ونزوئلا'),
(760, 250, 'fa', 'ویتنام'),
(761, 251, 'fa', 'والیس و فوتونا'),
(762, 252, 'fa', 'صحرای غربی'),
(763, 253, 'fa', 'یمن'),
(764, 254, 'fa', 'زامبیا'),
(765, 255, 'fa', 'زیمبابوه'),
(766, 1, 'pt_BR', 'Afeganistão'),
(767, 2, 'pt_BR', 'Ilhas Åland'),
(768, 3, 'pt_BR', 'Albânia'),
(769, 4, 'pt_BR', 'Argélia'),
(770, 5, 'pt_BR', 'Samoa Americana'),
(771, 6, 'pt_BR', 'Andorra'),
(772, 7, 'pt_BR', 'Angola'),
(773, 8, 'pt_BR', 'Angola'),
(774, 9, 'pt_BR', 'Antártico'),
(775, 10, 'pt_BR', 'Antígua e Barbuda'),
(776, 11, 'pt_BR', 'Argentina'),
(777, 12, 'pt_BR', 'Armênia'),
(778, 13, 'pt_BR', 'Aruba'),
(779, 14, 'pt_BR', 'Ilha de escalada'),
(780, 15, 'pt_BR', 'Austrália'),
(781, 16, 'pt_BR', 'Áustria'),
(782, 17, 'pt_BR', 'Azerbaijão'),
(783, 18, 'pt_BR', 'Bahamas'),
(784, 19, 'pt_BR', 'Bahrain'),
(785, 20, 'pt_BR', 'Bangladesh'),
(786, 21, 'pt_BR', 'Barbados'),
(787, 22, 'pt_BR', 'Bielorrússia'),
(788, 23, 'pt_BR', 'Bélgica'),
(789, 24, 'pt_BR', 'Bélgica'),
(790, 25, 'pt_BR', 'Benin'),
(791, 26, 'pt_BR', 'Bermuda'),
(792, 27, 'pt_BR', 'Butão'),
(793, 28, 'pt_BR', 'Bolívia'),
(794, 29, 'pt_BR', 'Bósnia e Herzegovina'),
(795, 30, 'pt_BR', 'Botsuana'),
(796, 31, 'pt_BR', 'Brasil'),
(797, 32, 'pt_BR', 'Território Britânico do Oceano Índico'),
(798, 33, 'pt_BR', 'Ilhas Virgens Britânicas'),
(799, 34, 'pt_BR', 'Brunei'),
(800, 35, 'pt_BR', 'Bulgária'),
(801, 36, 'pt_BR', 'Burkina Faso'),
(802, 37, 'pt_BR', 'Burundi'),
(803, 38, 'pt_BR', 'Camboja'),
(804, 39, 'pt_BR', 'Camarões'),
(805, 40, 'pt_BR', 'Canadá'),
(806, 41, 'pt_BR', 'Ilhas Canárias'),
(807, 42, 'pt_BR', 'Cabo Verde'),
(808, 43, 'pt_BR', 'Holanda do Caribe'),
(809, 44, 'pt_BR', 'Ilhas Cayman'),
(810, 45, 'pt_BR', 'República Centro-Africana'),
(811, 46, 'pt_BR', 'Ceuta e Melilla'),
(812, 47, 'pt_BR', 'Chade'),
(813, 48, 'pt_BR', 'Chile'),
(814, 49, 'pt_BR', 'China'),
(815, 50, 'pt_BR', 'Ilha Christmas'),
(816, 51, 'pt_BR', 'Ilhas Cocos (Keeling)'),
(817, 52, 'pt_BR', 'Colômbia'),
(818, 53, 'pt_BR', 'Comores'),
(819, 54, 'pt_BR', 'Congo - Brazzaville'),
(820, 55, 'pt_BR', 'Congo - Kinshasa'),
(821, 56, 'pt_BR', 'Ilhas Cook'),
(822, 57, 'pt_BR', 'Costa Rica'),
(823, 58, 'pt_BR', 'Costa do Marfim'),
(824, 59, 'pt_BR', 'Croácia'),
(825, 60, 'pt_BR', 'Cuba'),
(826, 61, 'pt_BR', 'Curaçao'),
(827, 62, 'pt_BR', 'Chipre'),
(828, 63, 'pt_BR', 'Czechia'),
(829, 64, 'pt_BR', 'Dinamarca'),
(830, 65, 'pt_BR', 'Diego Garcia'),
(831, 66, 'pt_BR', 'Djibuti'),
(832, 67, 'pt_BR', 'Dominica'),
(833, 68, 'pt_BR', 'República Dominicana'),
(834, 69, 'pt_BR', 'Equador'),
(835, 70, 'pt_BR', 'Egito'),
(836, 71, 'pt_BR', 'El Salvador'),
(837, 72, 'pt_BR', 'Guiné Equatorial'),
(838, 73, 'pt_BR', 'Eritreia'),
(839, 74, 'pt_BR', 'Estônia'),
(840, 75, 'pt_BR', 'Etiópia'),
(841, 76, 'pt_BR', 'Zona Euro'),
(842, 77, 'pt_BR', 'Ilhas Malvinas'),
(843, 78, 'pt_BR', 'Ilhas Faroe'),
(844, 79, 'pt_BR', 'Fiji'),
(845, 80, 'pt_BR', 'Finlândia'),
(846, 81, 'pt_BR', 'França'),
(847, 82, 'pt_BR', 'Guiana Francesa'),
(848, 83, 'pt_BR', 'Polinésia Francesa'),
(849, 84, 'pt_BR', 'Territórios Franceses do Sul'),
(850, 85, 'pt_BR', 'Gabão'),
(851, 86, 'pt_BR', 'Gâmbia'),
(852, 87, 'pt_BR', 'Geórgia'),
(853, 88, 'pt_BR', 'Alemanha'),
(854, 89, 'pt_BR', 'Gana'),
(855, 90, 'pt_BR', 'Gibraltar'),
(856, 91, 'pt_BR', 'Grécia'),
(857, 92, 'pt_BR', 'Gronelândia'),
(858, 93, 'pt_BR', 'Granada'),
(859, 94, 'pt_BR', 'Guadalupe'),
(860, 95, 'pt_BR', 'Guam'),
(861, 96, 'pt_BR', 'Guatemala'),
(862, 97, 'pt_BR', 'Guernsey'),
(863, 98, 'pt_BR', 'Guiné'),
(864, 99, 'pt_BR', 'Guiné-Bissau'),
(865, 100, 'pt_BR', 'Guiana'),
(866, 101, 'pt_BR', 'Haiti'),
(867, 102, 'pt_BR', 'Honduras'),
(868, 103, 'pt_BR', 'Região Administrativa Especial de Hong Kong, China'),
(869, 104, 'pt_BR', 'Hungria'),
(870, 105, 'pt_BR', 'Islândia'),
(871, 106, 'pt_BR', 'Índia'),
(872, 107, 'pt_BR', 'Indonésia'),
(873, 108, 'pt_BR', 'Irã'),
(874, 109, 'pt_BR', 'Iraque'),
(875, 110, 'pt_BR', 'Irlanda'),
(876, 111, 'pt_BR', 'Ilha de Man'),
(877, 112, 'pt_BR', 'Israel'),
(878, 113, 'pt_BR', 'Itália'),
(879, 114, 'pt_BR', 'Jamaica'),
(880, 115, 'pt_BR', 'Japão'),
(881, 116, 'pt_BR', 'Jersey'),
(882, 117, 'pt_BR', 'Jordânia'),
(883, 118, 'pt_BR', 'Cazaquistão'),
(884, 119, 'pt_BR', 'Quênia'),
(885, 120, 'pt_BR', 'Quiribati'),
(886, 121, 'pt_BR', 'Kosovo'),
(887, 122, 'pt_BR', 'Kuwait'),
(888, 123, 'pt_BR', 'Quirguistão'),
(889, 124, 'pt_BR', 'Laos'),
(890, 125, 'pt_BR', 'Letônia'),
(891, 126, 'pt_BR', 'Líbano'),
(892, 127, 'pt_BR', 'Lesoto'),
(893, 128, 'pt_BR', 'Libéria'),
(894, 129, 'pt_BR', 'Líbia'),
(895, 130, 'pt_BR', 'Liechtenstein'),
(896, 131, 'pt_BR', 'Lituânia'),
(897, 132, 'pt_BR', 'Luxemburgo'),
(898, 133, 'pt_BR', 'Macau SAR China'),
(899, 134, 'pt_BR', 'Macedônia'),
(900, 135, 'pt_BR', 'Madagascar'),
(901, 136, 'pt_BR', 'Malawi'),
(902, 137, 'pt_BR', 'Malásia'),
(903, 138, 'pt_BR', 'Maldivas'),
(904, 139, 'pt_BR', 'Mali'),
(905, 140, 'pt_BR', 'Malta'),
(906, 141, 'pt_BR', 'Ilhas Marshall'),
(907, 142, 'pt_BR', 'Martinica'),
(908, 143, 'pt_BR', 'Mauritânia'),
(909, 144, 'pt_BR', 'Maurício'),
(910, 145, 'pt_BR', 'Maiote'),
(911, 146, 'pt_BR', 'México'),
(912, 147, 'pt_BR', 'Micronésia'),
(913, 148, 'pt_BR', 'Moldávia'),
(914, 149, 'pt_BR', 'Mônaco'),
(915, 150, 'pt_BR', 'Mongólia'),
(916, 151, 'pt_BR', 'Montenegro'),
(917, 152, 'pt_BR', 'Montserrat'),
(918, 153, 'pt_BR', 'Marrocos'),
(919, 154, 'pt_BR', 'Moçambique'),
(920, 155, 'pt_BR', 'Mianmar (Birmânia)'),
(921, 156, 'pt_BR', 'Namíbia'),
(922, 157, 'pt_BR', 'Nauru'),
(923, 158, 'pt_BR', 'Nepal'),
(924, 159, 'pt_BR', 'Holanda'),
(925, 160, 'pt_BR', 'Nova Caledônia'),
(926, 161, 'pt_BR', 'Nova Zelândia'),
(927, 162, 'pt_BR', 'Nicarágua'),
(928, 163, 'pt_BR', 'Níger'),
(929, 164, 'pt_BR', 'Nigéria'),
(930, 165, 'pt_BR', 'Niue'),
(931, 166, 'pt_BR', 'Ilha Norfolk'),
(932, 167, 'pt_BR', 'Coréia do Norte'),
(933, 168, 'pt_BR', 'Ilhas Marianas do Norte'),
(934, 169, 'pt_BR', 'Noruega'),
(935, 170, 'pt_BR', 'Omã'),
(936, 171, 'pt_BR', 'Paquistão'),
(937, 172, 'pt_BR', 'Palau'),
(938, 173, 'pt_BR', 'Territórios Palestinos'),
(939, 174, 'pt_BR', 'Panamá'),
(940, 175, 'pt_BR', 'Papua Nova Guiné'),
(941, 176, 'pt_BR', 'Paraguai'),
(942, 177, 'pt_BR', 'Peru'),
(943, 178, 'pt_BR', 'Filipinas'),
(944, 179, 'pt_BR', 'Ilhas Pitcairn'),
(945, 180, 'pt_BR', 'Polônia'),
(946, 181, 'pt_BR', 'Portugal'),
(947, 182, 'pt_BR', 'Porto Rico'),
(948, 183, 'pt_BR', 'Catar'),
(949, 184, 'pt_BR', 'Reunião'),
(950, 185, 'pt_BR', 'Romênia'),
(951, 186, 'pt_BR', 'Rússia'),
(952, 187, 'pt_BR', 'Ruanda'),
(953, 188, 'pt_BR', 'Samoa'),
(954, 189, 'pt_BR', 'São Marinho'),
(955, 190, 'pt_BR', 'São Cristóvão e Nevis'),
(956, 191, 'pt_BR', 'Arábia Saudita'),
(957, 192, 'pt_BR', 'Senegal'),
(958, 193, 'pt_BR', 'Sérvia'),
(959, 194, 'pt_BR', 'Seychelles'),
(960, 195, 'pt_BR', 'Serra Leoa'),
(961, 196, 'pt_BR', 'Cingapura'),
(962, 197, 'pt_BR', 'São Martinho'),
(963, 198, 'pt_BR', 'Eslováquia'),
(964, 199, 'pt_BR', 'Eslovênia'),
(965, 200, 'pt_BR', 'Ilhas Salomão'),
(966, 201, 'pt_BR', 'Somália'),
(967, 202, 'pt_BR', 'África do Sul'),
(968, 203, 'pt_BR', 'Ilhas Geórgia do Sul e Sandwich do Sul'),
(969, 204, 'pt_BR', 'Coréia do Sul'),
(970, 205, 'pt_BR', 'Sudão do Sul'),
(971, 206, 'pt_BR', 'Espanha'),
(972, 207, 'pt_BR', 'Sri Lanka'),
(973, 208, 'pt_BR', 'São Bartolomeu'),
(974, 209, 'pt_BR', 'Santa Helena'),
(975, 210, 'pt_BR', 'São Cristóvão e Nevis'),
(976, 211, 'pt_BR', 'Santa Lúcia'),
(977, 212, 'pt_BR', 'São Martinho'),
(978, 213, 'pt_BR', 'São Pedro e Miquelon'),
(979, 214, 'pt_BR', 'São Vicente e Granadinas'),
(980, 215, 'pt_BR', 'Sudão'),
(981, 216, 'pt_BR', 'Suriname'),
(982, 217, 'pt_BR', 'Svalbard e Jan Mayen'),
(983, 218, 'pt_BR', 'Suazilândia'),
(984, 219, 'pt_BR', 'Suécia'),
(985, 220, 'pt_BR', 'Suíça'),
(986, 221, 'pt_BR', 'Síria'),
(987, 222, 'pt_BR', 'Taiwan'),
(988, 223, 'pt_BR', 'Tajiquistão'),
(989, 224, 'pt_BR', 'Tanzânia'),
(990, 225, 'pt_BR', 'Tailândia'),
(991, 226, 'pt_BR', 'Timor-Leste'),
(992, 227, 'pt_BR', 'Togo'),
(993, 228, 'pt_BR', 'Tokelau'),
(994, 229, 'pt_BR', 'Tonga'),
(995, 230, 'pt_BR', 'Trinidad e Tobago'),
(996, 231, 'pt_BR', 'Tristan da Cunha'),
(997, 232, 'pt_BR', 'Tunísia'),
(998, 233, 'pt_BR', 'Turquia'),
(999, 234, 'pt_BR', 'Turquemenistão'),
(1000, 235, 'pt_BR', 'Ilhas Turks e Caicos'),
(1001, 236, 'pt_BR', 'Tuvalu'),
(1002, 237, 'pt_BR', 'Ilhas periféricas dos EUA'),
(1003, 238, 'pt_BR', 'Ilhas Virgens dos EUA'),
(1004, 239, 'pt_BR', 'Uganda'),
(1005, 240, 'pt_BR', 'Ucrânia'),
(1006, 241, 'pt_BR', 'Emirados Árabes Unidos'),
(1007, 242, 'pt_BR', 'Reino Unido'),
(1008, 243, 'pt_BR', 'Nações Unidas'),
(1009, 244, 'pt_BR', 'Estados Unidos'),
(1010, 245, 'pt_BR', 'Uruguai'),
(1011, 246, 'pt_BR', 'Uzbequistão'),
(1012, 247, 'pt_BR', 'Vanuatu'),
(1013, 248, 'pt_BR', 'Cidade do Vaticano'),
(1014, 249, 'pt_BR', 'Venezuela'),
(1015, 250, 'pt_BR', 'Vietnã'),
(1016, 251, 'pt_BR', 'Wallis e Futuna'),
(1017, 252, 'pt_BR', 'Saara Ocidental'),
(1018, 253, 'pt_BR', 'Iêmen'),
(1019, 254, 'pt_BR', 'Zâmbia'),
(1020, 255, 'pt_BR', 'Zimbábue');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `symbol` varchar(191) DEFAULT NULL,
  `decimal` int(10) UNSIGNED NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `symbol`, `decimal`, `created_at`, `updated_at`) VALUES
(3, 'GHS', 'Ghana Cedis', '₵', 2, '2024-01-29 16:38:06', '2024-01-29 16:38:06');

-- --------------------------------------------------------

--
-- Table structure for table `currency_exchange_rates`
--

CREATE TABLE `currency_exchange_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `password` varchar(191) DEFAULT NULL,
  `api_token` varchar(80) DEFAULT NULL,
  `customer_group_id` int(10) UNSIGNED DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT 0,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_suspended` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `token` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `primary_phone_number` varchar(191) DEFAULT NULL,
  `service_number` varchar(191) DEFAULT NULL,
  `service_organization` varchar(191) DEFAULT NULL,
  `service_id_image` varchar(191) DEFAULT NULL,
  `government_id_number` varchar(191) DEFAULT NULL,
  `government_id_type` varchar(191) DEFAULT NULL,
  `government_id_image` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `email`, `phone`, `image`, `status`, `password`, `api_token`, `customer_group_id`, `subscribed_to_news_letter`, `is_verified`, `is_suspended`, `token`, `remember_token`, `created_at`, `updated_at`, `primary_phone_number`, `service_number`, `service_organization`, `service_id_image`, `government_id_number`, `government_id_type`, `government_id_image`) VALUES
(1, 'Owura', 'Kwaku', NULL, NULL, 'glastaborg@gmail.com', NULL, NULL, 1, '$2y$10$KQvQLXtgpPSd9s4n5k8j4.kZr5uHLRdr3FnP9Mh16R0KZzOs031j6', 'U5ulJYDIdPqZVvMOFjD4Q9SYHFoEeXq3BgteIUUNHFUwC6TXjzT4cszU6uwXUQZ6voMocRgL4vp7mdi2', 2, 0, 1, 0, '5a698fe8f75a0389b90f2decf2d14e0e', NULL, '2024-02-01 14:56:25', '2024-02-01 14:56:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Isaac', 'Kyeremeh', 'Male', '1988-03-15', 'user@example.com', '0234567890', 'customer/2/dsE3ZisQVgAx5aaLhz9ZuipOOciovgiOgntbU8R2.jpg', 1, '$2y$10$0qVdAaB5xlejR.6ceHcWnu2Hh.CSrLs4i9O59xgTlDN.HeZr6/p6S', 'ycmXVvFdatEs89XCGW3HFJHNDqF3uwU2Z17nB5q9Xb3LwitF9Wsf72wVbmSlhE1HRIwxHXMxdN5ipfVi', 2, 0, 1, 0, '5a4caa3b51f3179a0808ed7342150dd8', NULL, '2024-02-06 13:25:30', '2024-02-15 17:54:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'first', 'last', NULL, NULL, 'name@gmail.com', NULL, NULL, 1, '$2y$10$4FFu7s7qnZznZ33z5wJNGePUvlqy4FsMka1W6c5OkhSvXZerVpXCS', '92VlLnWOZuhgNy0IC1FSpzjLJaItWjtMSUBHFpkS3LzG8wXoYbhU24adRDLtZx5g4sGDaz97TPvhgy2r', 2, 0, 1, 0, '7f2f2b1389bd6b0f32bda0ad328173d8', NULL, '2024-02-16 15:45:26', '2024-02-16 16:47:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `code`, `name`, `is_user_defined`, `created_at`, `updated_at`) VALUES
(1, 'guest', 'Guest', 0, NULL, NULL),
(2, 'general', 'General', 0, NULL, NULL),
(3, 'wholesale', 'Wholesale', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_notes`
--

CREATE TABLE `customer_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `note` text NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `customer_password_resets`
--

CREATE TABLE `customer_password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `customer_social_accounts`
--

CREATE TABLE `customer_social_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `provider_name` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_purchased`
--

CREATE TABLE `downloadable_link_purchased` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `url` varchar(191) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `download_bought` int(11) NOT NULL DEFAULT 0,
  `download_used` int(11) NOT NULL DEFAULT 0,
  `status` varchar(191) DEFAULT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `order_item_id` int(10) UNSIGNED NOT NULL,
  `download_canceled` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_sources`
--

CREATE TABLE `inventory_sources` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `contact_name` varchar(191) NOT NULL,
  `contact_email` varchar(191) NOT NULL,
  `contact_number` varchar(191) NOT NULL,
  `contact_fax` varchar(191) DEFAULT NULL,
  `country` varchar(191) NOT NULL,
  `state` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `street` varchar(191) NOT NULL,
  `postcode` varchar(191) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `inventory_sources`
--

INSERT INTO `inventory_sources` (`id`, `code`, `name`, `description`, `contact_name`, `contact_email`, `contact_number`, `contact_fax`, `country`, `state`, `city`, `street`, `postcode`, `priority`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(1, 'default', 'Default', NULL, 'Detroit Warehouse', 'warehouse@example.com', '1234567899', NULL, 'US', 'MI', 'Detroit', '12th Street', '48127', 0, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `increment_id` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `total_qty` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) DEFAULT NULL,
  `channel_currency_code` varchar(191) DEFAULT NULL,
  `order_currency_code` varchar(191) DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `reminders` int(11) NOT NULL DEFAULT 0,
  `next_reminder_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `increment_id`, `state`, `email_sent`, `total_qty`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `sub_total`, `base_sub_total`, `grand_total`, `base_grand_total`, `shipping_amount`, `base_shipping_amount`, `tax_amount`, `base_tax_amount`, `discount_amount`, `base_discount_amount`, `order_id`, `transaction_id`, `reminders`, `next_reminder_at`, `created_at`, `updated_at`) VALUES
(1, '1', 'paid', 0, 2, 'GHS', 'GHS', 'GHS', 1258.0000, 1258.0000, 1278.0000, 1278.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, NULL, 0, NULL, '2024-02-06 15:05:15', '2024-02-06 15:05:15');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) DEFAULT NULL,
  `order_item_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `parent_id`, `name`, `description`, `sku`, `qty`, `price`, `base_price`, `total`, `base_total`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `product_id`, `product_type`, `order_item_id`, `invoice_id`, `additional`, `created_at`, `updated_at`) VALUES
(1, NULL, 'BACKBONE Mens Army Military Battle Dress Uniform BDU Shirt Camo Top Jacket', NULL, '01', 1, 670.0000, 670.0000, 670.0000, 670.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 'Webkul\\Product\\Models\\Product', 1, 1, '{\"quantity\":1,\"product_id\":1,\"locale\":\"en\"}', '2024-02-06 15:05:15', '2024-02-06 15:05:15'),
(2, NULL, 'IODSON Men\'s Military Tactical Boots with Side Zipper, Puncture Resistant Work Boots, Army Jungle Boots', NULL, '04', 1, 588.0000, 588.0000, 588.0000, 588.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 4, 'Webkul\\Product\\Models\\Product', 2, 1, '{\"quantity\":1,\"product_id\":4,\"locale\":\"en\"}', '2024-02-06 15:05:15', '2024-02-06 15:05:15');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` text NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `locales`
--

CREATE TABLE `locales` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `direction` enum('ltr','rtl') NOT NULL DEFAULT 'ltr',
  `logo_path` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `locales`
--

INSERT INTO `locales` (`id`, `code`, `name`, `direction`, `logo_path`, `created_at`, `updated_at`) VALUES
(1, 'en', 'English', 'ltr', 'locales/en.svg', NULL, NULL),
(2, 'fr', 'French', 'ltr', 'locales/fr.png', NULL, NULL),
(3, 'nl', 'Dutch', 'ltr', 'locales/nl.png', NULL, NULL),
(4, 'tr', 'Türkçe', 'ltr', 'locales/tr.png', NULL, NULL),
(5, 'es', 'Español', 'ltr', 'locales/es.png', NULL, NULL),
(6, 'de', 'German', 'ltr', 'locales/de.png', NULL, NULL),
(7, 'it', 'Italian	', 'ltr', 'locales/it.png', NULL, NULL),
(8, 'ru', 'Russian', 'ltr', 'locales/ru.png', NULL, NULL),
(9, 'uk', 'Ukrainian', 'ltr', 'locales/uk.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `marketing_campaigns`
--

CREATE TABLE `marketing_campaigns` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(191) NOT NULL,
  `mail_to` varchar(191) NOT NULL,
  `spooling` varchar(191) DEFAULT NULL,
  `channel_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_group_id` int(10) UNSIGNED DEFAULT NULL,
  `marketing_template_id` int(10) UNSIGNED DEFAULT NULL,
  `marketing_event_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_events`
--

CREATE TABLE `marketing_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `marketing_events`
--

INSERT INTO `marketing_events` (`id`, `name`, `description`, `date`, `created_at`, `updated_at`) VALUES
(1, 'Birthday', 'Birthday', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `marketing_templates`
--

CREATE TABLE `marketing_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_admin_password_resets_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2018_06_12_111907_create_admins_table', 1),
(5, '2018_06_13_055341_create_roles_table', 1),
(6, '2018_07_05_130148_create_attributes_table', 1),
(7, '2018_07_05_132854_create_attribute_translations_table', 1),
(8, '2018_07_05_135150_create_attribute_families_table', 1),
(9, '2018_07_05_135152_create_attribute_groups_table', 1),
(10, '2018_07_05_140832_create_attribute_options_table', 1),
(11, '2018_07_05_140856_create_attribute_option_translations_table', 1),
(12, '2018_07_05_142820_create_categories_table', 1),
(13, '2018_07_10_055143_create_locales_table', 1),
(14, '2018_07_20_054426_create_countries_table', 1),
(15, '2018_07_20_054502_create_currencies_table', 1),
(16, '2018_07_20_054542_create_currency_exchange_rates_table', 1),
(17, '2018_07_20_064849_create_channels_table', 1),
(18, '2018_07_21_142836_create_category_translations_table', 1),
(19, '2018_07_23_110040_create_inventory_sources_table', 1),
(20, '2018_07_24_082635_create_customer_groups_table', 1),
(21, '2018_07_24_082930_create_customers_table', 1),
(22, '2018_07_27_065727_create_products_table', 1),
(23, '2018_07_27_070011_create_product_attribute_values_table', 1),
(24, '2018_07_27_092623_create_product_reviews_table', 1),
(25, '2018_07_27_113941_create_product_images_table', 1),
(26, '2018_07_27_113956_create_product_inventories_table', 1),
(27, '2018_08_30_064755_create_tax_categories_table', 1),
(28, '2018_08_30_065042_create_tax_rates_table', 1),
(29, '2018_08_30_065840_create_tax_mappings_table', 1),
(30, '2018_09_05_150444_create_cart_table', 1),
(31, '2018_09_05_150915_create_cart_items_table', 1),
(32, '2018_09_11_064045_customer_password_resets', 1),
(33, '2018_09_19_093453_create_cart_payment', 1),
(34, '2018_09_19_093508_create_cart_shipping_rates_table', 1),
(35, '2018_09_20_060658_create_core_config_table', 1),
(36, '2018_09_27_113154_create_orders_table', 1),
(37, '2018_09_27_113207_create_order_items_table', 1),
(38, '2018_09_27_115022_create_shipments_table', 1),
(39, '2018_09_27_115029_create_shipment_items_table', 1),
(40, '2018_09_27_115135_create_invoices_table', 1),
(41, '2018_09_27_115144_create_invoice_items_table', 1),
(42, '2018_10_01_095504_create_order_payment_table', 1),
(43, '2018_10_03_025230_create_wishlist_table', 1),
(44, '2018_10_12_101803_create_country_translations_table', 1),
(45, '2018_10_12_101913_create_country_states_table', 1),
(46, '2018_10_12_101923_create_country_state_translations_table', 1),
(47, '2018_11_16_173504_create_subscribers_list_table', 1),
(48, '2018_11_21_144411_create_cart_item_inventories_table', 1),
(49, '2018_12_06_185202_create_product_flat_table', 1),
(50, '2018_12_24_123812_create_channel_inventory_sources_table', 1),
(51, '2018_12_26_165327_create_product_ordered_inventories_table', 1),
(52, '2019_05_13_024321_create_cart_rules_table', 1),
(53, '2019_05_13_024322_create_cart_rule_channels_table', 1),
(54, '2019_05_13_024323_create_cart_rule_customer_groups_table', 1),
(55, '2019_05_13_024324_create_cart_rule_translations_table', 1),
(56, '2019_05_13_024325_create_cart_rule_customers_table', 1),
(57, '2019_05_13_024326_create_cart_rule_coupons_table', 1),
(58, '2019_05_13_024327_create_cart_rule_coupon_usage_table', 1),
(59, '2019_06_17_180258_create_product_downloadable_samples_table', 1),
(60, '2019_06_17_180314_create_product_downloadable_sample_translations_table', 1),
(61, '2019_06_17_180325_create_product_downloadable_links_table', 1),
(62, '2019_06_17_180346_create_product_downloadable_link_translations_table', 1),
(63, '2019_06_21_202249_create_downloadable_link_purchased_table', 1),
(64, '2019_07_30_153530_create_cms_pages_table', 1),
(65, '2019_07_31_143339_create_category_filterable_attributes_table', 1),
(66, '2019_08_02_105320_create_product_grouped_products_table', 1),
(67, '2019_08_20_170510_create_product_bundle_options_table', 1),
(68, '2019_08_20_170520_create_product_bundle_option_translations_table', 1),
(69, '2019_08_20_170528_create_product_bundle_option_products_table', 1),
(70, '2019_09_11_184511_create_refunds_table', 1),
(71, '2019_09_11_184519_create_refund_items_table', 1),
(72, '2019_12_03_184613_create_catalog_rules_table', 1),
(73, '2019_12_03_184651_create_catalog_rule_channels_table', 1),
(74, '2019_12_03_184732_create_catalog_rule_customer_groups_table', 1),
(75, '2019_12_06_101110_create_catalog_rule_products_table', 1),
(76, '2019_12_06_110507_create_catalog_rule_product_prices_table', 1),
(77, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(78, '2020_01_14_191854_create_cms_page_translations_table', 1),
(79, '2020_01_15_130209_create_cms_page_channels_table', 1),
(80, '2020_04_16_185147_add_table_addresses', 1),
(81, '2020_05_06_171638_create_order_comments_table', 1),
(82, '2020_05_21_171500_create_product_customer_group_prices_table', 1),
(83, '2020_06_25_162154_create_customer_social_accounts_table', 1),
(84, '2020_11_19_112228_create_product_videos_table', 1),
(85, '2020_11_26_141455_create_marketing_templates_table', 1),
(86, '2020_11_26_150534_create_marketing_events_table', 1),
(87, '2020_11_26_150644_create_marketing_campaigns_table', 1),
(88, '2020_12_21_000200_create_channel_translations_table', 1),
(89, '2020_12_27_121950_create_jobs_table', 1),
(90, '2021_03_11_212124_create_order_transactions_table', 1),
(91, '2021_04_07_132010_create_product_review_images_table', 1),
(92, '2021_12_15_104544_notifications', 1),
(93, '2022_03_15_160510_create_failed_jobs_table', 1),
(94, '2022_04_01_094622_create_sitemaps_table', 1),
(95, '2022_10_03_144232_create_product_price_indices_table', 1),
(96, '2022_10_04_144444_create_job_batches_table', 1),
(97, '2022_10_08_134150_create_product_inventory_indices_table', 1),
(98, '2023_05_26_213105_create_wishlist_items_table', 1),
(99, '2023_05_26_213120_create_compare_items_table', 1),
(100, '2023_06_27_163529_rename_product_review_images_to_product_review_attachments', 1),
(101, '2023_07_06_140013_add_logo_path_column_to_locales', 1),
(102, '2023_07_10_184256_create_theme_customizations_table', 1),
(103, '2023_07_12_181722_remove_home_page_and_footer_content_column_from_channel_translations_table', 1),
(104, '2023_07_20_185324_add_column_column_in_attribute_groups_table', 1),
(105, '2023_07_25_145943_add_regex_column_in_attributes_table', 1),
(106, '2023_07_25_165945_drop_notes_column_from_customers_table', 1),
(107, '2023_07_25_171058_create_customer_notes_table', 1),
(108, '2023_07_31_125232_rename_image_and_category_banner_columns_from_categories_table', 1),
(109, '2023_09_15_170053_create_theme_customization_translations_table', 1),
(110, '2023_09_20_102031_add_default_value_column_in_attributes_table', 1),
(111, '2023_09_20_102635_add_inventories_group_in_attribute_groups_table', 1),
(112, '2023_10_05_163612_create_visits_table', 1),
(113, '2023_10_12_090446_add_tax_category_id_column_in_order_items_table', 1),
(114, '2024_02_15_170136_add_additional_fields_to_customers_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `read`, `order_id`, `created_at`, `updated_at`) VALUES
(1, 'order', 1, 1, '2024-02-06 14:46:43', '2024-02-06 14:58:11');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `increment_id` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `channel_name` varchar(191) DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(191) DEFAULT NULL,
  `customer_first_name` varchar(191) DEFAULT NULL,
  `customer_last_name` varchar(191) DEFAULT NULL,
  `shipping_method` varchar(191) DEFAULT NULL,
  `shipping_title` varchar(191) DEFAULT NULL,
  `shipping_description` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT 0,
  `total_item_count` int(11) DEFAULT NULL,
  `total_qty_ordered` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) DEFAULT NULL,
  `channel_currency_code` varchar(191) DEFAULT NULL,
  `order_currency_code` varchar(191) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `grand_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `grand_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `sub_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `sub_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_invoiced` decimal(12,4) DEFAULT 0.0000,
  `shipping_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_refunded` decimal(12,4) DEFAULT 0.0000,
  `shipping_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_type` varchar(191) DEFAULT NULL,
  `channel_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_type` varchar(191) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `increment_id`, `status`, `channel_name`, `is_guest`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `shipping_title`, `shipping_description`, `coupon_code`, `is_gift`, `total_item_count`, `total_qty_ordered`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `grand_total`, `base_grand_total`, `grand_total_invoiced`, `base_grand_total_invoiced`, `grand_total_refunded`, `base_grand_total_refunded`, `sub_total`, `base_sub_total`, `sub_total_invoiced`, `base_sub_total_invoiced`, `sub_total_refunded`, `base_sub_total_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `shipping_amount`, `base_shipping_amount`, `shipping_invoiced`, `base_shipping_invoiced`, `shipping_refunded`, `base_shipping_refunded`, `shipping_discount_amount`, `base_shipping_discount_amount`, `customer_id`, `customer_type`, `channel_id`, `channel_type`, `cart_id`, `applied_cart_rule_ids`, `created_at`, `updated_at`) VALUES
(1, '1', 'completed', 'Default', 0, 'user@example.com', 'Isaac', 'Kyeremeh', 'flatrate_flatrate', 'Flat Rate - Flat Rate', 'Flat Rate Shipping', NULL, 0, 2, 2, 'GHS', 'GHS', 'GHS', 1278.0000, 1278.0000, 1278.0000, 1278.0000, 0.0000, 0.0000, 1258.0000, 1258.0000, 1258.0000, 1258.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, 2, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', 1, NULL, '2024-02-06 14:46:35', '2024-02-06 15:11:14');

-- --------------------------------------------------------

--
-- Table structure for table `order_comments`
--

CREATE TABLE `order_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `comment` text NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `order_comments`
--

INSERT INTO `order_comments` (`id`, `order_id`, `comment`, `customer_notified`, `created_at`, `updated_at`) VALUES
(1, 1, 'payment has not been received', 1, '2024-02-06 14:54:50', '2024-02-06 14:54:50');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT 0.0000,
  `total_weight` decimal(12,4) DEFAULT 0.0000,
  `qty_ordered` int(11) DEFAULT 0,
  `qty_shipped` int(11) DEFAULT 0,
  `qty_invoiced` int(11) DEFAULT 0,
  `qty_canceled` int(11) DEFAULT 0,
  `qty_refunded` int(11) DEFAULT 0,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `tax_percent` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_category_id` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `qty_ordered`, `qty_shipped`, `qty_invoiced`, `qty_canceled`, `qty_refunded`, `price`, `base_price`, `total`, `base_total`, `total_invoiced`, `base_total_invoiced`, `amount_refunded`, `base_amount_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_percent`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `product_id`, `product_type`, `order_id`, `tax_category_id`, `parent_id`, `additional`, `created_at`, `updated_at`) VALUES
(1, '01', 'simple', 'BACKBONE Mens Army Military Battle Dress Uniform BDU Shirt Camo Top Jacket', NULL, 1.3200, 1.3200, 1, 1, 1, 0, 0, 670.0000, 670.0000, 670.0000, 670.0000, 670.0000, 670.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, '{\"quantity\":1,\"product_id\":1,\"locale\":\"en\"}', '2024-02-06 14:46:35', '2024-02-06 15:11:14'),
(2, '04', 'simple', 'IODSON Men\'s Military Tactical Boots with Side Zipper, Puncture Resistant Work Boots, Army Jungle Boots', NULL, 2.2000, 2.2000, 1, 1, 1, 0, 0, 588.0000, 588.0000, 588.0000, 588.0000, 588.0000, 588.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 4, 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, '{\"quantity\":1,\"product_id\":4,\"locale\":\"en\"}', '2024-02-06 14:46:35', '2024-02-06 15:11:14');

-- --------------------------------------------------------

--
-- Table structure for table `order_payment`
--

CREATE TABLE `order_payment` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `method` varchar(191) NOT NULL,
  `method_title` varchar(191) DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `order_payment`
--

INSERT INTO `order_payment` (`id`, `order_id`, `method`, `method_title`, `additional`, `created_at`, `updated_at`) VALUES
(1, 1, 'moneytransfer', 'Money Transfer', NULL, '2024-02-06 14:46:35', '2024-02-06 14:46:35');

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `amount` decimal(12,4) DEFAULT 0.0000,
  `payment_method` varchar(191) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `attribute_family_id` int(10) UNSIGNED DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `type`, `parent_id`, `attribute_family_id`, `additional`, `created_at`, `updated_at`) VALUES
(1, '01', 'simple', NULL, 1, NULL, '2024-01-30 06:07:58', '2024-01-30 06:07:58'),
(2, '02', 'simple', NULL, 1, NULL, '2024-01-30 18:38:02', '2024-01-30 18:38:02'),
(3, '03', 'simple', NULL, 1, NULL, '2024-01-30 19:01:44', '2024-01-30 19:01:44'),
(4, '04', 'simple', NULL, 1, NULL, '2024-01-31 13:00:01', '2024-01-31 13:00:01'),
(5, '05', 'simple', NULL, 1, NULL, '2024-01-31 13:34:52', '2024-01-31 13:34:52'),
(6, '06', 'simple', NULL, 1, NULL, '2024-01-31 13:53:37', '2024-01-31 13:53:37'),
(7, '07', 'simple', 7, 1, NULL, '2024-02-06 15:32:10', '2024-02-06 15:32:10'),
(9, '08', 'simple', NULL, 1, NULL, '2024-02-09 18:54:45', '2024-02-09 18:54:45'),
(10, '010', 'simple', NULL, 1, NULL, '2024-02-13 17:30:18', '2024-02-13 17:44:41');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute_values`
--

CREATE TABLE `product_attribute_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) DEFAULT NULL,
  `channel` varchar(191) DEFAULT NULL,
  `text_value` text DEFAULT NULL,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int(11) DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_value`)),
  `product_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_attribute_values`
--

INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`) VALUES
(1, 'en', 'default', 'Experience style, comfort, and the perfect fit with our Cotton/Polyester Twill Woven Fabric Shirt.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 9),
(2, 'en', 'default', 'Cotton / Polyester Twill Woven Fabric, Four large button pockets with flaps, Cuff with an adjustable tab and buttons, Please kindly check the sizes and measurements below before your purchase. This Shirt is quite big; please kindly check size table before you buy. Please note: The chest measurement is made from 1 inch down from the armpits. Size S : Chest = 46 inches (116cm), Length = 29.5 inches (75cm); Size M : Chest = 48 inches (122cm), Length = 30 inches (76.5cm); Size L : Chest = 52 inches (132cm), Length = 30 inches (76.5cm); Size XL : Chest = 58 inches (147cm), Length = 30.5 inches (77.5cm); Size 2XL : Chest = 60 inches (152cm), Length = 31 inches (78.5cm);', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10),
(3, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(4, 'en', 'default', 'BACKBONE Mens Army Military Battle Dress Uniform BDU Shirt Camo Top Jacket', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2),
(5, NULL, NULL, 'backbone-mens-army-military-battle-dress-uniform-bdu-shirt-camo-top-jacket', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3),
(6, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 1, 23),
(7, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, 1, 24),
(8, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL, NULL, 1, 27),
(9, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 28),
(10, 'en', 'default', 'BACKBONE Men\'s Army Military BDU Shirt - Camo Battle Dress Uniform Top Jacket', NULL, NULL, NULL, NULL, NULL, NULL, 1, 16),
(11, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 17),
(12, 'en', 'default', 'Explore rugged style with BACKBONE\'s Men\'s Army Military BDU Shirt. This camo battle dress uniform top jacket combines durability and versatility, making it the ideal choice for tactical enthusiasts. Elevate your outdoor wardrobe with this essential piece designed for both function and fashion.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 18),
(13, NULL, NULL, NULL, NULL, NULL, 694.0000, NULL, NULL, NULL, 1, 11),
(14, NULL, 'default', NULL, NULL, NULL, 650.0000, NULL, NULL, NULL, 1, 12),
(15, NULL, NULL, NULL, NULL, NULL, 670.0000, NULL, NULL, NULL, 1, 13),
(16, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2024-01-30', NULL, 1, 14),
(17, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2024-03-06', NULL, 1, 15),
(18, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 5),
(19, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 6),
(20, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 7),
(21, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 8),
(22, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 26),
(23, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 19),
(24, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 20),
(25, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 21),
(26, NULL, NULL, '1.32', NULL, NULL, NULL, NULL, NULL, NULL, 1, 22),
(27, 'en', 'default', '\"CARWORNIC Combat Shirt: Durable, comfortable, and high-performance. Made with tear-resistant rip-stop fabric, featuring a slim-fit design for breathability and quick-dry. Two arm pockets for convenient storage during combat or outdoor activities. Elevate your tactical gear with this essential.\"', NULL, NULL, NULL, NULL, NULL, NULL, 2, 9),
(28, 'en', 'default', 'The Carwornic combat shirt is a durable and comfortable tactical top. The sleeve is made of 65% polyester + 35% cotton, tear-resistance rip-stop fabric; the torso is made of elastic cotton, slim fit your body and keep breathable, lightweight, and quick dry. It will be wonderful to stay comfortable under your tactical vest or plate carrier. Two arm pockets make it easy to carry the phone and EDC tools during combat or other outdoor activities. It’s a high-performance tactical shirt.', NULL, NULL, NULL, NULL, NULL, NULL, 2, 10),
(29, NULL, NULL, '02', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(30, 'en', 'default', 'CARWORNIC Men\'s Tactical Combat Shirt, 1/4 Zipper Long Sleeve Camo Army Military T Shirt', NULL, NULL, NULL, NULL, NULL, NULL, 2, 2),
(31, NULL, NULL, 'carwornic-mens-tactical-combat-shirt-14-zipper-long-sleeve-camo-army-military-t-shirt', NULL, NULL, NULL, NULL, NULL, NULL, 2, 3),
(32, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, 2, 23),
(33, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, 2, 24),
(34, NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, 2, 27),
(35, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 28),
(36, 'en', 'default', 'CARWORNIC Combat Shirt: Durable & Comfortable Tactical Wear for Outdoor Enthusiasts', NULL, NULL, NULL, NULL, NULL, NULL, 2, 16),
(37, 'en', 'default', 'Uniform', NULL, NULL, NULL, NULL, NULL, NULL, 2, 17),
(38, 'en', 'default', '\"CARWORNIC Combat Shirt: Durable, slim-fit tactical wear for ultimate outdoor comfort. Breathable, quick-dry fabric with convenient arm pockets. Upgrade your adventure now!\"', NULL, NULL, NULL, NULL, NULL, NULL, 2, 18),
(39, NULL, NULL, NULL, NULL, NULL, 420.0000, NULL, NULL, NULL, 2, 11),
(40, NULL, 'default', NULL, NULL, NULL, 390.0000, NULL, NULL, NULL, 2, 12),
(41, NULL, NULL, NULL, NULL, NULL, 410.0000, NULL, NULL, NULL, 2, 13),
(42, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2024-01-30', NULL, 2, 14),
(43, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2024-02-06', NULL, 2, 15),
(44, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 5),
(45, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 6),
(46, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 7),
(47, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 8),
(48, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 26),
(49, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 2, 19),
(50, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 2, 20),
(51, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 2, 21),
(52, NULL, NULL, '1.32', NULL, NULL, NULL, NULL, NULL, NULL, 2, 22),
(53, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, 2, 25),
(54, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 1, 25),
(55, 'en', 'default', 'Carwornic Combat Shirt: Durable, comfortable, and high-performance. Made with tear-resistant rip-stop fabric, featuring a slim-fit design for breathability and quick-dry. Two arm pockets for convenient storage during combat or outdoor activities. Elevate your tactical gear with this essential', NULL, NULL, NULL, NULL, NULL, NULL, 3, 9),
(56, 'en', 'default', 'The Carwornic combat shirt is a durable and comfortable tactical top. The sleeve is made of 65% polyester + 35% cotton, tear-resistance rip-stop fabric; the torso is made of elastic cotton, slim fit your body and keep breathable, lightweight, and quick dry. It will be wonderful to stay comfortable under your tactical vest or plate carrier. Two arm pockets make it easy to carry the phone and EDC tools during combat or other outdoor activities. It’s a high-performance tactical shirt.', NULL, NULL, NULL, NULL, NULL, NULL, 3, 10),
(57, NULL, NULL, '03', NULL, NULL, NULL, NULL, NULL, NULL, 3, 1),
(58, 'en', 'default', 'CARWORNIC Men\'s Tactical Combat Shirt, 1/4 Zipper Long Sleeve Camo Army Military T Shirt 2#Cp', NULL, NULL, NULL, NULL, NULL, NULL, 3, 2),
(59, NULL, NULL, 'carwornic-mens-tactical-combat-shirt-14-zipper-long-sleeve-camo-army-military-t-shirt-2cp', NULL, NULL, NULL, NULL, NULL, NULL, 3, 3),
(60, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, 3, 23),
(61, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, 3, 24),
(62, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, 3, 25),
(63, NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, 3, 27),
(64, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 28),
(65, 'en', 'default', 'CARWORNIC Combat Shirt: Durable & Comfortable Tactical Wear for Outdoor Enthusiasts', NULL, NULL, NULL, NULL, NULL, NULL, 3, 16),
(66, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 3, 17),
(67, 'en', 'default', 'CARWORNIC Combat Shirt: Durable, slim-fit tactical wear for ultimate outdoor comfort. Breathable, quick-dry fabric with two arm pockets for easy storage. Upgrade your adventure now!', NULL, NULL, NULL, NULL, NULL, NULL, 3, 18),
(68, NULL, NULL, NULL, NULL, NULL, 425.0000, NULL, NULL, NULL, 3, 11),
(69, NULL, 'default', NULL, NULL, NULL, 415.0000, NULL, NULL, NULL, 3, 12),
(70, NULL, NULL, NULL, NULL, NULL, 400.0000, NULL, NULL, NULL, 3, 13),
(71, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2024-01-30', NULL, 3, 14),
(72, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2024-02-06', NULL, 3, 15),
(73, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 5),
(74, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3, 6),
(75, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 7),
(76, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 8),
(77, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 26),
(78, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 3, 19),
(79, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 3, 20),
(80, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 3, 21),
(81, NULL, NULL, '1.32', NULL, NULL, NULL, NULL, NULL, NULL, 3, 22),
(82, 'en', 'default', 'IODSON Men\'s Military Tactical Boots with Side Zipper, Puncture Resistant Work Boots, Desert Combat Boots, Army Jungle Boots, 8 Inches Lightweight Hiking Boots', NULL, NULL, NULL, NULL, NULL, NULL, 4, 9),
(83, 'en', 'default', 'Anti-dust design\r\nThe military boot uses a one-piece tongue design to prevent dust from entering your boots.\r\n\r\nLightweight\r\nWear a pair of lightweight and comfortable boots so that you will not feel tired from long-distance travel\r\n\r\nYKK zipper\r\nThe side zipper is upgraded to YKK zipper, which is more smooth and durable.', NULL, NULL, NULL, NULL, NULL, NULL, 4, 10),
(84, NULL, NULL, '04', NULL, NULL, NULL, NULL, NULL, NULL, 4, 1),
(85, 'en', 'default', 'IODSON Men\'s Military Tactical Boots with Side Zipper, Puncture Resistant Work Boots, Army Jungle Boots', NULL, NULL, NULL, NULL, NULL, NULL, 4, 2),
(86, NULL, NULL, 'iodson-mens-military-tactical-boots-with-side-zipper-puncture-resistant-work-boots-army-jungle-boots', NULL, NULL, NULL, NULL, NULL, NULL, 4, 3),
(87, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, 4, 23),
(88, NULL, NULL, '4', NULL, NULL, NULL, NULL, NULL, NULL, 4, 27),
(89, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 28),
(90, 'en', 'default', 'Military Tactical Boots', NULL, NULL, NULL, NULL, NULL, NULL, 4, 16),
(91, 'en', 'default', 'boots', NULL, NULL, NULL, NULL, NULL, NULL, 4, 17),
(92, 'en', 'default', 'IODSON Men\'s Military Tactical Boots with Side Zipper, Puncture Resistant Work Boots, Army Jungle Boots', NULL, NULL, NULL, NULL, NULL, NULL, 4, 18),
(93, NULL, NULL, NULL, NULL, NULL, 598.0000, NULL, NULL, NULL, 4, 11),
(94, NULL, 'default', NULL, NULL, NULL, 578.0000, NULL, NULL, NULL, 4, 12),
(95, NULL, NULL, NULL, NULL, NULL, 588.0000, NULL, NULL, NULL, 4, 13),
(96, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2024-01-31', NULL, 4, 14),
(97, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2024-02-06', NULL, 4, 15),
(98, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 5),
(99, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 6),
(100, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 7),
(101, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 8),
(102, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 26),
(103, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 19),
(104, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 20),
(105, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 21),
(106, NULL, NULL, '2.2', NULL, NULL, NULL, NULL, NULL, NULL, 4, 22),
(107, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, 4, 25),
(108, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, 4, 24),
(109, 'en', 'default', 'IODSON Men\'s Military Tactical Boots with Side Zipper, Puncture Resistant Work Boots, Desert Combat Boots, Army Jungle Boots, 8 Inches Lightweight Hiking Boots', NULL, NULL, NULL, NULL, NULL, NULL, 5, 9),
(110, 'en', 'default', 'Anti-dust design\r\nThe military boot uses a one-piece tongue design to prevent dust from entering your boots.\r\n\r\nLightweight\r\nWear a pair of lightweight and comfortable boots so that you will not feel tired from long-distance travel\r\n\r\nYKK zipper\r\nThe side zipper is upgraded to YKK zipper, which is more smooth and durable.', NULL, NULL, NULL, NULL, NULL, NULL, 5, 10),
(111, NULL, NULL, '05', NULL, NULL, NULL, NULL, NULL, NULL, 5, 1),
(112, 'en', 'default', 'IODSON Black Men\'s Military Tactical Boots with Side Zipper, Resistant Work Boots, Army Jungle Boots', NULL, NULL, NULL, NULL, NULL, NULL, 5, 2),
(113, NULL, NULL, 'iodson-black-mens-military-tactical-boots-with-side-zipper-resistant-work-boots-army-jungle-boots', NULL, NULL, NULL, NULL, NULL, NULL, 5, 3),
(114, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 5, 23),
(115, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, 5, 24),
(116, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, 5, 25),
(117, NULL, NULL, '5', NULL, NULL, NULL, NULL, NULL, NULL, 5, 27),
(118, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 28),
(119, 'en', 'default', 'Military Tactical Boots', NULL, NULL, NULL, NULL, NULL, NULL, 5, 16),
(120, 'en', 'default', 'boots', NULL, NULL, NULL, NULL, NULL, NULL, 5, 17),
(121, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 5, 18),
(122, NULL, NULL, NULL, NULL, NULL, 598.0000, NULL, NULL, NULL, 5, 11),
(123, NULL, 'default', NULL, NULL, NULL, 578.0000, NULL, NULL, NULL, 5, 12),
(124, NULL, NULL, NULL, NULL, NULL, 589.0000, NULL, NULL, NULL, 5, 13),
(125, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2024-01-31', NULL, 5, 14),
(126, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2024-02-06', NULL, 5, 15),
(127, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 5),
(128, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 5, 6),
(129, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 7),
(130, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 8),
(131, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 26),
(132, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 5, 19),
(133, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 5, 20),
(134, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 5, 21),
(135, NULL, NULL, '2.2', NULL, NULL, NULL, NULL, NULL, NULL, 5, 22),
(136, 'en', 'default', 'Ultimate Tactical Boots for Combat, Work and Adventure', NULL, NULL, NULL, NULL, NULL, NULL, 6, 9),
(137, 'en', 'default', 'Ultimate Tactical Boots for Combat, Work and Adventure\r\n\r\nEngineered for specialized units and demanding operations, these tactical boots provide the lightweight durability, protection and performance needed to overcome any challenge.\r\n\r\nBuilt Tactical Tough for the Most Demanding Missions\r\n\r\nConstructed from premium leather and oxford, these tactical boots are designed to withstand the punishing conditions of desert and jungle. Reinforced toe cap shield against injury, while lace-up fronts with durable side zippers allow for a secured custom fit that can be quickly donned and doffed. Puncture-resistant midsoles and slip-resistant outsoles grip rocky, uneven terrain with ease. For military, security and special forces personnel, these rugged yet featherlight boots are ready for rapid response.\r\n\r\nLightweight and Lethally Agile\r\n\r\nRemarkably lightweight yet highly protective, these boots weigh only 1 pound per shoe for agile, fatigue-free movement. The flexible midsoles and cushioned insoles provide shock absorption and comfort for traversing long distances, while the integrated tongue prevents debris from entering the boots.\r\n\r\nBuilt for the Toughest Working Conditions\r\n\r\nWhen work takes you off the beaten path, into hazardous areas or requires extensive time on your feet, these tactical boots provide the safety, durability and comfort needed to get the job done. The rugged yet comfortable design allows utility workers, contractors, first responders and others to remain steadily on task for hours.\r\n\r\nRugged Enough for the Great Outdoors\r\n\r\nFor hiking, hunting and other activities where sturdy footwear is a must, these tactical boots offer durable construction, premium comfort and high performance. Whether venturing into remote backcountry or tackling challenging trails, these boots provide the protection and reliability to get you there and back again.', NULL, NULL, NULL, NULL, NULL, NULL, 6, 10),
(138, NULL, NULL, '06', NULL, NULL, NULL, NULL, NULL, NULL, 6, 1),
(139, 'en', 'default', 'RIELD Men\'s Military Tactical Work Boots Lightweight Side Zipper Army Combat Hiking Boots', NULL, NULL, NULL, NULL, NULL, NULL, 6, 2),
(140, NULL, NULL, 'rield-mens-military-tactical-work-boots-lightweight-side-zipper-army-combat-hiking-boots', NULL, NULL, NULL, NULL, NULL, NULL, 6, 3),
(141, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, 6, 23),
(142, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, 6, 24),
(143, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, 6, 25),
(144, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, NULL, 6, 27),
(145, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 28),
(146, 'en', 'default', 'RIELD Men\'s Military Tactical Work Boots', NULL, NULL, NULL, NULL, NULL, NULL, 6, 16),
(147, 'en', 'default', 'Boots', NULL, NULL, NULL, NULL, NULL, NULL, 6, 17),
(148, 'en', 'default', 'Ultimate Tactical Boots for Combat, Work and Adventure', NULL, NULL, NULL, NULL, NULL, NULL, 6, 18),
(149, NULL, NULL, NULL, NULL, NULL, 598.0000, NULL, NULL, NULL, 6, 11),
(150, NULL, 'default', NULL, NULL, NULL, 578.0000, NULL, NULL, NULL, 6, 12),
(151, NULL, NULL, NULL, NULL, NULL, 588.0000, NULL, NULL, NULL, 6, 13),
(152, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2024-01-31', NULL, 6, 14),
(153, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2024-02-06', NULL, 6, 15),
(154, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 5),
(155, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 6, 6),
(156, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 7),
(157, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 8),
(158, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 26),
(159, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 19),
(160, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 20),
(161, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 21),
(162, NULL, NULL, '2.2', NULL, NULL, NULL, NULL, NULL, NULL, 6, 22),
(163, 'en', 'default', 'MILITARY TACTICAL 65% POLYESTER 35% COTTON CAMOUFLGE ACU UNIFORM', NULL, NULL, NULL, NULL, NULL, NULL, 7, 9),
(164, 'en', 'default', 'Fabric: TC 35% cotton and 65% polyester, 210GSM is the best composition and thickness, suitable for the soldier\'s daily training in the woods and fields. Besides, you can customize the fabric according to your needs.\r\n\r\nExcellent craftsmanship and quality can meet all test requirements, such as color fastness, breaking strength, tensile strength, etc.\r\n\r\nFabric: TC 35% cotton and 65% polyester, 210GSM is the best composition and thickness, suitable for the soldier\'s daily training in the woods and fields. Besides, you can customize the fabric according to your needs.\r\n\r\nExcellent craftsmanship and quality can meet all test requirements, such as color fastness, breaking strength, tensile strength, etc.', NULL, NULL, NULL, NULL, NULL, NULL, 7, 10),
(165, NULL, NULL, '07', NULL, NULL, NULL, NULL, NULL, NULL, 7, 1),
(166, 'en', 'default', 'Military Army Tactical', NULL, NULL, NULL, NULL, NULL, NULL, 7, 2),
(167, NULL, NULL, 'military-army-tactical-', NULL, NULL, NULL, NULL, NULL, NULL, 7, 3),
(168, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, 7, 23),
(169, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, 7, 24),
(170, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 7, 25),
(171, NULL, NULL, '7', NULL, NULL, NULL, NULL, NULL, NULL, 7, 27),
(172, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 28),
(173, 'en', 'default', 'Military Army Tactical', NULL, NULL, NULL, NULL, NULL, NULL, 7, 16),
(174, 'en', 'default', 'tactical', NULL, NULL, NULL, NULL, NULL, NULL, 7, 17),
(175, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 18),
(176, NULL, NULL, NULL, NULL, NULL, 750.0000, NULL, NULL, NULL, 7, 11),
(177, NULL, 'default', NULL, NULL, NULL, 730.0000, NULL, NULL, NULL, 7, 12),
(178, NULL, NULL, NULL, NULL, NULL, 740.0000, NULL, NULL, NULL, 7, 13),
(179, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2024-02-06', NULL, 7, 14),
(180, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2024-03-06', NULL, 7, 15),
(181, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 5),
(182, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 7, 6),
(183, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 7),
(184, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 8),
(185, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 26),
(186, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 19),
(187, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 20),
(188, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 21),
(189, NULL, NULL, '2.2', NULL, NULL, NULL, NULL, NULL, NULL, 7, 22),
(215, 'en', 'default', 'Arguably the most well-recognized name in pistols, the Glock 17 is known the world over for it\'s reliability, shoot-ability and ruggedness.', NULL, NULL, NULL, NULL, NULL, NULL, 9, 9),
(216, 'en', 'default', 'Arguably the most well-recognized name in pistols, the Glock 17 is known the world over for it\'s reliability, shoot-ability and ruggedness. The Gen4 variant is one of the most popular versions, featuring different grip texturing and a larger magazine release. Umarex unleashes this blowback replica, giving Gen4 fans everywhere something to cheer about. With authentic controls and a full metal, drop-free magazine, the Gen4 17 handles just like the real steel version. This version comes with three different interchangeable backstraps, allowing for a more custom fit based on your hand size.\r\n\r\nGlock 17 Gen 4 Features:\r\nBlowback Action\r\nAuthentic Replica with realistic controls\r\nTraditional fixed Glock sights\r\nFull Metal Slide\r\nMetal 18-round drop-free magazine\r\nRuns on one 12-gram CO2 capsule\r\nFits most aftermarket duty holsters\r\nIncludes small, medium, and large backstraps', NULL, NULL, NULL, NULL, NULL, NULL, 9, 10),
(217, NULL, NULL, '08', NULL, NULL, NULL, NULL, NULL, NULL, 9, 1),
(218, 'en', 'default', 'Glock 17 Gen. 4 BB Pistol', NULL, NULL, NULL, NULL, NULL, NULL, 9, 2),
(219, NULL, NULL, 'glock-17-gen-4-bb-pistol', NULL, NULL, NULL, NULL, NULL, NULL, 9, 3),
(220, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, 9, 23),
(221, NULL, NULL, '8', NULL, NULL, NULL, NULL, NULL, NULL, 9, 27),
(222, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 28),
(223, 'en', 'default', 'Glock 17 Gen. 4 BB Pistol', NULL, NULL, NULL, NULL, NULL, NULL, 9, 16),
(224, 'en', 'default', 'pistol', NULL, NULL, NULL, NULL, NULL, NULL, 9, 17),
(225, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 18),
(226, NULL, NULL, NULL, NULL, NULL, 640.0000, NULL, NULL, NULL, 9, 11),
(227, NULL, 'default', NULL, NULL, NULL, 625.0000, NULL, NULL, NULL, 9, 12),
(228, NULL, NULL, NULL, NULL, NULL, 635.0000, NULL, NULL, NULL, 9, 13),
(229, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2024-02-09', NULL, 9, 14),
(230, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2024-03-06', NULL, 9, 15),
(231, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 5),
(232, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 9, 6),
(233, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 7),
(234, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 8),
(235, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 26),
(236, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 19),
(237, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 20),
(238, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 21),
(239, NULL, NULL, '2.2', NULL, NULL, NULL, NULL, NULL, NULL, 9, 22),
(240, 'en', 'default', 'H&K USP Pistol', NULL, NULL, NULL, NULL, NULL, NULL, 10, 9),
(241, 'en', 'default', 'H&K USP Pistol\r\nCO2-powered\r\nUses one 12-gram CO2 cartridge\r\nShoots steel BBs\r\n22-shot removable BB mag also holds CO2 cartridge\r\nDouble-action only\r\nFixed front and rear sights\r\nIntegrated Weaver accessory rail under the barrel (no Picatinny slots)\r\nRealistic hammer movement\r\nNever shoot steel BBs at hard objects', NULL, NULL, NULL, NULL, NULL, NULL, 10, 10),
(242, NULL, NULL, '010', NULL, NULL, NULL, NULL, NULL, NULL, 10, 1),
(243, 'en', 'default', 'H&K USP BB Pistol', NULL, NULL, NULL, NULL, NULL, NULL, 10, 2),
(244, NULL, NULL, 'hk-usp-bb-pistol', NULL, NULL, NULL, NULL, NULL, NULL, 10, 3),
(245, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL, 10, 23),
(246, NULL, NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, 10, 27),
(247, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 28),
(248, 'en', 'default', 'H&K USP Pistol', NULL, NULL, NULL, NULL, NULL, NULL, 10, 16),
(249, 'en', 'default', 'Pistol', NULL, NULL, NULL, NULL, NULL, NULL, 10, 17),
(250, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 10, 18),
(251, NULL, NULL, NULL, NULL, NULL, 650.0000, NULL, NULL, NULL, 10, 11),
(252, NULL, 'default', NULL, NULL, NULL, 620.0000, NULL, NULL, NULL, 10, 12),
(253, NULL, NULL, NULL, NULL, NULL, 640.0000, NULL, NULL, NULL, 10, 13),
(254, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2024-02-13', NULL, 10, 14),
(255, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2024-03-06', NULL, 10, 15),
(256, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 5),
(257, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 10, 6),
(258, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 7),
(259, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 8),
(260, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 26),
(261, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 10, 19),
(262, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 10, 20),
(263, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 10, 21),
(264, NULL, NULL, '1.35', NULL, NULL, NULL, NULL, NULL, NULL, 10, 22);

-- --------------------------------------------------------

--
-- Table structure for table `product_bundle_options`
--

CREATE TABLE `product_bundle_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_bundle_option_products`
--

CREATE TABLE `product_bundle_option_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_bundle_option_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_bundle_option_translations`
--

CREATE TABLE `product_bundle_option_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `label` text DEFAULT NULL,
  `product_bundle_option_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`product_id`, `category_id`) VALUES
(1, 8),
(1, 7),
(2, 7),
(2, 8),
(3, 7),
(3, 8),
(4, 7),
(4, 11),
(5, 7),
(5, 11),
(6, 7),
(6, 11),
(7, 7),
(7, 10),
(9, 18),
(9, 19),
(10, 18),
(10, 19);

-- --------------------------------------------------------

--
-- Table structure for table `product_cross_sells`
--

CREATE TABLE `product_cross_sells` (
  `parent_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_customer_group_prices`
--

CREATE TABLE `product_customer_group_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `value_type` varchar(191) NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_downloadable_links`
--

CREATE TABLE `product_downloadable_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sample_url` varchar(191) DEFAULT NULL,
  `sample_file` varchar(191) DEFAULT NULL,
  `sample_file_name` varchar(191) DEFAULT NULL,
  `sample_type` varchar(191) DEFAULT NULL,
  `downloads` int(11) NOT NULL DEFAULT 0,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_downloadable_link_translations`
--

CREATE TABLE `product_downloadable_link_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_downloadable_link_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_downloadable_samples`
--

CREATE TABLE `product_downloadable_samples` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_downloadable_sample_translations`
--

CREATE TABLE `product_downloadable_sample_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_downloadable_sample_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_flat`
--

CREATE TABLE `product_flat` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(191) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `product_number` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url_key` varchar(191) DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(191) DEFAULT NULL,
  `channel` varchar(191) DEFAULT NULL,
  `attribute_family_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_flat`
--

INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES
(1, '01', 'simple', '01', 'BACKBONE Mens Army Military Battle Dress Uniform BDU Shirt Camo Top Jacket', 'Experience style, comfort, and the perfect fit with our Cotton/Polyester Twill Woven Fabric Shirt.', 'Cotton / Polyester Twill Woven Fabric, Four large button pockets with flaps, Cuff with an adjustable tab and buttons, Please kindly check the sizes and measurements below before your purchase. This Shirt is quite big; please kindly check size table before you buy. Please note: The chest measurement is made from 1 inch down from the armpits. Size S : Chest = 46 inches (116cm), Length = 29.5 inches (75cm); Size M : Chest = 48 inches (122cm), Length = 30 inches (76.5cm); Size L : Chest = 52 inches (132cm), Length = 30 inches (76.5cm); Size XL : Chest = 58 inches (147cm), Length = 30.5 inches (77.5cm); Size 2XL : Chest = 60 inches (152cm), Length = 31 inches (78.5cm);', 'backbone-mens-army-military-battle-dress-uniform-bdu-shirt-camo-top-jacket', 1, 0, 1, 'BACKBONE Men\'s Army Military BDU Shirt - Camo Battle Dress Uniform Top Jacket', '', 'Explore rugged style with BACKBONE\'s Men\'s Army Military BDU Shirt. This camo battle dress uniform top jacket combines durability and versatility, making it the ideal choice for tactical enthusiasts. Elevate your outdoor wardrobe with this essential piece designed for both function and fashion.', 694.0000, 670.0000, '2024-01-30', '2024-03-06', 1.3200, '2024-01-30 06:07:58', 'en', 'default', 1, 1, '2024-02-06 15:11:14', NULL, 1),
(2, '02', 'simple', '2', 'CARWORNIC Men\'s Tactical Combat Shirt, 1/4 Zipper Long Sleeve Camo Army Military T Shirt', '\"CARWORNIC Combat Shirt: Durable, comfortable, and high-performance. Made with tear-resistant rip-stop fabric, featuring a slim-fit design for breathability and quick-dry. Two arm pockets for convenient storage during combat or outdoor activities. Elevate your tactical gear with this essential.\"', 'The Carwornic combat shirt is a durable and comfortable tactical top. The sleeve is made of 65% polyester + 35% cotton, tear-resistance rip-stop fabric; the torso is made of elastic cotton, slim fit your body and keep breathable, lightweight, and quick dry. It will be wonderful to stay comfortable under your tactical vest or plate carrier. Two arm pockets make it easy to carry the phone and EDC tools during combat or other outdoor activities. It’s a high-performance tactical shirt.', 'carwornic-mens-tactical-combat-shirt-14-zipper-long-sleeve-camo-army-military-t-shirt', 1, 0, 1, 'CARWORNIC Combat Shirt: Durable & Comfortable Tactical Wear for Outdoor Enthusiasts', 'Uniform', '\"CARWORNIC Combat Shirt: Durable, slim-fit tactical wear for ultimate outdoor comfort. Breathable, quick-dry fabric with convenient arm pockets. Upgrade your adventure now!\"', 420.0000, 410.0000, '2024-01-30', '2024-02-06', 1.3200, '2024-01-30 18:38:02', 'en', 'default', 1, 2, '2024-01-30 18:59:56', NULL, 1),
(3, '03', 'simple', '3', 'CARWORNIC Men\'s Tactical Combat Shirt, 1/4 Zipper Long Sleeve Camo Army Military T Shirt 2#Cp', 'Carwornic Combat Shirt: Durable, comfortable, and high-performance. Made with tear-resistant rip-stop fabric, featuring a slim-fit design for breathability and quick-dry. Two arm pockets for convenient storage during combat or outdoor activities. Elevate your tactical gear with this essential', 'The Carwornic combat shirt is a durable and comfortable tactical top. The sleeve is made of 65% polyester + 35% cotton, tear-resistance rip-stop fabric; the torso is made of elastic cotton, slim fit your body and keep breathable, lightweight, and quick dry. It will be wonderful to stay comfortable under your tactical vest or plate carrier. Two arm pockets make it easy to carry the phone and EDC tools during combat or other outdoor activities. It’s a high-performance tactical shirt.', 'carwornic-mens-tactical-combat-shirt-14-zipper-long-sleeve-camo-army-military-t-shirt-2cp', 1, 0, 1, 'CARWORNIC Combat Shirt: Durable & Comfortable Tactical Wear for Outdoor Enthusiasts', '', 'CARWORNIC Combat Shirt: Durable, slim-fit tactical wear for ultimate outdoor comfort. Breathable, quick-dry fabric with two arm pockets for easy storage. Upgrade your adventure now!', 425.0000, 400.0000, '2024-01-30', '2024-02-06', 1.3200, '2024-01-30 19:01:44', 'en', 'default', 1, 3, '2024-02-07 02:36:30', NULL, 1),
(4, '04', 'simple', '4', 'IODSON Men\'s Military Tactical Boots with Side Zipper, Puncture Resistant Work Boots, Army Jungle Boots', 'IODSON Men\'s Military Tactical Boots with Side Zipper, Puncture Resistant Work Boots, Desert Combat Boots, Army Jungle Boots, 8 Inches Lightweight Hiking Boots', 'Anti-dust design\r\nThe military boot uses a one-piece tongue design to prevent dust from entering your boots.\r\n\r\nLightweight\r\nWear a pair of lightweight and comfortable boots so that you will not feel tired from long-distance travel\r\n\r\nYKK zipper\r\nThe side zipper is upgraded to YKK zipper, which is more smooth and durable.', 'iodson-mens-military-tactical-boots-with-side-zipper-puncture-resistant-work-boots-army-jungle-boots', 1, 0, 1, 'Military Tactical Boots', 'boots', 'IODSON Men\'s Military Tactical Boots with Side Zipper, Puncture Resistant Work Boots, Army Jungle Boots', 598.0000, 588.0000, '2024-01-31', '2024-02-06', 2.2000, '2024-01-31 13:00:01', 'en', 'default', 1, 4, '2024-02-06 15:11:14', NULL, 1),
(5, '05', 'simple', '5', 'IODSON Black Men\'s Military Tactical Boots with Side Zipper, Resistant Work Boots, Army Jungle Boots', 'IODSON Men\'s Military Tactical Boots with Side Zipper, Puncture Resistant Work Boots, Desert Combat Boots, Army Jungle Boots, 8 Inches Lightweight Hiking Boots', 'Anti-dust design\r\nThe military boot uses a one-piece tongue design to prevent dust from entering your boots.\r\n\r\nLightweight\r\nWear a pair of lightweight and comfortable boots so that you will not feel tired from long-distance travel\r\n\r\nYKK zipper\r\nThe side zipper is upgraded to YKK zipper, which is more smooth and durable.', 'iodson-black-mens-military-tactical-boots-with-side-zipper-resistant-work-boots-army-jungle-boots', 1, 0, 1, 'Military Tactical Boots', 'boots', '', 598.0000, 589.0000, '2024-01-31', '2024-02-06', 2.2000, '2024-01-31 13:34:52', 'en', 'default', 1, 5, '2024-01-31 13:53:04', NULL, 1),
(6, '06', 'simple', '6', 'RIELD Men\'s Military Tactical Work Boots Lightweight Side Zipper Army Combat Hiking Boots', 'Ultimate Tactical Boots for Combat, Work and Adventure', 'Ultimate Tactical Boots for Combat, Work and Adventure\r\n\r\nEngineered for specialized units and demanding operations, these tactical boots provide the lightweight durability, protection and performance needed to overcome any challenge.\r\n\r\nBuilt Tactical Tough for the Most Demanding Missions\r\n\r\nConstructed from premium leather and oxford, these tactical boots are designed to withstand the punishing conditions of desert and jungle. Reinforced toe cap shield against injury, while lace-up fronts with durable side zippers allow for a secured custom fit that can be quickly donned and doffed. Puncture-resistant midsoles and slip-resistant outsoles grip rocky, uneven terrain with ease. For military, security and special forces personnel, these rugged yet featherlight boots are ready for rapid response.\r\n\r\nLightweight and Lethally Agile\r\n\r\nRemarkably lightweight yet highly protective, these boots weigh only 1 pound per shoe for agile, fatigue-free movement. The flexible midsoles and cushioned insoles provide shock absorption and comfort for traversing long distances, while the integrated tongue prevents debris from entering the boots.\r\n\r\nBuilt for the Toughest Working Conditions\r\n\r\nWhen work takes you off the beaten path, into hazardous areas or requires extensive time on your feet, these tactical boots provide the safety, durability and comfort needed to get the job done. The rugged yet comfortable design allows utility workers, contractors, first responders and others to remain steadily on task for hours.\r\n\r\nRugged Enough for the Great Outdoors\r\n\r\nFor hiking, hunting and other activities where sturdy footwear is a must, these tactical boots offer durable construction, premium comfort and high performance. Whether venturing into remote backcountry or tackling challenging trails, these boots provide the protection and reliability to get you there and back again.', 'rield-mens-military-tactical-work-boots-lightweight-side-zipper-army-combat-hiking-boots', 1, 0, 1, 'RIELD Men\'s Military Tactical Work Boots', 'Boots', 'Ultimate Tactical Boots for Combat, Work and Adventure', 598.0000, 588.0000, '2024-01-31', '2024-02-06', 2.2000, '2024-01-31 13:53:37', 'en', 'default', 1, 6, '2024-01-31 14:16:22', NULL, 1),
(7, '07', 'simple', '7', 'Military Army Tactical', 'MILITARY TACTICAL 65% POLYESTER 35% COTTON CAMOUFLGE ACU UNIFORM', 'Fabric: TC 35% cotton and 65% polyester, 210GSM is the best composition and thickness, suitable for the soldier\'s daily training in the woods and fields. Besides, you can customize the fabric according to your needs.\r\n\r\nExcellent craftsmanship and quality can meet all test requirements, such as color fastness, breaking strength, tensile strength, etc.\r\n\r\nFabric: TC 35% cotton and 65% polyester, 210GSM is the best composition and thickness, suitable for the soldier\'s daily training in the woods and fields. Besides, you can customize the fabric according to your needs.\r\n\r\nExcellent craftsmanship and quality can meet all test requirements, such as color fastness, breaking strength, tensile strength, etc.', 'military-army-tactical-', 1, 0, 1, 'Military Army Tactical', 'tactical', '', 750.0000, 740.0000, '2024-02-06', '2024-03-06', 2.2000, '2024-02-06 15:32:10', 'en', 'default', 1, 7, '2024-02-07 05:36:38', NULL, 1),
(9, '08', 'simple', '8', 'Glock 17 Gen. 4 BB Pistol', 'Arguably the most well-recognized name in pistols, the Glock 17 is known the world over for it\'s reliability, shoot-ability and ruggedness.', 'Arguably the most well-recognized name in pistols, the Glock 17 is known the world over for it\'s reliability, shoot-ability and ruggedness. The Gen4 variant is one of the most popular versions, featuring different grip texturing and a larger magazine release. Umarex unleashes this blowback replica, giving Gen4 fans everywhere something to cheer about. With authentic controls and a full metal, drop-free magazine, the Gen4 17 handles just like the real steel version. This version comes with three different interchangeable backstraps, allowing for a more custom fit based on your hand size.\r\n\r\nGlock 17 Gen 4 Features:\r\nBlowback Action\r\nAuthentic Replica with realistic controls\r\nTraditional fixed Glock sights\r\nFull Metal Slide\r\nMetal 18-round drop-free magazine\r\nRuns on one 12-gram CO2 capsule\r\nFits most aftermarket duty holsters\r\nIncludes small, medium, and large backstraps', 'glock-17-gen-4-bb-pistol', 1, 0, 1, 'Glock 17 Gen. 4 BB Pistol', 'pistol', '', 640.0000, 635.0000, '2024-02-09', '2024-03-06', 2.2000, '2024-02-09 18:54:45', 'en', 'default', 1, 9, '2024-02-13 18:04:37', NULL, 1),
(10, '010', 'simple', '10', 'H&K USP BB Pistol', 'H&K USP Pistol', 'H&K USP Pistol\r\nCO2-powered\r\nUses one 12-gram CO2 cartridge\r\nShoots steel BBs\r\n22-shot removable BB mag also holds CO2 cartridge\r\nDouble-action only\r\nFixed front and rear sights\r\nIntegrated Weaver accessory rail under the barrel (no Picatinny slots)\r\nRealistic hammer movement\r\nNever shoot steel BBs at hard objects', 'hk-usp-bb-pistol', 1, 0, 1, 'H&K USP Pistol', 'Pistol', '', 650.0000, 640.0000, '2024-02-13', '2024-03-06', 1.3500, '2024-02-13 17:30:18', 'en', 'default', 1, 10, '2024-02-13 17:44:56', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_grouped_products`
--

CREATE TABLE `product_grouped_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `associated_product_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `path` varchar(191) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES
(1, 'images', 'product/1/ZhlLyePS6K1ADs6O2K7VrgTdyOVVBhZq2RdwCzbu.webp', 1, 1),
(2, 'images', 'product/1/CuOc4gqzqTJj2Qbz0q4FxBZeY5iowImAQyNJ9zxB.webp', 1, 2),
(3, 'images', 'product/2/BuZNMbYExhv0h6tLRfchHOujCBe5oSXQvMg3fBzk.webp', 2, 1),
(4, 'images', 'product/2/SWjmDHLWamgCXLNeZWVRCN6x8CuEhUB5QbeqIk2q.webp', 2, 2),
(5, 'images', 'product/2/6uTddc6qVf0javX9M4XYXBwqcdQHHzz4TzxMU0Pa.webp', 2, 3),
(6, 'images', 'product/3/vlX39WxnWSndzkKAPwW08dPXm2AzAVOLxj4YBoPl.webp', 3, 1),
(7, 'images', 'product/3/LlKD8mXNQRG92QMnEK1CsIoXx7MYzErrAgqw4VMF.webp', 3, 2),
(8, 'images', 'product/3/pJaq8jpsWTC8TNqqI0DLkMMKciRjHUeEVH34wZjq.webp', 3, 3),
(9, 'images', 'product/4/OBAReXO1kJyQI9uefeFayqbZIHgovOTv67lqgVAr.webp', 4, 1),
(10, 'images', 'product/4/5sb1y8SF4MnLZD52bZfUNWWxxoki0PEOEjKeM5E3.webp', 4, 2),
(11, 'images', 'product/4/RbEPYG2EFZQa53MbaLLLKkdkN3dfmW4F5hWv4AXj.webp', 4, 3),
(12, 'images', 'product/4/LJ4SzcKWAw79cM1W0ghXHKJiurljJiHDhxk7GoB9.webp', 4, 4),
(13, 'images', 'product/4/SVZkL21Jrs3C8vAxigJzEwom6cfm4AsqIpPcV2b0.webp', 4, 5),
(14, 'images', 'product/4/WrXEUndeX4hgN5MTcO6hdCGPxaY8sSeEFufWvtzG.webp', 4, 6),
(15, 'images', 'product/5/5nt6mULuOcnsmd4C7VbJoZfiQI7DfNYjnBOpuyIb.webp', 5, 1),
(16, 'images', 'product/5/vtQNqvJO6UYXnBWwHJrWJXacJPcVWS3odclEAvIo.webp', 5, 2),
(17, 'images', 'product/5/MyQkyF8rXEPc6CSYFtDl1ZNc7hlgy3RVHXb9Rz1t.webp', 5, 3),
(18, 'images', 'product/5/2jbpiz1R1XqivHFQ0VkqIgOy5WrJjt8Jx1r6sYOp.webp', 5, 4),
(19, 'images', 'product/5/1i27Bvdna5O46QIXw1jCuQuA3Qcp7Y7mkOfLkjV3.webp', 5, 5),
(20, 'images', 'product/5/8NZcfDJyxaXhqMpSErtgOTtY7Oepw7Vf5l79qcsi.webp', 5, 6),
(22, 'images', 'product/6/A2enuspH67ixGudpry2k6lHrd276qHWcEViYrJCA.webp', 6, 1),
(23, 'images', 'product/6/WSzR8L7nmgClsOcBmHKPwkIGta1FBX9DxGi94YNF.webp', 6, 2),
(24, 'images', 'product/6/0POwJlFCEMe1X18XvU8g7G7oGlTaX7U3kyJmkuFs.webp', 6, 3),
(25, 'images', 'product/6/8hIIrvCqzd3HfibYZTY8lm0IAzt78ztMJppZkL86.webp', 6, 4),
(26, 'images', 'product/6/74JhcwmW4Y4BldYgytScA2dI7qZ0Irkmu3Q3w4x7.webp', 6, 5),
(39, 'images', 'product/7/HQO5VwrOHQwZrteeZKZgNVtfRJGhRGeKX9DriXDT.webp', 7, 1),
(40, 'images', 'product/7/PNhzLzbwXxTAQWRtH8aASjUR3gCvhCbwd7SVV6H8.webp', 7, 2),
(41, 'images', 'product/7/H3ETZyVJGE8pjOMYF1pf4Nx0c44YekQZnlNwFGwK.webp', 7, 3),
(46, 'images', 'product/10/7fmgLiSXyuLwF5uXr9B3iPfGY7qm2EPRXBQyKJI2.webp', 10, 1),
(47, 'images', 'product/10/NefgL4pf9ka7wz4pfSsCLSmmgwBhGLfoCEnsa7HT.webp', 10, 2),
(48, 'images', 'product/10/U4q50iztRsSd31AMBgvzQIHxk8Urs7gK4zqI58bH.webp', 10, 3),
(49, 'images', 'product/10/k9W5qm7zhfNIwtJGRrKIkFMQopUKq1lCb6xfnktA.webp', 10, 4),
(50, 'images', 'product/10/E1pO98lwP0jVo9zG4Syrcv1VqwJoLOWP0HGKr8SQ.webp', 10, 5),
(51, 'images', 'product/9/WqVojlL1BLqshF2fvOcBOrTeqDZ60CZx856FvX2n.webp', 9, 1),
(52, 'images', 'product/9/bSzz32IVIEeJsc4w0xsIeS2dz4gZSHG0SddSEVkq.webp', 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_inventories`
--

CREATE TABLE `product_inventories` (
  `id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `product_id` int(10) UNSIGNED NOT NULL,
  `vendor_id` int(11) NOT NULL DEFAULT 0,
  `inventory_source_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_inventories`
--

INSERT INTO `product_inventories` (`id`, `qty`, `product_id`, `vendor_id`, `inventory_source_id`) VALUES
(1, 99, 1, 0, 1),
(2, 100, 2, 0, 1),
(3, 100, 3, 0, 1),
(4, 99, 4, 0, 1),
(5, 100, 5, 0, 1),
(6, 100, 6, 0, 1),
(7, 100, 7, 0, 1),
(9, 100, 9, 0, 1),
(10, 100, 10, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_inventory_indices`
--

CREATE TABLE `product_inventory_indices` (
  `id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `product_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_inventory_indices`
--

INSERT INTO `product_inventory_indices` (`id`, `qty`, `product_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 99, 1, 1, NULL, '2024-02-06 14:46:43'),
(2, 100, 2, 1, NULL, NULL),
(3, 100, 3, 1, NULL, '2024-01-30 19:09:50'),
(4, 99, 4, 1, NULL, '2024-02-06 14:46:43'),
(5, 100, 5, 1, NULL, '2024-01-31 13:53:04'),
(6, 100, 6, 1, NULL, NULL),
(7, 100, 7, 1, NULL, NULL),
(9, 100, 9, 1, NULL, '2024-02-13 17:15:43'),
(10, 100, 10, 1, NULL, '2024-02-13 17:44:56');

-- --------------------------------------------------------

--
-- Table structure for table `product_ordered_inventories`
--

CREATE TABLE `product_ordered_inventories` (
  `id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `product_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_ordered_inventories`
--

INSERT INTO `product_ordered_inventories` (`id`, `qty`, `product_id`, `channel_id`) VALUES
(1, 0, 1, 1),
(2, 0, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_price_indices`
--

CREATE TABLE `product_price_indices` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED DEFAULT NULL,
  `min_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `regular_min_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `max_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `regular_max_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_price_indices`
--

INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 670.0000, 694.0000, 670.0000, 694.0000, NULL, NULL),
(2, 1, 2, 670.0000, 694.0000, 670.0000, 694.0000, NULL, NULL),
(3, 1, 3, 670.0000, 694.0000, 670.0000, 694.0000, NULL, NULL),
(4, 2, 1, 410.0000, 420.0000, 410.0000, 420.0000, NULL, NULL),
(5, 2, 2, 410.0000, 420.0000, 410.0000, 420.0000, NULL, NULL),
(6, 2, 3, 410.0000, 420.0000, 410.0000, 420.0000, NULL, NULL),
(7, 3, 1, 425.0000, 425.0000, 425.0000, 425.0000, NULL, '2024-02-07 02:36:31'),
(8, 3, 2, 425.0000, 425.0000, 425.0000, 425.0000, NULL, '2024-02-07 02:36:31'),
(9, 3, 3, 425.0000, 425.0000, 425.0000, 425.0000, NULL, '2024-02-07 02:36:31'),
(10, 4, 1, 588.0000, 598.0000, 588.0000, 598.0000, NULL, NULL),
(11, 4, 2, 588.0000, 598.0000, 588.0000, 598.0000, NULL, NULL),
(12, 4, 3, 588.0000, 598.0000, 588.0000, 598.0000, NULL, NULL),
(13, 5, 1, 589.0000, 598.0000, 589.0000, 598.0000, NULL, NULL),
(14, 5, 2, 589.0000, 598.0000, 589.0000, 598.0000, NULL, NULL),
(15, 5, 3, 589.0000, 598.0000, 589.0000, 598.0000, NULL, NULL),
(16, 6, 1, 588.0000, 598.0000, 588.0000, 598.0000, NULL, NULL),
(17, 6, 2, 588.0000, 598.0000, 588.0000, 598.0000, NULL, NULL),
(18, 6, 3, 588.0000, 598.0000, 588.0000, 598.0000, NULL, NULL),
(19, 7, 1, 740.0000, 750.0000, 740.0000, 750.0000, NULL, NULL),
(20, 7, 2, 740.0000, 750.0000, 740.0000, 750.0000, NULL, NULL),
(21, 7, 3, 740.0000, 750.0000, 740.0000, 750.0000, NULL, NULL),
(25, 9, 1, 635.0000, 640.0000, 635.0000, 640.0000, NULL, NULL),
(26, 9, 2, 635.0000, 640.0000, 635.0000, 640.0000, NULL, NULL),
(27, 9, 3, 635.0000, 640.0000, 635.0000, 640.0000, NULL, NULL),
(28, 10, 1, 640.0000, 650.0000, 640.0000, 650.0000, NULL, NULL),
(29, 10, 2, 640.0000, 650.0000, 640.0000, 650.0000, NULL, NULL),
(30, 10, 3, 640.0000, 650.0000, 640.0000, 650.0000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_relations`
--

CREATE TABLE `product_relations` (
  `parent_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_relations`
--

INSERT INTO `product_relations` (`parent_id`, `child_id`) VALUES
(2, 1),
(3, 1),
(3, 2),
(5, 4),
(6, 5),
(6, 4),
(7, 1),
(7, 2),
(7, 3),
(10, 9);

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `title` varchar(191) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_review_attachments`
--

CREATE TABLE `product_review_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `review_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) DEFAULT 'image',
  `mime_type` varchar(191) DEFAULT NULL,
  `path` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_super_attributes`
--

CREATE TABLE `product_super_attributes` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_up_sells`
--

CREATE TABLE `product_up_sells` (
  `parent_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_videos`
--

CREATE TABLE `product_videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `path` varchar(191) NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` int(10) UNSIGNED NOT NULL,
  `increment_id` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `total_qty` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) DEFAULT NULL,
  `channel_currency_code` varchar(191) DEFAULT NULL,
  `order_currency_code` varchar(191) DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT 0.0000,
  `base_adjustment_refund` decimal(12,4) DEFAULT 0.0000,
  `adjustment_fee` decimal(12,4) DEFAULT 0.0000,
  `base_adjustment_fee` decimal(12,4) DEFAULT 0.0000,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `refund_items`
--

CREATE TABLE `refund_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) DEFAULT NULL,
  `order_item_id` int(10) UNSIGNED DEFAULT NULL,
  `refund_id` int(10) UNSIGNED DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `permission_type` varchar(191) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `permission_type`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'Administrator role', 'all', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `carrier_code` varchar(191) DEFAULT NULL,
  `carrier_title` varchar(191) DEFAULT NULL,
  `track_number` text DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_type` varchar(191) DEFAULT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `order_address_id` int(10) UNSIGNED DEFAULT NULL,
  `inventory_source_id` int(10) UNSIGNED DEFAULT NULL,
  `inventory_source_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `shipments`
--

INSERT INTO `shipments` (`id`, `status`, `total_qty`, `total_weight`, `carrier_code`, `carrier_title`, `track_number`, `email_sent`, `customer_id`, `customer_type`, `order_id`, `order_address_id`, `inventory_source_id`, `inventory_source_name`, `created_at`, `updated_at`) VALUES
(1, NULL, 2, 4, NULL, 'Top Guy', '094006022024', 0, 2, 'Webkul\\Customer\\Models\\Customer', 1, 4, 1, 'Default', '2024-02-06 15:11:13', '2024-02-06 15:11:14');

-- --------------------------------------------------------

--
-- Table structure for table `shipment_items`
--

CREATE TABLE `shipment_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT 0.0000,
  `base_price` decimal(12,4) DEFAULT 0.0000,
  `total` decimal(12,4) DEFAULT 0.0000,
  `base_total` decimal(12,4) DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) DEFAULT NULL,
  `order_item_id` int(10) UNSIGNED DEFAULT NULL,
  `shipment_id` int(10) UNSIGNED NOT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `shipment_items`
--

INSERT INTO `shipment_items` (`id`, `name`, `description`, `sku`, `qty`, `weight`, `price`, `base_price`, `total`, `base_total`, `product_id`, `product_type`, `order_item_id`, `shipment_id`, `additional`, `created_at`, `updated_at`) VALUES
(1, 'BACKBONE Mens Army Military Battle Dress Uniform BDU Shirt Camo Top Jacket', NULL, '01', 1, 1, 670.0000, 670.0000, 670.0000, 670.0000, 1, 'Webkul\\Product\\Models\\Product', 1, 1, '{\"quantity\":1,\"product_id\":1,\"locale\":\"en\"}', '2024-02-06 15:11:13', '2024-02-06 15:11:13'),
(2, 'IODSON Men\'s Military Tactical Boots with Side Zipper, Puncture Resistant Work Boots, Army Jungle Boots', NULL, '04', 1, 2, 588.0000, 588.0000, 588.0000, 588.0000, 4, 'Webkul\\Product\\Models\\Product', 2, 1, '{\"quantity\":1,\"product_id\":4,\"locale\":\"en\"}', '2024-02-06 15:11:14', '2024-02-06 15:11:14');

-- --------------------------------------------------------

--
-- Table structure for table `sitemaps`
--

CREATE TABLE `sitemaps` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `path` varchar(191) NOT NULL,
  `generated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers_list`
--

CREATE TABLE `subscribers_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT 0,
  `token` varchar(191) DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tax_categories`
--

CREATE TABLE `tax_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tax_categories_tax_rates`
--

CREATE TABLE `tax_categories_tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `tax_category_id` int(10) UNSIGNED NOT NULL,
  `tax_rate_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `identifier` varchar(191) NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT 0,
  `zip_code` varchar(191) DEFAULT NULL,
  `zip_from` varchar(191) DEFAULT NULL,
  `zip_to` varchar(191) DEFAULT NULL,
  `state` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `theme_customizations`
--

CREATE TABLE `theme_customizations` (
  `id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `type` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `theme_customizations`
--

INSERT INTO `theme_customizations` (`id`, `channel_id`, `type`, `name`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'image_carousel', 'Image Carousel', 1, 1, '2024-01-28 05:00:28', '2024-01-28 05:00:28'),
(2, 1, 'static_content', 'Offer Information', 2, 1, '2024-01-28 05:00:28', '2024-01-28 05:00:28'),
(3, 1, 'category_carousel', 'Categories Collections', 3, 1, '2024-01-28 05:00:28', '2024-01-28 05:00:28'),
(4, 1, 'product_carousel', 'New Products', 4, 1, '2024-01-28 05:00:28', '2024-01-28 05:00:28'),
(5, 1, 'static_content', 'Top Collections', 5, 1, '2024-01-28 05:00:28', '2024-01-28 05:00:28'),
(6, 1, 'static_content', 'Bold Collections', 6, 1, '2024-01-28 05:00:28', '2024-02-06 13:21:11'),
(7, 1, 'product_carousel', 'Featured Collections', 7, 1, '2024-01-28 05:00:28', '2024-01-28 05:00:28'),
(8, 1, 'static_content', 'Game Container', 8, 1, '2024-01-28 05:00:28', '2024-01-28 05:00:28'),
(9, 1, 'product_carousel', 'All Products', 9, 1, '2024-01-28 05:00:28', '2024-01-28 05:00:28'),
(10, 1, 'static_content', 'Bold Collections', 10, 1, '2024-01-28 05:00:28', '2024-02-06 13:20:31'),
(11, 1, 'footer_links', 'Footer Links', 11, 1, '2024-01-28 05:00:28', '2024-02-14 18:52:36');

-- --------------------------------------------------------

--
-- Table structure for table `theme_customization_translations`
--

CREATE TABLE `theme_customization_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme_customization_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`options`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `theme_customization_translations`
--

INSERT INTO `theme_customization_translations` (`id`, `theme_customization_id`, `locale`, `options`) VALUES
(1, 1, 'en', '{\"images\":[{\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/1.1.webp\"},{\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/2.2.webp\"},{\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/3.3.webp\"},{\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/4.4.webp\"}]}'),
(2, 2, 'en', '{\"html\":\"<div class=\\\"home-offer\\\"><span>Get UPTO 40% OFF on your 1st order SHOP NOW<\\/span><\\/div>\",\"css\":\".home-offer span {display: block;font-weight: 500;text-align: center;font-size: 22px;font-family: DM Serif Display;background-color: #E8EDFE;padding-top: 20px;padding-bottom: 20px;}@media (max-width:768px){.home-offer span {font-size:18px;}@media (max-width:525px) {.home-offer span {font-size:14px;}}\"}'),
(3, 3, 'en', '{\"filters\":{\"parent_id\":1,\"sort\":\"asc\",\"limit\":10}}'),
(4, 4, 'en', '{\"title\":\"New Products\",\"filters\":{\"new\":1,\"sort\":\"asc\",\"limit\":10}}'),
(5, 5, 'en', '{\"html\":\"<div class=\\\"top-collection-container\\\"><div class=\\\"top-collection-header\\\"><h2>The game with our new additions!<\\/h2><\\/div><div class=\\\"container top-collection-grid\\\"><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/1.1.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"\\\"><h3>Our Collections<\\/h3><\\/div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/2.2.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"\\\"><h3>Our Collections<\\/h3><\\/div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/3.3.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"\\\"><h3>Our Collections<\\/h3><\\/div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/4.4.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"\\\"><h3>Our Collections<\\/h3><\\/div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/5.5.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"\\\"><h3>Our Collections<\\/h3><\\/div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/6.6.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"\\\"><h3>Our Collections<\\/h3><\\/div><\\/div><\\/div>\",\"css\":\".top-collection-header {padding-left: 15px;padding-right: 15px;text-align: center;font-size: 70px;line-height: 90px;color: #060C3B;margin-top: 80px;}.top-collection-header h2 {max-width: 595px;margin-left: auto;margin-right: auto;font-family: DM Serif Display;}.top-collection-grid {display: flex;flex-wrap: wrap;gap: 32px;justify-content: center;margin-top: 60px;width: 100%;margin-right: auto;margin-left: auto;padding-right: 90px;padding-left: 90px;}.top-collection-card {position: relative;background: #f9fafb;}.top-collection-card img {border-radius: 16px;max-width: 100%;text-indent:-9999px;}.top-collection-card h3 {color: #fff;font-size: 30px;font-family: DM Serif Display;transform: translateX(-50%);width: max-content;left: 50%;bottom: 30px;position: absolute;margin: 0;font-weight: inherit;}@media not all and (min-width: 525px) {.top-collection-header {margin-top: 30px;}.top-collection-header {font-size: 32px;line-height: 1.5;}.top-collection-grid {gap: 15px;}}@media not all and (min-width: 1024px) {.top-collection-grid {padding-left: 30px;padding-right: 30px;}}@media (max-width: 640px) {.top-collection-grid {margin-top: 20px;}}\"}'),
(6, 6, 'en', '{\"html\":\"<div class=\\\"container section-gap\\\">\\r\\n    <div class=\\\"inline-col-wrapper\\\">\\r\\n        <div class=\\\"inline-col-image-wrapper\\\">\\r\\n            <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/6\\/1.webp\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"\\\">\\r\\n        <\\/div>\\r\\n        <div class=\\\"inline-col-content-wrapper\\\">\\r\\n             <h2 class=\\\"inline-col-title\\\"> Get Ready for our new Bold Collections! <\\/h2> \\r\\n            <p class=\\\"inline-col-description\\\">Elevate your style with our new Bold Collections! Unleashing daring designs and unparalleled sophistication, redefine fashion boundaries and make a statement that transcends trends. Your bold transformation starts here!<\\/p>\\r\\n          <a href=\\\"\\\" target=\\\"_blank\\\"><button class=\\\"primary-button\\\">View All<\\/button><\\/a>\\r\\n        <\\/div>\\r\\n    <\\/div>\\r\\n<\\/div>\",\"css\":\".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}}@media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:30px;line-height:normal}}\"}'),
(7, 7, 'en', '{\"title\":\"Featured Products\",\"filters\":{\"featured\":1,\"sort\":\"desc\",\"limit\":10}}'),
(8, 8, 'en', '{\"html\":\"<div class=\\\"section-title\\\"> <h2>The game with our new additions!<\\/h2> <\\/div> <div class=\\\"container section-gap\\\"> <div class=\\\"collection-card-wrapper\\\"> <div class=\\\"single-collection-card\\\"> <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/8\\/1.webp\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"\\\"> <h3 class=\\\"overlay-text\\\">Our Collections<\\/h3> <\\/div> <div class=\\\"single-collection-card\\\"> <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/8\\/2.webp\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"\\\"> <h3 class=\\\"overlay-text\\\"> Our Collections <\\/h3> <\\/div> <\\/div> <\\/div>\",\"css\":\".section-title,.section-title h2{font-weight:400;font-family:DM Serif Display}.section-title{margin-top:80px;padding-left:15px;padding-right:15px;text-align:center;line-height:90px}.section-title h2{font-size:70px;color:#060c3b;max-width:595px;margin:auto}.collection-card-wrapper{display:flex;flex-wrap:wrap;justify-content:center;gap:30px}.collection-card-wrapper .single-collection-card{position:relative}.collection-card-wrapper .single-collection-card img{border-radius:16px;background-color:#f5f5f5;max-width:100%;height:auto;text-indent:-9999px}.collection-card-wrapper .single-collection-card .overlay-text{font-size:50px;font-weight:400;max-width:234px;font-style:italic;color:#fff;font-family:DM Serif Display;position:absolute;bottom:30px;left:30px;margin:0}@media (max-width:1024px){.section-title{padding:0 30px}}@media (max-width:991px){.collection-card-wrapper{flex-wrap:wrap}}@media (max-width:525px){.collection-card-wrapper .single-collection-card img{max-width:calc(100vw - 30px)}.collection-card-wrapper .single-collection-card .overlay-text{font-size:30px}.container{padding:0 30px;margin-top:20px}.section-title{margin-top:30px}.section-title h2{font-size:30px;line-height:normal}}\"}'),
(9, 9, 'en', '{\"title\":\"All Products\",\"filters\":{\"sort\":\"desc\",\"limit\":10}}'),
(10, 10, 'en', '{\"html\":\"<div class=\\\"container section-gap\\\">\\r\\n    <div class=\\\"inline-col-wrapper direction-rtl\\\">\\r\\n        <div class=\\\"inline-col-image-wrapper \\\">\\r\\n            <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/10\\/1.webp\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"\\\">\\r\\n        <\\/div>\\r\\n        <div class=\\\"inline-col-content-wrapper direction-ltr\\\">\\r\\n             <h2 class=\\\"inline-col-title\\\"> Get Ready for our new Bold Collections! <\\/h2> \\r\\n            <p class=\\\"inline-col-description\\\">Introducing our daring Bold Collections \\u2013 a fusion of fearless designs and unmatched sophistication. Redefine your style and make a statement that transcends trends. Your wardrobe transformation begins now!<\\/p> <a href=\\\"\\\" target=\\\"_blank\\\"><button class=\\\"primary-button\\\">View All<\\/button><\\/a>\\r\\n\\r\\n        <\\/div>\\r\\n    <\\/div>\\r\\n<\\/div>\",\"css\":\".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}}@media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:30px;line-height:normal}}\"}'),
(11, 11, 'en', '{\"column_1\":[{\"url\":\"http:\\/\\/localhost\\/page\\/about-us\",\"title\":\"About Us\",\"sort_order\":\"1\"},{\"url\":\"http:\\/\\/localhost\\/page\\/contact-us\",\"title\":\"Contact Us\",\"sort_order\":\"2\"},{\"url\":\"http:\\/\\/localhost\\/page\\/customer-service\",\"title\":\"Customer Service\",\"sort_order\":\"3\"},{\"url\":\"http:\\/\\/localhost\\/page\\/whats-new\",\"title\":\"What\'s new\",\"sort_order\":\"4\"},{\"url\":\"http:\\/\\/localhost\\/page\\/terms-of-use\",\"title\":\"Terms of use\",\"sort_order\":\"5\"},{\"url\":\"http:\\/\\/localhost\\/page\\/terms-conditions\",\"title\":\"Terms & Conditions\",\"sort_order\":\"6\"}],\"column_2\":[{\"url\":\"http:\\/\\/localhost\\/page\\/privacy-policy\",\"title\":\"Privacy Policy\",\"sort_order\":\"1\"},{\"url\":\"http:\\/\\/localhost\\/page\\/payment-policy\",\"title\":\"Payment Policy\",\"sort_order\":\"2\"},{\"url\":\"http:\\/\\/localhost\\/page\\/shipping-policy\",\"title\":\"Shipping Policy\",\"sort_order\":\"3\"},{\"url\":\"http:\\/\\/localhost\\/page\\/refund-policy\",\"title\":\"Refund Policy\",\"sort_order\":\"4\"},{\"url\":\"http:\\/\\/localhost\\/page\\/return-policy\",\"title\":\"Return Policy\",\"sort_order\":\"5\"}],\"column_3\":[{\"url\":\"Address\",\"title\":\"BOD, Giffard Rd, Accra Ghana\",\"sort_order\":\"1\"}]}\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method` varchar(191) DEFAULT NULL,
  `request` mediumtext DEFAULT NULL,
  `url` mediumtext DEFAULT NULL,
  `referer` mediumtext DEFAULT NULL,
  `languages` text DEFAULT NULL,
  `useragent` text DEFAULT NULL,
  `headers` text DEFAULT NULL,
  `device` text DEFAULT NULL,
  `platform` text DEFAULT NULL,
  `browser` text DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `visitable_type` varchar(191) DEFAULT NULL,
  `visitable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `visitor_type` varchar(191) DEFAULT NULL,
  `visitor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `visits`
--

INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `created_at`, `updated_at`) VALUES
(1, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"dnt\":[\"1\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=1; XSRF-TOKEN=eyJpdiI6IkluZ0ZlSndGTUs2UDhva3ZvcWdVZkE9PSIsInZhbHVlIjoiNnZWYk02dEJOQnFBZXlmaTl3RC9wS3NCcG9abEd5dEZDNDAzVGNXczEreVkycWVHSUsrSDIxSWpPS3VJSVZIbHFyekhVYlZPQVhWcDFROE1DVWYyY0I4ZU1IWmYwd05rWE9GRkNMWXFHNzF6OCtsU05FQ0x6VFdtSk1QYkduUGEiLCJtYWMiOiI0ZDlmNzc5YTVkYzk2YmMzYWVhOTMzYzFjMGExM2MxZTU3YzJlNmNmMGQwYzgzMzViNjYxM2JmZjg1ZjJjMDdlIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IkFSTzA5cnZVV3RsdG9SV28rWnFPbFE9PSIsInZhbHVlIjoid0ZyUVpRMVFWNm5zUHFyUWh1cUhiMjE0VTVkaURvUGEyUGNCck9LOHc1QUVDOS8xRGRLUkEyWkh2dXJIMU94M2QzeWZVTk1OZ3o2SFRCTmx4OE1zZFNqSFJDcC9IZk1CWmcxYkZvRkxFQ0VoL1l0a0Rvc0M1WXl1UDArWHR0cEwiLCJtYWMiOiJlNjczMzk2Y2FjNjc0Zjk1ZmI2MTVmNWVjZWNhOWRhMmMxMzIyMGViYzgzMTRiMDg5YTg0ZTE5ODY0ZDE4NWJkIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-01-28 05:02:06', '2024-01-28 05:02:06'),
(2, 'GET', '[]', 'http://127.0.0.1:8000/127.0.0.1:/storage/locales/en.png', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"dnt\":[\"1\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=1; XSRF-TOKEN=eyJpdiI6ImRVaStEWkFyMW5PZEN1UEROQk56TXc9PSIsInZhbHVlIjoiNktQbTB4RG9pMDEyM1VaUU9vYTdXdkJFMTM5anQzcFRPWS9ZL29UWFNKTzlPcXM0SDlncWg1TjFCUWZYLytVQ0ZydjJWTUFSTEVBcUR1R3BvMStza3BTR0N4MWVISGRydDlUVGtBWExsWFc2cVRhbTh3dGM3WU5jajFieElSMlkiLCJtYWMiOiI5MWRkZTllYjE1NGRiODViNGI0NjUyNWUyODMxOGU4ODMzOGEyZjkyYzdmYzUyMzg0NTBhYjI1ZmJiZGVmMDJjIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlFGLzlONVRYZVQvTFg4RGQ1bHhyOFE9PSIsInZhbHVlIjoiWXFoUDZLeE11ajdEY3FrRzlaZnJwV0lkdEFYd1BvT0syRXE3eDFPTGh5Ky85SWFweGN1Qk10OWFrSnQ5RnhmN2Yyc1ZRL0wxZk5ha2w1SHV2S09PcXdyRk5RYzBZdk5raHFwZ3JCUHlDYXBNS1ArdGZmSVpkQ1NnNGdJYlEwSU0iLCJtYWMiOiJjOTE3NjdjYWVmZGEyZDdiYjRjMzQ4Yjc3MjM0ZGMxZmI4MWIyZTgwYzVmMTUxZDliNGY5MzYyMzQ4Mzk1MDVkIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-01-28 05:03:28', '2024-01-28 05:03:28'),
(3, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"dnt\":[\"1\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=1\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-01-29 15:26:14', '2024-01-29 15:26:14'),
(4, 'GET', '[]', 'http://127.0.0.1:8000/uniform', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImtaYTlYUlZVNVE1Z09CZll0MTdQakE9PSIsInZhbHVlIjoiS0J3cTJqRUtBSlVzZ01RZTc0YWppTWoxQkdya2o0OXpHSjBPK1Q5bVFPVTE5SE84RXNLakJ0dHB2ZkJMbWY5Q1VxZDhsQTlJZ2cwaWF5T29Da2FpREtCMm1ZcHBZb0QzaWJiSys3QURDWTZhWEJMTXp4WFRPaGE0QXBNUFJtQXYiLCJtYWMiOiI3ZjNlNDI3ZTc2ODkxYmZkMWQ2YzFjYzdiNGYxMWZlNGUzN2VkYWRmZTg4MTExZDcxYjAxNjJiYjdlOWMyMzIwIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlRhdUh5L0tQSW5oVWdBRWtZS21YSWc9PSIsInZhbHVlIjoiVlZ4YmdnbjZjdlhBamVQL1RZbDdDSDBNRElCbU0rRk9mNVE4QzI1OGlIdmJKZytjd3hmOUpJNTFMeEljb3FDbkpoMU1HditQSllZQWpnUlNqRmpvNVlHb1lwSXY4ZGl2SE1RblJ0cXBadUplV3J0RWRzZ0kxd2pEYzM2RjQ1QmUiLCJtYWMiOiJiYTQ3ZGZiNzhmMjQ1ZmRmYmU3NjgzNzQwNzk3NDk2ODg0NzBjZDc4OTMxZjQ2M2I2ZTBjZjUwODM1MjE2MTMwIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 2, NULL, NULL, '2024-01-29 15:57:12', '2024-01-29 15:57:12'),
(5, 'GET', '[]', 'http://127.0.0.1:8000/apparel', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6Ikk5cU1UVTUwRGpFKzZEdElqTWc1R2c9PSIsInZhbHVlIjoiamxpSlMyR0JiZXdVTWdYUjY1VHZKc0RDTlB4TllRampGK29oS2NLSlVFa084NlZuWm5xeTZUR1JHYW16di9YbGpZME10U3VKS280cnBCSmU2em11NGdUMjlIM0YycjZ5ajNLR2tkTXpvb052R3lmVUJtNzMwTytWVHFZWXZrSkEiLCJtYWMiOiI3M2ZjODM0YWYwN2NkZjZmZmI2ZDBmYzFkYWRmMjJjNWZmMTIzZTc4ZTU5ODI3MjY4M2I3ZWVkMmVlMDg0NTEzIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImpRYmZ6aDl2eWpFLzdiYXk2V25hZHc9PSIsInZhbHVlIjoiR1BUaC81WkNtMldUaUVTZFJUSDJtbjZoZVRKYmtUbnMzNFdNOGhGSk95aUFITThoRVprWnJhc1lXNUVGcytVYXlMd0J4MWtSdUx6Y3ZOM1cwRE1wR3Z4L0k1VjZ3RmttdWkxaVJTdFBDNkVSUnNieWg3QmtZK3lhcEVyWUNrQkoiLCJtYWMiOiJiNjZiYzY5NDczZDllODYzZTliNzg3NDcxOGFhZWFiYzg0MTQ2ZGY3NGZhMTI4OTkyMTUyNWMyN2RlMTEwYzU1IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 2, NULL, NULL, '2024-01-29 16:03:22', '2024-01-29 16:03:22'),
(6, 'GET', '[]', 'http://127.0.0.1:8000/apparel/gear-and-equipment', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6InQ3Vy9tM3ZVNW5nZlBLeGRibytheGc9PSIsInZhbHVlIjoic0JEeXBaYUdzckNqdzRoZFQ0c3NiTnluY0RUVGY4ZmFXWGlLOCsyR1kyY3QwK0hDUEMydUFXeXE5Z0hPY2wvdzJ0anRMRXdmUFlGVTNvT0QyVmhCRyt6WjFGdFVtUkFhRUhYcEw3RFc1T21YUnRsWWk3aWlibVgxZlZNMDZTT2IiLCJtYWMiOiI3NWE1ODVjZDMwMjk1ZDZiMDFhYjFkZTk0YTMxZDhlN2I2Y2RmM2IzYTg0ODRkOTEwMzI2YWVhYzViNDI1NjU3IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IjNFRGlrUU9qSmJlclNWUysyZmlYeEE9PSIsInZhbHVlIjoiUXlMUUtkVURUS3ZibmF3MUZUUHliQ1NZN3lYQ203K085RFZOR25HSUZkWWEzRkdmZFlKcjN5UjJkbUhuYklzWXMvYk9IcG96SW9MSlhDWG9iMlVIcHpncXc2ZFMrUEdWTEVGbDhqalVoQjV5SXNDYVJqdHY1NmNic1U4K0pnLzgiLCJtYWMiOiJiMThhODYzNDZlZGUwNDNkM2Q4NGYwMDViNjE2YjJlMTY4M2U3ODg2NDlhYjBhN2M5ZGFiYTBjOWJiNDExMGZkIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 3, NULL, NULL, '2024-01-29 16:08:10', '2024-01-29 16:08:10'),
(7, 'GET', '[]', 'http://127.0.0.1:8000/gear-and-equipment', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6Ild4Y0lTeXhqYlhJTHB6NUFYV3cxWmc9PSIsInZhbHVlIjoiRGh2N3prY1RkUjc3aTJndXRzK0IxTUN5Z3V6Mk1ubVpUUDFSSVRuMWFyMDZQTTVyU2UrTWQzeTlqei9xQlQ4MG1KR0Rvd21SZmZmcVZmdFVpWWVvRmI2Zjh6M3lFV0NKQmlKeUZYQ2JPYzUxZDdpYmRIczMwMmtqV050anU5akgiLCJtYWMiOiI2ZTY2MzRlZTRiYzZiODZmN2U2NmU5Y2U3M2FjZWYzYmI3OWVmMzhjMzFjYThhY2VmZThlZjA0MWRjZWY3ODY3IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IjlvR1oza3Iva3pvTXg5OVFXVFBMbFE9PSIsInZhbHVlIjoiaTJmRzhPMGJOeHU1ZmdTWGlqY0JMQWVXa2VTSG5wVW0vL2p5M0w0RmxkNXVRVGd5NmJBK2t6Z0RvQitQUTBac2NNNmUyd2FmN2pKUTFoWWxSOUdwVGhLTGdxbVA0dWZVZno1RVRmRlIvK0M2NXkwY01QbW85RGZsK00rZjBiSFoiLCJtYWMiOiI4ZGE1ZjQ3Y2ZmNWVhYjFiZTVkMmMwZjUxNGY2MDE0NjhkMmJkOTc1OTI2OWY3YjZkZmE2ODlkNTI3ZmIzY2NhIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 3, NULL, NULL, '2024-01-29 16:25:55', '2024-01-29 16:25:55'),
(8, 'GET', '[]', 'http://127.0.0.1:8000/training-and-fitness', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IklEWTFnMzAxWXZvQk84V0ZNUVJuNkE9PSIsInZhbHVlIjoiakNwRCtBTDFad1d6OGJSaXFvbmpkVUV6OXFSRkhkck9ReXBOWnlBVldwQ0tYOUN0RER1NXhaOUs5Z2EwSkQ5QWQrc0ZCVWNRWmZYN1NCZ3BRSlpsMzV5aktONzZqVVBpR3kwQWRxSWxTV3lDWkdsWklvdXpBVkNpei80Q0ZVRHUiLCJtYWMiOiI0Y2Q1ZTY5YzA5MDBiYThmZDczM2VlMWYxMTk5ZDkzMDk3MWVkZTZkNThkZDFlMDZjMTYxYmFmMjI2ZWFkYjJkIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImFXL0QwdTRvLy94K3NFR09RUGJiL2c9PSIsInZhbHVlIjoidWxOTCtOSU42c3BPQlNRYllHOXIrNDVDRU14a2w4NEsxN0ZaMnU1YldOUFQyTXFMVHlicEIrV28rbVYxeGFCMTBRT2Z5UDVkRW5KdFpmL29RT1ZUS0h2ZGU0ZXp2L3d1c1VBdGdUZDZyZEFMQ0oweWNLSTJ2czFlOHVDUmIyNGMiLCJtYWMiOiI2NGEwM2VkMGE1YmI0NzI3YmQ2ZTA1Y2NkM2ViZTc1MjE2NjJhMzM2MDIyOTZkNjg0Y2E0ZTU4ZTVlMDY1ZGZmIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 6, NULL, NULL, '2024-01-29 16:43:39', '2024-01-29 16:43:39'),
(9, 'GET', '[]', 'http://127.0.0.1:8000/themes/admin/default/build/assets/dark-logo-army.svg', 'http://127.0.0.1:8000/admin/sales/orders', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"dnt\":[\"1\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/sales\\/orders\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; XSRF-TOKEN=eyJpdiI6IlJuNGxWbnBNOU5VbjVpaEE5SWJybUE9PSIsInZhbHVlIjoiaGdGWFBIY3ZrNUYrRmIxZk4xRkNnbEV6TTF5dEV1Mm1YWXNsbjNrWmN1TjVDczBkdkg0TEVWcm5HRVRBTDlhQTJuQmowRUlBQmlSZFhKTk1sY1N2ei94T2h4WFRYOHNBUzJ5YmpOTjREL0NjSk5jQTBac20xL1RIMUE5dG5CWXYiLCJtYWMiOiJhOWQ1YjVmYWY0MmY0YmU1MTYxNDAzYTk2NWVjMWMxODJiMTQ2ZWY0ODNlNTMyYmViZjZmZjczOTU1MmU4MmMwIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImJWMkNveTlRUllHMFhsSy9BRTB1b3c9PSIsInZhbHVlIjoiTDF5N056aS95RU5FNHBKdDlMTTNaL01CUzl2NGVSSW55dE84NXZXNzNjaE42MGRwVm9zd1hKMUh0L2VZTVBxV3pIMGpjM1dwUTlzOUNKc0o1MElreUxlRnJUV2RFVXd4bjRHK2NFRFJ1QUlnRWNOTDNPMTRZYjFrVTMzOXpFNjIiLCJtYWMiOiI0NDFhZDQ2OGJjMjc2YzVkNDdhNGFkMjMyNWUzODJiMTExOWNhZmRkOTdmNTk4NzNmZTUyNGI5NWQ2OGUxMzcxIiwidGFnIjoiIn0%3D; dark_mode=1\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-01-30 04:09:40', '2024-01-30 04:09:40'),
(10, 'GET', '{\"sort\":\"price-desc\",\"limit\":\"12\",\"mode\":\"grid\"}', 'http://127.0.0.1:8000/apparel', 'http://127.0.0.1:8000/apparel?sort=price-desc&limit=12&mode=grid', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/apparel?sort=price-desc&limit=12&mode=grid\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; XSRF-TOKEN=eyJpdiI6IlNjeGRnU3kxeTJnS0pEMWVjendZaXc9PSIsInZhbHVlIjoiL2pyaGdCUHozcTM5T0JQMVRLZksyZU1vaTFFL0RoY092NzE4SFhvcnlhTDlVdDFrQy9YbmxYcGZVVlQ2cmlld3FWd20xNjlNclRWc1o1OFloREd6NWFjbG40MGhoc01RRi9IWDZ0bFVUd3YrMFZJbUpsZ3pGRjl6bnhyWk5ZZXMiLCJtYWMiOiJmNWQ4YzZkZjc0NmMwYmFiNjFmNTBlNjFiYTI0ZjAyMjNjNGE0Yjk2YmFlNTMwNzJlMDc2ZjRkMTYwYWU3ZDE2IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Ikptazd3V3FHVVFvR29EeGxRVHU0cHc9PSIsInZhbHVlIjoib0V1OEE2RTlGQ1NGUUZJdmNxMVN2S2EySE16Q3ZTQjIvQ2Fxb3NQN2VJbmdBWDMybXhjQm00dk1PZndYTlhvTktMOVhlRnpSeUptVnVjc2huTEd2bG1IaTFjTHhZNUtMc0NNa0VpVzZJVDlWSElFb0c0TzFrbXE4RzNtNjRNZkgiLCJtYWMiOiJlNWQ3YmI5MTE0NjgwYmQ5ZGRlYTM5OGE1MmViZGFiMjQxMGNmYzIzZmMzMDQzMzIzMGUwMmFmMTFmNGZjMDViIiwidGFnIjoiIn0%3D; dark_mode=0\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 2, NULL, NULL, '2024-01-30 04:13:07', '2024-01-30 04:13:07'),
(11, 'GET', '[]', 'http://127.0.0.1:8000', 'http://127.0.0.1:8000/apparel?mode=grid&currency=USD&sort=price-desc&limit=12', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/apparel?mode=grid&currency=USD&sort=price-desc&limit=12\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkNWNEdpbEZPWWp0L3JNWWNJaVhWSmc9PSIsInZhbHVlIjoicGtGVWRlWUZJendmWFVuaDNaTUsxa1o5bGEyeS9ZeEIvaUVsMFhNbWozL3RhTUdyUi9ETTlwcTNnNkQ2UEFZNllZL3g3aUhmR1RlZm5RdkVTMjdic05RV1lSeGlIaURlSUtZR1lhSGlLNDNqdXFrZUNyTjMvSE4rZnNERHY2eE8iLCJtYWMiOiIwMWI4NGQyN2VlNDlmYzIyMWI3MGFiYzAyZjIwNDY4MTMwYmRkYzYyZTZiNzBiZmZhOTc0M2JlOGE2MWUxZjFlIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IkdMYW9QWDgyQ2VHUzlydlRiSjhXcEE9PSIsInZhbHVlIjoiclhiQWYzcnlmcW9lMXNJN1N6Q2c2Y2dpRUdqYWlrdllWVlRNZGRRemtZUE4zbmN3NU9tL1dsZ0FMemJRc0Jham4rYVZrUE9aSUhhaWJTa1F5L0JIV3pmaVNwb1VWVXBpcFRFWERLb0JVZ0tuOUhubko0UElETWdpMlVZb2JwNFUiLCJtYWMiOiJhYTc5ZDRkMmU5YzhlMTVhYTBkYWM1NzhiMzYwNzM3Yjg0ZWY4MjVjNzJlYWY2OWE5MjYxZTk0YWYzMTc0YmU1IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-01-30 04:13:24', '2024-01-30 04:13:24'),
(12, 'GET', '[]', 'http://127.0.0.1:8000/gear-and-equipment', 'http://127.0.0.1:8000/apparel?sort=price-desc&limit=12&mode=grid', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/apparel?sort=price-desc&limit=12&mode=grid\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6Ims3VkZPV05pdEZWUkFJeXJsWU9Ea0E9PSIsInZhbHVlIjoiZXBybitzRzRMQXc3UndOaUxvVEJqdGJmY1lKWUdVbTE4RFlMeEtOVmpwbHVFZ21OOHc1QXhKTFF3aktuZUhxT1BKTjVGZzBTbWZzMU9SZHlrcFQ2SFl6d1ZuYVFtZUlHTlBPa3BnUWtSUE9UU0dRU051NkgvSW1idlM4NEJST3YiLCJtYWMiOiJhMzk2NWY0ZmRjMjkwZjlkNmIwNzk1NWQ2NDI2MjE4MDkwZGU2NTY5NTU5MjJmYjYwZTk3Yzg4YTYxNWY1ZDEyIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6InNkOEF3WTlaVVRBNnA1cTNYaHFvdFE9PSIsInZhbHVlIjoiak83RUtzSkhZcURwVmJiRm9CdTFBdE83TDNwSE9xNDM1STMzZXVYS08rZDlXbEI1UDc4cklqN3JwKzlTSkcyU1QyMDhQMUV3Y3dPK2JwSDZxMVFTbnJ5UWhDYyt4MDA5eFp5RkJjUk9hZXg0S3l0VHo0Uk5BNlZrRXlkUGFGcWUiLCJtYWMiOiIzN2ZmMWMyZjM4YmNkNzY5NmY1NjU4ZDJkMWRjMGQ2NjA4NTFjMmFmNzkwMDBjMTkyZGQwYjdmMmI4Y2VlMTI5IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 3, NULL, NULL, '2024-01-30 04:18:54', '2024-01-30 04:18:54'),
(13, 'GET', '[]', 'http://127.0.0.1:8000/apparel/uniforms', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImhyZ0xZSzMxcmtWc1hydTFpWHhyZGc9PSIsInZhbHVlIjoia0tJYzg0N0JCOHVNQmZHT2o3TUNISDV4VW4wZ0NZakV5R1REMHgreTliVlFBdmpFcXk4bkIwczJmdnc3dEFZUVJKZ3VybmdqVzVpWFhIZG5KeFpRbGdLbXBmK09oQXJsZkl1UUdubURGNkdKTFM0WUlmb3oxekN5VEZyYzFMVDMiLCJtYWMiOiJlY2ZmNDE4MDgwMDVjZDBjNTIzMDUxMzU5MWZiZWUzNWVmNjlmY2FkOTAyYWFhODZlMDA4NDY1MzMyODk5OTFkIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlRQTVA2YjMwRm83ei9sN0hoV2ljeWc9PSIsInZhbHVlIjoiYTJSSzF4Tk4wdThqcnF3N1dnOUNmZUZOaFRmeEI5NlVEclUyZnBiSXBaS1ZjdG9xK0J3K0ptYk10eWlnUkYxKzd0NDArc1FlQXJNTWlKKy9qdGgya291U0RpYTIxRE9VWkg5ZFJ3dWtOTlR5NG1adHhXWTVIRkN5OGQrbjhYT3ciLCJtYWMiOiIwZGJmYjEzMDc4ZjE2YmNjMTk5MDFjNTU2ZDhkMjEyYzU2YmE4ZmVlYTU4ZTMxNTA1OThmMDZkOTZiZmY3NGQ3IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 8, NULL, NULL, '2024-01-30 04:45:36', '2024-01-30 04:45:36'),
(14, 'GET', '[]', 'http://127.0.0.1:8000/gear-and-equipment/tactical-vests-and-plate-carriers', 'http://127.0.0.1:8000/gear-and-equipment?sort=price-desc&limit=12&mode=grid', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/gear-and-equipment?sort=price-desc&limit=12&mode=grid\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6InZzMmlUbjFmY2NIemNSNWFYemZIc0E9PSIsInZhbHVlIjoiUDVhd1ErR2ZWUjhqQXMxQzNwaXhueVlKRnJhSkVYN1JReE5ndEZ4NzRMVEJuM3FpaVJtanFaaWFMcnVsOHc0Um1FT0lybndadk4yMnRPUGlkOUpDMGhNaXdDRDVDUkxvcjNySGtPYXBxK1IvakVOT0hydWJXSXRUMDFsbnR2R1EiLCJtYWMiOiJlZGYyYmI3MWU2NTRjMGMwMzFmYTU1OGQzZTc4MTZlNzdmOGRhMGNiZTQ5ZDBjNTA4MDk2Y2IzZWQ3YmMwYWYzIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IjRsVE02ZkRNY0pVcXByRWI2QUNGMnc9PSIsInZhbHVlIjoibVZ1dmg4T0xuMDRoeERiRFdwMXBFS0JsU28xNWVvdEUzNzl1Zk1CeWlBS1B1aUQ0V2Uza3Z5blRHTDZSa1RFMURyVVVpZzdiT2V4dVRPenlOajA2MjNETzhkVDQzY2lBWGs0NTBlK0dES0NzckFXT0Q0SkMxY0JjN2FYckxWcCsiLCJtYWMiOiI1MzEwYjIyOTNkYzVmMTVhZTE5YzVjNjEyMjExMzA4MDA5NGUzYTEyZmY0YjRlYjExMGMwNmE5YWQ4OTlmM2E4IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 14, NULL, NULL, '2024-01-30 04:59:00', '2024-01-30 04:59:00'),
(15, 'GET', '[]', 'http://127.0.0.1:8000/firearms-and-accessories/rifles', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6Im1FN1QyVktIL2t1VEdGcDU4bnRZMVE9PSIsInZhbHVlIjoicWpOQnVNTGdCWkhiWm5qZ01Lc2Z1ZjUzbmw0aDdFQVNUVG43Uk5FbC80TTJYdVlmOU1qbVQydWMvZmJXV0I4bFNpTWgwak5Cb2pHQ29rTEpRUEhJUjJJV2JpeUU3V1gyV1JQNVN4ZEt1NmxXZndwb2ZIZWh2cTYrVVRmdWhMc28iLCJtYWMiOiJmYjRmNzY1MGRhZDkzYzNjMWIzZTQyNDM5YjFlZWUzMzU1YzkwMmUxZWUxZmQzM2Q4NDMwOTNlNDBkNTk5NWNkIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IkcrSVQ5d0FYM2R5UHBXMFZHL1Jua3c9PSIsInZhbHVlIjoiS045NnYzUGQ5UjFycnhFQ0tHbEp4SHJzMGl4NVNKL29OeGtiTXFoczdIQ0VRRjVUdUVBOVhQY3p0T3ZBQVRWVmk5RmR6Nk5QOG9JaUE5QXhPVTZwS05UMVVOekt4SFEwa1AvSnE1Q0MyU2thbDYxVlFWUmpVbHhyS1UzNGQxQ1AiLCJtYWMiOiJmYWU1MTliODlhZTNhY2Y4OGVhYzc3MmJiOWM5YzZhOGMyY2ZlZGQ2ZTBkN2RhOGIxYmFjZTMyODI4OTc4NjY0IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 20, NULL, NULL, '2024-01-30 05:21:23', '2024-01-30 05:21:23'),
(16, 'GET', '[]', 'http://127.0.0.1:8000/electronics-and-communication', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IjJxN3pyQjU1NnU2VmF2YWlSMWcycUE9PSIsInZhbHVlIjoiYS9HOXIrZTRwUlI0RDg1cmQ1OHM3Wlh4K2F2cWEvZkE2MDk2eFZCRnhGUXVuRUNaa1FYVjZVS0lESjV1dDh5cXZWdEFFNmx1Mk5EcVQ1cDFxakl1YUhKNjZ3b1pvc0U3YjFjN3c1K2xIbThxbTZGVm03UCtiUWdQaXA3elY2SUwiLCJtYWMiOiIxZDRlYzU5MGZkZjdhNzE5ZjY5MjM4NDdhNzFmZGNjYTg2NmVjYTczNTY3YzBhYmE3ZmYyODU1OGQ3MjczODQwIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlhNSGY0dk1zWU1acDRNeGVQaFc2dFE9PSIsInZhbHVlIjoiTGxNdkw5TjdWODZ1aWE5emt5TWpONGdrdnNKYkR5aE9GRG1nYTdwUW9HMjlocitDamFyekFXMC91MmJ0bnpFN3hyUzhPaGtpYVppY0dsalpuYnBhY0t1MlVuS3hIV25sSFgvVXhZeUt6elFMeVEvaWZZV0ZTa0E1VjhkWlhrMUEiLCJtYWMiOiI5NDBmODFkOTcwYTA3MzI4NDVlMGQ1MWJhYzFhMjFkYzI1YWQ0Y2U5Y2UxNWUwNTUyNzU0ZjVjNWNkMWE4M2UxIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 24, NULL, NULL, '2024-01-30 05:51:48', '2024-01-30 05:51:48'),
(17, 'GET', '[]', 'http://127.0.0.1:8000/backbone-mens-army-military-battle-dress-uniform-bdu-shirt-camo-top-jacket', 'http://127.0.0.1:8000/apparel?mode=grid&sort=price-desc&limit=12', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/apparel?mode=grid&sort=price-desc&limit=12\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImV1alV3eHc1cXhSUEJCbUM0bHFhenc9PSIsInZhbHVlIjoibHR4b2ZSVDhMRDYvUy9CQWxkNEZLa3oxeWZHUTlnVjNDWlNVUG5LcXpiNWRsM0FsT25zQmtjYzAyMWZScXUyV0krdTVCbzU4UXg2NC9LajZhelkvRDAzcWxmS3Vna0Rsejd0R3crbmw4MHVBemhTVzM4ZGdUbWlneHA3MGpEdnciLCJtYWMiOiI4OTQxOTg5MTZlZjBiMjBiNTI1NjM3OGVmNTVkNjlmNTI4MjJlOGY5N2VjMzQ4YmU5MzUzOGRlOTUwMzVkMDZhIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImVYL1ZWOVRTQm9EaEdjandYemZxSlE9PSIsInZhbHVlIjoiSElkeDhXOWN4TTcwOUxmR09xTUJXSGlCckM2ZFRIUjhjUENGWjc5L01xeXNmTi9tNERyb05JR2NjRXpxMlpBQ25PQ0xKeC9zWmVzelB6WHBUMDkyRlA0S0lUbWJYQnVnRkk2MnplOEJBdXc2M3E2ajRaM2VCcElPcUlTRmlhTXciLCJtYWMiOiIyNmFiMWE2MDdhNjBlZTRmYmQyNTQwMjlmODAwODQyYzUwYzkzZmY4NDJmYzFhZTFiMWNmNzhiZjU0OTU5YTFmIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, '2024-01-30 18:38:43', '2024-01-30 18:38:43'),
(18, 'GET', '[]', 'http://127.0.0.1:8000/carwornic-mens-tactical-combat-shirt-14-zipper-long-sleeve-camo-army-military-t-shirt', 'http://127.0.0.1:8000/apparel?color=18%2C17&sort=price-desc&limit=12&mode=grid', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/apparel?color=18%2C17&sort=price-desc&limit=12&mode=grid\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IklPTXRyOGYzWGxUQ3ZwRGFGaVlxSlE9PSIsInZhbHVlIjoiQnBWM1ljYlcwSzJ1YmUzL0hsTGlEMncrWi9saWhSeWZrUGZXamYrZUZCQkJ3dWM4VDNmZmtWbU1WUHk5UTVoNGVoN1pxUDd0VWk5eHZuY1NQcG1MeVNkS0habmxVNGY5WHlieGRYY1AzaGhtcWhGTUlxaVowak1aMVRmVnNLcGUiLCJtYWMiOiIxYTlhZGM2NTdmYzhjNjRjMzdlYTQ1ZGJhNmRhNzc0ZDk0ZTcxNTBjNmJiYTljMzAwMjRlMWUxNzdlMTkxNjE1IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IkhLdFhSNXVPbTdSNlVMS1F5OHREdmc9PSIsInZhbHVlIjoia2xJajR6MmtrV2lvcDRYdDJtdS9weGh6RFdjekdOV1BqUmpXY2JsY05SdlRDQUJVNzUzelp6dVpMS1lwbWgyS2RhQ1V5SGFuUlhLS1JYRythekJxcy93WHMyRmVSSEF3MDAvdjc4K2VMOGdZV1NIUk5XV1BCalM4RmpoaE5ZcXciLCJtYWMiOiI0YjJjMzc4NzZiYjY4NjRlOGVmOTFjYjIxYTEwYWUzMWVlZjBiODcxNDVmMzFjYmIyNDk3OWRlYThjN2E1ODZhIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 2, NULL, NULL, '2024-01-30 19:00:29', '2024-01-30 19:00:29'),
(19, 'GET', '[]', 'http://127.0.0.1:8000', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"dnt\":[\"1\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; bagisto_session=eyJpdiI6ImdrVXVBWkFDTDc0emhONTdKbFUxUkE9PSIsInZhbHVlIjoiaUVkWmx4dXQ0Vm11YXNoME5QQ2puc3dGNm9qbml3U29OakdvWFF4VjlZN1B6Z1MwM1NjT1djamo1MHloVTg3TXpzZU1OajRIcHVqSE9DUWZLQnl5OWZUT2E2TXNnTW1XMnFwS2tLYmhKZ0Q0RWJ5RWJzZzRMRW1mMTQwU0R6WXgiLCJtYWMiOiJmZTEzZWZhNjQ4NjkyMTUxODc3MWQ5OGVkYTgwMmI5NmNmMjA5MzI1OTBhZjA1MjI0Yzg2ZTFhNmRiYThiYmFjIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-01-31 12:54:22', '2024-01-31 12:54:22'),
(20, 'GET', '[]', 'http://127.0.0.1:8000/backbone-mens-army-military-battle-dress-uniform-bdu-shirt-camo-top-jacket', NULL, '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"dnt\":[\"1\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IjBLRlFNV2swMG9hRzhCU1YyK2FOZkE9PSIsInZhbHVlIjoiQ1RUdVlqQkVQcXo3NGNRZThROEY0Q2Q2bzVmam9TOHYrRmtSMFFWbVdxSy9lM2w4ejVzem45dVRucE42YWl3NXVsSnZQNFBXbWlQUFhxNEVYZDRETGxNK25rUGJ4aU5LK1JMckZkcEVBY0g3NGZ1NHkwdFVCUHFpV3BnNFcrWU4iLCJtYWMiOiIzYTk3YzAxMTc4MGExMDE5OGZhYTY3OWZmN2MwY2RkNzExMTZlNGFlMjMyNDA0YTlmMDEzYzRmOTYwMmQ0MTcyIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, '2024-01-31 14:41:53', '2024-01-31 14:41:53'),
(21, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"dnt\":[\"1\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkJmalV5cWc1elNRa0UvV0NQRnQxOGc9PSIsInZhbHVlIjoiK1N3dG1xMG16UEliRWZwcDJzR29oODhONWhpQmZzbUtzME41L0lORzJ0d0ROY3M2WUhRK1VoRktzUlg1NkM3VHR6K3pnRjhjY3ozUHpOSThWNUtZWjk4NlU0Tnpuek5UTVB3TGZKUy9kUm9wNGptTFgwQ2xkWkkvUnZlSFdLL1YiLCJtYWMiOiI1MTkxNjg0MDQxNWQ0NTEzMzE5MmFjZDE3ODA4Yzc0Y2M0ZGUxMzYxMjdkODAxMmM5NGIwOGJiM2FmY2MwYzFiIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Ijc4RXpWUTNvNzg2UWdUNmU5VjVOVGc9PSIsInZhbHVlIjoiWGdnaGNiRUhXTEFHTXJFTHM0UXc3SkdlRFBvOU1wR3RpMGhGNjk2OFdCdW9UUG4zOGZxQWlqVTZtU3lYNEk3TTcycnBOaVJzbi9UOUNhK2RuZSs0eDZRS0JvNU1XdVVmdTN2d282cjljUHhwOEI0R2o4VnFZTnd2UDk3K0FIR0siLCJtYWMiOiJmYzUxZGQ4OGEzY2NmMmY4Nzc2ZDAwM2YzZTljMmI1MjFmOTAyZDkwMjBkYTc1OGMxYmY1MzU4YTA1MjExNmZhIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-01 14:50:43', '2024-02-01 14:50:43'),
(22, 'GET', '[]', 'http://127.0.0.1:8000', 'http://127.0.0.1:8000/customer/login', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"dnt\":[\"1\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImQzOGZSWFNyaFFaVGpwT3hJMForbHc9PSIsInZhbHVlIjoiWWZrL0UrUExpcDJidWxwbWcvWjU4RWRxKzNHNFZ0Q0RWZlg3Y0cyZ1psa0g2VnZUWTk2UEU0QkRod1BwRkNyRTFFdzNhemZaaTJsQ3lERjB6bHVDKzZITDR6Mjk3RGZJOXFHbVBmMWQrMW5mYWtMak9vYVNZRHpsekw2Sm5DcU4iLCJtYWMiOiJmMzc0MmFkYzA3OGYzNTZhZWFiMjIwMTljMGY1NTRjMmQwZGZiOTQ2NzY2NmFiNjdhMjhjZDZhMTU2NDA4ZGQ0IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImZZUFZydVkyQUhDeEMvcWM2eXplSlE9PSIsInZhbHVlIjoibUg4c2dKTkVmSFQ0akU0QlEza2srRkRtZ2tpTENZZ2NrcjUra1Axaldtdy9pUkhzcm51MjN0V3ZxOFl4RUFhUHhYNkN3V0Q4aElXZjBYZkNNZWUwc1hSclE5bVlmdzRsNlJ6cjQrenhGN2ZWSHRJT2hoQ3ozSVd4SGd5MzJmbjMiLCJtYWMiOiJmZTcwMjk4OGJjMDYzODA5MjU5YmYzOTUxYWIwOWE4ZGNkMTFlZmRkZDAyODI2OWU4MmIzMTg4NzkyMTQwYjk4IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, '2024-02-01 14:57:03', '2024-02-01 14:57:03'),
(23, 'GET', '[]', 'http://127.0.0.1:8000/customer/storage/locales/en.png', 'http://127.0.0.1:8000/customer/account/profile', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"dnt\":[\"1\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/account\\/profile\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IndjRTFRRktVOWMrV2Nabi9MdlJKL2c9PSIsInZhbHVlIjoiSit3dk9yZU5hWERsaVFvM2pjaHZmT0lzZG5DcW9ma1BJdmJ2S1NXbENFODBFeGdTc25QQ3Y3WGlGclN4dy9vVUlaVnEycFVEdC84NzZ3RzUvMVJaSnJOZ096T1NrLzZyRm5GS2Joa3MvZ3J1V3JlaGYyQzAvR2d4NVRSYXNFYTQiLCJtYWMiOiI2NGRhOTA1MWU4ZGI2MGE1ZjVmMGM1Mjc3NWYzYzRhYTEyYzMyYjMzYjNjODQzOTliODU1Njg1NmQyNDhhYjI3IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlorQy9vMzhkUzY2YXJFTi91c2kzeXc9PSIsInZhbHVlIjoiblBSWTFUTG42Sm1FRGRDT2JvS3VCSHdIeGIrZVl4UXJUTlpqR1ltdDE0bVRObWY0SDRnOXFzcEsyYlNyUDlWTjNRZVBtMEJ5UjEyVEtOME1SdWJLWjJmdEE2cTllbHJWRGdRYUZoeDVPVmpLb1BqekwwQ0tMQkVDS2JnUVR1dXAiLCJtYWMiOiJhZGE0MDI5OGI2OGY3OTU4M2M3MDc3YzY1NTY2NGZlOTFhZjIzN2I3Nzk0ZGRjNzhiMGYxNmYxMWFkYzg1ZGNlIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, '2024-02-01 14:57:46', '2024-02-01 14:57:46'),
(24, 'GET', '[]', 'http://127.0.0.1:8000/apparel', 'http://127.0.0.1:8000/customer/account/profile', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/account\\/profile\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImI3NjFGc285S3EzQWhnNFVZd1Q3SVE9PSIsInZhbHVlIjoiTTBKOXFhK29KU1JzMHh1WnZsQ2UyU1k0RHRtTkZ5Wi83OFQzZUJWVnM1cXhhYmoxRXpCWUZHTzk2bGRHbFNtZnBDZDJ0L2xVdVl0bEFSdlhUS3JITVpnRFYyQjBoRXpTKzI2bEs2VVBJQzBBck0vcW4zNytvTXhTWThuRUJnTFUiLCJtYWMiOiI4MzU5ZjA0MTY0MjRlNGI2M2YzZWZhYWMwNzFmZGQ5MGEwZjc3MWRiZTg1ODg1ODM4MTgxYjA3MThkNWMxMWVmIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Iit4QlI1RVByNEZsaVhOWGZWOGdJZFE9PSIsInZhbHVlIjoiaUp2Z01QTExHK3dGcmcyZVlCalVuUlV4QmF4ejJ3bFcxQVl4UUFqUGI0aUVwSHNXY0d3cVNuZXhBK240Zjc2TnEvM25oQWlsN2ZBdkppSXkvanNoZUtWRUFtTGp2NFBrb29EMXFLUERZWGxMdGp0RUFlVlp4MEREbmE5bUl0VDEiLCJtYWMiOiI3N2UzMWI1MDRmZDhjNjNkYzM3YzQ3ZDE0OTJlNjgwMmVmZmYxODNhNTMxMjI3ZDkwNTFkZmFmNzg4NWYzNTI5IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 7, 'Webkul\\Customer\\Models\\Customer', 1, '2024-02-01 14:58:08', '2024-02-01 14:58:08'),
(25, 'GET', '[]', 'http://127.0.0.1:8000/firearms-and-accessories', 'http://127.0.0.1:8000/apparel?sort=price-desc&limit=12&mode=grid', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/apparel?sort=price-desc&limit=12&mode=grid\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6Impuamgya1hqeURLUGxOY0VvVHJybVE9PSIsInZhbHVlIjoicmFpOFNtc09wd3VzT1d4akpwS25JaU9WS3F5elJqeWxwNWJCcVlGSllaUUtHR3FnZ2cra05xYlVBRi9sT1hsSTloMWoxd0hjcEJxaGExQjZGR2hGai9lcm5JcEYzZmpBeEgrUFFFbG9xVDFwUk1ydjhPOHRQbHpvV2RkVTFueGMiLCJtYWMiOiI5ODE2OWI4YTQzMmJhOTgzYTdmMTcxMGMyZjMyOTRiMWE2ZmE1MTQxYjczODAxYjE3YjcwYzY3OGEzNzQwNmVmIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6InVrQzBLYVo1YjgwenBrU3A3UW5tTUE9PSIsInZhbHVlIjoiRWtFUWxOUVhVbU5VL2lHd3IxdUtGSkxhL2pYMXNHTElLNDZmUEtPbm9ISVZxVGlUcEpNMm10SjYvb1p4bXJFQzkwMG5ueHRpQVFYNy9tTG1hUXBhOTNrR2tpMytKOU83VFZaU1VBc2VqV09rVWpPNzREVmsyWXg5REZsaURrckgiLCJtYWMiOiI2NTE4OWYzNjZmMGVhZDVkZTBlZjM1ZTAxMGUxY2U4NTA5MzY2NmNmNDk4YzQ4N2RkMjg3ZDRmNzZjN2JiNzlhIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 18, 'Webkul\\Customer\\Models\\Customer', 1, '2024-02-01 14:58:24', '2024-02-01 14:58:24');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `created_at`, `updated_at`) VALUES
(26, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"dnt\":[\"1\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-02 14:11:27', '2024-02-02 14:11:27'),
(27, 'GET', '[]', 'http://127.0.0.1:8000/storage/theme/1/2.2.webp', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"dnt\":[\"1\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6Ik0xRTE0L0pYNE1xbm5McXFsSXhKdUE9PSIsInZhbHVlIjoiU0ViQTVOQ1RSMkIyWUwxbXZrUjBCbUkvakFja3Mvd3RUMnlkYlZwc0lyeDJJclZaZkt5Z0Iwb3BaV0lkR2JnVnVQWGNTYmxDY1AxSCttU2h0WjVjTnNLajlhdWZEclBXeWdBdVBYN2gyS2pJNmxJckZyZndMV1hsVks0czVKc3EiLCJtYWMiOiJlMTc3ZDZiYzk5N2IxZGY0N2JhNjYwYjdlNGZkN2M2NTA0ZDZkZDgzMjkwMDdhODc2YzY5MzFkZDY1YmQ2MTg5IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IjdETFY1NFhsbnB6OTl0cnRPZzJXb2c9PSIsInZhbHVlIjoieFpPc3FPZHYvS0RLbTM1VGZSanJkNXJ1RytDU2RDKy9OQUEyZXJ3MDk3SjFKeWJyaUMrMnlsRTR0THJsZms1MjFiOWtvd2xFYTJSbjk1N0g1OGNMTmJ1Ri9jYkZaalRkQlFVTTJhYjNRU0hBcC9uL0Ztb2p1VGcrUEJPTE5xcWgiLCJtYWMiOiIwZTkyOTViMTNkOTNmYTg5ZDg1OGZkY2Y5ZGMyNmNmNDYyM2Y4M2E0OTkwODRhNmNhYmU4NDg1OGUyYmUxNmViIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-02 14:40:51', '2024-02-02 14:40:51'),
(28, 'GET', '[]', 'http://127.0.0.1:8000', 'http://127.0.0.1:8000/page/customer-service', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/page\\/customer-service\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; bagisto_session=eyJpdiI6IjliOG1YZjNyMUFLWWVZckxkcHBDN2c9PSIsInZhbHVlIjoiNGNoYlpxRzhUS1c4TDd1OGFQUTE3ZFVSM2t1MDJ0Z0h4eDR2SVNZTS9vVjdxaFZnb2J2Q0NwRWFCbzhJaWRGbmNsWUltNUxsaTZCb3AxOGdpaDJTNVBQd0RocTJxandUKytUakhjZEpiQkpFVGtELy9mOGN6eUY5RFBabUFORFciLCJtYWMiOiJjZGYzMmUwYjlkNDlmNGI0NTQ0ZTVkNWQ1MmQ1ZmYwYzMwM2VkMGYzYjVkZmQ1NWE0MjgyNDM4ZGFiNmUxYmQ5IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-04 21:33:27', '2024-02-04 21:33:27'),
(29, 'GET', '[]', 'http://127.0.0.1:8000', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"dnt\":[\"1\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; bagisto_session=eyJpdiI6ImxrenNzZk1Ja2tLMTA5SWlHc1JnVWc9PSIsInZhbHVlIjoiSmVNMVZxa2xPNnI4cUE0NzVkaGg1WkZWc3ZiYTNONHhqcDFOVFlnYkFlaU9RVGI4OTRsY1V2ZUZuVDBRL2JFS2taRHpiKzRNNVZMb1VYQjIzaXJPdFBraEJ3STFWT1NaNm1GRitEa1BLem54R2hWRHZVUkNqWTV3NWJoZ2c1M1ciLCJtYWMiOiJjNzJjMDdhYmE5YzYzYWRlOWU5ZTg4Mjk0NmE4OWYyNjNiZjI4OWYyOGNkMDQzM2MxMTQ4NTBlNjkyYjhmNWVjIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-05 14:42:30', '2024-02-05 14:42:30'),
(30, 'GET', '[]', 'http://127.0.0.1:8000/gear-and-equipment/backpacks-and-bags', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImlWQ2JjQXpXYUFCTFRvOU1pVVJMZXc9PSIsInZhbHVlIjoicnZtNXhrT3QyQzlsSkR4ZVV4Q2l0S2JhSlBkWTVuc0RnV21UTU1tZ0lIQVVXd2c3VVVJcStDN3YybUt3UEhMeFE2UTRRclpBR0hrSDRtUDkrM1VtVUsxdVhSMXIyeXpQRzdQZCtoc1NFL1dIM3U2TmVBU2NsRkhsdndXNnNLTWgiLCJtYWMiOiI2NTY2YmYyODRiZGU1YzhiYjg0Mzg5MGM4MWI3ZTllZGFmOTNmYmUyMTQ4YjczZjQ0MGU2ZTM0YmM4MTgyMGZiIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlFONEdLbjdyWWowalIzY1Rha0p6SUE9PSIsInZhbHVlIjoiOHBOSHZ0bHhrVVRWMElFYzk5MzVteUMvUk9GU0ZyME9sRHNmc1V4Um4vWDlnNEFvUWswODl4ei9Nejg4QTQ2QTEyZ0o5U1dGYmp6aFhkelR3WUtqaCtzUlpZeXcvZzdDT0dFTDI2N3BUUEJEMHF1YkxnRWFnb3hyamF1WllhRGQiLCJtYWMiOiJiNmIzMWRmOTIwZTQxNGUwYzZlYjk2ZGRiYjM4Y2ExNjQxNjEyY2JjMTE3MjVkMGZiMWM5Zjk1MWFlZWNiMmUxIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 15, NULL, NULL, '2024-02-05 15:35:38', '2024-02-05 15:35:38'),
(31, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?1\"],\"sec-ch-ua-platform\":[\"\\\"Android\\\"\"],\"dnt\":[\"1\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Linux; Android 6.0; Nexus 5 Build\\/MRA58N) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Mobile Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; bagisto_session=eyJpdiI6Im5yTTRuL1h2aGViU3JTL1NSaithTlE9PSIsInZhbHVlIjoiRVlpcHo1elR4b2FicS81dHZTQ3l0L25oWDYzY3pkV1E2RXcwQlV6emt6bUtEUGFMTjlJQ0pZMExjS1J5Sll6WGNHaDl4SEpvaUw0SnRrNTVROU9RbktsR3FBcW1xRk5sQnZBV2cyTVplR1BSNVhXc3R0S3ZyR1VkbVM3cGJJOHIiLCJtYWMiOiI5YTIwNTAwYzk0MTVkNmNlZjY2YzQyYmRkNTgyZWM3NGYxZTI3NGU5ZjkwN2FmOWQzNjc5MjIwZTY3ZDcwOTljIiwidGFnIjoiIn0%3D\"]}', 'Nexus', 'AndroidOS', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-06 03:45:54', '2024-02-06 03:45:54'),
(32, 'GET', '[]', 'http://127.0.0.1:8000', 'http://127.0.0.1:8000/customer/login', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"dnt\":[\"1\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6InNZeENveC9pOWQ4NGYxZnpXb1pUNnc9PSIsInZhbHVlIjoiaS8reWRua09VUXZFMnQ1YU94SlhrS0dFbjcvL3dnbzlJVncwMFg1VjFWQ1RBT2drTDJ5NVlXVFVqSlVaRFd0UTZrNlZZaW5iekJ0SkhJdnFqNzMyU0ZFaGg2S3FBOWZ5allZRHZBWHBDUmxyaFlmaFduNERJV1dSSDkzUE1jVnEiLCJtYWMiOiIzMTJiNjVmYTYzNDVjMWUyNjM5NThjODVhYzUyMGU5OGY0NGFmNjUzZmM2NjA0NzA5MzBhNDY3OWJmNjhiMWNlIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IjRmOGNxT1E5V2g5V0o5Mi9NVGxQZHc9PSIsInZhbHVlIjoiNmxzbGRQWlhjSnljdUNRV1hqb21wend2QnBINE1wdUNwemJWdXFaREpRTzR6ZVFJTDZuTitSWXp0NE1OZ0VoQ1hieU1aTE43azlNa0lDc2hZQ293SXNKUFhMbyswYnB4T1ZvUk1KK2pZL2hwclA0WENoRkVkZXJ6NzgvZkM2UnEiLCJtYWMiOiJhYTI0ZGY3MGQ3MDE1NzMyZDIwOGMwYmJjY2IxMDk5OGY4OGRhNTBkNDRhYTBmMzk4YjllM2NhNjY3YWI3NWRiIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 2, '2024-02-06 13:35:06', '2024-02-06 13:35:06'),
(33, 'GET', '[]', 'http://127.0.0.1:8000/apparel/tactical-clothing', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6InJ2UzZMSDhPTFpaT2tWeE4zN3c3M0E9PSIsInZhbHVlIjoiVGplUWRqeThNcnkzc3R6ZEE0NXBiaTB0QWk2Z0hndm93eHpzdElNN0k1eFIwdGluM3VqWlozYWxpVnBoVXkwYkVBbzFIdTNlaTA3NkRIZlFGSDF0RDBSZmw4emllYXFTSSs2M0pRNlBLT2ZUQS9obDhoYjJ4SVpJZ0wzanFNelgiLCJtYWMiOiI4MTExZDYxMjliNTU5OTgwZjE2YjgwMmZkZGRhZjc1YTFjYTdjMDI2YTBjY2Y0MThmNmVlNzhiODZmOTRjOGRjIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IjBrcWJ1QnBlRGozZW5BeVhZamZVd1E9PSIsInZhbHVlIjoiaTZleVVFZHBMNFFaY29weE94eGJ6enIrU0pXVktGWFROc1NjdDhnblJpZFRCTFBoSk1ycitNM1VqL2QyVlYveWZSSEluUW9EZ0FqSWJ0Z2Fpa2hjd1ZCczhkSmcrSVFMalRHSVpnTXk1SEhiQWZ3V01WVjJnT3F5Tm5BMUpjZ3EiLCJtYWMiOiI2YjFjYjY1MGZkNmI2Nzg2YmEwY2ExNDI5Y2RlMDc0NGVhZWYxYWFlYzczNTcwMjQyMDIxOTRmYmFkMGUzN2ZjIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 10, 'Webkul\\Customer\\Models\\Customer', 2, '2024-02-06 13:35:57', '2024-02-06 13:35:57'),
(34, 'GET', '[]', 'http://127.0.0.1:8000/apparel/uniforms', 'http://127.0.0.1:8000/apparel/tactical-clothing?sort=price-desc&limit=12&mode=grid', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/apparel\\/tactical-clothing?sort=price-desc&limit=12&mode=grid\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6InJnNmR0UUVHK1FhejJFR1cwMTR6cUE9PSIsInZhbHVlIjoid3dTOTBVVlJJRU9NNlgyQ0lVSEV2WkpWY0xkVWloekNpTVkzVkVWdFZtNldGQjM5ZUZnclN4TllBTUpEbWFuak11Y0tqVllXWlcyb296b0NWU3JCZFBFc2xFcFBZRkZzaEVOOHlIMzRhTUg0bllGaHNUL2VNM2wyc2F5WFVaWUEiLCJtYWMiOiI0NmEwMzE4ZTg2MjhiZDVhYzQ4NDdhMGNkNjhlNDFiMzM0MWQxMzA5MzkzY2I2MmY4MTQ5NTA5YmEzNjUyY2UzIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Im1BWEx1YzB5aWJidlBmRnlERS9OcUE9PSIsInZhbHVlIjoiZWhnTUxiNU9DTDhUVU5WZTU4bHJQVVYrSWZIUGNYQzlRc3RjeWZla29GZ0FBS0piSGFrY1RlTXdrdVNqcThLb3ZJaUxNSWlsOExpRDZBcVdUMTNTZWk2RVo0Q29SbGN3YnNrYlFieWZkeWppK25WYUNBTXZaVThkL1B4Z3JCalIiLCJtYWMiOiI3N2JjZWJhNWFhZTYxZTUzN2MwOWExODdkM2ViMTU0ZmRiMGJmY2M0YTBkZjYxY2M5NGQ3NjA3NmY0NzFjMWI0IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 8, 'Webkul\\Customer\\Models\\Customer', 2, '2024-02-06 13:36:13', '2024-02-06 13:36:13'),
(35, 'GET', '[]', 'http://127.0.0.1:8000/backbone-mens-army-military-battle-dress-uniform-bdu-shirt-camo-top-jacket', 'http://127.0.0.1:8000/apparel/uniforms?sort=price-desc&limit=12&mode=grid', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/apparel\\/uniforms?sort=price-desc&limit=12&mode=grid\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IngvNXRPZmxvYjVZODhXc1I5T1pTQWc9PSIsInZhbHVlIjoiVHZvcy9pR3pmSkdEZXhneVpxd245Y1Q2ai9VTGdzQVh5b0JCVW8yY2dweG5aY0VYQjVmL3pHeFNqRlN3VHVwVDdoZmVtRy9aanZNOURybi9ONzNWditCa015bEl2dHdZTHRyMU8vaDVmNHpPZEZDVnRvZWFOcW9qdnYvNjh1cEkiLCJtYWMiOiI0ODVhOTZhYWVkMGQzYTQ3NDY0YzljMGFlNmE3YjllMDg1MWM0YzQxZWExZTkyYTgxZjczMzE2N2M5MDNhZTlmIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IjJKRG5wejVoZzZrTVNxMEFiNUdEYVE9PSIsInZhbHVlIjoiVTlIRlA1R0Y3U090c1VDUlJOeEZ4S1Z5Qi9mMzh4b3B3anZWZU9TaldmV1h0bmcxSjFua0dhcmJRVCs3amxGakJFQWsvVDJ2eXp0MzU3WjJvT3Bxcklqd2VsNitCTzl4WXZBcVd6YTBSQzg0NDRjODBiallkcStSVGhaSVZkNzEiLCJtYWMiOiJlNzhiMDVlYmI0MWIwNTU0NGMyZGFmZjZlMGE1MWFkZDcwN2RkM2Y0NTQ1NGJhMzJlMWEzMjRjODJkYzA0Y2YzIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 1, 'Webkul\\Customer\\Models\\Customer', 2, '2024-02-06 13:36:32', '2024-02-06 13:36:32'),
(36, 'GET', '[]', 'http://127.0.0.1:8000/apparel', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6Ikh2cFFlN2tJaFBpeUFxQ09UTmVoOXc9PSIsInZhbHVlIjoiaVJxQVNBb0FSU3p1SXN5N2lOUmJGYTlPV1JvYXpFdlJybjNBS3pGaHZETEd6N0R3cTZoWTAvMWN5NkNVakc2RVl0RjhudFZKcW50SjNJd0I5c2cvTmhMeWowZ0NNWWl1UmJPR2oxcGIxa3kwenlnbzluaFVSWmtRMGdlK3Fsc2YiLCJtYWMiOiJhOWZiMzI2YjU3MDdkNzA0OGI5ZWE0YzFkNzJjNzVmOGQ2MTg3OWMzMDRmMmU0NmExOGMzZGI3MDY2Njg2ODFmIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImJhc3NYQXIyTG55aHYwV01zT0pWcFE9PSIsInZhbHVlIjoieUhJRElVTXUyREhhN1VzUXRmcUlVSkE3RjlPOEVGSkpmd1dkV3U2YUFneG43eUJFU3JBWHFVOWJvdUdWMlE5SU5DcVRBb05QV29vM0NkSHcrdHpqdFJYcjF1MUp5eTZNeENYbkpWaFE0K1pIVXZWWUpjdDZvRUNqT2FoUEtSaFAiLCJtYWMiOiIxMmYyYTFjODI2ODE3YWY1ZTRkNmUyNjFkMTUxNTE1Nzg4YTc3MjVmODRkYmMzMTE2NmJlOGM2Njc4ZWY5N2I1IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 7, 'Webkul\\Customer\\Models\\Customer', 2, '2024-02-06 14:23:54', '2024-02-06 14:23:54'),
(37, 'GET', '[]', 'http://127.0.0.1:8000/checkout/storage/locales/en.png', 'http://127.0.0.1:8000/checkout/onepage/success', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"dnt\":[\"1\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/checkout\\/onepage\\/success\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6InFzVG1QRE95dWZNUEhTUENySTBTWHc9PSIsInZhbHVlIjoiWlJpMTF3MGRGWkVGOUxyM2FlQXBvRHhhVExFN09WM2R3MnZsSjUvTlBrOG9BR1VWK3RuZUFXY1ZHVU9EMXVFQi95Zm1EdWIydUFrTEE1TTdSdkkrUXhobmIwQnZhbExWbENqMmZJU2NmNHVxb3ZFVFpvSkVJOFhzR0hFN0tvVjMiLCJtYWMiOiJhOWQ2OGNlYjA3NmQyOWY2ZjYzZmM5YjZkZTA0ZGU2ZGM4MGY0OTQwNjkwNGU1MjE1ZWM1ZTI1OGI0ZGQ5M2M2IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlQvaGVuM21zWXo1RHNkb0Via0l2Z1E9PSIsInZhbHVlIjoiUzBadVZKODR0eiszVzY3TVJTVzcrTmM4bTgyVkNTNkF0eGtBa2RTWnhCVjVxcFAzMGR1UEJyaFpTSENSbFpJSXlGWHd2UVQzUytWRDFtYzNjOWo4UHhSZCtxYkFkd3VYZkdnZUJtbkI0T3V3Ynp2OVFIVUxDdHpXSzhPOVkwVHciLCJtYWMiOiIxM2FjNDA1MzAwMmM1NDM0M2VjOGFlNDRmNDUzMzJmY2ZlOGFmZDY5MWVlMTc0NmIxZmIyMWZjNjcyM2NkNzcxIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 2, '2024-02-06 14:46:49', '2024-02-06 14:46:49'),
(38, 'GET', '[]', 'http://127.0.0.1:8000/customer/storage/locales/en.png', 'http://127.0.0.1:8000/customer/account/orders', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"dnt\":[\"1\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/account\\/orders\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkNYMVVDaUdUd0dmUU9XQTBCckgwTXc9PSIsInZhbHVlIjoienNPcEpMK1Z2RHRlQWI1ZjgyaHZZeFBmQ1ptcXRSUDQwVERJQVNhN2FmTmx4VmJOa0RIaFQ0Y0Nyc3NoS2FlSjcvb3VRQis0U1d4Z0JsMTFhYmJZeklFQkxuRWsyZGFnNHNkcVhqdFVQNnNPSGNoNUZsbGdvYXJuVHJ5eHplcFIiLCJtYWMiOiJlZDdmYmMyMTYyNTE0MDYzZTViNGMxZTM2Nzk5YmMwNzA0NTIwZjY4ODM5NjgyMWUyMDJlYjUzNWZjNzAxMzQ3IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Im1oR05pbUR2K0pwWStIR0pBUWprZ1E9PSIsInZhbHVlIjoiaVNyOFc0ZlJOTmdDbUc2dWYxSmtPL0FwS1ZIUXdmMjZPR2ZNdHg4WlV6SE1vd011bDRZTFNKSUZPcGlhSmNSWGhQNWdJQ09VNHlPZnl5WmFGNHN4aTRwRHVvMTYvcExTeFpxTTgydisrL0Q2SUtHV0Fxby9QeEZ6d1BncTY1eUUiLCJtYWMiOiJhNDU0MDBlM2ExYTg3MDYwYzNiZmE4OWEwYjM3MzZiZDQyYTJjMjgxMGE5ZGMyM2RhOTFlNDY2ZjBkMzRhZTRiIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 2, '2024-02-06 14:49:39', '2024-02-06 14:49:39'),
(39, 'GET', '[]', 'http://127.0.0.1:8000/customer/account/orders/storage/locales/en.png', 'http://127.0.0.1:8000/customer/account/orders/view/1', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"dnt\":[\"1\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/account\\/orders\\/view\\/1\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImJOYVEzaktMSjErV2tJblJEckpCSXc9PSIsInZhbHVlIjoiVk5PeU9NQ1luWlRPdUlqd25mNUVpMGNON3lUdkNFd2lhRkFnMC9md2FGVExud3FqSDNic0FPTVQwY053cCtLWExSTVJoUkdkeGZFekZ4ZmdsNFVPUG9maTBrYjR5MzZBbzE2WFBtZXMySllZTUFtbHNZRHRsdGJFclVOL1FjZXciLCJtYWMiOiIxZGYxYTA0OGZiMmI2MDFmODJjMWFmOGQ2YjQ3OWQ1OTI2MWZjOTJjYTM1MjYyNTNlZTViNmIxZGYzZmMyM2U0IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IklxalJvTDU4OVBUUlV6OHJXbnZZRkE9PSIsInZhbHVlIjoiUGtMWGdCdHU0UVo2NURPT09ETEx3R3BYUlI5Q2FGTTI2RE1OWTdtbEVEVnk3QUZ3cVhoWUZlMVAxaUJkS2xkNGJhcXdTSUZqL2FjT2k1VFpuRmRCZS94elhMOFlEaDNIdDcrZktSTWUxeHRZUmZrb1JNbXFjZVpYdWlXWFRTcVIiLCJtYWMiOiJiOWRjZTEzMzljYjM3MGEzZDZmZmU4YjdhYTlmNjQxN2IxOWEzMjA0OTFkYjFhMDVhOTBmYjA4NzA4OWEyYTA4IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 2, '2024-02-06 14:52:29', '2024-02-06 14:52:29'),
(40, 'GET', '[]', 'http://127.0.0.1:8000/customer/account/storage/locales/en.png', 'http://127.0.0.1:8000/customer/account/profile/reviews', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"dnt\":[\"1\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/account\\/profile\\/reviews\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImxKRW1jTnY1VkxDb0c5MkRoWjhFTGc9PSIsInZhbHVlIjoidVhMTjNwRFRkVEN6MTVtUktjSDVmOTh2L0hPeEx0OGxzc0FZdTFVVGxUcjJoQjRqaUlkZFF0UnNFMGJwY0RIQnFRZVBDeS8wTFJoc29FdWEwRzNyVjJ1Q1JQZXFGMlp0QWpFbThsTVdZdzJjZk9kVHFvUHRCOFZjS2JpYjhha2MiLCJtYWMiOiJmZjM1MWMyYzYyMWI0YzRiZmRmOTgwNDQyZWExZmZhMWU3NDc0ZmYxYzU1ZWQ1MTRkZjgzZTdhY2RlMmQ4OTNmIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImNYTkNYaDEvQWtLMlNhaGdxT2xWK3c9PSIsInZhbHVlIjoiWVRuaXVuWHpCR3RFaXdjQzJQK010MU5hN2FlYXE5OUtoczkrWlZtMTB1c2IzSHR4dWN3c0laT29xc2JCT1ZUc2Nwamd2OXhUQ3R6bXdVbjR4RmZ6WjVtZmdUSFhSTy9DSTBzOHFmWlc5dnFpdGJVOW02WEpQL2Z4c3FtcFNLN2IiLCJtYWMiOiIwZjkyNzU2NmMyMDhmMjE5M2QzZmZiMmFhODJiNGY1MTU4ZGI2M2NmNGFmMGUwYmJhYTJjMjQzZjY0ZDQzYTRhIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 2, '2024-02-06 14:55:34', '2024-02-06 14:55:34'),
(41, 'GET', '[]', 'http://127.0.0.1:8000/vendor/webkul/ui/assets/fonts/Hind/Hind-Regular.ttf', NULL, '[]', 'Dompdf/2.0.4 https://github.com/dompdf/dompdf', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"close\"],\"user-agent\":[\"Dompdf\\/2.0.4 https:\\/\\/github.com\\/dompdf\\/dompdf\"]}', '', '', '', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-06 15:07:03', '2024-02-06 15:07:03'),
(42, 'GET', '[]', 'http://127.0.0.1:8000/apparel/outwears', 'http://127.0.0.1:8000/apparel/tactical-clothing?sort=price-desc&limit=12&mode=grid', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/apparel\\/tactical-clothing?sort=price-desc&limit=12&mode=grid\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlhEMW1nc3BQdDNxa0w3RlFnQldldEE9PSIsInZhbHVlIjoiTHdPNll4S2VERzZiWHh2cG1kWDY1K1pUd3hSNGJydHE2VjhJNWpDZ3pJN1dIRG5sY0N1MG4yNmtQT0ZNTG8wTFMydllJY09QV1V1RDJZQkRhcFhvY2xETGpTU1BSalhwZXRaV2dvYzI3OFI5NzNTYmhodGRSdkpEWlFnV0ppNGEiLCJtYWMiOiI4MmFjZTZlOWY5ZGM2NmJmMWU5MTYyZTczZGZkYTFlMzcwYjM2ZWY1MWE3NWMwNzk5YzIwZWI0YTBjYmI5MTEwIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImJuZ2VGbFJZN3IyanpKLzdpVDUrMGc9PSIsInZhbHVlIjoiVGRvUlVEWUY2VU9HU200YXE5dnFlYURJeVFzTGRyZ1E5K0g5R0JuVVJaZ1AwT29KRkJXZHM0ZVRBZTRiYlRRRTArMTVuQ0xLaHN3dU5sVHJVZzZrZitiVnlEcnJJOWdabXdPemFLMVNUTndTRE9iMXVwbGFCcDZiS3VQUzlRVzciLCJtYWMiOiIzOGFiZWI3YjY2OGUyZmE3ZTkyMjQwYWI3NzMwODQ2N2IyZjExYzQxNzJiOTQyMTE0NDAzYmYyZmM2OTcxYWQzIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 9, 'Webkul\\Customer\\Models\\Customer', 2, '2024-02-06 15:26:38', '2024-02-06 15:26:38'),
(43, 'GET', '{\"sort\":\"price-desc\",\"limit\":\"12\",\"mode\":\"grid\"}', 'http://127.0.0.1:8000/apparel', 'http://127.0.0.1:8000/apparel/uniforms?sort=price-desc&limit=12&mode=grid', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"dnt\":[\"1\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/apparel\\/uniforms?sort=price-desc&limit=12&mode=grid\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImZ4TUhpa0FZMGZ1eE4yK21MQWRGbEE9PSIsInZhbHVlIjoiMUo0KzRRMEtkTFZ0alpERENUSEFoTTgxZTZqd05maGJreVR5d0gvYVF3MFgwVmFZMWV0UFRDR3JCNWp6YWoxK3lQVzlaU2N1Mm5UaldkZHZJSkE4UXh3NzMxZnZ5RmxLNzRYWlc5elhCYmpjOEpuTGxVbnNoMEh4Y0R5b0RKbEQiLCJtYWMiOiIwZWYxM2E5MGZkZjBmZmFhOWVkNmY4NDc0MTFlMWZiNDNmYTRlYjI2YjBiN2NlZTBhMDAxOTlmNDg3NjAyZDk1IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImZxb0hZZXBCV0Fha2svNGszQi81bWc9PSIsInZhbHVlIjoib1plNWhlWjU2RlBQa1F5Nm5PTXpiSWtCY3FCZDF0UmY4dStTS3FqSzRGWS9tQmtJbzJkVmcvcjlYUEJ5YzJuUDhObDVwdnFXZElmY1VLRWkwOWpkQWZTN3V1aHBRSUt0TWovS0xGR21yU1FUa3R5K21sMXdWTEhTWmRoZm5BM3MiLCJtYWMiOiI2MTAyOTEwNDA1NjdhZDY0YjYyY2NkOTU5YWQyYTE4NjZkOTE4MGFiNjBjNTMwNDU3ODYzYTI4ZjExOTg1ZmU1IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 7, NULL, NULL, '2024-02-06 19:03:07', '2024-02-06 19:03:07'),
(44, 'GET', '[]', 'http://127.0.0.1:8000/carwornic-mens-tactical-combat-shirt-14-zipper-long-sleeve-camo-army-military-t-shirt-2cp', 'http://127.0.0.1:8000/apparel?mode=grid&sort=price-asc&limit=12', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/apparel?mode=grid&sort=price-asc&limit=12\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IjFPNmEwTzdPbkl3R1dIKzkyL2JkUEE9PSIsInZhbHVlIjoiV1l3RXFtdEZNOGZvOFA5UzZKVlR6U1V3U2R6aGVZd3JMQWFXQ0gxOVFPcjZvQ0lzWlZ4K094NjNaditYY2Yyd1pyTmJ6Nm9yWnBZemwvZzhQRk9GRXc1L2dubEErS0NzaC8yMXYzSk44SkM1SjEybGlCWGZ6VWlwSTFZbXdOaE8iLCJtYWMiOiJkZTM1YzcxODYxOWQyMzk3NjkxNjRmZmY5Yjk0ZmRmY2M5M2RlOWM1MWU3MWIzNmU4ZDU2YjE0MDE4MDMxODVkIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6InY3M2V6N3hDSUY1OVllZUFBVDVxS2c9PSIsInZhbHVlIjoiRVUzM0hsemVmdTdacjVwMTNidGdvVDF2UmVNK0tqWHMxam01a2dYYnM1VzYwNE9LWnhydnk5cTVYU0ZheXdhd0h1d2l0VElDMUJxYlB6SmNpZklEZHlrVzcycjRiRUYvdC9KQkh6RlpzVmdTTnU2bERpNlR4N1VyUUxmVkRpYmUiLCJtYWMiOiJkYjBmYWI1NDg3ZTlkYjlhOTg2NzI1ZWIxNTA3ODYwYWVkNGEyYzM1MjA0ZDE1ZGJkY2FkNjUwNDhmOTYzZmQxIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 3, NULL, NULL, '2024-02-07 02:32:31', '2024-02-07 02:32:31'),
(45, 'GET', '[]', 'http://127.0.0.1:8000', 'http://127.0.0.1:8000/admin/catalog/products/edit/7', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"dnt\":[\"1\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\\/edit\\/7\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImJSTDlsVXk4eGdGejRiSzFjMUVneEE9PSIsInZhbHVlIjoiUVVuazhXL2xxeFg1dHNxWWs0aytKRGNZYkZVRVRRUnZXamNrNy9IRG16UGwwbXFSQmlWT2RTNnJ4Q1BqN2NOWCtwTmExdkFkL2orcUF6c0IwSzNXeERldUhxWVFXQjFOUzVKWmkvTUNMZ1RZaHNpck0vTGJNMmwxUDFPVDErL0MiLCJtYWMiOiI1OTdmMTcxYmI2OWI0N2MwZDBlYmNjZjcwYzkyOWY5NjMwOTA4MGRiNDE2ZDY0ZmY0NTJhY2U3NmI1ZmNmOWUxIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6InZWdTFkZ0NHTVBXTnczcVU5VjVCNlE9PSIsInZhbHVlIjoiaElJMUpiVlJBVVNvcFg4Zk5SeUhjY3l2WnJsM3ZBYzdMbnBmSk5LTjlGK0taSjRBaUJoODVZY0NlWGhzc3lpR05oVnMxSTVRc3EvQTVEWkNEL3BmV0ZKcWxnQ3FmSGJhRW9HUFJQZ2RYUzVNekJ3bklvalBRUERSSVo1czlPUFUiLCJtYWMiOiI1NTI3MWMxYWY0MGRlZjRmMzQ1NTBjYTU1NWNiY2U2ZDAxNjdjYzk2ZWU4MDgxNTA5NjIzYjcwM2I1NzJjZWQ2IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-07 02:57:38', '2024-02-07 02:57:38'),
(46, 'GET', '[]', 'http://127.0.0.1:8000/electronics-and-communication', 'http://127.0.0.1:8000/?locale=en', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?1\"],\"sec-ch-ua-platform\":[\"\\\"Android\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Linux; Android 6.0; Nexus 5 Build\\/MRA58N) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Mobile Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/?locale=en\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6Ilc5Z0hQZGhqemlNZVVaeFRWaGRtL3c9PSIsInZhbHVlIjoiWVVVeHUyVGRCM0ZwTXNUUEZ5NjYrczZjRXZuUzI4UEdMc1hFUUo5RnNzL29TbHplWlFkQzhKc3VRdS9SMG4vZWZQYXdaZExQTjMvRm9IcVpqOENXODRUMFBIUThqYm12dFVka3IvTXJNaENxOHo5M05aUktXck96dGVIWWRkNG4iLCJtYWMiOiI4ODVkNzE5OTJkMzc4NzYzNTJiNDA4ZWVlZGUzNzYyNTRlMmE3ODVlZmJiZGM4ZTMzMDFkNDllMGY1M2EwNTBhIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IklEaitjN0xXdEdJbm9GK1ZMUlhVbFE9PSIsInZhbHVlIjoiS1kwVVg5eFdKTzdDaXRhRlhoRmlibk8rNHd5L1JaNjFxS25GdnpyRGtGMFR1ZXBDYmlhemRrTnN3R3ZtQ1hxTFFQbFFQK3BIR2JNVVVlNi9zdW02clJUdTlCb3llT1lrWmI0MVJCQkRDcGk0TENGSGUxWGo4dUdTNUZWY3FxUFkiLCJtYWMiOiI2MTBjOWY5MDNkMDdiZmUyNTJiMGMxYTYyOWM5ZDI0YTc3NmY0YzYzY2RmZWE5ZmU0ODQ1ODk0MDgyNWY5Zjc1IiwidGFnIjoiIn0%3D\"]}', 'Nexus', 'AndroidOS', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 24, NULL, NULL, '2024-02-07 05:06:38', '2024-02-07 05:06:38'),
(47, 'GET', '[]', 'http://127.0.0.1:8000/storage/product/7/EHTy29QXzXpR9v9ISY9nXzo7YdYKoQIow3yVQC1d.webp', 'http://127.0.0.1:8000/admin/catalog/products', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"dnt\":[\"1\"],\"sec-ch-ua-mobile\":[\"?1\"],\"user-agent\":[\"Mozilla\\/5.0 (Linux; Android 6.0; Nexus 5 Build\\/MRA58N) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Mobile Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Android\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImFHcXoxMXBSNXhOZktUTkhqeVBORkE9PSIsInZhbHVlIjoiTXhZanA5WXNUNTBMMUJEUUQ5RGI0VkNDQ0JDUGJ1cmdYcVdtSmFBY3BUTHhvb3Q1SCt6QVdCNWRvTTJzTUY2THpTN3hxMzZBQUcyWUxMaS9IU1FWdE1LeUxGbTd3UEZjbTZBeGVieERwdkllMjJsb2xsOFlicDdEU0lDSnk1cUMiLCJtYWMiOiI4NTM1MjIzMDY3NmI4ZThhY2MwNTIwMzM5MzJhYmM3MTQwMTU0ZWZlZjljMjg0MGQxZjU3YzllZTAwYmI1OTQ4IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IkhiNjRocWp4TnpiZzJqcTB5dE9WSFE9PSIsInZhbHVlIjoieEZvUmVhR082N05xemhrVVd5S3dLRERXclRCajczREw2UkpENEM3WmF5WFVLUEZpN2JhNE5OVEZQVmo5bW1HejcrTDZ0UWVUMEtOdFZBbk1KUThjUmFIM25odlAzUFlPZlJlODBiSEJkVlZnZGVraENQNVlqVkErK2U2N3MwZW0iLCJtYWMiOiIxMzNmYzkxODM4N2Q4ZjViNTNhYzFhNDM3NWE0NzMzZGJkZWJjODkyMGM4YjE3MWUwMjliN2EwOTEyNjIyMzQ5IiwidGFnIjoiIn0%3D\"]}', 'Nexus', 'AndroidOS', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-07 05:33:05', '2024-02-07 05:33:05'),
(48, 'GET', '[]', 'http://127.0.0.1:8000/apparel', 'http://127.0.0.1:8000/electronics-and-communication?sort=price-desc&limit=12&mode=grid', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?1\"],\"sec-ch-ua-platform\":[\"\\\"Android\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Linux; Android 6.0; Nexus 5 Build\\/MRA58N) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Mobile Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/electronics-and-communication?sort=price-desc&limit=12&mode=grid\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6Ik0xZXcxSFE4LytKYWVUWGNxVytXMlE9PSIsInZhbHVlIjoidVZpSmRSUEZPQXpESzNjYXB5cTBkVVcxeVJQQWExRTcwSVEyM2lKRmVzdk1MNlNhTVFNU0tXQWRGOXZrbDJqYTltRWRRUC94OENocHRHVjBmSmYzNFMrdjZYMDU4aGp3aktGNlltc3o0OHJua2FvOE1COVUvSVJtY2ZiZmVOcmMiLCJtYWMiOiI4ZjhhOGMzNDc4NTA0ZmUxNmMyYTdjMmZiNGY3YWQ1ZGQ5NWE4NjNkMGY5NGUwZGQxMmQ4MDQ1NThkNGZmN2E4IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Ilg1QUhVWkYxZ2phMW1EMFAybXppa2c9PSIsInZhbHVlIjoiNjZidGhzakNOOW1OTGtNbHE4RkRDSnFjUlNTM0p4cUovdDZ6SUIxTXI0Y0FYNUlXUlEyVjRxbkNlczI4bC9HMzlnajdjNGVBWkJoeXN4bEFrNTJPWWF0RktCcEtrYlF3L2Vud3pIVFhCZy9scmhmUkRVem01d3Fpa0JBb3hJdXoiLCJtYWMiOiJlZjBiMTFhY2U2NWI0NDE5ZTIzYmNjNmQ4NTc2Y2I1NDI5ZGJkNmM3NTNhN2EzZjY4OThkNTY2N2I4M2JkOGVhIiwidGFnIjoiIn0%3D\"]}', 'Nexus', 'AndroidOS', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 7, NULL, NULL, '2024-02-07 13:23:24', '2024-02-07 13:23:24'),
(49, 'GET', '[]', 'http://127.0.0.1:8000/storage/locales/en.svg\')%20%7D%7D\'', 'http://127.0.0.1:8000/apparel?mode=grid&locale=en&sort=price-desc&limit=12', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"dnt\":[\"1\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/apparel?mode=grid&locale=en&sort=price-desc&limit=12\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlN1cFBVcS9zbEtoNjNYVGJ2d09KalE9PSIsInZhbHVlIjoiU1BnL2hEeEdCUVlUY1owTkNKSmdrUkJaMU5kaXhMQmJGNFVVSmZzUE9iNXJnYkNQSHFZZGE4Q1Vnck8ra2N2Y1l5VHlEazdIb2tlNWVhYXc2QWZGbDd0WDg3QUY1Zlp6NG9YSUQ5ekozMnh1ZUlsSVhuOXBlSzRBVXdBZ3hOc28iLCJtYWMiOiJjMTdjMjgzZWU2MTU1MTljZGZmN2Y3NzA2OGQ3YjY0YjE5ZDU0MmU0NTAyYTI2OWZjZDRmMzJiODU1YTgyMDIzIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IitqcnMzbGk5ZHVzL3Vld09IUzN1QUE9PSIsInZhbHVlIjoiMXU3MVpiRngzSFF1QlJRNUtNNEpPWDBlTWx5ajRvcldhUCs1b2ZFRVpuMkFDUndSaUlib1VHK0J5c2Y2dkE3ZU9lV1lNbWc2Yk93K3FyTEh1Sk1XSVE4SGRxUFJNaG11M1A4c2crcUR3UXI1MU5QUk5ZUzluQkdvUmZmRzF5WGsiLCJtYWMiOiI3MzM0NTI0ZWZmMDdjNzIwNDgxYjRjZmRiYTUwMjBhMmZlZTBkYzk5OGRiYmM4ZTU1YmJiNDA1OWJkNzExMGRiIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-07 13:45:57', '2024-02-07 13:45:57'),
(50, 'GET', '[]', 'http://127.0.0.1:8000/storage/locales/en.svg', 'http://127.0.0.1:8000/apparel?mode=grid&locale=en&sort=price-desc&limit=12', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"dnt\":[\"1\"],\"sec-ch-ua-mobile\":[\"?1\"],\"user-agent\":[\"Mozilla\\/5.0 (Linux; Android 6.0; Nexus 5 Build\\/MRA58N) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Mobile Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Android\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/apparel?mode=grid&locale=en&sort=price-desc&limit=12\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IjhhZUtTRDZEemN5amt1V2F0b1VWQ3c9PSIsInZhbHVlIjoiSTZFc29OSkRGQ0k1WklxNTdMVXlKWlhhN1hIN090Zit4QllvSng3R3NBMGlSK2crWDkvQjEyUGpkTmhRVFNDZkIxZzlGakliWDZZdlp6ejZWdFBZSE9DZllUanhxV1pLS1RJWnozMnJiNjNIeVdlV21BSE5FMWN5S2dYbG5xOXAiLCJtYWMiOiI4M2QyMzY4YmVkMjhlMTBhNDdjZDFmMDNhOWQzY2FlNjE1YmJiMTI4YjZjM2VjODI3NmI0ZjBiYmIyMDQwMjdlIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImRjR1BkNk5qUXI3MjJubnhpK3l3a2c9PSIsInZhbHVlIjoibnBYQllJcklycEVWbW1Qc0hwR3A5d05PRU80dWhKeEtSUW16MjNhWGpKb1hiUVJXcUFsZEJYaCtCTXJ2UWh5dkxCRmtzWjNhNFRWV3JCVVpVVTUzVFdPckpCZE5lVlo4Rmo0TTNWMENGWTF0NnRjcjFhSzFvMUl2QTBuK0FNbVIiLCJtYWMiOiJhNGRiOWNjYmI0YTI1MmNkYjBiODgwYjU5ODhmYWM1ZDlkZmI4ZGZjMjA4NmU1NTQzNzZkOGNjMzQ1YTNiMmJhIiwidGFnIjoiIn0%3D\"]}', 'Nexus', 'AndroidOS', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-07 15:30:04', '2024-02-07 15:30:04'),
(51, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"dnt\":[\"1\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; bagisto_session=eyJpdiI6ImRTSHJJenhrZytucU8xZ3QyYzNjbEE9PSIsInZhbHVlIjoicUN4MkswU3lxaG5La3ROejJwOWZPVG9aREYwWVhkWFNLRkRkaFlYMHc5QzZLc0IxZ0lYMjdoVm1XcG50bFY3RlZnMmo0N2d6dys2eUhLUkNMSG9naURCSXdJN1Bob29SNERVQmFKbVd2dHZLSWU4eFdwT0MzVDlsdDlPZHFLcE4iLCJtYWMiOiJhZjhmMGY4YWYyMzE3NzVmOTY1YzE4NDYxMjFiMWY3NzlkZTRhMmNhY2FlOWJiYzAzNGMwYzczZGVjMTIxNmE1IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-08 14:05:14', '2024-02-08 14:05:14');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `created_at`, `updated_at`) VALUES
(52, 'GET', '[]', 'http://127.0.0.1:8000/apparel', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IjBEN0E0eDhGZnYxemczeVI4cVozb2c9PSIsInZhbHVlIjoiZHBaM2p4RWlZTWtkbmlFYWIxSnc3K01PenU5ZnhEVGtHemQ2S1BFYlh5UStvdTJuREJ5eDd5Z2lidTh0Z09nWE9jNGpMd2JKbi9XSmtOaWRPMENjSk1MVHNudys2eEsyalFEYkpJQk1XVHpjcnVkRzdsSFM5cUorbE1sYURmOU0iLCJtYWMiOiI1OTU3YmVjMDQ2NGQwNmM1OWE0ODk1OGMzMzEzYzE1NTQyOThmYjNjYjliMzg4ZjkwNDMyZDlmYzNlNzI5MmQyIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IktNTVBxVEZ6ZWswd3RZZlV4cVRiQ0E9PSIsInZhbHVlIjoiRXNoeEx4U1lndjlEeG9sNnlZQmJOUFRMTnhPdk1IK0JUOG4wRWZqdmJNTHdQZHVEY2YwVzVOSjRjWVhzeU85TUFDWkh4cU1ldXRvWVQ1MysxN1pHcHpqaEEvUG5kZjc2dVFMNndRT3VFTzcvdi93d3lSMVlMLytRLzZUaWRrNmgiLCJtYWMiOiJkOGY3OTE1YTdjNDYxMjQwNTU4MGEwZGUyNTcyMTRjNDVhOGY1MGQ0ZGE5NjVjYzdjYWRjNjU1N2JhYjdkNDNjIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 7, NULL, NULL, '2024-02-08 16:13:19', '2024-02-08 16:13:19'),
(53, 'GET', '[]', 'http://127.0.0.1:8000/military-army-tactical-', 'http://127.0.0.1:8000/apparel?sort=price-desc&limit=12&mode=grid', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/apparel?sort=price-desc&limit=12&mode=grid\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImdXTTdUVkVvdCtxUEo3TTdxL2FUNFE9PSIsInZhbHVlIjoiNUVZRmdZOERQQjRFVXZPWkJEc1orV1VIYitqQ2xvTGFlbHVCb244NmJvK2hSOHRyR2RjQWM0aWxCaVZMZ1U3T05xMVM1ZXBrOGxWY3FTc3FMNElXSFBjQVo2Tko2QU1sQTl1VURSWWE5ZGZwdUkyaXpqSXZxTUd0aVB5b0VKdWoiLCJtYWMiOiJjNDU4N2RhYWEyNGViZTUzMTU4ZGFmOGEwYThjYWNkMjViMWY1ZWJiMWFmOGY5YmJmNGQyNDJhYjQ3MzNjNTM5IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IkNjVHNzeENpRUJ4bE5uM0QxZ0FpRFE9PSIsInZhbHVlIjoiQWlKYXVCQ0p0UUlnRnZiOTFpNXBWUjh6cUZlcWE5aVF3UExuU0dob2hkdFJFb3ZtWGtWMkpzRzFOR09HaXUzNTBGZU56ZUVwUzJXTS9sb1lFR3NMSHhxN1hpTVFnWnZXVEJQWWt2R2dYdU43a0Fpd2hzWlhhSCtPS0pqNkpnYjYiLCJtYWMiOiI0MzI3YzE1ZTkyYjZiY2VjYWQxMjEyY2Y5YjcwNDk5NTg4N2ExNTMwZTNjMjIxYmVhNDFkMGNmNWE5YmQ3ZmY1IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 7, NULL, NULL, '2024-02-08 18:25:08', '2024-02-08 18:25:08'),
(54, 'GET', '[]', 'http://127.0.0.1:8000/apparel/uniforms', 'http://127.0.0.1:8000/military-army-tactical-', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/military-army-tactical-\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkxOc2pEUFViMXQ5M2xHRGEwY1RuREE9PSIsInZhbHVlIjoiZllGWnRUREZFSmExMmNoT3BhY3cvNi83V3IvaHZSYTczSFFGQjlmUGpWRXovSVJpZHcvdnZaSDN0eVBNYTlHYy9BdXF4SVpDTFljYWNuaGJoejBtN0QvTVpZMzZSeHZINkpGYzcwTGpqL01NeFc0STZBaFNzd2VKY28xbGc4L1AiLCJtYWMiOiIzZDI5YmYxYWE5MGVhZmVmYjY0ODg5OTVhNWY2MDlkNzFmN2M1ZWU3N2Y2ZTJhYzlhODgzYjNkMzNkODAwNzAzIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IklQakZ5YXpUSU1LVkplS1lHSHRReXc9PSIsInZhbHVlIjoiMEtjbXQ4YkxhTlFQN0RaSmRKZUdMdnlPeklwMkp6TDRncWdWcFFtMU9iMTBwVkhtaUFuTkYwMVJtVFRxRTQ5b0JieDV0R0lOTmlyN2NXd3I1V1UycE01Vk92ZzRJMHlkR3RVUm0zbHFObmRJWWlLNHBDVnBjanVtUGhadWxFbjUiLCJtYWMiOiI4NjA5MmNkMjM3MjQ0MzA3NjU4MWQ0YzVjNzk3OThhMmI0NjVlOTNmNDlhMGEwZjJmYmVkMmQ2NGNmYTdkYmQ3IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 8, NULL, NULL, '2024-02-08 18:29:07', '2024-02-08 18:29:07'),
(55, 'GET', '[]', 'http://127.0.0.1:8000/apparel/storage/locales/en.svg', 'http://127.0.0.1:8000/apparel/uniforms', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"dnt\":[\"1\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/apparel\\/uniforms\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IldOK0ovRms1YjYza2lCdTVWd3BGcXc9PSIsInZhbHVlIjoiVlNOVUk5aVg4aXlvT2NRdXIvTjFFNGVUQ0VaWVZQT0cvdU1WVmY4K3hJM1FMUTdqc21kalJJNkNPTk53YVN2YTRQbnc1bHlIMEw0VmNUMC9Cek9yR3RiZ3lKVUlrSmdiUTFxMURQeWJiVUdjcFV1MERoZGtKcHlXZ1AweExSOVEiLCJtYWMiOiI0MDYzOTJhM2MxMTE1MGE5NGRhNjUyMDkzNGJlZjBjYzZmOWYzMTk2ODI2NzI3NzY4Njk4YzQ2OWI1MjBkZDY5IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Ik9CTFl6N3lXU1JIQmQwdDBmTnNLclE9PSIsInZhbHVlIjoiNWI3T1NJWlM4MzBuSkgvR3FsL3NRRmt1SmVPZnhjYUFza05uS0JlZ0NzUkxkODFkalJIZDZaVHl1M3g0cjByVElsdVgyMndENTlmT3J0ZXFuNjk1SFhTSWJNSDFEbU15NTFiYnNDK0VMV3BIbTFiWUxPcG9ueFZJYytQb3gzdFYiLCJtYWMiOiJjOWMzNDlkYTU1ZjA4N2JkYzNjMzk2YTRkNmFiMzNiNmJhMDJiZThhYWI5MDNiMGU4YjJlMmU3NWU4Y2JkYzEwIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-08 18:29:10', '2024-02-08 18:29:10'),
(56, 'GET', '[]', 'http://127.0.0.1:8000/backbone-mens-army-military-battle-dress-uniform-bdu-shirt-camo-top-jacket', 'http://127.0.0.1:8000/apparel/uniforms?sort=price-desc&limit=12&mode=grid', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/apparel\\/uniforms?sort=price-desc&limit=12&mode=grid\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImpCVytTamU1M0k2dytKdzNKOXhrdXc9PSIsInZhbHVlIjoidVpVOUhjRWhma1A5d0Z3cDh3ZFZPV2VQTFJIVzVjVGRvUjhYQi83Q2Y4Z3MzZ3c4QnA3bE5MMnRTVWV2Zlc3cVVxWlY4MXRLbTc3TEpmbk5FSEVwVnFETEtHM0pvZmVET2NtdWU5NERWU0xXUW1OQnNpS0k1a2NJdHJMWmVpbUIiLCJtYWMiOiI5ZTEzYzI5MGE3OGRlNzgxYTA2ODMzYzU3M2MzNTI3MGNiZWI4ZGZhYzQyMjZhYmU1MWE5MDBlZDZmY2FhYWY0IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6InRIdmttQVh2VTVmcmxTK1IrajFXK2c9PSIsInZhbHVlIjoiQVRocytZU0JLeXkvZGNDQWlPdkZab3d3OVdpSWtjK3hlZ3lZMDlYeitsMklhR2FvZjNRTEdYcVJaOFVaT3F6d0syOTl4cGdpZEVaNTF4TTF0K0NyR1dyejBySk9JbDMvWmFkS2dCb3oySmwzWjNROXUwVm83VktLNC9Gc3Y2bmoiLCJtYWMiOiJmN2I4MmZkZTk3ZDg0ZTU5YmQ0NzNlNGFjOWM2YmE3ODdiMGIwMjM5MWVkZWViNTgxNzIzMGJjZjAxOGJmMDJhIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, '2024-02-08 18:30:38', '2024-02-08 18:30:38'),
(57, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"dnt\":[\"1\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-09 13:40:53', '2024-02-09 13:40:53'),
(58, 'GET', '[]', 'http://127.0.0.1:8000/firearms-and-accessories', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6Ik9MQWhFcHZpU3kyZjhRL0RVNnNZV1E9PSIsInZhbHVlIjoiVy91cVFKaUdCbXZ2M0NNL09CT2pRNzE0NzVkN3I1L25xbndjMTdtemZzemswMWdxM2cyM0dpQ3h1UHUxb3VEbFlLYldpbmVEdy8vcWhFOXNnbGRZRDcrU0NwdzBQNUpJSjRCMVJvQWlTMjZFSjBQWGJZWWI2MGpxNUNkemZXMkYiLCJtYWMiOiJiZGVmZTRkMmJkYTE1YWMyOWZlZGMwYTI1NDgwMjg3MmRmOWE0NjdkOWRmYjMxNGYwYmEwMGI4MmI2ZGQ5ZWJhIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Im1qMVpkc2hsT0szblNQeWMyQmVvT2c9PSIsInZhbHVlIjoiNDkrT3dENVlGSm1aZUpBYmhZcjgrMExtZnZxN0NraXhDZWltL3lFd3ovMzVCK09XYUxQQzlBRndzbno0T1RzUXRnQWpMSHVTN0NRU0IzWGxxeW1KS3lpdEhuSUtpNzRpendlS2hNS2RzODg0bFhCNFMzMHRZclgvMnZuOWxTZmYiLCJtYWMiOiJiZDM0MTk2Y2EyZDg2ZGQyZWYyMTIwNjQzNzZjNjdkMTAyYjIwOTU0NWFmY2I4NmEwNWUwNDg4MGJhNmE0ZWYyIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 18, NULL, NULL, '2024-02-09 17:24:58', '2024-02-09 17:24:58'),
(59, 'GET', '[]', 'http://127.0.0.1:8000/apparel', 'http://127.0.0.1:8000/firearms-and-accessories?mode=grid&sort=price-desc&limit=12', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/firearms-and-accessories?mode=grid&sort=price-desc&limit=12\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6Im5MRUhwM041eGhXaEZ6cE5iVUhFMGc9PSIsInZhbHVlIjoiS3JvYXNud0dYZm1KRWpzRURmRTVIQk5wd2R4ZXZXS1JuZWVHZURjNzFNNXJna29rYWw0MHpBOG5lUkVUSVZjbWV0NElpaW90dVc5aW5xS3lKMVZyRDc5OGFjSTNlRHNRK1BBSEdKbXkxM0pjVFZrS2tEN3FCQ1ZmNGtJWEYvTWwiLCJtYWMiOiI1NTczMWYzMjg4Mzc5ZjAwNzZmNDIwMjlkNjdhNjUxMGIxYjY4MDA0ZTAzOWU5MGZkYjQ5ZWQyMjk4ZjQ3YzhhIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlJXMEwrYkZaUGlCdVhTQzA0QTVQemc9PSIsInZhbHVlIjoibmFLOTh5ckh2cWlsKzJIZGdyaTNzU1QyYXFBQUZTY054WU9kcVBJOWxSVGJFQVJFb0g5WEZienZteVJqdk4yamdpMExvbW5IQTcwQVE3Yks3UGZmNTA1MmM4My8yd1N3dklGcS9rZGxyYU5GUUNwbDBYamRtR0FlZkdsS05VdUsiLCJtYWMiOiI5NTVmZTNiZDQyNzRjMzY1ODgwNGM2ZDM2NWRhYjdhN2Q2NTZmMDVjZjVjZDIxZTQxODYxM2UxNjgxYzA2OGRlIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 7, NULL, NULL, '2024-02-09 18:25:05', '2024-02-09 18:25:05'),
(60, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"dnt\":[\"1\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-10 00:38:20', '2024-02-10 00:38:20'),
(61, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"dnt\":[\"1\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-13 15:33:15', '2024-02-13 15:33:15'),
(62, 'GET', '[]', 'http://127.0.0.1:8000/camo', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImVOblpFRWtZRTVNOWJXdXBTaTRlMGc9PSIsInZhbHVlIjoidEF3NUdXUlB0OWZWK3d4RmNrcFNvVlR3RFRQVnZ1ZHVHL1dHa0hncndOSEVYZUZmMUF3a25pY0w5enpuL2JOVkxtVTFzVmtPUHZEdXJCYXdSUWw5T3lmeGxiRFBTQjN1VGZHeEwxM1EyYUJ5ZFB0VkdXbUxaU0RxdlNWbEVoR3UiLCJtYWMiOiJjYTFhMjkxNGM3ODUzNjllNTBiYzg4ZDRmMDE3ZDkxZTQzMDNlYmM5ZDBiNTc1N2JlMmMzZmVmMmIxMDVhMjRkIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IklwSXJ3YnFlYWt3VzFVVlZERGMrc3c9PSIsInZhbHVlIjoiKzZGWE5kN2VQaDh0WFBIZlA5clNnSkRyeEUzM2RxWm8yM2RBZ3R6U3FrM3BiWEhkMnVuSkV6cHhFL1AwaHNSNUVzdHc4NkdnNmlTOVo3enptNDZlZ1F5RjhVK01JNWhrYnc0SldzbUhWYzJQU1J0eStjMWFtaWFIcVNJbnRLcVYiLCJtYWMiOiJiZTA3NWEwYWIwMmEwNDdlYTRlY2IyNjMwZTIzZDE1MTIyZWY3YzA4OTRiMGM2MDZlY2Q0ZmNhNGJhYjRmZmJkIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 9, NULL, NULL, '2024-02-13 16:53:36', '2024-02-13 16:53:36'),
(63, 'GET', '[]', 'http://127.0.0.1:8000/iodson-mens-military-tactical-boots-with-side-zipper-puncture-resistant-work-boots-army-jungle-boots', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IjA2UkI3NDB5YXhUYlpva1czZ3UrOEE9PSIsInZhbHVlIjoiWnVoNFZSTytXd2dYNzFyTWowZFIxbkFpS2Q2WW03cC8zKy9UZWlmNGs1bm93TWJzM3pEaGNrek8xc2pSRHAzTmZsVEN3T2hGaGIwS3RBMW5oaEVMUGVGRlcyamhhcTlwK2ZrRHU1bGVRZXZMM3ZjWU9nS25RMUkvS3FsTENrbDYiLCJtYWMiOiJjMzdkZTBjNjYyNzM0NDAxMmRiZjg2OWJhOGY5M2YwNmM0ZDUwZDQ1ZGQwNDJlYTdmMGY4MDc5NTJjYTczM2I2IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Ikh3Mk4wcmdGLy9WeWRIaHp3dW4vTmc9PSIsInZhbHVlIjoibWx0dlpUelB0VmdjbldVNjZIOWJObWJzdzFEdTduSUxjeU84Q1Q1cENtRFBPOWkwbmJFeXlLWE9hV2hPcVdJTS9uTUMxVGpLRHQ5Y3ZsVmVHcDBoa1g5TVRIMDU4Vnl1aTFLdmhvVnlMYmdzak1hY0crNnNpRWZEZ0cxd2JYRnIiLCJtYWMiOiIwMzc1YmY0ODc4MWY5MTA0ZWM2OGQxZTYyOTAxZGMxN2RmNDAyZmJjNWJlZGVmZWQ3YTQ0ODRiZTg5NTAxOTY3IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 4, NULL, NULL, '2024-02-13 17:14:28', '2024-02-13 17:14:28'),
(64, 'GET', '[]', 'http://127.0.0.1:8000/glock-17-gen-4-bb-pistol', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlBuSDE0M0VBays3bmVjTmdJeTVodVE9PSIsInZhbHVlIjoiU1FqWXdCVkhZUS9ZV2daWGY5aURNek4wTXh4ZzNhUGhWTmNRRUs2VWJPKy9sUnhVeWh1dFhjZzF4SWZhNy9mR05iOWlGeTBCRDRHenZTU0R4RDNSWEV0TlNoQkxnQ0JDSXhmdm5FTDFESGoyeFRpR2x3b3NjSVNjaGxIbjB6U3UiLCJtYWMiOiIxZTkyMzkwODBkM2FkYzJiMzJlMGI3MTlkZjYzYjc0NDc2NGY2NjBiOTYyMzEwOWM5ZWMwNzllZWUzMDFjMGQ3IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImM0Zm5CSTEyVEFkMDFJckFTd2NCQ0E9PSIsInZhbHVlIjoiMVB0Uk96U1F2M1FTOCs1OVZOMXZPaTdYUmprSENyd1hXcXdIaEIrSnhNTE1SN0U1WmJ4QTdXVFdiRndQa09SQit1b1p5TkF1ZVlocS81QzRDcWthNTVuMmtYaGlwOEZzMHoxeDNvMklxVkdERVhOOWpkcWtyNmtjNVllRzBHdVoiLCJtYWMiOiJhMzVlYzBhMzMyOGY5OGFlY2JkNjhjMjljNmY4NDIyZWM3YjMyYWRjZmJmMmNmYjdlNGVkYmMwZjU5OWU4NGYzIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 9, NULL, NULL, '2024-02-13 17:16:54', '2024-02-13 17:16:54'),
(65, 'GET', '[]', 'http://127.0.0.1:8000/firearms-and-accessories/handguns', 'http://127.0.0.1:8000/glock-17-gen-4-bb-pistol', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/glock-17-gen-4-bb-pistol\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlVvbkhSTTQ3QTRaSitOU2dTZ1NacFE9PSIsInZhbHVlIjoiQ2llYlBIc0ZweVAyUEpUZHdBSUlEL1M2MjBDOHROWU0yNlFnL0FNQzBOeHhHUkpJaVNtMTVDd1A0ZWtRbnAxUFdXWFhhekhWRnpsejBUODZOMDVYa1lrMkN5elRRaUl4cTJhWHFJaHJkZVdGVzlqcHdDTnZPa1A2dU8zQlI2bkMiLCJtYWMiOiJmZTkxZDE5ZWYzMzQxMWMwYWQwMDMxMjU2ZDg5MGFkZDIzYjQ2NDcyYzZhNDQwOGI4NzAwMWQxMTRkZDg3ZjJkIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IkJhWm5sa3ptMTM3ZW11QXFOR1J5aEE9PSIsInZhbHVlIjoiTlFJbTJCWklFTUdPRlRZa29SajEyV3pURytKMjg0T1BKUm1hMytJaHJQUkxod1p5bnpZSU1PSXVTTncwQVdzQnAvUGtjQUp0OHJ1K2YrZThGOHdzWDdCNWpyUk93ck5JVm00NWtzbGpweUkveEJyVXhCb1d5Smp3UkZuSUpWbXYiLCJtYWMiOiJkNzI4OGIxZTkwYzZiOTE3YzU0ZjFhNGM4MmFmNzQyNWFmYTQzOTMzZmMxNjZlNzFiMDUxYzFjMzlhN2I5N2VkIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 19, NULL, NULL, '2024-02-13 17:26:55', '2024-02-13 17:26:55'),
(66, 'GET', '[]', 'http://127.0.0.1:8000/firearms-and-accessories/storage/locales/en.svg', 'http://127.0.0.1:8000/firearms-and-accessories/handguns', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"dnt\":[\"1\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/firearms-and-accessories\\/handguns\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6InozS3h1QzhrLzlpRVpFVm9Vb3NmMHc9PSIsInZhbHVlIjoiWFZtTHRENG55MmlHVWJvZndIR3RNRFdXb2tSK2tYRm1rUjdLLzBSMXZxNDl2MytzWnBURkNVZGJNQVQxNzR3OG5XRHE2OFFENGJzWmJxUC9ENWlQQWo5K3BWTDFYN0lldkw1enZ2aE9McnI5YWpaN2NHNzRRQUNRQVU2WTdoSEsiLCJtYWMiOiJiMjEzZDE2ZDlkZWQ5YTBhMGU0YjY5NjUxYzk0ZjgyZDUzNGRiZjcwZjYxMWM5ZTQzZDE2OTNlNjkzYWVlMmMwIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IkNxcEpGTFd4cHAvNDc0ZXlNK1NBbFE9PSIsInZhbHVlIjoiSFlMNGZRc3IxRGJHeUFEMmp3Vm5HWWpCNm5qNnF2RDRvN2hMMG9VSlN5N0lyb0E1SGRBem5YQndKVjRWWEJQSzM4cjdOV05aQzc5ZzJNVk9kaHlpMjZwcndiWjBuc1YwVk5EMCt2emthZU91TFNqL0Z0enpMR0p1c3VNY00vajgiLCJtYWMiOiIzMjk3YTI3ZGNmM2ZlZjQzMGQ4MzY5ZWEzMzBkMmU3NmRjMzdhYjcxY2JmNTBiZGE3ODVlZTBmODZlNTcxNGE3IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-13 17:26:57', '2024-02-13 17:26:57'),
(67, 'GET', '[]', 'http://127.0.0.1:8000/firearms-and-accessories', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkRNR1ZOMjBXcjczc3VOa0tWalZZU2c9PSIsInZhbHVlIjoiM0c3clhBbnhlcU5yaXRVWkdtOXl2ZE4vUXRhYkFsem1IcnJKcU05bi9pNXg1YlVkRDhkZVNlUmhsVGowdjR3eW5qNkdDbTR1dU5vdXpqTzJ1dlpxRjBwOU1kSUVBQUMveFZkaEZmdmhqcXdXaDNtaWZ3QkIyNUpSZmwwbVVoS0UiLCJtYWMiOiIwZDU0YTRiZDVjMmVjNmQ3ZWZhOTI0ZTEyZjkxOTg3ZGVmZTQ4OGI5NDRhZjIzY2VkZTZhYTEzZjVjYTEwNjk0IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IjkvV0RPMjR6UVdWZ0lZQnBMTjc5bWc9PSIsInZhbHVlIjoiZW1OSFUySWc3YmNqNnAvQkg1d1gySmhDdnkyWE5zUXRvVDhkaVBNMmJWb3dFUm9uWGxCTm9DUnhLeFp1clVOa0VkTjdyb0dBTzVwdURqNWQ4TFhCVDJZT3dEdldvRVMvRnVOSWVqRG9wZEVpRDVGZXAxeGd1UjhWSHY4MU9iR1IiLCJtYWMiOiJkODI0ZDFhYzVlNTIxZTY0NmVlZDk3MWMwN2NmZmYzNGIyYjlhNDc4ZDVjMjY1YzU4NjI0NjViMDU5MDY5YmIwIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 18, NULL, NULL, '2024-02-13 17:53:48', '2024-02-13 17:53:48'),
(68, 'GET', '[]', 'http://127.0.0.1:8000/hk-usp-bb-pistol', 'http://127.0.0.1:8000/firearms-and-accessories?sort=price-desc&limit=12&mode=grid', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/firearms-and-accessories?sort=price-desc&limit=12&mode=grid\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6Ill5cXU4Rk80cXNla3QvVkxBcnlhK1E9PSIsInZhbHVlIjoiNVNka0hQMmNMckhsU3VObUxiVHRyWVFNZldCZmRvMW5uTkVnaWs3ZVdBQ3RYY3UzZmdKZWxSeUVkUXpvNVRVU296cTJoRUlLZXJmeUxFN3BNeDBGVy9oak96ODFJczV1VDhmQmNlV1dhdmxDdGdWbzBxNjZHbzJsTVVXbXY4OTkiLCJtYWMiOiI2NTlhOWQxNjE0YjZjYWU1ZmIzYzM3OGY5MTRlZDI1YWI0MWEzMDVjNzhhNjNkY2Q0YmI1MDI3YWMxZjY4MzM4IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IkxSbjFvcDluOERLNmI4RktkUjlyRnc9PSIsInZhbHVlIjoiYVBtemRMK1lncUhkY2xsVFl6SFBmNXZtR1Z2aVlLZ05uU0hNanlRQzUvWmhlbUlwTHNmMTF3bzdGZW5PK1ZkU3U2R056c2ZldmU3ZlVDbUp2RHIvWGEzZmJEM0hQTUNPSzVtRFN2ZkE2OXFYRkZtUUM4c2ppeTlWRzVreFFjSFUiLCJtYWMiOiI1NTZmZjVlMGJiYTA1NDIzMzNlZjg0ZjcwYjVmNzU1NTBlZTI3ZDE2ZWMzNGYwMTRhYTY4Y2FlMjQ0MjE2NzJlIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 10, NULL, NULL, '2024-02-13 17:54:00', '2024-02-13 17:54:00'),
(69, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"dnt\":[\"1\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-14 14:41:57', '2024-02-14 14:41:57'),
(70, 'GET', '[]', 'http://127.0.0.1:8000/backbone-mens-army-military-battle-dress-uniform-bdu-shirt-camo-top-jacket', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"dnt\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6InV1UGUxT0UzTGtpaEtxcXVSQi81WHc9PSIsInZhbHVlIjoidFN3OTZIRzdpKzVYa2tYdllVZXBoMW1VK0VYUndQRFFLcDE0dmVFTE9ZWVlCMld2V2hPSDlsU2VXZEdMMDF0YjhvblhsdTBueFovRmxtMFp2Mm10Ly9jWHRWdFNPc2FtMEozR0hpcjVIa0ZReFFtWitUNzNZL3A1NWxhUWJ0QlAiLCJtYWMiOiI5MDljZjhkMDczYjJhNTg2NjI5ZDZhZGJlZjczOGY4NDU2ZWFkNWJjNTI3ZDU5NDBhOWM1NTU2YTUxMDdhZTlkIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Ikpra3lsOHhaOG00NkJ0UHJGazV2WEE9PSIsInZhbHVlIjoiNDNZY2psejhVODFCaE9zTGJkWUhKaEpNMkRyOWtFcHJQdmpleE5hWEtwTmJzS0pyK0JQcy9DT1BkWVN1cDlDWWkyT2FhMFZhSFM1ZVdNMEZ0ZnNpZkN0NUp1V055ZzdGcDBEbFNNckczM1UxUk50TUpjOTUyQUFtYjZlUlkyay8iLCJtYWMiOiIwNzhjZjM4MTNlNDA4YjI5YzliYjVlNDEwYjY1NzE5MjczYjU1ZTRkMGQwMzYwNzE1NzlmNGQ2NGExYTE0NzJjIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, '2024-02-14 17:08:53', '2024-02-14 17:08:53'),
(71, 'GET', '[]', 'http://127.0.0.1:8000/page/storage/locales/en.svg', 'http://127.0.0.1:8000/page/about-us', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"dnt\":[\"1\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/page\\/about-us\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkorMjZOc2xoRGdKWURiVW45Y1ZKcnc9PSIsInZhbHVlIjoiSThNMHUxbk16QzFQS0lWY2ZISjduRE14WGxsU0FVbmk1Z01wQ3l6WEYxZFluanc2ZXVHb2hHSENRQVdZcUtDRDRkMlo3OXhyMGcxNWZ1M1hzQ245bCtkSk9Zeis4TFFQaFBNazhtYVI2Q2ZzY1B0dHU0czJWZmRvKzRwZlp4aFAiLCJtYWMiOiI1NTY0ZTk1MDBmMTRiZDM5ZjEwZTE5ZmVhNzEyODI2MWYyYTY5YWExMDFkZjEyMTgyMTI0YmFlZDg0MmNlNjU3IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Im51cXFLSFVVcUFrMXRGS3JMNG42VEE9PSIsInZhbHVlIjoiUUF0UDZHdTFqUkxyUnJ4eVpvUVhPVWg5TGxoUUxtSDhXQjMrcS9SSXA2RDIxWGdwZlAzRHhMeWxlcDNmbkJsVkNURkUwQjFOTUxwVnFkdk95ZXJKUis0ckVmdHdVaWd5OTgyMzZvTlRDUVNrcER3YU0rNjZoY2JFVlVIWWx6N3QiLCJtYWMiOiI2ZGFkYWZhNTcyZjU5OGQ4MzQzMmU1ZjA1MjZiNGY4NmNkMzkwZmE1YTIyMjcxMWE3NGFmYjg2ZDRjMzE4Y2RmIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-14 18:57:37', '2024-02-14 18:57:37'),
(72, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"dnt\":[\"1\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; bagisto_session=eyJpdiI6ImZhYU9RSHpiU2s1cFFnN25rUjV3N2c9PSIsInZhbHVlIjoiUXpnSmh6aFBPcXRROFpTcTBLMXJtOW5OUHNKTUV6cktET3R2UDQzWTNsZmxZa25aVDZRYlhEUS9lTjU3WnFBUkFYSzZFMWdsSUhFSG45bXRVb3Bjb1o4QzZvK1NNcWNLMU03Y0tXUExEYi9GQWdQS2d3a0d6blVqWFYyRXdUMFQiLCJtYWMiOiJhMGJlMzYwM2YzYTY1MTI5ZTFlNWEwN2Y1MjQ5MmNlNmI5MGVlZTJjZGUzNTVlNTdiMDEzNTQzMGNjY2ZjMTkwIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-15 14:39:08', '2024-02-15 14:39:08'),
(73, 'GET', '[]', 'http://127.0.0.1:8000', 'http://127.0.0.1:8000/customer/login', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"dnt\":[\"1\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6InpZVXJjVUZ4LzVBUFB3N1R3czZFcWc9PSIsInZhbHVlIjoiSk5FcnZhQUlYNldhaE9KMkppM3dPMU1aNDB0WnR1MFhtSjNPSkxQcnk5a0kyMDFPOVVaZS80OTl2MDlmNUxTSHRkNUEzYnMzenVDQUxzVmphdDFnaTFtM2YvQ2MzUHJOM0tzSkxrRlJ4U3UzRmEvRTgzNHR3TUYxbktRbExyK3ciLCJtYWMiOiI1NzFhNzgyZjMyYWU0Mzg3MGExMTVmZmZkNDlmOTY4Y2VkMzQwZWJhOGM4NDQ4ODhiOTEyNzMzNmU1YjMyZDBmIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImVQb2UyZ1pKbzJidC9GUFZ4YnJVK1E9PSIsInZhbHVlIjoiaSs1N3pSRENmTVhsa3orMTdyWlIvNlRkazZTc2tpQlV4OSt0OUFucE41K1V0ZGZqc3B2eW9mZ254RUVyVUFKQTJnNHNBc2I3aFQxNWVmcGhlT3NmUVZ4VzJoZWg5ZmN2VDZzRHBpbXFUWHc4dno5OHovY2VzQTl5UGc0emtzSVciLCJtYWMiOiJiYWE4MzY0MGEyN2JjMDlkZDBhN2EwYzBkYzUxMjBlMzJkMWIxYjEyNjU3NDI4NmY2M2M2ODVkZWE2YzlmOTBhIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 2, '2024-02-15 17:10:57', '2024-02-15 17:10:57'),
(74, 'GET', '[]', 'http://127.0.0.1:8000/customer/account/storage/locales/en.svg', 'http://127.0.0.1:8000/customer/account/profile', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"dnt\":[\"1\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/account\\/profile\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImM4U2xlU2Z4bWNxS29KamcySHA4Znc9PSIsInZhbHVlIjoiVlhuaGVaQ0xTOWswM29xeCtHOHVkLytZMTNNcE42Slo1UFg5VE5YSzFXYkNDeUJBcG8yQlN5Q3NNZ2FxRUV5cE9UcmgzcVY5di9ZQXVOTXNxQ1pWdVQ2RDh2RSt6YTh0S3ZGUDdmdit2RXNUUFc3dWIyRU44S2dyWXkyN3VWdVciLCJtYWMiOiI4NGVlY2ExOGZmZGVjMjQ5YWRlMDVjOGNiNjdhMmI5NjUyMzlmMmZjZjQ5YTlmZWMwN2Q3MGFkMzRhMWY2NTM4IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IkRTemNITjE3d2pkMU44Y2hQckU0akE9PSIsInZhbHVlIjoiTEtubzUwWUdVdG1QV3VhSmF1S0dBRmNjVGtmSm9TaWpWam1wVkoxNVljRFdjc2N2cmNjZW5ZSlAxTWFiOURrZ0pUWWJVSkZocTBnQzd2cVVxbkhoZlVsSDBnN2wreTVFMGM2bk9jVnU2OXFERDdMNHo2a1lWNWRvaGdOWGh6UjgiLCJtYWMiOiJhODZhMDMyYzY4MDYxNGQ2MWM4MmNkNDUyNTcwMzQ0N2QyODk0NzRjNzk1YWJiZDI1Njk2NzRjOWJhOWFkOGI0IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 2, '2024-02-15 17:11:11', '2024-02-15 17:11:11'),
(75, 'GET', '[]', 'http://127.0.0.1:8000/customer/account/profile/storage/locales/en.svg', 'http://127.0.0.1:8000/customer/account/profile/edit', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"dnt\":[\"1\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/account\\/profile\\/edit\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlNJdml1bjIzOERBUFFjRWI5b1cxaVE9PSIsInZhbHVlIjoiTDBFbUFacWxmbzdXSk1ubUEvYmlkWEpNOE9mMmh2NWxVaTdMb1Jia05ZRTQrekduZlgwN0JSdWdjSnpXT0l3ZHNmcmh3djFabDNjOExtMEdtL1hkYkV1WTV5bUh2K2JjY3ZzZGlYMkVpajBYMzVHSW1VeTBmTjlSeXQ5K3AwMzEiLCJtYWMiOiJjYzJjNjBiOTI2OGFlZDI0NGVkNWI5ZjVkODVmMzk0ODdjZGFkMjQzNWU5M2M4YTFmZGNlNTg3YWVkMjg1MTczIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImZJLzZYV1FpeURjVERXaVBXbUs0YUE9PSIsInZhbHVlIjoiNmJMMkIyNzBXVjcwME10REEwbkNTb0dkUjZrK0ZvcHJFMlFFUmNBKzIreUJsU0dzVDRGbnRuRUFTTkxMWEJFQllEOXFvcm05cldwNFdReWZMbUxjQUtYcWV4STM0dkhCb3FBS0xVaUR1K2t5amRPMzlKUkxzU3pseFlSbGRnSm0iLCJtYWMiOiI1OTM1YWRjOTE5ZDRiOTU3ODE3ZmYxYTY1NWQwYzk3N2JhYzk0MDE5ODZiYjNlMDc3MGM3YTE0YjhlYjI4NGM1IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 2, '2024-02-15 17:11:24', '2024-02-15 17:11:24'),
(76, 'GET', '[]', 'http://127.0.0.1:8000/customer/account/storage/locales/en.svg', NULL, '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"dnt\":[\"1\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"cross-site\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-15 17:58:35', '2024-02-15 17:58:35'),
(77, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"dnt\":[\"1\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkRhYTNVZzVaSExWNnJvR0E0NXMwbVE9PSIsInZhbHVlIjoiK2pzLy9wVlN4UE1OZ3U2OXJvdEdtcWs4RjRIL3hPWWZwR3JyUlZmcUhmdERrVWRQRjRzUFIxQWtYbWl4S2cvZ3hiTlludkRWWGpFajRNNVB4b3JpT2R4UTVLRlZvOTB2SHRhTzVVaUswUWttbGNJMms0eW9LQkVUb3owTUw2N2IiLCJtYWMiOiIyYjI1Yjg3ODUzNWE5Yzc4ZWZkM2M2M2RkZWNlZjUwMmUyYWM0YTgxYjg2YjNhMTVlODM4Njc4ZDU5YmJmN2I2IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImpjNm5oTDlFdmZJVU1LZEcvZkYvZnc9PSIsInZhbHVlIjoiNEZOZVM1bm9kMUJuT2UwVXFCdUFGUlpOTytMSU9LaTRlZStTMUgxK01KNUxOemVIME9rc0YwY1ZqM2Z6WURpTHlFaTNQVnc2ZUgySXJiRWd4VUl2RU0vaGR2aUV1cy9ibTJWY1hHaWNFWmhuY0ZPRHpFWkdYTVYxYWpCVVF4NXAiLCJtYWMiOiJkNmFjZmVkMzRiNGMxZDUzZjliZjBjNjg4YjUzMDJkNjhjNTQyYzEyNDkyZDI3YzEwY2Y2ODBkYmY5NTU0MzczIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-16 14:51:11', '2024-02-16 14:51:11');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `created_at`, `updated_at`) VALUES
(78, 'GET', '[]', 'http://127.0.0.1:8000', 'http://127.0.0.1:8000/customer/login', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"dnt\":[\"1\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlR2WDZJdEJWMDhZYUhSZjJETDh3Tmc9PSIsInZhbHVlIjoiQ0UxYUVzK3oxelhCZlhaRW9IdmRnQmRodDZiQWs3eWs3UUVkQWJPR1lJV21qU1RYMmJZRTd2ckRaZm1IZ2VvVzQvM3lLb2lsWHphdFNiVFAxSVMwbTROQ2tlYTk4U2l1cW5rMk8rakhIRUhLYTRnQ2RVd2lrQXZheGxFZ1NyNXMiLCJtYWMiOiI1MDhiMDkwZTMyYjI4ZDNkZTQyYmZjNWMwNTMwYmNlN2JmMTlmZGFmOTBhNGE5ZTRkMzcyY2QwNjNjZGE3MTI4IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6InRYbXVtTk9CY1VrL2xQMWxsRVh6VHc9PSIsInZhbHVlIjoiNnJGcDlITExlWUdhTTNlZWFtZ3MvazZLMEZKbk5pUTdtYUNPM2cwbmo0S0tiQWVjekQyd1NvY3ZzSWd6NkdvTzVXRkROazU5cG5QK1o3TS9admluMzRaazBvaHdkemREb0NXeHArUlh3dHhkZmZrZVNlVlBRa0hyakdDOGgwREsiLCJtYWMiOiJhMzIzMzQ0YTMxNzFkZTBiYTUzY2MyOGQ3NGMxYWQyMjI0ODQ0ZjBhMjFiYTQxMzQ3YzI4ODc3ZTE1MGNhMmEzIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 3, '2024-02-16 15:46:17', '2024-02-16 15:46:17'),
(79, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-22 03:01:44', '2024-02-22 03:01:44'),
(80, 'GET', '[]', 'http://127.0.0.1:8000', 'http://127.0.0.1:8000/customer/login', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IldmUXp1OVhQeEovLzBzK01qUnJydGc9PSIsInZhbHVlIjoiU3JjcWZXRTUzVXNFRHVKYndJUFNwbDBxUUtiOUxwNEx3WXloUUVBS2VTQ0kyUW9YMXdoV0FXUTFxWHRpVFNPV0ZsWXVEVGdyaEFlQWQ1S21rOEF6dXNiWHlhN2t5RFhtdURIUE5hMGtUNno0SzdzSTV6ZlFRNGUwYnVaMEhRUXkiLCJtYWMiOiI3NTdjZGFjOWYzYjJmMWM3ZDkyZjJkNWFmMzU1NmE2ZjI2ZTk3ZDBkOTMzMGNhOWRjYWMxNjNlYzJjNDY1ZjQ3IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IjlhNTViSzRtV09jVWVadkg0dmJDVkE9PSIsInZhbHVlIjoiWTRCQXpYaUtneFE4K0h6YmdJL2pURnJhb0cxQ0xBUldNN0lqbHBJMTZKZyttb0dZb2M1Qk16UkVlMGhtTXhGd0JLM1htMDZ2TkRlL2FtalBTNTdhMDMrb0U1ZllxRm1LZmRIRndhODFzSkkxNmFkV0RGaSsrenpuZHBtNk5DeXkiLCJtYWMiOiI2OGU3NmEzMzA0ODkwZjZkMDQwM2VlODNlZTMzZGEyOWEzOWQxMGYxNzRkMTM0Y2I3M2MwOTJhM2E5NTI4MWE1IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 3, '2024-02-22 03:04:38', '2024-02-22 03:04:38');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `item_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`item_options`)),
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_items`
--

CREATE TABLE `wishlist_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_customer_id_foreign` (`customer_id`),
  ADD KEY `addresses_cart_id_foreign` (`cart_id`),
  ADD KEY `addresses_order_id_foreign` (`order_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_api_token_unique` (`api_token`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attributes_code_unique` (`code`);

--
-- Indexes for table `attribute_families`
--
ALTER TABLE `attribute_families`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_groups`
--
ALTER TABLE `attribute_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_groups_attribute_family_id_name_unique` (`attribute_family_id`,`name`);

--
-- Indexes for table `attribute_group_mappings`
--
ALTER TABLE `attribute_group_mappings`
  ADD PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  ADD KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`);

--
-- Indexes for table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_options_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `attribute_option_translations`
--
ALTER TABLE `attribute_option_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_option_translations_attribute_option_id_locale_unique` (`attribute_option_id`,`locale`);

--
-- Indexes for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_customer_id_foreign` (`customer_id`),
  ADD KEY `cart_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_parent_id_foreign` (`parent_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_items_tax_category_id_foreign` (`tax_category_id`);

--
-- Indexes for table `cart_item_inventories`
--
ALTER TABLE `cart_item_inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_payment`
--
ALTER TABLE `cart_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_payment_cart_id_foreign` (`cart_id`);

--
-- Indexes for table `cart_rules`
--
ALTER TABLE `cart_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_rule_channels`
--
ALTER TABLE `cart_rule_channels`
  ADD PRIMARY KEY (`cart_rule_id`,`channel_id`),
  ADD KEY `cart_rule_channels_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `cart_rule_coupons`
--
ALTER TABLE `cart_rule_coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_rule_coupons_cart_rule_id_foreign` (`cart_rule_id`);

--
-- Indexes for table `cart_rule_coupon_usage`
--
ALTER TABLE `cart_rule_coupon_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` (`cart_rule_coupon_id`),
  ADD KEY `cart_rule_coupon_usage_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `cart_rule_customers`
--
ALTER TABLE `cart_rule_customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_rule_customers_cart_rule_id_foreign` (`cart_rule_id`),
  ADD KEY `cart_rule_customers_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `cart_rule_customer_groups`
--
ALTER TABLE `cart_rule_customer_groups`
  ADD PRIMARY KEY (`cart_rule_id`,`customer_group_id`),
  ADD KEY `cart_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `cart_rule_translations`
--
ALTER TABLE `cart_rule_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cart_rule_translations_cart_rule_id_locale_unique` (`cart_rule_id`,`locale`);

--
-- Indexes for table `cart_shipping_rates`
--
ALTER TABLE `cart_shipping_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalog_rules`
--
ALTER TABLE `catalog_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalog_rule_channels`
--
ALTER TABLE `catalog_rule_channels`
  ADD PRIMARY KEY (`catalog_rule_id`,`channel_id`),
  ADD KEY `catalog_rule_channels_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `catalog_rule_customer_groups`
--
ALTER TABLE `catalog_rule_customer_groups`
  ADD PRIMARY KEY (`catalog_rule_id`,`customer_group_id`),
  ADD KEY `catalog_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `catalog_rule_products`
--
ALTER TABLE `catalog_rule_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalog_rule_products_product_id_foreign` (`product_id`),
  ADD KEY `catalog_rule_products_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `catalog_rule_products_catalog_rule_id_foreign` (`catalog_rule_id`),
  ADD KEY `catalog_rule_products_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `catalog_rule_product_prices`
--
ALTER TABLE `catalog_rule_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalog_rule_product_prices_product_id_foreign` (`product_id`),
  ADD KEY `catalog_rule_product_prices_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `catalog_rule_product_prices_catalog_rule_id_foreign` (`catalog_rule_id`),
  ADD KEY `catalog_rule_product_prices_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`);

--
-- Indexes for table `category_filterable_attributes`
--
ALTER TABLE `category_filterable_attributes`
  ADD KEY `category_filterable_attributes_category_id_foreign` (`category_id`),
  ADD KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_translations_category_id_slug_locale_unique` (`category_id`,`slug`,`locale`),
  ADD KEY `category_translations_locale_id_foreign` (`locale_id`);

--
-- Indexes for table `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channels_root_category_id_foreign` (`root_category_id`),
  ADD KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  ADD KEY `channels_base_currency_id_foreign` (`base_currency_id`);

--
-- Indexes for table `channel_currencies`
--
ALTER TABLE `channel_currencies`
  ADD PRIMARY KEY (`channel_id`,`currency_id`),
  ADD KEY `channel_currencies_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `channel_inventory_sources`
--
ALTER TABLE `channel_inventory_sources`
  ADD UNIQUE KEY `channel_inventory_sources_channel_id_inventory_source_id_unique` (`channel_id`,`inventory_source_id`),
  ADD KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`);

--
-- Indexes for table `channel_locales`
--
ALTER TABLE `channel_locales`
  ADD PRIMARY KEY (`channel_id`,`locale_id`),
  ADD KEY `channel_locales_locale_id_foreign` (`locale_id`);

--
-- Indexes for table `channel_translations`
--
ALTER TABLE `channel_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `channel_translations_channel_id_locale_unique` (`channel_id`,`locale`),
  ADD KEY `channel_translations_locale_index` (`locale`);

--
-- Indexes for table `cms_pages`
--
ALTER TABLE `cms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_page_channels`
--
ALTER TABLE `cms_page_channels`
  ADD UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  ADD KEY `cms_page_channels_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `cms_page_translations`
--
ALTER TABLE `cms_page_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`);

--
-- Indexes for table `compare_items`
--
ALTER TABLE `compare_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compare_items_product_id_foreign` (`product_id`),
  ADD KEY `compare_items_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `core_config`
--
ALTER TABLE `core_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_states`
--
ALTER TABLE `country_states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_states_country_id_foreign` (`country_id`);

--
-- Indexes for table `country_state_translations`
--
ALTER TABLE `country_state_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_state_translations_country_state_id_foreign` (`country_state_id`);

--
-- Indexes for table `country_translations`
--
ALTER TABLE `country_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_translations_country_id_foreign` (`country_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_exchange_rates`
--
ALTER TABLE `currency_exchange_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currency_exchange_rates_target_currency_unique` (`target_currency`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`),
  ADD UNIQUE KEY `customers_phone_unique` (`phone`),
  ADD UNIQUE KEY `customers_api_token_unique` (`api_token`),
  ADD KEY `customers_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_groups_code_unique` (`code`);

--
-- Indexes for table `customer_notes`
--
ALTER TABLE `customer_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_notes_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `customer_password_resets`
--
ALTER TABLE `customer_password_resets`
  ADD KEY `customer_password_resets_email_index` (`email`);

--
-- Indexes for table `customer_social_accounts`
--
ALTER TABLE `customer_social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_social_accounts_provider_id_unique` (`provider_id`),
  ADD KEY `customer_social_accounts_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  ADD PRIMARY KEY (`id`),
  ADD KEY `downloadable_link_purchased_customer_id_foreign` (`customer_id`),
  ADD KEY `downloadable_link_purchased_order_id_foreign` (`order_id`),
  ADD KEY `downloadable_link_purchased_order_item_id_foreign` (`order_item_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inventory_sources`
--
ALTER TABLE `inventory_sources`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inventory_sources_code_unique` (`code`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_order_id_foreign` (`order_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_items_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locales`
--
ALTER TABLE `locales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `locales_code_unique` (`code`);

--
-- Indexes for table `marketing_campaigns`
--
ALTER TABLE `marketing_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_campaigns_channel_id_foreign` (`channel_id`),
  ADD KEY `marketing_campaigns_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `marketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  ADD KEY `marketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`);

--
-- Indexes for table `marketing_events`
--
ALTER TABLE `marketing_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_templates`
--
ALTER TABLE `marketing_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_order_id_foreign` (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_increment_id_unique` (`increment_id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`),
  ADD KEY `orders_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `order_comments`
--
ALTER TABLE `order_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_comments_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_parent_id_foreign` (`parent_id`),
  ADD KEY `order_items_tax_category_id_foreign` (`tax_category_id`);

--
-- Indexes for table `order_payment`
--
ALTER TABLE `order_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_payment_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_transactions_order_id_foreign` (`order_id`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  ADD KEY `products_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chanel_locale_attribute_value_index_unique` (`channel`,`locale`,`attribute_id`,`product_id`),
  ADD KEY `product_attribute_values_product_id_foreign` (`product_id`),
  ADD KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `product_bundle_options`
--
ALTER TABLE `product_bundle_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_bundle_options_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_bundle_option_products`
--
ALTER TABLE `product_bundle_option_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_bundle_option_products_product_id_foreign` (`product_id`),
  ADD KEY `product_bundle_option_products_product_bundle_option_id_foreign` (`product_bundle_option_id`);

--
-- Indexes for table `product_bundle_option_translations`
--
ALTER TABLE `product_bundle_option_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_bundle_option_translations_option_id_locale_unique` (`product_bundle_option_id`,`locale`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD KEY `product_categories_product_id_foreign` (`product_id`),
  ADD KEY `product_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_cross_sells`
--
ALTER TABLE `product_cross_sells`
  ADD KEY `product_cross_sells_parent_id_foreign` (`parent_id`),
  ADD KEY `product_cross_sells_child_id_foreign` (`child_id`);

--
-- Indexes for table `product_customer_group_prices`
--
ALTER TABLE `product_customer_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_customer_group_prices_product_id_foreign` (`product_id`),
  ADD KEY `product_customer_group_prices_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `product_downloadable_links`
--
ALTER TABLE `product_downloadable_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_downloadable_links_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_downloadable_link_translations`
--
ALTER TABLE `product_downloadable_link_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_translations_link_id_foreign` (`product_downloadable_link_id`);

--
-- Indexes for table `product_downloadable_samples`
--
ALTER TABLE `product_downloadable_samples`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_downloadable_samples_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_downloadable_sample_translations`
--
ALTER TABLE `product_downloadable_sample_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sample_translations_sample_id_foreign` (`product_downloadable_sample_id`);

--
-- Indexes for table `product_flat`
--
ALTER TABLE `product_flat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`),
  ADD KEY `product_flat_attribute_family_id_foreign` (`attribute_family_id`),
  ADD KEY `product_flat_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `product_grouped_products`
--
ALTER TABLE `product_grouped_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_grouped_products_product_id_foreign` (`product_id`),
  ADD KEY `product_grouped_products_associated_product_id_foreign` (`associated_product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_inventories`
--
ALTER TABLE `product_inventories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  ADD KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`);

--
-- Indexes for table `product_inventory_indices`
--
ALTER TABLE `product_inventory_indices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_inventory_indices_product_id_channel_id_unique` (`product_id`,`channel_id`),
  ADD KEY `product_inventory_indices_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `product_ordered_inventories`
--
ALTER TABLE `product_ordered_inventories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  ADD KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `product_price_indices`
--
ALTER TABLE `product_price_indices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_price_indices_product_id_customer_group_id_unique` (`product_id`,`customer_group_id`),
  ADD KEY `product_price_indices_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `product_relations`
--
ALTER TABLE `product_relations`
  ADD KEY `product_relations_parent_id_foreign` (`parent_id`),
  ADD KEY `product_relations_child_id_foreign` (`child_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_review_attachments`
--
ALTER TABLE `product_review_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_review_images_review_id_foreign` (`review_id`);

--
-- Indexes for table `product_super_attributes`
--
ALTER TABLE `product_super_attributes`
  ADD KEY `product_super_attributes_product_id_foreign` (`product_id`),
  ADD KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `product_up_sells`
--
ALTER TABLE `product_up_sells`
  ADD KEY `product_up_sells_parent_id_foreign` (`parent_id`),
  ADD KEY `product_up_sells_child_id_foreign` (`child_id`);

--
-- Indexes for table `product_videos`
--
ALTER TABLE `product_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_videos_product_id_foreign` (`product_id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refunds_order_id_foreign` (`order_id`);

--
-- Indexes for table `refund_items`
--
ALTER TABLE `refund_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refund_items_parent_id_foreign` (`parent_id`),
  ADD KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  ADD KEY `refund_items_refund_id_foreign` (`refund_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipments_order_id_foreign` (`order_id`),
  ADD KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`);

--
-- Indexes for table `shipment_items`
--
ALTER TABLE `shipment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipment_items_shipment_id_foreign` (`shipment_id`);

--
-- Indexes for table `sitemaps`
--
ALTER TABLE `sitemaps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers_list`
--
ALTER TABLE `subscribers_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscribers_list_customer_id_foreign` (`customer_id`),
  ADD KEY `subscribers_list_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `tax_categories`
--
ALTER TABLE `tax_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_categories_code_unique` (`code`);

--
-- Indexes for table `tax_categories_tax_rates`
--
ALTER TABLE `tax_categories_tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  ADD KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_rates_identifier_unique` (`identifier`);

--
-- Indexes for table `theme_customizations`
--
ALTER TABLE `theme_customizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme_customization_translations`
--
ALTER TABLE `theme_customization_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theme_customization_translations_theme_customization_id_foreign` (`theme_customization_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visits_visitable_type_visitable_id_index` (`visitable_type`,`visitable_id`),
  ADD KEY `visits_visitor_type_visitor_id_index` (`visitor_type`,`visitor_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_channel_id_foreign` (`channel_id`),
  ADD KEY `wishlist_product_id_foreign` (`product_id`),
  ADD KEY `wishlist_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_items_channel_id_foreign` (`channel_id`),
  ADD KEY `wishlist_items_product_id_foreign` (`product_id`),
  ADD KEY `wishlist_items_customer_id_foreign` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `attribute_families`
--
ALTER TABLE `attribute_families`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attribute_groups`
--
ALTER TABLE `attribute_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `attribute_options`
--
ALTER TABLE `attribute_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `attribute_option_translations`
--
ALTER TABLE `attribute_option_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=325;

--
-- AUTO_INCREMENT for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart_item_inventories`
--
ALTER TABLE `cart_item_inventories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_payment`
--
ALTER TABLE `cart_payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart_rules`
--
ALTER TABLE `cart_rules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_rule_coupons`
--
ALTER TABLE `cart_rule_coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_rule_coupon_usage`
--
ALTER TABLE `cart_rule_coupon_usage`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_rule_customers`
--
ALTER TABLE `cart_rule_customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_rule_translations`
--
ALTER TABLE `cart_rule_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_shipping_rates`
--
ALTER TABLE `cart_shipping_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `catalog_rules`
--
ALTER TABLE `catalog_rules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalog_rule_products`
--
ALTER TABLE `catalog_rule_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalog_rule_product_prices`
--
ALTER TABLE `catalog_rule_product_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT for table `channels`
--
ALTER TABLE `channels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `channel_translations`
--
ALTER TABLE `channel_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cms_pages`
--
ALTER TABLE `cms_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cms_page_translations`
--
ALTER TABLE `cms_page_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `compare_items`
--
ALTER TABLE `compare_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_config`
--
ALTER TABLE `core_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `country_states`
--
ALTER TABLE `country_states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=587;

--
-- AUTO_INCREMENT for table `country_state_translations`
--
ALTER TABLE `country_state_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2291;

--
-- AUTO_INCREMENT for table `country_translations`
--
ALTER TABLE `country_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1021;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `currency_exchange_rates`
--
ALTER TABLE `currency_exchange_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_notes`
--
ALTER TABLE `customer_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_social_accounts`
--
ALTER TABLE `customer_social_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_sources`
--
ALTER TABLE `inventory_sources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locales`
--
ALTER TABLE `locales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `marketing_campaigns`
--
ALTER TABLE `marketing_campaigns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_events`
--
ALTER TABLE `marketing_events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `marketing_templates`
--
ALTER TABLE `marketing_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_comments`
--
ALTER TABLE `order_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_payment`
--
ALTER TABLE `order_payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT for table `product_bundle_options`
--
ALTER TABLE `product_bundle_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_bundle_option_products`
--
ALTER TABLE `product_bundle_option_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_bundle_option_translations`
--
ALTER TABLE `product_bundle_option_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_customer_group_prices`
--
ALTER TABLE `product_customer_group_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_downloadable_links`
--
ALTER TABLE `product_downloadable_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_downloadable_link_translations`
--
ALTER TABLE `product_downloadable_link_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_downloadable_samples`
--
ALTER TABLE `product_downloadable_samples`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_downloadable_sample_translations`
--
ALTER TABLE `product_downloadable_sample_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_flat`
--
ALTER TABLE `product_flat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_grouped_products`
--
ALTER TABLE `product_grouped_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `product_inventories`
--
ALTER TABLE `product_inventories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_inventory_indices`
--
ALTER TABLE `product_inventory_indices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_ordered_inventories`
--
ALTER TABLE `product_ordered_inventories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_price_indices`
--
ALTER TABLE `product_price_indices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_review_attachments`
--
ALTER TABLE `product_review_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_videos`
--
ALTER TABLE `product_videos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_items`
--
ALTER TABLE `refund_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shipment_items`
--
ALTER TABLE `shipment_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sitemaps`
--
ALTER TABLE `sitemaps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers_list`
--
ALTER TABLE `subscribers_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_categories`
--
ALTER TABLE `tax_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_categories_tax_rates`
--
ALTER TABLE `tax_categories_tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theme_customizations`
--
ALTER TABLE `theme_customizations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `theme_customization_translations`
--
ALTER TABLE `theme_customization_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_groups`
--
ALTER TABLE `attribute_groups`
  ADD CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_group_mappings`
--
ALTER TABLE `attribute_group_mappings`
  ADD CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_option_translations`
--
ALTER TABLE `attribute_option_translations`
  ADD CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  ADD CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`);

--
-- Constraints for table `cart_payment`
--
ALTER TABLE `cart_payment`
  ADD CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_channels`
--
ALTER TABLE `cart_rule_channels`
  ADD CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_coupons`
--
ALTER TABLE `cart_rule_coupons`
  ADD CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_coupon_usage`
--
ALTER TABLE `cart_rule_coupon_usage`
  ADD CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `cart_rule_coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_customers`
--
ALTER TABLE `cart_rule_customers`
  ADD CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_customer_groups`
--
ALTER TABLE `cart_rule_customer_groups`
  ADD CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_translations`
--
ALTER TABLE `cart_rule_translations`
  ADD CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_rule_channels`
--
ALTER TABLE `catalog_rule_channels`
  ADD CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_rule_customer_groups`
--
ALTER TABLE `catalog_rule_customer_groups`
  ADD CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_rule_products`
--
ALTER TABLE `catalog_rule_products`
  ADD CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_rule_product_prices`
--
ALTER TABLE `catalog_rule_product_prices`
  ADD CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_filterable_attributes`
--
ALTER TABLE `category_filterable_attributes`
  ADD CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channels`
--
ALTER TABLE `channels`
  ADD CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `locales` (`id`),
  ADD CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `channel_currencies`
--
ALTER TABLE `channel_currencies`
  ADD CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channel_inventory_sources`
--
ALTER TABLE `channel_inventory_sources`
  ADD CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channel_locales`
--
ALTER TABLE `channel_locales`
  ADD CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channel_translations`
--
ALTER TABLE `channel_translations`
  ADD CONSTRAINT `channel_translations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_page_channels`
--
ALTER TABLE `cms_page_channels`
  ADD CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_page_translations`
--
ALTER TABLE `cms_page_translations`
  ADD CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `compare_items`
--
ALTER TABLE `compare_items`
  ADD CONSTRAINT `compare_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compare_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `country_states`
--
ALTER TABLE `country_states`
  ADD CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `country_state_translations`
--
ALTER TABLE `country_state_translations`
  ADD CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `country_states` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `country_translations`
--
ALTER TABLE `country_translations`
  ADD CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `currency_exchange_rates`
--
ALTER TABLE `currency_exchange_rates`
  ADD CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `currencies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `customer_notes`
--
ALTER TABLE `customer_notes`
  ADD CONSTRAINT `customer_notes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_social_accounts`
--
ALTER TABLE `customer_social_accounts`
  ADD CONSTRAINT `customer_social_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  ADD CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `marketing_campaigns`
--
ALTER TABLE `marketing_campaigns`
  ADD CONSTRAINT `marketing_campaigns_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `marketing_events` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `marketing_templates` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_comments`
--
ALTER TABLE `order_comments`
  ADD CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`);

--
-- Constraints for table `order_payment`
--
ALTER TABLE `order_payment`
  ADD CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD CONSTRAINT `order_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`),
  ADD CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_bundle_options`
--
ALTER TABLE `product_bundle_options`
  ADD CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_bundle_option_products`
--
ALTER TABLE `product_bundle_option_products`
  ADD CONSTRAINT `product_bundle_option_products_product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_bundle_option_translations`
--
ALTER TABLE `product_bundle_option_translations`
  ADD CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_cross_sells`
--
ALTER TABLE `product_cross_sells`
  ADD CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_customer_group_prices`
--
ALTER TABLE `product_customer_group_prices`
  ADD CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_downloadable_links`
--
ALTER TABLE `product_downloadable_links`
  ADD CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_downloadable_link_translations`
--
ALTER TABLE `product_downloadable_link_translations`
  ADD CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `product_downloadable_links` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_downloadable_samples`
--
ALTER TABLE `product_downloadable_samples`
  ADD CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_downloadable_sample_translations`
--
ALTER TABLE `product_downloadable_sample_translations`
  ADD CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `product_downloadable_samples` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_flat`
--
ALTER TABLE `product_flat`
  ADD CONSTRAINT `product_flat_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`),
  ADD CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_grouped_products`
--
ALTER TABLE `product_grouped_products`
  ADD CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_inventories`
--
ALTER TABLE `product_inventories`
  ADD CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_inventory_indices`
--
ALTER TABLE `product_inventory_indices`
  ADD CONSTRAINT `product_inventory_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_inventory_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_ordered_inventories`
--
ALTER TABLE `product_ordered_inventories`
  ADD CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_price_indices`
--
ALTER TABLE `product_price_indices`
  ADD CONSTRAINT `product_price_indices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_price_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_relations`
--
ALTER TABLE `product_relations`
  ADD CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_review_attachments`
--
ALTER TABLE `product_review_attachments`
  ADD CONSTRAINT `product_review_images_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_super_attributes`
--
ALTER TABLE `product_super_attributes`
  ADD CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  ADD CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_up_sells`
--
ALTER TABLE `product_up_sells`
  ADD CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_videos`
--
ALTER TABLE `product_videos`
  ADD CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `refunds`
--
ALTER TABLE `refunds`
  ADD CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `refund_items`
--
ALTER TABLE `refund_items`
  ADD CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipment_items`
--
ALTER TABLE `shipment_items`
  ADD CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscribers_list`
--
ALTER TABLE `subscribers_list`
  ADD CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscribers_list_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tax_categories_tax_rates`
--
ALTER TABLE `tax_categories_tax_rates`
  ADD CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `theme_customization_translations`
--
ALTER TABLE `theme_customization_translations`
  ADD CONSTRAINT `theme_customization_translations_theme_customization_id_foreign` FOREIGN KEY (`theme_customization_id`) REFERENCES `theme_customizations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  ADD CONSTRAINT `wishlist_items_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
