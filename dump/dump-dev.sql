-- MariaDB dump 10.19  Distrib 10.5.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: mysql    Database: db
-- ------------------------------------------------------
-- Server version	5.7.41

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
-- Table structure for table `cms3_apiship_orders`
--

DROP TABLE IF EXISTS `cms3_apiship_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_apiship_orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `number` int(11) unsigned NOT NULL,
  `umi_order_ref_number` int(11) unsigned NOT NULL,
  `provider_order_ref_number` varchar(255) DEFAULT NULL,
  `status` enum('pending','delivered','delivering','deliveryCanceled','lost','notApplicable','onPointIn','onPointOut','onWay','partialReturn','problem','readyForRecipient','returned','returnedFromDelivery','returning','returnReady','unknown','uploaded','uploading','uploadingError') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `number` (`number`),
  KEY `umi_order_ref_number` (`umi_order_ref_number`),
  KEY `provider_order_ref_number` (`provider_order_ref_number`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_apiship_orders`
--

LOCK TABLES `cms3_apiship_orders` WRITE;
/*!40000 ALTER TABLE `cms3_apiship_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_apiship_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_appointment_employee_schedule`
--

DROP TABLE IF EXISTS `cms3_appointment_employee_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_appointment_employee_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `day` enum('0','1','2','3','4','5','6') NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `employee schedule to employees` FOREIGN KEY (`employee_id`) REFERENCES `cms3_appointment_employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_appointment_employee_schedule`
--

LOCK TABLES `cms3_appointment_employee_schedule` WRITE;
/*!40000 ALTER TABLE `cms3_appointment_employee_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_appointment_employee_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_appointment_employees`
--

DROP TABLE IF EXISTS `cms3_appointment_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_appointment_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_appointment_employees`
--

LOCK TABLES `cms3_appointment_employees` WRITE;
/*!40000 ALTER TABLE `cms3_appointment_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_appointment_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_appointment_employees_services`
--

DROP TABLE IF EXISTS `cms3_appointment_employees_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_appointment_employees_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id and service_id` (`employee_id`,`service_id`),
  KEY `employees services to services` (`service_id`),
  CONSTRAINT `employees services to employees` FOREIGN KEY (`employee_id`) REFERENCES `cms3_appointment_employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employees services to services` FOREIGN KEY (`service_id`) REFERENCES `cms3_appointment_services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_appointment_employees_services`
--

LOCK TABLES `cms3_appointment_employees_services` WRITE;
/*!40000 ALTER TABLE `cms3_appointment_employees_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_appointment_employees_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_appointment_orders`
--

DROP TABLE IF EXISTS `cms3_appointment_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_appointment_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) unsigned NOT NULL,
  `employee_id` int(11) unsigned DEFAULT NULL,
  `create_date` int(11) unsigned NOT NULL,
  `date` int(11) unsigned NOT NULL,
  `time` time NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` mediumtext,
  `status_id` enum('1','2','3') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_appointment_orders`
--

LOCK TABLES `cms3_appointment_orders` WRITE;
/*!40000 ALTER TABLE `cms3_appointment_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_appointment_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_appointment_service_groups`
--

DROP TABLE IF EXISTS `cms3_appointment_service_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_appointment_service_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_appointment_service_groups`
--

LOCK TABLES `cms3_appointment_service_groups` WRITE;
/*!40000 ALTER TABLE `cms3_appointment_service_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_appointment_service_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_appointment_services`
--

DROP TABLE IF EXISTS `cms3_appointment_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_appointment_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `time` time NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `services to service_groups` (`group_id`),
  CONSTRAINT `services to service_groups` FOREIGN KEY (`group_id`) REFERENCES `cms3_appointment_service_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_appointment_services`
--

LOCK TABLES `cms3_appointment_services` WRITE;
/*!40000 ALTER TABLE `cms3_appointment_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_appointment_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_cluster_nodes`
--

DROP TABLE IF EXISTS `cms3_cluster_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_cluster_nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_ip` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `node_id` (`id`),
  KEY `node_ip` (`node_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_cluster_nodes`
--

LOCK TABLES `cms3_cluster_nodes` WRITE;
/*!40000 ALTER TABLE `cms3_cluster_nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_cluster_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_cluster_nodes_cache_keys`
--

DROP TABLE IF EXISTS `cms3_cluster_nodes_cache_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_cluster_nodes_cache_keys` (
  `node_id` int(11) DEFAULT NULL,
  `key` varchar(255) NOT NULL DEFAULT '',
  KEY `node_id` (`node_id`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_cluster_nodes_cache_keys`
--

LOCK TABLES `cms3_cluster_nodes_cache_keys` WRITE;
/*!40000 ALTER TABLE `cms3_cluster_nodes_cache_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_cluster_nodes_cache_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_data_cache`
--

DROP TABLE IF EXISTS `cms3_data_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_data_cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `create_time` int(11) NOT NULL,
  `expire_time` int(11) NOT NULL,
  `entry_time` int(11) NOT NULL,
  `entries_number` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `Life time` (`expire_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_data_cache`
--

LOCK TABLES `cms3_data_cache` WRITE;
/*!40000 ALTER TABLE `cms3_data_cache` DISABLE KEYS */;
INSERT INTO `cms3_data_cache` VALUES ('620767eae0e8a7d314b53cbbb7ac9ab2','s:202:\"{\"_browser_name\":\"Firefox\",\"_version\":\"110.0\",\"_platform\":\"Windows\",\"_os\":\"unknown\",\"_is_aol\":false,\"_is_mobile\":false,\"_is_tablet\":false,\"_is_robot\":false,\"_is_facebook\":false,\"_aol_version\":\"unknown\"}\";',1678957465,1742115865,0,0),('last-release-revision','i:91974;',1678957598,1679216798,0,0),('last-release-info','s:183:\"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<modules>\n  <system>\n    <version>22</version>\n    <revision>91974</revision>\n    <date>2022-10-12T09:13:38+03:00</date>\n  </system>\n</modules>\n\";',1678957598,1679216798,0,0),('last-release-version','i:22;',1678957598,1679216798,0,0),('support-end-time','i:1710482728;',1678957606,1679216806,0,0);
/*!40000 ALTER TABLE `cms3_data_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_domain_mirrows`
--

DROP TABLE IF EXISTS `cms3_domain_mirrows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_domain_mirrows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host` varchar(64) DEFAULT NULL,
  `rel` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `host` (`host`),
  KEY `Domain to mirrows relation_FK` (`rel`),
  CONSTRAINT `FK_Domain to mirrows relation` FOREIGN KEY (`rel`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_domain_mirrows`
--

LOCK TABLES `cms3_domain_mirrows` WRITE;
/*!40000 ALTER TABLE `cms3_domain_mirrows` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_domain_mirrows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_domains`
--

DROP TABLE IF EXISTS `cms3_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_domains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host` varchar(64) NOT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `default_lang_id` int(10) unsigned DEFAULT NULL,
  `use_ssl` tinyint(1) DEFAULT NULL,
  `favicon` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `host` (`host`),
  KEY `Domain to default language relation_FK` (`default_lang_id`),
  CONSTRAINT `FK_Domain to default language relation` FOREIGN KEY (`default_lang_id`) REFERENCES `cms3_langs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_domains`
--

LOCK TABLES `cms3_domains` WRITE;
/*!40000 ALTER TABLE `cms3_domains` DISABLE KEYS */;
INSERT INTO `cms3_domains` VALUES (1,'localhost:8410',1,1,0,NULL);
/*!40000 ALTER TABLE `cms3_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_emarket_top`
--

DROP TABLE IF EXISTS `cms3_emarket_top`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_emarket_top` (
  `id` int(11) NOT NULL,
  `date` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `total_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_emarket_top`
--

LOCK TABLES `cms3_emarket_top` WRITE;
/*!40000 ALTER TABLE `cms3_emarket_top` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_emarket_top` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_fields_controller`
--

DROP TABLE IF EXISTS `cms3_fields_controller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_fields_controller` (
  `ord` int(11) DEFAULT NULL,
  `field_id` int(10) unsigned DEFAULT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  KEY `rel to field_FK` (`field_id`),
  KEY `rel to field group_FK` (`group_id`),
  KEY `ord` (`ord`),
  CONSTRAINT `FK_rel to field` FOREIGN KEY (`field_id`) REFERENCES `cms3_object_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_rel to field group` FOREIGN KEY (`group_id`) REFERENCES `cms3_object_field_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_fields_controller`
--

LOCK TABLES `cms3_fields_controller` WRITE;
/*!40000 ALTER TABLE `cms3_fields_controller` DISABLE KEYS */;
INSERT INTO `cms3_fields_controller` VALUES (5,1,1),(5,2,2),(10,3,2),(15,4,2),(20,5,2),(25,6,2),(30,7,2),(5,11,4),(10,12,4),(15,13,4),(20,14,4),(5,15,5),(10,16,5),(5,17,6),(10,18,6),(15,19,6),(20,20,6),(5,21,7),(10,22,7),(5,23,8),(5,2,9),(10,3,9),(15,6,9),(20,5,9),(25,7,9),(30,24,9),(5,11,11),(10,12,11),(15,13,11),(20,14,11),(5,15,12),(10,16,12),(5,17,13),(10,18,13),(15,19,13),(20,20,13),(5,21,14),(10,22,14),(5,25,15),(10,26,15),(15,27,15),(20,28,15),(5,29,16),(5,30,17),(5,31,18),(5,31,19),(5,32,20),(5,32,21),(5,35,24),(10,36,24),(15,37,24),(20,38,24),(25,39,24),(5,41,26),(5,42,27),(10,43,27),(15,44,27),(20,45,27),(5,46,28),(10,47,28),(15,48,28),(20,49,28),(25,50,28),(5,51,29),(10,52,29),(15,53,29),(20,54,29),(25,55,29),(30,56,29),(5,57,30),(10,53,30),(15,58,30),(20,59,30),(25,55,30),(5,57,31),(10,53,31),(15,58,31),(20,59,31),(25,55,31),(5,34,32),(10,60,32),(5,61,33),(10,62,33),(15,63,33),(20,64,33),(5,65,34),(5,66,35),(10,67,35),(15,68,35),(20,69,35),(5,70,36),(5,71,37),(5,72,38),(5,73,39),(10,74,39),(15,75,39),(5,76,40),(10,77,40),(15,78,40),(5,73,42),(10,74,42),(15,75,42),(5,79,43),(5,80,44),(10,81,44),(15,82,44),(20,83,44),(25,84,44),(30,85,44),(35,86,44),(5,87,45),(5,88,46),(10,89,46),(15,90,46),(20,91,46),(25,92,46),(5,93,47),(10,94,47),(15,95,47),(20,96,47),(25,97,47),(30,98,47),(35,99,47),(40,100,47),(45,101,47),(50,102,47),(55,103,47),(60,104,47),(65,105,47),(70,106,47),(75,107,47),(80,108,47),(5,109,48),(5,110,49),(5,40,50),(10,111,50),(5,112,51),(10,113,51),(15,114,51),(5,115,52),(10,116,52),(15,117,52),(5,40,53),(10,111,53),(5,118,54),(10,119,54),(15,120,54),(20,49,54),(25,121,54),(5,122,55),(10,123,55),(15,124,55),(5,125,56),(10,126,56),(15,127,56),(20,128,56),(25,129,56),(30,130,56),(35,131,56),(5,132,57),(10,133,57),(15,134,57),(5,135,58),(10,136,58),(15,137,58),(20,138,58),(25,139,58),(30,140,58),(35,141,58),(40,142,58),(45,143,58),(5,40,59),(10,111,59),(5,144,60),(10,145,60),(15,146,60),(25,148,60),(30,149,60),(35,150,60),(40,151,60),(45,152,60),(50,153,60),(55,154,60),(60,155,60),(65,156,60),(70,157,60),(75,158,60),(80,159,60),(5,167,62),(10,168,62),(15,169,62),(20,170,62),(25,171,62),(30,172,62),(35,173,62),(40,174,62),(5,175,63),(10,176,63),(15,177,63),(20,178,63),(25,179,63),(30,180,63),(5,181,64),(10,182,64),(15,183,64),(20,184,64),(25,185,64),(30,186,64),(35,187,64),(40,188,64),(45,189,64),(50,190,64),(55,191,64),(60,192,64),(65,193,64),(70,194,64),(75,195,64),(80,196,64),(85,197,64),(90,198,64),(5,199,65),(10,200,65),(5,201,66),(5,202,67),(5,203,68),(10,204,68),(15,205,68),(20,206,68),(25,207,68),(30,208,68),(35,209,68),(40,210,68),(45,211,68),(50,212,68),(55,213,68),(60,214,68),(5,215,69),(10,216,69),(15,217,69),(20,218,69),(25,219,69),(30,220,69),(35,221,69),(40,222,69),(45,223,69),(50,224,69),(55,225,69),(60,226,69),(65,227,69),(70,228,69),(5,229,70),(10,230,70),(15,231,70),(20,232,70),(5,233,72),(10,234,72),(5,235,73),(5,236,74),(10,65,74),(5,70,75),(10,237,75),(5,238,76),(10,239,76),(5,2,77),(10,3,77),(15,6,77),(20,5,77),(25,7,77),(30,240,77),(35,4,77),(5,241,78),(10,242,78),(15,243,78),(20,244,78),(25,245,78),(5,11,80),(10,12,80),(15,13,80),(20,14,80),(5,246,81),(10,247,81),(5,248,82),(5,15,83),(10,16,83),(5,17,84),(10,18,84),(15,19,84),(20,20,84),(5,21,85),(10,22,85),(5,2,86),(10,3,86),(15,6,86),(20,5,86),(25,7,86),(30,4,86),(5,11,88),(10,12,88),(15,13,88),(20,14,88),(5,15,89),(10,16,89),(5,17,90),(10,18,90),(15,19,90),(20,20,90),(5,21,91),(10,22,91),(5,249,92),(10,250,92),(15,251,92),(20,252,92),(25,253,92),(30,254,92),(35,255,92),(40,256,92),(5,2,93),(10,3,93),(15,257,93),(20,5,93),(25,6,93),(30,7,93),(35,258,93),(5,11,95),(10,12,95),(15,13,95),(20,14,95),(5,15,96),(10,16,96),(5,259,97),(10,260,97),(15,261,97),(20,262,97),(25,263,97),(5,4,98),(10,264,98),(15,243,98),(5,15,99),(10,16,99),(5,265,100),(5,2,101),(10,3,101),(15,4,101),(20,5,101),(25,6,101),(30,7,101),(35,243,101),(5,11,103),(10,12,103),(15,13,103),(20,14,103),(5,15,104),(10,16,104),(5,17,105),(10,18,105),(15,19,105),(20,20,105),(5,21,106),(10,22,106),(5,266,107),(5,265,108),(5,2,109),(10,3,109),(15,6,109),(20,5,109),(25,7,109),(30,267,109),(35,268,109),(40,269,109),(45,270,109),(5,11,111),(10,12,111),(15,13,111),(20,14,111),(5,15,112),(10,16,112),(5,17,113),(10,18,113),(15,19,113),(20,20,113),(5,21,114),(10,22,114),(5,2,115),(10,3,115),(15,6,115),(20,5,115),(25,7,115),(30,269,115),(35,270,115),(5,11,117),(10,12,117),(15,13,117),(20,14,117),(5,243,118),(10,264,118),(15,271,118),(5,15,119),(10,16,119),(5,17,120),(10,18,120),(15,19,120),(20,20,120),(5,21,121),(10,22,121),(5,2,122),(10,3,122),(15,6,122),(20,5,122),(25,7,122),(5,11,124),(10,12,124),(15,13,124),(20,14,124),(5,272,125),(10,264,125),(5,15,126),(10,16,126),(5,17,127),(10,18,127),(15,19,127),(20,20,127),(5,21,128),(10,22,128),(5,2,129),(10,3,129),(15,6,129),(20,5,129),(25,7,129),(5,11,131),(10,12,131),(15,13,131),(20,14,131),(5,272,132),(10,243,132),(15,264,132),(5,15,133),(10,16,133),(5,17,134),(10,18,134),(15,19,134),(20,20,134),(5,21,135),(10,22,135),(5,265,136),(5,273,137),(10,274,137),(5,2,138),(10,3,138),(15,6,138),(20,5,138),(25,7,138),(5,11,140),(10,12,140),(15,13,140),(20,14,140),(5,275,141),(10,276,141),(15,243,141),(20,277,141),(25,278,141),(5,15,142),(10,16,142),(5,17,143),(10,18,143),(15,19,143),(20,20,143),(5,21,144),(10,22,144),(5,2,145),(10,3,145),(15,4,145),(20,5,145),(25,6,145),(30,7,145),(5,11,147),(10,12,147),(15,13,147),(20,14,147),(5,15,148),(10,16,148),(5,17,149),(10,18,149),(15,19,149),(20,20,149),(5,21,150),(10,22,150),(5,279,151),(5,280,152),(10,281,152),(15,282,152),(20,283,152),(5,284,153),(10,285,153),(15,286,153),(20,287,153),(5,288,154),(10,289,154),(15,290,154),(20,291,154),(25,292,154),(5,293,155),(5,294,156),(5,295,157),(10,296,157),(15,297,157),(5,2,158),(10,3,158),(15,5,158),(20,6,158),(25,7,158),(5,11,160),(10,12,160),(15,13,160),(20,14,160),(5,267,161),(10,298,161),(15,299,161),(5,15,162),(10,16,162),(5,17,163),(10,18,163),(15,19,163),(20,20,163),(5,21,164),(10,22,164),(5,2,165),(10,3,165),(15,5,165),(20,6,165),(25,7,165),(5,11,167),(10,12,167),(15,13,167),(20,14,167),(5,300,168),(10,267,168),(15,298,168),(20,299,168),(5,15,169),(10,16,169),(5,17,170),(10,18,170),(15,19,170),(20,20,170),(5,21,171),(10,22,171),(5,2,172),(10,3,172),(15,4,172),(20,5,172),(25,6,172),(30,7,172),(5,11,174),(10,12,174),(15,13,174),(20,14,174),(5,15,175),(10,16,175),(5,17,176),(10,18,176),(15,19,176),(20,20,176),(5,21,177),(10,22,177),(5,2,178),(10,3,178),(15,4,178),(20,5,178),(25,6,178),(30,7,178),(5,11,180),(10,12,180),(15,13,180),(20,14,180),(5,15,181),(10,16,181),(5,17,182),(10,18,182),(15,19,182),(20,20,182),(5,21,183),(10,22,183),(5,2,184),(10,3,184),(15,5,184),(20,6,184),(25,7,184),(30,276,184),(35,301,184),(40,264,184),(45,243,184),(5,11,186),(10,12,186),(15,13,186),(20,14,186),(5,17,187),(10,18,187),(15,19,187),(20,20,187),(5,21,188),(10,22,188),(5,265,189),(5,302,190),(10,303,190),(15,304,190),(20,305,190),(25,306,190),(30,307,190),(5,308,191),(10,309,191),(5,310,192),(10,311,192),(15,312,192),(5,313,193),(10,314,193),(15,315,193),(5,316,194),(10,317,194),(15,318,194),(20,319,194),(5,320,195),(10,321,195),(15,322,195),(20,323,195),(25,324,195),(5,325,196),(10,326,196),(15,327,196),(5,2,197),(10,3,197),(15,6,197),(20,5,197),(25,7,197),(5,11,199),(10,12,199),(15,13,199),(20,14,199),(5,267,200),(5,15,201),(10,16,201),(5,17,202),(10,18,202),(15,19,202),(20,20,202),(5,21,203),(10,22,203),(5,329,204),(10,330,204),(15,331,204),(20,332,204),(25,333,204),(5,2,205),(10,3,205),(15,6,205),(20,5,205),(25,7,205),(30,334,205),(5,11,207),(10,14,207),(5,335,208),(10,336,208),(15,337,208),(20,338,208),(5,339,210),(10,340,210),(15,341,210),(5,342,211),(10,343,211),(5,15,212),(10,16,212),(5,17,213),(10,18,213),(15,19,213),(20,20,213),(5,21,214),(10,22,214),(5,344,215),(10,345,215),(15,346,215),(5,347,216),(10,348,216),(5,349,217),(10,350,217),(5,351,218),(10,352,218),(15,353,218),(20,354,218),(25,355,218),(30,356,218),(5,357,219),(10,358,219),(15,359,219),(5,360,220),(10,361,220),(15,362,220),(20,363,220),(25,364,220),(5,365,221),(10,366,221),(5,367,222),(5,347,223),(10,348,223),(5,368,224),(10,369,224),(15,370,224),(20,371,224),(5,349,225),(10,350,225),(5,351,226),(10,352,226),(15,353,226),(20,354,226),(25,355,226),(30,356,226),(5,357,227),(10,358,227),(15,359,227),(5,360,228),(10,361,228),(15,362,228),(20,363,228),(25,364,228),(5,365,229),(10,366,229),(5,367,230),(5,347,231),(10,348,231),(5,372,232),(10,369,232),(15,370,232),(20,373,232),(5,349,233),(10,350,233),(5,351,234),(10,352,234),(15,353,234),(20,354,234),(25,355,234),(30,356,234),(5,357,235),(10,358,235),(15,359,235),(5,360,236),(10,361,236),(15,362,236),(20,363,236),(25,364,236),(5,365,237),(10,366,237),(5,367,238),(5,347,239),(10,348,239),(5,374,240),(5,349,241),(10,350,241),(5,351,242),(10,352,242),(15,353,242),(20,354,242),(25,355,242),(30,356,242),(5,357,243),(10,358,243),(15,359,243),(5,360,244),(10,361,244),(15,362,244),(20,363,244),(25,364,244),(5,365,245),(10,366,245),(5,367,246),(5,375,247),(10,376,247),(5,2,248),(10,3,248),(15,5,248),(20,6,248),(25,7,248),(30,4,248),(5,11,250),(10,12,250),(15,13,250),(20,14,250),(5,377,251),(10,378,251),(5,15,252),(10,16,252),(5,17,253),(10,18,253),(15,19,253),(20,20,253),(5,21,254),(10,22,254),(5,379,255),(10,380,255),(15,381,255),(5,43,256),(5,43,257),(5,2,258),(10,3,258),(15,4,258),(20,5,258),(25,6,258),(30,7,258),(5,11,260),(10,12,260),(15,13,260),(20,14,260),(5,15,261),(10,16,261),(5,17,262),(10,18,262),(15,19,262),(20,20,262),(5,21,263),(10,22,263),(5,382,264),(10,383,264),(15,384,264),(20,385,264),(25,386,264),(30,387,264),(35,388,264),(40,389,264),(45,390,264),(50,391,264),(55,392,264),(5,379,265),(10,380,265),(15,381,265),(5,393,266),(10,394,266),(6,395,267),(5,396,267),(5,397,268),(15,398,266),(20,399,266),(23,400,269),(11,402,269),(16,403,269),(24,404,269),(10,405,269),(5,406,270),(10,407,270),(5,280,271),(10,281,271),(15,282,271),(20,283,271),(5,408,272),(10,409,272),(15,410,272),(20,411,272),(5,413,273),(10,414,273),(15,415,273),(5,416,274),(10,417,274),(5,418,275),(5,422,276),(10,423,276),(5,2,277),(10,3,277),(15,6,277),(20,5,277),(25,7,277),(30,4,277),(5,11,279),(10,12,279),(15,13,279),(20,14,279),(5,15,280),(10,16,280),(5,17,281),(10,18,281),(15,19,281),(20,20,281),(5,21,282),(10,22,282),(8,424,283),(15,425,283),(20,426,283),(26,427,283),(31,428,283),(5,429,283),(6,430,283),(7,431,283),(14,432,283),(25,433,283),(5,434,284),(5,434,285),(15,435,274),(5,434,286),(5,434,306),(5,434,305),(5,434,287),(5,434,290),(5,434,301),(5,434,300),(5,434,299),(85,436,60),(5,437,309),(10,438,309),(15,439,309),(20,440,309),(25,441,309),(30,442,309),(35,443,309),(5,444,310),(10,445,310),(15,446,310),(5,447,311),(5,448,312),(5,65,313),(10,449,313),(5,70,314),(10,450,314),(5,70,315),(10,451,315),(15,452,315),(5,70,316),(10,453,316),(15,454,316),(5,70,317),(10,455,317),(15,456,317),(5,70,318),(10,457,318),(5,70,319),(10,458,319),(5,135,320),(10,136,320),(15,137,320),(20,138,320),(25,139,320),(30,140,320),(35,141,320),(40,142,320),(45,143,320),(5,135,321),(10,136,321),(15,138,321),(20,139,321),(25,140,321),(30,141,321),(35,142,321),(40,143,321),(5,459,322),(10,137,322),(5,135,323),(10,136,323),(15,138,323),(20,139,323),(25,140,323),(30,141,323),(35,142,323),(40,143,323),(5,460,324),(10,461,324),(5,135,325),(10,136,325),(15,138,325),(20,141,325),(25,142,325),(30,143,325),(5,462,326),(10,463,326),(15,464,326),(20,465,326),(25,466,326),(30,467,326),(35,468,326),(40,469,326),(45,139,326),(50,140,326),(5,115,327),(10,116,327),(15,117,327),(5,470,328),(10,471,328),(15,472,328),(20,473,328),(25,474,328),(30,475,328),(5,115,329),(10,116,329),(15,117,329),(5,476,330),(10,477,330),(15,478,330),(20,479,330),(5,115,331),(10,116,331),(15,117,331),(5,115,332),(10,116,332),(15,117,332),(5,480,333),(10,481,333),(15,482,333),(20,483,333),(25,478,333),(5,115,336),(10,116,336),(15,117,336),(5,486,337),(10,487,337),(15,488,337),(20,489,337),(25,490,337),(30,491,337),(35,492,337),(40,493,337),(45,474,337),(50,494,337),(5,115,338),(10,116,338),(15,117,338),(5,495,339),(10,496,339),(15,497,339),(20,498,339),(25,499,339),(30,500,339),(35,478,339),(5,115,340),(10,116,340),(15,117,340),(5,501,341),(10,502,341),(15,503,341),(5,115,347),(10,116,347),(15,117,347),(5,517,348),(10,518,348),(15,519,348),(20,520,348),(5,115,349),(10,116,349),(15,117,349),(5,521,350),(10,522,350),(15,478,350),(20,479,350),(25,523,350),(5,524,351),(10,525,351),(5,526,352),(10,527,352),(15,528,352),(20,529,352),(25,530,352),(30,531,352),(5,532,353),(10,533,353),(15,534,353),(20,535,353),(25,536,353),(10,537,200),(10,538,300),(65,539,68),(70,540,68),(55,541,326),(60,542,326),(30,479,333),(40,479,339),(20,479,341),(25,479,348),(30,543,350),(35,544,29),(30,545,30),(30,545,31),(15,546,76),(20,547,76),(25,478,341),(85,548,47),(5,549,355),(10,70,355),(75,550,68),(20,551,52),(20,551,327),(20,551,329),(20,551,331),(20,551,332),(20,551,336),(20,551,338),(20,551,340),(20,551,347),(20,551,349),(5,21,356),(10,22,356),(5,21,357),(10,22,357),(5,526,358),(10,527,358),(15,528,358),(20,529,358),(25,530,358),(5,552,359),(10,553,359),(15,554,359),(20,555,359),(5,556,360),(10,557,360),(15,558,360),(20,559,360),(5,560,361),(10,561,361),(15,562,361),(20,563,361);
/*!40000 ALTER TABLE `cms3_fields_controller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_filter_index_52_pages_4`
--

DROP TABLE IF EXISTS `cms3_filter_index_52_pages_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_filter_index_52_pages_4` (
  `id` int(10) unsigned NOT NULL,
  `obj_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `lang_id` int(10) unsigned NOT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  `brend` varchar(255) DEFAULT NULL,
  `cvet` varchar(255) DEFAULT NULL,
  `cvet_korpusa` varchar(255) DEFAULT NULL,
  `material_korpusa` varchar(255) DEFAULT NULL,
  `nalichie_budilnika` tinyint(1) DEFAULT '0',
  `naznachenie` varchar(255) DEFAULT NULL,
  `novoe_pole` varchar(255) DEFAULT NULL,
  `obem_upakovki` double DEFAULT NULL,
  `price` double DEFAULT '0',
  `proizvoditel` varchar(255) DEFAULT NULL,
  `razmer` varchar(255) DEFAULT NULL,
  `razmer_pitomca` varchar(255) DEFAULT NULL,
  `razmer_ramy_dyujmy` double DEFAULT NULL,
  `sezon` varchar(255) DEFAULT NULL,
  `sostav_napolnitelya` varchar(255) DEFAULT NULL,
  `steklo` varchar(255) DEFAULT NULL,
  `tip` varchar(255) DEFAULT NULL,
  `tip_mehanizma` varchar(255) DEFAULT NULL,
  `ves` double DEFAULT NULL,
  `ves_upakovki` double DEFAULT NULL,
  `ves_velosipeda` double DEFAULT NULL,
  `vid` varchar(255) DEFAULT NULL,
  `vmestimost` bigint(20) DEFAULT NULL,
  `vozrast` varchar(255) DEFAULT NULL,
  `vysota` double DEFAULT NULL,
  `zastezhka` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `obj_id` (`obj_id`),
  KEY `parent_id` (`parent_id`),
  KEY `type_id` (`type_id`),
  KEY `lang_id` (`lang_id`),
  KEY `domain_id` (`domain_id`),
  KEY `brend` (`brend`),
  KEY `cvet` (`cvet`),
  KEY `cvet_korpusa` (`cvet_korpusa`),
  KEY `material_korpusa` (`material_korpusa`),
  KEY `naznachenie` (`naznachenie`),
  KEY `novoe_pole` (`novoe_pole`),
  KEY `obem_upakovki` (`obem_upakovki`),
  KEY `price` (`price`),
  KEY `proizvoditel` (`proizvoditel`),
  KEY `razmer` (`razmer`),
  KEY `razmer_pitomca` (`razmer_pitomca`),
  KEY `razmer_ramy_dyujmy` (`razmer_ramy_dyujmy`),
  KEY `sezon` (`sezon`),
  KEY `sostav_napolnitelya` (`sostav_napolnitelya`),
  KEY `steklo` (`steklo`),
  KEY `tip` (`tip`),
  KEY `tip_mehanizma` (`tip_mehanizma`),
  KEY `ves` (`ves`),
  KEY `ves_upakovki` (`ves_upakovki`),
  KEY `ves_velosipeda` (`ves_velosipeda`),
  KEY `vid` (`vid`),
  KEY `vmestimost` (`vmestimost`),
  KEY `vozrast` (`vozrast`),
  KEY `vysota` (`vysota`),
  KEY `zastezhka` (`zastezhka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_filter_index_52_pages_4`
--

LOCK TABLES `cms3_filter_index_52_pages_4` WRITE;
/*!40000 ALTER TABLE `cms3_filter_index_52_pages_4` DISABLE KEYS */;
INSERT INTO `cms3_filter_index_52_pages_4` VALUES (309,1823,264,177,1,1,NULL,'Черный',NULL,NULL,0,'Мужской',NULL,NULL,14990,NULL,NULL,NULL,18,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,11,'Хардтейл',NULL,NULL,NULL,NULL),(314,1833,264,177,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,39900,NULL,NULL,NULL,19,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,12,'Хардтейл',NULL,NULL,NULL,NULL),(327,1849,264,177,1,1,NULL,'Бирюзовый',NULL,NULL,0,'Женский',NULL,NULL,13990,NULL,NULL,NULL,18,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,13,'Хардтейл',NULL,NULL,NULL,NULL),(328,1852,264,177,1,1,NULL,'Серый',NULL,NULL,0,'Женский',NULL,NULL,32900,NULL,NULL,NULL,21,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,9,'Двухподвес',NULL,NULL,NULL,NULL),(329,1855,264,177,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,69900,NULL,NULL,NULL,20,NULL,NULL,NULL,'Горный',NULL,NULL,NULL,13,'Хардтейл',NULL,NULL,NULL,NULL),(330,1858,264,177,1,1,NULL,'Черный',NULL,NULL,0,'Женский',NULL,NULL,24900,NULL,NULL,NULL,21,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,12,'Дорожный',NULL,NULL,NULL,NULL),(331,1859,264,177,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,17990,NULL,NULL,NULL,20,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,11,'Двухподвес',NULL,NULL,NULL,NULL),(332,1860,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Женский',NULL,NULL,9900,NULL,NULL,NULL,9,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,5,'Хардтейл',NULL,NULL,NULL,NULL),(335,1865,334,184,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1310,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.9,NULL,NULL,NULL,2,NULL,105,NULL),(336,1866,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,8900,NULL,NULL,NULL,10,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,4,'Хардтейл',NULL,NULL,NULL,NULL),(337,1868,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,5900,NULL,NULL,NULL,8,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,6,'Хардтейл',NULL,NULL,NULL,NULL),(338,1869,334,184,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2390,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3.14,NULL,NULL,NULL,1,NULL,86,NULL),(339,1871,334,184,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2950,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3.12,NULL,NULL,NULL,1,NULL,137,NULL),(340,1872,334,184,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2940,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2.9,NULL,NULL,NULL,2,NULL,110,NULL),(345,1879,343,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,29200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(348,1891,343,170,1,1,NULL,NULL,'Серый','Нержавеющая сталь',0,NULL,'Jacques Lemans',NULL,13900,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(349,1898,344,170,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,NULL,'Epos',NULL,70550,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(350,1901,343,170,1,1,NULL,NULL,NULL,'Титан',0,NULL,'Hublot',NULL,49800,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(351,1906,343,170,1,1,NULL,NULL,'Черный','Нержавеющая сталь',0,NULL,'Suunto',NULL,14690,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Финляндия',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(352,1912,343,170,1,1,NULL,NULL,'Синий','Пластик',0,NULL,'Timex',NULL,8120,NULL,NULL,NULL,NULL,NULL,NULL,'Пластик',NULL,'США',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(353,1915,344,170,1,1,NULL,NULL,'Белый','Нержавеющая сталь + PVD покрытие',1,NULL,'Victorinox Swiss Army',NULL,34700,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'США',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(354,1918,344,170,1,1,NULL,NULL,'Белый','Нержавеющая сталь',0,NULL,'Seiko',NULL,22900,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Япония',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(355,1921,344,170,1,1,NULL,NULL,'Черный','Керамика',0,NULL,'Candino',NULL,19900,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(356,1923,344,170,1,1,NULL,NULL,'Золотой','Нержавеющая сталь',0,NULL,'Michael Kors',NULL,11500,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(357,1924,344,170,1,1,NULL,NULL,'Черный','Пластик',1,NULL,'Posio',NULL,3790,NULL,NULL,NULL,NULL,NULL,NULL,'Пластик',NULL,'Япония',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(358,1929,283,180,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,4.5,154,NULL,NULL,NULL,NULL,NULL,'Древесина',NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(359,1933,283,180,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,4.54,119,NULL,NULL,NULL,NULL,NULL,'Древесина',NULL,NULL,NULL,2.31,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(360,1935,283,180,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,10,480,NULL,NULL,NULL,NULL,NULL,'Хлопок',NULL,NULL,NULL,0.96,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(361,1937,283,180,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,16,1790,NULL,NULL,NULL,NULL,NULL,'Глина + мин. добавки',NULL,NULL,NULL,15.87,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(362,1938,273,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,780,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(363,1939,273,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,410,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(364,1940,273,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(366,1942,365,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,740,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(367,1943,365,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(368,1944,365,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(369,1945,365,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2700,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(370,1946,365,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3300,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(371,1952,284,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,950,NULL,NULL,'Любой размер',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1500,NULL,NULL,NULL,'Взрослые',NULL,NULL),(372,1954,284,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3200,NULL,NULL,NULL,'Взрослые',NULL,NULL),(373,1956,284,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000,NULL,NULL,NULL,'Взрослые',NULL,NULL),(374,1959,284,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2720,NULL,NULL,NULL,'Взрослые',NULL,NULL),(375,1962,284,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2280,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3630,NULL,NULL,NULL,'Любой',NULL,NULL),(376,1965,285,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,810,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1020,NULL,NULL,NULL,'Взрослые',NULL,NULL),(377,1967,285,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1190,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2400,NULL,NULL,NULL,'Взрослые',NULL,NULL),(378,1968,285,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1320,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2040,NULL,NULL,NULL,'Любой',NULL,NULL),(379,1972,285,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1190,NULL,NULL,NULL,'Взрослые',NULL,NULL),(380,1973,285,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,4100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3840,NULL,NULL,NULL,'Взрослые',NULL,NULL),(381,1974,287,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(382,1976,287,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1750,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(383,1977,287,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2610,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(384,1980,289,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,190,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL),(385,1982,289,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,389,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,700,NULL,NULL,NULL,NULL,NULL,NULL),(394,1991,264,177,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,79900,NULL,NULL,NULL,19,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,12,'Хардтейл',NULL,NULL,NULL,NULL),(395,1992,264,177,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,49900,NULL,NULL,NULL,20,NULL,NULL,NULL,'Горный',NULL,NULL,NULL,13,'Хардтейл',NULL,NULL,NULL,NULL),(396,1993,264,177,1,1,NULL,'Серый',NULL,NULL,0,'Женский',NULL,NULL,38900,NULL,NULL,NULL,21,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,9,'Двухподвес',NULL,NULL,NULL,NULL),(397,1994,264,177,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,18990,NULL,NULL,NULL,20,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,11,'Двухподвес',NULL,NULL,NULL,NULL),(398,1995,264,177,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,32900,NULL,NULL,NULL,19,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,12,'Хардтейл',NULL,NULL,NULL,NULL),(399,1996,264,177,1,1,NULL,'Бирюзовый',NULL,NULL,0,'Женский',NULL,NULL,19990,NULL,NULL,NULL,18,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,13,'Хардтейл',NULL,NULL,NULL,NULL),(400,1997,264,177,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,56900,NULL,NULL,NULL,20,NULL,NULL,NULL,'Горный',NULL,NULL,NULL,13,'Хардтейл',NULL,NULL,NULL,NULL),(401,1998,264,177,1,1,NULL,'Черный',NULL,NULL,0,'Женский',NULL,NULL,22900,NULL,NULL,NULL,21,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,12,'Дорожный',NULL,NULL,NULL,NULL),(402,1999,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Женский',NULL,NULL,8900,NULL,NULL,NULL,9,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,5,'Хардтейл',NULL,NULL,NULL,NULL),(403,2000,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,11900,NULL,NULL,NULL,10,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,4,'Хардтейл',NULL,NULL,NULL,NULL),(404,2001,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,5500,NULL,NULL,NULL,8,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,6,'Хардтейл',NULL,NULL,NULL,NULL),(405,2002,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Женский',NULL,NULL,9400,NULL,NULL,NULL,9,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,5,'Хардтейл',NULL,NULL,NULL,NULL),(406,2003,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,8900,NULL,NULL,NULL,10,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,4,'Хардтейл',NULL,NULL,NULL,NULL),(407,2004,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,13000,NULL,NULL,NULL,10,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,4,'Хардтейл',NULL,NULL,NULL,NULL),(408,2005,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Женский',NULL,NULL,12000,NULL,NULL,NULL,9,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,5,'Хардтейл',NULL,NULL,NULL,NULL),(409,2006,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,12900,NULL,NULL,NULL,10,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,4,'Хардтейл',NULL,NULL,NULL,NULL),(410,2007,343,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,47900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(411,2008,343,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,18000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(412,2009,344,170,1,1,NULL,NULL,'Серый','Нержавеющая сталь',0,NULL,'Jacques Lemans',NULL,13400,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(413,2010,343,170,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,NULL,'Epos',NULL,58055,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(414,2011,343,170,1,1,NULL,NULL,NULL,'Титан',0,NULL,'Hublot',NULL,40500,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(415,2012,343,170,1,1,NULL,NULL,'Черный','Нержавеющая сталь',0,NULL,'Suunto',NULL,11690,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Финляндия',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(416,2013,343,170,1,1,NULL,NULL,'Синий','Пластик',0,NULL,'Timex',NULL,6190,NULL,NULL,NULL,NULL,NULL,NULL,'Пластик',NULL,'США',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(417,2014,343,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,17900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(419,2016,343,170,1,1,NULL,NULL,'Серый','Нержавеющая сталь',0,NULL,'Jacques Lemans',NULL,15000,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(420,2017,343,170,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,NULL,'Epos',NULL,78550,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(421,2018,344,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,18000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(423,2020,343,170,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,NULL,'Epos',NULL,70550,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(424,2029,391,185,1,1,'MitLex','Черный',NULL,NULL,0,NULL,NULL,NULL,11900,NULL,'52-54',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(425,2035,391,185,1,1,'Mango Man','Бежевый',NULL,NULL,0,NULL,NULL,NULL,9900,NULL,'50-52',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(427,2041,391,185,1,1,'Burton Menswear London','Черный',NULL,NULL,0,NULL,NULL,NULL,8900,NULL,'50-52',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(428,2043,389,185,1,1,'BRUNO BANANI','Синий',NULL,NULL,0,NULL,NULL,NULL,3990,NULL,'52-54',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(429,2046,391,185,1,1,'Roosevelt','Серый',NULL,NULL,0,NULL,NULL,NULL,10399,NULL,'48-50',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(430,2051,389,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,5499,NULL,'50-52',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(431,2052,391,185,1,1,'United Colors of Benetton','Черный',NULL,NULL,0,NULL,NULL,NULL,8900,NULL,'52-54',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(432,2069,389,185,1,1,'RHODE ISLAND','Синий',NULL,NULL,0,NULL,NULL,NULL,2350,NULL,'52-54',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(433,2070,391,185,1,1,'Only & Sons','Черный',NULL,NULL,0,NULL,NULL,NULL,6500,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(434,2071,389,185,1,1,'BRUNO BANANI','Серый',NULL,NULL,0,NULL,NULL,NULL,3450,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(435,2073,389,185,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,6590,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(436,2074,391,185,1,1,'Jack & Jones','Черный',NULL,NULL,0,NULL,NULL,NULL,10999,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(437,2077,389,185,1,1,'Kekker style','Серый',NULL,NULL,0,NULL,NULL,NULL,8950,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(438,2078,389,185,1,1,'Kekker style','Синий',NULL,NULL,0,NULL,NULL,NULL,8950,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(439,2080,391,185,1,1,'Windsor','Черный',NULL,NULL,0,NULL,NULL,NULL,52900,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(440,2084,391,185,1,1,'Trussardi Jeans','Синий',NULL,NULL,0,NULL,NULL,NULL,26900,NULL,'52-54',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(442,2090,391,185,1,1,'Berkytt','Коричневый',NULL,NULL,0,NULL,NULL,NULL,12400,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(443,2092,391,185,1,1,'Piazza Italia','Серый',NULL,NULL,0,NULL,NULL,NULL,7399,NULL,'52-54',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(444,2093,389,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,6790,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(445,2095,392,185,1,1,'Atributika & Club','Черный',NULL,NULL,0,NULL,NULL,NULL,5499,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(446,2096,389,185,1,1,'Kekker style','Синий',NULL,NULL,0,NULL,NULL,NULL,2350,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(447,2099,392,185,1,1,'Trespass','Хакки',NULL,NULL,0,NULL,NULL,NULL,18999,NULL,'50-52',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(448,2100,389,185,1,1,'Kekker style','Серый',NULL,NULL,0,NULL,NULL,NULL,4590,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(449,2103,389,185,1,1,'JOHN DEVIN','Серый',NULL,NULL,0,NULL,NULL,NULL,5690,NULL,'52-54',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(450,2104,392,185,1,1,'EA7','Синий',NULL,NULL,0,NULL,NULL,NULL,22899,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(451,2106,392,185,1,1,'Reebok','Серый',NULL,NULL,0,NULL,NULL,NULL,14690,NULL,'48-50',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(452,2107,389,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,4590,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(453,2109,392,185,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,22889,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(454,2110,392,185,1,1,'Bergans of Norway','Черный',NULL,NULL,0,NULL,NULL,NULL,27999,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(455,2113,392,185,1,1,'Springfield','Желтый',NULL,NULL,0,NULL,NULL,NULL,7999,NULL,'52-54',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(456,2115,392,185,1,1,'Columbia','Красный',NULL,NULL,0,NULL,NULL,NULL,23999,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(457,2116,392,185,1,1,'Columbia','Синий',NULL,NULL,0,NULL,NULL,NULL,12999,NULL,'50-52',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(458,2118,392,185,1,1,'Baon','Синий',NULL,NULL,0,NULL,NULL,NULL,12699,NULL,'50-52',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(459,2121,392,185,1,1,'Quiksilver','Черный',NULL,NULL,0,NULL,NULL,NULL,17690,NULL,'50-52',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(460,2124,392,185,1,1,'Columbia','Черный',NULL,NULL,0,NULL,NULL,NULL,9999,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(462,2130,461,191,1,1,'Bell',NULL,NULL,NULL,0,NULL,NULL,NULL,2300,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(463,2131,461,191,1,1,'Bell',NULL,NULL,NULL,0,NULL,NULL,NULL,149,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(465,2133,461,191,1,1,'Bell',NULL,NULL,NULL,0,NULL,NULL,NULL,310,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(466,2134,461,191,1,1,'L`Oreal',NULL,NULL,NULL,0,NULL,NULL,NULL,440,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(467,2135,461,191,1,1,'L`Oreal',NULL,NULL,NULL,0,NULL,NULL,NULL,430,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(468,2138,461,191,1,1,'Maybelline New York',NULL,NULL,NULL,0,NULL,NULL,NULL,220,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(469,2141,461,191,1,1,'Rimmel',NULL,NULL,NULL,0,NULL,NULL,NULL,300,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(470,2143,461,191,1,1,'Rimmel',NULL,NULL,NULL,0,NULL,NULL,NULL,390,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(471,2146,461,191,1,1,'NOUBA',NULL,NULL,NULL,0,NULL,NULL,NULL,1099,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(472,2148,461,191,1,1,'MAX FACTOR',NULL,NULL,NULL,0,NULL,NULL,NULL,350,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(473,2150,461,191,1,1,'Revlon',NULL,NULL,NULL,0,NULL,NULL,NULL,390,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(474,2151,461,191,1,1,'Bell',NULL,NULL,NULL,0,NULL,NULL,NULL,210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(475,2156,461,191,1,1,'LUXVISAGE',NULL,NULL,NULL,0,NULL,NULL,NULL,280,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(481,2162,480,200,1,1,NULL,'Зеленый',NULL,NULL,0,NULL,NULL,NULL,2750,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(482,2163,480,200,1,1,NULL,'Зеленый',NULL,NULL,0,NULL,NULL,NULL,3400,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(483,2164,480,200,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,2600,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(484,2165,480,200,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,6700,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(485,2166,480,200,1,1,NULL,'Красный',NULL,NULL,0,NULL,NULL,NULL,6875,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(486,2168,289,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,410,NULL,NULL,'Малый и средний',NULL,NULL,NULL,NULL,NULL,NULL,NULL,700,NULL,NULL,NULL,'Любой',NULL,NULL),(488,2170,289,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,99,NULL,NULL,'Любой размер',NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,NULL,NULL,NULL,'Любой',NULL,NULL),(489,2172,289,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,80,NULL,NULL,'Любой размер',NULL,NULL,NULL,NULL,NULL,NULL,NULL,400,NULL,NULL,NULL,'Взрослые',NULL,NULL),(492,2177,490,202,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,18990,'RICCI',NULL,NULL,NULL,NULL,NULL,NULL,'Механическое',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(493,2179,490,202,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,16900,'Hansa',NULL,NULL,NULL,NULL,NULL,NULL,'Механическое',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(494,2180,490,202,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,12900,'Hansa',NULL,NULL,NULL,NULL,NULL,NULL,'Механическое',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(495,2183,490,202,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,25900,'Bosch',NULL,NULL,NULL,NULL,NULL,NULL,'Электронный',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(496,2185,490,202,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,27900,'Samsung',NULL,NULL,NULL,NULL,NULL,NULL,'Электронный',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(498,2187,497,204,1,1,'LG',NULL,NULL,NULL,0,NULL,NULL,NULL,24900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(499,2190,497,204,1,1,'Bosch',NULL,NULL,NULL,0,NULL,NULL,NULL,22000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(500,2192,497,204,1,1,'Indesit',NULL,NULL,NULL,0,NULL,NULL,NULL,15499,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,61,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(501,2199,497,204,1,1,'Bosch',NULL,NULL,NULL,0,NULL,NULL,NULL,29999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(502,2201,497,204,1,1,'SAMSUNG',NULL,NULL,NULL,0,NULL,NULL,NULL,27999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(503,2203,497,204,1,1,'BEKO',NULL,NULL,NULL,0,NULL,NULL,NULL,12499,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(504,2205,497,204,1,1,'ZANUSSI',NULL,NULL,NULL,0,NULL,NULL,NULL,25999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(505,2207,497,204,1,1,'SHARP',NULL,NULL,NULL,0,NULL,NULL,NULL,184999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(507,2209,506,206,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,6999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(508,2210,506,206,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2799,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(509,2211,506,206,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,19990,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(510,2212,506,206,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3499,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(511,2213,506,206,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,4999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(512,2214,506,206,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,14999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(513,2215,506,206,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,8299,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(514,2216,506,206,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,4999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(516,2219,515,208,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,17999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(517,2220,515,208,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,37999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(518,2221,515,208,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,45699,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(519,2223,515,208,1,1,NULL,NULL,NULL,NULL,0,NULL,'Трехкамерный',NULL,89959,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(520,2224,515,208,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,36999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(521,2225,515,208,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,32899,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(522,2226,515,208,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,76999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(523,2227,515,208,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,24299,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(524,2228,322,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,6999,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(525,2229,322,185,1,1,NULL,'Зеленый',NULL,NULL,0,NULL,NULL,NULL,6499,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(526,2231,322,185,1,1,NULL,'Голубая',NULL,NULL,0,NULL,NULL,NULL,5499,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(527,2232,322,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,8499,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(528,2233,322,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,5799,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(529,2234,322,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,2499,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(530,2235,322,185,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,2499,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(531,2236,322,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,2699,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(532,2238,321,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,3040,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(533,2239,321,185,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,2999,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(534,2240,321,185,1,1,NULL,'Розовый',NULL,NULL,0,NULL,NULL,NULL,3999,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(535,2241,321,185,1,1,NULL,'Голубая',NULL,NULL,0,NULL,NULL,NULL,3370,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(536,2242,321,185,1,1,NULL,'Коричневый',NULL,NULL,0,NULL,NULL,NULL,3445,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(537,2244,321,185,1,1,NULL,'Мультиколор',NULL,NULL,0,NULL,NULL,NULL,2970,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(538,2245,321,185,1,1,NULL,'Красный',NULL,NULL,0,NULL,NULL,NULL,3445,NULL,'48-50',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(539,2246,321,185,1,1,NULL,'Желтый',NULL,NULL,0,NULL,NULL,NULL,827,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(540,2247,326,209,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2970,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(541,2248,326,209,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2399,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(542,2249,326,209,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3599,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(543,2250,326,209,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(544,2251,326,209,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(545,2252,326,209,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(546,2253,326,209,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(547,2254,326,209,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3337,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(548,2255,387,185,1,1,NULL,'Коричневый',NULL,NULL,0,NULL,NULL,NULL,5033,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(549,2256,387,185,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,7860,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(550,2258,387,185,1,1,NULL,'Темно-синий, малиновый',NULL,NULL,0,NULL,NULL,NULL,5190,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(551,2259,387,185,1,1,NULL,'Голубая',NULL,NULL,0,NULL,NULL,NULL,4999,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(552,2260,387,185,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,5390,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(553,2261,387,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,3458,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(554,2262,387,185,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,3467,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(555,2263,387,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,4890,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(556,2264,388,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,2480,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(557,2265,388,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,3500,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(558,2266,388,185,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,4700,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(559,2267,388,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,1270,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(560,2268,388,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,3490,NULL,'48-50',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(561,2269,388,185,1,1,NULL,'Бежевый',NULL,NULL,0,NULL,NULL,NULL,3090,NULL,'50-52',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(562,2270,388,185,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,3445,NULL,'48-50',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(563,2271,388,185,1,1,NULL,'Голубая',NULL,NULL,0,NULL,NULL,NULL,2970,NULL,'48-50',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(565,2273,564,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3780,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(566,2274,564,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(567,2275,564,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,598,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(568,2276,564,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1824,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(569,2277,564,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,708,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(570,2278,564,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1297,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(571,2279,564,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,269,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(572,2280,564,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1084,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(574,2282,573,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,132,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(575,2283,573,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(576,2284,573,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,588,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(577,2285,573,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,393,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(578,2286,573,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,998,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(579,2287,573,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(580,2288,573,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,393,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(581,2289,573,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(583,2292,582,215,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2600,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(584,2293,582,215,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(585,2294,582,215,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,5000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(586,2295,582,215,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2465,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(587,2297,582,215,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,4562,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(588,2298,582,215,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2580,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(589,2299,582,215,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,7500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(590,2300,582,215,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,9000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(592,2304,591,219,1,1,'Yedoo',NULL,NULL,NULL,0,NULL,NULL,NULL,10000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(593,2308,591,219,1,1,'Trolo Raptor',NULL,NULL,NULL,0,NULL,NULL,NULL,12500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(594,2310,591,219,1,1,'MICRO SPEED',NULL,NULL,NULL,0,NULL,NULL,NULL,7860,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(595,2312,591,219,1,1,'Micro Suspension',NULL,NULL,NULL,0,NULL,NULL,NULL,8999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(596,2314,591,219,1,1,'Razor',NULL,NULL,NULL,0,NULL,NULL,NULL,15000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(597,2316,591,219,1,1,'Weelz Rock',NULL,NULL,NULL,0,NULL,NULL,NULL,9800,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(598,2318,591,219,1,1,'HUDORA',NULL,NULL,NULL,0,NULL,NULL,NULL,17900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(599,2320,591,219,1,1,'Xootr',NULL,NULL,NULL,0,NULL,NULL,NULL,11800,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(600,2324,490,202,1,1,NULL,'Антрацит',NULL,NULL,0,NULL,NULL,NULL,145500,'Asko',NULL,NULL,NULL,NULL,NULL,NULL,'Сенсорный',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(601,2326,490,202,1,1,NULL,'Бежевый',NULL,NULL,0,NULL,NULL,NULL,15900,'Darina',NULL,NULL,NULL,NULL,NULL,NULL,'Механическое',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(602,2330,490,202,1,1,NULL,'Лед',NULL,NULL,0,NULL,NULL,NULL,60999,'Hotpoint-Ariston',NULL,NULL,NULL,NULL,NULL,NULL,'Поворотные переключатели',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cms3_filter_index_52_pages_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_filter_index_56_pages_1161`
--

DROP TABLE IF EXISTS `cms3_filter_index_56_pages_1161`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_filter_index_56_pages_1161` (
  `id` int(10) unsigned NOT NULL,
  `obj_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `lang_id` int(10) unsigned NOT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  `brend` varchar(255) DEFAULT NULL,
  `cvet` varchar(255) DEFAULT NULL,
  `cvet_korpusa` varchar(255) DEFAULT NULL,
  `material_korpusa` varchar(255) DEFAULT NULL,
  `nalichie_budilnika` tinyint(1) DEFAULT '0',
  `novoe_pole` varchar(255) DEFAULT NULL,
  `price` double DEFAULT '0',
  `proizvoditel` varchar(255) DEFAULT NULL,
  `razmer` varchar(255) DEFAULT NULL,
  `sezon` varchar(255) DEFAULT NULL,
  `steklo` varchar(255) DEFAULT NULL,
  `tip` varchar(255) DEFAULT NULL,
  `tip_mehanizma` varchar(255) DEFAULT NULL,
  `zastezhka` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `obj_id` (`obj_id`),
  KEY `parent_id` (`parent_id`),
  KEY `type_id` (`type_id`),
  KEY `lang_id` (`lang_id`),
  KEY `domain_id` (`domain_id`),
  KEY `brend` (`brend`),
  KEY `cvet` (`cvet`),
  KEY `cvet_korpusa` (`cvet_korpusa`),
  KEY `material_korpusa` (`material_korpusa`),
  KEY `novoe_pole` (`novoe_pole`),
  KEY `price` (`price`),
  KEY `proizvoditel` (`proizvoditel`),
  KEY `razmer` (`razmer`),
  KEY `sezon` (`sezon`),
  KEY `steklo` (`steklo`),
  KEY `tip` (`tip`),
  KEY `tip_mehanizma` (`tip_mehanizma`),
  KEY `zastezhka` (`zastezhka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_filter_index_56_pages_1161`
--

LOCK TABLES `cms3_filter_index_56_pages_1161` WRITE;
/*!40000 ALTER TABLE `cms3_filter_index_56_pages_1161` DISABLE KEYS */;
INSERT INTO `cms3_filter_index_56_pages_1161` VALUES (934,3945,1181,339,1,2,NULL,NULL,'Серый','Нержавеющая сталь',0,'Jacques Lemans',13900,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(935,3946,1186,339,1,2,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',70550,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(936,3947,1181,339,1,2,NULL,NULL,NULL,'Титан',0,'Hublot',49800,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(937,3948,1181,339,1,2,NULL,NULL,'Черный','Нержавеющая сталь',0,'Suunto',14690,NULL,NULL,NULL,'Минеральное',NULL,'Финляндия',NULL),(938,3949,1181,339,1,2,NULL,NULL,'Синий','Пластик',0,'Timex',8120,NULL,NULL,NULL,'Пластик',NULL,'США',NULL),(939,3950,1186,339,1,2,NULL,NULL,'Белый','Нержавеющая сталь + PVD покрытие',1,'Victorinox Swiss Army',34700,NULL,NULL,NULL,'Сапфировое',NULL,'США',NULL),(940,3951,1186,339,1,2,NULL,NULL,'Белый','Нержавеющая сталь',0,'Seiko',22900,NULL,NULL,NULL,'Сапфировое',NULL,'Япония',NULL),(941,3952,1186,339,1,2,NULL,NULL,'Черный','Керамика',0,'Candino',19900,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(942,3953,1186,339,1,2,NULL,NULL,'Золотой','Нержавеющая сталь',0,'Michael Kors',11500,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(943,3954,1186,339,1,2,NULL,NULL,'Черный','Пластик',1,'Posio',3790,NULL,NULL,NULL,'Пластик',NULL,'Япония',NULL),(944,3955,1186,339,1,2,NULL,NULL,'Серый','Нержавеющая сталь',0,'Jacques Lemans',13400,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(945,3956,1181,339,1,2,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',58055,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(946,3957,1181,339,1,2,NULL,NULL,NULL,'Титан',0,'Hublot',40500,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(947,3958,1181,339,1,2,NULL,NULL,'Черный','Нержавеющая сталь',0,'Suunto',11690,NULL,NULL,NULL,'Минеральное',NULL,'Финляндия',NULL),(948,3959,1181,339,1,2,NULL,NULL,'Синий','Пластик',0,'Timex',6190,NULL,NULL,NULL,'Пластик',NULL,'США',NULL),(949,3960,1181,339,1,2,NULL,NULL,'Серый','Нержавеющая сталь',0,'Jacques Lemans',15000,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(950,3961,1181,339,1,2,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',78550,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(951,3962,1181,339,1,2,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',70550,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(1021,4032,1213,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,6999,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния+пуговицы'),(1022,4033,1213,364,1,2,NULL,'Зеленый',NULL,NULL,0,NULL,6499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния+пуговицы'),(1023,4034,1213,364,1,2,NULL,'Голубая',NULL,NULL,0,NULL,5499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния+пуговицы'),(1024,4035,1213,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,8499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(1025,4036,1213,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,5799,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(1026,4037,1213,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,2499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(1027,4038,1213,364,1,2,NULL,'Серый',NULL,NULL,0,NULL,2499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(1028,4039,1213,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,2699,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(1029,4040,1212,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,3040,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(1030,4041,1212,364,1,2,NULL,'Черный',NULL,NULL,0,NULL,2999,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(1031,4042,1212,364,1,2,NULL,'Розовый',NULL,NULL,0,NULL,3999,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(1032,4043,1212,364,1,2,NULL,'Голубая',NULL,NULL,0,NULL,3370,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(1033,4044,1212,364,1,2,NULL,'Коричневый',NULL,NULL,0,NULL,3445,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(1034,4045,1212,364,1,2,NULL,'Мультиколор',NULL,NULL,0,NULL,2970,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(1035,4046,1212,364,1,2,NULL,'Красный',NULL,NULL,0,NULL,3445,NULL,'48-50','Лето',NULL,NULL,NULL,'Молния+пуговицы'),(1036,4047,1212,364,1,2,NULL,'Желтый',NULL,NULL,0,NULL,827,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(1037,4048,1219,364,1,2,NULL,'Серый',NULL,NULL,0,NULL,7860,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(1038,4049,1219,364,1,2,NULL,'Коричневый',NULL,NULL,0,NULL,5033,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(1039,4050,1219,364,1,2,NULL,'Темно-синий, малиновый',NULL,NULL,0,NULL,5190,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния'),(1040,4051,1219,364,1,2,NULL,'Голубая',NULL,NULL,0,NULL,4999,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(1041,4052,1219,364,1,2,NULL,'Черный',NULL,NULL,0,NULL,5390,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(1042,4053,1219,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,3458,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(1043,4054,1219,364,1,2,NULL,'Серый',NULL,NULL,0,NULL,3467,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(1044,4055,1219,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,4890,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния'),(1045,4056,1220,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,2480,NULL,'54-56','Лето',NULL,NULL,NULL,'Пуговицы'),(1046,4057,1220,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,3500,NULL,'54-56','Лето',NULL,NULL,NULL,'Пуговицы'),(1047,4058,1220,364,1,2,NULL,'Серый',NULL,NULL,0,NULL,4700,NULL,'52-54','Лето',NULL,NULL,NULL,'Пуговицы'),(1048,4059,1220,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,3490,NULL,'48-50','Лето',NULL,NULL,NULL,'Пуговицы'),(1049,4060,1220,364,1,2,NULL,'Бежевый',NULL,NULL,0,NULL,3090,NULL,'50-52','Лето',NULL,NULL,NULL,'Пуговицы'),(1050,4061,1220,364,1,2,NULL,'Серый',NULL,NULL,0,NULL,3445,NULL,'48-50','Лето',NULL,NULL,NULL,'Пуговицы'),(1051,4062,1220,364,1,2,NULL,'Голубая',NULL,NULL,0,NULL,2970,NULL,'48-50','Лето',NULL,NULL,NULL,'Пуговицы'),(1052,4063,1220,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,1270,NULL,'54-56','Лето',NULL,NULL,NULL,'Пуговицы'),(1056,3908,1064,364,1,2,'BRUNO BANANI','Синий',NULL,NULL,0,NULL,3990,NULL,'52-54','Демисезон',NULL,NULL,NULL,NULL),(1057,4068,1064,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,5499,NULL,'50-52','Демисезон',NULL,NULL,NULL,NULL),(1058,4069,1064,364,1,2,'RHODE ISLAND','Синий',NULL,NULL,0,NULL,2350,NULL,'52-54','Демисезон',NULL,NULL,NULL,NULL),(1059,4070,1064,364,1,2,'BRUNO BANANI','Серый',NULL,NULL,0,NULL,3450,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(1060,3681,1064,364,1,2,NULL,'Черный',NULL,NULL,0,NULL,6590,NULL,'54-56','Демисезон',NULL,NULL,NULL,NULL),(1061,4072,1064,364,1,2,'Kekker style','Серый',NULL,NULL,0,NULL,8950,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(1062,4073,1064,364,1,2,'JOHN DEVIN','Серый',NULL,NULL,0,NULL,5690,NULL,'52-54','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(1063,4074,1064,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,4590,NULL,'54-56','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(1065,4076,1064,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,6790,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(1066,4077,1064,364,1,2,'Kekker style','Синий',NULL,NULL,0,NULL,2350,NULL,'54-56','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(1067,4078,1064,364,1,2,'Kekker style','Серый',NULL,NULL,0,NULL,4590,NULL,'54-56','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(1068,4079,1064,364,1,2,'Kekker style','Синий',NULL,NULL,0,NULL,8950,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(1069,4080,1207,365,1,2,'Bell',NULL,NULL,NULL,0,NULL,2300,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1070,4081,1207,365,1,2,'Bell',NULL,NULL,NULL,0,NULL,149,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1071,4082,1207,365,1,2,'Bell',NULL,NULL,NULL,0,NULL,310,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1072,4083,1207,365,1,2,'L`Oreal',NULL,NULL,NULL,0,NULL,440,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1073,4084,1207,365,1,2,'L`Oreal',NULL,NULL,NULL,0,NULL,430,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1074,4085,1207,365,1,2,'Maybelline New York',NULL,NULL,NULL,0,NULL,220,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1075,4086,1207,365,1,2,'Rimmel',NULL,NULL,NULL,0,NULL,300,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1076,4087,1207,365,1,2,'Rimmel',NULL,NULL,NULL,0,NULL,390,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1077,4088,1207,365,1,2,'NOUBA',NULL,NULL,NULL,0,NULL,1099,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1078,4089,1207,365,1,2,'MAX FACTOR',NULL,NULL,NULL,0,NULL,350,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1079,4090,1207,365,1,2,'Revlon',NULL,NULL,NULL,0,NULL,390,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1080,4091,1207,365,1,2,'Bell',NULL,NULL,NULL,0,NULL,210,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1081,4092,1207,365,1,2,'LUXVISAGE',NULL,NULL,NULL,0,NULL,280,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1087,4098,1202,372,1,2,NULL,'Черный',NULL,NULL,0,NULL,18990,'RICCI',NULL,NULL,NULL,'Механическое',NULL,NULL),(1088,4099,1202,372,1,2,NULL,'Серый',NULL,NULL,0,NULL,16900,'Hansa',NULL,NULL,NULL,'Механическое',NULL,NULL),(1089,4100,1202,372,1,2,NULL,'Черный',NULL,NULL,0,NULL,12900,'Hansa',NULL,NULL,NULL,'Механическое',NULL,NULL),(1090,4101,1202,372,1,2,NULL,'Серый',NULL,NULL,0,NULL,25900,'Bosch',NULL,NULL,NULL,'Электронный',NULL,NULL),(1091,4102,1202,372,1,2,NULL,'Серый',NULL,NULL,0,NULL,27900,'Samsung',NULL,NULL,NULL,'Электронный',NULL,NULL),(1092,4103,1202,372,1,2,NULL,'Антрацит',NULL,NULL,0,NULL,145500,'Asko',NULL,NULL,NULL,'Сенсорный',NULL,NULL),(1093,4104,1202,372,1,2,NULL,'Бежевый',NULL,NULL,0,NULL,15900,'Darina',NULL,NULL,NULL,'Механическое',NULL,NULL),(1094,4105,1202,372,1,2,NULL,'Лед',NULL,NULL,0,NULL,60999,'Hotpoint-Ariston',NULL,NULL,NULL,'Поворотные переключатели',NULL,NULL),(1095,4106,1203,374,1,2,'LG',NULL,NULL,NULL,0,NULL,24900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1096,4107,1203,374,1,2,'Bosch',NULL,NULL,NULL,0,NULL,22000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1097,4108,1203,374,1,2,'Indesit',NULL,NULL,NULL,0,NULL,15499,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1098,4109,1203,374,1,2,'Bosch',NULL,NULL,NULL,0,NULL,29999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1099,4110,1203,374,1,2,'SAMSUNG',NULL,NULL,NULL,0,NULL,27999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1100,4111,1203,374,1,2,'BEKO',NULL,NULL,NULL,0,NULL,12499,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1101,4112,1203,374,1,2,'ZANUSSI',NULL,NULL,NULL,0,NULL,25999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1102,4113,1203,374,1,2,'SHARP',NULL,NULL,NULL,0,NULL,184999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1103,4114,1204,375,1,2,NULL,NULL,NULL,NULL,0,NULL,6999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1104,4115,1204,375,1,2,NULL,NULL,NULL,NULL,0,NULL,2799,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1105,4116,1204,375,1,2,NULL,NULL,NULL,NULL,0,NULL,19990,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1106,4117,1204,375,1,2,NULL,NULL,NULL,NULL,0,NULL,3499,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1107,4118,1204,375,1,2,NULL,NULL,NULL,NULL,0,NULL,4999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1108,4119,1204,375,1,2,NULL,NULL,NULL,NULL,0,NULL,14999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1109,4120,1204,375,1,2,NULL,NULL,NULL,NULL,0,NULL,8299,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1110,4121,1204,375,1,2,NULL,NULL,NULL,NULL,0,NULL,4999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1111,4122,1205,377,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',17999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1112,4123,1205,377,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',37999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1113,4124,1205,377,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',45699,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1114,4125,1205,377,1,2,NULL,NULL,NULL,NULL,0,'Трехкамерный',89959,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1115,4126,1205,377,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',36999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1116,4127,1205,377,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',32899,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1117,4128,1205,377,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',76999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1118,4129,1205,377,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',24299,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1119,4130,1214,378,1,2,NULL,NULL,NULL,NULL,0,NULL,2970,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1120,4131,1214,378,1,2,NULL,NULL,NULL,NULL,0,NULL,2399,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1121,4132,1214,378,1,2,NULL,NULL,NULL,NULL,0,NULL,3599,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1122,4133,1214,378,1,2,NULL,NULL,NULL,NULL,0,NULL,2999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1123,4134,1214,378,1,2,NULL,NULL,NULL,NULL,0,NULL,2999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1124,4135,1214,378,1,2,NULL,NULL,NULL,NULL,0,NULL,3999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1125,4136,1214,378,1,2,NULL,NULL,NULL,NULL,0,NULL,1999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1126,4137,1214,378,1,2,NULL,NULL,NULL,NULL,0,NULL,3337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1127,4138,1208,379,1,2,NULL,NULL,NULL,NULL,0,NULL,3780,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1128,4139,1208,379,1,2,NULL,NULL,NULL,NULL,0,NULL,2100,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1129,4140,1208,379,1,2,NULL,NULL,NULL,NULL,0,NULL,598,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1130,4141,1208,379,1,2,NULL,NULL,NULL,NULL,0,NULL,1824,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1131,4142,1208,379,1,2,NULL,NULL,NULL,NULL,0,NULL,708,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1132,4143,1208,379,1,2,NULL,NULL,NULL,NULL,0,NULL,1297,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1133,4144,1208,379,1,2,NULL,NULL,NULL,NULL,0,NULL,269,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1134,4145,1208,379,1,2,NULL,NULL,NULL,NULL,0,NULL,1084,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1135,4146,1209,379,1,2,NULL,NULL,NULL,NULL,0,NULL,132,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1136,4147,1209,379,1,2,NULL,NULL,NULL,NULL,0,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1137,4148,1209,379,1,2,NULL,NULL,NULL,NULL,0,NULL,588,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1138,4149,1209,379,1,2,NULL,NULL,NULL,NULL,0,NULL,393,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1139,4150,1209,379,1,2,NULL,NULL,NULL,NULL,0,NULL,998,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1140,4151,1209,379,1,2,NULL,NULL,NULL,NULL,0,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1141,4152,1209,379,1,2,NULL,NULL,NULL,NULL,0,NULL,393,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1142,4153,1209,379,1,2,NULL,NULL,NULL,NULL,0,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1143,4154,1210,381,1,2,NULL,NULL,NULL,NULL,0,NULL,2600,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1144,4155,1210,381,1,2,NULL,NULL,NULL,NULL,0,NULL,3500,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1145,4156,1210,381,1,2,NULL,NULL,NULL,NULL,0,NULL,5000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1146,4157,1210,381,1,2,NULL,NULL,NULL,NULL,0,NULL,2465,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1147,4158,1210,381,1,2,NULL,NULL,NULL,NULL,0,NULL,4562,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1148,4159,1210,381,1,2,NULL,NULL,NULL,NULL,0,NULL,2580,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1149,4160,1210,381,1,2,NULL,NULL,NULL,NULL,0,NULL,7500,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1150,4161,1210,381,1,2,NULL,NULL,NULL,NULL,0,NULL,9000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1151,4162,1179,383,1,2,'Yedoo',NULL,NULL,NULL,0,NULL,10000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1152,4163,1179,383,1,2,'Trolo Raptor',NULL,NULL,NULL,0,NULL,12500,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1153,4164,1179,383,1,2,'MICRO SPEED',NULL,NULL,NULL,0,NULL,7860,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1154,4165,1179,383,1,2,'Micro Suspension',NULL,NULL,NULL,0,NULL,8999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1155,4166,1179,383,1,2,'Razor',NULL,NULL,NULL,0,NULL,15000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1156,4167,1179,383,1,2,'Weelz Rock',NULL,NULL,NULL,0,NULL,9800,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1157,4168,1179,383,1,2,'HUDORA',NULL,NULL,NULL,0,NULL,17900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1158,4169,1179,383,1,2,'Xootr',NULL,NULL,NULL,0,NULL,11800,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1182,4193,1181,87,1,2,NULL,NULL,NULL,NULL,0,NULL,29200,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1183,4194,1181,87,1,2,NULL,NULL,NULL,NULL,0,NULL,47900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1184,4195,1181,87,1,2,NULL,NULL,NULL,NULL,0,NULL,18000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1185,4196,1181,87,1,2,NULL,NULL,NULL,NULL,0,NULL,17900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1187,4198,1186,87,1,2,NULL,NULL,NULL,NULL,0,NULL,18000,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cms3_filter_index_56_pages_1161` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_filter_index_56_pages_228`
--

DROP TABLE IF EXISTS `cms3_filter_index_56_pages_228`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_filter_index_56_pages_228` (
  `id` int(10) unsigned NOT NULL,
  `obj_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `lang_id` int(10) unsigned NOT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  `brend` varchar(255) DEFAULT NULL,
  `cvet` varchar(255) DEFAULT NULL,
  `cvet_korpusa` varchar(255) DEFAULT NULL,
  `material_korpusa` varchar(255) DEFAULT NULL,
  `nalichie_budilnika` tinyint(1) DEFAULT '0',
  `naznachenie` varchar(255) DEFAULT NULL,
  `novoe_pole` varchar(255) DEFAULT NULL,
  `obem_upakovki` double DEFAULT NULL,
  `price` double DEFAULT '0',
  `proizvoditel` varchar(255) DEFAULT NULL,
  `razmer` varchar(255) DEFAULT NULL,
  `razmer_pitomca` varchar(255) DEFAULT NULL,
  `razmer_ramy_dyujmy` double DEFAULT NULL,
  `sezon` varchar(255) DEFAULT NULL,
  `sostav_napolnitelya` varchar(255) DEFAULT NULL,
  `steklo` varchar(255) DEFAULT NULL,
  `tip` varchar(255) DEFAULT NULL,
  `tip_mehanizma` varchar(255) DEFAULT NULL,
  `ves` double DEFAULT NULL,
  `ves_upakovki` double DEFAULT NULL,
  `ves_velosipeda` double DEFAULT NULL,
  `vid` varchar(255) DEFAULT NULL,
  `vmestimost` bigint(20) DEFAULT NULL,
  `vozrast` varchar(255) DEFAULT NULL,
  `vysota` double DEFAULT NULL,
  `zastezhka` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `obj_id` (`obj_id`),
  KEY `parent_id` (`parent_id`),
  KEY `type_id` (`type_id`),
  KEY `lang_id` (`lang_id`),
  KEY `domain_id` (`domain_id`),
  KEY `brend` (`brend`),
  KEY `cvet` (`cvet`),
  KEY `cvet_korpusa` (`cvet_korpusa`),
  KEY `material_korpusa` (`material_korpusa`),
  KEY `naznachenie` (`naznachenie`),
  KEY `novoe_pole` (`novoe_pole`),
  KEY `obem_upakovki` (`obem_upakovki`),
  KEY `price` (`price`),
  KEY `proizvoditel` (`proizvoditel`),
  KEY `razmer` (`razmer`),
  KEY `razmer_pitomca` (`razmer_pitomca`),
  KEY `razmer_ramy_dyujmy` (`razmer_ramy_dyujmy`),
  KEY `sezon` (`sezon`),
  KEY `sostav_napolnitelya` (`sostav_napolnitelya`),
  KEY `steklo` (`steklo`),
  KEY `tip` (`tip`),
  KEY `tip_mehanizma` (`tip_mehanizma`),
  KEY `ves` (`ves`),
  KEY `ves_upakovki` (`ves_upakovki`),
  KEY `ves_velosipeda` (`ves_velosipeda`),
  KEY `vid` (`vid`),
  KEY `vmestimost` (`vmestimost`),
  KEY `vozrast` (`vozrast`),
  KEY `vysota` (`vysota`),
  KEY `zastezhka` (`zastezhka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_filter_index_56_pages_228`
--

LOCK TABLES `cms3_filter_index_56_pages_228` WRITE;
/*!40000 ALTER TABLE `cms3_filter_index_56_pages_228` DISABLE KEYS */;
INSERT INTO `cms3_filter_index_56_pages_228` VALUES (1,1407,248,136,1,1,NULL,NULL,'Серый','Нержавеющая сталь',0,NULL,'Jacques Lemans',NULL,13900,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,1408,253,136,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,NULL,'Epos',NULL,70550,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,1409,248,136,1,1,NULL,NULL,NULL,'Титан',0,NULL,'Hublot',NULL,49800,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,1410,248,136,1,1,NULL,NULL,'Черный','Нержавеющая сталь',0,NULL,'Suunto',NULL,14690,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Финляндия',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,1411,248,136,1,1,NULL,NULL,'Синий','Пластик',0,NULL,'Timex',NULL,8120,NULL,NULL,NULL,NULL,NULL,NULL,'Пластик',NULL,'США',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,1412,253,136,1,1,NULL,NULL,'Белый','Нержавеющая сталь + PVD покрытие',1,NULL,'Victorinox Swiss Army',NULL,34700,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'США',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,1413,253,136,1,1,NULL,NULL,'Белый','Нержавеющая сталь',0,NULL,'Seiko',NULL,22900,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Япония',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,1414,253,136,1,1,NULL,NULL,'Черный','Керамика',0,NULL,'Candino',NULL,19900,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,1415,253,136,1,1,NULL,NULL,'Золотой','Нержавеющая сталь',0,NULL,'Michael Kors',NULL,11500,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,1416,253,136,1,1,NULL,NULL,'Черный','Пластик',1,NULL,'Posio',NULL,3790,NULL,NULL,NULL,NULL,NULL,NULL,'Пластик',NULL,'Япония',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,1417,253,136,1,1,NULL,NULL,'Серый','Нержавеющая сталь',0,NULL,'Jacques Lemans',NULL,13400,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,1418,248,136,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,NULL,'Epos',NULL,58055,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,1419,248,136,1,1,NULL,NULL,NULL,'Титан',0,NULL,'Hublot',NULL,40500,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,1420,248,136,1,1,NULL,NULL,'Черный','Нержавеющая сталь',0,NULL,'Suunto',NULL,11690,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Финляндия',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,1421,248,136,1,1,NULL,NULL,'Синий','Пластик',0,NULL,'Timex',NULL,6190,NULL,NULL,NULL,NULL,NULL,NULL,'Пластик',NULL,'США',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,1422,248,136,1,1,NULL,NULL,'Серый','Нержавеющая сталь',0,NULL,'Jacques Lemans',NULL,15000,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,1423,248,136,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,NULL,'Epos',NULL,78550,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,1424,248,136,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,NULL,'Epos',NULL,70550,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,1367,230,145,1,1,NULL,'Черный',NULL,NULL,0,'Мужской',NULL,NULL,14990,NULL,NULL,NULL,18,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,11,'Хардтейл',NULL,NULL,NULL,NULL),(20,1360,230,145,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,39900,NULL,NULL,NULL,19,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,12,'Хардтейл',NULL,NULL,NULL,NULL),(21,1427,230,145,1,1,NULL,'Бирюзовый',NULL,NULL,0,'Женский',NULL,NULL,13990,NULL,NULL,NULL,18,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,13,'Хардтейл',NULL,NULL,NULL,NULL),(22,1363,230,145,1,1,NULL,'Серый',NULL,NULL,0,'Женский',NULL,NULL,32900,NULL,NULL,NULL,21,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,9,'Двухподвес',NULL,NULL,NULL,NULL),(23,1429,230,145,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,69900,NULL,NULL,NULL,20,NULL,NULL,NULL,'Горный',NULL,NULL,NULL,13,'Хардтейл',NULL,NULL,NULL,NULL),(24,1430,230,145,1,1,NULL,'Черный',NULL,NULL,0,'Женский',NULL,NULL,24900,NULL,NULL,NULL,21,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,12,'Дорожный',NULL,NULL,NULL,NULL),(25,1431,230,145,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,17990,NULL,NULL,NULL,20,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,11,'Двухподвес',NULL,NULL,NULL,NULL),(26,1432,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Женский',NULL,NULL,9900,NULL,NULL,NULL,9,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,5,'Хардтейл',NULL,NULL,NULL,NULL),(27,1365,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,8900,NULL,NULL,NULL,10,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,4,'Хардтейл',NULL,NULL,NULL,NULL),(28,1434,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,5900,NULL,NULL,NULL,8,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,6,'Хардтейл',NULL,NULL,NULL,NULL),(29,1435,230,145,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,79900,NULL,NULL,NULL,19,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,12,'Хардтейл',NULL,NULL,NULL,NULL),(30,1436,230,145,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,49900,NULL,NULL,NULL,20,NULL,NULL,NULL,'Горный',NULL,NULL,NULL,13,'Хардтейл',NULL,NULL,NULL,NULL),(31,1372,230,145,1,1,NULL,'Серый',NULL,NULL,0,'Женский',NULL,NULL,38900,NULL,NULL,NULL,21,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,9,'Двухподвес',NULL,NULL,NULL,NULL),(32,1438,230,145,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,18990,NULL,NULL,NULL,20,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,11,'Двухподвес',NULL,NULL,NULL,NULL),(33,1439,230,145,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,32900,NULL,NULL,NULL,19,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,12,'Хардтейл',NULL,NULL,NULL,NULL),(34,1440,230,145,1,1,NULL,'Бирюзовый',NULL,NULL,0,'Женский',NULL,NULL,19990,NULL,NULL,NULL,18,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,13,'Хардтейл',NULL,NULL,NULL,NULL),(35,1441,230,145,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,56900,NULL,NULL,NULL,20,NULL,NULL,NULL,'Горный',NULL,NULL,NULL,13,'Хардтейл',NULL,NULL,NULL,NULL),(36,1442,230,145,1,1,NULL,'Черный',NULL,NULL,0,'Женский',NULL,NULL,22900,NULL,NULL,NULL,21,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,12,'Дорожный',NULL,NULL,NULL,NULL),(37,1443,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Женский',NULL,NULL,8900,NULL,NULL,NULL,9,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,5,'Хардтейл',NULL,NULL,NULL,NULL),(38,1444,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,11900,NULL,NULL,NULL,10,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,4,'Хардтейл',NULL,NULL,NULL,NULL),(39,1445,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,5500,NULL,NULL,NULL,8,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,6,'Хардтейл',NULL,NULL,NULL,NULL),(40,1446,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Женский',NULL,NULL,9400,NULL,NULL,NULL,9,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,5,'Хардтейл',NULL,NULL,NULL,NULL),(41,1447,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,8900,NULL,NULL,NULL,10,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,4,'Хардтейл',NULL,NULL,NULL,NULL),(42,1448,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,13000,NULL,NULL,NULL,10,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,4,'Хардтейл',NULL,NULL,NULL,NULL),(43,1449,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Женский',NULL,NULL,12000,NULL,NULL,NULL,9,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,5,'Хардтейл',NULL,NULL,NULL,NULL),(44,1450,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,12900,NULL,NULL,NULL,10,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,4,'Хардтейл',NULL,NULL,NULL,NULL),(45,1451,258,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,950,NULL,NULL,'Любой размер',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1500,NULL,NULL,NULL,'Взрослые',NULL,NULL),(46,1452,258,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3200,NULL,NULL,NULL,'Взрослые',NULL,NULL),(47,1453,258,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000,NULL,NULL,NULL,'Взрослые',NULL,NULL),(48,1454,258,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2720,NULL,NULL,NULL,'Взрослые',NULL,NULL),(49,1455,258,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2280,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3630,NULL,NULL,NULL,'Любой',NULL,NULL),(50,1456,259,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,810,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1020,NULL,NULL,NULL,'Взрослые',NULL,NULL),(51,1457,259,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1190,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2400,NULL,NULL,NULL,'Взрослые',NULL,NULL),(52,1458,259,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1320,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2040,NULL,NULL,NULL,'Любой',NULL,NULL),(53,1459,259,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1190,NULL,NULL,NULL,'Взрослые',NULL,NULL),(54,1460,259,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,4100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3840,NULL,NULL,NULL,'Взрослые',NULL,NULL),(55,1461,266,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,190,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL),(56,1462,266,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,389,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,700,NULL,NULL,NULL,NULL,NULL,NULL),(57,1463,266,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,410,NULL,NULL,'Малый и средний',NULL,NULL,NULL,NULL,NULL,NULL,NULL,700,NULL,NULL,NULL,'Любой',NULL,NULL),(58,1464,266,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,99,NULL,NULL,'Любой размер',NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,NULL,NULL,NULL,'Любой',NULL,NULL),(59,1465,266,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,80,NULL,NULL,'Любой размер',NULL,NULL,NULL,NULL,NULL,NULL,NULL,400,NULL,NULL,NULL,'Взрослые',NULL,NULL),(60,1466,257,155,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,4.5,154,NULL,NULL,NULL,NULL,NULL,'Древесина',NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,1467,257,155,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,4.54,119,NULL,NULL,NULL,NULL,NULL,'Древесина',NULL,NULL,NULL,2.31,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,1468,257,155,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,10,480,NULL,NULL,NULL,NULL,NULL,'Хлопок',NULL,NULL,NULL,0.96,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,1469,257,155,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,16,1790,NULL,NULL,NULL,NULL,NULL,'Глина + мин. добавки',NULL,NULL,NULL,15.87,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,1470,239,157,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1310,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.9,NULL,NULL,NULL,2,NULL,105,NULL),(65,1471,239,157,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2390,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3.14,NULL,NULL,NULL,1,NULL,86,NULL),(66,1472,239,157,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2950,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3.12,NULL,NULL,NULL,1,NULL,137,NULL),(67,1473,239,157,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2940,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2.9,NULL,NULL,NULL,2,NULL,110,NULL),(68,1474,284,161,1,1,'MitLex','Черный',NULL,NULL,0,NULL,NULL,NULL,11900,NULL,'52-54',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(69,1475,284,161,1,1,'Mango Man','Бежевый',NULL,NULL,0,NULL,NULL,NULL,9900,NULL,'50-52',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(70,1476,284,161,1,1,'Burton Menswear London','Черный',NULL,NULL,0,NULL,NULL,NULL,8900,NULL,'50-52',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(71,1369,86,161,1,1,'BRUNO BANANI','Синий',NULL,NULL,0,NULL,NULL,NULL,3990,NULL,'52-54',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,1478,284,161,1,1,'Roosevelt','Серый',NULL,NULL,0,NULL,NULL,NULL,10399,NULL,'48-50',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(73,1479,86,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,5499,NULL,'50-52',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,1480,284,161,1,1,'United Colors of Benetton','Черный',NULL,NULL,0,NULL,NULL,NULL,8900,NULL,'52-54',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(75,1481,86,161,1,1,'RHODE ISLAND','Синий',NULL,NULL,0,NULL,NULL,NULL,2350,NULL,'52-54',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,1482,284,161,1,1,'Only & Sons','Черный',NULL,NULL,0,NULL,NULL,NULL,6500,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(77,1483,86,161,1,1,'BRUNO BANANI','Серый',NULL,NULL,0,NULL,NULL,NULL,3450,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(78,749,86,161,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,6590,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(79,1485,284,161,1,1,'Jack & Jones','Черный',NULL,NULL,0,NULL,NULL,NULL,10999,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(80,1486,86,161,1,1,'Kekker style','Серый',NULL,NULL,0,NULL,NULL,NULL,8950,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(81,1487,86,161,1,1,'Kekker style','Синий',NULL,NULL,0,NULL,NULL,NULL,8950,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(82,1488,284,161,1,1,'Windsor','Черный',NULL,NULL,0,NULL,NULL,NULL,52900,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(83,1489,284,161,1,1,'Trussardi Jeans','Синий',NULL,NULL,0,NULL,NULL,NULL,26900,NULL,'52-54',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(84,1490,284,161,1,1,'Berkytt','Коричневый',NULL,NULL,0,NULL,NULL,NULL,12400,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(85,1491,284,161,1,1,'Piazza Italia','Серый',NULL,NULL,0,NULL,NULL,NULL,7399,NULL,'52-54',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(87,1493,86,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,6790,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(88,1494,285,161,1,1,'Atributika & Club','Черный',NULL,NULL,0,NULL,NULL,NULL,5499,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(89,1495,86,161,1,1,'Kekker style','Синий',NULL,NULL,0,NULL,NULL,NULL,2350,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(90,1496,285,161,1,1,'Trespass','Хакки',NULL,NULL,0,NULL,NULL,NULL,18999,NULL,'50-52',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(91,1497,86,161,1,1,'Kekker style','Серый',NULL,NULL,0,NULL,NULL,NULL,4590,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(92,1498,86,161,1,1,'JOHN DEVIN','Серый',NULL,NULL,0,NULL,NULL,NULL,5690,NULL,'52-54',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(93,1499,285,161,1,1,'EA7','Синий',NULL,NULL,0,NULL,NULL,NULL,22899,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(94,1500,285,161,1,1,'Reebok','Серый',NULL,NULL,0,NULL,NULL,NULL,14690,NULL,'48-50',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(95,1501,86,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,4590,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(96,1502,285,161,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,22889,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(97,1503,285,161,1,1,'Bergans of Norway','Черный',NULL,NULL,0,NULL,NULL,NULL,27999,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(98,1504,285,161,1,1,'Springfield','Желтый',NULL,NULL,0,NULL,NULL,NULL,7999,NULL,'52-54',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(99,1505,285,161,1,1,'Columbia','Красный',NULL,NULL,0,NULL,NULL,NULL,23999,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(100,1506,285,161,1,1,'Columbia','Синий',NULL,NULL,0,NULL,NULL,NULL,12999,NULL,'50-52',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(101,1507,285,161,1,1,'Baon','Синий',NULL,NULL,0,NULL,NULL,NULL,12699,NULL,'50-52',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(102,1508,285,161,1,1,'Quiksilver','Черный',NULL,NULL,0,NULL,NULL,NULL,17690,NULL,'50-52',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(103,1509,285,161,1,1,'Columbia','Черный',NULL,NULL,0,NULL,NULL,NULL,9999,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(104,1510,280,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,6999,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(105,1511,280,161,1,1,NULL,'Зеленый',NULL,NULL,0,NULL,NULL,NULL,6499,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(106,1512,280,161,1,1,NULL,'Голубая',NULL,NULL,0,NULL,NULL,NULL,5499,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(107,1513,280,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,8499,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(108,1514,280,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,5799,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(109,1515,280,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,2499,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(110,1516,280,161,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,2499,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(111,1517,280,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,2699,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(112,1518,279,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,3040,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(113,1519,279,161,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,2999,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(114,1520,279,161,1,1,NULL,'Розовый',NULL,NULL,0,NULL,NULL,NULL,3999,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(115,1521,279,161,1,1,NULL,'Голубая',NULL,NULL,0,NULL,NULL,NULL,3370,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(116,1522,279,161,1,1,NULL,'Коричневый',NULL,NULL,0,NULL,NULL,NULL,3445,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(117,1523,279,161,1,1,NULL,'Мультиколор',NULL,NULL,0,NULL,NULL,NULL,2970,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(118,1524,279,161,1,1,NULL,'Красный',NULL,NULL,0,NULL,NULL,NULL,3445,NULL,'48-50',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(119,1525,279,161,1,1,NULL,'Желтый',NULL,NULL,0,NULL,NULL,NULL,827,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(120,1526,286,161,1,1,NULL,'Коричневый',NULL,NULL,0,NULL,NULL,NULL,5033,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(121,1527,286,161,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,7860,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(122,1528,286,161,1,1,NULL,'Темно-синий, малиновый',NULL,NULL,0,NULL,NULL,NULL,5190,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(123,1529,286,161,1,1,NULL,'Голубая',NULL,NULL,0,NULL,NULL,NULL,4999,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(124,1530,286,161,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,5390,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(125,1531,286,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,3458,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(126,1532,286,161,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,3467,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(127,1533,286,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,4890,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(128,1534,287,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,2480,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(129,1535,287,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,3500,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(130,1536,287,161,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,4700,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(131,1537,287,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,1270,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(132,1538,287,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,3490,NULL,'48-50',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(133,1539,287,161,1,1,NULL,'Бежевый',NULL,NULL,0,NULL,NULL,NULL,3090,NULL,'50-52',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(134,1540,287,161,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,3445,NULL,'48-50',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(135,1541,287,161,1,1,NULL,'Голубая',NULL,NULL,0,NULL,NULL,NULL,2970,NULL,'48-50',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(136,1542,274,162,1,1,'Bell',NULL,NULL,NULL,0,NULL,NULL,NULL,2300,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(137,1543,274,162,1,1,'Bell',NULL,NULL,NULL,0,NULL,NULL,NULL,149,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(138,1544,274,162,1,1,'Bell',NULL,NULL,NULL,0,NULL,NULL,NULL,310,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(139,1545,274,162,1,1,'L`Oreal',NULL,NULL,NULL,0,NULL,NULL,NULL,440,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(140,1546,274,162,1,1,'L`Oreal',NULL,NULL,NULL,0,NULL,NULL,NULL,430,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(141,1547,274,162,1,1,'Maybelline New York',NULL,NULL,NULL,0,NULL,NULL,NULL,220,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(142,1548,274,162,1,1,'Rimmel',NULL,NULL,NULL,0,NULL,NULL,NULL,300,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(143,1549,274,162,1,1,'Rimmel',NULL,NULL,NULL,0,NULL,NULL,NULL,390,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(144,1550,274,162,1,1,'NOUBA',NULL,NULL,NULL,0,NULL,NULL,NULL,1099,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(145,1551,274,162,1,1,'MAX FACTOR',NULL,NULL,NULL,0,NULL,NULL,NULL,350,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(146,1552,274,162,1,1,'Revlon',NULL,NULL,NULL,0,NULL,NULL,NULL,390,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(147,1553,274,162,1,1,'Bell',NULL,NULL,NULL,0,NULL,NULL,NULL,210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(148,1554,274,162,1,1,'LUXVISAGE',NULL,NULL,NULL,0,NULL,NULL,NULL,280,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(149,1555,267,163,1,1,NULL,'Зеленый',NULL,NULL,0,NULL,NULL,NULL,2750,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(150,1556,267,163,1,1,NULL,'Зеленый',NULL,NULL,0,NULL,NULL,NULL,3400,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(151,1557,267,163,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,2600,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(152,1558,267,163,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,6700,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(153,1559,267,163,1,1,NULL,'Красный',NULL,NULL,0,NULL,NULL,NULL,6875,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(154,1560,269,169,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,18990,'RICCI',NULL,NULL,NULL,NULL,NULL,NULL,'Механическое',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(155,1561,269,169,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,16900,'Hansa',NULL,NULL,NULL,NULL,NULL,NULL,'Механическое',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(156,1562,269,169,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,12900,'Hansa',NULL,NULL,NULL,NULL,NULL,NULL,'Механическое',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(157,1563,269,169,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,25900,'Bosch',NULL,NULL,NULL,NULL,NULL,NULL,'Электронный',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(158,1564,269,169,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,27900,'Samsung',NULL,NULL,NULL,NULL,NULL,NULL,'Электронный',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(159,1565,269,169,1,1,NULL,'Антрацит',NULL,NULL,0,NULL,NULL,NULL,145500,'Asko',NULL,NULL,NULL,NULL,NULL,NULL,'Сенсорный',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(160,1566,269,169,1,1,NULL,'Бежевый',NULL,NULL,0,NULL,NULL,NULL,15900,'Darina',NULL,NULL,NULL,NULL,NULL,NULL,'Механическое',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(161,1567,269,169,1,1,NULL,'Лед',NULL,NULL,0,NULL,NULL,NULL,60999,'Hotpoint-Ariston',NULL,NULL,NULL,NULL,NULL,NULL,'Поворотные переключатели',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(162,1568,270,171,1,1,'LG',NULL,NULL,NULL,0,NULL,NULL,NULL,24900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(163,1569,270,171,1,1,'Bosch',NULL,NULL,NULL,0,NULL,NULL,NULL,22000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(164,1570,270,171,1,1,'Indesit',NULL,NULL,NULL,0,NULL,NULL,NULL,15499,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,61,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(165,1571,270,171,1,1,'Bosch',NULL,NULL,NULL,0,NULL,NULL,NULL,29999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(166,1572,270,171,1,1,'SAMSUNG',NULL,NULL,NULL,0,NULL,NULL,NULL,27999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(167,1573,270,171,1,1,'BEKO',NULL,NULL,NULL,0,NULL,NULL,NULL,12499,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(168,1574,270,171,1,1,'ZANUSSI',NULL,NULL,NULL,0,NULL,NULL,NULL,25999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(169,1575,270,171,1,1,'SHARP',NULL,NULL,NULL,0,NULL,NULL,NULL,184999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(170,1576,271,172,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,6999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(171,1577,271,172,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2799,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(172,1578,271,172,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,19990,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(173,1579,271,172,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3499,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(174,1580,271,172,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,4999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(175,1581,271,172,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,14999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(176,1582,271,172,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,8299,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(177,1583,271,172,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,4999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(178,1584,272,174,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,17999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(179,1585,272,174,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,37999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(180,1586,272,174,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,45699,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(181,1587,272,174,1,1,NULL,NULL,NULL,NULL,0,NULL,'Трехкамерный',NULL,89959,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(182,1588,272,174,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,36999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(183,1589,272,174,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,32899,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(184,1590,272,174,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,76999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(185,1591,272,174,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,24299,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(186,1592,281,175,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2970,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(187,1593,281,175,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2399,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(188,1594,281,175,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3599,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(189,1595,281,175,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(190,1596,281,175,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(191,1597,281,175,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(192,1598,281,175,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(193,1599,281,175,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3337,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(194,1600,275,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3780,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(195,1601,275,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(196,1602,275,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,598,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(197,1603,275,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1824,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(198,1604,275,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,708,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(199,1605,275,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1297,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(200,1606,275,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,269,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(201,1607,275,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1084,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(202,1608,276,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,132,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(203,1609,276,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(204,1610,276,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,588,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(205,1611,276,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,393,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(206,1612,276,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,998,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(207,1613,276,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(208,1614,276,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,393,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(209,1615,276,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(210,1616,277,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2600,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(211,1617,277,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(212,1618,277,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,5000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(213,1619,277,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2465,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(214,1620,277,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,4562,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(215,1621,277,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2580,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(216,1622,277,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,7500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(217,1623,277,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,9000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(218,1624,246,180,1,1,'Yedoo',NULL,NULL,NULL,0,NULL,NULL,NULL,10000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(219,1625,246,180,1,1,'Trolo Raptor',NULL,NULL,NULL,0,NULL,NULL,NULL,12500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(220,1626,246,180,1,1,'MICRO SPEED',NULL,NULL,NULL,0,NULL,NULL,NULL,7860,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(221,1627,246,180,1,1,'Micro Suspension',NULL,NULL,NULL,0,NULL,NULL,NULL,8999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(222,1628,246,180,1,1,'Razor',NULL,NULL,NULL,0,NULL,NULL,NULL,15000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(223,1629,246,180,1,1,'Weelz Rock',NULL,NULL,NULL,0,NULL,NULL,NULL,9800,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(224,1630,246,180,1,1,'HUDORA',NULL,NULL,NULL,0,NULL,NULL,NULL,17900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(225,1631,246,180,1,1,'Xootr',NULL,NULL,NULL,0,NULL,NULL,NULL,11800,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(235,1641,234,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,780,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(236,1642,234,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,410,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(237,1643,234,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(241,1647,240,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,740,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(242,1648,240,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(243,1649,240,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(244,1650,240,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2700,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(245,1651,240,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3300,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(249,1655,248,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,29200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(250,1656,248,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,47900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(251,1657,248,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,18000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(252,1658,248,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,17900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(254,1660,253,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,18000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(262,1668,261,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(263,1669,261,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1750,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(264,1670,261,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2610,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cms3_filter_index_56_pages_228` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_filter_index_56_pages_539`
--

DROP TABLE IF EXISTS `cms3_filter_index_56_pages_539`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_filter_index_56_pages_539` (
  `id` int(10) unsigned NOT NULL,
  `obj_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `lang_id` int(10) unsigned NOT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  `brend` varchar(255) DEFAULT NULL,
  `cvet` varchar(255) DEFAULT NULL,
  `cvet_korpusa` varchar(255) DEFAULT NULL,
  `material_korpusa` varchar(255) DEFAULT NULL,
  `nalichie_budilnika` tinyint(1) DEFAULT '0',
  `novoe_pole` varchar(255) DEFAULT NULL,
  `price` double DEFAULT '0',
  `proizvoditel` varchar(255) DEFAULT NULL,
  `razmer` varchar(255) DEFAULT NULL,
  `sezon` varchar(255) DEFAULT NULL,
  `steklo` varchar(255) DEFAULT NULL,
  `tip` varchar(255) DEFAULT NULL,
  `tip_mehanizma` varchar(255) DEFAULT NULL,
  `zastezhka` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `obj_id` (`obj_id`),
  KEY `parent_id` (`parent_id`),
  KEY `type_id` (`type_id`),
  KEY `lang_id` (`lang_id`),
  KEY `domain_id` (`domain_id`),
  KEY `brend` (`brend`),
  KEY `cvet` (`cvet`),
  KEY `cvet_korpusa` (`cvet_korpusa`),
  KEY `material_korpusa` (`material_korpusa`),
  KEY `novoe_pole` (`novoe_pole`),
  KEY `price` (`price`),
  KEY `proizvoditel` (`proizvoditel`),
  KEY `razmer` (`razmer`),
  KEY `sezon` (`sezon`),
  KEY `steklo` (`steklo`),
  KEY `tip` (`tip`),
  KEY `tip_mehanizma` (`tip_mehanizma`),
  KEY `zastezhka` (`zastezhka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_filter_index_56_pages_539`
--

LOCK TABLES `cms3_filter_index_56_pages_539` WRITE;
/*!40000 ALTER TABLE `cms3_filter_index_56_pages_539` DISABLE KEYS */;
INSERT INTO `cms3_filter_index_56_pages_539` VALUES (312,2132,559,209,1,2,NULL,NULL,'Серый','Нержавеющая сталь',0,'Jacques Lemans',13900,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(313,2133,564,209,1,2,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',70550,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(314,2134,559,209,1,2,NULL,NULL,NULL,'Титан',0,'Hublot',49800,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(315,2135,559,209,1,2,NULL,NULL,'Черный','Нержавеющая сталь',0,'Suunto',14690,NULL,NULL,NULL,'Минеральное',NULL,'Финляндия',NULL),(316,2136,559,209,1,2,NULL,NULL,'Синий','Пластик',0,'Timex',8120,NULL,NULL,NULL,'Пластик',NULL,'США',NULL),(317,2137,564,209,1,2,NULL,NULL,'Белый','Нержавеющая сталь + PVD покрытие',1,'Victorinox Swiss Army',34700,NULL,NULL,NULL,'Сапфировое',NULL,'США',NULL),(318,2138,564,209,1,2,NULL,NULL,'Белый','Нержавеющая сталь',0,'Seiko',22900,NULL,NULL,NULL,'Сапфировое',NULL,'Япония',NULL),(319,2139,564,209,1,2,NULL,NULL,'Черный','Керамика',0,'Candino',19900,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(320,2140,564,209,1,2,NULL,NULL,'Золотой','Нержавеющая сталь',0,'Michael Kors',11500,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(321,2141,564,209,1,2,NULL,NULL,'Черный','Пластик',1,'Posio',3790,NULL,NULL,NULL,'Пластик',NULL,'Япония',NULL),(322,2142,564,209,1,2,NULL,NULL,'Серый','Нержавеющая сталь',0,'Jacques Lemans',13400,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(323,2143,559,209,1,2,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',58055,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(324,2144,559,209,1,2,NULL,NULL,NULL,'Титан',0,'Hublot',40500,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(325,2145,559,209,1,2,NULL,NULL,'Черный','Нержавеющая сталь',0,'Suunto',11690,NULL,NULL,NULL,'Минеральное',NULL,'Финляндия',NULL),(326,2146,559,209,1,2,NULL,NULL,'Синий','Пластик',0,'Timex',6190,NULL,NULL,NULL,'Пластик',NULL,'США',NULL),(327,2147,559,209,1,2,NULL,NULL,'Серый','Нержавеющая сталь',0,'Jacques Lemans',15000,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(328,2148,559,209,1,2,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',78550,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(329,2149,559,209,1,2,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',70550,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(399,2219,591,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,6999,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния+пуговицы'),(400,2220,591,234,1,2,NULL,'Зеленый',NULL,NULL,0,NULL,6499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния+пуговицы'),(401,2221,591,234,1,2,NULL,'Голубая',NULL,NULL,0,NULL,5499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния+пуговицы'),(402,2222,591,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,8499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(403,2223,591,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,5799,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(404,2224,591,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,2499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(405,2225,591,234,1,2,NULL,'Серый',NULL,NULL,0,NULL,2499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(406,2226,591,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,2699,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(407,2227,590,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,3040,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(408,2228,590,234,1,2,NULL,'Черный',NULL,NULL,0,NULL,2999,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(409,2229,590,234,1,2,NULL,'Розовый',NULL,NULL,0,NULL,3999,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(410,2230,590,234,1,2,NULL,'Голубая',NULL,NULL,0,NULL,3370,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(411,2231,590,234,1,2,NULL,'Коричневый',NULL,NULL,0,NULL,3445,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(412,2232,590,234,1,2,NULL,'Мультиколор',NULL,NULL,0,NULL,2970,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(413,2233,590,234,1,2,NULL,'Красный',NULL,NULL,0,NULL,3445,NULL,'48-50','Лето',NULL,NULL,NULL,'Молния+пуговицы'),(414,2234,590,234,1,2,NULL,'Желтый',NULL,NULL,0,NULL,827,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(415,2235,597,234,1,2,NULL,'Серый',NULL,NULL,0,NULL,7860,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(416,2236,597,234,1,2,NULL,'Коричневый',NULL,NULL,0,NULL,5033,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(417,2237,597,234,1,2,NULL,'Темно-синий, малиновый',NULL,NULL,0,NULL,5190,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния'),(418,2238,597,234,1,2,NULL,'Голубая',NULL,NULL,0,NULL,4999,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(419,2239,597,234,1,2,NULL,'Черный',NULL,NULL,0,NULL,5390,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(420,2240,597,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,3458,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(421,2241,597,234,1,2,NULL,'Серый',NULL,NULL,0,NULL,3467,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(422,2242,597,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,4890,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния'),(423,2243,598,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,2480,NULL,'54-56','Лето',NULL,NULL,NULL,'Пуговицы'),(424,2244,598,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,3500,NULL,'54-56','Лето',NULL,NULL,NULL,'Пуговицы'),(425,2245,598,234,1,2,NULL,'Серый',NULL,NULL,0,NULL,4700,NULL,'52-54','Лето',NULL,NULL,NULL,'Пуговицы'),(426,2246,598,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,3490,NULL,'48-50','Лето',NULL,NULL,NULL,'Пуговицы'),(427,2247,598,234,1,2,NULL,'Бежевый',NULL,NULL,0,NULL,3090,NULL,'50-52','Лето',NULL,NULL,NULL,'Пуговицы'),(428,2248,598,234,1,2,NULL,'Серый',NULL,NULL,0,NULL,3445,NULL,'48-50','Лето',NULL,NULL,NULL,'Пуговицы'),(429,2249,598,234,1,2,NULL,'Голубая',NULL,NULL,0,NULL,2970,NULL,'48-50','Лето',NULL,NULL,NULL,'Пуговицы'),(430,2250,598,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,1270,NULL,'54-56','Лето',NULL,NULL,NULL,'Пуговицы'),(434,2095,442,234,1,2,'BRUNO BANANI','Синий',NULL,NULL,0,NULL,3990,NULL,'52-54','Демисезон',NULL,NULL,NULL,NULL),(435,2255,442,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,5499,NULL,'50-52','Демисезон',NULL,NULL,NULL,NULL),(436,2256,442,234,1,2,'RHODE ISLAND','Синий',NULL,NULL,0,NULL,2350,NULL,'52-54','Демисезон',NULL,NULL,NULL,NULL),(437,2257,442,234,1,2,'BRUNO BANANI','Серый',NULL,NULL,0,NULL,3450,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(438,1868,442,234,1,2,NULL,'Черный',NULL,NULL,0,NULL,6590,NULL,'54-56','Демисезон',NULL,NULL,NULL,NULL),(439,2259,442,234,1,2,'Kekker style','Серый',NULL,NULL,0,NULL,8950,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(440,2260,442,234,1,2,'JOHN DEVIN','Серый',NULL,NULL,0,NULL,5690,NULL,'52-54','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(441,2261,442,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,4590,NULL,'54-56','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(443,2263,442,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,6790,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(444,2264,442,234,1,2,'Kekker style','Синий',NULL,NULL,0,NULL,2350,NULL,'54-56','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(445,2265,442,234,1,2,'Kekker style','Серый',NULL,NULL,0,NULL,4590,NULL,'54-56','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(446,2266,442,234,1,2,'Kekker style','Синий',NULL,NULL,0,NULL,8950,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(447,2267,585,235,1,2,'Bell',NULL,NULL,NULL,0,NULL,2300,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(448,2268,585,235,1,2,'Bell',NULL,NULL,NULL,0,NULL,149,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(449,2269,585,235,1,2,'Bell',NULL,NULL,NULL,0,NULL,310,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(450,2270,585,235,1,2,'L`Oreal',NULL,NULL,NULL,0,NULL,440,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(451,2271,585,235,1,2,'L`Oreal',NULL,NULL,NULL,0,NULL,430,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(452,2272,585,235,1,2,'Maybelline New York',NULL,NULL,NULL,0,NULL,220,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(453,2273,585,235,1,2,'Rimmel',NULL,NULL,NULL,0,NULL,300,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(454,2274,585,235,1,2,'Rimmel',NULL,NULL,NULL,0,NULL,390,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(455,2275,585,235,1,2,'NOUBA',NULL,NULL,NULL,0,NULL,1099,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(456,2276,585,235,1,2,'MAX FACTOR',NULL,NULL,NULL,0,NULL,350,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(457,2277,585,235,1,2,'Revlon',NULL,NULL,NULL,0,NULL,390,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(458,2278,585,235,1,2,'Bell',NULL,NULL,NULL,0,NULL,210,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(459,2279,585,235,1,2,'LUXVISAGE',NULL,NULL,NULL,0,NULL,280,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(465,2285,580,242,1,2,NULL,'Черный',NULL,NULL,0,NULL,18990,'RICCI',NULL,NULL,NULL,'Механическое',NULL,NULL),(466,2286,580,242,1,2,NULL,'Серый',NULL,NULL,0,NULL,16900,'Hansa',NULL,NULL,NULL,'Механическое',NULL,NULL),(467,2287,580,242,1,2,NULL,'Черный',NULL,NULL,0,NULL,12900,'Hansa',NULL,NULL,NULL,'Механическое',NULL,NULL),(468,2288,580,242,1,2,NULL,'Серый',NULL,NULL,0,NULL,25900,'Bosch',NULL,NULL,NULL,'Электронный',NULL,NULL),(469,2289,580,242,1,2,NULL,'Серый',NULL,NULL,0,NULL,27900,'Samsung',NULL,NULL,NULL,'Электронный',NULL,NULL),(470,2290,580,242,1,2,NULL,'Антрацит',NULL,NULL,0,NULL,145500,'Asko',NULL,NULL,NULL,'Сенсорный',NULL,NULL),(471,2291,580,242,1,2,NULL,'Бежевый',NULL,NULL,0,NULL,15900,'Darina',NULL,NULL,NULL,'Механическое',NULL,NULL),(472,2292,580,242,1,2,NULL,'Лед',NULL,NULL,0,NULL,60999,'Hotpoint-Ariston',NULL,NULL,NULL,'Поворотные переключатели',NULL,NULL),(473,2293,581,244,1,2,'LG',NULL,NULL,NULL,0,NULL,24900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(474,2294,581,244,1,2,'Bosch',NULL,NULL,NULL,0,NULL,22000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(475,2295,581,244,1,2,'Indesit',NULL,NULL,NULL,0,NULL,15499,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(476,2296,581,244,1,2,'Bosch',NULL,NULL,NULL,0,NULL,29999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(477,2297,581,244,1,2,'SAMSUNG',NULL,NULL,NULL,0,NULL,27999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(478,2298,581,244,1,2,'BEKO',NULL,NULL,NULL,0,NULL,12499,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(479,2299,581,244,1,2,'ZANUSSI',NULL,NULL,NULL,0,NULL,25999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(480,2300,581,244,1,2,'SHARP',NULL,NULL,NULL,0,NULL,184999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(481,2301,582,245,1,2,NULL,NULL,NULL,NULL,0,NULL,6999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(482,2302,582,245,1,2,NULL,NULL,NULL,NULL,0,NULL,2799,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(483,2303,582,245,1,2,NULL,NULL,NULL,NULL,0,NULL,19990,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(484,2304,582,245,1,2,NULL,NULL,NULL,NULL,0,NULL,3499,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(485,2305,582,245,1,2,NULL,NULL,NULL,NULL,0,NULL,4999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(486,2306,582,245,1,2,NULL,NULL,NULL,NULL,0,NULL,14999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(487,2307,582,245,1,2,NULL,NULL,NULL,NULL,0,NULL,8299,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(488,2308,582,245,1,2,NULL,NULL,NULL,NULL,0,NULL,4999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(489,2309,583,247,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',17999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(490,2310,583,247,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',37999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(491,2311,583,247,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',45699,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(492,2312,583,247,1,2,NULL,NULL,NULL,NULL,0,'Трехкамерный',89959,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(493,2313,583,247,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',36999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(494,2314,583,247,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',32899,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(495,2315,583,247,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',76999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(496,2316,583,247,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',24299,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(497,2317,592,248,1,2,NULL,NULL,NULL,NULL,0,NULL,2970,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(498,2318,592,248,1,2,NULL,NULL,NULL,NULL,0,NULL,2399,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(499,2319,592,248,1,2,NULL,NULL,NULL,NULL,0,NULL,3599,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(500,2320,592,248,1,2,NULL,NULL,NULL,NULL,0,NULL,2999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(501,2321,592,248,1,2,NULL,NULL,NULL,NULL,0,NULL,2999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(502,2322,592,248,1,2,NULL,NULL,NULL,NULL,0,NULL,3999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(503,2323,592,248,1,2,NULL,NULL,NULL,NULL,0,NULL,1999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(504,2324,592,248,1,2,NULL,NULL,NULL,NULL,0,NULL,3337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(505,2325,586,249,1,2,NULL,NULL,NULL,NULL,0,NULL,3780,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(506,2326,586,249,1,2,NULL,NULL,NULL,NULL,0,NULL,2100,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(507,2327,586,249,1,2,NULL,NULL,NULL,NULL,0,NULL,598,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(508,2328,586,249,1,2,NULL,NULL,NULL,NULL,0,NULL,1824,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(509,2329,586,249,1,2,NULL,NULL,NULL,NULL,0,NULL,708,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(510,2330,586,249,1,2,NULL,NULL,NULL,NULL,0,NULL,1297,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(511,2331,586,249,1,2,NULL,NULL,NULL,NULL,0,NULL,269,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(512,2332,586,249,1,2,NULL,NULL,NULL,NULL,0,NULL,1084,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(513,2333,587,249,1,2,NULL,NULL,NULL,NULL,0,NULL,132,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(514,2334,587,249,1,2,NULL,NULL,NULL,NULL,0,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(515,2335,587,249,1,2,NULL,NULL,NULL,NULL,0,NULL,588,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(516,2336,587,249,1,2,NULL,NULL,NULL,NULL,0,NULL,393,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(517,2337,587,249,1,2,NULL,NULL,NULL,NULL,0,NULL,998,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(518,2338,587,249,1,2,NULL,NULL,NULL,NULL,0,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(519,2339,587,249,1,2,NULL,NULL,NULL,NULL,0,NULL,393,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(520,2340,587,249,1,2,NULL,NULL,NULL,NULL,0,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(521,2341,588,251,1,2,NULL,NULL,NULL,NULL,0,NULL,2600,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(522,2342,588,251,1,2,NULL,NULL,NULL,NULL,0,NULL,3500,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(523,2343,588,251,1,2,NULL,NULL,NULL,NULL,0,NULL,5000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(524,2344,588,251,1,2,NULL,NULL,NULL,NULL,0,NULL,2465,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(525,2345,588,251,1,2,NULL,NULL,NULL,NULL,0,NULL,4562,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(526,2346,588,251,1,2,NULL,NULL,NULL,NULL,0,NULL,2580,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(527,2347,588,251,1,2,NULL,NULL,NULL,NULL,0,NULL,7500,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(528,2348,588,251,1,2,NULL,NULL,NULL,NULL,0,NULL,9000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(529,2349,557,253,1,2,'Yedoo',NULL,NULL,NULL,0,NULL,10000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(530,2350,557,253,1,2,'Trolo Raptor',NULL,NULL,NULL,0,NULL,12500,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(531,2351,557,253,1,2,'MICRO SPEED',NULL,NULL,NULL,0,NULL,7860,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(532,2352,557,253,1,2,'Micro Suspension',NULL,NULL,NULL,0,NULL,8999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(533,2353,557,253,1,2,'Razor',NULL,NULL,NULL,0,NULL,15000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(534,2354,557,253,1,2,'Weelz Rock',NULL,NULL,NULL,0,NULL,9800,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(535,2355,557,253,1,2,'HUDORA',NULL,NULL,NULL,0,NULL,17900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(536,2356,557,253,1,2,'Xootr',NULL,NULL,NULL,0,NULL,11800,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(560,2380,559,87,1,2,NULL,NULL,NULL,NULL,0,NULL,29200,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(561,2381,559,87,1,2,NULL,NULL,NULL,NULL,0,NULL,47900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(562,2382,559,87,1,2,NULL,NULL,NULL,NULL,0,NULL,18000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(563,2383,559,87,1,2,NULL,NULL,NULL,NULL,0,NULL,17900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(565,2385,564,87,1,2,NULL,NULL,NULL,NULL,0,NULL,18000,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cms3_filter_index_56_pages_539` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_filter_index_56_pages_850`
--

DROP TABLE IF EXISTS `cms3_filter_index_56_pages_850`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_filter_index_56_pages_850` (
  `id` int(10) unsigned NOT NULL,
  `obj_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `lang_id` int(10) unsigned NOT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  `brend` varchar(255) DEFAULT NULL,
  `cvet` varchar(255) DEFAULT NULL,
  `cvet_korpusa` varchar(255) DEFAULT NULL,
  `material_korpusa` varchar(255) DEFAULT NULL,
  `nalichie_budilnika` tinyint(1) DEFAULT '0',
  `novoe_pole` varchar(255) DEFAULT NULL,
  `price` double DEFAULT '0',
  `proizvoditel` varchar(255) DEFAULT NULL,
  `razmer` varchar(255) DEFAULT NULL,
  `sezon` varchar(255) DEFAULT NULL,
  `steklo` varchar(255) DEFAULT NULL,
  `tip` varchar(255) DEFAULT NULL,
  `tip_mehanizma` varchar(255) DEFAULT NULL,
  `zastezhka` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `obj_id` (`obj_id`),
  KEY `parent_id` (`parent_id`),
  KEY `type_id` (`type_id`),
  KEY `lang_id` (`lang_id`),
  KEY `domain_id` (`domain_id`),
  KEY `brend` (`brend`),
  KEY `cvet` (`cvet`),
  KEY `cvet_korpusa` (`cvet_korpusa`),
  KEY `material_korpusa` (`material_korpusa`),
  KEY `novoe_pole` (`novoe_pole`),
  KEY `price` (`price`),
  KEY `proizvoditel` (`proizvoditel`),
  KEY `razmer` (`razmer`),
  KEY `sezon` (`sezon`),
  KEY `steklo` (`steklo`),
  KEY `tip` (`tip`),
  KEY `tip_mehanizma` (`tip_mehanizma`),
  KEY `zastezhka` (`zastezhka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_filter_index_56_pages_850`
--

LOCK TABLES `cms3_filter_index_56_pages_850` WRITE;
/*!40000 ALTER TABLE `cms3_filter_index_56_pages_850` DISABLE KEYS */;
INSERT INTO `cms3_filter_index_56_pages_850` VALUES (623,3223,870,274,1,1,NULL,NULL,'Серый','Нержавеющая сталь',0,'Jacques Lemans',13900,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(624,3224,875,274,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',70550,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(625,3225,870,274,1,1,NULL,NULL,NULL,'Титан',0,'Hublot',49800,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(626,3226,870,274,1,1,NULL,NULL,'Черный','Нержавеющая сталь',0,'Suunto',14690,NULL,NULL,NULL,'Минеральное',NULL,'Финляндия',NULL),(627,3227,870,274,1,1,NULL,NULL,'Синий','Пластик',0,'Timex',8120,NULL,NULL,NULL,'Пластик',NULL,'США',NULL),(628,3228,875,274,1,1,NULL,NULL,'Белый','Нержавеющая сталь + PVD покрытие',1,'Victorinox Swiss Army',34700,NULL,NULL,NULL,'Сапфировое',NULL,'США',NULL),(629,3229,875,274,1,1,NULL,NULL,'Белый','Нержавеющая сталь',0,'Seiko',22900,NULL,NULL,NULL,'Сапфировое',NULL,'Япония',NULL),(630,3230,875,274,1,1,NULL,NULL,'Черный','Керамика',0,'Candino',19900,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(631,3231,875,274,1,1,NULL,NULL,'Золотой','Нержавеющая сталь',0,'Michael Kors',11500,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(632,3232,875,274,1,1,NULL,NULL,'Черный','Пластик',1,'Posio',3790,NULL,NULL,NULL,'Пластик',NULL,'Япония',NULL),(633,3233,875,274,1,1,NULL,NULL,'Серый','Нержавеющая сталь',0,'Jacques Lemans',13400,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(634,3234,870,274,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',58055,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(635,3235,870,274,1,1,NULL,NULL,NULL,'Титан',0,'Hublot',40500,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(636,3236,870,274,1,1,NULL,NULL,'Черный','Нержавеющая сталь',0,'Suunto',11690,NULL,NULL,NULL,'Минеральное',NULL,'Финляндия',NULL),(637,3237,870,274,1,1,NULL,NULL,'Синий','Пластик',0,'Timex',6190,NULL,NULL,NULL,'Пластик',NULL,'США',NULL),(638,3238,870,274,1,1,NULL,NULL,'Серый','Нержавеющая сталь',0,'Jacques Lemans',15000,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(639,3239,870,274,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',78550,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(640,3240,870,274,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',70550,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(710,3310,902,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,6999,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния+пуговицы'),(711,3311,902,299,1,1,NULL,'Зеленый',NULL,NULL,0,NULL,6499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния+пуговицы'),(712,3312,902,299,1,1,NULL,'Голубая',NULL,NULL,0,NULL,5499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния+пуговицы'),(713,3313,902,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,8499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(714,3314,902,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,5799,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(715,3315,902,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,2499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(716,3316,902,299,1,1,NULL,'Серый',NULL,NULL,0,NULL,2499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(717,3317,902,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,2699,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(718,3318,901,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,3040,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(719,3319,901,299,1,1,NULL,'Черный',NULL,NULL,0,NULL,2999,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(720,3320,901,299,1,1,NULL,'Розовый',NULL,NULL,0,NULL,3999,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(721,3321,901,299,1,1,NULL,'Голубая',NULL,NULL,0,NULL,3370,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(722,3322,901,299,1,1,NULL,'Коричневый',NULL,NULL,0,NULL,3445,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(723,3323,901,299,1,1,NULL,'Мультиколор',NULL,NULL,0,NULL,2970,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(724,3324,901,299,1,1,NULL,'Красный',NULL,NULL,0,NULL,3445,NULL,'48-50','Лето',NULL,NULL,NULL,'Молния+пуговицы'),(725,3325,901,299,1,1,NULL,'Желтый',NULL,NULL,0,NULL,827,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(726,3326,908,299,1,1,NULL,'Серый',NULL,NULL,0,NULL,7860,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(727,3327,908,299,1,1,NULL,'Коричневый',NULL,NULL,0,NULL,5033,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(728,3328,908,299,1,1,NULL,'Темно-синий, малиновый',NULL,NULL,0,NULL,5190,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния'),(729,3329,908,299,1,1,NULL,'Голубая',NULL,NULL,0,NULL,4999,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(730,3330,908,299,1,1,NULL,'Черный',NULL,NULL,0,NULL,5390,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(731,3331,908,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,3458,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(732,3332,908,299,1,1,NULL,'Серый',NULL,NULL,0,NULL,3467,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(733,3333,908,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,4890,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния'),(734,3334,909,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,2480,NULL,'54-56','Лето',NULL,NULL,NULL,'Пуговицы'),(735,3335,909,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,3500,NULL,'54-56','Лето',NULL,NULL,NULL,'Пуговицы'),(736,3336,909,299,1,1,NULL,'Серый',NULL,NULL,0,NULL,4700,NULL,'52-54','Лето',NULL,NULL,NULL,'Пуговицы'),(737,3337,909,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,3490,NULL,'48-50','Лето',NULL,NULL,NULL,'Пуговицы'),(738,3338,909,299,1,1,NULL,'Бежевый',NULL,NULL,0,NULL,3090,NULL,'50-52','Лето',NULL,NULL,NULL,'Пуговицы'),(739,3339,909,299,1,1,NULL,'Серый',NULL,NULL,0,NULL,3445,NULL,'48-50','Лето',NULL,NULL,NULL,'Пуговицы'),(740,3340,909,299,1,1,NULL,'Голубая',NULL,NULL,0,NULL,2970,NULL,'48-50','Лето',NULL,NULL,NULL,'Пуговицы'),(741,3341,909,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,1270,NULL,'54-56','Лето',NULL,NULL,NULL,'Пуговицы'),(745,3186,753,299,1,1,'BRUNO BANANI','Синий',NULL,NULL,0,NULL,3990,NULL,'52-54','Демисезон',NULL,NULL,NULL,NULL),(746,3346,753,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,5499,NULL,'50-52','Демисезон',NULL,NULL,NULL,NULL),(747,3347,753,299,1,1,'RHODE ISLAND','Синий',NULL,NULL,0,NULL,2350,NULL,'52-54','Демисезон',NULL,NULL,NULL,NULL),(748,3348,753,299,1,1,'BRUNO BANANI','Серый',NULL,NULL,0,NULL,3450,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(749,2588,753,299,1,1,NULL,'Черный',NULL,NULL,0,NULL,6590,NULL,'54-56','Демисезон',NULL,NULL,NULL,NULL),(750,3350,753,299,1,1,'Kekker style','Серый',NULL,NULL,0,NULL,8950,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(751,3351,753,299,1,1,'JOHN DEVIN','Серый',NULL,NULL,0,NULL,5690,NULL,'52-54','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(752,3352,753,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,4590,NULL,'54-56','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(754,3354,753,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,6790,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(755,3355,753,299,1,1,'Kekker style','Синий',NULL,NULL,0,NULL,2350,NULL,'54-56','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(756,3356,753,299,1,1,'Kekker style','Серый',NULL,NULL,0,NULL,4590,NULL,'54-56','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(757,3357,753,299,1,1,'Kekker style','Синий',NULL,NULL,0,NULL,8950,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(758,3358,896,300,1,1,'Bell',NULL,NULL,NULL,0,NULL,2300,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(759,3359,896,300,1,1,'Bell',NULL,NULL,NULL,0,NULL,149,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(760,3360,896,300,1,1,'Bell',NULL,NULL,NULL,0,NULL,310,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(761,3361,896,300,1,1,'L`Oreal',NULL,NULL,NULL,0,NULL,440,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(762,3362,896,300,1,1,'L`Oreal',NULL,NULL,NULL,0,NULL,430,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(763,3363,896,300,1,1,'Maybelline New York',NULL,NULL,NULL,0,NULL,220,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(764,3364,896,300,1,1,'Rimmel',NULL,NULL,NULL,0,NULL,300,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(765,3365,896,300,1,1,'Rimmel',NULL,NULL,NULL,0,NULL,390,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(766,3366,896,300,1,1,'NOUBA',NULL,NULL,NULL,0,NULL,1099,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(767,3367,896,300,1,1,'MAX FACTOR',NULL,NULL,NULL,0,NULL,350,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(768,3368,896,300,1,1,'Revlon',NULL,NULL,NULL,0,NULL,390,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(769,3369,896,300,1,1,'Bell',NULL,NULL,NULL,0,NULL,210,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(770,3370,896,300,1,1,'LUXVISAGE',NULL,NULL,NULL,0,NULL,280,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(776,3376,891,307,1,1,NULL,'Черный',NULL,NULL,0,NULL,18990,'RICCI',NULL,NULL,NULL,'Механическое',NULL,NULL),(777,3377,891,307,1,1,NULL,'Серый',NULL,NULL,0,NULL,16900,'Hansa',NULL,NULL,NULL,'Механическое',NULL,NULL),(778,3378,891,307,1,1,NULL,'Черный',NULL,NULL,0,NULL,12900,'Hansa',NULL,NULL,NULL,'Механическое',NULL,NULL),(779,3379,891,307,1,1,NULL,'Серый',NULL,NULL,0,NULL,25900,'Bosch',NULL,NULL,NULL,'Электронный',NULL,NULL),(780,3380,891,307,1,1,NULL,'Серый',NULL,NULL,0,NULL,27900,'Samsung',NULL,NULL,NULL,'Электронный',NULL,NULL),(781,3381,891,307,1,1,NULL,'Антрацит',NULL,NULL,0,NULL,145500,'Asko',NULL,NULL,NULL,'Сенсорный',NULL,NULL),(782,3382,891,307,1,1,NULL,'Бежевый',NULL,NULL,0,NULL,15900,'Darina',NULL,NULL,NULL,'Механическое',NULL,NULL),(783,3383,891,307,1,1,NULL,'Лед',NULL,NULL,0,NULL,60999,'Hotpoint-Ariston',NULL,NULL,NULL,'Поворотные переключатели',NULL,NULL),(784,3384,892,309,1,1,'LG',NULL,NULL,NULL,0,NULL,24900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(785,3385,892,309,1,1,'Bosch',NULL,NULL,NULL,0,NULL,22000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(786,3386,892,309,1,1,'Indesit',NULL,NULL,NULL,0,NULL,15499,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(787,3387,892,309,1,1,'Bosch',NULL,NULL,NULL,0,NULL,29999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(788,3388,892,309,1,1,'SAMSUNG',NULL,NULL,NULL,0,NULL,27999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(789,3389,892,309,1,1,'BEKO',NULL,NULL,NULL,0,NULL,12499,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(790,3390,892,309,1,1,'ZANUSSI',NULL,NULL,NULL,0,NULL,25999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(791,3391,892,309,1,1,'SHARP',NULL,NULL,NULL,0,NULL,184999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(792,3392,893,310,1,1,NULL,NULL,NULL,NULL,0,NULL,6999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(793,3393,893,310,1,1,NULL,NULL,NULL,NULL,0,NULL,2799,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(794,3394,893,310,1,1,NULL,NULL,NULL,NULL,0,NULL,19990,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(795,3395,893,310,1,1,NULL,NULL,NULL,NULL,0,NULL,3499,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(796,3396,893,310,1,1,NULL,NULL,NULL,NULL,0,NULL,4999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(797,3397,893,310,1,1,NULL,NULL,NULL,NULL,0,NULL,14999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(798,3398,893,310,1,1,NULL,NULL,NULL,NULL,0,NULL,8299,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(799,3399,893,310,1,1,NULL,NULL,NULL,NULL,0,NULL,4999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(800,3400,894,312,1,1,NULL,NULL,NULL,NULL,0,'Двухкамерный',17999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(801,3401,894,312,1,1,NULL,NULL,NULL,NULL,0,'Двухкамерный',37999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(802,3402,894,312,1,1,NULL,NULL,NULL,NULL,0,'Двухкамерный',45699,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(803,3403,894,312,1,1,NULL,NULL,NULL,NULL,0,'Трехкамерный',89959,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(804,3404,894,312,1,1,NULL,NULL,NULL,NULL,0,'Двухкамерный',36999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(805,3405,894,312,1,1,NULL,NULL,NULL,NULL,0,'Двухкамерный',32899,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(806,3406,894,312,1,1,NULL,NULL,NULL,NULL,0,'Двухкамерный',76999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(807,3407,894,312,1,1,NULL,NULL,NULL,NULL,0,'Двухкамерный',24299,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(808,3408,903,313,1,1,NULL,NULL,NULL,NULL,0,NULL,2970,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(809,3409,903,313,1,1,NULL,NULL,NULL,NULL,0,NULL,2399,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(810,3410,903,313,1,1,NULL,NULL,NULL,NULL,0,NULL,3599,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(811,3411,903,313,1,1,NULL,NULL,NULL,NULL,0,NULL,2999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(812,3412,903,313,1,1,NULL,NULL,NULL,NULL,0,NULL,2999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(813,3413,903,313,1,1,NULL,NULL,NULL,NULL,0,NULL,3999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(814,3414,903,313,1,1,NULL,NULL,NULL,NULL,0,NULL,1999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(815,3415,903,313,1,1,NULL,NULL,NULL,NULL,0,NULL,3337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(816,3416,897,314,1,1,NULL,NULL,NULL,NULL,0,NULL,3780,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(817,3417,897,314,1,1,NULL,NULL,NULL,NULL,0,NULL,2100,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(818,3418,897,314,1,1,NULL,NULL,NULL,NULL,0,NULL,598,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(819,3419,897,314,1,1,NULL,NULL,NULL,NULL,0,NULL,1824,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(820,3420,897,314,1,1,NULL,NULL,NULL,NULL,0,NULL,708,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(821,3421,897,314,1,1,NULL,NULL,NULL,NULL,0,NULL,1297,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(822,3422,897,314,1,1,NULL,NULL,NULL,NULL,0,NULL,269,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(823,3423,897,314,1,1,NULL,NULL,NULL,NULL,0,NULL,1084,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(824,3424,898,314,1,1,NULL,NULL,NULL,NULL,0,NULL,132,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(825,3425,898,314,1,1,NULL,NULL,NULL,NULL,0,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(826,3426,898,314,1,1,NULL,NULL,NULL,NULL,0,NULL,588,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(827,3427,898,314,1,1,NULL,NULL,NULL,NULL,0,NULL,393,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(828,3428,898,314,1,1,NULL,NULL,NULL,NULL,0,NULL,998,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(829,3429,898,314,1,1,NULL,NULL,NULL,NULL,0,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(830,3430,898,314,1,1,NULL,NULL,NULL,NULL,0,NULL,393,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(831,3431,898,314,1,1,NULL,NULL,NULL,NULL,0,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(832,3432,899,316,1,1,NULL,NULL,NULL,NULL,0,NULL,2600,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(833,3433,899,316,1,1,NULL,NULL,NULL,NULL,0,NULL,3500,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(834,3434,899,316,1,1,NULL,NULL,NULL,NULL,0,NULL,5000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(835,3435,899,316,1,1,NULL,NULL,NULL,NULL,0,NULL,2465,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(836,3436,899,316,1,1,NULL,NULL,NULL,NULL,0,NULL,4562,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(837,3437,899,316,1,1,NULL,NULL,NULL,NULL,0,NULL,2580,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(838,3438,899,316,1,1,NULL,NULL,NULL,NULL,0,NULL,7500,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(839,3439,899,316,1,1,NULL,NULL,NULL,NULL,0,NULL,9000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(840,3440,868,318,1,1,'Yedoo',NULL,NULL,NULL,0,NULL,10000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(841,3441,868,318,1,1,'Trolo Raptor',NULL,NULL,NULL,0,NULL,12500,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(842,3442,868,318,1,1,'MICRO SPEED',NULL,NULL,NULL,0,NULL,7860,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(843,3443,868,318,1,1,'Micro Suspension',NULL,NULL,NULL,0,NULL,8999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(844,3444,868,318,1,1,'Razor',NULL,NULL,NULL,0,NULL,15000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(845,3445,868,318,1,1,'Weelz Rock',NULL,NULL,NULL,0,NULL,9800,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(846,3446,868,318,1,1,'HUDORA',NULL,NULL,NULL,0,NULL,17900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(847,3447,868,318,1,1,'Xootr',NULL,NULL,NULL,0,NULL,11800,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(871,3471,870,87,1,1,NULL,NULL,NULL,NULL,0,NULL,29200,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(872,3472,870,87,1,1,NULL,NULL,NULL,NULL,0,NULL,47900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(873,3473,870,87,1,1,NULL,NULL,NULL,NULL,0,NULL,18000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(874,3474,870,87,1,1,NULL,NULL,NULL,NULL,0,NULL,17900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(876,3476,875,87,1,1,NULL,NULL,NULL,NULL,0,NULL,18000,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cms3_filter_index_56_pages_850` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_hierarchy`
--

DROP TABLE IF EXISTS `cms3_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_hierarchy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rel` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `lang_id` int(10) unsigned NOT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  `obj_id` int(10) unsigned NOT NULL,
  `ord` int(11) DEFAULT '0',
  `tpl_id` int(10) unsigned DEFAULT NULL,
  `alt_name` varchar(128) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `is_visible` tinyint(1) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `types rels_FK` (`type_id`),
  KEY `Prefix from lang_id_FK` (`lang_id`),
  KEY `Domain from domain_id relation_FK` (`domain_id`),
  KEY `hierarchy to plain object image_FK` (`obj_id`),
  KEY `Getting template data_FK` (`tpl_id`),
  KEY `is_default` (`is_default`),
  KEY `alt_name` (`alt_name`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_active` (`is_active`),
  KEY `ord` (`ord`),
  KEY `rel` (`rel`),
  KEY `updatetime` (`updatetime`),
  KEY `is_visible` (`is_visible`),
  CONSTRAINT `FK_Domain from domain_id relation` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Getting template data` FOREIGN KEY (`tpl_id`) REFERENCES `cms3_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Prefix from lang_id` FOREIGN KEY (`lang_id`) REFERENCES `cms3_langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_hierarchy to plain object image` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_types rels` FOREIGN KEY (`type_id`) REFERENCES `cms3_hierarchy_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_hierarchy`
--

LOCK TABLES `cms3_hierarchy` WRITE;
/*!40000 ALTER TABLE `cms3_hierarchy` DISABLE KEYS */;
INSERT INTO `cms3_hierarchy` VALUES (1,0,30,1,1,624,1,1,'glavnaya-stranica',1,0,1,1558626007,1),(2,0,30,1,1,636,3,1,'o-nas',1,0,1,1558013645,0),(3,0,42,1,1,637,6,1,'kontakty',1,0,1,1558529814,0),(4,0,1,1,1,638,5,1,'novosti',1,0,1,1558081679,0),(5,4,29,1,1,639,5,1,'kak-podobrat-podhodyawij-samosval',1,0,0,1558098946,0),(6,4,29,1,1,640,4,1,'obnovlenie-parka-spectehniki',1,0,0,1558098985,0),(7,4,29,1,1,641,3,1,'vesennee-tayanie-cen',1,0,0,1558099009,0),(8,4,29,1,1,642,2,1,'skidka-na-arendu-spectehniki-na-dlitelnyj-srok',1,0,0,1558099036,0),(9,0,55,1,1,643,2,1,'arenda-spectehniki',1,0,1,1558424540,0),(10,9,55,1,1,644,1,1,'arenda-buldozerov',1,0,1,1579615391,0),(11,9,55,1,1,645,2,1,'arenda-samosvalov',1,0,1,1579615392,0),(12,9,55,1,1,646,3,1,'arenda-avtokranov',1,0,1,1579615392,0),(13,9,55,1,1,647,4,1,'arenda-gidromolotov',1,0,1,1579615392,0),(14,9,55,1,1,648,5,1,'arenda-vibropogruzhateley',1,0,1,1579615393,0),(15,9,55,1,1,649,6,1,'arenda-ekskavatorov',1,0,1,1579615393,0),(16,9,55,1,1,650,7,1,'arenda-asfaltoukladchika',1,0,1,1579615393,0),(17,9,55,1,1,651,8,1,'arenda-vezdehoda',1,0,1,1579615410,0),(18,10,56,1,1,652,1,1,'arenda-buldozera-komatsu-d31e-20',1,0,0,1558699259,0),(19,10,56,1,1,653,2,1,'arenda-buldozera-komatsu-d21a-7',1,0,0,1558425670,0),(20,11,56,1,1,654,1,1,'samosval-18-20-kubov',1,0,0,1558699283,0),(21,11,56,1,1,655,2,1,'samosval-10-12-kubov',1,0,0,1558699260,0),(22,12,56,1,1,656,1,1,'avtokran-25-tonn-ks-55713',1,0,0,1558699301,0),(23,12,56,1,1,657,2,1,'avtokran-14-16-tonn-ks-35715',1,0,0,1558699263,0),(24,15,56,1,1,658,1,1,'ekskavator-planirovwik-uds-114',1,0,0,1558699274,0),(25,15,56,1,1,659,2,1,'ekskavator-gusenichnyj-s-planirovochnym-kovshom',1,0,0,1558699310,0),(26,16,56,1,1,660,1,1,'asfaltoukladchik-vogele-800',1,0,0,1558699267,0),(27,16,56,1,1,661,2,1,'asfaltoukladchik-trotuarnyj-vogele-1300-2',1,0,0,1558513478,0),(28,17,56,1,1,662,1,1,'samosval-vezdehod',1,0,0,1558699288,0),(29,0,46,1,1,663,4,1,'foto-tehniki',1,0,1,1558099747,0),(30,29,46,1,1,664,1,1,'gidromoloty',1,0,1,1579615513,0),(31,29,46,1,1,665,2,1,'vibropogruzhateli',1,0,1,1579615514,0),(32,30,47,1,1,666,1,1,'gidromolot-jcb',1,0,0,1558105777,0),(33,30,47,1,1,667,2,1,'gidromolot-cat',1,0,0,1558105854,0),(34,30,47,1,1,668,3,1,'gidromolot-doosan',1,0,0,1558105909,0),(35,31,47,1,1,669,1,1,'vibropogruzhatel-jcb',1,0,0,1558106042,0),(36,31,47,1,1,670,2,1,'vibropogruzhatel-volvo',1,0,0,1558106177,0),(37,31,47,1,1,671,3,1,'vibropogruzhatel-hitachi',1,0,0,1558106213,0),(87,13,56,1,1,722,1,1,'gidromolot-c3po',1,0,0,1558699530,0),(88,14,56,1,1,723,1,1,'vibropogruzhatel-r2d2',1,0,0,1558699559,0);
/*!40000 ALTER TABLE `cms3_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_hierarchy_relations`
--

DROP TABLE IF EXISTS `cms3_hierarchy_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_hierarchy_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rel_id` int(10) unsigned DEFAULT NULL,
  `child_id` int(10) unsigned DEFAULT NULL,
  `level` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `child_id` (`child_id`),
  KEY `level` (`level`),
  CONSTRAINT `Hierarchy relation by child_id` FOREIGN KEY (`child_id`) REFERENCES `cms3_hierarchy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Hierarchy relation by rel_id` FOREIGN KEY (`rel_id`) REFERENCES `cms3_hierarchy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=318 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_hierarchy_relations`
--

LOCK TABLES `cms3_hierarchy_relations` WRITE;
/*!40000 ALTER TABLE `cms3_hierarchy_relations` DISABLE KEYS */;
INSERT INTO `cms3_hierarchy_relations` VALUES (1,NULL,1,0),(2,NULL,2,0),(3,NULL,3,0),(21,NULL,4,0),(22,NULL,5,1),(23,4,5,1),(24,NULL,6,1),(25,4,6,1),(26,NULL,7,1),(27,4,7,1),(28,NULL,8,1),(29,4,8,1),(91,NULL,9,0),(92,NULL,10,1),(93,9,10,1),(94,NULL,18,2),(95,9,18,2),(97,10,18,2),(98,NULL,19,2),(99,9,19,2),(101,10,19,2),(102,NULL,11,1),(103,9,11,1),(104,NULL,20,2),(105,9,20,2),(107,11,20,2),(108,NULL,21,2),(109,9,21,2),(111,11,21,2),(112,NULL,12,1),(113,9,12,1),(114,NULL,22,2),(115,9,22,2),(117,12,22,2),(118,NULL,23,2),(119,9,23,2),(121,12,23,2),(122,NULL,13,1),(123,9,13,1),(124,NULL,14,1),(125,9,14,1),(126,NULL,15,1),(127,9,15,1),(128,NULL,24,2),(129,9,24,2),(131,15,24,2),(132,NULL,25,2),(133,9,25,2),(135,15,25,2),(136,NULL,16,1),(137,9,16,1),(138,NULL,26,2),(139,9,26,2),(141,16,26,2),(142,NULL,27,2),(143,9,27,2),(145,16,27,2),(146,NULL,17,1),(147,9,17,1),(148,NULL,28,2),(149,9,28,2),(151,17,28,2),(181,NULL,29,0),(182,NULL,30,1),(183,29,30,1),(184,NULL,32,2),(185,29,32,2),(187,30,32,2),(188,NULL,33,2),(189,29,33,2),(191,30,33,2),(192,NULL,34,2),(193,29,34,2),(195,30,34,2),(196,NULL,31,1),(197,29,31,1),(198,NULL,35,2),(199,29,35,2),(201,31,35,2),(202,NULL,36,2),(203,29,36,2),(205,31,36,2),(206,NULL,37,2),(207,29,37,2),(209,31,37,2),(310,NULL,87,2),(311,9,87,2),(313,13,87,2),(314,NULL,88,2),(315,9,88,2),(317,14,88,2);
/*!40000 ALTER TABLE `cms3_hierarchy_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_hierarchy_types`
--

DROP TABLE IF EXISTS `cms3_hierarchy_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_hierarchy_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(48) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ext` varchar(48) DEFAULT NULL,
  `hide_pages` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`ext`),
  KEY `title` (`title`),
  KEY `ext` (`ext`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_hierarchy_types`
--

LOCK TABLES `cms3_hierarchy_types` WRITE;
/*!40000 ALTER TABLE `cms3_hierarchy_types` DISABLE KEYS */;
INSERT INTO `cms3_hierarchy_types` VALUES (1,'news','i18n::hierarchy-type-news-rubric','rubric',0),(2,'emarket','i18n::hierarchy-type-emarket-currency','currency',0),(3,'emarket','i18n::hierarchy-type-emarket-discount_type','discount_type',0),(4,'emarket','i18n::hierarchy-type-emarket-discount_modificator_type','discount_modificator_type',0),(5,'emarket','i18n::hierarchy-type-emarket-discount_rule_type','discount_rule_type',0),(6,'social_networks','i18n::hierarchy-type-social_networks-networks','network',0),(7,'social_networks','i18n::hierarchy-type-social_networks-vkontakte','vkontakte',0),(8,'users','i18n::hierarchy-type-users-users','users',0),(9,'emarket','i18n::hierarchy-type-eshop-address','delivery_address',0),(10,'emarket','i18n::hierarchy-type-emarket-item_type','item_type',0),(11,'emarket','i18n::hierarchy-type-emarket-discount','discount',0),(12,'emarket','i18n::hierarchy-type-emarket-item_option','item_option',0),(13,'emarket','i18n::hierarchy-type-emarket-order_item','order_item',0),(14,'emarket','i18n::hierarchy-type-emarket-order_status','order_status',0),(15,'emarket','i18n::hierarchy-type-emarket-payment_type','payment_type',0),(16,'emarket','i18n::hierarchy-type-emarket-payment','payment',0),(17,'emarket','i18n::hierarchy-type-emarket-payment_status','order_payment_status',0),(18,'emarket','i18n::hierarchy-type-emarket-legal_person','legal_person',0),(19,'emarket','i18n::hierarchy-type-emarket-delivery_type','delivery_type',0),(20,'emarket','i18n::hierarchy-type-emarket-delivery','delivery',0),(21,'emarket','i18n::hierarchy-type-emarket-delivery_status','order_delivery_status',0),(22,'emarket','i18n::hierarchy-type-emarket-order','order',0),(23,'users','i18n::hierarchy-type-users-user','user',0),(24,'emarket','i18n::hierarchy-type-emarket-store','store',0),(25,'emarket','i18n::hierarchy-type-emarket-discount_modificator','discount_modificator',0),(26,'emarket','i18n::hierarchy-type-emarket-discount_rule','discount_rule',0),(27,'menu','i18n::hierarchy-type-menu-item_element','item_element',0),(28,'news','i18n::hierarchy-type-news-subject','subject',0),(29,'news','i18n::hierarchy-type-news-item','item',0),(30,'content','i18n::hierarchy-type-content-page','',0),(31,'content','i18n::hierarchy-type-content-ticket','ticket',0),(32,'blogs20','i18n::hierarchy-type-blogs-blog','blog',0),(33,'users','i18n::hierarchy-type-users-author','author',0),(34,'blogs20','i18n::hierarchy-type-blogs20-comment','comment',0),(35,'blogs20','i18n::hierarchy-type-blogs20-post','post',0),(36,'forum','i18n::hierarchy-type-forum-conf','conf',0),(37,'forum','i18n::hierarchy-type-forum-topic','topic',0),(38,'forum','i18n::hierarchy-type-forum-message','message',0),(39,'comments','i18n::hierarchy-type-comments-comment','comment',0),(40,'vote','i18n::hierarchy-type-vote-poll_item','poll_item',0),(41,'vote','i18n::hierarchy-type-vote-poll','poll',0),(42,'webforms','i18n::hierarchy-type-webforms-page','page',0),(43,'webforms','i18n::hierarchy-type-webforms-form','form',0),(44,'webforms','i18n::hierarchy-type-webforms-template','template',0),(45,'webforms','i18n::hierarchy-type-webforms-address','address',0),(46,'photoalbum','i18n::hierarchy-type-photoalbum-album','album',0),(47,'photoalbum','i18n::hierarchy-type-photoalbum-photo','photo',0),(48,'faq','i18n::hierarchy-type-faq-project','project',0),(49,'faq','i18n::hierarchy-type-faq-category','category',0),(50,'faq','i18n::hierarchy-type-faq-question','question',0),(51,'dispatches','i18n::hierarchy-type-dispatches-dispatch','dispatch',0),(52,'dispatches','i18n::hierarchy-type-dispatches-release','release',0),(53,'dispatches','i18n::hierarchy-type-dispatches-message','message',0),(54,'dispatches','i18n::hierarchy-type-dispatches-subscriber','subscriber',0),(55,'catalog','i18n::hierarchy-type-catalog-category','category',0),(56,'catalog','i18n::hierarchy-type-catalog-object','object',0),(57,'banners','i18n::hierarchy-type-banners-place','place',0),(58,'banners','i18n::hierarchy-type-banners-banner','banner',0),(59,'users','i18n::hierarchy-type-users-avatar','avatar',0),(60,'filemanager','i18n::hierarchy-type-filemanager-shared_file','shared_file',0),(61,'umiSettings','i18n::hierarchy-type-umiSettings-setting','settings',0),(62,'umiStub','i18n::hierarchy-type-umiStub-ip-blacklist','ip-blacklist',0),(63,'umiStub','i18n::hierarchy-type-umiStub-ip-whitelist','ip-whitelist',0),(64,'appointment','i18n::hierarchy-type-appointment-page','page',0),(65,'emarket','i18n::hierarchy-type-emarket-unregistered_customer','customer',0),(66,'seo','i18n::hierarchy-type-seo-robots-txt','robots-txt',0),(67,'exchange','i18n::hierarchy-type-exchange-data_exchange_export','export',0),(68,'exchange','i18n::hierarchy-type-exchange-data_exchange_import','import',0);
/*!40000 ALTER TABLE `cms3_hierarchy_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_apiship_orders`
--

DROP TABLE IF EXISTS `cms3_import_apiship_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_apiship_orders` (
  `external_id` int(10) unsigned NOT NULL,
  `internal_id` int(10) unsigned NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_apiship_orders_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_apiship_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_apiship_orders_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_apiship_orders`
--

LOCK TABLES `cms3_import_apiship_orders` WRITE;
/*!40000 ALTER TABLE `cms3_import_apiship_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_apiship_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_appointment_employee_schedule`
--

DROP TABLE IF EXISTS `cms3_import_appointment_employee_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_appointment_employee_schedule` (
  `external_id` int(11) NOT NULL,
  `internal_id` int(11) NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_appointment_employee_schedule_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_appointment_employee_schedule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_appointment_employee_schedule_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_appointment_employee_schedule`
--

LOCK TABLES `cms3_import_appointment_employee_schedule` WRITE;
/*!40000 ALTER TABLE `cms3_import_appointment_employee_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_appointment_employee_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_appointment_employees`
--

DROP TABLE IF EXISTS `cms3_import_appointment_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_appointment_employees` (
  `external_id` int(11) NOT NULL,
  `internal_id` int(11) NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_appointment_employees_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_appointment_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_appointment_employees_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_appointment_employees`
--

LOCK TABLES `cms3_import_appointment_employees` WRITE;
/*!40000 ALTER TABLE `cms3_import_appointment_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_appointment_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_appointment_employees_services`
--

DROP TABLE IF EXISTS `cms3_import_appointment_employees_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_appointment_employees_services` (
  `external_id` int(11) NOT NULL,
  `internal_id` int(11) NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_appointment_employees_services_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_appointment_employees_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_appointment_employees_services_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_appointment_employees_services`
--

LOCK TABLES `cms3_import_appointment_employees_services` WRITE;
/*!40000 ALTER TABLE `cms3_import_appointment_employees_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_appointment_employees_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_appointment_orders`
--

DROP TABLE IF EXISTS `cms3_import_appointment_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_appointment_orders` (
  `external_id` int(11) NOT NULL,
  `internal_id` int(11) NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_appointment_orders_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_appointment_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_appointment_orders_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_appointment_orders`
--

LOCK TABLES `cms3_import_appointment_orders` WRITE;
/*!40000 ALTER TABLE `cms3_import_appointment_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_appointment_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_appointment_service_groups`
--

DROP TABLE IF EXISTS `cms3_import_appointment_service_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_appointment_service_groups` (
  `external_id` int(11) NOT NULL,
  `internal_id` int(11) NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_appointment_service_groups_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_appointment_service_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_appointment_service_groups_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_appointment_service_groups`
--

LOCK TABLES `cms3_import_appointment_service_groups` WRITE;
/*!40000 ALTER TABLE `cms3_import_appointment_service_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_appointment_service_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_appointment_services`
--

DROP TABLE IF EXISTS `cms3_import_appointment_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_appointment_services` (
  `external_id` int(11) NOT NULL,
  `internal_id` int(11) NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_appointment_services_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_appointment_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_appointment_services_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_appointment_services`
--

LOCK TABLES `cms3_import_appointment_services` WRITE;
/*!40000 ALTER TABLE `cms3_import_appointment_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_appointment_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_domain_mirrors`
--

DROP TABLE IF EXISTS `cms3_import_domain_mirrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_domain_mirrors` (
  `source_id` int(10) unsigned NOT NULL,
  `old_id` varchar(255) NOT NULL,
  `new_id` int(10) unsigned NOT NULL,
  KEY `source_id` (`source_id`,`old_id`,`new_id`),
  KEY `old_id` (`old_id`,`new_id`),
  KEY `new_id` (`new_id`),
  CONSTRAINT `FK_DomainMirrorSourceId_To_Source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_NewId_To_DomainMirrorId` FOREIGN KEY (`new_id`) REFERENCES `cms3_domain_mirrows` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_domain_mirrors`
--

LOCK TABLES `cms3_import_domain_mirrors` WRITE;
/*!40000 ALTER TABLE `cms3_import_domain_mirrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_domain_mirrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_domains`
--

DROP TABLE IF EXISTS `cms3_import_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_domains` (
  `source_id` int(10) unsigned NOT NULL,
  `old_id` varchar(255) NOT NULL,
  `new_id` int(10) unsigned NOT NULL,
  KEY `source_id` (`source_id`,`old_id`,`new_id`),
  KEY `old_id` (`old_id`,`new_id`),
  KEY `new_id` (`new_id`),
  CONSTRAINT `FK_DomainSourceId_To_Source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_NewId_To_DomainId` FOREIGN KEY (`new_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_domains`
--

LOCK TABLES `cms3_import_domains` WRITE;
/*!40000 ALTER TABLE `cms3_import_domains` DISABLE KEYS */;
INSERT INTO `cms3_import_domains` VALUES (1,'1',1),(2,'1',1),(3,'1',1);
/*!40000 ALTER TABLE `cms3_import_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_fields`
--

DROP TABLE IF EXISTS `cms3_import_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_fields` (
  `source_id` int(10) unsigned NOT NULL,
  `field_name` varchar(64) NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `new_id` int(10) unsigned NOT NULL,
  KEY `source_id` (`source_id`),
  KEY `type_id` (`type_id`),
  KEY `field_name` (`field_name`),
  KEY `new_id` (`new_id`),
  CONSTRAINT `FK_FieldSourceId_To_Source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_NewFieldId_To_ObjectTypeId` FOREIGN KEY (`type_id`) REFERENCES `cms3_import_types` (`new_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_NewId_To_ObjectTypeFieldId` FOREIGN KEY (`new_id`) REFERENCES `cms3_object_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_fields`
--

LOCK TABLES `cms3_import_fields` WRITE;
/*!40000 ALTER TABLE `cms3_import_fields` DISABLE KEYS */;
INSERT INTO `cms3_import_fields` VALUES (1,'publish_status_id',2,1),(1,'title',3,2),(1,'h1',3,3),(1,'content',3,4),(1,'meta_descriptions',3,5),(1,'meta_keywords',3,6),(1,'tags',3,7),(1,'robots_deny',3,11),(1,'show_submenu',3,12),(1,'is_expanded',3,13),(1,'is_unindexed',3,14),(1,'rate_voters',3,15),(1,'rate_sum',3,16),(1,'expiration_date',3,17),(1,'notification_date',3,18),(1,'publish_comments',3,19),(1,'publish_status',3,20),(1,'locktime',3,21),(1,'lockuser',3,22),(1,'charset',6,23),(1,'title',7,2),(1,'h1',7,3),(1,'meta_keywords',7,6),(1,'meta_descriptions',7,5),(1,'tags',7,7),(1,'readme',7,24),(1,'robots_deny',7,11),(1,'show_submenu',7,12),(1,'is_expanded',7,13),(1,'is_unindexed',7,14),(1,'rate_voters',7,15),(1,'rate_sum',7,16),(1,'expiration_date',7,17),(1,'notification_date',7,18),(1,'publish_comments',7,19),(1,'publish_status',7,20),(1,'locktime',7,21),(1,'lockuser',7,22),(1,'rss_type',8,25),(1,'url',8,26),(1,'charset_id',8,27),(1,'news_rubric',8,28),(1,'quality_value',9,29),(1,'country_iso_code',10,30),(1,'identifier',14,31),(1,'identifier',15,31),(1,'number',16,32),(1,'number',17,32),(1,'codename',21,35),(1,'nominal',21,36),(1,'rate',21,37),(1,'prefix',21,38),(1,'suffix',21,39),(1,'platform_identificator',23,41),(1,'active',24,42),(1,'domain_id',24,43),(1,'token',24,44),(1,'platform',24,45),(1,'lname',25,46),(1,'fname',25,47),(1,'father_name',25,48),(1,'email',25,49),(1,'phone',25,50),(1,'yandex_id',27,51),(1,'payonline_id',27,52),(1,'robokassa_id',27,53),(1,'payanyway_id',27,54),(1,'sberbank_id',27,55),(1,'tax',27,56),(1,'yandex_id',28,57),(1,'robokassa_id',28,53),(1,'payanyway_id',28,58),(1,'payonline_id',28,59),(1,'sberbank_id',28,55),(1,'yandex_id',29,57),(1,'robokassa_id',29,53),(1,'payanyway_id',29,58),(1,'payonline_id',29,59),(1,'sberbank_id',29,55),(1,'codename',30,34),(1,'description',30,60),(1,'modificator_codename',31,61),(1,'modificator_type_id',31,62),(1,'modificator_discount_types',31,63),(1,'modificator_type_guid',31,64),(1,'modificator_type_id',32,65),(1,'rule_codename',33,66),(1,'rule_type_id',33,67),(1,'rule_discount_types',33,68),(1,'rule_type_guid',33,69),(1,'rule_type_id',34,70),(1,'sid',35,71),(1,'sid',36,72),(1,'social_id',37,73),(1,'template_id',37,74),(1,'domain_id',37,75),(1,'nazvanie_sajta',38,76),(1,'is_iframe_enabled',38,77),(1,'iframe_pages',38,78),(1,'social_id',38,73),(1,'template_id',38,74),(1,'domain_id',38,75),(1,'nazvanie',39,79),(1,'country',40,80),(1,'index',40,81),(1,'region',40,82),(1,'city',40,83),(1,'street',40,84),(1,'house',40,85),(1,'flat',40,86),(1,'class_name',41,87),(1,'discount_type_id',42,88),(1,'discount_modificator_id',42,89),(1,'discount_rules_id',42,90),(1,'is_active',42,91),(1,'description',42,92),(1,'item_amount',44,93),(1,'item_price',44,94),(1,'item_actual_price',44,95),(1,'item_total_original_price',44,96),(1,'item_total_price',44,97),(1,'item_type_id',44,98),(1,'item_link',44,99),(1,'item_discount_id',44,100),(1,'item_discount_value',44,101),(1,'weight',44,102),(1,'width',44,103),(1,'height',44,104),(1,'length',44,105),(1,'tax_rate_id',44,106),(1,'payment_mode',44,107),(1,'payment_subject',44,108),(1,'options',44,109),(1,'trade_offer',44,110),(1,'codename',45,40),(1,'priority',45,111),(1,'class_name',46,112),(1,'payment_type_id',46,113),(1,'payment_type_guid',46,114),(1,'payment_type_id',47,115),(1,'disabled',47,116),(1,'domain_id_list',47,117),(1,'codename',48,40),(1,'priority',48,111),(1,'contact_person',49,118),(1,'phone_number',49,119),(1,'fax',49,120),(1,'email',49,49),(1,'name',49,121),(1,'legal_address',49,122),(1,'defacto_address',49,123),(1,'post_address',49,124),(1,'inn',49,125),(1,'account',49,126),(1,'bank',49,127),(1,'bank_account',49,128),(1,'bik',49,129),(1,'ogrn',49,130),(1,'kpp',49,131),(1,'class_name',50,132),(1,'delivery_type_id',50,133),(1,'delivery_type_guid',50,134),(1,'description',51,135),(1,'delivery_type_id',51,136),(1,'price',51,137),(1,'tax_rate_id',51,138),(1,'disabled',51,139),(1,'domain_id_list',51,140),(1,'payment_mode',51,141),(1,'payment_subject',51,142),(1,'disabled_types_of_payment',51,143),(1,'codename',52,40),(1,'priority',52,111),(1,'order_items',53,144),(1,'number',53,145),(1,'social_order_id',53,146),(1,'customer_id',53,148),(1,'domain_id',53,149),(1,'manager_id',53,150),(1,'status_id',53,151),(1,'total_original_price',53,152),(1,'total_price',53,153),(1,'total_amount',53,154),(1,'status_change_date',53,155),(1,'order_date',53,156),(1,'order_discount_value',53,157),(1,'is_reserved',53,158),(1,'service_info',53,159),(1,'http_referer',53,167),(1,'http_target',53,168),(1,'source_domain',53,169),(1,'utm_medium',53,170),(1,'utm_term',53,171),(1,'utm_campaign',53,172),(1,'utm_content',53,173),(1,'order_create_date',53,174),(1,'payment_id',53,175),(1,'payment_name',53,176),(1,'payment_status_id',53,177),(1,'payment_date',53,178),(1,'payment_document_num',53,179),(1,'legal_person',53,180),(1,'delivery_id',53,181),(1,'delivery_name',53,182),(1,'delivery_status_id',53,183),(1,'delivery_address',53,184),(1,'delivery_date',53,185),(1,'pickup_date',53,186),(1,'delivery_provider',53,187),(1,'delivery_tariff',53,188),(1,'delivery_type',53,189),(1,'pickup_type',53,190),(1,'delivery_price',53,191),(1,'delivery_point_in',53,192),(1,'delivery_point_out',53,193),(1,'total_weight',53,194),(1,'total_width',53,195),(1,'total_height',53,196),(1,'total_length',53,197),(1,'delivery_allow_date',53,198),(1,'order_discount_id',53,199),(1,'bonus',53,200),(1,'need_export',53,201),(1,'purchaser_one_click',53,202),(1,'login',54,203),(1,'password',54,204),(1,'groups',54,205),(1,'e-mail',54,206),(1,'activate_code',54,207),(1,'loginza',54,208),(1,'is_activated',54,209),(1,'last_request_time',54,210),(1,'subscribed_pages',54,211),(1,'rated_pages',54,212),(1,'is_online',54,213),(1,'messages_count',54,214),(1,'orders_refs',54,215),(1,'delivery_addresses',54,216),(1,'user_dock',54,217),(1,'preffered_currency',54,218),(1,'user_settings_data',54,219),(1,'last_order',54,220),(1,'bonus',54,221),(1,'legal_persons',54,222),(1,'spent_bonus',54,223),(1,'filemanager_directory',54,224),(1,'appended_file_extensions',54,225),(1,'register_date',54,226),(1,'tickets_color',54,227),(1,'favorite_domain_list',54,228),(1,'lname',54,229),(1,'fname',54,230),(1,'father_name',54,231),(1,'phone',54,232),(1,'referer',54,233),(1,'target',54,234),(1,'primary',55,235),(1,'proc',56,236),(1,'modificator_type_id',56,65),(1,'rule_type_id',57,70),(1,'users',57,237),(1,'menu_id',58,238),(1,'menuhierarchy',58,239),(1,'title',60,2),(1,'h1',60,3),(1,'meta_keywords',60,6),(1,'meta_descriptions',60,5),(1,'tags',60,7),(1,'anons',60,240),(1,'content',60,4),(1,'source',60,241),(1,'source_url',60,242),(1,'publish_time',60,243),(1,'begin_time',60,244),(1,'end_time',60,245),(1,'robots_deny',60,11),(1,'show_submenu',60,12),(1,'is_expanded',60,13),(1,'is_unindexed',60,14),(1,'anons_pic',60,246),(1,'publish_pic',60,247),(1,'subjects',60,248),(1,'rate_voters',60,15),(1,'rate_sum',60,16),(1,'expiration_date',60,17),(1,'notification_date',60,18),(1,'publish_comments',60,19),(1,'publish_status',60,20),(1,'locktime',60,21),(1,'lockuser',60,22),(1,'title',61,2),(1,'h1',61,3),(1,'meta_keywords',61,6),(1,'meta_descriptions',61,5),(1,'tags',61,7),(1,'content',61,4),(1,'robots_deny',61,11),(1,'show_submenu',61,12),(1,'is_expanded',61,13),(1,'is_unindexed',61,14),(1,'rate_voters',61,15),(1,'rate_sum',61,16),(1,'expiration_date',61,17),(1,'notification_date',61,18),(1,'publish_comments',61,19),(1,'publish_status',61,20),(1,'locktime',61,21),(1,'lockuser',61,22),(1,'user_id',62,249),(1,'message',62,250),(1,'x',62,251),(1,'y',62,252),(1,'width',62,253),(1,'height',62,254),(1,'create_time',62,255),(1,'url',62,256),(1,'title',63,2),(1,'h1',63,3),(1,'description',63,257),(1,'meta_descriptions',63,5),(1,'meta_keywords',63,6),(1,'tags',63,7),(1,'friendlist',63,258),(1,'robots_deny',63,11),(1,'show_submenu',63,12),(1,'is_expanded',63,13),(1,'is_unindexed',63,14),(1,'rate_voters',63,15),(1,'rate_sum',63,16),(1,'is_registrated',64,259),(1,'user_id',64,260),(1,'nickname',64,261),(1,'email',64,262),(1,'ip',64,263),(1,'content',65,4),(1,'author_id',65,264),(1,'publish_time',65,243),(1,'rate_voters',65,15),(1,'rate_sum',65,16),(1,'is_spam',65,265),(1,'title',66,2),(1,'h1',66,3),(1,'content',66,4),(1,'meta_descriptions',66,5),(1,'meta_keywords',66,6),(1,'tags',66,7),(1,'publish_time',66,243),(1,'robots_deny',66,11),(1,'show_submenu',66,12),(1,'is_expanded',66,13),(1,'is_unindexed',66,14),(1,'rate_voters',66,15),(1,'rate_sum',66,16),(1,'expiration_date',66,17),(1,'notification_date',66,18),(1,'publish_comments',66,19),(1,'publish_status',66,20),(1,'locktime',66,21),(1,'lockuser',66,22),(1,'only_for_friends',66,266),(1,'is_spam',66,265),(1,'title',67,2),(1,'h1',67,3),(1,'meta_keywords',67,6),(1,'meta_descriptions',67,5),(1,'tags',67,7),(1,'descr',67,267),(1,'topics_count',67,268),(1,'messages_count',67,269),(1,'last_message',67,270),(1,'robots_deny',67,11),(1,'show_submenu',67,12),(1,'is_expanded',67,13),(1,'is_unindexed',67,14),(1,'rate_voters',67,15),(1,'rate_sum',67,16),(1,'expiration_date',67,17),(1,'notification_date',67,18),(1,'publish_comments',67,19),(1,'publish_status',67,20),(1,'locktime',67,21),(1,'lockuser',67,22),(1,'title',68,2),(1,'h1',68,3),(1,'meta_keywords',68,6),(1,'meta_descriptions',68,5),(1,'tags',68,7),(1,'messages_count',68,269),(1,'last_message',68,270),(1,'robots_deny',68,11),(1,'show_submenu',68,12),(1,'is_expanded',68,13),(1,'is_unindexed',68,14),(1,'publish_time',68,243),(1,'author_id',68,264),(1,'last_post_time',68,271),(1,'rate_voters',68,15),(1,'rate_sum',68,16),(1,'expiration_date',68,17),(1,'notification_date',68,18),(1,'publish_comments',68,19),(1,'publish_status',68,20),(1,'locktime',68,21),(1,'lockuser',68,22),(1,'title',69,2),(1,'h1',69,3),(1,'meta_keywords',69,6),(1,'meta_descriptions',69,5),(1,'tags',69,7),(1,'robots_deny',69,11),(1,'show_submenu',69,12),(1,'is_expanded',69,13),(1,'is_unindexed',69,14),(1,'message',69,272),(1,'author_id',69,264),(1,'rate_voters',69,15),(1,'rate_sum',69,16),(1,'expiration_date',69,17),(1,'notification_date',69,18),(1,'publish_comments',69,19),(1,'publish_status',69,20),(1,'locktime',69,21),(1,'lockuser',69,22),(1,'title',70,2),(1,'h1',70,3),(1,'meta_keywords',70,6),(1,'meta_descriptions',70,5),(1,'tags',70,7),(1,'robots_deny',70,11),(1,'show_submenu',70,12),(1,'is_expanded',70,13),(1,'is_unindexed',70,14),(1,'message',70,272),(1,'publish_time',70,243),(1,'author_id',70,264),(1,'rate_voters',70,15),(1,'rate_sum',70,16),(1,'expiration_date',70,17),(1,'notification_date',70,18),(1,'publish_comments',70,19),(1,'publish_status',70,20),(1,'locktime',70,21),(1,'lockuser',70,22),(1,'is_spam',70,265),(1,'count',71,273),(1,'poll_rel',71,274),(1,'title',72,2),(1,'h1',72,3),(1,'meta_keywords',72,6),(1,'meta_descriptions',72,5),(1,'tags',72,7),(1,'robots_deny',72,11),(1,'show_submenu',72,12),(1,'is_expanded',72,13),(1,'is_unindexed',72,14),(1,'is_closed',72,275),(1,'question',72,276),(1,'publish_time',72,243),(1,'answers',72,277),(1,'total_count',72,278),(1,'rate_voters',72,15),(1,'rate_sum',72,16),(1,'expiration_date',72,17),(1,'notification_date',72,18),(1,'publish_comments',72,19),(1,'publish_status',72,20),(1,'locktime',72,21),(1,'lockuser',72,22),(1,'title',73,2),(1,'h1',73,3),(1,'content',73,4),(1,'meta_descriptions',73,5),(1,'meta_keywords',73,6),(1,'tags',73,7),(1,'robots_deny',73,11),(1,'show_submenu',73,12),(1,'is_expanded',73,13),(1,'is_unindexed',73,14),(1,'rate_voters',73,15),(1,'rate_sum',73,16),(1,'expiration_date',73,17),(1,'notification_date',73,18),(1,'publish_comments',73,19),(1,'publish_status',73,20),(1,'locktime',73,21),(1,'lockuser',73,22),(1,'form_id',73,279),(1,'destination_address',74,280),(1,'sender_ip',74,281),(1,'sending_time',74,282),(1,'wf_message',74,283),(1,'from_email_template',75,284),(1,'from_template',75,285),(1,'subject_template',75,286),(1,'master_template',75,287),(1,'autoreply_from_email_template',75,288),(1,'autoreply_from_template',75,289),(1,'autoreply_subject_template',75,290),(1,'autoreply_email_recipient',75,291),(1,'autoreply_template',75,292),(1,'posted_message',75,293),(1,'form_id',75,294),(1,'address_description',76,295),(1,'address_list',76,296),(1,'form_id',76,297),(1,'title',77,2),(1,'h1',77,3),(1,'meta_descriptions',77,5),(1,'meta_keywords',77,6),(1,'tags',77,7),(1,'robots_deny',77,11),(1,'show_submenu',77,12),(1,'is_expanded',77,13),(1,'is_unindexed',77,14),(1,'descr',77,267),(1,'create_time',77,298),(1,'user_id',77,299),(1,'rate_voters',77,15),(1,'rate_sum',77,16),(1,'expiration_date',77,17),(1,'notification_date',77,18),(1,'publish_comments',77,19),(1,'publish_status',77,20),(1,'locktime',77,21),(1,'lockuser',77,22),(1,'title',78,2),(1,'h1',78,3),(1,'meta_descriptions',78,5),(1,'meta_keywords',78,6),(1,'tags',78,7),(1,'robots_deny',78,11),(1,'show_submenu',78,12),(1,'is_expanded',78,13),(1,'is_unindexed',78,14),(1,'photo',78,300),(1,'descr',78,267),(1,'create_time',78,298),(1,'user_id',78,299),(1,'rate_voters',78,15),(1,'rate_sum',78,16),(1,'expiration_date',78,17),(1,'notification_date',78,18),(1,'publish_comments',78,19),(1,'publish_status',78,20),(1,'locktime',78,21),(1,'lockuser',78,22),(1,'title',79,2),(1,'h1',79,3),(1,'content',79,4),(1,'meta_descriptions',79,5),(1,'meta_keywords',79,6),(1,'tags',79,7),(1,'robots_deny',79,11),(1,'show_submenu',79,12),(1,'is_expanded',79,13),(1,'is_unindexed',79,14),(1,'rate_voters',79,15),(1,'rate_sum',79,16),(1,'expiration_date',79,17),(1,'notification_date',79,18),(1,'publish_comments',79,19),(1,'publish_status',79,20),(1,'locktime',79,21),(1,'lockuser',79,22),(1,'title',80,2),(1,'h1',80,3),(1,'content',80,4),(1,'meta_descriptions',80,5),(1,'meta_keywords',80,6),(1,'tags',80,7),(1,'robots_deny',80,11),(1,'show_submenu',80,12),(1,'is_expanded',80,13),(1,'is_unindexed',80,14),(1,'rate_voters',80,15),(1,'rate_sum',80,16),(1,'expiration_date',80,17),(1,'notification_date',80,18),(1,'publish_comments',80,19),(1,'publish_status',80,20),(1,'locktime',80,21),(1,'lockuser',80,22),(1,'title',81,2),(1,'h1',81,3),(1,'meta_descriptions',81,5),(1,'meta_keywords',81,6),(1,'tags',81,7),(1,'question',81,276),(1,'answer',81,301),(1,'author_id',81,264),(1,'publish_time',81,243),(1,'robots_deny',81,11),(1,'show_submenu',81,12),(1,'is_expanded',81,13),(1,'is_unindexed',81,14),(1,'expiration_date',81,17),(1,'notification_date',81,18),(1,'publish_comments',81,19),(1,'publish_status',81,20),(1,'locktime',81,21),(1,'lockuser',81,22),(1,'is_spam',81,265),(1,'disp_last_release',82,302),(1,'disp_description',82,303),(1,'forced_subscribers',82,304),(1,'news_relation',82,305),(1,'is_active',82,306),(1,'load_from_forum',82,307),(1,'days',82,308),(1,'hours',82,309),(1,'status',83,310),(1,'date',83,311),(1,'disp_reference',83,312),(1,'header',84,313),(1,'body',84,314),(1,'release_reference',84,315),(1,'attach_file',84,316),(1,'msg_date',84,317),(1,'short_body',84,318),(1,'new_relation',84,319),(1,'lname',85,320),(1,'fname',85,321),(1,'father_name',85,322),(1,'gender',85,323),(1,'uid',85,324),(1,'subscriber_dispatches',85,325),(1,'sent_release_list',85,326),(1,'subscribe_date',85,327),(1,'title',86,2),(1,'h1',86,3),(1,'meta_keywords',86,6),(1,'meta_descriptions',86,5),(1,'tags',86,7),(1,'robots_deny',86,11),(1,'show_submenu',86,12),(1,'is_expanded',86,13),(1,'is_unindexed',86,14),(1,'descr',86,267),(1,'rate_voters',86,15),(1,'rate_sum',86,16),(1,'expiration_date',86,17),(1,'notification_date',86,18),(1,'publish_comments',86,19),(1,'publish_status',86,20),(1,'locktime',86,21),(1,'lockuser',86,22),(1,'index_source',86,329),(1,'index_state',86,330),(1,'index_date',86,331),(1,'index_choose',86,332),(1,'index_level',86,333),(1,'title',87,2),(1,'h1',87,3),(1,'meta_keywords',87,6),(1,'meta_descriptions',87,5),(1,'tags',87,7),(1,'date_create_object',87,334),(1,'robots_deny',87,11),(1,'is_unindexed',87,14),(1,'tax_rate_id',87,335),(1,'price',87,336),(1,'payment_mode',87,337),(1,'payment_subject',87,338),(1,'stores_state',87,339),(1,'reserved',87,340),(1,'common_quantity',87,341),(1,'trade_offer_image',87,342),(1,'trade_offer_list',87,343),(1,'rate_voters',87,15),(1,'rate_sum',87,16),(1,'expiration_date',87,17),(1,'notification_date',87,18),(1,'publish_comments',87,19),(1,'publish_status',87,20),(1,'locktime',87,21),(1,'lockuser',87,22),(1,'id',88,344),(1,'descr',88,345),(1,'is_show_rand_banner',88,346),(1,'is_active',89,347),(1,'tags',89,348),(1,'url',89,349),(1,'open_in_new_window',89,350),(1,'views_count',89,351),(1,'clicks_count',89,352),(1,'max_views',89,353),(1,'show_start_date',89,354),(1,'show_till_date',89,355),(1,'user_tags',89,356),(1,'view_pages',89,357),(1,'place',89,358),(1,'not_view_pages',89,359),(1,'time_targeting_by_month_days',89,360),(1,'time_targeting_by_month',89,361),(1,'time_targeting_by_week_days',89,362),(1,'time_targeting_by_hours',89,363),(1,'time_targeting_is_active',89,364),(1,'city_targeting_city',89,365),(1,'city_targeting_is_active',89,366),(1,'priority',89,367),(1,'is_active',90,347),(1,'tags',90,348),(1,'image',90,368),(1,'width',90,369),(1,'height',90,370),(1,'alt',90,371),(1,'url',90,349),(1,'open_in_new_window',90,350),(1,'views_count',90,351),(1,'clicks_count',90,352),(1,'max_views',90,353),(1,'show_start_date',90,354),(1,'show_till_date',90,355),(1,'user_tags',90,356),(1,'view_pages',90,357),(1,'place',90,358),(1,'not_view_pages',90,359),(1,'time_targeting_by_month_days',90,360),(1,'time_targeting_by_month',90,361),(1,'time_targeting_by_week_days',90,362),(1,'time_targeting_by_hours',90,363),(1,'time_targeting_is_active',90,364),(1,'city_targeting_city',90,365),(1,'city_targeting_is_active',90,366),(1,'priority',90,367),(1,'is_active',91,347),(1,'tags',91,348),(1,'swf',91,372),(1,'width',91,369),(1,'height',91,370),(1,'swf_quality',91,373),(1,'url',91,349),(1,'open_in_new_window',91,350),(1,'views_count',91,351),(1,'clicks_count',91,352),(1,'max_views',91,353),(1,'show_start_date',91,354),(1,'show_till_date',91,355),(1,'user_tags',91,356),(1,'view_pages',91,357),(1,'place',91,358),(1,'not_view_pages',91,359),(1,'time_targeting_by_month_days',91,360),(1,'time_targeting_by_month',91,361),(1,'time_targeting_by_week_days',91,362),(1,'time_targeting_by_hours',91,363),(1,'time_targeting_is_active',91,364),(1,'city_targeting_city',91,365),(1,'city_targeting_is_active',91,366),(1,'priority',91,367),(1,'is_active',92,347),(1,'tags',92,348),(1,'html_content',92,374),(1,'url',92,349),(1,'open_in_new_window',92,350),(1,'views_count',92,351),(1,'clicks_count',92,352),(1,'max_views',92,353),(1,'show_start_date',92,354),(1,'show_till_date',92,355),(1,'user_tags',92,356),(1,'view_pages',92,357),(1,'place',92,358),(1,'not_view_pages',92,359),(1,'time_targeting_by_month_days',92,360),(1,'time_targeting_by_month',92,361),(1,'time_targeting_by_week_days',92,362),(1,'time_targeting_by_hours',92,363),(1,'time_targeting_is_active',92,364),(1,'city_targeting_city',92,365),(1,'city_targeting_is_active',92,366),(1,'priority',92,367),(1,'picture',93,375),(1,'is_hidden',93,376),(1,'title',94,2),(1,'h1',94,3),(1,'meta_descriptions',94,5),(1,'meta_keywords',94,6),(1,'tags',94,7),(1,'content',94,4),(1,'robots_deny',94,11),(1,'show_submenu',94,12),(1,'is_expanded',94,13),(1,'is_unindexed',94,14),(1,'fs_file',94,377),(1,'downloads_counter',94,378),(1,'rate_voters',94,15),(1,'rate_sum',94,16),(1,'expiration_date',94,17),(1,'notification_date',94,18),(1,'publish_comments',94,19),(1,'publish_status',94,20),(1,'locktime',94,21),(1,'lockuser',94,22),(1,'custom_id',95,379),(1,'lang_id',95,380),(1,'domain_id',95,381),(1,'domain_id',96,43),(1,'domain_id',97,43),(1,'title',98,2),(1,'h1',98,3),(1,'content',98,4),(1,'meta_descriptions',98,5),(1,'meta_keywords',98,6),(1,'tags',98,7),(1,'robots_deny',98,11),(1,'show_submenu',98,12),(1,'is_expanded',98,13),(1,'is_unindexed',98,14),(1,'rate_voters',98,15),(1,'rate_sum',98,16),(1,'expiration_date',98,17),(1,'notification_date',98,18),(1,'publish_comments',98,19),(1,'publish_status',98,20),(1,'locktime',98,21),(1,'lockuser',98,22),(1,'appoint_service_choice_title',98,382),(1,'appoint_hint_step_text',98,383),(1,'appoint_personal_step_title',98,384),(1,'appoint_personal_choice_title',98,385),(1,'appoint_dont_care_button',98,386),(1,'appoint_dont_care_hint',98,387),(1,'appoint_date_step_title',98,388),(1,'appoint_date_choice_title',98,389),(1,'appoint_confirm_step_title',98,390),(1,'appoint_book_time_button',98,391),(1,'appoint_book_time_hint',98,392),(2,'title',3,2),(2,'h1',3,3),(2,'content',3,4),(2,'meta_descriptions',3,5),(2,'meta_keywords',3,6),(2,'tags',3,7),(2,'robots_deny',3,11),(2,'show_submenu',3,12),(2,'is_expanded',3,13),(2,'is_unindexed',3,14),(2,'rate_voters',3,15),(2,'rate_sum',3,16),(2,'locktime',3,21),(2,'lockuser',3,22),(2,'title',60,2),(2,'h1',60,3),(2,'meta_keywords',60,6),(2,'meta_descriptions',60,5),(2,'tags',60,7),(2,'anons',60,240),(2,'content',60,4),(2,'source',60,241),(2,'source_url',60,242),(2,'publish_time',60,243),(2,'begin_time',60,244),(2,'end_time',60,245),(2,'robots_deny',60,11),(2,'show_submenu',60,12),(2,'is_expanded',60,13),(2,'is_unindexed',60,14),(2,'anons_pic',60,246),(2,'publish_pic',60,247),(2,'subjects',60,248),(2,'rate_voters',60,15),(2,'rate_sum',60,16),(2,'locktime',60,21),(2,'lockuser',60,22),(1,'order_comment',53,436),(1,'fname',104,437),(1,'lname',104,438),(1,'father_name',104,439),(1,'preffered_currency',104,440),(1,'last_order',104,441),(1,'bonus',104,442),(1,'spent_bonus',104,443),(1,'email',104,444),(1,'phone',104,445),(1,'ip',104,446),(1,'delivery_addresses',104,447),(1,'legal_persons',104,448),(1,'modificator_type_id',105,65),(1,'size',105,449),(1,'rule_type_id',106,70),(1,'catalog_items',106,450),(1,'rule_type_id',107,70),(1,'start_date',107,451),(1,'end_date',107,452),(1,'rule_type_id',108,70),(1,'minimum',108,453),(1,'maximum',108,454),(1,'rule_type_id',109,70),(1,'minimal',109,455),(1,'maximum',109,456),(1,'rule_type_id',110,70),(1,'user_groups',110,457),(1,'rule_type_id',111,70),(1,'related_items',111,458),(1,'description',112,135),(1,'delivery_type_id',112,136),(1,'price',112,137),(1,'tax_rate_id',112,138),(1,'disabled',112,139),(1,'domain_id_list',112,140),(1,'payment_mode',112,141),(1,'payment_subject',112,142),(1,'disabled_types_of_payment',112,143),(1,'description',113,135),(1,'delivery_type_id',113,136),(1,'tax_rate_id',113,138),(1,'disabled',113,139),(1,'domain_id_list',113,140),(1,'payment_mode',113,141),(1,'payment_subject',113,142),(1,'disabled_types_of_payment',113,143),(1,'order_min_price',113,459),(1,'price',113,137),(1,'description',114,135),(1,'delivery_type_id',114,136),(1,'tax_rate_id',114,138),(1,'disabled',114,139),(1,'domain_id_list',114,140),(1,'payment_mode',114,141),(1,'payment_subject',114,142),(1,'disabled_types_of_payment',114,143),(1,'viewpost',114,460),(1,'zip_code',114,461),(1,'description',115,135),(1,'delivery_type_id',115,136),(1,'tax_rate_id',115,138),(1,'payment_mode',115,141),(1,'payment_subject',115,142),(1,'disabled_types_of_payment',115,143),(1,'login',115,462),(1,'password',115,463),(1,'dev_mode',115,464),(1,'keep_log',115,465),(1,'providers',115,466),(1,'delivery_types',115,467),(1,'pickup_types',115,468),(1,'settings',115,469),(1,'disabled',115,139),(1,'domain_id_list',115,140),(1,'payment_type_id',116,115),(1,'disabled',116,116),(1,'domain_id_list',116,117),(1,'reciever',116,470),(1,'reciever_inn',116,471),(1,'reciever_account',116,472),(1,'reciever_bank',116,473),(1,'bik',116,474),(1,'reciever_bank_account',116,475),(1,'payment_type_id',117,115),(1,'disabled',117,116),(1,'domain_id_list',117,117),(1,'merchant_id',117,476),(1,'private_key',117,477),(1,'receipt_data_send_enable',117,478),(1,'keep_log',117,479),(1,'payment_type_id',118,115),(1,'disabled',118,116),(1,'domain_id_list',118,117),(1,'payment_type_id',119,115),(1,'disabled',119,116),(1,'domain_id_list',119,117),(1,'login',119,480),(1,'password1',119,481),(1,'password2',119,482),(1,'test_mode',119,483),(1,'receipt_data_send_enable',119,478),(1,'payment_type_id',121,115),(1,'disabled',121,116),(1,'domain_id_list',121,117),(1,'name',121,486),(1,'legal_address',121,487),(1,'phone_number',121,488),(1,'inn',121,489),(1,'kpp',121,490),(1,'account',121,491),(1,'bank',121,492),(1,'bank_account',121,493),(1,'bik',121,474),(1,'sign_image',121,494),(1,'payment_type_id',122,115),(1,'disabled',122,116),(1,'domain_id_list',122,117),(1,'mnt_system_url',122,495),(1,'mnt_id',122,496),(1,'mnt_success_url',122,497),(1,'mnt_fail_url',122,498),(1,'mnt_data_integrity_code',122,499),(1,'mnt_test_mode',122,500),(1,'receipt_data_send_enable',122,478),(1,'payment_type_id',123,115),(1,'disabled',123,116),(1,'domain_id_list',123,117),(1,'project',123,501),(1,'key',123,502),(1,'source',123,503),(1,'payment_type_id',127,115),(1,'disabled',127,116),(1,'domain_id_list',127,117),(1,'test_mode',127,517),(1,'paypalemail',127,518),(1,'return_success',127,519),(1,'cancel_return',127,520),(1,'payment_type_id',128,115),(1,'disabled',128,116),(1,'domain_id_list',128,117),(1,'shop_id',128,521),(1,'secret_key',128,522),(1,'receipt_data_send_enable',128,478),(1,'keep_log',128,479),(1,'open_the_payment_result_waiting_page',128,523),(1,'domain_id',129,524),(1,'robots_txt',129,525),(1,'format',130,526),(1,'elements',130,527),(1,'excluded_elements',130,528),(1,'cache_time',130,529),(1,'source_name',130,530),(1,'encoding_export',130,531),(1,'format',131,532),(1,'file',131,533),(1,'elements',131,534),(1,'encoding_import',131,535),(1,'source_name',131,536),(3,'custom_id',95,379),(3,'lang_id',95,380),(3,'domain_id',95,381),(3,'custom_id',99,379),(3,'lang_id',99,380),(3,'domain_id',99,381),(3,'site_name',99,393),(3,'logo',99,394),(3,'phone',99,398),(3,'address',99,399),(3,'site_color',99,396),(3,'code',100,397),(3,'user_css',99,395),(3,'social_networks',99,405),(3,'link',101,406),(3,'css_class',101,407),(3,'rss_icon',99,402),(3,'rss_text',99,403),(3,'copyright',99,400),(3,'footer_code',99,404),(3,'404_header',99,413),(3,'404_content',99,414),(3,'sitemap_header',99,415),(3,'search_page_header',99,418),(3,'personal_data_policy_confirmation_text',99,422),(3,'personal_data_policy_no_confirmation_error',99,423),(3,'destination_address',74,280),(3,'sender_ip',74,281),(3,'sending_time',74,282),(3,'wf_message',74,283),(3,'destination_address',102,280),(3,'sender_ip',102,281),(3,'sending_time',102,282),(3,'wf_message',102,283),(3,'author',102,408),(3,'email',102,409),(3,'theme',102,410),(3,'message',102,411),(3,'title',3,2),(3,'h1',3,3),(3,'content',3,4),(3,'meta_descriptions',3,5),(3,'meta_keywords',3,6),(3,'tags',3,7),(3,'robots_deny',3,11),(3,'show_submenu',3,12),(3,'is_expanded',3,13),(3,'is_unindexed',3,14),(3,'rate_voters',3,15),(3,'rate_sum',3,16),(3,'expiration_date',3,17),(3,'notification_date',3,18),(3,'publish_comments',3,19),(3,'publish_status',3,20),(3,'publish_status_id',2,1),(3,'locktime',3,21),(3,'lockuser',3,22),(3,'additional_content',3,434),(3,'title',61,2),(3,'h1',61,3),(3,'meta_keywords',61,6),(3,'meta_descriptions',61,5),(3,'tags',61,7),(3,'content',61,4),(3,'robots_deny',61,11),(3,'show_submenu',61,12),(3,'is_expanded',61,13),(3,'is_unindexed',61,14),(3,'rate_voters',61,15),(3,'rate_sum',61,16),(3,'expiration_date',61,17),(3,'notification_date',61,18),(3,'publish_comments',61,19),(3,'publish_status',61,20),(3,'locktime',61,21),(3,'lockuser',61,22),(3,'additional_content',61,434),(3,'title',103,2),(3,'h1',103,3),(3,'meta_keywords',103,6),(3,'meta_descriptions',103,5),(3,'tags',103,7),(3,'content',103,4),(3,'robots_deny',103,11),(3,'show_submenu',103,12),(3,'is_expanded',103,13),(3,'is_unindexed',103,14),(3,'rate_voters',103,15),(3,'rate_sum',103,16),(3,'expiration_date',103,17),(3,'notification_date',103,18),(3,'publish_comments',103,19),(3,'publish_status',103,20),(3,'locktime',103,21),(3,'lockuser',103,22),(3,'main_banner_image',103,429),(3,'main_banner_link',103,430),(3,'main_banner_text',103,431),(3,'catalog_category_block_header',103,424),(3,'category_catalog_source',103,432),(3,'first_content_block',103,425),(3,'second_content_block',103,426),(3,'news_block_source',103,433),(3,'advantages_block',103,427),(3,'popular_product_block_header',103,428),(3,'additional_content',103,434),(3,'title',73,2),(3,'h1',73,3),(3,'content',73,4),(3,'meta_descriptions',73,5),(3,'meta_keywords',73,6),(3,'tags',73,7),(3,'robots_deny',73,11),(3,'show_submenu',73,12),(3,'is_expanded',73,13),(3,'is_unindexed',73,14),(3,'rate_voters',73,15),(3,'rate_sum',73,16),(3,'expiration_date',73,17),(3,'notification_date',73,18),(3,'publish_comments',73,19),(3,'publish_status',73,20),(3,'locktime',73,21),(3,'lockuser',73,22),(3,'form_id',73,279),(3,'additional_content',73,434),(3,'login',54,203),(3,'password',54,204),(3,'groups',54,205),(3,'nazvanie',39,79),(3,'e-mail',54,206),(3,'activate_code',54,207),(3,'loginza',54,208),(3,'is_activated',54,209),(3,'last_request_time',54,210),(3,'subscribed_pages',54,211),(3,'rated_pages',54,212),(3,'is_online',54,213),(3,'messages_count',54,214),(3,'orders_refs',54,215),(3,'delivery_addresses',54,216),(3,'country',40,80),(3,'country_iso_code',10,30),(3,'index',40,81),(3,'region',40,82),(3,'city',40,83),(3,'street',40,84),(3,'house',40,85),(3,'flat',40,86),(3,'user_dock',54,217),(3,'preffered_currency',54,218),(3,'codename',21,35),(3,'nominal',21,36),(3,'rate',21,37),(3,'prefix',21,38),(3,'suffix',21,39),(3,'user_settings_data',54,219),(3,'last_order',54,220),(3,'order_items',53,144),(3,'item_amount',44,93),(3,'item_price',44,94),(3,'item_actual_price',44,95),(3,'item_total_original_price',44,96),(3,'item_total_price',44,97),(3,'item_type_id',44,98),(3,'class_name',41,87),(3,'item_link',44,99),(3,'item_discount_id',44,100),(3,'discount_type_id',42,88),(3,'codename',30,34),(3,'description',30,60),(3,'discount_modificator_id',42,89),(3,'discount_rules_id',42,90),(3,'is_active',42,91),(3,'description',42,92),(3,'item_discount_value',44,101),(3,'weight',44,102),(3,'width',44,103),(3,'height',44,104),(3,'length',44,105),(3,'tax_rate_id',44,106),(3,'yandex_id',27,51),(3,'payonline_id',27,52),(3,'robokassa_id',27,53),(3,'payanyway_id',27,54),(3,'sberbank_id',27,55),(3,'tax',27,56),(3,'payment_mode',44,107),(3,'yandex_id',29,57),(3,'robokassa_id',29,53),(3,'payanyway_id',29,58),(3,'payonline_id',29,59),(3,'sberbank_id',29,55),(3,'payment_subject',44,108),(3,'yandex_id',28,57),(3,'robokassa_id',28,53),(3,'payanyway_id',28,58),(3,'payonline_id',28,59),(3,'sberbank_id',28,55),(3,'options',44,109),(3,'trade_offer',44,110),(3,'number',53,145),(3,'social_order_id',53,146),(3,'customer_id',53,148),(3,'domain_id',53,149),(3,'manager_id',53,150),(3,'status_id',53,151),(3,'codename',45,40),(3,'priority',45,111),(3,'total_original_price',53,152),(3,'total_price',53,153),(3,'total_amount',53,154),(3,'status_change_date',53,155),(3,'order_date',53,156),(3,'order_discount_value',53,157),(3,'is_reserved',53,158),(3,'service_info',53,159),(3,'order_comment',53,436),(3,'http_referer',53,167),(3,'http_target',53,168),(3,'source_domain',53,169),(3,'utm_medium',53,170),(3,'utm_term',53,171),(3,'utm_campaign',53,172),(3,'utm_content',53,173),(3,'order_create_date',53,174),(3,'payment_id',53,175),(3,'payment_type_id',47,115),(3,'class_name',46,112),(3,'payment_type_id',46,113),(3,'payment_type_guid',46,114),(3,'disabled',47,116),(3,'domain_id_list',47,117),(3,'payment_name',53,176),(3,'payment_status_id',53,177),(3,'codename',48,40),(3,'priority',48,111),(3,'payment_date',53,178),(3,'payment_document_num',53,179),(3,'legal_person',53,180),(3,'contact_person',49,118),(3,'phone_number',49,119),(3,'fax',49,120),(3,'email',49,49),(3,'name',49,121),(3,'legal_address',49,122),(3,'defacto_address',49,123),(3,'post_address',49,124),(3,'inn',49,125),(3,'account',49,126),(3,'bank',49,127),(3,'bank_account',49,128),(3,'bik',49,129),(3,'ogrn',49,130),(3,'kpp',49,131),(3,'delivery_id',53,181),(3,'description',51,135),(3,'delivery_type_id',51,136),(3,'class_name',50,132),(3,'delivery_type_id',50,133),(3,'delivery_type_guid',50,134),(3,'price',51,137),(3,'tax_rate_id',51,138),(3,'disabled',51,139),(3,'domain_id_list',51,140),(3,'payment_mode',51,141),(3,'payment_subject',51,142),(3,'disabled_types_of_payment',51,143),(3,'delivery_name',53,182),(3,'delivery_status_id',53,183),(3,'codename',52,40),(3,'priority',52,111),(3,'delivery_address',53,184),(3,'delivery_date',53,185),(3,'pickup_date',53,186),(3,'delivery_provider',53,187),(3,'delivery_tariff',53,188),(3,'delivery_type',53,189),(3,'pickup_type',53,190),(3,'delivery_price',53,191),(3,'delivery_point_in',53,192),(3,'delivery_point_out',53,193),(3,'total_weight',53,194),(3,'total_width',53,195),(3,'total_height',53,196),(3,'total_length',53,197),(3,'delivery_allow_date',53,198),(3,'order_discount_id',53,199),(3,'bonus',53,200),(3,'need_export',53,201),(3,'purchaser_one_click',53,202),(3,'lname',25,46),(3,'fname',25,47),(3,'father_name',25,48),(3,'email',25,49),(3,'phone',25,50),(3,'bonus',54,221),(3,'legal_persons',54,222),(3,'spent_bonus',54,223),(3,'filemanager_directory',54,224),(3,'appended_file_extensions',54,225),(3,'register_date',54,226),(3,'tickets_color',54,227),(3,'favorite_domain_list',54,228),(3,'lname',54,229),(3,'fname',54,230),(3,'father_name',54,231),(3,'phone',54,232),(3,'referer',54,233),(3,'target',54,234),(3,'title',86,2),(3,'h1',86,3),(3,'meta_keywords',86,6),(3,'meta_descriptions',86,5),(3,'tags',86,7),(3,'robots_deny',86,11),(3,'show_submenu',86,12),(3,'is_expanded',86,13),(3,'is_unindexed',86,14),(3,'descr',86,267),(3,'rate_voters',86,15),(3,'rate_sum',86,16),(3,'expiration_date',86,17),(3,'notification_date',86,18),(3,'publish_comments',86,19),(3,'publish_status',86,20),(3,'locktime',86,21),(3,'lockuser',86,22),(3,'index_source',86,329),(3,'index_state',86,330),(3,'index_date',86,331),(3,'index_choose',86,332),(3,'index_level',86,333),(3,'additional_content',86,434),(3,'title',7,2),(3,'h1',7,3),(3,'meta_keywords',7,6),(3,'meta_descriptions',7,5),(3,'tags',7,7),(3,'readme',7,24),(3,'robots_deny',7,11),(3,'show_submenu',7,12),(3,'is_expanded',7,13),(3,'is_unindexed',7,14),(3,'rate_voters',7,15),(3,'rate_sum',7,16),(3,'expiration_date',7,17),(3,'notification_date',7,18),(3,'publish_comments',7,19),(3,'publish_status',7,20),(3,'locktime',7,21),(3,'lockuser',7,22),(3,'additional_content',7,434),(3,'address_description',76,295),(3,'address_list',76,296),(3,'form_id',76,297),(3,'from_email_template',75,284),(3,'from_template',75,285),(3,'subject_template',75,286),(3,'master_template',75,287),(3,'autoreply_from_email_template',75,288),(3,'autoreply_from_template',75,289),(3,'autoreply_subject_template',75,290),(3,'autoreply_email_recipient',75,291),(3,'autoreply_template',75,292),(3,'posted_message',75,293),(3,'form_id',75,294),(3,'title',87,2),(3,'h1',87,3),(3,'meta_keywords',87,6),(3,'meta_descriptions',87,5),(3,'tags',87,7),(3,'date_create_object',87,334),(3,'robots_deny',87,11),(3,'is_unindexed',87,14),(3,'tax_rate_id',87,335),(3,'price',87,336),(3,'payment_mode',87,337),(3,'payment_subject',87,338),(3,'stores_state',87,339),(3,'primary',55,235),(3,'reserved',87,340),(3,'common_quantity',87,341),(3,'trade_offer_image',87,342),(3,'trade_offer_list',87,343),(3,'rate_voters',87,15),(3,'rate_sum',87,16),(3,'expiration_date',87,17),(3,'notification_date',87,18),(3,'publish_comments',87,19),(3,'publish_status',87,20),(3,'locktime',87,21),(3,'lockuser',87,22),(3,'description',87,416),(3,'image',87,417),(3,'popular',87,435),(3,'additional_content',87,434),(3,'title',77,2),(3,'h1',77,3),(3,'meta_descriptions',77,5),(3,'meta_keywords',77,6),(3,'tags',77,7),(3,'robots_deny',77,11),(3,'show_submenu',77,12),(3,'is_expanded',77,13),(3,'is_unindexed',77,14),(3,'descr',77,267),(3,'create_time',77,298),(3,'user_id',77,299),(3,'rate_voters',77,15),(3,'rate_sum',77,16),(3,'expiration_date',77,17),(3,'notification_date',77,18),(3,'publish_comments',77,19),(3,'publish_status',77,20),(3,'locktime',77,21),(3,'lockuser',77,22),(3,'additional_content',77,434),(3,'title',78,2),(3,'h1',78,3),(3,'meta_descriptions',78,5),(3,'meta_keywords',78,6),(3,'tags',78,7),(3,'robots_deny',78,11),(3,'show_submenu',78,12),(3,'is_expanded',78,13),(3,'is_unindexed',78,14),(3,'photo',78,300),(3,'descr',78,267),(3,'create_time',78,298),(3,'user_id',78,299),(3,'rate_voters',78,15),(3,'rate_sum',78,16),(3,'expiration_date',78,17),(3,'notification_date',78,18),(3,'publish_comments',78,19),(3,'publish_status',78,20),(3,'locktime',78,21),(3,'lockuser',78,22),(3,'additional_content',78,434),(3,'title',60,2),(3,'h1',60,3),(3,'meta_keywords',60,6),(3,'meta_descriptions',60,5),(3,'tags',60,7),(3,'anons',60,240),(3,'content',60,4),(3,'source',60,241),(3,'source_url',60,242),(3,'publish_time',60,243),(3,'begin_time',60,244),(3,'end_time',60,245),(3,'robots_deny',60,11),(3,'show_submenu',60,12),(3,'is_expanded',60,13),(3,'is_unindexed',60,14),(3,'anons_pic',60,246),(3,'publish_pic',60,247),(3,'subjects',60,248),(3,'rate_voters',60,15),(3,'rate_sum',60,16),(3,'expiration_date',60,17),(3,'notification_date',60,18),(3,'publish_comments',60,19),(3,'publish_status',60,20),(3,'locktime',60,21),(3,'lockuser',60,22),(3,'additional_content',60,434),(1,'auth_token',54,539),(1,'social_uid',54,540),(1,'include_fees',115,541),(1,'yandex_map_api_key',115,542),(1,'keep_log',119,479),(1,'keep_log',122,479),(1,'keep_log',123,479),(1,'keep_log',127,479),(1,'disable_auto_capture',128,543),(1,'dengionline_id',27,544),(1,'dengionline_id',28,545),(1,'dengionline_id',29,545),(1,'domain_id_list',58,546),(1,'language_id_list',58,547),(1,'receipt_data_send_enable',123,478),(1,'price_type_id',44,548),(1,'promocode',132,549),(1,'rule_type_id',132,70),(1,'is_deactivated_by_manager',54,550),(1,'disabled_user_groups',47,551),(1,'disabled_user_groups',116,551),(1,'disabled_user_groups',117,551),(1,'disabled_user_groups',118,551),(1,'disabled_user_groups',119,551),(1,'disabled_user_groups',121,551),(1,'disabled_user_groups',122,551),(1,'disabled_user_groups',123,551),(1,'disabled_user_groups',127,551),(1,'disabled_user_groups',128,551),(1,'locktime',63,21),(1,'lockuser',63,22),(1,'locktime',65,21),(1,'lockuser',65,22),(1,'format',133,526),(1,'elements',133,527),(1,'excluded_elements',133,528),(1,'cache_time',133,529),(1,'source_name',133,530),(1,'channel_header',133,552),(1,'channel_description',133,553),(1,'channel_site',133,554),(1,'channel_item_limit',133,555),(1,'web_analytics_type',133,556),(1,'web_analytics_id',133,557),(1,'web_analytics_params',133,558),(1,'web_analytics_pixel_url',133,559),(1,'advertising_type',133,560),(1,'advertising_block_id',133,561),(1,'advertising_place_id',133,562),(1,'advertising_code',133,563);
/*!40000 ALTER TABLE `cms3_import_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_groups`
--

DROP TABLE IF EXISTS `cms3_import_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_groups` (
  `source_id` int(10) unsigned NOT NULL,
  `group_name` varchar(48) NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `new_id` int(10) unsigned NOT NULL,
  KEY `source_id` (`source_id`),
  KEY `type_id` (`type_id`),
  KEY `group_name` (`group_name`),
  KEY `new_id` (`new_id`),
  CONSTRAINT `FK_GroupSourceId_To_Source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_NewGroupId_To_ObjectTypeId` FOREIGN KEY (`type_id`) REFERENCES `cms3_import_types` (`new_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_NewId_To_ObjectTypeGroupId` FOREIGN KEY (`new_id`) REFERENCES `cms3_object_field_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_groups`
--

LOCK TABLES `cms3_import_groups` WRITE;
/*!40000 ALTER TABLE `cms3_import_groups` DISABLE KEYS */;
INSERT INTO `cms3_import_groups` VALUES (1,'svojstva_statusa_stranicy',2,1),(1,'common',3,2),(1,'more_params',3,4),(1,'rate_props',3,5),(1,'svojstva_publikacii',3,6),(1,'locks',3,7),(1,'common',6,8),(1,'common',7,9),(1,'more_params',7,11),(1,'rate_voters',7,12),(1,'svojstva_publikacii',7,13),(1,'locks',7,14),(1,'common',8,15),(1,'props',9,16),(1,'params_more',10,17),(1,'common',14,18),(1,'common',15,19),(1,'additional',16,20),(1,'additional',17,21),(1,'props_currency',21,24),(1,'common',23,26),(1,'common',24,27),(1,'personal',25,28),(1,'common',27,29),(1,'common',28,30),(1,'common',29,31),(1,'discount_type_props',30,32),(1,'discount_modificator_type_props',31,33),(1,'discount_modificator_props',32,34),(1,'discount_rule_type_props',33,35),(1,'discount_rule_props',34,36),(1,'common',35,37),(1,'common',36,38),(1,'network_system_props',37,39),(1,'props',38,40),(1,'pages',38,41),(1,'network_system_props',38,42),(1,'svojstva_gruppy_polzovatelej',39,43),(1,'common',40,44),(1,'item_type_props',41,45),(1,'discount_props',42,46),(1,'item_props',44,47),(1,'item_optioned_props',44,48),(1,'trade_offers',44,49),(1,'order_status_props',45,50),(1,'payment_type_props',46,51),(1,'payment_props',47,52),(1,'order_status_props',48,53),(1,'general',49,54),(1,'addresses',49,55),(1,'payment',49,56),(1,'delivery_type_props',50,57),(1,'delivery_description_props',51,58),(1,'order_status_props',52,59),(1,'order_props',53,60),(1,'statistic_info',53,62),(1,'order_payment_props',53,63),(1,'order_delivery_props',53,64),(1,'order_discount_props',53,65),(1,'integration_date',53,66),(1,'purchase_one_click',53,67),(1,'idetntify_data',54,68),(1,'more_info',54,69),(1,'short_info',54,70),(1,'delivery',54,71),(1,'statistic_info',54,72),(1,'store_props',55,73),(1,'discount_modificator_props',56,74),(1,'discount_rule_props',57,75),(1,'common',58,76),(1,'common',60,77),(1,'item_props',60,78),(1,'more_params',60,80),(1,'news_images',60,81),(1,'subjects_block',60,82),(1,'rate_voters',60,83),(1,'svojstva_publikacii',60,84),(1,'locks',60,85),(1,'common',61,86),(1,'more_params',61,88),(1,'rate_voters',61,89),(1,'svojstva_publikacii',61,90),(1,'locks',61,91),(1,'props',62,92),(1,'common',63,93),(1,'more_params',63,95),(1,'rate_props',63,96),(1,'props',64,97),(1,'common',65,98),(1,'rate_props',65,99),(1,'antispam',65,100),(1,'common',66,101),(1,'more_params',66,103),(1,'rate_props',66,104),(1,'svojstva_publikacii',66,105),(1,'locks',66,106),(1,'privacy',66,107),(1,'antispam',66,108),(1,'common',67,109),(1,'more_params',67,111),(1,'rate_voters',67,112),(1,'svojstva_publikacii',67,113),(1,'locks',67,114),(1,'common',68,115),(1,'more_params',68,117),(1,'topic_props',68,118),(1,'rate_voters',68,119),(1,'svojstva_publikacii',68,120),(1,'locks',68,121),(1,'common',69,122),(1,'more_params',69,124),(1,'message_props',69,125),(1,'rate_voters',69,126),(1,'svojstva_publikacii',69,127),(1,'locks',69,128),(1,'common',70,129),(1,'more_params',70,131),(1,'comment_props',70,132),(1,'rate_voters',70,133),(1,'svojstva_publikacii',70,134),(1,'locks',70,135),(1,'antispam',70,136),(1,'common_props',71,137),(1,'common',72,138),(1,'more_params',72,140),(1,'poll_props',72,141),(1,'rate_voters',72,142),(1,'svojstva_publikacii',72,143),(1,'locks',72,144),(1,'common',73,145),(1,'more_params',73,147),(1,'rate_props',73,148),(1,'svojstva_publikacii',73,149),(1,'locks',73,150),(1,'binding',73,151),(1,'sendingdata',74,152),(1,'templates',75,153),(1,'auto_reply',75,154),(1,'messages',75,155),(1,'binding',75,156),(1,'list',76,157),(1,'common',77,158),(1,'more_params',77,160),(1,'album_props',77,161),(1,'rate_voters',77,162),(1,'svojstva_publikacii',77,163),(1,'locks',77,164),(1,'common',78,165),(1,'more_params',78,167),(1,'photo_props',78,168),(1,'rate_voters',78,169),(1,'svojstva_publikacii',78,170),(1,'locks',78,171),(1,'common',79,172),(1,'more_params',79,174),(1,'rate_voters',79,175),(1,'svojstva_publikacii',79,176),(1,'locks',79,177),(1,'common',80,178),(1,'more_params',80,180),(1,'rate_voters',80,181),(1,'svojstva_publikacii',80,182),(1,'locks',80,183),(1,'common',81,184),(1,'more_params',81,186),(1,'svojstva_publikacii',81,187),(1,'locks',81,188),(1,'antispam',81,189),(1,'grp_disp_props',82,190),(1,'auto_settings',82,191),(1,'grp_disp_release_props',83,192),(1,'grp_disp_msg_props',84,193),(1,'grp_disp_msg_extended',84,194),(1,'grp_sbs_props',85,195),(1,'grp_sbs_extended',85,196),(1,'common',86,197),(1,'more_params',86,199),(1,'dopolnitelno',86,200),(1,'rate_voters',86,201),(1,'svojstva_publikacii',86,202),(1,'locks',86,203),(1,'filter_index',86,204),(1,'common',87,205),(1,'more_params',87,207),(1,'cenovye_svojstva',87,208),(1,'catalog_option_props',87,209),(1,'catalog_stores_props',87,210),(1,'trade_offers',87,211),(1,'rate_voters',87,212),(1,'svojstva_publikacii',87,213),(1,'locks',87,214),(1,'common_props',88,215),(1,'common',89,216),(1,'redirect_props',89,217),(1,'view_params',89,218),(1,'view_pages',89,219),(1,'time_targeting',89,220),(1,'city_targeting',89,221),(1,'view_settings',89,222),(1,'common',90,223),(1,'banner_custom_props',90,224),(1,'redirect_props',90,225),(1,'view_params',90,226),(1,'view_pages',90,227),(1,'time_targeting',90,228),(1,'city_targeting',90,229),(1,'view_settings',90,230),(1,'common',91,231),(1,'banner_custom_props',91,232),(1,'redirect_props',91,233),(1,'view_params',91,234),(1,'view_pages',91,235),(1,'time_targeting',91,236),(1,'city_targeting',91,237),(1,'view_settings',91,238),(1,'common',92,239),(1,'banner_custom_props',92,240),(1,'redirect_props',92,241),(1,'view_params',92,242),(1,'view_pages',92,243),(1,'time_targeting',92,244),(1,'city_targeting',92,245),(1,'view_settings',92,246),(1,'svojstva',93,247),(1,'common',94,248),(1,'more_params',94,250),(1,'fs_file_props',94,251),(1,'rate_voters',94,252),(1,'svojstva_publikacii',94,253),(1,'locks',94,254),(1,'common',95,255),(1,'common',96,256),(1,'common',97,257),(1,'common',98,258),(1,'more_params',98,260),(1,'rate_props',98,261),(1,'svojstva_publikacii',98,262),(1,'locks',98,263),(1,'appointment',98,264),(1,'personal_info',104,309),(1,'contact_props',104,310),(1,'delivery',104,311),(1,'yuridicheskie_dannye',104,312),(1,'discount_modificator_props',105,313),(1,'discount_rule_props',106,314),(1,'discount_rule_props',107,315),(1,'discount_rule_props',108,316),(1,'discount_rule_props',109,317),(1,'discount_rule_props',110,318),(1,'discount_rule_props',111,319),(1,'delivery_description_props',112,320),(1,'delivery_description_props',113,321),(1,'delivery_courier_props',113,322),(1,'delivery_description_props',114,323),(1,'settings',114,324),(1,'delivery_description_props',115,325),(1,'settings',115,326),(1,'payment_props',116,327),(1,'settings',116,328),(1,'payment_props',117,329),(1,'settings',117,330),(1,'payment_props',118,331),(1,'payment_props',119,332),(1,'settings',119,333),(1,'payment_props',121,336),(1,'organization',121,337),(1,'payment_props',122,338),(1,'settings',122,339),(1,'payment_props',123,340),(1,'settings',123,341),(1,'payment_props',127,347),(1,'settings',127,348),(1,'payment_props',128,349),(1,'settings',128,350),(1,'common',129,351),(1,'common',130,352),(1,'common',131,353),(1,'order_credit_props',53,354),(1,'discount_rule_props',132,355),(1,'locks',63,356),(1,'locks',65,357),(1,'common',133,358),(1,'channel_meta',133,359),(1,'channel_web_analytics',133,360),(1,'channel_advertising',133,361);
/*!40000 ALTER TABLE `cms3_import_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_langs`
--

DROP TABLE IF EXISTS `cms3_import_langs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_langs` (
  `source_id` int(10) unsigned NOT NULL,
  `old_id` varchar(255) NOT NULL,
  `new_id` int(10) unsigned NOT NULL,
  KEY `source_id` (`source_id`,`old_id`,`new_id`),
  KEY `old_id` (`old_id`,`new_id`),
  KEY `new_id` (`new_id`),
  CONSTRAINT `FK_LangSourceId_To_Source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_NewId_To_LangId` FOREIGN KEY (`new_id`) REFERENCES `cms3_langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_langs`
--

LOCK TABLES `cms3_import_langs` WRITE;
/*!40000 ALTER TABLE `cms3_import_langs` DISABLE KEYS */;
INSERT INTO `cms3_import_langs` VALUES (1,'1',1),(1,'2',2),(2,'1',1),(3,'1',1);
/*!40000 ALTER TABLE `cms3_import_langs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_links`
--

DROP TABLE IF EXISTS `cms3_import_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_links` (
  `external_id` int(10) unsigned NOT NULL,
  `internal_id` int(10) unsigned NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_links_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_links` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_links_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_links`
--

LOCK TABLES `cms3_import_links` WRITE;
/*!40000 ALTER TABLE `cms3_import_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_links_sources`
--

DROP TABLE IF EXISTS `cms3_import_links_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_links_sources` (
  `external_id` int(11) unsigned NOT NULL,
  `internal_id` int(11) unsigned NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_links_sources_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_links_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_links_sources_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_links_sources`
--

LOCK TABLES `cms3_import_links_sources` WRITE;
/*!40000 ALTER TABLE `cms3_import_links_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_links_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_mail_notifications`
--

DROP TABLE IF EXISTS `cms3_import_mail_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_mail_notifications` (
  `external_id` int(11) unsigned NOT NULL,
  `internal_id` int(11) unsigned NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_mail_notifications_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_mail_notifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_mail_notifications_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_mail_notifications`
--

LOCK TABLES `cms3_import_mail_notifications` WRITE;
/*!40000 ALTER TABLE `cms3_import_mail_notifications` DISABLE KEYS */;
INSERT INTO `cms3_import_mail_notifications` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1),(22,22,1);
/*!40000 ALTER TABLE `cms3_import_mail_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_mail_templates`
--

DROP TABLE IF EXISTS `cms3_import_mail_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_mail_templates` (
  `external_id` int(10) unsigned NOT NULL,
  `internal_id` int(10) unsigned NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_mail_templates_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_mail_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_mail_templates_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_mail_templates`
--

LOCK TABLES `cms3_import_mail_templates` WRITE;
/*!40000 ALTER TABLE `cms3_import_mail_templates` DISABLE KEYS */;
INSERT INTO `cms3_import_mail_templates` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1),(22,22,1),(23,23,1),(24,24,1),(25,25,1),(26,26,1),(27,27,1),(28,28,1),(29,29,1),(30,30,1),(31,31,1),(32,32,1),(33,33,1),(34,34,1),(35,35,1),(36,36,1),(37,37,1),(38,38,1),(39,39,1),(40,40,1),(41,41,1),(42,42,1),(43,43,1),(44,44,1),(45,45,1),(46,46,1),(47,47,1),(48,48,1),(49,49,1);
/*!40000 ALTER TABLE `cms3_import_mail_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_mail_variables`
--

DROP TABLE IF EXISTS `cms3_import_mail_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_mail_variables` (
  `external_id` int(10) unsigned NOT NULL,
  `internal_id` int(10) unsigned NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_mail_variables_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_mail_variables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_mail_variables_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_mail_variables`
--

LOCK TABLES `cms3_import_mail_variables` WRITE;
/*!40000 ALTER TABLE `cms3_import_mail_variables` DISABLE KEYS */;
INSERT INTO `cms3_import_mail_variables` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1),(22,22,1),(23,23,1),(24,24,1),(25,25,1),(26,26,1),(27,27,1),(28,28,1),(29,29,1),(30,30,1),(31,31,1),(32,32,1),(33,33,1),(34,34,1),(35,35,1),(36,36,1),(37,37,1),(38,38,1),(39,39,1),(40,40,1),(41,41,1),(42,42,1),(43,43,1),(44,44,1),(45,45,1),(46,46,1),(47,47,1),(48,48,1),(49,49,1),(50,50,1),(51,51,1),(52,52,1),(53,53,1),(54,54,1),(55,55,1),(56,56,1),(57,57,1),(58,58,1),(59,59,1),(60,60,1),(61,61,1),(62,62,1),(63,63,1),(64,64,1),(65,65,1),(66,66,1),(67,67,1),(68,68,1),(69,69,1),(70,70,1),(71,71,1),(72,72,1),(73,73,1),(74,74,1),(75,75,1),(76,76,1),(77,77,1),(78,78,1),(79,79,1),(80,80,1),(81,81,1),(82,82,1),(83,83,1),(84,84,1),(85,85,1),(86,86,1),(87,87,1),(88,88,1),(89,89,1),(90,90,1),(91,91,1),(92,92,1),(93,93,1),(94,94,1),(95,95,1),(96,96,1),(97,97,1),(98,98,1),(99,99,1),(100,100,1),(101,101,1),(102,102,1),(103,103,1),(104,104,1),(105,105,1),(106,106,1),(107,107,1),(108,108,1),(109,109,1),(110,110,1),(111,111,1),(112,112,1),(113,113,1),(114,114,1),(115,115,1),(116,116,1),(117,117,1),(118,118,1),(119,119,1),(120,120,1),(121,121,1),(122,122,1),(123,123,1),(124,124,1),(125,125,1),(126,126,1),(127,127,1),(128,128,1),(129,129,1),(130,130,1),(131,131,1),(132,132,1),(133,133,1),(134,134,1),(135,135,1),(136,136,1),(137,137,1),(138,138,1),(139,139,1),(140,140,1),(141,141,1),(142,142,1),(143,143,1),(144,144,1),(145,145,1),(146,146,1),(147,147,1),(148,148,1),(149,149,1),(150,150,1),(151,151,1),(152,152,1),(153,153,1),(154,154,1),(155,155,1),(156,156,1),(157,157,1),(158,158,1),(159,159,1),(160,160,1),(161,161,1),(162,162,1),(163,163,1),(164,164,1),(165,165,1),(166,166,1),(167,167,1),(168,168,1),(169,169,1),(170,170,1),(171,171,1),(172,172,1),(173,173,1),(174,174,1),(175,175,1),(176,176,1),(177,177,1),(178,178,1),(179,179,1),(180,180,1);
/*!40000 ALTER TABLE `cms3_import_mail_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_objects`
--

DROP TABLE IF EXISTS `cms3_import_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_objects` (
  `source_id` int(10) unsigned NOT NULL,
  `old_id` varchar(255) NOT NULL,
  `new_id` int(10) unsigned NOT NULL,
  KEY `source_id` (`source_id`,`old_id`,`new_id`),
  KEY `old_id` (`old_id`,`new_id`),
  KEY `new_id` (`new_id`),
  CONSTRAINT `FK_NewId_To_ObjectsId` FOREIGN KEY (`new_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ObjectSourceId_To_Source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_objects`
--

LOCK TABLES `cms3_import_objects` WRITE;
/*!40000 ALTER TABLE `cms3_import_objects` DISABLE KEYS */;
INSERT INTO `cms3_import_objects` VALUES (1,'14',182),(1,'15',181),(1,'2373',618),(1,'2374',619),(1,'2376',2),(1,'2377',3),(1,'25974',6),(1,'25975',7),(1,'25976',8),(1,'26315',9),(1,'26341',10),(1,'26905',11),(1,'26906',12),(1,'26907',13),(1,'26908',14),(1,'26909',15),(1,'26910',16),(1,'26911',17),(1,'26912',18),(1,'26913',19),(1,'26914',20),(1,'26915',21),(1,'26916',22),(1,'26917',23),(1,'26918',24),(1,'26919',25),(1,'26920',26),(1,'26921',27),(1,'26922',28),(1,'26923',29),(1,'26924',30),(1,'26925',31),(1,'26926',32),(1,'26927',33),(1,'26928',34),(1,'26929',35),(1,'26930',36),(1,'26931',37),(1,'26932',38),(1,'26933',39),(1,'26934',40),(1,'26935',41),(1,'26936',42),(1,'26937',43),(1,'26938',44),(1,'26939',45),(1,'26940',46),(1,'26941',47),(1,'26942',48),(1,'26943',49),(1,'26944',50),(1,'26945',51),(1,'26946',52),(1,'26947',53),(1,'26948',54),(1,'26949',55),(1,'26950',56),(1,'26951',57),(1,'26952',58),(1,'26953',59),(1,'26954',60),(1,'26955',61),(1,'26956',62),(1,'26957',63),(1,'26958',64),(1,'26959',65),(1,'26960',66),(1,'26961',67),(1,'26962',68),(1,'26963',69),(1,'26964',70),(1,'26965',71),(1,'26966',72),(1,'26967',73),(1,'26968',74),(1,'26969',75),(1,'26970',76),(1,'26971',77),(1,'26972',78),(1,'26973',79),(1,'26974',80),(1,'26975',81),(1,'26976',82),(1,'26977',83),(1,'26978',84),(1,'26979',85),(1,'26980',86),(1,'26981',87),(1,'26982',88),(1,'26983',89),(1,'26984',90),(1,'26985',91),(1,'26986',92),(1,'26987',93),(1,'26988',94),(1,'26989',95),(1,'26990',96),(1,'26991',97),(1,'26992',98),(1,'26993',99),(1,'26994',100),(1,'26995',101),(1,'26996',102),(1,'26997',103),(1,'26998',104),(1,'26999',105),(1,'27000',106),(1,'27001',107),(1,'27002',108),(1,'27003',109),(1,'27004',110),(1,'27005',111),(1,'27006',112),(1,'27007',113),(1,'27008',114),(1,'27009',115),(1,'27010',116),(1,'27011',117),(1,'27012',118),(1,'27013',119),(1,'27014',120),(1,'27015',121),(1,'27016',122),(1,'27017',123),(1,'27018',124),(1,'27019',125),(1,'27020',126),(1,'27021',127),(1,'27022',128),(1,'27023',129),(1,'27024',130),(1,'27025',131),(1,'27026',132),(1,'27027',133),(1,'27028',134),(1,'27029',135),(1,'27030',136),(1,'27031',137),(1,'27032',138),(1,'27033',139),(1,'27034',140),(1,'27035',141),(1,'27036',142),(1,'27037',143),(1,'27038',144),(1,'27039',145),(1,'27040',146),(1,'27041',147),(1,'27042',148),(1,'27043',149),(1,'27044',150),(1,'27045',151),(1,'27046',152),(1,'27047',153),(1,'27048',154),(1,'27049',155),(1,'27050',156),(1,'27051',157),(1,'27052',158),(1,'27053',159),(1,'27054',160),(1,'27055',161),(1,'27056',162),(1,'27057',163),(1,'27058',164),(1,'27059',165),(1,'27060',166),(1,'27061',167),(1,'27062',168),(1,'27063',169),(1,'27064',170),(1,'27065',171),(1,'27066',172),(1,'27067',173),(1,'27068',174),(1,'27069',175),(1,'27070',176),(1,'27071',177),(1,'27072',178),(1,'27085',564),(1,'27086',569),(1,'27087',574),(1,'27131',179),(1,'27132',180),(1,'27135',604),(1,'27136',184),(1,'27147',185),(1,'27150',186),(1,'27180',187),(1,'27181',188),(1,'27226',620),(1,'27227',621),(1,'27228',622),(1,'27230',189),(1,'27233',190),(1,'27236',191),(1,'27258',192),(1,'27259',193),(1,'27260',194),(1,'27261',195),(1,'27262',196),(1,'27263',197),(1,'27264',198),(1,'27377',199),(1,'27378',200),(1,'27379',201),(1,'27380',202),(1,'27381',203),(1,'27382',204),(1,'27383',205),(1,'27393',206),(1,'27394',207),(1,'27395',208),(1,'27396',209),(1,'27397',210),(1,'27398',211),(1,'27438',605),(1,'27456',212),(1,'27457',213),(1,'27458',214),(1,'27459',606),(1,'27461',607),(1,'27462',610),(1,'27463',611),(1,'27464',612),(1,'27465',613),(1,'27466',614),(1,'27470',598),(1,'27471',600),(1,'27472',570),(1,'27473',579),(1,'27474',575),(1,'27475',583),(1,'27476',591),(1,'27477',215),(1,'27478',216),(1,'27479',217),(1,'27480',218),(1,'27481',219),(1,'27486',220),(1,'27488',222),(1,'27489',223),(1,'27490',224),(1,'27491',225),(1,'27492',226),(1,'27493',227),(1,'27494',228),(1,'27495',229),(1,'27496',230),(1,'27497',231),(1,'27498',232),(1,'27499',233),(1,'27500',234),(1,'27501',235),(1,'27502',236),(1,'27503',237),(1,'27504',238),(1,'27505',239),(1,'27506',240),(1,'27507',241),(1,'27508',242),(1,'27509',243),(1,'27510',244),(1,'27511',245),(1,'27512',246),(1,'27513',247),(1,'27514',248),(1,'27515',249),(1,'27516',250),(1,'27517',251),(1,'27518',252),(1,'27519',253),(1,'27520',608),(1,'27521',615),(1,'27522',609),(1,'27523',616),(1,'2780',4),(1,'2781',5),(1,'27915',1),(1,'27922',279),(1,'27926',280),(1,'27927',281),(1,'27928',183),(1,'27943',617),(1,'27944',296),(1,'27945',297),(1,'27946',298),(1,'27947',299),(1,'27949',300),(1,'27950',301),(1,'27955',304),(1,'27956',305),(1,'27957',306),(1,'27958',307),(1,'27959',308),(1,'27960',309),(1,'27961',565),(1,'27962',571),(1,'27963',576),(1,'27964',580),(1,'27965',584),(1,'27966',587),(1,'27967',310),(1,'27968',311),(1,'27969',312),(1,'27970',313),(1,'27971',314),(1,'27972',315),(1,'27973',316),(1,'27974',317),(1,'27975',318),(1,'27976',319),(1,'27977',320),(1,'27978',321),(1,'27979',322),(1,'27980',323),(1,'27981',324),(1,'27982',325),(1,'27983',326),(1,'27984',327),(1,'27985',328),(1,'27986',329),(1,'27987',330),(1,'27988',331),(1,'27989',332),(1,'27990',333),(1,'27991',334),(1,'27992',335),(1,'27993',336),(1,'27994',337),(1,'27995',338),(1,'27996',339),(1,'27997',340),(1,'27998',341),(1,'27999',342),(1,'28000',343),(1,'28001',344),(1,'28002',345),(1,'28003',346),(1,'28004',347),(1,'28005',348),(1,'28006',349),(1,'28007',350),(1,'28008',351),(1,'28009',352),(1,'28010',353),(1,'28011',354),(1,'28012',355),(1,'28013',356),(1,'28014',357),(1,'28015',358),(1,'28016',359),(1,'28017',360),(1,'28018',361),(1,'28019',362),(1,'28020',363),(1,'28021',364),(1,'28022',365),(1,'28023',366),(1,'28024',367),(1,'28025',368),(1,'28026',369),(1,'28027',370),(1,'28028',371),(1,'28029',372),(1,'28030',373),(1,'28031',374),(1,'28032',375),(1,'28033',376),(1,'28034',377),(1,'28035',378),(1,'28036',379),(1,'28037',380),(1,'28038',381),(1,'28039',382),(1,'28040',383),(1,'28041',384),(1,'28042',385),(1,'28043',386),(1,'28044',387),(1,'28045',388),(1,'28046',389),(1,'28047',390),(1,'28048',391),(1,'28049',392),(1,'28050',393),(1,'28051',394),(1,'28052',395),(1,'28053',396),(1,'28054',397),(1,'28055',398),(1,'28056',399),(1,'28057',400),(1,'28058',401),(1,'28059',402),(1,'28060',403),(1,'28061',404),(1,'28062',405),(1,'28063',406),(1,'28064',407),(1,'28065',408),(1,'28066',409),(1,'28067',410),(1,'28068',411),(1,'28069',412),(1,'28070',413),(1,'28071',414),(1,'28072',415),(1,'28073',416),(1,'28074',417),(1,'28075',418),(1,'28076',419),(1,'28077',420),(1,'28078',421),(1,'28079',422),(1,'28080',423),(1,'28081',424),(1,'28082',425),(1,'28083',426),(1,'28084',427),(1,'28085',428),(1,'28086',429),(1,'28087',430),(1,'28088',431),(1,'28089',432),(1,'28090',433),(1,'28091',434),(1,'28092',435),(1,'28093',436),(1,'28094',437),(1,'28095',438),(1,'28096',439),(1,'28097',440),(1,'28098',441),(1,'28099',442),(1,'28100',443),(1,'28101',444),(1,'28102',445),(1,'28103',446),(1,'28104',447),(1,'28105',448),(1,'28106',449),(1,'28107',450),(1,'28108',451),(1,'28109',452),(1,'28110',453),(1,'28111',454),(1,'28112',455),(1,'28113',456),(1,'28114',457),(1,'28115',458),(1,'28116',459),(1,'28117',460),(1,'28118',461),(1,'28119',462),(1,'28120',463),(1,'28121',464),(1,'28122',465),(1,'28123',466),(1,'28124',467),(1,'28125',468),(1,'28126',469),(1,'28127',470),(1,'28128',471),(1,'28129',472),(1,'28130',473),(1,'28131',474),(1,'28132',475),(1,'28133',476),(1,'28134',477),(1,'28135',478),(1,'28136',479),(1,'28137',480),(1,'28138',481),(1,'28139',482),(1,'28140',483),(1,'28141',484),(1,'28142',485),(1,'28143',486),(1,'28144',487),(1,'28145',488),(1,'28146',489),(1,'28147',490),(1,'28148',491),(1,'28149',492),(1,'28150',493),(1,'28151',494),(1,'28152',495),(1,'28153',496),(1,'28154',497),(1,'28155',498),(1,'28156',499),(1,'28157',500),(1,'28158',501),(1,'28159',502),(1,'28160',503),(1,'28161',504),(1,'28162',505),(1,'28163',506),(1,'28164',507),(1,'28165',508),(1,'28166',509),(1,'28167',510),(1,'28168',511),(1,'28169',512),(1,'28170',513),(1,'28171',514),(1,'28172',515),(1,'28173',516),(1,'28174',517),(1,'28175',518),(1,'28176',519),(1,'28177',520),(1,'28178',521),(1,'28179',522),(1,'28180',523),(1,'28181',524),(1,'28182',525),(1,'28183',526),(1,'28184',527),(1,'28185',528),(1,'28186',529),(1,'28187',530),(1,'28188',531),(1,'28189',532),(1,'28190',533),(1,'28191',534),(1,'28192',535),(1,'28193',536),(1,'28194',537),(1,'28195',538),(1,'28196',539),(1,'28197',540),(1,'28198',541),(1,'28199',542),(1,'28200',543),(1,'28201',544),(1,'28202',545),(1,'28203',546),(1,'28204',547),(1,'28205',548),(1,'28206',549),(1,'28207',550),(1,'28208',551),(1,'28209',552),(1,'28210',553),(1,'28211',554),(1,'28212',555),(1,'28213',556),(1,'28214',557),(1,'28215',558),(1,'28216',559),(1,'28217',560),(1,'28218',561),(1,'28219',566),(1,'28220',588),(1,'28221',594),(1,'28222',596),(1,'28223',562),(1,'28224',563),(1,'28225',567),(1,'28226',572),(1,'28227',577),(1,'28228',581),(1,'28229',585),(1,'28230',589),(1,'28231',592),(1,'28232',595),(1,'28233',597),(1,'28234',599),(1,'28235',601),(1,'28236',602),(1,'28237',603),(1,'28238',568),(1,'28239',573),(1,'28240',578),(1,'28241',582),(1,'28242',586),(1,'28243',590),(1,'28244',593),(1,'28245',751),(1,'28246',752),(1,'28247',753),(1,'28248',754),(2,'639',639),(2,'640',640),(2,'641',641),(2,'642',642),(3,'10',10),(3,'179',179),(3,'180',180),(3,'181',181),(3,'182',182),(3,'183',183),(3,'187',187),(3,'188',188),(3,'189',189),(3,'190',190),(3,'191',191),(3,'192',192),(3,'193',193),(3,'194',194),(3,'195',195),(3,'196',196),(3,'197',197),(3,'198',198),(3,'199',199),(3,'200',200),(3,'201',201),(3,'202',202),(3,'203',203),(3,'204',204),(3,'205',205),(3,'213',213),(3,'214',214),(3,'219',219),(3,'220',220),(3,'253',253),(3,'279',279),(3,'280',280),(3,'281',281),(3,'298',298),(3,'299',299),(3,'304',304),(3,'307',307),(3,'308',308),(3,'309',309),(3,'310',310),(3,'311',311),(3,'312',312),(3,'313',313),(3,'314',314),(3,'315',315),(3,'316',316),(3,'317',317),(3,'318',318),(3,'319',319),(3,'320',320),(3,'321',321),(3,'322',322),(3,'323',323),(3,'324',324),(3,'325',325),(3,'326',326),(3,'327',327),(3,'328',328),(3,'329',329),(3,'330',330),(3,'331',331),(3,'332',332),(3,'333',333),(3,'334',334),(3,'335',335),(3,'336',336),(3,'337',337),(3,'338',338),(3,'339',339),(3,'340',340),(3,'341',341),(3,'342',342),(3,'343',343),(3,'344',344),(3,'345',345),(3,'346',346),(3,'347',347),(3,'348',348),(3,'349',349),(3,'350',350),(3,'351',351),(3,'352',352),(3,'353',353),(3,'354',354),(3,'355',355),(3,'356',356),(3,'357',357),(3,'358',358),(3,'359',359),(3,'360',360),(3,'361',361),(3,'362',362),(3,'363',363),(3,'364',364),(3,'365',365),(3,'366',366),(3,'367',367),(3,'368',368),(3,'369',369),(3,'370',370),(3,'371',371),(3,'372',372),(3,'373',373),(3,'374',374),(3,'375',375),(3,'376',376),(3,'377',377),(3,'378',378),(3,'379',379),(3,'380',380),(3,'381',381),(3,'382',382),(3,'383',383),(3,'384',384),(3,'385',385),(3,'386',386),(3,'387',387),(3,'388',388),(3,'389',389),(3,'390',390),(3,'391',391),(3,'392',392),(3,'393',393),(3,'394',394),(3,'395',395),(3,'396',396),(3,'397',397),(3,'398',398),(3,'399',399),(3,'400',400),(3,'401',401),(3,'402',402),(3,'403',403),(3,'404',404),(3,'405',405),(3,'406',406),(3,'407',407),(3,'408',408),(3,'409',409),(3,'410',410),(3,'411',411),(3,'412',412),(3,'413',413),(3,'414',414),(3,'415',415),(3,'416',416),(3,'417',417),(3,'418',418),(3,'419',419),(3,'420',420),(3,'421',421),(3,'422',422),(3,'423',423),(3,'424',424),(3,'425',425),(3,'426',426),(3,'427',427),(3,'428',428),(3,'429',429),(3,'430',430),(3,'431',431),(3,'432',432),(3,'433',433),(3,'434',434),(3,'435',435),(3,'436',436),(3,'437',437),(3,'438',438),(3,'439',439),(3,'440',440),(3,'441',441),(3,'442',442),(3,'443',443),(3,'444',444),(3,'445',445),(3,'446',446),(3,'447',447),(3,'448',448),(3,'449',449),(3,'450',450),(3,'451',451),(3,'452',452),(3,'453',453),(3,'454',454),(3,'455',455),(3,'456',456),(3,'457',457),(3,'458',458),(3,'459',459),(3,'460',460),(3,'461',461),(3,'462',462),(3,'463',463),(3,'464',464),(3,'465',465),(3,'466',466),(3,'467',467),(3,'468',468),(3,'469',469),(3,'470',470),(3,'471',471),(3,'472',472),(3,'473',473),(3,'474',474),(3,'475',475),(3,'476',476),(3,'477',477),(3,'478',478),(3,'479',479),(3,'480',480),(3,'481',481),(3,'482',482),(3,'483',483),(3,'484',484),(3,'485',485),(3,'486',486),(3,'487',487),(3,'488',488),(3,'489',489),(3,'490',490),(3,'491',491),(3,'492',492),(3,'493',493),(3,'494',494),(3,'495',495),(3,'496',496),(3,'497',497),(3,'498',498),(3,'499',499),(3,'500',500),(3,'501',501),(3,'502',502),(3,'503',503),(3,'504',504),(3,'505',505),(3,'506',506),(3,'507',507),(3,'508',508),(3,'509',509),(3,'510',510),(3,'511',511),(3,'512',512),(3,'513',513),(3,'514',514),(3,'515',515),(3,'516',516),(3,'517',517),(3,'518',518),(3,'519',519),(3,'520',520),(3,'521',521),(3,'522',522),(3,'523',523),(3,'524',524),(3,'525',525),(3,'526',526),(3,'527',527),(3,'528',528),(3,'529',529),(3,'530',530),(3,'531',531),(3,'532',532),(3,'533',533),(3,'534',534),(3,'535',535),(3,'536',536),(3,'537',537),(3,'538',538),(3,'539',539),(3,'540',540),(3,'541',541),(3,'542',542),(3,'543',543),(3,'544',544),(3,'545',545),(3,'546',546),(3,'547',547),(3,'548',548),(3,'549',549),(3,'550',550),(3,'551',551),(3,'552',552),(3,'553',553),(3,'554',554),(3,'555',555),(3,'556',556),(3,'557',557),(3,'558',558),(3,'559',559),(3,'560',560),(3,'561',561),(3,'562',562),(3,'563',563),(3,'564',564),(3,'565',565),(3,'567',567),(3,'568',568),(3,'569',569),(3,'571',571),(3,'572',572),(3,'573',573),(3,'574',574),(3,'576',576),(3,'577',577),(3,'578',578),(3,'580',580),(3,'581',581),(3,'582',582),(3,'584',584),(3,'585',585),(3,'586',586),(3,'587',587),(3,'589',589),(3,'590',590),(3,'592',592),(3,'593',593),(3,'595',595),(3,'597',597),(3,'599',599),(3,'601',601),(3,'602',602),(3,'603',603),(3,'618',618),(3,'619',619),(3,'620',620),(3,'621',621),(3,'622',622),(3,'623',623),(3,'624',624),(3,'625',625),(3,'626',626),(3,'627',627),(3,'628',628),(3,'629',629),(3,'630',630),(3,'631',631),(3,'632',632),(3,'634',634),(3,'635',635),(3,'636',636),(3,'637',637),(3,'638',638),(3,'639',639),(3,'640',640),(3,'641',641),(3,'642',642),(3,'643',643),(3,'644',644),(3,'645',645),(3,'646',646),(3,'647',647),(3,'648',648),(3,'649',649),(3,'650',650),(3,'651',651),(3,'652',652),(3,'653',653),(3,'654',654),(3,'655',655),(3,'656',656),(3,'657',657),(3,'658',658),(3,'659',659),(3,'660',660),(3,'661',661),(3,'662',662),(3,'663',663),(3,'664',664),(3,'665',665),(3,'666',666),(3,'667',667),(3,'668',668),(3,'669',669),(3,'670',670),(3,'671',671),(3,'722',722),(3,'723',723),(3,'727',727),(3,'728',728),(3,'729',729),(3,'730',730),(3,'731',731),(3,'732',732),(3,'733',733),(3,'734',734),(3,'735',735),(3,'743',743),(3,'744',744),(3,'745',745),(3,'746',746),(3,'747',747),(3,'748',748),(3,'749',749),(3,'750',750),(3,'9',9);
/*!40000 ALTER TABLE `cms3_import_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_offer_list`
--

DROP TABLE IF EXISTS `cms3_import_offer_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_offer_list` (
  `external_id` varchar(255) NOT NULL,
  `internal_id` int(10) unsigned NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `internal id to offer` FOREIGN KEY (`internal_id`) REFERENCES `cms3_offer_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `offer source id to import source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_offer_list`
--

LOCK TABLES `cms3_import_offer_list` WRITE;
/*!40000 ALTER TABLE `cms3_import_offer_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_offer_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_offer_price_list`
--

DROP TABLE IF EXISTS `cms3_import_offer_price_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_offer_price_list` (
  `external_id` varchar(255) NOT NULL,
  `internal_id` int(10) unsigned NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `internal id to price` FOREIGN KEY (`internal_id`) REFERENCES `cms3_offer_price_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `price source id to import source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_offer_price_list`
--

LOCK TABLES `cms3_import_offer_price_list` WRITE;
/*!40000 ALTER TABLE `cms3_import_offer_price_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_offer_price_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_offer_price_type_list`
--

DROP TABLE IF EXISTS `cms3_import_offer_price_type_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_offer_price_type_list` (
  `external_id` varchar(255) NOT NULL,
  `internal_id` int(10) unsigned NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `internal id to price type` FOREIGN KEY (`internal_id`) REFERENCES `cms3_offer_price_type_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `price type source id to import source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_offer_price_type_list`
--

LOCK TABLES `cms3_import_offer_price_type_list` WRITE;
/*!40000 ALTER TABLE `cms3_import_offer_price_type_list` DISABLE KEYS */;
INSERT INTO `cms3_import_offer_price_type_list` VALUES ('1',1,1);
/*!40000 ALTER TABLE `cms3_import_offer_price_type_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_push_message_list`
--

DROP TABLE IF EXISTS `cms3_import_push_message_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_push_message_list` (
  `external_id` varchar(255) NOT NULL,
  `internal_id` int(10) unsigned NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `internal id to message` FOREIGN KEY (`internal_id`) REFERENCES `cms3_push_message_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message source id to import source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_push_message_list`
--

LOCK TABLES `cms3_import_push_message_list` WRITE;
/*!40000 ALTER TABLE `cms3_import_push_message_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_push_message_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_push_subscriber_list`
--

DROP TABLE IF EXISTS `cms3_import_push_subscriber_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_push_subscriber_list` (
  `external_id` varchar(255) NOT NULL,
  `internal_id` int(10) unsigned NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `internal id to subscriber` FOREIGN KEY (`internal_id`) REFERENCES `cms3_push_subscriber_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriber source id to import source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_push_subscriber_list`
--

LOCK TABLES `cms3_import_push_subscriber_list` WRITE;
/*!40000 ALTER TABLE `cms3_import_push_subscriber_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_push_subscriber_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_push_topic_list`
--

DROP TABLE IF EXISTS `cms3_import_push_topic_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_push_topic_list` (
  `external_id` varchar(255) NOT NULL,
  `internal_id` int(10) unsigned NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `internal id to topic` FOREIGN KEY (`internal_id`) REFERENCES `cms3_push_topic_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `topic source id to import source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_push_topic_list`
--

LOCK TABLES `cms3_import_push_topic_list` WRITE;
/*!40000 ALTER TABLE `cms3_import_push_topic_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_push_topic_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_redirects`
--

DROP TABLE IF EXISTS `cms3_import_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_redirects` (
  `external_id` int(11) NOT NULL,
  `internal_id` int(11) NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_redirects_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_redirects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_redirects_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_redirects`
--

LOCK TABLES `cms3_import_redirects` WRITE;
/*!40000 ALTER TABLE `cms3_import_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_relations`
--

DROP TABLE IF EXISTS `cms3_import_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_relations` (
  `source_id` int(10) unsigned NOT NULL,
  `old_id` varchar(255) NOT NULL,
  `new_id` int(10) unsigned NOT NULL,
  KEY `source_id` (`source_id`,`old_id`,`new_id`),
  KEY `old_id` (`old_id`,`new_id`),
  KEY `new_id` (`new_id`),
  CONSTRAINT `FK_NewId_To_HierarchyId` FOREIGN KEY (`new_id`) REFERENCES `cms3_hierarchy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SourceId_To_Source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_relations`
--

LOCK TABLES `cms3_import_relations` WRITE;
/*!40000 ALTER TABLE `cms3_import_relations` DISABLE KEYS */;
INSERT INTO `cms3_import_relations` VALUES (2,'4',4),(2,'5',5),(2,'6',6),(2,'7',7),(2,'8',8),(3,'1',1),(3,'10',10),(3,'11',11),(3,'12',12),(3,'13',13),(3,'14',14),(3,'15',15),(3,'16',16),(3,'17',17),(3,'18',18),(3,'19',19),(3,'2',2),(3,'20',20),(3,'21',21),(3,'22',22),(3,'23',23),(3,'24',24),(3,'25',25),(3,'26',26),(3,'27',27),(3,'28',28),(3,'29',29),(3,'3',3),(3,'30',30),(3,'31',31),(3,'32',32),(3,'33',33),(3,'34',34),(3,'35',35),(3,'36',36),(3,'37',37),(3,'4',4),(3,'5',5),(3,'6',6),(3,'7',7),(3,'8',8),(3,'87',87),(3,'88',88),(3,'9',9);
/*!40000 ALTER TABLE `cms3_import_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_restrictions`
--

DROP TABLE IF EXISTS `cms3_import_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_restrictions` (
  `source_id` int(10) unsigned NOT NULL,
  `old_id` varchar(255) NOT NULL,
  `new_id` int(10) unsigned NOT NULL,
  KEY `source_id` (`source_id`,`old_id`,`new_id`),
  KEY `old_id` (`old_id`,`new_id`),
  KEY `new_id` (`new_id`),
  CONSTRAINT `FK_NewId_To_RestrictionId` FOREIGN KEY (`new_id`) REFERENCES `cms3_object_fields_restrictions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RestrictionSourceId_To_Source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_restrictions`
--

LOCK TABLES `cms3_import_restrictions` WRITE;
/*!40000 ALTER TABLE `cms3_import_restrictions` DISABLE KEYS */;
INSERT INTO `cms3_import_restrictions` VALUES (1,'1',6),(1,'2',3),(1,'3',4),(1,'4',1),(1,'5',2),(1,'7',5);
/*!40000 ALTER TABLE `cms3_import_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_sliders`
--

DROP TABLE IF EXISTS `cms3_import_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_sliders` (
  `external_id` int(10) unsigned NOT NULL,
  `internal_id` int(10) unsigned NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_sliders_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_sliders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_sliders_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_sliders`
--

LOCK TABLES `cms3_import_sliders` WRITE;
/*!40000 ALTER TABLE `cms3_import_sliders` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_slides`
--

DROP TABLE IF EXISTS `cms3_import_slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_slides` (
  `external_id` int(10) unsigned NOT NULL,
  `internal_id` int(10) unsigned NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_slides_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_slides` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_slides_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_slides`
--

LOCK TABLES `cms3_import_slides` WRITE;
/*!40000 ALTER TABLE `cms3_import_slides` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_sources`
--

DROP TABLE IF EXISTS `cms3_import_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_sources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `source_name` (`source_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_sources`
--

LOCK TABLES `cms3_import_sources` WRITE;
/*!40000 ALTER TABLE `cms3_import_sources` DISABLE KEYS */;
INSERT INTO `cms3_import_sources` VALUES (3,'demotractor'),(2,'rss'),(1,'system');
/*!40000 ALTER TABLE `cms3_import_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_stock_balance_list`
--

DROP TABLE IF EXISTS `cms3_import_stock_balance_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_stock_balance_list` (
  `external_id` varchar(255) NOT NULL,
  `internal_id` int(10) unsigned NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `internal id to stock balance` FOREIGN KEY (`internal_id`) REFERENCES `cms3_stock_balance_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock balance source id to import source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_stock_balance_list`
--

LOCK TABLES `cms3_import_stock_balance_list` WRITE;
/*!40000 ALTER TABLE `cms3_import_stock_balance_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_stock_balance_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_templates`
--

DROP TABLE IF EXISTS `cms3_import_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_templates` (
  `source_id` int(10) unsigned NOT NULL,
  `old_id` varchar(255) NOT NULL,
  `new_id` int(10) unsigned NOT NULL,
  KEY `source_id` (`source_id`,`old_id`,`new_id`),
  KEY `old_id` (`old_id`,`new_id`),
  KEY `new_id` (`new_id`),
  CONSTRAINT `FK_NewId_To_TemplateId` FOREIGN KEY (`new_id`) REFERENCES `cms3_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TemplateSourceId_To_Source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_templates`
--

LOCK TABLES `cms3_import_templates` WRITE;
/*!40000 ALTER TABLE `cms3_import_templates` DISABLE KEYS */;
INSERT INTO `cms3_import_templates` VALUES (2,'1',1),(3,'1',1);
/*!40000 ALTER TABLE `cms3_import_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_types`
--

DROP TABLE IF EXISTS `cms3_import_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_import_types` (
  `source_id` int(10) unsigned NOT NULL,
  `old_id` varchar(255) NOT NULL,
  `new_id` int(10) unsigned NOT NULL,
  KEY `source_id` (`source_id`,`old_id`,`new_id`),
  KEY `old_id` (`old_id`,`new_id`),
  KEY `new_id` (`new_id`),
  CONSTRAINT `FK_NewId_To_ObjectTypeId` FOREIGN KEY (`new_id`) REFERENCES `cms3_object_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TypeSourceId_To_Source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_types`
--

LOCK TABLES `cms3_import_types` WRITE;
/*!40000 ALTER TABLE `cms3_import_types` DISABLE KEYS */;
INSERT INTO `cms3_import_types` VALUES (1,'10',61),(1,'11',87),(1,'18',7),(1,'21',5),(1,'22',8),(1,'23',60),(1,'34',59),(1,'39',71),(1,'4',54),(1,'40',72),(1,'5',89),(1,'6',39),(1,'648',67),(1,'649',68),(1,'650',69),(1,'651',70),(1,'671',88),(1,'672',90),(1,'673',91),(1,'674',9),(1,'675',92),(1,'680',82),(1,'681',83),(1,'682',84),(1,'683',85),(1,'688',64),(1,'689',62),(1,'693',10),(1,'696',77),(1,'697',78),(1,'699',79),(1,'7',1),(1,'700',80),(1,'701',81),(1,'702',94),(1,'739',11),(1,'740',74),(1,'741',75),(1,'742',76),(1,'743',93),(1,'745',2),(1,'746',63),(1,'747',65),(1,'748',66),(1,'750',73),(1,'751',45),(1,'752',52),(1,'753',48),(1,'754',55),(1,'755',53),(1,'756',44),(1,'757',43),(1,'760',104),(1,'762',30),(1,'765',42),(1,'767',32),(1,'768',56),(1,'770',31),(1,'772',33),(1,'773',34),(1,'777',106),(1,'779',41),(1,'780',21),(1,'781',51),(1,'782',50),(1,'783',112),(1,'784',113),(1,'787',46),(1,'788',47),(1,'791',116),(1,'792',12),(1,'793',13),(1,'794',107),(1,'795',108),(1,'796',109),(1,'797',110),(1,'798',57),(1,'799',111),(1,'8',4),(1,'800',105),(1,'801',117),(1,'802',118),(1,'803',40),(1,'804',130),(1,'805',131),(1,'806',35),(1,'807',36),(1,'808',114),(1,'809',14),(1,'810',15),(1,'812',119),(1,'814',16),(1,'815',17),(1,'816',121),(1,'817',49),(1,'818',18),(1,'819',96),(1,'822',37),(1,'823',38),(1,'824',122),(1,'826',123),(1,'830',23),(1,'831',24),(1,'832',6),(1,'837',127),(1,'838',25),(1,'839',58),(1,'840',26),(1,'841',98),(1,'842',115),(1,'843',95),(1,'844',27),(1,'845',128),(1,'846',28),(1,'847',29),(1,'848',97),(1,'849',129),(1,'850',132),(1,'851',133),(1,'9',86),(1,'{root-pages-type}',3),(2,'60',60),(2,'{root-pages-type}',3),(3,'1',1),(3,'10',10),(3,'100',100),(3,'101',101),(3,'102',102),(3,'103',103),(3,'12',12),(3,'13',13),(3,'2',2),(3,'21',21),(3,'25',25),(3,'27',27),(3,'28',28),(3,'29',29),(3,'30',30),(3,'39',39),(3,'40',40),(3,'41',41),(3,'42',42),(3,'43',43),(3,'44',44),(3,'45',45),(3,'46',46),(3,'47',47),(3,'48',48),(3,'49',49),(3,'50',50),(3,'51',51),(3,'52',52),(3,'53',53),(3,'54',54),(3,'55',55),(3,'59',59),(3,'60',60),(3,'61',61),(3,'7',7),(3,'73',73),(3,'74',74),(3,'75',75),(3,'76',76),(3,'77',77),(3,'78',78),(3,'86',86),(3,'87',87),(3,'95',95),(3,'99',99),(3,'{root-pages-type}',3);
/*!40000 ALTER TABLE `cms3_import_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_langs`
--

DROP TABLE IF EXISTS `cms3_langs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_langs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(16) NOT NULL,
  `title` varchar(255) NOT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prefix` (`prefix`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_langs`
--

LOCK TABLES `cms3_langs` WRITE;
/*!40000 ALTER TABLE `cms3_langs` DISABLE KEYS */;
INSERT INTO `cms3_langs` VALUES (1,'ru','Русский',1),(2,'en','English',0);
/*!40000 ALTER TABLE `cms3_langs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_links`
--

DROP TABLE IF EXISTS `cms3_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_links` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(1024) NOT NULL,
  `address_hash` varchar(32) NOT NULL,
  `place` varchar(255) NOT NULL,
  `broken` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_hash` (`address_hash`),
  KEY `broken` (`broken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_links`
--

LOCK TABLES `cms3_links` WRITE;
/*!40000 ALTER TABLE `cms3_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_links_sources`
--

DROP TABLE IF EXISTS `cms3_links_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_links_sources` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `link_id` int(11) unsigned NOT NULL,
  `place` varchar(255) NOT NULL,
  `type` enum('object','template') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link_source` (`link_id`,`place`),
  CONSTRAINT `source link_id` FOREIGN KEY (`link_id`) REFERENCES `cms3_links` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_links_sources`
--

LOCK TABLES `cms3_links_sources` WRITE;
/*!40000 ALTER TABLE `cms3_links_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_links_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_mail_notifications`
--

DROP TABLE IF EXISTS `cms3_mail_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_mail_notifications` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_id` int(10) unsigned NOT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name-domain-lang` (`name`,`domain_id`,`lang_id`),
  KEY `lang_id` (`lang_id`),
  KEY `domain_id` (`domain_id`),
  KEY `name` (`name`),
  CONSTRAINT `notification to domain` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notification to lang` FOREIGN KEY (`lang_id`) REFERENCES `cms3_langs` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_mail_notifications`
--

LOCK TABLES `cms3_mail_notifications` WRITE;
/*!40000 ALTER TABLE `cms3_mail_notifications` DISABLE KEYS */;
INSERT INTO `cms3_mail_notifications` VALUES (1,1,1,'notification-new-record-admin','appointment'),(2,1,1,'notification-new-record-user','appointment'),(3,1,1,'notification-record-status-changed-user','appointment'),(4,1,1,'notification-banners-expiration-date','banners'),(5,1,1,'notification-blogs-post-comment','blogs20'),(6,1,1,'notification-blogs-comment-comment','blogs20'),(7,1,1,'notification-content-expiration-date','content'),(8,1,1,'notification-content-unpublish-page','content'),(9,1,1,'notification-dispatches-release','dispatches'),(10,1,1,'notification-dispatches-subscribe','dispatches'),(11,1,1,'notification-emarket-status-change','emarket'),(12,1,1,'notification-emarket-new-order','emarket'),(13,1,1,'notification-emarket-invoice','emarket'),(14,1,1,'notification-faq-answer','faq'),(15,1,1,'notification-faq-confirm-user','faq'),(16,1,1,'notification-faq-confirm-admin','faq'),(17,1,1,'notification-forum-new-message','forum'),(18,1,1,'notification-users-new-registration-admin','users'),(19,1,1,'notification-users-restore-password','users'),(20,1,1,'notification-users-registered','users'),(21,1,1,'notification-users-registered-no-activation','users'),(22,1,1,'notification-users-new-password','users');
/*!40000 ALTER TABLE `cms3_mail_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_mail_templates`
--

DROP TABLE IF EXISTS `cms3_mail_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_mail_templates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `notification_id` int(11) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `content` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name-notification` (`name`,`notification_id`),
  KEY `name` (`name`),
  KEY `notification_id` (`notification_id`),
  CONSTRAINT `mail template to notification` FOREIGN KEY (`notification_id`) REFERENCES `cms3_mail_notifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_mail_templates`
--

LOCK TABLES `cms3_mail_templates` WRITE;
/*!40000 ALTER TABLE `cms3_mail_templates` DISABLE KEYS */;
INSERT INTO `cms3_mail_templates` VALUES (1,1,'new-record-admin-notify-content','content','<table style=\"max-width: 400px; width: 100%;\">\n  <tbody>\n    <tr>\n      <td>Имя</td>\n      <td>%name%</td>\n    </tr>\n    <tr>\n      <td>Телефон</td>\n      <td>%phone%</td>\n    </tr>\n    <tr>\n      <td>E-Mail</td>\n      <td>%email%</td>\n    </tr>\n    <tr>\n      <td>Комментарий</td>\n      <td>%comment%</td>\n    </tr>\n    <tr>\n      <td>Дата</td>\n      <td>%date%</td>\n    </tr>\n    <tr>\n      <td>Время</td>\n      <td>%time%</td>\n    </tr>\n    <tr>\n      <td>Услуга</td>\n      <td>%service%</td>\n    </tr>\n    <tr>\n      <td>Категория</td>\n      <td>%category%</td>\n    </tr>\n    <tr>\n      <td>Специалист</td>\n      <td>%specialist%</td>\n  </tr>\n  </tbody>\n</table>'),(2,1,'new-record-admin-notify-subject','subject','Запись на приём \\ %category% \\ %service% \\'),(3,2,'new-record-user-notify-content','content','<table style=\"max-width: 400px; width: 100%;\">\n  <tbody>\n    <tr>\n      <td>Дата</td>\n      <td>%date%</td>\n    </tr>\n    <tr>\n      <td>Время</td>\n      <td>%time%</td>\n    </tr>\n    <tr>\n      <td>Услуга</td>\n      <td>%service%</td>\n    </tr>\n    <tr>\n      <td>Категория</td>\n      <td>%category%</td>\n    </tr>\n    <tr>\n      <td>Специалист</td>\n      <td>%specialist%</td>\n    </tr>\n  </tbody>\n</table>'),(4,2,'new-record-user-notify-subject','subject','Вы записались на приём \\ %category% \\ %service% \\'),(5,3,'record-status-changed-user-notify-content','content','<table style=\"max-width: 400px; width: 100%;\">\n  <tbody>\n    <tr>\n      <td>Группа</td>\n      <td>%category%</td>\n    </tr>\n    <tr>\n      <td>Услуга</td>\n      <td>%service%</td>\n    </tr>\n    <tr>\n      <td>Дата</td>\n      <td>%date%&nbsp;</td>\n    </tr>\n    <tr>\n      <td>Время</td>\n      <td>&nbsp;%time%</td>\n    </tr>\n    <tr>\n      <td>Специалист</td>\n      <td>%specialist%</td>\n    </tr>\n    <tr>\n      <td>Статус</td>\n      <td>%new-status%</td>\n    </tr>\n  </tbody>\n</table>'),(6,3,'record-status-changed-user-notify-subject','subject','Ваша заявка на запись \\ %category% \\ %service% \\ была обновлена'),(7,4,'banners-expiration-date-subject','subject','Оповещение о приближении окончания показа баннеров'),(8,4,'banners-expiration-date-content','content','У следующих баннеров истекает срок показа:<br>%parse.banners-expiration-date-item.items%'),(9,4,'banners-expiration-date-item','item','%bannerName% %tillDate% Ссылка для редактирования: <a href=\"%link%\">%link%</a><br>'),(10,5,'blogs-post-comment-subject','subject','Новый ответ на Вашу публикацию'),(11,5,'blogs-post-comment-content','content','%name%, на Вашу публикацию получен новый ответ.<br>\nПосмотреть его Вы можете, перейдя по ссылке:<br><a href=\"%link%\">%link%</a>'),(12,6,'blogs-comment-comment-subject','subject','Новый ответ на Ваш комментарий'),(13,6,'blogs-comment-comment-content','content','%name%, на Ваш комментарий получен новый ответ.<br>\nПосмотреть его Вы можете, перейдя по ссылке:<br><a href=\"%link%\">%link%</a>'),(14,7,'content-expiration-date-subject','subject','Оповещение о приближении окончания публикации'),(15,7,'content-expiration-date-content','content','У страницы <a href=\"%page_link%\">%page_header%</a><br>приближается время потери актуальности<br>Комментарии к публикации: <br><p>%publish_comments%</p>'),(16,8,'content-unpublish-page-subject','subject','Оповещение о снятии страницы с публикации'),(17,8,'content-unpublish-page-content','content','Страница <a href=\"%page_link%\">%page_header%</a><br> снята с публикации<br>\n    Комментарии к публикации: <br />\n    <p>%publish_comments%</p>'),(18,9,'dispatches-release-subject','subject','Новая рассылка: %header%'),(19,9,'dispatches-release-content','content','%parse.dispatches-release-message.messages%<hr><b>Отписаться:</b> Отписаться от рассылки можно <a href=\"%unsubscribe_link%\">по этой ссылке</a>'),(20,9,'dispatches-release-message','message','<h3>%header%</h3>%body%<hr>'),(21,10,'dispatches-subscribe-subject','subject','Подписка на рассылку'),(22,10,'dispatches-subscribe-content','content','<p>Доброго времени суток!</p><p>Вы подписались на рассылку.</p><p>Если вы не хотите ее получать, перейдите по этой ссылке: <a href=\"%unsubscribe_link%\">%unsubscribe_link%</a></p>'),(23,11,'emarket-status-notification-subject','subject','%header%'),(24,11,'emarket-status-notification-content','content','<p>Ваш заказ #%order_number% %status%</p>\n<div>\n  <hr/>\n  <p>Товары:</p>\n  %parse.emarket-status-notification-item.items%\n  <hr/>\n  <p>Всего товаров: %total_amount% шт.</p>\n  <p>На сумму: %total_price% %suffix%. </p>\n</div>\nПосмотреть историю заказов вы можете в своем <a href=\"http://%domain%/emarket/personal/\">личном кабинете</a>.'),(25,11,'emarket-status-notification-receipt','content','<p>Ваш заказ #%order_number% %status%</p>\n<div>\n  <hr/>\n  <p>Товары:</p>\n  %parse.emarket-status-notification-item.items%\n  <hr/>\n  <p>Всего товаров: %total_amount% шт.</p>\n  <p>На сумму: %total_price% %suffix%. </p>\n</div>\n    Посмотреть историю заказов вы можете в своем <a href=\"http://%domain%/emarket/personal/\">личном кабинете</a>.\n    <br/><br/>\n    Квитанцию на оплату вы можете получить, перейдя по <a href=\"http://%domain%/emarket/receipt/%order_id%/%receipt_signature%/\">этой ссылке</a>.'),(26,11,'emarket-status-notification-item','content','<p><a href=\"%link%\">%name%</a></p>\n<p>Цена:  %price% %suffix%. Количество: %amount% шт.</p>'),(27,12,'emarket-neworder-notification-subject','subject','%header%'),(28,12,'emarket-neworder-notification-content','content','Поступил новый заказ #%order_number% (<a href=\"http://%domain%/admin/emarket/order_edit/%order_id%/\">Просмотр</a>)\n    <br/><br/>\n<div>\n  <hr/>\n  <p>Товары:</p>\n  %parse.emarket-neworder-notification-item.items%\n  <hr/>\n  <p>Всего товаров: %total_amount% шт.</p>\n  <p>На сумму: %total_price% %suffix%. </p>\n</div>\n\n<div>\n  <p>Информация о покупателе:</p>\n  <p>Имя: %first_name%</p>\n  <p>Фамилия: %last_name%</p>\n  <p>email: %email%</p>\n  <p>Телефон: %phone%</p>\n\n  <p>Способ доставки: %delivery%</p>\n  <p>Адрес доставки: %address%</p>\n</div>\n\n  <p>Способ оплаты: %payment_type%</p>\n  <p>Статус оплаты: %payment_status%</p>'),(29,12,'emarket-neworder-notification-item','content','<p><a href=\"%link%\">%name%</a></p>\n<p>Цена:  %price% %suffix%. Количество: %amount% шт.</p>'),(30,13,'emarket-invoice-subject','subject','На сайте %domain% успешно сформирован счет'),(31,13,'emarket-invoice-content','content','Вы можете распечатать счет для юридических лиц, перейдя по следующей ссылке:\n    <p>\n      <a href=\"http://%domain%%invoice_link%\">http://%domain%%invoice_link%</a>\n    </p>'),(32,14,'faq-answer-subject','subject','[#%ticket%] Ответ на Ваш вопрос'),(33,14,'faq-answer-content','content','Здравствуйте, <br /><br />\n\nОтвет на Ваш вопрос Вы можете прочитать по следующему адресу:<br />\n<a href=\"%question_link%\">%question_link%</a><br />\n\n<br /><hr />\nС уважением, <br />\nАдминистрация сайта <b>%domain%</b>'),(34,15,'faq-confirm-user-subject','subject','Спасибо за Ваш вопрос'),(35,15,'faq-confirm-user-content','content','Вашему вопросу присвоен тикет #%ticket% <br />\nМы ответим Вам в ближайшее время.<br />\n<br /><hr />\nС уважением, <br />\nАдминистрация сайта <b>%domain%</b>'),(36,16,'faq-confirm-admin-subject','subject','Новый вопрос в FAQ'),(37,16,'faq-confirm-admin-content','content','В базу знаний поступил новый вопрос:<br />\n<a href=\"%question_link%\">%question_link%</a><br />\n<hr />\n%question%\n<hr />'),(38,17,'forum-new-message-subject','subject','Новое сообщение на форуме'),(39,17,'forum-new-message-content','content','<h1>%h1%</h1>\n%message%'),(40,18,'users-new-registration-admin-subject','subject','Зарегистрировался новый пользователь'),(41,18,'users-new-registration-admin-content','content','<p>Зарегистрировался новый пользователь \"%login%\".</p>'),(42,19,'users-restore-password-subject','subject','Восстановление пароля'),(43,19,'users-restore-password-content','content','<p>\n    Здравствуйте!<br />\n    Кто-то, возможно Вы, пытается восстановить пароль для пользователя \"%login%\" на сайте <a href=\"http://%domain%\">%domain%</a>.\n  </p>\n\n\n  <p>\n    Если это не Вы, просто проигнорируйте данное письмо.\n  </p>\n\n  <p>\n    Если Вы действительно хотите восстановить пароль, кликните по этой ссылке:<br />\n    <a href=\"%restore_link%\">%restore_link%</a>\n  </p>\n\n  <p>\n    С уважением,<br />\n    <b>Администрация сайта <a href=\"http://%domain%\">%domain%</a></b>\n  </p>'),(44,20,'users-registered-subject','subject','Регистрация на UMI.CMS Demo Site'),(45,20,'users-registered-content','content','<p>\n    Здравствуйте, %lname% %fname% %father_name%, <br />\n    Вы зарегистрировались на сайте <a href=\"http://%domain%\">%domain%</a>.\n  </p>\n\n\n  <p>\n    Логин: %login%<br />\n    Пароль: %password%\n  </p>\n\n\n  <p>\n    <div class=\"notice\">\n      Чтобы активировать Ваш аккаунт, необходимо перейти по ссылке, либо скопировать ее в адресную строку браузера:<br />\n      <a href=\"%activate_link%\">%activate_link%</a>\n    </div>\n  </p>'),(46,21,'users-registered-no-activation-subject','subject','Регистрация на сайте %domain%'),(47,21,'users-registered-no-activation-content','content','<p>\n    Здравствуйте, %lname% %fname% %father_name%, <br />\n    Вы зарегистрировались на сайте <a href=\"http://%domain%\">%domain%</a>.\n  </p>\n  <p>\n    Логин: %login%<br />\n    Пароль: %password%\n  </p>'),(48,22,'users-new-password-subject','subject','Новый пароль для сайта'),(49,22,'users-new-password-content','content','<p>\n    Здравствуйте!<br />\n\n    Ваш новый пароль от сайта <a href=\"http://%domain%\">%domain%</a>.\n  </p>\n\n\n  <p>\n    Логин:  %login%<br />\n    Пароль: %password%\n  </p>\n\n  <p>\n    С уважением,<br />\n    <b>Администрация сайта <a href=\"http://%domain%\">%domain%</a></b>\n  </p>');
/*!40000 ALTER TABLE `cms3_mail_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_mail_variables`
--

DROP TABLE IF EXISTS `cms3_mail_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_mail_variables` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(11) unsigned NOT NULL,
  `variable` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_name` (`variable`),
  KEY `template_name` (`template_id`),
  CONSTRAINT `mail variable to template` FOREIGN KEY (`template_id`) REFERENCES `cms3_mail_templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_mail_variables`
--

LOCK TABLES `cms3_mail_variables` WRITE;
/*!40000 ALTER TABLE `cms3_mail_variables` DISABLE KEYS */;
INSERT INTO `cms3_mail_variables` VALUES (1,1,'category'),(2,1,'service'),(3,1,'name'),(4,1,'phone'),(5,1,'email'),(6,1,'comment'),(7,1,'date'),(8,1,'time'),(9,1,'specialist'),(10,2,'category'),(11,2,'service'),(12,3,'category'),(13,3,'service'),(14,3,'date'),(15,3,'time'),(16,3,'specialist'),(17,4,'category'),(18,4,'service'),(19,5,'category'),(20,5,'service'),(21,5,'date'),(22,5,'time'),(23,5,'specialist'),(24,5,'new-status'),(25,6,'category'),(26,6,'service'),(27,8,'parse.banners-expiration-date-item.items'),(28,9,'bannerName'),(29,9,'tillDate'),(30,9,'link'),(31,10,'name'),(32,10,'link'),(33,11,'name'),(34,11,'link'),(35,12,'name'),(36,12,'link'),(37,13,'name'),(38,13,'link'),(39,15,'page_link'),(40,15,'page_header'),(41,15,'publish_comments'),(42,17,'page_link'),(43,17,'page_header'),(44,17,'publish_comments'),(45,18,'header'),(46,19,'header'),(47,19,'parse.dispatches-release-message.messages'),(48,19,'unsubscribe_link'),(49,20,'header'),(50,20,'id'),(51,20,'body'),(52,22,'unsubscribe_link'),(53,23,'header'),(54,24,'order_id'),(55,24,'order_name'),(56,24,'order_number'),(57,24,'domain'),(58,24,'total_amount'),(59,24,'total_price'),(60,24,'suffix'),(61,24,'parse.emarket-status-notification-item.items'),(62,24,'status'),(63,24,'personal_params'),(64,25,'order_id'),(65,25,'order_name'),(66,25,'order_number'),(67,25,'domain'),(68,25,'total_amount'),(69,25,'total_price'),(70,25,'suffix'),(71,25,'parse.emarket-status-notification-item.items'),(72,25,'status'),(73,25,'personal_params'),(74,25,'receipt_signature'),(75,26,'link'),(76,26,'name'),(77,26,'price'),(78,26,'suffix'),(79,26,'amount'),(80,27,'header'),(81,28,'order_id'),(82,28,'order_name'),(83,28,'order_number'),(84,28,'domain'),(85,28,'total_amount'),(86,28,'total_price'),(87,28,'suffix'),(88,28,'parse.emarket-neworder-notification-item.items'),(89,28,'payment_type'),(90,28,'payment_status'),(91,28,'first_name'),(92,28,'last_name'),(93,28,'email'),(94,28,'phone'),(95,28,'delivery'),(96,28,'address'),(97,29,'link'),(98,29,'name'),(99,29,'price'),(100,29,'suffix'),(101,29,'amount'),(102,30,'domain'),(103,30,'invoice_link'),(104,31,'domain'),(105,31,'invoice_link'),(106,32,'domain'),(107,32,'element_id'),(108,32,'author_id'),(109,32,'question_link'),(110,32,'ticket'),(111,33,'domain'),(112,33,'element_id'),(113,33,'author_id'),(114,33,'question_link'),(115,33,'ticket'),(116,34,'domain'),(117,34,'question'),(118,34,'ticket'),(119,35,'domain'),(120,35,'question'),(121,35,'ticket'),(122,36,'domain'),(123,36,'question'),(124,36,'question_link'),(125,37,'domain'),(126,37,'question'),(127,37,'question_link'),(128,39,'h1'),(129,39,'message'),(130,39,'unsubscribe_link'),(131,40,'user_id'),(132,40,'login'),(133,41,'user_id'),(134,41,'login'),(135,42,'domain'),(136,42,'restore_link'),(137,42,'email'),(138,42,'login'),(139,43,'domain'),(140,43,'restore_link'),(141,43,'email'),(142,43,'login'),(143,44,'user_id'),(144,44,'domain'),(145,44,'login'),(146,44,'activate_link'),(147,44,'password'),(148,44,'lname'),(149,44,'fname'),(150,44,'father_name'),(151,45,'user_id'),(152,45,'domain'),(153,45,'login'),(154,45,'activate_link'),(155,45,'password'),(156,45,'lname'),(157,45,'fname'),(158,45,'father_name'),(159,46,'user_id'),(160,46,'domain'),(161,46,'login'),(162,46,'activate_link'),(163,46,'password'),(164,46,'lname'),(165,46,'fname'),(166,46,'father_name'),(167,47,'user_id'),(168,47,'domain'),(169,47,'login'),(170,47,'activate_link'),(171,47,'password'),(172,47,'lname'),(173,47,'fname'),(174,47,'father_name'),(175,48,'domain'),(176,48,'login'),(177,48,'password'),(178,49,'domain'),(179,49,'login'),(180,49,'password');
/*!40000 ALTER TABLE `cms3_mail_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_messages`
--

DROP TABLE IF EXISTS `cms3_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `sender_id` int(10) unsigned DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `type` enum('private','sys-event','sys-log') NOT NULL,
  `priority` int(11) DEFAULT '0',
  `is_sended` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `create_time` (`create_time`),
  KEY `priority` (`priority`),
  KEY `type` (`type`),
  KEY `is_sended` (`is_sended`),
  KEY `FK_Messages to user relation` (`sender_id`),
  CONSTRAINT `FK_Messages to user relation` FOREIGN KEY (`sender_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_messages`
--

LOCK TABLES `cms3_messages` WRITE;
/*!40000 ALTER TABLE `cms3_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_messages_inbox`
--

DROP TABLE IF EXISTS `cms3_messages_inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_messages_inbox` (
  `message_id` int(10) unsigned DEFAULT NULL,
  `recipient_id` int(10) unsigned DEFAULT NULL,
  `is_opened` int(11) DEFAULT '0',
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `is_opened` (`is_opened`),
  KEY `FK_MessagesInbox to Messages` (`message_id`),
  KEY `FK_MessagesInbox to User` (`recipient_id`),
  CONSTRAINT `FK_MessagesInbox to Messages` FOREIGN KEY (`message_id`) REFERENCES `cms3_messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MessagesInbox to User` FOREIGN KEY (`recipient_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_messages_inbox`
--

LOCK TABLES `cms3_messages_inbox` WRITE;
/*!40000 ALTER TABLE `cms3_messages_inbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_messages_inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_content`
--

DROP TABLE IF EXISTS `cms3_object_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_object_content` (
  `obj_id` int(10) unsigned DEFAULT NULL,
  `field_id` int(10) unsigned DEFAULT NULL,
  `int_val` bigint(20) DEFAULT NULL,
  `varchar_val` varchar(255) DEFAULT NULL,
  `text_val` mediumtext,
  `rel_val` int(10) unsigned DEFAULT NULL,
  `tree_val` int(10) unsigned DEFAULT NULL,
  `float_val` double DEFAULT NULL,
  KEY `Content to object relation_FK` (`obj_id`),
  KEY `Contents field id relation_FK` (`field_id`),
  KEY `Relation value reference_FK` (`rel_val`),
  KEY `content2tree_FK` (`tree_val`),
  KEY `int_val` (`int_val`),
  KEY `varchar_val` (`varchar_val`),
  KEY `float_val` (`float_val`),
  KEY `text_val` (`text_val`(8)),
  KEY `K_Complex_FieldIdAndRelVal` (`field_id`,`rel_val`),
  KEY `K_Complex_FieldIdAndTreeVal` (`field_id`,`tree_val`),
  KEY `K_Complex_ObjIdAndFieldId` (`obj_id`,`field_id`),
  CONSTRAINT `FK_Content to object relation` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Contents field id relation` FOREIGN KEY (`field_id`) REFERENCES `cms3_object_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Relation value reference` FOREIGN KEY (`rel_val`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_content2tree` FOREIGN KEY (`tree_val`) REFERENCES `cms3_hierarchy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_content`
--

LOCK TABLES `cms3_object_content` WRITE;
/*!40000 ALTER TABLE `cms3_object_content` DISABLE KEYS */;
INSERT INTO `cms3_object_content` VALUES (1,76,NULL,'Демонстрационный магазин UMI.CMS',NULL,NULL,NULL,NULL),(1,77,1,NULL,NULL,NULL,NULL,NULL),(1,73,NULL,'vkontakte',NULL,NULL,NULL,NULL),(6,29,NULL,'low',NULL,NULL,NULL,NULL),(7,29,NULL,'normal',NULL,NULL,NULL,NULL),(8,29,NULL,'high',NULL,NULL,NULL,NULL),(9,30,NULL,'US',NULL,NULL,NULL,NULL),(10,30,NULL,'RU',NULL,NULL,NULL,NULL),(179,34,NULL,'item',NULL,NULL,NULL,NULL),(179,60,NULL,'Скидки этого типа могут быть применены к товарам, либо разделам в каталоге',NULL,NULL,NULL,NULL),(180,34,NULL,'order',NULL,NULL,NULL,NULL),(180,60,NULL,'Данный тип скидок используется для расчета итоговой цены заказа',NULL,NULL,NULL,NULL),(181,79,NULL,'Супервайзеры',NULL,NULL,NULL,NULL),(182,209,1,NULL,NULL,NULL,NULL,NULL),(182,210,1445595536,NULL,NULL,NULL,NULL,NULL),(182,214,0,NULL,NULL,NULL,NULL,NULL),(182,217,NULL,'content,users,emarket,catalog,data,trash',NULL,NULL,NULL,NULL),(183,34,NULL,'bonus',NULL,NULL,NULL,NULL),(183,60,NULL,'Зачисление бонусов за оплаченный заказ',NULL,NULL,NULL,NULL),(184,61,NULL,'proc',NULL,NULL,NULL,NULL),(184,62,56,NULL,NULL,NULL,NULL,NULL),(184,64,NULL,'emarket-discountmodificator-768',NULL,NULL,NULL,NULL),(185,235,1,NULL,NULL,NULL,NULL,NULL),(186,66,NULL,'items',NULL,NULL,NULL,NULL),(186,69,NULL,'emarket-discountrule-777',NULL,NULL,NULL,NULL),(187,87,NULL,'digital',NULL,NULL,NULL,NULL),(188,87,NULL,'optioned',NULL,NULL,NULL,NULL),(189,132,NULL,'self',NULL,NULL,NULL,NULL),(189,134,NULL,'emarket-delivery-783',NULL,NULL,NULL,NULL),(190,132,NULL,'courier',NULL,NULL,NULL,NULL),(190,134,NULL,'emarket-delivery-784',NULL,NULL,NULL,NULL),(191,112,NULL,'receipt',NULL,NULL,NULL,NULL),(191,114,NULL,'emarket-payment-791',NULL,NULL,NULL,NULL),(192,40,NULL,'canceled',NULL,NULL,NULL,NULL),(192,111,50,NULL,NULL,NULL,NULL,NULL),(193,40,NULL,'rejected',NULL,NULL,NULL,NULL),(193,111,40,NULL,NULL,NULL,NULL,NULL),(194,40,NULL,'payment',NULL,NULL,NULL,NULL),(194,111,60,NULL,NULL,NULL,NULL,NULL),(195,40,NULL,'delivery',NULL,NULL,NULL,NULL),(195,111,70,NULL,NULL,NULL,NULL,NULL),(196,40,NULL,'waiting',NULL,NULL,NULL,NULL),(196,111,100,NULL,NULL,NULL,NULL,NULL),(197,40,NULL,'accepted',NULL,NULL,NULL,NULL),(197,111,80,NULL,NULL,NULL,NULL,NULL),(198,40,NULL,'ready',NULL,NULL,NULL,NULL),(198,111,30,NULL,NULL,NULL,NULL,NULL),(199,40,NULL,'waiting_shipping',NULL,NULL,NULL,NULL),(199,111,40,NULL,NULL,NULL,NULL,NULL),(200,40,NULL,'shipping',NULL,NULL,NULL,NULL),(200,111,50,NULL,NULL,NULL,NULL,NULL),(201,40,NULL,'ready',NULL,NULL,NULL,NULL),(201,111,60,NULL,NULL,NULL,NULL,NULL),(202,40,NULL,'initialized',NULL,NULL,NULL,NULL),(202,111,40,NULL,NULL,NULL,NULL,NULL),(203,40,NULL,'validated',NULL,NULL,NULL,NULL),(203,111,60,NULL,NULL,NULL,NULL,NULL),(204,40,NULL,'declined',NULL,NULL,NULL,NULL),(204,111,70,NULL,NULL,NULL,NULL,NULL),(205,40,NULL,'accepted',NULL,NULL,NULL,NULL),(205,111,50,NULL,NULL,NULL,NULL,NULL),(206,66,NULL,'dateRange',NULL,NULL,NULL,NULL),(206,69,NULL,'emarket-discountrule-794',NULL,NULL,NULL,NULL),(207,66,NULL,'orderPrice',NULL,NULL,NULL,NULL),(207,69,NULL,'emarket-discountrule-795',NULL,NULL,NULL,NULL),(208,66,NULL,'allOrdersPrices',NULL,NULL,NULL,NULL),(208,69,NULL,'emarket-discountrule-796',NULL,NULL,NULL,NULL),(209,66,NULL,'userGroups',NULL,NULL,NULL,NULL),(209,69,NULL,'emarket-discountrule-797',NULL,NULL,NULL,NULL),(210,66,NULL,'users',NULL,NULL,NULL,NULL),(210,67,57,NULL,NULL,NULL,NULL,NULL),(210,69,NULL,'emarket-discountrule-798',NULL,NULL,NULL,NULL),(211,66,NULL,'relatedItems',NULL,NULL,NULL,NULL),(211,69,NULL,'emarket-discountrule-799',NULL,NULL,NULL,NULL),(212,61,NULL,'absolute',NULL,NULL,NULL,NULL),(212,64,NULL,'emarket-discountmodificator-800',NULL,NULL,NULL,NULL),(213,112,NULL,'payonline',NULL,NULL,NULL,NULL),(213,114,NULL,'emarket-payment-801',NULL,NULL,NULL,NULL),(214,112,NULL,'courier',NULL,NULL,NULL,NULL),(214,114,NULL,'emarket-payment-802',NULL,NULL,NULL,NULL),(215,31,1,NULL,NULL,NULL,NULL,NULL),(216,31,2,NULL,NULL,NULL,NULL,NULL),(217,31,3,NULL,NULL,NULL,NULL,NULL),(218,31,4,NULL,NULL,NULL,NULL,NULL),(219,132,NULL,'russianpost',NULL,NULL,NULL,NULL),(219,134,NULL,'emarket-delivery-808',NULL,NULL,NULL,NULL),(220,112,NULL,'robox',NULL,NULL,NULL,NULL),(220,114,NULL,'emarket-payment-812',NULL,NULL,NULL,NULL),(222,32,0,NULL,NULL,NULL,NULL,NULL),(223,32,1,NULL,NULL,NULL,NULL,NULL),(224,32,2,NULL,NULL,NULL,NULL,NULL),(225,32,3,NULL,NULL,NULL,NULL,NULL),(226,32,4,NULL,NULL,NULL,NULL,NULL),(227,32,5,NULL,NULL,NULL,NULL,NULL),(228,32,6,NULL,NULL,NULL,NULL,NULL),(229,32,7,NULL,NULL,NULL,NULL,NULL),(230,32,8,NULL,NULL,NULL,NULL,NULL),(231,32,9,NULL,NULL,NULL,NULL,NULL),(232,32,10,NULL,NULL,NULL,NULL,NULL),(233,32,11,NULL,NULL,NULL,NULL,NULL),(234,32,12,NULL,NULL,NULL,NULL,NULL),(235,32,13,NULL,NULL,NULL,NULL,NULL),(236,32,14,NULL,NULL,NULL,NULL,NULL),(237,32,15,NULL,NULL,NULL,NULL,NULL),(238,32,16,NULL,NULL,NULL,NULL,NULL),(239,32,17,NULL,NULL,NULL,NULL,NULL),(240,32,18,NULL,NULL,NULL,NULL,NULL),(241,32,19,NULL,NULL,NULL,NULL,NULL),(242,32,20,NULL,NULL,NULL,NULL,NULL),(243,32,21,NULL,NULL,NULL,NULL,NULL),(244,32,22,NULL,NULL,NULL,NULL,NULL),(245,32,23,NULL,NULL,NULL,NULL,NULL),(246,32,1,NULL,NULL,NULL,NULL,NULL),(247,32,2,NULL,NULL,NULL,NULL,NULL),(248,32,3,NULL,NULL,NULL,NULL,NULL),(249,32,4,NULL,NULL,NULL,NULL,NULL),(250,32,5,NULL,NULL,NULL,NULL,NULL),(251,32,6,NULL,NULL,NULL,NULL,NULL),(252,32,7,NULL,NULL,NULL,NULL,NULL),(253,112,NULL,'invoice',NULL,NULL,NULL,NULL),(253,114,NULL,'emarket-payment-816',NULL,NULL,NULL,NULL),(279,112,NULL,'payanyway',NULL,NULL,NULL,NULL),(279,114,NULL,'emarket-payment-payanyway',NULL,NULL,NULL,NULL),(280,112,NULL,'dengionline',NULL,NULL,NULL,NULL),(280,114,NULL,'emarket-payment-dengionline',NULL,NULL,NULL,NULL),(281,40,NULL,'editing',NULL,NULL,NULL,NULL),(281,111,90,NULL,NULL,NULL,NULL,NULL),(296,41,NULL,'android',NULL,NULL,NULL,NULL),(297,41,NULL,'ios',NULL,NULL,NULL,NULL),(298,40,NULL,'not_defined',NULL,NULL,NULL,NULL),(298,111,30,NULL,NULL,NULL,NULL,NULL),(299,40,NULL,'not_defined',NULL,NULL,NULL,NULL),(299,111,30,NULL,NULL,NULL,NULL,NULL),(300,23,NULL,'cp1251',NULL,NULL,NULL,NULL),(301,23,NULL,'utf-8',NULL,NULL,NULL,NULL),(304,112,NULL,'paypal',NULL,NULL,NULL,NULL),(304,114,NULL,'emarket-payment-paypal',NULL,NULL,NULL,NULL),(307,132,NULL,'ApiShip',NULL,NULL,NULL,NULL),(307,134,NULL,'emarket-delivery-842',NULL,NULL,NULL,NULL),(308,40,NULL,'canceled',NULL,NULL,NULL,NULL),(308,111,50,NULL,NULL,NULL,NULL,NULL),(309,40,NULL,'return',NULL,NULL,NULL,NULL),(309,111,60,NULL,NULL,NULL,NULL,NULL),(310,30,NULL,'AU',NULL,NULL,NULL,NULL),(311,30,NULL,'AT',NULL,NULL,NULL,NULL),(312,30,NULL,'AZ',NULL,NULL,NULL,NULL),(313,30,NULL,'AX',NULL,NULL,NULL,NULL),(314,30,NULL,'AL',NULL,NULL,NULL,NULL),(315,30,NULL,'DZ',NULL,NULL,NULL,NULL),(316,30,NULL,'AS',NULL,NULL,NULL,NULL),(317,30,NULL,'AI',NULL,NULL,NULL,NULL),(318,30,NULL,'AO',NULL,NULL,NULL,NULL),(319,30,NULL,'AD',NULL,NULL,NULL,NULL),(320,30,NULL,'AQ',NULL,NULL,NULL,NULL),(321,30,NULL,'AG',NULL,NULL,NULL,NULL),(322,30,NULL,'AR',NULL,NULL,NULL,NULL),(323,30,NULL,'AM',NULL,NULL,NULL,NULL),(324,30,NULL,'AW',NULL,NULL,NULL,NULL),(325,30,NULL,'AF',NULL,NULL,NULL,NULL),(326,30,NULL,'BS',NULL,NULL,NULL,NULL),(327,30,NULL,'BD',NULL,NULL,NULL,NULL),(328,30,NULL,'BB',NULL,NULL,NULL,NULL),(329,30,NULL,'BH',NULL,NULL,NULL,NULL),(330,30,NULL,'BY',NULL,NULL,NULL,NULL),(331,30,NULL,'BZ',NULL,NULL,NULL,NULL),(332,30,NULL,'BE',NULL,NULL,NULL,NULL),(333,30,NULL,'BJ',NULL,NULL,NULL,NULL),(334,30,NULL,'BM',NULL,NULL,NULL,NULL),(335,30,NULL,'BG',NULL,NULL,NULL,NULL),(336,30,NULL,'BO',NULL,NULL,NULL,NULL),(337,30,NULL,'BQ',NULL,NULL,NULL,NULL),(338,30,NULL,'BA',NULL,NULL,NULL,NULL),(339,30,NULL,'BW',NULL,NULL,NULL,NULL),(340,30,NULL,'BR',NULL,NULL,NULL,NULL),(341,30,NULL,'IO',NULL,NULL,NULL,NULL),(342,30,NULL,'BN',NULL,NULL,NULL,NULL),(343,30,NULL,'BF',NULL,NULL,NULL,NULL),(344,30,NULL,'BI',NULL,NULL,NULL,NULL),(345,30,NULL,'BT',NULL,NULL,NULL,NULL),(346,30,NULL,'VU',NULL,NULL,NULL,NULL),(347,30,NULL,'VA',NULL,NULL,NULL,NULL),(348,30,NULL,'GB',NULL,NULL,NULL,NULL),(349,30,NULL,'HU',NULL,NULL,NULL,NULL),(350,30,NULL,'VE',NULL,NULL,NULL,NULL),(351,30,NULL,'VG',NULL,NULL,NULL,NULL),(352,30,NULL,'VI',NULL,NULL,NULL,NULL),(353,30,NULL,'UM',NULL,NULL,NULL,NULL),(354,30,NULL,'TL',NULL,NULL,NULL,NULL),(355,30,NULL,'VN',NULL,NULL,NULL,NULL),(356,30,NULL,'GA',NULL,NULL,NULL,NULL),(357,30,NULL,'HT',NULL,NULL,NULL,NULL),(358,30,NULL,'GY',NULL,NULL,NULL,NULL),(359,30,NULL,'GM',NULL,NULL,NULL,NULL),(360,30,NULL,'GH',NULL,NULL,NULL,NULL),(361,30,NULL,'GP',NULL,NULL,NULL,NULL),(362,30,NULL,'GT',NULL,NULL,NULL,NULL),(363,30,NULL,'GN',NULL,NULL,NULL,NULL),(364,30,NULL,'GW',NULL,NULL,NULL,NULL),(365,30,NULL,'DE',NULL,NULL,NULL,NULL),(366,30,NULL,'GG',NULL,NULL,NULL,NULL),(367,30,NULL,'GI',NULL,NULL,NULL,NULL),(368,30,NULL,'HN',NULL,NULL,NULL,NULL),(369,30,NULL,'HK',NULL,NULL,NULL,NULL),(370,30,NULL,'GD',NULL,NULL,NULL,NULL),(371,30,NULL,'GL',NULL,NULL,NULL,NULL),(372,30,NULL,'GR',NULL,NULL,NULL,NULL),(373,30,NULL,'GE',NULL,NULL,NULL,NULL),(374,30,NULL,'GU',NULL,NULL,NULL,NULL),(375,30,NULL,'DK',NULL,NULL,NULL,NULL),(376,30,NULL,'JE',NULL,NULL,NULL,NULL),(377,30,NULL,'DJ',NULL,NULL,NULL,NULL),(378,30,NULL,'DG',NULL,NULL,NULL,NULL),(379,30,NULL,'DM',NULL,NULL,NULL,NULL),(380,30,NULL,'DO',NULL,NULL,NULL,NULL),(381,30,NULL,'EG',NULL,NULL,NULL,NULL),(382,30,NULL,'ZM',NULL,NULL,NULL,NULL),(383,30,NULL,'EH',NULL,NULL,NULL,NULL),(384,30,NULL,'ZW',NULL,NULL,NULL,NULL),(385,30,NULL,'IL',NULL,NULL,NULL,NULL),(386,30,NULL,'IN',NULL,NULL,NULL,NULL),(387,30,NULL,'ID',NULL,NULL,NULL,NULL),(388,30,NULL,'JO',NULL,NULL,NULL,NULL),(389,30,NULL,'IQ',NULL,NULL,NULL,NULL),(390,30,NULL,'IR',NULL,NULL,NULL,NULL),(391,30,NULL,'IE',NULL,NULL,NULL,NULL),(392,30,NULL,'IS',NULL,NULL,NULL,NULL),(393,30,NULL,'ES',NULL,NULL,NULL,NULL),(394,30,NULL,'IT',NULL,NULL,NULL,NULL),(395,30,NULL,'YE',NULL,NULL,NULL,NULL),(396,30,NULL,'CV',NULL,NULL,NULL,NULL),(397,30,NULL,'KZ',NULL,NULL,NULL,NULL),(398,30,NULL,'KY',NULL,NULL,NULL,NULL),(399,30,NULL,'KH',NULL,NULL,NULL,NULL),(400,30,NULL,'CM',NULL,NULL,NULL,NULL),(401,30,NULL,'CA',NULL,NULL,NULL,NULL),(402,30,NULL,'IC',NULL,NULL,NULL,NULL),(403,30,NULL,'QA',NULL,NULL,NULL,NULL),(404,30,NULL,'KE',NULL,NULL,NULL,NULL),(405,30,NULL,'CY',NULL,NULL,NULL,NULL),(406,30,NULL,'KG',NULL,NULL,NULL,NULL),(407,30,NULL,'KI',NULL,NULL,NULL,NULL),(408,30,NULL,'CN',NULL,NULL,NULL,NULL),(409,30,NULL,'KP',NULL,NULL,NULL,NULL),(410,30,NULL,'CC',NULL,NULL,NULL,NULL),(411,30,NULL,'CO',NULL,NULL,NULL,NULL),(412,30,NULL,'KM',NULL,NULL,NULL,NULL),(413,30,NULL,'CG',NULL,NULL,NULL,NULL),(414,30,NULL,'CD',NULL,NULL,NULL,NULL),(415,30,NULL,'XK',NULL,NULL,NULL,NULL),(416,30,NULL,'CR',NULL,NULL,NULL,NULL),(417,30,NULL,'CI',NULL,NULL,NULL,NULL),(418,30,NULL,'CU',NULL,NULL,NULL,NULL),(419,30,NULL,'KW',NULL,NULL,NULL,NULL),(420,30,NULL,'CW',NULL,NULL,NULL,NULL),(421,30,NULL,'LA',NULL,NULL,NULL,NULL),(422,30,NULL,'LV',NULL,NULL,NULL,NULL),(423,30,NULL,'LS',NULL,NULL,NULL,NULL),(424,30,NULL,'LR',NULL,NULL,NULL,NULL),(425,30,NULL,'LB',NULL,NULL,NULL,NULL),(426,30,NULL,'LY',NULL,NULL,NULL,NULL),(427,30,NULL,'LT',NULL,NULL,NULL,NULL),(428,30,NULL,'LI',NULL,NULL,NULL,NULL),(429,30,NULL,'LU',NULL,NULL,NULL,NULL),(430,30,NULL,'MU',NULL,NULL,NULL,NULL),(431,30,NULL,'MR',NULL,NULL,NULL,NULL),(432,30,NULL,'MG',NULL,NULL,NULL,NULL),(433,30,NULL,'YT',NULL,NULL,NULL,NULL),(434,30,NULL,'MO',NULL,NULL,NULL,NULL),(435,30,NULL,'MK',NULL,NULL,NULL,NULL),(436,30,NULL,'MW',NULL,NULL,NULL,NULL),(437,30,NULL,'MY',NULL,NULL,NULL,NULL),(438,30,NULL,'ML',NULL,NULL,NULL,NULL),(439,30,NULL,'MV',NULL,NULL,NULL,NULL),(440,30,NULL,'MT',NULL,NULL,NULL,NULL),(441,30,NULL,'MA',NULL,NULL,NULL,NULL),(442,30,NULL,'MQ',NULL,NULL,NULL,NULL),(443,30,NULL,'MH',NULL,NULL,NULL,NULL),(444,30,NULL,'MX',NULL,NULL,NULL,NULL),(445,30,NULL,'MZ',NULL,NULL,NULL,NULL),(446,30,NULL,'MD',NULL,NULL,NULL,NULL),(447,30,NULL,'MC',NULL,NULL,NULL,NULL),(448,30,NULL,'MN',NULL,NULL,NULL,NULL),(449,30,NULL,'MS',NULL,NULL,NULL,NULL),(450,30,NULL,'MM',NULL,NULL,NULL,NULL),(451,30,NULL,'NA',NULL,NULL,NULL,NULL),(452,30,NULL,'NR',NULL,NULL,NULL,NULL),(453,30,NULL,'NP',NULL,NULL,NULL,NULL),(454,30,NULL,'NE',NULL,NULL,NULL,NULL),(455,30,NULL,'NG',NULL,NULL,NULL,NULL),(456,30,NULL,'NL',NULL,NULL,NULL,NULL),(457,30,NULL,'NI',NULL,NULL,NULL,NULL),(458,30,NULL,'NU',NULL,NULL,NULL,NULL),(459,30,NULL,'NZ',NULL,NULL,NULL,NULL),(460,30,NULL,'NC',NULL,NULL,NULL,NULL),(461,30,NULL,'NO',NULL,NULL,NULL,NULL),(462,30,NULL,'AC',NULL,NULL,NULL,NULL),(463,30,NULL,'IM',NULL,NULL,NULL,NULL),(464,30,NULL,'NF',NULL,NULL,NULL,NULL),(465,30,NULL,'CX',NULL,NULL,NULL,NULL),(466,30,NULL,'SH',NULL,NULL,NULL,NULL),(467,30,NULL,'CK',NULL,NULL,NULL,NULL),(468,30,NULL,'TC',NULL,NULL,NULL,NULL),(469,30,NULL,'AE',NULL,NULL,NULL,NULL),(470,30,NULL,'OM',NULL,NULL,NULL,NULL),(471,30,NULL,'PK',NULL,NULL,NULL,NULL),(472,30,NULL,'PW',NULL,NULL,NULL,NULL),(473,30,NULL,'PS',NULL,NULL,NULL,NULL),(474,30,NULL,'PA',NULL,NULL,NULL,NULL),(475,30,NULL,'PG',NULL,NULL,NULL,NULL),(476,30,NULL,'PY',NULL,NULL,NULL,NULL),(477,30,NULL,'PE',NULL,NULL,NULL,NULL),(478,30,NULL,'PN',NULL,NULL,NULL,NULL),(479,30,NULL,'PL',NULL,NULL,NULL,NULL),(480,30,NULL,'PT',NULL,NULL,NULL,NULL),(481,30,NULL,'PR',NULL,NULL,NULL,NULL),(482,30,NULL,'KR',NULL,NULL,NULL,NULL),(483,30,NULL,'RE',NULL,NULL,NULL,NULL),(484,30,NULL,'RW',NULL,NULL,NULL,NULL),(485,30,NULL,'RO',NULL,NULL,NULL,NULL),(486,30,NULL,'SV',NULL,NULL,NULL,NULL),(487,30,NULL,'WS',NULL,NULL,NULL,NULL),(488,30,NULL,'SM',NULL,NULL,NULL,NULL),(489,30,NULL,'ST',NULL,NULL,NULL,NULL),(490,30,NULL,'SA',NULL,NULL,NULL,NULL),(491,30,NULL,'SZ',NULL,NULL,NULL,NULL),(492,30,NULL,'MP',NULL,NULL,NULL,NULL),(493,30,NULL,'SC',NULL,NULL,NULL,NULL),(494,30,NULL,'BL',NULL,NULL,NULL,NULL),(495,30,NULL,'MF',NULL,NULL,NULL,NULL),(496,30,NULL,'PM',NULL,NULL,NULL,NULL),(497,30,NULL,'SN',NULL,NULL,NULL,NULL),(498,30,NULL,'VC',NULL,NULL,NULL,NULL),(499,30,NULL,'KN',NULL,NULL,NULL,NULL),(500,30,NULL,'LC',NULL,NULL,NULL,NULL),(501,30,NULL,'RS',NULL,NULL,NULL,NULL),(502,30,NULL,'EA',NULL,NULL,NULL,NULL),(503,30,NULL,'SG',NULL,NULL,NULL,NULL),(504,30,NULL,'SX',NULL,NULL,NULL,NULL),(505,30,NULL,'SY',NULL,NULL,NULL,NULL),(506,30,NULL,'SK',NULL,NULL,NULL,NULL),(507,30,NULL,'SI',NULL,NULL,NULL,NULL),(508,30,NULL,'SB',NULL,NULL,NULL,NULL),(509,30,NULL,'SO',NULL,NULL,NULL,NULL),(510,30,NULL,'SD',NULL,NULL,NULL,NULL),(511,30,NULL,'SR',NULL,NULL,NULL,NULL),(512,30,NULL,'SL',NULL,NULL,NULL,NULL),(513,30,NULL,'TJ',NULL,NULL,NULL,NULL),(514,30,NULL,'TH',NULL,NULL,NULL,NULL),(515,30,NULL,'TW',NULL,NULL,NULL,NULL),(516,30,NULL,'TZ',NULL,NULL,NULL,NULL),(517,30,NULL,'TG',NULL,NULL,NULL,NULL),(518,30,NULL,'TK',NULL,NULL,NULL,NULL),(519,30,NULL,'TO',NULL,NULL,NULL,NULL),(520,30,NULL,'TT',NULL,NULL,NULL,NULL),(521,30,NULL,'TA',NULL,NULL,NULL,NULL),(522,30,NULL,'TV',NULL,NULL,NULL,NULL),(523,30,NULL,'TN',NULL,NULL,NULL,NULL),(524,30,NULL,'TM',NULL,NULL,NULL,NULL),(525,30,NULL,'TR',NULL,NULL,NULL,NULL),(526,30,NULL,'UG',NULL,NULL,NULL,NULL),(527,30,NULL,'UZ',NULL,NULL,NULL,NULL),(528,30,NULL,'UA',NULL,NULL,NULL,NULL),(529,30,NULL,'WF',NULL,NULL,NULL,NULL),(530,30,NULL,'UY',NULL,NULL,NULL,NULL),(531,30,NULL,'FO',NULL,NULL,NULL,NULL),(532,30,NULL,'FM',NULL,NULL,NULL,NULL),(533,30,NULL,'FJ',NULL,NULL,NULL,NULL),(534,30,NULL,'PH',NULL,NULL,NULL,NULL),(535,30,NULL,'FI',NULL,NULL,NULL,NULL),(536,30,NULL,'FK',NULL,NULL,NULL,NULL),(537,30,NULL,'FR',NULL,NULL,NULL,NULL),(538,30,NULL,'GF',NULL,NULL,NULL,NULL),(539,30,NULL,'PF',NULL,NULL,NULL,NULL),(540,30,NULL,'TF',NULL,NULL,NULL,NULL),(541,30,NULL,'HR',NULL,NULL,NULL,NULL),(542,30,NULL,'CF',NULL,NULL,NULL,NULL),(543,30,NULL,'TD',NULL,NULL,NULL,NULL),(544,30,NULL,'ME',NULL,NULL,NULL,NULL),(545,30,NULL,'CZ',NULL,NULL,NULL,NULL),(546,30,NULL,'CL',NULL,NULL,NULL,NULL),(547,30,NULL,'CH',NULL,NULL,NULL,NULL),(548,30,NULL,'SE',NULL,NULL,NULL,NULL),(549,30,NULL,'SJ',NULL,NULL,NULL,NULL),(550,30,NULL,'LK',NULL,NULL,NULL,NULL),(551,30,NULL,'EC',NULL,NULL,NULL,NULL),(552,30,NULL,'GQ',NULL,NULL,NULL,NULL),(553,30,NULL,'ER',NULL,NULL,NULL,NULL),(554,30,NULL,'EE',NULL,NULL,NULL,NULL),(555,30,NULL,'ET',NULL,NULL,NULL,NULL),(556,30,NULL,'ZA',NULL,NULL,NULL,NULL),(557,30,NULL,'GS',NULL,NULL,NULL,NULL),(558,30,NULL,'SS',NULL,NULL,NULL,NULL),(559,30,NULL,'JM',NULL,NULL,NULL,NULL),(560,30,NULL,'JP',NULL,NULL,NULL,NULL),(561,112,NULL,'YandexKassa',NULL,NULL,NULL,NULL),(561,114,NULL,'emarket-payment-yandex-kassa',NULL,NULL,NULL,NULL),(562,87,NULL,'custom',NULL,NULL,NULL,NULL),(563,87,NULL,'TradeOffer',NULL,NULL,NULL,NULL),(564,1,NULL,'page_status_publish',NULL,NULL,NULL,NULL),(565,51,1,NULL,NULL,NULL,NULL,NULL),(565,52,NULL,'none',NULL,NULL,NULL,NULL),(565,53,NULL,'none',NULL,NULL,NULL,NULL),(565,54,1105,NULL,NULL,NULL,NULL,NULL),(565,55,0,NULL,NULL,NULL,NULL,NULL),(565,56,NULL,'none',NULL,NULL,NULL,NULL),(566,31,3000,NULL,NULL,NULL,NULL,NULL),(567,57,NULL,'commodity',NULL,NULL,NULL,NULL),(567,53,NULL,'commodity',NULL,NULL,NULL,NULL),(567,58,NULL,'commodity',NULL,NULL,NULL,NULL),(567,59,1,NULL,NULL,NULL,NULL,NULL),(567,55,1,NULL,NULL,NULL,NULL,NULL),(568,57,NULL,'full_prepayment',NULL,NULL,NULL,NULL),(568,53,NULL,'full_prepayment',NULL,NULL,NULL,NULL),(568,58,NULL,'full_prepayment',NULL,NULL,NULL,NULL),(568,59,1,NULL,NULL,NULL,NULL,NULL),(568,55,1,NULL,NULL,NULL,NULL,NULL),(569,1,NULL,'page_status_unpublish',NULL,NULL,NULL,NULL),(570,31,3010,NULL,NULL,NULL,NULL,NULL),(571,51,2,NULL,NULL,NULL,NULL,NULL),(571,52,NULL,'vat0',NULL,NULL,NULL,NULL),(571,53,NULL,'vat0',NULL,NULL,NULL,NULL),(571,54,1104,NULL,NULL,NULL,NULL,NULL),(571,55,1,NULL,NULL,NULL,NULL,NULL),(571,56,NULL,'0',NULL,NULL,NULL,NULL),(572,57,NULL,'excise',NULL,NULL,NULL,NULL),(572,53,NULL,'excise',NULL,NULL,NULL,NULL),(572,58,NULL,'excise',NULL,NULL,NULL,NULL),(572,59,2,NULL,NULL,NULL,NULL,NULL),(572,55,2,NULL,NULL,NULL,NULL,NULL),(573,57,NULL,'partial_prepayment',NULL,NULL,NULL,NULL),(573,53,NULL,'prepayment',NULL,NULL,NULL,NULL),(573,58,NULL,'prepayment',NULL,NULL,NULL,NULL),(573,59,2,NULL,NULL,NULL,NULL,NULL),(573,55,2,NULL,NULL,NULL,NULL,NULL),(574,1,NULL,'page_status_preunpublish',NULL,NULL,NULL,NULL),(575,31,3020,NULL,NULL,NULL,NULL,NULL),(576,51,3,NULL,NULL,NULL,NULL,NULL),(576,52,NULL,'vat10',NULL,NULL,NULL,NULL),(576,53,NULL,'vat10',NULL,NULL,NULL,NULL),(576,54,1103,NULL,NULL,NULL,NULL,NULL),(576,55,2,NULL,NULL,NULL,NULL,NULL),(576,56,NULL,'10',NULL,NULL,NULL,NULL),(577,57,NULL,'job',NULL,NULL,NULL,NULL),(577,53,NULL,'job',NULL,NULL,NULL,NULL),(577,58,NULL,'job',NULL,NULL,NULL,NULL),(577,59,3,NULL,NULL,NULL,NULL,NULL),(577,55,3,NULL,NULL,NULL,NULL,NULL),(578,57,NULL,'advance',NULL,NULL,NULL,NULL),(578,53,NULL,'advance',NULL,NULL,NULL,NULL),(578,58,NULL,'advance',NULL,NULL,NULL,NULL),(578,59,3,NULL,NULL,NULL,NULL,NULL),(578,55,3,NULL,NULL,NULL,NULL,NULL),(579,31,16010,NULL,NULL,NULL,NULL,NULL),(580,51,4,NULL,NULL,NULL,NULL,NULL),(580,52,NULL,'vat20',NULL,NULL,NULL,NULL),(580,53,NULL,'vat20',NULL,NULL,NULL,NULL),(580,54,1102,NULL,NULL,NULL,NULL,NULL),(580,55,6,NULL,NULL,NULL,NULL,NULL),(580,56,NULL,'20',NULL,NULL,NULL,NULL),(581,57,NULL,'service',NULL,NULL,NULL,NULL),(581,53,NULL,'service',NULL,NULL,NULL,NULL),(581,58,NULL,'service',NULL,NULL,NULL,NULL),(581,59,4,NULL,NULL,NULL,NULL,NULL),(581,55,4,NULL,NULL,NULL,NULL,NULL),(582,57,NULL,'full_payment',NULL,NULL,NULL,NULL),(582,53,NULL,'full_payment',NULL,NULL,NULL,NULL),(582,58,NULL,'full_payment',NULL,NULL,NULL,NULL),(582,59,4,NULL,NULL,NULL,NULL,NULL),(582,55,4,NULL,NULL,NULL,NULL,NULL),(583,31,16020,NULL,NULL,NULL,NULL,NULL),(584,51,5,NULL,NULL,NULL,NULL,NULL),(584,52,NULL,'vat110',NULL,NULL,NULL,NULL),(584,53,NULL,'vat110',NULL,NULL,NULL,NULL),(584,54,1107,NULL,NULL,NULL,NULL,NULL),(584,55,4,NULL,NULL,NULL,NULL,NULL),(584,56,NULL,'10/110',NULL,NULL,NULL,NULL),(585,57,NULL,'gambling_bet',NULL,NULL,NULL,NULL),(585,53,NULL,'gambling_bet',NULL,NULL,NULL,NULL),(585,58,NULL,'gambling_bet',NULL,NULL,NULL,NULL),(585,59,5,NULL,NULL,NULL,NULL,NULL),(585,55,5,NULL,NULL,NULL,NULL,NULL),(586,57,NULL,'partial_payment',NULL,NULL,NULL,NULL),(586,53,NULL,'partial_payment',NULL,NULL,NULL,NULL),(586,58,NULL,'partial_payment',NULL,NULL,NULL,NULL),(586,59,5,NULL,NULL,NULL,NULL,NULL),(586,55,5,NULL,NULL,NULL,NULL,NULL),(587,51,6,NULL,NULL,NULL,NULL,NULL),(587,52,NULL,'vat120',NULL,NULL,NULL,NULL),(587,53,NULL,'vat120',NULL,NULL,NULL,NULL),(587,54,1106,NULL,NULL,NULL,NULL,NULL),(587,55,7,NULL,NULL,NULL,NULL,NULL),(587,56,NULL,'20/120',NULL,NULL,NULL,NULL),(588,31,27030,NULL,NULL,NULL,NULL,NULL),(589,57,NULL,'gambling_prize',NULL,NULL,NULL,NULL),(589,53,NULL,'gambling_prize',NULL,NULL,NULL,NULL),(589,58,NULL,'gambling_prize',NULL,NULL,NULL,NULL),(589,59,6,NULL,NULL,NULL,NULL,NULL),(589,55,6,NULL,NULL,NULL,NULL,NULL),(590,57,NULL,'credit',NULL,NULL,NULL,NULL),(590,53,NULL,'credit',NULL,NULL,NULL,NULL),(590,58,NULL,'credit',NULL,NULL,NULL,NULL),(590,59,6,NULL,NULL,NULL,NULL,NULL),(590,55,6,NULL,NULL,NULL,NULL,NULL),(591,31,27020,NULL,NULL,NULL,NULL,NULL),(592,57,NULL,'lottery',NULL,NULL,NULL,NULL),(592,53,NULL,'lottery',NULL,NULL,NULL,NULL),(592,58,NULL,'lottery',NULL,NULL,NULL,NULL),(592,59,7,NULL,NULL,NULL,NULL,NULL),(592,55,7,NULL,NULL,NULL,NULL,NULL),(593,57,NULL,'credit_payment',NULL,NULL,NULL,NULL),(593,53,NULL,'credit_payment',NULL,NULL,NULL,NULL),(593,58,NULL,'credit_payment',NULL,NULL,NULL,NULL),(593,59,7,NULL,NULL,NULL,NULL,NULL),(593,55,7,NULL,NULL,NULL,NULL,NULL),(594,31,47030,NULL,NULL,NULL,NULL,NULL),(595,57,NULL,'lottery_prize',NULL,NULL,NULL,NULL),(595,53,NULL,'lottery_prize',NULL,NULL,NULL,NULL),(595,58,NULL,'lottery_prize',NULL,NULL,NULL,NULL),(595,59,8,NULL,NULL,NULL,NULL,NULL),(595,55,8,NULL,NULL,NULL,NULL,NULL),(596,31,47020,NULL,NULL,NULL,NULL,NULL),(597,57,NULL,'intellectual_activity',NULL,NULL,NULL,NULL),(597,53,NULL,'intellectual_activity',NULL,NULL,NULL,NULL),(597,58,NULL,'intellectual_activity',NULL,NULL,NULL,NULL),(597,59,9,NULL,NULL,NULL,NULL,NULL),(597,55,9,NULL,NULL,NULL,NULL,NULL),(598,31,7030,NULL,NULL,NULL,NULL,NULL),(599,57,NULL,'payment',NULL,NULL,NULL,NULL),(599,53,NULL,'payment',NULL,NULL,NULL,NULL),(599,58,NULL,'payment',NULL,NULL,NULL,NULL),(599,59,10,NULL,NULL,NULL,NULL,NULL),(599,55,10,NULL,NULL,NULL,NULL,NULL),(600,31,7020,NULL,NULL,NULL,NULL,NULL),(601,57,NULL,'agent_commission',NULL,NULL,NULL,NULL),(601,53,NULL,'agent_commission',NULL,NULL,NULL,NULL),(601,58,NULL,'agent_commission',NULL,NULL,NULL,NULL),(601,59,11,NULL,NULL,NULL,NULL,NULL),(601,55,11,NULL,NULL,NULL,NULL,NULL),(602,57,NULL,'composite',NULL,NULL,NULL,NULL),(602,53,NULL,'composite',NULL,NULL,NULL,NULL),(602,58,NULL,'composite',NULL,NULL,NULL,NULL),(602,59,12,NULL,NULL,NULL,NULL,NULL),(602,55,12,NULL,NULL,NULL,NULL,NULL),(603,57,NULL,'another',NULL,NULL,NULL,NULL),(603,53,NULL,'another',NULL,NULL,NULL,NULL),(603,58,NULL,'another',NULL,NULL,NULL,NULL),(603,59,13,NULL,NULL,NULL,NULL,NULL),(603,55,13,NULL,NULL,NULL,NULL,NULL),(604,236,NULL,NULL,NULL,NULL,NULL,12),(606,71,NULL,'commerceML2',NULL,NULL,NULL,NULL),(607,71,NULL,'umiDump20',NULL,NULL,NULL,NULL),(608,71,NULL,'CSV',NULL,NULL,NULL,NULL),(609,71,NULL,'transfer',NULL,NULL,NULL,NULL),(610,72,NULL,'catalogCommerceML',NULL,NULL,NULL,NULL),(611,72,NULL,'offersCommerceML',NULL,NULL,NULL,NULL),(612,72,NULL,'ordersCommerceML',NULL,NULL,NULL,NULL),(613,72,NULL,'YML',NULL,NULL,NULL,NULL),(614,72,NULL,'umiDump20',NULL,NULL,NULL,NULL),(615,72,NULL,'CSV',NULL,NULL,NULL,NULL),(616,72,NULL,'transfer',NULL,NULL,NULL,NULL),(617,72,NULL,'commerceML',NULL,NULL,NULL,NULL),(618,203,NULL,'Гость',NULL,NULL,NULL,NULL),(618,204,NULL,'084e0343a0486ff05530df6c705c8bb4',NULL,NULL,NULL,NULL),(618,206,NULL,'anonymous@somedomain.com',NULL,NULL,NULL,NULL),(618,209,1,NULL,NULL,NULL,NULL,NULL),(618,210,0,NULL,NULL,NULL,NULL,NULL),(618,214,0,NULL,NULL,NULL,NULL,NULL),(618,230,NULL,'Посетитель',NULL,NULL,NULL,NULL),(619,79,NULL,'Зарегистрированные пользователи',NULL,NULL,NULL,NULL),(620,35,NULL,'RUR',NULL,NULL,NULL,NULL),(620,36,1,NULL,NULL,NULL,NULL,NULL),(620,37,NULL,NULL,NULL,NULL,NULL,1),(620,39,NULL,'руб',NULL,NULL,NULL,NULL),(621,35,NULL,'USD',NULL,NULL,NULL,NULL),(621,36,1,NULL,NULL,NULL,NULL,NULL),(621,37,NULL,NULL,NULL,NULL,NULL,31.5),(621,38,NULL,'$',NULL,NULL,NULL,NULL),(622,35,NULL,'EUR',NULL,NULL,NULL,NULL),(622,36,1,NULL,NULL,NULL,NULL,NULL),(622,37,NULL,NULL,NULL,NULL,NULL,35),(622,38,NULL,'€',NULL,NULL,NULL,NULL),(182,205,NULL,NULL,NULL,181,NULL,NULL),(184,63,NULL,NULL,NULL,180,NULL,NULL),(184,63,NULL,NULL,NULL,183,NULL,NULL),(184,63,NULL,NULL,NULL,179,NULL,NULL),(186,68,NULL,NULL,NULL,179,NULL,NULL),(206,68,NULL,NULL,NULL,180,NULL,NULL),(206,68,NULL,NULL,NULL,183,NULL,NULL),(206,68,NULL,NULL,NULL,179,NULL,NULL),(207,68,NULL,NULL,NULL,180,NULL,NULL),(207,68,NULL,NULL,NULL,183,NULL,NULL),(208,68,NULL,NULL,NULL,180,NULL,NULL),(208,68,NULL,NULL,NULL,183,NULL,NULL),(208,68,NULL,NULL,NULL,179,NULL,NULL),(209,68,NULL,NULL,NULL,180,NULL,NULL),(209,68,NULL,NULL,NULL,183,NULL,NULL),(209,68,NULL,NULL,NULL,179,NULL,NULL),(210,68,NULL,NULL,NULL,180,NULL,NULL),(210,68,NULL,NULL,NULL,183,NULL,NULL),(210,68,NULL,NULL,NULL,179,NULL,NULL),(211,68,NULL,NULL,NULL,179,NULL,NULL),(212,63,NULL,NULL,NULL,180,NULL,NULL),(212,63,NULL,NULL,NULL,183,NULL,NULL),(212,63,NULL,NULL,NULL,179,NULL,NULL),(604,65,NULL,NULL,NULL,184,NULL,NULL),(605,70,NULL,NULL,NULL,210,NULL,NULL),(182,203,NULL,'sv',NULL,NULL,NULL,NULL),(182,206,NULL,'ab@umisoft.ru',NULL,NULL,NULL,NULL),(182,229,NULL,'Бабейкин',NULL,NULL,NULL,NULL),(182,230,NULL,'Артем',NULL,NULL,NULL,NULL),(182,231,NULL,'Александрович',NULL,NULL,NULL,NULL),(182,204,NULL,'0160907357042913c8a48c0a67b88ab4ee5621e18f68eaffb078e46844335f43',NULL,NULL,NULL,NULL),(623,379,NULL,'demotractor',NULL,NULL,NULL,NULL),(624,2,NULL,'Аренда спецтехники в СПб - компания стройтех',NULL,NULL,NULL,NULL),(624,6,NULL,'аренда спецтехники спб, аренда спецтехники спб',NULL,NULL,NULL,NULL),(624,5,NULL,'Аренда спецтехники в СПб недорого, у нас можно арендовать строительный кран, бульдозер и другую технику для строительства',NULL,NULL,NULL,NULL),(624,3,NULL,'Аренда спецтехники в СПб - компания стройтех',NULL,NULL,NULL,NULL),(625,397,NULL,'blue',NULL,NULL,NULL,NULL),(626,397,NULL,'green',NULL,NULL,NULL,NULL),(627,397,NULL,'orange',NULL,NULL,NULL,NULL),(628,397,NULL,'purple',NULL,NULL,NULL,NULL),(629,397,NULL,'red',NULL,NULL,NULL,NULL),(623,399,NULL,'г. Санкт-Петербург, ул. Добрая, дом 66',NULL,NULL,NULL,NULL),(623,398,NULL,'+7 (812) 535-55-555',NULL,NULL,NULL,NULL),(623,393,NULL,'Стройтех',NULL,NULL,NULL,NULL),(623,400,NULL,NULL,'<p>Работает на <a href=\"https://www.umi-cms.ru\" rel=\"nofollow\">UMI.CMS</a></p>',NULL,NULL,NULL),(623,403,NULL,'Подписаться на RSS',NULL,NULL,NULL,NULL),(623,404,NULL,NULL,'',NULL,NULL,NULL),(630,406,NULL,'https://vkontakte.ru',NULL,NULL,NULL,NULL),(630,407,NULL,'social_vk',NULL,NULL,NULL,NULL),(631,406,NULL,'https://odnoklassniki.ru',NULL,NULL,NULL,NULL),(631,407,NULL,'social_odnoklassniki',NULL,NULL,NULL,NULL),(632,406,NULL,'https://my.mail.ru',NULL,NULL,NULL,NULL),(632,407,NULL,'social_mir',NULL,NULL,NULL,NULL),(634,406,NULL,'https://twitter.com',NULL,NULL,NULL,NULL),(634,407,NULL,'social_twitter',NULL,NULL,NULL,NULL),(635,406,NULL,'https://livejournal.com',NULL,NULL,NULL,NULL),(635,407,NULL,'social_livejournal',NULL,NULL,NULL,NULL),(637,279,102,NULL,NULL,NULL,NULL,NULL),(637,3,NULL,'Контакты',NULL,NULL,NULL,NULL),(639,3,NULL,'Как подобрать подходящий самосвал?',NULL,NULL,NULL,NULL),(640,3,NULL,'Обновление парка спецтехники',NULL,NULL,NULL,NULL),(641,3,NULL,'Весеннее таяние цен',NULL,NULL,NULL,NULL),(642,3,NULL,'Скидка на аренду спецтехники на длительный срок',NULL,NULL,NULL,NULL),(643,13,1,NULL,NULL,NULL,NULL,NULL),(645,3,NULL,'Аренда самосвалов',NULL,NULL,NULL,NULL),(646,3,NULL,'Аренда автокранов',NULL,NULL,NULL,NULL),(649,3,NULL,'Аренда экскаваторов',NULL,NULL,NULL,NULL),(650,3,NULL,'Аренда асфальтоукладчика',NULL,NULL,NULL,NULL),(651,3,NULL,'Аренда вездехода',NULL,NULL,NULL,NULL),(652,3,NULL,'Аренда бульдозера Komatsu D31E-20',NULL,NULL,NULL,NULL),(652,334,1557924503,NULL,NULL,NULL,NULL,NULL),(653,3,NULL,'Аренда бульдозера Komatsu D21A-7',NULL,NULL,NULL,NULL),(653,334,1557924518,NULL,NULL,NULL,NULL,NULL),(654,3,NULL,'Самосвал 18-20 кубов',NULL,NULL,NULL,NULL),(654,334,1557924534,NULL,NULL,NULL,NULL,NULL),(655,3,NULL,'Самосвал 10-12 кубов',NULL,NULL,NULL,NULL),(655,334,1557924544,NULL,NULL,NULL,NULL,NULL),(656,3,NULL,'Автокран 25 тонн КС-55713',NULL,NULL,NULL,NULL),(656,334,1557924557,NULL,NULL,NULL,NULL,NULL),(657,3,NULL,'Автокран 14-16 тонн КС-35715',NULL,NULL,NULL,NULL),(657,334,1557924569,NULL,NULL,NULL,NULL,NULL),(658,3,NULL,'Экскаватор-планировщик УДС 114',NULL,NULL,NULL,NULL),(658,334,1557924591,NULL,NULL,NULL,NULL,NULL),(659,3,NULL,'Экскаватор гусеничный с планировочным ковшом',NULL,NULL,NULL,NULL),(659,334,1557924600,NULL,NULL,NULL,NULL,NULL),(660,3,NULL,'Асфальтоукладчик Vogele 800',NULL,NULL,NULL,NULL),(660,334,1557924616,NULL,NULL,NULL,NULL,NULL),(661,3,NULL,'Асфальтоукладчик тротуарный Vogele 1300-2',NULL,NULL,NULL,NULL),(661,334,1557924626,NULL,NULL,NULL,NULL,NULL),(662,3,NULL,'Самосвал-вездеход ',NULL,NULL,NULL,NULL),(662,334,1557924642,NULL,NULL,NULL,NULL,NULL),(663,3,NULL,'Фото техники',NULL,NULL,NULL,NULL),(664,3,NULL,'Гидромолоты',NULL,NULL,NULL,NULL),(665,3,NULL,'Вибропогружатели',NULL,NULL,NULL,NULL),(666,3,NULL,'Гидромолот JCB',NULL,NULL,NULL,NULL),(667,3,NULL,'Гидромолот CAT',NULL,NULL,NULL,NULL),(668,3,NULL,'Гидромолот DOOSAN',NULL,NULL,NULL,NULL),(669,3,NULL,'Вибропогружатель JCB',NULL,NULL,NULL,NULL),(670,3,NULL,'Вибропогружатель VOLVO',NULL,NULL,NULL,NULL),(671,3,NULL,'Вибропогружатель HITACHI',NULL,NULL,NULL,NULL),(643,12,1,NULL,NULL,NULL,NULL,NULL),(663,12,1,NULL,NULL,NULL,NULL,NULL),(663,13,1,NULL,NULL,NULL,NULL,NULL),(636,3,NULL,'О нас',NULL,NULL,NULL,NULL),(636,2,NULL,'О нас',NULL,NULL,NULL,NULL),(636,5,NULL,'О нас',NULL,NULL,NULL,NULL),(636,4,NULL,NULL,'<p>Мы&nbsp;основали компанию 26 ноября 2008 года. Вот основные вехи развития нашей фирмы:</p>\r\n<ul>\r\n<li>2008&nbsp;&mdash; дата основания.</li>\r\n<li>2010&nbsp;&mdash; первые 100 клиентов. Значительное пополнение нашего автопарка.&nbsp;</li>\r\n<li>2015&nbsp;&mdash; первые 1000 клиентов. Наш автопарк насчитывает ровно 100 машин.&nbsp;</li>\r\n<li>2018&nbsp;&mdash; десятилетний юбилей компании.</li>\r\n</ul>',NULL,NULL,NULL),(623,413,NULL,'Страница не найдена',NULL,NULL,NULL,NULL),(623,414,NULL,NULL,'<p>Запрашиваемая страница не найдена. Проверьте корректность введённого адреса.</p>',NULL,NULL,NULL),(623,415,NULL,'Карта сайта',NULL,NULL,NULL,NULL),(638,3,NULL,'Статьи и новости',NULL,NULL,NULL,NULL),(638,6,NULL,'Новости',NULL,NULL,NULL,NULL),(638,5,NULL,'Новости',NULL,NULL,NULL,NULL),(642,240,NULL,NULL,'<p>Скидка на аренду спецтехники 50%!</p>',NULL,NULL,NULL),(640,240,NULL,NULL,'<p>Теперь у нас есть автокраны.</p>',NULL,NULL,NULL),(641,240,NULL,NULL,'<p>Дарим скидку в 14% на аренду любой спецтехники.</p>',NULL,NULL,NULL),(639,240,NULL,NULL,'<p>Важные моменты при выборе строительной техники. Рассказываем все детали.</p>',NULL,NULL,NULL),(639,243,1550320860,NULL,NULL,NULL,NULL,NULL),(640,243,1558183260,NULL,NULL,NULL,NULL,NULL),(641,243,1551444060,NULL,NULL,NULL,NULL,NULL),(642,243,1546605720,NULL,NULL,NULL,NULL,NULL),(639,4,NULL,NULL,'<p>От выбора самосвала зависит очень многое, например, качество и скорость выполнения строительных работ на участке.&nbsp;<br /><br />Этот материал подскажет вам, по каким признакам стоит выбирать самосвал в аренду.<br /><br />Если у вас остались вопросы, то мы с радостью вам поможем.&nbsp;</p>',NULL,NULL,NULL),(640,4,NULL,NULL,'<p>В нашем автопарке появились автокраны. С их помощью вы сможете выполнять больший спект строительных работ.&nbsp;<br /><br />На данный момент для аренды доступно 5 машин. Первому клиенту, позвонившему нам, мы снизим стоимость на аренду автокрана на 2000 рублей.<br /><br />Звоните скорее, если вы хотите арендовать автокран по выгодной стоимости.&nbsp;</p>',NULL,NULL,NULL),(641,4,NULL,NULL,'<p><span>Весна&nbsp;<span>&mdash;<span>&nbsp;</span></span> самое время для начала нового строительства. Всем клиентам, обратившимся к нам с 1 марта по 30 мая, мы дарим скидку 14% на аренду всей нашей спецтехники.&nbsp;<br /><br />Вся спецтехника в нашем автопарке предоставляется с оператором. Скидку мы предоставляем при условии аренды спецтехники на срок от 1 дня.<br /><br />Поспешите, количество машин в автопарке ограничено.&nbsp;</span></p>',NULL,NULL,NULL),(642,4,NULL,NULL,'<p>Прекрасное предложение для наших постоянных клиентов. Если вы планируете арендовать спецтехнику на срок от 5 месяцев, то мы предоставим вам скидку 50% со второго месяца аренды.</p>\r\n<p>Взять спецтехнику в аренду с внушительной скидкой можно до 20 ноября 2020 года.</p>\r\n<p>Спешите, количество машин в автопарке ограничено!</p>',NULL,NULL,NULL),(663,2,NULL,'Портфолио компании Стройтех',NULL,NULL,NULL,NULL),(663,5,NULL,'Фотографии автопарка нашей спецтехники вы найдете в этом разделе на сайте.',NULL,NULL,NULL,NULL),(663,6,NULL,'стройтех фото, стройтех портфолио',NULL,NULL,NULL,NULL),(643,3,NULL,'Наши услуги',NULL,NULL,NULL,NULL),(643,2,NULL,'Аренда спецтехники в СПб - спецтехника для строительства от Стройтех',NULL,NULL,NULL,NULL),(643,6,NULL,'аренда спецтехники спб, аренда спецтехники стройтех',NULL,NULL,NULL,NULL),(643,5,NULL,'Каталог спецтехники для аренды в СПб недорого от компании Стройтех - тут вы найдете полный ассортимент нашего автопарка.',NULL,NULL,NULL,NULL),(643,267,NULL,NULL,'<p>Аренда спецтехники&nbsp;&mdash; это намного выгоднее, чем ее&nbsp;покупка, если проведение строительных работ на&nbsp;предприятии не&nbsp;осуществляется на&nbsp;постоянной основе.<br /> В&nbsp;этом разделе вы&nbsp;сможете ознакомиться со&nbsp;спецтехникой, которую предлагает в&nbsp;аренду наша компания, а&nbsp;также узнать цены.<br /> Преимущества нашей спецтехники:</p>\r\n<ul>\r\n<li>В&nbsp;нашем автопарке спецтехника для аренды не&nbsp;старше 5 лет.</li>\r\n<li>Мы&nbsp;постоянно отправляем нашу спецтехнику на&nbsp;ТО&nbsp;и&nbsp;своевременно устраняем неполадки.</li>\r\n<li>Все вышеперечисленное мы&nbsp;можем подтвердить документально.</li>\r\n</ul>\r\n<p>Позвоните нам по&nbsp;телефону 8-888-88-88, чтобы узнать стоимость аренды спецтехники в&nbsp;нашей компании. Также мы&nbsp;поможем вам подобрать спецтехнику конкретно для ваших нужд.</p>',NULL,NULL,NULL),(644,2,NULL,'Аренда бульдозеров в СПб - спецтехника от компании Стройтех',NULL,NULL,NULL,NULL),(644,6,NULL,'аренда бульдозера спб, аренда бульдозера недорого',NULL,NULL,NULL,NULL),(644,5,NULL,'Аренда бульдозера в СПб недорого, почасовая оплата, условия аренды читайте на сайте нашей компании.',NULL,NULL,NULL,NULL),(644,267,NULL,NULL,'<p>Аренда бульдозера значительно сэкономит ваши средства. В&nbsp;среднем, покупка бульдозера обойдется вам в&nbsp;8&nbsp;миллионов рублей. Согласитесь, если строительной работы не&nbsp;производятся вами на&nbsp;постоянной основе, то&nbsp;такие большие траты довольно нерациональны.</p>\r\n<p>В&nbsp;этом разделе вы&nbsp;найдете бульдозеры из&nbsp;нашего автопарка.</p>',NULL,NULL,NULL),(645,2,NULL,'Аренда самосвалов в СПб недорого - спецтехника Стройтех',NULL,NULL,NULL,NULL),(645,6,NULL,'аренда самосвала спб недорого, аренда самосвала спб',NULL,NULL,NULL,NULL),(645,5,NULL,'Аренду самосвала в СПБ недорого посуточно предоставляет компания СтройТех, условия аренды читайте на сайте.',NULL,NULL,NULL,NULL),(645,267,NULL,NULL,'<p>Аренда самосвала с&nbsp;оператором станет отличной возможностью сэкономить денежные средства без потери качества.</p>\r\n<p>В&nbsp;каких случаях вам может потребоваться самосвал:</p>\r\n<ul>\r\n<li>Для перевозки сухих продуктов.</li>\r\n<li>Для вывоза грунта.</li>\r\n</ul>\r\n<p>В&nbsp;этом разделе вы&nbsp;найдете полную информацию о&nbsp;самосвалах из&nbsp;нашего автопарка.</p>',NULL,NULL,NULL),(646,2,NULL,'Аренда автокранов в СПб недорого - спецтехника Стройтех',NULL,NULL,NULL,NULL),(646,6,NULL,'аренда автокрана спб, аренда автокрана недорого',NULL,NULL,NULL,NULL),(646,5,NULL,'Аренда автокрана в СПб недорого - в компании СтройТех мы представляем стройтехнику в аренду посуточно, условия читайте на сайте.',NULL,NULL,NULL,NULL),(646,267,NULL,NULL,'<p>При совершении масштабных строительно-монтажных работ часто возникает нужда в перемещении многотонных грузов. В таких случаях аренда автокрана с оператором значительно сэкономит ваши силы и время.</p>\r\n<p>В этом разделе вы можете ознакомиться с нашим автопарком.</p>',NULL,NULL,NULL),(647,2,NULL,'Аренда гидромолота в СПБ недорого - спецтехника Стройтех',NULL,NULL,NULL,NULL),(647,3,NULL,'Аренда гидромолотов',NULL,NULL,NULL,NULL),(647,6,NULL,'аренда гидромолота спб, аренда гидромолота недорого',NULL,NULL,NULL,NULL),(647,5,NULL,'Аренда гидромолота в СПБ недорого, по договору, с оператором. Компания СтройТех предоставляет технику в аренду посуточно.',NULL,NULL,NULL,NULL),(648,2,NULL,'Аренда вибропогружателя в СПб недорого - спецтехника Стройтех',NULL,NULL,NULL,NULL),(648,3,NULL,'Аренда вибропогружателей',NULL,NULL,NULL,NULL),(648,6,NULL,'аренда вибропогружателя в спб, аренда вибропогружателя недорого',NULL,NULL,NULL,NULL),(648,5,NULL,'Аренда вибропогружателя в СПб недорого с оператором, оплата почасовая - условия компании СтройТех.',NULL,NULL,NULL,NULL),(649,2,NULL,'Аренда экскаваторов в СПб недорого - спецтехника СтройТех',NULL,NULL,NULL,NULL),(649,6,NULL,'аренда экскаватора спб, аренда экскаватора спб недорого',NULL,NULL,NULL,NULL),(649,5,NULL,'Аренда экскаватора в СПб недорого, с оператором, оплата почасовая - все это возможно в компании СтройТех.',NULL,NULL,NULL,NULL),(649,267,NULL,NULL,'<p>Аренда экскаватора с&nbsp;оператором&nbsp;&mdash; отличное решение. С такой техникой вы&nbsp;значительно ускорите процесс строительства.<br /> В&nbsp;нашем автопарке представлены только лучшие экскаваторы на&nbsp;рынке. Выбирайте тот, который подходит вам по&nbsp;техническим характеристикам. Мы&nbsp;ответим на&nbsp;все ваши вопросы.</p>',NULL,NULL,NULL),(650,2,NULL,'Аренда Асфальтоукладчика в СПб недорого - спецтехника Стройтех',NULL,NULL,NULL,NULL),(650,6,NULL,'аренда асфальтоукладчика спб, аренда асфальтоукладчика недорого',NULL,NULL,NULL,NULL),(650,5,NULL,'Аренда асфальтоукладчика в СПб недорого - в компании Стройтех техника предоставляется в аренду с оператором.',NULL,NULL,NULL,NULL),(650,267,NULL,NULL,'<p>Если вам требуется строить дороги или укладывать асфальт, то&nbsp;без помощи асфальтоукладчика вам не&nbsp;обойтись.</p>\r\n<p>В&nbsp;нашей компании вы&nbsp;можете арендовать асфальтоукладчики следующих разновидностей:</p>\r\n<ul>\r\n<li>Тротуарный асфальтоукладчик.</li>\r\n<li>Гусеничный автоукладчик.</li>\r\n</ul>\r\n<p>В&nbsp;этом разделе вы&nbsp;найдете информацию обо всех асфальтоукладчиках из&nbsp;нашего автопарка.</p>',NULL,NULL,NULL),(651,2,NULL,'Аренда вездехода в СПБ недорого - спецтехника Стройтех',NULL,NULL,NULL,NULL),(651,6,NULL,'аренда вездехода спб, аренда вездехода недорого',NULL,NULL,NULL,NULL),(651,5,NULL,'Аренда вездехода в СПБ, недорого, с оператором, обращайтесь в компанию Стройтех.',NULL,NULL,NULL,NULL),(651,267,NULL,NULL,'<p>Вездеход пригодится в ситуации, когда ваша стройплощадка находится в труднодоступном месте. Также он поможет в тех случаях, когда необходим прицеп.</p>\r\n<p>В этом разделе вы найдете информацию обо всех вездеходах, что есть в нашем автопарке.</p>',NULL,NULL,NULL),(652,416,NULL,NULL,'<h2>Komatsu&nbsp;<strong>D31E-20</strong></h2>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>Масса</td>\r\n<td>8 тонн</td>\r\n</tr>\r\n<tr>\r\n<td>Ширина отвала</td>\r\n<td>до 2,5 метров</td>\r\n</tr>\r\n<tr>\r\n<td>Цена аренды (посуточно)</td>\r\n<td>от 1800 рублей</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<p>Звоните нам, чтобы забронировать бульдозер!</p>',NULL,NULL,NULL),(653,6,NULL,'Аренда бульдозера KOMATSU D21A-7 спб, Аренда бульдозера KOMATSU D21A-7',NULL,NULL,NULL,NULL),(653,5,NULL,'Аренда бульдозера KOMATSU D21A-7 в СПБ с оператором - звоните, стоит недорого!',NULL,NULL,NULL,NULL),(653,416,NULL,NULL,'<table>\r\n<tbody>\r\n<tr>\r\n<td>Масса</td>\r\n<td>4 тонны</td>\r\n</tr>\r\n<tr>\r\n<td>Ширина отвала</td>\r\n<td>до 2 метров</td>\r\n</tr>\r\n<tr>\r\n<td>Цена аренды (посуточно)</td>\r\n<td>от 1400 рублей</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;Позвоните нам, чтобы заказать бульдозер в аренду!</p>',NULL,NULL,NULL),(654,2,NULL,'Аренда Самосвала 18-20 кубов в СПБ - Стройтех',NULL,NULL,NULL,NULL),(654,6,NULL,'Аренда Самосвала 18-20 спб, Аренда Самосвала 18-20 недорого',NULL,NULL,NULL,NULL),(654,5,NULL,'Аренда Самосвала 18-20  в спб недорого с оператором - звоните!',NULL,NULL,NULL,NULL),(654,416,NULL,NULL,'<p>&nbsp;</p>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>Марки самосвалов</td>\r\n<td><span>SCANIA, VOLVO, KAMAZ</span></td>\r\n</tr>\r\n<tr>\r\n<td>Объем кузова</td>\r\n<td>от 18 до 20</td>\r\n</tr>\r\n<tr>\r\n<td>Стоимость аренды (оплата почасовая)</td>\r\n<td>800 рублей</td>\r\n</tr>\r\n</tbody>\r\n</table>',NULL,NULL,NULL),(655,2,NULL,'Аренда Самосвал 10-12 кубов в СПб - Стройтех',NULL,NULL,NULL,NULL),(655,6,NULL,'Аренда Самосвал 10-12 кубов в спб, Аренда Самосвал 10-12 кубов в СПб недорого',NULL,NULL,NULL,NULL),(655,5,NULL,'Аренда Самосвала 10-12 кубов в СПб недорого, с оператором - звоните!',NULL,NULL,NULL,NULL),(655,416,NULL,NULL,'<p>&nbsp;</p>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>Марки самосвалов в нашем автопарке</td>\r\n<td>SCANIA, VOLVO, KAMAZ</td>\r\n</tr>\r\n<tr>\r\n<td>Объем кузова</td>\r\n<td>от 10 до 12 кубов</td>\r\n</tr>\r\n<tr>\r\n<td>Стоимость аренды (почасовая)</td>\r\n<td>от 500 рублей</td>\r\n</tr>\r\n</tbody>\r\n</table>',NULL,NULL,NULL),(656,2,NULL,'Аренда Автокрана 25 тонн КС-55713 в СПб - Стройтех',NULL,NULL,NULL,NULL),(656,6,NULL,'аренда Автокрана 25 тонн КС-55713 спб, Автокран 25 тонн КС-55713 недорого аренда',NULL,NULL,NULL,NULL),(656,5,NULL,'Аренда Автокрана 25 тонн КС-55713 в СПб недорого, с оператором, звоните.',NULL,NULL,NULL,NULL),(656,416,NULL,NULL,'<p>&nbsp;</p>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>Грузоподъемность</td>\r\n<td>25 тонн</td>\r\n</tr>\r\n<tr>\r\n<td>Вылет стрелы</td>\r\n<td>от 2,0 до 29,7 м</td>\r\n</tr>\r\n<tr>\r\n<td>Габариты</td>\r\n<td>Д12,5*Ш2,8*В3,6</td>\r\n</tr>\r\n<tr>\r\n<td>Шасси</td>\r\n<td>КАМАЗ 65115</td>\r\n</tr>\r\n<tr>\r\n<td>Цена за аренду (почасовая)</td>\r\n<td>1200 рублей</td>\r\n</tr>\r\n</tbody>\r\n</table>',NULL,NULL,NULL),(657,2,NULL,'Аренда Автокрана 14-16 тонн КС-35715 в СПб - Стройтех',NULL,NULL,NULL,NULL),(657,6,NULL,'Аренда Автокрана 14-16 тонн КС-35715 в СПб, Аренда Автокрана 14-16 тонн КС-35715 недорого',NULL,NULL,NULL,NULL),(657,5,NULL,'Аренда Автокрана 14-16 тонн КС-35715 в СПб недорого, с оператором, звоните!',NULL,NULL,NULL,NULL),(657,416,NULL,NULL,'<p>&nbsp;</p>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>Грузоподъемность</td>\r\n<td>16 тонн</td>\r\n</tr>\r\n<tr>\r\n<td>Вылет стрелы</td>\r\n<td>1,9&nbsp;<span>&mdash;<span>&nbsp;</span></span>30 м</td>\r\n</tr>\r\n<tr>\r\n<td>Габариты</td>\r\n<td>Д 10,8* Ш2 В3,8</td>\r\n</tr>\r\n<tr>\r\n<td>Шасси</td>\r\n<td>УРАЛ 5553</td>\r\n</tr>\r\n<tr>\r\n<td>Цена аренды (почасовая)</td>\r\n<td>1000 рублей</td>\r\n</tr>\r\n</tbody>\r\n</table>',NULL,NULL,NULL),(722,2,NULL,'Аренда гидромолота в СПБ недорого - спецтехника Стройтех',NULL,NULL,NULL,NULL),(722,6,NULL,'аренда гидромолота спб, аренда гидромолота недорого',NULL,NULL,NULL,NULL),(722,5,NULL,'Аренда гидромолота в СПБ недорого, по договору, с оператором. Компания СтройТех предоставляет технику в аренду посуточно.',NULL,NULL,NULL,NULL),(722,416,NULL,NULL,'<h2>Экскаватор-погрузчик с гидромолотом</h2>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td><span>Мощность удара&nbsp;</span></td>\r\n<td><span>3000Кдж</span></td>\r\n</tr>\r\n<tr>\r\n<td><span>Цена аренды (почасовая)</span></td>\r\n<td>1800 рублей</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>',NULL,NULL,NULL),(722,334,1558512104,NULL,NULL,NULL,NULL,NULL),(723,2,NULL,'Аренда вибропогружателя в СПб недорого - спецтехника Стройтех',NULL,NULL,NULL,NULL),(723,6,NULL,'аренда вибропогружателя в спб, аренда вибропогружателя недорого',NULL,NULL,NULL,NULL),(723,5,NULL,'Аренда вибропогружателя в СПб недорого с оператором, оплата почасовая - условия компании СтройТех.',NULL,NULL,NULL,NULL),(723,416,NULL,NULL,'<h2>Вибропогружатель MOVAX</h2>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>Глубина погружения</td>\r\n<td>до 12 метров</td>\r\n</tr>\r\n<tr>\r\n<td>Стоимость аренды (посменно)</td>\r\n<td>от 50 000 рублей</td>\r\n</tr>\r\n</tbody>\r\n</table>',NULL,NULL,NULL),(723,334,1558513127,NULL,NULL,NULL,NULL,NULL),(658,2,NULL,'Аренда самосвала планировщика УДС 114 - Стройтех',NULL,NULL,NULL,NULL),(658,6,NULL,'аренда самосвала планировщика удс 114, аренда самосвала планировщика',NULL,NULL,NULL,NULL),(658,5,NULL,'Аренда самосвала планировщика УДС 114 в компании Стройтех в СПб недорого, звоните!',NULL,NULL,NULL,NULL),(658,416,NULL,NULL,'<table>\r\n<tbody>\r\n<tr>\r\n<td>Глубина копания</td>\r\n<td>6,6 м</td>\r\n</tr>\r\n<tr>\r\n<td>Максимальная высота планировки</td>\r\n<td>7,7 м</td>\r\n</tr>\r\n<tr>\r\n<td>Цена аренды (посуточно)</td>\r\n<td>1400 рублей</td>\r\n</tr>\r\n</tbody>\r\n</table>',NULL,NULL,NULL),(659,2,NULL,'Аренда экскаватора гусеничного с планировочным ковшом - Стройтех',NULL,NULL,NULL,NULL),(659,6,NULL,'аренда гусеничного экскаватора, аренда гусеничного экскаватора с ковшом',NULL,NULL,NULL,NULL),(659,5,NULL,'﻿Аренда экскаватора гусеничного с планировочным ковшом доступна в компании Стройтех. Звоните!',NULL,NULL,NULL,NULL),(659,416,NULL,NULL,'<table>\r\n<tbody>\r\n<tr>\r\n<td>Глубина копания</td>\r\n<td>до 7 метров</td>\r\n</tr>\r\n<tr>\r\n<td>Максимальная высота планировки</td>\r\n<td>от 3,3 метров</td>\r\n</tr>\r\n<tr>\r\n<td>Цена аренды (посуточно)</td>\r\n<td>1400 рублей</td>\r\n</tr>\r\n</tbody>\r\n</table>',NULL,NULL,NULL),(660,2,NULL,'Аренда асфальтоукладчика Vogele 800 - Стройтех',NULL,NULL,NULL,NULL),(660,6,NULL,'Аренда асфальтоукладчика Vogele 800, Аренда асфальтоукладчика Vogele',NULL,NULL,NULL,NULL),(660,5,NULL,'﻿Аренда асфальтоукладчика Vogele 800 посуточно, с оператором от компании Стройтех.',NULL,NULL,NULL,NULL),(660,416,NULL,NULL,'<table>\r\n<tbody>\r\n<tr>\r\n<td>Масса</td>\r\n<td>6200 кг</td>\r\n</tr>\r\n<tr>\r\n<td><span>Ширина укладки</span></td>\r\n<td><span>1,2м - 3,2 м</span></td>\r\n</tr>\r\n<tr>\r\n<td><span>Скорость укладки</span></td>\r\n<td><span><span>&nbsp;</span>30м/мин</span></td>\r\n</tr>\r\n<tr>\r\n<td><span>Производительность&nbsp;<span><br /></span></span></td>\r\n<td><span><span>250 т/час</span></span></td>\r\n</tr>\r\n<tr>\r\n<td>Цена на аренду (почасовая)</td>\r\n<td>3000 рублей</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>',NULL,NULL,NULL),(661,2,NULL,'Аренда асфальтоукладчика тротуарного Vogele 1300-2 - Стройтех',NULL,NULL,NULL,NULL),(661,6,NULL,'Аренда асфальтоукладчика тротуарного Vogele 1300-2, Аренда асфальтоукладчика тротуарного Vogele',NULL,NULL,NULL,NULL),(661,5,NULL,'Аренда асфальтоукладчика тротуарного Vogele 1300-2 посуточно, с оператором от компании Стройтех.',NULL,NULL,NULL,NULL),(661,416,NULL,NULL,'<p>&nbsp;</p>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>Масса</td>\r\n<td>20000 кг</td>\r\n</tr>\r\n<tr>\r\n<td>Ширина укладки</td>\r\n<td>2,5&nbsp;<span>&mdash;<span>&nbsp;</span></span>5,8 кг</td>\r\n</tr>\r\n<tr>\r\n<td><span>Скорость укладки&nbsp;</span></td>\r\n<td><span>25м/мин</span></td>\r\n</tr>\r\n<tr>\r\n<td><span>Производительность<span>&nbsp;</span></span></td>\r\n<td><span>550 т/час</span></td>\r\n</tr>\r\n</tbody>\r\n</table>',NULL,NULL,NULL),(662,2,NULL,'Аренда самосвала-вездехода в СПБ - Стройтех',NULL,NULL,NULL,NULL),(662,6,NULL,'Аренда самосвала-вездехода в СПб, аренда самосвала вездехода недорого',NULL,NULL,NULL,NULL),(662,5,NULL,'Аренда самосвала-вездехода в компании Стройтех, в СПб, недорого, с оператором, звоните!',NULL,NULL,NULL,NULL),(662,416,NULL,NULL,'<p>&nbsp;</p>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>Объем кузова</td>\r\n<td>\r\n<p>14&nbsp;м&sup3;</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>Цена за аренду (почасовая)</td>\r\n<td>3400 рублей</td>\r\n</tr>\r\n</tbody>\r\n</table>',NULL,NULL,NULL),(623,418,NULL,'Поиск',NULL,NULL,NULL,NULL),(637,2,NULL,'Контакты компании СтройТех - адрес, телефон',NULL,NULL,NULL,NULL),(637,4,NULL,NULL,'<table class=\"contact_info\">\r\n<tbody>\r\n<tr class=\"contact_info_block contact_address\">\r\n<td class=\"contact_title\">\r\n<div>Адрес:</div>\r\n</td>\r\n<td class=\"contact_value\">\r\n<div>ул. Добрая д. 55</div>\r\n</td>\r\n</tr>\r\n<tr class=\"contact_info_block contact_time\">\r\n<td class=\"contact_title\">\r\n<div>Время работы:</div>\r\n</td>\r\n<td class=\"contact_value\">\r\n<div>с 9:00 до 19:00</div>\r\n</td>\r\n</tr>\r\n<tr class=\"contact_info_block contact_phone\">\r\n<td class=\"contact_title\">\r\n<div>Телефон:</div>\r\n</td>\r\n<td class=\"contact_value\">\r\n<div>+7 (812) 274-78-78; +7 (812) 274-78-78;</div>\r\n</td>\r\n</tr>\r\n<tr class=\"contact_info_block contact_fax\">\r\n<td class=\"contact_title\">\r\n<div>Факс:</div>\r\n</td>\r\n<td class=\"contact_value\">\r\n<div>+7 (812) 274-78-78;</div>\r\n</td>\r\n</tr>\r\n<tr class=\"contact_info_block contact_skype\">\r\n<td class=\"contact_title\">\r\n<div>Skype:</div>\r\n</td>\r\n<td class=\"contact_value\">\r\n<div><a href=\"skype:support\">support</a></div>\r\n</td>\r\n</tr>\r\n<tr class=\"contact_info_block contact_email\">\r\n<td class=\"contact_title\">\r\n<div>Email:</div>\r\n</td>\r\n<td class=\"contact_value\">\r\n<div><a href=\"mailto:infotest@ast.com\">infotest@ast.com</a></div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div class=\"code_pre yandex_map\"><iframe frameborder=\"0\" src=\"https://yandex.ru/map-widget/v1/?um=constructor%3Ad99c67a2619bedaa9b4f611d4ea21367fa9a0f783f99b7594f64b11b6d98f849&amp;source=constructor\" width=\"100%\" height=\"400\"></iframe></div>',NULL,NULL,NULL),(637,5,NULL,'Контакты компании Стройтех вы найдете в этом разделе на нашем сайте.',NULL,NULL,NULL,NULL),(637,6,NULL,'стройтех контакты, стройтех адрес, стройтех телефон',NULL,NULL,NULL,NULL),(727,295,NULL,'Администратор',NULL,NULL,NULL,NULL),(727,296,NULL,'infotest@ast.com',NULL,NULL,NULL,NULL),(727,297,NULL,'102',NULL,NULL,NULL,NULL),(728,281,NULL,'178.16.152.254',NULL,NULL,NULL,NULL),(728,408,NULL,'tetet',NULL,NULL,NULL,NULL),(728,409,NULL,'ab@umisoft.ru',NULL,NULL,NULL,NULL),(728,410,NULL,'tetet',NULL,NULL,NULL,NULL),(728,411,NULL,NULL,'fsdfdsf',NULL,NULL,NULL),(728,280,NULL,'infotest@ast.com',NULL,NULL,NULL,NULL),(728,282,1558534252,NULL,NULL,NULL,NULL,NULL),(729,294,102,NULL,NULL,NULL,NULL,NULL),(730,281,NULL,'178.16.152.254',NULL,NULL,NULL,NULL),(730,408,NULL,'tetet',NULL,NULL,NULL,NULL),(730,409,NULL,'ab@umisoft.ru',NULL,NULL,NULL,NULL),(730,410,NULL,'tetet',NULL,NULL,NULL,NULL),(730,411,NULL,NULL,'fdfdfdf',NULL,NULL,NULL),(730,280,NULL,'infotest@ast.com',NULL,NULL,NULL,NULL),(730,282,1558596268,NULL,NULL,NULL,NULL,NULL),(731,281,NULL,'178.16.152.254',NULL,NULL,NULL,NULL),(731,408,NULL,'tetet',NULL,NULL,NULL,NULL),(731,409,NULL,'artyom.babeykin@umisoft.ru',NULL,NULL,NULL,NULL),(731,410,NULL,'tetet',NULL,NULL,NULL,NULL),(731,411,NULL,NULL,'fsdfdsf',NULL,NULL,NULL),(731,280,NULL,'infotest@ast.com',NULL,NULL,NULL,NULL),(731,282,1558598156,NULL,NULL,NULL,NULL,NULL),(732,281,NULL,'178.16.152.254',NULL,NULL,NULL,NULL),(732,408,NULL,'tetet',NULL,NULL,NULL,NULL),(732,409,NULL,'artyom.babeykin@umisoft.ru',NULL,NULL,NULL,NULL),(732,410,NULL,'tetet',NULL,NULL,NULL,NULL),(732,411,NULL,NULL,'sfdsf',NULL,NULL,NULL),(732,280,NULL,'infotest@ast.com',NULL,NULL,NULL,NULL),(732,282,1558598183,NULL,NULL,NULL,NULL,NULL),(733,281,NULL,'178.16.152.254',NULL,NULL,NULL,NULL),(733,408,NULL,'tetet',NULL,NULL,NULL,NULL),(733,409,NULL,'ab@umisoft.ru',NULL,NULL,NULL,NULL),(733,410,NULL,'tetet',NULL,NULL,NULL,NULL),(733,411,NULL,NULL,'fsdfdsf',NULL,NULL,NULL),(733,280,NULL,'infotest@ast.com',NULL,NULL,NULL,NULL),(733,282,1558598211,NULL,NULL,NULL,NULL,NULL),(729,293,NULL,NULL,'<p>Спасибо за интерес. Мы ответим на ваше письмо в ближайшее время.</p>',NULL,NULL,NULL),(734,281,NULL,'178.16.152.254',NULL,NULL,NULL,NULL),(734,408,NULL,'tetet',NULL,NULL,NULL,NULL),(734,409,NULL,'ab@umisoft.ru',NULL,NULL,NULL,NULL),(734,410,NULL,'tetet',NULL,NULL,NULL,NULL),(734,411,NULL,NULL,'fdsf',NULL,NULL,NULL),(734,280,NULL,'infotest@ast.com',NULL,NULL,NULL,NULL),(734,282,1558598256,NULL,NULL,NULL,NULL,NULL),(735,281,NULL,'178.16.152.254',NULL,NULL,NULL,NULL),(735,408,NULL,'tetet',NULL,NULL,NULL,NULL),(735,409,NULL,'ab@umisoft.ru',NULL,NULL,NULL,NULL),(735,410,NULL,'tetet',NULL,NULL,NULL,NULL),(735,411,NULL,NULL,'fdfsdfd',NULL,NULL,NULL),(735,280,NULL,'infotest@ast.com',NULL,NULL,NULL,NULL),(735,282,1558598313,NULL,NULL,NULL,NULL,NULL),(623,422,NULL,NULL,'<p>Настоящим подтверждаю, что ознакомлен и согласен с условиями <a href=\"/files/pdn.doc\">Политики в отношении обработки персональных данных</a>.</p>',NULL,NULL,NULL),(623,423,NULL,'Необходимо согласие на обработку персональных данных',NULL,NULL,NULL,NULL),(743,281,NULL,'178.16.152.254',NULL,NULL,NULL,NULL),(743,408,NULL,'test',NULL,NULL,NULL,NULL),(743,409,NULL,'test@email.ru',NULL,NULL,NULL,NULL),(743,410,NULL,'test',NULL,NULL,NULL,NULL),(743,411,NULL,NULL,'test',NULL,NULL,NULL),(743,280,NULL,'infotest@ast.com',NULL,NULL,NULL,NULL),(743,282,1558607571,NULL,NULL,NULL,NULL,NULL),(744,281,NULL,'178.16.152.254',NULL,NULL,NULL,NULL),(744,408,NULL,'tetet',NULL,NULL,NULL,NULL),(744,409,NULL,'test@email.ru',NULL,NULL,NULL,NULL),(744,410,NULL,'tetet',NULL,NULL,NULL,NULL),(744,411,NULL,NULL,'tetetetetet',NULL,NULL,NULL),(744,280,NULL,'infotest@ast.com',NULL,NULL,NULL,NULL),(744,282,1558607930,NULL,NULL,NULL,NULL,NULL),(745,281,NULL,'178.16.152.254',NULL,NULL,NULL,NULL),(745,408,NULL,'tetet',NULL,NULL,NULL,NULL),(745,409,NULL,'artyom.babeykin@umisoft.ru',NULL,NULL,NULL,NULL),(745,410,NULL,'tetet',NULL,NULL,NULL,NULL),(745,411,NULL,NULL,'testet',NULL,NULL,NULL),(745,280,NULL,'infotest@ast.com',NULL,NULL,NULL,NULL),(745,282,1558611802,NULL,NULL,NULL,NULL,NULL),(746,281,NULL,'178.16.152.254',NULL,NULL,NULL,NULL),(746,408,NULL,'tetet',NULL,NULL,NULL,NULL),(746,409,NULL,'artyom.babeykin@umisoft.ru',NULL,NULL,NULL,NULL),(746,410,NULL,'fsdfsdf',NULL,NULL,NULL,NULL),(746,411,NULL,NULL,'sdfsdffs',NULL,NULL,NULL),(746,280,NULL,'infotest@ast.com',NULL,NULL,NULL,NULL),(746,282,1558611936,NULL,NULL,NULL,NULL,NULL),(747,281,NULL,'178.16.152.254',NULL,NULL,NULL,NULL),(747,408,NULL,'test',NULL,NULL,NULL,NULL),(747,409,NULL,'test@email.ru',NULL,NULL,NULL,NULL),(747,410,NULL,'tetet',NULL,NULL,NULL,NULL),(747,411,NULL,NULL,'teststst',NULL,NULL,NULL),(747,280,NULL,'infotest@ast.com',NULL,NULL,NULL,NULL),(747,282,1558613091,NULL,NULL,NULL,NULL,NULL),(748,281,NULL,'178.16.152.254',NULL,NULL,NULL,NULL),(748,408,NULL,'tetet',NULL,NULL,NULL,NULL),(748,409,NULL,'artyom.babeykin@umisoft.ru',NULL,NULL,NULL,NULL),(748,410,NULL,'tetet',NULL,NULL,NULL,NULL),(748,411,NULL,NULL,'fgdfgdfg',NULL,NULL,NULL),(748,280,NULL,'infotest@ast.com',NULL,NULL,NULL,NULL),(748,282,1558613125,NULL,NULL,NULL,NULL,NULL),(749,281,NULL,'178.16.152.254',NULL,NULL,NULL,NULL),(749,408,NULL,'fsdfsdf',NULL,NULL,NULL,NULL),(749,409,NULL,'artyom.babeykin@umisoft.ru',NULL,NULL,NULL,NULL),(749,410,NULL,'tetet',NULL,NULL,NULL,NULL),(749,411,NULL,NULL,'fsdfsdfsdf',NULL,NULL,NULL),(749,280,NULL,'infotest@ast.com',NULL,NULL,NULL,NULL),(749,282,1558613159,NULL,NULL,NULL,NULL,NULL),(750,281,NULL,'178.16.152.254',NULL,NULL,NULL,NULL),(750,408,NULL,'tetet',NULL,NULL,NULL,NULL),(750,409,NULL,'artyom.babeykin@umisoft.ru',NULL,NULL,NULL,NULL),(750,410,NULL,'tetet',NULL,NULL,NULL,NULL),(750,411,NULL,NULL,'fsdfsdf',NULL,NULL,NULL),(750,280,NULL,'infotest@ast.com',NULL,NULL,NULL,NULL),(750,282,1558613177,NULL,NULL,NULL,NULL,NULL),(624,4,NULL,NULL,'',NULL,NULL,NULL),(624,431,NULL,NULL,'<div class=\"direction_block_title\">аренда</div>\r\n<div class=\"direction_block_subtitle\">строительной</div>\r\n<div class=\"direction_block_subtitle\">техники</div>',NULL,NULL,NULL),(624,430,NULL,NULL,NULL,NULL,3,NULL),(624,424,NULL,'Наши услуги',NULL,NULL,NULL,NULL),(624,425,NULL,NULL,'<p>Аренда строительной техники в нашей компании &mdash; это всегда внимательное и вежливое отношение к заказчику, конкурентные цены и отличная надежная рабочая машина!</p>',NULL,NULL,NULL),(624,426,NULL,NULL,'<p>Мы мастера своего дела и относимся к своей работе со всей ответственностью. Будь это своевременное предоставление строительных машин на объект или оформление первичных бухгалтерских документов, наши сотрудники <span>удивят вас скоростью своей работы и высоким уровнем сервиса</span></p>',NULL,NULL,NULL),(624,427,NULL,NULL,'<ul class=\"advantages_block\">\r\n<li class=\"pag_nav_1 simple-text-14\">\r\n<div class=\"advantages_block-icon\"></div>\r\n<p class=\"p-head\">Собственный парк спецтехники</p>\r\n</li>\r\n<li class=\"pag_nav_1 simple-text-14\">\r\n<div class=\"advantages_block-icon\"></div>\r\n<p class=\"p-head\">Оперативная поставка спецтехники</p>\r\n</li>\r\n<li class=\"pag_nav_2 simple-text-14\">\r\n<div class=\"advantages_block-icon\"></div>\r\n<p class=\"p-head\">Гарантия выполнения работ<img id=\"__mce_tmp\" alt=\"\" /></p>\r\n</li>\r\n</ul>',NULL,NULL,NULL),(624,428,NULL,'Популярные модели',NULL,NULL,NULL,NULL),(624,432,NULL,NULL,NULL,NULL,9,NULL),(624,433,NULL,NULL,NULL,NULL,4,NULL),(624,434,NULL,NULL,'<p>Наша компания предоставляет спецтехнику в&nbsp;аренду. Мы&nbsp;зарекомендовали себя как надежный партнер. Обратившись к&nbsp;нам, вы&nbsp;получите только новую технику, а&nbsp;еще профессионального оператора. Он&nbsp;выполнит все требуемые от&nbsp;него задачи.</p>',NULL,NULL,NULL),(623,396,NULL,NULL,NULL,627,NULL,NULL),(644,3,NULL,'Аренда бульдозеров',NULL,NULL,NULL,NULL),(658,435,1,NULL,NULL,NULL,NULL,NULL),(654,435,1,NULL,NULL,NULL,NULL,NULL),(662,435,1,NULL,NULL,NULL,NULL,NULL),(656,435,1,NULL,NULL,NULL,NULL,NULL),(659,435,1,NULL,NULL,NULL,NULL,NULL),(723,435,1,NULL,NULL,NULL,NULL,NULL),(722,3,NULL,'Гидромолот С3ПО',NULL,NULL,NULL,NULL),(723,3,NULL,'Вибропогружатель Р2Д2',NULL,NULL,NULL,NULL),(751,40,NULL,'waiting_confirmation',NULL,NULL,NULL,NULL),(751,111,40,NULL,NULL,NULL,NULL,NULL),(752,40,NULL,'refund',NULL,NULL,NULL,NULL),(752,111,80,NULL,NULL,NULL,NULL,NULL),(565,544,6,NULL,NULL,NULL,NULL,NULL),(571,544,5,NULL,NULL,NULL,NULL,NULL),(576,544,2,NULL,NULL,NULL,NULL,NULL),(580,544,1,NULL,NULL,NULL,NULL,NULL),(584,544,4,NULL,NULL,NULL,NULL,NULL),(587,544,3,NULL,NULL,NULL,NULL,NULL),(753,66,NULL,'promoCode',NULL,NULL,NULL,NULL),(753,69,NULL,'emarket-discountrule-850',NULL,NULL,NULL,NULL),(753,68,NULL,NULL,NULL,180,NULL,NULL),(753,68,NULL,NULL,NULL,179,NULL,NULL),(182,539,NULL,NULL,'65d80afa915cfc75861bd47d9b417c3981ea2b14054019c3e6fc773a7cc98bf2',NULL,NULL,NULL),(623,405,1,NULL,NULL,630,NULL,1),(623,405,1,NULL,NULL,635,NULL,5),(623,405,1,NULL,NULL,634,NULL,4),(623,405,1,NULL,NULL,632,NULL,3),(623,405,1,NULL,NULL,631,NULL,2),(754,72,NULL,'YandexTurboPages',NULL,NULL,NULL,NULL),(182,219,NULL,NULL,'a:22:{s:15:\"tree-data-types\";a:1:{s:8:\"expanded\";s:14:\"{0}{3}{61}{47}\";}s:21:\"tree-emarket-delivery\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:21:\"tree-data-guide_items\";a:2:{s:8:\"expanded\";s:3:\"{0}\";s:12:\"used-columns\";s:98:\"name[525.0000305175781px]|identifier[200px]|code[200px]|link[200px]|css_class[317.5521240234375px]\";}s:21:\"tree-content-tpl_edit\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:15:\"tree-content--1\";a:1:{s:8:\"expanded\";s:7:\"{0}{29}\";}s:21:\"tree-umiSettings-read\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:21:\"tree-users-users_list\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:29:\"tree-filemanager-shared_files\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:16:\"tree-data-guides\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:23:\"tree-webforms-addresses\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:19:\"tree-webforms-forms\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:15:\"tree-news-lists\";a:1:{s:8:\"expanded\";s:6:\"{0}{4}\";}s:17:\"tree-catalog-tree\";a:2:{s:8:\"expanded\";s:38:\"{0}{9}{10}{11}{12}{13}{14}{15}{16}{17}\";s:12:\"used-columns\";s:65:\"name[400px]|price[250px]|photo[250px]|image[200px]|popular[200px]\";}s:21:\"tree-photoalbum-lists\";a:1:{s:8:\"expanded\";s:15:\"{0}{29}{31}{30}\";}s:15:\"tree-menu-lists\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:12:\"tree_common0\";a:1:{s:8:\"expanded\";s:7:\"{0}{29}\";}s:16:\"tree-trash-trash\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:22:\"tree-faq-projects_list\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:22:\"tree-webforms-messages\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:23:\"tree-webforms-templates\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:13:\"hidden-groups\";a:1:{i:103;s:18:\"common|more_params\";}s:22:\"tree-users-groups_list\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}}',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cms3_object_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_content_cnt`
--

DROP TABLE IF EXISTS `cms3_object_content_cnt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_object_content_cnt` (
  `obj_id` int(10) unsigned DEFAULT NULL,
  `field_id` int(10) unsigned DEFAULT NULL,
  `cnt` int(10) DEFAULT '0',
  KEY `FK_Contents_Counters to object relation` (`obj_id`),
  KEY `FK_Contents_Counters field id relation` (`field_id`),
  CONSTRAINT `FK_Contents_Counters field id relation` FOREIGN KEY (`field_id`) REFERENCES `cms3_object_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Contents_Counters to object relation` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_content_cnt`
--

LOCK TABLES `cms3_object_content_cnt` WRITE;
/*!40000 ALTER TABLE `cms3_object_content_cnt` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_object_content_cnt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_domain_id_list`
--

DROP TABLE IF EXISTS `cms3_object_domain_id_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_object_domain_id_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `obj_id` int(10) unsigned DEFAULT NULL,
  `field_id` int(10) unsigned DEFAULT NULL,
  `domain_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms3_object_domain_id_list load field value` (`obj_id`,`field_id`),
  KEY `cms3_object_domain_id_list field_id` (`field_id`),
  KEY `cms3_object_domain_id_list obj_id` (`obj_id`),
  KEY `cms3_object_domain_id_list domain_id` (`domain_id`),
  CONSTRAINT `cms3_object_domain_id_list domain id` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms3_object_domain_id_list field id` FOREIGN KEY (`field_id`) REFERENCES `cms3_object_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms3_object_domain_id_list object id` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_domain_id_list`
--

LOCK TABLES `cms3_object_domain_id_list` WRITE;
/*!40000 ALTER TABLE `cms3_object_domain_id_list` DISABLE KEYS */;
INSERT INTO `cms3_object_domain_id_list` VALUES (1,623,381,1);
/*!40000 ALTER TABLE `cms3_object_domain_id_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_field_groups`
--

DROP TABLE IF EXISTS `cms3_object_field_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_object_field_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type_id` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_visible` tinyint(1) DEFAULT NULL,
  `ord` int(11) DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT '0',
  `tip` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Group to type relation_FK` (`type_id`),
  KEY `ord` (`ord`),
  KEY `name` (`name`),
  KEY `title` (`title`),
  KEY `is_active` (`is_active`),
  KEY `is_visible` (`is_visible`),
  KEY `is_locked` (`is_locked`),
  CONSTRAINT `FK_Group to type relation` FOREIGN KEY (`type_id`) REFERENCES `cms3_object_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=362 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_field_groups`
--

LOCK TABLES `cms3_object_field_groups` WRITE;
/*!40000 ALTER TABLE `cms3_object_field_groups` DISABLE KEYS */;
INSERT INTO `cms3_object_field_groups` VALUES (1,'svojstva_statusa_stranicy','i18n::fields-group-svojstva_statusa_stranicy',2,1,1,5,0,''),(2,'common','i18n::fields-group-common',3,1,0,5,1,'Основные настройки страницы'),(4,'more_params','i18n::fields-group-more_params',3,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(5,'rate_props','i18n::fields-group-rate_props',3,1,0,20,1,''),(6,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',3,0,1,25,1,'Управление статусом публикации'),(7,'locks','i18n::fields-group-locks',3,1,1,30,1,''),(8,'common','i18n::fields-group-news-rss-source-charset-common',6,1,1,5,0,''),(9,'common','i18n::fields-group-common',7,1,0,5,0,'Основные настройки ленты новостей'),(11,'more_params','i18n::fields-group-more_params',7,1,0,15,0,'Настройки отображения страницы и её поисковой индексации'),(12,'rate_voters','i18n::fields-group-rate_voters',7,1,0,20,0,''),(13,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',7,0,1,25,1,'Управление статусом публикации'),(14,'locks','i18n::fields-group-locks',7,1,1,30,1,''),(15,'common','i18n::fields-group-common',8,1,1,5,0,''),(16,'props','i18n::fields-group-props',9,1,1,5,0,''),(17,'params_more','i18n::fields-group-dopolnitelno',10,1,1,5,0,'Страна в формате ISO 3166-1 alpha-2'),(18,'common','i18n::fields-group-common',14,1,1,5,0,''),(19,'common','i18n::fields-group-common',15,1,1,5,0,''),(20,'additional','i18n::fields-group-grp_disp_msg_extended',16,1,1,5,0,'Порядковый номер дня недели (1 (Понедельник) - 7 (Воскресение))'),(21,'additional','i18n::fields-group-grp_disp_msg_extended',17,1,1,5,0,'Порядковый номер дня недели (1 (Понедельник) - 7 (Воскресение))'),(24,'props_currency','i18n::fields-group-currency_props',21,1,1,5,0,'Общие настройки валюты'),(26,'common','i18n::fields-group-emarket-mobile-platform-common',23,1,1,5,1,''),(27,'common','i18n::fields-group-emarket-mobile-devices-common',24,1,1,5,0,''),(28,'personal','i18n::fields-group-personal_info',25,1,1,5,1,''),(29,'common','i18n::fields-group-common_group',27,1,1,5,1,''),(30,'common','i18n::common',28,1,1,5,0,''),(31,'common','i18n::common',29,1,1,5,0,''),(32,'discount_type_props','i18n::fields-group-discount_type_props',30,1,1,5,0,''),(33,'discount_modificator_type_props','i18n::fields-group-discount_modificator_type_props',31,1,1,5,0,''),(34,'discount_modificator_props','i18n::fields-group-discount_modificator_props',32,1,1,5,0,''),(35,'discount_rule_type_props','i18n::fields-group-discount_rule_type_props',33,1,1,5,0,''),(36,'discount_rule_props','i18n::fields-group-discount_rule_props',34,1,1,5,0,''),(37,'common','i18n::fields-group-props',35,1,1,5,0,'Настройки формата импорта данных'),(38,'common','i18n::fields-group-props',36,1,1,5,0,'Настройки формата экспорта данных'),(39,'network_system_props','i18n::fields-group-service_props',37,1,1,5,0,''),(40,'props','i18n::fields-group-props',38,1,1,5,1,'Здесь в дополнение к разделам каталога, можно выбрать, какие страницы нужно показывать в социальной сети'),(41,'pages','i18n::fields-group-site_parts',38,1,1,10,1,''),(42,'network_system_props','i18n::fields-group-service_props',38,1,1,15,0,'Настройки интеграции интернет-магазина с социальными сетями'),(43,'svojstva_gruppy_polzovatelej','i18n::fields-group-svojstva_gruppy_polzovatelej',39,1,0,5,1,'Общие настройки группы пользователей'),(44,'common','i18n::fields-group-osnovnoe',40,1,1,5,0,''),(45,'item_type_props','i18n::fields-group-item_type_props',41,1,1,5,0,''),(46,'discount_props','i18n::fields-group-discount_props',42,1,1,5,0,'Управление скидками на товары'),(47,'item_props','i18n::fields-group-order_item_props',44,1,1,5,0,'i18n::field-order-item-discount-value'),(48,'item_optioned_props','i18n::fields-group-item_optioned_props',44,1,1,10,0,''),(49,'trade_offers','i18n::fields-group-trade-offers',44,1,1,15,0,'Торговое предложение товарного наименования'),(50,'order_status_props','i18n::fields-group-order_status_props',45,1,1,5,0,''),(51,'payment_type_props','i18n::fields-group-payment_type_props',46,1,1,5,0,''),(52,'payment_props','i18n::fields-group-payment_props',47,1,1,5,0,'Общие настройки способа оплаты'),(53,'order_status_props','i18n::fields-group-payment_status_props',48,1,1,5,0,''),(54,'general','i18n::fields-group-osnovnoe',49,1,1,5,0,''),(55,'addresses','i18n::fields-group-addresses',49,1,1,10,0,''),(56,'payment','i18n::fields-group-payment_info',49,1,1,15,0,''),(57,'delivery_type_props','i18n::fields-group-delivery_type_props',50,1,1,5,0,''),(58,'delivery_description_props','i18n::fields-group-delivery_description',51,1,1,5,0,'Если установлено - не будет отображаться на сайте'),(59,'order_status_props','i18n::fields-group-delivery_status_props',52,1,1,5,0,''),(60,'order_props','i18n::fields-group-order_props',53,1,1,5,0,'Основная информация о заказе'),(62,'statistic_info','i18n::fields-group-statistic_data',53,1,1,15,0,'Поведенческие данные о покупателе. Используются для анализа эффективности различных каналов продвижения. Получить общую статистику по всем заказам или сделать выборку можно в модуле «Интернет-магазин» —> вкладка «Статистика»'),(63,'order_payment_props','i18n::fields-group-order_payment_props',53,1,1,20,0,'Данные об оплате заказа'),(64,'order_delivery_props','i18n::fields-group-order_delivery_props',53,1,1,25,0,'i18n::fields-group-order_delivery_props-tip'),(65,'order_discount_props','i18n::fields-group-order_discount_props',53,1,1,30,0,''),(66,'integration_date','i18n::fields-group-intergation_props',53,1,1,35,0,'Выставляется системой автоматически, когда заказ необходимо выгрузить в 1С'),(67,'purchase_one_click','i18n::fields-group-purchase_one_click',53,1,1,40,0,''),(68,'idetntify_data','i18n::fields-group-idetntify_data',54,1,0,5,1,'Основная информация о пользователе'),(69,'more_info','i18n::fields-group-more_info',54,1,1,10,0,'Дополнительные настройки пользователя'),(70,'short_info','i18n::fields-group-short_info',54,1,1,15,0,'Личные данные пользователя'),(71,'delivery','i18n::fields-group-trans_deliver',54,1,1,20,0,''),(72,'statistic_info','i18n::fields-group-statistic_data',54,1,1,25,0,'Статистические данные о поведении пользователя на сайте'),(73,'store_props','i18n::fields-group-store_props',55,1,1,5,0,'Основной склад, с которого будут списываться товары при покупке, и с которым будет синхронизироваться 1C'),(74,'discount_modificator_props','i18n::fields-group-discount_modificator_props',56,1,1,5,0,'Настройка размера скидки'),(75,'discount_rule_props','i18n::fields-group-discount_rule_props',57,1,1,5,0,'Пользователи, которым будет доступна скидка'),(76,'common','i18n::fields-group-menu_common',58,1,1,5,0,'Основные настройки меню'),(77,'common','i18n::fields-group-common',60,1,0,5,1,'Основные настройки новости'),(78,'item_props','i18n::fields-group-item_props',60,1,0,10,1,'Основные свойства публикации новости'),(80,'more_params','i18n::fields-group-more_params',60,1,0,20,1,'Настройки отображения страницы и её поисковой индексации'),(81,'news_images','i18n::fields-group-news_images',60,1,1,25,0,'Управление изображениями новости'),(82,'subjects_block','i18n::fields-group-subjects_block',60,1,1,30,1,'Сюжеты служат для группировки новостей по тематикам. Список последних новостей, связанных с данной по сюжету, можно вывести при помощи макроса <a target=\"_blank\" href=\"http://dev.docs.umi-cms.ru/spravochnik_makrosov_umicms/novosti/news_related_links/\">news related_links()</a>'),(83,'rate_voters','i18n::fields-group-rate_voters',60,1,0,35,1,''),(84,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',60,0,1,40,1,'Управление статусом публикации'),(85,'locks','i18n::fields-group-locks',60,1,1,45,1,''),(86,'common','i18n::fields-group-common',61,1,0,5,1,'Основные настройки страницы'),(88,'more_params','i18n::fields-group-more_params',61,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(89,'rate_voters','i18n::fields-group-rate_voters',61,1,0,20,1,''),(90,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',61,0,1,25,1,'Управление статусом публикации'),(91,'locks','i18n::fields-group-locks',61,1,1,30,1,''),(92,'props','i18n::fields-group-props',62,1,1,5,0,''),(93,'common','i18n::fields-group-common',63,1,0,5,1,'Основные настройки блога'),(95,'more_params','i18n::fields-group-more_params',63,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(96,'rate_props','i18n::fields-group-rate_props',63,1,0,20,1,''),(97,'props','i18n::fields-group-props',64,1,1,5,1,'Основная информация об авторе'),(98,'common','i18n::fields-group-common',65,1,0,5,1,'Основные свойства комментария к блогу'),(99,'rate_props','i18n::fields-group-rate_props',65,1,0,10,1,''),(100,'antispam','i18n::fields-group-antispam',65,1,1,15,0,'Пометка «Спам» скрывает нежелательные комментарии из блога'),(101,'common','i18n::fields-group-common',66,1,0,5,1,'Основные настройки поста блога'),(103,'more_params','i18n::fields-group-more_params',66,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(104,'rate_props','i18n::fields-group-rate_props',66,1,0,20,1,''),(105,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',66,0,1,25,1,'Управление статусом публикации'),(106,'locks','i18n::fields-group-locks',66,1,1,30,1,''),(107,'privacy','i18n::fields-group-privacy',66,1,1,35,0,'Настройки видимости поста для авторов и пользователей'),(108,'antispam','i18n::fields-group-antispam',66,1,1,40,0,'Пометка «Спам» скрывает нежелательные посты из блога'),(109,'common','i18n::fields-group-common',67,1,0,5,1,'Основные настройки конференции'),(111,'more_params','i18n::fields-group-more_params',67,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(112,'rate_voters','i18n::fields-group-rate_voters',67,1,0,20,1,''),(113,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',67,0,1,25,1,'Управление статусом публикации'),(114,'locks','i18n::fields-group-locks',67,1,1,30,1,''),(115,'common','i18n::fields-group-common',68,1,0,5,1,'Основные настройки топика'),(117,'more_params','i18n::fields-group-more_params',68,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(118,'topic_props','i18n::fields-group-topic_props',68,1,0,20,1,'Свойства публикации топика'),(119,'rate_voters','i18n::fields-group-rate_voters',68,1,0,25,1,''),(120,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',68,0,1,30,1,'Управление статусом публикации'),(121,'locks','i18n::fields-group-locks',68,1,1,35,1,''),(122,'common','i18n::fields-group-common',69,1,0,5,1,'Основные настройки сообщения форума'),(124,'more_params','i18n::fields-group-more_params',69,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(125,'message_props','i18n::fields-group-message_props',69,1,0,20,1,'Свойства публикации сообщения'),(126,'rate_voters','i18n::fields-group-rate_voters',69,1,0,25,1,''),(127,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',69,0,1,30,1,'Управление статусом публикации'),(128,'locks','i18n::fields-group-locks',69,1,1,35,1,''),(129,'common','i18n::fields-group-common',70,1,0,5,1,'Основные настройки комментария'),(131,'more_params','i18n::fields-group-more_params',70,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(132,'comment_props','i18n::fields-group-comment_props',70,1,0,20,1,'Свойства публикации комментария'),(133,'rate_voters','i18n::fields-group-rate_voters',70,1,0,25,1,''),(134,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',70,0,1,30,1,'Управление статусом публикации'),(135,'locks','i18n::fields-group-locks',70,1,1,35,1,''),(136,'antispam','i18n::fields-group-antispam',70,1,1,40,0,'Пометив нежелательные комментарии как спам, вы сможете их отфильтровать для выполнения групповых операций — например, удалить комментарии или/и блокировать автора'),(137,'common_props','i18n::fields-group-common_props',71,1,1,5,1,''),(138,'common','i18n::fields-group-common',72,1,0,5,1,'Основные настройки опроса'),(140,'more_params','i18n::fields-group-more_params',72,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(141,'poll_props','i18n::fields-group-poll_props',72,1,0,20,1,'Настройки опроса'),(142,'rate_voters','i18n::fields-group-rate_voters',72,1,0,25,1,''),(143,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',72,0,1,30,1,'Управление статусом публикации'),(144,'locks','i18n::fields-group-locks',72,1,1,35,1,''),(145,'common','i18n::fields-group-common',73,1,0,5,1,'Основные настройки страницы'),(147,'more_params','i18n::fields-group-more_params',73,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(148,'rate_props','i18n::fields-group-rate_props',73,1,0,20,1,''),(149,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',73,0,1,25,1,'Управление статусом публикации'),(150,'locks','i18n::fields-group-locks',73,1,1,30,1,''),(151,'binding','i18n::fields-group-Binding',73,1,0,35,0,'Привязать к этой странице форму обратной связи'),(152,'sendingdata','i18n::fields-group-SendingData',74,1,0,5,1,''),(153,'templates','i18n::fields-group-Templates',75,1,1,5,1,'Настройки шаблона письма, которое получит администратор сайта при отправке пользователем сообщения через форму обратной связи'),(154,'auto_reply','i18n::fields-group-auto_reply',75,1,1,10,1,'Настройки шаблона автоответа, который получит пользователь при отправке сообщения через форму обратной связи'),(155,'messages','i18n::fields-group-messages',75,1,1,15,1,'Сообщение, которое будет отображаться на странице успешной отправки формы обратной связи'),(156,'binding','i18n::fields-group-Binding',75,1,0,20,1,'Привязка шаблона автоответа к форме обратной связи'),(157,'list','i18n::fields-group-list',76,1,1,5,0,'Списки адресов получателей формы'),(158,'common','i18n::fields-group-common',77,1,0,5,1,'Основные настройки фотоальбома'),(160,'more_params','i18n::fields-group-more_params',77,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(161,'album_props','i18n::fields-group-album_props',77,1,0,20,1,'Основные настройки фотоальбома'),(162,'rate_voters','i18n::fields-group-rate_voters',77,1,0,25,1,''),(163,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',77,0,1,30,1,'Управление статусом публикации'),(164,'locks','i18n::fields-group-locks',77,1,1,35,1,''),(165,'common','i18n::fields-group-common',78,1,0,5,1,'Основные настройки фотографии'),(167,'more_params','i18n::fields-group-more_params',78,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(168,'photo_props','i18n::fields-group-photo_props',78,1,0,20,1,'Основные настройки фотографии'),(169,'rate_voters','i18n::fields-group-rate_voters',78,1,0,25,1,''),(170,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',78,0,1,30,1,'Управление статусом публикации'),(171,'locks','i18n::fields-group-locks',78,1,1,35,1,''),(172,'common','i18n::fields-group-common',79,1,0,5,1,'Основные настройки проектов FAQ'),(174,'more_params','i18n::fields-group-more_params',79,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(175,'rate_voters','i18n::fields-group-rate_voters',79,1,0,20,1,''),(176,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',79,0,1,25,1,'Управление статусом публикации'),(177,'locks','i18n::fields-group-locks',79,1,1,30,1,''),(178,'common','i18n::fields-group-common',80,1,0,5,1,'Основные настройки категории вопросов'),(180,'more_params','i18n::fields-group-more_params',80,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(181,'rate_voters','i18n::fields-group-rate_voters',80,1,0,20,1,''),(182,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',80,0,1,25,1,'Управление статусом публикации'),(183,'locks','i18n::fields-group-locks',80,1,1,30,1,''),(184,'common','i18n::fields-group-common',81,1,0,5,1,'Основные настройки вопроса'),(186,'more_params','i18n::fields-group-more_params',81,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(187,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',81,0,1,20,1,'Управление статусом публикации'),(188,'locks','i18n::fields-group-locks',81,1,1,25,1,''),(189,'antispam','i18n::fields-group-antispam',81,1,1,30,0,'Пометка «Спам» скрывает нежелательные вопросы из категории FAQ'),(190,'grp_disp_props','i18n::fields-group-grp_disp_props',82,1,1,5,0,'Основные настройки рассылки'),(191,'auto_settings','i18n::fields-group-auto_mailout_settings',82,1,1,10,0,'Настройка графика автоматической рассылки писем'),(192,'grp_disp_release_props','i18n::fields-group-grp_disp_release_props',83,1,1,5,0,'Основные настройки выпуска рассылки'),(193,'grp_disp_msg_props','i18n::fields-group-grp_disp_msg_props',84,1,0,5,0,'Основные настройки сообщения рассылки'),(194,'grp_disp_msg_extended','i18n::fields-group-grp_disp_msg_extended',84,1,1,10,0,'Дополнительные настройки сообщения рассылки'),(195,'grp_sbs_props','i18n::fields-group-grp_sbs_props',85,1,0,5,0,'Основные данные подписчика'),(196,'grp_sbs_extended','i18n::fields-group-grp_sbs_extended',85,1,1,10,0,'Информация о подписках пользователя'),(197,'common','i18n::fields-group-common',86,1,0,5,1,'Основные настройки страницы и её расположения в структуре каталога'),(199,'more_params','i18n::fields-group-more_params',86,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(200,'dopolnitelno','i18n::fields-group-dopolnitelno',86,1,1,20,0,'Управление описаниями раздела каталога'),(201,'rate_voters','i18n::fields-group-rate_voters',86,1,0,25,1,''),(202,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',86,0,1,30,1,'Управление статусом публикации'),(203,'locks','i18n::fields-group-locks',86,1,1,35,1,''),(204,'filter_index','i18n::fields-group-filter_index',86,1,0,40,1,''),(205,'common','i18n::fields-group-common',87,1,0,5,1,'Основные настройки товара'),(207,'more_params','i18n::fields-group-more_params',87,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(208,'cenovye_svojstva','i18n::fields-group-cenovye_svojstva',87,1,1,20,0,'Ценовые свойства товара'),(209,'catalog_option_props','i18n::fields-group-option_props',87,1,1,25,0,''),(210,'catalog_stores_props','i18n::fields-group-stores',87,1,1,30,0,'Данные о наличии товара на складах'),(211,'trade_offers','i18n::fields-group-trade-offers',87,1,1,35,0,'Торговые предложения и их характеристики'),(212,'rate_voters','i18n::fields-group-rate_voters',87,1,0,40,1,''),(213,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',87,0,1,45,1,'Управление статусом публикации'),(214,'locks','i18n::fields-group-locks',87,1,1,50,1,''),(215,'common_props','i18n::fields-group-common_props',88,1,1,5,1,''),(216,'common','i18n::fields-group-common',89,1,0,5,1,'Основные настройки баннера'),(217,'redirect_props','i18n::fields-group-redirect_props',89,1,0,10,1,'Настройки перехода с баннера'),(218,'view_params','i18n::fields-group-view_params',89,1,0,15,1,'Статистика и ограничения баннера'),(219,'view_pages','i18n::fields-group-view_pages',89,1,1,20,1,'Где будет отображаться баннер'),(220,'time_targeting','i18n::fields-group-time_targeting',89,1,1,25,1,'Таргетинг показов баннера по временным параметрам'),(221,'city_targeting','i18n::fields-group-city_targeting',89,0,1,30,1,''),(222,'view_settings','i18n::fields-group-privacy',89,1,1,35,0,'Настройки отображения баннера'),(223,'common','i18n::fields-group-common',90,1,0,5,1,'Основные настройки баннера'),(224,'banner_custom_props','i18n::fields-group-banner_custom_props',90,1,1,10,1,'Графические настройки баннера'),(225,'redirect_props','i18n::fields-group-redirect_props',90,1,0,15,1,'Настройки перехода с баннера'),(226,'view_params','i18n::fields-group-view_params',90,1,0,20,1,'Статистика и ограничения баннера'),(227,'view_pages','i18n::fields-group-view_pages',90,1,1,25,1,'Где будет отображаться баннер'),(228,'time_targeting','i18n::fields-group-time_targeting',90,1,1,30,1,'Таргетинг показов баннера по временным параметрам'),(229,'city_targeting','i18n::fields-group-city_targeting',90,0,1,35,1,''),(230,'view_settings','i18n::fields-group-privacy',90,1,1,40,0,'Настройки отображения баннера'),(231,'common','i18n::fields-group-common',91,1,0,5,1,''),(232,'banner_custom_props','i18n::fields-group-banner_custom_props',91,1,1,10,1,'Графические настройки баннера'),(233,'redirect_props','i18n::fields-group-redirect_props',91,1,0,15,1,'Настройки перехода с баннера'),(234,'view_params','i18n::fields-group-view_params',91,1,0,20,1,'Статистика и ограничения баннера'),(235,'view_pages','i18n::fields-group-view_pages',91,1,1,25,1,'Где будет отображаться баннер'),(236,'time_targeting','i18n::fields-group-time_targeting',91,1,1,30,1,'Таргетинг показов баннера по временным параметрам'),(237,'city_targeting','i18n::fields-group-city_targeting',91,0,1,35,1,''),(238,'view_settings','i18n::fields-group-privacy',91,1,1,40,0,'Настройки отображения баннера'),(239,'common','i18n::fields-group-common',92,1,0,5,1,'Основные настройки баннера'),(240,'banner_custom_props','i18n::fields-group-banner_custom_props',92,1,1,10,1,'Содержимое баннера'),(241,'redirect_props','i18n::fields-group-redirect_props',92,1,0,15,1,'Настройки перехода с баннера'),(242,'view_params','i18n::fields-group-view_params',92,1,0,20,1,'Статистика и ограничения баннера'),(243,'view_pages','i18n::fields-group-view_pages',92,1,1,25,1,'Где будет отображаться баннер'),(244,'time_targeting','i18n::fields-group-time_targeting',92,1,1,30,1,'Таргетинг показов баннера по временным параметрам'),(245,'city_targeting','i18n::fields-group-city_targeting',92,0,1,35,1,''),(246,'view_settings','i18n::fields-group-privacy',92,1,1,40,0,'Настройки отображения баннера'),(247,'svojstva','i18n::fields-group-svojstva',93,1,1,5,0,''),(248,'common','i18n::fields-group-common',94,1,0,5,1,'Основные настройки страницы скачиваемого файла'),(250,'more_params','i18n::fields-group-more_params',94,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(251,'fs_file_props','i18n::fields-group-fs_file_props',94,1,0,20,1,'Свойства скачиваемого файла'),(252,'rate_voters','i18n::fields-group-rate_voters',94,1,0,25,1,''),(253,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',94,0,1,30,1,'Управление статусом публикации'),(254,'locks','i18n::fields-group-locks',94,1,1,35,1,''),(255,'common','i18n::fields-group-common_group',95,1,0,5,1,''),(256,'common','i18n::fields-group-common',96,1,1,5,1,''),(257,'common','i18n::fields-group-common',97,1,1,5,1,''),(258,'common','i18n::fields-group-common',98,1,0,5,1,''),(260,'more_params','i18n::fields-group-more_params',98,1,0,15,1,''),(261,'rate_props','i18n::fields-group-rate_props',98,1,0,20,1,''),(262,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',98,0,1,25,1,''),(263,'locks','i18n::fields-group-locks',98,1,1,30,1,''),(264,'appointment','i18n::fields-group-appointment',98,1,1,35,1,''),(265,'common','i18n::fields-group-common_group',99,1,0,5,1,NULL),(266,'meta','Общая информация',99,1,1,10,0,''),(267,'custom_styles','Настройки стиля',99,1,1,15,0,''),(268,'params','i18n::fields-group-parameters',100,1,1,5,0,''),(269,'footer','Футер',99,1,1,20,0,''),(270,'params','i18n::fields-group-parameters',101,1,1,5,0,''),(271,'sendingdata','i18n::fields-group-SendingData',102,1,0,5,1,NULL),(272,'form_fields','Поля формы',102,1,1,10,0,''),(273,'404_page_settings','Настройки 404 страницы',99,1,1,25,0,''),(274,'info','Информация',87,1,1,55,0,''),(275,'search_page_settings','Настройки страницы поиска',99,1,1,30,0,''),(276,'personal_data_policy','Политика обработки персональных данных',99,1,1,35,0,''),(277,'common','i18n::fields-group-common',103,1,0,5,1,NULL),(279,'more_params','i18n::fields-group-more_params',103,1,0,15,1,NULL),(280,'rate_voters','i18n::fields-group-rate_voters',103,1,0,20,1,NULL),(281,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',103,0,1,25,1,NULL),(282,'locks','i18n::fields-group-locks',103,1,1,30,1,NULL),(283,'blocks','Блоки',103,1,1,35,0,''),(284,'additional_content','Дополнительный контент',61,1,1,35,0,''),(285,'additional_content','Дополнительный контент',103,1,1,40,0,''),(286,'additional_content','Дополнительный контент',3,1,1,35,0,''),(287,'additional_content','Дополнительный контент',7,1,1,35,0,''),(288,'additional_content','Дополнительный контент',37,1,1,10,0,''),(289,'additional_content','Дополнительный контент',38,1,1,20,0,''),(290,'additional_content','Дополнительный контент',60,1,1,50,0,''),(291,'additional_content','Дополнительный контент',63,1,1,25,0,''),(292,'additional_content','Дополнительный контент',65,1,1,20,0,''),(293,'additional_content','Дополнительный контент',66,1,1,45,0,''),(294,'additional_content','Дополнительный контент',67,1,1,35,0,''),(295,'additional_content','Дополнительный контент',68,1,1,40,0,''),(296,'additional_content','Дополнительный контент',69,1,1,40,0,''),(297,'additional_content','Дополнительный контент',70,1,1,45,0,''),(298,'additional_content','Дополнительный контент',72,1,1,40,0,''),(299,'additional_content','Дополнительный контент',73,1,1,40,0,''),(300,'additional_content','Дополнительный контент',77,1,1,40,0,''),(301,'additional_content','Дополнительный контент',78,1,1,40,0,''),(302,'additional_content','Дополнительный контент',79,1,1,35,0,''),(303,'additional_content','Дополнительный контент',80,1,1,35,0,''),(304,'additional_content','Дополнительный контент',81,1,1,35,0,''),(305,'additional_content','Дополнительный контент',86,1,1,45,0,''),(306,'additional_content','Дополнительный контент',87,1,1,60,0,''),(307,'additional_content','Дополнительный контент',94,1,1,40,0,''),(308,'additional_content','Дополнительный контент',98,1,1,40,0,''),(309,'personal_info','i18n::fields-group-personal_info',104,1,1,5,0,''),(310,'contact_props','i18n::fields-group-contacts',104,1,1,10,0,''),(311,'delivery','i18n::fields-group-trans_deliver',104,1,0,15,0,''),(312,'yuridicheskie_dannye','i18n::fields-group-yuridicheskie_dannye',104,1,0,20,0,''),(313,'discount_modificator_props','i18n::fields-group-discount_modificator_props',105,1,1,5,0,'Настройка размера скидки'),(314,'discount_rule_props','i18n::fields-group-discount_rule_props',106,1,1,5,0,'К каким товарам/разделам каталога применять скидку?'),(315,'discount_rule_props','i18n::fields-group-discount_rule_props',107,1,1,5,0,'На какой период действует скидка?'),(316,'discount_rule_props','i18n::fields-group-discount_rule_props',108,1,1,5,0,'Зависит ли применение скидки от стоимости заказа?'),(317,'discount_rule_props','i18n::fields-group-discount_rule_props',109,1,1,5,0,'Зависит ли применение скидки от суммы всех покупок пользователя?'),(318,'discount_rule_props','i18n::fields-group-discount_rule_props',110,1,1,5,0,'Каким группам пользователей доступна скидка?'),(319,'discount_rule_props','i18n::fields-group-discount_rule_props',111,1,1,5,0,'При активации этого правила скидка на товар будет применяться в том случае, если все указанные связанные товары находятся в корзине'),(320,'delivery_description_props','i18n::fields-group-delivery_description',112,1,1,5,0,'Настройки доставки самовывозом'),(321,'delivery_description_props','i18n::fields-group-delivery_description',113,1,1,5,0,'Общая информация об этом способе курьерской доставки'),(322,'delivery_courier_props','i18n::fields-group-delivery_courier_props',113,1,1,10,0,'Настройки стоимости этого способа курьерской доставки'),(323,'delivery_description_props','i18n::fields-group-delivery_description',114,1,1,5,0,'Общая информация об этом способе курьерской доставки'),(324,'settings','i18n::fields-group-settings',114,1,1,10,0,'Настройки этого способа доставки Почтой России'),(325,'delivery_description_props','i18n::fields-group-delivery_description',115,1,1,5,0,'Общие настройки способа доставки'),(326,'settings','i18n::fields-group-settings',115,1,1,10,1,'<p>Настройки способа доставки ApiShip.<br />API Key Яндекс.Карт можно получить на странице: <br /><a href=\"https://developer.tech.yandex.ru/services\">https://developer.tech.yandex.ru/services</a><br />Нужно выбрать API Карты, JavaScript API и HTTP Геокодер</p>'),(327,'payment_props','i18n::fields-group-payment_props',116,1,1,5,0,'Если установлено - не будет отображаться на сайте'),(328,'settings','i18n::fields-group-parameters',116,1,1,10,0,''),(329,'payment_props','i18n::fields-group-payment_props',117,1,1,5,0,'Общие настройки способа оплаты'),(330,'settings','i18n::fields-group-parameters',117,1,1,10,0,'Настройки способа оплаты данного типа'),(331,'payment_props','i18n::fields-group-payment_props',118,1,1,5,0,'Общие настройки способа оплаты'),(332,'payment_props','i18n::fields-group-payment_props',119,1,1,5,0,'Общие настройки способа оплаты'),(333,'settings','i18n::fields-group-parameters',119,1,1,10,0,'Настройки способа оплаты данного типа'),(336,'payment_props','i18n::fields-group-payment_props',121,1,1,5,0,'Если установлено - не будет отображаться на сайте'),(337,'organization','i18n::fields-group-organization_data',121,1,1,10,0,''),(338,'payment_props','i18n::fields-group-payment_props',122,1,1,5,0,'Общие настройки способа оплаты'),(339,'settings','i18n::fields-group-parameters',122,1,1,10,0,'Настройки способа оплаты данного типа'),(340,'payment_props','i18n::fields-group-payment_props',123,1,1,5,0,'Общие настройки способа оплаты'),(341,'settings','i18n::fields-group-parameters',123,1,1,10,0,'Настройки способа оплаты данного типа'),(347,'payment_props','i18n::fields-group-payment_props',127,1,1,5,1,'Общие настройки способа оплаты'),(348,'settings','i18n::fields-group-parameters',127,1,1,10,1,'Настройки способа оплаты данного типа'),(349,'payment_props','i18n::fields-group-payment_props',128,1,1,5,1,'Общие настройки способа оплаты'),(350,'settings','i18n::fields-group-parameters',128,1,1,10,1,'Настройки способа оплаты данного типа'),(351,'common','i18n::fields-group-common',129,1,1,5,1,''),(352,'common','i18n::fields-group-props',130,1,1,5,0,'Общие настройки экспорта данных'),(353,'common','i18n::fields-group-props',131,1,1,5,0,'Общие настройки импорта данных'),(354,'order_credit_props','i18n::fields-group-credit',53,1,1,45,0,''),(355,'discount_rule_props','i18n::fields-group-discount_rule_props',132,1,1,5,0,''),(356,'locks','i18n::fields-group-locks',63,1,1,30,1,''),(357,'locks','i18n::fields-group-locks',65,1,1,25,1,''),(358,'common','i18n::fields-group-props',133,1,1,5,0,''),(359,'channel_meta','i18n::fields-group-channel-meta',133,1,1,10,0,''),(360,'channel_web_analytics','i18n::fields-group-channel-web-analytics',133,1,1,15,0,''),(361,'channel_advertising','i18n::fields-group-channel-advertising',133,1,1,20,0,'');
/*!40000 ALTER TABLE `cms3_object_field_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_field_types`
--

DROP TABLE IF EXISTS `cms3_object_field_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_object_field_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `data_type` enum('int','string','text','relation','file','img_file','swf_file','bool','date','boolean','wysiwyg','password','tags','symlink','price','formula','float','counter','optioned','video_file','color','link_to_object_type','multiple_image','domain_id','domain_id_list','offer_id_list','offer_id','multiple_file','lang_id','lang_id_list','price_type_id') DEFAULT NULL,
  `is_multiple` tinyint(1) DEFAULT '0',
  `is_unsigned` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `data_type` (`data_type`),
  KEY `is_multiple` (`is_multiple`),
  KEY `is_unsigned` (`is_unsigned`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_field_types`
--

LOCK TABLES `cms3_object_field_types` WRITE;
/*!40000 ALTER TABLE `cms3_object_field_types` DISABLE KEYS */;
INSERT INTO `cms3_object_field_types` VALUES (1,'i18n::field-type-boolean','boolean',0,0),(2,'i18n::field-type-color','color',0,0),(3,'i18n::field-type-counter','counter',0,0),(4,'i18n::field-type-date','date',0,0),(5,'i18n::field-type-domain-id','domain_id',0,0),(6,'i18n::field-type-domain-id-list','domain_id_list',1,0),(7,'i18n::field-type-file','file',0,0),(8,'i18n::field-type-float','float',0,0),(9,'i18n::field-type-img_file','img_file',0,0),(10,'i18n::field-type-int','int',0,0),(11,'i18n::field-type-link-to-object-type','link_to_object_type',0,0),(12,'i18n::field-type-multiple-image','multiple_image',1,0),(13,'i18n::field-type-offer-id','offer_id',0,0),(14,'i18n::field-type-offer-id-list','offer_id_list',1,0),(15,'i18n::field-type-optioned','optioned',1,0),(16,'i18n::field-type-password','password',0,0),(17,'i18n::field-type-price','price',0,0),(18,'i18n::field-type-relation','relation',0,0),(19,'i18n::field-type-relation-multiple','relation',1,0),(20,'i18n::field-type-string','string',0,0),(21,'i18n::field-type-swf_file','swf_file',0,0),(22,'i18n::field-type-symlink-multiple','symlink',1,0),(23,'i18n::field-type-tags-multiple','tags',1,0),(24,'i18n::field-type-text','text',0,0),(25,'i18n::field-type-video','video_file',0,0),(26,'i18n::field-type-wysiwyg','wysiwyg',0,0),(27,'i18n::field-type-multiple-file','',1,0),(28,'i18n::field-type-multiple-file','multiple_file',1,0),(29,'i18n::field-type-lang-id','lang_id',0,0),(30,'i18n::field-type-lang-id-list','lang_id_list',1,0),(31,'i18n::field-type-price-type-id','price_type_id',0,0);
/*!40000 ALTER TABLE `cms3_object_field_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_fields`
--

DROP TABLE IF EXISTS `cms3_object_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_object_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT '0',
  `field_type_id` int(10) unsigned DEFAULT NULL,
  `is_inheritable` tinyint(1) DEFAULT '0',
  `is_visible` tinyint(1) DEFAULT '1',
  `guide_id` int(10) unsigned DEFAULT NULL,
  `in_search` tinyint(1) DEFAULT '1',
  `in_filter` tinyint(1) DEFAULT '1',
  `tip` varchar(255) DEFAULT NULL,
  `is_required` tinyint(1) DEFAULT NULL,
  `restriction_id` int(10) unsigned DEFAULT NULL,
  `sortable` tinyint(4) DEFAULT '0',
  `is_system` tinyint(1) DEFAULT '0',
  `is_important` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Field to field type relation_FK` (`field_type_id`),
  KEY `FK_Reference_25` (`guide_id`),
  KEY `name` (`name`),
  KEY `title` (`title`),
  KEY `is_locked` (`is_locked`),
  KEY `is_inheritable` (`is_inheritable`),
  KEY `is_visible` (`is_visible`),
  KEY `in_search` (`in_search`),
  KEY `in_filter` (`in_filter`),
  KEY `tip` (`tip`),
  KEY `is_required` (`is_required`),
  KEY `restriction_id` (`restriction_id`),
  KEY `sortable` (`sortable`),
  KEY `is_system` (`is_system`),
  KEY `is_important` (`is_important`),
  CONSTRAINT `FK_Field to field guide relation` FOREIGN KEY (`guide_id`) REFERENCES `cms3_object_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_Field to field type relation` FOREIGN KEY (`field_type_id`) REFERENCES `cms3_object_field_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Field to restriction relation` FOREIGN KEY (`restriction_id`) REFERENCES `cms3_object_fields_restrictions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=564 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_fields`
--

LOCK TABLES `cms3_object_fields` WRITE;
/*!40000 ALTER TABLE `cms3_object_fields` DISABLE KEYS */;
INSERT INTO `cms3_object_fields` VALUES (1,'publish_status_id','i18n::field-publish_status_id',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(2,'title','i18n::field-title',1,20,1,1,NULL,1,0,'',0,NULL,0,0,1),(3,'h1','i18n::field-h1',1,20,1,1,NULL,1,0,'',0,NULL,0,0,1),(4,'content','i18n::field-content',1,26,0,1,NULL,1,0,'',0,NULL,0,0,1),(5,'meta_descriptions','i18n::field-meta_descriptions',1,20,1,1,NULL,1,0,'',0,NULL,0,0,1),(6,'meta_keywords','i18n::field-meta_keywords',1,20,1,1,NULL,1,0,'',0,NULL,0,0,0),(7,'tags','i18n::field-tags',1,23,0,1,NULL,0,0,'',0,NULL,0,0,0),(11,'robots_deny','i18n::field-robots_deny',1,1,1,1,NULL,0,0,'',0,NULL,0,0,0),(12,'show_submenu','i18n::field-show_submenu',1,1,1,1,NULL,0,0,'',0,NULL,0,0,0),(13,'is_expanded','i18n::field-is_expanded',1,1,1,1,NULL,0,0,'',0,NULL,0,0,0),(14,'is_unindexed','i18n::field-is_unindexed',1,1,1,1,NULL,0,0,'',0,NULL,0,0,0),(15,'rate_voters','i18n::field-rate_voters',1,10,0,0,NULL,0,0,'',0,NULL,0,1,0),(16,'rate_sum','i18n::field-rate_sum',1,10,0,0,NULL,0,0,'',0,NULL,0,1,0),(17,'expiration_date','i18n::field-expiration_date',1,4,0,1,NULL,0,0,'',0,NULL,0,0,0),(18,'notification_date','i18n::field-notification_date',1,4,0,1,NULL,0,0,'',0,NULL,0,0,0),(19,'publish_comments','i18n::field-publish_comments',1,24,0,1,NULL,0,0,'',0,NULL,0,0,0),(20,'publish_status','i18n::field-publish_status',1,18,0,1,2,0,0,'',0,NULL,0,0,0),(21,'locktime','i18n::field-locktime',1,4,0,1,NULL,0,0,'',0,NULL,0,1,0),(22,'lockuser','i18n::field-lockuser',1,10,0,1,NULL,0,0,'',0,NULL,0,1,0),(23,'charset','i18n::field-rss-source-charset',0,20,0,0,NULL,0,0,'',0,NULL,0,0,0),(24,'readme','i18n::field-readme',1,24,0,1,NULL,0,0,'',0,NULL,0,0,0),(25,'rss_type','i18n::field-rss_type',1,18,0,1,5,0,0,'',0,NULL,0,0,0),(26,'url','i18n::field-url',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(27,'charset_id','i18n::field-rss-source-charset-relation',0,18,0,1,6,0,0,'',0,NULL,0,0,0),(28,'news_rubric','i18n::field-news_rubric',1,19,0,1,7,0,0,'',0,NULL,0,0,0),(29,'quality_value','i18n::field-quality_value',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(30,'country_iso_code','i18n::field-country_code',1,20,0,1,NULL,0,0,'Страна в формате ISO 3166-1 alpha-2',0,NULL,0,0,0),(31,'identifier','i18n::field-idcode',0,10,0,1,NULL,0,0,'',1,NULL,0,0,1),(32,'number','i18n::field-index_number',0,10,0,0,NULL,0,0,'Порядковый номер дня недели (1 (Понедельник) - 7 (Воскресение))',0,NULL,0,0,0),(33,'social_id','i18n::field-social_id',1,10,0,1,NULL,0,0,'',1,NULL,0,0,0),(34,'codename','i18n::field-string_id',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(35,'codename','i18n::field-currency_id',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(36,'nominal','i18n::field-nominal',0,10,0,1,NULL,0,0,'',1,NULL,0,0,1),(37,'rate','i18n::field-rate',0,8,0,1,NULL,0,0,'',1,NULL,0,0,1),(38,'prefix','i18n::field-prefix_n',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(39,'suffix','i18n::field-suffix',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(40,'codename','i18n::field-status_code',0,20,0,1,21,0,0,'',1,NULL,0,0,1),(41,'platform_identificator','i18n::field-emarket-mobile-platform_identificator',1,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(42,'active','i18n::field-emarket-mobile-device-active',0,1,0,1,NULL,0,0,'',0,NULL,0,0,0),(43,'domain_id','i18n::field_domain',1,5,0,1,NULL,0,0,'',0,NULL,0,0,0),(44,'token','i18n::field-emarket-mobile-device-token',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(45,'platform','i18n::field-emarket-mobile-platform',0,18,0,1,23,0,0,'',0,NULL,0,0,0),(46,'lname','i18n::field-lname_oneclick',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(47,'fname','i18n::field-fname_oneclick',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(48,'father_name','i18n::field-father_name_oneclick',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(49,'email','i18n::field-email_oneclick',0,20,0,1,NULL,0,0,'',1,3,0,0,1),(50,'phone','i18n::field-phone_number_oneclick',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(51,'yandex_id','i18n::field-id-for-yandex-kassa',1,10,0,1,NULL,0,0,'',1,NULL,0,1,1),(52,'payonline_id','i18n::field-id-for-payonline',1,20,0,1,NULL,0,0,'',1,NULL,0,1,1),(53,'robokassa_id','i18n::field-id-for-robokassa',1,20,0,1,NULL,0,0,'',1,NULL,0,1,1),(54,'payanyway_id','i18n::field-id-for-payanyway',1,10,0,1,NULL,0,0,'',1,NULL,0,1,1),(55,'sberbank_id','i18n::field-id-for-sberbank',1,10,0,1,NULL,0,0,'',1,NULL,0,1,1),(56,'tax','i18n::field-tax',1,20,0,1,NULL,0,0,'',0,NULL,0,1,1),(57,'yandex_id','i18n::field-id-for-yandex-kassa',1,20,0,1,NULL,0,0,'',1,NULL,0,1,1),(58,'payanyway_id','i18n::field-id-for-payanyway',1,20,0,1,NULL,0,0,'',1,NULL,0,1,1),(59,'payonline_id','i18n::field-id-for-payonline',1,10,0,1,NULL,0,0,'',1,NULL,0,1,1),(60,'description','i18n::field-description',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(61,'modificator_codename','i18n::field-identifier',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(62,'modificator_type_id','i18n::field-modificator_type_id',0,11,0,1,NULL,0,0,'',0,NULL,0,0,1),(63,'modificator_discount_types','i18n::field-modificator_discount_types',0,19,0,1,30,0,0,'',0,NULL,0,0,1),(64,'modificator_type_guid','i18n::field-modificator_type_guid',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(65,'modificator_type_id','i18n::field-modificator_type',0,18,0,1,31,0,0,'',1,NULL,0,0,1),(66,'rule_codename','i18n::field-rule_id',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(67,'rule_type_id','i18n::field-rule_type_id',0,11,0,1,NULL,0,0,'',0,NULL,0,0,1),(68,'rule_discount_types','i18n::field-rule_discount_types',0,19,0,1,30,0,0,'',1,NULL,0,0,1),(69,'rule_type_guid','i18n::field-rule_type_guid',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(70,'rule_type_id','i18n::field-rule_type',0,18,0,1,33,0,0,'',1,NULL,0,0,1),(71,'sid','i18n::field-sid',0,20,0,0,NULL,0,0,'Служит для связи с обработчиками, заполняется разработчиком импотрера',1,NULL,0,0,1),(72,'sid','i18n::field-sid',0,20,0,0,NULL,0,0,'Служит для связи с обработчиками, заполняется разработчиком импотрера',1,NULL,0,0,1),(73,'social_id','i18n::field-social_network_id',0,20,0,1,NULL,0,0,'',1,NULL,0,1,0),(74,'template_id','i18n::field-template_id',1,10,0,0,NULL,0,0,'',0,NULL,0,1,0),(75,'domain_id','i18n::field-domain_id',1,5,0,0,NULL,0,0,'',0,NULL,0,1,0),(76,'nazvanie_sajta','i18n::field-site_name',0,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(77,'is_iframe_enabled','i18n::field-is_iframe_enabled',1,1,0,1,NULL,0,0,'',0,NULL,0,0,0),(78,'iframe_pages','i18n::field-iframe_pages',1,22,0,0,NULL,0,0,'Здесь в дополнение к разделам каталога, можно выбрать, какие страницы нужно показывать в социальной сети',0,NULL,0,0,0),(79,'nazvanie','i18n::field-nazvanie',1,20,0,0,NULL,0,0,'',0,NULL,0,0,1),(80,'country','i18n::field-country',0,18,0,1,10,0,0,'',1,NULL,0,0,0),(81,'index','i18n::field-post_index',0,10,0,1,NULL,0,0,'',1,NULL,0,0,1),(82,'region','i18n::field-geographic_area',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(83,'city','i18n::field-city',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(84,'street','i18n::field-street',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(85,'house','i18n::field-house',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(86,'flat','i18n::field-appartment',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(87,'class_name','i18n::field-item_type_id',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(88,'discount_type_id','i18n::field-discount_type',0,18,0,1,30,0,0,'Определяет область применения скидки',1,NULL,0,0,1),(89,'discount_modificator_id','i18n::field-price_modificator',0,18,0,1,12,0,0,'Определяет, по какому принципу будет пересчитываться цена',0,NULL,0,0,1),(90,'discount_rules_id','i18n::field-validation_rules',0,19,0,1,13,0,0,'Определяют ограничения по применению скидки',0,NULL,0,0,1),(91,'is_active','i18n::field-is_active',1,1,0,1,NULL,0,0,'',0,NULL,0,0,1),(92,'description','i18n::field-description',0,24,0,1,NULL,0,0,'',0,NULL,0,0,1),(93,'item_amount','i18n::field-item_amount',0,10,0,1,NULL,0,0,'',0,NULL,0,0,1),(94,'item_price','i18n::field-item_price',0,8,0,1,NULL,0,0,'',0,NULL,0,0,1),(95,'item_actual_price','i18n::field-item_actual_price',0,8,0,1,NULL,0,0,'',0,NULL,0,0,1),(96,'item_total_original_price','i18n::field-item_total_original_price',0,17,0,1,NULL,0,0,'',0,NULL,0,0,1),(97,'item_total_price','i18n::field-item_total_price',0,17,0,1,NULL,0,0,'',0,NULL,0,0,1),(98,'item_type_id','i18n::field-item_type',0,18,0,1,41,0,0,'',0,NULL,0,0,1),(99,'item_link','i18n::field-item_link',0,22,0,1,NULL,0,0,'',0,NULL,0,0,1),(100,'item_discount_id','i18n::field-catalog_object_discount',0,18,0,1,42,0,0,'',0,NULL,0,0,1),(101,'item_discount_value','i18n::field-order-item-discount-value',1,17,0,1,NULL,0,0,'i18n::field-order-item-discount-value',0,NULL,0,0,1),(102,'weight','i18n::field-order-item-weight',1,8,0,1,NULL,0,0,'',0,NULL,0,0,1),(103,'width','i18n::field-order-item-width',1,8,0,1,NULL,0,0,'',0,NULL,0,0,1),(104,'height','i18n::field-order-item-height',1,8,0,1,NULL,0,0,'',0,NULL,0,0,1),(105,'length','i18n::field-order-item-length',1,8,0,1,NULL,0,0,'',0,NULL,0,0,1),(106,'tax_rate_id','i18n::field-tax-rate-id',1,18,0,1,27,0,0,'',0,NULL,0,0,1),(107,'payment_mode','i18n::field-payment_mode',1,18,0,1,29,0,0,'',0,NULL,0,0,1),(108,'payment_subject','i18n::field-payment_subject',1,18,0,1,28,0,0,'',0,NULL,0,0,1),(109,'options','i18n::field-item_options',0,15,0,1,43,0,0,'',0,NULL,0,0,1),(110,'trade_offer','i18n::field-trade-offer',1,13,0,0,NULL,0,0,'',0,NULL,0,0,1),(111,'priority','i18n::field-order-delivery-priority',0,10,0,0,NULL,0,0,'',0,NULL,0,0,0),(112,'class_name','i18n::field-payment_type_id',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(113,'payment_type_id','i18n::field-payment_datatype_id',0,11,0,1,NULL,0,0,'',0,NULL,0,0,1),(114,'payment_type_guid','i18n::field-payment_type_guid',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(115,'payment_type_id','i18n::field-payment_type',1,18,0,1,46,0,0,'',1,NULL,0,0,1),(116,'disabled','i18n::field-disabled',1,1,0,0,NULL,0,0,'Если установлено - не будет отображаться на сайте',0,NULL,0,0,1),(117,'domain_id_list','i18n::field-valid-domain-list',1,6,0,1,NULL,0,0,'Если применимо для всех доменов - оставьте список пустым',0,NULL,0,0,1),(118,'contact_person','i18n::field-contact_person',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(119,'phone_number','i18n::field-phone_number',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(120,'fax','i18n::field-fax',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(121,'name','i18n::field-organisation_name',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(122,'legal_address','i18n::field-legal_address',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(123,'defacto_address','i18n::field-defacto_address',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(124,'post_address','i18n::field-post_address',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(125,'inn','i18n::field-TIN',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(126,'account','i18n::field-account',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(127,'bank','i18n::field-bank',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(128,'bank_account','i18n::field-bank_account',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(129,'bik','i18n::field-bik',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(130,'ogrn','i18n::field-ogrn',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(131,'kpp','i18n::field-RRC',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(132,'class_name','i18n::field-delivery_type_id',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(133,'delivery_type_id','i18n::field-delivery_datatype_id',0,11,0,1,NULL,0,0,'',0,NULL,0,0,1),(134,'delivery_type_guid','i18n::field-delivery_type_guid',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(135,'description','i18n::field-delivery_description',0,24,0,1,NULL,0,0,'',0,NULL,0,0,1),(136,'delivery_type_id','i18n::field-delivery_type',0,18,0,0,50,0,0,'',1,NULL,0,0,1),(137,'price','i18n::field-delivery_price',0,17,0,1,NULL,0,0,'',0,NULL,0,0,1),(138,'tax_rate_id','i18n::field-tax-rate-id',1,18,0,1,27,0,0,'',0,NULL,0,0,1),(139,'disabled','i18n::field-disabled',1,1,0,0,NULL,0,0,'Если установлено - не будет отображаться на сайте',0,NULL,0,0,1),(140,'domain_id_list','i18n::field-valid-domain-list',1,6,0,1,NULL,0,0,'Если применимо для всех доменов - оставьте список пустым',0,NULL,0,0,1),(141,'payment_mode','i18n::field-payment_mode',1,18,0,1,29,0,0,'',0,NULL,0,0,1),(142,'payment_subject','i18n::field-payment_subject',1,18,0,1,28,0,0,'',0,NULL,0,0,1),(143,'disabled_types_of_payment','i18n::field-disabled_types_of_payment',1,19,0,1,47,0,0,'',0,NULL,0,0,1),(144,'order_items','i18n::field-order_items',0,19,0,1,44,0,0,'',0,NULL,0,0,1),(145,'number','i18n::field-order_number',0,10,0,1,NULL,0,0,'',0,NULL,0,0,1),(146,'social_order_id','i18n::field-social_order_id',1,10,0,1,NULL,0,0,'',0,NULL,0,0,0),(148,'customer_id','i18n::field-customer',0,18,0,1,54,0,0,'',0,NULL,0,0,1),(149,'domain_id','i18n::field-domain_name',0,5,0,1,NULL,0,0,'',0,NULL,0,0,0),(150,'manager_id','i18n::field-manager',0,18,0,1,54,0,0,'',0,NULL,0,0,1),(151,'status_id','i18n::field-order_status',0,18,0,1,45,0,0,'',0,NULL,0,0,1),(152,'total_original_price','i18n::field-order_original_price',0,17,0,1,NULL,0,0,'',0,NULL,0,0,1),(153,'total_price','i18n::field-total_price',0,17,0,1,NULL,0,0,'',0,NULL,0,0,1),(154,'total_amount','i18n::field-total_amount',0,10,0,1,NULL,0,0,'',0,NULL,0,0,1),(155,'status_change_date','i18n::field-status_change_date',0,4,0,1,NULL,0,0,'Выставляется автоматически, когда происходит изменение статуса заказа',0,NULL,0,0,0),(156,'order_date','i18n::field-order_date',0,4,0,1,NULL,0,0,'Дата, когда заказ был оформлен покупателем',0,NULL,0,0,1),(157,'order_discount_value','i18n::field-order-discount-value',1,17,0,1,NULL,0,0,'i18n::field-order-discount-value',0,NULL,0,0,1),(158,'is_reserved','i18n::field-is_reserved',0,1,0,0,NULL,0,0,'',0,NULL,0,1,0),(159,'service_info','i18n::field-order_service_info',0,24,0,1,NULL,0,0,'',0,NULL,0,0,0),(167,'http_referer','i18n::field-referer',0,24,0,1,NULL,0,0,'',0,NULL,0,0,0),(168,'http_target','i18n::field-target',0,24,0,1,NULL,0,0,'',0,NULL,0,0,0),(169,'source_domain','i18n::field-source_domain',1,20,0,0,NULL,0,0,'',0,NULL,0,0,0),(170,'utm_medium','i18n::field-utm_medium',1,20,0,0,NULL,0,0,'',0,NULL,0,0,0),(171,'utm_term','i18n::field-utm_term',1,20,0,0,NULL,0,0,'',0,NULL,0,0,0),(172,'utm_campaign','i18n::field-utm_campaign',1,20,0,0,NULL,0,0,'',0,NULL,0,0,0),(173,'utm_content','i18n::field-utm_content',1,20,0,0,NULL,0,0,'',0,NULL,0,0,0),(174,'order_create_date','i18n::field-order_create_date',1,4,0,0,NULL,0,0,'',0,NULL,0,0,0),(175,'payment_id','i18n::field-payment_id',0,18,0,1,47,0,0,'',0,NULL,0,0,1),(176,'payment_name','i18n::field-payment-name',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(177,'payment_status_id','i18n::field-payment_status',0,18,0,1,48,0,0,'',0,NULL,0,0,1),(178,'payment_date','i18n::field-payment_date',0,4,0,1,NULL,0,0,'Дата успешной оплаты заказа',0,NULL,0,0,0),(179,'payment_document_num','i18n::field-payment_document_number',0,20,0,1,NULL,0,0,'Заполняется системой автоматически',0,NULL,0,0,0),(180,'legal_person','i18n::field-legal_person',1,18,0,1,49,0,0,'',0,NULL,0,0,1),(181,'delivery_id','i18n::field-delivery_id',0,18,0,1,51,0,0,'',0,NULL,0,0,1),(182,'delivery_name','i18n::field-delivery-name',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(183,'delivery_status_id','i18n::field-delivery_status',0,18,0,1,52,0,0,'',0,NULL,0,0,1),(184,'delivery_address','i18n::field-destination_address',0,18,0,1,40,0,0,'',0,NULL,0,0,1),(185,'delivery_date','i18n::field-delivery-date',1,4,0,1,NULL,0,0,'Дата, когда товар будет доставлен клиенту или на пункт выдачи',0,NULL,0,0,1),(186,'pickup_date','i18n::field-pickup-date',1,4,0,1,NULL,0,0,'Даpickup_typeта, когда товар будет доставлен на пункт приема или когда нужно его забрать со склада',0,NULL,0,0,1),(187,'delivery_provider','i18n::field-delivery-provider',1,20,0,1,NULL,0,0,'i18n::field-delivery-provider',0,NULL,0,0,1),(188,'delivery_tariff','i18n::field-delivery-tariff',1,20,0,1,NULL,0,0,'i18n::field-delivery-tariff',0,NULL,0,0,1),(189,'delivery_type','i18n::field-delivery-type',1,20,0,1,NULL,0,0,'Тип доставки товара клиенту',0,NULL,0,0,1),(190,'pickup_type','i18n::field-pickup-type',1,20,0,1,NULL,0,0,'Тип доставки товара поставщику',0,NULL,0,0,1),(191,'delivery_price','i18n::field-del_price',0,17,0,1,NULL,0,0,'',0,NULL,0,0,1),(192,'delivery_point_in','i18n::field-delivery-point-in-id',1,20,0,1,NULL,0,0,'Точка приема товара',0,NULL,0,0,1),(193,'delivery_point_out','i18n::field-delivery-point-out-id',1,20,0,1,NULL,0,0,'Точка выдачи товара',0,NULL,0,0,1),(194,'total_weight','i18n::field-order-total-weight',1,8,0,1,NULL,0,0,'i18n::field-order-total-weight-tip',0,NULL,0,0,1),(195,'total_width','i18n::field-order-book-total-width',1,8,0,1,NULL,0,0,'i18n::field-order-book-total-width-tip',0,NULL,0,0,0),(196,'total_height','i18n::field-order-total-height',1,8,0,1,NULL,0,0,'i18n::field-order-total-height-tip',0,NULL,0,0,0),(197,'total_length','i18n::field-order-total-length',1,8,0,1,NULL,0,0,'i18n::field-ordelivery_providerder-total-length-tip',0,NULL,0,0,0),(198,'delivery_allow_date','i18n::field-delivery_allow_date',0,4,0,1,NULL,0,0,'Заполняется системой автоматически, когда возможна доставка и заказ успешно оплачен',0,NULL,0,0,0),(199,'order_discount_id','i18n::field-order_discount',0,18,0,1,42,0,0,'',0,NULL,0,0,1),(200,'bonus','i18n::field-spent_bonus',1,17,0,0,NULL,0,0,'',0,NULL,0,0,0),(201,'need_export','i18n::field-export_1C',0,1,0,1,NULL,0,0,'Выставляется системой автоматически, когда заказ необходимо выгрузить в 1С',0,NULL,0,0,0),(202,'purchaser_one_click','i18n::field-customer',1,18,0,1,25,0,0,'',0,NULL,0,0,1),(203,'login','i18n::field-login',1,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(204,'password','i18n::field-password',1,16,0,1,NULL,0,0,'',0,NULL,0,0,0),(205,'groups','i18n::field-groups',1,19,0,0,39,0,0,'',0,NULL,0,0,1),(206,'e-mail','i18n::field-e-mail',1,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(207,'activate_code','i18n::field-activate_code',1,20,0,0,NULL,0,0,'',0,NULL,0,1,0),(208,'loginza','i18n::field-loginza',1,20,0,1,NULL,0,0,'Адрес сервиса',0,NULL,0,0,0),(209,'is_activated','i18n::field-is_activated',1,1,0,0,NULL,0,0,'',0,NULL,0,0,1),(210,'last_request_time','i18n::field-last_request_time',1,10,0,0,NULL,0,0,'',0,NULL,0,1,0),(211,'subscribed_pages','i18n::field-subscribed_pages',1,22,0,0,NULL,0,0,'',0,NULL,0,1,0),(212,'rated_pages','i18n::field-rated_pages',1,22,0,0,NULL,0,0,'',0,NULL,0,1,0),(213,'is_online','i18n::field-is_online',1,1,0,0,NULL,0,0,'',0,NULL,0,1,0),(214,'messages_count','i18n::field-messages_count',1,10,0,0,NULL,0,0,'',0,NULL,0,1,0),(215,'orders_refs','i18n::field-orders_refs',1,19,0,0,NULL,0,0,'',0,NULL,0,1,0),(216,'delivery_addresses','i18n::field-delivery_addresses',1,19,0,1,40,0,0,'',0,NULL,0,1,0),(217,'user_dock','i18n::field-user_dock',1,20,0,0,NULL,0,0,'',0,NULL,0,1,0),(218,'preffered_currency','i18n::field-preffered_currency',1,18,0,0,21,0,0,'',0,NULL,0,0,0),(219,'user_settings_data','i18n::field-user_settings_data',1,24,0,0,NULL,0,0,'',0,NULL,0,1,0),(220,'last_order','i18n::field-last_order',1,15,0,0,53,0,0,'',0,NULL,0,1,0),(221,'bonus','i18n::field-bonus',1,17,0,0,NULL,0,0,'',0,NULL,0,0,0),(222,'legal_persons','i18n::field-legal_persons',1,19,0,1,49,0,0,'',0,NULL,0,1,1),(223,'spent_bonus','i18n::field-spent_bonus',1,17,0,0,NULL,0,0,'',0,NULL,0,0,0),(224,'filemanager_directory','i18n::field-filemanager-directory',1,20,0,0,NULL,0,0,'Список доступных пользователю директорий. В качестве разделителя используется запятая - например: /image/cms, /files.',0,NULL,0,0,0),(225,'appended_file_extensions','i18n::field-appended-file-extensions',1,20,0,0,NULL,0,0,'Список дополнительных расширений файлов, которые пользователь может загружать на сервер. В качестве разделителя используется запятая - например: cdr, mid, midi.',0,NULL,0,0,0),(226,'register_date','i18n::field-register_date',0,4,0,0,NULL,0,0,'',0,NULL,0,0,0),(227,'tickets_color','i18n::field-tickets_color',0,2,0,0,NULL,0,0,'Фоновый цвет заметок',0,NULL,0,0,0),(228,'favorite_domain_list','i18n::field-favorite_domain_list',0,6,0,0,NULL,0,0,'Если заполнено - для пользователя будут выводиться только эти домены в административной панели во вкладке \"Структура сайта\".',0,NULL,0,0,0),(229,'lname','i18n::field-lname',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(230,'fname','i18n::field-fname',1,20,0,1,NULL,0,0,'Это поле содержит Имя пользователя. Оно отображается в характеристиках пользователя и может быть изменено самим пользователем.',1,NULL,0,0,1),(231,'father_name','i18n::field-father_name',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(232,'phone','i18n::field-phone_n',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(233,'referer','i18n::field-referer',0,24,0,0,NULL,0,0,'',0,NULL,0,0,0),(234,'target','i18n::field-target',0,24,0,0,NULL,0,0,'',0,NULL,0,0,0),(235,'primary','i18n::field-primary_store',0,1,0,1,NULL,0,0,'Основной склад, с которого будут списываться товары при покупке, и с которым будет синхронизироваться 1C',0,NULL,0,0,1),(236,'proc','i18n::field-proc',0,8,0,1,NULL,0,0,'',1,NULL,0,0,1),(237,'users','i18n::field-users',0,19,0,1,54,0,0,'Пользователи, которым будет доступна скидка',1,NULL,0,0,1),(238,'menu_id','i18n::field-menu-menu_id',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(239,'menuhierarchy','i18n::field-menuhierarchy',0,24,0,1,NULL,0,0,'',0,NULL,0,0,1),(240,'anons','i18n::field-anons',1,26,0,1,NULL,1,0,'',0,NULL,0,0,1),(241,'source','i18n::field-source',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(242,'source_url','i18n::field-source_url',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(243,'publish_time','i18n::field-faq_publish_time',1,4,0,1,NULL,0,1,'',0,NULL,0,0,1),(244,'begin_time','i18n::field-begin_time',1,4,0,1,NULL,0,0,'',0,NULL,0,0,0),(245,'end_time','i18n::field-end_time',1,4,0,1,NULL,0,0,'',0,NULL,0,0,0),(246,'anons_pic','i18n::field-anons_pic',1,9,0,1,NULL,0,0,'',0,NULL,0,0,1),(247,'publish_pic','i18n::field-publish_pic',1,9,0,1,NULL,0,0,'',0,NULL,0,0,1),(248,'subjects','i18n::field-subjects',1,19,0,1,59,0,0,'',0,NULL,0,0,0),(249,'user_id','i18n::field-user_id',1,18,0,1,54,0,0,'',0,NULL,0,1,0),(250,'message','i18n::field-message',1,24,0,1,NULL,1,0,'',0,NULL,0,0,1),(251,'x','i18n::field-x',1,10,0,1,NULL,0,0,'',0,NULL,0,1,0),(252,'y','i18n::field-y',1,10,0,1,NULL,0,0,'',0,NULL,0,1,0),(253,'width','i18n::field-width',1,10,0,1,NULL,0,0,'',0,NULL,0,1,0),(254,'height','i18n::field-height',1,10,0,1,NULL,0,0,'',0,NULL,0,1,0),(255,'create_time','i18n::field-create_time',1,4,0,1,NULL,0,0,'',0,NULL,0,1,0),(256,'url','i18n::field-url',1,20,0,1,NULL,0,0,'',0,NULL,0,1,1),(257,'description','i18n::field-description',1,20,0,1,NULL,0,1,'',0,NULL,0,0,1),(258,'friendlist','i18n::field-friendlist',1,19,0,1,54,0,1,'',0,NULL,0,0,0),(259,'is_registrated','i18n::field-is_registrated',1,1,0,1,NULL,0,0,'',0,NULL,0,0,0),(260,'user_id','i18n::field-user_id',1,18,0,1,54,0,0,'',0,NULL,0,0,0),(261,'nickname','i18n::field-nickname',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(262,'email','i18n::field-email',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(263,'ip','i18n::field-ip',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(264,'author_id','i18n::field-author_id',1,18,1,0,64,0,1,'Идентификатор автора комментария',0,NULL,0,0,0),(265,'is_spam','i18n::field-is_spam',0,1,0,1,NULL,0,0,'',0,NULL,0,0,1),(266,'only_for_friends','i18n::field-only_for_friends',1,1,0,1,NULL,0,1,'',0,NULL,0,0,0),(267,'descr','i18n::field-descr',1,26,0,1,NULL,1,0,'',0,NULL,0,0,1),(268,'topics_count','i18n::field-topics_count',1,10,0,0,NULL,0,0,'',0,NULL,0,0,0),(269,'messages_count','i18n::field-messages_count',1,10,0,0,NULL,0,0,'',0,NULL,0,0,0),(270,'last_message','i18n::field-last_message',1,22,0,0,NULL,0,0,'',0,NULL,0,0,0),(271,'last_post_time','i18n::field-last_post_time',1,10,0,0,NULL,0,0,'',0,NULL,0,0,0),(272,'message','i18n::field-message',1,24,0,1,NULL,1,0,'',0,NULL,0,0,1),(273,'count','i18n::field-count',1,10,0,1,NULL,0,0,'',0,NULL,0,0,0),(274,'poll_rel','i18n::field-poll_rel',1,18,0,0,72,0,0,'',0,NULL,0,0,0),(275,'is_closed','i18n::field-is_closed',1,1,0,1,NULL,0,0,'',0,NULL,0,0,1),(276,'question','i18n::field-question',1,24,0,1,NULL,1,0,'Вопрос пользователя',0,NULL,0,0,1),(277,'answers','i18n::field-answers',1,19,0,1,71,0,0,'',0,NULL,0,0,1),(278,'total_count','i18n::field-total_count',1,10,0,1,NULL,0,0,'',0,NULL,0,0,1),(279,'form_id','i18n::field-form_id',1,11,0,0,NULL,0,1,'',0,NULL,0,0,1),(280,'destination_address','i18n::field-destination_address',1,20,0,0,NULL,0,0,'',0,NULL,0,0,1),(281,'sender_ip','i18n::field-sender_ip',1,20,0,0,NULL,0,0,'',0,NULL,0,0,0),(282,'sending_time','i18n::field-sending_time',1,4,0,0,NULL,0,0,'',0,NULL,0,0,0),(283,'wf_message','i18n::option-message',0,26,0,1,NULL,0,0,'',0,5,0,0,0),(284,'from_email_template','i18n::field-from_email_template',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(285,'from_template','i18n::field-from_template',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(286,'subject_template','i18n::field-subject_template',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(287,'master_template','i18n::field-master_template',1,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(288,'autoreply_from_email_template','i18n::field-autoreply_from_email_template',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(289,'autoreply_from_template','i18n::field-autoreply_from_template',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(290,'autoreply_subject_template','i18n::field-autoreply_subject_template',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(291,'autoreply_email_recipient','i18n::field-autoreply_email_recipient',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(292,'autoreply_template','i18n::field-autoreply_template',1,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(293,'posted_message','i18n::field-message_sent',1,26,0,1,NULL,0,0,'',0,NULL,0,0,0),(294,'form_id','i18n::field-form_id',1,11,0,0,NULL,0,0,'',0,NULL,0,0,1),(295,'address_description','i18n::field-address_description',1,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(296,'address_list','i18n::field-address_list',1,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(297,'form_id','i18n::field-form_id',1,20,0,0,NULL,0,0,'',0,NULL,0,1,1),(298,'create_time','i18n::field-create_time',1,4,0,1,NULL,0,0,'',0,NULL,0,0,0),(299,'user_id','i18n::field-user_id',1,18,0,0,54,0,0,'',0,NULL,0,0,0),(300,'photo','i18n::field-photo',1,9,0,1,NULL,0,0,'',0,NULL,0,0,1),(301,'answer','i18n::field-answer',1,24,0,1,NULL,0,0,'',0,NULL,0,0,1),(302,'disp_last_release','i18n::field-disp_last_release',1,4,0,1,NULL,0,1,'',0,NULL,0,0,1),(303,'disp_description','i18n::field-disp_description',1,24,0,1,NULL,0,0,'',0,NULL,0,0,0),(304,'forced_subscribers','i18n::field-forced_subscribers',1,22,0,1,NULL,0,1,'',0,NULL,0,0,1),(305,'news_relation','i18n::field-news_relation',1,18,0,1,7,0,1,'',0,NULL,0,0,0),(306,'is_active','i18n::field-is_active',1,1,0,1,NULL,0,0,'',0,NULL,0,0,1),(307,'load_from_forum','i18n::field-load_from_forum',0,1,0,1,NULL,0,0,'Может быть установлено только для одной рассылки одновременно',0,NULL,0,0,0),(308,'days','i18n::field-days',0,19,0,0,17,0,0,'Дни недели, в которые будет происходить автоматическая рассылка',0,NULL,0,0,0),(309,'hours','i18n::field-hours',0,19,0,0,16,0,0,'Часы, в которые будет происходить автоматическая рассылка',0,NULL,0,0,0),(310,'status','i18n::field-status',1,1,0,1,NULL,0,1,'',0,NULL,0,0,1),(311,'date','i18n::field-date',1,4,0,1,NULL,0,1,'',0,NULL,0,0,1),(312,'disp_reference','i18n::field-disp_reference',1,10,0,0,NULL,0,1,'',0,NULL,0,0,0),(313,'header','i18n::field-header',1,20,0,0,NULL,1,0,'',0,NULL,0,0,1),(314,'body','i18n::field-body',1,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(315,'release_reference','i18n::field-release_reference',1,10,0,0,NULL,0,1,'',0,NULL,0,0,0),(316,'attach_file','i18n::field-attach_file',1,7,0,1,NULL,0,0,'',0,NULL,0,0,0),(317,'msg_date','i18n::field-msg_date',1,4,0,1,NULL,0,1,'',0,NULL,0,0,0),(318,'short_body','i18n::field-short_body',1,26,0,1,NULL,0,1,'',0,NULL,0,0,1),(319,'new_relation','i18n::field-new_relation',1,22,0,0,NULL,0,1,'',0,NULL,0,0,0),(320,'lname','i18n::field-lname',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(321,'fname','i18n::field-fname',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(322,'father_name','i18n::field-father_name',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(323,'gender','i18n::field-gender',1,18,0,1,4,0,0,'',0,NULL,0,0,0),(324,'uid','i18n::field-uid',1,18,0,0,54,0,1,'',0,NULL,0,0,0),(325,'subscriber_dispatches','i18n::field-subscriber_dispatches',1,19,0,1,82,0,1,'',0,NULL,0,0,1),(326,'sent_release_list','i18n::field-sent_release_list',1,19,0,1,83,0,0,'',0,NULL,0,0,1),(327,'subscribe_date','i18n::field-subscribe_date',1,4,0,0,NULL,0,0,'',0,NULL,0,0,0),(329,'index_source','i18n::field-index_source',0,10,0,1,NULL,0,0,'',0,NULL,0,1,0),(330,'index_state','i18n::field-index_state',0,8,0,1,NULL,0,0,'',0,NULL,0,1,0),(331,'index_date','i18n::field-index_date',0,4,0,1,NULL,0,0,'',0,NULL,0,1,0),(332,'index_choose','i18n::field-index_choose',0,1,0,1,NULL,0,0,'',0,NULL,0,1,0),(333,'index_level','i18n::field-index_level',0,10,0,1,NULL,0,0,'',0,NULL,0,1,0),(334,'date_create_object','i18n::field-date_create_object',1,4,0,0,NULL,0,0,'',0,NULL,0,0,0),(335,'tax_rate_id','i18n::field-tax-rate-id',1,18,0,1,27,0,0,'',0,NULL,0,0,1),(336,'price','i18n::field-price',1,17,0,1,NULL,0,1,'',0,NULL,0,0,1),(337,'payment_mode','i18n::field-payment_mode',1,18,0,1,29,0,0,'',0,NULL,0,0,1),(338,'payment_subject','i18n::field-payment_subject',1,18,0,1,28,0,0,'',0,NULL,0,0,1),(339,'stores_state','i18n::field-stores_state',0,15,0,1,55,0,0,'',0,NULL,0,0,1),(340,'reserved','i18n::field-reserved',0,10,0,0,NULL,0,0,'i18n::field-tip-number-reserved-items',0,NULL,0,1,0),(341,'common_quantity','i18n::field-common-quantity',1,10,0,1,NULL,0,0,'',0,NULL,0,0,0),(342,'trade_offer_image','i18n::field-trade-offer-image',1,9,0,1,NULL,0,0,'',0,NULL,0,0,1),(343,'trade_offer_list','i18n::field-trade-offer-list',1,14,0,0,NULL,0,0,'',0,NULL,0,0,1),(344,'id','i18n::field-id',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(345,'descr','i18n::field-descr',1,24,0,1,NULL,0,0,'',0,NULL,0,0,1),(346,'is_show_rand_banner','i18n::field-is_show_rand_banner',1,1,0,1,NULL,0,1,'',0,NULL,0,0,1),(347,'is_active','i18n::field-is_active',1,1,0,1,NULL,0,0,'',0,NULL,0,0,1),(348,'tags','i18n::field-tags',1,23,0,1,NULL,0,0,'',0,NULL,0,0,0),(349,'url','i18n::field-url',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(350,'open_in_new_window','i18n::field-open_in_new_window',1,1,0,1,NULL,0,0,'',0,NULL,0,0,0),(351,'views_count','i18n::field-views_count',1,10,0,1,NULL,0,0,'',0,NULL,0,0,0),(352,'clicks_count','i18n::field-clicks_count',1,10,0,1,NULL,0,0,'',0,NULL,0,0,0),(353,'max_views','i18n::field-max_views',1,10,0,1,NULL,0,0,'',0,NULL,0,0,0),(354,'show_start_date','i18n::field-show_start_date',1,4,1,1,NULL,0,1,'',0,NULL,0,0,0),(355,'show_till_date','i18n::field-show_till_date',1,4,1,1,NULL,0,0,'',0,NULL,0,0,0),(356,'user_tags','i18n::field-user_tags',1,23,0,1,NULL,0,0,'',0,NULL,0,0,0),(357,'view_pages','i18n::field-view_pages',1,22,0,1,NULL,0,0,'',0,NULL,0,0,0),(358,'place','i18n::field-place',1,19,0,1,88,0,0,'',0,NULL,0,0,1),(359,'not_view_pages','i18n::field-not_view_pages',1,22,0,1,NULL,0,0,'',0,NULL,0,0,0),(360,'time_targeting_by_month_days','i18n::field-time_targeting_by_month_days',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(361,'time_targeting_by_month','i18n::field-time_targeting_by_month',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(362,'time_targeting_by_week_days','i18n::field-time_targeting_by_week_days',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(363,'time_targeting_by_hours','i18n::field-time_targeting_by_hours',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(364,'time_targeting_is_active','i18n::field-time_targeting_is_active',1,1,1,1,NULL,0,0,'',0,NULL,0,0,0),(365,'city_targeting_city','i18n::field-city_targeting_city',1,18,0,1,11,0,0,'',0,NULL,0,0,0),(366,'city_targeting_is_active','i18n::field-city_targeting_is_active',1,1,0,1,NULL,0,0,'',0,NULL,0,0,0),(367,'priority','i18n::field-order-status-priority',0,10,0,1,NULL,0,0,'',0,NULL,0,0,0),(368,'image','i18n::field-image',1,9,0,1,NULL,0,0,'',0,NULL,0,0,1),(369,'width','i18n::field-width',1,10,0,1,NULL,0,0,'',0,NULL,0,0,0),(370,'height','i18n::field-height',1,10,0,1,NULL,0,0,'',0,NULL,0,0,0),(371,'alt','i18n::field-alt',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(372,'swf','i18n::field-swf',1,21,0,1,NULL,0,0,'',0,NULL,0,0,1),(373,'swf_quality','i18n::field-swf_quality',1,18,0,1,9,0,0,'',0,NULL,0,0,0),(374,'html_content','i18n::field-html_content',1,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(375,'picture','i18n::field-picture',0,9,0,1,NULL,0,0,'',0,NULL,0,0,1),(376,'is_hidden','i18n::field-is_hidden',0,1,0,1,NULL,0,0,'',0,NULL,0,0,0),(377,'fs_file','i18n::field-fs_file',1,7,0,1,NULL,0,0,'',0,NULL,0,0,1),(378,'downloads_counter','i18n::field-downloads_counter',1,10,0,1,NULL,0,0,'',0,NULL,0,0,0),(379,'custom_id','i18n::field-sid',1,20,0,0,NULL,0,0,'',0,NULL,0,0,1),(380,'lang_id','i18n::field-lang_id',1,29,0,0,NULL,0,0,'',1,NULL,0,0,1),(381,'domain_id','i18n::field-domain_id',1,5,0,0,NULL,0,0,'',1,NULL,0,0,1),(382,'appoint_service_choice_title','i18n::field-appoint-service-choice-title',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(383,'appoint_hint_step_text','i18n::field-appoint-hint-step-text',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(384,'appoint_personal_step_title','i18n::field-appoint-personal-step-title',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(385,'appoint_personal_choice_title','i18n::field-appoint-personal-choice-title',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(386,'appoint_dont_care_button','i18n::field-appoint-dont-care-button',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(387,'appoint_dont_care_hint','i18n::field-appoint-dont-care-hint',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(388,'appoint_date_step_title','i18n::field-appoint-date-step-title',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(389,'appoint_date_choice_title','i18n::field-appoint-date-choice-title',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(390,'appoint_confirm_step_title','i18n::field-appoint-confirm-step-title',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(391,'appoint_book_time_button','i18n::field-appoint-book-time-button',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(392,'appoint_book_time_hint','i18n::field-appoint-book-time-hint',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(393,'site_name','i18n::field-site_name',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(394,'logo','Логотип',0,9,0,1,NULL,0,0,'',0,NULL,0,0,1),(395,'user_css','Пользовательский CSS',0,24,0,1,NULL,0,0,'',0,NULL,0,0,1),(396,'site_color','Цвет сайта',0,18,0,1,100,0,0,'',1,NULL,0,0,1),(397,'code','i18n::field-code',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(398,'phone','i18n::field-phone_n',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(399,'address','i18n::field-address',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(400,'copyright','Копирайт',0,26,0,1,NULL,0,0,'',0,NULL,0,0,0),(402,'rss_icon','Иконка rss',0,9,0,1,NULL,0,0,'',0,NULL,0,0,0),(403,'rss_text','Текст rss',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(404,'footer_code','i18n::field-code',0,24,0,1,NULL,0,0,'',0,NULL,0,0,0),(405,'social_networks','Социальные сети',0,15,0,1,101,0,0,'',0,NULL,0,0,0),(406,'link','Ссылка',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(407,'css_class','css класс',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(408,'author','i18n::field-author',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(409,'email','Email',0,20,0,1,NULL,0,0,'',1,3,0,0,1),(410,'theme','i18n::field-subject_template',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(411,'message','i18n::field-message',0,24,0,1,NULL,0,0,'',1,NULL,0,0,1),(413,'404_header','Заголовок 404 страницы',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(414,'404_content','Контент 404 страницы',0,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(415,'sitemap_header','Заголовок карты сайта',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(416,'description','i18n::field-description',0,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(417,'image','Картинка товара',0,9,0,1,NULL,0,0,'',0,NULL,0,0,1),(418,'search_page_header','i18n::field-header',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(422,'personal_data_policy_confirmation_text','Текст соглашения на обработку',0,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(423,'personal_data_policy_no_confirmation_error','Текст ошибки отсутствия подтверждения',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(424,'catalog_category_block_header','Заговолок блока разделов каталога',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(425,'first_content_block','Первый контентный блок',0,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(426,'second_content_block','Второй контентный блок',0,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(427,'advantages_block','Блок преимуществ',0,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(428,'popular_product_block_header','Заголовок блока популярных товаров',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(429,'main_banner_image','Изображение баннера',0,9,0,1,NULL,0,0,'',0,NULL,0,0,1),(430,'main_banner_link','Ссылка баннера',0,22,0,1,NULL,0,0,'',0,NULL,0,0,1),(431,'main_banner_text','Текст баннера',0,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(432,'category_catalog_source','Источник разделов каталога',0,22,0,1,NULL,0,0,'',0,NULL,0,0,1),(433,'news_block_source','Источник новостей',0,22,0,1,NULL,0,0,'',0,NULL,0,0,1),(434,'additional_content','Дополнительный контент',0,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(435,'popular','Популярный товар',0,1,0,1,NULL,0,0,'',0,NULL,0,0,1),(436,'order_comment','i18n::field-order-comment',0,24,0,1,NULL,0,0,'',0,NULL,0,0,1),(437,'fname','i18n::field-fname',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(438,'lname','i18n::field-lname',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(439,'father_name','i18n::field-father_name',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(440,'preffered_currency','i18n::field-preffered_currency',0,18,0,0,21,0,0,'',0,NULL,0,0,0),(441,'last_order','i18n::field-last_order',1,15,0,0,53,0,0,'',0,NULL,0,1,0),(442,'bonus','i18n::field-bonus',1,17,0,0,NULL,0,0,'',0,NULL,0,0,0),(443,'spent_bonus','i18n::field-spent_bonus',1,17,0,0,NULL,0,0,'',0,NULL,0,0,0),(444,'email','i18n::field-e-mail',0,20,0,1,NULL,0,0,'',1,3,0,0,1),(445,'phone','i18n::field-phone_n',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(446,'ip','i18n::field-ip_address',0,20,0,0,NULL,0,0,'',0,NULL,0,0,0),(447,'delivery_addresses','i18n::field-delivery_addresses',0,19,0,0,40,0,0,'',0,NULL,0,0,1),(448,'legal_persons','i18n::field-legal_persons',1,19,0,0,49,0,0,'',0,NULL,0,0,1),(449,'size','i18n::field-discount_size',0,8,0,1,NULL,0,0,'Размер скидки, который будет вычтен из стоимости заказа',1,NULL,0,0,1),(450,'catalog_items','i18n::field-goods',0,22,0,1,NULL,0,0,'',0,NULL,0,0,1),(451,'start_date','i18n::field-discount_start',0,4,0,1,NULL,0,0,'Определяет, с какого момента скидка будет действительна',0,NULL,0,0,0),(452,'end_date','i18n::field-discount_end',0,4,0,1,NULL,0,0,'Определяет, когда заканчивается срок действия скидки',0,NULL,0,0,0),(453,'minimum','i18n::field-minimal_order_price',0,8,0,1,NULL,0,0,'Минимальная стоимость заказа, когда действует скидка',0,NULL,0,0,1),(454,'maximum','i18n::field-maximal_order_price',0,8,0,1,NULL,0,0,'Максимальная стоимость заказа, когда действует скидка',0,NULL,0,0,1),(455,'minimal','i18n::field-minimal_summ',0,8,0,1,NULL,0,0,'Минимальная сумма стоимости заказов действия скидки',0,NULL,0,0,1),(456,'maximum','i18n::field-maximal_summ',0,8,0,1,NULL,0,0,'Максимальная сумма стоимости заказов действия скидки',0,NULL,0,0,1),(457,'user_groups','i18n::field-groups',0,19,0,1,39,0,0,'Список групп пользователей, которым будет доступна эта скидка',1,NULL,0,0,1),(458,'related_items','i18n::field-connected_items',0,22,0,1,NULL,0,0,'Список товаров, которые должен положить в корзину пользователь, чтобы пойдействовала скидка',1,NULL,0,0,1),(459,'order_min_price','i18n::field-order_min_price',0,8,0,1,NULL,0,0,'Стоимость заказа, после которой доставка производится бесплатно',0,NULL,0,0,1),(460,'viewpost','i18n::field-viewpost',0,18,0,1,14,0,0,'',1,NULL,0,0,0),(461,'zip_code','i18n::field-departure_city_zip_code',0,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(462,'login','i18n::field-apiship-login',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(463,'password','i18n::field-apiship-password',1,16,0,1,NULL,0,0,'',0,NULL,0,0,1),(464,'dev_mode','i18n::field-apiship-dev-mode',1,1,0,1,NULL,0,0,'',0,NULL,0,0,1),(465,'keep_log','i18n::field-keep-log',1,1,0,1,NULL,0,0,'',0,NULL,0,0,1),(466,'providers','i18n::field-apiship-providers',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(467,'delivery_types','i18n::field-apiship-delivery-types',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(468,'pickup_types','i18n::field-apiship-pickup-types',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(469,'settings','i18n::field-apiship-settings',1,24,0,1,NULL,0,0,'',0,NULL,0,0,1),(470,'reciever','i18n::field-reciever',0,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(471,'reciever_inn','i18n::field-reciever_inn',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(472,'reciever_account','i18n::field-reciever_account',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(473,'reciever_bank','i18n::field-reciever_bank',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(474,'bik','i18n::field-bik',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(475,'reciever_bank_account','i18n::field-reciever_bank_account',0,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(476,'merchant_id','i18n::field-merchant_id',0,20,0,1,NULL,0,0,'Выдается при регистрации в PayOnline System',1,NULL,0,0,0),(477,'private_key','i18n::field-private_key',0,20,0,1,NULL,0,0,'Выдается при регистрации в PayOnline System',1,NULL,0,0,0),(478,'receipt_data_send_enable','i18n::field-receipt-data-send-enable',1,1,0,1,NULL,0,0,'Используется для реализации ФЗ-54, требует заполнения ставки НДС у товаров и доставок',0,NULL,0,0,1),(479,'keep_log','i18n::field-keep-log',1,1,0,1,NULL,0,0,'',0,NULL,0,0,1),(480,'login','i18n::field-login',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(481,'password1','i18n::field-password1',0,20,0,1,NULL,0,0,'используется интерфейсом инициализации оплаты',1,NULL,0,0,0),(482,'password2','i18n::field-password2',0,20,0,1,NULL,0,0,'используется интерфейсом оповещения о платеже, XML-интерфейсах',1,NULL,0,0,0),(483,'test_mode','i18n::field-test_mode_n',0,1,0,1,NULL,0,0,'',0,NULL,0,0,1),(484,'eshopid','i18n::field-eshopid',0,20,0,1,NULL,0,0,'Номер сайта продавца, на который покупатель должен совершить платеж',1,NULL,0,0,0),(485,'secretkey','i18n::field-secretkey',0,20,0,1,NULL,0,0,'Строка символов, добавляемая к реквизитам платежа, высылаемым продавцу вместе с оповещением',1,NULL,0,0,0),(486,'name','i18n::field-name',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(487,'legal_address','i18n::field-legal_address',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(488,'phone_number','i18n::field-phone_number',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(489,'inn','i18n::field-TIN',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(490,'kpp','i18n::field-RRC',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(491,'account','i18n::field-account',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(492,'bank','i18n::field-receiver_bank',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(493,'bank_account','i18n::field-bank_account_number',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(494,'sign_image','i18n::field-sign_image',0,9,0,1,NULL,0,0,'',0,NULL,0,0,0),(495,'mnt_system_url','i18n::field-mnt_system_url',1,20,0,1,NULL,0,0,'Введите demo.moneta.ru, если у вас включен тестовый режим, либо www.payanyway.ru, если включен боевой режим.',1,NULL,0,0,1),(496,'mnt_id','i18n::field-mnt_id',1,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(497,'mnt_success_url','i18n::field-successful_pay_url',1,20,0,1,NULL,0,0,'Вы можете указать значение непосредственно в личном кабинете на demo.moneta.ru, если у вас включен тестовый режим, либо на www.payanyway.ru, если включен боевой режим.',1,NULL,0,0,1),(498,'mnt_fail_url','i18n::field-failed_pay_url',1,20,0,1,NULL,0,0,'Вы можете указать значение непосредственно в личном кабинете на demo.moneta.ru, если у вас включен тестовый режим, либо на www.payanyway.ru, если включен боевой режим.',0,NULL,0,0,1),(499,'mnt_data_integrity_code','i18n::field-data_integrity_code',1,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(500,'mnt_test_mode','i18n::field-test_mode',1,1,0,1,NULL,0,0,'',0,NULL,0,0,1),(501,'project','i18n::field-project-id',1,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(502,'key','i18n::field-secret-key',1,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(503,'source','i18n::field-owner-id',1,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(504,'partnerid','i18n::field-kvk-partnerId',0,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(505,'apikey','i18n::field-kvk-apiKey',0,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(506,'secretkey','i18n::field-kvk-secretKey',0,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(507,'demo_mode','i18n::field-demo_mode',0,1,0,1,NULL,0,0,'Включить демо-режим',0,NULL,0,0,0),(508,'merchant_id','i18n::field-emarket-id',0,20,0,1,NULL,0,0,'i18n::field-emarket-id',1,NULL,0,0,0),(509,'product_id','i18n::field-product_id',0,20,0,1,NULL,0,0,'i18n::field-product_id',1,NULL,0,0,0),(510,'ok_url','i18n::field-successful_pay_url',0,20,0,1,NULL,0,0,'i18n::field-successful_pay_url',0,NULL,0,0,0),(511,'secret_word','i18n::field-secret_word',0,20,0,1,NULL,0,0,'i18n::field-secret_word',1,NULL,0,0,0),(512,'ko_url','i18n::field-failed_pay_url',0,20,0,1,NULL,0,0,'i18n::field-failed_pay_url',0,NULL,0,0,0),(513,'shop_id','i18n::field-shop_id',0,20,0,1,NULL,0,0,'Номер магазина в ЦПП. Выдается ЦПП',1,NULL,0,0,0),(514,'scid','i18n::field-scid',0,20,0,1,NULL,0,0,'Номер витрины магазина в ЦПП. Выдается ЦПП',1,NULL,0,0,0),(515,'bank_id','i18n::field-bank_id',0,20,0,1,NULL,0,0,'Код процессингового центра \"ЮMoney\"',0,NULL,0,0,0),(516,'shop_password','i18n::field-shop_password',0,20,0,1,NULL,0,0,'Секретный пароль (20 случайных символов), указывается при заключении договора',1,NULL,0,0,0),(517,'test_mode','i18n::field-test_mode',1,1,0,1,NULL,0,0,'',0,NULL,0,0,0),(518,'paypalemail','i18n::field-paypalemail',1,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(519,'return_success','i18n::field-return_success',1,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(520,'cancel_return','i18n::field-cancel_return',1,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(521,'shop_id','i18n::field-yandex-kassa-shop-id',1,20,0,1,NULL,0,0,'Идентификатор вашего магазина в ЮKassa',1,NULL,0,0,1),(522,'secret_key','i18n::field-yandex-kassa-secret-key',1,20,0,1,NULL,0,0,'Выпустить секретный ключ можно в личном кабинете ЮKassa, в разделе \"Настройки\"',1,NULL,0,0,1),(523,'open_the_payment_result_waiting_page','i18n::field-open-the-payment-result-waiting-page',1,1,0,1,NULL,0,0,'Если данная настройка включена, то после окончания платежа покупатель будет перенаправлен на страницу на сайте /emarket/purchase/result/wait/, поэтому необходимо добавить обработку этой страницы в шаблоне сайта.',0,NULL,0,0,1),(524,'domain_id','i18n::field_domain',1,5,0,1,NULL,0,0,'',0,NULL,0,0,0),(525,'robots_txt','i18n::field-robotstxt',1,24,0,1,NULL,0,0,'',0,NULL,0,0,0),(526,'format','i18n::field-export_format',0,18,0,0,36,0,0,'Формат, в который будут преобразованы данные из UMI.CMS',1,NULL,0,0,1),(527,'elements','i18n::field-included_site_sections',0,22,0,0,NULL,0,0,'Если формат экспорта поддерживает данную функцию, будут экспортированы только выбранные разделы',0,NULL,0,0,1),(528,'excluded_elements','i18n::field-excluded_elements',0,22,0,0,NULL,0,1,'Если формат экспорта поддерживает данную функцию, выбранные разделы экспортированы не будут',0,NULL,0,0,1),(529,'cache_time','i18n::field-cache_time',0,10,0,0,NULL,0,0,'Если задано, то результат будет закеширован на указанное кол-во минут',0,NULL,0,0,0),(530,'source_name','i18n::field-source_name',0,20,0,0,NULL,0,0,'Здесь можно задать имя ресурса для обмена данными, чтобы внешние идентификаторы сущностей были привязаны к нему.',0,NULL,0,0,0),(531,'encoding_export','i18n::field-encoding_export',0,18,0,0,26,0,0,'Кодировка, в которой будут экспортированы данные',0,NULL,0,0,0),(532,'format','i18n::field-data_format',0,18,0,0,35,0,0,'Формат импотрируемых данных',1,NULL,0,0,1),(533,'file','i18n::field-data_file',0,7,0,0,NULL,0,0,'',1,NULL,0,0,1),(534,'elements','i18n::field-site_section_export',0,22,0,0,NULL,0,0,'Если формат импорта поддерживает данную функцию, данные будут импортированы в указанный раздел',0,NULL,0,0,1),(535,'encoding_import','i18n::field-encoding_import',0,18,0,0,26,0,0,'Кодировка импортируемых данных',0,NULL,0,0,0),(536,'source_name','i18n::field-source_name',0,20,0,0,NULL,0,0,'Здесь можно задать имя ресурса для обмена данными, чтобы внешние идентификаторы сущностей были привязаны к нему.',0,NULL,0,0,0),(537,'category_image','i18n::field-izobrazhenie',0,9,0,1,NULL,0,0,'',0,NULL,0,0,1),(538,'album_image','Изображение альбома',0,9,0,1,NULL,0,0,'',0,NULL,0,0,1),(539,'auth_token','i18n::field-auth-token',1,24,0,0,NULL,0,0,'',0,NULL,0,1,0),(540,'social_uid','i18n::field-social_uid',1,24,0,0,NULL,0,0,'',0,NULL,0,1,0),(541,'include_fees','i18n::field-apiship-include-fees',1,1,0,1,NULL,0,0,'',0,NULL,0,1,0),(542,'yandex_map_api_key','i18n::field-apiship-yandex_map_api_key',1,20,0,1,NULL,0,0,'Процедура получения ключа описана в подсказке',0,NULL,0,0,1),(543,'disable_auto_capture','i18n::field-disable-auto-capture',1,1,0,1,NULL,0,0,'i18n::field-disable-auto-capture-hint',0,NULL,0,0,1),(544,'dengionline_id','i18n::field-id-for-dengionline',1,10,0,1,NULL,0,0,'',1,NULL,0,1,1),(545,'dengionline_id','i18n::field-id-for-dengionline',1,20,0,1,NULL,0,0,'',1,NULL,0,1,1),(546,'domain_id_list','i18n::field-valid-domain-list',1,6,0,1,NULL,0,0,'Если применимо для всех доменов - оставьте список пустым',0,NULL,0,0,1),(547,'language_id_list','i18n::field-valid-language-list',1,30,0,1,NULL,0,0,'Если применимо для всех языков - оставьте список пустым',0,NULL,0,0,1),(548,'price_type_id','i18n::field-price-type',1,31,0,1,NULL,0,0,'',0,NULL,0,0,1),(549,'promocode','i18n::field-promocode',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(550,'is_deactivated_by_manager','i18n::field-is_deactivated_by_manager',1,1,0,0,NULL,0,0,'',0,NULL,0,0,0),(551,'disabled_user_groups','i18n::field-disabled_user_groups',1,19,1,1,39,0,0,'Укажите группы пользователей, для которых способ оплаты будет отключен',0,NULL,0,0,0),(552,'channel_header','i18n::field-channel-header',0,20,0,1,NULL,1,1,'',1,NULL,0,0,1),(553,'channel_description','i18n::field-channel-description',0,24,0,1,NULL,1,1,'',1,NULL,0,0,1),(554,'channel_site','i18n::field-channel-site',0,5,0,1,NULL,1,1,'',1,NULL,0,0,1),(555,'channel_item_limit','i18n::field-channel-item-limit',0,10,0,1,NULL,1,1,'',1,NULL,0,0,1),(556,'web_analytics_type','i18n::field-channel-web-analytics-type',0,20,0,1,NULL,1,1,'',0,NULL,0,0,0),(557,'web_analytics_id','i18n::field-channel-web-analytics-id',0,20,0,1,NULL,1,1,'',0,NULL,0,0,0),(558,'web_analytics_params','i18n::field-channel-web-analytics-params',0,20,0,1,NULL,1,1,'',0,NULL,0,0,0),(559,'web_analytics_pixel_url','i18n::field-channel-web-analytics-pixel-url',0,20,0,1,NULL,1,1,'',0,NULL,0,0,0),(560,'advertising_type','i18n::field-channel-advertising-type',0,20,0,1,NULL,1,1,'',0,NULL,0,0,0),(561,'advertising_block_id','i18n::field-channel-advertising-block-id',0,20,0,1,NULL,1,1,'',0,NULL,0,0,0),(562,'advertising_place_id','i18n::field-channel-advertising-place-id',0,20,0,1,NULL,1,1,'',0,NULL,0,0,0),(563,'advertising_code','i18n::field-channel-advertising-code',0,20,0,1,NULL,1,1,'',0,NULL,0,0,0);
/*!40000 ALTER TABLE `cms3_object_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_fields_restrictions`
--

DROP TABLE IF EXISTS `cms3_object_fields_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_object_fields_restrictions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_prefix` varchar(64) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `field_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Field restriction to field type relation_FK` (`field_type_id`),
  CONSTRAINT `FK_Field restriction to field type relation` FOREIGN KEY (`field_type_id`) REFERENCES `cms3_object_field_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_fields_restrictions`
--

LOCK TABLES `cms3_object_fields_restrictions` WRITE;
/*!40000 ALTER TABLE `cms3_object_fields_restrictions` DISABLE KEYS */;
INSERT INTO `cms3_object_fields_restrictions` VALUES (1,'systemDomain','Домен системы',10),(2,'objectType','Тип данных',10),(3,'email','E-mail',20),(4,'httpUrl','Web-адрес',20),(5,'webFormMessage','Сообщение вебформы',26),(6,'discount','Размер скидки',8);
/*!40000 ALTER TABLE `cms3_object_fields_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_files`
--

DROP TABLE IF EXISTS `cms3_object_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_object_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `obj_id` int(10) unsigned DEFAULT NULL,
  `field_id` int(10) unsigned DEFAULT NULL,
  `src` varchar(500) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ord` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `load field value` (`obj_id`,`field_id`),
  KEY `field_id` (`field_id`),
  KEY `obj_id` (`obj_id`),
  KEY `src` (`src`(255)),
  KEY `ord` (`ord`),
  CONSTRAINT `File object field content to field` FOREIGN KEY (`field_id`) REFERENCES `cms3_object_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `File object field content to object` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_files`
--

LOCK TABLES `cms3_object_files` WRITE;
/*!40000 ALTER TABLE `cms3_object_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_object_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_images`
--

DROP TABLE IF EXISTS `cms3_object_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_object_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `obj_id` int(10) unsigned DEFAULT NULL,
  `field_id` int(10) unsigned DEFAULT NULL,
  `src` varchar(500) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ord` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `load field value` (`obj_id`,`field_id`),
  KEY `field_id` (`field_id`),
  KEY `obj_id` (`obj_id`),
  KEY `src` (`src`(255)),
  KEY `alt` (`alt`),
  KEY `ord` (`ord`),
  CONSTRAINT `object field content to field` FOREIGN KEY (`field_id`) REFERENCES `cms3_object_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `object field content to object` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_images`
--

LOCK TABLES `cms3_object_images` WRITE;
/*!40000 ALTER TABLE `cms3_object_images` DISABLE KEYS */;
INSERT INTO `cms3_object_images` VALUES (59,666,300,'./images/cms/data/foto-tehniki/gidromoloty/hydro_jcb.jpg','','',1),(60,667,300,'./images/cms/data/foto-tehniki/gidromoloty/hydro_cat.jpg','','',1),(61,668,300,'./images/cms/data/foto-tehniki/gidromoloty/hydro_doosan.jpg','','',1),(62,669,300,'./images/cms/data/foto-tehniki/vibropogruzhateli/vibro_jcb.jpg','','',1),(63,670,300,'./images/cms/data/foto-tehniki/vibropogruzhateli/vibro_volvo.jpg','','',1),(64,671,300,'./images/cms/data/foto-tehniki/vibropogruzhateli/vibro_hitachi.jpg','','',1),(73,652,417,'./images/cms/data/komatsu.jpg','','',1),(74,653,417,'./images/cms/data/komatsud3.jpg','','',1),(75,654,417,'./images/cms/data/scania18.jpg','','',1),(76,655,417,'./images/cms/data/volvo10.jpg','','',1),(77,656,417,'./images/cms/data/kc-557.jpg','','',1),(78,657,417,'./images/cms/data/kc-357.jpg','','',1),(81,658,417,'./images/cms/data/popular_1.jpg','','',1),(82,659,417,'./images/cms/data/popular_2.jpg','','',1),(83,660,417,'./images/cms/data/vogele800.jpg','','',1),(84,661,417,'./images/cms/data/vogele1300.jpg','','',1),(85,662,417,'./images/cms/data/rover_2.jpg','','',1),(94,624,429,'./images/cms/data/main_img2.jpg','Аренда строительной техники','Аренда строительной техники',1),(100,722,417,'./images/cms/data/hydrohammer.jpg','','',1),(101,723,417,'./images/cms/data/vibratory_hammer.jpg','','',1),(102,644,537,'./images/cms/data/catalog_3.jpg','','',1),(103,645,537,'./images/cms/data/catalog_2.jpg','','',1),(104,646,537,'./images/cms/data/catalog_1.jpg','','',1),(105,647,537,'./images/cms/data/hydrohammer.jpg','','',1),(106,648,537,'./images/cms/data/vibratory_hammer.jpg','','',1),(107,649,537,'./images/cms/data/excavator1.jpg','','',1),(108,650,537,'./images/cms/data/paver.jpg','','',1),(110,651,537,'./images/cms/data/rover1.jpg','','',1),(111,664,538,'./images/cms/data/foto-tehniki/gidromoloty/hydro_doosan.jpg','','',1),(112,665,538,'./images/cms/data/foto-tehniki/vibropogruzhateli/vibro_hitachi.jpg','','',1),(113,623,394,'./images/cms/data/stroiteh_logo.png','Аренда спецтехники в СПб - компания стройтех','Аренда спецтехники в СПб - компания стройтех',1),(114,623,402,'./images/cms/data/siterss.png','Подписаться на RSS','Подписаться на RSS',1);
/*!40000 ALTER TABLE `cms3_object_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_lang_id_list`
--

DROP TABLE IF EXISTS `cms3_object_lang_id_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_object_lang_id_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `obj_id` int(10) unsigned DEFAULT NULL,
  `field_id` int(10) unsigned DEFAULT NULL,
  `lang_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms3_object_lang_id_list load field value` (`obj_id`,`field_id`),
  KEY `cms3_object_lang_id_list field_id` (`field_id`),
  KEY `cms3_object_lang_id_list obj_id` (`obj_id`),
  KEY `cms3_object_lang_id_list lang_id` (`lang_id`),
  CONSTRAINT `cms3_object_lang_id_list field id` FOREIGN KEY (`field_id`) REFERENCES `cms3_object_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms3_object_lang_id_list lang id` FOREIGN KEY (`lang_id`) REFERENCES `cms3_langs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms3_object_lang_id_list object id` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_lang_id_list`
--

LOCK TABLES `cms3_object_lang_id_list` WRITE;
/*!40000 ALTER TABLE `cms3_object_lang_id_list` DISABLE KEYS */;
INSERT INTO `cms3_object_lang_id_list` VALUES (1,623,380,1);
/*!40000 ALTER TABLE `cms3_object_lang_id_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_offer_id_list`
--

DROP TABLE IF EXISTS `cms3_object_offer_id_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_object_offer_id_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `obj_id` int(10) unsigned NOT NULL,
  `field_id` int(10) unsigned NOT NULL,
  `offer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms3_object_offer_id_list load field value` (`obj_id`,`field_id`),
  KEY `cms3_object_offer_id_list field_id` (`field_id`),
  KEY `cms3_object_offer_id_list obj_id` (`obj_id`),
  KEY `cms3_object_offer_id_list offer_id` (`offer_id`),
  CONSTRAINT `cms3_object_offer_id_list field id` FOREIGN KEY (`field_id`) REFERENCES `cms3_object_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms3_object_offer_id_list object id` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms3_object_offer_id_list offer id` FOREIGN KEY (`offer_id`) REFERENCES `cms3_offer_list` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_offer_id_list`
--

LOCK TABLES `cms3_object_offer_id_list` WRITE;
/*!40000 ALTER TABLE `cms3_object_offer_id_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_object_offer_id_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_price_type_id_list`
--

DROP TABLE IF EXISTS `cms3_object_price_type_id_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_object_price_type_id_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `obj_id` int(10) unsigned DEFAULT NULL,
  `field_id` int(10) unsigned DEFAULT NULL,
  `price_type_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms3_object_price_type_id_list load field value` (`obj_id`,`field_id`),
  KEY `cms3_object_price_type_id_list field_id` (`field_id`),
  KEY `cms3_object_price_type_id_list obj_id` (`obj_id`),
  KEY `cms3_object_price_type_id_list price_type_id` (`price_type_id`),
  CONSTRAINT `cms3_object_price_type_id_list field id` FOREIGN KEY (`field_id`) REFERENCES `cms3_object_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms3_object_price_type_id_list object id` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms3_object_price_type_id_list price id` FOREIGN KEY (`price_type_id`) REFERENCES `cms3_offer_price_type_list` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_price_type_id_list`
--

LOCK TABLES `cms3_object_price_type_id_list` WRITE;
/*!40000 ALTER TABLE `cms3_object_price_type_id_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_object_price_type_id_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_type_tree`
--

DROP TABLE IF EXISTS `cms3_object_type_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_object_type_tree` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `child_id` int(10) unsigned DEFAULT NULL,
  `level` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique parent-child object type relation` (`parent_id`,`child_id`),
  KEY `Object type id from child_id` (`child_id`),
  CONSTRAINT `Object type id from child_id` FOREIGN KEY (`child_id`) REFERENCES `cms3_object_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Object type id from parent_id` FOREIGN KEY (`parent_id`) REFERENCES `cms3_object_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_type_tree`
--

LOCK TABLES `cms3_object_type_tree` WRITE;
/*!40000 ALTER TABLE `cms3_object_type_tree` DISABLE KEYS */;
INSERT INTO `cms3_object_type_tree` VALUES (1,NULL,1,1),(2,NULL,3,1),(3,NULL,4,2),(4,1,4,2),(5,NULL,7,2),(6,3,7,2),(7,NULL,9,2),(8,1,9,2),(9,NULL,11,2),(10,1,11,2),(11,NULL,14,2),(12,1,14,2),(13,NULL,15,2),(14,1,15,2),(15,NULL,16,2),(16,1,16,2),(17,NULL,17,2),(18,1,17,2),(19,NULL,25,2),(20,1,25,2),(21,NULL,27,2),(22,1,27,2),(23,NULL,28,2),(24,1,28,2),(25,NULL,29,2),(26,1,29,2),(27,NULL,32,1),(28,NULL,34,1),(29,NULL,35,1),(30,NULL,36,1),(31,NULL,38,3),(32,3,38,3),(33,37,38,3),(34,NULL,39,1),(35,NULL,40,2),(36,1,40,2),(37,NULL,44,2),(38,1,44,2),(39,NULL,45,2),(40,1,45,2),(41,NULL,46,2),(42,1,46,2),(43,NULL,47,1),(44,NULL,48,2),(45,1,48,2),(46,NULL,49,2),(47,1,49,2),(48,NULL,51,1),(49,NULL,52,2),(50,1,52,2),(51,NULL,53,1),(52,NULL,54,1),(53,NULL,57,2),(54,34,57,2),(55,NULL,58,1),(56,NULL,60,2),(57,3,60,2),(58,NULL,61,2),(59,3,61,2),(60,NULL,62,1),(61,NULL,63,2),(62,3,63,2),(63,NULL,64,1),(64,NULL,65,2),(65,3,65,2),(66,NULL,66,2),(67,3,66,2),(68,NULL,67,2),(69,3,67,2),(70,NULL,68,2),(71,3,68,2),(72,NULL,69,2),(73,3,69,2),(74,NULL,70,2),(75,3,70,2),(76,NULL,71,1),(77,NULL,72,2),(78,3,72,2),(79,NULL,73,2),(80,3,73,2),(81,NULL,74,1),(82,NULL,75,1),(83,NULL,76,1),(84,NULL,77,2),(85,3,77,2),(86,NULL,78,2),(87,3,78,2),(88,NULL,81,2),(89,3,81,2),(90,NULL,82,1),(91,NULL,83,1),(92,NULL,84,1),(93,NULL,85,1),(94,NULL,86,2),(95,3,86,2),(96,NULL,87,2),(97,3,87,2),(98,NULL,88,2),(99,1,88,2),(100,NULL,89,1),(101,NULL,90,2),(102,89,90,2),(103,NULL,91,2),(104,89,91,2),(105,NULL,92,2),(106,89,92,2),(107,NULL,94,2),(108,3,94,2),(109,NULL,95,1),(110,NULL,98,2),(111,3,98,2),(112,NULL,99,2),(113,95,99,2),(114,NULL,100,2),(115,1,100,2),(116,NULL,101,3),(117,1,101,3),(118,43,101,3),(119,NULL,102,2),(120,74,102,2),(121,NULL,103,3),(122,3,103,3),(123,61,103,3),(124,NULL,106,2),(125,34,106,2),(126,NULL,107,2),(127,34,107,2),(128,NULL,108,2),(129,34,108,2),(130,NULL,109,2),(131,34,109,2),(132,NULL,110,2),(133,34,110,2),(134,NULL,111,2),(135,34,111,2),(136,NULL,112,2),(137,51,112,2),(138,NULL,113,2),(139,51,113,2),(140,NULL,114,2),(141,51,114,2),(142,NULL,115,2),(143,51,115,2),(144,NULL,116,2),(145,47,116,2),(146,NULL,117,2),(147,47,117,2),(148,NULL,118,2),(149,47,118,2),(150,NULL,119,2),(151,47,119,2),(152,NULL,121,2),(153,47,121,2),(154,NULL,122,2),(155,47,122,2),(156,NULL,123,2),(157,47,123,2),(158,NULL,127,2),(159,47,127,2),(160,NULL,128,2),(161,47,128,2),(162,NULL,130,1),(163,NULL,131,1),(164,NULL,132,2),(165,34,132,2),(166,NULL,133,2),(167,130,133,2),(168,NULL,2,2),(169,1,2,2),(170,NULL,5,2),(171,1,5,2),(172,NULL,6,2),(173,1,6,2),(174,NULL,8,2),(175,1,8,2),(176,NULL,10,2),(177,1,10,2),(178,NULL,12,2),(179,1,12,2),(180,NULL,13,2),(181,1,13,2),(182,NULL,18,2),(183,1,18,2),(184,NULL,21,1),(185,NULL,23,2),(186,1,23,2),(187,NULL,24,2),(188,1,24,2),(189,NULL,26,2),(190,1,26,2),(191,NULL,30,2),(192,1,30,2),(193,NULL,31,2),(194,1,31,2),(195,NULL,33,2),(196,1,33,2),(197,NULL,37,2),(198,3,37,2),(199,NULL,41,2),(200,1,41,2),(201,NULL,42,1),(202,NULL,43,2),(203,1,43,2),(204,NULL,50,2),(205,1,50,2),(206,NULL,55,2),(207,1,55,2),(208,NULL,56,2),(209,32,56,2),(210,NULL,59,2),(211,1,59,2),(212,NULL,79,2),(213,3,79,2),(214,NULL,80,2),(215,3,80,2),(216,NULL,93,2),(217,1,93,2),(218,NULL,96,2),(219,1,96,2),(220,NULL,97,2),(221,1,97,2),(222,NULL,104,2),(223,1,104,2),(224,NULL,105,2),(225,32,105,2),(226,NULL,129,2),(227,1,129,2);
/*!40000 ALTER TABLE `cms3_object_type_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_types`
--

DROP TABLE IF EXISTS `cms3_object_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_object_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT '0',
  `parent_id` int(10) unsigned DEFAULT NULL,
  `is_guidable` tinyint(1) DEFAULT '0',
  `is_public` tinyint(1) DEFAULT '0',
  `hierarchy_type_id` int(10) unsigned DEFAULT NULL,
  `sortable` tinyint(4) DEFAULT '0',
  `domain_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hierarchy_type_id` (`hierarchy_type_id`),
  KEY `parent_id` (`parent_id`),
  KEY `is_public` (`is_public`),
  KEY `name` (`name`),
  KEY `is_locked` (`is_locked`),
  KEY `is_guidable` (`is_guidable`),
  KEY `guid` (`guid`),
  KEY `cms3_object_types domain id` (`domain_id`),
  CONSTRAINT `cms3_object_types domain id` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_types`
--

LOCK TABLES `cms3_object_types` WRITE;
/*!40000 ALTER TABLE `cms3_object_types` DISABLE KEYS */;
INSERT INTO `cms3_object_types` VALUES (1,'root-guides-type','i18n::object-type-spravochniki',1,0,0,0,0,0,NULL),(2,'de8627f75ba1abcfafd00a0e75ad189105cfdc21','i18n::object-type-status_stranicy',1,1,1,1,0,0,NULL),(3,'root-pages-type','i18n::object-type-razdel_sajta',1,0,0,0,0,0,NULL),(4,'fe5dbbcea5ce7e2988b8c69bcfdfde8904aabc1f','i18n::object-type-pol',1,1,1,0,0,0,NULL),(5,'472b07b9fcf2c2451e8781e944bf5f77cd8457c8','i18n::object-type-tip_rss',1,1,1,1,0,0,NULL),(6,'news-rss-source-charset','i18n::object-type-news-rss-source-charset',1,1,1,1,0,0,NULL),(7,'news-rubric','i18n::object-type-news-rubric',1,3,1,0,1,0,NULL),(8,'12c6fc06c99a462375eeb3f43dfd832b08ca9e17','i18n::object-type-rss-lenta',1,1,1,1,0,0,NULL),(9,'banners-banner-swf-quality','i18n::object-type-kachestvo_fleshki',1,1,1,0,0,0,NULL),(10,'d69b923df6140a16aefc89546a384e0493641fbe','i18n::object-type-strany',1,1,1,1,0,0,NULL),(11,'sytem-citylist','i18n::object-type-spisok_gorodov_dlya_geo',1,1,1,0,0,0,NULL),(12,'96e388c0b3b7fd874b48621e850335a8f06ca58d','i18n::object-type-price_modifier',1,1,1,1,0,0,NULL),(13,'6fe3dfe314684a658c1b19ca7a8e3abd29afe23e','i18n::object-type-validation_rule',1,1,1,1,0,0,NULL),(14,'cd8b7a4b8bb9bbf442a9d50fa465fe0e9d868a13','i18n::object-type-dispatch_type',1,1,1,0,0,0,NULL),(15,'a1496d4ad0a359b6fe93d819e4a2141bd9d9ac35','i18n::object-type-carriage_type',1,1,1,0,0,0,NULL),(16,'c9264fc806cdb67dc2080db570871067a6134c2d','i18n::object-type-hours',1,1,1,0,0,0,NULL),(17,'d528edaa45e66e08a9ece98272130b42e77cef55','i18n::object-type-days',1,1,1,0,0,0,NULL),(18,'blacklist','i18n::object-type-blacklist',1,1,1,1,0,0,NULL),(21,'emarket-currency','i18n::object-type-valyuta',1,0,1,1,2,0,NULL),(23,'emarket-mobile-platform','i18n::object-type-mobile-platform',1,1,1,1,0,0,NULL),(24,'emarket-mobile-devices','i18n::object-type-mobile-devices',1,1,1,1,0,0,NULL),(25,'emarket-purchase-oneclick','i18n::object-type-emarket-purchase-oneclick',1,1,1,0,0,0,NULL),(26,'exchange-encodings','i18n::object-type-exchange-encodings',0,1,1,1,0,0,NULL),(27,'tax-rate-guide','i18n::object-type-tax-rate',1,1,1,0,0,0,NULL),(28,'payment_subject','i18n::payment-subject-type',0,1,1,0,0,0,NULL),(29,'payment_mode','i18n::payment-mode-type',0,1,1,0,0,0,NULL),(30,'emarket-discounttype','i18n::object-type-discounttype',1,1,1,1,3,0,NULL),(31,'emarket-discountmodificatortype','i18n::object-type-discountmodificatortype',1,1,1,1,4,0,NULL),(32,'81755a2845e39420c81902a3ce83dff1cfc782e7','i18n::object-type-discount_price_modifier',1,0,0,0,0,0,NULL),(33,'emarket-discountruletype','i18n::object-type-discountruletype',1,1,1,1,5,0,NULL),(34,'190c4a70068f9453e2320b650e94869a1306adb0','i18n::object-type-discountrules',1,0,0,0,0,0,NULL),(35,'exchange-format-import','i18n::object-type-import_format',1,0,1,0,0,0,NULL),(36,'exchange-format-export','i18n::object-type-export_format',1,0,1,0,0,0,NULL),(37,'social_networks-network','i18n::object-type-network',1,3,1,1,6,0,NULL),(38,'social_networks-network-vkontakte','i18n::object-type-vkontakte',1,37,0,0,7,0,NULL),(39,'users-users','i18n::object-type-users-users',1,0,1,0,8,0,NULL),(40,'emarket-deliveryaddress','i18n::object-type-eshop-address',1,1,1,0,9,0,NULL),(41,'emarket-itemtype','i18n::object-type-itemtype',1,1,1,1,10,0,NULL),(42,'emarket-discount','i18n::object-type-discount',1,0,1,1,11,0,NULL),(43,'emarket-itemoption','i18n::object-type-itemoption',1,1,1,1,12,0,NULL),(44,'emarket-orderitem','i18n::object-type-eshop-order_item',1,1,1,0,13,0,NULL),(45,'emarket-orderstatus','i18n::object-type-eshop-order_status',1,1,1,0,14,0,NULL),(46,'emarket-paymenttype','i18n::object-type-paymenttype',1,1,1,0,15,0,NULL),(47,'emarket-payment','i18n::object-type-payment',1,0,1,0,16,0,NULL),(48,'emarket-orderpaymentstatus','i18n::object-type-orderpaymentstatus',1,1,1,0,17,0,NULL),(49,'emarket-legalperson','i18n::object-type-legalperson',1,1,1,0,18,0,NULL),(50,'emarket-deliverytype','i18n::object-type-deliverytype',1,1,1,1,19,0,NULL),(51,'emarket-delivery','i18n::object-type-delivery',1,0,1,0,20,0,NULL),(52,'emarket-orderdeliverystatus','i18n::object-type-orderdeliverystatus',1,1,1,0,21,0,NULL),(53,'emarket-order','i18n::object-type-order',1,0,1,0,22,0,NULL),(54,'users-user','i18n::object-type-users-user',1,0,1,0,23,0,NULL),(55,'emarket-store','i18n::object-type-store',1,1,1,1,24,0,NULL),(56,'emarket-discountmodificator-768','i18n::object-type-order_summ_percent',1,32,1,1,25,0,NULL),(57,'emarket-discountrule-798','i18n::object-type-users_discount',1,34,0,0,26,0,NULL),(58,'menu-menu','i18n::object-type-menu',0,0,0,0,27,0,NULL),(59,'news-subject','i18n::object-type-news-subject',1,1,1,1,28,0,NULL),(60,'news-item','i18n::object-type-news-item',1,3,0,0,29,0,NULL),(61,'content-page','i18n::object-type-content-',1,3,0,0,30,0,NULL),(62,'content-ticket','i18n::object-type-content-ticket',1,0,0,0,31,0,NULL),(63,'blogs20-blog','i18n::object-type-blogs20-blog',1,3,1,0,32,0,NULL),(64,'users-author','i18n::object-type-users-author',1,0,1,0,33,0,NULL),(65,'blogs20-comment','i18n::object-type-blogs20-comment',1,3,1,0,34,0,NULL),(66,'blogs20-post','i18n::object-type-blogs20-post',1,3,1,0,35,0,NULL),(67,'forum-conf','i18n::object-type-forum-conf',1,3,0,0,36,0,NULL),(68,'forum-topic','i18n::object-type-forum-topic',1,3,0,0,37,0,NULL),(69,'forum-message','i18n::object-type-forum-message',1,3,0,0,38,0,NULL),(70,'comments-comment','i18n::object-type-comments-comment',1,3,0,0,39,0,NULL),(71,'vote-pollitem','i18n::object-type-vote-poll_item',1,0,1,0,40,0,NULL),(72,'vote-poll','i18n::object-type-vote-poll',1,3,0,0,41,0,NULL),(73,'webforms-page','i18n::object-type-webforms-page',1,3,1,0,42,0,NULL),(74,'webforms-form','i18n::object-type-webforms-form',1,0,0,0,43,0,NULL),(75,'webforms-template','i18n::object-type-webforms-template',1,0,0,0,44,0,NULL),(76,'webforms-address','i18n::object-type-webforms-address',1,0,0,0,45,0,NULL),(77,'photoalbum-album','i18n::object-type-photoalbum-album',1,3,0,0,46,0,NULL),(78,'photoalbum-photo','i18n::object-type-photoalbum-photo',1,3,0,0,47,0,NULL),(79,'faq-project','i18n::object-type-faq-project',1,3,0,1,48,0,NULL),(80,'faq-category','i18n::object-type-faq-category',1,3,0,1,49,0,NULL),(81,'faq-question','i18n::object-type-faq-question',1,3,0,0,50,0,NULL),(82,'dispatches-dispatch','i18n::object-type-dispatches-dispatch',1,0,1,0,51,0,NULL),(83,'dispatches-release','i18n::object-type-dispatches-release',1,0,1,0,52,0,NULL),(84,'dispatches-message','i18n::object-type-dispatches-message',1,0,1,0,53,0,NULL),(85,'dispatches-subscriber','i18n::object-type-dispatches-subscriber',1,0,1,0,54,0,NULL),(86,'catalog-category','i18n::object-type-catalog-category',1,3,0,0,55,0,NULL),(87,'catalog-object','i18n::object-type-catalog-object',1,3,0,0,56,0,NULL),(88,'banners-place','i18n::object-type-banners-place',1,1,1,0,57,0,NULL),(89,'banners-banner','i18n::object-type-banners-banner',1,0,0,0,58,0,NULL),(90,'banners-banner-image','i18n::object-type-banners-banner-image',1,89,0,0,58,0,NULL),(91,'banners-banner-swf','i18n::object-type-banners-banner-swf',1,89,0,0,58,0,NULL),(92,'banners-banner-html','i18n::object-type-banners-banner-html',1,89,0,0,58,0,NULL),(93,'users-avatar','i18n::object-type-users-avatar',1,1,1,1,59,0,NULL),(94,'filemanager-sharedfile','i18n::object-type-filemanager-shared_file',1,3,0,0,60,0,NULL),(95,'root-settings-type','i18n::object-type-root-settings-type',1,0,0,0,61,0,NULL),(96,'ip-blacklist','i18n::object-type-ip_blacklist',1,1,1,1,62,0,NULL),(97,'ip-whitelist','i18n::object-type-ip_whitelist',1,1,1,1,63,0,NULL),(98,'appointment-page','i18n::hierarchy-type-appointment-page',1,3,0,0,64,0,NULL),(99,'','demotractor',0,95,0,0,61,0,1),(100,'','Цвета сайта',0,1,1,0,0,0,NULL),(101,'','Социальные сети в футере',0,43,1,0,12,0,NULL),(102,'','Обратная связь',0,74,0,0,43,0,NULL),(103,'','Главная страница',0,61,0,0,30,0,NULL),(104,'emarket-customer','i18n::object-type-customer',1,1,1,1,65,0,NULL),(105,'emarket-discountmodificator-800','i18n::object-type-fixed_discount',1,32,1,1,25,0,NULL),(106,'emarket-discountrule-777','i18n::object-type-special_items_discount',1,34,0,0,26,0,NULL),(107,'emarket-discountrule-794','i18n::object-type-time_interval',1,34,0,0,26,0,NULL),(108,'emarket-discountrule-795','i18n::object-type-order_summ',1,34,0,0,26,0,NULL),(109,'emarket-discountrule-796','i18n::object-type-customer_summ',1,34,0,0,26,0,NULL),(110,'emarket-discountrule-797','i18n::object-type-users_group_discount',1,34,0,0,26,0,NULL),(111,'emarket-discountrule-799','i18n::object-type-related_items_discount',1,34,0,0,26,0,NULL),(112,'emarket-delivery-783','i18n::object-type-pickup',1,51,0,0,20,0,NULL),(113,'emarket-delivery-784','i18n::object-type-courier_deliver_spb',1,51,0,0,20,0,NULL),(114,'emarket-delivery-808','i18n::object-type-mail',1,51,0,0,20,0,NULL),(115,'emarket-delivery-842','i18n::object-type-apiship',1,51,0,0,20,0,NULL),(116,'emarket-payment-791','i18n::object-type-sales_draft',1,47,0,0,16,0,NULL),(117,'emarket-payment-801','i18n::object-type-pay_online',1,47,0,0,16,0,NULL),(118,'emarket-payment-802','i18n::object-type-courier',1,47,0,0,16,0,NULL),(119,'emarket-payment-812','i18n::object-type-robokassa',1,47,0,0,16,0,NULL),(121,'emarket-payment-816','i18n::object-type-legal_person_account',1,47,0,0,16,0,NULL),(122,'emarket-payment-payanyway','i18n::object-type-payanyway',1,47,0,0,16,0,NULL),(123,'emarket-payment-dengionline','i18n::object-type-dengionline',1,47,0,0,16,0,NULL),(127,'emarket-payment-paypal','i18n::object-type-emarket-payment-paypal',1,47,0,0,16,0,NULL),(128,'emarket-payment-yandex-kassa','i18n::object-type-emarket-payment-yandex-kassa',1,47,0,0,16,0,NULL),(129,'robots-txt','i18n::object-type-robots-txt',1,1,1,1,66,0,NULL),(130,'exchange-export','i18n::object-type-export',1,0,0,0,67,0,NULL),(131,'exchange-import','i18n::object-type-import',1,0,0,0,68,0,NULL),(132,'emarket-discountrule-850','i18n::object-type-promo_code_discount',1,34,0,0,26,0,NULL),(133,'exchange-export-yandex-turbo-pages','i18n::object-type-export-yandex-turbo-pages',0,130,0,0,67,0,NULL);
/*!40000 ALTER TABLE `cms3_object_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_objects`
--

DROP TABLE IF EXISTS `cms3_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_objects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT NULL,
  `type_id` int(10) unsigned DEFAULT NULL,
  `owner_id` int(10) unsigned DEFAULT NULL,
  `ord` int(10) unsigned DEFAULT '0',
  `updatetime` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Object to type relation_FK` (`type_id`),
  KEY `name` (`name`),
  KEY `owner_id` (`owner_id`),
  KEY `is_locked` (`is_locked`),
  KEY `ord` (`ord`),
  KEY `guid` (`guid`),
  KEY `updatetime` (`updatetime`),
  CONSTRAINT `FK_Object to type relation` FOREIGN KEY (`type_id`) REFERENCES `cms3_object_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=755 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_objects`
--

LOCK TABLES `cms3_objects` WRITE;
/*!40000 ALTER TABLE `cms3_objects` DISABLE KEYS */;
INSERT INTO `cms3_objects` VALUES (1,'social_networks-network-27915','i18n::object-vkontakte',1,38,0,1,1556105553),(2,'84a36e2847c33ac03a7223b57b0c864b80ab26c8','i18n::object-rss',0,5,0,1,1556105553),(3,'a35ff773f425e44df36c1cc68a415d92318b19ac','i18n::object-atom',0,5,0,2,1556105553),(4,'e99ecbbec4c871f3fb63c3cc85796e177d017614','i18n::object-male',0,4,0,1,1556105553),(5,'7b04a4565f37a07f1c2ee54be8286017de6c56df','i18n::object-female',0,4,0,2,1556105553),(6,'swf-banner-quality-low','i18n::object-low',0,9,0,1,1556105553),(7,'swf-banner-quality-medium','i18n::object-medium',0,9,0,2,1556105553),(8,'swf-banner-quality-high','i18n::object-height',0,9,0,3,1556105553),(9,'a1e3ae17e80ba2b4a3ddb1b855430346f74b8d48','i18n::object-usa',1,10,0,1,1556105553),(10,'e9aa8c23a339224b25945aa9e99f09f578bdd483','i18n::object-russia',1,10,0,2,1556105553),(11,'sytem-citylist-26905','Москва',0,11,0,1,1556105553),(12,'sytem-citylist-26906','Санкт-Петербург',0,11,0,2,1556105553),(13,'sytem-citylist-26907','Новосибирск',0,11,0,3,1556105553),(14,'sytem-citylist-26908','Екатеринбург',0,11,0,4,1556105553),(15,'sytem-citylist-26909','Нижний Новгород',0,11,0,5,1556105553),(16,'sytem-citylist-26910','Самара',0,11,0,6,1556105553),(17,'sytem-citylist-26911','Омск',0,11,0,7,1556105553),(18,'sytem-citylist-26912','Казань',0,11,0,8,1556105553),(19,'sytem-citylist-26913','Челябинск',0,11,0,9,1556105553),(20,'sytem-citylist-26914','Ростов-на-Дону',0,11,0,10,1556105553),(21,'sytem-citylist-26915','Уфа',0,11,0,11,1556105553),(22,'sytem-citylist-26916','Пермь',0,11,0,12,1556105553),(23,'sytem-citylist-26917','Волгоград',0,11,0,13,1556105553),(24,'sytem-citylist-26918','Красноярск',0,11,0,14,1556105553),(25,'sytem-citylist-26919','Саратов',0,11,0,15,1556105553),(26,'sytem-citylist-26920','Воронеж',0,11,0,16,1556105553),(27,'sytem-citylist-26921','Краснодар',0,11,0,17,1556105553),(28,'sytem-citylist-26922','Тольятти',0,11,0,18,1556105553),(29,'sytem-citylist-26923','Ижевск',0,11,0,19,1556105553),(30,'sytem-citylist-26924','Ульяновск',0,11,0,20,1556105553),(31,'sytem-citylist-26925','Ярославль',0,11,0,21,1556105553),(32,'sytem-citylist-26926','Барнаул',0,11,0,22,1556105553),(33,'sytem-citylist-26927','Владивосток',0,11,0,23,1556105553),(34,'sytem-citylist-26928','Хабаровск',0,11,0,24,1556105553),(35,'sytem-citylist-26929','Иркутск',0,11,0,25,1556105553),(36,'sytem-citylist-26930','Новокузнецк',0,11,0,26,1556105553),(37,'sytem-citylist-26931','Тюмень',0,11,0,27,1556105553),(38,'sytem-citylist-26932','Оренбург',0,11,0,28,1556105553),(39,'sytem-citylist-26933','Кемерово',0,11,0,29,1556105553),(40,'sytem-citylist-26934','Рязань',0,11,0,30,1556105553),(41,'sytem-citylist-26935','Пенза',0,11,0,31,1556105553),(42,'sytem-citylist-26936','Набережные Челны',0,11,0,32,1556105553),(43,'sytem-citylist-26937','Тула',0,11,0,33,1556105553),(44,'sytem-citylist-26938','Липецк',0,11,0,34,1556105553),(45,'sytem-citylist-26939','Астрахань',0,11,0,35,1556105553),(46,'sytem-citylist-26940','Томск',0,11,0,36,1556105553),(47,'sytem-citylist-26941','Махачкала',0,11,0,37,1556105553),(48,'sytem-citylist-26942','Киров',0,11,0,38,1556105553),(49,'sytem-citylist-26943','Чебоксары',0,11,0,39,1556105553),(50,'sytem-citylist-26944','Калининград',0,11,0,40,1556105553),(51,'sytem-citylist-26945','Брянск',0,11,0,41,1556105553),(52,'sytem-citylist-26946','Магнитогорск',0,11,0,42,1556105553),(53,'sytem-citylist-26947','Иваново',0,11,0,43,1556105553),(54,'sytem-citylist-26948','Курск',0,11,0,44,1556105553),(55,'sytem-citylist-26949','Тверь',0,11,0,45,1556105553),(56,'sytem-citylist-26950','Нижний Тагил',0,11,0,46,1556105553),(57,'sytem-citylist-26951','Ставрополь',0,11,0,47,1556105553),(58,'sytem-citylist-26952','Архангельск',0,11,0,48,1556105553),(59,'sytem-citylist-26953','Белгород',0,11,0,49,1556105553),(60,'sytem-citylist-26954','Улан-Удэ',0,11,0,50,1556105553),(61,'sytem-citylist-26955','Владимир',0,11,0,51,1556105553),(62,'sytem-citylist-26956','Сочи',0,11,0,52,1556105553),(63,'sytem-citylist-26957','Калуга',0,11,0,53,1556105553),(64,'sytem-citylist-26958','Курган',0,11,0,54,1556105553),(65,'sytem-citylist-26959','Орёл',0,11,0,55,1556105553),(66,'sytem-citylist-26960','Смоленск',0,11,0,56,1556105553),(67,'sytem-citylist-26961','Мурманск',0,11,0,57,1556105553),(68,'sytem-citylist-26962','Владикавказ',0,11,0,58,1556105553),(69,'sytem-citylist-26963','Череповец',0,11,0,59,1556105553),(70,'sytem-citylist-26964','Волжский',0,11,0,60,1556105553),(71,'sytem-citylist-26965','Чита',0,11,0,61,1556105553),(72,'sytem-citylist-26966','Саранск',0,11,0,62,1556105553),(73,'sytem-citylist-26967','Сургут',0,11,0,63,1556105553),(74,'sytem-citylist-26968','Вологда',0,11,0,64,1556105553),(75,'sytem-citylist-26969','Тамбов',0,11,0,65,1556105553),(76,'sytem-citylist-26970','Кострома',0,11,0,66,1556105553),(77,'sytem-citylist-26971','Комсомольск-на-Амуре',0,11,0,67,1556105553),(78,'sytem-citylist-26972','Нальчик',0,11,0,68,1556105553),(79,'sytem-citylist-26973','Петрозаводск',0,11,0,69,1556105553),(80,'sytem-citylist-26974','Стерлитамак',0,11,0,70,1556105553),(81,'sytem-citylist-26975','Таганрог',0,11,0,71,1556105553),(82,'sytem-citylist-26976','Братск',0,11,0,72,1556105553),(83,'sytem-citylist-26977','Дзержинск',0,11,0,73,1556105553),(84,'sytem-citylist-26978','Йошкар-Ола',0,11,0,74,1556105553),(85,'sytem-citylist-26979','Орск',0,11,0,75,1556105553),(86,'sytem-citylist-26980','Шахты',0,11,0,76,1556105553),(87,'sytem-citylist-26981','Якутск',0,11,0,77,1556105553),(88,'sytem-citylist-26982','Ангарск',0,11,0,78,1556105553),(89,'sytem-citylist-26983','Нижневартовск',0,11,0,79,1556105553),(90,'sytem-citylist-26984','Сыктывкар',0,11,0,80,1556105553),(91,'sytem-citylist-26985','Новороссийск',0,11,0,81,1556105553),(92,'sytem-citylist-26986','Нижнекамск',0,11,0,82,1556105554),(93,'sytem-citylist-26987','Бийск',0,11,0,83,1556105554),(94,'sytem-citylist-26988','Грозный',0,11,0,84,1556105554),(95,'sytem-citylist-26989','Старый Оскол',0,11,0,85,1556105554),(96,'sytem-citylist-26990','Великий Новгород',0,11,0,86,1556105554),(97,'sytem-citylist-26991','Прокопьевск',0,11,0,87,1556105554),(98,'sytem-citylist-26992','Рыбинск',0,11,0,88,1556105554),(99,'sytem-citylist-26993','Норильск',0,11,0,89,1556105554),(100,'sytem-citylist-26994','Благовещенск',0,11,0,90,1556105554),(101,'sytem-citylist-26995','Энгельс',0,11,0,91,1556105554),(102,'sytem-citylist-26996','Балаково',0,11,0,92,1556105554),(103,'sytem-citylist-26997','Петропавловск-Камчатский',0,11,0,93,1556105554),(104,'sytem-citylist-26998','Псков',0,11,0,94,1556105554),(105,'sytem-citylist-26999','Северодвинск',0,11,0,95,1556105554),(106,'sytem-citylist-27000','Армавир',0,11,0,96,1556105554),(107,'sytem-citylist-27001','Златоуст',0,11,0,97,1556105554),(108,'sytem-citylist-27002','Балашиха',0,11,0,98,1556105554),(109,'sytem-citylist-27003','Каменск-Уральский',0,11,0,99,1556105554),(110,'sytem-citylist-27004','Химки',0,11,0,100,1556105554),(111,'sytem-citylist-27005','Сызрань',0,11,0,101,1556105554),(112,'sytem-citylist-27006','Подольск',0,11,0,102,1556105554),(113,'sytem-citylist-27007','Новочеркасск',0,11,0,103,1556105554),(114,'sytem-citylist-27008','Королёв',0,11,0,104,1556105554),(115,'sytem-citylist-27009','Южно-Сахалинск',0,11,0,105,1556105554),(116,'sytem-citylist-27010','Волгодонск',0,11,0,106,1556105554),(117,'sytem-citylist-27011','Находка',0,11,0,107,1556105554),(118,'sytem-citylist-27012','Березники',0,11,0,108,1556105554),(119,'sytem-citylist-27013','Абакан',0,11,0,109,1556105554),(120,'sytem-citylist-27014','Мытищи',0,11,0,110,1556105554),(121,'sytem-citylist-27015','Люберцы',0,11,0,111,1556105554),(122,'sytem-citylist-27016','Рубцовск',0,11,0,112,1556105554),(123,'sytem-citylist-27017','Майкоп',0,11,0,113,1556105554),(124,'sytem-citylist-27018','Салават',0,11,0,114,1556105554),(125,'sytem-citylist-27019','Уссурийск',0,11,0,115,1556105554),(126,'sytem-citylist-27020','Миасс',0,11,0,116,1556105554),(127,'sytem-citylist-27021','Ковров',0,11,0,117,1556105554),(128,'sytem-citylist-27022','Коломна',0,11,0,118,1556105554),(129,'sytem-citylist-27023','Электросталь',0,11,0,119,1556105554),(130,'sytem-citylist-27024','Альметьевск',0,11,0,120,1556105554),(131,'sytem-citylist-27025','Пятигорск',0,11,0,121,1556105554),(132,'sytem-citylist-27026','Копейск',0,11,0,122,1556105554),(133,'sytem-citylist-27027','Первоуральск',0,11,0,123,1556105554),(134,'sytem-citylist-27028','Назрань',0,11,0,124,1556105554),(135,'sytem-citylist-27029','Одинцово',0,11,0,125,1556105554),(136,'sytem-citylist-27030','Невинномысск',0,11,0,126,1556105554),(137,'sytem-citylist-27031','Кисловодск',0,11,0,127,1556105554),(138,'sytem-citylist-27032','Димитровград',0,11,0,128,1556105554),(139,'sytem-citylist-27033','Хасавюрт',0,11,0,129,1556105554),(140,'sytem-citylist-27034','Новочебоксарск',0,11,0,130,1556105554),(141,'sytem-citylist-27035','Новомосковск',0,11,0,131,1556105554),(142,'sytem-citylist-27036','Серпухов',0,11,0,132,1556105554),(143,'sytem-citylist-27037','Орехово-Зуево',0,11,0,133,1556105554),(144,'sytem-citylist-27038','Муром',0,11,0,134,1556105554),(145,'sytem-citylist-27039','Камышин',0,11,0,135,1556105554),(146,'sytem-citylist-27040','Железнодорожный',0,11,0,136,1556105554),(147,'sytem-citylist-27041','Нефтекамск',0,11,0,137,1556105554),(148,'sytem-citylist-27042','Новый Уренгой',0,11,0,138,1556105554),(149,'sytem-citylist-27043','Черкесск',0,11,0,139,1556105554),(150,'sytem-citylist-27044','Ногинск',0,11,0,140,1556105554),(151,'sytem-citylist-27045','Новошахтинск',0,11,0,141,1556105554),(152,'sytem-citylist-27046','Нефтеюганск',0,11,0,142,1556105554),(153,'sytem-citylist-27047','Щёлково',0,11,0,143,1556105554),(154,'sytem-citylist-27048','Елец',0,11,0,144,1556105554),(155,'sytem-citylist-27049','Ачинск',0,11,0,145,1556105554),(156,'sytem-citylist-27050','Новокуйбышевск',0,11,0,146,1556105554),(157,'sytem-citylist-27051','Сергиев Посад',0,11,0,147,1556105554),(158,'sytem-citylist-27052','Ноябрьск',0,11,0,148,1556105554),(159,'sytem-citylist-27053','Кызыл',0,11,0,149,1556105554),(160,'sytem-citylist-27054','Дербент',0,11,0,150,1556105554),(161,'sytem-citylist-27055','Октябрьский',0,11,0,151,1556105554),(162,'sytem-citylist-27056','Северск',0,11,0,152,1556105554),(163,'sytem-citylist-27057','Ленинск-Кузнецкий',0,11,0,153,1556105554),(164,'sytem-citylist-27058','Арзамас',0,11,0,154,1556105554),(165,'sytem-citylist-27059','Обнинск',0,11,0,155,1556105554),(166,'sytem-citylist-27060','Ухта',0,11,0,156,1556105554),(167,'sytem-citylist-27061','Междуреченск',0,11,0,157,1556105554),(168,'sytem-citylist-27062','Киселёвск',0,11,0,158,1556105554),(169,'sytem-citylist-27063','Новотроицк',0,11,0,159,1556105554),(170,'sytem-citylist-27064','Батайск',0,11,0,160,1556105554),(171,'sytem-citylist-27065','Элиста',0,11,0,161,1556105554),(172,'sytem-citylist-27066','Артём',0,11,0,162,1556105554),(173,'sytem-citylist-27067','Жуковский',0,11,0,163,1556105554),(174,'sytem-citylist-27068','Великие Луки',0,11,0,164,1556105554),(175,'sytem-citylist-27069','Канск',0,11,0,165,1556105554),(176,'sytem-citylist-27070','Магадан',0,11,0,166,1556105554),(177,'sytem-citylist-27071','Тобольск',0,11,0,167,1556105554),(178,'sytem-citylist-27072','Глазов',0,11,0,168,1556105554),(179,'emarket-discounttype-27131','i18n::object-catalog_item_discount',0,30,0,1,1556105554),(180,'emarket-discounttype-27132','i18n::object-order_discount',0,30,0,2,1556105554),(181,'users-users-15','i18n::object-supervajzery',1,39,0,1,1556105554),(182,'system-supervisor','sv',1,54,0,1,1678957672),(183,'emarket-discounttype-bonus','i18n::object-bonus-discount',0,30,0,3,1556105554),(184,'emarket-discountmodificatortype-27136','i18n::object-summ_percent',0,31,0,1,1556105558),(185,'emarket-store-27147','i18n::object-main_store',0,55,0,1,1556105554),(186,'emarket-discountruletype-27150','i18n::object-specify_items',0,33,0,1,1556105558),(187,'emarket-itemtype-27180','i18n::object-digital',1,41,0,1,1556105554),(188,'emarket-itemtype-27181','i18n::object-complex',1,41,0,2,1556105554),(189,'emarket-deliverytype-27230','i18n::object-pickup',0,50,0,1,1556105554),(190,'emarket-deliverytype-27233','i18n::object-courier_delivery',0,50,0,2,1556105554),(191,'emarket-paymenttype-27236','i18n::object-sales_draft',1,46,0,1,1556105554),(192,'emarket-orderstatus-27258','i18n::object-otmenen',1,45,0,1,1556105554),(193,'emarket-orderstatus-27259','i18n::object-otklonen',1,45,0,2,1556105554),(194,'emarket-orderstatus-27260','i18n::object-oplachivaetsya',1,45,0,3,1556105554),(195,'emarket-orderstatus-27261','i18n::object-dostavlyaetsya',1,45,0,4,1556105554),(196,'emarket-orderstatus-27262','i18n::object-ozhidaet_proverki',1,45,0,5,1556105554),(197,'emarket-orderstatus-27263','i18n::object-prinyat',1,45,0,6,1556105554),(198,'emarket-orderstatus-27264','i18n::object-gotov',1,45,0,7,1556105554),(199,'emarket-orderdeliverystatus-27377','i18n::object-ojidaet_otgruzki',1,52,0,1,1556105554),(200,'emarket-orderdeliverystatus-27378','i18n::object-dostavlyaetsya',1,52,0,2,1556105554),(201,'emarket-orderdeliverystatus-27379','i18n::object-dostavlen',1,52,0,3,1556105554),(202,'emarket-orderpaymentstatus-27380','i18n::object-inicialisirovana',1,48,0,1,1556105554),(203,'emarket-orderpaymentstatus-27381','i18n::object-podtverjdena',1,48,0,2,1556105554),(204,'emarket-orderpaymentstatus-27382','i18n::object-otklonena',1,48,0,3,1556105554),(205,'emarket-orderpaymentstatus-27383','i18n::object-prinyata',1,48,0,4,1556105554),(206,'emarket-discountruletype-27393','i18n::object-time_interval_discount',0,33,0,2,1556105558),(207,'emarket-discountruletype-27394','i18n::object-order_summ_discount',0,33,0,3,1556105558),(208,'emarket-discountruletype-27395','i18n::object-user_summ_discount',0,33,0,4,1556105558),(209,'emarket-discountruletype-27396','i18n::object-user_group_discount',0,33,0,5,1556105558),(210,'emarket-discountruletype-27397','i18n::object-users_discount',0,33,0,6,1556105558),(211,'emarket-discountruletype-27398','i18n::object-related_items_discount',0,33,0,7,1556105558),(212,'emarket-discountmodificatortype-27456','i18n::object-fixed_modifier',0,31,0,2,1556105558),(213,'emarket-paymenttype-27457','i18n::object-payonline_system',1,46,0,2,1556105554),(214,'emarket-paymenttype-27458','i18n::object-to_courier',1,46,0,3,1556105554),(215,'399872db6f3d1341ef99b406aa2a9e515292b0c9','object-surface',0,15,0,1,1556105554),(216,'417baf8cefb99325510d31e974835254c980828b','object-air',0,15,0,2,1556105554),(217,'76377e05d0ffd4b0f6f0e72a45645f4be10f1c66','object-composite',0,15,0,3,1556105554),(218,'df383879afa5ac2e221b8fa0b0f2a6467da2886f','object-accelerated',0,15,0,4,1556105554),(219,'emarket-deliverytype-27481','i18n::object-russian_post',0,50,0,3,1556105554),(220,'emarket-paymenttype-27486','i18n::object-robokassa',1,46,0,4,1556105554),(222,'6bc46e77b86f1420917bee7a0e2154b34cdaad61','00:00',0,16,0,1,1556105554),(223,'1648322caec238f02862b0449a33b58245a9d6ce','01:00',0,16,0,2,1556105554),(224,'da2e75029f33e530c848c3aa89690ec07dd414b2','02:00',0,16,0,3,1556105554),(225,'8794b39a7bd4fe275575b6b864cf1fcca4d6d93b','03:00',0,16,0,4,1556105554),(226,'2054dced2668a57484cb2aa2498def91c22320ae','04:00',0,16,0,5,1556105554),(227,'14aa300dbddcacb6c76a4b5a364a034b6128693a','05:00',0,16,0,6,1556105554),(228,'5dc9eb3a83efd4d3302570742365c0186386947d','06:00',0,16,0,7,1556105554),(229,'8e0da95ba94e4757f3cc0f24bb0955069eb0f771','07:00',0,16,0,8,1556105554),(230,'23b3d29bb04eec144896f7f983b2f66611fe1435','08:00',0,16,0,9,1556105554),(231,'fd1f432dc313a02bcbcc9f405d8e9d121b01ba8d','09:00',0,16,0,10,1556105554),(232,'fffaba271c93a300f405a329f303686a9450bf5b','10:00',0,16,0,11,1556105554),(233,'a86f018536b8cb5896cdb631c8da8f10f0253fd9','11:00',0,16,0,12,1556105554),(234,'8d0a7e8844fd4b2eea8da19a39b81b048ce713d0','12:00',0,16,0,13,1556105554),(235,'22df1963ca47cc9ae5f0228f56ceeff467a2a280','13:00',0,16,0,14,1556105554),(236,'a03164eed7751779efd5d55464af6ae13fc4696e','14:00',0,16,0,15,1556105554),(237,'de1581726146cac70c29f0db6043eaa552da041f','15:00',0,16,0,16,1556105554),(238,'76ef341932f74678306044a0fa3e0105f5564492','16:00',0,16,0,17,1556105554),(239,'0db9ccf6183c19890acb33bc83c6167c7e941a5b','17:00',0,16,0,18,1556105554),(240,'e7951bd7de49615dc83491a195b47b61e82263bf','18:00',0,16,0,19,1556105554),(241,'70df85f9ac44cb7c7598b6ef28a50ddaa21d3937','19:00',0,16,0,20,1556105554),(242,'c60043f184d65a3101c6df21a087bbf99875a60b','20:00',0,16,0,21,1556105554),(243,'0837bbc4bf13fa667b3397def81d3a95a22f0739','21:00',0,16,0,22,1556105554),(244,'4f4c3308c188af2a2e08d59aecfaa2690fcf9981','22:00',0,16,0,23,1556105554),(245,'873f75be11e53b76dea6a438a97d3167d0aeb95c','23:00',0,16,0,24,1556105554),(246,'0a6697c2e0b67a404a645c2dd03f846e55afd981','i18n::object-monday',0,17,0,1,1556105554),(247,'4ba74364fd714bc12a8e8943cc6a36a26eaa36df','i18n::object-tuesday',0,17,0,2,1556105554),(248,'95b836e6799c016df64fdbab8d40d1c2b60173b3','i18n::object-wednesday',0,17,0,3,1556105554),(249,'a9bbb4de15c70fc416f13be9760ef33c3b2c6d67','i18n::object-thursday',0,17,0,4,1556105554),(250,'14a13a85a4e99c4f6c2fa9f42c4ff765e14415c3','i18n::object-friday',0,17,0,5,1556105555),(251,'bd7e2b0388c70b3ae4f64fe0bf5533f16e814704','i18n::object-saturday',0,17,0,6,1556105555),(252,'31586aa19a50a89a33e4d37a5d200671252fbd60','i18n::object-sunday',0,17,0,7,1556105555),(253,'emarket-paymenttype-27519','i18n::object-legal_bodies_account',1,46,0,6,1556105555),(279,'emarket-paymenttype-payanyway','i18n::object-payanyway',1,46,0,7,1556105555),(280,'emarket-paymenttype-dengionline','i18n::object-money_online',1,46,0,8,1556105555),(281,'emarket-orderstatus-editing','i18n::object-orderstatus-editing',1,45,0,8,1556105555),(296,'emarket-mobile-platform-27944','i18n::object-android',0,23,0,1,1556105555),(297,'emarket-mobile-platform-27945','i18n::object-ios',0,23,0,2,1556105555),(298,'emarket-order-payment-status-default','i18n::object-order-payment-status-default',1,48,0,5,1556105555),(299,'emarket-order-delivery-status-default','i18n::object-order-payment-status-default',1,52,0,4,1556105555),(300,'news-rss-charset-27949','i18n::object-windows_1251',0,6,0,1,1556105555),(301,'news-rss-charset-27950','i18n::object-utf_8',0,6,0,2,1556105555),(304,'emarket-paymenttype-paypal','i18n::object-paymenttype-paypal',1,46,0,12,1556105555),(305,'exchange-encoding-windows-1251','Windows-1251',0,26,0,1,1556105555),(306,'exchange-encoding-utf-8','UTF-8',0,26,0,2,1556105555),(307,'emarket-deliverytype-27958','i18n::object-type-apiship',1,50,0,4,1556105555),(308,'emarket-orderdeliverystatus-27959','i18n::object-otmenen',1,52,0,5,1556105555),(309,'emarket-orderdeliverystatus-27960','i18n::object-return',1,52,0,6,1556105555),(310,'country-AU','i18n::object-country-AU',1,10,0,3,1556105555),(311,'country-AT','i18n::object-country-AT',1,10,0,4,1556105555),(312,'country-AZ','i18n::object-country-AZ',1,10,0,5,1556105555),(313,'country-AX','i18n::object-country-AX',1,10,0,6,1556105555),(314,'country-AL','i18n::object-country-AL',1,10,0,7,1556105555),(315,'country-DZ','i18n::object-country-DZ',1,10,0,8,1556105555),(316,'country-AS','i18n::object-country-AS',1,10,0,9,1556105555),(317,'country-AI','i18n::object-country-AI',1,10,0,10,1556105555),(318,'country-AO','i18n::object-country-AO',1,10,0,11,1556105555),(319,'country-AD','i18n::object-country-AD',1,10,0,12,1556105555),(320,'country-AQ','i18n::object-country-AQ',1,10,0,13,1556105555),(321,'country-AG','i18n::object-country-AG',1,10,0,14,1556105555),(322,'country-AR','i18n::object-country-AR',1,10,0,15,1556105555),(323,'country-AM','i18n::object-country-AM',1,10,0,16,1556105555),(324,'country-AW','i18n::object-country-AW',1,10,0,17,1556105555),(325,'country-AF','i18n::object-country-AF',1,10,0,18,1556105555),(326,'country-BS','i18n::object-country-BS',1,10,0,19,1556105555),(327,'country-BD','i18n::object-country-BD',1,10,0,20,1556105555),(328,'country-BB','i18n::object-country-BB',1,10,0,21,1556105555),(329,'country-BH','i18n::object-country-BH',1,10,0,22,1556105555),(330,'country-BY','i18n::object-country-BY',1,10,0,23,1556105555),(331,'country-BZ','i18n::object-country-BZ',1,10,0,24,1556105555),(332,'country-BE','i18n::object-country-BE',1,10,0,25,1556105555),(333,'country-BJ','i18n::object-country-BJ',1,10,0,26,1556105555),(334,'country-BM','i18n::object-country-BM',1,10,0,27,1556105555),(335,'country-BG','i18n::object-country-BG',1,10,0,28,1556105555),(336,'country-BO','i18n::object-country-BO',1,10,0,29,1556105555),(337,'country-BQ','i18n::object-country-BQ',1,10,0,30,1556105555),(338,'country-BA','i18n::object-country-BA',1,10,0,31,1556105555),(339,'country-BW','i18n::object-country-BW',1,10,0,32,1556105555),(340,'country-BR','i18n::object-country-BR',1,10,0,33,1556105555),(341,'country-IO','i18n::object-country-IO',1,10,0,34,1556105555),(342,'country-BN','i18n::object-country-BN',1,10,0,35,1556105555),(343,'country-BF','i18n::object-country-BF',1,10,0,36,1556105555),(344,'country-BI','i18n::object-country-BI',1,10,0,37,1556105555),(345,'country-BT','i18n::object-country-BT',1,10,0,38,1556105555),(346,'country-VU','i18n::object-country-VU',1,10,0,39,1556105555),(347,'country-VA','i18n::object-country-VA',1,10,0,40,1556105555),(348,'country-GB','i18n::object-country-GB',1,10,0,41,1556105555),(349,'country-HU','i18n::object-country-HU',1,10,0,42,1556105555),(350,'country-VE','i18n::object-country-VE',1,10,0,43,1556105555),(351,'country-VG','i18n::object-country-VG',1,10,0,44,1556105555),(352,'country-VI','i18n::object-country-VI',1,10,0,45,1556105555),(353,'country-UM','i18n::object-country-UM',1,10,0,46,1556105555),(354,'country-TL','i18n::object-country-TL',1,10,0,47,1556105555),(355,'country-VN','i18n::object-country-VN',1,10,0,48,1556105555),(356,'country-GA','i18n::object-country-GA',1,10,0,49,1556105555),(357,'country-HT','i18n::object-country-HT',1,10,0,50,1556105555),(358,'country-GY','i18n::object-country-GY',1,10,0,51,1556105555),(359,'country-GM','i18n::object-country-GM',1,10,0,52,1556105555),(360,'country-GH','i18n::object-country-GH',1,10,0,53,1556105555),(361,'country-GP','i18n::object-country-GP',1,10,0,54,1556105555),(362,'country-GT','i18n::object-country-GT',1,10,0,55,1556105555),(363,'country-GN','i18n::object-country-GN',1,10,0,56,1556105555),(364,'country-GW','i18n::object-country-GW',1,10,0,57,1556105555),(365,'country-DE','i18n::object-country-DE',1,10,0,58,1556105555),(366,'country-GG','i18n::object-country-GG',1,10,0,59,1556105555),(367,'country-GI','i18n::object-country-GI',1,10,0,60,1556105555),(368,'country-HN','i18n::object-country-HN',1,10,0,61,1556105555),(369,'country-HK','i18n::object-country-HK',1,10,0,62,1556105556),(370,'country-GD','i18n::object-country-GD',1,10,0,63,1556105556),(371,'country-GL','i18n::object-country-GL',1,10,0,64,1556105556),(372,'country-GR','i18n::object-country-GR',1,10,0,65,1556105556),(373,'country-GE','i18n::object-country-GE',1,10,0,66,1556105556),(374,'country-GU','i18n::object-country-GU',1,10,0,67,1556105556),(375,'country-DK','i18n::object-country-DK',1,10,0,68,1556105556),(376,'country-JE','i18n::object-country-JE',1,10,0,69,1556105556),(377,'country-DJ','i18n::object-country-DJ',1,10,0,70,1556105556),(378,'country-DG','i18n::object-country-DG',1,10,0,71,1556105556),(379,'country-DM','i18n::object-country-DM',1,10,0,72,1556105556),(380,'country-DO','i18n::object-country-DO',1,10,0,73,1556105556),(381,'country-EG','i18n::object-country-EG',1,10,0,74,1556105556),(382,'country-ZM','i18n::object-country-ZM',1,10,0,75,1556105556),(383,'country-EH','i18n::object-country-EH',1,10,0,76,1556105556),(384,'country-ZW','i18n::object-country-ZW',1,10,0,77,1556105556),(385,'country-IL','i18n::object-country-IL',1,10,0,78,1556105556),(386,'country-IN','i18n::object-country-IN',1,10,0,79,1556105556),(387,'country-ID','i18n::object-country-ID',1,10,0,80,1556105556),(388,'country-JO','i18n::object-country-JO',1,10,0,81,1556105556),(389,'country-IQ','i18n::object-country-IQ',1,10,0,82,1556105556),(390,'country-IR','i18n::object-country-IR',1,10,0,83,1556105556),(391,'country-IE','i18n::object-country-IE',1,10,0,84,1556105556),(392,'country-IS','i18n::object-country-IS',1,10,0,85,1556105556),(393,'country-ES','i18n::object-country-ES',1,10,0,86,1556105556),(394,'country-IT','i18n::object-country-IT',1,10,0,87,1556105556),(395,'country-YE','i18n::object-country-YE',1,10,0,88,1556105556),(396,'country-CV','i18n::object-country-CV',1,10,0,89,1556105556),(397,'country-KZ','i18n::object-country-KZ',1,10,0,90,1556105556),(398,'country-KY','i18n::object-country-KY',1,10,0,91,1556105556),(399,'country-KH','i18n::object-country-KH',1,10,0,92,1556105556),(400,'country-CM','i18n::object-country-CM',1,10,0,93,1556105556),(401,'country-CA','i18n::object-country-CA',1,10,0,94,1556105556),(402,'country-IC','i18n::object-country-IC',1,10,0,95,1556105556),(403,'country-QA','i18n::object-country-QA',1,10,0,96,1556105556),(404,'country-KE','i18n::object-country-KE',1,10,0,97,1556105556),(405,'country-CY','i18n::object-country-CY',1,10,0,98,1556105556),(406,'country-KG','i18n::object-country-KG',1,10,0,99,1556105556),(407,'country-KI','i18n::object-country-KI',1,10,0,100,1556105556),(408,'country-CN','i18n::object-country-CN',1,10,0,101,1556105556),(409,'country-KP','i18n::object-country-KP',1,10,0,102,1556105556),(410,'country-CC','i18n::object-country-CC',1,10,0,103,1556105556),(411,'country-CO','i18n::object-country-CO',1,10,0,104,1556105556),(412,'country-KM','i18n::object-country-KM',1,10,0,105,1556105556),(413,'country-CG','i18n::object-country-CG',1,10,0,106,1556105556),(414,'country-CD','i18n::object-country-CD',1,10,0,107,1556105556),(415,'country-XK','i18n::object-country-XK',1,10,0,108,1556105556),(416,'country-CR','i18n::object-country-CR',1,10,0,109,1556105556),(417,'country-CI','i18n::object-country-CI',1,10,0,110,1556105556),(418,'country-CU','i18n::object-country-CU',1,10,0,111,1556105556),(419,'country-KW','i18n::object-country-KW',1,10,0,112,1556105556),(420,'country-CW','i18n::object-country-CW',1,10,0,113,1556105556),(421,'country-LA','i18n::object-country-LA',1,10,0,114,1556105556),(422,'country-LV','i18n::object-country-LV',1,10,0,115,1556105556),(423,'country-LS','i18n::object-country-LS',1,10,0,116,1556105556),(424,'country-LR','i18n::object-country-LR',1,10,0,117,1556105556),(425,'country-LB','i18n::object-country-LB',1,10,0,118,1556105556),(426,'country-LY','i18n::object-country-LY',1,10,0,119,1556105556),(427,'country-LT','i18n::object-country-LT',1,10,0,120,1556105556),(428,'country-LI','i18n::object-country-LI',1,10,0,121,1556105556),(429,'country-LU','i18n::object-country-LU',1,10,0,122,1556105556),(430,'country-MU','i18n::object-country-MU',1,10,0,123,1556105556),(431,'country-MR','i18n::object-country-MR',1,10,0,124,1556105556),(432,'country-MG','i18n::object-country-MG',1,10,0,125,1556105556),(433,'country-YT','i18n::object-country-YT',1,10,0,126,1556105556),(434,'country-MO','i18n::object-country-MO',1,10,0,127,1556105556),(435,'country-MK','i18n::object-country-MK',1,10,0,128,1556105556),(436,'country-MW','i18n::object-country-MW',1,10,0,129,1556105556),(437,'country-MY','i18n::object-country-MY',1,10,0,130,1556105556),(438,'country-ML','i18n::object-country-ML',1,10,0,131,1556105556),(439,'country-MV','i18n::object-country-MV',1,10,0,132,1556105556),(440,'country-MT','i18n::object-country-MT',1,10,0,133,1556105556),(441,'country-MA','i18n::object-country-MA',1,10,0,134,1556105556),(442,'country-MQ','i18n::object-country-MQ',1,10,0,135,1556105556),(443,'country-MH','i18n::object-country-MH',1,10,0,136,1556105556),(444,'country-MX','i18n::object-country-MX',1,10,0,137,1556105556),(445,'country-MZ','i18n::object-country-MZ',1,10,0,138,1556105556),(446,'country-MD','i18n::object-country-MD',1,10,0,139,1556105556),(447,'country-MC','i18n::object-country-MC',1,10,0,140,1556105556),(448,'country-MN','i18n::object-country-MN',1,10,0,141,1556105556),(449,'country-MS','i18n::object-country-MS',1,10,0,142,1556105556),(450,'country-MM','i18n::object-country-MM',1,10,0,143,1556105556),(451,'country-NA','i18n::object-country-NA',1,10,0,144,1556105556),(452,'country-NR','i18n::object-country-NR',1,10,0,145,1556105556),(453,'country-NP','i18n::object-country-NP',1,10,0,146,1556105556),(454,'country-NE','i18n::object-country-NE',1,10,0,147,1556105556),(455,'country-NG','i18n::object-country-NG',1,10,0,148,1556105556),(456,'country-NL','i18n::object-country-NL',1,10,0,149,1556105556),(457,'country-NI','i18n::object-country-NI',1,10,0,150,1556105556),(458,'country-NU','i18n::object-country-NU',1,10,0,151,1556105556),(459,'country-NZ','i18n::object-country-NZ',1,10,0,152,1556105556),(460,'country-NC','i18n::object-country-NC',1,10,0,153,1556105556),(461,'country-NO','i18n::object-country-NO',1,10,0,154,1556105556),(462,'country-AC','i18n::object-country-AC',1,10,0,155,1556105556),(463,'country-IM','i18n::object-country-IM',1,10,0,156,1556105556),(464,'country-NF','i18n::object-country-NF',1,10,0,157,1556105556),(465,'country-CX','i18n::object-country-CX',1,10,0,158,1556105556),(466,'country-SH','i18n::object-country-SH',1,10,0,159,1556105556),(467,'country-CK','i18n::object-country-CK',1,10,0,160,1556105556),(468,'country-TC','i18n::object-country-TC',1,10,0,161,1556105556),(469,'country-AE','i18n::object-country-AE',1,10,0,162,1556105556),(470,'country-OM','i18n::object-country-OM',1,10,0,163,1556105556),(471,'country-PK','i18n::object-country-PK',1,10,0,164,1556105556),(472,'country-PW','i18n::object-country-PW',1,10,0,165,1556105556),(473,'country-PS','i18n::object-country-PS',1,10,0,166,1556105556),(474,'country-PA','i18n::object-country-PA',1,10,0,167,1556105556),(475,'country-PG','i18n::object-country-PG',1,10,0,168,1556105556),(476,'country-PY','i18n::object-country-PY',1,10,0,169,1556105556),(477,'country-PE','i18n::object-country-PE',1,10,0,170,1556105556),(478,'country-PN','i18n::object-country-PN',1,10,0,171,1556105556),(479,'country-PL','i18n::object-country-PL',1,10,0,172,1556105556),(480,'country-PT','i18n::object-country-PT',1,10,0,173,1556105556),(481,'country-PR','i18n::object-country-PR',1,10,0,174,1556105556),(482,'country-KR','i18n::object-country-KR',1,10,0,175,1556105556),(483,'country-RE','i18n::object-country-RE',1,10,0,176,1556105556),(484,'country-RW','i18n::object-country-RW',1,10,0,177,1556105556),(485,'country-RO','i18n::object-country-RO',1,10,0,178,1556105556),(486,'country-SV','i18n::object-country-SV',1,10,0,179,1556105556),(487,'country-WS','i18n::object-country-WS',1,10,0,180,1556105556),(488,'country-SM','i18n::object-country-SM',1,10,0,181,1556105557),(489,'country-ST','i18n::object-country-ST',1,10,0,182,1556105557),(490,'country-SA','i18n::object-country-SA',1,10,0,183,1556105557),(491,'country-SZ','i18n::object-country-SZ',1,10,0,184,1556105557),(492,'country-MP','i18n::object-country-MP',1,10,0,185,1556105557),(493,'country-SC','i18n::object-country-SC',1,10,0,186,1556105557),(494,'country-BL','i18n::object-country-BL',1,10,0,187,1556105557),(495,'country-MF','i18n::object-country-MF',1,10,0,188,1556105557),(496,'country-PM','i18n::object-country-PM',1,10,0,189,1556105557),(497,'country-SN','i18n::object-country-SN',1,10,0,190,1556105557),(498,'country-VC','i18n::object-country-VC',1,10,0,191,1556105557),(499,'country-KN','i18n::object-country-KN',1,10,0,192,1556105557),(500,'country-LC','i18n::object-country-LC',1,10,0,193,1556105557),(501,'country-RS','i18n::object-country-RS',1,10,0,194,1556105557),(502,'country-EA','i18n::object-country-EA',1,10,0,195,1556105557),(503,'country-SG','i18n::object-country-SG',1,10,0,196,1556105557),(504,'country-SX','i18n::object-country-SX',1,10,0,197,1556105557),(505,'country-SY','i18n::object-country-SY',1,10,0,198,1556105557),(506,'country-SK','i18n::object-country-SK',1,10,0,199,1556105557),(507,'country-SI','i18n::object-country-SI',1,10,0,200,1556105557),(508,'country-SB','i18n::object-country-SB',1,10,0,201,1556105557),(509,'country-SO','i18n::object-country-SO',1,10,0,202,1556105557),(510,'country-SD','i18n::object-country-SD',1,10,0,203,1556105557),(511,'country-SR','i18n::object-country-SR',1,10,0,204,1556105557),(512,'country-SL','i18n::object-country-SL',1,10,0,205,1556105557),(513,'country-TJ','i18n::object-country-TJ',1,10,0,206,1556105557),(514,'country-TH','i18n::object-country-TH',1,10,0,207,1556105557),(515,'country-TW','i18n::object-country-TW',1,10,0,208,1556105557),(516,'country-TZ','i18n::object-country-TZ',1,10,0,209,1556105557),(517,'country-TG','i18n::object-country-TG',1,10,0,210,1556105557),(518,'country-TK','i18n::object-country-TK',1,10,0,211,1556105557),(519,'country-TO','i18n::object-country-TO',1,10,0,212,1556105557),(520,'country-TT','i18n::object-country-TT',1,10,0,213,1556105557),(521,'country-TA','i18n::object-country-TA',1,10,0,214,1556105557),(522,'country-TV','i18n::object-country-TV',1,10,0,215,1556105557),(523,'country-TN','i18n::object-country-TN',1,10,0,216,1556105557),(524,'country-TM','i18n::object-country-TM',1,10,0,217,1556105557),(525,'country-TR','i18n::object-country-TR',1,10,0,218,1556105557),(526,'country-UG','i18n::object-country-UG',1,10,0,219,1556105557),(527,'country-UZ','i18n::object-country-UZ',1,10,0,220,1556105557),(528,'country-UA','i18n::object-country-UA',1,10,0,221,1556105557),(529,'country-WF','i18n::object-country-WF',1,10,0,222,1556105557),(530,'country-UY','i18n::object-country-UY',1,10,0,223,1556105557),(531,'country-FO','i18n::object-country-FO',1,10,0,224,1556105557),(532,'country-FM','i18n::object-country-FM',1,10,0,225,1556105557),(533,'country-FJ','i18n::object-country-FJ',1,10,0,226,1556105557),(534,'country-PH','i18n::object-country-PH',1,10,0,227,1556105557),(535,'country-FI','i18n::object-country-FI',1,10,0,228,1556105557),(536,'country-FK','i18n::object-country-FK',1,10,0,229,1556105557),(537,'country-FR','i18n::object-country-FR',1,10,0,230,1556105557),(538,'country-GF','i18n::object-country-GF',1,10,0,231,1556105557),(539,'country-PF','i18n::object-country-PF',1,10,0,232,1556105557),(540,'country-TF','i18n::object-country-TF',1,10,0,233,1556105557),(541,'country-HR','i18n::object-country-HR',1,10,0,234,1556105557),(542,'country-CF','i18n::object-country-CF',1,10,0,235,1556105557),(543,'country-TD','i18n::object-country-TD',1,10,0,236,1556105557),(544,'country-ME','i18n::object-country-ME',1,10,0,237,1556105557),(545,'country-CZ','i18n::object-country-CZ',1,10,0,238,1556105557),(546,'country-CL','i18n::object-country-CL',1,10,0,239,1556105557),(547,'country-CH','i18n::object-country-CH',1,10,0,240,1556105557),(548,'country-SE','i18n::object-country-SE',1,10,0,241,1556105557),(549,'country-SJ','i18n::object-country-SJ',1,10,0,242,1556105557),(550,'country-LK','i18n::object-country-LK',1,10,0,243,1556105557),(551,'country-EC','i18n::object-country-EC',1,10,0,244,1556105557),(552,'country-GQ','i18n::object-country-GQ',1,10,0,245,1556105557),(553,'country-ER','i18n::object-country-ER',1,10,0,246,1556105557),(554,'country-EE','i18n::object-country-EE',1,10,0,247,1556105557),(555,'country-ET','i18n::object-country-ET',1,10,0,248,1556105557),(556,'country-ZA','i18n::object-country-ZA',1,10,0,249,1556105557),(557,'country-GS','i18n::object-country-GS',1,10,0,250,1556105557),(558,'country-SS','i18n::object-country-SS',1,10,0,251,1556105557),(559,'country-JM','i18n::object-country-JM',1,10,0,252,1556105557),(560,'country-JP','i18n::object-country-JP',1,10,0,253,1556105557),(561,'emarket-payment-type-yandex-kassa','i18n::object-payment-type-yandex-kassa',1,46,0,13,1556105557),(562,'emarket-item-type-custom','Пользовательский',1,41,0,3,1556105557),(563,'emarket-item-type-trade-offer','Торговое предложение',1,41,0,4,1556105557),(564,'25ec3f9da5444fe6a125910137ec28200d4eaaa8','i18n::object-status-publish',0,2,0,1,1556105557),(565,'tax-rate-27961','Без НДС',1,27,0,1,1601493865),(566,'russianpost_wrapper_simple','i18n::object-wrapper_simple',0,14,0,1,1556105557),(567,'payment-subject-28225','Товар',1,28,0,1,1556105557),(568,'payment-mode-28238','Полная предоплата',1,29,0,1,1556105557),(569,'8a6f804b3690f0592a3f17ed980a9df5f16bacd8','i18n::object-status-unpublish',0,2,0,2,1556105557),(570,'russianpost_registered_wrapper','i18n::object-registered_wrapper',0,14,0,2,1556105557),(571,'tax-rate-27962','НДС по ставке 0%',1,27,0,2,1601493865),(572,'payment-subject-28226','Подакцизный товар',1,28,0,2,1556105557),(573,'payment-mode-28239','Частичная предоплата',1,29,0,2,1556105557),(574,'f4df5d14f5a1aeeebfe3db75b73e57fef8bcc4f2','i18n::object-status-preunpublish',0,2,0,3,1556105557),(575,'russianpost_wrapper_with_declared_value','i18n::object-wrapper_with_declared_value',0,14,0,3,1556105557),(576,'tax-rate-27963','НДС по ставке 10%',1,27,0,3,1601493865),(577,'payment-subject-28227','Работа',1,28,0,3,1556105557),(578,'payment-mode-28240','Аванс',1,29,0,3,1556105557),(579,'russianpost_registered_wrapper_first_class','i18n::object-registered_wrapper_first_class',0,14,0,4,1556105557),(580,'tax-rate-27964','НДС по ставке 20%',1,27,0,4,1601493865),(581,'payment-subject-28228','Услуга',1,28,0,4,1556105557),(582,'payment-mode-28241','Полный расчет',1,29,0,4,1556105557),(583,'russianpost_wrapper_first_class_with_declared_value','i18n::object-wrapper_first_class_with_declared_value',0,14,0,5,1556105557),(584,'tax-rate-27965','НДС по расчетной ставке 10/110',1,27,0,5,1601493865),(585,'payment-subject-28229','Ставка в азартной игре',1,28,0,5,1556105557),(586,'payment-mode-28242','Частичный расчет и кредит',1,29,0,5,1556105557),(587,'tax-rate-27966','НДС  по расчетной ставке 20/120',1,27,0,6,1601493865),(588,'russianpost_parcel','i18n::object-parcel',0,14,0,6,1556105557),(589,'payment-subject-28230','Выигрыш в азартной игре',1,28,0,6,1556105557),(590,'payment-mode-28243','Кредит',1,29,0,6,1556105557),(591,'russianpost_parcel_with_declared_value','i18n::object-parcel_with_declared_value',0,14,0,7,1556105557),(592,'payment-subject-28231','Лотерейный билет',1,28,0,7,1556105557),(593,'payment-mode-28244','Выплата по кредиту',1,29,0,7,1556105557),(594,'russianpost_parcel_first_class','i18n::object-parcel_first_class',0,14,0,8,1556105557),(595,'payment-subject-28232','Выигрыш в лотерею',1,28,0,8,1556105557),(596,'russianpost_parcel_first_class_with_declared_value','i18n::object-parcel_first_class_with_declared_value',0,14,0,9,1556105557),(597,'payment-subject-28233','Результаты интеллектуальной деятельности',1,28,0,9,1556105557),(598,'russianpost_ems_standart','i18n::object-ems_standart',0,14,0,10,1556105558),(599,'payment-subject-28234','Платеж',1,28,0,10,1556105558),(600,'russianpost_ems_declared_value','i18n::object-ems_declared_value',0,14,0,11,1556105558),(601,'payment-subject-28235','Агентское вознаграждение',1,28,0,11,1556105558),(602,'payment-subject-28236','Несколько вариантов',1,28,0,12,1556105558),(603,'payment-subject-28237','i18n::object-social_categories_other',1,28,0,13,1556105558),(604,'emarket-discountmodificator-768-27135','i18n::object-test_percent_modifier',0,56,0,1,1556105558),(605,'emarket-discountrule-798-27438','i18n::object-users',0,57,0,1,1556105558),(606,'3fb6d39f5279c04f1bfec5a7cc13783a45d00141','i18n::object-commerceml_data_format',0,35,0,1,1556105558),(607,'2c4eff97ef278f12c4461309e84dd0627bd4a37b','i18n::object-umiDump_data_format',0,35,0,2,1556105558),(608,'23abbfa28d922d786d39218e3aa26719ad16ee47','i18n::object-csv_dataformat',0,35,0,3,1556105558),(609,'cdc4a1f4e0ee63b2359d3dec91efe33d2a296c92','i18n::object-umi_export_umiDump',0,35,0,4,1556105558),(610,'2ca45ca1c710cf65f451f098f4bf683082566200','i18n::object-commerceml_catalog',0,36,0,1,1556105558),(611,'681665ea8b72237d1677dfaf7339ef7a7ec40269','i18n::object-commerceml_offer_list',0,36,0,2,1556105558),(612,'8e9874cd7a1b20f4b00c95fd7126f2112101c2ac','i18n::object-commerceml_order_list',0,36,0,3,1556105558),(613,'ff6c38d4ab12cda6c035cf36a4afb829049fbf21','i18n::object-yml_catalog',0,36,0,4,1556105558),(614,'b8c554e9ce8127f2405c189857cfd6831dcc2f5d','i18n::object-umiDump_data_format',0,36,0,5,1556105558),(615,'de2d91f2111e74d1fab49ffed3220fc4b1d51d42','i18n::object-csv_dataformat',0,36,0,6,1556105558),(616,'ccc9bf34f683f8e4ecf2ffe2910f3d8cda2b6852','i18n::object-umi_export_umiDump',0,36,0,7,1556105558),(617,'exchange-export-commerceml','i18n::object-catalog_export',0,36,0,8,1556105558),(618,'system-guest','i18n::object-guest',1,54,0,2,1556115658),(619,'users-users-2374','i18n::object-zaregistrirovannye_pol_zovateli',1,39,0,2,1556105558),(620,'emarket-currency-27226','i18n::object-rur',0,21,0,1,1556105558),(621,'emarket-currency-27227','i18n::object-usd',0,21,0,2,1556105558),(622,'emarket-currency-27228','i18n::object-euro',0,21,0,3,1556105558),(623,'','Общие поля',0,99,182,1,1668115817),(624,'','Главная',0,103,182,2,1558626007),(625,'','i18n::object-type-blue',0,100,182,1,1556122536),(626,'','i18n::object-type-green',0,100,182,2,1556122548),(627,'','Оранжевый',0,100,182,3,1556122561),(628,'','Фиолетовый',0,100,182,4,1556122687),(629,'','i18n::object-type-red',0,100,182,5,1556122586),(630,'','Поделиться ВКонтакте',0,101,182,1,1557915290),(631,'','Поделиться в Одноклассниках',0,101,182,2,1557915327),(632,'','Поделиться в Моём мире',0,101,182,3,1557915348),(634,'','Поделиться в Twitter',0,101,182,5,1557915392),(635,'','Поделиться в LiveJournal',0,101,182,6,1557915409),(636,'','О нас',0,61,182,3,1558013645),(637,'','Контакты',0,73,182,4,1558529814),(638,'','Новости',0,7,182,5,1558081679),(639,'','Как подобрать подходящий самосвал?',0,60,182,6,1558098946),(640,'','Обновление парка спецтехники',0,60,182,7,1558098985),(641,'','Весеннее таяние цен',0,60,182,8,1558099009),(642,'','Скидка на аренду спецтехники на длительный срок',0,60,182,9,1558099036),(643,'','Аренда спецтехники',0,86,182,10,1558424540),(644,'','Аренда бульдозеров',0,86,182,11,1579615391),(645,'','Аренда самосвалов',0,86,182,12,1579615392),(646,'','Аренда автокранов',0,86,182,13,1579615392),(647,'','Аренда гидромолотов',0,86,182,14,1579615392),(648,'','Аренда вибропогружателей',0,86,182,15,1579615393),(649,'','Аренда экскаваторов',0,86,182,16,1579615393),(650,'','Аренда асфальтоукладчика',0,86,182,17,1579615393),(651,'','Аренда вездехода',0,86,182,18,1579615410),(652,'','Аренда бульдозера Komatsu D31E-20',0,87,182,19,1558699259),(653,'','Аренда бульдозера Komatsu D21A-7',0,87,182,20,1558425670),(654,'','Самосвал 18-20 кубов',0,87,182,21,1558699283),(655,'','Самосвал 10-12 кубов',0,87,182,22,1558699260),(656,'','Автокран 25 тонн КС-55713',0,87,182,23,1558699301),(657,'','Автокран 14-16 тонн КС-35715',0,87,182,24,1558699263),(658,'','Экскаватор-планировщик УДС 114',0,87,182,25,1558699274),(659,'','Экскаватор гусеничный с планировочным ковшом',0,87,182,26,1558699310),(660,'','Асфальтоукладчик Vogele 800',0,87,182,27,1558699267),(661,'','Асфальтоукладчик тротуарный Vogele 1300-2',0,87,182,28,1558513478),(662,'','Самосвал-вездеход ',0,87,182,29,1558699288),(663,'','Фото техники',0,77,182,30,1558099747),(664,'','Гидромолоты',0,77,182,31,1579615513),(665,'','Вибропогружатели',0,77,182,32,1579615514),(666,'','Гидромолот JCB',0,78,182,33,1558105777),(667,'','Гидромолот CAT',0,78,182,34,1558105854),(668,'','Гидромолот DOOSAN',0,78,182,35,1558105909),(669,'','Вибропогружатель JCB',0,78,182,36,1558106042),(670,'','Вибропогружатель VOLVO',0,78,182,37,1558106177),(671,'','Вибропогружатель HITACHI',0,78,182,38,1558106213),(722,'','Гидромолот С3ПО',0,87,182,45,1558699530),(723,'','Вибропогружатель Р2Д2',0,87,182,46,1558699559),(727,'','Администратор',0,76,182,1,1558532027),(728,'','Администратор',0,102,182,1,1558534252),(729,'','Обратная связь',0,75,182,1,1558598234),(730,'','Администратор',0,102,182,2,1558596268),(731,'','Администратор',0,102,182,3,1558598156),(732,'','Администратор',0,102,182,4,1558598183),(733,'','Администратор',0,102,182,5,1558598211),(734,'','Администратор',0,102,182,6,1558598256),(735,'','Администратор',0,102,182,7,1558598313),(743,'','Администратор',0,102,182,8,1558607571),(744,'','Администратор',0,102,182,9,1558607930),(745,'','Администратор',0,102,618,10,1558611802),(746,'','Администратор',0,102,618,11,1558611936),(747,'','Администратор',0,102,618,12,1558613091),(748,'','Администратор',0,102,618,13,1558613125),(749,'','Администратор',0,102,618,14,1558613159),(750,'','Администратор',0,102,618,15,1558613177),(751,'emarket-order-payment-status-waiting','i18n::object-order-payment-status-waiting',1,48,0,6,1600695377),(752,'emarket-order-payment-status-refund','i18n::object-order-payment-status-refund',1,48,0,7,1600695377),(753,'emarket-discountruletype-28247','i18n::object-promocode_discount',0,33,0,8,1605528368),(754,'exchange-export-yandex-turbo-pages','i18n::object-yandex-turbo-pages',0,36,0,9,1678708792);
/*!40000 ALTER TABLE `cms3_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_objects_expiration`
--

DROP TABLE IF EXISTS `cms3_objects_expiration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_objects_expiration` (
  `obj_id` int(10) unsigned NOT NULL,
  `entrytime` int(10) unsigned NOT NULL,
  `expire` int(10) unsigned NOT NULL,
  PRIMARY KEY (`obj_id`),
  KEY `FK_ObjectsExpire to objects` (`obj_id`),
  KEY `entrytime` (`entrytime`,`expire`),
  CONSTRAINT `FK_ObjectsExpire to objects` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_objects_expiration`
--

LOCK TABLES `cms3_objects_expiration` WRITE;
/*!40000 ALTER TABLE `cms3_objects_expiration` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_objects_expiration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_offer_list`
--

DROP TABLE IF EXISTS `cms3_offer_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_offer_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `vendor_code` varchar(255) DEFAULT NULL,
  `bar_code` varchar(255) DEFAULT NULL,
  `total_count` bigint(20) unsigned DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `order` bigint(20) unsigned DEFAULT '0',
  `weight` bigint(20) unsigned DEFAULT '0',
  `width` bigint(20) unsigned DEFAULT '0',
  `length` bigint(20) unsigned DEFAULT '0',
  `height` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `offer to type id` (`type_id`),
  KEY `offer to data object id` (`data_object_id`),
  CONSTRAINT `offer to data object id` FOREIGN KEY (`data_object_id`) REFERENCES `cms3_objects` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `offer to type id` FOREIGN KEY (`type_id`) REFERENCES `cms3_object_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_offer_list`
--

LOCK TABLES `cms3_offer_list` WRITE;
/*!40000 ALTER TABLE `cms3_offer_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_offer_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_offer_price_list`
--

DROP TABLE IF EXISTS `cms3_offer_price_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_offer_price_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` double unsigned NOT NULL,
  `offer_id` int(10) unsigned NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `is_main` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `offer price to offer` (`offer_id`),
  KEY `offer price to currency` (`currency_id`),
  KEY `offer price to type` (`type_id`),
  CONSTRAINT `offer price to currency` FOREIGN KEY (`currency_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `offer price to offer` FOREIGN KEY (`offer_id`) REFERENCES `cms3_offer_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `offer price to type` FOREIGN KEY (`type_id`) REFERENCES `cms3_offer_price_type_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_offer_price_list`
--

LOCK TABLES `cms3_offer_price_list` WRITE;
/*!40000 ALTER TABLE `cms3_offer_price_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_offer_price_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_offer_price_type_list`
--

DROP TABLE IF EXISTS `cms3_offer_price_type_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_offer_price_type_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_offer_price_type_list`
--

LOCK TABLES `cms3_offer_price_type_list` WRITE;
/*!40000 ALTER TABLE `cms3_offer_price_type_list` DISABLE KEYS */;
INSERT INTO `cms3_offer_price_type_list` VALUES (1,'default','Основная',1);
/*!40000 ALTER TABLE `cms3_offer_price_type_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_permissions`
--

DROP TABLE IF EXISTS `cms3_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_permissions` (
  `level` tinyint(4) DEFAULT NULL,
  `owner_id` int(10) unsigned DEFAULT NULL,
  `rel_id` int(10) unsigned DEFAULT NULL,
  KEY `owner reference_FK` (`owner_id`),
  KEY `rel reference_FK` (`rel_id`),
  KEY `level` (`level`),
  CONSTRAINT `FK_owner reference` FOREIGN KEY (`owner_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_rel reference` FOREIGN KEY (`rel_id`) REFERENCES `cms3_hierarchy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_permissions`
--

LOCK TABLES `cms3_permissions` WRITE;
/*!40000 ALTER TABLE `cms3_permissions` DISABLE KEYS */;
INSERT INTO `cms3_permissions` VALUES (1,618,2),(1,618,4),(1,618,5),(1,618,6),(1,618,7),(1,618,8),(1,618,29),(1,618,30),(1,618,31),(1,618,32),(1,618,33),(1,618,34),(1,618,35),(1,618,36),(1,618,37),(1,618,9),(1,618,10),(1,618,11),(1,618,12),(1,618,13),(1,618,14),(1,618,15),(1,618,16),(1,618,17),(1,618,18),(1,618,19),(1,618,20),(1,618,21),(1,618,22),(1,618,23),(1,618,24),(1,618,25),(1,618,26),(1,618,27),(1,618,28),(1,618,3),(1,618,1),(1,618,87),(1,618,88);
/*!40000 ALTER TABLE `cms3_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_push_message_list`
--

DROP TABLE IF EXISTS `cms3_push_message_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_push_message_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `click_action` varchar(255) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `is_send` tinyint(1) DEFAULT '0',
  `publish_time` int(11) unsigned DEFAULT NULL,
  `expiration_time` int(11) unsigned DEFAULT NULL,
  `send_time` int(11) unsigned DEFAULT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  `lang_id` int(10) unsigned NOT NULL,
  `topic_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms3_push_message_list domain_id` (`domain_id`),
  KEY `cms3_push_message_list lang_id` (`lang_id`),
  KEY `cms3_push_message_list topic_id` (`topic_id`),
  CONSTRAINT `cms3_push_message_list domain_id` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_push_message_list lang_id` FOREIGN KEY (`lang_id`) REFERENCES `cms3_langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_push_message_list topic_id` FOREIGN KEY (`topic_id`) REFERENCES `cms3_push_topic_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_push_message_list`
--

LOCK TABLES `cms3_push_message_list` WRITE;
/*!40000 ALTER TABLE `cms3_push_message_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_push_message_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_push_subscriber_list`
--

DROP TABLE IF EXISTS `cms3_push_subscriber_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_push_subscriber_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `domain_id` int(10) unsigned DEFAULT NULL,
  `lang_id` int(10) unsigned DEFAULT NULL,
  `topic_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `cms3_push_subscriber_list user_id` (`user_id`),
  KEY `cms3_push_subscriber_list domain_id` (`domain_id`),
  KEY `cms3_push_subscriber_list lang_id` (`lang_id`),
  KEY `cms3_push_subscriber_list topic_id` (`topic_id`),
  CONSTRAINT `cms3_push_subscriber_list domain_id` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_push_subscriber_list lang_id` FOREIGN KEY (`lang_id`) REFERENCES `cms3_langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_push_subscriber_list topic_id` FOREIGN KEY (`topic_id`) REFERENCES `cms3_push_topic_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_push_subscriber_list user_id` FOREIGN KEY (`user_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_push_subscriber_list`
--

LOCK TABLES `cms3_push_subscriber_list` WRITE;
/*!40000 ALTER TABLE `cms3_push_subscriber_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_push_subscriber_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_push_topic_list`
--

DROP TABLE IF EXISTS `cms3_push_topic_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_push_topic_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `is_locked` tinyint(1) DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  `lang_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `cms3_push_topic_list domain_id` (`domain_id`),
  KEY `cms3_push_topic_list lang_id` (`lang_id`),
  CONSTRAINT `cms3_push_topic_list domain_id` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_push_topic_list lang_id` FOREIGN KEY (`lang_id`) REFERENCES `cms3_langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_push_topic_list`
--

LOCK TABLES `cms3_push_topic_list` WRITE;
/*!40000 ALTER TABLE `cms3_push_topic_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_push_topic_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_redirects`
--

DROP TABLE IF EXISTS `cms3_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` text NOT NULL,
  `target` text NOT NULL,
  `status` int(10) unsigned DEFAULT '301',
  `made_by_user` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `source` (`source`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_redirects`
--

LOCK TABLES `cms3_redirects` WRITE;
/*!40000 ALTER TABLE `cms3_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_response_error_entry_list`
--

DROP TABLE IF EXISTS `cms3_response_error_entry_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_response_error_entry_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` text NOT NULL,
  `code` int(10) unsigned NOT NULL,
  `hits_count` int(10) unsigned DEFAULT '0',
  `domain_id` int(10) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms3_response_error_entry_list order by hits count` (`hits_count`),
  KEY `cms3_response_error_entry_list order by update time` (`update_time`),
  KEY `cms3_response_error_entry_list domain_id` (`domain_id`),
  CONSTRAINT `cms3_response_error_entry_list domain_id` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_response_error_entry_list`
--

LOCK TABLES `cms3_response_error_entry_list` WRITE;
/*!40000 ALTER TABLE `cms3_response_error_entry_list` DISABLE KEYS */;
INSERT INTO `cms3_response_error_entry_list` VALUES (1,'/styles/common/js/jquery/fancyboxquery/fancybox/fancybox_sprite.png',404,1,1,1579614880),(2,'/js/cms/wysiwyg/tinymce47/tinymce_custom.js',404,2,1,1579615098);
/*!40000 ALTER TABLE `cms3_response_error_entry_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_search`
--

DROP TABLE IF EXISTS `cms3_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_search` (
  `rel_id` int(10) unsigned NOT NULL,
  `indextime` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `domain_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rel_id`),
  KEY `lang_id + domain_id + type_id_FK` (`lang_id`,`domain_id`,`type_id`),
  KEY `domain_id` (`domain_id`,`type_id`),
  KEY `indextime` (`indextime`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_search`
--

LOCK TABLES `cms3_search` WRITE;
/*!40000 ALTER TABLE `cms3_search` DISABLE KEYS */;
INSERT INTO `cms3_search` VALUES (1,1678957982,1,1,30),(2,1678957982,1,1,30),(3,1678957982,1,1,42),(4,1678957982,1,1,1),(5,1678957982,1,1,29),(6,1678957982,1,1,29),(7,1678957982,1,1,29),(8,1678957982,1,1,29),(9,1678957982,1,1,55),(10,1678957982,1,1,55),(11,1678957982,1,1,55),(12,1678957982,1,1,55),(13,1678957982,1,1,55),(14,1678957982,1,1,55),(15,1678957982,1,1,55),(16,1678957983,1,1,55),(17,1678957983,1,1,55),(18,1678957983,1,1,56),(19,1678957983,1,1,56),(20,1678957983,1,1,56),(21,1678957983,1,1,56),(22,1678957983,1,1,56),(23,1678957983,1,1,56),(24,1678957983,1,1,56),(25,1678957983,1,1,56),(26,1678957983,1,1,56),(27,1678957983,1,1,56),(28,1678957983,1,1,56),(29,1678957983,1,1,46),(30,1678957983,1,1,46),(31,1678957983,1,1,46),(32,1678957983,1,1,47),(33,1678957983,1,1,47),(34,1678957983,1,1,47),(35,1678957983,1,1,47),(36,1678957983,1,1,47),(37,1678957983,1,1,47),(87,1678957983,1,1,56),(88,1678957983,1,1,56);
/*!40000 ALTER TABLE `cms3_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_search_index`
--

DROP TABLE IF EXISTS `cms3_search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_search_index` (
  `rel_id` int(10) unsigned DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `word_id` int(10) unsigned DEFAULT NULL,
  `tf` float DEFAULT NULL,
  KEY `pages to index_FK` (`rel_id`),
  KEY `word index_FK` (`word_id`),
  KEY `weight` (`weight`),
  KEY `tf` (`tf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_search_index`
--

LOCK TABLES `cms3_search_index` WRITE;
/*!40000 ALTER TABLE `cms3_search_index` DISABLE KEYS */;
INSERT INTO `cms3_search_index` VALUES (1,19,1,0.131944),(1,19,2,0.131944),(1,19,3,0.131944),(1,10,4,0.0694444),(1,10,5,0.0694444),(1,3,6,0.0208333),(1,3,7,0.0208333),(1,3,8,0.0208333),(1,3,9,0.0208333),(1,3,10,0.0208333),(1,3,11,0.0208333),(1,3,12,0.0208333),(1,3,13,0.0208333),(1,3,14,0.0208333),(1,3,15,0.0208333),(1,3,16,0.0208333),(1,5,17,0.0347222),(2,18,7,0.193548),(2,1,18,0.0107527),(2,1,19,0.0107527),(2,1,20,0.0107527),(2,2,21,0.0215054),(2,1,22,0.0107527),(2,1,23,0.0107527),(2,1,24,0.0107527),(2,1,25,0.0107527),(2,1,26,0.0107527),(2,1,27,0.0107527),(2,1,28,0.0107527),(2,4,29,0.0430108),(2,1,30,0.0107527),(2,1,31,0.0107527),(2,1,32,0.0107527),(2,2,33,0.0215054),(2,2,34,0.0215054),(2,2,35,0.0215054),(2,1,36,0.0107527),(2,1,37,0.0107527),(2,1,38,0.0107527),(2,1,39,0.0107527),(2,1,40,0.0107527),(2,1,41,0.0107527),(2,1,42,0.0107527),(2,1,43,0.0107527),(2,1,44,0.0107527),(2,1,45,0.0107527),(2,1,46,0.0107527),(2,1,47,0.0107527),(2,1,48,0.0107527),(2,1,49,0.0107527),(2,1,50,0.0107527),(3,21,51,0.107692),(3,8,50,0.0410256),(3,17,5,0.0871795),(3,9,52,0.0461538),(3,9,53,0.0461538),(3,1,54,0.00512821),(3,1,55,0.00512821),(3,1,56,0.00512821),(3,3,57,0.0153846),(3,3,58,0.0153846),(3,1,59,0.00512821),(3,1,60,0.00512821),(3,1,61,0.00512821),(3,1,62,0.00512821),(3,1,63,0.00512821),(3,3,64,0.0153846),(3,3,65,0.0153846),(3,3,66,0.0153846),(3,3,67,0.0153846),(3,3,68,0.0153846),(4,5,69,0.192308),(4,16,70,0.615385),(5,10,71,0.0952381),(5,10,72,0.0952381),(5,10,73,0.0952381),(5,11,74,0.104762),(5,1,75,0.00952381),(5,1,76,0.00952381),(5,1,77,0.00952381),(5,1,78,0.00952381),(5,1,79,0.00952381),(5,1,80,0.00952381),(5,1,81,0.00952381),(5,1,82,0.00952381),(5,1,83,0.00952381),(5,1,84,0.00952381),(5,1,85,0.00952381),(5,1,86,0.00952381),(5,1,87,0.00952381),(5,1,88,0.00952381),(5,1,89,0.00952381),(5,1,90,0.00952381),(5,1,91,0.00952381),(5,1,92,0.00952381),(5,1,93,0.00952381),(5,1,94,0.00952381),(5,1,95,0.00952381),(5,1,96,0.00952381),(5,1,97,0.00952381),(5,1,98,0.00952381),(5,2,99,0.0190476),(5,1,100,0.00952381),(5,1,101,0.00952381),(5,1,102,0.00952381),(5,1,103,0.00952381),(5,1,104,0.00952381),(5,1,105,0.00952381),(5,1,106,0.00952381),(5,1,107,0.00952381),(5,1,108,0.00952381),(5,1,109,0.00952381),(5,1,110,0.00952381),(6,10,111,0.11236),(6,10,112,0.11236),(6,10,2,0.11236),(6,1,113,0.011236),(6,1,7,0.011236),(6,1,114,0.011236),(6,2,115,0.0224719),(6,1,67,0.011236),(6,1,116,0.011236),(6,1,117,0.011236),(6,1,118,0.011236),(6,1,119,0.011236),(6,1,120,0.011236),(6,1,121,0.011236),(6,1,122,0.011236),(6,1,93,0.011236),(6,1,94,0.011236),(6,1,123,0.011236),(6,1,124,0.011236),(6,1,15,0.011236),(6,1,125,0.011236),(6,1,126,0.011236),(6,1,46,0.011236),(6,1,127,0.011236),(6,1,128,0.011236),(6,1,129,0.011236),(6,1,130,0.011236),(6,1,131,0.011236),(6,1,132,0.011236),(6,1,104,0.011236),(6,1,133,0.011236),(6,1,134,0.011236),(6,1,135,0.011236),(6,1,136,0.011236),(6,1,137,0.011236),(6,1,105,0.011236),(6,1,138,0.011236),(6,1,9,0.011236),(6,1,139,0.011236),(6,1,140,0.011236),(6,1,141,0.011236),(7,10,142,0.0909091),(7,10,143,0.0909091),(7,10,144,0.0909091),(7,2,145,0.0181818),(7,3,146,0.0272727),(7,2,104,0.0181818),(7,1,147,0.00909091),(7,3,2,0.0272727),(7,1,148,0.00909091),(7,1,29,0.00909091),(7,1,149,0.00909091),(7,1,55,0.00909091),(7,1,15,0.00909091),(7,1,150,0.00909091),(7,1,151,0.00909091),(7,1,16,0.00909091),(7,1,152,0.00909091),(7,1,153,0.00909091),(7,1,154,0.00909091),(7,1,130,0.00909091),(7,1,155,0.00909091),(7,1,156,0.00909091),(7,1,157,0.00909091),(7,1,27,0.00909091),(7,1,158,0.00909091),(7,1,159,0.00909091),(7,1,67,0.00909091),(7,2,116,0.0181818),(7,1,160,0.00909091),(7,1,161,0.00909091),(7,1,162,0.00909091),(7,1,77,0.00909091),(7,1,163,0.00909091),(7,1,125,0.00909091),(7,1,164,0.00909091),(7,1,165,0.00909091),(7,1,166,0.00909091),(7,1,167,0.00909091),(7,1,46,0.00909091),(7,1,168,0.00909091),(8,11,169,0.0859375),(8,12,104,0.09375),(8,11,2,0.0859375),(8,10,170,0.078125),(8,11,164,0.0859375),(8,1,171,0.0078125),(8,1,172,0.0078125),(8,1,15,0.0078125),(8,1,173,0.0078125),(8,1,174,0.0078125),(8,1,35,0.0078125),(8,1,105,0.0078125),(8,1,175,0.0078125),(8,1,9,0.0078125),(8,2,176,0.015625),(8,1,177,0.0078125),(8,1,178,0.0078125),(8,1,99,0.0078125),(8,1,146,0.0078125),(8,1,179,0.0078125),(8,1,180,0.0078125),(8,1,125,0.0078125),(8,1,181,0.0078125),(8,1,182,0.0078125),(8,1,183,0.0078125),(8,1,8,0.0078125),(8,1,20,0.0078125),(8,1,184,0.0078125),(8,1,22,0.0078125),(8,1,185,0.0078125),(8,1,167,0.0078125),(8,1,46,0.0078125),(8,1,116,0.0078125),(8,1,168,0.0078125),(9,17,1,0.0693878),(9,22,2,0.0897959),(9,11,3,0.044898),(9,6,159,0.0244898),(9,10,15,0.0408163),(9,5,16,0.0204082),(9,11,5,0.044898),(9,5,186,0.0204082),(9,5,187,0.0204082),(9,3,188,0.0122449),(9,5,125,0.0204082),(9,3,6,0.0122449),(9,4,50,0.0163265),(9,3,189,0.0122449),(9,3,64,0.0122449),(9,3,190,0.0122449),(9,3,191,0.0122449),(9,3,38,0.0122449),(9,3,39,0.0122449),(9,1,29,0.00408163),(9,1,192,0.00408163),(9,1,193,0.00408163),(9,1,194,0.00408163),(9,1,195,0.00408163),(9,1,196,0.00408163),(9,1,105,0.00408163),(9,1,197,0.00408163),(9,1,93,0.00408163),(9,1,94,0.00408163),(9,1,198,0.00408163),(9,1,199,0.00408163),(9,1,200,0.00408163),(9,1,201,0.00408163),(9,1,65,0.00408163),(9,1,66,0.00408163),(9,1,119,0.00408163),(9,1,202,0.00408163),(9,1,203,0.00408163),(9,1,204,0.00408163),(9,1,205,0.00408163),(9,1,104,0.00408163),(9,1,206,0.00408163),(9,1,4,0.00408163),(9,2,207,0.00816326),(9,2,208,0.00816326),(9,1,209,0.00408163),(9,1,210,0.00408163),(9,2,27,0.00816326),(9,1,67,0.00408163),(9,1,116,0.00408163),(9,1,211,0.00408163),(9,1,212,0.00408163),(9,1,213,0.00408163),(9,1,214,0.00408163),(9,1,215,0.00408163),(9,2,176,0.00816326),(9,1,216,0.00408163),(9,1,217,0.00408163),(9,1,218,0.00408163),(9,1,82,0.00408163),(9,1,219,0.00408163),(9,1,220,0.00408163),(9,1,221,0.00408163),(9,1,222,0.00408163),(9,1,223,0.00408163),(9,1,130,0.00408163),(9,1,224,0.00408163),(9,1,225,0.00408163),(9,1,226,0.00408163),(9,1,132,0.00408163),(9,1,110,0.00408163),(9,1,99,0.00408163),(9,1,72,0.00408163),(9,1,227,0.00408163),(9,1,228,0.00408163),(9,1,229,0.00408163),(10,25,1,0.147929),(10,15,230,0.0887574),(10,11,3,0.0650888),(10,5,159,0.0295858),(10,8,50,0.0473373),(10,5,5,0.0295858),(10,11,231,0.0650888),(10,6,6,0.035503),(10,3,232,0.0177515),(10,3,233,0.0177515),(10,3,234,0.0177515),(10,3,125,0.0177515),(10,3,235,0.0177515),(10,3,68,0.0177515),(10,3,27,0.0177515),(10,1,236,0.00591716),(10,1,237,0.00591716),(10,1,238,0.00591716),(10,1,239,0.00591716),(10,1,240,0.00591716),(10,1,196,0.00591716),(10,1,241,0.00591716),(10,1,99,0.00591716),(10,1,242,0.00591716),(10,1,135,0.00591716),(10,1,243,0.00591716),(10,1,105,0.00591716),(10,1,79,0.00591716),(10,1,56,0.00591716),(10,1,244,0.00591716),(10,1,245,0.00591716),(10,1,200,0.00591716),(10,1,201,0.00591716),(10,1,246,0.00591716),(10,1,247,0.00591716),(10,1,248,0.00591716),(10,1,249,0.00591716),(10,1,250,0.00591716),(10,1,65,0.00591716),(10,1,66,0.00591716),(10,1,64,0.00591716),(10,1,251,0.00591716),(10,1,38,0.00591716),(10,1,39,0.00591716),(11,22,1,0.128655),(11,15,252,0.0877193),(11,14,3,0.0818713),(11,11,6,0.0643275),(11,5,159,0.0292398),(11,8,5,0.0467836),(11,10,85,0.0584795),(11,3,104,0.0175439),(11,3,253,0.0175439),(11,3,254,0.0175439),(11,3,4,0.0175439),(11,3,234,0.0175439),(11,3,125,0.0175439),(11,3,235,0.0175439),(11,3,68,0.0175439),(11,1,161,0.00584795),(11,1,255,0.00584795),(11,1,256,0.00584795),(11,1,257,0.00584795),(11,1,258,0.00584795),(11,1,259,0.00584795),(11,1,239,0.00584795),(11,1,260,0.00584795),(11,1,261,0.00584795),(11,1,262,0.00584795),(11,1,263,0.00584795),(11,1,264,0.00584795),(11,1,99,0.00584795),(11,1,265,0.00584795),(11,1,266,0.00584795),(11,1,74,0.00584795),(11,2,15,0.0116959),(11,1,267,0.00584795),(11,1,268,0.00584795),(11,1,269,0.00584795),(11,1,270,0.00584795),(11,1,271,0.00584795),(11,1,65,0.00584795),(11,1,66,0.00584795),(11,1,64,0.00584795),(11,1,272,0.00584795),(11,1,273,0.00584795),(11,1,274,0.00584795),(11,1,38,0.00584795),(11,1,39,0.00584795),(12,25,1,0.145349),(12,15,275,0.0872093),(12,11,3,0.0639535),(12,11,6,0.0639535),(12,5,159,0.0290698),(12,8,5,0.0465116),(12,10,133,0.0581395),(12,3,50,0.0174419),(12,3,276,0.0174419),(12,3,277,0.0174419),(12,3,104,0.0174419),(12,3,253,0.0174419),(12,3,234,0.0174419),(12,3,235,0.0174419),(12,3,68,0.0174419),(12,1,77,0.00581395),(12,1,278,0.00581395),(12,1,279,0.00581395),(12,1,280,0.00581395),(12,1,94,0.00581395),(12,1,281,0.00581395),(12,1,282,0.00581395),(12,1,283,0.00581395),(12,1,284,0.00581395),(12,1,285,0.00581395),(12,1,286,0.00581395),(12,1,287,0.00581395),(12,1,264,0.00581395),(12,1,161,0.00581395),(12,1,236,0.00581395),(12,1,237,0.00581395),(12,1,238,0.00581395),(12,1,288,0.00581395),(12,1,55,0.00581395),(12,1,65,0.00581395),(12,1,66,0.00581395),(12,1,289,0.00581395),(12,1,202,0.00581395),(12,1,290,0.00581395),(12,1,291,0.00581395),(13,24,1,0.190476),(13,14,292,0.111111),(13,11,3,0.0873016),(13,11,6,0.0873016),(13,5,159,0.0396825),(13,8,5,0.0634921),(13,10,293,0.0793651),(13,3,294,0.0238095),(13,3,161,0.0238095),(13,3,4,0.0238095),(13,3,254,0.0238095),(13,3,14,0.0238095),(13,3,104,0.0238095),(13,3,253,0.0238095),(14,24,1,0.2),(14,14,295,0.116667),(14,11,3,0.0916667),(14,11,6,0.0916667),(14,5,159,0.0416667),(14,8,5,0.0666667),(14,10,296,0.0833333),(14,3,161,0.025),(14,3,233,0.025),(14,3,232,0.025),(14,3,234,0.025),(14,3,50,0.025),(15,25,1,0.146199),(15,15,297,0.0877193),(15,14,3,0.0818713),(15,11,6,0.0643275),(15,5,159,0.0292398),(15,8,5,0.0467836),(15,10,298,0.0584795),(15,4,161,0.0233918),(15,3,233,0.0175439),(15,3,232,0.0175439),(15,4,82,0.0233918),(15,3,192,0.0175439),(15,3,299,0.0175439),(15,3,50,0.0175439),(15,1,29,0.00584795),(15,1,300,0.00584795),(15,1,301,0.00584795),(15,1,302,0.00584795),(15,1,303,0.00584795),(15,1,236,0.00584795),(15,1,304,0.00584795),(15,1,305,0.00584795),(15,1,16,0.00584795),(15,1,67,0.00584795),(15,1,116,0.00584795),(15,1,306,0.00584795),(15,1,307,0.00584795),(15,1,308,0.00584795),(15,1,309,0.00584795),(15,1,310,0.00584795),(15,1,311,0.00584795),(15,1,312,0.00584795),(15,1,313,0.00584795),(15,1,314,0.00584795),(15,1,99,0.00584795),(15,1,315,0.00584795),(15,1,316,0.00584795),(15,1,317,0.00584795),(15,1,238,0.00584795),(15,1,108,0.00584795),(16,24,1,0.139535),(16,25,318,0.145349),(16,11,3,0.0639535),(16,11,6,0.0639535),(16,5,159,0.0290698),(16,8,5,0.0465116),(16,4,50,0.0232558),(16,3,319,0.0174419),(16,3,160,0.0174419),(16,3,104,0.0174419),(16,3,161,0.0174419),(16,1,105,0.00581395),(16,2,99,0.0116279),(16,1,320,0.00581395),(16,1,321,0.00581395),(16,1,322,0.00581395),(16,1,323,0.00581395),(16,1,324,0.00581395),(16,1,325,0.00581395),(16,1,260,0.00581395),(16,1,326,0.00581395),(16,1,327,0.00581395),(16,1,27,0.00581395),(16,1,289,0.00581395),(16,1,9,0.00581395),(16,1,328,0.00581395),(16,1,329,0.00581395),(16,1,330,0.00581395),(16,1,331,0.00581395),(16,1,332,0.00581395),(16,1,333,0.00581395),(16,1,334,0.00581395),(16,1,65,0.00581395),(16,1,66,0.00581395),(16,1,64,0.00581395),(16,1,273,0.00581395),(16,1,335,0.00581395),(16,1,336,0.00581395),(16,1,337,0.00581395),(16,1,38,0.00581395),(16,1,39,0.00581395),(17,24,1,0.162162),(17,24,338,0.162162),(17,11,3,0.0743243),(17,11,6,0.0743243),(17,5,159,0.0337838),(17,8,5,0.0540541),(17,3,161,0.0202703),(17,3,339,0.0202703),(17,3,19,0.0202703),(17,1,340,0.00675676),(17,1,341,0.00675676),(17,1,342,0.00675676),(17,2,343,0.0135135),(17,1,344,0.00675676),(17,1,345,0.00675676),(17,1,346,0.00675676),(17,1,347,0.00675676),(17,1,348,0.00675676),(17,1,207,0.00675676),(17,1,349,0.00675676),(17,1,350,0.00675676),(17,1,264,0.00675676),(17,1,351,0.00675676),(17,1,352,0.00675676),(17,1,65,0.00675676),(17,1,66,0.00675676),(17,1,64,0.00675676),(17,1,273,0.00675676),(17,1,335,0.00675676),(17,1,336,0.00675676),(17,1,353,0.00675676),(17,1,354,0.00675676),(17,1,114,0.00675676),(17,1,67,0.00675676),(17,1,116,0.00675676),(18,10,1,0.25),(18,10,231,0.25),(18,10,355,0.25),(18,10,356,0.25),(19,19,1,0.184466),(19,19,231,0.184466),(19,19,355,0.184466),(19,19,357,0.184466),(19,6,3,0.0582524),(19,3,161,0.0291262),(19,3,136,0.0291262),(19,3,102,0.0291262),(19,3,6,0.0291262),(20,14,1,0.110236),(20,14,85,0.110236),(20,24,358,0.188976),(20,15,359,0.11811),(20,11,3,0.0866142),(20,5,5,0.0393701),(20,10,74,0.0787402),(20,6,6,0.0472441),(20,3,161,0.023622),(20,3,136,0.023622),(21,14,1,0.0985916),(21,21,74,0.147887),(21,24,360,0.169014),(21,24,359,0.169014),(21,14,3,0.0985916),(21,5,5,0.0352113),(21,6,6,0.0422535),(21,3,85,0.0211268),(21,3,161,0.0211268),(21,3,136,0.0211268),(22,14,1,0.0909091),(22,11,133,0.0714286),(22,24,361,0.155844),(22,24,362,0.155844),(22,11,3,0.0714286),(22,5,5,0.0324675),(22,13,139,0.0844156),(22,6,6,0.038961),(22,3,161,0.0194805),(22,3,136,0.0194805),(23,14,1,0.089172),(23,14,133,0.089172),(23,24,363,0.152866),(23,24,361,0.152866),(23,24,364,0.152866),(23,11,3,0.0700637),(23,5,5,0.0318471),(23,10,139,0.0636943),(23,6,6,0.0382166),(23,3,161,0.0191083),(23,3,136,0.0191083),(24,14,1,0.112),(24,14,85,0.112),(24,14,365,0.112),(24,21,366,0.168),(24,21,367,0.168),(24,8,5,0.064),(24,10,368,0.08),(24,3,50,0.024),(24,3,3,0.024),(24,3,6,0.024),(24,3,136,0.024),(25,11,1,0.0748299),(25,14,298,0.0952381),(25,14,369,0.0952381),(25,18,370,0.122449),(25,21,371,0.142857),(25,8,5,0.0544218),(25,10,372,0.0680272),(25,10,333,0.0680272),(25,3,373,0.0204082),(25,3,374,0.0204082),(25,3,50,0.0204082),(25,3,136,0.0204082),(26,11,1,0.0990991),(26,14,318,0.126126),(26,24,375,0.216216),(26,21,376,0.189189),(26,8,5,0.0720721),(26,10,332,0.0900901),(26,3,373,0.027027),(26,3,253,0.027027),(26,3,161,0.027027),(26,3,50,0.027027),(27,14,1,0.103704),(27,14,318,0.103704),(27,14,377,0.103704),(27,24,375,0.177778),(27,21,378,0.155556),(27,8,5,0.0592593),(27,10,332,0.0740741),(27,10,331,0.0740741),(27,3,253,0.0222222),(27,3,161,0.0222222),(27,3,50,0.0222222),(28,14,1,0.130841),(28,11,379,0.102804),(28,11,3,0.102804),(28,8,5,0.0747664),(28,10,380,0.0934579),(28,3,85,0.0280374),(28,3,338,0.0280374),(28,6,6,0.0560748),(28,3,50,0.0280374),(28,3,161,0.0280374),(28,3,136,0.0280374),(29,8,381,0.1),(29,5,50,0.0625),(29,11,5,0.1375),(29,13,382,0.1625),(29,10,80,0.125),(29,3,383,0.0375),(29,3,39,0.0375),(29,3,27,0.0375),(29,3,2,0.0375),(29,3,64,0.0375),(29,3,65,0.0375),(29,3,66,0.0375),(29,3,68,0.0375),(30,10,384,1),(31,10,385,1),(32,10,386,0.5),(32,10,387,0.5),(33,10,386,0.5),(33,10,388,0.5),(34,10,386,0.5),(34,10,389,0.5),(35,10,390,0.5),(35,10,387,0.5),(36,10,390,0.5),(36,10,391,0.5),(37,10,390,0.5),(37,10,392,0.5),(87,14,1,0.111111),(87,14,292,0.111111),(87,11,3,0.0873016),(87,11,6,0.0873016),(87,5,159,0.0396825),(87,8,5,0.0634921),(87,10,386,0.0793651),(87,10,393,0.0793651),(87,3,294,0.0238095),(87,3,161,0.0238095),(87,3,4,0.0238095),(87,3,254,0.0238095),(87,3,14,0.0238095),(87,3,104,0.0238095),(87,3,253,0.0238095),(88,14,1,0.116667),(88,14,295,0.116667),(88,11,3,0.0916667),(88,11,6,0.0916667),(88,5,159,0.0416667),(88,8,5,0.0666667),(88,10,390,0.0833333),(88,10,394,0.0833333),(88,3,161,0.025),(88,3,233,0.025),(88,3,232,0.025),(88,3,234,0.025),(88,3,50,0.025);
/*!40000 ALTER TABLE `cms3_search_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_search_index_words`
--

DROP TABLE IF EXISTS `cms3_search_index_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_search_index_words` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `word` (`word`)
) ENGINE=InnoDB AUTO_INCREMENT=395 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_search_index_words`
--

LOCK TABLES `cms3_search_index_words` WRITE;
/*!40000 ALTER TABLE `cms3_search_index_words` DISABLE KEYS */;
INSERT INTO `cms3_search_index_words` VALUES (360,'10-12'),(34,'100'),(41,'1000'),(367,'114'),(378,'1300-2'),(363,'14-16'),(358,'18-20'),(134,'2000'),(21,'2008'),(32,'2010'),(40,'2015'),(47,'2018'),(184,'2020'),(58,'274-78-78'),(225,'8-888-88-88'),(376,'800'),(57,'812'),(388,'cat'),(357,'d21a-7'),(356,'d31e-20'),(389,'doosan'),(62,'email'),(392,'hitachi'),(63,'infotest@ast.com'),(387,'jcb'),(355,'komatsu'),(29,'mdash'),(60,'skype'),(61,'support'),(375,'vogele'),(391,'volvo'),(139,'автокран'),(133,'автокрана'),(275,'автокранов'),(115,'автокраны'),(43,'автопарк'),(39,'автопарка'),(116,'автопарке'),(291,'автопарком'),(334,'автоукладчик'),(52,'адрес'),(1,'аренда'),(9,'арендовать'),(104,'аренду'),(125,'аренды'),(191,'ассортимент'),(325,'асфальт'),(332,'асфальтоукладчик'),(318,'асфальтоукладчика'),(337,'асфальтоукладчиках'),(328,'асфальтоукладчики'),(260,'без'),(247,'большие'),(121,'больший'),(12,'бульдозер'),(231,'бульдозера'),(230,'бульдозеров'),(251,'бульдозеры'),(75,'важные'),(99,'вам'),(245,'вами'),(106,'вас'),(344,'ваша'),(238,'ваши'),(228,'ваших'),(340,'вездеход'),(338,'вездехода'),(353,'вездеходах'),(142,'весеннее'),(148,'весна'),(25,'вехи'),(181,'взять'),(296,'вибропогружателей'),(385,'вибропогружатели'),(390,'вибропогружатель'),(295,'вибропогружателя'),(182,'внушительной'),(299,'возможно'),(257,'возможностью'),(282,'возникает'),(108,'вопросы'),(23,'вот'),(55,'время'),(82,'все'),(157,'всей'),(152,'всем'),(336,'всех'),(158,'вся'),(179,'второго'),(311,'выбирайте'),(103,'выбирать'),(84,'выбора'),(78,'выборе'),(270,'вывоза'),(194,'выгоднее'),(140,'выгодной'),(92,'выполнения'),(120,'выполнять'),(219,'вышеперечисленное'),(386,'гидромолот'),(292,'гидромолота'),(293,'гидромолотов'),(384,'гидромолоты'),(17,'главная'),(22,'года'),(286,'грузов'),(271,'грунта'),(369,'гусеничного'),(333,'гусеничный'),(123,'данный'),(145,'дарим'),(30,'дата'),(259,'денежные'),(48,'десятилетний'),(83,'детали'),(170,'длительный'),(15,'для'),(165,'дня'),(54,'добрая'),(249,'довольно'),(294,'договору'),(222,'документально'),(322,'дороги'),(374,'доступна'),(126,'доступно'),(13,'другую'),(105,'если'),(114,'есть'),(86,'зависит'),(136,'звоните'),(236,'значительно'),(36,'значительное'),(323,'или'),(273,'информацию'),(71,'как'),(100,'каким'),(263,'каких'),(188,'каталог'),(262,'качества'),(90,'качество'),(153,'клиентам'),(35,'клиентов'),(128,'клиенту'),(371,'ковшом'),(343,'когда'),(167,'количество'),(50,'компании'),(19,'компанию'),(4,'компания'),(227,'конкретно'),(51,'контакты'),(204,'которую'),(313,'который'),(11,'кран'),(364,'кс-35715'),(362,'кс-55713'),(359,'кубов'),(212,'лет'),(308,'лучшие'),(147,'любой'),(155,'марта'),(279,'масштабных'),(97,'материал'),(46,'машин'),(156,'мая'),(348,'месте'),(180,'месяца'),(177,'месяцев'),(242,'миллионов'),(88,'многое'),(285,'многотонных'),(220,'можем'),(265,'может'),(289,'можете'),(8,'можно'),(124,'момент'),(76,'моменты'),(64,'найдете'),(130,'нам'),(193,'намного'),(89,'например'),(7,'нас'),(44,'насчитывает'),(346,'находится'),(150,'начала'),(42,'наш'),(206,'наша'),(38,'нашего'),(27,'нашей'),(67,'нашем'),(186,'наши'),(290,'нашим'),(173,'наших'),(215,'нашу'),(6,'недорого'),(351,'необходим'),(218,'неполадки'),(250,'нерациональны'),(151,'нового'),(70,'новости'),(20,'ноября'),(229,'нужд'),(283,'нужда'),(111,'обновление'),(335,'обо'),(241,'обойдется'),(327,'обойтись'),(154,'обратившимся'),(339,'обращайтесь'),(168,'ограничено'),(202,'ознакомиться'),(161,'оператором'),(233,'оплата'),(18,'основали'),(31,'основания'),(201,'основе'),(24,'основные'),(107,'остались'),(199,'осуществляется'),(317,'ответим'),(300,'отличное'),(256,'отличной'),(214,'отправляем'),(87,'очень'),(112,'парка'),(127,'первому'),(33,'первые'),(267,'перевозки'),(284,'перемещении'),(370,'планировочным'),(365,'планировщика'),(175,'планируете'),(72,'подобрать'),(98,'подскажет'),(221,'подтвердить'),(314,'подходит'),(73,'подходящий'),(129,'позвонившему'),(223,'позвоните'),(196,'покупка'),(272,'полную'),(190,'полный'),(110,'поможем'),(349,'поможет'),(326,'помощи'),(118,'помощью'),(37,'пополнение'),(381,'портфолио'),(166,'поспешите'),(213,'постоянно'),(200,'постоянной'),(174,'постоянных'),(253,'посуточно'),(261,'потери'),(266,'потребоваться'),(232,'почасовая'),(117,'появились'),(205,'предлагает'),(172,'предложение'),(178,'предоставим'),(162,'предоставляем'),(254,'предоставляет'),(160,'предоставляется'),(198,'предприятии'),(306,'представлены'),(276,'представляем'),(210,'преимущества'),(171,'прекрасное'),(77,'при'),(341,'пригодится'),(101,'признакам'),(352,'прицеп'),(197,'проведение'),(269,'продуктов'),(244,'производятся'),(305,'процесс'),(394,'р2д2'),(94,'работ'),(56,'работы'),(109,'радостью'),(26,'развития'),(66,'разделе'),(330,'разновидностей'),(81,'рассказываем'),(301,'решение'),(45,'ровно'),(135,'рублей'),(310,'рынке'),(393,'с3по'),(68,'сайте'),(149,'самое'),(74,'самосвал'),(380,'самосвал-вездеход'),(85,'самосвала'),(379,'самосвала-вездехода'),(274,'самосвалах'),(252,'самосвалов'),(216,'своевременно'),(288,'силы'),(342,'ситуации'),(169,'скидка'),(183,'скидкой'),(146,'скидку'),(137,'скорее'),(91,'скорость'),(329,'следующих'),(264,'случаях'),(119,'сможете'),(131,'снизим'),(278,'совершении'),(243,'согласитесь'),(3,'спб'),(122,'спект'),(159,'спецтехника'),(2,'спецтехники'),(203,'спецтехникой'),(176,'спецтехнику'),(185,'спешите'),(240,'среднем'),(239,'средства'),(164,'срок'),(255,'станет'),(211,'старше'),(69,'статьи'),(141,'стоимости'),(132,'стоимость'),(102,'стоит'),(280,'строительно-монтажных'),(79,'строительной'),(10,'строительный'),(93,'строительных'),(16,'строительства'),(321,'строить'),(345,'стройплощадка'),(5,'стройтех'),(277,'стройтехнику'),(268,'сухих'),(237,'сэкономит'),(258,'сэкономить'),(207,'также'),(246,'такие'),(287,'таких'),(302,'такой'),(143,'таяние'),(53,'телефон'),(224,'телефону'),(113,'теперь'),(350,'тех'),(319,'техника'),(80,'техники'),(303,'техникой'),(14,'технику'),(315,'техническим'),(307,'только'),(361,'тонн'),(312,'тот'),(248,'траты'),(320,'требуется'),(377,'тротуарного'),(331,'тротуарный'),(347,'труднодоступном'),(189,'тут'),(366,'удс'),(208,'узнать'),(324,'укладывать'),(304,'ускорите'),(163,'условии'),(234,'условия'),(187,'услуги'),(217,'устраняем'),(95,'участке'),(59,'факс'),(28,'фирмы'),(382,'фото'),(383,'фотографии'),(316,'характеристикам'),(138,'хотите'),(144,'цен'),(209,'цены'),(281,'часто'),(195,'чем'),(235,'читайте'),(354,'что'),(226,'чтобы'),(372,'экскаватор'),(368,'экскаватор-планировщик'),(298,'экскаватора'),(297,'экскаваторов'),(309,'экскаваторы'),(192,'это'),(65,'этом'),(96,'этот'),(49,'юбилей'),(373,'﻿аренда');
/*!40000 ALTER TABLE `cms3_search_index_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_sliders`
--

DROP TABLE IF EXISTS `cms3_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_sliders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `domain_id` int(11) unsigned NOT NULL,
  `language_id` int(11) unsigned NOT NULL,
  `sliding_speed` int(11) unsigned DEFAULT NULL,
  `sliding_delay` int(11) unsigned DEFAULT NULL,
  `sliding_loop_enable` tinyint(1) DEFAULT '0',
  `sliding_auto_play_enable` tinyint(1) DEFAULT '0',
  `sliders_random_order_enable` tinyint(1) DEFAULT '0',
  `slides_count` int(11) unsigned DEFAULT '0',
  `custom_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id from domains` (`domain_id`),
  KEY `id from languages` (`language_id`),
  CONSTRAINT `id from domains` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id from languages` FOREIGN KEY (`language_id`) REFERENCES `cms3_langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_sliders`
--

LOCK TABLES `cms3_sliders` WRITE;
/*!40000 ALTER TABLE `cms3_sliders` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_slides`
--

DROP TABLE IF EXISTS `cms3_slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_slides` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slider_id` int(11) unsigned NOT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `title` varchar(1024) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `text` mediumtext,
  `link` varchar(1024) DEFAULT NULL,
  `open_in_new_tab` tinyint(1) DEFAULT '1',
  `order` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `slider_id and is_active with order` (`slider_id`,`is_active`,`order`),
  CONSTRAINT `id from sliders` FOREIGN KEY (`slider_id`) REFERENCES `cms3_sliders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_slides`
--

LOCK TABLES `cms3_slides` WRITE;
/*!40000 ALTER TABLE `cms3_slides` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_stock_balance_list`
--

DROP TABLE IF EXISTS `cms3_stock_balance_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_stock_balance_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` int(10) unsigned NOT NULL,
  `stock_id` int(10) unsigned NOT NULL,
  `value` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `stock balance to offer` (`offer_id`),
  KEY `stock balance to stock` (`stock_id`),
  CONSTRAINT `stock balance to offer` FOREIGN KEY (`offer_id`) REFERENCES `cms3_offer_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock balance to stock` FOREIGN KEY (`stock_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_stock_balance_list`
--

LOCK TABLES `cms3_stock_balance_list` WRITE;
/*!40000 ALTER TABLE `cms3_stock_balance_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_stock_balance_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_templates`
--

DROP TABLE IF EXISTS `cms3_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms3_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `filename` varchar(64) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `domain_id` int(10) unsigned DEFAULT NULL,
  `lang_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Template - Lang_FK` (`lang_id`),
  KEY `Templates - domains_FK` (`domain_id`),
  KEY `is_default` (`is_default`),
  KEY `filename` (`filename`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_templates`
--

LOCK TABLES `cms3_templates` WRITE;
/*!40000 ALTER TABLE `cms3_templates` DISABLE KEYS */;
INSERT INTO `cms3_templates` VALUES (1,'demotractor','common.phtml','php',1,1,'Demotractor',1);
/*!40000 ALTER TABLE `cms3_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_backup`
--

DROP TABLE IF EXISTS `cms_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_backup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` int(11) DEFAULT NULL,
  `changed_module` varchar(128) DEFAULT NULL,
  `changed_method` varchar(128) DEFAULT NULL,
  `param` text,
  `param0` mediumtext,
  `user_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_backup`
--

LOCK TABLES `cms_backup` WRITE;
/*!40000 ALTER TABLE `cms_backup` DISABLE KEYS */;
INSERT INTO `cms_backup` VALUES (1,1579615392,'catalog','editValue','10','a:28:{s:4:\"path\";s:44:\"YWRtaW4vY29udGVudC9lZGl0VmFsdWUvc2F2ZS5qc29u\";s:17:\"umi_authorization\";s:0:\"\";s:10:\"element-id\";s:4:\"MTA=\";s:2:\"qt\";s:20:\"MTU3OTYxNTM5MTc0NA==\";s:10:\"field-name\";s:20:\"Y2F0ZWdvcnlfaW1hZ2U=\";s:5:\"value\";s:40:\"L2ltYWdlcy9jbXMvZGF0YS9jYXRhbG9nXzMuanBn\";s:4:\"csrf\";s:44:\"Y2Y3NGIyNjVkM2JiNmM3ZTgzNGU2NGUwNDIwNzc1NWI=\";s:7:\"_ym_uid\";s:28:\"MTU1OTY1MDM0NDg4MTAyODM4MA==\";s:5:\"_ym_d\";s:16:\"MTU3NzM2MTI3Mw==\";s:3:\"dbl\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:7:\"fco2r34\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:11:\"customer-id\";s:12:\"ei9NSzJBPT0=\";s:5:\"ilang\";s:4:\"cnU=\";s:17:\"control-domain-id\";s:4:\"MQ==\";s:21:\"eip-panel-state-first\";s:4:\"WQ==\";s:8:\"skin_sel\";s:8:\"bW9kZXJu\";s:14:\"umicms_session\";s:4:\"MQ==\";s:15:\"adminer_version\";s:8:\"NC43LjU=\";s:8:\"_ym_isad\";s:4:\"Mg==\";s:9:\"PHPSESSID\";s:44:\"MjIxNzEyNDE4ZTY3NWNkN2U3YzU2ZDkwOWY3MzcwYWI=\";s:20:\"expandExtendedFields\";s:4:\"MQ==\";s:16:\"eip-editor-state\";s:12:\"ZW5hYmxlZA==\";s:8:\"pre_lang\";s:0:\"\";s:6:\"param0\";s:8:\"c2F2ZQ==\";s:4:\"name\";s:48:\"0JDRgNC10L3QtNCwINCx0YPQu9GM0LTQvtC30LXRgNC+0LI=\";s:8:\"alt-name\";s:24:\"YXJlbmRhLWJ1bGRvemVyb3Y=\";s:6:\"active\";s:4:\"MQ==\";s:4:\"data\";a:1:{i:644;a:19:{s:5:\"title\";s:109:\"Аренда бульдозеров в СПб - спецтехника от компании Стройтех\";s:2:\"h1\";s:35:\"Аренда бульдозеров\";s:13:\"meta_keywords\";s:92:\"аренда бульдозера спб, аренда бульдозера недорого\";s:17:\"meta_descriptions\";s:182:\"Аренда бульдозера в СПб недорого, почасовая оплата, условия аренды читайте на сайте нашей компании.\";s:4:\"tags\";s:0:\"\";s:11:\"robots_deny\";s:1:\"0\";s:12:\"show_submenu\";s:1:\"0\";s:11:\"is_expanded\";s:1:\"0\";s:12:\"is_unindexed\";s:1:\"0\";s:5:\"descr\";s:624:\"<p>Аренда бульдозера значительно сэкономит ваши средства. В&nbsp;среднем, покупка бульдозера обойдется вам в&nbsp;8&nbsp;миллионов рублей. Согласитесь, если строительной работы не&nbsp;производятся вами на&nbsp;постоянной основе, то&nbsp;такие большие траты довольно нерациональны.</p>\r\n<p>В&nbsp;этом разделе вы&nbsp;найдете бульдозеры из&nbsp;нашего автопарка.</p>\";s:14:\"category_image\";s:0:\"\";s:11:\"rate_voters\";s:0:\"\";s:8:\"rate_sum\";s:0:\"\";s:8:\"lockuser\";s:0:\"\";s:12:\"index_source\";s:0:\"\";s:11:\"index_state\";s:0:\"\";s:12:\"index_choose\";s:1:\"0\";s:11:\"index_level\";s:0:\"\";s:18:\"additional_content\";s:0:\"\";}}}',182,1),(2,1579615392,'catalog','editValue','11','a:28:{s:4:\"path\";s:44:\"YWRtaW4vY29udGVudC9lZGl0VmFsdWUvc2F2ZS5qc29u\";s:17:\"umi_authorization\";s:0:\"\";s:10:\"element-id\";s:4:\"MTE=\";s:2:\"qt\";s:20:\"MTU3OTYxNTM5MjMwMw==\";s:10:\"field-name\";s:20:\"Y2F0ZWdvcnlfaW1hZ2U=\";s:5:\"value\";s:40:\"L2ltYWdlcy9jbXMvZGF0YS9jYXRhbG9nXzIuanBn\";s:4:\"csrf\";s:44:\"Y2Y3NGIyNjVkM2JiNmM3ZTgzNGU2NGUwNDIwNzc1NWI=\";s:7:\"_ym_uid\";s:28:\"MTU1OTY1MDM0NDg4MTAyODM4MA==\";s:5:\"_ym_d\";s:16:\"MTU3NzM2MTI3Mw==\";s:3:\"dbl\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:7:\"fco2r34\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:11:\"customer-id\";s:12:\"ei9NSzJBPT0=\";s:5:\"ilang\";s:4:\"cnU=\";s:17:\"control-domain-id\";s:4:\"MQ==\";s:21:\"eip-panel-state-first\";s:4:\"WQ==\";s:8:\"skin_sel\";s:8:\"bW9kZXJu\";s:14:\"umicms_session\";s:4:\"MQ==\";s:15:\"adminer_version\";s:8:\"NC43LjU=\";s:8:\"_ym_isad\";s:4:\"Mg==\";s:9:\"PHPSESSID\";s:44:\"MjIxNzEyNDE4ZTY3NWNkN2U3YzU2ZDkwOWY3MzcwYWI=\";s:20:\"expandExtendedFields\";s:4:\"MQ==\";s:16:\"eip-editor-state\";s:12:\"ZW5hYmxlZA==\";s:8:\"pre_lang\";s:0:\"\";s:6:\"param0\";s:8:\"c2F2ZQ==\";s:4:\"name\";s:44:\"0JDRgNC10L3QtNCwINGB0LDQvNC+0YHQstCw0LvQvtCy\";s:8:\"alt-name\";s:24:\"YXJlbmRhLXNhbW9zdmFsb3Y=\";s:6:\"active\";s:4:\"MQ==\";s:4:\"data\";a:1:{i:645;a:19:{s:5:\"title\";s:102:\"Аренда самосвалов в СПб недорого - спецтехника Стройтех\";s:2:\"h1\";s:33:\"Аренда самосвалов\";s:13:\"meta_keywords\";s:95:\"аренда самосвала спб недорого, аренда самосвала спб\";s:17:\"meta_descriptions\";s:199:\"Аренду самосвала в СПБ недорого посуточно предоставляет компания СтройТех, условия аренды читайте на сайте.\";s:4:\"tags\";s:0:\"\";s:11:\"robots_deny\";s:1:\"0\";s:12:\"show_submenu\";s:1:\"0\";s:11:\"is_expanded\";s:1:\"0\";s:12:\"is_unindexed\";s:1:\"0\";s:5:\"descr\";s:615:\"<p>Аренда самосвала с&nbsp;оператором станет отличной возможностью сэкономить денежные средства без потери качества.</p>\r\n<p>В&nbsp;каких случаях вам может потребоваться самосвал:</p>\r\n<ul>\r\n<li>Для перевозки сухих продуктов.</li>\r\n<li>Для вывоза грунта.</li>\r\n</ul>\r\n<p>В&nbsp;этом разделе вы&nbsp;найдете полную информацию о&nbsp;самосвалах из&nbsp;нашего автопарка.</p>\";s:14:\"category_image\";s:0:\"\";s:11:\"rate_voters\";s:0:\"\";s:8:\"rate_sum\";s:0:\"\";s:8:\"lockuser\";s:0:\"\";s:12:\"index_source\";s:0:\"\";s:11:\"index_state\";s:0:\"\";s:12:\"index_choose\";s:1:\"0\";s:11:\"index_level\";s:0:\"\";s:18:\"additional_content\";s:0:\"\";}}}',182,1),(3,1579615392,'catalog','editValue','12','a:28:{s:4:\"path\";s:44:\"YWRtaW4vY29udGVudC9lZGl0VmFsdWUvc2F2ZS5qc29u\";s:17:\"umi_authorization\";s:0:\"\";s:10:\"element-id\";s:4:\"MTI=\";s:2:\"qt\";s:20:\"MTU3OTYxNTM5MjUxNQ==\";s:10:\"field-name\";s:20:\"Y2F0ZWdvcnlfaW1hZ2U=\";s:5:\"value\";s:40:\"L2ltYWdlcy9jbXMvZGF0YS9jYXRhbG9nXzEuanBn\";s:4:\"csrf\";s:44:\"Y2Y3NGIyNjVkM2JiNmM3ZTgzNGU2NGUwNDIwNzc1NWI=\";s:7:\"_ym_uid\";s:28:\"MTU1OTY1MDM0NDg4MTAyODM4MA==\";s:5:\"_ym_d\";s:16:\"MTU3NzM2MTI3Mw==\";s:3:\"dbl\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:7:\"fco2r34\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:11:\"customer-id\";s:12:\"ei9NSzJBPT0=\";s:5:\"ilang\";s:4:\"cnU=\";s:17:\"control-domain-id\";s:4:\"MQ==\";s:21:\"eip-panel-state-first\";s:4:\"WQ==\";s:8:\"skin_sel\";s:8:\"bW9kZXJu\";s:14:\"umicms_session\";s:4:\"MQ==\";s:15:\"adminer_version\";s:8:\"NC43LjU=\";s:8:\"_ym_isad\";s:4:\"Mg==\";s:9:\"PHPSESSID\";s:44:\"MjIxNzEyNDE4ZTY3NWNkN2U3YzU2ZDkwOWY3MzcwYWI=\";s:20:\"expandExtendedFields\";s:4:\"MQ==\";s:16:\"eip-editor-state\";s:12:\"ZW5hYmxlZA==\";s:8:\"pre_lang\";s:0:\"\";s:6:\"param0\";s:8:\"c2F2ZQ==\";s:4:\"name\";s:44:\"0JDRgNC10L3QtNCwINCw0LLRgtC+0LrRgNCw0L3QvtCy\";s:8:\"alt-name\";s:24:\"YXJlbmRhLWF2dG9rcmFub3Y=\";s:6:\"active\";s:4:\"MQ==\";s:4:\"data\";a:1:{i:646;a:19:{s:5:\"title\";s:102:\"Аренда автокранов в СПб недорого - спецтехника Стройтех\";s:2:\"h1\";s:33:\"Аренда автокранов\";s:13:\"meta_keywords\";s:88:\"аренда автокрана спб, аренда автокрана недорого\";s:17:\"meta_descriptions\";s:235:\"Аренда автокрана в СПб недорого - в компании СтройТех мы представляем стройтехнику в аренду посуточно, условия читайте на сайте.\";s:4:\"tags\";s:0:\"\";s:11:\"robots_deny\";s:1:\"0\";s:12:\"show_submenu\";s:1:\"0\";s:11:\"is_expanded\";s:1:\"0\";s:12:\"is_unindexed\";s:1:\"0\";s:5:\"descr\";s:486:\"<p>При совершении масштабных строительно-монтажных работ часто возникает нужда в перемещении многотонных грузов. В таких случаях аренда автокрана с оператором значительно сэкономит ваши силы и время.</p>\r\n<p>В этом разделе вы можете ознакомиться с нашим автопарком.</p>\";s:14:\"category_image\";s:0:\"\";s:11:\"rate_voters\";s:0:\"\";s:8:\"rate_sum\";s:0:\"\";s:8:\"lockuser\";s:0:\"\";s:12:\"index_source\";s:0:\"\";s:11:\"index_state\";s:0:\"\";s:12:\"index_choose\";s:1:\"0\";s:11:\"index_level\";s:0:\"\";s:18:\"additional_content\";s:0:\"\";}}}',182,1),(4,1579615392,'catalog','editValue','13','a:28:{s:4:\"path\";s:44:\"YWRtaW4vY29udGVudC9lZGl0VmFsdWUvc2F2ZS5qc29u\";s:17:\"umi_authorization\";s:0:\"\";s:10:\"element-id\";s:4:\"MTM=\";s:2:\"qt\";s:20:\"MTU3OTYxNTM5Mjc0Mw==\";s:10:\"field-name\";s:20:\"Y2F0ZWdvcnlfaW1hZ2U=\";s:5:\"value\";s:44:\"L2ltYWdlcy9jbXMvZGF0YS9oeWRyb2hhbW1lci5qcGc=\";s:4:\"csrf\";s:44:\"Y2Y3NGIyNjVkM2JiNmM3ZTgzNGU2NGUwNDIwNzc1NWI=\";s:7:\"_ym_uid\";s:28:\"MTU1OTY1MDM0NDg4MTAyODM4MA==\";s:5:\"_ym_d\";s:16:\"MTU3NzM2MTI3Mw==\";s:3:\"dbl\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:7:\"fco2r34\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:11:\"customer-id\";s:12:\"ei9NSzJBPT0=\";s:5:\"ilang\";s:4:\"cnU=\";s:17:\"control-domain-id\";s:4:\"MQ==\";s:21:\"eip-panel-state-first\";s:4:\"WQ==\";s:8:\"skin_sel\";s:8:\"bW9kZXJu\";s:14:\"umicms_session\";s:4:\"MQ==\";s:15:\"adminer_version\";s:8:\"NC43LjU=\";s:8:\"_ym_isad\";s:4:\"Mg==\";s:9:\"PHPSESSID\";s:44:\"MjIxNzEyNDE4ZTY3NWNkN2U3YzU2ZDkwOWY3MzcwYWI=\";s:20:\"expandExtendedFields\";s:4:\"MQ==\";s:16:\"eip-editor-state\";s:12:\"ZW5hYmxlZA==\";s:8:\"pre_lang\";s:0:\"\";s:6:\"param0\";s:8:\"c2F2ZQ==\";s:4:\"name\";s:52:\"0JDRgNC10L3QtNCwINCz0LjQtNGA0L7QvNC+0LvQvtGC0L7Qsg==\";s:8:\"alt-name\";s:28:\"YXJlbmRhLWdpZHJvbW9sb3Rvdg==\";s:6:\"active\";s:4:\"MQ==\";s:4:\"data\";a:1:{i:647;a:19:{s:5:\"title\";s:104:\"Аренда гидромолота в СПБ недорого - спецтехника Стройтех\";s:2:\"h1\";s:37:\"Аренда гидромолотов\";s:13:\"meta_keywords\";s:96:\"аренда гидромолота спб, аренда гидромолота недорого\";s:17:\"meta_descriptions\";s:223:\"Аренда гидромолота в СПБ недорого, по договору, с оператором. Компания СтройТех предоставляет технику в аренду посуточно.\";s:4:\"tags\";s:0:\"\";s:11:\"robots_deny\";s:1:\"0\";s:12:\"show_submenu\";s:1:\"0\";s:11:\"is_expanded\";s:1:\"0\";s:12:\"is_unindexed\";s:1:\"0\";s:5:\"descr\";s:0:\"\";s:14:\"category_image\";s:0:\"\";s:11:\"rate_voters\";s:0:\"\";s:8:\"rate_sum\";s:0:\"\";s:8:\"lockuser\";s:0:\"\";s:12:\"index_source\";s:0:\"\";s:11:\"index_state\";s:0:\"\";s:12:\"index_choose\";s:1:\"0\";s:11:\"index_level\";s:0:\"\";s:18:\"additional_content\";s:0:\"\";}}}',182,1),(5,1579615393,'catalog','editValue','14','a:28:{s:4:\"path\";s:44:\"YWRtaW4vY29udGVudC9lZGl0VmFsdWUvc2F2ZS5qc29u\";s:17:\"umi_authorization\";s:0:\"\";s:10:\"element-id\";s:4:\"MTQ=\";s:2:\"qt\";s:20:\"MTU3OTYxNTM5MjkzMA==\";s:10:\"field-name\";s:20:\"Y2F0ZWdvcnlfaW1hZ2U=\";s:5:\"value\";s:52:\"L2ltYWdlcy9jbXMvZGF0YS92aWJyYXRvcnlfaGFtbWVyLmpwZw==\";s:4:\"csrf\";s:44:\"Y2Y3NGIyNjVkM2JiNmM3ZTgzNGU2NGUwNDIwNzc1NWI=\";s:7:\"_ym_uid\";s:28:\"MTU1OTY1MDM0NDg4MTAyODM4MA==\";s:5:\"_ym_d\";s:16:\"MTU3NzM2MTI3Mw==\";s:3:\"dbl\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:7:\"fco2r34\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:11:\"customer-id\";s:12:\"ei9NSzJBPT0=\";s:5:\"ilang\";s:4:\"cnU=\";s:17:\"control-domain-id\";s:4:\"MQ==\";s:21:\"eip-panel-state-first\";s:4:\"WQ==\";s:8:\"skin_sel\";s:8:\"bW9kZXJu\";s:14:\"umicms_session\";s:4:\"MQ==\";s:15:\"adminer_version\";s:8:\"NC43LjU=\";s:8:\"_ym_isad\";s:4:\"Mg==\";s:9:\"PHPSESSID\";s:44:\"MjIxNzEyNDE4ZTY3NWNkN2U3YzU2ZDkwOWY3MzcwYWI=\";s:20:\"expandExtendedFields\";s:4:\"MQ==\";s:16:\"eip-editor-state\";s:12:\"ZW5hYmxlZA==\";s:8:\"pre_lang\";s:0:\"\";s:6:\"param0\";s:8:\"c2F2ZQ==\";s:4:\"name\";s:64:\"0JDRgNC10L3QtNCwINCy0LjQsdGA0L7Qv9C+0LPRgNGD0LbQsNGC0LXQu9C10Lk=\";s:8:\"alt-name\";s:36:\"YXJlbmRhLXZpYnJvcG9ncnV6aGF0ZWxleQ==\";s:6:\"active\";s:4:\"MQ==\";s:4:\"data\";a:1:{i:648;a:19:{s:5:\"title\";s:114:\"Аренда вибропогружателя в СПб недорого - спецтехника Стройтех\";s:2:\"h1\";s:47:\"Аренда вибропогружателей\";s:13:\"meta_keywords\";s:119:\"аренда вибропогружателя в спб, аренда вибропогружателя недорого\";s:17:\"meta_descriptions\";s:181:\"Аренда вибропогружателя в СПб недорого с оператором, оплата почасовая - условия компании СтройТех.\";s:4:\"tags\";s:0:\"\";s:11:\"robots_deny\";s:1:\"0\";s:12:\"show_submenu\";s:1:\"0\";s:11:\"is_expanded\";s:1:\"0\";s:12:\"is_unindexed\";s:1:\"0\";s:5:\"descr\";s:0:\"\";s:14:\"category_image\";s:0:\"\";s:11:\"rate_voters\";s:0:\"\";s:8:\"rate_sum\";s:0:\"\";s:8:\"lockuser\";s:0:\"\";s:12:\"index_source\";s:0:\"\";s:11:\"index_state\";s:0:\"\";s:12:\"index_choose\";s:1:\"0\";s:11:\"index_level\";s:0:\"\";s:18:\"additional_content\";s:0:\"\";}}}',182,1),(6,1579615393,'catalog','editValue','15','a:28:{s:4:\"path\";s:44:\"YWRtaW4vY29udGVudC9lZGl0VmFsdWUvc2F2ZS5qc29u\";s:17:\"umi_authorization\";s:0:\"\";s:10:\"element-id\";s:4:\"MTU=\";s:2:\"qt\";s:20:\"MTU3OTYxNTM5MzExNw==\";s:10:\"field-name\";s:20:\"Y2F0ZWdvcnlfaW1hZ2U=\";s:5:\"value\";s:44:\"L2ltYWdlcy9jbXMvZGF0YS9leGNhdmF0b3IxLmpwZw==\";s:4:\"csrf\";s:44:\"Y2Y3NGIyNjVkM2JiNmM3ZTgzNGU2NGUwNDIwNzc1NWI=\";s:7:\"_ym_uid\";s:28:\"MTU1OTY1MDM0NDg4MTAyODM4MA==\";s:5:\"_ym_d\";s:16:\"MTU3NzM2MTI3Mw==\";s:3:\"dbl\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:7:\"fco2r34\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:11:\"customer-id\";s:12:\"ei9NSzJBPT0=\";s:5:\"ilang\";s:4:\"cnU=\";s:17:\"control-domain-id\";s:4:\"MQ==\";s:21:\"eip-panel-state-first\";s:4:\"WQ==\";s:8:\"skin_sel\";s:8:\"bW9kZXJu\";s:14:\"umicms_session\";s:4:\"MQ==\";s:15:\"adminer_version\";s:8:\"NC43LjU=\";s:8:\"_ym_isad\";s:4:\"Mg==\";s:9:\"PHPSESSID\";s:44:\"MjIxNzEyNDE4ZTY3NWNkN2U3YzU2ZDkwOWY3MzcwYWI=\";s:20:\"expandExtendedFields\";s:4:\"MQ==\";s:16:\"eip-editor-state\";s:12:\"ZW5hYmxlZA==\";s:8:\"pre_lang\";s:0:\"\";s:6:\"param0\";s:8:\"c2F2ZQ==\";s:4:\"name\";s:52:\"0JDRgNC10L3QtNCwINGN0LrRgdC60LDQstCw0YLQvtGA0L7Qsg==\";s:8:\"alt-name\";s:28:\"YXJlbmRhLWVrc2thdmF0b3Jvdg==\";s:6:\"active\";s:4:\"MQ==\";s:4:\"data\";a:1:{i:649;a:19:{s:5:\"title\";s:106:\"Аренда экскаваторов в СПб недорого - спецтехника СтройТех\";s:2:\"h1\";s:37:\"Аренда экскаваторов\";s:13:\"meta_keywords\";s:103:\"аренда экскаватора спб, аренда экскаватора спб недорого\";s:17:\"meta_descriptions\";s:191:\"Аренда экскаватора в СПб недорого, с оператором, оплата почасовая - все это возможно в компании СтройТех.\";s:4:\"tags\";s:0:\"\";s:11:\"robots_deny\";s:1:\"0\";s:12:\"show_submenu\";s:1:\"0\";s:11:\"is_expanded\";s:1:\"0\";s:12:\"is_unindexed\";s:1:\"0\";s:5:\"descr\";s:579:\"<p>Аренда экскаватора с&nbsp;оператором&nbsp;&mdash; отличное решение. С такой техникой вы&nbsp;значительно ускорите процесс строительства.<br /> В&nbsp;нашем автопарке представлены только лучшие экскаваторы на&nbsp;рынке. Выбирайте тот, который подходит вам по&nbsp;техническим характеристикам. Мы&nbsp;ответим на&nbsp;все ваши вопросы.</p>\";s:14:\"category_image\";s:0:\"\";s:11:\"rate_voters\";s:0:\"\";s:8:\"rate_sum\";s:0:\"\";s:8:\"lockuser\";s:0:\"\";s:12:\"index_source\";s:0:\"\";s:11:\"index_state\";s:0:\"\";s:12:\"index_choose\";s:1:\"0\";s:11:\"index_level\";s:0:\"\";s:18:\"additional_content\";s:0:\"\";}}}',182,1),(7,1579615393,'catalog','editValue','16','a:28:{s:4:\"path\";s:44:\"YWRtaW4vY29udGVudC9lZGl0VmFsdWUvc2F2ZS5qc29u\";s:17:\"umi_authorization\";s:0:\"\";s:10:\"element-id\";s:4:\"MTY=\";s:2:\"qt\";s:20:\"MTU3OTYxNTM5MzM0NA==\";s:10:\"field-name\";s:20:\"Y2F0ZWdvcnlfaW1hZ2U=\";s:5:\"value\";s:36:\"L2ltYWdlcy9jbXMvZGF0YS9wYXZlci5qcGc=\";s:4:\"csrf\";s:44:\"Y2Y3NGIyNjVkM2JiNmM3ZTgzNGU2NGUwNDIwNzc1NWI=\";s:7:\"_ym_uid\";s:28:\"MTU1OTY1MDM0NDg4MTAyODM4MA==\";s:5:\"_ym_d\";s:16:\"MTU3NzM2MTI3Mw==\";s:3:\"dbl\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:7:\"fco2r34\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:11:\"customer-id\";s:12:\"ei9NSzJBPT0=\";s:5:\"ilang\";s:4:\"cnU=\";s:17:\"control-domain-id\";s:4:\"MQ==\";s:21:\"eip-panel-state-first\";s:4:\"WQ==\";s:8:\"skin_sel\";s:8:\"bW9kZXJu\";s:14:\"umicms_session\";s:4:\"MQ==\";s:15:\"adminer_version\";s:8:\"NC43LjU=\";s:8:\"_ym_isad\";s:4:\"Mg==\";s:9:\"PHPSESSID\";s:44:\"MjIxNzEyNDE4ZTY3NWNkN2U3YzU2ZDkwOWY3MzcwYWI=\";s:20:\"expandExtendedFields\";s:4:\"MQ==\";s:16:\"eip-editor-state\";s:12:\"ZW5hYmxlZA==\";s:8:\"pre_lang\";s:0:\"\";s:6:\"param0\";s:8:\"c2F2ZQ==\";s:4:\"name\";s:64:\"0JDRgNC10L3QtNCwINCw0YHRhNCw0LvRjNGC0L7Rg9C60LvQsNC00YfQuNC60LA=\";s:8:\"alt-name\";s:32:\"YXJlbmRhLWFzZmFsdG91a2xhZGNoaWth\";s:6:\"active\";s:4:\"MQ==\";s:4:\"data\";a:1:{i:650;a:19:{s:5:\"title\";s:116:\"Аренда Асфальтоукладчика в СПб недорого - спецтехника Стройтех\";s:2:\"h1\";s:47:\"Аренда асфальтоукладчика\";s:13:\"meta_keywords\";s:120:\"аренда асфальтоукладчика спб, аренда асфальтоукладчика недорого\";s:17:\"meta_descriptions\";s:200:\"Аренда асфальтоукладчика в СПб недорого - в компании Стройтех техника предоставляется в аренду с оператором.\";s:4:\"tags\";s:0:\"\";s:11:\"robots_deny\";s:1:\"0\";s:12:\"show_submenu\";s:1:\"0\";s:11:\"is_expanded\";s:1:\"0\";s:12:\"is_unindexed\";s:1:\"0\";s:5:\"descr\";s:702:\"<p>Если вам требуется строить дороги или укладывать асфальт, то&nbsp;без помощи асфальтоукладчика вам не&nbsp;обойтись.</p>\r\n<p>В&nbsp;нашей компании вы&nbsp;можете арендовать асфальтоукладчики следующих разновидностей:</p>\r\n<ul>\r\n<li>Тротуарный асфальтоукладчик.</li>\r\n<li>Гусеничный автоукладчик.</li>\r\n</ul>\r\n<p>В&nbsp;этом разделе вы&nbsp;найдете информацию обо всех асфальтоукладчиках из&nbsp;нашего автопарка.</p>\";s:14:\"category_image\";s:0:\"\";s:11:\"rate_voters\";s:0:\"\";s:8:\"rate_sum\";s:0:\"\";s:8:\"lockuser\";s:0:\"\";s:12:\"index_source\";s:0:\"\";s:11:\"index_state\";s:0:\"\";s:12:\"index_choose\";s:1:\"0\";s:11:\"index_level\";s:0:\"\";s:18:\"additional_content\";s:0:\"\";}}}',182,1),(8,1579615393,'catalog','editValue','17','a:28:{s:4:\"path\";s:44:\"YWRtaW4vY29udGVudC9lZGl0VmFsdWUvc2F2ZS5qc29u\";s:17:\"umi_authorization\";s:0:\"\";s:10:\"element-id\";s:4:\"MTc=\";s:2:\"qt\";s:20:\"MTU3OTYxNTM5MzUyOQ==\";s:10:\"field-name\";s:20:\"Y2F0ZWdvcnlfaW1hZ2U=\";s:5:\"value\";s:40:\"L2ltYWdlcy9jbXMvZGF0YS9yb3Zlcl8yLmpwZw==\";s:4:\"csrf\";s:44:\"Y2Y3NGIyNjVkM2JiNmM3ZTgzNGU2NGUwNDIwNzc1NWI=\";s:7:\"_ym_uid\";s:28:\"MTU1OTY1MDM0NDg4MTAyODM4MA==\";s:5:\"_ym_d\";s:16:\"MTU3NzM2MTI3Mw==\";s:3:\"dbl\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:7:\"fco2r34\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:11:\"customer-id\";s:12:\"ei9NSzJBPT0=\";s:5:\"ilang\";s:4:\"cnU=\";s:17:\"control-domain-id\";s:4:\"MQ==\";s:21:\"eip-panel-state-first\";s:4:\"WQ==\";s:8:\"skin_sel\";s:8:\"bW9kZXJu\";s:14:\"umicms_session\";s:4:\"MQ==\";s:15:\"adminer_version\";s:8:\"NC43LjU=\";s:8:\"_ym_isad\";s:4:\"Mg==\";s:9:\"PHPSESSID\";s:44:\"MjIxNzEyNDE4ZTY3NWNkN2U3YzU2ZDkwOWY3MzcwYWI=\";s:20:\"expandExtendedFields\";s:4:\"MQ==\";s:16:\"eip-editor-state\";s:12:\"ZW5hYmxlZA==\";s:8:\"pre_lang\";s:0:\"\";s:6:\"param0\";s:8:\"c2F2ZQ==\";s:4:\"name\";s:44:\"0JDRgNC10L3QtNCwINCy0LXQt9C00LXRhdC+0LTQsA==\";s:8:\"alt-name\";s:24:\"YXJlbmRhLXZlemRlaG9kYQ==\";s:6:\"active\";s:4:\"MQ==\";s:4:\"data\";a:1:{i:651;a:19:{s:5:\"title\";s:100:\"Аренда вездехода в СПБ недорого - спецтехника Стройтех\";s:2:\"h1\";s:31:\"Аренда вездехода\";s:13:\"meta_keywords\";s:88:\"аренда вездехода спб, аренда вездехода недорого\";s:17:\"meta_descriptions\";s:146:\"Аренда вездехода в СПБ, недорого, с оператором, обращайтесь в компанию Стройтех.\";s:4:\"tags\";s:0:\"\";s:11:\"robots_deny\";s:1:\"0\";s:12:\"show_submenu\";s:1:\"0\";s:11:\"is_expanded\";s:1:\"0\";s:12:\"is_unindexed\";s:1:\"0\";s:5:\"descr\";s:442:\"<p>Вездеход пригодится в ситуации, когда ваша стройплощадка находится в труднодоступном месте. Также он поможет в тех случаях, когда необходим прицеп.</p>\r\n<p>В этом разделе вы найдете информацию обо всех вездеходах, что есть в нашем автопарке.</p>\";s:14:\"category_image\";s:0:\"\";s:11:\"rate_voters\";s:0:\"\";s:8:\"rate_sum\";s:0:\"\";s:8:\"lockuser\";s:0:\"\";s:12:\"index_source\";s:0:\"\";s:11:\"index_state\";s:0:\"\";s:12:\"index_choose\";s:1:\"0\";s:11:\"index_level\";s:0:\"\";s:18:\"additional_content\";s:0:\"\";}}}',182,0),(9,1579615410,'catalog','editValue','17','a:28:{s:4:\"path\";s:44:\"YWRtaW4vY29udGVudC9lZGl0VmFsdWUvc2F2ZS5qc29u\";s:17:\"umi_authorization\";s:0:\"\";s:10:\"element-id\";s:4:\"MTc=\";s:2:\"qt\";s:20:\"MTU3OTYxNTQxMDQ1Mw==\";s:10:\"field-name\";s:20:\"Y2F0ZWdvcnlfaW1hZ2U=\";s:5:\"value\";s:36:\"L2ltYWdlcy9jbXMvZGF0YS9yb3ZlcjEuanBn\";s:4:\"csrf\";s:44:\"Y2Y3NGIyNjVkM2JiNmM3ZTgzNGU2NGUwNDIwNzc1NWI=\";s:7:\"_ym_uid\";s:28:\"MTU1OTY1MDM0NDg4MTAyODM4MA==\";s:5:\"_ym_d\";s:16:\"MTU3NzM2MTI3Mw==\";s:3:\"dbl\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:7:\"fco2r34\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:11:\"customer-id\";s:12:\"ei9NSzJBPT0=\";s:5:\"ilang\";s:4:\"cnU=\";s:17:\"control-domain-id\";s:4:\"MQ==\";s:21:\"eip-panel-state-first\";s:4:\"WQ==\";s:8:\"skin_sel\";s:8:\"bW9kZXJu\";s:14:\"umicms_session\";s:4:\"MQ==\";s:15:\"adminer_version\";s:8:\"NC43LjU=\";s:8:\"_ym_isad\";s:4:\"Mg==\";s:9:\"PHPSESSID\";s:44:\"MjIxNzEyNDE4ZTY3NWNkN2U3YzU2ZDkwOWY3MzcwYWI=\";s:20:\"expandExtendedFields\";s:4:\"MQ==\";s:16:\"eip-editor-state\";s:12:\"ZW5hYmxlZA==\";s:8:\"pre_lang\";s:0:\"\";s:6:\"param0\";s:8:\"c2F2ZQ==\";s:4:\"name\";s:44:\"0JDRgNC10L3QtNCwINCy0LXQt9C00LXRhdC+0LTQsA==\";s:8:\"alt-name\";s:24:\"YXJlbmRhLXZlemRlaG9kYQ==\";s:6:\"active\";s:4:\"MQ==\";s:4:\"data\";a:1:{i:651;a:19:{s:5:\"title\";s:100:\"Аренда вездехода в СПБ недорого - спецтехника Стройтех\";s:2:\"h1\";s:31:\"Аренда вездехода\";s:13:\"meta_keywords\";s:88:\"аренда вездехода спб, аренда вездехода недорого\";s:17:\"meta_descriptions\";s:146:\"Аренда вездехода в СПБ, недорого, с оператором, обращайтесь в компанию Стройтех.\";s:4:\"tags\";s:0:\"\";s:11:\"robots_deny\";s:1:\"0\";s:12:\"show_submenu\";s:1:\"0\";s:11:\"is_expanded\";s:1:\"0\";s:12:\"is_unindexed\";s:1:\"0\";s:5:\"descr\";s:442:\"<p>Вездеход пригодится в ситуации, когда ваша стройплощадка находится в труднодоступном месте. Также он поможет в тех случаях, когда необходим прицеп.</p>\r\n<p>В этом разделе вы найдете информацию обо всех вездеходах, что есть в нашем автопарке.</p>\";s:14:\"category_image\";s:0:\"\";s:11:\"rate_voters\";s:0:\"\";s:8:\"rate_sum\";s:0:\"\";s:8:\"lockuser\";s:0:\"\";s:12:\"index_source\";s:0:\"\";s:11:\"index_state\";s:0:\"\";s:12:\"index_choose\";s:1:\"0\";s:11:\"index_level\";s:0:\"\";s:18:\"additional_content\";s:0:\"\";}}}',182,1),(10,1579615513,'photoalbum','editValue','30','a:28:{s:4:\"path\";s:44:\"YWRtaW4vY29udGVudC9lZGl0VmFsdWUvc2F2ZS5qc29u\";s:17:\"umi_authorization\";s:0:\"\";s:10:\"element-id\";s:4:\"MzA=\";s:2:\"qt\";s:20:\"MTU3OTYxNTUxMzczNw==\";s:10:\"field-name\";s:16:\"YWxidW1faW1hZ2U=\";s:5:\"value\";s:80:\"L2ltYWdlcy9jbXMvZGF0YS9mb3RvLXRlaG5pa2kvZ2lkcm9tb2xvdHkvaHlkcm9fZG9vc2FuLmpwZw==\";s:4:\"csrf\";s:44:\"Y2Y3NGIyNjVkM2JiNmM3ZTgzNGU2NGUwNDIwNzc1NWI=\";s:7:\"_ym_uid\";s:28:\"MTU1OTY1MDM0NDg4MTAyODM4MA==\";s:5:\"_ym_d\";s:16:\"MTU3NzM2MTI3Mw==\";s:3:\"dbl\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:7:\"fco2r34\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:11:\"customer-id\";s:12:\"ei9NSzJBPT0=\";s:5:\"ilang\";s:4:\"cnU=\";s:17:\"control-domain-id\";s:4:\"MQ==\";s:21:\"eip-panel-state-first\";s:4:\"WQ==\";s:8:\"skin_sel\";s:8:\"bW9kZXJu\";s:14:\"umicms_session\";s:4:\"MQ==\";s:15:\"adminer_version\";s:8:\"NC43LjU=\";s:8:\"_ym_isad\";s:4:\"Mg==\";s:9:\"PHPSESSID\";s:44:\"MjIxNzEyNDE4ZTY3NWNkN2U3YzU2ZDkwOWY3MzcwYWI=\";s:20:\"expandExtendedFields\";s:4:\"MQ==\";s:16:\"eip-editor-state\";s:12:\"ZW5hYmxlZA==\";s:8:\"pre_lang\";s:0:\"\";s:6:\"param0\";s:8:\"c2F2ZQ==\";s:4:\"name\";s:32:\"0JPQuNC00YDQvtC80L7Qu9C+0YLRiw==\";s:8:\"alt-name\";s:16:\"Z2lkcm9tb2xvdHk=\";s:6:\"active\";s:4:\"MQ==\";s:4:\"data\";a:1:{i:664;a:16:{s:5:\"title\";s:0:\"\";s:2:\"h1\";s:22:\"Гидромолоты\";s:17:\"meta_descriptions\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:4:\"tags\";s:0:\"\";s:11:\"robots_deny\";s:1:\"0\";s:12:\"show_submenu\";s:1:\"0\";s:11:\"is_expanded\";s:1:\"0\";s:12:\"is_unindexed\";s:1:\"0\";s:5:\"descr\";s:0:\"\";s:7:\"user_id\";s:0:\"\";s:11:\"rate_voters\";s:0:\"\";s:8:\"rate_sum\";s:0:\"\";s:8:\"lockuser\";s:0:\"\";s:18:\"additional_content\";s:0:\"\";s:11:\"album_image\";s:0:\"\";}}}',182,1),(11,1579615514,'photoalbum','editValue','31','a:28:{s:4:\"path\";s:44:\"YWRtaW4vY29udGVudC9lZGl0VmFsdWUvc2F2ZS5qc29u\";s:17:\"umi_authorization\";s:0:\"\";s:10:\"element-id\";s:4:\"MzE=\";s:2:\"qt\";s:20:\"MTU3OTYxNTUxMzk1MQ==\";s:10:\"field-name\";s:16:\"YWxidW1faW1hZ2U=\";s:5:\"value\";s:88:\"L2ltYWdlcy9jbXMvZGF0YS9mb3RvLXRlaG5pa2kvdmlicm9wb2dydXpoYXRlbGkvdmlicm9faGl0YWNoaS5qcGc=\";s:4:\"csrf\";s:44:\"Y2Y3NGIyNjVkM2JiNmM3ZTgzNGU2NGUwNDIwNzc1NWI=\";s:7:\"_ym_uid\";s:28:\"MTU1OTY1MDM0NDg4MTAyODM4MA==\";s:5:\"_ym_d\";s:16:\"MTU3NzM2MTI3Mw==\";s:3:\"dbl\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:7:\"fco2r34\";s:44:\"ZmQ2OWVhODFiNDc3ZWQ0NWYzODVmZTg2YTc1ZjA5ZDg=\";s:11:\"customer-id\";s:12:\"ei9NSzJBPT0=\";s:5:\"ilang\";s:4:\"cnU=\";s:17:\"control-domain-id\";s:4:\"MQ==\";s:21:\"eip-panel-state-first\";s:4:\"WQ==\";s:8:\"skin_sel\";s:8:\"bW9kZXJu\";s:14:\"umicms_session\";s:4:\"MQ==\";s:15:\"adminer_version\";s:8:\"NC43LjU=\";s:8:\"_ym_isad\";s:4:\"Mg==\";s:9:\"PHPSESSID\";s:44:\"MjIxNzEyNDE4ZTY3NWNkN2U3YzU2ZDkwOWY3MzcwYWI=\";s:20:\"expandExtendedFields\";s:4:\"MQ==\";s:16:\"eip-editor-state\";s:12:\"ZW5hYmxlZA==\";s:8:\"pre_lang\";s:0:\"\";s:6:\"param0\";s:8:\"c2F2ZQ==\";s:4:\"name\";s:44:\"0JLQuNCx0YDQvtC/0L7Qs9GA0YPQttCw0YLQtdC70Lg=\";s:8:\"alt-name\";s:24:\"dmlicm9wb2dydXpoYXRlbGk=\";s:6:\"active\";s:4:\"MQ==\";s:4:\"data\";a:1:{i:665;a:16:{s:5:\"title\";s:0:\"\";s:2:\"h1\";s:32:\"Вибропогружатели\";s:17:\"meta_descriptions\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:4:\"tags\";s:0:\"\";s:11:\"robots_deny\";s:1:\"0\";s:12:\"show_submenu\";s:1:\"0\";s:11:\"is_expanded\";s:1:\"0\";s:12:\"is_unindexed\";s:1:\"0\";s:5:\"descr\";s:0:\"\";s:7:\"user_id\";s:0:\"\";s:11:\"rate_voters\";s:0:\"\";s:8:\"rate_sum\";s:0:\"\";s:8:\"lockuser\";s:0:\"\";s:18:\"additional_content\";s:0:\"\";s:11:\"album_image\";s:0:\"\";}}}',182,1);
/*!40000 ALTER TABLE `cms_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_permissions`
--

DROP TABLE IF EXISTS `cms_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_permissions` (
  `module` varchar(64) DEFAULT NULL,
  `method` varchar(64) DEFAULT NULL,
  `owner_id` int(10) unsigned DEFAULT NULL,
  `allow` tinyint(4) DEFAULT '1',
  KEY `module` (`module`),
  KEY `method` (`method`),
  KEY `owner_id` (`owner_id`),
  KEY `allow` (`allow`),
  CONSTRAINT `FK_PermissionOwnerId_To_ObjectId` FOREIGN KEY (`owner_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_permissions`
--

LOCK TABLES `cms_permissions` WRITE;
/*!40000 ALTER TABLE `cms_permissions` DISABLE KEYS */;
INSERT INTO `cms_permissions` VALUES ('users','settings',619,1),('blogs20','add',619,1),('domain','1',618,1),('menu','view',618,1),('news','view',618,1),('content','content',618,1),('blogs20','common',618,1),('forum','view',618,1),('comments','insert',618,1),('vote','poll',618,1),('vote','post',618,1),('webforms','add',618,1),('webforms','messages',618,1),('photoalbum','albums',618,1),('faq','projects',618,1),('faq','post_question',618,1),('dispatches','subscribe',618,1),('catalog','view',618,1),('banners','insert',618,1),('users','registrate',618,1),('stat','tagsCloud',618,1),('seo','guest',618,1),('config','cron_http_execute',618,1),('data','618',618,1),('data','main',618,1),('search','search',618,1),('filemanager','list_files',618,1),('filemanager','download',618,1),('umiSliders','view',618,1),('umiSettings','read',618,1),('umiStub','stub',618,1),('appointment','enroll',618,1),('umiTemplates','client',618,1);
/*!40000 ALTER TABLE `cms_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_reg`
--

DROP TABLE IF EXISTS `cms_reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_reg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `var` varchar(48) NOT NULL,
  `val` varchar(255) DEFAULT NULL,
  `rel` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `var` (`var`),
  KEY `rel` (`rel`,`var`)
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_reg`
--

LOCK TABLES `cms_reg` WRITE;
/*!40000 ALTER TABLE `cms_reg` DISABLE KEYS */;
INSERT INTO `cms_reg` VALUES (1,'modules','',0),(2,'events','events',1),(3,'name','events',2),(4,'title','Events',2),(5,'description','Events',2),(6,'filename','modules/events/class.php',2),(7,'config','1',2),(8,'ico','ico_events',2),(9,'default_method','getUserSettings',2),(10,'default_method_admin','last',2),(11,'max-days-storing-events','30',2),(12,'collect-events','0',2),(13,'menu','menu',1),(14,'name','menu',13),(15,'filename','modules/menu/class.php',13),(16,'config','0',13),(17,'ico','ico_menu',13),(18,'default_method','show',13),(19,'default_method_admin','lists',13),(20,'per_page','10',13),(21,'news','news',1),(22,'name','news',21),(23,'filename','modules/news/class.php',21),(24,'config','1',21),(25,'default_method','archive',21),(26,'default_method_admin','lists',21),(27,'per_page','10',21),(28,'content','content',1),(29,'name','content',28),(30,'filename','modules/content/class.php',28),(31,'config','1',28),(32,'default_method','content',28),(33,'default_method_admin','sitetree',28),(34,'blogs20','blogs20',1),(35,'verison','2.0.0.0',34),(36,'name','blogs20',34),(37,'filename','modules/blogs20/class.php',34),(38,'config','1',34),(39,'ico','ico_blogs20',34),(40,'default_method','blogsList',34),(41,'default_method_admin','posts',34),(42,'paging','',34),(43,'blogs','10',42),(44,'posts','10',42),(45,'comments','50',42),(46,'blogs_per_user','5',34),(47,'allow_guest_comments','1',34),(48,'notifications','',34),(49,'on_comment_add','1',48),(50,'forum','forum',1),(51,'name','forum',50),(52,'filename','modules/forum/class.php',50),(53,'config','1',50),(54,'default_method','show',50),(55,'default_method_admin','confs_list',50),(56,'need_moder','0',50),(57,'allow_guest','0',50),(58,'per_page','25',50),(59,'sort_by_last_message','0',50),(60,'dispatch_id','26073',50),(61,'comments','comments',1),(62,'name','comments',61),(63,'title','Комментарии',61),(64,'filename','modules/comments/class.php',61),(65,'config','1',61),(66,'default_method','void_func',61),(67,'default_method_admin','view_comments',61),(68,'per_page','10',61),(69,'moderated','0',61),(70,'guest_posting','0',61),(71,'allow_guest','1',61),(72,'default_comments','1',61),(73,'vkontakte','0',61),(74,'vk_per_page','0',61),(75,'vk_width','0',61),(76,'vk_api','',61),(77,'vk_extend','0',61),(78,'facebook','0',61),(79,'fb_per_page','0',61),(80,'fb_width','0',61),(81,'fb_colorscheme','light',61),(82,'vote','vote',1),(83,'name','vote',82),(84,'filename','modules/vote/class.php',82),(85,'config','1',82),(86,'default_method','insertlast',82),(87,'default_method_admin','lists',82),(88,'webforms','webforms',1),(89,'name','webforms',88),(90,'filename','webforms/class.php',88),(91,'config','0',88),(92,'default_method','insert',88),(93,'default_method_admin','addresses',88),(94,'imported','1',88),(95,'photoalbum','photoalbum',1),(96,'name','photoalbum',95),(97,'filename','modules/photoalbum/class.php',95),(98,'config','1',95),(99,'default_method','albums',95),(100,'default_method_admin','lists',95),(101,'per_page','10',95),(102,'faq','faq',1),(103,'name','faq',102),(104,'filename','modules/faq/class.php',102),(105,'config','1',102),(106,'default_method','project',102),(107,'default_method_admin','projects_list',102),(108,'per_page','10',102),(109,'disable_new_question_notification','0',102),(110,'dispatches','dispatches',1),(111,'name','dispatches',110),(112,'filename','dispatches/class.php',110),(113,'config','1',110),(114,'default_method','subscribe',110),(115,'default_method_admin','lists',110),(116,'catalog','catalog',1),(117,'name','catalog',116),(118,'title','Каталог',116),(119,'filename','modules/catalog/class.php',116),(120,'config','1',116),(121,'default_method','category',116),(122,'default_method_admin','tree',116),(123,'per_page','5',116),(124,'banners','banners',1),(125,'name','banners',124),(126,'filename','banners/class.php',124),(127,'config','1',124),(128,'default_method','insert_banner',124),(129,'default_method_admin','lists',124),(130,'users','users',1),(131,'name','users',130),(132,'filename','modules/users/class.php',130),(133,'config','1',130),(134,'default_method','auth',130),(135,'default_method_admin','users_list_all',130),(136,'def_group','619',130),(137,'pages_permissions_changing_enabled_on_add','1',130),(138,'pages_permissions_changing_enabled_on_edit','0',130),(139,'stat','stat',1),(140,'name','stat',139),(141,'filename','modules/stat/class.php',139),(142,'config','1',139),(143,'default_method','sess_refresh',139),(144,'default_method_admin','yandexMetric',139),(145,'collect','0',139),(146,'delete_after','30',139),(147,'items_per_page','100',139),(148,'seo','seo',1),(149,'name','seo',148),(150,'filename','modules/seo/class.php',148),(151,'config','1',148),(152,'default_method','getRelCanonical',148),(153,'default_method_admin','sitemap',148),(154,'megaindex-login','megaindex@umisoft.ru',148),(155,'megaindex-password','et676e5rj',148),(156,'config','config',1),(157,'name','config',156),(158,'filename','modules/config/class.php',156),(159,'config','0',156),(160,'default_method','test',156),(161,'default_method_admin','main',156),(162,'tickets','tickets',1),(163,'name','tickets',162),(164,'filename','modules/tickets/class.php',162),(165,'config','0',162),(166,'ico','ico_tickets',162),(167,'default_method','',162),(168,'default_method_admin','tickets',162),(169,'data','data',1),(170,'name','data',169),(171,'filename','modules/data/class.php',169),(172,'config','1',169),(173,'default_method','test',169),(174,'default_method_admin','types',169),(175,'autoupdate','autoupdate',1),(176,'name','autoupdate',175),(177,'filename','modules/autoupdate/class.php',175),(178,'config','1',175),(179,'default_method','updateall',175),(180,'default_method_admin','versions',175),(181,'backup','backup',1),(182,'name','backup',181),(183,'title','Backups',181),(184,'filename','modules/backup/class.php',181),(185,'config','1',181),(186,'default_method','temp_method',181),(187,'default_method_admin','snapshots',181),(188,'max_timelimit','30',181),(189,'max_save_actions','50',181),(190,'enabled','1',181),(191,'search','search',1),(192,'name','search',191),(193,'filename','modules/search/class.php',191),(194,'default_method','search_do',191),(195,'default_method_admin','index_control',191),(196,'per_page','5',191),(197,'one_iteration_index','5',191),(198,'config','1',191),(199,'filemanager','filemanager',1),(200,'name','filemanager',199),(201,'description','Управление файловой системой.',199),(202,'filename','modules/filemanager/class.php',199),(203,'config','0',199),(204,'default_method','list_files',199),(205,'default_method_admin','shared_files',199),(206,'umiRedirects','umiRedirects',1),(207,'config','1',206),(208,'name','umiRedirects',206),(209,'default_method','empty',206),(210,'default_method_admin','lists',206),(211,'umiNotifications','umiNotifications',1),(212,'default_method','empty',211),(213,'default_method_admin','notifications',211),(214,'config','0',211),(215,'umiSliders','umiSliders',1),(216,'config','1',215),(217,'name','umiSliders',215),(218,'default_method','empty',215),(219,'default_method_admin','getSliders',215),(220,'default_sliding_speed','1',215),(221,'default_sliding_delay','1',215),(222,'default_sliding_slides_count','10',215),(223,'trash','trash',1),(224,'config','0',223),(225,'default_method','empty',223),(226,'default_method_admin','trash',223),(227,'umiSettings','umiSettings',1),(228,'default_method','empty',227),(229,'default_method_admin','read',227),(230,'umiStub','umiStub',1),(231,'name','umiStub',230),(232,'config','0',230),(233,'default_method','empty',230),(234,'default_method_admin','stub',230),(235,'appointment','appointment',1),(236,'config','1',235),(237,'name','appointment',235),(238,'work-time-0','',235),(239,'work-time-1','',235),(240,'work-time-2','',235),(241,'work-time-3','',235),(242,'work-time-4','',235),(243,'work-time-5','',235),(244,'work-time-6','',235),(245,'default_method','page',235),(246,'default_method_admin','orders',235),(247,'settings','',0),(248,'keycode','69D0644A407-DECC7058E80-4206BCC52DD',247),(249,'system_edition','commerce',247),(250,'previous_edition','commerce',247),(251,'system_version','dev',247),(252,'system_build','92175',247),(253,'last_updated','1678957726',247),(254,'system_build','92175',175),(255,'install','1556105595',247),(256,'guest_id','618',130),(257,'create','1556105595',247),(258,'umiMessages','',0),(259,'lastConnectTime','1678957649',258),(260,'lastMessageId','0',258),(261,'last_mess_time','1607074018',247),(262,'umiTemplates','umiTemplates',1),(263,'name','umiTemplates',262),(264,'config','0',262),(265,'default_method','empty',262),(266,'default_method_admin','getTemplateList',262),(267,'is_filter_virtual_copies','0',116),(268,'search-types','',191),(269,'enable-recaptcha','',247),(270,'captcha-remember','0',247),(271,'recaptcha-sitekey','6LfOGaUUAAAAACg2PIVXVpnEYKM7xO_6U-jbdwQa',247),(272,'recaptcha-secret','6LfOGaUUAAAAACiNc76ZopzD9bK_mF95UyGJgHaA',247),(273,'captcha','',247),(274,'1','',273),(275,'1','',274),(276,'enable-classic','',275),(277,'enable-recaptcha','',275),(278,'use-site-settings','0',275),(279,'remember','0',275),(280,'drawer','',275),(281,'recaptcha-sitekey','',275),(282,'recaptcha-secret','',275),(283,'disable_url_autocorrection','0',247),(284,'max_img_filesize','48',247),(285,'default_module_admin','events',247),(286,'default_module_admin_changed','1',247),(287,'default_module','content',247),(288,'site_name','umicms.demo site',247),(289,'title_prefix','',247),(290,'1','',289),(291,'1','UMI.CMS - ',290),(292,'2','',290),(293,'domain','',247),(294,'admin_email','demo@umi-cms.ru',247),(295,'error_email','',247),(296,'memcached','',247),(297,'is_enabled','0',296),(298,'host','localhost',296),(299,'port','11211',296),(300,'rec_deep','0',247),(301,'email_from','demo@umi-cms.ru',247),(302,'fio_from','Тестовый отправитель',247),(303,'meta_keywords','',247),(304,'1','',303),(305,'1','umi CMS демо DEMO сайт система управление',304),(306,'2','',304),(307,'meta_description','',247),(308,'1','',307),(309,'1','',308),(310,'2','',308),(311,'disable_captcha','0',247),(312,'show_macros_onerror','1',247),(313,'lock_duration','3600',247),(314,'expiration_control','0',247),(315,'allow_alt_name_with_module_collision','0',247),(316,'allow_redirects_watch','1',247),(317,'lock_pages','0',247),(318,'next_clean_time','',247),(319,'next_optimise_time','',247),(320,'elements_count_per_page','15',247),(321,'seo','',247),(322,'allow-empty-description','1',321),(323,'allow-empty-h1','1',321),(324,'allow-empty-keywords','0',321),(325,'allow-empty-title','1',321),(326,'emarket','emarket',1),(327,'version','2.8.0.5',326),(328,'version_line','pro',326),(329,'name','emarket',326),(330,'title','Интернет-магазин',326),(331,'filename','modules/emarket/class.php',326),(332,'config','1',326),(333,'ico','ico_eshop',326),(334,'default_method_admin','orders',326),(335,'enable-discounts','1',326),(336,'enable-currency','1',326),(337,'enable-stores','1',326),(338,'enable-payment','1',326),(339,'enable-delivery','1',326),(340,'social_vkontakte_merchant_id','',326),(341,'social_vkontakte_key','',326),(342,'social_vkontakte_wishlist','1',326),(343,'social_vkontakte_order','1',326),(344,'social_vkontakte_testmode','1',326),(345,'delivery-with-address','0',326),(346,'default-store-city','Санкт-Петербург',326),(347,'default-store-contact-email','hariton.moiseevich@umisoft.ru',326),(348,'default-store-contact-full-name','Харитон Моисеевич',326),(349,'default-store-contact-phone','88123090315',326),(350,'default-store-country-code','RU',326),(351,'default-store-house-number','25ж',326),(352,'default-store-region','Санкт-Петербург',326),(353,'default-store-street','Красного курсанта',326),(354,'order-defaultHeight','60',326),(355,'order-defaultLength','40',326),(356,'order-defaultWidth','40',326),(357,'order-defaultWeight','1000',326),(358,'default-store-index','197110',326),(359,'exchange','exchange',1),(360,'name','exchange',359),(361,'filename','modules/exchange/class.php',359),(362,'config','1',359),(363,'ico','exchange',359),(364,'default_method','import',359),(365,'default_method_admin','import',359),(366,'social_networks','social_networks',1),(367,'version','1',366),(368,'name','social_networks',366),(369,'title','Интеграция с социальными сетями',366),(370,'filename','modules/social_networks/class.php',366),(371,'config','0',366),(372,'ico','ico_social_networks',366),(373,'default_method','vkontakte',366),(374,'default_method_admin','vkontakte',366),(375,'umiMarket','umiMarket',1),(376,'config','0',375),(377,'name','umiMarket',375),(378,'default_method','empty',375),(379,'default_method_admin','catalog',375),(380,'extensions','',0);
/*!40000 ALTER TABLE `cms_reg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_sitemap`
--

DROP TABLE IF EXISTS `cms_sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_sitemap` (
  `id` int(11) NOT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  `link` varchar(1024) NOT NULL,
  `sort` tinyint(4) NOT NULL,
  `priority` double NOT NULL DEFAULT '0',
  `dt` datetime NOT NULL,
  `level` int(4) unsigned NOT NULL,
  `lang_id` int(10) unsigned NOT NULL,
  `change_frequency` enum('always','hourly','daily','weekly','monthly','yearly','never','') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__sort` (`sort`),
  KEY `__domain_id` (`domain_id`),
  KEY `__domain_id__sort` (`domain_id`,`sort`),
  KEY `__domain_id__level` (`domain_id`,`level`),
  KEY `lang_id from cms3_langs` (`lang_id`),
  CONSTRAINT `domain_id from cms3_domains` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lang_id from cms3_langs` FOREIGN KEY (`lang_id`) REFERENCES `cms3_langs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_sitemap`
--

LOCK TABLES `cms_sitemap` WRITE;
/*!40000 ALTER TABLE `cms_sitemap` DISABLE KEYS */;
INSERT INTO `cms_sitemap` VALUES (1,1,'http://localhost:8410/',15,1,'2019-05-23 18:40:07',0,1,'weekly'),(2,1,'http://localhost:8410/o-nas/',10,1,'2019-05-16 16:34:05',1,1,'weekly'),(3,1,'http://localhost:8410/kontakty/',4,1,'2019-05-22 15:56:54',1,1,'weekly'),(4,1,'http://localhost:8410/novosti/',11,1,'2019-05-17 11:27:59',1,1,'weekly'),(5,1,'http://localhost:8410/novosti/kak-podobrat-podhodyawij-samosval/',16,0.5,'2019-05-17 16:15:46',2,1,'weekly'),(6,1,'http://localhost:8410/novosti/obnovlenie-parka-spectehniki/',2,0.5,'2019-05-17 16:16:25',2,1,'weekly'),(7,1,'http://localhost:8410/novosti/vesennee-tayanie-cen/',13,0.5,'2019-05-17 16:16:49',2,1,'weekly'),(8,1,'http://localhost:8410/novosti/skidka-na-arendu-spectehniki-na-dlitelnyj-srok/',2,0.5,'2019-05-17 16:17:16',2,1,'weekly'),(9,1,'http://localhost:8410/arenda-spectehniki/',15,1,'2019-05-21 10:42:20',1,1,'weekly'),(10,1,'http://localhost:8410/arenda-spectehniki/arenda-buldozerov/',1,0.5,'2020-01-21 17:03:11',2,1,'weekly'),(11,1,'http://localhost:8410/arenda-spectehniki/arenda-samosvalov/',4,0.5,'2020-01-21 17:03:12',2,1,'weekly'),(12,1,'http://localhost:8410/arenda-spectehniki/arenda-avtokranov/',14,0.5,'2020-01-21 17:03:12',2,1,'weekly'),(13,1,'http://localhost:8410/arenda-spectehniki/arenda-gidromolotov/',10,0.5,'2020-01-21 17:03:12',2,1,'weekly'),(14,1,'http://localhost:8410/arenda-spectehniki/arenda-vibropogruzhateley/',15,0.5,'2020-01-21 17:03:13',2,1,'weekly'),(15,1,'http://localhost:8410/arenda-spectehniki/arenda-ekskavatorov/',3,0.5,'2020-01-21 17:03:13',2,1,'weekly'),(16,1,'http://localhost:8410/arenda-spectehniki/arenda-asfaltoukladchika/',14,0.5,'2020-01-21 17:03:13',2,1,'weekly'),(17,1,'http://localhost:8410/arenda-spectehniki/arenda-vezdehoda/',16,0.5,'2020-01-21 17:03:30',2,1,'weekly'),(18,1,'http://localhost:8410/arenda-spectehniki/arenda-buldozerov/arenda-buldozera-komatsu-d31e-20/',12,0.3,'2019-05-24 15:00:59',3,1,'weekly'),(19,1,'http://localhost:8410/arenda-spectehniki/arenda-buldozerov/arenda-buldozera-komatsu-d21a-7/',6,0.3,'2019-05-21 11:01:10',3,1,'weekly'),(20,1,'http://localhost:8410/arenda-spectehniki/arenda-samosvalov/samosval-18-20-kubov/',8,0.3,'2019-05-24 15:01:23',3,1,'weekly'),(21,1,'http://localhost:8410/arenda-spectehniki/arenda-samosvalov/samosval-10-12-kubov/',1,0.3,'2019-05-24 15:01:00',3,1,'weekly'),(22,1,'http://localhost:8410/arenda-spectehniki/arenda-avtokranov/avtokran-25-tonn-ks-55713/',13,0.3,'2019-05-24 15:01:41',3,1,'weekly'),(23,1,'http://localhost:8410/arenda-spectehniki/arenda-avtokranov/avtokran-14-16-tonn-ks-35715/',4,0.3,'2019-05-24 15:01:03',3,1,'weekly'),(24,1,'http://localhost:8410/arenda-spectehniki/arenda-ekskavatorov/ekskavator-planirovwik-uds-114/',13,0.3,'2019-05-24 15:01:14',3,1,'weekly'),(25,1,'http://localhost:8410/arenda-spectehniki/arenda-ekskavatorov/ekskavator-gusenichnyj-s-planirovochnym-kovshom/',9,0.3,'2019-05-24 15:01:50',3,1,'weekly'),(26,1,'http://localhost:8410/arenda-spectehniki/arenda-asfaltoukladchika/asfaltoukladchik-vogele-800/',7,0.3,'2019-05-24 15:01:07',3,1,'weekly'),(27,1,'http://localhost:8410/arenda-spectehniki/arenda-asfaltoukladchika/asfaltoukladchik-trotuarnyj-vogele-1300-2/',13,0.3,'2019-05-22 11:24:38',3,1,'weekly'),(28,1,'http://localhost:8410/arenda-spectehniki/arenda-vezdehoda/samosval-vezdehod/',3,0.3,'2019-05-24 15:01:28',3,1,'weekly'),(29,1,'http://localhost:8410/foto-tehniki/',7,1,'2019-05-17 16:29:07',1,1,'weekly'),(30,1,'http://localhost:8410/foto-tehniki/gidromoloty/',16,0.5,'2020-01-21 17:05:13',2,1,'weekly'),(31,1,'http://localhost:8410/foto-tehniki/vibropogruzhateli/',3,0.5,'2020-01-21 17:05:14',2,1,'weekly'),(32,1,'http://localhost:8410/foto-tehniki/gidromoloty/gidromolot-jcb/',15,0.3,'2019-05-17 18:09:37',3,1,'weekly'),(33,1,'http://localhost:8410/foto-tehniki/gidromoloty/gidromolot-cat/',16,0.3,'2019-05-17 18:10:54',3,1,'weekly'),(34,1,'http://localhost:8410/foto-tehniki/gidromoloty/gidromolot-doosan/',8,0.3,'2019-05-17 18:11:49',3,1,'weekly'),(35,1,'http://localhost:8410/foto-tehniki/vibropogruzhateli/vibropogruzhatel-jcb/',1,0.3,'2019-05-17 18:14:02',3,1,'weekly'),(36,1,'http://localhost:8410/foto-tehniki/vibropogruzhateli/vibropogruzhatel-volvo/',1,0.3,'2019-05-17 18:16:17',3,1,'weekly'),(37,1,'http://localhost:8410/foto-tehniki/vibropogruzhateli/vibropogruzhatel-hitachi/',10,0.3,'2019-05-17 18:16:53',3,1,'weekly'),(87,1,'http://localhost:8410/arenda-spectehniki/arenda-gidromolotov/gidromolot-c3po/',0,0.3,'2019-05-24 15:05:30',3,1,'weekly'),(88,1,'http://localhost:8410/arenda-spectehniki/arenda-vibropogruzhateley/vibropogruzhatel-r2d2/',9,0.3,'2019-05-24 15:05:59',3,1,'weekly');
/*!40000 ALTER TABLE `cms_sitemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_sitemap_images`
--

DROP TABLE IF EXISTS `cms_sitemap_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_sitemap_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  `link` varchar(1024) NOT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id from cms_sitemap` (`location_id`),
  KEY `domain_id from cms3_domains for sitemap image` (`domain_id`),
  CONSTRAINT `domain_id from cms3_domains for sitemap image` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE,
  CONSTRAINT `location_id from cms_sitemap` FOREIGN KEY (`location_id`) REFERENCES `cms_sitemap` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_sitemap_images`
--

LOCK TABLES `cms_sitemap_images` WRITE;
/*!40000 ALTER TABLE `cms_sitemap_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_sitemap_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_dispatches`
--

DROP TABLE IF EXISTS `cms_stat_dispatches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_dispatches` (
  `hash` varchar(10) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_dispatches`
--

LOCK TABLES `cms_stat_dispatches` WRITE;
/*!40000 ALTER TABLE `cms_stat_dispatches` DISABLE KEYS */;
INSERT INTO `cms_stat_dispatches` VALUES ('4ea50920b5',1568289556),('8a63c8dfdb',1568289683),('aa0479d053',1568289769),('0ddf805584',1568289773),('8ae1b9eb88',1568289841),('63a9da4057',1568289953),('145e41c7cd',1568289963),('674473613a',1568290020),('ae404ed34b',1568290117),('329f83993a',1568290157),('a9229c9bb0',1568290248),('0e7b4541c9',1568290273),('05653011ac',1568290331),('19303ef929',1568290363),('25e84b76ae',1568290447),('77c2be8d24',1568290475),('bed57f8061',1568290565),('2e3c3c8c31',1568290773),('8b5fdd03c0',1568290833),('ad6012b2de',1568290856),('9e3218dff7',1568290917),('66d36e2e8a',1568290940),('a56d596526',1568290947),('2b3516f234',1568291008),('5a65d270b9',1568291137),('44524701eb',1568291185),('dc1bbc5fc3',1568291297),('e182e28688',1568291367),('7ed136a2e5',1568291401),('80e10c0218',1568291418),('3bc1abb56c',1568291454),('323b697929',1568291506),('03418ac1fb',1568291547),('eee7a2a769',1568291649),('5c11b54bda',1568291711),('85866abdf3',1568291736),('6ad90b17ab',1568291784),('ff833c104f',1568291801),('47aab5bfaa',1568291823),('017aa6bc26',1568291835),('93b2c33b8d',1568291867),('b4c4272231',1568291933),('137303c4fe',1568292398),('6aef968edc',1568292599),('636e426f3d',1568292684),('d570842eb1',1568292707),('63b6d80efb',1568292719),('f8ee356c0a',1568292739),('1de119e875',1568293428),('6a1720e670',1568293447),('5127cb8bd0',1568293470),('dd5f9849ec',1568293565),('956a2e1c46',1568293647),('d215954ff9',1568293675),('19aaedd9b0',1568293691),('228993de48',1568293757),('1167f2e61a',1568293808),('87b2ba2858',1568293833),('10c226d422',1568293875),('c826d294d4',1568293899),('ff9dbde258',1568293906),('d57dfe5fd8',1574431723),('55b4e7366d',1574431730),('fsdfsdfsf2',1575021181),('fsdfsdfsf2',1575021182);
/*!40000 ALTER TABLE `cms_stat_dispatches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_domains`
--

DROP TABLE IF EXISTS `cms_stat_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entrytime` int(11) DEFAULT NULL,
  `refer_domain` text,
  `sess_id` text,
  PRIMARY KEY (`id`),
  KEY `sess_id` (`sess_id`(4))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_domains`
--

LOCK TABLES `cms_stat_domains` WRITE;
/*!40000 ALTER TABLE `cms_stat_domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_entry_points`
--

DROP TABLE IF EXISTS `cms_stat_entry_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_entry_points` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `url` text,
  `host_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `url` (`url`(1)),
  KEY `host_id` (`host_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_entry_points`
--

LOCK TABLES `cms_stat_entry_points` WRITE;
/*!40000 ALTER TABLE `cms_stat_entry_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_entry_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_entry_points_events`
--

DROP TABLE IF EXISTS `cms_stat_entry_points_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_entry_points_events` (
  `entry_point_id` int(11) unsigned DEFAULT NULL,
  `event_id` int(11) unsigned DEFAULT NULL,
  KEY `entry_point_id` (`entry_point_id`),
  KEY `event_id` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_entry_points_events`
--

LOCK TABLES `cms_stat_entry_points_events` WRITE;
/*!40000 ALTER TABLE `cms_stat_entry_points_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_entry_points_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_events`
--

DROP TABLE IF EXISTS `cms_stat_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_events` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` text,
  `name` varchar(255) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `profit` float(9,2) DEFAULT '0.00',
  `host_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`type`),
  KEY `host_id` (`host_id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_events`
--

LOCK TABLES `cms_stat_events` WRITE;
/*!40000 ALTER TABLE `cms_stat_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_events_collected`
--

DROP TABLE IF EXISTS `cms_stat_events_collected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_events_collected` (
  `event_id` int(11) unsigned DEFAULT NULL,
  `hit_id` int(11) unsigned DEFAULT NULL,
  KEY `event_id` (`event_id`,`hit_id`),
  KEY `hit_id` (`hit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_events_collected`
--

LOCK TABLES `cms_stat_events_collected` WRITE;
/*!40000 ALTER TABLE `cms_stat_events_collected` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_events_collected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_events_rel`
--

DROP TABLE IF EXISTS `cms_stat_events_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_events_rel` (
  `metaevent_id` int(11) unsigned DEFAULT NULL,
  `event_id` int(11) unsigned DEFAULT NULL,
  UNIQUE KEY `metaevent_id` (`metaevent_id`,`event_id`),
  KEY `event_id` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_events_rel`
--

LOCK TABLES `cms_stat_events_rel` WRITE;
/*!40000 ALTER TABLE `cms_stat_events_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_events_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_events_urls`
--

DROP TABLE IF EXISTS `cms_stat_events_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_events_urls` (
  `event_id` int(11) unsigned DEFAULT NULL,
  `page_id` int(11) unsigned DEFAULT NULL,
  UNIQUE KEY `event_id` (`event_id`,`page_id`),
  KEY `page_id` (`page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_events_urls`
--

LOCK TABLES `cms_stat_events_urls` WRITE;
/*!40000 ALTER TABLE `cms_stat_events_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_events_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_finders`
--

DROP TABLE IF EXISTS `cms_stat_finders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_finders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bot_name` text,
  `pattern` text,
  `alias` text,
  `domain` text,
  `utf` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_finders`
--

LOCK TABLES `cms_stat_finders` WRITE;
/*!40000 ALTER TABLE `cms_stat_finders` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_finders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_hits`
--

DROP TABLE IF EXISTS `cms_stat_hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_hits` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `hour` tinyint(8) DEFAULT NULL,
  `day_of_week` tinyint(1) DEFAULT NULL,
  `day` tinyint(4) DEFAULT NULL,
  `month` tinyint(4) DEFAULT NULL,
  `year` int(11) unsigned DEFAULT NULL,
  `path_id` int(11) unsigned DEFAULT NULL,
  `number_in_path` int(11) unsigned DEFAULT NULL,
  `week` tinyint(4) unsigned DEFAULT NULL,
  `prev_page_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `day_of_week` (`day_of_week`),
  KEY `date` (`date`,`day_of_week`,`day`,`month`),
  KEY `day` (`day`,`month`,`date`,`day_of_week`),
  KEY `page_id` (`page_id`,`date`),
  KEY `date_level` (`date`,`number_in_path`),
  KEY `date_prev_page_level` (`date`,`prev_page_id`,`number_in_path`),
  KEY `path_id_level` (`path_id`,`number_in_path`,`prev_page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_hits`
--

LOCK TABLES `cms_stat_hits` WRITE;
/*!40000 ALTER TABLE `cms_stat_hits` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_hits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_holidays`
--

DROP TABLE IF EXISTS `cms_stat_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_holidays` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  `day` tinyint(2) DEFAULT NULL,
  `month` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `day_month` (`day`,`month`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_holidays`
--

LOCK TABLES `cms_stat_holidays` WRITE;
/*!40000 ALTER TABLE `cms_stat_holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_pages`
--

DROP TABLE IF EXISTS `cms_stat_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uri` text,
  `host_id` int(11) unsigned DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `section` (`section`),
  KEY `uri` (`uri`(4)),
  KEY `host_id` (`host_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_pages`
--

LOCK TABLES `cms_stat_pages` WRITE;
/*!40000 ALTER TABLE `cms_stat_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_paths`
--

DROP TABLE IF EXISTS `cms_stat_paths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_paths` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `source_id` int(11) unsigned DEFAULT NULL,
  `host_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `source_id` (`source_id`),
  KEY `user_id` (`user_id`),
  KEY `id_host` (`id`,`host_id`),
  KEY `date_host_id` (`date`,`host_id`,`user_id`),
  KEY `host_id` (`host_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_paths`
--

LOCK TABLES `cms_stat_paths` WRITE;
/*!40000 ALTER TABLE `cms_stat_paths` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_paths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_phrases`
--

DROP TABLE IF EXISTS `cms_stat_phrases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_phrases` (
  `phrase` text,
  `domain` text,
  `finder_id` int(11) DEFAULT NULL,
  `entrytime` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_phrases`
--

LOCK TABLES `cms_stat_phrases` WRITE;
/*!40000 ALTER TABLE `cms_stat_phrases` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_phrases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sites`
--

DROP TABLE IF EXISTS `cms_stat_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  `group_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sites`
--

LOCK TABLES `cms_stat_sites` WRITE;
/*!40000 ALTER TABLE `cms_stat_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sites_groups`
--

DROP TABLE IF EXISTS `cms_stat_sites_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_sites_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sites_groups`
--

LOCK TABLES `cms_stat_sites_groups` WRITE;
/*!40000 ALTER TABLE `cms_stat_sites_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sites_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources`
--

DROP TABLE IF EXISTS `cms_stat_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_sources` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `src_type` tinyint(4) unsigned DEFAULT NULL,
  `concrete_src_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `src_type` (`src_type`,`concrete_src_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources`
--

LOCK TABLES `cms_stat_sources` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_coupon`
--

DROP TABLE IF EXISTS `cms_stat_sources_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_sources_coupon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `profit` float(9,2) DEFAULT NULL,
  `descript` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_coupon`
--

LOCK TABLES `cms_stat_sources_coupon` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_coupon_events`
--

DROP TABLE IF EXISTS `cms_stat_sources_coupon_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_sources_coupon_events` (
  `coupon_id` int(11) unsigned DEFAULT NULL,
  `event_id` int(11) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_coupon_events`
--

LOCK TABLES `cms_stat_sources_coupon_events` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_coupon_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_coupon_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_openstat`
--

DROP TABLE IF EXISTS `cms_stat_sources_openstat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_sources_openstat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(11) unsigned DEFAULT '0',
  `campaign_id` int(11) unsigned DEFAULT '0',
  `ad_id` int(11) unsigned DEFAULT NULL,
  `source_id` int(11) unsigned DEFAULT NULL,
  `path_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `source_id` (`source_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_openstat`
--

LOCK TABLES `cms_stat_sources_openstat` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_openstat` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_openstat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_openstat_ad`
--

DROP TABLE IF EXISTS `cms_stat_sources_openstat_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_sources_openstat_ad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_openstat_ad`
--

LOCK TABLES `cms_stat_sources_openstat_ad` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_openstat_ad` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_openstat_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_openstat_campaign`
--

DROP TABLE IF EXISTS `cms_stat_sources_openstat_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_sources_openstat_campaign` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_openstat_campaign`
--

LOCK TABLES `cms_stat_sources_openstat_campaign` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_openstat_campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_openstat_campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_openstat_service`
--

DROP TABLE IF EXISTS `cms_stat_sources_openstat_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_sources_openstat_service` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_openstat_service`
--

LOCK TABLES `cms_stat_sources_openstat_service` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_openstat_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_openstat_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_openstat_source`
--

DROP TABLE IF EXISTS `cms_stat_sources_openstat_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_sources_openstat_source` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_openstat_source`
--

LOCK TABLES `cms_stat_sources_openstat_source` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_openstat_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_openstat_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_pr`
--

DROP TABLE IF EXISTS `cms_stat_sources_pr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_sources_pr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_pr`
--

LOCK TABLES `cms_stat_sources_pr` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_pr` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_pr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_pr_events`
--

DROP TABLE IF EXISTS `cms_stat_sources_pr_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_sources_pr_events` (
  `pr_id` int(11) unsigned DEFAULT NULL,
  `event_id` int(11) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_pr_events`
--

LOCK TABLES `cms_stat_sources_pr_events` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_pr_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_pr_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_pr_sites`
--

DROP TABLE IF EXISTS `cms_stat_sources_pr_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_sources_pr_sites` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pr_id` int(11) unsigned DEFAULT NULL,
  `url` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_pr_sites`
--

LOCK TABLES `cms_stat_sources_pr_sites` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_pr_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_pr_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_search`
--

DROP TABLE IF EXISTS `cms_stat_sources_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_sources_search` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `engine_id` int(11) unsigned DEFAULT NULL,
  `text_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `engine_id` (`engine_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_search`
--

LOCK TABLES `cms_stat_sources_search` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_search_engines`
--

DROP TABLE IF EXISTS `cms_stat_sources_search_engines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_sources_search_engines` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  `url_mask` char(255) DEFAULT NULL,
  `varname` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_search_engines`
--

LOCK TABLES `cms_stat_sources_search_engines` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_search_engines` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_search_engines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_search_queries`
--

DROP TABLE IF EXISTS `cms_stat_sources_search_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_sources_search_queries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_search_queries`
--

LOCK TABLES `cms_stat_sources_search_queries` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_search_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_search_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_sites`
--

DROP TABLE IF EXISTS `cms_stat_sources_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_sources_sites` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uri` text,
  `domain` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `domain` (`domain`),
  KEY `uri` (`uri`(255)),
  KEY `id_domain` (`id`,`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_sites`
--

LOCK TABLES `cms_stat_sources_sites` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_sites_domains`
--

DROP TABLE IF EXISTS `cms_stat_sources_sites_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_sources_sites_domains` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_sites_domains`
--

LOCK TABLES `cms_stat_sources_sites_domains` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_sites_domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_sites_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_ticket`
--

DROP TABLE IF EXISTS `cms_stat_sources_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_sources_ticket` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_ticket`
--

LOCK TABLES `cms_stat_sources_ticket` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_users`
--

DROP TABLE IF EXISTS `cms_stat_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(32) DEFAULT NULL,
  `first_visit` datetime DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `os_id` int(11) unsigned DEFAULT NULL,
  `browser_id` int(11) unsigned DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `location` text,
  `js_version` varchar(5) DEFAULT NULL,
  `host_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `first_visit` (`first_visit`),
  KEY `session_id` (`session_id`),
  KEY `host_id` (`host_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_users`
--

LOCK TABLES `cms_stat_users` WRITE;
/*!40000 ALTER TABLE `cms_stat_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_users_browsers`
--

DROP TABLE IF EXISTS `cms_stat_users_browsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_users_browsers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_users_browsers`
--

LOCK TABLES `cms_stat_users_browsers` WRITE;
/*!40000 ALTER TABLE `cms_stat_users_browsers` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_users_browsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_users_os`
--

DROP TABLE IF EXISTS `cms_stat_users_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stat_users_os` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_users_os`
--

LOCK TABLES `cms_stat_users_os` WRITE;
/*!40000 ALTER TABLE `cms_stat_users_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_users_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umi_event_feeds`
--

DROP TABLE IF EXISTS `umi_event_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umi_event_feeds` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` bigint(20) DEFAULT NULL,
  `params` mediumtext,
  `type_id` varchar(255) NOT NULL,
  `element_id` int(11) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umi_event_feeds`
--

LOCK TABLES `umi_event_feeds` WRITE;
/*!40000 ALTER TABLE `umi_event_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `umi_event_feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umi_event_types`
--

DROP TABLE IF EXISTS `umi_event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umi_event_types` (
  `id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umi_event_types`
--

LOCK TABLES `umi_event_types` WRITE;
/*!40000 ALTER TABLE `umi_event_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `umi_event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umi_event_user_history`
--

DROP TABLE IF EXISTS `umi_event_user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umi_event_user_history` (
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umi_event_user_history`
--

LOCK TABLES `umi_event_user_history` WRITE;
/*!40000 ALTER TABLE `umi_event_user_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `umi_event_user_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umi_event_users`
--

DROP TABLE IF EXISTS `umi_event_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umi_event_users` (
  `id` int(11) unsigned NOT NULL,
  `last_check_in` bigint(20) DEFAULT NULL,
  `settings` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umi_event_users`
--

LOCK TABLES `umi_event_users` WRITE;
/*!40000 ALTER TABLE `umi_event_users` DISABLE KEYS */;
INSERT INTO `umi_event_users` VALUES (182,1577272566,'a:0:{}');
/*!40000 ALTER TABLE `umi_event_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-16  9:44:45
