-- --------------------------------------------------------
-- Хост:                         localhost
-- Версия сервера:               5.7.7-rc-log - MySQL Community Server (GPL)
-- ОС Сервера:                   Win64
-- HeidiSQL Версия:              9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры базы данных parser
DROP DATABASE IF EXISTS `parser`;
CREATE DATABASE IF NOT EXISTS `parser` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `parser`;


-- Дамп структуры для таблица parser.detailedinfos
DROP TABLE IF EXISTS `detailedinfos`;
CREATE TABLE IF NOT EXISTS `detailedinfos` (
  `Id` int(11) NOT NULL,
  `Horscop` varchar(45) DEFAULT NULL,
  `Goal` text,
  `Height` int(11) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL,
  `Build` varchar(45) DEFAULT NULL,
  `Ethnity` varchar(45) DEFAULT NULL,
  `Relationship` varchar(45) DEFAULT NULL,
  `Education` varchar(45) DEFAULT NULL,
  `SexOrient` varchar(45) DEFAULT NULL,
  `Smoker` varchar(45) DEFAULT NULL,
  `Drink` varchar(45) DEFAULT NULL,
  `Kids` varchar(45) DEFAULT NULL,
  `Income` varchar(45) DEFAULT NULL,
  `Accomodation` varchar(45) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Offline` varchar(100) DEFAULT NULL,
  `Location` varchar(500) DEFAULT NULL,
  `SearchFor` varchar(100) DEFAULT NULL,
  `SfStartAge` int(11) DEFAULT NULL,
  `SfEndAge` int(11) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Actual` tinyint(1) DEFAULT NULL,
  `Info_UserId` varchar(100) NOT NULL,
  `LinkMamba` varchar(1024) DEFAULT NULL,
  `LinkMail` varchar(1024) DEFAULT NULL,
  `Name` varchar(1024) DEFAULT NULL,
  `Message` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Detailed_Info_idx` (`Info_UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы parser.detailedinfos: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `detailedinfos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detailedinfos` ENABLE KEYS */;


-- Дамп структуры для таблица parser.infos
DROP TABLE IF EXISTS `infos`;
CREATE TABLE IF NOT EXISTS `infos` (
  `UserId` varchar(100) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `PhQuantity` int(11) DEFAULT NULL,
  `Age` int(11) NOT NULL,
  `SearchFor` varchar(100) DEFAULT NULL,
  `SfStartAge` int(11) DEFAULT NULL,
  `SfEndAge` int(11) DEFAULT NULL,
  `Link` varchar(255) NOT NULL,
  `Date` date DEFAULT NULL,
  `Enable` bit(1) DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы parser.infos: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `infos` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
