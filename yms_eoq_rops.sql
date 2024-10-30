-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 30, 2024 at 01:01 PM
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
('B00001', 'tasTegVsbVpk5Fpo', 'Oxford putih', 3750, 20000, 0, 0, '2024-10-30 03:24:04', '2024-10-30 03:24:04'),
('B00002', 'keZTZtBqS8upSmVq', 'Oxford coklat', 4000, 20000, 0, 0, '2024-10-30 03:24:04', '2024-10-30 03:24:04'),
('B00003', 'Di5EWsY6J15a92Hk', 'Allino kopi susu', 3000, 20000, 0, 0, '2024-10-30 03:24:04', '2024-10-30 03:24:04'),
('B00004', 'ArB3HSkHOVnxTH9D', 'Cemani merah', 2700, 20000, 0, 0, '2024-10-30 03:24:05', '2024-10-30 03:24:05'),
('B00005', 'U7sBAhnQJ8YoZejS', 'Cemani coklat', 2500, 20000, 0, 0, '2024-10-30 03:24:05', '2024-10-30 03:24:05'),
('B00006', 'vsFyBLME82EVpTox', 'Cemani dongker', 1000, 20000, 0, 0, '2024-10-30 03:24:05', '2024-10-30 03:24:05'),
('B00007', '4A0PCCTzIujlyrd7', 'Cemani abu', 6000, 20000, 0, 0, '2024-10-30 03:24:05', '2024-10-30 03:24:05'),
('B00008', 'uQTEurbfPwRMUSH9', 'Cemani putih', 5500, 20000, 0, 0, '2024-10-30 03:24:05', '2024-10-30 03:24:05'),
('B00009', 'H6vJKqU4K2SPZUpT', 'Cemani hijau', 5500, 20000, 0, 0, '2024-10-30 03:24:05', '2024-10-30 03:24:05');

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

--
-- Dumping data for table `barang_counters`
--

INSERT INTO `barang_counters` (`barang_counter_id`, `slug`, `counter_id`, `barang_id`, `stok_awal`, `stok_masuk`, `stok_keluar`, `created_at`, `updated_at`) VALUES
('C00001B00001', 'zQ8l5NSOr9YCn85b', 'C00001', 'B00001', 0, 0, 0, '2024-10-30 03:26:51', '2024-10-30 03:26:51'),
('C00001B00002', 'uIIQqceCthzOxiI3', 'C00001', 'B00002', 0, 0, 0, '2024-10-30 03:26:51', '2024-10-30 03:26:51'),
('C00001B00003', '7e5ztiQMwmxP63KU', 'C00001', 'B00003', 0, 0, 0, '2024-10-30 03:26:51', '2024-10-30 03:26:51'),
('C00001B00004', 'XmuyTqLg2WhsZCci', 'C00001', 'B00004', 0, 0, 0, '2024-10-30 03:26:51', '2024-10-30 03:26:51'),
('C00001B00005', 'dGS7qk6KTE2ZycnE', 'C00001', 'B00005', 0, 0, 0, '2024-10-30 03:26:51', '2024-10-30 03:26:51'),
('C00001B00006', 'hLiucKzlwF1FA25g', 'C00001', 'B00006', 0, 0, 0, '2024-10-30 03:26:51', '2024-10-30 03:26:51'),
('C00001B00007', 'n5Hpd6PZEC1LqfCJ', 'C00001', 'B00007', 0, 0, 0, '2024-10-30 03:26:51', '2024-10-30 03:26:51'),
('C00001B00008', 'KfYp7LGhHKpEgdkw', 'C00001', 'B00008', 0, 0, 0, '2024-10-30 03:26:51', '2024-10-30 03:26:51'),
('C00001B00009', '2u74Z16LxpxfyfQZ', 'C00001', 'B00009', 0, 0, 0, '2024-10-30 03:26:51', '2024-10-30 03:26:51'),
('C00002B00001', 'Onz5ja6GeydTa4vR', 'C00002', 'B00001', 0, 0, 0, '2024-10-30 03:27:11', '2024-10-30 03:27:11'),
('C00002B00002', 'B3T4BE0NgZxH02yL', 'C00002', 'B00002', 0, 0, 0, '2024-10-30 03:27:11', '2024-10-30 03:27:11'),
('C00002B00003', 'RqzJwMNEafCJ5r6h', 'C00002', 'B00003', 0, 0, 0, '2024-10-30 03:27:11', '2024-10-30 03:27:11'),
('C00002B00004', 'dooRVSQl7Or1jVjx', 'C00002', 'B00004', 0, 0, 0, '2024-10-30 03:27:11', '2024-10-30 03:27:11'),
('C00002B00005', 'qLLldK0TxUOezmqD', 'C00002', 'B00005', 0, 0, 0, '2024-10-30 03:27:12', '2024-10-30 03:27:12'),
('C00002B00006', 'wCzlX1KpWKku9Qqb', 'C00002', 'B00006', 0, 0, 0, '2024-10-30 03:27:12', '2024-10-30 03:27:12'),
('C00002B00007', 'DTKW1ys85VjiP1rB', 'C00002', 'B00007', 0, 0, 0, '2024-10-30 03:27:12', '2024-10-30 03:27:12'),
('C00002B00008', 'DVCvrhotGUKlJhoR', 'C00002', 'B00008', 0, 0, 0, '2024-10-30 03:27:12', '2024-10-30 03:27:12'),
('C00002B00009', 'UAcq5TPnUNHvX9qX', 'C00002', 'B00009', 0, 0, 0, '2024-10-30 03:27:12', '2024-10-30 03:27:12'),
('C00003B00001', '5FhjBpanJDKflGTR', 'C00003', 'B00001', 0, 0, 0, '2024-10-30 03:27:25', '2024-10-30 03:27:25'),
('C00003B00002', 'Rg55P5zShxlkMFIL', 'C00003', 'B00002', 0, 0, 0, '2024-10-30 03:27:25', '2024-10-30 03:27:25'),
('C00003B00003', 'R3SOUZlsDWmFcBGL', 'C00003', 'B00003', 0, 0, 0, '2024-10-30 03:27:25', '2024-10-30 03:27:25'),
('C00003B00004', 'GmxDRNGzJojI1ikJ', 'C00003', 'B00004', 0, 0, 0, '2024-10-30 03:27:25', '2024-10-30 03:27:25'),
('C00003B00005', 'HfGhBzj1gi3kH1Mh', 'C00003', 'B00005', 0, 0, 0, '2024-10-30 03:27:25', '2024-10-30 03:27:25'),
('C00003B00006', 'j4Aep2u34L2GIpQc', 'C00003', 'B00006', 0, 0, 0, '2024-10-30 03:27:25', '2024-10-30 03:27:25'),
('C00003B00007', '47qOknOJc2FwP9MY', 'C00003', 'B00007', 0, 0, 0, '2024-10-30 03:27:25', '2024-10-30 03:27:25'),
('C00003B00008', 'GKQwver27sdoca98', 'C00003', 'B00008', 0, 0, 0, '2024-10-30 03:27:25', '2024-10-30 03:27:25'),
('C00003B00009', 'SZhlX9TF3Ei7NhM6', 'C00003', 'B00009', 0, 0, 0, '2024-10-30 03:27:25', '2024-10-30 03:27:25'),
('C00004B00001', 'OG2E9hUlJwb4Uz6t', 'C00004', 'B00001', 0, 0, 0, '2024-10-30 03:27:42', '2024-10-30 03:27:42'),
('C00004B00002', 'skjremJdX9PWkVDe', 'C00004', 'B00002', 0, 0, 0, '2024-10-30 03:27:42', '2024-10-30 03:27:42'),
('C00004B00003', 'dC22dPLfI0WCJnJl', 'C00004', 'B00003', 0, 0, 0, '2024-10-30 03:27:42', '2024-10-30 03:27:42'),
('C00004B00004', 'kKDgPabN3vDSsAPd', 'C00004', 'B00004', 0, 0, 0, '2024-10-30 03:27:42', '2024-10-30 03:27:42'),
('C00004B00005', 'SVHpeqKK2k2VLbD7', 'C00004', 'B00005', 0, 0, 0, '2024-10-30 03:27:42', '2024-10-30 03:27:42'),
('C00004B00006', 'UX9HDIUONsR2lQ6V', 'C00004', 'B00006', 0, 0, 0, '2024-10-30 03:27:42', '2024-10-30 03:27:42'),
('C00004B00007', 'OHxAjUBCInIu2j2k', 'C00004', 'B00007', 0, 0, 0, '2024-10-30 03:27:42', '2024-10-30 03:27:42'),
('C00004B00008', 'DHZd1dj0P82FWq3e', 'C00004', 'B00008', 0, 0, 0, '2024-10-30 03:27:42', '2024-10-30 03:27:42'),
('C00004B00009', 'Hnj20DqqkuxvSLkh', 'C00004', 'B00009', 0, 0, 0, '2024-10-30 03:27:42', '2024-10-30 03:27:42');

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
('G00001B00001', 'OH51YCVwedm0Skiw', 'B00001', 'G00001', 0, 55, 45, '2024-10-30 03:24:06', '2024-10-30 03:25:36'),
('G00001B00002', 'x9BqKgZMIjHhV1As', 'B00002', 'G00001', 0, 53, 45, '2024-10-30 03:24:06', '2024-10-30 03:25:36'),
('G00001B00003', 'sgoIgnMfTAHNKlK8', 'B00003', 'G00001', 0, 55, 45, '2024-10-30 03:24:06', '2024-10-30 03:25:15'),
('G00001B00004', 'aH3CNzswFlASQVLZ', 'B00004', 'G00001', 0, 60, 45, '2024-10-30 03:24:06', '2024-10-30 03:24:06'),
('G00001B00005', '2FZhX09W2zbcNm0h', 'B00005', 'G00001', 0, 60, 45, '2024-10-30 03:24:06', '2024-10-30 03:24:06'),
('G00001B00006', 'oflJMhbzhBx4XRyC', 'B00006', 'G00001', 0, 60, 45, '2024-10-30 03:24:06', '2024-10-30 03:24:06'),
('G00001B00007', 'hYF7z4wouqOKDWbu', 'B00007', 'G00001', 0, 60, 45, '2024-10-30 03:24:06', '2024-10-30 03:24:06'),
('G00001B00008', 'mYaSIqlo2hu8dA0a', 'B00008', 'G00001', 0, 60, 45, '2024-10-30 03:24:06', '2024-10-30 03:24:06'),
('G00001B00009', 'nSrao1jtWc8VruRP', 'B00009', 'G00001', 0, 60, 45, '2024-10-30 03:24:06', '2024-10-30 03:24:06');

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

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`counter_id`, `slug`, `user_id`, `created_at`, `updated_at`) VALUES
('C00001', '9pkh5WPMKrWQjdy1', 'U00006', '2024-10-30 03:26:51', '2024-10-30 03:26:51'),
('C00002', 'xR7Cza9L4vt1YCLG', 'U00007', '2024-10-30 03:27:11', '2024-10-30 03:27:11'),
('C00003', 'gO4De1hFRZrRlRon', 'U00008', '2024-10-30 03:27:25', '2024-10-30 03:27:25'),
('C00004', '0p0SIaMOaj2VYawe', 'U00009', '2024-10-30 03:27:42', '2024-10-30 03:27:42');

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
('G00001', 'Nt22f3LqH2bnCDrR', 'U00001', '2024-10-30 03:24:06', '2024-10-30 03:24:06');

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
(1, 'DTRINVCITRA30102024102515', 'Citra', 'wad', '123', 'DITERIMA', '2024-10-30', NULL, '2024-10-30 03:25:15', '2024-10-30 03:25:15'),
(2, 'DTRINVWAHYU30102024102536', 'Wahyu', 'oo', '3321', 'DITERIMA', '2024-10-28', NULL, '2024-10-30 03:25:36', '2024-10-30 03:25:36');

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
(1, 'DTRINVCITRA30102024102515', 'B00001', 'Oxford putih', 3, 3750, '2024-10-30', NULL, '2024-10-30 03:25:15', '2024-10-30 03:25:15'),
(2, 'DTRINVCITRA30102024102515', 'B00003', 'Allino kopi susu', 5, 3000, '2024-10-30', NULL, '2024-10-30 03:25:15', '2024-10-30 03:25:15'),
(3, 'DTRINVWAHYU30102024102536', 'B00001', 'Oxford putih', 2, 3750, '2024-10-28', NULL, '2024-10-30 03:25:36', '2024-10-30 03:25:36'),
(4, 'DTRINVWAHYU30102024102536', 'B00002', 'Oxford coklat', 7, 4000, '2024-10-28', NULL, '2024-10-30 03:25:36', '2024-10-30 03:25:36');

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
(1, 'PT SRITEX', '088', 'SOLO', 'B00001', 5, '2024-10-30 03:37:05', '2024-10-30 05:51:07'),
(2, 'PT SRITEX', '088', 'SOLO', 'B00003', 8, '2024-10-30 04:21:24', '2024-10-30 05:50:54'),
(4, 'PT SRITEX', '088', 'SOLO', 'B00002', 3, '2024-10-30 05:46:19', '2024-10-30 05:51:18'),
(5, 'CITRA TEXTILE', '132', 'MALANG', 'B00004', 5, '2024-10-30 05:46:47', '2024-10-30 05:46:47'),
(6, 'CITRA TEXTILE', '123', 'MALANG', 'B00005', 3, '2024-10-30 05:47:19', '2024-10-30 05:47:33'),
(7, 'CITRA TEXTILE', '123', 'MALANG', 'B00007', 5, '2024-10-30 05:48:14', '2024-10-30 05:49:47'),
(8, 'CITRA TEXTILE', '123', 'MALANG', 'B00008', 4, '2024-10-30 05:48:46', '2024-10-30 05:50:00'),
(9, 'CITRA TEXTILE', '123', 'MALANG', 'B00009', 5, '2024-10-30 05:49:04', '2024-10-30 05:50:11'),
(10, 'CITRA TEXTILE', '123', 'MALANG', 'B00006', 2, '2024-10-30 05:51:56', '2024-10-30 05:51:56');

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
('U00001', 'nAEwz0hWhgfwyx29', '081231241241', 'Gudang Pusat', 'Jl. Kyai Tambak Deres No.229, Kota Surabaya, Jawa Timur', 'gudangpusat', '$2y$10$I1aYfCJLYusz70Gg6UWpDOXc5g.Xl3o0Wd7FwgDOrYDDCGnnKfPu6', 'gudang', 'Active', '2024-10-30 03:24:05', '2024-10-30 03:24:05'),
('U00002', 'JbyXm0Z2sTcqwiW2', '08224123123', 'Toko 1', 'Jl. Keputih Tegal No.29, Kota Surabaya, Jawa Timur', 'toko1', '$2y$10$Z/NeSxAiXMEQUvQd8CxequR1bJjA863sie1So4rM2AfRrmotoMp7i', 'counter', 'Active', '2024-10-30 03:24:05', '2024-10-30 03:24:05'),
('U00003', 'j3TbBYLOH5Nc0xCP', '08224120802832', 'Toko 2', 'Jl. Raya Wiyung No.674, Kota Surabaya, Jawa Timur', 'toko2', '$2y$10$ZPyI7AnfAx/4WVN4Ap8UhOvLMJzHl2dwupUZpMAhm/CAwoPwUdRIy', 'counter', 'Active', '2024-10-30 03:24:05', '2024-10-30 03:24:05'),
('U00004', '1CRvhLUQ11ISThN3', '0822412412390', 'Toko 3', 'Jl. Rungkut Asri Tengah No.21, Kota Surabaya, Jawa Timur', 'toko3', '$2y$10$7DnZbxxJgpWGiyLUqu9Zb.weGqrp7LMioLAA2BjuLbwetARn/XXQa', 'counter', 'Active', '2024-10-30 03:24:06', '2024-10-30 03:24:06'),
('U00005', 'jp2N1EmwiQa6zLqj', '0812348728372', 'Owner', '-', 'owner', '$2y$10$euc3brMW4l60DjN9lRJnLuY4mkw4jpu0H.2shLC/X6TEEttMuUimG', 'owner', 'Active', '2024-10-30 03:24:06', '2024-10-30 03:24:06'),
('U00006', 'ao8YNXaCZnhmOE2o', NULL, 'Toko Sejahtera', 'sejahtera', 'sejahtera', '$2y$10$oluhpdUAN83D7xEcutAwv.fpERlgIjCWgIR5lAqsVYKex2OV2eXde', 'counter', 'Active', '2024-10-30 03:26:51', '2024-10-30 03:26:51'),
('U00007', '1BzDdI5oFzCCN0fl', NULL, 'Toko Baharu', 'baharu', 'baharu', '$2y$10$d6x/q/RIwnYtfCy8cV2OtuzY0ZOKd0IeSyoVRaVZQC3SulIMXmx8a', 'counter', 'Active', '2024-10-30 03:27:11', '2024-10-30 03:27:11'),
('U00008', 'c130mw6L4g9N00Sl', NULL, 'Toko Cina', 'cina', 'cina', '$2y$10$X6FDNzUGUBMvIJqhIlhEdeXexPkQoDaTY3MAfKqU9zCmtzLKqPZvu', 'counter', 'Active', '2024-10-30 03:27:25', '2024-10-30 03:27:25'),
('U00009', 'Co9wDjf8UkLaAPpp', NULL, 'Toko Jawir', 'jawir', 'jawir', '$2y$10$p53DgDJc5YJCdO4UXghjvuHWBoP1u6Lngaraae.MLFsuPar5FNEvu', 'counter', 'Active', '2024-10-30 03:27:42', '2024-10-30 03:27:42');

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `penjualan_barang_details`
--
ALTER TABLE `penjualan_barang_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
