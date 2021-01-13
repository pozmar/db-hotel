-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 13, 2021 at 04:51 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `camere`
--

CREATE TABLE `camere` (
  `id_camera` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_prenotazione` int(11) DEFAULT NULL,
  `cam_posti` tinyint(4) NOT NULL,
  `cam_costo` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clienti`
--

CREATE TABLE `clienti` (
  `id_cliente` int(11) NOT NULL,
  `id_prenotazione` int(11) NOT NULL,
  `cl_nome` varchar(50) NOT NULL,
  `cl_cognome` varchar(50) NOT NULL,
  `cl_indirizzo` varchar(50) NOT NULL,
  `cl_numero` tinyint(4) NOT NULL,
  `cl_pagamento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prenotazioni`
--

CREATE TABLE `prenotazioni` (
  `id_prenotazione` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_camera` int(11) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `camere`
--
ALTER TABLE `camere`
  ADD PRIMARY KEY (`id_camera`),
  ADD UNIQUE KEY `id_cliente` (`id_cliente`),
  ADD UNIQUE KEY `id_camera` (`id_camera`) USING BTREE,
  ADD UNIQUE KEY `id_prenotazione` (`id_prenotazione`),
  ADD KEY `id_cliente_2` (`id_cliente`,`id_prenotazione`),
  ADD KEY `id_prenotazione_2` (`id_prenotazione`);

--
-- Indexes for table `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `id_cliente` (`id_cliente`,`id_prenotazione`),
  ADD KEY `id_prenotazioni` (`id_prenotazione`);

--
-- Indexes for table `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD PRIMARY KEY (`id_prenotazione`),
  ADD UNIQUE KEY `id_prenotazione` (`id_prenotazione`,`id_cliente`,`id_camera`),
  ADD KEY `prenotazioni_b` (`id_camera`),
  ADD KEY `prenotazioni_a` (`id_cliente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `camere`
--
ALTER TABLE `camere`
  MODIFY `id_camera` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clienti`
--
ALTER TABLE `clienti`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prenotazioni`
--
ALTER TABLE `prenotazioni`
  MODIFY `id_prenotazione` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `camere`
--
ALTER TABLE `camere`
  ADD CONSTRAINT `prenotazioni_c` FOREIGN KEY (`id_cliente`) REFERENCES `clienti` (`id_cliente`);

--
-- Constraints for table `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD CONSTRAINT `prenotazioni_a` FOREIGN KEY (`id_cliente`) REFERENCES `clienti` (`id_cliente`),
  ADD CONSTRAINT `prenotazioni_b` FOREIGN KEY (`id_camera`) REFERENCES `camere` (`id_camera`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
