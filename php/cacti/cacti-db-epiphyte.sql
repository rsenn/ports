-- MySQL dump 10.10
--
-- Host: localhost    Database: cacti
-- ------------------------------------------------------
-- Server version	5.0.19-log

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
-- Table structure for table `cdef`
--

DROP TABLE IF EXISTS `cdef`;
CREATE TABLE `cdef` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) collate latin1_german1_ci NOT NULL default '',
  `name` varchar(255) collate latin1_german1_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `cdef`
--


/*!40000 ALTER TABLE `cdef` DISABLE KEYS */;
LOCK TABLES `cdef` WRITE;
INSERT INTO `cdef` (`id`, `hash`, `name`) VALUES (3,'3d352eed9fa8f7b2791205b3273708c7','Make Stack Negative'),(4,'e961cc8ec04fda6ed4981cf5ad501aa5','Make Per 5 Minutes'),(12,'f1ac79f05f255c02f914c920f1038c54','Total All Data Sources'),(2,'73f95f8b77b5508157d64047342c421e','Turn Bytes into Bits'),(14,'634a23af5e78af0964e8d33b1a4ed26b','Multiply by 1024'),(15,'068984b5ccdfd2048869efae5166f722','Total All Data Sources, Multiply by 1024'),(16,'a7f7e6d11bb12eae5197d1c548dde812','Make Per Hour'),(17,'1f38c0a79903f9ca1b63712745ba0ee0','All Data Sources minus Current'),(18,'48fdcb1670ae6d88a15a48e21a249f78','Upper limit'),(19,'2b5b505b69d4cd999d72826484519d3f','Lower limit');
UNLOCK TABLES;
/*!40000 ALTER TABLE `cdef` ENABLE KEYS */;

--
-- Table structure for table `cdef_items`
--

DROP TABLE IF EXISTS `cdef_items`;
CREATE TABLE `cdef_items` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) collate latin1_german1_ci NOT NULL default '',
  `cdef_id` mediumint(8) unsigned NOT NULL default '0',
  `sequence` mediumint(8) unsigned NOT NULL default '0',
  `type` tinyint(2) NOT NULL default '0',
  `value` varchar(150) collate latin1_german1_ci NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `cdef_id` (`cdef_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `cdef_items`
--


/*!40000 ALTER TABLE `cdef_items` DISABLE KEYS */;
LOCK TABLES `cdef_items` WRITE;
INSERT INTO `cdef_items` (`id`, `hash`, `cdef_id`, `sequence`, `type`, `value`) VALUES (7,'9bbf6b792507bb9bb17d2af0970f9be9',2,1,4,'CURRENT_DATA_SOURCE'),(9,'a4b8eb2c3bf4920a3ef571a7a004be53',2,2,6,'8'),(8,'caa4e023ac2d7b1c4b4c8c4adfd55dfe',2,3,2,'3'),(10,'c888c9fe6b62c26c4bfe23e18991731d',3,1,4,'CURRENT_DATA_SOURCE'),(11,'1e1d0b29a94e08b648c8f053715442a0',3,3,2,'3'),(12,'4355c197998c7f8b285be7821ddc6da4',3,2,6,'-1'),(13,'40bb7a1143b0f2e2efca14eb356236de',4,1,4,'CURRENT_DATA_SOURCE'),(14,'42686ea0925c0220924b7d333599cd67',4,3,2,'3'),(15,'faf1b148b2c0e0527362ed5b8ca1d351',4,2,6,'300'),(16,'0ef6b8a42dc83b4e43e437960fccd2ea',12,1,4,'ALL_DATA_SOURCES_NODUPS'),(18,'86370cfa0008fe8c56b28be80ee39a40',14,1,4,'CURRENT_DATA_SOURCE'),(19,'9a35cc60d47691af37f6fddf02064e20',14,2,6,'1024'),(20,'5d7a7941ec0440b257e5598a27dd1688',14,3,2,'3'),(21,'44fd595c60539ff0f5817731d9f43a85',15,1,4,'ALL_DATA_SOURCES_NODUPS'),(22,'aa38be265e5ac31783e57ce6f9314e9a',15,2,6,'1024'),(23,'204423d4b2598f1f7252eea19458345c',15,3,2,'3'),(24,'88ba50a94859b764febf242444a2c2de',16,1,4,'CURRENT_DATA_SOURCE'),(25,'b9c67144b4f2854091ff1f6ee88c624d',16,3,2,'3'),(26,'c91277683daf219d577b0137c5251b8f',16,2,6,'300'),(27,'b5a24572bace6697e8666fdecb64af7e',17,1,4,'ALL_DATA_SOURCES_NODUPS'),(28,'461ea961bb47be55987d1c4bef8f2203',17,2,4,'CURRENT_DATA_SOURCE'),(29,'463fbfc6dab00bea83df12393a93457c',17,3,2,'2'),(30,'efb3942d6fef897ba3e091bacd94af76',18,1,4,'CURRENT_GRAPH_MAXIMUM_VALUE'),(31,'c1fe5f969c3a46a7ad83ec4e71bb9e1e',19,1,4,'CURRENT_GRAPH_MINIMUM_VALUE');
UNLOCK TABLES;
/*!40000 ALTER TABLE `cdef_items` ENABLE KEYS */;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
CREATE TABLE `colors` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hex` varchar(6) collate latin1_german1_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `colors`
--


/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
LOCK TABLES `colors` WRITE;
INSERT INTO `colors` (`id`, `hex`) VALUES (1,'000000'),(2,'FFFFFF'),(4,'FAFD9E'),(5,'C0C0C0'),(6,'74C366'),(7,'6DC8FE'),(8,'EA8F00'),(9,'FF0000'),(10,'4444FF'),(11,'FF00FF'),(12,'00FF00'),(13,'8D85F3'),(14,'AD3B6E'),(15,'EACC00'),(16,'12B3B5'),(17,'157419'),(18,'C4FD3D'),(19,'817C4E'),(20,'002A97'),(21,'0000FF'),(22,'00CF00'),(24,'F9FD5F'),(25,'FFF200'),(26,'CCBB00'),(27,'837C04'),(28,'EAAF00'),(29,'FFD660'),(30,'FFC73B'),(31,'FFAB00'),(33,'FF7D00'),(34,'ED7600'),(35,'FF5700'),(36,'EE5019'),(37,'B1441E'),(38,'FFC3C0'),(39,'FF897C'),(40,'FF6044'),(41,'FF4105'),(42,'DA4725'),(43,'942D0C'),(44,'FF3932'),(45,'862F2F'),(46,'FF5576'),(47,'562B29'),(48,'F51D30'),(49,'DE0056'),(50,'ED5394'),(51,'B90054'),(52,'8F005C'),(53,'F24AC8'),(54,'E8CDEF'),(55,'D8ACE0'),(56,'A150AA'),(57,'750F7D'),(58,'8D00BA'),(59,'623465'),(60,'55009D'),(61,'3D168B'),(62,'311F4E'),(63,'D2D8F9'),(64,'9FA4EE'),(65,'6557D0'),(66,'4123A1'),(67,'4668E4'),(68,'0D006A'),(69,'00004D'),(70,'001D61'),(71,'00234B'),(72,'002A8F'),(73,'2175D9'),(74,'7CB3F1'),(75,'005199'),(76,'004359'),(77,'00A0C1'),(78,'007283'),(79,'00BED9'),(80,'AFECED'),(81,'55D6D3'),(82,'00BBB4'),(83,'009485'),(84,'005D57'),(85,'008A77'),(86,'008A6D'),(87,'00B99B'),(88,'009F67'),(89,'00694A'),(90,'00A348'),(91,'00BF47'),(92,'96E78A'),(93,'00BD27'),(94,'35962B'),(95,'7EE600'),(96,'6EA100'),(97,'CAF100'),(98,'F5F800'),(99,'CDCFC4'),(100,'BCBEB3'),(101,'AAABA1'),(102,'8F9286'),(103,'797C6E'),(104,'2E3127');
UNLOCK TABLES;
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;

--
-- Table structure for table `data_input`
--

DROP TABLE IF EXISTS `data_input`;
CREATE TABLE `data_input` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) collate latin1_german1_ci NOT NULL default '',
  `name` varchar(200) collate latin1_german1_ci NOT NULL default '',
  `input_string` varchar(255) collate latin1_german1_ci default NULL,
  `type_id` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `data_input`
--


/*!40000 ALTER TABLE `data_input` DISABLE KEYS */;
LOCK TABLES `data_input` WRITE;
INSERT INTO `data_input` (`id`, `hash`, `name`, `input_string`, `type_id`) VALUES (1,'3eb92bb845b9660a7445cf9740726522','Get SNMP Data','',2),(2,'bf566c869ac6443b0c75d1c32b5a350e','Get SNMP Data (Indexed)','',3),(3,'274f4685461170b9eb1b98d22567ab5e','Unix - Get Free Disk Space','<path_cacti>/scripts/diskfree.sh <partition>',1),(4,'95ed0993eb3095f9920d431ac80f4231','Unix - Get Load Average','perl <path_cacti>/scripts/loadavg_multi.pl',1),(5,'79a284e136bb6b061c6f96ec219ac448','Unix - Get Logged In Users','perl <path_cacti>/scripts/unix_users.pl <username>',1),(6,'362e6d4768937c4f899dd21b91ef0ff8','Linux - Get Memory Usage','perl <path_cacti>/scripts/linux_memory.pl <grepstr>',1),(7,'a637359e0a4287ba43048a5fdf202066','Unix - Get System Processes','perl <path_cacti>/scripts/unix_processes.pl',1),(8,'47d6bfe8be57a45171afd678920bd399','Unix - Get TCP Connections','perl <path_cacti>/scripts/unix_tcp_connections.pl <grepstr>',1),(9,'cc948e4de13f32b6aea45abaadd287a3','Unix - Get Web Hits','perl <path_cacti>/scripts/webhits.pl <log_path>',1),(10,'8bd153aeb06e3ff89efc73f35849a7a0','Unix - Ping Host','perl <path_cacti>/scripts/ping.pl <ip>',1),(11,'80e9e4c4191a5da189ae26d0e237f015','Get Script Data (Indexed)','',4),(12,'332111d8b54ac8ce939af87a7eac0c06','Get Script Server Data (Indexed)','',6),(13,'99e8eca85f19a9c992df32c221d1cb25','MySQL - Show status','@prefix@/bin/sh <path_cacti>/scripts/sql.sh',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `data_input` ENABLE KEYS */;

--
-- Table structure for table `data_input_data`
--

DROP TABLE IF EXISTS `data_input_data`;
CREATE TABLE `data_input_data` (
  `data_input_field_id` mediumint(8) unsigned NOT NULL default '0',
  `data_template_data_id` mediumint(8) unsigned NOT NULL default '0',
  `t_value` char(2) collate latin1_german1_ci default NULL,
  `value` text collate latin1_german1_ci,
  PRIMARY KEY  (`data_input_field_id`,`data_template_data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `data_input_data`
--


/*!40000 ALTER TABLE `data_input_data` DISABLE KEYS */;
LOCK TABLES `data_input_data` WRITE;
INSERT INTO `data_input_data` (`data_input_field_id`, `data_template_data_id`, `t_value`, `value`) VALUES (14,1,'on',''),(13,1,'on',''),(12,1,'on',''),(14,2,'on',''),(13,2,'on',''),(12,2,'on',''),(14,3,'on',''),(13,3,'on',''),(12,3,'on',''),(1,4,'',''),(1,5,'',''),(1,6,'',''),(14,7,'on',''),(13,7,'on',''),(12,7,'on',''),(14,8,'on',''),(13,8,'on',''),(12,8,'on',''),(14,9,'on',''),(13,9,'on',''),(12,9,'on',''),(14,10,'on',''),(13,10,'on',''),(12,10,'on',''),(22,12,'','Buffers:'),(22,13,'','MemFree:'),(22,14,'','^Cached:'),(22,15,'','SwapFree:'),(29,18,'',''),(1,19,'',''),(2,19,'',''),(6,21,'','.1.3.6.1.2.1.25.3.3.1.2.1'),(1,27,'',''),(6,28,'','.1.3.6.1.4.1.9.9.109.1.1.1.1.3.1'),(6,29,'','.1.3.6.1.4.1.9.9.109.1.1.1.1.4.1'),(1,30,'',''),(1,31,'',''),(1,32,'',''),(1,33,'',''),(1,34,'',''),(14,35,'on',''),(13,35,'on',''),(12,35,'on',''),(14,36,'on',''),(13,36,'on',''),(12,36,'on',''),(1,22,'',''),(1,23,'',''),(1,24,'',''),(1,25,'',''),(1,26,'',''),(33,37,'on',''),(32,37,'on',''),(31,37,'on',''),(14,38,'on',''),(13,38,'on',''),(12,38,'on',''),(14,39,'on',''),(13,39,'on',''),(12,39,'on',''),(14,40,'on',''),(13,40,'on',''),(12,40,'on',''),(14,41,'on',''),(13,41,'on',''),(12,41,'on',''),(14,55,'on',''),(13,55,'on',''),(12,55,'on',''),(37,56,'on',''),(36,56,'on',''),(35,56,'on',''),(37,57,'on',''),(36,57,'on',''),(35,57,'on',''),(1,58,'',''),(1,59,'',''),(1,20,'',''),(5,6,'',''),(22,62,NULL,'MemFree:'),(22,63,'','SwapFree:'),(4,6,'',''),(3,6,'',''),(2,6,'',''),(6,69,'on',''),(1,68,'',''),(2,68,'',''),(6,6,'','.1.3.6.1.4.1.2021.11.51.0'),(2,27,'',''),(3,27,'',''),(4,27,'',''),(5,27,'',''),(6,27,'','.1.3.6.1.4.1.9.2.1.58.0'),(2,59,'',''),(3,59,'',''),(4,59,'',''),(5,59,'',''),(6,59,'','.1.3.6.1.2.1.25.1.5.0'),(2,58,'',''),(3,58,'',''),(4,58,'',''),(5,58,'',''),(6,58,'','.1.3.6.1.2.1.25.1.6.0'),(2,24,'',''),(3,24,'',''),(4,24,'',''),(5,24,'',''),(6,24,'','.1.3.6.1.4.1.23.2.28.2.5.0'),(2,25,'',''),(3,25,'',''),(4,25,'',''),(5,25,'',''),(6,25,'','.1.3.6.1.4.1.23.2.28.2.6.0'),(2,22,'',''),(3,22,'',''),(4,22,'',''),(5,22,'',''),(6,22,'','.1.3.6.1.4.1.23.2.28.2.1.0'),(2,23,'',''),(3,23,'',''),(4,23,'',''),(5,23,'',''),(6,23,'','.1.3.6.1.4.1.23.2.28.2.2.0'),(2,26,'',''),(3,26,'',''),(4,26,'',''),(5,26,'',''),(6,26,'','.1.3.6.1.4.1.23.2.28.2.7.0'),(2,20,'',''),(3,20,'',''),(4,20,'',''),(5,20,'',''),(6,20,'','.1.3.6.1.4.1.23.2.28.3.2.0'),(3,19,'',''),(4,19,'',''),(5,19,'',''),(6,19,'','.1.3.6.1.4.1.23.2.28.3.1'),(2,4,'',''),(3,4,'',''),(4,4,'',''),(5,4,'',''),(6,4,'','.1.3.6.1.4.1.2021.11.52.0'),(2,5,'',''),(3,5,'',''),(4,5,'',''),(5,5,'',''),(6,5,'','.1.3.6.1.4.1.2021.11.50.0'),(2,30,'',''),(3,30,'',''),(4,30,'',''),(5,30,'',''),(6,30,'','.1.3.6.1.4.1.2021.10.1.3.1'),(2,32,'',''),(3,32,'',''),(4,32,'',''),(5,32,'',''),(6,32,'','.1.3.6.1.4.1.2021.10.1.3.3'),(2,31,'',''),(3,31,'',''),(4,31,'',''),(5,31,'',''),(6,31,'','.1.3.6.1.4.1.2021.10.1.3.2'),(2,33,'',''),(3,33,'',''),(4,33,'',''),(5,33,'',''),(6,33,'','.1.3.6.1.4.1.2021.4.14.0'),(3,68,'',''),(4,68,'',''),(5,68,'',''),(6,68,'','.1.3.6.1.4.1.2021.4.15.0'),(2,34,'',''),(3,34,'',''),(4,34,'',''),(5,34,'',''),(6,34,'','.1.3.6.1.4.1.2021.4.6.0'),(20,17,'',''),(20,65,NULL,''),(6,70,'on','APACHE2-MIB::totalTraffic.0'),(5,70,'',''),(3,70,'',''),(4,70,'',''),(40,71,'',''),(5,71,'',''),(4,71,'',''),(3,71,'',''),(2,71,'',''),(40,70,'',''),(2,70,'',''),(1,70,'',''),(6,72,'','APACHE2-MIB::busyWorkers.0'),(5,72,'',''),(4,72,'',''),(3,72,'',''),(6,73,'','APACHE2-MIB::idleWorkers.0'),(5,73,'',''),(4,73,'',''),(3,73,'',''),(2,73,'',''),(6,74,'','APACHE2-MIB::serverRequestsPerSec.0'),(5,74,'',''),(4,74,'',''),(3,74,'',''),(2,74,'',''),(1,74,'',''),(40,75,'',''),(6,75,'','APACHE2-MIB::serverKBytesPerSec.0'),(5,75,'',''),(4,75,'',''),(3,75,'',''),(2,75,'',''),(6,76,'','APACHE2-MIB::serverKBytesPerRequest.0'),(5,76,'',''),(4,76,'',''),(3,76,'',''),(6,77,'','APACHE2-MIB::httpError400.0'),(5,77,'',''),(4,77,'',''),(3,77,'',''),(2,77,'',''),(6,78,'','APACHE2-MIB::httpError403.0'),(5,78,'',''),(4,78,'',''),(3,78,'',''),(2,78,'',''),(1,78,'',''),(1,77,'',''),(6,79,'','APACHE2-MIB::httpError404.0'),(5,79,'',''),(4,79,'',''),(6,80,'','APACHE2-MIB::httpError405.0'),(5,80,'',''),(4,80,'',''),(3,80,'',''),(2,80,'',''),(6,81,'','APACHE2-MIB::httpError500.0'),(5,81,'',''),(4,81,'',''),(3,81,'',''),(2,81,'',''),(1,81,'',''),(6,82,'','APACHE2-MIB::httpError501.0'),(5,82,'',''),(4,82,'',''),(3,82,'',''),(6,83,'','APACHE2-MIB::httpError505.0'),(5,83,'',''),(4,83,'',''),(3,83,'',''),(2,83,'',''),(1,83,'',''),(1,84,'','127.0.0.1'),(2,84,'','nexbyte'),(3,84,'',''),(4,84,'',''),(5,84,'','1'),(6,84,'','APACHE2-MIB::busyWorkers.0'),(40,84,'','161'),(6,85,NULL,'APACHE2-MIB::idleWorkers.0'),(5,85,NULL,'1'),(4,85,NULL,''),(3,85,NULL,''),(2,85,NULL,'nexbyte'),(1,85,NULL,'127.0.0.1'),(40,85,NULL,'161'),(6,88,'','APACHE2-MIB::totalTraffic.0'),(5,88,NULL,'1'),(4,88,NULL,''),(3,88,NULL,''),(2,88,NULL,'nexbyte'),(1,88,NULL,'127.0.0.1'),(40,88,NULL,'161'),(1,89,NULL,'127.0.0.1'),(2,89,NULL,'nexbyte'),(3,89,NULL,''),(4,89,NULL,''),(5,89,NULL,'1'),(6,89,NULL,'APACHE2-MIB::serverRequestsPerSec.0'),(40,89,NULL,'161'),(1,90,NULL,'127.0.0.1'),(2,90,NULL,'nexbyte'),(3,90,NULL,''),(4,90,NULL,''),(5,90,NULL,'1'),(6,90,NULL,'APACHE2-MIB::serverKBytesPerRequest.0'),(40,90,NULL,'161'),(120,91,'','Threads_created'),(40,74,'',''),(40,83,'',''),(40,82,'',''),(1,82,'',''),(2,82,'',''),(40,81,'',''),(40,79,'',''),(1,80,'',''),(3,79,'',''),(2,79,'',''),(40,78,'',''),(1,76,'',''),(2,76,'',''),(1,73,'',''),(1,72,'',''),(2,72,'',''),(6,71,'','APACHE2-MIB::totalAccess.0'),(40,80,'',''),(1,79,'',''),(1,71,'',''),(120,100,'','Threads_running'),(120,101,'','Threads_connected'),(120,102,'','Threads_cached'),(40,77,'',''),(40,73,'',''),(40,76,'',''),(1,75,'',''),(40,72,'','');
UNLOCK TABLES;
/*!40000 ALTER TABLE `data_input_data` ENABLE KEYS */;

--
-- Table structure for table `data_input_fields`
--

DROP TABLE IF EXISTS `data_input_fields`;
CREATE TABLE `data_input_fields` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) collate latin1_german1_ci NOT NULL default '',
  `data_input_id` mediumint(8) unsigned NOT NULL default '0',
  `name` varchar(200) collate latin1_german1_ci NOT NULL default '',
  `data_name` varchar(50) collate latin1_german1_ci NOT NULL default '',
  `input_output` char(3) collate latin1_german1_ci NOT NULL default '',
  `update_rra` char(2) collate latin1_german1_ci default '0',
  `sequence` smallint(5) NOT NULL default '0',
  `type_code` varchar(40) collate latin1_german1_ci default NULL,
  `regexp_match` varchar(200) collate latin1_german1_ci default NULL,
  `allow_nulls` char(2) collate latin1_german1_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `data_input_id` (`data_input_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `data_input_fields`
--


/*!40000 ALTER TABLE `data_input_fields` DISABLE KEYS */;
LOCK TABLES `data_input_fields` WRITE;
INSERT INTO `data_input_fields` (`id`, `hash`, `data_input_id`, `name`, `data_name`, `input_output`, `update_rra`, `sequence`, `type_code`, `regexp_match`, `allow_nulls`) VALUES (1,'92f5906c8dc0f964b41f4253df582c38',1,'SNMP IP Address','management_ip','in','',0,'hostname','',''),(2,'32285d5bf16e56c478f5e83f32cda9ef',1,'SNMP Community','snmp_community','in','',0,'snmp_community','',''),(3,'ad14ac90641aed388139f6ba86a2e48b',1,'SNMP Username','snmp_username','in','',0,'snmp_username','','on'),(4,'9c55a74bd571b4f00a96fd4b793278c6',1,'SNMP Password','snmp_password','in','',0,'snmp_password','','on'),(5,'012ccb1d3687d3edb29c002ea66e72da',1,'SNMP Version (1, 2, or 3)','snmp_version','in','',0,'snmp_version','','on'),(6,'4276a5ec6e3fe33995129041b1909762',1,'OID','oid','in','',0,'snmp_oid','',''),(7,'617cdc8a230615e59f06f361ef6e7728',2,'SNMP IP Address','management_ip','in','',0,'hostname','',''),(8,'acb449d1451e8a2a655c2c99d31142c7',2,'SNMP Community','snmp_community','in','',0,'snmp_community','',''),(9,'f4facc5e2ca7ebee621f09bc6d9fc792',2,'SNMP Username (v3)','snmp_username','in','',0,'snmp_username','','on'),(10,'1cc1493a6781af2c478fa4de971531cf',2,'SNMP Password (v3)','snmp_password','in','',0,'snmp_password','','on'),(11,'b5c23f246559df38662c255f4aa21d6b',2,'SNMP Version (1, 2, or 3)','snmp_version','in','',0,'snmp_version','',''),(12,'6027a919c7c7731fbe095b6f53ab127b',2,'Index Type','index_type','in','',0,'index_type','',''),(13,'cbbe5c1ddfb264a6e5d509ce1c78c95f',2,'Index Value','index_value','in','',0,'index_value','',''),(14,'e6deda7be0f391399c5130e7c4a48b28',2,'Output Type ID','output_type','in','',0,'output_type','',''),(15,'edfd72783ad02df128ff82fc9324b4b9',3,'Disk Partition','partition','in','',1,'','',''),(16,'8b75fb61d288f0b5fc0bd3056af3689b',3,'Kilobytes Free','kilobytes','out','on',0,'','',''),(17,'363588d49b263d30aecb683c52774f39',4,'1 Minute Average','1min','out','on',0,'','',''),(18,'ad139a9e1d69881da36fca07889abf58',4,'5 Minute Average','5min','out','on',0,'','',''),(19,'5db9fee64824c08258c7ff6f8bc53337',4,'10 Minute Average','10min','out','on',0,'','',''),(20,'c0cfd0beae5e79927c5a360076706820',5,'Username (Optional)','username','in','',1,'','','on'),(21,'52c58ad414d9a2a83b00a7a51be75a53',5,'Logged In Users','users','out','on',0,'','',''),(22,'05eb5d710f0814871b8515845521f8d7',6,'Grep String','grepstr','in','',1,'','',''),(23,'86cb1cbfde66279dbc7f1144f43a3219',6,'Result (in Kilobytes)','kilobytes','out','on',0,'','',''),(24,'d5a8dd5fbe6a5af11667c0039af41386',7,'Number of Processes','proc','out','on',0,'','',''),(25,'8848cdcae831595951a3f6af04eec93b',8,'Grep String','grepstr','in','',1,'','','on'),(26,'3d1288d33008430ce354e8b9c162f7ff',8,'Connections','connections','out','on',0,'','',''),(27,'c6af570bb2ed9c84abf32033702e2860',9,'(Optional) Log Path','log_path','in','',1,'','','on'),(28,'f9389860f5c5340c9b27fca0b4ee5e71',9,'Web Hits','webhits','out','on',0,'','',''),(29,'5fbadb91ad66f203463c1187fe7bd9d5',10,'IP Address','ip','in','',1,'hostname','',''),(30,'6ac4330d123c69067d36a933d105e89a',10,'Milliseconds','out_ms','out','on',0,'','',''),(31,'d39556ecad6166701bfb0e28c5a11108',11,'Index Type','index_type','in','',0,'index_type','',''),(32,'3b7caa46eb809fc238de6ef18b6e10d5',11,'Index Value','index_value','in','',0,'index_value','',''),(33,'74af2e42dc12956c4817c2ef5d9983f9',11,'Output Type ID','output_type','in','',0,'output_type','',''),(34,'8ae57f09f787656bf4ac541e8bd12537',11,'Output Value','output','out','on',0,'','',''),(35,'172b4b0eacee4948c6479f587b62e512',12,'Index Type','index_type','in','',0,'index_type','',''),(36,'30fb5d5bcf3d66bb5abe88596f357c26',12,'Index Value','index_value','in','',0,'index_value','',''),(37,'31112c85ae4ff821d3b288336288818c',12,'Output Type ID','output_type','in','',0,'output_type','',''),(38,'5be8fa85472d89c621790b43510b5043',12,'Output Value','output','out','on',0,'','',''),(39,'c1f36ee60c3dc98945556d57f26e475b',2,'SNMP Port','snmp_port','in','',0,'snmp_port','',''),(40,'fc64b99742ec417cc424dbf8c7692d36',1,'SNMP Port','snmp_port','in','',0,'snmp_port','',''),(43,'561cd582a8a15ea223ed2c616c4dd936',13,'Aborted connects','Aborted_connects','out','on',0,'','',''),(42,'5f447bce02b64d60ef73841e5ee1c13d',13,'Aborted clients','Aborted_clients','out','on',0,'','',''),(44,'bea0cb399e9b05f86b32ef747a871a5d',13,'Binlog cache disk use','Binlog_cache_disk_use','out','on',0,'','',''),(45,'0d28679167d752e81aaddc6b0f6432d2',13,'Binlog cache use','Binlog_cache_use','out','on',0,'','',''),(46,'bf7fc1f1580c1010c58685b71e8bab1b',13,'Connections','Connections','out','on',0,'','',''),(47,'ac20380d54594b2dec82d0d6c046bf2b',13,'Created tmp disk tables','Created_tmp_disk_tables','out','on',0,'','',''),(48,'f3e3535379393d9ae89ed3972c65f9f4',13,'Created tmp files','Created_tmp_files','out','on',0,'','',''),(49,'63981482c6ac3db916b2726bd13b8f16',13,'Created tmp tables','Created_tmp_tables','out','on',0,'','',''),(50,'1431c3cd9d26449e9127142c166f73e3',13,'Delayed errors','Delayed_errors','out','on',0,'','',''),(51,'851cbe9e22472dafcc66480957a0df50',13,'Delayed insert threads','Delayed_insert_threads','out','on',0,'','',''),(53,'424c7ada7c285409bd5c508a01c8cfd0',13,'Delayed writes','Delayed_writes','out','on',0,'','',''),(54,'7c9dda938a3eaf998a386cb33fa89c83',13,'Flush commands','Flush_commands','out','on',0,'','',''),(55,'607d0d65fe11cf16675182c50504b287',13,'Innodb buffer pool pages data','Innodb_buffer_pool_pages_data','out','on',0,'','',''),(56,'86c823bd77dca476eca2210c70541618',13,'Innodb buffer pool pages dirty','Innodb_buffer_pool_pages_dirty','out','on',0,'','',''),(57,'45706745ed532172354020ab6bb0b912',13,'Innodb buffer pool pages flushed','Innodb_buffer_pool_pages_flushed','out','on',0,'','',''),(58,'db6bde3fe010361005048965d2119f5c',13,'Innodb buffer pool pages free','Innodb_buffer_pool_pages_free','out','on',0,'','',''),(59,'152ecedf8592cd9cb4d8b30c207bcc30',13,'Innodb buffer pool pages latched','Innodb_buffer_pool_pages_latched','out','on',0,'','',''),(60,'3c258fd26e6b23581f31d832df93d277',13,'Innodb buffer pool pages misc','Innodb_buffer_pool_pages_misc','out','on',0,'','',''),(61,'bd11c53942bc57a409a74dbd060d2474',13,'Innodb buffer pool pages total','Innodb_buffer_pool_pages_total','out','on',0,'','',''),(62,'c9df3367a98f4ff17fc85dbfdd91ed66',13,'Innodb buffer pool read ahead rnd','Innodb_buffer_pool_read_ahead_rnd','out','on',0,'','',''),(63,'8650e6ad18f2dc6699d8246baf4aef70',13,'Innodb buffer pool read ahead seq','Innodb_buffer_pool_read_ahead_seq','out','on',0,'','',''),(64,'f2c4de4c6af22ea846cfa22ae3817dc7',13,'Innodb buffer pool read requests','Innodb_buffer_pool_read_requests','out','on',0,'','',''),(65,'2ba619e35c3373392b333bcb859c216f',13,'Innodb buffer pool reads','Innodb_buffer_pool_reads','out','on',0,'','',''),(75,'49167f273c5700552de9b399892a0dd1',13,'Innodb data written','Innodb_data_written','out','on',0,'','',''),(67,'20faaf60892995c9acc9772ce30feaac',13,'Innodb buffer pool write requests','Innodb_buffer_pool_write_requests','out','on',0,'','',''),(68,'9896f81e2eeed2bce6045fdd9863afa8',13,'Innodb data fsyncs','Innodb_data_fsyncs','out','on',0,'','',''),(74,'c5be652fa4285f973dee948a8873f810',13,'Innodb data writes','Innodb_data_writes','out','on',0,'','',''),(73,'819a4b48b603408b38a25c962f8534cd',13,'Innodb data reads','Innodb_data_reads','out','on',0,'','',''),(72,'1a0707ab78106ecf14745ee3b79158fc',13,'Innodb data read','Innodb_data_read','out','on',0,'','',''),(76,'ace1480ec331e041907d3f807b3e3fa2',13,'Innodb dblwr pages written','Innodb_dblwr_pages_written','out','on',0,'','',''),(77,'b5d8b30e8e971f7e80b0c022d4f36868',13,'Innodb dblwr writes','Innodb_dblwr_writes','out','on',0,'','',''),(78,'8b62382673be8995eca606a82f42a803',13,'Innodb log write requests','Innodb_log_write_requests','out','on',0,'','',''),(79,'1715ded0da167836a811deb8c91fac41',13,'Innodb log writes','Innodb_log_writes','out','on',0,'','',''),(80,'353e99ebe43d11d5eed73f26d8f87a5e',13,'Innodb os log fsyncs','Innodb_os_log_fsyncs','out','on',0,'','',''),(81,'efbb7c288cdbf136afeae2d379489ccd',13,'Innodb os log written','Innodb_os_log_written','out','on',0,'','',''),(82,'f41f32cbafd37448c252f0be13b16562',13,'Innodb page size','Innodb_page_size','out','on',0,'','',''),(83,'139af2949fd60b72401148bf45c8fa79',13,'Innodb pages created','Innodb_pages_created','out','on',0,'','',''),(84,'86b54ea2ff1de629400964324b3514e5',13,'Innodb pages read','Innodb_pages_read','out','on',0,'','',''),(85,'860cfced431a3f17da7b5d8a2f290182',13,'Innodb pages written','Innodb_pages_written','out','on',0,'','',''),(86,'494f6fda5722caf16518b128ad514f4b',13,'Innodb row lock time','Innodb_row_lock_time','out','on',0,'','',''),(87,'b86ecd4f9b21b63893c42cc961745dfb',13,'Innodb row lock time avg','Innodb_row_lock_time_avg','out','on',0,'','',''),(88,'3b5254dd7d50b51d2f9f0a387a0a54a4',13,'Innodb row lock time max','Innodb_row_lock_time_max','out','on',0,'','',''),(89,'8657234ae1eabce15126386fe1472703',13,'Innodb row lock waits','Innodb_row_lock_waits','out','on',0,'','',''),(90,'eb28cca729d7d862239f85b263126120',13,'Innodb rows deleted','Innodb_rows_deleted','out','on',0,'','',''),(91,'ae82b50657a6d7a401f4ccb263bb7fa2',13,'Innodb rows inserted','Innodb_rows_inserted','out','on',0,'','',''),(92,'cc5640b66efa5a031a70195e6458cff6',13,'Innodb rows read','Innodb_rows_read','out','on',0,'','',''),(93,'2d0f2650c7a9686b324370ac612a8c2d',13,'Innodb rows updated','Innodb_rows_updated','out','on',0,'','',''),(94,'73f2a01123a34661073d55d5b67de184',13,'Key blocks unused','Key_blocks_unused','out','on',0,'','',''),(95,'ecbc3a7aabef9bace8a5f34c110147ac',13,'Key blocks used','Key_blocks_used','out','on',0,'','',''),(96,'5ba3c40d6ad7f4a8f8a1414eeb0f6323',13,'Key read requests','Key_read_requests','out','on',0,'','',''),(97,'d7b40a4f373f0654396a3e81ad416c52',13,'Key reads','Key_reads','out','on',0,'','',''),(98,'1648a45f58115efb4b84de2918638d18',13,'Key write requests','Key_write_requests','out','on',0,'','',''),(99,'ec6870860c9527ce511401527448602c',13,'Key writes','Key_writes','out','on',0,'','',''),(100,'3c5794f65c28f37e251ea3e7e602d0c8',13,'Max used connections','Max_used_connections','out','on',0,'','',''),(101,'e9740d8e40b521fa1cb08bfa055804b7',13,'Open files','Open_files','out','on',0,'','',''),(102,'da8c664ca425b315ffa6f1922258dace',13,'Open streams','Open_streams','out','on',0,'','',''),(103,'f67ef65f65c0c7a6004de4ce94d7520e',13,'Open tables','Open_tables','out','on',0,'','',''),(104,'6da218a6638c0f769d3959c8c4fc516a',13,'Opened tables','Opened_tables','out','on',0,'','',''),(105,'83707e698be73c97340f141ad46b99e4',13,'Qcache free blocks','Qcache_free_blocks','out','on',0,'','',''),(106,'66c4e387e69aa55415bc8fec98062e56',13,'Qcache free memory','Qcache_free_memory','out','on',0,'','',''),(107,'c66e70e5bed09383205a8c43b7a83766',13,'Qcache hits','Qcache_hits','out','on',0,'','',''),(108,'d84aa106a806d1ce5c7b986378804fe3',13,'Qcache inserts','Qcache_inserts','out','on',0,'','',''),(109,'09fd5cdee492f2dbf55b0313c65de24a',13,'Qcache lowmem prunes','Qcache_lowmem_prunes','out','on',0,'','',''),(110,'024c98fd8823e57bee2e9ab1e01cf4da',13,'Qcache not cached','Qcache_not_cached','out','on',0,'','',''),(111,'cdcb2466d6af107953b11899e3133fdb',13,'Qcache queries in cache','Qcache_queries_in_cache','out','on',0,'','',''),(112,'d204fe0f735ff09467819d962fa8a8d2',13,'Qcache total blocks','Qcache_total_blocks','out','on',0,'','',''),(113,'68df6f27f9e44da9f00477826567bfc4',13,'Questions','Questions','out','on',0,'','',''),(114,'337dddeed14d68ef89fe425ad9ac2806',13,'Table locks immediate','Table_locks_immediate','out','on',0,'','',''),(115,'ab38f9f5fa4672be3d82fca6569d4f2c',13,'Threads cached','Threads_cached','out','on',0,'','',''),(116,'db222b7bfc9129c4130fb7097bba5645',13,'Threads connected','Threads_connected','out','on',0,'','',''),(117,'1c428319cb389eb188510cdb766ccfc6',13,'Threads created','Threads_created','out','on',0,'','',''),(118,'8911b75438b47c97a5ed3490c61b6fc6',13,'Threads running','Threads_running','out','on',0,'','',''),(119,'48dbbdb7fa1e41a015f36ef4adfbaf7b',13,'Uptime','Uptime','out','on',0,'','',''),(124,'25eefa840dc72354d4e7a729dc2604a3',13,'Slow launch threads','Slow_launch_threads','out','on',0,'','',''),(122,'ca98d903246bd2d2db14b015f6544cbc',13,'Slave open temp tables','Slave_open_temp_tables','out','on',0,'','',''),(123,'415b8c45bc5c6f63319587482d57031c',13,'Table locks waited','Table_locks_waited','out','on',0,'','',''),(125,'3979bb24fd42f4b576531b35d091d843',15,'Orders','orders','out','on',0,'','',''),(126,'7526c29b828d2e2fca84138de09929e8',15,'Stamps','stamps','out','on',0,'','',''),(127,'5c12dbb04b3a4190b3f2086fc56c7c73',15,'Users','users','out','on',0,'','','');
UNLOCK TABLES;
/*!40000 ALTER TABLE `data_input_fields` ENABLE KEYS */;

--
-- Table structure for table `data_local`
--

DROP TABLE IF EXISTS `data_local`;
CREATE TABLE `data_local` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `data_template_id` mediumint(8) unsigned NOT NULL default '0',
  `host_id` mediumint(8) unsigned NOT NULL default '0',
  `snmp_query_id` mediumint(8) NOT NULL default '0',
  `snmp_index` varchar(255) collate latin1_german1_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `data_local`
--


/*!40000 ALTER TABLE `data_local` DISABLE KEYS */;
LOCK TABLES `data_local` WRITE;
INSERT INTO `data_local` (`id`, `data_template_id`, `host_id`, `snmp_query_id`, `snmp_index`) VALUES (3,13,1,0,''),(4,15,1,0,''),(5,11,1,0,''),(6,17,1,0,''),(7,16,1,0,''),(8,51,2,0,''),(9,52,2,0,''),(38,75,3,0,''),(12,49,2,0,''),(13,53,2,0,''),(14,55,2,0,''),(36,74,3,0,''),(35,73,3,0,''),(34,70,3,0,''),(33,68,3,0,''),(39,78,3,0,''),(42,79,5,0,''),(43,80,5,0,'');
UNLOCK TABLES;
/*!40000 ALTER TABLE `data_local` ENABLE KEYS */;

--
-- Table structure for table `data_template`
--

DROP TABLE IF EXISTS `data_template`;
CREATE TABLE `data_template` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) collate latin1_german1_ci NOT NULL default '',
  `name` varchar(150) collate latin1_german1_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `data_template`
--


/*!40000 ALTER TABLE `data_template` DISABLE KEYS */;
LOCK TABLES `data_template` WRITE;
INSERT INTO `data_template` (`id`, `hash`, `name`) VALUES (3,'c8a8f50f5f4a465368222594c5709ede','ucd/net - Hard Drive Space'),(4,'cdfed2d401723d2f41fc239d4ce249c7','ucd/net - CPU Usage - System'),(5,'a27e816377d2ac6434a87c494559c726','ucd/net - CPU Usage - User'),(6,'c06c3d20eccb9598939dc597701ff574','ucd/net - CPU Usage - Nice'),(7,'a14f2d6f233b05e64263ff03a5b0b386','Karlnet - Noise Level'),(8,'def1a9019d888ed2ad2e106aa9595ede','Karlnet - Signal Level'),(9,'513a99ae3c9c4413609c1534ffc36eab','Karlnet - Wireless Transmits'),(10,'77404ae93c9cc410f1c2c717e7117378','Karlnet - Wireless Re-Transmits'),(11,'9e72511e127de200733eb502eb818e1d','Unix - Load Average'),(13,'dc33aa9a8e71fb7c61ec0e7a6da074aa','Linux - Memory - Free'),(15,'41f55087d067142d702dd3c73c98f020','Linux - Memory - Free Swap'),(16,'9b8c92d3c32703900ff7dd653bfc9cd8','Unix - Processes'),(17,'c221c2164c585b6da378013a7a6a2c13','Unix - Logged in Users'),(18,'a30a81cb1de65b52b7da542c8df3f188','Unix - Ping Host'),(19,'0de466a1b81dfe581d44ac014b86553a','Netware - Total Users'),(20,'bbe2da0708103029fbf949817d3a4537','Netware - Total Logins'),(45,'f383db441d1c246cff8482f15e184e5f','Host MIB - Processes'),(22,'e4ac5d5fe73e3c773671c6d0498a8d9d','Netware - File System Reads'),(23,'f29f8c998425eedd249be1e7caf90ceb','Netware - File System Writes'),(24,'7a6216a113e19881e35565312db8a371','Netware - Cache Checks'),(25,'1dbd1251c8e94b334c0e6aeae5ca4b8d','Netware - Cache Hits'),(26,'1a4c5264eb27b5e57acd3160af770a61','Netware - Open Files'),(27,'e9def3a0e409f517cb804dfeba4ccd90','Cisco Router - 5 Minute CPU'),(35,'6ce4ab04378f9f3b03ee0623abb6479f','Netware - Volumes'),(30,'9b82d44eb563027659683765f92c9757','ucd/net - Load Average - 1 Minute'),(31,'87847714d19f405ff3c74f3341b3f940','ucd/net - Load Average - 5 Minute'),(32,'308ac157f24e2763f8cd828a80b3e5ff','ucd/net - Load Average - 15 Minute'),(33,'797a3e92b0039841b52e441a2823a6fb','ucd/net - Memory - Buffers'),(34,'fa15932d3cab0da2ab94c69b1a9f5ca7','ucd/net - Memory - Free'),(36,'03060555fab086b8412bbf9951179cd9','Netware - Directory Entries'),(37,'e4ac6919d4f6f21ec5b281a1d6ac4d4e','Unix - Hard Drive Space'),(38,'36335cd98633963a575b70639cd2fdad','Interface - Errors/Discards'),(39,'2f654f7d69ac71a5d56b1db8543ccad3','Interface - Unicast Packets'),(40,'c84e511401a747409053c90ba910d0fe','Interface - Non-Unicast Packets'),(41,'6632e1e0b58a565c135d7ff90440c335','Interface - Traffic'),(42,'1d17325f416b262921a0b55fe5f7e31d','Netware - CPU Utilization'),(43,'d814fa3b79bd0f8933b6e0834d3f16d0','Host MIB - Hard Drive Space'),(44,'f6e7d21c19434666bbdac00ccef9932f','Host MIB - CPU Utilization'),(46,'2ef027cc76d75720ee5f7a528f0f1fda','Host MIB - Logged in Users'),(48,'d429e4a6019c91e6e84562593c1968ca','SNMP - Generic OID Template'),(47,'a274deec1f78654dca6c446ba75ebca4','ucd/net - Memory - Cache'),(49,'aa8043c78e160d92abb158d9da5b6c66','Apache2 - Total traffic'),(50,'355fffbde3f87ff2789e8005a84942b2','Apache2 - Total access count'),(51,'d239bba638727a4732533eaf2b2b3c58','Apache2 - Busy worker threads'),(52,'aa4b0eb860d4766e39cec3275c7f708a','Apache2 - Idle worker threads'),(53,'a20c3d4d2e4fec284e23dc90c688169d','Apache2 - Requests per second'),(54,'2fb250c57c13955b85e7f410592c912e','Apache2 - kBytes per second'),(55,'7ff4d7a2e312ac5742033213a0ce85c9','Apache2 - kBytes per request'),(56,'6770b72d3ed38ca556658e4d4acb757f','Apache2 - Number of HTTP 400 errors'),(57,'d12a27be33392f290b1681bd92d217f5','Apache2 - Number of HTTP 403 errors'),(58,'111521da8d29d6de178443f6c6ec52a6','Apache2 - Number of HTTP 404 errors'),(59,'4aa473805d01cd90aced625f5e114094','Apache2 - Number of HTTP 405 errors'),(60,'a46fd00ea20a2f4bd431456104dc3689','Apache2 - Number of HTTP 500 errors'),(61,'5ea634c8308fa3ca564132d5e4b8a5c3','Apache2 - Number of HTTP 501 errors'),(62,'ef6cebc485234501e3853db3f2c5baa6','Apache2 - Number of HTTP 505 errors'),(74,'75bfca1d571c06b8679acb789b8b6dad','MySQL - Query cache ressources'),(73,'38b804ceed8e1deb4c6452a80b6e3b54','MySQL - Query cache performance'),(79,'d8b7651fac8b929043b5eb8df7d7dd9f','WebStamp - Statistics'),(67,'5afd2f9e23084efe4603fa35c702b6bf','MySQL - Threads'),(68,'fc93e2c8c83d6e06c4cec436b926fcee','MySQL - Keys'),(69,'817dadf0cca92a4e4913e74e61579ec4','MySQL - Files'),(70,'9a1b39970d97e23727a1aefb56ec993b','MySQL - Tables'),(71,'e729072b0ccf4597dcd23021d6a916e7','MySQL - Temporary ressources'),(72,'70ac06458d7d2f81cbbd434d72b01be2','MySQL - Table locks'),(75,'5e8c3548a4864665882a496771641cb3','MySQL - Counters'),(76,'cf5d599a469e2ac65742016f83af417a','MySQL - InnoDB queries'),(77,'522bd9bb7f53542130ef28aaa30a4150','MySQL - InnoDB I/O operations'),(78,'7be8f0f450dfad6256d510c8d8f72a86','MySQL - InnoDB I/O bandwidth'),(80,'5aac613d77c520c0282181307d767bf0','WebStamp - Overall Counts');
UNLOCK TABLES;
/*!40000 ALTER TABLE `data_template` ENABLE KEYS */;

--
-- Table structure for table `data_template_data`
--

DROP TABLE IF EXISTS `data_template_data`;
CREATE TABLE `data_template_data` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `local_data_template_data_id` mediumint(8) unsigned NOT NULL default '0',
  `local_data_id` mediumint(8) unsigned NOT NULL default '0',
  `data_template_id` mediumint(8) unsigned NOT NULL default '0',
  `data_input_id` mediumint(8) unsigned NOT NULL default '0',
  `t_name` char(2) collate latin1_german1_ci default NULL,
  `name` varchar(250) collate latin1_german1_ci NOT NULL default '',
  `name_cache` varchar(255) collate latin1_german1_ci NOT NULL default '',
  `data_source_path` varchar(255) collate latin1_german1_ci default NULL,
  `t_active` char(2) collate latin1_german1_ci default NULL,
  `active` char(2) collate latin1_german1_ci default NULL,
  `t_rrd_step` char(2) collate latin1_german1_ci default NULL,
  `rrd_step` mediumint(8) unsigned NOT NULL default '0',
  `t_rra_id` char(2) collate latin1_german1_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `local_data_id` (`local_data_id`),
  KEY `data_template_id` (`data_template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `data_template_data`
--


/*!40000 ALTER TABLE `data_template_data` DISABLE KEYS */;
LOCK TABLES `data_template_data` WRITE;
INSERT INTO `data_template_data` (`id`, `local_data_template_data_id`, `local_data_id`, `data_template_id`, `data_input_id`, `t_name`, `name`, `name_cache`, `data_source_path`, `t_active`, `active`, `t_rrd_step`, `rrd_step`, `t_rra_id`) VALUES (3,0,0,3,2,'on','|host_description| - Hard Drive Space','',NULL,'','on','',300,''),(4,0,0,4,1,'','|host_description| - CPU Usage - System','',NULL,'','on','',300,''),(5,0,0,5,1,'','|host_description| - CPU Usage - User','',NULL,'','on','',300,''),(6,0,0,6,1,'','|host_description| - CPU Usage - Nice','',NULL,'','on','',300,''),(7,0,0,7,2,'on','|host_description| - Noise Level','',NULL,'','on','',300,''),(8,0,0,8,2,'on','|host_description| - Signal Level','',NULL,'','on','',300,''),(9,0,0,9,2,'on','|host_description| - Wireless Transmits','',NULL,'','on','',300,''),(10,0,0,10,2,'on','|host_description| - Wireless Re-Transmits','',NULL,'','on','',300,''),(11,0,0,11,4,'','|host_description| - Load Average','',NULL,'','on','',300,''),(13,0,0,13,6,'','|host_description| - Memory - Free','',NULL,'','on','',300,''),(15,0,0,15,6,'','|host_description| - Memory - Free Swap','',NULL,'','on','',300,''),(16,0,0,16,7,'','|host_description| - Processes','',NULL,'','on','',300,''),(17,0,0,17,5,'','|host_description| - Logged in Users','',NULL,'','on','',300,''),(18,0,0,18,10,'','|host_description| - Ping Host','',NULL,'','on','',300,''),(19,0,0,19,1,'','|host_description| - Total Users','',NULL,'','on','',300,''),(20,0,0,20,1,'','|host_description| - Total Logins','',NULL,'','on','',300,''),(58,0,0,45,1,'','|host_description| - Processes','',NULL,'','on','',300,''),(22,0,0,22,1,'','|host_description| - File System Reads','',NULL,'','on','',300,''),(23,0,0,23,1,'','|host_description| - File System Writes','',NULL,'','on','',300,''),(24,0,0,24,1,'','|host_description| - Cache Checks','',NULL,'','on','',300,''),(25,0,0,25,1,'','|host_description| - Cache Hits','',NULL,'','on','',300,''),(26,0,0,26,1,'','|host_description| - Open Files','',NULL,'','on','',300,''),(27,0,0,27,1,'','|host_description| - 5 Minute CPU','',NULL,'','on','',300,''),(69,0,0,48,1,'on','|host_description| -','',NULL,'','on','',300,''),(68,0,0,47,1,'','|host_description| - Memory - Cache','',NULL,'','on','',300,''),(30,0,0,30,1,'','|host_description| - Load Average - 1 Minute','',NULL,'','on','',300,''),(31,0,0,31,1,'','|host_description| - Load Average - 5 Minute','',NULL,'','on','',300,''),(32,0,0,32,1,'','|host_description| - Load Average - 15 Minute','',NULL,'','on','',300,''),(33,0,0,33,1,'','|host_description| - Memory - Buffers','',NULL,'','on','',300,''),(34,0,0,34,1,'','|host_description| - Memory - Free','',NULL,'','on','',300,''),(35,0,0,35,2,'on','|host_description| - Volumes','',NULL,'','on','',300,''),(36,0,0,36,2,'on','|host_description| - Directory Entries','',NULL,'','on','',300,''),(37,0,0,37,11,'on','|host_description| - Hard Drive Space','',NULL,'','on','',300,''),(38,0,0,38,2,'on','|host_description| - Errors/Discards','',NULL,'','on','',300,''),(39,0,0,39,2,'on','|host_description| - Unicast Packets','',NULL,'','on','',300,''),(40,0,0,40,2,'on','|host_description| - Non-Unicast Packets','',NULL,'','on','',300,''),(41,0,0,41,2,'on','|host_description| - Traffic','',NULL,'','on','',300,''),(55,0,0,42,2,'','|host_description| - CPU Utilization','',NULL,'','on','',300,''),(56,0,0,43,12,'','|host_description| - Hard Drive Space','',NULL,'','on','',300,''),(57,0,0,44,12,'','|host_description| - CPU Utilization','',NULL,'','on','',300,''),(59,0,0,46,1,'','|host_description| - Logged in Users','',NULL,'','on','',300,''),(62,13,3,13,6,NULL,'|host_description| - Memory - Free','Localhost - Memory - Free','<path_rra>/localhost_mem_buffers_3.rrd',NULL,'on',NULL,300,NULL),(63,15,4,15,6,NULL,'|host_description| - Memory - Free Swap','Localhost - Memory - Free Swap','<path_rra>/localhost_mem_swap_4.rrd',NULL,'on',NULL,300,NULL),(64,11,5,11,4,NULL,'|host_description| - Load Average','Localhost - Load Average','<path_rra>/localhost_load_1min_5.rrd',NULL,'on',NULL,300,NULL),(65,17,6,17,5,NULL,'|host_description| - Logged in Users','Localhost - Logged in Users','<path_rra>/localhost_users_6.rrd',NULL,'on',NULL,300,NULL),(66,16,7,16,7,NULL,'|host_description| - Processes','Localhost - Processes','<path_rra>/localhost_proc_7.rrd',NULL,'on',NULL,300,NULL),(70,0,0,49,1,'','Apache2 - Total traffic','',NULL,'','on','',300,''),(71,0,0,50,1,'','Apache2 - Total access count','',NULL,'','on','',300,''),(72,0,0,51,1,'','Apache2 - Busy worker threads','',NULL,'','on','',300,''),(73,0,0,52,1,'','Apache2 - Idle worker threads','',NULL,'','on','',300,''),(74,0,0,53,1,'','Apache2 - Requests per second','',NULL,'','on','',300,''),(75,0,0,54,1,'','Apache2 - kBytes per second','',NULL,'','on','',300,''),(76,0,0,55,1,'','Apache2 - kBytes per request','',NULL,'','on','',300,''),(77,0,0,56,1,'','Apache2 - Number of HTTP 400 errors','',NULL,'','on','',300,''),(78,0,0,57,1,'','Apache2 - Number of HTTP 403 errors','',NULL,'','on','',300,''),(79,0,0,58,1,'','Apache2 - Number of HTTP 404 errors','',NULL,'','on','',300,''),(80,0,0,59,1,'','Apache2 - Number of HTTP 405 errors','',NULL,'','on','',300,''),(81,0,0,60,1,'','Apache2 - Number of HTTP 500 errors','',NULL,'','on','',300,''),(82,0,0,61,1,'','Apache2 - Number of HTTP 501 errors','',NULL,'','on','',300,''),(83,0,0,62,1,'','Apache2 - Number of HTTP 505 errors','',NULL,'','on','',300,''),(84,72,8,51,1,NULL,'Apache2 - Busy worker threads','Apache2 - Busy worker threads','<path_rra>/apache2_ap2busyworkers_8.rrd',NULL,'on',NULL,300,NULL),(85,73,9,52,1,NULL,'Apache2 - Idle worker threads','Apache2 - Idle worker threads','<path_rra>/apache2_ap2idleworkers_9.rrd',NULL,'on',NULL,300,NULL),(126,0,0,75,13,'','MySQL - Counters','',NULL,'','on','',300,''),(88,70,12,49,1,NULL,'Apache2 - Total traffic','Apache2 - Total traffic','<path_rra>/apache2_ap2totaltraffic_12.rrd',NULL,'on',NULL,300,NULL),(89,74,13,53,1,NULL,'Apache2 - Requests per second','Apache2 - Requests per second','<path_rra>/apache2_ap2requestspersec_13.rrd',NULL,'on',NULL,300,NULL),(90,76,14,55,1,NULL,'Apache2 - kBytes per request','Apache2 - kBytes per request','<path_rra>/apache2_ap2kbytesperrequest_14.rrd',NULL,'on',NULL,300,NULL),(118,117,34,70,13,NULL,'MySQL - Tables','MySQL - Tables','<path_rra>/mysql_tables_34.rrd',NULL,'on',NULL,300,NULL),(117,0,0,70,13,'','MySQL - Tables','',NULL,'','on','',300,''),(116,0,0,69,13,'','MySQL - Files','',NULL,'','on','',300,''),(115,114,33,68,13,NULL,'MySQL - Keys','MySQL - Keys','<path_rra>/mysql_keys_33.rrd',NULL,'on',NULL,300,NULL),(128,0,0,76,13,'','MySQL - InnoDB queries','',NULL,'','on','',300,''),(129,0,0,77,13,'','MySQL - InnoDB I/O operations','',NULL,'','on','',300,''),(114,0,0,68,13,'','MySQL - Keys','',NULL,'','on','',300,''),(112,0,0,67,13,'','MySQL - Threads','',NULL,'','on','',300,''),(122,0,0,74,13,'','MySQL - Query cache ressources','',NULL,'','on','',300,''),(121,0,0,73,13,'','MySQL - Query cache performance','',NULL,'','on','',300,''),(132,0,0,79,15,'','WebStamp - Statistics','',NULL,'','on','',300,''),(127,126,38,75,13,NULL,'MySQL - Counters','MySQL - Counters','<path_rra>/mysql_stats_38.rrd',NULL,'on',NULL,300,NULL),(119,0,0,71,13,'','MySQL - Temporary ressources','',NULL,'','on','',300,''),(120,0,0,72,13,'','MySQL - Table locks','',NULL,'','on','',300,''),(123,121,35,73,13,NULL,'MySQL - Query cache performance','MySQL - Query cache performance','<path_rra>/mysql_qcache_performance_35.rrd',NULL,'on',NULL,300,NULL),(124,122,36,74,13,NULL,'MySQL - Query cache ressources','MySQL - Query cache ressources','<path_rra>/mysql_qcache_ressources_36.rrd',NULL,'on',NULL,300,NULL),(130,0,0,78,13,'','MySQL - InnoDB I/O bandwidth','',NULL,'','on','',300,''),(131,130,39,78,13,NULL,'MySQL - InnoDB I/O bandwidth','MySQL - InnoDB I/O bandwidth','<path_rra>/mysql_innodb_bandwidth_39.rrd',NULL,'on',NULL,300,NULL),(137,136,43,80,15,NULL,'WebStamp - Overall Counts','WebStamp - Overall Counts','<path_rra>/webstamp_counts_42.rrd',NULL,'on',NULL,300,NULL),(135,132,42,79,15,NULL,'WebStamp - Statistics','WebStamp - Statistics','<path_rra>/webstamp_stats_40.rrd',NULL,'on',NULL,300,NULL),(136,0,0,80,15,'','WebStamp - Overall Counts','',NULL,'','on','',300,'');
UNLOCK TABLES;
/*!40000 ALTER TABLE `data_template_data` ENABLE KEYS */;

--
-- Table structure for table `data_template_data_rra`
--

DROP TABLE IF EXISTS `data_template_data_rra`;
CREATE TABLE `data_template_data_rra` (
  `data_template_data_id` mediumint(8) unsigned NOT NULL default '0',
  `rra_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`data_template_data_id`,`rra_id`),
  KEY `data_template_data_id` (`data_template_data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `data_template_data_rra`
--


/*!40000 ALTER TABLE `data_template_data_rra` DISABLE KEYS */;
LOCK TABLES `data_template_data_rra` WRITE;
INSERT INTO `data_template_data_rra` (`data_template_data_id`, `rra_id`) VALUES (3,1),(3,2),(3,3),(3,4),(4,1),(4,2),(4,3),(4,4),(5,1),(5,2),(5,3),(5,4),(6,1),(6,2),(6,3),(6,4),(7,1),(7,2),(7,3),(7,4),(8,1),(8,2),(8,3),(8,4),(9,1),(9,2),(9,3),(9,4),(10,1),(10,2),(10,3),(10,4),(11,1),(11,2),(11,3),(11,4),(13,1),(13,2),(13,3),(13,4),(15,1),(15,2),(15,3),(15,4),(16,1),(16,2),(16,3),(16,4),(17,1),(17,2),(17,3),(17,4),(18,1),(18,2),(18,3),(18,4),(19,1),(19,2),(19,3),(19,4),(20,1),(20,2),(20,3),(20,4),(22,1),(22,2),(22,3),(22,4),(23,1),(23,2),(23,3),(23,4),(24,1),(24,2),(24,3),(24,4),(25,1),(25,2),(25,3),(25,4),(26,1),(26,2),(26,3),(26,4),(27,1),(27,2),(27,3),(27,4),(30,1),(30,2),(30,3),(30,4),(31,1),(31,2),(31,3),(31,4),(32,1),(32,2),(32,3),(32,4),(33,1),(33,2),(33,3),(33,4),(34,1),(34,2),(34,3),(34,4),(35,1),(35,2),(35,3),(35,4),(36,1),(36,2),(36,3),(36,4),(37,1),(37,2),(37,3),(37,4),(38,1),(38,2),(38,3),(38,4),(39,1),(39,2),(39,3),(39,4),(40,1),(40,2),(40,3),(40,4),(41,1),(41,2),(41,3),(41,4),(55,1),(55,2),(55,3),(55,4),(56,1),(56,2),(56,3),(56,4),(57,1),(57,2),(57,3),(57,4),(58,1),(58,2),(58,3),(58,4),(59,1),(59,2),(59,3),(59,4),(62,1),(62,2),(62,3),(62,4),(63,1),(63,2),(63,3),(63,4),(64,1),(64,2),(64,3),(64,4),(65,1),(65,2),(65,3),(65,4),(66,1),(66,2),(66,3),(66,4),(68,1),(68,2),(68,3),(68,4),(69,1),(69,2),(69,3),(69,4),(70,1),(70,2),(70,3),(70,4),(71,1),(71,2),(71,3),(71,4),(72,1),(72,2),(72,3),(72,4),(73,1),(73,2),(73,3),(73,4),(74,1),(74,2),(74,3),(74,4),(75,1),(75,2),(75,3),(75,4),(76,1),(76,2),(76,3),(76,4),(77,1),(77,2),(77,3),(77,4),(78,1),(78,2),(78,3),(78,4),(79,1),(79,2),(79,3),(79,4),(80,1),(80,2),(80,3),(80,4),(81,1),(81,2),(81,3),(81,4),(82,1),(82,2),(82,3),(82,4),(83,1),(83,2),(83,3),(83,4),(84,1),(84,2),(84,3),(84,4),(85,1),(85,2),(85,3),(85,4),(88,1),(88,2),(88,3),(88,4),(89,1),(89,2),(89,3),(89,4),(90,1),(90,2),(90,3),(90,4),(112,1),(112,2),(112,3),(112,4),(114,1),(114,2),(114,3),(114,4),(115,1),(115,2),(115,3),(115,4),(116,1),(116,2),(116,3),(116,4),(117,1),(117,2),(117,3),(117,4),(118,1),(118,2),(118,3),(118,4),(119,1),(119,2),(119,3),(119,4),(120,1),(120,2),(120,3),(120,4),(121,1),(121,2),(121,3),(121,4),(122,1),(122,2),(122,3),(122,4),(123,1),(123,2),(123,3),(123,4),(124,1),(124,2),(124,3),(124,4),(126,1),(126,2),(126,3),(126,4),(127,1),(127,2),(127,3),(127,4),(128,1),(128,2),(128,3),(128,4),(129,1),(129,2),(129,3),(129,4),(130,1),(130,2),(130,3),(130,4),(131,1),(131,2),(131,3),(131,4),(132,1),(132,2),(132,3),(132,4),(135,1),(135,2),(135,3),(135,4),(136,1),(136,2),(136,3),(136,4),(137,1),(137,2),(137,3),(137,4);
UNLOCK TABLES;
/*!40000 ALTER TABLE `data_template_data_rra` ENABLE KEYS */;

--
-- Table structure for table `data_template_rrd`
--

DROP TABLE IF EXISTS `data_template_rrd`;
CREATE TABLE `data_template_rrd` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) collate latin1_german1_ci NOT NULL default '',
  `local_data_template_rrd_id` mediumint(8) unsigned NOT NULL default '0',
  `local_data_id` mediumint(8) unsigned NOT NULL default '0',
  `data_template_id` mediumint(8) unsigned NOT NULL default '0',
  `t_rrd_maximum` char(2) collate latin1_german1_ci default NULL,
  `rrd_maximum` bigint(20) NOT NULL default '0',
  `t_rrd_minimum` char(2) collate latin1_german1_ci default NULL,
  `rrd_minimum` bigint(20) NOT NULL default '0',
  `t_rrd_heartbeat` char(2) collate latin1_german1_ci default NULL,
  `rrd_heartbeat` mediumint(6) NOT NULL default '0',
  `t_data_source_type_id` char(2) collate latin1_german1_ci default NULL,
  `data_source_type_id` smallint(5) NOT NULL default '0',
  `t_data_source_name` char(2) collate latin1_german1_ci default NULL,
  `data_source_name` varchar(19) collate latin1_german1_ci NOT NULL default '',
  `t_data_input_field_id` char(2) collate latin1_german1_ci default NULL,
  `data_input_field_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `local_data_id` (`local_data_id`),
  KEY `data_template_id` (`data_template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `data_template_rrd`
--


/*!40000 ALTER TABLE `data_template_rrd` DISABLE KEYS */;
LOCK TABLES `data_template_rrd` WRITE;
INSERT INTO `data_template_rrd` (`id`, `hash`, `local_data_template_rrd_id`, `local_data_id`, `data_template_id`, `t_rrd_maximum`, `rrd_maximum`, `t_rrd_minimum`, `rrd_minimum`, `t_rrd_heartbeat`, `rrd_heartbeat`, `t_data_source_type_id`, `data_source_type_id`, `t_data_source_name`, `data_source_name`, `t_data_input_field_id`, `data_input_field_id`) VALUES (3,'2d53f9c76767a2ae8909f4152fd473a4',0,0,3,'',0,'',0,'',600,'',1,'','hdd_free','',0),(4,'93d91aa7a3cc5473e7b195d5d6e6e675',0,0,3,'',0,'',0,'',600,'',1,'','hdd_used','',0),(5,'7bee7987bbf30a3bc429d2a67c6b2595',0,0,4,'',100,'',0,'',600,'',2,'','cpu_system','',0),(6,'ddccd7fbdece499da0235b4098b87f9e',0,0,5,'',100,'',0,'',600,'',2,'','cpu_user','',0),(7,'122ab2097f8c6403b7b90cde7b9e2bc2',0,0,6,'',100,'',0,'',600,'',2,'','cpu_nice','',0),(8,'34f50c820092ea0fecba25b4b94a7946',0,0,7,'',100,'',0,'',600,'',1,'','wrls_noise','',0),(9,'830b811d1834e5ba0e2af93bd92db057',0,0,8,'',100,'',0,'',600,'',1,'','wrls_signal','',0),(10,'2f1b016a2465eef3f7369f6313cd4a94',0,0,9,'',1000000,'',0,'',600,'',2,'','wrls_transmits','',0),(11,'28ffcecaf8b50e49f676f2d4a822685d',0,0,10,'',1000000,'',0,'',600,'',2,'','wrls_retransmits','',0),(12,'8175ca431c8fe50efff5a1d3ae51b55d',0,0,11,'',500,'',0,'',600,'',1,'','load_1min','',17),(13,'a2eeb8acd6ea01cd0e3ac852965c0eb6',0,0,11,'',500,'',0,'',600,'',1,'','load_5min','',18),(14,'9f951b7fb3b19285a411aebb5254a831',0,0,11,'',500,'',0,'',600,'',1,'','load_15min','',19),(16,'a4df3de5238d3beabee1a2fe140d3d80',0,0,13,'',0,'',0,'',600,'',1,'','mem_buffers','',23),(18,'7fea6acc9b1a19484b4cb4cef2b6c5da',0,0,15,'',0,'',0,'',600,'',1,'','mem_swap','',23),(19,'f1ba3a5b17b95825021241398bb0f277',0,0,16,'',1000,'',0,'',600,'',1,'','proc','',24),(20,'46a5afe8e6c0419172c76421dc9e304a',0,0,17,'',500,'',0,'',600,'',1,'','users','',21),(21,'962fd1994fe9cae87fb36436bdb8a742',0,0,18,'',5000,'',0,'',600,'',1,'','ping','',30),(22,'7a8dd1111a8624369906bf2cd6ea9ca9',0,0,19,'',100000,'',0,'',600,'',1,'','total_users','',0),(23,'ddb6e74d34d2f1969ce85f809dbac23d',0,0,20,'',100000,'',0,'',600,'',1,'','total_logins','',0),(80,'50ccbe193c6c7fc29fb9f726cd6c48ee',0,0,45,'',1000,'',0,'',600,'',1,'','proc','',0),(25,'289311d10336941d33d9a1c48a7b11ee',0,0,22,'',10000000,'',0,'',600,'',2,'','fs_reads','',0),(26,'02216f036cca04655ee2f67fedb6f4f0',0,0,23,'',10000000,'',0,'',600,'',2,'','fs_writes','',0),(27,'9e402c0f29131ef7139c20bd500b4e8a',0,0,24,'',10000000,'',0,'',600,'',2,'','cache_checks','',0),(28,'46717dfe3c8c030d8b5ec0874f9dbdca',0,0,25,'',1000000,'',0,'',600,'',2,'','cache_hits','',0),(29,'7a88a60729af62561812c43bde61dfc1',0,0,26,'',100000,'',0,'',600,'',1,'','open_files','',0),(30,'3c0fd1a188b64a662dfbfa985648397b',0,0,27,'',100,'',0,'',600,'',1,'','5min_cpu','',0),(33,'ed44c2438ef7e46e2aeed2b6c580815c',0,0,30,'',500,'',0,'',600,'',1,'','load_1min','',0),(34,'9b3a00c9e3530d9e58895ac38271361e',0,0,31,'',500,'',0,'',600,'',1,'','load_5min','',0),(35,'6746c2ed836ecc68a71bbddf06b0e5d9',0,0,32,'',500,'',0,'',600,'',1,'','load_15min','',0),(36,'9835d9e1a8c78aa2475d752e8fa74812',0,0,33,'',10000000,'',0,'',600,'',1,'','mem_buffers','',0),(37,'9c78dc1981bcea841b8c827c6dc0d26c',0,0,34,'',10000000,'',0,'',600,'',1,'','mem_free','',0),(38,'62a56dc76fe4cd8566a31b5df0274cc3',0,0,35,'',0,'',0,'',600,'',1,'','vol_total','',0),(39,'2e366ab49d0e0238fb4e3141ea5a88c3',0,0,35,'',0,'',0,'',600,'',1,'','vol_free','',0),(40,'dceedc84718dd93a5affe4b190bca810',0,0,35,'',0,'',0,'',600,'',1,'','vol_freeable','',0),(42,'93330503f1cf67db00d8fe636035e545',0,0,36,'',100000000000,'',0,'',600,'',1,'','dir_total','',0),(43,'6b0fe4aa6aaf22ef9cfbbe96d87fa0d7',0,0,36,'',100000000000,'',0,'',600,'',1,'','dir_used','',0),(44,'4c82df790325d789d304e6ee5cd4ab7d',0,0,37,'',0,'',0,'',600,'',1,'','hdd_free','',0),(54,'2df25c57022b0c7e7d0be4c035ada1a0',0,0,41,'on',100000000,'',0,'',600,'',2,'','traffic_in','',0),(46,'c802e2fd77f5b0a4c4298951bf65957c',0,0,38,'',10000000,'',0,'',600,'',2,'','errors_in','',0),(47,'4e2a72240955380dc8ffacfcc8c09874',0,0,38,'',10000000,'',0,'',600,'',2,'','discards_in','',0),(48,'636672962b5bb2f31d86985e2ab4bdfe',0,0,39,'',1000000000,'',0,'',600,'',2,'','unicast_in','',0),(49,'18ce92c125a236a190ee9dd948f56268',0,0,39,'',1000000000,'',0,'',600,'',2,'','unicast_out','',0),(50,'13ebb33f9cbccfcba828db1075a8167c',0,0,38,'',10000000,'',0,'',600,'',2,'','discards_out','',0),(51,'31399c3725bee7e09ec04049e3d5cd17',0,0,38,'',10000000,'',0,'',600,'',2,'','errors_out','',0),(52,'7be68cbc4ee0b2973eb9785f8c7a35c7',0,0,40,'',1000000000,'',0,'',600,'',2,'','nonunicast_out','',0),(53,'93e2b6f59b10b13f2ddf2da3ae98b89a',0,0,40,'',1000000000,'',0,'',600,'',2,'','nonunicast_in','',0),(55,'721c0794526d1ac1c359f27dc56faa49',0,0,41,'on',100000000,'',0,'',600,'',2,'','traffic_out','',0),(56,'07175541991def89bd02d28a215f6fcc',0,0,37,'',0,'',0,'',600,'',1,'','hdd_used','',0),(76,'07492e5cace6d74e7db3cb1fc005a3f3',0,0,42,'',100,'',0,'',600,'',1,'','cpu','',0),(92,'165a0da5f461561c85d092dfe96b9551',0,0,43,'',0,'',0,'',600,'',1,'','hdd_total','',0),(78,'0ee6bb54957f6795a5369a29f818d860',0,0,43,'',0,'',0,'',600,'',1,'','hdd_used','',0),(79,'9825aaf7c0bdf1554c5b4b86680ac2c0',0,0,44,'',100,'',0,'',600,'',1,'','cpu','',0),(81,'9464c91bcff47f23085ae5adae6ab987',0,0,46,'',5000,'',0,'',600,'',1,'','users','',0),(84,'',16,3,13,NULL,0,NULL,0,NULL,600,NULL,1,NULL,'mem_buffers',NULL,23),(85,'',18,4,15,NULL,0,NULL,0,NULL,600,NULL,1,NULL,'mem_swap',NULL,23),(86,'',12,5,11,NULL,500,NULL,0,NULL,600,NULL,1,NULL,'load_1min',NULL,17),(87,'',13,5,11,NULL,500,NULL,0,NULL,600,NULL,1,NULL,'load_5min',NULL,18),(88,'',14,5,11,NULL,500,NULL,0,NULL,600,NULL,1,NULL,'load_15min',NULL,19),(89,'',20,6,17,NULL,500,NULL,0,NULL,600,NULL,1,NULL,'users',NULL,21),(90,'',19,7,16,NULL,1000,NULL,0,NULL,600,NULL,1,NULL,'proc',NULL,24),(96,'224b83ea73f55f8a861bcf4c9bea0472',0,0,48,'on',100,'',0,'',600,'on',1,'','snmp_oid','',0),(95,'7a6ca455bbeff99ca891371bc77d5cf9',0,0,47,'',10000000,'',0,'',600,'',1,'','mem_cache','',0),(97,'4c398e13653c2008934ec5b4e0560b39',0,0,49,'',0,'',0,'',600,'',2,'','ap2TotalTraffic','',0),(98,'4bef330e1446f78314705056b01009d6',0,0,50,'',0,'',0,'',600,'',2,'','ap2TotalAccess','',0),(99,'7967656bb223cc3a0ab936b9af9955ee',0,0,51,'',0,'',0,'',600,'',1,'','ap2BusyWorkers','',0),(100,'d6278bb79c45e4c678b69ba18b6fb034',0,0,52,'',0,'',0,'',600,'',1,'','ap2IdleWorkers','',0),(101,'5e33b25978d1c79eadf7b9fc80d2f7a1',0,0,53,'',0,'',0,'',600,'',1,'','ap2RequestsPerSec','',0),(102,'004663592ba7401f86f2ebe3dc713e00',0,0,54,'',0,'',0,'',600,'',1,'','ap2KBytesPerSec','',0),(103,'fa26885d458c38c2e5a0a8990e03905e',0,0,55,'',0,'',0,'',600,'',1,'','ap2KBytesPerRequest','',0),(104,'3b3d0254c1279a1cb331faa0f6ceacb4',0,0,56,'',0,'',0,'',600,'',2,'','ap2HttpError400','',0),(105,'221a71284c3d9ef97c9e11e93c0f9fd1',0,0,57,'',0,'',0,'',600,'',2,'','ap2HttpError403','',0),(106,'61f25447a0089195c4d090eadaf6ca18',0,0,58,'',0,'',0,'',600,'',2,'','ap2HttpError404','',0),(107,'226e3b61ce652242459731a365bff8d1',0,0,59,'',0,'',0,'',600,'',2,'','ap2HttpError405','',0),(108,'10b52c267cb89ba093dc6f72376f36d0',0,0,60,'',0,'',0,'',600,'',2,'','ap2HttpError500','',0),(109,'c212f2e6c387a98a3baa43738a18eef1',0,0,61,'',0,'',0,'',600,'',2,'','ap2HttpError501','',0),(110,'78b684033b5fc707f49335965cdfac57',0,0,62,'',0,'',0,'',600,'',2,'','ap2HttpError505','',0),(111,'',99,8,51,NULL,0,NULL,0,NULL,600,NULL,1,NULL,'ap2BusyWorkers',NULL,0),(112,'',100,9,52,NULL,0,NULL,0,NULL,600,NULL,1,NULL,'ap2IdleWorkers',NULL,0),(253,'8a227d011bece737a436b38cb14074b4',0,0,79,'',0,'',0,'',600,'',2,'','stamps','',126),(115,'',97,12,49,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'ap2TotalTraffic',NULL,0),(116,'',101,13,53,NULL,0,NULL,0,NULL,600,NULL,1,NULL,'ap2RequestsPerSec',NULL,0),(117,'',103,14,55,NULL,0,NULL,0,NULL,600,NULL,1,NULL,'ap2KBytesPerRequest',NULL,0),(202,'',193,35,73,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'qcacheInserts',NULL,108),(192,'444934e956f505dca08c91157ccbdf3e',0,0,73,'',0,'',0,'',600,'',2,'','qcacheHits','',107),(222,'52b68c35a1bd908f243840ae390e5afe',0,0,67,'',0,'',0,'',600,'',1,'','delayedInsertThread','',51),(155,'e792758ea5bc9819a26f7be223d9e15f',0,0,67,'',0,'',0,'',600,'',2,'','mysqlThreadsCreated','',117),(154,'dd0fb0c30656e97f92b96f87c635e8a0',0,0,67,'',0,'',0,'',600,'',1,'','mysqlThreadsCached','',115),(193,'a970139a045b1198ebee5fa448d1e11c',0,0,73,'',0,'',0,'',600,'',2,'','qcacheInserts','',108),(215,'9537e74a6991ffd393d1a2aaab10e197',0,0,75,'',0,'',0,'',600,'',2,'','questions','',113),(156,'45265284cfdc1b3dbaa30d0bfc85e3b0',0,0,67,'',0,'',0,'',600,'',1,'','mysqlThreadsRunning','',118),(200,'dbd69ce3f1c5502f7885d32fac9bc12d',0,0,74,'',0,'',0,'',600,'',1,'','qcacheFreeBlocks','',105),(252,'0329495c9b2d9796405e1cebaa41de1e',0,0,79,'',0,'',0,'',600,'',2,'','orders','',125),(214,'417a3b46e071626b580c2bb3badfe770',0,0,75,'',0,'',0,'',600,'',2,'','openedTables','',104),(211,'4c2b401d54725dc819e3bcc11427071b',0,0,75,'',0,'',0,'',600,'',2,'','abortedConnects','',43),(212,'bd012270a927620478dfa352f5fa033a',0,0,75,'',0,'',0,'',600,'',2,'','connections','',46),(213,'e5c57efff688644d2bad322df8c10a9a',0,0,75,'',0,'',0,'',600,'',2,'','flushCommands','',54),(210,'853810f8d7802517178748559f445e76',0,0,75,'',0,'',0,'',600,'',2,'','threadsCreated','',117),(223,'2838d6982fd9f731bff6ddb81e507560',0,0,67,'',0,'',0,'',600,'',1,'','slowLaunchThreads','',42),(160,'0f6d19ccaf4dc7cb361c9e58a02884da',0,0,68,'',0,'',0,'',600,'',1,'','keyBlocksUnused','',94),(161,'738bbe0ab2ba4768eb5ad8e4421f40d8',0,0,68,'',0,'',0,'',600,'',1,'','keyBlocksUsed','',95),(162,'93321bf4db408a077b1e9863f78e9040',0,0,68,'',0,'',0,'',600,'',2,'','keyReads','',97),(163,'d51e1743a7b113f2dbbafa4e09ed8581',0,0,68,'',0,'',0,'',600,'',2,'','keyReadRequests','',96),(164,'63dfeb9b871e7e79c964d96fe3960c88',0,0,68,'',0,'',0,'',600,'',2,'','keyWrites','',99),(165,'76f5827188deea5f1f9d8f3ee6e435f1',0,0,68,'',0,'',0,'',600,'',2,'','keyWriteRequests','',98),(166,'',160,33,68,NULL,0,NULL,0,NULL,600,NULL,1,NULL,'keyBlocksUnused',NULL,94),(167,'',161,33,68,NULL,0,NULL,0,NULL,600,NULL,1,NULL,'keyBlocksUsed',NULL,95),(168,'',162,33,68,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'keyReads',NULL,97),(169,'',163,33,68,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'keyReadRequests',NULL,96),(170,'',164,33,68,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'keyWrites',NULL,99),(171,'',165,33,68,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'keyWriteRequests',NULL,98),(172,'60555c0bb311ad7e9659821f20b3c234',0,0,69,'',0,'',0,'',600,'',1,'','mysqlOpenFiles','',101),(173,'ca1c4a205eaa47aad292a5cbbc17659a',0,0,69,'',100,'',0,'',600,'',2,'','mysqlCreatedTmpFile','',48),(174,'0f2fcfadf5b6473e88ad69164565b881',0,0,70,'',0,'',0,'',600,'',1,'','openTables','',42),(175,'70289ffb01a97ad8efa7841af69cfd98',0,0,70,'',100,'',0,'',600,'',2,'','openedTables','',104),(176,'1234a3f3e09f0e5e03ee47541a3d5698',0,0,70,'',100,'',0,'',600,'',2,'','createdTmpDiskTable','',47),(177,'e7a4ef330905c48c46956ca8d0c8a884',0,0,70,'',0,'',0,'',600,'',2,'','createdTmpTables','',49),(178,'ee5da87e469df5018fdd0431c24ea83c',0,0,70,'',100,'',0,'',600,'',1,'','slaveOpenTempTables','',122),(179,'',174,34,70,NULL,0,NULL,0,NULL,600,NULL,1,NULL,'openTables',NULL,42),(180,'',175,34,70,NULL,100,NULL,0,NULL,600,NULL,2,NULL,'openedTables',NULL,104),(181,'',176,34,70,NULL,100,NULL,0,NULL,600,NULL,2,NULL,'createdTmpDiskTable',NULL,47),(182,'',177,34,70,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'createdTmpTables',NULL,49),(183,'',178,34,70,NULL,100,NULL,0,NULL,600,NULL,1,NULL,'slaveOpenTempTables',NULL,122),(184,'1d25d8da3d9acdfa7d25b0c7d6889e59',0,0,71,'',0,'',0,'',600,'',2,'','createdTmpDiskTable','',47),(185,'11b1f007739c56c65720c8c55fee49dd',0,0,71,'',0,'',0,'',600,'',2,'','createdTmpFiles','',48),(186,'e5c18a738f17aeff292f0d4aace07f72',0,0,71,'',0,'',0,'',600,'',2,'','createdTmpTables','',49),(187,'7b030a6b49079c1eca9c4d68ff602d3e',0,0,71,'',0,'',0,'',600,'',1,'','slaveOpenTempTables','',122),(188,'b2ae044c98149f215419432781d167f7',0,0,72,'',0,'',0,'',600,'',1,'','tableLocksImmediate','',114),(189,'200ed65e89859e14c79b098a23e7550a',0,0,72,'',0,'',0,'',600,'',2,'','tableLocksWaited','',123),(194,'30402ac399e51639735d2707905ef5ce',0,0,73,'',0,'',0,'',600,'',2,'','qcacheLowmemPrunes','',109),(195,'5d79602f7d6cf5ec59acd32768d0cf61',0,0,73,'',0,'',0,'',600,'',2,'','qcacheNotCached','',110),(201,'',192,35,73,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'qcacheHits',NULL,107),(197,'adae212b762372046042e6df6894317a',0,0,74,'',0,'',0,'',600,'',1,'','qcacheQueriesInCach','',111),(198,'75ed06fc891f5916d3527c90ae31b641',0,0,74,'',0,'',0,'',600,'',1,'','qcacheTotalBlocks','',112),(199,'1b8ecb9d014280c7b6289cd07c845ad3',0,0,74,'',0,'',0,'',600,'',1,'','qcacheFreeMemory','',106),(203,'',194,35,73,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'qcacheLowmemPrunes',NULL,109),(204,'',195,35,73,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'qcacheNotCached',NULL,110),(205,'',200,36,74,NULL,0,NULL,0,NULL,600,NULL,1,NULL,'qcacheFreeBlocks',NULL,105),(206,'',197,36,74,NULL,0,NULL,0,NULL,600,NULL,1,NULL,'qcacheQueriesInCach',NULL,111),(207,'',198,36,74,NULL,0,NULL,0,NULL,600,NULL,1,NULL,'qcacheTotalBlocks',NULL,112),(208,'',199,36,74,NULL,0,NULL,0,NULL,600,NULL,1,NULL,'qcacheFreeMemory',NULL,106),(216,'',215,38,75,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'questions',NULL,113),(217,'',214,38,75,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'openedTables',NULL,104),(218,'',211,38,75,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'abortedConnects',NULL,43),(219,'',212,38,75,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'connections',NULL,46),(220,'',213,38,75,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'flushCommands',NULL,54),(221,'',210,38,75,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'threadsCreated',NULL,117),(224,'bdfabf8ffcb99a8e8fdb433555937981',0,0,76,'',0,'',0,'',600,'',2,'','innodbRowsDeleted','',90),(225,'4ac2e5715ac9c008e7fbdeab1a1ce690',0,0,76,'',0,'',0,'',600,'',2,'','innodbRowsInserted','',91),(226,'f7addaef0b241b8273081c84ef418383',0,0,76,'',0,'',0,'',600,'',2,'','innodbRowsRead','',92),(242,'256ed769f4bff40ab41079a174842ecb',0,0,77,'',0,'',0,'',600,'',2,'','logWrites','',79),(241,'9375721aab3baef2f59c5100d3bc4909',0,0,77,'',0,'',0,'',600,'',2,'','logWriteRequests','',78),(240,'4d7ea8d121db2bcfebf6504391392649',0,0,77,'',0,'',0,'',600,'',2,'','dblwrWrites','',77),(239,'1a5c4a733c13da0a83d4ad6a46c63814',0,0,77,'',0,'',0,'',600,'',2,'','dataWrites','',74),(238,'c424c54bc4a07c475d7394f920a0043d',0,0,77,'',0,'',0,'',600,'',2,'','dataReads','',73),(235,'80317518d0659740ac37b6eb45223c68',0,0,77,'',0,'',0,'',600,'',2,'','dataFsyncs','',68),(236,'2e8e07eca9c0620e7aed56c98f66100c',0,0,77,'',0,'',0,'',600,'',2,'','bpReadRequests','',64),(237,'b7c319370c4c457ff6d8c85221c2f604',0,0,77,'',0,'',0,'',600,'',2,'','bpWriteRequests','',67),(243,'e764bf939418dd485621de734f6f5e30',0,0,77,'',0,'',0,'',600,'',2,'','osLogFsyncs','',80),(244,'e7f678fc452804abbd62cb0dbd934cad',0,0,77,'',0,'',0,'',600,'',2,'','pagesRead','',84),(245,'b244440e88c5a3f5bb47addcde02798d',0,0,77,'',0,'',0,'',600,'',2,'','pagesWritten','',85),(246,'18de9e4787eaef42a634489eda674517',0,0,78,'',0,'',0,'',600,'',2,'','dataRead','',72),(247,'488500b1f9933301a1c8fa502085e8db',0,0,78,'',0,'',0,'',600,'',2,'','dataWritten','',75),(248,'08dc81cdf7582cb6486480af973e3d4e',0,0,78,'',0,'',0,'',600,'',2,'','osLogWritten','',81),(249,'',246,39,78,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'dataRead',NULL,72),(250,'',247,39,78,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'dataWritten',NULL,75),(251,'',248,39,78,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'osLogWritten',NULL,81),(254,'cafdb2003a1aac5e308cad19aae94e5d',0,0,79,'',0,'',0,'',600,'',2,'','users','',127),(269,'',266,43,80,NULL,0,NULL,0,NULL,600,NULL,1,NULL,'userCount',NULL,127),(268,'',265,43,80,NULL,0,NULL,0,NULL,600,NULL,1,NULL,'stampCount',NULL,126),(267,'',264,43,80,NULL,0,NULL,0,NULL,600,NULL,1,NULL,'orderCount',NULL,125),(261,'',253,42,79,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'stamps',NULL,126),(262,'',252,42,79,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'orders',NULL,125),(263,'',254,42,79,NULL,0,NULL,0,NULL,600,NULL,2,NULL,'users',NULL,127),(264,'c5a3df79f764f909898ee1722d88457a',0,0,80,'',0,'',0,'',600,'',1,'','orderCount','',125),(265,'7139ed60bee1f3a710dd5364aba13223',0,0,80,'',0,'',0,'',600,'',1,'','stampCount','',126),(266,'575b4861287d09bb19e58b6c512e980a',0,0,80,'',0,'',0,'',600,'',1,'','userCount','',127);
UNLOCK TABLES;
/*!40000 ALTER TABLE `data_template_rrd` ENABLE KEYS */;

--
-- Table structure for table `graph_local`
--

DROP TABLE IF EXISTS `graph_local`;
CREATE TABLE `graph_local` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `graph_template_id` mediumint(8) unsigned NOT NULL default '0',
  `host_id` mediumint(8) unsigned NOT NULL default '0',
  `snmp_query_id` mediumint(8) NOT NULL default '0',
  `snmp_index` varchar(255) collate latin1_german1_ci NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `host_id` (`host_id`),
  KEY `graph_template_id` (`graph_template_id`),
  KEY `snmp_index` (`snmp_index`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci COMMENT='Creates a relationship for each item in a custom graph.';

--
-- Dumping data for table `graph_local`
--


/*!40000 ALTER TABLE `graph_local` DISABLE KEYS */;
LOCK TABLES `graph_local` WRITE;
INSERT INTO `graph_local` (`id`, `graph_template_id`, `host_id`, `snmp_query_id`, `snmp_index`) VALUES (1,12,1,0,''),(2,9,1,0,''),(3,10,1,0,''),(4,8,1,0,''),(5,35,2,0,''),(7,36,2,0,''),(8,37,2,0,''),(9,38,2,0,''),(20,44,3,0,''),(19,42,3,0,''),(18,41,3,0,''),(24,46,3,0,''),(21,43,3,0,''),(23,45,3,0,''),(26,47,5,0,''),(27,48,5,0,''),(28,49,5,0,'');
UNLOCK TABLES;
/*!40000 ALTER TABLE `graph_local` ENABLE KEYS */;

--
-- Table structure for table `graph_template_input`
--

DROP TABLE IF EXISTS `graph_template_input`;
CREATE TABLE `graph_template_input` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) collate latin1_german1_ci NOT NULL default '',
  `graph_template_id` mediumint(8) unsigned NOT NULL default '0',
  `name` varchar(255) collate latin1_german1_ci NOT NULL default '',
  `description` text collate latin1_german1_ci,
  `column_name` varchar(50) collate latin1_german1_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci COMMENT='Stores the names for graph item input groups.';

--
-- Dumping data for table `graph_template_input`
--


/*!40000 ALTER TABLE `graph_template_input` DISABLE KEYS */;
LOCK TABLES `graph_template_input` WRITE;
INSERT INTO `graph_template_input` (`id`, `hash`, `graph_template_id`, `name`, `description`, `column_name`) VALUES (3,'e9d4191277fdfd7d54171f153da57fb0',2,'Inbound Data Source','','task_item_id'),(4,'7b361722a11a03238ee8ab7ce44a1037',2,'Outbound Data Source','','task_item_id'),(5,'b33eb27833614056e06ee5952c3e0724',3,'Available Disk Space Data Source','','task_item_id'),(6,'ef8799e63ee00e8904bcc4228015784a',3,'Used Disk Space Data Source','','task_item_id'),(7,'2662ef4fbb0bf92317ffd42c7515af37',5,'Signal Level Data Source','','task_item_id'),(8,'a6edef6624c796d3a6055305e2e3d4bf',5,'Noise Level Data Source','','task_item_id'),(9,'b0e902db1875e392a9d7d69bfbb13515',5,'Signal Level Color','','color_id'),(10,'24632b1d4a561e937225d0a5fbe65e41',5,'Noise Level Color','','color_id'),(11,'6d078f1d58b70ad154a89eb80fe6ab75',6,'Transmissions Data Source','','task_item_id'),(12,'878241872dd81c68d78e6ff94871d97d',6,'Re-Transmissions Data Source','','task_item_id'),(13,'f8fcdc3a3f0e8ead33bd9751895a3462',6,'Transmissions Color','','color_id'),(14,'394ab4713a34198dddb5175aa40a2b4a',6,'Re-Transmissions Color','','color_id'),(15,'433f328369f9569446ddc59555a63eb8',7,'Ping Host Data Source','','task_item_id'),(16,'a1a91c1514c65152d8cb73522ea9d4e6',7,'Legend Color','','color_id'),(17,'2fb4deb1448379b27ddc64e30e70dc42',7,'Legend Text','','text_format'),(18,'592cedd465877bc61ab549df688b0b2a',8,'Processes Data Source','','task_item_id'),(19,'1d51dbabb200fcea5c4b157129a75410',8,'Legend Color','','color_id'),(20,'8cb8ed3378abec21a1819ea52dfee6a3',9,'1 Minute Data Source','','task_item_id'),(21,'5dfcaf9fd771deb8c5430bce1562e371',9,'5 Minute Data Source','','task_item_id'),(22,'6f3cc610315ee58bc8e0b1f272466324',9,'15 Minute Data Source','','task_item_id'),(23,'b457a982bf46c6760e6ef5f5d06d41fb',10,'Logged in Users Data Source','','task_item_id'),(24,'bd4a57adf93c884815b25a8036b67f98',10,'Legend Color','','color_id'),(25,'d7cdb63500c576e0f9f354de42c6cf3a',11,'1 Minute Data Source','','task_item_id'),(26,'a23152f5ec02e7762ca27608c0d89f6c',11,'5 Minute Data Source','','task_item_id'),(27,'2cc5d1818da577fba15115aa18f64d85',11,'15 Minute Data Source','','task_item_id'),(77,'f28013abf8e5813870df0f4111a5e695',32,'Outbound Data Source','','task_item_id'),(76,'69a23877302e7d142f254b208c58b596',32,'Inbound Data Source','','task_item_id'),(30,'6273c71cdb7ed4ac525cdbcf6180918c',12,'Free Data Source','','task_item_id'),(31,'5e62dbea1db699f1bda04c5863e7864d',12,'Swap Data Source','','task_item_id'),(32,'4d52e112a836d4c9d451f56602682606',4,'System CPU Data Source','','task_item_id'),(33,'f0310b066cc919d2f898b8d1ebf3b518',4,'User CPU Data Source','','task_item_id'),(34,'d9eb6b9eb3d7dd44fd14fdefb4096b54',4,'Nice CPU Data Source','','task_item_id'),(35,'f45def7cad112b450667aa67262258cb',13,'Memory Free Data Source','','task_item_id'),(36,'f8c361a8c8b7ad80e8be03ba7ea5d0d6',13,'Memory Buffers Data Source','','task_item_id'),(37,'03d11dce695963be30bd744bd6cbac69',14,'Cache Hits Data Source','','task_item_id'),(38,'9cbc515234779af4bf6cdf71a81c556a',14,'Cache Checks Data Source','','task_item_id'),(39,'2c4d561ee8132a8dda6de1104336a6ec',15,'CPU Utilization Data Source','','task_item_id'),(40,'6e1cf7addc0cc419aa903552e3eedbea',16,'File System Reads Data Source','','task_item_id'),(41,'7ea2aa0656f7064d25a36135dd0e9082',16,'File System Writes Data Source','','task_item_id'),(42,'63480bca78a38435f24a5b5d5ed050d7',17,'Current Logins Data Source','','task_item_id'),(73,'69ad68fc53af03565aef501ed5f04744',30,'Open Files Data Source','','task_item_id'),(44,'31fed1f9e139d4897d0460b10fb7be94',15,'Legend Color','','color_id'),(45,'bb9d83a02261583bc1f92d9e66ea705d',18,'CPU Usage Data Source','','task_item_id'),(46,'51196222ed37b44236d9958116028980',18,'Legend Color','','color_id'),(47,'fd26b0f437b75715d6dff983e7efa710',19,'Free Space Data Source','','task_item_id'),(48,'a463dd46862605c90ea60ccad74188db',19,'Total Space Data Source','','task_item_id'),(49,'9977dd7a41bcf0f0c02872b442c7492e',19,'Freeable Space Data Source','','task_item_id'),(53,'940beb0f0344e37f4c6cdfc17d2060bc',21,'Available Disk Space Data Source','','task_item_id'),(51,'a7a69bbdf6890d6e6eaa7de16e815ec6',20,'Used Directory Entries Data Source','','task_item_id'),(52,'0072b613a33f1fae5ce3e5903dec8fdb',20,'Available Directory Entries Data Source','','task_item_id'),(54,'7b0674dd447a9badf0d11bec688028a8',21,'Used Disk Space Data Source','','task_item_id'),(55,'fa83cd3a3b4271b644cb6459ea8c35dc',22,'Discards In Data Source','','task_item_id'),(56,'7946e8ee1e38a65462b85e31a15e35e5',22,'Errors In Data Source','','task_item_id'),(57,'00ae916640272f5aca54d73ae34c326b',23,'Unicast Packets Out Data Source','','task_item_id'),(58,'1bc1652f82488ebfb7242c65d2ffa9c7',23,'Unicast Packets In Data Source','','task_item_id'),(59,'e3177d0e56278de320db203f32fb803d',24,'Non-Unicast Packets In Data Source','','task_item_id'),(60,'4f20fba2839764707f1c3373648c5fef',24,'Non-Unicast Packets Out Data Source','','task_item_id'),(61,'e5acdd5368137c408d56ecf55b0e077c',22,'Discards Out Data Source','','task_item_id'),(62,'a028e586e5fae667127c655fe0ac67f0',22,'Errors Out Data Source','','task_item_id'),(63,'2764a4f142ba9fd95872106a1b43541e',25,'Inbound Data Source','','task_item_id'),(64,'f73f7ddc1f4349356908122093dbfca2',25,'Outbound Data Source','','task_item_id'),(65,'86bd8819d830a81d64267761e1fd8ec4',26,'Total Disk Space Data Source','','task_item_id'),(66,'6c8967850102202de166951e4411d426',26,'Used Disk Space Data Source','','task_item_id'),(67,'bdad718851a52b82eca0a310b0238450',27,'CPU Utilization Data Source','','task_item_id'),(68,'e7b578e12eb8a82627557b955fd6ebd4',27,'Legend Color','','color_id'),(69,'37d09fb7ce88ecec914728bdb20027f3',28,'Logged in Users Data Source','','task_item_id'),(70,'699bd7eff7ba0c3520db3692103a053d',28,'Legend Color','','color_id'),(71,'df905e159d13a5abed8a8a7710468831',29,'Processes Data Source','','task_item_id'),(72,'8ca9e3c65c080dbf74a59338d64b0c14',29,'Legend Color','','color_id'),(74,'562726cccdb67d5c6941e9e826ef4ef5',31,'Inbound Data Source','','task_item_id'),(75,'82426afec226f8189c8928e7f083f80f',31,'Outbound Data Source','','task_item_id'),(78,'8644b933b6a09dde6c32ff24655eeb9a',33,'Outbound Data Source','','task_item_id'),(79,'49c4b4800f3e638a6f6bb681919aea80',33,'Inbound Data Source','','task_item_id'),(80,'e0b395be8db4f7b938d16df7ae70065f',13,'Cache Memory Data Source','','task_item_id'),(81,'2dca37011521501b9c2b705d080db750',34,'Data Source [snmp_oid]',NULL,'task_item_id'),(82,'b8d8ade5f5f3dd7b12f8cc56bbb4083e',34,'Legend Color','','color_id'),(83,'ac2355b4895c37e14df827f969f31c12',34,'Legend Text','','text_format'),(84,'43bdfa221d2934787d74d8db4c6feaaf',35,'Data Source [ap2BusyWorkers]',NULL,'task_item_id'),(85,'fe27540d3b60e42762a343a8e79d8085',35,'Data Source [ap2IdleWorkers]',NULL,'task_item_id'),(86,'fe4d902a3f2e284f0652f265ed6e16dc',36,'Data Source [ap2TotalTraffic]','','task_item_id'),(87,'3d55c00cabf71dcddf36086dc2da90e9',37,'Data Source [ap2RequestsPerSec]',NULL,'task_item_id'),(88,'ee610aa002f269235baabf4d525fa17c',38,'Data Source [ap2KBytesPerRequest]',NULL,'task_item_id'),(96,'7be2c740c991dc7b4e2295f398b2293a',39,'Data Source [Threads_cached]',NULL,'task_item_id'),(90,'47d859f0a5bd646f83455f7ae1802983',39,'Data Source [Threads_created]','','task_item_id'),(94,'cf033746f65a50f42b4e64be32ba25ad',39,'Data Source [Threads_connected]',NULL,'task_item_id'),(95,'f7c45ea3b488f93cfd68a88a08d21e5a',39,'Data Source [Threads_running]',NULL,'task_item_id'),(97,'9df1010e1fc0dbd5830c81a0804ac6e6',40,'Data Source [mysqlThreadsCached]',NULL,'task_item_id'),(98,'6ae55cd03fef27bfb7754538c03b3b8a',40,'Data Source [mysqlThreadsCreated]',NULL,'task_item_id'),(99,'d336c404bb8473c07a1cbda742bdcbac',40,'Data Source [mysqlThreadsRunning]',NULL,'task_item_id'),(100,'72a4c206b2baecc453ba9b7c28c90d25',37,'Data Source [ap2TotalAccess]',NULL,'task_item_id'),(101,'8a919b2a8110ca2dbe63b47fc7e0729f',41,'Data Source [keyBlocksUsed]',NULL,'task_item_id'),(102,'f8f5b5006e878354fd747e3030fbdf74',41,'Data Source [keyBlocksUnused]',NULL,'task_item_id'),(103,'00e3b8b6526844c9b94f75717d51ea90',42,'Data Source [openTables]',NULL,'task_item_id'),(104,'b6dc09738e326c53db427d6ade3304b1',42,'Data Source [slaveOpenTempTables]',NULL,'task_item_id'),(113,'9f1c26bc381c44250326e79ac373590c',46,'Data Source [dataRead]',NULL,'task_item_id'),(112,'6075ae77865a5953b3a176a82df9e0fd',45,'Data Source [questions]','','task_item_id'),(107,'1d11863acd24eb533e6af65ea0b8e774',44,'Data Source [qcacheHits]',NULL,'task_item_id'),(108,'03c3a7fc3bd229dae2fe30b4cddc9cea',44,'Data Source [qcacheNotCached]',NULL,'task_item_id'),(109,'cdde1c23b0f95ab4d3093208bdee7998',44,'Data Source [qcacheInserts]',NULL,'task_item_id'),(110,'240f7cbffc626de9a36a603672b3747e',43,'Data Source [qcacheTotalBlocks]',NULL,'task_item_id'),(111,'992dc76196e28ad0f778971119dac8be',43,'Data Source [qcacheFreeBlocks]',NULL,'task_item_id'),(114,'04d9c1667673f878201f57bdf4a83b67',46,'Data Source [dataWritten]',NULL,'task_item_id'),(115,'04e12cc5db2c6e25919c30294e0f9d64',46,'Data Source [osLogWritten]',NULL,'task_item_id'),(122,'5f0147c4b425391ce55db2bb0e851475',47,'Data Source [stampCount]',NULL,'task_item_id'),(118,'4fa43777ab69f7c61c0bb425a6aa25e1',47,'Data Source [stamps]',NULL,'task_item_id'),(119,'5735269ea20ef7eff25eeeadcb5188c4',48,'Data Source [orders]',NULL,'task_item_id'),(120,'624bcd8b767ea77451718f46ff24a1b4',48,'Data Source [orderCount]',NULL,'task_item_id'),(121,'5fffd56b03c8d28940bb70e209c3bd8e',49,'Data Source [userCount]',NULL,'task_item_id');
UNLOCK TABLES;
/*!40000 ALTER TABLE `graph_template_input` ENABLE KEYS */;

--
-- Table structure for table `graph_template_input_defs`
--

DROP TABLE IF EXISTS `graph_template_input_defs`;
CREATE TABLE `graph_template_input_defs` (
  `graph_template_input_id` mediumint(8) unsigned NOT NULL default '0',
  `graph_template_item_id` int(12) unsigned NOT NULL default '0',
  PRIMARY KEY  (`graph_template_input_id`,`graph_template_item_id`),
  KEY `graph_template_input_id` (`graph_template_input_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci COMMENT='Stores the relationship for what graph iitems are associated';

--
-- Dumping data for table `graph_template_input_defs`
--


/*!40000 ALTER TABLE `graph_template_input_defs` DISABLE KEYS */;
LOCK TABLES `graph_template_input_defs` WRITE;
INSERT INTO `graph_template_input_defs` (`graph_template_input_id`, `graph_template_item_id`) VALUES (3,9),(3,10),(3,11),(3,12),(4,13),(4,14),(4,15),(4,16),(5,21),(5,22),(5,23),(5,24),(6,17),(6,18),(6,19),(6,20),(7,45),(7,46),(7,47),(7,48),(8,49),(8,50),(8,51),(8,52),(9,45),(10,49),(11,53),(11,54),(11,55),(11,56),(12,57),(12,58),(12,59),(12,60),(13,53),(14,57),(15,61),(15,62),(15,63),(15,64),(16,61),(17,61),(18,65),(18,66),(18,67),(18,68),(19,65),(20,69),(20,70),(21,71),(21,72),(22,73),(22,74),(23,76),(23,77),(23,78),(23,79),(24,76),(25,80),(25,81),(26,82),(26,83),(27,84),(27,85),(30,95),(30,96),(30,97),(30,98),(31,99),(31,100),(31,101),(31,102),(32,29),(32,30),(32,31),(32,32),(33,33),(33,34),(33,35),(33,36),(34,37),(34,38),(34,39),(34,40),(35,103),(35,104),(35,105),(35,106),(36,107),(36,108),(36,109),(36,110),(37,111),(37,112),(37,113),(37,114),(38,115),(38,116),(38,117),(38,118),(39,119),(39,120),(39,121),(39,122),(40,123),(40,124),(40,125),(40,126),(41,127),(41,128),(41,129),(41,130),(42,131),(42,132),(42,133),(42,134),(44,119),(45,139),(45,140),(45,141),(45,142),(46,139),(47,143),(47,144),(47,145),(47,146),(48,147),(48,148),(48,149),(48,150),(49,151),(49,152),(49,153),(49,154),(51,159),(51,160),(51,161),(51,162),(52,163),(52,164),(52,165),(52,166),(53,172),(53,173),(53,174),(53,175),(54,167),(54,169),(54,170),(54,171),(55,180),(55,181),(55,182),(55,183),(56,184),(56,185),(56,186),(56,187),(57,188),(57,189),(57,190),(57,191),(58,192),(58,193),(58,194),(58,195),(59,196),(59,197),(59,198),(59,199),(60,200),(60,201),(60,202),(60,203),(61,204),(61,205),(61,206),(61,207),(62,208),(62,209),(62,210),(62,211),(63,212),(63,213),(63,214),(63,215),(64,216),(64,217),(64,218),(64,219),(65,307),(65,308),(65,309),(65,310),(66,303),(66,304),(66,305),(66,306),(67,315),(67,316),(67,317),(67,318),(68,315),(69,319),(69,320),(69,321),(69,322),(70,319),(71,323),(71,324),(71,325),(71,326),(72,323),(73,358),(73,359),(73,360),(73,361),(74,362),(74,363),(74,364),(74,365),(75,366),(75,367),(75,368),(75,369),(75,371),(75,372),(76,373),(76,374),(76,375),(76,376),(76,383),(77,377),(77,378),(77,379),(77,380),(77,384),(78,385),(78,386),(78,387),(78,388),(78,393),(79,389),(79,390),(79,391),(79,392),(79,394),(80,403),(80,404),(80,405),(80,406),(81,407),(81,408),(81,409),(81,410),(82,407),(83,407),(84,411),(84,555),(85,412),(86,415),(86,416),(86,549),(88,423),(88,547),(90,427),(90,435),(94,429),(95,431),(96,433),(97,453),(98,454),(99,455),(100,421),(100,545),(101,459),(102,460),(103,463),(104,464),(107,469),(108,471),(109,470),(110,467),(111,468),(112,482),(113,484),(114,485),(115,486),(118,490),(118,492),(118,511),(118,513),(118,515),(118,517),(118,519),(118,521),(118,523),(119,496),(119,497),(119,498),(119,499),(119,533),(119,535),(119,537),(119,541),(120,507),(120,531),(120,539),(121,509),(122,527),(122,529);
UNLOCK TABLES;
/*!40000 ALTER TABLE `graph_template_input_defs` ENABLE KEYS */;

--
-- Table structure for table `graph_templates`
--

DROP TABLE IF EXISTS `graph_templates`;
CREATE TABLE `graph_templates` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` char(32) collate latin1_german1_ci NOT NULL default '',
  `name` char(255) collate latin1_german1_ci NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci COMMENT='Contains each graph template name.';

--
-- Dumping data for table `graph_templates`
--


/*!40000 ALTER TABLE `graph_templates` DISABLE KEYS */;
LOCK TABLES `graph_templates` WRITE;
INSERT INTO `graph_templates` (`id`, `hash`, `name`) VALUES (34,'010b90500e1fc6a05abfd542940584d0','SNMP - Generic OID Template'),(2,'5deb0d66c81262843dce5f3861be9966','Interface - Traffic (bits/sec)'),(3,'abb5e813c9f1e8cd6fc1e393092ef8cb','ucd/net - Available Disk Space'),(4,'e334bdcf821cd27270a4cc945e80915e','ucd/net - CPU Usage'),(5,'280e38336d77acde4672879a7db823f3','Karlnet - Wireless Levels'),(6,'3109d88e6806d2ce50c025541b542499','Karlnet - Wireless Transmissions'),(7,'cf96dfb22b58e08bf101ca825377fa4b','Unix - Ping Latency'),(8,'9fe8b4da353689d376b99b2ea526cc6b','Unix - Processes'),(9,'fe5edd777a76d48fc48c11aded5211ef','Unix - Load Average'),(10,'63610139d44d52b195cc375636653ebd','Unix - Logged in Users'),(11,'5107ec0206562e77d965ce6b852ef9d4','ucd/net - Load Average'),(12,'6992ed4df4b44f3d5595386b8298f0ec','Linux - Memory Usage'),(13,'be275639d5680e94c72c0ebb4e19056d','ucd/net - Memory Usage'),(14,'f17e4a77b8496725dc924b8c35b60036','Netware - File System Cache'),(15,'46bb77f4c0c69671980e3c60d3f22fa9','Netware - CPU Utilization'),(16,'8e77a3036312fd0fda32eaea2b5f141b','Netware - File System Activity'),(17,'5892c822b1bb2d38589b6c27934b9936','Netware - Logged In Users'),(18,'9a5e6d7781cc1bd6cf24f64dd6ffb423','Cisco - CPU Usage'),(19,'0dd0438d5e6cad6776f79ecaa96fb708','Netware - Volume Information'),(20,'b18a3742ebea48c6198412b392d757fc','Netware - Directory Information'),(21,'8e7c8a511652fe4a8e65c69f3d34779d','Unix - Available Disk Space'),(22,'06621cd4a9289417cadcb8f9b5cfba80','Interface - Errors/Discards'),(23,'e0d1625a1f4776a5294583659d5cee15','Interface - Unicast Packets'),(24,'10ca5530554da7b73dc69d291bf55d38','Interface - Non-Unicast Packets'),(25,'df244b337547b434b486662c3c5c7472','Interface - Traffic (bytes/sec)'),(26,'7489e44466abee8a7d8636cb2cb14a1a','Host MIB - Available Disk Space'),(27,'c6bb62bedec4ab97f9db9fd780bd85a6','Host MIB - CPU Utilization'),(28,'e8462bbe094e4e9e814d4e681671ea82','Host MIB - Logged in Users'),(29,'62205afbd4066e5c4700338841e3901e','Host MIB - Processes'),(30,'e3780a13b0f7a3f85a44b70cd4d2fd36','Netware - Open Files'),(31,'1742b2066384637022d178cc5072905a','Interface - Traffic (bits/sec, 95th Percentile)'),(32,'13b47e10b2d5db45707d61851f69c52b','Interface - Traffic (bits/sec, Total Bandwidth)'),(33,'8ad6790c22b693680e041f21d62537ac','Interface - Traffic (bytes/sec, Total Bandwidth)'),(35,'612ad406cd5f5726673a924c402b0baf','Apache2 - Worker threads'),(36,'390d131342533c4897647eb590b4c8bc','Apache2 - Throughput'),(37,'4bd2e7e562bbf19a4647746b4ba97023','Apache2 - Requests'),(38,'f8f38817540d4c0e6ce81340ce3ecd9b','Apache2 - Request volume'),(39,'c739605bc7a3086188ea339cda182a80','MySQL - Threads'),(40,'843504ba6ad63708a5b758440f93199c','MySQL - Threading status'),(41,'88f6f409355d2bde10738e6695b00307','MySQL - Key blocks'),(42,'c76d63b25ba224e3168b9a994134ddd1','MySQL - Open Tables'),(43,'9132e4bee61a3c9ab8b35a0a1b6df6d8','MySQL - Query cache ressources'),(44,'8baf891800828064a3a0b9cdce7eafc2','MySQL - Query cache performance'),(45,'23468d9a126a2a048ea30bd976eff473','MySQL - Queries'),(46,'5b9338ec5ff20dc1839b1ff8c7e41f97','MySQL - InnoDB I/O bandwidth'),(47,'debe17f7895c0f82890031abdca7373d','WebStamp - Stamps'),(48,'3b5412d178204800046435b1a5989125','WebStamp - Orders'),(49,'7f8f3ae555fe08fc5e9767b9e3c92ff4','WebStamp - Users');
UNLOCK TABLES;
/*!40000 ALTER TABLE `graph_templates` ENABLE KEYS */;

--
-- Table structure for table `graph_templates_gprint`
--

DROP TABLE IF EXISTS `graph_templates_gprint`;
CREATE TABLE `graph_templates_gprint` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) collate latin1_german1_ci NOT NULL default '',
  `name` varchar(100) collate latin1_german1_ci NOT NULL default '',
  `gprint_text` varchar(255) collate latin1_german1_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `graph_templates_gprint`
--


/*!40000 ALTER TABLE `graph_templates_gprint` DISABLE KEYS */;
LOCK TABLES `graph_templates_gprint` WRITE;
INSERT INTO `graph_templates_gprint` (`id`, `hash`, `name`, `gprint_text`) VALUES (2,'e9c43831e54eca8069317a2ce8c6f751','Normal','%8.2lf %s'),(3,'19414480d6897c8731c7dc6c5310653e','Integer Numbers','%8.0lf'),(4,'304a778405392f878a6db435afffc1e9','Load Average','%8.2lf'),(5,'68bd196a867df208bbd792632b133e8a','5-Digit Integer','%5.0lf'),(6,'bbb3e27e2dd9e1bd42d02131c093908a','Unpadded Integer','%0.0lf');
UNLOCK TABLES;
/*!40000 ALTER TABLE `graph_templates_gprint` ENABLE KEYS */;

--
-- Table structure for table `graph_templates_graph`
--

DROP TABLE IF EXISTS `graph_templates_graph`;
CREATE TABLE `graph_templates_graph` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `local_graph_template_graph_id` mediumint(8) unsigned NOT NULL default '0',
  `local_graph_id` mediumint(8) unsigned NOT NULL default '0',
  `graph_template_id` mediumint(8) unsigned NOT NULL default '0',
  `t_image_format_id` char(2) collate latin1_german1_ci default '0',
  `image_format_id` tinyint(1) NOT NULL default '0',
  `t_title` char(2) collate latin1_german1_ci default '0',
  `title` varchar(255) collate latin1_german1_ci NOT NULL default '',
  `title_cache` varchar(255) collate latin1_german1_ci NOT NULL default '',
  `t_height` char(2) collate latin1_german1_ci default '0',
  `height` mediumint(8) NOT NULL default '0',
  `t_width` char(2) collate latin1_german1_ci default '0',
  `width` mediumint(8) NOT NULL default '0',
  `t_upper_limit` char(2) collate latin1_german1_ci default '0',
  `upper_limit` varchar(20) collate latin1_german1_ci NOT NULL default '0',
  `t_lower_limit` char(2) collate latin1_german1_ci default '0',
  `lower_limit` varchar(20) collate latin1_german1_ci NOT NULL default '0',
  `t_vertical_label` char(2) collate latin1_german1_ci default '0',
  `vertical_label` varchar(200) collate latin1_german1_ci default NULL,
  `t_auto_scale` char(2) collate latin1_german1_ci default '0',
  `auto_scale` char(2) collate latin1_german1_ci default NULL,
  `t_auto_scale_opts` char(2) collate latin1_german1_ci default '0',
  `auto_scale_opts` tinyint(1) NOT NULL default '0',
  `t_auto_scale_log` char(2) collate latin1_german1_ci default '0',
  `auto_scale_log` char(2) collate latin1_german1_ci default NULL,
  `t_auto_scale_rigid` char(2) collate latin1_german1_ci default '0',
  `auto_scale_rigid` char(2) collate latin1_german1_ci default NULL,
  `t_auto_padding` char(2) collate latin1_german1_ci default '0',
  `auto_padding` char(2) collate latin1_german1_ci default NULL,
  `t_base_value` char(2) collate latin1_german1_ci default '0',
  `base_value` mediumint(8) NOT NULL default '0',
  `t_grouping` char(2) collate latin1_german1_ci default '0',
  `grouping` char(2) collate latin1_german1_ci NOT NULL default '',
  `t_export` char(2) collate latin1_german1_ci default '0',
  `export` char(2) collate latin1_german1_ci default NULL,
  `t_unit_value` char(2) collate latin1_german1_ci default '0',
  `unit_value` varchar(20) collate latin1_german1_ci default NULL,
  `t_unit_exponent_value` char(2) collate latin1_german1_ci default '0',
  `unit_exponent_value` varchar(5) collate latin1_german1_ci NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `local_graph_id` (`local_graph_id`),
  KEY `graph_template_id` (`graph_template_id`),
  KEY `title_cache` (`title_cache`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci COMMENT='Stores the actual graph data.';

--
-- Dumping data for table `graph_templates_graph`
--


/*!40000 ALTER TABLE `graph_templates_graph` DISABLE KEYS */;
LOCK TABLES `graph_templates_graph` WRITE;
INSERT INTO `graph_templates_graph` (`id`, `local_graph_template_graph_id`, `local_graph_id`, `graph_template_id`, `t_image_format_id`, `image_format_id`, `t_title`, `title`, `title_cache`, `t_height`, `height`, `t_width`, `width`, `t_upper_limit`, `upper_limit`, `t_lower_limit`, `lower_limit`, `t_vertical_label`, `vertical_label`, `t_auto_scale`, `auto_scale`, `t_auto_scale_opts`, `auto_scale_opts`, `t_auto_scale_log`, `auto_scale_log`, `t_auto_scale_rigid`, `auto_scale_rigid`, `t_auto_padding`, `auto_padding`, `t_base_value`, `base_value`, `t_grouping`, `grouping`, `t_export`, `export`, `t_unit_value`, `unit_value`, `t_unit_exponent_value`, `unit_exponent_value`) VALUES (2,0,0,2,'',1,'on','|host_description| - Traffic','','',120,'',500,'','100','','0','','bits per second','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(3,0,0,3,'',1,'on','|host_description| - Hard Drive Space','','',120,'',500,'','100','','0','','bytes','','on','',2,'','','','on','','on','',1024,'0','','','on','','','',''),(4,0,0,4,'',1,'','|host_description| - CPU Usage','','',120,'',500,'','100','','0','','percent','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(5,0,0,5,'',1,'on','|host_description| - Wireless Levels','','',120,'',500,'','100','','0','','percent','','','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(6,0,0,6,'',1,'on','|host_description| - Wireless Transmissions','','',120,'',500,'','100','','0','','transmissions','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(7,0,0,7,'',1,'','|host_description| - Ping Latency','','',120,'',500,'','100','','0','','milliseconds','','on','',2,'','','','','','on','',1000,'0','','','on','','','',''),(8,0,0,8,'',1,'','|host_description| - Processes','','',120,'',500,'','100','','0','','processes','','on','',2,'','','','','','on','',1000,'0','','','on','','','',''),(9,0,0,9,'',1,'','|host_description| - Load Average','','',120,'',500,'','100','','0','','processes in the run queue','','on','',2,'','','','on','','on','',1000,'0','','','on','','','','0'),(10,0,0,10,'',1,'','|host_description| - Logged in Users','','',120,'',500,'','100','','0','','users','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(11,0,0,11,'',1,'','|host_description| - Load Average','','',120,'',500,'','100','','0','','processes in the run queue','','on','',2,'','','','on','','on','',1000,'0','','','on','','','','0'),(12,0,0,12,'',1,'','|host_description| - Memory Usage','','',120,'',500,'','100','','0','','kilobytes','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(13,0,0,13,'',1,'','|host_description| - Memory Usage','','',120,'',500,'','100','','0','','bytes','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(14,0,0,14,'',1,'','|host_description| - File System Cache','','',120,'',500,'','100','','0','','cache checks/hits','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(15,0,0,15,'',1,'','|host_description| - CPU Utilization','','',120,'',500,'','100','','0','','percent','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(16,0,0,16,'',1,'','|host_description| - File System Activity','','',120,'',500,'','100','','0','','reads/writes per sec','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(17,0,0,17,'',1,'','|host_description| - Logged In Users','','',120,'',500,'','100','','0','','users','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(18,0,0,18,'',1,'','|host_description| - CPU Usage','','',120,'',500,'','100','','0','','percent','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(19,0,0,19,'',1,'on','|host_description| - Volume Information','','',120,'',500,'','100','','0','','bytes','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(20,0,0,20,'',1,'','|host_description| - Directory Information','','',120,'',500,'','100','','0','','directory entries','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(21,0,0,21,'',1,'on','|host_description| - Available Disk Space','','',120,'',500,'','100','','0','','bytes','','on','',2,'','','','on','','on','',1024,'0','','','on','','','',''),(22,0,0,22,'',1,'on','|host_description| - Errors/Discards','','',120,'',500,'','100','','0','','errors/sec','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(23,0,0,23,'',1,'on','|host_description| - Unicast Packets','','',120,'',500,'','100','','0','','packets/sec','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(24,0,0,24,'',1,'on','|host_description| - Non-Unicast Packets','','',120,'',500,'','100','','0','','packets/sec','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(25,0,0,25,'',1,'on','|host_description| - Traffic','','',120,'',500,'','100','','0','','bytes per second','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(34,0,0,26,'',1,'on','|host_description| - Available Disk Space','','',120,'',500,'','100','','0','','bytes','','on','',2,'','','','on','','on','',1024,'0','','','on','','','',''),(35,0,0,27,'',1,'on','|host_description| - CPU Utilization','','',120,'',500,'','100','','0','','percent','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(36,0,0,28,'',1,'','|host_description| - Logged in Users','','',120,'',500,'','100','','0','','users','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(37,0,0,29,'',1,'','|host_description| - Processes','','',120,'',500,'','100','','0','','processes','','on','',2,'','','','','','on','',1000,'0','','','on','','','',''),(38,12,1,12,'0',1,'0','|host_description| - Memory Usage','Localhost - Memory Usage','0',120,'0',500,'0','100','0','0','0','kilobytes','0','on','0',2,'0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(39,9,2,9,'0',1,'0','|host_description| - Load Average','Localhost - Load Average','0',120,'0',500,'0','100','0','0','0','processes in the run queue','0','on','0',2,'0','','0','on','0','on','0',1000,'0','','0','on','0','','0','0'),(40,10,3,10,'0',1,'0','|host_description| - Logged in Users','Localhost - Logged in Users','0',120,'0',500,'0','100','0','0','0','users','0','on','0',2,'0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(41,8,4,8,'0',1,'0','|host_description| - Processes','Localhost - Processes','0',120,'0',500,'0','100','0','0','0','processes','0','on','0',2,'0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(42,0,0,30,'',1,'','|host_description| - Open Files','','',120,'',500,'','100','','0','','files','','on','',2,'','','','','','on','',1000,'0','','','on','','','',''),(43,0,0,31,'',1,'on','|host_description| - Traffic','','',120,'',500,'','100','','0','','bits per second','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(44,0,0,32,'',1,'on','|host_description| - Traffic','','',120,'',500,'','100','','0','','bits per second','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(45,0,0,33,'',1,'on','|host_description| - Traffic','','',120,'',500,'','100','','0','','bytes per second','','on','',2,'','','','on','','on','',1000,'0','','','on','','','',''),(47,0,0,34,'',1,'on','|host_description| -','','',120,'',500,'','100','','0','on','','','on','',2,'','','','','','on','',1000,'0','','','on','','','',''),(48,0,0,35,'',1,'','Apache2 - Worker threads','','',120,'',500,'','100','','0','','threads','','on','',2,'','','','','','on','',1000,'0','','','on','','','',''),(49,48,5,35,'0',1,'0','Apache2 - Worker threads','Apache2 - Worker threads','0',120,'0',500,'0','100','0','0','0','threads','0','on','0',2,'0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(50,0,0,36,'',1,'','Apache2 - Throughput','','',120,'',500,'','100','','0','','kB/s','','on','',2,'','','','','','on','',1024,'0','','','on','','','',''),(52,50,7,36,'0',1,'0','Apache2 - Throughput','Apache2 - Throughput','0',120,'0',500,'0','100','0','0','0','kB/s','0','on','0',2,'0','','0','','0','on','0',1024,'0','','0','on','0','','0',''),(57,0,0,39,'',1,'','MySQL - Threads','','',120,'',500,'','100','','0','','','','on','',2,'','','','','','on','',1000,'0','','','on','','','',''),(53,0,0,37,'',1,'','Apache2 - Requests','','',120,'',500,'','100','','0','','','','on','',2,'','','','','','on','',1000,'0','','','on','','','',''),(54,53,8,37,'0',1,'0','Apache2 - Requests','Apache2 - Requests','0',120,'0',500,'0','100','0','0','0','','0','on','0',2,'0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(55,0,0,38,'',1,'','Apache2 - Request volume','','',120,'',500,'','100','','0','','bytes/request','','on','',2,'','','','','','on','',1024,'0','','','on','','','',''),(56,55,9,38,'0',1,'0','Apache2 - Request volume','Apache2 - Request volume','0',120,'0',500,'0','100','0','0','0','bytes/request','0','on','0',2,'0','','0','','0','on','0',1024,'0','','0','on','0','','0',''),(80,0,0,47,'',1,'','WebStamp - Stamps','','',120,'',500,'','0','','0','','stamps','','on','',2,'','','','','','on','',1000,'0','','','on','','','','0'),(68,67,18,41,'0',1,'0','MySQL - Key blocks','MySQL - Key blocks','0',120,'0',500,'0','100','0','0','0','','0','on','0',2,'0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(78,0,0,46,'',1,'','MySQL - InnoDB I/O bandwidth','','',120,'',500,'','100','','0','','','','on','',2,'','','','','','on','',1024,'0','','','on','','','',''),(67,0,0,41,'',1,'','MySQL - Key blocks','','',120,'',500,'','100','','0','','','','on','',2,'','','','','','on','',1000,'0','','','on','','','',''),(65,0,0,40,'',1,'','MySQL - Threading status','','',120,'',500,'','100','','0','','','','on','',2,'','','','','','on','',1000,'0','','','on','','','',''),(69,0,0,42,'',1,'','MySQL - Open Tables','','',120,'',500,'','100','','0','','','','on','',2,'','','','','','on','',1000,'0','','','on','','','',''),(70,69,19,42,'0',1,'0','MySQL - Open Tables','MySQL - Open Tables','0',120,'0',500,'0','100','0','0','0','','0','on','0',2,'0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(71,0,0,43,'',1,'','MySQL - Query cache ressources','','',120,'',500,'','100','','0','','','','on','',2,'','','','','','on','',1000,'0','','','on','','','',''),(72,0,0,44,'',1,'','MySQL - Query cache performance','','',120,'',500,'','100','','0','','','','on','',2,'','','','','','on','',1000,'0','','','on','','','',''),(73,72,20,44,'0',1,'0','MySQL - Query cache performance','MySQL - Query cache performance','0',120,'0',500,'0','100','0','0','0','','0','on','0',2,'0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(74,71,21,43,'0',1,'0','MySQL - Query cache ressources','MySQL - Query cache ressources','0',120,'0',500,'0','100','0','0','0','','0','on','0',2,'0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(76,0,0,45,'',1,'','MySQL - Queries','','',120,'',500,'','100','','0','','','','on','',2,'','','','','','on','',1000,'0','','','on','','','',''),(77,76,23,45,'0',1,'0','MySQL - Queries','MySQL - Queries','0',120,'0',500,'0','100','0','0','0','','0','on','0',2,'0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(79,78,24,46,'0',1,'0','MySQL - InnoDB I/O bandwidth','MySQL - InnoDB I/O bandwidth','0',120,'0',500,'0','100','0','0','0','','0','on','0',2,'0','','0','','0','on','0',1024,'0','','0','on','0','','0',''),(82,0,0,48,'',1,'','WebStamp - Orders','','',120,'',500,'','9999','','0','','orders','','on','',2,'','','','','','on','',1000,'0','','','on','','0','',''),(83,80,26,47,'0',1,'0','WebStamp - Stamps','WebStamp - Stamps','0',120,'0',500,'0','0','0','0','0','stamps','0','on','0',2,'0','','0','','0','on','0',1000,'0','','0','on','0','','0','0'),(84,82,27,48,'0',1,'0','WebStamp - Orders','WebStamp - Orders','0',120,'0',500,'0','9999','0','0','0','orders','0','on','0',2,'0','','0','','0','on','0',1000,'0','','0','on','0','0','0',''),(85,0,0,49,'',1,'','WebStamp - Users','','',120,'',500,'','100','','0','','users','','on','',2,'','','','','','on','',1000,'0','','','on','','','','0'),(86,85,28,49,'0',1,'0','WebStamp - Users','WebStamp - Users','0',120,'0',500,'0','100','0','0','0','users','0','on','0',2,'0','','0','','0','on','0',1000,'0','','0','on','0','','0','0');
UNLOCK TABLES;
/*!40000 ALTER TABLE `graph_templates_graph` ENABLE KEYS */;

--
-- Table structure for table `graph_templates_item`
--

DROP TABLE IF EXISTS `graph_templates_item`;
CREATE TABLE `graph_templates_item` (
  `id` int(12) unsigned NOT NULL auto_increment,
  `hash` varchar(32) collate latin1_german1_ci NOT NULL default '',
  `local_graph_template_item_id` int(12) unsigned NOT NULL default '0',
  `local_graph_id` mediumint(8) unsigned NOT NULL default '0',
  `graph_template_id` mediumint(8) unsigned NOT NULL default '0',
  `task_item_id` mediumint(8) unsigned NOT NULL default '0',
  `color_id` mediumint(8) unsigned NOT NULL default '0',
  `graph_type_id` tinyint(3) NOT NULL default '0',
  `cdef_id` mediumint(8) unsigned NOT NULL default '0',
  `consolidation_function_id` tinyint(2) NOT NULL default '0',
  `text_format` varchar(255) collate latin1_german1_ci default NULL,
  `value` varchar(255) collate latin1_german1_ci default NULL,
  `hard_return` char(2) collate latin1_german1_ci default NULL,
  `gprint_id` mediumint(8) unsigned NOT NULL default '0',
  `sequence` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `graph_template_id` (`graph_template_id`),
  KEY `local_graph_id` (`local_graph_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci COMMENT='Stores the actual graph item data.';

--
-- Dumping data for table `graph_templates_item`
--


/*!40000 ALTER TABLE `graph_templates_item` DISABLE KEYS */;
LOCK TABLES `graph_templates_item` WRITE;
INSERT INTO `graph_templates_item` (`id`, `hash`, `local_graph_template_item_id`, `local_graph_id`, `graph_template_id`, `task_item_id`, `color_id`, `graph_type_id`, `cdef_id`, `consolidation_function_id`, `text_format`, `value`, `hard_return`, `gprint_id`, `sequence`) VALUES (9,'0470b2427dbfadb6b8346e10a71268fa',0,0,2,54,22,7,2,1,'Inbound','','',2,1),(10,'84a5fe0db518550266309823f994ce9c',0,0,2,54,0,9,2,4,'Current:','','',2,2),(11,'2f222f28084085cd06a1f46e4449c793',0,0,2,54,0,9,2,1,'Average:','','',2,3),(12,'55acbcc33f46ee6d754e8e81d1b54808',0,0,2,54,0,9,2,3,'Maximum:','','on',2,4),(13,'fdaf2321fc890e355711c2bffc07d036',0,0,2,55,20,4,2,1,'Outbound','','',2,5),(14,'768318f42819217ed81196d2179d3e1b',0,0,2,55,0,9,2,4,'Current:','','',2,6),(15,'cb3aa6256dcb3acd50d4517b77a1a5c3',0,0,2,55,0,9,2,1,'Average:','','',2,7),(16,'671e989be7cbf12c623b4e79d91c7bed',0,0,2,55,0,9,2,3,'Maximum:','','',2,8),(17,'b561ed15b3ba66d277e6d7c1640b86f7',0,0,3,4,48,7,14,1,'Used','','',2,1),(18,'99ef051057fa6adfa6834a7632e9d8a2',0,0,3,4,0,9,14,4,'Current:','','',2,2),(19,'3986695132d3f4716872df4c6fbccb65',0,0,3,4,0,9,14,1,'Average:','','',2,3),(20,'0444300017b368e6257f010dca8bbd0d',0,0,3,4,0,9,14,3,'Maximum:','','on',2,4),(21,'4d6a0b9063124ca60e2d1702b3e15e41',0,0,3,3,20,8,14,1,'Available','','',2,5),(22,'181b08325e4d00cd50b8cdc8f8ae8e77',0,0,3,3,0,9,14,4,'Current:','','',2,6),(23,'bba0a9ff1357c990df50429d64314340',0,0,3,3,0,9,14,1,'Average:','','',2,7),(24,'d4a67883d53bc1df8aead21c97c0bc52',0,0,3,3,0,9,14,3,'Maximum:','','on',2,8),(25,'253c9ec2d66905245149c1c2dc8e536e',0,0,3,0,1,5,15,1,'Total','','',2,9),(26,'ea9ea883383f4eb462fec6aa309ba7b5',0,0,3,0,0,9,15,4,'Current:','','',2,10),(27,'83b746bcaba029eeca170a9f77ec4864',0,0,3,0,0,9,15,1,'Average:','','',2,11),(28,'82e01dd92fd37887c0696192efe7af65',0,0,3,0,0,9,15,3,'Maximum:','','',2,12),(29,'ff0a6125acbb029b814ed1f271ad2d38',0,0,4,5,9,7,0,1,'System','','',2,1),(30,'f0776f7d6638bba76c2c27f75a424f0f',0,0,4,5,0,9,0,4,'Current:','','',2,2),(31,'39f4e021aa3fed9207b5f45a82122b21',0,0,4,5,0,9,0,1,'Average:','','',2,3),(32,'800f0b067c06f4ec9c2316711ea83c1e',0,0,4,5,0,9,0,3,'Maximum:','','on',2,4),(33,'9419dd5dbf549ba4c5dc1462da6ee321',0,0,4,6,21,8,0,1,'User','','',2,5),(34,'e461dd263ae47657ea2bf3fd82bec096',0,0,4,6,0,9,0,4,'Current:','','',2,6),(35,'f2d1fbb8078a424ffc8a6c9d44d8caa0',0,0,4,6,0,9,0,1,'Average:','','',2,7),(36,'e70a5de639df5ba1705b5883da7fccfc',0,0,4,6,0,9,0,3,'Maximum:','','on',2,8),(37,'85fefb25ce9fd0317da2706a5463fc42',0,0,4,7,12,8,0,1,'Nice','','',2,9),(38,'a1cb26878776999db16f1de7577b3c2a',0,0,4,7,0,9,0,4,'Current:','','',2,10),(39,'7d0f9bf64a0898a0095f099674754273',0,0,4,7,0,9,0,1,'Average:','','',2,11),(40,'b2879248a522d9679333e1f29e9a87c3',0,0,4,7,0,9,0,3,'Maximum:','','on',2,12),(41,'d800aa59eee45383b3d6d35a11cdc864',0,0,4,0,1,4,12,1,'Total','','',2,13),(42,'cab4ae79a546826288e273ca1411c867',0,0,4,0,0,9,12,4,'Current:','','',2,14),(43,'d44306ae85622fec971507460be63f5c',0,0,4,0,0,9,12,1,'Average:','','',2,15),(44,'aa5c2118035bb83be497d4e099afcc0d',0,0,4,0,0,9,12,3,'Maximum:','','',2,16),(45,'4aa34ea1b7542b770ace48e8bc395a22',0,0,5,9,48,7,0,1,'Signal Level','','',2,1),(46,'22f118a9d81d0a9c8d922efbbc8a9cc1',0,0,5,9,0,9,0,4,'Current:','','',2,2),(47,'229de0c4b490de9d20d8f8d41059f933',0,0,5,9,0,9,0,1,'Average:','','',2,3),(48,'cd17feb30c02fd8f21e4d4dcde04e024',0,0,5,9,0,9,0,3,'Maximum:','','on',2,4),(49,'8723600cfd0f8a7b3f7dc1361981aabd',0,0,5,8,25,5,0,1,'Noise Level','','',2,5),(50,'cb06be2601b5abfb7a42fc07586de1c2',0,0,5,8,0,9,0,4,'Current:','','',2,6),(51,'55a2ee0fd511e5210ed85759171de58f',0,0,5,8,0,9,0,1,'Average:','','',2,7),(52,'704459564c84e42462e106eef20db169',0,0,5,8,0,9,0,3,'Maximum:','','',2,8),(53,'aaebb19ec522497eaaf8c87a631b7919',0,0,6,10,48,7,0,1,'Transmissions','','',2,1),(54,'8b54843ac9d41bce2fcedd023560ed64',0,0,6,10,0,9,0,4,'Current:','','',2,2),(55,'05927dc83e07c7d9cffef387d68f35c9',0,0,6,10,0,9,0,1,'Average:','','',2,3),(56,'d11e62225a7e7a0cdce89242002ca547',0,0,6,10,0,9,0,3,'Maximum:','','on',2,4),(57,'6397b92032486c476b0e13a35b727041',0,0,6,11,25,5,0,1,'Re-Transmissions','','',2,5),(58,'cdfa5f8f82f4c479ff7f6f54160703f6',0,0,6,11,0,9,0,4,'Current:','','',2,6),(59,'ce2a309fb9ef64f83f471895069a6f07',0,0,6,11,0,9,0,1,'Average:','','',2,7),(60,'9cbfbf57ebde435b27887f27c7d3caea',0,0,6,11,0,9,0,3,'Maximum:','','',2,8),(61,'80e0aa956f50c261e5143273da58b8a3',0,0,7,21,25,7,0,1,'','','',2,1),(62,'48fdcae893a7b7496e1a61efc3453599',0,0,7,21,0,9,0,4,'Current:','','',2,2),(63,'22f43e5fa20f2716666ba9ed9a7d1727',0,0,7,21,0,9,0,1,'Average:','','',2,3),(64,'3e86d497bcded7af7ab8408e4908e0d8',0,0,7,21,0,9,0,3,'Maximum:','','',2,4),(65,'ba00ecd28b9774348322ff70a96f2826',0,0,8,19,48,7,0,1,'Running Processes','','',2,1),(66,'8d76de808efd73c51e9a9cbd70579512',0,0,8,19,0,9,0,4,'Current:','','',3,2),(67,'304244ca63d5b09e62a94c8ec6fbda8d',0,0,8,19,0,9,0,1,'Average:','','',3,3),(68,'da1ba71a93d2ed4a2a00d54592b14157',0,0,8,19,0,9,0,3,'Maximum:','','',3,4),(69,'93ad2f2803b5edace85d86896620b9da',0,0,9,12,15,7,0,1,'1 Minute Average','','',2,1),(70,'e28736bf63d3a3bda03ea9f1e6ecb0f1',0,0,9,12,0,9,0,4,'Current:','','on',4,2),(71,'bbdfa13adc00398eed132b1ccb4337d2',0,0,9,13,8,8,0,1,'5 Minute Average','','',2,3),(72,'2c14062c7d67712f16adde06132675d6',0,0,9,13,0,9,0,4,'Current:','','on',4,4),(73,'9cf6ed48a6a54b9644a1de8c9929bd4e',0,0,9,14,9,8,0,1,'15 Minute Average','','',2,5),(74,'c9824064305b797f38feaeed2352e0e5',0,0,9,14,0,9,0,4,'Current:','','on',4,6),(75,'fa1bc4eff128c4da70f5247d55b8a444',0,0,9,0,1,4,12,1,'','','',2,7),(76,'5c94ac24bc0d6d2712cc028fa7d4c7d2',0,0,10,20,67,7,0,1,'Users','','',2,1),(77,'8bc7f905526f62df7d5c2d8c27c143c1',0,0,10,20,0,9,0,4,'Current:','','',3,2),(78,'cd074cd2b920aab70d480c020276d45b',0,0,10,20,0,9,0,1,'Average:','','',3,3),(79,'415630f25f5384ba0c82adbdb05fe98b',0,0,10,20,0,9,0,3,'Maximum:','','',3,4),(80,'d77d2050be357ab067666a9485426e6b',0,0,11,33,15,7,0,1,'1 Minute Average','','',2,1),(81,'13d22f5a0eac6d97bf6c97d7966f0a00',0,0,11,33,0,9,0,4,'Current:','','on',4,2),(82,'8580230d31d2851ec667c296a665cbf9',0,0,11,34,8,8,0,1,'5 Minute Average','','',2,3),(83,'b5b7d9b64e7640aa51dbf58c69b86d15',0,0,11,34,0,9,0,4,'Current:','','on',4,4),(84,'2ec10edf4bfaa866b7efd544d4c3f446',0,0,11,35,9,8,0,1,'15 Minute Average','','',2,5),(85,'b65666f0506c0c70966f493c19607b93',0,0,11,35,0,9,0,4,'Current:','','on',4,6),(86,'6c73575c74506cfc75b89c4276ef3455',0,0,11,0,1,4,12,1,'Total','','',2,7),(380,'0e715933830112c23c15f7e3463f77b6',0,0,32,55,0,9,2,3,'Maximum:','','',2,11),(379,'979fff9d691ca35e3f4b3383d9cae43f',0,0,32,55,0,9,2,1,'Average:','','',2,8),(378,'5bff63207c7bf076d76ff3036b5dad54',0,0,32,55,0,9,2,4,'Current:','','',2,7),(377,'4a381a8e87d4db1ac99cf8d9078266d3',0,0,32,55,20,4,2,1,'Outbound','','',2,6),(376,'88d3094d5dc2164cbf2f974aeb92f051',0,0,32,54,0,9,2,3,'Maximum:','','',2,4),(375,'54782f71929e7d1734ed5ad4b8dda50d',0,0,32,54,0,9,2,1,'Average:','','',2,3),(374,'55083351cd728b82cc4dde68eb935700',0,0,32,54,0,9,2,4,'Current:','','',2,2),(95,'5fa7c2317f19440b757ab2ea1cae6abc',0,0,12,16,41,7,14,1,'Free','','',2,9),(96,'b1d18060bfd3f68e812c508ff4ac94ed',0,0,12,16,0,9,14,4,'Current:','','',2,10),(97,'780b6f0850aaf9431d1c246c55143061',0,0,12,16,0,9,14,1,'Average:','','',2,11),(98,'2d54a7e7bb45e6c52d97a09e24b7fba7',0,0,12,16,0,9,14,3,'Maximum:','','on',2,12),(99,'40206367a3c192b836539f49801a0b15',0,0,12,18,30,8,14,1,'Swap','','',2,13),(100,'7ee72e2bb3722d4f8a7f9c564e0dd0d0',0,0,12,18,0,9,14,4,'Current:','','',2,14),(101,'c8af33b949e8f47133ee25e63c91d4d0',0,0,12,18,0,9,14,1,'Average:','','',2,15),(102,'568128a16723d1195ce6a234d353ce00',0,0,12,18,0,9,14,3,'Maximum:','','',2,16),(103,'7517a40d478e28ed88ba2b2a65e16b57',0,0,13,37,52,7,14,1,'Memory Free','','',2,1),(104,'df0c8b353d26c334cb909dc6243957c5',0,0,13,37,0,9,14,4,'Current:','','',2,2),(105,'c41a4cf6fefaf756a24f0a9510580724',0,0,13,37,0,9,14,1,'Average:','','',2,3),(106,'9efa8f01c6ed11364a21710ff170f422',0,0,13,37,0,9,14,3,'Maximum:','','on',2,4),(107,'95d6e4e5110b456f34324f7941d08318',0,0,13,36,35,8,14,1,'Memory Buffers','','',2,5),(108,'0c631bfc0785a9cca68489ea87a6c3da',0,0,13,36,0,9,14,4,'Current:','','',2,6),(109,'3468579d3b671dfb788696df7dcc1ec9',0,0,13,36,0,9,14,1,'Average:','','',2,7),(110,'c3ddfdaa65449f99b7f1a735307f9abe',0,0,13,36,0,9,14,3,'Maximum:','','on',2,8),(111,'4c64d5c1ce8b5d8b94129c23b46a5fd6',0,0,14,28,41,7,0,1,'Cache Hits','','',2,1),(112,'5c1845c9bd1af684a3c0ad843df69e3e',0,0,14,28,0,9,0,4,'Current:','','',3,2),(113,'e5169563f3f361701902a8da3ac0c77f',0,0,14,28,0,9,0,1,'Average:','','',3,3),(114,'35e87262efa521edbb1fd27f09c036f5',0,0,14,28,0,9,0,3,'Maximum:','','on',3,4),(115,'53069d7dba4c31b338f609bea4cd16f3',0,0,14,27,66,8,0,1,'Cache Checks','','',2,5),(116,'d9c102579839c5575806334d342b50de',0,0,14,27,0,9,0,4,'Current:','','',3,6),(117,'dc1897c3249dbabe269af49cee92f8c0',0,0,14,27,0,9,0,1,'Average:','','',3,7),(118,'ccd21fe0b5a8c24057f1eff4a6b66391',0,0,14,27,0,9,0,3,'Maximum:','','',3,8),(119,'ab09d41c358f6b8a9d0cad4eccc25529',0,0,15,76,9,7,0,1,'CPU Utilization','','',2,1),(120,'5d5b8d8fbe751dc9c86ee86f85d7433b',0,0,15,76,0,9,0,4,'Current:','','',3,2),(121,'4822a98464c6da2afff10c6d12df1831',0,0,15,76,0,9,0,1,'Average:','','',3,3),(122,'fc6fbf2a964bea0b3c88ed0f18616aa7',0,0,15,76,0,9,0,3,'Maximum:','','',3,4),(123,'e4094625d5443b4c87f9a87ba616a469',0,0,16,25,67,7,0,1,'File System Reads','','',2,1),(124,'ae68425cd10e8a6623076b2e6859a6aa',0,0,16,25,0,9,0,4,'Current:','','',3,2),(125,'40b8e14c6568b3f6be6a5d89d6a9f061',0,0,16,25,0,9,0,1,'Average:','','',3,3),(126,'4afbdc3851c03e206672930746b1a5e2',0,0,16,25,0,9,0,3,'Maximum:','','on',3,4),(127,'ea47d2b5516e334bc5f6ce1698a3ae76',0,0,16,26,93,8,0,1,'File System Writes','','',2,5),(128,'899c48a2f79ea3ad4629aff130d0f371',0,0,16,26,0,9,0,4,'Current:','','',3,6),(129,'ab474d7da77e9ec1f6a1d45c602580cd',0,0,16,26,0,9,0,1,'Average:','','',3,7),(130,'e143f8b4c6d4eeb6a28b052e6b8ce5a9',0,0,16,26,0,9,0,3,'Maximum:','','',3,8),(131,'facfeeb6fc2255ba2985b2d2f695d78a',0,0,17,23,30,7,0,1,'Current Logins','','',2,1),(132,'2470e43034a5560260d79084432ed14f',0,0,17,23,0,9,0,4,'Current:','','',3,2),(133,'e9e645f07bde92b52d93a7a1f65efb30',0,0,17,23,0,9,0,1,'Average:','','',3,3),(134,'bdfe0d66103211cfdaa267a44a98b092',0,0,17,23,0,9,0,3,'Maximum:','','on',3,4),(360,'5258970186e4407ed31cca2782650c45',0,0,30,29,0,9,0,1,'Average:','','',3,3),(359,'da26dd92666cb840f8a70e2ec5e90c07',0,0,30,29,0,9,0,4,'Current:','','',3,2),(358,'803b96bcaec33148901b4b562d9d2344',0,0,30,29,89,7,0,1,'Open Files','','',2,1),(139,'098b10c13a5701ddb7d4d1d2e2b0fdb7',0,0,18,30,9,7,0,1,'CPU Usage','','',2,1),(140,'1dbda412a9926b0ee5c025aa08f3b230',0,0,18,30,0,9,0,4,'Current:','','',3,2),(141,'725c45917146807b6a4257fc351f2bae',0,0,18,30,0,9,0,1,'Average:','','',3,3),(142,'4e336fdfeb84ce65f81ded0e0159a5e0',0,0,18,30,0,9,0,3,'Maximum:','','',3,4),(143,'7dab7a3ceae2addd1cebddee6c483e7c',0,0,19,39,25,7,14,1,'Free Space','','',2,5),(144,'aea239f3ceea8c63d02e453e536190b8',0,0,19,39,0,9,14,4,'Current:','','',2,6),(145,'a0efae92968a6d4ae099b676e0f1430e',0,0,19,39,0,9,14,1,'Average:','','',2,7),(146,'4fd5ba88be16e3d513c9231b78ccf0e1',0,0,19,39,0,9,14,3,'Maximum:','','on',2,8),(147,'d2e98e51189e1d9be8888c3d5c5a4029',0,0,19,38,69,7,14,1,'Total Space','','',2,1),(148,'12829294ee3958f4a31a58a61228e027',0,0,19,38,0,9,14,4,'Current:','','',2,2),(149,'4b7e8755b0f2253723c1e9fb21fd37b1',0,0,19,38,0,9,14,1,'Average:','','',2,3),(150,'cbb19ffd7a0ead2bf61512e86d51ee8e',0,0,19,38,0,9,14,3,'Maximum:','','on',2,4),(151,'37b4cbed68f9b77e49149343069843b4',0,0,19,40,95,5,14,1,'Freeable Space','','',2,9),(152,'5eb7532200f2b5cc93e13743a7db027c',0,0,19,40,0,9,14,4,'Current:','','',2,10),(153,'b0f9f602fbeaaff090ea3f930b46c1c7',0,0,19,40,0,9,14,1,'Average:','','',2,11),(154,'06477f7ea46c63272cee7253e7cd8760',0,0,19,40,0,9,14,3,'Maximum:','','on',2,12),(171,'a751838f87068e073b95be9555c57bde',0,0,21,56,0,9,14,3,'Maximum:','','on',2,4),(170,'3b13eb2e542fe006c9bf86947a6854fa',0,0,21,56,0,9,14,1,'Average:','','',2,3),(169,'8ef3e7fb7ce962183f489725939ea40f',0,0,21,56,0,9,14,4,'Current:','','',2,2),(167,'6ca2161c37b0118786dbdb46ad767e5d',0,0,21,56,48,7,14,1,'Used','','',2,1),(159,'6877a2a5362a9390565758b08b9b37f7',0,0,20,43,77,7,0,1,'Used Directory Entries','','',2,1),(160,'a978834f3d02d833d3d2def243503bf2',0,0,20,43,0,9,0,4,'Current:','','',3,2),(161,'7422d87bc82de20a4333bd2f6460b2d4',0,0,20,43,0,9,0,1,'Average:','','',3,3),(162,'4d52762859a3fec297ebda0e7fd760d9',0,0,20,43,0,9,0,3,'Maximum:','','on',3,4),(163,'999d4ed1128ff03edf8ea47e56d361dd',0,0,20,42,1,5,0,1,'Available Directory Entries','','',2,5),(164,'3dfcd7f8c7a760ac89d34398af79b979',0,0,20,42,0,9,0,4,'Current:','','',3,6),(165,'217be75e28505c8f8148dec6b71b9b63',0,0,20,42,0,9,0,1,'Average:','','',3,7),(166,'69b89e1c5d6fc6182c93285b967f970a',0,0,20,42,0,9,0,3,'Maximum:','','',3,8),(172,'5d6dff9c14c71dc1ebf83e87f1c25695',0,0,21,44,20,8,14,1,'Available','','',2,5),(173,'b27cb9a158187d29d17abddc6fdf0f15',0,0,21,44,0,9,14,4,'Current:','','',2,6),(174,'6c0555013bb9b964e51d22f108dae9b0',0,0,21,44,0,9,14,1,'Average:','','',2,7),(175,'42ce58ec17ef5199145fbf9c6ee39869',0,0,21,44,0,9,14,3,'Maximum:','','on',2,8),(176,'9bdff98f2394f666deea028cbca685f3',0,0,21,0,1,5,15,1,'Total','','',2,9),(177,'fb831fefcf602bc31d9d24e8e456c2e6',0,0,21,0,0,9,15,4,'Current:','','',2,10),(178,'5a958d56785a606c08200ef8dbf8deef',0,0,21,0,0,9,15,1,'Average:','','',2,11),(179,'5ce67a658cec37f526dc84ac9e08d6e7',0,0,21,0,0,9,15,3,'Maximum:','','on',2,12),(180,'7e04a041721df1f8828381a9ea2f2154',0,0,22,47,31,4,0,1,'Discards In','','',2,1),(181,'afc8bca6b1b3030a6d71818272336c6c',0,0,22,47,0,9,0,4,'Current:','','',2,2),(182,'6ac169785f5aeaf1cc5cdfd38dfcfb6c',0,0,22,47,0,9,0,1,'Average:','','',2,3),(183,'178c0a0ce001d36a663ff6f213c07505',0,0,22,47,0,9,0,3,'Maximum:','','on',2,4),(184,'8e3268c0abde7550616bff719f10ee2f',0,0,22,46,48,4,0,1,'Errors In','','',2,5),(185,'18891392b149de63b62c4258a68d75f8',0,0,22,46,0,9,0,4,'Current:','','',2,6),(186,'dfc9d23de0182c9967ae3dabdfa55a16',0,0,22,46,0,9,0,1,'Average:','','',2,7),(187,'c47ba64e2e5ea8bf84aceec644513176',0,0,22,46,0,9,0,3,'Maximum:','','on',2,8),(188,'9d052e7d632c479737fbfaced0821f79',0,0,23,49,71,4,0,1,'Unicast Packets Out','','',2,5),(189,'9b9fa6268571b6a04fa4411d8e08c730',0,0,23,49,0,9,0,4,'Current:','','',2,6),(190,'8e8f2fbeb624029cbda1d2a6ddd991ba',0,0,23,49,0,9,0,1,'Average:','','',2,7),(191,'c76495beb1ed01f0799838eb8a893124',0,0,23,49,0,9,0,3,'Maximum:','','on',2,8),(192,'d4e5f253f01c3ea77182c5a46418fc44',0,0,23,48,25,7,0,1,'Unicast Packets In','','',2,1),(193,'526a96add143da021c5f00d8764a6c12',0,0,23,48,0,9,0,4,'Current:','','',2,2),(194,'81eeb46f451212f00fd7caee42a81c0b',0,0,23,48,0,9,0,1,'Average:','','',2,3),(195,'089e4d1c3faeb00fd5dcc9622b06d656',0,0,23,48,0,9,0,3,'Maximum:','','on',2,4),(196,'fe66cb973966d22250de073405664200',0,0,24,53,25,7,0,1,'Non-Unicast Packets In','','',2,1),(197,'1ba3fc3466ad32fdd2669cac6cad6faa',0,0,24,53,0,9,0,4,'Current:','','',2,2),(198,'f810154d3a934c723c21659e66199cdf',0,0,24,53,0,9,0,1,'Average:','','',2,3),(199,'98a161df359b01304346657ff1a9d787',0,0,24,53,0,9,0,3,'Maximum:','','on',2,4),(200,'d5e55eaf617ad1f0516f6343b3f07c5e',0,0,24,52,71,4,0,1,'Non-Unicast Packets Out','','',2,5),(201,'9fde6b8c84089b9f9044e681162e7567',0,0,24,52,0,9,0,4,'Current:','','',2,6),(202,'9a3510727c3d9fa7e2e7a015783a99b3',0,0,24,52,0,9,0,1,'Average:','','',2,7),(203,'451afd23f2cb59ab9b975fd6e2735815',0,0,24,52,0,9,0,3,'Maximum:','','on',2,8),(204,'617d10dff9bbc3edd9d733d9c254da76',0,0,22,50,18,4,0,1,'Discards Out','','',2,9),(205,'9269a66502c34d00ac3c8b1fcc329ac6',0,0,22,50,0,9,0,4,'Current:','','',2,10),(206,'d45deed7e1ad8350f3b46b537ae0a933',0,0,22,50,0,9,0,1,'Average:','','',2,11),(207,'2f64cf47dc156e8c800ae03c3b893e3c',0,0,22,50,0,9,0,3,'Maximum:','','on',2,12),(208,'57434bef8cb21283c1a73f055b0ada19',0,0,22,51,89,4,0,1,'Errors Out','','',2,13),(209,'660a1b9365ccbba356fd142faaec9f04',0,0,22,51,0,9,0,4,'Current:','','',2,14),(210,'28c5297bdaedcca29acf245ef4bbed9e',0,0,22,51,0,9,0,1,'Average:','','',2,15),(211,'99098604fd0c78fd7dabac8f40f1fb29',0,0,22,51,0,9,0,3,'Maximum:','','on',2,16),(212,'de3eefd6d6c58afabdabcaf6c0168378',0,0,25,54,22,7,0,1,'Inbound','','',2,1),(213,'1a80fa108f5c46eecb03090c65bc9a12',0,0,25,54,0,9,0,4,'Current:','','',2,2),(214,'fe458892e7faa9d232e343d911e845f3',0,0,25,54,0,9,0,1,'Average:','','',2,3),(215,'175c0a68689bebc38aad2fbc271047b3',0,0,25,54,0,9,0,3,'Maximum:','','on',2,4),(216,'1bf2283106510491ddf3b9c1376c0b31',0,0,25,55,20,4,0,1,'Outbound','','',2,5),(217,'c5202f1690ffe45600c0d31a4a804f67',0,0,25,55,0,9,0,4,'Current:','','',2,6),(218,'eb9794e3fdafc2b74f0819269569ed40',0,0,25,55,0,9,0,1,'Average:','','',2,7),(219,'6bcedd61e3ccf7518ca431940c93c439',0,0,25,55,0,9,0,3,'Maximum:','','',2,8),(303,'b7b381d47972f836785d338a3bef6661',0,0,26,78,0,9,0,3,'Maximum:','','on',2,8),(304,'36fa8063df3b07cece878d54443db727',0,0,26,78,0,9,0,1,'Average:','','',2,7),(305,'2c35b5cae64c5f146a55fcb416dd14b5',0,0,26,78,0,9,0,4,'Current:','','',2,6),(306,'16d6a9a7f608762ad65b0841e5ef4e9c',0,0,26,78,48,7,0,1,'Used','','',2,5),(307,'d80e4a4901ab86ee39c9cc613e13532f',0,0,26,92,20,7,0,1,'Total','','',2,1),(308,'567c2214ee4753aa712c3d101ea49a5d',0,0,26,92,0,9,0,4,'Current:','','',2,2),(309,'ba0b6a9e316ef9be66abba68b80f7587',0,0,26,92,0,9,0,1,'Average:','','',2,3),(310,'4b8e4a6bf2757f04c3e3a088338a2f7a',0,0,26,92,0,9,0,3,'Maximum:','','on',2,4),(317,'8536e034ab5268a61473f1ff2f6bd88f',0,0,27,79,0,9,0,1,'Average:','','',3,3),(316,'d478a76de1df9edf896c9ce51506c483',0,0,27,79,0,9,0,4,'Current:','','',3,2),(315,'42537599b5fb8ea852240b58a58633de',0,0,27,79,9,7,0,1,'CPU Utilization','','',2,1),(318,'87e10f9942b625aa323a0f39b60058e7',0,0,27,79,0,9,0,3,'Maximum:','','',3,4),(319,'38f6891b0db92aa8950b4ce7ae902741',0,0,28,81,67,7,0,1,'Users','','',2,1),(320,'af13152956a20aa894ef4a4067b88f63',0,0,28,81,0,9,0,4,'Current:','','',3,2),(321,'1b2388bbede4459930c57dc93645284e',0,0,28,81,0,9,0,1,'Average:','','',3,3),(322,'6407dc226db1d03be9730f4d6f3eeccf',0,0,28,81,0,9,0,3,'Maximum:','','',3,4),(323,'fca6a530c8f37476b9004a90b42ee988',0,0,29,80,48,7,0,1,'Running Processes','','',2,1),(324,'5acebbde3dc65e02f8fda03955852fbe',0,0,29,80,0,9,0,4,'Current:','','',3,2),(325,'311079ffffac75efaab2837df8123122',0,0,29,80,0,9,0,1,'Average:','','',3,3),(326,'724d27007ebf31016cfa5530fee1b867',0,0,29,80,0,9,0,3,'Maximum:','','',3,4),(373,'1995d8c23e7d8e1efa2b2c55daf3c5a7',0,0,32,54,22,7,2,1,'Inbound','','',2,1),(335,'',95,1,12,84,41,7,0,1,'Free','','',2,9),(336,'',96,1,12,84,0,9,0,4,'Current:','','',2,10),(337,'',97,1,12,84,0,9,0,1,'Average:','','',2,11),(338,'',98,1,12,84,0,9,0,3,'Maximum:','','on',2,12),(339,'',99,1,12,85,30,8,0,1,'Swap','','',2,13),(340,'',100,1,12,85,0,9,0,4,'Current:','','',2,14),(341,'',101,1,12,85,0,9,0,1,'Average:','','',2,15),(342,'',102,1,12,85,0,9,0,3,'Maximum:','','',2,16),(343,'',69,2,9,86,15,7,0,1,'1 Minute Average','','',2,1),(344,'',70,2,9,86,0,9,0,4,'Current:','','on',4,2),(345,'',71,2,9,87,8,8,0,1,'5 Minute Average','','',2,3),(346,'',72,2,9,87,0,9,0,4,'Current:','','on',4,4),(347,'',73,2,9,88,9,8,0,1,'15 Minute Average','','',2,5),(348,'',74,2,9,88,0,9,0,4,'Current:','','on',4,6),(349,'',75,2,9,0,1,4,12,1,'','','',2,7),(350,'',76,3,10,89,67,7,0,1,'Users','','',2,1),(351,'',77,3,10,89,0,9,0,4,'Current:','','',3,2),(352,'',78,3,10,89,0,9,0,1,'Average:','','',3,3),(353,'',79,3,10,89,0,9,0,3,'Maximum:','','',3,4),(354,'',65,4,8,90,48,7,0,1,'Running Processes','','',2,1),(355,'',66,4,8,90,0,9,0,4,'Current:','','',3,2),(356,'',67,4,8,90,0,9,0,1,'Average:','','',3,3),(357,'',68,4,8,90,0,9,0,3,'Maximum:','','',3,4),(361,'7d08b996bde9cdc7efa650c7031137b4',0,0,30,29,0,9,0,3,'Maximum:','','on',3,4),(362,'918e6e7d41bb4bae0ea2937b461742a4',0,0,31,54,22,7,2,1,'Inbound','','',2,1),(363,'f19fbd06c989ea85acd6b4f926e4a456',0,0,31,54,0,9,2,4,'Current:','','',2,2),(364,'fc150a15e20c57e11e8d05feca557ef9',0,0,31,54,0,9,2,1,'Average:','','',2,3),(365,'ccbd86e03ccf07483b4d29e63612fb18',0,0,31,54,0,9,2,3,'Maximum:','','on',2,4),(366,'964c5c30cd05eaf5a49c0377d173de86',0,0,31,55,20,4,2,1,'Outbound','','',2,5),(367,'b1a6fb775cf62e79e1c4bc4933c7e4ce',0,0,31,55,0,9,2,4,'Current:','','',2,6),(368,'721038182a872ab266b5cf1bf7f7755c',0,0,31,55,0,9,2,1,'Average:','','',2,7),(369,'2302f80c2c70b897d12182a1fc11ecd6',0,0,31,55,0,9,2,3,'Maximum:','','on',2,8),(370,'4ffc7af8533d103748316752b70f8e3c',0,0,31,0,0,1,0,1,'','','on',2,9),(371,'64527c4b6eeeaf627acc5117ff2180fd',0,0,31,55,9,2,0,1,'95th Percentile','|95:bits:0:max:2|','',2,10),(372,'d5bbcbdbf83ae858862611ac6de8fc62',0,0,31,55,0,1,0,1,'(|95:bits:6:max:2| mbit in+out)','','',2,11),(384,'db7c15d253ca666601b3296f2574edc9',0,0,32,55,0,1,0,1,'Total Out: |sum:auto:current:2:auto|','','',2,12),(383,'5b43e4102600ad75379c5afd235099c4',0,0,32,54,0,1,0,1,'Total In:  |sum:auto:current:2:auto|','','on',2,5),(385,'fdaec5b9227522c758ad55882c483a83',0,0,33,55,0,9,0,3,'Maximum:','','',2,11),(386,'6824d29c3f13fe1e849f1dbb8377d3f1',0,0,33,55,0,9,0,1,'Average:','','',2,8),(387,'54e3971b3dd751dd2509f62721c12b41',0,0,33,55,0,9,0,4,'Current:','','',2,7),(388,'cf8c9f69878f0f595d583eac109a9be1',0,0,33,55,20,4,0,1,'Outbound','','',2,6),(389,'de265acbbfa99eb4b3e9f7e90c7feeda',0,0,33,54,0,9,0,3,'Maximum:','','',2,4),(390,'777aa88fb0a79b60d081e0e3759f1cf7',0,0,33,54,0,9,0,1,'Average:','','',2,3),(391,'66bfdb701c8eeadffe55e926d6e77e71',0,0,33,54,0,9,0,4,'Current:','','',2,2),(392,'3ff8dba1ca6279692b3fcabed0bc2631',0,0,33,54,22,7,0,1,'Inbound','','',2,1),(393,'d6041d14f9c8fb9b7ddcf3556f763c03',0,0,33,55,0,1,0,1,'Total Out: |sum:auto:current:2:auto|','','',2,12),(394,'76ae747365553a02313a2d8a0dd55c8a',0,0,33,54,0,1,0,1,'Total In:  |sum:auto:current:2:auto|','','on',2,5),(403,'8a1b44ab97d3b56207d0e9e77a035d25',0,0,13,95,30,8,14,1,'Cache Memory','','',2,9),(404,'6db3f439e9764941ff43fbaae348f5dc',0,0,13,95,0,9,14,4,'Current:','','',2,10),(405,'cc9b2fe7acf0820caa61c1519193f65e',0,0,13,95,0,9,14,1,'Average:','','',2,11),(406,'9eea140bdfeaa40d50c5cdcd1f23f72d',0,0,13,95,0,9,14,3,'Maximum:','','on',2,12),(407,'41316670b1a36171de2bda91a0cc2364',0,0,34,96,98,7,0,1,'','','',2,1),(408,'c9e8cbdca0215b434c902e68755903ea',0,0,34,96,0,9,0,4,'Current:','','',2,2),(409,'dab91d7093e720841393feea5bdcba85',0,0,34,96,0,9,0,1,'Average:','','',2,3),(410,'03e5bd2151fea3c90843eb1130b84458',0,0,34,96,0,9,0,3,'Maximum:','','on',2,4),(411,'594ee63ea3c05872cd8866fe9a859f41',0,0,35,99,9,7,0,1,'busy','','',2,1),(412,'520404254bfa35368fdb759744bfa8e8',0,0,35,100,22,8,0,1,'idle','','',2,2),(413,'',411,5,35,111,9,7,0,1,'busy','','',2,1),(414,'',412,5,35,112,22,8,0,1,'idle','','',2,2),(415,'649f0e4bd47c0d841b9b8be78e3e32b0',0,0,36,97,79,7,0,1,'Throughput rate','','on',2,1),(416,'0d057980846ba97a3f985daa57ad3052',0,0,36,97,0,9,0,4,'Total throughput','','',3,2),(419,'',415,7,36,115,79,7,0,1,'Throughput rate','','on',2,1),(420,'',416,7,36,115,0,9,0,4,'Total throughput','','',3,2),(421,'bb4b8c821eff864f32b230ece00397da',0,0,37,98,25,7,0,1,'requests/second','','',2,1),(422,'',421,8,37,115,25,7,0,1,'requests/second','','',2,1),(423,'82781a8602b5ab256876d69e4d58b84c',0,0,38,103,51,7,14,1,'request volume','','',2,1),(424,'',423,9,38,117,51,7,14,1,'request volume','','',2,1),(429,'af5a05e1edd82bd57e5d0415585f44ea',0,0,39,143,25,8,3,1,'Connected','','',2,3),(427,'6171341e1746792c45018c114ad7e339',0,0,39,121,81,7,0,1,'','','',2,2),(492,'31dd3ab12e3b77a76e33c7115dc83cae',0,0,47,0,0,1,0,1,'  Stamps per hour  ','','',2,7),(431,'2747b88f8387b333771eed226be7770e',0,0,39,142,41,8,3,1,'Running','','',2,4),(433,'5d6b1c8da919118bd5fdcb49e975cd5c',0,0,39,144,94,8,3,1,'Cached','','',2,5),(512,'',511,26,47,261,0,9,16,2,'min:','','',5,8),(435,'74466c921c427205c883b792f7d1bc1e',0,0,39,121,1,4,0,1,'','','',2,6),(455,'e83c31725f7a09f2c4ba8db9de9d578d',0,0,40,156,42,5,0,1,'running threads','','',2,3),(454,'bcc42ab81f9c4959c772dbfa236fb4c4',0,0,40,155,51,4,0,1,'created threads','','',2,2),(453,'590b407fdae5c94ba6bb98047dc95308',0,0,40,154,31,7,0,1,'cached threads','','',2,1),(482,'a34e0dd68b8bf61e6f368dd5a5a8482c',0,0,45,215,20,4,0,1,'queries','','',2,1),(490,'f03222dbb19a052a1d8d3e16daf41e0b',0,0,47,253,64,4,4,1,'Stamps per 5 min.','','',2,1),(485,'ffe9e27002458306bcddf69acaf08f48',0,0,46,247,20,4,0,1,'bytes written','','',2,2),(484,'59273cf4f9a86fe21b20fcfa9dbe17f0',0,0,46,246,22,7,0,1,'bytes read','','',2,1),(459,'7c586feb0a94957484e4fb587dc990e9',0,0,41,161,9,7,0,1,'used key blocks','','',2,1),(460,'7d014736bd6f08b77faf2ef41eb5e8e0',0,0,41,160,22,8,0,1,'unused key blocks','','',2,2),(461,'',459,18,41,167,9,7,0,1,'used key blocks','','',2,1),(462,'',460,18,41,166,22,8,0,1,'unused key blocks','','',2,2),(463,'ee2afe40bc856a51b34de095cdf86966',0,0,42,174,73,7,0,1,'Open tables','','',2,1),(464,'29efd8945fb7b93ec5e688fb038afa0b',0,0,42,178,25,7,0,1,'Open temp tables on slave','','',2,2),(465,'',463,19,42,179,73,7,0,1,'Open tables','','',2,1),(466,'',464,19,42,183,25,7,0,1,'Open temp tables on slave','','',2,2),(467,'dea7e8636443daf7ab816c251b0973c5',0,0,43,198,31,7,0,1,'total blocks','','',2,1),(468,'1f8191e59ba832c0c95d6fd0fe3ed8de',0,0,43,200,95,7,0,1,'free blocks','','',2,2),(469,'45f4ecf465030eed79a9ba260a032844',0,0,44,192,22,4,0,1,'cache hits','','',2,1),(470,'189cd90a337e0a2db03e91fc85a82958',0,0,44,193,75,4,0,1,'cache inserts','','',2,2),(471,'19fd4d87a88bbbbcd824372ee626a0c3',0,0,44,195,8,4,0,1,'not cached','','',2,3),(472,'',469,20,44,201,22,4,0,1,'cache hits','','',2,1),(473,'',470,20,44,202,75,4,0,1,'cache inserts','','',2,2),(474,'',471,20,44,204,8,4,0,1,'not cached','','',2,3),(475,'',467,21,43,207,31,7,0,1,'total blocks','','',2,1),(476,'',468,21,43,205,95,7,0,1,'free blocks','','',2,2),(483,'',482,23,45,216,20,4,0,1,'queries','','',2,1),(486,'7673d8661b639896e1710d410eb65460',0,0,46,248,98,4,0,1,'syslog bytes written','','',2,3),(487,'',484,24,46,249,22,7,0,1,'bytes read','','',2,1),(488,'',485,24,46,250,20,4,0,1,'bytes written','','',2,2),(489,'',486,24,46,251,98,4,0,1,'syslog bytes written','','',2,3),(515,'530063184d7495057acba12bffd212e1',0,0,47,253,0,9,16,3,'max:','','on',5,10),(514,'',513,26,47,261,0,9,16,1,'avg:','','',5,9),(513,'63bfd6843814302dd5b5ed7f3e801916',0,0,47,253,0,9,16,1,'avg:','','',5,9),(496,'705d57129f4ea866aedb3ab1e60f534d',0,0,48,252,94,7,4,1,'','','',2,1),(497,'280872b694e3bcd10a60d34bfeab549a',0,0,48,252,0,9,4,2,'min:','','',5,3),(498,'6a9e335f02624c6a4636371c051a526e',0,0,48,252,0,9,4,3,'max:','','',5,5),(499,'434f0b9163da058e2330b7b9d057b25b',0,0,48,252,0,9,4,1,'avg:','','',5,4),(500,'',490,26,47,261,64,4,4,1,'Stamps per 5 min.','','',2,1),(511,'bb28915e5e3724955d321f3b913207d5',0,0,47,253,0,9,16,2,'min:','','',5,8),(502,'',492,26,47,261,0,1,0,1,'  Stamps per hour  ','','',2,7),(503,'',496,27,48,262,94,7,4,1,'','','',2,1),(504,'',497,27,48,262,0,9,4,2,'min:','','',5,3),(505,'',498,27,48,262,0,9,4,3,'max:','','',5,5),(506,'',499,27,48,262,0,9,4,1,'avg:','','',5,4),(507,'37e499adbdb072753c6cdf82bc7ca54a',0,0,48,264,0,9,0,1,'Total orders: ','','',6,12),(508,'',507,27,48,267,0,9,0,1,'Total orders: ','','',6,12),(509,'918f093e8435a659b07c38f8c2f2a8bc',0,0,49,266,42,5,0,1,'','','',2,1),(510,'',509,28,49,269,42,5,0,1,'','','',2,1),(516,'',515,26,47,261,0,9,16,3,'max:','','on',5,10),(523,'9343d343f4e786698dffd7134c1869fd',0,0,47,253,0,9,4,4,'last:','','on',5,6),(517,'2b46bcddfc1d1855e93caf4919fe38c7',0,0,47,253,0,9,4,2,'min:','','',5,3),(518,'',517,26,47,261,0,9,4,2,'min:','','',5,3),(519,'fa72d3fc246dabef7d7b490c8a0471df',0,0,47,253,0,9,4,1,'avg:','','',5,4),(520,'',519,26,47,261,0,9,4,1,'avg:','','',5,4),(521,'e1545dcc27fbca71e3f0464b915be115',0,0,47,253,0,9,4,3,'max:','','',5,5),(522,'',521,26,47,261,0,9,4,3,'max:','','',5,5),(524,'',523,26,47,261,0,9,4,4,'last:','','on',5,6),(530,'',529,26,47,268,0,1,0,1,'','','on',2,12),(529,'8938c2ba6172892a25161172dcdf51ae',0,0,47,265,0,1,0,1,'','','on',2,12),(527,'dd22a4dcc2e364c7c3be20c8392cc7cd',0,0,47,265,0,9,0,1,'  Total ordered stamps: ','','',6,13),(528,'',527,26,47,268,0,9,0,1,'  Total ordered stamps: ','','',6,13),(531,'81380ce7b98c9078f6a38b07abc75f41',0,0,48,264,0,1,0,1,'Orders per 5 min.','','',2,2),(532,'',531,27,48,267,0,1,0,1,'Orders per 5 min.','','',2,2),(533,'f54febd3693621e86604c7142fd7b6ad',0,0,48,252,0,9,0,2,'min:','','',5,8),(534,'',533,27,48,262,0,9,0,2,'min:','','',5,8),(535,'cfafe758fef52a94452f3b7e57e027a7',0,0,48,252,0,9,16,1,'avg:','','',5,9),(536,'',535,27,48,262,0,9,16,1,'avg:','','',5,9),(537,'6d4fba30301fd5f62ccf36a5fe4d74ac',0,0,48,252,0,9,4,3,'max:','','on',5,10),(538,'',537,27,48,262,0,9,4,3,'max:','','on',5,10),(539,'1607e5aaba4b375cdf7ff3208f32bbb6',0,0,48,264,0,1,0,1,'  Orders per hour','','',2,7),(540,'',539,27,48,267,0,1,0,1,'  Orders per hour','','',2,7),(541,'f9ffa15902b6f4a99a950a658a81ff8d',0,0,48,252,0,9,4,4,'last:','','on',5,6),(542,'',541,27,48,262,0,9,4,4,'last:','','on',5,6),(543,'39def4933bd73b4026463cbdb9f471a7',0,0,48,0,0,1,0,1,'','','on',2,11),(544,'',543,27,48,0,0,1,0,1,'','','on',2,11),(545,'7f0d56ae3fe537fd0d46274b0ab0920e',0,0,37,98,1,4,0,1,'','','',2,2),(546,'',545,8,37,115,1,4,0,1,'','','',2,2),(547,'cc38ecc1050377dd2ffe4eaa94c1ddb6',0,0,38,103,1,4,14,1,'','','',2,2),(548,'',547,9,38,117,1,4,14,1,'','','',2,2),(549,'271e2a41e33372ad122f3e598f33493a',0,0,36,97,1,4,0,1,'','','',2,3),(550,'',549,7,36,115,1,4,0,1,'','','',2,3),(555,'478ea145a2367550096f1a468bd58560',0,0,35,99,1,4,17,1,'','','',2,5),(556,'',555,5,35,111,1,4,17,1,'','','',2,5);
UNLOCK TABLES;
/*!40000 ALTER TABLE `graph_templates_item` ENABLE KEYS */;

--
-- Table structure for table `graph_tree`
--

DROP TABLE IF EXISTS `graph_tree`;
CREATE TABLE `graph_tree` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `sort_type` tinyint(3) unsigned NOT NULL default '1',
  `name` varchar(255) collate latin1_german1_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `graph_tree`
--


/*!40000 ALTER TABLE `graph_tree` DISABLE KEYS */;
LOCK TABLES `graph_tree` WRITE;
INSERT INTO `graph_tree` (`id`, `sort_type`, `name`) VALUES (1,1,'Default Tree');
UNLOCK TABLES;
/*!40000 ALTER TABLE `graph_tree` ENABLE KEYS */;

--
-- Table structure for table `graph_tree_items`
--

DROP TABLE IF EXISTS `graph_tree_items`;
CREATE TABLE `graph_tree_items` (
  `id` mediumint(5) unsigned NOT NULL auto_increment,
  `graph_tree_id` smallint(5) unsigned NOT NULL default '0',
  `local_graph_id` mediumint(8) unsigned NOT NULL default '0',
  `rra_id` smallint(8) unsigned NOT NULL default '0',
  `title` varchar(255) collate latin1_german1_ci default NULL,
  `host_id` mediumint(8) unsigned NOT NULL default '0',
  `order_key` varchar(100) collate latin1_german1_ci NOT NULL default '0',
  `host_grouping_type` tinyint(3) unsigned NOT NULL default '1',
  `sort_children_type` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `graph_tree_id` (`graph_tree_id`),
  KEY `host_id` (`host_id`),
  KEY `local_graph_id` (`local_graph_id`),
  KEY `order_key` (`order_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `graph_tree_items`
--


/*!40000 ALTER TABLE `graph_tree_items` DISABLE KEYS */;
LOCK TABLES `graph_tree_items` WRITE;
INSERT INTO `graph_tree_items` (`id`, `graph_tree_id`, `local_graph_id`, `rra_id`, `title`, `host_id`, `order_key`, `host_grouping_type`, `sort_children_type`) VALUES (7,1,0,0,'',1,'001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(8,1,0,0,'',2,'002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(9,1,0,0,'',3,'003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(12,1,0,0,'',5,'004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `graph_tree_items` ENABLE KEYS */;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
CREATE TABLE `host` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `host_template_id` mediumint(8) unsigned NOT NULL default '0',
  `description` varchar(150) collate latin1_german1_ci NOT NULL default '',
  `hostname` varchar(250) collate latin1_german1_ci default NULL,
  `snmp_community` varchar(100) collate latin1_german1_ci default NULL,
  `snmp_version` tinyint(1) unsigned NOT NULL default '1',
  `snmp_username` varchar(50) collate latin1_german1_ci default NULL,
  `snmp_password` varchar(50) collate latin1_german1_ci default NULL,
  `snmp_port` mediumint(5) unsigned NOT NULL default '161',
  `snmp_timeout` mediumint(8) unsigned NOT NULL default '500',
  `disabled` char(2) collate latin1_german1_ci default NULL,
  `status` tinyint(2) NOT NULL default '0',
  `status_event_count` mediumint(8) unsigned NOT NULL default '0',
  `status_fail_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `status_rec_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `status_last_error` varchar(50) collate latin1_german1_ci default '',
  `min_time` decimal(10,5) default '9.99999',
  `max_time` decimal(10,5) default '0.00000',
  `cur_time` decimal(10,5) default '0.00000',
  `avg_time` decimal(10,5) default '0.00000',
  `total_polls` int(12) unsigned default '0',
  `failed_polls` int(12) unsigned default '0',
  `availability` decimal(8,5) NOT NULL default '100.00000',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `host`
--


/*!40000 ALTER TABLE `host` DISABLE KEYS */;
LOCK TABLES `host` WRITE;
INSERT INTO `host` (`id`, `host_template_id`, `description`, `hostname`, `snmp_community`, `snmp_version`, `snmp_username`, `snmp_password`, `snmp_port`, `snmp_timeout`, `disabled`, `status`, `status_event_count`, `status_fail_date`, `status_rec_date`, `status_last_error`, `min_time`, `max_time`, `cur_time`, `avg_time`, `total_polls`, `failed_polls`, `availability`) VALUES (1,8,'Localhost','127.0.0.1','',1,'','',161,500,'',3,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','0.00000','0.00000','0.00000','0.00000',1783,0,'100.00000'),(2,9,'Apache2','127.0.0.1','nexbyte',1,'','',161,500,'',3,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','0.00000','0.00000','0.00000','0.00000',1783,0,'100.00000'),(3,10,'MySQL','127.0.0.1','',1,'','',161,500,'',3,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','0.00000','0.00000','0.00000','0.00000',1783,0,'100.00000'),(5,11,'WebStamp','127.0.0.1','nexbyte',1,'','',161,500,'',3,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','0.00000','0.00000','0.00000','0.00000',1783,0,'100.00000');
UNLOCK TABLES;
/*!40000 ALTER TABLE `host` ENABLE KEYS */;

--
-- Table structure for table `host_graph`
--

DROP TABLE IF EXISTS `host_graph`;
CREATE TABLE `host_graph` (
  `host_id` mediumint(8) unsigned NOT NULL default '0',
  `graph_template_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`host_id`,`graph_template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `host_graph`
--


/*!40000 ALTER TABLE `host_graph` DISABLE KEYS */;
LOCK TABLES `host_graph` WRITE;
INSERT INTO `host_graph` (`host_id`, `graph_template_id`) VALUES (1,8),(1,9),(1,10),(1,12),(2,35),(2,36),(2,37),(2,38),(3,39),(3,41),(3,42),(3,43),(3,44),(3,45),(3,46),(5,47),(5,48),(5,49);
UNLOCK TABLES;
/*!40000 ALTER TABLE `host_graph` ENABLE KEYS */;

--
-- Table structure for table `host_snmp_cache`
--

DROP TABLE IF EXISTS `host_snmp_cache`;
CREATE TABLE `host_snmp_cache` (
  `host_id` mediumint(8) unsigned NOT NULL default '0',
  `snmp_query_id` mediumint(8) unsigned NOT NULL default '0',
  `field_name` varchar(50) collate latin1_german1_ci NOT NULL default '',
  `field_value` varchar(255) collate latin1_german1_ci default NULL,
  `snmp_index` varchar(255) collate latin1_german1_ci NOT NULL default '',
  `oid` text collate latin1_german1_ci NOT NULL,
  PRIMARY KEY  (`host_id`,`snmp_query_id`,`field_name`,`snmp_index`),
  KEY `host_id` (`host_id`,`field_name`),
  KEY `snmp_index` (`snmp_index`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Table structure for table `host_snmp_query`
--

DROP TABLE IF EXISTS `host_snmp_query`;
CREATE TABLE `host_snmp_query` (
  `host_id` mediumint(8) unsigned NOT NULL default '0',
  `snmp_query_id` mediumint(8) unsigned NOT NULL default '0',
  `sort_field` varchar(50) collate latin1_german1_ci NOT NULL default '',
  `title_format` varchar(50) collate latin1_german1_ci NOT NULL default '',
  `reindex_method` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`host_id`,`snmp_query_id`),
  KEY `host_id` (`host_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `host_snmp_query`
--


/*!40000 ALTER TABLE `host_snmp_query` DISABLE KEYS */;
LOCK TABLES `host_snmp_query` WRITE;
INSERT INTO `host_snmp_query` (`host_id`, `snmp_query_id`, `sort_field`, `title_format`, `reindex_method`) VALUES (1,6,'dskDevice','|query_dskDevice|',0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `host_snmp_query` ENABLE KEYS */;

--
-- Table structure for table `host_template`
--

DROP TABLE IF EXISTS `host_template`;
CREATE TABLE `host_template` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) collate latin1_german1_ci NOT NULL default '',
  `name` varchar(100) collate latin1_german1_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `host_template`
--


/*!40000 ALTER TABLE `host_template` DISABLE KEYS */;
LOCK TABLES `host_template` WRITE;
INSERT INTO `host_template` (`id`, `hash`, `name`) VALUES (1,'4855b0e3e553085ed57219690285f91f','Generic SNMP-enabled Host'),(3,'07d3fe6a52915f99e642d22e27d967a4','ucd/net SNMP Host'),(5,'cae6a879f86edacb2471055783bec6d0','Cisco Router'),(11,'3cd1c959cdd1494dc82804d58610c90f','WebStamp Host'),(7,'5b8300be607dce4f030b026a381b91cd','Windows 2000/XP Host'),(8,'2d3e47f416738c2d22c87c40218cc55e','Local Linux Machine'),(9,'99fecb816cadf3bbef09a15aa493bc23','Apache2/SNMP'),(10,'93f1f35080d0d91ca69fdfeb42c1830f','MySQL Host');
UNLOCK TABLES;
/*!40000 ALTER TABLE `host_template` ENABLE KEYS */;

--
-- Table structure for table `host_template_graph`
--

DROP TABLE IF EXISTS `host_template_graph`;
CREATE TABLE `host_template_graph` (
  `host_template_id` mediumint(8) unsigned NOT NULL default '0',
  `graph_template_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`host_template_id`,`graph_template_id`),
  KEY `host_template_id` (`host_template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `host_template_graph`
--


/*!40000 ALTER TABLE `host_template_graph` DISABLE KEYS */;
LOCK TABLES `host_template_graph` WRITE;
INSERT INTO `host_template_graph` (`host_template_id`, `graph_template_id`) VALUES (3,4),(3,11),(3,13),(5,18),(7,28),(7,29),(8,8),(8,9),(8,10),(8,12),(9,35),(9,36),(9,37),(9,38),(10,39),(10,40),(10,41),(10,42),(10,43),(10,44),(10,45),(10,46),(11,47),(11,48);
UNLOCK TABLES;
/*!40000 ALTER TABLE `host_template_graph` ENABLE KEYS */;

--
-- Table structure for table `host_template_snmp_query`
--

DROP TABLE IF EXISTS `host_template_snmp_query`;
CREATE TABLE `host_template_snmp_query` (
  `host_template_id` mediumint(8) unsigned NOT NULL default '0',
  `snmp_query_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`host_template_id`,`snmp_query_id`),
  KEY `host_template_id` (`host_template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `host_template_snmp_query`
--


/*!40000 ALTER TABLE `host_template_snmp_query` DISABLE KEYS */;
LOCK TABLES `host_template_snmp_query` WRITE;
INSERT INTO `host_template_snmp_query` (`host_template_id`, `snmp_query_id`) VALUES (1,1),(3,1),(3,2),(5,1),(7,1),(7,8),(7,9),(8,6);
UNLOCK TABLES;
/*!40000 ALTER TABLE `host_template_snmp_query` ENABLE KEYS */;

--
-- Table structure for table `poller`
--

DROP TABLE IF EXISTS `poller`;
CREATE TABLE `poller` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `hostname` varchar(250) collate latin1_german1_ci NOT NULL default '',
  `ip_address` int(11) unsigned NOT NULL default '0',
  `last_update` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `poller`
--


/*!40000 ALTER TABLE `poller` DISABLE KEYS */;
LOCK TABLES `poller` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `poller` ENABLE KEYS */;

--
-- Table structure for table `poller_command`
--

DROP TABLE IF EXISTS `poller_command`;
CREATE TABLE `poller_command` (
  `poller_id` smallint(5) unsigned NOT NULL default '0',
  `time` datetime NOT NULL default '0000-00-00 00:00:00',
  `action` tinyint(3) unsigned NOT NULL default '0',
  `command` varchar(200) collate latin1_german1_ci NOT NULL default '',
  PRIMARY KEY  (`poller_id`,`action`,`command`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `poller_command`
--


/*!40000 ALTER TABLE `poller_command` DISABLE KEYS */;
LOCK TABLES `poller_command` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `poller_command` ENABLE KEYS */;

--
-- Table structure for table `poller_item`
--

DROP TABLE IF EXISTS `poller_item`;
CREATE TABLE `poller_item` (
  `local_data_id` mediumint(8) unsigned NOT NULL default '0',
  `poller_id` smallint(5) unsigned NOT NULL default '0',
  `host_id` mediumint(8) NOT NULL default '0',
  `action` tinyint(2) unsigned NOT NULL default '1',
  `hostname` varchar(250) collate latin1_german1_ci NOT NULL default '',
  `snmp_community` varchar(100) collate latin1_german1_ci NOT NULL default '',
  `snmp_version` tinyint(1) unsigned NOT NULL default '0',
  `snmp_username` varchar(50) collate latin1_german1_ci NOT NULL default '',
  `snmp_password` varchar(50) collate latin1_german1_ci NOT NULL default '',
  `snmp_port` mediumint(5) unsigned NOT NULL default '161',
  `snmp_timeout` mediumint(8) unsigned NOT NULL default '0',
  `rrd_name` varchar(19) collate latin1_german1_ci NOT NULL default '',
  `rrd_path` varchar(255) collate latin1_german1_ci NOT NULL default '',
  `rrd_num` tinyint(2) unsigned NOT NULL default '0',
  `rrd_step` mediumint(8) unsigned NOT NULL default '300',
  `rrd_next_step` mediumint(8) NOT NULL default '0',
  `arg1` text collate latin1_german1_ci,
  `arg2` varchar(255) collate latin1_german1_ci default NULL,
  `arg3` varchar(255) collate latin1_german1_ci default NULL,
  PRIMARY KEY  (`local_data_id`,`rrd_name`),
  KEY `local_data_id` (`local_data_id`),
  KEY `host_id` (`host_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `poller_item`
--


/*!40000 ALTER TABLE `poller_item` DISABLE KEYS */;
LOCK TABLES `poller_item` WRITE;
INSERT INTO `poller_item` (`local_data_id`, `poller_id`, `host_id`, `action`, `hostname`, `snmp_community`, `snmp_version`, `snmp_username`, `snmp_password`, `snmp_port`, `snmp_timeout`, `rrd_name`, `rrd_path`, `rrd_num`, `rrd_step`, `rrd_next_step`, `arg1`, `arg2`, `arg3`) VALUES (3,0,1,1,'127.0.0.1','',1,'','',161,500,'mem_buffers','@root@/cacti/rra/localhost_mem_buffers_3.rrd',1,300,0,'perl @root@/cacti/scripts/linux_memory.pl MemFree:','',''),(4,0,1,1,'127.0.0.1','',1,'','',161,500,'mem_swap','@root@/cacti/rra/localhost_mem_swap_4.rrd',1,300,0,'perl @root@/cacti/scripts/linux_memory.pl SwapFree:','',''),(5,0,1,1,'127.0.0.1','',1,'','',161,500,'','@root@/cacti/rra/localhost_load_1min_5.rrd',1,300,0,'perl @root@/cacti/scripts/loadavg_multi.pl','',''),(6,0,1,1,'127.0.0.1','',1,'','',161,500,'users','@root@/cacti/rra/localhost_users_6.rrd',1,300,0,'perl @root@/cacti/scripts/unix_users.pl ','',''),(7,0,1,1,'127.0.0.1','',1,'','',161,500,'proc','@root@/cacti/rra/localhost_proc_7.rrd',1,300,0,'perl @root@/cacti/scripts/unix_processes.pl','',''),(8,0,2,0,'127.0.0.1','nexbyte',1,'','',161,500,'ap2BusyWorkers','@root@/cacti/rra/apache2_ap2busyworkers_8.rrd',1,300,0,'APACHE2-MIB::busyWorkers.0','',''),(9,0,2,0,'127.0.0.1','nexbyte',1,'','',161,500,'ap2IdleWorkers','@root@/cacti/rra/apache2_ap2idleworkers_9.rrd',1,300,0,'APACHE2-MIB::idleWorkers.0','',''),(12,0,2,0,'127.0.0.1','nexbyte',1,'','',161,500,'ap2TotalTraffic','@root@/cacti/rra/apache2_ap2totaltraffic_12.rrd',1,300,0,'APACHE2-MIB::totalTraffic.0','',''),(13,0,2,0,'127.0.0.1','nexbyte',1,'','',161,500,'ap2RequestsPerSec','@root@/cacti/rra/apache2_ap2requestspersec_13.rrd',1,300,0,'APACHE2-MIB::serverRequestsPerSec.0','',''),(14,0,2,0,'127.0.0.1','nexbyte',1,'','',161,500,'ap2KBytesPerRequest','@root@/cacti/rra/apache2_ap2kbytesperrequest_14.rrd',1,300,0,'APACHE2-MIB::serverKBytesPerRequest.0','',''),(33,0,3,1,'127.0.0.1','',1,'','',161,500,'','@root@/cacti/rra/mysql_keys_33.rrd',1,300,0,'@prefix@/bin/sh @root@/cacti/scripts/sql.sh','',''),(34,0,3,1,'127.0.0.1','',1,'','',161,500,'','@root@/cacti/rra/mysql_tables_34.rrd',1,300,0,'@prefix@/bin/sh @root@/cacti/scripts/sql.sh','',''),(38,0,3,1,'127.0.0.1','',1,'','',161,500,'','@root@/cacti/rra/mysql_stats_38.rrd',1,300,0,'@prefix@/bin/sh @root@/cacti/scripts/sql.sh','',''),(39,0,3,1,'127.0.0.1','',1,'','',161,500,'','@root@/cacti/rra/mysql_innodb_bandwidth_39.rrd',1,300,0,'@prefix@/bin/sh @root@/cacti/scripts/sql.sh','',''),(43,0,5,1,'127.0.0.1','nexbyte',1,'','',161,500,'','@root@/cacti/rra/webstamp_counts_42.rrd',1,300,0,'@prefix@/bin/sh @root@/wsl/program/cron/stat.sh','',''),(42,0,5,1,'127.0.0.1','nexbyte',1,'','',161,500,'','@root@/cacti/rra/webstamp_stats_40.rrd',1,300,0,'@prefix@/bin/sh @root@/wsl/program/cron/stat.sh','',''),(36,0,3,1,'127.0.0.1','',1,'','',161,500,'','@root@/cacti/rra/mysql_qcache_ressources_36.rrd',1,300,0,'@prefix@/bin/sh @root@/cacti/scripts/sql.sh','',''),(35,0,3,1,'127.0.0.1','',1,'','',161,500,'','@root@/cacti/rra/mysql_qcache_performance_35.rrd',1,300,0,'@prefix@/bin/sh @root@/cacti/scripts/sql.sh','','');
UNLOCK TABLES;
/*!40000 ALTER TABLE `poller_item` ENABLE KEYS */;

--
-- Table structure for table `poller_output`
--

DROP TABLE IF EXISTS `poller_output`;
CREATE TABLE `poller_output` (
  `local_data_id` mediumint(8) unsigned NOT NULL default '0',
  `rrd_name` varchar(19) collate latin1_german1_ci NOT NULL default '',
  `time` datetime NOT NULL default '0000-00-00 00:00:00',
  `output` text collate latin1_german1_ci NOT NULL,
  PRIMARY KEY  (`local_data_id`,`rrd_name`,`time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `poller_output`
--


/*!40000 ALTER TABLE `poller_output` DISABLE KEYS */;
LOCK TABLES `poller_output` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `poller_output` ENABLE KEYS */;

--
-- Table structure for table `poller_reindex`
--

DROP TABLE IF EXISTS `poller_reindex`;
CREATE TABLE `poller_reindex` (
  `host_id` mediumint(8) unsigned NOT NULL default '0',
  `data_query_id` mediumint(8) unsigned NOT NULL default '0',
  `action` tinyint(3) unsigned NOT NULL default '0',
  `op` char(1) collate latin1_german1_ci NOT NULL default '',
  `assert_value` varchar(100) collate latin1_german1_ci NOT NULL default '',
  `arg1` varchar(255) collate latin1_german1_ci NOT NULL default '',
  PRIMARY KEY  (`host_id`,`data_query_id`,`arg1`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `poller_reindex`
--


/*!40000 ALTER TABLE `poller_reindex` DISABLE KEYS */;
LOCK TABLES `poller_reindex` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `poller_reindex` ENABLE KEYS */;

--
-- Table structure for table `poller_time`
--

DROP TABLE IF EXISTS `poller_time`;
CREATE TABLE `poller_time` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `pid` int(11) unsigned NOT NULL default '0',
  `poller_id` smallint(5) unsigned NOT NULL default '0',
  `start_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `end_time` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `poller_time`
--


/*!40000 ALTER TABLE `poller_time` DISABLE KEYS */;
LOCK TABLES `poller_time` WRITE;
INSERT INTO `poller_time` (`id`, `pid`, `poller_id`, `start_time`, `end_time`) VALUES (1,0,0,'2007-01-30 15:20:04','2007-01-30 15:20:04');
UNLOCK TABLES;
/*!40000 ALTER TABLE `poller_time` ENABLE KEYS */;

--
-- Table structure for table `rra`
--

DROP TABLE IF EXISTS `rra`;
CREATE TABLE `rra` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) collate latin1_german1_ci NOT NULL default '',
  `name` varchar(100) collate latin1_german1_ci NOT NULL default '',
  `x_files_factor` double NOT NULL default '0.1',
  `steps` mediumint(8) default '1',
  `rows` int(12) NOT NULL default '600',
  `timespan` int(12) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `rra`
--


/*!40000 ALTER TABLE `rra` DISABLE KEYS */;
LOCK TABLES `rra` WRITE;
INSERT INTO `rra` (`id`, `hash`, `name`, `x_files_factor`, `steps`, `rows`, `timespan`) VALUES (1,'c21df5178e5c955013591239eb0afd46','Daily (5 Minute Average)',0.5,1,600,86400),(2,'0d9c0af8b8acdc7807943937b3208e29','Weekly (30 Minute Average)',0.5,6,700,604800),(4,'e36f3adb9f152adfa5dc50fd2b23337e','Yearly (1 Day Average)',0.5,288,797,33053184),(3,'6fc2d038fb42950138b0ce3e9874cc60','Monthly (2 Hour Average)',0.5,24,775,2678400);
UNLOCK TABLES;
/*!40000 ALTER TABLE `rra` ENABLE KEYS */;

--
-- Table structure for table `rra_cf`
--

DROP TABLE IF EXISTS `rra_cf`;
CREATE TABLE `rra_cf` (
  `rra_id` mediumint(8) unsigned NOT NULL default '0',
  `consolidation_function_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`rra_id`,`consolidation_function_id`),
  KEY `rra_id` (`rra_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `rra_cf`
--


/*!40000 ALTER TABLE `rra_cf` DISABLE KEYS */;
LOCK TABLES `rra_cf` WRITE;
INSERT INTO `rra_cf` (`rra_id`, `consolidation_function_id`) VALUES (1,1),(1,3),(2,1),(2,3),(3,1),(3,3),(4,1),(4,3);
UNLOCK TABLES;
/*!40000 ALTER TABLE `rra_cf` ENABLE KEYS */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `name` varchar(50) collate latin1_german1_ci NOT NULL default '',
  `value` varchar(255) collate latin1_german1_ci NOT NULL default '',
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `settings`
--


/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
LOCK TABLES `settings` WRITE;
INSERT INTO `settings` (`name`, `value`) VALUES ('path_rrdtool','@prefix@/bin/rrdtool'),('path_php_binary','@prefix@/bin/php'),('path_snmpwalk','@prefix@/bin/snmpwalk'),('path_snmpget','@prefix@/bin/snmpget'),('path_snmpbulkwalk','@prefix@/bin/snmpbulkwalk'),('path_snmpgetnext','@prefix@/bin/snmpgetnext'),('path_cactilog','@root@/cacti/logs/cacti.log'),('snmp_version','net-snmp'),('rrdtool_version','rrd-1.2.x'),('log_destination','1'),('log_snmp',''),('log_graph',''),('log_export',''),('log_verbosity','@cacti_loglevel@'),('log_pstats',''),('log_pwarn',''),('log_perror','on'),('snmp_ver','1'),('snmp_community','nexbyte'),('snmp_username',''),('snmp_password',''),('snmp_timeout','500'),('snmp_port','161'),('snmp_retries','3'),('remove_verification','on'),('path_webroot','@root@/cacti'),('date','2007-01-30 15:20:03'),('stats_poller','Time:3.3805 Method:cmd.php Processes:1 Threads:N/A Hosts:5 HostsPerProcess:5 DataSources:18 RRDsProcessed:18');
UNLOCK TABLES;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

--
-- Table structure for table `settings_graphs`
--

DROP TABLE IF EXISTS `settings_graphs`;
CREATE TABLE `settings_graphs` (
  `user_id` smallint(8) unsigned NOT NULL default '0',
  `name` varchar(50) collate latin1_german1_ci NOT NULL default '',
  `value` varchar(255) collate latin1_german1_ci NOT NULL default '',
  PRIMARY KEY  (`user_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `settings_graphs`
--


/*!40000 ALTER TABLE `settings_graphs` DISABLE KEYS */;
LOCK TABLES `settings_graphs` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `settings_graphs` ENABLE KEYS */;

--
-- Table structure for table `settings_tree`
--

DROP TABLE IF EXISTS `settings_tree`;
CREATE TABLE `settings_tree` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `graph_tree_item_id` mediumint(8) unsigned NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`graph_tree_item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `settings_tree`
--


/*!40000 ALTER TABLE `settings_tree` DISABLE KEYS */;
LOCK TABLES `settings_tree` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `settings_tree` ENABLE KEYS */;

--
-- Table structure for table `snmp_query`
--

DROP TABLE IF EXISTS `snmp_query`;
CREATE TABLE `snmp_query` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) collate latin1_german1_ci NOT NULL default '',
  `xml_path` varchar(255) collate latin1_german1_ci NOT NULL default '',
  `name` varchar(100) collate latin1_german1_ci NOT NULL default '',
  `description` varchar(255) collate latin1_german1_ci default NULL,
  `graph_template_id` mediumint(8) unsigned NOT NULL default '0',
  `data_input_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `snmp_query`
--


/*!40000 ALTER TABLE `snmp_query` DISABLE KEYS */;
LOCK TABLES `snmp_query` WRITE;
INSERT INTO `snmp_query` (`id`, `hash`, `xml_path`, `name`, `description`, `graph_template_id`, `data_input_id`) VALUES (1,'d75e406fdeca4fcef45b8be3a9a63cbc','<path_cacti>/resource/snmp_queries/interface.xml','SNMP - Interface Statistics','Queries a host for a list of monitorable interfaces',0,2),(2,'3c1b27d94ad208a0090f293deadde753','<path_cacti>/resource/snmp_queries/net-snmp_disk.xml','ucd/net -  Get Monitored Partitions','Retrieves a list of monitored partitions/disks from a net-snmp enabled host.',0,2),(3,'59aab7b0feddc7860002ed9303085ba5','<path_cacti>/resource/snmp_queries/kbridge.xml','Karlnet - Wireless Bridge Statistics','Gets information about the wireless connectivity of each station from a Karlnet bridge.',0,2),(4,'ad06f46e22e991cb47c95c7233cfaee8','<path_cacti>/resource/snmp_queries/netware_disk.xml','Netware - Get Available Volumes','Retrieves a list of volumes from a Netware server.',0,2),(6,'8ffa36c1864124b38bcda2ae9bd61f46','<path_cacti>/resource/script_queries/unix_disk.xml','Unix - Get Mounted Partitions','Queries a list of mounted partitions on a unix-based host with the',0,11),(7,'30ec734bc0ae81a3d995be82c73f46c1','<path_cacti>/resource/snmp_queries/netware_cpu.xml','Netware - Get Processor Information','Gets information about running processors in a Netware server',0,2),(8,'9343eab1f4d88b0e61ffc9d020f35414','<path_cacti>/resource/script_server/host_disk.xml','SNMP - Get Mounted Partitions','Gets a list of partitions using SNMP',0,12),(9,'0d1ab53fe37487a5d0b9e1d3ee8c1d0d','<path_cacti>/resource/script_server/host_cpu.xml','SNMP - Get Processor Information','Gets usage for each processor in the system using the host MIB.',0,12);
UNLOCK TABLES;
/*!40000 ALTER TABLE `snmp_query` ENABLE KEYS */;

--
-- Table structure for table `snmp_query_graph`
--

DROP TABLE IF EXISTS `snmp_query_graph`;
CREATE TABLE `snmp_query_graph` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) collate latin1_german1_ci NOT NULL default '',
  `snmp_query_id` mediumint(8) unsigned NOT NULL default '0',
  `name` varchar(100) collate latin1_german1_ci NOT NULL default '',
  `graph_template_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `snmp_query_graph`
--


/*!40000 ALTER TABLE `snmp_query_graph` DISABLE KEYS */;
LOCK TABLES `snmp_query_graph` WRITE;
INSERT INTO `snmp_query_graph` (`id`, `hash`, `snmp_query_id`, `name`, `graph_template_id`) VALUES (2,'a4b829746fb45e35e10474c36c69c0cf',1,'In/Out Errors/Discarded Packets',22),(3,'01e33224f8b15997d3d09d6b1bf83e18',1,'In/Out Non-Unicast Packets',24),(4,'1e6edee3115c42d644dbd014f0577066',1,'In/Out Unicast Packets',23),(15,'a0b3e7b63c2e66f9e1ea24a16ff245fc',6,'Available Disk Space',21),(6,'da43655bf1f641b07579256227806977',2,'Available/Used Disk Space',3),(7,'1cc468ef92a5779d37a26349e27ef3ba',3,'Wireless Levels',5),(8,'bef2dc94bc84bf91827f45424aac8d2a',3,'Wireless Transmissions',6),(9,'ab93b588c29731ab15db601ca0bc9dec',1,'In/Out Bytes (64-bit Counters)',25),(10,'5a5ce35edb4b195cbde99fd0161dfb4e',4,'Volume Information (free, freeable space)',19),(11,'c1c2cfd33eaf5064300e92e26e20bc56',4,'Directory Information (total/available entries)',20),(13,'ae34f5f385bed8c81a158bf3030f1089',1,'In/Out Bits',2),(14,'1e16a505ddefb40356221d7a50619d91',1,'In/Out Bits (64-bit Counters)',2),(16,'d1e0d9b8efd4af98d28ce2aad81a87e7',1,'In/Out Bytes',25),(17,'f6db4151aa07efa401a0af6c9b871844',7,'Get Processor Utilization',15),(18,'46c4ee688932cf6370459527eceb8ef3',8,'Available Disk Space',26),(19,'4a515b61441ea5f27ab7dee6c3cb7818',9,'Get Processor Utilization',27),(20,'ed7f68175d7bb83db8ead332fc945720',1,'In/Out Bits with 95th Percentile',31),(21,'f85386cd2fc94634ef167c7f1e5fbcd0',1,'In/Out Bits with Total Bandwidth',32),(22,'7d309bf200b6e3cdb59a33493c2e58e0',1,'In/Out Bytes with Total Bandwidth',33);
UNLOCK TABLES;
/*!40000 ALTER TABLE `snmp_query_graph` ENABLE KEYS */;

--
-- Table structure for table `snmp_query_graph_rrd`
--

DROP TABLE IF EXISTS `snmp_query_graph_rrd`;
CREATE TABLE `snmp_query_graph_rrd` (
  `snmp_query_graph_id` mediumint(8) unsigned NOT NULL default '0',
  `data_template_id` mediumint(8) unsigned NOT NULL default '0',
  `data_template_rrd_id` mediumint(8) unsigned NOT NULL default '0',
  `snmp_field_name` varchar(50) collate latin1_german1_ci NOT NULL default '0',
  PRIMARY KEY  (`snmp_query_graph_id`,`data_template_id`,`data_template_rrd_id`),
  KEY `snmp_query_graph_id` (`snmp_query_graph_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `snmp_query_graph_rrd`
--


/*!40000 ALTER TABLE `snmp_query_graph_rrd` DISABLE KEYS */;
LOCK TABLES `snmp_query_graph_rrd` WRITE;
INSERT INTO `snmp_query_graph_rrd` (`snmp_query_graph_id`, `data_template_id`, `data_template_rrd_id`, `snmp_field_name`) VALUES (2,38,47,'ifInDiscards'),(3,40,52,'ifOutNUcastPkts'),(3,40,53,'ifInNUcastPkts'),(4,39,48,'ifInUcastPkts'),(2,38,51,'ifOutErrors'),(6,3,3,'dskAvail'),(6,3,4,'dskUsed'),(7,7,8,'kbWirelessStationExclHellos'),(7,8,9,'kbWirelessStationExclHellos'),(8,10,11,'kbWirelessStationExclHellos'),(8,9,10,'kbWirelessStationExclHellos'),(9,41,55,'ifHCOutOctets'),(9,41,54,'ifHCInOctets'),(10,35,38,'nwVolSize'),(10,35,40,'nwVolFreeable'),(10,35,39,'nwVolFree'),(11,36,42,'nwVolTotalDirEntries'),(11,36,43,'nwVolUsedDirEntries'),(2,38,50,'ifOutDiscards'),(2,38,46,'ifInErrors'),(13,41,54,'ifInOctets'),(14,41,54,'ifHCInOctets'),(14,41,55,'ifHCOutOctets'),(13,41,55,'ifOutOctets'),(4,39,49,'ifOutUcastPkts'),(15,37,44,'dskAvailable'),(16,41,54,'ifInOctets'),(16,41,55,'ifOutOctets'),(15,37,56,'dskUsed'),(17,42,76,'nwhrProcessorUtilization'),(18,43,78,'hrStorageUsed'),(18,43,92,'hrStorageSize'),(19,44,79,'hrProcessorLoad'),(20,41,55,'ifOutOctets'),(20,41,54,'ifInOctets'),(21,41,55,'ifOutOctets'),(21,41,54,'ifInOctets'),(22,41,55,'ifOutOctets'),(22,41,54,'ifInOctets');
UNLOCK TABLES;
/*!40000 ALTER TABLE `snmp_query_graph_rrd` ENABLE KEYS */;

--
-- Table structure for table `snmp_query_graph_rrd_sv`
--

DROP TABLE IF EXISTS `snmp_query_graph_rrd_sv`;
CREATE TABLE `snmp_query_graph_rrd_sv` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) collate latin1_german1_ci NOT NULL default '',
  `snmp_query_graph_id` mediumint(8) unsigned NOT NULL default '0',
  `data_template_id` mediumint(8) unsigned NOT NULL default '0',
  `sequence` mediumint(8) unsigned NOT NULL default '0',
  `field_name` varchar(100) collate latin1_german1_ci NOT NULL default '',
  `text` varchar(255) collate latin1_german1_ci NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `snmp_query_graph_id` (`snmp_query_graph_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `snmp_query_graph_rrd_sv`
--


/*!40000 ALTER TABLE `snmp_query_graph_rrd_sv` DISABLE KEYS */;
LOCK TABLES `snmp_query_graph_rrd_sv` WRITE;
INSERT INTO `snmp_query_graph_rrd_sv` (`id`, `hash`, `snmp_query_graph_id`, `data_template_id`, `sequence`, `field_name`, `text`) VALUES (10,'5d3a8b2f4a454e5b0a1494e00fe7d424',6,3,1,'name','|host_description| - Partition - |query_dskDevice|'),(11,'d0b49af67a83c258ef1eab3780f7b3dc',7,7,1,'name','|host_description| - Wireless Noise Level - |query_kbWirelessStationName|'),(12,'bf6b966dc369f3df2ea640a90845e94c',7,8,1,'name','|host_description| - Wireless Signal Level - |query_kbWirelessStationName|'),(13,'5c3616603a7ac9d0c1cb9556b377a74f',8,10,1,'name','|host_description| - Wireless Re-Transmissions - |query_kbWirelessStationName|'),(14,'080f0022f77044a512b083e3a8304e8b',8,9,1,'name','|host_description| - Wireless Transmissions - |query_kbWirelessStationName|'),(88,'e1be83d708ed3c0b8715ccb6517a0365',9,41,2,'name','|host_description| - Traffic - |query_ifName|'),(86,'c582d3b37f19e4a703d9bf4908dc6548',9,41,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(82,'8d820d091ec1a9683cfa74a462f239ee',14,41,2,'name','|host_description| - Traffic - |query_ifName|'),(81,'2e8b27c63d98249096ad5bc320787f43',14,41,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(79,'2347e9f53564a54d43f3c00d4b60040d',16,41,4,'name','|host_description| - Traffic - |query_ifDescr|'),(30,'8132fa9c446e199732f0102733cb1714',11,36,1,'name','|host_description| - Directories - |query_nwVolPhysicalName|'),(29,'8fc9a94a5f6ef902a3de0fa7549e7476',10,35,1,'name','|host_description| - Volumes - |query_nwVolPhysicalName|'),(80,'27eb220995925e1a5e0e41b2582a2af6',16,41,1,'rrd_maximum','|query_ifSpeed|'),(85,'e85ddc56efa677b70448f9e931360b77',14,41,1,'rrd_maximum','|query_ifSpeed|'),(84,'37bb8c5b38bb7e89ec88ea7ccacf44d4',14,41,4,'name','|host_description| - Traffic - |query_ifDescr|'),(83,'62a47c18be10f273a5f5a13a76b76f54',14,41,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(32,'',12,37,1,'name','|host_description| - Partition - |query_dskDevice|'),(78,'3a0f707d1c8fd0e061b70241541c7e2e',16,41,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(77,'8ef8ae2ef548892ab95bb6c9f0b3170e',16,41,2,'name','|host_description| - Traffic - |query_ifName|'),(76,'c7ee2110bf81639086d2da03d9d88286',16,41,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(75,'7e093c535fa3d810fa76fc3d8c80c94b',13,41,1,'rrd_maximum','|query_ifSpeed|'),(74,'084efd82bbddb69fb2ac9bd0b0f16ac6',13,41,4,'name','|host_description| - Traffic - |query_ifDescr|'),(72,'14aa2dead86bbad0f992f1514722c95e',13,41,2,'name','|host_description| - Traffic - |query_ifName|'),(73,'70390712158c3c5052a7d830fb456489',13,41,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(49,'6537b3209e0697fbec278e94e7317b52',2,38,1,'name','|host_description| - Errors - |query_ifIP| - |query_ifName|'),(50,'6d3f612051016f48c951af8901720a1c',2,38,2,'name','|host_description| - Errors - |query_ifName|'),(51,'62bc981690576d0b2bd0041ec2e4aa6f',2,38,3,'name','|host_description| - Errors - |query_ifIP|/|query_ifDescr|'),(52,'adb270d55ba521d205eac6a21478804a',2,38,4,'name','|host_description| - Errors - |query_ifDescr|'),(54,'77065435f3bbb2ff99bc3b43b81de8fe',3,40,1,'name','|host_description| - Non-Unicast Packets - |query_ifIP| - |query_ifName|'),(55,'240d8893092619c97a54265e8d0b86a1',3,40,2,'name','|host_description| - Non-Unicast Packets - |query_ifName|'),(56,'4b200ecf445bdeb4c84975b74991df34',3,40,3,'name','|host_description| - Non-Unicast Packets - |query_ifIP|/|query_ifDescr|'),(57,'d6da3887646078e4d01fe60a123c2179',3,40,4,'name','|host_description| - Non-Unicast Packets - |query_ifDescr|'),(59,'ce7769b97d80ca31d21f83dc18ba93c2',4,39,1,'name','|host_description| - Unicast Packets - |query_ifIP| - |query_ifName|'),(60,'1ee1f9717f3f4771f7f823ca5a8b83dd',4,39,2,'name','|host_description| - Unicast Packets - |query_ifName|'),(61,'a7dbd54604533b592d4fae6e67587e32',4,39,3,'name','|host_description| - Unicast Packets - |query_ifIP|/|query_ifDescr|'),(62,'b148fa7199edcf06cd71c89e5c5d7b63',4,39,4,'name','|host_description| - Unicast Packets - |query_ifDescr|'),(70,'87a659326af8c75158e5142874fd74b0',13,41,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(69,'cb09784ba05e401a3f1450126ed1e395',15,37,1,'name','|host_description| - Free Space - |query_dskDevice|'),(89,'57a9ae1f197498ca8dcde90194f61cbc',9,41,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(90,'0110e120981c7ff15304e4a85cb42cbe',9,41,4,'name','|host_description| - Traffic - |query_ifDescr|'),(91,'ce0b9c92a15759d3ddbd7161d26a98b7',9,41,1,'rrd_maximum','|query_ifSpeed|'),(92,'42277993a025f1bfd85374d6b4deeb60',17,42,1,'name','|host_description| - CPU Utilization - CPU|query_nwhrProcessorNum|'),(93,'a3f280327b1592a1a948e256380b544f',18,43,1,'name','|host_description| - Used Space - |query_hrStorageDescr|'),(94,'b5a724edc36c10891fa2a5c370d55b6f',19,44,1,'name','|host_description| - CPU Utilization - CPU|query_hrProcessorFrwID|'),(95,'7e87efd0075caba9908e2e6e569b25b0',20,41,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(96,'dd28d96a253ab86846aedb25d1cca712',20,41,2,'name','|host_description| - Traffic - |query_ifName|'),(97,'ce425fed4eb3174e4f1cde9713eeafa0',20,41,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(98,'d0d05156ddb2c65181588db4b64d3907',20,41,4,'name','|host_description| - Traffic - |query_ifDescr|'),(99,'3b018f789ff72cc5693ef79e3a794370',20,41,1,'rrd_maximum','|query_ifSpeed|'),(100,'b225229dbbb48c1766cf90298674ceed',21,41,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(101,'c79248ddbbd195907260887b021a055d',21,41,2,'name','|host_description| - Traffic - |query_ifName|'),(102,'12a6750d973b7f14783f205d86220082',21,41,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(103,'25b151fcfe093812cb5c208e36dd697e',21,41,4,'name','|host_description| - Traffic - |query_ifDescr|'),(104,'e9ab404a294e406c20fdd30df766161f',21,41,1,'rrd_maximum','|query_ifSpeed|'),(105,'119578a4f01ab47e820b0e894e5e5bb3',22,41,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(106,'940e57d24b2623849c77b59ed05931b9',22,41,2,'name','|host_description| - Traffic - |query_ifName|'),(107,'0f045eab01bbc4437b30da568ed5cb03',22,41,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(108,'bd70bf71108d32f0bf91b24c85b87ff0',22,41,4,'name','|host_description| - Traffic - |query_ifDescr|'),(109,'fdc4cb976c4b9053bfa2af791a21c5b5',22,41,1,'rrd_maximum','|query_ifSpeed|');
UNLOCK TABLES;
/*!40000 ALTER TABLE `snmp_query_graph_rrd_sv` ENABLE KEYS */;

--
-- Table structure for table `snmp_query_graph_sv`
--

DROP TABLE IF EXISTS `snmp_query_graph_sv`;
CREATE TABLE `snmp_query_graph_sv` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) collate latin1_german1_ci NOT NULL default '',
  `snmp_query_graph_id` mediumint(8) unsigned NOT NULL default '0',
  `sequence` mediumint(8) unsigned NOT NULL default '0',
  `field_name` varchar(100) collate latin1_german1_ci NOT NULL default '',
  `text` varchar(255) collate latin1_german1_ci NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `snmp_query_graph_id` (`snmp_query_graph_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `snmp_query_graph_sv`
--


/*!40000 ALTER TABLE `snmp_query_graph_sv` DISABLE KEYS */;
LOCK TABLES `snmp_query_graph_sv` WRITE;
INSERT INTO `snmp_query_graph_sv` (`id`, `hash`, `snmp_query_graph_id`, `sequence`, `field_name`, `text`) VALUES (7,'437918b8dcd66a64625c6cee481fff61',6,1,'title','|host_description| - Disk Space - |query_dskPath|'),(5,'2ddc61ff4bd9634f33aedce9524b7690',7,1,'title','|host_description| - Wireless Levels (|query_kbWirelessStationName|)'),(6,'c72e2da7af2cdbd6b44a5eb42c5b4758',8,1,'title','|host_description| - Wireless Transmissions (|query_kbWirelessStationName|)'),(33,'809c2e80552d56b65ca496c1c2fff398',16,3,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(32,'e403f5a733bf5c8401a110609683deb3',16,2,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(31,'7fb4a267065f960df81c15f9022cd3a4',16,1,'title','|host_description| - Traffic - |query_ifName|'),(11,'a412c5dfa484b599ec0f570979fdbc9e',10,1,'title','|host_description| - Volume Information - |query_nwVolPhysicalName|'),(12,'48f4792dd49fefd7d640ec46b1d7bdb3',11,1,'title','|host_description| - Directory Information - |query_nwVolPhysicalName|'),(14,'',12,1,'title','|host_description| - Disk Space - |query_dskDevice|'),(15,'49dca5592ac26ff149a4fbd18d690644',13,1,'title','|host_description| - Traffic - |query_ifName|'),(16,'bda15298139ad22bdc8a3b0952d4e3ab',13,2,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(17,'29e48483d0471fcd996bfb702a5960aa',13,3,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(18,'3f42d358965cb94ce4f708b59e04f82b',14,1,'title','|host_description| - Traffic - |query_ifName|'),(19,'45f44b2f811ea8a8ace1cbed8ef906f1',14,2,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(20,'69c14fbcc23aecb9920b3cdad7f89901',14,3,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(21,'299d3434851fc0d5c0e105429069709d',2,1,'title','|host_description| - Errors - |query_ifName|'),(22,'8c8860b17fd67a9a500b4cb8b5e19d4b',2,2,'title','|host_description| - Errors - |query_ifIP| (|query_ifDescr|)'),(23,'d96360ae5094e5732e7e7496ceceb636',2,3,'title','|host_description| - Errors - |query_ifDescr|/|query_ifIndex|'),(24,'750a290cadc3dc60bb682a5c5f47df16',3,1,'title','|host_description| - Non-Unicast Packets - |query_ifName|'),(25,'bde195eecc256c42ca9725f1f22c1dc0',3,2,'title','|host_description| - Non-Unicast Packets - |query_ifIP| (|query_ifDescr|)'),(26,'d9e97d22689e4ffddaca23b46f2aa306',3,3,'title','|host_description| - Non-Unicast Packets - |query_ifDescr|/|query_ifIndex|'),(27,'48ceaba62e0c2671a810a7f1adc5f751',4,1,'title','|host_description| - Unicast Packets - |query_ifName|'),(28,'d6258884bed44abe46d264198adc7c5d',4,2,'title','|host_description| - Unicast Packets - |query_ifIP| (|query_ifDescr|)'),(29,'6eb58d9835b2b86222306d6ced9961d9',4,3,'title','|host_description| - Unicast Packets - |query_ifDescr|/|query_ifIndex|'),(30,'f21b23df740bc4a2d691d2d7b1b18dba',15,1,'title','|host_description| - Disk Space - |query_dskDevice|'),(34,'0a5eb36e98c04ad6be8e1ef66caeed3c',9,1,'title','|host_description| - Traffic - |query_ifName|'),(35,'4c4386a96e6057b7bd0b78095209ddfa',9,2,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(36,'fd3a384768b0388fa64119fe2f0cc113',9,3,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(40,'d99f8db04fd07bcd2260d246916e03da',17,1,'title','|host_description| - CPU Utilization - CPU|query_nwhrProcessorNum|'),(38,'9852782792ede7c0805990e506ac9618',18,1,'title','|host_description| - Used Space - |query_hrStorageDescr|'),(39,'fa2f07ab54fce72eea684ba893dd9c95',19,1,'title','|host_description| - CPU Utilization - CPU|query_hrProcessorFrwID|'),(41,'f434ec853c479d424276f367e9806a75',20,1,'title','|host_description| - Traffic - |query_ifName|'),(42,'9b085245847444c5fb90ebbf4448e265',20,2,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(43,'5977863f28629bd8eb93a2a9cbc3e306',20,3,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(44,'37b6711af3930c56309cf8956d8bbf14',21,1,'title','|host_description| - Traffic - |query_ifName|'),(45,'cc435c5884a75421329a9b08207c1c90',21,2,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(46,'82edeea1ec249c9818773e3145836492',21,3,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(47,'87522150ee8a601b4d6a1f6b9e919c47',22,1,'title','|host_description| - Traffic - |query_ifName|'),(48,'993a87c04f550f1209d689d584aa8b45',22,2,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(49,'183bb486c92a566fddcb0585ede37865',22,3,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|');
UNLOCK TABLES;
/*!40000 ALTER TABLE `snmp_query_graph_sv` ENABLE KEYS */;

--
-- Table structure for table `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE `user_auth` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `username` varchar(50) collate latin1_german1_ci NOT NULL default '0',
  `password` varchar(50) collate latin1_german1_ci NOT NULL default '0',
  `realm` mediumint(8) NOT NULL default '0',
  `full_name` varchar(100) collate latin1_german1_ci default '0',
  `must_change_password` char(2) collate latin1_german1_ci default NULL,
  `show_tree` char(2) collate latin1_german1_ci default 'on',
  `show_list` char(2) collate latin1_german1_ci default 'on',
  `show_preview` char(2) collate latin1_german1_ci NOT NULL default 'on',
  `graph_settings` char(2) collate latin1_german1_ci default NULL,
  `login_opts` tinyint(1) NOT NULL default '1',
  `policy_graphs` tinyint(1) unsigned NOT NULL default '1',
  `policy_trees` tinyint(1) unsigned NOT NULL default '1',
  `policy_hosts` tinyint(1) unsigned NOT NULL default '1',
  `policy_graph_templates` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `user_auth`
--


/*!40000 ALTER TABLE `user_auth` DISABLE KEYS */;
LOCK TABLES `user_auth` WRITE;
INSERT INTO `user_auth` (`id`, `username`, `password`, `realm`, `full_name`, `must_change_password`, `show_tree`, `show_list`, `show_preview`, `graph_settings`, `login_opts`, `policy_graphs`, `policy_trees`, `policy_hosts`, `policy_graph_templates`) VALUES (1,'admin','bdb12524f924a9aa25b1e817473534a5',0,'Administrator','','on','on','on','on',1,1,1,1,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_auth` ENABLE KEYS */;

--
-- Table structure for table `user_auth_perms`
--

DROP TABLE IF EXISTS `user_auth_perms`;
CREATE TABLE `user_auth_perms` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `item_id` mediumint(8) unsigned NOT NULL default '0',
  `type` tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`item_id`,`type`),
  KEY `user_id` (`user_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `user_auth_perms`
--


/*!40000 ALTER TABLE `user_auth_perms` DISABLE KEYS */;
LOCK TABLES `user_auth_perms` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_auth_perms` ENABLE KEYS */;

--
-- Table structure for table `user_auth_realm`
--

DROP TABLE IF EXISTS `user_auth_realm`;
CREATE TABLE `user_auth_realm` (
  `realm_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`realm_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `user_auth_realm`
--


/*!40000 ALTER TABLE `user_auth_realm` DISABLE KEYS */;
LOCK TABLES `user_auth_realm` WRITE;
INSERT INTO `user_auth_realm` (`realm_id`, `user_id`) VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(7,1),(7,3),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_auth_realm` ENABLE KEYS */;

--
-- Table structure for table `user_log`
--

DROP TABLE IF EXISTS `user_log`;
CREATE TABLE `user_log` (
  `username` varchar(50) collate latin1_german1_ci NOT NULL default '0',
  `user_id` mediumint(8) NOT NULL default '0',
  `time` datetime NOT NULL default '0000-00-00 00:00:00',
  `result` tinyint(1) NOT NULL default '0',
  `ip` varchar(40) collate latin1_german1_ci NOT NULL default '',
  PRIMARY KEY  (`username`,`user_id`,`time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
CREATE TABLE `version` (
  `cacti` char(20) collate latin1_german1_ci default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `version`
--


/*!40000 ALTER TABLE `version` DISABLE KEYS */;
LOCK TABLES `version` WRITE;
INSERT INTO `version` (`cacti`) VALUES ('0.8.6i');
UNLOCK TABLES;
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

