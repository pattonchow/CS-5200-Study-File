CREATE DATABASE  IF NOT EXISTS `hw4q3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hw4q3`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: hw4q3
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
-- Table structure for table `admin_staff`
--

DROP TABLE IF EXISTS `admin_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_staff` (
  `staffNo` int NOT NULL,
  PRIMARY KEY (`staffNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_staff`
--

LOCK TABLES `admin_staff` WRITE;
/*!40000 ALTER TABLE `admin_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrative_staff_manage`
--

DROP TABLE IF EXISTS `administrative_staff_manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrative_staff_manage` (
  `staffNo` int NOT NULL,
  `workId` int NOT NULL,
  PRIMARY KEY (`staffNo`,`workId`),
  KEY `workId` (`workId`),
  CONSTRAINT `administrative_staff_manage_ibfk_1` FOREIGN KEY (`staffNo`) REFERENCES `admin_staff` (`staffNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `administrative_staff_manage_ibfk_2` FOREIGN KEY (`workId`) REFERENCES `office_work` (`workId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrative_staff_manage`
--

LOCK TABLES `administrative_staff_manage` WRITE;
/*!40000 ALTER TABLE `administrative_staff_manage` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrative_staff_manage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cleaning_staff`
--

DROP TABLE IF EXISTS `cleaning_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cleaning_staff` (
  `staffNo` int NOT NULL,
  `belong_group` int NOT NULL,
  PRIMARY KEY (`staffNo`),
  KEY `belong_group` (`belong_group`),
  CONSTRAINT `cleaning_staff_ibfk_1` FOREIGN KEY (`belong_group`) REFERENCES `group_` (`groupNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cleaning_staff`
--

LOCK TABLES `cleaning_staff` WRITE;
/*!40000 ALTER TABLE `cleaning_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `cleaning_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cleaning_supervisor`
--

DROP TABLE IF EXISTS `cleaning_supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cleaning_supervisor` (
  `cleaningstaff` int NOT NULL,
  `groupNo` int NOT NULL,
  PRIMARY KEY (`cleaningstaff`,`groupNo`),
  KEY `groupNo` (`groupNo`),
  CONSTRAINT `cleaning_supervisor_ibfk_1` FOREIGN KEY (`cleaningstaff`) REFERENCES `cleaning_staff` (`staffNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cleaning_supervisor_ibfk_2` FOREIGN KEY (`groupNo`) REFERENCES `group_` (`groupNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cleaning_supervisor`
--

LOCK TABLES `cleaning_supervisor` WRITE;
/*!40000 ALTER TABLE `cleaning_supervisor` DISABLE KEYS */;
/*!40000 ALTER TABLE `cleaning_supervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_`
--

DROP TABLE IF EXISTS `client_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_` (
  `clientNo` int NOT NULL,
  PRIMARY KEY (`clientNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_`
--

LOCK TABLES `client_` WRITE;
/*!40000 ALTER TABLE `client_` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `equipmentNo` int NOT NULL,
  PRIMARY KEY (`equipmentNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_`
--

DROP TABLE IF EXISTS `group_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_` (
  `groupNo` int NOT NULL,
  PRIMARY KEY (`groupNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_`
--

LOCK TABLES `group_` WRITE;
/*!40000 ALTER TABLE `group_` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouptojob`
--

DROP TABLE IF EXISTS `grouptojob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grouptojob` (
  `group_no` int DEFAULT NULL,
  `job_no` int DEFAULT NULL,
  KEY `group_no` (`group_no`),
  KEY `job_no` (`job_no`),
  CONSTRAINT `grouptojob_ibfk_1` FOREIGN KEY (`group_no`) REFERENCES `group_` (`groupNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grouptojob_ibfk_2` FOREIGN KEY (`job_no`) REFERENCES `job` (`jobNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouptojob`
--

LOCK TABLES `grouptojob` WRITE;
/*!40000 ALTER TABLE `grouptojob` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouptojob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `jobNo` int NOT NULL,
  `limited_time` varchar(64) NOT NULL,
  `adm` int NOT NULL,
  `related_req` int NOT NULL,
  PRIMARY KEY (`jobNo`),
  KEY `related_req` (`related_req`),
  KEY `adm` (`adm`),
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`related_req`) REFERENCES `requirement` (`reqNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_ibfk_2` FOREIGN KEY (`adm`) REFERENCES `admin_staff` (`staffNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_need_equipment`
--

DROP TABLE IF EXISTS `job_need_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_need_equipment` (
  `job_No` int NOT NULL,
  `equipment_No` int NOT NULL,
  PRIMARY KEY (`job_No`,`equipment_No`),
  KEY `equipment_No` (`equipment_No`),
  CONSTRAINT `job_need_equipment_ibfk_1` FOREIGN KEY (`job_No`) REFERENCES `job` (`jobNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_need_equipment_ibfk_2` FOREIGN KEY (`equipment_No`) REFERENCES `equipment` (`equipmentNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_need_equipment`
--

LOCK TABLES `job_need_equipment` WRITE;
/*!40000 ALTER TABLE `job_need_equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_need_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_work`
--

DROP TABLE IF EXISTS `office_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office_work` (
  `workId` int NOT NULL,
  `simple_office_work` tinyint(1) DEFAULT NULL,
  `answering_phones` tinyint(1) DEFAULT NULL,
  `maintaining_cleaning_schedule` tinyint(1) DEFAULT NULL,
  `ensuring_equipment` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`workId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_work`
--

LOCK TABLES `office_work` WRITE;
/*!40000 ALTER TABLE `office_work` DISABLE KEYS */;
/*!40000 ALTER TABLE `office_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirement`
--

DROP TABLE IF EXISTS `requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requirement` (
  `reqNo` int NOT NULL,
  `description_` varchar(128) NOT NULL,
  `clientNo` int NOT NULL,
  PRIMARY KEY (`reqNo`),
  CONSTRAINT `requirement_ibfk_1` FOREIGN KEY (`reqNo`) REFERENCES `client_` (`clientNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirement`
--

LOCK TABLES `requirement` WRITE;
/*!40000 ALTER TABLE `requirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `requirement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-14 19:54:59
