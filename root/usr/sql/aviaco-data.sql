-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: aviaco
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.17.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES ('1484P','PA23-250',1837.90,1837.90,106.60),('2289L','C-90A',4262.20,787.30,1141.80),('2778V','PA31-350',8003.35,1523.55,799.95),('4278Y','PA31-350',2153.50,628.30,249.40);
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `charter`
--

LOCK TABLES `charter` WRITE;
/*!40000 ALTER TABLE `charter` DISABLE KEYS */;
INSERT INTO `charter` VALUES (10001,'2008-02-05','2289L',936,5.1,2.2,354.1,1,10011,740),(10002,'2008-02-05','2778V',320,1.6,0,72.6,0,10016,716),(10003,'2008-02-05','4278Y',1574,7.8,0,339.8,2,10014,734),(10004,'2008-02-06','1484P',472,2.9,4.9,97.2,1,10019,722),(10005,'2008-02-06','2289L',1023,5.7,3.5,397.7,2,10011,740),(10006,'2008-02-06','4278Y',472,2.6,5.2,117.1,0,10017,735),(10007,'2008-02-06','2778V',1574,7.9,0,348.4,2,10012,739),(10008,'2008-02-07','1484P',644,4.1,0,140.6,1,10014,737),(10009,'2008-02-07','2289L',1574,6.6,23.4,459.9,0,10017,752),(10010,'2008-02-07','4278Y',998,6.2,3.2,279.7,0,10016,752),(10011,'2008-02-07','1484P',352,1.9,5.3,66.4,1,10012,712),(10012,'2008-02-08','2778V',884,4.8,4.2,215.1,0,10010,725),(10013,'2008-02-08','4278Y',644,3.9,4.5,174.3,1,10011,713),(10014,'2018-01-23','2289L',15,1.2,1.05,0.69,1,10012,731),(10015,'2008-02-09','2289L',1645,6.7,0,459.5,2,10016,751),(10016,'2008-02-09','2778V',312,1.5,0,67.2,0,10011,752),(10017,'2008-02-10','1484P',508,3.1,0,105.5,0,10014,751),(10018,'2008-02-10','4278Y',644,3.8,4.5,167.4,0,10017,741),(10019,'2017-05-26','2778V',564,6,3,210,2,10018,739),(10020,'2018-01-10','1484P',15,3.45,1.3,0.98,1,10019,3182),(10021,'2018-01-10','2289L',31,1.4,0.9,0.71,1,10010,3177),(10022,'2018-01-17','2289L',35,2.5,0.45,0.88,1,10010,724),(10023,'2018-01-16','2289L',20,0.95,0.85,0.65,1,10016,712),(10024,'2018-01-17','4278Y',20,1.1,1.1,0.68,1,10019,727),(10025,'2018-01-24','1484P',23,1.35,1.3,0.68,1,10019,3177),(10026,'2018-01-24','1484P',20,0.95,0.95,0.61,1,10014,721),(10027,'2018-01-16','4278Y',22,1,1.25,0.75,1,10015,3186),(10028,'2018-01-17','2289L',23,1.55,0.65,0.78,1,10011,721),(10029,'2018-01-11','2778V',25,1.2,0.95,0.87,1,10013,3186);
/*!40000 ALTER TABLE `charter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `crew`
--

LOCK TABLES `crew` WRITE;
/*!40000 ALTER TABLE `crew` DISABLE KEYS */;
INSERT INTO `crew` VALUES (10001,104,'Pilot'),(10002,101,'Pilot'),(10003,105,'Pilot'),(10003,109,'Copilot'),(10004,106,'Pilot'),(10005,101,'Pilot'),(10006,109,'Pilot'),(10007,104,'Pilot'),(10007,105,'Copilot'),(10008,106,'Pilot'),(10009,105,'Pilot'),(10010,108,'Pilot'),(10011,101,'Pilot'),(10011,104,'Copilot'),(10012,101,'Pilot'),(10013,105,'Pilot'),(10014,101,'Pilot'),(10014,109,'Copilot'),(10015,101,'Copilot'),(10015,104,'Pilot'),(10016,105,'Copilot'),(10016,109,'Pilot'),(10017,101,'Pilot'),(10018,104,'Copilot'),(10018,105,'Pilot'),(10020,106,'Pilot'),(10020,109,'Copilot'),(10021,106,'Pilot'),(10021,109,'Copilot'),(10022,105,'Pilot'),(10022,106,'Copilot'),(10023,101,'Pilot'),(10023,109,'Copilot'),(10024,104,'Pilot'),(10024,105,'Copilot'),(10025,101,'Copilot'),(10025,106,'Pilot'),(10026,104,'Copilot'),(10026,109,'Pilot'),(10027,101,'Copilot'),(10027,106,'Pilot'),(10028,104,'Copilot'),(10028,106,'Pilot'),(10029,105,'Pilot'),(10029,106,'Copilot');
/*!40000 ALTER TABLE `crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (10010,'Ramas','Alfred','A',615,'844-2573',352.78),(10011,'Dunne','Leona','K',713,'894-1238',56.07),(10012,'Smith','Kathy','W',615,'894-2285',936.59),(10013,'Olowski','Paul','F',615,'894-2180',1562.90),(10014,'Orlando','Myron',NULL,615,'222-1672',838.75),(10015,'O\'Brian','Amy','B',713,'442-3381',1066.26),(10016,'Brown','James','G',615,'297-1228',93.45),(10017,'Williams','George',NULL,615,'290-2556',153.16),(10018,'Farriss','Anne','G',713,'382-7185',1325.40),(10019,'Smith','Olette','K',615,'297-3809',574.32);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `earnedrating`
--

LOCK TABLES `earnedrating` WRITE;
/*!40000 ALTER TABLE `earnedrating` DISABLE KEYS */;
INSERT INTO `earnedrating` VALUES (101,'CFII','2018-01-03 18:57:51'),(101,'INSTR','2018-01-03 18:57:51'),(101,'SES','2018-01-03 18:57:51'),(104,'CFI','2018-01-01 16:52:05'),(104,'CFII','2018-01-01 16:52:05'),(104,'MEL','2018-01-01 16:52:05'),(105,'CFI','2017-12-28 00:43:18'),(105,'CFII','2017-12-28 00:43:18'),(105,'MEL','2017-12-28 00:43:18'),(105,'SEL','2017-12-28 00:43:18'),(106,'CFI','2017-12-28 00:08:32'),(106,'MEL','2017-12-28 00:08:32'),(106,'SEL','2017-12-28 00:08:32'),(109,'CFI','2017-10-21 18:01:11'),(109,'CFII','2017-10-21 18:01:11'),(109,'SEL','2017-10-21 18:01:11'),(109,'SES','2017-10-21 18:01:11');
/*!40000 ALTER TABLE `earnedrating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (100,'Mr.','Kolmycz','George','D','1942-06-15','1988/03/15'),(101,'Ms.','Lewis','Rhonda','G','1965-03-19','1986/04/25'),(102,'Mr.','VanDam','Rhett',NULL,'1958-11-14','1993/05/18'),(103,'Ms.','Jones','Anne','M','1974-05-11','1999/07/26'),(104,'Mr.','Lange','John','P','1971-07-12','1990/08/20'),(105,'Mr.','Williams','Robert','D','1975-03-14','2003/06/19'),(106,'Mrs.','Duzak','Jeanine','K','1968-02-12','1989/03/13'),(107,'Mr.','Diante','Jorge','D','1975-05-01','1997/07/02'),(108,'Mr.','Wiesenbach','Paul','R','1966-02-14','1993/06/03'),(109,'Ms.','Travis','Elizabeth','K','1961-06-18','2004/02/14'),(110,'Mrs.','Genkazi','Leighla','W','1970-05-19','1990/06/29');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES ('C-90A','Beechcraft','KingAir',8,2.67),('PA23-250','Piper','Aztec',6,1.93),('PA31-350','Piper','Navajo Chieftain',10,2.35);
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pilot`
--

LOCK TABLES `pilot` WRITE;
/*!40000 ALTER TABLE `pilot` DISABLE KEYS */;
INSERT INTO `pilot` VALUES (101,'ATP','CFII/INSTR/SES',1,'2017-02-20','2016-12-21'),(104,'ATP','CFI/CFII/MEL',1,'2017-01-18','2008-01-17'),(105,'COM','CFI/CFII/MEL/SEL',2,'2017-01-05','2008-01-02'),(106,'COM','CFI/MEL/SEL',2,'2017-01-10','2008-02-02'),(109,'COM','CFI/CFII/SEL/SES',1,'2017-02-22','2008-01-15');
/*!40000 ALTER TABLE `pilot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES ('CFI','Certified Flight Instructor'),('CFII','Certified Flight Instructor, Instrument'),('INSTR','Instrument'),('MEL','Multiengine Land'),('SEL','Single Engine, Land'),('SES','Single Engine, Sea');
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-11 14:39:25
