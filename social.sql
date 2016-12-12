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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aandq`
--

LOCK TABLES `aandq` WRITE;
/*!40000 ALTER TABLE `aandq` DISABLE KEYS */;
INSERT INTO `aandq` VALUES (1,'开发过程中遇到的最坑的是什么？','第三方登录审核不过',50,'这个真心坑'),(2,'session为什么在部署到云平台后就一跳转就失效啊？','不知道',10,'你问我我确实不知道啊');
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
  KEY `userID_idx` (`userID`),
  CONSTRAINT `examInx_user` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (0,'null',NULL,0,NULL,NULL,0,0,1,0),(1,'美国兰德公司经典心理测试','简单的心理测试 以及 各种题型都测试一下\r\n						\r\n						\r\n						',1,2,2,8,149,0,0),(3,'测试朋友圈','朋友圈显示出了一套试卷\r\n						',1,1,1,1,0,1,0),(4,'测试message','						\r\n						',1,1,1,4,2,1,0),(8,'测试工作组','测试工作组出题链接是否正确\r\n						\r\n						',0,1,1,0,0,1,3);
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
INSERT INTO `exam_question` VALUES (1,1,1,8,8,0,21),(1,2,1,8,8,0,43),(1,4,1,13,3,0,9),(1,1,4,9,1,0,3),(1,1,2,8,1,0,15),(1,1,3,12,12,0,17),(1,2,3,8,8,0,31),(1,2,4,8,1,0,10),(3,4,1,13,3,0,9),(3,1,4,9,1,0,3),(4,4,1,13,3,0,9),(4,1,3,12,12,0,2),(8,4,1,0,0,3,0),(8,1,4,0,0,3,0),(8,2,4,0,0,3,0),(8,1,3,0,0,3,0),(8,1,1,0,0,3,0);
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
INSERT INTO `exam_user` VALUES (3,3,0,0),(4,2,2,1),(1,2,74,1),(1,3,3,0);
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
INSERT INTO `exam_user_answer` VALUES (3,3,4,1,'1',0,0,0),(3,3,1,4,'110000',0,0,0),(2,4,4,1,'1',0,0,0),(2,4,1,3,'你啊',1,1,2),(2,1,1,1,'3',1,0,5),(2,1,2,1,'6',1,0,20),(2,1,4,1,'1',0,0,0),(2,1,1,2,'123/#123123/#',0,0,0),(2,1,1,4,'000100',0,0,0),(2,1,2,4,'100000',0,0,0),(2,1,1,3,'……',1,1,0),(2,1,2,3,'god',1,1,1),(3,1,1,1,'1',1,0,0),(3,1,2,1,'2',1,0,3),(3,1,4,1,'3',0,0,0),(3,1,1,2,'111/#212/#333',0,0,0),(3,1,1,4,'010010',0,0,0),(3,1,2,4,'010100',0,0,0),(3,1,1,3,'第一个问答题的答案',1,0,0),(3,1,2,3,'第二题的问答题的答案',1,0,0);
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
INSERT INTO `friend` VALUES (2,1,1),(1,3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (0,'null',NULL),(2,'group1','测试和链接工作组出题'),(3,'group2','测试工作组'),(4,'测试个人动态','测试个人动态在添加工作组后是否更新正常');
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
INSERT INTO `group_questionbase` VALUES (3,1),(3,2);
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
INSERT INTO `group_user` VALUES (2,2),(3,2),(3,3),(3,1);
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
INSERT INTO `log` VALUES (1,0,0,0,0000000000,0000000000,19,'2016/12/12 01:16:30',3),(3,0,1,0,0000000000,0000000000,14,'2016/12/12 01:20:36',0),(1,0,3,0,0000000000,0000000000,9,'2016/12/12 01:38:16',0),(1,0,3,0,0000000004,0000000001,12,'2016/12/12 01:38:16',0),(1,0,3,0,0000000001,0000000004,12,'2016/12/12 01:38:16',0),(1,0,3,0,0000000000,0000000000,9,'2016/12/12 01:38:16',0),(3,0,3,0,0000000000,0000000000,14,'2016/12/12 01:41:06',0),(1,0,4,0,0000000000,0000000000,9,'2016/12/12 01:59:04',0),(1,0,4,0,0000000004,0000000001,12,'2016/12/12 01:59:04',0),(1,0,4,0,0000000001,0000000003,12,'2016/12/12 01:59:04',0),(2,0,4,0,0000000000,0000000000,14,'2016/12/12 02:00:12',0),(2,0,4,0,0000000000,0000000000,14,'2016/12/12 02:03:12',0),(2,0,4,0,0000000000,0000000000,14,'2016/12/12 02:04:06',0),(2,0,4,0,0000000000,0000000000,14,'2016/12/12 02:06:53',0),(2,0,1,0,0000000000,0000000000,14,'2016/12/12 02:28:02',0),(3,0,1,0,0000000000,0000000000,14,'2016/12/12 02:32:47',0),(3,0,1,0,0000000000,0000000000,14,'2016/12/12 03:11:10',0),(3,0,1,0,0000000000,0000000000,14,'2016/12/12 03:12:21',0),(3,0,1,0,0000000000,0000000000,14,'2016/12/12 03:15:24',0),(1,2,0,0,0000000000,0000000000,16,'2016/12/12 14:47:13',0),(1,3,0,0,0000000000,0000000000,15,'2016/12/12 14:48:05',0),(1,0,8,0,0000000000,0000000000,9,'2016/12/12 14:59:39',0),(1,0,8,0,0000000004,0000000001,12,'2016/12/12 14:59:39',0),(1,0,8,0,0000000001,0000000004,12,'2016/12/12 14:59:39',0),(1,0,8,0,0000000002,0000000004,12,'2016/12/12 14:59:39',0),(1,0,8,0,0000000001,0000000003,12,'2016/12/12 14:59:39',0),(1,0,8,0,0000000001,0000000001,12,'2016/12/12 14:59:39',0),(3,3,0,0,0000000000,0000000000,16,'2016/12/12 15:30:45',0),(1,3,0,0,0000000000,0000000000,25,'2016/12/12 15:31:57',3),(3,3,0,0,0000000000,0000000000,24,'2016/12/12 15:31:57',1),(1,4,0,0,0000000000,0000000000,15,'2016/12/12 15:35:24',0),(1,4,0,0,0000000000,0000000000,16,'2016/12/12 15:36:00',0),(1,3,0,0,0000000000,0000000000,16,'2016/12/12 15:50:38',0),(2,3,0,0,0000000000,0000000000,25,'2016/12/12 15:50:55',1),(1,3,0,0,0000000000,0000000000,24,'2016/12/12 15:50:55',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,2,1,NULL,'用户 tmy2 申请您好友','2016/12/11 23:09:52',1,'showFriendInformation?userID=2',1),(2,3,1,NULL,'用户 tmy3 申请您好友','2016/12/11 23:10:17',1,'showFriendInformation?userID=3',1),(3,1,2,NULL,'用户 tmy 接受了您的好友申请, 恭喜你们已成为社交问答网站好友','2016/12/12 00:12:03',1,'',2),(4,1,3,NULL,'用户tmy拒绝了您的好友申请','2016/12/12 00:12:06',1,'',6),(5,2,1,NULL,'用户tmy解除了和您的好友关系','2016/12/12 00:52:29',1,'',5),(6,1,3,NULL,'用户 tmy 申请您好友','2016/12/12 00:52:35',1,'showFriendInformation?userID=1',1),(7,3,1,NULL,'用户 tmy3 接受了您的好友申请, 恭喜你们已成为社交问答网站好友','2016/12/12 00:52:56',1,'',2),(8,1,2,NULL,'用户 tmy 申请您好友','2016/12/12 00:53:36',1,'showFriendInformation?userID=1',1),(9,2,1,NULL,'用户 tmy2 接受了您的好友申请, 恭喜你们已成为社交问答网站好友','2016/12/12 00:56:59',1,'',2),(10,2,1,NULL,'tmy2回答了您的问题，请你抓紧时间批改哦！','2016/12/12 00:58:45',1,'FindUserExam?ExamID=1&TesttakerID=2',3),(11,1,2,NULL,'你的题目已经被check完毕了，赶紧快去看','2016/12/12 00:59:49',1,'ShowExamDetail?ExamID=1&TesttakerID=2',4),(12,1,3,NULL,'用户tmy解除了和您的好友关系','2016/12/12 01:05:15',1,'',5),(13,1,2,NULL,'用户tmy解除了和您的好友关系','2016/12/12 01:06:33',1,'',5),(14,2,1,NULL,'用户 tmy2 申请您好友','2016/12/12 01:11:20',1,'showFriendInformation?userID=2',1),(15,1,2,NULL,'用户 tmy 接受了您的好友申请, 恭喜你们已成为社交问答网站好友','2016/12/12 01:11:37',1,'',2),(16,1,3,NULL,'用户 tmy 申请您好友','2016/12/12 01:15:53',1,'showFriendInformation?userID=1',1),(17,3,1,NULL,'用户 tmy3 接受了您的好友申请, 恭喜你们已成为社交问答网站好友','2016/12/12 01:16:30',1,'',2),(18,3,1,NULL,'tmy3回答了您的问题，请你抓紧时间批改哦！','2016/12/12 01:17:37',1,'FindUserExam?ExamID=1&TesttakerID=3',3),(19,3,1,NULL,'tmy3回答了您的问题，请你抓紧时间批改哦！','2016/12/12 01:20:37',1,'FindUserExam?ExamID=1&TesttakerID=3',3),(20,3,1,NULL,'tmy3回答了您的问题，请你抓紧时间批改哦！','2016/12/12 01:41:06',1,'FindUserExam?ExamID=3&TesttakerID=3',3),(21,1,3,NULL,'你的题目已经被check完毕了，赶紧快去看','2016/12/12 01:50:03',1,'ShowExamDetail?ExamID=1&TesttakerID=3',4),(22,2,1,NULL,'tmy2回答了您在试卷测试message中的问答题题，请抓紧时间批改哦！','2016/12/12 02:06:54',1,'FindUserExam?ExamID=4&TesttakerID=2',3),(23,1,2,NULL,'你的题目已经被 tmy check完毕了，赶紧快去看','2016/12/12 02:23:01',1,'ShowExamDetail?ExamID=4&TesttakerID=2',4),(24,2,1,NULL,'tmy2回答了您在试卷“美国兰德公司经典心理测试”中的问答题题，请抓紧时间批改哦！','2016/12/12 02:28:03',1,'FindUserExam?ExamID=1&TesttakerID=2',3),(25,1,2,NULL,'你的题目已经被 tmy check完毕了，赶紧快去看','2016/12/12 02:29:28',0,'ShowExamDetail?ExamID=1&TesttakerID=2',4),(26,3,1,NULL,'tmy3回答了您在试卷“美国兰德公司经典心理测试”中的问答题题，请抓紧时间批改哦！','2016/12/12 02:32:49',1,'FindUserExam?ExamID=1&TesttakerID=3',3),(27,1,3,NULL,'你的题目已经被 tmy check完毕了，赶紧快去看','2016/12/12 02:33:53',1,'ShowExamDetail?ExamID=1&TesttakerID=3',4),(28,3,1,NULL,'tmy3回答了您在试卷“美国兰德公司经典心理测试”中的问答题题，请抓紧时间批改哦！','2016/12/12 03:11:12',0,'FindUserExam?ExamID=1&TesttakerID=3',3),(29,3,1,NULL,'tmy3回答了您在试卷“美国兰德公司经典心理测试”中的问答题题，请抓紧时间批改哦！','2016/12/12 03:12:23',0,'FindUserExam?ExamID=1&TesttakerID=3',3),(30,3,1,NULL,'tmy3回答了您在试卷“美国兰德公司经典心理测试”中的问答题题，请抓紧时间批改哦！','2016/12/12 03:15:25',0,'FindUserExam?ExamID=1&TesttakerID=3',3),(31,2,1,NULL,'tmy2将您加入了工作组“group2”','2016/12/12 15:50:56',1,'showGroup?groupID=3',7);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multy`
--

LOCK TABLES `multy` WRITE;
/*!40000 ALTER TABLE `multy` DISABLE KEYS */;
INSERT INTO `multy` VALUES (1,'我们小组有哪些成员？','tmy','lsy','yc','xxx','','','111000','三个人~',3),(2,'我们的主要功能有','新建、删除、编辑题目','新建、删除、编辑题库','新建、编辑试卷','添加、删除好友','新建、退出工作组','向工作组中添加成员','111111','很棒！！',10);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbase`
--

LOCK TABLES `questionbase` WRITE;
/*!40000 ALTER TABLE `questionbase` DISABLE KEYS */;
INSERT INTO `questionbase` VALUES (0,NULL,NULL,NULL),(1,1,'心理测试','美国兰德公司经典心理测试'),(2,1,'测试题库','各种题型都有');
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
INSERT INTO `questionbase_question` VALUES (1,1,1),(1,2,1),(2,4,1),(2,1,4),(2,2,4),(2,1,2),(2,1,3),(2,2,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selection`
--

LOCK TABLES `selection` WRITE;
/*!40000 ALTER TABLE `selection` DISABLE KEYS */;
INSERT INTO `selection` VALUES (1,'你更喜欢吃的水果？','草莓','苹果 ','西瓜 ','菠萝 ','橘子 ','','1','',0,2,3,5,10,15,0),(2,'你平时休闲经常去的地方','郊外','电影院','公园','商场','酒吧 ','练歌房','1','无',0,2,3,5,10,15,20),(3,'你认为容易吸引你的人是？','有才气的人','依赖你的人','优雅的人','','','','1','',0,2,3,5,0,0,0),(4,'软工项目的截止时间是','周二晚上','周三中午','周三晚上','','','','2','周三中午12点',3,0,0,0,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `textblank`
--

LOCK TABLES `textblank` WRITE;
/*!40000 ALTER TABLE `textblank` DISABLE KEYS */;
INSERT INTO `textblank` VALUES (1,'tmy的名字和学号是？',2,'唐梦研','1140310522','','','','','~不需要解释吧',15);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0,NULL,NULL,NULL,NULL,NULL,NULL),(1,'tmy','1015','hitnstmy@163.com',NULL,'null','null'),(2,'tmy2','1015','1015@qq.com',NULL,'null','null'),(3,'tmy3','1015','1015@qq.com',NULL,'null','null');
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
INSERT INTO `user_questionbase` VALUES (1,1),(1,2);
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

-- Dump completed on 2016-12-12 15:54:10
