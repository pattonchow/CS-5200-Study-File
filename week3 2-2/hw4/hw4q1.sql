CREATE DATABASE  IF NOT EXISTS `hw4q1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hw4q1`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: hw4q1
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
-- Table structure for table `clinic`
--

DROP TABLE IF EXISTS `clinic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic` (
  `clinicNo` int NOT NULL,
  PRIMARY KEY (`clinicNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic`
--

LOCK TABLES `clinic` WRITE;
/*!40000 ALTER TABLE `clinic` DISABLE KEYS */;
/*!40000 ALTER TABLE `clinic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_to_treat`
--

DROP TABLE IF EXISTS `exam_to_treat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_to_treat` (
  `examNo` int NOT NULL,
  `treatNo` int NOT NULL,
  PRIMARY KEY (`examNo`,`treatNo`),
  KEY `treatNo` (`treatNo`),
  CONSTRAINT `exam_to_treat_ibfk_1` FOREIGN KEY (`examNo`) REFERENCES `examination` (`examNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `exam_to_treat_ibfk_2` FOREIGN KEY (`treatNo`) REFERENCES `treatement` (`treatNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_to_treat`
--

LOCK TABLES `exam_to_treat` WRITE;
/*!40000 ALTER TABLE `exam_to_treat` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_to_treat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examination`
--

DROP TABLE IF EXISTS `examination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examination` (
  `examNo` int NOT NULL,
  `exam_object` int NOT NULL,
  `perform_staff` int NOT NULL,
  PRIMARY KEY (`examNo`),
  KEY `exam_object` (`exam_object`),
  KEY `perform_staff` (`perform_staff`),
  CONSTRAINT `examination_ibfk_1` FOREIGN KEY (`exam_object`) REFERENCES `pet` (`petNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `examination_ibfk_2` FOREIGN KEY (`perform_staff`) REFERENCES `staff` (`staffNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examination`
--

LOCK TABLES `examination` WRITE;
/*!40000 ALTER TABLE `examination` DISABLE KEYS */;
/*!40000 ALTER TABLE `examination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet` (
  `petNo` int NOT NULL,
  `ownerNo` int NOT NULL,
  `register_clinic` int NOT NULL,
  PRIMARY KEY (`petNo`),
  KEY `ownerNo` (`ownerNo`),
  KEY `register_clinic` (`register_clinic`),
  CONSTRAINT `pet_ibfk_1` FOREIGN KEY (`ownerNo`) REFERENCES `petowner` (`ownerNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pet_ibfk_2` FOREIGN KEY (`register_clinic`) REFERENCES `clinic` (`clinicNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet`
--

LOCK TABLES `pet` WRITE;
/*!40000 ALTER TABLE `pet` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `petowner`
--

DROP TABLE IF EXISTS `petowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `petowner` (
  `ownerNo` int NOT NULL,
  `contacted_clinic` int NOT NULL,
  PRIMARY KEY (`ownerNo`),
  KEY `contacted_clinic` (`contacted_clinic`),
  CONSTRAINT `petowner_ibfk_1` FOREIGN KEY (`contacted_clinic`) REFERENCES `clinic` (`clinicNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petowner`
--

LOCK TABLES `petowner` WRITE;
/*!40000 ALTER TABLE `petowner` DISABLE KEYS */;
/*!40000 ALTER TABLE `petowner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staffNo` int NOT NULL,
  `company` int NOT NULL,
  PRIMARY KEY (`staffNo`),
  KEY `company` (`company`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`company`) REFERENCES `clinic` (`clinicNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_to_clinic`
--

DROP TABLE IF EXISTS `staff_to_clinic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_to_clinic` (
  `clinicNo` int NOT NULL,
  `staffNo` int NOT NULL,
  PRIMARY KEY (`clinicNo`,`staffNo`),
  KEY `staffNo` (`staffNo`),
  CONSTRAINT `staff_to_clinic_ibfk_1` FOREIGN KEY (`clinicNo`) REFERENCES `clinic` (`clinicNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `staff_to_clinic_ibfk_2` FOREIGN KEY (`staffNo`) REFERENCES `staff` (`staffNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_to_clinic`
--

LOCK TABLES `staff_to_clinic` WRITE;
/*!40000 ALTER TABLE `staff_to_clinic` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_to_clinic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatement`
--

DROP TABLE IF EXISTS `treatement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatement` (
  `treatNo` int NOT NULL,
  PRIMARY KEY (`treatNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatement`
--

LOCK TABLES `treatement` WRITE;
/*!40000 ALTER TABLE `treatement` DISABLE KEYS */;
/*!40000 ALTER TABLE `treatement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-14 19:54:21
