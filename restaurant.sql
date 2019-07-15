-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 27 avr. 2019 à 15:47
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `restaurant`
--

-- --------------------------------------------------------

--
-- Structure de la table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `BookingDate` date NOT NULL,
  `BookingTime` time NOT NULL,
  `NumberOfSeats` tinyint(4) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `CreationTimestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `booking`
--

INSERT INTO `booking` (`Id`, `BookingDate`, `BookingTime`, `NumberOfSeats`, `User_Id`, `CreationTimestamp`) VALUES
(1, '2019-03-15', '16:00:00', 2, 1, '2019-03-21 15:45:46'),
(2, '2019-01-20', '16:30:00', 3, 2, '2019-03-26 12:08:18');

-- --------------------------------------------------------

--
-- Structure de la table `meal`
--

DROP TABLE IF EXISTS `meal`;
CREATE TABLE IF NOT EXISTS `meal` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `Photo` varchar(30) NOT NULL,
  `Description` varchar(250) NOT NULL,
  `QuantityInStock` tinyint(4) NOT NULL,
  `BuyPrice` double NOT NULL,
  `SalePrice` double NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `meal`
--

INSERT INTO `meal` (`Id`, `Name`, `Photo`, `Description`, `QuantityInStock`, `BuyPrice`, `SalePrice`) VALUES
(1, 'Café', 'cafe.jpg', 'Ça réchauffe le coeur', 100, 0.5, 1.2),
(2, 'Brownie', 'brownie.jpg', 'Rien de mieux qu\'un peu de chocolat !!!', 100, 0.6, 2),
(3, 'Thé', 'the.jpg', 'Rien de tel qu\'un peu de théine.', 100, 0.4, 1.2),
(4, 'Crumble Pomme', 'crumble.jpg', 'Ça craque sous la dent.', 100, 0.8, 2.6),
(5, 'Cappuccino', 'cappuccino.jpg', 'Un peu de mousse par dessus.', 100, 0.4, 1.8),
(6, 'Tarte aux Fruits', 'tarteFruit.jpg', 'Une pléiade de saveur sur un tendre lit.', 100, 0.9, 3);

-- --------------------------------------------------------

--
-- Structure de la table `orderline`
--

DROP TABLE IF EXISTS `orderline`;
CREATE TABLE IF NOT EXISTS `orderline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `QuantityOrdered` int(4) NOT NULL,
  `Meal_Id` int(11) NOT NULL,
  `Order_Id` int(11) NOT NULL,
  `PriceEach` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `orderline`
--

INSERT INTO `orderline` (`id`, `QuantityOrdered`, `Meal_Id`, `Order_Id`, `PriceEach`) VALUES
(43, 5, 2, 18, 2),
(44, 7, 1, 18, 1.2),
(45, 3, 4, 18, 2.6),
(46, 3, 3, 18, 1.2),
(47, 3, 6, 18, 3),
(48, 5, 2, 19, 2),
(49, 7, 1, 19, 1.2),
(50, 3, 4, 19, 2.6),
(51, 3, 3, 19, 1.2),
(52, 3, 6, 19, 3),
(53, 5, 2, 20, 2),
(54, 7, 1, 20, 1.2),
(55, 3, 4, 20, 2.6),
(56, 3, 3, 20, 1.2),
(57, 3, 6, 20, 3),
(58, 5, 2, 21, 2),
(59, 7, 1, 21, 1.2),
(60, 3, 4, 21, 2.6),
(61, 3, 3, 21, 1.2),
(62, 3, 6, 21, 3),
(63, 5, 2, 22, 2),
(64, 7, 1, 22, 1.2),
(65, 3, 4, 22, 2.6),
(66, 3, 3, 22, 1.2),
(67, 3, 6, 22, 3),
(68, 5, 2, 23, 2),
(69, 7, 1, 23, 1.2),
(70, 3, 4, 23, 2.6),
(71, 3, 3, 23, 1.2),
(72, 3, 6, 23, 3),
(73, 5, 2, 24, 2),
(74, 7, 1, 24, 1.2),
(75, 3, 4, 24, 2.6),
(76, 3, 3, 24, 1.2),
(77, 3, 6, 24, 3),
(78, 5, 2, 25, 2),
(79, 7, 1, 25, 1.2),
(80, 3, 4, 25, 2.6),
(81, 3, 3, 25, 1.2),
(82, 3, 6, 25, 3),
(83, 5, 2, 26, 2),
(84, 7, 1, 26, 1.2),
(85, 3, 4, 26, 2.6),
(86, 3, 3, 26, 1.2),
(87, 3, 6, 26, 3),
(88, 5, 2, 27, 2),
(89, 7, 1, 27, 1.2),
(90, 3, 4, 27, 2.6),
(91, 3, 3, 27, 1.2),
(92, 3, 6, 27, 3),
(93, 5, 2, 28, 2),
(94, 7, 1, 28, 1.2),
(95, 3, 4, 28, 2.6),
(96, 3, 3, 28, 1.2),
(97, 3, 6, 28, 3),
(98, 5, 2, 29, 2),
(99, 7, 1, 29, 1.2),
(100, 3, 4, 29, 2.6),
(101, 3, 3, 29, 1.2),
(102, 3, 6, 29, 3),
(103, 5, 2, 30, 2),
(104, 7, 1, 30, 1.2),
(105, 3, 4, 30, 2.6),
(106, 3, 3, 30, 1.2),
(107, 3, 6, 30, 3),
(108, 5, 2, 31, 2),
(109, 7, 1, 31, 1.2),
(110, 3, 4, 31, 2.6),
(111, 3, 3, 31, 1.2),
(112, 3, 6, 31, 3),
(113, 5, 2, 32, 2),
(114, 7, 1, 32, 1.2),
(115, 3, 4, 32, 2.6),
(116, 3, 3, 32, 1.2),
(117, 3, 6, 32, 3),
(118, 5, 2, 33, 2),
(119, 7, 1, 33, 1.2),
(120, 3, 4, 33, 2.6),
(121, 3, 3, 33, 1.2),
(122, 3, 6, 33, 3),
(123, 5, 2, 34, 2),
(124, 7, 1, 34, 1.2),
(125, 3, 4, 34, 2.6),
(126, 3, 3, 34, 1.2),
(127, 3, 6, 34, 3),
(128, 5, 2, 35, 2),
(129, 7, 1, 35, 1.2),
(130, 3, 4, 35, 2.6),
(131, 3, 3, 35, 1.2),
(132, 3, 6, 35, 3),
(133, 5, 2, 36, 2),
(134, 7, 1, 36, 1.2),
(135, 3, 4, 36, 2.6),
(136, 3, 3, 36, 1.2),
(137, 3, 6, 36, 3),
(138, 5, 2, 37, 2),
(139, 7, 1, 37, 1.2),
(140, 3, 4, 37, 2.6),
(141, 3, 3, 37, 1.2),
(142, 3, 6, 37, 3),
(143, 5, 2, 38, 2),
(144, 7, 1, 38, 1.2),
(145, 3, 4, 38, 2.6),
(146, 3, 3, 38, 1.2),
(147, 3, 6, 38, 3),
(148, 5, 2, 39, 2),
(149, 7, 1, 39, 1.2),
(150, 3, 4, 39, 2.6),
(151, 3, 3, 39, 1.2),
(152, 3, 6, 39, 3),
(153, 5, 2, 40, 2),
(154, 7, 1, 40, 1.2),
(155, 3, 4, 40, 2.6),
(156, 3, 3, 40, 1.2),
(157, 3, 6, 40, 3),
(158, 3, 4, 41, 2.6),
(159, 2, 1, 41, 1.2),
(160, 1, 2, 41, 2),
(161, 5, 5, 41, 1.8),
(162, 2, 6, 41, 3),
(163, 3, 2, 42, 2),
(164, 2, 3, 42, 1.2),
(165, 1, 1, 42, 1.2),
(166, 3, 2, 43, 2),
(167, 2, 3, 43, 1.2),
(168, 1, 1, 43, 1.2),
(169, 3, 1, 44, 1.2),
(170, 2, 2, 44, 2),
(171, 1, 4, 44, 2.6),
(172, 2, 2, 45, 2),
(173, 2, 2, 46, 2);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `User_Id` int(11) NOT NULL,
  `TotalAmount` double DEFAULT NULL,
  `TaxRate` float DEFAULT NULL,
  `TaxAmount` double DEFAULT NULL,
  `CreationTimestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CompleteTimestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `User_Id`, `TotalAmount`, `TaxRate`, `TaxAmount`, `CreationTimestamp`, `CompleteTimestamp`) VALUES
(18, 2, 46.56, 0.2, 7.76, '2019-03-26 10:43:03', NULL),
(19, 2, 46.56, 0.2, 7.76, '2019-03-26 11:40:47', NULL),
(20, 2, 46.56, 0.2, 7.76, '2019-03-26 11:41:11', NULL),
(21, 2, 46.56, 0.2, 7.76, '2019-03-26 11:59:30', NULL),
(22, 2, 46.56, 0.2, 7.76, '2019-03-26 12:10:30', NULL),
(23, 2, 46.56, 0.2, 7.76, '2019-03-26 12:10:53', NULL),
(24, 2, 46.56, 0.2, 7.76, '2019-03-26 12:11:19', NULL),
(25, 2, 46.56, 0.2, 7.76, '2019-03-26 12:11:53', NULL),
(26, 2, 46.56, 0.2, 7.76, '2019-03-26 12:12:10', NULL),
(27, 2, 46.56, 0.2, 7.76, '2019-03-26 12:12:36', NULL),
(28, 2, 46.56, 0.2, 7.76, '2019-03-26 12:12:56', NULL),
(29, 2, 46.56, 0.2, 7.76, '2019-03-26 12:13:55', NULL),
(30, 2, 46.56, 0.2, 7.76, '2019-03-26 12:15:33', NULL),
(31, 2, 46.56, 0.2, 7.76, '2019-03-26 12:33:11', NULL),
(32, 2, 46.56, 0.2, 7.76, '2019-03-26 12:47:24', NULL),
(33, 2, 46.56, 0.2, 7.76, '2019-03-26 12:48:13', NULL),
(34, 2, 46.56, 0.2, 7.76, '2019-03-26 12:48:46', NULL),
(35, 2, 46.56, 0.2, 7.76, '2019-03-26 13:47:14', NULL),
(36, 2, 46.56, 0.2, 7.76, '2019-03-26 13:48:22', NULL),
(37, 2, 46.56, 0.2, 7.76, '2019-03-26 14:32:29', NULL),
(38, 2, 46.56, 0.2, 7.76, '2019-03-26 14:44:33', NULL),
(39, 2, 46.56, 0.2, 7.76, '2019-03-26 14:45:14', NULL),
(40, 2, 46.56, 0.2, 7.76, '2019-03-26 15:13:30', '2019-03-26 15:18:56'),
(41, 2, 32.64, 0.2, 5.44, '2019-03-26 15:43:20', '2019-03-26 15:43:23'),
(42, 2, 11.52, 0.2, 1.92, '2019-03-27 13:00:06', NULL),
(43, 2, 11.52, 0.2, 1.92, '2019-03-27 15:42:49', '2019-03-27 15:42:51'),
(44, 2, 12.24, 0.2, 2.04, '2019-03-29 10:27:15', '2019-03-29 10:27:35'),
(45, 1, 4.8, 0.2, 0.8, '2019-04-27 17:42:20', '2019-04-27 17:44:15'),
(46, 1, 4.8, 0.2, 0.8, '2019-04-27 17:45:00', '2019-04-27 17:45:02');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(40) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(64) NOT NULL,
  `BirthDate` date NOT NULL,
  `Adresse` varchar(250) NOT NULL,
  `City` varchar(40) NOT NULL,
  `ZipCode` char(5) NOT NULL,
  `Country` varchar(20) DEFAULT NULL,
  `Phone` char(10) NOT NULL,
  `CreationTimestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LastLoginTimestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`Id`, `FirstName`, `LastName`, `Email`, `Password`, `BirthDate`, `Adresse`, `City`, `ZipCode`, `Country`, `Phone`, `CreationTimestamp`, `LastLoginTimestamp`) VALUES
(1, 'admin', 'admin', 'admin@admin.fr', '$2y$10$fceuXOWMrCFQxmEEo4SWZejEJFDyRVYMX6JVGQubsCKV8I3SQuK1m', '2019-03-20', 'rue de l\'espoir', 'paris', '75018', NULL, '630254698', '2019-03-20 12:59:58', NULL),
(2, 'test', 'test', 'test@test.fr', '$2y$10$jSpxgivM0WyutjSeGXoziecKx7o8XjAQfQdw47nGdJxZ9Sd0.I04S', '2019-03-20', 'rue de l\'espoir2', 'paris', '75018', NULL, '0654875632', '2019-03-20 15:28:49', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
