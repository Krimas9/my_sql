-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 05 jan. 2022 à 17:09
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
-- Base de données : `cinema`
--

-- --------------------------------------------------------

--
-- Structure de la table `acteur`
--

CREATE TABLE `acteur` (
  `titre` varchar(200) NOT NULL,
  `acteur` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `acteur`
--

INSERT INTO `acteur` (`titre`, `acteur`) VALUES
('Le vent de la nuit', 'Catherine Devneuve'),
('Les aventures de Rabbi Jacob', 'Louis De Funes'),
('Les valseuses', 'Gérard Depardieu'),
('L\'argent des autres', 'Catherine Deneuve'),
('Le dernier metro', 'Gérard Depardieu'),
('L\'as des as', 'Jean Paul Belmondo'),
('Le dernier metro', 'Catherine Deneuve'),
('Belle de jour', 'Catherine Deneuve'),
('Le professionnel', 'Jean Paul Belmondo'),
('La femme d\'a côte', 'Gérard Depardieu'),
('La femme d\'a côte', 'Catherine Deneuve'),
('Les voleurs', 'Daniel Auteuil'),
('Les voleurs', 'Catherine Deneuve'),
('La chèvre', 'Gérard Depardieu'),
('La chèvre', 'Pierre Richard');

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `titre` varchar(200) NOT NULL,
  `pays` varchar(200) NOT NULL,
  `annee` int(11) NOT NULL,
  `realisateur` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`titre`, `pays`, `annee`, `realisateur`) VALUES
('Le vent de la nuit', 'France', 1999, 'Philippe Garrel'),
('Les aventures de Rabbi Jacob', 'France', 1973, 'Gérard Oury'),
('Les valseuses', 'France', 1974, 'Bertrand Blier'),
('L\'argent des autres', 'France', 1978, 'Christian de Chalonge'),
('Le dernier Métro', 'France', 1990, 'François Truffaut'),
('L\'as des As', 'France', 1982, 'Gérard Oury'),
('Belle de Jour', 'France', 1967, 'Luis Buñuel'),
('Le professionnel', 'France', 1981, 'Georges Lautner'),
('La femme d\'a côté', 'France', 19681, 'François Truffaut'),
('La chevre', 'France', 1981, 'Francis Veber'),
('Les voleurs', 'France', 1996, 'André Téchiné');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
