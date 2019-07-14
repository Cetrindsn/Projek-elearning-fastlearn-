-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2019 at 06:47 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fastlearn`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `Id_admin` char(8) NOT NULL,
  `Nama_admin` varchar(30) NOT NULL,
  `Jenis_kelamin` char(1) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `ID` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_fakultas`
--

CREATE TABLE `tb_fakultas` (
  `Kode_fak` char(8) NOT NULL,
  `Nama_fak` varchar(30) NOT NULL,
  `Jenis_fak` varchar(30) NOT NULL,
  `Alamat` varchar(40) NOT NULL,
  `Kode_materi` char(8) NOT NULL,
  `Id_siswa` char(8) NOT NULL,
  `Id_tanya` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_feedback`
--

CREATE TABLE `tb_feedback` (
  `ID` char(8) NOT NULL,
  `Text_feedback` varchar(300) NOT NULL,
  `Tgl_feedback` date NOT NULL,
  `Id_siswa` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_materi`
--

CREATE TABLE `tb_materi` (
  `Kode_materi` char(8) NOT NULL,
  `Nama_materi` varchar(30) NOT NULL,
  `Biaya` int(10) NOT NULL,
  `Durasi` time NOT NULL,
  `Prasyarat` varchar(60) NOT NULL,
  `Id_siswa` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pertanyaan`
--

CREATE TABLE `tb_pertanyaan` (
  `Id_tanya` char(8) NOT NULL,
  `Text_tanya` varchar(100) NOT NULL,
  `Tgl_tanya` date NOT NULL,
  `Text_respon` varchar(500) NOT NULL,
  `Tgl_respon` date NOT NULL,
  `Id_siswa` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pusat_studi`
--

CREATE TABLE `tb_pusat_studi` (
  `Kode_studi` char(8) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Jenis` varchar(20) NOT NULL,
  `Lokasi` varchar(40) NOT NULL,
  `Id_siswa` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `Id_siswa` char(8) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Jenis_kelamin` char(1) NOT NULL,
  `Tgl_lahir` date NOT NULL,
  `Alamat` varchar(40) NOT NULL,
  `Email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`Id_admin`),
  ADD KEY `melihat/dilihat` (`ID`);

--
-- Indexes for table `tb_fakultas`
--
ALTER TABLE `tb_fakultas`
  ADD PRIMARY KEY (`Kode_fak`),
  ADD KEY `mengajari/diajari` (`Kode_materi`),
  ADD KEY `menyuruh/mengirimkan` (`Id_siswa`),
  ADD KEY `menyelesaikan` (`Id_tanya`);

--
-- Indexes for table `tb_feedback`
--
ALTER TABLE `tb_feedback`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `memberikan` (`Id_siswa`);

--
-- Indexes for table `tb_materi`
--
ALTER TABLE `tb_materi`
  ADD PRIMARY KEY (`Kode_materi`),
  ADD KEY `mengikuti` (`Id_siswa`);

--
-- Indexes for table `tb_pertanyaan`
--
ALTER TABLE `tb_pertanyaan`
  ADD PRIMARY KEY (`Id_tanya`),
  ADD KEY `memposting` (`Id_siswa`);

--
-- Indexes for table `tb_pusat_studi`
--
ALTER TABLE `tb_pusat_studi`
  ADD PRIMARY KEY (`Kode_studi`),
  ADD KEY `menyuruh` (`Id_siswa`);

--
-- Indexes for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`Id_siswa`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD CONSTRAINT `tb_admin_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `tb_feedback` (`ID`);

--
-- Constraints for table `tb_fakultas`
--
ALTER TABLE `tb_fakultas`
  ADD CONSTRAINT `tb_fakultas_ibfk_1` FOREIGN KEY (`Kode_materi`) REFERENCES `tb_materi` (`Kode_materi`),
  ADD CONSTRAINT `tb_fakultas_ibfk_2` FOREIGN KEY (`Id_siswa`) REFERENCES `tb_siswa` (`Id_siswa`),
  ADD CONSTRAINT `tb_fakultas_ibfk_3` FOREIGN KEY (`Id_tanya`) REFERENCES `tb_pertanyaan` (`Id_tanya`);

--
-- Constraints for table `tb_feedback`
--
ALTER TABLE `tb_feedback`
  ADD CONSTRAINT `tb_feedback_ibfk_1` FOREIGN KEY (`Id_siswa`) REFERENCES `tb_siswa` (`Id_siswa`);

--
-- Constraints for table `tb_materi`
--
ALTER TABLE `tb_materi`
  ADD CONSTRAINT `tb_materi_ibfk_1` FOREIGN KEY (`Id_siswa`) REFERENCES `tb_siswa` (`Id_siswa`);

--
-- Constraints for table `tb_pertanyaan`
--
ALTER TABLE `tb_pertanyaan`
  ADD CONSTRAINT `tb_pertanyaan_ibfk_1` FOREIGN KEY (`Id_siswa`) REFERENCES `tb_siswa` (`Id_siswa`);

--
-- Constraints for table `tb_pusat_studi`
--
ALTER TABLE `tb_pusat_studi`
  ADD CONSTRAINT `tb_pusat_studi_ibfk_1` FOREIGN KEY (`Id_siswa`) REFERENCES `tb_siswa` (`Id_siswa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
