-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 28 août 2018 à 12:46
-- Version du serveur :  5.7.21
-- Version de PHP :  5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `greedycommunist`
--

-- --------------------------------------------------------

--
-- Structure de la table `classement`
--

DROP TABLE IF EXISTS `classement`;
CREATE TABLE IF NOT EXISTS `classement` (
  `idClassement` int(11) NOT NULL AUTO_INCREMENT,
  `idJoueur` int(11) NOT NULL,
  `nbPoints` int(11) NOT NULL,
  PRIMARY KEY (`idClassement`),
  KEY `classement_ibfk_1` (`idJoueur`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `classement`
--

INSERT INTO `classement` (`idClassement`, `idJoueur`, `nbPoints`) VALUES
(1, 1, 0),
(2, 2, 0);

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

DROP TABLE IF EXISTS `joueur`;
CREATE TABLE IF NOT EXISTS `joueur` (
  `idJoueur` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nbMatchsGagnes` int(11) NOT NULL,
  `nbMatchsJoues` int(11) NOT NULL,
  PRIMARY KEY (`idJoueur`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `joueur`
--

INSERT INTO `joueur` (`idJoueur`, `pseudo`, `password`, `nbMatchsGagnes`, `nbMatchsJoues`) VALUES
(1, 'skid', 'root', 0, 0),
(2, 'momo', 'root', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `matchjoue`
--

DROP TABLE IF EXISTS `matchjoue`;
CREATE TABLE IF NOT EXISTS `matchjoue` (
  `idMatch` int(11) NOT NULL AUTO_INCREMENT,
  `dateMatch` date NOT NULL,
  `idJoueur1` int(11) NOT NULL,
  `idJoueur2` int(11) NOT NULL,
  `idGagnant` int(11) NOT NULL,
  PRIMARY KEY (`idMatch`),
  KEY `idJoueur1` (`idJoueur1`),
  KEY `idJoueur2` (`idJoueur2`),
  KEY `idGagnant` (`idGagnant`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `matchjoue`
--

INSERT INTO `matchjoue` (`idMatch`, `dateMatch`, `idJoueur1`, `idJoueur2`, `idGagnant`) VALUES
(1, '2018-11-30', 1, 2, 2),
(2, '2018-12-01', 1, 2, 2);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `classement`
--
ALTER TABLE `classement`
  ADD CONSTRAINT `classement_ibfk_1` FOREIGN KEY (`idJoueur`) REFERENCES `joueur` (`idJoueur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `matchjoue`
--
ALTER TABLE `matchjoue`
  ADD CONSTRAINT `matchjoue_ibfk_1` FOREIGN KEY (`idJoueur1`) REFERENCES `joueur` (`idJoueur`),
  ADD CONSTRAINT `matchjoue_ibfk_2` FOREIGN KEY (`idJoueur2`) REFERENCES `joueur` (`idJoueur`),
  ADD CONSTRAINT `matchjoue_ibfk_3` FOREIGN KEY (`idGagnant`) REFERENCES `joueur` (`idJoueur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
