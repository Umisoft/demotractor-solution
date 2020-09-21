-- Adminer 4.7.7 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `cms3_apiship_orders`;
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


DROP TABLE IF EXISTS `cms3_appointment_employees`;
CREATE TABLE `cms3_appointment_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_appointment_employees_services`;
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


DROP TABLE IF EXISTS `cms3_appointment_employee_schedule`;
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


DROP TABLE IF EXISTS `cms3_appointment_orders`;
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
  `comment` mediumtext DEFAULT NULL,
  `status_id` enum('1','2','3') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_appointment_services`;
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


DROP TABLE IF EXISTS `cms3_appointment_service_groups`;
CREATE TABLE `cms3_appointment_service_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_cluster_nodes`;
CREATE TABLE `cms3_cluster_nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_ip` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `node_id` (`id`),
  KEY `node_ip` (`node_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_cluster_nodes_cache_keys`;
CREATE TABLE `cms3_cluster_nodes_cache_keys` (
  `node_id` int(11) DEFAULT NULL,
  `key` varchar(255) NOT NULL DEFAULT '',
  KEY `node_id` (`node_id`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_data_cache`;
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


DROP TABLE IF EXISTS `cms3_domains`;
CREATE TABLE `cms3_domains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host` varchar(64) NOT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `default_lang_id` int(10) unsigned DEFAULT NULL,
  `use_ssl` tinyint(1) DEFAULT NULL,
  `favicon` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `host` (`host`),
  KEY `Domain to default language relation_FK` (`default_lang_id`),
  CONSTRAINT `FK_Domain to default language relation` FOREIGN KEY (`default_lang_id`) REFERENCES `cms3_langs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_domain_mirrows`;
CREATE TABLE `cms3_domain_mirrows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host` varchar(64) DEFAULT NULL,
  `rel` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `host` (`host`),
  KEY `Domain to mirrows relation_FK` (`rel`),
  CONSTRAINT `FK_Domain to mirrows relation` FOREIGN KEY (`rel`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_emarket_top`;
CREATE TABLE `cms3_emarket_top` (
  `id` int(11) NOT NULL,
  `date` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `total_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_fields_controller`;
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


DROP TABLE IF EXISTS `cms3_filter_index_52_pages_4`;
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
  `nalichie_budilnika` tinyint(1) DEFAULT 0,
  `naznachenie` varchar(255) DEFAULT NULL,
  `novoe_pole` varchar(255) DEFAULT NULL,
  `obem_upakovki` double DEFAULT NULL,
  `price` double DEFAULT 0,
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


DROP TABLE IF EXISTS `cms3_filter_index_56_pages_1161`;
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
  `nalichie_budilnika` tinyint(1) DEFAULT 0,
  `novoe_pole` varchar(255) DEFAULT NULL,
  `price` double DEFAULT 0,
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


DROP TABLE IF EXISTS `cms3_filter_index_56_pages_228`;
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
  `nalichie_budilnika` tinyint(1) DEFAULT 0,
  `naznachenie` varchar(255) DEFAULT NULL,
  `novoe_pole` varchar(255) DEFAULT NULL,
  `obem_upakovki` double DEFAULT NULL,
  `price` double DEFAULT 0,
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


DROP TABLE IF EXISTS `cms3_filter_index_56_pages_539`;
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
  `nalichie_budilnika` tinyint(1) DEFAULT 0,
  `novoe_pole` varchar(255) DEFAULT NULL,
  `price` double DEFAULT 0,
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


DROP TABLE IF EXISTS `cms3_filter_index_56_pages_850`;
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
  `nalichie_budilnika` tinyint(1) DEFAULT 0,
  `novoe_pole` varchar(255) DEFAULT NULL,
  `price` double DEFAULT 0,
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


DROP TABLE IF EXISTS `cms3_hierarchy`;
CREATE TABLE `cms3_hierarchy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rel` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `lang_id` int(10) unsigned NOT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  `obj_id` int(10) unsigned NOT NULL,
  `ord` int(11) DEFAULT 0,
  `tpl_id` int(10) unsigned DEFAULT NULL,
  `alt_name` varchar(128) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `is_visible` tinyint(1) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_hierarchy_relations`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_hierarchy_types`;
CREATE TABLE `cms3_hierarchy_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(48) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ext` varchar(48) DEFAULT NULL,
  `hide_pages` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`ext`),
  KEY `title` (`title`),
  KEY `ext` (`ext`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_import_apiship_orders`;
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


DROP TABLE IF EXISTS `cms3_import_appointment_employees`;
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


DROP TABLE IF EXISTS `cms3_import_appointment_employees_services`;
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


DROP TABLE IF EXISTS `cms3_import_appointment_employee_schedule`;
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


DROP TABLE IF EXISTS `cms3_import_appointment_orders`;
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


DROP TABLE IF EXISTS `cms3_import_appointment_services`;
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


DROP TABLE IF EXISTS `cms3_import_appointment_service_groups`;
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


DROP TABLE IF EXISTS `cms3_import_domains`;
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


DROP TABLE IF EXISTS `cms3_import_domain_mirrors`;
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


DROP TABLE IF EXISTS `cms3_import_fields`;
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


DROP TABLE IF EXISTS `cms3_import_groups`;
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


DROP TABLE IF EXISTS `cms3_import_langs`;
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


DROP TABLE IF EXISTS `cms3_import_links`;
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


DROP TABLE IF EXISTS `cms3_import_links_sources`;
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


DROP TABLE IF EXISTS `cms3_import_mail_notifications`;
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


DROP TABLE IF EXISTS `cms3_import_mail_templates`;
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


DROP TABLE IF EXISTS `cms3_import_mail_variables`;
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


DROP TABLE IF EXISTS `cms3_import_objects`;
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


DROP TABLE IF EXISTS `cms3_import_offer_list`;
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


DROP TABLE IF EXISTS `cms3_import_offer_price_list`;
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


DROP TABLE IF EXISTS `cms3_import_offer_price_type_list`;
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


DROP TABLE IF EXISTS `cms3_import_push_message_list`;
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


DROP TABLE IF EXISTS `cms3_import_push_subscriber_list`;
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


DROP TABLE IF EXISTS `cms3_import_push_topic_list`;
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


DROP TABLE IF EXISTS `cms3_import_redirects`;
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


DROP TABLE IF EXISTS `cms3_import_relations`;
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


DROP TABLE IF EXISTS `cms3_import_restrictions`;
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


DROP TABLE IF EXISTS `cms3_import_sliders`;
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


DROP TABLE IF EXISTS `cms3_import_slides`;
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


DROP TABLE IF EXISTS `cms3_import_sources`;
CREATE TABLE `cms3_import_sources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `source_name` (`source_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_import_stock_balance_list`;
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


DROP TABLE IF EXISTS `cms3_import_templates`;
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


DROP TABLE IF EXISTS `cms3_import_types`;
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


DROP TABLE IF EXISTS `cms3_langs`;
CREATE TABLE `cms3_langs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(16) NOT NULL,
  `title` varchar(255) NOT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prefix` (`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_links`;
CREATE TABLE `cms3_links` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(1024) NOT NULL,
  `address_hash` varchar(32) NOT NULL,
  `place` varchar(255) NOT NULL,
  `broken` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_hash` (`address_hash`),
  KEY `broken` (`broken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_links_sources`;
CREATE TABLE `cms3_links_sources` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `link_id` int(11) unsigned NOT NULL,
  `place` varchar(255) NOT NULL,
  `type` enum('object','template') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link_source` (`link_id`,`place`),
  CONSTRAINT `source link_id` FOREIGN KEY (`link_id`) REFERENCES `cms3_links` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_mail_notifications`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_mail_templates`;
CREATE TABLE `cms3_mail_templates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `notification_id` int(11) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name-notification` (`name`,`notification_id`),
  KEY `name` (`name`),
  KEY `notification_id` (`notification_id`),
  CONSTRAINT `mail template to notification` FOREIGN KEY (`notification_id`) REFERENCES `cms3_mail_notifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_mail_variables`;
CREATE TABLE `cms3_mail_variables` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(11) unsigned NOT NULL,
  `variable` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_name` (`variable`),
  KEY `template_name` (`template_id`),
  CONSTRAINT `mail variable to template` FOREIGN KEY (`template_id`) REFERENCES `cms3_mail_templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_messages`;
CREATE TABLE `cms3_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `sender_id` int(10) unsigned DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `type` enum('private','sys-event','sys-log') NOT NULL,
  `priority` int(11) DEFAULT 0,
  `is_sended` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `create_time` (`create_time`),
  KEY `priority` (`priority`),
  KEY `type` (`type`),
  KEY `is_sended` (`is_sended`),
  KEY `FK_Messages to user relation` (`sender_id`),
  CONSTRAINT `FK_Messages to user relation` FOREIGN KEY (`sender_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_messages_inbox`;
CREATE TABLE `cms3_messages_inbox` (
  `message_id` int(10) unsigned DEFAULT NULL,
  `recipient_id` int(10) unsigned DEFAULT NULL,
  `is_opened` int(11) DEFAULT 0,
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `is_opened` (`is_opened`),
  KEY `FK_MessagesInbox to Messages` (`message_id`),
  KEY `FK_MessagesInbox to User` (`recipient_id`),
  CONSTRAINT `FK_MessagesInbox to Messages` FOREIGN KEY (`message_id`) REFERENCES `cms3_messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MessagesInbox to User` FOREIGN KEY (`recipient_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_objects`;
CREATE TABLE `cms3_objects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT NULL,
  `type_id` int(10) unsigned DEFAULT NULL,
  `owner_id` int(10) unsigned DEFAULT NULL,
  `ord` int(10) unsigned DEFAULT 0,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `cms3_objects` (`id`, `guid`, `name`, `is_locked`, `type_id`, `owner_id`, `ord`, `updatetime`) VALUES
(1,	'social_networks-network-27915',	'i18n::object-vkontakte',	1,	38,	0,	1,	1556105553),
(2,	'84a36e2847c33ac03a7223b57b0c864b80ab26c8',	'i18n::object-rss',	0,	5,	0,	1,	1556105553),
(3,	'a35ff773f425e44df36c1cc68a415d92318b19ac',	'i18n::object-atom',	0,	5,	0,	2,	1556105553),
(4,	'e99ecbbec4c871f3fb63c3cc85796e177d017614',	'i18n::object-male',	0,	4,	0,	1,	1556105553),
(5,	'7b04a4565f37a07f1c2ee54be8286017de6c56df',	'i18n::object-female',	0,	4,	0,	2,	1556105553),
(6,	'swf-banner-quality-low',	'i18n::object-low',	0,	9,	0,	1,	1556105553),
(7,	'swf-banner-quality-medium',	'i18n::object-medium',	0,	9,	0,	2,	1556105553),
(8,	'swf-banner-quality-high',	'i18n::object-height',	0,	9,	0,	3,	1556105553),
(9,	'a1e3ae17e80ba2b4a3ddb1b855430346f74b8d48',	'i18n::object-usa',	1,	10,	0,	1,	1556105553),
(10,	'e9aa8c23a339224b25945aa9e99f09f578bdd483',	'i18n::object-russia',	1,	10,	0,	2,	1556105553),
(11,	'sytem-citylist-26905',	'Москва',	0,	11,	0,	1,	1556105553),
(12,	'sytem-citylist-26906',	'Санкт-Петербург',	0,	11,	0,	2,	1556105553),
(13,	'sytem-citylist-26907',	'Новосибирск',	0,	11,	0,	3,	1556105553),
(14,	'sytem-citylist-26908',	'Екатеринбург',	0,	11,	0,	4,	1556105553),
(15,	'sytem-citylist-26909',	'Нижний Новгород',	0,	11,	0,	5,	1556105553),
(16,	'sytem-citylist-26910',	'Самара',	0,	11,	0,	6,	1556105553),
(17,	'sytem-citylist-26911',	'Омск',	0,	11,	0,	7,	1556105553),
(18,	'sytem-citylist-26912',	'Казань',	0,	11,	0,	8,	1556105553),
(19,	'sytem-citylist-26913',	'Челябинск',	0,	11,	0,	9,	1556105553),
(20,	'sytem-citylist-26914',	'Ростов-на-Дону',	0,	11,	0,	10,	1556105553),
(21,	'sytem-citylist-26915',	'Уфа',	0,	11,	0,	11,	1556105553),
(22,	'sytem-citylist-26916',	'Пермь',	0,	11,	0,	12,	1556105553),
(23,	'sytem-citylist-26917',	'Волгоград',	0,	11,	0,	13,	1556105553),
(24,	'sytem-citylist-26918',	'Красноярск',	0,	11,	0,	14,	1556105553),
(25,	'sytem-citylist-26919',	'Саратов',	0,	11,	0,	15,	1556105553),
(26,	'sytem-citylist-26920',	'Воронеж',	0,	11,	0,	16,	1556105553),
(27,	'sytem-citylist-26921',	'Краснодар',	0,	11,	0,	17,	1556105553),
(28,	'sytem-citylist-26922',	'Тольятти',	0,	11,	0,	18,	1556105553),
(29,	'sytem-citylist-26923',	'Ижевск',	0,	11,	0,	19,	1556105553),
(30,	'sytem-citylist-26924',	'Ульяновск',	0,	11,	0,	20,	1556105553),
(31,	'sytem-citylist-26925',	'Ярославль',	0,	11,	0,	21,	1556105553),
(32,	'sytem-citylist-26926',	'Барнаул',	0,	11,	0,	22,	1556105553),
(33,	'sytem-citylist-26927',	'Владивосток',	0,	11,	0,	23,	1556105553),
(34,	'sytem-citylist-26928',	'Хабаровск',	0,	11,	0,	24,	1556105553),
(35,	'sytem-citylist-26929',	'Иркутск',	0,	11,	0,	25,	1556105553),
(36,	'sytem-citylist-26930',	'Новокузнецк',	0,	11,	0,	26,	1556105553),
(37,	'sytem-citylist-26931',	'Тюмень',	0,	11,	0,	27,	1556105553),
(38,	'sytem-citylist-26932',	'Оренбург',	0,	11,	0,	28,	1556105553),
(39,	'sytem-citylist-26933',	'Кемерово',	0,	11,	0,	29,	1556105553),
(40,	'sytem-citylist-26934',	'Рязань',	0,	11,	0,	30,	1556105553),
(41,	'sytem-citylist-26935',	'Пенза',	0,	11,	0,	31,	1556105553),
(42,	'sytem-citylist-26936',	'Набережные Челны',	0,	11,	0,	32,	1556105553),
(43,	'sytem-citylist-26937',	'Тула',	0,	11,	0,	33,	1556105553),
(44,	'sytem-citylist-26938',	'Липецк',	0,	11,	0,	34,	1556105553),
(45,	'sytem-citylist-26939',	'Астрахань',	0,	11,	0,	35,	1556105553),
(46,	'sytem-citylist-26940',	'Томск',	0,	11,	0,	36,	1556105553),
(47,	'sytem-citylist-26941',	'Махачкала',	0,	11,	0,	37,	1556105553),
(48,	'sytem-citylist-26942',	'Киров',	0,	11,	0,	38,	1556105553),
(49,	'sytem-citylist-26943',	'Чебоксары',	0,	11,	0,	39,	1556105553),
(50,	'sytem-citylist-26944',	'Калининград',	0,	11,	0,	40,	1556105553),
(51,	'sytem-citylist-26945',	'Брянск',	0,	11,	0,	41,	1556105553),
(52,	'sytem-citylist-26946',	'Магнитогорск',	0,	11,	0,	42,	1556105553),
(53,	'sytem-citylist-26947',	'Иваново',	0,	11,	0,	43,	1556105553),
(54,	'sytem-citylist-26948',	'Курск',	0,	11,	0,	44,	1556105553),
(55,	'sytem-citylist-26949',	'Тверь',	0,	11,	0,	45,	1556105553),
(56,	'sytem-citylist-26950',	'Нижний Тагил',	0,	11,	0,	46,	1556105553),
(57,	'sytem-citylist-26951',	'Ставрополь',	0,	11,	0,	47,	1556105553),
(58,	'sytem-citylist-26952',	'Архангельск',	0,	11,	0,	48,	1556105553),
(59,	'sytem-citylist-26953',	'Белгород',	0,	11,	0,	49,	1556105553),
(60,	'sytem-citylist-26954',	'Улан-Удэ',	0,	11,	0,	50,	1556105553),
(61,	'sytem-citylist-26955',	'Владимир',	0,	11,	0,	51,	1556105553),
(62,	'sytem-citylist-26956',	'Сочи',	0,	11,	0,	52,	1556105553),
(63,	'sytem-citylist-26957',	'Калуга',	0,	11,	0,	53,	1556105553),
(64,	'sytem-citylist-26958',	'Курган',	0,	11,	0,	54,	1556105553),
(65,	'sytem-citylist-26959',	'Орёл',	0,	11,	0,	55,	1556105553),
(66,	'sytem-citylist-26960',	'Смоленск',	0,	11,	0,	56,	1556105553),
(67,	'sytem-citylist-26961',	'Мурманск',	0,	11,	0,	57,	1556105553),
(68,	'sytem-citylist-26962',	'Владикавказ',	0,	11,	0,	58,	1556105553),
(69,	'sytem-citylist-26963',	'Череповец',	0,	11,	0,	59,	1556105553),
(70,	'sytem-citylist-26964',	'Волжский',	0,	11,	0,	60,	1556105553),
(71,	'sytem-citylist-26965',	'Чита',	0,	11,	0,	61,	1556105553),
(72,	'sytem-citylist-26966',	'Саранск',	0,	11,	0,	62,	1556105553),
(73,	'sytem-citylist-26967',	'Сургут',	0,	11,	0,	63,	1556105553),
(74,	'sytem-citylist-26968',	'Вологда',	0,	11,	0,	64,	1556105553),
(75,	'sytem-citylist-26969',	'Тамбов',	0,	11,	0,	65,	1556105553),
(76,	'sytem-citylist-26970',	'Кострома',	0,	11,	0,	66,	1556105553),
(77,	'sytem-citylist-26971',	'Комсомольск-на-Амуре',	0,	11,	0,	67,	1556105553),
(78,	'sytem-citylist-26972',	'Нальчик',	0,	11,	0,	68,	1556105553),
(79,	'sytem-citylist-26973',	'Петрозаводск',	0,	11,	0,	69,	1556105553),
(80,	'sytem-citylist-26974',	'Стерлитамак',	0,	11,	0,	70,	1556105553),
(81,	'sytem-citylist-26975',	'Таганрог',	0,	11,	0,	71,	1556105553),
(82,	'sytem-citylist-26976',	'Братск',	0,	11,	0,	72,	1556105553),
(83,	'sytem-citylist-26977',	'Дзержинск',	0,	11,	0,	73,	1556105553),
(84,	'sytem-citylist-26978',	'Йошкар-Ола',	0,	11,	0,	74,	1556105553),
(85,	'sytem-citylist-26979',	'Орск',	0,	11,	0,	75,	1556105553),
(86,	'sytem-citylist-26980',	'Шахты',	0,	11,	0,	76,	1556105553),
(87,	'sytem-citylist-26981',	'Якутск',	0,	11,	0,	77,	1556105553),
(88,	'sytem-citylist-26982',	'Ангарск',	0,	11,	0,	78,	1556105553),
(89,	'sytem-citylist-26983',	'Нижневартовск',	0,	11,	0,	79,	1556105553),
(90,	'sytem-citylist-26984',	'Сыктывкар',	0,	11,	0,	80,	1556105553),
(91,	'sytem-citylist-26985',	'Новороссийск',	0,	11,	0,	81,	1556105553),
(92,	'sytem-citylist-26986',	'Нижнекамск',	0,	11,	0,	82,	1556105554),
(93,	'sytem-citylist-26987',	'Бийск',	0,	11,	0,	83,	1556105554),
(94,	'sytem-citylist-26988',	'Грозный',	0,	11,	0,	84,	1556105554),
(95,	'sytem-citylist-26989',	'Старый Оскол',	0,	11,	0,	85,	1556105554),
(96,	'sytem-citylist-26990',	'Великий Новгород',	0,	11,	0,	86,	1556105554),
(97,	'sytem-citylist-26991',	'Прокопьевск',	0,	11,	0,	87,	1556105554),
(98,	'sytem-citylist-26992',	'Рыбинск',	0,	11,	0,	88,	1556105554),
(99,	'sytem-citylist-26993',	'Норильск',	0,	11,	0,	89,	1556105554),
(100,	'sytem-citylist-26994',	'Благовещенск',	0,	11,	0,	90,	1556105554),
(101,	'sytem-citylist-26995',	'Энгельс',	0,	11,	0,	91,	1556105554),
(102,	'sytem-citylist-26996',	'Балаково',	0,	11,	0,	92,	1556105554),
(103,	'sytem-citylist-26997',	'Петропавловск-Камчатский',	0,	11,	0,	93,	1556105554),
(104,	'sytem-citylist-26998',	'Псков',	0,	11,	0,	94,	1556105554),
(105,	'sytem-citylist-26999',	'Северодвинск',	0,	11,	0,	95,	1556105554),
(106,	'sytem-citylist-27000',	'Армавир',	0,	11,	0,	96,	1556105554),
(107,	'sytem-citylist-27001',	'Златоуст',	0,	11,	0,	97,	1556105554),
(108,	'sytem-citylist-27002',	'Балашиха',	0,	11,	0,	98,	1556105554),
(109,	'sytem-citylist-27003',	'Каменск-Уральский',	0,	11,	0,	99,	1556105554),
(110,	'sytem-citylist-27004',	'Химки',	0,	11,	0,	100,	1556105554),
(111,	'sytem-citylist-27005',	'Сызрань',	0,	11,	0,	101,	1556105554),
(112,	'sytem-citylist-27006',	'Подольск',	0,	11,	0,	102,	1556105554),
(113,	'sytem-citylist-27007',	'Новочеркасск',	0,	11,	0,	103,	1556105554),
(114,	'sytem-citylist-27008',	'Королёв',	0,	11,	0,	104,	1556105554),
(115,	'sytem-citylist-27009',	'Южно-Сахалинск',	0,	11,	0,	105,	1556105554),
(116,	'sytem-citylist-27010',	'Волгодонск',	0,	11,	0,	106,	1556105554),
(117,	'sytem-citylist-27011',	'Находка',	0,	11,	0,	107,	1556105554),
(118,	'sytem-citylist-27012',	'Березники',	0,	11,	0,	108,	1556105554),
(119,	'sytem-citylist-27013',	'Абакан',	0,	11,	0,	109,	1556105554),
(120,	'sytem-citylist-27014',	'Мытищи',	0,	11,	0,	110,	1556105554),
(121,	'sytem-citylist-27015',	'Люберцы',	0,	11,	0,	111,	1556105554),
(122,	'sytem-citylist-27016',	'Рубцовск',	0,	11,	0,	112,	1556105554),
(123,	'sytem-citylist-27017',	'Майкоп',	0,	11,	0,	113,	1556105554),
(124,	'sytem-citylist-27018',	'Салават',	0,	11,	0,	114,	1556105554),
(125,	'sytem-citylist-27019',	'Уссурийск',	0,	11,	0,	115,	1556105554),
(126,	'sytem-citylist-27020',	'Миасс',	0,	11,	0,	116,	1556105554),
(127,	'sytem-citylist-27021',	'Ковров',	0,	11,	0,	117,	1556105554),
(128,	'sytem-citylist-27022',	'Коломна',	0,	11,	0,	118,	1556105554),
(129,	'sytem-citylist-27023',	'Электросталь',	0,	11,	0,	119,	1556105554),
(130,	'sytem-citylist-27024',	'Альметьевск',	0,	11,	0,	120,	1556105554),
(131,	'sytem-citylist-27025',	'Пятигорск',	0,	11,	0,	121,	1556105554),
(132,	'sytem-citylist-27026',	'Копейск',	0,	11,	0,	122,	1556105554),
(133,	'sytem-citylist-27027',	'Первоуральск',	0,	11,	0,	123,	1556105554),
(134,	'sytem-citylist-27028',	'Назрань',	0,	11,	0,	124,	1556105554),
(135,	'sytem-citylist-27029',	'Одинцово',	0,	11,	0,	125,	1556105554),
(136,	'sytem-citylist-27030',	'Невинномысск',	0,	11,	0,	126,	1556105554),
(137,	'sytem-citylist-27031',	'Кисловодск',	0,	11,	0,	127,	1556105554),
(138,	'sytem-citylist-27032',	'Димитровград',	0,	11,	0,	128,	1556105554),
(139,	'sytem-citylist-27033',	'Хасавюрт',	0,	11,	0,	129,	1556105554),
(140,	'sytem-citylist-27034',	'Новочебоксарск',	0,	11,	0,	130,	1556105554),
(141,	'sytem-citylist-27035',	'Новомосковск',	0,	11,	0,	131,	1556105554),
(142,	'sytem-citylist-27036',	'Серпухов',	0,	11,	0,	132,	1556105554),
(143,	'sytem-citylist-27037',	'Орехово-Зуево',	0,	11,	0,	133,	1556105554),
(144,	'sytem-citylist-27038',	'Муром',	0,	11,	0,	134,	1556105554),
(145,	'sytem-citylist-27039',	'Камышин',	0,	11,	0,	135,	1556105554),
(146,	'sytem-citylist-27040',	'Железнодорожный',	0,	11,	0,	136,	1556105554),
(147,	'sytem-citylist-27041',	'Нефтекамск',	0,	11,	0,	137,	1556105554),
(148,	'sytem-citylist-27042',	'Новый Уренгой',	0,	11,	0,	138,	1556105554),
(149,	'sytem-citylist-27043',	'Черкесск',	0,	11,	0,	139,	1556105554),
(150,	'sytem-citylist-27044',	'Ногинск',	0,	11,	0,	140,	1556105554),
(151,	'sytem-citylist-27045',	'Новошахтинск',	0,	11,	0,	141,	1556105554),
(152,	'sytem-citylist-27046',	'Нефтеюганск',	0,	11,	0,	142,	1556105554),
(153,	'sytem-citylist-27047',	'Щёлково',	0,	11,	0,	143,	1556105554),
(154,	'sytem-citylist-27048',	'Елец',	0,	11,	0,	144,	1556105554),
(155,	'sytem-citylist-27049',	'Ачинск',	0,	11,	0,	145,	1556105554),
(156,	'sytem-citylist-27050',	'Новокуйбышевск',	0,	11,	0,	146,	1556105554),
(157,	'sytem-citylist-27051',	'Сергиев Посад',	0,	11,	0,	147,	1556105554),
(158,	'sytem-citylist-27052',	'Ноябрьск',	0,	11,	0,	148,	1556105554),
(159,	'sytem-citylist-27053',	'Кызыл',	0,	11,	0,	149,	1556105554),
(160,	'sytem-citylist-27054',	'Дербент',	0,	11,	0,	150,	1556105554),
(161,	'sytem-citylist-27055',	'Октябрьский',	0,	11,	0,	151,	1556105554),
(162,	'sytem-citylist-27056',	'Северск',	0,	11,	0,	152,	1556105554),
(163,	'sytem-citylist-27057',	'Ленинск-Кузнецкий',	0,	11,	0,	153,	1556105554),
(164,	'sytem-citylist-27058',	'Арзамас',	0,	11,	0,	154,	1556105554),
(165,	'sytem-citylist-27059',	'Обнинск',	0,	11,	0,	155,	1556105554),
(166,	'sytem-citylist-27060',	'Ухта',	0,	11,	0,	156,	1556105554),
(167,	'sytem-citylist-27061',	'Междуреченск',	0,	11,	0,	157,	1556105554),
(168,	'sytem-citylist-27062',	'Киселёвск',	0,	11,	0,	158,	1556105554),
(169,	'sytem-citylist-27063',	'Новотроицк',	0,	11,	0,	159,	1556105554),
(170,	'sytem-citylist-27064',	'Батайск',	0,	11,	0,	160,	1556105554),
(171,	'sytem-citylist-27065',	'Элиста',	0,	11,	0,	161,	1556105554),
(172,	'sytem-citylist-27066',	'Артём',	0,	11,	0,	162,	1556105554),
(173,	'sytem-citylist-27067',	'Жуковский',	0,	11,	0,	163,	1556105554),
(174,	'sytem-citylist-27068',	'Великие Луки',	0,	11,	0,	164,	1556105554),
(175,	'sytem-citylist-27069',	'Канск',	0,	11,	0,	165,	1556105554),
(176,	'sytem-citylist-27070',	'Магадан',	0,	11,	0,	166,	1556105554),
(177,	'sytem-citylist-27071',	'Тобольск',	0,	11,	0,	167,	1556105554),
(178,	'sytem-citylist-27072',	'Глазов',	0,	11,	0,	168,	1556105554),
(179,	'emarket-discounttype-27131',	'i18n::object-catalog_item_discount',	0,	30,	0,	1,	1556105554),
(180,	'emarket-discounttype-27132',	'i18n::object-order_discount',	0,	30,	0,	2,	1556105554),
(181,	'users-users-15',	'i18n::object-supervajzery',	1,	39,	0,	1,	1556105554),
(182,	'system-supervisor',	'sv',	1,	54,	0,	1,	1600696497),
(183,	'emarket-discounttype-bonus',	'i18n::object-bonus-discount',	0,	30,	0,	3,	1556105554),
(184,	'emarket-discountmodificatortype-27136',	'i18n::object-summ_percent',	0,	31,	0,	1,	1556105558),
(185,	'emarket-store-27147',	'i18n::object-main_store',	0,	55,	0,	1,	1556105554),
(186,	'emarket-discountruletype-27150',	'i18n::object-specify_items',	0,	33,	0,	1,	1556105558),
(187,	'emarket-itemtype-27180',	'i18n::object-digital',	1,	41,	0,	1,	1556105554),
(188,	'emarket-itemtype-27181',	'i18n::object-complex',	1,	41,	0,	2,	1556105554),
(189,	'emarket-deliverytype-27230',	'i18n::object-pickup',	0,	50,	0,	1,	1556105554),
(190,	'emarket-deliverytype-27233',	'i18n::object-courier_delivery',	0,	50,	0,	2,	1556105554),
(191,	'emarket-paymenttype-27236',	'i18n::object-sales_draft',	1,	46,	0,	1,	1556105554),
(192,	'emarket-orderstatus-27258',	'i18n::object-otmenen',	1,	45,	0,	1,	1556105554),
(193,	'emarket-orderstatus-27259',	'i18n::object-otklonen',	1,	45,	0,	2,	1556105554),
(194,	'emarket-orderstatus-27260',	'i18n::object-oplachivaetsya',	1,	45,	0,	3,	1556105554),
(195,	'emarket-orderstatus-27261',	'i18n::object-dostavlyaetsya',	1,	45,	0,	4,	1556105554),
(196,	'emarket-orderstatus-27262',	'i18n::object-ozhidaet_proverki',	1,	45,	0,	5,	1556105554),
(197,	'emarket-orderstatus-27263',	'i18n::object-prinyat',	1,	45,	0,	6,	1556105554),
(198,	'emarket-orderstatus-27264',	'i18n::object-gotov',	1,	45,	0,	7,	1556105554),
(199,	'emarket-orderdeliverystatus-27377',	'i18n::object-ojidaet_otgruzki',	1,	52,	0,	1,	1556105554),
(200,	'emarket-orderdeliverystatus-27378',	'i18n::object-dostavlyaetsya',	1,	52,	0,	2,	1556105554),
(201,	'emarket-orderdeliverystatus-27379',	'i18n::object-dostavlen',	1,	52,	0,	3,	1556105554),
(202,	'emarket-orderpaymentstatus-27380',	'i18n::object-inicialisirovana',	1,	48,	0,	1,	1556105554),
(203,	'emarket-orderpaymentstatus-27381',	'i18n::object-podtverjdena',	1,	48,	0,	2,	1556105554),
(204,	'emarket-orderpaymentstatus-27382',	'i18n::object-otklonena',	1,	48,	0,	3,	1556105554),
(205,	'emarket-orderpaymentstatus-27383',	'i18n::object-prinyata',	1,	48,	0,	4,	1556105554),
(206,	'emarket-discountruletype-27393',	'i18n::object-time_interval_discount',	0,	33,	0,	2,	1556105558),
(207,	'emarket-discountruletype-27394',	'i18n::object-order_summ_discount',	0,	33,	0,	3,	1556105558),
(208,	'emarket-discountruletype-27395',	'i18n::object-user_summ_discount',	0,	33,	0,	4,	1556105558),
(209,	'emarket-discountruletype-27396',	'i18n::object-user_group_discount',	0,	33,	0,	5,	1556105558),
(210,	'emarket-discountruletype-27397',	'i18n::object-users_discount',	0,	33,	0,	6,	1556105558),
(211,	'emarket-discountruletype-27398',	'i18n::object-related_items_discount',	0,	33,	0,	7,	1556105558),
(212,	'emarket-discountmodificatortype-27456',	'i18n::object-fixed_modifier',	0,	31,	0,	2,	1556105558),
(213,	'emarket-paymenttype-27457',	'i18n::object-payonline_system',	1,	46,	0,	2,	1556105554),
(214,	'emarket-paymenttype-27458',	'i18n::object-to_courier',	1,	46,	0,	3,	1556105554),
(215,	'399872db6f3d1341ef99b406aa2a9e515292b0c9',	'object-surface',	0,	15,	0,	1,	1556105554),
(216,	'417baf8cefb99325510d31e974835254c980828b',	'object-air',	0,	15,	0,	2,	1556105554),
(217,	'76377e05d0ffd4b0f6f0e72a45645f4be10f1c66',	'object-composite',	0,	15,	0,	3,	1556105554),
(218,	'df383879afa5ac2e221b8fa0b0f2a6467da2886f',	'object-accelerated',	0,	15,	0,	4,	1556105554),
(219,	'emarket-deliverytype-27481',	'i18n::object-russian_post',	0,	50,	0,	3,	1556105554),
(220,	'emarket-paymenttype-27486',	'i18n::object-robokassa',	1,	46,	0,	4,	1556105554),
(222,	'6bc46e77b86f1420917bee7a0e2154b34cdaad61',	'00:00',	0,	16,	0,	1,	1556105554),
(223,	'1648322caec238f02862b0449a33b58245a9d6ce',	'01:00',	0,	16,	0,	2,	1556105554),
(224,	'da2e75029f33e530c848c3aa89690ec07dd414b2',	'02:00',	0,	16,	0,	3,	1556105554),
(225,	'8794b39a7bd4fe275575b6b864cf1fcca4d6d93b',	'03:00',	0,	16,	0,	4,	1556105554),
(226,	'2054dced2668a57484cb2aa2498def91c22320ae',	'04:00',	0,	16,	0,	5,	1556105554),
(227,	'14aa300dbddcacb6c76a4b5a364a034b6128693a',	'05:00',	0,	16,	0,	6,	1556105554),
(228,	'5dc9eb3a83efd4d3302570742365c0186386947d',	'06:00',	0,	16,	0,	7,	1556105554),
(229,	'8e0da95ba94e4757f3cc0f24bb0955069eb0f771',	'07:00',	0,	16,	0,	8,	1556105554),
(230,	'23b3d29bb04eec144896f7f983b2f66611fe1435',	'08:00',	0,	16,	0,	9,	1556105554),
(231,	'fd1f432dc313a02bcbcc9f405d8e9d121b01ba8d',	'09:00',	0,	16,	0,	10,	1556105554),
(232,	'fffaba271c93a300f405a329f303686a9450bf5b',	'10:00',	0,	16,	0,	11,	1556105554),
(233,	'a86f018536b8cb5896cdb631c8da8f10f0253fd9',	'11:00',	0,	16,	0,	12,	1556105554),
(234,	'8d0a7e8844fd4b2eea8da19a39b81b048ce713d0',	'12:00',	0,	16,	0,	13,	1556105554),
(235,	'22df1963ca47cc9ae5f0228f56ceeff467a2a280',	'13:00',	0,	16,	0,	14,	1556105554),
(236,	'a03164eed7751779efd5d55464af6ae13fc4696e',	'14:00',	0,	16,	0,	15,	1556105554),
(237,	'de1581726146cac70c29f0db6043eaa552da041f',	'15:00',	0,	16,	0,	16,	1556105554),
(238,	'76ef341932f74678306044a0fa3e0105f5564492',	'16:00',	0,	16,	0,	17,	1556105554),
(239,	'0db9ccf6183c19890acb33bc83c6167c7e941a5b',	'17:00',	0,	16,	0,	18,	1556105554),
(240,	'e7951bd7de49615dc83491a195b47b61e82263bf',	'18:00',	0,	16,	0,	19,	1556105554),
(241,	'70df85f9ac44cb7c7598b6ef28a50ddaa21d3937',	'19:00',	0,	16,	0,	20,	1556105554),
(242,	'c60043f184d65a3101c6df21a087bbf99875a60b',	'20:00',	0,	16,	0,	21,	1556105554),
(243,	'0837bbc4bf13fa667b3397def81d3a95a22f0739',	'21:00',	0,	16,	0,	22,	1556105554),
(244,	'4f4c3308c188af2a2e08d59aecfaa2690fcf9981',	'22:00',	0,	16,	0,	23,	1556105554),
(245,	'873f75be11e53b76dea6a438a97d3167d0aeb95c',	'23:00',	0,	16,	0,	24,	1556105554),
(246,	'0a6697c2e0b67a404a645c2dd03f846e55afd981',	'i18n::object-monday',	0,	17,	0,	1,	1556105554),
(247,	'4ba74364fd714bc12a8e8943cc6a36a26eaa36df',	'i18n::object-tuesday',	0,	17,	0,	2,	1556105554),
(248,	'95b836e6799c016df64fdbab8d40d1c2b60173b3',	'i18n::object-wednesday',	0,	17,	0,	3,	1556105554),
(249,	'a9bbb4de15c70fc416f13be9760ef33c3b2c6d67',	'i18n::object-thursday',	0,	17,	0,	4,	1556105554),
(250,	'14a13a85a4e99c4f6c2fa9f42c4ff765e14415c3',	'i18n::object-friday',	0,	17,	0,	5,	1556105555),
(251,	'bd7e2b0388c70b3ae4f64fe0bf5533f16e814704',	'i18n::object-saturday',	0,	17,	0,	6,	1556105555),
(252,	'31586aa19a50a89a33e4d37a5d200671252fbd60',	'i18n::object-sunday',	0,	17,	0,	7,	1556105555),
(253,	'emarket-paymenttype-27519',	'i18n::object-legal_bodies_account',	1,	46,	0,	6,	1556105555),
(279,	'emarket-paymenttype-payanyway',	'i18n::object-payanyway',	1,	46,	0,	7,	1556105555),
(280,	'emarket-paymenttype-dengionline',	'i18n::object-money_online',	1,	46,	0,	8,	1556105555),
(281,	'emarket-orderstatus-editing',	'i18n::object-orderstatus-editing',	1,	45,	0,	8,	1556105555),
(296,	'emarket-mobile-platform-27944',	'i18n::object-android',	0,	23,	0,	1,	1556105555),
(297,	'emarket-mobile-platform-27945',	'i18n::object-ios',	0,	23,	0,	2,	1556105555),
(298,	'emarket-order-payment-status-default',	'i18n::object-order-payment-status-default',	1,	48,	0,	5,	1556105555),
(299,	'emarket-order-delivery-status-default',	'i18n::object-order-payment-status-default',	1,	52,	0,	4,	1556105555),
(300,	'news-rss-charset-27949',	'i18n::object-windows_1251',	0,	6,	0,	1,	1556105555),
(301,	'news-rss-charset-27950',	'i18n::object-utf_8',	0,	6,	0,	2,	1556105555),
(304,	'emarket-paymenttype-paypal',	'i18n::object-paymenttype-paypal',	1,	46,	0,	12,	1556105555),
(305,	'exchange-encoding-windows-1251',	'Windows-1251',	0,	26,	0,	1,	1556105555),
(306,	'exchange-encoding-utf-8',	'UTF-8',	0,	26,	0,	2,	1556105555),
(307,	'emarket-deliverytype-27958',	'i18n::object-type-apiship',	1,	50,	0,	4,	1556105555),
(308,	'emarket-orderdeliverystatus-27959',	'i18n::object-otmenen',	1,	52,	0,	5,	1556105555),
(309,	'emarket-orderdeliverystatus-27960',	'i18n::object-return',	1,	52,	0,	6,	1556105555),
(310,	'country-AU',	'i18n::object-country-AU',	1,	10,	0,	3,	1556105555),
(311,	'country-AT',	'i18n::object-country-AT',	1,	10,	0,	4,	1556105555),
(312,	'country-AZ',	'i18n::object-country-AZ',	1,	10,	0,	5,	1556105555),
(313,	'country-AX',	'i18n::object-country-AX',	1,	10,	0,	6,	1556105555),
(314,	'country-AL',	'i18n::object-country-AL',	1,	10,	0,	7,	1556105555),
(315,	'country-DZ',	'i18n::object-country-DZ',	1,	10,	0,	8,	1556105555),
(316,	'country-AS',	'i18n::object-country-AS',	1,	10,	0,	9,	1556105555),
(317,	'country-AI',	'i18n::object-country-AI',	1,	10,	0,	10,	1556105555),
(318,	'country-AO',	'i18n::object-country-AO',	1,	10,	0,	11,	1556105555),
(319,	'country-AD',	'i18n::object-country-AD',	1,	10,	0,	12,	1556105555),
(320,	'country-AQ',	'i18n::object-country-AQ',	1,	10,	0,	13,	1556105555),
(321,	'country-AG',	'i18n::object-country-AG',	1,	10,	0,	14,	1556105555),
(322,	'country-AR',	'i18n::object-country-AR',	1,	10,	0,	15,	1556105555),
(323,	'country-AM',	'i18n::object-country-AM',	1,	10,	0,	16,	1556105555),
(324,	'country-AW',	'i18n::object-country-AW',	1,	10,	0,	17,	1556105555),
(325,	'country-AF',	'i18n::object-country-AF',	1,	10,	0,	18,	1556105555),
(326,	'country-BS',	'i18n::object-country-BS',	1,	10,	0,	19,	1556105555),
(327,	'country-BD',	'i18n::object-country-BD',	1,	10,	0,	20,	1556105555),
(328,	'country-BB',	'i18n::object-country-BB',	1,	10,	0,	21,	1556105555),
(329,	'country-BH',	'i18n::object-country-BH',	1,	10,	0,	22,	1556105555),
(330,	'country-BY',	'i18n::object-country-BY',	1,	10,	0,	23,	1556105555),
(331,	'country-BZ',	'i18n::object-country-BZ',	1,	10,	0,	24,	1556105555),
(332,	'country-BE',	'i18n::object-country-BE',	1,	10,	0,	25,	1556105555),
(333,	'country-BJ',	'i18n::object-country-BJ',	1,	10,	0,	26,	1556105555),
(334,	'country-BM',	'i18n::object-country-BM',	1,	10,	0,	27,	1556105555),
(335,	'country-BG',	'i18n::object-country-BG',	1,	10,	0,	28,	1556105555),
(336,	'country-BO',	'i18n::object-country-BO',	1,	10,	0,	29,	1556105555),
(337,	'country-BQ',	'i18n::object-country-BQ',	1,	10,	0,	30,	1556105555),
(338,	'country-BA',	'i18n::object-country-BA',	1,	10,	0,	31,	1556105555),
(339,	'country-BW',	'i18n::object-country-BW',	1,	10,	0,	32,	1556105555),
(340,	'country-BR',	'i18n::object-country-BR',	1,	10,	0,	33,	1556105555),
(341,	'country-IO',	'i18n::object-country-IO',	1,	10,	0,	34,	1556105555),
(342,	'country-BN',	'i18n::object-country-BN',	1,	10,	0,	35,	1556105555),
(343,	'country-BF',	'i18n::object-country-BF',	1,	10,	0,	36,	1556105555),
(344,	'country-BI',	'i18n::object-country-BI',	1,	10,	0,	37,	1556105555),
(345,	'country-BT',	'i18n::object-country-BT',	1,	10,	0,	38,	1556105555),
(346,	'country-VU',	'i18n::object-country-VU',	1,	10,	0,	39,	1556105555),
(347,	'country-VA',	'i18n::object-country-VA',	1,	10,	0,	40,	1556105555),
(348,	'country-GB',	'i18n::object-country-GB',	1,	10,	0,	41,	1556105555),
(349,	'country-HU',	'i18n::object-country-HU',	1,	10,	0,	42,	1556105555),
(350,	'country-VE',	'i18n::object-country-VE',	1,	10,	0,	43,	1556105555),
(351,	'country-VG',	'i18n::object-country-VG',	1,	10,	0,	44,	1556105555),
(352,	'country-VI',	'i18n::object-country-VI',	1,	10,	0,	45,	1556105555),
(353,	'country-UM',	'i18n::object-country-UM',	1,	10,	0,	46,	1556105555),
(354,	'country-TL',	'i18n::object-country-TL',	1,	10,	0,	47,	1556105555),
(355,	'country-VN',	'i18n::object-country-VN',	1,	10,	0,	48,	1556105555),
(356,	'country-GA',	'i18n::object-country-GA',	1,	10,	0,	49,	1556105555),
(357,	'country-HT',	'i18n::object-country-HT',	1,	10,	0,	50,	1556105555),
(358,	'country-GY',	'i18n::object-country-GY',	1,	10,	0,	51,	1556105555),
(359,	'country-GM',	'i18n::object-country-GM',	1,	10,	0,	52,	1556105555),
(360,	'country-GH',	'i18n::object-country-GH',	1,	10,	0,	53,	1556105555),
(361,	'country-GP',	'i18n::object-country-GP',	1,	10,	0,	54,	1556105555),
(362,	'country-GT',	'i18n::object-country-GT',	1,	10,	0,	55,	1556105555),
(363,	'country-GN',	'i18n::object-country-GN',	1,	10,	0,	56,	1556105555),
(364,	'country-GW',	'i18n::object-country-GW',	1,	10,	0,	57,	1556105555),
(365,	'country-DE',	'i18n::object-country-DE',	1,	10,	0,	58,	1556105555),
(366,	'country-GG',	'i18n::object-country-GG',	1,	10,	0,	59,	1556105555),
(367,	'country-GI',	'i18n::object-country-GI',	1,	10,	0,	60,	1556105555),
(368,	'country-HN',	'i18n::object-country-HN',	1,	10,	0,	61,	1556105555),
(369,	'country-HK',	'i18n::object-country-HK',	1,	10,	0,	62,	1556105556),
(370,	'country-GD',	'i18n::object-country-GD',	1,	10,	0,	63,	1556105556),
(371,	'country-GL',	'i18n::object-country-GL',	1,	10,	0,	64,	1556105556),
(372,	'country-GR',	'i18n::object-country-GR',	1,	10,	0,	65,	1556105556),
(373,	'country-GE',	'i18n::object-country-GE',	1,	10,	0,	66,	1556105556),
(374,	'country-GU',	'i18n::object-country-GU',	1,	10,	0,	67,	1556105556),
(375,	'country-DK',	'i18n::object-country-DK',	1,	10,	0,	68,	1556105556),
(376,	'country-JE',	'i18n::object-country-JE',	1,	10,	0,	69,	1556105556),
(377,	'country-DJ',	'i18n::object-country-DJ',	1,	10,	0,	70,	1556105556),
(378,	'country-DG',	'i18n::object-country-DG',	1,	10,	0,	71,	1556105556),
(379,	'country-DM',	'i18n::object-country-DM',	1,	10,	0,	72,	1556105556),
(380,	'country-DO',	'i18n::object-country-DO',	1,	10,	0,	73,	1556105556),
(381,	'country-EG',	'i18n::object-country-EG',	1,	10,	0,	74,	1556105556),
(382,	'country-ZM',	'i18n::object-country-ZM',	1,	10,	0,	75,	1556105556),
(383,	'country-EH',	'i18n::object-country-EH',	1,	10,	0,	76,	1556105556),
(384,	'country-ZW',	'i18n::object-country-ZW',	1,	10,	0,	77,	1556105556),
(385,	'country-IL',	'i18n::object-country-IL',	1,	10,	0,	78,	1556105556),
(386,	'country-IN',	'i18n::object-country-IN',	1,	10,	0,	79,	1556105556),
(387,	'country-ID',	'i18n::object-country-ID',	1,	10,	0,	80,	1556105556),
(388,	'country-JO',	'i18n::object-country-JO',	1,	10,	0,	81,	1556105556),
(389,	'country-IQ',	'i18n::object-country-IQ',	1,	10,	0,	82,	1556105556),
(390,	'country-IR',	'i18n::object-country-IR',	1,	10,	0,	83,	1556105556),
(391,	'country-IE',	'i18n::object-country-IE',	1,	10,	0,	84,	1556105556),
(392,	'country-IS',	'i18n::object-country-IS',	1,	10,	0,	85,	1556105556),
(393,	'country-ES',	'i18n::object-country-ES',	1,	10,	0,	86,	1556105556),
(394,	'country-IT',	'i18n::object-country-IT',	1,	10,	0,	87,	1556105556),
(395,	'country-YE',	'i18n::object-country-YE',	1,	10,	0,	88,	1556105556),
(396,	'country-CV',	'i18n::object-country-CV',	1,	10,	0,	89,	1556105556),
(397,	'country-KZ',	'i18n::object-country-KZ',	1,	10,	0,	90,	1556105556),
(398,	'country-KY',	'i18n::object-country-KY',	1,	10,	0,	91,	1556105556),
(399,	'country-KH',	'i18n::object-country-KH',	1,	10,	0,	92,	1556105556),
(400,	'country-CM',	'i18n::object-country-CM',	1,	10,	0,	93,	1556105556),
(401,	'country-CA',	'i18n::object-country-CA',	1,	10,	0,	94,	1556105556),
(402,	'country-IC',	'i18n::object-country-IC',	1,	10,	0,	95,	1556105556),
(403,	'country-QA',	'i18n::object-country-QA',	1,	10,	0,	96,	1556105556),
(404,	'country-KE',	'i18n::object-country-KE',	1,	10,	0,	97,	1556105556),
(405,	'country-CY',	'i18n::object-country-CY',	1,	10,	0,	98,	1556105556),
(406,	'country-KG',	'i18n::object-country-KG',	1,	10,	0,	99,	1556105556),
(407,	'country-KI',	'i18n::object-country-KI',	1,	10,	0,	100,	1556105556),
(408,	'country-CN',	'i18n::object-country-CN',	1,	10,	0,	101,	1556105556),
(409,	'country-KP',	'i18n::object-country-KP',	1,	10,	0,	102,	1556105556),
(410,	'country-CC',	'i18n::object-country-CC',	1,	10,	0,	103,	1556105556),
(411,	'country-CO',	'i18n::object-country-CO',	1,	10,	0,	104,	1556105556),
(412,	'country-KM',	'i18n::object-country-KM',	1,	10,	0,	105,	1556105556),
(413,	'country-CG',	'i18n::object-country-CG',	1,	10,	0,	106,	1556105556),
(414,	'country-CD',	'i18n::object-country-CD',	1,	10,	0,	107,	1556105556),
(415,	'country-XK',	'i18n::object-country-XK',	1,	10,	0,	108,	1556105556),
(416,	'country-CR',	'i18n::object-country-CR',	1,	10,	0,	109,	1556105556),
(417,	'country-CI',	'i18n::object-country-CI',	1,	10,	0,	110,	1556105556),
(418,	'country-CU',	'i18n::object-country-CU',	1,	10,	0,	111,	1556105556),
(419,	'country-KW',	'i18n::object-country-KW',	1,	10,	0,	112,	1556105556),
(420,	'country-CW',	'i18n::object-country-CW',	1,	10,	0,	113,	1556105556),
(421,	'country-LA',	'i18n::object-country-LA',	1,	10,	0,	114,	1556105556),
(422,	'country-LV',	'i18n::object-country-LV',	1,	10,	0,	115,	1556105556),
(423,	'country-LS',	'i18n::object-country-LS',	1,	10,	0,	116,	1556105556),
(424,	'country-LR',	'i18n::object-country-LR',	1,	10,	0,	117,	1556105556),
(425,	'country-LB',	'i18n::object-country-LB',	1,	10,	0,	118,	1556105556),
(426,	'country-LY',	'i18n::object-country-LY',	1,	10,	0,	119,	1556105556),
(427,	'country-LT',	'i18n::object-country-LT',	1,	10,	0,	120,	1556105556),
(428,	'country-LI',	'i18n::object-country-LI',	1,	10,	0,	121,	1556105556),
(429,	'country-LU',	'i18n::object-country-LU',	1,	10,	0,	122,	1556105556),
(430,	'country-MU',	'i18n::object-country-MU',	1,	10,	0,	123,	1556105556),
(431,	'country-MR',	'i18n::object-country-MR',	1,	10,	0,	124,	1556105556),
(432,	'country-MG',	'i18n::object-country-MG',	1,	10,	0,	125,	1556105556),
(433,	'country-YT',	'i18n::object-country-YT',	1,	10,	0,	126,	1556105556),
(434,	'country-MO',	'i18n::object-country-MO',	1,	10,	0,	127,	1556105556),
(435,	'country-MK',	'i18n::object-country-MK',	1,	10,	0,	128,	1556105556),
(436,	'country-MW',	'i18n::object-country-MW',	1,	10,	0,	129,	1556105556),
(437,	'country-MY',	'i18n::object-country-MY',	1,	10,	0,	130,	1556105556),
(438,	'country-ML',	'i18n::object-country-ML',	1,	10,	0,	131,	1556105556),
(439,	'country-MV',	'i18n::object-country-MV',	1,	10,	0,	132,	1556105556),
(440,	'country-MT',	'i18n::object-country-MT',	1,	10,	0,	133,	1556105556),
(441,	'country-MA',	'i18n::object-country-MA',	1,	10,	0,	134,	1556105556),
(442,	'country-MQ',	'i18n::object-country-MQ',	1,	10,	0,	135,	1556105556),
(443,	'country-MH',	'i18n::object-country-MH',	1,	10,	0,	136,	1556105556),
(444,	'country-MX',	'i18n::object-country-MX',	1,	10,	0,	137,	1556105556),
(445,	'country-MZ',	'i18n::object-country-MZ',	1,	10,	0,	138,	1556105556),
(446,	'country-MD',	'i18n::object-country-MD',	1,	10,	0,	139,	1556105556),
(447,	'country-MC',	'i18n::object-country-MC',	1,	10,	0,	140,	1556105556),
(448,	'country-MN',	'i18n::object-country-MN',	1,	10,	0,	141,	1556105556),
(449,	'country-MS',	'i18n::object-country-MS',	1,	10,	0,	142,	1556105556),
(450,	'country-MM',	'i18n::object-country-MM',	1,	10,	0,	143,	1556105556),
(451,	'country-NA',	'i18n::object-country-NA',	1,	10,	0,	144,	1556105556),
(452,	'country-NR',	'i18n::object-country-NR',	1,	10,	0,	145,	1556105556),
(453,	'country-NP',	'i18n::object-country-NP',	1,	10,	0,	146,	1556105556),
(454,	'country-NE',	'i18n::object-country-NE',	1,	10,	0,	147,	1556105556),
(455,	'country-NG',	'i18n::object-country-NG',	1,	10,	0,	148,	1556105556),
(456,	'country-NL',	'i18n::object-country-NL',	1,	10,	0,	149,	1556105556),
(457,	'country-NI',	'i18n::object-country-NI',	1,	10,	0,	150,	1556105556),
(458,	'country-NU',	'i18n::object-country-NU',	1,	10,	0,	151,	1556105556),
(459,	'country-NZ',	'i18n::object-country-NZ',	1,	10,	0,	152,	1556105556),
(460,	'country-NC',	'i18n::object-country-NC',	1,	10,	0,	153,	1556105556),
(461,	'country-NO',	'i18n::object-country-NO',	1,	10,	0,	154,	1556105556),
(462,	'country-AC',	'i18n::object-country-AC',	1,	10,	0,	155,	1556105556),
(463,	'country-IM',	'i18n::object-country-IM',	1,	10,	0,	156,	1556105556),
(464,	'country-NF',	'i18n::object-country-NF',	1,	10,	0,	157,	1556105556),
(465,	'country-CX',	'i18n::object-country-CX',	1,	10,	0,	158,	1556105556),
(466,	'country-SH',	'i18n::object-country-SH',	1,	10,	0,	159,	1556105556),
(467,	'country-CK',	'i18n::object-country-CK',	1,	10,	0,	160,	1556105556),
(468,	'country-TC',	'i18n::object-country-TC',	1,	10,	0,	161,	1556105556),
(469,	'country-AE',	'i18n::object-country-AE',	1,	10,	0,	162,	1556105556),
(470,	'country-OM',	'i18n::object-country-OM',	1,	10,	0,	163,	1556105556),
(471,	'country-PK',	'i18n::object-country-PK',	1,	10,	0,	164,	1556105556),
(472,	'country-PW',	'i18n::object-country-PW',	1,	10,	0,	165,	1556105556),
(473,	'country-PS',	'i18n::object-country-PS',	1,	10,	0,	166,	1556105556),
(474,	'country-PA',	'i18n::object-country-PA',	1,	10,	0,	167,	1556105556),
(475,	'country-PG',	'i18n::object-country-PG',	1,	10,	0,	168,	1556105556),
(476,	'country-PY',	'i18n::object-country-PY',	1,	10,	0,	169,	1556105556),
(477,	'country-PE',	'i18n::object-country-PE',	1,	10,	0,	170,	1556105556),
(478,	'country-PN',	'i18n::object-country-PN',	1,	10,	0,	171,	1556105556),
(479,	'country-PL',	'i18n::object-country-PL',	1,	10,	0,	172,	1556105556),
(480,	'country-PT',	'i18n::object-country-PT',	1,	10,	0,	173,	1556105556),
(481,	'country-PR',	'i18n::object-country-PR',	1,	10,	0,	174,	1556105556),
(482,	'country-KR',	'i18n::object-country-KR',	1,	10,	0,	175,	1556105556),
(483,	'country-RE',	'i18n::object-country-RE',	1,	10,	0,	176,	1556105556),
(484,	'country-RW',	'i18n::object-country-RW',	1,	10,	0,	177,	1556105556),
(485,	'country-RO',	'i18n::object-country-RO',	1,	10,	0,	178,	1556105556),
(486,	'country-SV',	'i18n::object-country-SV',	1,	10,	0,	179,	1556105556),
(487,	'country-WS',	'i18n::object-country-WS',	1,	10,	0,	180,	1556105556),
(488,	'country-SM',	'i18n::object-country-SM',	1,	10,	0,	181,	1556105557),
(489,	'country-ST',	'i18n::object-country-ST',	1,	10,	0,	182,	1556105557),
(490,	'country-SA',	'i18n::object-country-SA',	1,	10,	0,	183,	1556105557),
(491,	'country-SZ',	'i18n::object-country-SZ',	1,	10,	0,	184,	1556105557),
(492,	'country-MP',	'i18n::object-country-MP',	1,	10,	0,	185,	1556105557),
(493,	'country-SC',	'i18n::object-country-SC',	1,	10,	0,	186,	1556105557),
(494,	'country-BL',	'i18n::object-country-BL',	1,	10,	0,	187,	1556105557),
(495,	'country-MF',	'i18n::object-country-MF',	1,	10,	0,	188,	1556105557),
(496,	'country-PM',	'i18n::object-country-PM',	1,	10,	0,	189,	1556105557),
(497,	'country-SN',	'i18n::object-country-SN',	1,	10,	0,	190,	1556105557),
(498,	'country-VC',	'i18n::object-country-VC',	1,	10,	0,	191,	1556105557),
(499,	'country-KN',	'i18n::object-country-KN',	1,	10,	0,	192,	1556105557),
(500,	'country-LC',	'i18n::object-country-LC',	1,	10,	0,	193,	1556105557),
(501,	'country-RS',	'i18n::object-country-RS',	1,	10,	0,	194,	1556105557),
(502,	'country-EA',	'i18n::object-country-EA',	1,	10,	0,	195,	1556105557),
(503,	'country-SG',	'i18n::object-country-SG',	1,	10,	0,	196,	1556105557),
(504,	'country-SX',	'i18n::object-country-SX',	1,	10,	0,	197,	1556105557),
(505,	'country-SY',	'i18n::object-country-SY',	1,	10,	0,	198,	1556105557),
(506,	'country-SK',	'i18n::object-country-SK',	1,	10,	0,	199,	1556105557),
(507,	'country-SI',	'i18n::object-country-SI',	1,	10,	0,	200,	1556105557),
(508,	'country-SB',	'i18n::object-country-SB',	1,	10,	0,	201,	1556105557),
(509,	'country-SO',	'i18n::object-country-SO',	1,	10,	0,	202,	1556105557),
(510,	'country-SD',	'i18n::object-country-SD',	1,	10,	0,	203,	1556105557),
(511,	'country-SR',	'i18n::object-country-SR',	1,	10,	0,	204,	1556105557),
(512,	'country-SL',	'i18n::object-country-SL',	1,	10,	0,	205,	1556105557),
(513,	'country-TJ',	'i18n::object-country-TJ',	1,	10,	0,	206,	1556105557),
(514,	'country-TH',	'i18n::object-country-TH',	1,	10,	0,	207,	1556105557),
(515,	'country-TW',	'i18n::object-country-TW',	1,	10,	0,	208,	1556105557),
(516,	'country-TZ',	'i18n::object-country-TZ',	1,	10,	0,	209,	1556105557),
(517,	'country-TG',	'i18n::object-country-TG',	1,	10,	0,	210,	1556105557),
(518,	'country-TK',	'i18n::object-country-TK',	1,	10,	0,	211,	1556105557),
(519,	'country-TO',	'i18n::object-country-TO',	1,	10,	0,	212,	1556105557),
(520,	'country-TT',	'i18n::object-country-TT',	1,	10,	0,	213,	1556105557),
(521,	'country-TA',	'i18n::object-country-TA',	1,	10,	0,	214,	1556105557),
(522,	'country-TV',	'i18n::object-country-TV',	1,	10,	0,	215,	1556105557),
(523,	'country-TN',	'i18n::object-country-TN',	1,	10,	0,	216,	1556105557),
(524,	'country-TM',	'i18n::object-country-TM',	1,	10,	0,	217,	1556105557),
(525,	'country-TR',	'i18n::object-country-TR',	1,	10,	0,	218,	1556105557),
(526,	'country-UG',	'i18n::object-country-UG',	1,	10,	0,	219,	1556105557),
(527,	'country-UZ',	'i18n::object-country-UZ',	1,	10,	0,	220,	1556105557),
(528,	'country-UA',	'i18n::object-country-UA',	1,	10,	0,	221,	1556105557),
(529,	'country-WF',	'i18n::object-country-WF',	1,	10,	0,	222,	1556105557),
(530,	'country-UY',	'i18n::object-country-UY',	1,	10,	0,	223,	1556105557),
(531,	'country-FO',	'i18n::object-country-FO',	1,	10,	0,	224,	1556105557),
(532,	'country-FM',	'i18n::object-country-FM',	1,	10,	0,	225,	1556105557),
(533,	'country-FJ',	'i18n::object-country-FJ',	1,	10,	0,	226,	1556105557),
(534,	'country-PH',	'i18n::object-country-PH',	1,	10,	0,	227,	1556105557),
(535,	'country-FI',	'i18n::object-country-FI',	1,	10,	0,	228,	1556105557),
(536,	'country-FK',	'i18n::object-country-FK',	1,	10,	0,	229,	1556105557),
(537,	'country-FR',	'i18n::object-country-FR',	1,	10,	0,	230,	1556105557),
(538,	'country-GF',	'i18n::object-country-GF',	1,	10,	0,	231,	1556105557),
(539,	'country-PF',	'i18n::object-country-PF',	1,	10,	0,	232,	1556105557),
(540,	'country-TF',	'i18n::object-country-TF',	1,	10,	0,	233,	1556105557),
(541,	'country-HR',	'i18n::object-country-HR',	1,	10,	0,	234,	1556105557),
(542,	'country-CF',	'i18n::object-country-CF',	1,	10,	0,	235,	1556105557),
(543,	'country-TD',	'i18n::object-country-TD',	1,	10,	0,	236,	1556105557),
(544,	'country-ME',	'i18n::object-country-ME',	1,	10,	0,	237,	1556105557),
(545,	'country-CZ',	'i18n::object-country-CZ',	1,	10,	0,	238,	1556105557),
(546,	'country-CL',	'i18n::object-country-CL',	1,	10,	0,	239,	1556105557),
(547,	'country-CH',	'i18n::object-country-CH',	1,	10,	0,	240,	1556105557),
(548,	'country-SE',	'i18n::object-country-SE',	1,	10,	0,	241,	1556105557),
(549,	'country-SJ',	'i18n::object-country-SJ',	1,	10,	0,	242,	1556105557),
(550,	'country-LK',	'i18n::object-country-LK',	1,	10,	0,	243,	1556105557),
(551,	'country-EC',	'i18n::object-country-EC',	1,	10,	0,	244,	1556105557),
(552,	'country-GQ',	'i18n::object-country-GQ',	1,	10,	0,	245,	1556105557),
(553,	'country-ER',	'i18n::object-country-ER',	1,	10,	0,	246,	1556105557),
(554,	'country-EE',	'i18n::object-country-EE',	1,	10,	0,	247,	1556105557),
(555,	'country-ET',	'i18n::object-country-ET',	1,	10,	0,	248,	1556105557),
(556,	'country-ZA',	'i18n::object-country-ZA',	1,	10,	0,	249,	1556105557),
(557,	'country-GS',	'i18n::object-country-GS',	1,	10,	0,	250,	1556105557),
(558,	'country-SS',	'i18n::object-country-SS',	1,	10,	0,	251,	1556105557),
(559,	'country-JM',	'i18n::object-country-JM',	1,	10,	0,	252,	1556105557),
(560,	'country-JP',	'i18n::object-country-JP',	1,	10,	0,	253,	1556105557),
(561,	'emarket-payment-type-yandex-kassa',	'i18n::object-payment-type-yandex-kassa',	1,	46,	0,	13,	1556105557),
(562,	'emarket-item-type-custom',	'Пользовательский',	1,	41,	0,	3,	1556105557),
(563,	'emarket-item-type-trade-offer',	'Торговое предложение',	1,	41,	0,	4,	1556105557),
(564,	'25ec3f9da5444fe6a125910137ec28200d4eaaa8',	'i18n::object-status-publish',	0,	2,	0,	1,	1556105557),
(565,	'tax-rate-27961',	'Без НДС',	1,	27,	0,	1,	1556105557),
(566,	'russianpost_wrapper_simple',	'i18n::object-wrapper_simple',	0,	14,	0,	1,	1556105557),
(567,	'payment-subject-28225',	'Товар',	1,	28,	0,	1,	1556105557),
(568,	'payment-mode-28238',	'Полная предоплата',	1,	29,	0,	1,	1556105557),
(569,	'8a6f804b3690f0592a3f17ed980a9df5f16bacd8',	'i18n::object-status-unpublish',	0,	2,	0,	2,	1556105557),
(570,	'russianpost_registered_wrapper',	'i18n::object-registered_wrapper',	0,	14,	0,	2,	1556105557),
(571,	'tax-rate-27962',	'НДС по ставке 0%',	1,	27,	0,	2,	1556105557),
(572,	'payment-subject-28226',	'Подакцизный товар',	1,	28,	0,	2,	1556105557),
(573,	'payment-mode-28239',	'Частичная предоплата',	1,	29,	0,	2,	1556105557),
(574,	'f4df5d14f5a1aeeebfe3db75b73e57fef8bcc4f2',	'i18n::object-status-preunpublish',	0,	2,	0,	3,	1556105557),
(575,	'russianpost_wrapper_with_declared_value',	'i18n::object-wrapper_with_declared_value',	0,	14,	0,	3,	1556105557),
(576,	'tax-rate-27963',	'НДС по ставке 10%',	1,	27,	0,	3,	1556105557),
(577,	'payment-subject-28227',	'Работа',	1,	28,	0,	3,	1556105557),
(578,	'payment-mode-28240',	'Аванс',	1,	29,	0,	3,	1556105557),
(579,	'russianpost_registered_wrapper_first_class',	'i18n::object-registered_wrapper_first_class',	0,	14,	0,	4,	1556105557),
(580,	'tax-rate-27964',	'НДС по ставке 20%',	1,	27,	0,	4,	1556105557),
(581,	'payment-subject-28228',	'Услуга',	1,	28,	0,	4,	1556105557),
(582,	'payment-mode-28241',	'Полный расчет',	1,	29,	0,	4,	1556105557),
(583,	'russianpost_wrapper_first_class_with_declared_value',	'i18n::object-wrapper_first_class_with_declared_value',	0,	14,	0,	5,	1556105557),
(584,	'tax-rate-27965',	'НДС по расчетной ставке 10/110',	1,	27,	0,	5,	1556105557),
(585,	'payment-subject-28229',	'Ставка в азартной игре',	1,	28,	0,	5,	1556105557),
(586,	'payment-mode-28242',	'Частичный расчет и кредит',	1,	29,	0,	5,	1556105557),
(587,	'tax-rate-27966',	'НДС  по расчетной ставке 20/120',	1,	27,	0,	6,	1556105557),
(588,	'russianpost_parcel',	'i18n::object-parcel',	0,	14,	0,	6,	1556105557),
(589,	'payment-subject-28230',	'Выигрыш в азартной игре',	1,	28,	0,	6,	1556105557),
(590,	'payment-mode-28243',	'Кредит',	1,	29,	0,	6,	1556105557),
(591,	'russianpost_parcel_with_declared_value',	'i18n::object-parcel_with_declared_value',	0,	14,	0,	7,	1556105557),
(592,	'payment-subject-28231',	'Лотерейный билет',	1,	28,	0,	7,	1556105557),
(593,	'payment-mode-28244',	'Выплата по кредиту',	1,	29,	0,	7,	1556105557),
(594,	'russianpost_parcel_first_class',	'i18n::object-parcel_first_class',	0,	14,	0,	8,	1556105557),
(595,	'payment-subject-28232',	'Выигрыш в лотерею',	1,	28,	0,	8,	1556105557),
(596,	'russianpost_parcel_first_class_with_declared_value',	'i18n::object-parcel_first_class_with_declared_value',	0,	14,	0,	9,	1556105557),
(597,	'payment-subject-28233',	'Результаты интеллектуальной деятельности',	1,	28,	0,	9,	1556105557),
(598,	'russianpost_ems_standart',	'i18n::object-ems_standart',	0,	14,	0,	10,	1556105558),
(599,	'payment-subject-28234',	'Платеж',	1,	28,	0,	10,	1556105558),
(600,	'russianpost_ems_declared_value',	'i18n::object-ems_declared_value',	0,	14,	0,	11,	1556105558),
(601,	'payment-subject-28235',	'Агентское вознаграждение',	1,	28,	0,	11,	1556105558),
(602,	'payment-subject-28236',	'Несколько вариантов',	1,	28,	0,	12,	1556105558),
(603,	'payment-subject-28237',	'i18n::object-social_categories_other',	1,	28,	0,	13,	1556105558),
(604,	'emarket-discountmodificator-768-27135',	'i18n::object-test_percent_modifier',	0,	56,	0,	1,	1556105558),
(605,	'emarket-discountrule-798-27438',	'i18n::object-users',	0,	57,	0,	1,	1556105558),
(606,	'3fb6d39f5279c04f1bfec5a7cc13783a45d00141',	'i18n::object-commerceml_data_format',	0,	35,	0,	1,	1556105558),
(607,	'2c4eff97ef278f12c4461309e84dd0627bd4a37b',	'i18n::object-umiDump_data_format',	0,	35,	0,	2,	1556105558),
(608,	'23abbfa28d922d786d39218e3aa26719ad16ee47',	'i18n::object-csv_dataformat',	0,	35,	0,	3,	1556105558),
(609,	'cdc4a1f4e0ee63b2359d3dec91efe33d2a296c92',	'i18n::object-umi_export_umiDump',	0,	35,	0,	4,	1556105558),
(610,	'2ca45ca1c710cf65f451f098f4bf683082566200',	'i18n::object-commerceml_catalog',	0,	36,	0,	1,	1556105558),
(611,	'681665ea8b72237d1677dfaf7339ef7a7ec40269',	'i18n::object-commerceml_offer_list',	0,	36,	0,	2,	1556105558),
(612,	'8e9874cd7a1b20f4b00c95fd7126f2112101c2ac',	'i18n::object-commerceml_order_list',	0,	36,	0,	3,	1556105558),
(613,	'ff6c38d4ab12cda6c035cf36a4afb829049fbf21',	'i18n::object-yml_catalog',	0,	36,	0,	4,	1556105558),
(614,	'b8c554e9ce8127f2405c189857cfd6831dcc2f5d',	'i18n::object-umiDump_data_format',	0,	36,	0,	5,	1556105558),
(615,	'de2d91f2111e74d1fab49ffed3220fc4b1d51d42',	'i18n::object-csv_dataformat',	0,	36,	0,	6,	1556105558),
(616,	'ccc9bf34f683f8e4ecf2ffe2910f3d8cda2b6852',	'i18n::object-umi_export_umiDump',	0,	36,	0,	7,	1556105558),
(617,	'exchange-export-commerceml',	'i18n::object-catalog_export',	0,	36,	0,	8,	1556105558),
(618,	'system-guest',	'i18n::object-guest',	1,	54,	0,	2,	1556115658),
(619,	'users-users-2374',	'i18n::object-zaregistrirovannye_pol_zovateli',	1,	39,	0,	2,	1556105558),
(620,	'emarket-currency-27226',	'i18n::object-rur',	0,	21,	0,	1,	1556105558),
(621,	'emarket-currency-27227',	'i18n::object-usd',	0,	21,	0,	2,	1556105558),
(622,	'emarket-currency-27228',	'i18n::object-euro',	0,	21,	0,	3,	1556105558),
(623,	'',	'Общие поля',	0,	99,	182,	1,	1558686010),
(624,	'',	'Главная',	0,	103,	182,	2,	1558626007),
(625,	'',	'i18n::object-type-blue',	0,	100,	182,	1,	1556122536),
(626,	'',	'i18n::object-type-green',	0,	100,	182,	2,	1556122548),
(627,	'',	'Оранжевый',	0,	100,	182,	3,	1556122561),
(628,	'',	'Фиолетовый',	0,	100,	182,	4,	1556122687),
(629,	'',	'i18n::object-type-red',	0,	100,	182,	5,	1556122586),
(630,	'',	'Поделиться ВКонтакте',	0,	101,	182,	1,	1557915290),
(631,	'',	'Поделиться в Одноклассниках',	0,	101,	182,	2,	1557915327),
(632,	'',	'Поделиться в Моём мире',	0,	101,	182,	3,	1557915348),
(633,	'',	'Поделиться в Facebook',	0,	101,	182,	4,	1557915369),
(634,	'',	'Поделиться в Twitter',	0,	101,	182,	5,	1557915392),
(635,	'',	'Поделиться в LiveJournal',	0,	101,	182,	6,	1557915409),
(636,	'',	'О нас',	0,	61,	182,	3,	1558013645),
(637,	'',	'Контакты',	0,	73,	182,	4,	1558529814),
(638,	'',	'Новости',	0,	7,	182,	5,	1558081679),
(639,	'',	'Как подобрать подходящий самосвал?',	0,	60,	182,	6,	1558098946),
(640,	'',	'Обновление парка спецтехники',	0,	60,	182,	7,	1558098985),
(641,	'',	'Весеннее таяние цен',	0,	60,	182,	8,	1558099009),
(642,	'',	'Скидка на аренду спецтехники на длительный срок',	0,	60,	182,	9,	1558099036),
(643,	'',	'Аренда спецтехники',	0,	86,	182,	10,	1558424540),
(644,	'',	'Аренда бульдозеров',	0,	86,	182,	11,	1579615391),
(645,	'',	'Аренда самосвалов',	0,	86,	182,	12,	1579615392),
(646,	'',	'Аренда автокранов',	0,	86,	182,	13,	1579615392),
(647,	'',	'Аренда гидромолотов',	0,	86,	182,	14,	1579615392),
(648,	'',	'Аренда вибропогружателей',	0,	86,	182,	15,	1579615393),
(649,	'',	'Аренда экскаваторов',	0,	86,	182,	16,	1579615393),
(650,	'',	'Аренда асфальтоукладчика',	0,	86,	182,	17,	1579615393),
(651,	'',	'Аренда вездехода',	0,	86,	182,	18,	1579615410),
(652,	'',	'Аренда бульдозера Komatsu D31E-20',	0,	87,	182,	19,	1558699259),
(653,	'',	'Аренда бульдозера Komatsu D21A-7',	0,	87,	182,	20,	1558425670),
(654,	'',	'Самосвал 18-20 кубов',	0,	87,	182,	21,	1558699283),
(655,	'',	'Самосвал 10-12 кубов',	0,	87,	182,	22,	1558699260),
(656,	'',	'Автокран 25 тонн КС-55713',	0,	87,	182,	23,	1558699301),
(657,	'',	'Автокран 14-16 тонн КС-35715',	0,	87,	182,	24,	1558699263),
(658,	'',	'Экскаватор-планировщик УДС 114',	0,	87,	182,	25,	1558699274),
(659,	'',	'Экскаватор гусеничный с планировочным ковшом',	0,	87,	182,	26,	1558699310),
(660,	'',	'Асфальтоукладчик Vogele 800',	0,	87,	182,	27,	1558699267),
(661,	'',	'Асфальтоукладчик тротуарный Vogele 1300-2',	0,	87,	182,	28,	1558513478),
(662,	'',	'Самосвал-вездеход ',	0,	87,	182,	29,	1558699288),
(663,	'',	'Фото техники',	0,	77,	182,	30,	1558099747),
(664,	'',	'Гидромолоты',	0,	77,	182,	31,	1579615513),
(665,	'',	'Вибропогружатели',	0,	77,	182,	32,	1579615514),
(666,	'',	'Гидромолот JCB',	0,	78,	182,	33,	1558105777),
(667,	'',	'Гидромолот CAT',	0,	78,	182,	34,	1558105854),
(668,	'',	'Гидромолот DOOSAN',	0,	78,	182,	35,	1558105909),
(669,	'',	'Вибропогружатель JCB',	0,	78,	182,	36,	1558106042),
(670,	'',	'Вибропогружатель VOLVO',	0,	78,	182,	37,	1558106177),
(671,	'',	'Вибропогружатель HITACHI',	0,	78,	182,	38,	1558106213),
(722,	'',	'Гидромолот С3ПО',	0,	87,	182,	45,	1558699530),
(723,	'',	'Вибропогружатель Р2Д2',	0,	87,	182,	46,	1558699559),
(727,	'',	'Администратор',	0,	76,	182,	1,	1558532027),
(728,	'',	'Администратор',	0,	102,	182,	1,	1558534252),
(729,	'',	'Обратная связь',	0,	75,	182,	1,	1558598234),
(730,	'',	'Администратор',	0,	102,	182,	2,	1558596268),
(731,	'',	'Администратор',	0,	102,	182,	3,	1558598156),
(732,	'',	'Администратор',	0,	102,	182,	4,	1558598183),
(733,	'',	'Администратор',	0,	102,	182,	5,	1558598211),
(734,	'',	'Администратор',	0,	102,	182,	6,	1558598256),
(735,	'',	'Администратор',	0,	102,	182,	7,	1558598313),
(743,	'',	'Администратор',	0,	102,	182,	8,	1558607571),
(744,	'',	'Администратор',	0,	102,	182,	9,	1558607930),
(745,	'',	'Администратор',	0,	102,	618,	10,	1558611802),
(746,	'',	'Администратор',	0,	102,	618,	11,	1558611936),
(747,	'',	'Администратор',	0,	102,	618,	12,	1558613091),
(748,	'',	'Администратор',	0,	102,	618,	13,	1558613125),
(749,	'',	'Администратор',	0,	102,	618,	14,	1558613159),
(750,	'',	'Администратор',	0,	102,	618,	15,	1558613177),
(751,	'emarket-order-payment-status-waiting',	'i18n::object-order-payment-status-waiting',	1,	48,	0,	6,	1600695377),
(752,	'emarket-order-payment-status-refund',	'i18n::object-order-payment-status-refund',	1,	48,	0,	7,	1600695377);

DROP TABLE IF EXISTS `cms3_objects_expiration`;
CREATE TABLE `cms3_objects_expiration` (
  `obj_id` int(10) unsigned NOT NULL,
  `entrytime` int(10) unsigned NOT NULL,
  `expire` int(10) unsigned NOT NULL,
  PRIMARY KEY (`obj_id`),
  KEY `FK_ObjectsExpire to objects` (`obj_id`),
  KEY `entrytime` (`entrytime`,`expire`),
  CONSTRAINT `FK_ObjectsExpire to objects` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_object_content`;
CREATE TABLE `cms3_object_content` (
  `obj_id` int(10) unsigned DEFAULT NULL,
  `field_id` int(10) unsigned DEFAULT NULL,
  `int_val` bigint(20) DEFAULT NULL,
  `varchar_val` varchar(255) DEFAULT NULL,
  `text_val` mediumtext DEFAULT NULL,
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


DROP TABLE IF EXISTS `cms3_object_content_cnt`;
CREATE TABLE `cms3_object_content_cnt` (
  `obj_id` int(10) unsigned DEFAULT NULL,
  `field_id` int(10) unsigned DEFAULT NULL,
  `cnt` int(10) DEFAULT 0,
  KEY `FK_Contents_Counters to object relation` (`obj_id`),
  KEY `FK_Contents_Counters field id relation` (`field_id`),
  CONSTRAINT `FK_Contents_Counters field id relation` FOREIGN KEY (`field_id`) REFERENCES `cms3_object_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Contents_Counters to object relation` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_object_domain_id_list`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_object_fields`;
CREATE TABLE `cms3_object_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT 0,
  `field_type_id` int(10) unsigned DEFAULT NULL,
  `is_inheritable` tinyint(1) DEFAULT 0,
  `is_visible` tinyint(1) DEFAULT 1,
  `guide_id` int(10) unsigned DEFAULT NULL,
  `in_search` tinyint(1) DEFAULT 1,
  `in_filter` tinyint(1) DEFAULT 1,
  `tip` varchar(255) DEFAULT NULL,
  `is_required` tinyint(1) DEFAULT NULL,
  `restriction_id` int(10) unsigned DEFAULT NULL,
  `sortable` tinyint(4) DEFAULT 0,
  `is_system` tinyint(1) DEFAULT 0,
  `is_important` tinyint(1) DEFAULT 0,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_object_fields_restrictions`;
CREATE TABLE `cms3_object_fields_restrictions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_prefix` varchar(64) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `field_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Field restriction to field type relation_FK` (`field_type_id`),
  CONSTRAINT `FK_Field restriction to field type relation` FOREIGN KEY (`field_type_id`) REFERENCES `cms3_object_field_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_object_field_groups`;
CREATE TABLE `cms3_object_field_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type_id` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_visible` tinyint(1) DEFAULT NULL,
  `ord` int(11) DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT 0,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_object_field_types`;
CREATE TABLE `cms3_object_field_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `data_type` enum('int','string','text','relation','file','img_file','swf_file','bool','date','boolean','wysiwyg','password','tags','symlink','price','formula','float','counter','optioned','video_file','color','link_to_object_type','multiple_image','domain_id','domain_id_list','offer_id_list','offer_id','multiple_file','lang_id','lang_id_list') DEFAULT NULL,
  `is_multiple` tinyint(1) DEFAULT 0,
  `is_unsigned` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `data_type` (`data_type`),
  KEY `is_multiple` (`is_multiple`),
  KEY `is_unsigned` (`is_unsigned`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_object_files`;
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


DROP TABLE IF EXISTS `cms3_object_images`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_object_lang_id_list`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_object_offer_id_list`;
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


DROP TABLE IF EXISTS `cms3_object_types`;
CREATE TABLE `cms3_object_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT 0,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `is_guidable` tinyint(1) DEFAULT 0,
  `is_public` tinyint(1) DEFAULT 0,
  `hierarchy_type_id` int(10) unsigned DEFAULT NULL,
  `sortable` tinyint(4) DEFAULT 0,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_object_type_tree`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_offer_list`;
CREATE TABLE `cms3_offer_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `vendor_code` varchar(255) DEFAULT NULL,
  `bar_code` varchar(255) DEFAULT NULL,
  `total_count` bigint(20) unsigned DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `order` bigint(20) unsigned DEFAULT 0,
  `weight` bigint(20) unsigned DEFAULT 0,
  `width` bigint(20) unsigned DEFAULT 0,
  `length` bigint(20) unsigned DEFAULT 0,
  `height` bigint(20) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendor_code` (`vendor_code`),
  KEY `offer to type id` (`type_id`),
  KEY `offer to data object id` (`data_object_id`),
  CONSTRAINT `offer to data object id` FOREIGN KEY (`data_object_id`) REFERENCES `cms3_objects` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `offer to type id` FOREIGN KEY (`type_id`) REFERENCES `cms3_object_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_offer_price_list`;
CREATE TABLE `cms3_offer_price_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` double unsigned NOT NULL,
  `offer_id` int(10) unsigned NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `is_main` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `offer price to offer` (`offer_id`),
  KEY `offer price to currency` (`currency_id`),
  KEY `offer price to type` (`type_id`),
  CONSTRAINT `offer price to currency` FOREIGN KEY (`currency_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `offer price to offer` FOREIGN KEY (`offer_id`) REFERENCES `cms3_offer_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `offer price to type` FOREIGN KEY (`type_id`) REFERENCES `cms3_offer_price_type_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_offer_price_type_list`;
CREATE TABLE `cms3_offer_price_type_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_permissions`;
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


DROP TABLE IF EXISTS `cms3_push_message_list`;
CREATE TABLE `cms3_push_message_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `click_action` varchar(255) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `is_send` tinyint(1) DEFAULT 0,
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


DROP TABLE IF EXISTS `cms3_push_subscriber_list`;
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


DROP TABLE IF EXISTS `cms3_push_topic_list`;
CREATE TABLE `cms3_push_topic_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `is_locked` tinyint(1) DEFAULT 0,
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


DROP TABLE IF EXISTS `cms3_redirects`;
CREATE TABLE `cms3_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` text NOT NULL,
  `target` text NOT NULL,
  `status` int(10) unsigned DEFAULT 301,
  `made_by_user` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `source` (`source`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_response_error_entry_list`;
CREATE TABLE `cms3_response_error_entry_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` text NOT NULL,
  `code` int(10) unsigned NOT NULL,
  `hits_count` int(10) unsigned DEFAULT 0,
  `domain_id` int(10) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms3_response_error_entry_list order by hits count` (`hits_count`),
  KEY `cms3_response_error_entry_list order by update time` (`update_time`),
  KEY `cms3_response_error_entry_list domain_id` (`domain_id`),
  CONSTRAINT `cms3_response_error_entry_list domain_id` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_search`;
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


DROP TABLE IF EXISTS `cms3_search_index`;
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


DROP TABLE IF EXISTS `cms3_search_index_words`;
CREATE TABLE `cms3_search_index_words` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_sliders`;
CREATE TABLE `cms3_sliders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `domain_id` int(11) unsigned NOT NULL,
  `language_id` int(11) unsigned NOT NULL,
  `sliding_speed` int(11) unsigned DEFAULT NULL,
  `sliding_delay` int(11) unsigned DEFAULT NULL,
  `sliding_loop_enable` tinyint(1) DEFAULT 0,
  `sliding_auto_play_enable` tinyint(1) DEFAULT 0,
  `sliders_random_order_enable` tinyint(1) DEFAULT 0,
  `slides_count` int(11) unsigned DEFAULT 0,
  `custom_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id from domains` (`domain_id`),
  KEY `id from languages` (`language_id`),
  CONSTRAINT `id from domains` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id from languages` FOREIGN KEY (`language_id`) REFERENCES `cms3_langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_slides`;
CREATE TABLE `cms3_slides` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slider_id` int(11) unsigned NOT NULL,
  `is_active` tinyint(1) DEFAULT 0,
  `title` varchar(1024) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `text` mediumtext DEFAULT NULL,
  `link` varchar(1024) DEFAULT NULL,
  `open_in_new_tab` tinyint(1) DEFAULT 1,
  `order` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `slider_id and is_active with order` (`slider_id`,`is_active`,`order`),
  CONSTRAINT `id from sliders` FOREIGN KEY (`slider_id`) REFERENCES `cms3_sliders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_stock_balance_list`;
CREATE TABLE `cms3_stock_balance_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` int(10) unsigned NOT NULL,
  `stock_id` int(10) unsigned NOT NULL,
  `value` bigint(20) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `stock balance to offer` (`offer_id`),
  KEY `stock balance to stock` (`stock_id`),
  CONSTRAINT `stock balance to offer` FOREIGN KEY (`offer_id`) REFERENCES `cms3_offer_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock balance to stock` FOREIGN KEY (`stock_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms3_templates`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_backup`;
CREATE TABLE `cms_backup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` int(11) DEFAULT NULL,
  `changed_module` varchar(128) DEFAULT NULL,
  `changed_method` varchar(128) DEFAULT NULL,
  `param` text DEFAULT NULL,
  `param0` mediumtext DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_permissions`;
CREATE TABLE `cms_permissions` (
  `module` varchar(64) DEFAULT NULL,
  `method` varchar(64) DEFAULT NULL,
  `owner_id` int(10) unsigned DEFAULT NULL,
  `allow` tinyint(4) DEFAULT 1,
  KEY `module` (`module`),
  KEY `method` (`method`),
  KEY `owner_id` (`owner_id`),
  KEY `allow` (`allow`),
  CONSTRAINT `FK_PermissionOwnerId_To_ObjectId` FOREIGN KEY (`owner_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_reg`;
CREATE TABLE `cms_reg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `var` varchar(48) NOT NULL,
  `val` varchar(255) DEFAULT NULL,
  `rel` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `var` (`var`),
  KEY `rel` (`rel`,`var`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_sitemap`;
CREATE TABLE `cms_sitemap` (
  `id` int(11) NOT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  `link` varchar(1024) NOT NULL,
  `sort` tinyint(4) NOT NULL,
  `priority` double NOT NULL DEFAULT 0,
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


DROP TABLE IF EXISTS `cms_sitemap_images`;
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


DROP TABLE IF EXISTS `cms_stat_dispatches`;
CREATE TABLE `cms_stat_dispatches` (
  `hash` varchar(10) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_domains`;
CREATE TABLE `cms_stat_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entrytime` int(11) DEFAULT NULL,
  `refer_domain` text DEFAULT NULL,
  `sess_id` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sess_id` (`sess_id`(4))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_entry_points`;
CREATE TABLE `cms_stat_entry_points` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `host_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `url` (`url`(1)),
  KEY `host_id` (`host_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_entry_points_events`;
CREATE TABLE `cms_stat_entry_points_events` (
  `entry_point_id` int(11) unsigned DEFAULT NULL,
  `event_id` int(11) unsigned DEFAULT NULL,
  KEY `entry_point_id` (`entry_point_id`),
  KEY `event_id` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_events`;
CREATE TABLE `cms_stat_events` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` text DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `profit` float(9,2) DEFAULT 0.00,
  `host_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`type`),
  KEY `host_id` (`host_id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_events_collected`;
CREATE TABLE `cms_stat_events_collected` (
  `event_id` int(11) unsigned DEFAULT NULL,
  `hit_id` int(11) unsigned DEFAULT NULL,
  KEY `event_id` (`event_id`,`hit_id`),
  KEY `hit_id` (`hit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_events_rel`;
CREATE TABLE `cms_stat_events_rel` (
  `metaevent_id` int(11) unsigned DEFAULT NULL,
  `event_id` int(11) unsigned DEFAULT NULL,
  UNIQUE KEY `metaevent_id` (`metaevent_id`,`event_id`),
  KEY `event_id` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_events_urls`;
CREATE TABLE `cms_stat_events_urls` (
  `event_id` int(11) unsigned DEFAULT NULL,
  `page_id` int(11) unsigned DEFAULT NULL,
  UNIQUE KEY `event_id` (`event_id`,`page_id`),
  KEY `page_id` (`page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_finders`;
CREATE TABLE `cms_stat_finders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bot_name` text DEFAULT NULL,
  `pattern` text DEFAULT NULL,
  `alias` text DEFAULT NULL,
  `domain` text DEFAULT NULL,
  `utf` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_hits`;
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


DROP TABLE IF EXISTS `cms_stat_holidays`;
CREATE TABLE `cms_stat_holidays` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  `day` tinyint(2) DEFAULT NULL,
  `month` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `day_month` (`day`,`month`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_pages`;
CREATE TABLE `cms_stat_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uri` text DEFAULT NULL,
  `host_id` int(11) unsigned DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `section` (`section`),
  KEY `uri` (`uri`(4)),
  KEY `host_id` (`host_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_paths`;
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


DROP TABLE IF EXISTS `cms_stat_phrases`;
CREATE TABLE `cms_stat_phrases` (
  `phrase` text DEFAULT NULL,
  `domain` text DEFAULT NULL,
  `finder_id` int(11) DEFAULT NULL,
  `entrytime` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_sites`;
CREATE TABLE `cms_stat_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  `group_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_sites_groups`;
CREATE TABLE `cms_stat_sites_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_sources`;
CREATE TABLE `cms_stat_sources` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `src_type` tinyint(4) unsigned DEFAULT NULL,
  `concrete_src_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `src_type` (`src_type`,`concrete_src_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_sources_coupon`;
CREATE TABLE `cms_stat_sources_coupon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `profit` float(9,2) DEFAULT NULL,
  `descript` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_sources_coupon_events`;
CREATE TABLE `cms_stat_sources_coupon_events` (
  `coupon_id` int(11) unsigned DEFAULT NULL,
  `event_id` int(11) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_sources_openstat`;
CREATE TABLE `cms_stat_sources_openstat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(11) unsigned DEFAULT 0,
  `campaign_id` int(11) unsigned DEFAULT 0,
  `ad_id` int(11) unsigned DEFAULT NULL,
  `source_id` int(11) unsigned DEFAULT NULL,
  `path_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `source_id` (`source_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;


DROP TABLE IF EXISTS `cms_stat_sources_openstat_ad`;
CREATE TABLE `cms_stat_sources_openstat_ad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;


DROP TABLE IF EXISTS `cms_stat_sources_openstat_campaign`;
CREATE TABLE `cms_stat_sources_openstat_campaign` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;


DROP TABLE IF EXISTS `cms_stat_sources_openstat_service`;
CREATE TABLE `cms_stat_sources_openstat_service` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;


DROP TABLE IF EXISTS `cms_stat_sources_openstat_source`;
CREATE TABLE `cms_stat_sources_openstat_source` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;


DROP TABLE IF EXISTS `cms_stat_sources_pr`;
CREATE TABLE `cms_stat_sources_pr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_sources_pr_events`;
CREATE TABLE `cms_stat_sources_pr_events` (
  `pr_id` int(11) unsigned DEFAULT NULL,
  `event_id` int(11) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_sources_pr_sites`;
CREATE TABLE `cms_stat_sources_pr_sites` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pr_id` int(11) unsigned DEFAULT NULL,
  `url` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_sources_search`;
CREATE TABLE `cms_stat_sources_search` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `engine_id` int(11) unsigned DEFAULT NULL,
  `text_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `engine_id` (`engine_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_sources_search_engines`;
CREATE TABLE `cms_stat_sources_search_engines` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  `url_mask` char(255) DEFAULT NULL,
  `varname` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_sources_search_queries`;
CREATE TABLE `cms_stat_sources_search_queries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `text` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_sources_sites`;
CREATE TABLE `cms_stat_sources_sites` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uri` text DEFAULT NULL,
  `domain` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `domain` (`domain`),
  KEY `uri` (`uri`(255)),
  KEY `id_domain` (`id`,`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_sources_sites_domains`;
CREATE TABLE `cms_stat_sources_sites_domains` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_sources_ticket`;
CREATE TABLE `cms_stat_sources_ticket` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_users`;
CREATE TABLE `cms_stat_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(32) DEFAULT NULL,
  `first_visit` datetime DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `os_id` int(11) unsigned DEFAULT NULL,
  `browser_id` int(11) unsigned DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `location` text DEFAULT NULL,
  `js_version` varchar(5) DEFAULT NULL,
  `host_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `first_visit` (`first_visit`),
  KEY `session_id` (`session_id`),
  KEY `host_id` (`host_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_users_browsers`;
CREATE TABLE `cms_stat_users_browsers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_stat_users_os`;
CREATE TABLE `cms_stat_users_os` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `umi_event_feeds`;
CREATE TABLE `umi_event_feeds` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` bigint(20) DEFAULT NULL,
  `params` mediumtext DEFAULT NULL,
  `type_id` varchar(255) NOT NULL,
  `element_id` int(11) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `umi_event_types`;
CREATE TABLE `umi_event_types` (
  `id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `umi_event_users`;
CREATE TABLE `umi_event_users` (
  `id` int(11) unsigned NOT NULL,
  `last_check_in` bigint(20) DEFAULT NULL,
  `settings` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `umi_event_user_history`;
CREATE TABLE `umi_event_user_history` (
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- 2020-09-21 13:55:29
