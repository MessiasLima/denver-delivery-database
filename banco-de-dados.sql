CREATE DATABASE  IF NOT EXISTS `delivery` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `delivery`;
-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: delivery
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (15,'Cascavel'),(5,'Fortaleza'),(2,'Horizonte'),(1,'Pacajus'),(16,'Pindoretama');
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
INSERT INTO `estabelecimento` VALUES (1,'Sombra da Mangueira','Descrição do estabelecimento','ATIVO',-4.172941,-38.468277,1,'9e3eaeea-3ae8-449b-809e-22aae1876e04.jpg'),(2,'Jacks Pub','Descricao jacks','ATIVO',NULL,NULL,2,NULL),(3,'2\'','2','ATIVO',NULL,NULL,2,NULL),(4,'3 irmãos','Campo de futebol Society e churrascaria','ATIVO',NULL,NULL,1,NULL),(5,'Sdf','Asf','ATIVO',NULL,NULL,5,NULL),(6,'Hhh','Ajjs','ATIVO',NULL,NULL,2,NULL),(7,'Hueheu','Heuehej','ATIVO',NULL,NULL,2,'502aad46d4cd3c6b365b36630f413175.png'),(8,'Hueheu','Heuehej','ATIVO',NULL,NULL,2,'8f8428842c401144483fd22e2c423982.png'),(9,'Dona Conceiçao','Pratinho rocheda','ATIVO',NULL,NULL,1,NULL),(10,'Naldo','Naldp','ATIVO',NULL,NULL,5,'5629ffc2ec20297ef61d6b6f360afcb9.png'),(11,'Naldo 2','Naldo 3','ATIVO',NULL,NULL,2,NULL);
/*!40000 ALTER TABLE `estabelecimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estabelecimento_forma_pagamento`
--

DROP TABLE IF EXISTS `estabelecimento_forma_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estabelecimento_forma_pagamento` (
  `id_estabelecimento` int(11) NOT NULL,
  `id_forma_pagamento` int(11) NOT NULL,
  PRIMARY KEY (`id_estabelecimento`,`id_forma_pagamento`),
  KEY `fk_forma_pagamento_idx` (`id_forma_pagamento`),
  CONSTRAINT `fk_estabelecimento_forma_pagamento` FOREIGN KEY (`id_estabelecimento`) REFERENCES `estabelecimento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_forma_pagamento_estabelecimento` FOREIGN KEY (`id_forma_pagamento`) REFERENCES `forma_pagamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estabelecimento_forma_pagamento`
--

LOCK TABLES `estabelecimento_forma_pagamento` WRITE;
/*!40000 ALTER TABLE `estabelecimento_forma_pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `estabelecimento_forma_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pagamento`
--

DROP TABLE IF EXISTS `forma_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forma_pagamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
INSERT INTO `forma_pagamento` VALUES (4,'Alelo'),(1,'Dinheiro'),(3,'Master Card'),(5,'Sodexo'),(2,'Visa');
/*!40000 ALTER TABLE `forma_pagamento` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Pizza de Calabresa','Calabresa, Mussarela, Orégano',1,1,23.9,NULL),(2,'Pizza de Muçarela','Mussarela, Orégano',1,1,23.9,NULL),(3,'Pizza de Muçarela','Mussarela, Orégano',2,1,25.9,NULL),(4,'Pizza de Camarão','Camarão, Orégano',3,1,25.9,NULL),(5,'Sanduiche','Pao e carne',1,1,12,NULL),(6,'Coca cola','Refrigerante de cola',1,2,10,NULL),(7,'Frango à parmegiana para 2 pessoas','Frango, queijo, molho de tomate e porção de arroz branco.',1,3,10,'6e95c53a-a83e-4610-8a24-0e2af7465648.jpg');
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
  `id_estabelecimento` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_produto_1_idx` (`id_estabelecimento`),
  CONSTRAINT `fk_tipo_produto_1` FOREIGN KEY (`id_estabelecimento`) REFERENCES `estabelecimento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_produto`
--

LOCK TABLES `tipo_produto` WRITE;
/*!40000 ALTER TABLE `tipo_produto` DISABLE KEYS */;
INSERT INTO `tipo_produto` VALUES (1,'Pizzas',1),(2,'Bebida',1),(3,'Massa',1);
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
INSERT INTO `usuario` VALUES (6,'Messias Lima da Silva Junior','messiaslima','ed2a6aa572f724c6d7c491df4de0329f','70c858ebfca943b55cadbd03d27d0aa3','ADM_SISTEMA','messiaslima@gmail.com'),(9,'gerente','gerente','740d9c49b11f3ada7b9112614a54be41','48e86756483dde6811d264c38800b887','ADM_ESTABELECIMENTO','gerente@asd.com'),(10,'funcionario','funcionario','cc7a84634199040d54376793842fe035','41573173a08a75a51cfa176c82e5b621','FUNCIONARIO','funcionario@gmail.com');
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
INSERT INTO `usuario_estabelecimento` VALUES (9,1),(10,1),(10,1);
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

-- Dump completed on 2018-04-30 20:40:55
