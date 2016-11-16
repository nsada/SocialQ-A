-- MySQL dump 10.13  Distrib 5.7.15, for Win64 (x86_64)
--
-- Host: localhost    Database: social
-- ------------------------------------------------------
-- Server version	5.7.15-log


--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `description` mediumtext,
  `userID` int(11) DEFAULT NULL,
  `joiner` int(11) DEFAULT NULL,
  `rights` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `exam_question`
--

DROP TABLE IF EXISTS `exam_question`;
CREATE TABLE `exam_question` (
  `examID` int(11) NOT NULL,
  `questionID` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam_question`
--

LOCK TABLES `exam_question` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `questionbase`
--

DROP TABLE IF EXISTS `questionbase`;
CREATE TABLE `questionbase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questionbase`
--

LOCK TABLES `questionbase` WRITE;
INSERT INTO `questionbase` VALUES (2,1,'题库2','第二个题库'),(3,1,'题库3','第三个题库'),(5,1,'题库4','第四个题库'),(8,1,'题库1','第一个题库'),(11,1,'null','null'),(12,1,'null','null'),(13,1,'null','null'),(14,1,'null','null'),(15,1,'null','null'),(16,1,'null','null'),(17,1,'null','null'),(18,1,'题库tmy','tmy的题库');
UNLOCK TABLES;

--
-- Table structure for table `questionbase_question`
--

DROP TABLE IF EXISTS `questionbase_question`;
CREATE TABLE `questionbase_question` (
  `questionBaseID` int(10) unsigned zerofill DEFAULT NULL,
  `questionID` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questionbase_question`
--

LOCK TABLES `questionbase_question` WRITE;
INSERT INTO `questionbase_question` VALUES (0000000002,1,1),(0000000002,2,1),(0000000003,3,1),(0000000018,4,1);
UNLOCK TABLES;

--
-- Table structure for table `selection`
--

DROP TABLE IF EXISTS `selection`;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `selection`
--

LOCK TABLES `selection` WRITE;
INSERT INTO `selection` VALUES (1,'题库2的第一个题',4,'A','B','C','D','E','F','111100','null',10,0000000001,0000000001,0000000001,0000000001,0000000001,0000000001),(2,'题库2的第二个题',4,'A','B','C','D','E','F','111100','null',6,0000000001,0000000001,0000000001,0000000001,0000000001,0000000001),(3,'题库3的第一个题',1,'','','','','','','100000','null',0,0000000000,0000000000,0000000000,0000000000,0000000000,0000000000),(4,'tmy快疯了没有',1,'没有','有','','','','','010000','null',100,0000000000,0000000000,0000000000,0000000000,0000000000,0000000000);
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `questionBaseID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES (1,'tmy','1015',NULL,NULL);
UNLOCK TABLES;

--
-- Table structure for table `user_questionbase`
--

DROP TABLE IF EXISTS `user_questionbase`;
CREATE TABLE `user_questionbase` (
  `userID` int(11) DEFAULT NULL,
  `questionBaseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_questionbase`
--

LOCK TABLES `user_questionbase` WRITE;
INSERT INTO `user_questionbase` VALUES (1,2),(1,3),(1,5),(1,8),(1,18);
UNLOCK TABLES;

-- Dump completed on 2016-11-16 14:42:35
