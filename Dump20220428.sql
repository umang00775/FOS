-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: fos
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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` char(5) NOT NULL,
  `CustomerName` char(10) DEFAULT NULL,
  `houseNO` char(4) DEFAULT NULL,
  `societyName` varchar(10) DEFAULT NULL,
  `LandmarkOrArea` char(10) DEFAULT NULL,
  `City` char(15) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `idx_customer_CustomerID` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('00001','Ramesh','A28','kgn','Sayajipura','Vadodara'),('00002','suresh','B264','aab','sector26','Gandhinagar'),('00003','Paresh','C534','Nakulngr','sector26','Gandhinagar'),('00004','Kishor','H564','nishatngr','sector27','Gandhinagar'),('00005','Vishal','C563','Vishad','sector27','Gandhinagar'),('6','abc','abc','abc','abc','abc'),('7','abc','abc','abc','abc','abc'),('8','abc','abc','abc','abc','abc'),('9','abc','abc','abc','abc','abc');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryprovider`
--

DROP TABLE IF EXISTS `deliveryprovider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveryprovider` (
  `dID` char(5) NOT NULL,
  `DPName` char(10) DEFAULT NULL,
  `PhoneNO` char(13) DEFAULT NULL,
  `AreaOfOpration` char(5) DEFAULT NULL,
  `Availibility` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`dID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryprovider`
--

LOCK TABLES `deliveryprovider` WRITE;
/*!40000 ALTER TABLE `deliveryprovider` DISABLE KEYS */;
INSERT INTO `deliveryprovider` VALUES ('d0001','Atul','+916546121325','Sec26',1),('d0002','Ashvin','+916546121685','Sec27',0),('d0003','vikram','+919446121325','Sec21',1);
/*!40000 ALTER TABLE `deliveryprovider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemordered`
--

DROP TABLE IF EXISTS `itemordered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemordered` (
  `ItemID` varchar(5) NOT NULL,
  `ItemQuantity` int DEFAULT NULL,
  `OrderID` varchar(5) DEFAULT NULL,
  `RestaurantID` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemordered`
--

LOCK TABLES `itemordered` WRITE;
/*!40000 ALTER TABLE `itemordered` DISABLE KEYS */;
INSERT INTO `itemordered` VALUES ('i0001',2,'O0001','R0002'),('i0002',1,'O0001','R0001'),('i0001',3,'O0002','R0003'),('i0004',4,'O0003','R0002');
/*!40000 ALTER TABLE `itemordered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `ItemID` char(5) NOT NULL,
  `ItemName` char(20) DEFAULT NULL,
  `ItemPrice` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES ('i0004','VegChickenBiriany',200),('i0001','Salad',20),('i0002','DalFry',100),('i0003','ZiraRice',100);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` varchar(5) NOT NULL,
  `pID` varchar(10) DEFAULT NULL,
  `dID` varchar(5) DEFAULT NULL,
  `CustomerID` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `pID` (`pID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`pID`) REFERENCES `paymentmanager` (`pID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('O0001','p000000001','d0002','00005'),('O0002','p000000004','d0001','00002'),('O0003','p000000003','d0003','00004');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmanager`
--

DROP TABLE IF EXISTS `paymentmanager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentmanager` (
  `pID` char(10) NOT NULL,
  `RefNo` char(65) DEFAULT NULL,
  `PaymentMode` char(3) DEFAULT NULL,
  PRIMARY KEY (`pID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmanager`
--

LOCK TABLES `paymentmanager` WRITE;
/*!40000 ALTER TABLE `paymentmanager` DISABLE KEYS */;
INSERT INTO `paymentmanager` VALUES ('p000000001','bbab398867f161dd2525bae010a54d7482ba455557e41e0b585c2f3d9b495eef','upi'),('p000000002','a3ee34e21eeb2b0ca08b35f21c29f4afa0f5d7f848e44339d861852bb68c0ef7','cc'),('p000000003','ff2082aaf2f21c61a417b23c200cea92cc0db93a8d150b6059755895ff362485','dc'),('p000000004','2d36dc81ffd565b27f542968887e77f40687c853bf3df543b30cdd7769487331','upi');
/*!40000 ALTER TABLE `paymentmanager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `RestaurantID` char(5) NOT NULL,
  `RestaurantName` varchar(5) DEFAULT NULL,
  `Area` char(10) DEFAULT NULL,
  PRIMARY KEY (`RestaurantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES ('R0001','Vilas','sector26'),('R0002','laxmi','sector27'),('R0003','pital','sector26'),('R0004','jb','sector21');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xyz`
--

DROP TABLE IF EXISTS `xyz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xyz` (
  `a1` int DEFAULT NULL,
  `a2` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xyz`
--

LOCK TABLES `xyz` WRITE;
/*!40000 ALTER TABLE `xyz` DISABLE KEYS */;
/*!40000 ALTER TABLE `xyz` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-28 21:26:48
