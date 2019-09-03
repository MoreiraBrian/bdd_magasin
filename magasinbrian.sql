CREATE DATABASE `magasin`;
Use `magasin`
-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: magasin
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.19.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adresse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  `id_code_postal` int(11) NOT NULL,
  `id_ville` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`),
  KEY `fk_code_postal` (`id_code_postal`),
  KEY `fk_ville` (`id_ville`),
  CONSTRAINT `fk_code_postal` FOREIGN KEY (`id_code_postal`) REFERENCES `code_postal` (`id`),
  CONSTRAINT `fk_ville` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse`
--

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
INSERT INTO `adresse` VALUES (1,'31 rue jules vergne',1,1),(2,'10 rue dominique',2,2);
/*!40000 ALTER TABLE `adresse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chaussure`
--

DROP TABLE IF EXISTS `chaussure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chaussure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modele` varchar(50) NOT NULL,
  `id_marque` int(11) NOT NULL,
  `prix` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_marque` (`id_marque`),
  CONSTRAINT `fk_marque` FOREIGN KEY (`id_marque`) REFERENCES `marque` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chaussure`
--

LOCK TABLES `chaussure` WRITE;
/*!40000 ALTER TABLE `chaussure` DISABLE KEYS */;
INSERT INTO `chaussure` VALUES (1,'talons hauts',1,159.99),(2,'talons hauts',2,259.99);
/*!40000 ALTER TABLE `chaussure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chaussure_couleur`
--

DROP TABLE IF EXISTS `chaussure_couleur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chaussure_couleur` (
  `id_chaussure` int(11) NOT NULL,
  `id_couleur` int(11) NOT NULL,
  PRIMARY KEY (`id_chaussure`,`id_couleur`),
  KEY `fk_couleur2` (`id_couleur`),
  CONSTRAINT `fk_couleur1` FOREIGN KEY (`id_chaussure`) REFERENCES `chaussure` (`id`),
  CONSTRAINT `fk_couleur2` FOREIGN KEY (`id_couleur`) REFERENCES `couleur` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chaussure_couleur`
--

LOCK TABLES `chaussure_couleur` WRITE;
/*!40000 ALTER TABLE `chaussure_couleur` DISABLE KEYS */;
INSERT INTO `chaussure_couleur` VALUES (1,1),(2,3),(1,4);
/*!40000 ALTER TABLE `chaussure_couleur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `EMAIL` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Mignot','Paul','mignotpaul@gmail.com'),(2,'Moreira','Brian','brian.63@live.fr');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code_postal`
--

DROP TABLE IF EXISTS `code_postal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_postal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `num` (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code_postal`
--

LOCK TABLES `code_postal` WRITE;
/*!40000 ALTER TABLE `code_postal` DISABLE KEYS */;
INSERT INTO `code_postal` VALUES (1,63000),(2,64000);
/*!40000 ALTER TABLE `code_postal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `id_adresse` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_adresse` (`id_adresse`),
  KEY `fk_client` (`id_client`),
  CONSTRAINT `fk_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id`),
  CONSTRAINT `fk_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `couleur`
--

DROP TABLE IF EXISTS `couleur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `couleur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `couleur`
--

LOCK TABLES `couleur` WRITE;
/*!40000 ALTER TABLE `couleur` DISABLE KEYS */;
INSERT INTO `couleur` VALUES (2,'bleu'),(4,'marron'),(5,'noir'),(1,'rouge'),(3,'vert');
/*!40000 ALTER TABLE `couleur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marque`
--

DROP TABLE IF EXISTS `marque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_marque` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom_marque`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marque`
--

LOCK TABLES `marque` WRITE;
/*!40000 ALTER TABLE `marque` DISABLE KEYS */;
INSERT INTO `marque` VALUES (1,'guchi'),(2,'Prada');
/*!40000 ALTER TABLE `marque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pannier`
--

DROP TABLE IF EXISTS `pannier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pannier` (
  `id_chaussure` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL,
  `id_pointure` int(11) NOT NULL,
  `id_couleur` int(11) NOT NULL,
  KEY `fk_pannier2` (`id_commande`),
  KEY `fk_pannier3` (`id_pointure`),
  KEY `fk_pannier1` (`id_chaussure`,`id_couleur`),
  CONSTRAINT `fk_pannier1` FOREIGN KEY (`id_chaussure`, `id_couleur`) REFERENCES `chaussure_couleur` (`id_chaussure`, `id_couleur`),
  CONSTRAINT `fk_pannier2` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id`),
  CONSTRAINT `fk_pannier3` FOREIGN KEY (`id_pointure`) REFERENCES `pointure` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pannier`
--

LOCK TABLES `pannier` WRITE;
/*!40000 ALTER TABLE `pannier` DISABLE KEYS */;
INSERT INTO `pannier` VALUES (2,1,3,3),(1,2,3,4),(1,1,2,1);
/*!40000 ALTER TABLE `pannier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pointure`
--

DROP TABLE IF EXISTS `pointure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pointure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taille` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pointure`
--

LOCK TABLES `pointure` WRITE;
/*!40000 ALTER TABLE `pointure` DISABLE KEYS */;
INSERT INTO `pointure` VALUES (1,46),(2,39),(3,38);
/*!40000 ALTER TABLE `pointure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ville`
--

DROP TABLE IF EXISTS `ville`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ville` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ville`
--

LOCK TABLES `ville` WRITE;
/*!40000 ALTER TABLE `ville` DISABLE KEYS */;
INSERT INTO `ville` VALUES (1,'clermont-ferrand'),(2,'petaouchnoque');
/*!40000 ALTER TABLE `ville` ENABLE KEYS */;
UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-03 22:16:28
