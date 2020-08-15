CREATE DATABASE  IF NOT EXISTS `tickets` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tickets`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: tickets
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cards` (
  `cardid` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(16) NOT NULL,
  `name` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  `code` varchar(3) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  PRIMARY KEY (`cardid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` VALUES (3,'7878454578784545','xxxxxx yyyyyyy','05/25','293','goga03'),(4,'3333333333333333','yyyyy xxxxx','02/22','432','ako1234');
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cinema` (
  `id` int(11) NOT NULL,
  `cinemaname` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES (1,'rustaveli'),(2,'cavea'),(3,'marjanishvili');
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `films` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `film` varchar(45) NOT NULL,
  `genre` varchar(45) NOT NULL,
  `description` varchar(750) NOT NULL,
  `year` int(11) NOT NULL,
  `country` varchar(45) NOT NULL,
  `duration` varchar(45) NOT NULL,
  `director` varchar(45) NOT NULL,
  `budget` varchar(45) NOT NULL,
  `income` varchar(45) NOT NULL,
  `imdb` varchar(45) NOT NULL,
  `trailer` varchar(300) NOT NULL,
  `imgpath` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,'the godfather','drama','description description description description description description',1972,'USA','175','francis ford coppola','6000000','245066411','9.2','https://www.youtube.com/embed/zAGVQLHvwOY','img/godfather.jpg'),(2,'joker','drama','description description description description description description',2019,'USA','122','Tod philips','55000000','1074251311','8.5','https://www.youtube.com/embed/sY1S34973zA','img/joker.jpg'),(3,'avengers: endgame','fantastika','description description description description description description',2019,'USA','181','anthony russo','356000000','2797800564','8.4','https://www.youtube.com/embed/TcMBFSGVi1c','img/avengers.jpg'),(4,'avengers: endgame','fantastika','description description description description description description',2019,'USA','181','anthony russo','356000000','2797800564','8.4','https://www.youtube.com/embed/TcMBFSGVi1c','img/avengers.jpg'),(5,'avengers: endgame','fantastika','description description description description description description',2019,'USA','181','anthony russo','356000000','2797800564','8.4','https://www.youtube.com/embed/TcMBFSGVi1c','img/avengers.jpg'),(6,'avengers: endgame','fantastika','description description description description description description',2019,'USA','181','anthony russo','356000000','2797800564','8.4','https://www.youtube.com/embed/TcMBFSGVi1c','img/avengers.jpg'),(7,'avengers: endgame','fantastika','description description description description description description',2019,'USA','181','anthony russo','356000000','2797800564','8.4','https://www.youtube.com/embed/TcMBFSGVi1c','img/avengers.jpg'),(8,'avengers: endgame','fantastika','description description description description description description',2019,'USA','181','anthony russo','356000000','2797800564','8.4','https://www.youtube.com/embed/TcMBFSGVi1c','img/avengers.jpg'),(9,'avengers: endgame','fantastika','description description description description description description',2019,'USA','181','anthony russo','356000000','2797800564','8.4','https://www.youtube.com/embed/TcMBFSGVi1c','img/avengers.jpg'),(10,'avengers: endgame','fantastika','description description description description description description',2019,'USA','181','anthony russo','356000000','2797800564','8.4','https://www.youtube.com/embed/TcMBFSGVi1c','img/avengers.jpg'),(11,'avengers: endgame','fantastika','description description description description description description',2019,'USA','181','anthony russo','356000000','2797800564','8.4','https://www.youtube.com/embed/TcMBFSGVi1c','img/avengers.jpg'),(12,'avengers: endgame','fantastika','description description description description description description',2019,'USA','181','anthony russo','356000000','2797800564','8.4','https://www.youtube.com/embed/TcMBFSGVi1c','img/avengers.jpg'),(13,'avengers: endgame','fantastika','description description description description description description',2019,'USA','181','anthony russo','356000000','2797800564','8.4','https://www.youtube.com/embed/TcMBFSGVi1c','img/avengers.jpg'),(14,'avengers: endgame','fantastika','description description description description description description',2019,'USA','181','anthony russo','356000000','2797800564','8.4','https://www.youtube.com/embed/TcMBFSGVi1c','img/avengers.jpg'),(15,'avengers: endgame','fantastika','description description description description description description',2019,'USA','181','anthony russo','356000000','2797800564','8.4','https://www.youtube.com/embed/TcMBFSGVi1c','img/avengers.jpg'),(16,'avengers: endgame','fantastika','description description description description description description',2019,'USA','181','anthony russo','356000000','2797800564','8.4','https://www.youtube.com/embed/TcMBFSGVi1c','img/avengers.jpg'),(17,'avengers: endgame','fantastika','description description description description description description',2019,'USA','181','anthony russo','356000000','2797800564','8.4','https://www.youtube.com/embed/TcMBFSGVi1c','img/avengers.jpg'),(18,'avengers: endgame','fantastika','description description description description description description',2019,'USA','181','anthony russo','356000000','2797800564','8.4','https://www.youtube.com/embed/TcMBFSGVi1c','img/avengers.jpg');
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `genre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'komedia'),(2,'drama'),(3,'satavgadasavlo'),(4,'fantastika');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `language` varchar(45) NOT NULL,
  `language_price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'geo',7),(2,'eng',4),(3,'rus',4);
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality`
--

DROP TABLE IF EXISTS `quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `quality` (
  `id` int(11) NOT NULL,
  `quality` varchar(45) NOT NULL,
  `quality_price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality`
--

LOCK TABLES `quality` WRITE;
/*!40000 ALTER TABLE `quality` DISABLE KEYS */;
INSERT INTO `quality` VALUES (1,'2D',5),(2,'3D',7);
/*!40000 ALTER TABLE `quality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_cinema_films`
--

DROP TABLE IF EXISTS `rel_cinema_films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rel_cinema_films` (
  `cinema_id` int(11) NOT NULL,
  `films_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_cinema_films`
--

LOCK TABLES `rel_cinema_films` WRITE;
/*!40000 ALTER TABLE `rel_cinema_films` DISABLE KEYS */;
INSERT INTO `rel_cinema_films` VALUES (1,1),(1,2),(2,1),(2,3),(3,2),(1,3),(3,3);
/*!40000 ALTER TABLE `rel_cinema_films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_film_lang`
--

DROP TABLE IF EXISTS `rel_film_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rel_film_lang` (
  `film_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_film_lang`
--

LOCK TABLES `rel_film_lang` WRITE;
/*!40000 ALTER TABLE `rel_film_lang` DISABLE KEYS */;
INSERT INTO `rel_film_lang` VALUES (1,1),(1,2),(2,1),(3,3),(3,2);
/*!40000 ALTER TABLE `rel_film_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cinema_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `sessiondate` varchar(45) NOT NULL,
  `sessiontime` varchar(45) NOT NULL,
  `tickets` varchar(16) DEFAULT NULL,
  `language` varchar(45) DEFAULT NULL,
  `quality` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,2,'20/3/20','9:00','0000000000000000','GEO','2D'),(3,2,3,'21/3/20','17:45','1111100011111111','GEO','2D'),(4,2,3,'22/3/20','11:30','0111101011111111','RUS','3D'),(5,2,3,'25/3/20','22:00','0111001100101000','GEO','3D'),(6,1,3,'22/3/20','14:30','0111101011111111','GEO','2D'),(7,3,2,'22/3/20','21:30','0111101100011111','GEO','2D'),(8,1,3,'27/4/20','15:00','1111111111111111','ENG','3D'),(9,1,3,'28/4/20','17:00','1001110110111011','ENG','3D'),(10,3,3,'23/4/20','18:00','1111111111111111','RUS','2D'),(11,3,3,'25/4/20','19:00','1111111111011101','ENG','2D');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idnum` varchar(11) NOT NULL,
  `saxeli` varchar(45) DEFAULT NULL,
  `gvari` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `idnum_UNIQUE` (`idnum`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'111','goga','gachechiladze','goga31@gmail.com','goga03','1234'),(2,'122','ako','beridze','ako123@gmail.com','ako123123','12345'),(3,'222','giorgi','beridze','giorgi@gmail.com','giorgi12','12345'),(4,'333','ako','gachechiladze','ako@gmail.com','ako1234','12345'),(5,'123123','nugo','amonashvili','nugo123@gmail.com','nugo123','1234'),(7,'555','giorgi','merebashvili','giorgi@gmail.com','giorgi55','12345'),(10,'191919','ako','loladze','akololadze@gmail.com','akolola123','1234'),(11,'181818','giorgi','gachechiladze','giorgi12@gmail.com','giorgi07','1234'),(12,'7777','test','test','test777@gmail.com','test777','1234'),(16,'10001','test','test','test777@gmail.com','test7771','1234'),(17,'1000','test ','test','test777@gmail.com','test7772','1234'),(19,'9212','jknasd','aksjd','gasas@gmail.com','oainsdo','1234'),(20,'1010','test','test2','test1010@gmail.com','test1010','9876'),(21,'9911','test','test','test9911@gmail.com','test9911','1234'),(22,'8811','test','test1','test8811@gmail.com','test8811','1234');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tickets'
--

--
-- Dumping routines for database 'tickets'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-30 16:40:26
