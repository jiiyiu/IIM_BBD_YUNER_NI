-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 22 sep. 2019 à 20:39
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `dev_expert`
--

-- --------------------------------------------------------

--
-- Structure de la table `autentification`
--

DROP TABLE IF EXISTS `autentification`;
CREATE TABLE IF NOT EXISTS `autentification` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Acces_internet` varchar(50) NOT NULL,
  `Acces_lan` varchar(50) NOT NULL,
  `Login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `ID_personnel` int(11) NOT NULL COMMENT 'id table personnel',
  `Token` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_client` varchar(50) NOT NULL,
  `Prenom_client` varchar(50) NOT NULL,
  `Tel` varchar(20) NOT NULL,
  `Mail` varchar(50) NOT NULL,
  `Secteur_activite` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

DROP TABLE IF EXISTS `departement`;
CREATE TABLE IF NOT EXISTS `departement` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_departement` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `langue`
--

DROP TABLE IF EXISTS `langue`;
CREATE TABLE IF NOT EXISTS `langue` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_langue` varchar(50) NOT NULL,
  `Code_langue` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `mission`
--

DROP TABLE IF EXISTS `mission`;
CREATE TABLE IF NOT EXISTS `mission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Ref_client` int(11) NOT NULL COMMENT 'Id table client',
  `Date_demande` datetime NOT NULL,
  `Date_debut` datetime NOT NULL,
  `Type_mission` varchar(100) NOT NULL,
  `Collaborateur` varchar(50) NOT NULL,
  `Nom_departement` varchar(50) NOT NULL,
  `Budget_estime` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `mission_info`
--

DROP TABLE IF EXISTS `mission_info`;
CREATE TABLE IF NOT EXISTS `mission_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_personnel` int(11) NOT NULL,
  `Nom_personnel` varchar(50) NOT NULL,
  `Date_debut_collab` datetime NOT NULL,
  `Date_fin_collab` datetime NOT NULL,
  `Nb_heure` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
CREATE TABLE IF NOT EXISTS `personnel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Nom_qualification` varchar(50) NOT NULL,
  `Nom_departement` varchar(50) NOT NULL,
  `Prix` smallint(10) NOT NULL COMMENT 'prix de travail',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `personnel`
--

INSERT INTO `personnel` (`ID`, `Nom`, `Prenom`, `Nom_qualification`, `Nom_departement`, `Prix`) VALUES
(1, 'albert', 'alcain', 'expert web', 'web', 0),
(2, 'allain', 'ribert', 'expert web', 'web', 0),
(3, 'cherif', 'verier', 'expert web', 'web', 0),
(4, 'chantille', 'cain', 'expert web', 'web', 0),
(5, 'miriam', 'mcdowel', 'expert web', 'web', 0),
(6, 'julie', 'duchant', 'expert web', 'web', 0),
(7, 'marie', 'ravie', 'expert web', 'web', 0),
(8, 'louis', 'riand', 'expert web', 'web', 100),
(9, 'cristel', 'conser', 'expert web', 'web', 100),
(10, 'bob', 'lenone', 'expert web', 'web', 100);

-- --------------------------------------------------------

--
-- Structure de la table `qualification`
--

DROP TABLE IF EXISTS `qualification`;
CREATE TABLE IF NOT EXISTS `qualification` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_qualification` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rapport`
--

DROP TABLE IF EXISTS `rapport`;
CREATE TABLE IF NOT EXISTS `rapport` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_mission` int(11) NOT NULL,
  `Nom_client` varchar(50) NOT NULL,
  `ID_personnel` int(11) NOT NULL COMMENT 'id table personnel',
  `Nom_personnel` varchar(50) NOT NULL,
  `ID_departement` int(11) NOT NULL COMMENT 'id table departement',
  `Nom_departement` varchar(50) NOT NULL,
  `nb_heure` int(11) NOT NULL,
  `Annee_mois` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
