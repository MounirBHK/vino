-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : ven. 23 sep. 2022 à 09:09
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
(1035, 3, '1000 Stories Zinfandel Californie', 'https://www.saq.com/media/catalog/product/1/3/13584455-1_1578538222.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13584455', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', '29.50', 'https://www.saq.com/fr/13584455', 'https://www.saq.com/media/catalog/product/1/3/13584455-1_1578538222.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:04', '2022-09-16 00:53:04'),
(1036, 3, '11th Hour Cellars Pinot Noir', 'https://www.saq.com/media/catalog/product/1/3/13966470-1_1578546924.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13966470', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', '17.75', 'https://www.saq.com/fr/13966470', 'https://www.saq.com/media/catalog/product/1/3/13966470-1_1578546924.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:04', '2022-09-16 00:53:04'),
(1037, 3, '13th Street Winery Gamay 2019', 'https://www.saq.com/media/catalog/product/1/2/12705631-1_1582140016.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '12705631', 'Canada', 'Vin rouge | 750 ml | Canada', '20.15', 'https://www.saq.com/fr/12705631', 'https://www.saq.com/media/catalog/product/1/2/12705631-1_1582140016.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:04', '2022-09-16 00:53:04'),
(1038, 3, '14 Hands Cabernet-Sauvignon Columbia Valley', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', 'Y', '13876247', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', '16.00', 'https://www.saq.com/fr/13876247', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:04', '2022-09-16 00:53:04'),
(1039, 3, '19 Crimes Cabernet-Sauvignon Limestone Coast', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', 'Y', '12824197', 'Australie', 'Vin rouge | 750 ml | Australie', '19.95', 'https://www.saq.com/fr/12824197', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:04', '2022-09-16 00:53:04'),
(1040, 3, '19 Crimes Shiraz/Grenache/Mataro', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', 'Y', '12073995', 'Australie', 'Vin rouge | 750 ml | Australie', '19.95', 'https://www.saq.com/fr/12073995', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:04', '2022-09-16 00:53:04'),
(1041, 3, '19 Crimes The Uprising 2017', 'https://www.saq.com/media/catalog/product/1/3/13738012-1_1578541518.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13738012', 'Australie', 'Vin rouge | 750 ml | Australie', '18.80', 'https://www.saq.com/fr/13738012', 'https://www.saq.com/media/catalog/product/1/3/13738012-1_1578541518.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:04', '2022-09-16 00:53:04'),
(1042, 3, '19 Crimes The Warden 2017', 'https://www.saq.com/media/catalog/product/1/3/13846179-1_1578543327.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13846179', 'Australie', 'Vin rouge | 750 ml | Australie', '30.25', 'https://www.saq.com/fr/13846179', 'https://www.saq.com/media/catalog/product/1/3/13846179-1_1578543327.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:04', '2022-09-16 00:53:04'),
(1043, 3, '1938 - Depuis Un Esprit D\'exception Puisseguin Saint-Émilion 2016', 'https://www.saq.com/media/catalog/product/1/1/11655601-1_1634748032.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '11655601', 'France', 'Vin rouge | 750 ml | France', '26.90', 'https://www.saq.com/fr/11655601', 'https://www.saq.com/media/catalog/product/1/1/11655601-1_1634748032.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:04', '2022-09-16 00:53:04'),
(1044, 3, '3 Badge Leese-Fitch Merlot 2015', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', 'Y', '13523011', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', '18.85', 'https://www.saq.com/fr/13523011', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:04', '2022-09-16 00:53:04'),
(1045, 3, '3 de Valandraud 2016', 'https://www.saq.com/media/catalog/product/1/3/13392031-1_1578535218.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13392031', 'France', 'Vin rouge | 750 ml | France', '53.00', 'https://www.saq.com/fr/13392031', 'https://www.saq.com/media/catalog/product/1/3/13392031-1_1578535218.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:04', '2022-09-16 00:53:04'),
(1046, 3, '3 de Valandraud St-Émilion Grand Cru 2015', 'https://www.saq.com/media/catalog/product/1/4/14767616-1_1631204434.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14767616', 'France', 'Vin rouge | 750 ml | France', '51.50', 'https://www.saq.com/fr/14767616', 'https://www.saq.com/media/catalog/product/1/4/14767616-1_1631204434.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:04', '2022-09-16 00:53:04'),
(1048, 3, '350° de Bellevue 2019', 'https://www.saq.com/media/catalog/product/1/5/15004178-1_1659717339.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '15004178', 'France', 'Vin rouge | 750 ml | France', '44.50', 'https://www.saq.com/fr/15004178', 'https://www.saq.com/media/catalog/product/1/5/15004178-1_1659717339.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:04', '2022-09-16 00:53:04'),
(1049, 3, '4 Kilos Gallinas y Focas 2018', 'https://www.saq.com/media/catalog/product/1/3/13903479-1_1641851135.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13903479', 'Espagne', 'Vin rouge | 750 ml | Espagne', '35.00', 'https://www.saq.com/fr/13903479', 'https://www.saq.com/media/catalog/product/1/3/13903479-1_1641851135.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:04', '2022-09-16 00:53:04'),
(1050, 3, '655 Miles Cabernet Sauvignon Lodi', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', 'Y', '14139863', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', '15.25', 'https://www.saq.com/fr/14139863', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:04', '2022-09-16 00:53:04'),
(1051, 3, '7Colores Gran Reserva Valle Casablanca 2019', 'https://www.saq.com/media/catalog/product/1/4/14208427-1_1606227648.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14208427', 'Chili', 'Vin rouge | 750 ml | Chili', '17.10', 'https://www.saq.com/fr/14208427', 'https://www.saq.com/media/catalog/product/1/4/14208427-1_1606227648.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:04', '2022-09-16 00:53:04'),
(1054, 3, 'A Occhipinti Rosso Arcaico 2021', 'https://www.saq.com/media/catalog/product/1/4/14651867-1_1612271137.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14651867', 'Italie', 'Vin rouge | 750 ml | Italie', '30.75', 'https://www.saq.com/fr/14651867', 'https://www.saq.com/media/catalog/product/1/4/14651867-1_1612271137.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:04', '2022-09-16 00:53:04'),
(1055, 3, 'A thousand Lives Cabernet-Sauvignon Mendoza', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', 'Y', '14250211', 'Argentine', 'Vin rouge | 750 ml | Argentine', '10.60', 'https://www.saq.com/fr/14250211', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:04', '2022-09-16 00:53:04'),
(1057, 3, 'A. Christmann Pfalz Spätburgunder 2018', 'https://www.saq.com/media/catalog/product/1/4/14959941-1_1652993436.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14959941', 'Allemagne', 'Vin rouge | 750 ml | Allemagne', '32.50', 'https://www.saq.com/fr/14959941', 'https://www.saq.com/media/catalog/product/1/4/14959941-1_1652993436.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:04', '2022-09-16 00:53:04'),
(1058, 3, 'A.A. Badenhorst The Curator 2020', 'https://www.saq.com/media/catalog/product/1/2/12819435-1_1589314084.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '12819435', 'Afrique du Sud', 'Vin rouge | 750 ml | Afrique du Sud', '14.25', 'https://www.saq.com/fr/12819435', 'https://www.saq.com/media/catalog/product/1/2/12819435-1_1589314084.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:04', '2022-09-16 00:53:04'),
(1059, 3, 'Abad Dom Bueno Mencia Bierzo Joven 2019', 'https://www.saq.com/media/catalog/product/1/3/13794129-1_1626143125.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13794129', 'Espagne', 'Vin rouge | 750 ml | Espagne', '16.45', 'https://www.saq.com/fr/13794129', 'https://www.saq.com/media/catalog/product/1/3/13794129-1_1626143125.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:08', '2022-09-16 00:53:08'),
(1060, 3, 'Abbia Nova Senza Vandalismi Cesanese del Piglio 2021', 'https://www.saq.com/media/catalog/product/1/4/14497871-1_1623254467.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14497871', 'Italie', 'Vin rouge | 750 ml | Italie', '26.65', 'https://www.saq.com/fr/14497871', 'https://www.saq.com/media/catalog/product/1/4/14497871-1_1623254467.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:08', '2022-09-16 00:53:08'),
(1061, 3, 'Abreu Cappella Rutherford 2012', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', 'Y', '13319141', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', '967.75', 'https://www.saq.com/fr/13319141', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:08', '2022-09-16 00:53:08'),
(1064, 3, 'Abreu Thorevilos Napa Valley 2012', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', 'Y', '13319168', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', '967.75', 'https://www.saq.com/fr/13319168', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:08', '2022-09-16 00:53:08'),
(1065, 3, 'Accolade Wines Batch X Shiraz 2016', 'https://www.saq.com/media/catalog/product/1/3/13879923-1_1578544524.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13879923', 'Australie', 'Vin rouge | 750 ml | Australie', '20.00', 'https://www.saq.com/fr/13879923', 'https://www.saq.com/media/catalog/product/1/3/13879923-1_1578544524.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:08', '2022-09-16 00:53:08'),
(1066, 3, 'Adaras Calizo Almansa 2020', 'https://www.saq.com/media/catalog/product/1/4/14134368-1_1578552318.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14134368', 'Espagne', 'Vin rouge | 750 ml | Espagne', '18.00', 'https://www.saq.com/fr/14134368', 'https://www.saq.com/media/catalog/product/1/4/14134368-1_1578552318.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:08', '2022-09-16 00:53:08'),
(1067, 3, 'Adega De Pegões Colheita Seleccionada 2016', 'https://www.saq.com/media/catalog/product/1/3/13679892-1_1578540618.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13679892', 'Portugal', 'Vin rouge | 750 ml | Portugal', '18.75', 'https://www.saq.com/fr/13679892', 'https://www.saq.com/media/catalog/product/1/3/13679892-1_1578540618.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:08', '2022-09-16 00:53:08'),
(1068, 3, 'Adega de Penalva Dão', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', 'Y', '13746485', 'Portugal', 'Vin rouge | 750 ml | Portugal', '12.75', 'https://www.saq.com/fr/13746485', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:08', '2022-09-16 00:53:08'),
(1071, 3, 'Aglianico Donnachiara Irpinia 2018', 'https://www.saq.com/media/catalog/product/1/2/12001852-1_1580658610.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '12001852', 'Italie', 'Vin rouge | 750 ml | Italie', '23.10', 'https://www.saq.com/fr/12001852', 'https://www.saq.com/media/catalog/product/1/2/12001852-1_1580658610.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:08', '2022-09-16 00:53:08'),
(1072, 3, 'Agnès Paquet Auxey-Duresses 2020', 'https://www.saq.com/media/catalog/product/1/1/11510292-1_1661216134.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '11510292', 'France', 'Vin rouge | 750 ml | France', '45.25', 'https://www.saq.com/fr/11510292', 'https://www.saq.com/media/catalog/product/1/1/11510292-1_1661216134.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:08', '2022-09-16 00:53:08'),
(1073, 3, 'Agnes Paquet Bourgogne Pinot noir 2019', 'https://www.saq.com/media/catalog/product/1/1/11510268-1_1580622325.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '11510268', 'France', 'Vin rouge | 750 ml | France', '30.50', 'https://www.saq.com/fr/11510268', 'https://www.saq.com/media/catalog/product/1/1/11510268-1_1580622325.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:08', '2022-09-16 00:53:08'),
(1074, 3, 'Agostino Wines Uma Mendoza 2021', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', 'Y', '14501068', 'Argentine', 'Vin rouge | 750 ml | Argentine', '12.05', 'https://www.saq.com/fr/14501068', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:08', '2022-09-16 00:53:08'),
(1075, 3, 'Agricola Falset-Marca Ètim El Viatge Montsant 2019', 'https://www.saq.com/media/catalog/product/1/3/13800752-1_1578542425.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13800752', 'Espagne', 'Vin rouge | 750 ml | Espagne', '19.50', 'https://www.saq.com/fr/13800752', 'https://www.saq.com/media/catalog/product/1/3/13800752-1_1578542425.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:08', '2022-09-16 00:53:08'),
(1076, 3, 'Agro Turistica Marella Podere Marella Fiammetta Sangiovese 2018', 'https://www.saq.com/media/catalog/product/1/3/13675496-1_1578540321.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13675496', 'Italie', 'Vin rouge | 750 ml | Italie', '24.70', 'https://www.saq.com/fr/13675496', 'https://www.saq.com/media/catalog/product/1/3/13675496-1_1578540321.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:08', '2022-09-16 00:53:08'),
(1077, 3, 'Ah-So Red Navarra', 'https://www.saq.com/media/catalog/product/1/4/14715445-1_1623705128.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14715445', 'Espagne', 'Vin rouge | 250 ml | Espagne', '6.55', 'https://www.saq.com/fr/14715445', 'https://www.saq.com/media/catalog/product/1/4/14715445-1_1623705128.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '250 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:08', '2022-09-16 00:53:08'),
(1078, 3, 'Akarua Rua Pinot Noir 2021', 'https://www.saq.com/media/catalog/product/1/2/12205100-1_1650453034.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '12205100', 'Nouvelle-Zélande', 'Vin rouge | 750 ml | Nouvelle-Zélande', '28.60', 'https://www.saq.com/fr/12205100', 'https://www.saq.com/media/catalog/product/1/2/12205100-1_1650453034.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:08', '2022-09-16 00:53:08'),
(1079, 3, 'Al di là del Fiume Dagamo Colli Bolognesi 2021', 'https://www.saq.com/media/catalog/product/1/4/14460331-1_1590004537.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14460331', 'Italie', 'Vin rouge | 750 ml | Italie', '32.25', 'https://www.saq.com/fr/14460331', 'https://www.saq.com/media/catalog/product/1/4/14460331-1_1590004537.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:08', '2022-09-16 00:53:08'),
(1080, 3, 'Alain Brumont Madiran Tour Bouscassé 2019', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', 'Y', '12284303', 'France', 'Vin rouge | 750 ml | France', '18.80', 'https://www.saq.com/fr/12284303', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:08', '2022-09-16 00:53:08'),
(1081, 3, 'Alain Jaume Côtes du Rhône Grand Veneur 2019', 'https://www.saq.com/media/catalog/product/1/4/14278839-1_1630686035.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14278839', 'France', 'Vin rouge | 750 ml | France', '19.20', 'https://www.saq.com/fr/14278839', 'https://www.saq.com/media/catalog/product/1/4/14278839-1_1630686035.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:08', '2022-09-16 00:53:08'),
(1082, 3, 'Alain Lorieux Chinon Expression 2019', 'https://www.saq.com/media/catalog/product/8/7/873257-1_1629320456.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '873257', 'France', 'Vin rouge | 750 ml | France', '19.45', 'https://www.saq.com/fr/873257', 'https://www.saq.com/media/catalog/product/8/7/873257-1_1629320456.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:53:08', '2022-09-16 00:53:08'),
(1083, 3, 'Alamos Seleccion Malbec Mendoza 2018', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', 'Y', '11015726', 'Argentine', 'Vin rouge | 750 ml | Argentine', '17.55', 'https://www.saq.com/fr/11015726', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1084, 3, 'Albert Bichot Beaujolais Villages Mr No Sulfite', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/flg_small.png?width=20&height=20', 'Y', '14879546', 'France', 'Vin rouge | 750 ml | France', '15.95', 'https://www.saq.com/fr/14879546', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/flg_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1085, 3, 'Albert Bichot Bourgogne Hautes-Côtes de Nuit 2017', 'https://www.saq.com/media/catalog/product/1/4/14322650-1_1585159210.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14322650', 'France', 'Vin rouge | 750 ml | France', '28.50', 'https://www.saq.com/fr/14322650', 'https://www.saq.com/media/catalog/product/1/4/14322650-1_1585159210.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1086, 3, 'Albert Bichot Bourgogne Vieilles Vignes', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/flg_small.png?width=20&height=20', 'Y', '10667474', 'France', 'Vin rouge | 750 ml | France', '22.95', 'https://www.saq.com/fr/10667474', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/flg_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1087, 3, 'Albert Bichot Chambolle Musigny Premier Cru Les Sentiers 2017', 'https://www.saq.com/media/catalog/product/1/4/14207918-1_1578553820.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14207918', 'France', 'Vin rouge | 750 ml | France', '133.00', 'https://www.saq.com/fr/14207918', 'https://www.saq.com/media/catalog/product/1/4/14207918-1_1578553820.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1088, 3, 'Albert Bichot Domaine Adélie Mercurey Premier Cru Champs Martin 2019', 'https://www.saq.com/media/catalog/product/1/4/14571710-1_1644852637.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14571710', 'France', 'Vin rouge | 750 ml | France', '66.50', 'https://www.saq.com/fr/14571710', 'https://www.saq.com/media/catalog/product/1/4/14571710-1_1644852637.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1089, 3, 'Albert Bichot Domaine du Clos Frantin Gevrey Chambertin Les Murots 2019', 'https://www.saq.com/media/catalog/product/1/4/14800818-1_1638797729.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14800818', 'France', 'Vin rouge | 750 ml | France', '87.25', 'https://www.saq.com/fr/14800818', 'https://www.saq.com/media/catalog/product/1/4/14800818-1_1638797729.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1090, 3, 'Albert Bichot Domaine du Clos Frantin Vosne Romanée Premier Cru Les Malconsorts 2017', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', 'Y', '14124590', 'France', 'Vin rouge | 750 ml | France', '228.00', 'https://www.saq.com/fr/14124590', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1091, 3, 'Albert Bichot Domaine du Pavillon Aloxe-Corton 2018', 'https://www.saq.com/media/catalog/product/1/4/14123845-1_1578552027.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14123845', 'France', 'Vin rouge | 750 ml | France', '77.25', 'https://www.saq.com/fr/14123845', 'https://www.saq.com/media/catalog/product/1/4/14123845-1_1578552027.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1092, 3, 'Albert Bichot Domaine du Pavillon Beaune Les Epenottes 2018', 'https://www.saq.com/media/catalog/product/1/4/14800842-1_1643897132.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14800842', 'France', 'Vin rouge | 750 ml | France', '60.25', 'https://www.saq.com/fr/14800842', 'https://www.saq.com/media/catalog/product/1/4/14800842-1_1643897132.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1093, 3, 'Albert Bichot Domaine du Pavillon Pommard Premier cru Les Rugiens 2018', 'https://www.saq.com/media/catalog/product/1/4/14571744-1_1612365932.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14571744', 'France', 'Vin rouge | 750 ml | France', '152.25', 'https://www.saq.com/fr/14571744', 'https://www.saq.com/media/catalog/product/1/4/14571744-1_1612365932.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1094, 3, 'Albert Bichot Gevrey Chambertin Premier Cru Petite Chapelle 2018', 'https://www.saq.com/media/catalog/product/1/4/14568001-1_1604421784.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14568001', 'France', 'Vin rouge | 750 ml | France', '168.75', 'https://www.saq.com/fr/14568001', 'https://www.saq.com/media/catalog/product/1/4/14568001-1_1604421784.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1095, 3, 'Albert Bichot Horizon De Bichot Pinot Noir 2020', 'https://www.saq.com/media/catalog/product/1/3/13922080-1_1578546034.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13922080', 'France', 'Vin rouge | 750 ml | France', '19.30', 'https://www.saq.com/fr/13922080', 'https://www.saq.com/media/catalog/product/1/3/13922080-1_1578546034.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1096, 3, 'Albert Grivault Pommard Premier Cru Clos Blanc 2019', 'https://www.saq.com/media/catalog/product/1/3/13192806-1_1605810337.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13192806', 'France', 'Vin rouge | 750 ml | France', '84.50', 'https://www.saq.com/fr/13192806', 'https://www.saq.com/media/catalog/product/1/3/13192806-1_1605810337.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1097, 3, 'Albert Morot Beaune Premier Cru Les Bressandes 2020', 'https://www.saq.com/media/catalog/product/1/4/14978229-1_1659627967.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14978229', 'France', 'Vin rouge | 750 ml | France', '87.00', 'https://www.saq.com/fr/14978229', 'https://www.saq.com/media/catalog/product/1/4/14978229-1_1659627967.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1098, 3, 'Albert Morot Beaune Premier Cru Les Cent-Vignes 2018', 'https://www.saq.com/media/catalog/product/1/4/14817361-1_1634574945.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14817361', 'France', 'Vin rouge | 750 ml | France', '80.50', 'https://www.saq.com/fr/14817361', 'https://www.saq.com/media/catalog/product/1/4/14817361-1_1634574945.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1099, 3, 'Albert Morot Savigny les Beaune Premier Cru La Bataillère 2020', 'https://www.saq.com/media/catalog/product/1/4/14821281-1_1634654761.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14821281', 'France', 'Vin rouge | 750 ml | France', '70.00', 'https://www.saq.com/fr/14821281', 'https://www.saq.com/media/catalog/product/1/4/14821281-1_1634654761.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1100, 3, 'Albet i Noya Curios Tempranillo Classic 2020', 'https://www.saq.com/media/catalog/product/1/0/10985801-1_1580611220.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '10985801', 'Espagne', 'Vin rouge | 750 ml | Espagne', '18.65', 'https://www.saq.com/fr/10985801', 'https://www.saq.com/media/catalog/product/1/0/10985801-1_1580611220.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1101, 3, 'Albet i Noya Syrah CoL Lecció Penedès 2016', 'https://www.saq.com/media/catalog/product/1/4/14775851-1_1631132766.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14775851', 'Espagne', 'Vin rouge | 750 ml | Espagne', '35.25', 'https://www.saq.com/fr/14775851', 'https://www.saq.com/media/catalog/product/1/4/14775851-1_1631132766.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1102, 3, 'Albino Armani Ripasso Valpolicella Superiore 2019', 'https://www.saq.com/media/catalog/product/1/3/13893178-1_1578544817.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13893178', 'Italie', 'Vin rouge | 750 ml | Italie', '20.95', 'https://www.saq.com/fr/13893178', 'https://www.saq.com/media/catalog/product/1/3/13893178-1_1578544817.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1103, 3, 'Albino Rocca Barbaresco Ovello Vigna Loreto 2019', 'https://www.saq.com/media/catalog/product/1/3/13851980-1_1603295449.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13851980', 'Italie', 'Vin rouge | 750 ml | Italie', '89.75', 'https://www.saq.com/fr/13851980', 'https://www.saq.com/media/catalog/product/1/3/13851980-1_1603295449.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1104, 3, 'Alceno Monastrell Jumilla 2017', 'https://www.saq.com/media/catalog/product/1/4/14234094-1_1578554708.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14234094', 'Espagne', 'Vin rouge | 750 ml | Espagne', '17.40', 'https://www.saq.com/fr/14234094', 'https://www.saq.com/media/catalog/product/1/4/14234094-1_1578554708.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1105, 3, 'Aldeasona Tempranillo Castilla y Léon Crianza 2010', 'https://www.saq.com/media/catalog/product/1/3/13113160-1_1581314120.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13113160', 'Espagne', 'Vin rouge | 750 ml | Espagne', '38.50', 'https://www.saq.com/fr/13113160', 'https://www.saq.com/media/catalog/product/1/3/13113160-1_1581314120.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1106, 3, 'Aldo Conterno Conca Tre Pile 2018', 'https://www.saq.com/media/catalog/product/1/4/14581985-1_1604421791.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14581985', 'Italie', 'Vin rouge | 750 ml | Italie', '51.00', 'https://www.saq.com/fr/14581985', 'https://www.saq.com/media/catalog/product/1/4/14581985-1_1604421791.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-16 00:54:07', '2022-09-16 00:54:07'),
(1107, 3, '19 Crimes The Uprising', 'https://www.saq.com/media/catalog/product/1/4/14715293-1_1615248955.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14715293', 'Australie', 'Vin rouge | 375 ml | Australie', '9.10', 'https://www.saq.com/fr/14715293', 'https://www.saq.com/media/catalog/product/1/4/14715293-1_1615248955.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '375 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:20:59', '2022-09-20 20:20:59'),
(1108, 3, '3 Rings Shiraz 2018', 'https://www.saq.com/media/catalog/product/1/2/12815725-1_1603713617.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '12815725', 'Australie', 'Vin rouge | 750 ml | Australie', '22.75', 'https://www.saq.com/fr/12815725', 'https://www.saq.com/media/catalog/product/1/2/12815725-1_1603713617.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:20:59', '2022-09-20 20:20:59'),
(1109, 3, 'A Mandria di Signadore Patrimonio 2019', 'https://www.saq.com/media/catalog/product/1/4/14736271-1_1624654560.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14736271', 'France', 'Vin rouge | 750 ml | France', '42.00', 'https://www.saq.com/fr/14736271', 'https://www.saq.com/media/catalog/product/1/4/14736271-1_1624654560.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:20:59', '2022-09-20 20:20:59'),
(1110, 3, 'A Mandria di Signadore Patrimonio 2018', 'https://www.saq.com/media/catalog/product/1/1/11908161-1_1580629223.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '11908161', 'France', 'Vin rouge | 750 ml | France', '41.00', 'https://www.saq.com/fr/11908161', 'https://www.saq.com/media/catalog/product/1/1/11908161-1_1580629223.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:20:59', '2022-09-20 20:20:59'),
(1111, 3, 'A. & P. de Villaine La Fortune 2020', 'https://www.saq.com/media/catalog/product/9/1/918219-1_1580608218.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '918219', 'France', 'Vin rouge | 750 ml | France', '49.50', 'https://www.saq.com/fr/918219', 'https://www.saq.com/media/catalog/product/9/1/918219-1_1580608218.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:20:59', '2022-09-20 20:20:59'),
(1112, 2, '14 Hands Pinot Grigio Columbia Valley', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fv_small.png?width=20&height=20', 'Y', '13876271', 'États-Unis', 'Vin blanc | 750 ml | États-Unis', '14.95', 'https://www.saq.com/fr/13876271', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fv_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1113, 2, '14 Hands Pinot Gris Columbia Valley 2015', 'https://www.saq.com/media/catalog/product/1/3/13299881-1_1578444011.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13299881', 'États-Unis', 'Vin blanc | 750 ml | États-Unis', '20.00', 'https://www.saq.com/fr/13299881', 'https://www.saq.com/media/catalog/product/1/3/13299881-1_1578444011.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1114, 2, '1564 Natural White 2020', 'https://www.saq.com/media/catalog/product/1/4/14919843-1_1646679342.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14919843', 'Espagne', 'Vin blanc | 750 ml | Espagne', '21.95', 'https://www.saq.com/fr/14919843', 'https://www.saq.com/media/catalog/product/1/4/14919843-1_1646679342.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1115, 2, '19 Crimes Chardonnay South Eastern Australia', 'https://www.saq.com/media/catalog/product/1/4/14715306-1_1617037846.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14715306', 'Australie', 'Vin blanc | 375 ml | Australie', '9.15', 'https://www.saq.com/fr/14715306', 'https://www.saq.com/media/catalog/product/1/4/14715306-1_1617037846.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '375 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1116, 2, '19 Crimes Hard Chard', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ar_small.png?width=20&height=20', 'Y', '13624710', 'Australie', 'Vin blanc | 750 ml | Australie', '18.95', 'https://www.saq.com/fr/13624710', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ar_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1117, 2, '50 Degree Riesling Trocken Rheingau 2018', 'https://www.saq.com/media/catalog/product/1/4/14434336-1_1595256048.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14434336', 'Allemagne', 'Vin blanc | 750 ml | Allemagne', '17.95', 'https://www.saq.com/fr/14434336', 'https://www.saq.com/media/catalog/product/1/4/14434336-1_1595256048.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1118, 2, '50th Parallel Estate Pinot Gris 2018', 'https://www.saq.com/media/catalog/product/1/3/13962479-1_1578546918.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13962479', 'Canada', 'Vin blanc | 750 ml | Canada', '29.80', 'https://www.saq.com/fr/13962479', 'https://www.saq.com/media/catalog/product/1/3/13962479-1_1578546918.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1119, 2, 'A to Z Pinot Gris Willamette Valley 2016', 'https://www.saq.com/media/catalog/product/1/1/11334057-1_1580616023.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '11334057', 'États-Unis', 'Vin blanc | 750 ml | États-Unis', '23.95', 'https://www.saq.com/fr/11334057', 'https://www.saq.com/media/catalog/product/1/1/11334057-1_1580616023.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1120, 2, 'A&D Wines Monologo Arinto p24 2021', 'https://www.saq.com/media/catalog/product/1/4/14296666-1_1580258418.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14296666', 'Portugal', 'Vin blanc | 750 ml | Portugal', '18.60', 'https://www.saq.com/fr/14296666', 'https://www.saq.com/media/catalog/product/1/4/14296666-1_1580258418.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1121, 2, 'A&D Wines Singular Vinho Verde 2018', 'https://www.saq.com/media/catalog/product/1/4/14296674-1_1582736706.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14296674', 'Portugal', 'Vin blanc | 750 ml | Portugal', '22.20', 'https://www.saq.com/fr/14296674', 'https://www.saq.com/media/catalog/product/1/4/14296674-1_1582736706.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1122, 2, 'A. Christmann Pfalz Weissburgunder Gutswein 2020', 'https://www.saq.com/media/catalog/product/1/4/14951923-1_1652976345.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14951923', 'Allemagne', 'Vin blanc | 750 ml | Allemagne', '27.50', 'https://www.saq.com/fr/14951923', 'https://www.saq.com/media/catalog/product/1/4/14951923-1_1652976345.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1123, 2, 'A.A. Badenhorst The Curator 2020', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fv_small.png?width=20&height=20', 'Y', '12889126', 'Afrique du Sud', 'Vin blanc | 750 ml | Afrique du Sud', '14.50', 'https://www.saq.com/fr/12889126', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fv_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1124, 2, 'A.J. Adam Dhroner Riesling Trocken Mosel 2018', 'https://www.saq.com/media/catalog/product/1/4/14216101-1_1578554119.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14216101', 'Allemagne', 'Vin blanc | 750 ml | Allemagne', '32.25', 'https://www.saq.com/fr/14216101', 'https://www.saq.com/media/catalog/product/1/4/14216101-1_1578554119.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1125, 2, 'A.J. Adam Hofberg Kabinett Mosel 2020', 'https://www.saq.com/media/catalog/product/1/4/14216128-1_1578554119.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14216128', 'Allemagne', 'Vin blanc | 750 ml | Allemagne', '30.50', 'https://www.saq.com/fr/14216128', 'https://www.saq.com/media/catalog/product/1/4/14216128-1_1578554119.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1126, 2, 'A.J. Adam Hofberg Von Den Terrassen Mosel 2018', 'https://www.saq.com/media/catalog/product/1/4/14216144-1_1581086708.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14216144', 'Allemagne', 'Vin blanc | 750 ml | Allemagne', '43.25', 'https://www.saq.com/fr/14216144', 'https://www.saq.com/media/catalog/product/1/4/14216144-1_1581086708.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1127, 2, 'A.J. Adam Im Pfarrgarten Riesling Feinherb Gutswein Mosel 2020', 'https://www.saq.com/media/catalog/product/1/4/14216110-1_1578554119.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14216110', 'Allemagne', 'Vin blanc | 750 ml | Allemagne', '23.05', 'https://www.saq.com/fr/14216110', 'https://www.saq.com/media/catalog/product/1/4/14216110-1_1578554119.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1128, 2, 'A.J. Adam, Hofberg Spatlese 2018', 'https://www.saq.com/media/catalog/product/1/4/14216136-1_1578554119.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14216136', 'Allemagne', 'Vin blanc | 750 ml | Allemagne', '41.25', 'https://www.saq.com/fr/14216136', 'https://www.saq.com/media/catalog/product/1/4/14216136-1_1578554119.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1129, 2, 'AA Badenhorst Riviera Secateurs Swartland 2021', 'https://www.saq.com/media/catalog/product/1/3/13995027-1_1659561948.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13995027', 'Afrique du Sud', 'Vin blanc | 750 ml | Afrique du Sud', '21.00', 'https://www.saq.com/fr/13995027', 'https://www.saq.com/media/catalog/product/1/3/13995027-1_1659561948.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1130, 2, 'Abbaye de Valmagne Languedoc Portalis 2020', 'https://www.saq.com/media/catalog/product/1/4/14717002-1_1622473243.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14717002', 'France', 'Vin blanc | 750 ml | France', '21.00', 'https://www.saq.com/fr/14717002', 'https://www.saq.com/media/catalog/product/1/4/14717002-1_1622473243.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1131, 2, 'Abbazia Di Novacella Praepositus Kerner Alto Adige Valle Isarco 2017', 'https://www.saq.com/media/catalog/product/1/4/14035466-1_1578549912.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14035466', 'Italie', 'Vin blanc | 750 ml | Italie', '37.75', 'https://www.saq.com/fr/14035466', 'https://www.saq.com/media/catalog/product/1/4/14035466-1_1578549912.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1132, 2, 'Abbots & Delaunay Primo Vinum 2020', 'https://www.saq.com/media/catalog/product/1/4/14910030-1_1646337368.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14910030', 'France', 'Vin blanc | 750 ml | France', '18.10', 'https://www.saq.com/fr/14910030', 'https://www.saq.com/media/catalog/product/1/4/14910030-1_1646337368.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1133, 2, 'Adalia Singan Soave 2021', 'https://www.saq.com/media/catalog/product/1/3/13986008-1_1578547523.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13986008', 'Italie', 'Vin blanc | 750 ml | Italie', '23.80', 'https://www.saq.com/fr/13986008', 'https://www.saq.com/media/catalog/product/1/3/13986008-1_1578547523.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1134, 2, 'Adega de Pegões Colheita Seleccionada IGP Peninsula de Setubal', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ar_small.png?width=20&height=20', 'Y', '10838801', 'Portugal', 'Vin blanc | 750 ml | Portugal', '13.60', 'https://www.saq.com/fr/10838801', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ar_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1135, 2, 'Adega de Penalva Dão 2021', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fv_small.png?width=20&height=20', 'Y', '12728904', 'Portugal', 'Vin blanc | 750 ml | Portugal', '12.50', 'https://www.saq.com/fr/12728904', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fv_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:03', '2022-09-20 20:21:03'),
(1136, 1, 'AA Badenhorst Secateurs Rosé 2021', 'https://www.saq.com/media/catalog/product/1/3/13509252-1_1578537010.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13509252', 'Afrique du Sud', 'Vin rosé | 750 ml | Afrique du Sud', '18.00', 'https://www.saq.com/fr/13509252', 'https://www.saq.com/media/catalog/product/1/3/13509252-1_1578537010.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1137, 1, 'Aire de Protos Cigales 2020', 'https://www.saq.com/media/catalog/product/1/4/14453730-1_1588617319.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14453730', 'Espagne', 'Vin rosé | 750 ml | Espagne', '19.90', 'https://www.saq.com/fr/14453730', 'https://www.saq.com/media/catalog/product/1/4/14453730-1_1588617319.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1138, 1, 'AIX Coteaux d\'Aix en Provence 2021', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', 'Y', '13465114', 'France', 'Vin rosé | 750 ml | France', '20.65', 'https://www.saq.com/fr/13465114', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1139, 1, 'Ampeleia Rosato di Ampeleia 2020', 'https://www.saq.com/media/catalog/product/1/4/14977331-1_1647965462.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14977331', 'Italie', 'Vin rosé | 750 ml | Italie', '31.50', 'https://www.saq.com/fr/14977331', 'https://www.saq.com/media/catalog/product/1/4/14977331-1_1647965462.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1140, 1, 'Apoco Rosé Grenache Cinsault 2020', 'https://www.saq.com/media/catalog/product/1/4/14713001-1_1623705128.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14713001', 'France', 'Vin rosé | 250 ml | France', '6.00', 'https://www.saq.com/fr/14713001', 'https://www.saq.com/media/catalog/product/1/4/14713001-1_1623705128.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '250 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1141, 1, 'Astica Rosé', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', 'Y', '10385565', 'Argentine', 'Vin rosé | 750 ml | Argentine', '10.00', 'https://www.saq.com/fr/10385565', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1142, 1, 'Attems Ramato Pinot Grigio 2021', 'https://www.saq.com/media/catalog/product/1/3/13736092-1_1656438344.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13736092', 'Italie', 'Vin rosé | 750 ml | Italie', '20.45', 'https://www.saq.com/fr/13736092', 'https://www.saq.com/media/catalog/product/1/3/13736092-1_1656438344.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1143, 1, 'Azienda Agricola Gorgo di Roberta Bricolo Chiaretto di Bardolino 2021', 'https://www.saq.com/media/catalog/product/1/4/14676600-1_1659561949.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14676600', 'Italie', 'Vin rosé | 750 ml | Italie', '17.45', 'https://www.saq.com/fr/14676600', 'https://www.saq.com/media/catalog/product/1/4/14676600-1_1659561949.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1144, 1, 'Azienda Vinicola Umani Ronchi Centovie Colli Aprutini 2021', 'https://www.saq.com/media/catalog/product/1/4/14676079-1_1621436766.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14676079', 'Italie', 'Vin rosé | 750 ml | Italie', '19.00', 'https://www.saq.com/fr/14676079', 'https://www.saq.com/media/catalog/product/1/4/14676079-1_1621436766.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07');
INSERT INTO `bouteilles` (`id`, `id_type`, `nom_bouteille`, `image`, `listed`, `code_saq`, `pays`, `description`, `prix_saq`, `url_saq`, `url_img`, `format`, `degre_alcool`, `producteur`, `region`, `millesime`, `created_at`, `updated_at`) VALUES
(1145, 1, 'Barefoot Pink Moscato', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fd_small.png?width=20&height=20', 'Y', '13567241', 'États-Unis', 'Vin rosé | 750 ml | États-Unis', '10.85', 'https://www.saq.com/fr/13567241', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fd_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1146, 1, 'Baron Herzog White Zinfandel 2020', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fd_small.png?width=20&height=20', 'Y', '10348334', 'États-Unis', 'Vin rosé | 750 ml | États-Unis', '13.45', 'https://www.saq.com/fr/10348334', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fd_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1147, 1, 'Barton & Guestier Côtes-de-Provence Tourmaline 2021', 'https://www.saq.com/media/catalog/product/1/4/14718582-1_1626728732.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14718582', 'France', 'Vin rosé | 750 ml | France', '23.45', 'https://www.saq.com/fr/14718582', 'https://www.saq.com/media/catalog/product/1/4/14718582-1_1626728732.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1148, 1, 'Barton & Guestier Cuvée Spéciale', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', 'Y', '13567356', 'France', 'Vin rosé | 750 ml | France', '11.95', 'https://www.saq.com/fr/13567356', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1149, 1, 'Barton & Guestier Réserve Pays d\'Oc 2021', 'https://www.saq.com/media/catalog/product/1/4/14979555-1_1654098644.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14979555', 'France', 'Vin rosé | 750 ml | France', '14.45', 'https://www.saq.com/fr/14979555', 'https://www.saq.com/media/catalog/product/1/4/14979555-1_1654098644.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1150, 1, 'Bastide de la Ciselette Lou Pigna Bandol 2021', 'https://www.saq.com/media/catalog/product/1/3/13518917-1_1590614717.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13518917', 'France', 'Vin rosé | 750 ml | France', '23.20', 'https://www.saq.com/fr/13518917', 'https://www.saq.com/media/catalog/product/1/3/13518917-1_1590614717.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1151, 1, 'Bastide de la Ciselette Bandol 2021', 'https://www.saq.com/media/catalog/product/1/3/13184056-1_1581315029.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13184056', 'France', 'Vin rosé | 750 ml | France', '26.50', 'https://www.saq.com/fr/13184056', 'https://www.saq.com/media/catalog/product/1/3/13184056-1_1581315029.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1152, 1, 'Beringer Main & Vine White Zinfandel', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fd_small.png?width=20&height=20', 'Y', '10845808', 'États-Unis', 'Vin rosé | 750 ml | États-Unis', '11.35', 'https://www.saq.com/fr/10845808', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fd_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1153, 1, 'Bernard Magrez Bleu de Mer 2020', 'https://www.saq.com/media/catalog/product/1/4/14451101-1_1639001457.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14451101', 'France', 'Vin rosé | 750 ml | France', '19.75', 'https://www.saq.com/fr/14451101', 'https://www.saq.com/media/catalog/product/1/4/14451101-1_1639001457.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1154, 1, 'Bodega Villa d\'Orta Rosado 2021', 'https://www.saq.com/media/catalog/product/1/3/13211851-1_1578442510.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '13211851', 'Espagne', 'Vin rosé | 750 ml | Espagne', '17.05', 'https://www.saq.com/fr/13211851', 'https://www.saq.com/media/catalog/product/1/3/13211851-1_1578442510.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1155, 1, 'Bodegas Valdemar Conde Valdemar 2021', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/flg_small.png?width=20&height=20', 'Y', '12217821', 'Espagne', 'Vin rosé | 750 ml | Espagne', '14.90', 'https://www.saq.com/fr/12217821', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/flg_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1156, 1, 'Bodegas Volver Actea 2021', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/flg_small.png?width=20&height=20', 'Y', '14396659', 'Espagne', 'Vin rosé | 750 ml | Espagne', '11.90', 'https://www.saq.com/fr/14396659', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/flg_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1157, 1, 'Bonny Doon Vineyard Vin Gris de Cigare 2021', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', 'Y', '10262979', 'États-Unis', 'Vin rosé | 750 ml | États-Unis', '19.95', 'https://www.saq.com/fr/10262979', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1158, 1, 'Borsao Seleccion Campo de Borja', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', 'Y', '10754201', 'Espagne', 'Vin rosé | 750 ml | Espagne', '13.10', 'https://www.saq.com/fr/10754201', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07'),
(1159, 1, 'Bourgueil Rosé de Minière 2021', 'https://www.saq.com/media/catalog/product/1/4/14678138-1_1652403337.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', 'Y', '14678138', 'France', 'Vin rosé | 750 ml | France', '20.00', 'https://www.saq.com/fr/14678138', 'https://www.saq.com/media/catalog/product/1/4/14678138-1_1652403337.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', NULL, NULL, NULL, NULL, '2022-09-20 20:21:07', '2022-09-20 20:21:07');

-- --------------------------------------------------------

--
-- Structure de la table `celliers`
--

CREATE TABLE `celliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `lib_cellier` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacite` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `celliers`
--

INSERT INTO `celliers` (`id`, `id_user`, `lib_cellier`, `capacite`, `created_at`, `updated_at`) VALUES
(11, 9, 'Cellier1', 200, '2022-09-15 22:07:27', '2022-09-15 22:07:27'),
(12, 9, 'Cellier2', 100, '2022-09-15 22:08:44', '2022-09-15 22:08:44'),
(13, 9, 'Cellier3', 500, '2022-09-15 22:24:21', '2022-09-15 22:24:21'),
(14, 9, 'Cellier5', 500, '2022-09-15 22:25:28', '2022-09-15 22:25:28'),
(15, 9, 'cellier6', 5000, '2022-09-15 22:25:51', '2022-09-15 22:25:51'),
(16, 9, 'Cellier7', 300, '2022-09-16 19:08:46', '2022-09-16 19:08:46');

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
(11, 1035, 11, '2022-09-16', '2022-09-16 16:45:09', '2022-09-16 16:45:09'),
(11, 1036, 8, '2022-09-19', '2022-09-19 17:25:27', '2022-09-19 17:25:27'),
(11, 1043, 2, '2022-09-19', '2022-09-19 21:17:34', '2022-09-19 21:17:34'),
(11, 1044, 1, '2022-09-19', '2022-09-19 23:31:45', '2022-09-19 23:31:45'),
(11, 1049, 1, '2022-09-19', '2022-09-20 00:15:11', '2022-09-20 00:15:11'),
(11, 1057, 1, '2022-09-20', '2022-09-20 17:31:28', '2022-09-20 17:31:28'),
(11, 1059, 4, '2022-09-19', '2022-09-20 00:34:57', '2022-09-20 00:34:57'),
(11, 1081, 1, '2022-09-19', '2022-09-20 00:35:02', '2022-09-20 00:35:02'),
(11, 1084, 2, '2022-09-19', '2022-09-20 00:35:06', '2022-09-20 00:35:06'),
(11, 1099, 1, '2022-09-19', '2022-09-19 23:35:46', '2022-09-19 23:35:46'),
(12, 1035, 5, '2022-09-16', '2022-09-16 19:28:00', '2022-09-16 19:28:00'),
(12, 1037, 2, '2022-09-19', '2022-09-19 23:59:04', '2022-09-19 23:59:04'),
(12, 1044, 1, '2022-09-19', '2022-09-19 23:58:09', '2022-09-19 23:58:09'),
(12, 1045, 1, '2022-09-19', '2022-09-20 00:00:20', '2022-09-20 00:00:20'),
(13, 1104, 3, '2022-09-19', '2022-09-20 00:03:48', '2022-09-20 00:03:48'),
(14, 1035, 1, '2022-09-19', '2022-09-19 22:43:27', '2022-09-19 22:43:27'),
(14, 1036, 1, '2022-09-19', '2022-09-19 22:44:44', '2022-09-19 22:44:44'),
(14, 1037, 1, '2022-09-19', '2022-09-19 22:52:19', '2022-09-19 22:52:19'),
(15, 1036, 2, '2022-09-19', '2022-09-19 22:52:44', '2022-09-19 22:52:44'),
(15, 1041, 1, '2022-09-19', '2022-09-19 23:03:18', '2022-09-19 23:03:18'),
(15, 1043, 1, '2022-09-19', '2022-09-19 22:57:20', '2022-09-19 22:57:20'),
(16, 1035, 1, '2022-09-19', '2022-09-19 22:59:26', '2022-09-19 22:59:26'),
(16, 1036, 1, '2022-09-19', '2022-09-19 22:58:46', '2022-09-19 22:58:46'),
(16, 1038, 1, '2022-09-19', '2022-09-19 23:05:16', '2022-09-19 23:05:16'),
(16, 1039, 2, '2022-09-19', '2022-09-19 22:58:05', '2022-09-19 22:58:05'),
(16, 1040, 1, '2022-09-19', '2022-09-19 23:23:10', '2022-09-19 23:23:10'),
(16, 1044, 1, '2022-09-19', '2022-09-19 23:31:25', '2022-09-19 23:31:25'),
(16, 1045, 1, '2022-09-19', '2022-09-19 23:13:46', '2022-09-19 23:13:46'),
(16, 1058, 1, '2022-09-19', '2022-09-19 23:16:59', '2022-09-19 23:16:59'),
(16, 1072, 1, '2022-09-19', '2022-09-19 23:24:15', '2022-09-19 23:24:15');

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
(14, 'App\\Models\\User', 9, 'auth_token', '186fa6b5cfd184c4ced4bb52df53963486323c68a5a943af373f9fb5cf17de2b', '[\"*\"]', '2022-09-23 17:06:11', '2022-09-23 02:37:23', '2022-09-23 17:06:11');

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
  `temp_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `temp_password`, `prenom`, `nom`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'Admin', 'admin@admin.com', NULL, '$2y$10$LAchjUWRx02IHMFTzqcwHeIzyBpizFTX.mXT466KgOhUSuGKTsxQO', NULL, 'Admin', 'Admin', 'nsl7tBasf37jtkAyH70Xzw5A9C8uZ9SMjNO8on1mBCtPS97x0FzNas8V5YT2', '2022-09-10 22:47:58', '2022-09-10 22:47:58'),
(9, 'testssss', 'user1@vino.com', NULL, '$2y$10$AFiNyXfVCcaJkOrXMggxPeqNMLPrrirC2SNVDAHQeJyDS6lsJ4qc.', 'nDa1NGwxUtxtKro2rBdbzHbHtmRLAGERJxIOtzbJfWGijvR6FY', 'test', 'test', 'QUe9hKKkVNwuIFjogFNpfWq7iss6zd4Jg7UHrgP1Fy2Qmzbf4cmdug5kHAA3', '2022-09-15 21:14:21', '2022-09-23 17:05:06'),
(10, 'test2', 'test@test.com', NULL, '$2y$10$xvFKQTDBzRJdfHPaKWeLdudscIrHvG1q5gHixuIUsZ1BFzXsXXpey', NULL, 'test', 'test', 'ekTbW8jdO0RXUyLNPVYM5I5Y48QiFgQWf6TyNl5VqQFkqD1qtFEjSEwhma5N', '2022-09-18 18:51:46', '2022-09-18 18:51:46'),
(11, 'test2', 'test2@test.com', NULL, '$2y$10$67CtKH75aF5f60MBxidbO.0blpsk7bd8eThCGrPdOplrFaDMfJbpK', NULL, 'test', 'test', NULL, '2022-09-18 18:58:47', '2022-09-18 18:58:47');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1160;

--
-- AUTO_INCREMENT pour la table `celliers`
--
ALTER TABLE `celliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
