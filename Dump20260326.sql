-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: monitoramento_db
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `alertas`
--

DROP TABLE IF EXISTS `alertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alertas` (
  `id_alerta` int NOT NULL AUTO_INCREMENT,
  `id_leitura` int DEFAULT NULL,
  `mensagem` varchar(200) DEFAULT NULL,
  `data_alerta` datetime DEFAULT NULL,
  PRIMARY KEY (`id_alerta`),
  KEY `id_leitura` (`id_leitura`),
  CONSTRAINT `alertas_ibfk_1` FOREIGN KEY (`id_leitura`) REFERENCES `leituras` (`id_leitura`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alertas`
--

LOCK TABLES `alertas` WRITE;
/*!40000 ALTER TABLE `alertas` DISABLE KEYS */;
INSERT INTO `alertas` VALUES (1,1,'Temperatura acima do normal no misturador','2026-03-26 08:05:00'),(2,2,'Temperatura muito alta no forno industrial','2026-03-26 09:05:00'),(3,3,'Pressão fora do padrão na máquina de embalagem','2026-03-26 10:05:00'),(4,4,'Produto detectado na esteira','2026-03-26 11:00:10'),(5,5,'Sensor de segurança ativado','2026-03-26 12:00:05');
/*!40000 ALTER TABLE `alertas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leituras`
--

DROP TABLE IF EXISTS `leituras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leituras` (
  `id_leitura` int NOT NULL AUTO_INCREMENT,
  `id_sensor` int DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `data_leitura` datetime DEFAULT NULL,
  PRIMARY KEY (`id_leitura`),
  KEY `id_sensor` (`id_sensor`),
  CONSTRAINT `leituras_ibfk_1` FOREIGN KEY (`id_sensor`) REFERENCES `sensores` (`id_sensor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leituras`
--

LOCK TABLES `leituras` WRITE;
/*!40000 ALTER TABLE `leituras` DISABLE KEYS */;
INSERT INTO `leituras` VALUES (1,1,75.50,'2026-03-26 08:00:00'),(2,2,180.00,'2026-03-26 09:00:00'),(3,3,2.50,'2026-03-26 10:00:00'),(4,4,1.00,'2026-03-26 11:00:00'),(5,5,1.00,'2026-03-26 12:00:00');
/*!40000 ALTER TABLE `leituras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manutencoes`
--

DROP TABLE IF EXISTS `manutencoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manutencoes` (
  `id_manutencao` int NOT NULL AUTO_INCREMENT,
  `id_maquina` int DEFAULT NULL,
  `id_operador` int DEFAULT NULL,
  `data_manutencao` date DEFAULT NULL,
  `tipo_manutencao` varchar(25) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_manutencao`),
  KEY `id_maquina` (`id_maquina`),
  KEY `id_operador` (`id_operador`),
  CONSTRAINT `manutencoes_ibfk_1` FOREIGN KEY (`id_maquina`) REFERENCES `maquina` (`id_maquina`),
  CONSTRAINT `manutencoes_ibfk_2` FOREIGN KEY (`id_operador`) REFERENCES `operadores` (`id_operador`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manutencoes`
--

LOCK TABLES `manutencoes` WRITE;
/*!40000 ALTER TABLE `manutencoes` DISABLE KEYS */;
INSERT INTO `manutencoes` VALUES (1,1,1,'2026-03-20','preventiva','Lubrificação e ajuste do misturador'),(2,2,2,'2026-03-18','corretiva','Correção de superaquecimento no forno'),(3,3,3,'2026-03-15','preventiva','Verificação de pressão e vedação'),(4,4,4,'2026-03-10','corretiva','Troca de sensor de presença da esteira'),(5,5,5,'2026-03-05','preventiva','Ajuste e limpeza do cortador industrial');
/*!40000 ALTER TABLE `manutencoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maquina`
--

DROP TABLE IF EXISTS `maquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maquina` (
  `id_maquina` int NOT NULL AUTO_INCREMENT,
  `nome_maquina` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'ativo',
  `data_instalacao` date DEFAULT NULL,
  PRIMARY KEY (`id_maquina`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maquina`
--

LOCK TABLES `maquina` WRITE;
/*!40000 ALTER TABLE `maquina` DISABLE KEYS */;
INSERT INTO `maquina` VALUES (1,'Misturador Industrial','ativo','2023-02-10'),(2,'Forno Industrial','ativo','2022-07-15'),(3,'Máquina de Embalagem','manutencao','2021-11-30'),(4,'Esteira Transportadora','ativo','2020-05-20'),(5,'Cortador Industrial','inativo','2019-09-12'),(7,'PackMack','OK','2026-03-26');
/*!40000 ALTER TABLE `maquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operadores`
--

DROP TABLE IF EXISTS `operadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operadores` (
  `id_operador` int NOT NULL AUTO_INCREMENT,
  `nome_operador` varchar(50) DEFAULT NULL,
  `turno` varchar(20) DEFAULT NULL,
  `setor` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_operador`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operadores`
--

LOCK TABLES `operadores` WRITE;
/*!40000 ALTER TABLE `operadores` DISABLE KEYS */;
INSERT INTO `operadores` VALUES (1,'Carlos Silva','manhã','Mistura'),(2,'Ana Souza','tarde','Forno'),(3,'João Pereira','noite','Embalagem'),(4,'Mariana Costa','manhã','Transporte'),(5,'Lucas Santos','tarde','Corte');
/*!40000 ALTER TABLE `operadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensores`
--

DROP TABLE IF EXISTS `sensores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensores` (
  `id_sensor` int NOT NULL AUTO_INCREMENT,
  `id_maquina` int DEFAULT NULL,
  `tipo_sensor` varchar(50) DEFAULT NULL,
  `unidade_medida` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_sensor`),
  KEY `id_maquina` (`id_maquina`),
  CONSTRAINT `sensores_ibfk_1` FOREIGN KEY (`id_maquina`) REFERENCES `maquina` (`id_maquina`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensores`
--

LOCK TABLES `sensores` WRITE;
/*!40000 ALTER TABLE `sensores` DISABLE KEYS */;
INSERT INTO `sensores` VALUES (1,1,'Temperatura','°C'),(2,2,'Temperatura','°C'),(3,3,'Pressão','bar'),(4,4,'Sensor de Presença','sim/não'),(5,5,'Sensor de Segurança','on/off');
/*!40000 ALTER TABLE `sensores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'monitoramento_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-26 16:04:45
