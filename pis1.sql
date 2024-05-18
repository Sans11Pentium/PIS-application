-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: pis
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `adminpasswords`
--

DROP TABLE IF EXISTS `adminpasswords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminpasswords` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `appname` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminpasswords`
--

LOCK TABLES `adminpasswords` WRITE;
/*!40000 ALTER TABLE `adminpasswords` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminpasswords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `birthdayemail`
--

DROP TABLE IF EXISTS `birthdayemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `birthdayemail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `icno` int DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `status_` varchar(2) DEFAULT NULL,
  `date_` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birthdayemail`
--

LOCK TABLES `birthdayemail` WRITE;
/*!40000 ALTER TABLE `birthdayemail` DISABLE KEYS */;
/*!40000 ALTER TABLE `birthdayemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `birthdaywishes`
--

DROP TABLE IF EXISTS `birthdaywishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `birthdaywishes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wishes` varchar(200) DEFAULT NULL,
  `wdate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birthdaywishes`
--

LOCK TABLES `birthdaywishes` WRITE;
/*!40000 ALTER TABLE `birthdaywishes` DISABLE KEYS */;
/*!40000 ALTER TABLE `birthdaywishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changepwdlink`
--

DROP TABLE IF EXISTS `changepwdlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changepwdlink` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `link` varchar(500) DEFAULT NULL,
  `linkdatetime` date DEFAULT NULL,
  `rnum` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changepwdlink`
--

LOCK TABLES `changepwdlink` WRITE;
/*!40000 ALTER TABLE `changepwdlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `changepwdlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companystructures`
--

DROP TABLE IF EXISTS `companystructures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companystructures` (
  `id` bigint NOT NULL DEFAULT '0',
  `title` tinytext CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `address` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci,
  `type` enum('Company','Head Office','Regional Office','Department','Unit','Sub Unit','Other') CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `country` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `parent` bigint DEFAULT NULL,
  `timezone` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL DEFAULT 'Europe/London',
  `heads` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `GO` bigint DEFAULT NULL,
  `DO` bigint DEFAULT NULL,
  `TD` bigint DEFAULT NULL,
  `OIC` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companystructures`
--

LOCK TABLES `companystructures` WRITE;
/*!40000 ALTER TABLE `companystructures` DISABLE KEYS */;
/*!40000 ALTER TABLE `companystructures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companystructures2`
--

DROP TABLE IF EXISTS `companystructures2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companystructures2` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` tinytext NOT NULL,
  `description` text NOT NULL,
  `address` text,
  `type` enum('Company','Head Office','Regional Office','Department','Unit','Sub Unit','Other') DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '0',
  `parent` bigint DEFAULT NULL,
  `timezone` varchar(100) NOT NULL DEFAULT 'Europe/London',
  `heads` varchar(255) DEFAULT NULL,
  `GO` bigint DEFAULT NULL,
  `DO` bigint DEFAULT NULL,
  `TD` bigint DEFAULT NULL,
  `OIC` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_CompanyStructures_Own` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companystructures2`
--

LOCK TABLES `companystructures2` WRITE;
/*!40000 ALTER TABLE `companystructures2` DISABLE KEYS */;
/*!40000 ALTER TABLE `companystructures2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `draudit`
--

DROP TABLE IF EXISTS `draudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `draudit` (
  `drauditid` bigint NOT NULL AUTO_INCREMENT,
  `AuditName` varchar(10) DEFAULT NULL,
  `AuditType` int NOT NULL,
  `AuditStartDt` date DEFAULT NULL,
  `AuditEndDt` date DEFAULT NULL,
  `AuditYear` int DEFAULT NULL,
  `Auditors` varchar(500) DEFAULT NULL,
  `CreateDt` date DEFAULT NULL,
  PRIMARY KEY (`drauditid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draudit`
--

LOCK TABLES `draudit` WRITE;
/*!40000 ALTER TABLE `draudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `draudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educationdetails`
--

DROP TABLE IF EXISTS `educationdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `educationdetails` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name_` varchar(200) DEFAULT NULL,
  `desig` varchar(100) DEFAULT NULL,
  `qualification_at_joining` varchar(200) DEFAULT NULL,
  `qualification_at_joining_subject` varchar(200) DEFAULT NULL,
  `qualification_at_joining_year` varchar(4) DEFAULT NULL,
  `qualifcation_after_joining1` varchar(200) DEFAULT NULL,
  `qualifcation_after_joining1_subject` varchar(200) DEFAULT NULL,
  `qualifcation_after_joining1_year` varchar(4) DEFAULT NULL,
  `qualifcation_after_joining2` varchar(200) DEFAULT NULL,
  `qualifcation_after_joining2_subject` varchar(200) DEFAULT NULL,
  `qualifcation_after_joining2_year` varchar(4) DEFAULT NULL,
  `qualifcation_after_joining3` varchar(200) DEFAULT NULL,
  `qualifcation_after_joining3_subject` varchar(200) DEFAULT NULL,
  `qualifcation_after_joining3_year` varchar(4) DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  `icno` varchar(5) DEFAULT NULL,
  `qualifcation_after_joining4` varchar(200) DEFAULT NULL,
  `qualifcation_after_joining4_subject` varchar(200) DEFAULT NULL,
  `qualifcation_after_joining4_year` varchar(200) DEFAULT NULL,
  `qualifcation_after_joining5` varchar(200) DEFAULT NULL,
  `qualifcation_after_joining5_subject` varchar(200) DEFAULT NULL,
  `qualifcation_after_joining5_year` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educationdetails`
--

LOCK TABLES `educationdetails` WRITE;
/*!40000 ALTER TABLE `educationdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `educationdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empcorrections`
--

DROP TABLE IF EXISTS `empcorrections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empcorrections` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(45) DEFAULT NULL,
  `correction_required` varchar(2000) DEFAULT NULL,
  `date` datetime NOT NULL,
  `isUpdate` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empcorrections`
--

LOCK TABLES `empcorrections` WRITE;
/*!40000 ALTER TABLE `empcorrections` DISABLE KEYS */;
/*!40000 ALTER TABLE `empcorrections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emplist`
--

DROP TABLE IF EXISTS `emplist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emplist` (
  `employee_id` bigint DEFAULT NULL,
  `Name` varchar(302) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emplist`
--

LOCK TABLES `emplist` WRITE;
/*!40000 ALTER TABLE `emplist` DISABLE KEYS */;
/*!40000 ALTER TABLE `emplist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(50) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `nationality` bigint DEFAULT NULL,
  `birthday` date DEFAULT '0000-00-00',
  `gender` enum('Male','Female') DEFAULT NULL,
  `marital_status` enum('Married','Single','Divorced','Widowed','Other') DEFAULT NULL,
  `ssn_num` varchar(100) DEFAULT NULL,
  `nic_num` varchar(100) DEFAULT NULL,
  `other_ID` varchar(100) DEFAULT NULL,
  `driving_license` varchar(100) DEFAULT NULL,
  `driving_license_exp_date` date DEFAULT '0000-00-00',
  `employment_status` bigint DEFAULT NULL,
  `job_title` bigint DEFAULT NULL,
  `pay_grade` bigint DEFAULT NULL,
  `work_station_id` varchar(100) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `country` char(2) DEFAULT NULL,
  `province` bigint DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `home_phone` varchar(50) DEFAULT NULL,
  `mobile_phone` varchar(50) DEFAULT NULL,
  `work_phone` varchar(50) DEFAULT NULL,
  `work_email` varchar(100) DEFAULT NULL,
  `private_email` varchar(100) DEFAULT NULL,
  `joined_date` date DEFAULT '0000-00-00',
  `confirmation_date` date DEFAULT '0000-00-00',
  `supervisor` bigint DEFAULT NULL,
  `indirect_supervisors` varchar(250) DEFAULT NULL,
  `department` bigint DEFAULT NULL,
  `custom1` varchar(250) DEFAULT NULL,
  `custom2` varchar(250) DEFAULT NULL,
  `custom3` varchar(250) DEFAULT NULL,
  `custom4` varchar(250) DEFAULT NULL,
  `custom5` varchar(250) DEFAULT NULL,
  `custom6` varchar(250) DEFAULT NULL,
  `custom7` varchar(250) DEFAULT NULL,
  `custom8` varchar(250) DEFAULT NULL,
  `custom9` varchar(250) DEFAULT NULL,
  `custom10` varchar(250) DEFAULT NULL,
  `termination_date` date DEFAULT '0000-00-00',
  `notes` text,
  `status` enum('Active','Terminated') DEFAULT 'Active',
  `ethnicity` bigint DEFAULT NULL,
  `immigration_status` bigint DEFAULT NULL,
  `approver1` bigint DEFAULT NULL,
  `approver2` bigint DEFAULT NULL,
  `approver3` bigint DEFAULT NULL,
  `cadre` varchar(100) DEFAULT NULL,
  `doj_drdo` date DEFAULT NULL,
  `dopr` date DEFAULT NULL,
  `posting_place` varchar(50) DEFAULT NULL,
  `image_path` varchar(100) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `lastUpdated` date DEFAULT NULL,
  `additional_charge1` bigint DEFAULT NULL,
  `additional_charge2` bigint DEFAULT NULL,
  `additional_charge3` bigint DEFAULT NULL,
  `AdditionalMember` varchar(500) DEFAULT NULL,
  `SAMPwd` varchar(50) DEFAULT '123',
  `aadhaarno` varchar(14) DEFAULT NULL,
  `dealingclerkid` int DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `DRONA_Mail` varchar(100) DEFAULT NULL,
  `Internet_Gov_Mail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_id` (`employee_id`),
  UNIQUE KEY `work_email` (`work_email`),
  KEY `Fk_Employee_Nationality` (`nationality`),
  KEY `Fk_Employee_JobTitle` (`job_title`),
  KEY `Fk_Employee_EmploymentStatus` (`employment_status`),
  KEY `Fk_Employee_Country` (`country`),
  KEY `Fk_Employee_Province` (`province`),
  KEY `Fk_Employee_Supervisor` (`supervisor`),
  KEY `Fk_Employee_CompanyStructures` (`department`),
  KEY `Fk_Employee_PayGrades` (`pay_grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_old`
--

DROP TABLE IF EXISTS `employees_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_old` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(50) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `nationality` bigint DEFAULT NULL,
  `birthday` date DEFAULT '0000-00-00',
  `gender` enum('Male','Female') DEFAULT NULL,
  `marital_status` enum('Married','Single','Divorced','Widowed','Other') DEFAULT NULL,
  `ssn_num` varchar(100) DEFAULT NULL,
  `nic_num` varchar(100) DEFAULT NULL,
  `other_ID` varchar(100) DEFAULT NULL,
  `driving_license` varchar(100) DEFAULT NULL,
  `driving_license_exp_date` date DEFAULT '0000-00-00',
  `employment_status` bigint DEFAULT NULL,
  `job_title` bigint DEFAULT NULL,
  `pay_grade` bigint DEFAULT NULL,
  `work_station_id` varchar(100) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `country` char(2) DEFAULT NULL,
  `province` bigint DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `home_phone` varchar(50) DEFAULT NULL,
  `mobile_phone` varchar(50) DEFAULT NULL,
  `work_phone` varchar(50) DEFAULT NULL,
  `work_email` varchar(100) DEFAULT NULL,
  `private_email` varchar(100) DEFAULT NULL,
  `joined_date` date DEFAULT '0000-00-00',
  `confirmation_date` date DEFAULT '0000-00-00',
  `supervisor` bigint DEFAULT NULL,
  `indirect_supervisors` varchar(250) DEFAULT NULL,
  `department` bigint DEFAULT NULL,
  `custom1` varchar(250) DEFAULT NULL,
  `custom2` varchar(250) DEFAULT NULL,
  `custom3` varchar(250) DEFAULT NULL,
  `custom4` varchar(250) DEFAULT NULL,
  `custom5` varchar(250) DEFAULT NULL,
  `custom6` varchar(250) DEFAULT NULL,
  `custom7` varchar(250) DEFAULT NULL,
  `custom8` varchar(250) DEFAULT NULL,
  `custom9` varchar(250) DEFAULT NULL,
  `custom10` varchar(250) DEFAULT NULL,
  `termination_date` date DEFAULT '0000-00-00',
  `notes` text,
  `status` enum('Active','Terminated') DEFAULT 'Active',
  `ethnicity` bigint DEFAULT NULL,
  `immigration_status` bigint DEFAULT NULL,
  `approver1` bigint DEFAULT NULL,
  `approver2` bigint DEFAULT NULL,
  `approver3` bigint DEFAULT NULL,
  `cadre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_id` (`employee_id`),
  UNIQUE KEY `work_email` (`work_email`),
  KEY `Fk_Employee_Nationality` (`nationality`),
  KEY `Fk_Employee_JobTitle` (`job_title`),
  KEY `Fk_Employee_EmploymentStatus` (`employment_status`),
  KEY `Fk_Employee_Country` (`country`),
  KEY `Fk_Employee_Province` (`province`),
  KEY `Fk_Employee_Supervisor` (`supervisor`),
  KEY `Fk_Employee_CompanyStructures` (`department`),
  KEY `Fk_Employee_PayGrades` (`pay_grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_old`
--

LOCK TABLES `employees_old` WRITE;
/*!40000 ALTER TABLE `employees_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeesnew`
--

DROP TABLE IF EXISTS `employeesnew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeesnew` (
  `id` bigint NOT NULL DEFAULT '0',
  `employee_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `middle_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `nationality` bigint DEFAULT NULL,
  `birthday` date DEFAULT '0000-00-00',
  `gender` enum('Male','Female') CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `marital_status` enum('Married','Single','Divorced','Widowed','Other') CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `ssn_num` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `nic_num` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `other_ID` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `driving_license` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `driving_license_exp_date` date DEFAULT '0000-00-00',
  `employment_status` bigint DEFAULT NULL,
  `job_title` bigint DEFAULT NULL,
  `pay_grade` bigint DEFAULT NULL,
  `work_station_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `address1` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `address2` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `city` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `country` char(2) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `province` bigint DEFAULT NULL,
  `postal_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `home_phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `mobile_phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `work_phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `work_email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `private_email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `joined_date` date DEFAULT '0000-00-00',
  `confirmation_date` date DEFAULT '0000-00-00',
  `supervisor` bigint DEFAULT NULL,
  `indirect_supervisors` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `department` bigint DEFAULT NULL,
  `custom1` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `custom2` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `custom3` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `custom4` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `custom5` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `custom6` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `custom7` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `custom8` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `custom9` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `custom10` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `termination_date` date DEFAULT '0000-00-00',
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci,
  `status` enum('Active','Terminated') CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT 'Active',
  `ethnicity` bigint DEFAULT NULL,
  `immigration_status` bigint DEFAULT NULL,
  `approver1` bigint DEFAULT NULL,
  `approver2` bigint DEFAULT NULL,
  `approver3` bigint DEFAULT NULL,
  `cadre` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `doj_drdo` date DEFAULT NULL,
  `dopr` date DEFAULT NULL,
  `posting_place` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `image_path` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `remarks` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `lastUpdated` date DEFAULT NULL,
  `additional_charge1` bigint DEFAULT NULL,
  `additional_charge2` bigint DEFAULT NULL,
  `additional_charge3` bigint DEFAULT NULL,
  `AdditionalMember` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeesnew`
--

LOCK TABLES `employeesnew` WRITE;
/*!40000 ALTER TABLE `employeesnew` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeesnew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exemployee_status`
--

DROP TABLE IF EXISTS `exemployee_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exemployee_status` (
  `id` int NOT NULL,
  `status_code` int DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exemployee_status`
--

LOCK TABLES `exemployee_status` WRITE;
/*!40000 ALTER TABLE `exemployee_status` DISABLE KEYS */;
INSERT INTO `exemployee_status` VALUES (100,0,'active'),(101,1,'retired'),(102,2,'transfer'),(103,3,'obituary'),(104,4,'Technical Resignation');
/*!40000 ALTER TABLE `exemployee_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exemployees`
--

DROP TABLE IF EXISTS `exemployees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exemployees` (
  `id` bigint NOT NULL DEFAULT '0',
  `employee_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `middle_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `nationality` bigint DEFAULT NULL,
  `birthday` date DEFAULT '0000-00-00',
  `gender` enum('Male','Female') CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `marital_status` enum('Married','Single','Divorced','Widowed','Other') CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `ssn_num` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `nic_num` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `other_ID` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `driving_license` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `driving_license_exp_date` date DEFAULT '0000-00-00',
  `employment_status` bigint DEFAULT NULL,
  `job_title` bigint DEFAULT NULL,
  `pay_grade` bigint DEFAULT NULL,
  `work_station_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `address1` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `address2` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `city` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `country` char(2) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `province` bigint DEFAULT NULL,
  `postal_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `home_phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `mobile_phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `work_phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `work_email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `private_email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `joined_date` date DEFAULT '0000-00-00',
  `confirmation_date` date DEFAULT '0000-00-00',
  `supervisor` bigint DEFAULT NULL,
  `indirect_supervisors` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `department` bigint DEFAULT NULL,
  `custom1` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `custom2` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `custom3` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `custom4` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `custom5` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `custom6` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `custom7` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `custom8` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `custom9` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `custom10` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `termination_date` date DEFAULT '0000-00-00',
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci,
  `status` enum('Active','Terminated') CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT 'Active',
  `ethnicity` bigint DEFAULT NULL,
  `immigration_status` bigint DEFAULT NULL,
  `approver1` bigint DEFAULT NULL,
  `approver2` bigint DEFAULT NULL,
  `approver3` bigint DEFAULT NULL,
  `cadre` varchar(100) DEFAULT NULL,
  `doj_drdo` date DEFAULT NULL,
  `dopr` date DEFAULT NULL,
  `posting_place` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `image_path` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `remarks` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `deleteRemarks` varchar(200) DEFAULT NULL,
  `dateOfDelete` date DEFAULT NULL,
  `reasonForDelete` varchar(50) DEFAULT NULL,
  `lastUpdated` date DEFAULT NULL,
  `additional_charge1` bigint DEFAULT NULL,
  `additional_charge2` bigint DEFAULT NULL,
  `additional_charge3` bigint DEFAULT NULL,
  `AdditionalMember` varchar(500) DEFAULT NULL,
  `SAMPwd` varchar(50) DEFAULT '123',
  `aadhaarno` varchar(14) DEFAULT NULL,
  `dealingclerkid` int DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `Internet_Gov_Mail` varchar(200) DEFAULT NULL,
  `DRONA_Mail` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exemployees`
--

LOCK TABLES `exemployees` WRITE;
/*!40000 ALTER TABLE `exemployees` DISABLE KEYS */;
/*!40000 ALTER TABLE `exemployees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `importantnumbers`
--

DROP TABLE IF EXISTS `importantnumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `importantnumbers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(10) DEFAULT NULL,
  `name_` varchar(25) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `extension` varchar(60) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `designation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `importantnumbers`
--

LOCK TABLES `importantnumbers` WRITE;
/*!40000 ALTER TABLE `importantnumbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `importantnumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobtitles`
--

DROP TABLE IF EXISTS `jobtitles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobtitles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `specification` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobtitles`
--

LOCK TABLES `jobtitles` WRITE;
/*!40000 ALTER TABLE `jobtitles` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobtitles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mraudit`
--

DROP TABLE IF EXISTS `mraudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mraudit` (
  `mrauditid` bigint NOT NULL AUTO_INCREMENT,
  `AuditName` varchar(15) DEFAULT NULL,
  `AuditType` int NOT NULL,
  `AuditStartDt` date DEFAULT NULL,
  `AuditEndDt` date DEFAULT NULL,
  `AuditYear` int DEFAULT NULL,
  `Auditors` varchar(500) DEFAULT NULL,
  `CreateDt` date DEFAULT NULL,
  PRIMARY KEY (`mrauditid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mraudit`
--

LOCK TABLES `mraudit` WRITE;
/*!40000 ALTER TABLE `mraudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `mraudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msdsdocs`
--

DROP TABLE IF EXISTS `msdsdocs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `msdsdocs` (
  `msdsID` bigint NOT NULL AUTO_INCREMENT,
  `ChemicalName` varchar(200) DEFAULT NULL,
  `Formula` varchar(500) DEFAULT NULL,
  `CASNumber` varchar(400) DEFAULT NULL,
  `PublisherIssuedBy` varchar(400) DEFAULT NULL,
  `FileDate` date DEFAULT NULL,
  `UploadedBy` varchar(300) DEFAULT NULL,
  `FilePath` varchar(300) DEFAULT NULL,
  `UploadDt` date DEFAULT NULL,
  `FileName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`msdsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msdsdocs`
--

LOCK TABLES `msdsdocs` WRITE;
/*!40000 ALTER TABLE `msdsdocs` DISABLE KEYS */;
/*!40000 ALTER TABLE `msdsdocs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referencesdocs`
--

DROP TABLE IF EXISTS `referencesdocs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referencesdocs` (
  `refID` bigint NOT NULL AUTO_INCREMENT,
  `FileName` varchar(200) DEFAULT NULL,
  `Descriptions` varchar(500) DEFAULT NULL,
  `PublisherIssuedBy` varchar(400) DEFAULT NULL,
  `FileDate` date DEFAULT NULL,
  `UploadedBy` varchar(300) DEFAULT NULL,
  `FilePath` varchar(300) DEFAULT NULL,
  `UploadDt` date DEFAULT NULL,
  PRIMARY KEY (`refID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referencesdocs`
--

LOCK TABLES `referencesdocs` WRITE;
/*!40000 ALTER TABLE `referencesdocs` DISABLE KEYS */;
/*!40000 ALTER TABLE `referencesdocs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ssplempoffdutyreport`
--

DROP TABLE IF EXISTS `ssplempoffdutyreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ssplempoffdutyreport` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `Name` varchar(100) NOT NULL,
  `FromDt` date NOT NULL,
  `ToDt` date NOT NULL,
  `Duration` int NOT NULL,
  `Remarks` varchar(500) DEFAULT NULL,
  `div_name` varchar(200) NOT NULL,
  `div_id` int NOT NULL,
  `DO_Name` varchar(100) DEFAULT NULL,
  `Year` varchar(5) DEFAULT NULL,
  `Months` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ssplempoffdutyreport`
--

LOCK TABLES `ssplempoffdutyreport` WRITE;
/*!40000 ALTER TABLE `ssplempoffdutyreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `ssplempoffdutyreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ssplemppassword`
--

DROP TABLE IF EXISTS `ssplemppassword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ssplemppassword` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `sampwd` varchar(30) NOT NULL DEFAULT '123',
  `attendanceGODOpwd` varchar(30) DEFAULT '123',
  `idForGODO` varchar(30) DEFAULT NULL,
  `pispwd` varchar(100) DEFAULT '123',
  `pispwdchange` varchar(1) DEFAULT 'N',
  `ipaddress` varchar(100) DEFAULT NULL,
  `LeavePwd` varchar(100) DEFAULT '123',
  `dakpwd` varchar(20) DEFAULT NULL,
  `vcpwd` varchar(10) DEFAULT '123',
  `aadhaarpwd` varchar(14) DEFAULT NULL,
  `drdsedupwd` varchar(20) DEFAULT '123',
  `cpwd` varchar(50) DEFAULT NULL,
  `canteenpwd` varchar(50) DEFAULT '123',
  `attpwd` varchar(20) DEFAULT '123',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ssplemppassword`
--

LOCK TABLES `ssplemppassword` WRITE;
/*!40000 ALTER TABLE `ssplemppassword` DISABLE KEYS */;
/*!40000 ALTER TABLE `ssplemppassword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldealingclerk`
--

DROP TABLE IF EXISTS `tbldealingclerk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbldealingclerk` (
  `dcid` bigint NOT NULL AUTO_INCREMENT,
  `dcname` varchar(50) DEFAULT NULL,
  `dcname1` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`dcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldealingclerk`
--

LOCK TABLES `tbldealingclerk` WRITE;
/*!40000 ALTER TABLE `tbldealingclerk` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldealingclerk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldetailedrecomm`
--

DROP TABLE IF EXISTS `tbldetailedrecomm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbldetailedrecomm` (
  `drec_id` bigint NOT NULL AUTO_INCREMENT,
  `detailed_recommendation` mediumtext,
  `drec_date` date DEFAULT NULL,
  `status` int DEFAULT '0',
  `AuditType` int NOT NULL,
  `buildingno` varchar(500) DEFAULT NULL,
  `ob_categ` varchar(200) DEFAULT NULL,
  `observation` mediumtext,
  `recommendation` mediumtext,
  `AuditYear` int DEFAULT NULL,
  `AuditDate` varchar(30) DEFAULT NULL,
  `auditname` varchar(15) DEFAULT NULL,
  `referenceno` varchar(500) DEFAULT NULL,
  `delStatus` int DEFAULT '0',
  UNIQUE KEY `AuditYear` (`drec_id`,`AuditYear`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (`AuditYear`)
(PARTITION p2015 VALUES LESS THAN (2016) ENGINE = InnoDB,
 PARTITION p2016 VALUES LESS THAN (2017) ENGINE = InnoDB,
 PARTITION p2017 VALUES LESS THAN (2018) ENGINE = InnoDB,
 PARTITION p2018 VALUES LESS THAN (2019) ENGINE = InnoDB,
 PARTITION p2019 VALUES LESS THAN (2020) ENGINE = InnoDB,
 PARTITION p2020 VALUES LESS THAN (2021) ENGINE = InnoDB,
 PARTITION p2021 VALUES LESS THAN (2022) ENGINE = InnoDB,
 PARTITION p2022 VALUES LESS THAN (2023) ENGINE = InnoDB,
 PARTITION p2023 VALUES LESS THAN (2024) ENGINE = InnoDB,
 PARTITION p2024 VALUES LESS THAN (2025) ENGINE = InnoDB,
 PARTITION p2025 VALUES LESS THAN (2026) ENGINE = InnoDB,
 PARTITION p2026 VALUES LESS THAN (2027) ENGINE = InnoDB,
 PARTITION p2027 VALUES LESS THAN (2028) ENGINE = InnoDB,
 PARTITION p2028 VALUES LESS THAN (2029) ENGINE = InnoDB,
 PARTITION p2029 VALUES LESS THAN (2030) ENGINE = InnoDB,
 PARTITION p2030 VALUES LESS THAN (2031) ENGINE = InnoDB,
 PARTITION p2031 VALUES LESS THAN (2032) ENGINE = InnoDB,
 PARTITION p2032 VALUES LESS THAN (2033) ENGINE = InnoDB,
 PARTITION p2033 VALUES LESS THAN (2034) ENGINE = InnoDB,
 PARTITION p2034 VALUES LESS THAN (2035) ENGINE = InnoDB,
 PARTITION p2035 VALUES LESS THAN (2036) ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldetailedrecomm`
--

LOCK TABLES `tbldetailedrecomm` WRITE;
/*!40000 ALTER TABLE `tbldetailedrecomm` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldetailedrecomm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldrobsertbldrobsertest`
--

DROP TABLE IF EXISTS `tbldrobsertbldrobsertest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbldrobsertbldrobsertest` (
  `to_div` bigint DEFAULT NULL,
  `to_div_name` varchar(500) DEFAULT NULL,
  `audityear` int DEFAULT NULL,
  `progress` varchar(50) DEFAULT NULL,
  `ob_categ` varchar(200) DEFAULT NULL,
  `FSA` int NOT NULL DEFAULT '0',
  `EPSA` int NOT NULL DEFAULT '0',
  `ISA` int NOT NULL DEFAULT '0',
  `IntSA` int NOT NULL DEFAULT '0',
  `ClustSA` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldrobsertbldrobsertest`
--

LOCK TABLES `tbldrobsertbldrobsertest` WRITE;
/*!40000 ALTER TABLE `tbldrobsertbldrobsertest` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldrobsertbldrobsertest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldrobsertest`
--

DROP TABLE IF EXISTS `tbldrobsertest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbldrobsertest` (
  `to_div` bigint DEFAULT NULL,
  `to_div_name` varchar(500) DEFAULT NULL,
  `audityear` int DEFAULT NULL,
  `progress` varchar(50) DEFAULT NULL,
  `ob_categ` varchar(200) DEFAULT NULL,
  `auditname` varchar(15) DEFAULT NULL,
  `FSA` int NOT NULL DEFAULT '0',
  `EPSA` int NOT NULL DEFAULT '0',
  `ISA` int NOT NULL DEFAULT '0',
  `IntSA` int NOT NULL DEFAULT '0',
  `ClustSA` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldrobsertest`
--

LOCK TABLES `tbldrobsertest` WRITE;
/*!40000 ALTER TABLE `tbldrobsertest` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldrobsertest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldrobservations`
--

DROP TABLE IF EXISTS `tbldrobservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbldrobservations` (
  `obser_id` bigint NOT NULL AUTO_INCREMENT,
  `drec_id` bigint DEFAULT NULL,
  `to_div` bigint DEFAULT NULL,
  `sentdt` date DEFAULT NULL,
  `progress` varchar(50) DEFAULT NULL,
  `remarks` mediumtext,
  `pdc` date DEFAULT NULL,
  `observationdt` date DEFAULT NULL,
  `completedby` varchar(200) DEFAULT NULL,
  `completedbyPosition` varchar(20) DEFAULT NULL,
  `to_div_name` varchar(500) DEFAULT NULL,
  `Reassigned` varchar(5) DEFAULT 'No',
  `AuditType` int NOT NULL,
  `divCloseStatus` varchar(20) DEFAULT 'Open',
  `ReassignedFromID` int DEFAULT '0',
  `ReassignedFromName` varchar(200) DEFAULT 'None',
  `buildingno` varchar(200) DEFAULT NULL,
  `ob_categ` varchar(200) DEFAULT NULL,
  `recommendation` mediumtext,
  `observation` mediumtext,
  `AuditDate` date DEFAULT NULL,
  `AuditYear` int DEFAULT NULL,
  `AuditName` varchar(15) DEFAULT NULL,
  `referenceno` varchar(500) DEFAULT NULL,
  UNIQUE KEY `audityear` (`obser_id`,`AuditYear`),
  KEY `drec_id` (`drec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (`AuditYear`)
(PARTITION p2015 VALUES LESS THAN (2016) ENGINE = InnoDB,
 PARTITION p2016 VALUES LESS THAN (2017) ENGINE = InnoDB,
 PARTITION p2017 VALUES LESS THAN (2018) ENGINE = InnoDB,
 PARTITION p2018 VALUES LESS THAN (2019) ENGINE = InnoDB,
 PARTITION p2019 VALUES LESS THAN (2020) ENGINE = InnoDB,
 PARTITION p2020 VALUES LESS THAN (2021) ENGINE = InnoDB,
 PARTITION p2021 VALUES LESS THAN (2022) ENGINE = InnoDB,
 PARTITION p2022 VALUES LESS THAN (2023) ENGINE = InnoDB,
 PARTITION p2023 VALUES LESS THAN (2024) ENGINE = InnoDB,
 PARTITION p2024 VALUES LESS THAN (2025) ENGINE = InnoDB,
 PARTITION p2025 VALUES LESS THAN (2026) ENGINE = InnoDB,
 PARTITION p2026 VALUES LESS THAN (2027) ENGINE = InnoDB,
 PARTITION p2027 VALUES LESS THAN (2028) ENGINE = InnoDB,
 PARTITION p2028 VALUES LESS THAN (2029) ENGINE = InnoDB,
 PARTITION p2029 VALUES LESS THAN (2030) ENGINE = InnoDB,
 PARTITION p2030 VALUES LESS THAN (2031) ENGINE = InnoDB,
 PARTITION p2031 VALUES LESS THAN (2032) ENGINE = InnoDB,
 PARTITION p2032 VALUES LESS THAN (2033) ENGINE = InnoDB,
 PARTITION p2033 VALUES LESS THAN (2034) ENGINE = InnoDB,
 PARTITION p2034 VALUES LESS THAN (2035) ENGINE = InnoDB,
 PARTITION p2035 VALUES LESS THAN (2036) ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldrobservations`
--

LOCK TABLES `tbldrobservations` WRITE;
/*!40000 ALTER TABLE `tbldrobservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldrobservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmajorrecomm`
--

DROP TABLE IF EXISTS `tblmajorrecomm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblmajorrecomm` (
  `rec_id` bigint NOT NULL AUTO_INCREMENT,
  `major_recommendation` mediumtext,
  `rec_date` date DEFAULT NULL,
  `status` int DEFAULT (0),
  `AuditType` int NOT NULL,
  `AuditDate` varchar(30) DEFAULT NULL,
  `AuditYear` int DEFAULT NULL,
  `auditname` varchar(15) DEFAULT NULL,
  `delStatus` int DEFAULT '0',
  UNIQUE KEY `AuditYear` (`rec_id`,`AuditYear`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (`AuditYear`)
(PARTITION p2015 VALUES LESS THAN (2016) ENGINE = InnoDB,
 PARTITION p2016 VALUES LESS THAN (2017) ENGINE = InnoDB,
 PARTITION p2017 VALUES LESS THAN (2018) ENGINE = InnoDB,
 PARTITION p2018 VALUES LESS THAN (2019) ENGINE = InnoDB,
 PARTITION p2019 VALUES LESS THAN (2020) ENGINE = InnoDB,
 PARTITION p2020 VALUES LESS THAN (2021) ENGINE = InnoDB,
 PARTITION p2021 VALUES LESS THAN (2022) ENGINE = InnoDB,
 PARTITION p2022 VALUES LESS THAN (2023) ENGINE = InnoDB,
 PARTITION p2023 VALUES LESS THAN (2024) ENGINE = InnoDB,
 PARTITION p2024 VALUES LESS THAN (2025) ENGINE = InnoDB,
 PARTITION p2025 VALUES LESS THAN (2026) ENGINE = InnoDB,
 PARTITION p2026 VALUES LESS THAN (2027) ENGINE = InnoDB,
 PARTITION p2027 VALUES LESS THAN (2028) ENGINE = InnoDB,
 PARTITION p2028 VALUES LESS THAN (2029) ENGINE = InnoDB,
 PARTITION p2029 VALUES LESS THAN (2030) ENGINE = InnoDB,
 PARTITION p2030 VALUES LESS THAN (2031) ENGINE = InnoDB,
 PARTITION p2031 VALUES LESS THAN (2032) ENGINE = InnoDB,
 PARTITION p2032 VALUES LESS THAN (2033) ENGINE = InnoDB,
 PARTITION p2033 VALUES LESS THAN (2034) ENGINE = InnoDB,
 PARTITION p2034 VALUES LESS THAN (2035) ENGINE = InnoDB,
 PARTITION p2035 VALUES LESS THAN (2036) ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmajorrecomm`
--

LOCK TABLES `tblmajorrecomm` WRITE;
/*!40000 ALTER TABLE `tblmajorrecomm` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmajorrecomm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmrobservations`
--

DROP TABLE IF EXISTS `tblmrobservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblmrobservations` (
  `obser_id` bigint NOT NULL AUTO_INCREMENT,
  `rec_id` bigint DEFAULT NULL,
  `major_recommendation` mediumtext,
  `to_div` bigint DEFAULT NULL,
  `sentdt` date DEFAULT NULL,
  `progress` varchar(50) DEFAULT NULL,
  `remarks` varchar(400) DEFAULT NULL,
  `pdc` date DEFAULT NULL,
  `observationdt` date DEFAULT NULL,
  `completedby` varchar(200) DEFAULT NULL,
  `completedbyPosition` varchar(20) DEFAULT NULL,
  `to_div_name` varchar(500) DEFAULT NULL,
  `Reassigned` varchar(5) DEFAULT (_utf8mb4'No'),
  `AuditType` int NOT NULL,
  `divCloseStatus` varchar(20) DEFAULT 'Open',
  `ReassignedFromID` int DEFAULT '0',
  `ReassignedFromName` varchar(500) DEFAULT 'None',
  `AuditDate` date DEFAULT NULL,
  `AuditYear` int DEFAULT NULL,
  `FSAcount` int DEFAULT '0',
  `EPSAcount` int DEFAULT '0',
  `ISAcount` int DEFAULT '0',
  `ImplementedCount` int DEFAULT '0',
  `NotImplementedCount` int DEFAULT '0',
  `InProgressCount` int DEFAULT '0',
  `IntSACount` int DEFAULT '0',
  `AuditName` varchar(15) DEFAULT NULL,
  UNIQUE KEY `audityear` (`obser_id`,`AuditYear`),
  KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (`AuditYear`)
(PARTITION p2015 VALUES LESS THAN (2016) ENGINE = InnoDB,
 PARTITION p2016 VALUES LESS THAN (2017) ENGINE = InnoDB,
 PARTITION p2017 VALUES LESS THAN (2018) ENGINE = InnoDB,
 PARTITION p2018 VALUES LESS THAN (2019) ENGINE = InnoDB,
 PARTITION p2019 VALUES LESS THAN (2020) ENGINE = InnoDB,
 PARTITION p2020 VALUES LESS THAN (2021) ENGINE = InnoDB,
 PARTITION p2021 VALUES LESS THAN (2022) ENGINE = InnoDB,
 PARTITION p2022 VALUES LESS THAN (2023) ENGINE = InnoDB,
 PARTITION p2023 VALUES LESS THAN (2024) ENGINE = InnoDB,
 PARTITION p2024 VALUES LESS THAN (2025) ENGINE = InnoDB,
 PARTITION p2025 VALUES LESS THAN (2026) ENGINE = InnoDB,
 PARTITION p2026 VALUES LESS THAN (2027) ENGINE = InnoDB,
 PARTITION p2027 VALUES LESS THAN (2028) ENGINE = InnoDB,
 PARTITION p2028 VALUES LESS THAN (2029) ENGINE = InnoDB,
 PARTITION p2029 VALUES LESS THAN (2030) ENGINE = InnoDB,
 PARTITION p2030 VALUES LESS THAN (2031) ENGINE = InnoDB,
 PARTITION p2031 VALUES LESS THAN (2032) ENGINE = InnoDB,
 PARTITION p2032 VALUES LESS THAN (2033) ENGINE = InnoDB,
 PARTITION p2033 VALUES LESS THAN (2034) ENGINE = InnoDB,
 PARTITION p2034 VALUES LESS THAN (2035) ENGINE = InnoDB,
 PARTITION p2035 VALUES LESS THAN (2036) ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmrobservations`
--

LOCK TABLES `tblmrobservations` WRITE;
/*!40000 ALTER TABLE `tblmrobservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmrobservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsafetydivsreport`
--

DROP TABLE IF EXISTS `tblsafetydivsreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblsafetydivsreport` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rec_id` bigint DEFAULT NULL,
  `major_recommendation` varchar(1000) DEFAULT NULL,
  `Progress` varchar(50) DEFAULT NULL,
  `AuditType` int DEFAULT NULL,
  `AuditDate` date DEFAULT NULL,
  `AuditYear` int DEFAULT NULL,
  `AuditName` varchar(200) DEFAULT NULL,
  `Savedt` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsafetydivsreport`
--

LOCK TABLES `tblsafetydivsreport` WRITE;
/*!40000 ALTER TABLE `tblsafetydivsreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsafetydivsreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsafetydivsreportdr`
--

DROP TABLE IF EXISTS `tblsafetydivsreportdr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblsafetydivsreportdr` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `drec_id` bigint DEFAULT NULL,
  `Recommendation` varchar(1000) DEFAULT NULL,
  `Progress` varchar(50) DEFAULT NULL,
  `Ob_Categ` varchar(100) DEFAULT NULL,
  `AuditType` int DEFAULT NULL,
  `AuditDate` date DEFAULT NULL,
  `AuditYear` int DEFAULT NULL,
  `AuditName` varchar(200) DEFAULT NULL,
  `ReferenceNo` varchar(200) DEFAULT NULL,
  `Savedt` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsafetydivsreportdr`
--

LOCK TABLES `tblsafetydivsreportdr` WRITE;
/*!40000 ALTER TABLE `tblsafetydivsreportdr` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsafetydivsreportdr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wetrequest`
--

DROP TABLE IF EXISTS `wetrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wetrequest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `icno` int DEFAULT NULL,
  `name_` varchar(100) DEFAULT NULL,
  `desig` varchar(100) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `dateofreq` date DEFAULT NULL,
  `timeofreq` varchar(20) DEFAULT NULL,
  `purpose` varchar(500) DEFAULT NULL,
  `nooftea` varchar(10) DEFAULT NULL,
  `teaprice` varchar(10) DEFAULT NULL,
  `totalteaprice` varchar(10) DEFAULT NULL,
  `noofcoffee` varchar(10) DEFAULT NULL,
  `coffeeprice` varchar(10) DEFAULT NULL,
  `totalcoffeeprice` varchar(10) DEFAULT NULL,
  `noofsnacks` varchar(10) DEFAULT NULL,
  `snacksprice` varchar(10) DEFAULT NULL,
  `totalsnacksprice` varchar(10) DEFAULT NULL,
  `noofbiscuit` varchar(10) DEFAULT NULL,
  `biscuitprice` varchar(10) DEFAULT NULL,
  `totalbiscuitprice` varchar(10) DEFAULT NULL,
  `noofcolddrink` varchar(10) DEFAULT NULL,
  `colddrinkprice` varchar(10) DEFAULT NULL,
  `totalcolddrinkprice` varchar(10) DEFAULT NULL,
  `noofwater` varchar(10) DEFAULT NULL,
  `waterprice` varchar(10) DEFAULT NULL,
  `totalwaterprice` varchar(10) DEFAULT NULL,
  `lunchspecial` varchar(10) DEFAULT NULL,
  `lunchspecialprice` varchar(10) DEFAULT NULL,
  `totallunchspecialprice` varchar(10) DEFAULT NULL,
  `buffetlunch` varchar(10) DEFAULT NULL,
  `buffetlunchprice` varchar(10) DEFAULT NULL,
  `totalbuffetlunchprice` varchar(10) DEFAULT NULL,
  `totalamount` varchar(10) DEFAULT NULL,
  `doicno` varchar(10) DEFAULT NULL,
  `doname` varchar(100) DEFAULT NULL,
  `domaiaddress` varchar(100) DEFAULT NULL,
  `goicno` varchar(10) DEFAULT NULL,
  `goname` varchar(10) DEFAULT NULL,
  `gomailaddress` varchar(100) DEFAULT NULL,
  `godoapprovestatus` varchar(100) DEFAULT NULL,
  `chairmansec` varchar(100) DEFAULT NULL,
  `canteenapprovestatus` varchar(10) DEFAULT NULL,
  `requesteddatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wetrequest`
--

LOCK TABLES `wetrequest` WRITE;
/*!40000 ALTER TABLE `wetrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `wetrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pis'
--

--
-- Dumping routines for database 'pis'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-10 16:01:28
