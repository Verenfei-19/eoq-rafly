-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 08, 2024 at 12:09 PM
-- Server version: 8.0.30
-- PHP Version: 8.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yms_eoq_rops`
--

-- --------------------------------------------------------

--
-- Table structure for table `barangs`
--

CREATE TABLE `barangs` (
  `barang_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_barang` int NOT NULL,
  `biaya_penyimpanan` int NOT NULL DEFAULT '0',
  `rop` int NOT NULL DEFAULT '0',
  `ss` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barangs`
--

INSERT INTO `barangs` (`barang_id`, `slug`, `nama_barang`, `harga_barang`, `biaya_penyimpanan`, `rop`, `ss`, `created_at`, `updated_at`) VALUES
('B00001', '6OxfRiNYhXpY0Ckr', 'Oxford putih', 3750, 20000, 0, 0, '2024-11-08 02:59:26', '2024-11-08 02:59:26'),
('B00002', '0geSlRObSnxrLRBG', 'Oxford coklat', 4000, 20000, 0, 0, '2024-11-08 02:59:26', '2024-11-08 02:59:26'),
('B00003', '0PZoQsMjY0eqOGTP', 'Allino kopi susu', 3000, 20000, 0, 0, '2024-11-08 02:59:26', '2024-11-08 02:59:26'),
('B00004', 'EH6sLlXY1qGvBTwY', 'Cemani merah', 2700, 20000, 0, 0, '2024-11-08 02:59:26', '2024-11-08 02:59:26'),
('B00005', 'Lb6HvYKVeE0b0aIx', 'Cemani coklat', 2500, 20000, 0, 0, '2024-11-08 02:59:26', '2024-11-08 02:59:26'),
('B00006', 'S1NprOuZSECuFqzP', 'Cemani dongker', 1000, 20000, 0, 0, '2024-11-08 02:59:26', '2024-11-08 02:59:26'),
('B00007', 'M5ixXIQmRv6Top7v', 'Cemani abu', 6000, 20000, 0, 0, '2024-11-08 02:59:26', '2024-11-08 02:59:26'),
('B00008', 'GgtIvwjRFhTILpZW', 'Cemani putih', 5500, 20000, 0, 0, '2024-11-08 02:59:26', '2024-11-08 02:59:26'),
('B00009', '3NSDgsorv5uRL4MK', 'Cemani hijau', 5500, 20000, 0, 0, '2024-11-08 02:59:26', '2024-11-08 02:59:26');

-- --------------------------------------------------------

--
-- Table structure for table `barang_counters`
--

CREATE TABLE `barang_counters` (
  `barang_counter_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `counter_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barang_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stok_awal` int NOT NULL DEFAULT '0',
  `stok_masuk` int NOT NULL DEFAULT '0',
  `stok_keluar` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barang_gudangs`
--

CREATE TABLE `barang_gudangs` (
  `barang_gudang_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barang_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gudang_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stok_awal` int NOT NULL DEFAULT '0',
  `stok_masuk` int NOT NULL DEFAULT '0',
  `stok_keluar` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barang_gudangs`
--

INSERT INTO `barang_gudangs` (`barang_gudang_id`, `slug`, `barang_id`, `gudang_id`, `stok_awal`, `stok_masuk`, `stok_keluar`, `created_at`, `updated_at`) VALUES
('G00001B00001', 'rKojtrAyQzAZl8Mo', 'B00001', 'G00001', 0, 2165, 0, '2024-11-08 02:59:27', '2024-11-08 04:35:59'),
('G00001B00002', 'BxmzE9LG43pi8185', 'B00002', 'G00001', 0, 2125, 0, '2024-11-08 02:59:27', '2024-11-08 04:37:18'),
('G00001B00003', 'ZiqXWUNrg6AlsiL1', 'B00003', 'G00001', 0, 2172, 0, '2024-11-08 02:59:27', '2024-11-08 04:35:10'),
('G00001B00004', 'DyNGnQz5mN2fe7xG', 'B00004', 'G00001', 0, 2160, 0, '2024-11-08 02:59:27', '2024-11-08 04:36:53'),
('G00001B00005', 'V6efjIFz4Bi0K4ls', 'B00005', 'G00001', 0, 2145, 0, '2024-11-08 02:59:27', '2024-11-08 04:37:18'),
('G00001B00006', 'UOpSBt8u6Ear2fl6', 'B00006', 'G00001', 0, 2155, 0, '2024-11-08 02:59:27', '2024-11-08 04:37:18'),
('G00001B00007', 'FBah1B4dgI1W35IW', 'B00007', 'G00001', 0, 2160, 0, '2024-11-08 02:59:27', '2024-11-08 04:36:28'),
('G00001B00008', 'TAci8LzNyfhxjeNY', 'B00008', 'G00001', 0, 2165, 0, '2024-11-08 02:59:27', '2024-11-08 04:36:53'),
('G00001B00009', 'AgAzQ32dhzjbGoIF', 'B00009', 'G00001', 0, 2150, 0, '2024-11-08 02:59:27', '2024-11-08 04:37:18');

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `counter_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_pemesanans`
--

CREATE TABLE `detail_pemesanans` (
  `id` bigint UNSIGNED NOT NULL,
  `pemesanan_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barang_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eoq` int NOT NULL,
  `jumlah_pemesanan` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_pengiriman_counters`
--

CREATE TABLE `detail_pengiriman_counters` (
  `id` bigint UNSIGNED NOT NULL,
  `pengiriman_counter_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barang_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `persetujuan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_pengiriman` int DEFAULT NULL,
  `gudang_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pengiriman` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualans`
--

CREATE TABLE `detail_penjualans` (
  `id` bigint UNSIGNED NOT NULL,
  `penjualan_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barang_counter_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `subtotal` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_permintaan_counters`
--

CREATE TABLE `detail_permintaan_counters` (
  `id` bigint UNSIGNED NOT NULL,
  `permintaan_counter_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barang_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_permintaan` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_persediaan_masuks`
--

CREATE TABLE `detail_persediaan_masuks` (
  `id` bigint UNSIGNED NOT NULL,
  `persediaan_masuk_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barang_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_persediaan_masuk` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gudangs`
--

CREATE TABLE `gudangs` (
  `gudang_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gudangs`
--

INSERT INTO `gudangs` (`gudang_id`, `slug`, `user_id`, `created_at`, `updated_at`) VALUES
('G00001', 'RwSWQywLFQtwLkQS', 'U00001', '2024-11-08 02:59:27', '2024-11-08 02:59:27');

-- --------------------------------------------------------

--
-- Table structure for table `history_persediaans`
--

CREATE TABLE `history_persediaans` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2023_05_10_042729_create_gudangs_table', 1),
(4, '2023_05_10_043019_create_counters_table', 1),
(5, '2023_05_10_043052_create_barangs_table', 1),
(6, '2023_05_10_043622_create_barang_gudangs_table', 1),
(7, '2023_05_10_043927_create_barang_counters_table', 1),
(8, '2023_05_10_044108_create_pemesanans_table', 1),
(9, '2023_05_10_044239_create_detail_pemesanans_table', 1),
(10, '2023_05_10_044518_create_persediaan_masuks_table', 1),
(11, '2023_05_10_045219_create_detail_persediaan_masuks_table', 1),
(12, '2023_05_10_045417_create_permintaan_counters_table', 1),
(13, '2023_05_10_045637_create_detail_permintaan_counters_table', 1),
(14, '2023_05_10_045930_create_pengiriman_counters_table', 1),
(15, '2023_05_10_050132_create_detail_pengiriman_counters_table', 1),
(16, '2023_05_10_072658_create_penjualans_table', 1),
(17, '2023_05_10_073007_create_detail_penjualans_table', 1),
(18, '2023_06_16_085138_create_history_persediaans_table', 1),
(19, '2024_08_06_011946_create_suppliers_table', 1),
(20, '2024_08_06_055359_create_penjualan_barangs_table', 1),
(21, '2024_09_10_033147_create_pemesanan_barangs_table', 1),
(22, '2024_09_23_091126_create_penjualan_barang_details_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pemesanans`
--

CREATE TABLE `pemesanans` (
  `pemesanan_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_pemesanan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_pemesanan` datetime NOT NULL,
  `biaya_pemesanan` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan_barangs`
--

CREATE TABLE `pemesanan_barangs` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_supplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_datang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_pemesanan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `biaya_pemesanan` int NOT NULL,
  `eoq` int NOT NULL,
  `rop` int NOT NULL,
  `jumlah_pemesanan` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengiriman_counters`
--

CREATE TABLE `pengiriman_counters` (
  `pengiriman_counter_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permintaan_counter_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_pengiriman` date NOT NULL,
  `tanggal_penerimaan` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualans`
--

CREATE TABLE `penjualans` (
  `penjualan_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `counter_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grand_total` int NOT NULL,
  `tanggal_penjualan` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_barangs`
--

CREATE TABLE `penjualan_barangs` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_pembeli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat_pembeli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon_pembeli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_pembelian` date DEFAULT NULL,
  `tgl_pengiriman` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penjualan_barangs`
--

INSERT INTO `penjualan_barangs` (`id`, `invoice_number`, `nama_pembeli`, `alamat_pembeli`, `telepon_pembeli`, `status`, `tgl_pembelian`, `tgl_pengiriman`, `created_at`, `updated_at`) VALUES
(1, 'DTRINVCORA SANTIAGO08112024111234', 'Cora Santiago', 'Maxime nobis tempori', '088212430457', 'DITERIMA', '2024-09-01', NULL, '2024-11-08 04:12:34', '2024-11-08 04:12:34'),
(2, 'DTRINVHAYES MCGOWAN08112024111432', 'Hayes Mcgowan', 'Qui ut et voluptas v', '082134384454', 'DITERIMA', '2024-09-02', NULL, '2024-11-08 04:14:32', '2024-11-08 04:14:32'),
(3, 'DTRINVGERALDINE DECKER08112024111603', 'Geraldine Decker', 'Perspiciatis ipsum', '086405594799', 'DITERIMA', '2024-09-03', NULL, '2024-11-08 04:16:03', '2024-11-08 04:16:03'),
(4, 'DTRINVSCOTT HOGAN08112024111628', 'Scott Hogan', 'Praesentium nisi ver', '086979990261', 'DITERIMA', '2024-09-03', NULL, '2024-11-08 04:16:28', '2024-11-08 04:16:28'),
(5, 'DTRINVLAITH VAZQUEZ08112024111653', 'Laith Vazquez', 'Ipsam vel lorem illo', '086481807456', 'DITERIMA', '2024-09-04', NULL, '2024-11-08 04:16:53', '2024-11-08 04:16:53'),
(6, 'DTRINVKEITH CAMERON08112024111714', 'Keith Cameron', 'Animi non consequat', '086953124615', 'DITERIMA', '2024-09-05', NULL, '2024-11-08 04:17:14', '2024-11-08 04:17:14'),
(7, 'DTRINVKITRA SOLOMON08112024111734', 'Kitra Solomon', 'Qui dolore sint aut', '089932987375', 'DITERIMA', '2024-09-06', NULL, '2024-11-08 04:17:34', '2024-11-08 04:17:34'),
(8, 'DTRINVCARSON STRICKLAND08112024111802', 'Carson Strickland', 'Quis aliquid amet e', '088155664238', 'DITERIMA', '2024-09-07', NULL, '2024-11-08 04:18:02', '2024-11-08 04:18:02'),
(9, 'DTRINVBRYNN MORAN08112024111832', 'Brynn Moran', 'Obcaecati modi sint', '085985990349', 'DITERIMA', '2024-09-08', NULL, '2024-11-08 04:18:32', '2024-11-08 04:18:32'),
(10, 'DTRINVJADE JOHNSON08112024111854', 'Jade Johnson', 'Consequatur Nisi an', '088199974179', 'DITERIMA', '2024-09-09', NULL, '2024-11-08 04:18:54', '2024-11-08 04:18:54'),
(11, 'DTRINVVICTORIA PATTERSON08112024111916', 'Victoria Patterson', 'Quos accusamus aliqu', '086285701920', 'DITERIMA', '2024-09-10', NULL, '2024-11-08 04:19:16', '2024-11-08 04:19:16'),
(12, 'DTRINVHAKEEM SANFORD08112024111946', 'Hakeem Sanford', 'Minim aut illum in', '087901437782', 'DITERIMA', '2024-09-11', NULL, '2024-11-08 04:19:46', '2024-11-08 04:19:46'),
(13, 'DTRINVCAMERON TREVINO08112024112002', 'Cameron Trevino', 'Aliquid numquam eos', '088756394443', 'DITERIMA', '2024-09-12', NULL, '2024-11-08 04:20:02', '2024-11-08 04:20:02'),
(14, 'DTRINVSOPOLINE MCCARTY08112024112021', 'Sopoline Mccarty', 'Illo sed itaque tene', '088923837376', 'DITERIMA', '2024-09-13', NULL, '2024-11-08 04:20:21', '2024-11-08 04:20:21'),
(15, 'DTRINVGAIL WATSON08112024112042', 'Gail Watson', 'Sunt in tempor dolo', '082533798068', 'DITERIMA', '2024-09-14', NULL, '2024-11-08 04:20:42', '2024-11-08 04:20:42'),
(16, 'DTRINVHAYDEN MCCULLOUGH08112024112101', 'Hayden Mccullough', 'Ea deleniti mollit s', '082228189194', 'DITERIMA', '2024-09-15', NULL, '2024-11-08 04:21:01', '2024-11-08 04:21:01'),
(17, 'DTRINVMONA DOTSON08112024112121', 'Mona Dotson', 'Repudiandae dolore n', '089937852826', 'DITERIMA', '2024-09-16', NULL, '2024-11-08 04:21:21', '2024-11-08 04:21:21'),
(18, 'DTRINVKAYE WILLIAMS08112024112203', 'Kaye Williams', 'Officiis delectus e', '088155136612', 'DITERIMA', '2024-09-17', NULL, '2024-11-08 04:22:03', '2024-11-08 04:22:03'),
(19, 'DTRINVTIMOTHY REYES08112024112230', 'Timothy Reyes', 'Sed molestias eos es', '082893160795', 'DITERIMA', '2024-09-18', NULL, '2024-11-08 04:22:30', '2024-11-08 04:22:30'),
(20, 'DTRINVXYLA EATON08112024112249', 'Xyla Eaton', 'Id pariatur Aut dol', '085918988385', 'DITERIMA', '2024-09-19', NULL, '2024-11-08 04:22:49', '2024-11-08 04:22:49'),
(21, 'DTRINVDEMETRIUS FUENTES08112024112305', 'Demetrius Fuentes', 'Perferendis error il', '085773836905', 'DITERIMA', '2024-09-20', NULL, '2024-11-08 04:23:05', '2024-11-08 04:23:05'),
(22, 'DTRINVKANE WILDER08112024112334', 'Kane Wilder', 'Quo anim veniam in', '087498352363', 'DITERIMA', '2024-09-21', NULL, '2024-11-08 04:23:34', '2024-11-08 04:23:34'),
(23, 'DTRINVFAITH WATERS08112024112350', 'Faith Waters', 'Saepe Nam minus cons', '087154657210', 'DITERIMA', '2024-09-22', NULL, '2024-11-08 04:23:51', '2024-11-08 04:23:51'),
(24, 'DTRINVHARRISON CARPENTER08112024112409', 'Harrison Carpenter', 'Laboriosam est dol', '088474389454', 'DITERIMA', '2024-09-23', NULL, '2024-11-08 04:24:09', '2024-11-08 04:24:09'),
(25, 'DTRINVROSE CANTRELL08112024112426', 'Rose Cantrell', 'Et aliquam voluptate', '081688649680', 'DITERIMA', '2024-09-24', NULL, '2024-11-08 04:24:26', '2024-11-08 04:24:26'),
(26, 'DTRINVLYDIA BURKS08112024112448', 'Lydia Burks', 'Quos alias omnis rer', '085309595511', 'DITERIMA', '2024-09-25', NULL, '2024-11-08 04:24:48', '2024-11-08 04:24:48'),
(27, 'DTRINVDAVID RIVERA08112024112510', 'David Rivera', 'Nulla veritatis aut', '086505341703', 'DITERIMA', '2024-09-26', NULL, '2024-11-08 04:25:10', '2024-11-08 04:25:10'),
(28, 'DTRINVMERCEDES PRINCE08112024112528', 'Mercedes Prince', 'Cillum pariatur Nul', '088911774622', 'DITERIMA', '2024-09-27', NULL, '2024-11-08 04:25:28', '2024-11-08 04:25:28'),
(29, 'DTRINVMELANIE WALTERS08112024112549', 'Melanie Walters', 'Pariatur Id non qui', '089392738093', 'DITERIMA', '2024-09-28', NULL, '2024-11-08 04:25:49', '2024-11-08 04:25:49'),
(30, 'DTRINVTANISHA FOREMAN08112024112608', 'Tanisha Foreman', 'Ea enim unde rem quo', '086773095244', 'DITERIMA', '2024-09-29', NULL, '2024-11-08 04:26:08', '2024-11-08 04:26:08'),
(31, 'DTRINVHOLLEE PAUL08112024112624', 'Hollee Paul', 'Deleniti deleniti ni', '088280743431', 'DITERIMA', '2024-09-30', NULL, '2024-11-08 04:26:24', '2024-11-08 04:26:24'),
(32, 'DTRINVSAGE GARDNER08112024112659', 'Sage Gardner', 'Dolor dolor fuga Se', '084907482800', 'DITERIMA', '2024-10-01', NULL, '2024-11-08 04:26:59', '2024-11-08 04:26:59'),
(33, 'DTRINVISABELLA SALINAS08112024112716', 'Isabella Salinas', 'Dolore voluptatum ob', '087342688298', 'DITERIMA', '2024-10-02', NULL, '2024-11-08 04:27:16', '2024-11-08 04:27:16'),
(34, 'DTRINVQUINLAN RICE08112024112729', 'Quinlan Rice', 'Sed irure nihil a im', '081960902886', 'DITERIMA', '2024-10-03', NULL, '2024-11-08 04:27:29', '2024-11-08 04:27:29'),
(35, 'DTRINVSIMON THOMAS08112024112747', 'Simon Thomas', 'Architecto fugiat qu', '089747476302', 'DITERIMA', '2024-10-04', NULL, '2024-11-08 04:27:47', '2024-11-08 04:27:47'),
(36, 'DTRINVEMILY CHAMBERS08112024112807', 'Emily Chambers', 'Ut quidem mollit est', '083653852489', 'DITERIMA', '2024-10-05', NULL, '2024-11-08 04:28:07', '2024-11-08 04:28:07'),
(37, 'DTRINVLUNEA BLEVINS08112024112823', 'Lunea Blevins', 'Ipsam dolor est quid', '081491837551', 'DITERIMA', '2024-10-06', NULL, '2024-11-08 04:28:23', '2024-11-08 04:28:23'),
(38, 'DTRINVAKEEM SHEPPARD08112024112837', 'Akeem Sheppard', 'Ut dolorem sit ad q', '082522348018', 'DITERIMA', '2024-10-07', NULL, '2024-11-08 04:28:37', '2024-11-08 04:28:37'),
(39, 'DTRINVETHAN PAGE08112024112930', 'Ethan Page', 'Maxime aut est delen', '085627413955', 'DITERIMA', '2024-10-08', NULL, '2024-11-08 04:29:30', '2024-11-08 04:29:30'),
(40, 'DTRINVZELENIA FISHER08112024112944', 'Zelenia Fisher', 'Dolore autem harum q', '083615484829', 'DITERIMA', '2024-10-09', NULL, '2024-11-08 04:29:44', '2024-11-08 04:29:44'),
(41, 'DTRINVGISELA RHODES08112024113003', 'Gisela Rhodes', 'Saepe veniam natus', '081785611506', 'DITERIMA', '2024-10-10', NULL, '2024-11-08 04:30:03', '2024-11-08 04:30:03'),
(42, 'DTRINVRIGEL CAMACHO08112024113028', 'Rigel Camacho', 'Laborum odio totam d', '086300883669', 'DITERIMA', '2024-10-11', NULL, '2024-11-08 04:30:28', '2024-11-08 04:30:28'),
(43, 'DTRINVELMO HUMPHREY08112024113045', 'Elmo Humphrey', 'Reiciendis aut dolor', '087908603666', 'DITERIMA', '2024-10-12', NULL, '2024-11-08 04:30:45', '2024-11-08 04:30:45'),
(44, 'DTRINVRAPHAEL COLLIER08112024113102', 'Raphael Collier', 'Suscipit aperiam ass', '089230469757', 'DITERIMA', '2024-10-13', NULL, '2024-11-08 04:31:02', '2024-11-08 04:31:02'),
(45, 'DTRINVTIGER WILLIAMS08112024113122', 'Tiger Williams', 'Commodi consequatur', '088762963107', 'DITERIMA', '2024-10-14', NULL, '2024-11-08 04:31:22', '2024-11-08 04:31:22'),
(46, 'DTRINVVALENTINE BERRY08112024113138', 'Valentine Berry', 'Eiusmod et sed dolor', '085796012888', 'DITERIMA', '2024-10-15', NULL, '2024-11-08 04:31:38', '2024-11-08 04:31:38'),
(47, 'DTRINVSUKI MARTIN08112024113156', 'Suki Martin', 'Anim aute rerum quia', '085498462178', 'DITERIMA', '2024-10-16', NULL, '2024-11-08 04:31:56', '2024-11-08 04:31:56'),
(48, 'DTRINVBYRON WILDER08112024113211', 'Byron Wilder', 'Sapiente eligendi et', '086485060000', 'DITERIMA', '2024-10-17', NULL, '2024-11-08 04:32:11', '2024-11-08 04:32:11'),
(49, 'DTRINVSHAINE ALBERT08112024113225', 'Shaine Albert', 'Voluptatem cupidata', '081330185042', 'DITERIMA', '2024-10-18', NULL, '2024-11-08 04:32:25', '2024-11-08 04:32:25'),
(50, 'DTRINVRINAH HENSON08112024113235', 'Rinah Henson', 'Nulla sint officia t', '083275660286', 'DITERIMA', '2024-10-19', NULL, '2024-11-08 04:32:35', '2024-11-08 04:32:35'),
(51, 'DTRINVTAMEKAH REYNOLDS08112024113250', 'Tamekah Reynolds', 'Magna architecto dig', '083833929221', 'DITERIMA', '2024-10-19', NULL, '2024-11-08 04:32:50', '2024-11-08 04:32:50'),
(52, 'DTRINVGAIL HULL08112024113317', 'Gail Hull', 'Eiusmod possimus au', '086292654637', 'DITERIMA', '2024-10-20', NULL, '2024-11-08 04:33:17', '2024-11-08 04:33:17'),
(53, 'DTRINVMASON MCKENZIE08112024113332', 'Mason Mckenzie', 'Amet numquam dolore', '083465230800', 'DITERIMA', '2024-10-21', NULL, '2024-11-08 04:33:32', '2024-11-08 04:33:32'),
(54, 'DTRINVJILLIAN COLEMAN08112024113350', 'Jillian Coleman', 'Sapiente est labori', '089503654873', 'DITERIMA', '2024-10-22', NULL, '2024-11-08 04:33:50', '2024-11-08 04:33:50'),
(55, 'DTRINVHAYES MARKS08112024113405', 'Hayes Marks', 'Amet sit dolorem a', '082180021602', 'DITERIMA', '2024-10-23', NULL, '2024-11-08 04:34:05', '2024-11-08 04:34:05'),
(56, 'DTRINVPHOEBE WILEY08112024113425', 'Phoebe Wiley', 'Qui voluptas placeat', '087905798770', 'DITERIMA', '2024-10-24', NULL, '2024-11-08 04:34:25', '2024-11-08 04:34:25'),
(57, 'DTRINVKYLYNN WONG08112024113510', 'Kylynn Wong', 'Ut rerum tempor aliq', '082374383555', 'DITERIMA', '2024-10-25', NULL, '2024-11-08 04:35:10', '2024-11-08 04:35:10'),
(58, 'DTRINVKENNEDY BENTLEY08112024113537', 'Kennedy Bentley', 'Rerum dolore nulla e', '084388986090', 'DITERIMA', '2024-10-26', NULL, '2024-11-08 04:35:37', '2024-11-08 04:35:37'),
(59, 'DTRINVRAHIM MARTIN08112024113559', 'Rahim Martin', 'Hic adipisicing et c', '089105292111', 'DITERIMA', '2024-10-27', NULL, '2024-11-08 04:35:59', '2024-11-08 04:35:59'),
(60, 'DTRINVSTONE GORDON08112024113617', 'Stone Gordon', 'Aliquip impedit rep', '088439420229', 'DITERIMA', '2024-10-28', NULL, '2024-11-08 04:36:17', '2024-11-08 04:36:17'),
(61, 'DTRINVBLAKE WOODARD08112024113628', 'Blake Woodard', 'Nesciunt quidem vol', '085586437921', 'DITERIMA', '2024-10-29', NULL, '2024-11-08 04:36:28', '2024-11-08 04:36:28'),
(62, 'DTRINVOCEAN CHURCH08112024113653', 'Ocean Church', 'Nobis dolor sunt mol', '083743706595', 'DITERIMA', '2024-10-30', NULL, '2024-11-08 04:36:53', '2024-11-08 04:36:53'),
(63, 'DTRINVSHAY WOODS08112024113718', 'Shay Woods', 'Aliqua Voluptas qui', '089954737191', 'DITERIMA', '2024-10-31', NULL, '2024-11-08 04:37:18', '2024-11-08 04:37:18');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_barang_details`
--

CREATE TABLE `penjualan_barang_details` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `harga_barang` int NOT NULL,
  `tgl_pembelian` date DEFAULT NULL,
  `tgl_pengiriman` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penjualan_barang_details`
--

INSERT INTO `penjualan_barang_details` (`id`, `invoice_number`, `id_barang`, `nama_barang`, `quantity`, `harga_barang`, `tgl_pembelian`, `tgl_pengiriman`, `created_at`, `updated_at`) VALUES
(1, 'DTRINVCORA SANTIAGO08112024111234', 'B00001', 'Oxford putih', 10, 3750, '2024-09-01', NULL, '2024-11-08 04:12:34', '2024-11-08 04:12:34'),
(2, 'DTRINVCORA SANTIAGO08112024111234', 'B00003', 'Allino kopi susu', 8, 3000, '2024-09-01', NULL, '2024-11-08 04:12:34', '2024-11-08 04:12:34'),
(3, 'DTRINVCORA SANTIAGO08112024111234', 'B00006', 'Cemani dongker', 15, 1000, '2024-09-01', NULL, '2024-11-08 04:12:34', '2024-11-08 04:12:34'),
(4, 'DTRINVHAYES MCGOWAN08112024111432', 'B00002', 'Oxford coklat', 10, 4000, '2024-09-02', NULL, '2024-11-08 04:14:32', '2024-11-08 04:14:32'),
(5, 'DTRINVHAYES MCGOWAN08112024111432', 'B00004', 'Cemani merah', 15, 2700, '2024-09-02', NULL, '2024-11-08 04:14:32', '2024-11-08 04:14:32'),
(6, 'DTRINVHAYES MCGOWAN08112024111432', 'B00007', 'Cemani abu', 20, 6000, '2024-09-02', NULL, '2024-11-08 04:14:32', '2024-11-08 04:14:32'),
(7, 'DTRINVGERALDINE DECKER08112024111603', 'B00003', 'Allino kopi susu', 15, 3000, '2024-09-03', NULL, '2024-11-08 04:16:03', '2024-11-08 04:16:03'),
(8, 'DTRINVGERALDINE DECKER08112024111603', 'B00005', 'Cemani coklat', 10, 2500, '2024-09-03', NULL, '2024-11-08 04:16:03', '2024-11-08 04:16:03'),
(9, 'DTRINVGERALDINE DECKER08112024111603', 'B00008', 'Cemani putih', 10, 5500, '2024-09-03', NULL, '2024-11-08 04:16:03', '2024-11-08 04:16:03'),
(10, 'DTRINVGERALDINE DECKER08112024111603', 'B00009', 'Cemani hijau', 5, 5500, '2024-09-03', NULL, '2024-11-08 04:16:03', '2024-11-08 04:16:03'),
(11, 'DTRINVSCOTT HOGAN08112024111628', 'B00004', 'Cemani merah', 15, 2700, '2024-09-03', NULL, '2024-11-08 04:16:28', '2024-11-08 04:16:28'),
(12, 'DTRINVSCOTT HOGAN08112024111628', 'B00006', 'Cemani dongker', 5, 1000, '2024-09-03', NULL, '2024-11-08 04:16:28', '2024-11-08 04:16:28'),
(13, 'DTRINVSCOTT HOGAN08112024111628', 'B00008', 'Cemani putih', 15, 5500, '2024-09-03', NULL, '2024-11-08 04:16:28', '2024-11-08 04:16:28'),
(14, 'DTRINVLAITH VAZQUEZ08112024111653', 'B00002', 'Oxford coklat', 15, 4000, '2024-09-04', NULL, '2024-11-08 04:16:53', '2024-11-08 04:16:53'),
(15, 'DTRINVLAITH VAZQUEZ08112024111653', 'B00003', 'Allino kopi susu', 10, 3000, '2024-09-04', NULL, '2024-11-08 04:16:53', '2024-11-08 04:16:53'),
(16, 'DTRINVLAITH VAZQUEZ08112024111653', 'B00005', 'Cemani coklat', 10, 2500, '2024-09-04', NULL, '2024-11-08 04:16:53', '2024-11-08 04:16:53'),
(17, 'DTRINVKEITH CAMERON08112024111714', 'B00004', 'Cemani merah', 10, 2700, '2024-09-05', NULL, '2024-11-08 04:17:14', '2024-11-08 04:17:14'),
(18, 'DTRINVKEITH CAMERON08112024111714', 'B00009', 'Cemani hijau', 10, 5500, '2024-09-05', NULL, '2024-11-08 04:17:14', '2024-11-08 04:17:14'),
(19, 'DTRINVKEITH CAMERON08112024111714', 'B00007', 'Cemani abu', 5, 6000, '2024-09-05', NULL, '2024-11-08 04:17:14', '2024-11-08 04:17:14'),
(20, 'DTRINVKITRA SOLOMON08112024111734', 'B00002', 'Oxford coklat', 5, 4000, '2024-09-06', NULL, '2024-11-08 04:17:34', '2024-11-08 04:17:34'),
(21, 'DTRINVKITRA SOLOMON08112024111734', 'B00003', 'Allino kopi susu', 5, 3000, '2024-09-06', NULL, '2024-11-08 04:17:34', '2024-11-08 04:17:34'),
(22, 'DTRINVKITRA SOLOMON08112024111734', 'B00006', 'Cemani dongker', 15, 1000, '2024-09-06', NULL, '2024-11-08 04:17:34', '2024-11-08 04:17:34'),
(23, 'DTRINVCARSON STRICKLAND08112024111802', 'B00001', 'Oxford putih', 5, 3750, '2024-09-07', NULL, '2024-11-08 04:18:02', '2024-11-08 04:18:02'),
(24, 'DTRINVCARSON STRICKLAND08112024111802', 'B00007', 'Cemani abu', 10, 6000, '2024-09-07', NULL, '2024-11-08 04:18:02', '2024-11-08 04:18:02'),
(25, 'DTRINVCARSON STRICKLAND08112024111802', 'B00005', 'Cemani coklat', 20, 2500, '2024-09-07', NULL, '2024-11-08 04:18:02', '2024-11-08 04:18:02'),
(26, 'DTRINVCARSON STRICKLAND08112024111802', 'B00009', 'Cemani hijau', 15, 5500, '2024-09-07', NULL, '2024-11-08 04:18:02', '2024-11-08 04:18:02'),
(27, 'DTRINVBRYNN MORAN08112024111832', 'B00002', 'Oxford coklat', 20, 4000, '2024-09-08', NULL, '2024-11-08 04:18:32', '2024-11-08 04:18:32'),
(28, 'DTRINVBRYNN MORAN08112024111832', 'B00005', 'Cemani coklat', 15, 2500, '2024-09-08', NULL, '2024-11-08 04:18:32', '2024-11-08 04:18:32'),
(29, 'DTRINVBRYNN MORAN08112024111832', 'B00009', 'Cemani hijau', 5, 5500, '2024-09-08', NULL, '2024-11-08 04:18:32', '2024-11-08 04:18:32'),
(30, 'DTRINVBRYNN MORAN08112024111832', 'B00001', 'Oxford putih', 5, 3750, '2024-09-08', NULL, '2024-11-08 04:18:32', '2024-11-08 04:18:32'),
(31, 'DTRINVJADE JOHNSON08112024111854', 'B00006', 'Cemani dongker', 20, 1000, '2024-09-09', NULL, '2024-11-08 04:18:54', '2024-11-08 04:18:54'),
(32, 'DTRINVJADE JOHNSON08112024111854', 'B00004', 'Cemani merah', 20, 2700, '2024-09-09', NULL, '2024-11-08 04:18:54', '2024-11-08 04:18:54'),
(33, 'DTRINVJADE JOHNSON08112024111854', 'B00002', 'Oxford coklat', 10, 4000, '2024-09-09', NULL, '2024-11-08 04:18:54', '2024-11-08 04:18:54'),
(34, 'DTRINVVICTORIA PATTERSON08112024111916', 'B00003', 'Allino kopi susu', 10, 3000, '2024-09-10', NULL, '2024-11-08 04:19:16', '2024-11-08 04:19:16'),
(35, 'DTRINVVICTORIA PATTERSON08112024111916', 'B00007', 'Cemani abu', 10, 6000, '2024-09-10', NULL, '2024-11-08 04:19:16', '2024-11-08 04:19:16'),
(36, 'DTRINVVICTORIA PATTERSON08112024111916', 'B00008', 'Cemani putih', 10, 5500, '2024-09-10', NULL, '2024-11-08 04:19:16', '2024-11-08 04:19:16'),
(37, 'DTRINVHAKEEM SANFORD08112024111946', 'B00007', 'Cemani abu', 5, 6000, '2024-09-11', NULL, '2024-11-08 04:19:46', '2024-11-08 04:19:46'),
(38, 'DTRINVHAKEEM SANFORD08112024111946', 'B00004', 'Cemani merah', 5, 2700, '2024-09-11', NULL, '2024-11-08 04:19:46', '2024-11-08 04:19:46'),
(39, 'DTRINVHAKEEM SANFORD08112024111946', 'B00001', 'Oxford putih', 5, 3750, '2024-09-11', NULL, '2024-11-08 04:19:46', '2024-11-08 04:19:46'),
(40, 'DTRINVCAMERON TREVINO08112024112002', 'B00006', 'Cemani dongker', 10, 1000, '2024-09-12', NULL, '2024-11-08 04:20:02', '2024-11-08 04:20:02'),
(41, 'DTRINVCAMERON TREVINO08112024112002', 'B00005', 'Cemani coklat', 15, 2500, '2024-09-12', NULL, '2024-11-08 04:20:02', '2024-11-08 04:20:02'),
(42, 'DTRINVCAMERON TREVINO08112024112002', 'B00009', 'Cemani hijau', 10, 5500, '2024-09-12', NULL, '2024-11-08 04:20:02', '2024-11-08 04:20:02'),
(43, 'DTRINVSOPOLINE MCCARTY08112024112021', 'B00001', 'Oxford putih', 20, 3750, '2024-09-13', NULL, '2024-11-08 04:20:21', '2024-11-08 04:20:21'),
(44, 'DTRINVSOPOLINE MCCARTY08112024112021', 'B00005', 'Cemani coklat', 15, 2500, '2024-09-13', NULL, '2024-11-08 04:20:21', '2024-11-08 04:20:21'),
(45, 'DTRINVSOPOLINE MCCARTY08112024112021', 'B00008', 'Cemani putih', 5, 5500, '2024-09-13', NULL, '2024-11-08 04:20:21', '2024-11-08 04:20:21'),
(46, 'DTRINVGAIL WATSON08112024112042', 'B00002', 'Oxford coklat', 15, 4000, '2024-09-14', NULL, '2024-11-08 04:20:42', '2024-11-08 04:20:42'),
(47, 'DTRINVGAIL WATSON08112024112042', 'B00004', 'Cemani merah', 15, 2700, '2024-09-14', NULL, '2024-11-08 04:20:42', '2024-11-08 04:20:42'),
(48, 'DTRINVGAIL WATSON08112024112042', 'B00006', 'Cemani dongker', 10, 1000, '2024-09-14', NULL, '2024-11-08 04:20:42', '2024-11-08 04:20:42'),
(49, 'DTRINVGAIL WATSON08112024112042', 'B00008', 'Cemani putih', 15, 5500, '2024-09-14', NULL, '2024-11-08 04:20:42', '2024-11-08 04:20:42'),
(50, 'DTRINVHAYDEN MCCULLOUGH08112024112101', 'B00001', 'Oxford putih', 20, 3750, '2024-09-15', NULL, '2024-11-08 04:21:01', '2024-11-08 04:21:01'),
(51, 'DTRINVHAYDEN MCCULLOUGH08112024112101', 'B00006', 'Cemani dongker', 20, 1000, '2024-09-15', NULL, '2024-11-08 04:21:01', '2024-11-08 04:21:01'),
(52, 'DTRINVHAYDEN MCCULLOUGH08112024112101', 'B00004', 'Cemani merah', 20, 2700, '2024-09-15', NULL, '2024-11-08 04:21:01', '2024-11-08 04:21:01'),
(53, 'DTRINVMONA DOTSON08112024112121', 'B00007', 'Cemani abu', 10, 6000, '2024-09-16', NULL, '2024-11-08 04:21:21', '2024-11-08 04:21:21'),
(54, 'DTRINVMONA DOTSON08112024112121', 'B00008', 'Cemani putih', 10, 5500, '2024-09-16', NULL, '2024-11-08 04:21:21', '2024-11-08 04:21:21'),
(55, 'DTRINVMONA DOTSON08112024112121', 'B00009', 'Cemani hijau', 20, 5500, '2024-09-16', NULL, '2024-11-08 04:21:21', '2024-11-08 04:21:21'),
(56, 'DTRINVKAYE WILLIAMS08112024112203', 'B00005', 'Cemani coklat', 25, 2500, '2024-09-17', NULL, '2024-11-08 04:22:03', '2024-11-08 04:22:03'),
(57, 'DTRINVKAYE WILLIAMS08112024112203', 'B00004', 'Cemani merah', 25, 2700, '2024-09-17', NULL, '2024-11-08 04:22:03', '2024-11-08 04:22:03'),
(58, 'DTRINVKAYE WILLIAMS08112024112203', 'B00007', 'Cemani abu', 10, 6000, '2024-09-17', NULL, '2024-11-08 04:22:03', '2024-11-08 04:22:03'),
(59, 'DTRINVTIMOTHY REYES08112024112230', 'B00004', 'Cemani merah', 25, 2700, '2024-09-18', NULL, '2024-11-08 04:22:30', '2024-11-08 04:22:30'),
(60, 'DTRINVTIMOTHY REYES08112024112230', 'B00009', 'Cemani hijau', 15, 5500, '2024-09-18', NULL, '2024-11-08 04:22:30', '2024-11-08 04:22:30'),
(61, 'DTRINVTIMOTHY REYES08112024112230', 'B00007', 'Cemani abu', 10, 6000, '2024-09-18', NULL, '2024-11-08 04:22:30', '2024-11-08 04:22:30'),
(62, 'DTRINVXYLA EATON08112024112249', 'B00001', 'Oxford putih', 25, 3750, '2024-09-19', NULL, '2024-11-08 04:22:49', '2024-11-08 04:22:49'),
(63, 'DTRINVXYLA EATON08112024112249', 'B00002', 'Oxford coklat', 20, 4000, '2024-09-19', NULL, '2024-11-08 04:22:49', '2024-11-08 04:22:49'),
(64, 'DTRINVXYLA EATON08112024112249', 'B00003', 'Allino kopi susu', 15, 3000, '2024-09-19', NULL, '2024-11-08 04:22:49', '2024-11-08 04:22:49'),
(65, 'DTRINVDEMETRIUS FUENTES08112024112305', 'B00006', 'Cemani dongker', 15, 1000, '2024-09-20', NULL, '2024-11-08 04:23:05', '2024-11-08 04:23:05'),
(66, 'DTRINVDEMETRIUS FUENTES08112024112305', 'B00007', 'Cemani abu', 20, 6000, '2024-09-20', NULL, '2024-11-08 04:23:05', '2024-11-08 04:23:05'),
(67, 'DTRINVDEMETRIUS FUENTES08112024112305', 'B00008', 'Cemani putih', 10, 5500, '2024-09-20', NULL, '2024-11-08 04:23:05', '2024-11-08 04:23:05'),
(68, 'DTRINVKANE WILDER08112024112334', 'B00004', 'Cemani merah', 10, 2700, '2024-09-21', NULL, '2024-11-08 04:23:34', '2024-11-08 04:23:34'),
(69, 'DTRINVKANE WILDER08112024112334', 'B00009', 'Cemani hijau', 25, 5500, '2024-09-21', NULL, '2024-11-08 04:23:34', '2024-11-08 04:23:34'),
(70, 'DTRINVKANE WILDER08112024112334', 'B00008', 'Cemani putih', 25, 5500, '2024-09-21', NULL, '2024-11-08 04:23:34', '2024-11-08 04:23:34'),
(71, 'DTRINVKANE WILDER08112024112334', 'B00003', 'Allino kopi susu', 10, 3000, '2024-09-21', NULL, '2024-11-08 04:23:34', '2024-11-08 04:23:34'),
(72, 'DTRINVKANE WILDER08112024112334', 'B00005', 'Cemani coklat', 5, 2500, '2024-09-21', NULL, '2024-11-08 04:23:34', '2024-11-08 04:23:34'),
(73, 'DTRINVFAITH WATERS08112024112350', 'B00001', 'Oxford putih', 10, 3750, '2024-09-22', NULL, '2024-11-08 04:23:51', '2024-11-08 04:23:51'),
(74, 'DTRINVFAITH WATERS08112024112350', 'B00008', 'Cemani putih', 10, 5500, '2024-09-22', NULL, '2024-11-08 04:23:51', '2024-11-08 04:23:51'),
(75, 'DTRINVHARRISON CARPENTER08112024112409', 'B00004', 'Cemani merah', 10, 2700, '2024-09-23', NULL, '2024-11-08 04:24:09', '2024-11-08 04:24:09'),
(76, 'DTRINVHARRISON CARPENTER08112024112409', 'B00006', 'Cemani dongker', 20, 1000, '2024-09-23', NULL, '2024-11-08 04:24:09', '2024-11-08 04:24:09'),
(77, 'DTRINVHARRISON CARPENTER08112024112409', 'B00008', 'Cemani putih', 10, 5500, '2024-09-23', NULL, '2024-11-08 04:24:09', '2024-11-08 04:24:09'),
(78, 'DTRINVROSE CANTRELL08112024112426', 'B00001', 'Oxford putih', 25, 3750, '2024-09-24', NULL, '2024-11-08 04:24:26', '2024-11-08 04:24:26'),
(79, 'DTRINVROSE CANTRELL08112024112426', 'B00006', 'Cemani dongker', 10, 1000, '2024-09-24', NULL, '2024-11-08 04:24:26', '2024-11-08 04:24:26'),
(80, 'DTRINVROSE CANTRELL08112024112426', 'B00007', 'Cemani abu', 20, 6000, '2024-09-24', NULL, '2024-11-08 04:24:26', '2024-11-08 04:24:26'),
(81, 'DTRINVLYDIA BURKS08112024112448', 'B00003', 'Allino kopi susu', 15, 3000, '2024-09-25', NULL, '2024-11-08 04:24:48', '2024-11-08 04:24:48'),
(82, 'DTRINVLYDIA BURKS08112024112448', 'B00005', 'Cemani coklat', 5, 2500, '2024-09-25', NULL, '2024-11-08 04:24:48', '2024-11-08 04:24:48'),
(83, 'DTRINVLYDIA BURKS08112024112448', 'B00002', 'Oxford coklat', 15, 4000, '2024-09-25', NULL, '2024-11-08 04:24:48', '2024-11-08 04:24:48'),
(84, 'DTRINVDAVID RIVERA08112024112510', 'B00007', 'Cemani abu', 20, 6000, '2024-09-26', NULL, '2024-11-08 04:25:10', '2024-11-08 04:25:10'),
(85, 'DTRINVDAVID RIVERA08112024112510', 'B00003', 'Allino kopi susu', 20, 3000, '2024-09-26', NULL, '2024-11-08 04:25:10', '2024-11-08 04:25:10'),
(86, 'DTRINVDAVID RIVERA08112024112510', 'B00006', 'Cemani dongker', 15, 1000, '2024-09-26', NULL, '2024-11-08 04:25:10', '2024-11-08 04:25:10'),
(87, 'DTRINVMERCEDES PRINCE08112024112528', 'B00001', 'Oxford putih', 20, 3750, '2024-09-27', NULL, '2024-11-08 04:25:28', '2024-11-08 04:25:28'),
(88, 'DTRINVMERCEDES PRINCE08112024112528', 'B00006', 'Cemani dongker', 10, 1000, '2024-09-27', NULL, '2024-11-08 04:25:28', '2024-11-08 04:25:28'),
(89, 'DTRINVMERCEDES PRINCE08112024112528', 'B00008', 'Cemani putih', 20, 5500, '2024-09-27', NULL, '2024-11-08 04:25:28', '2024-11-08 04:25:28'),
(90, 'DTRINVMELANIE WALTERS08112024112549', 'B00005', 'Cemani coklat', 10, 2500, '2024-09-28', NULL, '2024-11-08 04:25:49', '2024-11-08 04:25:49'),
(91, 'DTRINVMELANIE WALTERS08112024112549', 'B00009', 'Cemani hijau', 10, 5500, '2024-09-28', NULL, '2024-11-08 04:25:49', '2024-11-08 04:25:49'),
(92, 'DTRINVMELANIE WALTERS08112024112549', 'B00007', 'Cemani abu', 15, 6000, '2024-09-28', NULL, '2024-11-08 04:25:49', '2024-11-08 04:25:49'),
(93, 'DTRINVTANISHA FOREMAN08112024112608', 'B00002', 'Oxford coklat', 15, 4000, '2024-09-29', NULL, '2024-11-08 04:26:08', '2024-11-08 04:26:08'),
(94, 'DTRINVTANISHA FOREMAN08112024112608', 'B00003', 'Allino kopi susu', 10, 3000, '2024-09-29', NULL, '2024-11-08 04:26:08', '2024-11-08 04:26:08'),
(95, 'DTRINVHOLLEE PAUL08112024112624', 'B00005', 'Cemani coklat', 20, 2500, '2024-09-30', NULL, '2024-11-08 04:26:24', '2024-11-08 04:26:24'),
(96, 'DTRINVHOLLEE PAUL08112024112624', 'B00003', 'Allino kopi susu', 25, 3000, '2024-09-30', NULL, '2024-11-08 04:26:24', '2024-11-08 04:26:24'),
(97, 'DTRINVHOLLEE PAUL08112024112624', 'B00009', 'Cemani hijau', 25, 5500, '2024-09-30', NULL, '2024-11-08 04:26:24', '2024-11-08 04:26:24'),
(98, 'DTRINVSAGE GARDNER08112024112659', 'B00001', 'Oxford putih', 40, 3750, '2024-10-01', NULL, '2024-11-08 04:26:59', '2024-11-08 04:26:59'),
(99, 'DTRINVSAGE GARDNER08112024112659', 'B00005', 'Cemani coklat', 10, 2500, '2024-10-01', NULL, '2024-11-08 04:26:59', '2024-11-08 04:26:59'),
(100, 'DTRINVSAGE GARDNER08112024112659', 'B00008', 'Cemani putih', 10, 5500, '2024-10-01', NULL, '2024-11-08 04:26:59', '2024-11-08 04:26:59'),
(101, 'DTRINVISABELLA SALINAS08112024112716', 'B00003', 'Allino kopi susu', 25, 3000, '2024-10-02', NULL, '2024-11-08 04:27:16', '2024-11-08 04:27:16'),
(102, 'DTRINVISABELLA SALINAS08112024112716', 'B00007', 'Cemani abu', 15, 6000, '2024-10-02', NULL, '2024-11-08 04:27:16', '2024-11-08 04:27:16'),
(103, 'DTRINVQUINLAN RICE08112024112729', 'B00009', 'Cemani hijau', 25, 5500, '2024-10-03', NULL, '2024-11-08 04:27:29', '2024-11-08 04:27:29'),
(104, 'DTRINVQUINLAN RICE08112024112729', 'B00008', 'Cemani putih', 25, 5500, '2024-10-03', NULL, '2024-11-08 04:27:29', '2024-11-08 04:27:29'),
(105, 'DTRINVSIMON THOMAS08112024112747', 'B00002', 'Oxford coklat', 10, 4000, '2024-10-04', NULL, '2024-11-08 04:27:47', '2024-11-08 04:27:47'),
(106, 'DTRINVSIMON THOMAS08112024112747', 'B00005', 'Cemani coklat', 25, 2500, '2024-10-04', NULL, '2024-11-08 04:27:47', '2024-11-08 04:27:47'),
(107, 'DTRINVSIMON THOMAS08112024112747', 'B00006', 'Cemani dongker', 20, 1000, '2024-10-04', NULL, '2024-11-08 04:27:47', '2024-11-08 04:27:47'),
(108, 'DTRINVEMILY CHAMBERS08112024112807', 'B00002', 'Oxford coklat', 40, 4000, '2024-10-05', NULL, '2024-11-08 04:28:07', '2024-11-08 04:28:07'),
(109, 'DTRINVEMILY CHAMBERS08112024112807', 'B00004', 'Cemani merah', 40, 2700, '2024-10-05', NULL, '2024-11-08 04:28:07', '2024-11-08 04:28:07'),
(110, 'DTRINVEMILY CHAMBERS08112024112807', 'B00007', 'Cemani abu', 20, 6000, '2024-10-05', NULL, '2024-11-08 04:28:07', '2024-11-08 04:28:07'),
(111, 'DTRINVLUNEA BLEVINS08112024112823', 'B00007', 'Cemani abu', 20, 6000, '2024-10-06', NULL, '2024-11-08 04:28:23', '2024-11-08 04:28:23'),
(112, 'DTRINVLUNEA BLEVINS08112024112823', 'B00005', 'Cemani coklat', 15, 2500, '2024-10-06', NULL, '2024-11-08 04:28:23', '2024-11-08 04:28:23'),
(113, 'DTRINVAKEEM SHEPPARD08112024112837', 'B00001', 'Oxford putih', 15, 3750, '2024-10-07', NULL, '2024-11-08 04:28:37', '2024-11-08 04:28:37'),
(114, 'DTRINVAKEEM SHEPPARD08112024112837', 'B00008', 'Cemani putih', 25, 5500, '2024-10-07', NULL, '2024-11-08 04:28:37', '2024-11-08 04:28:37'),
(115, 'DTRINVETHAN PAGE08112024112930', 'B00003', 'Allino kopi susu', 25, 3000, '2024-10-08', NULL, '2024-11-08 04:29:30', '2024-11-08 04:29:30'),
(116, 'DTRINVETHAN PAGE08112024112930', 'B00009', 'Cemani hijau', 25, 5500, '2024-10-08', NULL, '2024-11-08 04:29:30', '2024-11-08 04:29:30'),
(117, 'DTRINVZELENIA FISHER08112024112944', 'B00002', 'Oxford coklat', 25, 4000, '2024-10-09', NULL, '2024-11-08 04:29:44', '2024-11-08 04:29:44'),
(118, 'DTRINVZELENIA FISHER08112024112944', 'B00006', 'Cemani dongker', 10, 1000, '2024-10-09', NULL, '2024-11-08 04:29:44', '2024-11-08 04:29:44'),
(119, 'DTRINVGISELA RHODES08112024113003', 'B00004', 'Cemani merah', 10, 2700, '2024-10-10', NULL, '2024-11-08 04:30:03', '2024-11-08 04:30:03'),
(120, 'DTRINVGISELA RHODES08112024113003', 'B00002', 'Oxford coklat', 40, 4000, '2024-10-10', NULL, '2024-11-08 04:30:03', '2024-11-08 04:30:03'),
(121, 'DTRINVGISELA RHODES08112024113003', 'B00009', 'Cemani hijau', 40, 5500, '2024-10-10', NULL, '2024-11-08 04:30:03', '2024-11-08 04:30:03'),
(122, 'DTRINVRIGEL CAMACHO08112024113028', 'B00001', 'Oxford putih', 25, 3750, '2024-10-11', NULL, '2024-11-08 04:30:28', '2024-11-08 04:30:28'),
(123, 'DTRINVRIGEL CAMACHO08112024113028', 'B00003', 'Allino kopi susu', 15, 3000, '2024-10-11', NULL, '2024-11-08 04:30:28', '2024-11-08 04:30:28'),
(124, 'DTRINVRIGEL CAMACHO08112024113028', 'B00005', 'Cemani coklat', 10, 2500, '2024-10-11', NULL, '2024-11-08 04:30:28', '2024-11-08 04:30:28'),
(125, 'DTRINVRIGEL CAMACHO08112024113028', 'B00008', 'Cemani putih', 10, 5500, '2024-10-11', NULL, '2024-11-08 04:30:28', '2024-11-08 04:30:28'),
(126, 'DTRINVELMO HUMPHREY08112024113045', 'B00008', 'Cemani putih', 20, 5500, '2024-10-12', NULL, '2024-11-08 04:30:45', '2024-11-08 04:30:45'),
(127, 'DTRINVELMO HUMPHREY08112024113045', 'B00001', 'Oxford putih', 25, 3750, '2024-10-12', NULL, '2024-11-08 04:30:45', '2024-11-08 04:30:45'),
(128, 'DTRINVELMO HUMPHREY08112024113045', 'B00006', 'Cemani dongker', 40, 1000, '2024-10-12', NULL, '2024-11-08 04:30:45', '2024-11-08 04:30:45'),
(129, 'DTRINVRAPHAEL COLLIER08112024113102', 'B00001', 'Oxford putih', 10, 3750, '2024-10-13', NULL, '2024-11-08 04:31:02', '2024-11-08 04:31:02'),
(130, 'DTRINVRAPHAEL COLLIER08112024113102', 'B00003', 'Allino kopi susu', 25, 3000, '2024-10-13', NULL, '2024-11-08 04:31:02', '2024-11-08 04:31:02'),
(131, 'DTRINVRAPHAEL COLLIER08112024113102', 'B00007', 'Cemani abu', 10, 6000, '2024-10-13', NULL, '2024-11-08 04:31:02', '2024-11-08 04:31:02'),
(132, 'DTRINVTIGER WILLIAMS08112024113122', 'B00004', 'Cemani merah', 20, 2700, '2024-10-14', NULL, '2024-11-08 04:31:22', '2024-11-08 04:31:22'),
(133, 'DTRINVTIGER WILLIAMS08112024113122', 'B00001', 'Oxford putih', 15, 3750, '2024-10-14', NULL, '2024-11-08 04:31:22', '2024-11-08 04:31:22'),
(134, 'DTRINVTIGER WILLIAMS08112024113122', 'B00009', 'Cemani hijau', 25, 5500, '2024-10-14', NULL, '2024-11-08 04:31:22', '2024-11-08 04:31:22'),
(135, 'DTRINVVALENTINE BERRY08112024113138', 'B00005', 'Cemani coklat', 40, 2500, '2024-10-15', NULL, '2024-11-08 04:31:38', '2024-11-08 04:31:38'),
(136, 'DTRINVVALENTINE BERRY08112024113138', 'B00007', 'Cemani abu', 25, 6000, '2024-10-15', NULL, '2024-11-08 04:31:38', '2024-11-08 04:31:38'),
(137, 'DTRINVSUKI MARTIN08112024113156', 'B00007', 'Cemani abu', 15, 6000, '2024-10-16', NULL, '2024-11-08 04:31:56', '2024-11-08 04:31:56'),
(138, 'DTRINVSUKI MARTIN08112024113156', 'B00003', 'Allino kopi susu', 20, 3000, '2024-10-16', NULL, '2024-11-08 04:31:56', '2024-11-08 04:31:56'),
(139, 'DTRINVBYRON WILDER08112024113211', 'B00002', 'Oxford coklat', 20, 4000, '2024-10-17', NULL, '2024-11-08 04:32:11', '2024-11-08 04:32:11'),
(140, 'DTRINVBYRON WILDER08112024113211', 'B00001', 'Oxford putih', 20, 3750, '2024-10-17', NULL, '2024-11-08 04:32:11', '2024-11-08 04:32:11'),
(141, 'DTRINVBYRON WILDER08112024113211', 'B00009', 'Cemani hijau', 20, 5500, '2024-10-17', NULL, '2024-11-08 04:32:11', '2024-11-08 04:32:11'),
(142, 'DTRINVSHAINE ALBERT08112024113225', 'B00006', 'Cemani dongker', 25, 1000, '2024-10-18', NULL, '2024-11-08 04:32:25', '2024-11-08 04:32:25'),
(143, 'DTRINVSHAINE ALBERT08112024113225', 'B00005', 'Cemani coklat', 25, 2500, '2024-10-18', NULL, '2024-11-08 04:32:25', '2024-11-08 04:32:25'),
(144, 'DTRINVRINAH HENSON08112024113235', 'B00008', 'Cemani putih', 40, 5500, '2024-10-19', NULL, '2024-11-08 04:32:35', '2024-11-08 04:32:35'),
(145, 'DTRINVTAMEKAH REYNOLDS08112024113250', 'B00003', 'Allino kopi susu', 15, 3000, '2024-10-19', NULL, '2024-11-08 04:32:50', '2024-11-08 04:32:50'),
(146, 'DTRINVTAMEKAH REYNOLDS08112024113250', 'B00002', 'Oxford coklat', 15, 4000, '2024-10-19', NULL, '2024-11-08 04:32:50', '2024-11-08 04:32:50'),
(147, 'DTRINVGAIL HULL08112024113317', 'B00006', 'Cemani dongker', 40, 1000, '2024-10-20', NULL, '2024-11-08 04:33:17', '2024-11-08 04:33:17'),
(148, 'DTRINVGAIL HULL08112024113317', 'B00005', 'Cemani coklat', 15, 2500, '2024-10-20', NULL, '2024-11-08 04:33:17', '2024-11-08 04:33:17'),
(149, 'DTRINVMASON MCKENZIE08112024113332', 'B00002', 'Oxford coklat', 15, 4000, '2024-10-21', NULL, '2024-11-08 04:33:32', '2024-11-08 04:33:32'),
(150, 'DTRINVMASON MCKENZIE08112024113332', 'B00004', 'Cemani merah', 15, 2700, '2024-10-21', NULL, '2024-11-08 04:33:32', '2024-11-08 04:33:32'),
(151, 'DTRINVJILLIAN COLEMAN08112024113350', 'B00004', 'Cemani merah', 40, 2700, '2024-10-22', NULL, '2024-11-08 04:33:50', '2024-11-08 04:33:50'),
(152, 'DTRINVJILLIAN COLEMAN08112024113350', 'B00007', 'Cemani abu', 40, 6000, '2024-10-22', NULL, '2024-11-08 04:33:50', '2024-11-08 04:33:50'),
(153, 'DTRINVHAYES MARKS08112024113405', 'B00003', 'Allino kopi susu', 20, 3000, '2024-10-23', NULL, '2024-11-08 04:34:05', '2024-11-08 04:34:05'),
(154, 'DTRINVHAYES MARKS08112024113405', 'B00008', 'Cemani putih', 15, 5500, '2024-10-23', NULL, '2024-11-08 04:34:05', '2024-11-08 04:34:05'),
(155, 'DTRINVPHOEBE WILEY08112024113425', 'B00008', 'Cemani putih', 25, 5500, '2024-10-24', NULL, '2024-11-08 04:34:25', '2024-11-08 04:34:25'),
(156, 'DTRINVPHOEBE WILEY08112024113425', 'B00009', 'Cemani hijau', 25, 5500, '2024-10-24', NULL, '2024-11-08 04:34:25', '2024-11-08 04:34:25'),
(157, 'DTRINVPHOEBE WILEY08112024113425', 'B00002', 'Oxford coklat', 5, 4000, '2024-10-24', NULL, '2024-11-08 04:34:25', '2024-11-08 04:34:25'),
(158, 'DTRINVKYLYNN WONG08112024113510', 'B00005', 'Cemani coklat', 25, 2500, '2024-10-25', NULL, '2024-11-08 04:35:10', '2024-11-08 04:35:10'),
(159, 'DTRINVKYLYNN WONG08112024113510', 'B00003', 'Allino kopi susu', 40, 3000, '2024-10-25', NULL, '2024-11-08 04:35:10', '2024-11-08 04:35:10'),
(160, 'DTRINVKENNEDY BENTLEY08112024113537', 'B00009', 'Cemani hijau', 25, 5500, '2024-10-26', NULL, '2024-11-08 04:35:37', '2024-11-08 04:35:37'),
(161, 'DTRINVKENNEDY BENTLEY08112024113537', 'B00004', 'Cemani merah', 5, 2700, '2024-10-26', NULL, '2024-11-08 04:35:37', '2024-11-08 04:35:37'),
(162, 'DTRINVKENNEDY BENTLEY08112024113537', 'B00001', 'Oxford putih', 5, 3750, '2024-10-26', NULL, '2024-11-08 04:35:37', '2024-11-08 04:35:37'),
(163, 'DTRINVRAHIM MARTIN08112024113559', 'B00002', 'Oxford coklat', 40, 4000, '2024-10-27', NULL, '2024-11-08 04:35:59', '2024-11-08 04:35:59'),
(164, 'DTRINVRAHIM MARTIN08112024113559', 'B00001', 'Oxford putih', 35, 3750, '2024-10-27', NULL, '2024-11-08 04:35:59', '2024-11-08 04:35:59'),
(165, 'DTRINVRAHIM MARTIN08112024113559', 'B00006', 'Cemani dongker', 20, 1000, '2024-10-27', NULL, '2024-11-08 04:35:59', '2024-11-08 04:35:59'),
(166, 'DTRINVSTONE GORDON08112024113617', 'B00004', 'Cemani merah', 25, 2700, '2024-10-28', NULL, '2024-11-08 04:36:17', '2024-11-08 04:36:17'),
(167, 'DTRINVSTONE GORDON08112024113617', 'B00002', 'Oxford coklat', 15, 4000, '2024-10-28', NULL, '2024-11-08 04:36:17', '2024-11-08 04:36:17'),
(168, 'DTRINVBLAKE WOODARD08112024113628', 'B00007', 'Cemani abu', 40, 6000, '2024-10-29', NULL, '2024-11-08 04:36:28', '2024-11-08 04:36:28'),
(169, 'DTRINVOCEAN CHURCH08112024113653', 'B00002', 'Oxford coklat', 10, 4000, '2024-10-30', NULL, '2024-11-08 04:36:53', '2024-11-08 04:36:53'),
(170, 'DTRINVOCEAN CHURCH08112024113653', 'B00004', 'Cemani merah', 15, 2700, '2024-10-30', NULL, '2024-11-08 04:36:53', '2024-11-08 04:36:53'),
(171, 'DTRINVOCEAN CHURCH08112024113653', 'B00008', 'Cemani putih', 25, 5500, '2024-10-30', NULL, '2024-11-08 04:36:53', '2024-11-08 04:36:53'),
(172, 'DTRINVSHAY WOODS08112024113718', 'B00006', 'Cemani dongker', 25, 1000, '2024-10-31', NULL, '2024-11-08 04:37:18', '2024-11-08 04:37:18'),
(173, 'DTRINVSHAY WOODS08112024113718', 'B00009', 'Cemani hijau', 25, 5500, '2024-10-31', NULL, '2024-11-08 04:37:18', '2024-11-08 04:37:18'),
(174, 'DTRINVSHAY WOODS08112024113718', 'B00002', 'Oxford coklat', 15, 4000, '2024-10-31', NULL, '2024-11-08 04:37:18', '2024-11-08 04:37:18'),
(175, 'DTRINVSHAY WOODS08112024113718', 'B00005', 'Cemani coklat', 40, 2500, '2024-10-31', NULL, '2024-11-08 04:37:18', '2024-11-08 04:37:18');

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_counters`
--

CREATE TABLE `permintaan_counters` (
  `permintaan_counter_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `counter_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_permintaan` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `persediaan_masuks`
--

CREATE TABLE `persediaan_masuks` (
  `persediaan_masuk_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pemesanan_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_persediaan_masuk` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `nama`, `telepon`, `alamat`, `id_barang`, `waktu`, `created_at`, `updated_at`) VALUES
(1, 'CITRA TEXTILE', '085501697174', 'MALANG', 'B00004', 5, '2024-11-08 05:03:15', '2024-11-08 05:03:15'),
(2, 'CITRA TEXTILE', '085501697174', 'MALANG', 'B00005', 4, '2024-11-08 05:04:08', '2024-11-08 05:04:08'),
(3, 'CITRA TEXTILE', '085501697174', 'MALANG', 'B00006', 4, '2024-11-08 05:04:32', '2024-11-08 05:04:32'),
(4, 'CITRA TEXTILE', '085501697174', 'MALANG', 'B00007', 6, '2024-11-08 05:04:53', '2024-11-08 05:04:53'),
(5, 'CITRA TEXTILE', '085501697174', 'MALANG', 'B00008', 2, '2024-11-08 05:05:17', '2024-11-08 05:05:17'),
(6, 'CITRA TEXTILE', '085501697174', 'MALANG', 'B00009', 3, '2024-11-08 05:05:36', '2024-11-08 05:05:36'),
(7, 'PT SRITEX', '089283655249', 'SOLO', 'B00001', 5, '2024-11-08 05:06:06', '2024-11-08 05:06:06'),
(8, 'PT SRITEX', '089283655249', 'SOLO', 'B00002', 4, '2024-11-08 05:06:40', '2024-11-08 05:06:40'),
(9, 'PT SRITEX', '089283655249', 'SOLO', 'B00003', 5, '2024-11-08 05:06:58', '2024-11-08 05:06:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `slug`, `telepon`, `name`, `address`, `username`, `password`, `role`, `status`, `created_at`, `updated_at`) VALUES
('U00001', '7fyHaUQCbC0v4rVF', '081231241241', 'Gudang Pusat', 'Jl. Kyai Tambak Deres No.229, Kota Surabaya, Jawa Timur', 'gudangpusat', '$2y$10$5HIH6PKTwB203efovV/bhOT8SeZtPRL.IjZ/pZrVazaXio/jHhh0.', 'gudang', 'Active', '2024-11-08 02:59:26', '2024-11-08 02:59:26'),
('U00002', 'gAkBBEKohFEEnt0j', '08224123123', 'Toko 1', 'Jl. Keputih Tegal No.29, Kota Surabaya, Jawa Timur', 'toko1', '$2y$10$r4OAsoFa6urUytdKmXNZLeqBN9IFyf175QrWYR0NBIGhEHYrCEpiK', 'counter', 'Active', '2024-11-08 02:59:26', '2024-11-08 02:59:26'),
('U00003', '4n55etnYqSslV0Kc', '08224120802832', 'Toko 2', 'Jl. Raya Wiyung No.674, Kota Surabaya, Jawa Timur', 'toko2', '$2y$10$CYEnL.cR4ARI5/V3ooRRWeUhrwHfRFIGCPZVEwYotL4.JYxZSD9S2', 'counter', 'Active', '2024-11-08 02:59:26', '2024-11-08 02:59:26'),
('U00004', 'IZUHakTyOb4ys7Fs', '0822412412390', 'Toko 3', 'Jl. Rungkut Asri Tengah No.21, Kota Surabaya, Jawa Timur', 'toko3', '$2y$10$UVYEJkfkofI/MjMA1jEIHupwScr3eOuHkU4ddJGeITw.8wlECvvYK', 'counter', 'Active', '2024-11-08 02:59:26', '2024-11-08 02:59:26'),
('U00005', 'lJy6f4YkHLcnSdvo', '0812348728372', 'Owner', '-', 'owner', '$2y$10$uceX8BSGNmoCw1gqiYngku1IAeDl8l8CIZqEdzfCuOhnhyQDKi26e', 'owner', 'Active', '2024-11-08 02:59:27', '2024-11-08 02:59:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barangs`
--
ALTER TABLE `barangs`
  ADD PRIMARY KEY (`barang_id`),
  ADD UNIQUE KEY `unique_nama_barang` (`nama_barang`),
  ADD KEY `barangs_barang_id_index` (`barang_id`);

--
-- Indexes for table `barang_counters`
--
ALTER TABLE `barang_counters`
  ADD PRIMARY KEY (`barang_counter_id`),
  ADD KEY `barang_counters_barang_id_foreign` (`barang_id`),
  ADD KEY `barang_counters_counter_id_foreign` (`counter_id`),
  ADD KEY `barang_counters_barang_counter_id_barang_id_counter_id_index` (`barang_counter_id`,`barang_id`,`counter_id`);

--
-- Indexes for table `barang_gudangs`
--
ALTER TABLE `barang_gudangs`
  ADD PRIMARY KEY (`barang_gudang_id`),
  ADD KEY `barang_gudangs_barang_id_foreign` (`barang_id`),
  ADD KEY `barang_gudangs_gudang_id_foreign` (`gudang_id`),
  ADD KEY `barang_gudangs_barang_gudang_id_barang_id_index` (`barang_gudang_id`,`barang_id`);

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`counter_id`),
  ADD KEY `counters_user_id_foreign` (`user_id`);

--
-- Indexes for table `detail_pemesanans`
--
ALTER TABLE `detail_pemesanans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_pemesanans_pemesanan_id_foreign` (`pemesanan_id`),
  ADD KEY `detail_pemesanans_barang_id_foreign` (`barang_id`);

--
-- Indexes for table `detail_pengiriman_counters`
--
ALTER TABLE `detail_pengiriman_counters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_pengiriman_counters_pengiriman_counter_id_foreign` (`pengiriman_counter_id`),
  ADD KEY `detail_pengiriman_counters_barang_id_foreign` (`barang_id`),
  ADD KEY `detail_pengiriman_counters_gudang_id_foreign` (`gudang_id`),
  ADD KEY `detail_pengiriman_counters_counter_id_foreign` (`counter_id`);

--
-- Indexes for table `detail_penjualans`
--
ALTER TABLE `detail_penjualans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_penjualans_penjualan_id_index` (`penjualan_id`),
  ADD KEY `detail_penjualans_barang_counter_id_index` (`barang_counter_id`);

--
-- Indexes for table `detail_permintaan_counters`
--
ALTER TABLE `detail_permintaan_counters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_permintaan_counters_permintaan_counter_id_foreign` (`permintaan_counter_id`),
  ADD KEY `detail_permintaan_counters_barang_id_foreign` (`barang_id`);

--
-- Indexes for table `detail_persediaan_masuks`
--
ALTER TABLE `detail_persediaan_masuks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_persediaan_masuks_persediaan_masuk_id_foreign` (`persediaan_masuk_id`),
  ADD KEY `detail_persediaan_masuks_barang_id_foreign` (`barang_id`);

--
-- Indexes for table `gudangs`
--
ALTER TABLE `gudangs`
  ADD PRIMARY KEY (`gudang_id`),
  ADD KEY `gudangs_user_id_foreign` (`user_id`);

--
-- Indexes for table `history_persediaans`
--
ALTER TABLE `history_persediaans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemesanans`
--
ALTER TABLE `pemesanans`
  ADD PRIMARY KEY (`pemesanan_id`);

--
-- Indexes for table `pemesanan_barangs`
--
ALTER TABLE `pemesanan_barangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengiriman_counters`
--
ALTER TABLE `pengiriman_counters`
  ADD PRIMARY KEY (`pengiriman_counter_id`),
  ADD KEY `pengiriman_counters_permintaan_counter_id_foreign` (`permintaan_counter_id`);

--
-- Indexes for table `penjualans`
--
ALTER TABLE `penjualans`
  ADD PRIMARY KEY (`penjualan_id`),
  ADD KEY `penjualans_penjualan_id_index` (`penjualan_id`),
  ADD KEY `penjualans_counter_id_index` (`counter_id`),
  ADD KEY `penjualans_tanggal_penjualan_index` (`tanggal_penjualan`);

--
-- Indexes for table `penjualan_barangs`
--
ALTER TABLE `penjualan_barangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan_barang_details`
--
ALTER TABLE `penjualan_barang_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permintaan_counters`
--
ALTER TABLE `permintaan_counters`
  ADD PRIMARY KEY (`permintaan_counter_id`),
  ADD KEY `permintaan_counters_counter_id_foreign` (`counter_id`);

--
-- Indexes for table `persediaan_masuks`
--
ALTER TABLE `persediaan_masuks`
  ADD PRIMARY KEY (`persediaan_masuk_id`),
  ADD KEY `persediaan_masuks_pemesanan_id_foreign` (`pemesanan_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_name_unique` (`name`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_pemesanans`
--
ALTER TABLE `detail_pemesanans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_pengiriman_counters`
--
ALTER TABLE `detail_pengiriman_counters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_penjualans`
--
ALTER TABLE `detail_penjualans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_permintaan_counters`
--
ALTER TABLE `detail_permintaan_counters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_persediaan_masuks`
--
ALTER TABLE `detail_persediaan_masuks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history_persediaans`
--
ALTER TABLE `history_persediaans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pemesanan_barangs`
--
ALTER TABLE `pemesanan_barangs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penjualan_barangs`
--
ALTER TABLE `penjualan_barangs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `penjualan_barang_details`
--
ALTER TABLE `penjualan_barang_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang_counters`
--
ALTER TABLE `barang_counters`
  ADD CONSTRAINT `barang_counters_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barangs` (`barang_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `barang_counters_counter_id_foreign` FOREIGN KEY (`counter_id`) REFERENCES `counters` (`counter_id`) ON DELETE CASCADE;

--
-- Constraints for table `barang_gudangs`
--
ALTER TABLE `barang_gudangs`
  ADD CONSTRAINT `barang_gudangs_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barangs` (`barang_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `barang_gudangs_gudang_id_foreign` FOREIGN KEY (`gudang_id`) REFERENCES `gudangs` (`gudang_id`) ON DELETE CASCADE;

--
-- Constraints for table `counters`
--
ALTER TABLE `counters`
  ADD CONSTRAINT `counters_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `detail_pemesanans`
--
ALTER TABLE `detail_pemesanans`
  ADD CONSTRAINT `detail_pemesanans_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barangs` (`barang_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_pemesanans_pemesanan_id_foreign` FOREIGN KEY (`pemesanan_id`) REFERENCES `pemesanans` (`pemesanan_id`) ON DELETE CASCADE;

--
-- Constraints for table `detail_pengiriman_counters`
--
ALTER TABLE `detail_pengiriman_counters`
  ADD CONSTRAINT `detail_pengiriman_counters_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barangs` (`barang_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_pengiriman_counters_counter_id_foreign` FOREIGN KEY (`counter_id`) REFERENCES `counters` (`counter_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_pengiriman_counters_gudang_id_foreign` FOREIGN KEY (`gudang_id`) REFERENCES `gudangs` (`gudang_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_pengiriman_counters_pengiriman_counter_id_foreign` FOREIGN KEY (`pengiriman_counter_id`) REFERENCES `pengiriman_counters` (`pengiriman_counter_id`) ON DELETE CASCADE;

--
-- Constraints for table `detail_penjualans`
--
ALTER TABLE `detail_penjualans`
  ADD CONSTRAINT `detail_penjualans_barang_counter_id_foreign` FOREIGN KEY (`barang_counter_id`) REFERENCES `barang_counters` (`barang_counter_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_penjualans_penjualan_id_foreign` FOREIGN KEY (`penjualan_id`) REFERENCES `penjualans` (`penjualan_id`) ON DELETE CASCADE;

--
-- Constraints for table `detail_permintaan_counters`
--
ALTER TABLE `detail_permintaan_counters`
  ADD CONSTRAINT `detail_permintaan_counters_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barangs` (`barang_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_permintaan_counters_permintaan_counter_id_foreign` FOREIGN KEY (`permintaan_counter_id`) REFERENCES `permintaan_counters` (`permintaan_counter_id`) ON DELETE CASCADE;

--
-- Constraints for table `detail_persediaan_masuks`
--
ALTER TABLE `detail_persediaan_masuks`
  ADD CONSTRAINT `detail_persediaan_masuks_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barangs` (`barang_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_persediaan_masuks_persediaan_masuk_id_foreign` FOREIGN KEY (`persediaan_masuk_id`) REFERENCES `persediaan_masuks` (`persediaan_masuk_id`) ON DELETE CASCADE;

--
-- Constraints for table `gudangs`
--
ALTER TABLE `gudangs`
  ADD CONSTRAINT `gudangs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `pengiriman_counters`
--
ALTER TABLE `pengiriman_counters`
  ADD CONSTRAINT `pengiriman_counters_permintaan_counter_id_foreign` FOREIGN KEY (`permintaan_counter_id`) REFERENCES `permintaan_counters` (`permintaan_counter_id`) ON DELETE CASCADE;

--
-- Constraints for table `penjualans`
--
ALTER TABLE `penjualans`
  ADD CONSTRAINT `penjualans_counter_id_foreign` FOREIGN KEY (`counter_id`) REFERENCES `counters` (`counter_id`) ON DELETE CASCADE;

--
-- Constraints for table `permintaan_counters`
--
ALTER TABLE `permintaan_counters`
  ADD CONSTRAINT `permintaan_counters_counter_id_foreign` FOREIGN KEY (`counter_id`) REFERENCES `counters` (`counter_id`) ON DELETE CASCADE;

--
-- Constraints for table `persediaan_masuks`
--
ALTER TABLE `persediaan_masuks`
  ADD CONSTRAINT `persediaan_masuks_pemesanan_id_foreign` FOREIGN KEY (`pemesanan_id`) REFERENCES `pemesanans` (`pemesanan_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
