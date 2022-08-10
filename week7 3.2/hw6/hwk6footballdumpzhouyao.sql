CREATE DATABASE  IF NOT EXISTS `premierlastnamefirstnameinitial` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `premierlastnamefirstnameinitial`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: premierlastnamefirstnameinitial
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managers` (
  `Manager` varchar(45) DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Nationality` varchar(20) DEFAULT NULL,
  `Status` varchar(6) DEFAULT NULL,
  KEY `team_idx` (`Team`),
  CONSTRAINT `team` FOREIGN KEY (`Team`) REFERENCES `stadiums` (`team`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES ('Arsene Wenger','Arsenal FC','France','Active'),('Eddie Howe','AFC Bournemouth','England','Active'),('Chris Hughton','Brighton & Hove Albion FC','Ireland','Active'),('Sean Dyche','Burnley FC','England','Active'),('Antonio Conte','Chelsea FC','Italy','Active'),('Frank de Boer','Crystal Palace FC','Netherland','Sacked'),('Roy Hodgson','Crystal Palace FC','England','Active'),('Ronald Koeman','Everton FC','Netherland','Sacked'),('Sam Allardyce','Everton FC','England','Active'),('David Wagner','Huddersfield Town AFC','USA','Active'),('Craig Shakespeare','Leicester City FC','England','Sacked'),('Claude Puel','Leicester City FC','France','Active'),('Jurgen Klopp','Liverpool FC','Germany','Active'),('Pep Guardiola','Manchester City FC','Spain','Active'),('Jose Mourinho','Manchester United FC','Portugal','Active'),('Rafael Benitez','Newcastle United FC','Spain','Active'),('Mauricio Pellegrino','Southampton FC','Argentina','Sacked'),('Mark Hughes','Southampton FC','Wales','Active'),('Mark Hughes','Stoke City FC','Wales','Sacked'),('Paul Lambert','Stoke City FC','Scotland','Active'),('Paul Clement','Swansea City AFC','England','Sacked'),('Carlos Carvalhal','Swansea City AFC','Portugal','Active'),('Mauricio Pochettino','Tottenham Hotspur FC','Argentina','Active'),('Marco Silva','Watford FC','Portugal','Sacked'),('Javi Gracia','Watford FC','Spain','Active'),('Darren Moore','West Bromwich Albion FC','Jamaica','Active'),('Alan Pardew','West Bromwich Albion FC','England','Sacked'),('Tony Pulis','West Bromwich Albion FC','Wales','Sacked'),('Slaven Bilic','West Ham United FC','Croatia','Sacked'),('David Moyes','West Ham United FC','Scotland','Active');
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `Match_number` int NOT NULL,
  `Match_day` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Team_1` varchar(45) DEFAULT NULL,
  `Team_2` varchar(45) DEFAULT NULL,
  `Half_time_score_team_1` int DEFAULT NULL,
  `Half_time_score_team_2` int DEFAULT NULL,
  `Full_time_score_team_1` int DEFAULT NULL,
  `Full_time_score_team_2` int DEFAULT NULL,
  PRIMARY KEY (`Match_number`),
  KEY `team 1_idx` (`Team_1`),
  KEY `team_2_idx` (`Team_2`),
  CONSTRAINT `team_1` FOREIGN KEY (`Team_1`) REFERENCES `stadiums` (`team`),
  CONSTRAINT `team_2` FOREIGN KEY (`Team_2`) REFERENCES `stadiums` (`team`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (1,1,'2017-08-11','Arsenal FC','Leicester City FC',2,2,4,3),(2,1,'2017-08-12','Brighton & Hove Albion FC','Manchester City FC',0,0,0,2),(3,1,'2017-08-12','Chelsea FC','Burnley FC',0,3,2,3),(4,1,'2017-08-12','Crystal Palace FC','Huddersfield Town AFC',0,2,0,3),(5,1,'2017-08-12','Everton FC','Stoke City FC',1,0,1,0),(6,1,'2017-08-12','Southampton FC','Swansea City AFC',0,0,0,0),(7,1,'2017-08-12','Watford FC','Liverpool FC',2,1,3,3),(8,1,'2017-08-12','West Bromwich Albion FC','AFC Bournemouth',1,0,1,0),(9,1,'2017-08-13','Manchester United FC','West Ham United FC',1,0,4,0),(10,1,'2017-08-13','Newcastle United FC','Tottenham Hotspur FC',0,0,0,2),(11,2,'2017-08-19','AFC Bournemouth','Watford FC',0,0,0,2),(12,2,'2017-08-19','Burnley FC','West Bromwich Albion FC',0,0,0,1),(13,2,'2017-08-19','Leicester City FC','Brighton & Hove Albion FC',1,0,2,0),(14,2,'2017-08-19','Liverpool FC','Crystal Palace FC',0,0,1,0),(15,2,'2017-08-19','Southampton FC','West Ham United FC',2,1,3,2),(16,2,'2017-08-19','Stoke City FC','Arsenal FC',0,0,1,0),(17,2,'2017-08-19','Swansea City AFC','Manchester United FC',0,1,0,4),(18,2,'2017-08-20','Huddersfield Town AFC','Newcastle United FC',0,0,1,0),(19,2,'2017-08-20','Tottenham Hotspur FC','Chelsea FC',0,1,1,2),(20,2,'2017-08-21','Manchester City FC','Everton FC',0,1,1,1),(21,3,'2017-08-26','AFC Bournemouth','Manchester City FC',1,1,1,2),(22,3,'2017-08-26','Crystal Palace FC','Swansea City AFC',0,1,0,2),(23,3,'2017-08-26','Huddersfield Town AFC','Southampton FC',0,0,0,0),(24,3,'2017-08-26','Manchester United FC','Leicester City FC',0,0,2,0),(25,3,'2017-08-26','Newcastle United FC','West Ham United FC',1,0,3,0),(26,3,'2017-08-26','Watford FC','Brighton & Hove Albion FC',0,0,0,0),(27,3,'2017-08-27','Chelsea FC','Everton FC',2,0,2,0),(28,3,'2017-08-27','Liverpool FC','Arsenal FC',2,0,4,0),(29,3,'2017-08-27','Tottenham Hotspur FC','Burnley FC',0,0,1,1),(30,3,'2017-08-27','West Bromwich Albion FC','Stoke City FC',0,0,1,1),(31,4,'2017-09-09','Arsenal FC','AFC Bournemouth',2,0,3,0),(32,4,'2017-09-09','Brighton & Hove Albion FC','West Bromwich Albion FC',1,0,3,1),(33,4,'2017-09-09','Everton FC','Tottenham Hotspur FC',0,2,0,3),(34,4,'2017-09-09','Leicester City FC','Chelsea FC',0,1,1,2),(35,4,'2017-09-09','Manchester City FC','Liverpool FC',2,0,5,0),(36,4,'2017-09-09','Southampton FC','Watford FC',0,1,0,2),(37,4,'2017-09-09','Stoke City FC','Manchester United FC',1,1,2,2),(38,4,'2017-09-10','Burnley FC','Crystal Palace FC',1,0,1,0),(39,4,'2017-09-10','Swansea City AFC','Newcastle United FC',0,0,0,1),(40,4,'2017-09-11','West Ham United FC','Huddersfield Town AFC',0,0,2,0),(41,5,'2017-09-15','AFC Bournemouth','Brighton & Hove Albion FC',0,0,2,1),(42,5,'2017-09-16','Crystal Palace FC','Southampton FC',0,1,0,1),(43,5,'2017-09-16','Huddersfield Town AFC','Leicester City FC',0,0,1,1),(44,5,'2017-09-16','Liverpool FC','Burnley FC',1,1,1,1),(45,5,'2017-09-16','Newcastle United FC','Stoke City FC',1,0,2,1),(46,5,'2017-09-16','Tottenham Hotspur FC','Swansea City AFC',0,0,0,0),(47,5,'2017-09-16','Watford FC','Manchester City FC',0,3,0,6),(48,5,'2017-09-16','West Bromwich Albion FC','West Ham United FC',0,0,0,0),(49,5,'2017-09-17','Chelsea FC','Arsenal FC',0,0,0,0),(50,5,'2017-09-17','Manchester United FC','Everton FC',1,0,4,0),(51,6,'2017-09-23','Burnley FC','Huddersfield Town AFC',0,0,0,0),(52,6,'2017-09-23','Everton FC','AFC Bournemouth',0,0,2,1),(53,6,'2017-09-23','Leicester City FC','Liverpool FC',1,2,2,3),(54,6,'2017-09-23','Manchester City FC','Crystal Palace FC',1,0,5,0),(55,6,'2017-09-23','Southampton FC','Manchester United FC',0,1,0,1),(56,6,'2017-09-23','Stoke City FC','Chelsea FC',0,2,0,4),(57,6,'2017-09-23','Swansea City AFC','Watford FC',0,1,1,2),(58,6,'2017-09-23','West Ham United FC','Tottenham Hotspur FC',0,2,2,3),(59,6,'2017-09-24','Brighton & Hove Albion FC','Newcastle United FC',0,0,1,0),(60,6,'2017-09-25','Arsenal FC','West Bromwich Albion FC',1,0,2,0),(61,7,'2017-09-30','AFC Bournemouth','Leicester City FC',0,0,0,0),(62,7,'2017-09-30','Chelsea FC','Manchester City FC',0,0,0,1),(63,7,'2017-09-30','Huddersfield Town AFC','Tottenham Hotspur FC',0,3,0,4),(64,7,'2017-09-30','Manchester United FC','Crystal Palace FC',2,0,4,0),(65,7,'2017-09-30','Stoke City FC','Southampton FC',1,0,2,1),(66,7,'2017-09-30','West Bromwich Albion FC','Watford FC',2,1,2,2),(67,7,'2017-09-30','West Ham United FC','Swansea City AFC',0,0,1,0),(68,7,'2017-10-01','Arsenal FC','Brighton & Hove Albion FC',1,0,2,0),(69,7,'2017-10-01','Everton FC','Burnley FC',0,1,0,1),(70,7,'2017-10-01','Newcastle United FC','Liverpool FC',1,1,1,1),(71,8,'2017-10-14','Burnley FC','West Ham United FC',0,1,1,1),(72,8,'2017-10-14','Crystal Palace FC','Chelsea FC',2,1,2,1),(73,8,'2017-10-14','Liverpool FC','Manchester United FC',0,0,0,0),(74,8,'2017-10-14','Manchester City FC','Stoke City FC',3,1,7,2),(75,8,'2017-10-14','Swansea City AFC','Huddersfield Town AFC',1,0,2,0),(76,8,'2017-10-14','Tottenham Hotspur FC','AFC Bournemouth',0,0,1,0),(77,8,'2017-10-14','Watford FC','Arsenal FC',0,1,2,1),(78,8,'2017-10-15','Brighton & Hove Albion FC','Everton FC',0,0,1,1),(79,8,'2017-10-15','Southampton FC','Newcastle United FC',0,1,2,2),(80,8,'2017-10-16','Leicester City FC','West Bromwich Albion FC',0,0,1,1),(81,9,'2017-10-20','West Ham United FC','Brighton & Hove Albion FC',0,2,0,3),(82,9,'2017-10-21','Chelsea FC','Watford FC',1,1,4,2),(83,9,'2017-10-21','Huddersfield Town AFC','Manchester United FC',2,0,2,1),(84,9,'2017-10-21','Manchester City FC','Burnley FC',1,0,3,0),(85,9,'2017-10-21','Newcastle United FC','Crystal Palace FC',0,0,1,0),(86,9,'2017-10-21','Southampton FC','West Bromwich Albion FC',0,0,1,0),(87,9,'2017-10-21','Stoke City FC','AFC Bournemouth',0,2,1,2),(88,9,'2017-10-21','Swansea City AFC','Leicester City FC',0,1,1,2),(89,9,'2017-10-22','Everton FC','Arsenal FC',1,1,2,5),(90,9,'2017-10-22','Tottenham Hotspur FC','Liverpool FC',3,1,4,1),(91,10,'2017-10-28','Arsenal FC','Swansea City AFC',0,1,2,1),(92,10,'2017-10-28','AFC Bournemouth','Chelsea FC',0,0,0,1),(93,10,'2017-10-28','Crystal Palace FC','West Ham United FC',0,2,2,2),(94,10,'2017-10-28','Liverpool FC','Huddersfield Town AFC',0,0,3,0),(95,10,'2017-10-28','Manchester United FC','Tottenham Hotspur FC',0,0,1,0),(96,10,'2017-10-28','Watford FC','Stoke City FC',0,1,0,1),(97,10,'2017-10-28','West Bromwich Albion FC','Manchester City FC',1,2,2,3),(98,10,'2017-10-29','Brighton & Hove Albion FC','Southampton FC',0,1,1,1),(99,10,'2017-10-29','Leicester City FC','Everton FC',2,0,2,0),(100,10,'2017-10-30','Burnley FC','Newcastle United FC',0,0,1,0),(101,11,'2017-11-04','Huddersfield Town AFC','West Bromwich Albion FC',1,0,1,0),(102,11,'2017-11-04','Newcastle United FC','AFC Bournemouth',0,0,0,1),(103,11,'2017-11-04','Southampton FC','Burnley FC',0,0,0,1),(104,11,'2017-11-04','Stoke City FC','Leicester City FC',1,1,2,2),(105,11,'2017-11-04','Swansea City AFC','Brighton & Hove Albion FC',0,1,0,1),(106,11,'2017-11-04','West Ham United FC','Liverpool FC',0,2,1,4),(107,11,'2017-11-05','Chelsea FC','Manchester United FC',0,0,1,0),(108,11,'2017-11-05','Everton FC','Watford FC',0,0,3,2),(109,11,'2017-11-05','Manchester City FC','Arsenal FC',1,0,3,1),(110,11,'2017-11-05','Tottenham Hotspur FC','Crystal Palace FC',0,0,1,0),(111,12,'2017-11-18','Arsenal FC','Tottenham Hotspur FC',2,0,2,0),(112,12,'2017-11-18','AFC Bournemouth','Huddersfield Town AFC',2,0,4,0),(113,12,'2017-11-18','Burnley FC','Swansea City AFC',2,0,2,0),(114,12,'2017-11-18','Crystal Palace FC','Everton FC',2,2,2,2),(115,12,'2017-11-18','Leicester City FC','Manchester City FC',0,1,0,2),(116,12,'2017-11-18','Liverpool FC','Southampton FC',2,0,3,0),(117,12,'2017-11-18','Manchester United FC','Newcastle United FC',2,1,4,1),(118,12,'2017-11-18','West Bromwich Albion FC','Chelsea FC',0,3,0,4),(119,12,'2017-11-19','Watford FC','West Ham United FC',1,0,2,0),(120,12,'2017-11-20','Brighton & Hove Albion FC','Stoke City FC',1,2,2,2),(121,13,'2017-11-24','West Ham United FC','Leicester City FC',1,1,1,1),(122,13,'2017-11-25','Crystal Palace FC','Stoke City FC',0,0,2,1),(123,13,'2017-11-25','Liverpool FC','Chelsea FC',0,0,1,1),(124,13,'2017-11-25','Manchester United FC','Brighton & Hove Albion FC',0,0,1,0),(125,13,'2017-11-25','Newcastle United FC','Watford FC',0,2,0,3),(126,13,'2017-11-25','Swansea City AFC','AFC Bournemouth',0,0,0,0),(127,13,'2017-11-25','Tottenham Hotspur FC','West Bromwich Albion FC',0,1,1,1),(128,13,'2017-11-26','Burnley FC','Arsenal FC',0,0,0,1),(129,13,'2017-11-26','Huddersfield Town AFC','Manchester City FC',1,0,1,2),(130,13,'2017-11-26','Southampton FC','Everton FC',1,1,4,1),(131,14,'2017-11-28','Brighton & Hove Albion FC','Crystal Palace FC',0,0,0,0),(132,14,'2017-11-28','Leicester City FC','Tottenham Hotspur FC',2,0,2,1),(133,14,'2017-11-28','Watford FC','Manchester United FC',0,3,2,4),(134,14,'2017-11-28','West Bromwich Albion FC','Newcastle United FC',1,0,2,2),(135,14,'2017-11-29','Arsenal FC','Huddersfield Town AFC',1,0,5,0),(136,14,'2017-11-29','AFC Bournemouth','Burnley FC',0,1,1,2),(137,14,'2017-11-29','Chelsea FC','Swansea City AFC',0,0,1,0),(138,14,'2017-11-29','Everton FC','West Ham United FC',2,0,4,0),(139,14,'2017-11-29','Manchester City FC','Southampton FC',0,0,2,1),(140,14,'2017-11-29','Stoke City FC','Liverpool FC',0,1,0,3),(141,15,'2017-12-02','Arsenal FC','Manchester United FC',0,2,1,3),(142,15,'2017-12-02','Brighton & Hove Albion FC','Liverpool FC',0,2,1,5),(143,15,'2017-12-02','Chelsea FC','Newcastle United FC',2,1,3,1),(144,15,'2017-12-02','Everton FC','Huddersfield Town AFC',0,0,2,0),(145,15,'2017-12-02','Leicester City FC','Burnley FC',1,0,1,0),(146,15,'2017-12-02','Stoke City FC','Swansea City AFC',2,1,2,1),(147,15,'2017-12-02','Watford FC','Tottenham Hotspur FC',1,1,1,1),(148,15,'2017-12-02','West Bromwich Albion FC','Crystal Palace FC',0,0,0,0),(149,15,'2017-12-03','AFC Bournemouth','Southampton FC',1,0,1,1),(150,15,'2017-12-03','Manchester City FC','West Ham United FC',0,1,2,1),(151,16,'2017-12-09','Burnley FC','Watford FC',1,0,1,0),(152,16,'2017-12-09','Crystal Palace FC','AFC Bournemouth',2,2,2,2),(153,16,'2017-12-09','Huddersfield Town AFC','Brighton & Hove Albion FC',2,0,2,0),(154,16,'2017-12-09','Newcastle United FC','Leicester City FC',1,1,2,3),(155,16,'2017-12-09','Swansea City AFC','West Bromwich Albion FC',0,0,1,0),(156,16,'2017-12-09','Tottenham Hotspur FC','Stoke City FC',1,0,5,1),(157,16,'2017-12-09','West Ham United FC','Chelsea FC',1,0,1,0),(158,16,'2017-12-10','Liverpool FC','Everton FC',1,0,1,1),(159,16,'2017-12-10','Manchester United FC','Manchester City FC',1,1,1,2),(160,16,'2017-12-10','Southampton FC','Arsenal FC',1,0,1,1),(161,17,'2017-12-12','Burnley FC','Stoke City FC',0,0,1,0),(162,17,'2017-12-12','Crystal Palace FC','Watford FC',0,1,2,1),(163,17,'2017-12-12','Huddersfield Town AFC','Chelsea FC',0,2,1,3),(164,17,'2017-12-13','Liverpool FC','West Bromwich Albion FC',0,0,0,0),(165,17,'2017-12-13','Manchester United FC','AFC Bournemouth',1,0,1,0),(166,17,'2017-12-13','Newcastle United FC','Everton FC',0,1,0,1),(167,17,'2017-12-13','Southampton FC','Leicester City FC',0,3,1,4),(168,17,'2017-12-13','Swansea City AFC','Manchester City FC',0,2,0,4),(169,17,'2017-12-13','Tottenham Hotspur FC','Brighton & Hove Albion FC',1,0,2,0),(170,17,'2017-12-13','West Ham United FC','Arsenal FC',0,0,0,0),(171,18,'2017-12-16','Arsenal FC','Newcastle United FC',1,0,1,0),(172,18,'2017-12-16','Brighton & Hove Albion FC','Burnley FC',0,0,0,0),(173,18,'2017-12-16','Chelsea FC','Southampton FC',1,0,1,0),(174,18,'2017-12-16','Leicester City FC','Crystal Palace FC',0,2,0,3),(175,18,'2017-12-16','Manchester City FC','Tottenham Hotspur FC',1,0,4,1),(176,18,'2017-12-16','Stoke City FC','West Ham United FC',0,1,0,3),(177,18,'2017-12-16','Watford FC','Huddersfield Town AFC',0,2,1,4),(178,18,'2017-12-17','AFC Bournemouth','Liverpool FC',0,3,0,4),(179,18,'2017-12-17','West Bromwich Albion FC','Manchester United FC',0,2,1,2),(180,18,'2017-12-18','Everton FC','Swansea City AFC',1,1,3,1),(181,19,'2017-12-22','Arsenal FC','Liverpool FC',0,1,3,3),(182,19,'2017-12-23','Brighton & Hove Albion FC','Watford FC',0,0,1,0),(183,19,'2017-12-23','Burnley FC','Tottenham Hotspur FC',0,1,0,3),(184,19,'2017-12-23','Everton FC','Chelsea FC',0,0,0,0),(185,19,'2017-12-23','Leicester City FC','Manchester United FC',1,1,2,2),(186,19,'2017-12-23','Manchester City FC','AFC Bournemouth',1,0,4,0),(187,19,'2017-12-23','Southampton FC','Huddersfield Town AFC',1,0,1,1),(188,19,'2017-12-23','Stoke City FC','West Bromwich Albion FC',2,0,3,1),(189,19,'2017-12-23','Swansea City AFC','Crystal Palace FC',0,0,1,1),(190,19,'2017-12-23','West Ham United FC','Newcastle United FC',1,1,2,3),(191,20,'2017-12-26','AFC Bournemouth','West Ham United FC',1,1,3,3),(192,20,'2017-12-26','Chelsea FC','Brighton & Hove Albion FC',0,0,2,0),(193,20,'2017-12-26','Huddersfield Town AFC','Stoke City FC',1,0,1,1),(194,20,'2017-12-26','Liverpool FC','Swansea City AFC',1,0,5,0),(195,20,'2017-12-26','Manchester United FC','Burnley FC',0,2,2,2),(196,20,'2017-12-26','Tottenham Hotspur FC','Southampton FC',2,0,5,2),(197,20,'2017-12-26','Watford FC','Leicester City FC',1,1,2,1),(198,20,'2017-12-26','West Bromwich Albion FC','Everton FC',0,0,0,0),(199,20,'2017-12-27','Newcastle United FC','Manchester City FC',0,1,0,1),(200,20,'2017-12-28','Crystal Palace FC','Arsenal FC',0,1,2,3),(201,21,'2017-12-30','AFC Bournemouth','Everton FC',1,0,2,1),(202,21,'2017-12-30','Chelsea FC','Stoke City FC',3,0,5,0),(203,21,'2017-12-30','Huddersfield Town AFC','Burnley FC',0,0,0,0),(204,21,'2017-12-30','Liverpool FC','Leicester City FC',0,1,2,1),(205,21,'2017-12-30','Manchester United FC','Southampton FC',0,0,0,0),(206,21,'2017-12-30','Newcastle United FC','Brighton & Hove Albion FC',0,0,0,0),(207,21,'2017-12-30','Watford FC','Swansea City AFC',1,0,1,2),(208,21,'2017-12-31','Crystal Palace FC','Manchester City FC',0,0,0,0),(209,21,'2017-12-31','West Bromwich Albion FC','Arsenal FC',0,0,1,1),(210,22,'2018-01-01','Brighton & Hove Albion FC','AFC Bournemouth',1,1,2,2),(211,22,'2018-01-01','Burnley FC','Liverpool FC',0,0,1,2),(212,22,'2018-01-01','Everton FC','Manchester United FC',0,0,0,2),(213,22,'2018-01-01','Leicester City FC','Huddersfield Town AFC',0,0,3,0),(214,22,'2018-01-01','Stoke City FC','Newcastle United FC',0,0,0,1),(215,22,'2018-01-02','Manchester City FC','Watford FC',2,0,3,1),(216,22,'2018-01-02','Southampton FC','Crystal Palace FC',1,0,1,2),(217,21,'2018-01-02','Swansea City AFC','Tottenham Hotspur FC',0,1,0,2),(218,22,'2018-01-02','West Ham United FC','West Bromwich Albion FC',0,1,2,1),(219,22,'2018-01-03','Arsenal FC','Chelsea FC',0,0,2,2),(220,22,'2018-01-04','Tottenham Hotspur FC','West Ham United FC',0,0,1,1),(221,23,'2018-01-13','Chelsea FC','Leicester City FC',0,0,0,0),(222,23,'2018-01-13','Crystal Palace FC','Burnley FC',1,0,1,0),(223,23,'2018-01-13','Huddersfield Town AFC','West Ham United FC',1,1,1,4),(224,23,'2018-01-13','Newcastle United FC','Swansea City AFC',0,0,1,1),(225,23,'2018-01-13','Tottenham Hotspur FC','Everton FC',1,0,4,0),(226,23,'2018-01-13','Watford FC','Southampton FC',0,2,2,2),(227,23,'2018-01-13','West Bromwich Albion FC','Brighton & Hove Albion FC',1,0,2,0),(228,23,'2018-01-14','AFC Bournemouth','Arsenal FC',0,0,2,1),(229,23,'2018-01-14','Liverpool FC','Manchester City FC',1,1,4,3),(230,23,'2018-01-15','Manchester United FC','Stoke City FC',2,0,3,0),(231,24,'2018-01-20','Arsenal FC','Crystal Palace FC',4,0,4,1),(232,24,'2018-01-20','Brighton & Hove Albion FC','Chelsea FC',0,2,0,4),(233,24,'2018-01-20','Burnley FC','Manchester United FC',0,0,0,1),(234,24,'2018-01-20','Everton FC','West Bromwich Albion FC',0,1,1,1),(235,24,'2018-01-20','Leicester City FC','Watford FC',1,0,2,0),(236,24,'2018-01-20','Manchester City FC','Newcastle United FC',1,0,3,1),(237,24,'2018-01-20','Stoke City FC','Huddersfield Town AFC',0,0,2,0),(238,24,'2018-01-20','West Ham United FC','AFC Bournemouth',0,0,1,1),(239,24,'2018-01-21','Southampton FC','Tottenham Hotspur FC',1,1,1,1),(240,24,'2018-01-22','Swansea City AFC','Liverpool FC',1,0,1,0),(241,25,'2018-01-30','Huddersfield Town AFC','Liverpool FC',0,2,0,3),(242,25,'2018-01-30','Swansea City AFC','Arsenal FC',1,1,3,1),(243,25,'2018-01-30','West Ham United FC','Crystal Palace FC',1,1,1,1),(244,25,'2018-01-31','Chelsea FC','AFC Bournemouth',0,0,0,3),(245,25,'2018-01-31','Everton FC','Leicester City FC',2,0,2,1),(246,25,'2018-01-31','Manchester City FC','West Bromwich Albion FC',1,0,3,0),(247,25,'2018-01-31','Newcastle United FC','Burnley FC',0,0,1,1),(248,25,'2018-01-31','Southampton FC','Brighton & Hove Albion FC',0,1,1,1),(249,25,'2018-01-31','Stoke City FC','Watford FC',0,0,0,0),(250,25,'2018-01-31','Tottenham Hotspur FC','Manchester United FC',2,0,2,0),(251,26,'2018-02-03','Arsenal FC','Everton FC',4,0,5,1),(252,26,'2018-02-03','AFC Bournemouth','Stoke City FC',0,1,2,1),(253,26,'2018-02-03','Brighton & Hove Albion FC','West Ham United FC',1,1,3,1),(254,26,'2018-02-03','Burnley FC','Manchester City FC',0,1,1,1),(255,26,'2018-02-03','Leicester City FC','Swansea City AFC',1,0,1,1),(256,26,'2018-02-03','Manchester United FC','Huddersfield Town AFC',0,0,2,0),(257,26,'2018-02-03','West Bromwich Albion FC','Southampton FC',1,2,2,3),(258,26,'2018-02-04','Crystal Palace FC','Newcastle United FC',0,1,1,1),(259,26,'2018-02-04','Liverpool FC','Tottenham Hotspur FC',1,0,2,2),(260,26,'2018-02-05','Watford FC','Chelsea FC',1,0,4,1),(261,27,'2018-02-10','Everton FC','Crystal Palace FC',0,0,3,1),(262,27,'2018-02-10','Manchester City FC','Leicester City FC',1,1,5,1),(263,27,'2018-02-10','Stoke City FC','Brighton & Hove Albion FC',0,1,1,1),(264,27,'2018-02-10','Swansea City AFC','Burnley FC',0,0,1,0),(265,27,'2018-02-10','Tottenham Hotspur FC','Arsenal FC',0,0,1,0),(266,27,'2018-02-10','West Ham United FC','Watford FC',1,0,2,0),(267,27,'2018-02-11','Huddersfield Town AFC','AFC Bournemouth',2,1,4,1),(268,27,'2018-02-11','Newcastle United FC','Manchester United FC',0,0,1,0),(269,27,'2018-02-11','Southampton FC','Liverpool FC',0,2,0,2),(270,27,'2018-02-12','Chelsea FC','West Bromwich Albion FC',1,0,3,0),(271,28,'2018-02-24','AFC Bournemouth','Newcastle United FC',0,2,2,2),(272,28,'2018-02-24','Brighton & Hove Albion FC','Swansea City AFC',1,0,4,1),(273,28,'2018-02-24','Burnley FC','Southampton FC',0,0,1,1),(274,28,'2018-02-24','Leicester City FC','Stoke City FC',0,1,1,1),(275,28,'2018-02-24','Liverpool FC','West Ham United FC',1,0,4,1),(276,28,'2018-02-24','Watford FC','Everton FC',0,0,1,0),(277,28,'2018-02-24','West Bromwich Albion FC','Huddersfield Town AFC',0,0,1,2),(278,28,'2018-02-25','Crystal Palace FC','Tottenham Hotspur FC',0,0,0,1),(279,28,'2018-02-25','Manchester United FC','Chelsea FC',1,1,2,1),(280,28,'2018-03-01','Arsenal FC','Manchester City FC',0,3,0,3),(281,29,'2018-03-03','Burnley FC','Everton FC',0,1,2,1),(282,29,'2018-03-03','Leicester City FC','AFC Bournemouth',0,1,1,1),(283,29,'2018-03-03','Liverpool FC','Newcastle United FC',1,0,2,0),(284,29,'2018-03-03','Southampton FC','Stoke City FC',0,0,0,0),(285,29,'2018-03-03','Swansea City AFC','West Ham United FC',2,0,4,1),(286,29,'2018-03-03','Tottenham Hotspur FC','Huddersfield Town AFC',1,0,2,0),(287,29,'2018-03-03','Watford FC','West Bromwich Albion FC',0,0,1,0),(288,29,'2018-03-04','Brighton & Hove Albion FC','Arsenal FC',2,1,2,1),(289,29,'2018-03-04','Manchester City FC','Chelsea FC',0,0,1,0),(290,29,'2018-03-05','Crystal Palace FC','Manchester United FC',1,0,2,3),(291,30,'2018-03-10','Chelsea FC','Crystal Palace FC',2,0,2,1),(292,30,'2018-03-10','Everton FC','Brighton & Hove Albion FC',0,0,2,0),(293,30,'2018-03-10','Huddersfield Town AFC','Swansea City AFC',0,0,0,0),(294,30,'2018-03-10','Manchester United FC','Liverpool FC',2,0,2,1),(295,30,'2018-03-10','Newcastle United FC','Southampton FC',2,0,3,0),(296,30,'2018-03-10','West Bromwich Albion FC','Leicester City FC',1,1,1,4),(297,30,'2018-03-10','West Ham United FC','Burnley FC',0,0,0,3),(298,30,'2018-03-11','Arsenal FC','Watford FC',1,0,3,0),(299,30,'2018-03-11','AFC Bournemouth','Tottenham Hotspur FC',1,1,1,4),(300,30,'2018-03-12','Stoke City FC','Manchester City FC',0,1,0,2),(301,31,'2018-03-17','AFC Bournemouth','West Bromwich Albion FC',0,0,2,1),(302,31,'2018-03-17','Huddersfield Town AFC','Crystal Palace FC',0,1,0,2),(303,31,'2018-03-17','Liverpool FC','Watford FC',2,0,5,0),(304,31,'2018-03-17','Stoke City FC','Everton FC',0,0,1,2),(305,31,'2018-03-31','Brighton & Hove Albion FC','Leicester City FC',0,0,0,2),(306,32,'2018-03-31','Crystal Palace FC','Liverpool FC',1,0,1,2),(307,31,'2018-03-31','Everton FC','Manchester City FC',0,3,1,3),(308,31,'2018-03-31','Manchester United FC','Swansea City AFC',2,0,2,0),(309,32,'2018-03-31','Newcastle United FC','Huddersfield Town AFC',0,0,1,0),(310,32,'2018-03-31','Watford FC','AFC Bournemouth',1,1,2,2),(311,31,'2018-03-31','West Bromwich Albion FC','Burnley FC',0,1,1,2),(312,31,'2018-03-31','West Ham United FC','Southampton FC',3,0,3,0),(313,32,'2018-04-01','Arsenal FC','Stoke City FC',0,0,3,0),(314,31,'2018-04-01','Chelsea FC','Tottenham Hotspur FC',1,1,1,3),(315,33,'2018-04-07','AFC Bournemouth','Crystal Palace FC',0,0,2,2),(316,33,'2018-04-07','Brighton & Hove Albion FC','Huddersfield Town AFC',1,1,1,1),(317,33,'2018-04-07','Everton FC','Liverpool FC',0,0,0,0),(318,32,'2018-04-07','Leicester City FC','Newcastle United FC',0,1,1,2),(319,32,'2018-04-07','Manchester City FC','Manchester United FC',2,0,2,3),(320,32,'2018-04-07','Stoke City FC','Tottenham Hotspur FC',0,0,1,2),(321,32,'2018-04-07','Watford FC','Burnley FC',0,0,1,2),(322,32,'2018-04-07','West Bromwich Albion FC','Swansea City AFC',0,0,1,1),(323,32,'2018-04-08','Arsenal FC','Southampton FC',2,1,3,2),(324,32,'2018-04-08','Chelsea FC','West Ham United FC',1,0,1,1),(325,33,'2018-04-14','Burnley FC','Leicester City FC',2,0,2,1),(326,33,'2018-04-14','Crystal Palace FC','Brighton & Hove Albion FC',3,2,3,2),(327,34,'2018-04-14','Huddersfield Town AFC','Watford FC',0,0,1,0),(328,34,'2018-04-14','Liverpool FC','AFC Bournemouth',1,0,3,0),(329,33,'2018-04-14','Southampton FC','Chelsea FC',1,0,2,3),(330,34,'2018-04-14','Swansea City AFC','Everton FC',0,1,1,1),(331,33,'2018-04-14','Tottenham Hotspur FC','Manchester City FC',1,2,1,3),(332,34,'2018-04-15','Manchester United FC','West Bromwich Albion FC',0,0,0,1),(333,33,'2018-04-15','Newcastle United FC','Arsenal FC',1,1,2,1),(334,34,'2018-04-16','West Ham United FC','Stoke City FC',0,0,1,1),(335,34,'2018-04-17','Brighton & Hove Albion FC','Tottenham Hotspur FC',0,0,1,1),(336,34,'2018-04-18','AFC Bournemouth','Manchester United FC',0,1,0,2),(337,34,'2018-04-19','Burnley FC','Chelsea FC',0,1,1,2),(338,34,'2018-04-19','Leicester City FC','Southampton FC',0,0,0,0),(339,35,'2018-04-21','Watford FC','Crystal Palace FC',0,0,0,0),(340,35,'2018-04-21','West Bromwich Albion FC','Liverpool FC',0,1,2,2),(341,34,'2018-04-22','Arsenal FC','West Ham United FC',0,0,4,1),(342,34,'2018-04-22','Manchester City FC','Swansea City AFC',2,0,5,0),(343,35,'2018-04-22','Stoke City FC','Burnley FC',1,0,1,1),(344,34,'2018-04-23','Everton FC','Newcastle United FC',0,0,1,0),(345,35,'2018-04-28','Burnley FC','Brighton & Hove Albion FC',0,0,0,0),(346,35,'2018-04-28','Crystal Palace FC','Leicester City FC',2,0,5,0),(347,36,'2018-04-28','Huddersfield Town AFC','Everton FC',0,1,0,2),(348,36,'2018-04-28','Liverpool FC','Stoke City FC',0,0,0,0),(349,36,'2018-04-28','Newcastle United FC','West Bromwich Albion FC',0,1,0,1),(350,36,'2018-04-28','Southampton FC','AFC Bournemouth',1,1,2,1),(351,35,'2018-04-28','Swansea City AFC','Chelsea FC',0,1,0,1),(352,35,'2018-04-29','Manchester United FC','Arsenal FC',1,0,2,1),(353,35,'2018-04-29','West Ham United FC','Manchester City FC',1,2,1,4),(354,36,'2018-04-30','Tottenham Hotspur FC','Watford FC',1,0,2,0),(355,36,'2018-05-04','Brighton & Hove Albion FC','Manchester United FC',0,0,1,0),(356,36,'2018-05-05','AFC Bournemouth','Swansea City AFC',1,0,1,0),(357,36,'2018-05-05','Everton FC','Southampton FC',0,0,1,1),(358,36,'2018-05-05','Leicester City FC','West Ham United FC',0,1,0,2),(359,37,'2018-05-05','Stoke City FC','Crystal Palace FC',1,0,1,2),(360,36,'2018-05-05','Watford FC','Newcastle United FC',2,0,2,1),(361,36,'2018-05-05','West Bromwich Albion FC','Tottenham Hotspur FC',0,0,1,0),(362,37,'2018-05-06','Arsenal FC','Burnley FC',2,0,5,0),(363,37,'2018-05-06','Chelsea FC','Liverpool FC',1,0,1,0),(364,36,'2018-05-06','Manchester City FC','Huddersfield Town AFC',0,0,0,0),(365,37,'2018-05-08','Swansea City AFC','Southampton FC',0,0,0,1),(366,37,'2018-05-09','Chelsea FC','Huddersfield Town AFC',0,0,1,1),(367,37,'2018-05-09','Leicester City FC','Arsenal FC',1,0,3,1),(368,37,'2018-05-09','Manchester City FC','Brighton & Hove Albion FC',2,1,3,1),(369,37,'2018-05-09','Tottenham Hotspur FC','Newcastle United FC',0,0,1,0),(370,37,'2018-05-10','West Ham United FC','Manchester United FC',0,0,0,0),(371,38,'2018-05-13','Burnley FC','AFC Bournemouth',1,0,1,2),(372,38,'2018-05-13','Crystal Palace FC','West Bromwich Albion FC',0,0,2,0),(373,38,'2018-05-13','Huddersfield Town AFC','Arsenal FC',0,1,0,1),(374,38,'2018-05-13','Liverpool FC','Brighton & Hove Albion FC',2,0,4,0),(375,38,'2018-05-13','Manchester United FC','Watford FC',1,0,1,0),(376,38,'2018-05-13','Newcastle United FC','Chelsea FC',1,0,3,0),(377,38,'2018-05-13','Southampton FC','Manchester City FC',0,0,0,1),(378,38,'2018-05-13','Swansea City AFC','Stoke City FC',1,2,1,2),(379,38,'2018-05-13','Tottenham Hotspur FC','Leicester City FC',1,2,5,4),(380,38,'2018-05-13','West Ham United FC','Everton FC',1,0,3,1);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadiums`
--

DROP TABLE IF EXISTS `stadiums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadiums` (
  `team` varchar(45) NOT NULL,
  `venue` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`team`),
  UNIQUE KEY `team_UNIQUE` (`team`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadiums`
--

LOCK TABLES `stadiums` WRITE;
/*!40000 ALTER TABLE `stadiums` DISABLE KEYS */;
INSERT INTO `stadiums` VALUES ('AFC Bournemouth','Vitality Stadium'),('Arsenal FC','Emirates Stadium'),('Brighton & Hove Albion FC','Amex Stadium'),('Burnley FC','Turf Moor'),('Chelsea FC','Stamford Bridge'),('Crystal Palace FC','Selhurst Park'),('Everton FC','Goodison Park'),('Huddersfield Town AFC','John Smith\'s Stadium'),('Leicester City FC','King Power Stadium'),('Liverpool FC','Anfield'),('Manchester City FC','Etihad Stadium'),('Manchester United FC','Old Trafford'),('Newcastle United FC','St. James\' Park'),('Southampton FC','St Mary\'s Stadium'),('Stoke City FC','bet365 Stadium'),('Swansea City AFC','Liberty Stadium'),('Tottenham Hotspur FC','Wembley Stadium['),('Watford FC','Vicarage Road'),('West Bromwich Albion FC','The Hawthorns'),('West Ham United FC','London Stadium');
/*!40000 ALTER TABLE `stadiums` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-06 16:33:33
