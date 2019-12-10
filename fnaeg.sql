-- MySQL dump 10.16  Distrib 10.1.43-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: fnaeg
-- ------------------------------------------------------
-- Server version	10.1.43-MariaDB-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `affaires`
--

DROP TABLE IF EXISTS `affaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affaires` (
  `NumAffaire` varchar(30) NOT NULL,
  `DateAffaire` date DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `CodeLab` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`NumAffaire`),
  KEY `CodeLab` (`CodeLab`),
  CONSTRAINT `affaires_ibfk_1` FOREIGN KEY (`CodeLab`) REFERENCES `labos` (`CodeLab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affaires`
--

LOCK TABLES `affaires` WRITE;
/*!40000 ALTER TABLE `affaires` DISABLE KEYS */;
/*!40000 ALTER TABLE `affaires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdes`
--

DROP TABLE IF EXISTS `cdes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdes` (
  `CodeKit` varchar(30) NOT NULL,
  `CodeLab` varchar(30) NOT NULL,
  `DateCde` date NOT NULL,
  `Qte` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodeKit`,`CodeLab`,`DateCde`),
  KEY `CodeLab` (`CodeLab`),
  CONSTRAINT `cdes_ibfk_1` FOREIGN KEY (`CodeKit`) REFERENCES `kits` (`CodeKit`),
  CONSTRAINT `cdes_ibfk_2` FOREIGN KEY (`CodeLab`) REFERENCES `labos` (`CodeLab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdes`
--

LOCK TABLES `cdes` WRITE;
/*!40000 ALTER TABLE `cdes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chromosomes`
--

DROP TABLE IF EXISTS `chromosomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chromosomes` (
  `NumChromo` varchar(30) NOT NULL,
  PRIMARY KEY (`NumChromo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chromosomes`
--

LOCK TABLES `chromosomes` WRITE;
/*!40000 ALTER TABLE `chromosomes` DISABLE KEYS */;
/*!40000 ALTER TABLE `chromosomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fabricants`
--

DROP TABLE IF EXISTS `fabricants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fabricants` (
  `CodeF` varchar(30) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Pays` varchar(255) DEFAULT NULL,
  `Ville` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CodeF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fabricants`
--

LOCK TABLES `fabricants` WRITE;
/*!40000 ALTER TABLE `fabricants` DISABLE KEYS */;
INSERT INTO `fabricants` VALUES ('F001','Atos Sciences','France','Lyon'),('F002','Cap Gemino','France','Lyon');
/*!40000 ALTER TABLE `fabricants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infractions`
--

DROP TABLE IF EXISTS `infractions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infractions` (
  `CodeI` varchar(30) NOT NULL,
  `Libelle` varchar(255) DEFAULT NULL,
  `Niveau` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodeI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infractions`
--

LOCK TABLES `infractions` WRITE;
/*!40000 ALTER TABLE `infractions` DISABLE KEYS */;
/*!40000 ALTER TABLE `infractions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kits`
--

DROP TABLE IF EXISTS `kits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kits` (
  `CodeKit` varchar(30) NOT NULL,
  `prix` float DEFAULT NULL,
  `Annee` date DEFAULT NULL,
  `Duree` int(11) DEFAULT NULL,
  `CodeF` varchar(30) DEFAULT NULL,
  `Stock` int(11) DEFAULT '0',
  PRIMARY KEY (`CodeKit`),
  KEY `CodeF` (`CodeF`),
  CONSTRAINT `kits_ibfk_1` FOREIGN KEY (`CodeF`) REFERENCES `fabricants` (`CodeF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kits`
--

LOCK TABLES `kits` WRITE;
/*!40000 ALTER TABLE `kits` DISABLE KEYS */;
INSERT INTO `kits` VALUES ('Assertion',2000,'2019-01-01',3,'F001',5),('K001',40,'2019-05-01',4,'F001',13),('K002',10,'2019-05-01',40,'F001',0),('K003',30,'2019-05-01',24,'F001',0),('K004',25,'2019-05-01',12,'F001',3),('K005',40,'2019-05-01',4,'F001',1),('K006',15,'2018-06-03',9,'F001',9),('K007',17,'2017-06-03',19,'F001',22);
/*!40000 ALTER TABLE `kits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labos`
--

DROP TABLE IF EXISTS `labos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labos` (
  `CodeLab` varchar(30) NOT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Ville` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CodeLab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labos`
--

LOCK TABLES `labos` WRITE;
/*!40000 ALTER TABLE `labos` DISABLE KEYS */;
/*!40000 ALTER TABLE `labos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locus`
--

DROP TABLE IF EXISTS `locus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locus` (
  `CodeLocus` varchar(30) NOT NULL,
  `Position` int(11) DEFAULT NULL,
  `Sequence` float DEFAULT NULL,
  `NBCarSeq` int(11) DEFAULT NULL,
  `LocPdt` float DEFAULT NULL,
  `LocSvt` float DEFAULT NULL,
  `NumChromo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CodeLocus`),
  KEY `NumChromo` (`NumChromo`),
  CONSTRAINT `locus_ibfk_1` FOREIGN KEY (`NumChromo`) REFERENCES `chromosomes` (`NumChromo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locus`
--

LOCK TABLES `locus` WRITE;
/*!40000 ALTER TABLE `locus` DISABLE KEYS */;
/*!40000 ALTER TABLE `locus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marqueurs`
--

DROP TABLE IF EXISTS `marqueurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marqueurs` (
  `CodeLocus` varchar(30) NOT NULL,
  `CodeKit` varchar(30) NOT NULL,
  `couleur` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CodeLocus`,`CodeKit`),
  KEY `CodeKit` (`CodeKit`),
  CONSTRAINT `marqueurs_ibfk_1` FOREIGN KEY (`CodeKit`) REFERENCES `kits` (`CodeKit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marqueurs`
--

LOCK TABLES `marqueurs` WRITE;
/*!40000 ALTER TABLE `marqueurs` DISABLE KEYS */;
/*!40000 ALTER TABLE `marqueurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnes`
--

DROP TABLE IF EXISTS `personnes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personnes` (
  `Matricule` varchar(30) NOT NULL,
  `Nom` varchar(100) DEFAULT NULL,
  `Prenom` varchar(30) DEFAULT NULL,
  `DateNaissance` date DEFAULT NULL,
  `Adresse` varchar(255) DEFAULT NULL,
  `Ville` varchar(100) DEFAULT NULL,
  `Pays` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Matricule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnes`
--

LOCK TABLES `personnes` WRITE;
/*!40000 ALTER TABLE `personnes` DISABLE KEYS */;
/*!40000 ALTER TABLE `personnes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profil_individu`
--

DROP TABLE IF EXISTS `profil_individu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profil_individu` (
  `Matricule` varchar(30) NOT NULL,
  `CodeLocus` varchar(30) NOT NULL,
  `Allele1` float DEFAULT NULL,
  `Allele2` float DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `CodeLab` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Matricule`,`CodeLocus`),
  KEY `CodeLab` (`CodeLab`),
  CONSTRAINT `profil_individu_ibfk_1` FOREIGN KEY (`CodeLab`) REFERENCES `cdes` (`CodeLab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profil_individu`
--

LOCK TABLES `profil_individu` WRITE;
/*!40000 ALTER TABLE `profil_individu` DISABLE KEYS */;
/*!40000 ALTER TABLE `profil_individu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scelles`
--

DROP TABLE IF EXISTS `scelles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scelles` (
  `NumAffaire` varchar(30) NOT NULL,
  `NumScelle` varchar(30) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`NumAffaire`,`NumScelle`),
  CONSTRAINT `scelles_ibfk_1` FOREIGN KEY (`NumAffaire`) REFERENCES `affaires` (`NumAffaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scelles`
--

LOCK TABLES `scelles` WRITE;
/*!40000 ALTER TABLE `scelles` DISABLE KEYS */;
/*!40000 ALTER TABLE `scelles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-10 16:41:18
