-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: tcc-greenwallet.mysql.database.azure.com    Database: greenwallet
-- ------------------------------------------------------
-- Server version	5.6.47.0

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

CREATE DATABASE greenwallet;

--
-- Table structure for table `tab_carteira`
--
DROP TABLE IF EXISTS `tab_carteira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tab_carteira` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `renda` decimal(7,2) DEFAULT NULL,
  `data_s` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_carteira` (`id_usuario`),
  CONSTRAINT `fk_carteira` FOREIGN KEY (`id_usuario`) REFERENCES `tab_usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab_carteira`
--

LOCK TABLES `tab_carteira` WRITE;
/*!40000 ALTER TABLE `tab_carteira` DISABLE KEYS */;
/*!40000 ALTER TABLE `tab_carteira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tab_gastos`
--

DROP TABLE IF EXISTS `tab_gastos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tab_gastos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `tipo` int(1) DEFAULT NULL,
  `valor` decimal(7,2) DEFAULT NULL,
  `data_g` date DEFAULT NULL,
  `pagamento` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_gasto` (`id_usuario`),
  CONSTRAINT `fk_gasto` FOREIGN KEY (`id_usuario`) REFERENCES `tab_usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab_gastos`
--

LOCK TABLES `tab_gastos` WRITE;
/*!40000 ALTER TABLE `tab_gastos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tab_gastos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tab_historico`
--

DROP TABLE IF EXISTS `tab_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tab_historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `mes1` varchar(50) DEFAULT NULL,
  `mes2` varchar(50) DEFAULT NULL,
  `mes3` varchar(50) DEFAULT NULL,
  `mes4` varchar(50) DEFAULT NULL,
  `mes5` varchar(50) DEFAULT NULL,
  `mes6` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hist` (`id_usuario`),
  CONSTRAINT `fk_hist` FOREIGN KEY (`id_usuario`) REFERENCES `tab_usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab_historico`
--

LOCK TABLES `tab_historico` WRITE;
/*!40000 ALTER TABLE `tab_historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tab_historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tab_usuarios`
--

DROP TABLE IF EXISTS `tab_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tab_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(12) DEFAULT NULL,
  `sobrenome` varchar(12) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `data_c` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab_usuarios`
--

LOCK TABLES `tab_usuarios` WRITE;
/*!40000 ALTER TABLE `tab_usuarios` DISABLE KEYS */;
INSERT INTO `tab_usuarios` VALUES (1,'Matheus','Biazotto','matheus@gmail.com','7110eda4d09e062aa5e4a390b0a572ac0d2c0220','2021-07-12'),(2,'Otavio','Colucci','colucci@otavio.com','7110eda4d09e062aa5e4a390b0a572ac0d2c0220','2021-07-13'),(3,'Nome','Teste','email@teste.com','7110eda4d09e062aa5e4a390b0a572ac0d2c0220','2021-07-29');
/*!40000 ALTER TABLE `tab_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'greenwallet'
--

--
-- Dumping routines for database 'greenwallet'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-25 11:23:23
