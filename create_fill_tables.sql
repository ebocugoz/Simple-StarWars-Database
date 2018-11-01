-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 18 Nis 2016, 11:26:32
-- Sunucu sürümü: 5.6.17
-- PHP Sürümü: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Veritabanı: `cs306_project_s3`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `characters`
--

CREATE TABLE IF NOT EXISTS `characters` (
  `birthyear` char(50) DEFAULT NULL,
  `deathyear` char(50) DEFAULT NULL,
  `name` char(50) NOT NULL DEFAULT '',
  `gender` char(1) DEFAULT NULL,
  `affilation` char(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `characters`
--

INSERT INTO `characters` (`birthyear`, `deathyear`, `name`, `gender`, `affilation`) VALUES
('36 years before the Battle of Yavin', '21 years before the Battle of Yavin on Mortis duri', 'Ahsoka Tano', 'F', 'Jedi'),
('54 BBY', 'Alive', 'Darth Maul', 'M', 'Sith'),
('41.9 BBY', '4 ABY', 'Darth Vader', 'M', 'Sith'),
('Some time during the last years of the Galactic Re', '34 years after the Battle of Yavin; during the Bat', 'Han Solo', 'M', 'Resistance'),
('19  BBY (16:5:24), Polis Massa', 'Alive', 'Leia Organa Solo', 'F', 'New Republic'),
('19 years before the Battle of Yavin[', 'Alive', 'Luke Skywalker', 'M', 'Jedi'),
('57 years before the Battle of Yavin', 'Shortly before the Battle of Yavin', 'Obi-Wan Kenobi', 'M', 'Jedi'),
('14 years before the Invasion of Naboo', '19 years before the Battle of Yavin', 'Padme Amidala', 'F', 'Imperial Senate'),
('82 BBY', '4 ABY', 'Palpatine', 'M', 'Sith'),
('900 years before the Battle of Endor', 'On Dagobah, Shortly before the Battle of Endor', 'Yoda', 'M', 'Jedi');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comes_from`
--

CREATE TABLE IF NOT EXISTS `comes_from` (
  `name` char(50) NOT NULL DEFAULT '',
  `planetname` char(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `comes_from`
--

INSERT INTO `comes_from` (`name`, `planetname`) VALUES
('Ahsoka Tano', 'Shili'),
('Darth Maul', 'Dathomir'),
('Darth Vader', 'Tatooine'),
('Han Solo', 'Corellia'),
('Leia Organa Solo', 'Alderaan'),
('Luke Skywalker', 'Tatooine'),
('Obi-Wan Kenobi', 'Stewjon'),
('Padme Amidala', 'Naboo'),
('Palpatine', 'Naboo'),
('Yoda', 'Dagobah');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kind_of`
--

CREATE TABLE IF NOT EXISTS `kind_of` (
  `name` char(50) NOT NULL,
  `speciename` char(50) NOT NULL,
  PRIMARY KEY (`name`,`speciename`),
  KEY `speciename` (`speciename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `kind_of`
--

INSERT INTO `kind_of` (`name`, `speciename`) VALUES
('Darth Maul', 'Dathomirian'),
('Darth Vader', 'Human'),
('Han Solo', 'Human'),
('Leia Organa Solo', 'Human'),
('Luke Skywalker', 'Human'),
('Padme Amidala', 'Human'),
('Palpatine', 'Human'),
('Ahsoka Tano', 'Togruta'),
('Obi-Wan Kenobi', 'Yoda''s species'),
('Yoda', 'Yoda''s species');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lives`
--

CREATE TABLE IF NOT EXISTS `lives` (
  `status` char(50) DEFAULT NULL,
  `speciename` char(50) NOT NULL DEFAULT '',
  `planetname` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`planetname`,`speciename`),
  KEY `speciename` (`speciename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `lives`
--

INSERT INTO `lives` (`status`, `speciename`, `planetname`) VALUES
('Native', 'Human', 'Coruscant'),
('?mmigrant', 'Yoda''s species', 'Dagobah'),
('Native', 'Dathomirian', 'Dathomir'),
('Native', 'Ewok', 'Endor'),
('Native', 'Wookie', 'Kashyyyk'),
('Native', 'Elders', 'Naboo'),
('Native', 'Gungan', 'Naboo'),
('Native', 'Togruta', 'Shili'),
('Native', 'Jawa', 'Tatooine'),
('Native', 'Tusken Raider', 'Tatooine');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `located_in`
--

CREATE TABLE IF NOT EXISTS `located_in` (
  `planetname` char(50) NOT NULL DEFAULT '',
  `systemname` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`planetname`),
  KEY `systemname` (`systemname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `located_in`
--

INSERT INTO `located_in` (`planetname`, `systemname`) VALUES
('Alderaan', 'Alderaan System'),
('Corellia', 'Corellia System'),
('Coruscant', 'Coruscant System'),
('Dagobah', 'Dagobah System'),
('Dathomir', 'Dathomir System'),
('Endor', 'Endor System'),
('Kashyyyk', 'Kashyyyk System'),
('Naboo', 'Naboo System'),
('Shili', 'Shili System'),
('Tatooine', 'Tatoo System');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `planets`
--

CREATE TABLE IF NOT EXISTS `planets` (
  `climate` char(50) DEFAULT NULL,
  `planetname` char(50) NOT NULL DEFAULT '',
  `planguage` char(50) DEFAULT NULL,
  `moon_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`planetname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `planets`
--

INSERT INTO `planets` (`climate`, `planetname`, `planguage`, `moon_number`) VALUES
('Temperate', 'Alderaan', 'Galactic Basic Standart', 1),
('Temperate', 'Corellia', 'Old Corellian', 3),
('Temperate', 'Coruscant', 'Basic', 3),
('Murky', 'Dagobah', NULL, 1),
('Cool', 'Dathomir', 'Peacian', 4),
('Temperate', 'Endor', 'Ewokese', 1),
('Temperate', 'Kashyyyk', 'Shyriwook', 3),
('Temperate', 'Naboo', 'Basic', 2),
('Temperate', 'Shili', 'Togruti', 6),
('Temperate', 'Stewjon', 'Galactic Basic Standart', 3),
('Hot and arid', 'Tatooine', 'Basic', 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `species`
--

CREATE TABLE IF NOT EXISTS `species` (
  `speciename` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`speciename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `species`
--

INSERT INTO `species` (`speciename`) VALUES
('Dathomirian'),
('Elders'),
('Ewok'),
('Gungan'),
('Human'),
('Jawa'),
('Togruta'),
('Tusken Raider'),
('Wookie'),
('Yoda''s species');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `systems`
--

CREATE TABLE IF NOT EXISTS `systems` (
  `systemname` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`systemname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `systems`
--

INSERT INTO `systems` (`systemname`) VALUES
('Alderaan System'),
('Corellia System'),
('Coruscant System'),
('Dagobah System'),
('Dathomir System'),
('Endor System'),
('Kashyyyk System'),
('Naboo System'),
('Shili System'),
('Tatoo System');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `comes_from`
--
ALTER TABLE `comes_from`
  ADD CONSTRAINT `comes_from_ibfk_1` FOREIGN KEY (`name`) REFERENCES `characters` (`name`);

--
-- Tablo kısıtlamaları `lives`
--
ALTER TABLE `lives`
  ADD CONSTRAINT `lives_ibfk_1` FOREIGN KEY (`planetname`) REFERENCES `planets` (`planetname`),
  ADD CONSTRAINT `lives_ibfk_2` FOREIGN KEY (`speciename`) REFERENCES `species` (`speciename`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
