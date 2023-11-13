-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2023 at 07:52 PM
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
-- Database: `claudia_cabeleireiros`
--
CREATE DATABASE IF NOT EXISTS `claudia_cabeleireiros` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `claudia_cabeleireiros`;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome_menu` varchar(45) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `nome_menu`, `link`) VALUES
(1, 'INÍCIO', 'index.jsp'),
(2, 'USUÁRIO', 'listarUsuario.jsp'),
(3, 'PERFIL', 'listarPerfil.jsp'),
(4, 'MENU', 'listarMenu.jsp'),
(5, 'SERVIÇO', 'listarServico.jsp'),
(6, 'CLIENTE', 'listarCliente.jsp');

-- --------------------------------------------------------

--
-- Table structure for table `perfil`
--

CREATE TABLE `perfil` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome_perfil` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `perfil`
--

INSERT INTO `perfil` (`id`, `nome_perfil`) VALUES
(1, 'Administrador'),
(2, 'Gerente'),
(3, 'Profissional'),
(4, 'Cliente');

-- --------------------------------------------------------

--
-- Table structure for table `perfil_menu`
--

CREATE TABLE `perfil_menu` (
  `idMenu` int(10) UNSIGNED NOT NULL,
  `idPerfil` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `perfil_menu`
--

INSERT INTO `perfil_menu` (`idMenu`, `idPerfil`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(3, 1),
(4, 1),
(5, 1),
(5, 2),
(6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `servico`
--

CREATE TABLE `servico` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome_servico` varchar(45) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `duracao` varchar(45) DEFAULT NULL,
  `valor` decimal(7,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `servico`
--

INSERT INTO `servico` (`id`, `nome_servico`, `descricao`, `duracao`, `valor`) VALUES
(1, 'Corte Curto', 'Corte de cabelo para cabelo curto.', '00:45h', 30.00),
(2, 'Corte Médio', 'Corte de cabelo para cabelo médio.', '01:00h', 35.00),
(3, 'Corte Longo', 'Corte de cabelo para cabelo longo.', '01:15h', 45.00),
(4, 'Pintura', 'Pintura de cabelo.', '02:00h', 120.00),
(9, 'Hidratacao', 'Hidratacao de cabelo.', '01:50h', 290.00);

-- --------------------------------------------------------

--
-- Table structure for table `servico_cliente`
--

CREATE TABLE `servico_cliente` (
  `idServico` int(10) UNSIGNED NOT NULL,
  `idUsuario` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `servico_cliente`
--

INSERT INTO `servico_cliente` (`idServico`, `idUsuario`) VALUES
(1, 9),
(2, 9),
(9, 5);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id` int(10) UNSIGNED NOT NULL,
  `idPerfil` int(10) UNSIGNED NOT NULL,
  `nome_usuario` varchar(255) DEFAULT NULL,
  `telefone` varchar(13) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `idPerfil`, `nome_usuario`, `telefone`, `login`, `senha`) VALUES
(1, 1, 'Administrador', '', 'admin', '123'),
(2, 2, 'Ana Paula', '61 99112-1537', 'ana', '123'),
(3, 3, 'Bia Motta', '61 98217-0014', 'bia', '123'),
(4, 3, 'Luiz Diaz', '61 9950-3864', 'luiz', '123'),
(5, 4, 'Lara Sousa', '61 3591-9422', 'lara', '123'),
(6, 4, 'Rui Costa', '61 3387-1831', 'rui', '123'),
(9, 4, 'Ariel Gomes', '61 3387-1282', 'ariel', '123');

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
  ADD PRIMARY KEY (`idMenu`,`idPerfil`),
  ADD KEY `perfil_has_menu_FKIndex1` (`idPerfil`),
  ADD KEY `perfil_has_menu_FKIndex2` (`idMenu`);

--
-- Indexes for table `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servico_cliente`
--
ALTER TABLE `servico_cliente`
  ADD PRIMARY KEY (`idServico`,`idUsuario`),
  ADD KEY `perfil_has_menu_FKIndex1` (`idUsuario`),
  ADD KEY `perfil_has_menu_FKIndex2` (`idServico`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `servico`
--
ALTER TABLE `servico`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
