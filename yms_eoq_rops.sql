-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 09, 2025 at 01:17 PM
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
  `barang_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
('B00001', 'fAWj30rRNi5TKoLG', 'Oxford putih', 2250000, 20000, 210, 177, '2024-12-01 05:11:40', '2025-01-28 02:58:21'),
('B00002', '9lkjpWMs0dta2rpX', 'Oxford coklat', 2100000, 20000, 224, 184, '2024-12-01 05:11:40', '2025-01-28 02:58:21'),
('B00003', 'UT9eohlwBMoW5baD', 'Allino kopi susu', 2200000, 20000, 290, 256, '2024-12-01 05:11:41', '2025-01-28 02:58:21'),
('B00004', 'quQJatNHj6LatYDD', 'Cemani merah', 1900000, 20000, 280, 244, '2024-12-01 05:11:41', '2025-01-28 02:58:21'),
('B00005', 'stqCDAAw4Z1YvQA4', 'Cemani coklat', 1900000, 20000, 240, 215, '2024-12-01 05:11:41', '2025-01-28 02:58:21'),
('B00006', 'VyxAZCC57eOwSFgy', 'Cemani dongker', 1900000, 20000, 232, 209, '2024-12-01 05:11:41', '2025-01-28 02:58:21'),
('B00007', '0Baf0iTrSDAVUfxv', 'Cemani abu', 1900000, 20000, 378, 338, '2024-12-01 05:11:41', '2025-01-28 02:58:21'),
('B00008', 'daoTxY5AOELrENki', 'Cemani putih', 1900000, 20000, 130, 114, '2024-12-01 05:11:42', '2025-01-28 02:58:21'),
('B00009', 'FWzcm4X9c8VP0SSi', 'Cemani hijau', 1900000, 20000, 195, 174, '2024-12-01 05:11:42', '2025-01-28 02:58:21');

-- --------------------------------------------------------

--
-- Table structure for table `barang_gudangs`
--

CREATE TABLE `barang_gudangs` (
  `barang_gudang_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `barang_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gudang_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
('G00001B00001', 'vkA1CungwQMdtdmk', 'B00001', 'G00001', 2100, 1827, 265, '2024-12-01 05:11:44', '2025-01-28 02:58:21'),
('G00001B00002', 'bZmhW82eHOg9eiuX', 'B00002', 'G00001', 1979, 1174, 270, '2024-12-01 05:11:44', '2025-01-28 02:58:21'),
('G00001B00003', 'iDkbSlgdwvcXAbYN', 'B00003', 'G00001', 2083, 1842, 0, '2024-12-01 05:11:44', '2025-01-28 02:58:21'),
('G00001B00004', 'c8ovqlVvbRXoocUN', 'B00004', 'G00001', 0, 2018, 0, '2024-12-01 05:11:44', '2025-01-28 02:58:21'),
('G00001B00005', 'JA6Nx43zw1FLmCOQ', 'B00005', 'G00001', 0, 1987, 0, '2024-12-01 05:11:44', '2025-01-28 02:58:21'),
('G00001B00006', 'CNu7yyrR2xy0ZmfY', 'B00006', 'G00001', 0, 2064, 0, '2024-12-01 05:11:44', '2025-01-28 02:58:21'),
('G00001B00007', '7HafsJU32fNEeh0X', 'B00007', 'G00001', 0, 1978, 0, '2024-12-01 05:11:44', '2025-01-28 02:58:21'),
('G00001B00008', 'AXG6qdETtZQryp7o', 'B00008', 'G00001', 0, 1953, 0, '2024-12-01 05:11:44', '2025-01-28 02:58:21'),
('G00001B00009', 'rIbRKl9mhHzOIgRI', 'B00009', 'G00001', 0, 2046, 0, '2024-12-01 05:11:44', '2025-01-28 02:58:21');

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `counter_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`counter_id`, `slug`, `user_id`, `created_at`, `updated_at`) VALUES
('C00001', '18wJ8kViKsFOd4MY', 'U00006', '2024-12-04 04:46:53', '2024-12-04 04:46:53'),
('C00002', 'SO0MTQlPmFJjtQiD', 'U00007', '2024-12-04 04:47:23', '2024-12-04 04:47:23');

-- --------------------------------------------------------

--
-- Table structure for table `gudangs`
--

CREATE TABLE `gudangs` (
  `gudang_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gudangs`
--

INSERT INTO `gudangs` (`gudang_id`, `slug`, `user_id`, `created_at`, `updated_at`) VALUES
('G00001', 'dItxBGuABrWI9Yf1', 'U00001', '2024-12-01 05:11:43', '2024-12-01 05:11:43');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `pemesanan_barangs`
--

CREATE TABLE `pemesanan_barangs` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_supplier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_datang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_pemesanan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `biaya_pemesanan` int NOT NULL,
  `eoq` int NOT NULL,
  `rop` int NOT NULL,
  `ss` int NOT NULL,
  `jumlah_pemesanan` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pemesanan_barangs`
--

INSERT INTO `pemesanan_barangs` (`id`, `invoice`, `id_barang`, `id_supplier`, `tgl_datang`, `status_pemesanan`, `biaya_pemesanan`, `eoq`, `rop`, `ss`, `jumlah_pemesanan`, `created_at`, `updated_at`) VALUES
(91, 'PMP-20250108050521', 'B00001', '7', '5', 'Disetujui', 100000, 14, 20, 17, 14, '2025-01-07 22:05:21', '2025-01-07 22:34:30'),
(101, 'PMP-20250128095426', 'B00001', '7', '5', 'Menunggu Persetujuan', 100000, 44, 210, 177, 44, '2025-01-28 02:54:26', '2025-01-28 02:57:11'),
(102, 'PMP-20250128095426', 'B00002', '8', '4', 'Menunggu Persetujuan', 100000, 55, 224, 184, 55, '2025-01-28 02:54:26', '2025-01-28 02:57:11'),
(103, 'PMP-20250128095426', 'B00003', '9', '5', 'Menunggu Persetujuan', 100000, 45, 290, 256, 45, '2025-01-28 02:54:26', '2025-01-28 02:57:11'),
(104, 'PMP-20250128095426', 'B00004', '1', '5', 'Menunggu Persetujuan', 100000, 46, 280, 244, 46, '2025-01-28 02:54:26', '2025-01-28 02:57:11'),
(105, 'PMP-20250128095426', 'B00005', '2', '4', 'Menunggu Persetujuan', 100000, 43, 240, 215, 43, '2025-01-28 02:54:26', '2025-01-28 02:57:11'),
(106, 'PMP-20250128095426', 'B00006', '3', '4', 'Menunggu Persetujuan', 100000, 42, 232, 209, 42, '2025-01-28 02:54:26', '2025-01-28 02:57:11'),
(107, 'PMP-20250128095426', 'B00007', '4', '6', 'Menunggu Persetujuan', 100000, 45, 378, 338, 45, '2025-01-28 02:54:26', '2025-01-28 02:57:11'),
(108, 'PMP-20250128095426', 'B00008', '5', '2', 'Menunggu Persetujuan', 100000, 49, 130, 114, 49, '2025-01-28 02:54:26', '2025-01-28 02:57:11'),
(109, 'PMP-20250128095426', 'B00009', '6', '3', 'Menunggu Persetujuan', 100000, 46, 195, 174, 46, '2025-01-28 02:54:26', '2025-01-28 02:57:11');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_barangs`
--

CREATE TABLE `penjualan_barangs` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_pembeli` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat_pembeli` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon_pembeli` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_pembelian` date DEFAULT NULL,
  `tgl_pengiriman` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penjualan_barangs`
--

INSERT INTO `penjualan_barangs` (`id`, `invoice_number`, `nama_pembeli`, `alamat_pembeli`, `telepon_pembeli`, `status`, `tgl_pembelian`, `tgl_pengiriman`, `created_at`, `updated_at`) VALUES
(1, 'DTRINVVOLUPTATES02122024061739', 'Voluptates', 'Eveniet non nisi pr', '16', 'DITERIMA', '2024-10-01', NULL, '2024-12-01 23:17:39', '2024-12-01 23:17:39'),
(2, 'DTRINVNOSTRUM DISTINCTIO02122024062219', 'Nostrum distinctio', 'Adipisicing providen', '29', 'DITERIMA', '2024-10-02', NULL, '2024-12-01 23:22:19', '2024-12-01 23:22:19'),
(3, 'DTRINVQUI02122024062432', 'Qui', 'Non veritatis cillum', '8', 'DITERIMA', '2024-10-03', NULL, '2024-12-01 23:24:32', '2024-12-01 23:24:32'),
(4, 'DTRINVREM UNDE ODIT ADIPIS02122024062519', 'Rem unde odit adipis', 'Neque id non expedit', '3', 'DITERIMA', '2024-10-04', NULL, '2024-12-01 23:25:19', '2024-12-01 23:25:19'),
(5, 'DTRINVVOLUPTATE QUIA VENIA02122024062555', 'Voluptate quia venia', 'Placeat earum eos q', '95', 'DITERIMA', '2024-10-05', NULL, '2024-12-01 23:25:55', '2024-12-01 23:25:55'),
(6, 'DTRINVDEBITIS CONSEQUATUR02122024062618', 'Debitis consequatur', 'Ut quis laboriosam', '82', 'DITERIMA', '2024-10-06', NULL, '2024-12-01 23:26:18', '2024-12-01 23:26:18'),
(7, 'DTRINVPARIATUR CONSECTETU02122024062638', 'Pariatur Consectetu', 'Voluptas ab aliquip', '47', 'DITERIMA', '2024-10-07', NULL, '2024-12-01 23:26:38', '2024-12-01 23:26:38'),
(8, 'DTRINVDOLOREM AB LABORUM E02122024062659', 'Dolorem ab laborum e', 'Magna ullamco quisqu', '78', 'DITERIMA', '2024-10-08', NULL, '2024-12-01 23:26:59', '2024-12-01 23:26:59'),
(9, 'DTRINVMAXIME EOS EX SUSCIP02122024062724', 'Maxime eos ex suscip', 'Aut autem est conse', '46', 'DITERIMA', '2024-10-09', NULL, '2024-12-01 23:27:24', '2024-12-01 23:27:24'),
(10, 'DTRINVMAGNAM RATIONE EXERC02122024062801', 'Magnam ratione exerc', 'At facilis exercitat', '22', 'DITERIMA', '2024-10-10', NULL, '2024-12-01 23:28:01', '2024-12-01 23:28:01'),
(11, 'DTRINVMOLESTIAE CONSEQUAT02122024062838', 'Molestiae consequat', 'Beatae dolores quo d', '7', 'DITERIMA', '2024-10-11', NULL, '2024-12-01 23:28:38', '2024-12-01 23:28:38'),
(12, 'DTRINVQUIDEM PLACEAT MAGN02122024062958', 'Quidem placeat magn', 'Consequuntur qui hic', '086558031232', 'DITERIMA', '2024-10-12', NULL, '2024-12-01 23:29:58', '2024-12-01 23:29:58'),
(13, 'DTRINVEXPEDITA02122024063032', 'expedita', 'Velit voluptas quam', '084633298236', 'DITERIMA', '2024-10-13', NULL, '2024-12-01 23:30:32', '2024-12-01 23:30:32'),
(14, 'DTRINVESSE IURE QUO DOLOR02122024063101', 'Esse iure quo dolor', 'Adipisci quibusdam o', '082835419041', 'DITERIMA', '2024-10-14', NULL, '2024-12-01 23:31:01', '2024-12-01 23:31:01'),
(15, 'DTRINVVOLUPTATEM02122024063225', 'Voluptatem', 'Inventore neque quis', '084929335642', 'DITERIMA', '2024-10-15', NULL, '2024-12-01 23:32:25', '2024-12-01 23:32:25'),
(16, 'DTRINVQUIA QUI VEL LIBERO02122024063245', 'Quia qui vel libero', 'Vel perspiciatis cu', '085285774180', 'DITERIMA', '2024-10-16', NULL, '2024-12-01 23:32:45', '2024-12-01 23:32:45'),
(17, 'DTRINVBLANDITIIS ID ET FA02122024063315', 'Blanditiis id et fa', 'Sunt pariatur Culp', '082925575671', 'DITERIMA', '2024-10-17', NULL, '2024-12-01 23:33:15', '2024-12-01 23:33:15'),
(18, 'DTRINVSUNT ET QUAE REM IUR02122024063334', 'Sunt et quae rem iur', 'Reprehenderit quis i', '083756295425', 'DITERIMA', '2024-10-18', NULL, '2024-12-01 23:33:34', '2024-12-01 23:33:34'),
(19, 'DTRINVEOS TOTAM OFFICIA EA02122024063401', 'Eos totam officia ea', 'Aperiam qui eos veli', '081945874731', 'DITERIMA', '2024-10-19', NULL, '2024-12-01 23:34:01', '2024-12-01 23:34:01'),
(20, 'DTRINVEXPEDITA ULLAM IUSTO02122024063421', 'Expedita ullam iusto', 'Quaerat cupidatat qu', '086600696746', 'DITERIMA', '2024-10-20', NULL, '2024-12-01 23:34:21', '2024-12-01 23:34:21'),
(21, 'DTRINVDOLOREM UT ADIPISICI02122024063443', 'Dolorem ut adipisici', 'Modi excepturi aliqu', '086349637320', 'DITERIMA', '2024-10-21', NULL, '2024-12-01 23:34:43', '2024-12-01 23:34:43'),
(22, 'DTRINVQUAERAT EUM VELIT VO02122024063507', 'Quaerat eum velit vo', 'Corrupti dolores du', '084995171637', 'DITERIMA', '2024-10-22', NULL, '2024-12-01 23:35:07', '2024-12-01 23:35:07'),
(23, 'DTRINVET NUMQUAM IMPEDIT02122024063529', 'Et numquam impedit', 'Delectus ut sed vel', '086137564241', 'DITERIMA', '2024-10-23', NULL, '2024-12-01 23:35:29', '2024-12-01 23:35:29'),
(24, 'DTRINVVITAE MAGNAM PERSPIC02122024063548', 'Vitae magnam perspic', 'Quia minim velit ip', '087365481085', 'DITERIMA', '2024-10-24', NULL, '2024-12-01 23:35:48', '2024-12-01 23:35:48'),
(25, 'DTRINVSINT FACILIS SIT A02122024063608', 'Sint facilis sit a', 'Est sint tempore do', '081820090380', 'DITERIMA', '2024-10-25', NULL, '2024-12-01 23:36:08', '2024-12-01 23:36:08'),
(26, 'DTRINVQUIA MAXIME VEL DOLO02122024063633', 'Quia maxime vel dolo', 'Quo officiis aut exp', '081840113396', 'DITERIMA', '2024-10-26', NULL, '2024-12-01 23:36:33', '2024-12-01 23:36:33'),
(27, 'DTRINVNON ID ENIM EXPLICA02122024063658', 'Non id enim explica', 'Dolores sequi qui et', '082879812582', 'DITERIMA', '2024-10-27', NULL, '2024-12-01 23:36:58', '2024-12-01 23:36:58'),
(28, 'DTRINVASPERNATUR ASSUMENDA02122024063721', 'Aspernatur assumenda', 'Ut iure occaecat vol', '082389379192', 'DITERIMA', '2024-10-28', NULL, '2024-12-01 23:37:21', '2024-12-01 23:37:21'),
(29, 'DTRINVQUISQUAM FUGIAT LABO02122024063738', 'Quisquam fugiat labo', 'Est sequi cumque rec', '084513504129', 'DITERIMA', '2024-10-29', NULL, '2024-12-01 23:37:38', '2024-12-01 23:37:38'),
(30, 'DTRINVDO ENIM ARCHITECTO D02122024063822', 'Do enim architecto d', 'Incididunt quia cons', '088125148193', 'DITERIMA', '2024-10-30', NULL, '2024-12-01 23:38:22', '2024-12-01 23:38:22'),
(31, 'DTRINVVENIAM NON IPSAM EN02122024063931', 'Veniam non ipsam en', 'Vitae quas illo enim', '085926211428', 'DITERIMA', '2024-10-31', NULL, '2024-12-01 23:39:31', '2024-12-01 23:39:31'),
(32, 'DTRINVSTEPHANIE YANG02122024112106', 'Stephanie Yang', 'Ut quae corporis par', '084638809561', 'DITERIMA', '2024-11-01', NULL, '2024-12-02 04:21:06', '2024-12-02 04:21:06'),
(33, 'DTRINVCHAVA HOLMAN02122024112203', 'Chava Holman', 'Voluptas dolores per', '085820244278', 'DITERIMA', '2024-11-02', NULL, '2024-12-02 04:22:04', '2024-12-02 04:22:04'),
(34, 'DTRINVJESSICA BUTLER02122024112227', 'Jessica Butler', 'Enim fugit rerum mo', '089137288018', 'DITERIMA', '2024-11-03', NULL, '2024-12-02 04:22:27', '2024-12-02 04:22:27'),
(35, 'DTRINVJERRY BAXTER02122024112305', 'Jerry Baxter', 'Voluptate assumenda', '088372438183', 'DITERIMA', '2024-11-04', NULL, '2024-12-02 04:23:05', '2024-12-02 04:23:05'),
(36, 'DTRINVORLA COLLIER02122024112350', 'Orla Collier', 'Rerum laboris volupt', '081549634190', 'DITERIMA', '2024-11-05', NULL, '2024-12-02 04:23:50', '2024-12-02 04:23:50'),
(37, 'DTRINVPALMER ALVAREZ02122024112417', 'Palmer Alvarez', 'Laborum Molestiae i', '088179068550', 'DITERIMA', '2024-11-06', NULL, '2024-12-02 04:24:17', '2024-12-02 04:24:17'),
(38, 'DTRINVCAMILLE KLEIN02122024112453', 'Camille Klein', 'Voluptas aperiam tem', '088281816971', 'DITERIMA', '2024-11-07', NULL, '2024-12-02 04:24:53', '2024-12-02 04:24:53'),
(39, 'DTRINVWALKER TRAN02122024112518', 'Walker Tran', 'Cumque lorem placeat', '088129598113', 'DITERIMA', '2024-11-08', NULL, '2024-12-02 04:25:18', '2024-12-02 04:25:18'),
(40, 'DTRINVARMAND BOONE02122024112539', 'Armand Boone', 'Voluptas voluptatem', '085717632978', 'DITERIMA', '2024-11-09', NULL, '2024-12-02 04:25:39', '2024-12-02 04:25:39'),
(41, 'DTRINVNATALIE PIERCE02122024112646', 'Natalie Pierce', 'Ut consequatur Esse', '087903596015', 'DITERIMA', '2024-11-10', NULL, '2024-12-02 04:26:46', '2024-12-02 04:26:46'),
(42, 'DTRINVMAGEE VAZQUEZ02122024112720', 'Magee Vazquez', 'Ut at quos sed dolor', '086734589680', 'DITERIMA', '2024-11-11', NULL, '2024-12-02 04:27:20', '2024-12-02 04:27:20'),
(43, 'DTRINVGIL STEWART02122024113028', 'Gil Stewart', 'Distinctio Quam off', '081344550763', 'DITERIMA', '2024-11-12', NULL, '2024-12-02 04:30:28', '2024-12-02 04:30:28'),
(44, 'DTRINVALLEGRA SCHULTZ02122024113144', 'Allegra Schultz', 'Tempore laudantium', '089205208736', 'DITERIMA', '2024-11-13', NULL, '2024-12-02 04:31:44', '2024-12-02 04:31:44'),
(45, 'DTRINVJACK GOULD02122024113216', 'Jack Gould', 'Laboris exercitation', '088696223338', 'DITERIMA', '2024-11-14', NULL, '2024-12-02 04:32:16', '2024-12-02 04:32:16'),
(46, 'DTRINVHILDA HARRELL02122024113240', 'Hilda Harrell', 'Ullam quae magna Nam', '089269557877', 'DITERIMA', '2024-11-15', NULL, '2024-12-02 04:32:40', '2024-12-02 04:32:40'),
(47, 'DTRINVDAVID SOLIS02122024113305', 'David Solis', 'Ullam provident iur', '081997779423', 'DITERIMA', '2024-11-16', NULL, '2024-12-02 04:33:05', '2024-12-02 04:33:05'),
(48, 'DTRINVFREDERICKA VALDEZ02122024113335', 'Fredericka Valdez', 'Nobis et quis aut in', '088321607130', 'DITERIMA', '2024-11-17', NULL, '2024-12-02 04:33:35', '2024-12-02 04:33:35'),
(49, 'DTRINVNOMLANGA FOSTER02122024113355', 'Nomlanga Foster', 'Saepe non tempora do', '089705999488', 'DITERIMA', '2024-11-18', NULL, '2024-12-02 04:33:55', '2024-12-02 04:33:55'),
(50, 'DTRINVSTEPHANIE JARVIS02122024113418', 'Stephanie Jarvis', 'Dolorem non adipisci', '089307732622', 'DITERIMA', '2024-11-19', NULL, '2024-12-02 04:34:18', '2024-12-02 04:34:18'),
(51, 'DTRINVWADE FRAZIER02122024113443', 'Wade Frazier', 'Libero cupidatat sap', '083657253599', 'DITERIMA', '2024-11-20', NULL, '2024-12-02 04:34:43', '2024-12-02 04:34:43'),
(52, 'DTRINVABEL HODGE02122024113502', 'Abel Hodge', 'Laboris anim culpa q', '086532111818', 'DITERIMA', '2024-11-21', NULL, '2024-12-02 04:35:02', '2024-12-02 04:35:02'),
(53, 'DTRINVCARA CRUZ02122024113526', 'Cara Cruz', 'Cupidatat sunt nost', '084719441311', 'DITERIMA', '2024-11-22', NULL, '2024-12-02 04:35:26', '2024-12-02 04:35:26'),
(54, 'DTRINVTASHYA CHEN02122024113548', 'Tashya Chen', 'Ex voluptate sapient', '089549925500', 'DITERIMA', '2024-11-23', NULL, '2024-12-02 04:35:48', '2024-12-02 04:35:48'),
(55, 'DTRINVHAVIVA FLETCHER02122024113618', 'Haviva Fletcher', 'Alias ipsam libero l', '088993524819', 'DITERIMA', '2024-11-24', NULL, '2024-12-02 04:36:18', '2024-12-02 04:36:18'),
(56, 'DTRINVCARYN CALDWELL02122024113638', 'Caryn Caldwell', 'Veniam et qui commo', '086408745432', 'DITERIMA', '2024-11-25', NULL, '2024-12-02 04:36:38', '2024-12-02 04:36:38'),
(57, 'DTRINVHARPER MULLINS02122024113700', 'Harper Mullins', 'Similique enim quo u', '083605522974', 'DITERIMA', '2024-11-26', NULL, '2024-12-02 04:37:00', '2024-12-02 04:37:00'),
(58, 'DTRINVTANA WHITNEY02122024113721', 'Tana Whitney', 'Corrupti consequat', '081424569364', 'DITERIMA', '2024-11-27', NULL, '2024-12-02 04:37:21', '2024-12-02 04:37:21'),
(59, 'DTRINVKARINA KERR02122024113740', 'Karina Kerr', 'Lorem eveniet esse', '087426861199', 'DITERIMA', '2024-11-28', NULL, '2024-12-02 04:37:40', '2024-12-02 04:37:40'),
(60, 'DTRINVBECK RAYMOND02122024113755', 'Beck Raymond', 'Exercitationem est', '083823506852', 'DITERIMA', '2024-11-29', NULL, '2024-12-02 04:37:55', '2024-12-02 04:37:55'),
(61, 'DTRINVMAGGY GREENE02122024113815', 'Maggy Greene', 'Excepteur velit asp', '088801402724', 'DITERIMA', '2024-11-30', NULL, '2024-12-02 04:38:15', '2024-12-02 04:38:15'),
(71, 'DTRINVGWENDOLYN HUBER21012025010432', 'Gwendolyn Huber', 'Illum cum possimus', '083163057903', 'DITERIMA', '2024-12-01', NULL, '2025-01-20 18:04:33', '2025-01-20 18:04:33'),
(72, 'DTRINVALTHEA TOWNSEND21012025010521', 'Althea Townsend', 'Ad et tenetur aliqua', '083147113693', 'DITERIMA', '2024-12-02', NULL, '2025-01-20 18:05:21', '2025-01-20 18:05:21'),
(73, 'DTRINVCHANDA QUINN21012025010550', 'Chanda Quinn', 'Reiciendis debitis v', '082173615996', 'DITERIMA', '2024-12-03', NULL, '2025-01-20 18:05:50', '2025-01-20 18:05:50'),
(74, 'DTRINVDEAN ROGERS21012025010628', 'Dean Rogers', 'Quibusdam voluptatum', '085198299972', 'DITERIMA', '2024-12-04', NULL, '2025-01-20 18:06:28', '2025-01-20 18:06:28'),
(75, 'DTRINVEMERALD CHANEY21012025010708', 'Emerald Chaney', 'Neque aspernatur ab', '083786291654', 'DITERIMA', '2024-12-05', NULL, '2025-01-20 18:07:08', '2025-01-20 18:07:08'),
(76, 'DTRINVHASAD FERRELL21012025010738', 'Hasad Ferrell', 'Asperiores voluptate', '086943601341', 'DITERIMA', '2024-12-06', NULL, '2025-01-20 18:07:38', '2025-01-20 18:07:38'),
(77, 'DTRINVWYOMING MARTIN21012025010802', 'Wyoming Martin', 'Eos enim lorem aperi', '084967231412', 'DITERIMA', '2024-12-07', NULL, '2025-01-20 18:08:02', '2025-01-20 18:08:02'),
(78, 'DTRINVBELL JACOBS21012025010828', 'Bell Jacobs', 'Voluptatum aliqua R', '089263680790', 'DITERIMA', '2024-12-08', NULL, '2025-01-20 18:08:28', '2025-01-20 18:08:28'),
(79, 'DTRINVSTACY CONTRERAS21012025010850', 'Stacy Contreras', 'Adipisci in ipsa ut', '082859347625', 'DITERIMA', '2024-12-09', NULL, '2025-01-20 18:08:50', '2025-01-20 18:08:50'),
(80, 'DTRINVMOLLIE TAYLOR21012025011011', 'Mollie Taylor', 'Ea eligendi quae qui', '086965095086', 'DITERIMA', '2024-12-10', NULL, '2025-01-20 18:10:11', '2025-01-20 18:10:11'),
(81, 'DTRINVAUGUST LARA21012025011055', 'August Lara', 'Ea aut excepteur bea', '086378944810', 'DITERIMA', '2024-12-11', NULL, '2025-01-20 18:10:55', '2025-01-20 18:10:55'),
(82, 'DTRINVNOMLANGA HATFIELD21012025011121', 'Nomlanga Hatfield', 'Quis tempor quis per', '085750677978', 'DITERIMA', '2024-12-12', NULL, '2025-01-20 18:11:21', '2025-01-20 18:11:21'),
(83, 'DTRINVJUSTIN GRAY21012025011146', 'Justin Gray', 'Laborum laboris faci', '081972794215', 'DITERIMA', '2024-12-13', NULL, '2025-01-20 18:11:46', '2025-01-20 18:11:46'),
(84, 'DTRINVUMA MAYER21012025011217', 'Uma Mayer', 'Amet praesentium do', '083304821002', 'DITERIMA', '2024-12-14', NULL, '2025-01-20 18:12:17', '2025-01-20 18:12:17'),
(85, 'DTRINVRAYMOND DALTON21012025011241', 'Raymond Dalton', 'Quisquam necessitati', '085523565155', 'DITERIMA', '2024-12-15', NULL, '2025-01-20 18:12:41', '2025-01-20 18:12:41'),
(86, 'DTRINVHOLMES YATES21012025011308', 'Holmes Yates', 'Dolore enim aspernat', '081728336444', 'DITERIMA', '2024-12-16', NULL, '2025-01-20 18:13:08', '2025-01-20 18:13:08'),
(87, 'DTRINVBELL HULL21012025011332', 'Bell Hull', 'Voluptatum reiciendi', '082933803488', 'DITERIMA', '2024-12-17', NULL, '2025-01-20 18:13:32', '2025-01-20 18:13:32'),
(88, 'DTRINVALEXANDRA GARZA21012025011354', 'Alexandra Garza', 'Aliquam mollit omnis', '089356842619', 'DITERIMA', '2024-12-18', NULL, '2025-01-20 18:13:54', '2025-01-20 18:13:54'),
(89, 'DTRINVLAURA DURHAM21012025011424', 'Laura Durham', 'Et qui ipsa consequ', '084144014383', 'DITERIMA', '2024-12-19', NULL, '2025-01-20 18:14:24', '2025-01-20 18:14:24'),
(90, 'DTRINVMANNIX HAYS21012025011451', 'Mannix Hays', 'Culpa incididunt ha', '086155363936', 'DITERIMA', '2024-12-20', NULL, '2025-01-20 18:14:51', '2025-01-20 18:14:51'),
(91, 'DTRINVWYLIE STEVENS21012025011516', 'Wylie Stevens', 'Quidem adipisci blan', '089461171310', 'DITERIMA', '2024-12-21', NULL, '2025-01-20 18:15:16', '2025-01-20 18:15:16'),
(92, 'DTRINVFLEUR CARRILLO21012025011547', 'Fleur Carrillo', 'Accusamus fugiat re', '081929345243', 'DITERIMA', '2024-12-22', NULL, '2025-01-20 18:15:47', '2025-01-20 18:15:47'),
(93, 'DTRINVROBIN MEYERS21012025011614', 'Robin Meyers', 'Consequatur consect', '081192341734', 'DITERIMA', '2024-12-23', NULL, '2025-01-20 18:16:14', '2025-01-20 18:16:14'),
(94, 'DTRINVHILEL CUNNINGHAM21012025011639', 'Hilel Cunningham', 'Fuga Exercitationem', '088320582949', 'DITERIMA', '2024-12-24', NULL, '2025-01-20 18:16:39', '2025-01-20 18:16:39'),
(95, 'DTRINVCHASTITY MOLINA21012025011659', 'Chastity Molina', 'Tenetur sint nisi es', '085412048711', 'DITERIMA', '2024-12-25', NULL, '2025-01-20 18:16:59', '2025-01-20 18:16:59'),
(96, 'DTRINVHOLLEE HICKMAN21012025011726', 'Hollee Hickman', 'Id ratione in dolor', '084406811265', 'DITERIMA', '2024-12-26', NULL, '2025-01-20 18:17:26', '2025-01-20 18:17:26'),
(97, 'DTRINVKITRA GARRETT21012025011751', 'Kitra Garrett', 'Aliquam harum ut ips', '088864461974', 'DITERIMA', '2024-12-27', NULL, '2025-01-20 18:17:51', '2025-01-20 18:17:51'),
(98, 'DTRINVYASIR HARRELL21012025011826', 'Yasir Harrell', 'Quaerat aut blanditi', '085646036914', 'DITERIMA', '2024-12-28', NULL, '2025-01-20 18:18:26', '2025-01-20 18:18:26'),
(99, 'DTRINVPETRA HAWKINS21012025011841', 'Petra Hawkins', 'Est corrupti facer', '086541838642', 'DITERIMA', '2024-12-29', NULL, '2025-01-20 18:18:41', '2025-01-20 18:18:41'),
(100, 'DTRINVSELMA ALLISON21012025011907', 'Selma Allison', 'Duis exercitation la', '087657321181', 'DITERIMA', '2024-12-30', NULL, '2025-01-20 18:19:07', '2025-01-20 18:19:07'),
(101, 'DTRINVBRIANNA SANTOS21012025011936', 'Brianna Santos', 'Vel dolor consectetu', '083515251239', 'DITERIMA', '2024-12-31', NULL, '2025-01-20 18:19:36', '2025-01-20 18:19:36'),
(102, 'DTRINVAMANDA01012025010432', 'AMANDA', 'Illum cum possimus', '083165952501', 'DITERIMA', '2025-01-01', NULL, '2025-01-20 11:04:33', '2025-01-20 11:04:33'),
(103, 'DTRINVHARIANTO02012025010521', 'HARIANTO', 'Ad et tenetur aliqua', '083145912501', 'DITERIMA', '2025-01-02', NULL, '2025-01-20 11:05:21', '2025-01-20 11:05:21'),
(104, 'DTRINVLILIS03012025010550', 'LILIS', 'Reiciendis debitis v', '082175912501', 'DITERIMA', '2025-01-03', NULL, '2025-01-20 11:05:50', '2025-01-20 11:05:50'),
(105, 'DTRINVFEBRIANTI04012025010628', 'FEBRIANTI', 'Quibusdam voluptatum', '085195992501', 'DITERIMA', '2025-01-04', NULL, '2025-01-20 11:06:28', '2025-01-20 11:06:28'),
(106, 'DTRINVFERINA05012025010708', 'FERINA', 'Neque aspernatur ab', '083785992501', 'DITERIMA', '2025-01-05', NULL, '2025-01-20 11:07:08', '2025-01-20 11:07:08'),
(107, 'DTRINVKARTIKA06012025010738', 'KARTIKA', 'Asperiores voluptate', '086945902501', 'DITERIMA', '2025-01-06', NULL, '2025-01-20 11:07:38', '2025-01-20 11:07:38'),
(108, 'DTRINVRENATA07012025010802', 'RENATA', 'Eos enim lorem aperi', '084965932501', 'DITERIMA', '2025-01-07', NULL, '2025-01-20 11:08:02', '2025-01-20 11:08:02'),
(109, 'DTRINVRORO08012025010828', 'RORO', 'Voluptatum aliqua R', '089265982501', 'DITERIMA', '2025-01-08', NULL, '2025-01-20 11:08:28', '2025-01-20 11:08:28'),
(110, 'DTRINVBELINDA09012025010850', 'BELINDA', 'Adipisci in ipsa ut', '082855942501', 'DITERIMA', '2025-01-09', NULL, '2025-01-20 11:08:50', '2025-01-20 11:08:50'),
(111, 'DTRINVWAHYU10012025011011', 'WAHYU', 'Ea eligendi quae qui', '086965992501', 'DITERIMA', '2025-01-10', NULL, '2025-01-20 11:10:11', '2025-01-20 11:10:11'),
(112, 'DTRINVLAILA11012025011055', 'LAILA', 'Ea aut excepteur bea', '086375942501', 'DITERIMA', '2025-01-11', NULL, '2025-01-20 11:10:55', '2025-01-20 11:10:55'),
(113, 'DTRINVHISNAJM12012025011121', 'HISNAJM', 'Quis tempor quis per', '085755972501', 'DITERIMA', '2025-01-12', NULL, '2025-01-20 11:11:21', '2025-01-20 11:11:21'),
(114, 'DTRINVJUSTIN13012025011146', 'Justin', 'Laborum laboris faci', '081975992501', 'DITERIMA', '2025-01-13', NULL, '2025-01-20 11:11:46', '2025-01-20 11:11:46'),
(115, 'DTRINVMARISKA14012025011217', 'MARISKA', 'Amet praesentium do', '083305922501', 'DITERIMA', '2025-01-14', NULL, '2025-01-20 11:12:17', '2025-01-20 11:12:17'),
(116, 'DTRINVGERALDO15012025011241', 'GERALDO', 'Quisquam necessitati', '085525962501', 'DITERIMA', '2025-01-15', NULL, '2025-01-20 11:12:41', '2025-01-20 11:12:41'),
(117, 'DTRINVSARAH16012025011308', 'SARAH', 'Dolore enim aspernat', '081725932501', 'DITERIMA', '2025-01-16', NULL, '2025-01-20 11:13:08', '2025-01-20 11:13:08'),
(118, 'DTRINVBULQIS17012025011332', 'BULQIS', 'Voluptatum reiciendi', '082935902501', 'DITERIMA', '2025-01-17', NULL, '2025-01-20 11:13:32', '2025-01-20 11:13:32'),
(119, 'DTRINVNIA18012025011354', 'NIA', 'Aliquam mollit omnis', '089355942501', 'DITERIMA', '2025-01-18', NULL, '2025-01-20 11:13:54', '2025-01-20 11:13:54'),
(120, 'DTRINVVERONIKA19012025011424', 'VERONIKA', 'Et qui ipsa consequ', '084145912501', 'DITERIMA', '2025-01-19', NULL, '2025-01-20 11:14:24', '2025-01-20 11:14:24'),
(121, 'DTRINVSULISTYO20012025011451', 'SULISTYO', 'Culpa incididunt ha', '086155962501', 'DITERIMA', '2025-01-20', NULL, '2025-01-20 11:14:51', '2025-01-20 11:14:51'),
(122, 'DTRINVBAMBANG21012025011516', 'BAMBANG', 'Quidem adipisci blan', '089465972501', 'DITERIMA', '2025-01-21', NULL, '2025-01-20 11:15:16', '2025-01-20 11:15:16'),
(123, 'DTRINVROUDOLF22012025011547', 'ROUDOLF', 'Accusamus fugiat re', '081925942501', 'DITERIMA', '2025-01-22', NULL, '2025-01-20 11:15:47', '2025-01-20 11:15:47'),
(124, 'DTRINVYUNANSA23012025011614', 'YUNANSA', 'Consequatur consect', '081195942501', 'DITERIMA', '2025-01-23', NULL, '2025-01-20 11:16:14', '2025-01-20 11:16:14'),
(125, 'DTRINVCANTIKA24012025011639', 'CANTIKA', 'Fuga Exercitationem', '088325982501', 'DITERIMA', '2025-01-24', NULL, '2025-01-20 11:16:39', '2025-01-20 11:16:39'),
(126, 'DTRINVSRIRAHAYU25012025011659', 'SRIRAHAYU', 'Tenetur sint nisi es', '085415942501', 'DITERIMA', '2025-01-25', NULL, '2025-01-20 11:16:59', '2025-01-20 11:16:59'),
(127, 'DTRINVZASKIA26012025011726', 'ZASKIA', 'Id ratione in dolor', '084405912501', 'DITERIMA', '2025-01-26', NULL, '2025-01-20 11:17:26', '2025-01-20 11:17:26'),
(128, 'DTRINVKIRANA27012025011751', 'KIRANA', 'Aliquam harum ut ips', '088865962501', 'DITERIMA', '2025-01-27', NULL, '2025-01-20 11:17:51', '2025-01-20 11:17:51'),
(129, 'DTRINVYULIANA28012025011826', 'YULIANA', 'Quaerat aut blanditi', '085645932501', 'DITERIMA', '2025-01-28', NULL, '2025-01-20 11:18:26', '2025-01-20 11:18:26'),
(130, 'DTRINVTIARA29012025011841', 'TIARA', 'Est corrupti facer', '086545932501', 'DITERIMA', '2025-01-29', NULL, '2025-01-20 11:18:41', '2025-01-20 11:18:41'),
(131, 'DTRINVNUNUNG30012025011907', 'NUNUNG', 'Duis exercitation la', '087655922501', 'DITERIMA', '2025-01-30', NULL, '2025-01-20 11:19:07', '2025-01-20 11:19:07'),
(132, 'DTRINVZAKI31012025011936', 'ZAKI', 'Vel dolor consectetu', '083515952501', 'DITERIMA', '2025-01-31', NULL, '2025-01-20 11:19:36', '2025-01-20 11:19:36');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_barang_details`
--

CREATE TABLE `penjualan_barang_details` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, 'DTRINVVOLUPTATES02122024061739', 'B00005', 'Cemani coklat', 10, 1900000, '2024-10-01', NULL, '2024-12-01 23:17:39', '2024-12-01 23:17:39'),
(2, 'DTRINVVOLUPTATES02122024061739', 'B00008', 'Cemani putih', 10, 1900000, '2024-10-01', NULL, '2024-12-01 23:17:39', '2024-12-01 23:17:39'),
(3, 'DTRINVVOLUPTATES02122024061739', 'B00001', 'Oxford putih', 40, 2250000, '2024-10-01', NULL, '2024-12-01 23:17:39', '2024-12-01 23:17:39'),
(4, 'DTRINVNOSTRUM DISTINCTIO02122024062219', 'B00003', 'Allino kopi susu', 25, 2200000, '2024-10-02', NULL, '2024-12-01 23:22:19', '2024-12-01 23:22:19'),
(5, 'DTRINVNOSTRUM DISTINCTIO02122024062219', 'B00007', 'Cemani abu', 15, 1900000, '2024-10-02', NULL, '2024-12-01 23:22:19', '2024-12-01 23:22:19'),
(6, 'DTRINVQUI02122024062432', 'B00009', 'Cemani hijau', 25, 1900000, '2024-10-03', NULL, '2024-12-01 23:24:32', '2024-12-01 23:24:32'),
(7, 'DTRINVQUI02122024062432', 'B00008', 'Cemani putih', 25, 1900000, '2024-10-03', NULL, '2024-12-01 23:24:32', '2024-12-01 23:24:32'),
(8, 'DTRINVREM UNDE ODIT ADIPIS02122024062519', 'B00005', 'Cemani coklat', 25, 1900000, '2024-10-04', NULL, '2024-12-01 23:25:19', '2024-12-01 23:25:19'),
(9, 'DTRINVREM UNDE ODIT ADIPIS02122024062519', 'B00006', 'Cemani dongker', 20, 1900000, '2024-10-04', NULL, '2024-12-01 23:25:19', '2024-12-01 23:25:19'),
(10, 'DTRINVREM UNDE ODIT ADIPIS02122024062519', 'B00002', 'Oxford coklat', 10, 2100000, '2024-10-04', NULL, '2024-12-01 23:25:19', '2024-12-01 23:25:19'),
(11, 'DTRINVVOLUPTATE QUIA VENIA02122024062555', 'B00007', 'Cemani abu', 20, 1900000, '2024-10-05', NULL, '2024-12-01 23:25:55', '2024-12-01 23:25:55'),
(12, 'DTRINVVOLUPTATE QUIA VENIA02122024062555', 'B00004', 'Cemani merah', 40, 1900000, '2024-10-05', NULL, '2024-12-01 23:25:55', '2024-12-01 23:25:55'),
(13, 'DTRINVVOLUPTATE QUIA VENIA02122024062555', 'B00002', 'Oxford coklat', 40, 2100000, '2024-10-05', NULL, '2024-12-01 23:25:55', '2024-12-01 23:25:55'),
(14, 'DTRINVDEBITIS CONSEQUATUR02122024062618', 'B00007', 'Cemani abu', 20, 1900000, '2024-10-06', NULL, '2024-12-01 23:26:18', '2024-12-01 23:26:18'),
(15, 'DTRINVDEBITIS CONSEQUATUR02122024062618', 'B00005', 'Cemani coklat', 15, 1900000, '2024-10-06', NULL, '2024-12-01 23:26:18', '2024-12-01 23:26:18'),
(16, 'DTRINVPARIATUR CONSECTETU02122024062638', 'B00008', 'Cemani putih', 20, 1900000, '2024-10-07', NULL, '2024-12-01 23:26:38', '2024-12-01 23:26:38'),
(17, 'DTRINVPARIATUR CONSECTETU02122024062638', 'B00001', 'Oxford putih', 15, 2250000, '2024-10-07', NULL, '2024-12-01 23:26:38', '2024-12-01 23:26:38'),
(18, 'DTRINVDOLOREM AB LABORUM E02122024062659', 'B00003', 'Allino kopi susu', 25, 2200000, '2024-10-08', NULL, '2024-12-01 23:26:59', '2024-12-01 23:26:59'),
(19, 'DTRINVDOLOREM AB LABORUM E02122024062659', 'B00009', 'Cemani hijau', 25, 1900000, '2024-10-08', NULL, '2024-12-01 23:26:59', '2024-12-01 23:26:59'),
(20, 'DTRINVMAXIME EOS EX SUSCIP02122024062724', 'B00006', 'Cemani dongker', 10, 1900000, '2024-10-09', NULL, '2024-12-01 23:27:24', '2024-12-01 23:27:24'),
(21, 'DTRINVMAXIME EOS EX SUSCIP02122024062724', 'B00002', 'Oxford coklat', 25, 2100000, '2024-10-09', NULL, '2024-12-01 23:27:24', '2024-12-01 23:27:24'),
(22, 'DTRINVMAGNAM RATIONE EXERC02122024062801', 'B00009', 'Cemani hijau', 55, 1900000, '2024-10-10', NULL, '2024-12-01 23:28:01', '2024-12-01 23:28:01'),
(23, 'DTRINVMAGNAM RATIONE EXERC02122024062801', 'B00004', 'Cemani merah', 10, 1900000, '2024-10-10', NULL, '2024-12-01 23:28:01', '2024-12-01 23:28:01'),
(24, 'DTRINVMAGNAM RATIONE EXERC02122024062801', 'B00002', 'Oxford coklat', 56, 2100000, '2024-10-10', NULL, '2024-12-01 23:28:01', '2024-12-01 23:28:01'),
(25, 'DTRINVMOLESTIAE CONSEQUAT02122024062838', 'B00003', 'Allino kopi susu', 15, 2200000, '2024-10-11', NULL, '2024-12-01 23:28:38', '2024-12-01 23:28:38'),
(26, 'DTRINVMOLESTIAE CONSEQUAT02122024062838', 'B00005', 'Cemani coklat', 10, 1900000, '2024-10-11', NULL, '2024-12-01 23:28:38', '2024-12-01 23:28:38'),
(27, 'DTRINVMOLESTIAE CONSEQUAT02122024062838', 'B00008', 'Cemani putih', 10, 1900000, '2024-10-11', NULL, '2024-12-01 23:28:38', '2024-12-01 23:28:38'),
(28, 'DTRINVMOLESTIAE CONSEQUAT02122024062838', 'B00001', 'Oxford putih', 25, 2250000, '2024-10-11', NULL, '2024-12-01 23:28:38', '2024-12-01 23:28:38'),
(29, 'DTRINVQUIDEM PLACEAT MAGN02122024062958', 'B00006', 'Cemani dongker', 50, 1900000, '2024-10-12', NULL, '2024-12-01 23:29:59', '2024-12-01 23:29:59'),
(30, 'DTRINVQUIDEM PLACEAT MAGN02122024062958', 'B00008', 'Cemani putih', 20, 1900000, '2024-10-12', NULL, '2024-12-01 23:29:59', '2024-12-01 23:29:59'),
(31, 'DTRINVQUIDEM PLACEAT MAGN02122024062958', 'B00001', 'Oxford putih', 25, 2250000, '2024-10-12', NULL, '2024-12-01 23:29:59', '2024-12-01 23:29:59'),
(32, 'DTRINVEXPEDITA02122024063032', 'B00003', 'Allino kopi susu', 25, 2200000, '2024-10-13', NULL, '2024-12-01 23:30:32', '2024-12-01 23:30:32'),
(33, 'DTRINVEXPEDITA02122024063032', 'B00007', 'Cemani abu', 10, 1900000, '2024-10-13', NULL, '2024-12-01 23:30:32', '2024-12-01 23:30:32'),
(34, 'DTRINVEXPEDITA02122024063032', 'B00001', 'Oxford putih', 10, 2250000, '2024-10-13', NULL, '2024-12-01 23:30:32', '2024-12-01 23:30:32'),
(35, 'DTRINVESSE IURE QUO DOLOR02122024063101', 'B00009', 'Cemani hijau', 25, 1900000, '2024-10-14', NULL, '2024-12-01 23:31:01', '2024-12-01 23:31:01'),
(36, 'DTRINVESSE IURE QUO DOLOR02122024063101', 'B00004', 'Cemani merah', 20, 1900000, '2024-10-14', NULL, '2024-12-01 23:31:01', '2024-12-01 23:31:01'),
(37, 'DTRINVESSE IURE QUO DOLOR02122024063101', 'B00001', 'Oxford putih', 15, 2250000, '2024-10-14', NULL, '2024-12-01 23:31:01', '2024-12-01 23:31:01'),
(38, 'DTRINVVOLUPTATEM02122024063225', 'B00007', 'Cemani abu', 25, 1900000, '2024-10-15', NULL, '2024-12-01 23:32:25', '2024-12-01 23:32:25'),
(39, 'DTRINVVOLUPTATEM02122024063225', 'B00005', 'Cemani coklat', 43, 1900000, '2024-10-15', NULL, '2024-12-01 23:32:25', '2024-12-01 23:32:25'),
(40, 'DTRINVQUIA QUI VEL LIBERO02122024063245', 'B00003', 'Allino kopi susu', 20, 2200000, '2024-10-16', NULL, '2024-12-01 23:32:45', '2024-12-01 23:32:45'),
(41, 'DTRINVQUIA QUI VEL LIBERO02122024063245', 'B00007', 'Cemani abu', 15, 1900000, '2024-10-16', NULL, '2024-12-01 23:32:45', '2024-12-01 23:32:45'),
(42, 'DTRINVBLANDITIIS ID ET FA02122024063315', 'B00009', 'Cemani hijau', 20, 1900000, '2024-10-17', NULL, '2024-12-01 23:33:15', '2024-12-01 23:33:15'),
(43, 'DTRINVBLANDITIIS ID ET FA02122024063315', 'B00002', 'Oxford coklat', 20, 2100000, '2024-10-17', NULL, '2024-12-01 23:33:15', '2024-12-01 23:33:15'),
(44, 'DTRINVBLANDITIIS ID ET FA02122024063315', 'B00001', 'Oxford putih', 20, 2250000, '2024-10-17', NULL, '2024-12-01 23:33:15', '2024-12-01 23:33:15'),
(45, 'DTRINVSUNT ET QUAE REM IUR02122024063334', 'B00005', 'Cemani coklat', 25, 1900000, '2024-10-18', NULL, '2024-12-01 23:33:34', '2024-12-01 23:33:34'),
(46, 'DTRINVSUNT ET QUAE REM IUR02122024063334', 'B00006', 'Cemani dongker', 25, 1900000, '2024-10-18', NULL, '2024-12-01 23:33:34', '2024-12-01 23:33:34'),
(47, 'DTRINVEOS TOTAM OFFICIA EA02122024063401', 'B00008', 'Cemani putih', 50, 1900000, '2024-10-19', NULL, '2024-12-01 23:34:01', '2024-12-01 23:34:01'),
(48, 'DTRINVEOS TOTAM OFFICIA EA02122024063401', 'B00003', 'Allino kopi susu', 15, 2200000, '2024-10-19', NULL, '2024-12-01 23:34:01', '2024-12-01 23:34:01'),
(49, 'DTRINVEOS TOTAM OFFICIA EA02122024063401', 'B00002', 'Oxford coklat', 15, 2100000, '2024-10-19', NULL, '2024-12-01 23:34:01', '2024-12-01 23:34:01'),
(50, 'DTRINVEXPEDITA ULLAM IUSTO02122024063421', 'B00005', 'Cemani coklat', 15, 1900000, '2024-10-20', NULL, '2024-12-01 23:34:21', '2024-12-01 23:34:21'),
(51, 'DTRINVEXPEDITA ULLAM IUSTO02122024063421', 'B00006', 'Cemani dongker', 40, 1900000, '2024-10-20', NULL, '2024-12-01 23:34:21', '2024-12-01 23:34:21'),
(52, 'DTRINVDOLOREM UT ADIPISICI02122024063443', 'B00004', 'Cemani merah', 15, 1900000, '2024-10-21', NULL, '2024-12-01 23:34:43', '2024-12-01 23:34:43'),
(53, 'DTRINVDOLOREM UT ADIPISICI02122024063443', 'B00002', 'Oxford coklat', 15, 2100000, '2024-10-21', NULL, '2024-12-01 23:34:43', '2024-12-01 23:34:43'),
(54, 'DTRINVQUAERAT EUM VELIT VO02122024063507', 'B00007', 'Cemani abu', 33, 1900000, '2024-10-22', NULL, '2024-12-01 23:35:07', '2024-12-01 23:35:07'),
(55, 'DTRINVQUAERAT EUM VELIT VO02122024063507', 'B00004', 'Cemani merah', 48, 1900000, '2024-10-22', NULL, '2024-12-01 23:35:07', '2024-12-01 23:35:07'),
(56, 'DTRINVET NUMQUAM IMPEDIT02122024063529', 'B00003', 'Allino kopi susu', 20, 2200000, '2024-10-23', NULL, '2024-12-01 23:35:29', '2024-12-01 23:35:29'),
(57, 'DTRINVET NUMQUAM IMPEDIT02122024063529', 'B00008', 'Cemani putih', 15, 1900000, '2024-10-23', NULL, '2024-12-01 23:35:29', '2024-12-01 23:35:29'),
(58, 'DTRINVVITAE MAGNAM PERSPIC02122024063548', 'B00009', 'Cemani hijau', 25, 1900000, '2024-10-24', NULL, '2024-12-01 23:35:48', '2024-12-01 23:35:48'),
(59, 'DTRINVVITAE MAGNAM PERSPIC02122024063548', 'B00008', 'Cemani putih', 25, 1900000, '2024-10-24', NULL, '2024-12-01 23:35:48', '2024-12-01 23:35:48'),
(60, 'DTRINVVITAE MAGNAM PERSPIC02122024063548', 'B00002', 'Oxford coklat', 5, 2100000, '2024-10-24', NULL, '2024-12-01 23:35:48', '2024-12-01 23:35:48'),
(61, 'DTRINVSINT FACILIS SIT A02122024063608', 'B00003', 'Allino kopi susu', 58, 2200000, '2024-10-25', NULL, '2024-12-01 23:36:08', '2024-12-01 23:36:08'),
(62, 'DTRINVSINT FACILIS SIT A02122024063608', 'B00005', 'Cemani coklat', 25, 1900000, '2024-10-25', NULL, '2024-12-01 23:36:08', '2024-12-01 23:36:08'),
(63, 'DTRINVQUIA MAXIME VEL DOLO02122024063633', 'B00009', 'Cemani hijau', 25, 1900000, '2024-10-26', NULL, '2024-12-01 23:36:33', '2024-12-01 23:36:33'),
(64, 'DTRINVQUIA MAXIME VEL DOLO02122024063633', 'B00004', 'Cemani merah', 5, 1900000, '2024-10-26', NULL, '2024-12-01 23:36:34', '2024-12-01 23:36:34'),
(65, 'DTRINVQUIA MAXIME VEL DOLO02122024063633', 'B00001', 'Oxford putih', 5, 2250000, '2024-10-26', NULL, '2024-12-01 23:36:34', '2024-12-01 23:36:34'),
(66, 'DTRINVNON ID ENIM EXPLICA02122024063658', 'B00006', 'Cemani dongker', 20, 1900000, '2024-10-27', NULL, '2024-12-01 23:36:58', '2024-12-01 23:36:58'),
(67, 'DTRINVNON ID ENIM EXPLICA02122024063658', 'B00002', 'Oxford coklat', 40, 2100000, '2024-10-27', NULL, '2024-12-01 23:36:58', '2024-12-01 23:36:58'),
(68, 'DTRINVNON ID ENIM EXPLICA02122024063658', 'B00001', 'Oxford putih', 35, 2250000, '2024-10-27', NULL, '2024-12-01 23:36:58', '2024-12-01 23:36:58'),
(69, 'DTRINVASPERNATUR ASSUMENDA02122024063721', 'B00004', 'Cemani merah', 25, 1900000, '2024-10-28', NULL, '2024-12-01 23:37:21', '2024-12-01 23:37:21'),
(70, 'DTRINVASPERNATUR ASSUMENDA02122024063721', 'B00002', 'Oxford coklat', 15, 2100000, '2024-10-28', NULL, '2024-12-01 23:37:21', '2024-12-01 23:37:21'),
(71, 'DTRINVQUISQUAM FUGIAT LABO02122024063738', 'B00007', 'Cemani abu', 60, 1900000, '2024-10-29', NULL, '2024-12-01 23:37:38', '2024-12-01 23:37:38'),
(72, 'DTRINVDO ENIM ARCHITECTO D02122024063822', 'B00004', 'Cemani merah', 15, 1900000, '2024-10-30', NULL, '2024-12-01 23:38:22', '2024-12-01 23:38:22'),
(73, 'DTRINVDO ENIM ARCHITECTO D02122024063822', 'B00008', 'Cemani putih', 25, 1900000, '2024-10-30', NULL, '2024-12-01 23:38:22', '2024-12-01 23:38:22'),
(74, 'DTRINVDO ENIM ARCHITECTO D02122024063822', 'B00002', 'Oxford coklat', 10, 2100000, '2024-10-30', NULL, '2024-12-01 23:38:22', '2024-12-01 23:38:22'),
(75, 'DTRINVVENIAM NON IPSAM EN02122024063931', 'B00006', 'Cemani dongker', 20, 1900000, '2024-10-31', NULL, '2024-12-01 23:39:31', '2024-12-01 23:39:31'),
(76, 'DTRINVVENIAM NON IPSAM EN02122024063931', 'B00005', 'Cemani coklat', 25, 1900000, '2024-10-31', NULL, '2024-12-01 23:39:31', '2024-12-01 23:39:31'),
(77, 'DTRINVVENIAM NON IPSAM EN02122024063931', 'B00001', 'Oxford putih', 10, 2250000, '2024-10-31', NULL, '2024-12-01 23:39:31', '2024-12-01 23:39:31'),
(78, 'DTRINVSTEPHANIE YANG02122024112106', 'B00005', 'Cemani coklat', 10, 1900000, '2024-11-01', NULL, '2024-12-02 04:21:06', '2024-12-02 04:21:06'),
(79, 'DTRINVSTEPHANIE YANG02122024112106', 'B00008', 'Cemani putih', 10, 1900000, '2024-11-01', NULL, '2024-12-02 04:21:06', '2024-12-02 04:21:06'),
(80, 'DTRINVSTEPHANIE YANG02122024112106', 'B00001', 'Oxford putih', 45, 2250000, '2024-11-01', NULL, '2024-12-02 04:21:06', '2024-12-02 04:21:06'),
(81, 'DTRINVCHAVA HOLMAN02122024112203', 'B00003', 'Allino kopi susu', 25, 2200000, '2024-11-02', NULL, '2024-12-02 04:22:04', '2024-12-02 04:22:04'),
(82, 'DTRINVCHAVA HOLMAN02122024112203', 'B00007', 'Cemani abu', 15, 1900000, '2024-11-02', NULL, '2024-12-02 04:22:04', '2024-12-02 04:22:04'),
(83, 'DTRINVJESSICA BUTLER02122024112227', 'B00005', 'Cemani coklat', 25, 1900000, '2024-11-03', NULL, '2024-12-02 04:22:27', '2024-12-02 04:22:27'),
(84, 'DTRINVJESSICA BUTLER02122024112227', 'B00003', 'Allino kopi susu', 25, 2200000, '2024-11-03', NULL, '2024-12-02 04:22:27', '2024-12-02 04:22:27'),
(85, 'DTRINVJERRY BAXTER02122024112305', 'B00007', 'Cemani abu', 25, 1900000, '2024-11-04', NULL, '2024-12-02 04:23:05', '2024-12-02 04:23:05'),
(86, 'DTRINVJERRY BAXTER02122024112305', 'B00006', 'Cemani dongker', 20, 1900000, '2024-11-04', NULL, '2024-12-02 04:23:05', '2024-12-02 04:23:05'),
(87, 'DTRINVJERRY BAXTER02122024112305', 'B00002', 'Oxford coklat', 20, 2100000, '2024-11-04', NULL, '2024-12-02 04:23:05', '2024-12-02 04:23:05'),
(88, 'DTRINVORLA COLLIER02122024112350', 'B00008', 'Cemani putih', 25, 1900000, '2024-11-05', NULL, '2024-12-02 04:23:50', '2024-12-02 04:23:50'),
(89, 'DTRINVORLA COLLIER02122024112350', 'B00004', 'Cemani merah', 40, 1900000, '2024-11-05', NULL, '2024-12-02 04:23:50', '2024-12-02 04:23:50'),
(90, 'DTRINVORLA COLLIER02122024112350', 'B00002', 'Oxford coklat', 40, 2100000, '2024-11-05', NULL, '2024-12-02 04:23:50', '2024-12-02 04:23:50'),
(91, 'DTRINVPALMER ALVAREZ02122024112417', 'B00008', 'Cemani putih', 20, 1900000, '2024-11-06', NULL, '2024-12-02 04:24:17', '2024-12-02 04:24:17'),
(92, 'DTRINVPALMER ALVAREZ02122024112417', 'B00007', 'Cemani abu', 15, 1900000, '2024-11-06', NULL, '2024-12-02 04:24:17', '2024-12-02 04:24:17'),
(93, 'DTRINVCAMILLE KLEIN02122024112453', 'B00003', 'Allino kopi susu', 20, 2200000, '2024-11-07', NULL, '2024-12-02 04:24:53', '2024-12-02 04:24:53'),
(94, 'DTRINVCAMILLE KLEIN02122024112453', 'B00001', 'Oxford putih', 20, 2250000, '2024-11-07', NULL, '2024-12-02 04:24:53', '2024-12-02 04:24:53'),
(95, 'DTRINVWALKER TRAN02122024112518', 'B00009', 'Cemani hijau', 25, 1900000, '2024-11-08', NULL, '2024-12-02 04:25:18', '2024-12-02 04:25:18'),
(96, 'DTRINVWALKER TRAN02122024112518', 'B00005', 'Cemani coklat', 25, 1900000, '2024-11-08', NULL, '2024-12-02 04:25:18', '2024-12-02 04:25:18'),
(97, 'DTRINVARMAND BOONE02122024112539', 'B00006', 'Cemani dongker', 10, 1900000, '2024-11-09', NULL, '2024-12-02 04:25:39', '2024-12-02 04:25:39'),
(98, 'DTRINVARMAND BOONE02122024112539', 'B00002', 'Oxford coklat', 25, 2100000, '2024-11-09', NULL, '2024-12-02 04:25:39', '2024-12-02 04:25:39'),
(99, 'DTRINVNATALIE PIERCE02122024112646', 'B00005', 'Cemani coklat', 40, 1900000, '2024-11-10', NULL, '2024-12-02 04:26:46', '2024-12-02 04:26:46'),
(100, 'DTRINVNATALIE PIERCE02122024112646', 'B00004', 'Cemani merah', 10, 1900000, '2024-11-10', NULL, '2024-12-02 04:26:46', '2024-12-02 04:26:46'),
(101, 'DTRINVNATALIE PIERCE02122024112646', 'B00002', 'Oxford coklat', 65, 2100000, '2024-11-10', NULL, '2024-12-02 04:26:46', '2024-12-02 04:26:46'),
(102, 'DTRINVMAGEE VAZQUEZ02122024112720', 'B00009', 'Cemani hijau', 15, 1900000, '2024-11-11', NULL, '2024-12-02 04:27:20', '2024-12-02 04:27:20'),
(103, 'DTRINVMAGEE VAZQUEZ02122024112720', 'B00007', 'Cemani abu', 10, 1900000, '2024-11-11', NULL, '2024-12-02 04:27:20', '2024-12-02 04:27:20'),
(104, 'DTRINVMAGEE VAZQUEZ02122024112720', 'B00003', 'Allino kopi susu', 10, 2200000, '2024-11-11', NULL, '2024-12-02 04:27:20', '2024-12-02 04:27:20'),
(105, 'DTRINVMAGEE VAZQUEZ02122024112720', 'B00001', 'Oxford putih', 25, 2250000, '2024-11-11', NULL, '2024-12-02 04:27:20', '2024-12-02 04:27:20'),
(106, 'DTRINVGIL STEWART02122024113028', 'B00006', 'Cemani dongker', 48, 1900000, '2024-11-12', NULL, '2024-12-02 04:30:28', '2024-12-02 04:30:28'),
(107, 'DTRINVGIL STEWART02122024113028', 'B00008', 'Cemani putih', 20, 1900000, '2024-11-12', NULL, '2024-12-02 04:30:28', '2024-12-02 04:30:28'),
(108, 'DTRINVGIL STEWART02122024113028', 'B00001', 'Oxford putih', 25, 2250000, '2024-11-12', NULL, '2024-12-02 04:30:28', '2024-12-02 04:30:28'),
(109, 'DTRINVALLEGRA SCHULTZ02122024113144', 'B00003', 'Allino kopi susu', 25, 2200000, '2024-11-13', NULL, '2024-12-02 04:31:44', '2024-12-02 04:31:44'),
(110, 'DTRINVALLEGRA SCHULTZ02122024113144', 'B00007', 'Cemani abu', 10, 1900000, '2024-11-13', NULL, '2024-12-02 04:31:44', '2024-12-02 04:31:44'),
(111, 'DTRINVALLEGRA SCHULTZ02122024113144', 'B00001', 'Oxford putih', 10, 2250000, '2024-11-13', NULL, '2024-12-02 04:31:44', '2024-12-02 04:31:44'),
(112, 'DTRINVJACK GOULD02122024113216', 'B00009', 'Cemani hijau', 25, 1900000, '2024-11-14', NULL, '2024-12-02 04:32:16', '2024-12-02 04:32:16'),
(113, 'DTRINVJACK GOULD02122024113216', 'B00004', 'Cemani merah', 20, 1900000, '2024-11-14', NULL, '2024-12-02 04:32:16', '2024-12-02 04:32:16'),
(114, 'DTRINVJACK GOULD02122024113216', 'B00001', 'Oxford putih', 15, 2250000, '2024-11-14', NULL, '2024-12-02 04:32:16', '2024-12-02 04:32:16'),
(115, 'DTRINVHILDA HARRELL02122024113240', 'B00007', 'Cemani abu', 25, 1900000, '2024-11-15', NULL, '2024-12-02 04:32:40', '2024-12-02 04:32:40'),
(116, 'DTRINVHILDA HARRELL02122024113240', 'B00005', 'Cemani coklat', 55, 1900000, '2024-11-15', NULL, '2024-12-02 04:32:40', '2024-12-02 04:32:40'),
(117, 'DTRINVDAVID SOLIS02122024113305', 'B00003', 'Allino kopi susu', 20, 2200000, '2024-11-16', NULL, '2024-12-02 04:33:05', '2024-12-02 04:33:05'),
(118, 'DTRINVDAVID SOLIS02122024113305', 'B00007', 'Cemani abu', 15, 1900000, '2024-11-16', NULL, '2024-12-02 04:33:05', '2024-12-02 04:33:05'),
(119, 'DTRINVFREDERICKA VALDEZ02122024113335', 'B00009', 'Cemani hijau', 20, 1900000, '2024-11-17', NULL, '2024-12-02 04:33:35', '2024-12-02 04:33:35'),
(120, 'DTRINVFREDERICKA VALDEZ02122024113335', 'B00002', 'Oxford coklat', 20, 2100000, '2024-11-17', NULL, '2024-12-02 04:33:35', '2024-12-02 04:33:35'),
(121, 'DTRINVFREDERICKA VALDEZ02122024113335', 'B00001', 'Oxford putih', 20, 2250000, '2024-11-17', NULL, '2024-12-02 04:33:35', '2024-12-02 04:33:35'),
(122, 'DTRINVNOMLANGA FOSTER02122024113355', 'B00005', 'Cemani coklat', 25, 1900000, '2024-11-18', NULL, '2024-12-02 04:33:55', '2024-12-02 04:33:55'),
(123, 'DTRINVNOMLANGA FOSTER02122024113355', 'B00006', 'Cemani dongker', 25, 1900000, '2024-11-18', NULL, '2024-12-02 04:33:55', '2024-12-02 04:33:55'),
(124, 'DTRINVSTEPHANIE JARVIS02122024113418', 'B00008', 'Cemani putih', 60, 1900000, '2024-11-19', NULL, '2024-12-02 04:34:18', '2024-12-02 04:34:18'),
(125, 'DTRINVSTEPHANIE JARVIS02122024113418', 'B00003', 'Allino kopi susu', 15, 2200000, '2024-11-19', NULL, '2024-12-02 04:34:18', '2024-12-02 04:34:18'),
(126, 'DTRINVSTEPHANIE JARVIS02122024113418', 'B00002', 'Oxford coklat', 15, 2100000, '2024-11-19', NULL, '2024-12-02 04:34:18', '2024-12-02 04:34:18'),
(127, 'DTRINVWADE FRAZIER02122024113443', 'B00005', 'Cemani coklat', 15, 1900000, '2024-11-20', NULL, '2024-12-02 04:34:43', '2024-12-02 04:34:43'),
(128, 'DTRINVWADE FRAZIER02122024113443', 'B00006', 'Cemani dongker', 40, 1900000, '2024-11-20', NULL, '2024-12-02 04:34:43', '2024-12-02 04:34:43'),
(129, 'DTRINVABEL HODGE02122024113502', 'B00004', 'Cemani merah', 15, 1900000, '2024-11-21', NULL, '2024-12-02 04:35:02', '2024-12-02 04:35:02'),
(130, 'DTRINVABEL HODGE02122024113502', 'B00002', 'Oxford coklat', 15, 2100000, '2024-11-21', NULL, '2024-12-02 04:35:02', '2024-12-02 04:35:02'),
(131, 'DTRINVCARA CRUZ02122024113526', 'B00007', 'Cemani abu', 33, 1900000, '2024-11-22', NULL, '2024-12-02 04:35:26', '2024-12-02 04:35:26'),
(132, 'DTRINVCARA CRUZ02122024113526', 'B00004', 'Cemani merah', 46, 1900000, '2024-11-22', NULL, '2024-12-02 04:35:26', '2024-12-02 04:35:26'),
(133, 'DTRINVTASHYA CHEN02122024113548', 'B00003', 'Allino kopi susu', 20, 2200000, '2024-11-23', NULL, '2024-12-02 04:35:48', '2024-12-02 04:35:48'),
(134, 'DTRINVTASHYA CHEN02122024113548', 'B00008', 'Cemani putih', 15, 1900000, '2024-11-23', NULL, '2024-12-02 04:35:48', '2024-12-02 04:35:48'),
(135, 'DTRINVHAVIVA FLETCHER02122024113618', 'B00009', 'Cemani hijau', 25, 1900000, '2024-11-24', NULL, '2024-12-02 04:36:18', '2024-12-02 04:36:18'),
(136, 'DTRINVHAVIVA FLETCHER02122024113618', 'B00008', 'Cemani putih', 25, 1900000, '2024-11-24', NULL, '2024-12-02 04:36:18', '2024-12-02 04:36:18'),
(137, 'DTRINVHAVIVA FLETCHER02122024113618', 'B00002', 'Oxford coklat', 5, 2100000, '2024-11-24', NULL, '2024-12-02 04:36:18', '2024-12-02 04:36:18'),
(138, 'DTRINVCARYN CALDWELL02122024113638', 'B00003', 'Allino kopi susu', 54, 2200000, '2024-11-25', NULL, '2024-12-02 04:36:38', '2024-12-02 04:36:38'),
(139, 'DTRINVCARYN CALDWELL02122024113638', 'B00005', 'Cemani coklat', 25, 1900000, '2024-11-25', NULL, '2024-12-02 04:36:38', '2024-12-02 04:36:38'),
(140, 'DTRINVHARPER MULLINS02122024113700', 'B00009', 'Cemani hijau', 25, 1900000, '2024-11-26', NULL, '2024-12-02 04:37:00', '2024-12-02 04:37:00'),
(141, 'DTRINVHARPER MULLINS02122024113700', 'B00004', 'Cemani merah', 5, 1900000, '2024-11-26', NULL, '2024-12-02 04:37:00', '2024-12-02 04:37:00'),
(142, 'DTRINVHARPER MULLINS02122024113700', 'B00001', 'Oxford putih', 5, 2250000, '2024-11-26', NULL, '2024-12-02 04:37:00', '2024-12-02 04:37:00'),
(143, 'DTRINVTANA WHITNEY02122024113721', 'B00006', 'Cemani dongker', 20, 1900000, '2024-11-27', NULL, '2024-12-02 04:37:21', '2024-12-02 04:37:21'),
(144, 'DTRINVTANA WHITNEY02122024113721', 'B00002', 'Oxford coklat', 40, 2100000, '2024-11-27', NULL, '2024-12-02 04:37:21', '2024-12-02 04:37:21'),
(145, 'DTRINVTANA WHITNEY02122024113721', 'B00001', 'Oxford putih', 35, 2250000, '2024-11-27', NULL, '2024-12-02 04:37:21', '2024-12-02 04:37:21'),
(146, 'DTRINVKARINA KERR02122024113740', 'B00004', 'Cemani merah', 25, 1900000, '2024-11-28', NULL, '2024-12-02 04:37:40', '2024-12-02 04:37:40'),
(147, 'DTRINVKARINA KERR02122024113740', 'B00002', 'Oxford coklat', 15, 2100000, '2024-11-28', NULL, '2024-12-02 04:37:40', '2024-12-02 04:37:40'),
(148, 'DTRINVBECK RAYMOND02122024113755', 'B00007', 'Cemani abu', 64, 1900000, '2024-11-29', NULL, '2024-12-02 04:37:55', '2024-12-02 04:37:55'),
(149, 'DTRINVMAGGY GREENE02122024113815', 'B00004', 'Cemani merah', 15, 1900000, '2024-11-30', NULL, '2024-12-02 04:38:15', '2024-12-02 04:38:15'),
(150, 'DTRINVMAGGY GREENE02122024113815', 'B00008', 'Cemani putih', 25, 1900000, '2024-11-30', NULL, '2024-12-02 04:38:15', '2024-12-02 04:38:15'),
(151, 'DTRINVMAGGY GREENE02122024113815', 'B00002', 'Oxford coklat', 10, 2100000, '2024-11-30', NULL, '2024-12-02 04:38:15', '2024-12-02 04:38:15'),
(161, 'DTRINVGWENDOLYN HUBER21012025010432', 'B00005', 'Cemani coklat', 12, 1900000, '2024-12-01', NULL, '2025-01-20 18:04:33', '2025-01-20 18:04:33'),
(162, 'DTRINVGWENDOLYN HUBER21012025010432', 'B00008', 'Cemani putih', 13, 1900000, '2024-12-01', NULL, '2025-01-20 18:04:33', '2025-01-20 18:04:33'),
(163, 'DTRINVGWENDOLYN HUBER21012025010432', 'B00001', 'Oxford putih', 42, 2250000, '2024-12-01', NULL, '2025-01-20 18:04:33', '2025-01-20 18:04:33'),
(164, 'DTRINVALTHEA TOWNSEND21012025010521', 'B00003', 'Allino kopi susu', 25, 2200000, '2024-12-02', NULL, '2025-01-20 18:05:21', '2025-01-20 18:05:21'),
(165, 'DTRINVALTHEA TOWNSEND21012025010521', 'B00007', 'Cemani abu', 15, 1900000, '2024-12-02', NULL, '2025-01-20 18:05:21', '2025-01-20 18:05:21'),
(166, 'DTRINVCHANDA QUINN21012025010550', 'B00009', 'Cemani hijau', 25, 1900000, '2024-12-03', NULL, '2025-01-20 18:05:50', '2025-01-20 18:05:50'),
(167, 'DTRINVCHANDA QUINN21012025010550', 'B00008', 'Cemani putih', 25, 1900000, '2024-12-03', NULL, '2025-01-20 18:05:50', '2025-01-20 18:05:50'),
(168, 'DTRINVDEAN ROGERS21012025010628', 'B00005', 'Cemani coklat', 25, 1900000, '2024-12-04', NULL, '2025-01-20 18:06:28', '2025-01-20 18:06:28'),
(169, 'DTRINVDEAN ROGERS21012025010628', 'B00006', 'Cemani dongker', 20, 1900000, '2024-12-04', NULL, '2025-01-20 18:06:28', '2025-01-20 18:06:28'),
(170, 'DTRINVDEAN ROGERS21012025010628', 'B00002', 'Oxford coklat', 10, 2100000, '2024-12-04', NULL, '2025-01-20 18:06:28', '2025-01-20 18:06:28'),
(171, 'DTRINVEMERALD CHANEY21012025010708', 'B00007', 'Cemani abu', 20, 1900000, '2024-12-05', NULL, '2025-01-20 18:07:08', '2025-01-20 18:07:08'),
(172, 'DTRINVEMERALD CHANEY21012025010708', 'B00004', 'Cemani merah', 40, 1900000, '2024-12-05', NULL, '2025-01-20 18:07:08', '2025-01-20 18:07:08'),
(173, 'DTRINVEMERALD CHANEY21012025010708', 'B00002', 'Oxford coklat', 56, 2100000, '2024-12-05', NULL, '2025-01-20 18:07:08', '2025-01-20 18:07:08'),
(174, 'DTRINVHASAD FERRELL21012025010738', 'B00007', 'Cemani abu', 20, 1900000, '2024-12-06', NULL, '2025-01-20 18:07:38', '2025-01-20 18:07:38'),
(175, 'DTRINVHASAD FERRELL21012025010738', 'B00005', 'Cemani coklat', 15, 1900000, '2024-12-06', NULL, '2025-01-20 18:07:38', '2025-01-20 18:07:38'),
(176, 'DTRINVWYOMING MARTIN21012025010802', 'B00001', 'Oxford putih', 15, 2250000, '2024-12-07', NULL, '2025-01-20 18:08:02', '2025-01-20 18:08:02'),
(177, 'DTRINVWYOMING MARTIN21012025010802', 'B00008', 'Cemani putih', 20, 1900000, '2024-12-07', NULL, '2025-01-20 18:08:02', '2025-01-20 18:08:02'),
(178, 'DTRINVBELL JACOBS21012025010828', 'B00003', 'Allino kopi susu', 25, 2200000, '2024-12-08', NULL, '2025-01-20 18:08:28', '2025-01-20 18:08:28'),
(179, 'DTRINVBELL JACOBS21012025010828', 'B00009', 'Cemani hijau', 25, 1900000, '2024-12-08', NULL, '2025-01-20 18:08:28', '2025-01-20 18:08:28'),
(180, 'DTRINVSTACY CONTRERAS21012025010850', 'B00006', 'Cemani dongker', 10, 1900000, '2024-12-09', NULL, '2025-01-20 18:08:51', '2025-01-20 18:08:51'),
(181, 'DTRINVSTACY CONTRERAS21012025010850', 'B00002', 'Oxford coklat', 25, 2100000, '2024-12-09', NULL, '2025-01-20 18:08:51', '2025-01-20 18:08:51'),
(182, 'DTRINVMOLLIE TAYLOR21012025011011', 'B00009', 'Cemani hijau', 65, 1900000, '2024-12-10', NULL, '2025-01-20 18:10:11', '2025-01-20 18:10:11'),
(183, 'DTRINVMOLLIE TAYLOR21012025011011', 'B00004', 'Cemani merah', 10, 1900000, '2024-12-10', NULL, '2025-01-20 18:10:11', '2025-01-20 18:10:11'),
(184, 'DTRINVMOLLIE TAYLOR21012025011011', 'B00002', 'Oxford coklat', 56, 2100000, '2024-12-10', NULL, '2025-01-20 18:10:11', '2025-01-20 18:10:11'),
(185, 'DTRINVAUGUST LARA21012025011055', 'B00003', 'Allino kopi susu', 15, 2200000, '2024-12-11', NULL, '2025-01-20 18:10:55', '2025-01-20 18:10:55'),
(186, 'DTRINVAUGUST LARA21012025011055', 'B00005', 'Cemani coklat', 10, 1900000, '2024-12-11', NULL, '2025-01-20 18:10:55', '2025-01-20 18:10:55'),
(187, 'DTRINVAUGUST LARA21012025011055', 'B00008', 'Cemani putih', 10, 1900000, '2024-12-11', NULL, '2025-01-20 18:10:55', '2025-01-20 18:10:55'),
(188, 'DTRINVAUGUST LARA21012025011055', 'B00001', 'Oxford putih', 25, 2250000, '2024-12-11', NULL, '2025-01-20 18:10:55', '2025-01-20 18:10:55'),
(189, 'DTRINVNOMLANGA HATFIELD21012025011121', 'B00006', 'Cemani dongker', 58, 1900000, '2024-12-12', NULL, '2025-01-20 18:11:21', '2025-01-20 18:11:21'),
(190, 'DTRINVNOMLANGA HATFIELD21012025011121', 'B00008', 'Cemani putih', 20, 1900000, '2024-12-12', NULL, '2025-01-20 18:11:21', '2025-01-20 18:11:21'),
(191, 'DTRINVNOMLANGA HATFIELD21012025011121', 'B00001', 'Oxford putih', 25, 2250000, '2024-12-12', NULL, '2025-01-20 18:11:21', '2025-01-20 18:11:21'),
(192, 'DTRINVJUSTIN GRAY21012025011146', 'B00003', 'Allino kopi susu', 25, 2200000, '2024-12-13', NULL, '2025-01-20 18:11:46', '2025-01-20 18:11:46'),
(193, 'DTRINVJUSTIN GRAY21012025011146', 'B00007', 'Cemani abu', 10, 1900000, '2024-12-13', NULL, '2025-01-20 18:11:46', '2025-01-20 18:11:46'),
(194, 'DTRINVJUSTIN GRAY21012025011146', 'B00001', 'Oxford putih', 10, 2250000, '2024-12-13', NULL, '2025-01-20 18:11:46', '2025-01-20 18:11:46'),
(195, 'DTRINVUMA MAYER21012025011217', 'B00009', 'Cemani hijau', 25, 1900000, '2024-12-14', NULL, '2025-01-20 18:12:17', '2025-01-20 18:12:17'),
(196, 'DTRINVUMA MAYER21012025011217', 'B00004', 'Cemani merah', 20, 1900000, '2024-12-14', NULL, '2025-01-20 18:12:17', '2025-01-20 18:12:17'),
(197, 'DTRINVUMA MAYER21012025011217', 'B00001', 'Oxford putih', 15, 2250000, '2024-12-14', NULL, '2025-01-20 18:12:17', '2025-01-20 18:12:17'),
(198, 'DTRINVRAYMOND DALTON21012025011241', 'B00007', 'Cemani abu', 25, 1900000, '2024-12-15', NULL, '2025-01-20 18:12:42', '2025-01-20 18:12:42'),
(199, 'DTRINVRAYMOND DALTON21012025011241', 'B00005', 'Cemani coklat', 60, 1900000, '2024-12-15', NULL, '2025-01-20 18:12:42', '2025-01-20 18:12:42'),
(200, 'DTRINVHOLMES YATES21012025011308', 'B00003', 'Allino kopi susu', 20, 2200000, '2024-12-16', NULL, '2025-01-20 18:13:08', '2025-01-20 18:13:08'),
(201, 'DTRINVHOLMES YATES21012025011308', 'B00007', 'Cemani abu', 15, 1900000, '2024-12-16', NULL, '2025-01-20 18:13:08', '2025-01-20 18:13:08'),
(202, 'DTRINVBELL HULL21012025011332', 'B00009', 'Cemani hijau', 20, 1900000, '2024-12-17', NULL, '2025-01-20 18:13:32', '2025-01-20 18:13:32'),
(203, 'DTRINVBELL HULL21012025011332', 'B00002', 'Oxford coklat', 20, 2100000, '2024-12-17', NULL, '2025-01-20 18:13:32', '2025-01-20 18:13:32'),
(204, 'DTRINVBELL HULL21012025011332', 'B00001', 'Oxford putih', 20, 2250000, '2024-12-17', NULL, '2025-01-20 18:13:32', '2025-01-20 18:13:32'),
(205, 'DTRINVALEXANDRA GARZA21012025011354', 'B00005', 'Cemani coklat', 25, 1900000, '2024-12-18', NULL, '2025-01-20 18:13:54', '2025-01-20 18:13:54'),
(206, 'DTRINVALEXANDRA GARZA21012025011354', 'B00006', 'Cemani dongker', 25, 1900000, '2024-12-18', NULL, '2025-01-20 18:13:54', '2025-01-20 18:13:54'),
(207, 'DTRINVLAURA DURHAM21012025011424', 'B00008', 'Cemani putih', 65, 1900000, '2024-12-19', NULL, '2025-01-20 18:14:24', '2025-01-20 18:14:24'),
(208, 'DTRINVLAURA DURHAM21012025011424', 'B00003', 'Allino kopi susu', 15, 2200000, '2024-12-19', NULL, '2025-01-20 18:14:24', '2025-01-20 18:14:24'),
(209, 'DTRINVLAURA DURHAM21012025011424', 'B00002', 'Oxford coklat', 15, 2100000, '2024-12-19', NULL, '2025-01-20 18:14:24', '2025-01-20 18:14:24'),
(210, 'DTRINVMANNIX HAYS21012025011451', 'B00005', 'Cemani coklat', 15, 1900000, '2024-12-20', NULL, '2025-01-20 18:14:51', '2025-01-20 18:14:51'),
(211, 'DTRINVMANNIX HAYS21012025011451', 'B00006', 'Cemani dongker', 40, 1900000, '2024-12-20', NULL, '2025-01-20 18:14:51', '2025-01-20 18:14:51'),
(212, 'DTRINVWYLIE STEVENS21012025011516', 'B00004', 'Cemani merah', 15, 1900000, '2024-12-21', NULL, '2025-01-20 18:15:16', '2025-01-20 18:15:16'),
(213, 'DTRINVWYLIE STEVENS21012025011516', 'B00002', 'Oxford coklat', 15, 2100000, '2024-12-21', NULL, '2025-01-20 18:15:16', '2025-01-20 18:15:16'),
(214, 'DTRINVFLEUR CARRILLO21012025011547', 'B00007', 'Cemani abu', 33, 1900000, '2024-12-22', NULL, '2025-01-20 18:15:47', '2025-01-20 18:15:47'),
(215, 'DTRINVFLEUR CARRILLO21012025011547', 'B00004', 'Cemani merah', 56, 1900000, '2024-12-22', NULL, '2025-01-20 18:15:47', '2025-01-20 18:15:47'),
(216, 'DTRINVROBIN MEYERS21012025011614', 'B00003', 'Allino kopi susu', 20, 2200000, '2024-12-23', NULL, '2025-01-20 18:16:14', '2025-01-20 18:16:14'),
(217, 'DTRINVROBIN MEYERS21012025011614', 'B00008', 'Cemani putih', 10, 1900000, '2024-12-23', NULL, '2025-01-20 18:16:14', '2025-01-20 18:16:14'),
(218, 'DTRINVHILEL CUNNINGHAM21012025011639', 'B00009', 'Cemani hijau', 25, 1900000, '2024-12-24', NULL, '2025-01-20 18:16:39', '2025-01-20 18:16:39'),
(219, 'DTRINVHILEL CUNNINGHAM21012025011639', 'B00008', 'Cemani putih', 25, 1900000, '2024-12-24', NULL, '2025-01-20 18:16:39', '2025-01-20 18:16:39'),
(220, 'DTRINVHILEL CUNNINGHAM21012025011639', 'B00002', 'Oxford coklat', 21, 2100000, '2024-12-24', NULL, '2025-01-20 18:16:39', '2025-01-20 18:16:39'),
(221, 'DTRINVCHASTITY MOLINA21012025011659', 'B00003', 'Allino kopi susu', 58, 2200000, '2024-12-25', NULL, '2025-01-20 18:16:59', '2025-01-20 18:16:59'),
(222, 'DTRINVCHASTITY MOLINA21012025011659', 'B00005', 'Cemani coklat', 25, 1900000, '2024-12-25', NULL, '2025-01-20 18:16:59', '2025-01-20 18:16:59'),
(223, 'DTRINVHOLLEE HICKMAN21012025011726', 'B00009', 'Cemani hijau', 25, 1900000, '2024-12-26', NULL, '2025-01-20 18:17:26', '2025-01-20 18:17:26'),
(224, 'DTRINVHOLLEE HICKMAN21012025011726', 'B00004', 'Cemani merah', 12, 1900000, '2024-12-26', NULL, '2025-01-20 18:17:26', '2025-01-20 18:17:26'),
(225, 'DTRINVHOLLEE HICKMAN21012025011726', 'B00001', 'Oxford putih', 10, 2250000, '2024-12-26', NULL, '2025-01-20 18:17:26', '2025-01-20 18:17:26'),
(226, 'DTRINVKITRA GARRETT21012025011751', 'B00006', 'Cemani dongker', 20, 1900000, '2024-12-27', NULL, '2025-01-20 18:17:51', '2025-01-20 18:17:51'),
(227, 'DTRINVKITRA GARRETT21012025011751', 'B00002', 'Oxford coklat', 40, 2100000, '2024-12-27', NULL, '2025-01-20 18:17:51', '2025-01-20 18:17:51'),
(228, 'DTRINVKITRA GARRETT21012025011751', 'B00001', 'Oxford putih', 35, 2250000, '2024-12-27', NULL, '2025-01-20 18:17:51', '2025-01-20 18:17:51'),
(229, 'DTRINVYASIR HARRELL21012025011826', 'B00004', 'Cemani merah', 25, 1900000, '2024-12-28', NULL, '2025-01-20 18:18:26', '2025-01-20 18:18:26'),
(230, 'DTRINVYASIR HARRELL21012025011826', 'B00002', 'Oxford coklat', 15, 2100000, '2024-12-28', NULL, '2025-01-20 18:18:26', '2025-01-20 18:18:26'),
(231, 'DTRINVPETRA HAWKINS21012025011841', 'B00007', 'Cemani abu', 63, 1900000, '2024-12-29', NULL, '2025-01-20 18:18:41', '2025-01-20 18:18:41'),
(232, 'DTRINVSELMA ALLISON21012025011907', 'B00004', 'Cemani merah', 20, 1900000, '2024-12-30', NULL, '2025-01-20 18:19:07', '2025-01-20 18:19:07'),
(233, 'DTRINVSELMA ALLISON21012025011907', 'B00008', 'Cemani putih', 25, 1900000, '2024-12-30', NULL, '2025-01-20 18:19:07', '2025-01-20 18:19:07'),
(234, 'DTRINVSELMA ALLISON21012025011907', 'B00002', 'Oxford coklat', 15, 2100000, '2024-12-30', NULL, '2025-01-20 18:19:07', '2025-01-20 18:19:07'),
(235, 'DTRINVBRIANNA SANTOS21012025011936', 'B00004', 'Cemani merah', 18, 1900000, '2024-12-31', NULL, '2025-01-20 18:19:36', '2025-01-20 18:19:36'),
(236, 'DTRINVBRIANNA SANTOS21012025011936', 'B00008', 'Cemani putih', 28, 1900000, '2024-12-31', NULL, '2025-01-20 18:19:36', '2025-01-20 18:19:36'),
(237, 'DTRINVBRIANNA SANTOS21012025011936', 'B00002', 'Oxford coklat', 13, 2100000, '2024-12-31', NULL, '2025-01-20 18:19:36', '2025-01-20 18:19:36'),
(238, 'DTRINVAMANDA01012025010432', 'B00005', 'Cemani coklat', 14, 1900000, '2025-01-01', NULL, '2025-01-20 11:04:33', '2025-01-20 11:04:33'),
(239, 'DTRINVAMANDA01012025010432', 'B00008', 'Cemani putih', 17, 1900000, '2025-01-01', NULL, '2025-01-20 11:04:33', '2025-01-20 11:04:33'),
(240, 'DTRINVAMANDA01012025010432', 'B00001', 'Oxford putih', 60, 2250000, '2025-01-01', NULL, '2025-01-20 11:04:33', '2025-01-20 11:04:33'),
(241, 'DTRINVHARIANTO02012025010521', 'B00003', 'Allino kopi susu', 25, 2200000, '2025-01-02', NULL, '2025-01-20 11:05:21', '2025-01-20 11:05:21'),
(242, 'DTRINVHARIANTO02012025010521', 'B00007', 'Cemani abu', 15, 1900000, '2025-01-02', NULL, '2025-01-20 11:05:21', '2025-01-20 11:05:21'),
(243, 'DTRINVLILIS03012025010550', 'B00009', 'Cemani hijau', 25, 1900000, '2025-01-03', NULL, '2025-01-20 11:05:50', '2025-01-20 11:05:50'),
(244, 'DTRINVLILIS03012025010550', 'B00008', 'Cemani putih', 25, 1900000, '2025-01-03', NULL, '2025-01-20 11:05:50', '2025-01-20 11:05:50'),
(245, 'DTRINVFEBRIANTI04012025010628', 'B00005', 'Cemani coklat', 25, 1900000, '2025-01-04', NULL, '2025-01-20 11:06:28', '2025-01-20 11:06:28'),
(246, 'DTRINVFEBRIANTI04012025010628', 'B00006', 'Cemani dongker', 20, 1900000, '2025-01-04', NULL, '2025-01-20 11:06:28', '2025-01-20 11:06:28'),
(247, 'DTRINVFEBRIANTI04012025010628', 'B00002', 'Oxford coklat', 17, 2100000, '2025-01-04', NULL, '2025-01-20 11:06:28', '2025-01-20 11:06:28'),
(248, 'DTRINVFERINA05012025010708', 'B00007', 'Cemani abu', 20, 1900000, '2025-01-05', NULL, '2025-01-20 11:07:08', '2025-01-20 11:07:08'),
(249, 'DTRINVFERINA05012025010708', 'B00004', 'Cemani merah', 40, 1900000, '2025-01-05', NULL, '2025-01-20 11:07:08', '2025-01-20 11:07:08'),
(250, 'DTRINVFERINA05012025010708', 'B00002', 'Oxford coklat', 68, 2100000, '2025-01-05', NULL, '2025-01-20 11:07:08', '2025-01-20 11:07:08'),
(251, 'DTRINVKARTIKA06012025010738', 'B00007', 'Cemani abu', 20, 1900000, '2025-01-06', NULL, '2025-01-20 11:07:38', '2025-01-20 11:07:38'),
(252, 'DTRINVKARTIKA06012025010738', 'B00005', 'Cemani coklat', 15, 1900000, '2025-01-06', NULL, '2025-01-20 11:07:38', '2025-01-20 11:07:38'),
(253, 'DTRINVRENATA07012025010802', 'B00001', 'Oxford putih', 15, 2250000, '2025-01-07', NULL, '2025-01-20 11:08:02', '2025-01-20 11:08:02'),
(254, 'DTRINVRENATA07012025010802', 'B00008', 'Cemani putih', 20, 1900000, '2025-01-07', NULL, '2025-01-20 11:08:02', '2025-01-20 11:08:02'),
(255, 'DTRINVRORO08012025010828', 'B00003', 'Allino kopi susu', 25, 2200000, '2025-01-08', NULL, '2025-01-20 11:08:28', '2025-01-20 11:08:28'),
(256, 'DTRINVRORO08012025010828', 'B00009', 'Cemani hijau', 25, 1900000, '2025-01-08', NULL, '2025-01-20 11:08:28', '2025-01-20 11:08:28'),
(257, 'DTRINVBELINDA09012025010850', 'B00006', 'Cemani dongker', 10, 1900000, '2025-01-09', NULL, '2025-01-20 11:08:51', '2025-01-20 11:08:51'),
(258, 'DTRINVBELINDA09012025010850', 'B00002', 'Oxford coklat', 25, 2100000, '2025-01-09', NULL, '2025-01-20 11:08:51', '2025-01-20 11:08:51'),
(259, 'DTRINVWAHYU10012025011011', 'B00009', 'Cemani hijau', 60, 1900000, '2025-01-10', NULL, '2025-01-20 11:10:11', '2025-01-20 11:10:11'),
(260, 'DTRINVWAHYU10012025011011', 'B00004', 'Cemani merah', 10, 1900000, '2025-01-10', NULL, '2025-01-20 11:10:11', '2025-01-20 11:10:11'),
(261, 'DTRINVWAHYU10012025011011', 'B00002', 'Oxford coklat', 56, 2100000, '2025-01-10', NULL, '2025-01-20 11:10:11', '2025-01-20 11:10:11'),
(262, 'DTRINVLAILA11012025011055', 'B00003', 'Allino kopi susu', 15, 2200000, '2025-01-11', NULL, '2025-01-20 11:10:55', '2025-01-20 11:10:55'),
(263, 'DTRINVLAILA11012025011055', 'B00005', 'Cemani coklat', 10, 1900000, '2025-01-11', NULL, '2025-01-20 11:10:55', '2025-01-20 11:10:55'),
(264, 'DTRINVLAILA11012025011055', 'B00008', 'Cemani putih', 10, 1900000, '2025-01-11', NULL, '2025-01-20 11:10:55', '2025-01-20 11:10:55'),
(265, 'DTRINVLAILA11012025011055', 'B00001', 'Oxford putih', 25, 2250000, '2025-01-11', NULL, '2025-01-20 11:10:55', '2025-01-20 11:10:55'),
(266, 'DTRINVHISNAJM12012025011121', 'B00006', 'Cemani dongker', 50, 1900000, '2025-01-12', NULL, '2025-01-20 11:11:21', '2025-01-20 11:11:21'),
(267, 'DTRINVHISNAJM12012025011121', 'B00008', 'Cemani putih', 20, 1900000, '2025-01-12', NULL, '2025-01-20 11:11:21', '2025-01-20 11:11:21'),
(268, 'DTRINVHISNAJM12012025011121', 'B00001', 'Oxford putih', 25, 2250000, '2025-01-12', NULL, '2025-01-20 11:11:21', '2025-01-20 11:11:21'),
(269, 'DTRINVJUSTIN13012025011146', 'B00003', 'Allino kopi susu', 25, 2200000, '2025-01-13', NULL, '2025-01-20 11:11:46', '2025-01-20 11:11:46'),
(270, 'DTRINVJUSTIN13012025011146', 'B00007', 'Cemani abu', 10, 1900000, '2025-01-13', NULL, '2025-01-20 11:11:46', '2025-01-20 11:11:46'),
(271, 'DTRINVJUSTIN13012025011146', 'B00001', 'Oxford putih', 10, 2250000, '2025-01-13', NULL, '2025-01-20 11:11:46', '2025-01-20 11:11:46'),
(272, 'DTRINVMARISKA14012025011217', 'B00009', 'Cemani hijau', 25, 1900000, '2025-01-14', NULL, '2025-01-20 11:12:17', '2025-01-20 11:12:17'),
(273, 'DTRINVMARISKA14012025011217', 'B00004', 'Cemani merah', 20, 1900000, '2025-01-14', NULL, '2025-01-20 11:12:17', '2025-01-20 11:12:17'),
(274, 'DTRINVMARISKA14012025011217', 'B00001', 'Oxford putih', 15, 2250000, '2025-01-14', NULL, '2025-01-20 11:12:17', '2025-01-20 11:12:17'),
(275, 'DTRINVGERALDO15012025011241', 'B00007', 'Cemani abu', 25, 1900000, '2025-01-15', NULL, '2025-01-20 11:12:42', '2025-01-20 11:12:42'),
(276, 'DTRINVGERALDO15012025011241', 'B00005', 'Cemani coklat', 60, 1900000, '2025-01-15', NULL, '2025-01-20 11:12:42', '2025-01-20 11:12:42'),
(277, 'DTRINVSARAH16012025011308', 'B00003', 'Allino kopi susu', 20, 2200000, '2025-01-16', NULL, '2025-01-20 11:13:08', '2025-01-20 11:13:08'),
(278, 'DTRINVSARAH16012025011308', 'B00007', 'Cemani abu', 15, 1900000, '2025-01-16', NULL, '2025-01-20 11:13:08', '2025-01-20 11:13:08'),
(279, 'DTRINVBULQIS17012025011332', 'B00009', 'Cemani hijau', 20, 1900000, '2025-01-17', NULL, '2025-01-20 11:13:32', '2025-01-20 11:13:32'),
(280, 'DTRINVBULQIS17012025011332', 'B00002', 'Oxford coklat', 20, 2100000, '2025-01-17', NULL, '2025-01-20 11:13:32', '2025-01-20 11:13:32'),
(281, 'DTRINVBULQIS17012025011332', 'B00001', 'Oxford putih', 20, 2250000, '2025-01-17', NULL, '2025-01-20 11:13:32', '2025-01-20 11:13:32'),
(282, 'DTRINVNIA18012025011354', 'B00005', 'Cemani coklat', 25, 1900000, '2025-01-18', NULL, '2025-01-20 11:13:54', '2025-01-20 11:13:54'),
(283, 'DTRINVNIA18012025011354', 'B00006', 'Cemani dongker', 25, 1900000, '2025-01-18', NULL, '2025-01-20 11:13:54', '2025-01-20 11:13:54'),
(284, 'DTRINVVERONIKA19012025011424', 'B00008', 'Cemani putih', 55, 1900000, '2025-01-19', NULL, '2025-01-20 11:14:24', '2025-01-20 11:14:24'),
(285, 'DTRINVVERONIKA19012025011424', 'B00003', 'Allino kopi susu', 15, 2200000, '2025-01-19', NULL, '2025-01-20 11:14:24', '2025-01-20 11:14:24'),
(286, 'DTRINVVERONIKA19012025011424', 'B00002', 'Oxford coklat', 15, 2100000, '2025-01-19', NULL, '2025-01-20 11:14:24', '2025-01-20 11:14:24'),
(287, 'DTRINVSULISTYO20012025011451', 'B00005', 'Cemani coklat', 15, 1900000, '2025-01-20', NULL, '2025-01-20 11:14:51', '2025-01-20 11:14:51'),
(288, 'DTRINVSULISTYO20012025011451', 'B00006', 'Cemani dongker', 40, 1900000, '2025-01-20', NULL, '2025-01-20 11:14:51', '2025-01-20 11:14:51'),
(289, 'DTRINVBAMBANG21012025011516', 'B00004', 'Cemani merah', 15, 1900000, '2025-01-21', NULL, '2025-01-20 11:15:16', '2025-01-20 11:15:16'),
(290, 'DTRINVBAMBANG21012025011516', 'B00002', 'Oxford coklat', 15, 2100000, '2025-01-21', NULL, '2025-01-20 11:15:16', '2025-01-20 11:15:16'),
(291, 'DTRINVROUDOLF22012025011547', 'B00007', 'Cemani abu', 33, 1900000, '2025-01-22', NULL, '2025-01-20 11:15:47', '2025-01-20 11:15:47'),
(292, 'DTRINVROUDOLF22012025011547', 'B00004', 'Cemani merah', 50, 1900000, '2025-01-22', NULL, '2025-01-20 11:15:47', '2025-01-20 11:15:47'),
(293, 'DTRINVYUNANSA23012025011614', 'B00003', 'Allino kopi susu', 20, 2200000, '2025-01-23', NULL, '2025-01-20 11:16:14', '2025-01-20 11:16:14'),
(294, 'DTRINVYUNANSA23012025011614', 'B00008', 'Cemani putih', 15, 1900000, '2025-01-23', NULL, '2025-01-20 11:16:14', '2025-01-20 11:16:14'),
(295, 'DTRINVCANTIKA24012025011639', 'B00009', 'Cemani hijau', 25, 1900000, '2025-01-24', NULL, '2025-01-20 11:16:39', '2025-01-20 11:16:39'),
(296, 'DTRINVCANTIKA24012025011639', 'B00008', 'Cemani putih', 25, 1900000, '2025-01-24', NULL, '2025-01-20 11:16:39', '2025-01-20 11:16:39'),
(297, 'DTRINVCANTIKA24012025011639', 'B00002', 'Oxford coklat', 12, 2100000, '2025-01-24', NULL, '2025-01-20 11:16:39', '2025-01-20 11:16:39'),
(298, 'DTRINVSRIRAHAYU25012025011659', 'B00003', 'Allino kopi susu', 68, 2200000, '2025-01-25', NULL, '2025-01-20 11:16:59', '2025-01-20 11:16:59'),
(299, 'DTRINVSRIRAHAYU25012025011659', 'B00005', 'Cemani coklat', 25, 1900000, '2025-01-25', NULL, '2025-01-20 11:16:59', '2025-01-20 11:16:59'),
(300, 'DTRINVZASKIA26012025011726', 'B00009', 'Cemani hijau', 25, 1900000, '2025-01-26', NULL, '2025-01-20 11:17:26', '2025-01-20 11:17:26'),
(301, 'DTRINVZASKIA26012025011726', 'B00004', 'Cemani merah', 10, 1900000, '2025-01-26', NULL, '2025-01-20 11:17:26', '2025-01-20 11:17:26'),
(302, 'DTRINVZASKIA26012025011726', 'B00001', 'Oxford putih', 11, 2250000, '2025-01-26', NULL, '2025-01-20 11:17:26', '2025-01-20 11:17:26'),
(303, 'DTRINVKIRANA27012025011751', 'B00006', 'Cemani dongker', 20, 1900000, '2025-01-27', NULL, '2025-01-20 11:17:51', '2025-01-20 11:17:51'),
(304, 'DTRINVKIRANA27012025011751', 'B00002', 'Oxford coklat', 40, 2100000, '2025-01-27', NULL, '2025-01-20 11:17:51', '2025-01-20 11:17:51'),
(305, 'DTRINVKIRANA27012025011751', 'B00001', 'Oxford putih', 35, 2250000, '2025-01-27', NULL, '2025-01-20 11:17:51', '2025-01-20 11:17:51'),
(306, 'DTRINVYULIANA28012025011826', 'B00004', 'Cemani merah', 25, 1900000, '2025-01-28', NULL, '2025-01-20 11:18:26', '2025-01-20 11:18:26'),
(307, 'DTRINVYULIANA28012025011826', 'B00002', 'Oxford coklat', 15, 2100000, '2025-01-28', NULL, '2025-01-20 11:18:26', '2025-01-20 11:18:26'),
(308, 'DTRINVTIARA29012025011841', 'B00007', 'Cemani abu', 60, 1900000, '2025-01-29', NULL, '2025-01-20 11:18:41', '2025-01-20 11:18:41'),
(309, 'DTRINVNUNUNG30012025011907', 'B00004', 'Cemani merah', 15, 1900000, '2025-01-30', NULL, '2025-01-20 11:19:07', '2025-01-20 11:19:07'),
(310, 'DTRINVNUNUNG30012025011907', 'B00008', 'Cemani putih', 25, 1900000, '2025-01-30', NULL, '2025-01-20 11:19:07', '2025-01-20 11:19:07'),
(311, 'DTRINVNUNUNG30012025011907', 'B00002', 'Oxford coklat', 10, 2100000, '2025-01-30', NULL, '2025-01-20 11:19:07', '2025-01-20 11:19:07'),
(312, 'DTRINVZAKI31012025011936', 'B00004', 'Cemani merah', 15, 1900000, '2025-01-31', NULL, '2025-01-20 11:19:36', '2025-01-20 11:19:36'),
(313, 'DTRINVZAKI31012025011936', 'B00008', 'Cemani putih', 25, 1900000, '2025-01-31', NULL, '2025-01-20 11:19:36', '2025-01-20 11:19:36'),
(314, 'DTRINVZAKI31012025011936', 'B00002', 'Oxford coklat', 17, 2100000, '2025-01-31', NULL, '2025-01-20 11:19:36', '2025-01-20 11:19:36');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `nama`, `telepon`, `alamat`, `id_barang`, `waktu`, `created_at`, `updated_at`) VALUES
(1, 'CITRA TEXTILE', '085159511833', 'Jl. Syarif Al-Qodri No.12A, Kasin, Kec. Klojen, Kota Malang, Jawa Timur 65117', 'B00004', 5, '2024-11-08 05:03:15', '2025-02-04 18:38:42'),
(2, 'CITRA TEXTILE', '085159511833', 'Jl. Syarif Al-Qodri No.12A, Kasin, Kec. Klojen, Kota Malang, Jawa Timur 65117', 'B00005', 4, '2024-11-08 05:04:08', '2024-11-08 05:04:08'),
(3, 'CITRA TEXTILE', '085159511833', 'Jl. Syarif Al-Qodri No.12A, Kasin, Kec. Klojen, Kota Malang, Jawa Timur 65117', 'B00006', 4, '2024-11-08 05:04:32', '2024-11-08 05:04:32'),
(4, 'CITRA TEXTILE', '085159511833', 'Jl. Syarif Al-Qodri No.12A, Kasin, Kec. Klojen, Kota Malang, Jawa Timur 65117', 'B00007', 6, '2024-11-08 05:04:53', '2024-11-08 05:04:53'),
(5, 'CITRA TEXTILE', '085159511833', 'Jl. Syarif Al-Qodri No.12A, Kasin, Kec. Klojen, Kota Malang, Jawa Timur 65117', 'B00008', 2, '2024-11-08 05:05:17', '2024-11-08 05:05:17'),
(6, 'CITRA TEXTILE', '085159511833', 'Jl. Syarif Al-Qodri No.12A, Kasin, Kec. Klojen, Kota Malang, Jawa Timur 65117', 'B00009', 3, '2024-11-08 05:05:36', '2024-11-08 05:05:36'),
(7, 'PT SRITEX', '085808872454', 'Sawah, Banmati, Kec. Sukoharjo, Kabupaten Sukoharjo, Jawa Tengah 57551', 'B00001', 5, '2024-11-08 05:06:06', '2024-11-08 05:06:06'),
(8, 'PT SRITEX', '085808872454', 'Sawah, Banmati, Kec. Sukoharjo, Kabupaten Sukoharjo, Jawa Tengah 57551', 'B00002', 4, '2024-11-08 05:06:40', '2024-11-08 05:06:40'),
(9, 'PT SRITEX', '085808872454', 'Sawah, Banmati, Kec. Sukoharjo, Kabupaten Sukoharjo, Jawa Tengah 57551', 'B00003', 5, '2024-11-08 05:06:58', '2024-11-08 05:06:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `slug`, `telepon`, `name`, `address`, `username`, `password`, `role`, `status`, `created_at`, `updated_at`) VALUES
('U00001', 'R3WhJAcuYAyvZrz2', '081231241241', 'Gudang Pusat', 'Jl. Kyai Tambak Deres No.229, Kota Surabaya, Jawa Timur', 'gudangpusat', '$2y$10$X3xpE/muTiNv/AhBws7vl.ia4bym5M/fJmTjFLRTBxemjL1V0t4ZS', 'gudang', 'Active', '2024-12-01 05:11:42', '2025-02-04 18:36:12'),
('U00002', 'qdDZz1ZGO5P2oVxJ', '08224123123', 'Toko 1', 'Jl. Keputih Tegal No.29, Kota Surabaya, Jawa Timur', 'toko1', '$2y$10$slqywK90Y7sXV5cViYYmWeAl5GFKbh95UpMs4Eze5tDJE3d33NC2C', 'counter', 'Active', '2024-12-01 05:11:42', '2024-12-01 05:11:42'),
('U00003', 'WBFiahidlmMqQISV', '08224120802832', 'Toko 2', 'Jl. Raya Wiyung No.674, Kota Surabaya, Jawa Timur', 'toko2', '$2y$10$6PG22XiYCs5gA8N6TLiKmuIsmaJWEglwPxGuRTZ2rKfbveSmNLs/e', 'counter', 'Active', '2024-12-01 05:11:43', '2024-12-01 05:11:43'),
('U00004', 'hpjWT40JHlCLgTRQ', '0822412412390', 'Toko 3', 'Jl. Rungkut Asri Tengah No.21, Kota Surabaya, Jawa Timur', 'toko3', '$2y$10$FvZYnU2KTq7rBwfgvfbU0uukYbBar/H5qky0vfvx33QzkJG0.TkSK', 'counter', 'Active', '2024-12-01 05:11:43', '2024-12-01 05:11:43'),
('U00005', 'JzPnwsagQCo217vx', '0812348728372', 'Owner', '-', 'owner', '$2y$10$5M86aASlib/n7lOEIPnkUOefpXKoh0N9MYSQhFhr5n3VGg6IQYfzy', 'owner', 'Active', '2024-12-01 05:11:43', '2024-12-01 05:11:43'),
('U00006', '5WoUmqRx4UvmcIuJ', NULL, 'Toko Sejahtera', 'Jln. Sejahtera', 'sejahtera', '$2y$10$HzGdMgkehb024i.8kMGNHeNNufPezLTexYxJGAgc7OYR1yB6eLq4G', 'counter', 'Active', '2024-12-04 04:46:53', '2024-12-04 04:46:53'),
('U00007', 'DDsYqXoZvecEn4WI', NULL, 'Toko Abadi Manunggal', 'Jln. Abadi', 'abadi', '$2y$10$ongVsNU3eTkXL1qH/hghKugKkKqWFDVgzRH2O9FazkZ6kAm86yBvO', 'counter', 'Active', '2024-12-04 04:47:23', '2024-12-04 04:47:42'),
('U00008', 'CYJKcMcuWoLiZra5', '082232534578', 'Admin User', 'Jalan Admin', 'admin', '$2y$10$DVDBkw93gFLofs/5BZjrf.i1XstsmVVpLgz.3BCNFvmUbD5GiQSfO', 'admin', 'Active', '2025-02-04 10:36:32', '2025-02-04 10:36:33');

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
-- Indexes for table `gudangs`
--
ALTER TABLE `gudangs`
  ADD PRIMARY KEY (`gudang_id`),
  ADD KEY `gudangs_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemesanan_barangs`
--
ALTER TABLE `pemesanan_barangs`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pemesanan_barangs`
--
ALTER TABLE `pemesanan_barangs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `penjualan_barangs`
--
ALTER TABLE `penjualan_barangs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `penjualan_barang_details`
--
ALTER TABLE `penjualan_barang_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=315;

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
-- Constraints for table `gudangs`
--
ALTER TABLE `gudangs`
  ADD CONSTRAINT `gudangs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
