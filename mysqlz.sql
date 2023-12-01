-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: mysqlz
-- Creato il: Nov 09, 2022 alle 21:25
-- Versione del server: 5.5.62
-- Versione PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `miodb`
--
CREATE DATABASE IF NOT EXISTS `miodb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `miodb`;

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `conteggioMateriale`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `conteggioMateriale` (
`Materiale` int(11)
,`Num` bigint(21)
);

-- --------------------------------------------------------

--
-- Struttura della tabella `Giornate`
--

CREATE TABLE `Giornate` (
  `data` date NOT NULL,
  `ID` int(11) NOT NULL,
  `Puntualita` int(11) NOT NULL,
  `Controllore` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `Giornate`
--

INSERT INTO `Giornate` (`data`, `ID`, `Puntualita`, `Controllore`) VALUES
('2021-09-27', 30, 1, 0),
('2021-09-28', 31, 1, 1),
('2021-09-29', 32, 2, 0),
('2021-09-30', 33, 1, 1),
('2021-10-01', 34, 1, 1),
('2021-10-04', 35, 1, 0),
('2021-10-08', 36, 1, 1),
('2021-10-11', 37, 1, 1),
('2021-10-12', 38, 1, 0),
('2021-10-13', 39, 2, 0),
('2021-10-18', 40, 1, 1),
('2021-10-19', 41, 3, 0),
('2021-10-20', 42, 3, 0),
('2021-10-25', 43, 1, 0),
('2021-10-26', 44, 2, 0),
('2021-10-27', 45, 3, 1),
('2021-10-28', 46, 2, 1),
('2021-11-02', 47, 1, 0),
('2021-11-09', 48, 1, 0),
('2021-11-08', 49, 2, 1),
('2021-11-15', 50, 2, 0),
('2021-11-15', 51, 2, 0),
('2021-11-17', 52, 2, 0),
('2021-11-24', 53, 3, 0),
('2021-11-23', 54, 2, 0),
('2021-11-29', 55, 1, 0),
('2021-11-30', 56, 2, 1),
('2022-01-31', 57, 3, 0),
('2022-02-15', 58, 2, 1),
('2022-04-21', 59, 3, 1),
('2022-04-22', 60, 2, 0),
('2022-04-26', 61, 1, 0),
('2022-05-02', 62, 2, 0),
('2022-05-09', 63, 1, 1),
('2022-05-23', 64, 3, 0),
('2022-05-30', 65, 1, 1),
('2022-06-13', 66, 1, 0),
('2022-06-21', 67, 1, 0),
('2022-06-20', 68, 1, 0),
('2022-06-22', 69, 2, 0),
('2022-06-28', 70, 3, 0),
('2022-07-07', 71, 2, 0),
('2022-08-19', 72, 1, 0),
('2022-10-03', 73, 3, 0),
('2022-10-04', 74, 2, 0),
('2022-10-05', 75, 3, 0),
('2022-10-06', 76, 2, 0),
('2022-10-09', 77, 1, 0),
('2022-10-12', 78, 1, 1),
('2022-10-13', 79, 1, 0),
('2022-10-18', 80, 1, 0),
('2022-10-17', 81, 3, 0),
('2022-10-20', 82, 1, 1),
('2022-10-21', 83, 2, 0),
('2022-10-24', 84, 2, 0),
('2022-10-25', 85, 1, 1),
('2022-10-26', 86, 2, 1),
('2022-11-02', 87, 1, 1),
('2022-11-03', 88, 2, 0),
('2022-11-04', 89, 2, 1),
('2022-11-07', 93, 2, 0),
('2022-11-08', 94, 1, 0),
('2022-11-09', 95, 3, 0),
('2022-11-10', 96, 1, 1),
('2022-11-11', 97, 1, 1),
('2022-11-12', 98, 1, 1),
('2022-11-26', 99, 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `MaterialeRotabile`
--

CREATE TABLE `MaterialeRotabile` (
  `Materiale` varchar(20) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `MaterialeRotabile`
--

INSERT INTO `MaterialeRotabile` (`Materiale`, `ID`) VALUES
('Vivalto', 1),
('PR', 2),
('MD', 3),
('Caravaggio', 4),
('Casaralta', 5),
('TAF', 6),
('Donizzetti', 7);

-- --------------------------------------------------------

--
-- Struttura della tabella `TreniToGiornate`
--

CREATE TABLE `TreniToGiornate` (
  `Materiale` int(11) NOT NULL,
  `Giornata` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `TreniToGiornate`
--

INSERT INTO `TreniToGiornate` (`Materiale`, `Giornata`) VALUES
(2, 30),
(3, 30),
(1, 31),
(2, 31),
(1, 32),
(2, 32),
(1, 33),
(2, 33),
(3, 33),
(1, 34),
(3, 34),
(1, 35),
(2, 35),
(1, 36),
(2, 36),
(3, 36),
(3, 37),
(4, 37),
(1, 38),
(2, 38),
(3, 38),
(1, 39),
(2, 39),
(3, 39),
(2, 40),
(4, 40),
(1, 41),
(2, 41),
(3, 41),
(1, 42),
(2, 42),
(3, 42),
(1, 43),
(2, 43),
(1, 44),
(2, 44),
(3, 44),
(1, 45),
(2, 45),
(3, 45),
(1, 46),
(3, 46),
(2, 47),
(3, 47),
(1, 48),
(2, 48),
(1, 49),
(3, 49),
(1, 51),
(2, 51),
(5, 51),
(1, 52),
(2, 52),
(3, 52),
(1, 53),
(2, 53),
(3, 53),
(1, 54),
(2, 54),
(3, 54),
(1, 55),
(2, 55),
(1, 56),
(2, 56),
(2, 57),
(3, 57),
(4, 57),
(1, 58),
(2, 58),
(5, 59),
(6, 59),
(3, 60),
(4, 60),
(1, 61),
(3, 61),
(6, 61),
(4, 62),
(5, 62),
(6, 62),
(3, 63),
(4, 63),
(6, 63),
(3, 64),
(4, 64),
(3, 65),
(4, 65),
(6, 65),
(3, 66),
(4, 66),
(3, 67),
(4, 67),
(6, 67),
(3, 68),
(3, 68),
(3, 69),
(5, 69),
(6, 69),
(2, 70),
(4, 70),
(1, 71),
(3, 71),
(4, 71),
(1, 72),
(1, 73),
(2, 73),
(4, 73),
(1, 74),
(2, 74),
(3, 74),
(1, 75),
(2, 75),
(2, 76),
(3, 76),
(1, 77),
(2, 77),
(1, 78),
(2, 78),
(3, 78),
(1, 79),
(3, 79),
(1, 80),
(3, 80),
(4, 80),
(3, 81),
(5, 81),
(1, 82),
(2, 82),
(3, 82),
(1, 83),
(2, 83),
(5, 83),
(1, 84),
(2, 84),
(6, 84),
(1, 85),
(3, 85),
(4, 85),
(2, 86),
(3, 86),
(1, 87),
(2, 87),
(3, 87),
(1, 88),
(2, 88),
(3, 88),
(1, 89),
(2, 89),
(6, 89),
(2, 93),
(4, 93),
(5, 93),
(1, 94),
(3, 94),
(1, 95),
(2, 95),
(7, 95);

-- --------------------------------------------------------

--
-- Struttura per vista `conteggioMateriale`
--
DROP TABLE IF EXISTS `conteggioMateriale`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `conteggioMateriale`  AS  select `TreniToGiornate`.`Materiale` AS `Materiale`,count(0) AS `Num` from `TreniToGiornate` group by `TreniToGiornate`.`Materiale` ;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Giornate`
--
ALTER TABLE `Giornate`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `MaterialeRotabile`
--
ALTER TABLE `MaterialeRotabile`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Giornate`
--
ALTER TABLE `Giornate`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT per la tabella `MaterialeRotabile`
--
ALTER TABLE `MaterialeRotabile`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
