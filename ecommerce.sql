-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 06, 2024 lúc 07:49 PM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ecommerce`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`, `category_id`) VALUES
(6, 'OPPO', 'oppo', 0, '2023-10-02 02:35:57', '2023-11-09 03:57:03', 6),
(9, 'DELL', 'dell', 0, '2023-10-19 11:19:58', '2023-11-09 03:46:15', 7),
(10, 'APPLE', 'apple', 0, '2023-11-09 03:48:23', '2023-11-09 03:48:23', 6),
(11, 'LG', 'lg', 0, '2023-11-09 03:52:42', '2023-11-09 03:52:42', 5),
(12, 'Samsung', 'samsung', 0, '2024-01-26 07:13:02', '2024-01-26 07:16:18', 5),
(13, 'Sony', 'sony', 0, '2024-01-26 07:16:30', '2024-01-26 07:16:30', 5),
(14, 'TCL', 'tcl', 0, '2024-01-26 07:17:10', '2024-01-26 07:17:10', 5),
(15, 'Asus', 'asus', 0, '2024-01-26 21:11:32', '2024-01-26 21:11:32', 7),
(16, 'Lenovo', 'lenovo', 0, '2024-01-26 21:11:52', '2024-01-26 21:11:52', 7),
(17, 'Bluetooth', 'bluetooth', 0, '2024-01-26 21:52:16', '2024-01-26 21:52:20', 8),
(18, 'SONY', 'sony', 0, '2024-01-26 22:14:04', '2024-01-26 22:14:38', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_color_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `product_color_id`, `quantity`, `created_at`, `updated_at`) VALUES
(30, 1, 39, NULL, 1, '2024-01-31 11:29:26', '2024-01-31 11:29:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=visible, 1=hidden',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image`, `meta_title`, `meta_keyword`, `meta_description`, `status`, `created_at`, `updated_at`) VALUES
(5, 'TIVI', 'b', 'a', 'uploads/category/1699527505.png', 'e', 'b', 'c', 0, '2023-09-27 08:44:32', '2023-11-09 03:58:25'),
(6, 'Điện thoại', 'adad', 'abc', 'uploads/category/1699527497.png', 'aaa', 'bbb', 'ccc', 0, '2023-09-27 08:44:58', '2024-01-26 03:45:41'),
(7, 'LAPTOP', '12', 'adada', 'uploads/category/1699527487.png', 'eee', 'fff', 'ggg', 0, '2023-09-27 08:45:16', '2023-11-09 03:58:07'),
(8, 'Tai nghe', 'tainghe', 'abc', 'uploads/category/1706266049.png', 'a', 'b', 'c', 0, '2024-01-26 03:44:58', '2024-01-26 03:47:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'RED', '#FF0066', 0, '2023-10-21 02:41:24', '2023-10-21 02:44:57'),
(2, 'GREEN', '#66FF00', 0, '2023-10-21 02:41:31', '2023-10-21 02:41:31'),
(3, 'BLUE', '#6666FF	', 0, '2023-10-21 02:41:38', '2023-10-21 02:41:38'),
(4, 'YELLOW', '#FFFF33	', 0, '2023-10-21 02:41:46', '2023-10-21 02:41:46'),
(5, 'PINK', '#FF00FF', 0, '2023-10-21 02:41:55', '2023-10-21 02:48:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
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
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_09_25_070628_add_details_to_users_table', 2),
(6, '2023_09_25_095033_create_categories_table', 3),
(7, '2023_09_27_154757_create_brands_table', 4),
(8, '2023_09_30_104549_create_products_table', 5),
(15, '2023_09_30_104650_create_product_images_table', 6),
(16, '2023_10_03_162547_create_colors_table', 6),
(17, '2023_10_04_143206_create_product_colors_table', 7),
(18, '2023_10_13_104150_create_sliders_table', 7),
(19, '2023_10_19_175132_add_category_id_to_brands_table', 8),
(20, '2023_10_21_184641_create_wishlists_table', 9),
(21, '2023_10_28_104115_create_carts_table', 10),
(24, '2023_10_31_171913_create_orders_table', 11),
(25, '2023_10_31_172119_create_order_items_table', 11),
(27, '2023_11_10_104650_create_settings_table', 12),
(28, '2023_11_13_092230_create_user_details_table', 13);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `tracking_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_mode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `tracking_no`, `fullname`, `email`, `phone`, `pincode`, `address`, `status_message`, `payment_mode`, `payment_id`, `created_at`, `updated_at`) VALUES
(2, 2, 'funda-HaiArqAdbF', '20522083', 'lduytruong0@gmail.com', '0984145097', '700000', 'TPHCM', 'in progress', 'Cash on Delivery', NULL, '2023-10-31 11:16:11', '2023-10-31 11:16:11'),
(3, 2, 'funda-cPdq28OJ4R', 'Truong', 'lduytruong0@gmail.com', '0984145097', '700000', 'HN', 'in progress', 'Cash on Delivery', NULL, '2023-11-01 02:35:09', '2023-11-01 02:35:09'),
(4, 2, 'funda-95SbU8yUXi', '20522083', 'lduytruong0@gmail.com', '0123456789', '123456', 'SG', 'in progress', 'Cash on Delivery', NULL, '2023-11-01 02:55:49', '2023-11-01 02:55:49'),
(5, 2, 'funda-KEBQByppu6', 'duytruong', 'lduytruong0@gmail.com', '0984145097', '700000', 'TPHCM', 'in progress', 'Cash on Delivery', NULL, '2023-11-01 02:58:41', '2023-11-01 02:58:41'),
(6, 2, 'funda-mjamrBRQyR', '20522083', 'lduytruong0@gmail.com', '0909651751', '123456', 'HP', 'in progress', 'Cash on Delivery', NULL, '2023-11-01 03:05:24', '2023-11-01 03:05:24'),
(8, 2, 'funda-V21VJX1IE7', 'truongdeptrai', 'lduytruong0@gmail.com', '0984145097', '700000', 'TPHCM', 'in progress', 'Cash on Delivery', NULL, '2023-11-01 03:34:11', '2023-11-01 03:34:11'),
(9, 2, 'funda-nWELQeSW4N', 'leuleu', 'lduytruong0@gmail.com', '0984145097', '700000', 'TPHCM', 'completed', 'Cash on Delivery', NULL, '2023-11-03 03:37:10', '2023-11-02 08:59:22'),
(10, 2, 'funda-OVGhnv9chZ', 'Truong', 'lduytruong0@gmail.com', '0984145097', '700000', 'TPHCM', 'in progress', 'Cash on Delivery', NULL, '2023-11-14 03:45:43', '2023-11-14 03:45:43'),
(11, 1, 'funda-GqEIsdNrAN', 'Truong', '20522083@gm.uit.edu.vn', '0984145097', '700000', 'TPHCM', 'in progress', 'Cash on Delivery', NULL, '2023-11-26 20:33:43', '2023-11-26 20:33:43'),
(12, 1, 'funda-ivqAMZ5aMJ', 'truongduy123', '20522083@gm.uit.edu.vn', '0984145097', '700000', 'TPHCM', 'in progress', 'Cash on Delivery', NULL, '2023-12-21 11:36:01', '2023-12-21 11:36:01'),
(13, 1, 'funda-j2gMZ1ib8Y', 'truongduy123', '20522083@gm.uit.edu.vn', '0984145097', '700000', 'TPHCM', 'in progress', 'Cash on Delivery', NULL, '2024-01-27 12:28:35', '2024-01-27 12:28:35'),
(14, 1, 'funda-HNr5858gir', 'truongduy123', '20522083@gm.uit.edu.vn', '0984145097', '700000', 'TPHCM', 'in progress', 'Paid by Paypal', '7Y3593379D050942W', '2024-01-27 12:52:16', '2024-01-27 12:52:16'),
(15, 1, 'funda-PT9p5F7xET', 'truongduy123', '20522083@gm.uit.edu.vn', '0984145097', '700000', 'TPHCM', 'in progress', 'Paid by Paypal', '0XU579435K6588102', '2024-01-27 12:52:48', '2024-01-27 12:52:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_color_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_color_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 10, 2, 5, 45, '2023-10-31 11:13:38', '2023-10-31 11:13:38'),
(2, 2, 10, 2, 2, 45, '2023-10-31 11:16:11', '2023-10-31 11:16:11'),
(3, 3, 10, 2, 3, 45, '2023-11-01 02:35:09', '2023-11-01 02:35:09'),
(4, 4, 10, 2, 4, 45, '2023-11-01 02:55:49', '2023-11-01 02:55:49'),
(5, 5, 9, NULL, 1, 3, '2023-11-01 02:58:41', '2023-11-01 02:58:41'),
(6, 6, 9, NULL, 2, 3, '2023-11-01 03:05:24', '2023-11-01 03:05:24'),
(7, 8, 3, 9, 3, 2, '2023-11-01 03:34:11', '2023-11-01 03:34:11'),
(8, 8, 10, 2, 2, 45, '2023-11-01 03:34:11', '2023-11-01 03:34:11'),
(9, 9, 3, 8, 3, 2, '2023-11-01 03:37:10', '2023-11-01 03:37:10'),
(10, 10, 9, 4, 1, 3, '2023-11-14 03:45:43', '2023-11-14 03:45:43'),
(11, 11, 5, NULL, 1, 20, '2023-11-26 20:33:43', '2023-11-26 20:33:43'),
(12, 12, 9, 4, 2, 3, '2023-12-21 11:36:01', '2023-12-21 11:36:01'),
(13, 13, 44, 67, 1, 65, '2024-01-27 12:28:35', '2024-01-27 12:28:35'),
(14, 14, 49, NULL, 1, 75, '2024-01-27 12:52:16', '2024-01-27 12:52:16'),
(15, 15, 40, NULL, 1, 65, '2024-01-27 12:52:48', '2024-01-27 12:52:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `small_description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_price` int(11) NOT NULL,
  `selling_price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `trending` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=trending, 0=not-trending',
  `featured` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=feature,0=not-feature',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=hidden, 0=visible',
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `brand`, `small_description`, `description`, `original_price`, `selling_price`, `quantity`, `trending`, `featured`, `status`, `meta_title`, `meta_keyword`, `meta_description`, `created_at`, `updated_at`) VALUES
(5, 6, 'OPPO', 'oppo', 'OPPO', 'Đẹp, sang trọng', 'iPhone là một dòng điện thoại thông minh do công ty Apple sản xuất, nổi tiếng với thiết kế sang trọng, hệ điều hành iOS mượt mà và hệ sinh thái đa dạng. Được đánh giá cao về hiệu suất, camera chất lượng và tích hợp nhiều tính năng độc đáo, iPhone đã trở thành một biểu tượng trong thế giới di động.', 10, 20, 29, 1, 1, 0, 'OPPO', 'e', 'd', '2023-10-06 21:37:29', '2024-01-26 21:21:33'),
(9, 7, 'LAPTOP', 'laptop', 'DELL', 'a', 'b', 2, 3, 1, 1, 1, 0, 'LAPTOP', 'e', 'd', '2023-10-06 21:59:30', '2024-01-26 21:21:49'),
(10, 6, 'APPLE IPHONE 14', 'apple-iphone-14', 'APPLE', 'ĐẸP, SANG TRỌNG', 'iPhone là một dòng điện thoại thông minh do công ty Apple sản xuất, nổi tiếng với thiết kế sang trọng, hệ điều hành iOS mượt mà và hệ sinh thái đa dạng. Được đánh giá cao về hiệu suất, camera chất lượng và tích hợp nhiều tính năng độc đáo, iPhone đã trở thành một biểu tượng trong thế giới di động.', 23, 45, 68, 1, 0, 0, 'APPLE IPHONE 14', 'e', 'd', '2023-10-20 02:54:50', '2024-01-26 21:22:00'),
(11, 8, 'Tai nghe Bluetooth Prolink', 'tainghe', 'Bluetooth', 'Chất lượng, xịn xò', 'Chất lượng, xịn xò, giá rẻ', 35, 34, 10, 0, 0, 0, 'Tai nghe Bluetooth Prolink', 'c', 'b', '2024-01-26 03:49:26', '2024-01-26 21:53:05'),
(12, 8, 'Tai nghe Bluetooth chụp tai', 'tai-nghe-bluetooth-chup-tai', 'Bluetooth', 'Tinh tế', 'Tinh tế, sang trọng', 38, 34, 7, 0, 0, 0, 'Tai nghe Bluetooth chụp tai', 'c', 'b', '2024-01-26 03:52:09', '2024-01-26 21:53:22'),
(13, 8, 'Tai nghe Sony Marshall Major IV', 'tai-nghe-sony-marshall-major-iv', 'SONY', 'Đẹp, êm', 'Tai nghe hiện đại đa dạng với nhiều loại như tai nghe dây, tai nghe không dây, tai nghe chống ồn, và tai nghe chuyên dụng cho game hoặc chơi nhạc. Các tính năng như chất lượng âm thanh, thoải mái khi đeo, và khả năng cách âm đều là yếu tố quan trọng khi lựa chọn tai nghe phù hợp với nhu cầu cá nhân.', 30, 25, 5, 0, 0, 0, 'Tai nghe Sony Marshall Major IV', 'c', 'b', '2024-01-26 04:08:00', '2024-01-26 22:17:54'),
(14, 8, 'Tai nghe Bluetooth không dây Bose Quietcomfort', 'tai-nghe-bluetooth-khong-day-bose-quietcomfort', 'Bluetooth', 'Đẹp, êm', 'Tai nghe hiện đại đa dạng với nhiều loại như tai nghe dây, tai nghe không dây, tai nghe chống ồn, và tai nghe chuyên dụng cho game hoặc chơi nhạc. Các tính năng như chất lượng âm thanh, thoải mái khi đeo, và khả năng cách âm đều là yếu tố quan trọng khi lựa chọn tai nghe phù hợp với nhu cầu cá nhân.', 45, 41, 8, 0, 0, 0, 'Tai nghe Bluetooth không dây Bose Quietcomfort', 'c', 'b', '2024-01-26 04:09:27', '2024-01-26 22:18:58'),
(16, 8, 'Tai nghe Bluetooth ROBOT Airbuds T40NC', 'tai-nghe-bluetooth-robot-airbuds-t40nc', 'Bluetooth', 'a', 'b', 20, 18, 3, 0, 0, 0, 'Tai nghe Bluetooth ROBOT Airbuds T40NC', 'c', 'b', '2024-01-26 07:08:34', '2024-01-26 21:53:41'),
(17, 5, 'Tivi Smart TCL HD', 'tivi-smart-tcl-hd', 'TCL', 'Đẹp, sang trọng, tiện nghi', 'TV LED TCL cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 28, 24, 3, 0, 0, 0, 'Tivi Smart TCL HD', 'c', 'b', '2024-01-26 07:13:44', '2024-01-26 21:22:13'),
(18, 5, 'Tivi TCL 4K 75 inch 75P737', 'tivi-tcl-4k-75-inch', 'TCL', 'Đẹp, hiệu quả, sang trọng', 'TV LED TCL cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 23, 20, 3, 0, 0, 0, 'Tivi TCL 4K 75 inch 75P737', 'c', 'b', '2024-01-26 07:21:27', '2024-01-26 21:22:28'),
(19, 5, '55 Inch Tcl Smart Tv', '55-inch-tcl', 'TCL', 'Đẹp, hiệu quả, sang trọng', 'TV LED TCL cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 16, 15, 4, 0, 0, 0, '55 Inch Tcl Smart Tv', 'c', 'b', '2024-01-26 07:27:37', '2024-01-26 21:22:38'),
(20, 5, 'TCL 50P635 Pro 127 cm', 'tcl-50p635-pro', 'TCL', 'Đẹp, hiệu quả, sang trọng', 'TV LED TCL cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 38, 33, 3, 0, 0, 0, 'TCL 50P635 Pro 127 cm', 'c', 'b', '2024-01-26 07:28:48', '2024-01-26 21:22:47'),
(21, 5, 'Smart Tivi TCL 32 inch 32S5400A Android 11', 'tcl-32-inch', 'TCL', 'Đẹp, sang trọng, hiệu quả', 'TV LED TCL cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 34, 33, 2, 0, 0, 0, 'Smart Tivi TCL 32 inch 32S5400A Android 11', 'c', 'g', '2024-01-26 07:29:53', '2024-01-26 21:22:56'),
(22, 5, 'TCL Led TV', 'tclledtv', 'TCL', 'Đẹp, hiệu quả, chất lượng', 'TV LED TCL cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 36, 33, 2, 0, 0, 0, 'TCL Led TV', 'c', 'b', '2024-01-26 07:31:02', '2024-01-26 21:23:05'),
(23, 5, 'Android Tivi Sony Bravia', 'android-tivi-sony-bravia', 'Sony', 'Đẹp, hình ảnh sắc nét', 'TV LED TCL cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 40, 38, 2, 0, 0, 0, 'Android Tivi Sony Bravia', 'c', 'b', '2024-01-26 07:40:44', '2024-01-26 21:23:14'),
(24, 5, '4 K độ phân giải Cao nghĩa truyền hình', '4-k-do-phan-giai-cao-nghia-truyen-hinh', 'Sony', 'Đẹp, nét', 'TV Sony cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 60, 44, 3, 0, 0, 0, '4 K độ phân giải Cao nghĩa truyền hình', 'c', 'b', '2024-01-26 07:41:52', '2024-01-26 21:23:23'),
(25, 5, 'Tivi Sony Bravia Google TV KD-65X85L', 'tivi-sony-bravia-google-tv-kd-65x85l', 'Sony', 'Đẹp, chất lượng', 'TV Sony cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 44, 43, 3, 0, 0, 0, 'Tivi Sony Bravia Google TV KD-65X85L', 'c', 'b', '2024-01-26 07:43:52', '2024-01-26 21:23:36'),
(26, 5, 'Tivi Sony Google TV BRAVIA XR', 'tivi-sony-google-tv-bravia-xr', 'Sony', 'Đẹp, chất lượng', 'TV Sony cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 50, 49, 2, 0, 0, 0, 'Tivi Sony Google TV BRAVIA XR', 'c', 'b', '2024-01-26 07:46:55', '2024-01-26 21:23:48'),
(27, 5, 'Smart Tivi Samsung 4K 55 inch', 'smart-tivi-samsung-4k-55-inch', 'Samsung', 'Đẹp, đơn giản', 'TV Samsung cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 66, 64, 1, 0, 0, 0, 'a', 'v', 'b', '2024-01-26 07:48:41', '2024-01-26 07:48:41'),
(28, 5, 'Smart Tivi Samsung QLED', 'smart-tivi-samsung-qled', 'Samsung', 'Đẹp, sang trọng', 'TV Samsung cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 56, 45, 2, 0, 0, 0, 'a', 'c', 'b', '2024-01-26 08:27:14', '2024-01-26 08:27:14'),
(29, 5, 'Samsung Smart Tivi 4K 50 inch', 'samsung-smart-tivi-4k-50-inch', 'Samsung', 'Đẹp, sang trọng', 'TV Samsung cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 33, 22, 3, 0, 0, 0, 'ab', 'c', 'b', '2024-01-26 08:28:03', '2024-01-26 08:28:03'),
(30, 5, 'Smart Tivi Samsung QA50Q80C 4K QLED', 'smart-tivi-samsung-qa50q80c-4k-qled', 'Samsung', 'Đẹp, sang trọng', 'TV Samsung cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 67, 55, 1, 0, 0, 0, 'ab', 'c', 's', '2024-01-26 08:29:02', '2024-01-26 08:29:02'),
(31, 5, 'Smart Tivi Samsung UA65CU8000 4K 65 inch', 'smart-tivi-samsung-ua65cu8000-4k-65-inch', 'Samsung', 'Đẹp, sang trọng', 'TV Samsung cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 77, 67, 1, 0, 0, 0, 'a', 'c', 'b', '2024-01-26 08:30:06', '2024-01-26 08:30:06'),
(32, 5, 'Smart Tivi Neo QLED Samsung 4K 75 Inch', 'smart-tivi-neo-qled-samsung-4k-75-inch', 'Samsung', 'Đẹp, sang trọng', 'TV Samsung cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 88, 55, 6, 0, 0, 0, 'a', 'c', 'b', '2024-01-26 08:30:55', '2024-01-26 08:30:55'),
(33, 5, 'LG Tivi LG FHD LQ636B 32 inch', 'lg-tivi-lg-fhd-lq636b-32-inch', 'LG', 'Đẹp, sang trọng', 'TV LG cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 55, 52, 1, 0, 0, 0, 'A', 'C', 'B', '2024-01-26 09:26:23', '2024-01-26 09:26:23'),
(34, 5, 'Tivi LG Nanocell NANO80 55 inch 4K', 'tivi-lg-nanocell-nano80-55-inch-4k', 'LG', 'Đẹp, xịn xò', 'TV LG cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 77, 66, 31, 0, 0, 0, 'a', 'c', 'b', '2024-01-26 09:27:30', '2024-01-26 09:27:30'),
(35, 5, 'Smart Tivi LG 65UQ8050PSB 4K 65 inch', 'smart-tivi-lg-65uq8050psb-4k-65-inch', 'LG', 'Đẹp, chất lượng', 'TV LG cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 89, 65, 44, 0, 0, 0, 'a', 'c', 'b', '2024-01-26 09:28:14', '2024-01-26 09:28:14'),
(36, 5, 'Smart Tivi LG 32 inch 32LM575BPTC ThinQ AI', 'smart-tivi-lg-32-inch-32lm575bptc-thinq-ai', 'LG', 'Đẹp, rõ nét', 'TV LG cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 99, 96, 1, 0, 0, 0, 'a', 'c', 'b', '2024-01-26 09:29:15', '2024-01-26 09:29:15'),
(37, 5, 'Smart Tivi OLED LG 4K 55 inch 55C3PSA', 'smart-tivi-oled-lg-4k-55-inch-55c3psa', 'LG', 'Đẹp, sang trọng', 'TV LG cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 88, 87, 1, 0, 0, 0, 'A', 'B', 'C', '2024-01-26 09:29:54', '2024-01-26 09:29:54'),
(38, 5, 'LG Smart Tivi 43 inch 43UH610T', 'lg-smart-tivi-43-inch-43uh610t', 'LG', 'Đẹp, rõ nét', 'TV LG cung cấp chất lượng hình ảnh sắc nét với đa dạng độ phân giải, âm thanh mạnh mẽ, thiết kế hiện đại, hệ điều hành thông minh và tính năng thông minh tiện ích. Đây là lựa chọn đa dạng kích thước và tính năng cho người muốn trải nghiệm giải trí tốt.', 100, 89, 1, 0, 0, 0, 'a', 'c', 'b', '2024-01-26 09:30:48', '2024-01-26 09:30:48'),
(39, 6, 'Apple IPhone 14 Pro max 512GB', 'apple-iphone-14-pro-max-512gb', 'APPLE', 'Đẹp, sang trọng', 'iPhone là một dòng điện thoại thông minh do công ty Apple sản xuất, nổi tiếng với thiết kế sang trọng, hệ điều hành iOS mượt mà và hệ sinh thái đa dạng. Được đánh giá cao về hiệu suất, camera chất lượng và tích hợp nhiều tính năng độc đáo, iPhone đã trở thành một biểu tượng trong thế giới di động.', 77, 74, 3, 0, 0, 0, 'a', 'c', 'b', '2024-01-26 20:56:37', '2024-01-26 20:57:07'),
(40, 6, 'Apple iPhone 14 (512GB)', 'apple-iphone-14-512gb', 'APPLE', 'Đẹp, sang trọng', 'iPhone là một dòng điện thoại thông minh do công ty Apple sản xuất, nổi tiếng với thiết kế sang trọng, hệ điều hành iOS mượt mà và hệ sinh thái đa dạng. Được đánh giá cao về hiệu suất, camera chất lượng và tích hợp nhiều tính năng độc đáo, iPhone đã trở thành một biểu tượng trong thế giới di động.', 67, 65, 2, 0, 0, 0, 'a', 'c', 'b', '2024-01-26 20:58:12', '2024-01-27 12:52:48'),
(41, 6, 'Apple iPhone 13 Pro (512GB)', 'apple-iphone-13-pro-512gb', 'APPLE', 'Đẹp, bắt mắt, độc đáo', 'iPhone là một dòng điện thoại thông minh do công ty Apple sản xuất, nổi tiếng với thiết kế sang trọng, hệ điều hành iOS mượt mà và hệ sinh thái đa dạng. Được đánh giá cao về hiệu suất, camera chất lượng và tích hợp nhiều tính năng độc đáo, iPhone đã trở thành một biểu tượng trong thế giới di động.', 65, 64, 3, 0, 0, 0, 'a', 'c', 'b', '2024-01-26 20:59:38', '2024-01-26 20:59:38'),
(42, 6, 'Apple iPhone 13 (256GB)', 'apple-iphone-13-256gb', 'APPLE', 'Đẹp, sang trọng', 'iPhone là một dòng điện thoại thông minh do công ty Apple sản xuất, nổi tiếng với thiết kế sang trọng, hệ điều hành iOS mượt mà và hệ sinh thái đa dạng. Được đánh giá cao về hiệu suất, camera chất lượng và tích hợp nhiều tính năng độc đáo, iPhone đã trở thành một biểu tượng trong thế giới di động.', 55, 54, 2, 0, 0, 0, 'a', 'c', 'b', '2024-01-26 21:01:05', '2024-01-26 21:01:05'),
(43, 6, 'Apple-iPhone-12-Pro-6.1-inches', 'apple-iphone-12-pro-61-inches', 'APPLE', 'Đẹp, bắt mắt', 'iPhone là một dòng điện thoại thông minh do công ty Apple sản xuất, nổi tiếng với thiết kế sang trọng, hệ điều hành iOS mượt mà và hệ sinh thái đa dạng. Được đánh giá cao về hiệu suất, camera chất lượng và tích hợp nhiều tính năng độc đáo, iPhone đã trở thành một biểu tượng trong thế giới di động.', 60, 55, 2, 0, 0, 0, 'a', 'c', 'b', '2024-01-26 21:02:05', '2024-01-26 21:02:05'),
(44, 6, 'OPPO Reno6 5G', 'oppo-reno6-5g', 'OPPO', 'Đẹp, sang trọng', 'iPhone là một dòng điện thoại thông minh do công ty Apple sản xuất, nổi tiếng với thiết kế sang trọng, hệ điều hành iOS mượt mà và hệ sinh thái đa dạng. Được đánh giá cao về hiệu suất, camera chất lượng và tích hợp nhiều tính năng độc đáo, iPhone đã trở thành một biểu tượng trong thế giới di động.', 66, 65, 6, 0, 0, 0, 'a', 'c', 'b', '2024-01-26 21:04:02', '2024-01-26 21:04:02'),
(45, 6, 'Oppo Mobile Phone', 'oppo-mobile-phone', 'OPPO', 'Đẹp, sang trọng', 'iPhone là một dòng điện thoại thông minh do công ty Apple sản xuất, nổi tiếng với thiết kế sang trọng, hệ điều hành iOS mượt mà và hệ sinh thái đa dạng. Được đánh giá cao về hiệu suất, camera chất lượng và tích hợp nhiều tính năng độc đáo, iPhone đã trở thành một biểu tượng trong thế giới di động.', 44, 43, 2, 0, 0, 0, 'a', 'c', 'b', '2024-01-26 21:04:53', '2024-01-26 21:04:53'),
(46, 6, 'OPPO Iphone', 'oppo-iphone', 'OPPO', 'Đẹp, bắt mắt', 'iPhone là một dòng điện thoại thông minh do công ty Apple sản xuất, nổi tiếng với thiết kế sang trọng, hệ điều hành iOS mượt mà và hệ sinh thái đa dạng. Được đánh giá cao về hiệu suất, camera chất lượng và tích hợp nhiều tính năng độc đáo, iPhone đã trở thành một biểu tượng trong thế giới di động.', 55, 50, 1, 0, 0, 0, 'a', 'c', 'b', '2024-01-26 21:06:04', '2024-01-26 21:06:04'),
(47, 6, 'OPPO F7', 'oppo-f7', 'OPPO', 'Đẹp, sang trọng', 'iPhone là một dòng điện thoại thông minh do công ty Apple sản xuất, nổi tiếng với thiết kế sang trọng, hệ điều hành iOS mượt mà và hệ sinh thái đa dạng. Được đánh giá cao về hiệu suất, camera chất lượng và tích hợp nhiều tính năng độc đáo, iPhone đã trở thành một biểu tượng trong thế giới di động.', 60, 60, 1, 0, 0, 0, 'a', 'c', 'b', '2024-01-26 21:07:50', '2024-01-26 21:07:50'),
(48, 6, 'Oppo Mobile Phone F9 Pro', 'oppo-mobile-phone-f9-pro', 'OPPO', 'Đẹp, sang trọng', 'iPhone là một dòng điện thoại thông minh do công ty Apple sản xuất, nổi tiếng với thiết kế sang trọng, hệ điều hành iOS mượt mà và hệ sinh thái đa dạng. Được đánh giá cao về hiệu suất, camera chất lượng và tích hợp nhiều tính năng độc đáo, iPhone đã trở thành một biểu tượng trong thế giới di động.', 50, 49, 1, 0, 0, 0, 'a', 'c', 'b', '2024-01-26 21:08:48', '2024-01-26 21:08:48'),
(49, 7, 'Laptop Asus L510MA-WB04', 'laptop-asus-l510ma-wb04', 'Asus', 'Đẹp, rẻ', 'Laptop là thiết bị di động, nhỏ gọn, tích hợp màn hình, bàn phím và touchpad, được thiết kế để cung cấp tính di động và tiện ích cho người dùng. Với khả năng chạy nhiều ứng dụng và thực hiện nhiều công việc đa nhiệm, laptop đã trở thành công cụ hữu ích cho công việc, học tập và giải trí.', 77, 75, 1, 0, 0, 0, 'a', 'c', 'b', '2024-01-26 21:11:18', '2024-01-27 12:52:16'),
(50, 7, 'Laptop Asus ExpertBook P2451FA-EK3299T,', 'laptop-asus-expertbook-p2451fa-ek3299t', 'Asus', 'Đẹp, sang trọng', 'Laptop là thiết bị di động, nhỏ gọn, tích hợp màn hình, bàn phím và touchpad, được thiết kế để cung cấp tính di động và tiện ích cho người dùng. Với khả năng chạy nhiều ứng dụng và thực hiện nhiều công việc đa nhiệm, laptop đã trở thành công cụ hữu ích cho công việc, học tập và giải trí.', 66, 65, 3, 0, 0, 0, 'a', 'v', 'b', '2024-01-26 21:14:10', '2024-01-26 21:14:10'),
(51, 7, 'Laptop Lenovo IdeaPad 3 14IAU7-82RJ001BVN', 'laptop-lenovo-ideapad-3-14iau7-82rj001bvn', 'Lenovo', 'Đẹp, sang trọng', 'Laptop là thiết bị di động, nhỏ gọn, tích hợp màn hình, bàn phím và touchpad, được thiết kế để cung cấp tính di động và tiện ích cho người dùng. Với khả năng chạy nhiều ứng dụng và thực hiện nhiều công việc đa nhiệm, laptop đã trở thành công cụ hữu ích cho công việc, học tập và giải trí.', 60, 58, 3, 0, 0, 0, 'ab', 'c', 'b', '2024-01-26 21:15:35', '2024-01-26 21:15:35'),
(52, 7, 'Laptop Lenovo IdeaPad 3 14AIH8', 'laptop-lenovo-ideapad-3-14aih8', 'Lenovo', 'Đẹp, sang trọng', 'Laptop là thiết bị di động, nhỏ gọn, tích hợp màn hình, bàn phím và touchpad, được thiết kế để cung cấp tính di động và tiện ích cho người dùng. Với khả năng chạy nhiều ứng dụng và thực hiện nhiều công việc đa nhiệm, laptop đã trở thành công cụ hữu ích cho công việc, học tập và giải trí.', 78, 75, 2, 0, 0, 0, 'a', 'c', 'bc', '2024-01-26 21:16:34', '2024-01-26 21:16:34'),
(53, 7, 'Laptop Lenovo ThinkPad', 'laptop-lenovo-thinkpad', 'Lenovo', 'Đẹp, sang trọng', 'Laptop là thiết bị di động, nhỏ gọn, tích hợp màn hình, bàn phím và touchpad, được thiết kế để cung cấp tính di động và tiện ích cho người dùng. Với khả năng chạy nhiều ứng dụng và thực hiện nhiều công việc đa nhiệm, laptop đã trở thành công cụ hữu ích cho công việc, học tập và giải trí.', 66, 65, 3, 0, 0, 0, 'a', 'c', 'b', '2024-01-26 21:17:50', '2024-01-26 21:17:50'),
(54, 8, 'Tai Nghe Bluetooth Sony WH-CH520', 'tai-nghe-bluetooth-sony-wh-ch520', 'SONY', 'Đẹp, êm', 'Tai nghe hiện đại đa dạng với nhiều loại như tai nghe dây, tai nghe không dây, tai nghe chống ồn, và tai nghe chuyên dụng cho game hoặc chơi nhạc. Các tính năng như chất lượng âm thanh, thoải mái khi đeo, và khả năng cách âm đều là yếu tố quan trọng khi lựa chọn tai nghe phù hợp với nhu cầu cá nhân.', 66, 55, 1, 0, 0, 0, 'Tai Nghe Bluetooth Sony WH-CH520', 'b', 'a', '2024-01-26 22:15:31', '2024-01-26 22:15:31'),
(55, 8, 'Tai nghe Sony In-ear không dây', 'tai-nghe-sony-in-ear-khong-day', 'SONY', 'Đẹp, êm', 'Tai nghe hiện đại đa dạng với nhiều loại như tai nghe dây, tai nghe không dây, tai nghe chống ồn, và tai nghe chuyên dụng cho game hoặc chơi nhạc. Các tính năng như chất lượng âm thanh, thoải mái khi đeo, và khả năng cách âm đều là yếu tố quan trọng khi lựa chọn tai nghe phù hợp với nhu cầu cá nhân.', 43, 22, 1, 0, 0, 0, 'Tai nghe Sony In-ear không dây', 'Tai nghe Sony In-ear không dây', 'Tai nghe Sony In-ear không dây', '2024-01-26 22:16:25', '2024-01-26 22:16:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_colors`
--

CREATE TABLE `product_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_colors`
--

INSERT INTO `product_colors` (`id`, `product_id`, `color_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 10, 1, 0, '2023-10-21 02:42:33', '2023-10-21 02:42:33'),
(2, 10, 5, 1, '2023-10-21 02:42:33', '2023-11-01 03:34:11'),
(3, 9, 1, 2, '2023-11-01 03:21:13', '2023-11-01 03:21:13'),
(4, 9, 2, 0, '2023-11-01 03:21:13', '2023-12-21 11:36:01'),
(5, 9, 3, 4, '2023-11-01 03:21:13', '2023-11-01 03:21:13'),
(6, 9, 4, 5, '2023-11-01 03:21:13', '2023-11-01 03:21:13'),
(7, 9, 5, 6, '2023-11-01 03:21:13', '2023-11-01 03:21:13'),
(11, 11, 1, 4, '2024-01-26 03:49:26', '2024-01-26 03:49:26'),
(12, 11, 2, 5, '2024-01-26 03:49:26', '2024-01-26 03:49:26'),
(13, 11, 5, 3, '2024-01-26 03:49:26', '2024-01-26 03:49:26'),
(14, 12, 2, 5, '2024-01-26 03:52:09', '2024-01-26 03:52:09'),
(15, 12, 5, 7, '2024-01-26 03:52:09', '2024-01-26 03:52:09'),
(16, 13, 1, 3, '2024-01-26 04:08:00', '2024-01-26 04:08:00'),
(17, 13, 2, 2, '2024-01-26 04:08:00', '2024-01-26 04:08:00'),
(18, 13, 3, 2, '2024-01-26 04:08:00', '2024-01-26 04:08:00'),
(19, 14, 1, 2, '2024-01-26 04:09:27', '2024-01-26 04:09:27'),
(20, 14, 2, 3, '2024-01-26 04:09:27', '2024-01-26 04:09:27'),
(21, 14, 3, 2, '2024-01-26 04:09:27', '2024-01-26 04:09:27'),
(22, 14, 5, 1, '2024-01-26 04:09:27', '2024-01-26 04:09:27'),
(25, 16, 1, 4, '2024-01-26 07:08:34', '2024-01-26 07:08:34'),
(26, 16, 3, 3, '2024-01-26 07:08:34', '2024-01-26 07:08:34'),
(27, 17, 1, 1, '2024-01-26 07:13:44', '2024-01-26 07:13:44'),
(28, 17, 2, 1, '2024-01-26 07:13:44', '2024-01-26 07:13:44'),
(29, 17, 3, 1, '2024-01-26 07:13:44', '2024-01-26 07:13:44'),
(30, 18, 1, 2, '2024-01-26 07:21:27', '2024-01-26 07:21:27'),
(31, 18, 2, 3, '2024-01-26 07:21:27', '2024-01-26 07:21:27'),
(32, 19, 2, 1, '2024-01-26 07:27:37', '2024-01-26 07:27:37'),
(33, 19, 3, 1, '2024-01-26 07:27:37', '2024-01-26 07:27:37'),
(34, 20, 1, 2, '2024-01-26 07:28:48', '2024-01-26 07:28:48'),
(35, 20, 5, 3, '2024-01-26 07:28:48', '2024-01-26 07:28:48'),
(36, 21, 3, 2, '2024-01-26 07:29:53', '2024-01-26 07:29:53'),
(37, 22, 1, 2, '2024-01-26 07:31:02', '2024-01-26 07:31:02'),
(38, 23, 2, 2, '2024-01-26 07:40:44', '2024-01-26 07:40:44'),
(39, 23, 3, 2, '2024-01-26 07:40:44', '2024-01-26 07:40:44'),
(40, 24, 1, 1, '2024-01-26 07:41:52', '2024-01-26 07:41:52'),
(41, 24, 5, 2, '2024-01-26 07:41:52', '2024-01-26 07:41:52'),
(42, 25, 3, 2, '2024-01-26 07:43:52', '2024-01-26 07:43:52'),
(43, 26, 4, 4, '2024-01-26 07:46:55', '2024-01-26 07:46:55'),
(44, 27, 4, 2, '2024-01-26 07:48:41', '2024-01-26 07:48:41'),
(45, 27, 5, 1, '2024-01-26 07:48:41', '2024-01-26 07:48:41'),
(46, 28, 2, 2, '2024-01-26 08:27:14', '2024-01-26 08:27:14'),
(47, 29, 2, 2, '2024-01-26 08:28:03', '2024-01-26 08:28:03'),
(48, 29, 3, 4, '2024-01-26 08:28:03', '2024-01-26 08:28:03'),
(49, 30, 1, 3, '2024-01-26 08:29:02', '2024-01-26 08:29:02'),
(50, 30, 5, 2, '2024-01-26 08:29:02', '2024-01-26 08:29:02'),
(51, 31, 3, 2, '2024-01-26 08:30:06', '2024-01-26 08:30:06'),
(52, 32, 2, 2, '2024-01-26 08:30:55', '2024-01-26 08:30:55'),
(53, 33, 3, 1, '2024-01-26 09:26:23', '2024-01-26 09:26:23'),
(54, 34, 2, 1, '2024-01-26 09:27:30', '2024-01-26 09:27:30'),
(55, 34, 3, 2, '2024-01-26 09:27:30', '2024-01-26 09:27:30'),
(56, 35, 4, 1, '2024-01-26 09:28:14', '2024-01-26 09:28:14'),
(57, 36, 3, 1, '2024-01-26 09:29:15', '2024-01-26 09:29:15'),
(58, 37, 3, 2, '2024-01-26 09:29:54', '2024-01-26 09:29:54'),
(59, 38, 2, 2, '2024-01-26 09:30:48', '2024-01-26 09:30:48'),
(60, 39, 3, 2, '2024-01-26 20:56:37', '2024-01-26 20:56:37'),
(61, 40, 3, 1, '2024-01-26 20:58:12', '2024-01-26 20:58:12'),
(62, 41, 3, 2, '2024-01-26 20:59:38', '2024-01-26 20:59:38'),
(63, 41, 4, 3, '2024-01-26 20:59:38', '2024-01-26 20:59:38'),
(64, 42, 5, 2, '2024-01-26 21:01:05', '2024-01-26 21:01:05'),
(65, 43, 3, 1, '2024-01-26 21:02:05', '2024-01-26 21:02:05'),
(66, 44, 1, 1, '2024-01-26 21:04:02', '2024-01-26 21:04:02'),
(67, 44, 2, 1, '2024-01-26 21:04:02', '2024-01-27 12:28:35'),
(68, 44, 3, 2, '2024-01-26 21:04:02', '2024-01-26 21:04:02'),
(69, 45, 2, 2, '2024-01-26 21:04:53', '2024-01-26 21:04:53'),
(70, 46, 3, 2, '2024-01-26 21:06:04', '2024-01-26 21:06:04'),
(71, 47, 3, 1, '2024-01-26 21:07:50', '2024-01-26 21:07:50'),
(72, 47, 4, 1, '2024-01-26 21:07:50', '2024-01-26 21:07:50'),
(73, 48, 2, 1, '2024-01-26 21:08:48', '2024-01-26 21:08:48'),
(74, 49, 3, 1, '2024-01-26 21:11:18', '2024-01-26 21:11:18'),
(75, 50, 3, 1, '2024-01-26 21:14:10', '2024-01-26 21:14:10'),
(76, 51, 3, 1, '2024-01-26 21:15:35', '2024-01-26 21:15:35'),
(77, 52, 3, 1, '2024-01-26 21:16:34', '2024-01-26 21:16:34'),
(78, 53, 3, 1, '2024-01-26 21:17:50', '2024-01-26 21:17:50'),
(79, 54, 2, 1, '2024-01-26 22:15:31', '2024-01-26 22:15:31'),
(80, 55, 3, 1, '2024-01-26 22:16:25', '2024-01-26 22:16:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(4, 5, 'uploads/products/16995264481.png', '2023-11-09 03:40:48', '2023-11-09 03:40:48'),
(6, 9, 'uploads/products/16995266061.png', '2023-11-09 03:43:26', '2023-11-09 03:43:26'),
(7, 10, 'uploads/products/16995266441.png', '2023-11-09 03:44:04', '2023-11-09 03:44:04'),
(8, 5, 'uploads/products/16995506691.png', '2023-11-09 10:24:29', '2023-11-09 10:24:29'),
(11, 5, 'uploads/products/16995507701.png', '2023-11-09 10:26:10', '2023-11-09 10:26:10'),
(12, 11, 'uploads/products/17062661661.png', '2024-01-26 03:49:26', '2024-01-26 03:49:26'),
(13, 12, 'uploads/products/17062663291.png', '2024-01-26 03:52:09', '2024-01-26 03:52:09'),
(14, 13, 'uploads/products/17062672801.jpg', '2024-01-26 04:08:00', '2024-01-26 04:08:00'),
(15, 14, 'uploads/products/17062673671.jpg', '2024-01-26 04:09:27', '2024-01-26 04:09:27'),
(17, 16, 'uploads/products/17062781141.png', '2024-01-26 07:08:34', '2024-01-26 07:08:34'),
(18, 17, 'uploads/products/17062784241.png', '2024-01-26 07:13:44', '2024-01-26 07:13:44'),
(24, 18, 'uploads/products/17062791801.png', '2024-01-26 07:26:20', '2024-01-26 07:26:20'),
(25, 19, 'uploads/products/17062792571.png', '2024-01-26 07:27:37', '2024-01-26 07:27:37'),
(26, 20, 'uploads/products/17062793281.jpg', '2024-01-26 07:28:48', '2024-01-26 07:28:48'),
(27, 21, 'uploads/products/17062793931.png', '2024-01-26 07:29:53', '2024-01-26 07:29:53'),
(28, 22, 'uploads/products/17062794621.png', '2024-01-26 07:31:02', '2024-01-26 07:31:02'),
(29, 23, 'uploads/products/17062800441.png', '2024-01-26 07:40:44', '2024-01-26 07:40:44'),
(31, 24, 'uploads/products/17062801641.png', '2024-01-26 07:42:44', '2024-01-26 07:42:44'),
(32, 25, 'uploads/products/17062802321.png', '2024-01-26 07:43:52', '2024-01-26 07:43:52'),
(33, 26, 'uploads/products/17062804151.jpg', '2024-01-26 07:46:55', '2024-01-26 07:46:55'),
(34, 27, 'uploads/products/17062805211.jpg', '2024-01-26 07:48:41', '2024-01-26 07:48:41'),
(35, 28, 'uploads/products/17062828341.jpg', '2024-01-26 08:27:14', '2024-01-26 08:27:14'),
(36, 29, 'uploads/products/17062828831.jpg', '2024-01-26 08:28:03', '2024-01-26 08:28:03'),
(37, 30, 'uploads/products/17062829421.jpg', '2024-01-26 08:29:02', '2024-01-26 08:29:02'),
(38, 31, 'uploads/products/17062830061.jpg', '2024-01-26 08:30:06', '2024-01-26 08:30:06'),
(39, 32, 'uploads/products/17062830551.jpg', '2024-01-26 08:30:55', '2024-01-26 08:30:55'),
(40, 33, 'uploads/products/17062863831.jpg', '2024-01-26 09:26:23', '2024-01-26 09:26:23'),
(41, 34, 'uploads/products/17062864501.jpg', '2024-01-26 09:27:30', '2024-01-26 09:27:30'),
(42, 35, 'uploads/products/17062864941.jpg', '2024-01-26 09:28:14', '2024-01-26 09:28:14'),
(43, 36, 'uploads/products/17062865551.jpg', '2024-01-26 09:29:15', '2024-01-26 09:29:15'),
(44, 37, 'uploads/products/17062865941.jpg', '2024-01-26 09:29:54', '2024-01-26 09:29:54'),
(45, 38, 'uploads/products/17062866481.jpg', '2024-01-26 09:30:48', '2024-01-26 09:30:48'),
(46, 39, 'uploads/products/17063277971.png', '2024-01-26 20:56:37', '2024-01-26 20:56:37'),
(47, 40, 'uploads/products/17063278921.png', '2024-01-26 20:58:12', '2024-01-26 20:58:12'),
(48, 41, 'uploads/products/17063279781.png', '2024-01-26 20:59:38', '2024-01-26 20:59:38'),
(49, 42, 'uploads/products/17063280651.png', '2024-01-26 21:01:05', '2024-01-26 21:01:05'),
(50, 43, 'uploads/products/17063281251.png', '2024-01-26 21:02:05', '2024-01-26 21:02:05'),
(51, 44, 'uploads/products/17063282421.png', '2024-01-26 21:04:02', '2024-01-26 21:04:02'),
(52, 45, 'uploads/products/17063282931.png', '2024-01-26 21:04:53', '2024-01-26 21:04:53'),
(54, 46, 'uploads/products/17063283971.png', '2024-01-26 21:06:37', '2024-01-26 21:06:37'),
(55, 47, 'uploads/products/17063284701.png', '2024-01-26 21:07:50', '2024-01-26 21:07:50'),
(56, 48, 'uploads/products/17063285281.png', '2024-01-26 21:08:48', '2024-01-26 21:08:48'),
(57, 49, 'uploads/products/17063286781.jpg', '2024-01-26 21:11:18', '2024-01-26 21:11:18'),
(58, 50, 'uploads/products/17063288501.png', '2024-01-26 21:14:10', '2024-01-26 21:14:10'),
(59, 51, 'uploads/products/17063289351.png', '2024-01-26 21:15:35', '2024-01-26 21:15:35'),
(60, 52, 'uploads/products/17063289941.jpg', '2024-01-26 21:16:34', '2024-01-26 21:16:34'),
(61, 53, 'uploads/products/17063290701.jpg', '2024-01-26 21:17:50', '2024-01-26 21:17:50'),
(62, 54, 'uploads/products/17063325311.jpg', '2024-01-26 22:15:31', '2024-01-26 22:15:31'),
(63, 55, 'uploads/products/17063325851.jpg', '2024-01-26 22:16:25', '2024-01-26 22:16:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `website_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `website_name`, `website_url`, `page_title`, `meta_keyword`, `meta_description`, `address`, `phone1`, `phone2`, `email1`, `email2`, `facebook`, `twitter`, `instagram`, `youtube`, `created_at`, `updated_at`) VALUES
(3, 'truongduy', 'http://localhost:8000/', 'Shopping Ecommerce', 'shopping', 'shopping', 'TPHCM', '0984145097', '0984145097', '20522083@gm.uit.edu.vn', '20522083@gm.uit.edu.vn', 'abc', 'def', 'abcd', 'defg', '2023-11-10 10:40:57', '2023-11-10 10:40:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=hidden,0=visible',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Ecommerce', 'Project', 'uploads/slider/1699611440.png', 0, '2023-10-18 09:42:51', '2023-11-10 03:17:20'),
(4, 'Laravel', 'PHP', 'uploads/slider/1699551008.png', 0, '2023-10-18 09:45:15', '2023-11-09 10:30:08'),
(5, 'C++', 'c++', 'uploads/slider/1699551092.png', 0, '2023-11-09 10:31:32', '2023-11-09 10:31:32'),
(6, 'JAVA', 'java', 'uploads/slider/1699551124.png', 0, '2023-11-09 10:32:04', '2023-11-09 10:32:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_as` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=user,1=admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role_as`) VALUES
(1, 'truongduy123', '20522083@gm.uit.edu.vn', NULL, '$2y$10$bexSpTFaQQwq..eEdb1Tp.hq0.xDr88OuVJt0gcSq/sVynvQ7SBiG', NULL, '2023-09-24 09:44:50', '2023-11-12 07:49:09', 1),
(3, 'Kevin', 'kevin@gmail.com', NULL, '$2y$10$9xY2MIFDYH99WPRdCTvMR.Wgpl29ObdzNBFo/sqoByFy6QhmVc9Xu', NULL, '2023-11-12 07:36:53', '2023-11-12 07:36:53', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_details`
--

CREATE TABLE `user_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_details`
--

INSERT INTO `user_details` (`id`, `user_id`, `phone`, `pin_code`, `address`, `created_at`, `updated_at`) VALUES
(2, 1, '0984145097', '700000', 'TPHCM', '2023-11-26 20:32:53', '2023-11-26 20:32:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(9, 2, 10, '2023-10-28 01:26:55', '2023-10-28 01:26:55'),
(10, 2, 9, '2023-10-28 01:26:59', '2023-10-28 01:26:59'),
(13, 1, 10, '2024-01-31 11:29:01', '2024-01-31 11:29:01');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_colors_product_id_foreign` (`product_id`),
  ADD KEY `product_colors_color_id_foreign` (`color_id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_details_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT cho bảng `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_colors`
--
ALTER TABLE `product_colors`
  ADD CONSTRAINT `product_colors_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_colors_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
