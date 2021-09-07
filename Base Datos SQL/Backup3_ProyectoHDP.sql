-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ProyectoHDP
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
-- Table structure for table `GASOLINA`
--

DROP TABLE IF EXISTS `GASOLINA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GASOLINA` (
  `IDGASOLINA` varchar(5) NOT NULL,
  `TIPOGASOLINA` char(15) NOT NULL,
  PRIMARY KEY (`IDGASOLINA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GASOLINA`
--

LOCK TABLES `GASOLINA` WRITE;
/*!40000 ALTER TABLE `GASOLINA` DISABLE KEYS */;
INSERT INTO `GASOLINA` VALUES ('DI03','Diesel'),('ES01','Especial'),('RE02','Regular');
/*!40000 ALTER TABLE `GASOLINA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERIODO`
--

DROP TABLE IF EXISTS `PERIODO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERIODO` (
  `IDPERIODO` int(11) NOT NULL AUTO_INCREMENT,
  `FECHAINICIO` date NOT NULL,
  `FECHAFIN` date NOT NULL,
  PRIMARY KEY (`IDPERIODO`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERIODO`
--

LOCK TABLES `PERIODO` WRITE;
/*!40000 ALTER TABLE `PERIODO` DISABLE KEYS */;
INSERT INTO `PERIODO` VALUES (1,'2019-12-31','2020-01-13'),(2,'2020-01-14','2020-01-27'),(3,'2020-01-28','2020-02-10'),(4,'2020-02-11','2020-02-24'),(5,'2020-02-25','2020-03-09'),(6,'2020-03-10','2020-03-23'),(7,'2020-03-24','2020-04-06'),(8,'2020-04-07','2020-04-20'),(9,'2020-04-21','2020-05-04'),(10,'2020-05-05','2020-05-18'),(11,'2020-05-19','2020-06-01'),(12,'2020-06-02','2020-06-15'),(13,'2020-06-16','2020-06-29'),(14,'2020-06-30','2020-07-13'),(15,'2020-07-14','2020-07-27'),(16,'2020-07-28','2020-08-10'),(17,'2020-08-11','2020-08-24'),(18,'2020-08-25','2020-09-07'),(19,'2020-09-08','2020-09-21'),(20,'2020-09-22','2020-10-05'),(21,'2020-10-06','2020-10-19'),(22,'2020-10-20','2020-11-02'),(23,'2020-11-03','2020-11-16'),(24,'2020-11-17','2020-11-30'),(25,'2020-12-01','2020-12-14'),(26,'2020-12-15','2020-12-28'),(27,'2020-12-29','2021-01-11'),(28,'2021-01-12','2021-01-25'),(29,'2021-01-26','2021-02-08'),(30,'2021-02-09','2021-02-22'),(31,'2021-02-23','2021-03-08'),(32,'2021-03-09','2021-03-22'),(33,'2021-03-23','2021-04-05'),(34,'2021-04-06','2021-04-19'),(35,'2021-04-20','2021-05-03'),(36,'2021-05-04','2021-05-17'),(37,'2021-05-18','2021-05-31'),(38,'2021-06-01','2021-06-14'),(39,'2021-06-15','2021-06-28');
/*!40000 ALTER TABLE `PERIODO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PREDICCION`
--

DROP TABLE IF EXISTS `PREDICCION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PREDICCION` (
  `IDPREDICCION` int(11) NOT NULL AUTO_INCREMENT,
  `DUI` varchar(10) DEFAULT NULL,
  `IDPERIODO` int(11) DEFAULT NULL,
  `IDZONA` varchar(5) DEFAULT NULL,
  `IDGASOLINA` varchar(5) DEFAULT NULL,
  `PRECIO` float NOT NULL,
  `VARIACION` float NOT NULL,
  `ESTADO` varchar(12) NOT NULL,
  PRIMARY KEY (`IDPREDICCION`),
  KEY `FK_REFERENCE_3` (`IDPERIODO`),
  KEY `FK_REFERENCE_4` (`IDGASOLINA`),
  KEY `FK_REFERENCE_5` (`DUI`),
  KEY `FK_REFERENCE_6` (`IDZONA`),
  CONSTRAINT `FK_REFERENCE_3` FOREIGN KEY (`IDPERIODO`) REFERENCES `PERIODO` (`IDPERIODO`),
  CONSTRAINT `FK_REFERENCE_4` FOREIGN KEY (`IDGASOLINA`) REFERENCES `GASOLINA` (`IDGASOLINA`),
  CONSTRAINT `FK_REFERENCE_5` FOREIGN KEY (`DUI`) REFERENCES `USUARIO` (`DUI`),
  CONSTRAINT `FK_REFERENCE_6` FOREIGN KEY (`IDZONA`) REFERENCES `ZONA` (`IDZONA`)
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PREDICCION`
--

LOCK TABLES `PREDICCION` WRITE;
/*!40000 ALTER TABLE `PREDICCION` DISABLE KEYS */;
INSERT INTO `PREDICCION` VALUES (1,'10000001',1,'ZCEN','ES01',3.28,0.02,'Aplicado'),(2,'10000001',1,'ZCEN','RE02',3.07,0.03,'Aplicado'),(3,'10000001',1,'ZCEN','DI03',3.03,0.06,'Aplicado'),(4,'10000001',1,'ZOCC','ES01',3.29,0.02,'Aplicado'),(5,'10000001',1,'ZOCC','RE02',3.08,0.03,'Aplicado'),(6,'10000001',1,'ZOCC','DI03',3.04,0.06,'Aplicado'),(7,'10000001',1,'ZORI','ES01',3.32,0.02,'Aplicado'),(8,'10000001',1,'ZORI','RE02',3.11,0.02,'Aplicado'),(9,'10000001',1,'ZORI','DI03',3.07,0.06,'Aplicado'),(10,'10000001',2,'ZCEN','ES01',3.36,0.08,'Aplicado'),(11,'10000001',2,'ZCEN','RE02',3.13,0.06,'Aplicado'),(12,'10000001',2,'ZCEN','DI03',3.08,0.05,'Aplicado'),(13,'10000001',2,'ZOCC','ES01',3.37,0.08,'Aplicado'),(14,'10000001',2,'ZOCC','RE02',3.14,0.06,'Aplicado'),(15,'10000001',2,'ZOCC','DI03',3.09,0.05,'Aplicado'),(16,'10000001',2,'ZORI','ES01',3.4,0.08,'Aplicado'),(17,'10000001',2,'ZORI','RE02',3.17,0.06,'Aplicado'),(18,'10000001',2,'ZORI','DI03',3.12,0.05,'Aplicado'),(19,'10000001',3,'ZCEN','ES01',3.3,-0.06,'Aplicado'),(20,'10000001',3,'ZCEN','RE02',3.07,-0.06,'Aplicado'),(21,'10000001',3,'ZCEN','DI03',2.96,-0.12,'Aplicado'),(22,'10000001',3,'ZOCC','ES01',3.31,-0.06,'Aplicado'),(23,'10000001',3,'ZOCC','RE02',3.08,-0.06,'Aplicado'),(24,'10000001',3,'ZOCC','DI03',2.97,-0.12,'Aplicado'),(25,'10000001',3,'ZORI','ES01',3.35,-0.05,'Aplicado'),(26,'10000001',3,'ZORI','RE02',3.12,-0.05,'Aplicado'),(27,'10000001',3,'ZORI','DI03',3.01,-0.11,'Aplicado'),(28,'10000001',4,'ZCEN','ES01',3.18,-0.12,'Aplicado'),(29,'10000001',4,'ZCEN','RE02',2.96,-0.11,'Aplicado'),(30,'10000001',4,'ZCEN','DI03',2.77,-0.19,'Aplicado'),(31,'10000001',4,'ZOCC','ES01',3.18,-0.13,'Aplicado'),(32,'10000001',4,'ZOCC','RE02',2.97,-0.11,'Aplicado'),(33,'10000001',4,'ZOCC','DI03',2.78,-0.19,'Aplicado'),(34,'10000001',4,'ZORI','ES01',3.22,-0.13,'Aplicado'),(35,'10000001',4,'ZORI','RE02',3,-0.12,'Aplicado'),(36,'10000001',4,'ZORI','DI03',2.81,-0.2,'Aplicado'),(37,'10000001',5,'ZCEN','ES01',3.18,0,'Aplicado'),(38,'10000001',5,'ZCEN','RE02',2.95,-0.01,'Aplicado'),(39,'10000001',5,'ZCEN','DI03',2.69,-0.08,'Aplicado'),(40,'10000001',5,'ZOCC','ES01',3.19,0.01,'Aplicado'),(41,'10000001',5,'ZOCC','RE02',2.96,-0.01,'Aplicado'),(42,'10000001',5,'ZOCC','DI03',2.7,-0.08,'Aplicado'),(43,'10000001',5,'ZORI','ES01',3.22,0,'Aplicado'),(44,'10000001',5,'ZORI','RE02',2.99,-0.01,'Aplicado'),(45,'10000001',5,'ZORI','DI03',2.74,-0.07,'Aplicado'),(46,'10000001',6,'ZCEN','ES01',3.2,0.02,'Aplicado'),(47,'10000001',6,'ZCEN','RE02',2.98,0.03,'Aplicado'),(48,'10000001',6,'ZCEN','DI03',2.65,0.04,'Aplicado'),(49,'10000001',6,'ZOCC','ES01',3.21,0.02,'Aplicado'),(50,'10000001',6,'ZOCC','RE02',2.99,0.03,'Aplicado'),(51,'10000001',6,'ZOCC','DI03',2.66,0.04,'Aplicado'),(52,'10000001',6,'ZORI','ES01',3.25,0.03,'Aplicado'),(53,'10000001',6,'ZORI','RE02',3.02,0,'Aplicado'),(54,'10000001',6,'ZORI','DI03',2.71,0.03,'Aplicado'),(55,'10000001',7,'ZCEN','ES01',2.79,-0.41,'Aplicado'),(56,'10000001',7,'ZCEN','RE02',2.54,-0.44,'Aplicado'),(57,'10000001',7,'ZCEN','DI03',2.34,-0.31,'Aplicado'),(58,'10000001',7,'ZOCC','ES01',2.8,-0.41,'Aplicado'),(59,'10000001',7,'ZOCC','RE02',2.55,-0.44,'Aplicado'),(60,'10000001',7,'ZOCC','DI03',2.35,-0.31,'Aplicado'),(61,'10000001',7,'ZORI','ES01',2.83,-0.42,'Aplicado'),(62,'10000001',7,'ZORI','RE02',2.59,-0.43,'Aplicado'),(63,'10000001',7,'ZORI','DI03',2.4,-0.31,'Aplicado'),(64,'10000001',8,'ZCEN','ES01',2.2,-0.59,'Aplicado'),(65,'10000001',8,'ZCEN','RE02',1.99,-0.55,'Aplicado'),(66,'10000001',8,'ZCEN','DI03',2.07,-0.27,'Aplicado'),(67,'10000001',8,'ZOCC','ES01',2.21,-0.59,'Aplicado'),(68,'10000001',8,'ZOCC','RE02',1.99,-0.56,'Aplicado'),(69,'10000001',8,'ZOCC','DI03',2.08,-0.27,'Aplicado'),(70,'10000001',8,'ZORI','ES01',2.24,-0.59,'Aplicado'),(71,'10000001',8,'ZORI','RE02',2.03,-0.56,'Aplicado'),(72,'10000001',8,'ZORI','DI03',2.12,-0.28,'Aplicado'),(73,'10000001',9,'ZCEN','ES01',2.01,-0.19,'Aplicado'),(74,'10000001',9,'ZCEN','RE02',1.85,-0.14,'Aplicado'),(75,'10000001',9,'ZCEN','DI03',1.98,-0.09,'Aplicado'),(76,'10000001',9,'ZOCC','ES01',2.01,-0.2,'Aplicado'),(77,'10000001',9,'ZOCC','RE02',1.86,-0.15,'Aplicado'),(78,'10000001',9,'ZOCC','DI03',1.99,-0.09,'Aplicado'),(79,'10000001',9,'ZORI','ES01',2.05,-0.19,'Aplicado'),(80,'10000001',9,'ZORI','RE02',1.89,-0.14,'Aplicado'),(81,'10000001',9,'ZORI','DI03',2.04,-0.08,'Aplicado'),(82,'10000001',10,'ZCEN','ES01',2.06,0.05,'Aplicado'),(83,'10000001',10,'ZCEN','RE02',1.91,0.06,'Aplicado'),(84,'10000001',10,'ZCEN','DI03',1.8,-0.18,'Aplicado'),(85,'10000001',10,'ZOCC','ES01',2.07,0.06,'Aplicado'),(86,'10000001',10,'ZOCC','RE02',1.92,0.06,'Aplicado'),(87,'10000001',10,'ZOCC','DI03',1.81,-0.18,'Aplicado'),(88,'10000001',10,'ZORI','ES01',2.11,0.06,'Aplicado'),(89,'10000001',10,'ZORI','RE02',1.96,0.07,'Aplicado'),(90,'10000001',10,'ZORI','DI03',1.85,-0.19,'Aplicado'),(91,'10000001',11,'ZCEN','ES01',2.21,0.15,'Aplicado'),(92,'10000001',11,'ZCEN','RE02',2.04,0.13,'Aplicado'),(93,'10000001',11,'ZCEN','DI03',1.74,-0.06,'Aplicado'),(94,'10000001',11,'ZOCC','ES01',2.22,0.15,'Aplicado'),(95,'10000001',11,'ZOCC','RE02',2.04,0.12,'Aplicado'),(96,'10000001',11,'ZOCC','DI03',1.75,-0.06,'Aplicado'),(97,'10000001',11,'ZORI','ES01',2.25,0.14,'Aplicado'),(98,'10000001',11,'ZORI','RE02',2.08,0.12,'Aplicado'),(99,'10000001',11,'ZORI','DI03',1.79,-0.06,'Aplicado'),(100,'10000001',12,'ZCEN','ES01',2.42,0.21,'Aplicado'),(101,'10000001',12,'ZCEN','RE02',2.22,0.18,'Aplicado'),(102,'10000001',12,'ZCEN','DI03',1.88,0.14,'Aplicado'),(103,'10000001',12,'ZOCC','ES01',2.43,0.21,'Aplicado'),(104,'10000001',12,'ZOCC','RE02',2.23,0.19,'Aplicado'),(105,'10000001',12,'ZOCC','DI03',1.89,0.14,'Aplicado'),(106,'10000001',12,'ZORI','ES01',2.47,0.22,'Aplicado'),(107,'10000001',12,'ZORI','RE02',2.27,0.19,'Aplicado'),(108,'10000001',12,'ZORI','DI03',1.92,0.13,'Aplicado'),(109,'10000001',13,'ZCEN','ES01',2.57,0.15,'Aplicado'),(110,'10000001',13,'ZCEN','RE02',2.39,0.17,'Aplicado'),(111,'10000001',13,'ZCEN','DI03',2.03,0.15,'Aplicado'),(112,'10000001',13,'ZOCC','ES01',2.58,0.15,'Aplicado'),(113,'10000001',13,'ZOCC','RE02',2.39,0.16,'Aplicado'),(114,'10000001',13,'ZOCC','DI03',2.04,0.15,'Aplicado'),(115,'10000001',13,'ZORI','ES01',2.62,0.15,'Aplicado'),(116,'10000001',13,'ZORI','RE02',2.43,0.16,'Aplicado'),(117,'10000001',13,'ZORI','DI03',2.07,0.15,'Aplicado'),(118,'10000001',14,'ZCEN','ES01',2.67,0.1,'Aplicado'),(119,'10000001',14,'ZCEN','RE02',2.51,0.12,'Aplicado'),(120,'10000001',14,'ZCEN','DI03',2.15,0.12,'Aplicado'),(121,'10000001',14,'ZOCC','ES01',2.68,0.1,'Aplicado'),(122,'10000001',14,'ZOCC','RE02',2.51,0.12,'Aplicado'),(123,'10000001',14,'ZOCC','DI03',2.16,0.12,'Aplicado'),(124,'10000001',14,'ZORI','ES01',2.71,0.09,'Aplicado'),(125,'10000001',14,'ZORI','RE02',2.55,0.12,'Aplicado'),(126,'10000001',14,'ZORI','DI03',2.19,0.12,'Aplicado'),(127,'10000001',15,'ZCEN','ES01',2.73,0.06,'Aplicado'),(128,'10000001',15,'ZCEN','RE02',2.57,0.06,'Aplicado'),(129,'10000001',15,'ZCEN','DI03',2.22,0.07,'Aplicado'),(130,'10000001',15,'ZOCC','ES01',2.74,0.06,'Aplicado'),(131,'10000001',15,'ZOCC','RE02',2.58,0.07,'Aplicado'),(132,'10000001',15,'ZOCC','DI03',2.23,0.07,'Aplicado'),(133,'10000001',15,'ZORI','ES01',2.77,0.06,'Aplicado'),(134,'10000001',15,'ZORI','RE02',2.61,0.06,'Aplicado'),(135,'10000001',15,'ZORI','DI03',2.27,0.08,'Aplicado'),(136,'10000001',16,'ZCEN','ES01',2.65,-0.08,'Aplicado'),(137,'10000001',16,'ZCEN','RE02',2.48,-0.09,'Aplicado'),(138,'10000001',16,'ZCEN','DI03',2.16,-0.06,'Aplicado'),(139,'10000001',16,'ZOCC','ES01',2.66,-0.08,'Aplicado'),(140,'10000001',16,'ZOCC','RE02',2.49,-0.09,'Aplicado'),(141,'10000001',16,'ZOCC','DI03',2.17,-0.06,'Aplicado'),(142,'10000001',16,'ZORI','ES01',2.69,-0.08,'Aplicado'),(143,'10000001',16,'ZORI','RE02',2.52,-0.09,'Aplicado'),(144,'10000001',16,'ZORI','DI03',2.2,-0.07,'Aplicado'),(145,'10000001',17,'ZCEN','ES01',2.61,-0.04,'Aplicado'),(146,'10000001',17,'ZCEN','RE02',2.45,-0.03,'Aplicado'),(147,'10000001',17,'ZCEN','DI03',2.16,0,'Aplicado'),(148,'10000001',17,'ZOCC','ES01',2.62,-0.04,'Aplicado'),(149,'10000001',17,'ZOCC','RE02',2.46,-0.03,'Aplicado'),(150,'10000001',17,'ZOCC','DI03',2.17,0,'Aplicado'),(151,'10000001',17,'ZORI','ES01',2.65,-0.04,'Aplicado'),(152,'10000001',17,'ZORI','RE02',2.5,-0.02,'Aplicado'),(153,'10000001',17,'ZORI','DI03',2.21,0.01,'Aplicado'),(154,'10000001',18,'ZCEN','ES01',2.61,0,'Aplicado'),(155,'10000001',18,'ZCEN','RE02',2.48,0.03,'Aplicado'),(156,'10000001',18,'ZCEN','DI03',2.16,0,'Aplicado'),(157,'10000001',18,'ZOCC','ES01',2.62,0,'Aplicado'),(158,'10000001',18,'ZOCC','RE02',2.48,0.02,'Aplicado'),(159,'10000001',18,'ZOCC','DI03',2.17,0,'Aplicado'),(160,'10000001',18,'ZORI','ES01',2.65,0,'Aplicado'),(161,'10000001',18,'ZORI','RE02',2.52,0.02,'Aplicado'),(162,'10000001',18,'ZORI','DI03',2.2,-0.01,'Aplicado'),(163,'10000001',19,'ZCEN','ES01',2.69,0.08,'Aplicado'),(164,'10000001',19,'ZCEN','RE02',2.54,0.06,'Aplicado'),(165,'10000001',19,'ZCEN','DI03',2.16,0,'Aplicado'),(166,'10000001',19,'ZOCC','ES01',2.7,0.08,'Aplicado'),(167,'10000001',19,'ZOCC','RE02',2.55,0.07,'Aplicado'),(168,'10000001',19,'ZOCC','DI03',2.17,0,'Aplicado'),(169,'10000001',19,'ZORI','ES01',2.73,0.08,'Aplicado'),(170,'10000001',19,'ZORI','RE02',2.58,0.06,'Aplicado'),(171,'10000001',19,'ZORI','DI03',2.2,0,'Aplicado'),(172,'10000001',20,'ZCEN','ES01',2.67,-0.02,'Aplicado'),(173,'10000001',20,'ZCEN','RE02',2.51,-0.03,'Aplicado'),(174,'10000001',20,'ZCEN','DI03',2.09,-0.07,'Aplicado'),(175,'10000001',20,'ZOCC','ES01',2.68,-0.02,'Aplicado'),(176,'10000001',20,'ZOCC','RE02',2.52,-0.3,'Aplicado'),(177,'10000001',20,'ZOCC','DI03',2.1,-0.07,'Aplicado'),(178,'10000001',20,'ZORI','ES01',2.71,-0.02,'Aplicado'),(179,'10000001',20,'ZORI','RE02',2.56,-0.02,'Aplicado'),(180,'10000001',20,'ZORI','DI03',2.14,-0.06,'Aplicado'),(181,'10000001',21,'ZCEN','ES01',2.64,-0.03,'Aplicado'),(182,'10000001',21,'ZCEN','RE02',2.47,-0.04,'Aplicado'),(183,'10000001',21,'ZCEN','DI03',2.03,-0.06,'Aplicado'),(184,'10000001',21,'ZOCC','ES01',2.65,-0.03,'Aplicado'),(185,'10000001',21,'ZOCC','RE02',2.48,-0.04,'Aplicado'),(186,'10000001',21,'ZOCC','DI03',2.04,-0.06,'Aplicado'),(187,'10000001',21,'ZORI','ES01',2.68,-0.03,'Aplicado'),(188,'10000001',21,'ZORI','RE02',2.51,-0.05,'Aplicado'),(189,'10000001',21,'ZORI','DI03',2.07,-0.07,'Aplicado'),(190,'10000001',22,'ZCEN','ES01',2.66,0.02,'Aplicado'),(191,'10000001',22,'ZCEN','RE02',2.5,0.03,'Aplicado'),(192,'10000001',22,'ZCEN','DI03',2.06,0.03,'Aplicado'),(193,'10000001',22,'ZOCC','ES01',2.67,0.02,'Aplicado'),(194,'10000001',22,'ZOCC','RE02',2.51,0.03,'Aplicado'),(195,'10000001',22,'ZOCC','DI03',2.07,0.03,'Aplicado'),(196,'10000001',22,'ZORI','ES01',2.71,0.03,'Aplicado'),(197,'10000001',22,'ZORI','RE02',2.54,0.03,'Aplicado'),(198,'10000001',22,'ZORI','DI03',2.11,0.04,'Aplicado'),(199,'10000001',23,'ZCEN','ES01',2.59,-0.07,'Aplicado'),(200,'10000001',23,'ZCEN','RE02',2.44,-0.06,'Aplicado'),(201,'10000001',23,'ZCEN','DI03',2.06,0,'Aplicado'),(202,'10000001',23,'ZOCC','ES01',2.6,-0.07,'Aplicado'),(203,'10000001',23,'ZOCC','RE02',2.45,-0.06,'Aplicado'),(204,'10000001',23,'ZOCC','DI03',2.07,0,'Aplicado'),(205,'10000001',23,'ZORI','ES01',2.63,-0.08,'Aplicado'),(206,'10000001',23,'ZORI','RE02',2.48,-0.06,'Aplicado'),(207,'10000001',23,'ZORI','DI03',2.11,0,'Aplicado'),(208,'10000001',24,'ZCEN','ES01',2.52,-0.07,'Aplicado'),(209,'10000001',24,'ZCEN','RE02',2.38,-0.06,'Aplicado'),(210,'10000001',24,'ZCEN','DI03',2.08,0.02,'Aplicado'),(211,'10000001',24,'ZOCC','ES01',2.53,-0.07,'Aplicado'),(212,'10000001',24,'ZOCC','RE02',2.39,-0.06,'Aplicado'),(213,'10000001',24,'ZOCC','DI03',2.09,0.02,'Aplicado'),(214,'10000001',24,'ZORI','ES01',2.57,-0.06,'Aplicado'),(215,'10000001',24,'ZORI','RE02',2.43,-0.05,'Aplicado'),(216,'10000001',24,'ZORI','DI03',2.12,0.01,'Aplicado'),(217,'10000001',25,'ZCEN','ES01',2.56,0.04,'Aplicado'),(218,'10000001',25,'ZCEN','RE02',2.42,0.04,'Aplicado'),(219,'10000001',25,'ZCEN','DI03',2.17,0.09,'Aplicado'),(220,'10000001',25,'ZOCC','ES01',2.57,0.04,'Aplicado'),(221,'10000001',25,'ZOCC','RE02',2.43,0.04,'Aplicado'),(222,'10000001',25,'ZOCC','DI03',2.18,0.09,'Aplicado'),(223,'10000001',25,'ZORI','ES01',2.6,0.03,'Aplicado'),(224,'10000001',25,'ZORI','RE02',2.47,0.04,'Aplicado'),(225,'10000001',25,'ZORI','DI03',2.21,0.09,'Aplicado'),(226,'10000001',26,'ZCEN','ES01',2.66,0.1,'Aplicado'),(227,'10000001',26,'ZCEN','RE02',2.51,0.09,'Aplicado'),(228,'10000001',26,'ZCEN','DI03',2.28,0.11,'Aplicado'),(229,'10000001',26,'ZOCC','ES01',2.67,0.1,'Aplicado'),(230,'10000001',26,'ZOCC','RE02',2.52,0.09,'Aplicado'),(231,'10000001',26,'ZOCC','DI03',2.29,0.11,'Aplicado'),(232,'10000001',26,'ZORI','ES01',2.71,0.11,'Aplicado'),(233,'10000001',26,'ZORI','RE02',2.55,0.08,'Aplicado'),(234,'10000001',26,'ZORI','DI03',2.32,0.11,'Aplicado'),(235,'10000001',27,'ZCEN','ES01',2.86,0.1,'Aplicado'),(236,'10000001',27,'ZCEN','RE02',2.7,0.09,'Aplicado'),(237,'10000001',27,'ZCEN','DI03',2.47,0.09,'Aplicado'),(238,'10000001',27,'ZOCC','ES01',2.87,0.1,'Aplicado'),(239,'10000001',27,'ZOCC','RE02',2.71,0.09,'Aplicado'),(240,'10000001',27,'ZOCC','DI03',2.48,0.09,'Aplicado'),(241,'10000001',27,'ZORI','ES01',2.91,0.1,'Aplicado'),(242,'10000001',27,'ZORI','RE02',2.74,0.09,'Aplicado'),(243,'10000001',27,'ZORI','DI03',2.51,0.09,'Aplicado'),(244,'10000001',28,'ZCEN','ES01',2.95,0.09,'Aplicado'),(245,'10000001',28,'ZCEN','RE02',2.78,0.08,'Aplicado'),(246,'10000001',28,'ZCEN','DI03',2.52,0.05,'Aplicado'),(247,'10000001',28,'ZOCC','ES01',2.96,0.09,'Aplicado'),(248,'10000001',28,'ZOCC','RE02',2.79,0.08,'Aplicado'),(249,'10000001',28,'ZOCC','DI03',2.52,0.04,'Aplicado'),(250,'10000001',28,'ZORI','ES01',2.99,0.08,'Aplicado'),(251,'10000001',28,'ZORI','RE02',2.82,0.08,'Aplicado'),(252,'10000001',28,'ZORI','DI03',2.56,0.05,'Aplicado'),(253,'10000001',29,'ZCEN','ES01',3.04,0.09,'Aplicado'),(254,'10000001',29,'ZCEN','RE02',2.89,0.11,'Aplicado'),(255,'10000001',29,'ZCEN','DI03',2.58,0.06,'Aplicado'),(256,'10000001',29,'ZOCC','ES01',3.05,0.09,'Aplicado'),(257,'10000001',29,'ZOCC','RE02',2.89,0.1,'Aplicado'),(258,'10000001',29,'ZOCC','DI03',2.59,0.07,'Aplicado'),(259,'10000001',29,'ZORI','ES01',3.08,0.09,'Aplicado'),(260,'10000001',29,'ZORI','RE02',2.93,0.11,'Aplicado'),(261,'10000001',29,'ZORI','DI03',2.62,0.06,'Aplicado'),(262,'10000001',30,'ZCEN','ES01',3.13,0.09,'Aplicado'),(263,'10000001',30,'ZCEN','RE02',2.98,0.08,'Aplicado'),(264,'10000001',30,'ZCEN','DI03',2.65,0.08,'Aplicado'),(265,'10000001',30,'ZOCC','ES01',3.14,0.09,'Aplicado'),(266,'10000001',30,'ZOCC','RE02',2.99,0.1,'Aplicado'),(267,'10000001',30,'ZOCC','DI03',2.66,0.07,'Aplicado'),(268,'10000001',30,'ZORI','ES01',3.17,0.09,'Aplicado'),(269,'10000001',30,'ZORI','RE02',3.02,0.09,'Aplicado'),(270,'10000001',30,'ZORI','DI03',2.69,0.07,'Aplicado'),(271,'10000001',31,'ZCEN','ES01',3.24,0.11,'Aplicado'),(272,'10000001',31,'ZCEN','RE02',3.08,0.1,'Aplicado'),(273,'10000001',31,'ZCEN','DI03',2.76,0.11,'Aplicado'),(274,'10000001',31,'ZOCC','ES01',3.24,0.1,'Aplicado'),(275,'10000001',31,'ZOCC','RE02',3.09,0.1,'Aplicado'),(276,'10000001',31,'ZOCC','DI03',2.77,0.11,'Aplicado'),(277,'10000001',31,'ZORI','ES01',3.28,0.11,'Aplicado'),(278,'10000001',31,'ZORI','RE02',3.12,0.1,'Aplicado'),(279,'10000001',31,'ZORI','DI03',2.8,0.11,'Aplicado'),(280,'10000001',32,'ZCEN','ES01',3.43,0.19,'Aplicado'),(281,'10000001',32,'ZCEN','RE02',3.26,0.18,'Aplicado'),(282,'10000001',32,'ZCEN','DI03',2.9,0.14,'Aplicado'),(283,'10000001',32,'ZOCC','ES01',3.44,0.2,'Aplicado'),(284,'10000001',32,'ZOCC','RE02',3.27,0.18,'Aplicado'),(285,'10000001',32,'ZOCC','DI03',2.91,0.14,'Aplicado'),(286,'10000001',32,'ZORI','ES01',3.48,0.2,'Aplicado'),(287,'10000001',32,'ZORI','RE02',3.31,0.19,'Aplicado'),(288,'10000001',32,'ZORI','DI03',2.95,0.15,'Aplicado'),(289,'10000001',33,'ZCEN','ES01',3.6,0.17,'Aplicado'),(290,'10000001',33,'ZCEN','RE02',3.43,0.17,'Aplicado'),(291,'10000001',33,'ZCEN','DI03',2.98,0.08,'Aplicado'),(292,'10000001',33,'ZOCC','ES01',3.61,0.17,'Aplicado'),(293,'10000001',33,'ZOCC','RE02',3.44,0.17,'Aplicado'),(294,'10000001',33,'ZOCC','DI03',2.98,0.07,'Aplicado'),(295,'10000001',33,'ZORI','ES01',3.64,0.16,'Aplicado'),(296,'10000001',33,'ZORI','RE02',3.47,0.16,'Aplicado'),(297,'10000001',33,'ZORI','DI03',3.02,0.07,'Aplicado'),(298,'10000001',34,'ZCEN','ES01',3.62,0.02,'Aplicado'),(299,'10000001',34,'ZCEN','RE02',3.45,0.02,'Aplicado'),(300,'10000001',34,'ZCEN','DI03',2.93,-0.05,'Aplicado'),(301,'10000001',34,'ZOCC','ES01',3.63,0.02,'Aplicado'),(302,'10000001',34,'ZOCC','RE02',3.45,0.02,'Aplicado'),(303,'10000001',34,'ZOCC','DI03',2.93,-0.05,'Aplicado'),(304,'10000001',34,'ZORI','ES01',3.66,0.02,'Aplicado'),(305,'10000001',34,'ZORI','RE02',3.49,0.02,'Aplicado'),(306,'10000001',34,'ZORI','DI03',2.97,-0.05,'Aplicado'),(307,'10000001',35,'ZCEN','ES01',3.59,-0.03,'Aplicado'),(308,'10000001',35,'ZCEN','RE02',3.42,-0.03,'Aplicado'),(309,'10000001',35,'ZCEN','DI03',2.87,-0.06,'Aplicado'),(310,'10000001',35,'ZOCC','ES01',3.6,-0.03,'Aplicado'),(311,'10000001',35,'ZOCC','RE02',3.42,-0.04,'Aplicado'),(312,'10000001',35,'ZOCC','DI03',2.88,-0.05,'Aplicado'),(313,'10000001',35,'ZORI','ES01',3.64,-0.02,'Aplicado'),(314,'10000001',35,'ZORI','RE02',3.46,-0.03,'Aplicado'),(315,'10000001',35,'ZORI','DI03',2.91,-0.06,'Aplicado'),(316,'10000001',36,'ZCEN','ES01',3.64,0.05,'Aplicado'),(317,'10000001',36,'ZCEN','RE02',3.45,0.03,'Aplicado'),(318,'10000001',36,'ZCEN','DI03',2.92,0.05,'Aplicado'),(319,'10000001',36,'ZOCC','ES01',3.65,0.05,'Aplicado'),(320,'10000001',36,'ZOCC','RE02',3.46,0.04,'Aplicado'),(321,'10000001',36,'ZOCC','DI03',2.93,0.05,'Aplicado'),(322,'10000001',36,'ZORI','ES01',3.68,0.04,'Aplicado'),(323,'10000001',36,'ZORI','RE02',3.49,0.03,'Aplicado'),(324,'10000001',36,'ZORI','DI03',2.97,0.06,'Aplicado'),(325,'10000001',37,'ZCEN','ES01',3.7,0.06,'Aplicado'),(326,'10000001',37,'ZCEN','RE02',3.51,0.06,'Aplicado'),(327,'10000001',37,'ZCEN','DI03',3.03,0.11,'Aplicado'),(328,'10000001',37,'ZOCC','ES01',3.71,0.06,'Aplicado'),(329,'10000001',37,'ZOCC','RE02',3.52,0.06,'Aplicado'),(330,'10000001',37,'ZOCC','DI03',3.04,0.11,'Aplicado'),(331,'10000001',37,'ZORI','ES01',3.75,0.07,'Aplicado'),(332,'10000001',37,'ZORI','RE02',3.55,0.06,'Aplicado'),(333,'10000001',37,'ZORI','DI03',3.07,0.1,'Aplicado'),(334,'123456789',37,'ZORI','ES01',7.04156,3.29156,'Calculado'),(335,'123456789',37,'ZORI','RE02',7.34289,3.79289,'Calculado'),(336,'10000001',38,'ZCEN','ES01',3.76,0.06,'Aplicado'),(337,'10000001',38,'ZCEN','RE02',3.55,0.04,'Aplicado'),(338,'10000001',38,'ZCEN','DI03',3.1,0.07,'Aplicado'),(339,'10000001',38,'ZOCC','ES01',3.77,0.06,'Aplicado'),(340,'10000001',38,'ZOCC','RE02',3.56,0.04,'Aplicado'),(341,'10000001',38,'ZOCC','DI03',3.11,0.07,'Aplicado'),(342,'10000001',38,'ZORI','ES01',3.8,0.05,'Aplicado'),(343,'10000001',38,'ZORI','RE02',3.59,0.04,'Aplicado'),(344,'10000001',38,'ZORI','DI03',3.14,0.07,'Aplicado'),(345,'10000001',39,'ZCEN','ES01',3.78,0.02,'Aplicado'),(346,'10000001',39,'ZCEN','RE02',3.56,0.01,'Aplicado'),(347,'10000001',39,'ZCEN','DI03',3.15,0.05,'Aplicado'),(348,'10000001',39,'ZOCC','ES01',3.79,0.02,'Aplicado'),(349,'10000001',39,'ZOCC','RE02',3.57,0.01,'Aplicado'),(350,'10000001',39,'ZOCC','DI03',3.16,0.05,'Aplicado'),(351,'10000001',39,'ZORI','ES01',3.82,0.02,'Aplicado'),(352,'10000001',39,'ZORI','RE02',3.6,0.01,'Aplicado'),(353,'10000001',39,'ZORI','DI03',3.19,0.05,'Aplicado');
/*!40000 ALTER TABLE `PREDICCION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO`
--

DROP TABLE IF EXISTS `USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USUARIO` (
  `DUI` varchar(10) NOT NULL,
  `NOMBRES` varchar(40) NOT NULL,
  `APELLIDOS` varchar(40) NOT NULL,
  `DEPARTAMENTO` varchar(20) NOT NULL,
  `MUNICIPIO` varchar(20) NOT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  `CORREO` varchar(40) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  PRIMARY KEY (`DUI`),
  UNIQUE KEY `CORREO` (`CORREO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO`
--

LOCK TABLES `USUARIO` WRITE;
/*!40000 ALTER TABLE `USUARIO` DISABLE KEYS */;
INSERT INTO `USUARIO` VALUES ('10000001','Super','Usuario','San Salvador','San Salvador ','2000-01-01','',''),('123456789','Benjamin','Molina','San Salvado','San Salvador','2000-05-15','mr18136@ues.edu.sv','root1234');
/*!40000 ALTER TABLE `USUARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ZONA`
--

DROP TABLE IF EXISTS `ZONA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ZONA` (
  `IDZONA` varchar(5) NOT NULL,
  `NOMBREZONA` varchar(15) NOT NULL,
  PRIMARY KEY (`IDZONA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ZONA`
--

LOCK TABLES `ZONA` WRITE;
/*!40000 ALTER TABLE `ZONA` DISABLE KEYS */;
INSERT INTO `ZONA` VALUES ('ZCEN','Central'),('ZOCC','Occidental'),('ZORI','Oriental');
/*!40000 ALTER TABLE `ZONA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add usuario',7,'add_usuario'),(26,'Can change usuario',7,'change_usuario'),(27,'Can delete usuario',7,'delete_usuario'),(28,'Can view usuario',7,'view_usuario'),(29,'Can add gasolina',8,'add_gasolina'),(30,'Can change gasolina',8,'change_gasolina'),(31,'Can delete gasolina',8,'delete_gasolina'),(32,'Can view gasolina',8,'view_gasolina'),(33,'Can add periodo',9,'add_periodo'),(34,'Can change periodo',9,'change_periodo'),(35,'Can delete periodo',9,'delete_periodo'),(36,'Can view periodo',9,'view_periodo'),(37,'Can add zona',10,'add_zona'),(38,'Can change zona',10,'change_zona'),(39,'Can delete zona',10,'delete_zona'),(40,'Can view zona',10,'view_zona'),(41,'Can add prediccion',11,'add_prediccion'),(42,'Can change prediccion',11,'change_prediccion'),(43,'Can delete prediccion',11,'delete_prediccion'),(44,'Can view prediccion',11,'view_prediccion');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$5rUrdPiWxtCT$15LAOxNfIYM1uLNR82Wt/DiX5f0+KhEEYmeCWq2LRFs=','2021-06-26 21:59:45.691055',1,'Administrador','','','mr18136@ues.edu.sv',1,1,'2021-06-22 00:09:01.599302');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-06-26 22:05:24.090705','38','Periodo object (38)',1,'[{\"added\": {}}]',9,1),(2,'2021-06-26 22:06:32.898323','336','Prediccion object (336)',1,'[{\"added\": {}}]',11,1),(3,'2021-06-26 22:07:25.149084','337','Prediccion object (337)',1,'[{\"added\": {}}]',11,1),(4,'2021-06-26 22:07:58.909498','338','Prediccion object (338)',1,'[{\"added\": {}}]',11,1),(5,'2021-06-26 22:09:01.310963','339','Prediccion object (339)',1,'[{\"added\": {}}]',11,1),(6,'2021-06-26 22:09:25.961103','340','Prediccion object (340)',1,'[{\"added\": {}}]',11,1),(7,'2021-06-26 22:09:52.362404','341','Prediccion object (341)',1,'[{\"added\": {}}]',11,1),(8,'2021-06-26 22:10:40.372167','342','Prediccion object (342)',1,'[{\"added\": {}}]',11,1),(9,'2021-06-26 22:11:06.018830','343','Prediccion object (343)',1,'[{\"added\": {}}]',11,1),(10,'2021-06-26 22:11:35.638244','344','Prediccion object (344)',1,'[{\"added\": {}}]',11,1),(11,'2021-06-26 22:22:26.968210','39','Periodo object (39)',1,'[{\"added\": {}}]',9,1),(12,'2021-06-26 22:23:38.296030','345','Prediccion object (345)',1,'[{\"added\": {}}]',11,1),(13,'2021-06-26 22:24:16.890410','346','Prediccion object (346)',1,'[{\"added\": {}}]',11,1),(14,'2021-06-26 22:25:00.390843','347','Prediccion object (347)',1,'[{\"added\": {}}]',11,1),(15,'2021-06-26 22:25:41.387913','348','Prediccion object (348)',1,'[{\"added\": {}}]',11,1),(16,'2021-06-26 22:26:45.319985','349','Prediccion object (349)',1,'[{\"added\": {}}]',11,1),(17,'2021-06-26 22:27:26.168405','350','Prediccion object (350)',1,'[{\"added\": {}}]',11,1),(18,'2021-06-26 22:28:20.193249','351','Prediccion object (351)',1,'[{\"added\": {}}]',11,1),(19,'2021-06-26 22:28:53.014791','352','Prediccion object (352)',1,'[{\"added\": {}}]',11,1),(20,'2021-06-26 22:30:02.435628','353','Prediccion object (353)',1,'[{\"added\": {}}]',11,1),(21,'2021-06-26 22:30:38.587301','352','Prediccion object (352)',2,'[{\"changed\": {\"fields\": [\"Idgasolina\"]}}]',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'GestionarTablasSecundarias','gasolina'),(9,'GestionarTablasSecundarias','periodo'),(10,'GestionarTablasSecundarias','zona'),(7,'GestionUsuario','usuario'),(11,'Prediccion','prediccion'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'GestionUsuario','0001_initial','2021-06-22 00:07:58.138124'),(2,'GestionUsuario','0002_auto_20210621_2329','2021-06-22 00:07:58.201214'),(3,'GestionUsuario','0003_auto_20210621_2358','2021-06-22 00:07:58.254780'),(4,'GestionarTablasSecundarias','0001_initial','2021-06-22 00:07:58.366302'),(5,'GestionarTablasSecundarias','0002_auto_20210621_2329','2021-06-22 00:07:58.478488'),(6,'Prediccion','0001_initial','2021-06-22 00:07:58.531462'),(7,'Prediccion','0002_auto_20210621_2329','2021-06-22 00:07:58.575321'),(8,'contenttypes','0001_initial','2021-06-22 00:07:59.373565'),(9,'auth','0001_initial','2021-06-22 00:08:02.445150'),(10,'admin','0001_initial','2021-06-22 00:08:11.947695'),(11,'admin','0002_logentry_remove_auto_add','2021-06-22 00:08:14.029144'),(12,'admin','0003_logentry_add_action_flag_choices','2021-06-22 00:08:14.084148'),(13,'contenttypes','0002_remove_content_type_name','2021-06-22 00:08:15.572781'),(14,'auth','0002_alter_permission_name_max_length','2021-06-22 00:08:15.807235'),(15,'auth','0003_alter_user_email_max_length','2021-06-22 00:08:15.952298'),(16,'auth','0004_alter_user_username_opts','2021-06-22 00:08:16.014533'),(17,'auth','0005_alter_user_last_login_null','2021-06-22 00:08:16.752678'),(18,'auth','0006_require_contenttypes_0002','2021-06-22 00:08:16.828668'),(19,'auth','0007_alter_validators_add_error_messages','2021-06-22 00:08:16.881688'),(20,'auth','0008_alter_user_username_max_length','2021-06-22 00:08:17.030642'),(21,'auth','0009_alter_user_last_name_max_length','2021-06-22 00:08:17.175386'),(22,'auth','0010_alter_group_name_max_length','2021-06-22 00:08:17.342080'),(23,'auth','0011_update_proxy_permissions','2021-06-22 00:08:17.407312'),(24,'auth','0012_alter_user_first_name_max_length','2021-06-22 00:08:17.564549'),(25,'sessions','0001_initial','2021-06-22 00:08:18.071371'),(26,'GestionUsuario','0004_auto_20210623_0036','2021-06-26 03:26:25.773548'),(27,'GestionarTablasSecundarias','0002_auto_20210621_1731','2021-06-26 03:26:25.852633'),(28,'GestionarTablasSecundarias','0003_merge_20210622_2103','2021-06-26 03:26:25.869308'),(29,'Prediccion','0002_auto_20210621_1731','2021-06-26 03:26:25.887590'),(30,'Prediccion','0003_merge_20210622_2103','2021-06-26 03:26:25.902837');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('btc5gerdjvkysnpthve2h1g2knehq12g','eyJkdWkiOiIxMjM0NTY3ODkifQ:1lwz0g:Y2iRPm2Q0bA5YyThNHsXwK778SYRV_oF3jjvJ0svygk','2021-07-10 03:29:34.621878'),('i35yvfdzzc7harcui9c0os05oe472njm','.eJxVjEsOAiEQRO_C2pAehBZcuvcMpJuPjBpIhpmV8e5KMgtdVr1X9RKetrX4rafFz1GcxSQOvx1TeKQ6QLxTvTUZWl2XmeVQ5E67vLaYnpfd_Tso1Mt3fWQGZGsoOBcyWkbntLFgIJ8U4UQEGVFDVJyV1QjBqBESqpwygHh_ANjyN5c:1lvVER:mNF9YqWqECfGfY-qZPcB18xQhG24AOD3kOz9MDbX1eA','2021-07-06 01:29:39.040753');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-26 16:33:50