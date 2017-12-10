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
INSERT INTO `aircraft` VALUES ('1484P','PA23-250','1833,1','1833,1','101,8'),('2289L','C-90A','4243,8','768,9','1123,4'),('2778V','PA31-350','7998,9','1519,1','795,5'),('4278Y','PA31-350','2147,3','622,1','243,2');
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `charter`
--

LOCK TABLES `charter` WRITE;
/*!40000 ALTER TABLE `charter` DISABLE KEYS */;
INSERT INTO `charter` VALUES (10001,'2008/02/05','2289L','ATL',936,'5,1','2,2','354,1',1,10011),(10002,'2008/02/05','2778V','BNA',320,'1,6','0','72,6',0,10016),(10003,'2008/02/05','4278Y','GNV',1574,'7,8','0','339,8',2,10014),(10004,'2008/02/06','1484P','STL',472,'2,9','4,9','97,2',1,10019),(10005,'2008/02/06','2289L','ATL',1023,'5,7','3,5','397,7',2,10011),(10006,'2008/02/06','4278Y','STL',472,'2,6','5,2','117,1',0,10017),(10007,'2008/02/06','2778V','GNV',1574,'7,9','0','348,4',2,10012),(10008,'2008/02/07','1484P','TYS',644,'4,1','0','140,6',1,10014),(10009,'2008/02/07','2289L','GNV',1574,'6,6','23,4','459,9',0,10017),(10010,'2008/02/07','4278Y','ATL',998,'6,2','3,2','279,7',0,10016),(10011,'2008/02/07','1484P','BNA',352,'1,9','5,3','66,4',1,10012),(10012,'2008/02/08','2778V','MOB',884,'4,8','4,2','215,1',0,10010),(10013,'2008/02/08','4278Y','TYS',644,'3,9','4,5','174,3',1,10011),(10014,'2008/02/09','4278Y','ATL',936,'6,1','2,1','302,6',0,10017),(10015,'2008/02/09','2289L','GNV',1645,'6,7','0','459,5',2,10016),(10016,'2008/02/09','2778V','MQY',312,'1,5','0','67,2',0,10011),(10017,'2008/02/10','1484P','STL',508,'3,1','0','105,5',0,10014),(10018,'2008/02/10','4278Y','TYS',644,'3,8','4,5','167,4',0,10017),(10019,'2017/05/26','2778V','MOB',564,'6','3','210',2,10018);
/*!40000 ALTER TABLE `charter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `crew`
--

LOCK TABLES `crew` WRITE;
/*!40000 ALTER TABLE `crew` DISABLE KEYS */;
INSERT INTO `crew` VALUES (10001,104,'Pilot'),(10002,101,'Pilot'),(10003,105,'Pilot'),(10003,109,'Copilot'),(10004,106,'Pilot'),(10005,101,'Pilot'),(10006,109,'Pilot'),(10007,104,'Pilot'),(10007,105,'Copilot'),(10008,106,'Pilot'),(10009,105,'Pilot'),(10010,108,'Pilot'),(10011,101,'Pilot'),(10011,104,'Copilot'),(10012,101,'Pilot'),(10013,105,'Pilot'),(10014,106,'Pilot'),(10015,101,'Copilot'),(10015,104,'Pilot'),(10016,105,'Copilot'),(10016,109,'Pilot'),(10017,101,'Pilot'),(10018,104,'Copilot'),(10018,105,'Pilot');
/*!40000 ALTER TABLE `crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (10010,'Ramas','Alfred','A',615,'844-2573','0'),(10011,'Dunne','Leona','K',713,'894-1238','0'),(10012,'Smith','Kathy','W',615,'894-2285','896,54'),(10013,'Olowski','Paul','F',615,'894-2180','1285,19'),(10014,'Orlando','Myron',NULL,615,'222-1672','673,21'),(10015,'O\'Brian','Amy','B',713,'442-3381','1014,56'),(10016,'Brown','James','G',615,'297-1228','0'),(10017,'Williams','George',NULL,615,'290-2556','0'),(10018,'Farriss','Anne','G',713,'382-7185','1325,4'),(10019,'Smith','Olette','K',615,'297-3809','453,98');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `earnedrating`
--

LOCK TABLES `earnedrating` WRITE;
/*!40000 ALTER TABLE `earnedrating` DISABLE KEYS */;
INSERT INTO `earnedrating` VALUES (101,'INSTR','2017-12-02 11:32:45'),(101,'MEL','2017-12-02 11:32:45'),(101,'SEL','2017-12-02 11:32:45'),(101,'SES','2017-12-02 11:32:45'),(104,'CFI','2017-10-21 06:03:26'),(104,'MEL','2017-10-21 06:03:26'),(104,'SEL','2017-10-21 06:03:26'),(104,'SES','2017-10-21 06:03:26'),(105,'CFI','2017-11-10 06:20:41'),(105,'SEL','2017-11-10 06:20:41'),(106,'CFI','2017-10-21 05:44:30'),(106,'INSTR','2017-10-21 05:44:30'),(106,'MEL','2017-10-21 05:44:30'),(106,'SEL','2017-10-21 05:44:30'),(109,'CFI','2017-10-21 18:01:11'),(109,'CFII','2017-10-21 18:01:11'),(109,'SEL','2017-10-21 18:01:11'),(109,'SES','2017-10-21 18:01:11');
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
INSERT INTO `model` VALUES ('C-90A','Beechcraft','KingAir',8,'2,67'),('PA23-250','Piper','Aztec',6,'1,93'),('PA31-350','Piper','Navajo Chieftain',10,'2,35');
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pilot`
--

LOCK TABLES `pilot` WRITE;
/*!40000 ALTER TABLE `pilot` DISABLE KEYS */;
INSERT INTO `pilot` VALUES (101,'ATP','INSTR/MEL/SEL/SES',1,'2016-12-20','2016-12-21'),(104,'ATP','CFI/MEL/SEL/SES',1,'2016-11-18','2008-01-17'),(105,'COM','CFI/SEL',2,'2016-11-05','2008-01-02'),(106,'COM','CFI/INSTR/MEL/SEL',2,'2016-11-10','2008-02-02'),(109,'COM','CFI/CFII/SEL/SES',1,'2016-12-22','2008-01-15');
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

-- Dump completed on 2017-12-10 22:21:09