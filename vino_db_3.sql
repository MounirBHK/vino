-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : ven. 02 sep. 2022 à 15:23
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
-- Base de données : `vino_db_2`
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
  `prix_achat` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bouteilles`
--

CREATE TABLE `bouteilles` (
  `id_bouteille` bigint(20) UNSIGNED NOT NULL,
  `id_type` bigint(20) UNSIGNED NOT NULL,
  `nom_bouteille` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `millesime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `bouteilles`
--

INSERT INTO `bouteilles` (`id_bouteille`, `id_type`, `nom_bouteille`, `image`, `code_saq`, `pays`, `description`, `prix_saq`, `url_saq`, `url_img`, `format`, `degre_alcool`, `producteur`, `region`, `millesime`) VALUES
(1, 1, 'Chateau Margot', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg/280px-Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg', 'sdvsv3463', 'France', 'dlkjvhskdv', '15.00', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg/280px-Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg', '750', 13, 'test', 'Bordeaux', 1980),
(2, 2, 'Chateau Margot', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg/280px-Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg', 'sdvsv3463', 'France', 'dlkjvhskdv', '40.00', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg/280px-Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg', '900', 15, 'test', 'Bordeaux', 1988),
(3, 3, 'Chateau Margot', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg/280px-Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg', 'sdvsv3463', 'France', 'dlkjvhskdv', '20.00', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg/280px-Glass_of_Red_Wine_with_a_bottle_of_Red_Wine_-_Evan_Swigart.jpg', '750', 13, 'test', 'Bordeaux', 1998);

-- --------------------------------------------------------

--
-- Structure de la table `celliers`
--

CREATE TABLE `celliers` (
  `id_cellier` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `lib_cellier` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nbr_colonne` smallint(6) DEFAULT NULL,
  `nbr_ligne` smallint(6) DEFAULT NULL,
  `capacite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `celliers`
--

INSERT INTO `celliers` (`id_cellier`, `id_user`, `lib_cellier`, `nbr_colonne`, `nbr_ligne`, `capacite`) VALUES
(1, 1, 'cellier_user1', NULL, NULL, 160),
(2, 1, 'cellier_user2', NULL, NULL, 260),
(3, 2, 'cellier_user3', NULL, NULL, 450),
(4, 3, 'cellier_user4', NULL, NULL, 585),
(5, 4, 'cellier_user5', NULL, NULL, 640);

-- --------------------------------------------------------

--
-- Structure de la table `cellier_bouts`
--

CREATE TABLE `cellier_bouts` (
  `id_cellier` bigint(20) UNSIGNED NOT NULL,
  `id_bouteille` bigint(20) UNSIGNED NOT NULL,
  `quantite` smallint(6) DEFAULT NULL,
  `derniere_trans` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cellier_bouts`
--

INSERT INTO `cellier_bouts` (`id_cellier`, `id_bouteille`, `quantite`, `derniere_trans`) VALUES
(1, 1, 21, '2022-08-16'),
(1, 2, 10, '2022-08-15'),
(1, 3, 5, '2022-08-18'),
(2, 1, 40, '2022-08-20'),
(2, 3, 17, '2022-08-20'),
(3, 1, 20, '2022-08-16'),
(3, 2, 10, '2022-08-15'),
(3, 3, 5, '2022-08-18'),
(4, 1, 40, '2022-08-20'),
(5, 2, 2, '2022-08-30'),
(5, 3, 27, '2022-08-20');

-- --------------------------------------------------------

--
-- Structure de la table `consommations`
--

CREATE TABLE `consommations` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_bouteille` bigint(20) UNSIGNED NOT NULL,
  `date_consommation` datetime NOT NULL,
  `quantite_cons` smallint(6) DEFAULT NULL
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

-- --------------------------------------------------------

--
-- Structure de la table `types`
--

CREATE TABLE `types` (
  `id_type` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `types`
--

INSERT INTO `types` (`id_type`, `type`) VALUES
(1, 'Vin Rose'),
(2, 'Vin Blanc'),
(3, 'Vin Rouge');

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
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Brycen Kunde PhD', 'fbalistreri@example.org', '2022-09-02 22:09:23', '$2y$10$3Kn/TXzCHNZ7ZGmRVzn92.sihZngwAb/OMFMiffEa9mN3uAoGiWLq', 'tHWgWOYw1W', '2022-09-02 22:09:23', '2022-09-02 22:09:23'),
(2, 'Prof. Jensen Parker', 'qhagenes@example.org', '2022-09-02 23:14:21', '$2y$10$zUwkF/EGk70bLMXm7e2JwOqHQwMWuYiPq5NFPZHJVcGsnyNHW5TCy', 'ldTbSTqzJE', '2022-09-02 23:14:21', '2022-09-02 23:14:21'),
(3, 'Rocio Schimmel', 'tbradtke@example.net', '2022-09-02 23:14:21', '$2y$10$TemRmoGoI1NJ4ubuyftwSe/kN/lXnY2Fl2njl.OPuIG24qoBpmLz6', 'kTLnZ03RyG', '2022-09-02 23:14:21', '2022-09-02 23:14:21'),
(4, 'Mr. Coleman Conroy II', 'aorn@example.net', '2022-09-02 23:14:21', '$2y$10$EyDuI2Tb170/TBer8Actn.jbQre9cVo3DRVn2X6K.sazfhBvmO3va', 'DHHudbbYLy', '2022-09-02 23:14:21', '2022-09-02 23:14:21');

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
  ADD PRIMARY KEY (`id_bouteille`),
  ADD KEY `fk_appartenir` (`id_type`);

--
-- Index pour la table `celliers`
--
ALTER TABLE `celliers`
  ADD PRIMARY KEY (`id_cellier`),
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
  ADD PRIMARY KEY (`id_type`);

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
  MODIFY `id_bouteille` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `celliers`
--
ALTER TABLE `celliers`
  MODIFY `id_cellier` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `types`
--
ALTER TABLE `types`
  MODIFY `id_type` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `achats`
--
ALTER TABLE `achats`
  ADD CONSTRAINT `fk_achat` FOREIGN KEY (`id_bouteille`) REFERENCES `bouteilles` (`id_bouteille`),
  ADD CONSTRAINT `fk_achat2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `bouteilles`
--
ALTER TABLE `bouteilles`
  ADD CONSTRAINT `fk_appartenir` FOREIGN KEY (`id_type`) REFERENCES `types` (`id_type`);

--
-- Contraintes pour la table `celliers`
--
ALTER TABLE `celliers`
  ADD CONSTRAINT `fk_avoir` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `cellier_bouts`
--
ALTER TABLE `cellier_bouts`
  ADD CONSTRAINT `fk_cellier_bout` FOREIGN KEY (`id_bouteille`) REFERENCES `bouteilles` (`id_bouteille`),
  ADD CONSTRAINT `fk_cellier_bout2` FOREIGN KEY (`id_cellier`) REFERENCES `celliers` (`id_cellier`);

--
-- Contraintes pour la table `consommations`
--
ALTER TABLE `consommations`
  ADD CONSTRAINT `fk_consommation` FOREIGN KEY (`id_bouteille`) REFERENCES `bouteilles` (`id_bouteille`),
  ADD CONSTRAINT `fk_consommation2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
