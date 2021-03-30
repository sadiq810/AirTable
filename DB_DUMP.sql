/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.17-MariaDB : Database - ycode_airtable
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

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

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `people` */

DROP TABLE IF EXISTS `people`;

CREATE TABLE `people` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `airtable_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0: means not saved to airtable, 1: means saved to airtable, 2: means updates at airtable is pending.',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `people` */

insert  into `people`(`id`,`airtable_id`,`name`,`email`,`photo`,`status`,`created_at`,`updated_at`) values 
(1,'rec1n4T6tL0Ng9HBd','Audrey Marshall','audrey@example.com','[{\"id\":\"attH850wJFKKYJzrb\",\"url\":\"https:\\/\\/dl.airtable.com\\/.attachments\\/358966452a8dd806068e6ac66b785517\\/c82e8958\\/audrey-marshall.jpg\",\"filename\":\"audrey-marshall.jpg\",\"size\":2151697,\"type\":\"image\\/jpeg\",\"thumbnails\":{\"small\":{\"url\":\"https:\\/\\/dl.airtable.com\\/.attachmentThumbnails\\/74031cabe9dea72281a26cc41ade96be\\/72796434\",\"width\":36,\"height\":36},\"large\":{\"url\":\"https:\\/\\/dl.airtable.com\\/.attachmentThumbnails\\/55b68cf5786bb18025a76d3f0f68b8fc\\/8b7c654d\",\"width\":512,\"height\":512},\"full\":{\"url\":\"https:\\/\\/dl.airtable.com\\/.attachmentThumbnails\\/0b31353db5bbd3b3d995fc46364ae46a\\/910ca95e\",\"width\":3000,\"height\":3000}}}]',1,NULL,NULL),
(2,'reclocDvpGGLsS4Q0','Neil Rutherford','neil@example.com','[{\"id\":\"attyueagZ4ZiO5aEG\",\"url\":\"https:\\/\\/dl.airtable.com\\/.attachments\\/035124f22f1e419198690ded10948b8e\\/80e6c964\\/neil-rutherford.jpg\",\"filename\":\"neil-rutherford.jpg\",\"size\":1976975,\"type\":\"image\\/jpeg\",\"thumbnails\":{\"small\":{\"url\":\"https:\\/\\/dl.airtable.com\\/.attachmentThumbnails\\/696c094c296f2c5a2fe457f2a2cc2c63\\/0f3a6e4e\",\"width\":36,\"height\":36},\"large\":{\"url\":\"https:\\/\\/dl.airtable.com\\/.attachmentThumbnails\\/3ecd028f2c606eb64a2e483938020f1b\\/a2c21170\",\"width\":512,\"height\":512},\"full\":{\"url\":\"https:\\/\\/dl.airtable.com\\/.attachmentThumbnails\\/f4ea01b83332357d02cde8f2fc68673c\\/47c42638\",\"width\":3000,\"height\":3000}}}]',1,NULL,NULL),
(3,'recPfVabwb7Q0tVEd','Rachel Paterson','rachel@example.com','[{\"id\":\"attvry0phpZ2WOmxH\",\"url\":\"https:\\/\\/dl.airtable.com\\/.attachments\\/5643ca02226407dfdbde41836c3d2992\\/b5169792\\/rachel-paterson.jpg\",\"filename\":\"rachel-paterson.jpg\",\"size\":1847772,\"type\":\"image\\/jpeg\",\"thumbnails\":{\"small\":{\"url\":\"https:\\/\\/dl.airtable.com\\/.attachmentThumbnails\\/a8543c987b12747b239fcda00e7418b4\\/e2800519\",\"width\":36,\"height\":36},\"large\":{\"url\":\"https:\\/\\/dl.airtable.com\\/.attachmentThumbnails\\/108bdc84ebf94fa2e19473a2d21a7841\\/0d83d178\",\"width\":512,\"height\":512},\"full\":{\"url\":\"https:\\/\\/dl.airtable.com\\/.attachmentThumbnails\\/b381f8fb06e842388fe1303d0ffdf168\\/0e47083c\",\"width\":3000,\"height\":3000}}}]',1,NULL,NULL),
(4,'recdQDcWa1BOPYX3A','Gavin Walker','gavin@example.com','[{\"id\":\"att3sqvbDg0cjcvX1\",\"url\":\"https:\\/\\/dl.airtable.com\\/.attachments\\/12a82973bd6f104657efd072c6a37565\\/02710f54\\/gavin-walker.jpg\",\"filename\":\"gavin-walker.jpg\",\"size\":2469375,\"type\":\"image\\/jpeg\",\"thumbnails\":{\"small\":{\"url\":\"https:\\/\\/dl.airtable.com\\/.attachmentThumbnails\\/0921bc6eb3cac5322e08902eae842c23\\/5e772f16\",\"width\":36,\"height\":36},\"large\":{\"url\":\"https:\\/\\/dl.airtable.com\\/.attachmentThumbnails\\/7ac8099a8abac6af6eb8ee2c74454839\\/c73d4072\",\"width\":512,\"height\":512},\"full\":{\"url\":\"https:\\/\\/dl.airtable.com\\/.attachmentThumbnails\\/a87526b9551b4c20c3b494e980a990c5\\/5e8388df\",\"width\":3000,\"height\":3000}}}]',1,NULL,NULL),
(5,'recyD0gDTDCiWfRCz','Samantha Pullman','samantha@example.com','[{\"id\":\"attiXEwBNPdSI5clX\",\"url\":\"https:\\/\\/dl.airtable.com\\/.attachments\\/d1eba269994f42f8f9ced480004fb7a7\\/0e8394f1\\/samantha-pullman.jpg\",\"filename\":\"samantha-pullman.jpg\",\"size\":1385563,\"type\":\"image\\/jpeg\",\"thumbnails\":{\"small\":{\"url\":\"https:\\/\\/dl.airtable.com\\/.attachmentThumbnails\\/d797c3d14cb44e308b21d7e8b3a17ce2\\/44ad7f1a\",\"width\":36,\"height\":36},\"large\":{\"url\":\"https:\\/\\/dl.airtable.com\\/.attachmentThumbnails\\/39d35f281d03bf6b85cca18629b3102a\\/4d4c6caf\",\"width\":512,\"height\":512},\"full\":{\"url\":\"https:\\/\\/dl.airtable.com\\/.attachmentThumbnails\\/105da9dd1eae26d308ff96d18228e64d\\/acb863be\",\"width\":3000,\"height\":3000}}}]',1,NULL,NULL),
(6,'recQi2tAciTeYrUzT','Sadiq','sadiq810@gmail.com','[{\"id\":\"attSYOglmiMhxnh9H\",\"url\":\"https:\\/\\/dl.airtable.com\\/.attachments\\/8a5d8ed70367bd2f6e380acb930976c6\\/63012824\\/audrey-marshall.jpg\",\"filename\":\"audrey-marshall.jpg\",\"size\":2151697,\"type\":\"image\\/jpeg\",\"thumbnails\":{\"small\":{\"url\":\"https:\\/\\/dl.airtable.com\\/.attachmentThumbnails\\/09ceb3809d0eb63f6084ae4a9eabd890\\/03f41714\",\"width\":36,\"height\":36},\"large\":{\"url\":\"https:\\/\\/dl.airtable.com\\/.attachmentThumbnails\\/3e18b43f9262a92596be933d841af4ef\\/a22e7f96\",\"width\":512,\"height\":512},\"full\":{\"url\":\"https:\\/\\/dl.airtable.com\\/.attachmentThumbnails\\/1b9259df59eaa6858d983594f1d8995d\\/f6b174a5\",\"width\":3000,\"height\":3000}}}]',1,NULL,NULL),
(7,'recwYlezC9569yrI2','John Doe','john@doe.com','[{\"id\":\"attzQMGGwY699OajL\",\"url\":\"https:\\/\\/dl.airtable.com\\/.attachments\\/8a5d8ed70367bd2f6e380acb930976c6\\/63012824\\/audrey-marshall.jpg\",\"filename\":\"audrey-marshall.jpg\",\"size\":2151697,\"type\":\"image\\/jpeg\",\"thumbnails\":{\"small\":{\"url\":\"https:\\/\\/dl.airtable.com\\/.attachmentThumbnails\\/09ceb3809d0eb63f6084ae4a9eabd890\\/03f41714\",\"width\":36,\"height\":36},\"large\":{\"url\":\"https:\\/\\/dl.airtable.com\\/.attachmentThumbnails\\/3e18b43f9262a92596be933d841af4ef\\/a22e7f96\",\"width\":512,\"height\":512},\"full\":{\"url\":\"https:\\/\\/dl.airtable.com\\/.attachmentThumbnails\\/1b9259df59eaa6858d983594f1d8995d\\/f6b174a5\",\"width\":3000,\"height\":3000}}}]',1,NULL,NULL),
(8,'recyFClUOAluJ8QLF','Jane','jane@gmail.com','[]',1,NULL,NULL),
(9,'rec5CgEYegOom6ffI','Ali','ali@gmail.com','[]',1,NULL,NULL),
(10,'recd5bNyOD9n1X5NV','wajid','wajid@gmail.com','[]',1,NULL,NULL),
(11,'recARXHDbzvdGR5y0','Javid','javid@gmail.com','[]',1,NULL,NULL),
(12,'rechtxuZWRqRXnOef','Subhan','sub@han.com','[]',1,NULL,NULL),
(13,'recGgJqa9rx5HKREi','John','john@gmail.com','[]',1,NULL,NULL),
(14,'recc8zD8cC1gl9bBD','Salam','salam@gmail.com','[]',1,NULL,NULL),
(15,'recb9BMdeXrG0KJFL','Jamal','jamal@gmail.com','[]',1,NULL,NULL),
(16,'reczLw5cBHrrpyDcj','Javid','javid@gmail.com','[]',1,NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
