-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: social
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aandq`
--

LOCK TABLES `aandq` WRITE;
/*!40000 ALTER TABLE `aandq` DISABLE KEYS */;
INSERT INTO `aandq` VALUES (1,'hhhhhhhh','null',0,'哈哈'),(2,'hhhhhhhh','红红火火恍恍惚惚',10,'哈哈哈哈'),(3,'软工的老师叫什么？','null',10,'这个都不知道就等着挂科吧'),(4,'软工的老师叫什么？ ','王忠杰',100,'这个都不知道就等着挂科吧 ');
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
  `totalscore` int(11) DEFAULT '0',
  `publish` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (1,'tmy1','tmy的第一套试题',1,2,2,NULL,0,1),(2,'tmy2','tmy的第二套试题',1,2,1,NULL,0,1),(3,'null','null',1,NULL,NULL,NULL,0,1),(4,'null','null',1,NULL,NULL,NULL,0,1),(5,'null','null',1,NULL,NULL,NULL,0,1),(7,'null','null',1,NULL,NULL,NULL,0,1),(8,'null','null',1,NULL,NULL,NULL,0,1),(9,'null','null',1,NULL,NULL,NULL,0,1),(10,'null','null',1,NULL,NULL,NULL,0,1),(11,'null','null',1,NULL,NULL,NULL,0,1),(12,'null','null',1,NULL,NULL,NULL,0,1),(13,'null','null',1,NULL,NULL,NULL,0,1),(14,'null','null',1,NULL,NULL,NULL,0,1),(15,'test4','44444',1,2,1,NULL,0,1),(16,'null','null',1,NULL,NULL,NULL,0,1),(17,'test6','test6',1,1,2,NULL,0,1),(18,'null','null',1,NULL,NULL,NULL,0,1),(19,'null','null',1,NULL,NULL,NULL,0,1),(21,'TEST7','试卷的描述TEST7',1,1,1,NULL,0,1),(22,'null','null',1,NULL,NULL,NULL,0,1),(23,'null','null',1,NULL,NULL,NULL,0,1),(24,'null','null',1,NULL,NULL,NULL,0,1),(25,'null','null',1,NULL,NULL,NULL,0,1),(26,'null','null',1,NULL,NULL,NULL,0,1),(27,'null','null',1,NULL,NULL,NULL,0,1),(28,'null','null',1,NULL,NULL,NULL,0,1),(29,'null','null',1,NULL,NULL,NULL,0,1),(30,'null','null',1,NULL,NULL,NULL,0,1),(31,'null','null',1,NULL,NULL,NULL,0,1),(32,'null','null',1,NULL,NULL,NULL,0,1),(33,'null','null',1,NULL,NULL,NULL,0,1),(34,'null','null',1,NULL,NULL,NULL,0,1),(35,'test','asdf试卷的描述',1,1,1,NULL,0,1),(36,'test11.20','1120',1,1,1,NULL,0,1),(37,'null','null',1,NULL,NULL,NULL,0,1),(38,'null','null',1,NULL,NULL,NULL,0,1),(39,'null','null',1,NULL,NULL,NULL,0,1),(40,'test11.20','1120',1,2,1,NULL,0,1),(42,'tmytest','tmytest',1,1,1,NULL,0,1),(43,'null','null',1,NULL,NULL,NULL,0,1),(44,'awef','awef',1,1,1,NULL,0,1),(45,'null','null',1,NULL,NULL,NULL,0,1),(46,'null','null',1,NULL,NULL,NULL,0,1),(47,'null','null',1,NULL,NULL,NULL,0,1),(48,'null','null',1,NULL,NULL,NULL,0,1),(49,'null','null',1,NULL,NULL,NULL,0,1),(50,'tmytest2','tmytest2',1,2,1,NULL,0,1),(51,'null','null',1,NULL,NULL,NULL,0,1),(52,'testNov.30','testNov.30',1,2,1,NULL,0,1),(53,'testNov.30 2','testNov.30 2',1,1,1,0,0,1),(54,'testYC','testYC',1,1,1,0,0,1),(55,'testYC2','testYC2',1,1,1,0,0,1),(56,'null','null',1,NULL,NULL,0,0,1),(57,'null','null',1,NULL,NULL,0,0,1),(58,'null','null',1,NULL,NULL,0,0,1),(59,'April的紫丁香','A',1,1,1,0,0,1),(60,'AAAAA','A',1,1,1,0,0,1),(61,'April的紫丁香','AAAAAA',1,1,1,0,0,1),(62,'April的紫丁香','AAAA\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			',1,1,1,0,0,1),(63,'April的紫丁香','A\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			',1,1,1,0,0,1),(64,'April的紫丁香','ASSSS',3,1,1,0,0,1),(65,'April的紫丁香','aaaa\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			',1,1,1,0,0,1),(66,'April的紫丁香','A\r\n			\r\n			\r\n			\r\n			\r\n			',1,1,1,0,0,1),(67,'April的紫丁香','S',1,1,1,0,0,1),(68,'April的紫丁香','AAAA\r\n			\r\n			\r\n			\r\n			\r\n			',1,1,1,6,88,1),(69,'null','null',1,NULL,NULL,0,0,1),(70,'April的紫丁香','a',1,1,1,0,0,1),(71,'April的紫丁香','A',1,1,1,0,0,1),(72,'April的紫丁香','SA\r\n			',1,1,1,0,0,0),(73,'April的紫丁香','AAA',1,1,1,0,0,1),(74,'April的紫丁香','aaaaaa',1,1,1,0,0,1),(75,'April的紫丁香','A',1,1,1,0,0,1),(76,'AAAAA','AAAAAAAAAAAA',1,1,1,0,0,1),(77,'April的紫丁香','AAA',1,1,1,0,0,1),(78,'April的紫丁香','a\r\n			\r\n			',1,1,1,0,0,1),(79,'April的紫丁香','a',1,1,1,0,0,1),(80,'null','null',1,NULL,NULL,0,0,1),(81,'April的紫丁香','绝密',1,1,1,7,265,1),(82,'April的紫丁香','AAAAA',1,1,1,0,0,1),(83,'AAAAA','AA',1,1,1,0,0,1),(84,'April的紫丁香','SSSS',1,1,1,0,0,1),(85,'April的紫丁香','AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',1,1,1,2,500,1),(86,'null','null',1,NULL,NULL,0,0,1),(87,'testtmy','		hhhhhhh	',1,1,1,2,11,1),(88,'null','null',1,NULL,NULL,0,0,1),(89,'testMerge2','testMerge2\r\n			\r\n			\r\n			',1,1,1,1,202,1),(90,'null','null',1,NULL,NULL,0,0,1),(91,'null','null',1,NULL,NULL,0,0,1),(92,'null','null',1,NULL,NULL,0,0,1),(93,'testLog','testLog Dec.10			\r\n						',1,1,1,0,0,0),(95,'美国兰德公司经典心理测试','180分以上：意志力强，头脑冷静，有较强的领导欲，事业心强，不达目的不罢休。外表和善，内心自傲，对有利于自己的人际关系比较看重，有时显得性格急噪，咄咄逼人，得理不饶人，不利于自己时顽强抗争，不轻易认输。思维理性，对爱和婚姻的看法很现实。对金钱的欲望一般。\r\n						\r\n						\r\n						',2,1,1,2,21,1),(96,'null','null',1,NULL,NULL,0,0,1),(98,'测试试卷','包含各种试题的试卷\r\n						',1,2,2,0,0,1);
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
  `userID` int(11) NOT NULL,
  `score` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question`
--

LOCK TABLES `exam_question` WRITE;
/*!40000 ALTER TABLE `exam_question` DISABLE KEYS */;
INSERT INTO `exam_question` VALUES (1,1,1,33,33,0,12),(1,4,1,1,1,0,100),(2,6,1,NULL,NULL,0,0),(15,4,1,1,1,0,100),(17,4,1,1,1,0,100),(6,4,1,1,1,0,100),(21,4,1,1,1,0,100),(22,1,1,33,33,0,12),(22,4,1,1,1,0,100),(23,4,1,1,1,0,100),(26,4,1,1,1,0,100),(27,1,1,33,33,0,12),(28,4,1,1,1,0,100),(29,4,1,1,1,0,100),(30,1,1,33,33,0,12),(30,2,1,15,15,0,1),(31,1,1,33,33,0,12),(32,4,1,1,1,0,100),(33,1,1,33,33,0,12),(40,4,1,1,1,0,100),(40,1,1,33,33,0,12),(42,6,1,0,0,0,0),(44,4,1,1,1,0,100),(50,6,1,0,0,0,0),(52,13,2,14,2,1,0),(52,10,2,14,1,1,0),(52,8,1,16,15,1,0),(52,1,1,33,33,1,12),(53,4,1,1,1,1,100),(53,6,1,0,0,1,0),(53,10,2,14,1,1,0),(53,12,2,3,0,1,0),(54,14,1,0,0,1,0),(54,1,1,33,33,1,12),(54,10,2,14,1,1,0),(54,1,2,0,0,1,0),(55,4,1,1,1,1,100),(61,2,3,12,12,1,0),(62,2,1,15,15,1,1),(62,11,2,14,5,1,0),(62,2,3,12,12,1,0),(66,1,1,33,33,1,12),(66,2,1,15,15,1,1),(66,11,2,14,5,1,0),(66,9,2,14,12,1,0),(66,2,4,1,0,1,0),(68,1,1,33,33,1,12),(68,2,1,15,15,1,1),(68,9,2,14,12,1,0),(68,11,2,14,5,1,0),(68,2,3,12,12,1,0),(68,3,3,11,11,1,0),(71,1,3,0,0,1,0),(71,2,4,1,0,1,0),(72,1,3,0,0,1,0),(72,2,4,1,0,1,0),(0,1,1,33,33,1,12),(0,2,1,15,15,1,1),(0,12,2,3,0,1,0),(0,15,2,2,0,1,0),(0,8,1,0,0,1,0),(79,8,1,0,0,1,0),(79,9,1,0,0,1,0),(79,1,2,0,0,1,0),(79,9,2,14,12,1,0),(77,8,1,0,0,1,0),(77,9,1,0,0,1,0),(78,7,1,0,0,1,0),(78,2,4,1,0,1,0),(78,8,1,0,0,1,0),(78,9,1,0,0,1,0),(78,9,2,0,0,1,0),(81,17,1,11,10,1,40),(81,18,1,9,6,1,0),(81,5,4,9,7,1,35),(81,16,2,9,1,1,5),(81,17,1,11,10,1,40),(81,18,1,9,6,1,0),(81,5,4,9,7,1,35),(81,16,2,9,1,1,5),(81,7,3,0,0,1,0),(81,17,1,11,10,1,40),(81,18,1,9,6,1,0),(81,5,4,9,7,1,35),(81,6,4,2,0,1,0),(81,16,2,9,1,1,5),(81,17,2,2,2,1,30),(81,4,3,2,2,1,0),(81,5,3,2,2,1,0),(81,7,3,0,0,1,0),(81,17,1,11,10,1,40),(81,18,1,9,6,1,0),(81,5,4,9,7,1,35),(81,6,4,2,0,1,0),(81,16,2,9,1,1,5),(81,17,2,2,2,1,30),(81,4,3,2,2,1,0),(81,5,3,2,2,1,0),(81,7,3,0,0,1,0),(85,17,1,11,10,1,40),(85,18,1,9,6,1,0),(85,5,4,9,7,1,35),(85,6,4,2,0,1,0),(85,16,2,9,1,1,5),(85,17,2,2,2,1,30),(85,4,3,2,2,1,123),(85,5,3,2,2,1,337),(87,1,1,33,33,1,12),(87,5,1,2,0,1,0),(87,12,2,3,0,1,0),(87,15,2,2,0,1,0),(89,2,4,1,0,1,0),(89,1,1,33,33,1,12),(89,2,1,15,15,1,1),(89,12,2,3,0,1,0),(89,4,1,1,1,1,100),(89,2,3,12,12,1,100),(93,1,1,0,0,1,0),(93,2,1,0,0,1,0),(93,12,2,0,0,1,0),(93,15,2,0,0,1,0),(95,15,1,2,2,2,8),(95,16,1,2,2,2,8),(95,17,1,11,10,2,40),(98,18,1,0,0,1,0),(98,19,1,0,0,1,0),(98,3,4,0,0,1,0),(98,16,2,0,0,1,0),(98,4,3,0,0,1,0);
/*!40000 ALTER TABLE `exam_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_user`
--

DROP TABLE IF EXISTS `exam_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_user` (
  `examID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `checked` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_user`
--

LOCK TABLES `exam_user` WRITE;
/*!40000 ALTER TABLE `exam_user` DISABLE KEYS */;
INSERT INTO `exam_user` VALUES (52,1,2,0),(52,1,2,0),(52,1,2,0),(52,1,2,0),(52,1,2,0),(52,1,2,0),(52,1,2,0),(52,1,1,0),(52,1,2,0),(52,1,2,0),(52,1,2,0),(52,1,2,0),(52,1,4,0),(68,1,2,0),(68,1,16,0),(68,1,14,0),(68,1,16,0),(68,1,16,0),(68,1,14,0),(68,1,16,0),(68,1,14,0),(68,1,14,0),(68,1,14,0),(81,1,52,1),(85,1,448,1),(87,1,10,0),(89,1,202,1),(95,6,10,0),(95,2,11,0);
/*!40000 ALTER TABLE `exam_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_user_answer`
--

DROP TABLE IF EXISTS `exam_user_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_user_answer` (
  `userID` int(11) DEFAULT NULL,
  `examID` int(11) DEFAULT NULL,
  `questionID` int(11) DEFAULT NULL,
  `questionType` int(11) DEFAULT NULL,
  `answer` varchar(200) DEFAULT NULL,
  `rightt` int(11) DEFAULT NULL,
  `rrred` int(11) DEFAULT '0',
  `score` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_user_answer`
--

LOCK TABLES `exam_user_answer` WRITE;
/*!40000 ALTER TABLE `exam_user_answer` DISABLE KEYS */;
INSERT INTO `exam_user_answer` VALUES (1,52,8,1,'1',1,0,0),(1,52,1,1,'2',1,0,0),(1,52,13,2,'111/#212/#333',0,0,0),(1,52,10,2,'255/#344/#',0,0,0),(1,52,8,1,'1',1,0,0),(1,52,1,1,'2',1,0,0),(1,52,8,1,'1',1,0,0),(1,52,1,1,'2',1,0,0),(1,52,13,2,'111/#212/#333',0,0,0),(1,52,10,2,'255/#344/#',0,0,0),(1,52,8,1,'2',0,0,0),(1,52,1,1,'2',1,0,0),(1,52,13,2,'111/#222/#333',0,0,0),(1,52,10,2,'255/#344/#',0,0,0),(1,52,8,1,'1',1,0,0),(1,52,1,1,'3',1,0,0),(1,52,13,2,'111/#222/#333',0,0,0),(1,52,10,2,'111/#222/#333',0,0,0),(1,52,8,1,'1',1,0,0),(1,52,1,1,'2',1,0,0),(1,52,13,2,'A/#B/#',0,0,0),(1,52,10,2,'A/#B/#',0,0,0),(1,52,8,1,'1',1,0,0),(1,52,1,1,'3',1,0,0),(1,52,8,1,'1',1,0,0),(1,52,1,1,'3',1,0,0),(1,52,13,2,'A/#B/#',1,0,0),(1,52,10,2,'A/#B/#',0,0,0),(1,52,8,1,'1',1,0,0),(1,52,1,1,'2',1,0,0),(1,52,13,2,'A/#B/#',1,0,0),(1,52,10,2,'A/#B/#',0,0,0),(1,52,8,1,'1',1,0,0),(1,52,1,1,'2',1,0,0),(1,52,13,2,'a/#b/#',0,0,0),(1,52,10,2,'a/#b/#',1,0,0),(1,52,8,1,'4',0,0,0),(1,52,8,1,'4',0,0,0),(1,68,1,1,'4',1,0,10),(1,68,2,1,'1',1,0,1),(1,68,9,2,'111/#222/#333/#',1,0,3),(1,68,11,2,'111/#555/#',0,0,0),(1,68,2,3,'哦呵呵',1,0,0),(1,68,3,3,'哦呵呵',1,0,0),(1,81,17,1,'1',1,0,5),(1,81,18,1,'2',1,0,0),(1,81,16,2,'11/#12/#',0,0,0),(1,81,17,2,'1/#2/#',1,0,15),(1,81,5,4,'110000',1,0,5),(1,81,6,4,'110000',0,0,0),(1,81,4,3,'哦呵呵',1,1,13),(1,81,5,3,'蛤？',1,1,14),(1,85,17,1,'2',0,0,0),(1,85,18,1,'1',0,0,0),(1,85,16,2,'1/#2/#',0,0,0),(1,85,17,2,'1/#2/#',1,0,15),(1,85,5,4,'100000',0,0,0),(1,85,6,4,'100000',0,0,0),(1,85,4,3,'oehehhehe',1,1,111),(1,85,5,3,'ahaha',1,1,322),(1,87,1,1,'4',1,0,10),(1,87,5,1,'4',0,0,0),(1,87,12,2,'23/#3/#4/#2/#5/#',0,0,0),(1,87,15,2,'sadfg/#g/#',0,0,0),(1,89,1,1,'1',1,0,1),(1,89,2,1,'2',1,0,1),(1,89,4,1,'2',1,0,100),(1,89,12,2,'1/#1/#1/#2/#2/#',0,0,0),(1,89,2,4,'110000',0,0,0),(1,89,2,3,'asdfasdf',1,1,100),(6,95,15,1,'3',1,0,5),(6,95,16,1,'3',1,0,5),(6,95,17,1,'1',1,0,0),(2,95,15,1,'2',1,0,3),(2,95,16,1,'2',1,0,3),(2,95,17,1,'3',1,0,5);
/*!40000 ALTER TABLE `exam_user_answer` ENABLE KEYS */;
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
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
INSERT INTO `friend` VALUES (0000000003,0000000001,1),(0000000001,0000000002,1),(0000000006,0000000001,1);
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
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,'group1','first group'),(2,'group2','second group'),(3,'testlog','testlog');
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
INSERT INTO `group_user` VALUES (1,3),(1,2),(1,1),(3,1),(3,3);
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
  `userIDB` int(10) unsigned zerofill DEFAULT '0000000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (2,0000000000,0000000095,0000000000,0000000000,0000000000,14,'2016/12/10 22:23:57',0000000000),(1,0000000000,0000000000,0000000029,0000000000,0000000000,4,'2016/12/10 23:07:20',0000000000),(1,0000000000,0000000000,0000000029,0000000018,0000000001,7,'2016/12/10 23:09:59',0000000000),(1,0000000000,0000000000,0000000029,0000000019,0000000001,7,'2016/12/10 23:10:44',0000000000),(1,0000000000,0000000000,0000000029,0000000003,0000000004,7,'2016/12/10 23:12:08',0000000000),(1,0000000000,0000000000,0000000029,0000000016,0000000002,7,'2016/12/10 23:20:25',0000000000),(1,0000000000,0000000000,0000000029,0000000003,0000000003,7,'2016/12/10 23:21:17',0000000000),(1,0000000000,0000000000,0000000029,0000000004,0000000003,7,'2016/12/10 23:22:29',0000000000),(1,0000000000,0000000098,0000000000,0000000000,0000000000,9,'2016/12/10 23:23:40',0000000000),(1,0000000000,0000000098,0000000000,0000000018,0000000001,12,'2016/12/10 23:23:40',0000000000),(1,0000000000,0000000098,0000000000,0000000019,0000000001,12,'2016/12/10 23:23:40',0000000000),(1,0000000000,0000000098,0000000000,0000000003,0000000004,12,'2016/12/10 23:23:40',0000000000),(1,0000000000,0000000098,0000000000,0000000016,0000000002,12,'2016/12/10 23:23:41',0000000000),(1,0000000000,0000000098,0000000000,0000000004,0000000003,12,'2016/12/10 23:23:41',0000000000);
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderID` int(11) DEFAULT NULL,
  `accepterID` int(11) DEFAULT NULL,
  `sendername` varchar(45) DEFAULT NULL,
  `message` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `rread` int(11) DEFAULT '0',
  `url` varchar(45) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,3,1,NULL,'用户 tmy3 申请您好友','2016/12/09 06:35:35',1,'showFriendInformation?userID=3',1),(2,1,3,NULL,'用户 tmy 接受了您的好友申请, 恭喜你们已成为社交问答网站好友','2016/12/09 06:35:55',0,'',2),(3,1,2,NULL,'用户 tmy 申请您好友','2016/12/09 19:00:56',1,'showFriendInformation?userID=1',1),(4,2,1,NULL,'用户 tmy2 接受了您的好友申请, 恭喜你们已成为社交问答网站好友','2016/12/09 19:01:24',1,'',2),(5,1,1,'系统提示您:','tmy回答了您的问题，请你抓紧时间批改哦！','2016/12/09 19:40:19',1,NULL,0),(6,1,1,'系统提示您:','tmy回答了您的问题，请你抓紧时间批改哦！','2016/12/09 19:45:28',0,NULL,0),(7,1,1,'系统提示您:','你的题目已经被check完毕了，赶紧快去看','2016/12/09 20:00:52',1,NULL,0),(8,1,2,NULL,'用户 tmy 申请您好友','2016/12/10 09:31:16',1,'showFriendInformation?userID=1',1),(9,2,1,NULL,'用户 tmy2 接受了您的好友申请, 恭喜你们已成为社交问答网站好友','2016/12/10 09:31:55',1,'',2),(10,1,2,NULL,'用户 tmy 申请您好友','2016/12/10 17:05:28',1,'showFriendInformation?userID=1',1),(11,2,1,NULL,'用户tmy2拒绝了您的好友申请','2016/12/10 17:05:47',1,'',6),(12,1,2,NULL,'用户 tmy 申请您好友','2016/12/10 17:31:28',1,'showFriendInformation?userID=1',1),(13,2,1,NULL,'用户 tmy2 接受了您的好友申请, 恭喜你们已成为社交问答网站好友','2016/12/10 17:33:02',1,'',2),(14,6,1,NULL,'用户 yc 申请您好友','2016/12/10 20:19:20',1,'showFriendInformation?userID=6',1),(15,1,6,NULL,'用户 tmy 接受了您的好友申请, 恭喜你们已成为社交问答网站好友','2016/12/10 20:20:25',0,'',2),(16,6,2,'系统提示您:','yc回答了您的问题，请你抓紧时间批改哦！','2016/12/10 22:05:26',0,NULL,0),(17,2,2,'系统提示您:','tmy2回答了您的问题，请你抓紧时间批改哦！','2016/12/10 22:23:58',0,NULL,0);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multy`
--

LOCK TABLES `multy` WRITE;
/*!40000 ALTER TABLE `multy` DISABLE KEYS */;
INSERT INTO `multy` VALUES (1,'testMulty1','1','2','3','4','','','110100','无',0),(2,'第一个多选题','111','222','333','444','','','011000','无',0),(3,'我们小组有哪些成员？','tmy','lsy','yc','xxx','','','111000','三个人啦',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbase`
--

LOCK TABLES `questionbase` WRITE;
/*!40000 ALTER TABLE `questionbase` DISABLE KEYS */;
INSERT INTO `questionbase` VALUES (2,1,'题库2','第二个题库'),(3,1,'题库3','第三个题库'),(5,1,'题库4','第四个题库'),(11,1,'null','null'),(12,1,'null','null'),(13,1,'null','null'),(14,1,'null','null'),(15,1,'null','null'),(16,1,'null','null'),(17,1,'null','null'),(18,1,'题库tmy','tmy的题库'),(21,1,'testLog','testlog'),(22,1,'testLog','testLog'),(23,1,'testMergeYC','testMergeYC'),(24,1,'testAandQ','testAandQ'),(25,1,'','testMulty'),(26,1,'testMulty','testMulty'),(27,1,'testAdd','testAdd'),(28,2,'心理测试','美国兰德公司经典心理测试'),(29,1,'测试题库','包含各种题型');
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
INSERT INTO `questionbase_question` VALUES (0000000002,1,1),(0000000002,2,1),(0000000018,4,1),(0000000002,5,1),(0000000005,6,1),(0000000018,7,1),(0000000003,8,1),(0000000003,1,2),(0000000003,9,1),(0000000003,9,2),(0000000003,11,2),(0000000002,12,2),(0000000022,10,1),(0000000022,11,1),(0000000022,12,1),(0000000022,13,2),(0000000022,14,2),(0000000002,15,2),(0000000022,13,1),(0000000023,14,1),(0000000024,2,3),(0000000026,2,4),(0000000028,15,1),(0000000028,16,1),(0000000028,17,1),(0000000029,18,1),(0000000029,19,1),(0000000029,3,4),(0000000029,16,2),(0000000029,4,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selection`
--

LOCK TABLES `selection` WRITE;
/*!40000 ALTER TABLE `selection` DISABLE KEYS */;
INSERT INTO `selection` VALUES (1,'题库2的第一个题','A','B','C','D','E','F','4','null',10,1,1,1,1,1,1),(2,'题库2的第二个题','A','B','C','D','E','F','3','null',6,1,1,1,1,1,1),(4,'tmy快疯了没有','没有','有','','','','','2','null',100,0,0,0,0,0,0),(5,'题库2的第三个题','1','2','3','4','5','6','6','null',1,0,0,0,0,0,0),(6,'题库4的第一个题','11','22','33','44','55','66','5','null',1,0,0,0,0,0,0),(7,'test','aaa','bbb','','','','','1','null',10,0,0,0,0,0,0),(8,'题库3的第一个单选题','11','22','33','44','55','','1','阿斯蒂芬',1,0,0,0,0,0,0),(9,'题库3的第二个单选题','11','22','33','','','','2','阿斯顿发生',2,0,0,0,0,0,0),(10,'选择题1','1','12','123','1234','','','1','1234',1,0,0,0,0,0,0),(11,'单选2','问题','阿斯蒂芬','','','','','2','萨达股份',1,0,0,0,0,0,0),(12,'单选2','问题','阿斯蒂芬','','','','','2','萨达股份',1,0,0,0,0,0,0),(13,'单选3','AA','BB','','','','','2','',1,0,0,0,0,0,0),(14,'testYC问答题1','123','1234','','','','','1','',1,0,0,0,0,0,0),(15,'你更喜欢吃的水果？','草莓','苹果','西瓜','菠萝','橘子','','1','',0,2,3,5,10,15,0),(16,'你平时休闲经常去的地方','郊外','电影院','公园','商场','酒吧','练歌房','1','',0,2,3,5,10,15,20),(17,'你认为容易吸引你的人是？','有才气的人','依赖你的人','优雅的人','','','','1','',0,2,3,5,0,0,0),(18,'软件工程大项目提交代码的ddl是什么时候？','周二晚上12','周三中午12','周三晚上12','','','','2','周三中午12点之前提交到乐学网',2,0,0,0,0,0,0),(19,'选几就得几分','得1分','得2分','','','','','1','无',0,1,2,0,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `textblank`
--

LOCK TABLES `textblank` WRITE;
/*!40000 ALTER TABLE `textblank` DISABLE KEYS */;
INSERT INTO `textblank` VALUES (1,'题库3的第1个填空题',3,'a','ab','abc',NULL,NULL,NULL,'无',0),(2,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(3,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(4,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(5,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(6,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(7,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(8,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(9,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(10,'题库3的第二个填空题',2,'a','b','','','','','',2),(11,'题库3的第二个填空题',2,'a','b','','','','','',2),(12,'题库2的第1个填空题',5,'21','22','23','24','25','','无',0),(13,'填空题1',2,'A','B','','','','','WEF',0),(14,'填空2',2,'12','123','','','','','',0),(15,'填空2',2,'11','22','','','','','',0),(16,'tmy的名字是？学号是？',2,'唐梦研','1140310522','','','','','没啥好解释的',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'tmy','1015',NULL,NULL,NULL,NULL),(2,'tmy2','1015',NULL,NULL,NULL,NULL),(3,'tmy3','1015',NULL,NULL,NULL,NULL),(4,'','',NULL,NULL,NULL,NULL),(5,'friend1','1015',NULL,NULL,NULL,NULL),(6,'yc','ycyc',NULL,NULL,'272CC8048B74EDC135C32AF8D30A23A2','FF2B9C18D3402BEDC01413ED51A03691');
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
INSERT INTO `user_questionbase` VALUES (1,2),(1,3),(1,18),(1,22),(1,24),(1,26),(1,27),(2,28),(1,29);
/*!40000 ALTER TABLE `user_questionbase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weibofriend`
--

DROP TABLE IF EXISTS `weibofriend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weibofriend` (
  `A` varchar(45) NOT NULL,
  `B` varchar(45) NOT NULL,
  `type` int(11) DEFAULT '0',
  `openB` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weibofriend`
--

LOCK TABLES `weibofriend` WRITE;
/*!40000 ALTER TABLE `weibofriend` DISABLE KEYS */;
INSERT INTO `weibofriend` VALUES ('yc','Tourist',1,NULL),('yc','RIKO',1,NULL),('yc','刘博皓',1,NULL),('yc','u7男人要活的高傲丶',1,NULL),('yc','Zhang47',1,NULL),('yc','毅少',1,NULL),('yc','刘元清',1,NULL),('yc','黄睿',1,NULL),('yc','刘雨桐',1,NULL),('yc','迟旭',1,NULL),('yc','有本事你咬我阿',1,NULL),('yc','司佳蓉',1,NULL),('yc','胡铭秋',1,NULL),('yc','诡异--夜',1,NULL),('yc','高玉涵',1,NULL),('yc','升瘦瘦',1,NULL),('yc','帅哥妈妈',1,NULL),('yc','夏雅桐',1,NULL),('yc','安然',1,NULL),('yc','请叫我美男子',1,NULL),('yc','李佳男',1,NULL),('yc','史明狄',1,NULL),('yc','哈师大14数学二班李天意',1,NULL),('yc','匡金凤',1,NULL),('yc','马源廷',1,NULL),('yc','于越',1,NULL),('yc','孙小楠',1,NULL),('yc','张翰奇',1,NULL),('yc','199653',1,NULL),('yc','刘岩',1,NULL);
/*!40000 ALTER TABLE `weibofriend` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-10 23:27:02
