-- MySQL dump 10.13  Distrib 9.0.0, for Win64 (x86_64)
--
-- Host: localhost    Database: hoteldb
-- ------------------------------------------------------
-- Server version	9.0.0

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `BookingID` int NOT NULL,
  `ID` int NOT NULL,
  PRIMARY KEY (`BookingID`,`ID`),
  KEY `ID` (`ID`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `customer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,1001),(2,1002),(3,1003);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `HotelID` int DEFAULT NULL,
  `RoomID` int DEFAULT NULL,
  `CheckInDate` date DEFAULT NULL,
  `CheckOutDate` date DEFAULT NULL,
  `BookingDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('Confirmed','Cancelled','Completed') DEFAULT 'Confirmed',
  PRIMARY KEY (`BookingID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `HotelID` (`HotelID`),
  KEY `RoomID` (`RoomID`),
  KEY `idx_booking_checkin` (`CheckInDate`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`ID`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`),
  CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1001,1,1,'2025-04-01','2025-04-05','2025-03-25 10:00:00','Confirmed'),(2,1002,9,41,'2025-04-10','2025-04-15','2025-03-26 11:30:00','Completed'),(3,1003,17,81,'2025-05-01','2025-05-07','2025-03-27 09:15:00','Completed'),(4,1033,1,1,'2026-07-05','2026-07-06','2025-03-30 16:59:27','Completed'),(5,1034,4,17,'2026-08-30','2026-08-31','2025-03-30 17:02:19','Confirmed'),(6,1036,4,17,'2026-01-01','2026-02-01','2025-03-30 17:17:16','Completed'),(7,1037,1,1,'2026-06-06','2026-06-07','2025-03-30 17:19:55','Completed'),(8,1038,1,1,'2029-09-09','2029-09-10','2025-03-30 17:27:25','Confirmed'),(9,1039,1,1,'2027-07-07','2027-07-08','2025-03-30 17:36:21','Confirmed'),(10,1040,1,1,'2028-09-05','2028-09-06','2025-03-30 17:43:11','Confirmed'),(11,1042,1,1,'2025-07-07','2025-07-08','2025-03-30 17:50:56','Confirmed'),(12,1043,1,1,'2028-07-09','2028-07-10','2025-03-30 17:59:44','Confirmed'),(13,1044,1,1,'2027-06-06','2027-06-07','2025-03-30 18:04:35','Confirmed'),(14,1046,1,1,'2031-01-19','2031-01-20','2025-03-30 22:09:25','Confirmed'),(15,1047,2,6,'2046-04-03','2046-04-04','2025-03-31 00:28:25','Completed'),(16,1048,1,1,'2026-01-01','2026-01-02','2025-03-31 12:47:21','Completed'),(17,1049,10,48,'2026-01-01','2026-01-02','2025-03-31 12:52:52','Confirmed'),(18,1054,3,12,'2030-01-01','2030-02-01','2025-03-31 18:10:47','Completed'),(19,1055,1,1,'2029-03-02','2029-03-03','2025-03-31 18:12:24','Completed');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;

DELIMITER //

CREATE TRIGGER trg_max_active_bookings
BEFORE INSERT ON booking
FOR EACH ROW
BEGIN
    DECLARE active_booking_count INT;
    
    -- Count current active bookings for this customer
    -- Active = not cancelled and checkout date is in future
    SELECT COUNT(*) INTO active_booking_count
    FROM booking
    WHERE CustomerID = NEW.CustomerID
      AND Status != 'Cancelled'
      AND CheckOutDate >= CURDATE();
    
    -- Enforce maximum of 5 active bookings
    IF active_booking_count >= 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Booking limit exceeded: Maximum 5 active bookings allowed per customer';
    END IF;
END//

DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;

DELIMITER //

CREATE TRIGGER trg_no_employee_self_booking 
BEFORE INSERT ON booking 
FOR EACH ROW 
BEGIN
    DECLARE employee_hotel_id INT DEFAULT NULL;
    
    -- Check if the booking customer is an employee
    SELECT HotelID INTO employee_hotel_id
    FROM employee
    WHERE SSN = NEW.CustomerID;
    
    -- Prevent employees from booking at their own hotel
    IF employee_hotel_id IS NOT NULL AND employee_hotel_id = NEW.HotelID THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Conflict of interest: Employees cannot book rooms at their own hotel';
    END IF;
END //

DELIMITER ;

--
-- Table structure for table `chef`
--

DROP TABLE IF EXISTS `chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chef` (
  `SSN` int NOT NULL,
  `Specialty` varchar(100) DEFAULT NULL,
  `Shift` enum('Morning','Afternoon','Night') DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  CONSTRAINT `chef_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `employee` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chef`
--

LOCK TABLES `chef` WRITE;
/*!40000 ALTER TABLE `chef` DISABLE KEYS */;
INSERT INTO `chef` VALUES (777889999,'Italian','Morning'),(888990000,'French','Afternoon'),(999001111,'Asian Fusion','Night');
/*!40000 ALTER TABLE `chef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cleaner`
--

DROP TABLE IF EXISTS `cleaner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cleaner` (
  `SSN` int NOT NULL,
  `Shift` enum('Morning','Afternoon','Night') DEFAULT NULL,
  `SupervisorSSN` int DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  KEY `SupervisorSSN` (`SupervisorSSN`),
  CONSTRAINT `cleaner_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `employee` (`SSN`),
  CONSTRAINT `cleaner_ibfk_2` FOREIGN KEY (`SupervisorSSN`) REFERENCES `employee` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cleaner`
--

LOCK TABLES `cleaner` WRITE;
/*!40000 ALTER TABLE `cleaner` DISABLE KEYS */;
INSERT INTO `cleaner` VALUES (123456789,'Morning',111223333),(234567890,'Afternoon',111223333),(345678901,'Night',111223333);
/*!40000 ALTER TABLE `cleaner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) DEFAULT NULL,
  `MiddleName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `ZipCode` varchar(20) DEFAULT NULL,
  `RegistrationDate` date DEFAULT NULL,
  `IDType` varchar(50) NOT NULL,
  `IDNumber` varchar(100) NOT NULL,
  `CreditCardNumber` varchar(20) NOT NULL,
  `CreditCardExpiration` varchar(7) NOT NULL,
  `CreditCardCVC` varchar(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1057 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Hahvinaash','dfvfv','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','111223334','','',''),(1001,'John','A','Smith','California','Los Angeles','123 Main St','90001','2025-01-15','','','','',''),(1002,'Emily','B','Johnson','New York','New York City','456 Broadway','10001','2025-02-20','','','','',''),(1003,'Michael',NULL,'Williams','Florida','Miami','789 Ocean Dr','33101','2025-03-10','','','','',''),(1004,'Hahvinaash','vvtgfer','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','111223334','','',''),(1005,'Hahvinaash','324324','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','3243432','','',''),(1006,'32432434','32432432','43432432','456465','3243243','4324324','65465465','2025-03-30','Driver License','432423','','',''),(1007,'Hahvinaash','fgfdgdf','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','123123123','','',''),(1008,'Hahvinaash','ewew','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','2324343232','','',''),(1009,'Hello','Me','Hungry','qwerty','qwerty','8 Jalan Jitong, Seletar Hills Estate','123456','2025-03-30','SSN','123456789','','',''),(1010,'Hahvinaash','HELLOOOOOOOOO','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','12312312345','','',''),(1011,'23123131','232132','2342432','243','243243','43','242432','2025-03-30','SSN','432','','',''),(1012,'Hahvinaash','refref','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','12312312345','','',''),(1013,'HOOO','rfreer','freer','f','frefre','ferfrre','refref','2025-03-30','Driver License','refrefreferfrefre','','',''),(1014,'Hahvinaash','WOOP','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','Driver License','123','','',''),(1015,'Hahvinaash','wfewf','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','HELLO','','',''),(1016,'Hahvinaash','wfewf','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','123123123123','','',''),(1017,'Hahvinaash','wfewf','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','123123123123','','',''),(1018,'Hahvinaash',NULL,'Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','Driver License','09876543','','',''),(1019,'rtt','rg','rgtr','gtrgr','gtrgtr','tgtrrt','tgtr','2025-03-30','SSN','123345678910','','',''),(1020,'rtt','rg','rgtr','gtrgr','gtrgtr','tgtrrt','tgtr','2025-03-30','SSN','123345678910','','',''),(1021,'rtt','rg','rgtr','gtrgr','gtrgtr','tgtrrt','tgtr','2025-03-30','SSN','123345678910','','',''),(1022,'Hahvinaash','vfvfd','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','23','','',''),(1023,'Hahvinaash','vfvfd','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','23','','',''),(1024,'Hahvinaash','vfvfd','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','23','','',''),(1025,'Hahvinaash','fdvfd','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','3e','','',''),(1026,'Hahvinaash','fdvfd','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','3e','','',''),(1027,'Hahvinaash','fdvfd','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','3e','','',''),(1028,'fdvfd','fvfdvfdv','fdv','dvfdvfd','fdvfdvf','fdvfd','v','2025-03-30','SSN','435','','',''),(1029,'Hahvinaash','123','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','Hello','','',''),(1030,'Hahvinaash','123','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','123','','',''),(1031,'Hahvinaash','rtrt','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','098765123123123123311','','',''),(1032,'Hahvinaash','ferfr','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','Driver License','00000000000','','',''),(1033,'Hahvinaash','hhbhb','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','Passport','000','','',''),(1034,'Harshini','WO','Hahvinaash','edwe','wedew','MALAYSIA','809122','2025-03-30','Passport','906262589','','',''),(1035,'Hahvinaash','rfre','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','Driver License','Hello','','',''),(1036,'Hello','Hello','Hello','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','0','','',''),(1037,'Hahvinaash','HELLO','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','Driver License','000000000000889898000000000000000','','',''),(1038,'Hahvinaash','HELLO','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','35345435435435','2025-03-30','Other','98475394875498579875435','','',''),(1039,'Hahvinaash','freg','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','Driver License','9865','','',''),(1040,'Hahvinaash','fiuhgdg','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','Driver License','090','','',''),(1041,'Hahvinaash','jbjk','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','0060606060600','','',''),(1042,'Hahvinaash','jhbhj','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','Driver License','08080808080','','',''),(1043,'Hahvinaash','kjn','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','SSN','9090909090','','',''),(1044,'HELLOLOLOLOEOEE','gtgfgtg','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-30','Passport','09090909090990','','',''),(1045,'Hahvinaash','fgdgf','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-31','Passport','dsdfsdfdsfs','','',''),(1046,'Hahvinaash','retghrth','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-31','Other','rgrgre','','',''),(1047,'Hahvinaashh','uyhu','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-31','Driver License','35','','',''),(1048,'Hahvinaash','weewe','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-31','SSN','123','','',''),(1049,'Hahvinaash','erref','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-31','Passport','12324342','','',''),(1050,'HELLO','HELLO','HELLO','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-31','Driver License','eefjnrefirnefrnefre','','',''),(1051,'HELLO','HELLO','HELLO','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-31','Driver License','32432432','','',''),(1052,'Hahvinaash','HELLO','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-31','Passport','1231231232132132000000000','','',''),(1053,'HELLO','HELLO','HELLO','trgtr','rvr','HELLO','grtgt','2025-03-31','SSN','0101010101011001010101010','','',''),(1054,'Hahvinaash','sefsfefw','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-31','SSN','23423423423','3432432432432432','12/34','123'),(1055,'Hahvinaash','trgtrgt','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-31','SSN','0','0000000000000000','12/34','000'),(1056,'Hahvinaash','HELLO','Vijaykumarr','edwe','wedew','8 Jalan Jitong, Seletar Hills Estate','809122','2025-03-31','Driver License','32432432423','1234123412341234','2025-07','123');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `SSN` int NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `MiddleName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `ZipCode` varchar(20) DEFAULT NULL,
  `HotelID` int DEFAULT NULL,
  `Role` enum('Manager','Receptionist','Chef','Cleaner') DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  KEY `HotelID` (`HotelID`),
  KEY `idx_employee_hotel_name` (`HotelID`,`LastName`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (111223333,'Sarah','L','Wilson','California','Los Angeles','100 Employee St','90001',1,'Manager','2024-01-10',75000.00),(222334444,'David','M','Brown','California','Los Angeles','101 Employee St','90001',1,'Receptionist','2024-02-15',45000.00),(333445555,'Jessica',NULL,'Davis','New York','New York City','200 Employee Ave','10001',9,'Manager','2024-01-05',80000.00),(444556666,'Robert','K','Miller','New York','New York City','201 Employee Ave','10001',9,'Receptionist','2024-03-01',48000.00),(555667777,'Jennifer','N','Taylor','Florida','Miami','300 Employee Blvd','33101',17,'Manager','2024-02-01',78000.00),(666778888,'Thomas','P','Anderson','Florida','Miami','301 Employee Blvd','33101',17,'Receptionist','2024-03-15',46000.00);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `HotelID` int NOT NULL AUTO_INCREMENT,
  `HotelName` varchar(100) DEFAULT NULL,
  `HotelEmail` varchar(100) DEFAULT NULL,
  `HotelPhoneNo` varchar(15) DEFAULT NULL,
  `Rating` int DEFAULT NULL,
  `NumberOfRooms` int DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `ZipCode` varchar(20) DEFAULT NULL,
  `ChainID` int DEFAULT NULL,
  PRIMARY KEY (`HotelID`),
  KEY `hotel_ibfk_1` (`ChainID`),
  CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`ChainID`) REFERENCES `hotelchain` (`ChainID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hotel_chk_1` CHECK ((`Rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'Luxury Los Angeles','hotel1@chain1.com','123-456-1111',5,5,'California','Los Angeles','101 Main St','90002',1),(2,'Luxury Hollywood','hotel2@chain1.com','123-456-1112',4,5,'California','Los Angeles','102 Main St','90002',1),(3,'Comfort LA','hotel3@chain1.com','123-456-1113',3,5,'California','Los Angeles','103 Main St','90002',1),(4,'Premium LA','hotel4@chain1.com','123-456-1114',5,5,'California','Los Angeles','104 Main St','90002',1),(5,'Luxury Beverly Hills','hotel5@chain1.com','123-456-1115',4,5,'California','Los Angeles','105 Main St','90002',1),(6,'Luxury Downtown','hotel6@chain1.com','123-456-1116',4,5,'California','Los Angeles','106 Main St','90002',1),(7,'Budget LA','hotel7@chain1.com','123-456-1117',3,5,'California','Los Angeles','107 Main St','90002',1),(8,'Luxury Westside','hotel8@chain1.com','123-456-1118',5,5,'California','Los Angeles','108 Main St','90002',1),(9,'Grand Manhattan','hotel1@chain2.com','234-567-1111',5,5,'New York','New York City','201 Broadway','10002',2),(10,'Grand Times Square','hotel2@chain2.com','234-567-1112',4,5,'New York','New York City','202 Broadway','10002',2),(11,'Comfort NYC','hotel3@chain2.com','234-567-1113',3,5,'New York','New York City','203 Broadway','10002',2),(12,'Premium NYC','hotel4@chain2.com','234-567-1114',5,5,'New York','New York City','204 Broadway','10002',2),(13,'Grand Central','hotel5@chain2.com','234-567-1115',4,5,'New York','New York City','205 Broadway','10002',2),(14,'Grand Midtown','hotel6@chain2.com','234-567-1116',4,5,'New York','New York City','206 Broadway','10002',2),(15,'Budget NYC','hotel7@chain2.com','234-567-1117',3,5,'New York','New York City','207 Broadway','10002',2),(16,'Grand Brooklyn','hotel8@chain2.com','234-567-1118',5,5,'New York','New York City','208 Broadway','10002',2),(17,'Oceanview Miami','hotel1@chain3.com','345-678-1111',5,5,'Florida','Miami','301 Ocean Dr','33101',3),(18,'Oceanview South Beach','hotel2@chain3.com','345-678-1112',4,5,'Florida','Miami','302 Ocean Dr','33101',3),(19,'Comfort Miami','hotel3@chain3.com','345-678-1113',3,5,'Florida','Miami','303 Ocean Dr','33101',3),(20,'Premium Miami','hotel4@chain3.com','345-678-1114',5,5,'Florida','Miami','304 Ocean Dr','33101',3),(21,'Oceanview Biscayne','hotel5@chain3.com','345-678-1115',4,5,'Florida','Miami','305 Ocean Dr','33101',3),(22,'Oceanview Downtown','hotel6@chain3.com','345-678-1116',4,5,'Florida','Miami','306 Ocean Dr','33101',3),(23,'Budget Miami','hotel7@chain3.com','345-678-1117',3,5,'Florida','Miami','307 Ocean Dr','33101',3),(24,'Oceanview Key','hotel8@chain3.com','345-678-1118',5,5,'Florida','Miami','308 Ocean Dr','33101',3),(25,'Texas Premier','hotel1@chain4.com','456-789-1111',5,5,'Texas','Dallas','401 Elm St','75201',4),(26,'Texas Comfort','hotel2@chain4.com','456-789-1112',4,5,'Texas','Dallas','402 Elm St','75201',4),(27,'Comfort Dallas','hotel3@chain4.com','456-789-1113',3,5,'Texas','Dallas','403 Elm St','75201',4),(28,'Premium Dallas','hotel4@chain4.com','456-789-1114',5,5,'Texas','Dallas','404 Elm St','75201',4),(29,'Texas Downtown','hotel5@chain4.com','456-789-1115',4,5,'Texas','Dallas','405 Elm St','75201',4),(30,'Texas Uptown','hotel6@chain4.com','456-789-1116',4,5,'Texas','Dallas','406 Elm St','75201',4),(31,'Budget Dallas','hotel7@chain4.com','456-789-1117',3,5,'Texas','Dallas','407 Elm St','75201',4),(32,'Texas Luxury','hotel8@chain4.com','456-789-1118',5,5,'Texas','Dallas','408 Elm St','75201',4),(33,'Vegas Strip','hotel1@chain5.com','567-890-1111',5,5,'Nevada','Las Vegas','501 Vegas Blvd','89101',5),(34,'Vegas Premium','hotel2@chain5.com','567-890-1112',4,5,'Nevada','Las Vegas','502 Vegas Blvd','89101',5),(35,'Comfort Vegas','hotel3@chain5.com','567-890-1113',3,5,'Nevada','Las Vegas','503 Vegas Blvd','89101',5),(36,'Vegas Luxury','hotel4@chain5.com','567-890-1114',5,5,'Nevada','Las Vegas','504 Vegas Blvd','89101',5),(37,'Vegas Downtown','hotel5@chain5.com','567-890-1115',4,5,'Nevada','Las Vegas','505 Vegas Blvd','89101',5),(38,'Vegas Central','hotel6@chain5.com','567-890-1116',4,5,'Nevada','Las Vegas','506 Vegas Blvd','89101',5),(39,'Budget Vegas','hotel7@chain5.com','567-890-1117',3,5,'Nevada','Las Vegas','507 Vegas Blvd','89101',5),(40,'Vegas Elite','hotel8@chain5.com','567-890-1118',5,5,'Nevada','Las Vegas','508 Vegas Blvd','89101',5);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelchain`
--

DROP TABLE IF EXISTS `hotelchain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotelchain` (
  `ChainID` int NOT NULL AUTO_INCREMENT,
  `ChainName` varchar(100) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `NumberOfHotels` int DEFAULT NULL,
  `ChainEmail` varchar(100) DEFAULT NULL,
  `ChainPhoneNo` varchar(15) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `ZipCode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ChainID`),
  CONSTRAINT `hotelchain_chk_1` CHECK ((`NumberOfHotels` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelchain`
--

LOCK TABLES `hotelchain` WRITE;
/*!40000 ALTER TABLE `hotelchain` DISABLE KEYS */;
INSERT INTO `hotelchain` VALUES (1,'Luxury Hotels','California',8,'contact@chain1.com','123-456-7890','Los Angeles','123 Sunset Blvd','90001'),(2,'Grand Hotels','New York',8,'contact@chain2.com','234-567-8901','New York City','456 Broadway','10001'),(3,'Oceanview Resorts','Florida',8,'contact@chain3.com','345-678-9012','Miami','789 Ocean Drive','33101'),(4,'Texas Hospitality','Texas',8,'contact@chain4.com','456-789-0123','Dallas','123 Elm St','75201'),(5,'Vegas Stays','Nevada',8,'contact@chain5.com','567-890-1234','Las Vegas','101 Vegas Blvd','89101');
/*!40000 ALTER TABLE `hotelchain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `SSN` int NOT NULL,
  `Department` varchar(100) DEFAULT NULL,
  `ManagementLevel` int DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `employee` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (111223333,'Operations',2),(333445555,'Operations',2),(555667777,'Operations',2);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `RentingID` int DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `PaymentDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `PaymentMethod` enum('Cash','Credit Card','Debit Card','Bank Transfer') DEFAULT NULL,
  `EmployeeID` int DEFAULT NULL,
  `ReceiptNumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `RentingID` (`RentingID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`RentingID`) REFERENCES `renting` (`RentingID`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`SSN`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,250.00,'2025-03-28 14:30:00','Credit Card',222334444,'RC-2025-0001'),(2,1,250.00,'2025-03-29 10:00:00','Credit Card',222334444,'RC-2025-0002'),(3,2,450.00,'2025-03-29 16:00:00','Debit Card',444556666,'RC-2025-0003'),(4,2,450.00,'2025-03-30 11:00:00','Debit Card',444556666,'RC-2025-0004');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receptionist`
--

DROP TABLE IF EXISTS `receptionist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receptionist` (
  `SSN` int NOT NULL,
  `Shift` enum('Morning','Afternoon','Night') DEFAULT NULL,
  `CanProcessPayments` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`SSN`),
  CONSTRAINT `receptionist_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `employee` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receptionist`
--

LOCK TABLES `receptionist` WRITE;
/*!40000 ALTER TABLE `receptionist` DISABLE KEYS */;
INSERT INTO `receptionist` VALUES (222334444,'Morning',1),(444556666,'Afternoon',1),(666778888,'Night',1);
/*!40000 ALTER TABLE `receptionist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rent`
--

DROP TABLE IF EXISTS `rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rent` (
  `RentingID` int NOT NULL,
  `ID` int NOT NULL,
  PRIMARY KEY (`RentingID`,`ID`),
  KEY `ID` (`ID`),
  CONSTRAINT `rent_ibfk_1` FOREIGN KEY (`RentingID`) REFERENCES `renting` (`RentingID`),
  CONSTRAINT `rent_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `customer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent`
--

LOCK TABLES `rent` WRITE;
/*!40000 ALTER TABLE `rent` DISABLE KEYS */;
INSERT INTO `rent` VALUES (1,1001),(2,1002);
/*!40000 ALTER TABLE `rent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `renting`
--

DROP TABLE IF EXISTS `renting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `renting` (
  `RentingID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `HotelID` int DEFAULT NULL,
  `RoomID` int DEFAULT NULL,
  `RentingDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CheckInDate` date DEFAULT NULL,
  `CheckOutDate` date DEFAULT NULL,
  `TotalPrice` decimal(10,2) DEFAULT NULL,
  `Status` enum('Active','Completed','Cancelled') DEFAULT 'Active',
  `EmployeeID` int DEFAULT NULL,
  PRIMARY KEY (`RentingID`),
  KEY `renting_ibfk_1` (`HotelID`),
  KEY `renting_ibfk_2` (`CustomerID`),
  KEY `renting_ibfk_3` (`RoomID`),
  KEY `renting_ibfk_4` (`EmployeeID`),
  CONSTRAINT `renting_ibfk_1` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`) ON DELETE CASCADE,
  CONSTRAINT `renting_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`ID`),
  CONSTRAINT `renting_ibfk_3` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`),
  CONSTRAINT `renting_ibfk_4` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`SSN`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `renting`
--

LOCK TABLES `renting` WRITE;
/*!40000 ALTER TABLE `renting` DISABLE KEYS */;
INSERT INTO `renting` VALUES (1,1001,1,1,'2025-03-28 14:00:00','2025-03-28','2025-04-02',500.00,'Active',222334444),(2,1002,9,41,'2025-03-29 15:30:00','2025-03-29','2025-04-03',900.00,'Active',444556666),(8,1047,2,6,'2025-03-31 12:43:12','2046-04-03','2046-04-04',110.00,'Active',222334444),(9,1002,9,41,'2025-03-31 12:45:57','2025-04-10','2025-04-15',650.00,'Active',222334444),(10,1048,1,1,'2025-03-31 12:48:38','2026-01-01','2026-01-02',100.00,'Active',222334444),(11,1003,17,81,'2025-03-31 13:10:44','2025-05-01','2025-05-07',660.00,'Active',222334444),(12,1036,4,17,'2025-03-31 13:38:50','2026-01-01','2026-02-01',5580.00,'Active',222334444),(13,1033,1,1,'2025-03-31 13:43:39','2026-07-05','2026-07-06',100.00,'Active',222334444),(14,1037,1,1,'2025-03-31 14:04:59','2026-06-06','2026-06-07',100.00,'Active',222334444),(15,1055,1,1,'2025-03-31 18:13:34','2029-03-02','2029-03-03',100.00,'Active',222334444),(16,1056,16,77,'2025-03-31 18:59:28','2025-03-31','2025-04-01',150.00,'Active',222334444),(17,1054,3,12,'2025-03-31 19:01:41','2030-01-01','2030-02-01',5270.00,'Active',222334444);
/*!40000 ALTER TABLE `renting` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;

DELIMITER //

CREATE TRIGGER trg_calculate_renting_price
BEFORE INSERT ON renting
FOR EACH ROW
BEGIN
    DECLARE room_price DECIMAL(10,2);
    DECLARE num_days INT;
    
    -- Get the current price of the room
    SELECT Price INTO room_price
    FROM room
    WHERE RoomID = NEW.RoomID;
    
    -- Calculate duration of stay in days
    SET num_days = DATEDIFF(NEW.CheckOutDate, NEW.CheckInDate);
    
    -- Calculate total price (price × duration)
    SET NEW.TotalPrice = room_price * num_days;
END//

DELIMITER ;

/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `ID` int NOT NULL,
  `RentingID` int NOT NULL,
  PRIMARY KEY (`ID`,`RentingID`),
  KEY `RentingID` (`RentingID`),
  CONSTRAINT `request_ibfk_1` FOREIGN KEY (`RentingID`) REFERENCES `renting` (`RentingID`),
  CONSTRAINT `request_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `customer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--


LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1001,1),(1002,2);
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `RoomID` int NOT NULL AUTO_INCREMENT,
  `HotelID` int DEFAULT NULL,
  `RoomNumber` int DEFAULT NULL,
  `Capacity` varchar(50) DEFAULT NULL,
  `SeaView` tinyint(1) DEFAULT NULL,
  `MountainView` tinyint(1) DEFAULT NULL,
  `Extendable` tinyint(1) DEFAULT NULL,
  `Damaged` tinyint(1) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Amenities` text,
  `Floor` int DEFAULT NULL,
  `LastMaintenanceDate` date DEFAULT NULL,
  PRIMARY KEY (`RoomID`),
  KEY `HotelID` (`HotelID`),
  KEY `idx_room_hotel_capacity` (`HotelID`,`Capacity`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--



LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,1,101,'Single',1,0,1,0,100.00,'WiFi, AC',1,'2025-03-01'),(2,1,102,'Double',1,0,1,0,150.00,'WiFi, AC, TV',1,'2025-03-05'),(3,1,103,'Suite',1,1,1,0,200.00,'WiFi, AC, TV, Jacuzzi',1,'2025-03-10'),(4,1,104,'Single',0,0,0,1,80.00,'WiFi, AC',1,'2025-03-15'),(5,1,105,'Family',1,1,1,0,250.00,'WiFi, AC, TV, Kitchen',1,'2025-03-20'),(6,2,201,'Single',0,1,1,0,110.00,'WiFi, AC',2,'2025-03-02'),(7,2,202,'Double',0,1,1,0,160.00,'WiFi, AC, TV',2,'2025-03-06'),(8,2,203,'Suite',1,0,1,0,210.00,'WiFi, AC, TV, Jacuzzi',2,'2025-03-11'),(9,2,204,'Single',1,1,0,1,85.00,'WiFi, AC',2,'2025-03-16'),(10,2,205,'Family',1,1,1,0,240.00,'WiFi, AC, TV, Kitchen',2,'2025-03-21'),(11,3,301,'Single',1,0,1,0,120.00,'WiFi, AC',3,'2025-03-03'),(12,3,302,'Double',1,0,1,0,170.00,'WiFi, AC, TV',3,'2025-03-07'),(13,3,303,'Suite',0,1,1,0,220.00,'WiFi, AC, TV, Jacuzzi',3,'2025-03-12'),(14,3,304,'Single',0,0,0,1,90.00,'WiFi, AC',3,'2025-03-17'),(15,3,305,'Family',1,1,1,0,230.00,'WiFi, AC, TV, Kitchen',3,'2025-03-22'),(16,4,401,'Single',1,0,1,0,130.00,'WiFi, AC',4,'2025-03-04'),(17,4,402,'Double',1,0,1,0,180.00,'WiFi, AC, TV',4,'2025-03-08'),(18,4,403,'Suite',1,1,1,0,230.00,'WiFi, AC, TV, Jacuzzi',4,'2025-03-13'),(19,4,404,'Single',0,1,0,1,95.00,'WiFi, AC',4,'2025-03-18'),(20,4,405,'Family',1,1,1,0,220.00,'WiFi, AC, TV, Kitchen',4,'2025-03-23'),(21,5,501,'Single',1,0,1,0,140.00,'WiFi, AC',5,'2025-03-05'),(22,5,502,'Double',1,0,1,0,190.00,'WiFi, AC, TV',5,'2025-03-09'),(23,5,503,'Suite',1,1,1,0,240.00,'WiFi, AC, TV, Jacuzzi',5,'2025-03-14'),(24,5,504,'Single',0,0,0,1,100.00,'WiFi, AC',5,'2025-03-19'),(25,5,505,'Family',1,1,1,0,250.00,'WiFi, AC, TV, Kitchen',5,'2025-03-24'),(26,6,101,'Single',1,0,1,0,100.00,'WiFi, AC',1,'2025-03-01'),(27,6,102,'Double',1,0,1,0,150.00,'WiFi, AC, TV',1,'2025-03-05'),(28,6,103,'Suite',1,1,1,0,200.00,'WiFi, AC, TV, Jacuzzi',1,'2025-03-10'),(29,6,104,'Single',0,0,0,1,80.00,'WiFi, AC',1,'2025-03-15'),(30,6,105,'Family',1,1,1,0,250.00,'WiFi, AC, TV, Kitchen',1,'2025-03-20'),(31,7,201,'Single',0,1,1,0,110.00,'WiFi, AC',2,'2025-03-02'),(32,7,202,'Double',0,1,1,0,160.00,'WiFi, AC, TV',2,'2025-03-06'),(33,7,203,'Suite',1,0,1,0,210.00,'WiFi, AC, TV, Jacuzzi',2,'2025-03-11'),(34,7,204,'Single',1,1,0,1,85.00,'WiFi, AC',2,'2025-03-16'),(35,7,205,'Family',1,1,1,0,240.00,'WiFi, AC, TV, Kitchen',2,'2025-03-21'),(36,8,301,'Single',1,0,1,0,120.00,'WiFi, AC',3,'2025-03-03'),(37,8,302,'Double',1,0,1,0,170.00,'WiFi, AC, TV',3,'2025-03-07'),(38,8,303,'Suite',0,1,1,0,220.00,'WiFi, AC, TV, Jacuzzi',3,'2025-03-12'),(39,8,304,'Single',0,0,0,1,90.00,'WiFi, AC',3,'2025-03-17'),(40,8,305,'Family',1,1,1,0,230.00,'WiFi, AC, TV, Kitchen',3,'2025-03-22'),(41,9,401,'Single',1,0,1,0,130.00,'WiFi, AC',4,'2025-03-04'),(42,9,402,'Double',1,0,1,0,180.00,'WiFi, AC, TV',4,'2025-03-08'),(43,9,403,'Suite',1,1,1,0,230.00,'WiFi, AC, TV, Jacuzzi',4,'2025-03-13'),(44,9,404,'Single',0,1,0,1,95.00,'WiFi, AC',4,'2025-03-18'),(45,9,405,'Family',1,1,1,0,220.00,'WiFi, AC, TV, Kitchen',4,'2025-03-23'),(46,10,501,'Single',1,0,1,0,140.00,'WiFi, AC',5,'2025-03-05'),(47,10,502,'Double',1,0,1,0,190.00,'WiFi, AC, TV',5,'2025-03-09'),(48,10,503,'Suite',1,1,1,0,240.00,'WiFi, AC, TV, Jacuzzi',5,'2025-03-14'),(49,10,504,'Single',0,0,0,1,100.00,'WiFi, AC',5,'2025-03-19'),(50,10,505,'Family',1,1,1,0,250.00,'WiFi, AC, TV, Kitchen',5,'2025-03-24'),(51,11,101,'Single',1,0,1,0,100.00,'WiFi, AC',1,'2025-03-01'),(52,11,102,'Double',1,0,1,0,150.00,'WiFi, AC, TV',1,'2025-03-05'),(53,11,103,'Suite',1,1,1,0,200.00,'WiFi, AC, TV, Jacuzzi',1,'2025-03-10'),(54,11,104,'Single',0,0,0,1,80.00,'WiFi, AC',1,'2025-03-15'),(55,11,105,'Family',1,1,1,0,250.00,'WiFi, AC, TV, Kitchen',1,'2025-03-20'),(56,12,201,'Single',0,1,1,0,110.00,'WiFi, AC',2,'2025-03-02'),(57,12,202,'Double',0,1,1,0,160.00,'WiFi, AC, TV',2,'2025-03-06'),(58,12,203,'Suite',1,0,1,0,210.00,'WiFi, AC, TV, Jacuzzi',2,'2025-03-11'),(59,12,204,'Single',1,1,0,1,85.00,'WiFi, AC',2,'2025-03-16'),(60,12,205,'Family',1,1,1,0,240.00,'WiFi, AC, TV, Kitchen',2,'2025-03-21'),(61,13,301,'Single',1,0,1,0,120.00,'WiFi, AC',3,'2025-03-03'),(62,13,302,'Double',1,0,1,0,170.00,'WiFi, AC, TV',3,'2025-03-07'),(63,13,303,'Suite',0,1,1,0,220.00,'WiFi, AC, TV, Jacuzzi',3,'2025-03-12'),(64,13,304,'Single',0,0,0,1,90.00,'WiFi, AC',3,'2025-03-17'),(65,13,305,'Family',1,1,1,0,230.00,'WiFi, AC, TV, Kitchen',3,'2025-03-22'),(66,14,401,'Single',1,0,1,0,130.00,'WiFi, AC',4,'2025-03-04'),(67,14,402,'Double',1,0,1,0,180.00,'WiFi, AC, TV',4,'2025-03-08'),(68,14,403,'Suite',1,1,1,0,230.00,'WiFi, AC, TV, Jacuzzi',4,'2025-03-13'),(69,14,404,'Single',0,1,0,1,95.00,'WiFi, AC',4,'2025-03-18'),(70,14,405,'Family',1,1,1,0,220.00,'WiFi, AC, TV, Kitchen',4,'2025-03-23'),(71,15,501,'Single',1,0,1,0,140.00,'WiFi, AC',5,'2025-03-05'),(72,15,502,'Double',1,0,1,0,190.00,'WiFi, AC, TV',5,'2025-03-09'),(73,15,503,'Suite',1,1,1,0,240.00,'WiFi, AC, TV, Jacuzzi',5,'2025-03-14'),(74,15,504,'Single',0,0,0,1,100.00,'WiFi, AC',5,'2025-03-19'),(75,15,505,'Family',1,1,1,0,250.00,'WiFi, AC, TV, Kitchen',5,'2025-03-24'),(76,16,101,'Single',1,0,1,0,100.00,'WiFi, AC',1,'2025-03-01'),(77,16,102,'Double',1,0,1,0,150.00,'WiFi, AC, TV',1,'2025-03-05'),(78,16,103,'Suite',1,1,1,0,200.00,'WiFi, AC, TV, Jacuzzi',1,'2025-03-10'),(79,16,104,'Single',0,0,0,1,80.00,'WiFi, AC',1,'2025-03-15'),(80,16,105,'Family',1,1,1,0,250.00,'WiFi, AC, TV, Kitchen',1,'2025-03-20'),(81,17,201,'Single',0,1,1,0,110.00,'WiFi, AC',2,'2025-03-02'),(82,17,202,'Double',0,1,1,0,160.00,'WiFi, AC, TV',2,'2025-03-06'),(83,17,203,'Suite',1,0,1,0,210.00,'WiFi, AC, TV, Jacuzzi',2,'2025-03-11'),(84,17,204,'Single',1,1,0,1,85.00,'WiFi, AC',2,'2025-03-16'),(85,17,205,'Family',1,1,1,0,240.00,'WiFi, AC, TV, Kitchen',2,'2025-03-21'),(86,18,301,'Single',1,0,1,0,120.00,'WiFi, AC',3,'2025-03-03'),(87,18,302,'Double',1,0,1,0,170.00,'WiFi, AC, TV',3,'2025-03-07'),(88,18,303,'Suite',0,1,1,0,220.00,'WiFi, AC, TV, Jacuzzi',3,'2025-03-12'),(89,18,304,'Single',0,0,0,1,90.00,'WiFi, AC',3,'2025-03-17'),(90,18,305,'Family',1,1,1,0,230.00,'WiFi, AC, TV, Kitchen',3,'2025-03-22'),(91,19,401,'Single',1,0,1,0,130.00,'WiFi, AC',4,'2025-03-04'),(92,19,402,'Double',1,0,1,0,180.00,'WiFi, AC, TV',4,'2025-03-08'),(93,19,403,'Suite',1,1,1,0,230.00,'WiFi, AC, TV, Jacuzzi',4,'2025-03-13'),(94,19,404,'Single',0,1,0,1,95.00,'WiFi, AC',4,'2025-03-18'),(95,19,405,'Family',1,1,1,0,220.00,'WiFi, AC, TV, Kitchen',4,'2025-03-23'),(96,20,501,'Single',1,0,1,0,140.00,'WiFi, AC',5,'2025-03-05'),(97,20,502,'Double',1,0,1,0,190.00,'WiFi, AC, TV',5,'2025-03-09'),(98,20,503,'Suite',1,1,1,0,240.00,'WiFi, AC, TV, Jacuzzi',5,'2025-03-14'),(99,20,504,'Single',0,0,0,1,100.00,'WiFi, AC',5,'2025-03-19'),(100,20,505,'Family',1,1,1,0,250.00,'WiFi, AC, TV, Kitchen',5,'2025-03-24'),(101,21,101,'Single',1,0,1,0,100.00,'WiFi, AC',1,'2025-03-01'),(102,21,102,'Double',1,0,1,0,150.00,'WiFi, AC, TV',1,'2025-03-05'),(103,21,103,'Suite',1,1,1,0,200.00,'WiFi, AC, TV, Jacuzzi',1,'2025-03-10'),(104,21,104,'Single',0,0,0,1,80.00,'WiFi, AC',1,'2025-03-15'),(105,21,105,'Family',1,1,1,0,250.00,'WiFi, AC, TV, Kitchen',1,'2025-03-20'),(106,22,201,'Single',0,1,1,0,110.00,'WiFi, AC',2,'2025-03-02'),(107,22,202,'Double',0,1,1,0,160.00,'WiFi, AC, TV',2,'2025-03-06'),(108,22,203,'Suite',1,0,1,0,210.00,'WiFi, AC, TV, Jacuzzi',2,'2025-03-11'),(109,22,204,'Single',1,1,0,1,85.00,'WiFi, AC',2,'2025-03-16'),(110,22,205,'Family',1,1,1,0,240.00,'WiFi, AC, TV, Kitchen',2,'2025-03-21'),(111,23,301,'Single',1,0,1,0,120.00,'WiFi, AC',3,'2025-03-03'),(112,23,302,'Double',1,0,1,0,170.00,'WiFi, AC, TV',3,'2025-03-07'),(113,23,303,'Suite',0,1,1,0,220.00,'WiFi, AC, TV, Jacuzzi',3,'2025-03-12'),(114,23,304,'Single',0,0,0,1,90.00,'WiFi, AC',3,'2025-03-17'),(115,23,305,'Family',1,1,1,0,230.00,'WiFi, AC, TV, Kitchen',3,'2025-03-22'),(116,24,401,'Single',1,0,1,0,130.00,'WiFi, AC',4,'2025-03-04'),(117,24,402,'Double',1,0,1,0,180.00,'WiFi, AC, TV',4,'2025-03-08'),(118,24,403,'Suite',1,1,1,0,230.00,'WiFi, AC, TV, Jacuzzi',4,'2025-03-13'),(119,24,404,'Single',0,1,0,1,95.00,'WiFi, AC',4,'2025-03-18'),(120,24,405,'Family',1,1,1,0,220.00,'WiFi, AC, TV, Kitchen',4,'2025-03-23'),(121,25,501,'Single',1,0,1,0,140.00,'WiFi, AC',5,'2025-03-05'),(122,25,502,'Double',1,0,1,0,190.00,'WiFi, AC, TV',5,'2025-03-09'),(123,25,503,'Suite',1,1,1,0,240.00,'WiFi, AC, TV, Jacuzzi',5,'2025-03-14'),(124,25,504,'Single',0,0,0,1,100.00,'WiFi, AC',5,'2025-03-19'),(125,25,505,'Family',1,1,1,0,250.00,'WiFi, AC, TV, Kitchen',5,'2025-03-24');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;
-- Update any existing records that might have null capacity_num

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;

DELIMITER //

CREATE TRIGGER trg_update_room_status_after_maintenance
AFTER UPDATE ON room
FOR EACH ROW
BEGIN
    -- Check if maintenance was performed on a damaged room
    IF NEW.LastMaintenanceDate <> OLD.LastMaintenanceDate AND OLD.Damaged = 1 THEN
        -- If maintenance was done within the last 7 days, mark room as repaired
        IF DATEDIFF(CURDATE(), NEW.LastMaintenanceDate) <= 7 THEN
            UPDATE room 
            SET Damaged = 0 
            WHERE RoomID = NEW.RoomID;
        END IF;
    END IF;
END//


DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `transform`
--

DROP TABLE IF EXISTS `transform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transform` (
  `RentingID` int NOT NULL,
  `BookingID` int NOT NULL,
  `CheckInDate` date DEFAULT NULL,
  `EmployeeID` int DEFAULT NULL,
  `TransformDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`RentingID`,`BookingID`),
  KEY `BookingID` (`BookingID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `transform_ibfk_1` FOREIGN KEY (`RentingID`) REFERENCES `renting` (`RentingID`),
  CONSTRAINT `transform_ibfk_2` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`),
  CONSTRAINT `transform_ibfk_3` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transform`
--

LOCK TABLES `transform` WRITE;
/*!40000 ALTER TABLE `transform` DISABLE KEYS */;
INSERT INTO `transform` VALUES (1,1,'2025-03-28',222334444,'2025-03-28 14:00:00'),(8,15,'2046-04-03',222334444,'2025-03-31 12:43:12'),(9,2,'2025-04-10',222334444,'2025-03-31 12:45:57'),(10,16,'2026-01-01',222334444,'2025-03-31 12:48:38'),(11,3,'2025-05-01',222334444,'2025-03-31 13:10:44'),(12,6,'2026-01-01',222334444,'2025-03-31 13:38:50'),(13,4,'2026-07-05',222334444,'2025-03-31 13:43:39'),(14,7,'2026-06-06',222334444,'2025-03-31 14:04:59'),(15,19,'2029-03-02',222334444,'2025-03-31 18:13:34'),(17,18,'2030-01-01',222334444,'2025-03-31 19:01:41');
/*!40000 ALTER TABLE `transform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_available_rooms_by_area`
--

DROP TABLE IF EXISTS `vw_available_rooms_by_area`;
/*!50001 DROP VIEW IF EXISTS `vw_available_rooms_by_area`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_available_rooms_by_area` AS SELECT 
 1 AS `HotelID`,
 1 AS `HotelName`,
 1 AS `State`,
 1 AS `City`,
 1 AS `RoomID`,
 1 AS `RoomNumber`,
 1 AS `Capacity`,
 1 AS `Price`,
 1 AS `Amenities`,
 1 AS `ChainName`,
 1 AS `HotelRating`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_employee_permissions`
--

DROP TABLE IF EXISTS `vw_employee_permissions`;
/*!50001 DROP VIEW IF EXISTS `vw_employee_permissions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_employee_permissions` AS SELECT 
 1 AS `SSN`,
 1 AS `EmployeeName`,
 1 AS `Role`,
 1 AS `HotelName`,
 1 AS `City`,
 1 AS `State`,
 1 AS `CanProcessPayments`,
 1 AS `SystemAccessLevel`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_hotel_capacity_summary`
--

DROP TABLE IF EXISTS `vw_hotel_capacity_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_hotel_capacity_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_hotel_capacity_summary` AS SELECT 
 1 AS `HotelID`,
 1 AS `HotelName`,
 1 AS `City`,
 1 AS `State`,
 1 AS `ChainName`,
 1 AS `Capacity`,
 1 AS `TotalRooms`,
 1 AS `AvailableRooms`,
 1 AS `DamagedRooms`,
 1 AS `MinPrice`,
 1 AS `MaxPrice`,
 1 AS `AvgPrice`,
 1 AS `AmenitiesList`*/;
SET character_set_client = @saved_cs_client;

--
-- Drop existing views
DROP VIEW IF EXISTS vw_available_rooms_by_area;
DROP VIEW IF EXISTS vw_total_capacity_per_hotel;

-- Fixed available rooms view
CREATE OR REPLACE VIEW vw_available_rooms_by_area AS
SELECT 
    h.State AS area,
    COUNT(r.RoomID) AS available_rooms
FROM Hotel h
JOIN Room r ON h.HotelID = r.HotelID
WHERE r.RoomID NOT IN (
    -- All rooms that have ever been booked (regardless of dates)
    SELECT DISTINCT RoomID FROM Booking
)
AND r.RoomID NOT IN (
    -- All rooms that have ever been rented (regardless of dates)
    SELECT DISTINCT RoomID FROM Renting
)
AND r.Damaged = 0 -- Still exclude damaged rooms
GROUP BY h.State;

-- Hotel capacity view
CREATE OR REPLACE VIEW vw_total_capacity_per_hotel AS
SELECT 
    h.HotelName AS hotel_name,
    SUM(CASE 
        WHEN r.Capacity = 'Single' THEN 1
        WHEN r.Capacity = 'Double' THEN 2
        WHEN r.Capacity = 'Family' THEN 4
        WHEN r.Capacity = 'Suite' THEN 2
        ELSE 0
    END) AS total_capacity,
    SUM(CASE 
        WHEN r.Capacity = 'Single' THEN 1
        WHEN r.Capacity = 'Double' THEN 2
        WHEN r.Capacity = 'Family' THEN 4
        WHEN r.Capacity = 'Suite' THEN 2
        ELSE 0
    END) / COUNT(r.RoomID) AS aggregated_capacity
FROM Hotel h
JOIN Room r ON h.HotelID = r.HotelID
GROUP BY h.HotelName;

-- Temporary view structure for view `vw_renting_payment_status`
--

DROP TABLE IF EXISTS `vw_renting_payment_status`;
/*!50001 DROP VIEW IF EXISTS `vw_renting_payment_status`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_renting_payment_status` AS SELECT 
 1 AS `RentingID`,
 1 AS `CustomerName`,
 1 AS `HotelName`,
 1 AS `RoomNumber`,
 1 AS `CheckInDate`,
 1 AS `CheckOutDate`,
 1 AS `TotalPrice`,
 1 AS `AmountPaid`,
 1 AS `BalanceDue`,
 1 AS `PaymentStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_available_rooms_by_area`
--

/*!50001 DROP VIEW IF EXISTS `vw_available_rooms_by_area`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_available_rooms_by_area` AS select `h`.`HotelID` AS `HotelID`,`h`.`HotelName` AS `HotelName`,`h`.`State` AS `State`,`h`.`City` AS `City`,`r`.`RoomID` AS `RoomID`,`r`.`RoomNumber` AS `RoomNumber`,`r`.`Capacity` AS `Capacity`,`r`.`Price` AS `Price`,`r`.`Amenities` AS `Amenities`,`hc`.`ChainName` AS `ChainName`,`h`.`Rating` AS `HotelRating` from ((`room` `r` join `hotel` `h` on((`r`.`HotelID` = `h`.`HotelID`))) join `hotelchain` `hc` on((`h`.`ChainID` = `hc`.`ChainID`))) where ((`r`.`Damaged` = 0) and exists(select 1 from `renting` `rg` where ((`rg`.`RoomID` = `r`.`RoomID`) and (`rg`.`Status` = 'Active') and (((`rg`.`CheckInDate` <= curdate()) and (`rg`.`CheckOutDate` >= curdate())) or (`rg`.`CheckInDate` between curdate() and (curdate() + interval 30 day))))) is false and exists(select 1 from `booking` `b` where ((`b`.`RoomID` = `r`.`RoomID`) and (`b`.`Status` = 'Confirmed') and (((`b`.`CheckInDate` <= curdate()) and (`b`.`CheckOutDate` >= curdate())) or (`b`.`CheckInDate` between curdate() and (curdate() + interval 30 day))))) is false) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_employee_permissions`
--

/*!50001 DROP VIEW IF EXISTS `vw_employee_permissions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_employee_permissions` AS select `e`.`SSN` AS `SSN`,concat(`e`.`FirstName`,' ',`e`.`LastName`) AS `EmployeeName`,`e`.`Role` AS `Role`,`h`.`HotelName` AS `HotelName`,`h`.`City` AS `City`,`h`.`State` AS `State`,(case when (`e`.`Role` = 'Receptionist') then 'Yes' when (`e`.`Role` = 'Manager') then 'Yes' else 'No' end) AS `CanProcessPayments`,(case when (`e`.`Role` = 'Manager') then 'Full Access' when (`e`.`Role` = 'Receptionist') then 'Limited Access' else 'No Access' end) AS `SystemAccessLevel` from (`employee` `e` join `hotel` `h` on((`e`.`HotelID` = `h`.`HotelID`))) order by `e`.`Role`,`e`.`LastName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_hotel_capacity_summary`
--

/*!50001 DROP VIEW IF EXISTS `vw_hotel_capacity_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_hotel_capacity_summary` AS select `h`.`HotelID` AS `HotelID`,`h`.`HotelName` AS `HotelName`,`h`.`City` AS `City`,`h`.`State` AS `State`,`hc`.`ChainName` AS `ChainName`,`r`.`Capacity` AS `Capacity`,count(0) AS `TotalRooms`,sum((case when (`r`.`Damaged` = 0) then 1 else 0 end)) AS `AvailableRooms`,sum((case when (`r`.`Damaged` = 1) then 1 else 0 end)) AS `DamagedRooms`,min(`r`.`Price`) AS `MinPrice`,max(`r`.`Price`) AS `MaxPrice`,avg(`r`.`Price`) AS `AvgPrice`,group_concat(distinct `r`.`Amenities` order by `r`.`Amenities` ASC separator '; ') AS `AmenitiesList` from ((`hotel` `h` join `room` `r` on((`h`.`HotelID` = `r`.`HotelID`))) join `hotelchain` `hc` on((`h`.`ChainID` = `hc`.`ChainID`))) group by `h`.`HotelID`,`h`.`HotelName`,`h`.`City`,`h`.`State`,`hc`.`ChainName`,`r`.`Capacity` order by `h`.`HotelID`,`r`.`Capacity` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_renting_payment_status`
--

/*!50001 DROP VIEW IF EXISTS `vw_renting_payment_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_renting_payment_status` AS select `r`.`RentingID` AS `RentingID`,concat(`c`.`FirstName`,' ',`c`.`LastName`) AS `CustomerName`,`h`.`HotelName` AS `HotelName`,`rm`.`RoomNumber` AS `RoomNumber`,`r`.`CheckInDate` AS `CheckInDate`,`r`.`CheckOutDate` AS `CheckOutDate`,`r`.`TotalPrice` AS `TotalPrice`,ifnull(sum(`p`.`Amount`),0) AS `AmountPaid`,(`r`.`TotalPrice` - ifnull(sum(`p`.`Amount`),0)) AS `BalanceDue`,(case when ((`r`.`TotalPrice` - ifnull(sum(`p`.`Amount`),0)) <= 0) then 'Paid in Full' when ((`r`.`TotalPrice` - ifnull(sum(`p`.`Amount`),0)) < `r`.`TotalPrice`) then 'Partial Payment' else 'No Payment' end) AS `PaymentStatus` from ((((`renting` `r` join `customer` `c` on((`r`.`CustomerID` = `c`.`ID`))) join `hotel` `h` on((`r`.`HotelID` = `h`.`HotelID`))) join `room` `rm` on((`r`.`RoomID` = `rm`.`RoomID`))) left join `payment` `p` on((`r`.`RentingID` = `p`.`RentingID`))) where (`r`.`Status` = 'Active') group by `r`.`RentingID`,`c`.`FirstName`,`c`.`LastName`,`h`.`HotelName`,`rm`.`RoomNumber`,`r`.`CheckInDate`,`r`.`CheckOutDate`,`r`.`TotalPrice` order by `BalanceDue` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-31 19:06:47
