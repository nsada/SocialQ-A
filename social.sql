-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: social
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `description` mediumtext,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (1,'null','null',1),(2,'null','null',1),(3,'null','null',1),(4,'null','null',1),(5,'null','null',1),(6,'null','null',1),(7,'null','null',1),(8,'null','null',1),(9,'null','null',1),(10,'null','null',1),(11,'null','null',1),(12,'null','null',1),(13,'null','null',1),(14,'null','null',1),(15,'null','null',1),(16,'null','null',1),(17,'null','null',1),(18,'null','null',1),(19,'null','null',1),(20,'null','null',1),(21,'null','null',1),(22,'null','null',1),(23,'null','null',1),(24,'null','null',1),(25,'null','null',1),(26,'null','null',1),(27,'null','null',1),(28,'null','null',1),(29,'null','null',1),(30,'null','null',1),(31,'null','null',1),(32,'null','null',1),(33,'null','null',1),(34,'null','null',1),(35,'null','null',1),(36,'null','null',1),(37,'null','null',1),(38,'null','null',1),(39,'null','null',1),(40,'null','null',1),(41,'null','null',1),(42,'null','null',1),(43,'null','null',1),(44,'null','null',1),(45,'null','null',1),(46,'null','null',1),(47,'null','null',1),(48,'null','null',1),(49,'null','null',1),(50,'null','null',1),(51,'null','null',1),(52,'null','null',1),(53,'null','null',1),(54,'null','null',1),(55,'null','null',1),(56,'null','null',1),(57,'null','null',1),(58,'null','null',1),(59,'null','null',1),(60,'null','null',1),(61,'null','null',1),(62,'null','null',1),(63,'null','null',1),(64,'null','null',1),(65,'null','null',1),(66,'null','null',1),(67,'null','null',1),(68,'null','null',1),(69,'null','null',1),(70,'null','null',1),(71,'null','null',1),(72,'null','null',1),(73,'null','null',1),(74,'null','null',1),(75,'null','null',1),(76,'null','null',1),(77,'null','null',1),(78,'null','null',1),(79,'null','null',1),(80,'null','null',1),(81,'null','null',1),(82,'null','null',1),(83,'null','null',1),(84,'null','null',1),(85,'null','null',1),(86,'null','null',1),(87,'null','null',1),(88,'null','null',1),(89,'null','null',1),(90,'null','null',1),(91,'null','null',1),(92,'null','null',1),(93,'null','null',1),(94,'null','null',1),(95,'null','null',1),(96,'null','null',1),(97,'null','null',1),(98,'null','null',1),(99,'null','null',1),(100,'null','我的第一本书',1),(101,'null','我的第一本书',1),(102,'April的紫丁香','我的第一本书',1),(103,'H','hh',1),(104,'AAAAA','DXFDHGDHYDRY',1),(105,'4','6',1),(106,'DataBase','Database',1),(107,'F','G',1);
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examquestion`
--

DROP TABLE IF EXISTS `examquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examquestion` (
  `examID` int(11) DEFAULT NULL,
  `questionID` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examquestion`
--

LOCK TABLES `examquestion` WRITE;
/*!40000 ALTER TABLE `examquestion` DISABLE KEYS */;
INSERT INTO `examquestion` VALUES (0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(32,0,0),(33,0,0),(36,1,1),(37,1,1),(37,2,1),(37,1,1),(38,1,1),(40,1,1),(40,1,1),(42,1,1),(45,1,1),(57,1,1),(57,1,1),(57,2,1),(57,1,1),(58,1,1),(61,1,1),(64,1,1),(64,1,1),(64,1,1),(66,1,1),(66,1,1),(67,1,1),(67,1,1),(67,1,1),(68,1,1),(70,1,1),(71,1,1),(71,1,1),(73,1,1),(74,1,1),(75,1,1),(75,1,1),(76,1,1),(76,1,1),(78,1,1),(79,1,1),(80,1,1),(80,1,1),(81,1,1),(82,1,1),(83,1,1),(84,1,1),(85,1,1),(86,1,1),(87,1,1),(88,1,1),(88,2,1),(89,1,1),(89,2,1),(90,1,1),(90,1,1),(91,1,1),(91,2,1),(92,1,1),(92,2,1),(93,1,1),(93,2,1),(94,1,1),(94,1,1),(95,1,1),(95,2,1),(95,1,1),(96,1,1),(96,2,1),(97,1,1),(97,1,1),(97,1,1),(97,1,1),(97,1,1),(97,1,1),(97,1,1),(98,1,1),(98,1,1),(99,1,1),(99,2,1),(100,1,1),(100,2,1),(101,1,1),(101,2,1),(102,1,1),(102,2,1),(103,1,1),(103,2,1),(104,1,1),(104,2,1),(104,1,1),(104,2,1),(105,1,1),(105,2,1),(106,1,1),(106,2,1),(107,1,1),(107,2,1);
/*!40000 ALTER TABLE `examquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionbase`
--

DROP TABLE IF EXISTS `questionbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbase`
--

LOCK TABLES `questionbase` WRITE;
/*!40000 ALTER TABLE `questionbase` DISABLE KEYS */;
INSERT INTO `questionbase` VALUES (2,1,'题库2','第二个题库'),(3,1,'题库3','第三个题库'),(5,1,'题库4','第四个题库'),(8,1,'题库1','第一个题库'),(9,1,'题库5','第五个题库'),(11,1,'null','null'),(12,1,'null','null'),(13,1,'null','null'),(14,1,'null','null'),(15,1,'null','null'),(16,1,'null','null'),(17,1,'null','null');
/*!40000 ALTER TABLE `questionbase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionbase_question`
--

DROP TABLE IF EXISTS `questionbase_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbase_question` (
  `questionBaseID` int(10) unsigned zerofill DEFAULT NULL,
  `questionID` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbase_question`
--

LOCK TABLES `questionbase_question` WRITE;
/*!40000 ALTER TABLE `questionbase_question` DISABLE KEYS */;
INSERT INTO `questionbase_question` VALUES (0000000002,1,1),(0000000002,2,1);
/*!40000 ALTER TABLE `questionbase_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selection`
--

DROP TABLE IF EXISTS `selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` text NOT NULL,
  `num` int(11) NOT NULL,
  `A` varchar(60) DEFAULT NULL,
  `B` varchar(60) DEFAULT NULL,
  `C` varchar(60) DEFAULT NULL,
  `D` varchar(60) DEFAULT NULL,
  `E` varchar(60) DEFAULT NULL,
  `F` varchar(60) DEFAULT NULL,
  `ans` char(6) DEFAULT NULL,
  `analysis` text,
  `score` int(11) DEFAULT '1',
  `scoreA` int(10) unsigned zerofill DEFAULT NULL,
  `scoreB` int(10) unsigned zerofill DEFAULT NULL,
  `scoreC` int(10) unsigned zerofill DEFAULT NULL,
  `scoreD` int(10) unsigned zerofill DEFAULT NULL,
  `scoreE` int(10) unsigned zerofill DEFAULT NULL,
  `scoreF` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selection`
--

LOCK TABLES `selection` WRITE;
/*!40000 ALTER TABLE `selection` DISABLE KEYS */;
INSERT INTO `selection` VALUES (1,'题库2的第一个题',4,'A','B','C','D','E','F','111100','null',10,0000000001,0000000001,0000000001,0000000001,0000000001,0000000001),(2,'题库2的第二个题',4,'A','B','C','D','E','F','111100','null',6,0000000001,0000000001,0000000001,0000000001,0000000001,0000000001);
/*!40000 ALTER TABLE `selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `questionBaseID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'tmy','1015',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_questionbase`
--

DROP TABLE IF EXISTS `user_questionbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_questionbase` (
  `userID` int(11) DEFAULT NULL,
  `questionBaseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_questionbase`
--

LOCK TABLES `user_questionbase` WRITE;
/*!40000 ALTER TABLE `user_questionbase` DISABLE KEYS */;
INSERT INTO `user_questionbase` VALUES (1,2),(1,3),(1,5),(1,8),(1,9);
/*!40000 ALTER TABLE `user_questionbase` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-13 18:14:13
