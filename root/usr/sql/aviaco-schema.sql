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
  `AC_TTAF` varchar(6) DEFAULT NULL,
  `AC_TTEL` varchar(6) DEFAULT NULL,
  `AC_TTER` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`AC_NUMBER`),
  KEY `FK_MODEL_MODCODE` (`MOD_CODE`),
  CONSTRAINT `FK_MODEL_MODCODE` FOREIGN KEY (`MOD_CODE`) REFERENCES `model` (`MOD_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `aircraft_list`
--

DROP TABLE IF EXISTS `aircraft_list`;
/*!50001 DROP VIEW IF EXISTS `aircraft_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `aircraft_list` AS SELECT 
 1 AS `ID`,
 1 AS `CHAR_FUEL_GALLONS`,
 1 AS `CHAR_OIL_QTS`,
 1 AS `MOD_CODE`*/;
SET character_set_client = @saved_cs_client;

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
  `CHAR_TRIP` int(5) NOT NULL,
  `CHAR_DATE` varchar(10) DEFAULT NULL,
  `AC_NUMBER` varchar(5) DEFAULT NULL,
  `CHAR_DESTINATION` varchar(3) DEFAULT NULL,
  `CHAR_DISTANCE` int(4) DEFAULT NULL,
  `CHAR_HOURS_FLOWN` varchar(3) DEFAULT NULL,
  `CHAR_HOURS_WAIT` varchar(4) DEFAULT NULL,
  `CHAR_FUEL_GALLONS` varchar(5) DEFAULT NULL,
  `CHAR_OIL_QTS` int(1) DEFAULT NULL,
  `CUS_CODE` int(5) DEFAULT NULL,
  PRIMARY KEY (`CHAR_TRIP`),
  KEY `FK_AIRCRAFT_ACNUMBER` (`AC_NUMBER`),
  KEY `FK_CUSTOMER_CUSCODE` (`CUS_CODE`),
  CONSTRAINT `FK_AIRCRAFT_ACNUMBER` FOREIGN KEY (`AC_NUMBER`) REFERENCES `aircraft` (`AC_NUMBER`),
  CONSTRAINT `FK_CUSTOMER_CUSCODE` FOREIGN KEY (`CUS_CODE`) REFERENCES `customer` (`CUS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crew`
--

DROP TABLE IF EXISTS `crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crew` (
  `CHAR_TRIP` int(5) DEFAULT NULL,
  `EMP_NUM` int(3) DEFAULT NULL,
  `CREW_JOB` varchar(7) DEFAULT NULL,
  KEY `FK_CHARTER_CHARTRIP` (`CHAR_TRIP`),
  KEY `FK_EMPLOYEE_EMP_NUM` (`EMP_NUM`),
  CONSTRAINT `FK_EMPLOYEE_EMP_NUM` FOREIGN KEY (`EMP_NUM`) REFERENCES `employee` (`EMP_NUM`),
  CONSTRAINT `crew_ibfk_1` FOREIGN KEY (`CHAR_TRIP`) REFERENCES `charter` (`CHAR_TRIP`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CUS_CODE` int(5) NOT NULL,
  `CUS_LNAME` varchar(8) DEFAULT NULL,
  `CUS_FNAME` varchar(6) DEFAULT NULL,
  `CUS_INITIAL` varchar(1) DEFAULT NULL,
  `CUS_AREACODE` int(3) DEFAULT NULL,
  `CUS_PHONE` varchar(8) DEFAULT NULL,
  `CUS_BALANCE` varchar(7) DEFAULT NULL,
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
  `EMP_NUM` int(3) NOT NULL,
  `RTG_CODE` varchar(5) NOT NULL,
  `EARNRTG_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`EMP_NUM`,`RTG_CODE`),
  KEY `FK_RATING_RTGCODE` (`RTG_CODE`),
  CONSTRAINT `FK_PILOT_EMPNUM` FOREIGN KEY (`EMP_NUM`) REFERENCES `pilot` (`EMP_NUM`),
  CONSTRAINT `FK_RATING_RTGCODE` FOREIGN KEY (`RTG_CODE`) REFERENCES `rating` (`RTG_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `EMP_NUM` int(3) NOT NULL,
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
 1 AS `ER`*/;
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
  `MOD_CHG_MILE` varchar(4) DEFAULT NULL,
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
  `EMP_NUM` int(3) NOT NULL,
  `PIL_LICENSE` varchar(3) DEFAULT NULL,
  `PIL_RATINGS` varchar(26) DEFAULT NULL,
  `PIL_MED_TYPE` int(1) DEFAULT NULL,
  `PIL_MED_DATE` date DEFAULT NULL,
  `PIL_PT135_DATE` date DEFAULT NULL,
  PRIMARY KEY (`EMP_NUM`),
  CONSTRAINT `FK_EMPLOYEE_EMPNUM` FOREIGN KEY (`EMP_NUM`) REFERENCES `employee` (`EMP_NUM`)
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
 1 AS `EARNRTG_DATE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `pilot_meddate_list`
--

DROP TABLE IF EXISTS `pilot_meddate_list`;
/*!50001 DROP VIEW IF EXISTS `pilot_meddate_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `pilot_meddate_list` AS SELECT 
 1 AS `ID`,
 1 AS `PILOT`,
 1 AS `PIL_MED_DATE`*/;
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
    SELECT Name, District, ID FROM world.city WHERE CountryCode = nation ORDER BY Name LIMIT block OFFSET k;
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
SELECT FUEL, OIL FROM average_consumption WHERE MOD_CODE = modelCode ;;
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
CREATE DEFINER=`s215013395`@`localhost` PROCEDURE `sp_getPilotMedExam`(IN days TINYINT UNSIGNED)
select PILOT from pilot_meddate_list WHERE DATE_ADD(PIL_MED_DATE, INTERVAL 1 YEAR) BETWEEN CURRENT_DATE AND DATE_ADD(CURRENT_DATE,INTERVAL days DAY) ORDER BY PILOT ;;
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
SELECT PILOT, HOURS FROM pilot_hours P, earnedrating R WHERE P.ID = R.EMP_NUM AND RTG_CODE = rating ;;
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

--
-- Current Database: `aviaco`
--

USE `aviaco`;

--
-- Final view structure for view `aircraft_list`
--

/*!50001 DROP VIEW IF EXISTS `aircraft_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`s215013395`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `aircraft_list` AS select `C`.`CHAR_TRIP` AS `ID`,`C`.`CHAR_FUEL_GALLONS` AS `CHAR_FUEL_GALLONS`,`C`.`CHAR_OIL_QTS` AS `CHAR_OIL_QTS`,`A`.`MOD_CODE` AS `MOD_CODE` from (`charter` `C` join `aircraft` `A`) where (`C`.`AC_NUMBER` = `A`.`AC_NUMBER`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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
/*!50001 VIEW `average_consumption` AS select `A`.`MOD_CODE` AS `MOD_CODE`,avg(`C`.`CHAR_FUEL_GALLONS`) AS `FUEL`,avg(`C`.`CHAR_OIL_QTS`) AS `OIL` from (`charter` `C` join `aircraft` `A`) where (`C`.`AC_NUMBER` = `A`.`AC_NUMBER`) group by `A`.`MOD_CODE` */;
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
/*!50001 VIEW `engine_service` AS select `aircraft`.`AC_NUMBER` AS `AC_NUMBER`,(100 - (`aircraft`.`AC_TTEL` % 100)) AS `EL`,(100 - (`aircraft`.`AC_TTER` % 100)) AS `ER` from `aircraft` */;
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
/*!50001 VIEW `pilot_list` AS select distinct `E`.`EMP_NUM` AS `ID`,`E`.`EMP_FNAME` AS `EMP_FNAME`,`E`.`EMP_LNAME` AS `EMP_LNAME`,`E`.`EMP_HIRE_DATE` AS `EMP_HIRE_DATE`,`P`.`PIL_MED_DATE` AS `PIL_MED_DATE`,`P`.`PIL_RATINGS` AS `PIL_RATINGS`,`R`.`EARNRTG_DATE` AS `EARNRTG_DATE` from ((`employee` `E` join `pilot` `P`) join `earnedrating` `R`) where ((`P`.`EMP_NUM` = `E`.`EMP_NUM`) and (`R`.`EMP_NUM` = `P`.`EMP_NUM`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pilot_meddate_list`
--

/*!50001 DROP VIEW IF EXISTS `pilot_meddate_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`s215013395`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pilot_meddate_list` AS select `p`.`EMP_NUM` AS `ID`,concat(`e`.`EMP_FNAME`,' ',`e`.`EMP_LNAME`) AS `PILOT`,`p`.`PIL_MED_DATE` AS `PIL_MED_DATE` from (`employee` `e` join `pilot` `p`) where (`p`.`EMP_NUM` = `e`.`EMP_NUM`) */;
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

-- Dump completed on 2017-12-12  1:09:30
