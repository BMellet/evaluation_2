-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 04, 2018 at 04:49 PM
-- Server version: 5.7.22-0ubuntu0.17.10.1
-- PHP Version: 7.1.17-0ubuntu0.17.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `evaluation_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `categorie_id` int(11) NOT NULL,
  `categorie_nom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chambre`
--

CREATE TABLE `chambre` (
  `chambre_id` int(11) NOT NULL,
  `chambre_nom` varchar(45) NOT NULL,
  `chambre_superficie` float NOT NULL,
  `chambre_acces_handicape` tinyint(1) NOT NULL,
  `chambre_etage` int(11) NOT NULL,
  `chambre_vue` varchar(45) NOT NULL,
  `chambre_suite` tinyint(1) NOT NULL,
  `chambre_prix` float NOT NULL,
  `fk_lit_id` int(11) NOT NULL,
  `fk_sdb_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `client_prenom` varchar(45) NOT NULL,
  `client_nom` varchar(45) NOT NULL,
  `client_telephone` int(11) NOT NULL,
  `client_email` varchar(45) NOT NULL,
  `client_adresse` varchar(45) NOT NULL,
  `client_mdp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE `commande` (
  `commande_id` int(11) NOT NULL,
  `fk_client_id` int(11) NOT NULL,
  `fk_reservation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `etat`
--

CREATE TABLE `etat` (
  `etat_id` int(11) NOT NULL,
  `etat_nom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lit`
--

CREATE TABLE `lit` (
  `lit_id` int(11) NOT NULL,
  `lit_nom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `reservation_arrivee` date NOT NULL,
  `reservation_depart` date NOT NULL,
  `fk_etat_id` int(11) NOT NULL,
  `fk_client_id` int(11) NOT NULL,
  `fk_chambre_id` int(11) NOT NULL,
  `reservation_nombre_nuits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salle_de_bain`
--

CREATE TABLE `salle_de_bain` (
  `salle_de_bain_id` int(11) NOT NULL,
  `salle_de_bain_nom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `service_id` int(11) NOT NULL,
  `service_nom` varchar(45) NOT NULL,
  `service_description` text NOT NULL,
  `service_prix` float NOT NULL,
  `fk_categorie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `service_chambre`
--

CREATE TABLE `service_chambre` (
  `fk_chambre_id` int(11) NOT NULL,
  `fk_service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `service_commande`
--

CREATE TABLE `service_commande` (
  `fk_service_id` int(11) NOT NULL,
  `fk_commande_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`categorie_id`),
  ADD UNIQUE KEY `categorie_id_UNIQUE` (`categorie_id`);

--
-- Indexes for table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`chambre_id`),
  ADD UNIQUE KEY `chambre_id_UNIQUE` (`chambre_id`),
  ADD KEY `fk_lit_id_idx` (`fk_lit_id`),
  ADD KEY `fk_sdb_id_idx` (`fk_sdb_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`),
  ADD UNIQUE KEY `client_id_UNIQUE` (`client_id`);

--
-- Indexes for table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`commande_id`),
  ADD UNIQUE KEY `commande_id_UNIQUE` (`commande_id`),
  ADD KEY `fk_client_id_idx` (`fk_client_id`),
  ADD KEY `fk_reservation_idx` (`fk_reservation_id`);

--
-- Indexes for table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`etat_id`),
  ADD UNIQUE KEY `etat_id_UNIQUE` (`etat_id`);

--
-- Indexes for table `lit`
--
ALTER TABLE `lit`
  ADD PRIMARY KEY (`lit_id`),
  ADD UNIQUE KEY `lit_id_UNIQUE` (`lit_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD UNIQUE KEY `reservation_id_UNIQUE` (`reservation_id`),
  ADD KEY `fk_etat_id_idx` (`fk_etat_id`),
  ADD KEY `fk_client_id_idx` (`fk_client_id`),
  ADD KEY `fk_chambre_id_idx` (`fk_chambre_id`);

--
-- Indexes for table `salle_de_bain`
--
ALTER TABLE `salle_de_bain`
  ADD PRIMARY KEY (`salle_de_bain_id`),
  ADD UNIQUE KEY `salle_de_bain_id_UNIQUE` (`salle_de_bain_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`),
  ADD UNIQUE KEY `service_id_UNIQUE` (`service_id`),
  ADD KEY `fk_categorie_id_idx` (`fk_categorie_id`);

--
-- Indexes for table `service_chambre`
--
ALTER TABLE `service_chambre`
  ADD PRIMARY KEY (`fk_chambre_id`,`fk_service_id`),
  ADD KEY `fk_service_id_idx` (`fk_service_id`);

--
-- Indexes for table `service_commande`
--
ALTER TABLE `service_commande`
  ADD PRIMARY KEY (`fk_service_id`,`fk_commande_id`),
  ADD KEY `fk_commande_id_idx` (`fk_commande_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `categorie_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chambre`
--
ALTER TABLE `chambre`
  MODIFY `chambre_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `commande`
--
ALTER TABLE `commande`
  MODIFY `commande_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `etat`
--
ALTER TABLE `etat`
  MODIFY `etat_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lit`
--
ALTER TABLE `lit`
  MODIFY `lit_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `salle_de_bain`
--
ALTER TABLE `salle_de_bain`
  MODIFY `salle_de_bain_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `chambre`
--
ALTER TABLE `chambre`
  ADD CONSTRAINT `fk_lit_id` FOREIGN KEY (`fk_lit_id`) REFERENCES `lit` (`lit_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sdb_id` FOREIGN KEY (`fk_sdb_id`) REFERENCES `salle_de_bain` (`salle_de_bain_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_client` FOREIGN KEY (`fk_client_id`) REFERENCES `client` (`client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reservation` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_chambre_id` FOREIGN KEY (`fk_chambre_id`) REFERENCES `chambre` (`chambre_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_client_id` FOREIGN KEY (`fk_client_id`) REFERENCES `client` (`client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_etat_id` FOREIGN KEY (`fk_etat_id`) REFERENCES `etat` (`etat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `fk_categorie_id` FOREIGN KEY (`fk_categorie_id`) REFERENCES `categorie` (`categorie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `service_chambre`
--
ALTER TABLE `service_chambre`
  ADD CONSTRAINT `fk_chambre_id_sc` FOREIGN KEY (`fk_chambre_id`) REFERENCES `chambre` (`chambre_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_service_id_sc` FOREIGN KEY (`fk_service_id`) REFERENCES `service` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `service_commande`
--
ALTER TABLE `service_commande`
  ADD CONSTRAINT `fk_commande_id_scom` FOREIGN KEY (`fk_commande_id`) REFERENCES `commande` (`commande_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_service_id_scom` FOREIGN KEY (`fk_service_id`) REFERENCES `service` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
