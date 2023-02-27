-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: carloca
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `CARRO`
--

DROP TABLE IF EXISTS `CARRO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CARRO` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Versao` int NOT NULL,
  `ID_Categoria` int NOT NULL,
  `Cor` enum('Prata','Preto','Branco') NOT NULL,
  `Status` enum('disponivel','indisponivel') NOT NULL DEFAULT 'disponivel',
  `KM_Atual` decimal(10,1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Id_Versao_idx` (`ID_Versao`),
  KEY `Id_Categoria_idx` (`ID_Categoria`),
  CONSTRAINT `Id_Categoria` FOREIGN KEY (`ID_Categoria`) REFERENCES `CATEGORIA` (`ID`),
  CONSTRAINT `Id_Versao` FOREIGN KEY (`ID_Versao`) REFERENCES `VERSAO` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CARRO`
--

LOCK TABLES `CARRO` WRITE;
/*!40000 ALTER TABLE `CARRO` DISABLE KEYS */;
INSERT INTO `CARRO` VALUES (1,1,1,'Prata','disponivel',5000.0),(2,3,3,'Preto','indisponivel',15000.7),(3,4,2,'Branco','disponivel',1000.0);
/*!40000 ALTER TABLE `CARRO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATEGORIA`
--

DROP TABLE IF EXISTS `CATEGORIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CATEGORIA` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Categoria` enum('Hatch','Sedam Compacto','Sedam Médio','Sedam Luxo','SUV','Conversivel','Esportivo','Mini Van','Picape') NOT NULL,
  `Preco_Diaria` decimal(7,2) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORIA`
--

LOCK TABLES `CATEGORIA` WRITE;
/*!40000 ALTER TABLE `CATEGORIA` DISABLE KEYS */;
INSERT INTO `CATEGORIA` VALUES (1,'Hatch',100.00),(2,'Conversivel',600.00),(3,'Sedam Compacto',150.00),(4,'Sedam Médio',250.00);
/*!40000 ALTER TABLE `CATEGORIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENTE`
--

DROP TABLE IF EXISTS `CLIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENTE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Endereco` int NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `DT_Nascimento` date NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `CNH` varchar(11) NOT NULL,
  `Status` enum('disponivel','indisponivel') NOT NULL DEFAULT 'disponivel',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CPF_UNIQUE` (`CPF`),
  UNIQUE KEY `CNH_UNIQUE` (`CNH`),
  KEY `Id_Endereco_idx` (`ID_Endereco`),
  CONSTRAINT `Id_Endereco` FOREIGN KEY (`ID_Endereco`) REFERENCES `ENDERECOS_CLIENTES` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTE`
--

LOCK TABLES `CLIENTE` WRITE;
/*!40000 ALTER TABLE `CLIENTE` DISABLE KEYS */;
INSERT INTO `CLIENTE` VALUES (1,1,'Sergio Assis','1983-05-18','12345678900','98765432100','disponivel'),(2,2,'Claudia Dias','1994-11-03','99966633322','14785236910','indisponivel');
/*!40000 ALTER TABLE `CLIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENDERECOS_CLIENTES`
--

DROP TABLE IF EXISTS `ENDERECOS_CLIENTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ENDERECOS_CLIENTES` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CEP` varchar(9) NOT NULL,
  `Estado` varchar(45) NOT NULL,
  `Cidade` varchar(45) NOT NULL,
  `Logradouro` varchar(100) NOT NULL,
  `Numero` int NOT NULL,
  `Complemento` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENDERECOS_CLIENTES`
--

LOCK TABLES `ENDERECOS_CLIENTES` WRITE;
/*!40000 ALTER TABLE `ENDERECOS_CLIENTES` DISABLE KEYS */;
INSERT INTO `ENDERECOS_CLIENTES` VALUES (1,'20040002','RJ','Rio de Janeiro','Avenida Rio Branco',2000,'Andar 5, sala 502'),(2,'01045001','SP','São Paulo','Praça da República',352,'apto 403');
/*!40000 ALTER TABLE `ENDERECOS_CLIENTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FRANQUIAS`
--

DROP TABLE IF EXISTS `FRANQUIAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FRANQUIAS` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Estado` varchar(45) NOT NULL,
  `Cidade` varchar(45) NOT NULL,
  `Bairro` varchar(45) NOT NULL,
  `Rua` varchar(45) NOT NULL,
  `Complemento` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FRANQUIAS`
--

LOCK TABLES `FRANQUIAS` WRITE;
/*!40000 ALTER TABLE `FRANQUIAS` DISABLE KEYS */;
INSERT INTO `FRANQUIAS` VALUES (1,'SP','São Paulo','\'Aeroporto Congonhas\'','Av. Washington Luiz','5000'),(2,'SP','São Paulo','\'Aeroporto Guarulhos\'','Av. Papa João Paulo I','2334'),(3,'RJ','Rio de Janeiro','Centro','Rua da Carioca','515');
/*!40000 ALTER TABLE `FRANQUIAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HISTORICO`
--

DROP TABLE IF EXISTS `HISTORICO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HISTORICO` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Locacao` int NOT NULL,
  `KM_Rodados` decimal(7,1) NOT NULL,
  `KM_Totais` decimal(10,1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Id_Locacao_idx` (`ID_Locacao`),
  CONSTRAINT `Id_Locacao` FOREIGN KEY (`ID_Locacao`) REFERENCES `LOCACAO` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HISTORICO`
--

LOCK TABLES `HISTORICO` WRITE;
/*!40000 ALTER TABLE `HISTORICO` DISABLE KEYS */;
INSERT INTO `HISTORICO` VALUES (1,1,350.0,5350.0);
/*!40000 ALTER TABLE `HISTORICO` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `HISTORICO_AFTER_INSERT` AFTER INSERT ON `HISTORICO` FOR EACH ROW BEGIN
UPDATE CARRO SET Status = 'disponivel' WHERE ID = NEW.ID_LOCACAO;
UPDATE CLIENTE SET Status = 'disponivel' WHERE ID = NEW.ID_LOCACAO;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `LOCACAO`
--

DROP TABLE IF EXISTS `LOCACAO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOCACAO` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Carro` int NOT NULL,
  `ID_Cliente` int NOT NULL,
  `ID_Franquia_Retirada` int NOT NULL,
  `ID_Franquia_Devolucao` int NOT NULL,
  `DT_Inicio` date NOT NULL,
  `DT_Termino` date DEFAULT NULL,
  `Modalidade` enum('diaria') NOT NULL DEFAULT 'diaria',
  `Total_Diarias` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Id_Carro_idx` (`ID_Carro`),
  KEY `Id_Cliente_idx` (`ID_Cliente`),
  KEY `Id_Franquia_Retirada_idx` (`ID_Franquia_Retirada`),
  KEY `Id_Franquia_Devolucao_idx` (`ID_Franquia_Devolucao`),
  CONSTRAINT `Id_Carro` FOREIGN KEY (`ID_Carro`) REFERENCES `CARRO` (`ID`),
  CONSTRAINT `Id_Cliente` FOREIGN KEY (`ID_Cliente`) REFERENCES `CLIENTE` (`ID`),
  CONSTRAINT `Id_Franquia_Devolucao` FOREIGN KEY (`ID_Franquia_Devolucao`) REFERENCES `FRANQUIAS` (`ID`),
  CONSTRAINT `Id_Franquia_Retirada` FOREIGN KEY (`ID_Franquia_Retirada`) REFERENCES `FRANQUIAS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOCACAO`
--

LOCK TABLES `LOCACAO` WRITE;
/*!40000 ALTER TABLE `LOCACAO` DISABLE KEYS */;
INSERT INTO `LOCACAO` VALUES (1,1,1,2,1,'2023-01-05','2023-01-15','diaria',10),(2,2,2,3,3,'2023-02-28',NULL,'diaria',NULL);
/*!40000 ALTER TABLE `LOCACAO` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `LOCACAO_AFTER_INSERT` AFTER INSERT ON `LOCACAO` FOR EACH ROW BEGIN
UPDATE CARRO SET Status = 'indisponivel' WHERE ID = NEW.ID_CARRO;
UPDATE CLIENTE SET Status = 'indisponivel' WHERE ID = NEW.ID_CLIENTE;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `MODELO`
--

DROP TABLE IF EXISTS `MODELO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MODELO` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Montadora` int NOT NULL,
  `Nome_modelo` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Id_Montadora_idx` (`ID_Montadora`),
  CONSTRAINT `Id_Montadora` FOREIGN KEY (`ID_Montadora`) REFERENCES `MONTADORA` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MODELO`
--

LOCK TABLES `MODELO` WRITE;
/*!40000 ALTER TABLE `MODELO` DISABLE KEYS */;
INSERT INTO `MODELO` VALUES (1,1,'Gol'),(2,1,'Jetta'),(3,2,'Onix'),(4,3,'Strada'),(5,4,'Serie 4 Cabrio');
/*!40000 ALTER TABLE `MODELO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MONTADORA`
--

DROP TABLE IF EXISTS `MONTADORA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MONTADORA` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome_Montadora` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MONTADORA`
--

LOCK TABLES `MONTADORA` WRITE;
/*!40000 ALTER TABLE `MONTADORA` DISABLE KEYS */;
INSERT INTO `MONTADORA` VALUES (1,'Volkswagen'),(2,'Chevrolet'),(3,'Fiat'),(4,'BMW'),(5,'Hyundai'),(6,'Honda'),(7,'Nissan');
/*!40000 ALTER TABLE `MONTADORA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VERSAO`
--

DROP TABLE IF EXISTS `VERSAO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VERSAO` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Modelo` int NOT NULL,
  `Descricao_versao` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Id_Modelo_idx` (`ID_Modelo`),
  CONSTRAINT `Id_Modelo` FOREIGN KEY (`ID_Modelo`) REFERENCES `MODELO` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VERSAO`
--

LOCK TABLES `VERSAO` WRITE;
/*!40000 ALTER TABLE `VERSAO` DISABLE KEYS */;
INSERT INTO `VERSAO` VALUES (1,1,'G8 - 2022 - 4 portas'),(2,2,'GLI 350 TSI - 2021 - 4 portas'),(3,3,'LT - 2023 - 4 portas'),(4,5,'Converse - 2022 - 2 portas'),(5,3,'Sedam - 2022 - 4 portas');
/*!40000 ALTER TABLE `VERSAO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'carloca'
--

--
-- Dumping routines for database 'carloca'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-27 18:03:13
