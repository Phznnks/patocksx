-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.25-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for vrp
CREATE DATABASE IF NOT EXISTS `vrp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `vrp`;

-- Dumping structure for table vrp.vrp_account
CREATE TABLE IF NOT EXISTS `vrp_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steam` varchar(50) NOT NULL,
  `whitelisted` tinyint(1) DEFAULT 0,
  `banned` tinyint(1) DEFAULT 0,
  `chars` int(1) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vrp.vrp_account: ~0 rows (approximately)

-- Dumping structure for table vrp.vrp_homes_permissions
CREATE TABLE IF NOT EXISTS `vrp_homes_permissions` (
  `owner` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `garage` int(11) NOT NULL,
  `home` varchar(100) NOT NULL DEFAULT '',
  `tax` varchar(24) NOT NULL DEFAULT '',
  `chestSize` int(11) DEFAULT NULL,
  `slotsChest` int(11) NOT NULL DEFAULT 15
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vrp.vrp_homes_permissions: ~0 rows (approximately)

-- Dumping structure for table vrp.vrp_priority
CREATE TABLE IF NOT EXISTS `vrp_priority` (
  `priority` int(10) DEFAULT NULL,
  `steam` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table vrp.vrp_priority: ~0 rows (approximately)

-- Dumping structure for table vrp.vrp_srv_data
CREATE TABLE IF NOT EXISTS `vrp_srv_data` (
  `dkey` varchar(100) NOT NULL,
  `dvalue` text DEFAULT NULL,
  PRIMARY KEY (`dkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vrp.vrp_srv_data: ~0 rows (approximately)

-- Dumping structure for table vrp.vrp_users
CREATE TABLE IF NOT EXISTS `vrp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steam` varchar(100) DEFAULT NULL,
  `deleted` int(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vrp.vrp_users: ~0 rows (approximately)

-- Dumping structure for table vrp.vrp_user_data
CREATE TABLE IF NOT EXISTS `vrp_user_data` (
  `user_id` int(11) NOT NULL,
  `dkey` varchar(100) NOT NULL,
  `dvalue` text DEFAULT NULL,
  PRIMARY KEY (`user_id`,`dkey`),
  CONSTRAINT `fk_user_data_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vrp.vrp_user_data: ~0 rows (approximately)

-- Dumping structure for table vrp.vrp_user_identities
CREATE TABLE IF NOT EXISTS `vrp_user_identities` (
  `user_id` int(11) NOT NULL,
  `registration` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `age2` varchar(50) DEFAULT NULL,
  `foto` varchar(200) DEFAULT NULL,
  `foragido` int(1) NOT NULL DEFAULT 0,
  `license` int(1) NOT NULL DEFAULT 1,
  `gunLimit` int(1) NOT NULL DEFAULT 0,
  `linked_image` varchar(250) NOT NULL DEFAULT '0',
  `surname` varchar(50) NOT NULL DEFAULT '',
  `chavePix` varchar(255) DEFAULT NULL,
  `profilepicture` longtext DEFAULT NULL,
  `background` longtext DEFAULT NULL,
  `iban` longtext DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `registration` (`registration`),
  KEY `phone` (`phone`),
  CONSTRAINT `fk_user_identities_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vrp.vrp_user_identities: ~0 rows (approximately)

-- Dumping structure for table vrp.vrp_user_ids
CREATE TABLE IF NOT EXISTS `vrp_user_ids` (
  `identifier` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`identifier`),
  KEY `fk_user_ids_users` (`user_id`),
  CONSTRAINT `fk_user_ids_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vrp.vrp_user_ids: ~0 rows (approximately)

-- Dumping structure for table vrp.vrp_user_vehicles
CREATE TABLE IF NOT EXISTS `vrp_user_vehicles` (
  `user_id` int(11) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `plate` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `arrest` int(1) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `premiumtime` int(11) NOT NULL DEFAULT 0,
  `rentaltime` int(11) NOT NULL DEFAULT 0,
  `engine` int(4) NOT NULL DEFAULT 1000,
  `body` int(4) NOT NULL DEFAULT 1000,
  `fuel` int(3) NOT NULL DEFAULT 100,
  `work` varchar(10) NOT NULL DEFAULT 'false',
  `doors` varchar(254) NOT NULL,
  `windows` varchar(254) NOT NULL,
  `tyres` varchar(254) NOT NULL,
  `alugado` tinyint(4) NOT NULL DEFAULT 0,
  `data_alugado` text DEFAULT NULL,
  `stoled_by` text DEFAULT NULL,
  `stoled_at` text DEFAULT NULL,
  `garage` int(11) DEFAULT NULL,
  `ipva` int(11) DEFAULT NULL,
  `financiado` int(255) DEFAULT NULL,
  `tax` int(50) DEFAULT NULL,
  `estado` text DEFAULT '[]',
  PRIMARY KEY (`user_id`,`vehicle`),
  KEY `user_id` (`user_id`),
  KEY `vehicle` (`vehicle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vrp.vrp_user_vehicles: ~0 rows (approximately)

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela vrp.vrp_user_moneys
DROP TABLE IF EXISTS `vrp_user_moneys`;
CREATE TABLE IF NOT EXISTS `vrp_user_moneys` (
  `user_id` int(11) NOT NULL,
  `wallet` int(11) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `pix` varchar(25) DEFAULT NULL,
  `paypal` int(11) DEFAULT 0,
  `coin` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_moneys_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- A despejar estrutura para tabela vrp.vrp_multas
CREATE TABLE IF NOT EXISTS `vrp_multas` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `user_id` int(8) NOT NULL,
  `valor` int(4) NOT NULL,
  `motivo` text NOT NULL,
  `data` varchar(28) NOT NULL,
  `descricao` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

CREATE TABLE IF NOT EXISTS `fw_chest` (
  `nome` varchar(50) DEFAULT NULL,
  `permissao` varchar(50) DEFAULT NULL,
  `x` text NOT NULL,
  `y` text NOT NULL,
  `z` text NOT NULL,
  `peso` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela fiveware.fw_homes
CREATE TABLE IF NOT EXISTS `fw_homes` (
  `owner` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `garage` int(11) NOT NULL,
  `home` varchar(100) NOT NULL DEFAULT '',
  `tax` varchar(24) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- A despejar estrutura para tabela vrp.vrp_user_extracts
CREATE TABLE IF NOT EXISTS `vrp_user_extracts` (
  `user_id` varchar(50) DEFAULT NULL,
  `valor` varchar(50) DEFAULT NULL,
  `descricao` tinytext DEFAULT NULL,
  `text` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

CREATE TABLE IF NOT EXISTS `smartphone_bank_invoices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payee_id` int(11) NOT NULL,
  `payer_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL DEFAULT '',
  `value` int(11) NOT NULL,
  `paid` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_bank_invoices: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_bank_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_bank_invoices` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_blocks
CREATE TABLE IF NOT EXISTS `smartphone_blocks` (
  `user_id` int(11) NOT NULL,
  `phone` varchar(32) NOT NULL,
  PRIMARY KEY (`user_id`,`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_blocks: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_blocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_blocks` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_calls
CREATE TABLE IF NOT EXISTS `smartphone_calls` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `initiator` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `status` varchar(255) NOT NULL,
  `video` tinyint(4) NOT NULL DEFAULT 0,
  `anonymous` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `initiator_index` (`initiator`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_calls: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_calls` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_contacts
CREATE TABLE IF NOT EXISTS `smartphone_contacts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_index` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_contacts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_contacts` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_gallery
CREATE TABLE IF NOT EXISTS `smartphone_gallery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `folder` varchar(255) NOT NULL DEFAULT '/',
  `url` varchar(255) NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_gallery: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_gallery` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_ifood_orders
CREATE TABLE IF NOT EXISTS `smartphone_ifood_orders` (
  `id` varchar(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `fee` int(11) DEFAULT NULL,
  `rate` tinyint(4) DEFAULT 0,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_ifood_orders: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_ifood_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_ifood_orders` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_instagram
CREATE TABLE IF NOT EXISTS `smartphone_instagram` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bio` varchar(255) NOT NULL,
  `avatarURL` varchar(255) DEFAULT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_instagram: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_instagram` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_instagram` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_instagram_followers
CREATE TABLE IF NOT EXISTS `smartphone_instagram_followers` (
  `follower_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`follower_id`,`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_instagram_followers: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_instagram_followers` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_instagram_followers` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_instagram_likes
CREATE TABLE IF NOT EXISTS `smartphone_instagram_likes` (
  `post_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`post_id`,`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_instagram_likes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_instagram_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_instagram_likes` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_instagram_notifications
CREATE TABLE IF NOT EXISTS `smartphone_instagram_notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `content` varchar(512) NOT NULL,
  `saw` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_id_index` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_instagram_notifications: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_instagram_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_instagram_notifications` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_instagram_posts
CREATE TABLE IF NOT EXISTS `smartphone_instagram_posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_id_index` (`profile_id`),
  KEY `post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_instagram_posts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_instagram_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_instagram_posts` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_olx
CREATE TABLE IF NOT EXISTS `smartphone_olx` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `images` varchar(1024) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_olx: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_olx` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_olx` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_paypal_transactions
CREATE TABLE IF NOT EXISTS `smartphone_paypal_transactions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `target` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'payment',
  `description` varchar(255) DEFAULT NULL,
  `value` bigint(20) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_paypal_transactions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_paypal_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_paypal_transactions` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_tinder
CREATE TABLE IF NOT EXISTS `smartphone_tinder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `bio` varchar(1024) NOT NULL,
  `age` tinyint(4) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `show_gender` tinyint(4) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `show_tags` tinyint(4) NOT NULL,
  `target` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`),
  KEY `gender_index` (`gender`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_tinder: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_tinder` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_tinder` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_tinder_messages
CREATE TABLE IF NOT EXISTS `smartphone_tinder_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `liked` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_tinder_messages: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_tinder_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_tinder_messages` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_tinder_rating
CREATE TABLE IF NOT EXISTS `smartphone_tinder_rating` (
  `profile_id` int(11) NOT NULL,
  `rated_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`profile_id`,`rated_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_tinder_rating: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_tinder_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_tinder_rating` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_tor_messages
CREATE TABLE IF NOT EXISTS `smartphone_tor_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel` varchar(24) NOT NULL DEFAULT 'geral',
  `sender` varchar(255) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `channel_index` (`channel`),
  KEY `sender_index` (`sender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_tor_messages: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_tor_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_tor_messages` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_tor_payments
CREATE TABLE IF NOT EXISTS `smartphone_tor_payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` bigint(20) NOT NULL,
  `target` bigint(20) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_tor_payments: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_tor_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_tor_payments` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_twitter_followers
CREATE TABLE IF NOT EXISTS `smartphone_twitter_followers` (
  `follower_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  KEY `profile_id_index` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_twitter_followers: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_twitter_followers` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_twitter_followers` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_twitter_likes
CREATE TABLE IF NOT EXISTS `smartphone_twitter_likes` (
  `tweet_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  KEY `tweet_id_index` (`tweet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_twitter_likes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_twitter_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_twitter_likes` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_twitter_profiles
CREATE TABLE IF NOT EXISTS `smartphone_twitter_profiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `avatarURL` varchar(255) NOT NULL,
  `bannerURL` varchar(255) NOT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_twitter_profiles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_twitter_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_twitter_profiles` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_twitter_tweets
CREATE TABLE IF NOT EXISTS `smartphone_twitter_tweets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` bigint(20) DEFAULT NULL,
  `content` varchar(280) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_id_index` (`profile_id`),
  KEY `tweet_id_index` (`tweet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_twitter_tweets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_twitter_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_twitter_tweets` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_uber_trips
CREATE TABLE IF NOT EXISTS `smartphone_uber_trips` (
  `id` varchar(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `user_rate` tinyint(4) DEFAULT 0,
  `driver_rate` tinyint(4) DEFAULT 0,
  `created_at` int(11) DEFAULT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_uber_trips: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_uber_trips` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_uber_trips` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_whatsapp
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp` (
  `owner` varchar(32) NOT NULL,
  `avatarURL` varchar(255) DEFAULT NULL,
  `read_receipts` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_whatsapp: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_whatsapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_whatsapp` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_whatsapp_channels
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp_channels` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_whatsapp_channels: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_whatsapp_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_whatsapp_channels` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_whatsapp_groups
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `avatarURL` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `members` varchar(2048) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela vrp.smartphone_whatsapp_groups: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `smartphone_whatsapp_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `smartphone_whatsapp_groups` ENABLE KEYS */;

-- A despejar estrutura para tabela vrp.smartphone_whatsapp_messages
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel_id` bigint(20) unsigned NOT NULL,
  `sender` varchar(50) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `deleted_by` varchar(255) DEFAULT NULL,
  `readed` tinyint(4) NOT NULL DEFAULT 0,
  `saw_at` bigint(20) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `channel_id_index` (`channel_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

