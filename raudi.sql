-- Création de la base de données
CREATE DATABASE IF NOT EXISTS `raudi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Utilisation de la base de données
USE `raudi`;


-- Création de la table `modele`
CREATE TABLE IF NOT EXISTS `modele` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `nom` varchar(255) NOT NULL,
    `prix` int(11) NOT NULL,
    `nbr_porte` int(11) NOT NULL,
    `moteur` varchar(255) NOT NULL,
    `taille` int(11) NOT NULL,
    `nbr_place` int(11) NOT NULL,
    `img` varchar(255) DEFAULT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Création de la table `option`
CREATE TABLE IF NOT EXISTS `option` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `nom` varchar(255) NOT NULL,
    `prix` int(11) DEFAULT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Création de la table `option_model`
CREATE TABLE IF NOT EXISTS `option_model` (
                                              `createdAt` datetime NOT NULL,
                                              `updatedAt` datetime NOT NULL,
                                              `modeleId` int(11) NOT NULL,
    `optionId` int(11) NOT NULL,
    PRIMARY KEY (`modeleId`,`optionId`),
    KEY `optionId` (`optionId`),
    CONSTRAINT `option_model_ibfk_1` FOREIGN KEY (`modeleId`) REFERENCES `modele` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `option_model_ibfk_2` FOREIGN KEY (`optionId`) REFERENCES `option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Création de la table `utilisateur`
CREATE TABLE IF NOT EXISTS `utilisateur` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `nom` varchar(255) DEFAULT NULL,
    `prenom` varchar(255) DEFAULT NULL,
    `email` varchar(255) NOT NULL,
    `mdp` varchar(255) DEFAULT NULL,
    `role` int(11) NOT NULL DEFAULT 0,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `email` (`email`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- Création de la table `commande`
CREATE TABLE IF NOT EXISTS `commande` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `montant_total` int(11) DEFAULT NULL,
    `liste_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`liste_options`)),
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    `id_utilisateur` int(11) DEFAULT NULL,
    `id_modele` int(11) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `id_utilisateur` (`id_utilisateur`),
    KEY `id_modele` (`id_modele`),
    CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`id_modele`) REFERENCES `modele` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `email`, `mdp`, `role`, `createdAt`, `updatedAt`) VALUES
    (1, 'waroquet', 'quentin', 'test@user.gmail', '$2b$10$A94kzF6gTEyGqOOagt/M6etAUZ3rfjLilha20/2vsCK7MfGf130Mu', 1, '2024-01-05 15:14:30', '2024-01-05 15:14:30'),
    (2, 'Cordier', 'Maxime', 'test2@user.gmail', '$2b$10$ZblcDvNEemz5KYvtV4IykOnLEQpEno0OEujWw2uegdUmGpL4L4YSS', 2, '2024-01-05 15:14:45', '2024-01-05 15:14:45'),
    (3, 'test', 'test', 'test3@user.gmail', '$2b$10$sDMZvXauYy7vkNtAaYppQeJ/tuuDbl0ilCtY7MKMnvQaHYaIfkXJ.', 0, '2024-01-05 15:14:54', '2024-01-05 15:14:54'),
    (4, 'aze', 'aze', 'admin@admin', '$2b$10$28vKtfAcydC0ImqyrRuVuu6501TWc4ueG/i.yGG9eQbXhrxlV.bR2', 0, '2024-01-07 19:23:19', '2024-01-07 19:23:19');



INSERT INTO `modele` (`id`, `nom`, `prix`, `nbr_porte`, `moteur`, `taille`, `nbr_place`, `img`, `createdAt`, `updatedAt`) VALUES
    (1, 'RaudiR1', 20000, 5, 'essence', 2, 5, './img/RaudiR1.jpg', '2024-01-05 15:18:01', '2024-01-05 15:18:01'),
    (2, 'RaudiR2', 20000, 5, 'essence', 2, 5, './img/RaudiR2.jpg', '2024-01-05 15:18:19', '2024-01-05 15:18:19'),
    (3, 'RaudiR23', 20000, 5, 'essence', 2, 5, './img/RaudiB7.jpg', '2024-01-05 15:22:34', '2024-01-05 15:22:34');



INSERT INTO `option` (`id`, `nom`, `prix`, `createdAt`, `updatedAt`) VALUES
    (1, 'clim', 100, '2024-01-05 15:15:56', '2024-01-05 15:15:56'),
    (2, 'vitres teintées', 100, '2024-01-05 15:16:27', '2024-01-05 15:16:27'),
    (3, 'phares xenon', 200, '2024-01-05 15:16:41', '2024-01-05 15:16:41');


INSERT INTO `option_model` (`createdAt`, `updatedAt`, `modeleId`, `optionId`) VALUES
    ('2024-01-05 15:18:01', '2024-01-05 15:18:01', 1, 1),
    ('2024-01-05 15:18:01', '2024-01-05 15:18:01', 1, 2),
    ('2024-01-05 15:18:19', '2024-01-05 15:18:19', 2, 2),
    ('2024-01-05 15:18:19', '2024-01-05 15:18:19', 2, 3),
    ('2024-01-05 15:22:34', '2024-01-05 15:22:34', 3, 1),
    ('2024-01-05 15:22:34', '2024-01-05 15:22:34', 3, 2),
    ('2024-01-05 15:22:34', '2024-01-05 15:22:34', 3, 3);


INSERT INTO `commande` (`id`, `montant_total`, `liste_options`, `createdAt`, `updatedAt`, `id_utilisateur`, `id_modele`) VALUES
    (1, 20200, '\"test\"', '2024-01-05 15:19:22', '2024-01-05 15:19:22', 1, 1),
    (2, 20100, '\"test\"', '2024-01-05 15:19:27', '2024-01-05 15:19:27', 2, 1),
    (3, 20000, '\"test\"', '2024-01-05 15:19:42', '2024-01-05 15:19:42', 3, 2),
    (4, 10000, '\"test\"', '2023-01-02 17:43:23', '2023-01-02 17:43:23', 2, 1),
    (5, 20200, '\"test\"', '2024-01-05 18:17:27', '2024-01-05 18:17:27', 2, 1),
    (6, 20100, '\"test\"', '2023-10-05 18:21:33', '2023-10-05 18:21:33', 2, 1),
    (7, 20100, '\"test\"', '2023-12-19 18:21:33', '2024-01-05 18:21:33', 2, 1);

COMMIT;