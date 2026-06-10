-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2026 at 06:44 PM
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
-- Database: `db_umkm_kpad`
--

-- --------------------------------------------------------

--
-- Table structure for table `asal_daerah`
--

CREATE TABLE `asal_daerah` (
  `id_asal` int(11) NOT NULL,
  `nama_daerah` varchar(100) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `asal_daerah`
--

INSERT INTO `asal_daerah` (`id_asal`, `nama_daerah`, `keterangan`) VALUES
(1, 'Bandung', 'Jajanan khas Sunda'),
(2, 'Jepang', 'Makanan / Minuman khas Jepang'),
(3, 'Umum', 'Makanan / Minuman umum Indonesia'),
(4, 'China', 'Makanan / Minuman khas China'),
(5, 'Amerika', 'Makanan / Minuman khas Amerika'),
(6, 'Italia', 'Makanan / Minuman khas Italia'),
(7, 'France', 'Makanan / Minuman khas Prancis');

-- --------------------------------------------------------

--
-- Table structure for table `bahan_baku`
--

CREATE TABLE `bahan_baku` (
  `id_bahan` int(11) NOT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `bahan` varchar(100) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bahan_baku`
--

INSERT INTO `bahan_baku` (`id_bahan`, `id_menu`, `bahan`, `keterangan`) VALUES
(1, 1, 'Mie Kuning / Bihun', 'Bahan Utama'),
(2, 1, 'Ayam Cincang', 'Topping'),
(3, 1, 'Kecap & Bumbu Yamin', 'Bumbu Utama'),
(4, 2, 'Mie Kuning / Bihun', 'Bahan Utama'),
(5, 2, 'Baso Sapi', 'Topping Utama'),
(6, 2, 'Kuah Kaldu', 'Pelengkap'),
(7, 3, 'Mie Kuning / Bihun', 'Bahan Utama'),
(8, 3, 'Sambal Bajak', 'Bumbu Spesial'),
(9, 4, 'Mie Kuning / Bihun', 'Bahan Utama'),
(10, 4, 'Daging Sapi Mercon', 'Topping Utama'),
(11, 5, 'Mie Kuning / Bihun', 'Bahan Utama'),
(12, 5, 'Chili Oil', 'Bumbu Spesial'),
(13, 6, 'Kulit Pangsit', 'Bahan Utama'),
(14, 6, 'Isian Ayam Pangsit', 'Bahan Utama'),
(15, 6, 'Baso Sapi', 'Pelengkap'),
(16, 7, 'Bakso Ikan / Sapi', 'Bahan Utama'),
(17, 7, 'Minyak Goreng', 'Bahan Proses'),
(18, 7, 'Bumbu Bubuk Gurih', 'Topping'),
(19, 8, 'Singkong / Kentang', 'Bahan Utama'),
(20, 8, 'Garam / Bumbu Tabur', 'Bumbu'),
(21, 9, 'Kulit Dimsum', 'Bahan Utama'),
(22, 9, 'Daging Ayam / Udang Olahan', 'Isian Utama'),
(23, 10, 'Nasi Putih', 'Bahan Utama'),
(24, 10, 'Daging Ayam', 'Lauk Utama'),
(25, 10, 'Cabai (Bumbu Pedas)', 'Bumbu'),
(26, 10, 'Timun', 'Garnish/Pelengkap'),
(27, 11, 'Aneka Buah Segar', 'Bahan Utama'),
(28, 11, 'Sambal Kacang & Gula Merah', 'Bumbu Utama'),
(29, 12, 'Teh', 'Bahan Utama'),
(30, 12, 'Ekstrak Lemon', 'Perasa Utama'),
(31, 13, 'Pangsit Daging', 'Bahan Utama'),
(32, 13, 'Chili Oil', 'Bumbu Utama'),
(33, 14, 'Pangsit Daging', 'Bahan Utama'),
(34, 14, 'Kuah Kaldu', 'Pelengkap'),
(35, 15, 'Tepung Aci (Tapioka)', 'Bahan Utama'),
(36, 15, 'Bawang Putih', 'Bumbu Utama'),
(37, 16, 'Tepung Aci (Tapioka)', 'Bahan Utama'),
(38, 16, 'Cabai Rawit', 'Isian Utama'),
(39, 17, 'Mie Kuning', 'Bahan Utama'),
(40, 17, 'Bumbu Pedas Manis (Jebew)', 'Bumbu Utama'),
(41, 18, 'Mie Kuning', 'Bahan Utama'),
(42, 18, 'Baso Sapi', 'Topping Utama'),
(43, 19, 'Mie Kuning', 'Bahan Utama'),
(44, 19, 'Sosis', 'Topping Utama'),
(45, 20, 'Mie Kuning', 'Bahan Utama'),
(46, 20, 'Pangsit Daging', 'Topping Utama'),
(47, 21, 'Tahu & Adonan Ikan', 'Bahan Utama'),
(48, 21, 'Saus Kacang Gurih', 'Bumbu Utama'),
(49, 22, 'Biji Kopi (Espresso)', 'Bahan Utama'),
(50, 22, 'Irisan Lemon Segar', 'Pelengkap/Perasa'),
(51, 23, 'Biji Kopi Tradisional', 'Bahan Utama'),
(52, 23, 'Gula Pasir', 'Pemanis'),
(53, 24, 'Biji Kopi Pekat', 'Bahan Utama'),
(54, 24, 'Gula Pasir', 'Pemanis Utama'),
(55, 25, 'Biji Kopi (Espresso)', 'Bahan Utama'),
(56, 25, 'Buah Jeruk Alami', 'Perasa Utama'),
(57, 26, 'Biji Kopi', 'Bahan Utama'),
(58, 26, 'Air', 'Bahan Utama'),
(59, 27, 'Biji Kopi', 'Bahan Utama'),
(60, 27, 'Susu', 'Bahan Utama'),
(61, 27, 'Gula Pasir', 'Pemanis'),
(62, 28, 'Susu Segar', 'Bahan Utama'),
(63, 28, 'Gula Aren', 'Pemanis Utama'),
(64, 29, 'Biji Kopi (Espresso)', 'Bahan Utama'),
(65, 29, 'Susu Segar', 'Bahan Utama'),
(66, 29, 'Gula Aren Premium', 'Pemanis Utama'),
(67, 30, 'Biji Kopi (Espresso)', 'Bahan Utama'),
(68, 30, 'Susu Hangat', 'Bahan Utama'),
(69, 31, 'Biji Kopi (Espresso)', 'Bahan Utama'),
(70, 31, 'Susu', 'Bahan Utama'),
(71, 31, 'Sirup Karamel', 'Perasa Utama'),
(72, 32, 'Biji Kopi (Espresso)', 'Bahan Utama'),
(73, 32, 'Susu', 'Bahan Utama'),
(74, 32, 'Sirup Butterscotch', 'Perasa Utama'),
(75, 33, 'Biji Kopi (Espresso)', 'Bahan Utama'),
(76, 33, 'Susu', 'Bahan Utama'),
(77, 33, 'Sirup Hazelnut', 'Perasa Utama'),
(78, 34, 'Biji Kopi (Espresso)', 'Bahan Utama'),
(79, 34, 'Susu', 'Bahan Utama'),
(80, 34, 'Saus Karamel', 'Topping Utama'),
(81, 35, 'Biji Kopi (Espresso)', 'Bahan Utama'),
(82, 35, 'Susu', 'Bahan Utama'),
(83, 35, 'Mentega & Garam Laut', 'Bahan Spesial'),
(84, 36, 'Bubuk Matcha Jepang', 'Bahan Utama'),
(85, 36, 'Air', 'Bahan Utama'),
(86, 37, 'Bubuk Matcha Jepang', 'Bahan Utama'),
(87, 37, 'Susu Segar', 'Bahan Utama'),
(88, 38, 'Kerupuk', 'Bahan Utama'),
(89, 38, 'Kencur & Cabai', 'Bumbu Utama'),
(90, 39, 'Kerupuk', 'Bahan Utama'),
(91, 39, 'Telur', 'Isian Utama'),
(92, 39, 'Kuah Kaldu Pedas', 'Bahan Utama'),
(93, 40, 'Kerupuk', 'Bahan Utama'),
(94, 40, 'Cuankie Lidah & Siomay', 'Topping Utama'),
(95, 41, 'Kerupuk', 'Bahan Utama'),
(96, 41, 'Tteokbokki & Odeng', 'Isian Utama'),
(97, 41, 'Saus Gochujang', 'Bumbu Utama'),
(98, 42, 'Ceker Ayam', 'Bahan Utama'),
(99, 42, 'Bumbu Mercon', 'Bumbu Utama'),
(100, 43, 'Adonan Crepes', 'Bahan Utama'),
(101, 43, 'Susu Manis', 'Topping'),
(102, 44, 'Adonan Crepes', 'Bahan Utama'),
(103, 44, 'Coklat', 'Isian'),
(104, 45, 'Adonan Crepes', 'Bahan Utama'),
(105, 45, 'Oreo', 'Topping'),
(106, 46, 'Adonan Crepes', 'Bahan Utama'),
(107, 46, 'Selai Blueberry', 'Isian'),
(108, 47, 'Adonan Crepes', 'Bahan Utama'),
(109, 47, 'Vanilla', 'Perasa'),
(110, 48, 'Adonan Crepes', 'Bahan Utama'),
(111, 48, 'Tiramisu', 'Perasa'),
(112, 49, 'Adonan Crepes', 'Bahan Utama'),
(113, 49, 'Taro', 'Perasa'),
(114, 50, 'Adonan Crepes', 'Bahan Utama'),
(115, 50, 'Oreo', 'Topping'),
(116, 50, 'Keju', 'Topping'),
(117, 51, 'Adonan Crepes', 'Bahan Utama'),
(118, 51, 'Coklat', 'Isian'),
(119, 51, 'Keju', 'Topping'),
(120, 52, 'Adonan Crepes', 'Bahan Utama'),
(121, 52, 'Selai Blueberry', 'Isian'),
(122, 52, 'Keju', 'Topping'),
(123, 53, 'Adonan Crepes', 'Bahan Utama'),
(124, 53, 'Selai Strawberry', 'Isian'),
(125, 53, 'Keju', 'Topping'),
(126, 54, 'Adonan Crepes', 'Bahan Utama'),
(127, 54, 'Selai Lemon', 'Isian'),
(128, 54, 'Keju', 'Topping'),
(129, 55, 'Adonan Crepes', 'Bahan Utama'),
(130, 55, 'Chococip', 'Topping'),
(131, 55, 'Oreo', 'Topping'),
(132, 56, 'Adonan Crepes', 'Bahan Utama'),
(133, 56, 'Marshmallow', 'Topping'),
(134, 56, 'Oreo', 'Topping'),
(135, 57, 'Adonan Crepes', 'Bahan Utama'),
(136, 57, 'Coklat', 'Isian'),
(137, 57, 'Pisang', 'Isian'),
(138, 58, 'Adonan Crepes', 'Bahan Utama'),
(139, 58, 'Oreo', 'Topping'),
(140, 58, 'Greentea', 'Perasa'),
(141, 59, 'Adonan Crepes', 'Bahan Utama'),
(142, 59, 'Coklat', 'Isian'),
(143, 59, 'Selai Strawberry', 'Isian'),
(144, 60, 'Adonan Crepes', 'Bahan Utama'),
(145, 60, 'Pisang', 'Isian'),
(146, 60, 'Oreo', 'Topping'),
(147, 61, 'Adonan Crepes', 'Bahan Utama'),
(148, 61, 'Coklat', 'Isian'),
(149, 61, 'Selai Lemon', 'Isian'),
(150, 62, 'Adonan Crepes', 'Bahan Utama'),
(151, 62, 'Coklat', 'Isian'),
(152, 62, 'Vanilla', 'Perasa'),
(153, 63, 'Adonan Crepes', 'Bahan Utama'),
(154, 63, 'Keju', 'Isian Utama'),
(155, 64, 'Adonan Crepes', 'Bahan Utama'),
(156, 64, 'Oreo', 'Topping'),
(157, 64, 'Vanilla', 'Perasa'),
(158, 65, 'Adonan Crepes', 'Bahan Utama'),
(159, 65, 'Oreo', 'Topping'),
(160, 65, 'Tiramisu', 'Perasa'),
(161, 66, 'Adonan Crepes', 'Bahan Utama'),
(162, 66, 'Marshmallow', 'Topping'),
(163, 67, 'Adonan Crepes', 'Bahan Utama'),
(164, 67, 'Chococip', 'Topping'),
(165, 68, 'Nasi Putih', 'Bahan Utama'),
(166, 68, 'Ayam Goreng Tepung', 'Lauk Utama'),
(167, 68, 'Sambal Bawang', 'Pelengkap'),
(168, 69, 'Nasi Putih', 'Bahan Utama'),
(169, 69, 'Ayam & Tempe Bakar', 'Lauk Utama'),
(170, 69, 'Bumbu Kecap', 'Bumbu Utama'),
(171, 69, 'Sambal & Lalapan', 'Pelengkap'),
(172, 70, 'Mie', 'Bahan Utama'),
(173, 70, 'Pangsit Ayam Mini', 'Bahan Utama'),
(174, 70, 'Telur Puyuh', 'Topping'),
(175, 71, 'Mie', 'Bahan Utama'),
(176, 71, 'Pangsit Ayam Mini', 'Bahan Utama'),
(177, 71, 'Keju', 'Topping'),
(178, 72, 'Mie', 'Bahan Utama'),
(179, 72, 'Pangsit Ayam Mini', 'Bahan Utama'),
(180, 72, 'Bola Ikan', 'Topping'),
(181, 73, 'Mie', 'Bahan Utama'),
(182, 73, 'Pangsit Ayam Mini', 'Bahan Utama'),
(183, 74, 'Mie', 'Bahan Utama'),
(184, 74, 'Pangsit Ayam Mini', 'Bahan Utama'),
(185, 74, 'Baso Sapi', 'Topping'),
(186, 75, 'Sayuran Rebus', 'Bahan Utama'),
(187, 75, 'Bumbu Kacang Kencur', 'Bumbu Utama'),
(188, 76, 'Sayur Rebus', 'Bahan Utama'),
(189, 76, 'Tahu & Telur', 'Lauk'),
(190, 76, 'Saus Kacang Matang', 'Bumbu Utama'),
(191, 77, 'Sayuran Mentah', 'Bahan Utama'),
(192, 77, 'Bumbu Kacang Ulek', 'Bumbu Utama'),
(193, 78, 'Nasi Putih', 'Bahan Utama'),
(194, 78, 'Ayam Fillet Gulung', 'Bahan Utama'),
(195, 78, 'Keju', 'Isian'),
(196, 78, 'Daging Asap', 'Isian'),
(197, 79, 'Nasi Putih', 'Bahan Utama'),
(198, 79, 'Ayam Fillet Gulung', 'Bahan Utama'),
(199, 79, 'Keju', 'Isian'),
(200, 79, 'Daging Asap', 'Isian'),
(201, 80, 'Nasi Putih', 'Bahan Utama'),
(202, 80, 'Ayam & Tempe Bakar', 'Lauk Utama'),
(203, 80, 'Bumbu Kecap Manis', 'Bumbu Utama'),
(204, 81, 'Nasi Putih', 'Bahan Utama'),
(205, 81, 'Ayam Krispi', 'Lauk Utama'),
(206, 81, 'Sambal Bawang', 'Pelengkap'),
(207, 82, 'Nasi Putih', 'Bahan Utama'),
(208, 82, 'Ayam Fillet Tepung', 'Lauk Utama'),
(209, 83, 'Nasi Putih', 'Bahan Utama'),
(210, 83, 'Sosis Ayam', 'Lauk Utama'),
(211, 83, 'Bumbu Kecap & Bawang', 'Bumbu Utama'),
(212, 84, 'Nasi Putih', 'Bahan Utama'),
(213, 84, 'Telur & Kornet', 'Lauk Utama'),
(214, 84, 'Daun Bawang', 'Pelengkap'),
(215, 85, 'Kulit Dimsum', 'Bahan Utama'),
(216, 85, 'Daging Olahan', 'Isian Utama'),
(217, 86, 'Kulit Gyoza', 'Bahan Utama'),
(218, 86, 'Daging Cincang', 'Isian Utama'),
(219, 87, 'Kentang Stik', 'Bahan Utama'),
(220, 87, 'Sosis', 'Bahan Utama'),
(221, 88, 'Teh', 'Bahan Utama'),
(222, 88, 'Gula', 'Pemanis'),
(223, 89, 'Teh', 'Bahan Utama'),
(224, 89, 'Ekstrak Lemon', 'Perasa Utama'),
(225, 90, 'Sayuran (Wortel & Kol)', 'Bahan Utama'),
(226, 90, 'Tepung Terigu', 'Bahan Utama'),
(227, 91, 'Tempe', 'Bahan Utama'),
(228, 91, 'Tepung Bumbu', 'Bahan Utama'),
(229, 92, 'Tepung Aci (Tapioka)', 'Bahan Utama'),
(230, 93, 'Tahu', 'Bahan Utama'),
(231, 93, 'Sayuran Pedas', 'Isian Utama'),
(232, 94, 'Pisang', 'Bahan Utama'),
(233, 94, 'Tepung Terigu', 'Bahan Utama'),
(234, 95, 'Beras', 'Bahan Utama'),
(235, 95, 'Suwiran Ayam', 'Topping'),
(236, 95, 'Kacang & Kerupuk', 'Pelengkap'),
(237, 96, 'Beras', 'Bahan Utama'),
(238, 96, 'Santan', 'Bumbu Utama'),
(239, 96, 'Lauk Sarapan', 'Pelengkap'),
(240, 97, 'Nasi Putih', 'Bahan Utama'),
(241, 97, 'Dada Ayam', 'Lauk Utama'),
(242, 97, 'Saus Steak', 'Bumbu Utama'),
(243, 98, 'Nasi Putih', 'Bahan Utama'),
(244, 98, 'Fillet Ayam Tepung', 'Lauk Utama'),
(245, 99, 'Nasi Putih', 'Bahan Utama'),
(246, 99, 'Ayam Tulang Lunak', 'Lauk Utama'),
(247, 99, 'Bumbu Rempah', 'Bumbu Utama'),
(248, 100, 'Mie Kuning / Bihun', 'Bahan Utama'),
(249, 100, 'Bakso Sapi', 'Topping Utama'),
(250, 100, 'Kuah Kaldu', 'Pelengkap'),
(251, 101, 'Adonan Ikan', 'Bahan Utama'),
(252, 101, 'Kuah Cuko', 'Bahan Utama'),
(253, 102, 'Roti', 'Bahan Utama'),
(254, 102, 'Aneka Isian Manis', 'Isian Utama'),
(255, 103, 'Makaroni', 'Bahan Utama'),
(256, 103, 'Bumbu Gurih Pedas', 'Bumbu'),
(257, 104, 'Makaroni', 'Bahan Utama'),
(258, 104, 'Bumbu Gurih Pedas', 'Bumbu'),
(259, 105, 'Kulit Lumpia', 'Bahan Utama'),
(260, 105, 'Tauge & Telur', 'Isian Utama'),
(261, 105, 'Bumbu Rempah', 'Bumbu Utama'),
(262, 106, 'Tepung Ketan', 'Bahan Utama'),
(263, 106, 'Buah Strawberry Segar', 'Isian Utama'),
(264, 107, 'Tepung Ketan', 'Bahan Utama'),
(265, 107, 'Coklat Lumer', 'Isian Utama'),
(266, 108, 'Tepung Ketan', 'Bahan Utama'),
(267, 108, 'Teh Hijau (Matcha)', 'Isian Utama'),
(268, 109, 'Tepung Ketan', 'Bahan Utama'),
(269, 109, 'Krim Mangga', 'Isian Utama'),
(270, 110, 'Tepung Ketan', 'Bahan Utama'),
(271, 110, 'Krim Biskuit Oreo', 'Isian Utama'),
(272, 111, 'Tepung Ketan', 'Bahan Utama'),
(273, 111, 'Krim Buah Durian', 'Isian Utama'),
(274, 112, 'Tepung Ketan', 'Bahan Utama'),
(275, 112, 'Krim Keju (Cream Cheese)', 'Isian Utama'),
(276, 113, 'Kulit Martabak', 'Bahan Utama'),
(277, 113, 'Telur', 'Bahan Utama'),
(278, 113, 'Daun Bawang', 'Isian Utama'),
(279, 114, 'Kulit Martabak', 'Bahan Utama'),
(280, 114, 'Telur', 'Bahan Utama'),
(281, 114, 'Keju', 'Isian Utama'),
(282, 115, 'Kulit Martabak', 'Bahan Utama'),
(283, 115, 'Telur', 'Bahan Utama'),
(284, 115, 'Potongan Sosis', 'Isian Utama'),
(285, 116, 'Kulit Martabak', 'Bahan Utama'),
(286, 116, 'Telur', 'Bahan Utama'),
(287, 116, 'Potongan Baso', 'Isian Utama'),
(288, 117, 'Kulit Martabak', 'Bahan Utama'),
(289, 117, 'Telur', 'Bahan Utama'),
(290, 117, 'Daging Sapi Cincang', 'Isian Utama'),
(291, 118, 'Kulit Martabak', 'Bahan Utama'),
(292, 118, 'Telur', 'Bahan Utama'),
(293, 118, 'Kornet Sapi', 'Isian Utama'),
(294, 119, 'Kulit Martabak', 'Bahan Utama'),
(295, 119, 'Telur', 'Bahan Utama'),
(296, 119, 'Daging & Sayuran', 'Isian Utama'),
(297, 120, 'Kulit Martabak', 'Bahan Utama'),
(298, 120, 'Dua Butir Telur', 'Bahan Utama'),
(299, 121, 'Bubuk Pop Ice Mango', 'Bahan Utama'),
(300, 121, 'Susu Kental Manis', 'Bahan Utama'),
(301, 122, 'Bubuk Pop Ice Strawberry', 'Bahan Utama'),
(302, 122, 'Susu Kental Manis', 'Bahan Utama'),
(303, 123, 'Bubuk Pop Ice Chocolate', 'Bahan Utama'),
(304, 123, 'Susu Kental Manis', 'Bahan Utama'),
(305, 124, 'Bubuk Pop Ice Vanilla Blue', 'Bahan Utama'),
(306, 124, 'Susu Kental Manis', 'Bahan Utama'),
(307, 125, 'Bubuk Pop Ice Anggur', 'Bahan Utama'),
(308, 125, 'Susu Kental Manis', 'Bahan Utama'),
(309, 126, 'Bubuk Pop Ice Taro', 'Bahan Utama'),
(310, 126, 'Susu Kental Manis', 'Bahan Utama'),
(311, 127, 'Adonan Tepung Takoyaki', 'Bahan Utama'),
(312, 127, 'Isian (Gurita/Sosis/Bakso)', 'Isian'),
(313, 127, 'Katsuobushi', 'Topping'),
(314, 128, 'Adonan Tepung Takoyaki', 'Bahan Utama'),
(315, 128, 'Isian (Gurita/Sosis/Bakso)', 'Isian'),
(316, 128, 'Katsuobushi', 'Topping'),
(317, 129, 'Adonan Tepung Takoyaki', 'Bahan Utama'),
(318, 129, 'Isian (Gurita/Sosis/Bakso)', 'Isian'),
(319, 129, 'Katsuobushi', 'Topping'),
(320, 130, 'Tepung Aci (Tapioka)', 'Bahan Utama'),
(321, 130, 'Telur', 'Bahan Utama'),
(322, 130, 'Bumbu Pedas Gurih', 'Bumbu'),
(323, 131, 'Adonan Ikan & Tahu', 'Bahan Utama'),
(324, 131, 'Bumbu Kacang', 'Bumbu Utama'),
(325, 132, 'Mie Sakura', 'Bahan Utama'),
(326, 132, 'Siomay', 'Topping'),
(327, 132, 'Chili Oil', 'Bumbu Utama'),
(328, 133, 'Aneka Buah Segar', 'Bahan Utama'),
(329, 133, 'Gula Pasir (Sirup)', 'Lapisan Luar'),
(330, 134, 'Biji Kopi (Espresso)', 'Bahan Utama'),
(331, 134, 'Susu', 'Bahan Utama'),
(332, 134, 'Sirup Signature Daily', 'Perasa Utama'),
(333, 135, 'Biji Kopi (Espresso)', 'Bahan Utama'),
(334, 135, 'Susu', 'Bahan Utama'),
(335, 135, 'Sirup Romansa', 'Perasa Utama'),
(336, 136, 'Biji Kopi (Espresso)', 'Bahan Utama'),
(337, 136, 'Susu', 'Bahan Utama'),
(338, 137, 'Biji Kopi (Espresso)', 'Bahan Utama'),
(339, 137, 'Susu', 'Bahan Utama'),
(340, 138, 'Biji Kopi (Espresso)', 'Bahan Utama'),
(341, 138, 'Susu', 'Bahan Utama'),
(342, 139, 'Biji Kopi Single Origin', 'Bahan Utama'),
(343, 139, 'Air', 'Bahan Utama'),
(344, 140, 'Biji Kopi (Espresso)', 'Bahan Utama'),
(345, 140, 'Air', 'Bahan Utama'),
(346, 140, 'Sirup/Buah Peach', 'Perasa Utama'),
(347, 141, 'Biji Kopi (Espresso)', 'Bahan Utama'),
(348, 141, 'Air', 'Bahan Utama'),
(349, 141, 'Ekstrak Lemon', 'Perasa Utama'),
(350, 142, 'Biji Kopi (Espresso)', 'Bahan Utama'),
(351, 142, 'Campuran Mocktail', 'Bahan Utama'),
(352, 143, 'Biji Kopi (Espresso)', 'Bahan Utama'),
(353, 143, 'Susu', 'Bahan Utama'),
(354, 143, 'Susu Kental Manis', 'Pemanis'),
(355, 144, 'Biji Kopi (Espresso)', 'Bahan Utama'),
(356, 144, 'Susu', 'Bahan Utama'),
(357, 144, 'Sirup Butterscotch', 'Perasa Utama'),
(358, 145, 'Biji Kopi (Espresso)', 'Bahan Utama'),
(359, 145, 'Susu', 'Bahan Utama'),
(360, 145, 'Gula Karamel (Crust)', 'Topping'),
(361, 146, 'Biji Kopi (Espresso)', 'Bahan Utama'),
(362, 146, 'Susu', 'Bahan Utama'),
(363, 146, 'Saus Karamel', 'Topping Utama'),
(364, 147, 'Espresso', 'Bahan Utama'),
(365, 147, 'Es Krim Vanilla', 'Bahan Utama'),
(366, 148, 'Double Espresso', 'Bahan Utama'),
(367, 148, 'Susu', 'Bahan Utama'),
(368, 149, 'Espresso', 'Bahan Utama'),
(369, 149, 'Air', 'Bahan Utama'),
(370, 150, 'Espresso', 'Bahan Utama'),
(371, 150, 'Susu', 'Bahan Utama'),
(372, 151, 'Espresso', 'Bahan Utama'),
(373, 151, 'Susu (Microfoam)', 'Bahan Utama'),
(374, 152, 'Espresso', 'Bahan Utama'),
(375, 153, 'Espresso Shot', 'Bahan Utama'),
(376, 154, 'Aneka Rempah (Secang, Cengkeh, dll)', 'Bahan Utama'),
(377, 154, 'Gula Batu', 'Pemanis'),
(378, 155, 'Jeruk, Jahe, dan Kencur', 'Bahan Utama'),
(379, 156, 'Bubuk Matcha Jepang', 'Bahan Utama'),
(380, 156, 'Susu Segar', 'Bahan Utama'),
(381, 157, 'Bubuk Matcha Jepang', 'Bahan Utama'),
(382, 157, 'Susu Segar', 'Bahan Utama'),
(383, 157, 'Buah Strawberry', 'Perasa Utama'),
(384, 158, 'Cokelat Premium', 'Bahan Utama'),
(385, 158, 'Susu Segar', 'Bahan Utama'),
(386, 159, 'Bahan Rahasia Tjaritra', 'Bahan Utama'),
(387, 160, 'Buah Alpukat Segar', 'Bahan Utama'),
(388, 160, 'Susu / Gula', 'Pelengkap'),
(389, 161, 'Buah Strawberry Segar', 'Bahan Utama'),
(390, 162, 'Buah Jeruk Murni', 'Bahan Utama'),
(391, 163, 'Buah Naga Merah', 'Bahan Utama'),
(392, 164, 'Buah Mangga Segar', 'Bahan Utama'),
(393, 165, 'Sayuran Hijau Segar', 'Bahan Utama'),
(394, 165, 'Ekstrak Buah Segar', 'Pelengkap'),
(395, 166, 'Buah Pisang', 'Bahan Utama'),
(396, 166, 'Yoghurt / Susu', 'Bahan Utama'),
(397, 167, 'Buah Strawberry', 'Bahan Utama'),
(398, 167, 'Yoghurt / Susu', 'Bahan Utama'),
(399, 168, 'Buah Mangga', 'Bahan Utama'),
(400, 168, 'Yoghurt / Susu', 'Bahan Utama'),
(401, 169, 'Buah Persik (Peach)', 'Bahan Utama'),
(402, 169, 'Air Soda & Daun Mint', 'Bahan Utama'),
(403, 170, 'Buah Strawberry', 'Bahan Utama'),
(404, 170, 'Air Soda & Daun Mint', 'Bahan Utama'),
(405, 171, 'Air Soda', 'Bahan Utama'),
(406, 171, 'Buah Persik', 'Bahan Utama'),
(407, 172, 'Air Soda', 'Bahan Utama'),
(408, 172, 'Aneka Buah Berry', 'Bahan Utama'),
(409, 173, 'Teh', 'Bahan Utama'),
(410, 173, 'Perasan Lemon Segar', 'Perasa Utama'),
(411, 174, 'Teh', 'Bahan Utama'),
(412, 174, 'Buah Leci', 'Topping Utama'),
(413, 175, 'Teh', 'Bahan Utama'),
(414, 175, 'Buah Persik', 'Topping Utama'),
(415, 176, 'Teh Seduh Klasik', 'Bahan Utama'),
(416, 176, 'Gula', 'Pemanis'),
(417, 177, 'Teh', 'Bahan Utama'),
(418, 177, 'Batang Sereh', 'Bahan Utama'),
(419, 178, 'Kentang Goreng', 'Bahan Utama'),
(420, 178, 'Sosis', 'Bahan Utama'),
(421, 178, 'Daging Ayam', 'Bahan Utama'),
(422, 179, 'Kentang', 'Bahan Utama'),
(423, 179, 'Garam', 'Bumbu'),
(424, 180, 'Sayap Ayam', 'Bahan Utama'),
(425, 180, 'Bumbu Gurih', 'Bumbu Utama'),
(426, 181, 'Pisang', 'Bahan Utama'),
(427, 181, 'Tepung Khas Thailand', 'Bahan Utama'),
(428, 182, 'Pisang', 'Bahan Utama'),
(429, 182, 'Coklat', 'Isian Utama'),
(430, 182, 'Kulit Renyah', 'Pembungkus'),
(431, 183, 'Tahu', 'Bahan Utama'),
(432, 183, 'Cabai & Garam', 'Bumbu Utama'),
(433, 184, 'Tepung Aci (Tapioka)', 'Bahan Utama'),
(434, 184, 'Bumbu Gurih', 'Bumbu Utama'),
(435, 185, 'Singkong', 'Bahan Utama'),
(436, 185, 'Bumbu Rahasia Tjaritra', 'Bumbu Utama'),
(437, 186, 'Telur', 'Bahan Utama'),
(438, 186, 'Jamur', 'Isian'),
(439, 186, 'Keju', 'Isian'),
(440, 187, 'Jamur', 'Bahan Utama'),
(441, 187, 'Krim Susu', 'Bahan Utama'),
(442, 188, 'Daging Olahan', 'Bahan Utama'),
(443, 188, 'Kulit Pangsit', 'Bahan Utama'),
(444, 189, 'Daging Olahan', 'Bahan Utama'),
(445, 189, 'Rumput Laut (Nori)', 'Pembungkus'),
(446, 190, 'Daging Olahan', 'Bahan Utama'),
(447, 190, 'Kulit Tahu', 'Pembungkus'),
(448, 191, 'Pasta', 'Bahan Utama'),
(449, 191, 'Saus Daging & Tomat', 'Bumbu Utama'),
(450, 192, 'Pasta', 'Bahan Utama'),
(451, 192, 'Saus Krim Keju', 'Bumbu Utama'),
(452, 193, 'Nasi Putih', 'Bahan Utama'),
(453, 193, 'Bumbu Spesial Tjaritra', 'Bumbu Utama'),
(454, 194, 'Nasi Putih', 'Bahan Utama'),
(455, 194, 'Kencur (Cikur)', 'Bumbu Utama'),
(456, 195, 'Nasi Putih', 'Bahan Utama'),
(457, 195, 'Daging Kornet Sapi', 'Topping Utama'),
(458, 196, 'Mie Kuning', 'Bahan Utama'),
(459, 196, 'Bumbu Putih', 'Bumbu Utama'),
(460, 197, 'Nasi Putih', 'Bahan Utama'),
(461, 197, 'Ayam Bumbu Kalasan', 'Lauk Utama'),
(462, 198, 'Nasi Putih', 'Bahan Utama'),
(463, 198, 'Ayam Bakar Bumbu Kecap', 'Lauk Utama'),
(464, 199, 'Ayam Fillet Tepung', 'Bahan Utama'),
(465, 199, 'Sambal Dabu-dabu / Mayonnaise', 'Pelengkap'),
(466, 200, 'Ayam Fillet Tepung', 'Bahan Utama'),
(467, 200, 'Saus Jamur (Mushroom)', 'Bumbu Utama'),
(468, 201, 'Nasi Putih', 'Bahan Utama'),
(469, 201, 'Ayam Panggang', 'Lauk Utama'),
(470, 201, 'Saus Jamur', 'Bumbu Utama'),
(471, 202, 'Kentang Goreng', 'Bahan Utama'),
(472, 202, 'Ayam Panggang', 'Lauk Utama'),
(473, 202, 'Saus Jamur', 'Bumbu Utama'),
(474, 203, 'Nasi Putih', 'Bahan Utama'),
(475, 203, 'Ayam Krispi', 'Lauk Utama'),
(476, 203, 'Bumbu Cabe Garam', 'Bumbu Utama'),
(477, 204, 'Nasi Putih', 'Bahan Utama'),
(478, 204, 'Ayam Saus Teriyaki', 'Lauk Utama'),
(479, 205, 'Nasi Putih', 'Bahan Utama'),
(480, 205, 'Ayam Saus BBQ', 'Lauk Utama'),
(481, 206, 'Aneka Buah Segar', 'Bahan Utama'),
(482, 206, 'Sambal Kacang', 'Bumbu Utama'),
(483, 207, 'Nasi Putih', 'Bahan Utama'),
(484, 207, 'Bumbu Nasi Goreng', 'Bumbu'),
(485, 207, 'Katsu Ayam', 'Topping Utama'),
(486, 208, 'Nasi Putih', 'Bahan Utama'),
(487, 208, 'Ayam Goreng Krispi', 'Lauk Utama'),
(488, 208, 'Sambal Bawang Segar', 'Bumbu Utama'),
(489, 209, 'Nasi Putih', 'Bahan Utama'),
(490, 209, 'Ayam Goreng Tepung (Katsu)', 'Lauk Utama'),
(491, 210, 'Nasi Putih', 'Bahan Utama'),
(492, 210, 'Ayam Goreng', 'Lauk Utama'),
(493, 210, 'Saus Bumbu Spesial', 'Bumbu Utama');

-- --------------------------------------------------------

--
-- Table structure for table `jam_operasional`
--

CREATE TABLE `jam_operasional` (
  `id_jam` int(11) NOT NULL,
  `id_umkm` int(11) DEFAULT NULL,
  `hari_buka` varchar(50) DEFAULT NULL,
  `jam_buka` time DEFAULT NULL,
  `jam_tutup` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jam_operasional`
--

INSERT INTO `jam_operasional` (`id_jam`, `id_umkm`, `hari_buka`, `jam_buka`, `jam_tutup`) VALUES
(1, 1, 'Setiap Hari', '09:00:00', '15:00:00'),
(2, 2, 'Setiap Hari', '06:00:00', '13:00:00'),
(3, 3, 'Senin-Sabtu', '10:00:00', '17:30:00'),
(4, 4, 'Setiap Hari', '09:30:00', '17:00:00'),
(5, 5, 'Setiap Hari', '10:00:00', '16:00:00'),
(6, 6, 'Setiap Hari', '06:00:00', '22:00:00'),
(7, 7, 'Setiap Hari', '10:00:00', '17:00:00'),
(8, 8, 'Setiap Hari', '12:00:00', '20:00:00'),
(9, 9, 'Setiap Hari', '08:00:00', '12:00:00'),
(10, 10, 'Setiap Hari', '12:00:00', '20:00:00'),
(11, 11, 'Setiap Hari', '08:00:00', '17:00:00'),
(12, 12, 'Setiap Hari', '06:00:00', '12:00:00'),
(13, 13, 'Setiap Hari', '08:30:00', '18:00:00'),
(14, 14, 'Senin-Sabtu', '07:00:00', '17:00:00'),
(15, 15, 'Setiap Hari', '08:30:00', '17:00:00'),
(16, 16, 'Setiap Hari', '08:00:00', '18:00:00'),
(17, 17, 'Setiap Hari', '08:00:00', '18:00:00'),
(18, 18, 'Setiap Hari', '09:00:00', '16:00:00'),
(19, 19, 'Setiap Hari (Tentatif)', '09:00:00', '16:30:00'),
(20, 20, 'Setiap Hari', '16:00:00', '22:00:00'),
(21, 21, 'Setiap Hari', '07:00:00', '14:00:00'),
(22, 22, 'Setiap Hari', '10:00:00', '21:00:00'),
(23, 23, 'Setiap Hari', '08:00:00', '17:00:00'),
(24, 24, 'Setiap Hari', '09:00:00', '16:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_rasa`
--

CREATE TABLE `kategori_rasa` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_rasa`
--

INSERT INTO `kategori_rasa` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Asin Gurih'),
(2, 'Manis'),
(3, 'Pedas'),
(4, 'Asam Manis'),
(5, 'Gurih Pedas'),
(6, 'Manis Pedas'),
(7, 'Pahit Manis'),
(8, 'Pahit'),
(9, 'Manis Gurih');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `id_umkm` int(11) DEFAULT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `id_asal` int(11) DEFAULT NULL,
  `nama_menu` varchar(100) DEFAULT NULL,
  `deskripsi_menu` text DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `id_umkm`, `id_kategori`, `id_asal`, `nama_menu`, `deskripsi_menu`, `harga`) VALUES
(1, 1, 1, 1, 'Mie / Bihun Yamin Manis atau Asin', 'Mie / Bihun dengan bumbu asin gurih', 14000),
(2, 1, 1, 1, 'Mie / Bihun Baso Kuah', 'Mie / Bihun dengan bumbu asin gurih', 16000),
(3, 1, 3, 1, 'Yamin Sambal Bajak', 'Yamin dengan sambal bajak yang bikin nagih', 16000),
(4, 1, 5, 1, 'Yamin Mercon Sapi', 'Yamin dengan bumbu Mercon sapi yang pedas dan gurih', 18000),
(5, 1, 3, 1, 'Yamin Chili Oil', 'Yamin dengan bumbu chili oil yang pedas', 15000),
(6, 1, 1, 1, 'Pangsit Kuah / Baso Pangsit Kuah', 'Pangsit dan bakso dengan kuah yang gurih', 12000),
(7, 2, 1, 1, 'Basreng', 'Basreng yang gurih dan crunchy', 10000),
(8, 2, 1, 3, 'Kripik', 'Renyahnya Kripik dan gurih', 10000),
(9, 2, 1, 4, 'Dimsum', 'Dimsum lembut dengan isian daging', 10000),
(10, 2, 5, 3, 'Nasi box', 'Nasi box dengan isian nasi ayam pedas dan timun', 10000),
(11, 2, 4, 1, 'Rujak', 'Rujak dengan aneka buah yang segar dan sambal yang bikin nagih', 10000),
(12, 2, 2, 3, 'Lemon tea', 'Teh dengan rasa lemon yang menyegarkan', 10000),
(13, 3, 4, 3, 'Wonton chili Oil', 'Pangsit daging lembut dengan siraman minyak cabai pedas gurih', 8000),
(14, 3, 4, 1, 'Wonton Kuah', 'Pangsit daging hangat dengan kuah kaldu segar', 8000),
(15, 3, 1, 1, 'Cirawang', 'Aci kenyal goreng dengan aroma bawang yang gurih', 5000),
(16, 3, 1, 1, 'Cirawit', 'Aci kenyal goreng dengan isian cabai rawit pedas', 5000),
(17, 3, 6, 3, 'Mie Jebew', 'Mie kenyal dengan racikan bumbu pedas manis khas', 10000),
(18, 3, 5, 3, 'Mie Jebew Baso', 'Mie pedas khas dengan tambahan toping baso daging', 13000),
(19, 3, 5, 3, 'Mie Jebew Sosis', 'Mie pedas khas dengan tambahan toping sosis gurih', 13000),
(20, 3, 5, 3, 'Mie Jebew Wonton', 'Mie pedas khas dengan toping pangsit daging lembut', 13000),
(21, 4, 6, 1, 'Batagor', 'Bakso tahu goreng renyah dengan siraman saus kacang gurih', 10000),
(22, 5, 8, 5, 'Americano Lemon Slice', 'Kopi hitam dingin dengan kesegaran irisan lemon', 10000),
(23, 5, 7, 3, 'Si Hitam Manis', 'Kopi hitam tradisional dengan rasa manis yang seimbang', 10000),
(24, 5, 7, 3, 'Si Hitam Legit', 'Kopi hitam pekat dengan sensasi manis yang kuat dan kental.', 12000),
(25, 5, 7, 5, 'Americano Orange', 'Espresso berpadu dengan kesegaran buah jeruk alami', 15000),
(26, 5, 8, 3, 'Black Coffee', 'Kopi hitam klasik tanpa pemanis', 10000),
(27, 5, 2, 3, 'Es Kopi Susu', 'Kopi susu jadul yang ramah di lidah dan kantong', 9500),
(28, 5, 2, 3, 'Milky Aren', 'Susu segar murni dengan legitnya gula aren asli', 10000),
(29, 5, 2, 3, 'Arne Koffie-san', 'Es kopi susu signature dengan sentuhan gula aren premium', 13000),
(30, 5, 7, 6, 'Coffee Latte', 'Perpaduan seimbang antara espresso dan susu hangat', 10000),
(31, 5, 2, 3, 'Karmel Koffie-san', 'Es kopi susu dengan sirup karamel aromatik', 13000),
(32, 5, 2, 3, 'Butterscotch Koffie-san', 'Es kopi susu dengan aroma butter yang khas', 12000),
(33, 5, 9, 3, 'Hazel Koffie-san', 'Es kopi susu dengan sentuhan rasa kacang hazelnut', 14000),
(34, 5, 9, 6, 'Caramel Macchiato', 'Kopi susu premium dengan kucuran saus karamel di atasnya', 16000),
(35, 5, 9, 3, 'Butterscotch Sea Salt Latte', 'Kopi susu kekinian dengan paduan mentega dan garam laut', 17000),
(36, 5, 7, 2, 'Matcha', 'Teh hijau bubuk murni khas Jepang yang otentik', 10000),
(37, 5, 9, 2, 'Matcha Latte', 'Perpaduan teh hijau Jepang dengan kelembutan susu segar', 13000),
(38, 6, 6, 1, 'Seblak Original Coet', 'Seblak kering ulek tanpa kuah beraroma kencur kuat. Pedas, kenyal, dan gurih', 10000),
(39, 6, 6, 1, 'Seblak Kuah Jeletot', 'Seblak kuah banjir isi komplit + telur orek. Pedas nampol dan kuahnya kental', 15000),
(40, 6, 6, 1, 'Seblak Cuankie Instan', 'Seblak kuah sedang dengan topping cuankie lidah dan siomay. Gurih dan renyah-basah', 13000),
(41, 6, 6, 1, 'Seblak Korea', 'Seblak fusion isi tteokbokki dan odeng pakai saus gochujang. Pedas, manis, kekinian', 18000),
(42, 6, 6, 1, 'Seblak Ceker Mercon', 'Seblak tanpa kerupuk berisi ceker empuk bumbu pekat nyemek. Pedas manis meresap', 12000),
(43, 7, 2, 3, 'Crepes Susu', 'Crepes dengan olesan susu manis', 3000),
(44, 7, 2, 3, 'Crepes Coklat', 'Crepes dengan isian coklat manis', 3000),
(45, 7, 2, 3, 'Crepes Oreo', 'Crepes dengan taburan remahan oreo', 3000),
(46, 7, 2, 3, 'Crepes Blueberry', 'Crepes dengan selai blueberry', 3000),
(47, 7, 2, 3, 'Crepes Vanilla', 'Crepes dengan rasa vanilla yang harum', 3000),
(48, 7, 2, 3, 'Crepes Tiramisu', 'Crepes dengan rasa tiramisu yang manis', 3000),
(49, 7, 2, 3, 'Crepes Taro', 'Crepes dengan rasa taro yang manis', 3000),
(50, 7, 9, 3, 'Crepes Oreo Keju', 'Perpaduan manisnya oreo dan gurihnya keju', 5000),
(51, 7, 9, 3, 'Crepes Coklat Keju', 'Perpaduan klasik coklat manis dan keju gurih', 5000),
(52, 7, 9, 3, 'Crepes Blueberry Keju', 'Perpaduan selai blueberry dengan taburan keju', 5000),
(53, 7, 9, 3, 'Crepes Strawberry Keju', 'Perpaduan selai strawberry dengan taburan keju', 5000),
(54, 7, 4, 3, 'Crepes Lemon Keju', 'Sensasi asam manis lemon dipadu dengan keju', 5000),
(55, 7, 2, 3, 'Crepes Chococip Oreo', 'Crepes dengan topping chococip dan oreo', 5000),
(56, 7, 2, 3, 'Crepes Marshmallow Oreo', 'Crepes lembut dengan marshmallow dan oreo', 5000),
(57, 7, 2, 3, 'Crepes Coklat Pisang', 'Kombinasi manis coklat dan irisan pisang', 4000),
(58, 7, 2, 3, 'Crepes Oreo Greentea', 'Crepes dengan rasa teh hijau dan remahan oreo', 4000),
(59, 7, 4, 3, 'Crepes Coklat Strawberry', 'Perpaduan rasa coklat dan asam manis strawberry', 4000),
(60, 7, 2, 3, 'Crepes Pisang Oreo', 'Crepes dengan isian pisang dan oreo', 4000),
(61, 7, 4, 3, 'Crepes Coklat Lemon', 'Perpaduan unik rasa coklat dan segarnya lemon', 4000),
(62, 7, 2, 3, 'Crepes Coklat Vanilla', 'Kombinasi rasa coklat dan vanilla', 4000),
(63, 7, 9, 3, 'Crepes Keju', 'Crepes dengan isian keju yang gurih', 4000),
(64, 7, 2, 3, 'Crepes Oreo Vanilla', 'Crepes dengan rasa oreo dan vanilla', 4000),
(65, 7, 2, 3, 'Crepes Oreo Tiramisu', 'Crepes dengan perpaduan oreo dan tiramisu', 4000),
(66, 7, 2, 3, 'Crepes Marshmallow', 'Crepes dengan topping marshmallow yang kenyal', 4000),
(67, 7, 2, 3, 'Crepes Chococip', 'Crepes dengan taburan butiran coklat chococip', 4000),
(68, 8, 3, 3, 'Nasi Ayam Geprek', 'Ayam goreng tepung renyah yang dihancurkan (digeprek) bersama ulekan sambal bawang segar', 13000),
(69, 8, 9, 3, 'Nasi Ayam Bakar Tempe', 'Paket nasi, ayam, dan tempe yang dibakar dengan olesan bumbu kecap, disajikan bersama sambal dan lalapan', 15000),
(70, 8, 1, 1, 'Pangyami Telur Puyuh', 'erpaduan mie dan pangsit ayam mini yang disajikan dengan topping telur puyuh rebus', 15000),
(71, 8, 1, 1, 'Pangyami Keju', 'Menu pangsit ayam mini dan mie yang diberi sentuhan modern berupa taburan keju di atasnya', 15000),
(72, 8, 1, 1, 'Pangyami Bola Ikan', 'Hidangan mie dan pangsit mini yang dilengkapi dengan potongan bola ikan olahan yang kenyal', 15000),
(73, 8, 1, 1, 'Pangyami Original', 'Menu dasar klasik yang menyajikan mi dengan porsi pangsit ayam mini yang dominan tanpa lauk tambahan', 13000),
(74, 8, 1, 1, 'Pangyami Baso', 'Variasi paling favorit yang memadukan mie, pangsit ayam mini, dan butiran baso sapi', 15000),
(75, 9, 9, 3, 'Lotek', 'Sayuran rebus yang diaduk langsung dengan bumbu kacang ulek beraroma kencur', 12000),
(76, 9, 9, 3, 'Gado-Gado', 'Sayur, tahu, dan telur yang ditata lalu disiram saus kacang kental matang', 15000),
(77, 9, 6, 3, 'Karedok', 'Sayuran serba mentah yang dipotong-potong lalu diaduk bumbu kacang ulek', 14000),
(78, 10, 9, 7, 'Nasi Chicken Cordon Bleu', 'Ayam gulung isi keju dan daging asap yang digoreng krispi', 15000),
(79, 10, 9, 3, 'Nasi Chicken Cordon Bleu', 'Ayam gulung isi keju dan daging asap yang digoreng krispi', 15000),
(80, 10, 3, 3, 'Nasi Ayam Bakar Tempe', 'Ayam dan tempe yang dibakar dengan olesan bumbu kecap manis', 15000),
(81, 10, 3, 3, 'Nasi Ayam Geprek', 'Ayam krispi yang dihancurkan bersama ulekan sambal bawang segar', 13000),
(82, 10, 1, 5, 'Nasi Ayam Popcorn', 'Ayam fillet potongan mini yang digoreng tepung garing mirip popcorn', 13000),
(83, 10, 9, 3, 'Nasi Sosis Ayam Manis', 'Potongan sosis ayam yang ditumis dengan bumbu kecap dan bawang', 13000),
(84, 10, 1, 3, 'Nasi Telor Dadar Kornet', 'Telur yang dikocok bersama kornet dan daun bawang lalu didadar garing', 10000),
(85, 10, 1, 4, 'Dimsum Kukus/Goreng', 'Pangsit daging khas oriental yang disajikan hangat (dikukus atau digoreng)', 10000),
(86, 10, 5, 2, 'Gyoza Kukus/Goreng', 'Pangsit lipat khas Jepang isi daging (dikukus atau digoreng garing)', 10000),
(87, 10, 1, 5, 'Kentang Sosis', 'Kombinasi potongan kentang stik goreng dan sosis goreng', 10000),
(88, 10, 2, 3, 'Teh Manis Dingin', 'Minuman es teh manis yang menyegarkan tenggorokan', 4000),
(89, 10, 2, 3, 'Lemon Tea', 'Perpaduan minuman teh manis dengan kesegaran ekstrak lemon', 4000),
(90, 11, 1, 1, 'Bakwan', 'Gorengan sayur campur yang renyah dan gurih', 1000),
(91, 11, 1, 1, 'Tempe', 'Tempe goreng tepung dengan bumbu rempah tradisional', 1000),
(92, 11, 1, 1, 'Cireng', 'Aci digoreng khas Sunda yang kenyal dan gurih', 1000),
(93, 11, 1, 1, 'Gehu', 'Tahu isi sayuran pedas yang digoreng garing', 1000),
(94, 11, 2, 3, 'Pisang Goreng', 'Pisang manis yang dibalut tepung dan digoreng keemasan', 1000),
(95, 12, 1, 3, 'Bubur Ayam', 'Bubur nasi lembut dengan topping ayam suwir, kacang, dan kerupuk', 10000),
(96, 12, 1, 3, 'Nasi Uduk', 'Nasi gurih santan dengan lauk pendamping khas sarapan', 10000),
(97, 13, 9, 3, 'Chicken Steak + Nasi', 'Nasi dengan steak ayam yang disiram saus kental manis gurih', 18000),
(98, 13, 1, 2, 'Katsu + Nasi', 'Nasi dengan ayam goreng tepung renyah khas Jepang', 15000),
(99, 13, 1, 3, 'ATL (Ayam Tulang Lunak) + Nasi', 'Nasi dengan ayam tulang lunak berbumbu rempah gurih', 18000),
(100, 13, 1, 3, 'Mie Bakso', 'Mie kuning dan bihun dengan topping bakso sapi serta kuah kaldu', 12000),
(101, 13, 1, 3, 'Pempek', 'Olahan ikan khas yang disajikan dengan kuah cuko asam manis pedas', 12000),
(102, 13, 2, 3, 'Roti Kukus/Bakar', 'Pilihan roti kukus atau bakar dengan aneka isian manis', 10000),
(103, 14, 5, 3, 'Makaroni (Porsi Kecil)', 'Makaroni basah/kering dengan bumbu gurih pedas porsi kecil', 5000),
(104, 14, 5, 3, 'Makaroni (Porsi Besar)', 'Makaroni basah/kering dengan bumbu gurih pedas porsi besar', 10000),
(105, 15, 1, 1, 'Lumpia Original', 'Lumpia basah khas Bandung dengan isian tauge, telur, dan bumbu rempah gurih', 10000),
(106, 16, 2, 2, 'Mochi Strawberry', 'Mochi kenyal khas Jepang dengan isian pasta manis dan buah strawberry segar', 5000),
(107, 16, 2, 2, 'Mochi Coklat', 'Mochi kenyal dengan isian coklat lumer yang manis', 5000),
(108, 16, 2, 2, 'Mochi Matcha', 'Mochi dengan isian teh hijau Jepang yang otentik', 5000),
(109, 16, 2, 2, 'Mochi Mangga', 'Mochi kenyal dengan isian krim mangga yang segar', 5000),
(110, 16, 2, 2, 'Mochi Oreo', 'Mochi kenyal dengan isian krim biskuit oreo', 5000),
(111, 16, 2, 2, 'Mochi Durian', 'Mochi kenyal dengan isian krim buah durian asli', 5000),
(112, 16, 9, 2, 'Mochi Cream Cheese', 'Mochi kenyal dengan isian krim keju yang manis dan gurih', 5000),
(113, 17, 1, 3, 'Martabak Original', 'Martabak telor klasik dengan isian telur dan daun bawang yang gurih', 5000),
(114, 17, 1, 3, 'Martabak Keju', 'Martabak telor dengan tambahan isian keju yang meleleh dan gurih', 8000),
(115, 17, 1, 3, 'Martabak Sosis', 'Martabak telor dengan potongan sosis sapi/ayam di dalamnya', 7000),
(116, 17, 1, 3, 'Martabak Baso', 'Martabak telor dengan isian potongan baso sapi yang kenyal dan gurih', 7000),
(117, 17, 1, 3, 'Martabak Beef', 'Martabak telor dengan isian daging sapi cincang berbumbu rempah', 8000),
(118, 17, 1, 3, 'Martabak Kornet', 'Martabak telor dengan paduan kornet sapi yang gurih dan lezat', 8000),
(119, 17, 1, 3, 'Martabak Spesial', 'Martabak telor dengan isian daging dan sayuran yang lebih melimpah', 13000),
(120, 17, 1, 3, 'Martabak Spesial Telur x2', 'Martabak spesial dengan tambahan porsi dua telur untuk rasa yang lebih mantap', 17000),
(121, 18, 2, 3, 'Pop Ice Sticky Milk Mango', 'Minuman rasa mangga dengan tekstur susu kental yang manis dan menyegarkan', 5000),
(122, 18, 2, 3, 'Pop Ice Sticky Milk Strawberry', 'Minuman rasa strawberry dengan tekstur susu kental yang manis dan menyegarkan', 5000),
(123, 18, 2, 3, 'Pop Ice Sticky Milk Chocolate', 'Minuman rasa cokelat dengan tekstur susu kental yang manis dan lezat', 5000),
(124, 18, 2, 3, 'Pop Ice Sticky Milk Vanilla Blue', 'Minuman rasa vanilla blue dengan tekstur susu kental yang manis dan unik', 5000),
(125, 18, 2, 3, 'Pop Ice Sticky Milk Anggur', 'Minuman rasa anggur dengan tekstur susu kental yang manis dan segar', 5000),
(126, 18, 2, 3, 'Pop Ice Sticky Milk Taro', 'Minuman rasa taro dengan tekstur susu kental yang manis dan aromatik', 5000),
(127, 19, 1, 2, 'Takoyaki (Isi 3)', 'Bola-bola tepung khas Jepang dengan isian gurih porsi 3 butir', 5000),
(128, 19, 1, 2, 'Takoyaki (Isi 6)', 'Bola-bola tepung khas Jepang dengan isian gurih porsi 6 butir', 10000),
(129, 19, 1, 2, 'Takoyaki (Isi 9)', 'Bola-bola tepung khas Jepang dengan isian gurih porsi 9 butir', 15000),
(130, 20, 5, 1, 'Cilung', 'Aci digulung dengan balutan telur dan taburan bumbu pedas gurih yang khas', 1000),
(131, 21, 1, 1, 'Baso Tahu Siomay', 'Campuran baso tahu dan siomay kukus khas Bandung dengan bumbu kacang gurih', 12000),
(132, 21, 5, 3, 'Mie Sakura Siomay Chili Oil', 'Mie instan legendaris dengan topping siomay dan siraman chili oil pedas gurih', 15000),
(133, 21, 2, 4, 'Tanghulu', 'Manisan buah khas China yang dilapisi sirup gula cair yang mengeras (crunchy)', 8000),
(134, 22, 7, 3, 'Tjaritra Daily', 'Kopi susu signature untuk menemani aktivitas harian', 23000),
(135, 22, 7, 3, 'Tjaritra Romansa', 'Kopi susu dengan sentuhan rasa yang lembut dan manis', 23000),
(136, 22, 7, 3, 'Tjaritra Santai', 'Kopi susu dengan profil rasa yang ringan dan menenangkan', 23000),
(137, 22, 7, 3, 'Tjaritra Botol 500 ml', 'Kopi susu signature dalam kemasan botol 500 ml', 50000),
(138, 22, 7, 3, 'Tjaritra Botol 1000 ml', 'Kopi susu signature dalam kemasan botol literan', 98000),
(139, 22, 8, 3, 'Single Origin V60', 'Kopi seduh manual menggunakan metode V60', 26000),
(140, 22, 4, 3, 'Black Peach', 'Perpaduan kopi hitam dengan kesegaran buah persik', 26000),
(141, 22, 4, 3, 'Iced Coffee Lemon', 'Kopi dingin dengan sensasi asam segar dari lemon', 23000),
(142, 22, 4, 3, 'Bloody Mary', 'Minuman kopi mocktail dengan profil rasa unik', 23000),
(143, 22, 2, 3, 'Spanish Latte', 'Kopi susu manis dengan tekstur yang creamy', 25000),
(144, 22, 2, 3, 'Butterscotch Latte', 'Kopi susu dengan aroma mentega dan karamel yang kuat', 32000),
(145, 22, 2, 7, 'Crème Brûlée', 'Minuman kopi yang terinspirasi dari hidangan pencuci mulut Prancis', 27000),
(146, 22, 2, 6, 'Caramel Macchiato', 'Espresso dengan susu dan saus karamel manis khas Italia', 28000),
(147, 22, 2, 6, 'Affogato', 'Espresso panas yang disiramkan di atas es krim vanilla', 25000),
(148, 22, 7, 6, 'Magic', 'Minuman berbasis espresso dengan proporsi susu yang kuat', 23000),
(149, 22, 8, 6, 'Americano', 'Espresso yang diencerkan dengan air panas', 20000),
(150, 22, 7, 6, 'Cafe Latte Hot/Iced', 'Espresso dengan susu uap yang lembut', 25000),
(151, 22, 7, 6, 'Flat White Hot/Iced', 'Espresso dengan tekstur susu yang sangat halus', 27000),
(152, 22, 8, 6, 'Espresso', 'Ekstrak kopi murni yang pekat dan kuat', 15000),
(153, 22, 8, 6, 'Extra Espresso Shot', 'Tambahan satu shot espresso untuk rasa kopi yang lebih kuat', 8000),
(154, 22, 2, 1, 'Wedang Uwuh', 'Minuman tradisional rempah khas Jawa yang menghangatkan', 18000),
(155, 22, 4, 1, 'Wedang Jejak', 'Minuman kesehatan campuran jeruk, jahe, dan kencur', 22000),
(156, 22, 2, 2, 'Matcha Latte Hot/Iced', 'Minuman teh hijau Jepang yang dipadukan dengan susu segar', 25000),
(157, 22, 4, 2, 'Strawberry Matcha Latte', 'Kombinasi unik matcha pahit manis dengan asam strawberry', 28000),
(158, 22, 2, 3, 'Chocolate Hot/Iced', 'Minuman cokelat premium yang kental dan manis', 25000),
(159, 22, 2, 3, 'Sweet Cheeya', 'Minuman manis spesial khas Tjaritra', 22000),
(160, 22, 2, 3, 'Avocado Juice', 'Jus alpukat segar yang kental dan bernutrisi', 25000),
(161, 22, 4, 3, 'Strawberry Juice', 'Jus buah strawberry segar dengan rasa asam manis', 25000),
(162, 22, 4, 3, 'Orange Juice', 'Jus jeruk murni yang menyegarkan', 20000),
(163, 22, 2, 3, 'Dragon Juice', 'Jus buah naga merah yang kaya akan antioksidan', 25000),
(164, 22, 4, 3, 'Mango Juice', 'Jus buah mangga segar musiman', 25000),
(165, 22, 4, 3, 'Healthy Green Juice', 'Jus sayuran hijau yang sehat dan segar', 27000),
(166, 22, 2, 3, 'Banana Smoothies', 'Minuman pisang yang dihaluskan dengan tekstur lembut', 25000),
(167, 22, 4, 3, 'Strawberry Smoothies', 'Minuman strawberry beku yang dihaluskan dengan susu', 27000),
(168, 22, 4, 3, 'Mango Smoothies', 'Minuman mangga beku yang dihaluskan dengan tekstur creamy', 27000),
(169, 22, 4, 3, 'Mojito Peach', 'Minuman soda segar dengan irisan daun mint dan buah persik', 25000),
(170, 22, 4, 3, 'Mojito Strawberry', 'Minuman soda segar dengan mint dan buah strawberry', 25000),
(171, 22, 4, 3, 'Sparkling Peach', 'Minuman bersoda dengan rasa peach yang ceria', 25000),
(172, 22, 4, 3, 'Berry Winter Punch', 'Mocktail buah berry dengan sensasi dingin menyegarkan', 25000),
(173, 22, 4, 3, 'Lemon Tea Hot/Iced', 'Minuman teh dengan perasan lemon segar', 18000),
(174, 22, 2, 3, 'Iced Lychee Tea', 'Es teh dengan buah leci yang manis', 20000),
(175, 22, 2, 3, 'Iced Peach Tea', 'Es teh dengan rasa buah persik yang aromatik', 20000),
(176, 22, 2, 3, 'Regular Tea Hot/Iced', 'Teh seduh klasik dengan layanan isi ulang satu kali', 15000),
(177, 22, 2, 1, 'Teh Sereh', 'Teh hangat aromatik dengan rebusan batang sereh', 16000),
(178, 22, 1, 3, 'Mixed Platter', 'Piring berbagi berisi kentang goreng, sosis, dan ayam', 35000),
(179, 22, 1, 5, 'French Fries', 'Kentang goreng renyah khas Amerika dengan taburan garam', 20000),
(180, 22, 1, 5, 'Chicken Wings', 'Sayap ayam berbumbu gurih yang digoreng garing', 28000),
(181, 22, 2, 3, 'Pisang Goreng Thailand', 'Pisang goreng renyah dengan balutan tepung khas', 24000),
(182, 22, 2, 3, 'Pisang Coklat', 'Pisang dengan isian coklat yang dibalut kulit renyah', 22000),
(183, 22, 5, 1, 'Tahu Cabe Garam', 'Tahu goreng krispi berbumbu cabai dan garam yang pedas gurih', 22000),
(184, 22, 1, 1, 'Cireng', 'Aci digoreng khas Bandung dengan tekstur kenyal dan gurih', 20000),
(185, 22, 1, 1, 'Singkong Tjaritra', 'Singkong goreng empuk dengan bumbu rahasia Tjaritra', 20000),
(186, 22, 1, 3, 'Mushroom & Cheese Omelette', 'Telur dadar berisi jamur dan keju yang lumer', 25000),
(187, 22, 1, 3, 'Mushroom Soup', 'Sup krim jamur yang hangat dan gurih', 25000),
(188, 22, 1, 4, 'Dimsum Siomay', 'Siomay kukus khas oriental dengan isian daging', 20000),
(189, 22, 1, 4, 'Dimsum Nori', 'Siomay yang dibungkus dengan rumput laut', 20000),
(190, 22, 1, 4, 'Dimsum Kulit Tahu', 'Siomay yang dibalut dengan kulit tahu tipis renyah', 20000),
(191, 22, 1, 6, 'Pasta Bolognese', 'Pasta dengan saus daging dan tomat klasik khas Italia', 30000),
(192, 22, 1, 6, 'Pasta Carbonara', 'Pasta dengan saus krim susu dan keju yang gurih', 30000),
(193, 22, 1, 3, 'Nasi Goreng Tjaritra', 'Nasi goreng spesial resep asli Tjaritra', 26000),
(194, 22, 1, 1, 'Nasi Goreng Cikur', 'Nasi goreng khas Sunda dengan aroma kencur yang kuat', 26000),
(195, 22, 1, 3, 'Nasi Goreng Kornet', 'Nasi goreng gurih dengan campuran daging kornet sapi', 26000),
(196, 22, 1, 1, 'Mie Tek-Tek Kuah Putih', 'Mie kuah tradisional dengan bumbu putih yang gurih', 24000),
(197, 22, 9, 3, 'Nasi Ayam Kalasan', 'Nasi dengan ayam goreng bumbu Kalasan yang manis gurih', 30000),
(198, 22, 9, 3, 'Nasi Ayam Bakar Tjaritra', 'Nasi dengan ayam bakar bumbu kecap spesial Tjaritra', 30000),
(199, 22, 1, 2, 'Chicken Katsu (Dabu-dabu / Mayonnaise)', 'Ayam goreng tepung Jepang dengan pilihan saus dabu-dabu atau mayo', 30000),
(200, 22, 1, 2, 'Chicken Katsu Mushroom Sauce', 'Ayam goreng tepung Jepang dengan siraman saus jamur', 32000),
(201, 22, 1, 3, 'Grilled Chicken Mushroom with Rice', 'Ayam panggang saus jamur disajikan dengan nasi putih', 30000),
(202, 22, 1, 3, 'Grilled Chicken Mushroom with Fries', 'Ayam panggang saus jamur disajikan dengan kentang goreng', 35000),
(203, 22, 5, 1, 'Ayam Cabe Garam Ricebowl', 'Nasi mangkuk dengan topping ayam krispi bumbu cabe garam', 25000),
(204, 22, 9, 2, 'Chicken Teriyaki Ricebowl', 'Nasi mangkuk dengan ayam saus teriyaki manis gurih khas Jepang', 25000),
(205, 22, 9, 3, 'Chicken BBQ Ricebowl', 'Nasi mangkuk dengan topping ayam saus BBQ yang lezat', 25000),
(206, 23, 4, 1, 'Rujak', 'Rujak dengan aneka buah segar dan sambal kacang pedas manis yang khas', 10000),
(207, 24, 1, 3, 'Nasi Goreng Katsu', 'Nasi goreng gurih yang disajikan dengan topping katsu ayam renyah', 12000),
(208, 24, 3, 3, 'Ayam Geprek Nasi', 'Paket nasi dengan ayam goreng krispi yang dihancurkan bersama ulekan sambal bawang segar', 10000),
(209, 24, 1, 2, 'Katsu Nasi', 'Nasi putih dengan ayam goreng tepung renyah khas Jepang yang gurih', 10000),
(210, 24, 1, 3, 'Ayam Celup Nasi', 'Paket nasi dengan ayam goreng yang dibalut saus bumbu spesial', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `metode_pembayaran`
--

CREATE TABLE `metode_pembayaran` (
  `id_metode` int(11) NOT NULL,
  `nama_metode` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `metode_pembayaran`
--

INSERT INTO `metode_pembayaran` (`id_metode`, `nama_metode`) VALUES
(1, 'Cash'),
(2, 'QRIS'),
(3, 'Transfer');

-- --------------------------------------------------------

--
-- Table structure for table `mitra_online`
--

CREATE TABLE `mitra_online` (
  `id_mitra` int(11) NOT NULL,
  `nama_platform` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mitra_online`
--

INSERT INTO `mitra_online` (`id_mitra`, `nama_platform`) VALUES
(1, 'GoFood'),
(2, 'GrabFood'),
(3, 'ShopeeFood');

-- --------------------------------------------------------

--
-- Table structure for table `ulasan`
--

CREATE TABLE `ulasan` (
  `id_ulasan` int(11) NOT NULL,
  `id_umkm` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `komentar` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ulasan`
--

INSERT INTO `ulasan` (`id_ulasan`, `id_umkm`, `rating`, `komentar`) VALUES
(1, 1, 5, 'Yaminnya enak, porsi pas dan harga terjangkau'),
(2, 2, 4, 'Jajanan cukup variatif dan cocok untuk pelajar'),
(3, 3, 5, 'Wonton chili oil favorit saya, rasanya mantap'),
(4, 4, 4, 'Batagornya gurih dan masih hangat saat disajikan'),
(5, 5, 5, 'Kopinya enak dan banyak pilihan menu'),
(6, 6, 4, 'Seblak pedasnya pas dan topping cukup lengkap'),
(7, 7, 4, 'Crepes renyah dengan harga yang sangat murah'),
(8, 8, 5, 'Pangyami dan ayam gepreknya recommended'),
(9, 9, 5, 'Bumbu gado-gadonya khas dan porsinya banyak'),
(10, 10, 4, 'Menu makanan beragam dan cocok untuk makan siang'),
(11, 11, 4, 'Gorengan selalu fresh dan harganya murah'),
(12, 12, 5, 'Bubur ayamnya enak untuk sarapan'),
(13, 13, 4, 'Chicken steak cukup enak dengan harga terjangkau'),
(14, 14, 4, 'Makaroni basah memiliki cita rasa yang unik'),
(15, 15, 5, 'Lumpia basahnya lezat dan porsinya pas'),
(16, 16, 5, 'Mochinya lembut dengan banyak varian rasa'),
(17, 17, 4, 'Martabak telur gurih dan isinya melimpah'),
(18, 18, 4, 'Minumannya segar dan cocok diminum siang hari'),
(19, 19, 5, 'Takoyakinya lembut dan sausnya enak'),
(20, 20, 4, 'Cilung murah meriah dan cocok untuk camilan'),
(21, 21, 5, 'Siomay dan baso tahunya sangat enak'),
(22, 22, 5, 'Tempat ngopi yang nyaman dengan menu lengkap'),
(23, 23, 4, 'Rujaknya segar dengan bumbu yang pas'),
(24, 24, 5, 'Ayam gepreknya pedas dan porsinya mengenyangkan');

-- --------------------------------------------------------

--
-- Table structure for table `umkm`
--

CREATE TABLE `umkm` (
  `id_umkm` int(11) NOT NULL,
  `nama_umkm` varchar(100) DEFAULT NULL,
  `deskripsi_umkm` text DEFAULT NULL,
  `nomor_kontak` varchar(20) DEFAULT NULL,
  `lokasi` text DEFAULT NULL,
  `patokan` text DEFAULT NULL,
  `status_halal` varchar(30) DEFAULT NULL,
  `link_dokumentasi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `umkm`
--

INSERT INTO `umkm` (`id_umkm`, `nama_umkm`, `deskripsi_umkm`, `nomor_kontak`, `lokasi`, `patokan`, `status_halal`, `link_dokumentasi`) VALUES
(1, 'Yamin Baik', 'Warung yamin rumahan', '85863173970', 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'Dekat lapangan tenis, gedung tennis club KPAD', 'Ada', 'https://drive.google.com/file/d/1H7unOsZYVd37IR-rZbIm_QxnInVhd9Ux/view?usp=sharing'),
(2, 'Tanpa Nama', 'Warung streetfood lokal', '08986687693', 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'Depan SMA Kartika XIX-2', 'Tidak Ada', 'https://drive.google.com/file/d/1IWxFgwtp7y9XxZk6Blgv-JwvzdoinMrB/view?usp=drive_link'),
(3, 'Warung Tieka', 'Warung makanan rumahan', '89529841554', 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'Depan SMA Kartika XIX-2', 'Ada', 'https://drive.google.com/file/d/1GYIRSNBFJ05XrjkxVEAr2OM8LAF4ueWm/view?usp=drive_link'),
(4, 'Batagor', 'Warung batagor dan siomay', NULL, 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'Depan SMA Kartika XIX-2', 'Tidak Ada', 'https://drive.google.com/file/d/1vXS5u2h0IN5u5xDL3NpeXtAHxySxfV1o/view?usp=drive_link'),
(5, 'Kopi Noname', 'Warung kopi dan minuman', '085624374262', 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'Depan SMA Kartika XIX-2', 'Ada', 'https://drive.google.com/file/d/1gDfcgZZrYNFdZZW8vI4QRjdHvHlhy8Nk/view?usp=drive_link'),
(6, 'Seblak Al-Dzikri', 'Warung seblak pedas', '85222888679', 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'KPAD Gerlong', 'Ada', 'https://drive.google.com/file/d/184pXlR0geSRE1pXOXrPy-eJdLrRiTDi8/view?usp=drive_link'),
(7, 'Crepes Sibolang', 'Warung crepes manis', NULL, 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'KPAD Gerlong', 'Tidak Ada', 'https://drive.google.com/file/d/1NL8F9Muz8KJc338r_otcEHQOLJ5zsxXG/view?usp=drive_link'),
(8, 'Warung Pangyami Elmi', 'Warung makanan berat', '81546517472', 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'KPAD Gerlong', 'Ada', 'https://drive.google.com/file/d/1CoAK5xgwhhvpmCtgA1tqNpkBFklpzGOK/view?usp=drive_link'),
(9, 'Gado-Gado Teh Kulsum', 'Warung gado-gado dan lotek', '81225725880', 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'KPAD Gerlong', 'Ada', 'https://drive.google.com/file/d/1ZmhTxsUcwTHM-Cv7u0a3KxgP-uXNjLlO/view?usp=drive_link'),
(10, 'Warung Makan Bunda Fida', 'Warung makan harian', NULL, 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'KPAD Gerlong', 'Tidak Ada', 'https://drive.google.com/file/d/1cn1Z_ROvuwFEzOutVg8T3IZVtyAnYgFb/view?usp=drive_link'),
(11, 'Gorengan', 'Warung gorengan aneka', NULL, 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'KPAD Gerlong', 'Tidak Ada', 'https://drive.google.com/file/d/1hAUmHdxt4v5alyyjKX2nARceib6W_WUK/view?usp=drive_link'),
(12, 'Bubur Ayam Uduk Spesial', 'Warung bubur ayam pagi', NULL, 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'KPAD Gerlong', 'Ada', 'https://drive.google.com/file/d/1BZOJElPvA7obP4SAG-RVUMM0Opiv5ih4/view?usp=drive_link'),
(13, 'Dapoer Teh Marina', 'Warung masakan rumahan', '82214600168', 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'KPAD Gerlong', 'Tidak Ada', 'https://drive.google.com/file/d/1_nl9WdN123ltZD6JdpUJ9AwsfaWJp2Fj/view?usp=drive_link'),
(14, 'Makaroni K Basah', 'Warung makaroni basah', '895326500000', 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'Depan SMA Kartika XIX-2', 'Ada', 'https://drive.google.com/file/d/1eru-8dGymzF3tKuTZXamohjT4KaV7d5f/view?usp=sharing'),
(15, 'Lumpia Basah Echo', 'Warung lumpia basah', NULL, 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'Depan SMA Kartika XIX-2', 'Ada', 'https://drive.google.com/file/d/1eru-8dGymzF3tKuTZXamohjT4KaV7d5f/view?usp=sharing'),
(16, 'Daifuku Mochi Gemoy KPAD', 'Warung mochi dan dessert', '85314028481', 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'Depan SMA Kartika XIX-2', 'Ada', 'https://drive.google.com/file/d/1QXQf-H31rV3JGKdgWG6928xHEUVtNDD3/view?usp=drive_link'),
(17, 'Martabak Telor Titirah', 'Warung martabak telor', '857162000000', 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'Depan SMA Kartika XIX-2', 'Proses', 'https://drive.google.com/file/d/1yOUM1KabE-HtrdIjPBQjrxTu7MiuWN7K/view?usp=drive_link'),
(18, 'Pop Ice Sticky Milk', 'Warung minuman dingin', '881023000000', 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'Sebelah lapangan tenis KPAD', 'Tidak Ada', 'https://drive.google.com/file/d/1eMAE6K1SnyQFlMEIvaxS5gUIsoOLNr5u/view?usp=drive_link'),
(19, 'Hanayoshi Takoyaki', 'Warung takoyaki khas Jepang', '81991606326', 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'Sebelah lapangan tenis KPAD', 'Ada', 'https://drive.google.com/file/d/1YkqVXtRebtU9OI87BLbUFrK1_HgE0bJ4/view?usp=drive_link'),
(20, 'Cilung Jadul', 'Warung cilung pedas', '81322169444', 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'Pasar malam KPAD', 'Ada', 'https://drive.google.com/file/d/1wg93G0k4Zp47voStQZJksXiGFeaiCtN0/view?usp=drive_link'),
(21, 'Baso Tahu Yoga', 'Warung baso tahu', '85722471485', 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'Pasar malam KPAD', 'Ada', 'https://drive.google.com/file/d/1GybjwDlMwZnOvM55k44utGhhqVJrYcVF/view?usp=drive_link'),
(22, 'Tjaritra Coffee', 'Kedai kopi dan minuman', NULL, 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'Pinggir pasar malam KPAD', 'Ada', 'https://drive.google.com/file/d/1ive9Lyc82brgEJpZSeWYHsomT9R9kunv/view?usp=sharing'),
(23, 'Rujak KPAD', 'Warung rujak buah dan sayur', '895806800000', 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'Depan SMA Kartika XIX-2', 'Ada', 'https://drive.google.com/file/d/10VR9zqYHAST8Qa4bNGYJl6PJDYaM5i9_/view?usp=drive_link'),
(24, 'Ayam Geprek Gatra', 'Warung ayam geprek', NULL, 'Jl. Pak Gatot Raya, Gegerkalong, Kec. Sukasari, Kota Bandung, Jawa Barat 40153', 'kpad samping SMA Kartika XIX-2)', 'Ada', 'https://drive.google.com/file/d/1JuJtAakuXalAA46e1fTR25HUGZuJf6M0/view?usp=drive_link');

-- --------------------------------------------------------

--
-- Table structure for table `umkm_metode_pembayaran`
--

CREATE TABLE `umkm_metode_pembayaran` (
  `id` int(11) NOT NULL,
  `id_umkm` int(11) DEFAULT NULL,
  `id_metode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `umkm_metode_pembayaran`
--

INSERT INTO `umkm_metode_pembayaran` (`id`, `id_umkm`, `id_metode`) VALUES
(47, 1, 1),
(48, 1, 2),
(49, 2, 1),
(50, 2, 2),
(51, 3, 1),
(52, 3, 2),
(53, 4, 1),
(54, 5, 1),
(55, 5, 2),
(56, 6, 1),
(57, 6, 2),
(58, 7, 1),
(59, 8, 1),
(60, 8, 2),
(61, 9, 1),
(62, 9, 2),
(63, 10, 1),
(64, 10, 2),
(65, 11, 1),
(66, 11, 2),
(67, 12, 1),
(68, 12, 2),
(69, 13, 1),
(70, 13, 2),
(71, 14, 1),
(72, 14, 2),
(73, 15, 1),
(74, 15, 2),
(75, 16, 1),
(76, 16, 2),
(77, 17, 1),
(78, 17, 2),
(79, 18, 1),
(80, 18, 2),
(81, 19, 1),
(82, 19, 2),
(83, 20, 1),
(84, 20, 2),
(85, 21, 1),
(86, 21, 2),
(87, 22, 1),
(88, 22, 2),
(89, 23, 1),
(90, 23, 2),
(91, 24, 1),
(92, 24, 2);

-- --------------------------------------------------------

--
-- Table structure for table `umkm_mitra_online`
--

CREATE TABLE `umkm_mitra_online` (
  `id` int(11) NOT NULL,
  `id_umkm` int(11) DEFAULT NULL,
  `id_mitra` int(11) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `umkm_mitra_online`
--

INSERT INTO `umkm_mitra_online` (`id`, `id_umkm`, `id_mitra`, `status`) VALUES
(1, 1, 1, 'Aktif'),
(2, 8, 1, 'Aktif'),
(3, 8, 2, 'Aktif'),
(4, 8, 3, 'Aktif'),
(5, 19, 1, 'Aktif'),
(6, 19, 2, 'Aktif'),
(7, 19, 3, 'Aktif'),
(8, 21, 1, 'Aktif'),
(9, 21, 2, 'Aktif'),
(10, 21, 3, 'Aktif'),
(11, 22, 1, 'Aktif'),
(12, 22, 2, 'Aktif'),
(13, 22, 3, 'Aktif'),
(14, 23, 1, 'Aktif'),
(15, 24, 1, 'Aktif');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asal_daerah`
--
ALTER TABLE `asal_daerah`
  ADD PRIMARY KEY (`id_asal`);

--
-- Indexes for table `bahan_baku`
--
ALTER TABLE `bahan_baku`
  ADD PRIMARY KEY (`id_bahan`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indexes for table `jam_operasional`
--
ALTER TABLE `jam_operasional`
  ADD PRIMARY KEY (`id_jam`),
  ADD KEY `id_umkm` (`id_umkm`);

--
-- Indexes for table `kategori_rasa`
--
ALTER TABLE `kategori_rasa`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `id_umkm` (`id_umkm`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_asal` (`id_asal`);

--
-- Indexes for table `metode_pembayaran`
--
ALTER TABLE `metode_pembayaran`
  ADD PRIMARY KEY (`id_metode`);

--
-- Indexes for table `mitra_online`
--
ALTER TABLE `mitra_online`
  ADD PRIMARY KEY (`id_mitra`);

--
-- Indexes for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD PRIMARY KEY (`id_ulasan`),
  ADD KEY `id_umkm` (`id_umkm`);

--
-- Indexes for table `umkm`
--
ALTER TABLE `umkm`
  ADD PRIMARY KEY (`id_umkm`);

--
-- Indexes for table `umkm_metode_pembayaran`
--
ALTER TABLE `umkm_metode_pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_umkm` (`id_umkm`),
  ADD KEY `id_metode` (`id_metode`);

--
-- Indexes for table `umkm_mitra_online`
--
ALTER TABLE `umkm_mitra_online`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_umkm` (`id_umkm`),
  ADD KEY `id_mitra` (`id_mitra`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asal_daerah`
--
ALTER TABLE `asal_daerah`
  MODIFY `id_asal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bahan_baku`
--
ALTER TABLE `bahan_baku`
  MODIFY `id_bahan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=494;

--
-- AUTO_INCREMENT for table `jam_operasional`
--
ALTER TABLE `jam_operasional`
  MODIFY `id_jam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `kategori_rasa`
--
ALTER TABLE `kategori_rasa`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `metode_pembayaran`
--
ALTER TABLE `metode_pembayaran`
  MODIFY `id_metode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mitra_online`
--
ALTER TABLE `mitra_online`
  MODIFY `id_mitra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ulasan`
--
ALTER TABLE `ulasan`
  MODIFY `id_ulasan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `umkm`
--
ALTER TABLE `umkm`
  MODIFY `id_umkm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `umkm_metode_pembayaran`
--
ALTER TABLE `umkm_metode_pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `umkm_mitra_online`
--
ALTER TABLE `umkm_mitra_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bahan_baku`
--
ALTER TABLE `bahan_baku`
  ADD CONSTRAINT `bahan_baku_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);

--
-- Constraints for table `jam_operasional`
--
ALTER TABLE `jam_operasional`
  ADD CONSTRAINT `jam_operasional_ibfk_1` FOREIGN KEY (`id_umkm`) REFERENCES `umkm` (`id_umkm`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`id_umkm`) REFERENCES `umkm` (`id_umkm`),
  ADD CONSTRAINT `menu_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_rasa` (`id_kategori`),
  ADD CONSTRAINT `menu_ibfk_3` FOREIGN KEY (`id_asal`) REFERENCES `asal_daerah` (`id_asal`);

--
-- Constraints for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD CONSTRAINT `ulasan_ibfk_1` FOREIGN KEY (`id_umkm`) REFERENCES `umkm` (`id_umkm`);

--
-- Constraints for table `umkm_metode_pembayaran`
--
ALTER TABLE `umkm_metode_pembayaran`
  ADD CONSTRAINT `umkm_metode_pembayaran_ibfk_1` FOREIGN KEY (`id_umkm`) REFERENCES `umkm` (`id_umkm`),
  ADD CONSTRAINT `umkm_metode_pembayaran_ibfk_2` FOREIGN KEY (`id_metode`) REFERENCES `metode_pembayaran` (`id_metode`);

--
-- Constraints for table `umkm_mitra_online`
--
ALTER TABLE `umkm_mitra_online`
  ADD CONSTRAINT `umkm_mitra_online_ibfk_1` FOREIGN KEY (`id_umkm`) REFERENCES `umkm` (`id_umkm`),
  ADD CONSTRAINT `umkm_mitra_online_ibfk_2` FOREIGN KEY (`id_mitra`) REFERENCES `mitra_online` (`id_mitra`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- ======================================================================
-- SIMULASI TRANSACTION, COMMIT, & ROLLBACK
-- ======================================================================
/*
-- Memulai transaksi
START TRANSACTION;

-- Menyimpan data master UMKM
INSERT INTO umkm (nama_umkm, deskripsi_umkm, patokan, status_halal) 
VALUES ('Nasi Goreng KPAD', 'Nasi goreng babat khas', 'Depan Alfamart', 'Proses');

-- Menyimpan data detail relasi
SET @last_id = LAST_INSERT_ID();
INSERT INTO jam_operasional (id_umkm, hari_buka, jam_buka, jam_tutup) 
VALUES (@last_id, 'Setiap Hari', '17:00:00', '23:00:00');

-- Jika semua instruksi di atas benar dan sesuai, jalankan perintah ini:
COMMIT;

-- Namun, jika di tengah jalan terjadi error/batal, jalankan perintah ini:
-- ROLLBACK;
*/





-- ======================================================================
-- KUMPULAN QUERY WAJIB 
-- ======================================================================

-- ======================================================================
-- 6 QUERY WAJIB FITUR FILTER (DARI IMPLEMENTASI INDEX.PHP)
-- ======================================================================

/* 1. QUERY JAM BUKA & OPERASIONAL (LEFT JOIN)
Menampilkan daftar UMKM beserta detail jam buka dan hari operasionalnya.
*/
/*
SELECT u.id_umkm, u.nama_umkm, jo.hari_buka, jo.jam_buka, jo.jam_tutup
FROM umkm u
LEFT JOIN jam_operasional jo ON u.id_umkm = jo.id_umkm;
*/



/* 2. QUERY RANGE HARGA MENU (SUBQUERY)
Menampilkan UMKM yang memiliki menu dengan rentang harga tertentu (misal: Rp 15.000 - Rp 30.000).
*/
/*
SELECT u.id_umkm, u.nama_umkm, u.deskripsi_umkm
FROM umkm u
WHERE u.id_umkm IN (
    SELECT id_umkm FROM menu WHERE harga BETWEEN 15000 AND 30000
);
*/



/* 3. QUERY MITRA ONLINE (SUBQUERY + JOIN)
Menampilkan UMKM yang bekerjasama dengan platform online tertentu (misal: GoFood).
*/
/*
SELECT u.id_umkm, u.nama_umkm, u.lokasi
FROM umkm u
WHERE u.id_umkm IN (
    SELECT umo.id_umkm 
    FROM umkm_mitra_online umo 
    JOIN mitra_online mo ON umo.id_mitra = mo.id_mitra 
    WHERE mo.nama_platform = 'GoFood'
);
*/



/* 4. QUERY METODE BAYAR (SUBQUERY + JOIN)
Menampilkan UMKM yang mendukung metode pembayaran digital tertentu (misal: QRIS).
*/
/*
SELECT u.id_umkm, u.nama_umkm, u.lokasi
FROM umkm u
WHERE u.id_umkm IN (
    SELECT ump.id_umkm 
    FROM umkm_metode_pembayaran ump 
    JOIN metode_pembayaran mp ON ump.id_metode = mp.id_metode 
    WHERE mp.nama_metode = 'QRIS'
);
*/



/* 5. QUERY STATUS HALAL (WHERE CLAUSE)
Menampilkan daftar UMKM yang sudah memiliki sertifikasi halal secara resmi.
*/
/*
SELECT u.id_umkm, u.nama_umkm, u.status_halal, u.patokan
FROM umkm u
WHERE u.status_halal = 'Ada';
*/




/* 6. QUERY KATEGORI RASA (SUBQUERY + JOIN)
Menampilkan UMKM yang menjual menu dengan kategori rasa tertentu (misal: Pedas).
*/
/*
SELECT u.id_umkm, u.nama_umkm, u.deskripsi_umkm
FROM umkm u
WHERE u.id_umkm IN (
    SELECT m.id_umkm 
    FROM menu m 
    JOIN kategori_rasa kr ON m.id_kategori = kr.id_kategori 
    WHERE kr.nama_kategori = 'Pedas'
);
*/



-- ======================================================================
-- STORED PROCEDURE
-- ======================================================================
DELIMITER $$
CREATE PROCEDURE `GetDetailMenuUMKM`(IN `id_umkm` INT)
BEGIN
    SELECT m.nama_menu, m.harga, kr.nama_kategori, ad.nama_daerah
    FROM menu m
    LEFT JOIN kategori_rasa kr ON m.id_kategori = kr.id_kategori
    LEFT JOIN asal_daerah ad ON m.id_asal = ad.id_asal
    WHERE m.id_umkm = GetDetailMenuUMKM.id_umkm;
END$$
DELIMITER ;


-- ======================================================================
-- TRIGGER
-- ======================================================================
DELIMITER $$
CREATE TRIGGER `Validasi_Rating_Ulasan` 
BEFORE INSERT ON `ulasan` 
FOR EACH ROW 
BEGIN
    IF NEW.rating < 1 THEN
        SET NEW.rating = 1;
    ELSEIF NEW.rating > 5 THEN
        SET NEW.rating = 5;
    END IF;
END$$
DELIMITER ;




