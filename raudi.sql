-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 05 jan. 2024 à 16:23
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `raudi`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `montant_total` int(11) DEFAULT NULL,
  `liste_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`liste_options`)),
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `id_modele` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `montant_total`, `liste_options`, `createdAt`, `updatedAt`, `id_utilisateur`, `id_modele`) VALUES
(1, 20200, '\"test\"', '2024-01-05 15:19:22', '2024-01-05 15:19:22', 1, 1),
(2, 20100, '\"test\"', '2024-01-05 15:19:27', '2024-01-05 15:19:27', 2, 1),
(3, 20000, '\"test\"', '2024-01-05 15:19:42', '2024-01-05 15:19:42', 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `modele`
--

CREATE TABLE `modele` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prix` int(11) NOT NULL,
  `nbr_porte` int(11) NOT NULL,
  `moteur` varchar(255) NOT NULL,
  `taille` int(11) NOT NULL,
  `nbr_place` int(11) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `modele`
--

INSERT INTO `modele` (`id`, `nom`, `prix`, `nbr_porte`, `moteur`, `taille`, `nbr_place`, `img`, `createdAt`, `updatedAt`) VALUES
(1, 'RaudiR1', 20000, 5, 'essence', 2, 5, './img/RaudiR1.jpg', '2024-01-05 15:18:01', '2024-01-05 15:18:01'),
(2, 'RaudiR2', 20000, 5, 'essence', 2, 5, './img/RaudiR2.jpg', '2024-01-05 15:18:19', '2024-01-05 15:18:19'),
(3, 'RaudiB7', 20000, 5, 'essence', 2, 5, './img/RaudiB7.jpg', '2024-01-05 15:22:34', '2024-01-05 15:22:34');

-- --------------------------------------------------------

--
-- Structure de la table `option`
--

CREATE TABLE `option` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prix` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `option`
--

INSERT INTO `option` (`id`, `nom`, `prix`, `createdAt`, `updatedAt`) VALUES
(1, 'clim', 100, '2024-01-05 15:15:56', '2024-01-05 15:15:56'),
(2, 'vitres teintées', 100, '2024-01-05 15:16:27', '2024-01-05 15:16:27'),
(3, 'phares xenon', 200, '2024-01-05 15:16:41', '2024-01-05 15:16:41');

-- --------------------------------------------------------

--
-- Structure de la table `option_model`
--

CREATE TABLE `option_model` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `modeleId` int(11) NOT NULL,
  `optionId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `option_model`
--

INSERT INTO `option_model` (`createdAt`, `updatedAt`, `modeleId`, `optionId`) VALUES
('2024-01-05 15:18:01', '2024-01-05 15:18:01', 1, 1),
('2024-01-05 15:18:01', '2024-01-05 15:18:01', 1, 2),
('2024-01-05 15:18:19', '2024-01-05 15:18:19', 2, 2),
('2024-01-05 15:18:19', '2024-01-05 15:18:19', 2, 3),
('2024-01-05 15:22:34', '2024-01-05 15:22:34', 3, 1),
('2024-01-05 15:22:34', '2024-01-05 15:22:34', 3, 2),
('2024-01-05 15:22:34', '2024-01-05 15:22:34', 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `mdp` varchar(255) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `email`, `mdp`, `role`, `createdAt`, `updatedAt`) VALUES
(1, 'waroquet', 'quentin', 'test@user.gmail', '$2b$10$A94kzF6gTEyGqOOagt/M6etAUZ3rfjLilha20/2vsCK7MfGf130Mu', 1, '2024-01-05 15:14:30', '2024-01-05 15:14:30'),
(2, 'Cordier', 'Maxime', 'test2@user.gmail', '$2b$10$ZblcDvNEemz5KYvtV4IykOnLEQpEno0OEujWw2uegdUmGpL4L4YSS', 2, '2024-01-05 15:14:45', '2024-01-05 15:14:45'),
(3, 'test', 'test', 'test3@user.gmail', '$2b$10$sDMZvXauYy7vkNtAaYppQeJ/tuuDbl0ilCtY7MKMnvQaHYaIfkXJ.', 0, '2024-01-05 15:14:54', '2024-01-05 15:14:54');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_modele` (`id_modele`);

--
-- Index pour la table `modele`
--
ALTER TABLE `modele`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `option`
--
ALTER TABLE `option`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `option_model`
--
ALTER TABLE `option_model`
  ADD PRIMARY KEY (`modeleId`,`optionId`),
  ADD KEY `optionId` (`optionId`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `modele`
--
ALTER TABLE `modele`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `option`
--
ALTER TABLE `option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`id_modele`) REFERENCES `modele` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `option_model`
--
ALTER TABLE `option_model`
  ADD CONSTRAINT `option_model_ibfk_1` FOREIGN KEY (`modeleId`) REFERENCES `modele` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `option_model_ibfk_2` FOREIGN KEY (`optionId`) REFERENCES `option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
