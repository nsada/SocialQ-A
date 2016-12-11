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
  PRIMARY KEY (`ID`)
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
  `score` int(11) DEFAULT '0'
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
  `checked` int(11) DEFAULT '0'
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
INSERT INTO `friend` VALUES (0000000001,0000000002,1),(0000000006,0000000001,1),(0000000003,0000000001,1),(0000000001,0000000003,1);
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
INSERT INTO `group_questionbase` VALUES (1,2),(1,28);
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
INSERT INTO `group_user` VALUES (1,3),(1,2),(1,1),(3,1),(3,3),(3,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbase`
--

LOCK TABLES `questionbase` WRITE;
/*!40000 ALTER TABLE `questionbase` DISABLE KEYS */;
INSERT INTO `questionbase` VALUES (2,1,'题库2','第二个题库'),(3,1,'题库3','第三个题库'),(5,1,'题库4','第四个题库'),(11,1,'null','null'),(12,1,'null','null'),(13,1,'null','null'),(14,1,'null','null'),(15,1,'null','null'),(16,1,'null','null'),(17,1,'null','null'),(18,1,'题库tmy','tmy的题库'),(21,1,'testLog','testlog'),(22,1,'testLog','testLog'),(23,1,'testMergeYC','testMergeYC'),(24,1,'testAandQ','testAandQ'),(25,1,'','testMulty'),(26,1,'testMulty','testMulty'),(27,1,'testAdd','testAdd'),(28,2,'心理测试','美国兰德公司经典心理测试'),(29,1,'测试题库','包含各种题型'),(30,1,'测试merge','');
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
INSERT INTO `questionbase_question` VALUES (0000000002,1,1),(0000000002,2,1),(0000000018,4,1),(0000000002,5,1),(0000000005,6,1),(0000000018,7,1),(0000000003,8,1),(0000000003,1,2),(0000000003,9,1),(0000000003,9,2),(0000000003,11,2),(0000000002,12,2),(0000000022,10,1),(0000000022,11,1),(0000000022,12,1),(0000000022,13,2),(0000000022,14,2),(0000000002,15,2),(0000000022,13,1),(0000000023,14,1),(0000000024,2,3),(0000000026,2,4),(0000000028,15,1),(0000000028,16,1),(0000000028,17,1),(0000000029,18,1),(0000000029,19,1),(0000000029,3,4),(0000000029,16,2),(0000000029,4,3),(0000000029,5,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `textblank`
--

LOCK TABLES `textblank` WRITE;
/*!40000 ALTER TABLE `textblank` DISABLE KEYS */;
INSERT INTO `textblank` VALUES (1,'题库3的第1个填空题',3,'a','ab','abc',NULL,NULL,NULL,'无',0),(2,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(3,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(4,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(5,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(6,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(7,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(8,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(9,'3号题库的第一个填空题',3,'111','222','333','','','','无',3),(10,'题库3的第二个填空题',2,'a','b','','','','','',2),(11,'题库3的第二个填空题',2,'a','b','','','','','',2),(12,'题库2的第1个填空题',5,'21','22','23','24','25','','无',0),(13,'填空题1',2,'A','B','','','','','WEF',0),(14,'填空2',2,'12','123','','','','','',0),(15,'填空2',2,'11','22','','','','','',0),(16,'tmy的名字是？学号是？',2,'唐梦研','1140310522','','','','','没啥好解释的',2),(17,'测试删除功能',2,'fg ',' werg','','','','','sdf sdfg',2);
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
INSERT INTO `user_questionbase` VALUES (1,2),(1,3),(1,18),(1,24),(1,26),(1,27),(2,28),(1,29);
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

-- Dump completed on 2016-12-11 17:15:51
