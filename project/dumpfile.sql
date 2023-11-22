-- MariaDB dump 10.19-11.3.0-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: board
-- ------------------------------------------------------
-- Server version	11.3.0-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `address` varchar(255) DEFAULT NULL,
  `age` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author_unique` (`email`),
  KEY `index_name` (`name`),
  KEY `index_NE` (`name`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES
(1,'kim','hi@naver.com','123','user','suwon',74),
(2,'kim','hello@naver.com','567','user','LA',123),
(3,'HA','abc2@naver.com','123','user','suwon',74),
(4,'park','bcd@naver.com',NULL,'user',NULL,NULL),
(5,'test','test@naver,com',NULL,'user',NULL,NULL),
(6,'kim6',NULL,NULL,'user',NULL,NULL),
(7,'kim7',NULL,NULL,'user',NULL,NULL),
(8,'kim8',NULL,NULL,'user',NULL,NULL),
(9,'kim9',NULL,NULL,'user',NULL,NULL),
(10,'kim10',NULL,NULL,'user',NULL,NULL),
(11,'kim11',NULL,NULL,'user',NULL,NULL),
(12,'kim12',NULL,NULL,'user',NULL,NULL),
(13,'kim13',NULL,NULL,'user',NULL,NULL),
(14,'kim14',NULL,NULL,'user',NULL,NULL),
(15,'kim15',NULL,NULL,'user',NULL,NULL),
(16,'kim16',NULL,NULL,'user',NULL,NULL),
(17,'kim17',NULL,NULL,'user',NULL,NULL),
(18,'kim18',NULL,NULL,'user',NULL,NULL),
(19,'kim19',NULL,NULL,'user',NULL,NULL),
(20,'kim20',NULL,NULL,'user',NULL,NULL),
(21,'kim21',NULL,NULL,'user',NULL,NULL),
(22,'kim22',NULL,NULL,'user',NULL,NULL),
(23,'kim23',NULL,NULL,'user',NULL,NULL),
(24,'kim24',NULL,NULL,'user',NULL,NULL),
(25,'kim25',NULL,NULL,'user',NULL,NULL),
(26,'kim26',NULL,NULL,'user',NULL,NULL),
(27,'kim27',NULL,NULL,'user',NULL,NULL),
(28,'kim28',NULL,NULL,'user',NULL,NULL),
(29,'kim29',NULL,NULL,'user',NULL,NULL),
(30,'kim30',NULL,NULL,'user',NULL,NULL),
(31,'kim31',NULL,NULL,'user',NULL,NULL),
(32,'kim32',NULL,NULL,'user',NULL,NULL),
(33,'kim33',NULL,NULL,'user',NULL,NULL),
(34,'kim34',NULL,NULL,'user',NULL,NULL),
(35,'kim35',NULL,NULL,'user',NULL,NULL),
(36,'kim36',NULL,NULL,'user',NULL,NULL),
(37,'kim37',NULL,NULL,'user',NULL,NULL),
(38,'kim38',NULL,NULL,'user',NULL,NULL),
(39,'kim39',NULL,NULL,'user',NULL,NULL),
(40,'kim40',NULL,NULL,'user',NULL,NULL),
(41,'kim41',NULL,NULL,'user',NULL,NULL),
(42,'kim42',NULL,NULL,'user',NULL,NULL),
(43,'kim43',NULL,NULL,'user',NULL,NULL),
(44,'kim44',NULL,NULL,'user',NULL,NULL),
(45,'kim45',NULL,NULL,'user',NULL,NULL),
(46,'kim46',NULL,NULL,'user',NULL,NULL),
(47,'kim47',NULL,NULL,'user',NULL,NULL),
(48,'kim48',NULL,NULL,'user',NULL,NULL),
(49,'kim49',NULL,NULL,'user',NULL,NULL),
(50,'kim50',NULL,NULL,'user',NULL,NULL),
(51,'kim51',NULL,NULL,'user',NULL,NULL),
(52,'kim52',NULL,NULL,'user',NULL,NULL),
(53,'kim53',NULL,NULL,'user',NULL,NULL),
(54,'kim54',NULL,NULL,'user',NULL,NULL),
(55,'kim55',NULL,NULL,'user',NULL,NULL),
(56,'kim56',NULL,NULL,'user',NULL,NULL),
(57,'kim57',NULL,NULL,'user',NULL,NULL),
(58,'kim58',NULL,NULL,'user',NULL,NULL),
(59,'kim59',NULL,NULL,'user',NULL,NULL),
(60,'kim60',NULL,NULL,'user',NULL,NULL),
(61,'kim61',NULL,NULL,'user',NULL,NULL),
(62,'kim62',NULL,NULL,'user',NULL,NULL),
(63,'kim63',NULL,NULL,'user',NULL,NULL),
(64,'kim64',NULL,NULL,'user',NULL,NULL),
(65,'kim65',NULL,NULL,'user',NULL,NULL),
(66,'kim66',NULL,NULL,'user',NULL,NULL),
(67,'kim67',NULL,NULL,'user',NULL,NULL),
(68,'kim68',NULL,NULL,'user',NULL,NULL),
(69,'kim69',NULL,NULL,'user',NULL,NULL),
(70,'kim70',NULL,NULL,'user',NULL,NULL),
(71,'kim71',NULL,NULL,'user',NULL,NULL),
(72,'kim72',NULL,NULL,'user',NULL,NULL),
(73,'kim73',NULL,NULL,'user',NULL,NULL),
(74,'kim74',NULL,NULL,'user',NULL,NULL),
(75,'kim75',NULL,NULL,'user',NULL,NULL),
(76,'kim76',NULL,NULL,'user',NULL,NULL),
(77,'kim77',NULL,NULL,'user',NULL,NULL),
(78,'kim78',NULL,NULL,'user',NULL,NULL),
(79,'kim79',NULL,NULL,'user',NULL,NULL),
(80,'kim80',NULL,NULL,'user',NULL,NULL),
(81,'kim81',NULL,NULL,'user',NULL,NULL),
(82,'kim82',NULL,NULL,'user',NULL,NULL),
(83,'kim83',NULL,NULL,'user',NULL,NULL),
(84,'kim84',NULL,NULL,'user',NULL,NULL),
(85,'kim85',NULL,NULL,'user',NULL,NULL),
(86,'kim86',NULL,NULL,'user',NULL,NULL),
(87,'kim87',NULL,NULL,'user',NULL,NULL),
(88,'kim88',NULL,NULL,'user',NULL,NULL),
(89,'kim89',NULL,NULL,'user',NULL,NULL),
(90,'kim90',NULL,NULL,'user',NULL,NULL),
(91,'kim91',NULL,NULL,'user',NULL,NULL),
(92,'kim92',NULL,NULL,'user',NULL,NULL),
(93,'kim93',NULL,NULL,'user',NULL,NULL),
(94,'kim94',NULL,NULL,'user',NULL,NULL),
(95,'kim95',NULL,NULL,'user',NULL,NULL),
(96,'kim96',NULL,NULL,'user',NULL,NULL),
(97,'kim97',NULL,NULL,'user',NULL,NULL),
(98,'kim98',NULL,NULL,'user',NULL,NULL),
(99,'kim99',NULL,NULL,'user',NULL,NULL),
(100,'kim100',NULL,NULL,'user',NULL,NULL);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `author_for_view`
--

DROP TABLE IF EXISTS `author_for_view`;
/*!50001 DROP VIEW IF EXISTS `author_for_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `author_for_view` AS SELECT
 1 AS `name`,
  1 AS `email` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `contents` varchar(3000) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `price` decimal(10,3) DEFAULT NULL,
  `created_time` datetime(6) DEFAULT current_timestamp(6),
  PRIMARY KEY (`id`),
  KEY `post_author_fk` (`author_id`),
  CONSTRAINT `post_author_fk` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES
(1,'hello','hello world',1,1000.000,'2022-11-17 16:23:57.266509'),
(2,'hello1','hello world1',1,1500.000,'2023-11-20 16:23:57.266509'),
(3,'hi','hi world1',2,50000.000,'2020-04-30 16:23:57.266509'),
(5,'bye','byebye world1',3,3000.000,'2022-03-06 16:23:57.266509'),
(6,'carry','faker',4,4000.000,'2019-11-30 16:23:57.266509'),
(7,'carry','faker',4,6000.000,'2022-08-27 16:23:57.266509'),
(8,'sds',NULL,5,5500.000,'2023-11-17 16:25:18.878769'),
(9,'v5','t1win',5,9000.000,'2023-11-20 11:36:31.962207'),
(14,'kkk','sjsjsj',5,8000.000,'2023-11-22 14:38:32.409542');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `author_for_view`
--

/*!50001 DROP VIEW IF EXISTS `author_for_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `author_for_view` AS select `author`.`name` AS `name`,`author`.`email` AS `email` from `author` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-22 17:14:57
