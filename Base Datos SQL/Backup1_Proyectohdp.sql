CREATE DATABASE  IF NOT EXISTS `ProyectoHDP` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ProyectoHDP`;
-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: ProyectoHDP
-- ------------------------------------------------------
-- Server version	5.7.34-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PERIODO` (
  `IDPERIODO` int(11) NOT NULL AUTO_INCREMENT,
  `FECHAINICIO` date NOT NULL,
  `FECHAFIN` date NOT NULL,
  PRIMARY KEY (`IDPERIODO`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERIODO`
--

LOCK TABLES `PERIODO` WRITE;
/*!40000 ALTER TABLE `PERIODO` DISABLE KEYS */;
INSERT INTO `PERIODO` VALUES (1,'2019-12-31','2020-01-13'),(2,'2020-01-14','2020-01-27'),(3,'2020-01-28','2020-02-10'),(4,'2020-02-11','2020-02-24'),(5,'2020-02-25','2020-03-09'),(6,'2020-03-10','2020-03-23'),(7,'2020-03-24','2020-04-06'),(8,'2020-04-07','2020-04-20'),(9,'2020-04-21','2020-05-04'),(10,'2020-05-05','2020-05-18'),(11,'2020-05-19','2020-06-01'),(12,'2020-06-02','2020-06-15'),(13,'2020-06-16','2020-06-29'),(14,'2020-06-30','2020-07-13'),(15,'2020-07-14','2020-07-27'),(16,'2020-07-28','2020-08-10'),(17,'2020-08-11','2020-08-24'),(18,'2020-08-25','2020-09-07'),(19,'2020-09-08','2020-09-21'),(20,'2020-09-22','2020-10-05'),(21,'2020-10-06','2020-10-19'),(22,'2020-10-20','2020-11-02'),(23,'2020-11-03','2020-11-16'),(24,'2020-11-17','2020-11-30'),(25,'2020-12-01','2020-12-14'),(26,'2020-12-15','2020-12-28'),(27,'2020-12-29','2021-01-11'),(28,'2021-01-12','2021-01-25'),(29,'2021-01-26','2021-02-08'),(30,'2021-02-09','2021-02-22'),(31,'2021-02-23','2021-03-08'),(32,'2021-03-09','2021-03-22'),(33,'2021-03-23','2021-04-05'),(34,'2021-04-06','2021-04-19'),(35,'2021-04-20','2021-05-03'),(36,'2021-05-04','2021-05-17'),(37,'2021-05-18','2021-05-31');
/*!40000 ALTER TABLE `PERIODO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PREDICCION`
--

DROP TABLE IF EXISTS `PREDICCION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PREDICCION`
--

LOCK TABLES `PREDICCION` WRITE;
/*!40000 ALTER TABLE `PREDICCION` DISABLE KEYS */;
INSERT INTO `PREDICCION` VALUES (1,'10000001',1,'ZCEN','ES01',3.28,0.02,'Aplicado'),(2,'10000001',1,'ZCEN','RE02',3.07,0.03,'Aplicado'),(3,'10000001',1,'ZCEN','DI03',3.03,0.06,'Aplicado'),(4,'10000001',1,'ZOCC','ES01',3.29,0.02,'Aplicado'),(5,'10000001',1,'ZOCC','RE02',3.08,0.03,'Aplicado'),(6,'10000001',1,'ZOCC','DI03',3.04,0.06,'Aplicado'),(7,'10000001',1,'ZORI','ES01',3.32,0.02,'Aplicado'),(8,'10000001',1,'ZORI','RE02',3.11,0.02,'Aplicado'),(9,'10000001',1,'ZORI','DI03',3.07,0.06,'Aplicado'),(10,'10000001',2,'ZCEN','ES01',3.36,0.08,'Aplicado'),(11,'10000001',2,'ZCEN','RE02',3.13,0.06,'Aplicado'),(12,'10000001',2,'ZCEN','DI03',3.08,0.05,'Aplicado'),(13,'10000001',2,'ZOCC','ES01',3.37,0.08,'Aplicado'),(14,'10000001',2,'ZOCC','RE02',3.14,0.06,'Aplicado'),(15,'10000001',2,'ZOCC','DI03',3.09,0.05,'Aplicado'),(16,'10000001',2,'ZORI','ES01',3.4,0.08,'Aplicado'),(17,'10000001',2,'ZORI','RE02',3.17,0.06,'Aplicado'),(18,'10000001',2,'ZORI','DI03',3.12,0.05,'Aplicado'),(19,'10000001',3,'ZCEN','ES01',3.3,-0.06,'Aplicado'),(20,'10000001',3,'ZCEN','RE02',3.07,-0.06,'Aplicado'),(21,'10000001',3,'ZCEN','DI03',2.96,-0.12,'Aplicado'),(22,'10000001',3,'ZOCC','ES01',3.31,-0.06,'Aplicado'),(23,'10000001',3,'ZOCC','RE02',3.08,-0.06,'Aplicado'),(24,'10000001',3,'ZOCC','DI03',2.97,-0.12,'Aplicado'),(25,'10000001',3,'ZORI','ES01',3.35,-0.05,'Aplicado'),(26,'10000001',3,'ZORI','RE02',3.12,-0.05,'Aplicado'),(27,'10000001',3,'ZORI','DI03',3.01,-0.11,'Aplicado'),(28,'10000001',4,'ZCEN','ES01',3.18,-0.12,'Aplicado'),(29,'10000001',4,'ZCEN','RE02',2.96,-0.11,'Aplicado'),(30,'10000001',4,'ZCEN','DI03',2.77,-0.19,'Aplicado'),(31,'10000001',4,'ZOCC','ES01',3.18,-0.13,'Aplicado'),(32,'10000001',4,'ZOCC','RE02',2.97,-0.11,'Aplicado'),(33,'10000001',4,'ZOCC','DI03',2.78,-0.19,'Aplicado'),(34,'10000001',4,'ZORI','ES01',3.22,-0.13,'Aplicado'),(35,'10000001',4,'ZORI','RE02',3,-0.12,'Aplicado'),(36,'10000001',4,'ZORI','DI03',2.81,-0.2,'Aplicado'),(37,'10000001',5,'ZCEN','ES01',3.18,0,'Aplicado'),(38,'10000001',5,'ZCEN','RE02',2.95,-0.01,'Aplicado'),(39,'10000001',5,'ZCEN','DI03',2.69,-0.08,'Aplicado'),(40,'10000001',5,'ZOCC','ES01',3.19,0.01,'Aplicado'),(41,'10000001',5,'ZOCC','RE02',2.96,-0.01,'Aplicado'),(42,'10000001',5,'ZOCC','DI03',2.7,-0.08,'Aplicado'),(43,'10000001',5,'ZORI','ES01',3.22,0,'Aplicado'),(44,'10000001',5,'ZORI','RE02',2.99,-0.01,'Aplicado'),(45,'10000001',5,'ZORI','DI03',2.74,-0.07,'Aplicado'),(46,'10000001',6,'ZCEN','ES01',3.2,0.02,'Aplicado'),(47,'10000001',6,'ZCEN','RE02',2.98,0.03,'Aplicado'),(48,'10000001',6,'ZCEN','DI03',2.65,0.04,'Aplicado'),(49,'10000001',6,'ZOCC','ES01',3.21,0.02,'Aplicado'),(50,'10000001',6,'ZOCC','RE02',2.99,0.03,'Aplicado'),(51,'10000001',6,'ZOCC','DI03',2.66,0.04,'Aplicado'),(52,'10000001',6,'ZORI','ES01',3.25,0.03,'Aplicado'),(53,'10000001',6,'ZORI','RE02',3.02,0,'Aplicado'),(54,'10000001',6,'ZORI','DI03',2.71,0.03,'Aplicado'),(55,'10000001',7,'ZCEN','ES01',2.79,-0.41,'Aplicado'),(56,'10000001',7,'ZCEN','RE02',2.54,-0.44,'Aplicado'),(57,'10000001',7,'ZCEN','DI03',2.34,-0.31,'Aplicado'),(58,'10000001',7,'ZOCC','ES01',2.8,-0.41,'Aplicado'),(59,'10000001',7,'ZOCC','RE02',2.55,-0.44,'Aplicado'),(60,'10000001',7,'ZOCC','DI03',2.35,-0.31,'Aplicado'),(61,'10000001',7,'ZORI','ES01',2.83,-0.42,'Aplicado'),(62,'10000001',7,'ZORI','RE02',2.59,-0.43,'Aplicado'),(63,'10000001',7,'ZORI','DI03',2.4,-0.31,'Aplicado'),(64,'10000001',8,'ZCEN','ES01',2.2,-0.59,'Aplicado'),(65,'10000001',8,'ZCEN','RE02',1.99,-0.55,'Aplicado'),(66,'10000001',8,'ZCEN','DI03',2.07,-0.27,'Aplicado'),(67,'10000001',8,'ZOCC','ES01',2.21,-0.59,'Aplicado'),(68,'10000001',8,'ZOCC','RE02',1.99,-0.56,'Aplicado'),(69,'10000001',8,'ZOCC','DI03',2.08,-0.27,'Aplicado'),(70,'10000001',8,'ZORI','ES01',2.24,-0.59,'Aplicado'),(71,'10000001',8,'ZORI','RE02',2.03,-0.56,'Aplicado'),(72,'10000001',8,'ZORI','DI03',2.12,-0.28,'Aplicado'),(73,'10000001',9,'ZCEN','ES01',2.01,-0.19,'Aplicado'),(74,'10000001',9,'ZCEN','RE02',1.85,-0.14,'Aplicado'),(75,'10000001',9,'ZCEN','DI03',1.98,-0.09,'Aplicado'),(76,'10000001',9,'ZOCC','ES01',2.01,-0.2,'Aplicado'),(77,'10000001',9,'ZOCC','RE02',1.86,-0.15,'Aplicado'),(78,'10000001',9,'ZOCC','DI03',1.99,-0.09,'Aplicado'),(79,'10000001',9,'ZORI','ES01',2.05,-0.19,'Aplicado'),(80,'10000001',9,'ZORI','RE02',1.89,-0.14,'Aplicado'),(81,'10000001',9,'ZORI','DI03',2.04,-0.08,'Aplicado'),(82,'10000001',10,'ZCEN','ES01',2.06,0.05,'Aplicado'),(83,'10000001',10,'ZCEN','RE02',1.91,0.06,'Aplicado'),(84,'10000001',10,'ZCEN','DI03',1.8,-0.18,'Aplicado'),(85,'10000001',10,'ZOCC','ES01',2.07,0.06,'Aplicado'),(86,'10000001',10,'ZOCC','RE02',1.92,0.06,'Aplicado'),(87,'10000001',10,'ZOCC','DI03',1.81,-0.18,'Aplicado'),(88,'10000001',10,'ZORI','ES01',2.11,0.06,'Aplicado'),(89,'10000001',10,'ZORI','RE02',1.96,0.07,'Aplicado'),(90,'10000001',10,'ZORI','DI03',1.85,-0.19,'Aplicado'),(91,'10000001',11,'ZCEN','ES01',2.21,0.15,'Aplicado'),(92,'10000001',11,'ZCEN','RE02',2.04,0.13,'Aplicado'),(93,'10000001',11,'ZCEN','DI03',1.74,-0.06,'Aplicado'),(94,'10000001',11,'ZOCC','ES01',2.22,0.15,'Aplicado'),(95,'10000001',11,'ZOCC','RE02',2.04,0.12,'Aplicado'),(96,'10000001',11,'ZOCC','DI03',1.75,-0.06,'Aplicado'),(97,'10000001',11,'ZORI','ES01',2.25,0.14,'Aplicado'),(98,'10000001',11,'ZORI','RE02',2.08,0.12,'Aplicado'),(99,'10000001',11,'ZORI','DI03',1.79,-0.06,'Aplicado'),(100,'10000001',12,'ZCEN','ES01',2.42,0.21,'Aplicado'),(101,'10000001',12,'ZCEN','RE02',2.22,0.18,'Aplicado'),(102,'10000001',12,'ZCEN','DI03',1.88,0.14,'Aplicado'),(103,'10000001',12,'ZOCC','ES01',2.43,0.21,'Aplicado'),(104,'10000001',12,'ZOCC','RE02',2.23,0.19,'Aplicado'),(105,'10000001',12,'ZOCC','DI03',1.89,0.14,'Aplicado'),(106,'10000001',12,'ZORI','ES01',2.47,0.22,'Aplicado'),(107,'10000001',12,'ZORI','RE02',2.27,0.19,'Aplicado'),(108,'10000001',12,'ZORI','DI03',1.92,0.13,'Aplicado'),(109,'10000001',13,'ZCEN','ES01',2.57,0.15,'Aplicado'),(110,'10000001',13,'ZCEN','RE02',2.39,0.17,'Aplicado'),(111,'10000001',13,'ZCEN','DI03',2.03,0.15,'Aplicado'),(112,'10000001',13,'ZOCC','ES01',2.58,0.15,'Aplicado'),(113,'10000001',13,'ZOCC','RE02',2.39,0.16,'Aplicado'),(114,'10000001',13,'ZOCC','DI03',2.04,0.15,'Aplicado'),(115,'10000001',13,'ZORI','ES01',2.62,0.15,'Aplicado'),(116,'10000001',13,'ZORI','RE02',2.43,0.16,'Aplicado'),(117,'10000001',13,'ZORI','DI03',2.07,0.15,'Aplicado'),(118,'10000001',14,'ZCEN','ES01',2.67,0.1,'Aplicado'),(119,'10000001',14,'ZCEN','RE02',2.51,0.12,'Aplicado'),(120,'10000001',14,'ZCEN','DI03',2.15,0.12,'Aplicado'),(121,'10000001',14,'ZOCC','ES01',2.68,0.1,'Aplicado'),(122,'10000001',14,'ZOCC','RE02',2.51,0.12,'Aplicado'),(123,'10000001',14,'ZOCC','DI03',2.16,0.12,'Aplicado'),(124,'10000001',14,'ZORI','ES01',2.71,0.09,'Aplicado'),(125,'10000001',14,'ZORI','RE02',2.55,0.12,'Aplicado'),(126,'10000001',14,'ZORI','DI03',2.19,0.12,'Aplicado'),(127,'10000001',15,'ZCEN','ES01',2.73,0.06,'Aplicado'),(128,'10000001',15,'ZCEN','RE02',2.57,0.06,'Aplicado'),(129,'10000001',15,'ZCEN','DI03',2.22,0.07,'Aplicado'),(130,'10000001',15,'ZOCC','ES01',2.74,0.06,'Aplicado'),(131,'10000001',15,'ZOCC','RE02',2.58,0.07,'Aplicado'),(132,'10000001',15,'ZOCC','DI03',2.23,0.07,'Aplicado'),(133,'10000001',15,'ZORI','ES01',2.77,0.06,'Aplicado'),(134,'10000001',15,'ZORI','RE02',2.61,0.06,'Aplicado'),(135,'10000001',15,'ZORI','DI03',2.27,0.08,'Aplicado'),(136,'10000001',16,'ZCEN','ES01',2.65,-0.08,'Aplicado'),(137,'10000001',16,'ZCEN','RE02',2.48,-0.09,'Aplicado'),(138,'10000001',16,'ZCEN','DI03',2.16,-0.06,'Aplicado'),(139,'10000001',16,'ZOCC','ES01',2.66,-0.08,'Aplicado'),(140,'10000001',16,'ZOCC','RE02',2.49,-0.09,'Aplicado'),(141,'10000001',16,'ZOCC','DI03',2.17,-0.06,'Aplicado'),(142,'10000001',16,'ZORI','ES01',2.69,-0.08,'Aplicado'),(143,'10000001',16,'ZORI','RE02',2.52,-0.09,'Aplicado'),(144,'10000001',16,'ZORI','DI03',2.2,-0.07,'Aplicado'),(145,'10000001',17,'ZCEN','ES01',2.61,-0.04,'Aplicado'),(146,'10000001',17,'ZCEN','RE02',2.45,-0.03,'Aplicado'),(147,'10000001',17,'ZCEN','DI03',2.16,0,'Aplicado'),(148,'10000001',17,'ZOCC','ES01',2.62,-0.04,'Aplicado'),(149,'10000001',17,'ZOCC','RE02',2.46,-0.03,'Aplicado'),(150,'10000001',17,'ZOCC','DI03',2.17,0,'Aplicado'),(151,'10000001',17,'ZORI','ES01',2.65,-0.04,'Aplicado'),(152,'10000001',17,'ZORI','RE02',2.5,-0.02,'Aplicado'),(153,'10000001',17,'ZORI','DI03',2.21,0.01,'Aplicado'),(154,'10000001',18,'ZCEN','ES01',2.61,0,'Aplicado'),(155,'10000001',18,'ZCEN','RE02',2.48,0.03,'Aplicado'),(156,'10000001',18,'ZCEN','DI03',2.16,0,'Aplicado'),(157,'10000001',18,'ZOCC','ES01',2.62,0,'Aplicado'),(158,'10000001',18,'ZOCC','RE02',2.48,0.02,'Aplicado'),(159,'10000001',18,'ZOCC','DI03',2.17,0,'Aplicado'),(160,'10000001',18,'ZORI','ES01',2.65,0,'Aplicado'),(161,'10000001',18,'ZORI','RE02',2.52,0.02,'Aplicado'),(162,'10000001',18,'ZORI','DI03',2.2,-0.01,'Aplicado'),(163,'10000001',19,'ZCEN','ES01',2.69,0.08,'Aplicado'),(164,'10000001',19,'ZCEN','RE02',2.54,0.06,'Aplicado'),(165,'10000001',19,'ZCEN','DI03',2.16,0,'Aplicado'),(166,'10000001',19,'ZOCC','ES01',2.7,0.08,'Aplicado'),(167,'10000001',19,'ZOCC','RE02',2.55,0.07,'Aplicado'),(168,'10000001',19,'ZOCC','DI03',2.17,0,'Aplicado'),(169,'10000001',19,'ZORI','ES01',2.73,0.08,'Aplicado'),(170,'10000001',19,'ZORI','RE02',2.58,0.06,'Aplicado'),(171,'10000001',19,'ZORI','DI03',2.2,0,'Aplicado'),(172,'10000001',20,'ZCEN','ES01',2.67,-0.02,'Aplicado'),(173,'10000001',20,'ZCEN','RE02',2.51,-0.03,'Aplicado'),(174,'10000001',20,'ZCEN','DI03',2.09,-0.07,'Aplicado'),(175,'10000001',20,'ZOCC','ES01',2.68,-0.02,'Aplicado'),(176,'10000001',20,'ZOCC','RE02',2.52,-0.3,'Aplicado'),(177,'10000001',20,'ZOCC','DI03',2.1,-0.07,'Aplicado'),(178,'10000001',20,'ZORI','ES01',2.71,-0.02,'Aplicado'),(179,'10000001',20,'ZORI','RE02',2.56,-0.02,'Aplicado'),(180,'10000001',20,'ZORI','DI03',2.14,-0.06,'Aplicado'),(181,'10000001',21,'ZCEN','ES01',2.64,-0.03,'Aplicado'),(182,'10000001',21,'ZCEN','RE02',2.47,-0.04,'Aplicado'),(183,'10000001',21,'ZCEN','DI03',2.03,-0.06,'Aplicado'),(184,'10000001',21,'ZOCC','ES01',2.65,-0.03,'Aplicado'),(185,'10000001',21,'ZOCC','RE02',2.48,-0.04,'Aplicado'),(186,'10000001',21,'ZOCC','DI03',2.04,-0.06,'Aplicado'),(187,'10000001',21,'ZORI','ES01',2.68,-0.03,'Aplicado'),(188,'10000001',21,'ZORI','RE02',2.51,-0.05,'Aplicado'),(189,'10000001',21,'ZORI','DI03',2.07,-0.07,'Aplicado'),(190,'10000001',22,'ZCEN','ES01',2.66,0.02,'Aplicado'),(191,'10000001',22,'ZCEN','RE02',2.5,0.03,'Aplicado'),(192,'10000001',22,'ZCEN','DI03',2.06,0.03,'Aplicado'),(193,'10000001',22,'ZOCC','ES01',2.67,0.02,'Aplicado'),(194,'10000001',22,'ZOCC','RE02',2.51,0.03,'Aplicado'),(195,'10000001',22,'ZOCC','DI03',2.07,0.03,'Aplicado'),(196,'10000001',22,'ZORI','ES01',2.71,0.03,'Aplicado'),(197,'10000001',22,'ZORI','RE02',2.54,0.03,'Aplicado'),(198,'10000001',22,'ZORI','DI03',2.11,0.04,'Aplicado'),(199,'10000001',23,'ZCEN','ES01',2.59,-0.07,'Aplicado'),(200,'10000001',23,'ZCEN','RE02',2.44,-0.06,'Aplicado'),(201,'10000001',23,'ZCEN','DI03',2.06,0,'Aplicado'),(202,'10000001',23,'ZOCC','ES01',2.6,-0.07,'Aplicado'),(203,'10000001',23,'ZOCC','RE02',2.45,-0.06,'Aplicado'),(204,'10000001',23,'ZOCC','DI03',2.07,0,'Aplicado'),(205,'10000001',23,'ZORI','ES01',2.63,-0.08,'Aplicado'),(206,'10000001',23,'ZORI','RE02',2.48,-0.06,'Aplicado'),(207,'10000001',23,'ZORI','DI03',2.11,0,'Aplicado'),(208,'10000001',24,'ZCEN','ES01',2.52,-0.07,'Aplicado'),(209,'10000001',24,'ZCEN','RE02',2.38,-0.06,'Aplicado'),(210,'10000001',24,'ZCEN','DI03',2.08,0.02,'Aplicado'),(211,'10000001',24,'ZOCC','ES01',2.53,-0.07,'Aplicado'),(212,'10000001',24,'ZOCC','RE02',2.39,-0.06,'Aplicado'),(213,'10000001',24,'ZOCC','DI03',2.09,0.02,'Aplicado'),(214,'10000001',24,'ZORI','ES01',2.57,-0.06,'Aplicado'),(215,'10000001',24,'ZORI','RE02',2.43,-0.05,'Aplicado'),(216,'10000001',24,'ZORI','DI03',2.12,0.01,'Aplicado'),(217,'10000001',25,'ZCEN','ES01',2.56,0.04,'Aplicado'),(218,'10000001',25,'ZCEN','RE02',2.42,0.04,'Aplicado'),(219,'10000001',25,'ZCEN','DI03',2.17,0.09,'Aplicado'),(220,'10000001',25,'ZOCC','ES01',2.57,0.04,'Aplicado'),(221,'10000001',25,'ZOCC','RE02',2.43,0.04,'Aplicado'),(222,'10000001',25,'ZOCC','DI03',2.18,0.09,'Aplicado'),(223,'10000001',25,'ZORI','ES01',2.6,0.03,'Aplicado'),(224,'10000001',25,'ZORI','RE02',2.47,0.04,'Aplicado'),(225,'10000001',25,'ZORI','DI03',2.21,0.09,'Aplicado'),(226,'10000001',26,'ZCEN','ES01',2.66,0.1,'Aplicado'),(227,'10000001',26,'ZCEN','RE02',2.51,0.09,'Aplicado'),(228,'10000001',26,'ZCEN','DI03',2.28,0.11,'Aplicado'),(229,'10000001',26,'ZOCC','ES01',2.67,0.1,'Aplicado'),(230,'10000001',26,'ZOCC','RE02',2.52,0.09,'Aplicado'),(231,'10000001',26,'ZOCC','DI03',2.29,0.11,'Aplicado'),(232,'10000001',26,'ZORI','ES01',2.71,0.11,'Aplicado'),(233,'10000001',26,'ZORI','RE02',2.55,0.08,'Aplicado'),(234,'10000001',26,'ZORI','DI03',2.32,0.11,'Aplicado'),(235,'10000001',27,'ZCEN','ES01',2.86,0.1,'Aplicado'),(236,'10000001',27,'ZCEN','RE02',2.7,0.09,'Aplicado'),(237,'10000001',27,'ZCEN','DI03',2.47,0.09,'Aplicado'),(238,'10000001',27,'ZOCC','ES01',2.87,0.1,'Aplicado'),(239,'10000001',27,'ZOCC','RE02',2.71,0.09,'Aplicado'),(240,'10000001',27,'ZOCC','DI03',2.48,0.09,'Aplicado'),(241,'10000001',27,'ZORI','ES01',2.91,0.1,'Aplicado'),(242,'10000001',27,'ZORI','RE02',2.74,0.09,'Aplicado'),(243,'10000001',27,'ZORI','DI03',2.51,0.09,'Aplicado'),(244,'10000001',28,'ZCEN','ES01',2.95,0.09,'Aplicado'),(245,'10000001',28,'ZCEN','RE02',2.78,0.08,'Aplicado'),(246,'10000001',28,'ZCEN','DI03',2.52,0.05,'Aplicado'),(247,'10000001',28,'ZOCC','ES01',2.96,0.09,'Aplicado'),(248,'10000001',28,'ZOCC','RE02',2.79,0.08,'Aplicado'),(249,'10000001',28,'ZOCC','DI03',2.52,0.04,'Aplicado'),(250,'10000001',28,'ZORI','ES01',2.99,0.08,'Aplicado'),(251,'10000001',28,'ZORI','RE02',2.82,0.08,'Aplicado'),(252,'10000001',28,'ZORI','DI03',2.56,0.05,'Aplicado'),(253,'10000001',29,'ZCEN','ES01',3.04,0.09,'Aplicado'),(254,'10000001',29,'ZCEN','RE02',2.89,0.11,'Aplicado'),(255,'10000001',29,'ZCEN','DI03',2.58,0.06,'Aplicado'),(256,'10000001',29,'ZOCC','ES01',3.05,0.09,'Aplicado'),(257,'10000001',29,'ZOCC','RE02',2.89,0.1,'Aplicado'),(258,'10000001',29,'ZOCC','DI03',2.59,0.07,'Aplicado'),(259,'10000001',29,'ZORI','ES01',3.08,0.09,'Aplicado'),(260,'10000001',29,'ZORI','RE02',2.93,0.11,'Aplicado'),(261,'10000001',29,'ZORI','DI03',2.62,0.06,'Aplicado'),(262,'10000001',30,'ZCEN','ES01',3.13,0.09,'Aplicado'),(263,'10000001',30,'ZCEN','RE02',2.98,0.08,'Aplicado'),(264,'10000001',30,'ZCEN','DI03',2.65,0.08,'Aplicado'),(265,'10000001',30,'ZOCC','ES01',3.14,0.09,'Aplicado'),(266,'10000001',30,'ZOCC','RE02',2.99,0.1,'Aplicado'),(267,'10000001',30,'ZOCC','DI03',2.66,0.07,'Aplicado'),(268,'10000001',30,'ZORI','ES01',3.17,0.09,'Aplicado'),(269,'10000001',30,'ZORI','RE02',3.02,0.09,'Aplicado'),(270,'10000001',30,'ZORI','DI03',2.69,0.07,'Aplicado'),(271,'10000001',31,'ZCEN','ES01',3.24,0.11,'Aplicado'),(272,'10000001',31,'ZCEN','RE02',3.08,0.1,'Aplicado'),(273,'10000001',31,'ZCEN','DI03',2.76,0.11,'Aplicado'),(274,'10000001',31,'ZOCC','ES01',3.24,0.1,'Aplicado'),(275,'10000001',31,'ZOCC','RE02',3.09,0.1,'Aplicado'),(276,'10000001',31,'ZOCC','DI03',2.77,0.11,'Aplicado'),(277,'10000001',31,'ZORI','ES01',3.28,0.11,'Aplicado'),(278,'10000001',31,'ZORI','RE02',3.12,0.1,'Aplicado'),(279,'10000001',31,'ZORI','DI03',2.8,0.11,'Aplicado'),(280,'10000001',32,'ZCEN','ES01',3.43,0.19,'Aplicado'),(281,'10000001',32,'ZCEN','RE02',3.26,0.18,'Aplicado'),(282,'10000001',32,'ZCEN','DI03',2.9,0.14,'Aplicado'),(283,'10000001',32,'ZOCC','ES01',3.44,0.2,'Aplicado'),(284,'10000001',32,'ZOCC','RE02',3.27,0.18,'Aplicado'),(285,'10000001',32,'ZOCC','DI03',2.91,0.14,'Aplicado'),(286,'10000001',32,'ZORI','ES01',3.48,0.2,'Aplicado'),(287,'10000001',32,'ZORI','RE02',3.31,0.19,'Aplicado'),(288,'10000001',32,'ZORI','DI03',2.95,0.15,'Aplicado'),(289,'10000001',33,'ZCEN','ES01',3.6,0.17,'Aplicado'),(290,'10000001',33,'ZCEN','RE02',3.43,0.17,'Aplicado'),(291,'10000001',33,'ZCEN','DI03',2.98,0.08,'Aplicado'),(292,'10000001',33,'ZOCC','ES01',3.61,0.17,'Aplicado'),(293,'10000001',33,'ZOCC','RE02',3.44,0.17,'Aplicado'),(294,'10000001',33,'ZOCC','DI03',2.98,0.07,'Aplicado'),(295,'10000001',33,'ZORI','ES01',3.64,0.16,'Aplicado'),(296,'10000001',33,'ZORI','RE02',3.47,0.16,'Aplicado'),(297,'10000001',33,'ZORI','DI03',3.02,0.07,'Aplicado'),(298,'10000001',34,'ZCEN','ES01',3.62,0.02,'Aplicado'),(299,'10000001',34,'ZCEN','RE02',3.45,0.02,'Aplicado'),(300,'10000001',34,'ZCEN','DI03',2.93,-0.05,'Aplicado'),(301,'10000001',34,'ZOCC','ES01',3.63,0.02,'Aplicado'),(302,'10000001',34,'ZOCC','RE02',3.45,0.02,'Aplicado'),(303,'10000001',34,'ZOCC','DI03',2.93,-0.05,'Aplicado'),(304,'10000001',34,'ZORI','ES01',3.66,0.02,'Aplicado'),(305,'10000001',34,'ZORI','RE02',3.49,0.02,'Aplicado'),(306,'10000001',34,'ZORI','DI03',2.97,-0.05,'Aplicado'),(307,'10000001',35,'ZCEN','ES01',3.59,-0.03,'Aplicado'),(308,'10000001',35,'ZCEN','RE02',3.42,-0.03,'Aplicado'),(309,'10000001',35,'ZCEN','DI03',2.87,-0.06,'Aplicado'),(310,'10000001',35,'ZOCC','ES01',3.6,-0.03,'Aplicado'),(311,'10000001',35,'ZOCC','RE02',3.42,-0.04,'Aplicado'),(312,'10000001',35,'ZOCC','DI03',2.88,-0.05,'Aplicado'),(313,'10000001',35,'ZORI','ES01',3.64,-0.02,'Aplicado'),(314,'10000001',35,'ZORI','RE02',3.46,-0.03,'Aplicado'),(315,'10000001',35,'ZORI','DI03',2.91,-0.06,'Aplicado'),(316,'10000001',36,'ZCEN','ES01',3.64,0.05,'Aplicado'),(317,'10000001',36,'ZCEN','RE02',3.45,0.03,'Aplicado'),(318,'10000001',36,'ZCEN','DI03',2.92,0.05,'Aplicado'),(319,'10000001',36,'ZOCC','ES01',3.65,0.05,'Aplicado'),(320,'10000001',36,'ZOCC','RE02',3.46,0.04,'Aplicado'),(321,'10000001',36,'ZOCC','DI03',2.93,0.05,'Aplicado'),(322,'10000001',36,'ZORI','ES01',3.68,0.04,'Aplicado'),(323,'10000001',36,'ZORI','RE02',3.49,0.03,'Aplicado'),(324,'10000001',36,'ZORI','DI03',2.97,0.06,'Aplicado'),(325,'10000001',37,'ZCEN','ES01',3.7,0.06,'Aplicado'),(326,'10000001',37,'ZCEN','RE02',3.51,0.06,'Aplicado'),(327,'10000001',37,'ZCEN','DI03',3.03,0.11,'Aplicado'),(328,'10000001',37,'ZOCC','ES01',3.71,0.06,'Aplicado'),(329,'10000001',37,'ZOCC','RE02',3.52,0.06,'Aplicado'),(330,'10000001',37,'ZOCC','DI03',3.04,0.11,'Aplicado'),(331,'10000001',37,'ZORI','ES01',3.75,0.07,'Aplicado'),(332,'10000001',37,'ZORI','RE02',3.55,0.06,'Aplicado'),(333,'10000001',37,'ZORI','DI03',3.07,0.1,'Aplicado');
/*!40000 ALTER TABLE `PREDICCION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO`
--

DROP TABLE IF EXISTS `USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USUARIO` (
  `DUI` varchar(10) NOT NULL,
  `NOMBRES` varchar(40) NOT NULL,
  `APELLIDOS` varchar(40) NOT NULL,
  `DEPARTAMENTO` varchar(20) NOT NULL,
  `MUNICIPIO` varchar(20) NOT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  `CORREO` varchar(40) NOT NULL,
  `CONTRASENA` varchar(16) NOT NULL,
  PRIMARY KEY (`DUI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO`
--

LOCK TABLES `USUARIO` WRITE;
/*!40000 ALTER TABLE `USUARIO` DISABLE KEYS */;
INSERT INTO `USUARIO` VALUES ('10000001','Super','Usuario','San Salvador','San Salvador ','2000-01-01','pendiente','pendiente');
/*!40000 ALTER TABLE `USUARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ZONA`
--

DROP TABLE IF EXISTS `ZONA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Dumping events for database 'ProyectoHDP'
--

--
-- Dumping routines for database 'ProyectoHDP'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-15 19:21:08
