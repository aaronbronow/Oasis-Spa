-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 25, 2018 at 03:42 AM
-- Server version: 5.5.59-0+deb8u1
-- PHP Version: 5.6.33-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `controller`
--

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `id` int(1) NOT NULL,
  `version` varchar(4) NOT NULL,
  `raspberry_type` varchar(10) NOT NULL,
  `token` varchar(255) NOT NULL,
  `api` int(1) NOT NULL,
  `set_temp` varchar(4) NOT NULL,
  `set_temp_dev` varchar(4) NOT NULL,
  `save_temp` int(1) NOT NULL,
  `heater_control` int(1) NOT NULL,
  `heater_relay` int(2) NOT NULL,
  `heater_sensor` int(6) NOT NULL,
  `overheat_control` int(1) NOT NULL,
  `overheat_sensor` int(4) NOT NULL,
  `overheat_temp` varchar(4) NOT NULL,
  `pump_control` int(1) NOT NULL,
  `pump_relay` int(2) NOT NULL,
  `frost_protection` int(1) NOT NULL,
  `frost_temp` varchar(4) NOT NULL,
  `frost_sensor` int(6) NOT NULL,
  `cleaning_mode` smallint(1) NOT NULL,
  `left_column` int(6) NOT NULL,
  `mid_column` varchar(52) NOT NULL,
  `right_column` int(6) NOT NULL,
  `used_power_date` date NOT NULL,
  `tablet_view` smallint(1) NOT NULL,
  `ip_check` smallint(1) NOT NULL,
  `ip_range` varchar(32) NOT NULL,
  `push_token` varchar(48) NOT NULL,
  `push_key` varchar(48) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `version`, `raspberry_type`, `token`, `api`, `set_temp`, `set_temp_dev`, `save_temp`, `heater_control`, `heater_relay`, `heater_sensor`, `overheat_control`, `overheat_sensor`, `overheat_temp`, `pump_control`, `pump_relay`, `frost_protection`, `frost_temp`, `frost_sensor`, `cleaning_mode`, `left_column`, `mid_column`, `right_column`, `used_power_date`, `tablet_view`, `ip_check`, `ip_range`, `push_token`, `push_key`) VALUES
(1, '1.20', 'Model 3b', 'Gdw34^%FHYDe', 1, '98', '4', 1, 1, 22, 2, 1, 2, '105', 1, 21, 0, '37', 4, 0, 8, '28FFB1A88317041A', 22, '2018-03-06', 1, 1, '192.168.x.x', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `device_control`
--

CREATE TABLE IF NOT EXISTS `device_control` (
  `id` int(6) NOT NULL,
  `relay_pin` int(6) NOT NULL,
  `relay_state` int(1) NOT NULL,
  `other_relay_pin` int(6) NOT NULL,
  `other_relay_state` int(1) NOT NULL,
  `remarks` mediumtext NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `device_control`
--

INSERT INTO `device_control` (`id`, `relay_pin`, `relay_state`, `other_relay_pin`, `other_relay_state`, `remarks`) VALUES
(3, 22, 1, 21, 1, 'turn off pump with heater');

-- --------------------------------------------------------

--
-- Table structure for table `iplist`
--

CREATE TABLE IF NOT EXISTS `iplist` (
`id` int(6) NOT NULL,
  `ip` varchar(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iplist`
--

INSERT INTO `iplist` (`id`, `ip`) VALUES
(5, '10.10.11.*'),
(6, '192.168.44.*');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(20) NOT NULL,
  `userid` int(10) NOT NULL,
  `ip` varchar(32) NOT NULL,
  `time` bigint(15) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `userid`, `ip`, `time`) VALUES
(1, 9, '10.35.0.90', 1521941171);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(12) NOT NULL,
  `log` mediumtext NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `relays`
--

CREATE TABLE IF NOT EXISTS `relays` (
`id` int(4) NOT NULL,
  `pin` int(3) NOT NULL,
  `name` varchar(52) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mqtt_address` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `apikey` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `tank` varchar(3) NOT NULL,
  `time_on` int(2) NOT NULL,
  `power` int(4) NOT NULL,
  `minutes_power` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relays`
--

INSERT INTO `relays` (`id`, `pin`, `name`, `ip`, `mqtt_address`, `apikey`, `tank`, `time_on`, `power`, `minutes_power`) VALUES
(1, 3, 'Party Button', '', '', '', 'no', 1000, 9, 5267),
(2, 22, 'Heater', '', 'tub/heater/0', '', 'yes', 935, 1, 2648),
(3, 21, 'Pump', '', 'tub/pump/0', '95177C81872635CB', 'no', 1071, 100, 3629),
(4, 8, 'Lights', '', '', '', 'no', 585, 0, 3410);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
  `id` int(11) NOT NULL,
  `pin` int(2) NOT NULL,
  `state` int(1) NOT NULL,
  `time` time NOT NULL,
  `overrule` int(1) NOT NULL,
  `active` int(1) NOT NULL,
  `remarks` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `pin`, `state`, `time`, `overrule`, `active`, `remarks`) VALUES
(11, 9, 0, '10:42:00', 0, 1, ''),
(7, 22, 1, '00:00:00', 1, 1, 'Shutoff at night'),
(8, 22, 1, '06:15:00', 0, 1, 'Warm tub in the morning off'),
(14, 3, 1, '16:00:00', 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `sensors`
--

CREATE TABLE IF NOT EXISTS `sensors` (
`id` int(6) NOT NULL,
  `address` varchar(125) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `name` varchar(52) NOT NULL,
  `type` varchar(4) NOT NULL,
  `pin` int(2) NOT NULL,
  `calibration_value` varchar(5) NOT NULL,
  `visible` varchar(3) NOT NULL,
  `temperature` varchar(6) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sensors`
--

INSERT INTO `sensors` (`id`, `address`, `ip`, `name`, `type`, `pin`, `calibration_value`, `visible`, `temperature`, `date_time`) VALUES
(2, '28FFB1A88317041A', '192.168.11.63', 'Tub Temp', 'IoT', 0, '', 'no', '97.7', '2018-03-25 01:41:01'),
(4, '28FF55FA83170400', '192.168.11.62', 'Incoming Temp', 'IoT', 0, '', 'yes', '100.1', '2018-03-25 01:38:01'),
(5, '28FF36EBA21704D7', '192.168.11.65', 'Outdoor Air Temp', 'IoT', 0, '', 'yes', '69.1', '2018-03-25 01:42:02');

-- --------------------------------------------------------

--
-- Table structure for table `temp_control`
--

CREATE TABLE IF NOT EXISTS `temp_control` (
  `id` int(8) NOT NULL,
  `sensor_id` int(8) NOT NULL,
  `mark` varchar(1) NOT NULL,
  `value` varchar(5) NOT NULL,
  `switch` int(2) NOT NULL,
  `state` int(1) NOT NULL,
  `remarks` mediumtext NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_control`
--

INSERT INTO `temp_control` (`id`, `sensor_id`, `mark`, `value`, `switch`, `state`, `remarks`) VALUES
(1, 4, '>', '122', 3, 0, ''),
(2, 2, '>', '102', 8, 0, 'Lights on when tub is hot'),
(3, 2, '<', '100', 8, 1, 'Lights off when tub is cool');

-- --------------------------------------------------------

--
-- Table structure for table `temp_logger`
--

CREATE TABLE IF NOT EXISTS `temp_logger` (
  `id` int(12) NOT NULL,
  `address` varchar(52) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `value` varchar(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4677 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_logger`
--

INSERT INTO `temp_logger` (`id`, `address`, `date_time`, `value`) VALUES
(4674, '28FFB1A88317041A', '2018-03-25 01:41:01', '97.8'),
(4675, '28FF55FA83170400', '2018-03-25 01:41:01', '100.1'),
(4676, '28FF36EBA21704D7', '2018-03-25 01:41:01', '68.8');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `id` int(2) NOT NULL,
  `test` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL,
  `username` varchar(52) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip` varchar(32) NOT NULL,
  `rank` smallint(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `ip`, `rank`) VALUES
(9, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '', '192.168.11.20', 2);

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
