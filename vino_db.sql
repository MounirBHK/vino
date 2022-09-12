-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : lun. 12 sep. 2022 à 17:03
-- Version du serveur :  5.7.34
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `vino_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `achats`
--

CREATE TABLE `achats` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_bouteille` bigint(20) UNSIGNED NOT NULL,
  `date_achat` datetime NOT NULL,
  `quantite_achat` smallint(6) DEFAULT NULL,
  `prix_achat` decimal(6,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bouteilles`
--

CREATE TABLE `bouteilles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_type` bigint(20) UNSIGNED NOT NULL,
  `nom_bouteille` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `listed` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `code_saq` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pays` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prix_saq` decimal(6,2) DEFAULT NULL,
  `url_saq` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `format` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `degre_alcool` smallint(6) DEFAULT NULL,
  `producteur` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `millesime` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `bouteilles`
--

INSERT INTO `bouteilles` (`id`, `id_type`, `nom_bouteille`, `image`, `listed`, `code_saq`, `pays`, `description`, `prix_saq`, `url_saq`, `url_img`, `format`, `degre_alcool`, `producteur`, `region`, `millesime`, `created_at`, `updated_at`) VALUES
(1, 1, 'Chateau Margot', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg/280px-Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg', 'N', NULL, 'France', 'dlkjvhskdv', '15.00', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg/280px-Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg', '750', 13, 'test', 'Bordeaux', 1980, NULL, NULL),
(2, 2, 'Chateau Margot', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg/280px-Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg', 'N', NULL, 'France', 'dlkjvhskdv', '40.00', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg/280px-Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg', '900', 15, 'test', 'Bordeaux', 1988, NULL, NULL),
(3, 3, 'Chateau Margot', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg/280px-Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg', 'N', NULL, 'France', 'dlkjvhskdv', '20.00', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg/280px-Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg', '750', 13, 'test', 'Bordeaux', 1998, NULL, NULL),
(538, 3, '13th Street Winery Gamay 2019', 'https://www.saq.com/media/catalog/product/1/2/12705631-1_1582140016.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '12705631', 'Canada', 'Vin rouge | 750 ml | Canada', '20.15', 'https://www.saq.com/fr/12705631', 'https://www.saq.com/media/catalog/product/1/2/12705631-1_1582140016.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(539, 3, '14 Hands Cabernet-Sauvignon Columbia Valley', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', 'Y', '13876247', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', '16.00', 'https://www.saq.com/fr/13876247', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(540, 3, '19 Crimes Cabernet-Sauvignon Limestone Coast', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', 'Y', '12824197', 'Australie', 'Vin rouge | 750 ml | Australie', '19.95', 'https://www.saq.com/fr/12824197', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(541, 3, '19 Crimes Shiraz/Grenache/Mataro', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', 'Y', '12073995', 'Australie', 'Vin rouge | 750 ml | Australie', '19.95', 'https://www.saq.com/fr/12073995', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(542, 3, '19 Crimes The Warden 2017', 'https://www.saq.com/media/catalog/product/1/3/13846179-1_1578543327.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13846179', 'Australie', 'Vin rouge | 750 ml | Australie', '30.25', 'https://www.saq.com/fr/13846179', 'https://www.saq.com/media/catalog/product/1/3/13846179-1_1578543327.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(543, 3, '1938 - Depuis Un Esprit D\'exception Puisseguin Saint-Émilion 2016', 'https://www.saq.com/media/catalog/product/1/1/11655601-1_1634748032.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '11655601', 'France', 'Vin rouge | 750 ml | France', '26.90', 'https://www.saq.com/fr/11655601', 'https://www.saq.com/media/catalog/product/1/1/11655601-1_1634748032.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(544, 3, '3 Badge Leese-Fitch Merlot 2015', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', 'Y', '13523011', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', '18.85', 'https://www.saq.com/fr/13523011', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(545, 3, '3 de Valandraud 2016', 'https://www.saq.com/media/catalog/product/1/3/13392031-1_1578535218.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13392031', 'France', 'Vin rouge | 750 ml | France', '53.00', 'https://www.saq.com/fr/13392031', 'https://www.saq.com/media/catalog/product/1/3/13392031-1_1578535218.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(546, 3, '3 de Valandraud St-Émilion Grand Cru 2015', 'https://www.saq.com/media/catalog/product/1/4/14767616-1_1631204434.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14767616', 'France', 'Vin rouge | 750 ml | France', '51.50', 'https://www.saq.com/fr/14767616', 'https://www.saq.com/media/catalog/product/1/4/14767616-1_1631204434.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(547, 3, '3 Rings Shiraz 2018', 'https://www.saq.com/media/catalog/product/1/2/12815725-1_1603713617.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '12815725', 'Australie', 'Vin rouge | 750 ml | Australie', '22.75', 'https://www.saq.com/fr/12815725', 'https://www.saq.com/media/catalog/product/1/2/12815725-1_1603713617.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(548, 3, '4 Kilos Gallinas y Focas 2018', 'https://www.saq.com/media/catalog/product/1/3/13903479-1_1641851135.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13903479', 'Espagne', 'Vin rouge | 750 ml | Espagne', '35.00', 'https://www.saq.com/fr/13903479', 'https://www.saq.com/media/catalog/product/1/3/13903479-1_1641851135.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(549, 3, '655 Miles Cabernet Sauvignon Lodi', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', 'Y', '14139863', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', '15.25', 'https://www.saq.com/fr/14139863', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(550, 3, '7Colores Gran Reserva Valle Casablanca 2019', 'https://www.saq.com/media/catalog/product/1/4/14208427-1_1606227648.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14208427', 'Chili', 'Vin rouge | 750 ml | Chili', '17.10', 'https://www.saq.com/fr/14208427', 'https://www.saq.com/media/catalog/product/1/4/14208427-1_1606227648.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(551, 3, 'A Mandria di Signadore Patrimonio 2019', 'https://www.saq.com/media/catalog/product/1/4/14736271-1_1624654560.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14736271', 'France', 'Vin rouge | 750 ml | France', '42.00', 'https://www.saq.com/fr/14736271', 'https://www.saq.com/media/catalog/product/1/4/14736271-1_1624654560.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(552, 3, 'A Mandria di Signadore Patrimonio 2018', 'https://www.saq.com/media/catalog/product/1/1/11908161-1_1580629223.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '11908161', 'France', 'Vin rouge | 750 ml | France', '41.00', 'https://www.saq.com/fr/11908161', 'https://www.saq.com/media/catalog/product/1/1/11908161-1_1580629223.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(553, 3, 'A Occhipinti Rosso Arcaico 2021', 'https://www.saq.com/media/catalog/product/1/4/14651867-1_1612271137.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14651867', 'Italie', 'Vin rouge | 750 ml | Italie', '30.75', 'https://www.saq.com/fr/14651867', 'https://www.saq.com/media/catalog/product/1/4/14651867-1_1612271137.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(554, 3, 'A thousand Lives Cabernet-Sauvignon Mendoza', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', 'Y', '14250211', 'Argentine', 'Vin rouge | 750 ml | Argentine', '10.60', 'https://www.saq.com/fr/14250211', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(555, 3, 'A. Christmann Pfalz Spätburgunder 2018', 'https://www.saq.com/media/catalog/product/1/4/14959941-1_1652993436.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14959941', 'Allemagne', 'Vin rouge | 750 ml | Allemagne', '32.50', 'https://www.saq.com/fr/14959941', 'https://www.saq.com/media/catalog/product/1/4/14959941-1_1652993436.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(556, 3, 'A.A. Badenhorst The Curator 2020', 'https://www.saq.com/media/catalog/product/1/2/12819435-1_1589314084.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '12819435', 'Afrique du Sud', 'Vin rouge | 750 ml | Afrique du Sud', '14.25', 'https://www.saq.com/fr/12819435', 'https://www.saq.com/media/catalog/product/1/2/12819435-1_1589314084.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(557, 3, 'Abad Dom Bueno Mencia Bierzo Joven 2019', 'https://www.saq.com/media/catalog/product/1/3/13794129-1_1626143125.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13794129', 'Espagne', 'Vin rouge | 750 ml | Espagne', '16.45', 'https://www.saq.com/fr/13794129', 'https://www.saq.com/media/catalog/product/1/3/13794129-1_1626143125.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(558, 3, 'Abbia Nova Senza Vandalismi Cesanese del Piglio 2021', 'https://www.saq.com/media/catalog/product/1/4/14497871-1_1623254467.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14497871', 'Italie', 'Vin rouge | 750 ml | Italie', '26.65', 'https://www.saq.com/fr/14497871', 'https://www.saq.com/media/catalog/product/1/4/14497871-1_1623254467.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(559, 3, 'Abreu Cappella Rutherford 2012', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', 'Y', '13319141', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', '967.75', 'https://www.saq.com/fr/13319141', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:40', '2022-09-12 21:17:40'),
(560, 3, '1000 Stories Zinfandel Californie', 'https://www.saq.com/media/catalog/product/1/3/13584455-1_1578538222.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13584455', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', '29.50', 'https://www.saq.com/fr/13584455', 'https://www.saq.com/media/catalog/product/1/3/13584455-1_1578538222.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:59', '2022-09-12 21:17:59'),
(561, 3, '11th Hour Cellars Pinot Noir', 'https://www.saq.com/media/catalog/product/1/3/13966470-1_1578546924.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13966470', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', '17.75', 'https://www.saq.com/fr/13966470', 'https://www.saq.com/media/catalog/product/1/3/13966470-1_1578546924.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-12 21:17:59', '2022-09-12 21:17:59');

-- --------------------------------------------------------

--
-- Structure de la table `celliers`
--

CREATE TABLE `celliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `lib_cellier` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nbr_colonne` smallint(6) DEFAULT NULL,
  `nbr_ligne` smallint(6) DEFAULT NULL,
  `capacite` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `celliers`
--

INSERT INTO `celliers` (`id`, `id_user`, `lib_cellier`, `nbr_colonne`, `nbr_ligne`, `capacite`, `created_at`, `updated_at`) VALUES
(1, 1, 'cellier_user1', NULL, NULL, 160, NULL, NULL),
(2, 1, 'cellier_user2', NULL, NULL, 260, NULL, NULL),
(3, 2, 'cellier_user3', NULL, NULL, 450, NULL, NULL),
(4, 3, 'cellier_user4', NULL, NULL, 585, NULL, NULL),
(5, 4, 'cellier_user5', NULL, NULL, 640, NULL, NULL),
(6, 2, 'nouveau_cellier', 6, 5, 200, '2022-09-13 00:25:02', '2022-09-13 00:25:02');

-- --------------------------------------------------------

--
-- Structure de la table `cellier_bouts`
--

CREATE TABLE `cellier_bouts` (
  `id_cellier` bigint(20) UNSIGNED NOT NULL,
  `id_bouteille` bigint(20) UNSIGNED NOT NULL,
  `quantite` smallint(6) DEFAULT NULL,
  `derniere_trans` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cellier_bouts`
--

INSERT INTO `cellier_bouts` (`id_cellier`, `id_bouteille`, `quantite`, `derniere_trans`, `created_at`, `updated_at`) VALUES
(1, 1, 20, '2022-08-16', NULL, NULL),
(1, 2, 10, '2022-08-15', NULL, NULL),
(1, 3, 5, '2022-08-18', NULL, NULL),
(2, 1, 29, '2022-08-20', NULL, NULL),
(2, 3, 17, '2022-08-20', NULL, NULL),
(3, 538, 4, '2022-09-12', '2022-09-12 23:52:17', '2022-09-12 23:52:17'),
(4, 1, 40, '2022-08-20', NULL, NULL),
(5, 2, 2, '2022-08-30', NULL, NULL),
(5, 3, 27, '2022-08-20', NULL, NULL),
(6, 540, 5, '2022-09-12', '2022-09-13 00:25:54', '2022-09-13 00:25:54');

-- --------------------------------------------------------

--
-- Structure de la table `consommations`
--

CREATE TABLE `consommations` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_bouteille` bigint(20) UNSIGNED NOT NULL,
  `date_consommation` datetime NOT NULL,
  `quantite_cons` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_09_02_153323_create_types_table', 1),
(6, '2022_09_02_153324_create_bouteilles_table', 1),
(7, '2022_09_02_153326_create_achats_table', 1),
(8, '2022_09_02_153327_create_celliers_table', 1),
(9, '2022_09_02_153328_create_cellier_bouts_table', 1),
(10, '2022_09_02_153329_create_consommations_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(33, 'App\\Models\\User', 2, 'auth_token', 'd5919e1b253d38ca2340bc3bd303e860bd6214d52ccf27784ad993ac3810ff93', '[\"*\"]', '2022-09-13 01:01:48', '2022-09-12 21:50:24', '2022-09-13 01:01:48');

-- --------------------------------------------------------

--
-- Structure de la table `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `types`
--

INSERT INTO `types` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Vin Rose', NULL, NULL),
(2, 'Vin Blanc', NULL, NULL),
(3, 'Vin Rouge', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `prenom`, `nom`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'test666', 'test@test.com', NULL, '$2y$10$/ixtWz3adfKjDu4JI87YCep8pHMMDQYaTKuUhSyiAsJkdgJjvNXga', 'test', 'test', 'OtRZHYSjnviRD7XVJ9Q4Z410gW1BQpDsnan9uC4weYldZ8kTu4gV9e1iVQKe', '2022-09-07 20:11:59', '2022-09-07 20:11:59'),
(2, 'Mr. Kade Bednar DVM', 'nwintheiser@example.net', '2022-09-07 21:10:07', '$2y$10$PO24wb9/zYCbX68jOGH6eO3K0ta8dgy7pbRPbR.DUpGdmz7xApOjW', 'Anibal', 'Brown', 'S3dPxoFjj4', '2022-09-07 21:10:07', '2022-09-07 21:10:07'),
(3, 'Lacey Kautzer', 'adams.maria@example.org', '2022-09-07 21:10:07', '$2y$10$SkkbOv0da5IuCbq4Z4McBejMGVXVgJn1MDwGuegQi5SNiZo0AoVz.', 'Johnpaul', 'Runte', 'hVFeSmyo04', '2022-09-07 21:10:07', '2022-09-07 21:10:07'),
(4, 'Lane West', 'micheal03@example.net', '2022-09-07 21:10:07', '$2y$10$9xPxijOMtyUhLyci9ZK2NepRQMrdEVkUUGejAJvCtJiaKAIszhNIS', 'Petra', 'Abernathy', 'dCTVRfKZ59', '2022-09-07 21:10:07', '2022-09-07 21:10:07'),
(5, 'John999', 'johnsmith@gmail.com', NULL, '$2y$10$VirbVleRZmr9lGtHsqmPI.rN4JmIRsdNCfg.dMnViGMOTLP0BlPbG', 'John', 'Smith', 'WdMo2XiApP3kGxFVm0NeYoI2UFaC5wFhidoxdiWJT2aAdyqSgfqskBjWnw0c', '2022-09-10 22:46:54', '2022-09-10 22:46:54'),
(6, 'Admin', 'admin@admin.com', NULL, '$2y$10$LAchjUWRx02IHMFTzqcwHeIzyBpizFTX.mXT466KgOhUSuGKTsxQO', 'Admin', 'Admin', 'nsl7tBasf37jtkAyH70Xzw5A9C8uZ9SMjNO8on1mBCtPS97x0FzNas8V5YT2', '2022-09-10 22:47:58', '2022-09-10 22:47:58');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `achats`
--
ALTER TABLE `achats`
  ADD PRIMARY KEY (`id_user`,`id_bouteille`,`date_achat`),
  ADD KEY `fk_achat` (`id_bouteille`);

--
-- Index pour la table `bouteilles`
--
ALTER TABLE `bouteilles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_appartenir` (`id_type`);

--
-- Index pour la table `celliers`
--
ALTER TABLE `celliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_avoir` (`id_user`);

--
-- Index pour la table `cellier_bouts`
--
ALTER TABLE `cellier_bouts`
  ADD PRIMARY KEY (`id_cellier`,`id_bouteille`),
  ADD KEY `fk_cellier_bout` (`id_bouteille`);

--
-- Index pour la table `consommations`
--
ALTER TABLE `consommations`
  ADD PRIMARY KEY (`id_user`,`id_bouteille`,`date_consommation`),
  ADD KEY `fk_consommation` (`id_bouteille`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bouteilles`
--
ALTER TABLE `bouteilles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=562;

--
-- AUTO_INCREMENT pour la table `celliers`
--
ALTER TABLE `celliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `achats`
--
ALTER TABLE `achats`
  ADD CONSTRAINT `fk_achat` FOREIGN KEY (`id_bouteille`) REFERENCES `bouteilles` (`id`),
  ADD CONSTRAINT `fk_achat2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `bouteilles`
--
ALTER TABLE `bouteilles`
  ADD CONSTRAINT `fk_appartenir` FOREIGN KEY (`id_type`) REFERENCES `types` (`id`);

--
-- Contraintes pour la table `celliers`
--
ALTER TABLE `celliers`
  ADD CONSTRAINT `fk_avoir` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `cellier_bouts`
--
ALTER TABLE `cellier_bouts`
  ADD CONSTRAINT `fk_cellier_bout` FOREIGN KEY (`id_bouteille`) REFERENCES `bouteilles` (`id`),
  ADD CONSTRAINT `fk_cellier_bout2` FOREIGN KEY (`id_cellier`) REFERENCES `celliers` (`id`);

--
-- Contraintes pour la table `consommations`
--
ALTER TABLE `consommations`
  ADD CONSTRAINT `fk_consommation` FOREIGN KEY (`id_bouteille`) REFERENCES `bouteilles` (`id`),
  ADD CONSTRAINT `fk_consommation2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
