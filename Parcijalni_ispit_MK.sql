-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: TvrtkaParcijalni
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `odjel`
--

DROP TABLE IF EXISTS `odjel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `odjel` (
  `ID_odjel` int NOT NULL AUTO_INCREMENT,
  `voditelj_odjela` varchar(50) DEFAULT NULL,
  `naziv_odjela` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_odjel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odjel`
--

LOCK TABLES `odjel` WRITE;
/*!40000 ALTER TABLE `odjel` DISABLE KEYS */;
INSERT INTO `odjel` VALUES (1,'Marin Marinić','Hitna medicinska pomoć'),(2,'Ana Anić','Kirurgija'),(3,'Marina Marinić','Internistička medicina'),(4,'Marko Markić','Kardiologija'),(5,'Iva Ivić','Pedijatrija');
/*!40000 ALTER TABLE `odjel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `placa`
--

DROP TABLE IF EXISTS `placa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `placa` (
  `ID_placa` int NOT NULL AUTO_INCREMENT,
  `ID_zaposlenik` int DEFAULT NULL,
  `iznos` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`ID_placa`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `placa`
--

LOCK TABLES `placa` WRITE;
/*!40000 ALTER TABLE `placa` DISABLE KEYS */;
INSERT INTO `placa` VALUES (1,1,1500.00),(2,2,1750.00),(3,3,1650.00),(4,4,1650.00),(5,5,1650.00),(6,6,991.00),(7,7,991.00);
/*!40000 ALTER TABLE `placa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pozicija`
--

DROP TABLE IF EXISTS `pozicija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pozicija` (
  `ID_pozicija` int NOT NULL AUTO_INCREMENT,
  `naziv_pozicije` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_pozicija`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pozicija`
--

LOCK TABLES `pozicija` WRITE;
/*!40000 ALTER TABLE `pozicija` DISABLE KEYS */;
INSERT INTO `pozicija` VALUES (1,'Voditelj HMP'),(2,'Voditelj Kirurgije'),(3,'Voditelj Internističke medicine'),(4,'Voditelj Kardiologije'),(5,'Voditelj Pedijatrije'),(6,'Medicinska sestra'),(7,'Medicinski tehničar');
/*!40000 ALTER TABLE `pozicija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zaposlenici`
--

DROP TABLE IF EXISTS `zaposlenici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zaposlenici` (
  `ID_zaposlenik` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(50) DEFAULT NULL,
  `prezime` varchar(50) DEFAULT NULL,
  `zvanje` varchar(50) DEFAULT NULL,
  `adresa` varchar(50) DEFAULT NULL,
  `placa` int DEFAULT NULL,
  `pozicija` int DEFAULT NULL,
  `odjel` int DEFAULT NULL,
  PRIMARY KEY (`ID_zaposlenik`),
  KEY `odjel` (`odjel`),
  KEY `placa` (`placa`),
  KEY `pozicija` (`pozicija`),
  CONSTRAINT `zaposlenici_ibfk_1` FOREIGN KEY (`odjel`) REFERENCES `odjel` (`ID_odjel`),
  CONSTRAINT `zaposlenici_ibfk_2` FOREIGN KEY (`placa`) REFERENCES `placa` (`ID_placa`),
  CONSTRAINT `zaposlenici_ibfk_3` FOREIGN KEY (`pozicija`) REFERENCES `pozicija` (`ID_pozicija`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zaposlenici`
--

LOCK TABLES `zaposlenici` WRITE;
/*!40000 ALTER TABLE `zaposlenici` DISABLE KEYS */;
INSERT INTO `zaposlenici` VALUES (1,'Marin','Marinić','dr.med.spec.kardiolog',NULL,NULL,NULL,NULL),(2,'Ana','Anić','dr.med.spec.kirurgije',NULL,NULL,NULL,NULL),(3,'Marina','Marinić','doktor medicine',NULL,NULL,NULL,NULL),(4,'Marko','Markić','dr.med.spec.kardiolog',NULL,NULL,NULL,NULL),(5,'Iva','Ivić','dr.med.',NULL,NULL,NULL,NULL),(6,'Maja','Majić','DMS',NULL,NULL,NULL,NULL),(7,'Petar','Perić','DMT',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `zaposlenici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'TvrtkaParcijalni'
--
/*!50003 DROP PROCEDURE IF EXISTS `prosjecna_placa_zaposlenika` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Martina`@`%` PROCEDURE `prosjecna_placa_zaposlenika`()
BEGIN
  DECLARE prosjek DECIMAL(6,2);
  SELECT AVG(p.iznos) INTO prosjek FROM placa p;
  SELECT CONCAT('Prosječna plaća svih zaposlenika bolnice je: ', prosjek) AS prosjek_placa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-20 18:26:21
