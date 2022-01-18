-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 02 jan. 2022 à 20:23
-- Version du serveur :  5.7.24
-- Version de PHP : 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `test_division`
--

-- --------------------------------------------------------

--
-- Structure de la table `table1`
--

CREATE TABLE `table1` (
  `x` int(1) NOT NULL,
  `y` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `table1`
--

INSERT INTO `table1` (`x`, `y`) VALUES
(1, 'A'),
(2, 'A'),
(3, 'A'),
(1, 'B'),
(2, 'B'),
(3, 'C'),
(3, 'D');

-- --------------------------------------------------------

--
-- Structure de la table `table2`
--

CREATE TABLE `table2` (
  `x` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `table2`
--

INSERT INTO `table2` (`x`) VALUES
(1),
(2),
(3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
