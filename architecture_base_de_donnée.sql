-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 24 Novembre 2023 à 09:14
-- Version du serveur :  5.7.11
-- Version de PHP :  7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `espace_membre_v3`
--

-- --------------------------------------------------------

--
-- Structure de la table `exchange`
--

CREATE TABLE `exchange` (
  `id_echange` int(11) NOT NULL COMMENT 'id de la transaction',
  `id_graine` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `retrait` int(255) NOT NULL,
  `don` int(255) NOT NULL,
  `ratio` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_graine` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `taille` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `bin` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `seeds`
--

CREATE TABLE `seeds` (
  `id_graine` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `quantite` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `confirmation_token` varchar(60) DEFAULT NULL,
  `confirmed_at` date DEFAULT NULL,
  `reset_token` varchar(60) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `remember_token` varchar(250) DEFAULT NULL,
  `ratio` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `exchange`
--
ALTER TABLE `exchange`
  ADD PRIMARY KEY (`id_echange`),
  ADD KEY `clé` (`id_client`),
  ADD KEY `seeds` (`id_graine`);

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_graine` (`id_graine`);

--
-- Index pour la table `seeds`
--
ALTER TABLE `seeds`
  ADD PRIMARY KEY (`id_graine`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `exchange`
--
ALTER TABLE `exchange`
  MODIFY `id_echange` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de la transaction';
--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `seeds`
--
ALTER TABLE `seeds`
  MODIFY `id_graine` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `exchange`
--
ALTER TABLE `exchange`
  ADD CONSTRAINT `exchange_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exchange_ibfk_2` FOREIGN KEY (`id_graine`) REFERENCES `seeds` (`id_graine`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`id_graine`) REFERENCES `seeds` (`id_graine`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
