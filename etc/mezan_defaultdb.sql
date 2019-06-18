-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mezan_defaultdb
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `mezan_defaultdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mezan_defaultdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mezan_defaultdb`;

--
-- Table structure for table `accountaction`
--

DROP TABLE IF EXISTS `accountaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AccountNo` int(11) DEFAULT NULL,
  `ActionType` int(11) DEFAULT NULL COMMENT '0 credit - 1 debit',
  `Value` double DEFAULT NULL,
  `BillNo` int(11) DEFAULT NULL,
  `Writer` varchar(100) DEFAULT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountaction`
--

LOCK TABLES `accountaction` WRITE;
/*!40000 ALTER TABLE `accountaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `accountaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `AccountNo` int(11) NOT NULL AUTO_INCREMENT,
  `Active` int(11) NOT NULL DEFAULT '1',
  `Name` varchar(200) DEFAULT NULL,
  `PhoneNo` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `what3words` varchar(200) DEFAULT NULL,
  `Balance` double DEFAULT '0',
  `DebitAllowance` double NOT NULL DEFAULT '0',
  `Writer` varchar(8) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`AccountNo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,1,'الدعم الفني','0913749750','info@mezan.ly',NULL,NULL,NULL,0,100,'1','2018-02-14 00:20:45');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billheader`
--

DROP TABLE IF EXISTS `billheader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billheader` (
  `BillNo` int(11) NOT NULL AUTO_INCREMENT,
  `TableNo` int(10) DEFAULT NULL,
  `OrderNo` int(10) DEFAULT NULL,
  `BillTotal` double DEFAULT NULL,
  `Discount` double DEFAULT NULL,
  `AfterDiscount` double DEFAULT NULL,
  `Tax` double DEFAULT NULL,
  `AfterTax` double DEFAULT NULL COMMENT 'BillTotal',
  `PayType` int(11) DEFAULT NULL COMMENT '0-cash, 1-Account, 2-cashcoupon, 3-accountcoupon',
  `Account` int(11) DEFAULT NULL,
  `Coupon` varchar(100) DEFAULT NULL,
  `Writer` varchar(20) DEFAULT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LastUpdate` timestamp NULL DEFAULT NULL,
  `UpdateWriter` varchar(50) NOT NULL,
  PRIMARY KEY (`BillNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billheader`
--

LOCK TABLES `billheader` WRITE;
/*!40000 ALTER TABLE `billheader` DISABLE KEYS */;
/*!40000 ALTER TABLE `billheader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billpay`
--

DROP TABLE IF EXISTS `billpay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billpay` (
  `BillPayNo` int(11) NOT NULL AUTO_INCREMENT,
  `BillNo` int(11) NOT NULL DEFAULT '0',
  `BillTotal` double DEFAULT '0',
  `PrevPaid` double DEFAULT '0',
  `Amount` double DEFAULT '0',
  `PayType` tinyint(3) unsigned DEFAULT '0',
  `Account` int(11) DEFAULT '0',
  `Writer` varchar(50) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BillPayNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billpay`
--

LOCK TABLES `billpay` WRITE;
/*!40000 ALTER TABLE `billpay` DISABLE KEYS */;
/*!40000 ALTER TABLE `billpay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billunpay`
--

DROP TABLE IF EXISTS `billunpay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billunpay` (
  `BillUnPayNo` int(11) NOT NULL AUTO_INCREMENT,
  `BillNo` int(11) NOT NULL DEFAULT '0',
  `BillTotal` double DEFAULT '0',
  `PrevPaid` double DEFAULT '0',
  `Amount` double DEFAULT '0',
  `PayType` tinyint(3) unsigned DEFAULT '0',
  `Account` int(11) DEFAULT '0',
  `Writer` varchar(50) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BillUnPayNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billunpay`
--

LOCK TABLES `billunpay` WRITE;
/*!40000 ALTER TABLE `billunpay` DISABLE KEYS */;
/*!40000 ALTER TABLE `billunpay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` int(11) NOT NULL DEFAULT '0',
  `Cat` varchar(200) DEFAULT NULL,
  `Pic` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,1,'خضروات','vitamins-5.png'),(2,1,'فواكه','!custom-130.png'),(3,1,'لحوم','staff.png'),(4,1,'مواد غدائية','cereal-8.png'),(5,0,'مشروبات و عصائر','!custom-17.png'),(6,0,'مشروبات ساخنة','!custom-25.jpeg'),(7,0,'سندوتشات','!custom-24.png'),(8,1,'مشروبات و عصائر','!custom-17.png'),(9,0,'حلويات','!custom-39.png');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Active` int(3) NOT NULL DEFAULT '1',
  `Used` varchar(3) NOT NULL DEFAULT '0',
  `UsedOnInvoice` varchar(100) DEFAULT NULL,
  `CouponNo` varchar(100) DEFAULT NULL,
  `Discount` varchar(15) DEFAULT NULL,
  `PriceCut` varchar(15) DEFAULT '0',
  `ItemID` int(30) DEFAULT NULL,
  `Category` varchar(150) DEFAULT '0',
  `Expiery` date DEFAULT NULL,
  `QuantityLimit` int(20) DEFAULT NULL,
  `Writer` varchar(255) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailschedule`
--

DROP TABLE IF EXISTS `emailschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Sent` int(1) NOT NULL DEFAULT '0',
  `time_sent` varchar(50) DEFAULT NULL,
  `email_type` varchar(50) DEFAULT NULL,
  `from_name` varchar(50) DEFAULT NULL,
  `from_email` varchar(100) DEFAULT NULL,
  `to_name` varchar(50) DEFAULT NULL,
  `to_email` varchar(100) DEFAULT NULL,
  `reply_to_name` varchar(50) DEFAULT NULL,
  `reply_to_email` varchar(50) DEFAULT NULL,
  `cc_email` varchar(50) DEFAULT NULL,
  `bcc_email` varchar(50) DEFAULT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `body_url` varchar(250) DEFAULT NULL,
  `attach_url` varchar(250) DEFAULT NULL,
  `misc1` varchar(500) DEFAULT NULL,
  `misc2` varchar(500) DEFAULT NULL,
  `misc3` varchar(500) DEFAULT NULL,
  `misc4` varchar(500) DEFAULT NULL,
  `misc5` varchar(500) DEFAULT NULL,
  `timstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailschedule`
--

LOCK TABLES `emailschedule` WRITE;
/*!40000 ALTER TABLE `emailschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` int(3) NOT NULL DEFAULT '0' COMMENT '1 means purchases',
  `Active` int(3) NOT NULL DEFAULT '1',
  `Company` varchar(150) DEFAULT NULL,
  `Supplier` varchar(150) DEFAULT NULL,
  `Buyer` varchar(150) DEFAULT NULL,
  `Category` varchar(200) DEFAULT NULL,
  `Reason` varchar(300) DEFAULT NULL,
  `PurchaseNo` int(11) DEFAULT NULL,
  `InvoiceDate` date DEFAULT NULL,
  `InvoiceNo` varchar(100) DEFAULT NULL,
  `InvoiceFile` varchar(200) DEFAULT NULL,
  `InvoiceAmount` varchar(50) DEFAULT NULL,
  `AmountPaid` varchar(50) DEFAULT NULL,
  `Writer` varchar(255) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fbillitems`
--

DROP TABLE IF EXISTS `fbillitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fbillitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Active` int(3) NOT NULL DEFAULT '1',
  `TableNo` int(10) NOT NULL DEFAULT '0',
  `No` int(15) NOT NULL,
  `Code` varchar(100) NOT NULL,
  `SellPrice` varchar(200) NOT NULL,
  `Quantity` varchar(200) NOT NULL,
  `rQuantity` varchar(20) NOT NULL DEFAULT '0',
  `CostPrice` double NOT NULL,
  `Writer` varchar(255) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fbillitems`
--

LOCK TABLES `fbillitems` WRITE;
/*!40000 ALTER TABLE `fbillitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `fbillitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(200) DEFAULT NULL,
  `Code` varchar(100) DEFAULT NULL,
  `Picture` varchar(200) DEFAULT NULL,
  `Category` varchar(200) DEFAULT NULL,
  `SellPrice` float DEFAULT NULL,
  `LastBuyPrice` float DEFAULT NULL,
  `AverageCost` double NOT NULL DEFAULT '0',
  `Stock` float DEFAULT '0',
  `Type` int(10) NOT NULL DEFAULT '0',
  `Unit` varchar(100) NOT NULL,
  `Recipe` int(11) DEFAULT NULL,
  `RecipeQtyMake` int(11) NOT NULL DEFAULT '1',
  `OptimalQty` int(11) NOT NULL DEFAULT '0',
  `Prepared` int(3) NOT NULL DEFAULT '0',
  `Active` int(50) NOT NULL DEFAULT '1',
  `Writer` varchar(100) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'فلفل احمر','','!custom-117.png','خضروات',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-09-29 13:53:20'),(2,'طماطم','','!custom-96.png','خضروات',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-09-29 13:54:14'),(3,'فقاع','','!custom-107.png','خضروات',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-09-29 13:54:40'),(4,'بصل اخضر','','!custom-110.png','خضروات',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-09-29 13:55:19'),(5,'بازيلا','','!custom-113.png','خضروات',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-09-29 13:56:59'),(6,'بروكلي','','custom-4.png','خضروات',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-09-29 14:01:37'),(7,'جزر','','carrot.png','خضروات',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-09-29 14:02:32'),(8,'ثوم','','!custom-100.png','خضروات',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-09-29 14:03:03'),(9,'الباذنجان','','!custom-119.png','خضروات',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-09-29 14:04:26'),(10,'الزهرة','','!custom-116.png','خضروات',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-09-29 14:04:56'),(11,'فجل','','radish.png','خضروات',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-09-29 14:05:24'),(12,'الخيار','','!custom-118.png','خضروات',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-09-29 14:06:04'),(13,'الليمون','','!custom-90.png','خضروات',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-09-29 14:06:32'),(14,'الخس','','!custom-95.png','خضروات',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-09-29 14:08:22'),(15,'الذرى','','custom-1.png','خضروات',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-09-29 14:08:39'),(16,'البطاطا','','baker-1.png','خضروات',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-09-29 14:14:42'),(17,'البصل','','onion.png','خضروات',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-09-29 14:15:09'),(18,'القرع','','pumpkin.png','خضروات',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-09-29 14:17:50'),(19,'الزيتون','','olives.png','خضروات',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-09-29 14:18:29'),(20,'القرع الخضراء','','!custom-118.png','خضروات',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-09-29 14:22:54'),(21,'عنب','','!custom-0.png','فواكه',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-10-06 19:23:05'),(22,'فروالة','','strawberry.png','فواكه',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-10-06 20:03:14'),(23,'أناناس','','pineapple.png','فواكه',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-10-06 20:03:59'),(24,'كرز','','!custom-1.png','فواكه',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-10-06 20:04:18'),(25,'كيوي','','!custom-89.png','فواكه',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-10-06 20:04:42'),(26,'تفاح','','!custom-71.png','فواكه',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-10-06 20:05:12'),(27,'موز','','!custom-85.png','فواكه',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-10-06 20:05:33'),(28,'تمر','','!custom-111.png','فواكه',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-10-06 20:06:41'),(29,'برتقال','','!custom-10.png','فواكه',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-10-06 20:07:07'),(30,'لحم بقري','','!custom-97.png','لحوم',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-10-06 20:12:53'),(31,'دجاج','','!custom-98.jpg','لحوم',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-10-06 20:14:57'),(32,'سمك','','fish.png','لحوم',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-10-06 20:15:18'),(33,'جمبري','','shrimp.png','لحوم',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-10-06 20:16:49'),(34,'حليب','','!custom-109.png','مواد غدائية',0,NULL,0,0,1,'3',NULL,1,0,0,1,'','2017-10-06 20:17:37'),(35,'بيض','','!custom-104.png','مواد غدائية',0,NULL,0,0,1,'9',NULL,1,0,0,1,'','2017-10-06 20:18:12'),(36,'بن قهوة','','!custom-103.png','مواد غدائية',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-10-06 20:18:32'),(37,'خبز','','!custom-60.png','مواد غدائية',0,NULL,0,0,1,'9',NULL,1,0,0,1,'','2017-10-06 20:19:25'),(38,'ارز','','!custom-122.png','مواد غدائية',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-10-06 20:20:22'),(39,'سكر','','sugar.png','مواد غدائية',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-10-06 20:20:45'),(40,'كيس شاهي اخضر','','!custom-114.png','مواد غدائية',0,NULL,0,0,1,'9',NULL,1,0,0,1,'','2017-10-06 20:21:51'),(41,'كيس شاهي احمر','','!custom-115.png','مواد غدائية',0,NULL,0,0,1,'9',NULL,1,0,0,1,'','2017-10-06 20:22:14'),(42,'زيت الزيتون','','!custom-108.png','مواد غدائية',0,NULL,0,0,1,'3',NULL,1,0,0,1,'','2017-10-06 20:22:40'),(43,'عسل','','!custom-105.png','مواد غدائية',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-10-06 20:23:42'),(44,'جبنة حمراء','','dessert.png','مواد غدائية',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-10-06 20:24:11'),(45,'جبنة شرائح','','freshness.png','مواد غدائية',0,NULL,0,0,1,'9',NULL,1,0,0,1,'','2017-10-06 20:24:41'),(46,'جبنة مازوريلا','','!custom-126.png','مواد غدائية',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-10-06 20:26:37'),(47,'نوتيلا','','!custom-121.png','مواد غدائية',0,NULL,0,0,1,'2',NULL,1,0,0,1,'','2017-10-06 20:28:01'),(48,'معكرونة سباقيتي','','!custom-77.png','مواد غدائية',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-10-06 20:28:44'),(49,'كيتشب','','syrup-ketchup.png','مواد غدائية',0,NULL,0,0,1,'2',NULL,1,0,0,1,'','2017-10-06 20:30:56'),(50,'مايونيز','','ketchup.png','مواد غدائية',0,NULL,0,0,1,'2',NULL,1,0,0,1,'','2017-10-06 20:31:26'),(51,'هريسة','','syrup.png','مواد غدائية',0,NULL,0,0,1,'2',NULL,1,0,0,1,'','2017-10-06 20:31:49'),(52,'طماطم حكة','','!custom-125.png','مواد غدائية',0,NULL,0,0,1,'2',NULL,1,0,0,1,'','2017-10-06 20:33:22'),(53,'ملح','','salt.png','مواد غدائية',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2017-10-06 20:33:49'),(54,'تن','','tuna-fish.png','مواد غدائية',0,NULL,0,0,1,'2',NULL,1,0,0,1,'','2017-10-08 23:40:59'),(55,'قنينة ماء','','!custom-47.png','مشروبات و عصائر',1,NULL,0,0,0,'',NULL,1,50,0,1,'','2018-02-13 02:11:40'),(56,'كابتشينو','','latte.png','مشروبات ساخنة',3,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-08 20:05:43'),(57,'شاهي اخضر','','!custom-27.png','مشروبات ساخنة',2,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 18:19:51'),(58,'شاهي احمر','','!custom-25.png','مشروبات ساخنة',2,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 18:20:19'),(59,'اسبريسو','','coffee-cup-4.png','مشروبات ساخنة',2,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 18:22:15'),(60,'كافى لاتي','','frappe-2.png','مشروبات ساخنة',4,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 18:23:02'),(61,'موكا','','frappe-1.png','مشروبات ساخنة',4,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 18:23:25'),(62,'كاكاو','','espresso.png','مشروبات ساخنة',2,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 18:24:15'),(63,'اميريكانو','','coffee-cup-7.png','مشروبات ساخنة',2,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 18:25:18'),(64,'همبورقا','','cheese-burger.png','سندوتشات',7,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 18:27:08'),(65,'همبورقا دبل','','custom-0.png','سندوتشات',10,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 18:28:26'),(66,'كلوب ساندوتش','','!custom-29.png','سندوتشات',8,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 18:29:58'),(67,'توست تن','','sandwich.png','سندوتشات',4,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 18:31:29'),(68,'سبريات','','!custom-163.jpeg','مشروبات و عصائر',0,NULL,0,0,1,'9',NULL,1,0,0,1,'','2018-04-13 18:39:52'),(69,'سبريات','','!custom-163.jpeg','مشروبات و عصائر',3,NULL,0,0,0,'9',NULL,1,0,0,1,'','2018-04-13 18:39:52'),(70,'فانتا','','!custom-154.jpeg','مشروبات و عصائر',0,NULL,0,0,1,'9',NULL,1,0,0,1,'','2018-04-13 18:48:17'),(71,'فانتا','','!custom-154.jpeg','مشروبات و عصائر',3,NULL,0,0,0,'9',NULL,1,0,0,1,'','2018-04-13 18:48:17'),(72,'عصير خوخ','','!custom-153.jpeg','مشروبات و عصائر',0,NULL,0,0,1,'9',NULL,1,0,0,1,'','2018-04-13 18:49:02'),(73,'عصير خوخ','','!custom-153.jpeg','مشروبات و عصائر',3,NULL,0,0,0,'9',NULL,1,0,0,1,'','2018-04-13 18:49:02'),(74,'سيفن اب لايت','','!custom-151.jpeg','مشروبات و عصائر',0,NULL,0,0,1,'9',NULL,1,0,0,1,'','2018-04-13 18:49:35'),(75,'سيفن اب لايت','','!custom-151.jpeg','مشروبات و عصائر',3,NULL,0,0,0,'9',NULL,1,0,0,1,'','2018-04-13 18:49:35'),(76,'راني اناناس','','!custom-150.jpeg','مشروبات و عصائر',0,NULL,0,0,1,'9',NULL,1,0,0,1,'','2018-04-13 18:50:17'),(77,'راني اناناس','','!custom-150.jpeg','مشروبات و عصائر',3,NULL,0,0,0,'9',NULL,1,0,0,1,'','2018-04-13 18:50:17'),(78,'عصير اناناس','','!custom-152.jpeg','مشروبات و عصائر',0,NULL,0,0,1,'9',NULL,1,0,0,1,'','2018-04-13 18:50:55'),(79,'عصير اناناس','','!custom-152.jpeg','مشروبات و عصائر',3,NULL,0,0,0,'9',NULL,1,0,0,1,'','2018-04-13 18:50:55'),(80,'بيتر صودا','','!custom-147.jpeg','مشروبات و عصائر',0,NULL,0,0,1,'9',NULL,1,0,0,1,'','2018-04-13 18:51:27'),(81,'بيتر صودا','','!custom-147.jpeg','مشروبات و عصائر',3.5,NULL,0,0,0,'9',NULL,1,0,0,1,'','2018-04-13 18:51:27'),(82,'بيبسي','','!custom-146.jpeg','مشروبات و عصائر',0,NULL,0,0,1,'9',NULL,1,0,0,1,'','2018-04-13 18:51:54'),(83,'بيبسي','','!custom-146.jpeg','مشروبات و عصائر',3,NULL,0,0,0,'9',NULL,1,0,0,1,'','2018-04-13 18:51:54'),(84,'كوكاكولا','','!custom-145.jpeg','مشروبات و عصائر',0,NULL,0,0,1,'9',NULL,1,0,0,1,'','2018-04-13 18:52:18'),(85,'كوكاكولا','','!custom-145.jpeg','مشروبات و عصائر',3,NULL,0,0,0,'9',NULL,1,0,0,1,'','2018-04-13 18:52:18'),(86,'عصير كمثرى','','!custom-143.jpeg','مشروبات و عصائر',0,NULL,0,0,1,'9',NULL,1,0,0,1,'','2018-04-13 18:52:45'),(87,'عصير كمثرى','','!custom-143.jpeg','مشروبات و عصائر',3,NULL,0,0,0,'9',NULL,1,0,0,1,'','2018-04-13 18:52:45'),(88,'عصير برتقال','','!custom-142.jpeg','مشروبات و عصائر',0,NULL,0,0,1,'9',NULL,1,0,0,1,'','2018-04-13 18:53:12'),(89,'عصير برتقال','','!custom-142.jpeg','مشروبات و عصائر',3,NULL,0,0,0,'9',NULL,1,0,0,1,'','2018-04-13 18:53:12'),(90,'راني خوخ','','!custom-149.jpeg','مشروبات و عصائر',0,NULL,0,0,1,'9',NULL,1,0,0,1,'','2018-04-13 18:53:56'),(91,'راني خوخ','','!custom-149.jpeg','مشروبات و عصائر',3,NULL,0,0,0,'9',NULL,1,0,0,1,'','2018-04-13 18:53:56'),(92,'بوقا ليمون','','!custom-148.jpeg','مشروبات و عصائر',0,NULL,0,0,1,'9',NULL,1,0,0,1,'','2018-04-13 18:54:32'),(93,'بوقا ليمون','','!custom-148.jpeg','مشروبات و عصائر',3,NULL,0,0,0,'9',NULL,1,0,0,1,'','2018-04-13 18:54:32'),(94,'سيفن اب','','!custom-196.jpeg','مشروبات و عصائر',0,NULL,0,0,1,'9',NULL,1,0,0,1,'','2018-04-13 18:56:43'),(95,'سيفن اب','','!custom-196.jpeg','مشروبات و عصائر',3,NULL,0,0,0,'9',NULL,1,0,0,1,'','2018-04-13 18:56:43'),(96,'شاني','','!custom-197.jpeg','مشروبات و عصائر',0,NULL,0,0,1,'9',NULL,1,0,0,1,'','2018-04-13 18:58:35'),(97,'شاني','','!custom-197.jpeg','مشروبات و عصائر',3,NULL,0,0,0,'9',NULL,1,0,0,1,'','2018-04-13 18:58:35'),(98,'بيبسي','','!custom-195.jpeg','مشروبات و عصائر',0,NULL,0,0,1,'9',NULL,1,0,0,1,'','2018-04-13 18:59:00'),(99,'بيبسي','','!custom-195.jpeg','مشروبات و عصائر',3,NULL,0,0,0,'9',NULL,1,0,0,1,'','2018-04-13 18:59:00'),(100,'كريب نوتيلا','','!custom-41.png','حلويات',8,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 19:00:02'),(101,'كوب ايس كريم','','frozen-yogurt.png','حلويات',4,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 19:03:16'),(102,'كون ايس كريم','','ice-cream.png','حلويات',4,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 19:03:39'),(103,'كوكيز','','cookies2.png','حلويات',3,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 19:04:00'),(104,'بان كيك','','!custom-43.png','حلويات',5,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 19:04:30'),(105,'كيك فراولة','','piece-of-cake.png','حلويات',5,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 19:05:09'),(106,'كيك شوكلاتة','','!custom-42.png','حلويات',5,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 19:05:52'),(107,'دونت شوكلاتة','','doughnut.png','حلويات',4,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 19:06:15'),(108,'كب كيك شوكلاتة','','muffin-cake.png','حلويات',3,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 19:06:54'),(109,'كب كيك فراولة','','muffin.png','حلويات',3,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 19:07:16'),(110,'كيك بندق','','pancakes.png','حلويات',5,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 19:08:10'),(111,'بريوش','','!custom-84.jpg','حلويات',4,NULL,0,0,0,'',NULL,1,0,0,1,'','2018-04-13 19:09:22'),(112,'دقيق','','oat.png','مواد غدائية',0,NULL,0,0,1,'1',NULL,1,0,0,1,'','2018-06-03 05:27:21');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `NickName` varchar(100) DEFAULT NULL,
  `ProfilePic` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(100) DEFAULT NULL,
  `Account` varchar(100) DEFAULT NULL,
  `Discount` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Reset` varchar(100) DEFAULT NULL,
  `SafeBuffer` varchar(100) DEFAULT NULL,
  `ShowTables` varchar(100) DEFAULT NULL,
  `TableCount` varchar(100) DEFAULT NULL,
  `StockCount` varchar(100) DEFAULT NULL,
  `ShowZeroItems` varchar(100) DEFAULT NULL,
  `ChangeStockAlert` varchar(100) DEFAULT NULL,
  `NoStockAlert` varchar(100) DEFAULT NULL,
  `TakeAway` varchar(100) DEFAULT NULL,
  `MakeOrder` varchar(100) DEFAULT NULL,
  `ConfirmOrder` varchar(100) DEFAULT NULL,
  `Sales` varchar(100) DEFAULT NULL,
  `EditSales` varchar(100) DEFAULT NULL,
  `AccountSales` varchar(100) DEFAULT NULL,
  `AccountCredit` varchar(100) DEFAULT NULL,
  `AccountDebit` varchar(100) DEFAULT NULL,
  `Coupons` varchar(100) DEFAULT NULL,
  `Screens` varchar(100) DEFAULT NULL,
  `Kitchen` varchar(100) DEFAULT NULL,
  `Purchases` varchar(100) DEFAULT NULL,
  `Waste` varchar(100) DEFAULT NULL,
  `Inventory` varchar(100) DEFAULT NULL,
  `Expenses` varchar(100) DEFAULT NULL,
  `Recipes` varchar(100) DEFAULT NULL,
  `NewItem` varchar(100) DEFAULT NULL,
  `EditItem` varchar(100) DEFAULT NULL,
  `DeleteIcons` varchar(100) DEFAULT NULL,
  `Settings` varchar(100) DEFAULT NULL,
  `Active` varchar(100) DEFAULT NULL,
  `Timestamp` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'الإسم','اسم المستخدم','صورة المستخدم','البريد الإلكتروني','الهاتف','رقم الحساب','نسبة التخفيض','كلمة المرور','الرقم السري','معالجة الخزينة','إظهار الطاولات','الطلبيات في الطاولات','إظهار الأرصدة','إظهار الأصناف الغير متوفرة','تنبيه بتغيير الأرصدة','تنبيه بعدم توفر الأرصدة','طلبيات خارجية','إجراء طلبية','تأكيد الطلبية','المبيعات','تعديل المبيعات','بيع بالحسابات','ايداع للحسابات','سحب من الحسابات','الكوبونات','الشاشات','المطبخ','المشتريات','المخلفات','المخزون','المصروفات','المقادير','إضافة الأصناف','تعديل الأصناف','مسح الصور','الإعدادات','المستخدم مفعل','زمن الإنشاء');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `placetabels`
--

DROP TABLE IF EXISTS `placetabels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `placetabels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Active` int(3) NOT NULL DEFAULT '1' COMMENT 'Will not show in cart',
  `Deleted` int(10) NOT NULL DEFAULT '0' COMMENT 'Will not show in Kitchen',
  `Ready` int(6) NOT NULL DEFAULT '0',
  `PreparedBy` varchar(200) DEFAULT NULL,
  `BillNo` int(11) DEFAULT NULL,
  `OrderNo` int(11) DEFAULT NULL,
  `No` int(15) NOT NULL COMMENT '8888->Waste & 9999->Purchases',
  `Code` varchar(100) NOT NULL,
  `AName` varchar(200) NOT NULL,
  `SellPrice` varchar(200) NOT NULL,
  `Quantity` varchar(200) NOT NULL,
  `Url` varchar(200) NOT NULL,
  `Picture` varchar(200) NOT NULL,
  `ItemCode` varchar(150) DEFAULT NULL,
  `ItemUnit` varchar(50) DEFAULT NULL,
  `Writer` varchar(255) NOT NULL,
  `Timstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `placetabels`
--

LOCK TABLES `placetabels` WRITE;
/*!40000 ALTER TABLE `placetabels` DISABLE KEYS */;
/*!40000 ALTER TABLE `placetabels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Active` int(3) NOT NULL DEFAULT '1',
  `Type` int(3) NOT NULL DEFAULT '0',
  `No` int(15) NOT NULL,
  `ItemID` int(15) NOT NULL,
  `ItemCode` varchar(150) DEFAULT NULL,
  `AName` varchar(200) NOT NULL,
  `ItemUnit` varchar(200) DEFAULT NULL,
  `ItemUnitID` int(10) DEFAULT NULL,
  `BuyPrice` varchar(50) NOT NULL,
  `ItemTotal` varchar(50) NOT NULL,
  `BoxesNumber` varchar(50) NOT NULL,
  `ItemsPerBox` varchar(50) NOT NULL,
  `UnitPerItem` varchar(50) NOT NULL,
  `ItemUnitSum` varchar(50) NOT NULL,
  `Writer` varchar(255) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `readyorder`
--

DROP TABLE IF EXISTS `readyorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `readyorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNo` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `Notified` int(11) NOT NULL DEFAULT '0',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readyorder`
--

LOCK TABLES `readyorder` WRITE;
/*!40000 ALTER TABLE `readyorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `readyorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Active` int(3) NOT NULL DEFAULT '1',
  `RecipeForID` int(15) NOT NULL,
  `ItemID` int(50) NOT NULL,
  `ItemQTY` varchar(25) DEFAULT NULL,
  `ItemUNIT` int(100) DEFAULT NULL,
  `TimesToMainUnit` varchar(25) DEFAULT '1',
  `Writer` varchar(255) NOT NULL,
  `Timstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,1,69,68,'1',9,'1','','2018-04-13 18:39:52'),(2,1,71,70,'1',9,'1','','2018-04-13 18:48:17'),(3,1,73,72,'1',9,'1','','2018-04-13 18:49:02'),(4,1,75,74,'1',9,'1','','2018-04-13 18:49:35'),(5,1,77,76,'1',9,'1','','2018-04-13 18:50:17'),(6,1,79,78,'1',9,'1','','2018-04-13 18:50:55'),(7,1,81,80,'1',9,'1','','2018-04-13 18:51:27'),(8,1,83,82,'1',9,'1','','2018-04-13 18:51:54'),(9,1,85,84,'1',9,'1','','2018-04-13 18:52:18'),(10,1,87,86,'1',9,'1','','2018-04-13 18:52:45'),(11,1,89,88,'1',9,'1','','2018-04-13 18:53:12'),(12,1,91,90,'1',9,'1','','2018-04-13 18:53:56'),(13,1,93,92,'1',9,'1','','2018-04-13 18:54:32'),(14,1,95,94,'1',9,'1','','2018-04-13 18:56:43'),(15,1,97,96,'1',9,'1','','2018-04-13 18:58:35'),(16,1,99,98,'1',9,'1','','2018-04-13 18:59:00');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens`
--

DROP TABLE IF EXISTS `screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Active` int(3) NOT NULL DEFAULT '1',
  `Screen` int(15) NOT NULL,
  `ItemID` int(50) NOT NULL,
  `ItemPic` varchar(200) DEFAULT NULL,
  `PicType` int(3) NOT NULL DEFAULT '0',
  `Writer` varchar(255) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens`
--

LOCK TABLES `screens` WRITE;
/*!40000 ALTER TABLE `screens` DISABLE KEYS */;
/*!40000 ALTER TABLE `screens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CafeName` varchar(150) DEFAULT NULL,
  `EnCafeName` varchar(20) DEFAULT NULL,
  `CafeAddress` varchar(200) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `what3words` varchar(200) DEFAULT NULL,
  `CafePhone` varchar(15) DEFAULT NULL,
  `CafeEmail` varchar(50) DEFAULT NULL,
  `CafeGmail` varchar(100) DEFAULT NULL,
  `CafeGmailPass` varchar(100) DEFAULT NULL,
  `CafeWeb` varchar(50) DEFAULT NULL,
  `CafeFacebook` varchar(100) DEFAULT NULL,
  `Logo` varchar(200) DEFAULT NULL,
  `Color` varchar(20) DEFAULT NULL,
  `BackGroundColor` varchar(20) NOT NULL,
  `PassLength` int(10) DEFAULT NULL,
  `CafeTables` int(11) NOT NULL DEFAULT '1',
  `CafeScreens` int(11) NOT NULL DEFAULT '0',
  `ScreenItem` int(11) NOT NULL DEFAULT '1',
  `ScreenPrice` int(11) NOT NULL DEFAULT '1',
  `ScreenCurrency` varchar(100) DEFAULT NULL,
  `DaysPreExpense` int(11) NOT NULL,
  `SalesTax` varchar(5) NOT NULL DEFAULT '0',
  `NegativeStocks` int(11) NOT NULL DEFAULT '0',
  `OrderNo` int(11) NOT NULL DEFAULT '0',
  `OrderDate` date DEFAULT NULL,
  `expiery` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'ميزان كافيه','Mezan Cafe','طرابلس',NULL,NULL,NULL,'','',NULL,NULL,'http://www.mezan.ly','','Logo.png','#92b220','#f6f6f6',6,10,2,1,1,'دينار',60,'0',0,0,'2019-01-08',NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockchanged`
--

DROP TABLE IF EXISTS `stockchanged`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stockchanged` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `No` int(50) NOT NULL,
  `ItemID` int(50) NOT NULL,
  `OldStock` double DEFAULT NULL,
  `NewStock` double DEFAULT NULL,
  `UnitPerItem` double DEFAULT NULL,
  `OldUPI` double DEFAULT NULL,
  `NEWUPI` double DEFAULT NULL,
  `Writer` varchar(255) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockchanged`
--

LOCK TABLES `stockchanged` WRITE;
/*!40000 ALTER TABLE `stockchanged` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockchanged` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Unit` varchar(150) DEFAULT NULL,
  `Short` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,'كيلوجرام','kg'),(2,'جرام','g'),(3,'لتر','l'),(4,'مللي جرام','mg'),(5,'مللي لتر','ml'),(6,'كوب','glass'),(7,'ملعقة صغيرة','teas'),(8,'ملعقة كبيرة','tbls'),(9,'قطعة','');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) DEFAULT NULL,
  `NickName` varchar(100) DEFAULT NULL,
  `ProfilePic` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(100) DEFAULT NULL,
  `Account` int(11) DEFAULT NULL,
  `Discount` int(10) NOT NULL DEFAULT '0',
  `Password` char(32) DEFAULT NULL,
  `Reset` int(11) NOT NULL DEFAULT '0',
  `SafeBuffer` float NOT NULL DEFAULT '0',
  `ShowTables` int(11) NOT NULL DEFAULT '0',
  `TableCount` int(11) NOT NULL DEFAULT '0',
  `StockCount` int(11) NOT NULL DEFAULT '0',
  `ShowZeroItems` int(11) NOT NULL DEFAULT '1',
  `ChangeStockAlert` int(11) NOT NULL DEFAULT '0',
  `NoStockAlert` int(11) NOT NULL DEFAULT '0',
  `TakeAway` int(11) NOT NULL DEFAULT '0',
  `MakeOrder` int(11) NOT NULL DEFAULT '0',
  `ConfirmOrder` int(11) NOT NULL DEFAULT '1',
  `Sales` int(10) NOT NULL DEFAULT '0',
  `EditSales` int(10) NOT NULL DEFAULT '0',
  `AccountSales` int(11) NOT NULL DEFAULT '0',
  `AccountCredit` int(11) NOT NULL DEFAULT '0',
  `AccountDebit` int(11) NOT NULL DEFAULT '0',
  `Coupons` int(11) DEFAULT '0',
  `Screens` int(11) NOT NULL DEFAULT '0',
  `Kitchen` int(3) NOT NULL DEFAULT '0',
  `Purchases` int(10) NOT NULL DEFAULT '0',
  `Waste` int(11) NOT NULL DEFAULT '0',
  `Inventory` int(11) NOT NULL DEFAULT '0',
  `Expenses` int(10) NOT NULL DEFAULT '0',
  `Recipes` int(10) NOT NULL DEFAULT '0',
  `NewItem` int(10) NOT NULL DEFAULT '0',
  `EditItem` int(10) NOT NULL DEFAULT '0',
  `DeleteIcons` int(11) NOT NULL DEFAULT '0',
  `Settings` int(10) NOT NULL DEFAULT '0',
  `Active` int(50) NOT NULL DEFAULT '1',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'الدعم الفني','KZ','','info@mezan.ly','0913749750',1,0,'e86f4d997f024482d24aaaa2e8018c5b',0,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,'2016-12-26 21:42:39');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wasteitems`
--

DROP TABLE IF EXISTS `wasteitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wasteitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Active` int(3) NOT NULL DEFAULT '1',
  `No` int(15) NOT NULL,
  `Code` varchar(100) NOT NULL,
  `SellPrice` double NOT NULL,
  `Quantity` double NOT NULL,
  `CostPrice` double NOT NULL,
  `Unit` varchar(100) NOT NULL,
  `Writer` varchar(255) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wasteitems`
--

LOCK TABLES `wasteitems` WRITE;
/*!40000 ALTER TABLE `wasteitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `wasteitems` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-09  4:00:02
