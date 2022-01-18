-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 04 jan. 2022 à 20:05
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
-- Base de données : `agence_voyage`
--

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

CREATE TABLE `customer` (
  `no_customer` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `customer`
--

INSERT INTO `customer` (`no_customer`, `first_name`, `last_name`) VALUES
(1, 'Jean', 'Dupond'),
(2, 'Henry', 'Vernier'),
(3, 'Jacques', 'Fournier'),
(4, 'Joséphine', 'Thierry');

-- --------------------------------------------------------

--
-- Structure de la table `destination`
--

CREATE TABLE `destination` (
  `no_destination` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `destination`
--

INSERT INTO `destination` (`no_destination`, `name`) VALUES
(1, 'Paris'),
(2, 'Londres'),
(3, 'Berlin'),
(4, 'Madrid'),
(5, 'Athènes');

-- --------------------------------------------------------

--
-- Structure de la table `step`
--

CREATE TABLE `step` (
  `no_destination` int(11) NOT NULL,
  `no_order` int(11) NOT NULL,
  `name` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `step`
--

INSERT INTO `step` (`no_destination`, `no_order`, `name`) VALUES
(1, 1, 'Bruxelles'),
(1, 2, 'Paris'),
(2, 1, 'Berlin'),
(2, 2, 'Bruxelles'),
(2, 3, 'Londres'),
(3, 1, 'Berlin'),
(4, 1, 'Paris'),
(4, 2, 'Lisbone'),
(4, 3, 'Madrid'),
(5, 1, 'Rome'),
(5, 2, 'Athènes');

-- --------------------------------------------------------

--
-- Structure de la table `travel`
--

CREATE TABLE `travel` (
  `no_customer` int(11) NOT NULL,
  `no_destination` int(11) NOT NULL,
  `travel_date` date NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `travel`
--

INSERT INTO `travel` (`no_customer`, `no_destination`, `travel_date`, `price`) VALUES
(1, 1, '2020-11-02', 200),
(1, 2, '2021-10-10', 541),
(2, 1, '2021-10-25', 350),
(2, 3, '2021-12-12', 286),
(2, 4, '2021-09-05', 175),
(3, 1, '2021-12-06', 185),
(3, 4, '2021-12-15', 300),
(4, 1, '2021-11-23', 98),
(4, 2, '2021-11-19', 234),
(4, 3, '2021-12-08', 190);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`no_customer`);

--
-- Index pour la table `destination`
--
ALTER TABLE `destination`
  ADD PRIMARY KEY (`no_destination`);

--
-- Index pour la table `step`
--
ALTER TABLE `step`
  ADD PRIMARY KEY (`no_destination`,`no_order`),
  ADD KEY `no_destination` (`no_destination`);

--
-- Index pour la table `travel`
--
ALTER TABLE `travel`
  ADD PRIMARY KEY (`no_customer`,`no_destination`,`travel_date`),
  ADD KEY `no_customer` (`no_customer`),
  ADD KEY `no_destination` (`no_destination`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `customer`
--
ALTER TABLE `customer`
  MODIFY `no_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `destination`
--
ALTER TABLE `destination`
  MODIFY `no_destination` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `step`
--
ALTER TABLE `step`
  ADD CONSTRAINT `step_ibfk_1` FOREIGN KEY (`no_destination`) REFERENCES `destination` (`no_destination`);

--
-- Contraintes pour la table `travel`
--
ALTER TABLE `travel`
  ADD CONSTRAINT `travel_ibfk_1` FOREIGN KEY (`no_destination`) REFERENCES `destination` (`no_destination`),
  ADD CONSTRAINT `travel_ibfk_2` FOREIGN KEY (`no_customer`) REFERENCES `customer` (`no_customer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
