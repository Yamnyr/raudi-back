-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 05 jan. 2024 à 11:14
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


-- Drop foreign key constraints if they exist
ALTER TABLE `option_model` DROP FOREIGN KEY IF EXISTS `option_model_ibfk_1`;
ALTER TABLE `option_model` DROP FOREIGN KEY IF EXISTS `option_model_ibfk_2`;

-- Drop the tables if they exist
DROP TABLE IF EXISTS `commande`;
DROP TABLE IF EXISTS `modele`;
DROP TABLE IF EXISTS `option`;
DROP TABLE IF EXISTS `option_model`;
DROP TABLE IF EXISTS `utilisateur`;
--
-- Base de données : `raudi`
--
CREATE DATABASE IF NOT EXISTS `raudi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `raudi`;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `montant_total` int(11) DEFAULT NULL,
  `liste_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`liste_options`)),
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `id_utilisateur` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `id_modele` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `montant_total`, `liste_options`, `createdAt`, `updatedAt`, `id_utilisateur`, `id_modele`) VALUES
('0103d950-346a-4bab-8e15-87e842fddd53', 2, '\"test\"', '2024-01-05 09:31:03', '2024-01-05 09:31:03', '02f785fb-bc01-41c1-975f-b828da5e4f05', '29c600cf-784b-424d-99d4-240a04e2ce97'),
('53654b17-40d7-4307-93cd-7131ab1d6a1b', 2, '\"test\"', '2024-01-05 09:32:10', '2024-01-05 09:32:10', '02f785fb-bc01-41c1-975f-b828da5e4f05', '29c600cf-784b-424d-99d4-240a04e2ce97'),
('56f17852-05cd-4324-9f89-d892d26bcedc', 2, '\"test\"', '2024-01-05 09:29:43', '2024-01-05 09:29:43', '02f785fb-bc01-41c1-975f-b828da5e4f05', '29c600cf-784b-424d-99d4-240a04e2ce97'),
('6b09e2fd-6faf-4e3d-96fb-f6163e5aa0cb', 2, '\"test\"', '2024-01-05 09:42:58', '2024-01-05 09:42:58', '02f785fb-bc01-41c1-975f-b828da5e4f05', '29c600cf-784b-424d-99d4-240a04e2ce97'),
('83d531f5-a920-495c-be80-bdbfc61c269e', 2, '\"test\"', '2024-01-05 09:30:30', '2024-01-05 09:30:30', '02f785fb-bc01-41c1-975f-b828da5e4f05', '29c600cf-784b-424d-99d4-240a04e2ce97'),
('e1786731-e530-4128-927f-545736ba2e5f', 2, '\"test\"', '2024-01-05 09:31:12', '2024-01-05 09:31:12', '02f785fb-bc01-41c1-975f-b828da5e4f05', '29c600cf-784b-424d-99d4-240a04e2ce97'),
('e6b07941-fa01-4816-82fc-a946e3797f99', 2, '\"test\"', '2024-01-05 09:29:24', '2024-01-05 09:29:24', '02f785fb-bc01-41c1-975f-b828da5e4f05', '29c600cf-784b-424d-99d4-240a04e2ce97');

-- --------------------------------------------------------

--
-- Structure de la table `modele`
--

CREATE TABLE `modele` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prix` int(11) NOT NULL,
  `nbr_porte` int(11) NOT NULL,
  `moteur` varchar(255) NOT NULL,
  `taille` int(11) NOT NULL,
  `nbr_place` int(11) NOT NULL,
  `img` BLOB,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `modele`
--

INSERT INTO `modele` (`id`, `nom`, `prix`, `nbr_porte`, `moteur`, `taille`, `nbr_place`, `img`, `createdAt`, `updatedAt`) VALUES
('29c600cf-784b-424d-99d4-240a04e2ce97', 'test', 20000, 5, 'essence', 2, 5, '../img/RaudiR1.jpg', '2024-01-04 18:42:00', '2024-01-04 18:42:00'),
('3cbe17be-0f67-444f-8c37-bff7b40c74a1', 'voituremobile', 20000, 5, 'essence', 2, 5, '../img/RaudiR2.jpg', '2024-01-05 09:33:32', '2024-01-05 09:33:32');

-- --------------------------------------------------------

--
-- Structure de la table `option`
--

CREATE TABLE `option` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prix` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `option`
--

INSERT INTO `option` (`id`, `nom`, `prix`, `createdAt`, `updatedAt`) VALUES
('1b278310-6aa3-463e-91f4-9f7622dd6302', 'vitres teintées', 200, '2024-01-05 10:13:56', '2024-01-05 10:13:56'),
('b963d77e-6a99-43ad-836f-0406af603167', 'clim', 100, '2024-01-05 10:12:20', '2024-01-05 10:12:20'),
('fffaa837-0280-4a08-80eb-aaff3c80851e', 'phares xenon', 400, '2024-01-05 10:14:06', '2024-01-05 10:14:06');

-- --------------------------------------------------------

--
-- Structure de la table `option_model`
--

CREATE TABLE `option_model` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `modeleId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `optionId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
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
('02f785fb-bc01-41c1-975f-b828da5e4f05', 'test', 'test', 'test10@user.gmail', '$2b$10$iOZl94N85/F2zF9NsI8gPeqgAeGHb5UWamHqDM.HZJWHOB2XzTXU2', 0, '2024-01-05 09:07:11', '2024-01-05 09:07:11'),
('25509f66-8128-47df-8f56-d1273d34bc49', 'test', 'test', 'test8@user.gmail', '$2b$10$r4uUTYlO8sR3PIBu2E/k9u9RbgDy.Zds2cVUmniXrs1gbdxyKp.iu', 0, '2024-01-05 09:04:35', '2024-01-05 09:04:35'),
('36634535-8027-426b-8d0f-0f603540fb3c', 'test', 'test', 'testa@user.gmail', '$2b$10$AhM5TDT5u8KH8oGe/uDgQeKVxcdCbHLRiTNpIfa7nn/BCnRjyUxrq', 0, '2024-01-05 09:10:48', '2024-01-05 09:10:48'),
('4a29542c-96d3-4ca9-9b77-f511d03bf595', 'test', 'test', 'test9@user.gmail', '$2b$10$yhYuRp0vw3JsfZ76TfJcPuPSWlIbhOPLla5mjQpyuaUabXeum42Ga', 0, '2024-01-05 09:06:25', '2024-01-05 09:06:25'),
('4f9661bd-2dac-460a-bdd8-d735a3dc58ef', 'test', 'test', 'test6@user.gmail', '$2b$10$aJquAo1H4Bh5m52SX7bbu.17jaQZSSD9i3bnk5zkMbs3xJFqwEAtO', 0, '2024-01-05 09:02:10', '2024-01-05 09:02:10'),
('98b99e83-2aed-4d4c-b6d5-de14c3f0a20c', 'test', 'test', 'test5@user.gmail', '$2b$10$j9tzboK7b4B61AJ.SNrwteXtcJOnSpRdbbLkHvFssyo68hGVPoJia', 0, '2024-01-05 09:01:10', '2024-01-05 09:01:10'),
('a1abc803-e6d6-442d-9356-69c836d0bf16', 'test', 'test', 'test7@user.gmail', '$2b$10$s2yLBmhTii9o4t1uXueZBuOX1g0KB1imUwCV2p.lvUsCmgG1yUA4.', 0, '2024-01-05 09:02:54', '2024-01-05 09:02:54'),
('a965ae37-3b6f-4987-a2a2-97e989f586fd', 'test', 'test', 'test4@user.gmail', '$2b$10$tMQ6wnPIbSy5ik4X8.aL7uRn3Fb322D8C8wPiCdjkcTvv2zDfT2M2', 0, '2024-01-05 08:59:55', '2024-01-05 08:59:55');

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
