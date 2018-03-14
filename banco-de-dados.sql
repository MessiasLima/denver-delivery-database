CREATE DATABASE  IF NOT EXISTS `delivery` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `delivery`;
-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: delivery
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primaria',
  `nome` varchar(100) NOT NULL COMMENT 'nome da cidade',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (15,'Cascavel'),(5,'Fortaleza'),(2,'Horizonte'),(1,'Pacajus');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `nome` varchar(45) NOT NULL COMMENT 'Nome do clienet',
  `status` varchar(45) NOT NULL DEFAULT 'ATIVO' COMMENT 'status do cliente\n\nATIVO        = Cliente regular\nSUSPENSO = Suspenso',
  `identificador_externo` varchar(255) NOT NULL COMMENT 'Identificador do sistema externo\n\nEx: id de usuario do facebook ou email do google por exemplo',
  `email` varchar(200) DEFAULT NULL COMMENT 'Email do cliente',
  `token` varchar(45) DEFAULT NULL COMMENT 'Token que identifica a sessao do usuario',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estabelecimento`
--

DROP TABLE IF EXISTS `estabelecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estabelecimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária',
  `nome` varchar(45) NOT NULL COMMENT 'Nome do estabelecimento',
  `descricao` varchar(255) DEFAULT NULL COMMENT 'Descrição do estabelecimento',
  `status` varchar(45) NOT NULL DEFAULT 'ATIVO' COMMENT 'Status do estabelecimento\n\nATIVO        - Estabelecimento esta regular\nSUSPENSO - Acesso do estabelecimento esta suspenso por algum motivo',
  `latitude` double DEFAULT NULL COMMENT 'Latitude do estabelecimento',
  `longitude` double DEFAULT NULL COMMENT 'Logitude do estabelecimento',
  `id_cidade` int(11) NOT NULL COMMENT 'Referência da cidade do estabelecimento',
  `url_image` longtext,
  PRIMARY KEY (`id`),
  KEY `cidade_fk_idx` (`id_cidade`),
  CONSTRAINT `cidade_fk` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estabelecimento`
--

LOCK TABLES `estabelecimento` WRITE;
/*!40000 ALTER TABLE `estabelecimento` DISABLE KEYS */;
INSERT INTO `estabelecimento` VALUES (1,'Sombra da Mangueira','Descrição do estabelecimento','ATIVO',-4.172941,-38.468277,1,'3564314a-fcea-4943-8271-cb989b6ba441.jpg'),(2,'Jacks Pub','Descricao jacks','ATIVO',NULL,NULL,2,NULL),(3,'2\'','2','ATIVO',NULL,NULL,2,NULL),(4,'3','3','ATIVO',NULL,NULL,2,NULL),(5,'Sdf','Asf','ATIVO',NULL,NULL,5,NULL),(6,'Hhh','Ajjs','ATIVO',NULL,NULL,2,NULL),(7,'Hueheu','Heuehej','ATIVO',NULL,NULL,2,'502aad46d4cd3c6b365b36630f413175.png'),(8,'Hueheu','Heuehej','ATIVO',NULL,NULL,2,'8f8428842c401144483fd22e2c423982.png'),(9,'Dona Conceiçao','Pratinho rocheda','ATIVO',NULL,NULL,1,NULL),(10,'Naldo','Naldp','ATIVO',NULL,NULL,5,'5629ffc2ec20297ef61d6b6f360afcb9.png'),(11,'Naldo 2','Naldo 3','ATIVO',NULL,NULL,2,NULL);
/*!40000 ALTER TABLE `estabelecimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador do pedido',
  `id_cliente` int(11) NOT NULL COMMENT 'FK do cliente',
  `id_estabelecimento` int(11) NOT NULL,
  `preco` float NOT NULL COMMENT 'Preço final do pedido',
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_idx` (`id_cliente`),
  KEY `fk_estabelecimento_pedido_idx` (`id_estabelecimento`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_estabelecimento_pedido` FOREIGN KEY (`id_estabelecimento`) REFERENCES `estabelecimento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_item`
--

DROP TABLE IF EXISTS `pedido_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor_unitario` float NOT NULL,
  `valor_total` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_item`
--

LOCK TABLES `pedido_item` WRITE;
/*!40000 ALTER TABLE `pedido_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_status`
--

DROP TABLE IF EXISTS `pedido_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `id_pedido` int(11) NOT NULL COMMENT 'Id do pedido ao qual esse status se refere',
  `id_usuario` int(11) NOT NULL COMMENT 'Qual o usuario que realizou a mudança de status',
  `tipo_status` varchar(45) NOT NULL COMMENT 'AGUARDANDO_APROVACAO\nACEITO\nEM_ANDAMENTO\nCANCELADO_CLIENTE\nCANCELADO_ESTABELECIMENTO\nRECUSADO',
  `data_hora` datetime NOT NULL COMMENT 'timestamp no qual foi realizado a mudança',
  `observacao` varchar(255) DEFAULT NULL COMMENT 'Messagem dessa mudança',
  PRIMARY KEY (`id`),
  KEY `fk_pedido_idx` (`id_pedido`),
  KEY `fk_usuario_pedido_idx` (`id_usuario`),
  CONSTRAINT `fk_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`),
  CONSTRAINT `fk_usuario_pedido` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_status`
--

LOCK TABLES `pedido_status` WRITE;
/*!40000 ALTER TABLE `pedido_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `id_estabelecimento` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `valor` double NOT NULL,
  `url_imagem` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_estabelecimento_idx` (`id_estabelecimento`),
  KEY `fk_tipo_produto_idx` (`id_tipo`),
  CONSTRAINT `fk_estabelecimento` FOREIGN KEY (`id_estabelecimento`) REFERENCES `estabelecimento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo_produto` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_produto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Pizza de Calabresa','Calabresa, Mussarela, Orégano',1,1,23.9,NULL);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_produto`
--

DROP TABLE IF EXISTS `tipo_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_produto`
--

LOCK TABLES `tipo_produto` WRITE;
/*!40000 ALTER TABLE `tipo_produto` DISABLE KEYS */;
INSERT INTO `tipo_produto` VALUES (1,'Pizza');
/*!40000 ALTER TABLE `tipo_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `nome` varchar(100) NOT NULL COMMENT 'Nome do usuario',
  `login` varchar(45) NOT NULL COMMENT 'Login do usuario',
  `senha` varchar(255) NOT NULL COMMENT 'senha do usuario',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token do usuario\n',
  `tipo` varchar(45) NOT NULL DEFAULT 'FUNCIONARIO' COMMENT 'TIPO do usuario\n\nFUNCIONARIO = Funcionario do estabelecimento. Possui poucas permissoes\nADM_ESTABELECIMENTO = Pode realizar todas as funções e tirar relatórios\nADM_SISTEMA = Controle total do sistema',
  `email` varchar(100) NOT NULL COMMENT 'email do usuario',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `token_UNIQUE` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (6,'Messias Lima da Silva','messiaslima','ed2a6aa572f724c6d7c491df4de0329f','7b154d90e502da0b6e9063b476ff0257','ADM_SISTEMA','messiaslima@gmail.com'),(9,'gerente','gerente','740d9c49b11f3ada7b9112614a54be41','fa7f4d2f3aa854e288bff8cba2d31fe8','ADM_ESTABELECIMENTO','gerente@asd.com'),(10,'funcionario','funcionario','cc7a84634199040d54376793842fe035','41573173a08a75a51cfa176c82e5b621','FUNCIONARIO','funcionrio@das.asd');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_estabelecimento`
--

DROP TABLE IF EXISTS `usuario_estabelecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_estabelecimento` (
  `id_usuario` int(11) NOT NULL,
  `id_estabelecimento` int(11) NOT NULL,
  KEY `fk_usuario_estabelecimento_idx` (`id_usuario`),
  KEY `fk_estabelecimento_usuario_idx` (`id_estabelecimento`),
  CONSTRAINT `fk_estabelecimento_usuario` FOREIGN KEY (`id_estabelecimento`) REFERENCES `estabelecimento` (`id`),
  CONSTRAINT `fk_usuario_estabelecimento` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_estabelecimento`
--

LOCK TABLES `usuario_estabelecimento` WRITE;
/*!40000 ALTER TABLE `usuario_estabelecimento` DISABLE KEYS */;
INSERT INTO `usuario_estabelecimento` VALUES (9,1),(10,1);
/*!40000 ALTER TABLE `usuario_estabelecimento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-13 21:42:03
