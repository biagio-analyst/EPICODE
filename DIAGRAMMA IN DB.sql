-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: fatturazione
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clienti`
--

DROP TABLE IF EXISTS `clienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clienti` (
  `ID_CLIENTE` int NOT NULL,
  `RAGIONE_SOCIALE` varchar(45) NOT NULL,
  `INDIRIZZO` varchar(45) NOT NULL,
  `EMAIL` varchar(45) NOT NULL,
  `N_TELEFONICO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENTE`),
  UNIQUE KEY `ID_CLIENTI_UNIQUE` (`ID_CLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienti`
--

LOCK TABLES `clienti` WRITE;
/*!40000 ALTER TABLE `clienti` DISABLE KEYS */;
INSERT INTO `clienti` VALUES (1,'Alfa S.p.A.','Via Roma 12, Milano','info@alfaspa.it','023456789'),(2,'Beta S.r.l.','Corso Italia 22, Torino','contatti@betasrl.it','011223344'),(3,'Gamma SRL','Piazza Duomo 5, Firenze','amministrazione@gammasrl.it','055998877');
/*!40000 ALTER TABLE `clienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dati_consolidati`
--

DROP TABLE IF EXISTS `dati_consolidati`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dati_consolidati` (
  `ID_FATTURA` int NOT NULL,
  `MESE_FATTURAZIONE` varchar(45) NOT NULL,
  `N_IMPORTO` varchar(45) NOT NULL,
  `D_PAGAMENTO` varchar(45) NOT NULL,
  `FLAG_PAGAMENTO` tinytext NOT NULL,
  PRIMARY KEY (`ID_FATTURA`),
  UNIQUE KEY `ID_FATTURA_UNIQUE` (`ID_FATTURA`),
  CONSTRAINT `ID_FATTURA` FOREIGN KEY (`ID_FATTURA`) REFERENCES `fatture` (`ID_FATTURA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dati_consolidati`
--

LOCK TABLES `dati_consolidati` WRITE;
/*!40000 ALTER TABLE `dati_consolidati` DISABLE KEYS */;
/*!40000 ALTER TABLE `dati_consolidati` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatture`
--

DROP TABLE IF EXISTS `fatture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fatture` (
  `ID_FATTURA` int NOT NULL,
  `ID_CLIENTE` int NOT NULL,
  `ID_OFFERTA` int NOT NULL,
  `MESE_FATTURAZIONE` varchar(45) NOT NULL,
  `DATA_EMISSIONE` varchar(45) NOT NULL,
  `VOLUME_FATTURATO` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_FATTURA`),
  UNIQUE KEY `ID_CLIENTE_UNIQUE` (`ID_CLIENTE`),
  UNIQUE KEY `ID_FATTURA_UNIQUE` (`ID_FATTURA`),
  UNIQUE KEY `ID_OFFERTA_UNIQUE` (`ID_OFFERTA`),
  CONSTRAINT `ID_CLIENTE` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `clienti` (`ID_CLIENTE`),
  CONSTRAINT `ID_OFFERTA` FOREIGN KEY (`ID_OFFERTA`) REFERENCES `tipologia_offerta` (`ID_OFFERTA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatture`
--

LOCK TABLES `fatture` WRITE;
/*!40000 ALTER TABLE `fatture` DISABLE KEYS */;
INSERT INTO `fatture` VALUES (1001,1,1,'Gennaio 2024','2024-01-15','12000.50'),(1002,2,2,'Gennaio 2024','2024-01-17','8500.00'),(1003,3,3,'Febbraio 2024','2024-02-10','16000.00');
/*!40000 ALTER TABLE `fatture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipologia_offerta`
--

DROP TABLE IF EXISTS `tipologia_offerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipologia_offerta` (
  `ID_OFFERTA` int NOT NULL,
  `N_OFFERTA` varchar(45) NOT NULL,
  `N_SCONTO` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_OFFERTA`),
  UNIQUE KEY `ID_OFFERTA_UNIQUE` (`ID_OFFERTA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipologia_offerta`
--

LOCK TABLES `tipologia_offerta` WRITE;
/*!40000 ALTER TABLE `tipologia_offerta` DISABLE KEYS */;
INSERT INTO `tipologia_offerta` VALUES (1,'Premium','10%'),(2,'Base','0%'),(3,'Business','15%');
/*!40000 ALTER TABLE `tipologia_offerta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-24 22:12:47
