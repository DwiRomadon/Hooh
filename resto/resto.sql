-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2018 at 03:07 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resto`
--

-- --------------------------------------------------------

--
-- Table structure for table `bahan`
--

CREATE TABLE `bahan` (
  `id_bahan` int(11) NOT NULL,
  `id_satuan` int(11) NOT NULL,
  `nama_bahan` varchar(150) NOT NULL,
  `harga_bahan` int(11) NOT NULL,
  `stock_bahan` float NOT NULL,
  `catatan_bahan` text NOT NULL,
  `tgl_input_bahan` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bahan`
--

INSERT INTO `bahan` (`id_bahan`, `id_satuan`, `nama_bahan`, `harga_bahan`, `stock_bahan`, `catatan_bahan`, `tgl_input_bahan`) VALUES
(1, 2, 'Minyak goreng sania pouch', 23500, 4, '  Minyak goreng sania pouch', '2018-11-08 00:00:00'),
(4, 1, 'Kecap manis Cap bango ', 11000, 450, 'Ketchapp', '2018-11-08 19:37:32'),
(5, 1, 'Gula putih', 7500, 5000, 'Gula putih ', '2018-11-08 19:50:36'),
(6, 1, 'Bawang merah', 18200, 4984, ' Bawang merah mantap', '2018-11-08 19:51:34'),
(7, 1, 'Bawang putih', 8500, 4984, 'White onion', '2018-11-08 19:52:55'),
(8, 1, 'Gula merah', 8000, 5000, 'Red sugar\r\n', '2018-11-08 19:53:33'),
(9, 2, 'Kecap asin', 18000, 2000, ' Salted ketchapp', '2018-11-08 19:54:38'),
(10, 3, 'Daging ayam bag. Sayap', 9000, 15, 'Daging ayam bag. Sayap', '2018-11-08 19:56:31'),
(11, 3, 'Daging ayam bag. Dada', 9000, 16, 'Daging ayam bag. Dada', '2018-11-08 19:57:26'),
(12, 1, 'Kentang stik', 9500, 10000, 'Kentang ', '2018-11-08 19:59:16'),
(13, 1, 'Saus tomat', 22500, 5000, 'saus tomat delmonte', '2018-11-10 14:41:01'),
(14, 1, 'Garam meja', 8000, 1998, 'Garam asin', '2018-11-12 15:03:05'),
(15, 1, 'Cabai rawit', 2200, 4488, '', '2018-11-12 15:03:50'),
(16, 1, 'Cabai merah', 18500, 5000, '', '2018-11-12 15:04:09'),
(17, 3, 'Buah Alpukat', 21500, 11.5, 'Buah alpukat untuk jus', '2018-11-15 09:33:38'),
(18, 1, 'Susu coklat frisian flag', 12500, 3685, 'susu coklat kaleng 370 gram', '2018-11-15 09:36:32'),
(19, 1, 'Es batu', 1000, 4965, 'es batu', '2018-11-15 09:37:31'),
(20, 1, 'Buah jeruk', 15700, 7000, 'Buah jeruk', '2018-11-15 09:39:34'),
(21, 1, 'Serbuk cappucino', 25000, 10000, 'Serbuk cappucino', '2018-11-15 09:44:24'),
(22, 1, 'Meses coklat', 7600, 1000, 'Meses coklat', '2018-11-15 09:45:23');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` int(11) NOT NULL,
  `nama_karyawan` varchar(150) NOT NULL,
  `telp_karyawan` char(20) NOT NULL,
  `username` char(30) NOT NULL,
  `password` char(30) NOT NULL,
  `tgl_login_terakhir` datetime NOT NULL,
  `tgl_input_karyawan` datetime NOT NULL,
  `jabatan` enum('chef','waiter','manajer','owner') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama_karyawan`, `telp_karyawan`, `username`, `password`, `tgl_login_terakhir`, `tgl_input_karyawan`, `jabatan`) VALUES
(1, 'chef juna skom', '0901209912', 'juna', 'chefjun', '0000-00-00 00:00:00', '2018-11-17 15:36:54', 'chef'),
(8, 'ricky', '089182392', 'ricky', 'ricky]', '0000-00-00 00:00:00', '2018-11-09 22:26:09', 'waiter'),
(9, 'Asep Faturahaman', '089128323', 'asep', 'asep123', '0000-00-00 00:00:00', '2018-11-09 22:27:05', 'owner'),
(10, 'Riska indah', '08410931239', 'riska', 'riska', '0000-00-00 00:00:00', '2018-11-09 22:28:22', 'manajer');

-- --------------------------------------------------------

--
-- Table structure for table `meja`
--

CREATE TABLE `meja` (
  `id_meja` int(11) NOT NULL,
  `no_meja` char(20) NOT NULL,
  `catatan_meja` varchar(150) DEFAULT NULL,
  `tgl_input_meja` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meja`
--

INSERT INTO `meja` (`id_meja`, `no_meja`, `catatan_meja`, `tgl_input_meja`) VALUES
(2, 'A1', 'meja label A1', '2018-11-09 21:39:50'),
(3, 'A2', 'meja a2', '2018-11-09 21:40:00');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `id_menu_kategori` int(11) NOT NULL,
  `nama_menu` varchar(200) NOT NULL,
  `foto_menu` varchar(255) NOT NULL,
  `harga_menu` int(11) NOT NULL,
  `stock_menu` int(11) NOT NULL,
  `catatan_menu` text NOT NULL,
  `tgl_input_menu` datetime NOT NULL,
  `is_favorit` tinyint(1) NOT NULL,
  `is_avaible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `id_menu_kategori`, `nama_menu`, `foto_menu`, `harga_menu`, `stock_menu`, `catatan_menu`, `tgl_input_menu`, `is_favorit`, `is_avaible`) VALUES
(4, 8, 'french fries  (medium)', 'Cara-Membuat-Kentang-Goreng-Renyah-dan-Gurih-300x1953.jpg', 12500, 20, 'french fries / kentang goreng stick renyah dilengkapi saus tomat dan mayonaise', '2018-11-10 19:57:05', 0, 0),
(5, 8, 'French fries (Large)', 'Cara-Membuat-Kentang-Goreng-Renyah-dan-Gurih-300x195.jpg', 17500, 15, 'French fries (Large) dengan quantity lebih banyak buat kamu dan teman-teman.', '2018-11-10 20:01:45', 0, 1),
(8, 2, 'Ayam geprek pedas ', 'ayam_geprek1.jpg', 14500, 10, 'Ayam geprek level pedas sedang.', '2018-11-12 15:05:58', 0, 1),
(9, 1, 'Jus alpukat', 'avocado-juice.jpg', 8500, 25, 'jus alpukat segar dengan tambahan susu coklat.', '2018-11-15 09:37:46', 0, 1),
(10, 1, 'Jus jeruk', '3758394.jpg', 8500, 20, 'jus jeruk', '2018-11-15 09:41:23', 0, 1),
(11, 1, 'Cappucino Cincau', 'ice-cappucino-249x300.png', 6500, 15, 'minuman capucino dingin dilengkapi cincau dan susu coklat sebagai topping.', '2018-11-15 09:46:57', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu_has_bahan`
--

CREATE TABLE `menu_has_bahan` (
  `id_menu_has_bahan` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_bahan` int(11) NOT NULL,
  `quantity` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_has_bahan`
--

INSERT INTO `menu_has_bahan` (`id_menu_has_bahan`, `id_menu`, `id_bahan`, `quantity`) VALUES
(28, 5, 12, 500),
(29, 5, 13, 150),
(30, 5, 1, 0.5),
(36, 8, 11, 1),
(37, 8, 6, 4),
(38, 8, 7, 4),
(39, 8, 15, 3),
(40, 8, 14, 0.5),
(45, 9, 17, 0.5),
(46, 9, 18, 15),
(47, 9, 19, 35),
(48, 10, 20, 450),
(49, 10, 5, 80),
(50, 10, 19, 120),
(51, 4, 12, 250),
(52, 4, 1, 1),
(53, 4, 13, 200),
(54, 4, 9, 0.2),
(55, 11, 21, 200),
(56, 11, 19, 450),
(57, 11, 22, 45),
(58, 11, 18, 45);

-- --------------------------------------------------------

--
-- Table structure for table `menu_kategori`
--

CREATE TABLE `menu_kategori` (
  `id_menu_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(200) NOT NULL,
  `catatan_kategori` varchar(255) NOT NULL,
  `tgl_input_kategori` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_kategori`
--

INSERT INTO `menu_kategori` (`id_menu_kategori`, `nama_kategori`, `catatan_kategori`, `tgl_input_kategori`) VALUES
(1, 'Minuman', 'kategori minuman', '2018-11-08 00:00:00'),
(2, 'Makanan', 'kategori makanan', '2018-11-08 01:58:00'),
(8, 'Snack', 'Kategori snack dan makanan ringan ', '2018-11-08 02:24:50');

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id_satuan` int(11) NOT NULL,
  `nama_satuan` varchar(150) NOT NULL,
  `catatan_satuan` varchar(150) NOT NULL,
  `tgl_input_satuan` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id_satuan`, `nama_satuan`, `catatan_satuan`, `tgl_input_satuan`) VALUES
(1, 'Gram', 'Grams', '2018-11-08 02:40:57'),
(2, 'Liter', 'Satuan liter untuk bahan cair seperti minyak makan dll', '2018-11-08 02:41:46'),
(3, 'Pcs', 'Satuan bijian', '2018-11-08 19:55:54');

-- --------------------------------------------------------

--
-- Table structure for table `sistem`
--

CREATE TABLE `sistem` (
  `id_sistem` int(11) NOT NULL,
  `nama_resto` varchar(150) NOT NULL,
  `telp_resto` char(16) NOT NULL,
  `alamat_resto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistem`
--

INSERT INTO `sistem` (`id_sistem`, `nama_resto`, `telp_resto`, `alamat_resto`) VALUES
(1, 'Black taste', '0891238', 'Jln. Pulau buru nomor 44 wayhalim permai bandarlampung');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `id_meja` int(11) NOT NULL,
  `catatan` text,
  `tgl_transaksi` datetime NOT NULL,
  `total_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_karyawan`, `id_meja`, `catatan`, `tgl_transaksi`, `total_bayar`) VALUES
(1, 8, 2, NULL, '2018-11-13 01:23:14', 0),
(2, 8, 2, 'ayam geprek jangan pedas', '2018-11-13 01:23:25', 0),
(3, 8, 2, 'ayam geprek jangan pedas', '2018-11-13 01:24:13', 0),
(5, 8, 2, 'ayam geprek jangan pedas', '2018-11-14 18:56:51', 0),
(6, 8, 3, '', '2018-11-14 19:35:21', 0),
(7, 8, 3, '', '2018-11-14 20:06:46', 0),
(8, 8, 3, 'jangan ditambahkan gula', '2018-11-18 20:39:16', 0),
(9, 8, 3, 'jangan ditambahkan gula', '2018-11-18 20:47:01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_detail`
--

CREATE TABLE `transaksi_detail` (
  `id_transaksi_detail` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `status` enum('wait','done','cancel') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`id_transaksi_detail`, `id_transaksi`, `id_menu`, `jumlah_beli`, `status`) VALUES
(1, 1, 8, 2, 'wait'),
(2, 1, 5, 1, 'wait'),
(3, 2, 8, 2, 'wait'),
(4, 2, 5, 1, 'wait'),
(5, 3, 8, 2, 'wait'),
(6, 3, 5, 1, 'cancel'),
(7, 5, 8, 2, 'wait'),
(8, 6, 4, 1, 'wait'),
(9, 7, 4, 1, 'done'),
(10, 7, 8, 2, 'wait'),
(11, 7, 5, 1, 'wait'),
(12, 8, 9, 1, 'done'),
(13, 9, 10, 2, 'wait');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bahan`
--
ALTER TABLE `bahan`
  ADD PRIMARY KEY (`id_bahan`),
  ADD KEY `id_satuan` (`id_satuan`) USING BTREE;

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `meja`
--
ALTER TABLE `meja`
  ADD PRIMARY KEY (`id_meja`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `id_menu_kategori` (`id_menu_kategori`) USING BTREE;

--
-- Indexes for table `menu_has_bahan`
--
ALTER TABLE `menu_has_bahan`
  ADD PRIMARY KEY (`id_menu_has_bahan`),
  ADD KEY `id_menu` (`id_menu`) USING BTREE,
  ADD KEY `id_bahan` (`id_bahan`) USING BTREE;

--
-- Indexes for table `menu_kategori`
--
ALTER TABLE `menu_kategori`
  ADD PRIMARY KEY (`id_menu_kategori`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indexes for table `sistem`
--
ALTER TABLE `sistem`
  ADD PRIMARY KEY (`id_sistem`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_karyawan_chef` (`id_karyawan`) USING BTREE,
  ADD KEY `id_meja` (`id_meja`);

--
-- Indexes for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD PRIMARY KEY (`id_transaksi_detail`),
  ADD KEY `id_menu` (`id_menu`) USING BTREE,
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bahan`
--
ALTER TABLE `bahan`
  MODIFY `id_bahan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_karyawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `meja`
--
ALTER TABLE `meja`
  MODIFY `id_meja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `menu_has_bahan`
--
ALTER TABLE `menu_has_bahan`
  MODIFY `id_menu_has_bahan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `menu_kategori`
--
ALTER TABLE `menu_kategori`
  MODIFY `id_menu_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sistem`
--
ALTER TABLE `sistem`
  MODIFY `id_sistem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  MODIFY `id_transaksi_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bahan`
--
ALTER TABLE `bahan`
  ADD CONSTRAINT `bahan_ibfk_1` FOREIGN KEY (`id_satuan`) REFERENCES `satuan` (`id_satuan`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`id_menu_kategori`) REFERENCES `menu_kategori` (`id_menu_kategori`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `menu_has_bahan`
--
ALTER TABLE `menu_has_bahan`
  ADD CONSTRAINT `menu_has_bahan_ibfk_2` FOREIGN KEY (`id_bahan`) REFERENCES `bahan` (`id_bahan`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_has_bahan_ibfk_3` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_meja`) REFERENCES `meja` (`id_meja`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD CONSTRAINT `transaksi_detail_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_detail_ibfk_2` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
