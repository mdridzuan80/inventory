/*
Navicat MySQL Data Transfer

Source Server         : 172.16.25.40
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : jpv_inventori

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-12-30 16:38:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `dvs_dict_department`
-- ----------------------------
DROP TABLE IF EXISTS `dvs_dict_department`;
CREATE TABLE `dvs_dict_department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dvs_dict_department
-- ----------------------------
INSERT INTO `dvs_dict_department` VALUES ('1', 'MELAKA TENGAH');
INSERT INTO `dvs_dict_department` VALUES ('2', 'ALOR GAJAH');
INSERT INTO `dvs_dict_department` VALUES ('3', 'MASJID TANAH');
INSERT INTO `dvs_dict_department` VALUES ('4', 'JASIN');
INSERT INTO `dvs_dict_department` VALUES ('5', 'MERLIMAU');

-- ----------------------------
-- Table structure for `dvs_dict_transaction`
-- ----------------------------
DROP TABLE IF EXISTS `dvs_dict_transaction`;
CREATE TABLE `dvs_dict_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dvs_dict_transaction
-- ----------------------------
INSERT INTO `dvs_dict_transaction` VALUES ('1', 'IN');
INSERT INTO `dvs_dict_transaction` VALUES ('2', 'OUT');
INSERT INTO `dvs_dict_transaction` VALUES ('3', 'TRANSFER');

-- ----------------------------
-- Table structure for `dvs_items`
-- ----------------------------
DROP TABLE IF EXISTS `dvs_items`;
CREATE TABLE `dvs_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `keterangan` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dvs_items
-- ----------------------------
INSERT INTO `dvs_items` VALUES ('1', 'Xylazine Inj (20ml)', null);
INSERT INTO `dvs_items` VALUES ('2', 'Xylazine Inj (50ml)', null);
INSERT INTO `dvs_items` VALUES ('3', 'Ketamine Inj', null);
INSERT INTO `dvs_items` VALUES ('4', 'Atropine Sulphate Inj.', null);
INSERT INTO `dvs_items` VALUES ('5', 'Lignocaine inj', null);
INSERT INTO `dvs_items` VALUES ('6', 'Diazepam Tablet (1mg and 2mg)', null);
INSERT INTO `dvs_items` VALUES ('7', 'Diazepam Injection', null);
INSERT INTO `dvs_items` VALUES ('8', 'Tramadol Tablet (1.8mg)', null);
INSERT INTO `dvs_items` VALUES ('9', 'Prazosin tablet (1.0mg)', null);
INSERT INTO `dvs_items` VALUES ('10', 'Dolethol Inj', null);
INSERT INTO `dvs_items` VALUES ('11', 'Calmivet Inj', null);

-- ----------------------------
-- Table structure for `dvs_journal`
-- ----------------------------
DROP TABLE IF EXISTS `dvs_journal`;
CREATE TABLE `dvs_journal` (
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

-- ----------------------------
-- Records of dvs_journal
-- ----------------------------

-- ----------------------------
-- Table structure for `dvs_users`
-- ----------------------------
DROP TABLE IF EXISTS `dvs_users`;
CREATE TABLE `dvs_users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `dept_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dvs_users
-- ----------------------------
INSERT INTO `dvs_users` VALUES ('administrator', 'abc123', '1', '1');

-- ----------------------------
-- View structure for `view_stock`
-- ----------------------------
DROP VIEW IF EXISTS `view_stock`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_stock` AS select `dvs_journal`.`id` AS `id`,`dvs_journal`.`item_id` AS `item_id`,`dvs_journal`.`dept_id` AS `dept_id`,`dvs_journal`.`batch` AS `batch`,`dvs_journal`.`transaction_id` AS `transaction_id`,`dvs_journal`.`total` AS `total`,`dvs_journal`.`tarikh` AS `tarikh`,`dvs_journal`.`fromto` AS `fromto`,`dvs_journal`.`catatan` AS `catatan` from `dvs_journal` where ((1 = 1) and (`dvs_journal`.`transaction_id` = 1)) union select `dvs_journal`.`id` AS `id`,`dvs_journal`.`item_id` AS `item_id`,`dvs_journal`.`dept_id` AS `dept_id`,`dvs_journal`.`batch` AS `batch`,`dvs_journal`.`transaction_id` AS `transaction_id`,(sum(`dvs_journal`.`total`) * -(1)) AS `total`,`dvs_journal`.`tarikh` AS `tarikh`,`dvs_journal`.`fromto` AS `fromto`,`dvs_journal`.`catatan` AS `catatan` from `dvs_journal` where ((1 = 1) and (`dvs_journal`.`transaction_id` <> 1)) group by `dvs_journal`.`id`,`dvs_journal`.`item_id`,`dvs_journal`.`dept_id`,`dvs_journal`.`batch`,`dvs_journal`.`transaction_id`,`dvs_journal`.`tarikh`,`dvs_journal`.`catatan` ;

-- ----------------------------
-- View structure for `view_transaksi`
-- ----------------------------
DROP VIEW IF EXISTS `view_transaksi`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_transaksi` AS select `dvs_dict_transaction`.`nama` AS `transaksi`,`view_stock`.`total` AS `total`,`view_stock`.`tarikh` AS `tarikh`,`dvs_dict)department1`.`nama` AS `fromto`,`view_stock`.`catatan` AS `catatan`,`view_stock`.`item_id` AS `item_id`,`view_stock`.`dept_id` AS `dept_id` from ((`view_stock` join `dvs_dict_transaction` on((`dvs_dict_transaction`.`id` = `view_stock`.`transaction_id`))) left join `dvs_dict_department` `dvs_dict)department1` on((`view_stock`.`fromto` = `dvs_dict)department1`.`id`))) ;
