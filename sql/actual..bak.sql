-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.6.22-log - MySQL Community Server (GPL)
-- ОС Сервера:                   Win32
-- HeidiSQL Версия:              9.1.0.4867
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

-- Дамп данных таблицы parser.infos: ~110 rows (приблизительно)
/*!40000 ALTER TABLE `infos` DISABLE KEYS */;
REPLACE INTO `infos` (`UserId`, `Name`, `Location`, `PhQuantity`, `Age`, `SearchFor`, `SfStartAge`, `SfEndAge`, `Link`, `Date`, `Enable`) VALUES
	('DunyaMaklaud', 'Дарья', 'Россия, Евпатория', NULL, 24, 'парня', 0, 0, 'http://www.mamba.ru/ru/DunyaMaklaud?hit=10&fromsearch&sp=12', '2015-05-30', b'1'),
	('dywu4ka20', 'Манюня', 'Россия, Симферополь', NULL, 23, 'парня или девушку', 26, 40, 'http://www.mamba.ru/ru/dywu4ka20?hit=10&fromsearch&sp=3', '2015-05-30', b'1'),
	('efsana', 'Александра', 'Россия, Севастополь', NULL, 25, 'парня', 0, 0, 'http://www.mamba.ru/ru/efsana?hit=10&fromsearch&sp=5', '2015-05-30', b'1'),
	('grankina12', 'Звезда', 'Россия, Симферополь', NULL, 27, 'парня', 26, 35, 'http://www.mamba.ru/ru/grankina12?hit=10&fromsearch&sp=8', '2015-05-30', b'1'),
	('k_o_t_a_y', 'Катеринка', 'Россия, Ялта', NULL, 24, 'парня', 0, 0, 'http://www.mamba.ru/ru/k_o_t_a_y?hit=10&fromsearch&sp=9', '2015-05-30', b'1'),
	('Mashenkaogonek', 'Машунька', 'Россия, Севастополь', NULL, 30, 'парня', 26, 30, 'http://www.mamba.ru/ru/Mashenkaogonek?hit=10&fromsearch&sp=8', '2015-05-30', b'1'),
	('mb1130828685', 'Анастасия', 'Россия, Севастополь', NULL, 28, 'парня или девушку', 26, 35, 'http://www.mamba.ru/ru/mb1130828685?hit=10&fromsearch&sp=0', '2015-05-30', b'1'),
	('mb1173771513', 'Tigirina', 'Россия, Симферополь', NULL, 30, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1173771513?hit=10&fromsearch&sp=2', '2015-05-30', b'1'),
	('mb1208232182', 'Марго', 'Россия, Симферополь', NULL, 0, 'парня', 31, 50, 'http://www.mamba.ru/ru/mb1208232182?hit=10&fromsearch&sp=11', '2015-05-30', b'1'),
	('mb1221366722', 'Фатиме', 'Россия, Симферополь', NULL, 25, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1221366722?hit=10&fromsearch&sp=0', '2015-05-30', b'1'),
	('mb1249926608', 'Лариса', 'Россия, Севастополь', NULL, 31, 'парня', 31, 35, 'http://www.mamba.ru/ru/mb1249926608?hit=10&fromsearch&sp=8', '2015-05-30', b'1'),
	('mb1277972354', 'Анна Кудря', 'Россия, Севастополь', NULL, 32, 'парня', 31, 50, 'http://www.mamba.ru/ru/mb1277972354?hit=10&fromsearch&sp=8', '2015-05-30', b'1'),
	('mb1283794666', 'Елена', 'Россия, Севастополь', NULL, 32, 'парня или девушку', 0, 0, 'http://www.mamba.ru/ru/mb1283794666?hit=10&fromsearch&sp=0', '2015-05-30', b'1'),
	('mb1312263656', 'Наташа', 'Россия, Белогорск', NULL, 26, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1312263656?hit=10&fromsearch&sp=0', '2015-05-30', b'1'),
	('mb1340917254', 'Mishka', 'Россия, Евпатория', NULL, 30, 'парня', 26, 30, 'http://www.mamba.ru/ru/mb1340917254?hit=10&fromsearch&sp=12', '2015-05-30', b'1'),
	('mb1343657772', 'елена ждановких', 'Россия, Феодосия', NULL, 32, 'парня или девушку', 31, 50, 'http://www.mamba.ru/ru/mb1343657772?hit=10&fromsearch&sp=7', '2015-05-30', b'1'),
	('mb1372795442', 'Анна', 'Россия, Симферополь', NULL, 28, 'парня', 26, 40, 'http://www.mamba.ru/ru/mb1372795442?hit=10&fromsearch&sp=1', '2015-05-30', b'1'),
	('mb1389129981', 'Анна', 'Россия, Симферополь', NULL, 29, 'парня', 31, 35, 'http://www.mamba.ru/ru/mb1389129981?hit=10&fromsearch&sp=2', '2015-05-30', b'1'),
	('mb1401877928', 'Лина', 'Россия, Симферополь', NULL, 24, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1401877928?hit=10&fromsearch&sp=4', '2015-05-30', b'1'),
	('mb1408907130', 'Ирина', 'Россия, Севастополь', NULL, 31, 'парня', 31, 40, 'http://www.mamba.ru/ru/mb1408907130?hit=10&fromsearch&sp=11', '2015-05-30', b'1'),
	('mb1411255823', 'Yablochnaya', 'Россия, Севастополь', NULL, 29, 'парня', 31, 35, 'http://www.mamba.ru/ru/mb1411255823?hit=10&fromsearch&sp=7', '2015-05-30', b'1'),
	('mb1427217100', 'Ксения', 'Россия, Евпатория', NULL, 31, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1427217100?hit=10&fromsearch&sp=1', '2015-05-30', b'1'),
	('mb1434448601', 'Marta', 'Россия, Симферополь', NULL, 31, 'парня', 26, 35, 'http://www.mamba.ru/ru/mb1434448601?hit=10&fromsearch&sp=4', '2015-05-30', b'1'),
	('mb1448347879', 'Ольга', 'Россия, Симферополь', NULL, 32, 'парня', 31, 50, 'http://www.mamba.ru/ru/mb1448347879?hit=10&fromsearch&sp=5', '2015-05-30', b'1'),
	('mb1449497056', 'Татьяна', 'Россия, Севастополь', NULL, 27, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1449497056?hit=10&fromsearch&sp=11', '2015-05-30', b'1'),
	('mb1454427946', 'Оксана', 'Россия, Керчь', NULL, 28, 'парня', 26, 35, 'http://www.mamba.ru/ru/mb1454427946?hit=10&fromsearch&sp=11', '2015-05-30', b'1'),
	('mb1454525124', 'Алина Никитина', 'Россия, Симферополь', NULL, 32, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1454525124?hit=10&fromsearch&sp=10', '2015-05-30', b'1'),
	('mb1455925106', 'Marta', 'Россия, Симферополь', NULL, 30, 'парня', 31, 35, 'http://www.mamba.ru/ru/mb1455925106?hit=10&fromsearch&sp=10', '2015-05-30', b'1'),
	('mb1455998696', 'Алина Кузьмичева', 'Россия, Симферополь', NULL, 23, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1455998696?hit=10&fromsearch&sp=10', '2015-05-30', b'1'),
	('mb1456441987', 'Александра Виноградова', 'Россия, Севастополь', NULL, 26, 'парня', 26, 35, 'http://www.mamba.ru/ru/mb1456441987?hit=10&fromsearch&sp=10', '2015-05-30', b'1'),
	('mb1457071650', 'Kotik Kiss', 'Россия, Симферополь', NULL, 28, 'парня', 31, 40, 'http://www.mamba.ru/ru/mb1457071650?hit=10&fromsearch&sp=10', '2015-05-30', b'1'),
	('mb1457356635', 'Настя', 'Россия, Евпатория', NULL, 26, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1457356635?hit=10&fromsearch&sp=10', '2015-05-30', b'1'),
	('mb1457571712', 'Эдие Диез', 'Россия, Симферополь', NULL, 25, 'парня', 26, 30, 'http://www.mamba.ru/ru/mb1457571712?hit=10&fromsearch&sp=10', '2015-05-30', b'1'),
	('mb1458545863', 'Вероника Милая', 'Россия, Севастополь', NULL, 28, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1458545863?hit=10&fromsearch&sp=10', '2015-05-30', b'1'),
	('mb1458896683', 'Оля Потапенко', 'Россия, Бахчисарай', NULL, 30, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1458896683?hit=10&fromsearch&sp=10', '2015-05-30', b'1'),
	('mb1459562728', 'Наталья Солодкая', 'Россия, Симферополь', NULL, 30, 'парня', 26, 30, 'http://www.mamba.ru/ru/mb1459562728?hit=10&fromsearch&sp=10', '2015-05-30', b'1'),
	('mb1460488625', 'Натали', 'Россия, Севастополь', NULL, 25, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1460488625?hit=10&fromsearch&sp=9', '2015-05-30', b'1'),
	('mb1460783053', 'Ирулечка Макасей', 'Россия, Севастополь', NULL, 28, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1460783053?hit=10&fromsearch&sp=9', '2015-05-30', b'1'),
	('mb1462963697', 'Александра', 'Россия, Севастополь', NULL, 25, 'парня', 21, 40, 'http://www.mamba.ru/ru/mb1462963697?hit=10&fromsearch&sp=4', '2015-05-30', b'1'),
	('mb1463396534', 'Катя', 'Россия, Симферополь', NULL, 25, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463396534?hit=10&fromsearch&sp=12', '2015-05-30', b'1'),
	('mb1463398928', 'Эля', 'Россия, Ялта', NULL, 24, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463398928?hit=10&fromsearch&sp=12', '2015-05-30', b'1'),
	('mb1463404345', 'Светланка', 'Россия, Симферополь', NULL, 24, 'парня', 21, 30, 'http://www.mamba.ru/ru/mb1463404345?hit=10&fromsearch&sp=12', '2015-05-30', b'1'),
	('mb1463410492', 'Елена', 'Россия, Симферополь', NULL, 30, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463410492?hit=10&fromsearch&sp=11', '2015-05-30', b'1'),
	('mb1463410693', 'Katerina', 'Россия, Симферополь', NULL, 23, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463410693?hit=10&fromsearch&sp=11', '2015-05-30', b'1'),
	('mb1463432175', 'Таня Алиева', 'Россия, Ялта', NULL, 32, 'парня', 31, 40, 'http://www.mamba.ru/ru/mb1463432175?hit=10&fromsearch&sp=11', '2015-05-30', b'1'),
	('mb1463436109', 'Леся', 'Россия, Севастополь', NULL, 26, 'парня', 26, 30, 'http://www.mamba.ru/ru/mb1463436109?hit=10&fromsearch&sp=11', '2015-05-30', b'1'),
	('mb1463439408', 'Nady', 'Россия, Симферополь', NULL, 23, 'парня', 26, 30, 'http://www.mamba.ru/ru/mb1463439408?hit=10&fromsearch&sp=11', '2015-05-30', b'1'),
	('mb1463493717', 'Marissa', 'Россия, Симферополь', NULL, 24, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463493717?hit=10&fromsearch&sp=11', '2015-05-30', b'1'),
	('mb1463537703', 'Надежда Турутина', 'Россия, Севастополь', NULL, 27, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463537703?hit=10&fromsearch&sp=9', '2015-05-30', b'1'),
	('mb1463543037', 'Анна', 'Россия, Севастополь', NULL, 32, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463543037?hit=10&fromsearch&sp=9', '2015-05-30', b'1'),
	('mb1463550578', 'Ольга', 'Россия, Симферополь', NULL, 27, 'парня', 26, 40, 'http://www.mamba.ru/ru/mb1463550578?hit=10&fromsearch&sp=9', '2015-05-30', b'1'),
	('mb1463557201', 'Zara', 'Россия, Симферополь', NULL, 26, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463557201?hit=10&fromsearch&sp=9', '2015-05-30', b'1'),
	('mb1463560665', 'Яна', 'Россия, Симферополь', NULL, 31, 'парня', 31, 40, 'http://www.mamba.ru/ru/mb1463560665?hit=10&fromsearch&sp=9', '2015-05-30', b'1'),
	('mb1463563553', 'Юлия', 'Россия, Симферополь', NULL, 23, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463563553?hit=10&fromsearch&sp=9', '2015-05-30', b'1'),
	('mb1463571316', 'Мария Вирчис', 'Россия, Ялта', NULL, 23, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463571316?hit=10&fromsearch&sp=8', '2015-05-30', b'1'),
	('mb1463578364', 'Ксения Озерова', 'Россия, Севастополь', NULL, 25, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463578364?hit=10&fromsearch&sp=8', '2015-05-30', b'1'),
	('mb1463628567', 'Аня', 'Россия, Симферополь', NULL, 26, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463628567?hit=10&fromsearch&sp=8', '2015-05-30', b'1'),
	('mb1463628802', 'Ника', 'Россия, Феодосия', NULL, 26, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463628802?hit=10&fromsearch&sp=8', '2015-05-30', b'1'),
	('mb1463637351', 'Татьяна', 'Россия, Симферополь', NULL, 30, 'парня', 31, 50, 'http://www.mamba.ru/ru/mb1463637351?hit=10&fromsearch&sp=8', '2015-05-30', b'1'),
	('mb1463654121', 'Галина', 'Россия, Севастополь', NULL, 23, 'парня', 26, 40, 'http://www.mamba.ru/ru/mb1463654121?hit=10&fromsearch&sp=8', '2015-05-30', b'1'),
	('mb1463672744', 'Аня Живолуп', 'Россия, Севастополь', NULL, 23, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463672744?hit=10&fromsearch&sp=7', '2015-05-30', b'1'),
	('mb1463685610', 'Виктория', 'Россия, Симферополь', NULL, 26, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463685610?hit=10&fromsearch&sp=7', '2015-05-30', b'1'),
	('mb1463685993', 'Анна', 'Россия, Симферополь', NULL, 24, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463685993?hit=10&fromsearch&sp=7', '2015-05-30', b'1'),
	('mb1463722559', 'Елизавета', 'Россия, Симферополь', NULL, 25, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463722559?hit=10&fromsearch&sp=7', '2015-05-30', b'1'),
	('mb1463740789', 'Lora', 'Россия, Севастополь', NULL, 31, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463740789?hit=10&fromsearch&sp=7', '2015-05-30', b'1'),
	('mb1463741737', 'Елена', 'Россия, Симферополь', NULL, 30, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463741737?hit=10&fromsearch&sp=7', '2015-05-30', b'1'),
	('mb1463750557', 'Элла Шулятьева', 'Россия, Ялта', NULL, 23, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463750557?hit=10&fromsearch&sp=7', '2015-05-30', b'1'),
	('mb1463760746', 'Dasha', 'Россия, Симферополь', NULL, 24, 'парня', 26, 30, 'http://www.mamba.ru/ru/mb1463760746?hit=10&fromsearch&sp=7', '2015-05-30', b'1'),
	('mb1463761115', 'Юлия Лл', 'Россия, Симферополь', NULL, 29, 'парня', 31, 40, 'http://www.mamba.ru/ru/mb1463761115?hit=10&fromsearch&sp=6', '2015-05-30', b'1'),
	('mb1463805763', 'Елена', 'Россия, Феодосия', NULL, 24, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463805763?hit=10&fromsearch&sp=6', '2015-05-30', b'1'),
	('mb1463815852', 'Анжелика Лика', 'Россия, Феодосия', NULL, 26, 'парня или девушку', 18, 35, 'http://www.mamba.ru/ru/mb1463815852?hit=10&fromsearch&sp=6', '2015-05-30', b'1'),
	('mb1463831499', 'Lika', 'Россия, Симферополь', NULL, 28, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463831499?hit=10&fromsearch&sp=6', '2015-05-30', b'1'),
	('mb1463865987', 'Elnara Muratova', 'Россия, Мирное', NULL, 26, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463865987?hit=10&fromsearch&sp=6', '2015-05-30', b'1'),
	('mb1463934601', 'Killer Billa', 'Россия, Симферополь', NULL, 27, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463934601?hit=10&fromsearch&sp=6', '2015-05-30', b'1'),
	('mb1463941462', 'Ольга', 'Россия, Алушта', NULL, 24, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463941462?hit=10&fromsearch&sp=6', '2015-05-30', b'1'),
	('mb1463955380', 'Мария', 'Россия, Красноперекопск', NULL, 28, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463955380?hit=10&fromsearch&sp=6', '2015-05-30', b'1'),
	('mb1463958615', 'Мария', 'Россия, Саки', NULL, 24, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1463958615?hit=10&fromsearch&sp=6', '2015-05-30', b'1'),
	('mb1464018588', 'Альбина', 'Россия, Симферополь', NULL, 29, 'парня или девушку', 0, 0, 'http://www.mamba.ru/ru/mb1464018588?hit=10&fromsearch&sp=5', '2015-05-30', b'1'),
	('mb1464024833', 'Марина', 'Россия, Симферополь', NULL, 30, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1464024833?hit=10&fromsearch&sp=5', '2015-05-30', b'1'),
	('mb1464044743', 'Ника Белан', 'Россия, Симферополь', NULL, 29, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1464044743?hit=10&fromsearch&sp=5', '2015-05-30', b'1'),
	('mb1464049609', 'Светлана', 'Россия, Симферополь', NULL, 28, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1464049609?hit=10&fromsearch&sp=5', '2015-05-30', b'1'),
	('mb1464059128', 'Alisa', 'Россия, Евпатория', NULL, 30, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1464059128?hit=10&fromsearch&sp=5', '2015-05-30', b'1'),
	('mb1464096981', 'Ukka', 'Россия, Севастополь', NULL, 27, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1464096981?hit=10&fromsearch&sp=5', '2015-05-30', b'1'),
	('mb1464101630', 'Юля', 'Россия, Симферополь', NULL, 26, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1464101630?hit=10&fromsearch&sp=5', '2015-05-30', b'1'),
	('mb1464152027', 'Анжелика', 'Россия, Севастополь', NULL, 26, 'парня', 26, 30, 'http://www.mamba.ru/ru/mb1464152027?hit=10&fromsearch&sp=4', '2015-05-30', b'1'),
	('mb1464152564', 'Ксения', 'Россия, Симферополь', NULL, 32, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1464152564?hit=10&fromsearch&sp=4', '2015-05-30', b'1'),
	('mb1464154283', 'Наталья', 'Россия, Симферополь', NULL, 31, 'парня', 31, 40, 'http://www.mamba.ru/ru/mb1464154283?hit=10&fromsearch&sp=4', '2015-05-30', b'1'),
	('mb1464166793', 'Nika', 'Россия, Симферополь', NULL, 25, 'парня', 26, 50, 'http://www.mamba.ru/ru/mb1464166793?hit=10&fromsearch&sp=4', '2015-05-30', b'1'),
	('mb1464186790', 'Таша', 'Россия, Симферополь', NULL, 25, 'парня', 26, 35, 'http://www.mamba.ru/ru/mb1464186790?hit=10&fromsearch&sp=4', '2015-05-30', b'1'),
	('mb1464188118', 'Ксения', 'Россия, Севастополь', NULL, 31, 'парня', 26, 40, 'http://www.mamba.ru/ru/mb1464188118?hit=10&fromsearch&sp=4', '2015-05-30', b'1'),
	('mb1464196499', 'Irina', 'Россия, Симферополь', NULL, 26, 'парня', 26, 30, 'http://www.mamba.ru/ru/mb1464196499?hit=10&fromsearch&sp=3', '2015-05-30', b'1'),
	('mb1464199876', 'Оксана', 'Россия, Севастополь', NULL, 25, 'парня', 26, 30, 'http://www.mamba.ru/ru/mb1464199876?hit=10&fromsearch&sp=3', '2015-05-30', b'1'),
	('mb1464200629', 'Anna', 'Россия, Евпатория', NULL, 26, 'парня', 26, 30, 'http://www.mamba.ru/ru/mb1464200629?hit=10&fromsearch&sp=3', '2015-05-30', b'1'),
	('mb1464203498', 'Евгения', 'Россия, Ялта', NULL, 24, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1464203498?hit=10&fromsearch&sp=3', '2015-05-30', b'1'),
	('mb1464206591', 'Евгения Демьяненко', 'Россия, Евпатория', NULL, 24, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1464206591?hit=10&fromsearch&sp=3', '2015-05-30', b'1'),
	('mb1464210250', 'Nana', 'Россия, Симферополь', NULL, 30, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1464210250?hit=10&fromsearch&sp=3', '2015-05-30', b'1'),
	('mb1464219037', 'Вислана', 'Россия, Симферополь', NULL, 27, 'парня', 31, 35, 'http://www.mamba.ru/ru/mb1464219037?hit=10&fromsearch&sp=3', '2015-05-30', b'1'),
	('mb1464291132', 'Ната', 'Россия, Феодосия', NULL, 24, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1464291132?hit=10&fromsearch&sp=3', '2015-05-30', b'1'),
	('mb1464344175', 'Tory', 'Россия, Мирное', NULL, 24, 'парня', 21, 30, 'http://www.mamba.ru/ru/mb1464344175?hit=10&fromsearch&sp=2', '2015-05-30', b'1'),
	('mb1464373463', 'Кристина Жидачевская', 'Россия, Джанкой', NULL, 25, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1464373463?hit=10&fromsearch&sp=2', '2015-05-30', b'1'),
	('mb1464409798', 'Руфина', 'Россия, Бахчисарай', NULL, 23, 'парня', 26, 30, 'http://www.mamba.ru/ru/mb1464409798?hit=10&fromsearch&sp=2', '2015-05-30', b'1'),
	('mb1464413699', 'Natali', 'Россия, Симферополь', NULL, 28, 'парня', 31, 35, 'http://www.mamba.ru/ru/mb1464413699?hit=10&fromsearch&sp=2', '2015-05-30', b'1'),
	('mb1464435801', 'Ольга', 'Россия, Симферополь', NULL, 32, 'парня', 31, 40, 'http://www.mamba.ru/ru/mb1464435801?hit=10&fromsearch&sp=2', '2015-05-30', b'1'),
	('mb1464436271', 'Veronika Airlend', 'Россия, Строгоновка', NULL, 28, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1464436271?hit=10&fromsearch&sp=2', '2015-05-30', b'1'),
	('mb1464438110', 'Надежда', 'Россия, Феодосия', NULL, 25, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1464438110?hit=10&fromsearch&sp=2', '2015-05-30', b'1'),
	('mb1464441659', 'Лилия', 'Россия, Джанкой', NULL, 28, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1464441659?hit=10&fromsearch&sp=2', '2015-05-30', b'1'),
	('mb1464449213', 'Людмила', 'Россия, Ялта', NULL, 28, 'парня', 26, 35, 'http://www.mamba.ru/ru/mb1464449213?hit=10&fromsearch&sp=1', '2015-05-30', b'1'),
	('mb1464477278', 'Lia', 'Россия, Севастополь', NULL, 28, 'парня', 36, 40, 'http://www.mamba.ru/ru/mb1464477278?hit=10&fromsearch&sp=1', '2015-05-30', b'1'),
	('mb1464486378', 'Юлия', 'Россия, Севастополь', NULL, 25, 'парня', 31, 35, 'http://www.mamba.ru/ru/mb1464486378?hit=10&fromsearch&sp=1', '2015-05-30', b'1'),
	('mb1464501141', 'Кристина', 'Россия, Севастополь', NULL, 23, 'парня', 21, 30, 'http://www.mamba.ru/ru/mb1464501141?hit=10&fromsearch&sp=1', '2015-05-30', b'1'),
	('mb1464507846', 'Валентина', 'Россия, Симферополь', NULL, 23, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1464507846?hit=10&fromsearch&sp=1', '2015-05-30', b'1'),
	('mb1464511736', 'Мария', 'Россия, Севастополь', NULL, 26, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1464511736?hit=10&fromsearch&sp=1', '2015-05-30', b'1'),
	('mb1464523707', 'Алена', 'Россия, Симферополь', NULL, 26, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1464523707?hit=10&fromsearch&sp=1', '2015-05-30', b'1'),
	('mb1464524066', 'Аня', 'Россия, Евпатория', NULL, 30, 'парня', 31, 35, 'http://www.mamba.ru/ru/mb1464524066?hit=10&fromsearch&sp=0', '2015-05-30', b'1'),
	('mb1464526796', 'Танюша', 'Россия, Алупка', NULL, 24, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1464526796?hit=10&fromsearch&sp=0', '2015-05-30', b'1'),
	('mb1464540316', 'Lily', 'Россия, Севастополь', NULL, 30, 'парня', 31, 35, 'http://www.mamba.ru/ru/mb1464540316?hit=10&fromsearch&sp=0', '2015-05-30', b'1'),
	('mb1464560447', 'Таня', 'Россия, Красногвардейское', NULL, 24, 'парня', 21, 0, 'http://www.mamba.ru/ru/mb1464560447?hit=10&fromsearch&sp=0', '2015-05-30', b'1'),
	('mb1464563087', 'Натали Волкова', 'Россия, Евпатория', NULL, 27, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1464563087?hit=10&fromsearch&sp=0', '2015-05-30', b'1'),
	('mb1464590340', 'Дарья', 'Россия, Керчь', NULL, 30, 'парня', 0, 0, 'http://www.mamba.ru/ru/mb1464590340?hit=10&fromsearch&sp=0', '2015-05-30', b'1'),
	('mb700176118', 'Сакуры Нежный Цветок', 'Россия, Севастополь', NULL, 27, 'парня', 26, 30, 'http://www.mamba.ru/ru/mb700176118?hit=10&fromsearch&sp=5', '2015-05-30', b'1'),
	('mb701732735', 'Ирина', 'Россия, Симферополь', NULL, 0, 'парня', 26, 35, 'http://www.mamba.ru/ru/mb701732735?hit=10&fromsearch&sp=4', '2015-05-30', b'1'),
	('miMilawka', 'Милая', 'Россия, Керчь', NULL, 23, 'парня', 18, 30, 'http://www.mamba.ru/ru/miMilawka?hit=10&fromsearch&sp=6', '2015-05-30', b'1'),
	('natascha2015', 'Мама Хочет Внуков', 'Россия, Симферополь', NULL, 30, 'парня', 31, 40, 'http://www.mamba.ru/ru/natascha2015?hit=10&fromsearch&sp=9', '2015-05-30', b'1'),
	('natysik1991', 'Натали', 'Россия, Симферополь', NULL, 23, 'парня', 0, 0, 'http://www.mamba.ru/ru/natysik1991?hit=10&fromsearch&sp=3', '2015-05-30', b'1'),
	('rinarais', 'Екатерина', 'Россия, Октябрьское', NULL, 24, 'парня', 26, 30, 'http://www.mamba.ru/ru/rinarais?hit=10&fromsearch&sp=1', '2015-05-30', b'1'),
	('svetlana8825', 'Светлана', 'Россия, Симферополь', NULL, 29, 'парня', 26, 35, 'http://www.mamba.ru/ru/svetlana8825?hit=10&fromsearch&sp=12', '2015-05-30', b'1');
/*!40000 ALTER TABLE `infos` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
