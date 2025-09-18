-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 20, 2025 at 07:38 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tesasset`
--

-- --------------------------------------------------------

--
-- Table structure for table `asset`
--

CREATE TABLE `asset` (
  `id` int UNSIGNED NOT NULL,
  `kode_sub_kategori` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kode_kategori` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kode_barang` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi_barang` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `jumlah_barang` int UNSIGNED NOT NULL,
  `harga_barang` decimal(12,2) NOT NULL,
  `total_harga_barang` decimal(12,2) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `kode_unik` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('tersedia','habis terpakai') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'tersedia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `asset`
--

INSERT INTO `asset` (`id`, `kode_sub_kategori`, `kode_kategori`, `nama_barang`, `kode_barang`, `deskripsi_barang`, `jumlah_barang`, `harga_barang`, `total_harga_barang`, `tanggal_masuk`, `kode_unik`, `status`) VALUES
(143, 'SK05', '001', 'meja', 'KB02', '-', 8, '1000000.00', '10000000.00', '2025-07-08', '', 'tersedia'),
(144, 'SK01', '002', 'kertas HVS', 'KB03', '-', 0, '30000.00', '600000.00', '2025-07-08', '', 'tersedia'),
(145, 'SK03', '001', 'kertas', 'KB04', '-', 1, '5000000.00', '25000000.00', '2025-07-09', '', 'tersedia'),
(146, 'SK14', '003', 'Sapu Ijuk', 'KB05', '-', 7, '21700.00', '217000.00', '2025-07-28', '', 'tersedia'),
(147, 'SK03', '001', 'Laptop Asus ROG', 'KB06', '-', 3, '15000000.00', '75000000.00', '2025-07-31', '', 'tersedia'),
(148, 'SK14', '003', 'Sapu Lidi', 'KB07', '-', 4, '9000.00', '90000.00', '2024-06-30', '', 'tersedia'),
(149, 'SK01', '002', 'Kertas Manila', 'KB08', '-', 0, '500.00', '2500.00', '2025-08-04', '', 'tersedia'),
(150, 'SK15', '004', 'Sayur sop', 'KB09', '-', 0, '10000.00', '10000.00', '2025-08-06', '', 'tersedia'),
(151, 'SK01', '002', 'Kertas Buram', 'KB10', '-', 0, '250.00', '2500.00', '2025-08-06', '', 'tersedia'),
(152, 'SK03', '001', 'PC', 'KB11', '-', 2, '15000000.00', '45000000.00', '2025-08-11', '', 'tersedia'),
(153, 'SK01', '002', 'Kertas Ajaib', 'KB12', '-', 3, '1000.00', '10000.00', '2025-08-12', '', 'tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int UNSIGNED NOT NULL,
  `id_asset` int UNSIGNED NOT NULL,
  `nama_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kode_unik` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `harga_barang` decimal(12,2) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `status` enum('tersedia','habis terpakai','terpakai') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'tersedia',
  `id_pengguna` int UNSIGNED DEFAULT NULL,
  `id_lokasi` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `id_asset`, `nama_barang`, `kode_unik`, `harga_barang`, `tanggal_masuk`, `status`, `id_pengguna`, `id_lokasi`) VALUES
(196, 143, 'meja', 'KB02-001-SK05-2025-07-08-0004', '1000000.00', '2025-07-08', 'tersedia', NULL, NULL),
(197, 143, 'meja', 'KB02-001-SK05-2025-07-08-0005', '1000000.00', '2025-07-08', 'tersedia', NULL, NULL),
(198, 143, 'meja', 'KB02-001-SK05-2025-07-08-0006', '1000000.00', '2025-07-08', 'tersedia', NULL, NULL),
(199, 143, 'meja', 'KB02-001-SK05-2025-07-08-0007', '1000000.00', '2025-07-08', 'tersedia', NULL, NULL),
(200, 143, 'meja', 'KB02-001-SK05-2025-07-08-0008', '1000000.00', '2025-07-08', 'tersedia', NULL, NULL),
(201, 143, 'meja', 'KB02-001-SK05-2025-07-08-0009', '1000000.00', '2025-07-08', 'tersedia', NULL, NULL),
(202, 143, 'meja', 'KB02-001-SK05-2025-07-08-0010', '1000000.00', '2025-07-08', 'tersedia', NULL, NULL),
(228, 146, 'Sapu Ijuk', 'KB05-003-SK14-2025-07-28-0001', '21700.00', '2025-07-28', 'terpakai', 19, 14),
(229, 146, 'Sapu Ijuk', 'KB05-003-SK14-2025-07-28-0002', '21700.00', '2025-07-28', 'terpakai', 18, 18),
(230, 146, 'Sapu Ijuk', 'KB05-003-SK14-2025-07-28-0003', '21700.00', '2025-07-28', 'terpakai', 20, 18),
(231, 146, 'Sapu Ijuk', 'KB05-003-SK14-2025-07-28-0004', '21700.00', '2025-07-28', 'tersedia', NULL, NULL),
(232, 146, 'Sapu Ijuk', 'KB05-003-SK14-2025-07-28-0005', '21700.00', '2025-07-28', 'tersedia', NULL, NULL),
(233, 146, 'Sapu Ijuk', 'KB05-003-SK14-2025-07-28-0006', '21700.00', '2025-07-28', 'tersedia', NULL, NULL),
(234, 146, 'Sapu Ijuk', 'KB05-003-SK14-2025-07-28-0007', '21700.00', '2025-07-28', 'tersedia', NULL, NULL),
(235, 146, 'Sapu Ijuk', 'KB05-003-SK14-2025-07-28-0008', '21700.00', '2025-07-28', 'tersedia', NULL, NULL),
(236, 146, 'Sapu Ijuk', 'KB05-003-SK14-2025-07-28-0009', '21700.00', '2025-07-28', 'tersedia', NULL, NULL),
(237, 146, 'Sapu Ijuk', 'KB05-003-SK14-2025-07-28-0010', '21700.00', '2025-07-28', 'tersedia', NULL, NULL),
(238, 147, 'Laptop Asus ROG', 'KB06-001-SK03-2025-07-31-0001', '15000000.00', '2025-07-31', 'terpakai', 19, 18),
(239, 147, 'Laptop Asus ROG', 'KB06-001-SK03-2025-07-31-0002', '15000000.00', '2025-07-31', 'terpakai', 18, 18),
(240, 147, 'Laptop Asus ROG', 'KB06-001-SK03-2025-07-31-0003', '15000000.00', '2025-07-31', 'tersedia', NULL, NULL),
(241, 147, 'Laptop Asus ROG', 'KB06-001-SK03-2025-07-31-0004', '15000000.00', '2025-07-31', 'tersedia', NULL, NULL),
(242, 147, 'Laptop Asus ROG', 'KB06-001-SK03-2025-07-31-0005', '15000000.00', '2025-07-31', 'tersedia', NULL, NULL),
(243, 148, 'Sapu Lidi', 'KB07-003-SK14-2024-06-30-0001', '9000.00', '2024-06-30', 'terpakai', 17, 18),
(244, 148, 'Sapu Lidi', 'KB07-003-SK14-2024-06-30-0002', '9000.00', '2024-06-30', 'terpakai', 17, 18),
(245, 148, 'Sapu Lidi', 'KB07-003-SK14-2024-06-30-0003', '9000.00', '2024-06-30', 'terpakai', 17, 18),
(246, 148, 'Sapu Lidi', 'KB07-003-SK14-2024-06-30-0004', '9000.00', '2024-06-30', 'terpakai', 17, 18),
(247, 148, 'Sapu Lidi', 'KB07-003-SK14-2024-06-30-0005', '9000.00', '2024-06-30', 'terpakai', 18, 18),
(248, 148, 'Sapu Lidi', 'KB07-003-SK14-2024-06-30-0006', '9000.00', '2024-06-30', 'terpakai', 18, 18),
(249, 148, 'Sapu Lidi', 'KB07-003-SK14-2024-06-30-0007', '9000.00', '2024-06-30', 'tersedia', NULL, NULL),
(250, 148, 'Sapu Lidi', 'KB07-003-SK14-2024-06-30-0008', '9000.00', '2024-06-30', 'tersedia', NULL, NULL),
(251, 148, 'Sapu Lidi', 'KB07-003-SK14-2024-06-30-0009', '9000.00', '2024-06-30', 'tersedia', NULL, NULL),
(252, 148, 'Sapu Lidi', 'KB07-003-SK14-2024-06-30-0010', '9000.00', '2024-06-30', 'tersedia', NULL, NULL),
(258, 150, 'Sayur sop', 'KB09-004-SK15-2025-08-06-0001', '10000.00', '2025-08-06', 'terpakai', 20, 18),
(259, 151, 'Kertas Buram', 'KB10-002-SK01-2025-08-06-0001', '250.00', '2025-08-06', 'habis terpakai', 17, 18),
(260, 151, 'Kertas Buram', 'KB10-002-SK01-2025-08-06-0002', '250.00', '2025-08-06', 'habis terpakai', 17, 18),
(261, 151, 'Kertas Buram', 'KB10-002-SK01-2025-08-06-0003', '250.00', '2025-08-06', 'habis terpakai', 17, 18),
(262, 151, 'Kertas Buram', 'KB10-002-SK01-2025-08-06-0004', '250.00', '2025-08-06', 'habis terpakai', 17, 18),
(263, 151, 'Kertas Buram', 'KB10-002-SK01-2025-08-06-0005', '250.00', '2025-08-06', 'habis terpakai', 18, 18),
(264, 151, 'Kertas Buram', 'KB10-002-SK01-2025-08-06-0006', '250.00', '2025-08-06', 'habis terpakai', 18, 18),
(265, 151, 'Kertas Buram', 'KB10-002-SK01-2025-08-06-0007', '250.00', '2025-08-06', 'habis terpakai', 18, 18),
(266, 151, 'Kertas Buram', 'KB10-002-SK01-2025-08-06-0008', '250.00', '2025-08-06', 'habis terpakai', 18, 18),
(267, 151, 'Kertas Buram', 'KB10-002-SK01-2025-08-06-0009', '250.00', '2025-08-06', 'habis terpakai', 19, 18),
(269, 152, 'PC', 'KB11-001-SK03-2025-08-11-0001', '15000000.00', '2025-08-11', 'terpakai', 20, 18),
(270, 152, 'PC', 'KB11-001-SK03-2025-08-11-0002', '15000000.00', '2025-08-11', 'tersedia', NULL, NULL),
(271, 152, 'PC', 'KB11-001-SK03-2025-08-11-0003', '15000000.00', '2025-08-11', 'tersedia', NULL, NULL),
(272, 153, 'Kertas Ajaib', 'KB12-002-SK01-2025-08-12-0001', '1000.00', '2025-08-12', 'habis terpakai', 19, 18),
(273, 153, 'Kertas Ajaib', 'KB12-002-SK01-2025-08-12-0002', '1000.00', '2025-08-12', 'habis terpakai', 19, 18),
(274, 153, 'Kertas Ajaib', 'KB12-002-SK01-2025-08-12-0003', '1000.00', '2025-08-12', 'habis terpakai', 19, 18),
(275, 153, 'Kertas Ajaib', 'KB12-002-SK01-2025-08-12-0004', '1000.00', '2025-08-12', 'habis terpakai', 19, 18),
(276, 153, 'Kertas Ajaib', 'KB12-002-SK01-2025-08-12-0005', '1000.00', '2025-08-12', 'habis terpakai', 17, 18),
(277, 153, 'Kertas Ajaib', 'KB12-002-SK01-2025-08-12-0006', '1000.00', '2025-08-12', 'habis terpakai', 17, 18),
(278, 153, 'Kertas Ajaib', 'KB12-002-SK01-2025-08-12-0007', '1000.00', '2025-08-12', 'habis terpakai', 17, 14),
(279, 153, 'Kertas Ajaib', 'KB12-002-SK01-2025-08-12-0008', '1000.00', '2025-08-12', 'tersedia', NULL, NULL),
(280, 153, 'Kertas Ajaib', 'KB12-002-SK01-2025-08-12-0009', '1000.00', '2025-08-12', 'tersedia', NULL, NULL),
(281, 153, 'Kertas Ajaib', 'KB12-002-SK01-2025-08-12-0010', '1000.00', '2025-08-12', 'tersedia', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int UNSIGNED NOT NULL,
  `kode_kategori` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `kode_kategori`, `nama_kategori`) VALUES
(1, '001', 'Barang Modal'),
(2, '002', 'Habis Pakai '),
(4, '003', 'Perlengkapan Kebersihan'),
(6, '004', 'Makanan');

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id` int UNSIGNED NOT NULL,
  `id_pengguna` int UNSIGNED DEFAULT NULL,
  `id_lokasi` int UNSIGNED DEFAULT NULL,
  `nama_kendaraan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_polisi` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nomor_polisi_sebelumnya` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `warna` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model_kendaraan` enum('motor','mobil') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `merk_kendaraan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tipe_kendaraan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `harga` decimal(15,2) NOT NULL,
  `tahun_kendaraan` year NOT NULL,
  `no_rangka` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_stnk` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_mesin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_bpkb` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pembayaran_pajak` date NOT NULL,
  `masa_berlaku` date NOT NULL,
  `harga_pajak` decimal(15,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`id`, `id_pengguna`, `id_lokasi`, `nama_kendaraan`, `no_polisi`, `nomor_polisi_sebelumnya`, `warna`, `model_kendaraan`, `merk_kendaraan`, `tipe_kendaraan`, `harga`, `tahun_kendaraan`, `no_rangka`, `no_stnk`, `no_mesin`, `no_bpkb`, `pembayaran_pajak`, `masa_berlaku`, `harga_pajak`) VALUES
(35, 17, 14, 'Mobil Dinas Sekretariat', 'AB 1234 CD', 'AB 9876 XY', 'Hitam', 'mobil', 'Toyota', 'Avanza', '630000000.00', 2021, 'MHFGX8H01KJ045678', 'JSKSQPKS', '2AR-FE890XYZ', '12031283', '2025-08-01', '2026-08-01', '600000.00'),
(36, 17, 18, 'Motor Dinas Operasional Kominfo', 'AB 1234 CD', 'AB 4321 DC', 'Hitam', 'motor', 'Honda', 'Supra X 125', '18500000.00', 2020, 'MH1KE1234LJ567890', 'STNK-09876', 'KE1234LJ567890', 'BPKB-54321', '2025-07-31', '2026-07-31', '500000.00'),
(37, 19, NULL, 'Supra', 'AA 8765 DW', 'AB 9876 XY', 'Hitam', 'motor', 'Honda', 'Supra X 125', '20000000.00', 2020, 'KIOTR2J80NW045238', '12345671234', '2BR-FE768ABC', 'MQOW8239K', '2025-07-31', '2026-07-31', '700000.00');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `id` int UNSIGNED NOT NULL,
  `kode_lokasi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_lokasi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi_lokasi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`id`, `kode_lokasi`, `nama_lokasi`, `deskripsi_lokasi`) VALUES
(14, 'KL06', 'alun alun', '-'),
(18, 'KL10', 'Diskominfo', '-');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint UNSIGNED NOT NULL,
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `namespace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time` int NOT NULL,
  `batch` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2025-03-28-123012', 'App\\Database\\Migrations\\CreateBarangTable', 'default', 'App', 1743166641, 1),
(2, '2025-03-28-123047', 'App\\Database\\Migrations\\CreateKategoriTable', 'default', 'App', 1743166795, 2),
(30, '2025-04-09-070333', 'App\\Database\\Migrations\\CreateKategoriTable', 'default', 'App', 1744642526, 3),
(31, '2025-04-09-070334', 'App\\Database\\Migrations\\CreateSubKategoriTable', 'default', 'App', 1744642526, 3),
(32, '2025-04-09-070930', 'App\\Database\\Migrations\\CreateAssetTable', 'default', 'App', 1744642526, 3),
(34, '2025-04-14-144856', 'App\\Database\\Migrations\\CreatUsersTable', 'default', 'App', 1744644219, 4),
(35, '2025-04-16-043232', 'App\\Database\\Migrations\\CreateLokasiTable', 'default', 'App', 1744791044, 5),
(37, '2025-04-17-025015', 'App\\Database\\Migrations\\CreateLokasiTable', 'default', 'App', 1745309017, 6),
(40, '2025-04-23-070517', 'App\\Database\\Migrations\\CreataBarangTable', 'default', 'App', 1745827731, 7),
(56, '2025-04-30-014207', 'App\\Database\\Migrations\\CreatePenggunaTable', 'default', 'App', 1746602530, 8),
(57, '2025-04-30-031738', 'App\\Database\\Migrations\\CreateBarangTable', 'default', 'App', 1746602530, 8),
(61, '2025-05-08-005324', 'App\\Database\\Migrations\\CreatKendaraanTable', 'default', 'App', 1746687784, 9),
(78, '2025-05-20-020341', 'App\\Database\\Migrations\\CreateTableRiwayat', 'default', 'App', 1748401166, 10),
(79, '2025-05-28-025850', 'App\\Database\\Migrations\\CreatKendaraanTable', 'default', 'App', 1748401447, 11),
(87, '2025-05-28-074734', 'App\\Database\\Migrations\\CreatKendaraanTable', 'default', 'App', 1748418482, 12),
(91, '2025-05-28-074849', 'App\\Database\\Migrations\\CreateRiwayatKendaraanTable', 'default', 'App', 1750731073, 13),
(98, '2025-07-01-041144', 'App\\Database\\Migrations\\CreateRiwayatAssetTable', 'default', 'App', 1751818136, 14),
(108, '2025-07-04-015558', 'App\\Database\\Migrations\\CreatPemakaianTable', 'default', 'App', 1751965355, 15);

-- --------------------------------------------------------

--
-- Table structure for table `pemakaian`
--

CREATE TABLE `pemakaian` (
  `id` int UNSIGNED NOT NULL,
  `kode_kategori` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kode_sub_kategori` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_asset` int UNSIGNED NOT NULL,
  `id_lokasi` int UNSIGNED NOT NULL,
  `id_pengguna` int UNSIGNED NOT NULL,
  `jumlah_digunakan` int UNSIGNED NOT NULL,
  `satuan_penggunaan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` enum('tersedia','habis terpakai','terpakai') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'tersedia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pemakaian`
--

INSERT INTO `pemakaian` (`id`, `kode_kategori`, `kode_sub_kategori`, `id_asset`, `id_lokasi`, `id_pengguna`, `jumlah_digunakan`, `satuan_penggunaan`, `tanggal_mulai`, `tanggal_selesai`, `keterangan`, `created_at`, `updated_at`, `status`) VALUES
(5, '003', 'SK14', 146, 18, 18, 2, 'buah', '2025-07-31', '2025-08-09', '-', NULL, NULL, 'terpakai'),
(6, '001', 'SK03', 147, 18, 19, 1, 'buah', '2025-08-01', '2025-10-03', '-', NULL, NULL, 'terpakai'),
(7, '003', 'SK14', 148, 18, 17, 4, 'buah', '2024-12-02', '2024-12-31', '-', NULL, NULL, 'terpakai'),
(8, '003', 'SK14', 148, 18, 18, 2, 'buah', '2024-11-12', '2025-01-29', '-', NULL, NULL, 'terpakai'),
(10, '001', 'SK03', 147, 18, 19, 1, 'buah', '2025-08-04', '2025-08-06', '-', NULL, NULL, 'terpakai'),
(11, '002', 'SK01', 149, 18, 17, 3, 'buah', '2025-08-05', '2025-08-05', '-', NULL, NULL, 'terpakai'),
(12, '002', 'SK01', 149, 18, 17, 2, 'buah', '2025-08-07', '2025-08-07', '-', NULL, NULL, 'tersedia'),
(13, '002', 'SK01', 151, 18, 17, 4, 'buah', '2025-08-06', '2025-08-06', '-', NULL, NULL, 'habis terpakai'),
(14, '002', 'SK01', 151, 18, 18, 4, 'buah', '2025-08-10', '2025-08-11', '-', NULL, NULL, 'habis terpakai'),
(15, '001', 'SK03', 152, 18, 20, 1, 'buah', '2025-08-13', '2025-08-14', '-', NULL, NULL, 'terpakai'),
(16, '004', 'SK15', 150, 18, 20, 1, 'buah', '2025-08-12', '2025-08-12', '', NULL, NULL, 'terpakai'),
(17, '002', 'SK01', 151, 18, 19, 2, 'buah', '2025-08-12', '2025-08-12', '-', NULL, NULL, 'habis terpakai'),
(18, '002', 'SK01', 153, 18, 19, 2, 'pcs', '2025-08-13', '2025-08-13', '', NULL, NULL, 'habis terpakai'),
(19, '002', 'SK01', 153, 18, 19, 2, 'pc', '2025-08-13', '2025-08-13', '', NULL, NULL, 'habis terpakai'),
(20, '002', 'SK01', 153, 18, 17, 2, 'pcs', '2025-08-13', '2025-08-13', '', NULL, NULL, 'habis terpakai'),
(21, '002', 'SK01', 153, 14, 17, 1, 'pcs', '2025-08-12', '2025-08-13', '', NULL, NULL, 'habis terpakai');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int UNSIGNED NOT NULL,
  `nama_pengguna` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_hp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_lokasi` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `nama_pengguna`, `nip`, `no_hp`, `alamat`, `id_lokasi`) VALUES
(17, 'Duta Adi', '24060123140174', '082141591690', 'gg bogowonto', 14),
(18, 'KIKI', '2460123140172', '082783421520', 'Jl tanimbar', 18),
(19, 'Inul', '2405302135', '072124792010', 'kemangguan', 18),
(20, 'Herel', '29338471920', '089743251782', 'Gemesekti', 18);

-- --------------------------------------------------------

--
-- Table structure for table `riwayat`
--

CREATE TABLE `riwayat` (
  `id` int UNSIGNED NOT NULL,
  `id_asset` int UNSIGNED NOT NULL,
  `id_barang` int UNSIGNED NOT NULL,
  `id_pengguna` int UNSIGNED DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jumlah_digunakan` int DEFAULT NULL,
  `satuan_penggunaan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `riwayat`
--

INSERT INTO `riwayat` (`id`, `id_asset`, `id_barang`, `id_pengguna`, `tanggal_mulai`, `tanggal_selesai`, `keterangan`, `jumlah_digunakan`, `satuan_penggunaan`) VALUES
(39837, 146, 228, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39838, 146, 229, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39839, 146, 230, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39840, 146, 231, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39841, 146, 232, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39842, 146, 233, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39843, 146, 234, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39844, 146, 235, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39845, 146, 236, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39846, 146, 237, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39847, 146, 228, NULL, '2025-07-30', '2025-07-31', '-', 1, 'buah'),
(39849, 146, 228, NULL, '2025-07-29', '2025-07-29', '-', 1, 'buah'),
(39850, 147, 238, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39851, 147, 239, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39852, 147, 240, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39853, 147, 241, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39854, 147, 242, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39855, 148, 243, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39856, 148, 244, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39857, 148, 245, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39858, 148, 246, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39859, 148, 247, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39860, 148, 248, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39861, 148, 249, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39862, 148, 250, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39863, 148, 251, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39864, 148, 252, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39865, 147, 238, NULL, '2025-08-05', '2025-08-04', '-', 1, 'buah'),
(39866, 147, 238, 18, '2025-08-07', '2025-08-28', '-', 1, 'buah'),
(39867, 147, 238, 17, '2025-08-04', '2025-08-20', '', 1, 'buah'),
(39873, 150, 258, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39874, 151, 259, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39875, 151, 260, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39876, 151, 261, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39877, 151, 262, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39878, 151, 263, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39879, 151, 264, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39880, 151, 265, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39881, 151, 266, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39882, 151, 267, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39884, 146, 228, 20, '2025-08-11', NULL, 'Perubahan pemilik barang', NULL, NULL),
(39885, 152, 269, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39886, 152, 270, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39887, 152, 271, NULL, NULL, NULL, 'Barang masuk', NULL, NULL),
(39888, 152, 269, 17, '2025-08-11', NULL, 'Perubahan pemilik barang', NULL, NULL),
(39889, 152, 269, 18, '2025-08-11', NULL, 'Perubahan pemilik barang', NULL, NULL),
(39890, 152, 269, 19, '2025-08-11', NULL, 'Perubahan pemilik barang', NULL, NULL),
(39891, 146, 230, 18, '2025-08-11', NULL, 'Perubahan pemilik barang', NULL, NULL),
(39892, 146, 230, 19, '2025-08-11', NULL, 'Perubahan pemilik barang', NULL, NULL),
(39893, 146, 230, 17, '2025-08-11', NULL, 'Perubahan pemilik barang', NULL, NULL),
(39894, 152, 269, 20, '2025-08-13', NULL, 'Perubahan pemilik barang', NULL, NULL),
(39895, 150, 258, 17, '2025-08-12', NULL, 'Perubahan pemilik barang', NULL, NULL),
(39896, 150, 258, 20, '2025-08-12', NULL, 'Perubahan pemilik barang', NULL, NULL),
(39897, 146, 230, 19, '2025-08-27', NULL, 'Perubahan pemilik barang', NULL, NULL),
(39898, 146, 230, 20, '2025-08-29', NULL, 'Perubahan pemilik barang', NULL, NULL),
(39899, 150, 258, 19, '2025-08-13', NULL, 'Perubahan pemilik barang', NULL, NULL),
(39900, 150, 258, 18, '2025-08-15', NULL, 'Perubahan pemilik barang', NULL, NULL),
(39901, 150, 258, 20, '2025-08-14', NULL, 'Perubahan pemilik barang', NULL, NULL),
(39902, 146, 228, 18, '2025-08-19', NULL, 'Perubahan pemilik barang', NULL, NULL),
(39903, 146, 228, 19, '2025-08-20', NULL, 'Perubahan pemilik barang', NULL, NULL),
(39904, 146, 229, 18, '2025-08-19', NULL, 'Perubahan pemilik barang', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_kendaraan`
--

CREATE TABLE `riwayat_kendaraan` (
  `id` int UNSIGNED NOT NULL,
  `id_kendaraan` int UNSIGNED NOT NULL,
  `id_pengguna` int UNSIGNED DEFAULT NULL,
  `id_lokasi` int UNSIGNED DEFAULT NULL,
  `nomor_polisi` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `riwayat_kendaraan`
--

INSERT INTO `riwayat_kendaraan` (`id`, `id_kendaraan`, `id_pengguna`, `id_lokasi`, `nomor_polisi`, `tanggal_mulai`, `tanggal_selesai`, `keterangan`) VALUES
(17, 35, 17, 18, 'AB 1234 CD', '2025-07-29', NULL, 'Kendaraan baru ditambahkan'),
(18, 36, 17, 18, 'AB 1234 CD', '2025-07-29', NULL, 'Kendaraan baru ditambahkan'),
(19, 37, 19, 18, 'AA 8765 DW', '2025-07-30', NULL, 'Kendaraan baru ditambahkan'),
(20, 35, 19, 18, 'AB 1234 CD', '2025-08-08', '2025-08-16', '');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_pembelian`
--

CREATE TABLE `riwayat_pembelian` (
  `id_riwayat` int UNSIGNED NOT NULL,
  `id_asset` int UNSIGNED NOT NULL,
  `kode_sub_kategori` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kode_kategori` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kode_barang` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi_barang` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `jumlah_dibeli` int UNSIGNED NOT NULL,
  `harga_satuan` decimal(12,2) NOT NULL,
  `total_harga` decimal(12,2) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `riwayat_pembelian`
--

INSERT INTO `riwayat_pembelian` (`id_riwayat`, `id_asset`, `kode_sub_kategori`, `kode_kategori`, `nama_barang`, `kode_barang`, `deskripsi_barang`, `jumlah_dibeli`, `harga_satuan`, `total_harga`, `tanggal_pembelian`, `created_at`, `updated_at`) VALUES
(30, 145, 'SK03', '001', 'kertas', 'KB04', '-', 5, '5000000.00', '25000000.00', '2025-07-09', NULL, NULL),
(31, 146, 'SK14', '003', 'Sapu Ijuk', 'KB05', '-', 10, '21700.00', '217000.00', '2025-07-28', NULL, NULL),
(32, 147, 'SK03', '001', 'Laptop Asus ROG', 'KB06', '-', 5, '15000000.00', '75000000.00', '2025-07-31', NULL, NULL),
(33, 148, 'SK14', '003', 'Sapu Lidi', 'KB07', '-', 10, '9000.00', '90000.00', '2024-06-30', NULL, NULL),
(34, 149, 'SK01', '002', 'Kertas Manila', 'KB08', '-', 5, '500.00', '2500.00', '2025-08-04', NULL, NULL),
(35, 150, 'SK15', '004', 'Sayur sop', 'KB09', '-', 1, '10000.00', '10000.00', '2025-08-06', NULL, NULL),
(36, 151, 'SK01', '002', 'Kertas Buram', 'KB10', '-', 10, '250.00', '2500.00', '2025-08-06', NULL, NULL),
(37, 152, 'SK03', '001', 'PC', 'KB11', '-', 3, '15000000.00', '45000000.00', '2025-08-11', NULL, NULL),
(38, 153, 'SK01', '002', 'Kertas Ajaib', 'KB12', '-', 10, '1000.00', '10000.00', '2025-08-12', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_kategori`
--

CREATE TABLE `sub_kategori` (
  `id` int UNSIGNED NOT NULL,
  `kode_kategori` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kode_sub_kategori` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_sub_kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi_sub_kategori` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_kategori`
--

INSERT INTO `sub_kategori` (`id`, `kode_kategori`, `kode_sub_kategori`, `nama_sub_kategori`, `deskripsi_sub_kategori`) VALUES
(52, '002', 'SK01', 'Barang Kertas', '-'),
(54, '001', 'SK03', 'barang  elektronik', '-'),
(55, '002', 'SK04', 'Barang Perabot Kantor', '-'),
(56, '001', 'SK05', 'Barang Meja Kursi', '-'),
(57, '001', 'SK06', 'Persediaan Barang Cetak', '-'),
(58, '002', 'SK07', 'Barang Pos', '-'),
(59, '001', 'SK08', 'Persediaan Barang Cetak', '-\r\n'),
(60, '002', 'SK09', 'Barang Meja Kursi', '-'),
(61, '001', 'SK10', 'Barang Perabot Kantor', '-'),
(62, '001', 'SK11', 'Barang Perabot Kantor', '-'),
(63, '002', 'SK12', 'Barang Pos', '-'),
(64, '001', 'SK13', 'Barang Meja Kursi', '-'),
(65, '003', 'SK14', 'Barang Sapu', '-'),
(66, '004', 'SK15', 'Sayur', 'enak');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `nama`, `email`, `password`, `role`) VALUES
(1, 'Admin', 'admin', 'admin@gmail.com', '$2y$10$ySg8u9bm4x/.XWuvL6JXMe0KETWe9qNZZZSey6aXsHy8jBpZj3x76', 'admin'),
(7, 'duta123', 'Duta Adi Pamungkas', 'duta@gmail.com', '$2y$10$x6lX/ThGZNw5oLOBtR90QubUU0RVfozcOmDkp7BdDSS9QAMBE8JkS', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asset_kode_sub_kategori_foreign` (`kode_sub_kategori`),
  ADD KEY `asset_kode_kategori_foreign` (`kode_kategori`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_id_asset_foreign` (`id_asset`),
  ADD KEY `barang_id_pengguna_foreign` (`id_pengguna`),
  ADD KEY `barang_id_lokasi_foreign` (`id_lokasi`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_kategori` (`kode_kategori`);

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kendaraan_id_pengguna_foreign` (`id_pengguna`),
  ADD KEY `kendaraan_id_lokasi_foreign` (`id_lokasi`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemakaian`
--
ALTER TABLE `pemakaian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pemakaian_kode_kategori_foreign` (`kode_kategori`),
  ADD KEY `pemakaian_kode_sub_kategori_foreign` (`kode_sub_kategori`),
  ADD KEY `pemakaian_id_asset_foreign` (`id_asset`),
  ADD KEY `pemakaian_id_lokasi_foreign` (`id_lokasi`),
  ADD KEY `pemakaian_id_pengguna_foreign` (`id_pengguna`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengguna_id_lokasi_foreign` (`id_lokasi`);

--
-- Indexes for table `riwayat`
--
ALTER TABLE `riwayat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `riwayat_id_asset_foreign` (`id_asset`),
  ADD KEY `riwayat_id_pengguna_foreign` (`id_pengguna`),
  ADD KEY `riwayat_id_barang_foreign` (`id_barang`);

--
-- Indexes for table `riwayat_kendaraan`
--
ALTER TABLE `riwayat_kendaraan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `riwayat_kendaraan_id_kendaraan_foreign` (`id_kendaraan`),
  ADD KEY `riwayat_kendaraan_id_pengguna_foreign` (`id_pengguna`),
  ADD KEY `riwayat_kendaraan_id_lokasi_foreign` (`id_lokasi`);

--
-- Indexes for table `riwayat_pembelian`
--
ALTER TABLE `riwayat_pembelian`
  ADD PRIMARY KEY (`id_riwayat`),
  ADD KEY `riwayat_pembelian_id_asset_foreign` (`id_asset`);

--
-- Indexes for table `sub_kategori`
--
ALTER TABLE `sub_kategori`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_sub_kategori` (`kode_sub_kategori`),
  ADD KEY `sub_kategori_kode_kategori_foreign` (`kode_kategori`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kendaraan`
--
ALTER TABLE `kendaraan`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `pemakaian`
--
ALTER TABLE `pemakaian`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `riwayat`
--
ALTER TABLE `riwayat`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39905;

--
-- AUTO_INCREMENT for table `riwayat_kendaraan`
--
ALTER TABLE `riwayat_kendaraan`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `riwayat_pembelian`
--
ALTER TABLE `riwayat_pembelian`
  MODIFY `id_riwayat` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `sub_kategori`
--
ALTER TABLE `sub_kategori`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `asset_kode_kategori_foreign` FOREIGN KEY (`kode_kategori`) REFERENCES `kategori` (`kode_kategori`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `asset_kode_sub_kategori_foreign` FOREIGN KEY (`kode_sub_kategori`) REFERENCES `sub_kategori` (`kode_sub_kategori`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_id_asset_foreign` FOREIGN KEY (`id_asset`) REFERENCES `asset` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_id_lokasi_foreign` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_id_pengguna_foreign` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD CONSTRAINT `kendaraan_id_lokasi_foreign` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kendaraan_id_pengguna_foreign` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pemakaian`
--
ALTER TABLE `pemakaian`
  ADD CONSTRAINT `pemakaian_id_asset_foreign` FOREIGN KEY (`id_asset`) REFERENCES `asset` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `pemakaian_id_lokasi_foreign` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `pemakaian_id_pengguna_foreign` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `pemakaian_kode_kategori_foreign` FOREIGN KEY (`kode_kategori`) REFERENCES `kategori` (`kode_kategori`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `pemakaian_kode_sub_kategori_foreign` FOREIGN KEY (`kode_sub_kategori`) REFERENCES `sub_kategori` (`kode_sub_kategori`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD CONSTRAINT `pengguna_id_lokasi_foreign` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `riwayat`
--
ALTER TABLE `riwayat`
  ADD CONSTRAINT `riwayat_id_asset_foreign` FOREIGN KEY (`id_asset`) REFERENCES `asset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `riwayat_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `riwayat_id_pengguna_foreign` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `riwayat_kendaraan`
--
ALTER TABLE `riwayat_kendaraan`
  ADD CONSTRAINT `riwayat_kendaraan_id_kendaraan_foreign` FOREIGN KEY (`id_kendaraan`) REFERENCES `kendaraan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `riwayat_kendaraan_id_lokasi_foreign` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `riwayat_kendaraan_id_pengguna_foreign` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `riwayat_pembelian`
--
ALTER TABLE `riwayat_pembelian`
  ADD CONSTRAINT `riwayat_pembelian_id_asset_foreign` FOREIGN KEY (`id_asset`) REFERENCES `asset` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `sub_kategori`
--
ALTER TABLE `sub_kategori`
  ADD CONSTRAINT `sub_kategori_kode_kategori_foreign` FOREIGN KEY (`kode_kategori`) REFERENCES `kategori` (`kode_kategori`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
