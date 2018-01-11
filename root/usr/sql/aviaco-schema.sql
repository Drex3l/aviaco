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
-- Current Database: `aviaco`
--

/*!40000 DROP DATABASE IF EXISTS `aviaco`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `aviaco` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `aviaco`;

--
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aircraft` (
  `AC_NUMBER` varchar(5) NOT NULL,
  `MOD_CODE` varchar(8) DEFAULT NULL,
  `AC_TTAF` double(16,2) DEFAULT NULL,
  `AC_TTEl` double(16,2) DEFAULT NULL,
  `AC_TTER` double(16,2) DEFAULT NULL,
  PRIMARY KEY (`AC_NUMBER`),
  KEY `FK_MODEL_MODCODE` (`MOD_CODE`),
  CONSTRAINT `FK_MODEL_MODCODE` FOREIGN KEY (`MOD_CODE`) REFERENCES `model` (`MOD_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `average_consumption`
--

DROP TABLE IF EXISTS `average_consumption`;
/*!50001 DROP VIEW IF EXISTS `average_consumption`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `average_consumption` AS SELECT 
 1 AS `MOD_CODE`,
 1 AS `FUEL`,
 1 AS `OIL`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `charter`
--

DROP TABLE IF EXISTS `charter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charter` (
  `CHAR_TRIP` bigint(20) unsigned NOT NULL,
  `CHAR_DATE` date DEFAULT NULL,
  `AC_NUMBER` varchar(5) DEFAULT NULL,
  `CHAR_DISTANCE` int(4) unsigned DEFAULT NULL,
  `CHAR_HOURS_FLOWN` float DEFAULT NULL,
  `CHAR_HOURS_WAIT` float DEFAULT NULL,
  `CHAR_FUEL_GALLONS` float DEFAULT NULL,
  `CHAR_OIL_QTS` int(1) unsigned DEFAULT NULL,
  `CUS_CODE` bigint(20) unsigned DEFAULT NULL,
  `AIRPORT_CODE` int(11) NOT NULL DEFAULT '712',
  PRIMARY KEY (`CHAR_TRIP`),
  KEY `FK_AIRCRAFT_ACNUMBER` (`AC_NUMBER`),
  KEY `FK_CUSTOMER_CUSCODE` (`CUS_CODE`),
  KEY `AIRPORT_CODE` (`AIRPORT_CODE`),
  CONSTRAINT `charter_ibfk_1` FOREIGN KEY (`AIRPORT_CODE`) REFERENCES `world`.`city` (`ID`),
  CONSTRAINT `charter_ibfk_2` FOREIGN KEY (`CUS_CODE`) REFERENCES `customer` (`CUS_CODE`) ON DELETE CASCADE,
  CONSTRAINT `charter_ibfk_3` FOREIGN KEY (`AC_NUMBER`) REFERENCES `aircraft` (`AC_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`s215013395`@`localhost`*/ /*!50003 TRIGGER `aviaco`.`before_charter_insert`
BEFORE INSERT ON `aviaco`.`charter`
FOR EACH ROW
BEGIN
 DECLARE FOUND BOOLEAN DEFAULT TRUE;
 DECLARE INCR MEDIUMINT UNSIGNED DEFAULT 1;
 
 WHILE FOUND DO
  SET NEW.CHAR_TRIP = 10000 + INCR; 
  SET FOUND = ((SELECT COUNT(CHAR_TRIP) FROM charter WHERE CHAR_TRIP = NEW.CHAR_TRIP) > 0); 
  SET INCR = INCR + 1;
 END WHILE;
 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `charter_list`
--

DROP TABLE IF EXISTS `charter_list`;
/*!50001 DROP VIEW IF EXISTS `charter_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `charter_list` AS SELECT 
 1 AS `ID`,
 1 AS `DATE`,
 1 AS `AIRCRAFT`,
 1 AS `CUSTOMER`,
 1 AS `AIRPORT_CODE`,
 1 AS `PILOT`,
 1 AS `COPILOT`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `crew`
--

DROP TABLE IF EXISTS `crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crew` (
  `CHAR_TRIP` bigint(20) unsigned NOT NULL,
  `EMP_NUM` bigint(20) unsigned NOT NULL,
  `CREW_JOB` enum('Pilot','Copilot') DEFAULT NULL,
  PRIMARY KEY (`CHAR_TRIP`,`EMP_NUM`),
  KEY `FK_CHARTER_CHARTRIP` (`CHAR_TRIP`),
  KEY `FK_EMPLOYEE_EMP_NUM` (`EMP_NUM`),
  CONSTRAINT `crew_ibfk_1` FOREIGN KEY (`CHAR_TRIP`) REFERENCES `charter` (`CHAR_TRIP`) ON DELETE CASCADE,
  CONSTRAINT `crew_ibfk_2` FOREIGN KEY (`EMP_NUM`) REFERENCES `employee` (`EMP_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CUS_CODE` bigint(20) unsigned NOT NULL,
  `CUS_LNAME` varchar(8) DEFAULT NULL,
  `CUS_FNAME` varchar(6) DEFAULT NULL,
  `CUS_INITIAL` varchar(1) DEFAULT NULL,
  `CUS_AREACODE` int(3) DEFAULT NULL,
  `CUS_PHONE` varchar(8) DEFAULT NULL,
  `CUS_BALANCE` double(16,2) DEFAULT NULL,
  PRIMARY KEY (`CUS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `earnedrating`
--

DROP TABLE IF EXISTS `earnedrating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `earnedrating` (
  `EMP_NUM` bigint(20) unsigned NOT NULL,
  `RTG_CODE` varchar(5) NOT NULL,
  `EARNRTG_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`EMP_NUM`,`RTG_CODE`),
  KEY `FK_RATING_RTGCODE` (`RTG_CODE`),
  CONSTRAINT `FK_RATING_RTGCODE` FOREIGN KEY (`RTG_CODE`) REFERENCES `rating` (`RTG_CODE`),
  CONSTRAINT `earnedrating_ibfk_1` FOREIGN KEY (`EMP_NUM`) REFERENCES `pilot` (`EMP_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `EMP_NUM` bigint(20) unsigned NOT NULL,
  `EMP_TITLE` varchar(4) DEFAULT NULL,
  `EMP_LNAME` varchar(10) DEFAULT NULL,
  `EMP_FNAME` varchar(9) DEFAULT NULL,
  `EMP_INITIAL` varchar(1) DEFAULT NULL,
  `EMP_DOB` date DEFAULT NULL,
  `EMP_HIRE_DATE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`EMP_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `engine_service`
--

DROP TABLE IF EXISTS `engine_service`;
/*!50001 DROP VIEW IF EXISTS `engine_service`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `engine_service` AS SELECT 
 1 AS `AC_NUMBER`,
 1 AS `EL`,
 1 AS `ER`,
 1 AS `AF`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model` (
  `MOD_CODE` varchar(8) NOT NULL,
  `MOD_MANUFACTURER` varchar(10) DEFAULT NULL,
  `MOD_NAME` varchar(16) DEFAULT NULL,
  `MOD_SEATS` int(2) DEFAULT NULL,
  `MOD_CHG_MILE` double(16,2) DEFAULT NULL,
  PRIMARY KEY (`MOD_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pilot`
--

DROP TABLE IF EXISTS `pilot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pilot` (
  `EMP_NUM` bigint(20) unsigned NOT NULL,
  `PIL_LICENSE` varchar(3) DEFAULT NULL,
  `PIL_RATINGS` varchar(26) DEFAULT NULL,
  `PIL_MED_TYPE` int(1) DEFAULT NULL,
  `PIL_MED_DATE` date DEFAULT NULL,
  `PIL_PT135_DATE` date DEFAULT NULL,
  PRIMARY KEY (`EMP_NUM`),
  CONSTRAINT `pilot_ibfk_1` FOREIGN KEY (`EMP_NUM`) REFERENCES `employee` (`EMP_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `pilot_hours`
--

DROP TABLE IF EXISTS `pilot_hours`;
/*!50001 DROP VIEW IF EXISTS `pilot_hours`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `pilot_hours` AS SELECT 
 1 AS `ID`,
 1 AS `PILOT`,
 1 AS `HOURS`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `pilot_list`
--

DROP TABLE IF EXISTS `pilot_list`;
/*!50001 DROP VIEW IF EXISTS `pilot_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `pilot_list` AS SELECT 
 1 AS `ID`,
 1 AS `EMP_FNAME`,
 1 AS `EMP_LNAME`,
 1 AS `EMP_HIRE_DATE`,
 1 AS `PIL_MED_DATE`,
 1 AS `PIL_RATINGS`,
 1 AS `EARNRTG_DATE`,
 1 AS `FLIGHTS`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `RTG_CODE` varchar(5) NOT NULL,
  `RTG_NAME` varchar(39) DEFAULT NULL,
  PRIMARY KEY (`RTG_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'aviaco'
--
/*!50003 DROP FUNCTION IF EXISTS `sf_arrayLength` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s215013395`@`localhost` FUNCTION `sf_arrayLength`(seperate CHAR(1), arrayString TEXT) RETURNS smallint(5) unsigned
BEGIN
	DECLARE count SMALLINT UNSIGNED DEFAULT 0;
	SET @string = arrayString;
	SET @delimiter = seperate;
	
	WHILE (LOCATE(@delimiter,@string)>0)  DO 
		SET @string = SUBSTRING(@string,LOCATE(@delimiter,@string)+1);
		SET count = count + 1;
	END WHILE;
 	RETURN count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sf_checkRating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s215013395`@`localhost` FUNCTION `sf_checkRating`(empID int(3), rtgCode varchar(5)) RETURNS tinyint(1)
return ((select count(*) from earnedrating where EMP_NUM = empID && RTG_CODE = rtgCode)>0) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sf_cities_page_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s215013395`@`localhost` FUNCTION `sf_cities_page_count`(block TINYINT UNSIGNED,nation CHAR(3)) RETURNS smallint(5) unsigned
BEGIN



 
 DECLARE pages SMALLINT UNSIGNED;
 DECLARE list BIGINT UNSIGNED;
    SELECT COUNT(ID) FROM world.city WHERE CountryCode = nation INTO list;
    SELECT (list / block) INTO pages;
    
    IF list = 0 THEN RETURN 0;	END IF;
    IF pages = 0 THEN RETURN 1;	END IF;
    IF list > block && list % block > 0 THEN	SET pages = pages + 1; END IF;
    RETURN pages;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `SPLIT_STR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s215013395`@`localhost` FUNCTION `SPLIT_STR`(x VARCHAR(255), delim CHAR(1),pos INT) RETURNS varchar(255) CHARSET latin1
    DETERMINISTIC
BEGIN
	RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),LENGTH(SUBSTRING_INDEX(x, delim, pos -1))+1),delim, '');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_addCharter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s215013395`@`localhost` PROCEDURE `sp_addCharter`(
IN plane VARCHAR(5),
IN airport INT(11),
IN departure DATE,
IN distance INT(4) UNSIGNED,
IN fuel FLOAT,
IN oil INT(1) UNSIGNED,
IN flyHours FLOAT,
IN waitHours FLOAT,
IN pil BIGINT UNSIGNED,
IN copilot BIGINT UNSIGNED,
IN passenger BIGINT UNSIGNED
)
BEGIN
	DECLARE CHECKPOINT  TINYINT UNSIGNED DEFAULT 0;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION,1265
	BEGIN 
		GET DIAGNOSTICS CONDITION 1 @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
		ROLLBACK;
        	SELECT CONCAT('C',LPAD(CHECKPOINT,2,'0'))  AS 'POINT',@p1 AS CODE, @p2 AS DESCRIPTION;
	END;
	START TRANSACTION;
		IF distance = 0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID DISTANCE'; END IF;

		INSERT INTO charter VALUES(\N,departure,plane,0,flyHours,waitHours,fuel,oil,passenger,airport);				SET CHECKPOINT = 1;
		SET @charter = (SELECT CHAR_TRIP FROM charter WHERE CHAR_DISTANCE = 0);	SET CHECKPOINT = 2;
		UPDATE charter SET CHAR_DISTANCE = distance WHERE CHAR_DISTANCE = 0;	SET CHECKPOINT = 3;

                SET @AC_TTAF = ((SELECT AC_TTAF FROM aircraft WHERE AC_NUMBER = plane) + flyHours); 
                SET @AC_TTEL = ((SELECT AC_TTEL FROM aircraft WHERE AC_NUMBER = plane) + flyHours);
                SET @AC_TTER = ((SELECT AC_TTER FROM aircraft WHERE AC_NUMBER = plane) + flyHours);

		UPDATE aircraft SET AC_TTAF = @AC_TTAF WHERE AC_NUMBER = plane;	SET CHECKPOINT = 4;
		UPDATE aircraft SET AC_TTEL = @AC_TTEL WHERE AC_NUMBER = plane;	SET CHECKPOINT = 5;
		UPDATE aircraft SET AC_TTER = @AC_TTER WHERE AC_NUMBER = plane;	SET CHECKPOINT = 6;

		SET @balance = (SELECT CUS_BALANCE FROM customer WHERE CUS_CODE = passenger);	SET CHECKPOINT = 7;
		SET @charge = (SELECT MOD_CHG_MILE FROM model WHERE MOD_CODE = (SELECT MOD_CODE FROM aircraft WHERE AC_NUMBER = plane));	SET CHECKPOINT = 8;
		
		UPDATE customer SET CUS_BALANCE = (@balance +(@charge * distance)) WHERE CUS_CODE = passenger;	SET CHECKPOINT = 9;
		INSERT INTO crew VALUES(@charter,pil,'Pilot');			SET CHECKPOINT = 10;
		INSERT INTO crew VALUES(@charter,copilot,'Copilot');		SET CHECKPOINT = 11;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_checkAircraft` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s215013395`@`localhost` PROCEDURE `sp_checkAircraft`(IN id VARCHAR(5))
SELECT ES.AF,ES.EL,ES.ER, M.OIL, M.FUEL FROM engine_service ES, aircraft A, average_consumption M WHERE A.AC_NUMBER = ES.AC_NUMBER && M.MOD_CODE = A.MOD_CODE AND ES.AC_NUMBER = id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getCharters` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s215013395`@`localhost` PROCEDURE `sp_getCharters`(IN destination INT(11))
SELECT DATE, AIRCRAFT, CUSTOMER, CONCAT(`EMP_FNAME`,' ',`EMP_LNAME`) PILOT, e.EMP_NUM, l.ID FROM charter_list l, employee e WHERE l.PILOT = e.EMP_NUM AND AIRPORT_CODE = destination
ORDER BY DATE ASC ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getDestinations` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s215013395`@`localhost` PROCEDURE `sp_getDestinations`(IN n TINYINT UNSIGNED, IN block TINYINT UNSIGNED,IN nation CHAR(3))
BEGIN



 
    DECLARE k BIGINT UNSIGNED DEFAULT (n * block);
    SELECT Name, District, CountryCode, ID FROM world.city WHERE CountryCode = nation ORDER BY Name LIMIT block OFFSET k;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getEngineServiceList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s215013395`@`localhost` PROCEDURE `sp_getEngineServiceList`(IN hours TINYINT UNSIGNED)
select AC_NUMBER from engine_service WHERE EL <= hours || ER <= hours ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getMembers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s215013395`@`localhost` PROCEDURE `sp_getMembers`( IN item ENUM('C','P'))
BEGIN
	CASE item
	WHEN	'C'	THEN
		BEGIN
			SELECT CONCAT(CUS_FNAME,' ',CUS_LNAME) NAME, CUS_CODE FROM customer oRder by NAME;
		END;
	WHEN	'P'	THEN
		BEGIN
			SELECT e.EMP_NUM ID, CONCAT(EMP_FNAME,' ',EMP_LNAME) PILOT, PIL_MED_DATE FROM employee e, pilot p WHERE e.EMP_NUM = p.EMP_NUM oRder by PILOT;
		END;
	END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getModelAvegrage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s215013395`@`localhost` PROCEDURE `sp_getModelAvegrage`(IN modelCode VARCHAR(8))
SELECT ROUND(FUEL,2) FUEL, ROUND(OIL,2) OIL FROM average_consumption WHERE MOD_CODE = modelCode ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getPilotInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s215013395`@`localhost` PROCEDURE `sp_getPilotInfo`(IN emp int(3))
select PILOT, HOURS, FLIGHTS, PIL_RATINGS RATINGS from pilot_list L, pilot_hours H WHERE H.ID = L.ID AND L.ID = emp ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getPilotMedExam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s215013395`@`localhost` PROCEDURE `sp_getPilotMedExam`(IN days SMALLINT UNSIGNED)
select CONCAT(EMP_FNAME,' ',EMP_LNAME) PILOT from pilot_list WHERE DATE_ADD(PIL_MED_DATE, INTERVAL 1 YEAR) BETWEEN CURRENT_DATE AND DATE_ADD(CURRENT_DATE,INTERVAL days DAY) ORDER BY PILOT ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getRatingPilots` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s215013395`@`localhost` PROCEDURE `sp_getRatingPilots`(IN rating VARCHAR(5))
SELECT PILOT, ROUND(HOURS) HOURS FROM pilot_hours P, earnedrating R WHERE P.ID = R.EMP_NUM AND RTG_CODE = rating ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ratePilot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s215013395`@`localhost` PROCEDURE `sp_ratePilot`(IN items TEXT,IN empNO INT(3))
BEGIN 
	DECLARE CHECKPOINT  TINYINT UNSIGNED DEFAULT 0;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION,1265
	BEGIN 
		GET DIAGNOSTICS CONDITION 1 @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
		ROLLBACK;
        	SELECT CONCAT('Error encountered, operation rollbacked. : C',LPAD(CHECKPOINT,2,'0'))  AS 'SQL EXCEPTION',@p1 AS CODE, @p2 AS DESCRIPTION;
	END;
	START TRANSACTION;
	DELETE FROM earnedrating WHERE EMP_NUM = empNO;
	UPDATE pilot SET PIL_RATINGS = SUBSTRING(items,1,LENGTH(items)-1) WHERE EMP_NUM = empNO;
	SET @itemList = items; 
	SET @delimiter = '/';
	SET @empNO = empNO;
	
	SET @q ='INSERT INTO earnedrating(EMP_NUM,RTG_CODE) VALUES ';																SET CHECKPOINT = 1;
	SET @length = sf_arrayLength(@delimiter,@itemList);																			SET CHECKPOINT = 2;
	IF @length > 0 THEN
		SET @selectedItems = '';
		SET @count = 0;
	
		WHILE(@count < @length)	DO
			SET @count = @count + 1;
			IF(@count < (@length))	THEN SET @selectedItems = CONCAT(@selectedItems,'(',@empNO,', "', SPLIT_STR(@itemList,@delimiter,@count),'"), ');
			ELSE SET @selectedItems = CONCAT(@selectedItems,'(', @empNO,',"', SPLIT_STR(@itemList,@delimiter,@count),'")');	END IF;
		END WHILE;																												SET CHECKPOINT = 3;
		SET @q = CONCAT(@q, @selectedItems);
	ELSE SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nothing Selected';
	END IF;																														SET CHECKPOINT = 4;
	PREPARE stmt FROM @q; 																										SET CHECKPOINT = 5;
	 EXECUTE stmt; 																												SET CHECKPOINT = 6;
	DEALLOCATE PREPARE stmt; 																									SET CHECKPOINT = 7;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updateCharter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s215013395`@`localhost` PROCEDURE `sp_updateCharter`(
	IN plane VARCHAR(5),
	IN airport INT(11),
	IN departure DATE,
	IN distance INT(4) UNSIGNED,
	IN fuel FLOAT,
	IN oil INT(1) UNSIGNED,
	IN flyHours FLOAT,
	IN waitHours FLOAT,
	IN pil BIGINT UNSIGNED,
	IN copilot BIGINT UNSIGNED,
	IN passenger BIGINT UNSIGNED,
	IN id BIGINT(20) UNSIGNED
)
BEGIN
	DECLARE CHECKPOINT  TINYINT UNSIGNED DEFAULT 0;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION,1265
	BEGIN 
		GET DIAGNOSTICS CONDITION 1 @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
		ROLLBACK;
        	SELECT CONCAT('C',LPAD(CHECKPOINT,2,'0'))  AS 'POINT',@p1 AS CODE, @p2 AS DESCRIPTION;
	END;
	START TRANSACTION;
	
	SET plane = UPPER(REPLACE(plane,' ',''));

	UPDATE charter SET AC_NUMBER = plane, AIRPORT_CODE = airport, CHAR_DATE = departure, CHAR_DISTANCE = distance, CHAR_FUEL_GALLONS = fuel, CHAR_OIL_QTS = oil, CHAR_HOURS_FLOWN = flyHours, CHAR_HOURS_WAIT = waitHours, CUS_CODE = passenger WHERE  CHAR_TRIP = id;
	UPDATE crew SET EMP_NUM = pil WHERE  CHAR_TRIP = id && CREW_JOB = 'Pilot';
	UPDATE crew SET EMP_NUM = copilot WHERE  CHAR_TRIP = id && CREW_JOB = 'Copilot';
	
 	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `aviaco`
--

USE `aviaco`;

--
-- Final view structure for view `average_consumption`
--

/*!50001 DROP VIEW IF EXISTS `average_consumption`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`s215013395`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `average_consumption` AS select `A`.`MOD_CODE` AS `MOD_CODE`,round(avg(`C`.`CHAR_FUEL_GALLONS`),2) AS `FUEL`,round(avg(`C`.`CHAR_OIL_QTS`),2) AS `OIL` from (`charter` `C` join `aircraft` `A`) where (`C`.`AC_NUMBER` = `A`.`AC_NUMBER`) group by `A`.`MOD_CODE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `charter_list`
--

/*!50001 DROP VIEW IF EXISTS `charter_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`s215013395`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `charter_list` AS select `ct`.`CHAR_TRIP` AS `ID`,`ct`.`CHAR_DATE` AS `DATE`,`ct`.`AC_NUMBER` AS `AIRCRAFT`,concat(`c`.`CUS_FNAME`,' ',`c`.`CUS_LNAME`) AS `CUSTOMER`,`ct`.`AIRPORT_CODE` AS `AIRPORT_CODE`,(select `cr`.`EMP_NUM` from `crew` `cr` where ((`cr`.`CHAR_TRIP` = `ct`.`CHAR_TRIP`) and (`cr`.`CREW_JOB` = 'Pilot'))) AS `PILOT`,(select `cr`.`EMP_NUM` from `crew` `cr` where ((`cr`.`CHAR_TRIP` = `ct`.`CHAR_TRIP`) and (`cr`.`CREW_JOB` = 'Copilot'))) AS `COPILOT` from (`charter` `ct` join `customer` `c`) where (`c`.`CUS_CODE` = `ct`.`CUS_CODE`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `engine_service`
--

/*!50001 DROP VIEW IF EXISTS `engine_service`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`s215013395`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `engine_service` AS select `aircraft`.`AC_NUMBER` AS `AC_NUMBER`,(100 - (`aircraft`.`AC_TTEl` % 100)) AS `EL`,(100 - (`aircraft`.`AC_TTER` % 100)) AS `ER`,(500 - (`aircraft`.`AC_TTAF` % 500)) AS `AF` from `aircraft` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pilot_hours`
--

/*!50001 DROP VIEW IF EXISTS `pilot_hours`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`s215013395`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pilot_hours` AS select `E`.`EMP_NUM` AS `ID`,concat(`E`.`EMP_FNAME`,' ',`E`.`EMP_LNAME`) AS `PILOT`,(select sum(`CH`.`CHAR_HOURS_FLOWN`) from (`crew` `CRW` join `charter` `CH`) where ((`CRW`.`CHAR_TRIP` = `CH`.`CHAR_TRIP`) and (`CRW`.`EMP_NUM` = `CR`.`EMP_NUM`))) AS `HOURS` from (`crew` `CR` join `employee` `E`) where (`E`.`EMP_NUM` = `CR`.`EMP_NUM`) group by `ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pilot_list`
--

/*!50001 DROP VIEW IF EXISTS `pilot_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`s215013395`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pilot_list` AS select distinct `E`.`EMP_NUM` AS `ID`,`E`.`EMP_FNAME` AS `EMP_FNAME`,`E`.`EMP_LNAME` AS `EMP_LNAME`,`E`.`EMP_HIRE_DATE` AS `EMP_HIRE_DATE`,`P`.`PIL_MED_DATE` AS `PIL_MED_DATE`,`P`.`PIL_RATINGS` AS `PIL_RATINGS`,`R`.`EARNRTG_DATE` AS `EARNRTG_DATE`,(select count(`C`.`EMP_NUM`) from `crew` `C` where (`C`.`EMP_NUM` = `E`.`EMP_NUM`)) AS `FLIGHTS` from ((`employee` `E` join `pilot` `P`) join `earnedrating` `R`) where ((`P`.`EMP_NUM` = `E`.`EMP_NUM`) and (`R`.`EMP_NUM` = `P`.`EMP_NUM`)) */;
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

-- Dump completed on 2018-01-11 14:39:17
