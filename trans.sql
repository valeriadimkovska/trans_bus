-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2019 at 12:33 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trans`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID_admin` int(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID_admin`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$vxJuIaAMpr8nq7EMuvTQjeIIxKMsuc5dh6axafXPYccKv7ocFbTgm');

-- --------------------------------------------------------

--
-- Table structure for table `avtobus`
--

CREATE TABLE `avtobus` (
  `ID_avtobus` int(10) NOT NULL,
  `pocetna` varchar(10) NOT NULL,
  `krajna` varchar(10) NOT NULL,
  `ID_kompanija` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `avtobus`
--

INSERT INTO `avtobus` (`ID_avtobus`, `pocetna`, `krajna`, `ID_kompanija`) VALUES
(1, 'Охрид', 'Кочани', 1),
(2, 'Струмица', 'Скопје', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kompanija`
--

CREATE TABLE `kompanija` (
  `ID_kompanija` int(10) NOT NULL,
  `ime` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kompanija`
--

INSERT INTO `kompanija` (`ID_kompanija`, `ime`) VALUES
(1, 'Галеб'),
(2, 'Струмица Експрес');

-- --------------------------------------------------------

--
-- Stand-in structure for view `korisnik_rez`
-- (See below for the actual view)
--
CREATE TABLE `korisnik_rez` (
`Корисник` varchar(20)
,`Име` varchar(15)
,`Презиме` varchar(15)
,`Поаѓање` varchar(20)
,`Дестинација` varchar(20)
,`Тргнува` varchar(10)
,`Датум` date
,`Цена` int(10)
,`Компанија` varchar(40)
);

-- --------------------------------------------------------

--
-- Table structure for table `patnik`
--

CREATE TABLE `patnik` (
  `ID_patnik` int(10) NOT NULL,
  `ime` varchar(15) NOT NULL,
  `prezime` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patnik`
--

INSERT INTO `patnik` (`ID_patnik`, `ime`, `prezime`, `email`, `username`, `password`) VALUES
(1, 'Петар', 'Петрески', 'petar@hotmail.com', 'Petar', '$2y$10$N.bwoyW9b17Sx1tpPXf9Je3razIa41EVDNpB4d3vKw8Rq3i/LuS6G');

-- --------------------------------------------------------

--
-- Stand-in structure for view `patnik_rez`
-- (See below for the actual view)
--
CREATE TABLE `patnik_rez` (
`Рута` int(10)
,`Име` varchar(15)
,`Презиме` varchar(15)
,`Поаѓање` varchar(20)
,`Дестинација` varchar(20)
,`Тргнува` varchar(10)
,`Датум` date
,`Цена` int(10)
,`Компанија` varchar(40)
);

-- --------------------------------------------------------

--
-- Table structure for table `patnik_ruta`
--

CREATE TABLE `patnik_ruta` (
  `ID_patnik_ruta` int(10) NOT NULL,
  `ID_ruta` int(10) NOT NULL,
  `ID_patnik` int(10) NOT NULL,
  `ID_rezervacija` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patnik_ruta`
--

INSERT INTO `patnik_ruta` (`ID_patnik_ruta`, `ID_ruta`, `ID_patnik`, `ID_rezervacija`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `plakjanje`
--

CREATE TABLE `plakjanje` (
  `ID_plakjanje` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `cardNumber` varchar(16) NOT NULL,
  `cardExpiry` varchar(5) NOT NULL,
  `cardCVC` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plakjanje`
--

INSERT INTO `plakjanje` (`ID_plakjanje`, `name`, `cardNumber`, `cardExpiry`, `cardCVC`) VALUES
(1, 'Petar Petreski', '1234123412341234', '05/21', 202);

-- --------------------------------------------------------

--
-- Table structure for table `rezervacija`
--

CREATE TABLE `rezervacija` (
  `ID_rezervacija` int(10) NOT NULL,
  `data` date NOT NULL,
  `ID_plakjanje` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rezervacija`
--

INSERT INTO `rezervacija` (`ID_rezervacija`, `data`, `ID_plakjanje`) VALUES
(1, '2019-01-31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ruta`
--

CREATE TABLE `ruta` (
  `ID_ruta` int(10) NOT NULL,
  `ID_avtobus` int(15) NOT NULL,
  `vremetraenje` varchar(30) NOT NULL,
  `cena` int(10) NOT NULL,
  `poagjanje` varchar(20) NOT NULL,
  `destinacija` varchar(20) NOT NULL,
  `vreme_poag` varchar(10) NOT NULL,
  `vreme_dest` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ruta`
--

INSERT INTO `ruta` (`ID_ruta`, `ID_avtobus`, `vremetraenje`, `cena`, `poagjanje`, `destinacija`, `vreme_poag`, `vreme_dest`) VALUES
(1, 1, '05:30', 530, 'Охрид', 'Штип', '06:00', '12:30'),
(2, 1, '03:30', 300, 'Битола', 'Велес', '08:00', '11:30');

-- --------------------------------------------------------

--
-- Stand-in structure for view `ruta_se`
-- (See below for the actual view)
--
CREATE TABLE `ruta_se` (
`поаѓање` varchar(20)
,`дестинација` varchar(20)
,`тргнува` varchar(10)
,`пристигнува` varchar(10)
,`цена` int(10)
,`компанија` varchar(40)
);

-- --------------------------------------------------------

--
-- Structure for view `korisnik_rez`
--
DROP TABLE IF EXISTS `korisnik_rez`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `korisnik_rez`  AS  select `p`.`username` AS `Корисник`,`p`.`ime` AS `Име`,`p`.`prezime` AS `Презиме`,`r`.`poagjanje` AS `Поаѓање`,`r`.`destinacija` AS `Дестинација`,`r`.`vreme_poag` AS `Тргнува`,`re`.`data` AS `Датум`,`r`.`cena` AS `Цена`,`k`.`ime` AS `Компанија` from (((((`patnik` `p` join `patnik_ruta` `pr` on((`p`.`ID_patnik` = `pr`.`ID_patnik`))) join `ruta` `r` on((`pr`.`ID_ruta` = `r`.`ID_ruta`))) join `rezervacija` `re` on((`re`.`ID_rezervacija` = `pr`.`ID_rezervacija`))) join `avtobus` `a` on((`r`.`ID_avtobus` = `a`.`ID_avtobus`))) join `kompanija` `k` on((`k`.`ID_kompanija` = `a`.`ID_kompanija`))) ;

-- --------------------------------------------------------

--
-- Structure for view `patnik_rez`
--
DROP TABLE IF EXISTS `patnik_rez`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `patnik_rez`  AS  select `r`.`ID_ruta` AS `Рута`,`p`.`ime` AS `Име`,`p`.`prezime` AS `Презиме`,`r`.`poagjanje` AS `Поаѓање`,`r`.`destinacija` AS `Дестинација`,`r`.`vreme_poag` AS `Тргнува`,`re`.`data` AS `Датум`,`r`.`cena` AS `Цена`,`k`.`ime` AS `Компанија` from (((((`patnik` `p` join `patnik_ruta` `pr` on((`p`.`ID_patnik` = `pr`.`ID_patnik`))) join `ruta` `r` on((`pr`.`ID_ruta` = `r`.`ID_ruta`))) join `rezervacija` `re` on((`re`.`ID_rezervacija` = `pr`.`ID_rezervacija`))) join `avtobus` `a` on((`r`.`ID_avtobus` = `a`.`ID_avtobus`))) join `kompanija` `k` on((`k`.`ID_kompanija` = `a`.`ID_kompanija`))) ;

-- --------------------------------------------------------

--
-- Structure for view `ruta_se`
--
DROP TABLE IF EXISTS `ruta_se`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ruta_se`  AS  select `r`.`poagjanje` AS `поаѓање`,`r`.`destinacija` AS `дестинација`,`r`.`vreme_poag` AS `тргнува`,`r`.`vreme_dest` AS `пристигнува`,`r`.`cena` AS `цена`,`k`.`ime` AS `компанија` from ((`ruta` `r` join `avtobus` `a` on((`r`.`ID_avtobus` = `a`.`ID_avtobus`))) join `kompanija` `k` on((`k`.`ID_kompanija` = `a`.`ID_kompanija`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_admin`);

--
-- Indexes for table `avtobus`
--
ALTER TABLE `avtobus`
  ADD PRIMARY KEY (`ID_avtobus`),
  ADD KEY `ID_kompanija` (`ID_kompanija`);

--
-- Indexes for table `kompanija`
--
ALTER TABLE `kompanija`
  ADD PRIMARY KEY (`ID_kompanija`);

--
-- Indexes for table `patnik`
--
ALTER TABLE `patnik`
  ADD PRIMARY KEY (`ID_patnik`);

--
-- Indexes for table `patnik_ruta`
--
ALTER TABLE `patnik_ruta`
  ADD PRIMARY KEY (`ID_patnik_ruta`),
  ADD KEY `ID_ruta` (`ID_ruta`),
  ADD KEY `ID_patnik` (`ID_patnik`),
  ADD KEY `ID_rezervacija` (`ID_rezervacija`);

--
-- Indexes for table `plakjanje`
--
ALTER TABLE `plakjanje`
  ADD PRIMARY KEY (`ID_plakjanje`);

--
-- Indexes for table `rezervacija`
--
ALTER TABLE `rezervacija`
  ADD PRIMARY KEY (`ID_rezervacija`),
  ADD UNIQUE KEY `ID_plakjanje` (`ID_plakjanje`);

--
-- Indexes for table `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`ID_ruta`),
  ADD KEY `ID_avtobus` (`ID_avtobus`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID_admin` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `avtobus`
--
ALTER TABLE `avtobus`
  MODIFY `ID_avtobus` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kompanija`
--
ALTER TABLE `kompanija`
  MODIFY `ID_kompanija` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patnik`
--
ALTER TABLE `patnik`
  MODIFY `ID_patnik` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patnik_ruta`
--
ALTER TABLE `patnik_ruta`
  MODIFY `ID_patnik_ruta` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `plakjanje`
--
ALTER TABLE `plakjanje`
  MODIFY `ID_plakjanje` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rezervacija`
--
ALTER TABLE `rezervacija`
  MODIFY `ID_rezervacija` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ruta`
--
ALTER TABLE `ruta`
  MODIFY `ID_ruta` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `avtobus`
--
ALTER TABLE `avtobus`
  ADD CONSTRAINT `avtobus_ibfk_1` FOREIGN KEY (`ID_kompanija`) REFERENCES `kompanija` (`ID_kompanija`);

--
-- Constraints for table `patnik_ruta`
--
ALTER TABLE `patnik_ruta`
  ADD CONSTRAINT `patnik_ruta_ibfk_1` FOREIGN KEY (`ID_patnik`) REFERENCES `patnik` (`ID_patnik`),
  ADD CONSTRAINT `patnik_ruta_ibfk_2` FOREIGN KEY (`ID_ruta`) REFERENCES `ruta` (`ID_ruta`),
  ADD CONSTRAINT `patnik_ruta_ibfk_3` FOREIGN KEY (`ID_rezervacija`) REFERENCES `rezervacija` (`ID_rezervacija`);

--
-- Constraints for table `rezervacija`
--
ALTER TABLE `rezervacija`
  ADD CONSTRAINT `rezervacija_ibfk_1` FOREIGN KEY (`ID_plakjanje`) REFERENCES `plakjanje` (`ID_plakjanje`);

--
-- Constraints for table `ruta`
--
ALTER TABLE `ruta`
  ADD CONSTRAINT `ruta_ibfk_1` FOREIGN KEY (`ID_avtobus`) REFERENCES `avtobus` (`ID_avtobus`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
