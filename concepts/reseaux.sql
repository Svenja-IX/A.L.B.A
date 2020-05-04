-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 04 mai 2020 à 17:04
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

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`admin_id`) VALUES
(1);

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
  `compteuser_id` int(11) DEFAULT NULL,
  `reactions_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`commentaire_id`, `commentaire_date`, `commentaire_titre`, `commentaire_texte`, `compteuser_id`, `reactions_id`) VALUES
(1, '2020-04-30', 'titre 1', 'coucou', NULL, NULL),
(2, '2020-04-30', 'titre', 'coucouc', NULL, NULL),
(3, '2020-04-30', 'voici', 'hello', NULL, NULL),
(4, '2020-04-30', 'test', 'coucou', NULL, NULL),
(5, '2020-04-30', 'coucou', 'voici', NULL, NULL),
(6, '2020-04-30', 'titre', 'coucou', NULL, NULL),
(7, '2020-05-01', 'Lorry', 'Lorry Ca VA', NULL, NULL),
(8, '2020-05-01', 'c est le premier Mai', 'Bon 1er MAI', NULL, NULL),
(9, '2020-05-01', 'test2', 'TEST 2', NULL, NULL),
(10, '2020-05-04', 'coucou', 'coucou2', NULL, NULL),
(11, '2020-05-04', 'coucou tata', 'test new', NULL, NULL),
(12, '2020-05-04', 'titre doco', 'doc', NULL, NULL),
(13, '2020-05-04', 'coucou', 'tata', NULL, NULL),
(14, '2020-05-04', 'coucou', 'merci A vous tous', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `commentaires_simples`
--

CREATE TABLE `commentaires_simples` (
  `commentaire_id` int(11) NOT NULL,
  `commentaire_date` date NOT NULL,
  `commentaire_titre` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentaire_texte` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commentaires_simples`
--

INSERT INTO `commentaires_simples` (`commentaire_id`, `commentaire_date`, `commentaire_titre`, `commentaire_texte`) VALUES
(11, '2020-04-30', 'test', 'coucou'),
(12, '2020-04-30', 'titre', 'coucou'),
(13, '2020-04-29', 'test  new', 'voici '),
(14, '2020-04-30', 'test', 'coucou'),
(15, '2020-04-30', 'test', 'test');

-- --------------------------------------------------------

--
-- Structure de la table `compteuser`
--

CREATE TABLE `compteuser` (
  `compteuser_id` int(11) NOT NULL,
  `compteuser_pseudo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `compteuser_password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `compteuser_mail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `compteuser`
--

INSERT INTO `compteuser` (`compteuser_id`, `compteuser_pseudo`, `compteuser_password`, `compteuser_mail`, `session_id`, `admin_id`) VALUES
(1, 'cocote', '$2y$10$LCD5uXAqv3o76hjhIev8r.TOGWf/hB5wgtnqZjj8eauU3P.wulftO', 'fdelprino@hotmail.fr', NULL, NULL),
(2, 'feedusud', '$2y$10$yZcnACxw2QJpNHTighzmYeb3Ygo6eRNryawHSiRnRxU257S8tI4T.', 'audreymedici@gmail.com', NULL, NULL);

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

--
-- Déchargement des données de la table `publicite`
--

INSERT INTO `publicite` (`publicite_id`, `publicite_lien`, `publicite_image`, `publicite_description`, `admin_id`) VALUES
(2, 'https://www.google.fr', 'images/pub1.jpg', 'Pub 1', 1),
(3, 'https://www.google.fr', 'images/pub2.jpg', 'Pub 2', 1);

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
-- Index pour la table `commentaires_simples`
--
ALTER TABLE `commentaires_simples`
  ADD PRIMARY KEY (`commentaire_id`);

--
-- Index pour la table `compteuser`
--
ALTER TABLE `compteuser`
  ADD PRIMARY KEY (`compteuser_id`),
  ADD KEY `compteuser_admin_id` (`admin_id`),
  ADD KEY `session_id` (`session_id`);

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
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `compteuser_id` (`compteuser_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `categorie_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `commentaire_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `commentaires_simples`
--
ALTER TABLE `commentaires_simples`
  MODIFY `commentaire_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `publicite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  ADD CONSTRAINT `compteuser_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `session_id` FOREIGN KEY (`session_id`) REFERENCES `session` (`session_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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

--
-- Contraintes pour la table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `compteuser_id` FOREIGN KEY (`compteuser_id`) REFERENCES `compteuser` (`compteuser_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
