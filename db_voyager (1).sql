-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2022 at 05:49 PM
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
-- Database: `db_voyager`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(2, NULL, 1, 'Category 2', 'category-2', '2022-09-27 04:47:27', '2022-09-27 04:47:27');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, '{}', 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 0, 0, 1, 1, 1, 1, '{}', 4),
(48, 6, 'body', 'rich_text_box', 'Body', 0, 0, 1, 1, 1, 1, '{}', 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, '{}', 12);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-09-27 04:47:27', '2022-10-07 15:10:39');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(2, 'Pimpinan', '2022-09-29 00:38:49', '2022-09-29 00:38:49'),
(3, 'Tim SPBE', '2022-10-02 00:50:38', '2022-10-02 00:50:38'),
(4, 'Admin Pusat', '2022-10-02 00:50:47', '2022-10-02 00:50:47'),
(5, 'Admin Provinsi', '2022-10-02 00:50:58', '2022-10-02 00:50:58'),
(6, 'Admin Kabupaten/Kota', '2022-10-02 00:51:10', '2022-10-02 00:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', '#000000', 68, 1, '2022-09-27 04:47:27', '2022-10-06 12:02:50', 'voyager.dashboard', 'null'),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, 68, 2, '2022-09-27 04:47:27', '2022-10-06 12:02:51', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, 68, 4, '2022-09-27 04:47:27', '2022-10-06 12:02:53', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 68, 3, '2022-09-27 04:47:27', '2022-10-06 12:02:52', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 2, '2022-09-27 04:47:27', '2022-10-06 12:03:41', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2022-09-27 04:47:27', '2022-10-02 02:07:07', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2022-09-27 04:47:27', '2022-10-02 02:07:07', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2022-09-27 04:47:27', '2022-10-02 02:07:07', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2022-09-27 04:47:27', '2022-10-02 21:34:36', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, 68, 8, '2022-09-27 04:47:27', '2022-10-06 12:03:39', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, 68, 7, '2022-09-27 04:47:27', '2022-10-06 12:02:58', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, 68, 5, '2022-09-27 04:47:27', '2022-10-06 12:02:55', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, 68, 6, '2022-09-27 04:47:27', '2022-10-06 12:02:56', 'voyager.pages.index', NULL),
(15, 2, 'Beranda', '/pimpinan', '_self', 'voyager-boat', '#000000', 43, 1, '2022-10-02 03:02:17', '2022-10-06 12:22:58', NULL, ''),
(16, 1, 'Pimpinan', '/pimpinan', '_self', NULL, '#000000', NULL, 3, '2022-10-02 21:29:57', '2022-10-06 12:03:39', NULL, ''),
(17, 1, 'Beranda', '/pimpinan', '_self', NULL, '#000000', 16, 1, '2022-10-02 21:32:43', '2022-10-05 20:09:46', NULL, ''),
(18, 1, 'Daftar Kegiatan', '/pimpinan/daftarkegiatan', '_self', NULL, '#000000', 16, 2, '2022-10-02 21:35:46', '2022-10-05 20:10:26', NULL, ''),
(19, 1, 'Daftar Usulan', '/pimpinan/daftarusulan', '_self', NULL, '#000000', 16, 3, '2022-10-02 21:36:55', '2022-10-05 20:10:46', NULL, ''),
(20, 1, 'Admin Pusat', '/pusat', '_self', NULL, '#000000', NULL, 4, '2022-10-02 22:08:38', '2022-10-06 12:06:43', NULL, ''),
(21, 1, 'Beranda', '/pusat', '_self', NULL, '#000000', 20, 1, '2022-10-02 22:09:01', '2022-10-06 12:06:55', NULL, ''),
(22, 1, 'Perencanaan', '/pusat/perencanaan', '_self', NULL, '#000000', 20, 2, '2022-10-02 22:09:17', '2022-10-06 12:07:04', NULL, ''),
(23, 1, 'Daftar Ususlan', '/pusat/daftarusulan', '_self', NULL, '#000000', 20, 4, '2022-10-02 22:09:35', '2022-10-06 12:07:35', NULL, ''),
(25, 1, 'Persetujuan', '/pimpinan/persetujuan', '_self', NULL, '#000000', 16, 4, '2022-10-05 19:45:03', '2022-10-05 20:11:01', NULL, ''),
(26, 1, 'Daftar Kegiatan', '/pusat/daftarkegiatan', '_self', NULL, '#000000', 20, 3, '2022-10-05 19:45:49', '2022-10-06 12:07:14', NULL, ''),
(27, 1, 'Persetujuan', '/pusat/persetujuan', '_self', NULL, '#000000', 20, 6, '2022-10-05 19:47:13', '2022-10-06 12:07:53', NULL, ''),
(28, 1, 'Registrasi', '/pusat/registrasi', '_self', NULL, '#000000', 20, 7, '2022-10-05 19:47:22', '2022-10-06 12:07:25', NULL, ''),
(29, 1, 'Admin Provinsi', '/provinsi', '_self', NULL, '#000000', NULL, 6, '2022-10-05 19:47:41', '2022-10-06 12:08:22', NULL, ''),
(30, 1, 'Admin Kabupaten/Kota', '/kabkot', '_self', NULL, '#000000', NULL, 7, '2022-10-05 19:47:52', '2022-10-06 12:08:32', NULL, ''),
(31, 1, 'Beranda', '/provinsi', '_self', NULL, '#000000', 29, 1, '2022-10-05 19:48:57', '2022-10-06 12:15:53', NULL, ''),
(32, 1, 'Daftar Kegiatan', '/provinsi/daftarkegiatan', '_self', NULL, '#000000', 29, 2, '2022-10-05 19:50:17', '2022-10-06 12:17:22', NULL, ''),
(33, 1, 'Pengelolaan', '/provinsi/pengelolaan', '_self', NULL, '#000000', 29, 3, '2022-10-05 19:50:26', '2022-10-06 12:30:20', NULL, ''),
(34, 1, 'Daftar Usulan', '/provinsi/daftarusulan', '_self', NULL, '#000000', 29, 4, '2022-10-05 19:50:37', '2022-10-06 12:18:53', NULL, ''),
(35, 1, 'Admin Tim SPBE', '/timspbe', '_self', NULL, '#000000', NULL, 5, '2022-10-05 19:51:50', '2022-10-06 12:08:08', NULL, ''),
(36, 1, 'Beranda', '/kabkot', '_self', NULL, '#000000', 30, 1, '2022-10-05 19:52:43', '2022-10-06 12:16:22', NULL, ''),
(37, 1, 'Daftar Kegiatan', '/kabkot/daftarkegiatan', '_self', NULL, '#000000', 30, 2, '2022-10-05 19:52:53', '2022-10-06 12:18:30', NULL, ''),
(38, 1, 'Pengelolaan', '/kabkot/pengelolaan', '_self', NULL, '#000000', 30, 3, '2022-10-05 19:53:05', '2022-10-06 12:18:05', NULL, ''),
(39, 1, 'Daftar Usulan', '/kabkot/daftarusulan', '_self', NULL, '#000000', 30, 4, '2022-10-05 19:53:14', '2022-10-06 12:17:44', NULL, ''),
(40, 1, 'Beranda', '/timspbe', '_self', NULL, '#000000', 35, 1, '2022-10-05 19:54:19', '2022-10-06 12:09:40', NULL, ''),
(41, 1, 'Daftar Kegiatan', '/timspbe/daftarkegiatan', '_self', NULL, '#000000', 35, 2, '2022-10-05 19:54:28', '2022-10-06 12:09:30', NULL, ''),
(42, 1, 'Pengelolaan', '/timspbe/pengelolaan', '_self', NULL, '#000000', 35, 3, '2022-10-05 19:54:36', '2022-10-06 12:15:17', NULL, ''),
(43, 2, 'Pimpinan', '/pimpinan', '_self', NULL, '#000000', NULL, 1, '2022-10-05 19:56:43', '2022-10-06 12:22:52', NULL, ''),
(44, 2, 'Daftar Kegiatan', '/pimpinan/daftarkegiatan', '_self', NULL, '#000000', 43, 2, '2022-10-05 19:57:23', '2022-10-06 12:23:06', NULL, ''),
(45, 2, 'Daftar Usulan', '/pimpinan/daftarusulan', '_self', NULL, '#000000', 43, 3, '2022-10-05 19:57:32', '2022-10-06 12:23:15', NULL, ''),
(46, 2, 'Persetujuan', '/pimpinan/persetujuan', '_self', NULL, '#000000', 43, 4, '2022-10-05 19:57:41', '2022-10-06 12:23:37', NULL, ''),
(47, 3, 'Admin Tim SPBE', '/timspbe', '_self', NULL, '#000000', NULL, 1, '2022-10-05 19:58:55', '2022-10-06 12:26:37', NULL, ''),
(48, 3, 'Beranda', '/timspbe', '_self', NULL, '#000000', 47, 1, '2022-10-05 19:59:11', '2022-10-06 12:26:43', NULL, ''),
(49, 3, 'Daftar Kegiatan', '/timspbe/daftarkegiatan', '_self', NULL, '#000000', 47, 2, '2022-10-05 19:59:20', '2022-10-06 12:26:52', NULL, ''),
(50, 3, 'Pengelolaan', '/timspbe/pengelolaan', '_self', NULL, '#000000', 47, 3, '2022-10-05 19:59:28', '2022-10-06 12:26:59', NULL, ''),
(51, 4, 'Admin Pusat', '/pusat', '_self', NULL, '#000000', NULL, 1, '2022-10-05 19:59:56', '2022-10-06 12:27:20', NULL, ''),
(52, 4, 'Beranda', '/pusat', '_self', NULL, '#000000', 51, 1, '2022-10-05 20:00:11', '2022-10-06 12:27:26', NULL, ''),
(53, 4, 'Perencanaan', '/pusat/perencanaan', '_self', NULL, '#000000', 51, 2, '2022-10-05 20:00:20', '2022-10-06 12:28:29', NULL, ''),
(54, 4, 'Daftar Kegiatan', '/pusat/daftarkegiatan', '_self', NULL, '#000000', 51, 3, '2022-10-05 20:00:31', '2022-10-06 12:27:56', NULL, ''),
(55, 4, 'Daftar Usulan', '/pusat/daftarusulan', '_self', NULL, '#000000', 51, 4, '2022-10-05 20:00:38', '2022-10-06 12:28:41', NULL, ''),
(56, 4, 'Persetujuan', '/pusat/persetujuan', '_self', NULL, '#000000', 51, 5, '2022-10-05 20:00:49', '2022-10-06 12:28:49', NULL, ''),
(57, 4, 'Registrasi', '/pusat/registrasi', '_self', NULL, '#000000', 51, 6, '2022-10-05 20:00:58', '2022-10-06 12:28:57', NULL, ''),
(58, 5, 'Admin Provinsi', '/provinsi', '_self', NULL, '#000000', NULL, 1, '2022-10-05 20:01:36', '2022-10-06 12:29:17', NULL, ''),
(59, 5, 'Beranda', '/provinsi', '_self', NULL, '#000000', 58, 1, '2022-10-05 20:01:51', '2022-10-06 12:29:24', NULL, ''),
(60, 5, 'Daftar Kegiatan', '/provinsi/daftarkegiatan', '_self', NULL, '#000000', 58, 2, '2022-10-05 20:01:59', '2022-10-06 12:29:45', NULL, ''),
(61, 5, 'Pengelolaan', '/provinsi/pengelolaan', '_self', NULL, '#000000', 58, 3, '2022-10-05 20:02:08', '2022-10-06 12:30:42', NULL, ''),
(62, 5, 'Daftar Usulan', '/provinsi/daftarusulan', '_self', NULL, '#000000', 58, 4, '2022-10-05 20:02:17', '2022-10-06 12:29:59', NULL, ''),
(63, 6, 'Admin Kabupaten/Kota', '/kabkot', '_self', NULL, '#000000', NULL, 1, '2022-10-05 20:03:13', '2022-10-06 12:30:59', NULL, ''),
(64, 6, 'Beranda', '/kabkot', '_self', NULL, '#000000', 63, 1, '2022-10-05 20:03:27', '2022-10-06 12:31:05', NULL, ''),
(65, 6, 'Daftar Kegiatan', '/kabkot/daftarkegiatan', '_self', NULL, '#000000', 63, 2, '2022-10-05 20:03:35', '2022-10-06 12:31:13', NULL, ''),
(66, 6, 'Pengelolaan', '/kabkot/pengelolaan', '_self', NULL, '#000000', 63, 3, '2022-10-05 20:03:45', '2022-10-06 12:31:20', NULL, ''),
(67, 6, 'Daftar Usulan', '/kabkot/daftarusulan', '_self', NULL, '#000000', 63, 4, '2022-10-05 20:03:53', '2022-10-06 12:31:27', NULL, ''),
(68, 1, 'Admin', '/admin', '_self', 'voyager-person', '#000000', NULL, 1, '2022-10-06 12:01:58', '2022-10-06 12:03:41', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2022-09-27 04:47:27', '2022-09-27 04:47:27');

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(2, 'browse_bread', NULL, '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(3, 'browse_database', NULL, '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(4, 'browse_media', NULL, '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(5, 'browse_compass', NULL, '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(6, 'browse_menus', 'menus', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(7, 'read_menus', 'menus', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(8, 'edit_menus', 'menus', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(9, 'add_menus', 'menus', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(10, 'delete_menus', 'menus', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(11, 'browse_roles', 'roles', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(12, 'read_roles', 'roles', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(13, 'edit_roles', 'roles', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(14, 'add_roles', 'roles', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(15, 'delete_roles', 'roles', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(16, 'browse_users', 'users', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(17, 'read_users', 'users', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(18, 'edit_users', 'users', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(19, 'add_users', 'users', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(20, 'delete_users', 'users', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(21, 'browse_settings', 'settings', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(22, 'read_settings', 'settings', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(23, 'edit_settings', 'settings', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(24, 'add_settings', 'settings', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(25, 'delete_settings', 'settings', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(26, 'browse_categories', 'categories', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(27, 'read_categories', 'categories', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(28, 'edit_categories', 'categories', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(29, 'add_categories', 'categories', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(30, 'delete_categories', 'categories', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(31, 'browse_posts', 'posts', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(32, 'read_posts', 'posts', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(33, 'edit_posts', 'posts', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(34, 'add_posts', 'posts', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(35, 'delete_posts', 'posts', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(36, 'browse_pages', 'pages', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(37, 'read_pages', 'pages', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(38, 'edit_pages', 'pages', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(39, 'add_pages', 'pages', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(40, 'delete_pages', 'pages', '2022-09-27 04:47:27', '2022-09-27 04:47:27');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(31, 2),
(32, 1),
(32, 2),
(33, 1),
(33, 2),
(34, 1),
(34, 2),
(35, 1),
(35, 2),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-09-27 04:47:27', '2022-09-27 04:47:27');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN', 'Administrator', '2022-09-27 04:47:27', '2022-09-27 04:59:00'),
(2, 'Pimpinan', 'Pimpinan', '2022-09-27 04:47:27', '2022-09-27 04:57:02'),
(3, 'Admin-Kab/Kot', 'Admin Kabupaten/Kota', '2022-09-27 04:52:27', '2022-09-27 05:06:28'),
(4, 'Admin-Pusat', 'Admin Pusat', '2022-09-27 05:02:00', '2022-09-27 05:02:00'),
(5, 'Admin-Prov', 'Admin Provinsi', '2022-09-27 05:06:04', '2022-09-27 05:06:04'),
(6, 'Tim-SPBE', 'Tim SPBE', '2022-09-29 00:40:26', '2022-09-29 00:40:26');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2022-09-27 04:47:27', '2022-09-27 04:47:27'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2022-09-27 04:47:27', '2022-09-27 04:47:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users\\October2022\\0AhHyJVHqdtt5DZ8VXPh.jpg', NULL, '$2y$10$1gaR9R2vF65cEz0m8mqU5.V.Dri4i98F.elYPth/rEkQZPQDp9OOK', 'Nbi5tAizaSA9bUF4Kt9R0ErZ6MHE4pe6kHJ9WFWTMAs0MLAxapMgLP2K6iBv', '{\"locale\":\"en\"}', '2022-09-27 04:47:27', '2022-10-07 15:06:23'),
(2, 2, 'Pimpinan', 'pimpinan@gmail.com', 'users/default.png', NULL, '$2y$10$CyAR0fhWGT3JXkVV1RSdLeRTpQjChE4X7G5NtIdJm34tFmyhdg4BG', NULL, '{\"locale\":\"en\"}', '2022-09-27 05:16:27', '2022-09-27 05:16:27'),
(3, 6, 'Tim SPBE 1', 'timSPBE1@gmail.com', 'users/default.png', NULL, '$2y$10$VgRirOnfwJFCavnZOnMB1erAoMdf2XcxKJtsVJ0g0EX2EvrbXnuDa', NULL, '{\"locale\":\"en\"}', '2022-09-29 11:56:26', '2022-09-29 11:56:26'),
(4, 6, 'Tim SPBE 2', 'timSPBE2@gmail.com', 'users/default.png', NULL, '$2y$10$ip56oBwXFpqEIGRytCohYe4CLbPhs6I4hvPvmNAmCRuGdLr0GhQDC', NULL, '{\"locale\":\"en\"}', '2022-09-29 12:38:16', '2022-09-29 12:38:16'),
(5, 6, 'Tim SPBE 3', 'timSPBE3@gmail.com', 'users/default.png', NULL, '$2y$10$2x7UmuouXHg8Mm2K7N/ojuCFRLzZoFhjClfEApTljAKK44TfprEAu', NULL, '{\"locale\":\"en\"}', '2022-09-29 12:39:37', '2022-09-29 12:39:37'),
(6, 6, 'Tim SPBE 4', 'timSPBE4@gmail.com', 'users/default.png', NULL, '$2y$10$lJ.IBTHlHnW0iByZJ5omhulbJMrXO10lRECdyLlqlwlVY9veTrPCe', NULL, '{\"locale\":\"en\"}', '2022-09-29 12:52:02', '2022-09-29 12:52:02'),
(7, 6, 'Tim SPBE 5', 'timSPBE5@gmail.com', 'users/default.png', NULL, '$2y$10$frcns6u5UDAgP2xQ34cVx.07ClLFEBmRbh5./2v.xv8deQl6FNRwe', NULL, '{\"locale\":\"en\"}', '2022-09-29 12:52:40', '2022-09-29 12:52:40'),
(8, 6, 'Tim SPBE 6', 'timSPBE6@gmail.com', 'users/default.png', NULL, '$2y$10$Q3x0muNX/PcAbWpmjO50Hen2efUszLPMTVYHynyqODKWSwvOCfBi.', NULL, '{\"locale\":\"en\"}', '2022-09-29 12:54:04', '2022-09-29 12:54:04'),
(9, 6, 'Tim SPBE 7', 'timSPBE7@gmail.com', 'users/default.png', NULL, '$2y$10$oyMOJ45LZ5SYOGcIIqC6PuJOJN4F90u0hKpWTQjXGsGmW523bmKkm', NULL, '{\"locale\":\"en\"}', '2022-09-29 12:59:06', '2022-09-29 12:59:06'),
(10, 6, 'Tim SPBE 8', 'timSPBE8@gmail.com', 'users/default.png', NULL, '$2y$10$gsRSjni/7dNx5j7JOOknz.wm/FcPqi4pbblCi2tgFcpqsuRRlRNDC', NULL, '{\"locale\":\"en\"}', '2022-09-29 12:59:35', '2022-09-29 12:59:35'),
(11, 4, 'Admin Pusat', 'adminpusat@gmail.com', 'users/default.png', NULL, '$2y$10$LHwuvNgbJ97eyy4PJbCtLOHCQfl6HsfhIZTHmim2KM56fwHatDYmm', NULL, '{\"locale\":\"en\"}', '2022-09-29 13:00:25', '2022-09-29 13:00:25'),
(12, 5, 'Admin Provinsi (37 Biji)', 'adminprovinsi@gmail.com', 'users/default.png', NULL, '$2y$10$wrG7BoltboiGEwE62LM.KOJt2pr7wKz9qQ1zYrQ3RTf7tKNAQ6ng.', NULL, '{\"locale\":\"en\"}', '2022-09-29 13:02:02', '2022-09-29 13:02:02'),
(13, 3, 'Admin Kab/Kot (514 Biji)', 'adminkabkot@gmail.com', 'users/default.png', NULL, '$2y$10$zwvgBoaa.N0I3Hqs2KFyXu.4K44Xbx0W.GmrCcXIyDRSWDdlIxYXK', NULL, '{\"locale\":\"en\"}', '2022-09-29 13:02:37', '2022-09-29 13:02:37');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

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
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
