-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.20-MariaDB - MariaDB Server
-- Server OS:                    Linux
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for inv_db
DROP DATABASE IF EXISTS `inv_db`;
CREATE DATABASE IF NOT EXISTS `inv_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `inv_db`;


-- Dumping structure for table inv_db.dvs_dict_department
DROP TABLE IF EXISTS `dvs_dict_department`;
CREATE TABLE IF NOT EXISTS `dvs_dict_department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table inv_db.dvs_dict_department: ~5 rows (approximately)
/*!40000 ALTER TABLE `dvs_dict_department` DISABLE KEYS */;
REPLACE INTO `dvs_dict_department` (`id`, `nama`) VALUES
	(1, 'MELAKA TENGAH'),
	(2, 'ALOR GAJAH'),
	(3, 'MASJID TANAH'),
	(4, 'JASIN'),
	(5, 'MERLIMAU');
/*!40000 ALTER TABLE `dvs_dict_department` ENABLE KEYS */;


-- Dumping structure for table inv_db.dvs_dict_transaction
DROP TABLE IF EXISTS `dvs_dict_transaction`;
CREATE TABLE IF NOT EXISTS `dvs_dict_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table inv_db.dvs_dict_transaction: ~3 rows (approximately)
/*!40000 ALTER TABLE `dvs_dict_transaction` DISABLE KEYS */;
REPLACE INTO `dvs_dict_transaction` (`id`, `nama`) VALUES
	(1, 'IN'),
	(2, 'OUT'),
	(3, 'TRANSFER');
/*!40000 ALTER TABLE `dvs_dict_transaction` ENABLE KEYS */;


-- Dumping structure for table inv_db.dvs_items
DROP TABLE IF EXISTS `dvs_items`;
CREATE TABLE IF NOT EXISTS `dvs_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `keterangan` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table inv_db.dvs_items: ~11 rows (approximately)
/*!40000 ALTER TABLE `dvs_items` DISABLE KEYS */;
REPLACE INTO `dvs_items` (`id`, `nama`, `keterangan`) VALUES
	(1, 'Xylazine Inj (20ml)', NULL),
	(2, 'Xylazine Inj (50ml)', NULL),
	(3, 'Ketamine Inj', NULL),
	(4, 'Atropine Sulphate Inj.', NULL),
	(5, 'Lignocaine inj', NULL),
	(6, 'Diazepam Tablet (1mg and 2mg)', NULL),
	(7, 'Diazepam Injection', NULL),
	(8, 'Tramadol Tablet (1.8mg)', NULL),
	(9, 'Prazosin tablet (1.0mg)', NULL),
	(10, 'Dolethol Inj', NULL),
	(11, 'Calmivet Inj', NULL);
/*!40000 ALTER TABLE `dvs_items` ENABLE KEYS */;


-- Dumping structure for table inv_db.dvs_journal
DROP TABLE IF EXISTS `dvs_journal`;
CREATE TABLE IF NOT EXISTS `dvs_journal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `dept_id` int(10) unsigned NOT NULL,
  `batch` varchar(255) DEFAULT NULL,
  `transaction_id` int(10) unsigned NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `tarikh` datetime NOT NULL,
  `catatan` text NOT NULL,
  `fromto` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table inv_db.dvs_journal: ~0 rows (approximately)
/*!40000 ALTER TABLE `dvs_journal` DISABLE KEYS */;
/*!40000 ALTER TABLE `dvs_journal` ENABLE KEYS */;


-- Dumping structure for table inv_db.dvs_users
DROP TABLE IF EXISTS `dvs_users`;
CREATE TABLE IF NOT EXISTS `dvs_users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `dept_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table inv_db.dvs_users: ~1 rows (approximately)
/*!40000 ALTER TABLE `dvs_users` DISABLE KEYS */;
REPLACE INTO `dvs_users` (`username`, `password`, `role_id`, `dept_id`) VALUES
	('administrator', 'abc123', 1, 1);
/*!40000 ALTER TABLE `dvs_users` ENABLE KEYS */;


-- Dumping structure for table inv_db.dvs_user_roles
DROP TABLE IF EXISTS `dvs_user_roles`;
CREATE TABLE IF NOT EXISTS `dvs_user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL DEFAULT '0',
  `role` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table inv_db.dvs_user_roles: ~1 rows (approximately)
/*!40000 ALTER TABLE `dvs_user_roles` DISABLE KEYS */;
REPLACE INTO `dvs_user_roles` (`id`, `user_id`, `role`) VALUES
	(1, 'administrator', 'admin');
/*!40000 ALTER TABLE `dvs_user_roles` ENABLE KEYS */;


-- Dumping structure for view inv_db.view_stock
DROP VIEW IF EXISTS `view_stock`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_stock` (
	`id` INT(11) UNSIGNED NOT NULL,
	`item_id` INT(11) UNSIGNED NOT NULL,
	`dept_id` INT(11) UNSIGNED NOT NULL,
	`batch` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`transaction_id` INT(11) UNSIGNED NOT NULL,
	`total` DECIMAL(33,0) NULL,
	`tarikh` DATETIME NOT NULL,
	`fromto` INT(11) UNSIGNED NOT NULL,
	`catatan` TEXT NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view inv_db.view_transaksi
DROP VIEW IF EXISTS `view_transaksi`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_transaksi` (
	`transaksi` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`total` DECIMAL(33,0) NULL,
	`tarikh` DATETIME NOT NULL,
	`fromto` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`catatan` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`item_id` INT(11) UNSIGNED NOT NULL,
	`dept_id` INT(11) UNSIGNED NOT NULL
) ENGINE=MyISAM;


-- Dumping structure for view inv_db.view_stock
DROP VIEW IF EXISTS `view_stock`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_stock`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_stock` AS select `dvs_journal`.`id` AS `id`,`dvs_journal`.`item_id` AS `item_id`,`dvs_journal`.`dept_id` AS `dept_id`,`dvs_journal`.`batch` AS `batch`,`dvs_journal`.`transaction_id` AS `transaction_id`,`dvs_journal`.`total` AS `total`,`dvs_journal`.`tarikh` AS `tarikh`,`dvs_journal`.`fromto` AS `fromto`,`dvs_journal`.`catatan` AS `catatan` from `dvs_journal` where ((1 = 1) and (`dvs_journal`.`transaction_id` = 1)) union select `dvs_journal`.`id` AS `id`,`dvs_journal`.`item_id` AS `item_id`,`dvs_journal`.`dept_id` AS `dept_id`,`dvs_journal`.`batch` AS `batch`,`dvs_journal`.`transaction_id` AS `transaction_id`,(sum(`dvs_journal`.`total`) * -(1)) AS `total`,`dvs_journal`.`tarikh` AS `tarikh`,`dvs_journal`.`fromto` AS `fromto`,`dvs_journal`.`catatan` AS `catatan` from `dvs_journal` where ((1 = 1) and (`dvs_journal`.`transaction_id` <> 1)) group by `dvs_journal`.`id`,`dvs_journal`.`item_id`,`dvs_journal`.`dept_id`,`dvs_journal`.`batch`,`dvs_journal`.`transaction_id`,`dvs_journal`.`tarikh`,`dvs_journal`.`catatan`;


-- Dumping structure for view inv_db.view_transaksi
DROP VIEW IF EXISTS `view_transaksi`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_transaksi`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_transaksi` AS select `dvs_dict_transaction`.`nama` AS `transaksi`,`view_stock`.`total` AS `total`,`view_stock`.`tarikh` AS `tarikh`,`dvs_dict)department1`.`nama` AS `fromto`,`view_stock`.`catatan` AS `catatan`,`view_stock`.`item_id` AS `item_id`,`view_stock`.`dept_id` AS `dept_id` from ((`view_stock` join `dvs_dict_transaction` on((`dvs_dict_transaction`.`id` = `view_stock`.`transaction_id`))) left join `dvs_dict_department` `dvs_dict)department1` on((`view_stock`.`fromto` = `dvs_dict)department1`.`id`)));
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
