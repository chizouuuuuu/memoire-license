-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 02 Juin 2025 à 19:46
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `ophtalearning`
--

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE IF NOT EXISTS `cours` (
  `id_cours` int(11) NOT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `titre` varchar(100) DEFAULT NULL,
  `categorie` varchar(50) DEFAULT NULL,
  `date_creation` date DEFAULT NULL,
  `duree_cour` int(11) DEFAULT NULL,
  `heure` time DEFAULT NULL,
  `nombre_etudiants` int(11) DEFAULT NULL,
  ` description` int(10) NOT NULL,
  PRIMARY KEY (`id_cours`),
  KEY `id_utilisateur` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `cours`
--

INSERT INTO `cours` (`id_cours`, `id_utilisateur`, `titre`, `categorie`, `date_creation`, `duree_cour`, `heure`, `nombre_etudiants`, ` description`) VALUES
(1001, 1, 'Introduction à l’uvéite', 'Cours de base sur les différents types d’uvéites e', '0000-00-00', 2025, '00:00:02', 9, 50),
(1002, 2, 'Diagnostic étiologique des uvéites', 'Approche diagnostique des causes infectieuses et n', '0000-00-00', 2025, '00:00:03', 14, 40);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE IF NOT EXISTS `etudiant` (
  `id_etudiant` int(11) NOT NULL,
  `niveau_etude` varchar(50) DEFAULT NULL,
  `date_inscription` date DEFAULT NULL,
  `nom` varchar(10) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `daten` date NOT NULL,
  `lieun` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `numtel` int(10) NOT NULL,
  `nummat` int(6) NOT NULL,
  `anneetudeact` int(4) NOT NULL,
  `certificat` longblob NOT NULL,
  PRIMARY KEY (`id_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `etudiant`
--

INSERT INTO `etudiant` (`id_etudiant`, `niveau_etude`, `date_inscription`, `nom`, `prenom`, `daten`, `lieun`, `email`, `numtel`, `nummat`, `anneetudeact`, `certificat`) VALUES
(101, '3e année médecine', '2024-09-20', 'Amara korb', 'chiraz', '2004-10-14', 'annaba', 'chirazchirou@gmail.c', 663319091, 360869, 2025, ''),
(102, 'Internat médecine', '2024-10-05', '', '', '0000-00-00', '', '', 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Structure de la table `faire`
--

CREATE TABLE IF NOT EXISTS `faire` (
  `id_utilisateur` int(11) NOT NULL DEFAULT '0',
  `id_quiz` int(11) NOT NULL DEFAULT '0',
  `score` float DEFAULT NULL,
  `date_passe` date DEFAULT NULL,
  PRIMARY KEY (`id_utilisateur`,`id_quiz`),
  KEY `id_quiz` (`id_quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `faire`
--

INSERT INTO `faire` (`id_utilisateur`, `id_quiz`, `score`, `date_passe`) VALUES
(1, 2001, 9, '2025-01-25'),
(2, 2002, 8.5, '2025-01-26');

-- --------------------------------------------------------

--
-- Structure de la table `inscrie`
--

CREATE TABLE IF NOT EXISTS `inscrie` (
  `id_etudiant` int(11) NOT NULL DEFAULT '0',
  `id_cours` int(11) NOT NULL DEFAULT '0',
  `date_inscription` date DEFAULT NULL,
  `note` float DEFAULT NULL,
  `progression` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_etudiant`,`id_cours`),
  KEY `id_cours` (`id_cours`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `inscrie`
--

INSERT INTO `inscrie` (`id_etudiant`, `id_cours`, `date_inscription`, `note`, `progression`) VALUES
(101, 1001, '2025-02-01', 15.5, 100),
(102, 1002, '2025-02-02', 16, 85);

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

CREATE TABLE IF NOT EXISTS `professeur` (
  `id_utilisateur` int(11) NOT NULL,
  `specialite` varchar(100) DEFAULT NULL,
  `grade_academique` varchar(100) DEFAULT NULL,
  `date_embauche` date DEFAULT NULL,
  `nomP` varchar(10) NOT NULL,
  `prenomP` varchar(20) NOT NULL,
  `dateP` date NOT NULL,
  `lieunP` varchar(20) NOT NULL,
  `emailP` varchar(20) NOT NULL,
  `numtelP` int(10) NOT NULL,
  `anneexpP` int(6) NOT NULL,
  `cv` longblob NOT NULL,
  `diplome` longblob NOT NULL,
  `etabli` varchar(100) NOT NULL,
  PRIMARY KEY (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `professeur`
--

INSERT INTO `professeur` (`id_utilisateur`, `specialite`, `grade_academique`, `date_embauche`, `nomP`, `prenomP`, `dateP`, `lieunP`, `emailP`, `numtelP`, `anneexpP`, `cv`, `diplome`, `etabli`) VALUES
(1, 'Ophtalmologie', 'Professeur', '2015-09-01', 'Beddiar', 'amina', '2003-12-16', 'strasbourg', 'aminamaissabeddiar@g', 668331562, 2, '', '', ''),
(2, 'Ophtalmologie', 'Maître de conférences', '2018-03-15', '', '', '0000-00-00', '', '', 0, 0, '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `quiz`
--

CREATE TABLE IF NOT EXISTS `quiz` (
  `id_quiz` int(11) NOT NULL,
  `titre` varchar(100) DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `id_cours` int(11) DEFAULT NULL,
  `question` text NOT NULL,
  PRIMARY KEY (`id_quiz`),
  KEY `id_cours` (`id_cours`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `quiz`
--

INSERT INTO `quiz` (`id_quiz`, `titre`, `duree`, `id_cours`, `question`) VALUES
(2001, 'Quiz sur les uvéites antérieures', 15, 1001, '''Quels sont les signes cliniques typiques d’une uvéite antérieure aiguë ?'''),
(2002, 'Quiz sur les causes infectieuses', 20, 1002, '''Quels diagnostics faut-il évoquer devant une uvéite postérieure chronique ?''');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `cours_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `professeur` (`id_utilisateur`);

--
-- Contraintes pour la table `faire`
--
ALTER TABLE `faire`
  ADD CONSTRAINT `faire_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `professeur` (`id_utilisateur`),
  ADD CONSTRAINT `faire_ibfk_2` FOREIGN KEY (`id_quiz`) REFERENCES `quiz` (`id_quiz`);

--
-- Contraintes pour la table `inscrie`
--
ALTER TABLE `inscrie`
  ADD CONSTRAINT `inscrie_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`),
  ADD CONSTRAINT `inscrie_ibfk_2` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`);

--
-- Contraintes pour la table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
