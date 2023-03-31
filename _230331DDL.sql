-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: 10.3.0.253    Database: TPV2
-- ------------------------------------------------------
-- Server version	5.5.50-MariaDB

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

drop database if exists TPVEX181204;
create database TPVEX181204;
use TPVEX181204;

--
-- Table structure for table `Compras`
--

DROP TABLE IF EXISTS `Compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Compras` (
  `idcompra` float NOT NULL AUTO_INCREMENT,
  `fechahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `socioid` int(11) NOT NULL,
  PRIMARY KEY (`idcompra`),
  KEY (`socioid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Compras`
--

LOCK TABLES `Compras` WRITE;
/*!40000 ALTER TABLE `Compras` DISABLE KEYS */;
INSERT INTO `Compras` VALUES (1,'2016-12-19 14:51:43',2),(2,'2016-12-19 14:52:01',3),(3,'2016-12-18 23:00:00',4),(5,'2016-12-19 14:52:33',1);
/*!40000 ALTER TABLE `Compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lineas_Ticket`
--

DROP TABLE IF EXISTS `Lineas_Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lineas_Ticket` (
  `idlineaticket` int(11) NOT NULL AUTO_INCREMENT,
  `productoid` int(11) NOT NULL,
  `compraid` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '1',
  `precio` float(8,2) NOT NULL,
  PRIMARY KEY (`idlineaticket`),
  KEY `linea_producto_fk` (`productoid`),
  KEY `linea_compra_fk` (`compraid`),
  CONSTRAINT `linea_producto_fk` FOREIGN KEY (`compraid`) REFERENCES `Compras` (`socioid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lineas_Ticket`
--

LOCK TABLES `Lineas_Ticket` WRITE;
/*!40000 ALTER TABLE `Lineas_Ticket` DISABLE KEYS */;
INSERT INTO `Lineas_Ticket` VALUES (1,1,2,3,4.50),(2,5,2,2,4.00),(3,2,4,3,7.00);
/*!40000 ALTER TABLE `Lineas_Ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ofertas`
--

DROP TABLE IF EXISTS `Ofertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ofertas` (
  `idoferta` int(11) NOT NULL AUTO_INCREMENT,
  `precio` float(8,2) NOT NULL,
  `cantidad` smallint(6) NOT NULL DEFAULT '1',
  `desde` date NOT NULL,
  `hasta` date DEFAULT NULL,
  `productoid` int(11) NOT NULL,
  PRIMARY KEY (`idoferta`),
  UNIQUE KEY `desde_uq` (`desde`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ofertas`
--

LOCK TABLES `Ofertas` WRITE;
/*!40000 ALTER TABLE `Ofertas` DISABLE KEYS */;
INSERT INTO `Ofertas` VALUES (11,1.20,2,'2016-12-19','2016-12-19',3),(12,2.35,1,'2016-12-18','2016-12-19',5);
/*!40000 ALTER TABLE `Ofertas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Productos`
--

DROP TABLE IF EXISTS `Productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Productos` (
  `idproducto` int(11) NOT NULL,
  `marca` varchar(20) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `pvp` float(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productos`
--

LOCK TABLES `Productos` WRITE;
/*!40000 ALTER TABLE `Productos` DISABLE KEYS */;
INSERT INTO `Productos` VALUES (1,'Coca cola','Lata',3.54),(2,'Yogourt','Fresa 1L',2.50);
/*!40000 ALTER TABLE `Productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Socios`
--

DROP TABLE IF EXISTS `Socios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Socios` (
  `idsocio` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `email` varchar(200),
  `telefono` varchar(12) NOT NULL,
  `fechaalta` date NOT NULL,
  primary key (email)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Socios`
--

LOCK TABLES `Socios` WRITE;
/*!40000 ALTER TABLE `Socios` DISABLE KEYS */;
INSERT INTO `Socios` VALUES (1,'Pepe','Perez','654321987','2016-12-19',NULL),(2,'Dora','García','678456345','2016-12-19',NULL),(3,'Juan','Ortiz','987654321','2016-12-19',NULL),(4,'Montse','Rojas','777555333','2016-12-19',NULL);
/*!40000 ALTER TABLE `Socios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-14 15:57:57
