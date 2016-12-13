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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aandq`
--

LOCK TABLES `aandq` WRITE;
/*!40000 ALTER TABLE `aandq` DISABLE KEYS */;
INSERT INTO `aandq` VALUES (1,'hhhhhhhh','null',0,'哈哈'),(2,'hhhhhhhh','红红火火恍恍惚惚',10,'哈哈哈哈'),(3,'软工的老师叫什么？','null',10,'这个都不知道就等着挂科吧'),(4,'软工的老师叫什么？ ','王忠杰',100,'这个都不知道就等着挂科吧 '),(5,'现在merge到什么程度了','刚和LSY合并完，正在测试功能是否完善',10,'rt');
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
  `userID` int(11) DEFAULT '0',
  `joiner` int(11) DEFAULT NULL,
  `rights` int(11) DEFAULT NULL,
  `people` int(11) DEFAULT '0',
  `totalscore` int(11) DEFAULT '0',
  `publish` int(11) DEFAULT '1',
  `groupID` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `groupID_idx` (`groupID`),
  KEY `userID_idx` (`userID`),
  CONSTRAINT `examInx_group` FOREIGN KEY (`groupID`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `examInx_user` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
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
  `GroupID` int(11) NOT NULL,
  `score` int(11) DEFAULT '0',
  KEY `examID_idx` (`examID`),
  KEY `GroupID_idx` (`GroupID`),
  CONSTRAINT `exam_questionInx_exam` FOREIGN KEY (`examID`) REFERENCES `exam` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question`
--

LOCK TABLES `exam_question` WRITE;
/*!40000 ALTER TABLE `exam_question` DISABLE KEYS */;
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
  `checked` int(11) DEFAULT '0',
  KEY `user_idx` (`userID`),
  KEY `exam_idx` (`examID`),
  CONSTRAINT `exam` FOREIGN KEY (`examID`) REFERENCES `exam` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_user`
--

LOCK TABLES `exam_user` WRITE;
/*!40000 ALTER TABLE `exam_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_user_answer`
--

DROP TABLE IF EXISTS `exam_user_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_user_answer` (
  `userID` int(11) NOT NULL,
  `examID` int(11) NOT NULL,
  `questionID` int(11) NOT NULL,
  `questionType` int(11) NOT NULL,
  `answer` varchar(200) DEFAULT NULL,
  `rightt` int(11) DEFAULT NULL,
  `rrred` int(11) DEFAULT '0',
  `score` int(11) DEFAULT '0',
  KEY `exam_user_answerInx_exam_idx` (`examID`),
  KEY `exam_user_answerInx_user_idx` (`userID`),
  CONSTRAINT `exam_user_answerInx_exam` FOREIGN KEY (`examID`) REFERENCES `exam` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `exam_user_answerInx_user` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_user_answer`
--

LOCK TABLES `exam_user_answer` WRITE;
/*!40000 ALTER TABLE `exam_user_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_user_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  `type` int(1) NOT NULL,
  KEY `friendInx_A_idx` (`A`),
  KEY `friendInx_B_idx` (`B`),
  CONSTRAINT `friendInx_A` FOREIGN KEY (`A`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `friendInx_B` FOREIGN KEY (`B`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  `examID` int(11) NOT NULL,
  KEY `group_idx` (`groupID`),
  KEY `exam_idx` (`examID`),
  CONSTRAINT `group_examInx_exam` FOREIGN KEY (`examID`) REFERENCES `exam` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `group_examInx_group` FOREIGN KEY (`groupID`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `questionbaseID` int(11) NOT NULL,
  KEY `group_idx` (`groupID`),
  KEY `group_questionbaseInx_qBase_idx` (`questionbaseID`),
  CONSTRAINT `group_qbaseInx_group` FOREIGN KEY (`groupID`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `group_qbaseInx_qbase` FOREIGN KEY (`questionbaseID`) REFERENCES `questionbase` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `groupID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  KEY `group_userInx_group_idx` (`groupID`),
  KEY `group_userInx_user_idx` (`userID`),
  CONSTRAINT `group_userInx_group` FOREIGN KEY (`groupID`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `group_userInx_user` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `groupID` int(11) NOT NULL DEFAULT '0',
  `examID` int(11) NOT NULL DEFAULT '0',
  `qBaseID` int(11) NOT NULL DEFAULT '0',
  `questionID` int(10) unsigned zerofill DEFAULT '0000000000',
  `questionType` int(10) unsigned zerofill DEFAULT '0000000000',
  `action` int(1) NOT NULL DEFAULT '0',
  `time` varchar(45) NOT NULL,
  `userIDB` int(11) NOT NULL DEFAULT '0',
  KEY `logInx_user_idx` (`userID`),
  KEY `logInx_group_idx` (`groupID`),
  KEY `logInx_exam_idx` (`examID`),
  KEY `logInx_qbase_idx` (`qBaseID`),
  KEY `logInx_userB_idx` (`userIDB`),
  CONSTRAINT `logInx_exam` FOREIGN KEY (`examID`) REFERENCES `exam` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `logInx_group` FOREIGN KEY (`groupID`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `logInx_qbase` FOREIGN KEY (`qBaseID`) REFERENCES `questionbase` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `logInx_user` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `logInx_userB` FOREIGN KEY (`userIDB`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
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
  `senderID` int(11) NOT NULL,
  `accepterID` int(11) NOT NULL,
  `sendername` varchar(45) DEFAULT NULL,
  `message` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `rread` int(11) DEFAULT '0',
  `url` varchar(45) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `messageInx_sender_idx` (`senderID`),
  KEY `messageInx_accepter_idx` (`accepterID`),
  CONSTRAINT `messageInx_accepter` FOREIGN KEY (`accepterID`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `messageInx_sender` FOREIGN KEY (`senderID`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbase`
--

LOCK TABLES `questionbase` WRITE;
/*!40000 ALTER TABLE `questionbase` DISABLE KEYS */;
/*!40000 ALTER TABLE `questionbase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionbase_question`
--

DROP TABLE IF EXISTS `questionbase_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbase_question` (
  `questionBaseID` int(11) NOT NULL,
  `questionID` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  KEY `qbase_questionInx_qbase_idx` (`questionBaseID`),
  CONSTRAINT `qbase_questionInx_qbase` FOREIGN KEY (`questionBaseID`) REFERENCES `questionbase` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbase_question`
--

LOCK TABLES `questionbase_question` WRITE;
/*!40000 ALTER TABLE `questionbase_question` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selection`
--

LOCK TABLES `selection` WRITE;
/*!40000 ALTER TABLE `selection` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `textblank`
--

LOCK TABLES `textblank` WRITE;
/*!40000 ALTER TABLE `textblank` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_questionbase`
--

DROP TABLE IF EXISTS `user_questionbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_questionbase` (
  `userID` int(11) NOT NULL,
  `questionBaseID` int(11) NOT NULL,
  KEY `user_qbaseInx_user_idx` (`userID`),
  KEY `user_qbaseInx_qbase_idx` (`questionBaseID`),
  CONSTRAINT `user_qbaseInx_qbase` FOREIGN KEY (`questionBaseID`) REFERENCES `questionbase` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_qbaseInx_user` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_questionbase`
--

LOCK TABLES `user_questionbase` WRITE;
/*!40000 ALTER TABLE `user_questionbase` DISABLE KEYS */;
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

-- Dump completed on 2016-12-11 22:51:55
