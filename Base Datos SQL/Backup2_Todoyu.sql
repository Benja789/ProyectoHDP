-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Todoyu
-- ------------------------------------------------------
-- Server version	10.1.48-MariaDB-0+deb9u2

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
-- Table structure for table `ext_assets_asset`
--

DROP TABLE IF EXISTS `ext_assets_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_assets_asset` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_update` int(10) unsigned NOT NULL DEFAULT '0',
  `id_person_create` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `id_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `parenttype` tinyint(1) NOT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `file_ext` varchar(10) NOT NULL,
  `file_storage` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_size` int(10) unsigned NOT NULL DEFAULT '0',
  `file_mime` varchar(20) NOT NULL,
  `file_mime_sub` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`id_parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_assets_asset`
--

LOCK TABLES `ext_assets_asset` WRITE;
/*!40000 ALTER TABLE `ext_assets_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `ext_assets_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_bookmark_bookmark`
--

DROP TABLE IF EXISTS `ext_bookmark_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_bookmark_bookmark` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_update` int(10) unsigned NOT NULL DEFAULT '0',
  `id_person_create` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `id_item` int(10) unsigned NOT NULL,
  `sorting` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `multi` (`id_person_create`,`id_item`,`type`,`deleted`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_bookmark_bookmark`
--

LOCK TABLES `ext_bookmark_bookmark` WRITE;
/*!40000 ALTER TABLE `ext_bookmark_bookmark` DISABLE KEYS */;
INSERT INTO `ext_bookmark_bookmark` VALUES (1,1254233035,0,1,0,1,2,0,''),(2,1264768629,0,1,0,1,115,0,''),(3,1264779035,0,1,0,1,60,0,''),(4,1264779042,0,1,0,1,59,0,''),(5,1264779432,0,12,0,1,145,0,''),(6,1264779489,0,18,0,1,133,0,''),(11,1264779710,0,18,0,1,60,0,''),(12,1264779712,0,18,0,1,135,0,'');
/*!40000 ALTER TABLE `ext_bookmark_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_calendar_event`
--

DROP TABLE IF EXISTS `ext_calendar_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_calendar_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_update` int(10) unsigned NOT NULL DEFAULT '0',
  `id_person_create` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id_project` int(10) NOT NULL DEFAULT '0',
  `id_task` int(10) unsigned NOT NULL,
  `eventtype` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `description` text,
  `place` varchar(255) NOT NULL,
  `date_start` int(10) unsigned NOT NULL DEFAULT '0',
  `date_end` int(10) unsigned NOT NULL DEFAULT '0',
  `is_private` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_dayevent` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id_series` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_calendar_event`
--

LOCK TABLES `ext_calendar_event` WRITE;
/*!40000 ALTER TABLE `ext_calendar_event` DISABLE KEYS */;
INSERT INTO `ext_calendar_event` VALUES (1,1268412756,1268412792,1,0,0,0,1,'My Reminder','','',1268469000,1268472600,0,0,0),(2,1268415673,1268415682,1,0,0,0,6,'Meet and Greet','','Long silver beach',1270105200,1270108800,1,1,0),(3,1268415697,1268415697,1,0,0,0,1,'Another one','','',1270105200,1270108800,0,1,0),(4,1268493335,1268493347,17,0,0,0,4,'Vacation','02/08/10 - 02/12/10','',1269331200,1269709200,0,0,0),(5,1268493502,1268493502,17,0,0,0,5,'Office Cert','Certification Day','',1270373400,1270377000,0,1,0),(6,1268493564,1268493564,17,0,0,0,6,'Project Meeting','','',1270134000,1270148400,0,0,0);
/*!40000 ALTER TABLE `ext_calendar_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_calendar_holiday`
--

DROP TABLE IF EXISTS `ext_calendar_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_calendar_holiday` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_update` int(10) unsigned NOT NULL DEFAULT '0',
  `id_person_create` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  `workingtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_calendar_holiday`
--

LOCK TABLES `ext_calendar_holiday` WRITE;
/*!40000 ALTER TABLE `ext_calendar_holiday` DISABLE KEYS */;
INSERT INTO `ext_calendar_holiday` VALUES (39,0,0,0,0,1230764400,'Neujahr','',0),(40,0,0,0,0,1230850800,'Berchtoldstag','',0),(41,0,0,0,0,1239314400,'Karfreitag','',0),(42,0,0,0,0,1239573600,'Ostermontag','',0),(43,0,0,0,0,1240178400,'Sechseläuten','In Zürich Mittag frei',240),(44,0,0,0,0,1241128800,'Tag der Arbeit','',0),(45,0,0,0,0,1243807200,'Pfingstmontag','',0),(46,0,0,0,0,1249077600,'Nationalfeiertag','',0),(47,0,0,0,0,1252879200,'Knabenschiessen','In Zürich am Mittag frei',240),(48,0,0,0,0,1261609200,'Heiligabend','ab Mittag frei',240),(49,0,0,0,0,1261695600,'Weihnachten','',0),(51,0,0,0,0,1261782000,'Stephanstag','',0),(52,0,0,0,0,1262214000,'Silvester','Ab Mittag frei',240),(54,0,0,0,0,1258930800,'Zibelemärit ','Mittag frei - nur Bern',240),(62,0,0,0,0,1242856800,'Auffahrt','',0),(63,0,0,0,0,1262300400,'Neujahrstag','',0),(64,0,0,0,0,1270159200,'Karfreitag','',0),(65,0,0,0,0,1270418400,'Ostermontag','',0),(66,0,0,0,0,1272664800,'Tag der Arbeit','',0),(67,0,0,0,0,1273701600,'Auffahrt','',0),(68,0,0,0,0,1274652000,'Pfingstmontag','',0),(69,0,0,0,0,1280613600,'Nationalfeiertag Schweiz','',0),(70,0,0,0,0,1293231600,'Weihnachten','',0),(71,0,0,0,0,1293318000,'Stephanstag','',0),(72,0,0,0,0,1266102000,'Valentinstag','',8),(73,0,0,0,0,1271628000,'Sechseläuten','',0),(74,0,0,0,0,1273356000,'Muttertag','',28800),(75,0,0,0,0,1293750000,'Silvester','',4);
/*!40000 ALTER TABLE `ext_calendar_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_calendar_holidayset`
--

DROP TABLE IF EXISTS `ext_calendar_holidayset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_calendar_holidayset` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_update` int(10) unsigned NOT NULL DEFAULT '0',
  `id_person_create` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_calendar_holidayset`
--

LOCK TABLES `ext_calendar_holidayset` WRITE;
/*!40000 ALTER TABLE `ext_calendar_holidayset` DISABLE KEYS */;
INSERT INTO `ext_calendar_holidayset` VALUES (1,0,1244290547,0,0,'Zürich','Switzerland'),(2,0,1244290548,0,0,'Bern','Switzerland'),(3,0,0,0,0,'USA','United States'),(4,0,0,0,0,'Japan','Japan');
/*!40000 ALTER TABLE `ext_calendar_holidayset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_calendar_mm_event_person`
--

DROP TABLE IF EXISTS `ext_calendar_mm_event_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_calendar_mm_event_person` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_event` int(10) unsigned NOT NULL DEFAULT '0',
  `id_person` int(10) unsigned NOT NULL,
  `is_acknowledged` tinyint(2) NOT NULL DEFAULT '0',
  `is_updated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_remindemail` int(10) unsigned NOT NULL DEFAULT '0',
  `is_remindemailsent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_remindpopup` int(10) unsigned NOT NULL DEFAULT '0',
  `is_remindpopupdismissed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `event` (`id_event`),
  KEY `person` (`id_person`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_calendar_mm_event_person`
--

LOCK TABLES `ext_calendar_mm_event_person` WRITE;
/*!40000 ALTER TABLE `ext_calendar_mm_event_person` DISABLE KEYS */;
INSERT INTO `ext_calendar_mm_event_person` VALUES (8,1,17,0,0,0,0,0,0),(7,1,1,1,0,0,0,0,0),(12,2,6,0,0,0,0,0,0),(11,2,1,1,0,0,0,0,0),(13,3,1,1,0,0,0,0,0),(15,4,17,1,0,0,0,0,0),(16,5,17,1,0,0,0,0,0),(17,6,17,1,0,0,0,0,0);
/*!40000 ALTER TABLE `ext_calendar_mm_event_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_calendar_mm_holiday_holidayset`
--

DROP TABLE IF EXISTS `ext_calendar_mm_holiday_holidayset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_calendar_mm_holiday_holidayset` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_holiday` int(10) unsigned NOT NULL DEFAULT '0',
  `id_holidayset` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `holiday` (`id_holiday`),
  KEY `holidayset` (`id_holidayset`)
) ENGINE=MyISAM AUTO_INCREMENT=433 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_calendar_mm_holiday_holidayset`
--

LOCK TABLES `ext_calendar_mm_holiday_holidayset` WRITE;
/*!40000 ALTER TABLE `ext_calendar_mm_holiday_holidayset` DISABLE KEYS */;
INSERT INTO `ext_calendar_mm_holiday_holidayset` VALUES (432,70,1),(431,72,1),(430,66,1),(429,66,1),(428,71,1),(427,75,1),(404,52,2),(426,73,1),(403,51,2),(425,68,1),(402,49,2),(401,48,2),(400,54,2),(424,65,1),(399,46,2),(398,45,2),(397,62,2),(423,63,1),(396,44,2),(422,69,1),(395,42,2),(421,74,1),(394,41,2),(393,40,2),(420,64,1),(392,39,2),(419,67,1),(378,48,3),(379,42,3),(380,40,3),(381,41,3),(382,52,3),(383,49,3),(384,42,3),(385,40,4),(386,48,4),(387,45,4),(388,52,4),(389,52,4),(390,42,4),(391,49,4);
/*!40000 ALTER TABLE `ext_calendar_mm_holiday_holidayset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_calendar_series`
--

DROP TABLE IF EXISTS `ext_calendar_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_calendar_series` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_update` int(10) unsigned NOT NULL DEFAULT '0',
  `id_person_create` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `frequency` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `interval` smallint(5) unsigned NOT NULL DEFAULT '0',
  `config` varchar(100) NOT NULL,
  `date_start` int(10) unsigned NOT NULL DEFAULT '0',
  `date_end` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_calendar_series`
--

LOCK TABLES `ext_calendar_series` WRITE;
/*!40000 ALTER TABLE `ext_calendar_series` DISABLE KEYS */;
/*!40000 ALTER TABLE `ext_calendar_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_comment_comment`
--

DROP TABLE IF EXISTS `ext_comment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_comment_comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_update` int(10) unsigned NOT NULL DEFAULT '0',
  `id_person_create` int(10) unsigned NOT NULL DEFAULT '0',
  `id_person_update` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id_task` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `comment` mediumtext NOT NULL,
  `is_public` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `task` (`id_task`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_comment_comment`
--

LOCK TABLES `ext_comment_comment` WRITE;
/*!40000 ALTER TABLE `ext_comment_comment` DISABLE KEYS */;
INSERT INTO `ext_comment_comment` VALUES (1,1257948894,1257948894,1,0,0,7,'<p>Hallo, schau dir das bitte mal an, wenn moeglich noch Heute</p>',0),(2,1268407482,1268407482,1,0,0,61,'<p>hahah</p>',0),(3,1268414813,1268414813,1,0,0,35,'<p>Hi Bob</p><p>can you start with this task a bit earlier?</p>',0),(4,1268415147,1268415147,17,0,0,60,'<p>Any questions concerning this one?</p>',0),(5,1268415228,1268415506,17,0,0,106,'<p>There seems to be a problem. Can you check the attachment to this task? And please send me a short feedback.</p>',0),(6,1268415585,1268415590,17,0,0,95,'<p>thanks for the good job. seems to be a good decision.</p>',0),(7,1268492476,1268492476,18,0,0,60,'<p>hey friedrich, please inform me when the task whereabouts have changed.</p>',1),(8,1268493417,1268493521,18,0,0,134,'<p>please see the attached image, does this meet the specs?</p>',0),(9,1268493697,1268493697,18,0,0,134,'<p>readme please.</p>',0),(10,1268493785,1268493785,12,0,0,134,'<p>Thanks for the image. It\'s ok so</p><p>Are you ready for the next step</p>',0),(11,1268495545,1268495545,1,0,0,60,'<p>When can we start?</p>',0),(12,1268495589,1268495589,12,0,0,116,'<p>There may come up a problem with this task. We should have a meeting before you start it. Please organize a meeting with all involved persons</p>',0),(13,1268500117,1268500117,1,0,0,149,'<p>sssafd</p>',0);
/*!40000 ALTER TABLE `ext_comment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_comment_fallback`
--

DROP TABLE IF EXISTS `ext_comment_fallback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_comment_fallback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL,
  `date_update` int(10) unsigned NOT NULL,
  `id_person_create` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `id_person_feedback` int(10) unsigned NOT NULL,
  `taskperson_feedback` varchar(10) NOT NULL,
  `id_role_feedback` int(10) unsigned NOT NULL,
  `id_person_email` int(10) unsigned NOT NULL,
  `taskperson_email` varchar(10) NOT NULL,
  `id_role_email` int(10) unsigned NOT NULL,
  `is_public` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_comment_fallback`
--

LOCK TABLES `ext_comment_fallback` WRITE;
/*!40000 ALTER TABLE `ext_comment_fallback` DISABLE KEYS */;
/*!40000 ALTER TABLE `ext_comment_fallback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_comment_mm_comment_asset`
--

DROP TABLE IF EXISTS `ext_comment_mm_comment_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_comment_mm_comment_asset` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL,
  `date_update` int(10) unsigned NOT NULL,
  `id_person_create` int(10) unsigned NOT NULL,
  `id_asset` int(10) unsigned NOT NULL,
  `id_comment` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_comment_mm_comment_asset`
--

LOCK TABLES `ext_comment_mm_comment_asset` WRITE;
/*!40000 ALTER TABLE `ext_comment_mm_comment_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `ext_comment_mm_comment_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_comment_mm_comment_feedback`
--

DROP TABLE IF EXISTS `ext_comment_mm_comment_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_comment_mm_comment_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL,
  `date_update` int(10) unsigned NOT NULL,
  `id_person_create` int(10) unsigned NOT NULL,
  `id_person_feedback` int(10) unsigned NOT NULL,
  `id_comment` int(10) unsigned NOT NULL,
  `is_seen` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment` (`id_comment`),
  KEY `personseen` (`id_person_feedback`,`is_seen`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_comment_mm_comment_feedback`
--

LOCK TABLES `ext_comment_mm_comment_feedback` WRITE;
/*!40000 ALTER TABLE `ext_comment_mm_comment_feedback` DISABLE KEYS */;
INSERT INTO `ext_comment_mm_comment_feedback` VALUES (1,1257948894,3715200,1,2,1,0),(2,1268414813,3715200,1,1,3,0),(3,1268415147,3715200,17,14,4,0),(4,1268415147,1268492476,17,18,4,1),(5,1268415147,3715200,17,17,4,0),(6,1268415506,3715200,17,1,5,0),(7,1268415590,3715200,17,1,6,0),(8,1268492476,3715200,18,14,7,0),(9,1268493417,3715200,18,14,8,0),(10,1268493417,3715200,18,17,8,0),(11,1268493513,1268493697,18,18,8,1),(12,1268493521,3715200,18,14,8,0),(13,1268493521,3715200,18,17,8,0),(14,1268493697,1268493785,18,12,9,1),(15,1268493785,3715200,12,18,10,0);
/*!40000 ALTER TABLE `ext_comment_mm_comment_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_contact_address`
--

DROP TABLE IF EXISTS `ext_contact_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_contact_address` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_update` int(10) unsigned NOT NULL,
  `id_person_create` int(10) unsigned NOT NULL,
  `deleted` tinyint(2) NOT NULL,
  `id_addresstype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id_country` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id_holidayset` int(11) NOT NULL DEFAULT '0',
  `id_timezone` smallint(3) NOT NULL DEFAULT '0',
  `street` varchar(255) NOT NULL,
  `postbox` varchar(32) NOT NULL,
  `city` varchar(64) NOT NULL,
  `region` varchar(64) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `is_preferred` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_contact_address`
--

LOCK TABLES `ext_contact_address` WRITE;
/*!40000 ALTER TABLE `ext_contact_address` DISABLE KEYS */;
INSERT INTO `ext_contact_address` VALUES (1,1264581712,1269508233,1,0,1,41,1,0,'Schneestrasse 23','','Zürich','Zürich','8000','',0),(2,1264581965,1269508901,1,0,1,41,1,0,'Winterthurerstrasse 3000','','Zürich','Zürich','8052','',0),(3,1264581965,1269508901,1,0,2,41,1,0,'Winterthurerstrasse 2080','','Zürich','','8052','',0),(4,1264581965,1269508901,1,0,3,41,1,0,'Winterthurerstrasse 1917','','Zürich','Zürich','8052','',0),(5,1264582231,1269509705,1,0,2,107,4,0,'26-1 Sakuragaoka-cho ','','Tokyo ','0','150-8512','',1),(6,1264582333,1269508400,1,0,1,74,3,0,'Lakeside View 22','PO Box189','Santa Rosa CA','0','29334','',1),(7,1264582503,1269508373,1,0,1,0,1,0,'Heimpfad 18','','Bern','','3001','',0),(8,1264583324,1269509036,1,0,1,220,1,0,'Hillside Park ','','Streetalete','0','25886','',1),(9,1264583514,1269508492,1,0,1,220,2,0,'Swansea','','Al aware','0','MA 02777','',0),(10,1264583707,1269509362,1,0,1,107,1,0,'アベニュー77ヒルサイド','','幕張','0','\"階B10010\"','',0),(11,1264583917,1269508153,1,0,1,41,1,0,'Stadelhofferstrasse 30','','Zug','Zug','6341','',0),(12,1264584243,1269508609,1,0,2,220,2,0,'Many Hills, 10th Street NE','','Bolter','0','CO 85302','',0),(13,1264587666,1269513255,1,0,2,74,0,0,'Prince of Wales Passage 57','','Camden','','12345','',1),(14,1264587852,1269509105,1,0,1,41,1,0,'Dreierstrasse 35','','Zürich','0','8000','',0),(15,1264696524,1620436366,1,0,2,41,1,0,'Zweierstrasse 35','','Zürich','Zürich','8004','',0),(16,1264780312,1269510278,18,0,1,0,0,0,'Mullnetherland Drive','1234','Scarborough','','80042','find out and add the region',1);
/*!40000 ALTER TABLE `ext_contact_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_contact_company`
--

DROP TABLE IF EXISTS `ext_contact_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_contact_company` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_update` int(10) unsigned NOT NULL,
  `id_person_create` int(10) unsigned NOT NULL,
  `deleted` tinyint(2) NOT NULL DEFAULT '0',
  `title` tinytext NOT NULL,
  `shortname` tinytext NOT NULL,
  `date_enter` int(10) unsigned NOT NULL DEFAULT '0',
  `is_internal` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `locale_correspondence` varchar(5) NOT NULL DEFAULT '',
  `is_notactive` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_contact_company`
--

LOCK TABLES `ext_contact_company` WRITE;
/*!40000 ALTER TABLE `ext_contact_company` DISABLE KEYS */;
INSERT INTO `ext_contact_company` VALUES (1,1264696524,1620436366,1,0,'UES','UES',1620436071,1,'','',0),(8,1264581712,1269508233,1,0,'Eisbergen GmbH','Eisbergen',1262300400,0,'','',0),(9,1264581965,1269508901,1,0,'Gripgrap Communications','Gripgrap',1262300400,0,'','',0),(10,1264582231,1269509705,1,0,'Transmetric Measure Co.','TransMeas',1217541600,0,'','',0),(11,1264582333,1269508400,1,0,'ABC-Tec Holding','ABCT',1262300400,0,'','',0),(12,1264582503,1269508373,1,0,'World Watches Fedaration','WWF',1262300400,0,'','',0),(13,1264583324,1269509036,1,0,'Innovacation Inc.','InnoVac',978303600,0,'','',0),(14,1264583514,1269508492,1,0,'Goodmonth','Goodmonth',1262300400,0,'','',0),(15,1264583707,1269509362,1,0,'Sugarion','sugarion',1262300400,0,'','',0),(16,1264583917,1269508153,1,0,'Customers ACME','Customers',1262300400,0,'','',0),(17,1264584243,1269508609,1,0,'Rainbowflag Ltd.','RBF',0,0,'','',0),(18,1264587852,1269509105,1,0,'snowman production AG','smp',1262300400,1,'','',0);
/*!40000 ALTER TABLE `ext_contact_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_contact_contactinfo`
--

DROP TABLE IF EXISTS `ext_contact_contactinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_contact_contactinfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_update` int(10) unsigned NOT NULL,
  `id_person_create` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `id_contactinfotype` smallint(5) unsigned NOT NULL DEFAULT '0',
  `info` tinytext NOT NULL,
  `is_preferred` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_contact_contactinfo`
--

LOCK TABLES `ext_contact_contactinfo` WRITE;
/*!40000 ALTER TABLE `ext_contact_contactinfo` DISABLE KEYS */;
INSERT INTO `ext_contact_contactinfo` VALUES (1,1259845750,1259848722,1,0,11,'http://www.snowflake.ch/',1),(2,1259845750,1259848722,1,0,4,'+41 44 455 80 80',1),(3,1259845750,1259848722,1,0,1,'info@snowflake.ch',1),(4,1259845750,1259848722,1,0,8,'+41 44 455 80 87',1),(5,1264581204,1269513298,1,0,4,'555 325 48 45',0),(6,1264581712,1269508233,1,0,1,'info@eisberggmbh.example.org',0),(7,1264581965,1269508901,1,0,1,'info@gripgrap.example.com',0),(8,1264581965,1269508901,1,0,8,'555 400 12 12',0),(9,1264581965,1269508901,1,0,4,'555 400 11 11',0),(10,1264582231,1269509705,1,0,1,'admin@transmeas.example.org',0),(11,1264582231,1269509705,1,0,4,'555 3456789',1),(12,1264582231,1269509705,1,0,11,'transmeas.example.org',0),(13,1264582333,1269508400,1,0,1,'abc@abc-tec.example..com',0),(14,1264582333,1269508400,1,0,4,'555-111-111-1',1),(15,1264582333,1269508400,1,0,11,'abc-tec.example.com',0),(16,1264582503,1269508373,1,0,1,'info@wwf.example.com',0),(17,1264582503,1269508373,1,0,4,'555 414 85 21',0),(18,1264582503,1269508373,1,0,11,'wwf.example.com',0),(19,1264583324,1269509036,1,0,1,'info@inoinc.example.com',0),(20,1264583324,1269509036,1,0,4,'555 1.433.1980',0),(21,1264583514,1269508492,1,0,1,'admin@goodmonth.example.com',0),(22,1264583514,1269508492,1,0,4,'555 3063 085',1),(23,1264583707,1264583707,1,0,1,'sugarion@sugarino.ch',0),(24,1264583707,1269509362,1,0,4,'555 70982200',0),(25,1264583917,1269508153,1,0,1,'trava@trava.example..com',1),(26,1264583917,1269508153,1,0,8,'555 211 01 46',0),(27,1264583917,1269508153,1,0,6,'555 211 01 45',0),(28,1264583917,1269508153,1,0,4,'555 211 01 45',0),(29,1264583917,1269508153,1,0,11,'www.trava.example..com',0),(30,1264584243,1269508609,1,0,1,'contact@rainbow.example.org',0),(31,1264584243,1269508609,1,0,4,'555-2154832322',0),(32,1264584243,1269508609,1,0,11,'rainbow.example.org',0),(33,1264584484,1269513353,1,0,4,'555 714 21 15',0),(37,1264584644,1269510452,1,0,4,'555 211 01 50',0),(38,1264584644,1269510452,1,0,7,'555 211 01 51',0),(39,1264584718,1269509362,1,0,1,'sugarion@sugarion.example.com',1),(40,1264584718,1269509362,1,0,11,'www.sugarion.example.com',0),(42,1264584779,1269513272,1,0,4,'555 455 77 25',0),(43,1264585014,1269513365,1,0,4,'555 284 45 80',0),(45,1264585252,1269513237,1,0,4,'555 7654321',1),(46,1264585252,1269513237,1,0,6,'555 34567899',0),(49,1264585479,1269513406,1,0,8,'555 722 98 99',0),(51,1264585479,1269513406,1,0,7,'555 720 98 99',0),(52,1264585479,1269513406,1,0,6,'555 720 98 98',0),(53,1264585479,1269513406,1,0,9,'555 322 12 52',0),(55,1264585479,1269513406,1,0,4,'555 722 98 98',0),(56,1264585479,1269513406,1,0,2,'555 720 98 98',0),(57,1264585573,1269513430,1,0,4,'555 414 85 21',1),(58,1264585673,1269511275,1,0,4,'555 400 12 14',0),(59,1264585840,1269513340,1,0,4,'555 454 11 45',0),(60,1264587666,1269513255,1,0,4,'555 455 00 12',1),(61,1264587852,1269509105,1,0,1,'info@snowman.example.com',0),(62,1264587852,1269509105,1,0,4,'555 455 00 00',0),(63,1264587852,1269509105,1,0,8,'555 455 00 01',0),(65,1264696524,1269509610,1,0,1,'team@todoyu.com',0),(66,1620610699,1624400611,1,0,1,'mr18136@ues.edu.sv',0),(67,1620610763,1620610763,1,0,1,'oc18024@ues.edu.sv',0),(68,1620610836,1620610836,1,0,1,'rp18066@ues.edu.sv',0);
/*!40000 ALTER TABLE `ext_contact_contactinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_contact_contactinfotype`
--

DROP TABLE IF EXISTS `ext_contact_contactinfotype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_contact_contactinfotype` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `id_person_create` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `category` smallint(5) unsigned NOT NULL,
  `key` varchar(32) NOT NULL,
  `title` varchar(64) NOT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_contact_contactinfotype`
--

LOCK TABLES `ext_contact_contactinfotype` WRITE;
/*!40000 ALTER TABLE `ext_contact_contactinfotype` DISABLE KEYS */;
INSERT INTO `ext_contact_contactinfotype` VALUES (1,0,0,0,0,1,'email_business','LLL:contact.ext.contactinfo.type.email_business',1),(2,0,0,0,0,2,'tel_private','LLL:contact.ext.contactinfo.type.tel_private',0),(3,0,0,0,0,2,'tel_exchange','LLL:contact.ext.contactinfo.type.tel_exchange',1),(4,0,0,0,0,2,'tel_business','LLL:contact.ext.contactinfo.type.tel_business',1),(5,0,0,0,0,1,'email_private','LLL:contact.ext.contactinfo.type.email_private',0),(6,0,0,0,0,2,'mobile_business','LLL:contact.ext.contactinfo.type.mobile_business',1),(7,0,0,0,0,2,'fax_private','LLL:contact.ext.contactinfo.type.fax_private',0),(8,0,0,0,0,2,'fax_business','LLL:contact.ext.contactinfo.type.fax_business',1),(9,0,0,0,0,2,'mobile_private','LLL:contact.ext.contactinfo.type.mobile_private',0),(10,0,0,0,0,2,'fax_exchange','LLL:contact.ext.contactinfo.type.fax_exchange',1),(11,0,0,0,0,3,'website','LLL:contact.ext.contactinfo.type.website',1),(12,0,0,0,0,3,'skype','LLL:contact.ext.contactinfo.type.skype',0);
/*!40000 ALTER TABLE `ext_contact_contactinfotype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_contact_jobtype`
--

DROP TABLE IF EXISTS `ext_contact_jobtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_contact_jobtype` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `id_person_create` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_contact_jobtype`
--

LOCK TABLES `ext_contact_jobtype` WRITE;
/*!40000 ALTER TABLE `ext_contact_jobtype` DISABLE KEYS */;
INSERT INTO `ext_contact_jobtype` VALUES (1,1264761659,0,1,0,'Project Manager'),(2,1264761659,0,1,0,'CEO'),(3,1264761659,0,1,0,'Receptionist'),(4,1264761659,0,1,0,'Developer'),(5,1264761659,0,1,0,'IT-Manager'),(6,1264761659,0,1,0,'Test Engineer');
/*!40000 ALTER TABLE `ext_contact_jobtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_contact_mm_company_address`
--

DROP TABLE IF EXISTS `ext_contact_mm_company_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_contact_mm_company_address` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_company` int(10) unsigned NOT NULL DEFAULT '0',
  `id_address` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ref` (`id_company`,`id_address`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_contact_mm_company_address`
--

LOCK TABLES `ext_contact_mm_company_address` WRITE;
/*!40000 ALTER TABLE `ext_contact_mm_company_address` DISABLE KEYS */;
INSERT INTO `ext_contact_mm_company_address` VALUES (1,8,1),(7,12,7),(12,16,11),(14,9,2),(15,9,3),(16,9,4),(24,14,9),(26,15,10),(27,11,6),(28,13,8),(29,17,12),(30,10,5),(35,18,14),(36,1,15);
/*!40000 ALTER TABLE `ext_contact_mm_company_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_contact_mm_company_contactinfo`
--

DROP TABLE IF EXISTS `ext_contact_mm_company_contactinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_contact_mm_company_contactinfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_company` int(10) unsigned NOT NULL DEFAULT '0',
  `id_contactinfo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ref` (`id_company`,`id_contactinfo`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_contact_mm_company_contactinfo`
--

LOCK TABLES `ext_contact_mm_company_contactinfo` WRITE;
/*!40000 ALTER TABLE `ext_contact_mm_company_contactinfo` DISABLE KEYS */;
INSERT INTO `ext_contact_mm_company_contactinfo` VALUES (1,5,1),(2,5,2),(3,5,3),(4,5,4),(5,8,6),(39,9,9),(38,9,8),(37,9,7),(78,10,12),(77,10,11),(76,10,10),(70,11,15),(69,11,14),(68,11,13),(15,12,16),(16,12,17),(17,12,18),(72,13,20),(71,13,19),(61,14,21),(60,14,22),(67,15,39),(66,15,24),(33,16,29),(32,16,28),(31,16,27),(30,16,26),(29,16,25),(75,17,30),(74,17,31),(73,17,32),(65,15,40),(89,18,63),(88,18,62),(87,18,61),(83,1,65);
/*!40000 ALTER TABLE `ext_contact_mm_company_contactinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_contact_mm_company_person`
--

DROP TABLE IF EXISTS `ext_contact_mm_company_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_contact_mm_company_person` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_company` int(10) unsigned NOT NULL DEFAULT '0',
  `id_person` int(10) unsigned NOT NULL,
  `id_workaddress` int(10) unsigned NOT NULL,
  `id_jobtype` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ref` (`id_company`,`id_person`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_contact_mm_company_person`
--

LOCK TABLES `ext_contact_mm_company_person` WRITE;
/*!40000 ALTER TABLE `ext_contact_mm_company_person` DISABLE KEYS */;
INSERT INTO `ext_contact_mm_company_person` VALUES (1,1,1,0,0),(2,6,2,0,0),(4,5,2,0,0),(5,5,3,0,0),(11,8,4,0,0),(41,14,8,9,0),(32,11,5,0,0),(43,15,7,10,0),(50,16,6,11,1),(70,13,9,0,0),(73,1,18,15,4),(37,10,16,0,0),(18,12,11,0,0),(19,9,12,0,0),(34,17,13,0,0),(46,15,15,10,0),(39,12,10,7,0),(67,18,12,14,2),(74,18,14,14,0),(55,1,17,15,1),(71,1,1,15,4);
/*!40000 ALTER TABLE `ext_contact_mm_company_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_contact_mm_person_address`
--

DROP TABLE IF EXISTS `ext_contact_mm_person_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_contact_mm_person_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_person` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id_address` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ref` (`id_person`,`id_address`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_contact_mm_person_address`
--

LOCK TABLES `ext_contact_mm_person_address` WRITE;
/*!40000 ALTER TABLE `ext_contact_mm_person_address` DISABLE KEYS */;
INSERT INTO `ext_contact_mm_person_address` VALUES (4,14,13),(3,1,16);
/*!40000 ALTER TABLE `ext_contact_mm_person_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_contact_mm_person_contactinfo`
--

DROP TABLE IF EXISTS `ext_contact_mm_person_contactinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_contact_mm_person_contactinfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_person` int(10) unsigned NOT NULL DEFAULT '0',
  `id_contactinfo` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ref` (`id_person`,`id_contactinfo`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_contact_mm_person_contactinfo`
--

LOCK TABLES `ext_contact_mm_person_contactinfo` WRITE;
/*!40000 ALTER TABLE `ext_contact_mm_person_contactinfo` DISABLE KEYS */;
INSERT INTO `ext_contact_mm_person_contactinfo` VALUES (5,4,5),(17,5,35),(16,5,34),(15,5,33),(6,4,36),(84,6,37),(83,6,38),(70,7,42),(69,7,41),(66,8,44),(65,8,43),(88,9,45),(87,9,46),(86,9,47),(85,9,48),(62,10,56),(61,10,55),(60,10,54),(59,10,53),(58,10,52),(57,10,51),(56,10,50),(55,10,49),(30,11,57),(31,12,58),(33,13,59),(89,14,60),(38,16,64),(90,20,66),(91,21,67),(92,22,68);
/*!40000 ALTER TABLE `ext_contact_mm_person_contactinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_contact_mm_person_role`
--

DROP TABLE IF EXISTS `ext_contact_mm_person_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_contact_mm_person_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_person` int(10) unsigned NOT NULL DEFAULT '0',
  `id_role` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ref` (`id_person`,`id_role`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_contact_mm_person_role`
--

LOCK TABLES `ext_contact_mm_person_role` WRITE;
/*!40000 ALTER TABLE `ext_contact_mm_person_role` DISABLE KEYS */;
INSERT INTO `ext_contact_mm_person_role` VALUES (1,18,3),(2,12,2),(3,6,1);
/*!40000 ALTER TABLE `ext_contact_mm_person_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_contact_person`
--

DROP TABLE IF EXISTS `ext_contact_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_contact_person` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_update` int(10) unsigned NOT NULL DEFAULT '0',
  `id_person_create` smallint(5) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(2) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(100) NOT NULL,
  `id_smtpaccount` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `is_dummy` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `shortname` varchar(11) NOT NULL,
  `salutation` varchar(1) NOT NULL,
  `title` varchar(64) NOT NULL,
  `birthday` date NOT NULL,
  `comment` text NOT NULL,
  `mail_signature` text NOT NULL,
  `locale_correspondence` varchar(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_contact_person`
--

LOCK TABLES `ext_contact_person` WRITE;
/*!40000 ALTER TABLE `ext_contact_person` DISABLE KEYS */;
INSERT INTO `ext_contact_person` VALUES (1,1246615200,1264780312,0,0,'admin','aabb2100033f0352fe7458e412495148','molina.benjamin70@gmail.com',0,1,0,1,'Benjamin','Molina','BEMO','m','','0000-00-00','','',''),(2,1264581214,1269513208,1,0,'','','',0,0,0,0,'Neil','Aaron','NEAA','m','','0000-00-00','','',''),(3,1264581224,1269513218,1,0,'','','',0,0,0,0,'Seth','Acuna','SEAC','m','','1963-03-02','','',''),(4,1264581204,1269513298,1,0,'','','',0,0,0,0,'James','Brown','JABR','m','','1933-05-03','','',''),(5,1264584484,1269513353,1,0,'','','',0,0,0,0,'Ludwig','van Beethoven','LUVA','m','','1770-12-17','','',''),(6,1264584644,1269510452,1,0,'customer','5f4dcc3b5aa765d61d8327deb882cf99','curt@trava.example.com',0,0,0,1,'Curt','Customer','CUCU','m','','1980-04-04','','',''),(7,1264584779,1269513272,1,0,'','','',0,0,0,0,'Giuseppe','Verdi','GIVE','m','','1813-10-10','','',''),(8,1264585014,1269513365,1,0,'','','',0,0,0,0,'Marilyn','Monroe','MAMO','w','','1926-06-01','','',''),(9,1264585252,1269513237,1,0,'','','',0,0,0,0,'Ella','Fitzgerald','ELFI','w','','1917-04-25','','',''),(10,1264585479,1269513406,1,0,'','','',0,0,0,0,'Wolfgang Amadeus','Mozart','WOMO','m','','1756-01-27','','',''),(11,1264585573,1269513430,1,0,'','','',0,0,0,0,'Marlene','Dietrich','MADI','w','','1901-12-27','','',''),(12,1264585673,1269511275,1,0,'projectmanager','5f4dcc3b5aa765d61d8327deb882cf99','paul@gripgrap.example.com',0,0,0,1,'Paul','Projectmanager','PaPr','m','','1974-02-25','','',''),(13,1264585840,1269513340,1,0,'','','',0,0,0,0,'Joseph','Haydn','JOHA','m','','1732-03-31','','',''),(14,1264587666,1269513255,1,0,'','','',0,0,0,0,'Elvis','Presley','ELPR','m','','1935-01-08','','',''),(15,1264694201,1269513308,1,0,'','','',0,0,0,0,'Johann Sebastian','Bach','JOBA','m','','1685-03-21','','',''),(16,1264694923,1269513285,1,0,'','','',0,0,0,0,'Irino','Yoshirō','IRYO','m','','1921-11-13','','',''),(17,1264696599,1269513378,1,0,'','098f6bcd4621d373cade4e832627b4f6','',0,0,0,0,'Richard','Wagner','RIWA','m','','1813-05-22','','',''),(18,1264696672,1269513070,1,0,'staff','5f4dcc3b5aa765d61d8327deb882cf99','williworker@todoyu.example.com',0,0,0,1,'Willi','Worker','WiWo','m','','1970-01-09','','',''),(19,1264696709,1269513322,1,0,'','','',0,0,0,0,'Johannes','Brahms','JOBR2','m','','1833-05-07','','',''),(20,1620610699,1624400611,1,0,'','','',0,0,0,0,'Benjamin Antonio','Molina Rivas','BEMO','m','','2000-05-15','','','es_SV'),(21,1620610763,1620610763,1,0,'','','',0,0,0,0,'William Yassir','Ortiz Cativo','WIOR','m','','1999-05-06','','','es_SV'),(22,1620610836,1620610836,1,0,'','','',0,0,0,0,'Walter Alcides','Romero Portillo','WARO','m','','1999-07-10','','','es_SV');
/*!40000 ALTER TABLE `ext_contact_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_project_activity`
--

DROP TABLE IF EXISTS `ext_project_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_project_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_update` int(11) NOT NULL,
  `id_person_create` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_project_activity`
--

LOCK TABLES `ext_project_activity` WRITE;
/*!40000 ALTER TABLE `ext_project_activity` DISABLE KEYS */;
INSERT INTO `ext_project_activity` VALUES (1,1254232852,1254232852,1,0,'Consulting'),(2,1254232863,1254232863,1,0,'Java-Development'),(3,1254232867,1254232867,1,0,'Design'),(4,1254232876,1254232876,1,0,'Testing'),(5,1264696282,0,1,0,'Frontend Engineering'),(6,1264696297,0,1,0,'Database Engineering'),(7,1264778822,0,17,0,'Documentation');
/*!40000 ALTER TABLE `ext_project_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_project_mm_project_person`
--

DROP TABLE IF EXISTS `ext_project_mm_project_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_project_mm_project_person` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_project` int(10) unsigned NOT NULL DEFAULT '0',
  `id_person` int(10) unsigned NOT NULL,
  `id_role` int(10) unsigned NOT NULL,
  `comment` tinytext NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project` (`id_project`),
  KEY `person` (`id_person`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_project_mm_project_person`
--

LOCK TABLES `ext_project_mm_project_person` WRITE;
/*!40000 ALTER TABLE `ext_project_mm_project_person` DISABLE KEYS */;
INSERT INTO `ext_project_mm_project_person` VALUES (5,2,2,2,'',0),(4,2,3,1,'',0),(6,2,1,1,'',0),(48,4,14,1,'',0),(52,5,5,4,'',0),(32,6,14,1,'',0),(29,7,4,4,'',0),(28,7,14,1,'',0),(47,4,13,4,'',0),(54,8,6,4,'',0),(53,8,14,1,'',0),(20,9,14,1,'',0),(21,9,10,4,'',0),(22,10,14,1,'',0),(23,10,8,4,'',0),(24,11,14,1,'',0),(25,11,12,4,'',0),(26,12,14,1,'',0),(27,12,11,4,'',0),(51,5,14,1,'',0),(33,6,9,4,'',0),(35,13,14,1,'',0),(36,13,7,4,'',0),(50,5,1,2,'Bob is a busy man...',0),(44,14,12,1,'',0),(45,14,18,3,'',0),(46,14,15,2,'',0),(49,4,1,1,'',0),(60,15,22,2,'',1),(59,15,21,2,'',1),(58,15,20,1,'',1);
/*!40000 ALTER TABLE `ext_project_mm_project_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_project_project`
--

DROP TABLE IF EXISTS `ext_project_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_project_project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_update` int(10) unsigned NOT NULL DEFAULT '0',
  `id_person_create` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_start` int(10) unsigned NOT NULL DEFAULT '0',
  `date_end` int(10) unsigned NOT NULL DEFAULT '0',
  `date_deadline` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id_company` int(10) unsigned NOT NULL DEFAULT '0',
  `id_taskpreset` int(10) unsigned NOT NULL DEFAULT '0',
  `ext_comment_fallback` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`deleted`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_project_project`
--

LOCK TABLES `ext_project_project` WRITE;
/*!40000 ALTER TABLE `ext_project_project` DISABLE KEYS */;
INSERT INTO `ext_project_project` VALUES (1,1250698159,1620436375,1,0,1250575200,1268373600,1268373600,'My First Project','<p>This is the first todoyu project.</p>',1,1,0,0),(4,1268384090,1268494325,1,0,1268348400,1270940400,1271199600,'Relaunch Website','<p>Whole process of relaunching the website</p>',1,17,0,0),(5,1268390542,1624400120,1,1,1268348400,1270940400,1270940400,'Relaunch Website','<p>Relaunch Website</p>',5,11,0,0),(6,1268390582,1268396854,1,0,1268348400,1270940400,1270940400,'Relaunch Website','<p>Relaunch Website</p>',1,13,0,0),(7,1268390619,1624400179,1,1,1268348400,1270940400,1270940400,'Relaunch','<p>Relaunch</p>',3,8,0,0),(8,1268394088,1624400155,1,1,1268348400,1269039600,1269039600,'Hosting','<p>Hosting</p>',3,16,0,0),(9,1268394288,1624400140,1,1,1268434800,1270940400,1270940400,'Hosting','<p>Hosting</p>',5,10,0,0),(10,1268394515,1268397035,1,0,1234479600,1265929200,1265929200,'Monthly support','<p>Monthly support</p>',9,14,0,0),(11,1268395025,1268396979,1,0,1268348400,1270940400,1270940400,'Monthly support','<p>Monthly support</p>',8,9,0,0),(12,1268395452,1268396886,1,0,1234825200,1238194800,1238799600,'Redesign','<p>Redesign</p>',8,12,0,0),(13,1268396085,1268396944,1,0,1247176800,1252360800,1252360800,'Redesign','<p>Redesign</p>',9,15,0,0),(14,1268492740,1624400191,12,1,1270508400,1273273200,1273273200,'New Opensource Server','<p>Build a new server for opensource projects</p>',3,15,0,0),(15,1620610893,1620613664,1,0,1620021600,1623650400,1623650400,'Sistema que determina los cambios de los precios de los combustibles a nivel nacional','<p>Plan de trabajo para la tarea ex-aula de la asignatura HPD115</p>',3,1,0,0);
/*!40000 ALTER TABLE `ext_project_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_project_role`
--

DROP TABLE IF EXISTS `ext_project_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_project_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date_create` int(10) NOT NULL,
  `date_update` int(10) NOT NULL,
  `id_person_create` int(10) unsigned NOT NULL,
  `title` varchar(64) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_project_role`
--

LOCK TABLES `ext_project_role` WRITE;
/*!40000 ALTER TABLE `ext_project_role` DISABLE KEYS */;
INSERT INTO `ext_project_role` VALUES (1,0,1264696219,0,'Project Manager',0),(2,0,1264696225,0,'Developer',0),(3,0,0,0,'Designer',0),(4,0,1264696237,0,'External Project Manager',0),(5,0,1264696246,0,'Customer',0);
/*!40000 ALTER TABLE `ext_project_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_project_task`
--

DROP TABLE IF EXISTS `ext_project_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_project_task` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date_create` int(11) NOT NULL DEFAULT '0',
  `date_update` int(11) NOT NULL DEFAULT '0',
  `id_person_create` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id_project` int(10) unsigned NOT NULL DEFAULT '0',
  `id_parenttask` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `id_person_assigned` int(10) unsigned NOT NULL DEFAULT '0',
  `id_person_owner` int(10) unsigned NOT NULL DEFAULT '0',
  `date_deadline` int(10) unsigned NOT NULL DEFAULT '0',
  `date_start` int(10) unsigned NOT NULL DEFAULT '0',
  `date_end` int(10) unsigned NOT NULL DEFAULT '0',
  `tasknumber` smallint(6) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `id_activity` smallint(6) NOT NULL DEFAULT '0',
  `estimated_workload` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `is_acknowledged` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_public` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parenttask` (`id_parenttask`),
  KEY `project` (`id_project`),
  KEY `assigned_to` (`id_person_assigned`),
  KEY `multi` (`status`,`type`,`deleted`)
) ENGINE=MyISAM AUTO_INCREMENT=213 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_project_task`
--

LOCK TABLES `ext_project_task` WRITE;
/*!40000 ALTER TABLE `ext_project_task` DISABLE KEYS */;
INSERT INTO `ext_project_task` VALUES (8,1268384327,1268397212,1,0,2,4,0,'Hosting-Move','<p>Hosting-Move</p>',0,14,3715200,3715200,3715200,1,2,0,0,1,0,0),(9,1268384327,1268385158,1,0,2,4,0,'Conception','<p>Conception</p>',0,14,3715200,3715200,3715200,2,2,0,0,1,0,1),(10,1268384327,1268385165,1,0,2,4,0,'Design','<p>Design</p>',0,14,3715200,3715200,3715200,3,2,0,0,1,0,2),(11,1268384327,1268387290,1,0,2,4,0,'Developpment','<p>Developpment</p>',0,14,3715200,3715200,3715200,4,2,0,0,1,0,3),(12,1268384327,1268385091,1,0,2,4,0,'Testing & Quality Managmenet','<p>Testing And Quality Managmenet</p>',0,14,3715200,3715200,3715200,5,2,0,0,1,0,3),(13,1268384327,1268385096,1,0,2,4,0,'Bugs','<p>Bugs</p>',0,14,3715200,3715200,3715200,6,2,0,0,1,0,4),(14,1268384327,1268385116,1,0,2,4,0,'Change Requests','<p>Change Requests</p>',0,14,3715200,3715200,3715200,7,2,0,0,1,0,5),(15,1268384327,1268385175,1,0,2,4,0,'Short documentations','<p>Short documentations</p>',0,14,3715200,3715200,3715200,8,2,0,0,1,0,6),(17,1268385470,1268412532,1,0,1,4,8,'Copy the website','<p>https://www.domain.com</p><p>User: administrators</p><p>PW: ******</p>',3,3,1269076620,1268385420,1268990220,10,2,1,28800,1,0,0),(18,1268385470,1268385646,1,0,1,4,8,'Change DNS','<p>Localisation of installation:</p><p>Domain name:</p>',14,14,1269076620,1268990220,1268990220,11,2,1,3600,1,0,1),(20,1268385778,1268385778,1,0,1,4,8,'Checking the new website / migrate adjustments','<p>Checking the new website / migrate adjustments</p>',3,3,1269076920,1268731320,1269076920,13,2,1,14400,0,0,3),(21,1268385928,1268385937,1,0,1,4,8,'Documentation of adjustments','<p>- moving again</p><p>- list with files, templates, sites, configs</p><p>- notice the necessary changes for working on our sever</p>',3,3,1269077100,1269077040,1269077100,14,2,1,3600,1,0,4),(22,1268386049,1268386049,1,0,1,4,9,'Analysis','<p>analysis of the necessary menu points</p>',14,14,1269336420,1269336360,1269336360,15,2,3,21600,0,0,0),(23,1268386152,1268386152,1,0,1,4,9,'Technical Workshop','<p>Basic is task 4.15</p><p>- specifications</p><p>- planing implementation</p>',14,14,1269682080,1269422880,1269682080,16,2,3,28800,0,0,1),(24,1268386236,1268386236,1,0,1,4,9,'Designing Workshop','<p>- Navigation</p><p>- Target audiance</p><p>- Design</p>',14,14,1269682200,1269423000,1269682200,17,2,3,18000,0,0,2),(25,1268386534,1268387773,1,0,1,4,10,'Screendesign','<p>- Two proposals</p><p>- Extensions</p><p>- Corrections</p>',14,14,1270287060,1269682260,1270287060,18,2,3,72000,1,0,0),(26,1268387251,1268387251,1,0,1,4,10,'Header Images','<p>Chosse some fitting images for the header, one per section</p>',14,14,1269683220,1269337620,1269683220,19,2,3,7200,0,0,1),(28,1268387432,1268387788,1,0,1,4,11,'Picture gallery','<p>Installation of pic-gallery</p>',14,14,1270288200,1269942600,1270288200,21,2,2,14400,1,0,1),(29,1268387692,1268387783,1,0,1,4,11,'Calendar','<p>iplementing the calendar</p>',14,14,1270288440,1269942840,1270288440,22,2,2,10800,1,0,2),(30,1268387919,1268387919,1,0,1,4,11,'Rootline','<p>Installation of the rootline and adjusting to the design</p>',14,14,1270288680,1269943080,1270288680,23,2,2,1800,0,0,3),(31,1268388012,1268388012,1,0,1,4,11,'Multilingualism','<p>- German</p><p>- French</p><p>- English</p><p>- Italian</p>',14,14,1270288740,1269943140,1270288740,24,2,2,7200,0,0,4),(32,1268388095,1268388095,1,0,1,4,11,'Search','<p>- Full search</p><p>- Indexed search</p>',14,14,1270288860,1269943260,1270288860,25,2,2,3600,0,0,5),(33,1268388212,1268414749,1,0,1,4,12,'Testing I','<p>Testing I</p>',1,1,1270634520,1270548120,1270634520,26,2,4,18000,0,0,0),(34,1268388212,1268495132,1,0,1,4,12,'Testing II','<p>Testing II</p>',1,1,1270634520,1270548120,1270634520,27,2,4,10800,1,0,1),(35,1268388212,1268414822,1,0,1,4,12,'Testing Design','<p>Testing Design</p>',1,1,1270634520,1270548120,1270634520,28,2,4,10800,1,0,2),(36,1268388356,1268495102,1,0,1,4,13,'Bugfixing','<p>Bugfixing</p>',1,1,1270893900,1270721100,1270893900,29,3,4,36000,1,0,0),(37,1268390682,1624400179,1,1,2,7,0,'Conception','<p>Concpetion</p>',0,14,3715200,3715200,3715200,1,2,0,0,1,0,0),(38,1268390722,1624400179,1,1,2,7,0,'Production','<p>Production</p>',0,14,3715200,3715200,3715200,2,2,0,0,1,0,1),(42,1268390805,1624400179,1,1,2,7,0,'Individual extensions','<p>Individual extensions</p>',0,14,3715200,3715200,3715200,6,2,0,0,1,0,5),(43,1268390818,1624400179,1,1,2,7,0,'Change Requests','<p>Change Requests</p>',0,2,3715200,3715200,3715200,7,2,0,0,1,0,6),(44,1268390832,1624400179,1,1,2,7,0,'Bugs','<p>Bugs</p>',0,14,3715200,3715200,3715200,8,2,0,0,1,0,7),(45,1268390844,1624400179,1,1,2,7,0,'Coaching','<p>Coaching</p>',0,14,3715200,3715200,3715200,9,2,0,0,0,0,8),(46,1268390860,1624400179,1,1,2,7,0,'Hosting','<p>Hosting</p>',0,14,3715200,3715200,3715200,10,2,0,0,0,0,9),(47,1268391372,1624400179,1,1,1,7,37,'Workshop','<p>Zurich, 01.02.2011</p>',2,2,1268823300,1268736960,1268823300,11,5,1,16200,0,0,0),(48,1268391461,1624400179,1,1,1,7,37,'Conception','<p>Conception</p>',2,2,1268823420,1268391420,1268823420,12,5,1,14400,0,0,1),(49,1268391611,1624400179,1,1,1,7,38,'Production','<p>Production</p>',2,2,1270119480,1268909880,1270119480,13,3,2,72000,0,0,0),(50,1268391684,1624400179,1,1,1,7,38,'Testing','<p>Testing</p>',14,14,1270292400,1270119600,1270292400,14,2,4,18000,0,0,1),(51,1268393650,1624400179,1,1,1,7,42,'Search','<p>Search functions</p>',2,2,1270294380,1269948780,1270294380,15,2,2,7200,0,0,0),(52,1268393688,1624400179,1,1,1,7,43,'Reserver CR Template','<p>Reserver CR Template</p>',14,14,1270294440,1269948840,1270294440,16,2,2,7200,0,0,0),(53,1268393741,1624400179,1,1,1,7,43,'Reserver CR Extensions','<p>Reserver CR Extensions</p>',14,14,1270294500,1269948900,1270294500,17,2,2,7200,0,0,1),(54,1268393791,1624400179,1,1,1,7,44,'Template Bugs','<p>Template Bugs</p>',2,2,1270726560,1270553760,1270726560,18,2,4,7200,0,0,0),(55,1268393834,1624400179,1,1,1,7,44,'Application Bugs','<p>Application Bugs</p>',14,14,1270726620,1270553760,1270726560,19,2,4,7200,0,0,1),(56,1268393885,1624400179,1,1,1,7,45,'Coaching','<p>Coaching</p>',14,14,1271504220,1271158620,1271504220,20,2,1,28800,0,0,0),(57,1268393926,1624400179,1,1,1,7,46,'Domain registration','<p>Domain registration</p>',14,14,1270294680,1270294680,1270294680,21,2,2,1800,0,0,0),(58,1268393966,1624400179,1,1,1,7,46,'Transfer','<p>Transfer</p>',2,2,1270294740,1270294740,1270294740,22,2,2,7200,0,0,0),(59,1268394139,1624400155,1,1,1,8,0,'Domain Registration','<p>Domain Registration</p>',14,14,1268739660,1268739660,1268739660,1,3,2,1800,1,0,0),(60,1268394187,1624400155,1,1,1,8,0,'Data transfer','<p>Data transfer</p>',14,14,1269085320,1268826120,1268912520,2,3,2,14400,1,0,0),(61,1268394629,1268407473,1,0,1,10,0,'C&C 01/09','<p>Communication and clarification</p>',14,14,1237117800,1234525800,1237117800,1,8,1,7200,1,0,0),(62,1268394629,1268397046,1,0,1,10,0,'C&C 02/09','<p>Communication and clarification</p>',14,14,1239537000,1237290600,1239537000,2,8,1,7200,1,0,1),(64,1268394629,1268397050,1,0,1,10,0,'C&C 03/09','<p>Communication and clarification</p>',14,14,1242211800,1239623400,1242211800,4,8,1,7200,0,0,2),(65,1268394629,1268397055,1,0,1,10,0,'C&C 04/09','<p>Communication and clarification</p>',14,14,1244803800,1242298200,1244803800,5,8,1,7200,0,0,3),(66,1268394629,1268397059,1,0,1,10,0,'C&C 05/09','<p>Communication and clarification</p>',14,14,1247482200,1244890200,1247482200,6,8,1,7200,0,0,4),(69,1268394629,1268397064,1,0,1,10,0,'C&C 08/09','<p>Communication and clarification</p>',14,14,1255431000,1252839000,1255431000,9,8,1,7200,0,0,4),(73,1268395549,1268396891,1,0,1,12,0,'Proposal work out','<p>Proposal work out</p>',14,14,1235736300,1234825200,1235736300,1,8,3,28800,1,0,0),(74,1268395603,1268396895,1,0,1,12,0,'Adjust template','<p>adjusting</p>',14,14,1236859560,1235736360,1236859560,2,8,3,14400,0,0,1),(75,1268395842,1268395867,1,0,2,11,0,'Monthly support','<p>Monthly support</p>',0,14,3715200,3715200,3715200,1,2,0,0,1,0,0),(76,1268394629,1268396992,1,0,1,11,75,'C&C 01/09','<p>Communication and clarification</p>',14,14,1237117800,1234525800,1237117800,2,8,1,7200,1,0,0),(77,1268394629,1268396995,1,0,1,11,75,'C&C 02/09','<p>Communication and clarification</p>',14,14,1239537000,1237290600,1239537000,3,8,1,7200,1,0,1),(78,1268394629,1268397010,1,0,1,11,75,'C&C 03/09','<p>Communication and clarification</p>',14,14,1242211800,1239623400,1242211800,4,8,1,7200,0,0,2),(79,1268394629,1268397012,1,0,1,11,75,'C&C 04/09','<p>Communication and clarification</p>',14,14,1244803800,1242298200,1244803800,5,8,1,7200,0,0,3),(80,1268394629,1268397015,1,0,1,11,75,'C&C 05/09','<p>Communication and clarification</p>',14,14,1247482200,1244890200,1247482200,6,8,1,7200,0,0,4),(81,1268394629,1268397018,1,0,1,11,75,'C&C 08/09','<p>Communication and clarification</p>',14,14,1255431000,1252839000,1255431000,7,8,1,7200,0,0,4),(82,1268396147,1268396147,1,0,2,13,0,'Redesign','<p>Redesign</p>',0,14,3715200,3715200,3715200,1,2,0,0,0,0,0),(83,1268395549,1268396949,1,0,1,13,82,'Proposal work out','<p>Proposal work out</p>',14,14,1235736300,1234825200,1235736300,2,6,3,28800,0,0,0),(84,1268395603,1268396954,1,0,1,13,82,'Adjust template','<p>adjusting</p>',14,14,1236859560,1235736360,1236859560,3,6,3,14400,0,0,1),(85,1268396185,1624400140,1,1,2,9,0,'Hosting','<p>Hosting</p>',0,14,3715200,3715200,3715200,1,2,0,0,0,0,1),(86,1268394139,1624400140,1,1,1,9,85,'Domain Registration','<p>Domain Registration</p>',14,14,1268739660,1268739660,1268739660,2,5,2,1800,0,0,0),(87,1268394187,1624400140,1,1,1,9,85,'Data transfer','<p>Data transfer</p>',17,17,1269085320,1268826120,1268912520,3,3,2,14400,1,0,1),(88,1268396337,1624400120,1,1,2,5,0,'Relaunch 2011','<p>Relaunch 2011</p>',0,3,3715200,3715200,3715200,1,2,0,0,1,0,0),(89,1268384327,1624400120,1,1,2,5,88,'Hosting-Move','<p>Hosting-Move</p>',0,14,3715200,3715200,3715200,2,2,0,0,1,0,0),(90,1268385470,1624400120,1,1,1,5,89,'Copy the website','<p>https://www.domain.com</p><p>User: administrators</p><p>PW: ******</p>',3,3,1269076620,1268385420,1268990220,3,5,1,28800,1,0,0),(91,1268385470,1624400120,1,1,1,5,89,'Change DNS','<p>Localisation of installation:</p><p>Domain name:</p>',14,14,1269076620,1268990220,1268990220,4,5,1,3600,1,0,1),(92,1268385778,1624400120,1,1,1,5,89,'Checking the new website / migrate adjustments','<p>Checking the new website / migrate adjustments</p>',3,3,1269076920,1268731320,1269076920,5,5,1,14400,1,0,3),(93,1268385928,1624400120,1,1,1,5,89,'Documentation of adjustments','<p>- moving again</p><p>- list with files, templates, sites, configs</p><p>- notice the necessary changes for working on our sever</p>',3,3,1269077100,1269077040,1269077100,6,5,1,3600,1,0,4),(94,1268384327,1624400120,1,1,2,5,88,'Conception','<p>Conception</p>',0,14,3715200,3715200,3715200,7,2,0,0,1,0,1),(95,1268386049,1624400120,1,1,1,5,94,'Analysis','<p>analysis of the necessary menu points</p>',14,14,1269336420,1269336360,1269336360,8,5,3,21600,1,0,0),(96,1268386152,1624400120,1,1,1,5,94,'Technical Workshop','<p>Basic is task 4.15</p><p>- specifications</p><p>- planing implementation</p>',14,14,1269682080,1269422880,1269682080,9,5,3,28800,0,0,1),(97,1268386236,1624400120,1,1,1,5,94,'Designing Workshop','<p>- Navigation</p><p>- Target audiance</p><p>- Design</p>',14,14,1269682200,1269423000,1269682200,10,5,3,18000,1,0,2),(98,1268384327,1624400120,1,1,2,5,88,'Design','<p>Design</p>',0,14,3715200,3715200,3715200,11,2,0,0,1,0,2),(99,1268386534,1624400120,1,1,1,5,98,'Screendesign','<p>- Two proposals</p><p>- Extensions</p><p>- Corrections</p>',14,14,1270287060,1269682260,1270287060,12,5,3,72000,1,0,0),(100,1268387251,1624400120,1,1,1,5,98,'Header Images','<p>Chosse some fitting images for the header, one per section</p>',14,14,1269683220,1269337620,1269683220,13,5,3,7200,0,0,1),(101,1268384327,1624400120,1,1,2,5,88,'Developpment','<p>Developpment</p>',0,14,3715200,3715200,3715200,14,2,0,0,1,0,3),(102,1268387432,1624400120,1,1,1,5,101,'Picture gallery','<p>Installation of pic-gallery</p>',14,14,1270288200,1269942600,1270288200,15,5,2,14400,1,0,1),(103,1268387692,1624400120,1,1,1,5,101,'Calendar','<p>iplementing the calendar</p>',17,17,1270288440,1269942840,1270288440,16,5,2,10800,1,0,2),(104,1268387919,1624400120,1,1,1,5,101,'Rootline','<p>Installation of the rootline and adjusting to the design</p>',14,14,1270288680,1269943080,1270288680,17,5,2,1800,0,0,3),(105,1268388012,1624400120,1,1,1,5,101,'Multilingualism','<p>- German</p><p>- French</p><p>- English</p><p>- Italian</p>',14,14,1270288740,1269943140,1270288740,18,5,2,7200,0,0,4),(106,1268388095,1624400120,1,1,1,5,101,'Search','<p>- Full search</p><p>- Indexed search</p>',14,14,1270288860,1269943260,1270288860,19,5,2,3600,1,0,5),(107,1268384327,1624400120,1,1,2,5,88,'Testing & Quality Managmenet','<p>Testing And Quality Managmenet</p>',0,14,3715200,3715200,3715200,20,2,0,0,1,0,3),(108,1268388212,1624400120,1,1,1,5,107,'Testing I','<p>Testing I</p>',14,14,1270634520,1270548120,1270634520,21,5,4,18000,0,0,0),(109,1268388212,1624400120,1,1,1,5,107,'Testing II','<p>Testing II</p>',14,14,1270634520,1270548120,1270634520,22,5,4,10800,0,0,1),(110,1268388212,1624400120,1,1,1,5,107,'Testing Design','<p>Testing Design</p>',14,14,1270634520,1270548120,1270634520,23,5,4,10800,0,0,2),(111,1268384327,1624400120,1,1,2,5,88,'Bugs','<p>Bugs</p>',0,14,3715200,3715200,3715200,24,2,0,0,1,0,4),(112,1268388356,1624400120,1,1,1,5,111,'Bugfixing','<p>Bugfixing</p>',14,14,1270893900,1270721100,1270893900,25,5,4,36000,0,0,0),(113,1268396455,1268396455,1,0,2,6,0,'Relaunch 2011','<p>Relaunch 2011</p>',0,14,3715200,3715200,3715200,1,2,0,0,0,0,0),(114,1268390682,1268396477,1,0,2,6,113,'Conception','<p>Concpetion</p>',0,14,3715200,3715200,3715200,2,2,0,0,1,0,0),(115,1268391372,1268483831,1,0,1,6,114,'Workshop','<p>Zurich, 01.02.2011</p>',2,2,1268823300,1268736960,1268823300,3,3,1,16200,0,0,0),(116,1268391461,1268495520,1,0,1,6,114,'Conception','<p>Conception</p>',2,2,1268823420,1268391420,1268823420,4,2,1,14400,1,0,1),(117,1268390722,1268396486,1,0,2,6,113,'Production','<p>Production</p>',0,14,3715200,3715200,3715200,5,2,0,0,1,0,1),(118,1268391611,1268396486,1,0,1,6,117,'Production','<p>Production</p>',2,2,1270119480,1268909880,1270119480,6,2,2,72000,0,0,0),(119,1268391684,1268396486,1,0,1,6,117,'Testing','<p>Testing</p>',14,14,1270292400,1270119600,1270292400,7,2,4,18000,0,0,1),(120,1268390805,1268396496,1,0,2,6,113,'Individual extensions','<p>Individual extensions</p>',0,14,3715200,3715200,3715200,8,2,0,0,1,0,5),(121,1268393650,1268396496,1,0,1,6,120,'Search','<p>Search functions</p>',2,2,1270294380,1269948780,1270294380,9,2,2,7200,0,0,0),(122,1268390818,1268396510,1,0,2,6,113,'Change Requests','<p>Change Requests</p>',0,2,3715200,3715200,3715200,10,2,0,0,1,0,6),(123,1268393688,1268396510,1,0,1,6,122,'Reserver CR Template','<p>Reserver CR Template</p>',14,14,1270294440,1269948840,1270294440,11,2,2,7200,0,0,0),(124,1268393741,1268396510,1,0,1,6,122,'Reserver CR Extensions','<p>Reserver CR Extensions</p>',14,14,1270294500,1269948900,1270294500,12,2,2,7200,0,0,1),(125,1268390832,1268396524,1,0,2,6,113,'Bugs','<p>Bugs</p>',0,14,3715200,3715200,3715200,13,2,0,0,1,0,7),(126,1268393791,1268396524,1,0,1,6,125,'Template Bugs','<p>Template Bugs</p>',2,2,1270726560,1270553760,1270726560,14,2,4,7200,0,0,0),(127,1268393834,1268396524,1,0,1,6,125,'Application Bugs','<p>Application Bugs</p>',14,14,1270726620,1270553760,1270726560,15,2,4,7200,0,0,1),(128,1268390844,1268396537,1,0,2,6,113,'Coaching','<p>Coaching</p>',0,14,3715200,3715200,3715200,16,2,0,0,0,0,8),(129,1268393885,1268396537,1,0,1,6,128,'Coaching','<p>Coaching</p>',14,14,1271504220,1271158620,1271504220,17,2,1,28800,0,0,0),(130,1268390860,1268396548,1,0,2,6,113,'Hosting','<p>Hosting</p>',0,14,3715200,3715200,3715200,18,2,0,0,0,0,9),(131,1268393926,1268396548,1,0,1,6,130,'Domain registration','<p>Domain registration</p>',14,14,1270294680,1270294680,1270294680,19,2,2,1800,0,0,0),(132,1268393966,1268396548,1,0,1,6,130,'Transfer','<p>Transfer</p>',2,2,1270294740,1270294740,1270294740,20,2,2,7200,0,0,0),(133,1268493046,1624400191,12,1,2,14,0,'Todo before development','<p>Things we have to check before we start writing any code</p>',0,14,3715200,3715200,3715200,1,2,0,0,1,0,0),(134,1268493126,1624400191,12,1,1,14,133,'Check existing products','<p>Try to find other solutions which may have a solution for the same problem</p>',18,14,1270912260,1270566660,3715200,2,3,1,25200,1,0,0),(135,1268493126,1624400191,12,1,1,14,133,'Analyse other solutions','<p>Compare the pros and cons of the other products</p>',18,17,1271430660,1271171460,3715200,3,3,1,18900,1,0,1),(136,1268493126,1624400191,12,1,1,14,133,'Find valuable market segment','<p>Who would buy this product?</p>',18,1,1271776260,1271171460,3715200,4,3,1,25200,1,0,2),(137,1268493578,1624400191,12,1,2,14,0,'Production','<p>Coding</p>',0,12,3715200,3715200,3715200,5,2,0,0,1,0,1),(138,1268394187,1624400140,1,1,1,9,87,'Data preparation for transfer','<p>Data transfer preps</p><ol><li>Prepare</li><li>Check</li><li>Fix</li><li>Go!</li></ol>',17,17,1269085320,1268826120,1268912520,4,3,2,14400,1,0,1),(139,1268390818,1624400140,1,1,2,9,0,'Change Requests','<p>Change Requests</p>',0,2,3715200,3715200,3715200,5,2,0,0,1,0,0),(140,1268393688,1624400140,1,1,1,9,139,'Reserver CR Template','<p>Reserver CR Template</p>',14,14,1270294440,1269948840,1270294440,6,2,2,7200,0,0,0),(141,1268393741,1624400140,1,1,1,9,139,'Reserver CR Extensions','<p>Reserver CR Extensions</p>',14,14,1270294500,1269948900,1270294500,7,2,2,7200,0,0,1),(142,1268493814,1268493814,17,0,1,4,15,'Create Docu in wiki','<p>Just do it...</p>',3,3,1270912980,1268752920,1270912920,30,2,6,8400,0,0,0),(143,1268493992,1268493992,17,0,1,4,142,'Another documentation for the customer','<p>use OpenOffice</p>',3,3,1278771960,1273332360,1276352760,31,2,6,9000,0,0,0),(144,1268494282,1624400120,12,1,1,5,0,'This task was added really quick','<p>A very quick task</p>',12,12,1269099082,1268494282,1269099082,26,3,7,3600,1,0,1),(145,1268494347,1624400120,12,1,1,5,0,'Buy milk and bread','<p>And some sugar</p>',12,12,1269099147,1268494347,1269099147,27,3,3,3600,1,0,2),(146,1268494541,1624400191,12,1,1,14,137,'Build Framework','<p>Write framework code and structure</p>',14,14,1273760400,1272381600,3715200,6,3,6,7200,1,0,0),(147,1268494541,1624400120,12,1,1,5,145,'Build Framework','<p>Write framework code and structure</p>',14,14,1273760400,1272381600,3715200,28,2,6,7200,0,0,1),(148,1268494831,1624400191,18,1,1,14,0,'Write enduser documentation','<p>after finishing bugfixing the application, start planning the documentation roadmap and timeline</p>',18,18,1269099631,1268494831,1269099631,7,3,7,3600,1,0,2),(149,1268495892,1624400155,1,1,1,8,0,'What?','<p>Whaaaaat</p>',14,14,1268582280,1267027020,1268668620,3,2,1,72000,1,0,1),(150,1268495944,1624400155,1,1,1,8,149,'Time estimated','<p>Time estimated</p>',14,14,1268668680,1268495880,1268668680,4,2,1,38,1,0,0),(151,1268394139,1624400155,1,1,1,8,0,'Demo task with status: \"in planning\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,5,1,2,1800,1,0,1),(152,1268394139,1624400155,1,1,1,8,0,'Demo task with status: \"open\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,6,2,2,1800,1,0,3),(153,1268394139,1624400155,1,1,1,8,0,'Demo task with status: \"in progress\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,7,3,2,1800,1,0,4),(154,1268394139,1624400155,1,1,1,8,0,'Demo task with status: \"awaiting confirmation\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,8,4,2,1800,1,0,5),(155,1268394139,1624400155,1,1,1,8,0,'Demo task with status: \"done\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,9,5,2,1800,1,0,6),(156,1268394139,1624400155,1,1,1,8,0,'Demo task with status: \"accepted\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,10,6,2,1800,1,0,7),(157,1268394139,1624400155,1,1,1,8,0,'Demo task with status: \"rejected\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,11,7,2,1800,1,0,8),(158,1268394139,1624400155,1,1,1,8,0,'Demo task with status: \"cleared\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,12,8,2,1800,1,0,9),(159,1273079706,1624400155,1,1,2,8,150,'Publicly visible tasks','<p>Container with public tasks</p>',0,1,3715200,3715200,3715200,13,2,0,0,0,0,0),(160,1268394139,1624400155,1,1,1,8,159,'Demo task with status: \"open\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,14,2,2,1800,1,0,3),(161,1268394139,1624400155,1,1,1,8,159,'Demo task with status: \"in progress\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,15,3,2,1800,1,0,9),(162,1268394139,1624400155,1,1,1,8,159,'Demo task with status: \"in planning\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,16,1,2,1800,1,0,2),(163,1268394139,1624400155,1,1,1,8,159,'Demo task with status: \"awaiting confirmation\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,17,4,2,1800,1,0,3),(164,1268394139,1624400155,1,1,1,8,159,'Demo task with status: \"done\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,18,5,2,1800,1,0,4),(165,1268394139,1624400155,1,1,1,8,159,'Demo task with status: \"accepted\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,19,6,2,1800,1,0,6),(166,1268394139,1624400155,1,1,1,8,159,'Demo task with status: \"rejected\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,20,7,2,1800,1,0,7),(167,1268394139,1624400155,1,1,1,8,159,'Demo task with status: \"cleared\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,21,8,2,1800,1,0,4),(168,1273079706,1624400155,1,1,2,8,0,'Publicly visible tasks in container in project root','<p>Container with public tasks</p>',0,1,3715200,3715200,3715200,22,2,0,0,0,0,3),(169,1268394139,1624400155,1,1,1,8,168,'Demo task with status: \"open\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,23,2,2,1800,1,1,3),(170,1268394139,1624400155,1,1,1,8,168,'Demo task with status: \"in progress\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,24,3,2,1800,1,1,9),(171,1268394139,1624400155,1,1,1,8,168,'Demo task with status: \"in planning\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,25,1,2,1800,1,1,2),(172,1268394139,1624400155,1,1,1,8,168,'Demo task with status: \"awaiting confirmation\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,26,4,2,1800,1,1,3),(173,1268394139,1624400155,1,1,1,8,168,'Demo task with status: \"done\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,27,5,2,1800,1,1,4),(174,1268394139,1624400155,1,1,1,8,168,'Demo task with status: \"accepted\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,28,6,2,1800,1,1,6),(175,1268394139,1624400155,1,1,1,8,168,'Demo task with status: \"rejected\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,29,6,2,1800,1,1,7),(176,1268394139,1624400155,1,1,1,8,168,'Demo task with status: \"cleared\"','<p>no description further description</p>',14,14,1268739660,1268739660,1268739660,30,8,2,1800,1,1,4),(177,1620611030,1624394034,1,0,2,15,0,'Primera Etapa','<p>Planeacion e desarrollo de la primera etapa&nbsp;</p>',0,1,1621749600,1620021600,0,1,5,0,0,0,0,0),(178,1620611292,1620611292,1,0,1,15,177,'Instalacion del enterno de desarrollo','<p>Instalacion de los programas Todoyu, git, Mantis bug tracker que seran utilizados para el desarrollo de la tarea ex-aula</p>',20,1,1620540000,1620108000,1620453600,2,5,3,43200,0,1,0),(179,1620612022,1624394042,1,0,1,15,177,'Consulta al ingeniero','<p>Consulta que se realizara para aclarar dudas de las siguientes actividades, a realizar en la etapa</p>',21,1,1621130340,1620784740,1621130340,3,5,1,1800,0,1,1),(180,1620612587,1624394046,1,0,2,15,177,'Documento a entregar','<p>En esta etapa se creara y editara el documento que se entregara en la primera etapa, incluira los requisitos que se encuentran en el pdf</p>',0,1,1621749600,1620785340,0,4,5,0,0,0,1,2),(181,1620612733,1624394057,1,0,1,15,180,'Especificacion de requerimientos y estandares del proyecto','',22,1,1621476660,1621390200,1621476660,5,5,7,21600,0,1,0),(182,1620612859,1624394063,1,0,1,15,180,'Especificacion de requerimientos','',22,1,1621476840,1621390380,1621476780,6,5,7,21600,0,1,1),(183,1620612956,1624394068,1,0,1,15,180,'Modelo de calidad','<p>Determinacion del modelo de calidad a seguir en la realizacion del proyecto</p>',20,1,1621563300,1621476900,1621563300,7,5,7,21600,0,0,2),(184,1620613025,1620614016,1,1,1,15,180,'Diseño','<p>Unicamente el Modelo conceptual de clases</p>',21,1,1590113760,1590027360,1590113760,8,3,7,21600,0,1,6),(185,1620613140,1620614009,1,1,1,15,180,'Analisis','<p>Definicion del problema</p>',22,1,1621563480,1621477080,1621563480,9,3,7,21600,0,1,5),(186,1620613255,1624394081,1,0,1,15,180,'Definicion de estándares','',20,1,1621736400,1621650000,1621736400,10,5,7,21600,0,1,7),(187,1620613348,1624394090,1,0,1,15,177,'Presentar avances de primera etapa','',21,1,1621822920,1621822920,1621822920,11,5,7,7200,0,1,3),(188,1620614126,1620614349,1,1,1,15,177,'Analisis','',22,1,1621563480,1621477080,1621563480,12,3,7,21600,0,1,4),(189,1620614412,1624394076,1,0,1,15,180,'Analisis','<p>Definicion del problema</p>',22,1,1621563480,0,1621563480,13,5,7,21600,0,1,3),(190,1620615136,1624394072,1,0,1,15,180,'Diseño','<p>Unicamente el modelo conceptual de clases</p>',21,1,1621649880,1621563480,1621649880,14,5,7,21600,0,1,4),(191,1624396069,1624397224,1,0,1,15,0,'Segunda Etapa','<p>Desarrollo de la segunda etapa de la tarea ex-aula</p>',21,22,1624579200,1621987200,1624492800,15,3,7,216000,0,1,1),(192,1624396222,1624406500,1,0,2,15,191,'Base de datos','<p>Desarrollo relacionado a la base de datos del proyecto</p>',0,1,1622764800,1621900800,0,16,5,0,0,0,1,0),(193,1624396598,1624406505,1,0,1,15,192,'Diseño del modelo de base de datos a implementar','<p>Realizar el dise&ntilde;o del modelo de la base de datos a utilizar por medio de la herramienta Power Designer</p>',21,22,1622419200,1621987200,1622160000,17,5,3,18000,0,1,0),(194,1624396951,1624406518,1,0,1,15,192,'Recopilacion de datos historicos de precios del combustible','<p>Recopilar datos historicos del precio del combustible para posteriormente ser implementados</p>',22,1,1622419200,1622160000,1622419200,18,5,7,14400,0,1,1),(195,1624397189,1624406523,1,0,1,15,192,'Implementación del modelo de base de datos','<p>Implementar el modelo de base de datos realizado al gestor de base de datos</p>',20,21,1622592000,1622505600,1622592000,19,5,6,7200,0,1,2),(196,1624397414,1624406526,1,0,1,15,192,'Implementacion de datos recopilados a la base de datos','<p>Implementar los datos previamente recopilados al modelo de base de datos implementados</p>',22,20,1622678400,1622592000,1622678400,20,5,6,7200,0,1,3),(197,1624400560,1624401423,1,0,2,15,191,'Desarrollo del sistema','<p>Apartado para la realizacion del desarrollo del sistema de los precios del combustible</p>',0,20,1624492800,1622851200,0,21,3,0,0,0,1,1),(198,1624400846,1624401430,1,0,2,15,197,'Desarrollo en Django (Backend)','<p>Desarrollo de la aplicacion utilizando el framework web Django</p>',0,22,1624492800,1622851200,0,22,3,0,0,0,1,0),(199,1624400974,1624400974,1,0,2,15,197,'Desarrollo Web (Frontend)','<p>Desarrollo de la pagina web a utilizar</p>',0,1,1624492800,1622851200,0,23,3,0,0,0,0,1),(200,1624401226,1624406543,1,0,1,15,198,'Creacion de la app en Django','<p>Creacion de la app principal a utilizar</p>',21,20,1623024000,1622937600,1623024000,24,5,3,7200,0,1,0),(201,1624401402,1624406546,1,0,1,15,198,'Configuraciones iniciales en Django','<p>Configuraciones basicas iniciales a la app principal de DJango</p>',21,22,1623110400,1623024000,1623110400,25,5,7,7200,0,1,1),(202,1624401772,1624403359,1,0,2,15,198,'App de control','<p>Apartado para las App de control o app que se encuentran dentro de la app principal dentro de django</p>',0,1,1623369600,1623110400,0,26,3,0,0,0,1,2),(203,1624401990,1624406553,1,0,1,15,202,'Identifcar las app a utilizar','<p>Identificar las app que se utilizaran dentro de la app principal (Generalmente una app por cada tabla que se encuentre en la base de datos)</p>',21,1,1623196800,1623110400,1623196800,27,5,3,3600,0,1,0),(204,1624403340,1624406558,1,0,1,15,202,'Crear las app en Django','',22,20,1623196800,1623110400,1623196800,28,5,3,3600,0,1,1),(205,1624403516,1624406564,1,0,1,15,202,'Realizar las clases en el modelo de cada App','<p>Cada clase representa una tabla de la base de datos</p>',22,22,1623283200,1623196800,1623283200,29,5,3,3600,0,1,2),(206,1624403669,1624406572,1,0,1,15,202,'Implementar columnas como atributos en las clases de cada App','<p>Las columnas de la base de datos son asociadas como atributos e las clases correspondientes a cada modelo de la App</p>',22,22,1623369600,1623283200,1623369600,30,5,3,7200,0,1,3),(207,1624403954,1624406424,1,0,1,15,191,'Aplicar correciones y complementar documento','<p>Realizar las correciones recibidas de la revision de la primera etapa, aplica tanto al reporte como a la parte de Frontend y Backend</p>\r\n<p>Ademas de correciones a errores que se puedan encontrar durante el desarrollo</p>',20,21,1624579200,1623715200,1624579200,31,3,7,72000,0,1,2),(208,1624405007,1624406575,1,0,1,15,198,'Desarrollo de algoritmo que calcula el precio de los combustibles','<p>Aplicar en python la ecuacion utilizada para el calculo del precio del combustible y los elementos que la componen</p>',22,20,1623801600,1623456000,1623801600,32,5,7,21600,0,1,3),(209,1624405652,1624406585,1,0,1,15,199,'Diseño de las vistas','<p>Definir el dise&ntilde;o de las vistas a utilizar, usando como base los prototipos creados en balsamiq</p>',20,21,1623110400,1623024000,1623110400,33,5,3,3600,0,1,0),(210,1624405997,1624406588,1,0,1,15,199,'Identificar componentes a utilizar','<p>Identificar los componentes que se utilaran en cada vista de forma individual</p>',21,21,1623283200,1623196800,1623283200,34,5,3,7200,0,1,1),(211,1624406208,1624406591,1,0,1,15,199,'Desarrollo de las vistas','<p>Desarrollar las vistas con los componentes identificados para cada una</p>',21,20,1624665600,1623369600,1624492800,35,5,5,36000,0,1,2),(212,1624406379,1624406594,1,0,1,15,199,'Implementacion de metodos de consulta','<p>Implementar metodos de consulta que realizara cada vista con el servidor</p>',20,20,1624665600,1623369600,1624492800,36,5,5,36000,0,0,3);
/*!40000 ALTER TABLE `ext_project_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_project_taskpreset`
--

DROP TABLE IF EXISTS `ext_project_taskpreset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_project_taskpreset` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_update` int(11) NOT NULL,
  `id_person_create` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL,
  `tasktitle` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date_start` varchar(10) NOT NULL,
  `date_end` varchar(10) NOT NULL,
  `date_deadline` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `id_activity` smallint(6) NOT NULL DEFAULT '0',
  `estimated_workload` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `is_public` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `quicktask_duration_days` int(10) unsigned NOT NULL DEFAULT '0',
  `id_person_assigned` int(10) unsigned NOT NULL DEFAULT '0',
  `id_person_owner` int(10) unsigned NOT NULL DEFAULT '0',
  `id_person_assigned_fallback` int(10) unsigned NOT NULL DEFAULT '0',
  `id_person_owner_fallback` int(10) unsigned NOT NULL DEFAULT '0',
  `id_role_assigned_fallback` int(10) unsigned NOT NULL DEFAULT '0',
  `id_role_owner_fallback` int(10) unsigned NOT NULL DEFAULT '0',
  `ext_timetracking_start_tracking` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ext_timetracking_workload_done` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_project_taskpreset`
--

LOCK TABLES `ext_project_taskpreset` WRITE;
/*!40000 ALTER TABLE `ext_project_taskpreset` DISABLE KEYS */;
/*!40000 ALTER TABLE `ext_project_taskpreset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_search_filtercondition`
--

DROP TABLE IF EXISTS `ext_search_filtercondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_search_filtercondition` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_update` int(10) unsigned NOT NULL,
  `id_person_create` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(2) NOT NULL DEFAULT '0',
  `id_set` int(10) unsigned NOT NULL,
  `filter` varchar(64) NOT NULL,
  `value` varchar(100) NOT NULL,
  `is_negated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_set` (`id_set`,`deleted`)
) ENGINE=MyISAM AUTO_INCREMENT=319 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_search_filtercondition`
--

LOCK TABLES `ext_search_filtercondition` WRITE;
/*!40000 ALTER TABLE `ext_search_filtercondition` DISABLE KEYS */;
INSERT INTO `ext_search_filtercondition` VALUES (7,0,0,0,0,1,'currentPersonAssigned','1',0),(8,0,0,0,0,1,'status','2,3',0),(317,1264779500,1264779500,1,0,3,'owner','17',0),(263,1264697139,1264697139,1,0,4,'currentPersonIsCreator','',0),(262,1264697139,1264697139,1,0,4,'status','2,3',0),(264,1264697139,1264697139,1,0,4,'deadlineDyn','nextweek',0),(265,1264697267,1264697267,1,0,5,'currentPersonAssigned','',0),(266,1264697267,1264697267,1,0,5,'creator','17',0),(267,1264697267,1264697267,1,0,5,'project','5',0),(285,1264776776,1264776776,17,0,6,'deadlineDyn','currentweek',0),(284,1264776776,1264776776,17,0,6,'status','2,3,7',0),(299,1264777478,1264777478,17,0,7,'deadlineDyn','',0),(298,1264777478,1264777478,17,0,7,'status','2,3,7',0),(283,1264776776,1264776776,17,0,6,'currentPersonAssigned','',0),(277,1264776619,1264776619,17,0,8,'projectleader','15',0),(278,1264776619,1264776619,17,0,8,'status','2',0),(286,1264776776,1264776776,17,0,6,'type','1',0),(300,1264777478,1264777478,17,0,7,'type','1',0),(297,1264777478,1264777478,17,0,7,'currentPersonAssigned','',0),(306,1264778981,1264778981,12,0,11,'status','2,3',0),(303,1264778957,1264778957,1,0,12,'deadlineDyn','today',0),(304,1264778957,1264778957,1,0,12,'status','2,3',0),(305,1264778957,1264778957,1,0,12,'currentPersonAssigned','',0),(307,1264778981,1264778981,12,0,11,'type','1',0),(308,1264778981,1264778981,12,0,11,'currentPersonAssigned','',0),(309,1264779006,1264779006,12,0,13,'status','2,3',0),(310,1264779006,1264779006,12,0,13,'type','1',0),(311,1264779025,1264779025,1,0,14,'status','5,6,8',0),(315,1264779153,1264779153,1,0,15,'projectleader','1',0),(314,1264779153,1264779153,1,0,15,'status','8',1),(318,1264779500,1264779500,1,0,3,'status','2',0);
/*!40000 ALTER TABLE `ext_search_filtercondition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_search_filterset`
--

DROP TABLE IF EXISTS `ext_search_filterset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_search_filterset` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_update` int(10) unsigned NOT NULL,
  `id_person_create` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(2) NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL,
  `is_hidden` tinyint(2) NOT NULL DEFAULT '0',
  `is_separator` tinyint(2) NOT NULL DEFAULT '0',
  `current` tinyint(2) NOT NULL DEFAULT '0',
  `roles` varchar(16) NOT NULL,
  `type` varchar(16) NOT NULL,
  `title` varchar(64) NOT NULL,
  `conjunction` varchar(3) NOT NULL,
  `resultsorting` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `createdelete` (`id_person_create`,`deleted`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_search_filterset`
--

LOCK TABLES `ext_search_filterset` WRITE;
/*!40000 ALTER TABLE `ext_search_filterset` DISABLE KEYS */;
INSERT INTO `ext_search_filterset` VALUES (1,1246547545,1246637647,474,0,0,1,0,0,'','task','Feedback erwartet','AND',''),(3,1264697040,1264779500,1,0,3,0,0,0,'','task','Open Task','OR',''),(4,1264697139,1264697272,1,0,1,0,0,0,'','task','Next things to do','AND',''),(5,1264697267,1264697267,1,0,2,0,0,0,'','task','ABCT: Theodor assigned to me','AND',''),(6,1264776401,1264776776,17,0,1,0,0,0,'','task','MyTasks this Week','AND',''),(7,1264776486,1264777478,17,0,0,0,0,0,'','task','Tasks Today','AND',''),(8,1264776619,1264777131,17,0,0,0,0,0,'','project','I am Projectleader','AND',''),(12,1264778957,1264778957,1,0,0,0,0,0,'','task','Important (Deadline today)','AND',''),(11,1264778514,1264778981,12,0,0,0,0,0,'','task','My Open Tasks','AND',''),(13,1264779006,1264779006,12,0,0,0,0,0,'','task','All open/running tasks','AND',''),(14,1264779025,1264779033,1,0,4,1,0,0,'','task','My Done Tasks (hidden on portal)','AND',''),(15,1264779095,1264779157,1,0,0,0,0,0,'','project','To manage','AND','');
/*!40000 ALTER TABLE `ext_search_filterset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_sysmanager_extension`
--

DROP TABLE IF EXISTS `ext_sysmanager_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_sysmanager_extension` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_update` int(10) unsigned NOT NULL,
  `ext` int(10) unsigned NOT NULL,
  `version` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_sysmanager_extension`
--

LOCK TABLES `ext_sysmanager_extension` WRITE;
/*!40000 ALTER TABLE `ext_sysmanager_extension` DISABLE KEYS */;
/*!40000 ALTER TABLE `ext_sysmanager_extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_sysmanager_smtpaccount`
--

DROP TABLE IF EXISTS `ext_sysmanager_smtpaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_sysmanager_smtpaccount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_update` int(10) unsigned NOT NULL DEFAULT '0',
  `id_person_create` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `host` varchar(100) NOT NULL DEFAULT '',
  `port` int(10) unsigned NOT NULL DEFAULT '0',
  `authentication` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `forcename` varchar(100) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_sysmanager_smtpaccount`
--

LOCK TABLES `ext_sysmanager_smtpaccount` WRITE;
/*!40000 ALTER TABLE `ext_sysmanager_smtpaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `ext_sysmanager_smtpaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_timetracking_active`
--

DROP TABLE IF EXISTS `ext_timetracking_active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_timetracking_active` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_update` int(10) unsigned NOT NULL DEFAULT '0',
  `id_person_create` int(10) unsigned NOT NULL DEFAULT '0',
  `id_task` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `persondate` (`id_person_create`,`date_create`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_timetracking_active`
--

LOCK TABLES `ext_timetracking_active` WRITE;
/*!40000 ALTER TABLE `ext_timetracking_active` DISABLE KEYS */;
INSERT INTO `ext_timetracking_active` VALUES (4,1264778433,1264778433,17,138);
/*!40000 ALTER TABLE `ext_timetracking_active` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_timetracking_track`
--

DROP TABLE IF EXISTS `ext_timetracking_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_timetracking_track` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_update` int(10) unsigned NOT NULL DEFAULT '0',
  `id_person_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_track` int(10) unsigned NOT NULL DEFAULT '0',
  `id_task` int(10) unsigned NOT NULL DEFAULT '0',
  `workload_tracked` int(10) unsigned NOT NULL DEFAULT '0',
  `workload_chargeable` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `task` (`id_task`),
  KEY `persondate` (`date_track`,`id_person_create`),
  KEY `multi` (`id_person_create`,`date_track`,`id_task`,`date_create`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_timetracking_track`
--

LOCK TABLES `ext_timetracking_track` WRITE;
/*!40000 ALTER TABLE `ext_timetracking_track` DISABLE KEYS */;
INSERT INTO `ext_timetracking_track` VALUES (1,1257948926,1257948939,1,1257948926,4,16,0,''),(2,1257949083,1257949083,1,1257949083,7,6,0,''),(3,1268483837,1268483837,1,1268483837,115,6,0,''),(4,1268492533,1268495049,18,1268495049,60,138,0,''),(5,1268493973,1268495014,18,1268495014,134,860,0,''),(6,1268494282,1268494298,12,1268494298,144,3611,0,''),(7,1268494641,1268494760,12,1268348400,145,9600,0,''),(8,1268494642,1268495020,18,1268495020,136,5,0,''),(9,1268494647,1268495047,18,1268495047,135,29,0,''),(10,1268494732,1268494952,18,1268494952,146,3,0,''),(11,1268494766,1268494766,12,1268494766,145,5,0,''),(12,1268494831,1268495018,18,1268495018,148,304,0,''),(13,1268496068,1268496068,1,1268496068,87,1005,0,''),(14,1268499971,1268499971,1,1268499971,59,348,0,''),(15,1620612056,1620612071,1,1620540000,179,0,0,'');
/*!40000 ALTER TABLE `ext_timetracking_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_country`
--

DROP TABLE IF EXISTS `static_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso_alpha2` char(2) NOT NULL,
  `iso_alpha3` char(3) NOT NULL,
  `iso_num` int(11) unsigned NOT NULL DEFAULT '0',
  `iso_num_currency` char(3) NOT NULL,
  `phone` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=242 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_country`
--

LOCK TABLES `static_country` WRITE;
/*!40000 ALTER TABLE `static_country` DISABLE KEYS */;
INSERT INTO `static_country` VALUES (1,'AD','AND',20,'978',376),(2,'AE','ARE',784,'784',971),(3,'AF','AFG',4,'AFA',93),(4,'AG','ATG',28,'951',1809),(5,'AI','AIA',660,'951',1264),(6,'AL','ALB',8,'8',355),(7,'AM','ARM',51,'51',374),(8,'AN','ANT',530,'532',599),(9,'AO','AGO',24,'973',244),(10,'AQ','ATA',0,'0',67212),(11,'AR','ARG',32,'32',54),(12,'AS','ASM',16,'840',685),(13,'AT','AUT',40,'978',43),(14,'AU','AUS',36,'36',61),(15,'AW','ABW',533,'533',297),(16,'AZ','AZE',31,'AZM',994),(17,'BA','BIH',70,'977',387),(18,'BB','BRB',52,'52',1246),(19,'BD','BGD',50,'50',880),(20,'BE','BEL',56,'978',32),(21,'BF','BFA',854,'952',226),(22,'BG','BGR',100,'BGL',359),(23,'BH','BHR',48,'48',973),(24,'BI','BDI',108,'108',257),(25,'BJ','BEN',204,'952',229),(26,'BM','BMU',60,'60',1809),(27,'BN','BRN',96,'96',673),(28,'BO','BOL',68,'68',591),(29,'BR','BRA',76,'986',55),(30,'BS','BHS',44,'44',1242),(31,'BT','BTN',64,'64',975),(32,'BV','BVT',74,'578',0),(33,'BW','BWA',72,'72',267),(34,'BY','BLR',112,'974',375),(35,'BZ','BLZ',84,'84',501),(36,'CA','CAN',124,'124',1),(37,'CC','CCK',166,'36',6722),(38,'CD','COD',180,'976',0),(39,'CF','CAF',140,'950',236),(40,'CG','COG',178,'950',242),(41,'CH','CHE',756,'756',41),(42,'CI','CIV',384,'952',225),(43,'CK','COK',184,'554',682),(44,'CL','CHL',152,'152',56),(45,'CM','CMR',120,'950',237),(46,'CN','CHN',156,'156',86),(47,'CO','COL',170,'170',57),(48,'CR','CRI',188,'188',506),(49,'CU','CUB',192,'192',53),(50,'CV','CPV',132,'132',238),(51,'CX','CXR',162,'36',6724),(52,'CY','CYP',196,'196',357),(53,'CZ','CZE',203,'203',420),(54,'DE','DEU',276,'978',49),(55,'DJ','DJI',262,'262',253),(56,'DK','DNK',208,'208',45),(57,'DM','DMA',212,'951',1809),(58,'DO','DOM',214,'214',1809),(59,'DZ','DZA',12,'12',213),(60,'EC','ECU',218,'840',593),(61,'EE','EST',233,'233',372),(62,'EG','EGY',818,'818',20),(63,'EH','ESH',732,'504',0),(64,'ER','ERI',232,'232',291),(65,'ES','ESP',724,'978',34),(66,'ET','ETH',231,'230',251),(67,'FI','FIN',246,'978',358),(68,'FJ','FJI',242,'242',679),(69,'FK','FLK',238,'238',500),(70,'FM','FSM',583,'840',691),(71,'FO','FRO',234,'208',298),(72,'FR','FRA',250,'978',33),(73,'GA','GAB',266,'950',241),(74,'GB','GBR',826,'826',44),(75,'GD','GRD',308,'951',1809),(76,'GE','GEO',268,'981',995),(77,'GF','GUF',254,'978',594),(78,'GH','GHA',288,'288',233),(79,'GI','GIB',292,'292',350),(80,'GL','GRL',304,'208',299),(81,'GM','GMB',270,'270',220),(82,'GN','GIN',324,'324',224),(83,'GP','GLP',312,'978',590),(84,'GQ','GNQ',226,'950',240),(85,'GR','GRC',300,'978',30),(86,'GS','SGS',239,'0',0),(87,'GT','GTM',320,'320',502),(88,'GU','GUM',316,'840',671),(89,'GW','GNB',624,'952',245),(90,'GY','GUY',328,'328',592),(91,'HK','HKG',344,'344',852),(92,'HN','HND',340,'340',504),(93,'HR','HRV',191,'191',385),(94,'HT','HTI',332,'332',509),(95,'HU','HUN',348,'348',36),(96,'ID','IDN',360,'360',62),(97,'IE','IRL',372,'978',353),(98,'IL','ISR',376,'376',972),(99,'IN','IND',356,'356',91),(100,'IO','IOT',86,'0',0),(101,'IQ','IRQ',368,'368',964),(102,'IR','IRN',364,'364',98),(103,'IS','ISL',352,'352',354),(104,'IT','ITA',380,'978',39),(105,'JM','JAM',388,'388',1809),(106,'JO','JOR',400,'400',962),(107,'JP','JPN',392,'392',81),(108,'KE','KEN',404,'404',254),(109,'KG','KGZ',417,'417',7),(110,'KH','KHM',116,'116',855),(111,'KI','KIR',296,'36',686),(112,'KM','COM',174,'174',269),(113,'KN','KNA',659,'951',1809),(114,'KP','PRK',408,'408',850),(115,'KR','KOR',410,'410',82),(116,'KW','KWT',414,'414',965),(117,'KY','CYM',136,'136',1809),(118,'KZ','KAZ',398,'398',7),(119,'LA','LAO',418,'418',856),(120,'LB','LBN',422,'422',961),(121,'LC','LCA',662,'951',1809),(122,'LI','LIE',438,'756',41),(123,'LK','LKA',144,'144',94),(124,'LR','LBR',430,'430',231),(125,'LS','LSO',426,'426',266),(126,'LT','LTU',440,'440',370),(127,'LU','LUX',442,'978',352),(128,'LV','LVA',428,'428',371),(129,'LY','LBY',434,'434',218),(130,'MA','MAR',504,'504',212),(131,'MC','MCO',492,'978',377),(132,'MD','MDA',498,'498',373),(133,'MG','MDG',450,'MGF',261),(134,'MH','MHL',584,'840',692),(135,'MK','MKD',807,'807',389),(136,'ML','MLI',466,'952',223),(137,'MM','MMR',104,'104',95),(138,'MN','MNG',496,'496',976),(139,'MO','MAC',446,'446',853),(140,'MP','MNP',580,'840',0),(141,'MQ','MTQ',474,'978',596),(142,'MR','MRT',478,'478',222),(143,'MS','MSR',500,'951',1809),(144,'MT','MLT',470,'470',356),(145,'MU','MUS',480,'480',230),(146,'MV','MDV',462,'462',960),(147,'MW','MWI',454,'454',265),(148,'MX','MEX',484,'484',52),(149,'MY','MYS',458,'458',60),(150,'MZ','MOZ',508,'508',258),(151,'NA','NAM',516,'516',264),(152,'NC','NCL',540,'953',687),(153,'NE','NER',562,'952',227),(154,'NF','NFK',574,'36',6723),(155,'NG','NGA',566,'566',234),(156,'NI','NIC',558,'558',505),(157,'NL','NLD',528,'978',31),(158,'NO','NOR',578,'578',47),(159,'NP','NPL',524,'524',977),(160,'NR','NRU',520,'36',674),(161,'NU','NIU',570,'554',683),(162,'NZ','NZL',554,'554',64),(163,'OM','OMN',512,'512',968),(164,'PA','PAN',591,'590',507),(165,'PE','PER',604,'604',51),(166,'PF','PYF',258,'953',689),(167,'PG','PNG',598,'598',675),(168,'PH','PHL',608,'608',63),(169,'PK','PAK',586,'586',92),(170,'PL','POL',616,'985',48),(171,'PM','SPM',666,'978',508),(172,'PN','PCN',612,'554',0),(173,'PR','PRI',630,'840',1809),(174,'PT','PRT',620,'978',351),(175,'PW','PLW',585,'840',680),(176,'PY','PRY',600,'600',595),(177,'QA','QAT',634,'634',974),(178,'RE','REU',638,'978',262),(179,'RO','ROM',642,'642',40),(180,'RU','RUS',643,'643',7),(181,'RW','RWA',646,'646',250),(182,'SA','SAU',682,'682',966),(183,'SB','SLB',90,'90',677),(184,'SC','SYC',690,'690',248),(185,'SD','SDN',736,'736',249),(186,'SE','SWE',752,'752',46),(187,'SG','SGP',702,'702',65),(188,'SH','SHN',654,'654',290),(189,'SI','SVN',705,'705',386),(190,'SJ','SJM',744,'578',0),(191,'SK','SVK',703,'703',421),(192,'SL','SLE',694,'694',232),(193,'SM','SMR',674,'978',378),(194,'SN','SEN',686,'952',221),(195,'SO','SOM',706,'706',252),(196,'SR','SUR',740,'SRG',597),(197,'ST','STP',678,'678',2391),(198,'SV','SLV',222,'222',503),(199,'SY','SYR',760,'760',963),(200,'SZ','SWZ',748,'748',268),(201,'TC','TCA',796,'840',1809),(202,'TD','TCD',148,'950',235),(203,'TF','ATF',260,'0',0),(204,'TG','TGO',768,'952',228),(205,'TH','THA',764,'764',66),(206,'TJ','TJK',762,'972',7),(207,'TK','TKL',772,'554',0),(208,'TM','TKM',795,'795',7),(209,'TN','TUN',788,'788',216),(210,'TO','TON',776,'776',676),(211,'TL','TLS',626,'TPE',0),(212,'TR','TUR',792,'TRL',90),(213,'TT','TTO',780,'780',1809),(214,'TV','TUV',798,'36',688),(215,'TW','TWN',158,'901',886),(216,'TZ','TZA',834,'834',255),(217,'UA','UKR',804,'980',380),(218,'UG','UGA',800,'800',256),(220,'US','USA',840,'840',1),(221,'UY','URY',858,'858',598),(222,'UZ','UZB',860,'860',7),(223,'VA','VAT',336,'978',396),(224,'VC','VCT',670,'951',1809),(225,'VE','VEN',862,'862',58),(226,'VG','VGB',92,'840',1809),(227,'VI','VIR',850,'840',1350),(228,'VN','VNM',704,'704',84),(229,'VU','VUT',548,'548',678),(230,'WF','WLF',876,'953',0),(231,'WS','WSM',882,'882',685),(232,'YE','YEM',887,'886',967),(233,'YT','MYT',175,'978',269),(235,'ZA','ZAF',710,'710',27),(236,'ZM','ZMB',894,'894',260),(237,'ZW','ZWE',716,'716',263),(238,'PS','PSE',275,'0',0),(239,'CS','SCG',891,'891',0),(241,'HM','HMD',334,'0',0);
/*!40000 ALTER TABLE `static_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_country_zone`
--

DROP TABLE IF EXISTS `static_country_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_country_zone` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `iso_alpha2_country` char(2) NOT NULL,
  `iso_alpha3_country` char(3) NOT NULL,
  `iso_num_country` int(11) unsigned NOT NULL DEFAULT '0',
  `code` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=483 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_country_zone`
--

LOCK TABLES `static_country_zone` WRITE;
/*!40000 ALTER TABLE `static_country_zone` DISABLE KEYS */;
INSERT INTO `static_country_zone` VALUES (1,'US','USA',840,'AL'),(2,'US','USA',840,'AK'),(3,'US','USA',840,'AS'),(4,'US','USA',840,'AZ'),(5,'US','USA',840,'AR'),(6,'US','USA',840,'AF'),(7,'US','USA',840,'AA'),(8,'US','USA',840,'AC'),(9,'US','USA',840,'AE'),(10,'US','USA',840,'AM'),(11,'US','USA',840,'AP'),(12,'US','USA',840,'CA'),(13,'US','USA',840,'CO'),(14,'US','USA',840,'CT'),(15,'US','USA',840,'DE'),(16,'US','USA',840,'DC'),(17,'US','USA',840,'FM'),(18,'US','USA',840,'FL'),(19,'US','USA',840,'GA'),(20,'US','USA',840,'GU'),(21,'US','USA',840,'HI'),(22,'US','USA',840,'ID'),(23,'US','USA',840,'IL'),(24,'US','USA',840,'IN'),(25,'US','USA',840,'IA'),(26,'US','USA',840,'KS'),(27,'US','USA',840,'KY'),(28,'US','USA',840,'LA'),(29,'US','USA',840,'ME'),(30,'US','USA',840,'MH'),(31,'US','USA',840,'MD'),(32,'US','USA',840,'MA'),(33,'US','USA',840,'MI'),(34,'US','USA',840,'MN'),(35,'US','USA',840,'MS'),(36,'US','USA',840,'MO'),(37,'US','USA',840,'MT'),(38,'US','USA',840,'NE'),(39,'US','USA',840,'NV'),(40,'US','USA',840,'NH'),(41,'US','USA',840,'NJ'),(42,'US','USA',840,'NM'),(43,'US','USA',840,'NY'),(44,'US','USA',840,'NC'),(45,'US','USA',840,'ND'),(46,'US','USA',840,'MP'),(47,'US','USA',840,'OH'),(48,'US','USA',840,'OK'),(49,'US','USA',840,'OR'),(50,'US','USA',840,'PW'),(51,'US','USA',840,'PA'),(52,'US','USA',840,'PR'),(53,'US','USA',840,'RI'),(54,'US','USA',840,'SC'),(55,'US','USA',840,'SD'),(56,'US','USA',840,'TN'),(57,'US','USA',840,'TX'),(58,'US','USA',840,'UT'),(59,'US','USA',840,'VT'),(60,'US','USA',840,'VI'),(61,'US','USA',840,'VA'),(62,'US','USA',840,'WA'),(63,'US','USA',840,'WV'),(64,'US','USA',840,'WI'),(65,'US','USA',840,'WY'),(66,'CA','CAN',124,'AB'),(67,'CA','CAN',124,'BC'),(68,'CA','CAN',124,'MB'),(69,'CA','CAN',124,'NF'),(70,'CA','CAN',124,'NB'),(71,'CA','CAN',124,'NS'),(72,'CA','CAN',124,'NT'),(73,'CA','CAN',124,'NU'),(74,'CA','CAN',124,'ON'),(75,'CA','CAN',124,'PE'),(76,'CA','CAN',124,'QC'),(77,'CA','CAN',124,'SK'),(78,'CA','CAN',124,'YT'),(79,'DE','DEU',276,'NDS'),(80,'DE','DEU',276,'BAW'),(81,'DE','DEU',276,'BAY'),(82,'DE','DEU',276,'BER'),(83,'DE','DEU',276,'BRG'),(84,'DE','DEU',276,'BRE'),(85,'DE','DEU',276,'HAM'),(86,'DE','DEU',276,'HES'),(87,'DE','DEU',276,'MEC'),(88,'DE','DEU',276,'NRW'),(89,'DE','DEU',276,'RHE'),(90,'DE','DEU',276,'SAR'),(91,'DE','DEU',276,'SAS'),(92,'DE','DEU',276,'SAC'),(93,'DE','DEU',276,'SCN'),(94,'DE','DEU',276,'THE'),(95,'AT','AUT',40,'WI'),(96,'AT','AUT',40,'NO'),(97,'AT','AUT',40,'OO'),(98,'AT','AUT',40,'SB'),(99,'AT','AUT',40,'KN'),(100,'AT','AUT',40,'ST'),(101,'AT','AUT',40,'TI'),(102,'AT','AUT',40,'BL'),(103,'AT','AUT',40,'VB'),(104,'CH','CHE',756,'AG'),(105,'CH','CHE',756,'AI'),(106,'CH','CHE',756,'AR'),(107,'CH','CHE',756,'BE'),(108,'CH','CHE',756,'BL'),(109,'CH','CHE',756,'BS'),(110,'CH','CHE',756,'FR'),(111,'CH','CHE',756,'GE'),(112,'CH','CHE',756,'GL'),(113,'CH','CHE',756,'GR'),(114,'CH','CHE',756,'JU'),(115,'CH','CHE',756,'LU'),(116,'CH','CHE',756,'NE'),(117,'CH','CHE',756,'NW'),(118,'CH','CHE',756,'OW'),(119,'CH','CHE',756,'SG'),(120,'CH','CHE',756,'SH'),(121,'CH','CHE',756,'SO'),(122,'CH','CHE',756,'SZ'),(123,'CH','CHE',756,'TG'),(124,'CH','CHE',756,'TI'),(125,'CH','CHE',756,'UR'),(126,'CH','CHE',756,'VD'),(127,'CH','CHE',756,'VS'),(128,'CH','CHE',756,'ZG'),(129,'CH','CHE',756,'ZH'),(130,'ES','ESP',724,'Alava'),(131,'ES','ESP',724,'Malaga'),(132,'ES','ESP',724,'Segovia'),(133,'ES','ESP',724,'Granada'),(134,'ES','ESP',724,'Jaen'),(135,'ES','ESP',724,'Sevilla'),(136,'ES','ESP',724,'Barcelona'),(137,'ES','ESP',724,'Valencia'),(138,'ES','ESP',724,'Alicante'),(139,'ES','ESP',724,'Almeria'),(140,'ES','ESP',724,'Asturias'),(141,'ES','ESP',724,'Avila'),(142,'ES','ESP',724,'Badajoz'),(143,'ES','ESP',724,'Burgos'),(144,'ES','ESP',724,'Caceres'),(145,'ES','ESP',724,'Cadiz'),(146,'ES','ESP',724,'Cantabria'),(147,'ES','ESP',724,'Castellon'),(148,'ES','ESP',724,'Ceuta'),(149,'ES','ESP',724,'Ciudad Real'),(150,'ES','ESP',724,'Cordoba'),(151,'ES','ESP',724,'Cuenca'),(152,'ES','ESP',724,'Girona'),(153,'ES','ESP',724,'Las Palmas'),(154,'ES','ESP',724,'Guadalajara'),(155,'ES','ESP',724,'Guipuzcoa'),(156,'ES','ESP',724,'Huelva'),(157,'ES','ESP',724,'Huesca'),(158,'ES','ESP',724,'A Coru'),(159,'ES','ESP',724,'La Rioja'),(160,'ES','ESP',724,'Leon'),(161,'ES','ESP',724,'Lugo'),(162,'ES','ESP',724,'Lleida'),(163,'ES','ESP',724,'Madrid'),(164,'ES','ESP',724,'Baleares'),(166,'ES','ESP',724,'Murcia'),(167,'ES','ESP',724,'Navarra'),(168,'ES','ESP',724,'Ourense'),(169,'ES','ESP',724,'Palencia'),(170,'ES','ESP',724,'Pontevedra'),(171,'ES','ESP',724,'Salamanca'),(172,'ES','ESP',724,'Soria'),(173,'ES','ESP',724,'Tarragona'),(174,'ES','ESP',724,'Tenerife'),(175,'ES','ESP',724,'Teruel'),(176,'ES','ESP',724,'Toledo'),(177,'ES','ESP',724,'Valladolid'),(178,'ES','ESP',724,'Vizcaya'),(179,'ES','ESP',724,'Zamora'),(180,'ES','ESP',724,'Zaragoza'),(181,'ES','ESP',724,'Melilla'),(182,'MX','MEX',484,'AGS'),(183,'MX','MEX',484,'BCS'),(184,'MX','MEX',484,'BC'),(185,'MX','MEX',484,'CAM'),(186,'MX','MEX',484,'CHIS'),(187,'MX','MEX',484,'CHIH'),(188,'MX','MEX',484,'COAH'),(189,'MX','MEX',484,'COL'),(190,'MX','MEX',484,'DIF'),(191,'MX','MEX',484,'DGO'),(192,'MX','MEX',484,'GTO'),(193,'MX','MEX',484,'GRO'),(194,'MX','MEX',484,'HGO'),(195,'MX','MEX',484,'JAL'),(196,'MX','MEX',484,'MEX'),(197,'MX','MEX',484,'MICH'),(198,'MX','MEX',484,'MOR'),(199,'MX','MEX',484,'NAY'),(200,'MX','MEX',484,'NL'),(201,'MX','MEX',484,'OAX'),(202,'MX','MEX',484,'PUE'),(203,'MX','MEX',484,'QRO'),(204,'MX','MEX',484,'QROO'),(205,'MX','MEX',484,'SLP'),(206,'MX','MEX',484,'SIN'),(207,'MX','MEX',484,'SON'),(208,'MX','MEX',484,'TAB'),(209,'MX','MEX',484,'TAMPS'),(210,'MX','MEX',484,'TLAX'),(211,'MX','MEX',484,'VER'),(212,'MX','MEX',484,'YUC'),(213,'MX','MEX',484,'ZAC'),(214,'AU','AUS',36,'ACT'),(215,'AU','AUS',36,'NSW'),(216,'AU','AUS',36,'NT'),(217,'AU','AUS',36,'QLD'),(218,'AU','AUS',36,'SA'),(219,'AU','AUS',36,'TAS'),(220,'AU','AUS',36,'VIC'),(221,'AU','AUS',36,'WA'),(222,'IT','ITA',380,'AG'),(223,'IT','ITA',380,'AL'),(224,'IT','ITA',380,'AN'),(225,'IT','ITA',380,'AO'),(226,'IT','ITA',380,'AP'),(227,'IT','ITA',380,'AQ'),(228,'IT','ITA',380,'AR'),(229,'IT','ITA',380,'AT'),(230,'IT','ITA',380,'AV'),(231,'IT','ITA',380,'BA'),(232,'IT','ITA',380,'BG'),(233,'IT','ITA',380,'BI'),(234,'IT','ITA',380,'BL'),(235,'IT','ITA',380,'BN'),(236,'IT','ITA',380,'BO'),(237,'IT','ITA',380,'BR'),(238,'IT','ITA',380,'BS'),(239,'IT','ITA',380,'BZ'),(240,'IT','ITA',380,'CA'),(241,'IT','ITA',380,'CB'),(242,'IT','ITA',380,'CE'),(243,'IT','ITA',380,'CH'),(244,'IT','ITA',380,'CL'),(245,'IT','ITA',380,'CN'),(246,'IT','ITA',380,'CO'),(247,'IT','ITA',380,'CR'),(248,'IT','ITA',380,'CS'),(249,'IT','ITA',380,'CT'),(250,'IT','ITA',380,'CZ'),(251,'IT','ITA',380,'EN'),(252,'IT','ITA',380,'FE'),(253,'IT','ITA',380,'FG'),(254,'IT','ITA',380,'FI'),(255,'IT','ITA',380,'FO'),(256,'IT','ITA',380,'FR'),(257,'IT','ITA',380,'GE'),(258,'IT','ITA',380,'GO'),(259,'IT','ITA',380,'GR'),(260,'IT','ITA',380,'IM'),(261,'IT','ITA',380,'IS'),(262,'IT','ITA',380,'KR'),(263,'IT','ITA',380,'LC'),(264,'IT','ITA',380,'LE'),(265,'IT','ITA',380,'LI'),(266,'IT','ITA',380,'LO'),(267,'IT','ITA',380,'LT'),(268,'IT','ITA',380,'LU'),(269,'IT','ITA',380,'MC'),(270,'IT','ITA',380,'ME'),(271,'IT','ITA',380,'MI'),(272,'IT','ITA',380,'MN'),(273,'IT','ITA',380,'MO'),(274,'IT','ITA',380,'MS'),(275,'IT','ITA',380,'MT'),(276,'IT','ITA',380,'NA'),(277,'IT','ITA',380,'NO'),(278,'IT','ITA',380,'NU'),(279,'IT','ITA',380,'OR'),(280,'IT','ITA',380,'PA'),(281,'IT','ITA',380,'PC'),(282,'IT','ITA',380,'PD'),(283,'IT','ITA',380,'PE'),(284,'IT','ITA',380,'PG'),(285,'IT','ITA',380,'PI'),(286,'IT','ITA',380,'PN'),(287,'IT','ITA',380,'PR'),(288,'IT','ITA',380,'PS'),(289,'IT','ITA',380,'PT'),(290,'IT','ITA',380,'PV'),(291,'IT','ITA',380,'PO'),(292,'IT','ITA',380,'PZ'),(293,'IT','ITA',380,'RA'),(294,'IT','ITA',380,'RC'),(295,'IT','ITA',380,'RE'),(296,'IT','ITA',380,'RG'),(297,'IT','ITA',380,'RI'),(298,'IT','ITA',380,'RM'),(299,'IT','ITA',380,'RN'),(300,'IT','ITA',380,'RO'),(301,'IT','ITA',380,'SA'),(302,'IT','ITA',380,'SI'),(303,'IT','ITA',380,'SO'),(304,'IT','ITA',380,'SP'),(305,'IT','ITA',380,'SR'),(306,'IT','ITA',380,'SS'),(307,'IT','ITA',380,'SV'),(308,'IT','ITA',380,'TA'),(309,'IT','ITA',380,'TE'),(310,'IT','ITA',380,'TN'),(311,'IT','ITA',380,'TO'),(312,'IT','ITA',380,'TP'),(313,'IT','ITA',380,'TR'),(314,'IT','ITA',380,'TS'),(315,'IT','ITA',380,'TV'),(316,'IT','ITA',380,'UD'),(317,'IT','ITA',380,'VA'),(318,'IT','ITA',380,'VC'),(319,'IT','ITA',380,'VE'),(320,'IT','ITA',380,'VI'),(321,'IT','ITA',380,'VP'),(322,'IT','ITA',380,'VR'),(323,'IT','ITA',380,'VT'),(324,'IT','ITA',380,'VV'),(325,'GB','GBR',826,'ALD'),(326,'GB','GBR',826,'ARM'),(327,'GB','GBR',826,'ATM'),(328,'GB','GBR',826,'BDS'),(329,'GB','GBR',826,'BFD'),(330,'GB','GBR',826,'BIR'),(331,'GB','GBR',826,'BLG'),(332,'GB','GBR',826,'BRI'),(333,'GB','GBR',826,'BRK'),(334,'GB','GBR',826,'BRS'),(335,'GB','GBR',826,'BUX'),(336,'GB','GBR',826,'CAP'),(337,'GB','GBR',826,'CAR'),(338,'GB','GBR',826,'CAS'),(339,'GB','GBR',826,'CBA'),(340,'GB','GBR',826,'CBE'),(341,'GB','GBR',826,'CER'),(342,'GB','GBR',826,'CHI'),(343,'GB','GBR',826,'CHS'),(344,'GB','GBR',826,'CLD'),(345,'GB','GBR',826,'CNL'),(346,'GB','GBR',826,'CON'),(347,'GB','GBR',826,'CTR'),(348,'GB','GBR',826,'CVE'),(349,'GB','GBR',826,'DEN'),(350,'GB','GBR',826,'DFD'),(351,'GB','GBR',826,'DGL'),(352,'GB','GBR',826,'DHM'),(353,'GB','GBR',826,'DOR'),(354,'GB','GBR',826,'DVN'),(355,'GB','GBR',826,'DWN'),(356,'GB','GBR',826,'DYS'),(357,'GB','GBR',826,'ESX'),(358,'GB','GBR',826,'FER'),(359,'GB','GBR',826,'FFE'),(360,'GB','GBR',826,'FLI'),(361,'GB','GBR',826,'FMH'),(362,'GB','GBR',826,'GDD'),(363,'GB','GBR',826,'GLO'),(364,'GB','GBR',826,'GLR'),(365,'GB','GBR',826,'GNM'),(366,'GB','GBR',826,'GNS'),(367,'GB','GBR',826,'GNW'),(368,'GB','GBR',826,'GRN'),(369,'GB','GBR',826,'GUR'),(370,'GB','GBR',826,'GWT'),(371,'GB','GBR',826,'HBS'),(372,'GB','GBR',826,'HFD'),(373,'GB','GBR',826,'HLD'),(374,'GB','GBR',826,'HPH'),(375,'GB','GBR',826,'HWR'),(376,'GB','GBR',826,'IOM'),(377,'GB','GBR',826,'IOW'),(378,'GB','GBR',826,'ISL'),(379,'GB','GBR',826,'JER'),(380,'GB','GBR',826,'KNT'),(381,'GB','GBR',826,'LCN'),(382,'GB','GBR',826,'LDN'),(383,'GB','GBR',826,'LDR'),(384,'GB','GBR',826,'LEC'),(385,'GB','GBR',826,'LNH'),(386,'GB','GBR',826,'LON'),(387,'GB','GBR',826,'LTE'),(388,'GB','GBR',826,'LTM'),(389,'GB','GBR',826,'LTW'),(390,'GB','GBR',826,'MCH'),(391,'GB','GBR',826,'MER'),(392,'GB','GBR',826,'MON'),(393,'GB','GBR',826,'MSY'),(394,'GB','GBR',826,'NET'),(395,'GB','GBR',826,'NEW'),(396,'GB','GBR',826,'NHM'),(397,'GB','GBR',826,'NLD'),(398,'GB','GBR',826,'NOR'),(399,'GB','GBR',826,'NOT'),(400,'GB','GBR',826,'NWH'),(401,'GB','GBR',826,'OFE'),(402,'GB','GBR',826,'ORK'),(403,'GB','GBR',826,'PEM'),(404,'GB','GBR',826,'PWS'),(405,'GB','GBR',826,'SCD'),(406,'GB','GBR',826,'SFD'),(407,'GB','GBR',826,'SFK'),(408,'GB','GBR',826,'SLD'),(409,'GB','GBR',826,'SOM'),(410,'GB','GBR',826,'SPE'),(411,'GB','GBR',826,'SRK'),(412,'GB','GBR',826,'SRY'),(413,'GB','GBR',826,'SWA'),(414,'GB','GBR',826,'SXE'),(415,'GB','GBR',826,'SXW'),(416,'GB','GBR',826,'TAF'),(417,'GB','GBR',826,'TOR'),(418,'GB','GBR',826,'TWR'),(419,'GB','GBR',826,'TYR'),(420,'GB','GBR',826,'TYS'),(421,'GB','GBR',826,'VAL'),(422,'GB','GBR',826,'WIL'),(423,'GB','GBR',826,'WKS'),(424,'GB','GBR',826,'WLT'),(425,'GB','GBR',826,'WMD'),(426,'GB','GBR',826,'WRE'),(427,'GB','GBR',826,'YSN'),(428,'GB','GBR',826,'YSS'),(429,'GB','GBR',826,'YSW'),(430,'IE','IRL',372,'CAR'),(431,'IE','IRL',372,'CAV'),(432,'IE','IRL',372,'CLA'),(433,'IE','IRL',372,'COR'),(434,'IE','IRL',372,'DON'),(435,'IE','IRL',372,'DUB'),(436,'IE','IRL',372,'GAL'),(437,'IE','IRL',372,'KER'),(438,'IE','IRL',372,'KIL'),(439,'IE','IRL',372,'KLK'),(440,'IE','IRL',372,'LAO'),(441,'IE','IRL',372,'LEI'),(442,'IE','IRL',372,'LIM'),(443,'IE','IRL',372,'LON'),(444,'IE','IRL',372,'LOU'),(445,'IE','IRL',372,'MAY'),(446,'IE','IRL',372,'MEA'),(447,'IE','IRL',372,'MON'),(448,'IE','IRL',372,'OFF'),(449,'IE','IRL',372,'ROS'),(450,'IE','IRL',372,'SLI'),(451,'IE','IRL',372,'TIP'),(452,'IE','IRL',372,'WAT'),(453,'IE','IRL',372,'WES'),(454,'IE','IRL',372,'WEX'),(455,'IE','IRL',372,'WIC'),(456,'BR','BRA',76,'AC'),(457,'BR','BRA',76,'AP'),(458,'BR','BRA',76,'AL'),(459,'BR','BRA',76,'AM'),(460,'BR','BRA',76,'BA'),(461,'BR','BRA',76,'CE'),(462,'BR','BRA',76,'DF'),(463,'BR','BRA',76,'ES'),(464,'BR','BRA',76,'GO'),(465,'BR','BRA',76,'MA'),(466,'BR','BRA',76,'MG'),(467,'BR','BRA',76,'MS'),(468,'BR','BRA',76,'MT'),(469,'BR','BRA',76,'PA'),(470,'BR','BRA',76,'PB'),(471,'BR','BRA',76,'PE'),(472,'BR','BRA',76,'PI'),(473,'BR','BRA',76,'PR'),(474,'BR','BRA',76,'RJ'),(475,'BR','BRA',76,'RN'),(476,'BR','BRA',76,'RO'),(477,'BR','BRA',76,'RR'),(478,'BR','BRA',76,'RS'),(479,'BR','BRA',76,'SC'),(480,'BR','BRA',76,'SE'),(481,'BR','BRA',76,'SP'),(482,'BR','BRA',76,'TO');
/*!40000 ALTER TABLE `static_country_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_language`
--

DROP TABLE IF EXISTS `static_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_language` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `iso_alpha2` char(2) NOT NULL DEFAULT '',
  `iso_alpha3` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `alpha2` (`iso_alpha2`)
) ENGINE=MyISAM AUTO_INCREMENT=185 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_language`
--

LOCK TABLES `static_language` WRITE;
/*!40000 ALTER TABLE `static_language` DISABLE KEYS */;
INSERT INTO `static_language` VALUES (1,'aa','aar'),(2,'ab','abk'),(3,'ae','ave'),(4,'af','afr'),(5,'ak','aka'),(6,'am','amh'),(7,'an','arg'),(8,'ar','ara'),(9,'as','asm'),(10,'av','ava'),(11,'ay','aym'),(12,'az','aze'),(13,'ba','bak'),(14,'be','bel'),(15,'bg','bul'),(16,'bh','bih'),(17,'bi','bis'),(18,'bm','bam'),(19,'bn','ben'),(20,'bo','tib'),(21,'br','bre'),(22,'bs','bos'),(23,'ca','cat'),(24,'ce','che'),(25,'ch','cha'),(26,'co','cos'),(27,'cr','cre'),(28,'cs','cze'),(29,'cu','chu'),(30,'cv','chv'),(31,'cy','wel'),(32,'da','dan'),(33,'de','ger'),(34,'dv','div'),(35,'dz','dzo'),(36,'ee','ewe'),(37,'el','gre'),(38,'en','eng'),(39,'eo','epo'),(40,'es','spa'),(41,'et','est'),(42,'eu','baq'),(43,'fa','per'),(44,'ff','ful'),(45,'fi','fin'),(46,'fj','fij'),(47,'fo','fao'),(48,'fr','fre'),(49,'fy','fry'),(50,'ga','gle'),(51,'gd','gla'),(52,'gl','glg'),(53,'gn','grn'),(54,'gu','guj'),(55,'gv','glv'),(56,'ha','hau'),(57,'he','heb'),(58,'hi','hin'),(59,'ho','hmo'),(60,'hr','hrv'),(61,'ht','hat'),(62,'hu','hun'),(63,'hy','arm'),(64,'hz','her'),(65,'ia','ina'),(66,'id','ind'),(67,'ie','ile'),(68,'ig','ibo'),(69,'ii','iii'),(70,'ik','ipk'),(71,'io','ido'),(72,'is','ice'),(73,'it','ita'),(74,'iu','iku'),(75,'ja','jpn'),(76,'jv','jav'),(77,'ka','geo'),(78,'kg','kon'),(79,'ki','kik'),(80,'kj','kua'),(81,'kk','kaz'),(82,'kl','kal'),(83,'km','khm'),(84,'kn','kan'),(85,'ko','kor'),(86,'kr','kau'),(87,'ks','kas'),(88,'ku','kur'),(89,'kv','kom'),(90,'kw','cor'),(91,'ky','kir'),(92,'la','lat'),(93,'lb','ltz'),(94,'lg','lug'),(95,'li','lim'),(96,'ln','lin'),(97,'lo','lao'),(98,'lt','lit'),(99,'lu','lub'),(100,'lv','lav'),(101,'mg','mlg'),(102,'mh','mah'),(103,'mi','mao'),(104,'mk','mac'),(105,'ml','mal'),(106,'mn','mon'),(107,'mr','mar'),(108,'ms','may'),(109,'mt','mlt'),(110,'my','bur'),(111,'na','nau'),(112,'nb','nob'),(113,'nd','nde'),(114,'ne','nep'),(115,'ng','ndo'),(116,'nl','dut'),(117,'nn','nno'),(118,'no','nor'),(119,'nr','nbl'),(120,'nv','nav'),(121,'ny','nya'),(122,'oc','oci'),(123,'oj','oji'),(124,'om','orm'),(125,'or','ori'),(126,'os','oss'),(127,'pa','pan'),(128,'pi','pli'),(129,'pl','pol'),(130,'ps','pus'),(131,'pt','por'),(132,'qu','que'),(133,'rm','roh'),(134,'rn','run'),(135,'ro','rum'),(136,'ru','rus'),(137,'rw','kin'),(138,'sa','san'),(139,'sc','srd'),(140,'sd','snd'),(141,'se','sme'),(142,'sg','sag'),(143,'si','sin'),(144,'sk','slo'),(145,'sl','slv'),(146,'sm','smo'),(147,'sn','sna'),(148,'so','som'),(149,'sq','alb'),(150,'sr','srp'),(151,'ss','ssw'),(152,'st','sot'),(153,'su','sun'),(154,'sv','swe'),(155,'sw','swa'),(156,'ta','tam'),(157,'te','tel'),(158,'tg','tgk'),(159,'th','tha'),(160,'ti','tir'),(161,'tk','tuk'),(162,'tl','tgl'),(163,'tn','tsn'),(164,'to','ton'),(165,'tr','tur'),(166,'ts','tso'),(167,'tt','tat'),(168,'tw','twi'),(169,'ty','tah'),(170,'ug','uig'),(171,'uk','ukr'),(172,'ur','urd'),(173,'uz','uzb'),(174,'ve','ven'),(175,'vi','vie'),(176,'vo','vol'),(177,'wa','wln'),(178,'wo','wol'),(179,'xh','xho'),(180,'yi','yid'),(181,'yo','yor'),(182,'za','zha'),(183,'zh','chi'),(184,'zu','zul');
/*!40000 ALTER TABLE `static_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_territory`
--

DROP TABLE IF EXISTS `static_territory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_territory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `iso_num` int(11) unsigned NOT NULL DEFAULT '0',
  `parent_iso_num` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_territory`
--

LOCK TABLES `static_territory` WRITE;
/*!40000 ALTER TABLE `static_territory` DISABLE KEYS */;
INSERT INTO `static_territory` VALUES (1,2,0),(2,9,0),(3,19,0),(4,142,0),(5,150,0),(6,30,142),(7,35,142),(8,62,142),(9,145,142),(10,39,150),(11,151,150),(12,154,150),(13,155,150),(14,830,154),(15,833,154),(16,5,419),(17,13,419),(18,21,3),(19,29,419),(20,11,2),(21,14,2),(22,15,2),(23,17,2),(24,18,2),(25,53,9),(26,54,9),(27,57,9),(28,61,9);
/*!40000 ALTER TABLE `static_territory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_timezone`
--

DROP TABLE IF EXISTS `static_timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_timezone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timezone` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=454 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_timezone`
--

LOCK TABLES `static_timezone` WRITE;
/*!40000 ALTER TABLE `static_timezone` DISABLE KEYS */;
INSERT INTO `static_timezone` VALUES (1,'Africa/Abidjan'),(2,'Africa/Accra'),(3,'Africa/Addis_Ababa'),(4,'Africa/Algiers'),(5,'Africa/Asmara'),(6,'Africa/Asmera'),(7,'Africa/Bamako'),(8,'Africa/Bangui'),(9,'Africa/Banjul'),(10,'Africa/Bissau'),(11,'Africa/Blantyre'),(12,'Africa/Brazzaville'),(13,'Africa/Bujumbura'),(14,'Africa/Cairo'),(15,'Africa/Casablanca'),(16,'Africa/Ceuta'),(17,'Africa/Conakry'),(18,'Africa/Dakar'),(19,'Africa/Dar_es_Salaam'),(20,'Africa/Djibouti'),(21,'Africa/Douala'),(22,'Africa/El_Aaiun'),(23,'Africa/Freetown'),(24,'Africa/Gaborone'),(25,'Africa/Harare'),(26,'Africa/Johannesburg'),(27,'Africa/Kampala'),(28,'Africa/Khartoum'),(29,'Africa/Kigali'),(30,'Africa/Kinshasa'),(31,'Africa/Lagos'),(32,'Africa/Libreville'),(33,'Africa/Lome'),(34,'Africa/Luanda'),(35,'Africa/Lubumbashi'),(36,'Africa/Lusaka'),(37,'Africa/Malabo'),(38,'Africa/Maputo'),(39,'Africa/Maseru'),(40,'Africa/Mbabane'),(41,'Africa/Mogadishu'),(42,'Africa/Monrovia'),(43,'Africa/Nairobi'),(44,'Africa/Ndjamena'),(45,'Africa/Niamey'),(46,'Africa/Nouakchott'),(47,'Africa/Ouagadougou'),(48,'Africa/Porto-Novo'),(49,'Africa/Sao_Tome'),(50,'Africa/Timbuktu'),(51,'Africa/Tripoli'),(52,'Africa/Tunis'),(53,'Africa/Windhoek'),(54,'America/Adak'),(55,'America/Anchorage'),(56,'America/Anguilla'),(57,'America/Antigua'),(58,'America/Araguaina'),(59,'America/Argentina/Buenos_Aires'),(60,'America/Argentina/Catamarca'),(61,'America/Argentina/ComodRivadavia'),(62,'America/Argentina/Cordoba'),(63,'America/Argentina/Jujuy'),(64,'America/Argentina/La_Rioja'),(65,'America/Argentina/Mendoza'),(66,'America/Argentina/Rio_Gallegos'),(67,'America/Argentina/Salta'),(68,'America/Argentina/San_Juan'),(69,'America/Argentina/San_Luis'),(70,'America/Argentina/Tucuman'),(71,'America/Argentina/Ushuaia'),(72,'America/Aruba'),(73,'America/Asuncion'),(74,'America/Atikokan'),(75,'America/Atka'),(76,'America/Bahia'),(77,'America/Barbados'),(78,'America/Belem'),(79,'America/Belize'),(80,'America/Blanc-Sablon'),(81,'America/Boa_Vista'),(82,'America/Bogota'),(83,'America/Boise'),(84,'America/Buenos_Aires'),(85,'America/Cambridge_Bay'),(86,'America/Campo_Grande'),(87,'America/Cancun'),(88,'America/Caracas'),(89,'America/Catamarca'),(90,'America/Cayenne'),(91,'America/Cayman'),(92,'America/Chicago'),(93,'America/Chihuahua'),(94,'America/Coral_Harbour'),(95,'America/Cordoba'),(96,'America/Costa_Rica'),(97,'America/Cuiaba'),(98,'America/Curacao'),(99,'America/Danmarkshavn'),(100,'America/Dawson'),(101,'America/Dawson_Creek'),(102,'America/Denver'),(103,'America/Detroit'),(104,'America/Dominica'),(105,'America/Edmonton'),(106,'America/Eirunepe'),(107,'America/El_Salvador'),(108,'America/Ensenada'),(109,'America/Fort_Wayne'),(110,'America/Fortaleza'),(111,'America/Glace_Bay'),(112,'America/Godthab'),(113,'America/Goose_Bay'),(114,'America/Grand_Turk'),(115,'America/Grenada'),(116,'America/Guadeloupe'),(117,'America/Guatemala'),(118,'America/Guayaquil'),(119,'America/Guyana'),(120,'America/Halifax'),(121,'America/Havana'),(122,'America/Hermosillo'),(123,'America/Indiana/Indianapolis'),(124,'America/Indiana/Knox'),(125,'America/Indiana/Marengo'),(126,'America/Indiana/Petersburg'),(127,'America/Indiana/Tell_City'),(128,'America/Indiana/Vevay'),(129,'America/Indiana/Vincennes'),(130,'America/Indiana/Winamac'),(131,'America/Indianapolis'),(132,'America/Inuvik'),(133,'America/Iqaluit'),(134,'America/Jamaica'),(135,'America/Jujuy'),(136,'America/Juneau'),(137,'America/Kentucky/Louisville'),(138,'America/Kentucky/Monticello'),(139,'America/Knox_IN'),(140,'America/La_Paz'),(141,'America/Lima'),(142,'America/Los_Angeles'),(143,'America/Louisville'),(144,'America/Maceio'),(145,'America/Managua'),(146,'America/Manaus'),(147,'America/Marigot'),(148,'America/Martinique'),(149,'America/Matamoros'),(150,'America/Mazatlan'),(151,'America/Mendoza'),(152,'America/Menominee'),(153,'America/Merida'),(154,'America/Mexico_City'),(155,'America/Miquelon'),(156,'America/Moncton'),(157,'America/Monterrey'),(158,'America/Montevideo'),(159,'America/Montreal'),(160,'America/Montserrat'),(161,'America/Nassau'),(162,'America/New_York'),(163,'America/Nipigon'),(164,'America/Nome'),(165,'America/Noronha'),(166,'America/North_Dakota/Center'),(167,'America/North_Dakota/New_Salem'),(168,'America/Ojinaga'),(169,'America/Panama'),(170,'America/Pangnirtung'),(171,'America/Paramaribo'),(172,'America/Phoenix'),(173,'America/Port-au-Prince'),(174,'America/Port_of_Spain'),(175,'America/Porto_Acre'),(176,'America/Porto_Velho'),(177,'America/Puerto_Rico'),(178,'America/Rainy_River'),(179,'America/Rankin_Inlet'),(180,'America/Recife'),(181,'America/Regina'),(182,'America/Resolute'),(183,'America/Rio_Branco'),(184,'America/Rosario'),(185,'America/Santa_Isabel'),(186,'America/Santarem'),(187,'America/Santiago'),(188,'America/Santo_Domingo'),(189,'America/Sao_Paulo'),(190,'America/Scoresbysund'),(191,'America/Shiprock'),(192,'America/St_Barthelemy'),(193,'America/St_Johns'),(194,'America/St_Kitts'),(195,'America/St_Lucia'),(196,'America/St_Thomas'),(197,'America/St_Vincent'),(198,'America/Swift_Current'),(199,'America/Tegucigalpa'),(200,'America/Thule'),(201,'America/Thunder_Bay'),(202,'America/Tijuana'),(203,'America/Toronto'),(204,'America/Tortola'),(205,'America/Vancouver'),(206,'America/Virgin'),(207,'America/Whitehorse'),(208,'America/Winnipeg'),(209,'America/Yakutat'),(210,'America/Yellowknife'),(211,'Antarctica/Casey'),(212,'Antarctica/Davis'),(213,'Antarctica/DumontDUrville'),(214,'Antarctica/Mawson'),(215,'Antarctica/McMurdo'),(216,'Antarctica/Palmer'),(217,'Antarctica/Rothera'),(218,'Antarctica/South_Pole'),(219,'Antarctica/Syowa'),(220,'Antarctica/Vostok'),(221,'Arctic/Longyearbyen'),(222,'Asia/Aden'),(223,'Asia/Almaty'),(224,'Asia/Amman'),(225,'Asia/Anadyr'),(226,'Asia/Aqtau'),(227,'Asia/Aqtobe'),(228,'Asia/Ashgabat'),(229,'Asia/Ashkhabad'),(230,'Asia/Baghdad'),(231,'Asia/Bahrain'),(232,'Asia/Baku'),(233,'Asia/Bangkok'),(234,'Asia/Beirut'),(235,'Asia/Bishkek'),(236,'Asia/Brunei'),(237,'Asia/Calcutta'),(238,'Asia/Choibalsan'),(239,'Asia/Chongqing'),(240,'Asia/Chungking'),(241,'Asia/Colombo'),(242,'Asia/Dacca'),(243,'Asia/Damascus'),(244,'Asia/Dhaka'),(245,'Asia/Dili'),(246,'Asia/Dubai'),(247,'Asia/Dushanbe'),(248,'Asia/Gaza'),(249,'Asia/Harbin'),(250,'Asia/Ho_Chi_Minh'),(251,'Asia/Hong_Kong'),(252,'Asia/Hovd'),(253,'Asia/Irkutsk'),(254,'Asia/Istanbul'),(255,'Asia/Jakarta'),(256,'Asia/Jayapura'),(257,'Asia/Jerusalem'),(258,'Asia/Kabul'),(259,'Asia/Kamchatka'),(260,'Asia/Karachi'),(261,'Asia/Kashgar'),(262,'Asia/Kathmandu'),(263,'Asia/Katmandu'),(264,'Asia/Kolkata'),(265,'Asia/Krasnoyarsk'),(266,'Asia/Kuala_Lumpur'),(267,'Asia/Kuching'),(268,'Asia/Kuwait'),(269,'Asia/Macao'),(270,'Asia/Macau'),(271,'Asia/Magadan'),(272,'Asia/Makassar'),(273,'Asia/Manila'),(274,'Asia/Muscat'),(275,'Asia/Nicosia'),(276,'Asia/Novokuznetsk'),(277,'Asia/Novosibirsk'),(278,'Asia/Omsk'),(279,'Asia/Oral'),(280,'Asia/Phnom_Penh'),(281,'Asia/Pontianak'),(282,'Asia/Pyongyang'),(283,'Asia/Qatar'),(284,'Asia/Qyzylorda'),(285,'Asia/Rangoon'),(286,'Asia/Riyadh'),(287,'Asia/Saigon'),(288,'Asia/Sakhalin'),(289,'Asia/Samarkand'),(290,'Asia/Seoul'),(291,'Asia/Shanghai'),(292,'Asia/Singapore'),(293,'Asia/Taipei'),(294,'Asia/Tashkent'),(295,'Asia/Tbilisi'),(296,'Asia/Tehran'),(297,'Asia/Tel_Aviv'),(298,'Asia/Thimbu'),(299,'Asia/Thimphu'),(300,'Asia/Tokyo'),(301,'Asia/Ujung_Pandang'),(302,'Asia/Ulaanbaatar'),(303,'Asia/Ulan_Bator'),(304,'Asia/Urumqi'),(305,'Asia/Vientiane'),(306,'Asia/Vladivostok'),(307,'Asia/Yakutsk'),(308,'Asia/Yekaterinburg'),(309,'Asia/Yerevan'),(310,'Atlantic/Azores'),(311,'Atlantic/Bermuda'),(312,'Atlantic/Canary'),(313,'Atlantic/Cape_Verde'),(314,'Atlantic/Faeroe'),(315,'Atlantic/Faroe'),(316,'Atlantic/Jan_Mayen'),(317,'Atlantic/Madeira'),(318,'Atlantic/Reykjavik'),(319,'Atlantic/South_Georgia'),(320,'Atlantic/St_Helena'),(321,'Atlantic/Stanley'),(322,'Australia/ACT'),(323,'Australia/Adelaide'),(324,'Australia/Brisbane'),(325,'Australia/Broken_Hill'),(326,'Australia/Canberra'),(327,'Australia/Currie'),(328,'Australia/Darwin'),(329,'Australia/Eucla'),(330,'Australia/Hobart'),(331,'Australia/LHI'),(332,'Australia/Lindeman'),(333,'Australia/Lord_Howe'),(334,'Australia/Melbourne'),(335,'Australia/North'),(336,'Australia/NSW'),(337,'Australia/Perth'),(338,'Australia/Queensland'),(339,'Australia/South'),(340,'Australia/Sydney'),(341,'Australia/Tasmania'),(342,'Australia/Victoria'),(343,'Australia/West'),(344,'Australia/Yancowinna'),(345,'Europe/Amsterdam'),(346,'Europe/Andorra'),(347,'Europe/Athens'),(348,'Europe/Belfast'),(349,'Europe/Belgrade'),(350,'Europe/Berlin'),(351,'Europe/Bratislava'),(352,'Europe/Brussels'),(353,'Europe/Bucharest'),(354,'Europe/Budapest'),(355,'Europe/Chisinau'),(356,'Europe/Copenhagen'),(357,'Europe/Dublin'),(358,'Europe/Gibraltar'),(359,'Europe/Guernsey'),(360,'Europe/Helsinki'),(361,'Europe/Isle_of_Man'),(362,'Europe/Istanbul'),(363,'Europe/Jersey'),(364,'Europe/Kaliningrad'),(365,'Europe/Kiev'),(366,'Europe/Lisbon'),(367,'Europe/Ljubljana'),(368,'Europe/London'),(369,'Europe/Luxembourg'),(370,'Europe/Madrid'),(371,'Europe/Malta'),(372,'Europe/Mariehamn'),(373,'Europe/Minsk'),(374,'Europe/Monaco'),(375,'Europe/Moscow'),(376,'Europe/Nicosia'),(377,'Europe/Oslo'),(378,'Europe/Paris'),(379,'Europe/Podgorica'),(380,'Europe/Prague'),(381,'Europe/Riga'),(382,'Europe/Rome'),(383,'Europe/Samara'),(384,'Europe/San_Marino'),(385,'Europe/Sarajevo'),(386,'Europe/Simferopol'),(387,'Europe/Skopje'),(388,'Europe/Sofia'),(389,'Europe/Stockholm'),(390,'Europe/Tallinn'),(391,'Europe/Tirane'),(392,'Europe/Tiraspol'),(393,'Europe/Uzhgorod'),(394,'Europe/Vaduz'),(395,'Europe/Vatican'),(396,'Europe/Vienna'),(397,'Europe/Vilnius'),(398,'Europe/Volgograd'),(399,'Europe/Warsaw'),(400,'Europe/Zagreb'),(401,'Europe/Zaporozhye'),(402,'Europe/Zurich'),(403,'Indian/Antananarivo'),(404,'Indian/Chagos'),(405,'Indian/Christmas'),(406,'Indian/Cocos'),(407,'Indian/Comoro'),(408,'Indian/Kerguelen'),(409,'Indian/Mahe'),(410,'Indian/Maldives'),(411,'Indian/Mauritius'),(412,'Indian/Mayotte'),(413,'Indian/Reunion'),(414,'Pacific/Apia'),(415,'Pacific/Auckland'),(416,'Pacific/Chatham'),(417,'Pacific/Easter'),(418,'Pacific/Efate'),(419,'Pacific/Enderbury'),(420,'Pacific/Fakaofo'),(421,'Pacific/Fiji'),(422,'Pacific/Funafuti'),(423,'Pacific/Galapagos'),(424,'Pacific/Gambier'),(425,'Pacific/Guadalcanal'),(426,'Pacific/Guam'),(427,'Pacific/Honolulu'),(428,'Pacific/Johnston'),(429,'Pacific/Kiritimati'),(430,'Pacific/Kosrae'),(431,'Pacific/Kwajalein'),(432,'Pacific/Majuro'),(433,'Pacific/Marquesas'),(434,'Pacific/Midway'),(435,'Pacific/Nauru'),(436,'Pacific/Niue'),(437,'Pacific/Norfolk'),(438,'Pacific/Noumea'),(439,'Pacific/Pago_Pago'),(440,'Pacific/Palau'),(441,'Pacific/Pitcairn'),(442,'Pacific/Ponape'),(443,'Pacific/Port_Moresby'),(444,'Pacific/Rarotonga'),(445,'Pacific/Saipan'),(446,'Pacific/Samoa'),(447,'Pacific/Tahiti'),(448,'Pacific/Tarawa'),(449,'Pacific/Tongatapu'),(450,'Pacific/Truk'),(451,'Pacific/Wake'),(452,'Pacific/Wallis'),(453,'Pacific/Yap');
/*!40000 ALTER TABLE `static_timezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_freeze`
--

DROP TABLE IF EXISTS `system_freeze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_freeze` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `id_person_create` int(11) NOT NULL,
  `element_type` varchar(255) NOT NULL,
  `element_id` int(11) NOT NULL,
  `data` text NOT NULL,
  `hash` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `original` (`element_type`,`element_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_freeze`
--

LOCK TABLES `system_freeze` WRITE;
/*!40000 ALTER TABLE `system_freeze` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_freeze` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_lock`
--

DROP TABLE IF EXISTS `system_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_lock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ext` smallint(6) NOT NULL,
  `table` varchar(60) NOT NULL,
  `id_record` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tablerecord` (`table`,`id_record`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_lock`
--

LOCK TABLES `system_lock` WRITE;
/*!40000 ALTER TABLE `system_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_log_email`
--

DROP TABLE IF EXISTS `system_log_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_log_email` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL,
  `date_update` int(10) unsigned NOT NULL,
  `id_person_create` int(10) unsigned NOT NULL,
  `ext` smallint(5) unsigned NOT NULL,
  `record_type` smallint(5) unsigned NOT NULL,
  `id_record` int(10) unsigned NOT NULL,
  `id_receiver` int(10) unsigned NOT NULL,
  `receiver_type` varchar(32) NOT NULL DEFAULT 'contactperson',
  PRIMARY KEY (`id`),
  KEY `record` (`id_record`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_log_email`
--

LOCK TABLES `system_log_email` WRITE;
/*!40000 ALTER TABLE `system_log_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_log_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_log_error`
--

DROP TABLE IF EXISTS `system_log_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_log_error` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL,
  `requestkey` varchar(8) NOT NULL,
  `id_person` int(5) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  `file` varchar(100) NOT NULL,
  `line` smallint(5) unsigned NOT NULL,
  `message` varchar(255) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_log_error`
--

LOCK TABLES `system_log_error` WRITE;
/*!40000 ALTER TABLE `system_log_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_log_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_preference`
--

DROP TABLE IF EXISTS `system_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_preference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_person` int(10) unsigned NOT NULL,
  `ext` smallint(5) unsigned NOT NULL,
  `area` smallint(5) unsigned NOT NULL,
  `preference` varchar(50) NOT NULL,
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fast` (`id_person`,`ext`,`preference`)
) ENGINE=MyISAM AUTO_INCREMENT=754 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_preference`
--

LOCK TABLES `system_preference` WRITE;
/*!40000 ALTER TABLE `system_preference` DISABLE KEYS */;
INSERT INTO `system_preference` VALUES (1,1,112,0,'detailsexpanded',3,'1'),(2,1,112,0,'detailsexpanded',35,'1'),(3,1,112,0,'tasktree-task-exp',0,'16'),(4,1,112,0,'tasktree-task-exp',0,'19'),(5,1,112,0,'tasktree-subtasks',0,'8'),(6,1,112,0,'tasktree-subtasks',0,'9'),(7,1,112,0,'tasktree-task-exp',0,'27'),(8,1,112,0,'tasktree-subtasks',0,'10'),(9,1,112,0,'tasktree-subtasks',0,'13'),(10,1,112,0,'tasktree-subtasks',0,'43'),(11,1,112,0,'tasktree-subtasks',0,'44'),(12,1,112,0,'tasktree-subtasks',0,'45'),(13,1,112,0,'tasktree-subtasks',0,'57'),(14,1,112,0,'tasktree-subtasks',0,'46'),(15,1,112,0,'detailsexpanded',6,'1'),(16,1,112,0,'detailsexpanded',7,'1'),(17,1,112,0,'detailsexpanded',9,'1'),(18,1,112,0,'detailsexpanded',11,'1'),(19,1,112,112,'tasktree-subtasks',0,'75'),(20,1,112,0,'detailsexpanded',13,'1'),(21,1,112,112,'tasktree-subtasks',0,'82'),(22,1,112,112,'tasktree-subtasks',0,'85'),(23,1,112,112,'tasktree-subtasks',0,'94'),(24,1,112,112,'tasktree-subtasks',0,'98'),(25,1,112,112,'tasktree-subtasks',0,'101'),(26,1,112,112,'tasktree-subtasks',0,'107'),(27,1,112,112,'tasktree-subtasks',0,'111'),(28,1,112,112,'tasktree-subtasks',0,'89'),(29,1,112,112,'tasktree-subtasks',0,'37'),(30,1,112,112,'tasktree-subtasks',0,'38'),(31,1,112,112,'tasktree-subtasks',0,'88'),(32,1,120,0,'locale',0,'en_GB'),(33,1,112,112,'task-tab',61,'comment'),(34,1,112,112,'task-tab',60,'comment'),(35,17,112,112,'panelwidget-projectlist-filter',0,'[{\"filter\":\"status\",\"value\":[\"1\",\"3\",\"5\",\"8\",\"9\"]}]'),(36,17,112,112,'panelwidget-projectstatusfilter',0,'1,3,5,8,9'),(37,1,104,0,'portal-event-expanded',1,'1'),(38,17,112,112,'tasktree-subtasks',0,'13'),(39,17,112,0,'tasktree-subtasks',0,'13'),(40,1,112,112,'tasktree-subtasks',0,'12'),(41,1,112,0,'tasktree-subtasks',0,'12'),(42,1,112,112,'task-tab',35,'comment'),(43,1,112,111,'task-tab',35,'comment'),(44,17,112,112,'task-tab',60,'assets'),(45,17,112,112,'tasktree-subtasks',0,'88'),(46,17,112,112,'tasktree-subtasks',0,'94'),(47,17,112,112,'tasktree-subtasks',0,'101'),(48,17,112,112,'task-tab',106,'assets'),(49,17,112,112,'task-tab',95,'comment'),(50,1,112,111,'task-tab',95,'assets'),(51,17,120,100,'panelwidget-userselector-filter',0,'test'),(52,17,120,0,'admintab',0,'user'),(53,18,126,0,'pwidget-profilemodules',0,'0'),(54,18,112,111,'task-tab',60,'assets'),(55,17,115,0,'filterset-task',0,'7'),(56,17,115,0,'filterset-project',0,'8'),(57,17,115,0,'tab',0,'task'),(58,12,112,0,'detailsexpanded',14,'1'),(59,17,112,111,'task-tab',60,'comment'),(60,17,112,0,'tasktree-subtasks',0,'101'),(61,17,112,0,'tasktree-task-exp',0,'101'),(62,18,112,111,'task-tab',0,'comment'),(63,12,112,0,'tasktree-subtasks',0,'133'),(64,12,106,0,'tab',0,'person'),(65,17,126,0,'tab-general',0,'password'),(66,17,126,0,'module',0,'general'),(67,17,106,0,'tab',0,'person'),(68,17,104,104,'panelwidget-holidaysetselector',0,'2,4,3,1'),(69,17,112,0,'tasktree-subtasks',0,'85'),(70,17,112,0,'tasktree-task-exp',0,'85'),(71,17,104,0,'fulldayview',0,'0'),(72,17,112,0,'tasktree-subtasks',0,'87'),(73,17,112,0,'tasktree-task-exp',0,'87'),(74,17,112,112,'tasktree-subtasks',0,'87'),(75,1,112,0,'tasktree-subtasks',0,'11'),(76,17,120,104,'panelwidget-staffselector',0,'{\"multiple\":false,\"jobtypes\":[\"0\"],\"users\":[\"14\",\"18\",\"17\",\"1\"]}'),(77,17,112,112,'tasktree-subtasks',0,'43'),(78,12,112,111,'task-tab',134,'assets'),(79,12,112,111,'task-tab',0,'comment'),(80,17,112,112,'panelwidget-taskstatusfilter',0,'1,2,3,4,5,6,7,8'),(81,17,112,0,'tasktree-subtasks',0,'15'),(82,17,112,0,'tasktree-task-exp',0,'15'),(83,17,104,0,'tab',0,'month'),(84,17,0,17,'tabsubmenu_planning',0,'calendar'),(85,17,104,104,'date',0,'1265616000'),(86,17,112,0,'tasktree-subtasks',0,'142'),(87,17,112,0,'tasktree-task-exp',0,'142'),(88,17,111,0,'filtersets',0,'6'),(89,17,111,0,'tab',0,'todo'),(90,17,112,0,'project',0,'4'),(91,17,112,0,'projecttabs',0,'4,7,9'),(92,17,100,100,'module',0,'records'),(93,17,0,0,'tab',0,'portal'),(94,12,115,0,'filterset-task',0,'13'),(95,12,111,0,'filtersets',0,'13'),(96,12,111,0,'tab',0,'todo'),(97,1,112,112,'panelwidget-projectlist-filter',0,'[{\"filter\":\"fulltext\",\"value\":\"\"},{\"filter\":\"status\",\"value\":[\"3\",\"5\",\"8\",\"9\"]}]'),(586,1,112,112,'panelwidget-projectstatusfilter',0,'3'),(475,1,112,112,'panelwidget-taskstatusfilter',0,'1,2,3,10,7,4,5,6'),(100,12,112,0,'tasktree-task-exp',0,'144'),(101,1,115,0,'filterset-project',0,'15'),(102,1,118,0,'ext',0,'bookmark'),(103,1,120,0,'admintab',0,'user'),(653,1,106,0,'tab',0,'person'),(105,18,112,111,'task-tab',135,'timetracking'),(106,18,112,111,'task-tab',136,'timetracking'),(107,18,112,111,'task-tab',134,'timetracking'),(108,12,112,0,'tasktree-subtasks',0,'137'),(109,12,112,0,'tasktree-task-exp',0,'137'),(110,6,0,6,'tabsubmenu_planning',0,'calendar'),(111,1,115,0,'filterset-task',0,'3'),(112,18,112,112,'tasktree-subtasks',0,'137'),(113,12,112,112,'tasktree-subtasks',0,'137'),(114,12,112,112,'tasktree-subtasks',0,'145'),(115,18,112,111,'task-tab',148,'comment'),(116,18,120,0,'locale',0,'en_GB'),(117,18,112,0,'project',0,'14'),(118,18,112,0,'projecttabs',0,''),(119,12,107,0,'pwidget-daytracks',0,'1'),(120,6,115,0,'tab',0,'project'),(121,1,112,112,'tasktree-subtasks',0,'113'),(122,1,112,112,'tasktree-subtasks',0,'13'),(123,1,112,112,'tasktree-subtasks',0,'15'),(124,1,112,112,'tasktree-subtasks',0,'142'),(125,12,100,100,'module',0,'user'),(126,12,120,100,'panelwidget-userselector-filter',0,''),(127,18,111,0,'tab',0,'todo'),(128,18,106,0,'tab',0,'person'),(129,12,120,0,'admintab',0,'usergroup'),(130,1,112,0,'tasktree-subtasks',0,'37'),(131,1,112,111,'task-tab',106,'assets'),(132,12,112,0,'pwidget-projectlist',0,'0'),(133,12,112,0,'pwidget-quickproject',0,'0'),(134,12,112,0,'pwidget-taskstatusfilter',0,'0'),(135,12,103,0,'pwidget-taskbookmarks',0,'0'),(136,12,112,112,'panelwidget-projectstatusfilter',0,'1,3,5'),(137,12,112,0,'pwidget-projectstatusfilter',0,'1'),(138,12,112,112,'panelwidget-projectlist-filter',0,'[{\"filter\":\"fulltext\",\"value\":\"web\"}]'),(139,12,0,0,'tab',0,'project'),(140,1,120,100,'panelwidget-userselector-filter',0,'eisen'),(141,12,112,0,'project',0,'6'),(142,12,112,0,'projecttabs',0,'6,4,12'),(143,12,112,112,'tasktree-subtasks',0,'113'),(144,12,112,112,'tasktree-subtasks',0,'114'),(145,12,112,0,'tasktree-task-exp',0,'116'),(146,18,100,100,'module',0,'extensions'),(148,18,0,0,'tab',0,'contact'),(149,1,112,0,'tasktree-subtasks',0,'38'),(150,12,112,112,'task-tab',116,'assets'),(151,6,112,0,'pwidget-quickproject',0,'0'),(152,1,100,100,'module',0,'extensions'),(153,1,112,0,'pwidget-quickproject',0,'1'),(154,1,103,0,'pwidget-taskbookmarks',0,'0'),(155,1,112,112,'task-tab',149,'comment'),(156,1,112,0,'tasktree-subtasks',0,'149'),(157,1,112,0,'tasktree-task-exp',0,'149'),(158,1,112,0,'project',0,'10'),(159,1,126,0,'tab-general',0,'password'),(650,1,126,0,'module',0,'general'),(161,1,104,0,'portal-event-expanded',1,'0'),(162,1,111,0,'filtersets',0,'12,4,5,3'),(163,1,112,0,'tasktree-subtasks',0,'42'),(164,1,120,104,'panelwidget-staffselector',0,'{\"multiple\":false,\"jobtypes\":[\"-1\"],\"users\":[\"12\"]}'),(165,1,104,104,'panelwidget-eventtypeselector',0,'1,2,7,3,4,5,6,8,11,12,13'),(166,1,104,104,'panelwidget-holidaysetselector',0,'4'),(167,1,104,104,'date',0,'1295218800'),(168,1,104,0,'tab',0,'month'),(308,1,0,1,'tabsubmenu_planning',0,'calendar'),(282,1,111,0,'tab',0,'selection'),(171,1,107,0,'pwidget-daytracks',0,'0'),(172,6,112,112,'panelwidget-projectlist-filter',0,'[{\"filter\":\"status\",\"value\":[\"3\",\"5\",\"8\",\"9\"]}]'),(173,6,112,112,'panelwidget-projectstatusfilter',0,'3,5,8,9'),(174,6,111,0,'tab',0,'todo'),(753,1,112,0,'projecttabs',0,'15'),(176,1,112,0,'pwidget-taskstatusfilter',0,'0'),(177,1,112,0,'pwidget-projectstatusfilter',0,'0'),(178,1,112,0,'pwidget-projectlist',0,'0'),(179,6,112,0,'projecttabs',0,'8'),(180,6,112,0,'tasktree-filters',0,'a:1:{s:6:\"status\";s:7:\"1,5,6,8\";}'),(181,6,112,112,'panelwidget-taskstatusfilter',0,'1,5,6,8'),(182,6,0,0,'tab',0,'portal'),(752,1,0,0,'tab',0,'project'),(184,1,112,0,'task-expanded',0,'35'),(185,1,112,0,'task-expanded',0,'36'),(643,1,112,112,'panelwidgetsearchlist-projectlist-search',0,''),(403,1,112,0,'detailsexpanded',15,'1'),(458,1,112,0,'projectdetail-tab',15,'general'),(455,1,112,0,'projectdetail-tab',9,'assets'),(751,1,112,112,'tasktree-subtasks',0,'212'),(740,1,112,112,'tasktree-subtasks',0,'0'),(227,1,112,0,'task-tab',178,'comment'),(315,1,112,0,'detailsexpanded',4,'1'),(744,1,112,112,'tasktree-subtasks',0,'191'),(484,1,112,0,'task-expanded',0,'185'),(268,1,112,112,'tasktree-subtasks',0,'182'),(317,1,112,0,'detailsexpanded',10,'1'),(326,1,112,0,'projectdetail-tab',4,'assets'),(402,1,112,0,'task-tab',179,'comment'),(476,1,112,0,'tasktree-filters',0,'a:1:{s:6:\"status\";s:16:\"1,2,3,10,7,4,5,6\";}'),(488,1,112,0,'task-expanded',0,'188'),(499,1,112,112,'tasktree-subtasks',0,'179'),(505,1,112,112,'tasktree-subtasks',0,'186'),(503,1,112,112,'tasktree-subtasks',0,'183'),(501,1,112,112,'tasktree-subtasks',0,'189'),(508,1,112,112,'tasktree-subtasks',0,'187'),(601,1,112,112,'tasktree-subtasks',0,'195'),(517,1,112,112,'tasktree-subtasks',0,'181'),(542,1,112,0,'task-expanded',0,'181'),(634,1,112,112,'tasktree-subtasks',0,'45'),(596,1,112,112,'tasktree-subtasks',0,'193'),(598,1,112,112,'tasktree-subtasks',0,'194'),(588,1,0,112,'pwidget-collapsed-projectstatusfilter',0,'1'),(583,1,0,112,'pwidget-collapsed-taskstatusfilter',0,'1'),(584,1,0,112,'pwidget-collapsed-daytracks',0,'1'),(585,1,0,112,'pwidget-collapsed-taskbookmarks',0,'1'),(610,1,112,112,'tasktree-subtasks',0,'196'),(654,1,106,0,'panelwidgetcontactsearch-searchword',0,''),(699,1,112,112,'tasktree-subtasks',0,'197'),(746,1,112,112,'tasktree-subtasks',0,'192'),(711,1,112,112,'tasktree-subtasks',0,'200'),(750,1,112,112,'tasktree-subtasks',0,'199'),(725,1,112,112,'tasktree-subtasks',0,'208'),(734,1,112,112,'tasktree-subtasks',0,'210'),(717,1,112,112,'tasktree-subtasks',0,'205'),(745,1,112,112,'tasktree-subtasks',0,'207'),(747,1,112,112,'tasktree-subtasks',0,'198'),(748,1,112,112,'tasktree-subtasks',0,'202');
/*!40000 ALTER TABLE `system_preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_right`
--

DROP TABLE IF EXISTS `system_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ext` smallint(5) unsigned NOT NULL DEFAULT '0',
  `right` tinytext NOT NULL,
  `id_role` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ext` (`ext`,`id_role`)
) ENGINE=MyISAM AUTO_INCREMENT=898 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_right`
--

LOCK TABLES `system_right` WRITE;
/*!40000 ALTER TABLE `system_right` DISABLE KEYS */;
INSERT INTO `system_right` VALUES (2,119,'task:track',2),(7,101,'general:use',2),(8,119,'task:editOwn',2),(10,111,'general:use',3),(11,101,'asset:seeAll',2),(13,101,'asset:delete',2),(14,101,'general:use',3),(17,103,'general:use',3),(18,103,'general:use',2),(19,103,'general:use',1),(28,107,'daytracks:timeExportAllPerson',2),(29,111,'general:use',2),(30,111,'general:use',1),(31,126,'settings:password',2),(33,126,'general:use',3),(34,126,'general:use',1),(35,126,'settings:password',3),(36,126,'general:use',2),(37,126,'settings:password',1),(50,115,'general:area',3),(51,115,'filtersets:save',2),(52,115,'general:area',1),(53,115,'general:area',2),(54,115,'general:use',3),(55,115,'general:use',1),(56,115,'general:use',2),(65,101,'asset:seeAll',3),(66,101,'general:use',1),(78,107,'daytracks:timeExportAllEmployer',2),(79,107,'daytracks:timeExport',2),(102,113,'statuschange:firstreminder',3),(103,113,'statuschange:invoiced',3),(104,113,'statussee:paid',3),(105,113,'statussee:canceled',3),(106,113,'statussee:depreciated',3),(107,113,'statussee:encashment',3),(108,113,'statussee:thirdreminder',3),(109,113,'statussee:finalreminder',3),(110,113,'statussee:secondreminder',3),(111,113,'statussee:firstreminder',3),(112,115,'filtersets:save',1),(113,115,'filtersets:save',3),(114,115,'filtersets:deleteAll',2),(115,115,'filtersets:deleteAll',1),(116,115,'filtersets:deleteAll',3),(117,115,'filtersets:hideAll',2),(118,115,'filtersets:hideAll',1),(119,115,'filtersets:hideAll',3),(120,115,'filtersets:renameAll',2),(121,115,'filtersets:renameAll',1),(122,115,'filtersets:renameAll',3),(123,119,'general:use',2),(142,101,'asset:delete',3),(190,113,'statussee:invoiced',3),(191,113,'statussee:approved',3),(192,113,'statussee:provisional',3),(193,131,'general:use',2),(194,132,'general:use',2),(196,113,'task:infos',3),(197,113,'task:icons',3),(198,113,'project:documents',3),(199,113,'project:infos',3),(200,113,'project:approvalroles',3),(201,113,'tab:invoices',3),(202,113,'tab:billing',3),(203,113,'general:area',3),(204,113,'general:use',3),(205,113,'statuschange:canceled',3),(206,113,'workflow:approve',3),(207,113,'workflow:reopen',3),(208,113,'workflow:download',3),(209,132,'general:use',3),(212,119,'task:editAllChargeable',2),(213,119,'task:editOwnChargeable',2),(287,107,'daytracks:timeExport',3),(288,107,'general:use',2),(289,107,'general:use',3),(320,100,'general:use',2),(321,100,'general:use',1),(322,100,'comment:seeAll',2),(323,100,'comment:editOwn',2),(324,100,'comment:editOwn',1),(325,100,'comment:editAll',2),(326,100,'comment:requestFeedback',2),(327,100,'comment:requestFeedback',1),(328,100,'comment:sendAsEmail',2),(329,100,'comment:sendAsEmail',1),(330,100,'comment:deleteOwn',2),(331,100,'comment:deleteOwn',1),(332,100,'comment:makePublic',2),(333,100,'comment:makePublic',1),(394,118,'general:allrecords',3),(395,118,'general:allrecords',2),(512,119,'general:use',3),(513,119,'task:track',3),(514,119,'task:editOwn',3),(587,104,'general:use',3),(588,104,'general:use',2),(589,104,'general:area',3),(590,104,'general:area',2),(591,104,'event:seeAll',3),(592,104,'event:seeAll',2),(593,104,'event:add',3),(594,104,'event:add',2),(595,104,'event:editAssigned',3),(596,104,'event:editAssigned',2),(597,104,'event:deleteAssigned',3),(598,104,'event:deleteAssigned',2),(599,104,'mailing:sendAsEmail',3),(600,104,'mailing:sendAsEmail',2),(601,104,'reminders:popup',3),(602,104,'reminders:popup',2),(603,104,'reminders:email',3),(604,104,'reminders:email',2),(605,105,'general:use',3),(606,105,'general:use',2),(607,105,'general:use',1),(608,105,'comment:seeAll',3),(609,105,'comment:seeAll',2),(610,105,'comment:editOwn',3),(611,105,'comment:editOwn',2),(612,105,'comment:requestFeedback',3),(613,105,'comment:requestFeedback',2),(614,105,'comment:requestFeedback',1),(615,105,'comment:sendAsEmail',3),(616,105,'comment:sendAsEmail',2),(617,105,'comment:sendAsEmail',1),(618,105,'comment:deleteOwn',3),(619,105,'comment:deleteOwn',2),(620,105,'comment:makePublic',3),(621,105,'comment:makePublic',2),(667,106,'general:use',3),(668,106,'general:use',2),(669,106,'general:use',1),(670,106,'general:profile',3),(671,106,'general:profile',2),(672,106,'general:profile',1),(673,106,'general:area',3),(674,106,'general:area',2),(675,106,'person:seeAllInternalPersons',3),(676,106,'person:seeAllInternalPersons',2),(677,106,'person:seeAllPersons',3),(678,106,'person:seeAllPersons',2),(679,106,'person:add',3),(680,106,'person:add',2),(681,106,'person:editAndDeleteAll',3),(682,106,'person:editAndDeleteAll',2),(683,106,'person:enableLogin',2),(684,106,'person:seeComment',3),(685,106,'person:seeComment',2),(686,106,'person:editComment',3),(687,106,'person:editComment',2),(688,106,'company:seeAllCompanies',3),(689,106,'company:seeAllCompanies',2),(690,106,'company:add',3),(691,106,'company:add',2),(692,106,'company:editOwn',3),(693,106,'company:editOwn',2),(694,106,'company:editAndDeleteAll',2),(695,106,'company:seeComment',3),(696,106,'company:seeComment',2),(697,106,'company:editComment',3),(698,106,'company:editComment',2),(699,106,'relation:seeAllContactinfotypes',3),(700,106,'relation:seeAllContactinfotypes',2),(701,106,'relation:seeHomeAddress',3),(702,106,'relation:seeHomeAddress',2),(703,106,'relation:seeBusinessAddress',3),(704,106,'relation:seeBusinessAddress',2),(705,106,'relation:seeBillingAddress',3),(706,106,'relation:seeBillingAddress',2),(707,106,'panelwidgets:staffSelector',3),(708,106,'panelwidgets:staffSelector',2),(709,106,'panelwidgets:export',3),(710,106,'panelwidgets:export',2),(711,112,'general:use',3),(712,112,'general:use',2),(713,112,'general:use',1),(714,112,'general:area',3),(715,112,'general:area',2),(716,112,'general:area',1),(717,112,'project:seeOwn',3),(718,112,'project:seeOwn',2),(719,112,'project:seeOwn',1),(720,112,'project:seeAll',3),(721,112,'project:seeAll',2),(722,112,'project:planning:see',3),(723,112,'project:planning:see',2),(724,112,'project:planning:see',1),(725,112,'project:progress:see',3),(726,112,'project:progress:see',2),(727,112,'project:progress:see',1),(728,112,'project:done:see',3),(729,112,'project:done:see',2),(730,112,'project:done:see',1),(731,112,'project:cleared:see',3),(732,112,'project:cleared:see',2),(733,112,'project:warranty:see',3),(734,112,'project:warranty:see',2),(735,112,'project:warranty:see',1),(736,112,'project:add',3),(737,112,'project:add',2),(738,112,'project:editAndDelete',3),(739,112,'project:editAndDelete',2),(740,112,'seetask:seeAll',3),(741,112,'seetask:seeAll',2),(742,112,'seetask:seeAll',1),(743,112,'seetask:planning:see',3),(744,112,'seetask:planning:see',2),(745,112,'seetask:planning:see',1),(746,112,'seetask:open:see',3),(747,112,'seetask:open:see',2),(748,112,'seetask:open:see',1),(749,112,'seetask:progress:see',3),(750,112,'seetask:progress:see',2),(751,112,'seetask:progress:see',1),(752,112,'seetask:confirm:see',3),(753,112,'seetask:confirm:see',2),(754,112,'seetask:confirm:see',1),(755,112,'seetask:done:see',3),(756,112,'seetask:done:see',2),(757,112,'seetask:done:see',1),(758,112,'seetask:accepted:see',3),(759,112,'seetask:accepted:see',2),(760,112,'seetask:accepted:see',1),(761,112,'seetask:rejected:see',3),(762,112,'seetask:rejected:see',2),(763,112,'seetask:rejected:see',1),(764,112,'seetask:cleared:see',3),(765,112,'seetask:cleared:see',2),(766,112,'seetask:cleared:see',1),(767,112,'addtask:addTaskInOwnProjects',3),(768,112,'addtask:addTaskInOwnProjects',2),(769,112,'addtask:addTaskInOwnProjects',1),(770,112,'addtask:addViaQuickCreateHeadlet',3),(771,112,'addtask:addViaQuickCreateHeadlet',2),(772,112,'addtask:addTaskInAllProjects',3),(773,112,'addtask:addTaskInAllProjects',2),(774,112,'addtask:addContainerInOwnProjects',3),(775,112,'addtask:addContainerInOwnProjects',2),(776,112,'addtask:addContainerInAllProjects',3),(777,112,'addtask:addContainerInAllProjects',2),(778,112,'addtask:planning:create',3),(779,112,'addtask:planning:create',2),(780,112,'addtask:open:create',3),(781,112,'addtask:open:create',2),(782,112,'addtask:progress:create',3),(783,112,'addtask:progress:create',2),(784,112,'addtask:confirm:create',3),(785,112,'addtask:confirm:create',2),(786,112,'addtask:done:create',3),(787,112,'addtask:done:create',2),(788,112,'addtask:accepted:create',3),(789,112,'addtask:accepted:create',2),(790,112,'addtask:rejected:create',3),(791,112,'addtask:rejected:create',2),(792,112,'addtask:cleared:create',3),(793,112,'addtask:cleared:create',2),(794,112,'edittask:editOwnTasks',3),(795,112,'edittask:editOwnTasks',2),(796,112,'edittask:editOwnTasks',1),(797,112,'edittask:editTaskInOwnProjects',3),(798,112,'edittask:editTaskInOwnProjects',2),(799,112,'edittask:editTaskInOwnProjects',1),(800,112,'edittask:editTaskInAllProjects',3),(801,112,'edittask:editTaskInAllProjects',2),(802,112,'edittask:editOwnContainers',3),(803,112,'edittask:editOwnContainers',2),(804,112,'edittask:editContainerInOwnProjects',3),(805,112,'edittask:editContainerInOwnProjects',2),(806,112,'edittask:editContainerInAllProjects',3),(807,112,'edittask:editContainerInAllProjects',2),(808,112,'edittask:planning:edit',3),(809,112,'edittask:planning:edit',2),(810,112,'edittask:open:edit',3),(811,112,'edittask:open:edit',2),(812,112,'edittask:progress:edit',3),(813,112,'edittask:progress:edit',2),(814,112,'edittask:confirm:edit',3),(815,112,'edittask:confirm:edit',2),(816,112,'edittask:done:edit',3),(817,112,'edittask:done:edit',2),(818,112,'edittask:accepted:edit',3),(819,112,'edittask:accepted:edit',2),(820,112,'edittask:rejected:edit',3),(821,112,'edittask:rejected:edit',2),(824,112,'edittaskdetail:editDateStart',3),(825,112,'edittaskdetail:editDateStart',2),(826,112,'edittaskdetail:editDateEnd',3),(827,112,'edittaskdetail:editDateEnd',2),(828,112,'edittaskdetail:editDeadline',3),(829,112,'edittaskdetail:editDeadline',2),(830,112,'edittaskdetail:editPersonAssigned',3),(831,112,'edittaskdetail:editPersonAssigned',2),(832,112,'edittaskdetail:editPersonOwner',3),(833,112,'edittaskdetail:editPersonOwner',2),(834,112,'edittaskdetail:editActivity',3),(835,112,'edittaskdetail:editActivity',2),(836,112,'edittaskdetail:editEstimatedWorkload',3),(837,112,'edittaskdetail:editEstimatedWorkload',2),(838,112,'edittaskdetail:editIsPublic',3),(839,112,'edittaskdetail:editIsPublic',2),(840,112,'edittaskdetail:planning:changefrom',3),(841,112,'edittaskdetail:planning:changefrom',2),(842,112,'edittaskdetail:open:changefrom',3),(843,112,'edittaskdetail:open:changefrom',2),(844,112,'edittaskdetail:progress:changefrom',3),(845,112,'edittaskdetail:progress:changefrom',2),(846,112,'edittaskdetail:confirm:changefrom',3),(847,112,'edittaskdetail:confirm:changefrom',2),(848,112,'edittaskdetail:confirm:changefrom',1),(849,112,'edittaskdetail:done:changefrom',3),(850,112,'edittaskdetail:done:changefrom',2),(851,112,'edittaskdetail:done:changefrom',1),(852,112,'edittaskdetail:accepted:changefrom',3),(853,112,'edittaskdetail:accepted:changefrom',2),(854,112,'edittaskdetail:rejected:changefrom',3),(855,112,'edittaskdetail:rejected:changefrom',2),(856,112,'edittaskdetail:planning:changeto',3),(857,112,'edittaskdetail:planning:changeto',2),(858,112,'edittaskdetail:open:changeto',3),(859,112,'edittaskdetail:open:changeto',2),(860,112,'edittaskdetail:progress:changeto',3),(861,112,'edittaskdetail:progress:changeto',2),(862,112,'edittaskdetail:confirm:changeto',3),(863,112,'edittaskdetail:confirm:changeto',2),(864,112,'edittaskdetail:done:changeto',3),(865,112,'edittaskdetail:done:changeto',2),(866,112,'edittaskdetail:accepted:changeto',3),(867,112,'edittaskdetail:accepted:changeto',2),(868,112,'edittaskdetail:accepted:changeto',1),(869,112,'edittaskdetail:rejected:changeto',3),(870,112,'edittaskdetail:rejected:changeto',2),(871,112,'edittaskdetail:rejected:changeto',1),(872,112,'edittaskdetail:cleared:changeto',3),(873,112,'edittaskdetail:cleared:changeto',2),(874,112,'deletetask:deleteOwnTasks',3),(875,112,'deletetask:deleteOwnTasks',2),(876,112,'deletetask:deleteTaskInOwnProjects',3),(877,112,'deletetask:deleteTaskInOwnProjects',2),(878,112,'deletetask:deleteTaskInAllProjects',3),(879,112,'deletetask:deleteTaskInAllProjects',2),(880,112,'deletetask:deleteOwnContainers',3),(881,112,'deletetask:deleteOwnContainers',2),(882,112,'deletetask:deleteContainerInOwnProjects',3),(883,112,'deletetask:deleteContainerInOwnProjects',2),(884,112,'deletetask:deleteContainerInAllProjects',3),(885,112,'deletetask:deleteContainerInAllProjects',2),(886,112,'export:taskcsv',2),(887,112,'export:projectcsv',2),(888,112,'seetask:waiting:see',2),(889,112,'seetask:waiting:see',3),(890,112,'addtask:waiting:create',2),(891,112,'addtask:waiting:create',3),(892,112,'edittask:waiting:edit',2),(893,112,'edittask:waiting:edit',3),(894,112,'edittaskdetail:waiting:changefrom',2),(895,112,'edittaskdetail:waiting:changefrom',3),(896,112,'edittaskdetail:waiting:changeto',2),(897,112,'edittaskdetail:waiting:changeto',3);
/*!40000 ALTER TABLE `system_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_role`
--

DROP TABLE IF EXISTS `system_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_create` int(10) unsigned NOT NULL DEFAULT '0',
  `date_update` int(10) unsigned NOT NULL,
  `id_person_create` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_role`
--

LOCK TABLES `system_role` WRITE;
/*!40000 ALTER TABLE `system_role` DISABLE KEYS */;
INSERT INTO `system_role` VALUES (1,1264761659,0,1,0,'Customers',1,'Customers with todoyu access'),(2,1264762106,0,1,0,'Project Managers',1,''),(3,1264762153,0,1,0,'Staff',1,'Executive members of staff');
/*!40000 ALTER TABLE `system_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_scheduler`
--

DROP TABLE IF EXISTS `system_scheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_scheduler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_execute` int(11) NOT NULL,
  `class` varchar(100) NOT NULL,
  `is_success` tinyint(1) NOT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `latest` (`class`,`date_execute`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_scheduler`
--

LOCK TABLES `system_scheduler` WRITE;
/*!40000 ALTER TABLE `system_scheduler` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_scheduler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_token`
--

DROP TABLE IF EXISTS `system_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `id_person_create` int(11) NOT NULL,
  `id_person_owner` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `ext` smallint(6) NOT NULL,
  `token_type` int(11) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `callback_params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_token`
--

LOCK TABLES `system_token` WRITE;
/*!40000 ALTER TABLE `system_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-22 18:16:00
