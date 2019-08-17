-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.36-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.4.0.5174
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 flightinfo 的数据库结构
CREATE DATABASE IF NOT EXISTS `flightinfo` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `flightinfo`;

-- 导出  表 flightinfo.airport 结构
CREATE TABLE IF NOT EXISTS `airport` (
  `airport_id` int(11) NOT NULL AUTO_INCREMENT,
  `airport_name` varchar(50) DEFAULT NULL COMMENT '机场名称',
  `city_name` varchar(50) DEFAULT NULL COMMENT '所属城市',
  PRIMARY KEY (`airport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='机场表';

-- 正在导出表  flightinfo.airport 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` (`airport_id`, `airport_name`, `city_name`) VALUES
	(1, '首都国际机场', '北京'),
	(2, '上海虹桥机场', '上海'),
	(3, '上海浦东机场', '上海'),
	(4, '郑州国际机场', '郑州'),
	(5, '西安咸阳机场', '咸阳');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;

-- 导出  表 flightinfo.flights 结构
CREATE TABLE IF NOT EXISTS `flights` (
  `flight_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '航班id',
  `flight_code` varchar(50) DEFAULT NULL COMMENT '航班编号',
  `flight_date` date DEFAULT NULL COMMENT '航班日期',
  `airline` varchar(50) DEFAULT NULL COMMENT '航空公司',
  `type` varchar(50) DEFAULT NULL COMMENT '机型',
  `take_airport_id` int(11) DEFAULT NULL COMMENT '起飞机场id',
  `landing_airport_id` int(11) DEFAULT NULL COMMENT '降落机场id',
  `take_time` time DEFAULT NULL COMMENT '起飞时间',
  `landing_time` time DEFAULT NULL COMMENT '降落时间',
  `flight_time` varchar(50) DEFAULT NULL COMMENT '飞行时长',
  `stop_airport` varchar(50) DEFAULT NULL COMMENT '经停机场',
  `reference_price` int(11) DEFAULT NULL COMMENT '参考价格',
  PRIMARY KEY (`flight_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='航班信息表';

-- 正在导出表  flightinfo.flights 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` (`flight_id`, `flight_code`, `flight_date`, `airline`, `type`, `take_airport_id`, `landing_airport_id`, `take_time`, `landing_time`, `flight_time`, `stop_airport`, `reference_price`) VALUES
	(1, 'F3252', '2019-08-11', '南方航空Cn2143', '空客330(宽体机)', 1, 3, '18:08:40', '20:09:56', '2小时', NULL, 1500),
	(2, 'F3251', '2019-08-12', '南方航空Cn2133', '空客130(宽体机)', 4, 3, '18:10:40', '20:10:56', '2小时', NULL, 1000),
	(3, 'F3250', '2019-08-11', '南方航空Cn211', '空客360(宽体机)', 4, 1, '16:00:40', '17:10:56', '2小时10分钟', '石家庄', 1500);
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;

-- 导出  表 flightinfo.flight_tickets 结构
CREATE TABLE IF NOT EXISTS `flight_tickets` (
  `ft_id` int(11) NOT NULL AUTO_INCREMENT,
  `flight_id` int(11) DEFAULT NULL COMMENT '航班id',
  `flight_date` datetime DEFAULT NULL COMMENT '航班时间',
  `ticket_price` int(11) DEFAULT NULL COMMENT '票价',
  `sell_company` varchar(50) DEFAULT NULL COMMENT '售票单位',
  PRIMARY KEY (`ft_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='机票信息表';

-- 正在导出表  flightinfo.flight_tickets 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `flight_tickets` DISABLE KEYS */;
INSERT INTO `flight_tickets` (`ft_id`, `flight_id`, `flight_date`, `ticket_price`, `sell_company`) VALUES
	(1, 1, NULL, 1600, '华丽的推理票价配齐网'),
	(2, 1, NULL, 1601, '中华售票网'),
	(3, 1, NULL, 1620, '自己售票网');
/*!40000 ALTER TABLE `flight_tickets` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
