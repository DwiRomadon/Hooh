-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2019 at 10:28 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `resto`
--

-- --------------------------------------------------------

--
-- Table structure for table `bahan`
--

CREATE TABLE IF NOT EXISTS `bahan` (
`id_bahan` int(11) NOT NULL,
  `id_satuan` int(11) NOT NULL,
  `nama_bahan` varchar(150) NOT NULL,
  `harga_bahan` int(11) NOT NULL,
  `stock_bahan` float NOT NULL,
  `catatan_bahan` text NOT NULL,
  `tgl_input_bahan` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bahan`
--

INSERT INTO `bahan` (`id_bahan`, `id_satuan`, `nama_bahan`, `harga_bahan`, `stock_bahan`, `catatan_bahan`, `tgl_input_bahan`) VALUES
(11, 3, 'Dada Fillet', 8000, 20, 'Dada fillet', '2018-11-08 19:57:26'),
(17, 3, 'Buah Alpukat', 21500, 11.5, 'Buah alpukat untuk jus', '2018-11-15 09:33:38'),
(20, 3, 'Buah jeruk', 15000, 30, ' Buah jeruk', '2018-11-15 09:39:34'),
(23, 3, 'Ayam ', 7500, 40, '', '2019-01-22 23:14:44'),
(24, 3, 'Ikan Nila', 7500, 20, '', '2019-01-22 23:17:26'),
(25, 3, 'Mie', 1000, 20, '', '2019-01-22 23:17:51'),
(26, 3, 'Sosis', 1000, 50, '', '2019-01-22 23:18:22'),
(27, 1, 'Bakso', 50000, 2000, '', '2019-01-22 23:18:55'),
(28, 3, 'Pisang', 15000, 25, '', '2019-01-22 23:21:06'),
(29, 3, 'Roti', 1200, 20, '', '2019-01-22 23:22:10'),
(30, 3, 'Ceker', 20000, 30, '', '2019-01-22 23:22:41'),
(31, 3, 'mangga', 20000, 10, '', '2019-01-22 23:23:15'),
(32, 1, 'Melon', 30000, 1000, '', '2019-01-22 23:23:45');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE IF NOT EXISTS `karyawan` (
`id_karyawan` int(11) NOT NULL,
  `nama_karyawan` varchar(150) NOT NULL,
  `telp_karyawan` char(20) NOT NULL,
  `username` char(30) NOT NULL,
  `password` char(30) NOT NULL,
  `tgl_login_terakhir` datetime NOT NULL,
  `tgl_input_karyawan` datetime NOT NULL,
  `jabatan` enum('chef','waiter','manajer','owner') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama_karyawan`, `telp_karyawan`, `username`, `password`, `tgl_login_terakhir`, `tgl_input_karyawan`, `jabatan`) VALUES
(1, 'Asep Faturahaman', '089128323', 'juna', 'asep123', '0000-00-00 00:00:00', '2019-01-23 01:36:32', 'chef'),
(8, 'ricky', '089182392', 'ricky', 'ricky]', '0000-00-00 00:00:00', '2018-11-09 22:26:09', 'waiter'),
(9, 'Asep Faturahaman', '089128323', 'asep', 'asep123', '0000-00-00 00:00:00', '2018-11-09 22:27:05', 'owner'),
(10, 'Riska indah', '08410931239', 'riska', 'riska', '0000-00-00 00:00:00', '2018-11-09 22:28:22', 'manajer');

-- --------------------------------------------------------

--
-- Table structure for table `meja`
--

CREATE TABLE IF NOT EXISTS `meja` (
`id_meja` int(11) NOT NULL,
  `no_meja` char(20) NOT NULL,
  `catatan_meja` varchar(150) DEFAULT NULL,
  `tgl_input_meja` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meja`
--

INSERT INTO `meja` (`id_meja`, `no_meja`, `catatan_meja`, `tgl_input_meja`) VALUES
(2, '01', 'meja label A1', '2018-11-09 21:39:50'),
(3, '02', 'meja a2', '2018-11-09 21:40:00');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `id_menu_kategori`, `nama_menu`, `foto_menu`, `harga_menu`, `stock_menu`, `catatan_menu`, `tgl_input_menu`, `is_favorit`, `is_avaible`) VALUES
(12, 1, 'Jus Mangga', 'capucino.jpg', 8000, 20, '', '2019-01-22 22:37:48', 0, 1),
(13, 1, 'Jus Melon', 'capucino1.jpg', 8000, 20, '', '2019-01-22 22:38:22', 0, 1),
(14, 1, 'JUs Semangka', 'capucino2.jpg', 8000, 20, '', '2019-01-22 22:39:09', 0, 1),
(15, 1, 'Jus Buah Naga', 'capucino3.jpg', 8000, 20, '', '2019-01-22 22:39:40', 0, 1),
(16, 1, 'Jus Apel', 'capucino4.jpg', 8000, 20, '', '2019-01-22 22:40:18', 0, 1),
(17, 1, 'Jus Jeruk', 'capucino5.jpg', 8000, 20, '', '2019-01-22 22:40:44', 0, 1),
(18, 1, 'Jus Tomat', 'capucino6.jpg', 8000, 20, '', '2019-01-22 22:41:50', 0, 1),
(19, 1, 'Sop Buah', 'capucino7.jpg', 8000, 20, '', '2019-01-22 22:42:29', 0, 1),
(20, 1, 'Es Teler', 'capucino8.jpg', 8000, 20, '', '2019-01-22 22:42:56', 0, 1),
(21, 1, 'Es Teh', 'capucino9.jpg', 8000, 20, '', '2019-01-22 22:43:28', 0, 1),
(22, 1, 'Es Jeruk', 'capucino10.jpg', 8000, 20, '', '2019-01-22 22:44:07', 0, 1),
(23, 1, 'Es Cappucino', 'capucino11.jpg', 8000, 20, '', '2019-01-22 22:44:43', 0, 1),
(24, 1, 'Lemon Tea', 'capucino12.jpg', 8000, 20, '', '2019-01-22 22:45:11', 0, 1),
(25, 1, 'Lechy Tea', 'capucino13.jpg', 8000, 20, '', '2019-01-22 22:45:50', 0, 1),
(26, 1, 'Kopi Hitam', 'capucino14.jpg', 8000, 20, '', '2019-01-22 22:46:18', 0, 1),
(27, 1, 'Coffee Late', 'capucino15.jpg', 8000, 20, '', '2019-01-22 22:47:01', 0, 1),
(28, 1, 'Jeruk Hangat', 'capucino16.jpg', 8000, 20, '', '2019-01-22 22:47:26', 0, 1),
(29, 2, 'Ayam Penyet Kampung', 'goreng.jpg', 25000, 20, '', '2019-01-22 22:48:16', 0, 1),
(30, 2, 'Ayam penyet Potong', 'goreng1.jpg', 20000, 20, '', '2019-01-22 22:48:47', 0, 1),
(31, 2, 'Pecel Ayam Kampung', 'goreng2.jpg', 25000, 20, '', '2019-01-22 22:49:53', 0, 1),
(32, 2, 'Pecel Ayam Potong', 'goreng3.jpg', 20000, 20, '', '2019-01-22 22:50:27', 0, 1),
(33, 2, 'Ijo Pedes Ayam Kampung', 'goreng4.jpg', 25000, 20, '', '2019-01-22 22:51:05', 0, 1),
(34, 2, 'Ijo Pedes Ayam Potong', 'goreng5.jpg', 20000, 20, '', '2019-01-22 22:52:15', 0, 1),
(35, 2, 'Ayam Bakar Kampung', 'goreng6.jpg', 25000, 20, '', '2019-01-22 22:52:51', 0, 1),
(36, 2, 'Ayam Bakar Potong', 'goreng7.jpg', 20000, 20, '', '2019-01-22 22:53:30', 0, 1),
(37, 2, 'Ikan Nila Asam Manis', 'goreng8.jpg', 20000, 20, '', '2019-01-22 22:54:14', 0, 1),
(38, 2, 'Ikan Nila Bakar', 'goreng9.jpg', 20000, 20, '', '2019-01-22 22:54:42', 0, 1),
(39, 2, 'Ikan Nila Goreng', 'goreng10.jpg', 20000, 20, '', '2019-01-22 22:55:06', 0, 1),
(40, 2, 'Mie Goreng', 'bakar.jpg', 10000, 20, '', '2019-01-22 22:55:46', 0, 1),
(41, 2, 'Mie Tek Tek', 'bakar1.jpg', 12000, 20, '', '2019-01-22 22:56:11', 0, 1),
(42, 2, 'Nasi Goreng Selimut', 'bakar2.jpg', 10000, 20, '', '2019-01-22 22:56:57', 0, 1),
(43, 2, 'Nasi Goreng Pete', 'bakar3.jpg', 10, 20, '', '2019-01-22 22:57:33', 0, 1),
(44, 2, 'Nasi Goreng Teri', 'bakar4.jpg', 10000, 20, '', '2019-01-22 22:57:58', 0, 1),
(45, 2, 'Ayam Krispy', 'bakar5.jpg', 12000, 20, '', '2019-01-22 22:58:29', 0, 1),
(46, 2, 'Pisang Goreng', 'bakar6.jpg', 9000, 20, '', '2019-01-22 22:59:04', 0, 1),
(47, 2, 'Chicken Ball', 'bakar7.jpg', 10000, 20, '', '2019-01-22 22:59:34', 0, 1),
(48, 2, 'Siomay', 'bakar8.jpg', 6000, 20, '', '2019-01-22 23:00:01', 0, 1),
(49, 2, 'Tekwan', 'bakar9.jpg', 8000, 20, '', '2019-01-22 23:00:23', 0, 1),
(50, 2, 'Roti Bakar', 'bakar10.jpg', 8000, 20, '', '2019-01-22 23:01:00', 0, 1),
(51, 2, 'Sosis Goreng', 'bakar11.jpg', 6000, 20, '', '2019-01-22 23:01:41', 0, 1),
(52, 2, 'Sosis Bakar', 'bakar12.jpg', 6000, 20, '', '2019-01-22 23:02:18', 0, 1),
(53, 2, 'Kentang Goreng', 'bakar13.jpg', 7000, 20, '', '2019-01-22 23:02:51', 0, 1),
(54, 2, 'Jamur Crispy', 'bakar14.jpg', 7000, 20, '', '2019-01-22 23:03:14', 0, 1),
(55, 2, 'Seblak', 'bakar15.jpg', 10000, 20, '', '2019-01-22 23:03:50', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu_has_bahan`
--

CREATE TABLE IF NOT EXISTS `menu_has_bahan` (
`id_menu_has_bahan` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_bahan` int(11) NOT NULL,
  `quantity` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_has_bahan`
--

INSERT INTO `menu_has_bahan` (`id_menu_has_bahan`, `id_menu`, `id_bahan`, `quantity`) VALUES
(60, 40, 25, 1),
(61, 40, 26, 1),
(62, 40, 27, 20),
(63, 35, 23, 1),
(64, 35, 24, 1),
(65, 35, 26, 1),
(66, 35, 28, 3),
(67, 35, 20, 4);

-- --------------------------------------------------------

--
-- Table structure for table `menu_kategori`
--

CREATE TABLE IF NOT EXISTS `menu_kategori` (
`id_menu_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(200) NOT NULL,
  `catatan_kategori` varchar(255) NOT NULL,
  `tgl_input_kategori` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_kategori`
--

INSERT INTO `menu_kategori` (`id_menu_kategori`, `nama_kategori`, `catatan_kategori`, `tgl_input_kategori`) VALUES
(1, 'Minuman', 'kategori minuman', '2018-11-08 00:00:00'),
(2, 'Makanan', 'kategori makanan', '2018-11-08 01:58:00');

-- --------------------------------------------------------

--
-- Table structure for table `pre_transaksi`
--

CREATE TABLE IF NOT EXISTS `pre_transaksi` (
`id` int(11) NOT NULL,
  `id_meja` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `catatan` varchar(255) NOT NULL,
  `price` decimal(10,0) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE IF NOT EXISTS `satuan` (
`id_satuan` int(11) NOT NULL,
  `nama_satuan` varchar(150) NOT NULL,
  `catatan_satuan` varchar(150) NOT NULL,
  `tgl_input_satuan` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

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

CREATE TABLE IF NOT EXISTS `sistem` (
`id_sistem` int(11) NOT NULL,
  `nama_resto` varchar(150) NOT NULL,
  `telp_resto` char(16) NOT NULL,
  `alamat_resto` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistem`
--

INSERT INTO `sistem` (`id_sistem`, `nama_resto`, `telp_resto`, `alamat_resto`) VALUES
(1, 'Black taste', '081273433326', 'Jalan Sumberjaya, Lingkungan 1, Bukit Kemuning, Lampung Utara');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE IF NOT EXISTS `transaksi` (
`id_transaksi` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `id_meja` int(11) NOT NULL,
  `catatan` text,
  `tgl_transaksi` datetime NOT NULL,
  `total_bayar` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_detail`
--

CREATE TABLE IF NOT EXISTS `transaksi_detail` (
`id_transaksi_detail` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `status` enum('wait','done','cancel') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pretransaksi`
--
CREATE TABLE IF NOT EXISTS `v_pretransaksi` (
`id` int(11)
,`id_meja` int(11)
,`id_menu` int(11)
,`jumlah_beli` int(11)
,`catatan` varchar(255)
,`price` decimal(10,0)
,`nama_menu` varchar(200)
);
-- --------------------------------------------------------

--
-- Structure for view `v_pretransaksi`
--
DROP TABLE IF EXISTS `v_pretransaksi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pretransaksi` AS select `p`.`id` AS `id`,`p`.`id_meja` AS `id_meja`,`p`.`id_menu` AS `id_menu`,`p`.`jumlah_beli` AS `jumlah_beli`,`p`.`catatan` AS `catatan`,`p`.`price` AS `price`,`m`.`nama_menu` AS `nama_menu` from (`pre_transaksi` `p` join `menu` `m` on((`p`.`id_menu` = `m`.`id_menu`)));

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bahan`
--
ALTER TABLE `bahan`
 ADD PRIMARY KEY (`id_bahan`), ADD KEY `id_satuan` (`id_satuan`) USING BTREE;

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
 ADD PRIMARY KEY (`id_karyawan`), ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `meja`
--
ALTER TABLE `meja`
 ADD PRIMARY KEY (`id_meja`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
 ADD PRIMARY KEY (`id_menu`), ADD KEY `id_menu_kategori` (`id_menu_kategori`) USING BTREE;

--
-- Indexes for table `menu_has_bahan`
--
ALTER TABLE `menu_has_bahan`
 ADD PRIMARY KEY (`id_menu_has_bahan`), ADD KEY `id_menu` (`id_menu`) USING BTREE, ADD KEY `id_bahan` (`id_bahan`) USING BTREE;

--
-- Indexes for table `menu_kategori`
--
ALTER TABLE `menu_kategori`
 ADD PRIMARY KEY (`id_menu_kategori`);

--
-- Indexes for table `pre_transaksi`
--
ALTER TABLE `pre_transaksi`
 ADD PRIMARY KEY (`id`);

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
 ADD PRIMARY KEY (`id_transaksi`), ADD KEY `id_karyawan_chef` (`id_karyawan`) USING BTREE, ADD KEY `id_meja` (`id_meja`);

--
-- Indexes for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
 ADD PRIMARY KEY (`id_transaksi_detail`), ADD KEY `id_menu` (`id_menu`) USING BTREE, ADD KEY `id_transaksi` (`id_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bahan`
--
ALTER TABLE `bahan`
MODIFY `id_bahan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
MODIFY `id_karyawan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `meja`
--
ALTER TABLE `meja`
MODIFY `id_meja` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `menu_has_bahan`
--
ALTER TABLE `menu_has_bahan`
MODIFY `id_menu_has_bahan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `menu_kategori`
--
ALTER TABLE `menu_kategori`
MODIFY `id_menu_kategori` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pre_transaksi`
--
ALTER TABLE `pre_transaksi`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sistem`
--
ALTER TABLE `sistem`
MODIFY `id_sistem` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
MODIFY `id_transaksi_detail` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
