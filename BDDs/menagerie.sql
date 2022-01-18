-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 02 jan. 2022 à 20:24
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
-- Base de données : `menagerie`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `affiche_proprietaire_animaux` ()  BEGIN
DECLARE owner VARCHAR (20) DEFAULT '';
DECLARE fin TINYINT DEFAULT 0;          DECLARE curs_owners CURSOR FOR SELECT DISTINCT proprietaire FROM animaux;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = 1;
OPEN curs_owners;  		loop_curs: LOOP 			FETCH curs_owners INTO owner; 			 			IF fin = 1 THEN 				LEAVE loop_curs; 			END IF; 			 			SELECT owner; 			SELECT nom FROM animaux WHERE proprietaire = owner; 		END LOOP;  		CLOSE curs_owners;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_nb_animaux_by_type` (IN `type_animal` VARCHAR(20), INOUT `nb_animaux` INT)  BEGIN
SELECT (nb_animaux + COUNT(*)) FROM animaux WHERE espece = type_animal INTO nb_animaux;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `animaux`
--

CREATE TABLE `animaux` (
  `nom` varchar(20) NOT NULL,
  `proprietaire` varchar(20) DEFAULT NULL,
  `espece` varchar(20) DEFAULT NULL,
  `genre` char(1) DEFAULT NULL,
  `naissance` date DEFAULT NULL,
  `mort` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `animaux`
--

INSERT INTO `animaux` (`nom`, `proprietaire`, `espece`, `genre`, `naissance`, `mort`) VALUES
('Archibald', 'Ralph', 'poisson', 'f', '2021-07-01', NULL),
('BOBY', 'Ralph', 'oiseau', 'f', '2021-07-01', NULL),
('Bowser', 'Diane', 'hamster', 'f', '1995-07-29', '1998-08-31'),
('Buffy', 'Harold', 'chien', 'f', '1989-05-13', NULL),
('Chirpy', 'Gwen', 'oiseau', 'f', '1998-09-11', NULL),
('Claws', 'Gwen', 'chat', 'm', '1994-03-17', NULL),
('Fang', 'Benny', 'chien', 'm', '1990-08-27', NULL),
('Fluffy', 'Harold', 'chat', 'f', '1993-02-04', NULL),
('Puffball', 'Diane', 'hamster', 'f', '1999-03-30', NULL),
('Rory', 'Arnold', NULL, 'f', NULL, '1998-03-04'),
('Slim', 'Benny', 'serpent', 'm', '1996-04-29', NULL),
('Whistler', 'Gwen', 'oiseau', 'f', '1990-02-04', '1997-12-09');

--
-- Déclencheurs `animaux`
--
DELIMITER $$
CREATE TRIGGER `genre_to_fm` BEFORE INSERT ON `animaux` FOR EACH ROW BEGIN
IF NEW.genre IS NOT NULL     AND NEW.genre != 'M'     AND NEW.genre != 'F'       THEN
SET NEW.genre = NULL;
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `name_to_upper_case` BEFORE INSERT ON `animaux` FOR EACH ROW BEGIN SET NEW.nom = UPPER(NEW.nom);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

CREATE TABLE `event` (
  `nom` varchar(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `event`
--

INSERT INTO `event` (`nom`, `date`, `type`, `remark`) VALUES
('Fluffy', '1995-02-04', 'naissance', '4 chatons, 2 femelles, 2 males'),
('Buffy', '1991-05-17', 'naissance', '5 chiots, 2 femelles, 3 males\r'),
('Buffy', '1992-07-13', 'naissance', '3 chiots, 3 femelles'),
('Archibald', '1998-03-04', 'acte medical', 'anesthesie locale'),
('toto', '1995-09-09', 'mort', 'Snif');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_accueil`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `v_accueil` (
`nom` varchar(20)
,`proprietaire` varchar(20)
,`mort` date
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_accueil_event`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `v_accueil_event` (
`event_nom` varchar(20)
,`date` date
,`type` varchar(50)
,`remark` varchar(500)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_secretaire`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `v_secretaire` (
`nom` varchar(20)
,`proprietaire` varchar(20)
,`mort` date
,`event_nom` varchar(20)
,`date` date
,`type` varchar(50)
,`remark` varchar(500)
);

-- --------------------------------------------------------

--
-- Structure de la vue `v_accueil`
--
DROP TABLE IF EXISTS `v_accueil`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_accueil`  AS SELECT `animaux`.`nom` AS `nom`, `animaux`.`proprietaire` AS `proprietaire`, `animaux`.`mort` AS `mort` FROM `animaux` ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_accueil_event`
--
DROP TABLE IF EXISTS `v_accueil_event`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_accueil_event`  AS SELECT `event`.`nom` AS `event_nom`, `event`.`date` AS `date`, `event`.`type` AS `type`, `event`.`remark` AS `remark` FROM `event` ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_secretaire`
--
DROP TABLE IF EXISTS `v_secretaire`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_secretaire`  AS SELECT `animaux`.`nom` AS `nom`, `animaux`.`proprietaire` AS `proprietaire`, `animaux`.`mort` AS `mort`, `event`.`nom` AS `event_nom`, `event`.`date` AS `date`, `event`.`type` AS `type`, `event`.`remark` AS `remark` FROM (`animaux` join `event` on((`animaux`.`nom` = `event`.`nom`))) ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `animaux`
--
ALTER TABLE `animaux`
  ADD PRIMARY KEY (`nom`);

--
-- Index pour la table `event`
--
ALTER TABLE `event`
  ADD KEY `nom` (`nom`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
