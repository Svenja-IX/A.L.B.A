-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 29 avr. 2020 à 10:23
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
-- Base de données : `reseaux`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `categorie_id` int(11) NOT NULL,
  `categorie_nom` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `commentaire_id` int(11) NOT NULL,
  `commentaire_date` date NOT NULL,
  `commentaire_titre` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentaire_texte` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `compteuser_id` int(11) NOT NULL,
  `reactions_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `compteuser`
--

CREATE TABLE `compteuser` (
  `compteuser_id` int(11) NOT NULL,
  `compteuser_pseudo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `compteuser_password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `compteuser_mail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `posts_id` int(11) NOT NULL,
  `posts_texte` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_date` date NOT NULL,
  `reactions_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `commentaire_id` int(11) NOT NULL,
  `compteuser_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `publicite`
--

CREATE TABLE `publicite` (
  `publicite_id` int(11) NOT NULL,
  `publicite_lien` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publicite_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publicite_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reactions`
--

CREATE TABLE `reactions` (
  `reactions_id` int(11) NOT NULL,
  `reactions_nombre` decimal(10,0) NOT NULL,
  `compteuser_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `session_id` int(11) NOT NULL,
  `session_user` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_heure` datetime NOT NULL,
  `compteuser_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`categorie_id`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`commentaire_id`),
  ADD KEY `commentaire_compteuser_id` (`compteuser_id`),
  ADD KEY `reactions_id` (`reactions_id`);

--
-- Index pour la table `compteuser`
--
ALTER TABLE `compteuser`
  ADD PRIMARY KEY (`compteuser_id`),
  ADD UNIQUE KEY `compteuser_mail` (`compteuser_mail`),
  ADD KEY `compteuser_admin_id` (`admin_id`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`posts_id`),
  ADD KEY `categorie_id` (`categorie_id`),
  ADD KEY `commentaire_id` (`commentaire_id`),
  ADD KEY `posts_compteuser_id` (`compteuser_id`),
  ADD KEY `posts_reactions_id` (`reactions_id`);

--
-- Index pour la table `publicite`
--
ALTER TABLE `publicite`
  ADD PRIMARY KEY (`publicite_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Index pour la table `reactions`
--
ALTER TABLE `reactions`
  ADD PRIMARY KEY (`reactions_id`),
  ADD KEY `reactions_compteuser_id` (`compteuser_id`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`session_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `categorie_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `commentaire_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `compteuser`
--
ALTER TABLE `compteuser`
  MODIFY `compteuser_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `posts_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `publicite`
--
ALTER TABLE `publicite`
  MODIFY `publicite_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reactions`
--
ALTER TABLE `reactions`
  MODIFY `reactions_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `session`
--
ALTER TABLE `session`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `commentaire_compteuser_id` FOREIGN KEY (`compteuser_id`) REFERENCES `compteuser` (`compteuser_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `reactions_id` FOREIGN KEY (`reactions_id`) REFERENCES `reactions` (`reactions_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `compteuser`
--
ALTER TABLE `compteuser`
  ADD CONSTRAINT `compteuser_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `categorie_id` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`categorie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `commentaire_id` FOREIGN KEY (`commentaire_id`) REFERENCES `commentaire` (`commentaire_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `posts_compteuser_id` FOREIGN KEY (`compteuser_id`) REFERENCES `compteuser` (`compteuser_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `posts_reactions_id` FOREIGN KEY (`reactions_id`) REFERENCES `reactions` (`reactions_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `publicite`
--
ALTER TABLE `publicite`
  ADD CONSTRAINT `admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `reactions`
--
ALTER TABLE `reactions`
  ADD CONSTRAINT `reactions_compteuser_id` FOREIGN KEY (`compteuser_id`) REFERENCES `compteuser` (`compteuser_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
