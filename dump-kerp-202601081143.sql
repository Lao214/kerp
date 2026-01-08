-- MySQL dump 10.13  Distrib 8.0.11, for macos10.13 (x86_64)
--
-- Host: localhost    Database: kerp
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ACT_APP_APPDEF`
--

DROP TABLE IF EXISTS `ACT_APP_APPDEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_APP_APPDEF` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_APP_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`),
  KEY `ACT_IDX_APP_DEF_DPLY` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_APP_DEF_DPLY` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_app_deployment` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_APP_APPDEF`
--

LOCK TABLES `ACT_APP_APPDEF` WRITE;
/*!40000 ALTER TABLE `ACT_APP_APPDEF` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_APP_APPDEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_APP_DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `ACT_APP_DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_APP_DATABASECHANGELOG` (
  `ID` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_APP_DATABASECHANGELOG`
--

LOCK TABLES `ACT_APP_DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `ACT_APP_DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `ACT_APP_DATABASECHANGELOG` VALUES ('1','flowable','org/flowable/app/db/liquibase/flowable-app-db-changelog.xml','2025-12-22 11:44:40',1,'EXECUTED','8:496fc778bdf2ab13f2e1926d0e63e0a2','createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...','',NULL,'4.20.0',NULL,NULL,'6375080726'),('2','flowable','org/flowable/app/db/liquibase/flowable-app-db-changelog.xml','2025-12-22 11:44:40',2,'EXECUTED','8:ccea9ebfb6c1f8367ca4dd473fcbb7db','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_APP_DEPLOYMENT','',NULL,'4.20.0',NULL,NULL,'6375080726'),('3','flowable','org/flowable/app/db/liquibase/flowable-app-db-changelog.xml','2025-12-22 11:44:40',3,'EXECUTED','8:f1f8aff320aade831944ebad24355f3d','createIndex indexName=ACT_IDX_APP_DEF_UNIQ, tableName=ACT_APP_APPDEF','',NULL,'4.20.0',NULL,NULL,'6375080726');
/*!40000 ALTER TABLE `ACT_APP_DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_APP_DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `ACT_APP_DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_APP_DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_APP_DATABASECHANGELOGLOCK`
--

LOCK TABLES `ACT_APP_DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `ACT_APP_DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `ACT_APP_DATABASECHANGELOGLOCK` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `ACT_APP_DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_APP_DEPLOYMENT`
--

DROP TABLE IF EXISTS `ACT_APP_DEPLOYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_APP_DEPLOYMENT` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_APP_DEPLOYMENT`
--

LOCK TABLES `ACT_APP_DEPLOYMENT` WRITE;
/*!40000 ALTER TABLE `ACT_APP_DEPLOYMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_APP_DEPLOYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_APP_DEPLOYMENT_RESOURCE`
--

DROP TABLE IF EXISTS `ACT_APP_DEPLOYMENT_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_APP_DEPLOYMENT_RESOURCE` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_APP_RSRC_DPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_APP_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_app_deployment` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_APP_DEPLOYMENT_RESOURCE`
--

LOCK TABLES `ACT_APP_DEPLOYMENT_RESOURCE` WRITE;
/*!40000 ALTER TABLE `ACT_APP_DEPLOYMENT_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_APP_DEPLOYMENT_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_CASEDEF`
--

DROP TABLE IF EXISTS `ACT_CMMN_CASEDEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_CMMN_CASEDEF` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` bit(1) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HAS_START_FORM_KEY_` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_CASE_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`),
  KEY `ACT_IDX_CASE_DEF_DPLY` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_CASE_DEF_DPLY` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_cmmn_deployment` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_CASEDEF`
--

LOCK TABLES `ACT_CMMN_CASEDEF` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_CASEDEF` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CMMN_CASEDEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `ACT_CMMN_DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_CMMN_DATABASECHANGELOG` (
  `ID` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_DATABASECHANGELOG`
--

LOCK TABLES `ACT_CMMN_DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `ACT_CMMN_DATABASECHANGELOG` VALUES ('1','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-12-22 11:44:39',1,'EXECUTED','8:8b4b922d90b05ff27483abefc9597aa6','createTable tableName=ACT_CMMN_DEPLOYMENT; createTable tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_CMMN_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_CMMN_RSRC_DPL, referencedTableName=ACT_CMMN_DEPLOYMENT; create...','',NULL,'4.20.0',NULL,NULL,'6375078376'),('2','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-12-22 11:44:39',2,'EXECUTED','8:65e39b3d385706bb261cbeffe7533cbe','addColumn tableName=ACT_CMMN_CASEDEF; addColumn tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST','',NULL,'4.20.0',NULL,NULL,'6375078376'),('3','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-12-22 11:44:39',3,'EXECUTED','8:c01f6e802b49436b4489040da3012359','addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_PLAN_ITEM_STAGE_INST, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableNam...','',NULL,'4.20.0',NULL,NULL,'6375078376'),('4','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-12-22 11:44:39',4,'EXECUTED','8:e40d29cb79345b7fb5afd38a7f0ba8fc','createTable tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_MIL_INST; addColumn tableName=ACT_CMMN_HI_MIL_INST','',NULL,'4.20.0',NULL,NULL,'6375078376'),('5','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-12-22 11:44:40',5,'EXECUTED','8:70349de472f87368dcdec971a10311a0','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_CMMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_CASE_INST; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; modifyDataType columnName=T...','',NULL,'4.20.0',NULL,NULL,'6375078376'),('6','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-12-22 11:44:40',6,'EXECUTED','8:10e82e26a7fee94c32a92099c059c18c','createIndex indexName=ACT_IDX_CASE_DEF_UNIQ, tableName=ACT_CMMN_CASEDEF','',NULL,'4.20.0',NULL,NULL,'6375078376'),('7','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-12-22 11:44:40',7,'EXECUTED','8:530bc81a1e30618ccf4a2da1f7c6c043','renameColumn newColumnName=CREATE_TIME_, oldColumnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; renameColumn newColumnName=CREATE_TIME_, oldColumnName=CREATED_TIME_, tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_P...','',NULL,'4.20.0',NULL,NULL,'6375078376'),('8','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-12-22 11:44:40',8,'EXECUTED','8:e8c2eb1ce28bc301efe07e0e29757781','addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST','',NULL,'4.20.0',NULL,NULL,'6375078376'),('9','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-12-22 11:44:40',9,'EXECUTED','8:4cb4782b9bdec5ced2a64c525aa7b3a0','addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST','',NULL,'4.20.0',NULL,NULL,'6375078376'),('10','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-12-22 11:44:40',10,'EXECUTED','8:341c16be247f5d17badc9809da8691f9','addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_CASE_INST_REF_ID_, tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE...','',NULL,'4.20.0',NULL,NULL,'6375078376'),('11','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-12-22 11:44:40',11,'EXECUTED','8:d7c4da9276bcfffbfb0ebfb25e3f7b05','addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST','',NULL,'4.20.0',NULL,NULL,'6375078376'),('12','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-12-22 11:44:40',12,'EXECUTED','8:adf4ecc45f2aa9a44a5626b02e1d6f98','addColumn tableName=ACT_CMMN_RU_CASE_INST','',NULL,'4.20.0',NULL,NULL,'6375078376'),('13','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-12-22 11:44:40',13,'EXECUTED','8:7550626f964ab5518464709408333ec1','addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST','',NULL,'4.20.0',NULL,NULL,'6375078376'),('14','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-12-22 11:44:40',14,'EXECUTED','8:086b40b3a05596dcc8a8d7479922d494','addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST','',NULL,'4.20.0',NULL,NULL,'6375078376'),('16','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-12-22 11:44:40',15,'EXECUTED','8:a697a222ddd99dd15b36516a252f1c63','addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST','',NULL,'4.20.0',NULL,NULL,'6375078376'),('17','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-12-22 11:44:40',16,'EXECUTED','8:d3706c5813a9b97fd2a59d12a9523946','createIndex indexName=ACT_IDX_HI_CASE_INST_END, tableName=ACT_CMMN_HI_CASE_INST','',NULL,'4.20.0',NULL,NULL,'6375078376');
/*!40000 ALTER TABLE `ACT_CMMN_DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `ACT_CMMN_DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_CMMN_DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_DATABASECHANGELOGLOCK`
--

LOCK TABLES `ACT_CMMN_DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `ACT_CMMN_DATABASECHANGELOGLOCK` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `ACT_CMMN_DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_DEPLOYMENT`
--

DROP TABLE IF EXISTS `ACT_CMMN_DEPLOYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_CMMN_DEPLOYMENT` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_DEPLOYMENT`
--

LOCK TABLES `ACT_CMMN_DEPLOYMENT` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_DEPLOYMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CMMN_DEPLOYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_DEPLOYMENT_RESOURCE`
--

DROP TABLE IF EXISTS `ACT_CMMN_DEPLOYMENT_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_CMMN_DEPLOYMENT_RESOURCE` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  `GENERATED_` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_CMMN_RSRC_DPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_CMMN_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_cmmn_deployment` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_DEPLOYMENT_RESOURCE`
--

LOCK TABLES `ACT_CMMN_DEPLOYMENT_RESOURCE` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_DEPLOYMENT_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CMMN_DEPLOYMENT_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_HI_CASE_INST`
--

DROP TABLE IF EXISTS `ACT_CMMN_HI_CASE_INST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_CMMN_HI_CASE_INST` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PARENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STATE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `REFERENCE_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_REACTIVATION_TIME_` datetime(3) DEFAULT NULL,
  `LAST_REACTIVATION_USER_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_CASE_INST_END` (`END_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_HI_CASE_INST`
--

LOCK TABLES `ACT_CMMN_HI_CASE_INST` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_HI_CASE_INST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CMMN_HI_CASE_INST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_HI_MIL_INST`
--

DROP TABLE IF EXISTS `ACT_CMMN_HI_MIL_INST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_CMMN_HI_MIL_INST` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `TIME_STAMP_` datetime(3) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_HI_MIL_INST`
--

LOCK TABLES `ACT_CMMN_HI_MIL_INST` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_HI_MIL_INST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CMMN_HI_MIL_INST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_HI_PLAN_ITEM_INST`
--

DROP TABLE IF EXISTS `ACT_CMMN_HI_PLAN_ITEM_INST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_CMMN_HI_PLAN_ITEM_INST` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STATE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IS_STAGE_` bit(1) DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ITEM_DEFINITION_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) DEFAULT NULL,
  `EXIT_TIME_` datetime(3) DEFAULT NULL,
  `ENDED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `ENTRY_CRITERION_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SHOW_IN_OVERVIEW_` bit(1) DEFAULT NULL,
  `EXTRA_VALUE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DERIVED_CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_UNAVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_HI_PLAN_ITEM_INST`
--

LOCK TABLES `ACT_CMMN_HI_PLAN_ITEM_INST` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_HI_PLAN_ITEM_INST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CMMN_HI_PLAN_ITEM_INST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_RU_CASE_INST`
--

DROP TABLE IF EXISTS `ACT_CMMN_RU_CASE_INST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_CMMN_RU_CASE_INST` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PARENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STATE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `LOCK_TIME_` datetime(3) DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_REACTIVATION_TIME_` datetime(3) DEFAULT NULL,
  `LAST_REACTIVATION_USER_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_CASE_INST_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_CASE_INST_PARENT` (`PARENT_ID_`),
  KEY `ACT_IDX_CASE_INST_REF_ID_` (`REFERENCE_ID_`),
  CONSTRAINT `ACT_FK_CASE_INST_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_RU_CASE_INST`
--

LOCK TABLES `ACT_CMMN_RU_CASE_INST` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_RU_CASE_INST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CMMN_RU_CASE_INST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_RU_MIL_INST`
--

DROP TABLE IF EXISTS `ACT_CMMN_RU_MIL_INST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_CMMN_RU_MIL_INST` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `TIME_STAMP_` datetime(3) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_MIL_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_MIL_CASE_INST` (`CASE_INST_ID_`),
  CONSTRAINT `ACT_FK_MIL_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`id_`),
  CONSTRAINT `ACT_FK_MIL_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_RU_MIL_INST`
--

LOCK TABLES `ACT_CMMN_RU_MIL_INST` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_RU_MIL_INST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CMMN_RU_MIL_INST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_RU_PLAN_ITEM_INST`
--

DROP TABLE IF EXISTS `ACT_CMMN_RU_PLAN_ITEM_INST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_CMMN_RU_PLAN_ITEM_INST` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IS_STAGE_` bit(1) DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STATE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `ITEM_DEFINITION_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) DEFAULT NULL,
  `IS_COUNT_ENABLED_` bit(1) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `SENTRY_PART_INST_COUNT_` int(11) DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) DEFAULT NULL,
  `EXIT_TIME_` datetime(3) DEFAULT NULL,
  `ENDED_TIME_` datetime(3) DEFAULT NULL,
  `ENTRY_CRITERION_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXTRA_VALUE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DERIVED_CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_UNAVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_PLAN_ITEM_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_PLAN_ITEM_CASE_INST` (`CASE_INST_ID_`),
  KEY `ACT_IDX_PLAN_ITEM_STAGE_INST` (`STAGE_INST_ID_`),
  CONSTRAINT `ACT_FK_PLAN_ITEM_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`id_`),
  CONSTRAINT `ACT_FK_PLAN_ITEM_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_RU_PLAN_ITEM_INST`
--

LOCK TABLES `ACT_CMMN_RU_PLAN_ITEM_INST` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_RU_PLAN_ITEM_INST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CMMN_RU_PLAN_ITEM_INST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_RU_SENTRY_PART_INST`
--

DROP TABLE IF EXISTS `ACT_CMMN_RU_SENTRY_PART_INST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_CMMN_RU_SENTRY_PART_INST` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PLAN_ITEM_INST_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ON_PART_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IF_PART_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TIME_STAMP_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_SENTRY_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_SENTRY_CASE_INST` (`CASE_INST_ID_`),
  KEY `ACT_IDX_SENTRY_PLAN_ITEM` (`PLAN_ITEM_INST_ID_`),
  CONSTRAINT `ACT_FK_SENTRY_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`id_`),
  CONSTRAINT `ACT_FK_SENTRY_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`id_`),
  CONSTRAINT `ACT_FK_SENTRY_PLAN_ITEM` FOREIGN KEY (`PLAN_ITEM_INST_ID_`) REFERENCES `act_cmmn_ru_plan_item_inst` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_RU_SENTRY_PART_INST`
--

LOCK TABLES `ACT_CMMN_RU_SENTRY_PART_INST` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_RU_SENTRY_PART_INST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CMMN_RU_SENTRY_PART_INST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_DMN_DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `ACT_DMN_DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_DMN_DATABASECHANGELOG` (
  `ID` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_DMN_DATABASECHANGELOG`
--

LOCK TABLES `ACT_DMN_DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `ACT_DMN_DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `ACT_DMN_DATABASECHANGELOG` VALUES ('1','activiti','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2025-12-22 11:44:37',1,'EXECUTED','8:c8701f1c71018b55029f450b2e9a10a1','createTable tableName=ACT_DMN_DEPLOYMENT; createTable tableName=ACT_DMN_DEPLOYMENT_RESOURCE; createTable tableName=ACT_DMN_DECISION_TABLE','',NULL,'4.20.0',NULL,NULL,'6375077357'),('2','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2025-12-22 11:44:37',2,'EXECUTED','8:47f94b27feb7df8a30d4e338c7bd5fb8','createTable tableName=ACT_DMN_HI_DECISION_EXECUTION','',NULL,'4.20.0',NULL,NULL,'6375077357'),('3','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2025-12-22 11:44:37',3,'EXECUTED','8:ac17eae89fbdccb6e08daf3c7797b579','addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION','',NULL,'4.20.0',NULL,NULL,'6375077357'),('4','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2025-12-22 11:44:37',4,'EXECUTED','8:f73aabc4529e7292c2942073d1cff6f9','dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_DMN_DECISION_TABLE','',NULL,'4.20.0',NULL,NULL,'6375077357'),('5','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2025-12-22 11:44:37',5,'EXECUTED','8:3e03528582dd4eeb4eb41f9b9539140d','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_DMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION; modifyDataType columnName=END_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION','',NULL,'4.20.0',NULL,NULL,'6375077357'),('6','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2025-12-22 11:44:37',6,'EXECUTED','8:646c6a061e0b6e8a62e69844ff96abb0','createIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE','',NULL,'4.20.0',NULL,NULL,'6375077357'),('7','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2025-12-22 11:44:37',7,'EXECUTED','8:215a499ff7ae77685b55355245b8b708','dropIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE; renameTable newTableName=ACT_DMN_DECISION, oldTableName=ACT_DMN_DECISION_TABLE; createIndex indexName=ACT_IDX_DMN_DEC_UNIQ, tableName=ACT_DMN_DECISION','',NULL,'4.20.0',NULL,NULL,'6375077357'),('8','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2025-12-22 11:44:37',8,'EXECUTED','8:5355bee389318afed91a11702f2df032','addColumn tableName=ACT_DMN_DECISION','',NULL,'4.20.0',NULL,NULL,'6375077357'),('9','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2025-12-22 11:44:37',9,'EXECUTED','8:0fe82086431b1953d293f0199f805876','createIndex indexName=ACT_IDX_DMN_INSTANCE_ID, tableName=ACT_DMN_HI_DECISION_EXECUTION','',NULL,'4.20.0',NULL,NULL,'6375077357');
/*!40000 ALTER TABLE `ACT_DMN_DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_DMN_DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `ACT_DMN_DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_DMN_DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_DMN_DATABASECHANGELOGLOCK`
--

LOCK TABLES `ACT_DMN_DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `ACT_DMN_DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `ACT_DMN_DATABASECHANGELOGLOCK` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `ACT_DMN_DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_DMN_DECISION`
--

DROP TABLE IF EXISTS `ACT_DMN_DECISION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_DMN_DECISION` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DECISION_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_DMN_DEC_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_DMN_DECISION`
--

LOCK TABLES `ACT_DMN_DECISION` WRITE;
/*!40000 ALTER TABLE `ACT_DMN_DECISION` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_DMN_DECISION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_DMN_DEPLOYMENT`
--

DROP TABLE IF EXISTS `ACT_DMN_DEPLOYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_DMN_DEPLOYMENT` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_DMN_DEPLOYMENT`
--

LOCK TABLES `ACT_DMN_DEPLOYMENT` WRITE;
/*!40000 ALTER TABLE `ACT_DMN_DEPLOYMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_DMN_DEPLOYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_DMN_DEPLOYMENT_RESOURCE`
--

DROP TABLE IF EXISTS `ACT_DMN_DEPLOYMENT_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_DMN_DEPLOYMENT_RESOURCE` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_DMN_DEPLOYMENT_RESOURCE`
--

LOCK TABLES `ACT_DMN_DEPLOYMENT_RESOURCE` WRITE;
/*!40000 ALTER TABLE `ACT_DMN_DEPLOYMENT_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_DMN_DEPLOYMENT_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_DMN_HI_DECISION_EXECUTION`
--

DROP TABLE IF EXISTS `ACT_DMN_HI_DECISION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_DMN_HI_DECISION_EXECUTION` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `DECISION_DEFINITION_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `INSTANCE_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ACTIVITY_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FAILED_` bit(1) DEFAULT b'0',
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXECUTION_JSON_` longtext COLLATE utf8mb4_general_ci,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_DMN_INSTANCE_ID` (`INSTANCE_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_DMN_HI_DECISION_EXECUTION`
--

LOCK TABLES `ACT_DMN_HI_DECISION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `ACT_DMN_HI_DECISION_EXECUTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_DMN_HI_DECISION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_EVT_LOG`
--

DROP TABLE IF EXISTS `ACT_EVT_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_EVT_LOG` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_EVT_LOG`
--

LOCK TABLES `ACT_EVT_LOG` WRITE;
/*!40000 ALTER TABLE `ACT_EVT_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_EVT_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_GE_BYTEARRAY`
--

DROP TABLE IF EXISTS `ACT_GE_BYTEARRAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_GE_BYTEARRAY` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_GE_BYTEARRAY`
--

LOCK TABLES `ACT_GE_BYTEARRAY` WRITE;
/*!40000 ALTER TABLE `ACT_GE_BYTEARRAY` DISABLE KEYS */;
INSERT INTO `ACT_GE_BYTEARRAY` VALUES ('1c220782-e54d-11f0-8109-4e8273da71dd',1,'/Users/echoes/Desktop/bumenxiangmu/kerp/target/classes/processes/purchase_audit.bpmn20.xml','1c220781-e54d-11f0-8109-4e8273da71dd','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\n             xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n             xmlns:flowable=\"http://flowable.org/bpmn\"\n             targetNamespace=\"http://www.flowable.org/processdef\">\n\n    <process id=\"purchase_audit\" name=\"采购单审批流程\" isExecutable=\"true\">\n        <startEvent id=\"start\"/>\n\n        <sequenceFlow sourceRef=\"start\" targetRef=\"managerTask\"/>\n\n        <!-- 1. 经理审批 -->\n        <!-- flowable:candidateGroups=\"purchase_mgr\" 表示这个任务发给所有采购经理 -->\n        <userTask id=\"managerTask\" name=\"部门经理审批\" flowable:candidateGroups=\"purchase_mgr\"/>\n\n        <sequenceFlow sourceRef=\"managerTask\" targetRef=\"judgeGateway\"/>\n\n        <!-- 2. 金额判断网关 -->\n        <exclusiveGateway id=\"judgeGateway\"/>\n\n        <sequenceFlow sourceRef=\"judgeGateway\" targetRef=\"bossTask\">\n            <!-- 连线条件：金额 >= 5000 -->\n            <conditionExpression xsi:type=\"tFormalExpression\">${money >= 50000}</conditionExpression>\n        </sequenceFlow>\n\n        <sequenceFlow sourceRef=\"judgeGateway\" targetRef=\"systemAuditTask\">\n            <!-- 连线条件：金额 < 5000，直接跳过老板 -->\n            <conditionExpression xsi:type=\"tFormalExpression\">${money &lt; 50000}</conditionExpression>\n        </sequenceFlow>\n\n        <!-- 3. 老板审批 -->\n        <userTask id=\"bossTask\" name=\"总经理审批\" flowable:candidateGroups=\"admin\"/>\n\n        <sequenceFlow sourceRef=\"bossTask\" targetRef=\"systemAuditTask\"/>\n\n        <!-- 4. 系统自动服务 (Java Delegate) -->\n        <!-- delegateExpression 对应 Spring 容器里的 Bean 名字 -->\n        <serviceTask id=\"systemAuditTask\" name=\"自动入库\" flowable:delegateExpression=\"${purchaseAuditDelegate}\"/>\n\n        <sequenceFlow sourceRef=\"systemAuditTask\" targetRef=\"end\"/>\n\n        <endEvent id=\"end\"/>\n    </process>\n</definitions>',0),('1c220783-e54d-11f0-8109-4e8273da71dd',1,'/Users/echoes/Desktop/bumenxiangmu/kerp/target/classes/processes/sales_audit.bpmn20.xml','1c220781-e54d-11f0-8109-4e8273da71dd','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\n             xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n             xmlns:flowable=\"http://flowable.org/bpmn\"\n             targetNamespace=\"http://www.flowable.org/processdef\">\n\n    <!-- 流程ID: sales_audit -->\n    <process id=\"sales_audit\" name=\"销售出库审批流程\" isExecutable=\"true\">\n        <!--\n        流程从 start 开始。\n        然后通过 sequenceFlow（顺序流）流向第一个任务：销售经理审批。\n         -->\n        <startEvent id=\"start\"/>\n        <sequenceFlow sourceRef=\"start\" targetRef=\"salesMgrTask\"/>\n\n        <!-- 1. 销售经理审批 -->\n        <!--\n            这是一个需要人工处理的任务。\n            分配给用户组 sales_mgr（即销售经理角色）。\n            完成后，流程进入下一步：金额判断网关。\n         -->\n        <userTask id=\"salesMgrTask\" name=\"销售经理审批\" flowable:candidateGroups=\"sales_mgr\"/>\n        <sequenceFlow sourceRef=\"salesMgrTask\" targetRef=\"amountGateway\"/>\n\n        <!-- 2. 金额网关\n            排他网关：根据条件选择唯一一条路径继续执行。\n         -->\n        <exclusiveGateway id=\"amountGateway\"/>\n\n        <!-- > 100000 找老板 -->\n        <sequenceFlow sourceRef=\"amountGateway\" targetRef=\"bossTask\">\n            <conditionExpression xsi:type=\"tFormalExpression\">${money >= 100000}</conditionExpression>\n        </sequenceFlow>\n\n        <!-- < 100000 直接通过 -->\n        <!--\n            ${money}：这是流程变量（Process Variable），通常在启动流程实例时通过 API 传入，例如：\n            runtimeService.startProcessInstanceByKey(\"sales_audit\",  Collections.singletonMap(\"money\", 120000));\n            flowable:candidateGroups=\"sales_mgr\"：表示这个任务可以被 sales_mgr 组内的任意用户领取并处理, flowable:candidateGroups=\"admin\" 同理\n            delegateExpression=\"${salesAuditDelegate}\"：依赖 Spring 容器中名为 salesAuditDelegate 的 Bean，该 Bean 必须实现 org.flowable.engine.delegate.JavaDelegate\n         -->\n        <sequenceFlow sourceRef=\"amountGateway\" targetRef=\"systemOutTask\">\n            <conditionExpression xsi:type=\"tFormalExpression\">${money &lt; 100000}</conditionExpression>\n        </sequenceFlow>\n\n        <!-- 3. 老板审批 -->\n        <userTask id=\"bossTask\" name=\"总经理复审\" flowable:candidateGroups=\"admin\"/>\n        <sequenceFlow sourceRef=\"bossTask\" targetRef=\"systemOutTask\"/>\n\n        <!-- 4. 系统自动出库 (Delegate) -->\n        <serviceTask id=\"systemOutTask\" name=\"自动扣减库存\" flowable:delegateExpression=\"${salesAuditDelegate}\"/>\n        <sequenceFlow sourceRef=\"systemOutTask\" targetRef=\"end\"/>\n\n        <endEvent id=\"end\"/>\n    </process>\n</definitions>',0),('6e9759fc-e163-11f0-b976-4e8273da71dd',1,'/Users/echoes/Desktop/bumenxiangmu/kerp/target/classes/processes/purchase_audit.bpmn20.xml','6e9759fb-e163-11f0-b976-4e8273da71dd','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\n             xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n             xmlns:flowable=\"http://flowable.org/bpmn\"\n             targetNamespace=\"http://www.flowable.org/processdef\">\n\n    <process id=\"purchase_audit\" name=\"采购单审批流程\" isExecutable=\"true\">\n        <startEvent id=\"start\"/>\n\n        <sequenceFlow sourceRef=\"start\" targetRef=\"managerTask\"/>\n\n        <!-- 1. 经理审批 -->\n        <!-- flowable:candidateGroups=\"purchase_mgr\" 表示这个任务发给所有采购经理 -->\n        <userTask id=\"managerTask\" name=\"部门经理审批\" flowable:candidateGroups=\"purchase_mgr\"/>\n\n        <sequenceFlow sourceRef=\"managerTask\" targetRef=\"judgeGateway\"/>\n\n        <!-- 2. 金额判断网关 -->\n        <exclusiveGateway id=\"judgeGateway\"/>\n\n        <sequenceFlow sourceRef=\"judgeGateway\" targetRef=\"bossTask\">\n            <!-- 连线条件：金额 >= 5000 -->\n            <conditionExpression xsi:type=\"tFormalExpression\">${money >= 50000}</conditionExpression>\n        </sequenceFlow>\n\n        <sequenceFlow sourceRef=\"judgeGateway\" targetRef=\"systemAuditTask\">\n            <!-- 连线条件：金额 < 5000，直接跳过老板 -->\n            <conditionExpression xsi:type=\"tFormalExpression\">${money &lt; 50000}</conditionExpression>\n        </sequenceFlow>\n\n        <!-- 3. 老板审批 -->\n        <userTask id=\"bossTask\" name=\"总经理审批\" flowable:candidateGroups=\"admin\"/>\n\n        <sequenceFlow sourceRef=\"bossTask\" targetRef=\"systemAuditTask\"/>\n\n        <!-- 4. 系统自动服务 (Java Delegate) -->\n        <!-- delegateExpression 对应 Spring 容器里的 Bean 名字 -->\n        <serviceTask id=\"systemAuditTask\" name=\"自动入库\" flowable:delegateExpression=\"${purchaseAuditDelegate}\"/>\n\n        <sequenceFlow sourceRef=\"systemAuditTask\" targetRef=\"end\"/>\n\n        <endEvent id=\"end\"/>\n    </process>\n</definitions>',0),('8ca779c8-dee8-11f0-9efa-4e8273da71dd',1,'/Users/echoes/Desktop/bumenxiangmu/kerp/target/classes/processes/purchase_audit.bpmn20.xml','8ca779c7-dee8-11f0-9efa-4e8273da71dd','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\n             xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n             xmlns:flowable=\"http://flowable.org/bpmn\"\n             targetNamespace=\"http://www.flowable.org/processdef\">\n\n    <process id=\"purchase_audit\" name=\"采购单审批流程\" isExecutable=\"true\">\n        <startEvent id=\"start\"/>\n\n        <sequenceFlow sourceRef=\"start\" targetRef=\"managerTask\"/>\n\n        <!-- 1. 经理审批 -->\n        <!-- flowable:candidateGroups=\"purchase_mgr\" 表示这个任务发给所有采购经理 -->\n        <userTask id=\"managerTask\" name=\"部门经理审批\" flowable:candidateGroups=\"purchase_mgr\"/>\n\n        <sequenceFlow sourceRef=\"managerTask\" targetRef=\"judgeGateway\"/>\n\n        <!-- 2. 金额判断网关 -->\n        <exclusiveGateway id=\"judgeGateway\"/>\n\n        <sequenceFlow sourceRef=\"judgeGateway\" targetRef=\"bossTask\">\n            <!-- 连线条件：金额 >= 5000 -->\n            <conditionExpression xsi:type=\"tFormalExpression\">${money >= 5000}</conditionExpression>\n        </sequenceFlow>\n\n        <sequenceFlow sourceRef=\"judgeGateway\" targetRef=\"systemAuditTask\">\n            <!-- 连线条件：金额 < 5000，直接跳过老板 -->\n            <conditionExpression xsi:type=\"tFormalExpression\">${money &lt; 5000}</conditionExpression>\n        </sequenceFlow>\n\n        <!-- 3. 老板审批 -->\n        <userTask id=\"bossTask\" name=\"总经理审批\" flowable:candidateGroups=\"boss\"/>\n\n        <sequenceFlow sourceRef=\"bossTask\" targetRef=\"systemAuditTask\"/>\n\n        <!-- 4. 系统自动服务 (Java Delegate) -->\n        <!-- delegateExpression 对应 Spring 容器里的 Bean 名字 -->\n        <serviceTask id=\"systemAuditTask\" name=\"自动入库\" flowable:delegateExpression=\"${purchaseAuditDelegate}\"/>\n\n        <sequenceFlow sourceRef=\"systemAuditTask\" targetRef=\"end\"/>\n\n        <endEvent id=\"end\"/>\n    </process>\n</definitions>',0),('cfadc3a6-df04-11f0-9127-4e8273da71dd',1,'/Users/echoes/Desktop/bumenxiangmu/kerp/target/classes/processes/purchase_audit.bpmn20.xml','cfadc3a5-df04-11f0-9127-4e8273da71dd','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\n             xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n             xmlns:flowable=\"http://flowable.org/bpmn\"\n             targetNamespace=\"http://www.flowable.org/processdef\">\n\n    <process id=\"purchase_audit\" name=\"采购单审批流程\" isExecutable=\"true\">\n        <startEvent id=\"start\"/>\n\n        <sequenceFlow sourceRef=\"start\" targetRef=\"managerTask\"/>\n\n        <!-- 1. 经理审批 -->\n        <!-- flowable:candidateGroups=\"purchase_mgr\" 表示这个任务发给所有采购经理 -->\n        <userTask id=\"managerTask\" name=\"部门经理审批\" flowable:candidateGroups=\"purchase_mgr\"/>\n\n        <sequenceFlow sourceRef=\"managerTask\" targetRef=\"judgeGateway\"/>\n\n        <!-- 2. 金额判断网关 -->\n        <exclusiveGateway id=\"judgeGateway\"/>\n\n        <sequenceFlow sourceRef=\"judgeGateway\" targetRef=\"bossTask\">\n            <!-- 连线条件：金额 >= 5000 -->\n            <conditionExpression xsi:type=\"tFormalExpression\">${money >= 5000}</conditionExpression>\n        </sequenceFlow>\n\n        <sequenceFlow sourceRef=\"judgeGateway\" targetRef=\"systemAuditTask\">\n            <!-- 连线条件：金额 < 5000，直接跳过老板 -->\n            <conditionExpression xsi:type=\"tFormalExpression\">${money &lt; 5000}</conditionExpression>\n        </sequenceFlow>\n\n        <!-- 3. 老板审批 -->\n        <userTask id=\"bossTask\" name=\"总经理审批\" flowable:candidateGroups=\"admin\"/>\n\n        <sequenceFlow sourceRef=\"bossTask\" targetRef=\"systemAuditTask\"/>\n\n        <!-- 4. 系统自动服务 (Java Delegate) -->\n        <!-- delegateExpression 对应 Spring 容器里的 Bean 名字 -->\n        <serviceTask id=\"systemAuditTask\" name=\"自动入库\" flowable:delegateExpression=\"${purchaseAuditDelegate}\"/>\n\n        <sequenceFlow sourceRef=\"systemAuditTask\" targetRef=\"end\"/>\n\n        <endEvent id=\"end\"/>\n    </process>\n</definitions>',0);
/*!40000 ALTER TABLE `ACT_GE_BYTEARRAY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_GE_PROPERTY`
--

DROP TABLE IF EXISTS `ACT_GE_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_GE_PROPERTY` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_GE_PROPERTY`
--

LOCK TABLES `ACT_GE_PROPERTY` WRITE;
/*!40000 ALTER TABLE `ACT_GE_PROPERTY` DISABLE KEYS */;
INSERT INTO `ACT_GE_PROPERTY` VALUES ('batch.schema.version','7.0.0.0',1),('cfg.execution-related-entities-count','true',1),('cfg.task-related-entities-count','true',1),('common.schema.version','7.0.0.0',1),('entitylink.schema.version','7.0.0.0',1),('eventsubscription.schema.version','7.0.0.0',1),('identitylink.schema.version','7.0.0.0',1),('job.schema.version','7.0.0.0',1),('next.dbid','1',1),('schema.history','create(7.0.0.0)',1),('schema.version','7.0.0.0',1),('task.schema.version','7.0.0.0',1),('variable.schema.version','7.0.0.0',1);
/*!40000 ALTER TABLE `ACT_GE_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_ACTINST`
--

DROP TABLE IF EXISTS `ACT_HI_ACTINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_HI_ACTINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `TRANSACTION_ORDER_` int(11) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_ACTINST`
--

LOCK TABLES `ACT_HI_ACTINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_ACTINST` DISABLE KEYS */;
INSERT INTO `ACT_HI_ACTINST` VALUES ('0d27f34b-e494-11f0-a343-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','e03887cd-e490-11f0-a343-4e8273da71dd','e039722f-e490-11f0-a343-4e8273da71dd','_flow_bossTask__systemAuditTask',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-29 16:54:57.550','2025-12-29 16:54:57.550',1,0,NULL,''),('0d281a5c-e494-11f0-a343-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','e03887cd-e490-11f0-a343-4e8273da71dd','e039722f-e490-11f0-a343-4e8273da71dd','systemAuditTask',NULL,NULL,'自动入库','serviceTask',NULL,'2025-12-29 16:54:57.551','2025-12-29 16:54:57.586',2,35,NULL,''),('0d2d718d-e494-11f0-a343-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','e03887cd-e490-11f0-a343-4e8273da71dd','e039722f-e490-11f0-a343-4e8273da71dd','_flow_systemAuditTask__end',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-29 16:54:57.586','2025-12-29 16:54:57.586',3,0,NULL,''),('0d2d989e-e494-11f0-a343-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','e03887cd-e490-11f0-a343-4e8273da71dd','e039722f-e490-11f0-a343-4e8273da71dd','end',NULL,NULL,NULL,'endEvent',NULL,'2025-12-29 16:54:57.587','2025-12-29 16:54:57.589',4,2,NULL,''),('1a39ba63-e55f-11f0-8109-4e8273da71dd',1,'purchase_audit:4:1c3eb744-e54d-11f0-8109-4e8273da71dd','1a377070-e55f-11f0-8109-4e8273da71dd','1a39ba62-e55f-11f0-8109-4e8273da71dd','start',NULL,NULL,NULL,'startEvent',NULL,'2025-12-30 17:08:27.313','2025-12-30 17:08:27.314',1,1,NULL,''),('1a39e174-e55f-11f0-8109-4e8273da71dd',1,'purchase_audit:4:1c3eb744-e54d-11f0-8109-4e8273da71dd','1a377070-e55f-11f0-8109-4e8273da71dd','1a39ba62-e55f-11f0-8109-4e8273da71dd','_flow_start__managerTask',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-30 17:08:27.314','2025-12-30 17:08:27.314',2,0,NULL,''),('1a39e175-e55f-11f0-8109-4e8273da71dd',2,'purchase_audit:4:1c3eb744-e54d-11f0-8109-4e8273da71dd','1a377070-e55f-11f0-8109-4e8273da71dd','1a39ba62-e55f-11f0-8109-4e8273da71dd','managerTask','1a3a2f96-e55f-11f0-8109-4e8273da71dd',NULL,'部门经理审批','userTask',NULL,'2025-12-30 17:08:27.314','2025-12-30 17:08:51.274',3,23960,NULL,''),('1eff2c3b-df12-11f0-b071-4e8273da71dd',1,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','1efe1ac8-df12-11f0-b071-4e8273da71dd','1eff2c3a-df12-11f0-b071-4e8273da71dd','start',NULL,NULL,NULL,'startEvent',NULL,'2025-12-22 16:42:17.093','2025-12-22 16:42:17.093',1,0,NULL,''),('1eff2c3c-df12-11f0-b071-4e8273da71dd',1,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','1efe1ac8-df12-11f0-b071-4e8273da71dd','1eff2c3a-df12-11f0-b071-4e8273da71dd','_flow_start__managerTask',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-22 16:42:17.093','2025-12-22 16:42:17.093',2,0,NULL,''),('1eff2c3d-df12-11f0-b071-4e8273da71dd',2,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','1efe1ac8-df12-11f0-b071-4e8273da71dd','1eff2c3a-df12-11f0-b071-4e8273da71dd','managerTask','1eff534e-df12-11f0-b071-4e8273da71dd',NULL,'部门经理审批','userTask',NULL,'2025-12-22 16:42:17.093','2025-12-24 08:34:56.799',3,143559706,NULL,''),('276ed4f6-e54e-11f0-8109-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','76eefea1-e54a-11f0-b3ba-4e8273da71dd','76f985f3-e54a-11f0-b3ba-4e8273da71dd','_flow_managerTask__judgeGateway',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-30 15:07:08.027','2025-12-30 15:07:08.027',1,0,NULL,''),('276efc07-e54e-11f0-8109-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','76eefea1-e54a-11f0-b3ba-4e8273da71dd','76f985f3-e54a-11f0-b3ba-4e8273da71dd','judgeGateway',NULL,NULL,NULL,'exclusiveGateway',NULL,'2025-12-30 15:07:08.028','2025-12-30 15:07:08.055',2,27,NULL,''),('27731ab8-e54e-11f0-8109-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','76eefea1-e54a-11f0-b3ba-4e8273da71dd','76f985f3-e54a-11f0-b3ba-4e8273da71dd','_flow_judgeGateway__bossTask',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-30 15:07:08.055','2025-12-30 15:07:08.055',3,0,NULL,''),('277368d9-e54e-11f0-8109-4e8273da71dd',2,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','76eefea1-e54a-11f0-b3ba-4e8273da71dd','76f985f3-e54a-11f0-b3ba-4e8273da71dd','bossTask','2773b6fa-e54e-11f0-8109-4e8273da71dd',NULL,'总经理审批','userTask',NULL,'2025-12-30 15:07:08.057','2025-12-30 15:07:34.605',4,26548,NULL,''),('28825828-e55f-11f0-8109-4e8273da71dd',1,'purchase_audit:4:1c3eb744-e54d-11f0-8109-4e8273da71dd','1a377070-e55f-11f0-8109-4e8273da71dd','1a39ba62-e55f-11f0-8109-4e8273da71dd','_flow_managerTask__judgeGateway',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-30 17:08:51.277','2025-12-30 17:08:51.277',1,0,NULL,''),('28825829-e55f-11f0-8109-4e8273da71dd',1,'purchase_audit:4:1c3eb744-e54d-11f0-8109-4e8273da71dd','1a377070-e55f-11f0-8109-4e8273da71dd','1a39ba62-e55f-11f0-8109-4e8273da71dd','judgeGateway',NULL,NULL,NULL,'exclusiveGateway',NULL,'2025-12-30 17:08:51.277','2025-12-30 17:08:51.285',2,8,NULL,''),('2883b7ba-e55f-11f0-8109-4e8273da71dd',1,'purchase_audit:4:1c3eb744-e54d-11f0-8109-4e8273da71dd','1a377070-e55f-11f0-8109-4e8273da71dd','1a39ba62-e55f-11f0-8109-4e8273da71dd','_flow_judgeGateway__bossTask',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-30 17:08:51.286','2025-12-30 17:08:51.286',3,0,NULL,''),('2883b7bb-e55f-11f0-8109-4e8273da71dd',2,'purchase_audit:4:1c3eb744-e54d-11f0-8109-4e8273da71dd','1a377070-e55f-11f0-8109-4e8273da71dd','1a39ba62-e55f-11f0-8109-4e8273da71dd','bossTask','2883b7bc-e55f-11f0-8109-4e8273da71dd',NULL,'总经理审批','userTask',NULL,'2025-12-30 17:08:51.286','2025-12-30 17:09:26.561',4,35275,NULL,''),('37469e3c-e54e-11f0-8109-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','76eefea1-e54a-11f0-b3ba-4e8273da71dd','76f985f3-e54a-11f0-b3ba-4e8273da71dd','_flow_bossTask__systemAuditTask',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-30 15:07:34.607','2025-12-30 15:07:34.607',1,0,NULL,''),('37469e3d-e54e-11f0-8109-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','76eefea1-e54a-11f0-b3ba-4e8273da71dd','76f985f3-e54a-11f0-b3ba-4e8273da71dd','systemAuditTask',NULL,NULL,'自动入库','serviceTask',NULL,'2025-12-30 15:07:34.607','2025-12-30 15:07:34.657',2,50,NULL,''),('374e3f5e-e54e-11f0-8109-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','76eefea1-e54a-11f0-b3ba-4e8273da71dd','76f985f3-e54a-11f0-b3ba-4e8273da71dd','_flow_systemAuditTask__end',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-30 15:07:34.657','2025-12-30 15:07:34.657',3,0,NULL,''),('374e666f-e54e-11f0-8109-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','76eefea1-e54a-11f0-b3ba-4e8273da71dd','76f985f3-e54a-11f0-b3ba-4e8273da71dd','end',NULL,NULL,NULL,'endEvent',NULL,'2025-12-30 15:07:34.658','2025-12-30 15:07:34.659',4,1,NULL,''),('3d8a416e-e55f-11f0-8109-4e8273da71dd',1,'purchase_audit:4:1c3eb744-e54d-11f0-8109-4e8273da71dd','1a377070-e55f-11f0-8109-4e8273da71dd','1a39ba62-e55f-11f0-8109-4e8273da71dd','_flow_bossTask__systemAuditTask',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-30 17:09:26.561','2025-12-30 17:09:26.561',1,0,NULL,''),('3d8a687f-e55f-11f0-8109-4e8273da71dd',1,'purchase_audit:4:1c3eb744-e54d-11f0-8109-4e8273da71dd','1a377070-e55f-11f0-8109-4e8273da71dd','1a39ba62-e55f-11f0-8109-4e8273da71dd','systemAuditTask',NULL,NULL,'自动入库','serviceTask',NULL,'2025-12-30 17:09:26.562','2025-12-30 17:09:26.576',2,14,NULL,''),('3d8c8b60-e55f-11f0-8109-4e8273da71dd',1,'purchase_audit:4:1c3eb744-e54d-11f0-8109-4e8273da71dd','1a377070-e55f-11f0-8109-4e8273da71dd','1a39ba62-e55f-11f0-8109-4e8273da71dd','_flow_systemAuditTask__end',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-30 17:09:26.576','2025-12-30 17:09:26.576',3,0,NULL,''),('3d8c8b61-e55f-11f0-8109-4e8273da71dd',1,'purchase_audit:4:1c3eb744-e54d-11f0-8109-4e8273da71dd','1a377070-e55f-11f0-8109-4e8273da71dd','1a39ba62-e55f-11f0-8109-4e8273da71dd','end',NULL,NULL,NULL,'endEvent',NULL,'2025-12-30 17:09:26.576','2025-12-30 17:09:26.576',4,0,NULL,''),('4fb7fbf3-e613-11f0-853d-4e8273da71dd',1,'sales_audit:1:1c3f5385-e54d-11f0-8109-4e8273da71dd','b15f4552-e55f-11f0-8109-4e8273da71dd','b15f4554-e55f-11f0-8109-4e8273da71dd','_flow_bossTask__systemOutTask',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-31 14:38:26.471','2025-12-31 14:38:26.471',1,0,NULL,''),('4fb87124-e613-11f0-853d-4e8273da71dd',1,'sales_audit:1:1c3f5385-e54d-11f0-8109-4e8273da71dd','b15f4552-e55f-11f0-8109-4e8273da71dd','b15f4554-e55f-11f0-8109-4e8273da71dd','systemOutTask',NULL,NULL,'自动扣减库存','serviceTask',NULL,'2025-12-31 14:38:26.474','2025-12-31 14:38:26.642',2,168,NULL,''),('4fd213a5-e613-11f0-853d-4e8273da71dd',1,'sales_audit:1:1c3f5385-e54d-11f0-8109-4e8273da71dd','b15f4552-e55f-11f0-8109-4e8273da71dd','b15f4554-e55f-11f0-8109-4e8273da71dd','_flow_systemOutTask__end',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-31 14:38:26.642','2025-12-31 14:38:26.642',3,0,NULL,''),('4fd2afe6-e613-11f0-853d-4e8273da71dd',1,'sales_audit:1:1c3f5385-e54d-11f0-8109-4e8273da71dd','b15f4552-e55f-11f0-8109-4e8273da71dd','b15f4554-e55f-11f0-8109-4e8273da71dd','end',NULL,NULL,NULL,'endEvent',NULL,'2025-12-31 14:38:26.646','2025-12-31 14:38:26.648',4,2,NULL,''),('56f9a5be-e485-11f0-b4d5-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','aa5f17e6-e484-11f0-b4d5-4e8273da71dd','aa622528-e484-11f0-b4d5-4e8273da71dd','_flow_managerTask__judgeGateway',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-29 15:09:38.947','2025-12-29 15:09:38.947',1,0,NULL,''),('56f9f3df-e485-11f0-b4d5-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','aa5f17e6-e484-11f0-b4d5-4e8273da71dd','aa622528-e484-11f0-b4d5-4e8273da71dd','judgeGateway',NULL,NULL,NULL,'exclusiveGateway',NULL,'2025-12-29 15:09:38.949','2025-12-29 15:09:38.968',2,19,NULL,''),('56fcda10-e485-11f0-b4d5-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','aa5f17e6-e484-11f0-b4d5-4e8273da71dd','aa622528-e484-11f0-b4d5-4e8273da71dd','_flow_judgeGateway__bossTask',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-29 15:09:38.968','2025-12-29 15:09:38.968',3,0,NULL,''),('56fd0121-e485-11f0-b4d5-4e8273da71dd',2,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','aa5f17e6-e484-11f0-b4d5-4e8273da71dd','aa622528-e484-11f0-b4d5-4e8273da71dd','bossTask','56fd0122-e485-11f0-b4d5-4e8273da71dd',NULL,'总经理审批','userTask',NULL,'2025-12-29 15:09:38.969','2025-12-29 15:10:01.434',4,22465,NULL,''),('5bd2b25e-e612-11f0-ba98-4e8273da71dd',1,'sales_audit:1:1c3f5385-e54d-11f0-8109-4e8273da71dd','b15f4552-e55f-11f0-8109-4e8273da71dd','b15f4554-e55f-11f0-8109-4e8273da71dd','_flow_salesMgrTask__amountGateway',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-31 14:31:37.282','2025-12-31 14:31:37.282',1,0,NULL,''),('5bd2d96f-e612-11f0-ba98-4e8273da71dd',1,'sales_audit:1:1c3f5385-e54d-11f0-8109-4e8273da71dd','b15f4552-e55f-11f0-8109-4e8273da71dd','b15f4554-e55f-11f0-8109-4e8273da71dd','amountGateway',NULL,NULL,NULL,'exclusiveGateway',NULL,'2025-12-31 14:31:37.283','2025-12-31 14:31:37.324',2,41,NULL,''),('5bd91b00-e612-11f0-ba98-4e8273da71dd',1,'sales_audit:1:1c3f5385-e54d-11f0-8109-4e8273da71dd','b15f4552-e55f-11f0-8109-4e8273da71dd','b15f4554-e55f-11f0-8109-4e8273da71dd','_flow_amountGateway__bossTask',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-31 14:31:37.324','2025-12-31 14:31:37.324',3,0,NULL,''),('5bd94211-e612-11f0-ba98-4e8273da71dd',2,'sales_audit:1:1c3f5385-e54d-11f0-8109-4e8273da71dd','b15f4552-e55f-11f0-8109-4e8273da71dd','b15f4554-e55f-11f0-8109-4e8273da71dd','bossTask','5bd99032-e612-11f0-ba98-4e8273da71dd',NULL,'总经理复审','userTask',NULL,'2025-12-31 14:31:37.325','2025-12-31 14:38:26.461',4,409136,NULL,''),('5f414370-e060-11f0-b071-4e8273da71dd',1,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','1efe1ac8-df12-11f0-b071-4e8273da71dd','1eff2c3a-df12-11f0-b071-4e8273da71dd','_flow_managerTask__judgeGateway',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-24 08:34:56.808','2025-12-24 08:34:56.808',1,0,NULL,''),('5f419191-e060-11f0-b071-4e8273da71dd',1,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','1efe1ac8-df12-11f0-b071-4e8273da71dd','1eff2c3a-df12-11f0-b071-4e8273da71dd','judgeGateway',NULL,NULL,NULL,'exclusiveGateway',NULL,'2025-12-24 08:34:56.810','2025-12-24 08:34:56.829',2,19,NULL,''),('5f4477c2-e060-11f0-b071-4e8273da71dd',1,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','1efe1ac8-df12-11f0-b071-4e8273da71dd','1eff2c3a-df12-11f0-b071-4e8273da71dd','_flow_judgeGateway__bossTask',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-24 08:34:56.829','2025-12-24 08:34:56.829',3,0,NULL,''),('5f449ed3-e060-11f0-b071-4e8273da71dd',2,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','1efe1ac8-df12-11f0-b071-4e8273da71dd','1eff2c3a-df12-11f0-b071-4e8273da71dd','bossTask','5f453b14-e060-11f0-b071-4e8273da71dd',NULL,'总经理审批','userTask',NULL,'2025-12-24 08:34:56.830','2025-12-24 08:35:43.860',4,47030,NULL,''),('64610b44-e485-11f0-b4d5-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','aa5f17e6-e484-11f0-b4d5-4e8273da71dd','aa622528-e484-11f0-b4d5-4e8273da71dd','_flow_bossTask__systemAuditTask',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-29 15:10:01.435','2025-12-29 15:10:01.435',1,0,NULL,''),('64613255-e485-11f0-b4d5-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','aa5f17e6-e484-11f0-b4d5-4e8273da71dd','aa622528-e484-11f0-b4d5-4e8273da71dd','systemAuditTask',NULL,NULL,'自动入库','serviceTask',NULL,'2025-12-29 15:10:01.436','2025-12-29 15:10:01.471',2,35,NULL,''),('6466b096-e485-11f0-b4d5-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','aa5f17e6-e484-11f0-b4d5-4e8273da71dd','aa622528-e484-11f0-b4d5-4e8273da71dd','_flow_systemAuditTask__end',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-29 15:10:01.472','2025-12-29 15:10:01.472',3,0,NULL,''),('6466d7a7-e485-11f0-b4d5-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','aa5f17e6-e484-11f0-b4d5-4e8273da71dd','aa622528-e484-11f0-b4d5-4e8273da71dd','end',NULL,NULL,NULL,'endEvent',NULL,'2025-12-29 15:10:01.473','2025-12-29 15:10:01.474',4,1,NULL,''),('76fa2234-e54a-11f0-b3ba-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','76eefea1-e54a-11f0-b3ba-4e8273da71dd','76f985f3-e54a-11f0-b3ba-4e8273da71dd','start',NULL,NULL,NULL,'startEvent',NULL,'2025-12-30 14:40:43.494','2025-12-30 14:40:43.502',1,8,NULL,''),('76fc1e05-e54a-11f0-b3ba-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','76eefea1-e54a-11f0-b3ba-4e8273da71dd','76f985f3-e54a-11f0-b3ba-4e8273da71dd','_flow_start__managerTask',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-30 14:40:43.506','2025-12-30 14:40:43.506',2,0,NULL,''),('76fc1e06-e54a-11f0-b3ba-4e8273da71dd',2,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','76eefea1-e54a-11f0-b3ba-4e8273da71dd','76f985f3-e54a-11f0-b3ba-4e8273da71dd','managerTask','770015a7-e54a-11f0-b3ba-4e8273da71dd',NULL,'部门经理审批','userTask',NULL,'2025-12-30 14:40:43.506','2025-12-30 15:07:08.019',3,1584513,NULL,''),('7b4cfb46-e060-11f0-b071-4e8273da71dd',1,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','1efe1ac8-df12-11f0-b071-4e8273da71dd','1eff2c3a-df12-11f0-b071-4e8273da71dd','_flow_bossTask__systemAuditTask',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-24 08:35:43.862','2025-12-24 08:35:43.862',1,0,NULL,''),('7b4d4967-e060-11f0-b071-4e8273da71dd',1,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','1efe1ac8-df12-11f0-b071-4e8273da71dd','1eff2c3a-df12-11f0-b071-4e8273da71dd','systemAuditTask',NULL,NULL,'自动入库','serviceTask',NULL,'2025-12-24 08:35:43.863','2025-12-24 08:35:43.901',2,38,NULL,''),('7b5315c8-e060-11f0-b071-4e8273da71dd',1,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','1efe1ac8-df12-11f0-b071-4e8273da71dd','1eff2c3a-df12-11f0-b071-4e8273da71dd','_flow_systemAuditTask__end',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-24 08:35:43.901','2025-12-24 08:35:43.901',3,0,NULL,''),('7b533cd9-e060-11f0-b071-4e8273da71dd',1,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','1efe1ac8-df12-11f0-b071-4e8273da71dd','1eff2c3a-df12-11f0-b071-4e8273da71dd','end',NULL,NULL,NULL,'endEvent',NULL,'2025-12-24 08:35:43.902','2025-12-24 08:35:43.902',4,0,NULL,''),('aa624c39-e484-11f0-b4d5-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','aa5f17e6-e484-11f0-b4d5-4e8273da71dd','aa622528-e484-11f0-b4d5-4e8273da71dd','start',NULL,NULL,NULL,'startEvent',NULL,'2025-12-29 15:04:49.387','2025-12-29 15:04:49.395',1,8,NULL,''),('aa63f9ea-e484-11f0-b4d5-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','aa5f17e6-e484-11f0-b4d5-4e8273da71dd','aa622528-e484-11f0-b4d5-4e8273da71dd','_flow_start__managerTask',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-29 15:04:49.398','2025-12-29 15:04:49.398',2,0,NULL,''),('aa63f9eb-e484-11f0-b4d5-4e8273da71dd',2,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','aa5f17e6-e484-11f0-b4d5-4e8273da71dd','aa622528-e484-11f0-b4d5-4e8273da71dd','managerTask','aa65f5bc-e484-11f0-b4d5-4e8273da71dd',NULL,'部门经理审批','userTask',NULL,'2025-12-29 15:04:49.398','2025-12-29 15:09:38.944',3,289546,NULL,''),('b15f4555-e55f-11f0-8109-4e8273da71dd',1,'sales_audit:1:1c3f5385-e54d-11f0-8109-4e8273da71dd','b15f4552-e55f-11f0-8109-4e8273da71dd','b15f4554-e55f-11f0-8109-4e8273da71dd','start',NULL,NULL,NULL,'startEvent',NULL,'2025-12-30 17:12:40.895','2025-12-30 17:12:40.895',1,0,NULL,''),('b15f4556-e55f-11f0-8109-4e8273da71dd',1,'sales_audit:1:1c3f5385-e54d-11f0-8109-4e8273da71dd','b15f4552-e55f-11f0-8109-4e8273da71dd','b15f4554-e55f-11f0-8109-4e8273da71dd','_flow_start__salesMgrTask',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-30 17:12:40.895','2025-12-30 17:12:40.895',2,0,NULL,''),('b15f4557-e55f-11f0-8109-4e8273da71dd',2,'sales_audit:1:1c3f5385-e54d-11f0-8109-4e8273da71dd','b15f4552-e55f-11f0-8109-4e8273da71dd','b15f4554-e55f-11f0-8109-4e8273da71dd','salesMgrTask','b15f4558-e55f-11f0-8109-4e8273da71dd',NULL,'销售经理审批','userTask',NULL,'2025-12-30 17:12:40.895','2025-12-31 14:31:37.263',3,76736368,NULL,''),('b1bb34c1-df0d-11f0-8d83-4e8273da71dd',1,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','b1b9d52e-df0d-11f0-8d83-4e8273da71dd','b1bb0db0-df0d-11f0-8d83-4e8273da71dd','start',NULL,NULL,NULL,'startEvent',NULL,'2025-12-22 16:10:35.789','2025-12-22 16:10:35.793',1,4,NULL,''),('b1bc4632-df0d-11f0-8d83-4e8273da71dd',1,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','b1b9d52e-df0d-11f0-8d83-4e8273da71dd','b1bb0db0-df0d-11f0-8d83-4e8273da71dd','_flow_start__managerTask',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-22 16:10:35.796','2025-12-22 16:10:35.796',2,0,NULL,''),('b1bc4633-df0d-11f0-8d83-4e8273da71dd',2,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','b1b9d52e-df0d-11f0-8d83-4e8273da71dd','b1bb0db0-df0d-11f0-8d83-4e8273da71dd','managerTask','b1bd57a4-df0d-11f0-8d83-4e8273da71dd',NULL,'部门经理审批','userTask',NULL,'2025-12-22 16:10:35.796','2025-12-22 16:39:59.936',3,1764140,NULL,''),('cd3f7032-df11-11f0-b071-4e8273da71dd',1,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','b1b9d52e-df0d-11f0-8d83-4e8273da71dd','b1bb0db0-df0d-11f0-8d83-4e8273da71dd','_flow_managerTask__judgeGateway',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-22 16:39:59.941','2025-12-22 16:39:59.941',1,0,NULL,''),('cd3fbe53-df11-11f0-b071-4e8273da71dd',1,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','b1b9d52e-df0d-11f0-8d83-4e8273da71dd','b1bb0db0-df0d-11f0-8d83-4e8273da71dd','judgeGateway',NULL,NULL,NULL,'exclusiveGateway',NULL,'2025-12-22 16:39:59.943','2025-12-22 16:39:59.967',2,24,NULL,''),('cd4367d4-df11-11f0-b071-4e8273da71dd',1,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','b1b9d52e-df0d-11f0-8d83-4e8273da71dd','b1bb0db0-df0d-11f0-8d83-4e8273da71dd','_flow_judgeGateway__systemAuditTask',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-22 16:39:59.967','2025-12-22 16:39:59.967',3,0,NULL,''),('cd438ee5-df11-11f0-b071-4e8273da71dd',1,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','b1b9d52e-df0d-11f0-8d83-4e8273da71dd','b1bb0db0-df0d-11f0-8d83-4e8273da71dd','systemAuditTask',NULL,NULL,'自动入库','serviceTask',NULL,'2025-12-22 16:39:59.968','2025-12-22 16:40:00.046',4,78,NULL,''),('cd4f75c6-df11-11f0-b071-4e8273da71dd',1,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','b1b9d52e-df0d-11f0-8d83-4e8273da71dd','b1bb0db0-df0d-11f0-8d83-4e8273da71dd','_flow_systemAuditTask__end',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-22 16:40:00.046','2025-12-22 16:40:00.046',5,0,NULL,''),('cd4f9cd7-df11-11f0-b071-4e8273da71dd',1,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','b1b9d52e-df0d-11f0-8d83-4e8273da71dd','b1bb0db0-df0d-11f0-8d83-4e8273da71dd','end',NULL,NULL,NULL,'endEvent',NULL,'2025-12-22 16:40:00.047','2025-12-22 16:40:00.048',6,1,NULL,''),('e0397230-e490-11f0-a343-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','e03887cd-e490-11f0-a343-4e8273da71dd','e039722f-e490-11f0-a343-4e8273da71dd','start',NULL,NULL,NULL,'startEvent',NULL,'2025-12-29 16:32:13.677','2025-12-29 16:32:13.682',1,5,NULL,''),('e03a83a1-e490-11f0-a343-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','e03887cd-e490-11f0-a343-4e8273da71dd','e039722f-e490-11f0-a343-4e8273da71dd','_flow_start__managerTask',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-29 16:32:13.684','2025-12-29 16:32:13.684',2,0,NULL,''),('e03a83a2-e490-11f0-a343-4e8273da71dd',2,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','e03887cd-e490-11f0-a343-4e8273da71dd','e039722f-e490-11f0-a343-4e8273da71dd','managerTask','e03bbc23-e490-11f0-a343-4e8273da71dd',NULL,'部门经理审批','userTask',NULL,'2025-12-29 16:32:13.684','2025-12-29 16:54:31.637',3,1337953,NULL,''),('fdb63ed5-e493-11f0-a343-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','e03887cd-e490-11f0-a343-4e8273da71dd','e039722f-e490-11f0-a343-4e8273da71dd','_flow_managerTask__judgeGateway',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-29 16:54:31.639','2025-12-29 16:54:31.639',1,0,NULL,''),('fdb68cf6-e493-11f0-a343-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','e03887cd-e490-11f0-a343-4e8273da71dd','e039722f-e490-11f0-a343-4e8273da71dd','judgeGateway',NULL,NULL,NULL,'exclusiveGateway',NULL,'2025-12-29 16:54:31.641','2025-12-29 16:54:31.660',2,19,NULL,''),('fdb97327-e493-11f0-a343-4e8273da71dd',1,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','e03887cd-e490-11f0-a343-4e8273da71dd','e039722f-e490-11f0-a343-4e8273da71dd','_flow_judgeGateway__bossTask',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-12-29 16:54:31.660','2025-12-29 16:54:31.660',3,0,NULL,''),('fdb99a38-e493-11f0-a343-4e8273da71dd',2,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','e03887cd-e490-11f0-a343-4e8273da71dd','e039722f-e490-11f0-a343-4e8273da71dd','bossTask','fdb99a39-e493-11f0-a343-4e8273da71dd',NULL,'总经理审批','userTask',NULL,'2025-12-29 16:54:31.661','2025-12-29 16:54:57.549',4,25888,NULL,'');
/*!40000 ALTER TABLE `ACT_HI_ACTINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_ATTACHMENT`
--

DROP TABLE IF EXISTS `ACT_HI_ATTACHMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_HI_ATTACHMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_ATTACHMENT`
--

LOCK TABLES `ACT_HI_ATTACHMENT` WRITE;
/*!40000 ALTER TABLE `ACT_HI_ATTACHMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_ATTACHMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_COMMENT`
--

DROP TABLE IF EXISTS `ACT_HI_COMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_HI_COMMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_COMMENT`
--

LOCK TABLES `ACT_HI_COMMENT` WRITE;
/*!40000 ALTER TABLE `ACT_HI_COMMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_COMMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_DETAIL`
--

DROP TABLE IF EXISTS `ACT_HI_DETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_HI_DETAIL` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_DETAIL`
--

LOCK TABLES `ACT_HI_DETAIL` WRITE;
/*!40000 ALTER TABLE `ACT_HI_DETAIL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_DETAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_ENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_HI_ENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_HI_ENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_REF_SCOPE` (`REF_SCOPE_ID_`,`REF_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_ROOT_SCOPE` (`ROOT_SCOPE_ID_`,`ROOT_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_ENTITYLINK`
--

LOCK TABLES `ACT_HI_ENTITYLINK` WRITE;
/*!40000 ALTER TABLE `ACT_HI_ENTITYLINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_ENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_IDENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_HI_IDENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_HI_IDENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_IDENTITYLINK`
--

LOCK TABLES `ACT_HI_IDENTITYLINK` WRITE;
/*!40000 ALTER TABLE `ACT_HI_IDENTITYLINK` DISABLE KEYS */;
INSERT INTO `ACT_HI_IDENTITYLINK` VALUES ('1a3a56a7-e55f-11f0-8109-4e8273da71dd','purchase_mgr','candidate',NULL,'1a3a2f96-e55f-11f0-8109-4e8273da71dd','2025-12-30 17:08:27.317',NULL,NULL,NULL,NULL,NULL),('1effa16f-df12-11f0-b071-4e8273da71dd','purchase_mgr','candidate',NULL,'1eff534e-df12-11f0-b071-4e8273da71dd','2025-12-22 16:42:17.097',NULL,NULL,NULL,NULL,NULL),('2773b6fb-e54e-11f0-8109-4e8273da71dd','admin','candidate',NULL,'2773b6fa-e54e-11f0-8109-4e8273da71dd','2025-12-30 15:07:08.061',NULL,NULL,NULL,NULL,NULL),('2883decd-e55f-11f0-8109-4e8273da71dd','admin','candidate',NULL,'2883b7bc-e55f-11f0-8109-4e8273da71dd','2025-12-30 17:08:51.287',NULL,NULL,NULL,NULL,NULL),('56fd0123-e485-11f0-b4d5-4e8273da71dd','admin','candidate',NULL,'56fd0122-e485-11f0-b4d5-4e8273da71dd','2025-12-29 15:09:38.969',NULL,NULL,NULL,NULL,NULL),('5bd9b743-e612-11f0-ba98-4e8273da71dd','admin','candidate',NULL,'5bd99032-e612-11f0-ba98-4e8273da71dd','2025-12-31 14:31:37.330',NULL,NULL,NULL,NULL,NULL),('5f453b15-e060-11f0-b071-4e8273da71dd','admin','candidate',NULL,'5f453b14-e060-11f0-b071-4e8273da71dd','2025-12-24 08:34:56.835',NULL,NULL,NULL,NULL,NULL),('77014e28-e54a-11f0-b3ba-4e8273da71dd','purchase_mgr','candidate',NULL,'770015a7-e54a-11f0-b3ba-4e8273da71dd','2025-12-30 14:40:43.544',NULL,NULL,NULL,NULL,NULL),('aa666aed-e484-11f0-b4d5-4e8273da71dd','purchase_mgr','candidate',NULL,'aa65f5bc-e484-11f0-b4d5-4e8273da71dd','2025-12-29 15:04:49.415',NULL,NULL,NULL,NULL,NULL),('b15f6c69-e55f-11f0-8109-4e8273da71dd','sales_mgr','candidate',NULL,'b15f4558-e55f-11f0-8109-4e8273da71dd','2025-12-30 17:12:40.896',NULL,NULL,NULL,NULL,NULL),('b1bd7eb5-df0d-11f0-8d83-4e8273da71dd','purchase_mgr','candidate',NULL,'b1bd57a4-df0d-11f0-8d83-4e8273da71dd','2025-12-22 16:10:35.805',NULL,NULL,NULL,NULL,NULL),('e03be334-e490-11f0-a343-4e8273da71dd','purchase_mgr','candidate',NULL,'e03bbc23-e490-11f0-a343-4e8273da71dd','2025-12-29 16:32:13.695',NULL,NULL,NULL,NULL,NULL),('fdb9c14a-e493-11f0-a343-4e8273da71dd','admin','candidate',NULL,'fdb99a39-e493-11f0-a343-4e8273da71dd','2025-12-29 16:54:31.662',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ACT_HI_IDENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_PROCINST`
--

DROP TABLE IF EXISTS `ACT_HI_PROCINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_HI_PROCINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDX_HI_PRO_SUPER_PROCINST` (`SUPER_PROCESS_INSTANCE_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_PROCINST`
--

LOCK TABLES `ACT_HI_PROCINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_PROCINST` DISABLE KEYS */;
INSERT INTO `ACT_HI_PROCINST` VALUES ('1a377070-e55f-11f0-8109-4e8273da71dd',2,'1a377070-e55f-11f0-8109-4e8273da71dd','2005928960779288578','purchase_audit:4:1c3eb744-e54d-11f0-8109-4e8273da71dd','2025-12-30 17:08:27.298','2025-12-30 17:09:26.590',59292,NULL,'start','end',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1efe1ac8-df12-11f0-b071-4e8273da71dd',2,'1efe1ac8-df12-11f0-b071-4e8273da71dd','2003023272008626177','purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','2025-12-22 16:42:17.086','2025-12-24 08:35:43.946',143606860,NULL,'start','end',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('76eefea1-e54a-11f0-b3ba-4e8273da71dd',2,'76eefea1-e54a-11f0-b3ba-4e8273da71dd','2005891778685390850','purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','2025-12-30 14:40:43.419','2025-12-30 15:07:34.684',1611265,NULL,'start','end',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('aa5f17e6-e484-11f0-b4d5-4e8273da71dd',2,'aa5f17e6-e484-11f0-b4d5-4e8273da71dd','2005535459134603266','purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','2025-12-29 15:04:49.365','2025-12-29 15:10:01.539',312174,NULL,'start','end',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('b15f4552-e55f-11f0-8109-4e8273da71dd',2,'b15f4552-e55f-11f0-8109-4e8273da71dd','2005930024379285506','sales_audit:1:1c3f5385-e54d-11f0-8109-4e8273da71dd','2025-12-30 17:12:40.895','2025-12-31 14:38:26.709',77145814,NULL,'start','end',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('b1b9d52e-df0d-11f0-8d83-4e8273da71dd',2,'b1b9d52e-df0d-11f0-8d83-4e8273da71dd','2003015296933904385','purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd','2025-12-22 16:10:35.780','2025-12-22 16:40:00.108',1764328,NULL,'start','end',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('e03887cd-e490-11f0-a343-4e8273da71dd',2,'e03887cd-e490-11f0-a343-4e8273da71dd','2005557455415328770','purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd','2025-12-29 16:32:13.671','2025-12-29 16:54:57.612',1363941,NULL,'start','end',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ACT_HI_PROCINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_TASKINST`
--

DROP TABLE IF EXISTS `ACT_HI_TASKINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_HI_TASKINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_TASKINST`
--

LOCK TABLES `ACT_HI_TASKINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_TASKINST` DISABLE KEYS */;
INSERT INTO `ACT_HI_TASKINST` VALUES ('1a3a2f96-e55f-11f0-8109-4e8273da71dd',2,'purchase_audit:4:1c3eb744-e54d-11f0-8109-4e8273da71dd',NULL,'managerTask','1a377070-e55f-11f0-8109-4e8273da71dd','1a39ba62-e55f-11f0-8109-4e8273da71dd',NULL,NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,NULL,'2025-12-30 17:08:27.315',NULL,'2025-12-30 17:08:51.262',23947,NULL,50,NULL,NULL,NULL,'','2025-12-30 17:08:51.262'),('1eff534e-df12-11f0-b071-4e8273da71dd',2,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd',NULL,'managerTask','1efe1ac8-df12-11f0-b071-4e8273da71dd','1eff2c3a-df12-11f0-b071-4e8273da71dd',NULL,NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,NULL,'2025-12-22 16:42:17.093',NULL,'2025-12-24 08:34:56.769',143559676,NULL,50,NULL,NULL,NULL,'','2025-12-24 08:34:56.769'),('2773b6fa-e54e-11f0-8109-4e8273da71dd',2,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd',NULL,'bossTask','76eefea1-e54a-11f0-b3ba-4e8273da71dd','76f985f3-e54a-11f0-b3ba-4e8273da71dd',NULL,NULL,NULL,NULL,NULL,'总经理审批',NULL,NULL,NULL,NULL,'2025-12-30 15:07:08.057',NULL,'2025-12-30 15:07:34.595',26538,NULL,50,NULL,NULL,NULL,'','2025-12-30 15:07:34.595'),('2883b7bc-e55f-11f0-8109-4e8273da71dd',2,'purchase_audit:4:1c3eb744-e54d-11f0-8109-4e8273da71dd',NULL,'bossTask','1a377070-e55f-11f0-8109-4e8273da71dd','1a39ba62-e55f-11f0-8109-4e8273da71dd',NULL,NULL,NULL,NULL,NULL,'总经理审批',NULL,NULL,NULL,NULL,'2025-12-30 17:08:51.286',NULL,'2025-12-30 17:09:26.556',35270,NULL,50,NULL,NULL,NULL,'','2025-12-30 17:09:26.556'),('56fd0122-e485-11f0-b4d5-4e8273da71dd',2,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd',NULL,'bossTask','aa5f17e6-e484-11f0-b4d5-4e8273da71dd','aa622528-e484-11f0-b4d5-4e8273da71dd',NULL,NULL,NULL,NULL,NULL,'总经理审批',NULL,NULL,NULL,NULL,'2025-12-29 15:09:38.969',NULL,'2025-12-29 15:10:01.430',22461,NULL,50,NULL,NULL,NULL,'','2025-12-29 15:10:01.430'),('5bd99032-e612-11f0-ba98-4e8273da71dd',2,'sales_audit:1:1c3f5385-e54d-11f0-8109-4e8273da71dd',NULL,'bossTask','b15f4552-e55f-11f0-8109-4e8273da71dd','b15f4554-e55f-11f0-8109-4e8273da71dd',NULL,NULL,NULL,NULL,NULL,'总经理复审',NULL,NULL,NULL,NULL,'2025-12-31 14:31:37.326',NULL,'2025-12-31 14:38:26.448',409122,NULL,50,NULL,NULL,NULL,'','2025-12-31 14:38:26.448'),('5f453b14-e060-11f0-b071-4e8273da71dd',2,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd',NULL,'bossTask','1efe1ac8-df12-11f0-b071-4e8273da71dd','1eff2c3a-df12-11f0-b071-4e8273da71dd',NULL,NULL,NULL,NULL,NULL,'总经理审批',NULL,NULL,NULL,NULL,'2025-12-24 08:34:56.831',NULL,'2025-12-24 08:35:43.854',47023,NULL,50,NULL,NULL,NULL,'','2025-12-24 08:35:43.854'),('770015a7-e54a-11f0-b3ba-4e8273da71dd',2,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd',NULL,'managerTask','76eefea1-e54a-11f0-b3ba-4e8273da71dd','76f985f3-e54a-11f0-b3ba-4e8273da71dd',NULL,NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,NULL,'2025-12-30 14:40:43.510',NULL,'2025-12-30 15:07:07.999',1584489,NULL,50,NULL,NULL,NULL,'','2025-12-30 15:07:07.999'),('aa65f5bc-e484-11f0-b4d5-4e8273da71dd',2,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd',NULL,'managerTask','aa5f17e6-e484-11f0-b4d5-4e8273da71dd','aa622528-e484-11f0-b4d5-4e8273da71dd',NULL,NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,NULL,'2025-12-29 15:04:49.400',NULL,'2025-12-29 15:09:38.936',289536,NULL,50,NULL,NULL,NULL,'','2025-12-29 15:09:38.936'),('b15f4558-e55f-11f0-8109-4e8273da71dd',2,'sales_audit:1:1c3f5385-e54d-11f0-8109-4e8273da71dd',NULL,'salesMgrTask','b15f4552-e55f-11f0-8109-4e8273da71dd','b15f4554-e55f-11f0-8109-4e8273da71dd',NULL,NULL,NULL,NULL,NULL,'销售经理审批',NULL,NULL,NULL,NULL,'2025-12-30 17:12:40.895',NULL,'2025-12-31 14:31:37.233',76736338,NULL,50,NULL,NULL,NULL,'','2025-12-31 14:31:37.233'),('b1bd57a4-df0d-11f0-8d83-4e8273da71dd',2,'purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd',NULL,'managerTask','b1b9d52e-df0d-11f0-8d83-4e8273da71dd','b1bb0db0-df0d-11f0-8d83-4e8273da71dd',NULL,NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,NULL,'2025-12-22 16:10:35.796',NULL,'2025-12-22 16:39:59.923',1764127,NULL,50,NULL,NULL,NULL,'','2025-12-22 16:39:59.923'),('e03bbc23-e490-11f0-a343-4e8273da71dd',2,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd',NULL,'managerTask','e03887cd-e490-11f0-a343-4e8273da71dd','e039722f-e490-11f0-a343-4e8273da71dd',NULL,NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,NULL,'2025-12-29 16:32:13.685',NULL,'2025-12-29 16:54:31.629',1337944,NULL,50,NULL,NULL,NULL,'','2025-12-29 16:54:31.629'),('fdb99a39-e493-11f0-a343-4e8273da71dd',2,'purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd',NULL,'bossTask','e03887cd-e490-11f0-a343-4e8273da71dd','e039722f-e490-11f0-a343-4e8273da71dd',NULL,NULL,NULL,NULL,NULL,'总经理审批',NULL,NULL,NULL,NULL,'2025-12-29 16:54:31.661',NULL,'2025-12-29 16:54:57.544',25883,NULL,50,NULL,NULL,NULL,'','2025-12-29 16:54:57.544');
/*!40000 ALTER TABLE `ACT_HI_TASKINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_TSK_LOG`
--

DROP TABLE IF EXISTS `ACT_HI_TSK_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_HI_TSK_LOG` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_TSK_LOG`
--

LOCK TABLES `ACT_HI_TSK_LOG` WRITE;
/*!40000 ALTER TABLE `ACT_HI_TSK_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_TSK_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_VARINST`
--

DROP TABLE IF EXISTS `ACT_HI_VARINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_HI_VARINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_EXE` (`EXECUTION_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_VARINST`
--

LOCK TABLES `ACT_HI_VARINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_VARINST` DISABLE KEYS */;
INSERT INTO `ACT_HI_VARINST` VALUES ('1a396c41-e55f-11f0-8109-4e8273da71dd',0,'1a377070-e55f-11f0-8109-4e8273da71dd','1a377070-e55f-11f0-8109-4e8273da71dd',NULL,'money','double',NULL,NULL,NULL,NULL,83200,NULL,NULL,NULL,NULL,'2025-12-30 17:08:27.313','2025-12-30 17:08:27.313'),('1efede19-df12-11f0-b071-4e8273da71dd',0,'1efe1ac8-df12-11f0-b071-4e8273da71dd','1efe1ac8-df12-11f0-b071-4e8273da71dd',NULL,'money','double',NULL,NULL,NULL,NULL,11691,NULL,NULL,NULL,NULL,'2025-12-22 16:42:17.092','2025-12-22 16:42:17.092'),('76f78a22-e54a-11f0-b3ba-4e8273da71dd',0,'76eefea1-e54a-11f0-b3ba-4e8273da71dd','76eefea1-e54a-11f0-b3ba-4e8273da71dd',NULL,'money','double',NULL,NULL,NULL,NULL,105000,NULL,NULL,NULL,NULL,'2025-12-30 14:40:43.486','2025-12-30 14:40:43.486'),('aa6188e7-e484-11f0-b4d5-4e8273da71dd',0,'aa5f17e6-e484-11f0-b4d5-4e8273da71dd','aa5f17e6-e484-11f0-b4d5-4e8273da71dd',NULL,'money','double',NULL,NULL,NULL,NULL,69980,NULL,NULL,NULL,NULL,'2025-12-29 15:04:49.385','2025-12-29 15:04:49.385'),('b15f4553-e55f-11f0-8109-4e8273da71dd',0,'b15f4552-e55f-11f0-8109-4e8273da71dd','b15f4552-e55f-11f0-8109-4e8273da71dd',NULL,'money','double',NULL,NULL,NULL,NULL,108749,NULL,NULL,NULL,NULL,'2025-12-30 17:12:40.895','2025-12-30 17:12:40.895'),('b1bae69f-df0d-11f0-8d83-4e8273da71dd',0,'b1b9d52e-df0d-11f0-8d83-4e8273da71dd','b1b9d52e-df0d-11f0-8d83-4e8273da71dd',NULL,'money','double',NULL,NULL,NULL,NULL,1299,NULL,NULL,NULL,NULL,'2025-12-22 16:10:35.788','2025-12-22 16:10:35.788'),('e0394b1e-e490-11f0-a343-4e8273da71dd',0,'e03887cd-e490-11f0-a343-4e8273da71dd','e03887cd-e490-11f0-a343-4e8273da71dd',NULL,'money','double',NULL,NULL,NULL,NULL,69980,NULL,NULL,NULL,NULL,'2025-12-29 16:32:13.677','2025-12-29 16:32:13.677');
/*!40000 ALTER TABLE `ACT_HI_VARINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_PROCDEF_INFO`
--

DROP TABLE IF EXISTS `ACT_PROCDEF_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_PROCDEF_INFO` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`id_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_PROCDEF_INFO`
--

LOCK TABLES `ACT_PROCDEF_INFO` WRITE;
/*!40000 ALTER TABLE `ACT_PROCDEF_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_PROCDEF_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_DEPLOYMENT`
--

DROP TABLE IF EXISTS `ACT_RE_DEPLOYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_RE_DEPLOYMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_DEPLOYMENT`
--

LOCK TABLES `ACT_RE_DEPLOYMENT` WRITE;
/*!40000 ALTER TABLE `ACT_RE_DEPLOYMENT` DISABLE KEYS */;
INSERT INTO `ACT_RE_DEPLOYMENT` VALUES ('1c220781-e54d-11f0-8109-4e8273da71dd','SpringBootAutoDeployment',NULL,NULL,'','2025-12-30 06:59:39.558',NULL,NULL,'1c220781-e54d-11f0-8109-4e8273da71dd',NULL),('6e9759fb-e163-11f0-b976-4e8273da71dd','SpringBootAutoDeployment',NULL,NULL,'','2025-12-25 07:29:22.175',NULL,NULL,'6e9759fb-e163-11f0-b976-4e8273da71dd',NULL),('8ca779c7-dee8-11f0-9efa-4e8273da71dd','SpringBootAutoDeployment',NULL,NULL,'','2025-12-22 03:44:42.203',NULL,NULL,'8ca779c7-dee8-11f0-9efa-4e8273da71dd',NULL),('cfadc3a5-df04-11f0-9127-4e8273da71dd','SpringBootAutoDeployment',NULL,NULL,'','2025-12-22 07:07:00.551',NULL,NULL,'cfadc3a5-df04-11f0-9127-4e8273da71dd',NULL);
/*!40000 ALTER TABLE `ACT_RE_DEPLOYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_MODEL`
--

DROP TABLE IF EXISTS `ACT_RE_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_RE_MODEL` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`id_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`id_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_MODEL`
--

LOCK TABLES `ACT_RE_MODEL` WRITE;
/*!40000 ALTER TABLE `ACT_RE_MODEL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RE_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_PROCDEF`
--

DROP TABLE IF EXISTS `ACT_RE_PROCDEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_RE_PROCDEF` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_VERSION_` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`DERIVED_VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_PROCDEF`
--

LOCK TABLES `ACT_RE_PROCDEF` WRITE;
/*!40000 ALTER TABLE `ACT_RE_PROCDEF` DISABLE KEYS */;
INSERT INTO `ACT_RE_PROCDEF` VALUES ('purchase_audit:1:8cc11c49-dee8-11f0-9efa-4e8273da71dd',1,'http://www.flowable.org/processdef','采购单审批流程','purchase_audit',1,'8ca779c7-dee8-11f0-9efa-4e8273da71dd','/Users/echoes/Desktop/bumenxiangmu/kerp/target/classes/processes/purchase_audit.bpmn20.xml',NULL,NULL,0,0,1,'',NULL,NULL,NULL,0),('purchase_audit:2:cfc4ce17-df04-11f0-9127-4e8273da71dd',1,'http://www.flowable.org/processdef','采购单审批流程','purchase_audit',2,'cfadc3a5-df04-11f0-9127-4e8273da71dd','/Users/echoes/Desktop/bumenxiangmu/kerp/target/classes/processes/purchase_audit.bpmn20.xml',NULL,NULL,0,0,1,'',NULL,NULL,NULL,0),('purchase_audit:3:6eb171ad-e163-11f0-b976-4e8273da71dd',1,'http://www.flowable.org/processdef','采购单审批流程','purchase_audit',3,'6e9759fb-e163-11f0-b976-4e8273da71dd','/Users/echoes/Desktop/bumenxiangmu/kerp/target/classes/processes/purchase_audit.bpmn20.xml',NULL,NULL,0,0,1,'',NULL,NULL,NULL,0),('purchase_audit:4:1c3eb744-e54d-11f0-8109-4e8273da71dd',1,'http://www.flowable.org/processdef','采购单审批流程','purchase_audit',4,'1c220781-e54d-11f0-8109-4e8273da71dd','/Users/echoes/Desktop/bumenxiangmu/kerp/target/classes/processes/purchase_audit.bpmn20.xml',NULL,NULL,0,0,1,'',NULL,NULL,NULL,0),('sales_audit:1:1c3f5385-e54d-11f0-8109-4e8273da71dd',1,'http://www.flowable.org/processdef','销售出库审批流程','sales_audit',1,'1c220781-e54d-11f0-8109-4e8273da71dd','/Users/echoes/Desktop/bumenxiangmu/kerp/target/classes/processes/sales_audit.bpmn20.xml',NULL,NULL,0,0,1,'',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `ACT_RE_PROCDEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_ACTINST`
--

DROP TABLE IF EXISTS `ACT_RU_ACTINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_RU_ACTINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TRANSACTION_ORDER_` int(11) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_ACTI_START` (`START_TIME_`),
  KEY `ACT_IDX_RU_ACTI_END` (`END_TIME_`),
  KEY `ACT_IDX_RU_ACTI_PROC` (`PROC_INST_ID_`),
  KEY `ACT_IDX_RU_ACTI_PROC_ACT` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC` (`EXECUTION_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC_ACT` (`EXECUTION_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_RU_ACTI_TASK` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_ACTINST`
--

LOCK TABLES `ACT_RU_ACTINST` WRITE;
/*!40000 ALTER TABLE `ACT_RU_ACTINST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_ACTINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_DEADLETTER_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_DEADLETTER_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_RU_DEADLETTER_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_DJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`id_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`id_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`id_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`id_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_DEADLETTER_JOB`
--

LOCK TABLES `ACT_RU_DEADLETTER_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_DEADLETTER_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_DEADLETTER_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_ENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_RU_ENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_RU_ENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_REF_SCOPE` (`REF_SCOPE_ID_`,`REF_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_ROOT_SCOPE` (`ROOT_SCOPE_ID_`,`ROOT_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_ENTITYLINK`
--

LOCK TABLES `ACT_RU_ENTITYLINK` WRITE;
/*!40000 ALTER TABLE `ACT_RU_ENTITYLINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_ENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_EVENT_SUBSCR`
--

DROP TABLE IF EXISTS `ACT_RU_EVENT_SUBSCR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_RU_EVENT_SUBSCR` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_IDX_EVENT_SUBSCR_SCOPEREF_` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_EVENT_SUBSCR`
--

LOCK TABLES `ACT_RU_EVENT_SUBSCR` WRITE;
/*!40000 ALTER TABLE `ACT_RU_EVENT_SUBSCR` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_EVENT_SUBSCR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_EXECUTION`
--

DROP TABLE IF EXISTS `ACT_RU_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_RU_EXECUTION` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `EXTERNAL_WORKER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_EXEC_REF_ID_` (`REFERENCE_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`id_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`id_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`id_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_EXECUTION`
--

LOCK TABLES `ACT_RU_EXECUTION` WRITE;
/*!40000 ALTER TABLE `ACT_RU_EXECUTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_EXTERNAL_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_EXTERNAL_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_RU_EXTERNAL_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXTERNAL_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_EXTERNAL_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_EXTERNAL_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_EJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_EJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_EJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`id_`),
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_EXTERNAL_JOB`
--

LOCK TABLES `ACT_RU_EXTERNAL_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_EXTERNAL_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_EXTERNAL_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_HISTORY_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_HISTORY_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_RU_HISTORY_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_HISTORY_JOB`
--

LOCK TABLES `ACT_RU_HISTORY_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_HISTORY_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_HISTORY_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_IDENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_RU_IDENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_RU_IDENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`id_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`id_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_IDENTITYLINK`
--

LOCK TABLES `ACT_RU_IDENTITYLINK` WRITE;
/*!40000 ALTER TABLE `ACT_RU_IDENTITYLINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_IDENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_RU_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_JOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`id_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`id_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`id_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`id_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_JOB`
--

LOCK TABLES `ACT_RU_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_SUSPENDED_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_SUSPENDED_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_RU_SUSPENDED_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_SJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`id_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`id_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`id_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`id_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_SUSPENDED_JOB`
--

LOCK TABLES `ACT_RU_SUSPENDED_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_SUSPENDED_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_SUSPENDED_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_TASK`
--

DROP TABLE IF EXISTS `ACT_RU_TASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_RU_TASK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  `SUB_TASK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_IDX_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`id_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`id_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_TASK`
--

LOCK TABLES `ACT_RU_TASK` WRITE;
/*!40000 ALTER TABLE `ACT_RU_TASK` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_TASK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_TIMER_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_TIMER_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_RU_TIMER_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_TIMER_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_TIMER_JOB_DUEDATE` (`DUEDATE_`),
  KEY `ACT_IDX_TJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`id_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`id_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`id_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`id_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_TIMER_JOB`
--

LOCK TABLES `ACT_RU_TIMER_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_TIMER_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_TIMER_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_VARIABLE`
--

DROP TABLE IF EXISTS `ACT_RU_VARIABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ACT_RU_VARIABLE` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_RU_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`id_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`id_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_VARIABLE`
--

LOCK TABLES `ACT_RU_VARIABLE` WRITE;
/*!40000 ALTER TABLE `ACT_RU_VARIABLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_VARIABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_customer`
--

DROP TABLE IF EXISTS `base_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `base_customer` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户编码',
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户名称',
  `contact` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `address` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收货地址',
  `receivable_balance` decimal(10,2) DEFAULT '0.00' COMMENT '应收余额',
  `status` tinyint(4) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_customer_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='客户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_customer`
--

LOCK TABLES `base_customer` WRITE;
/*!40000 ALTER TABLE `base_customer` DISABLE KEYS */;
INSERT INTO `base_customer` VALUES (1996143116463841281,'CUST001','华为公司','任正非','007597620389','ren-zheng-fei@huawei.com','深圳龙岗坂田华为',0.00,1,0,'2025-12-03 17:03:00','2025-12-03 17:03:00'),(1996143356034097153,'CUST002','小米公司','雷神','19876235212','shen-lei@xiaomi.com','北京朝阳区小米',108749.00,1,0,'2025-12-03 17:03:57','2025-12-03 17:03:57'),(1998652631461605377,'CUST003','中国移动','刘先生','18766623211','liu@chinamo.com','广西南宁',0.00,1,0,'2025-12-10 15:14:55','2025-12-10 15:14:55');
/*!40000 ALTER TABLE `base_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_product`
--

DROP TABLE IF EXISTS `base_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `base_product` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `product_code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品编码(唯一)',
  `product_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `category` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类(暂时存字符串)',
  `unit` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '个' COMMENT '单位',
  `price_purchase` decimal(10,2) DEFAULT '0.00' COMMENT '采购参考价',
  `price_sale` decimal(10,2) DEFAULT '0.00' COMMENT '销售参考价',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态(1:上架 0:下架)',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `manage_type` tinyint(4) DEFAULT '0' COMMENT '管理模式(0普通 1批次 2序列号)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_product_code` (`product_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品基础表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_product`
--

LOCK TABLES `base_product` WRITE;
/*!40000 ALTER TABLE `base_product` DISABLE KEYS */;
INSERT INTO `base_product` VALUES (2005516307351142402,'IPHONE0001','iPhone 17',NULL,'件',3499.00,5999.00,1,NULL,0,'2025-12-29 13:48:43','2025-12-29 13:48:43',2),(2005570809487904769,'HW0001','HUAWEI Mate 80',NULL,'件',3599.00,4699.00,1,NULL,0,'2025-12-29 17:25:17','2025-12-29 17:25:17',2),(2005889721404444673,'OPPO0001','1+ Ace5 竞速版',NULL,'件',1000.00,1459.00,1,NULL,0,'2025-12-30 14:32:31','2025-12-30 14:32:31',2),(2005928768734691329,'APPLE0001','Apple/苹果AI电脑/Mac Studio M3 Ultra(32+80核)512G',NULL,'件',83200.00,108749.00,1,NULL,0,'2025-12-30 17:07:41','2025-12-30 17:07:41',2);
/*!40000 ALTER TABLE `base_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_supplier`
--

DROP TABLE IF EXISTS `base_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `base_supplier` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '供应商编码',
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '供应商名称',
  `contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `address` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
  `payable_balance` decimal(10,2) DEFAULT '0.00' COMMENT '应付余额(财务用)',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态(1:启用 0:禁用)',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_supplier_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='供应商表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_supplier`
--

LOCK TABLES `base_supplier` WRITE;
/*!40000 ALTER TABLE `base_supplier` DISABLE KEYS */;
INSERT INTO `base_supplier` VALUES (1995832699136983042,'1001','联想供应商','科斯顿','0075882142','ke-shi-dun142@foxconn.com','北京联想大楼',0.00,1,NULL,0,'2025-12-02 20:29:30','2025-12-02 20:29:30'),(1996030441117380610,'1002','苹果供应商','科布斯','008765231','ke-bu-shi@apple.com','深圳市龙华区',153180.00,1,NULL,0,'2025-12-03 09:35:16','2025-12-29 15:15:38'),(1998652417401106434,'1003','OPPO供应商','克利申','1765875821','ke-lin-shen@oppo.com','广东东莞长安',105000.00,1,NULL,0,'2025-12-10 15:14:04','2025-12-27 11:24:51');
/*!40000 ALTER TABLE `base_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_warehouse`
--

DROP TABLE IF EXISTS `base_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `base_warehouse` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库编码',
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库名称',
  `location` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '仓库地址',
  `manager` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态(1:启用 0:禁用)',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_warehouse_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='仓库表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_warehouse`
--

LOCK TABLES `base_warehouse` WRITE;
/*!40000 ALTER TABLE `base_warehouse` DISABLE KEYS */;
INSERT INTO `base_warehouse` VALUES (1996424777529262081,'1001','北京主仓','陈工克','18764532122',1,NULL,0,'2025-12-04 11:42:13','2025-12-04 11:42:13'),(1996424967183106049,'2001','深圳主仓','黄镇邪','18765823121',1,NULL,0,'2025-12-04 11:42:58','2025-12-04 11:42:58');
/*!40000 ALTER TABLE `base_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_payment`
--

DROP TABLE IF EXISTS `fin_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fin_payment` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `payment_no` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '付款单号(PY...)',
  `supplier_id` bigint(20) NOT NULL COMMENT '供应商ID',
  `payment_date` date NOT NULL COMMENT '付款日期',
  `amount` decimal(12,2) NOT NULL COMMENT '付款金额',
  `payment_method` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '付款方式',
  `status` tinyint(4) DEFAULT '0' COMMENT '0:草稿 1:已审核',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_payment_no` (`payment_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='财务付款单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_payment`
--

LOCK TABLES `fin_payment` WRITE;
/*!40000 ALTER TABLE `fin_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_receipt`
--

DROP TABLE IF EXISTS `fin_receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fin_receipt` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `receipt_no` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '收款单号(RC...)',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `receipt_date` date NOT NULL COMMENT '收款日期',
  `amount` decimal(12,2) NOT NULL COMMENT '收款金额',
  `payment_method` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收款方式(支付宝/微信/转账)',
  `status` tinyint(4) DEFAULT '0' COMMENT '0:草稿 1:已审核',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_receipt_no` (`receipt_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='财务收款单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_receipt`
--

LOCK TABLES `fin_receipt` WRITE;
/*!40000 ALTER TABLE `fin_receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLW_CHANNEL_DEFINITION`
--

DROP TABLE IF EXISTS `FLW_CHANNEL_DEFINITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `FLW_CHANNEL_DEFINITION` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IMPLEMENTATION_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_CHANNEL_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLW_CHANNEL_DEFINITION`
--

LOCK TABLES `FLW_CHANNEL_DEFINITION` WRITE;
/*!40000 ALTER TABLE `FLW_CHANNEL_DEFINITION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FLW_CHANNEL_DEFINITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLW_EV_DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `FLW_EV_DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `FLW_EV_DATABASECHANGELOG` (
  `ID` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLW_EV_DATABASECHANGELOG`
--

LOCK TABLES `FLW_EV_DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `FLW_EV_DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `FLW_EV_DATABASECHANGELOG` VALUES ('1','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2025-12-22 11:44:36',1,'EXECUTED','8:1b0c48c9cf7945be799d868a2626d687','createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...','',NULL,'4.20.0',NULL,NULL,'6375076367'),('2','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2025-12-22 11:44:36',2,'EXECUTED','8:0ea825feb8e470558f0b5754352b9cda','addColumn tableName=FLW_CHANNEL_DEFINITION; addColumn tableName=FLW_CHANNEL_DEFINITION','',NULL,'4.20.0',NULL,NULL,'6375076367'),('3','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2025-12-22 11:44:36',3,'EXECUTED','8:3c2bb293350b5cbe6504331980c9dcee','customChange','',NULL,'4.20.0',NULL,NULL,'6375076367');
/*!40000 ALTER TABLE `FLW_EV_DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLW_EV_DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `FLW_EV_DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `FLW_EV_DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLW_EV_DATABASECHANGELOGLOCK`
--

LOCK TABLES `FLW_EV_DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `FLW_EV_DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `FLW_EV_DATABASECHANGELOGLOCK` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `FLW_EV_DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLW_EVENT_DEFINITION`
--

DROP TABLE IF EXISTS `FLW_EVENT_DEFINITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `FLW_EVENT_DEFINITION` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_EVENT_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLW_EVENT_DEFINITION`
--

LOCK TABLES `FLW_EVENT_DEFINITION` WRITE;
/*!40000 ALTER TABLE `FLW_EVENT_DEFINITION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FLW_EVENT_DEFINITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLW_EVENT_DEPLOYMENT`
--

DROP TABLE IF EXISTS `FLW_EVENT_DEPLOYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `FLW_EVENT_DEPLOYMENT` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLW_EVENT_DEPLOYMENT`
--

LOCK TABLES `FLW_EVENT_DEPLOYMENT` WRITE;
/*!40000 ALTER TABLE `FLW_EVENT_DEPLOYMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FLW_EVENT_DEPLOYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLW_EVENT_RESOURCE`
--

DROP TABLE IF EXISTS `FLW_EVENT_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `FLW_EVENT_RESOURCE` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLW_EVENT_RESOURCE`
--

LOCK TABLES `FLW_EVENT_RESOURCE` WRITE;
/*!40000 ALTER TABLE `FLW_EVENT_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FLW_EVENT_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLW_RU_BATCH`
--

DROP TABLE IF EXISTS `FLW_RU_BATCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `FLW_RU_BATCH` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin NOT NULL,
  `SEARCH_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) DEFAULT NULL,
  `STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BATCH_DOC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLW_RU_BATCH`
--

LOCK TABLES `FLW_RU_BATCH` WRITE;
/*!40000 ALTER TABLE `FLW_RU_BATCH` DISABLE KEYS */;
/*!40000 ALTER TABLE `FLW_RU_BATCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLW_RU_BATCH_PART`
--

DROP TABLE IF EXISTS `FLW_RU_BATCH_PART`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `FLW_RU_BATCH_PART` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BATCH_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin NOT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) DEFAULT NULL,
  `STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESULT_DOC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `FLW_IDX_BATCH_PART` (`BATCH_ID_`),
  CONSTRAINT `FLW_FK_BATCH_PART_PARENT` FOREIGN KEY (`BATCH_ID_`) REFERENCES `flw_ru_batch` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLW_RU_BATCH_PART`
--

LOCK TABLES `FLW_RU_BATCH_PART` WRITE;
/*!40000 ALTER TABLE `FLW_RU_BATCH_PART` DISABLE KEYS */;
/*!40000 ALTER TABLE `FLW_RU_BATCH_PART` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psi_batch`
--

DROP TABLE IF EXISTS `psi_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `psi_batch` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `warehouse_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `batch_no` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '批次号',
  `production_date` date DEFAULT NULL COMMENT '生产日期',
  `expire_date` date DEFAULT NULL COMMENT '过期日期',
  `quantity` int(11) NOT NULL DEFAULT '0' COMMENT '当前剩余数量',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_batch` (`warehouse_id`,`product_id`,`batch_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='批次库存表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psi_batch`
--

LOCK TABLES `psi_batch` WRITE;
/*!40000 ALTER TABLE `psi_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `psi_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psi_inventory`
--

DROP TABLE IF EXISTS `psi_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `psi_inventory` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库ID',
  `product_id` bigint(20) NOT NULL COMMENT '商品ID',
  `stock_quantity` int(11) DEFAULT '0' COMMENT '库存数量',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `avg_cost` decimal(12,2) DEFAULT '0.00' COMMENT '移动加权平均成本',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_wh_prod` (`warehouse_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='库存表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psi_inventory`
--

LOCK TABLES `psi_inventory` WRITE;
/*!40000 ALTER TABLE `psi_inventory` DISABLE KEYS */;
INSERT INTO `psi_inventory` VALUES (2005563176785723394,1996424967183106049,2005516307351142402,20,'2025-12-31 11:10:08',3499.00),(2005898541031686145,1996424967183106049,2005889721404444673,105,'2025-12-31 11:10:08',1000.00),(2005929209514098690,1996424777529262081,2005928768734691329,0,'2025-12-31 11:10:08',83200.00);
/*!40000 ALTER TABLE `psi_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psi_purchase_order`
--

DROP TABLE IF EXISTS `psi_purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `psi_purchase_order` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `order_no` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '单据编号(PO20231128001)',
  `supplier_id` bigint(20) NOT NULL COMMENT '供应商ID',
  `warehouse_id` bigint(20) NOT NULL COMMENT '入库仓库ID',
  `order_date` date NOT NULL COMMENT '单据日期',
  `total_amount` decimal(12,2) DEFAULT '0.00' COMMENT '订单总金额',
  `total_quantity` int(11) DEFAULT '0' COMMENT '总数量',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态(0:编制中 1:已审核入库 2:作废)',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(1) DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='采购订单主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psi_purchase_order`
--

LOCK TABLES `psi_purchase_order` WRITE;
/*!40000 ALTER TABLE `psi_purchase_order` DISABLE KEYS */;
INSERT INTO `psi_purchase_order` VALUES (2005557455415328770,'PO20251229133474',1996030441117380610,1996424967183106049,'2025-12-29',69980.00,20,1,'',0,'2025-12-29 16:32:13','2002986028275302401','2025-12-29 16:32:13'),(2005891778685390850,'PO20251230842340',1998652417401106434,1996424967183106049,'2025-12-30',105000.00,105,1,'',0,'2025-12-30 14:40:42','2002986028275302401','2025-12-30 14:40:42'),(2005928960779288578,'PO20251230707261',1996030441117380610,1996424777529262081,'2025-12-30',83200.00,1,1,'',0,'2025-12-30 17:08:27','2003022926733520898','2025-12-30 17:08:27');
/*!40000 ALTER TABLE `psi_purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psi_purchase_order_item`
--

DROP TABLE IF EXISTS `psi_purchase_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `psi_purchase_order_item` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `order_id` bigint(20) NOT NULL COMMENT '关联主表ID',
  `product_id` bigint(20) NOT NULL COMMENT '商品ID',
  `product_code` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '冗余编码(方便查)',
  `product_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '冗余名称',
  `unit` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单位',
  `quantity` int(11) NOT NULL COMMENT '采购数量',
  `unit_price` decimal(10,2) NOT NULL COMMENT '采购单价',
  `total_price` decimal(12,2) NOT NULL COMMENT '行总价(数量*单价)',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='采购订单明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psi_purchase_order_item`
--

LOCK TABLES `psi_purchase_order_item` WRITE;
/*!40000 ALTER TABLE `psi_purchase_order_item` DISABLE KEYS */;
INSERT INTO `psi_purchase_order_item` VALUES (2005557455490826241,2005557455415328770,2005516307351142402,'IPHONE0001','iPhone 17','件',20,3499.00,69980.00,'',0,'2025-12-29 16:32:13','2025-12-29 16:32:13'),(2005891778962214914,2005891778685390850,2005889721404444673,'OPPO0001','1+ Ace5 竞速版','件',105,1000.00,105000.00,'',0,'2025-12-30 14:40:42','2025-12-30 14:40:42'),(2005928960833814530,2005928960779288578,2005928768734691329,'APPLE0001','Apple/苹果AI电脑/Mac Studio M3 Ultra(32+80核)512G','件',1,83200.00,83200.00,'',0,'2025-12-30 17:08:27','2025-12-30 17:08:27');
/*!40000 ALTER TABLE `psi_purchase_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psi_sales_order`
--

DROP TABLE IF EXISTS `psi_sales_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `psi_sales_order` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `order_no` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '销售单号(SO...)',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `warehouse_id` bigint(20) NOT NULL COMMENT '出库仓库ID',
  `order_date` date NOT NULL,
  `total_amount` decimal(12,2) DEFAULT '0.00',
  `total_quantity` int(11) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0' COMMENT '0:草稿 1:已出库',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `total_cost` decimal(12,2) DEFAULT '0.00' COMMENT '总成本',
  `total_profit` decimal(12,2) DEFAULT '0.00' COMMENT '总毛利',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_sales_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='销售订单主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psi_sales_order`
--

LOCK TABLES `psi_sales_order` WRITE;
/*!40000 ALTER TABLE `psi_sales_order` DISABLE KEYS */;
INSERT INTO `psi_sales_order` VALUES (2005930024379285506,'PO20251230960843',1996143356034097153,1996424777529262081,'2025-12-30',108749.00,1,1,'',0,'2025-12-30 17:12:40','2025-12-30 17:12:40',2005915899687272450,83200.00,25549.00);
/*!40000 ALTER TABLE `psi_sales_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psi_sales_order_item`
--

DROP TABLE IF EXISTS `psi_sales_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `psi_sales_order_item` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT '数量',
  `unit_price` decimal(10,2) NOT NULL COMMENT '销售单价',
  `total_price` decimal(12,2) NOT NULL COMMENT '销售总价',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `cost_unit_price` decimal(10,2) DEFAULT '0.00' COMMENT '出库时的成本价',
  PRIMARY KEY (`id`),
  KEY `idx_sales_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='销售订单明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psi_sales_order_item`
--

LOCK TABLES `psi_sales_order_item` WRITE;
/*!40000 ALTER TABLE `psi_sales_order_item` DISABLE KEYS */;
INSERT INTO `psi_sales_order_item` VALUES (2005930024496726018,2005930024379285506,2005928768734691329,1,108749.00,108749.00,'',0,83200.00);
/*!40000 ALTER TABLE `psi_sales_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psi_sales_return`
--

DROP TABLE IF EXISTS `psi_sales_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `psi_sales_return` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `return_no` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '退货单号(SR...)',
  `source_order_no` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '源销售单号',
  `customer_id` bigint(20) NOT NULL,
  `warehouse_id` bigint(20) NOT NULL COMMENT '退入仓库',
  `return_date` date NOT NULL,
  `total_amount` decimal(12,2) DEFAULT '0.00' COMMENT '退款金额',
  `total_quantity` int(11) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0' COMMENT '0:草稿 1:已审核',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` tinyint(4) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_return_no` (`return_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='销售退货主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psi_sales_return`
--

LOCK TABLES `psi_sales_return` WRITE;
/*!40000 ALTER TABLE `psi_sales_return` DISABLE KEYS */;
/*!40000 ALTER TABLE `psi_sales_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psi_sales_return_item`
--

DROP TABLE IF EXISTS `psi_sales_return_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `psi_sales_return_item` (
  `id` bigint(20) NOT NULL,
  `return_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL COMMENT '退货单价(通常等于原销售价)',
  `total_price` decimal(12,2) NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  `sn_codes` text COLLATE utf8mb4_general_ci COMMENT '退回的SN码(逗号分隔)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='销售退货明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psi_sales_return_item`
--

LOCK TABLES `psi_sales_return_item` WRITE;
/*!40000 ALTER TABLE `psi_sales_return_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `psi_sales_return_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psi_serial`
--

DROP TABLE IF EXISTS `psi_serial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `psi_serial` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `warehouse_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `sn_code` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'SN序列号',
  `status` tinyint(4) DEFAULT '1' COMMENT '1:在库 2:已售 3:报损',
  `in_order_no` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '入库单号(来源)',
  `out_order_no` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '出库单号(去向)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_sn` (`sn_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='序列号明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psi_serial`
--

LOCK TABLES `psi_serial` WRITE;
/*!40000 ALTER TABLE `psi_serial` DISABLE KEYS */;
INSERT INTO `psi_serial` VALUES (2005557455507603457,1996424967183106049,2005516307351142402,'SN25122955210',1,'PO20251229133474',NULL,'2025-12-29 16:32:13','2025-12-29 16:32:13',0),(2005557455524380673,1996424967183106049,2005516307351142402,'SN25122978581',1,'PO20251229133474',NULL,'2025-12-29 16:32:13','2025-12-29 16:32:13',0),(2005557455541157889,1996424967183106049,2005516307351142402,'SN25122916072',1,'PO20251229133474',NULL,'2025-12-29 16:32:13','2025-12-29 16:32:13',0),(2005557455557935106,1996424967183106049,2005516307351142402,'SN25122933413',1,'PO20251229133474',NULL,'2025-12-29 16:32:13','2025-12-29 16:32:13',0),(2005557455570518018,1996424967183106049,2005516307351142402,'SN25122992444',1,'PO20251229133474',NULL,'2025-12-29 16:32:13','2025-12-29 16:32:13',0),(2005557455578906625,1996424967183106049,2005516307351142402,'SN25122983775',1,'PO20251229133474',NULL,'2025-12-29 16:32:13','2025-12-29 16:32:13',0),(2005557455587295234,1996424967183106049,2005516307351142402,'SN25122907996',1,'PO20251229133474',NULL,'2025-12-29 16:32:13','2025-12-29 16:32:13',0),(2005557455595683842,1996424967183106049,2005516307351142402,'SN25122930307',1,'PO20251229133474',NULL,'2025-12-29 16:32:13','2025-12-29 16:32:13',0),(2005557455608266753,1996424967183106049,2005516307351142402,'SN25122913368',1,'PO20251229133474',NULL,'2025-12-29 16:32:13','2025-12-29 16:32:13',0),(2005557455620849665,1996424967183106049,2005516307351142402,'SN25122971849',1,'PO20251229133474',NULL,'2025-12-29 16:32:13','2025-12-29 16:32:13',0),(2005557455629238274,1996424967183106049,2005516307351142402,'SN251229892010',1,'PO20251229133474',NULL,'2025-12-29 16:32:13','2025-12-29 16:32:13',0),(2005557455637626882,1996424967183106049,2005516307351142402,'SN251229005711',1,'PO20251229133474',NULL,'2025-12-29 16:32:13','2025-12-29 16:32:13',0),(2005557455646015489,1996424967183106049,2005516307351142402,'SN251229062312',1,'PO20251229133474',NULL,'2025-12-29 16:32:13','2025-12-29 16:32:13',0),(2005557455654404098,1996424967183106049,2005516307351142402,'SN251229720813',1,'PO20251229133474',NULL,'2025-12-29 16:32:13','2025-12-29 16:32:13',0),(2005557455662792706,1996424967183106049,2005516307351142402,'SN251229397914',1,'PO20251229133474',NULL,'2025-12-29 16:32:13','2025-12-29 16:32:13',0),(2005557455666987009,1996424967183106049,2005516307351142402,'SN251229547115',1,'PO20251229133474',NULL,'2025-12-29 16:32:13','2025-12-29 16:32:13',0),(2005557455679569921,1996424967183106049,2005516307351142402,'SN251229785716',1,'PO20251229133474',NULL,'2025-12-29 16:32:13','2025-12-29 16:32:13',0),(2005557455683764225,1996424967183106049,2005516307351142402,'SN251229610617',1,'PO20251229133474',NULL,'2025-12-29 16:32:13','2025-12-29 16:32:13',0),(2005557455692152833,1996424967183106049,2005516307351142402,'SN251229152818',1,'PO20251229133474',NULL,'2025-12-29 16:32:13','2025-12-29 16:32:13',0),(2005557455704735746,1996424967183106049,2005516307351142402,'SN251229108719',1,'PO20251229133474',NULL,'2025-12-29 16:32:13','2025-12-29 16:32:13',0),(2005891778978992129,1996424967183106049,2005889721404444673,'SN25123078860',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779012546561,1996424967183106049,2005889721404444673,'SN25123005181',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779025129473,1996424967183106049,2005889721404444673,'SN25123075612',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779037712385,1996424967183106049,2005889721404444673,'SN25123058343',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779041906690,1996424967183106049,2005889721404444673,'SN25123061724',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779071266817,1996424967183106049,2005889721404444673,'SN25123087295',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779083849730,1996424967183106049,2005889721404444673,'SN25123019676',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779100626946,1996424967183106049,2005889721404444673,'SN25123062867',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779113209857,1996424967183106049,2005889721404444673,'SN25123014998',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779121598466,1996424967183106049,2005889721404444673,'SN25123057519',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779129987073,1996424967183106049,2005889721404444673,'SN251230477210',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779138375682,1996424967183106049,2005889721404444673,'SN251230298411',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779142569986,1996424967183106049,2005889721404444673,'SN251230377212',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779146764290,1996424967183106049,2005889721404444673,'SN251230120513',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779155152897,1996424967183106049,2005889721404444673,'SN251230626714',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779159347201,1996424967183106049,2005889721404444673,'SN251230894215',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779163541506,1996424967183106049,2005889721404444673,'SN251230158016',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779167735810,1996424967183106049,2005889721404444673,'SN251230192717',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779171930113,1996424967183106049,2005889721404444673,'SN251230081018',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779176124417,1996424967183106049,2005889721404444673,'SN251230314119',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779184513025,1996424967183106049,2005889721404444673,'SN251230358420',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779192901633,1996424967183106049,2005889721404444673,'SN251230104521',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779197095937,1996424967183106049,2005889721404444673,'SN251230123022',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779209678850,1996424967183106049,2005889721404444673,'SN251230508423',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779218067457,1996424967183106049,2005889721404444673,'SN251230147624',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779222261761,1996424967183106049,2005889721404444673,'SN251230307025',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779226456066,1996424967183106049,2005889721404444673,'SN251230612226',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779230650369,1996424967183106049,2005889721404444673,'SN251230113827',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779234844674,1996424967183106049,2005889721404444673,'SN251230905628',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779243233282,1996424967183106049,2005889721404444673,'SN251230377029',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779247427586,1996424967183106049,2005889721404444673,'SN251230493430',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779247427587,1996424967183106049,2005889721404444673,'SN251230516931',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779255816194,1996424967183106049,2005889721404444673,'SN251230361532',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779260010498,1996424967183106049,2005889721404444673,'SN251230690433',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779264204801,1996424967183106049,2005889721404444673,'SN251230448934',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779268399106,1996424967183106049,2005889721404444673,'SN251230561635',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779272593409,1996424967183106049,2005889721404444673,'SN251230335536',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779280982018,1996424967183106049,2005889721404444673,'SN251230615337',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779285176321,1996424967183106049,2005889721404444673,'SN251230542338',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779289370625,1996424967183106049,2005889721404444673,'SN251230895039',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779293564929,1996424967183106049,2005889721404444673,'SN251230404440',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779297759233,1996424967183106049,2005889721404444673,'SN251230102341',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779301953538,1996424967183106049,2005889721404444673,'SN251230691242',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779310342146,1996424967183106049,2005889721404444673,'SN251230816443',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779318730754,1996424967183106049,2005889721404444673,'SN251230866744',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779322925058,1996424967183106049,2005889721404444673,'SN251230255345',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779327119362,1996424967183106049,2005889721404444673,'SN251230053046',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779335507970,1996424967183106049,2005889721404444673,'SN251230158447',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779339702274,1996424967183106049,2005889721404444673,'SN251230824748',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779343896577,1996424967183106049,2005889721404444673,'SN251230818949',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779348090882,1996424967183106049,2005889721404444673,'SN251230200550',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779356479490,1996424967183106049,2005889721404444673,'SN251230484451',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779360673794,1996424967183106049,2005889721404444673,'SN251230447752',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779364868097,1996424967183106049,2005889721404444673,'SN251230620953',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779373256706,1996424967183106049,2005889721404444673,'SN251230886154',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779381645314,1996424967183106049,2005889721404444673,'SN251230640855',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779385839617,1996424967183106049,2005889721404444673,'SN251230785256',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779390033921,1996424967183106049,2005889721404444673,'SN251230915957',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779398422530,1996424967183106049,2005889721404444673,'SN251230621958',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779402616833,1996424967183106049,2005889721404444673,'SN251230042259',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779406811138,1996424967183106049,2005889721404444673,'SN251230648860',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779415199745,1996424967183106049,2005889721404444673,'SN251230080061',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779419394050,1996424967183106049,2005889721404444673,'SN251230083462',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779423588354,1996424967183106049,2005889721404444673,'SN251230009363',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779427782658,1996424967183106049,2005889721404444673,'SN251230126264',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779436171265,1996424967183106049,2005889721404444673,'SN251230648865',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779444559873,1996424967183106049,2005889721404444673,'SN251230462866',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779448754178,1996424967183106049,2005889721404444673,'SN251230522467',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779457142786,1996424967183106049,2005889721404444673,'SN251230499268',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779461337089,1996424967183106049,2005889721404444673,'SN251230613969',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779469725698,1996424967183106049,2005889721404444673,'SN251230120070',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779478114306,1996424967183106049,2005889721404444673,'SN251230718771',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779482308610,1996424967183106049,2005889721404444673,'SN251230160072',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779486502913,1996424967183106049,2005889721404444673,'SN251230403273',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779490697218,1996424967183106049,2005889721404444673,'SN251230176574',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779499085826,1996424967183106049,2005889721404444673,'SN251230169775',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779503280130,1996424967183106049,2005889721404444673,'SN251230635276',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779507474434,1996424967183106049,2005889721404444673,'SN251230052877',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779515863042,1996424967183106049,2005889721404444673,'SN251230900978',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779524251650,1996424967183106049,2005889721404444673,'SN251230556679',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779528445953,1996424967183106049,2005889721404444673,'SN251230039480',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779536834561,1996424967183106049,2005889721404444673,'SN251230060981',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779541028865,1996424967183106049,2005889721404444673,'SN251230180082',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779549417474,1996424967183106049,2005889721404444673,'SN251230405683',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779553611778,1996424967183106049,2005889721404444673,'SN251230089884',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779562000386,1996424967183106049,2005889721404444673,'SN251230737485',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779566194690,1996424967183106049,2005889721404444673,'SN251230406186',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779570388994,1996424967183106049,2005889721404444673,'SN251230805387',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779595554817,1996424967183106049,2005889721404444673,'SN251230168988',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779599749122,1996424967183106049,2005889721404444673,'SN251230139289',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779603943425,1996424967183106049,2005889721404444673,'SN251230595690',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779608137729,1996424967183106049,2005889721404444673,'SN251230414691',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779612332034,1996424967183106049,2005889721404444673,'SN251230527392',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779633303554,1996424967183106049,2005889721404444673,'SN251230617093',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779637497857,1996424967183106049,2005889721404444673,'SN251230857794',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779658469377,1996424967183106049,2005889721404444673,'SN251230623595',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779662663681,1996424967183106049,2005889721404444673,'SN251230910196',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779671052290,1996424967183106049,2005889721404444673,'SN251230651997',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779675246593,1996424967183106049,2005889721404444673,'SN251230959098',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779679440898,1996424967183106049,2005889721404444673,'SN251230446099',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779683635202,1996424967183106049,2005889721404444673,'SN2512301744100',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779692023809,1996424967183106049,2005889721404444673,'SN2512308771101',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779692023810,1996424967183106049,2005889721404444673,'SN2512307118102',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779696218113,1996424967183106049,2005889721404444673,'SN2512300970103',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005891779704606721,1996424967183106049,2005889721404444673,'SN2512300362104',1,'PO20251230842340',NULL,'2025-12-30 14:40:42','2025-12-30 14:40:42',0),(2005928960842203137,1996424777529262081,2005928768734691329,'SN25123043100',2,'PO20251230707261','PO20251230960843','2025-12-30 17:08:27','2025-12-30 17:08:27',0);
/*!40000 ALTER TABLE `psi_serial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门ID',
  `dept_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT '0' COMMENT '显示排序',
  `leader` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态(1:正常 0:停用)',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'集团总部',0,NULL,NULL,NULL,1,0,'2025-12-16 15:56:43','2025-12-16 17:18:03'),(101,100,'深圳分公司',1,NULL,NULL,NULL,1,0,'2025-12-16 15:56:43','2025-12-16 15:56:43'),(102,100,'北京分公司',2,NULL,NULL,NULL,1,0,'2025-12-16 15:56:43','2025-12-16 15:56:43'),(103,101,'研发部',1,NULL,NULL,NULL,1,0,'2025-12-16 15:56:43','2025-12-16 15:56:43'),(104,101,'销售部',2,NULL,NULL,NULL,1,0,'2025-12-16 15:56:43','2025-12-16 15:56:43'),(105,101,'财务部',3,NULL,NULL,NULL,1,0,'2025-12-16 15:56:43','2025-12-16 15:56:43'),(2001576384491393025,101,'采购部',4,'',NULL,NULL,1,0,'2025-12-18 16:52:52','2025-12-18 16:52:52');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `menu_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `path` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由路径',
  `component` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Vue组件路径',
  `perms` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识(user:list)',
  `icon` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
  `type` tinyint(4) DEFAULT '0' COMMENT '类型(0:目录 1:菜单 2:按钮)',
  `sort_order` int(11) DEFAULT '0' COMMENT '排序',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '逻辑删除(1:已删)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (100,0,'系统管理',NULL,NULL,NULL,NULL,0,1,0,'2025-12-08 16:10:52'),(101,1001,'用户查询',NULL,NULL,'system:user:list',NULL,1,1,0,'2025-12-08 16:10:52'),(102,1001,'用户新增',NULL,NULL,'system:user:add',NULL,2,1,0,'2025-12-08 16:10:52'),(103,1001,'用户修改',NULL,NULL,'system:user:edit',NULL,2,2,0,'2025-12-08 16:10:52'),(104,1001,'用户删除',NULL,NULL,'system:user:delete',NULL,2,3,0,'2025-12-08 16:10:52'),(105,1001,'分配角色',NULL,NULL,'system:user:role',NULL,2,4,0,'2025-12-08 16:10:52'),(110,1002,'角色管理',NULL,NULL,'system:role:list',NULL,1,2,0,'2025-12-08 16:10:52'),(111,1002,'角色新增',NULL,NULL,'system:role:add',NULL,2,1,0,'2025-12-08 16:10:52'),(112,1002,'角色修改',NULL,NULL,'system:role:edit',NULL,2,2,0,'2025-12-08 16:10:52'),(113,1002,'角色删除',NULL,NULL,'system:role:delete',NULL,2,3,0,'2025-12-08 16:10:52'),(114,1002,'分配权限',NULL,NULL,'system:role:menu',NULL,2,4,0,'2025-12-08 16:10:52'),(141,1004,'代办事项',NULL,NULL,'workflow:todo:list',NULL,1,1,0,'2025-12-08 16:13:01'),(200,0,'进销存管理',NULL,NULL,NULL,NULL,0,2,0,'2025-12-08 16:12:44'),(201,2001,'商品查询',NULL,NULL,'base:product:list',NULL,1,1,0,'2025-12-08 16:12:00'),(202,2001,'商品新增',NULL,NULL,'base:product:add',NULL,2,1,0,'2025-12-08 16:12:00'),(203,2001,'商品修改',NULL,NULL,'base:product:edit',NULL,2,2,0,'2025-12-08 16:12:00'),(204,2001,'商品删除',NULL,NULL,'base:product:delete',NULL,2,3,0,'2025-12-08 16:12:00'),(210,2002,'供应商查询',NULL,NULL,'base:supplier:list',NULL,1,2,0,'2025-12-08 16:12:00'),(211,2002,'供应商新增',NULL,NULL,'base:supplier:add',NULL,2,1,0,'2025-12-08 16:12:00'),(212,2002,'供应商修改',NULL,NULL,'base:supplier:edit',NULL,2,2,0,'2025-12-08 16:12:00'),(213,2002,'供应商删除',NULL,NULL,'base:supplier:delete',NULL,2,3,0,'2025-12-08 16:12:00'),(220,2003,'客户管理',NULL,NULL,'base:customer:list',NULL,1,3,0,'2025-12-08 16:12:00'),(221,2003,'客户新增',NULL,NULL,'base:customer:add',NULL,2,1,0,'2025-12-08 16:12:00'),(222,2003,'客户修改',NULL,NULL,'base:customer:edit',NULL,2,2,0,'2025-12-08 16:12:00'),(223,2003,'客户删除',NULL,NULL,'base:customer:delete',NULL,2,3,0,'2025-12-08 16:12:00'),(230,2004,'仓库管理',NULL,NULL,'base:warehouse:list',NULL,1,4,0,'2025-12-08 16:12:00'),(231,2004,'仓库新增',NULL,NULL,'base:warehouse:add',NULL,2,1,0,'2025-12-08 16:12:00'),(232,2004,'仓库修改',NULL,NULL,'base:warehouse:edit',NULL,2,2,0,'2025-12-08 16:12:00'),(233,2004,'仓库删除',NULL,NULL,'base:warehouse:delete',NULL,2,3,0,'2025-12-08 16:12:00'),(300,0,'单据管理',NULL,NULL,NULL,NULL,0,3,0,'2025-12-08 16:12:44'),(301,3001,'采购订单',NULL,NULL,'psi:purchase:list',NULL,1,1,0,'2025-12-08 16:12:44'),(302,3001,'采购开单',NULL,NULL,'psi:purchase:add',NULL,2,1,0,'2025-12-08 16:12:44'),(303,3001,'采购编辑',NULL,NULL,'psi:purchase:edit',NULL,2,2,0,'2025-12-08 16:12:44'),(304,3001,'采购删除',NULL,NULL,'psi:purchase:delete',NULL,2,3,0,'2025-12-08 16:12:44'),(305,3001,'采购审核',NULL,NULL,'psi:purchase:audit',NULL,2,4,0,'2025-12-08 16:12:44'),(401,3002,'销售订单',NULL,NULL,'psi:sales:list',NULL,1,1,0,'2025-12-08 16:12:52'),(402,3002,'销售开单',NULL,NULL,'psi:sales:add',NULL,2,1,0,'2025-12-08 16:12:52'),(403,3002,'销售编辑',NULL,NULL,'psi:sales:edit',NULL,2,2,0,'2025-12-08 16:12:52'),(404,3002,'销售删除',NULL,NULL,'psi:sales:delete',NULL,2,3,0,'2025-12-08 16:12:52'),(405,3002,'销售审核',NULL,NULL,'psi:sales:audit',NULL,2,4,0,'2025-12-08 16:12:52'),(501,3003,'库存查询',NULL,NULL,'psi:inventory:list',NULL,1,1,0,'2025-12-08 16:13:01'),(601,3004,'销售退货单查询',NULL,NULL,'psi:return:list',NULL,1,1,0,'2026-01-04 15:44:20'),(602,3004,'销售退货单添加',NULL,NULL,'psi:return:add',NULL,2,2,0,'2026-01-04 15:44:20'),(603,3004,'销售退货单审核',NULL,NULL,'psi:return:audit',NULL,2,3,0,'2026-01-04 15:44:20'),(604,3004,'销售退货单删除',NULL,NULL,'psi:return:delete',NULL,2,4,0,'2026-01-04 15:44:20'),(900,0,'报表中心',NULL,NULL,NULL,NULL,0,9,0,'2025-12-08 16:13:01'),(901,900,'老板仪表盘',NULL,NULL,'report:dashboard',NULL,1,1,0,'2025-12-08 16:13:01'),(1001,100,'用户管理',NULL,NULL,NULL,NULL,0,1,0,'2025-12-08 16:10:52'),(1002,100,'角色管理',NULL,NULL,NULL,NULL,0,1,0,'2025-12-08 16:10:52'),(1004,100,'特殊权限',NULL,NULL,NULL,NULL,0,1,0,'2025-12-08 16:10:52'),(2001,200,'商品管理',NULL,NULL,NULL,NULL,0,2,0,'2025-12-08 16:12:44'),(2002,200,'供应商管理',NULL,NULL,NULL,NULL,0,2,0,'2025-12-08 16:12:44'),(2003,200,'客户管理',NULL,NULL,NULL,NULL,0,2,0,'2025-12-08 16:12:44'),(2004,200,'仓库管理',NULL,NULL,NULL,NULL,0,2,0,'2025-12-08 16:12:44'),(3001,300,'采购管理',NULL,NULL,NULL,NULL,0,3,0,'2025-12-08 16:12:44'),(3002,300,'销售管理',NULL,NULL,NULL,NULL,0,4,0,'2025-12-08 16:12:52'),(3003,300,'库存管理',NULL,NULL,NULL,NULL,0,5,0,'2025-12-08 16:13:01'),(3004,300,'销售退货管理',NULL,NULL,NULL,NULL,0,6,0,'2025-12-08 16:13:01');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_oper_log` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '业务类型',
  `oper_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `oper_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_param` text COLLATE utf8mb4_general_ci COMMENT '请求参数',
  `status` tinyint(1) DEFAULT '0' COMMENT '操作状态(0正常 1异常)',
  `error_msg` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (2005557477716824064,'采购单管理','采购开单','2002986028275302401','/psi/purchase/add','0:0:0:0:0:0:0:1','{\"items\":[{\"orderId\":2005557455415328770,\"productId\":2005516307351142402,\"productCode\":\"IPHONE0001\",\"productName\":\"iPhone 17\",\"unit\":\"件\",\"quantity\":20,\"unitPrice\":3499,\"totalPrice\":69980,\"remark\":\"\",\"batchNo\":\"\",\"snList\":[\"SN25122955210\",\"SN25122978581\",\"SN25122916072\",\"SN25122933413\",\"SN25122992444\",\"SN25122983775\",\"SN25122907996\",\"SN25122930307\",\"SN25122913368\",\"SN25122971849\",\"SN251229892010\",\"SN251229005711\",\"SN251229062312\",\"SN251229720813\",\"SN251229397914\",\"SN251229547115\",\"SN251229785716\",\"SN251229610617\",\"SN251229152818\",\"SN251229108719\"],\"id\":2005557455490826241}],\"orderNo\":\"PO20251229133474\",\"supplierId\":1996030441117380610,\"warehouseId\":1996424967183106049,\"orderDate\":1766937600000,\"totalAmount\":69980,\"totalQuantity\":20,\"status\":2,\"remark\":\"\",\"createBy\":2002986028275302401,\"id\":2005557455415328770}',0,'','2025-12-29 16:32:19'),(2005570830715658240,'商品管理','新增商品','1994253713126707202','/basic/product/add','0:0:0:0:0:0:0:1','{\"productCode\":\"HW0001\",\"productName\":\"HUAWEI Mate 80\",\"unit\":\"件\",\"pricePurchase\":3599,\"priceSale\":4699,\"status\":1,\"manageType\":2,\"id\":2005570809487904769}',0,'','2025-12-29 17:25:22'),(2005889721987833856,'商品管理','新增商品','1994253713126707202','/basic/product/add','0:0:0:0:0:0:0:1','{\"productCode\":\"OPPO0001\",\"productName\":\"1+ Ace5 竞速版\",\"unit\":\"件\",\"pricePurchase\":1000,\"priceSale\":1459,\"status\":1,\"manageType\":2,\"id\":2005889721404444673}',0,'','2025-12-30 14:32:32'),(2005891784272584704,'采购单管理','采购开单','2002986028275302401','/psi/purchase/add','0:0:0:0:0:0:0:1','{\"items\":[{\"orderId\":2005891778685390850,\"productId\":2005889721404444673,\"productCode\":\"OPPO0001\",\"productName\":\"1+ Ace5 竞速版\",\"unit\":\"件\",\"quantity\":105,\"unitPrice\":1000,\"totalPrice\":105000,\"remark\":\"\",\"batchNo\":\"\",\"snList\":[\"SN25123078860\",\"SN25123005181\",\"SN25123075612\",\"SN25123058343\",\"SN25123061724\",\"SN25123087295\",\"SN25123019676\",\"SN25123062867\",\"SN25123014998\",\"SN25123057519\",\"SN251230477210\",\"SN251230298411\",\"SN251230377212\",\"SN251230120513\",\"SN251230626714\",\"SN251230894215\",\"SN251230158016\",\"SN251230192717\",\"SN251230081018\",\"SN251230314119\",\"SN251230358420\",\"SN251230104521\",\"SN251230123022\",\"SN251230508423\",\"SN251230147624\",\"SN251230307025\",\"SN251230612226\",\"SN251230113827\",\"SN251230905628\",\"SN251230377029\",\"SN251230493430\",\"SN251230516931\",\"SN251230361532\",\"SN251230690433\",\"SN251230448934\",\"SN251230561635\",\"SN251230335536\",\"SN251230615337\",\"SN251230542338\",\"SN251230895039\",\"SN251230404440\",\"SN251230102341\",\"SN251230691242\",\"SN251230816443\",\"SN251230866744\",\"SN251230255345\",\"SN251230053046\",\"SN251230158447\",\"SN251230824748\",\"SN251230818949\",\"SN251230200550\",\"SN251230484451\",\"SN251230447752\",\"SN251230620953\",\"SN251230886154\",\"SN251230640855\",\"SN251230785256\",\"SN251230915957\",\"SN251230621958\",\"SN251230042259\",\"SN251230648860\",\"SN251230080061\",\"SN251230083462\",\"SN251230009363\",\"SN251230126264\",\"SN251230648865\",\"SN251230462866\",\"SN251230522467\",\"SN251230499268\",\"SN251230613969\",\"SN251230120070\",\"SN251230718771\",\"SN251230160072\",\"SN251230403273\",\"SN251230176574\",\"SN251230169775\",\"SN251230635276\",\"SN251230052877\",\"SN251230900978\",\"SN251230556679\",\"SN251230039480\",\"SN251230060981\",\"SN251230180082\",\"SN251230405683\",\"SN251230089884\",\"SN251230737485\",\"SN251230406186\",\"SN251230805387\",\"SN251230168988\",\"SN251230139289\",\"SN251230595690\",\"SN251230414691\",\"SN251230527392\",\"SN251230617093\",\"SN251230857794\",\"SN251230623595\",\"SN251230910196\",\"SN251230651997\",\"SN251230959098\",\"SN251230446099\",\"SN2512301744100\",\"SN2512308771101\",\"SN2512307118102\",\"SN2512300970103\",\"SN2512300362104\"],\"id\":2005891778962214914}],\"orderNo\":\"PO20251230842340\",\"supplierId\":1998652417401106434,\"warehouseId\":1996424967183106049,\"orderDate\":1767024000000,\"totalAmount\":105000,\"totalQuantity\":105,\"status\":2,\"remark\":\"\",\"createBy\":2002986028275302401,\"id\":2005891778685390850}',0,'','2025-12-30 14:40:44'),(2005915536519647232,'用户管理','新增用户','1994253713126707202','/system/user/add','0:0:0:0:0:0:0:1','{\"username\":\"rick\",\"password\":\"$2a$10$LGWJMnlMULUJ.pHoIL6Kvek73UYhK2ix7QZ1z8o78r5ax/OzEDocS\",\"realName\":\"瑞可\",\"status\":1,\"deptId\":2001576384491393025,\"id\":2005915515270922242}',0,'','2025-12-30 16:15:07'),(2005915571722440704,'用户管理','修改用户','1994253713126707202','/system/user/edit','0:0:0:0:0:0:0:1','{\"username\":\"rick\",\"realName\":\"瑞可\",\"status\":1,\"deptId\":104,\"id\":2005915515270922242,\"createTime\":1767082501000,\"updateTime\":1767082501000,\"isDeleted\":0}',0,'','2025-12-30 16:15:15'),(2005915609559257088,'用户管理','给用户分配角色','1994253713126707202','/system/user/assignRole','0:0:0:0:0:0:0:1','{\"userId\":2005915515270922242,\"roleIds\":[4]}',0,'','2025-12-30 16:15:24'),(2005915899905757184,'用户管理','新增用户','1994253713126707202','/system/user/add','0:0:0:0:0:0:0:1','{\"username\":\"ross\",\"password\":\"$2a$10$Kv44PFs7ndsvTnqY9DC/beqpqgLpzjbaJT3oPsX3xWPxhtZv5C82e\",\"realName\":\"柔斯\",\"status\":1,\"deptId\":104,\"id\":2005915899687272450}',0,'','2025-12-30 16:16:33'),(2005915919182778368,'用户管理','给用户分配角色','1994253713126707202','/system/user/assignRole','0:0:0:0:0:0:0:1','{\"userId\":2005915899687272450,\"roleIds\":[4]}',0,'','2025-12-30 16:16:38'),(2005916113525854208,'用户管理','给用户分配角色','1994253713126707202','/system/user/assignRole','0:0:0:0:0:0:0:1','{\"userId\":2005915899687272450,\"roleIds\":[5]}',0,'','2025-12-30 16:17:24'),(2005917577799323648,'角色管理','给角色分配权限','1994253713126707202','/system/role/assignMenu','0:0:0:0:0:0:0:1','{\"roleId\":5,\"menuIds\":[201,402,401,403,404,3003,501,200,2001,300,3002]}',0,'','2025-12-30 16:23:13'),(2005928768932204544,'商品管理','新增商品','1994253713126707202','/basic/product/add','0:0:0:0:0:0:0:1','{\"productCode\":\"APPLE0001\",\"productName\":\"Apple/苹果AI电脑/Mac Studio M3 Ultra(32+80核)512G\",\"unit\":\"件\",\"pricePurchase\":83200,\"priceSale\":108749,\"status\":1,\"manageType\":2,\"id\":2005928768734691329}',0,'','2025-12-30 17:07:42'),(2005928961249431552,'采购单管理','采购开单','2003022926733520898','/psi/purchase/add','0:0:0:0:0:0:0:1','{\"items\":[{\"orderId\":2005928960779288578,\"productId\":2005928768734691329,\"productCode\":\"APPLE0001\",\"productName\":\"Apple/苹果AI电脑/Mac Studio M3 Ultra(32+80核)512G\",\"unit\":\"件\",\"quantity\":1,\"unitPrice\":83200,\"totalPrice\":83200,\"remark\":\"\",\"batchNo\":\"\",\"snList\":[\"SN25123043100\"],\"id\":2005928960833814530}],\"orderNo\":\"PO20251230707261\",\"supplierId\":1996030441117380610,\"warehouseId\":1996424777529262081,\"orderDate\":1767024000000,\"totalAmount\":83200,\"totalQuantity\":1,\"status\":2,\"remark\":\"\",\"createBy\":2003022926733520898,\"id\":2005928960779288578}',0,'','2025-12-30 17:08:27'),(2005930024702627840,'销售订单管理','销售开单','2005915899687272450','/psi/sales/add','0:0:0:0:0:0:0:1','{\"items\":[{\"id\":2005930024496726018,\"orderId\":2005930024379285506,\"productId\":2005928768734691329,\"quantity\":1,\"unitPrice\":108749,\"totalPrice\":108749,\"remark\":\"\",\"productCode\":\"APPLE0001\",\"productName\":\"Apple/苹果AI电脑/Mac Studio M3 Ultra(32+80核)512G\",\"unit\":\"件\",\"snList\":[\"SN25123043100\"]}],\"orderNo\":\"PO20251230960843\",\"customerId\":1996143356034097153,\"warehouseId\":1996424777529262081,\"orderDate\":1767024000000,\"totalAmount\":108749,\"totalQuantity\":1,\"status\":2,\"remark\":\"\",\"createBy\":2005915899687272450,\"id\":2005930024379285506}',0,'','2025-12-30 17:12:41'),(2006251770047737856,'角色管理','给角色分配权限','1994253713126707202','/system/role/assignMenu','0:0:0:0:0:0:0:1','{\"roleId\":4,\"menuIds\":[1004,141,2003,221,222,223,220,2001,201,202,203,204,3002,402,401,403,404,405,3003,501,900,901,100,200,300]}',0,'','2025-12-31 14:31:11'),(2006251881066770432,'待办事项','审批通过 (完成任务)','2005915515270922242','/flow/complete/b15f4558-e55f-11f0-8109-4e8273da71dd','0:0:0:0:0:0:0:1','b15f4558-e55f-11f0-8109-4e8273da71dd',0,'','2025-12-31 14:31:37'),(2006252498988412928,'待办事项','审批通过 (完成任务)','1994253713126707202','/flow/complete/5bd99032-e612-11f0-ba98-4e8273da71dd','0:0:0:0:0:0:0:1','5bd99032-e612-11f0-ba98-4e8273da71dd',1,'只能审核草稿状态的单据','2025-12-31 14:34:05'),(2006253619039502336,'待办事项','审批通过 (完成任务)','1994253713126707202','/flow/complete/5bd99032-e612-11f0-ba98-4e8273da71dd','0:0:0:0:0:0:0:1','5bd99032-e612-11f0-ba98-4e8273da71dd',0,'','2025-12-31 14:38:32');
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `role_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色编码(ROLE_ADMIN)',
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `data_scope` tinyint(4) DEFAULT NULL COMMENT '数据权限1: 全部数据2: 本部门数据3: 仅本人数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin','拥有至高无上的权力','2025-12-08 16:13:21',1),(2,'采购经理','purchase_mgr','负责采购审核与供应商','2025-12-08 16:13:21',2),(3,'采购专员','purchase_staff','负责开采购单','2025-12-08 16:13:21',3),(4,'销售经理','sales_mgr','负责销售审核与客户','2025-12-08 16:13:21',2),(5,'销售专员','sales_staff','负责开销售单','2025-12-08 16:13:21',3),(6,'库管员','stock_mgr','负责仓库与库存查询','2025-12-08 16:13:21',2);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2006251748702543875 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (77,6,230),(78,6,231),(79,6,232),(80,6,233),(81,6,501),(84,6,230),(85,6,231),(86,6,232),(87,6,233),(88,6,501),(2003006623704657922,2,1004),(2003006623717240833,2,141),(2003006623725629441,2,2004),(2003006623734018050,2,231),(2003006623738212354,2,232),(2003006623746600962,2,233),(2003006623759183874,2,230),(2003006623767572482,2,2002),(2003006623775961089,2,211),(2003006623780155394,2,212),(2003006623784349697,2,210),(2003006623792738305,2,213),(2003006623796932609,2,2001),(2003006623801126914,2,201),(2003006623809515521,2,202),(2003006623817904130,2,203),(2003006623834681345,2,204),(2003006623843069954,2,3001),(2003006623847264258,2,302),(2003006623855652866,2,301),(2003006623864041473,2,303),(2003006623868235778,2,304),(2003006623876624386,2,305),(2003006623880818690,2,3003),(2003006623885012994,2,501),(2003006623889207298,2,100),(2003006623897595905,2,200),(2003006623905984514,2,300),(2003014762332110850,3,201),(2003014762348888066,3,302),(2003014762365665282,3,301),(2003014762374053889,3,303),(2003014762378248193,3,304),(2003014762390831106,3,3003),(2003014762407608322,3,501),(2003014762415996930,3,200),(2003014762424385538,3,2001),(2003014762432774145,3,300),(2003014762436968450,3,3001),(2005917577383706626,5,201),(2005917577396289538,5,402),(2005917577400483842,5,401),(2005917577404678146,5,403),(2005917577408872449,5,404),(2005917577417261058,5,3003),(2005917577421455361,5,501),(2005917577425649666,5,200),(2005917577429843970,5,2001),(2005917577434038273,5,300),(2005917577442426881,5,3002),(2006251748530577410,4,1004),(2006251748551548930,4,141),(2006251748555743234,4,2003),(2006251748559937538,4,221),(2006251748572520449,4,222),(2006251748580909058,4,223),(2006251748589297666,4,220),(2006251748593491969,4,2001),(2006251748597686273,4,201),(2006251748606074882,4,202),(2006251748610269186,4,203),(2006251748614463489,4,204),(2006251748618657794,4,3002),(2006251748627046401,4,402),(2006251748635435010,4,401),(2006251748648017921,4,403),(2006251748652212226,4,404),(2006251748656406530,4,405),(2006251748660600833,4,3003),(2006251748668989441,4,501),(2006251748677378049,4,900),(2006251748681572354,4,901),(2006251748689960962,4,100),(2006251748698349569,4,200),(2006251748702543874,4,300);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码(加密)',
  `real_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '真实姓名',
  `avatar` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态(1:正常 0:禁用)',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除(1:已删)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dept_id` bigint(20) DEFAULT '100' COMMENT '部门id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1994253713126707202,'admin','$2a$10$HsoGqhxdv8AVrm/LWSAJDOmOHSrnSdpKyMlHoh/2P8wQ9wRUVneNy','管理员大哥',NULL,1,0,'2025-11-28 11:55:11','2025-12-16 17:17:21',100),(1994613502713217026,'zhangsan','$2a$10$HsoGqhxdv8AVrm/LWSAJDOmOHSrnSdpKyMlHoh/2P8wQ9wRUVneNy','张三',NULL,0,1,'2025-11-29 11:44:51','2025-12-16 17:17:21',100),(1996509907719528449,'zhou_ke','$2a$10$HsoGqhxdv8AVrm/LWSAJDOmOHSrnSdpKyMlHoh/2P8wQ9wRUVneNy','粥可',NULL,1,0,'2025-12-04 17:20:30','2025-12-16 17:17:21',104),(2002986028275302401,'alice','$2a$10$jBCBE.JnJ.BNIjWxn41H9OTHtXBaGevCgmJ/Mkdd.Yj2EKX/9Qqbe','Alice',NULL,1,0,'2025-12-22 14:14:17','2025-12-22 14:14:17',2001576384491393025),(2002986283683250178,'bob','$2a$10$jwBrEZRswJmUYfU0DCYcA.N2flyY7jD8apBQj6KKDO.EiGjH28sKa','Bob',NULL,1,0,'2025-12-22 14:15:18','2025-12-22 14:15:18',2001576384491393025),(2003022926733520898,'jack','$2a$10$PJRiLuwj2RIs7FyzxKa99O3Pko8d5LPwtSRNe/1JDjlnumkE/yHhW','捷克尔',NULL,1,0,'2025-12-22 16:40:54','2025-12-22 16:40:54',2001576384491393025),(2005915515270922242,'rick','$2a$10$LGWJMnlMULUJ.pHoIL6Kvek73UYhK2ix7QZ1z8o78r5ax/OzEDocS','瑞可',NULL,1,0,'2025-12-30 16:15:01','2025-12-30 16:15:01',104),(2005915899687272450,'ross','$2a$10$Kv44PFs7ndsvTnqY9DC/beqpqgLpzjbaJT3oPsX3xWPxhtZv5C82e','柔斯',NULL,1,0,'2025-12-30 16:16:33','2025-12-30 16:16:33',104);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2005916113248649219 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1994253713126707202,1),(2000818608685146113,1996509907719528449,5),(2002986077885530114,2002986028275302401,3),(2002986312376483842,2002986283683250178,2),(2003022977170026497,2003022926733520898,3),(2005915609164611586,2005915515270922242,4),(2005916113248649218,2005915899687272450,5);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'kerp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-08 11:43:10
