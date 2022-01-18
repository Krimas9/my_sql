-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 04 jan. 2022 à 20:56
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
-- Base de données : `population`
--

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `code_pays` varchar(5) NOT NULL,
  `nom_pays` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`code_pays`, `nom_pays`) VALUES
('ES', 'ESPAGNE'),
('FR', 'FRANCE'),
('DE', 'ALLEMAGNE');

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `code_ville` varchar(5) NOT NULL,
  `code_pays` varchar(5) NOT NULL,
  `nom_ville` varchar(30) NOT NULL,
  `population` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`code_ville`, `code_pays`, `nom_ville`, `population`) VALUES
('BAR', 'ES', 'BARCELONE', 28),
('MAD', 'ES', 'MADRID', 35),
('ZAR', 'ES', 'SRAGOSSE', 12),
('PAR', 'FR', 'Paris', 42),
('LYO', 'FR', 'Lyon', 2),
('LLL', 'FR', 'Lille', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
