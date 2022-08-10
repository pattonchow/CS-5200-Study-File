CREATE DATABASE  IF NOT EXISTS `hw4q2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hw4q2`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: hw4q2
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
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `schoolId` int NOT NULL,
  `NIN` int NOT NULL,
  `startDate` date DEFAULT NULL,
  PRIMARY KEY (`schoolId`,`NIN`),
  KEY `NIN` (`NIN`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`schoolId`) REFERENCES `school` (`schoolId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `manager_ibfk_2` FOREIGN KEY (`NIN`) REFERENCES `teacher` (`NIN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pupil`
--

DROP TABLE IF EXISTS `pupil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pupil` (
  `pupilId` int NOT NULL,
  `firstName` varchar(64) NOT NULL,
  `lastName` varchar(64) NOT NULL,
  `sex` varchar(8) NOT NULL,
  `dateofbirth` date NOT NULL,
  `studyplace` int NOT NULL,
  PRIMARY KEY (`pupilId`),
  KEY `studyplace` (`studyplace`),
  CONSTRAINT `pupil_ibfk_1` FOREIGN KEY (`studyplace`) REFERENCES `school` (`schoolId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pupil`
--

LOCK TABLES `pupil` WRITE;
/*!40000 ALTER TABLE `pupil` DISABLE KEYS */;
/*!40000 ALTER TABLE `pupil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pupiltosubject`
--

DROP TABLE IF EXISTS `pupiltosubject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pupiltosubject` (
  `pupilId` int DEFAULT NULL,
  `subjectNo` int DEFAULT NULL,
  KEY `pupilId` (`pupilId`),
  KEY `subjectNo` (`subjectNo`),
  CONSTRAINT `pupiltosubject_ibfk_1` FOREIGN KEY (`pupilId`) REFERENCES `pupil` (`pupilId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pupiltosubject_ibfk_2` FOREIGN KEY (`subjectNo`) REFERENCES `subject_` (`subjectNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pupiltosubject`
--

LOCK TABLES `pupiltosubject` WRITE;
/*!40000 ALTER TABLE `pupiltosubject` DISABLE KEYS */;
/*!40000 ALTER TABLE `pupiltosubject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school` (
  `schoolId` int NOT NULL,
  `school_name` varchar(64) NOT NULL,
  `town` varchar(64) NOT NULL,
  `street` varchar(64) NOT NULL,
  `zipcode` char(5) NOT NULL,
  `phone` char(11) DEFAULT 'NOAVAILABLE',
  PRIMARY KEY (`schoolId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_`
--

DROP TABLE IF EXISTS `subject_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_` (
  `subjectNo` int NOT NULL,
  `title` varchar(128) NOT NULL,
  `subject_type` varchar(128) NOT NULL,
  PRIMARY KEY (`subjectNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_`
--

LOCK TABLES `subject_` WRITE;
/*!40000 ALTER TABLE `subject_` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `NIN` int NOT NULL,
  `firstName` varchar(64) NOT NULL,
  `lastName` varchar(64) NOT NULL,
  `sex` varchar(8) NOT NULL,
  `qulification` varchar(128) NOT NULL,
  `workplace` int DEFAULT NULL,
  PRIMARY KEY (`NIN`),
  KEY `workplace` (`workplace`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`workplace`) REFERENCES `school` (`schoolId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachertosubject`
--

DROP TABLE IF EXISTS `teachertosubject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachertosubject` (
  `subjectNo` int NOT NULL,
  `NIN` int NOT NULL,
  `hours` int NOT NULL,
  PRIMARY KEY (`subjectNo`,`NIN`),
  KEY `NIN` (`NIN`),
  CONSTRAINT `teachertosubject_ibfk_1` FOREIGN KEY (`subjectNo`) REFERENCES `subject_` (`subjectNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teachertosubject_ibfk_2` FOREIGN KEY (`NIN`) REFERENCES `teacher` (`NIN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachertosubject`
--

LOCK TABLES `teachertosubject` WRITE;
/*!40000 ALTER TABLE `teachertosubject` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachertosubject` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-14 19:54:32
