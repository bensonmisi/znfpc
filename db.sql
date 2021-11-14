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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

-- Dumping data for table znfpc.permission: ~58 rows (approximately)
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
	(42, 12, 'CREATE_REGFEE', '2021-11-08 03:57:43.910091', '2021-11-08 03:57:43.910091'),
	(43, 12, 'GET_REGFEES', '2021-11-08 03:57:55.196344', '2021-11-08 03:57:55.196344'),
	(44, 12, 'GET_REGFEE', '2021-11-08 03:58:04.884146', '2021-11-08 03:58:04.884146'),
	(45, 12, 'UPDATE_REGFEE', '2021-11-08 03:58:15.185371', '2021-11-08 03:58:15.185371'),
	(46, 12, 'DELETE_REGFEE', '2021-11-08 03:58:26.813130', '2021-11-08 03:58:26.813130'),
	(47, 13, 'CREATE_CURRENCY', '2021-11-08 04:05:10.488781', '2021-11-08 04:05:10.488781'),
	(48, 13, 'UPDATE_CURRENCY', '2021-11-08 04:05:22.576777', '2021-11-08 04:05:22.576777'),
	(49, 13, 'GET_CURRENCIES', '2021-11-08 04:05:34.323292', '2021-11-08 04:05:34.323292'),
	(50, 13, 'GET_CURRENCY', '2021-11-08 04:05:43.954255', '2021-11-08 04:05:43.954255'),
	(51, 13, 'DELETE_CURRENCY', '2021-11-08 04:05:57.622117', '2021-11-08 04:05:57.622117'),
	(52, 14, 'CREATE_RATE', '2021-11-08 04:08:43.871791', '2021-11-08 04:08:43.871791'),
	(53, 14, 'UPDATE_RATE', '2021-11-08 04:09:21.735245', '2021-11-08 04:09:21.735245'),
	(54, 14, 'GET_RATES', '2021-11-08 04:09:31.948988', '2021-11-08 04:09:31.948988'),
	(55, 14, 'GET_RATE', '2021-11-08 04:09:39.448109', '2021-11-08 04:09:39.448109'),
	(56, 14, 'DELETE_RATE', '2021-11-08 04:09:48.964758', '2021-11-08 04:09:48.964758'),
	(57, 15, 'CREATE_TRANSACTION', '2021-11-09 21:42:16.018009', '2021-11-09 21:42:16.018009'),
	(58, 15, 'GET_TRANSACTIONS', '2021-11-09 21:42:46.594772', '2021-11-09 21:42:46.594772'),
	(59, 15, 'GET_TRANSACTION', '2021-11-09 21:42:57.709495', '2021-11-09 21:42:57.709495'),
	(60, 15, 'FILTER_TRANSACTIONS', '2021-11-09 21:49:33.679884', '2021-11-09 21:49:33.679884');
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

-- Dumping data for table znfpc.permission_roles: ~48 rows (approximately)
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
	(47, 1),
	(48, 1),
	(49, 1),
	(50, 1),
	(51, 1),
	(57, 1),
	(58, 1),
	(59, 1),
	(60, 1);
/*!40000 ALTER TABLE `permission_roles` ENABLE KEYS */;

-- Dumping structure for table znfpc.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_ae4578dcaed5adff96595e6166` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table znfpc.role: ~7 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT IGNORE INTO `role` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Administrator', '2021-10-31 00:23:54.303359', '2021-10-31 00:23:54.303359'),
	(7, 'Finance Manager', '2021-10-31 00:27:23.910461', '2021-10-31 00:27:23.910461'),
	(8, 'Finance Officer', '2021-10-31 00:27:33.527027', '2021-10-31 00:27:33.527027'),
	(9, 'Help Desk', '2021-10-31 00:27:49.240649', '2021-10-31 00:27:49.240649'),
	(10, 'Procurement Specialist', '2021-11-05 16:54:01.223171', '2021-11-05 17:00:08.000000'),
	(12, 'BIDDER', '2021-11-05 19:28:51.261147', '2021-11-05 19:28:51.261147'),
	(13, 'PMU-OFFICER', '2021-11-05 19:29:16.353259', '2021-11-05 19:29:16.353259');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dumping data for table znfpc.submodule: ~14 rows (approximately)
/*!40000 ALTER TABLE `submodule` DISABLE KEYS */;
INSERT IGNORE INTO `submodule` (`id`, `systemmoduleId`, `name`, `icon`, `url`, `created_at`, `updated_at`) VALUES
	(1, 1, 'User Management', 'mdi-account-cog', 'Administrators', '2021-10-31 22:36:18.868061', '2021-10-31 22:36:18.868061'),
	(4, 1, 'User Roles', 'mdi-account-key', 'Roles', '2021-10-31 22:39:42.060470', '2021-11-03 17:04:30.175673'),
	(6, 1, 'System Modules', 'mdi-link-box', 'systemmodules', '2021-11-03 16:58:44.777993', '2021-11-03 17:04:30.221182'),
	(8, 2, 'Supplier Types', 'mdi-account-network', 'Suppliertype', '2021-11-05 23:10:09.026198', '2021-11-05 23:10:09.026198'),
	(9, 2, 'Supplier Sections', 'mdi-set-none', 'sections', '2021-11-06 12:41:30.563906', '2021-11-06 12:41:30.563906'),
	(10, 2, 'Supplier Categories', 'mdi-shape-square-plus', 'category', '2021-11-06 13:05:17.248687', '2021-11-06 13:05:17.248687'),
	(11, 2, 'Registration Periods', 'mdi-shape-circle-plus', 'registrationperiods', '2021-11-07 09:47:07.376098', '2021-11-07 09:47:07.376098'),
	(12, 3, 'Registration Fees', 'mdi-account-cash', 'registrationfees', '2021-11-08 03:57:27.258892', '2021-11-08 23:29:18.027326'),
	(13, 3, 'Currency', 'mdi-cash-plus', 'currency', '2021-11-08 04:04:57.598192', '2021-11-08 04:04:57.598192'),
	(14, 3, 'Exchange Rate', 'mdi-cash-refund', 'exchangerates', '2021-11-08 04:07:35.226204', '2021-11-08 04:07:35.226204'),
	(15, 4, 'Bank API', 'mdi-bank', 'bankapi', '2021-11-09 21:41:42.623254', '2021-11-09 21:41:42.623254'),
	(16, 5, 'Accounts', 'mdi-account-multiple-check', 'supplieraccounts', '2021-11-09 21:57:36.667170', '2021-11-09 21:57:36.667170'),
	(17, 5, 'Pending Approval', 'mdi-account-clock', 'supplierpending', '2021-11-09 21:59:05.020367', '2021-11-09 21:59:05.020367'),
	(18, 5, 'Approved Report', 'mdi-account-check', 'supplierapproved', '2021-11-09 22:00:47.371061', '2021-11-09 22:00:47.371061');
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

-- Dumping data for table znfpc.submodules_roles: ~15 rows (approximately)
/*!40000 ALTER TABLE `submodules_roles` DISABLE KEYS */;
INSERT IGNORE INTO `submodules_roles` (`submoduleId`, `roleId`) VALUES
	(1, 1),
	(1, 7),
	(4, 1),
	(6, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1);
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

-- Dumping data for table znfpc.systemmodules_roles: ~6 rows (approximately)
/*!40000 ALTER TABLE `systemmodules_roles` DISABLE KEYS */;
INSERT IGNORE INTO `systemmodules_roles` (`systemmoduleId`, `roleId`) VALUES
	(1, 1),
	(1, 7),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table znfpc.system_module: ~5 rows (approximately)
/*!40000 ALTER TABLE `system_module` DISABLE KEYS */;
INSERT IGNORE INTO `system_module` (`id`, `name`, `icon`, `widget`, `status`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'System Settings', 'mdi-account-cog', 'WGTSYSTEMSETTINGS', 'PENDING', 'test', '2021-10-31 14:37:26.959929', '2021-10-31 14:37:26.959929'),
	(2, 'Supplier Settings', 'mdi-account-cog', 'WGTSYPPLIERSETTINGS', 'PENDING', 'TEST', '2021-11-01 10:51:57.702841', '2021-11-03 18:05:10.521608'),
	(3, 'Finance Settings', 'mdi-cash-lock', 'FINANCESETTINGS', 'PENDING', 'This module sets the currencies and the exchange rates to be used through out the system', '2021-11-08 04:04:22.691260', '2021-11-08 04:04:22.691260'),
	(4, 'Finance', 'mdi-cash-multiple', 'FINANCE_WIDGET', 'PENDING', 'The module shows allow finance issues', '2021-11-09 21:40:41.667258', '2021-11-09 21:40:41.667258'),
	(5, 'Suppliers', 'mdi-account-voice', 'SUPPLIERS_WIDGET', 'PENDING', 'This module manages all suppliers in the system', '2021-11-09 21:55:51.938317', '2021-11-09 21:55:51.938317');
/*!40000 ALTER TABLE `system_module` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
