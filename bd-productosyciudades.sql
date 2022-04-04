-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: productosyciudades
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ciudad_producto`
--

DROP TABLE IF EXISTS `ciudad_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad_producto` (
  `producto_id` int(10) unsigned NOT NULL,
  `ciudad_id` int(10) unsigned NOT NULL,
  KEY `ciudad_producto_producto_id_foreign` (`producto_id`),
  KEY `ciudad_producto_ciudad_id_foreign` (`ciudad_id`),
  CONSTRAINT `ciudad_producto_ciudad_id_foreign` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ciudad_producto_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad_producto`
--

LOCK TABLES `ciudad_producto` WRITE;
/*!40000 ALTER TABLE `ciudad_producto` DISABLE KEYS */;
INSERT INTO `ciudad_producto` VALUES (24,1),(24,3),(24,5),(25,3),(25,5),(19,4),(19,5),(19,1);
/*!40000 ALTER TABLE `ciudad_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudads`
--

DROP TABLE IF EXISTS `ciudads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudads`
--

LOCK TABLES `ciudads` WRITE;
/*!40000 ALTER TABLE `ciudads` DISABLE KEYS */;
INSERT INTO `ciudads` VALUES (1,'Cali','3.3952332','-76.5957048',NULL,NULL),(2,'Bogota','4.6482837','-74.2478938',NULL,NULL),(3,'Bucaramanga','7.1192047','-73.1679976',NULL,NULL),(4,'Medellin','6.2441988','-75.6512521',NULL,NULL),(5,'Barranquilla','10.9838039','-74.8880581',NULL,NULL),(6,'Popayan','2.4573831','-76.6699746',NULL,NULL);
/*!40000 ALTER TABLE `ciudads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2019_08_19_000000_create_failed_jobs_table',1),(12,'2022_04_01_231416_create_ciudades',2),(13,'2022_04_01_231713_create_productos',2),(14,'2022_04_01_234906_create_ciudad_producto',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('02d5330d7bdb8f21bed34be8dde372032c20a0fb440e266daaf06550543b37bef2d1f2b99fe12cce',2,2,NULL,'[]',1,'2022-04-02 20:47:19','2022-04-02 20:47:19','2023-04-02 15:47:19'),('0555cfeda9cf335b9d000499207b3bcf0c5d3b9729ba4369f795cb80d5982f3c78073414c88b88fd',2,2,NULL,'[]',1,'2022-04-03 13:10:05','2022-04-03 13:10:05','2023-04-03 08:10:05'),('094b2e5e34c14616ff851fdaa5fbda2ad03539dc85458bc689b1ffa7c5bf5f3bf663b9e116b45dd3',2,2,NULL,'[]',1,'2022-04-02 22:10:49','2022-04-02 22:10:49','2023-04-02 17:10:49'),('0e9b84034b5299068cb04979cb73ea2232e70a997a01f14204e159bd716c48e8ee4837e9fb294f0a',2,2,NULL,'[]',1,'2022-04-02 20:53:52','2022-04-02 20:53:52','2023-04-02 15:53:52'),('0e9ec1980b1606da127d4b63cb65472e70237d7e8b358e19894b8aa07e5d4a2924ea26cbe00e1d3e',2,2,NULL,'[]',1,'2022-04-03 01:23:55','2022-04-03 01:23:55','2023-04-02 20:23:55'),('0f92afbed8a597bffd3c6ca85a52ad5cba8a12f50f3147808909c78b9031b8e952a8e853e45ebcba',2,2,NULL,'[]',1,'2022-04-03 10:45:12','2022-04-03 10:45:12','2023-04-03 05:45:12'),('12a45ab79205d3e4c737d0778e2d7f7f5259167bdcc805d8b9d167f631a77dae0150c8cf301dc44a',2,2,NULL,'[]',1,'2022-04-03 03:42:37','2022-04-03 03:42:37','2023-04-02 22:42:37'),('16074645a83cb58484931f3d123f775c433564782f113a975c3f40630b260103291f6449c9cb2e30',2,2,NULL,'[]',1,'2022-04-03 10:13:32','2022-04-03 10:13:32','2023-04-03 05:13:32'),('1bc60c1f439336e65a072d8d1c1e5d58fecbfcee0eea0b335ff4422d17961f250bcc69e1fcb181d7',2,2,NULL,'[]',1,'2022-04-03 12:49:30','2022-04-03 12:49:30','2023-04-03 07:49:30'),('1bd3dcc3d2f4a49d083ed1b8f0319b0269637dfd9dbdc06cec678463d4d77f0479354d6bf65cde61',2,2,NULL,'[]',1,'2022-04-02 20:51:30','2022-04-02 20:51:30','2023-04-02 15:51:30'),('1c598e5669659684c0d100ca465eee8cc37b04f20fb99aaee9890458b6acd4eba3053ea9767c0344',2,2,NULL,'[]',1,'2022-04-02 21:20:19','2022-04-02 21:20:19','2023-04-02 16:20:19'),('1caf18aae4fe62508a2745c8917dcd9cd885859d347eaf6ea2b2655d30e90b1b110fb1dcace22407',2,2,NULL,'[]',1,'2022-04-03 08:10:37','2022-04-03 08:10:37','2023-04-03 03:10:37'),('368837b9d011a9deadb79ba25202dd5baa111a12d397c2352e37e49a6ef6f43f47de50197ea62d95',2,2,NULL,'[]',1,'2022-04-02 22:34:02','2022-04-02 22:34:02','2023-04-02 17:34:02'),('36ca634378e69972abb83f370ac0c432e9bad376b701cf902273aef5881dc8551cd42374922bdf12',2,2,NULL,'[]',1,'2022-04-03 03:38:12','2022-04-03 03:38:12','2023-04-02 22:38:12'),('3cfac3e865dcc9871a9d038613c27a0b4583ae4fd79550031b2f4924bf7c393e5f89dca7688e46bf',2,2,NULL,'[]',1,'2022-04-03 12:59:47','2022-04-03 12:59:47','2023-04-03 07:59:47'),('408429ed7dc0d7446aa2d37fb988e18ce09794de704c5e989f801017778189b7cecc813492d8d1a6',2,2,NULL,'[]',1,'2022-04-03 09:14:31','2022-04-03 09:14:31','2023-04-03 04:14:31'),('47bd40546a66ead5d883ea6334b596617e1076d01f9b5beaffd214591776b55a73bc11bcb99d1af0',2,2,NULL,'[]',1,'2022-04-03 10:18:54','2022-04-03 10:18:54','2023-04-03 05:18:54'),('489acc2a43c6f0558f46095150fdd708f0dfb81e316927392944311c1acfd5a78cccc728c957ca60',2,2,NULL,'[]',1,'2022-04-02 20:47:28','2022-04-02 20:47:28','2023-04-02 15:47:28'),('4c5fe11674b9f1de11b81dc8b4d2b84bdfc120f2c739cda283c844c18fba4e0ad53ae82815e4f59a',2,2,NULL,'[]',1,'2022-04-03 08:26:35','2022-04-03 08:26:35','2023-04-03 03:26:35'),('51727b80eecdf03fefdbd61ab38905c923dd368d0d9341393e7ce9f15f88de4cb2d2db28d4a50962',2,2,NULL,'[]',1,'2022-04-03 01:27:49','2022-04-03 01:27:49','2023-04-02 20:27:49'),('51bf070a144a4f82832b4f50344d41401d5cab7ccef237fa86011eef5f117e5d3feb0b6aa3edb406',2,2,NULL,'[]',1,'2022-04-03 10:43:22','2022-04-03 10:43:22','2023-04-03 05:43:22'),('546a30d14d1f12307319bbcb90118e3d2c5acba00d748f1151e19c3f82d2188b99913422b87dbe2f',2,2,NULL,'[]',1,'2022-04-03 10:16:22','2022-04-03 10:16:22','2023-04-03 05:16:22'),('5aec80f19fd4d0dd5f8895b855012c578d24c20b452c40957488bf8b132bf9467715d0553761ff1d',2,2,NULL,'[]',1,'2022-04-03 01:23:16','2022-04-03 01:23:16','2023-04-02 20:23:16'),('5d10803ac973862c6d36770952e77b0e5166ed8e90152bfd67040698a5076b1203eeded5651ca5ba',2,2,NULL,'[]',1,'2022-04-02 05:12:35','2022-04-02 05:12:35','2023-04-02 00:12:35'),('5d686212993046df5e2698a37ebb46f9799e78a46f1a2c53bfb325a4c857fd4749b751b409f15c65',2,2,NULL,'[]',1,'2022-04-03 10:42:57','2022-04-03 10:42:57','2023-04-03 05:42:57'),('63cfd8601dac968a90847d1bef349c59e89af2c9964c0d4ff12e629503f2cf2524c62819c7ae008b',2,2,NULL,'[]',1,'2022-04-02 23:24:14','2022-04-02 23:24:14','2023-04-02 18:24:14'),('659acc3303837df8b231926eefaf426f4b9e23cb36f0a6430fd50a3993b8c71d3e9ec60a087c39e1',2,2,NULL,'[]',1,'2022-04-02 03:31:42','2022-04-02 03:31:42','2023-04-01 22:31:42'),('671d93159fa752228bf438f04f3a47f051c5e3e9d2651efb91fdcccc0c657fcd0de4c796419d4c3e',2,2,NULL,'[]',1,'2022-04-02 22:09:40','2022-04-02 22:09:40','2023-04-02 17:09:40'),('676482ea202889f60f629c662b5542104a8011a3727a6e6dca46a49f1751c57d249668d528e50143',2,2,NULL,'[]',1,'2022-04-02 05:32:01','2022-04-02 05:32:01','2023-04-02 00:32:01'),('71ce2fc27d9e259d33e5c759b367aa0b834d341b35ebe1d5d2d6bfab3d5c56c914cb124a07c3ca92',2,2,NULL,'[]',1,'2022-04-03 13:07:55','2022-04-03 13:07:55','2023-04-03 08:07:55'),('73275704d33d3325d23d57e8a86e9c97bcfc21974c1846c9dd417548acce1b53f80e338c63e0e3c1',2,2,NULL,'[]',1,'2022-04-03 01:28:18','2022-04-03 01:28:18','2023-04-02 20:28:18'),('7483908ce0040d9c961691590a26d8b5164f1b0a7a06714db9cef288d46347f067347c02d6832bc8',2,2,NULL,'[]',1,'2022-04-02 20:53:24','2022-04-02 20:53:24','2023-04-02 15:53:24'),('7663b16bf28f56a1a91d45ddf90f05bc7564923dd7fb01f4aad8a7a40c5ce06ceb51fe1caa3b0b4d',2,2,NULL,'[]',1,'2022-04-02 05:20:39','2022-04-02 05:20:39','2023-04-02 00:20:39'),('78825d01ae391deeef1316226a015e7f8dde535fd808ada81584db013439fbc1a4efa8d57e855597',2,2,NULL,'[]',1,'2022-04-02 23:51:41','2022-04-02 23:51:41','2023-04-02 18:51:41'),('7ee6350ba968a24903fb45b6a27e29ce933b7e452f12ff7e87ee65601e66d8cbc8a867718760b0c6',2,2,NULL,'[]',1,'2022-04-02 05:16:51','2022-04-02 05:16:51','2023-04-02 00:16:51'),('8a4454341bd5d63644c81860d78496150d8c233a4415d67869cb1e5b01064f68e8b2b76c17a9554f',2,2,NULL,'[]',1,'2022-04-03 10:11:16','2022-04-03 10:11:16','2023-04-03 05:11:16'),('9a0b52e057abf574f9e9fd07c575fb3880b04e448be7fb10337148c7865bbf74a14d4ff2729d533b',2,2,NULL,'[]',1,'2022-04-02 23:55:08','2022-04-02 23:55:08','2023-04-02 18:55:08'),('9d046aefed235799075cb4893095a0b7a81794f3c12964aff25d64803f03285e3619d1a3ba4426f3',2,2,NULL,'[]',1,'2022-04-02 22:31:42','2022-04-02 22:31:42','2023-04-02 17:31:42'),('9d2c83a9df24fc1eb520d110e80f48e5b026fac61d8c6d745870648807de5b141114a05f0fa1ffc0',2,2,NULL,'[]',1,'2022-04-02 22:15:21','2022-04-02 22:15:21','2023-04-02 17:15:21'),('a36af565e438fd01aa31e8209f83d99413195b1eb60c26f3d59adbba38ec22480b7c25c1191fb96e',2,2,NULL,'[]',1,'2022-04-03 13:08:50','2022-04-03 13:08:50','2023-04-03 08:08:50'),('b0667af685901bd42dc4086aa77c6c3a5d4375342296eae1f54bd3a06569832bcc05a29744aa4afd',2,2,NULL,'[]',1,'2022-04-03 01:28:00','2022-04-03 01:28:00','2023-04-02 20:28:00'),('b357f2d7e0e416ccc4ab45a193d98d217664f67000e576bd1814c99a1f046b7dce4ed6bfc7b7b13c',2,2,NULL,'[]',1,'2022-04-03 10:52:39','2022-04-03 10:52:39','2023-04-03 05:52:39'),('b430e9858ca4093d9a4b9e67b470bc05ab4a29118a31dd89f2240d6df3b4a9ca274ea6103abd9495',2,2,NULL,'[]',1,'2022-04-03 10:45:40','2022-04-03 10:45:40','2023-04-03 05:45:40'),('b839c5fb793aa0bfff5148fd8e8c96e004cf7b7bc0fce06280266656bc45249d19769c9440233733',2,2,NULL,'[]',1,'2022-04-02 22:11:28','2022-04-02 22:11:28','2023-04-02 17:11:28'),('b9e1f2002017a6a991a403d60b3a20edbfa43f6cfb7632ed13512d33334ca671d91d4f2762213017',2,2,NULL,'[]',1,'2022-04-03 10:46:03','2022-04-03 10:46:03','2023-04-03 05:46:03'),('be4adab4dc525242344dc6a260e8d6e3722bdb23ee30d17f2524bb748e37e1f494f797b284a7e827',2,2,NULL,'[]',1,'2022-04-02 05:13:39','2022-04-02 05:13:39','2023-04-02 00:13:39'),('bf88079b2db43282718fcef27775a82ba3d7db324a2a66731f7c96e82c9dffdea4dcb79761ffb78e',2,2,NULL,'[]',1,'2022-04-02 21:03:40','2022-04-02 21:03:40','2023-04-02 16:03:40'),('cd12940545a1fa285b4c93b881dba0a07eed04fbb609c1429a06188415099f99308ddb91c048e462',2,2,NULL,'[]',1,'2022-04-03 10:41:53','2022-04-03 10:41:53','2023-04-03 05:41:53'),('d0555b355511964b889c5c9a840d6d042f12e03bacb21f86dce422d5c8dde566fd70f135b355c179',2,2,NULL,'[]',1,'2022-04-02 05:12:02','2022-04-02 05:12:02','2023-04-02 00:12:02'),('d3b1a00850f7199e78f018fd1cfc61dd1831e0672796a33c7c74af11d4e0684b90c80d5e23b51bd8',2,2,NULL,'[]',1,'2022-04-03 10:44:00','2022-04-03 10:44:00','2023-04-03 05:44:00'),('d5180f47db70d231335faeb1496ef7be613cb6da1bf7908dfb402b26418ad56f972ce49010e4f9b1',2,2,NULL,'[]',1,'2022-04-02 22:09:34','2022-04-02 22:09:34','2023-04-02 17:09:34'),('d5b4fdcff1ed912cd4209df3648c5ed78b2f2356c691c4a5a730416382d14d56c6436ce9de808793',2,2,NULL,'[]',1,'2022-04-03 10:42:35','2022-04-03 10:42:35','2023-04-03 05:42:35'),('dec3d1f806300900d69824c51191696771d247e6fe8f6483d284103bb1e4f41883f780236f5e33d6',2,2,NULL,'[]',1,'2022-04-03 05:33:14','2022-04-03 05:33:14','2023-04-03 00:33:14'),('e546026cb475736adde0135cde372c593977182b3444c85d0e258d78129c0eea417dd1c18d97df29',2,2,NULL,'[]',1,'2022-04-02 21:09:37','2022-04-02 21:09:37','2023-04-02 16:09:37'),('e942f3c09e2d8b9bb546ef35532bb2a41b2e55d00d4c206c91dee92108346194f1f3d7ccf34b77e8',2,2,NULL,'[]',1,'2022-04-02 07:36:04','2022-04-02 07:36:04','2023-04-02 02:36:04'),('ea68b4697e3f4fedd7d1535fd80e766b72fe09a7f1a67037996f8cc468286836dbd75387617066be',2,2,NULL,'[]',1,'2022-04-02 22:31:01','2022-04-02 22:31:01','2023-04-02 17:31:01'),('ffa3246a836fade6b71527f1b44f5361a7697fabbddc671bf9aa87b44d3b00cb713c8da7998dcdb9',2,2,NULL,'[]',1,'2022-04-03 01:27:54','2022-04-03 01:27:54','2023-04-02 20:27:54');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','N7zIbx84z7OvB5mUDmDtEHLL6Smr2nauK7aicYcz',NULL,'http://localhost',1,0,0,'2022-04-02 03:00:39','2022-04-02 03:00:39'),(2,NULL,'Laravel Password Grant Client','IOD3ldrvjKtfsGtlr1Moq6Fx2XfHEbrwqj0Y9xgy','users','http://localhost',0,1,0,'2022-04-02 03:00:39','2022-04-02 03:00:39');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2022-04-02 03:00:39','2022-04-02 03:00:39');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` VALUES ('0293daf49dd632e26686c8fe9687736f07da8ff82093af5c511eee624963742d2b7ae17576000ca3','ffa3246a836fade6b71527f1b44f5361a7697fabbddc671bf9aa87b44d3b00cb713c8da7998dcdb9',0,'2023-04-02 20:27:54'),('02adcce1df1816c792412778a37658e9a5f687e65474fc69d6a5e0b079a7032d2e01433c961c48c8','1bd3dcc3d2f4a49d083ed1b8f0319b0269637dfd9dbdc06cec678463d4d77f0479354d6bf65cde61',0,'2023-04-02 15:51:30'),('04942e1617b79e6d7f7eecbba349963c4d07135bb2feec81559b0232714bc9d588ccc0d00a2f2ff4','094b2e5e34c14616ff851fdaa5fbda2ad03539dc85458bc689b1ffa7c5bf5f3bf663b9e116b45dd3',0,'2023-04-02 17:10:49'),('14173b5f825ed21800f9f1af787d0f0bf7821bcec72f83ad36d95be963fad33141558db24657c666','0f92afbed8a597bffd3c6ca85a52ad5cba8a12f50f3147808909c78b9031b8e952a8e853e45ebcba',0,'2023-04-03 05:45:12'),('293c675c752738673311641984da1a371ecd25f9939ff1ad71faa7bdbd12ddb1d45e9f6386f581fb','0555cfeda9cf335b9d000499207b3bcf0c5d3b9729ba4369f795cb80d5982f3c78073414c88b88fd',0,'2023-04-03 08:10:05'),('297534a3121e3872fc30f8a34dcc00b2f4f1ddab0bb60fb6dda03c2ac64ce920abdfc7e2cb079eb6','0e9b84034b5299068cb04979cb73ea2232e70a997a01f14204e159bd716c48e8ee4837e9fb294f0a',0,'2023-04-02 15:53:52'),('2e027b5be120709865c740522386d0df593f8f9cf2c7d7c68e9cacce3bac8baaebc29a8eb2365670','4c5fe11674b9f1de11b81dc8b4d2b84bdfc120f2c739cda283c844c18fba4e0ad53ae82815e4f59a',0,'2023-04-03 03:26:35'),('2f5c861ee0b10d503fd05118503092e1afc6081088d6968371bb498e66f4e2eb4f81030e15325c79','71ce2fc27d9e259d33e5c759b367aa0b834d341b35ebe1d5d2d6bfab3d5c56c914cb124a07c3ca92',0,'2023-04-03 08:07:55'),('32094ec4ed3b6e638d19ddbaa099b86a434fc7c79ae4618e2498611225791565418cf1060faabc85','d5180f47db70d231335faeb1496ef7be613cb6da1bf7908dfb402b26418ad56f972ce49010e4f9b1',0,'2023-04-02 17:09:34'),('332a1e0c04fc52d0814d18a78ea4309b0a52db92d4460fd485a9d0fdf4f9de9d28cfe17ec6ec4706','b0667af685901bd42dc4086aa77c6c3a5d4375342296eae1f54bd3a06569832bcc05a29744aa4afd',0,'2023-04-02 20:28:00'),('345033dc18ee1a06ef5e7f1ca2fbccfce92cfd4b5591a9ee5258fe23a7584fe3b6aefe459e9eeccb','0e9ec1980b1606da127d4b63cb65472e70237d7e8b358e19894b8aa07e5d4a2924ea26cbe00e1d3e',0,'2023-04-02 20:23:55'),('345aa335acdbfa820051a86da557b4457472ac7253c6fd3a932ce83e4370705f5d13f3151ff84eff','e546026cb475736adde0135cde372c593977182b3444c85d0e258d78129c0eea417dd1c18d97df29',0,'2023-04-02 16:09:37'),('365f5c11619aaac495c673f40430135b97f7dc64d3bd4d70c9eaf0072104fa4b3df97d62a2e57abd','d5b4fdcff1ed912cd4209df3648c5ed78b2f2356c691c4a5a730416382d14d56c6436ce9de808793',0,'2023-04-03 05:42:35'),('38a9286c6543a2be6eb494279b4fab319089ac13075973f2be63ad57f3b670ca2e4450005956a817','8a4454341bd5d63644c81860d78496150d8c233a4415d67869cb1e5b01064f68e8b2b76c17a9554f',0,'2023-04-03 05:11:16'),('4752b381ddac8efd7a404e1446f2f268025d57b3686066be1adb064ac0839282fe3b1a5dd8bdc4a4','b9e1f2002017a6a991a403d60b3a20edbfa43f6cfb7632ed13512d33334ca671d91d4f2762213017',0,'2023-04-03 05:46:03'),('529506d491c6415a7607d3bcb56f76beaeeb12c5a9d6ff0c0536b7a6b0dda41b2578504305ddb01b','9a0b52e057abf574f9e9fd07c575fb3880b04e448be7fb10337148c7865bbf74a14d4ff2729d533b',0,'2023-04-02 18:55:08'),('5f2370449595053f7d766acedec8b7d1df2f67cbcedcf0f7d89a09fe7f8a48f4bac4c7da856c91e8','5d686212993046df5e2698a37ebb46f9799e78a46f1a2c53bfb325a4c857fd4749b751b409f15c65',0,'2023-04-03 05:42:57'),('604f50991cbe0f190d69556a32b8496a245f378274b8a008636e840dab8361ccbda35a3ac06d1759','be4adab4dc525242344dc6a260e8d6e3722bdb23ee30d17f2524bb748e37e1f494f797b284a7e827',0,'2023-04-02 00:13:39'),('668bac9997c49eafc0f4ebce1f154994c12275b19be78c76c3c0f6167a7d568b7f1e26cb5c524a47','a36af565e438fd01aa31e8209f83d99413195b1eb60c26f3d59adbba38ec22480b7c25c1191fb96e',0,'2023-04-03 08:08:50'),('71bdf0cb13e67059ed73cca684d8381d3b14063b100c34ab6de0930e6e3d5775660954328d13f000','5d10803ac973862c6d36770952e77b0e5166ed8e90152bfd67040698a5076b1203eeded5651ca5ba',0,'2023-04-02 00:12:35'),('7a4026c5b7a431d5d5c6edfaa678ac53806919cec64c98b49e8bc054db0af6cac184e48d4ba49796','b430e9858ca4093d9a4b9e67b470bc05ab4a29118a31dd89f2240d6df3b4a9ca274ea6103abd9495',0,'2023-04-03 05:45:40'),('879a7e29e68f0131ba6fa872465528251f8ea8d2ddf3fad27013f73d713afeaac29572f10bf09431','12a45ab79205d3e4c737d0778e2d7f7f5259167bdcc805d8b9d167f631a77dae0150c8cf301dc44a',0,'2023-04-02 22:42:37'),('90a542179fad4b5bff80d0273632c23fc6fec6bd330c92af427b153846bb0ff79a7b82e9fb6a77f3','1caf18aae4fe62508a2745c8917dcd9cd885859d347eaf6ea2b2655d30e90b1b110fb1dcace22407',0,'2023-04-03 03:10:37'),('90acb612bb2ffaa35daa74025fa5510b952877159b91c693544b8695c98e78e7b32f12a55ee50262','5aec80f19fd4d0dd5f8895b855012c578d24c20b452c40957488bf8b132bf9467715d0553761ff1d',0,'2023-04-02 20:23:16'),('97d97f70f1e076ebaf8731f29fe7a00a2f14c0ecc14d364ca2c07d9b94f0e3df773a71cf378cb403','1c598e5669659684c0d100ca465eee8cc37b04f20fb99aaee9890458b6acd4eba3053ea9767c0344',0,'2023-04-02 16:20:19'),('a4043c5d37670b5b11c03e1d54da7a1f44ad69cd36e7933a3e3a07f1fb01ac70dfacc0673344f0df','b839c5fb793aa0bfff5148fd8e8c96e004cf7b7bc0fce06280266656bc45249d19769c9440233733',0,'2023-04-02 17:11:28'),('a417dfebeb40a01981dddc58ac3cb88b8a1ad96b6c3074127cb2e6dfcbafbe6246e211299525bfc3','489acc2a43c6f0558f46095150fdd708f0dfb81e316927392944311c1acfd5a78cccc728c957ca60',0,'2023-04-02 15:47:28'),('a773d1ecb29b175c5005c0af979f919dfcbd883850dfa48e6b96cec2929b6c481100c4dc74c02b79','d0555b355511964b889c5c9a840d6d042f12e03bacb21f86dce422d5c8dde566fd70f135b355c179',0,'2023-04-02 00:12:02'),('a8a2f84bd8632caac25237f019921eb64798a14e760a49b4b4edf810184582e02d941f9174b11211','36ca634378e69972abb83f370ac0c432e9bad376b701cf902273aef5881dc8551cd42374922bdf12',0,'2023-04-02 22:38:12'),('b05b383185b2fa475e8406f6076c46ed31360a920125bcf34e253a847efb3bec90342bd8f0faa1f8','cd12940545a1fa285b4c93b881dba0a07eed04fbb609c1429a06188415099f99308ddb91c048e462',0,'2023-04-03 05:41:53'),('b0c808232d3f32d7b9f7aa5d146a3f854237b23320525affb5acf9a745162686668bd77381bba4f8','51727b80eecdf03fefdbd61ab38905c923dd368d0d9341393e7ce9f15f88de4cb2d2db28d4a50962',0,'2023-04-02 20:27:49'),('b19cf32dc78855bb80b629ec46740186412c85144fed3eb03e1c1284e71a17df23ec1f8cb1939dc7','47bd40546a66ead5d883ea6334b596617e1076d01f9b5beaffd214591776b55a73bc11bcb99d1af0',0,'2023-04-03 05:18:54'),('bc383803ec1754b55ad6dad8db9c66963beb3b0a7875bb96a41440e4f3b32049def0777a8c0723bc','671d93159fa752228bf438f04f3a47f051c5e3e9d2651efb91fdcccc0c657fcd0de4c796419d4c3e',0,'2023-04-02 17:09:40'),('bc66b85d345d2f93a617c4717535a636297810fc927a5008c219439417aa18919fa0882fab66744f','b357f2d7e0e416ccc4ab45a193d98d217664f67000e576bd1814c99a1f046b7dce4ed6bfc7b7b13c',0,'2023-04-03 05:52:39'),('bcbcfacba9168783a5a349b436901216137f09de625f68540338ce77bd8c8fe9cc17d8e5e8d510ac','16074645a83cb58484931f3d123f775c433564782f113a975c3f40630b260103291f6449c9cb2e30',0,'2023-04-03 05:13:32'),('bcf47f7afab21824c31b6627adb759330a86ac1596c601a7c98ea44e86f64375158bdb023a6ae0a0','7ee6350ba968a24903fb45b6a27e29ce933b7e452f12ff7e87ee65601e66d8cbc8a867718760b0c6',0,'2023-04-02 00:16:51'),('bcfe68baca959d63dcaf737c37ca10e616c7f7d9f65db01c4bb52ab2048faec7bc1e63b1b25d2438','d3b1a00850f7199e78f018fd1cfc61dd1831e0672796a33c7c74af11d4e0684b90c80d5e23b51bd8',0,'2023-04-03 05:44:00'),('bec61f0b15ede22dbf5adef474457d21a8dd6f9bdf349ff85acd49a663b2a6232f6e693a19eca92f','63cfd8601dac968a90847d1bef349c59e89af2c9964c0d4ff12e629503f2cf2524c62819c7ae008b',0,'2023-04-02 18:24:14'),('c0a109f3a53ee3f2012aa090d01ad480bdc2b7b3d11ee517a8c5279a2bcd1c42dd2ce76ddde52f2c','7483908ce0040d9c961691590a26d8b5164f1b0a7a06714db9cef288d46347f067347c02d6832bc8',0,'2023-04-02 15:53:25'),('cbef121d72816e45c55ae08f741fabd5ffc3862b0254e74fcf78ae0daac5d9b553eedf48a3a2fe87','51bf070a144a4f82832b4f50344d41401d5cab7ccef237fa86011eef5f117e5d3feb0b6aa3edb406',0,'2023-04-03 05:43:22'),('ccfe2ab23ee60d5a848bceb5896eb2b3ca92f8a288c9ff860331c09816054cb1d32377f2fa06dbb3','73275704d33d3325d23d57e8a86e9c97bcfc21974c1846c9dd417548acce1b53f80e338c63e0e3c1',0,'2023-04-02 20:28:18'),('d171000b87e49b3cc39e067da2f9b70436643fbc7bc73d4cb42e91d6bdfc98f350b8de8eeb78fbe4','9d046aefed235799075cb4893095a0b7a81794f3c12964aff25d64803f03285e3619d1a3ba4426f3',0,'2023-04-02 17:31:42'),('d55609329689b9a01ee0bb3b836774114c05dc702a53534e56861075654f24c17914feff9da124c4','546a30d14d1f12307319bbcb90118e3d2c5acba00d748f1151e19c3f82d2188b99913422b87dbe2f',0,'2023-04-03 05:16:22'),('da2ae3be86d0d256d70c6b520547bd5e05a7706de21af3478c8bf9a289d7033c78f3ca606e398e85','676482ea202889f60f629c662b5542104a8011a3727a6e6dca46a49f1751c57d249668d528e50143',0,'2023-04-02 00:32:01'),('dd91a5407c74cc7cf510638cede71830334a7d5f7033616dd8218b85cd61fcc7f75eb344cd6da417','bf88079b2db43282718fcef27775a82ba3d7db324a2a66731f7c96e82c9dffdea4dcb79761ffb78e',0,'2023-04-02 16:03:40'),('de6e15b355b0e53cf9e2aa9d89dc3905b14a2826ddf058d0895c7370bb06c12d3531fe423c1f73c5','368837b9d011a9deadb79ba25202dd5baa111a12d397c2352e37e49a6ef6f43f47de50197ea62d95',0,'2023-04-02 17:34:02'),('e3b5cf949b072de941e37c5ab033c9e78b6d131973415430b33ae9e55798d98923133620d12d8b99','9d2c83a9df24fc1eb520d110e80f48e5b026fac61d8c6d745870648807de5b141114a05f0fa1ffc0',0,'2023-04-02 17:15:21'),('e5949b85e3371c6ad4e0a2f538f4c552ef8a6f5a823c597238701ec1be2d5c3c6d39da02be531aa1','e942f3c09e2d8b9bb546ef35532bb2a41b2e55d00d4c206c91dee92108346194f1f3d7ccf34b77e8',0,'2023-04-02 02:36:04'),('e68d39c92129e99f7d407234e1c5a6faa00eb134f3536fdaeb54f51f16de7c78ea39736150eb808a','dec3d1f806300900d69824c51191696771d247e6fe8f6483d284103bb1e4f41883f780236f5e33d6',0,'2023-04-03 00:33:14'),('e8473072e3ac42f4a4dd996a55a850f15cda6312a21152c2c54bf34f39f6179b695e4090da9954a0','02d5330d7bdb8f21bed34be8dde372032c20a0fb440e266daaf06550543b37bef2d1f2b99fe12cce',0,'2023-04-02 15:47:19'),('ebc420213487f7a6c60026180173a0da038fcff241efbadc05b9746303dd93a6c0d79a37e46c3360','7663b16bf28f56a1a91d45ddf90f05bc7564923dd7fb01f4aad8a7a40c5ce06ceb51fe1caa3b0b4d',0,'2023-04-02 00:20:39'),('f24b38d06cbd522cbe0d96b198eb5d7fe852c8ea16c9b81a0b94eebc4819ec3c6108058112d30dd4','659acc3303837df8b231926eefaf426f4b9e23cb36f0a6430fd50a3993b8c71d3e9ec60a087c39e1',0,'2023-04-01 22:31:42'),('f369e1725db6173131a05c1206b1077fc22ba8df04ce636211a0b8e1a85bdd21bf66657284f2818b','408429ed7dc0d7446aa2d37fb988e18ce09794de704c5e989f801017778189b7cecc813492d8d1a6',0,'2023-04-03 04:14:31'),('fbfc09ab0c844976a1c720f1be0844b7006162ce5a4382589ad83975c2140a5675b1e41a842da608','1bc60c1f439336e65a072d8d1c1e5d58fecbfcee0eea0b335ff4422d17961f250bcc69e1fcb181d7',0,'2023-04-03 07:49:30'),('fc067123bbea8cddfa4e4464abc8f333a7b222ce07425d45ad136e09ca4115d81aa2a245207aa764','78825d01ae391deeef1316226a015e7f8dde535fd808ada81584db013439fbc1a4efa8d57e855597',0,'2023-04-02 18:51:41'),('fc07fea49a9fc60fc0c24c631449fc04a2ab1b51968c9543ccfc33d1140c0628bc3432ac477b6b40','ea68b4697e3f4fedd7d1535fd80e766b72fe09a7f1a67037996f8cc468286836dbd75387617066be',0,'2023-04-02 17:31:01'),('fce850b10fe2c78ab251f1a1c13b165ecc6c81bfb3005acff22353e88e359b975e078e9f15b49a41','3cfac3e865dcc9871a9d038613c27a0b4583ae4fd79550031b2f4924bf7c393e5f89dca7688e46bf',0,'2023-04-03 07:59:47');
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` double(8,2) NOT NULL,
  `cantidad` double(8,2) NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (19,'licuadora',100254.00,42.00,'licuadora.jpg','para jugos','2022-04-03 01:53:22','2022-04-03 12:50:28'),(24,'microfono',120000.00,13.00,'microfono.jpg','microfono grande','2022-04-03 10:11:41','2022-04-03 10:11:41'),(25,'termometro',52879.00,212.00,'termometro.jpg','para adultos','2022-04-03 12:47:32','2022-04-03 12:47:32');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'jaime','prueba@prueba.com',NULL,'$2y$10$J45tEn9z9wrnYz4uDIu9P.PVdPeBQiLbBVSr.2/FqtqK1dftvPjXe',NULL,'2022-04-02 03:30:04','2022-04-02 03:30:04');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'productosyciudades'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-03  3:12:27
