-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: fitnessdb
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add course',8,'add_course'),(26,'Can change course',8,'change_course'),(27,'Can delete course',8,'delete_course'),(28,'Can view course',8,'view_course'),(29,'Can add instructor',7,'add_instructor'),(30,'Can change instructor',7,'change_instructor'),(31,'Can delete instructor',7,'delete_instructor'),(32,'Can view instructor',7,'view_instructor'),(33,'Can add student',10,'add_student'),(34,'Can change student',10,'change_student'),(35,'Can delete student',10,'delete_student'),(36,'Can view student',10,'view_student'),(37,'Can add student',11,'add_student'),(38,'Can change student',11,'change_student'),(39,'Can delete student',11,'delete_student'),(40,'Can view student',11,'view_student'),(41,'Can add session',9,'add_session'),(42,'Can change session',9,'change_session'),(43,'Can delete session',9,'delete_session'),(44,'Can view session',9,'view_session'),(45,'Can add enroll',12,'add_enroll'),(46,'Can change enroll',12,'change_enroll'),(47,'Can delete enroll',12,'delete_enroll'),(48,'Can view enroll',12,'view_enroll'),(49,'Can add usersstudent',13,'add_usersstudent'),(50,'Can change usersstudent',13,'change_usersstudent'),(51,'Can delete usersstudent',13,'delete_usersstudent'),(52,'Can view usersstudent',13,'view_usersstudent'),(53,'Can add users student',14,'add_usersstudent'),(54,'Can change users student',14,'change_usersstudent'),(55,'Can delete users student',14,'delete_usersstudent'),(56,'Can view users student',14,'view_usersstudent');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$Ve3ifaI3eNElP8NrTUh0bF$LWiLIshlX4KvOwOVEbqdy8Q79dP36XxBK4WaI7sdAvY=','2021-11-27 00:21:38.149654',1,'admin','','','admin@gmail.com',1,1,'2021-10-08 23:24:00.261970'),(2,'pbkdf2_sha256$260000$V2SKlsvT1NYNinBEaSNTUT$aRcksPnrjS+tW5sKEbWLLVjQZdAUl3s2z3hKiECLJ0E=',NULL,0,'sanjshroff2@gmail.com','','','',0,1,'2021-11-17 03:35:21.950574'),(3,'pbkdf2_sha256$260000$p1cKzf6T0i1JSja9IDbjw1$AvH9CcqE95cq4WP1IR3+oYAbjKGMYFjfXjWyOe6V3wg=','2021-11-19 05:13:00.105874',0,'kush','kushal','','kush@gmail.com',0,1,'2021-11-19 05:09:26.383730'),(4,'pbkdf2_sha256$260000$guuR9lH9JmxDe6lzNymjP4$pJzkEJUu3c9gyNUvU0T9Wwq2pmMZN4zbzEE8PZ3xzBc=','2021-11-22 22:07:19.411467',0,'x2020dxl','Sanjana','','sanjshroff2@gmail.co',0,1,'2021-11-22 22:06:46.539138'),(5,'pbkdf2_sha256$260000$AIsIOt8AH4E6wmLHDGbQZE$T+1jBAY7RCNrN0RvK5xOivr8KKbpgVbUtlCMeAVpgsY=','2021-11-26 20:58:19.408731',0,'anil','anil','','anil@gmail.com',0,1,'2021-11-26 04:34:01.476838'),(9,'pbkdf2_sha256$260000$q2cnTIBnantmPe3GcGaoww$2oj1IS5V9v27PQJ3baWCG9t0TgwCNrVhSHt9no5MSUU=','2021-11-27 00:15:40.098547',0,'pyadavs','PAVAN','','pavansyadav07@gmail.com',0,1,'2021-11-26 22:52:01.973840'),(10,'pbkdf2_sha256$260000$HouknXHHBbBxLcj70pHwDR$wJjcmWv+VbfE8JWdIo4qgBIh5Y8ucNxBluv0MIqovsE=','2021-11-29 17:48:22.091076',0,'chetan123','chetan','','chetan123@gmail.com',0,1,'2021-11-28 20:45:52.215397');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `courseId` int NOT NULL AUTO_INCREMENT,
  `courseName` varchar(45) NOT NULL,
  `courseDescription` varchar(100) DEFAULT NULL,
  `trainer` int DEFAULT NULL,
  `featured_image` varchar(100) DEFAULT NULL,
  `zoom_link` varchar(1000) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`courseId`),
  KEY `trainer_idx` (`trainer`),
  CONSTRAINT `trainer` FOREIGN KEY (`trainer`) REFERENCES `instructor` (`instructorId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (10,'Yoga','Relaxes your mind. Yoga is a mind and body practice. Various styles of yoga combine physical posture',305,'yoga_mvwLQHV.jpg','https://zoom.us/','2021-11-19 21:34:04.816871'),(11,'Aerobics','Increase your stamina, fitness and strength',306,'aerobics_DSsaOtR.jpg','https://zoom.us/','2021-11-19 21:34:23.917430'),(12,'Zumba','Zumba is a fitness program that combines Latin and international music with dance moves. Zumba routi',305,'default_GBURsCC.png','https://zoom.us/','2021-11-19 22:18:14.543006'),(14,'Strength','Weight training is a type of strength training that uses weights for resistance.',310,'strength_dE2XCw5.jpg','https://zoom.us/','2021-11-27 14:19:18.756518');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-10-08 23:29:13.026587','101','Course object (101)',1,'[{\"added\": {}}]',8,1),(2,'2021-11-17 03:18:29.258187','204','pa1',1,'[{\"added\": {}}]',10,1),(3,'2021-11-17 03:35:22.884103','2','sanjshroff2@gmail.com',1,'[{\"added\": {}}]',4,1),(4,'2021-11-17 03:36:00.860987','1','Student object (1)',1,'[{\"added\": {}}]',11,1),(5,'2021-11-17 04:05:54.662690','1','Yoga1',2,'[{\"changed\": {\"fields\": [\"Trainer\"]}}]',8,1),(6,'2021-11-17 04:29:21.550830','8','Yoga',1,'[{\"added\": {}}]',8,1),(7,'2021-11-17 05:16:15.953398','9','Aerobics',1,'[{\"added\": {}}]',8,1),(8,'2021-11-18 04:39:15.502908','8','Yoga',2,'[{\"changed\": {\"fields\": [\"Featured image\"]}}]',8,1),(9,'2021-11-18 04:41:07.184416','9','Aerobics',2,'[{\"changed\": {\"fields\": [\"Featured image\"]}}]',8,1),(10,'2021-11-18 05:31:49.377589','d60813db-a590-4bbe-b336-b08b9bbc2e04','sanjshroff',1,'[{\"added\": {}}]',11,1),(11,'2021-11-18 05:32:34.168915','2190dfdb-ab41-4285-8d4e-ce586fabe43a','admin',1,'[{\"added\": {}}]',11,1),(12,'2021-11-19 21:25:49.108169','303','Jhon Gonzalez',3,'',7,1),(13,'2021-11-19 21:26:05.609642','302','Matthew Perry',3,'',7,1),(14,'2021-11-19 21:26:11.494077','301','Christine Lewis',3,'',7,1),(15,'2021-11-19 21:26:51.027009','305','Christine Lewis',1,'[{\"added\": {}}]',7,1),(16,'2021-11-19 21:27:20.811503','306','Matthew Perry',1,'[{\"added\": {}}]',7,1),(17,'2021-11-19 21:28:01.419759','307','Jhon Gonzalez',1,'[{\"added\": {}}]',7,1),(18,'2021-11-19 21:34:04.838005','10','Yoga',1,'[{\"added\": {}}]',8,1),(19,'2021-11-19 21:34:23.921110','11','Aerobics',1,'[{\"added\": {}}]',8,1),(20,'2021-11-19 22:18:14.544927','12','Zumba',1,'[{\"added\": {}}]',8,1),(21,'2021-11-19 22:26:37.092302','13','Dance',1,'[{\"added\": {}}]',8,1),(22,'2021-11-20 03:27:03.532464','0','Enroll object (0)',1,'[{\"added\": {}}]',12,1),(23,'2021-11-20 03:28:16.929691','205','std3',1,'[{\"added\": {}}]',10,1),(24,'2021-11-20 03:28:24.603477','0','Enroll object (0)',1,'[{\"added\": {}}]',12,1),(25,'2021-11-26 04:40:33.787310','6','xxx1',3,'',4,1),(26,'2021-11-26 22:43:23.958793','7','pyadavs',3,'',4,1),(27,'2021-11-26 22:51:15.383203','8','pyadavs',3,'',4,1),(28,'2021-11-27 04:17:49.276262','20','Enroll object (20)',3,'',12,1),(29,'2021-11-27 04:18:23.373802','21','Enroll object (21)',3,'',12,1),(30,'2021-11-27 04:21:05.599740','22','Enroll object (22)',3,'',12,1),(31,'2021-11-27 04:22:04.346865','23','Enroll object (23)',3,'',12,1),(32,'2021-11-27 04:24:47.075518','24','Enroll object (24)',3,'',12,1),(33,'2021-11-27 04:27:14.648073','25','Enroll object (25)',3,'',12,1),(34,'2021-11-27 04:27:22.768276','19','Enroll object (19)',3,'',12,1),(35,'2021-11-27 04:27:29.137706','26','Enroll object (26)',3,'',12,1),(36,'2021-11-27 04:27:34.722550','27','Enroll object (27)',3,'',12,1),(37,'2021-11-27 04:27:39.703334','28','Enroll object (28)',3,'',12,1),(38,'2021-11-27 04:27:52.054625','30','Enroll object (30)',3,'',12,1),(39,'2021-11-27 04:27:55.879255','31','Enroll object (31)',3,'',12,1),(40,'2021-11-27 04:28:05.960284','29','Enroll object (29)',3,'',12,1),(41,'2021-11-27 04:28:24.843573','32','Enroll object (32)',3,'',12,1),(42,'2021-11-27 04:43:52.104677','33','Enroll object (33)',3,'',12,1),(43,'2021-11-27 04:43:56.627616','34','Enroll object (34)',3,'',12,1),(44,'2021-11-27 04:48:33.845431','35','Enroll object (35)',3,'',12,1),(45,'2021-11-27 04:50:08.486331','36','Enroll object (36)',3,'',12,1),(46,'2021-11-27 14:18:39.522923','310','George',1,'[{\"added\": {}}]',7,1),(47,'2021-11-27 14:19:18.758517','14','Strength',1,'[{\"added\": {}}]',8,1),(48,'2021-11-27 14:33:41.286771','310','George',2,'[{\"changed\": {\"fields\": [\"Featured image\"]}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'fitnessadmin','course'),(12,'fitnessadmin','enroll'),(7,'fitnessadmin','instructor'),(9,'fitnessadmin','session'),(10,'fitnessadmin','student'),(13,'fitnessadmin','usersstudent'),(6,'sessions','session'),(11,'users','student'),(14,'users','usersstudent');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-10-08 23:21:27.675250'),(2,'auth','0001_initial','2021-10-08 23:21:28.725026'),(3,'admin','0001_initial','2021-10-08 23:21:29.075135'),(4,'admin','0002_logentry_remove_auto_add','2021-10-08 23:21:29.096435'),(5,'admin','0003_logentry_add_action_flag_choices','2021-10-08 23:21:29.126032'),(6,'contenttypes','0002_remove_content_type_name','2021-10-08 23:21:29.294980'),(7,'auth','0002_alter_permission_name_max_length','2021-10-08 23:21:29.415581'),(8,'auth','0003_alter_user_email_max_length','2021-10-08 23:21:29.465762'),(9,'auth','0004_alter_user_username_opts','2021-10-08 23:21:29.485369'),(10,'auth','0005_alter_user_last_login_null','2021-10-08 23:21:29.594967'),(11,'auth','0006_require_contenttypes_0002','2021-10-08 23:21:29.611060'),(12,'auth','0007_alter_validators_add_error_messages','2021-10-08 23:21:29.634969'),(13,'auth','0008_alter_user_username_max_length','2021-10-08 23:21:29.795504'),(14,'auth','0009_alter_user_last_name_max_length','2021-10-08 23:21:29.975202'),(15,'auth','0010_alter_group_name_max_length','2021-10-08 23:21:30.076968'),(16,'auth','0011_update_proxy_permissions','2021-10-08 23:21:30.095516'),(17,'auth','0012_alter_user_first_name_max_length','2021-10-08 23:21:30.235589'),(18,'sessions','0001_initial','2021-10-08 23:21:30.316676'),(19,'fitnessadmin','0001_initial','2021-11-17 03:16:35.343056'),(20,'users','0001_initial','2021-11-17 03:32:38.408179'),(21,'users','0002_auto_20211116_2342','2021-11-17 03:42:08.883031'),(22,'fitnessadmin','0002_enroll_session','2021-11-20 01:45:28.914743'),(23,'fitnessadmin','0003_auto_20211119_2315','2021-11-20 03:15:57.862241'),(24,'fitnessadmin','0002_enroll','2021-11-20 03:23:29.912558'),(25,'fitnessadmin','0002_student','2021-11-26 21:25:04.449964');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('c2ju5qnr3v9ymlqdgewwx1fz8fl2r8fo','.eJxVjDsOAiEUAO9CbQjw-IilvWcgPB7IqoFk2a2MdzckW2g7M5k3C3HfathHXsNC7MIcO_0yjOmZ2xT0iO3eeeptWxfkM-GHHfzWKb-uR_s3qHHUuT1LIGujy85J6ROgVmiyhaKMAolonNfOgqUCRSRvInpUWooMnmwR7PMFwpo3Hw:1mqjot:ikoqQZR8b4cAy2bAygqLvHZKYR2_TmxumtfoAWGCKGU','2021-12-10 22:35:51.529358'),('dba6etgjfdudhchqn7e8uy1tcxx2ej5x','.eJxVjMsOwiAQRf-FtSEUlIdL9_0GMjAzUjWQlHZl_HfbpAvd3nPOfYsI61Li2mmOE4qrGMTpd0uQn1R3gA-o9yZzq8s8Jbkr8qBdjg3pdTvcv4MCvWw1O3QMwToyRrHXHjWjPWu2IQefyaLZDO00qKAyMBBSyCbhJSUzOBafL_myON4:1mqlTG:R4fhwxVSEPOOLBjolr36biY6Zyzjro4FwQnDQd7OTg8','2021-12-11 00:21:38.159013'),('jeiz3nxojk1uuzhv7axm5zrzodjugx37','.eJxVjMsOwiAQRf-FtSEUlIdL9_0GMjAzUjWQlHZl_HfbpAvd3nPOfYsI61Li2mmOE4qrGMTpd0uQn1R3gA-o9yZzq8s8Jbkr8qBdjg3pdTvcv4MCvWw1O3QMwToyRrHXHjWjPWu2IQefyaLZDO00qKAyMBBSyCbhJSUzOBafL_myON4:1miTIr:JckKJSVYuac8h28sL-VtZnpQw9RQKQrKtvV274858Rw','2021-11-18 03:20:37.793190'),('t6ukeitequ3a9wa5triq5ur42zg53y44','e30:1mnw9P:456u_pj5_lYig3szT5b12TbiTWm-s7XwAwaqL1qb6sM','2021-12-03 05:09:27.301565'),('u29orskv7zvgog1l4hzv0lxkglc462qw','.eJxVjEsOwjAMBe-SNYrsJk1dluw5Q2XHCS2gROpnhbg7VOoCtm9m3ssMvK3jsC1pHiY1Z4NgTr-jcHykshO9c7lVG2tZ50nsrtiDLvZaNT0vh_t3MPIyfuteQDsFSho8kwTsM3uJvQvoO-IkGBtsA4k6hwRAIDm3mMA1mQNE8_4ACX438A:1mrklK:gmhzhNr9W8XN8FFcTQ0HwHpBTyK8zBdcFxc5BJaFx_I','2021-12-13 17:48:22.265889'),('xt7ke92dfxqx9dbi82l4v7e0sdps03dn','.eJxVjMsOwiAQRf-FtSEUlIdL9_0GMjAzUjWQlHZl_HfbpAvd3nPOfYsI61Li2mmOE4qrGMTpd0uQn1R3gA-o9yZzq8s8Jbkr8qBdjg3pdTvcv4MCvWw1O3QMwToyRrHXHjWjPWu2IQefyaLZDO00qKAyMBBSyCbhJSUzOBafL_myON4:1mYzDm:EkDYprap45H2Nf4stGVNFl3l64FLIQgCwvDeYckRhqY','2021-10-22 23:24:10.415754');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enroll`
--

DROP TABLE IF EXISTS `enroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enroll` (
  `studentId` char(32) NOT NULL,
  `courseId` int NOT NULL,
  `enrollId` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`enrollId`),
  KEY `sessionId_idx` (`courseId`),
  KEY `studentId_idx` (`studentId`),
  CONSTRAINT `courseId` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studentId` FOREIGN KEY (`studentId`) REFERENCES `users_student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enroll`
--

LOCK TABLES `enroll` WRITE;
/*!40000 ALTER TABLE `enroll` DISABLE KEYS */;
INSERT INTO `enroll` VALUES ('2190dfdbab4142858d4ece586fabe43a',10,1),('d60813dba5904bbeb336b08b9bbc2e04',10,15),('2190dfdbab4142858d4ece586fabe43a',10,16);
/*!40000 ALTER TABLE `enroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `instructorId` int NOT NULL AUTO_INCREMENT,
  `instructorName` varchar(45) NOT NULL,
  `instructorCourse` varchar(45) DEFAULT NULL,
  `instructorSkills` varchar(45) DEFAULT NULL,
  `instructorPhoneNumber` varchar(45) NOT NULL,
  `instructorEmail` varchar(45) NOT NULL,
  `featured_image` varchar(100) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`instructorId`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (305,'Christine Lewis','Yoga at the Desk Wellness Workshop','Welness','902-620-4844','wenmarbyoga@gmail.com','profile_gFSDkrn.jpg','2021-11-19 21:26:51.024047','12345'),(306,'Matthew Perry','Aerobics instructor','Aerobics','902-720-5467','matt@gmail.com','profile_KOzcY5E.jpg','2021-11-19 21:27:20.809459',NULL),(307,'Jhon Gonzale','Zumba Instructor','Zumba','902-720-5674','jhong@gmail.com','profile_lMJitPL.jpg','2021-11-19 21:28:01.415550',NULL),(310,'George','Strength training','Weight lifting','9027181234','george123@gmail.com','profile_BHATuMp.jpg','2021-11-27 14:18:39.520918',NULL);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `sessionId` int NOT NULL AUTO_INCREMENT,
  `instructorId` int NOT NULL,
  `courseId` int NOT NULL,
  `zoomLink` varchar(2000) NOT NULL,
  PRIMARY KEY (`sessionId`),
  KEY `instructorId_idx` (`instructorId`),
  KEY `course_idx` (`courseId`),
  CONSTRAINT `course` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `instructor` FOREIGN KEY (`instructorId`) REFERENCES `instructor` (`instructorId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `studentId` int NOT NULL AUTO_INCREMENT,
  `studentFirstName` varchar(45) NOT NULL,
  `studentPhoneNumber` varchar(45) NOT NULL,
  `studentLastName` varchar(45) DEFAULT NULL,
  `studentEmailId` varchar(45) NOT NULL,
  `studentPassword` varchar(45) NOT NULL,
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (201,'Student1','902-719-9999','S','student1@gmail.com','san123'),(202,'Student2','902-719-8889','Y','student2@gmail.com','pan123'),(203,'Student3','9027199090','R','student3@gmail.com','12345'),(204,'pa1','1234','F','abc123@gmail.com','12345'),(205,'std3','aa',NULL,'pavansyadav07@gmail.com','12345');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_student`
--

DROP TABLE IF EXISTS `users_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_student` (
  `user_id` int DEFAULT NULL,
  `bio` longtext,
  `created` datetime(6) NOT NULL,
  `email` varchar(500) DEFAULT NULL,
  `id` char(32) NOT NULL,
  `location` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `profile_image` varchar(100) DEFAULT NULL,
  `short_intro` varchar(200) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `users_student_user_id_dc59cd64_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_student`
--

LOCK TABLES `users_student` WRITE;
/*!40000 ALTER TABLE `users_student` DISABLE KEYS */;
INSERT INTO `users_student` VALUES (9,NULL,'2021-11-26 22:52:02.326158','pavansyadav07@gmail.com','175b41c068784a34ae832008eb49c7c2',NULL,'PAVAN','profiles/user-default.png',NULL,'pyadavs'),(1,'','2021-11-18 05:32:34.167529','admin@gmail.com','2190dfdbab4142858d4ece586fabe43a',NULL,'admin','profiles/user-default.png',NULL,'admin'),(10,NULL,'2021-11-28 20:45:52.680696','chetan123@gmail.com','8f748c58fc344c4cabfe6d049de613ad',NULL,'chetan','profiles/user-default.png',NULL,'chetan123'),(2,'','2021-11-18 05:31:49.376581','sanjshroff2@gmail.com','d60813dba5904bbeb336b08b9bbc2e04',NULL,'Sanjana','profiles/user-default.png','I am Shroff','sanjshroff');
/*!40000 ALTER TABLE `users_student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-30  0:31:38
