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


-- Dumping database structure for proyecto
CREATE DATABASE IF NOT EXISTS `proyecto` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `proyecto`;

-- Dumping structure for table proyecto.alergia
CREATE TABLE IF NOT EXISTS `alergia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table proyecto.alergia: ~0 rows (approximately)
/*!40000 ALTER TABLE `alergia` DISABLE KEYS */;
/*!40000 ALTER TABLE `alergia` ENABLE KEYS */;

-- Dumping structure for table proyecto.baile
CREATE TABLE IF NOT EXISTS `baile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table proyecto.baile: ~3 rows (approximately)
/*!40000 ALTER TABLE `baile` DISABLE KEYS */;
REPLACE INTO `baile` (`id`, `nombre`) VALUES
	(1, 'salsa'),
	(2, 'zumba'),
	(3, 'folklor');
/*!40000 ALTER TABLE `baile` ENABLE KEYS */;

-- Dumping structure for table proyecto.cirugia
CREATE TABLE IF NOT EXISTS `cirugia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cirugia_user` (`user_id`),
  CONSTRAINT `fk_cirugia_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table proyecto.cirugia: ~0 rows (approximately)
/*!40000 ALTER TABLE `cirugia` DISABLE KEYS */;
/*!40000 ALTER TABLE `cirugia` ENABLE KEYS */;

-- Dumping structure for table proyecto.deporte
CREATE TABLE IF NOT EXISTS `deporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table proyecto.deporte: ~3 rows (approximately)
/*!40000 ALTER TABLE `deporte` DISABLE KEYS */;
REPLACE INTO `deporte` (`id`, `nombre`) VALUES
	(1, 'futbol'),
	(2, 'baloncesto'),
	(3, 'voleibol');
/*!40000 ALTER TABLE `deporte` ENABLE KEYS */;

-- Dumping structure for table proyecto.e_cardiacas
CREATE TABLE IF NOT EXISTS `e_cardiacas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_e_cardiacas_user` (`user_id`),
  CONSTRAINT `fk_e_cardiacas_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table proyecto.e_cardiacas: ~0 rows (approximately)
/*!40000 ALTER TABLE `e_cardiacas` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_cardiacas` ENABLE KEYS */;

-- Dumping structure for table proyecto.e_respiratorias
CREATE TABLE IF NOT EXISTS `e_respiratorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_e_respiratorias_user` (`user_id`),
  CONSTRAINT `fk_e_respiratorias_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table proyecto.e_respiratorias: ~0 rows (approximately)
/*!40000 ALTER TABLE `e_respiratorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_respiratorias` ENABLE KEYS */;

-- Dumping structure for table proyecto.sexo
CREATE TABLE IF NOT EXISTS `sexo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table proyecto.sexo: ~2 rows (approximately)
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
REPLACE INTO `sexo` (`id`, `nombre`) VALUES
	(1, 'masculino'),
	(2, 'femenino');
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;

-- Dumping structure for table proyecto.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `edad` int(11) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '',
  `fecNac` date NOT NULL COMMENT 'Fecha de nacimiento',
  `sexo` int(11) DEFAULT NULL COMMENT '1 = masculino, 2 = femenino',
  `estatura` int(11) NOT NULL,
  `peso` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_user_sexo` (`sexo`),
  CONSTRAINT `fk_user_sexo` FOREIGN KEY (`sexo`) REFERENCES `sexo` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table proyecto.user: ~0 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
