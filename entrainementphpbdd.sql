-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : sam. 11 avr. 2020 à 15:49
-- Version du serveur :  5.7.24
-- Version de PHP : 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `entrainementphpbdd`
--

-- --------------------------------------------------------

--
-- Structure de la table `info`
--

CREATE TABLE `info` (
  `info_id` int(11) NOT NULL,
  `info_prenom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info_nom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info_mail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info_password` char(60) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `info`
--

INSERT INTO `info` (`info_id`, `info_prenom`, `info_nom`, `info_mail`, `info_password`) VALUES
(1, 'Axel', 'Abad', 'axel.abad0901@gmail.com', '$2y$10$2WFpHaK2pEBdaVYeTSe9v.cjc.WSvRcivhFcLB.DEa3clIlpr01oS'),
(6, 'Axel', 'Abad', 'test2@gmail.com', '$2y$10$mSc3/qLm/heYwZCUwhL21.GI4Ig47qylAdNkjrxQD.AF/ZJR1Zzz6'),
(7, 'hjub', 'asdr', 'nouveau@gmail.com', '$2y$10$cmu7XQL79PRrci3dHBmA1O.dtUInqK2ITSBIWyau9XcToZgEnJY1.'),
(8, 'qsdqdq', 'qdgfdgdfg', 'sgtujhjt@gmail.com', '$2y$10$Ksedz9tyfeBCgrWTzEKw2uCcKlx/bpszNfIhv5X5GlTggl2YFY6B6'),
(9, 'Enzo', 'Perdiguero', 'EnzoPerdiguero@gmail.com', '$2y$10$0q.T9yPFp2nZnhYAzebOY.pMXvRr6qR18udqybZmSOO7TQqI4Lz1m');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`info_id`),
  ADD UNIQUE KEY `info_mail` (`info_mail`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `info`
--
ALTER TABLE `info`
  MODIFY `info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
