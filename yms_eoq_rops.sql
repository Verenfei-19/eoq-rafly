-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 31, 2024 at 03:22 AM
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
('B00001', '5TslfQyjAmEuqiUV', 'Oxford putih', 3750, 20000, 0, 0, '2024-10-30 19:19:29', '2024-10-30 19:19:29'),
('B00002', 'AUyraP25ju81B2UV', 'Oxford coklat', 4000, 20000, 0, 0, '2024-10-30 19:19:29', '2024-10-30 19:19:29'),
('B00003', 'PvExI0ehbdrcDN33', 'Allino kopi susu', 3000, 20000, 0, 0, '2024-10-30 19:19:29', '2024-10-30 19:19:29'),
('B00004', 'k02oQfhvD6kl65Ym', 'Cemani merah', 2700, 20000, 0, 0, '2024-10-30 19:19:29', '2024-10-30 19:19:29'),
('B00005', 'RuzacWrem4iQehxB', 'Cemani coklat', 2500, 20000, 0, 0, '2024-10-30 19:19:29', '2024-10-30 19:19:29'),
('B00006', 'l6cXqwzr2Z8EhbNd', 'Cemani dongker', 1000, 20000, 0, 0, '2024-10-30 19:19:29', '2024-10-30 19:19:29'),
('B00007', 'ZT7Ns7sPQQckwV2x', 'Cemani abu', 6000, 20000, 0, 0, '2024-10-30 19:19:29', '2024-10-30 19:19:29'),
('B00008', 'HQJDhFJclr2a14SR', 'Cemani putih', 5500, 20000, 0, 0, '2024-10-30 19:19:29', '2024-10-30 19:19:29'),
('B00009', 'uxvsY0YipuTwergn', 'Cemani hijau', 5500, 20000, 0, 0, '2024-10-30 19:19:29', '2024-10-30 19:19:29');

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
('G00001B00001', 'mKXGboFzPqjGspTd', 'B00001', 'G00001', 0, 57, 45, '2024-10-30 19:19:30', '2024-10-30 19:20:21'),
('G00001B00002', 'LzFNP2IGcstqOrHG', 'B00002', 'G00001', 0, 55, 45, '2024-10-30 19:19:30', '2024-10-30 19:20:21'),
('G00001B00003', 'zuofqvMd5YRJqrql', 'B00003', 'G00001', 0, 53, 45, '2024-10-30 19:19:30', '2024-10-30 19:20:35'),
('G00001B00004', 'q2W90D0PfBELiW2o', 'B00004', 'G00001', 0, 50, 45, '2024-10-30 19:19:30', '2024-10-30 19:21:22'),
('G00001B00005', 'qwZsB1WSJrh8Ykv6', 'B00005', 'G00001', 0, 52, 45, '2024-10-30 19:19:30', '2024-10-30 19:20:57'),
('G00001B00006', 'ypxdXH34R5PeHh2c', 'B00006', 'G00001', 0, 60, 45, '2024-10-30 19:19:30', '2024-10-30 19:19:30'),
('G00001B00007', 'QTeiU2uaqmYdOn4k', 'B00007', 'G00001', 0, 60, 45, '2024-10-30 19:19:30', '2024-10-30 19:19:30'),
('G00001B00008', 'HnVpXzGSaTrQgMZu', 'B00008', 'G00001', 0, 60, 45, '2024-10-30 19:19:30', '2024-10-30 19:19:30'),
('G00001B00009', 'L2ulozrf2zURSZFA', 'B00009', 'G00001', 0, 60, 45, '2024-10-30 19:19:30', '2024-10-30 19:19:30');

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
('G00001', 'kODhwhE5qMeMuZZe', 'U00001', '2024-10-30 19:19:30', '2024-10-30 19:19:30');

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

--
-- Dumping data for table `pemesanan_barangs`
--

INSERT INTO `pemesanan_barangs` (`id`, `invoice`, `id_barang`, `id_supplier`, `tgl_datang`, `status_pemesanan`, `biaya_pemesanan`, `eoq`, `rop`, `jumlah_pemesanan`, `created_at`, `updated_at`) VALUES
(1, 'PMP-20241031022859', 'B00001', '1', '5', 'Disetujui', 5000, 1, 0, 1, '2024-10-30 19:28:59', '2024-10-30 20:10:53'),
(2, 'PMP-20241031022859', 'B00002', '4', '3', 'Disetujui', 5000, 2, 0, 2, '2024-10-30 19:28:59', '2024-10-30 20:10:53'),
(3, 'PMP-20241031022859', 'B00004', '5', '5', 'Disetujui', 5000, 2, 0, 2, '2024-10-30 19:28:59', '2024-10-30 20:10:53');

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
(1, 'DTRINVCAHYA31102024022021', 'Cahya', 'cahya', '123', 'DITERIMA', '2024-10-29', NULL, '2024-10-30 19:20:21', '2024-10-30 19:20:21'),
(2, 'DTRINVRINA31102024022035', 'Rina', 'rina', '123', 'DITERIMA', '2024-10-30', NULL, '2024-10-30 19:20:35', '2024-10-30 19:20:35'),
(3, 'DTRINVWAHYU31102024022057', 'Wahyu', 'wahyu', '321', 'DITERIMA', '2024-10-27', NULL, '2024-10-30 19:20:57', '2024-10-30 19:20:57'),
(4, 'DTRINVTIO31102024022122', 'Tio', 'tio', '332', 'DITERIMA', '2024-10-28', NULL, '2024-10-30 19:21:22', '2024-10-30 19:21:22');

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
(1, 'DTRINVCAHYA31102024022021', 'B00001', 'Oxford putih', 3, 3750, '2024-10-29', NULL, '2024-10-30 19:20:21', '2024-10-30 19:20:21'),
(2, 'DTRINVCAHYA31102024022021', 'B00002', 'Oxford coklat', 5, 4000, '2024-10-29', NULL, '2024-10-30 19:20:21', '2024-10-30 19:20:21'),
(3, 'DTRINVRINA31102024022035', 'B00003', 'Allino kopi susu', 7, 3000, '2024-10-30', NULL, '2024-10-30 19:20:35', '2024-10-30 19:20:35'),
(4, 'DTRINVWAHYU31102024022057', 'B00004', 'Cemani merah', 2, 2700, '2024-10-27', NULL, '2024-10-30 19:20:57', '2024-10-30 19:20:57'),
(5, 'DTRINVWAHYU31102024022057', 'B00005', 'Cemani coklat', 8, 2500, '2024-10-27', NULL, '2024-10-30 19:20:57', '2024-10-30 19:20:57'),
(6, 'DTRINVTIO31102024022122', 'B00004', 'Cemani merah', 8, 2700, '2024-10-28', NULL, '2024-10-30 19:21:22', '2024-10-30 19:21:22');

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
(1, 'PT SRITEX', '088', 'SOLO', 'B00001', 5, '2024-10-29 20:37:05', '2024-10-29 22:51:07'),
(2, 'PT SRITEX', '088', 'SOLO', 'B00003', 8, '2024-10-29 21:21:24', '2024-10-29 22:50:54'),
(4, 'PT SRITEX', '088', 'SOLO', 'B00002', 3, '2024-10-29 22:46:19', '2024-10-29 22:51:18'),
(5, 'CITRA TEXTILE', '132', 'MALANG', 'B00004', 5, '2024-10-29 22:46:47', '2024-10-29 22:46:47'),
(6, 'CITRA TEXTILE', '123', 'MALANG', 'B00005', 3, '2024-10-29 22:47:19', '2024-10-29 22:47:33'),
(7, 'CITRA TEXTILE', '123', 'MALANG', 'B00007', 5, '2024-10-29 22:48:14', '2024-10-29 22:49:47'),
(8, 'CITRA TEXTILE', '123', 'MALANG', 'B00008', 4, '2024-10-29 22:48:46', '2024-10-29 22:50:00'),
(9, 'CITRA TEXTILE', '123', 'MALANG', 'B00009', 5, '2024-10-29 22:49:04', '2024-10-29 22:50:11'),
(10, 'CITRA TEXTILE', '123', 'MALANG', 'B00006', 2, '2024-10-29 22:51:56', '2024-10-29 22:51:56');

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
('U00001', 'UTZBYuOyABJWnn89', '081231241241', 'Gudang Pusat', 'Jl. Kyai Tambak Deres No.229, Kota Surabaya, Jawa Timur', 'gudangpusat', '$2y$10$ROjdKBeMQdUODZqlz45zTOVCrgyz0BkiayrNakyxZe0n3mJfy5Kwa', 'gudang', 'Active', '2024-10-30 19:19:29', '2024-10-30 19:19:29'),
('U00002', 'fcDes6tuLGWHJuJr', '08224123123', 'Toko 1', 'Jl. Keputih Tegal No.29, Kota Surabaya, Jawa Timur', 'toko1', '$2y$10$RizpN4Q94Jn.y/Nw6xslT.I/iIfZodYEfNgL.2vcu0JCyBac8vG8O', 'counter', 'Active', '2024-10-30 19:19:30', '2024-10-30 19:19:30'),
('U00003', 'RwT0dJLeDUuZEdpK', '08224120802832', 'Toko 2', 'Jl. Raya Wiyung No.674, Kota Surabaya, Jawa Timur', 'toko2', '$2y$10$8JaUyymYNVoUZeaAf2xKS.yiGnzcCox.grdGus5y/Kjl/oKuzO/HC', 'counter', 'Active', '2024-10-30 19:19:30', '2024-10-30 19:19:30'),
('U00004', 'dkm4kYbLfvBOpC92', '0822412412390', 'Toko 3', 'Jl. Rungkut Asri Tengah No.21, Kota Surabaya, Jawa Timur', 'toko3', '$2y$10$JivgNw72KSjiLC93vbQRrOUt0Swi3LX3zA.DEpUfHueAlV0w./Y5y', 'counter', 'Active', '2024-10-30 19:19:30', '2024-10-30 19:19:30'),
('U00005', 'wfkxWKkBSxuQYp1n', '0812348728372', 'Owner', '-', 'owner', '$2y$10$OjUk3qtD9lNPI5.6cn9Tm.X0VOhvPT95yHWG950iDkpCAv3zF7VIu', 'owner', 'Active', '2024-10-30 19:19:30', '2024-10-30 19:19:30');

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `penjualan_barangs`
--
ALTER TABLE `penjualan_barangs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `penjualan_barang_details`
--
ALTER TABLE `penjualan_barang_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
