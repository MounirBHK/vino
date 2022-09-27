-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : lun. 26 sep. 2022 à 18:42
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
(12, 9, 'Cellier2', 100, '2022-09-15 22:08:44', '2022-09-15 22:08:44'),
(13, 9, 'Cellier3', 500, '2022-09-15 22:24:21', '2022-09-15 22:24:21'),
(14, 9, 'Cellier5', 500, '2022-09-15 22:25:28', '2022-09-15 22:25:28'),
(15, 9, 'cellier6', 5000, '2022-09-15 22:25:51', '2022-09-15 22:25:51'),
(17, 12, 'Cellier1', 100, '2022-09-26 18:20:38', '2022-09-26 18:20:38'),
(23, 11, 'Cellier1', 100, '2022-09-27 00:35:19', '2022-09-27 00:35:19');

-- --------------------------------------------------------

--
-- Structure de la table `cellier_bouts`
--

CREATE TABLE `cellier_bouts` (
  `id_cellier` bigint(20) UNSIGNED NOT NULL,
  `id_bouteille` bigint(20) UNSIGNED NOT NULL,
  `quantite` smallint(6) DEFAULT NULL,
  `desc_bout` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `derniere_trans` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cellier_bouts`
--

INSERT INTO `cellier_bouts` (`id_cellier`, `id_bouteille`, `quantite`, `desc_bout`, `derniere_trans`, `created_at`, `updated_at`) VALUES
(12, 1035, 5, NULL, '2022-09-16', '2022-09-16 19:28:00', '2022-09-16 19:28:00'),
(12, 1037, 2, NULL, '2022-09-19', '2022-09-19 23:59:04', '2022-09-19 23:59:04'),
(12, 1044, 1, NULL, '2022-09-19', '2022-09-19 23:58:09', '2022-09-19 23:58:09'),
(12, 1045, 1, NULL, '2022-09-19', '2022-09-20 00:00:20', '2022-09-20 00:00:20'),
(13, 1104, 3, NULL, '2022-09-19', '2022-09-20 00:03:48', '2022-09-20 00:03:48'),
(14, 1035, 1, NULL, '2022-09-19', '2022-09-19 22:43:27', '2022-09-19 22:43:27'),
(14, 1036, 1, NULL, '2022-09-19', '2022-09-19 22:44:44', '2022-09-19 22:44:44'),
(14, 1037, 1, NULL, '2022-09-19', '2022-09-19 22:52:19', '2022-09-19 22:52:19'),
(15, 1036, 2, NULL, '2022-09-19', '2022-09-19 22:52:44', '2022-09-19 22:52:44'),
(15, 1041, 1, NULL, '2022-09-19', '2022-09-19 23:03:18', '2022-09-19 23:03:18'),
(15, 1043, 1, NULL, '2022-09-19', '2022-09-19 22:57:20', '2022-09-19 22:57:20'),
(23, 1035, 1, NULL, '2022-09-26', '2022-09-27 01:41:08', '2022-09-27 01:41:08'),
(23, 1045, 1, NULL, '2022-09-26', '2022-09-27 00:51:23', '2022-09-27 00:51:23');

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
(35, 'App\\Models\\User', 11, 'auth_token', '2bb9c2a247aeacaa1562dfa4554279200c656b780f4ef1ec5294e59b9a40615d', '[\"*\"]', '2022-09-27 02:34:31', '2022-09-26 21:58:59', '2022-09-27 02:34:31');

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
(11, 'test2', 'test2@test.com', NULL, '$2y$10$67CtKH75aF5f60MBxidbO.0blpsk7bd8eThCGrPdOplrFaDMfJbpK', NULL, 'test', 'test', 'pOb6W22HniRGtxIRIjUkHbhcjCjyth6rYFLlRiZAdY9zPjQzFJZDkrmWrNLw', '2022-09-18 18:58:47', '2022-09-18 18:58:47'),
(12, 'test3', 'test3@test.com', NULL, '$2y$10$vSlTtkc9Y7DLWLLnPkdiDOX1m73zIRPfkv/6VrueZU036kAp0b4TS', NULL, 'test', 'test', '3YF8zscz9n396JfRc5LIEPvCRfoxPnd5DqkDs45so3Z3AbsXGeMkCcsyZhlM', '2022-09-23 18:08:59', '2022-09-23 18:08:59');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `celliers`
--
ALTER TABLE `celliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
