-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-05-2023 a las 03:31:17
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `back_proyecto_lv`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detalle` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `detalle`, `created_at`, `updated_at`) VALUES
(1, 'ROPA', 'ROPA PARA DAMAS', '2023-04-25 04:33:29', '2023-04-25 04:33:29'),
(2, 'MUEBLES EDITADO', 'Muebles modificado', '2023-04-25 04:34:42', '2023-04-25 04:52:14'),
(4, 'ELECTRONICOS', 'Equipos de comptación', '2023-04-25 04:36:20', '2023-04-25 04:52:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre_completo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci_nit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre_completo`, `ci_nit`, `telefono`, `correo`, `created_at`, `updated_at`) VALUES
(1, 'Juan Carlos', '11223344', '987654', 'juan.carlos@mail.com', '2023-05-03 04:57:19', '2023-05-03 04:57:19'),
(2, 'Pedro Salas', '998877', '23456', NULL, '2023-05-03 04:59:01', '2023-05-03 04:59:01'),
(3, 'Ana', '8765678', NULL, NULL, '2023-05-04 04:01:40', '2023-05-04 04:01:40'),
(4, 'Javier Cardozo', '23444355', '723232334', 'Javier@mail.com', '2023-05-04 01:30:02', '2023-05-04 01:30:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
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
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(14, '2023_04_20_004927_create_categorias_table', 2),
(15, '2023_04_20_004943_create_productos_table', 2),
(16, '2023_04_20_004949_create_clientes_table', 2),
(17, '2023_04_20_004953_create_pedidos_table', 3),
(18, '2023_04_20_004959_create_pedido_producto_table', 3),
(19, '2023_04_21_000034_create_permisos_table', 3),
(20, '2023_04_21_000039_create_roles_table', 3),
(21, '2023_04_21_000049_create_role_user_table', 3),
(22, '2023_04_21_000057_create_permiso_role_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `observaciones` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cliente_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `fecha`, `estado`, `observaciones`, `cliente_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '2023-05-03 23:55:28', 2, NULL, 1, 1, '2023-05-04 03:55:28', '2023-05-04 03:55:28'),
(2, '2023-05-04 00:01:54', 2, NULL, 3, 1, '2023-05-04 04:01:54', '2023-05-04 04:01:54'),
(3, '2023-05-03 20:17:10', 2, NULL, 2, 1, '2023-05-04 00:17:10', '2023-05-04 00:17:10'),
(4, '2023-05-03 20:22:29', 2, NULL, 2, 2, '2023-05-04 00:22:29', '2023-05-04 00:22:29'),
(5, '2023-05-03 21:30:07', 2, NULL, 4, 2, '2023-05-04 01:30:07', '2023-05-04 01:30:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_producto`
--

CREATE TABLE `pedido_producto` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `pedido_id` bigint(20) UNSIGNED NOT NULL,
  `producto_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedido_producto`
--

INSERT INTO `pedido_producto` (`id`, `cantidad`, `pedido_id`, `producto_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 7, '2023-05-04 03:55:28', '2023-05-04 03:55:28'),
(2, 1, 1, 5, '2023-05-04 03:55:28', '2023-05-04 03:55:28'),
(3, 1, 1, 3, '2023-05-04 03:55:28', '2023-05-04 03:55:28'),
(4, 1, 2, 3, '2023-05-04 04:01:54', '2023-05-04 04:01:54'),
(5, 1, 2, 1, '2023-05-04 04:01:54', '2023-05-04 04:01:54'),
(6, 1, 3, 7, '2023-05-04 00:17:10', '2023-05-04 00:17:10'),
(7, 1, 3, 6, '2023-05-04 00:17:10', '2023-05-04 00:17:10'),
(8, 1, 3, 2, '2023-05-04 00:17:10', '2023-05-04 00:17:10'),
(9, 1, 4, 6, '2023-05-04 00:22:29', '2023-05-04 00:22:29'),
(10, 1, 4, 3, '2023-05-04 00:22:29', '2023-05-04 00:22:29'),
(11, 1, 5, 7, '2023-05-04 01:30:07', '2023-05-04 01:30:07'),
(12, 1, 5, 6, '2023-05-04 01:30:07', '2023-05-04 01:30:07'),
(13, 1, 5, 5, '2023-05-04 01:30:07', '2023-05-04 01:30:07'),
(14, 1, 5, 3, '2023-05-04 01:30:07', '2023-05-04 01:30:07'),
(15, 1, 5, 2, '2023-05-04 01:30:07', '2023-05-04 01:30:07'),
(16, 1, 5, 1, '2023-05-04 01:30:07', '2023-05-04 01:30:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso_role`
--

CREATE TABLE `permiso_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permiso_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
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

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'Token Personal', '0f63c65cde0e10f33a37e5707358a3d835778fa4d8c842a061854560de097f48', '[\"*\"]', NULL, NULL, '2023-04-12 05:03:23', '2023-04-12 05:03:23'),
(2, 'App\\Models\\User', 2, 'Token Personal', 'dfb822195449c86c211b67091775097d46cf3189aa7088dbfa7c4eb97ea81b03', '[\"*\"]', NULL, NULL, '2023-04-12 05:06:45', '2023-04-12 05:06:45'),
(3, 'App\\Models\\User', 2, 'Token Personal', 'bc55ff8f2afc1660e1eb846f3413ac9d49479abda7a21e1a64f2f962f6338df5', '[\"*\"]', NULL, NULL, '2023-04-12 05:07:31', '2023-04-12 05:07:31'),
(4, 'App\\Models\\User', 2, 'Token Personal', 'c84dd2b19dc4d8e441147509af271d1203d98a9ed96e84a2455dcf8c202bd8b6', '[\"*\"]', '2023-04-12 05:08:36', NULL, '2023-04-12 05:07:51', '2023-04-12 05:08:36'),
(5, 'App\\Models\\User', 2, 'Token Personal', '9e46aa3efb4d0c3f389bf76681fc7e8135ee2d29d6eb9f4115f6e2730500603f', '[\"*\"]', NULL, NULL, '2023-04-12 05:13:16', '2023-04-12 05:13:16'),
(6, 'App\\Models\\User', 2, 'Token Personal', '7e9f4037d2544c59cbb3b0f0cc5aaa0979620825084c3b1cae99561c42e1498d', '[\"*\"]', NULL, NULL, '2023-04-13 04:49:05', '2023-04-13 04:49:05'),
(7, 'App\\Models\\User', 2, 'Token Personal', 'ad14832f7b1936aaf13296c42464e476bcdd5ff95569517e8b847c1bc47b5634', '[\"*\"]', NULL, NULL, '2023-04-13 04:49:42', '2023-04-13 04:49:42'),
(8, 'App\\Models\\User', 1, 'Token Personal', 'fdc8491ac1bbbf3ae147bd1883440d86b35ce36de2ebf1580311c06d386b6ce3', '[\"*\"]', NULL, NULL, '2023-04-13 04:50:03', '2023-04-13 04:50:03'),
(9, 'App\\Models\\User', 2, 'Token Personal', 'c0e1719df41345c279ae009dfe43dd8ee2295612385f0f0c79bec667fd5ca1a5', '[\"*\"]', NULL, NULL, '2023-04-13 04:50:49', '2023-04-13 04:50:49'),
(10, 'App\\Models\\User', 2, 'Token Personal', '04dd8f6c2c7b6dabd27298f887344b0c671cb6d673f81d733e99db30456f0b16', '[\"*\"]', NULL, NULL, '2023-04-13 05:10:34', '2023-04-13 05:10:34'),
(11, 'App\\Models\\User', 2, 'Token Personal', 'c9280e75a97e7c7c9a9c35995c6b4ed119fb2deb961d10802c9b855b40909f82', '[\"*\"]', NULL, NULL, '2023-04-14 03:52:02', '2023-04-14 03:52:02'),
(12, 'App\\Models\\User', 2, 'Token Personal', '234196ff1da8659302cc84881458013eb82757f70f680a224e85f5038957dfee', '[\"*\"]', NULL, NULL, '2023-04-14 03:53:00', '2023-04-14 03:53:00'),
(13, 'App\\Models\\User', 2, 'Token Personal', 'eecc17024547aa0eecffba7ca0348bbdd759d697c14bbb1add7cc90290ede73e', '[\"*\"]', NULL, NULL, '2023-04-14 04:20:13', '2023-04-14 04:20:13'),
(14, 'App\\Models\\User', 2, 'Token Personal', '57d5d8ea30159862fe1e630045fd9f1393a931775844828dd66790b460365370', '[\"*\"]', NULL, NULL, '2023-04-14 04:35:43', '2023-04-14 04:35:43'),
(15, 'App\\Models\\User', 2, 'Token Personal', '888cb95e0d7e5e93a855d65a7d49a1f7ae80a70a59d9ed1e13c17efceddb476f', '[\"*\"]', NULL, NULL, '2023-04-14 04:38:41', '2023-04-14 04:38:41'),
(16, 'App\\Models\\User', 2, 'Token Personal', '764ea3636bc9d98fb02e9dcc4c152b42addfe8c5e132a0f232a70a4d9d6fedd2', '[\"*\"]', NULL, NULL, '2023-04-14 04:41:33', '2023-04-14 04:41:33'),
(17, 'App\\Models\\User', 2, 'Token Personal', '244749572501130598161d73b8dcfb2b2153967ea931a9c0aade8a4fad9afa30', '[\"*\"]', NULL, NULL, '2023-04-14 04:41:57', '2023-04-14 04:41:57'),
(18, 'App\\Models\\User', 2, 'Token Personal', 'f8c42100da9bcd8acaec7264ed90b9ebac2507969e190b438891a139d87fe0fa', '[\"*\"]', '2023-04-14 04:46:17', NULL, '2023-04-14 04:43:32', '2023-04-14 04:46:17'),
(19, 'App\\Models\\User', 1, 'Token Personal', 'dd2fe7ab7ab801b32a5f1e97e687d7593f54ec87e4b024e43599ea1b4188895d', '[\"*\"]', '2023-04-14 04:47:53', NULL, '2023-04-14 04:47:14', '2023-04-14 04:47:53'),
(20, 'App\\Models\\User', 2, 'Token Personal', 'ce49f3d190f62f274eb3c91dc4e4b134890daf18fdabb8ff437999e2457a6cac', '[\"*\"]', '2023-04-14 05:00:47', NULL, '2023-04-14 04:57:10', '2023-04-14 05:00:47'),
(21, 'App\\Models\\User', 1, 'Token Personal', '34b06ef76f6f8d419417ff31206a152452492b24b567741ad979b5438f5502d1', '[\"*\"]', '2023-04-14 05:02:28', NULL, '2023-04-14 05:02:14', '2023-04-14 05:02:28'),
(22, 'App\\Models\\User', 2, 'Token Personal', 'd57180f3f1a744f3d41e1b08297296a9d93e312d3615a6e84c6f4eca8e6862c9', '[\"*\"]', '2023-04-14 05:05:42', NULL, '2023-04-14 05:04:44', '2023-04-14 05:05:42'),
(23, 'App\\Models\\User', 1, 'Token Personal', 'ba573ee11daba02d1f177806cf9fbad29b51cd8f27a02003cc92417e5dbb9773', '[\"*\"]', '2023-04-18 04:27:37', NULL, '2023-04-18 04:27:34', '2023-04-18 04:27:37'),
(24, 'App\\Models\\User', 1, 'Token Personal', '53905676ece7b3005dfea4a6ee589b4a7b35f7c0a874410a6fcb677c43663975', '[\"*\"]', '2023-04-18 04:56:14', NULL, '2023-04-18 04:56:07', '2023-04-18 04:56:14'),
(25, 'App\\Models\\User', 1, 'Token Personal', '5410d023df89360fb09ddee0b7bf611eff2e0abc9d1ec256729b94ef83efc107', '[\"*\"]', '2023-04-18 05:06:17', NULL, '2023-04-18 05:02:12', '2023-04-18 05:06:17'),
(26, 'App\\Models\\User', 2, 'Token Personal', 'ac2cfe11c17886c3f6be35dcc5a0ed48240d971bf27a128d98530bb25a124149', '[\"*\"]', '2023-04-19 04:45:47', NULL, '2023-04-19 03:46:04', '2023-04-19 04:45:47'),
(27, 'App\\Models\\User', 2, 'Token Personal', 'a2e2f4bd220e6fd5e5d5ce407e5c52059c904becb7c76c5cbbe9ae12a6360d27', '[\"*\"]', '2023-04-19 05:08:35', NULL, '2023-04-19 04:47:40', '2023-04-19 05:08:35'),
(28, 'App\\Models\\User', 2, 'Token Personal', '909b61d240ced5d4e97862e9bae80e9ffdf001b5aca798b88dcc10a5985ab3d2', '[\"*\"]', '2023-04-25 03:40:08', NULL, '2023-04-25 03:40:03', '2023-04-25 03:40:08'),
(29, 'App\\Models\\User', 2, 'Token Personal', 'f9b8fd823ccbcb9e8d7764941dc168897478d4e90e70372583cda11cf35db200', '[\"*\"]', '2023-04-25 04:37:16', NULL, '2023-04-25 03:40:06', '2023-04-25 04:37:16'),
(30, 'App\\Models\\User', 2, 'Token Personal', '6ad9802e85bd94f181e6e01eab9b0182ba2807a48a9db8c9d011abbfcd99f910', '[\"*\"]', '2023-04-25 04:55:12', NULL, '2023-04-25 04:41:18', '2023-04-25 04:55:12'),
(31, 'App\\Models\\User', 2, 'Token Personal', '4bc2a510bbcd8ba7e21355d5b86e98cf2da75d029afc384e9b381953b9d434e7', '[\"*\"]', '2023-04-26 05:03:05', NULL, '2023-04-26 04:18:54', '2023-04-26 05:03:05'),
(32, 'App\\Models\\User', 2, 'Token Personal', 'e8d2917989abf9f5d630897a6b4a850fee0a9017012c05d5ce0b73238130022a', '[\"*\"]', '2023-04-27 04:50:03', NULL, '2023-04-27 03:57:37', '2023-04-27 04:50:03'),
(33, 'App\\Models\\User', 2, 'Token Personal', '446d3703a507be58c8b967ddfc8167210ac9195f64724a41e97372516c84e5bf', '[\"*\"]', '2023-04-27 05:21:58', NULL, '2023-04-27 05:10:57', '2023-04-27 05:21:58'),
(34, 'App\\Models\\User', 2, 'Token Personal', 'a5aba71d9b1c7763158142c8ca8b86298ca4943ebaef016fe60fd3279f5153c3', '[\"*\"]', '2023-04-28 04:46:25', NULL, '2023-04-28 03:47:03', '2023-04-28 04:46:25'),
(35, 'App\\Models\\User', 2, 'Token Personal', 'eff4be87eb9c84942b3fd4dcc1d51c3205b562b0467101e93f3b5e5161f33c34', '[\"*\"]', '2023-04-28 04:56:22', NULL, '2023-04-28 04:48:59', '2023-04-28 04:56:22'),
(36, 'App\\Models\\User', 1, 'Token Personal', '2805c6cec4daf5ba9b3f75fb6d5b1b3d949e08bd665e6bbf8babc908f4449b0f', '[\"*\"]', '2023-04-28 04:57:06', NULL, '2023-04-28 04:57:04', '2023-04-28 04:57:06'),
(37, 'App\\Models\\User', 1, 'Token Personal', 'e907c35c1ab65fdbec7c1da6e061755fa3879557c94b42dd18488ee53c4a1d2a', '[\"*\"]', '2023-04-28 05:13:44', NULL, '2023-04-28 05:00:47', '2023-04-28 05:13:44'),
(38, 'App\\Models\\User', 2, 'Token Personal', '5b5e6dc8c3060521df8140ad7b0c644964983c521af3884135eea04517bca2bf', '[\"*\"]', '2023-04-28 05:26:50', NULL, '2023-04-28 05:14:55', '2023-04-28 05:26:50'),
(39, 'App\\Models\\User', 1, 'Token Personal', '4eb3c27b60e569ca29b4ddcb6af31e50780bd3fee7114e39ed3aed0d16480300', '[\"*\"]', '2023-05-03 04:30:30', NULL, '2023-05-03 03:41:26', '2023-05-03 04:30:30'),
(40, 'App\\Models\\User', 2, 'Token Personal', '2f2a3c5c3d97a1d3b86f468c02a9fdca208a5f67fc2af9ec3602a9060ebe9e1e', '[\"*\"]', '2023-05-03 05:05:53', NULL, '2023-05-03 04:54:51', '2023-05-03 05:05:53'),
(41, 'App\\Models\\User', 1, 'Token Personal', '79b33f1508b1f8c3e4673b8d409b759bd9fba0454f57c8f70b404bb530facbf9', '[\"*\"]', '2023-05-04 00:17:38', NULL, '2023-05-04 03:49:59', '2023-05-04 00:17:38'),
(42, 'App\\Models\\User', 2, 'Token Personal', 'dd8c8a72fbb8e031532cefe02ea7885943f3f4056bcc93f7f28fd8ae53fede25', '[\"*\"]', '2023-05-04 01:21:17', NULL, '2023-05-04 00:21:56', '2023-05-04 01:21:17'),
(43, 'App\\Models\\User', 2, 'Token Personal', 'debdba08c899f5a8f11ceb5d1a877062e771b638ef71e5d140b64ba2fa242246', '[\"*\"]', '2023-05-04 01:31:45', NULL, '2023-05-04 01:23:31', '2023-05-04 01:31:45'),
(44, 'App\\Models\\User', 2, 'Token Personal', '47dc056087f0c1a5fde96ae0539b945c0232de46a09591a03f1c89d90738f091', '[\"*\"]', '2023-05-05 00:34:22', NULL, '2023-05-04 23:43:34', '2023-05-05 00:34:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 0,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoria_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `precio`, `cantidad`, `imagen`, `descripcion`, `categoria_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'TECLADO', '250.00', 56, 'imagen/1682558263-diagrama de componentes.png', 'detalle de teclado', 4, NULL, '2023-04-26 04:49:57', '2023-04-28 04:14:44'),
(2, 'LAPTOP HP', '7800.98', 5, 'imagen/1682558245-analisis mvc.png', 'Laptop de prueba Marca HP', 4, NULL, '2023-04-26 05:02:30', '2023-04-28 04:14:57'),
(3, 'PARLANTE', '134.98', 20, 'imagen/1682639283-captura cursos.png', 'parlantes para PC', 4, NULL, '2023-04-27 04:14:03', '2023-04-28 03:48:03'),
(5, 'ZAPATOS', '250.00', 6, 'imagen/1682558469-prueba_imagen_mesa.jpg', 'Zapatos de cuero', 1, NULL, '2023-04-27 04:15:13', '2023-04-27 05:21:09'),
(6, 'SILLA DE METAL', '399.98', 15, 'imagen/1682645050-analisis mvc.png', 'Silla para oficinas de metal', 2, NULL, '2023-04-27 04:15:44', '2023-04-28 05:24:10'),
(7, 'Mesa de Madera', '500.00', 2, 'imagen/1682558068-html_css_js.png', NULL, 2, NULL, '2023-04-27 04:16:20', '2023-04-27 05:14:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'cristian', 'cristian@mail.com', NULL, '$2y$10$.owZ9W3PRTSnGvJqhP9CrOu9bL8LRk5kOE5PioYXzlWo/o20DDYxC', NULL, '2023-04-12 04:48:40', '2023-04-12 04:48:40'),
(2, 'admin', 'admin@mail.com', NULL, '$2y$10$vC/xTH/nyRM7DU8w2uyssuNLHegBbFrvT11lt/Hwi094mDCmJnJ.m', NULL, '2023-04-12 04:52:25', '2023-04-12 04:52:25'),
(3, 'Pedro', 'pedro@mail.com', NULL, '$2y$10$TYm6DPatB97IfzptWvRZFe7wdoOjJUaVIXkceFAVS2MVJAkSTuCAu', NULL, '2023-04-18 05:04:53', '2023-04-18 05:04:53'),
(4, 'Juan', 'juan@mail.com', NULL, '$2y$10$t9HFEUz4/lNeZTo4VVZF0u.oi5htw0UBxRiXLokO0n/df/2ighfXm', NULL, '2023-04-18 05:06:15', '2023-04-18 05:06:15'),
(5, 'Maria', 'maria@mail.com', NULL, '$2y$10$iVAzmgfLl108nu2IYMNace/IKsj4qR2ypyniGkkuObnfLMf1f05v2', NULL, '2023-04-19 04:57:13', '2023-04-19 04:57:13');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorias_nombre_unique` (`nombre`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `pedidos_cliente_id_foreign` (`cliente_id`),
  ADD KEY `pedidos_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_producto_pedido_id_foreign` (`pedido_id`),
  ADD KEY `pedido_producto_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permiso_role`
--
ALTER TABLE `permiso_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permiso_role_permiso_id_foreign` (`permiso_id`),
  ADD KEY `permiso_role_role_id_foreign` (`role_id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permiso_role`
--
ALTER TABLE `permiso_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `pedidos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  ADD CONSTRAINT `pedido_producto_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `pedido_producto_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `permiso_role`
--
ALTER TABLE `permiso_role`
  ADD CONSTRAINT `permiso_role_permiso_id_foreign` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`),
  ADD CONSTRAINT `permiso_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
