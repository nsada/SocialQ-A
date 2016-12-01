-- MySQL dump 10.13  Distrib 5.7.15, for Win64 (x86_64)
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
-- Table structure for table `aandq`
--

DROP TABLE IF EXISTS `aandq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aandq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` longtext,
  `ans` longtext,
  `score` int(10) DEFAULT NULL,
  `analysis` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aandq`
--

LOCK TABLES `aandq` WRITE;
/*!40000 ALTER TABLE `aandq` DISABLE KEYS */;
INSERT INTO `aandq` VALUES (1,'hhhhhhhh','null',0,'哈哈'),(2,'hhhhhhhh','红红火火恍恍惚惚',10,'哈哈哈哈');
/*!40000 ALTER TABLE `aandq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` mediumtext,
  `userID` int(11) DEFAULT NULL,
  `joiner` int(11) DEFAULT NULL,
  `rights` int(11) DEFAULT NULL,
  `people` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (1,'tmy1','tmy的第一套试题',1,2,2,NULL),(2,'tmy2','tmy的第二套试题',1,2,1,NULL),(3,'null','null',1,NULL,NULL,NULL),(4,'null','null',1,NULL,NULL,NULL),(5,'null','null',1,NULL,NULL,NULL),(7,'null','null',1,NULL,NULL,NULL),(8,'null','null',1,NULL,NULL,NULL),(9,'null','null',1,NULL,NULL,NULL),(10,'null','null',1,NULL,NULL,NULL),(11,'null','null',1,NULL,NULL,NULL),(12,'null','null',1,NULL,NULL,NULL),(13,'null','null',1,NULL,NULL,NULL),(14,'null','null',1,NULL,NULL,NULL),(15,'test4','44444',1,2,1,NULL),(16,'null','null',1,NULL,NULL,NULL),(17,'test6','test6',1,1,2,NULL),(18,'null','null',1,NULL,NULL,NULL),(19,'null','null',1,NULL,NULL,NULL),(21,'TEST7','试卷的描述TEST7',1,1,1,NULL),(22,'null','null',1,NULL,NULL,NULL),(23,'null','null',1,NULL,NULL,NULL),(24,'null','null',1,NULL,NULL,NULL),(25,'null','null',1,NULL,NULL,NULL),(26,'null','null',1,NULL,NULL,NULL),(27,'null','null',1,NULL,NULL,NULL),(28,'null','null',1,NULL,NULL,NULL),(29,'null','null',1,NULL,NULL,NULL),(30,'null','null',1,NULL,NULL,NULL),(31,'null','null',1,NULL,NULL,NULL),(32,'null','null',1,NULL,NULL,NULL),(33,'null','null',1,NULL,NULL,NULL),(34,'null','null',1,NULL,NULL,NULL),(35,'test','asdf试卷的描述',1,1,1,NULL),(36,'test11.20','1120',1,1,1,NULL),(37,'null','null',1,NULL,NULL,NULL),(38,'null','null',1,NULL,NULL,NULL),(39,'null','null',1,NULL,NULL,NULL),(40,'test11.20','1120',1,2,1,NULL),(42,'tmytest','tmytest',1,1,1,NULL),(43,'null','null',1,NULL,NULL,NULL),(44,'awef','awef',1,1,1,NULL),(45,'null','null',1,NULL,NULL,NULL),(46,'null','null',1,NULL,NULL,NULL),(47,'null','null',1,NULL,NULL,NULL),(48,'null','null',1,NULL,NULL,NULL),(49,'null','null',1,NULL,NULL,NULL),(50,'tmytest2','tmytest2',1,2,1,NULL),(51,'null','null',1,NULL,NULL,NULL),(52,'testNov.30','testNov.30',1,2,1,NULL),(53,'testNov.30 2','testNov.30 2',1,1,1,0),(54,'testYC','testYC',1,1,1,0),(55,'testYC2','testYC2',1,1,1,0),(56,'null','null',1,NULL,NULL,0),(57,'null','null',1,NULL,NULL,0),(58,'null','null',1,NULL,NULL,0);
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_question`
--

DROP TABLE IF EXISTS `exam_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_question` (
  `examID` int(11) NOT NULL,
  `questionID` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `people` int(11) DEFAULT '0',
  `peopleR` int(11) DEFAULT '0',
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question`
--

LOCK TABLES `exam_question` WRITE;
/*!40000 ALTER TABLE `exam_question` DISABLE KEYS */;
INSERT INTO `exam_question` VALUES (1,1,1,NULL,NULL,0),(1,4,1,NULL,NULL,0),(2,6,1,NULL,NULL,0),(15,4,1,NULL,NULL,0),(17,4,1,NULL,NULL,0),(6,4,1,NULL,NULL,0),(21,4,1,NULL,NULL,0),(22,1,1,NULL,NULL,0),(22,4,1,NULL,NULL,0),(23,4,1,NULL,NULL,0),(26,4,1,NULL,NULL,0),(27,1,1,NULL,NULL,0),(28,4,1,NULL,NULL,0),(29,4,1,NULL,NULL,0),(30,1,1,NULL,NULL,0),(30,2,1,NULL,NULL,0),(31,1,1,NULL,NULL,0),(32,4,1,NULL,NULL,0),(33,1,1,NULL,NULL,0),(40,4,1,NULL,NULL,0),(40,1,1,NULL,NULL,0),(42,6,1,0,0,0),(44,4,1,0,0,0),(50,6,1,0,0,0),(52,13,2,0,0,1),(52,10,2,0,0,1),(52,8,1,0,0,1),(52,1,1,0,0,1),(53,4,1,0,0,1),(53,6,1,0,0,1),(53,10,2,0,0,1),(53,12,2,0,0,1),(54,14,1,0,0,1),(54,1,1,0,0,1),(54,10,2,0,0,1),(54,1,2,0,0,1),(55,4,1,0,0,1);
/*!40000 ALTER TABLE `exam_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend` (
  `A` int(10) unsigned zerofill DEFAULT NULL,
  `B` int(10) unsigned zerofill DEFAULT NULL,
  `openB` int(10) unsigned zerofill DEFAULT NULL,
  `nameB` varchar(45) DEFAULT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_exam`
--

DROP TABLE IF EXISTS `group_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_exam` (
  `groupID` int(11) NOT NULL,
  `examID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_exam`
--

LOCK TABLES `group_exam` WRITE;
/*!40000 ALTER TABLE `group_exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_questionbase`
--

DROP TABLE IF EXISTS `group_questionbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_questionbase` (
  `groupID` int(11) NOT NULL,
  `questionbaseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_questionbase`
--

LOCK TABLES `group_questionbase` WRITE;
/*!40000 ALTER TABLE `group_questionbase` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_questionbase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_user`
--

DROP TABLE IF EXISTS `group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_user` (
  `groupID` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_user`
--

LOCK TABLES `group_user` WRITE;
/*!40000 ALTER TABLE `group_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `userID` int(11) NOT NULL DEFAULT '0',
  `groupID` int(10) unsigned zerofill DEFAULT '0000000000',
  `examID` int(10) unsigned zerofill DEFAULT '0000000000',
  `qBaseID` int(10) unsigned zerofill DEFAULT '0000000000',
  `questionID` int(10) unsigned zerofill DEFAULT '0000000000',
  `questionType` int(10) unsigned zerofill DEFAULT '0000000000',
  `action` int(1) NOT NULL DEFAULT '0',
  `time` varchar(45) NOT NULL,
  `userIDB` int(10) unsigned zerofill DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,0000000000,0000000000,0000000000,0000000000,0000000000,2,'2016/11/26 21:08:27',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,3,'2016/11/26 21:16:20',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,2,'2016/11/26 21:16:25',NULL),(1,0000000000,0000000000,0000000021,0000000000,0000000000,4,'2016/11/26 21:30:26',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,2,'2016/11/26 21:33:52',NULL),(1,0000000000,0000000000,0000000021,0000000000,0000000000,5,'2016/11/26 21:36:17',NULL),(1,0000000000,0000000000,0000000022,0000000000,0000000000,4,'2016/11/26 21:36:28',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,2,'2016/11/26 21:42:35',NULL),(1,0000000000,0000000000,0000000002,0000000015,0000000002,7,'2016/11/26 22:01:24',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,2,'2016/11/26 22:06:44',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,2,'2016/11/26 22:11:36',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,2,'2016/11/26 22:12:29',NULL),(1,0000000000,0000000000,0000000022,0000000013,0000000001,7,'2016/11/26 22:18:12',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,2,'2016/11/28 18:26:48',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,3,'2016/11/28 18:27:37',NULL),(5,0000000000,0000000000,0000000000,0000000000,0000000000,1,'2016/11/28 18:28:10',NULL),(5,0000000000,0000000000,0000000000,0000000000,0000000000,2,'2016/11/28 18:28:17',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,2,'2016/11/30 21:23:07',NULL),(1,0000000000,0000000053,0000000000,0000000000,0000000000,9,'2016/11/30 21:48:28',NULL),(1,0000000000,0000000053,0000000000,0000000004,0000000001,12,'2016/11/30 21:48:28',NULL),(1,0000000000,0000000053,0000000000,0000000006,0000000001,12,'2016/11/30 21:48:28',NULL),(1,0000000000,0000000053,0000000000,0000000010,0000000002,12,'2016/11/30 21:48:28',NULL),(1,0000000000,0000000053,0000000000,0000000012,0000000002,12,'2016/11/30 21:48:28',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,3,'2016/12/01 17:36:39',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,2,'2016/12/01 17:36:49',NULL),(1,0000000000,0000000000,0000000005,0000000000,0000000000,5,'2016/12/01 17:42:53',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,2,'2016/12/01 18:00:57',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,3,'2016/12/01 18:01:08',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,2,'2016/12/01 18:01:15',NULL),(1,0000000000,0000000000,0000000023,0000000000,0000000000,4,'2016/12/01 18:01:50',NULL),(1,0000000000,0000000000,0000000023,0000000014,0000000001,7,'2016/12/01 18:02:23',NULL),(1,0000000000,0000000054,0000000000,0000000000,0000000000,9,'2016/12/01 18:07:19',NULL),(1,0000000000,0000000054,0000000000,0000000014,0000000001,12,'2016/12/01 18:07:19',NULL),(1,0000000000,0000000054,0000000000,0000000001,0000000001,12,'2016/12/01 18:07:19',NULL),(1,0000000000,0000000054,0000000000,0000000010,0000000002,12,'2016/12/01 18:07:19',NULL),(1,0000000000,0000000054,0000000000,0000000001,0000000002,12,'2016/12/01 18:07:19',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,3,'2016/12/01 18:11:23',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,2,'2016/12/01 18:11:28',NULL),(1,0000000000,0000000000,0000000023,0000000000,0000000000,5,'2016/12/01 18:11:35',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,2,'2016/12/01 20:11:55',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,3,'2016/12/01 20:27:02',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,2,'2016/12/01 20:27:12',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,2,'2016/12/01 20:29:20',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,2,'2016/12/01 20:31:22',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,2,'2016/12/01 20:40:14',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,2,'2016/12/01 20:42:59',NULL),(1,0000000000,0000000000,0000000024,0000000000,0000000000,4,'2016/12/01 21:03:26',NULL),(1,0000000000,0000000000,0000000024,0000000001,0000000003,7,'2016/12/01 21:05:49',NULL),(1,0000000000,0000000000,0000000024,0000000002,0000000003,7,'2016/12/01 21:17:23',NULL),(1,0000000000,0000000000,0000000000,0000000000,0000000000,3,'2016/12/01 21:46:39',NULL);
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multy`
--

DROP TABLE IF EXISTS `multy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(45) NOT NULL,
  `A` varchar(45) DEFAULT NULL,
  `B` varchar(45) DEFAULT NULL,
  `C` varchar(45) DEFAULT NULL,
  `D` varchar(45) DEFAULT NULL,
  `E` varchar(45) DEFAULT NULL,
  `F` varchar(45) DEFAULT NULL,
  `ans` char(6) DEFAULT NULL,
  `analysis` varchar(45) DEFAULT NULL,
  `score` int(11) DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multy`
--

LOCK TABLES `multy` WRITE;
/*!40000 ALTER TABLE `multy` DISABLE KEYS */;
/*!40000 ALTER TABLE `multy` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbase`
--

LOCK TABLES `questionbase` WRITE;
/*!40000 ALTER TABLE `questionbase` DISABLE KEYS */;
INSERT INTO `questionbase` VALUES (2,1,'题库2','第二个题库'),(3,1,'题库3','第三个题库'),(5,1,'题库4','第四个题库'),(11,1,'null','null'),(12,1,'null','null'),(13,1,'null','null'),(14,1,'null','null'),(15,1,'null','null'),(16,1,'null','null'),(17,1,'null','null'),(18,1,'题库tmy','tmy的题库'),(21,1,'testLog','testlog'),(22,1,'testLog','testLog'),(23,1,'testMergeYC','testMergeYC'),(24,1,'testAandQ','testAandQ');
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
INSERT INTO `questionbase_question` VALUES (0000000002,1,1),(0000000002,2,1),(0000000018,4,1),(0000000002,5,1),(0000000005,6,1),(0000000018,7,1),(0000000003,8,1),(0000000003,1,2),(0000000003,9,1),(0000000003,9,2),(0000000003,11,2),(0000000002,12,2),(0000000022,10,1),(0000000022,11,1),(0000000022,12,1),(0000000022,13,2),(0000000022,14,2),(0000000002,15,2),(0000000022,13,1),(0000000023,14,1),(0000000024,2,3);
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
  `A` varchar(60) DEFAULT NULL,
  `B` varchar(60) DEFAULT NULL,
  `C` varchar(60) DEFAULT NULL,
  `D` varchar(60) DEFAULT NULL,
  `E` varchar(60) DEFAULT NULL,
  `F` varchar(60) DEFAULT NULL,
  `ans` char(1) DEFAULT NULL,
  `analysis` text,
  `score` int(11) DEFAULT '1',
  `scoreA` int(10) DEFAULT NULL,
  `scoreB` int(10) DEFAULT NULL,
  `scoreC` int(10) DEFAULT NULL,
  `scoreD` int(10) DEFAULT NULL,
  `scoreE` int(10) DEFAULT NULL,
  `scoreF` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selection`
--

LOCK TABLES `selection` WRITE;
/*!40000 ALTER TABLE `selection` DISABLE KEYS */;
INSERT INTO `selection` VALUES (1,'题库2的第一个题','A','B','C','D','E','F','4','null',10,1,1,1,1,1,1),(2,'题库2的第二个题','A','B','C','D','E','F','3','null',6,1,1,1,1,1,1),(4,'tmy快疯了没有','没有','有','','','','','2','null',100,0,0,0,0,0,0),(5,'题库2的第三个题','1','2','3','4','5','6','6','null',1,0,0,0,0,0,0),(6,'题库4的第一个题','11','22','33','44','55','66','5','null',1,0,0,0,0,0,0),(7,'test','aaa','bbb','','','','','1','null',10,0,0,0,0,0,0),(8,'题库3的第一个单选题','11','22','33','44','55','','1','阿斯蒂芬',1,0,0,0,0,0,0),(9,'题库3的第二个单选题','11','22','33','','','','2','阿斯顿发生',2,0,0,0,0,0,0),(10,'选择题1','1','12','123','1234','','','1','1234',1,0,0,0,0,0,0),(11,'单选2','问题','阿斯蒂芬','','','','','2','萨达股份',1,0,0,0,0,0,0),(12,'单选2','问题','阿斯蒂芬','','','','','2','萨达股份',1,0,0,0,0,0,0),(13,'单选3','AA','BB','','','','','2','',1,0,0,0,0,0,0),(14,'testYC问答题1','123','1234','','','','','1','',1,0,0,0,0,0,0);
/*!40000 ALTER TABLE `selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `textblank`
--

DROP TABLE IF EXISTS `textblank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `textblank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` mediumtext NOT NULL,
  `num` int(1) unsigned zerofill NOT NULL,
  `A` varchar(45) DEFAULT NULL,
  `B` varchar(45) DEFAULT NULL,
  `C` varchar(45) DEFAULT NULL,
  `D` varchar(45) DEFAULT NULL,
  `E` varchar(45) DEFAULT NULL,
  `F` varchar(45) DEFAULT NULL,
  `analysis` varchar(45) DEFAULT '无',
  `score` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `textblank`
--

LOCK TABLES `textblank` WRITE;
/*!40000 ALTER TABLE `textblank` DISABLE KEYS */;
INSERT INTO `textblank` VALUES (1,'题库3的第1个填空题',3,'a','ab','abc',NULL,NULL,NULL,'无',0),(2,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(3,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(4,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(5,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(6,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(7,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(8,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(9,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(10,'题库3的第二个填空题',2,'a','b','','','','','',2),(11,'题库3的第二个填空题',2,'a','b','','','','','',2),(12,'题库2的第1个填空题',5,'21','22','23','24','25','','无',0),(13,'填空题1',2,'A','B','','','','','WEF',0),(14,'填空2',2,'12','123','','','','','',0),(15,'填空2',2,'11','22','','','','','',0);
/*!40000 ALTER TABLE `textblank` ENABLE KEYS */;
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
  `tencentOpenID` varchar(45) DEFAULT NULL,
  `tencentToken` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'tmy','1015',NULL,NULL,NULL,NULL),(2,'tmy2','1015',NULL,NULL,NULL,NULL),(3,'','',NULL,NULL,NULL,NULL),(4,'','',NULL,NULL,NULL,NULL),(5,'friend1','1015',NULL,NULL,NULL,NULL);
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
INSERT INTO `user_questionbase` VALUES (1,2),(1,3),(1,18),(1,22),(1,24);
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

-- Dump completed on 2016-12-01 22:11:01
