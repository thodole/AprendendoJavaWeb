-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2023 at 01:25 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `javaweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu` varchar(45) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `menu`, `link`) VALUES
(2, 'Inicio', 'index.jsp'),
(3, 'Usuario', 'listar_usuario.jsp'),
(5, 'Perfil', 'listar_perfil.jsp'),
(6, 'Menu', 'listar_menu.jsp'),
(7, 'menuTeste', 'listar_menu.jsp'),
(8, 'MaisUm', 'youtube.com');

-- --------------------------------------------------------

--
-- Table structure for table `perfil`
--

CREATE TABLE `perfil` (
  `id` int(10) UNSIGNED NOT NULL,
  `perfil` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `perfil`
--

INSERT INTO `perfil` (`id`, `perfil`) VALUES
(1, 'Administrador'),
(2, 'Gerente'),
(9, 'Informate');

-- --------------------------------------------------------

--
-- Table structure for table `perfil_menu`
--

CREATE TABLE `perfil_menu` (
  `id_menu` int(10) UNSIGNED NOT NULL,
  `id_perfil` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `perfil_menu`
--

INSERT INTO `perfil_menu` (`id_menu`, `id_perfil`) VALUES
(2, 1),
(2, 2),
(2, 9),
(3, 1),
(4, 1),
(4, 2),
(4, 9),
(5, 1),
(6, 1),
(12, 1),
(12, 9);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_perfil` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `id_perfil`, `nome`, `login`, `senha`) VALUES
(1, 1, 'Wendell', 'Wendell', '123'),
(6, 2, 'Andre Barata', 'barata', '123'),
(4, 2, 'Marieta', 'severo', '123'),
(7, 2, 'Tabajara', 'tabajara', '123'),
(8, 9, 'Manuel', 'mano', '123'),
(10, 1, 'Glauder', 'Glauder', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perfil_menu`
--
ALTER TABLE `perfil_menu`
  ADD PRIMARY KEY (`id_menu`,`id_perfil`),
  ADD KEY `perfil_has_menu_FKIndex1` (`id_perfil`),
  ADD KEY `perfil_has_menu_FKIndex2` (`id_menu`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
