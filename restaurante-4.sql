-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 30-07-2025 a las 12:23:49
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_08b1a4de4e457e7c1e09f16c54f862de', 'i:1;', 1753807672),
('laravel_cache_08b1a4de4e457e7c1e09f16c54f862de:timer', 'i:1753807672;', 1753807672),
('laravel_cache_23e37183b5bc061b6e54e26ca27fd118', 'i:1;', 1753797132),
('laravel_cache_23e37183b5bc061b6e54e26ca27fd118:timer', 'i:1753797132;', 1753797132),
('laravel_cache_a75f3f172bfb296f2e10cbfc6dfc1883', 'i:4;', 1753866785),
('laravel_cache_a75f3f172bfb296f2e10cbfc6dfc1883:timer', 'i:1753866785;', 1753866785),
('laravel_cache_aa260d4018f0cbdd1572b05abcf7909f', 'i:1;', 1753796813),
('laravel_cache_aa260d4018f0cbdd1572b05abcf7909f:timer', 'i:1753796813;', 1753796813),
('laravel_cache_d2bfa8e8b749d2772a21edee7b70a2b3', 'i:1;', 1753786399),
('laravel_cache_d2bfa8e8b749d2772a21edee7b70a2b3:timer', 'i:1753786399;', 1753786399),
('laravel_cache_e9b6cc1432541b9ceebf113eee05eeba', 'i:3;', 1753866688),
('laravel_cache_e9b6cc1432541b9ceebf113eee05eeba:timer', 'i:1753866688;', 1753866688);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Comida', '2025-07-23 02:39:25', '2025-07-23 02:39:25'),
(2, 'Bebidas', '2025-07-23 02:39:25', '2025-07-23 02:39:25'),
(3, 'Postres', '2025-07-23 02:39:25', '2025-07-23 02:39:25'),
(4, 'Entradas', '2025-07-23 02:39:25', '2025-07-23 02:39:25'),
(5, 'Especiales', '2025-07-23 02:39:25', '2025-07-23 02:39:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pedido_id` bigint(20) UNSIGNED NOT NULL,
  `producto_id` bigint(20) UNSIGNED NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id`, `pedido_id`, `producto_id`, `cantidad`, `precio_unitario`, `created_at`, `updated_at`) VALUES
(1, 2, 10, 2, 30.00, '2025-07-28 07:33:17', '2025-07-28 07:33:17'),
(2, 2, 11, 4, 50.00, '2025-07-28 07:33:17', '2025-07-28 07:33:17'),
(3, 2, 15, 3, 40.00, '2025-07-28 07:33:17', '2025-07-28 07:33:17'),
(4, 3, 17, 12, 50.00, '2025-07-28 07:36:30', '2025-07-28 07:36:30'),
(5, 3, 16, 1, 45.00, '2025-07-28 07:36:30', '2025-07-28 07:36:30'),
(6, 3, 19, 5, 60.00, '2025-07-28 07:36:30', '2025-07-28 07:36:30'),
(7, 4, 3, 2, 70.00, '2025-07-29 11:49:56', '2025-07-29 11:49:56'),
(8, 4, 1, 1, 85.50, '2025-07-29 11:49:56', '2025-07-29 11:49:56'),
(9, 4, 11, 1, 50.00, '2025-07-29 11:49:56', '2025-07-29 11:49:56'),
(10, 5, 1, 5, 85.50, '2025-07-29 13:16:50', '2025-07-29 13:16:50'),
(11, 5, 15, 3, 40.00, '2025-07-29 13:16:50', '2025-07-29 13:16:50'),
(12, 6, 1, 4, 100.00, '2025-07-29 21:02:06', '2025-07-29 21:02:06'),
(13, 6, 7, 3, 45.00, '2025-07-29 21:02:06', '2025-07-29 21:02:06'),
(14, 6, 9, 3, 25.00, '2025-07-29 21:02:06', '2025-07-29 21:02:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `estado` enum('disponible','ocupada','no disponible') NOT NULL DEFAULT 'disponible',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(81, 'Mesa 1', 'disponible', '2025-07-28 00:35:02', '2025-07-29 04:55:05'),
(82, 'Mesa 2', 'disponible', '2025-07-28 00:35:02', '2025-07-28 00:35:02'),
(83, 'Mesa 3', 'ocupada', '2025-07-28 00:35:02', '2025-07-28 00:35:02'),
(84, 'Mesa 4', 'disponible', '2025-07-28 00:35:02', '2025-07-28 00:35:02'),
(85, 'Mesa 5', 'disponible', '2025-07-28 00:35:02', '2025-07-29 20:58:59'),
(86, 'Mesa 6', 'disponible', '2025-07-28 00:35:02', '2025-07-28 00:35:02'),
(87, 'Mesa 7', 'ocupada', '2025-07-28 00:35:02', '2025-07-28 00:35:02'),
(88, 'Mesa 8', 'disponible', '2025-07-28 00:35:02', '2025-07-28 00:35:02'),
(89, 'Mesa 9', 'ocupada', '2025-07-28 00:35:02', '2025-07-28 00:35:02'),
(90, 'Mesa 10', 'disponible', '2025-07-28 00:35:02', '2025-07-28 00:35:02'),
(91, 'Mesa 11 (Terraza)', 'ocupada', '2025-07-28 00:35:02', '2025-07-28 00:35:02'),
(92, 'Mesa 12 (Terraza)', 'ocupada', '2025-07-28 00:35:02', '2025-07-28 00:35:02'),
(93, 'Mesa 13 (VIP)', 'ocupada', '2025-07-28 00:35:02', '2025-07-28 00:35:02'),
(94, 'Mesa 14', 'disponible', '2025-07-28 00:35:02', '2025-07-28 00:35:02'),
(95, 'Mesa 15', 'disponible', '2025-07-28 00:35:02', '2025-07-28 00:35:02'),
(96, 'Mesa 16', 'ocupada', '2025-07-28 00:35:02', '2025-07-28 00:35:02'),
(97, 'Mesa 17', 'disponible', '2025-07-28 00:35:02', '2025-07-28 00:35:02'),
(98, 'Mesa 18 (Barra)', 'disponible', '2025-07-28 00:35:02', '2025-07-28 00:35:02'),
(99, 'Mesa 19 (Barra)', 'ocupada', '2025-07-28 00:35:02', '2025-07-28 00:35:02'),
(100, 'Mesa 20', 'disponible', '2025-07-28 00:35:02', '2025-07-28 00:35:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_07_22_045000_create_categorias_table', 1),
(5, '2025_07_22_050010_create_productos_table', 1),
(6, '2025_07_22_050011_create_mesas_table', 1),
(7, '2025_07_22_050012_create_pedidos_table', 1),
(8, '2025_07_22_050013_create_detalle_pedidos_table', 1),
(9, '2025_07_22_053257_create_permission_tables', 1),
(10, '2025_07_22_132850_create_personal_access_tokens_table', 1),
(11, '2025_07_23_073131_add_imagen_to_productos_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 4),
(2, 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('mesero@ejemplo.com', '13TlDHDFLo0RNm0KPa8xKTkoKKLA96WT4vXBCbxA', '2025-07-29 15:27:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('abel@ejemplo.com', 'Ih3yvgsiPNSOaZQw3T4Ixma2oD4GZEJq0DLmKJp135fkjHqGLFfMJokbTYnE', '2025-07-30 12:20:57'),
('mesero@ejemplo.com', '$2y$12$CFwPajZ5XbyvBBox5Jb7MehY5cNl1RgcE76j/J5flqbFVdEl2Msvq', '2025-07-29 16:29:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `mesa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `estado` enum('pendiente','entregado','pagado','cancelado') NOT NULL DEFAULT 'pendiente',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `user_id`, `mesa_id`, `total`, `estado`, `created_at`, `updated_at`) VALUES
(2, 4, 81, 380.00, 'pagado', '2025-07-28 07:33:17', '2025-07-29 22:45:04'),
(3, 4, 98, 945.00, 'pagado', '2025-07-28 07:36:30', '2025-07-29 22:45:57'),
(4, 2, 81, 275.50, 'entregado', '2025-07-29 11:49:56', '2025-07-29 13:15:16'),
(5, 2, 85, 547.50, 'pagado', '2025-07-29 13:16:50', '2025-07-29 22:38:29'),
(6, 2, 83, 610.00, 'pagado', '2025-07-29 21:02:06', '2025-07-29 22:34:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'api-token', '22ae88b6a462322dc750525e847e03a32095f68e0f6b4aa3a36cd792a1840bb5', '[\"*\"]', '2025-07-23 17:38:08', NULL, '2025-07-23 16:20:50', '2025-07-23 17:38:08'),
(2, 'App\\Models\\User', 2, 'api-token', '0c7854e4dad24d55964285b37792cb2f2553d780eedd43fa97a9171bbc68c1c2', '[\"*\"]', NULL, NULL, '2025-07-23 16:22:54', '2025-07-23 16:22:54'),
(3, 'App\\Models\\User', 2, 'api-token', 'fcf7258896d69e1937e688fbe9300a355ee7f76c028936252f812d260a264830', '[\"*\"]', NULL, NULL, '2025-07-23 17:39:07', '2025-07-23 17:39:07'),
(4, 'App\\Models\\User', 2, 'api-token', '310f914e420089cb30002e2230939a3f03023bffdec0633def7ea77f996e6612', '[\"*\"]', NULL, NULL, '2025-07-23 17:47:24', '2025-07-23 17:47:24'),
(5, 'App\\Models\\User', 2, 'api-token', '55f6e9e95868a449ec1429d21613045863ceb865e56e14091e156cce87bc362b', '[\"*\"]', '2025-07-23 18:22:56', NULL, '2025-07-23 17:49:18', '2025-07-23 18:22:56'),
(6, 'App\\Models\\User', 2, 'api-token', '69d1a5ee8685f5b00f41f221dba5cc5c868f8ae0681a2eaa318d56488b0e6637', '[\"*\"]', '2025-07-23 20:08:44', NULL, '2025-07-23 18:47:25', '2025-07-23 20:08:44'),
(7, 'App\\Models\\User', 2, 'api-token', '4190436d8f26c3679364b791c58ced0a305141fb1a240e328026423469f2f366', '[\"*\"]', '2025-07-23 20:17:52', NULL, '2025-07-23 20:14:02', '2025-07-23 20:17:52'),
(9, 'App\\Models\\User', 2, 'api-token', 'c8d95ce4d407987663b33d8f7da40261e3238b04307c2404c65d09a35d077d9a', '[\"*\"]', '2025-07-23 20:52:45', NULL, '2025-07-23 20:33:54', '2025-07-23 20:52:45'),
(10, 'App\\Models\\User', 2, 'api-token', '7fa6f95fc6d53489dc885e6012eeb36822b11c9e895e7734d6b0a3ff38baa4df', '[\"*\"]', NULL, NULL, '2025-07-24 01:16:04', '2025-07-24 01:16:04'),
(11, 'App\\Models\\User', 2, 'api-token', '5fbbb3077a7ee3c04de315f6a74fede9275848936ebac7958e50b88bcf8e8bdb', '[\"*\"]', NULL, NULL, '2025-07-24 01:17:05', '2025-07-24 01:17:05'),
(12, 'App\\Models\\User', 2, 'api-token', '5af803a6b6124ad50629addb0d2052da67e998f55507651d9f75700739697888', '[\"*\"]', NULL, NULL, '2025-07-24 01:17:56', '2025-07-24 01:17:56'),
(13, 'App\\Models\\User', 2, 'api-token', '7b92494830fe4a2f503e970043891e30fed3186860d02e381a010cbe4cbf69cb', '[\"*\"]', NULL, NULL, '2025-07-24 01:17:59', '2025-07-24 01:17:59'),
(14, 'App\\Models\\User', 2, 'api-token', '9494e28309d7c048178d8d2e19bf5947e7f3b5201b7905922c323941044196a9', '[\"*\"]', NULL, NULL, '2025-07-24 01:18:02', '2025-07-24 01:18:02'),
(15, 'App\\Models\\User', 2, 'api-token', '07c656d828b1af9d66b2c3ceb49df06f1e9c6a80cafe208733d16c1a7661c1e4', '[\"*\"]', NULL, NULL, '2025-07-24 01:18:03', '2025-07-24 01:18:03'),
(16, 'App\\Models\\User', 2, 'api-token', 'c8a96806f4a0bfefaaa21f8b56d9875a8a268b4719c4ef3335d637e4965341e3', '[\"*\"]', NULL, NULL, '2025-07-24 01:18:04', '2025-07-24 01:18:04'),
(17, 'App\\Models\\User', 2, 'api-token', '14f96f2bad164c70d179780e6d1693285379de5111e2a01a7e576df02627c089', '[\"*\"]', NULL, NULL, '2025-07-24 01:18:06', '2025-07-24 01:18:06'),
(19, 'App\\Models\\User', 2, 'api-token', '1af61b05fdb93fddbc5e0f3bb64039a15c26b7f72f4f3ad11474debcaff2f3ba', '[\"*\"]', NULL, NULL, '2025-07-24 01:18:43', '2025-07-24 01:18:43'),
(20, 'App\\Models\\User', 2, 'api-token', '46f7ea79518b5f29325407bb5571ce5ad53a1676ffe08928764e97b68ce838aa', '[\"*\"]', '2025-07-24 01:34:09', NULL, '2025-07-24 01:33:42', '2025-07-24 01:34:09'),
(21, 'App\\Models\\User', 2, 'api-token', 'c31180db7cfef2e2a68103c5416f83599adb6bf17806cdd2f5e518305ed47681', '[\"*\"]', NULL, NULL, '2025-07-24 02:03:20', '2025-07-24 02:03:20'),
(22, 'App\\Models\\User', 2, 'api-token', 'f350469c05c39ab66b6b3ddf6461b04864050a94f751c0d12fdfd9f9b91ff06c', '[\"*\"]', NULL, NULL, '2025-07-24 02:03:57', '2025-07-24 02:03:57'),
(23, 'App\\Models\\User', 2, 'api-token', 'b963fa8b26595404a4763f71fc76c9a78a1a6c5b7db98e271aa805da2d771bdb', '[\"*\"]', NULL, NULL, '2025-07-24 02:04:07', '2025-07-24 02:04:07'),
(24, 'App\\Models\\User', 2, 'api-token', '03f78ddad54f205cf20b7bfeb07463cec7101d03e1def8949fb8cf8c6285341b', '[\"*\"]', NULL, NULL, '2025-07-24 02:04:08', '2025-07-24 02:04:08'),
(25, 'App\\Models\\User', 2, 'api-token', '3178f64dd4171ce05bdfc0cf9c02acdb99ef142e80d88c6ee2bde67997f4b910', '[\"*\"]', NULL, NULL, '2025-07-24 02:04:09', '2025-07-24 02:04:09'),
(26, 'App\\Models\\User', 2, 'api-token', 'c9e710795aa65fb97c5f59bc5c45c706567055e1088b22203389b5f9e28888da', '[\"*\"]', NULL, NULL, '2025-07-24 02:04:09', '2025-07-24 02:04:09'),
(27, 'App\\Models\\User', 2, 'api-token', '0eeb1d902d03c760759abbaa8073ef1180364953581c73d232672c6117301575', '[\"*\"]', NULL, NULL, '2025-07-24 02:04:10', '2025-07-24 02:04:10'),
(28, 'App\\Models\\User', 2, 'api-token', 'bdb04ad35bfa9c09e515931c8f2cb8a2f0ea0cf4755409816d76c2e8ee5427d2', '[\"*\"]', NULL, NULL, '2025-07-24 02:04:17', '2025-07-24 02:04:17'),
(29, 'App\\Models\\User', 2, 'api-token', '426e775cb4d228c2c639ddeb074aa081825cfaf45895dffc78fe30253cbba8dc', '[\"*\"]', NULL, NULL, '2025-07-24 02:10:03', '2025-07-24 02:10:03'),
(30, 'App\\Models\\User', 2, 'api-token', '5674a8b9cc5650bebd71d8a3c367e84aec99c49ac13f9e4c9991d2bab29556be', '[\"*\"]', '2025-07-24 02:55:34', NULL, '2025-07-24 02:18:50', '2025-07-24 02:55:34'),
(31, 'App\\Models\\User', 2, 'api-token', 'db72a71bd6f17bb73f9b869ee63ce941f339ed46df06eb6e4ef40cfe5f3c82a1', '[\"*\"]', NULL, NULL, '2025-07-24 02:38:56', '2025-07-24 02:38:56'),
(32, 'App\\Models\\User', 2, 'api-token', '355d3087671f441a7a46a928819c85f185891a4468a45a54a66789e5c9b9db2c', '[\"*\"]', NULL, NULL, '2025-07-24 02:50:34', '2025-07-24 02:50:34'),
(33, 'App\\Models\\User', 2, 'api-token', '6b46874ae606b5c899b6c821dded87baf74e8cfe6f600351432f8c3779941776', '[\"*\"]', NULL, NULL, '2025-07-24 02:50:55', '2025-07-24 02:50:55'),
(34, 'App\\Models\\User', 2, 'api-token', 'e43e6a49a24e811f22ff8fa0ea9755ec33e9e3663bde366af4009a4508ac594e', '[\"*\"]', NULL, NULL, '2025-07-24 02:51:59', '2025-07-24 02:51:59'),
(36, 'App\\Models\\User', 2, 'api-token', '9cdeb0cab27d66e08010709acc1ff78833f732c1c1aec474ae3ebf12d354f09f', '[\"*\"]', '2025-07-25 02:40:43', NULL, '2025-07-25 02:18:49', '2025-07-25 02:40:43'),
(37, 'App\\Models\\User', 2, 'api-token', 'd25b2c170ee28a3148f44c782d18d6e7719241f163b0c0b79bec14e37ab0b065', '[\"*\"]', NULL, NULL, '2025-07-25 03:14:28', '2025-07-25 03:14:28'),
(38, 'App\\Models\\User', 2, 'api-token', '700ffb4af8204232e374e3ae4d98d13a2d6355e2bd14823e2c09fb624b00c152', '[\"*\"]', '2025-07-26 01:21:00', NULL, '2025-07-25 03:16:16', '2025-07-26 01:21:00'),
(39, 'App\\Models\\User', 2, 'api-token', 'b7e6c5059b9bd3ccc9112bfa2eeb8b735c2825539b137e6b998efcabbb5165f2', '[\"*\"]', '2025-07-26 01:40:04', NULL, '2025-07-26 01:03:30', '2025-07-26 01:40:04'),
(40, 'App\\Models\\User', 4, 'api-token', '95b57f4a3560f25602b59e9b1c9402d1bebc11fdd170a8a260a5bf58e6c07536', '[\"*\"]', '2025-07-26 01:44:27', NULL, '2025-07-26 01:28:00', '2025-07-26 01:44:27'),
(41, 'App\\Models\\User', 2, 'api-token', 'bb4f21c41d4292c7aaffed7b1f25af937cf27c3bfee657259e2b4fc2e664edf0', '[\"*\"]', NULL, NULL, '2025-07-26 01:42:15', '2025-07-26 01:42:15'),
(42, 'App\\Models\\User', 2, 'api-token', 'e441f8de4d80c8bf6484f5fa492b23ef724cd91ec8e7c53e5f023d3f30cb8f9e', '[\"*\"]', '2025-07-29 22:34:05', NULL, '2025-07-26 01:44:52', '2025-07-29 22:34:05'),
(44, 'App\\Models\\User', 2, 'api-token', 'e3c8d0efd3802ccf0e3ea5d0d847d09830f26dca3937498ec500bb277b9397a9', '[\"*\"]', '2025-07-26 02:31:04', NULL, '2025-07-26 01:59:36', '2025-07-26 02:31:04'),
(45, 'App\\Models\\User', 4, 'api-token', '35bb575f564ce065ecb41a8155cbecb7d4931518cce0aeb7ac545162cc582d5a', '[\"*\"]', NULL, NULL, '2025-07-26 02:39:12', '2025-07-26 02:39:12'),
(46, 'App\\Models\\User', 2, 'api-token', '365159b1cbd3154ce537402b19bdb416b8eafe9299886672f092a47a9fb18f7b', '[\"*\"]', '2025-07-26 02:42:20', NULL, '2025-07-26 02:42:00', '2025-07-26 02:42:20'),
(47, 'App\\Models\\User', 4, 'api-token', '23869cf23a056b55db0cccb875377a584e5a055063c7318abadea7a7d27f66ce', '[\"*\"]', '2025-07-26 03:28:18', NULL, '2025-07-26 02:49:29', '2025-07-26 03:28:18'),
(48, 'App\\Models\\User', 5, 'auth_token', 'c11cca28a6875054b37f943cc20af23299b04249f5f205bcf6eb5d760529edcf', '[\"*\"]', NULL, NULL, '2025-07-26 03:03:41', '2025-07-26 03:03:41'),
(49, 'App\\Models\\User', 6, 'auth_token', 'adc079a3b4b425cb221a02e9918f341df845186e7c9126da15eca43278e0bb0a', '[\"*\"]', NULL, NULL, '2025-07-26 03:03:44', '2025-07-26 03:03:44'),
(50, 'App\\Models\\User', 6, 'api-token', 'fc87b6a0e713027aec7c599bcde7f9dcfbd67d74ff18a5262be14e6ffb3a9dd9', '[\"*\"]', '2025-07-26 03:20:11', NULL, '2025-07-26 03:06:31', '2025-07-26 03:20:11'),
(51, 'App\\Models\\User', 7, 'auth_token', '3704d8a5c37ea10ec9bb6d4f9930c2da2036e8643d5e222f6d4022f47461837f', '[\"*\"]', NULL, NULL, '2025-07-26 03:11:05', '2025-07-26 03:11:05'),
(52, 'App\\Models\\User', 2, 'api-token', 'b1a2a6a9ca713f615e7f658e74e783b6203028af4f80794fcc80cfb16119efe1', '[\"*\"]', NULL, NULL, '2025-07-26 03:11:05', '2025-07-26 03:11:05'),
(53, 'App\\Models\\User', 8, 'auth_token', '966bdfe01baac3501dad9c8e14c10bc622db5c1bad981054eb74a16e0206a36e', '[\"*\"]', NULL, NULL, '2025-07-26 03:16:03', '2025-07-26 03:16:03'),
(54, 'App\\Models\\User', 9, 'auth_token', '1adfb728ba83086a4a79fd2f80c0c8feecc1aba567c9c32cd3331b1c5056ea17', '[\"*\"]', NULL, NULL, '2025-07-26 03:18:30', '2025-07-26 03:18:30'),
(55, 'App\\Models\\User', 10, 'auth_token', 'def3102a8f64f49c5d924c567c5afd5dc3a9fc30d4e2640dcb134c56f4ef628d', '[\"*\"]', NULL, NULL, '2025-07-26 03:19:47', '2025-07-26 03:19:47'),
(56, 'App\\Models\\User', 2, 'api-token', '146b5f386a4613521dd05f5d1e63f9a26c873fdb547a7e1139b3a08461358e6d', '[\"*\"]', NULL, NULL, '2025-07-26 03:21:21', '2025-07-26 03:21:21'),
(57, 'App\\Models\\User', 2, 'api-token', 'ab6b532f95a9111986699eb9b1d6ea038342941ba0c124a500486b678f6135db', '[\"*\"]', '2025-07-26 03:24:34', NULL, '2025-07-26 03:22:31', '2025-07-26 03:24:34'),
(58, 'App\\Models\\User', 3, 'api-token', '4a1c1ae5bb8302b83b04cf05c255ce2276f8f17fed423d7e69abd4446bf95016', '[\"*\"]', NULL, NULL, '2025-07-26 03:25:36', '2025-07-26 03:25:36'),
(59, 'App\\Models\\User', 2, 'api-token', '1ac525f92f130e2bff09b2b34e39fa4832fb2212dfcdba62a44ed3b041b46c31', '[\"*\"]', '2025-07-28 08:48:38', NULL, '2025-07-28 08:45:26', '2025-07-28 08:48:38'),
(60, 'App\\Models\\User', 2, 'api-token', '1a9879c10fe330ce569e6555e68e9ea3cfa5ffaafbd4ae89c64ddbca8ef1896d', '[\"*\"]', '2025-07-29 05:28:20', NULL, '2025-07-29 04:49:51', '2025-07-29 05:28:20'),
(61, 'App\\Models\\User', 4, 'api-token', '524a36a12bded59addce4682d758805afa18e4aff515ab732e7d80a1fdedec58', '[\"*\"]', NULL, NULL, '2025-07-29 04:54:20', '2025-07-29 04:54:20'),
(62, 'App\\Models\\User', 2, 'api-token', '50c627636063b0697561284fd4f74986961f33c9f4f0a26250d4081e32cb5380', '[\"*\"]', '2025-07-29 05:52:44', NULL, '2025-07-29 05:30:27', '2025-07-29 05:52:44'),
(63, 'App\\Models\\User', 2, 'api-token', '20867a38340b3dcfb1491e63a9fe4e2f0e3ba7159762d58c7cdf0b8692e28d93', '[\"*\"]', '2025-07-29 13:14:38', NULL, '2025-07-29 10:08:42', '2025-07-29 13:14:38'),
(64, 'App\\Models\\User', 2, 'api-token', 'e01e5b4a9b2e13068b11b94d520afdad7da5ea5e23a6c02bdcdf4b2aa9dc8a83', '[\"*\"]', NULL, NULL, '2025-07-29 11:10:33', '2025-07-29 11:10:33'),
(65, 'App\\Models\\User', 2, 'api-token', '0e320b45eb1530d857578c1334b54fd413af8a7b8d4192e13d981d907279fc7a', '[\"*\"]', NULL, NULL, '2025-07-29 11:13:56', '2025-07-29 11:13:56'),
(66, 'App\\Models\\User', 2, 'api-token', '1d524de8a860fa8a986718795979401539ccc6325e1df06c21a1558557329599', '[\"*\"]', '2025-07-29 11:15:02', NULL, '2025-07-29 11:14:24', '2025-07-29 11:15:02'),
(67, 'App\\Models\\User', 2, 'api-token', '607a0de2663f54f0726a2db34b6b8243e4e034e275447f9e5caea207da61fc6a', '[\"*\"]', NULL, NULL, '2025-07-29 11:15:34', '2025-07-29 11:15:34'),
(68, 'App\\Models\\User', 2, 'api-token', 'fd69a756a205c558d697d505f89c6886f5678d8eccdd8aaf0033464f8b2e499e', '[\"*\"]', NULL, NULL, '2025-07-29 11:16:33', '2025-07-29 11:16:33'),
(69, 'App\\Models\\User', 2, 'api-token', 'b5550776ee30c20b0a92eae7f528a012193ee5043cd073575724f628c0cb2f17', '[\"*\"]', '2025-07-29 12:27:56', NULL, '2025-07-29 11:39:44', '2025-07-29 12:27:56'),
(70, 'App\\Models\\User', 2, 'api-token', 'c525639a8c6f91d847685558b61b4cd570b1519e7d74d2952131473343e70bc5', '[\"*\"]', '2025-07-29 12:53:27', NULL, '2025-07-29 12:39:29', '2025-07-29 12:53:27'),
(71, 'App\\Models\\User', 2, 'api-token', 'f0e1be3fd2be1add593fdd158c0d6aca53307537953a219e0841a9fb69be96d9', '[\"*\"]', '2025-07-29 13:17:38', NULL, '2025-07-29 13:04:32', '2025-07-29 13:17:38'),
(72, 'App\\Models\\User', 2, 'api-token', 'b88aa3c20615b1b0fbe7c5f1bf5e01a712931dc1a0998e493b38087c944d1614', '[\"*\"]', '2025-07-29 13:26:39', NULL, '2025-07-29 13:26:02', '2025-07-29 13:26:39'),
(73, 'App\\Models\\User', 2, 'api-token', 'a6153a572236cc3440f8c870c5511234b7f7d0b0caf4f1eb5c4d97ec84b4b0b2', '[\"*\"]', '2025-07-29 13:34:21', NULL, '2025-07-29 13:29:29', '2025-07-29 13:34:21'),
(74, 'App\\Models\\User', 2, 'api-token', '3278ec975e5e814b8482a281c97013800098148acd05bd2f0bf0e7d39f751e62', '[\"*\"]', '2025-07-29 13:35:39', NULL, '2025-07-29 13:34:28', '2025-07-29 13:35:39'),
(75, 'App\\Models\\User', 3, 'api-token', 'ad04763001d183a24291a586290ab3420cb848ea63adb00567aaef556409d667', '[\"*\"]', NULL, NULL, '2025-07-29 16:16:56', '2025-07-29 16:16:56'),
(76, 'App\\Models\\User', 2, 'api-token', '6f061193f55e3f656353e48441a88c247ed34f9f7b61a46c4a5a93b15964d37b', '[\"*\"]', '2025-07-29 19:40:39', NULL, '2025-07-29 19:36:18', '2025-07-29 19:40:39'),
(77, 'App\\Models\\User', 2, 'api-token', 'f17709dde0b8f54c31401bb09f7887d6a95055197ba46e6bdd268b331143cf37', '[\"*\"]', '2025-07-29 21:52:47', NULL, '2025-07-29 20:58:32', '2025-07-29 21:52:47'),
(78, 'App\\Models\\User', 2, 'api-token', '57f2c775d0d6144cc2a4686a7ea79009ef61086652df50fec3fa3ed5c7790555', '[\"*\"]', NULL, NULL, '2025-07-29 21:19:55', '2025-07-29 21:19:55'),
(79, 'App\\Models\\User', 2, 'api-token', 'c02d0c05945d99e722b7ea437bb712017e0f1a0bc7b67c46555554f137444fef', '[\"*\"]', NULL, NULL, '2025-07-29 21:34:18', '2025-07-29 21:34:18'),
(80, 'App\\Models\\User', 2, 'api-token', 'c443f94ec82adc29ab7d751d75eba17c30d920e14791adcb1db253d04eeccf95', '[\"*\"]', NULL, NULL, '2025-07-29 21:35:42', '2025-07-29 21:35:42'),
(81, 'App\\Models\\User', 2, 'api-token', '6bd92b1a37faef73ab03da10e76f1ea60f78f78a92e7c44038cf02f722425025', '[\"*\"]', '2025-07-29 22:45:10', NULL, '2025-07-29 21:41:06', '2025-07-29 22:45:10'),
(82, 'App\\Models\\User', 2, 'api-token', '52cb0c6ffc6b6c9e05ff70cd1e6ba44954579533b1e765c2295eb444e1829b68', '[\"*\"]', '2025-07-29 22:00:00', NULL, '2025-07-29 21:55:34', '2025-07-29 22:00:00'),
(83, 'App\\Models\\User', 2, 'api-token', '7d0fa8620db093504e5b347e94dd4b1a1be67bf658f9b82a17c99395caa382ea', '[\"*\"]', '2025-07-29 22:46:52', NULL, '2025-07-29 22:07:05', '2025-07-29 22:46:52'),
(84, 'App\\Models\\User', 2, 'api-token', '41ddf1f77dbcc3513682f649f72a4929d17179c444d71dcf22706d833e8f04e6', '[\"*\"]', NULL, NULL, '2025-07-30 14:07:58', '2025-07-30 14:07:58'),
(85, 'App\\Models\\User', 2, 'api-token', '6108fd3188a1682d0516fc494984d99ced60e92f5d98ef23912f9f5a917a0a09', '[\"*\"]', '2025-07-30 14:21:24', NULL, '2025-07-30 14:12:31', '2025-07-30 14:21:24'),
(86, 'App\\Models\\User', 2, 'api-token', '56d8e391a2b51295aa97323aa012d509f313a068918e908afe49ced94d95bc1b', '[\"*\"]', '2025-07-30 15:06:05', NULL, '2025-07-30 14:46:49', '2025-07-30 15:06:05'),
(87, 'App\\Models\\User', 2, 'api-token', '2768fb7dab0c466fd97a40054f0d2de30b2799d6a4076d5da2dc1d7d8453eff5', '[\"*\"]', '2025-07-30 15:10:39', NULL, '2025-07-30 15:06:42', '2025-07-30 15:10:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `precio` decimal(8,2) NOT NULL,
  `categoria_id` bigint(20) UNSIGNED DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `imagen`, `precio`, `categoria_id`, `activo`, `created_at`, `updated_at`) VALUES
(1, 'Hamburguesa Clásica', 'Deliciosa hamburguesa con carne de res, lechuga, tomate y queso.', 'productos/hamburguesa_clasica.jpg', 100.00, 1, 1, '2025-07-29 04:01:50', '2025-07-29 13:35:39'),
(2, 'Ensalada César', 'Fresco y crujiente: Pechuga de pollo a la parrilla, lechuga romana fresca, crutones caseros y un toque de queso parmesano, todo bañado con nuestro aderezo César cremoso y casero.', 'productos/ensalada_cesar.jpg', 80.00, 1, 1, '2025-07-23 21:08:54', '2025-07-26 02:31:04'),
(3, 'Taco al Pastor', 'Nuestro clásico y delicioso taco al pastor, marinado a la perfección con achiote y especias, cocinado lentamente en el trompo, servido con piña, cebolla y cilantro fresco en tortilla de maíz nixtamalizado.', 'productos/taco_al_pastor.jpg', 70.00, 1, 1, '2025-07-23 21:08:54', '2025-07-23 21:08:54'),
(4, 'Pasta Alfredo', 'Pasta al dente bañada en nuestra irresistible salsa Alfredo, una mezcla sedosa de crema fresca, mantequilla y queso parmesano, espolvoreada con perejil fresco.', 'productos/pasta_alfredo.jpg', 95.00, 1, 1, '2025-07-23 21:08:54', '2025-07-23 21:08:54'),
(5, 'Pizza Margarita', 'La clásica pizza Margarita: Nuestra base crujiente con salsa de tomate San Marzano, mozzarella fresca derretida y hojas de albahaca aromática, horneada a la perfección en horno de piedra.', 'productos/pizza_margarita.jpg', 120.00, 1, 1, '2025-07-23 21:08:54', '2025-07-23 21:08:54'),
(6, 'Sopa de Pollo', 'Reconfortante y casera: Caldo de pollo nutritivo con tiernos trozos de pollo, zanahorias dulces, papas suaves y apio crujiente, ideal para calentar el alma.', 'productos/sopa_pollo.jpg', 55.00, 1, 1, '2025-07-23 21:08:54', '2025-07-23 21:08:54'),
(7, 'Arroz a la Mexicana', 'Auténtico arroz rojo mexicano, cocinado con caldo de jitomate y sazonado con cebolla, ajo y guisantes, un acompañamiento perfecto y lleno de sabor.', 'productos/arroz_mexicana.jpg', 45.00, 1, 1, '2025-07-23 21:08:54', '2025-07-23 21:08:54'),
(8, 'Agua Mineral', 'Agua natural pura y refrescante, ideal para acompañar cualquier comida o para hidratarse.', 'productos/agua_mineral.jpg', 20.00, 2, 1, '2025-07-23 21:08:54', '2025-07-23 21:08:54'),
(9, 'Refresco Cola', 'El refrescante y burbujeante sabor clásico de cola en lata, un favorito para acompañar tus platillos.', 'productos/refresco_cola.jpg', 25.00, 2, 1, '2025-07-23 21:08:54', '2025-07-23 21:08:54'),
(10, 'Jugo de Naranja', 'Recién exprimido: Jugo 100% natural de naranjas frescas, lleno de vitamina C y con un dulzor natural inigualable.', 'productos/jugo_naranja.jpg', 30.00, 2, 1, '2025-07-23 21:08:54', '2025-07-23 21:08:54'),
(11, 'Cerveza Lager', 'Cerveza lager ligera y refrescante, servida bien fría, con un sabor suave y un final limpio, perfecta para cualquier ocasión.', 'productos/cerveza_lager.jpg', 50.00, 2, 1, '2025-07-23 21:08:54', '2025-07-23 21:08:54'),
(12, 'Café Espresso', 'Intenso y aromático: Nuestro café negro es preparado con granos selectos, ofreciendo un sabor robusto y profundo, ideal para iniciar o finalizar el día.', 'productos/cafe_espresso.jpg', 35.00, 2, 1, '2025-07-23 21:08:54', '2025-07-23 21:08:54'),
(13, 'Té Verde', 'Delicado y antioxidante: Té verde de hojas seleccionadas, con un sabor ligeramente herbal y un aroma relajante, perfecto para un momento de calma.', 'productos/te_verde.jpg', 25.00, 2, 1, '2025-07-23 21:08:54', '2025-07-23 21:08:54'),
(14, 'Limonada', 'Exquisita limonada casera, preparada al momento con limones frescos, un toque justo de dulzor y servida con mucho hielo para una máxima frescura.', 'productos/limonada.jpg', 20.00, 2, 1, '2025-07-23 21:08:54', '2025-07-23 21:08:54'),
(15, 'Churros', 'Crujientes churros recién hechos, espolvoreados generosamente con azúcar y canela. Perfectos para sumergir en chocolate o disfrutar solos.', 'productos/churros.jpg', 40.00, 1, 1, '2025-07-23 21:08:54', '2025-07-23 21:08:54'),
(16, 'Flan', 'Suave y cremoso flan casero, con una capa de caramelo dorado en la parte superior. Un clásico postre que se derrite en la boca.', 'productos/flan.jpg', 45.00, 1, 1, '2025-07-23 21:08:54', '2025-07-23 21:08:54'),
(17, 'Brownie', 'Denso y decadente: Nuestro brownie está cargado de trozos de chocolate y nueces tostadas, horneado a la perfección para una textura suave por dentro y crujiente por fuera.', 'productos/brownie.jpg', 50.00, 1, 1, '2025-07-23 21:08:54', '2025-07-23 21:08:54'),
(18, 'Agua con Gas', 'Agua mineral con gas, burbujeante y refrescante, perfecta para limpiar el paladar o para aquellos que prefieren una bebida con chispa.', 'productos/agua_gas.jpg', 25.00, 2, 1, '2025-07-23 21:08:54', '2025-07-23 21:08:54'),
(19, 'Smoothie de Fresa', 'Delicioso batido cremoso elaborado con fresas 100% naturales, leche y un toque de dulzor. Ideal para un antojo saludable y refrescante.', 'productos/smoothie_fresa.jpg', 60.00, 2, 1, '2025-07-23 21:08:54', '2025-07-23 21:08:54'),
(20, 'Pizza Pepperoni', 'La favorita de muchos: Pizza con nuestra salsa especial de tomate, abundante queso mozzarella derretido y generosas rebanadas de pepperoni ligeramente picante.', 'productos/pizza_pepperoni.jpg', 130.00, 1, 1, '2025-07-23 21:08:54', '2025-07-23 21:08:54'),
(29, 'Tamal de Pollo', 'Tamal tradicional de masa suave de maíz rellena con pollo jugoso y salsa roja especiada, todo envuelto y cocido en hoja de maíz para un sabor casero y reconfortante.', 'productos/tamal_pollo.jpg', 35.00, 1, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(30, 'Mole Poblano', 'Pechuga de pollo tierna bañada en un mole poblano artesanal, espeso y aromático, con notas de chocolate y especias, servida sobre arroz blanco esponjoso.', 'productos/mole_poblano.jpg', 95.00, 1, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(31, 'Quesadilla de Queso', 'Tortilla de maíz recién hecha, rellena de queso oaxaca fundido, dorada a la perfección y servida con salsa verde, crema fresca y una pizca de amor.', 'productos/quesadilla_queso.jpg', 40.00, 1, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(32, 'Torta de Milanesa', 'Crujiente milanesa de res en pan bolillo artesanal, acompañada de lechuga, jitomate fresco y mayonesa casera. Un clásico irresistible.', 'productos/torta_milanesa.jpg', 60.00, 1, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(33, 'Enchiladas Verdes', 'Tres enchiladas suaves rellenas de pollo desmenuzado, bañadas con salsa verde casera, cubiertas con crema, queso fresco y cebolla morada.', 'productos/enchiladas_verdes.jpg', 85.00, 1, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(34, 'Hamburguesa Doble', 'Doble porción de carne de res jugosa, con queso cheddar derretido, tiras de tocino crujiente, lechuga fresca y pan tostado. La favorita de los amantes del sabor.', 'productos/hamburguesa_doble.jpg', 110.00, 1, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(35, 'Pozole Rojo', 'Pozole rojo tradicional con carne de cerdo tierna, maíz cacahuazintle, y acompañado de lechuga, rábanos y orégano. Sabor mexicano en cada cucharada.', 'productos/pozole_rojo.jpg', 90.00, 1, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(36, 'Burrito de Res', 'Burrito gigante de tortilla de harina rellena con carne asada sazonada, arroz, frijoles, queso y guacamole fresco. Una explosión de sabor.', 'productos/burrito_res.jpg', 75.00, 1, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(37, 'Tamal Dulce', 'Tamal dulce de masa suave sabor vainilla con un toque de canela y pasas, perfecto para acompañar con un café o chocolate caliente.', 'productos/tamal_dulce.jpg', 30.00, 1, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(38, 'Sándwich Club', 'Sándwich triple capa con pollo, jamón y queso fundido, acompañado de lechuga, jitomate, tocino y aderezo especial. El almuerzo ideal.', 'productos/sandwich_club.jpg', 65.00, 1, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(39, 'Chocolate Caliente', 'Chocolate caliente espeso, hecho con cacao puro derretido en leche, con un toque de canela y vainilla. Una caricia dulce para el alma.', 'productos/chocolate_caliente.jpg', 30.00, 2, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(40, 'Café Latte', 'Café espresso mezclado con leche vaporizada y espuma sedosa, servido en taza artesanal. El balance perfecto entre fuerza y suavidad.', 'productos/cafe_latte.jpg', 40.00, 2, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(41, 'Batido de Mango', 'Batido de mango fresco, cremoso y tropical, elaborado con fruta natural y un toque de miel de abeja. Refrescante y nutritivo.', 'productos/batido_mango.jpg', 45.00, 2, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(42, 'Tisana Fría', 'Refrescante tisana fría elaborada con frutas deshidratadas, flores y especias, infusionadas lentamente para extraer todo su sabor y aroma.', 'productos/tisana_fria.jpg', 35.00, 2, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(43, 'Licuado de Plátano', 'Licuado espeso de plátano maduro con leche fresca y un toque de vainilla natural. Ideal para iniciar el día con energía y dulzura.', 'productos/licuado_platano.jpg', 30.00, 2, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(44, 'Smoothie Verde', 'Smoothie verde gourmet: espinaca, piña, manzana verde y semillas de chía, licuadas en frío para conservar sus nutrientes y sabor natural.', 'productos/smoothie_verde.jpg', 50.00, 2, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(45, 'Michelada', 'Michelada con cerveza bien fría, jugo de limón natural, salsas secretas de la casa y escarchado de sal y chile. Un clásico para refrescarte.', 'productos/michelada.jpg', 55.00, 2, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(46, 'Agua de Horchata', 'Agua fresca de horchata, preparada con arroz molido, canela y un toque de vainilla y leche. Refrescante, cremosa y muy mexicana.', 'productos/agua_horchata.jpg', 25.00, 2, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(47, 'Té de Manzanilla', 'Té de manzanilla infusionado con flores naturales secas, de aroma calmante y sabor suave. Ideal para relajarte y consentir tu cuerpo.', 'productos/te_manzanilla.jpg', 20.00, 2, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(48, 'Cerveza Oscura', 'Cerveza oscura artesanal con cuerpo robusto y notas de café y caramelo. Un final tostado que deleita los sentidos.', 'productos/cerveza_oscura.jpg', 60.00, 2, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(49, 'Helado de Vainilla', 'Helado artesanal de vainilla hecho con vaina natural, cremoso y suave, servido en copa con galleta de mantequilla. Un clásico elegante.', 'productos/helado_vainilla.jpg', 35.00, 3, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(50, 'Pastel de Chocolate', 'Pastel de chocolate oscuro con capas suaves y cobertura de ganache espeso, una experiencia intensa para verdaderos amantes del cacao.', 'productos/pastel_chocolate.jpg', 50.00, 3, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(51, 'Gelatina de Mosaico', 'Gelatina de colores vibrantes con textura cremosa y trozos suaves, hecha con leche condensada. Ideal para niños y nostálgicos.', 'productos/gelatina_mosaico.jpg', 25.00, 3, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(52, 'Pay de Limón', 'Pay de limón con base crocante de galleta, relleno cítrico cremoso y capa de merengue dorado. Refrescante y ligero.', 'productos/pay_limon.jpg', 45.00, 3, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(53, 'Cupcake de Fresa', 'Cupcake de fresa con bizcocho esponjoso y cobertura de crema batida natural, decorado con confites y fruta fresca.', 'productos/cupcake_fresa.jpg', 30.00, 3, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(54, 'Guacamole con Totopos', 'Guacamole fresco preparado al momento con aguacate, limón, chile y cilantro, acompañado de totopos dorados. Entrada perfecta para compartir.', 'productos/guacamole_totopos.jpg', 55.00, 4, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(55, 'Papas Gajo', 'Papas gajo con piel, sazonadas con mezcla de especias y horneadas hasta lograr un dorado crujiente. Servidas con aderezo chipotle.', 'productos/papas_gajo.jpg', 45.00, 4, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(56, 'Empanadas de Queso', 'Empanadas fritas rellenas de queso oaxaca fundido, servidas con salsa verde tatemada y crema fresca. Crujientes por fuera y suaves por dentro.', 'productos/empanadas_queso.jpg', 40.00, 4, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(57, 'Nachos con Queso', 'Nachos de maíz con queso cheddar fundido, jalapeños en rodajas y crema ácida. Entrada irresistible para cualquier momento.', 'productos/nachos_queso.jpg', 50.00, 4, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02'),
(58, 'Brochetas de Pollo', 'Mini brochetas de pollo marinado con especias, intercaladas con vegetales frescos, asadas a la parrilla y servidas con salsa de tamarindo.', 'productos/brochetas_pollo.jpg', 60.00, 4, 1, '2025-07-29 14:52:02', '2025-07-29 14:52:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2025-07-23 15:49:15', '2025-07-23 15:49:15'),
(2, 'mesero', 'web', '2025-07-23 15:49:15', '2025-07-23 15:49:15'),
(3, 'comensal', 'web', '2025-07-23 15:49:15', '2025-07-23 15:49:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1DqNC1D6vUqZ3zVI3M2XDrxfK5e2EAlae2PC9bDh', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnBRaUpuT2k3Wmp6TTZ4dThvTGFPVlc0VkxFd1dwMDBBb1B4WDJBaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Ntb290aGllX2ZyZXNhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802399),
('1eE3aLJrhzOZFggBJGFPbv9fIiR0F0ZpvmV5Foxl', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWtLMjNBN0p5cURROEhQaUM1UUFNMkYzZGtvaE4waFE2ZjVKWkkycSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Vuc2FsYWRhX2Nlc2FyLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803480),
('1Eq4N34zK86XQ6BR8EX9Ze5zeifgpMt6rU1iQSeI', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUdKODVBUTJGMmN1SEhYckdsVlA5RkZPUVdZRkdaOVVrdDNNb3VhYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3BhcGFzX2dham8uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803481),
('1OK0vat0Gk1wwqSI6a89y9bSxHSMOUntsACIgKlN', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkZEcnJncGtqQXI2NXU5WTcyYWJBSFZOT3EzbzB1ME96ZGFaNFZmRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3BheV9saW1vbi5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802441),
('1sSACqsLN4YNHI3VRjVHlAPCuwbGn8zZmPB9Rbsv', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZm5yQjdyS3UxRnA3MFhTa0t2Q3pFT0xOclVDMVljY0taUFJQQUs5dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Bhc3RlbF9jaG9jb2xhdGUuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803481),
('1uOFmgaXzd3fowRqNkIPV2NLRh4GRdMnC0EuAdMz', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQnBtdEp1Y1pzRE44OHFNZjBINXlTNUNaTVNTRGtvVlBEZlJZWEcyZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2xpbW9uYWRhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803480),
('2JvYZGKOPZcuxzxyd8MavCNbKWhVbJdq3DiBLADt', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHFRZml1dVMzYm91YTNyUGxENVQxbmk1YUJ6Zld6UDlsblZRVVZtSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3BheV9saW1vbi5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802399),
('32fNwlgMCjhNlUjRRgw2qRy0vnDexuw0vVienyhE', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWpEZkcwRnFzY05TS25tNkd6S3NPMGdMOXNqcDFRaGJ5cDNwZ0l0YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753865318),
('34HWQsDA58RMvRHZkYVGECGtVqABT077pDA0AGp4', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjVDWW5wTFVQSXZNUmR5cEZCbE4xdzVuSmdXVkJsVnV5aExVclBsdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Ntb290aGllX3ZlcmRlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803436),
('4Jif3fKAxoPPeK119Dwm5BZz81IKiKpkNc0FtgcI', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieVZLaVg1Skg5WlBpT1JoWWlEY3NpWjVlYmJscjdadlFBMzdQUTZKNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2FndWFfbWluZXJhbC5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802441),
('4LjMl6wdvb7E0WTGQetHEqNG2WqwRYusLxi1mDq2', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzdydGQ3SUxOeVFTREpaQ3BUYm1VSkt4dXVIanAyUkpiZGtBWUpkYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Bhc3RlbF9jaG9jb2xhdGUuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803333),
('4MjuVaxOl4hW9bLoYEgLlg1MOGkWuqvAERqBsrkT', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibUNjeVpGN1ZOY29ld3FhSldOZ1IyN2d3YnZzdGFGVTlBZXZqamtGUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3BpenphX21hcmdhcml0YS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803480),
('5F3ZDn0OxEouDPobBCc6SvFhQSjRjT6STY0KHgqm', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1N5UUNHcHhUR0ZHSUU3NUJacHJXckoxMVFJMlk5alhZa3A4Z3d4RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NlcnZlemFfbGFnZXIuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802399),
('5Hv8PjP7NDv99bbNDFCt64iJuE4fpPkkkQpfn5Rt', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT25VSVlTa3JxN2NQN0d4cjJZRTlBTXBvdmEwak9BTFJwVkhuY0poeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL21pY2hlbGFkYS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802399),
('5Irif3vlUFCR4OwyxghHjkZzaF50hvE4FlPD4XZZ', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieU1za3BCVDQzejZMd1lXa0RRbkh4MzFrM2VsMXRIR2NxRjhrMXR5NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RvcnRhX21pbGFuZXNhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802441),
('5KFvP5503keItHhyDg9ZxSesRt1pCd8dfsbW4bAM', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmxwelU4YUFONGRURlIxaHhCMHlyaU9rMEd6RTV1TFhwYlBJc0UyeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Bhc3RhX2FsZnJlZG8uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802441),
('5v35pgiG7hZykVpW4rGDvjwbjIVCPVJRvilHY55V', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRTRvZzhPYk42UE9yN2FCOGI2ZzVETFhUQUptUHJxVjA0d1EyQ2FxRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL25hY2hvc19xdWVzby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802399),
('6qUtw41AROrcp5gueZAJuxhIx8CkGrkonspWseu5', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRlVndGV1eXU4VnVGSFN5dGVmRENVeUNSd3NGOVpFV3l4VzY1N3JUaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2FndWFfaG9yY2hhdGEuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803333),
('7BZtFd5wRdFUo4IJdF4dNrTMVgNAhdndJihaJA9Y', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGNiRDBIRXJ6UFVLRXVPS3JEdTRNMFdYS1Y5SHYwOFBMTTJ5VzdIQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2xpbW9uYWRhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802399),
('7lcw5OgGJKTgnOVm9BLKPE1I17ro31KPTVH34PIk', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWpVYWxocFhZelNydjJRS0tOSTNFZmczT0NTSktjZXN0ZTZuVVdGTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2FndWFfZ2FzLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802399),
('7WbMv6QctlDup9g74goujcf9J9YNkVWGDupEMZgt', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidTh0MkxURlFYY0ZrQjdhdHNqM3BnWGFsUEZXc2p0bTBvTUlSTnBwSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2hhbWJ1cmd1ZXNhX2RvYmxlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803436),
('868hVn4NICsX5MPV9TDOKnTddljF99PUJ8wFJKj8', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3JKbHpIN2Y1MTJiOExIT24xZGNSVmxRNjhGc0V2bGRkSEN6U1FuTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3BpenphX3BlcHBlcm9uaS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803333),
('8pAri738MK4eubMOtOT21l1eVB1bqdDLZ9lw5qMk', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGVwTGVkYjVUemk0M3RuQ1hpOGNLUkVYMHlBOGRJZ3pXbk0yTWJxYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL25hY2hvc19xdWVzby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803436),
('8uGFWkXVTDryFOvVrGpKNlvdgUtpyYcC8bmccrlY', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3llWmFkaTFRS1J3akVyRm81djA4dWg0aVNBMENITTViaElnMlM1WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Fycm96X21leGljYW5hLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802441),
('90aa7xQSqBqBMvYr7CXBbu3cHwZJ3rq1dA8uh99R', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicTdRWWpuN1E1SWY5MWlsamFFY2taZDA3MGhDRHdJQTJLMVJ3UUQxTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Ntb290aGllX2ZyZXNhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803436),
('9LHQtLJHUMeh6ZjQiT927FNL4YABlJ6v2vrzArrS', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVldpVnc1YjFaOTBZUnZiYXdnYmdaMVMzUWFGdUNnZDNGa1hVZDdKYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Nob2NvbGF0ZV9jYWxpZW50ZS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803481),
('9MVrCdcqjRwdPeKUAspJKWi5wGO8uj56pkqy4GYi', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiclJZcVhzQjdoSlFxVUY3Tk81WjY4R1dSMU1MS0pVNmkxNUpBNGZYVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NhZmVfbGF0dGUuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802441),
('9TTEAX6kPzdOn7SXhzh7ku7MmaGlRXgNoFRhFsUW', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWpDVVAxTnpzOXZYcU1NUUtvVTB5N2p5d2RoRnNZNW11QzRHYjlBUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Ntb290aGllX3ZlcmRlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803481),
('9UBxfE1or1m0HRV91IHOeIKoA4QYou3DkcuSrjvT', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHRDUnQyUWxvbGhLTGxNcmQ2a0Q2U2c2SFVNdE9CTzNUcDZtWncxaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2xpbW9uYWRhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803436),
('9Xiu1eNoSktbNUy8H1kLRoOhxSorD4a79ftweI7I', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1lRanZ1OTlGUUZlWGQ1WjFnTllvYXRENnJINkZReE9oYkNobW1hdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL25hY2hvc19xdWVzby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802441),
('a4D6GVFWgQbbgcU2UGPeKHtcpKOXDnHRWUwAzJAX', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3B5cEQxSFBCNTFjT2o3UWZKVEc4d1JLaEIzV3NEVm1RdEFvT2Y2bCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3NvcGFfcG9sbG8uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803435),
('A8jkgmMwhm1Qqw0ZdPKYnxvOFmxSLKn3lqYQ42Up', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmt5RzRBbDBOZXl6MTRRYmNBM3NBY2NzTjBqRlRhVldmNTFXZFN2ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2N1cGNha2VfZnJlc2EuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803333),
('AGnwR221mkiI8BC8p9FYhMrI7g2opH24wFdk2zIc', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlJOYVdMYnk3VnpUd0Q0bmgyUEF0TUZ4NVVLZ25saFM4ZzdxU2RlVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Ntb290aGllX3ZlcmRlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803333),
('Akx3wgvO2tTdaM7NKauMiRNm11uxD1mhLvF9Z77t', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUdQVE9xRjVWS2dvSFd5UE9PUEZOZWVVZXRla1JhbHl4Vk9NcWRYMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Nob2NvbGF0ZV9jYWxpZW50ZS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803436),
('AmDKJ06RFMLfUfWj4YBbZv0ddOTJcuMBK93VYr4i', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTdNSHZKVFNENFZ1SDB6T0d3NTBJM3BzRHhxeDJuTlNjMEkyNTl3TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2hhbWJ1cmd1ZXNhX2RvYmxlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803333),
('ApHdnVr0dmMTyCtoeSeKWLg4Wj9Q2fNDqGd57aHO', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRU02OEhwZ1ZtVkxLNzlJbXhkbTdqS1dPTGZMMGx2QUoyNUZ3S1FLZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3NvcGFfcG9sbG8uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802399),
('arONyEgIcbSGcv02FDxb9cQTsNXdL6gLQiSETzlG', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjl6bEpjbDY0T29EWk9hYW96YWtqSTVaWDdONHBLUFdVbE44aGpUSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3NhbmR3aWNoX2NsdWIuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803436),
('B3xul277c1XkJwDoTGwpxSM2mKduaoWlF73y2jk7', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVg3NHJKT2Juc0JTV2tMOTZZaFNSRVN2djdpT05Wc0QyY25ScW5NaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2FndWFfbWluZXJhbC5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802399),
('B7pr4In3G1dH0OBCowEhbTaHiUQinF18C9YuRQiM', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSU1hN09QeWhaN3d2T2NEaUJ4aWlNNU9HRWdMRWdDVEhGTWNmTk55NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2VtcGFuYWRhc19xdWVzby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803333),
('BBMNT8eCb64jzQa8n7l8dbLkz1ijMeheBT5OqTDG', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGQ5aWllc25YRDg0OG9ic0txalhHYTh2dFp5SnMzMDNpNnROdHpYQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2FndWFfaG9yY2hhdGEuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802441),
('beVnhUVH2e3Mb3rgQ2CLRen2brKCmDV5iRE01oEo', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2VwV0liNDV6NVdPelNXanp5RzdLN3FDRW93VjN4UlM5WWU1UEJrbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2J1cnJpdG9fcmVzLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803480),
('biAycgchCS92xw9eaVAfLQXL3gXTWv2Wc6nGW5EJ', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0lCanR1Y2xhZEs3SnZwZzZHdEpZQUxpbE85akxWVGRPa0s4SURReCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2ZsYW4uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803436),
('BiPNQySV5IoK4DQoSt7qh5VeDvdl1JeZzkMBNM0m', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmxUYml1Z1AyZ1dyRTdCQlpPOHpzak1GOUtnUDFCUnptbWxJb05NeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RhbWFsX3BvbGxvLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803436),
('BN5L81Zo8yi5VQigeproNSotDocRop5zERRX3EdW', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDlNSWdvSWpXT2dxTGI2STQzdkE5M2laT3N0WmxzRGh5SWg0QkYzZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2dlbGF0aW5hX21vc2FpY28uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802441),
('bsfP830P19Mnputt9M0dlh7xzfFwHbBZeeuHKzsz', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWxvYlRhajlpOGJpYUlZMTFnT3NSOTdha0JDNnpycjhqSkQ2VHZraiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2VuY2hpbGFkYXNfdmVyZGVzLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803333),
('c1oCOaslclnGWghyNqtOaeYRhvaJt31vWORQvaFk', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmZHNE9zWFhIbnBhSHpZeEdzNzhodkl5ejE2Sm1EV2NiazJxaWZrSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3NhbmR3aWNoX2NsdWIuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802399),
('c52IDlkfG9QJCAd1DzSJUBlLYwCjj8HeAtkc87ab', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmlmdW94SDVvRUJWOEl3cWIzUGsxZjBPYW5CaGxtZEc0azBxT3hBdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2hhbWJ1cmd1ZXNhX2RvYmxlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802399),
('c6aztKAsIDD3huKzNzbbVq0DLVHUdRTO8jY6qqpW', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWNXMHpGUGIzUzFjMmQ2TkNwUkttS05rcExVZXhYRDJ0d2tvUW1MZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2xpY3VhZG9fcGxhdGFuby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803436),
('c8TQxyNxkhaSrQeFwPnBsaneAPxkg9j8Oprkl4Jw', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWdnZENxMmdNdmNZdDk4ZVBBSmwzRTZQODlzamtHRmEwQjRUTXFRYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3BpenphX3BlcHBlcm9uaS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803436),
('ceAajYAGLPaBvfDSZzHftEaWNEdHYMlR3migVFmZ', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2RIYWF3c0NETVRNQ1BwcnRvUEdSaGVubFkxTjRyV2hFNVZpdEdpeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Ntb290aGllX2ZyZXNhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803480),
('ci9b7hVa7Y2madpZW6ejq5rKIpX9MdRel7Ghcogm', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMW40MENmOFFobm1CdVFOcjlJdkdEWjdLU3l6dVNQQUFlZVk4WDNMTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RlX3ZlcmRlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802399),
('cIJPhtypcdvjivsycaHadBnEnYecz2aV5OhojsE4', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV3NyMzZCUzUyVEtGWjVIR3ROdExxaWxSZFd2M3hIYUNIdTN6aFlKZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2VuY2hpbGFkYXNfdmVyZGVzLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802441),
('cjZ2sI9YqS85AKnle5aOI8Vkj67hruRQrZbi9yCe', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWxzM3JLaWFINElOdHdPemtEMGhRUnprRDlOanNXaWdyYmhhYzM1eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2dlbGF0aW5hX21vc2FpY28uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803333),
('cKsMk87plt0MwNm7P1420Yt5Wwsruq2TvF4gwR4c', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZE5CZHNRclJQRHMxMllaekZWM0lMcWY4QUlXbHhGUjN1NUh4VDMxWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Bhc3RhX2FsZnJlZG8uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803480),
('CLHqK50WuOHwOrHXdeyNO1N0Tow0gG26pCah4rYe', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWhPMlpNdnNaRzA4MjRGRkd3TjhWT0oxZGxqemNDUGlvMkFncVYxTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2N1cGNha2VfZnJlc2EuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802441),
('Cm4YdRfCK2ZDz9sZhlmse9SRQU5Q7P8Ue2Jawfgf', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibFhuaURkb3NSckF3c0t4ZmtzMVlhNzhmNTdPUTRWVEU4SmdmODJIYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2hhbWJ1cmd1ZXNhX2NsYXNpY2EuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802399),
('Cy3En2juzbG1oMgyyx57GNTzxOoRGi6CeOGIJyDj', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidXhTbmZnZmVwbDNWQVJNY05WNDlEY1I4UDBIaFpBemRua2tqUkVhQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2JhdGlkb19tYW5nby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803436),
('d2jxp4A7u2Fs7H89YdIsmv4BaQ5InaOmTPRIKZw1', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFB1blhXNktqTUNIT21WNlV3MDlnMWVMN0ZKcGd2S25QNlJSaGtGTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2hlbGFkb192YWluaWxsYS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803333),
('D3zB5yrQs2oSBnCDu05Fen406LpmTvcz2hcnSdNN', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0htVnU4WTRVaFZXeWVaZDBHeXZZeHk3RTBGY1hJT1FEZTVaRXV0OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2xpY3VhZG9fcGxhdGFuby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802441),
('daLY32tEdlyxdSIXmkI2vT9n05jQvYb3ZdMv9ULd', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidkNtWlN0cER5OVRrakc2RjNiTXpoS1hFNzAxcDVmRWt2TUVmejlHRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Bvem9sZV9yb2pvLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802441),
('dd4mbuvbjWJB9nzK1fyMnVO2YApIw2wcxD9Ju02J', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUlaY0ZKbTVyMkJRVGZ6dDU4c3FTcVhHc3YyZ2RHcjlvZnFKVDlGSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3F1ZXNhZGlsbGFfcXVlc28uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802399),
('dGMRrVRqIwXp0iYHKhRv1njmld6SaKvaSFDV50m7', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUE1mN2xScHhzdFplT1JocFl2Nkh6TVFudUNWUm1rTlJ0QUwySzFzTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Jyb3duaWUuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803436),
('DLCRfkJfgrmsZL7gVC9lQy7ClAPjwa1fXhNG6Xcc', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib29OTE5SWkVFZ3RQendTSllnY1FwbXVlcXZ0bThCSUZqUU1OcTJSdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3BpenphX21hcmdhcml0YS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802399),
('dLLpjKvfPd92GbTJJuQgh90Kn3N3cG3pZez3Y1VJ', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiejRBa1U1Q3lvQVA1bm1GdUFSbVcyR0d6UjFFTmpqVmUxNmV2QVBzRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Fycm96X21leGljYW5hLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803333),
('dNcEHX3ImrCh0weOSTSyPIioVCtTSIxiqQQ87gFP', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicXpWMUpRSTdIRmZLTGNObm5KTFh0YkN4VUw4U1U0eHpMNkc3WTlZSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RvcnRhX21pbGFuZXNhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803333),
('e5W9Pt2jEDycyG2KghIjlCeRd0ci6MIkjkUBvkic', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTk5BYzVwazZuRXJZZDlNSkt5VWhlTEZOd3ZIWVNoMXRQd1BxSmI4dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL25hY2hvc19xdWVzby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803481),
('E8HRFXfcmgDyZyH6ZOsYW6wMezSUldTMwbWdJXkx', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEtkSkF1T1JBTUpKVkw0aHEzMlhBdHRYd3dTa2FyYmo4NVVrNTgzMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Bhc3RlbF9jaG9jb2xhdGUuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802399),
('e8W2s3sJE4dOL56uwcSg74Qnu1mLwMq8DfK1fIO5', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmFROXVPckVvRExMMEMza3BjRVlqeG5NVTVveWgzWFJYVWJLRHpDZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NlcnZlemFfb3NjdXJhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803481),
('Eeq6LK2P6VEAq6tZrBfBUBTLoLipdrfb6XqXumCQ', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUlsb3pycXhqSmJMMnpRaVJmY3FwampyeGVkWW05MGJIY2xnOWlGSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2hhbWJ1cmd1ZXNhX2NsYXNpY2EuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803480),
('EQAHZ4sBb96RaXXCS9fkoP36m7QD76Ke711yzgel', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQTJubE5IZ21nQVB3d29nN1Q4OWdXclVZMW42V01ibFFjb1RkNVJUSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3BheV9saW1vbi5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803481),
('erdpejBviFXHr4zUTRr8CUJhNQu4eCkEsyZk6wGC', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUhDZlcwak91M1FqQXRlRjFrb0JjNVlLanEyQm9FRFhkZndYUVJWayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2p1Z29fbmFyYW5qYS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803333),
('etJU1pZylDNRqM87I91Gx7eMiiLAypCU868Y4goo', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2hFVTlGY0RpblhnQ21PZ3RScGNMOGxuOURUQWQ1WkFQcFVINUJpeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3BhcGFzX2dham8uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802399),
('eVb80IgejtqmsHTGbkjxuxQclHw8bt1zINaAWplI', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjhlaHZDMkdJVkFaQmVsc053SjRrS0lPZnZnZFJRRUlrY2hIU2tHRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2VtcGFuYWRhc19xdWVzby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803481),
('f355BzujRUtZSyxGtrlhYregw9KIEMAB1iIEMMeo', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUM2dDFTcWh6YjNXMFRsbTBoeFJkTzJWR2ZQcmtrWWtZd1N1b2tETyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3BpenphX21hcmdhcml0YS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803333),
('Fe0DT2oTnrzgmsIWMuzmx4UZbYOxlamCzETOyqUu', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidTRiTERsQzZNRFlHOUhnUDllRnFrUXJwa21sUVZ4dW5qbjlLdXRSMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2p1Z29fbmFyYW5qYS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803435),
('Ff1j8r21fE2dYloRBUHi4x1p21tdjUzIj8TesMQv', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUdVU3RJVmV6U2FpZjY2TWlSbzcycVJ5a1VuUDlhenhQaURTQUNZaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RhbWFsX2R1bGNlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802441),
('FHFT1dxwZoO4No0yG3K2zEbZ5u3RKNDJxULk92OV', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUFIbmlvanFtTUxjT2FUdWV1NndJVUQ4d2RmWFZnY2J5Q1F1Y20xMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3BhcGFzX2dham8uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803436),
('FMgM94s8mhjfDawIIbHc1u2TW33S0AHtrDQGl0zw', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTRHeElFOFRSQkFwWURyY0dSaXRSaU1ZcTVibTFLb09XTlFOQnhPZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NhZmVfZXNwcmVzc28uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802441),
('FsQlfW39AKb79UULhouXfnZRbq9ErLHNcj7ZC0fN', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEFud3BtMU9ydWFvRTczTFdLUkZFSUVYZGhvQjhTc1R4VnJUNXlHOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3JlZnJlc2NvX2NvbGEuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802399),
('fVyDlCEqZoU7JAA1aNA9penmVOpmXyQOhIssQLbg', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWktoVVdBc1hFRXdmNUtpT1lVSTFuNHhrSllINWF6VVpnMGlVUnN3TyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3BhcGFzX2dham8uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802441),
('G52BrLPSz9Sh41O7Z8KMdjS9ZxlPE0Yxn1FdbmD3', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVklFOFJhcnBITGVEaEh4bjNzbG5XeE9uR2VMellvWjA5ODNWdm13dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2J1cnJpdG9fcmVzLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802441),
('G5y0Itngasyk0f0xBVw0KDkqDJlX1nckcCkmSvuO', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiamVNSWFHNjA4a3RsaWdVMGRJazVqOFBlQzV4Y1owR1poaWVvOHRSRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Ntb290aGllX2ZyZXNhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802441),
('g9IsyWEjb9Dnqdu16qtGF2QkCmTtpYV7cGqX3MEE', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHdpZXFzald3ZG5TTXRJRFRRcDNOZk5rZlpsQ3IxcUFKU2FUQllyYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3NhbmR3aWNoX2NsdWIuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803333),
('GBtZ1OnHP7Gn3045QaW70EwymXkUjKMcyMZxoT5E', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieXFMTEE2YmJXVGoyWHdYNDRXbndMcFVCNjE4YmNQVTFLZVJSbHZKcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NhZmVfZXNwcmVzc28uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803435),
('gktneOBX0L69BJBtLBHa0LGq5Pkz4JGkg8LENqBj', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicTJLSk9nUEpxYWpsV1pSU2l2YXZac0oyTUd6ZnpDYUlrODY1dTNpNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Jyb2NoZXRhc19wb2xsby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803481),
('GWKKrRM69wLi95IowZO1ntPC2OBB2zri4rsA2YT9', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzRBUW5SWk1YQkllY0V3aHJZcjJ0dVRWRU4zRnlucWJhMVVueXM3eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NhZmVfZXNwcmVzc28uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803480),
('GyHTn06JPP2j9uHl5LrB7iDYP2cZ6X4TPeSw3nvh', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmFwdUFBdjRtZmNNTEdTYVVqMUp3MGlrd3NsWmxvaElHcjdubURqZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Jyb2NoZXRhc19wb2xsby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802441),
('H1D44AJgeEbY2PzQggl7lucvazs4Nwj1dTXWzOY1', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialhxaUJ0ZzFOTDhKVGxxMTFFZWszaFV2REFQTFdIM2E5NDRNMEhsaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RvcnRhX21pbGFuZXNhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803480),
('h1GKfgjBdOJzlKrx4gIPPAsAjxlGZtD89cnDaWbY', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRFNrWXZmOWh4aVFZbjE4RWRyand1djVtSzZiVnNpVTRtNmNMOGx6VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2hlbGFkb192YWluaWxsYS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802441),
('h2qIRYYg2oEEHTdBhJgM1uDnTZUBuCzGRGtrrrWG', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV3ZwSnJnREMxS2xEdmt2WW9WOGJxWWl2QkM2RW5XdDlhWEt1N2JwTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3F1ZXNhZGlsbGFfcXVlc28uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803333),
('h3KIYKnF6di4tl8Ge1uyZOTqRwVpVht3POGBJzlN', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjhCNzBsTFB4dldhWkFqRnc0YXFCYnZXcVFGSWdvRVl3UEhtUmZ3ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2xpbW9uYWRhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802441),
('h5VmZ27AtVmvz13mmlUwTKqC62JtfskP7qHBV0CU', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2FsaG9lUGxNSDFWTGZucEVXMFRKdDJPcVBVZkk4bFRJT1NkSHJhQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Jyb3duaWUuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802399),
('haCF9pjWSjSlFpdqQmpIpAjJGy4VQQcD2beYuE9x', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0tLS2FnS2F1bXI1cDBPVnVmcGJJWFlTWGZydGs0R1g3aFRQaEQxUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Bhc3RhX2FsZnJlZG8uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803435),
('hFbdm3LytfZOMCsy5dXgpBjDa3zmV7eUOqryPltM', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEZQV2FhSWpiVnJtNzdlSUNNc2RNUkNHRkhIWTE1RjlRNmNmTzdHVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RlX3ZlcmRlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803480),
('HFQtkDE4UQn1XeHJmXfGsYHcQjb4QxseVVI0JkNh', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicG5CRUZQY1p1bXlBTnVCQ0lQakxNWTNxeUp0TFRDRkhpbzU2NkxuTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2xpY3VhZG9fcGxhdGFuby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803333),
('HJeMU3waKjcVOE8Z5cTj1Kud1hQwdjrQ4BS6eHHi', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXZLQkZUZWZBeVU0eFFsdUl6SDY0Qm9MSW1DNlM1TUI0eUdBUk5KMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3NvcGFfcG9sbG8uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802441),
('hQCixnPmEkPyRFkEqn4loZulLs9yKuJRBHYL32dg', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2k3NEV2R0ZETU5PZ0JoOWF1aGVJY2NZQW1jdXdUQlRFeDhZbjhQeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2d1YWNhbW9sZV90b3RvcG9zLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802441),
('HrFw8FMv8XgEBDqNjc0iC3pCalCcU6QJRxx7rkGe', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFgwU1o1MzVEM2s0MkVhZ01MYkR4Zm1UUkNXeUpUc0luZ05ZWEtGMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3BheV9saW1vbi5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803436),
('Hx52Bo93tGdI5ScxSC6MnLUsoEs584XxGpj7E9i0', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDg1QkVtUXhOSlk3TEVLT1l0MEVWdHNzMHkyT1FsaktOOFlPVVNYNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NlcnZlemFfbGFnZXIuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803480),
('hxZ9dDVZmBRqwfhLO2Hn4zGcjCFQpZ2VTVMQ9Q7x', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWtCSXJsT05hcXlQZ0x4VmptVDJhR3I4UWw1dmhMWGk4c1FDMndRTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Rpc2FuYV9mcmlhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803436);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('i0FR6ziNAdWlBa9NjUWO1IyT9nmSlPeQT5U2DEdw', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREdjeVlmSlk1cmhkQ1N0SEplRWwwZVZkcXhMZnU2R2pmVldZSGROSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3JlZnJlc2NvX2NvbGEuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803333),
('iBCJUE2GheqyUAqVMTtcQWNl1bWqy6rUzNZ3BG8D', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1RaRUxKZVNnWVRlV280cmxZdEN3cjZhVko4VVJ3TFYyRHJqVWhTYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL21pY2hlbGFkYS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803481),
('iCI8MZAt30PodQ2QEHzLhnNRidfyULjTADMBgbNP', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0ViRGEyWERZbjRiOFFoMHI2RWpqbE5mWW5QaWtsUHNobXdXTXN2ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3NvcGFfcG9sbG8uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803333),
('ieVdbOFx68xoUEpui2On2jVYOuTU0dq5RIrwnB3C', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDFMbVJyNjd2RFNNd0VHODlYSzYySGxjRzhvZUwzNENtYUNoZmJYRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3BpenphX3BlcHBlcm9uaS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802441),
('igjRQZNEtf1ijDksk98H44jsliVlKNv6OLwM3ldP', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlNxV2V3UGdQSmtXQlcxZnlSdXdBYmFJOFIyRENWYkdYV0J6dkowZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Nob2NvbGF0ZV9jYWxpZW50ZS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802399),
('igXn0TiB9LP5eMJ7TF3D9PNgljk7fpo0VooCw657', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1c4S1VndlFFTEVPVmFpbGp3Q2g2UHJ6bUJsTkV0RlQ3U2NkY2NNVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Fycm96X21leGljYW5hLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802399),
('IiSMEmWJA3RgjmMIKmKYp8OXsgGZ13qKJvRHTJfe', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVdYVTFJZU5NdmhhNW91bFVEMnFNbG9xbTAzbElOZUp5THB2cnRobSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2J1cnJpdG9fcmVzLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802399),
('IjWchFKyNq0D1v7ghQDOeZULRrAONZwxXJ3yqaMi', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYlJTZEROaFN2a0pFUm9KRlA3bDBjRHFYN3FvVTBKbHBxelA4TXBreiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2ZsYW4uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803480),
('ipzQo2eH4ZHT4tadab3gln3V3XNT1KVmX8OEy9eJ', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNU84SFluOGJrN0lEbWV4eGlTWWFCOWhnamh6SE1hRjJwcDg0UTIwYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RhbWFsX3BvbGxvLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802441),
('iuyuQUuPdog1I9jhzIAjhlSZhOffETGlziUhaduk', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmRRdjRDbjdVMjVnZ0g3WDJleXpDMTZpVWs4QXo5NGhHekt1MHBhSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2hhbWJ1cmd1ZXNhX2NsYXNpY2EuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803435),
('IwPZU61NvrI4nt0z5VdMQRGn2O8Bf4eIzXxKS971', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3hQc0dQSnNXMkVoWkNyZXVoa29LQldBN2lkRG56a0lNWXpmWTU5SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2VuY2hpbGFkYXNfdmVyZGVzLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802399),
('J5lsMLrwTrNM2HG1IXwwLrmsqVh8Obg2ft7CyIq6', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiakNGNDBlamZmMVpzd3VvSVNTVFp5U0Zlb3VwOEswWnp3dHRXZ251OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RhbWFsX2R1bGNlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803480),
('jC6Z1Tc0BgrTKfBLn0Rbq6kGcho6A2VZaRKuHjrt', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicU1RdDVtZ0lWOURsc3k5bVZ4MlJFclJ4MmJZeFlkZTZuZEtoSGFhbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL21pY2hlbGFkYS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802441),
('jeAUNjoC6dRTSk8L2p4oUEeIiWp9pNsomImVq4Fu', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0dOOFFLbk0yVlo5Q2g3SHk5alRCTDQxOEhQdkplSmxQa1IzUDFrRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3BpenphX21hcmdhcml0YS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802441),
('JGUJhWz5syg7ujqwJbvDW7iTm6kufNPjgG43ZWOs', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3QxVVg3ZmtMRk41bnFWSUpWNVlmY2c2TjRGVXgzclRuZHB5c3V3UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Ntb290aGllX3ZlcmRlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802399),
('jT3spF207fL5gXm81LX5vV19TPpCU2TNmId8stSR', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib29ndjRWd3lsMnRmdHNNSVJGM014YWRQRmRRRHlZUXhJN2JBT01VbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2hhbWJ1cmd1ZXNhX2NsYXNpY2EuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802441),
('KaMcbvb0gKhSmzvfC1seDXtK6qvLFVLm1pwswJKK', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1BBckJtclZxdDVDUUR5a21KWmhVbTRZYmdTWUJDY0V5OG9nYVlTWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2FndWFfZ2FzLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802441),
('kdShp0OsDiQ6JiX5Kz1zgcbOvr3C3NENBnZww5sg', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUhRN3BoZ29Qc3Bwb0NkaXVlcGlnRTdLOGJuYXdVell5MEdxWDMwUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Ntb290aGllX3ZlcmRlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802441),
('KixtomLDFBzF65ftSQE2tswYc8dSHkU1ZTs7U5pb', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3lXeHk0cXJiQmRETlRQbHVpZnpNdGNPVHA2dWVGcGZINmJHTjk2NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2dlbGF0aW5hX21vc2FpY28uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803436),
('KjpcRQ8nJPrRwRp2yfVqOYDPdghilo5gDeh39tpu', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGRCVnVFVUJ5VVJMaDJGa0pieUd0S1dqakFKUVdmcTRXd0NHVUVNdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2N1cGNha2VfZnJlc2EuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803436),
('knXqCCtzh0GVe9VBUUpmu7XdvOa7vSfC0Zkn0PGU', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQU9UMU1DdGNNSDhiME1yT1FtVE82czBDaFc4QzJWSHV5MENWQ0RpQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RlX3ZlcmRlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803435),
('L17PNHfyvrJWHozAFUX379Z4x0Zw5cmg08T3e0uw', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2ZhSmlPcEZUOWg5ekkyR0E1VGhWdGFTZUhnWDdEOTBTOU1wS2tYayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL21vbGVfcG9ibGFuby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802399),
('LaBBjNHBzqtigybCGZsRWKPhAzrKnkwLO2FM1cQm', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibVgxU3JhYmRtR2pLU3FYS0N3NGJRQWU2TmVBNmhIc3hFc2YyZWNITSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Jyb3duaWUuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803333),
('lP9qwTa8CcuCpjPvnh5Hh84VT03QuyNgHNhxUM4i', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVZhQWVGT2o3QXdaMXMzN1B3YmI2WjF6eEEzeEFwdjVZR1FiclpjMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL21vbGVfcG9ibGFuby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803480),
('lwX0gELO19HZpMqRZoUGYyVaoHReL0uocMRRZEZo', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoick90bktscjdlVThUUWUwUXFSNVdWa2RnSXF1Y01aOXRSeW9YQnZOeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RlX21hbnphbmlsbGEuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803481),
('LYeuQBxmLm2yoasOQS5g4eP06B0jwuODIf0UOeim', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblRUengzenhFVUJ6dE1MSUdYWEdmUTV6WjRBU2gyd0xqSXBiQXdvTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NlcnZlemFfb3NjdXJhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803333),
('MCTQgw6kRQgVxT7YEU8DkwRRNKBy2pAfZagvSTV8', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFFWMUI4MkF1bEhJS0FYVzliQXBUdDFQVUszYkg0dkZudGc3dTlmMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2xpbW9uYWRhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803333),
('mM36W60kj5neRHHFUuIU7FxRbhNIl5PY5dwitBZg', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUFXajIxZWFqUFF0b215d0Fnd2pVc085WkRJNWhxN2R5N0NZbVRHaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Bvem9sZV9yb2pvLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803480),
('mnApKDrq8NkAyAbYCKiNkkYggoFtBZc7LsOj44Lf', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1RjNk5HSmdCQ2duY0hrMEh4aVdibWo4U2I0WTFWckRvNXFUWTlheSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2hhbWJ1cmd1ZXNhX2NsYXNpY2EuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803333),
('MqLzNFzQ3k7ed60yLEtmCemn7VCVsAydnFZT1lTt', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0h1NE9CS2dOQUlLbERxckxZM29XVzBsT2xkSkNoZTYxOEVKT3BVdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3JlZnJlc2NvX2NvbGEuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803435),
('Mvz2TLyAul90IN4uEzRJNjb19nhvFVJmsOI5ypDT', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHFoZzVEdnBVRXE4akQzV1Qwc3JjNGMyV1BhU0ZvTm1sdDNoaHJuMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3NvcGFfcG9sbG8uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803480),
('nDUG4EiN3pFWBVDINhg2HQdVQxh5ucZkfybACEBX', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3V5c0pGeGIwdkw0RGZvSG9vb1ZmU25kcTlOZDV0THg1TGxRT0lyeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NhZmVfbGF0dGUuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803436),
('Ng1kcIGUseIvDKPbYAwBydwHGj3MdB2T0q0oTYcZ', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNm4yaU1CajgzcUxoM1NaalVUUmtwS2ZTelA1QXNtenR5SW9hZkNQYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NlcnZlemFfbGFnZXIuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803435),
('nkWj03yM0096NGFm5d2mYoBKwOEJq6414MAvxMWo', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmlCcjJuSTN6RnNubTh1YVZHcTBIQlVKcHZZVmhxeE5SZlZVVjd0dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2hlbGFkb192YWluaWxsYS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803481),
('NLqQ1W2cltl9EQ752QWI6CctgPKH7n07dMKfkla8', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0NGd3BvaDg0bmZlR2MxTE9qdlNxWGRWMDJIejNDQVAxdWY1UjQ5bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3JlZnJlc2NvX2NvbGEuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803480),
('NmUFhYglMQPFYuRGzUyLk5W6gbQvU9aBHFvwhEOs', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1dxdkZPeEZ6eHp3cDJjdVpRb29ZYUFNdDdhcTN5bjdDSnNwZHVoVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NlcnZlemFfb3NjdXJhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802441),
('NphgmrgIkyO3P9YqWXmQzu6Pyzmsfxv9hUTW2CVj', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTBFVE9rcGZBUnZSZ2dXOEUxU1BZdTZzYk9xUlIwNDQ4amZtUVlScSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2p1Z29fbmFyYW5qYS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802399),
('nqSIt00QcfkA8UmUdpBb8EHLAIjZoIvay9hab7go', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZE1qQW52NlZkaTIxbXY3SmpWZVhZdVJ4bnRPSUh3VkNJN1A3UkEzZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2N1cGNha2VfZnJlc2EuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803481),
('NT69RXh9515lzWz314vyRm0AGCWiGjN3ne9nDPDz', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2ZxYU9Lek54aWJqdTU2ZTF2ajFUVFFIeTFGV0RKYWtybXdabDVDZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2d1YWNhbW9sZV90b3RvcG9zLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803333),
('nY2eyKNk1EoMIE0tSqcGinMFQOcr0nb32bNOwc7m', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidlpTZDVFdEVtR2dyMDIyeHNUZElWc3BYTmJyYWtSbHFEM1lsSHdqVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL21pY2hlbGFkYS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803333),
('NzTkORk06x6YnpNQ40gw9jteULCor9fXGOfihVlV', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHJYeEhDMGVTUFY0NjI3bEJuSFVQZ01GS2JTa3JFekx1RGE5S2dwNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2d1YWNhbW9sZV90b3RvcG9zLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803481),
('o1wGbv7xKUp2fiYZf2Vs8sOTV67iReZLDKsJu6XX', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFdRNTl0VjJSdjUwWDZmdDZIQVRYazhmRTNuZmViYTZ6QnMzTnZHcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RvcnRhX21pbGFuZXNhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803436),
('o4tOnZunJZxSQsAX5kEP0X1YV7oFOMcjHhagR2QG', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSllpN0JBOG5SUFV4Y3ZMYUQ0OThRdUxvZHRNclZXdlBLc3laV1pZSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2ZsYW4uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803333),
('o6G3tP1eqUIgazZ2nlTZ4i7UUmghX3v2csDTehv8', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibFNmdjQxdTRXMk1QNk1lS29mU0FhMVVjeW9PSTlObG9DWE5DSTVtVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Jyb3duaWUuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803480),
('oBpzzMRG0Yh1ag4sKw5RKZOr2lrnnZhFY68wuHtM', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2dOMHNVcXBaaVJwME9jamxJUXVlSlVrMGM4cktGcEQxNXVSRkdzQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RhY29fYWxfcGFzdG9yLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803333),
('oGmBfQ1o1gvZzrl8y6jnIqOBubkxmPLPUTaO7uz3', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVk5bDUxTFQwWk9IY0RnSmVxUkdIcHJoTU9IdXN4U0xsU0JXSkVtOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RhbWFsX3BvbGxvLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803333),
('oixNloR4ObGBnaNm4kWsCua9qpN2b2juTaeNLhqO', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieWtQeHZna2ZqT1lDeXYzWXhvZHdyMjBzN0V0QjhxRzd0ZkFRY3JzZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2d1YWNhbW9sZV90b3RvcG9zLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803436),
('olNClU2fEwcuK9IFoQibp0cmfvo3hvNDNJxKXIgG', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEpDdHl2b3dVdUFEY1NJUHB6Z0pNWWVBN1dYSTJPa3d1emh2VUFvZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NhZmVfZXNwcmVzc28uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803333),
('oodJdX3JTeRQNTsvPnax3uwkHI1vOtfW8d2JMsUV', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTndoMFdkaGdWSGxrZWRKUnVBMjA2aUc5ODVnNUV3ZE1pd09jakpUbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2FndWFfZ2FzLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803333),
('oqGgozNmwSp58KvCIPQiYtKaCoGtJ2Md8FMDNkGM', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFB2cWJhQ0FwTjgxZHNJU0NQUmhZcmtRbDRrSmxRdEVESXRQTXZlQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2FndWFfbWluZXJhbC5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803333),
('pBddcSSQyN6rHmqX1nB8biEcIn0qFL7sBkUkF0IN', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWdZU01OcVFYY3pmYjhtWGZNZkRJNmJlcXRsMWVPeG1IMk11a2o4NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL21vbGVfcG9ibGFuby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803436),
('PC44B8keWBTT7nQ7bn7IrJzIY0la2d25L6AaHRtD', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzloT21vbE9zUHd2WnZKamdHRFpTQTc5S2NkQVVycEM3SVp2VDFseCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Rpc2FuYV9mcmlhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803481),
('pd030revGlH5Xhbgq7goUchntq3l4iBcQDrB1t9w', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVhweFN3c0M4SmVIdWFPc2Z2dFkwcW9EVUo3WjJWWktlREVtTXQ2OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Fycm96X21leGljYW5hLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803480),
('PgqbflzjjPFIa0LPm8I8f551OngcoYH57R6K1qic', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkNJbnFNdmdsMHo0cHpjTW9Sa21DMFQzM0NTcVZhdVdBV0hlVFJxSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3BpenphX21hcmdhcml0YS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803435),
('PlcFQVBgOITuOf5txdYuXorIcVa3pYqv99Bdjg24', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVVKa2ZuOXg3OGx2UXFSWHVxRk5BTEVIalEzOE9KdjZwNGlubkMwVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RhbWFsX3BvbGxvLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802399),
('pndhf2ZmSkgh3s5Tmc7xuU2ExFFGwMrGEGvFHZTC', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUVjaHhkV3FkbFJSMXZ4WWZBcU5ycHFIclV6Q3lVYjJOcWZ0TXY5TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2ZsYW4uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802399),
('Ppes2VKVV2cUXGGR2HGF7YrGXSFXtrNQa2HROF5H', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkExZ0lBeXV1dVFKQ0dUZWF0UGtIMDM4ZVlYSmE5cUMxYU5LNzlRUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3F1ZXNhZGlsbGFfcXVlc28uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802441),
('pPRvdhSY77ugBVa2qv39OcmzLye7SP39WUHDcxQT', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWt1MHQ4azBGakRwNUh0TXpKREpQQUJlOW5vSGNEc3VBZ1YwaVNJUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2hlbGFkb192YWluaWxsYS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802399),
('pQnRGUwJCdcGz4bIsit4zk4AAwTKIp5B1MEpPi70', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYllrQTJWYzJQaXA2aHJqaFNGRFd4azhMUmxKalNWbmxPdXlhRzduVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Bvem9sZV9yb2pvLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803333),
('PSLP34x2QnGpt1Yx3mee5SAj9r6eQssTZ9uxPhh7', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibUZlYWk4SE42cWJBeHRtb3NXWmJSalFRT0Z2NTI3MFh6VElTcFY5RSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NodXJyb3MuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803436),
('PXm64yS5SX80UVubynbs5JmVKgWum2KaAR5TOk6W', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnRwMkNxanJFbFZrRUtrMG9tekhkSFNQZTlHVWJMaFU4NVA3VHZFbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RhY29fYWxfcGFzdG9yLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802399),
('Q8cPWYszByOECbbTpAgqdMs0GZGcJkBNNEgv03MM', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlY0ZlFMeXNWYjVsQW1vRG1mOTVuZlVmRkgyZ1hScGNmcFpuc3hrNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2dlbGF0aW5hX21vc2FpY28uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802399),
('QfjSpVtw7WooVtoL30XvdtpHdDT7kWmIgEkGnhFe', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0lpY1Y2UE1PWnRnUTlRdXlyZ0lyQnRWSDAwUDBDQnZQU0F4RERBNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2hhbWJ1cmd1ZXNhX2RvYmxlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802441),
('QHwBE2JL7gWt6hb99O6eou3phfoViI26cPlTtnYi', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieWhPeGcyclFCdTNKbzZ1YzZxdkV2RWd5Y3ZHT1JCZzVpOVJYa2VrWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RhbWFsX2R1bGNlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803333),
('QLaupauuP3cUIet3syYaWZQ8wOxaRCzVjkSVp7oB', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQTlINzZUWHQzbFZPbnBrTDRIMm5SS05MbHdxc2x2azhHZlFBWU55TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2JhdGlkb19tYW5nby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802399),
('QPxWCXC22ZDxOjwEu0j5KMbbrc2NnJmyIKl8MZNe', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUpnb0d6bUFFNUJYdmx4RHM1ZWdwRU5UN3JYSERVRElia2dNMTBJdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3BheV9saW1vbi5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803333),
('qVajjln9FNrcWggG4kwvuC0EEI16QOIUPIAKD2wK', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRVdzSHZFcmY2WkdqMzZUZENzZXRCS0NGZUZQV2JHaGhlV2pwUFMwaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3NhbmR3aWNoX2NsdWIuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803481),
('R4F0Vx1EAxQrBhwLhg3lmBEb7EAeVaJ20mznmEdf', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTg4TEtrTnMyWFZSS0xoVVFZQTZ3TEt1c1VqaXVpdFpRZUt1Uzk0MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Bhc3RlbF9jaG9jb2xhdGUuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802441),
('r7lHvGRT9aiqs3HROygQpQwl2HZnS1o8XyNmzoH9', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWpPYjk0dnlyWHhNNmphb1huQ0xhNFlRSzZmQjE5Z09NNkIwdHM5dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NhZmVfZXNwcmVzc28uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802399),
('R8eS6G4s1ZYTUUNl4EFoqJJI2izR3B0qh4lYytjo', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHJ3VzBDZjJqNzRCTXYzdDVITlZGR2NzTVlpaUZNUkhKajRHTW5XcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2d1YWNhbW9sZV90b3RvcG9zLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802399),
('r9xEtd3FE5ENaEWApaDHZ7JKMh7dILrJZYOpKZAD', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZjc5SWRrS0Z5NEtGT2RlNE9vQWNtTUxMU0N0VERQQmpOdWFrTzVXYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3BpenphX3BlcHBlcm9uaS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803480),
('rDNWRRMcUkoLP0xasOdkB3QSf4IMrkyiB6rxyprG', NULL, '127.0.0.1', 'PostmanRuntime/7.39.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHlSRHN0elJpMVZMa3JUZ1BkaGxlYVhrQ1JJZFAzWlNhUTVCUTJYZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753856393),
('rFRd7vNO8BxR8MxmBXOHInIIH9iW6omXzL2Huoda', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2VxV3p5OGttQzBJeEZMTlFRZE9xb0dxbUJjZTV4OUgxUXhwc1IxRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Nob2NvbGF0ZV9jYWxpZW50ZS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802441),
('rN4ETJ9u30AvhCT8bD5Cb0vPz1CtQYIR7IjxeJNs', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXdDZHVnblRsOHRVekRYbWtaTzVlQjlPdDVhNFRxbkRyRTBXMHlsSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Jyb3duaWUuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802441),
('rouOzWQO3zX7FK6TLYJd6kh3ER987xamvrcnkBoj', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNU5mZThmVjBXS05oOXNSQnNqVW9iREROSFI4OVNaQzhHTk1mMnRoMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2VtcGFuYWRhc19xdWVzby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802399),
('S5hQj3an3s6qLpaXU8XYScfi7E41kR8cFYHmQW8h', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic29CbjAxRlcxcDlFN2xSWTJQUmlzTjlCc3daeEdpV3N1TDNhN0EyTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2FndWFfbWluZXJhbC5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803435),
('sh5fC4edYYNT1I46xAORrGruiFfnf1fVDoWGr0q2', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUJ4anlkNmc5Q3JDZ2ZkRkk2M1RQT3RkRXdxNVpOQXZNeWxoa0wyZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Rpc2FuYV9mcmlhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802441),
('sKariQ4hdECcZpwVo07IzeCOl8Ki3Iq7JZho7oTg', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidUZmekRlNVRwTGIwQ1Z6eExNa1FRWmEwazVpb050emp1OUZRVVRwWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Bvem9sZV9yb2pvLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802399),
('sotC9z0JWMCIoOsBsexKhuUkRpVeJVb8msI9oVOD', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzE2VHY5bVJmYktHcjdmajhqTzZXbHVLZUFmVHhDUXkycHhTb0hQaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2dlbGF0aW5hX21vc2FpY28uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803481),
('SPiMkGTXYWFLnvKnugcfgzJPRVEM8eJn4hglJBiS', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibzhHcXVGeGljTkQ2QmtmMGprZFpsUW5TOVpQMVRKTkZ0S1lyNHBiNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2JhdGlkb19tYW5nby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802441),
('SrbtC88STA64crhXwxfu5eDBm5qEEbzAUTySgIGR', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQk94QjBqSEpwV3Y4RGhnYU5YQ1dUVUNVSUJyNkRPMkxpR21pcUxsVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL25hY2hvc19xdWVzby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803333),
('sS8XKkWDy9WFewS6ZrueyJg5YBT04JwF0gpo1Qn6', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3hERDgxYUo3OHdTSkhRQWd5RFhvbzAxdEdzaktNMFVhaGF5aE5wOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2ZsYW4uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802441),
('sWv86ubdkC8vCYrSFOPa7RFRGDigk8Ez9k5PnZHJ', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVW5Jdm9mRzU3bXFwQnpJS3ViUGl6QVl6VWdkYkFzQWNJM2N2VUNJbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL21vbGVfcG9ibGFuby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803333),
('t1pUYs5G4LOOtOzfnvKMsNw0srgOuMy9HVBvWJG1', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFFLR0lWeUtyVGxpc05yemtTaHFrVXdjTDdKd1pNZWNnMDRQdDJDdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3F1ZXNhZGlsbGFfcXVlc28uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803436),
('t3CQMmamvfuRelmXdBgK1ZB4IWnAMC2QEsFI7fUK', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjVWQTRneGYwR2haUzloYUV5Ukplc1VsSzhrdDcwMkE0Wks1YTlSZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RlX21hbnphbmlsbGEuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802399),
('T5jg0fcxbnkX7qVODJXjM2Civ6hIV9LoMIALVJtX', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmR1Mlp6Nlk2V3Z4WEFIeTQxaUg2d3ludlBYbHUyVUdhTTFsZGdScyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Ntb290aGllX2ZyZXNhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803333),
('t9GfxatKCdEwhhXMoBRzc2Fni6CKhGY267SFgzuJ', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVc1SnUxNUI4UVFnWHh6MnFkanBMTzFucDRyMWRlTkI3cEN2Tm9vSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2FndWFfbWluZXJhbC5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803480),
('tcgEAO0xYOhd8BpxoI8fIi0LuwLY01OlEbiXgAFm', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2xYYWNCd3F5dUJ3UHpuVkN6dGFibnNYN2Q2WURmQ2MzVHc0bWNVVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Rpc2FuYV9mcmlhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803333),
('tgssmzYIvwh7NmwHO7E6MfFMSM608IfiIyA92yW5', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0VLY3RBak43NGVWNlFKaWQ3N0V6NHVnS2t2UFpiY1BVc3l0RDRwYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2p1Z29fbmFyYW5qYS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802441),
('ThmwZAPeSR8RyeWjD4eW93fmd4fkBJkTWouDR7XV', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnlNN3ZOMWZsYkVONGl2V2w0OHNhSVJZdHk1YkxqNHp0N0JVZHMySSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2JhdGlkb19tYW5nby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803481),
('TIrvNy2rn135RvpaHAC3AdzPr8GpSRSyIgj8Mo25', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVm96UmxnWWpoZWp5cjV0dWdjMDdvNTNwOWZLRjgwaUo5TUgyY1dFTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NodXJyb3MuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802399),
('tNCTC9ctUEyQAH4c5kdSqqfMq1vKEP6RzRBEFMPt', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlY4SGpKVzlDeWI4ZTVvN1JXcm5pRFNwODdvS3VUNGJzbmFCaU03OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL21pY2hlbGFkYS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803436),
('tsvq6PYMqSDS7bPmyNqJ6eeUYrk3pdy9ckuC1NKt', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicDBTTEh5eWRDS0w2dm1xdDVLZnVKOEk2NERvY1pHV3BlNTNTVnJpTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3NhbmR3aWNoX2NsdWIuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802441),
('TuPFW3bJ3SKqtNtnRAQnu6r1eUJnuogeQXmAyolm', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXRyTnZKanpFc2hZZDdjNnllRklyMzdsM0p3WEFwRWFTMExRTVprVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NlcnZlemFfbGFnZXIuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803333),
('TzKR9bgDGC4Q8CFUbDmEM7V85xjBg8Q1GRW5Mle2', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVVvY3pNZUxqOHNrQ2IzM1A5dFUyV0dWUkhSdDZ2QlVlQkh1ZVZqSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RlX21hbnphbmlsbGEuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802441),
('uajV6EDrR7Z27VbBAISilUBuFW4AN6eNUriH6O9x', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTVqTlROSFdyR3NnSWlDaGpPZ0w0RlB2bkJld1Q4NjZRNDBsaWo1SCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2VtcGFuYWRhc19xdWVzby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803436),
('UDXZzsr6LJziMvq4BkTomnLT606bS2D6gqBk91tH', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnBWUEpmSktqR2lEVWVFTzVCVWx1ZmQ1aVNFb1VMTjU4YU93VHhuMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2FndWFfaG9yY2hhdGEuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802399),
('UGh6OhVYjuJW0ypVdLmpOneg9h4cddPNTWFeT0Yq', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHZkWjRybEp6c3IwQ0piZ3lHQzB2ckRUNzFWOFg3bEkwaTFUTEh5aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2hlbGFkb192YWluaWxsYS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803436),
('UNNQMNn8U8ZYyTLiqpMY2jXczyHB51oVvAbEBreW', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieVlFaDFYcXFCNDVESlV1UXFOZEdscWZEVEptWWc5Q3JvTTMwbGthZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3BpenphX3BlcHBlcm9uaS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802399),
('UnwXUl2k5W0IdXxKeuSOJeeOZg9eytdmwSQTzZyo', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmx2R3RSWGExZkQ1TnQ5RlhObGVlWkNveEJJekhrTjFGU2ZLYndyaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2VuY2hpbGFkYXNfdmVyZGVzLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803480);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('uyBkRVufqj8vStQGgSeao2EIo2DLz7kKihZvhUt5', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzBIaHNRYzhMYTZvWVNMSzJLVmp0SGVPWjVOMTRUOEQ4ZDNSNkVmMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RlX3ZlcmRlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802441),
('v0y8j9AmziY8vbXTPIrSYHxvvbnRjC1sm17L5UcY', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3pqOWJESWxTNk52OWR5d1ZJWThCTzRsOGlhbTNLVFB4YmxHYk9xeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2FndWFfaG9yY2hhdGEuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803481),
('v7NR3iSCR2lt3NYQwc0jByXlrVD2OkbthoURGzlY', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHRYSGxzRjRiWkJtMzlnMTEwbmxWSkJsbWp6cWJJNDZOMXNwVk40eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NodXJyb3MuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803480),
('vFi3M2WxIs8loQiHviG7uruDVQ3DnXDsAzbLT2lb', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY015Q08yV3JLYWlYRjhodXJZYlB2eGJZektGV1JERGxIaDZPTVVERSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RlX21hbnphbmlsbGEuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803333),
('VQFsLvhGDOJ453xISEjdWTAkzslh6Qaq4oiIzl0m', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkJiQzhEUmNRb3oxU2JRbENmdHZNS2R4N1c2S2hSdExFYTlEbHZydSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Fycm96X21leGljYW5hLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803435),
('VSfyT3fUTFzXjizOSMxDvfhpbja5dW8mmAXrjfdo', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUhjZTNTRTRHaVVyYjBKZVlFbUtFUlZscTlibTVTWnIzMHVib2ZpSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Jyb2NoZXRhc19wb2xsby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803436),
('VvAfKI0Dag3V1jWNNiA244ArKb43UME7Vovz7U9B', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnFiWlhES05zSkw0M1NwQUk3OFpSWXlyenZrVlRZUEx6VEVIaHExTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NhZmVfbGF0dGUuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802399),
('Vvh6RS4BhiTct8ZZtMkdlPBBFRVbkfqHwqcPAz2l', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieWJHQXFYUllzVUVaRllpb09PbG50T1ZNYTQ5V25VZlM3YVc5VnJrSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RhbWFsX3BvbGxvLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803480),
('Vxk4OUJoZOTDDH6rDYxfmlOk8G4dqO0LowIkcL6t', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYTBEd3RraXJ3M29yMDNKS3FXNFJYYzhud2tVUU52VTZEZ2V2VzgxVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2VuY2hpbGFkYXNfdmVyZGVzLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803436),
('vZvc6vU2NQGiDv4fZOLw22ZEvKYV3iWjto1XmOgP', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2p0RDN6WE5DeTBKTUhpckZhNjFnajdYZThjUmZuaXFKSldlME9DVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NodXJyb3MuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802441),
('w0kFAcK5JXbMHHTjyedyXRIH9Umqs3R8vEf0nCAz', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiME5UZ1NIUGRCWTNRYXIxQnRqZ29SaXRKN21STXgxR1dGTkR1VWFoeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NodXJyb3MuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803333),
('w58Luwu9A7ORXgerU1C8WIUrJ7P5sbbP1A15lafp', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVm5xYTBFa1BET0hBTlhrZWQ3elE3UVdFS0JXZ1NZZHZ1UUliSkMzRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RhY29fYWxfcGFzdG9yLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803480),
('W5QpHjZNcbXdMQAYHAN995X2LawIeduDPDK3jsTe', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHQwcGhKNDZRem44ZGR1NWxGVDh5Y0c0bHZyUThtakE3dVYyVmZTUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2N1cGNha2VfZnJlc2EuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802399),
('wANDL5T6ONbvgLoP1RZZ3X1bh4RPHhJVzrwawOs7', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRklmeEhMTzUzREtSM2tTODlCSEFoTFgxZ0hPV3RLaVltRnZQdTEyMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NhZmVfbGF0dGUuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803481),
('wBVmDLaRzLNlWZ6wmEzmQaW8IrUmdoRvE8fglfXy', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZG1pcGhGZjZ5aXpCejkzM3NJZTZ0ZjliY3hSUm5INXlEMVFxbkJNYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3F1ZXNhZGlsbGFfcXVlc28uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803480),
('wCIaGz9Zj4wgM9eqrIv0TUkrgIV5Br4puJ9ULcCC', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUpQM2ZycjE5S3dsT2phOTNHMHM0alY4eU42WWNCSzlnSGFES0Y3aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Vuc2FsYWRhX2Nlc2FyLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802441),
('WEUkP2h2sNRhZnZYthMx1jWtT2owhTONBPBIe6ep', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUs1WjdSTERVRE1uUW5TTks0YndRYzQyeVcyM004Q3JJN0hUQ3AxMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NlcnZlemFfb3NjdXJhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802399),
('wjuYLxoDQ9TdmDKJpSMCLq562okX4gKjvOFEk7eF', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODVUZFBmRUIzOVhQdjJzWWhhV2dJUnhJTmVGcVhCM2JrTUhHWnpWMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Jyb2NoZXRhc19wb2xsby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803333),
('wN3I2AX8uTzw75A1JNDm9bCg8h2MnvTJ6DxzlWrA', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSndDMWxHNEtDMGlRWVFTckQ1dmhrR1ZWMXJtZ0ZKTmt1NzdyTXBLYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RhY29fYWxfcGFzdG9yLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802441),
('wYWQvF8Bquejhg7T7i8uYXlZvYJT4znixdlikDPX', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVNhOW10U3ppOHRIUENSYkw1MExzcWdxcjI5RUlwN2FHektTSDExQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RvcnRhX21pbGFuZXNhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802399),
('x5wGgBJ0bxV1FIqF8aZuGDUWjfJKvtbDgEYTi8V5', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT05hblpMajVnOFc4bTFybEFUUUh5Rjlwc3JvcDRpdnMyS1VmNG5HeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Bvem9sZV9yb2pvLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803436),
('X7LnknPW4f8eVrXJ7ip4uxooMvipjZbqvrD9cvgc', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3hEc3h1RVNYV2k2R3Z5Ymtpdzh0TVRFbUdFM2dzZ05raWFNTWZOdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2FndWFfZ2FzLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803480),
('xBhOgDbbhlrWe0lEvZxCzfRoxUCG43AkXF6J6SGl', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGtGbVpwVk45TGM1MlE3amRJN29WaU96QWFoeVA4RmRhR1k1ckR5MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Vuc2FsYWRhX2Nlc2FyLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803435),
('xGKQvECwYMjtbb4EeF1LFsm3xEjPmpK9XZlFl0Si', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiamttUzI3ckpveWdKQm81dlpWQTRodXAwT3o3NXB1dVJaT2Y5Mmd3eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RhbWFsX2R1bGNlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803436),
('xLETwaB66JGhpae4oe2araMJj8yymwrLBqmkij80', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2hkM0pXd2JveDlWS0VERU5FbGdOcFFpUHFyUXJMZERVNkFzTWpwUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2xpY3VhZG9fcGxhdGFuby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803481),
('XpYIs6uIVzyLhbcvDw2uVmf03KBWagZN2KdeMVIl', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEwwcUhFYkdLMFBnZWNNcGdaSGVybmMyMHZzcE1sdGlCRTNBMVliQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RhY29fYWxfcGFzdG9yLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803435),
('xQqKNvJJaxqXxM0nVvoOnKJsVmK2WZQ3li8iUueZ', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWVXYXltbk9pVDVSOXlIcUVuV1ZYQzFBclB1U1NVZUJrbmpNZzVLQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2FndWFfaG9yY2hhdGEuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803436),
('Xs2qNNi8hguwSHrGHfPqsocbDmPAlOwfNSIIIgxO', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGlsazFFQnBuWUhhenFUZFVnaU9GaGg3ajNwVUVkUlROREtZOFQ1biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NlcnZlemFfbGFnZXIuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802441),
('XT8XBVEfhZsNrHP3htkJJcLXT5Sj4IMfFkMjXgsg', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXQ2UjRWTjNPbGRydG1CTmt5cWhwQW1VOGFZSnRzOThJeUlHNTNpdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RlX3ZlcmRlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803333),
('xxZWxqhdPj74N2I2E56A6D50TJSFRrHs5xSrJxyY', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVc5WHNvMEhUY2U0cE9IODJkVVh5NnBNaHZWTGtOSU1vTnF0Mk56RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RlX21hbnphbmlsbGEuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803436),
('Y23VBDOum0VIGOYlBzfWbAbfewWp109IhSDTNjrY', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUUyajVLZFR5ZjNzSEpnc2JwdnZNdWdieEloVkZ4ZUZWNWZNb0lGMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2J1cnJpdG9fcmVzLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803436),
('YEHORJOwm6sMbxdtdLZmDOTr0Djwh5r8vnE6Hcg1', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXZsNm5UaEI0VE5IUnQ0eXE4bmxBYzlTdVhrTXQzM09QSHdYaHM1ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2hhbWJ1cmd1ZXNhX2RvYmxlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803480),
('YHd8kR2RzVVpT1cGEWAkry41A9e5BN1hqJBTjRBB', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEJpaFRlZ2NmYjNYcUY0dmJQYktqZER6bldMY1RyM0VaemVjbXRCViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2VtcGFuYWRhc19xdWVzby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802441),
('yIedoPHJqS6bqLeACmyPqiMIGEzOz0hE9M4RKb0Y', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHdjQXViS3pNZW9Dc0tYTEMyNk91UGxGdEN3NFBodXBlV2dudHNvWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2p1Z29fbmFyYW5qYS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803480),
('yjzWWJiF3v60qzmbNLyhV0KCuTlVdEg26f35Q2RG', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGpENHp6a2cwdTlzYjlwNVJyT2tpdVZPZXdTckNKVTlzamF2SzJGSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NhZmVfbGF0dGUuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803333),
('YmLKHRuFjscczwOYAe5j93VxyPw0y8lf2TfC2PQh', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMENaTWthbWc2NGJIcEUwQVlrMjNPMzZLN1RkQkxYa3hoMTJMNEtzRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2J1cnJpdG9fcmVzLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803333),
('Yo2dh3XOVIWUnusa3Q0gxUxAOhsbUkOaPDoCxDEA', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUJWWXJ4SUxCUWkzc25WOTJieENwR3BIWUttNGFsdW1OR3RmZU1xcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3RhbWFsX2R1bGNlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802399),
('YOlSOrkQnQQCvrFvN91TyhvtzqmqrjdZwLuN2JPY', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVc3em5XeE0zMzlOU0ZaNlJJVXhadzZZc3NlNkFHMm03eFY2V1l2OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2JhdGlkb19tYW5nby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803333),
('YU7D1J1zxqH7TQHfTEdDE09aYVEPWXv3XeTn1HlQ', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnBZcWVtWTFBVDJobkNGQ0luMGhab0VpN29SYlpuZHIyamtyUTdiUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Vuc2FsYWRhX2Nlc2FyLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803333),
('yWjSulqRYsMRqs0O34QMr0U77xjvYzkWoprX0GXg', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3JFdjNHMXE0R3NDZHFnVHI0MjhzcHVXNnFqMlNwOGx0SGJBdEVXaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Rpc2FuYV9mcmlhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802399),
('YXXxePxlAVrEgDW59mio5rquI8DMWPY0ziuOXNub', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNG1VUGR3OTc3YU1tdHNzMmlsaU9qWklmM3hiUENDYzNXWThxeHF0cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Bhc3RhX2FsZnJlZG8uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803333),
('z0wLuUy6bOxzedfFfSRENdnrTszyL8MFHwiu7znv', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVphTDgxWUNaWTBja0d3cHlyUlg5Qm5zYWdMY0dEd29OSGZhc0g3OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Bhc3RhX2FsZnJlZG8uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802399),
('Z882pxW0QVVnOVWmyUvpruLztOyxfadzPXDZIe3C', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidnVFb0FvUTE3VWJESkZETTExVWRNMzZKdW52b2dLNDh0d1RQbnVIbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2xpY3VhZG9fcGxhdGFuby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802399),
('z8Bi6kq8HhXYe0W3o3GUIZ0FWT4A7yduBvDcIKLg', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHVaT1FLbGRid1k0YzdGdkhiVkR5UEVVcWo0TElkZ2FoN2d0cXFvOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2NlcnZlemFfb3NjdXJhLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803436),
('ze37W1iFD0MowtNFoWBfiwFr443li49ZFk9zhBd2', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0ZuTGdDYTE3eHZzVmdZRjJEVkx4Y1RRMW5RZGZTM3FHZmQxbEN2QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL21vbGVfcG9ibGFuby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802441),
('zfJzJSqAQhdu61nHDD7yIoYO22PUfWnmi3hSDr3I', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoickxleEZpUzZ4ZWlsNU5OWVE2OWFiTURWRjEwc2pERmxIQmZ2SUxzVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3Bhc3RlbF9jaG9jb2xhdGUuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803436),
('ZG9aTkHIdMt0zoSQipphgB8wyOm2DPoeqZWlH6iN', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia29RbWpUczJUN0VQc2Z3YTE5bFlubmQxd29VSm16Qnp0dWpVQ0hqaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2FndWFfZ2FzLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753803436),
('ZgSgoESMJbwTvcaEyJw4jpFrjNo98GVd1NTIXMBt', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicEJQZFFpcHlzMFYwNE5jSEVoWG52dHNHR2Q1NEFPdUFGVFB6dWZScCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3BhcGFzX2dham8uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753803333),
('zi5jT9Q4ldcvKTbZbBBTQv9AYvSQPp3iopuw28sj', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFpVa0xHMzdsdUdGbHZaZ0JBMUlVdmtZV0taYWpkUllWd1VCMHNVQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL3JlZnJlc2NvX2NvbGEuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753802441),
('ZiDTAN0CGQnUZEF0tNc3DA5ENDVD8bR98Lwnoqhl', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYkZCS2gyalpmajgzQ3l0MHBTY3ZrWGdlY3NWeTliaUlCZmN3Ukp4USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Jyb2NoZXRhc19wb2xsby5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753802399),
('zp4Q0ezFSHTVpi1QUjhwTN0P3YO7jr8Ozxbc6cnE', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmtVaUM0cWtHa0ZHWWxhS05jYUQ1Q2cyUFl6M2dCM2huT2FkQnNtMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Nob2NvbGF0ZV9jYWxpZW50ZS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753803333),
('ztzkUIHosi0smmqWZs1yx72hTvGOSDTLo343KvsN', NULL, '10.168.97.104', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1d0a0FyUEI5TGxtV1JVWjlJb29qbkg2N0doT3FBRnV4d3I3RXp1byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMC4xNjguOTcuMTA0OjgwMDAvL3N0b3JhZ2UvcHJvZHVjdG9zL2Vuc2FsYWRhX2Nlc2FyLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753802399);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'comensal',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Administrador', 'admin@ejemplo.com', NULL, '$2y$12$cT6Y5OlxO3YkvABJLXtPfui2im8ZWYSjz08Bw20rOsko/RMq5L6yO', 'admin', NULL, '2025-07-23 15:51:59', '2025-07-23 18:35:01'),
(3, 'Mesero', 'mesero@ejemplo.com', NULL, '$2y$12$SkYF4d6rOHePsnCA1fmMfeNLdJWp5CncFu0oUoX.IG/v5403aXOZG', 'mesero', NULL, '2025-07-23 15:51:59', '2025-07-29 16:16:31'),
(4, 'Abel', 'abel@ejemplo.com', NULL, '$2y$12$iVLqPuU9uluXtoX1CjN2KunTirqF8uW3k9o2Ox70ghSgg0Lgt783u', 'admin', NULL, '2025-07-26 01:17:07', '2025-07-26 01:17:07');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_pedidos_pedido_id_foreign` (`pedido_id`),
  ADD KEY `detalle_pedidos_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidos_user_id_foreign` (`user_id`),
  ADD KEY `pedidos_mesa_id_foreign` (`mesa_id`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_categoria_id_foreign` (`categoria_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_pedidos_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_mesa_id_foreign` FOREIGN KEY (`mesa_id`) REFERENCES `mesas` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pedidos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
