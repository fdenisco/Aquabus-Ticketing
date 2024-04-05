-- MySQL dump 10.13  Distrib 8.0.32, for macos13.0 (x86_64)
--
-- Host: localhost    Database: TransportationDB
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `FareLevels`
--

DROP TABLE IF EXISTS `FareLevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FareLevels` (
  `FareLevelID` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Stops` int NOT NULL,
  PRIMARY KEY (`FareLevelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FareLevels`
--

LOCK TABLES `FareLevels` WRITE;
/*!40000 ALTER TABLE `FareLevels` DISABLE KEYS */;
INSERT INTO `FareLevels` VALUES (1,'Level 1',1),(2,'Level 2',2),(3,'Level 3',3),(4,'Level 4',4);
/*!40000 ALTER TABLE `FareLevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stops`
--

DROP TABLE IF EXISTS `Stops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stops` (
  `StopID` int NOT NULL,
  `StopName` varchar(100) NOT NULL,
  `StopGroup` int NOT NULL,
  PRIMARY KEY (`StopID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stops`
--

LOCK TABLES `Stops` WRITE;
/*!40000 ALTER TABLE `Stops` DISABLE KEYS */;
INSERT INTO `Stops` VALUES (1,'Hornby',1),(2,'Granville Island',2),(3,'David Lam Park',3),(4,'Stamps Landing',4),(5,'Spyglass Place',4),(6,'Yaletown',4),(7,'Plaza of Nations',5),(8,'The Village',5);
/*!40000 ALTER TABLE `Stops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TicketPrices`
--

DROP TABLE IF EXISTS `TicketPrices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TicketPrices` (
  `FareLevelID` int NOT NULL,
  `AgeCategory` varchar(20) NOT NULL,
  `TicketType` varchar(20) NOT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`FareLevelID`,`AgeCategory`,`TicketType`),
  CONSTRAINT `ticketprices_ibfk_1` FOREIGN KEY (`FareLevelID`) REFERENCES `FareLevels` (`FareLevelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TicketPrices`
--

LOCK TABLES `TicketPrices` WRITE;
/*!40000 ALTER TABLE `TicketPrices` DISABLE KEYS */;
INSERT INTO `TicketPrices` VALUES (1,'Adult','OneWay',4.50),(1,'Adult','Return',7.50),(1,'ChildSenior','OneWay',3.00),(1,'ChildSenior','Return',5.50),(1,'Infant','OneWay',0.00),(1,'Infant','Return',0.00),(2,'Adult','OneWay',5.75),(2,'Adult','Return',10.00),(2,'ChildSenior','OneWay',4.25),(2,'ChildSenior','Return',8.00),(2,'Infant','OneWay',0.00),(2,'Infant','Return',0.00),(3,'Adult','OneWay',7.75),(3,'Adult','Return',14.00),(3,'ChildSenior','OneWay',5.75),(3,'ChildSenior','Return',11.00),(3,'Infant','OneWay',0.00),(3,'Infant','Return',0.00),(4,'Adult','OneWay',10.00),(4,'Adult','Return',18.00),(4,'ChildSenior','OneWay',8.00),(4,'ChildSenior','Return',15.00),(4,'Infant','OneWay',0.00),(4,'Infant','Return',0.00);
/*!40000 ALTER TABLE `TicketPrices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tickets`
--

DROP TABLE IF EXISTS `Tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tickets` (
  `TicketID` int NOT NULL AUTO_INCREMENT,
  `AdultTickets` int NOT NULL,
  `DiscountTickets` int NOT NULL,
  `FareLevelID` int DEFAULT NULL,
  PRIMARY KEY (`TicketID`),
  KEY `FareLevelID` (`FareLevelID`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`FareLevelID`) REFERENCES `FareLevels` (`FareLevelID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tickets`
--

LOCK TABLES `Tickets` WRITE;
/*!40000 ALTER TABLE `Tickets` DISABLE KEYS */;
INSERT INTO `Tickets` VALUES (1,2,1,1),(2,3,2,2),(3,4,3,3),(4,6,4,4);
/*!40000 ALTER TABLE `Tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-04 23:07:56
