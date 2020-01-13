-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for eiendomforsalg01
CREATE DATABASE IF NOT EXISTS `eiendomforsalg01` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `eiendomforsalg01`;

-- Dumping structure for table eiendomforsalg01.cities
CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table eiendomforsalg01.cities: ~0 rows (approximately)
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` (`id`, `city_name`, `status`) VALUES
	(1, 'goleko', 1);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;

-- Dumping structure for table eiendomforsalg01.enquire
CREATE TABLE IF NOT EXISTS `enquire` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table eiendomforsalg01.enquire: ~0 rows (approximately)
/*!40000 ALTER TABLE `enquire` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquire` ENABLE KEYS */;

-- Dumping structure for table eiendomforsalg01.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table eiendomforsalg01.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table eiendomforsalg01.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table eiendomforsalg01.migrations: ~11 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2015_12_10_065428_create_settings_table', 1),
	(4, '2015_12_25_133843_create_enquire_table', 1),
	(5, '2015_12_25_134328_create_partners_table', 1),
	(6, '2015_12_25_134629_create_properties_table', 1),
	(7, '2015_12_25_142242_create_slider_table', 1),
	(8, '2015_12_25_142436_create_subscriber_table', 1),
	(9, '2015_12_25_142619_create_testimonials_table', 1),
	(10, '2016_04_04_164203_create_cities_table', 1),
	(11, '2016_04_04_164227_create_property_types_table', 1),
	(12, '2019_08_19_000000_create_failed_jobs_table', 2),
	(13, '2020_01_02_201635_create_social_providers_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table eiendomforsalg01.partners
CREATE TABLE IF NOT EXISTS `partners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partner_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table eiendomforsalg01.partners: ~0 rows (approximately)
/*!40000 ALTER TABLE `partners` DISABLE KEYS */;
/*!40000 ALTER TABLE `partners` ENABLE KEYS */;

-- Dumping structure for table eiendomforsalg01.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table eiendomforsalg01.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table eiendomforsalg01.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL DEFAULT '0',
  `featured_property` int(11) NOT NULL DEFAULT '0',
  `property_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_purpose` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rent_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `map_latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bathrooms` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bedrooms` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `property_features` text COLLATE utf8mb4_unicode_ci,
  `featured_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_images1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_images2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_images3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_images4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_images5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table eiendomforsalg01.properties: ~0 rows (approximately)
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` (`id`, `user_id`, `city_id`, `featured_property`, `property_name`, `property_slug`, `property_type`, `property_purpose`, `sale_price`, `rent_price`, `address`, `map_latitude`, `map_longitude`, `bathrooms`, `bedrooms`, `area`, `description`, `property_features`, `featured_image`, `property_images1`, `property_images2`, `property_images3`, `property_images4`, `property_images5`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 0, 'properda', 'asdfsaf', '1', 'Sale', '1234124', '12312', 'abjdsauurh sdnjcnu asd jqwcjh ajnejfn asjfwe sjdnfiwe', NULL, NULL, '1', '1', '300', 'asbbsfsuiauis asdasdaj abisd fasddd asdbif abisdw asdbife asdmwn', 'iinternet', 'properda-421f6f72a1bbb03bf6b5de84d10f7c27', NULL, NULL, NULL, NULL, NULL, 1, '2020-01-02 19:08:51', '2020-01-07 19:10:27');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;

-- Dumping structure for table eiendomforsalg01.property_types
CREATE TABLE IF NOT EXISTS `property_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `types` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table eiendomforsalg01.property_types: ~0 rows (approximately)
/*!40000 ALTER TABLE `property_types` DISABLE KEYS */;
INSERT INTO `property_types` (`id`, `types`, `slug`) VALUES
	(1, 'rental', 'pro');
/*!40000 ALTER TABLE `property_types` ENABLE KEYS */;

-- Dumping structure for table eiendomforsalg01.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_style` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_favicon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_keywords` text COLLATE utf8mb4_unicode_ci,
  `site_header_code` text COLLATE utf8mb4_unicode_ci,
  `site_footer_code` text COLLATE utf8mb4_unicode_ci,
  `site_copyright` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_widget1` text COLLATE utf8mb4_unicode_ci,
  `footer_widget2` text COLLATE utf8mb4_unicode_ci,
  `footer_widget3` text COLLATE utf8mb4_unicode_ci,
  `addthis_share_code` text COLLATE utf8mb4_unicode_ci,
  `disqus_comment_code` text COLLATE utf8mb4_unicode_ci,
  `social_facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_gplus` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_us_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_us_description` text COLLATE utf8mb4_unicode_ci,
  `careers_with_us_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `careers_with_us_description` text COLLATE utf8mb4_unicode_ci,
  `terms_conditions_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms_conditions_description` text COLLATE utf8mb4_unicode_ci,
  `privacy_policy_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy_policy_description` text COLLATE utf8mb4_unicode_ci,
  `currency_sign` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table eiendomforsalg01.settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `site_style`, `site_name`, `site_email`, `site_logo`, `site_favicon`, `site_description`, `site_keywords`, `site_header_code`, `site_footer_code`, `site_copyright`, `footer_widget1`, `footer_widget2`, `footer_widget3`, `addthis_share_code`, `disqus_comment_code`, `social_facebook`, `social_twitter`, `social_linkedin`, `social_gplus`, `about_us_title`, `about_us_description`, `careers_with_us_title`, `careers_with_us_description`, `terms_conditions_title`, `terms_conditions_description`, `privacy_policy_title`, `privacy_policy_description`, `currency_sign`) VALUES
	(1, 'blue', 'Divine Home - Real Estate', 'admin@admin.com', 'logo.png', 'favicon.png', 'Easy Real Estates provide you with a quick and easy way to create a real estates site portal.', NULL, NULL, NULL, 'Copyright © 2015 Divine Home - Real Estate. All rights reserved.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table eiendomforsalg01.slider
CREATE TABLE IF NOT EXISTS `slider` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table eiendomforsalg01.slider: ~0 rows (approximately)
/*!40000 ALTER TABLE `slider` DISABLE KEYS */;
/*!40000 ALTER TABLE `slider` ENABLE KEYS */;

-- Dumping structure for table eiendomforsalg01.social_providers
CREATE TABLE IF NOT EXISTS `social_providers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table eiendomforsalg01.social_providers: ~0 rows (approximately)
/*!40000 ALTER TABLE `social_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_providers` ENABLE KEYS */;

-- Dumping structure for table eiendomforsalg01.subscriber
CREATE TABLE IF NOT EXISTS `subscriber` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table eiendomforsalg01.subscriber: ~0 rows (approximately)
/*!40000 ALTER TABLE `subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriber` ENABLE KEYS */;

-- Dumping structure for table eiendomforsalg01.testimonials
CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonial` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_user_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table eiendomforsalg01.testimonials: ~0 rows (approximately)
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;

-- Dumping structure for table eiendomforsalg01.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usertype` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gplus` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `confirmation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table eiendomforsalg01.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `usertype`, `name`, `email`, `password`, `phone`, `fax`, `city`, `about`, `facebook`, `twitter`, `gplus`, `linkedin`, `image_icon`, `status`, `confirmation_code`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin', 'admin@gmail.com', '$2y$10$6qlNS9DOMa56JyNs5T34SueBz7UVVvckdOmYxOdZEuQvSbXlbu0Kq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'jgBKhIPBn88NM6BqACW1TdIcWSTq3matNU9stBVOgdJbv5WNuoAVIOoTYRwl', '2019-05-29 06:46:58', '2019-12-20 20:36:29');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
