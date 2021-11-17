-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table znfpc.administrator
CREATE TABLE IF NOT EXISTS `administrator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `roleId` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `passwordChange` varchar(255) NOT NULL DEFAULT 'N',
  `status` varchar(255) NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_9bd68c9cbb3712df77e60e27b7` (`username`),
  UNIQUE KEY `IDX_be0ce9bef56d5a30b9e5752564` (`email`),
  KEY `FK_bd39026a48be0213c8d3379294f` (`roleId`),
  CONSTRAINT `FK_bd39026a48be0213c8d3379294f` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table znfpc.administrator: ~1 rows (approximately)
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT IGNORE INTO `administrator` (`id`, `name`, `surname`, `username`, `email`, `roleId`, `password`, `passwordChange`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Bensons', 'Misi', 'ec1345', 'benson.misi@gmail.com', 1, '$2b$10$zOB0mB9oCWeWsDC3FKrL0OmWVqNS/KFw9NR/prJBN74Hpy1HuxmmG', 'Y', 'ACTIVE', '2021-10-31 11:37:00.999489', '2021-11-03 16:42:38.000000');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;

-- Dumping structure for table znfpc.administrator_reset_token
CREATE TABLE IF NOT EXISTS `administrator_reset_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `administratorId` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expire_date` datetime NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `FK_f051b2b4c2c31adef5adf8b2d15` (`administratorId`),
  CONSTRAINT `FK_f051b2b4c2c31adef5adf8b2d15` FOREIGN KEY (`administratorId`) REFERENCES `administrator` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table znfpc.administrator_reset_token: ~0 rows (approximately)
/*!40000 ALTER TABLE `administrator_reset_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrator_reset_token` ENABLE KEYS */;

-- Dumping structure for table znfpc.inquiry
CREATE TABLE IF NOT EXISTS `inquiry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `maritalstatus` varchar(255) NOT NULL,
  `phonenumber` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `serviceId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `frequency` varchar(255) DEFAULT NULL,
  `issue` text NOT NULL,
  `administratorId` int(11) NOT NULL,
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
  CONSTRAINT `FK_e2dbb7cf3321c070a813d52a7a0` FOREIGN KEY (`typeId`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_e4a1a832813793cfb1a59e56056` FOREIGN KEY (`administratorId`) REFERENCES `administrator` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_e63444a3a6d4a7ca1396df0ab79` FOREIGN KEY (`serviceId`) REFERENCES `service` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ebf0d00ba1e0f33f114df35db4e` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table znfpc.inquiry: ~3 rows (approximately)
/*!40000 ALTER TABLE `inquiry` DISABLE KEYS */;
INSERT IGNORE INTO `inquiry` (`id`, `name`, `gender`, `maritalstatus`, `phonenumber`, `email`, `province`, `district`, `city`, `location`, `serviceId`, `typeId`, `productId`, `frequency`, `issue`, `administratorId`, `created_at`, `updated_at`, `status`, `age`, `reference`, `knowledge`, `mode`, `starttime`, `endtime`, `calldate`) VALUES
	(1, 'sdfsfsfs', 'F', 'SINGLE', '234234234234234', 'sdfsdfdsfsf', 'Matabeleland South', 'Beitbridge', 'sdfdsfdfs', 'sdfsdfsdf', 1, 1, 1, NULL, '<p>wefsdfdffsdf sffsdfsdfsdf</p>', 1, '2021-11-14 21:06:34.411518', '2021-11-17 16:38:55.746550', 'ACTIVE', '10', '', '', '', '', '', ''),
	(2, 'Tendai Towo', 'F', 'SINGLE', '+263775474661', 'ttowo@gmail.com', 'Harare', 'Harare', 'Harare', 'Budiriro', 1, 3, 8, NULL, '<p>How long does the  jadelle last</p>', 1, '2021-11-14 21:11:16.542971', '2021-11-17 16:38:55.850844', 'ACTIVE', '15', '', '', '', '', '', ''),
	(3, 'Vimbai Matenga', 'F', 'MARRIED', '+263775690935', 'vimbai.matenga@gmail.com', 'Harare', 'Harare', 'Harare', 'Southlands', 1, 1, 1, NULL, '<p>how much are contraceptive pills</p>', 1, '2021-11-17 12:21:01.501689', '2021-11-17 12:21:01.501689', 'ACTIVE', '33', 'From a Freind', NULL, 'CALL', '', '', '');
/*!40000 ALTER TABLE `inquiry` ENABLE KEYS */;

-- Dumping structure for table znfpc.permission
CREATE TABLE IF NOT EXISTS `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submoduleId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_240853a0c3353c25fb12434ad3` (`name`),
  KEY `FK_9167bdc5906fded3b425d43426d` (`submoduleId`),
  CONSTRAINT `FK_9167bdc5906fded3b425d43426d` FOREIGN KEY (`submoduleId`) REFERENCES `submodule` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

-- Dumping data for table znfpc.permission: ~56 rows (approximately)
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT IGNORE INTO `permission` (`id`, `submoduleId`, `name`, `created_at`, `updated_at`) VALUES
	(1, 1, 'CREATE_USER', '2021-11-01 14:24:43.337883', '2021-11-01 14:24:43.337883'),
	(3, 1, 'VIEW_USER', '2021-11-01 14:24:57.694219', '2021-11-01 14:24:57.694219'),
	(4, 1, 'VIEW_USERS', '2021-11-01 14:25:01.070964', '2021-11-01 14:25:01.070964'),
	(5, 1, 'UPDATE_USER', '2021-11-01 14:25:12.051762', '2021-11-01 14:25:12.051762'),
	(6, 1, 'DELETE_USER', '2021-11-01 14:25:21.004275', '2021-11-01 14:25:21.004275'),
	(7, 4, 'CREATE_ROLE', '2021-11-03 23:55:01.264720', '2021-11-03 23:55:01.264720'),
	(8, 4, 'GET_ROLES', '2021-11-03 23:55:18.392304', '2021-11-03 23:55:18.392304'),
	(9, 4, 'GET_ROLE', '2021-11-03 23:55:51.567829', '2021-11-03 23:55:51.567829'),
	(10, 4, 'UPDATE_ROLE', '2021-11-03 23:56:07.543881', '2021-11-03 23:56:07.543881'),
	(11, 4, 'DELETE_ROLE', '2021-11-03 23:56:27.328516', '2021-11-03 23:56:27.328516'),
	(13, 6, 'CREATE_SYSTEMMODULE', '2021-11-05 19:24:58.269985', '2021-11-05 19:24:58.269985'),
	(14, 6, 'GET_SYSTEMMODULES', '2021-11-05 19:25:22.743343', '2021-11-05 19:25:22.743343'),
	(15, 6, 'GET_SYSTEMMODULE', '2021-11-05 19:26:24.146859', '2021-11-05 19:26:24.146859'),
	(16, 6, 'UPDATE_SYSTEMMODULE', '2021-11-05 19:26:37.057262', '2021-11-05 19:26:37.057262'),
	(17, 6, 'DELETE_SYSTEMMODULE', '2021-11-05 19:26:48.253586', '2021-11-05 19:26:48.253586'),
	(18, 6, 'GET_ASSIGNED_SYSTEMMODULES', '2021-11-05 19:27:03.818056', '2021-11-05 19:27:03.818056'),
	(19, 8, 'CREATE_SUPPLIERTYPE', '2021-11-05 23:10:42.987766', '2021-11-05 23:10:42.987766'),
	(20, 8, 'GET_SUPPLIERTYPES', '2021-11-05 23:11:01.034228', '2021-11-05 23:11:01.034228'),
	(21, 8, 'UPDATE_SUPPLIERTYPE', '2021-11-05 23:11:30.523603', '2021-11-05 23:11:30.523603'),
	(22, 8, 'DELETE_SUPPLIERTYPE', '2021-11-05 23:11:49.082857', '2021-11-05 23:11:49.082857'),
	(23, 9, 'CREATE_SECTION', '2021-11-06 12:41:43.266192', '2021-11-06 12:41:43.266192'),
	(24, 9, 'GET_SECTION', '2021-11-06 12:41:58.653896', '2021-11-06 12:41:58.653896'),
	(25, 9, 'GET_SECTIONS', '2021-11-06 12:42:11.745442', '2021-11-06 12:42:11.745442'),
	(26, 9, 'UPDATE_SECTION', '2021-11-06 12:42:30.056215', '2021-11-06 12:42:30.056215'),
	(27, 9, 'DELETE_SECTION', '2021-11-06 12:42:58.603963', '2021-11-06 12:42:58.603963'),
	(28, 10, 'CREATE_CATEGORY', '2021-11-06 13:05:32.028640', '2021-11-06 13:05:32.028640'),
	(29, 10, 'GET_CATEGORIES', '2021-11-06 13:08:47.016055', '2021-11-06 13:08:47.016055'),
	(30, 10, 'GET_CATEGORY', '2021-11-06 13:09:05.096924', '2021-11-06 13:09:05.096924'),
	(31, 10, 'UPDATE_CATEGORY', '2021-11-06 13:09:30.922166', '2021-11-06 13:09:30.922166'),
	(32, 10, 'DELETE_CATEGORY', '2021-11-06 13:09:47.450494', '2021-11-06 13:09:47.450494'),
	(33, 8, 'CREATE_DOCUMENT', '2021-11-06 21:50:56.853440', '2021-11-06 21:50:56.853440'),
	(34, 8, 'GET_DOCUMENTS', '2021-11-06 21:51:27.872186', '2021-11-06 21:51:27.872186'),
	(35, 8, 'GET_DOCUMENT', '2021-11-06 21:51:48.520307', '2021-11-06 21:51:48.520307'),
	(36, 8, 'UPDATE_DOCUMENT', '2021-11-06 21:52:05.878938', '2021-11-06 21:52:05.878938'),
	(37, 8, 'DELETE_DOCUMENT', '2021-11-06 21:52:20.946245', '2021-11-06 21:52:20.946245'),
	(38, 11, 'CREATE_PERIOD', '2021-11-07 09:47:37.490541', '2021-11-07 09:47:37.490541'),
	(39, 11, 'GET_PERIODS', '2021-11-07 09:48:40.408310', '2021-11-07 09:48:40.408310'),
	(40, 11, 'GET_PERIOD', '2021-11-07 09:49:03.204700', '2021-11-07 09:49:03.204700'),
	(41, 11, 'UPDATE_PERIOD', '2021-11-07 09:49:22.379684', '2021-11-07 09:49:22.379684'),
	(61, 19, 'CREATE_SERVICE', '2021-11-14 14:07:04.700457', '2021-11-14 14:07:04.700457'),
	(62, 19, 'GET_SERVICES', '2021-11-14 14:07:15.382719', '2021-11-14 14:07:15.382719'),
	(63, 19, 'GET_SERVICE', '2021-11-14 14:07:27.421563', '2021-11-14 14:07:27.421563'),
	(64, 19, 'UPDATE_SERVICE', '2021-11-14 14:07:38.573564', '2021-11-14 14:07:38.573564'),
	(65, 19, 'DELETE_SERVICE', '2021-11-14 14:07:48.875703', '2021-11-14 14:07:48.875703'),
	(66, 19, 'CREATE_SERVICETYPE', '2021-11-14 14:09:26.351716', '2021-11-14 14:09:26.351716'),
	(67, 19, 'GET_SERVICETYPES', '2021-11-14 14:09:50.348526', '2021-11-14 14:09:50.348526'),
	(68, 19, 'GET_SERVICETYPE', '2021-11-14 14:10:02.899634', '2021-11-14 14:10:02.899634'),
	(69, 19, 'UPDATE_SERVICETYPE', '2021-11-14 14:10:11.332806', '2021-11-14 14:10:11.332806'),
	(70, 19, 'DELETE_SERVICETYPE', '2021-11-14 14:10:21.226575', '2021-11-14 14:10:21.226575'),
	(71, 19, 'CREATE_PRODUCT', '2021-11-14 14:10:40.988434', '2021-11-14 14:10:40.988434'),
	(72, 19, 'GET_PRODUCTS', '2021-11-14 14:10:50.608572', '2021-11-14 14:10:50.608572'),
	(73, 19, 'GET_PRODUCT', '2021-11-14 14:10:59.898723', '2021-11-14 14:10:59.898723'),
	(74, 19, 'UPDATE_PRODUCT', '2021-11-14 14:11:10.349074', '2021-11-14 14:11:10.349074'),
	(75, 19, 'DELETE_PRODUCT', '2021-11-14 14:11:19.580145', '2021-11-14 14:11:19.580145'),
	(76, 20, 'VIEW_REPORT_BY_AGENT', '2021-11-14 22:17:47.509426', '2021-11-14 22:19:04.000000'),
	(77, 21, 'VIEW_REPORT_BY_SERVICE', '2021-11-14 22:18:53.155731', '2021-11-14 22:18:53.155731');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;

-- Dumping structure for table znfpc.permission_roles
CREATE TABLE IF NOT EXISTS `permission_roles` (
  `permissionId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`permissionId`,`roleId`),
  KEY `IDX_86f6c7d1a377b78cef67a3c3d2` (`permissionId`),
  KEY `IDX_2ed76a7ef2fa565d019403a24f` (`roleId`),
  CONSTRAINT `FK_2ed76a7ef2fa565d019403a24f9` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_86f6c7d1a377b78cef67a3c3d23` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table znfpc.permission_roles: ~55 rows (approximately)
/*!40000 ALTER TABLE `permission_roles` DISABLE KEYS */;
INSERT IGNORE INTO `permission_roles` (`permissionId`, `roleId`) VALUES
	(1, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 1),
	(30, 1),
	(31, 1),
	(32, 1),
	(33, 1),
	(34, 1),
	(35, 1),
	(36, 1),
	(37, 1),
	(38, 1),
	(39, 1),
	(40, 1),
	(41, 1),
	(61, 1),
	(62, 1),
	(63, 1),
	(64, 1),
	(65, 1),
	(66, 1),
	(67, 1),
	(68, 1),
	(69, 1),
	(70, 1),
	(71, 1),
	(72, 1),
	(73, 1),
	(74, 1),
	(75, 1),
	(76, 1);
/*!40000 ALTER TABLE `permission_roles` ENABLE KEYS */;

-- Dumping structure for table znfpc.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `typeId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_53bafe3ecc25867776c07c9e666` (`typeId`),
  CONSTRAINT `FK_53bafe3ecc25867776c07c9e666` FOREIGN KEY (`typeId`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table znfpc.product: ~8 rows (approximately)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT IGNORE INTO `product` (`id`, `name`, `status`, `created_at`, `updated_at`, `typeId`) VALUES
	(1, 'Contraceptive', 'ACTIVE', '2021-11-14 15:09:29.113552', '2021-11-14 15:09:29.113552', 1),
	(2, 'IUCD', 'ACTIVE', '2021-11-14 15:11:22.845884', '2021-11-14 15:11:22.845884', 1),
	(3, ' Jadelle', 'ACTIVE', '2021-11-14 15:11:33.714652', '2021-11-14 15:11:33.714652', 1),
	(4, ' Implanon', 'ACTIVE', '2021-11-14 15:11:43.965229', '2021-11-14 15:11:43.965229', 1),
	(5, ' Orals', 'ACTIVE', '2021-11-14 15:11:54.043402', '2021-11-14 15:11:54.043402', 1),
	(6, 'Injectable (Sayana Press  or Depo Provera)', 'ACTIVE', '2021-11-14 15:12:02.810614', '2021-11-14 15:12:02.810614', 1),
	(7, 'Pap Smear', 'ACTIVE', '2021-11-14 15:13:02.531407', '2021-11-14 15:13:02.531407', 3),
	(8, 'VIAC', 'ACTIVE', '2021-11-14 15:13:18.122364', '2021-11-14 15:13:18.122364', 3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table znfpc.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_ae4578dcaed5adff96595e6166` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table znfpc.role: ~3 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT IGNORE INTO `role` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Administrator', '2021-10-31 00:23:54.303359', '2021-10-31 00:23:54.303359'),
	(7, 'Managers', '2021-10-31 00:27:23.910461', '2021-11-14 04:53:28.000000'),
	(14, 'Agents', '2021-11-14 04:53:50.640104', '2021-11-14 04:53:50.640104');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table znfpc.service
CREATE TABLE IF NOT EXISTS `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `status` varchar(255) NOT NULL DEFAULT 'ACTIVE',
  `administratorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_11a85f4eb5944cace329320e539` (`administratorId`),
  CONSTRAINT `FK_11a85f4eb5944cace329320e539` FOREIGN KEY (`administratorId`) REFERENCES `administrator` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table znfpc.service: ~4 rows (approximately)
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT IGNORE INTO `service` (`id`, `name`, `created_at`, `updated_at`, `status`, `administratorId`) VALUES
	(1, 'Service Delivery', '2021-11-14 14:21:15.055049', '2021-11-14 14:26:59.000000', 'ACTIVE', NULL),
	(2, 'ASRH ', '2021-11-14 15:15:33.740250', '2021-11-14 15:15:33.740250', 'ACTIVE', NULL),
	(3, 'Training', '2021-11-14 15:16:02.232462', '2021-11-14 15:16:02.232462', 'ACTIVE', NULL),
	(4, 'Catering and Accomodation', '2021-11-14 15:17:03.097267', '2021-11-14 15:17:03.097267', 'ACTIVE', NULL);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;

-- Dumping structure for table znfpc.submodule
CREATE TABLE IF NOT EXISTS `submodule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systemmoduleId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_e78a0a2cd96c2a052baac4902d` (`url`),
  KEY `FK_19c28ccd9a9c271d7b5d7d95ef8` (`systemmoduleId`),
  CONSTRAINT `FK_19c28ccd9a9c271d7b5d7d95ef8` FOREIGN KEY (`systemmoduleId`) REFERENCES `system_module` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Dumping data for table znfpc.submodule: ~11 rows (approximately)
/*!40000 ALTER TABLE `submodule` DISABLE KEYS */;
INSERT IGNORE INTO `submodule` (`id`, `systemmoduleId`, `name`, `icon`, `url`, `created_at`, `updated_at`) VALUES
	(1, 1, 'User Management', 'mdi-account-cog', 'Administrators', '2021-10-31 22:36:18.868061', '2021-10-31 22:36:18.868061'),
	(4, 1, 'User Roles', 'mdi-account-key', 'Roles', '2021-10-31 22:39:42.060470', '2021-11-03 17:04:30.175673'),
	(6, 1, 'System Modules', 'mdi-link-box', 'systemmodules', '2021-11-03 16:58:44.777993', '2021-11-03 17:04:30.221182'),
	(8, 2, 'Supplier Types', 'mdi-account-network', 'Suppliertype', '2021-11-05 23:10:09.026198', '2021-11-05 23:10:09.026198'),
	(9, 2, 'Supplier Sections', 'mdi-set-none', 'sections', '2021-11-06 12:41:30.563906', '2021-11-06 12:41:30.563906'),
	(10, 2, 'Supplier Categories', 'mdi-shape-square-plus', 'category', '2021-11-06 13:05:17.248687', '2021-11-06 13:05:17.248687'),
	(11, 2, 'Registration Periods', 'mdi-shape-circle-plus', 'registrationperiods', '2021-11-07 09:47:07.376098', '2021-11-07 09:47:07.376098'),
	(19, 6, 'Services', 'mdi-cogs', 'service', '2021-11-14 14:06:29.414923', '2021-11-14 14:06:29.414923'),
	(20, 7, 'By Agent', 'mdi-account', 'report-by-agent', '2021-11-14 22:17:32.027244', '2021-11-14 22:22:21.000000'),
	(21, 7, 'By Service', 'mdi-file-multiple-outline', 'report-by-service', '2021-11-14 22:18:27.117383', '2021-11-14 22:22:43.000000'),
	(22, 7, 'Overall Report', 'mdi-chart-box', 'report', '2021-11-15 23:00:29.262229', '2021-11-15 23:00:29.262229');
/*!40000 ALTER TABLE `submodule` ENABLE KEYS */;

-- Dumping structure for table znfpc.submodules_roles
CREATE TABLE IF NOT EXISTS `submodules_roles` (
  `submoduleId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`submoduleId`,`roleId`),
  KEY `IDX_b0a7dce5d6395e653f1aff7915` (`submoduleId`),
  KEY `IDX_178feca92dd29f4209d78a940f` (`roleId`),
  CONSTRAINT `FK_178feca92dd29f4209d78a940f3` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_b0a7dce5d6395e653f1aff79152` FOREIGN KEY (`submoduleId`) REFERENCES `submodule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table znfpc.submodules_roles: ~11 rows (approximately)
/*!40000 ALTER TABLE `submodules_roles` DISABLE KEYS */;
INSERT IGNORE INTO `submodules_roles` (`submoduleId`, `roleId`) VALUES
	(1, 1),
	(1, 7),
	(4, 1),
	(6, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1);
/*!40000 ALTER TABLE `submodules_roles` ENABLE KEYS */;

-- Dumping structure for table znfpc.systemmodules_roles
CREATE TABLE IF NOT EXISTS `systemmodules_roles` (
  `systemmoduleId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`systemmoduleId`,`roleId`),
  KEY `IDX_be5ad3fb9750c1d58e7a241210` (`systemmoduleId`),
  KEY `IDX_f736135de8ef34e83e90eb6b26` (`roleId`),
  CONSTRAINT `FK_be5ad3fb9750c1d58e7a2412105` FOREIGN KEY (`systemmoduleId`) REFERENCES `system_module` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_f736135de8ef34e83e90eb6b26f` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table znfpc.systemmodules_roles: ~3 rows (approximately)
/*!40000 ALTER TABLE `systemmodules_roles` DISABLE KEYS */;
INSERT IGNORE INTO `systemmodules_roles` (`systemmoduleId`, `roleId`) VALUES
	(1, 1),
	(6, 1),
	(7, 1);
/*!40000 ALTER TABLE `systemmodules_roles` ENABLE KEYS */;

-- Dumping structure for table znfpc.system_module
CREATE TABLE IF NOT EXISTS `system_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `widget` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'PENDING',
  `description` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table znfpc.system_module: ~4 rows (approximately)
/*!40000 ALTER TABLE `system_module` DISABLE KEYS */;
INSERT IGNORE INTO `system_module` (`id`, `name`, `icon`, `widget`, `status`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'System Settings', 'mdi-account-cog', 'WGTSYSTEMSETTINGS', 'PENDING', 'test', '2021-10-31 14:37:26.959929', '2021-10-31 14:37:26.959929'),
	(2, 'Supplier Settings', 'mdi-account-cog', 'WGTSYPPLIERSETTINGS', 'PENDING', 'TEST', '2021-11-01 10:51:57.702841', '2021-11-03 18:05:10.521608'),
	(6, 'Service Settings', 'mdi-cogs', 'SERVICE_SETTINGS', 'PENDING', 'This is a service serttings module', '2021-11-14 14:05:01.369103', '2021-11-14 14:05:01.369103'),
	(7, 'Reports', 'mdi-chart-bar', 'REPORTS', 'PENDING', 'This Module Shows Reports', '2021-11-14 22:16:48.017755', '2021-11-14 22:16:48.017755');
/*!40000 ALTER TABLE `system_module` ENABLE KEYS */;

-- Dumping structure for table znfpc.type
CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `serviceId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ca8293224846ed75b9a7b5ca816` (`serviceId`),
  CONSTRAINT `FK_ca8293224846ed75b9a7b5ca816` FOREIGN KEY (`serviceId`) REFERENCES `service` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table znfpc.type: ~7 rows (approximately)
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT IGNORE INTO `type` (`id`, `name`, `status`, `created_at`, `updated_at`, `serviceId`) VALUES
	(1, 'Family Planning', 'ACTIVE', '2021-11-14 14:29:15.611740', '2021-11-14 14:29:15.611740', 1),
	(2, 'HTS', 'ACTIVE', '2021-11-14 14:34:27.986575', '2021-11-14 14:34:27.986575', 1),
	(3, 'Cancer Screening', 'ACTIVE', '2021-11-14 14:34:52.935306', '2021-11-14 14:34:52.935306', 1),
	(4, 'VMMC', 'ACTIVE', '2021-11-14 14:35:42.141941', '2021-11-14 14:35:42.141941', 1),
	(5, 'Fertility Services', 'ACTIVE', '2021-11-14 14:35:56.856681', '2021-11-14 14:35:56.856681', 1),
	(6, 'FP Course', 'ACTIVE', '2021-11-14 15:16:17.550770', '2021-11-14 15:16:17.550770', 3),
	(7, 'ARSH Course', 'ACTIVE', '2021-11-14 15:16:27.205688', '2021-11-14 15:16:27.205688', 3);
/*!40000 ALTER TABLE `type` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
