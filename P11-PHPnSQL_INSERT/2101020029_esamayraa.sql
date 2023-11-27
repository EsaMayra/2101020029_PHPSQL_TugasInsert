-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2023 at 04:46 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `2101020029_esamayraa`
--

-- --------------------------------------------------------

--
-- Table structure for table `detailpesanan`
--

CREATE TABLE `detailpesanan` (
  `id_detailpesanan` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_pesanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detailpesanan`
--

INSERT INTO `detailpesanan` (`id_detailpesanan`, `jumlah`, `id_produk`, `id_pesanan`) VALUES
(1, 2, 1, 1),
(2, 5, 2, 1),
(3, 1, 3, 2),
(4, 3, 1, 3),
(5, 4, 5, 4),
(6, 1, 6, 5),
(7, 2, 7, 6),
(8, 1, 8, 7),
(9, 3, 9, 8),
(10, 1, 10, 9);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Elektronik'),
(2, 'Pakaian'),
(3, 'Alat Rumah Tangga'),
(4, 'Olahraga'),
(5, 'Kesehatan'),
(6, 'Mainan'),
(7, 'Buku'),
(8, 'Makanan'),
(9, 'Minuman'),
(10, 'Kecantikan');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `tanggal_pesanan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `tanggal_pesanan`) VALUES
(1, '2023-01-01'),
(2, '2023-01-02'),
(3, '2023-01-03'),
(4, '2023-01-04'),
(5, '2023-01-05'),
(6, '2023-01-06'),
(7, '2023-01-07'),
(8, '2023-01-08'),
(9, '2023-01-09'),
(10, '2023-01-10');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `id_kategori` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga`, `gambar`, `id_kategori`) VALUES
(1, 'Komputer', 15000000, 'Komputer.jpg', 1),
(2, 'Sweater', 300000, 'Sweater.jpg', 2),
(3, 'Vacuum Cleaner', 1000000, 'Vacuum Cleaner.jpg', 3),
(4, 'Barbel', 500000, 'Barbel.jpg', 4),
(5, 'P3K', 40000, 'P3K.jpeg', 5),
(6, 'Toys', 700000, 'Toys.jpg', 6),
(7, 'Manga', 250000, 'Manga.jpg', 7),
(8, 'Seafood', 10000, 'Seafood.jpg', 8),
(9, 'Juice', 4000, 'Juice.jpg', 9),
(10, 'Make Up', 100000, 'MakeUp.jpg', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detailpesanan`
--
ALTER TABLE `detailpesanan`
  ADD PRIMARY KEY (`id_detailpesanan`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_pesanan` (`id_pesanan`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detailpesanan`
--
ALTER TABLE `detailpesanan`
  MODIFY `id_detailpesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailpesanan`
--
ALTER TABLE `detailpesanan`
  ADD CONSTRAINT `detailpesanan_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE,
  ADD CONSTRAINT `detailpesanan_ibfk_2` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`) ON DELETE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
