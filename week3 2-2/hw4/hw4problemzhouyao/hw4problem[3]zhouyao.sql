CREATE DATABASE  IF NOT EXISTS `cleaning_company` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cleaning_company`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: cleaning_company
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
  `staff_id` int NOT NULL,
  `is_office_work` tinyint(1) DEFAULT NULL,
  `is_answer_phone` tinyint(1) DEFAULT NULL,
  `is_maintain_schedule` tinyint(1) DEFAULT NULL,
  `is_maintain_equipment` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
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
-- Table structure for table `clean_group`
--

DROP TABLE IF EXISTS `clean_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clean_group` (
  `group_id` int NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clean_group`
--

LOCK TABLES `clean_group` WRITE;
/*!40000 ALTER TABLE `clean_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `clean_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clean_group_job`
--

DROP TABLE IF EXISTS `clean_group_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clean_group_job` (
  `group_id` int NOT NULL,
  `job_id` int NOT NULL,
  `equip_id` int DEFAULT NULL,
  PRIMARY KEY (`group_id`,`job_id`),
  KEY `job_id` (`job_id`),
  KEY `equip_id` (`equip_id`),
  CONSTRAINT `clean_group_job_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `clean_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clean_group_job_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clean_group_job_ibfk_3` FOREIGN KEY (`equip_id`) REFERENCES `equipment` (`equip_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clean_group_job`
--

LOCK TABLES `clean_group_job` WRITE;
/*!40000 ALTER TABLE `clean_group_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `clean_group_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clean_staff`
--

DROP TABLE IF EXISTS `clean_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clean_staff` (
  `staff_id` int NOT NULL,
  `group_id` int DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `clean_staff_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `clean_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clean_staff`
--

LOCK TABLES `clean_staff` WRITE;
/*!40000 ALTER TABLE `clean_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `clean_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clean_staff_supervisor`
--

DROP TABLE IF EXISTS `clean_staff_supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clean_staff_supervisor` (
  `staff_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`staff_id`,`group_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `clean_staff_supervisor_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `clean_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clean_staff_supervisor_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `clean_staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clean_staff_supervisor`
--

LOCK TABLES `clean_staff_supervisor` WRITE;
/*!40000 ALTER TABLE `clean_staff_supervisor` DISABLE KEYS */;
/*!40000 ALTER TABLE `clean_staff_supervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `client_id` int NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `equip_id` int NOT NULL,
  PRIMARY KEY (`equip_id`)
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
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `job_id` int NOT NULL,
  `job_hour` int NOT NULL,
  `req_id` int NOT NULL,
  `admin_staff_id` int NOT NULL,
  `clean_group_id` int NOT NULL,
  PRIMARY KEY (`job_id`),
  KEY `req_id` (`req_id`),
  KEY `admin_staff_id` (`admin_staff_id`),
  KEY `clean_group_id` (`clean_group_id`),
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`req_id`) REFERENCES `requirement` (`req_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_ibfk_2` FOREIGN KEY (`admin_staff_id`) REFERENCES `admin_staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_ibfk_3` FOREIGN KEY (`clean_group_id`) REFERENCES `clean_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `job_equipment`
--

DROP TABLE IF EXISTS `job_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_equipment` (
  `job_id` int NOT NULL,
  `equip_id` int NOT NULL,
  PRIMARY KEY (`job_id`,`equip_id`),
  KEY `equip_id` (`equip_id`),
  CONSTRAINT `job_equipment_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_equipment_ibfk_2` FOREIGN KEY (`equip_id`) REFERENCES `equipment` (`equip_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_equipment`
--

LOCK TABLES `job_equipment` WRITE;
/*!40000 ALTER TABLE `job_equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirement`
--

DROP TABLE IF EXISTS `requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requirement` (
  `req_id` int NOT NULL,
  `client_id` int NOT NULL,
  `req_details` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`req_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `requirement_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
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

-- Dump completed on 2022-02-14 19:48:49
