-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/11/2023 às 19:50
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `claudia_cabeleireiros`
--
CREATE DATABASE IF NOT EXISTS `claudia_cabeleireiros` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `claudia_cabeleireiros`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome_cliente` varchar(255) DEFAULT NULL,
  `telefone` varchar(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome_cliente`, `telefone`) VALUES
(1, 'Ana Sousa', '61 3387-1451'),
(3, 'Rui Costa', '61 99316-8441');

-- --------------------------------------------------------

--
-- Estrutura para tabela `menu`
--

CREATE TABLE `menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome_menu` varchar(45) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `menu`
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
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id` int(10) UNSIGNED NOT NULL,
  `idUsuario` int(10) UNSIGNED NOT NULL,
  `valorTotal` decimal(10,2) DEFAULT NULL,
  `valorPago` decimal(10,2) DEFAULT NULL,
  `valorAPagar` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfil`
--

CREATE TABLE `perfil` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome_perfil` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Despejando dados para a tabela `perfil`
--

INSERT INTO `perfil` (`id`, `nome_perfil`) VALUES
(1, 'Administrador'),
(2, 'Gerente'),
(3, 'Profissional');

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfil_menu`
--

CREATE TABLE `perfil_menu` (
  `idMenu` int(10) UNSIGNED NOT NULL,
  `idPerfil` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Despejando dados para a tabela `perfil_menu`
--

INSERT INTO `perfil_menu` (`idMenu`, `idPerfil`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(3, 1),
(4, 1),
(5, 1),
(5, 2),
(6, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `servico`
--

CREATE TABLE `servico` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome_servico` varchar(45) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `duracao` varchar(45) DEFAULT NULL,
  `valor` decimal(7,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `servico`
--

INSERT INTO `servico` (`id`, `nome_servico`, `descricao`, `duracao`, `valor`) VALUES
(1, 'Corte Curto', 'Corte de cabelo para cabelo curto.', '00:45h', 30.00),
(2, 'Corte Médio', 'Corte de cabelo para cabelo médio.', '01:00h', 35.00),
(3, 'Corte Longo', 'Corte de cabelo para cabelo longo.', '01:15h', 45.00),
(4, 'Pintura', 'Pintura de cabelo.', '02:00h', 120.00),
(9, 'Hidratacao', 'Hidratacao de cabelo.', '01:50h', 290.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `servico_cliente`
--

CREATE TABLE `servico_cliente` (
  `idServico` int(10) UNSIGNED NOT NULL,
  `idCliente` int(10) UNSIGNED NOT NULL,
  `quantidade` int(5) DEFAULT NULL,
  `valor_servico` decimal(7,2) DEFAULT NULL,
  `id` int(10) NOT NULL,
  `status` char(1) DEFAULT 'C'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Despejando dados para a tabela `servico_cliente`
--

INSERT INTO `servico_cliente` (`idServico`, `idCliente`, `quantidade`, `valor_servico`, `id`, `status`) VALUES
(1, 1, 1, 30.00, 5, 'C'),
(2, 1, 2, 70.00, 8, 'C'),
(9, 3, 1, 290.00, 6, 'C');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(10) UNSIGNED NOT NULL,
  `idPerfil` int(10) UNSIGNED NOT NULL,
  `nome_usuario` varchar(255) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id`, `idPerfil`, `nome_usuario`, `login`, `senha`) VALUES
(1, 1, 'Administrador', 'admin', '$2a$11$.EF6MoQhXh7m98sL4/N/6uD53ARIZmqzjeb8UN2BokTIfGAPZWAeW'),
(2, 2, 'Ana Paula', 'ana', '$2a$11$OQXC8w1tLYHJU3tBAVyx2eIIvXQp9qwBeuWcFnBpXZNklqwb0rOMi'),
(3, 3, 'Bia Motta', 'bia', '$2a$11$EIq5nzqGlnDuYoTA3s2uW.xh7QSK.7exhLV02T/mky2APgJrwkdzy'),
(4, 3, 'Luiz Diaz', 'luiz', '$2a$11$HeitQkVHVfDTIRu2oVCzru2znoIRM.WcWtaoAsxqqKj9IFGA1Gi3a');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perfil_has_usuario_FKIndex1` (`idUsuario`);

--
-- Índices de tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `perfil_menu`
--
ALTER TABLE `perfil_menu`
  ADD PRIMARY KEY (`idMenu`,`idPerfil`),
  ADD KEY `perfil_has_menu_FKIndex1` (`idPerfil`),
  ADD KEY `perfil_has_menu_FKIndex2` (`idMenu`);

--
-- Índices de tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `servico_cliente`
--
ALTER TABLE `servico_cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perfil_has_menu_FKIndex1` (`idCliente`),
  ADD KEY `perfil_has_menu_FKIndex2` (`idServico`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `servico_cliente`
--
ALTER TABLE `servico_cliente`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
