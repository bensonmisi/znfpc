-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: znfpc
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.20.04.2

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `roleId` int NOT NULL,
  `password` varchar(255) NOT NULL,
  `passwordChange` varchar(255) NOT NULL DEFAULT 'N',
  `status` varchar(255) NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_9bd68c9cbb3712df77e60e27b7` (`username`),
  UNIQUE KEY `IDX_be0ce9bef56d5a30b9e5752564` (`email`),
  KEY `FK_bd39026a48be0213c8d3379294f` (`roleId`),
  CONSTRAINT `FK_bd39026a48be0213c8d3379294f` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (1,'Bensons','Misi','ec1345','benson.misi@gmail.com',1,'$2b$10$zOB0mB9oCWeWsDC3FKrL0OmWVqNS/KFw9NR/prJBN74Hpy1HuxmmG','Y','ACTIVE','2021-10-31 11:37:00.999489','2021-11-03 16:42:38.000000'),(2,'Donald','Dube','user_01','ddube@znfpc.org.zw',1,'$2b$10$Iqvt2g4kOuiph4QLqYlPBe3WnTzbCXlCF7WfkGX52fEm3qlbDO8Ci','N','ACTIVE','2021-11-18 08:40:43.677021','2021-11-18 08:40:43.677021'),(3,'Joy ','Reppoh','user_02','jreppoh@znfpc.org.zw',1,'$2b$10$bru9iB2AV8aUfhkZ9vZ54eY02YaAJjm5nMRwLv6iRMNj77MeS.762','N','ACTIVE','2021-11-18 08:41:28.143641','2021-11-18 08:41:28.143641'),(4,'Mandi','Ngoma','user_03','mngoma@znfpc.org.zw',1,'$2b$10$ulCxC.NdE.ufZkTO9y7kqOmydeArLMTcyQlnVNu1QRscK0Y8BhWLq','N','ACTIVE','2021-11-18 08:42:05.340927','2021-11-18 08:42:05.340927'),(5,'Mercy ','Marimirofa ','mmarimirofa','mmarimirofa@znfpc.org.zw',1,'$2b$10$ZRtwZIKb.h0v9mlXhI.u5OXzol.GOWeI5boIKtOR27URDuOfNB1kO','Y','ACTIVE','2021-11-18 08:42:47.630275','2022-08-03 06:27:35.000000'),(6,'Tsitsidzashe ','Musvosvi','user_05','tmusvosvi@znfpc.org.zw',7,'$2b$10$GDW7gr/B47jClHFhY90FteBQVhYB9MMOFb4fpZQjgwwdxceAQsyoW','N','ACTIVE','2021-11-18 08:44:03.736851','2021-11-18 08:44:03.736851'),(7,'Fadzai ','Mandishona','user_06','fmandishona@znfpc.org.zw',7,'$2b$10$Bs8kNXEub6nTNSaeNbq78OT.nwFIdU5z50leG4T22ZChNgKW1jEKG','N','ACTIVE','2021-11-18 08:44:50.654547','2021-11-18 08:44:50.654547'),(8,'Fungai','Madembo','user_07','fmadembo@znfpc.org.zw',7,'$2b$10$3HCoXTAB.o/4.Wl8ocWgSus3Xu62yvJtZUixs1llVqdSmDltFzLHq','N','ACTIVE','2021-11-18 08:45:26.959280','2021-11-18 08:45:26.959280'),(9,'Benevolence','Makubalo','user_08','bmakubalo@znfpc.org,zw',14,'$2b$10$rjUdNuIuFaS28KTk4k0aB.a6Bf6uKs3wH71VIKVaNzWJJm.NSeJbe','N','ACTIVE','2021-11-18 08:46:11.602778','2021-11-18 08:46:11.602778'),(10,'Hazel ','Masoja ','user_09','hmasoja@znfpc.org.zw',14,'$2b$10$pGNeEUonBbEErq6Dkx60huk.wL0qFPLLa/3a3DLWuFb6NIoOfLMRK','N','ACTIVE','2021-11-18 08:46:50.659802','2021-11-18 08:46:50.659802'),(11,'Varaidzo ','Sosa','user_10','vsosa@znfpc.org.zw',14,'$2b$10$VnnjWueI/mUlftAKgiv2V.J2vEaFd6iodd3GcZdWXodRZsg9jNgRq','N','ACTIVE','2021-11-18 08:47:26.238955','2021-11-18 08:47:26.238955');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrator_reset_token`
--

DROP TABLE IF EXISTS `administrator_reset_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator_reset_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `administratorId` int NOT NULL,
  `token` varchar(255) NOT NULL,
  `expire_date` datetime NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `FK_f051b2b4c2c31adef5adf8b2d15` (`administratorId`),
  CONSTRAINT `FK_f051b2b4c2c31adef5adf8b2d15` FOREIGN KEY (`administratorId`) REFERENCES `administrator` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator_reset_token`
--

LOCK TABLES `administrator_reset_token` WRITE;
/*!40000 ALTER TABLE `administrator_reset_token` DISABLE KEYS */;
INSERT INTO `administrator_reset_token` VALUES (1,5,'796955c2-f07f-467e-be8f-7f112c186a46','2021-11-20 00:00:00','2021-11-20 10:52:27.439136','2021-11-20 10:52:27.439136'),(2,5,'b7150893-23d1-4e6f-bcd2-2ebded15a833','2022-02-14 00:00:00','2022-02-14 06:48:19.238145','2022-02-14 06:48:19.238145'),(3,5,'bd713d42-6497-40a3-b295-194d6f202712','2022-08-02 00:00:00','2022-08-02 19:57:49.303014','2022-08-02 19:57:49.303014');
/*!40000 ALTER TABLE `administrator_reset_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry`
--

DROP TABLE IF EXISTS `inquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `maritalstatus` varchar(255) NOT NULL,
  `phonenumber` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `serviceId` int NOT NULL,
  `typeId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `frequency` varchar(255) DEFAULT NULL,
  `issue` text NOT NULL,
  `administratorId` int NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `status` varchar(255) NOT NULL DEFAULT 'ACTIVE',
  `age` varchar(255) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `knowledge` varchar(255) DEFAULT NULL,
  `mode` varchar(255) NOT NULL,
  `starttime` varchar(255) NOT NULL,
  `endtime` varchar(255) NOT NULL,
  `calldate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e4a1a832813793cfb1a59e56056` (`administratorId`),
  KEY `FK_e63444a3a6d4a7ca1396df0ab79` (`serviceId`),
  KEY `FK_e2dbb7cf3321c070a813d52a7a0` (`typeId`),
  KEY `FK_ebf0d00ba1e0f33f114df35db4e` (`productId`),
  CONSTRAINT `FK_e2dbb7cf3321c070a813d52a7a0` FOREIGN KEY (`typeId`) REFERENCES `type` (`id`),
  CONSTRAINT `FK_e4a1a832813793cfb1a59e56056` FOREIGN KEY (`administratorId`) REFERENCES `administrator` (`id`),
  CONSTRAINT `FK_e63444a3a6d4a7ca1396df0ab79` FOREIGN KEY (`serviceId`) REFERENCES `service` (`id`),
  CONSTRAINT `FK_ebf0d00ba1e0f33f114df35db4e` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry`
--

LOCK TABLES `inquiry` WRITE;
/*!40000 ALTER TABLE `inquiry` DISABLE KEYS */;
INSERT INTO `inquiry` VALUES (1,'sdfsfsfs','F','SINGLE','234234234234234','sdfsdfdsfsf','Matabeleland South','Beitbridge','sdfdsfdfs','sdfsdfsdf',1,1,1,NULL,'<p>wefsdfdffsdf sffsdfsdfsdf</p>',1,'2021-11-14 21:06:34.411518','2021-11-17 16:38:55.746550','ACTIVE','10','','','','','',''),(2,'Tendai Towo','F','SINGLE','+263775474661','ttowo@gmail.com','Harare','Harare','Harare','Budiriro',1,3,8,NULL,'<p>How long does the  jadelle last</p>',1,'2021-11-14 21:11:16.542971','2021-11-17 16:38:55.850844','ACTIVE','15','','','','','',''),(3,'Vimbai Matenga','F','MARRIED','+263775690935','vimbai.matenga@gmail.com','Harare','Harare','Harare','Southlands',1,1,1,NULL,'<p>how much are contraceptive pills</p>',1,'2021-11-17 12:21:01.501689','2021-11-17 12:21:01.501689','ACTIVE','33','From a Freind',NULL,'CALL','','',''),(4,'testing','M','MARRIED','23213213213123','benson.misi@gmail.com','Harare','Harare','Harare','harare',1,13,13,NULL,'<p>dummmy dummmy</p>',8,'2022-01-19 08:58:14.234980','2022-01-19 08:58:14.234980','ACTIVE','33','googled',NULL,'CALL','11:06','11:07','2022-01-19'),(5,'Ratidzo','F','SINGLE','0712519907','','Manicaland','Buhera','Bangure','Bangure',1,1,5,NULL,'<p>spoke about other methods like IUCD</p>',8,'2022-01-24 07:33:46.917789','2022-01-24 07:33:46.917789','ACTIVE','26','friend',NULL,'CALL','11:56','12:10','2022-01-17'),(6,'Nomagugu Mkwebu','F','SINGLE','0718069566',NULL,'Harare','Harare','Harare','Msasa Park',1,1,5,NULL,'',8,'2022-01-24 07:38:11.199420','2022-01-24 07:38:11.199420','ACTIVE','26','friend',NULL,'CALL','09:00','10:10','2022-01-17'),(7,'susan maponga','F','SINGLE','0716895973','','Harare','Harare','westley','Westley',1,1,2,NULL,'<p>Needed opening hour information and price for IUCD removal</p>',8,'2022-01-31 13:22:11.214542','2022-01-31 13:22:11.214542','ACTIVE','33','facebook',NULL,'CALL','15:17','15:20','2022-01-31'),(8,'Max Mandeya','M','SINGLE','071363062','','Harare','Harare','Warren Park D','Warren Park D',1,2,16,NULL,'<p>Asked about self testing kits </p>',8,'2022-02-07 11:11:07.311564','2022-02-07 11:11:07.311564','ACTIVE','30','whatsapp',NULL,'CALL','13:03','13:06','2022-02-07'),(9,'Ndinashe  dikani','F','MARRIED','07167725','','Manicaland','Makoni','nyabadza','nyabadza',1,1,1,NULL,'<p>General information about family planning and wanted to check if the line is working </p><p><br></p><p>was not able to get the number she hung up before  I could get the number</p>',8,'2022-02-08 09:11:43.214338','2022-02-08 09:11:43.214338','ACTIVE','35','facebook',NULL,'CALL','10:57','11:04','2022-02-08'),(10,'Estella Chiguvangika','F','MARRIED','0786737887','estellechumbu7@gmail.com','Harare','Harare','Borrowdale','Borrowdale',1,1,2,NULL,'<p>The client wanted to come for permanent method and letter on opted to come for IUCD</p>',10,'2022-02-23 13:39:35.676666','2022-02-23 13:39:35.676666','ACTIVE','44','Facebook',NULL,'CALL','03:18','03:25','2022-02-23'),(11,'NYASHA JONES','F','MARRIED','0719780498','nyashakarimanhai@05.og.com','Harare','Harare','Avenues','Avenues',1,1,4,NULL,'<p>Client bleeding on implanon and  wanted to visit Fife Avenue clinic checking if the clinic is still open at this time</p>',10,'2022-03-07 14:13:43.944462','2022-03-07 14:13:43.944462','ACTIVE','33','Facebook',NULL,'CALL','03:57','04:10','2022-03-07'),(12,'Susan Maponga','F','MARRIED','0779745548','modellin.stima@gmail.com','Harare','Harare','Harare','Westlie',1,1,2,NULL,'<p>Client spoting on IUCD x 3months started to use both IUCD and control. Advised to visit Spilhaus clinic</p>',10,'2022-03-10 12:21:01.161045','2022-03-10 12:21:01.161045','ACTIVE','33','Watsapp status',NULL,'CALL','13:53','02:04','2022-03-10'),(13,'Chipo Machipisa','F','MARRIED','0774627848','N/A','Harare','Harare','Harare','Aspindale',1,1,4,NULL,'',10,'2022-04-06 10:09:31.278341','2022-04-06 10:09:31.278341','ACTIVE','35','watsapp',NULL,'CALL','11:58','12:06','2022-04-06'),(14,'EUNICE CHIKWEZA','F','MARRIED','0773983487','eunicedadirai@gmail.com','Harare','Harare','Harare','Kuwadzana',1,1,4,NULL,'<p>price for implanon in bulk</p>',10,'2022-04-06 11:26:01.245902','2022-04-06 11:26:01.245902','ACTIVE','43','watsapp',NULL,'CALL','13:15','13:21','2022-04-06'),(15,'Tendai','F','MARRIED','0776288401','','Harare','Harare','southerton ','southerton',1,1,2,NULL,'<p>IUCD removal and insertion</p>',8,'2022-04-07 07:48:15.943235','2022-04-07 07:48:15.943235','ACTIVE','28','spilhaus posters',NULL,'CALL','09:30','09:37','2022-04-07'),(16,'travor tom','F','MARRIED','0772913175','ttrover tom2gmail','Harare','Harare','Sunngdale','Sunngdale',6,16,19,NULL,'',10,'2022-04-11 11:36:30.223833','2022-04-11 11:36:30.223833','ACTIVE','37','facebook',NULL,'CALL','13:26','13:30','2022-04-11'),(17,'Mai Muna','F','MARRIED','NOT GIVEN','NOT GIVEN','Manicaland','Mutare','NOT GIVEN','NOT GIVEN',1,1,3,NULL,'<p>THE CLIENT REFUSED TO GIVE USE PERSONAL INFORMATION</p>',10,'2022-04-11 11:48:02.811168','2022-04-11 11:48:02.811168','ACTIVE','35','WATSAPP STUTUS',NULL,'CALL','13:36','13:41','2022-04-11'),(18,'Tariro Chifambi','F','MARRIED','0784262452','chifambitariro@gmail.com','Bulawayo','Bulawayo','Caldrypark','Caldrypark',1,1,5,NULL,'<p>bleeding on secure</p>',10,'2022-04-11 13:20:26.461179','2022-04-11 13:20:26.461179','ACTIVE','33','watsapp group',NULL,'CALL','15:00','15:08','2022-04-11'),(19,'Varelery Moyo','F','MARRIED','0771577821','not given','Bulawayo','Bulawayo','Bulawayo','Nkulumani',1,1,4,NULL,'',10,'2022-04-13 09:22:15.607004','2022-04-13 09:22:15.607004','ACTIVE','36','someone watsapp status',NULL,'CALL','11:06','11:10','2022-04-13'),(20,'Rose Mutapa','F','MARRIED','0712924668','rrisai2@gmail.comk','Bulawayo','Bulawayo','Bulawayo town','Town',1,1,2,NULL,'<p>Was refered to Bulawayo Lister for IUCD insertion</p>',10,'2022-04-19 11:51:25.528666','2022-04-19 11:51:25.528666','ACTIVE','35','watsapp group',NULL,'CALL','13:29','13:45','2022-04-19'),(21,'Priscilla Shumba','F','MARRIED','0772203038','','Harare','Harare','Damafalls','Damafalls',1,3,7,NULL,'<p>also want to have IUCD insertion on the day</p>',8,'2022-04-25 10:04:21.500256','2022-04-25 10:04:21.500256','ACTIVE','32','facebook',NULL,'CALL','11:57','12:02','2022-04-25'),(22,'Tinashe Mcnolen','F','SINGLE','0775804801','','Mashonaland North',NULL,'bulawayo','bulawayo',1,13,12,NULL,'<p>Referred to Lister House</p>',8,'2022-04-27 08:56:17.843424','2022-04-27 08:56:17.843424','ACTIVE','25','twitter',NULL,'CALL','10:51','10:55','2022-04-27'),(23,'Charity','F','SINGLE','not given','Not given','Harare','Harare','Harare','Harare CBD',1,1,1,NULL,'',10,'2022-04-28 12:17:21.438422','2022-04-28 12:17:21.438422','ACTIVE','18','watsapp group',NULL,'CALL','13:46','13:51','2022-04-28'),(24,'sandra Ncube','F','MARRIED','0772440956','','Harare','Harare','harare','craignmbone',1,3,7,NULL,'<p>she wanted to have <strong> </strong>hysterectomy done so gave her the znfpc landline number. was not able to get her age.<strong> </strong></p>',8,'2022-05-12 07:37:25.661594','2022-05-12 07:37:25.661594','ACTIVE','46','facebook',NULL,'CALL','09:20','09:23','2022-05-12'),(25,'caronline murawo','F','MARRIED','0773947872',NULL,'Harare','Harare','harare','town',1,1,3,NULL,'<p>age not given...however, she has bleeding troubles because of jadelle</p>',8,'2022-05-12 08:19:43.695919','2022-05-12 08:19:43.695919','ACTIVE','32','facebook',NULL,'CALL','10:15','10:18','2022-05-12'),(26,'test','F','MARRIED','+263775474661','benson.misi@gmail.com','Masvingo','Bikita','Harare','sdfsdfds',1,1,1,NULL,'<p>fdgdsgsdgsdgsdgsdgsgdsd</p>',5,'2022-08-02 20:57:43.960689','2022-08-02 20:57:43.960689','ACTIVE','45','fghgfhfh',NULL,'CALL','00:00','01:00','2022-08-02');
/*!40000 ALTER TABLE `inquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `submoduleId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_240853a0c3353c25fb12434ad3` (`name`),
  KEY `FK_9167bdc5906fded3b425d43426d` (`submoduleId`),
  CONSTRAINT `FK_9167bdc5906fded3b425d43426d` FOREIGN KEY (`submoduleId`) REFERENCES `submodule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,1,'CREATE_USER','2021-11-01 14:24:43.337883','2021-11-01 14:24:43.337883'),(3,1,'VIEW_USER','2021-11-01 14:24:57.694219','2021-11-01 14:24:57.694219'),(4,1,'VIEW_USERS','2021-11-01 14:25:01.070964','2021-11-01 14:25:01.070964'),(5,1,'UPDATE_USER','2021-11-01 14:25:12.051762','2021-11-01 14:25:12.051762'),(6,1,'DELETE_USER','2021-11-01 14:25:21.004275','2021-11-01 14:25:21.004275'),(7,4,'CREATE_ROLE','2021-11-03 23:55:01.264720','2021-11-03 23:55:01.264720'),(8,4,'GET_ROLES','2021-11-03 23:55:18.392304','2021-11-03 23:55:18.392304'),(9,4,'GET_ROLE','2021-11-03 23:55:51.567829','2021-11-03 23:55:51.567829'),(10,4,'UPDATE_ROLE','2021-11-03 23:56:07.543881','2021-11-03 23:56:07.543881'),(11,4,'DELETE_ROLE','2021-11-03 23:56:27.328516','2021-11-03 23:56:27.328516'),(13,6,'CREATE_SYSTEMMODULE','2021-11-05 19:24:58.269985','2021-11-05 19:24:58.269985'),(14,6,'GET_SYSTEMMODULES','2021-11-05 19:25:22.743343','2021-11-05 19:25:22.743343'),(15,6,'GET_SYSTEMMODULE','2021-11-05 19:26:24.146859','2021-11-05 19:26:24.146859'),(16,6,'UPDATE_SYSTEMMODULE','2021-11-05 19:26:37.057262','2021-11-05 19:26:37.057262'),(17,6,'DELETE_SYSTEMMODULE','2021-11-05 19:26:48.253586','2021-11-05 19:26:48.253586'),(18,6,'GET_ASSIGNED_SYSTEMMODULES','2021-11-05 19:27:03.818056','2021-11-05 19:27:03.818056'),(19,8,'CREATE_SUPPLIERTYPE','2021-11-05 23:10:42.987766','2021-11-05 23:10:42.987766'),(20,8,'GET_SUPPLIERTYPES','2021-11-05 23:11:01.034228','2021-11-05 23:11:01.034228'),(21,8,'UPDATE_SUPPLIERTYPE','2021-11-05 23:11:30.523603','2021-11-05 23:11:30.523603'),(22,8,'DELETE_SUPPLIERTYPE','2021-11-05 23:11:49.082857','2021-11-05 23:11:49.082857'),(23,9,'CREATE_SECTION','2021-11-06 12:41:43.266192','2021-11-06 12:41:43.266192'),(24,9,'GET_SECTION','2021-11-06 12:41:58.653896','2021-11-06 12:41:58.653896'),(25,9,'GET_SECTIONS','2021-11-06 12:42:11.745442','2021-11-06 12:42:11.745442'),(26,9,'UPDATE_SECTION','2021-11-06 12:42:30.056215','2021-11-06 12:42:30.056215'),(27,9,'DELETE_SECTION','2021-11-06 12:42:58.603963','2021-11-06 12:42:58.603963'),(28,10,'CREATE_CATEGORY','2021-11-06 13:05:32.028640','2021-11-06 13:05:32.028640'),(29,10,'GET_CATEGORIES','2021-11-06 13:08:47.016055','2021-11-06 13:08:47.016055'),(30,10,'GET_CATEGORY','2021-11-06 13:09:05.096924','2021-11-06 13:09:05.096924'),(31,10,'UPDATE_CATEGORY','2021-11-06 13:09:30.922166','2021-11-06 13:09:30.922166'),(32,10,'DELETE_CATEGORY','2021-11-06 13:09:47.450494','2021-11-06 13:09:47.450494'),(33,8,'CREATE_DOCUMENT','2021-11-06 21:50:56.853440','2021-11-06 21:50:56.853440'),(34,8,'GET_DOCUMENTS','2021-11-06 21:51:27.872186','2021-11-06 21:51:27.872186'),(35,8,'GET_DOCUMENT','2021-11-06 21:51:48.520307','2021-11-06 21:51:48.520307'),(36,8,'UPDATE_DOCUMENT','2021-11-06 21:52:05.878938','2021-11-06 21:52:05.878938'),(37,8,'DELETE_DOCUMENT','2021-11-06 21:52:20.946245','2021-11-06 21:52:20.946245'),(38,11,'CREATE_PERIOD','2021-11-07 09:47:37.490541','2021-11-07 09:47:37.490541'),(39,11,'GET_PERIODS','2021-11-07 09:48:40.408310','2021-11-07 09:48:40.408310'),(40,11,'GET_PERIOD','2021-11-07 09:49:03.204700','2021-11-07 09:49:03.204700'),(41,11,'UPDATE_PERIOD','2021-11-07 09:49:22.379684','2021-11-07 09:49:22.379684'),(61,19,'CREATE_SERVICE','2021-11-14 14:07:04.700457','2021-11-14 14:07:04.700457'),(62,19,'GET_SERVICES','2021-11-14 14:07:15.382719','2021-11-14 14:07:15.382719'),(63,19,'GET_SERVICE','2021-11-14 14:07:27.421563','2021-11-14 14:07:27.421563'),(64,19,'UPDATE_SERVICE','2021-11-14 14:07:38.573564','2021-11-14 14:07:38.573564'),(65,19,'DELETE_SERVICE','2021-11-14 14:07:48.875703','2021-11-14 14:07:48.875703'),(66,19,'CREATE_SERVICETYPE','2021-11-14 14:09:26.351716','2021-11-14 14:09:26.351716'),(67,19,'GET_SERVICETYPES','2021-11-14 14:09:50.348526','2021-11-14 14:09:50.348526'),(68,19,'GET_SERVICETYPE','2021-11-14 14:10:02.899634','2021-11-14 14:10:02.899634'),(69,19,'UPDATE_SERVICETYPE','2021-11-14 14:10:11.332806','2021-11-14 14:10:11.332806'),(70,19,'DELETE_SERVICETYPE','2021-11-14 14:10:21.226575','2021-11-14 14:10:21.226575'),(71,19,'CREATE_PRODUCT','2021-11-14 14:10:40.988434','2021-11-14 14:10:40.988434'),(72,19,'GET_PRODUCTS','2021-11-14 14:10:50.608572','2021-11-14 14:10:50.608572'),(73,19,'GET_PRODUCT','2021-11-14 14:10:59.898723','2021-11-14 14:10:59.898723'),(74,19,'UPDATE_PRODUCT','2021-11-14 14:11:10.349074','2021-11-14 14:11:10.349074'),(75,19,'DELETE_PRODUCT','2021-11-14 14:11:19.580145','2021-11-14 14:11:19.580145'),(76,20,'VIEW_REPORT_BY_AGENT','2021-11-14 22:17:47.509426','2021-11-14 22:19:04.000000'),(77,21,'VIEW_REPORT_BY_SERVICE','2021-11-14 22:18:53.155731','2021-11-14 22:18:53.155731');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_roles`
--

DROP TABLE IF EXISTS `permission_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_roles` (
  `permissionId` int NOT NULL,
  `roleId` int NOT NULL,
  PRIMARY KEY (`permissionId`,`roleId`),
  KEY `IDX_86f6c7d1a377b78cef67a3c3d2` (`permissionId`),
  KEY `IDX_2ed76a7ef2fa565d019403a24f` (`roleId`),
  CONSTRAINT `FK_2ed76a7ef2fa565d019403a24f9` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_86f6c7d1a377b78cef67a3c3d23` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_roles`
--

LOCK TABLES `permission_roles` WRITE;
/*!40000 ALTER TABLE `permission_roles` DISABLE KEYS */;
INSERT INTO `permission_roles` VALUES (1,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1);
/*!40000 ALTER TABLE `permission_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `typeId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_53bafe3ecc25867776c07c9e666` (`typeId`),
  CONSTRAINT `FK_53bafe3ecc25867776c07c9e666` FOREIGN KEY (`typeId`) REFERENCES `type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Contraceptive','ACTIVE','2021-11-14 15:09:29.113552','2021-11-14 15:09:29.113552',1),(2,'IUCD','ACTIVE','2021-11-14 15:11:22.845884','2021-11-14 15:11:22.845884',1),(3,' Jadelle','ACTIVE','2021-11-14 15:11:33.714652','2021-11-14 15:11:33.714652',1),(4,' Implanon','ACTIVE','2021-11-14 15:11:43.965229','2021-11-14 15:11:43.965229',1),(5,' Orals','ACTIVE','2021-11-14 15:11:54.043402','2021-11-14 15:11:54.043402',1),(6,'Injectable (Sayana Press  or Depo Provera)','ACTIVE','2021-11-14 15:12:02.810614','2021-11-14 15:12:02.810614',1),(7,'Pap Smear','ACTIVE','2021-11-14 15:13:02.531407','2021-11-14 15:13:02.531407',3),(8,'VIAC','ACTIVE','2021-11-14 15:13:18.122364','2021-11-14 15:13:18.122364',3),(9,'Integrated Clinical Course','ACTIVE','2021-12-14 18:21:21.893513','2021-12-14 18:21:21.893513',6),(10,'Implants (Jadelle and Implannon)','ACTIVE','2021-12-14 18:21:53.245799','2021-12-14 18:21:53.245799',6),(11,'IUCD','ACTIVE','2021-12-14 18:22:00.269711','2021-12-14 18:22:00.269711',6),(12,'Management','ACTIVE','2021-12-14 18:23:17.344064','2021-12-14 18:23:17.344064',13),(13,'Treatment','ACTIVE','2021-12-14 18:23:25.229945','2021-12-14 18:23:25.229945',13),(14,'Testing','ACTIVE','2021-12-14 18:23:46.066202','2021-12-14 18:23:46.066202',2),(15,'Prep','ACTIVE','2021-12-14 18:23:52.918777','2021-12-14 18:23:52.918777',2),(16,'HIVST','ACTIVE','2021-12-14 18:24:04.976611','2021-12-14 18:24:04.976611',2),(17,'ART Services','ACTIVE','2021-12-14 18:24:15.826786','2021-12-14 18:24:15.826786',2),(18,'Cancer screening','ACTIVE','2022-02-14 06:51:21.063836','2022-02-14 06:51:21.063836',16),(19,'FP methods','ACTIVE','2022-02-14 06:51:33.522298','2022-02-14 06:51:33.522298',16),(20,'ASRH','ACTIVE','2022-02-14 06:51:40.620572','2022-02-14 06:51:40.620572',16);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_ae4578dcaed5adff96595e6166` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Administrator','2021-10-31 00:23:54.303359','2022-02-14 06:46:34.000000'),(7,'Managers','2021-10-31 00:27:23.910461','2021-11-14 04:53:28.000000'),(14,'Agents','2021-11-14 04:53:50.640104','2021-11-14 04:53:50.640104');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `status` varchar(255) NOT NULL DEFAULT 'ACTIVE',
  `administratorId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_11a85f4eb5944cace329320e539` (`administratorId`),
  CONSTRAINT `FK_11a85f4eb5944cace329320e539` FOREIGN KEY (`administratorId`) REFERENCES `administrator` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'Service Delivery','2021-11-14 14:21:15.055049','2021-11-14 14:26:59.000000','ACTIVE',NULL),(2,'ASRH ','2021-11-14 15:15:33.740250','2021-11-14 15:15:33.740250','ACTIVE',NULL),(3,'Training','2021-11-14 15:16:02.232462','2021-11-14 15:16:02.232462','ACTIVE',NULL),(4,'Catering and Accomodation','2021-11-14 15:17:03.097267','2021-11-14 15:17:03.097267','ACTIVE',NULL),(5,'Evaluation and Research','2021-12-14 18:18:38.426481','2021-12-14 18:18:38.426481','ACTIVE',NULL),(6,'Information or enquiry','2022-02-14 06:49:26.838713','2022-02-14 06:49:26.838713','ACTIVE',NULL);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submodule`
--

DROP TABLE IF EXISTS `submodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submodule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `systemmoduleId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_e78a0a2cd96c2a052baac4902d` (`url`),
  KEY `FK_19c28ccd9a9c271d7b5d7d95ef8` (`systemmoduleId`),
  CONSTRAINT `FK_19c28ccd9a9c271d7b5d7d95ef8` FOREIGN KEY (`systemmoduleId`) REFERENCES `system_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submodule`
--

LOCK TABLES `submodule` WRITE;
/*!40000 ALTER TABLE `submodule` DISABLE KEYS */;
INSERT INTO `submodule` VALUES (1,1,'User Management','mdi-account-cog','Administrators','2021-10-31 22:36:18.868061','2021-10-31 22:36:18.868061'),(4,1,'User Roles','mdi-account-key','Roles','2021-10-31 22:39:42.060470','2021-11-03 17:04:30.175673'),(6,1,'System Modules','mdi-link-box','systemmodules','2021-11-03 16:58:44.777993','2021-11-03 17:04:30.221182'),(8,2,'Supplier Types','mdi-account-network','Suppliertype','2021-11-05 23:10:09.026198','2021-11-05 23:10:09.026198'),(9,2,'Supplier Sections','mdi-set-none','sections','2021-11-06 12:41:30.563906','2021-11-06 12:41:30.563906'),(10,2,'Supplier Categories','mdi-shape-square-plus','category','2021-11-06 13:05:17.248687','2021-11-06 13:05:17.248687'),(11,2,'Registration Periods','mdi-shape-circle-plus','registrationperiods','2021-11-07 09:47:07.376098','2021-11-07 09:47:07.376098'),(19,6,'Services','mdi-cogs','service','2021-11-14 14:06:29.414923','2021-11-14 14:06:29.414923'),(20,7,'By Agent','mdi-account','report-by-agent','2021-11-14 22:17:32.027244','2021-11-14 22:22:21.000000'),(21,7,'By Service','mdi-file-multiple-outline','report-by-service','2021-11-14 22:18:27.117383','2021-11-14 22:22:43.000000'),(22,7,'Overall Report','mdi-chart-box','report','2021-11-15 23:00:29.262229','2021-11-15 23:00:29.262229');
/*!40000 ALTER TABLE `submodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submodules_roles`
--

DROP TABLE IF EXISTS `submodules_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submodules_roles` (
  `submoduleId` int NOT NULL,
  `roleId` int NOT NULL,
  PRIMARY KEY (`submoduleId`,`roleId`),
  KEY `IDX_b0a7dce5d6395e653f1aff7915` (`submoduleId`),
  KEY `IDX_178feca92dd29f4209d78a940f` (`roleId`),
  CONSTRAINT `FK_178feca92dd29f4209d78a940f3` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_b0a7dce5d6395e653f1aff79152` FOREIGN KEY (`submoduleId`) REFERENCES `submodule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submodules_roles`
--

LOCK TABLES `submodules_roles` WRITE;
/*!40000 ALTER TABLE `submodules_roles` DISABLE KEYS */;
INSERT INTO `submodules_roles` VALUES (1,1),(1,7),(4,1),(6,1),(8,1),(9,1),(10,1),(19,1),(20,1),(20,7),(21,1),(21,7),(22,1),(22,7);
/*!40000 ALTER TABLE `submodules_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_module`
--

DROP TABLE IF EXISTS `system_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_module` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `widget` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'PENDING',
  `description` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_module`
--

LOCK TABLES `system_module` WRITE;
/*!40000 ALTER TABLE `system_module` DISABLE KEYS */;
INSERT INTO `system_module` VALUES (1,'System Settings','mdi-account-cog','WGTSYSTEMSETTINGS','PENDING','test','2021-10-31 14:37:26.959929','2021-10-31 14:37:26.959929'),(2,'Supplier Settings','mdi-account-cog','WGTSYPPLIERSETTINGS','PENDING','TEST','2021-11-01 10:51:57.702841','2021-11-03 18:05:10.521608'),(6,'Service Settings','mdi-cogs','SERVICE_SETTINGS','PENDING','This is a service serttings module','2021-11-14 14:05:01.369103','2021-11-14 14:05:01.369103'),(7,'Reports','mdi-chart-bar','REPORTS','PENDING','This Module Shows Reports','2021-11-14 22:16:48.017755','2021-11-14 22:16:48.017755');
/*!40000 ALTER TABLE `system_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmodules_roles`
--

DROP TABLE IF EXISTS `systemmodules_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmodules_roles` (
  `systemmoduleId` int NOT NULL,
  `roleId` int NOT NULL,
  PRIMARY KEY (`systemmoduleId`,`roleId`),
  KEY `IDX_be5ad3fb9750c1d58e7a241210` (`systemmoduleId`),
  KEY `IDX_f736135de8ef34e83e90eb6b26` (`roleId`),
  CONSTRAINT `FK_be5ad3fb9750c1d58e7a2412105` FOREIGN KEY (`systemmoduleId`) REFERENCES `system_module` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_f736135de8ef34e83e90eb6b26f` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmodules_roles`
--

LOCK TABLES `systemmodules_roles` WRITE;
/*!40000 ALTER TABLE `systemmodules_roles` DISABLE KEYS */;
INSERT INTO `systemmodules_roles` VALUES (1,1),(6,1),(7,1),(7,7);
/*!40000 ALTER TABLE `systemmodules_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `serviceId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ca8293224846ed75b9a7b5ca816` (`serviceId`),
  CONSTRAINT `FK_ca8293224846ed75b9a7b5ca816` FOREIGN KEY (`serviceId`) REFERENCES `service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'Family Planning','ACTIVE','2021-11-14 14:29:15.611740','2021-11-14 14:29:15.611740',1),(2,'HTS','ACTIVE','2021-11-14 14:34:27.986575','2021-11-14 14:34:27.986575',1),(3,'Cancer Screening','ACTIVE','2021-11-14 14:34:52.935306','2021-11-14 14:34:52.935306',1),(4,'VMMC','ACTIVE','2021-11-14 14:35:42.141941','2021-11-14 14:35:42.141941',1),(5,'Fertility Services','ACTIVE','2021-11-14 14:35:56.856681','2021-11-14 14:35:56.856681',1),(6,'FP Course','ACTIVE','2021-11-14 15:16:17.550770','2021-11-14 15:16:17.550770',3),(7,'ASRH Course','ACTIVE','2021-11-14 15:16:27.205688','2021-12-14 18:22:29.000000',3),(8,'Service delivery','ACTIVE','2021-12-14 18:19:18.186648','2021-12-14 18:19:18.186648',5),(9,'ASRH','ACTIVE','2021-12-14 18:19:26.512840','2021-12-14 18:19:26.512840',5),(10,'Catering and Accomodation','ACTIVE','2021-12-14 18:19:51.533649','2021-12-14 18:19:51.533649',5),(11,'Marketing and Communication (Audio Visual)','ACTIVE','2021-12-14 18:20:15.279723','2021-12-14 18:20:15.279723',5),(12,'Logistics (Supply Chain)','ACTIVE','2021-12-14 18:20:37.632480','2021-12-14 18:20:37.632480',5),(13,'STI ','ACTIVE','2021-12-14 18:23:03.281161','2021-12-14 18:23:03.281161',1),(14,'FP methods','ACTIVE','2022-02-14 06:49:44.871829','2022-02-14 06:50:17.000000',6),(15,'Training dates','ACTIVE','2022-02-14 06:49:55.706785','2022-02-14 06:50:38.000000',6),(16,'services offered','ACTIVE','2022-02-14 06:50:11.826775','2022-02-14 06:50:11.826775',6),(17,'ASRH CSE','ACTIVE','2022-02-14 06:52:11.449795','2022-02-14 06:52:11.449795',6),(18,'CSE','ACTIVE','2022-02-14 06:53:27.818877','2022-02-14 06:53:27.818877',2),(19,'PCC','ACTIVE','2022-02-14 06:53:34.712380','2022-02-14 06:53:34.712380',2),(20,'Training on ASRH','ACTIVE','2022-02-14 06:53:54.417453','2022-02-14 06:53:54.417453',2),(21,'ASRH Forums','ACTIVE','2022-02-14 06:54:07.978344','2022-02-14 06:54:07.978344',2),(22,'Accommodation prices','ACTIVE','2022-02-14 06:54:56.846746','2022-02-14 06:54:56.846746',4),(23,'Catering services','ACTIVE','2022-02-14 06:55:06.563985','2022-02-14 06:55:06.563985',4);
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-09 14:30:11
