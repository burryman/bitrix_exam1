-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: exam1
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `b_admin_notify`
--

DROP TABLE IF EXISTS `b_admin_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_admin_notify` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `ENABLE_CLOSE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `PUBLIC_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NOTIFY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_AD_TAG` (`TAG`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_admin_notify`
--

LOCK TABLES `b_admin_notify` WRITE;
/*!40000 ALTER TABLE `b_admin_notify` DISABLE KEYS */;
INSERT INTO `b_admin_notify` VALUES (1,'MAIN','SITE_CHECKER','Обнаружены ошибки в работе сайта. <a href=\"/bitrix/admin/site_checker.php?lang=ru&start_test=Y\">Проверить и исправить.</a>','Y','N','M');
/*!40000 ALTER TABLE `b_admin_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_admin_notify_lang`
--

DROP TABLE IF EXISTS `b_admin_notify_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_admin_notify_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NOTIFY_ID` int(18) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_ADM_NTFY_LANG` (`NOTIFY_ID`,`LID`),
  KEY `IX_ADM_NTFY_LID` (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_admin_notify_lang`
--

LOCK TABLES `b_admin_notify_lang` WRITE;
/*!40000 ALTER TABLE `b_admin_notify_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_admin_notify_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_agent`
--

DROP TABLE IF EXISTS `b_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_agent` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `NAME` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int(18) DEFAULT '86400',
  `IS_PERIOD` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `USER_ID` int(18) DEFAULT NULL,
  `RUNNING` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_act_next_exec` (`ACTIVE`,`NEXT_EXEC`),
  KEY `ix_agent_user_id` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_agent`
--

LOCK TABLES `b_agent` WRITE;
/*!40000 ALTER TABLE `b_agent` DISABLE KEYS */;
INSERT INTO `b_agent` VALUES (1,'main',100,'CEvent::CleanUpAgent();','Y','2017-09-14 09:55:36','2017-09-15 00:00:00',NULL,86400,'Y',NULL,'N'),(2,'main',100,'CUser::CleanUpHitAuthAgent();','Y','2017-09-14 09:55:36','2017-09-15 00:00:00',NULL,86400,'Y',NULL,'N'),(3,'main',100,'CCaptchaAgent::DeleteOldCaptcha(3600);','Y','2017-09-14 09:55:36','2017-09-14 10:55:36',NULL,3600,'N',NULL,'N'),(4,'main',100,'CUndo::CleanUpOld();','Y','2017-09-14 09:55:37','2017-09-15 00:00:00',NULL,86400,'Y',NULL,'N'),(5,'main',100,'CSiteCheckerTest::CommonTest();','Y','2017-09-14 10:03:18','2017-09-15 10:03:18',NULL,86400,'N',NULL,'N'),(6,'main',100,'\\Bitrix\\Main\\Analytics\\CounterDataTable::submitData();','Y','2017-09-14 10:07:52','2017-09-14 10:08:52',NULL,60,'N',NULL,'N'),(7,'forum',100,'CForumStat::CleanUp();','Y','2017-09-14 10:03:18','2017-09-15 10:03:18',NULL,86400,'N',NULL,'N'),(8,'forum',100,'CForumFiles::CleanUp();','Y','2017-09-14 10:03:18','2017-09-15 10:03:18',NULL,86400,'N',NULL,'N'),(9,'search',10,'CSearchSuggest::CleanUpAgent();','Y','2017-09-14 10:03:18','2017-09-15 10:03:18',NULL,86400,'N',NULL,'N'),(10,'search',10,'CSearchStatistic::CleanUpAgent();','Y','2017-09-14 10:03:18','2017-09-15 10:03:18',NULL,86400,'N',NULL,'N'),(11,'security',100,'CSecuritySession::CleanUpAgent();','Y','2017-09-14 09:55:38','2017-09-14 10:25:38',NULL,1800,'N',NULL,'N'),(12,'security',100,'CSecurityIPRule::CleanUpAgent();','Y','2017-09-14 09:55:38','2017-09-14 10:55:38',NULL,3600,'N',NULL,'N'),(13,'seo',100,'Bitrix\\Seo\\Engine\\YandexDirect::updateAgent();','Y','2017-09-14 09:55:39','2017-09-14 10:55:39',NULL,3600,'N',NULL,'N'),(14,'seo',100,'Bitrix\\Seo\\Adv\\LogTable::clean();','Y','2017-09-14 10:03:18','2017-09-15 10:03:18',NULL,86400,'N',NULL,'N'),(15,'seo',100,'Bitrix\\Seo\\Adv\\Auto::checkQuantityAgent();','Y','2017-09-14 09:55:39','2017-09-14 10:55:39',NULL,3600,'N',NULL,'N'),(16,'subscribe',100,'CSubscription::CleanUp();','Y','2017-09-14 09:55:39','2017-09-15 03:00:00',NULL,86400,'Y',NULL,'N'),(20,'socialservices',100,'CSocServMessage::CleanUp();','Y','2017-09-14 10:03:07','2017-09-15 10:03:07',NULL,86400,'N',NULL,'N');
/*!40000 ALTER TABLE `b_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_app_password`
--

DROP TABLE IF EXISTS `b_app_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_app_password` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DIGEST_PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SYSCOMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_app_password_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_app_password`
--

LOCK TABLES `b_app_password` WRITE;
/*!40000 ALTER TABLE `b_app_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_app_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_b24connector_buttons`
--

DROP TABLE IF EXISTS `b_b24connector_buttons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_b24connector_buttons` (
  `ID` int(11) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `ADD_DATE` datetime NOT NULL,
  `ADD_BY` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SCRIPT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_b24connector_buttons`
--

LOCK TABLES `b_b24connector_buttons` WRITE;
/*!40000 ALTER TABLE `b_b24connector_buttons` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_b24connector_buttons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_bitrixcloud_option`
--

DROP TABLE IF EXISTS `b_bitrixcloud_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_bitrixcloud_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL,
  `PARAM_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM_VALUE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_bitrixcloud_option_1` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_bitrixcloud_option`
--

LOCK TABLES `b_bitrixcloud_option` WRITE;
/*!40000 ALTER TABLE `b_bitrixcloud_option` DISABLE KEYS */;
INSERT INTO `b_bitrixcloud_option` VALUES (1,'backup_quota',0,'0','0'),(2,'backup_total_size',0,'0','0'),(3,'backup_last_backup_time',0,'0','1504872203'),(4,'monitoring_expire_time',0,'0','1505374179');
/*!40000 ALTER TABLE `b_bitrixcloud_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog`
--

DROP TABLE IF EXISTS `b_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` int(11) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REAL_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `ENABLE_COMMENTS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ENABLE_IMG_VERIF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENABLE_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_POST_ID` int(11) DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `AUTO_GROUPS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_NOTIFY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SEARCH_INDEX` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `USE_SOCNET` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_BLOG_4` (`URL`),
  KEY `IX_BLOG_BLOG_1` (`GROUP_ID`,`ACTIVE`),
  KEY `IX_BLOG_BLOG_2` (`OWNER_ID`),
  KEY `IX_BLOG_BLOG_5` (`LAST_POST_DATE`),
  KEY `IX_BLOG_BLOG_6` (`SOCNET_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog`
--

LOCK TABLES `b_blog` WRITE;
/*!40000 ALTER TABLE `b_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_category`
--

DROP TABLE IF EXISTS `b_blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_CAT_1` (`BLOG_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_category`
--

LOCK TABLES `b_blog_category` WRITE;
/*!40000 ALTER TABLE `b_blog_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_comment`
--

DROP TABLE IF EXISTS `b_blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `ICON_ID` int(11) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_TEXT` text COLLATE utf8_unicode_ci NOT NULL,
  `PUBLISH_STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `HAS_PROPS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHARE_DEST` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_COMM_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_COMM_2` (`AUTHOR_ID`),
  KEY `IX_BLOG_COMM_3` (`DATE_CREATE`,`AUTHOR_ID`),
  KEY `IX_BLOG_COMM_4` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_comment`
--

LOCK TABLES `b_blog_comment` WRITE;
/*!40000 ALTER TABLE `b_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_group`
--

DROP TABLE IF EXISTS `b_blog_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_GROUP_1` (`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_group`
--

LOCK TABLES `b_blog_group` WRITE;
/*!40000 ALTER TABLE `b_blog_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_image`
--

DROP TABLE IF EXISTS `b_blog_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_image` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(11) NOT NULL DEFAULT '0',
  `BLOG_ID` int(11) NOT NULL DEFAULT '0',
  `POST_ID` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_SIZE` int(11) NOT NULL DEFAULT '0',
  `IS_COMMENT` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMMENT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_IMAGE_1` (`POST_ID`,`BLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_image`
--

LOCK TABLES `b_blog_image` WRITE;
/*!40000 ALTER TABLE `b_blog_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_post`
--

DROP TABLE IF EXISTS `b_blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `AUTHOR_ID` int(11) NOT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci,
  `PREVIEW_TEXT_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_TEXT` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `DETAIL_TEXT_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DATE_CREATE` datetime NOT NULL,
  `DATE_PUBLISH` datetime NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PUBLISH_STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `CATEGORY_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATRIBUTE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENABLE_TRACKBACK` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ENABLE_COMMENTS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `NUM_COMMENTS` int(11) NOT NULL DEFAULT '0',
  `NUM_COMMENTS_ALL` int(11) NOT NULL DEFAULT '0',
  `NUM_TRACKBACKS` int(11) NOT NULL DEFAULT '0',
  `VIEWS` int(11) DEFAULT NULL,
  `FAVORITE_SORT` int(11) DEFAULT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MICRO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `HAS_IMAGES` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_PROPS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_TAGS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_COMMENT_IMAGES` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_SOCNET_ALL` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_DESCRIPTION` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_POST_1` (`BLOG_ID`,`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_2` (`BLOG_ID`,`DATE_PUBLISH`,`PUBLISH_STATUS`),
  KEY `IX_BLOG_POST_3` (`BLOG_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_4` (`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_5` (`DATE_PUBLISH`,`AUTHOR_ID`),
  KEY `IX_BLOG_POST_CODE` (`BLOG_ID`,`CODE`),
  KEY `IX_BLOG_POST_6` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_post`
--

LOCK TABLES `b_blog_post` WRITE;
/*!40000 ALTER TABLE `b_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_post_category`
--

DROP TABLE IF EXISTS `b_blog_post_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_post_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_POST_CATEGORY` (`POST_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_CATEGORY_CAT_ID` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_post_category`
--

LOCK TABLES `b_blog_post_category` WRITE;
/*!40000 ALTER TABLE `b_blog_post_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_post_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_post_param`
--

DROP TABLE IF EXISTS `b_blog_post_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_post_param` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_PP_1` (`POST_ID`,`USER_ID`),
  KEY `IX_BLOG_PP_2` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_post_param`
--

LOCK TABLES `b_blog_post_param` WRITE;
/*!40000 ALTER TABLE `b_blog_post_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_post_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_site_path`
--

DROP TABLE IF EXISTS `b_blog_site_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_site_path` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SITE_PATH_2` (`SITE_ID`,`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_site_path`
--

LOCK TABLES `b_blog_site_path` WRITE;
/*!40000 ALTER TABLE `b_blog_site_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_site_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_socnet`
--

DROP TABLE IF EXISTS `b_blog_socnet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_socnet` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SOCNET` (`BLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_socnet`
--

LOCK TABLES `b_blog_socnet` WRITE;
/*!40000 ALTER TABLE `b_blog_socnet` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_socnet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_socnet_rights`
--

DROP TABLE IF EXISTS `b_blog_socnet_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_socnet_rights` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) NOT NULL,
  `ENTITY_TYPE` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ENTITY` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_SR_1` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_socnet_rights`
--

LOCK TABLES `b_blog_socnet_rights` WRITE;
/*!40000 ALTER TABLE `b_blog_socnet_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_socnet_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_trackback`
--

DROP TABLE IF EXISTS `b_blog_trackback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_trackback` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci NOT NULL,
  `BLOG_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_DATE` datetime NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_TRBK_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_TRBK_2` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_trackback`
--

LOCK TABLES `b_blog_trackback` WRITE;
/*!40000 ALTER TABLE `b_blog_trackback` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_trackback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_user`
--

DROP TABLE IF EXISTS `b_blog_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `AVATAR` int(11) DEFAULT NULL,
  `INTERESTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `DATE_REG` datetime NOT NULL,
  `ALLOW_POST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER_1` (`USER_ID`),
  KEY `IX_BLOG_USER_2` (`ALIAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_user`
--

LOCK TABLES `b_blog_user` WRITE;
/*!40000 ALTER TABLE `b_blog_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_user2blog`
--

DROP TABLE IF EXISTS `b_blog_user2blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_user2blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`BLOG_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_user2blog`
--

LOCK TABLES `b_blog_user2blog` WRITE;
/*!40000 ALTER TABLE `b_blog_user2blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user2blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_user2user_group`
--

DROP TABLE IF EXISTS `b_blog_user2user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_user2user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`USER_ID`,`BLOG_ID`,`USER_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_user2user_group`
--

LOCK TABLES `b_blog_user2user_group` WRITE;
/*!40000 ALTER TABLE `b_blog_user2user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user2user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_user_group`
--

DROP TABLE IF EXISTS `b_blog_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_USER_GROUP_1` (`BLOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_user_group`
--

LOCK TABLES `b_blog_user_group` WRITE;
/*!40000 ALTER TABLE `b_blog_user_group` DISABLE KEYS */;
INSERT INTO `b_blog_user_group` VALUES (1,NULL,'all'),(2,NULL,'registered');
/*!40000 ALTER TABLE `b_blog_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_user_group_perms`
--

DROP TABLE IF EXISTS `b_blog_user_group_perms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_user_group_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  `PERMS_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `POST_ID` int(11) DEFAULT NULL,
  `PERMS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `AUTOSET` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_UG_PERMS_1` (`BLOG_ID`,`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_2` (`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_3` (`POST_ID`,`USER_GROUP_ID`,`PERMS_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_user_group_perms`
--

LOCK TABLES `b_blog_user_group_perms` WRITE;
/*!40000 ALTER TABLE `b_blog_user_group_perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user_group_perms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_cache_tag`
--

DROP TABLE IF EXISTS `b_cache_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_cache_tag` (
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SALT` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  KEY `ix_b_cache_tag_1` (`TAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_cache_tag`
--

LOCK TABLES `b_cache_tag` WRITE;
/*!40000 ALTER TABLE `b_cache_tag` DISABLE KEYS */;
INSERT INTO `b_cache_tag` VALUES (NULL,NULL,'0:1505372588','**'),('s1','/e25','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/e25','/s1/bitrix/news.list/06f','iblock_id_1'),('s1','/e25','/s1/bitrix/furniture.catalog.random/06f','iblock_id_2'),('s1','/e25','/s1/bitrix/furniture.catalog.index/e25','iblock_id_2'),('s1','/e25','/s1/bitrix/furniture.catalog.index/e25','iblock_id_3'),('s1','/315','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/315','/s1/bitrix/news.list/06f','iblock_id_1'),('s1','/315','/s1/bitrix/furniture.catalog.random/06f','iblock_id_2'),('s1','/6f8','/s1/bitrix/menu.sections/6f8','iblock_id_2'),('s1','/6d1','/s1/bitrix/catalog.section','iblock_id_3'),('s1','/be5','/s1/bitrix/catalog.section','iblock_id_2'),('s1','/fc1','/s1/bitrix/news.list/fc1','iblock_id_1'),('s1','/6f8','/s1/bitrix/furniture.catalog.random/06f','iblock_id_2'),('s1','/312','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/312','/s1/bitrix/news.list/06f','iblock_id_1'),('s1','/312','/s1/bitrix/furniture.catalog.random/06f','iblock_id_2'),('s1','/6f8','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/6f8','/s1/bitrix/news.list/06f','iblock_id_1'),('s1','/6d1','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/6d1','/s1/bitrix/news.list/06f','iblock_id_1'),('s1','/6d1','/s1/bitrix/furniture.catalog.random/06f','iblock_id_2'),('s1','/be5','/s1/bitrix/furniture.catalog.random/06f','iblock_id_2'),('s1','/9f3','/s1/bitrix/furniture.catalog.random/06f','iblock_id_2'),('s1','/9f3','/s1/bitrix/furniture.catalog.index/9f3','iblock_id_2'),('s1','/9f3','/s1/bitrix/furniture.catalog.index/9f3','iblock_id_3'),('s1','/9f3','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/9f3','/s1/bitrix/news.list/06f','iblock_id_1'),('s1','/be5','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/be5','/s1/bitrix/news.list/06f','iblock_id_1'),('s1','/fc1','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/fc1','/s1/bitrix/news.list/06f','iblock_id_1'),('s1','/fc1','/s1/bitrix/furniture.catalog.random/06f','iblock_id_2'),('s1','/400','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/400','/s1/bitrix/news.list/06f','iblock_id_1'),('s1','/400','/s1/bitrix/furniture.catalog.random/06f','iblock_id_2'),('s1','/969','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/969','/s1/bitrix/news.list/06f','iblock_id_1'),('s1','/969','/s1/bitrix/furniture.catalog.random/06f','iblock_id_2'),('s1','/aff','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/aff','/s1/bitrix/news.list/06f','iblock_id_1'),('s1','/aff','/s1/bitrix/furniture.catalog.random/06f','iblock_id_2'),('s1','/b32','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/b32','/s1/bitrix/news.list/06f','iblock_id_1'),('s1','/b32','/s1/bitrix/furniture.catalog.random/06f','iblock_id_2'),('s1','/501','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/501','/s1/bitrix/news.list/06f','iblock_id_1'),('s1','/501','/s1/bitrix/furniture.catalog.random/06f','iblock_id_2'),('s1','/400','/s1/bitrix/menu.sections/400','iblock_id_2'),('s1','/6d1','/s1/bitrix/catalog.section.list/6d1','iblock_id_3'),('s1','/be5','/s1/bitrix/catalog.section.list/be5','iblock_id_2'),('s1','/be5','/s1/bitrix/menu.sections/345','iblock_id_2'),('s1','/abd','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/bde','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/b68','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/7d3','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/7d3','/s1/bitrix/furniture.vacancies/7d3','iblock_id_4'),('s1','/643','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/643','/s1/bitrix/search.tags.cloud/643','bitrix:search.tags.cloud'),('s1','/220','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/fc1','/s1/bitrix/news.detail/fc1','iblock_id_1'),('s1','/643','/s1/bitrix/news.list/643','iblock_id_5'),('s1','/643','/s1/bitrix/news.detail/643','iblock_id_5'),('s1','/74c','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/869','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/994','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/23c','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/23c','/s1/bitrix/menu.sections/23c','iblock_id_2'),('s1','/e50','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/f62','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/f2e','/s1/bitrix/menu.sections/06f','iblock_id_2'),('s1','/6d1','/s1/bitrix/menu/06f','bitrix:menu'),('s1','/ca7','/s1/bitrix/menu.sections/06f','iblock_id_2');
/*!40000 ALTER TABLE `b_cache_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_captcha`
--

DROP TABLE IF EXISTS `b_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_captcha` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  UNIQUE KEY `UX_B_CAPTCHA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_captcha`
--

LOCK TABLES `b_captcha` WRITE;
/*!40000 ALTER TABLE `b_captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_checklist`
--

DROP TABLE IF EXISTS `b_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_checklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CREATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TESTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPANY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `SUCCESS` int(11) DEFAULT NULL,
  `FAILED` int(11) DEFAULT NULL,
  `PENDING` int(11) DEFAULT NULL,
  `SKIP` int(11) DEFAULT NULL,
  `STATE` longtext COLLATE utf8_unicode_ci,
  `REPORT_COMMENT` text COLLATE utf8_unicode_ci,
  `REPORT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENDED_TO_BITRIX` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_checklist`
--

LOCK TABLES `b_checklist` WRITE;
/*!40000 ALTER TABLE `b_checklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_clouds_file_bucket`
--

DROP TABLE IF EXISTS `b_clouds_file_bucket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_clouds_file_bucket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(11) DEFAULT '500',
  `READ_ONLY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SERVICE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCATION` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CNAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_COUNT` int(11) DEFAULT '0',
  `FILE_SIZE` float DEFAULT '0',
  `LAST_FILE_ID` int(11) DEFAULT NULL,
  `PREFIX` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `FILE_RULES` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_clouds_file_bucket`
--

LOCK TABLES `b_clouds_file_bucket` WRITE;
/*!40000 ALTER TABLE `b_clouds_file_bucket` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_bucket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_clouds_file_resize`
--

DROP TABLE IF EXISTS `b_clouds_file_resize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_clouds_file_resize` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ERROR_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `FILE_ID` int(11) DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `FROM_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_file_resize_ts` (`TIMESTAMP_X`),
  KEY `ix_b_file_resize_path` (`TO_PATH`(100)),
  KEY `ix_b_file_resize_file` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_clouds_file_resize`
--

LOCK TABLES `b_clouds_file_resize` WRITE;
/*!40000 ALTER TABLE `b_clouds_file_resize` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_resize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_clouds_file_upload`
--

DROP TABLE IF EXISTS `b_clouds_file_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_clouds_file_upload` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` int(11) DEFAULT NULL,
  `TMP_FILE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `PART_SIZE` int(11) NOT NULL,
  `PART_NO` int(11) NOT NULL,
  `PART_FAIL_COUNTER` int(11) NOT NULL,
  `NEXT_STEP` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_clouds_file_upload`
--

LOCK TABLES `b_clouds_file_upload` WRITE;
/*!40000 ALTER TABLE `b_clouds_file_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_component_params`
--

DROP TABLE IF EXISTS `b_component_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_component_params` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `COMPONENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TEMPLATE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REAL_PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SEF_MODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SEF_FOLDER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_CHAR` int(11) NOT NULL,
  `END_CHAR` int(11) NOT NULL,
  `PARAMETERS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_comp_params_name` (`COMPONENT_NAME`),
  KEY `ix_comp_params_path` (`SITE_ID`,`REAL_PATH`),
  KEY `ix_comp_params_sname` (`SITE_ID`,`COMPONENT_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_component_params`
--

LOCK TABLES `b_component_params` WRITE;
/*!40000 ALTER TABLE `b_component_params` DISABLE KEYS */;
INSERT INTO `b_component_params` VALUES (19,'s1','bitrix:menu','horizontal_multilevel','/bitrix/templates/furniture_pale-blue/header.php','N',NULL,1384,1858,'a:11:{s:14:\"ROOT_MENU_TYPE\";s:3:\"top\";s:9:\"MAX_LEVEL\";s:1:\"3\";s:15:\"CHILD_MENU_TYPE\";s:4:\"left\";s:7:\"USE_EXT\";s:1:\"Y\";s:15:\"MENU_CACHE_TYPE\";s:1:\"A\";s:15:\"MENU_CACHE_TIME\";s:8:\"36000000\";s:21:\"MENU_CACHE_USE_GROUPS\";s:1:\"Y\";s:19:\"MENU_CACHE_GET_VARS\";N;s:18:\"COMPONENT_TEMPLATE\";s:21:\"horizontal_multilevel\";s:5:\"DELAY\";s:1:\"N\";s:18:\"ALLOW_MULTI_SELECT\";s:1:\"N\";}'),(20,'s1','bitrix:menu','left','/bitrix/templates/furniture_pale-blue/header.php','N',NULL,2656,3097,'a:11:{s:14:\"ROOT_MENU_TYPE\";s:4:\"left\";s:15:\"MENU_CACHE_TYPE\";s:1:\"A\";s:15:\"MENU_CACHE_TIME\";s:8:\"36000000\";s:21:\"MENU_CACHE_USE_GROUPS\";s:1:\"Y\";s:19:\"MENU_CACHE_GET_VARS\";N;s:9:\"MAX_LEVEL\";s:1:\"1\";s:15:\"CHILD_MENU_TYPE\";s:4:\"left\";s:7:\"USE_EXT\";s:1:\"Y\";s:18:\"ALLOW_MULTI_SELECT\";s:1:\"N\";s:18:\"COMPONENT_TEMPLATE\";s:4:\"left\";s:5:\"DELAY\";s:1:\"N\";}'),(21,'s1','bitrix:search.form','flat','/bitrix/templates/furniture_pale-blue/header.php','N',NULL,3422,3534,'a:1:{s:4:\"PAGE\";s:17:\"#SITE_DIR#search/\";}'),(39,'s1','bitrix:menu','left','/local/templates/exam1/footer.php','N',NULL,257,654,'a:11:{s:18:\"ALLOW_MULTI_SELECT\";s:1:\"N\";s:15:\"CHILD_MENU_TYPE\";s:4:\"left\";s:18:\"COMPONENT_TEMPLATE\";s:4:\"left\";s:5:\"DELAY\";s:1:\"N\";s:9:\"MAX_LEVEL\";s:1:\"1\";s:19:\"MENU_CACHE_GET_VARS\";N;s:15:\"MENU_CACHE_TIME\";s:4:\"3600\";s:15:\"MENU_CACHE_TYPE\";s:1:\"N\";s:21:\"MENU_CACHE_USE_GROUPS\";s:1:\"Y\";s:14:\"ROOT_MENU_TYPE\";s:4:\"left\";s:7:\"USE_EXT\";s:1:\"Y\";}'),(75,'s1','bitrix:news','reviews','/rew/index.php','Y','/rew/',98,2767,'a:79:{s:17:\"ADD_ELEMENT_CHAIN\";s:1:\"N\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"Y\";s:9:\"AJAX_MODE\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:13:\"BROWSER_TITLE\";s:1:\"-\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:18:\"COMPONENT_TEMPLATE\";s:7:\"reviews\";s:25:\"DETAIL_ACTIVE_DATE_FORMAT\";s:5:\"j M Y\";s:27:\"DETAIL_DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:24:\"DETAIL_DISPLAY_TOP_PAGER\";s:1:\"N\";s:17:\"DETAIL_FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:21:\"DETAIL_PAGER_SHOW_ALL\";s:1:\"N\";s:21:\"DETAIL_PAGER_TEMPLATE\";s:0:\"\";s:18:\"DETAIL_PAGER_TITLE\";s:16:\"Страница\";s:20:\"DETAIL_PROPERTY_CODE\";a:4:{i:0;s:8:\"POSITION\";i:1;s:7:\"COMPANY\";i:2;s:11:\"[DOCUMENTS]\";i:3;s:0:\"\";}s:24:\"DETAIL_SET_CANONICAL_URL\";s:1:\"N\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:12:\"DISPLAY_DATE\";s:1:\"Y\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"N\";s:9:\"IBLOCK_ID\";s:1:\"5\";s:11:\"IBLOCK_TYPE\";s:7:\"reviews\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"Y\";s:23:\"LIST_ACTIVE_DATE_FORMAT\";s:5:\"j F Y\";s:15:\"LIST_FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:18:\"LIST_PROPERTY_CODE\";a:3:{i:0;s:8:\"POSITION\";i:1;s:7:\"COMPANY\";i:2;s:0:\"\";}s:11:\"MESSAGE_404\";s:0:\"\";s:16:\"META_DESCRIPTION\";s:1:\"-\";s:13:\"META_KEYWORDS\";s:1:\"-\";s:10:\"NEWS_COUNT\";s:1:\"2\";s:22:\"PAGER_BASE_LINK_ENABLE\";s:1:\"N\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:5:\"36000\";s:14:\"PAGER_SHOW_ALL\";s:1:\"Y\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:8:\".default\";s:11:\"PAGER_TITLE\";s:12:\"Отзывы\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:0:\"\";s:8:\"SEF_MODE\";s:1:\"Y\";s:17:\"SET_LAST_MODIFIED\";s:1:\"N\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"Y\";s:8:\"SHOW_404\";s:1:\"N\";s:8:\"SORT_BY1\";s:11:\"ACTIVE_FROM\";s:8:\"SORT_BY2\";s:4:\"SORT\";s:11:\"SORT_ORDER1\";s:4:\"DESC\";s:11:\"SORT_ORDER2\";s:3:\"ASC\";s:20:\"STRICT_SECTION_CHECK\";s:1:\"N\";s:14:\"USE_CATEGORIES\";s:1:\"N\";s:10:\"USE_FILTER\";s:1:\"N\";s:15:\"USE_PERMISSIONS\";s:1:\"N\";s:10:\"USE_RATING\";s:1:\"N\";s:10:\"USE_REVIEW\";s:1:\"N\";s:7:\"USE_RSS\";s:1:\"N\";s:10:\"USE_SEARCH\";s:1:\"N\";s:9:\"USE_SHARE\";s:1:\"N\";s:19:\"TAGS_CLOUD_ELEMENTS\";s:3:\"150\";s:15:\"PERIOD_NEW_TAGS\";s:0:\"\";s:17:\"DISPLAY_AS_RATING\";s:6:\"rating\";s:8:\"FONT_MAX\";s:2:\"50\";s:8:\"FONT_MIN\";s:2:\"10\";s:9:\"COLOR_NEW\";s:6:\"3E74E6\";s:9:\"COLOR_OLD\";s:6:\"C0C0C0\";s:16:\"TAGS_CLOUD_WIDTH\";s:4:\"100%\";s:14:\"TEMPLATE_THEME\";s:4:\"blue\";s:14:\"MEDIA_PROPERTY\";s:0:\"\";s:15:\"SLIDER_PROPERTY\";s:0:\"\";s:10:\"SEF_FOLDER\";s:5:\"/rew/\";s:17:\"SEF_URL_TEMPLATES\";a:3:{s:4:\"news\";s:0:\"\";s:7:\"section\";s:0:\"\";s:6:\"detail\";s:15:\"#ELEMENT_CODE#/\";}}'),(76,'s1','bitrix:search.page','clear','/search/index.php','N',NULL,99,1581,'a:39:{s:7:\"RESTART\";s:1:\"N\";s:11:\"CHECK_DATES\";s:1:\"N\";s:14:\"USE_TITLE_RANK\";s:1:\"N\";s:12:\"DEFAULT_SORT\";s:4:\"rank\";s:9:\"arrFILTER\";a:7:{i:0;s:4:\"main\";i:1;s:5:\"forum\";i:2;s:15:\"iblock_products\";i:3;s:16:\"iblock_vacancies\";i:4;s:14:\"iblock_reviews\";i:5;s:4:\"blog\";i:6;s:9:\"microblog\";}s:10:\"SHOW_WHERE\";s:1:\"N\";s:9:\"SHOW_WHEN\";s:1:\"N\";s:17:\"PAGE_RESULT_COUNT\";s:1:\"5\";s:9:\"AJAX_MODE\";s:1:\"N\";s:18:\"AJAX_OPTION_SHADOW\";s:1:\"Y\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:11:\"PAGER_TITLE\";s:33:\"Результаты поиска\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:6:\"arrows\";s:11:\"USE_SUGGEST\";s:1:\"N\";s:14:\"SHOW_ITEM_TAGS\";s:1:\"N\";s:21:\"SHOW_ITEM_DATE_CHANGE\";s:1:\"N\";s:13:\"SHOW_ORDER_BY\";s:1:\"N\";s:15:\"SHOW_TAGS_CLOUD\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:18:\"COMPONENT_TEMPLATE\";s:5:\"clear\";s:13:\"NO_WORD_LOGIC\";s:1:\"N\";s:11:\"FILTER_NAME\";s:0:\"\";s:14:\"arrFILTER_main\";N;s:15:\"arrFILTER_forum\";a:1:{i:0;s:3:\"all\";}s:25:\"arrFILTER_iblock_products\";a:1:{i:0;s:3:\"all\";}s:26:\"arrFILTER_iblock_vacancies\";a:1:{i:0;s:3:\"all\";}s:24:\"arrFILTER_iblock_reviews\";a:1:{i:0;s:3:\"all\";}s:14:\"arrFILTER_blog\";a:1:{i:0;s:3:\"all\";}s:18:\"USE_LANGUAGE_GUESS\";s:1:\"Y\";s:11:\"SHOW_RATING\";s:0:\"\";s:11:\"RATING_TYPE\";s:0:\"\";s:20:\"PATH_TO_USER_PROFILE\";s:0:\"\";}'),(77,'s1','bitrix:main.register','','/user/registration.php','N',NULL,103,182,'a:0:{}'),(82,'s1','bitrix:main.profile','','/login/user.php','N',NULL,104,306,'a:5:{s:12:\"CHECK_RIGHTS\";s:1:\"N\";s:9:\"SEND_INFO\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"Y\";s:13:\"USER_PROPERTY\";N;s:18:\"USER_PROPERTY_NAME\";s:0:\"\";}'),(90,'s1','bitrix:system.auth.form','demo','/local/templates/exam1/header.php','N',NULL,2287,2548,'a:5:{s:18:\"COMPONENT_TEMPLATE\";s:4:\"demo\";s:19:\"FORGOT_PASSWORD_URL\";s:0:\"\";s:11:\"PROFILE_URL\";s:15:\"/login/user.php\";s:12:\"REGISTER_URL\";s:19:\"/login/register.php\";s:11:\"SHOW_ERRORS\";s:1:\"N\";}'),(91,'s1','bitrix:menu','top_menu','/local/templates/exam1/header.php','N',NULL,2694,3242,'a:11:{s:18:\"ALLOW_MULTI_SELECT\";s:1:\"N\";s:15:\"CHILD_MENU_TYPE\";s:4:\"left\";s:18:\"COMPONENT_TEMPLATE\";s:8:\"top_menu\";s:5:\"DELAY\";s:1:\"N\";s:9:\"MAX_LEVEL\";s:1:\"3\";s:19:\"MENU_CACHE_GET_VARS\";N;s:15:\"MENU_CACHE_TIME\";s:4:\"3600\";s:15:\"MENU_CACHE_TYPE\";s:1:\"N\";s:21:\"MENU_CACHE_USE_GROUPS\";s:1:\"Y\";s:14:\"ROOT_MENU_TYPE\";s:3:\"top\";s:7:\"USE_EXT\";s:1:\"Y\";}'),(92,'s1','bitrix:main.register','','/login/register.php','N',NULL,103,182,'a:0:{}');
/*!40000 ALTER TABLE `b_component_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_consent_agreement`
--

DROP TABLE IF EXISTS `b_consent_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_consent_agreement` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA_PROVIDER` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AGREEMENT_TEXT` longtext COLLATE utf8_unicode_ci,
  `LABEL_TEXT` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_AGREEMENT_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_consent_agreement`
--

LOCK TABLES `b_consent_agreement` WRITE;
/*!40000 ALTER TABLE `b_consent_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_consent_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_consent_field`
--

DROP TABLE IF EXISTS `b_consent_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_consent_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `AGREEMENT_ID` int(18) NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_FIELD_AG_ID` (`AGREEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_consent_field`
--

LOCK TABLES `b_consent_field` WRITE;
/*!40000 ALTER TABLE `b_consent_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_consent_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_consent_user_consent`
--

DROP TABLE IF EXISTS `b_consent_user_consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_consent_user_consent` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `AGREEMENT_ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGIN_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGINATOR_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_USER_CONSENT` (`AGREEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_consent_user_consent`
--

LOCK TABLES `b_consent_user_consent` WRITE;
/*!40000 ALTER TABLE `b_consent_user_consent` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_consent_user_consent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_counter_data`
--

DROP TABLE IF EXISTS `b_counter_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_counter_data` (
  `ID` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_counter_data`
--

LOCK TABLES `b_counter_data` WRITE;
/*!40000 ALTER TABLE `b_counter_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_counter_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_culture`
--

DROP TABLE IF EXISTS `b_culture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_culture` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(1) DEFAULT '1',
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_culture`
--

LOCK TABLES `b_culture` WRITE;
/*!40000 ALTER TABLE `b_culture` DISABLE KEYS */;
INSERT INTO `b_culture` VALUES (1,'ru','ru','DD.MM.YYYY','DD.MM.YYYY HH:MI:SS','#NAME# #LAST_NAME#',1,'UTF-8','Y'),(2,'en','en','MM/DD/YYYY','MM/DD/YYYY H:MI:SS T','#NAME# #LAST_NAME#',0,'UTF-8','Y');
/*!40000 ALTER TABLE `b_culture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event`
--

DROP TABLE IF EXISTS `b_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` int(18) DEFAULT NULL,
  `LID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_FIELDS` longtext COLLATE utf8_unicode_ci,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_success` (`SUCCESS_EXEC`),
  KEY `ix_b_event_date_exec` (`DATE_EXEC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event`
--

LOCK TABLES `b_event` WRITE;
/*!40000 ALTER TABLE `b_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_attachment`
--

DROP TABLE IF EXISTS `b_event_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_attachment` (
  `EVENT_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  `IS_FILE_COPIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`EVENT_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_attachment`
--

LOCK TABLES `b_event_attachment` WRITE;
/*!40000 ALTER TABLE `b_event_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_event_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_log`
--

DROP TABLE IF EXISTS `b_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_log` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SEVERITY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `GUEST_ID` int(18) DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_log_time` (`TIMESTAMP_X`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_log`
--

LOCK TABLES `b_event_log` WRITE;
/*!40000 ALTER TABLE `b_event_log` DISABLE KEYS */;
INSERT INTO `b_event_log` VALUES (1,'2017-09-08 12:10:55','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Fcontacts%2F&path=%2F&name=top&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:2:{s:9:\"menu_name\";s:23:\"Верхнее меню\";s:4:\"path\";b:0;}'),(2,'2017-09-08 12:19:00','UNKNOWN','PAGE_ADD','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=furniture_pale-blue&path=%2F&back_url=%2F&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:1:{s:4:\"path\";s:18:\"become-partner.php\";}'),(3,'2017-09-08 12:19:00','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=furniture_pale-blue&path=%2F&back_url=%2F&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:2:{s:4:\"path\";b:0;s:9:\"menu_name\";s:19:\"Левое меню\";}'),(4,'2017-09-08 12:19:04','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:18:\"become-partner.php\";}'),(5,'2017-09-08 12:19:41','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Fbecome-partner.php&path=%2F&name=left&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:2:{s:9:\"menu_name\";s:19:\"Левое меню\";s:4:\"path\";b:0;}'),(6,'2017-09-08 12:20:28','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Fpartners%2F&path=%2F&name=left&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:2:{s:9:\"menu_name\";s:19:\"Левое меню\";s:4:\"path\";b:0;}'),(7,'2017-09-08 12:23:22','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Fservices%2F%3Fclear_cache%3DY&path=%2F&name=left&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:2:{s:9:\"menu_name\";s:19:\"Левое меню\";s:4:\"path\";b:0;}'),(8,'2017-09-08 12:37:42','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Fpartners%2F%3Fclear_cache_session%3DY%26show_page_exec_time%3DN%26show_include_exec_time%3DN%26show_sql_stat%3DY&path=%2F&name=left&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:2:{s:9:\"menu_name\";s:19:\"Левое меню\";s:4:\"path\";b:0;}'),(9,'2017-09-11 07:32:40','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Ftimetable%2F&path=%2F&name=top&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:2:{s:9:\"menu_name\";s:23:\"Верхнее меню\";s:4:\"path\";b:0;}'),(10,'2017-09-11 07:38:06','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Ftimetable%2F&path=%2F&name=top&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:2:{s:9:\"menu_name\";s:23:\"Верхнее меню\";s:4:\"path\";b:0;}'),(11,'2017-09-11 07:43:18','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Ftimetable%2F&path=%2Ftimetable%2F&name=left&siteTemplateId=furniture_pale-blue',NULL,1,NULL,'a:2:{s:9:\"menu_name\";s:19:\"Левое меню\";s:4:\"path\";s:9:\"timetable\";}'),(12,'2017-09-12 07:13:55','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:27:\"partners/become-partner.php\";}'),(13,'2017-09-12 07:17:51','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:27:\"partners/become-partner.php\";}'),(14,'2017-09-12 07:46:45','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:27:\"partners/become-partner.php\";}'),(15,'2017-09-12 07:48:54','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:27:\"partners/become-partner.php\";}'),(16,'2017-09-12 07:51:45','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:27:\"partners/become-partner.php\";}'),(17,'2017-09-12 07:54:19','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:27:\"partners/become-partner.php\";}'),(18,'2017-09-12 07:54:48','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:27:\"partners/become-partner.php\";}'),(19,'2017-09-12 07:55:28','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:27:\"partners/become-partner.php\";}'),(20,'2017-09-12 07:58:03','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:27:\"partners/become-partner.php\";}'),(21,'2017-09-12 07:58:19','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:27:\"partners/become-partner.php\";}'),(22,'2017-09-12 08:05:53','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:27:\"partners/become-partner.php\";}'),(23,'2017-09-12 08:16:04','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Fnews%2F%3Fbitrix_include_areas%3DY&path=%2F&name=left&siteTemplateId=exam1',NULL,1,NULL,'a:2:{s:9:\"menu_name\";s:19:\"Левое меню\";s:4:\"path\";b:0;}'),(24,'2017-09-12 08:39:34','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:18:\"partners/index.php\";}'),(25,'2017-09-12 08:57:47','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:27:\"partners/become-partner.php\";}'),(26,'2017-09-12 09:32:29','UNKNOWN','MENU_EDIT','fileman','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/fileman_menu_edit.php?',NULL,1,NULL,'a:2:{s:9:\"menu_name\";s:23:\"Верхнее меню\";s:4:\"path\";b:0;}'),(27,'2017-09-12 11:45:26','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Fcompany%2Fmission.php%3Fbitrix_include_areas%3DY%26login%3Dyes&path=%2F&name=top&siteTemplateId=exam1',NULL,1,NULL,'a:2:{s:9:\"menu_name\";s:23:\"Верхнее меню\";s:4:\"path\";b:0;}'),(28,'2017-09-12 11:56:50','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:13:\"rew/index.php\";}'),(29,'2017-09-12 11:58:29','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:13:\"rew/index.php\";}'),(30,'2017-09-12 12:12:30','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:13:\"rew/index.php\";}'),(31,'2017-09-12 12:51:47','UNKNOWN','IBLOCK_ELEMENT_EDIT','iblock','5','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/iblock_element_edit.php?IBLOCK_ID=5&type=reviews&lang=ru&find_section_section=-1',NULL,1,NULL,'a:6:{s:2:\"ID\";i:35;s:4:\"CODE\";s:15:\"dmitriya-pyalov\";s:4:\"NAME\";s:25:\"Дмитрия Пялов\";s:12:\"ELEMENT_NAME\";s:14:\"Элемент\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:20:\"/demo/index.php?ID=5\";}'),(32,'2017-09-13 07:19:36','UNKNOWN','IBLOCK_ELEMENT_EDIT','iblock','5','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/iblock_element_edit.php?IBLOCK_ID=5&type=reviews&lang=ru&find_section_section=-1',NULL,1,NULL,'a:6:{s:2:\"ID\";i:35;s:4:\"CODE\";s:15:\"dmitriya-pyalov\";s:4:\"NAME\";s:25:\"Дмитрия Пялов\";s:12:\"ELEMENT_NAME\";s:14:\"Элемент\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:20:\"/demo/index.php?ID=5\";}'),(33,'2017-09-13 08:08:58','UNKNOWN','IBLOCK_ELEMENT_ADD','iblock','5','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/iblock_element_edit.php?IBLOCK_ID=5&type=reviews&lang=ru&find_section_section=-1',NULL,1,NULL,'a:6:{s:2:\"ID\";i:36;s:4:\"CODE\";s:16:\"konstantin-ernst\";s:4:\"NAME\";s:31:\"Константин Эрнст\";s:12:\"ELEMENT_NAME\";s:14:\"Элемент\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:20:\"/demo/index.php?ID=5\";}'),(34,'2017-09-13 08:09:22','UNKNOWN','IBLOCK_ELEMENT_EDIT','iblock','5','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/iblock_element_edit.php?IBLOCK_ID=5&type=reviews&lang=ru&find_section_section=-1',NULL,1,NULL,'a:6:{s:2:\"ID\";i:36;s:4:\"CODE\";s:16:\"konstantin-ernst\";s:4:\"NAME\";s:31:\"Константин Эрнст\";s:12:\"ELEMENT_NAME\";s:14:\"Элемент\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:20:\"/demo/index.php?ID=5\";}'),(35,'2017-09-13 08:10:42','UNKNOWN','IBLOCK_ELEMENT_EDIT','iblock','5','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/iblock_element_edit.php?IBLOCK_ID=5&type=reviews&lang=ru&find_section_section=-1',NULL,1,NULL,'a:6:{s:2:\"ID\";i:36;s:4:\"CODE\";s:16:\"konstantin-ernst\";s:4:\"NAME\";s:31:\"Константин Эрнст\";s:12:\"ELEMENT_NAME\";s:14:\"Элемент\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:20:\"/demo/index.php?ID=5\";}'),(36,'2017-09-13 08:12:14','UNKNOWN','IBLOCK_ELEMENT_EDIT','iblock','5','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/iblock_element_edit.php?IBLOCK_ID=5&type=reviews&lang=ru&find_section_section=-1',NULL,1,NULL,'a:6:{s:2:\"ID\";i:36;s:4:\"CODE\";s:16:\"konstantin-ernst\";s:4:\"NAME\";s:31:\"Константин Эрнст\";s:12:\"ELEMENT_NAME\";s:14:\"Элемент\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:20:\"/demo/index.php?ID=5\";}'),(37,'2017-09-13 08:19:36','UNKNOWN','IBLOCK_ELEMENT_ADD','iblock','5','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/iblock_element_edit.php?IBLOCK_ID=5&type=reviews&lang=ru&find_section_section=0',NULL,1,NULL,'a:6:{s:2:\"ID\";i:37;s:4:\"CODE\";s:8:\"vaypyvpy\";s:4:\"NAME\";s:16:\"ваыпывпы\";s:12:\"ELEMENT_NAME\";s:14:\"Элемент\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:20:\"/demo/index.php?ID=5\";}'),(38,'2017-09-13 08:19:53','UNKNOWN','IBLOCK_ELEMENT_DELETE','iblock','5','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/iblock_element_admin.php?IBLOCK_ID=5&type=reviews&lang=ru&action=delete&ID=37&return_url=%2Frew%2F%3FPAGEN_1%3D2%26clear_cache%3DY',NULL,1,NULL,'a:6:{s:2:\"ID\";i:37;s:4:\"CODE\";s:8:\"vaypyvpy\";s:4:\"NAME\";s:16:\"ваыпывпы\";s:12:\"ELEMENT_NAME\";s:14:\"Элемент\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:20:\"/demo/index.php?ID=5\";}'),(39,'2017-09-13 08:33:36','UNKNOWN','IBLOCK_ELEMENT_EDIT','iblock','5','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/iblock_element_edit.php?IBLOCK_ID=5&type=reviews&lang=ru&find_section_section=0',NULL,1,NULL,'a:6:{s:2:\"ID\";i:33;s:4:\"CODE\";s:15:\"cergey-rodionov\";s:4:\"NAME\";s:28:\"Cергей Родионов\";s:12:\"ELEMENT_NAME\";s:14:\"Элемент\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:20:\"/demo/index.php?ID=5\";}'),(40,'2017-09-13 08:34:00','UNKNOWN','IBLOCK_ELEMENT_EDIT','iblock','5','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/iblock_element_edit.php?IBLOCK_ID=5&type=reviews&lang=ru&find_section_section=-1',NULL,1,NULL,'a:6:{s:2:\"ID\";i:36;s:4:\"CODE\";s:16:\"konstantin-ernst\";s:4:\"NAME\";s:31:\"Константин Эрнст\";s:12:\"ELEMENT_NAME\";s:14:\"Элемент\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:20:\"/demo/index.php?ID=5\";}'),(41,'2017-09-13 08:34:13','UNKNOWN','IBLOCK_ELEMENT_EDIT','iblock','5','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/iblock_element_edit.php?IBLOCK_ID=5&type=reviews&lang=ru&find_section_section=-1',NULL,1,NULL,'a:6:{s:2:\"ID\";i:33;s:4:\"CODE\";s:15:\"cergey-rodionov\";s:4:\"NAME\";s:28:\"Cергей Родионов\";s:12:\"ELEMENT_NAME\";s:14:\"Элемент\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:20:\"/demo/index.php?ID=5\";}'),(42,'2017-09-13 09:14:15','UNKNOWN','IBLOCK_ELEMENT_EDIT','iblock','5','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/iblock_element_edit.php?IBLOCK_ID=5&type=reviews&lang=ru&find_section_section=0',NULL,1,NULL,'a:6:{s:2:\"ID\";i:36;s:4:\"CODE\";s:16:\"konstantin-ernst\";s:4:\"NAME\";s:31:\"Константин Эрнст\";s:12:\"ELEMENT_NAME\";s:14:\"Элемент\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:20:\"/demo/index.php?ID=5\";}'),(43,'2017-09-13 10:27:52','UNKNOWN','IBLOCK_ELEMENT_EDIT','iblock','5','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/iblock_element_edit.php?IBLOCK_ID=5&type=reviews&lang=ru&find_section_section=-1',NULL,1,NULL,'a:6:{s:2:\"ID\";i:36;s:4:\"CODE\";s:16:\"konstantin-ernst\";s:4:\"NAME\";s:31:\"Константин Эрнст\";s:12:\"ELEMENT_NAME\";s:14:\"Элемент\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:20:\"/demo/index.php?ID=5\";}'),(44,'2017-09-13 10:40:44','UNKNOWN','IBLOCK_ELEMENT_ADD','iblock','5','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/iblock_element_edit.php?IBLOCK_ID=5&type=reviews&lang=ru&find_section_section=0',NULL,1,NULL,'a:6:{s:2:\"ID\";i:37;s:4:\"CODE\";s:6:\"avyayp\";s:4:\"NAME\";s:12:\"авыаып\";s:12:\"ELEMENT_NAME\";s:14:\"Элемент\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:20:\"/demo/index.php?ID=5\";}'),(45,'2017-09-13 10:46:58','UNKNOWN','IBLOCK_ELEMENT_DELETE','iblock','5','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/iblock_element_admin.php?IBLOCK_ID=5&type=reviews&lang=ru&action=delete&ID=37&return_url=%2Frew%2F%3Fclear_cache%3DY',NULL,1,NULL,'a:6:{s:2:\"ID\";i:37;s:4:\"CODE\";s:6:\"avyayp\";s:4:\"NAME\";s:12:\"авыаып\";s:12:\"ELEMENT_NAME\";s:14:\"Элемент\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:20:\"/demo/index.php?ID=5\";}'),(46,'2017-09-13 12:10:31','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Frew%2Fkonstantin-ernst%2F%3Fsphrase_id%3D1&path=%2F&name=top&siteTemplateId=exam1',NULL,1,NULL,'a:2:{s:9:\"menu_name\";s:23:\"Верхнее меню\";s:4:\"path\";b:0;}'),(47,'2017-09-13 12:10:46','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Frew%2Fkonstantin-ernst%2F%3Fsphrase_id%3D1%26clear_cache%3DY&path=%2F&name=top&siteTemplateId=exam1',NULL,1,NULL,'a:2:{s:9:\"menu_name\";s:23:\"Верхнее меню\";s:4:\"path\";b:0;}'),(48,'2017-09-13 12:11:08','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Fsearch%2F&path=%2F&name=top&siteTemplateId=exam1',NULL,1,NULL,'a:2:{s:9:\"menu_name\";s:23:\"Верхнее меню\";s:4:\"path\";b:0;}'),(49,'2017-09-13 12:32:03','UNKNOWN','PAGE_ADD','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=exam1&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=exam1',NULL,1,NULL,'a:1:{s:4:\"path\";s:14:\"user/index.php\";}'),(50,'2017-09-13 12:32:03','UNKNOWN','SECTION_ADD','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=exam1&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=exam1',NULL,1,NULL,'a:1:{s:4:\"path\";s:4:\"user\";}'),(51,'2017-09-13 12:32:11','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:14:\"user/index.php\";}'),(52,'2017-09-13 12:32:34','UNKNOWN','PAGE_ADD','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=exam1&path=%2Fuser%2F&back_url=%2Fuser%2F%3Fclear_cache%3DY&siteTemplateId=exam1',NULL,1,NULL,'a:1:{s:4:\"path\";s:21:\"user/registration.php\";}'),(53,'2017-09-13 12:33:09','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:21:\"user/registration.php\";}'),(54,'2017-09-13 12:34:49','UNKNOWN','PAGE_ADD','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=exam1&path=%2Fuser%2F&back_url=%2Fuser%2F&siteTemplateId=exam1',NULL,1,NULL,'a:1:{s:4:\"path\";s:16:\"user/profiel.php\";}'),(55,'2017-09-13 12:34:49','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=exam1&path=%2Fuser%2F&back_url=%2Fuser%2F&siteTemplateId=exam1',NULL,1,NULL,'a:2:{s:4:\"path\";s:4:\"user\";s:9:\"menu_name\";s:19:\"Левое меню\";}'),(56,'2017-09-13 12:35:34','UNKNOWN','MENU_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Fuser%2F&path=%2Fuser%2F&name=left&siteTemplateId=exam1',NULL,1,NULL,'a:2:{s:9:\"menu_name\";s:19:\"Левое меню\";s:4:\"path\";s:4:\"user\";}'),(57,'2017-09-13 12:47:24','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:27:\"partners/become-partner.php\";}'),(58,'2017-09-13 12:52:57','UNKNOWN','PAGE_ADD','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=exam1&path=%2Flogin%2F&back_url=%2Flogin%2F&siteTemplateId=exam1',NULL,1,NULL,'a:1:{s:4:\"path\";s:14:\"login/user.php\";}'),(59,'2017-09-13 12:53:12','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:14:\"login/user.php\";}'),(60,'2017-09-13 13:12:29','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:15:\"login/index.php\";}'),(61,'2017-09-13 13:13:41','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:15:\"login/index.php\";}'),(62,'2017-09-13 13:16:10','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:14:\"user/index.php\";}'),(63,'2017-09-13 13:18:56','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:14:\"user/index.php\";}'),(64,'2017-09-13 13:26:19','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:27:\"partners/become-partner.php\";}'),(65,'2017-09-13 13:36:59','UNKNOWN','PAGE_ADD','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=exam1&path=%2Flogin%2F&back_url=%2Flogin%2F&siteTemplateId=exam1',NULL,1,NULL,'a:1:{s:4:\"path\";s:18:\"login/register.php\";}'),(66,'2017-09-13 13:37:15','UNKNOWN','PAGE_EDIT','main','UNKNOWN','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36','/bitrix/admin/public_file_edit.php','s1',1,NULL,'a:1:{s:4:\"path\";s:18:\"login/register.php\";}');
/*!40000 ALTER TABLE `b_event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_message`
--

DROP TABLE IF EXISTS `b_event_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci,
  `MESSAGE_PHP` longtext COLLATE utf8_unicode_ci,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BCC` text COLLATE utf8_unicode_ci,
  `REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CC` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRIORITY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_FIELD` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_message`
--

LOCK TABLES `b_event_message` WRITE;
/*!40000 ALTER TABLE `b_event_message` DISABLE KEYS */;
INSERT INTO `b_event_message` VALUES (1,'2017-09-08 11:54:35','NEW_USER','s1','Y','#DEFAULT_EMAIL_FROM#','#DEFAULT_EMAIL_FROM#','#SITE_NAME#: Зарегистрировался новый пользователь','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте #SERVER_NAME# успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: #USER_ID#\n\nИмя: #NAME#\nФамилия: #LAST_NAME#\nE-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nПисьмо сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНа сайте <?=$arParams[\"SERVER_NAME\"];?> успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\n\nИмя: <?=$arParams[\"NAME\"];?>\n\nФамилия: <?=$arParams[\"LAST_NAME\"];?>\n\nE-Mail: <?=$arParams[\"EMAIL\"];?>\n\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nПисьмо сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(2,'2017-09-08 11:54:35','USER_INFO','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Регистрационная информация','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(3,'2017-09-08 11:54:35','USER_PASS_REQUEST','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Запрос на смену пароля','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(4,'2017-09-08 11:54:35','USER_PASS_CHANGED','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Подтверждение смены пароля','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(5,'2017-09-08 11:54:35','NEW_USER_CONFIRM','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Подтверждение регистрации нового пользователя','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере #SERVER_NAME#.\n\nВаш код для подтверждения регистрации: #CONFIRM_CODE#\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере <?=$arParams[\"SERVER_NAME\"];?>.\n\nВаш код для подтверждения регистрации: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>&confirm_code=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>\n\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(6,'2017-09-08 11:54:35','USER_INVITE','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Приглашение на сайт','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\nЗдравствуйте, #NAME# #LAST_NAME#!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: #ID#\nLogin: #LOGIN#\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\nЗдравствуйте, <?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"ID\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth.php?change_password=yes&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>\n\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(7,'2017-09-08 11:54:35','FEEDBACK_FORM','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: Сообщение из формы обратной связи','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: #AUTHOR#\nE-mail автора: #AUTHOR_EMAIL#\n\nТекст сообщения:\n#TEXT#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nE-mail автора: <?=$arParams[\"AUTHOR_EMAIL\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"TEXT\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(8,'2017-09-08 11:54:48','NEW_BLOG_MESSAGE','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] #BLOG_NAME# : #MESSAGE_TITLE#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение в блоге \"#BLOG_NAME#\"\n\nТема:\n#MESSAGE_TITLE#\n\nАвтор: #AUTHOR#\nДата: #MESSAGE_DATE#\n\nТекст сообщения:\n#MESSAGE_TEXT#\n\nАдрес сообщения:\n#MESSAGE_PATH#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовое сообщение в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\"\n\nТема:\n<?=$arParams[\"MESSAGE_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"MESSAGE_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"MESSAGE_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'2017-09-08 11:54:48','NEW_BLOG_COMMENT','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\"\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\"\n\nТема:\n<?=$arParams[\"COMMENT_TITLE\"];?>\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'2017-09-08 11:54:48','NEW_BLOG_COMMENT2COMMENT','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\".\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\".\n\nТема:\n<?=$arParams[\"COMMENT_TITLE\"];?>\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'2017-09-08 11:54:48','NEW_BLOG_COMMENT_WITHOUT_TITLE','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] #MESSAGE_TITLE#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\"\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\"\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'2017-09-08 11:54:48','NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] #MESSAGE_TITLE#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\".\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\".\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'2017-09-08 11:54:48','BLOG_YOUR_BLOG_TO_USER','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] Ваш блог \"#BLOG_NAME#\" был добавлен в друзья к #USER#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВаш блог \"#BLOG_NAME#\" был добавлен в друзья к #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВаш блог \"<?=$arParams[\"BLOG_NAME\"];?>\" был добавлен в друзья к <?=$arParams[\"USER\"];?>.\n\nПрофиль пользователя: <?=$arParams[\"USER_URL\"];?>\n\n\nАдрес вашего блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'2017-09-08 11:54:48','BLOG_YOU_TO_BLOG','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] Вы были добавлены в друзья блога \"#BLOG_NAME#\"','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы были добавлены в друзья блога \"#BLOG_NAME#\".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВы были добавлены в друзья блога \"<?=$arParams[\"BLOG_NAME\"];?>\".\n\nАдрес блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nВаш профиль: <?=$arParams[\"USER_URL\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'2017-09-08 11:54:48','BLOG_BLOG_TO_YOU','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] К вам в друзья был добавлен блог \"#BLOG_NAME#\"','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nК вам в друзья был добавлен блог \"#BLOG_NAME#\".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nК вам в друзья был добавлен блог \"<?=$arParams[\"BLOG_NAME\"];?>\".\n\nАдрес блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nВаш профиль: <?=$arParams[\"USER_URL\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'2017-09-08 11:54:48','BLOG_USER_TO_YOUR_BLOG','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] В ваш блог \"#BLOG_NAME#\" был добавлен друг #USER#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВ ваш блог \"#BLOG_NAME#\" был добавлен друг #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВ ваш блог \"<?=$arParams[\"BLOG_NAME\"];?>\" был добавлен друг <?=$arParams[\"USER\"];?>.\n\nПрофиль пользователя: <?=$arParams[\"USER_URL\"];?>\n\n\nАдрес вашего блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'2017-09-08 11:54:48','BLOG_SONET_NEW_POST','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#POST_TITLE#','<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post.mail\",\"\",Array(\"EMAIL_TO\" => \"{#EMAIL_TO#}\",\"RECIPIENT_ID\" => \"{#RECIPIENT_ID#}\",\"POST_ID\" => \"{#POST_ID#}\",\"URL\" => \"{#URL#}\"));?>','<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post.mail\",\"\",Array(\"EMAIL_TO\" => \"{$arParams[\'EMAIL_TO\']}\",\"RECIPIENT_ID\" => \"{$arParams[\'RECIPIENT_ID\']}\",\"POST_ID\" => \"{$arParams[\'POST_ID\']}\",\"URL\" => \"{$arParams[\'URL\']}\"));?>','html',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mail_user',NULL,NULL),(18,'2017-09-08 11:54:48','BLOG_SONET_NEW_COMMENT','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','Re: #POST_TITLE#','<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post.comment.mail\",\"\",Array(\"COMMENT_ID\" => \"{#COMMENT_ID#}\",\"RECIPIENT_ID\" => \"{#RECIPIENT_ID#}\",\"EMAIL_TO\" => \"{#EMAIL_TO#}\",\"POST_ID\" => \"{#POST_ID#}\",\"URL\" => \"{#URL#}\"));?>','<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post.comment.mail\",\"\",Array(\"COMMENT_ID\" => \"{$arParams[\'COMMENT_ID\']}\",\"RECIPIENT_ID\" => \"{$arParams[\'RECIPIENT_ID\']}\",\"EMAIL_TO\" => \"{$arParams[\'EMAIL_TO\']}\",\"POST_ID\" => \"{$arParams[\'POST_ID\']}\",\"URL\" => \"{$arParams[\'URL\']}\"));?>','html',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mail_user',NULL,NULL),(19,'2017-09-08 11:54:48','BLOG_SONET_POST_SHARE','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#POST_TITLE#','<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post_share.mail\",\"\",Array(\"EMAIL_TO\" => \"{#EMAIL_TO#}\",\"RECIPIENT_ID\" => \"{#RECIPIENT_ID#}\",\"POST_ID\" => \"{#POST_ID#}\",\"URL\" => \"{#URL#}\"));?>','<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post_share.mail\",\"\",Array(\"EMAIL_TO\" => \"{$arParams[\'EMAIL_TO\']}\",\"RECIPIENT_ID\" => \"{$arParams[\'RECIPIENT_ID\']}\",\"POST_ID\" => \"{$arParams[\'POST_ID\']}\",\"URL\" => \"{$arParams[\'URL\']}\"));?>','html',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mail_user',NULL,NULL),(20,'2017-09-08 11:54:48','BLOG_POST_BROADCAST','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: #MESSAGE_TITLE#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте добавлено новое сообщение.\n\nТема:\n#MESSAGE_TITLE#\n\nАвтор: #AUTHOR#\n\nТекст сообщения:\n#MESSAGE_TEXT#\n\nАдрес сообщения:\n#MESSAGE_PATH#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНа сайте добавлено новое сообщение.\n\nТема:\n<?=$arParams[\"MESSAGE_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"MESSAGE_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'2017-09-08 11:55:20','NEW_FORUM_MESSAGE','s1','Y','#FROM_EMAIL#','#RECIPIENT#','#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовое сообщение на форуме <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема:\n<?=$arParams[\"TOPIC_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата : <?=$arParams[\"MESSAGE_DATE\"];?>\n\nТекст сообщения:\n\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"PATH2FORUM\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'2017-09-08 11:55:20','NEW_FORUM_PRIV','s1','Y','#FROM_EMAIL#','#TO_EMAIL#','#SITE_NAME#: [private] #SUBJECT#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME# #FROM_EMAIL#\nДата : #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема: <?=$arParams[\"SUBJECT\"];?>\n\n\nАвтор: <?=$arParams[\"FROM_NAME\"];?> <?=$arParams[\"FROM_EMAIL\"];?>\n\nДата : <?=$arParams[\"MESSAGE_DATE\"];?>\n\nСообщение:\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'2017-09-08 11:55:20','NEW_FORUM_PRIVATE_MESSAGE','s1','Y','#FROM_EMAIL#','#TO_EMAIL#','#SITE_NAME#: [private] #SUBJECT#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME#\nДата: #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСсылка на сообщение: #MESSAGE_LINK#Сообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема: <?=$arParams[\"SUBJECT\"];?>\n\n\nАвтор: <?=$arParams[\"FROM_NAME\"];?>\n\nДата: <?=$arParams[\"MESSAGE_DATE\"];?>\n\nСообщение:\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nСсылка на сообщение: <?=$arParams[\"MESSAGE_LINK\"];?>Сообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'2017-09-08 11:55:20','EDIT_FORUM_MESSAGE','s1','Y','#FROM_EMAIL#','#RECIPIENT#','#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nИзменение сообщения на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nИзменение сообщения на форуме <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема:\n<?=$arParams[\"TOPIC_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата : <?=$arParams[\"MESSAGE_DATE\"];?>\n\nТекст сообщения:\n\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"PATH2FORUM\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'2017-09-08 11:55:20','FORUM_NEW_MESSAGE_MAIL','s1','Y','#FROM_EMAIL#','#RECIPIENT#','#TOPIC_TITLE#','#MESSAGE_TEXT#\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум #FORUM_NAME#.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nНаписать новое сообщение: #FORUM_EMAIL#\n\nАвтор сообщения: #AUTHOR#\n\nСообщение сгенерировано автоматически на сайте #SITE_NAME#.\n','<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум <?=$arParams[\"FORUM_NAME\"];?>.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"PATH2FORUM\"];?>\n\n\nНаписать новое сообщение: <?=$arParams[\"FORUM_EMAIL\"];?>\n\n\nАвтор сообщения: <?=$arParams[\"AUTHOR\"];?>\n\n\nСообщение сгенерировано автоматически на сайте <?=$arParams[\"SITE_NAME\"];?>.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'2017-09-08 11:55:53','VIRUS_DETECTED','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Обнаружен вирус','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера #SERVER_NAME# обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера <?=$arParams[\"SERVER_NAME\"];?> обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n','text','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'2017-09-08 11:56:16','SUBSCRIBE_CONFIRM','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Подтверждение подписки','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера #SERVER_NAME#.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ #EMAIL#\nДата добавления/редактирования .... #DATE_SUBSCR#\n\nВаш код для подтверждения подписки: #CONFIRM_CODE#\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nОтписаться:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера <?=$arParams[\"SERVER_NAME\"];?>.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ <?=$arParams[\"EMAIL\"];?>\n\nДата добавления/редактирования .... <?=$arParams[\"DATE_SUBSCR\"];?>\n\n\nВаш код для подтверждения подписки: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>&CONFIRM_CODE=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>\n\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>&CONFIRM_CODE=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nОтписаться:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>&CONFIRM_CODE=<?=$arParams[\"CONFIRM_CODE\"];?>&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n','text','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'2017-09-08 11:56:23','VOTE_FOR','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [V] #VOTE_TITLE#','#USER_NAME# принял участие в опросе \"#VOTE_TITLE#\":\n#VOTE_STATISTIC#\n\nhttp://#SERVER_NAME##URL#\nСообщение сгенерировано автоматически.','<?=$arParams[\"USER_NAME\"];?> принял участие в опросе \"<?=$arParams[\"VOTE_TITLE\"];?>\":\n<?=$arParams[\"VOTE_STATISTIC\"];?>\n\n\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"URL\"];?>\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `b_event_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_message_attachment`
--

DROP TABLE IF EXISTS `b_event_message_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_message_attachment` (
  `EVENT_MESSAGE_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_message_attachment`
--

LOCK TABLES `b_event_message_attachment` WRITE;
/*!40000 ALTER TABLE `b_event_message_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_event_message_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_message_site`
--

DROP TABLE IF EXISTS `b_event_message_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_message_site` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_message_site`
--

LOCK TABLES `b_event_message_site` WRITE;
/*!40000 ALTER TABLE `b_event_message_site` DISABLE KEYS */;
INSERT INTO `b_event_message_site` VALUES (1,'s1'),(2,'s1'),(3,'s1'),(4,'s1'),(5,'s1'),(6,'s1'),(7,'s1'),(8,'s1'),(9,'s1'),(10,'s1'),(11,'s1'),(12,'s1'),(13,'s1'),(14,'s1'),(15,'s1'),(16,'s1'),(17,'s1'),(18,'s1'),(19,'s1'),(20,'s1'),(21,'s1'),(22,'s1'),(23,'s1'),(24,'s1'),(25,'s1'),(26,'s1'),(27,'s1'),(28,'s1');
/*!40000 ALTER TABLE `b_event_message_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_type`
--

DROP TABLE IF EXISTS `b_event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_type` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(18) NOT NULL DEFAULT '150',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_type`
--

LOCK TABLES `b_event_type` WRITE;
/*!40000 ALTER TABLE `b_event_type` DISABLE KEYS */;
INSERT INTO `b_event_type` VALUES (1,'ru','NEW_USER','Зарегистрировался новый пользователь','\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n',1),(2,'ru','USER_INFO','Информация о пользователе','\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n',2),(3,'ru','NEW_USER_CONFIRM','Подтверждение регистрации нового пользователя','\n\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n#CONFIRM_CODE# - Код подтверждения\n',3),(4,'ru','USER_PASS_REQUEST','Запрос на смену пароля','\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n',4),(5,'ru','USER_PASS_CHANGED','Подтверждение смены пароля','\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n',5),(6,'ru','USER_INVITE','Приглашение на сайт нового пользователя','#ID# - ID пользователя\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#PASSWORD# - пароль пользователя \n#CHECKWORD# - Контрольная строка для смены пароля\n#XML_ID# - ID пользователя для связи с внешними источниками\n',6),(7,'ru','FEEDBACK_FORM','Отправка сообщения через форму обратной связи','#AUTHOR# - Автор сообщения\n#AUTHOR_EMAIL# - Email автора сообщения\n#TEXT# - Текст сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма',7),(8,'en','NEW_USER','New user was registered','\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n',1),(9,'en','USER_INFO','Account Information','\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n',2),(10,'en','NEW_USER_CONFIRM','New user registration confirmation','\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n',3),(11,'en','USER_PASS_REQUEST','Password Change Request','\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n',4),(12,'en','USER_PASS_CHANGED','Password Change Confirmation','\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n',5),(13,'en','USER_INVITE','Invitation of a new site user','#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n',6),(14,'en','FEEDBACK_FORM','Sending a message using a feedback form','#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address',7),(15,'ru','NEW_BLOG_MESSAGE','Новое сообщение в блоге','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#MESSAGE_DATE# - Дата сообщения\n#MESSAGE_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма',100),(16,'ru','NEW_BLOG_COMMENT','Новый комментарий в блоге','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма',100),(17,'ru','NEW_BLOG_COMMENT2COMMENT','Новый комментарий на ваш комментарий в блоге','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма',100),(18,'ru','NEW_BLOG_COMMENT_WITHOUT_TITLE','Новый комментарий в блоге (без темы)','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма',100),(19,'ru','NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE','Новый комментарий на ваш комментарий в блоге (без темы)','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма',100),(20,'ru','BLOG_YOUR_BLOG_TO_USER','Ваш блог был добавлен в друзья','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n',100),(21,'ru','BLOG_YOU_TO_BLOG','Вы были добавлены в друзья блога','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n',100),(22,'ru','BLOG_BLOG_TO_YOU','К вам в друзья был добавлен блог','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n',100),(23,'ru','BLOG_USER_TO_YOUR_BLOG','В ваш блог был добавлен друг','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n',100),(24,'ru','BLOG_SONET_NEW_POST','Добавлено новое сообщение','#EMAIL_TO# - Email получателя письма\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n',100),(25,'ru','BLOG_SONET_NEW_COMMENT','Добавлен новый комментарий','#EMAIL_TO# - Email получателя письма\n#COMMENT_ID# - ID комментария\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n',100),(26,'ru','BLOG_SONET_POST_SHARE','Добавлен новый получатель сообщения','#EMAIL_TO# - Email получателя письма\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n',100),(27,'ru','BLOG_POST_BROADCAST','Добавлено новое сообщение','\n#MESSAGE_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#MESSAGE_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_TO# - Email получателя письма',100),(28,'en','NEW_BLOG_MESSAGE','New blog message','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#MESSAGE_TEXT# - Message text\n#MESSAGE_DATE# - Message date\n#MESSAGE_PATH# - URL to message\n#AUTHOR# - Message author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email',100),(29,'en','NEW_BLOG_COMMENT','New comment in blog','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email',100),(30,'en','NEW_BLOG_COMMENT2COMMENT','New comment for your in blog','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email',100),(31,'en','NEW_BLOG_COMMENT_WITHOUT_TITLE','New comment in blog (without subject)','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email',100),(32,'en','NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE','New comment for your in blog (without subject)','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email',100),(33,'en','BLOG_YOUR_BLOG_TO_USER','Your blog has been added to friends','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail',100),(34,'en','BLOG_YOU_TO_BLOG','You have been added to blog friends','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail',100),(35,'en','BLOG_BLOG_TO_YOU','A blog has been added to your friends','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail',100),(36,'en','BLOG_USER_TO_YOUR_BLOG','A friend has been added to your blog','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail',100),(37,'en','BLOG_SONET_NEW_POST','New post added','#EMAIL_TO# - Recipient email\n#POST_ID# - Post ID\n#URL_ID# - Post URL',100),(38,'en','BLOG_SONET_NEW_COMMENT','Comment added','#EMAIL_TO# - Recipient email\n#COMMENT_ID# - Comment ID\n#POST_ID# - Post ID\n#URL_ID# - Post URL',100),(39,'en','BLOG_SONET_POST_SHARE','New recipient added','#EMAIL_TO# - Recipient email\n#POST_ID# - Post ID\n#URL_ID# - Post URL',100),(40,'en','BLOG_POST_BROADCAST','New post added','\n#MESSAGE_TITLE# - Post subject\n#MESSAGE_TEXT# - Post text \n#MESSAGE_PATH# - Post URL\n#AUTHOR# - Post author\n#EMAIL_TO# - E-mail recipient',100),(41,'ru','NEW_FORUM_MESSAGE','Новое сообщение на форуме','\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма',100),(42,'ru','NEW_FORUM_PRIV','Приватное письмо посетителю форума','\n			#FROM_NAME# - Автор сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Тело сообщения\n			#MESSAGE_DATE# - Дата сообщения',100),(43,'ru','NEW_FORUM_PRIVATE_MESSAGE','Приватное сообщение','\n			#FROM_NAME# - Имя автора сообщения\n			#FROM_USER_ID# - ID автора сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_USER_ID# - ID получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#MESSAGE_LINK# - Ссылка на сообщение',100),(44,'ru','EDIT_FORUM_MESSAGE','Изменение сообщения на форуме','\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма',100),(45,'en','NEW_FORUM_MESSAGE','New forum message','\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail',100),(46,'en','NEW_FORUM_PRIV','Private message for forum user','\n			#FROM_NAME# - Name of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date',100),(47,'en','NEW_FORUM_PRIVATE_MESSAGE','Private message for forum user','\n			#FROM_NAME# - Name of the sender\n			#FROM_USER_ID# - ID of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_USER_ID# - ID of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date\n			#MESSAGE_LINK# - Link to message',100),(48,'en','EDIT_FORUM_MESSAGE','Changing forum message','\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail',100),(49,'ru','FORUM_NEW_MESSAGE_MAIL','Новое сообщение на форуме в режиме общения по E-Mail','#FORUM_NAME# - Название форума\n#AUTHOR# - Автор сообщения\n#FROM_EMAIL# - E-Mail для поля From письма\n#RECIPIENT# - Получатель сообщения\n#TOPIC_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#PATH2FORUM# - Адрес сообщения\n#MESSAGE_DATE# - Дата сообщения\n#FORUM_EMAIL# - Е-Mail адрес для добавления сообщений на форум\n#FORUM_ID# - ID форума\n#TOPIC_ID# - ID темы \n#MESSAGE_ID# - ID сообщения\n#TAPPROVED# - Тема опубликована\n#MAPPROVED# - Сообщение опубликовано\n',100),(50,'en','FORUM_NEW_MESSAGE_MAIL','New message at the forum (e-mail messaging mode)','#FORUM_NAME# - Forum name\n#AUTHOR# - Message author\n#FROM_EMAIL# - E-Mail in the &amp;From&amp; field\n#RECIPIENT# - Message recipient\n#TOPIC_TITLE# - Message subject\n#MESSAGE_TEXT# - Message text\n#PATH2FORUM# - Message URL\n#MESSAGE_DATE# - Message date\n#FORUM_EMAIL# - E-Mail to add messages to the forum \n#FORUM_ID# - Forum ID\n#TOPIC_ID# - Topic ID \n#MESSAGE_ID# - Message ID\n#TAPPROVED# - Topic approved and published\n#MAPPROVED# - Message approved and published\n',100),(51,'ru','VIRUS_DETECTED','Обнаружен вирус','#EMAIL# - E-Mail администратора сайта (из настроек главного модуля)',100),(52,'en','VIRUS_DETECTED','Virus detected','#EMAIL# - Site administrator\'s e-mail address (from the Kernel module settings)',100),(53,'ru','SUBSCRIBE_CONFIRM','Подтверждение подписки','#ID# - идентификатор подписки\n#EMAIL# - адрес подписки\n#CONFIRM_CODE# - код подтверждения\n#SUBSCR_SECTION# - раздел, где находится страница редактирования подписки (задается в настройках)\n#USER_NAME# - имя подписчика (может отсутствовать)\n#DATE_SUBSCR# - дата добавления/изменения адреса\n',100),(54,'en','SUBSCRIBE_CONFIRM','Confirmation of subscription','#ID# - subscription ID\n#EMAIL# - subscription email\n#CONFIRM_CODE# - confirmation code\n#SUBSCR_SECTION# - section with subscription edit page (specifies in the settings)\n#USER_NAME# - subscriber\'s name (optional)\n#DATE_SUBSCR# - date of adding/change of address\n',100),(55,'ru','VOTE_FOR','Новый голос','#ID# - ID результата голосования\n#TIME# - время голосования\n#VOTE_TITLE# - наименование опроса\n#VOTE_DESCRIPTION# - описание опроса\n#VOTE_ID# - ID опроса\n#CHANNEL# - наименование группы опроса\n#CHANNEL_ID# - ID группы опроса\n#VOTER_ID# - ID проголосовавшего посетителя\n#USER_NAME# - ФИО пользователя\n#LOGIN# - логин\n#USER_ID# - ID пользователя\n#STAT_GUEST_ID# - ID посетителя модуля статистики\n#SESSION_ID# - ID сессии модуля статистики\n#IP# - IP адрес\n#VOTE_STATISTIC# - Сводная статистика опроса типа ( - Вопрос - Ответ )\n#URL# - Путь к опросу\n',100),(56,'en','VOTE_FOR','New vote','#ID# - Vote result ID\n#TIME# - Time of vote\n#VOTE_TITLE# - Poll name\n#VOTE_DESCRIPTION# - Poll description\n#VOTE_ID# - Poll ID\n#CHANNEL# - Poll group name\n#CHANNEL_ID# - Poll group ID\n#VOTER_ID# - Voter\'s user ID\n#USER_NAME# - User full name\n#LOGIN# - login\n#USER_ID# - User ID\n#STAT_GUEST_ID# - Visitor ID in web analytics module\n#SESSION_ID# - Session ID in web analytics module\n#IP# - IP address\n#VOTE_STATISTIC# - Summary statistics of this poll type ( - Question - Answer)\n#URL# - Poll URL',100);
/*!40000 ALTER TABLE `b_event_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_favorite`
--

DROP TABLE IF EXISTS `b_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_favorite` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `COMMENTS` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CODE_ID` int(18) DEFAULT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MENU_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_favorite`
--

LOCK TABLES `b_favorite` WRITE;
/*!40000 ALTER TABLE `b_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_file`
--

DROP TABLE IF EXISTS `b_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HEIGHT` int(18) DEFAULT NULL,
  `WIDTH` int(18) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ORIGINAL_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_file`
--

LOCK TABLES `b_file` WRITE;
/*!40000 ALTER TABLE `b_file` DISABLE KEYS */;
INSERT INTO `b_file` VALUES (1,'2017-09-08 12:00:41','iblock',97,117,7208,'image/gif','iblock/2c1','2c1e1e747659896e828232d43d84f41e.gif','9f643eecc497982747178145cc4736a4.gif','',NULL,'7d53fd6e5f9bdc2254bfd1b1fceb5cc4'),(2,'2017-09-08 12:00:42','iblock',97,118,6154,'image/gif','iblock/2c1','2c1d95cf9acb3bf07960272c11960a6d.gif','9baa9f7a5c946e28647383d6d4a7fed2.gif','',NULL,'b6bc62034164da446f42407ddaf4b5fd'),(3,'2017-09-08 12:00:43','iblock',97,115,7024,'image/gif','iblock/a0f','a0ff06511d0c709d6db8fbb673a24266.gif','3583b1ad0ff085c4fc5cc3ef35c117f5.gif','',NULL,'5e4d3c6be2f76c8e57707cc3b98287bd'),(4,'2017-09-08 12:00:44','iblock',97,117,8177,'image/gif','iblock/596','596a6164957ebce873ba7eaee8dd42a7.gif','e41c3f9d5834738bb4b1a8bda651989d.gif','',NULL,'d2052402cea29429468c1da2434056a8'),(5,'2017-09-08 12:00:46','iblock',75,82,6081,'image/jpeg','iblock/ffc','ffc1709bee72415eef342489a4e43b2e.jpg','2e602c1c22ccb832df21ad28ad5edaad.jpg','',NULL,'3d6953d644741f5422d2587a593c2263'),(6,'2017-09-08 12:00:46','iblock',365,400,93204,'image/jpeg','iblock/b95','b95c98242075ee05f5fd09ccf7fc5762.jpg','09812c445d3ee5f5311bbe7e44ee7d6f.jpg','',NULL,'5283ee24cd05daf110e03ab43f4bac3f'),(7,'2017-09-08 12:00:47','iblock',62,75,4431,'image/jpeg','iblock/323','3233a59ad3dd6c5e8b9a4fbb86f3559e.jpg','bb30381459dbbbe12e882e632f6b1c53.jpg','',NULL,'18bda3d93fb4e324c88431f8fe55d0d1'),(8,'2017-09-08 12:00:47','iblock',331,400,82283,'image/jpeg','iblock/6fa','6fafb57d399d27104277d16ce27bfbda.jpg','626ca8c573225d46d0b4d809cebb3dae.jpg','',NULL,'af7e00e83208f0d27fcfd0a586889b56'),(9,'2017-09-08 12:00:48','iblock',75,47,3075,'image/jpeg','iblock/455','4556dd50aee5f85be70038ea0fd40fdc.jpg','1f5d4439c837ba415e78b9645ae0d73b.jpg','',NULL,'0c1b03f1f8124195da9ef3ac403ece35'),(10,'2017-09-08 12:00:48','iblock',400,250,29739,'image/jpeg','iblock/702','702aecbdfb5a5802816244f43d2fa4c8.jpg','885f25305f6c920393bf447112730a32.jpg','',NULL,'e79d2e9452ccbd82571df4bf01852040'),(11,'2017-09-08 12:00:50','iblock',75,49,3038,'image/jpeg','iblock/b1d','b1ddbd38cce8ea46122e9868f301646f.jpg','ab929afb73ab299a22e03cc039569505.jpg','',NULL,'96374bba59bf9d261b8a02f6b2d6e71d'),(12,'2017-09-08 12:00:50','iblock',400,260,36309,'image/jpeg','iblock/a72','a72c687e071686ce13a953fdc66db581.jpg','f2bca316eede55098cab3bfda5b46697.jpg','',NULL,'0e1348b0e7b7e09d7f895c00090eeb96'),(13,'2017-09-08 12:00:51','iblock',75,46,2766,'image/jpeg','iblock/3c9','3c94cdcc0665785f82673624bae76062.jpg','74a072234e4b35fc24ee618bfc7dc98b.jpg','',NULL,'7c2658a279bd637b08512f9defd16f98'),(14,'2017-09-08 12:00:51','iblock',400,247,26265,'image/jpeg','iblock/1ab','1abbdb9f57ae366bf16d1eb46f9ac3a0.jpg','6237fa3331d46f6efe0409d7d24cdb25.jpg','',NULL,'273a4a3252059c2b9c58950688feb714'),(15,'2017-09-08 12:00:53','iblock',59,75,4604,'image/jpeg','iblock/d28','d281cc91ed759c468f40a4d326e03759.jpg','3392f27c38911965c60026ff9c0d3ef6.jpg','',NULL,'759ddcb28cfa28f4f738a771c5dea860'),(16,'2017-09-08 12:00:53','iblock',313,400,57378,'image/jpeg','iblock/bf0','bf08e3addbaf83ba02f54f321ae1e377.jpg','baee3922cc3b782c479845cd9a51aa2b.jpg','',NULL,'69062352802a2fb70aaf922a1d0bb827'),(17,'2017-09-08 12:00:54','iblock',49,75,3877,'image/jpeg','iblock/76f','76f4310e211e16700b36130f303155d2.jpg','2bdc35b67545840a286ee2ade1e53cf1.jpg','',NULL,'83e82da486d3aee8154ebe32013ee596'),(18,'2017-09-08 12:00:54','iblock',264,400,96792,'image/jpeg','iblock/69d','69d5c54e77013797a6c97bbb3ca8c40b.jpg','9444ca19815887874cfa5ccd2cf9b08e.jpg','',NULL,'7171e0094700d62bc27291c7b410b0d8'),(19,'2017-09-08 12:00:56','iblock',41,75,4223,'image/jpeg','iblock/108','1081830f29b7d6b8b81459bfd664e29a.jpg','9b1cf849b8732e25002db920755486e9.jpg','',NULL,'776636a0fe1dbc845ea9e0d40603e045'),(20,'2017-09-08 12:00:56','iblock',220,400,65934,'image/jpeg','iblock/587','58726bb87490bed7509bf467aae3baac.jpg','38f3bb38d0be153aa8233f8959141b8d.jpg','',NULL,'d5df0dc45acdde4cf226a92fac94045b'),(21,'2017-09-08 12:00:58','iblock',62,75,4454,'image/jpeg','iblock/9f3','9f3e6a40b18d28b6fb4aaa0e08b19417.jpg','d64f02c32d7aec7d187dfb4d6e89c56b.jpg','',NULL,'64d814c44c6d9745a83bfe53ca06bc87'),(22,'2017-09-08 12:00:58','iblock',329,400,78028,'image/jpeg','iblock/dc2','dc21f5302a20b73adb979f399882fbd5.jpg','445fcbf65c020dbaebf811a58b7ef941.jpg','',NULL,'8fd2f4574d12f852da313d5c3a909546'),(23,'2017-09-08 12:01:00','iblock',50,75,4281,'image/jpeg','iblock/17c','17ca7b8490949ab7c970ed846d79778b.jpg','4d4fcbcf706e07d5920751b96b2390a2.jpg','',NULL,'ca9a25c506a5bb072bfa2fb8f8f4f7b8'),(24,'2017-09-08 12:01:00','iblock',269,400,62994,'image/jpeg','iblock/a33','a3368349bd4cd99bd7e483d131a2f5cf.jpg','7412d2f4d2b8e91187d39405c1c331c0.jpg','',NULL,'1c2f06b8a9d08dc2e2bb913296db7781'),(25,'2017-09-08 12:01:02','iblock',32,75,2529,'image/jpeg','iblock/cc2','cc283875dc4da6991b0d574b6cd04f13.jpg','a20a430640daab0d2e80587a991043dc.jpg','',NULL,'2827ed6555e2ad7d1ab9fa05178fd86a'),(26,'2017-09-08 12:01:02','iblock',171,400,43694,'image/jpeg','iblock/f56','f5645e20a3e25d695bdeb4764485b5ed.jpg','2b671b45113c251546674131e9681c89.jpg','',NULL,'297208428a1f9ac7e704dc2d038fffc5'),(27,'2017-09-08 12:01:04','iblock',52,75,3543,'image/jpeg','iblock/d63','d636a5f302a946f858a5fc1d568d84c3.jpg','35962bde726c3ffaf7ccdfd9bb607379.jpg','',NULL,'d26bf387d81e2aee9bd568a2fbf9e9cf'),(28,'2017-09-08 12:01:04','iblock',276,400,45830,'image/jpeg','iblock/ccb','ccb8ce4e86a7d30166862a55b2e5cf76.jpg','1421f08c8613b257c93f95ca3fd2826d.jpg','',NULL,'da0fbd7b44de760571741022ef770e56'),(29,'2017-09-08 12:01:08','iblock',69,75,4545,'image/jpeg','iblock/6ac','6ac78c6f83c60c5f0bd8aea500887b1a.jpg','331184f76e4aafea8728856ad06f4487.jpg','',NULL,'7b930d7182ff8df315ab518e35639b70'),(30,'2017-09-08 12:01:08','iblock',366,400,50389,'image/jpeg','iblock/a64','a64e53d0dd288011511a3d2cb52cc585.jpg','e26a955a944250ca5980f143faaadfbb.jpg','',NULL,'eeb73a53c1dcf5b3e792efa2d615301b'),(31,'2017-09-08 12:01:12','iblock',52,75,4430,'image/jpeg','iblock/798','7984241bbc702a48b6a5ed01a8ac210b.jpg','3e84c9ae297f66002462ef2782524e1c.jpg','',NULL,'501bbf46014cb1d281b53ea7b83cd0c5'),(32,'2017-09-08 12:01:12','iblock',279,400,60160,'image/jpeg','iblock/80c','80cc75e49a0b6478db73ae828f7e46a9.jpg','16798358158a0c4e8e280370dad92e34.jpg','',NULL,'95830a915d346e71c4c149849c10afe1'),(33,'2017-09-08 12:01:14','iblock',75,74,5105,'image/jpeg','iblock/d41','d419fe6b6a85cefb2f82fda76476a088.jpg','809194f5dcf2a15a37cdcaa8e3abbe3d.jpg','',NULL,'c650d99532bef755d0ffa9335f470802'),(34,'2017-09-08 12:01:15','iblock',400,394,67705,'image/jpeg','iblock/525','525b33e7b89e7da7a886c81c6d5f28eb.jpg','2883876e37fde7403e471cc9a24ea3e7.jpg','',NULL,'a98e999a2533a72f0e0cb3849a67138e'),(35,'2017-09-08 12:01:16','iblock',75,54,3651,'image/jpeg','iblock/55b','55be6479cc1a659b891c44fb15bede70.jpg','434f471a7920ed00e08fb3916569e1f7.jpg','',NULL,'35315885e9c2132a90402689d9d98228'),(36,'2017-09-08 12:01:16','iblock',400,286,40331,'image/jpeg','iblock/933','933ebf6f87a1232f3612d5362ee9bb86.jpg','7fe0d47b409d9aa6097128b113e753b9.jpg','',NULL,'db91cd9c30e5b3cc674f7eddee9c5a1b'),(37,'2017-09-08 12:01:20','iblock',75,45,3564,'image/jpeg','iblock/498','4985bd439e2a73164759726e2c69db28.jpg','a7b9328dab5d8599953605e2d14da0b3.jpg','',NULL,'1f5ad9c2de69e183b83bad77cc962acf'),(38,'2017-09-08 12:01:20','iblock',400,238,42306,'image/jpeg','iblock/004','004d4086443cfc53dd62ac46a727193b.jpg','e4427787c59b56b70a9c0381453f88dc.jpg','',NULL,'6066afff6bef5b67dc850b1e250443c5'),(39,'2017-09-08 12:01:22','iblock',75,47,2666,'image/jpeg','iblock/0f2','0f2e63f040b632c05c00c2dbb7d4a74c.jpg','3413e989dd3239527ed2144bdb285a2b.jpg','',NULL,'4b03f33675077b161fcd9838a1e46871'),(40,'2017-09-08 12:01:22','iblock',400,249,26842,'image/jpeg','iblock/286','2866b381c44e5451a6e3c364412125f3.jpg','4f2b682c4cc7361e22e669e8faa4f344.jpg','',NULL,'22bc15f7d776a5791911747dc5f30f8d'),(41,'2017-09-08 12:01:26','iblock',75,45,3069,'image/jpeg','iblock/d38','d38f49e19f40c09ae058e241827fe275.jpg','26051473b5a68363a0882915e3e020e5.jpg','',NULL,'77546ef250c95307818c6ad777af92a9'),(42,'2017-09-08 12:01:26','iblock',400,239,36150,'image/jpeg','iblock/044','04467fa183f33399ee644ee6eaa8e21f.jpg','8c00778d633d1db6aaf29242c1602897.jpg','',NULL,'9a0e6191b30dfb9512873f84150f1b5b'),(43,'2017-09-08 12:01:28','iblock',75,47,3403,'image/jpeg','iblock/7a1','7a1763eb73bdb815e3951f5cd62aad56.jpg','d1a244031379e20a9d7f9cf85227bb2e.jpg','',NULL,'d536cb262a775e7a33c59e741a65fb68'),(44,'2017-09-08 12:01:28','iblock',400,250,34322,'image/jpeg','iblock/d3b','d3b538e979eaa49fd04fe385b1a3dd29.jpg','8b88ada642f37df4236b4cd129b85292.jpg','',NULL,'07d3de993206ddb91a7c294628ee6f31'),(45,'2017-09-08 12:01:33','iblock',75,49,3941,'image/jpeg','iblock/a0f','a0f995c5ea91fb9ef29e25bc4f5e937b.jpg','af64b255f19f75b080d5b934f156c590.jpg','',NULL,'61e525d263d7f8cb5ce1a186de828dd6'),(46,'2017-09-08 12:01:33','iblock',400,261,37746,'image/jpeg','iblock/dd6','dd64209ece1dd22d33c44a2394f299d9.jpg','b6dabd5a96bb11b68a8d7d2dd9c9a4e0.jpg','',NULL,'f35118d226de5343ce4c15837d724593'),(47,'2017-09-08 12:01:38','iblock',75,59,3571,'image/jpeg','iblock/d84','d84cfbfecd4ffec9d36c98646141263c.jpg','058550b5373b90e56aacb376028089f4.jpg','',NULL,'32c8acb82b20ed1f321579592ae36679'),(48,'2017-09-08 12:01:38','iblock',400,312,34110,'image/jpeg','iblock/6ff','6ff6eb87c4373a6819b97000c09cfeb5.jpg','e2612b793f41a81309fcc54bcbf65783.jpg','',NULL,'63651af8b8f14ef256781e1c2eee6cd0'),(49,'2017-09-08 12:01:42','iblock',75,48,3030,'image/jpeg','iblock/e10','e10e28dfd73dfb04767b6453d2da44d1.jpg','8065fe760829c4055200ea4831d72c17.jpg','',NULL,'26181ea78fc81ca40dbea1fe6f5d2119'),(50,'2017-09-08 12:01:42','iblock',400,258,29503,'image/jpeg','iblock/989','989a0e4137e8924d20e3e215a8293c0b.jpg','8b6d3cc80b138843463e65ae7a97ffe1.jpg','',NULL,'dbc94ffb6443ec079d467d2fe450af3d'),(51,'2017-09-08 12:01:45','iblock',75,52,2250,'image/jpeg','iblock/313','31378aa2c5d64e9599cdb4b80dff5311.jpg','a89665621b4b083248a5a8016be4e380.jpg','',NULL,'f1f02ba5369942a2b5c58cf449602cbc'),(52,'2017-09-08 12:01:45','iblock',400,279,22919,'image/jpeg','iblock/8a0','8a0342740dbf0f7fbebacb73cfcece6c.jpg','93de20bec81a906df174ababa31d856e.jpg','',NULL,'d38a65fd7e48941ed427c044e1028ced'),(53,'2017-09-08 12:02:20','iblock',97,115,5781,'image/gif','iblock/3e2','3e2958dec72ecd98f01f2ef09689c383.gif','8b0b3bc52fec8070e3561af5d05cd3a8.gif','',NULL,'4a3d72dcce6a28ea9aa42a81e7c61665'),(54,'2017-09-08 12:02:23','iblock',97,116,7345,'image/gif','iblock/10d','10d6b07cbbf7da7020bed4aebc916cdc.gif','38bf3b317397e56d07fe06731ca3a441.gif','',NULL,'383d86d3cfb7a3513c84f410f09b59a6'),(55,'2017-09-12 10:57:50','iblock',66,66,2565,'image/jpeg','iblock/c56','c5684e18a91767ff3dbc443180a2c5e7.jpg','91df8ed14b6a59b55ed4fcffc3785617.jpg','',NULL,'76bb6ac309ddac49ed26dc04bea55b36'),(56,'2017-09-12 10:57:50','iblock',66,66,2565,'image/jpeg','iblock/6cb','6cb0766125a40c67a536f7563b2d0556.jpg','ca077a2b25a7018337efd6b66bc08738.jpg','',NULL,'82227c4ae6b9cc763f7a141b1a882bcd'),(57,'2017-09-12 10:57:51','iblock',66,66,2642,'image/jpeg','iblock/fc7','fc763ae5700953e01fc73e15392624cd.jpg','a1ba9e841dfec3556477afc50b324cf8.jpg','',NULL,'4134def6273a4b6a4cee089bc0920e3c'),(58,'2017-09-12 10:57:51','iblock',66,66,2642,'image/jpeg','iblock/0d2','0d231b0239514dd8834b9e20a6fdcd8e.jpg','238f151e99ef1afafb7d41fa08d1660b.jpg','',NULL,'fab105e09fcccac6d5ad67c178279bc7'),(59,'2017-09-12 10:57:52','iblock',66,66,2796,'image/jpeg','iblock/445','4453ba62a584d30dd2f72e95944f7236.jpg','ddb10f62a8ef9260fef9242d792c0111.jpg','',NULL,'a093912ed7953645ab00a006a48a1bc6'),(60,'2017-09-12 10:57:52','iblock',66,66,2796,'image/jpeg','iblock/644','644eb5cc9f5224ab4adc20eae9d5958e.jpg','6c964a9a002c13ab8da7b43d47db996e.jpg','',NULL,'e653efa3c01c5405fe68f8428977d0c7'),(61,'2017-09-13 07:19:36','iblock',0,0,0,'application/pdf','iblock/b2b','b2b51bb963b8c79dd322dabe15ecf39e.pdf','doc1.pdf','',NULL,'f70f5a7c051a677b125a2310b83d3cb4'),(62,'2017-09-13 07:19:36','iblock',0,0,0,'application/pdf','iblock/348','3488d18768a8f16ea08c47bdd54c8883.pdf','doc2.pdf','',NULL,'86dfbb20483ab4d2f99758daa369a169'),(63,'2017-09-13 07:19:36','iblock',0,0,0,'application/pdf','iblock/444','4443ff7ba4d74d8803013082c5e2db82.pdf','doc3.pdf','',NULL,'8fc84b389fae28f76c5c9caf5cb1ac78');
/*!40000 ALTER TABLE `b_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_file_search`
--

DROP TABLE IF EXISTS `b_file_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_file_search` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SESS_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `F_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_DIR` int(11) NOT NULL DEFAULT '0',
  `F_SIZE` int(11) NOT NULL DEFAULT '0',
  `F_TIME` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_file_search`
--

LOCK TABLES `b_file_search` WRITE;
/*!40000 ALTER TABLE `b_file_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_file_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_filters`
--

DROP TABLE IF EXISTS `b_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_filters` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) DEFAULT NULL,
  `FILTER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELDS` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT NULL,
  `SORT_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_filters`
--

LOCK TABLES `b_filters` WRITE;
/*!40000 ALTER TABLE `b_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_finder_dest`
--

DROP TABLE IF EXISTS `b_finder_dest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_finder_dest` (
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_USER_ID` int(11) DEFAULT NULL,
  `CODE_TYPE` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTEXT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_USE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`CODE`,`CONTEXT`),
  KEY `IX_FINDER_DEST` (`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_finder_dest`
--

LOCK TABLES `b_finder_dest` WRITE;
/*!40000 ALTER TABLE `b_finder_dest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_finder_dest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form`
--

DROP TABLE IF EXISTS `b_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `BUTTON` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_SORT` int(18) DEFAULT '100',
  `FIRST_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `FORM_TEMPLATE` text COLLATE utf8_unicode_ci,
  `USE_DEFAULT_TEMPLATE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SHOW_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHOW_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRINT_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_RESULT_TEMPLATE` text COLLATE utf8_unicode_ci,
  `TABLE_RESULT_TEMPLATE` text COLLATE utf8_unicode_ci,
  `USE_RESTRICTIONS` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `RESTRICT_USER` int(5) DEFAULT '0',
  `RESTRICT_TIME` int(10) DEFAULT '0',
  `RESTRICT_STATUS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form`
--

LOCK TABLES `b_form` WRITE;
/*!40000 ALTER TABLE `b_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_2_group`
--

DROP TABLE IF EXISTS `b_form_2_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `GROUP_ID` int(18) NOT NULL DEFAULT '0',
  `PERMISSION` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_2_group`
--

LOCK TABLES `b_form_2_group` WRITE;
/*!40000 ALTER TABLE `b_form_2_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_2_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_2_mail_template`
--

DROP TABLE IF EXISTS `b_form_2_mail_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_2_mail_template` (
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`FORM_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_2_mail_template`
--

LOCK TABLES `b_form_2_mail_template` WRITE;
/*!40000 ALTER TABLE `b_form_2_mail_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_2_mail_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_2_site`
--

DROP TABLE IF EXISTS `b_form_2_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_2_site` (
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FORM_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_2_site`
--

LOCK TABLES `b_form_2_site` WRITE;
/*!40000 ALTER TABLE `b_form_2_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_2_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_answer`
--

DROP TABLE IF EXISTS `b_form_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_answer`
--

LOCK TABLES `b_form_answer` WRITE;
/*!40000 ALTER TABLE `b_form_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_crm`
--

DROP TABLE IF EXISTS `b_form_crm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_crm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `AUTH_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_crm`
--

LOCK TABLES `b_form_crm` WRITE;
/*!40000 ALTER TABLE `b_form_crm` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_crm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_crm_field`
--

DROP TABLE IF EXISTS `b_form_crm_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_crm_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LINK_ID` int(18) NOT NULL DEFAULT '0',
  `FIELD_ID` int(18) DEFAULT '0',
  `FIELD_ALT` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `CRM_FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `ix_b_form_crm_field_1` (`LINK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_crm_field`
--

LOCK TABLES `b_form_crm_field` WRITE;
/*!40000 ALTER TABLE `b_form_crm_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_crm_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_crm_link`
--

DROP TABLE IF EXISTS `b_form_crm_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_crm_link` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `CRM_ID` int(18) NOT NULL DEFAULT '0',
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_form_crm_link_1` (`FORM_ID`,`CRM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_crm_link`
--

LOCK TABLES `b_form_crm_link` WRITE;
/*!40000 ALTER TABLE `b_form_crm_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_crm_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_field`
--

DROP TABLE IF EXISTS `b_form_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TITLE` text COLLATE utf8_unicode_ci,
  `TITLE_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ADDITIONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `REQUIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_RESULTS_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_EXCEL_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FIELD_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `COMMENTS` text COLLATE utf8_unicode_ci,
  `FILTER_TITLE` text COLLATE utf8_unicode_ci,
  `RESULTS_TABLE_TITLE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_field`
--

LOCK TABLES `b_form_field` WRITE;
/*!40000 ALTER TABLE `b_form_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_field_filter`
--

DROP TABLE IF EXISTS `b_form_field_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_field_filter` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `PARAMETER_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_field_filter`
--

LOCK TABLES `b_form_field_filter` WRITE;
/*!40000 ALTER TABLE `b_form_field_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_field_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_field_validator`
--

DROP TABLE IF EXISTS `b_form_field_validator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_field_validator` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'y',
  `C_SORT` int(18) DEFAULT '100',
  `VALIDATOR_SID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `PARAMS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_field_validator`
--

LOCK TABLES `b_form_field_validator` WRITE;
/*!40000 ALTER TABLE `b_form_field_validator` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_field_validator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_menu`
--

DROP TABLE IF EXISTS `b_form_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_menu` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MENU` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_menu`
--

LOCK TABLES `b_form_menu` WRITE;
/*!40000 ALTER TABLE `b_form_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_result`
--

DROP TABLE IF EXISTS `b_form_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_result` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `USER_ID` int(18) DEFAULT NULL,
  `USER_AUTH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `SENT_TO_CRM` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_STATUS_ID` (`STATUS_ID`),
  KEY `IX_SENT_TO_CRM` (`SENT_TO_CRM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_result`
--

LOCK TABLES `b_form_result` WRITE;
/*!40000 ALTER TABLE `b_form_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_result_answer`
--

DROP TABLE IF EXISTS `b_form_result_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_result_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `RESULT_ID` int(18) NOT NULL DEFAULT '0',
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `ANSWER_ID` int(18) DEFAULT NULL,
  `ANSWER_TEXT` text COLLATE utf8_unicode_ci,
  `ANSWER_TEXT_SEARCH` longtext COLLATE utf8_unicode_ci,
  `ANSWER_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ANSWER_VALUE_SEARCH` longtext COLLATE utf8_unicode_ci,
  `USER_TEXT` longtext COLLATE utf8_unicode_ci,
  `USER_TEXT_SEARCH` longtext COLLATE utf8_unicode_ci,
  `USER_DATE` datetime DEFAULT NULL,
  `USER_FILE_ID` int(18) DEFAULT NULL,
  `USER_FILE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_IS_IMAGE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_HASH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_SUFFIX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_SIZE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RESULT_ID` (`RESULT_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`),
  KEY `IX_ANSWER_ID` (`ANSWER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_result_answer`
--

LOCK TABLES `b_form_result_answer` WRITE;
/*!40000 ALTER TABLE `b_form_result_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_result_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_status`
--

DROP TABLE IF EXISTS `b_form_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_status` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DEFAULT_VALUE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CSS` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'statusgreen',
  `HANDLER_OUT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_IN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_status`
--

LOCK TABLES `b_form_status` WRITE;
/*!40000 ALTER TABLE `b_form_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_status_2_group`
--

DROP TABLE IF EXISTS `b_form_status_2_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_status_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `GROUP_ID` int(18) NOT NULL DEFAULT '0',
  `PERMISSION` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_STATUS_GROUP` (`STATUS_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_status_2_group`
--

LOCK TABLES `b_form_status_2_group` WRITE;
/*!40000 ALTER TABLE `b_form_status_2_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_status_2_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_status_2_mail_template`
--

DROP TABLE IF EXISTS `b_form_status_2_mail_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_status_2_mail_template` (
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`STATUS_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_status_2_mail_template`
--

LOCK TABLES `b_form_status_2_mail_template` WRITE;
/*!40000 ALTER TABLE `b_form_status_2_mail_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_status_2_mail_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum`
--

DROP TABLE IF EXISTS `b_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(10) NOT NULL DEFAULT '150',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_ANCHOR` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_BIU` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_IMG` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_VIDEO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_QUOTE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_FONT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_SMILES` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_ALIGN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD_EXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ALLOW_MOVE_TOPIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_TOPIC_TITLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_NL2BR` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_SIGNATURE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PATH2FORUM_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ASK_GUEST_EMAIL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DEDUPLICATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MODERATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ORDER_BY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `ORDER_DIRECTION` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DESC',
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ru',
  `TOPICS` int(11) NOT NULL DEFAULT '0',
  `POSTS` int(11) NOT NULL DEFAULT '0',
  `LAST_POSTER_ID` int(11) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT '0',
  `ABS_LAST_POSTER_ID` int(11) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'forum',
  `EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'message',
  `EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_SORT` (`SORT`),
  KEY `IX_FORUM_ACTIVE` (`ACTIVE`),
  KEY `IX_FORUM_GROUP_ID` (`FORUM_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum`
--

LOCK TABLES `b_forum` WRITE;
/*!40000 ALTER TABLE `b_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum2site`
--

DROP TABLE IF EXISTS `b_forum2site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum2site` (
  `FORUM_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PATH2FORUM_MESSAGE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`FORUM_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum2site`
--

LOCK TABLES `b_forum2site` WRITE;
/*!40000 ALTER TABLE `b_forum2site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum2site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_dictionary`
--

DROP TABLE IF EXISTS `b_forum_dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_dictionary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_dictionary`
--

LOCK TABLES `b_forum_dictionary` WRITE;
/*!40000 ALTER TABLE `b_forum_dictionary` DISABLE KEYS */;
INSERT INTO `b_forum_dictionary` VALUES (1,'[ru] Словарь слов','W'),(2,'[ru] Словарь транслита','T'),(3,'[en] Bad words','W'),(4,'[en] Transliteration','T');
/*!40000 ALTER TABLE `b_forum_dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_email`
--

DROP TABLE IF EXISTS `b_forum_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL_FORUM_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FORUM_ID` int(11) NOT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `MAIL_FILTER_ID` int(11) NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USE_EMAIL` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_GROUP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBJECT_SUF` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_SUBJECT` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TEMPLATES_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NOT_MEMBER_POST` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_EMAIL_FORUM_SOC` (`FORUM_ID`,`SOCNET_GROUP_ID`),
  KEY `IX_B_FORUM_EMAIL_FILTER_ID` (`MAIL_FILTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_email`
--

LOCK TABLES `b_forum_email` WRITE;
/*!40000 ALTER TABLE `b_forum_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_file`
--

DROP TABLE IF EXISTS `b_forum_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(18) DEFAULT NULL,
  `TOPIC_ID` int(20) DEFAULT NULL,
  `MESSAGE_ID` int(20) DEFAULT NULL,
  `FILE_ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `HITS` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_FILE_FILE` (`FILE_ID`),
  KEY `IX_FORUM_FILE_FORUM` (`FORUM_ID`),
  KEY `IX_FORUM_FILE_TOPIC` (`TOPIC_ID`),
  KEY `IX_FORUM_FILE_MESSAGE` (`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_file`
--

LOCK TABLES `b_forum_file` WRITE;
/*!40000 ALTER TABLE `b_forum_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_filter`
--

DROP TABLE IF EXISTS `b_forum_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_filter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT NULL,
  `WORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATTERN` text COLLATE utf8_unicode_ci,
  `REPLACEMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `USE_IT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATTERN_CREATE` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_FILTER_2` (`USE_IT`),
  KEY `IX_B_FORUM_FILTER_3` (`PATTERN_CREATE`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_filter`
--

LOCK TABLES `b_forum_filter` WRITE;
/*!40000 ALTER TABLE `b_forum_filter` DISABLE KEYS */;
INSERT INTO `b_forum_filter` VALUES (1,1,'*пизд*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(2,1,'*пизж*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(3,1,'*сра%','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([СсCc]+)([РрPpRr]+)([АаAa]+)([[Цц]+([Аа]+|[Оо]+)]+|[[Тт]+([Ьь]+|)[Сс]+[Яя]+]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(4,1,'анобляд*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([АаAa]+)([НнNn]+)([ОоOo]+)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(5,1,'взъеб*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвVv]+)([ЗзZz3]+)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(6,1,'бля','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(7,1,'долбоеб*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([ОоOo]+)([ЛлLl]+)([БбBb]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(8,1,'дуроеб*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([УуUu]+)([РрPpRr]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(9,1,'еби','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(10,1,'ебисти*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)([ТтTt]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(11,1,'ебическ*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([Чч]+)([ЁёЕеEe]+)([СсCc]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(12,1,'еблив*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ИиIi]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(13,1,'ебло*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ОоOo]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(14,1,'еблыс*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Ыы]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(15,1,'ебля','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(16,1,'ебс','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([СсCc]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(17,1,'ебукент*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([КкKk]+)([ЁёЕеEe]+)([НнNn]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(18,1,'ебурген*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([РрPpRr]+)([Гг]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(19,1,'коноебит*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([КкKk]+)([ОоOo]+)([НнNn]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(20,1,'мозгоеб*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([ОоOo]+)([ЗзZz3]+)([Гг]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(21,1,'мудоеб*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(22,1,'однохуйствен*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ДдDd]+)([НнNn]+)([ОоOo]+)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)([СсCc]+)([ТтTt]+)([ВвVv]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(23,1,'охуе*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(24,1,'охуи*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(25,1,'охуя*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(26,1,'разъеба*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([ЗзZz3]+)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(27,1,'распиздон*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)([ОоOo]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(28,1,'расхуюж*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ХхXx]+)([УуUu]+)([Юю]+|[[Йй]+[Оо]+]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(29,1,'худоебин*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(30,1,'хуе','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(31,1,'хуебрат*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([БбBb]+)([РрPpRr]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(32,1,'хуеглот*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([Гг]+)([ЛлLl]+)([ОоOo]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(33,1,'хуеплёт*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ПпPp]+)([ЛлLl]+)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(34,1,'хует*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(35,1,'хуила','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ИиIi]+)([ЛлLl]+)([АаAa]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(36,1,'хул?','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЛлLl]+).?)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(37,1,'хуя','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(38,1,'^бляд*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(39,1,'^пидор*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ПпPp]+)([ИиIi]+)([ДдDd]+)([ОоOo]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(40,1,'^хуев*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(41,1,'^хуем*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(42,1,'^хуй*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(43,1,'^хуяк*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(44,1,'^хуям*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(45,1,'^хуяр*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(46,1,'^хуяч*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(47,1,'^ъебал*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ЛлLl]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(48,1,'^ъебан*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(49,1,'^ъебар*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(50,1,'^ъебат*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(51,1,'^ъебен*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(52,1,'^ъеби','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(53,1,'^ъебис*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(54,1,'^ъебит*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(55,1,'^ъёбля*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([ЛлLl]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(56,1,'^ъёбну*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([НнNn]+)([УуUu]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(57,1,'^ъебу','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(58,1,'^ъебуч*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(59,1,'^ъебыв*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([Ыы]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(60,1,'/(?<=[s.,;:!?-#*|[]()])(?![Вв][ЕеЁё][Бб])(([ВвЗзСс]+|[Ввы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)|)([ЬьЪъ]+|)([ЁёЕеEe]+|[Йй]+[Оо]+|[Yy]+[Oo]+)([BbБб]+))(?=[s.,;:!?-#*|[]()])/is','','','','Y','PTTRN'),(61,3,'angry','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+n+g+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(62,3,'ass','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(63,3,'asshole','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(64,3,'banger','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+n+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(65,3,'bastard','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+s+t+a+r+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(66,3,'batter','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+t+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(67,3,'bicho','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+c+h+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(68,3,'bisexual','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+s+e+x+u+a+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(69,3,'bitch','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(70,3,'blumpkin','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+l+u+m+p+k+i+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(71,3,'booger','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+o+o+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(72,3,'bugger*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+g+g+e+r+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(73,3,'bukakke','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+k+a+k+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(74,3,'bull','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(75,3,'bulldyke','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+d+y+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(76,3,'bullshit','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(77,3,'bunny','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(78,3,'bunnyfuck','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+f+u+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(79,3,'chocha','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+c+h+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(80,3,'chode','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+d+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(81,3,'clap','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+l+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(82,3,'coconuts','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+c+o+n+u+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(83,3,'cohones','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+h+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(84,3,'cojones','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+j+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(85,3,'coon','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(86,3,'cootch','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(87,3,'cooter','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(88,3,'cornhole','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+r+n+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(89,3,'cracka','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+c+k+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(90,3,'crap','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(91,3,'cum','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+m+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(92,3,'cunnilingus','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+n+i+l+i+n+g+u+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(93,3,'cunt*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+t+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(94,3,'damn*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+m+n+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(95,3,'dark*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+r+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(96,3,'dick','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(97,3,'dickhead','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+h+e+a+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(98,3,'diddle','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+d+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(99,3,'dildo','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+d+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(100,3,'dilhole','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(101,3,'dingleberry','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+n+g+l+e+b+e+r+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(102,3,'doodle','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+o+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(103,3,'dork','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+r+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(104,3,'dumpster','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+u+m+p+s+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(105,3,'faggot','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+g+g+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(106,3,'fart','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(107,3,'frig','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+r+i+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(108,3,'fuck*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(109,3,'fucker','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(110,3,'giz','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+i+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(111,3,'goatse','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+a+t+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(112,3,'gook','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+o+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(113,3,'gringo','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+r+i+n+g+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(114,3,'hobo','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+b+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(115,3,'honky','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+n+k+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(116,3,'jackass','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(117,3,'jackoff','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(118,3,'jerkoff','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+e+r+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(119,3,'jiggaboo','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+g+g+a+b+o+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(120,3,'jizz','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+z+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(121,3,'kike','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(k+i+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(122,3,'mayo','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+a+y+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(123,3,'moose','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+o+o+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(124,3,'nigg*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(n+i+g+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(125,3,'paki','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+a+k+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(126,3,'pecker','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+e+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(127,3,'piss','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+i+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(128,3,'poonanni','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+a+n+n+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(129,3,'poontang','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+t+a+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(130,3,'prick','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+r+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(131,3,'punch','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+u+n+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(132,3,'queef','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(q+u+e+e+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(133,3,'rogue','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(r+o+g+u+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(134,3,'sanchez','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+a+n+c+h+e+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(135,3,'schlong','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+c+h+l+o+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(136,3,'shit','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(137,3,'skank','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+k+a+n+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(138,3,'spaz','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+a+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(139,3,'spic','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+i+c+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(140,3,'teabag*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+e+a+b+a+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(141,3,'tits','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+i+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(142,3,'twat','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+a+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(143,3,'twot','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(144,3,'vart','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(v+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(145,3,'wanker','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+n+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(146,3,'waste','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+s+t+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(147,3,'wetback','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+e+t+b+a+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(148,3,'whore','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+h+o+r+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(149,3,'wigger','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+i+g+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(150,3,'wog','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(151,3,'wop','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL');
/*!40000 ALTER TABLE `b_forum_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_group`
--

DROP TABLE IF EXISTS `b_forum_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '150',
  `PARENT_ID` int(11) DEFAULT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `DEPTH_LEVEL` int(11) DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_group`
--

LOCK TABLES `b_forum_group` WRITE;
/*!40000 ALTER TABLE `b_forum_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_group_lang`
--

DROP TABLE IF EXISTS `b_forum_group_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_group_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_GROUP` (`FORUM_GROUP_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_group_lang`
--

LOCK TABLES `b_forum_group_lang` WRITE;
/*!40000 ALTER TABLE `b_forum_group_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_group_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_letter`
--

DROP TABLE IF EXISTS `b_forum_letter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_letter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT '0',
  `LETTER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPLACEMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_letter`
--

LOCK TABLES `b_forum_letter` WRITE;
/*!40000 ALTER TABLE `b_forum_letter` DISABLE KEYS */;
INSERT INTO `b_forum_letter` VALUES (1,2,'а','АаAa'),(2,2,'б','БбBb'),(3,2,'в','ВвVv'),(4,2,'г','Гг'),(5,2,'д','ДдDd'),(6,2,'е','ЁёЕеEe'),(7,2,'ё','ЁёЕеEe, [Йй]+[Оо]+'),(8,2,'ж','ЖжGg'),(9,2,'з','ЗзZz3'),(10,2,'и','ИиIi'),(11,2,'й','ЙйИиYy'),(12,2,'к','КкKk'),(13,2,'л','ЛлLl'),(14,2,'м','МмMm'),(15,2,'н','НнNn'),(16,2,'о','ОоOo'),(17,2,'п','ПпPp'),(18,2,'р','РрPpRr'),(19,2,'с','СсCc'),(20,2,'т','ТтTt'),(21,2,'у','УуUu'),(22,2,'ф','ФфFf'),(23,2,'х','ХхXx'),(24,2,'ц','ЦцCc'),(25,2,'ч','Чч'),(26,2,'ш','Шш'),(27,2,'щ','Щщ'),(28,2,'ь','ЪъЬь\"\','),(29,2,'ы','Ыы'),(30,2,'ъ','ЪъЬь\"\','),(31,2,'э','Ээ'),(32,2,'ю','Юю, [Йй]+[Оо]+'),(33,2,'я','Яя'),(34,2,'%','[Цц]+([Аа]+|[Оо]+), [Тт]+([Ьь]+|)[Сс]+[Яя]+'),(35,2,'^',',ВвЗзСс,ВвЫы,ДдОо,ЗзАа,ИиЗзСс,НнАа,НнЕе,ОоТт,([Пп]*[Ее]+[Рр]+[Ее]+)'),(36,2,'тся','%'),(37,2,'ться','%');
/*!40000 ALTER TABLE `b_forum_letter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_message`
--

DROP TABLE IF EXISTS `b_forum_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_message` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) NOT NULL,
  `USE_SMILES` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NEW_TOPIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPROVED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SOURCE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'WEB',
  `POST_DATE` datetime NOT NULL,
  `POST_MESSAGE` text COLLATE utf8_unicode_ci,
  `POST_MESSAGE_HTML` text COLLATE utf8_unicode_ci,
  `POST_MESSAGE_FILTER` text COLLATE utf8_unicode_ci,
  `POST_MESSAGE_CHECK` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `PARAM1` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM2` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(10) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_REAL_IP` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUEST_ID` int(10) DEFAULT NULL,
  `EDITOR_ID` int(10) DEFAULT NULL,
  `EDITOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDITOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_REASON` text COLLATE utf8_unicode_ci,
  `EDIT_DATE` datetime DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` text COLLATE utf8_unicode_ci,
  `MAIL_HEADER` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_MESSAGE_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_MESSAGE_TOPIC` (`TOPIC_ID`,`APPROVED`,`ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR` (`AUTHOR_ID`,`APPROVED`,`FORUM_ID`,`ID`),
  KEY `IX_FORUM_MESSAGE_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_MESSAGE_PARAM2` (`PARAM2`),
  KEY `IX_FORUM_MESSAGE_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_MESSAGE_DATE_AUTHOR_ID` (`POST_DATE`,`AUTHOR_ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_TOPIC_ID` (`AUTHOR_ID`,`TOPIC_ID`,`ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_FORUM_ID` (`AUTHOR_ID`,`FORUM_ID`,`ID`,`APPROVED`,`TOPIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_message`
--

LOCK TABLES `b_forum_message` WRITE;
/*!40000 ALTER TABLE `b_forum_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_perms`
--

DROP TABLE IF EXISTS `b_forum_perms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_PERMS_FORUM` (`FORUM_ID`,`GROUP_ID`),
  KEY `IX_FORUM_PERMS_GROUP` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_perms`
--

LOCK TABLES `b_forum_perms` WRITE;
/*!40000 ALTER TABLE `b_forum_perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_perms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_pm_folder`
--

DROP TABLE IF EXISTS `b_forum_pm_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_pm_folder` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `SORT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_FOLDER_USER_IST` (`USER_ID`,`ID`,`SORT`,`TITLE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_pm_folder`
--

LOCK TABLES `b_forum_pm_folder` WRITE;
/*!40000 ALTER TABLE `b_forum_pm_folder` DISABLE KEYS */;
INSERT INTO `b_forum_pm_folder` VALUES (1,'SYSTEM_FOLDER_1',0,0),(2,'SYSTEM_FOLDER_2',0,0),(3,'SYSTEM_FOLDER_3',0,0),(4,'SYSTEM_FOLDER_4',0,0);
/*!40000 ALTER TABLE `b_forum_pm_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_points`
--

DROP TABLE IF EXISTS `b_forum_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_points` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_POINTS` int(11) NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P_MP` (`MIN_POINTS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_points`
--

LOCK TABLES `b_forum_points` WRITE;
/*!40000 ALTER TABLE `b_forum_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_points2post`
--

DROP TABLE IF EXISTS `b_forum_points2post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_points2post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_NUM_POSTS` int(11) NOT NULL,
  `POINTS_PER_POST` decimal(18,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P2P_MNP` (`MIN_NUM_POSTS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_points2post`
--

LOCK TABLES `b_forum_points2post` WRITE;
/*!40000 ALTER TABLE `b_forum_points2post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_points2post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_points_lang`
--

DROP TABLE IF EXISTS `b_forum_points_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_points_lang` (
  `POINTS_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`POINTS_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_points_lang`
--

LOCK TABLES `b_forum_points_lang` WRITE;
/*!40000 ALTER TABLE `b_forum_points_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_points_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_private_message`
--

DROP TABLE IF EXISTS `b_forum_private_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_private_message` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `AUTHOR_ID` int(11) DEFAULT '0',
  `RECIPIENT_ID` int(11) DEFAULT '0',
  `POST_DATE` datetime DEFAULT NULL,
  `POST_SUBJ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_MESSAGE` text COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `FOLDER_ID` int(11) NOT NULL,
  `IS_READ` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_IS_READ` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_SMILES` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_USER` (`USER_ID`),
  KEY `IX_B_FORUM_PM_AFR` (`AUTHOR_ID`,`FOLDER_ID`,`IS_READ`),
  KEY `IX_B_FORUM_PM_UFP` (`USER_ID`,`FOLDER_ID`,`POST_DATE`),
  KEY `IX_B_FORUM_PM_POST_DATE` (`POST_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_private_message`
--

LOCK TABLES `b_forum_private_message` WRITE;
/*!40000 ALTER TABLE `b_forum_private_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_private_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_rank`
--

DROP TABLE IF EXISTS `b_forum_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MIN_NUM_POSTS` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_rank`
--

LOCK TABLES `b_forum_rank` WRITE;
/*!40000 ALTER TABLE `b_forum_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_rank_lang`
--

DROP TABLE IF EXISTS `b_forum_rank_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_rank_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RANK_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_RANK` (`RANK_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_rank_lang`
--

LOCK TABLES `b_forum_rank_lang` WRITE;
/*!40000 ALTER TABLE `b_forum_rank_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_rank_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_stat`
--

DROP TABLE IF EXISTS `b_forum_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_stat` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) DEFAULT NULL,
  `IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHPSESSID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORUM_ID` smallint(5) NOT NULL DEFAULT '0',
  `TOPIC_ID` int(10) DEFAULT NULL,
  `SHOW_NAME` varchar(101) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_STAT_SITE_ID` (`SITE_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_TOPIC_ID` (`TOPIC_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_FORUM_ID` (`FORUM_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_PHPSESSID` (`PHPSESSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_stat`
--

LOCK TABLES `b_forum_stat` WRITE;
/*!40000 ALTER TABLE `b_forum_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_subscribe`
--

DROP TABLE IF EXISTS `b_forum_subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_subscribe` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` int(10) DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `LAST_SEND` int(10) DEFAULT NULL,
  `NEW_TOPIC_ONLY` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ru',
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_SUBSCRIBE_USER` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`,`SOCNET_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_subscribe`
--

LOCK TABLES `b_forum_subscribe` WRITE;
/*!40000 ALTER TABLE `b_forum_subscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_subscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_topic`
--

DROP TABLE IF EXISTS `b_forum_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE_SEO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ICON` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `APPROVED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `VIEWS` int(10) NOT NULL DEFAULT '0',
  `USER_START_ID` int(10) DEFAULT NULL,
  `USER_START_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `POSTS` int(10) NOT NULL DEFAULT '0',
  `LAST_POSTER_ID` int(10) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_POST_DATE` datetime NOT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT '0',
  `ABS_LAST_POSTER_ID` int(10) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` text COLLATE utf8_unicode_ci,
  `SOCNET_GROUP_ID` int(10) DEFAULT NULL,
  `OWNER_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_TOPIC_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_TOPIC_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_TOPIC_ABS_L_POST_DATE` (`ABS_LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_LAST_POST_DATE` (`LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_USER_START_ID` (`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_DATE_USER_START_ID` (`START_DATE`,`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO` (`FORUM_ID`,`TITLE_SEO`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO2` (`TITLE_SEO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_topic`
--

LOCK TABLES `b_forum_topic` WRITE;
/*!40000 ALTER TABLE `b_forum_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_user`
--

DROP TABLE IF EXISTS `b_forum_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_user` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `ALIAS` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AVATAR` int(10) DEFAULT NULL,
  `NUM_POSTS` int(10) DEFAULT '0',
  `INTERESTS` text COLLATE utf8_unicode_ci,
  `LAST_POST` int(10) DEFAULT NULL,
  `ALLOW_POST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_VISIT` datetime NOT NULL,
  `DATE_REG` date NOT NULL,
  `REAL_IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SIGNATURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHOW_NAME` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RANK_ID` int(11) DEFAULT NULL,
  `POINTS` int(11) NOT NULL DEFAULT '0',
  `HIDE_FROM_ONLINE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SUBSC_GROUP_MESSAGE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SUBSC_GET_MY_MESSAGE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_FORUM_USER_USER6` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_user`
--

LOCK TABLES `b_forum_user` WRITE;
/*!40000 ALTER TABLE `b_forum_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_user_forum`
--

DROP TABLE IF EXISTS `b_forum_user_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_user_forum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `MAIN_LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID1` (`USER_ID`,`FORUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_user_forum`
--

LOCK TABLES `b_forum_user_forum` WRITE;
/*!40000 ALTER TABLE `b_forum_user_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_user_points`
--

DROP TABLE IF EXISTS `b_forum_user_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_user_points` (
  `FROM_USER_ID` int(11) NOT NULL,
  `TO_USER_ID` int(11) NOT NULL,
  `POINTS` int(11) NOT NULL DEFAULT '0',
  `DATE_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`FROM_USER_ID`,`TO_USER_ID`),
  KEY `IX_B_FORUM_USER_POINTS_TO_USER` (`TO_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_user_points`
--

LOCK TABLES `b_forum_user_points` WRITE;
/*!40000 ALTER TABLE `b_forum_user_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_user_topic`
--

DROP TABLE IF EXISTS `b_forum_user_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_user_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TOPIC_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`TOPIC_ID`,`USER_ID`),
  KEY `ID` (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID2` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_user_topic`
--

LOCK TABLES `b_forum_user_topic` WRITE;
/*!40000 ALTER TABLE `b_forum_user_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_geoip_handlers`
--

DROP TABLE IF EXISTS `b_geoip_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_geoip_handlers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(10) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `CLASS_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_geoip_handlers`
--

LOCK TABLES `b_geoip_handlers` WRITE;
/*!40000 ALTER TABLE `b_geoip_handlers` DISABLE KEYS */;
INSERT INTO `b_geoip_handlers` VALUES (1,100,'N','\\Bitrix\\Main\\Service\\GeoIp\\MaxMind',NULL),(2,110,'Y','\\Bitrix\\Main\\Service\\GeoIp\\SypexGeo',NULL);
/*!40000 ALTER TABLE `b_geoip_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_group`
--

DROP TABLE IF EXISTS `b_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ANONYMOUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_POLICY` text COLLATE utf8_unicode_ci,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_group`
--

LOCK TABLES `b_group` WRITE;
/*!40000 ALTER TABLE `b_group` DISABLE KEYS */;
INSERT INTO `b_group` VALUES (1,'2017-09-08 11:54:30','Y',1,'N','Администраторы','Полный доступ к управлению сайтом.',NULL,NULL),(2,'2017-09-08 11:54:30','Y',2,'Y','Все пользователи (в том числе неавторизованные)','Все пользователи, включая неавторизованных.',NULL,NULL),(3,'2017-09-08 11:54:30','Y',3,'N','Пользователи, имеющие право голосовать за рейтинг','В эту группу пользователи добавляются автоматически.',NULL,'RATING_VOTE'),(4,'2017-09-08 11:54:30','Y',4,'N','Пользователи имеющие право голосовать за авторитет','В эту группу пользователи добавляются автоматически.',NULL,'RATING_VOTE_AUTHORITY'),(5,'2017-09-08 11:57:40','Y',300,'N','Контент-редакторы',NULL,NULL,'content_editor');
/*!40000 ALTER TABLE `b_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_group_collection_task`
--

DROP TABLE IF EXISTS `b_group_collection_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_group_collection_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `COLLECTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_group_collection_task`
--

LOCK TABLES `b_group_collection_task` WRITE;
/*!40000 ALTER TABLE `b_group_collection_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_group_collection_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_group_subordinate`
--

DROP TABLE IF EXISTS `b_group_subordinate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_group_subordinate` (
  `ID` int(18) NOT NULL,
  `AR_SUBGROUP_ID` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_group_subordinate`
--

LOCK TABLES `b_group_subordinate` WRITE;
/*!40000 ALTER TABLE `b_group_subordinate` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_group_subordinate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_group_task`
--

DROP TABLE IF EXISTS `b_group_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_group_task` (
  `GROUP_ID` int(18) NOT NULL,
  `TASK_ID` int(18) NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_group_task`
--

LOCK TABLES `b_group_task` WRITE;
/*!40000 ALTER TABLE `b_group_task` DISABLE KEYS */;
INSERT INTO `b_group_task` VALUES (5,22,''),(5,49,'');
/*!40000 ALTER TABLE `b_group_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_hlblock_entity`
--

DROP TABLE IF EXISTS `b_hlblock_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_hlblock_entity` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_NAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_hlblock_entity`
--

LOCK TABLES `b_hlblock_entity` WRITE;
/*!40000 ALTER TABLE `b_hlblock_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_hlblock_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_hlblock_entity_lang`
--

DROP TABLE IF EXISTS `b_hlblock_entity_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_hlblock_entity_lang` (
  `ID` int(11) unsigned NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_hlblock_entity_lang`
--

LOCK TABLES `b_hlblock_entity_lang` WRITE;
/*!40000 ALTER TABLE `b_hlblock_entity_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_hlblock_entity_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_hlblock_entity_rights`
--

DROP TABLE IF EXISTS `b_hlblock_entity_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_hlblock_entity_rights` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `HL_ID` int(11) unsigned NOT NULL,
  `TASK_ID` int(11) unsigned NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_hlblock_entity_rights`
--

LOCK TABLES `b_hlblock_entity_rights` WRITE;
/*!40000 ALTER TABLE `b_hlblock_entity_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_hlblock_entity_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_hot_keys`
--

DROP TABLE IF EXISTS `b_hot_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_hot_keys` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `KEYS_STRING` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_hot_keys_co_u` (`CODE_ID`,`USER_ID`),
  KEY `ix_hot_keys_code` (`CODE_ID`),
  KEY `ix_hot_keys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_hot_keys`
--

LOCK TABLES `b_hot_keys` WRITE;
/*!40000 ALTER TABLE `b_hot_keys` DISABLE KEYS */;
INSERT INTO `b_hot_keys` VALUES (1,'Ctrl+Alt+85',139,0),(2,'Ctrl+Alt+80',17,0),(3,'Ctrl+Alt+70',120,0),(4,'Ctrl+Alt+68',117,0),(5,'Ctrl+Alt+81',3,0),(6,'Ctrl+Alt+75',106,0),(7,'Ctrl+Alt+79',133,0),(8,'Ctrl+Alt+70',121,0),(9,'Ctrl+Alt+69',118,0),(10,'Ctrl+Shift+83',87,0),(11,'Ctrl+Shift+88',88,0),(12,'Ctrl+Shift+76',89,0),(13,'Ctrl+Alt+85',139,1),(14,'Ctrl+Alt+80',17,1),(15,'Ctrl+Alt+70',120,1),(16,'Ctrl+Alt+68',117,1),(17,'Ctrl+Alt+81',3,1),(18,'Ctrl+Alt+75',106,1),(19,'Ctrl+Alt+79',133,1),(20,'Ctrl+Alt+70',121,1),(21,'Ctrl+Alt+69',118,1),(22,'Ctrl+Shift+83',87,1),(23,'Ctrl+Shift+88',88,1),(24,'Ctrl+Shift+76',89,1);
/*!40000 ALTER TABLE `b_hot_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_hot_keys_code`
--

DROP TABLE IF EXISTS `b_hot_keys_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_hot_keys_code` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CLASS_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE_OBJ` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_CUSTOM` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ix_hot_keys_code_cn` (`CLASS_NAME`),
  KEY `ix_hot_keys_code_url` (`URL`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_hot_keys_code`
--

LOCK TABLES `b_hot_keys_code` WRITE;
/*!40000 ALTER TABLE `b_hot_keys_code` DISABLE KEYS */;
INSERT INTO `b_hot_keys_code` VALUES (3,'CAdminTabControl','NextTab();','HK_DB_CADMINTC','HK_DB_CADMINTC_C','tab-container','',0),(5,'btn_new','var d=BX (\'btn_new\'); if (d) location.href = d.href;','HK_DB_BUT_ADD','HK_DB_BUT_ADD_C','btn_new','',0),(6,'btn_excel','var d=BX(\'btn_excel\'); if (d) location.href = d.href;','HK_DB_BUT_EXL','HK_DB_BUT_EXL_C','btn_excel','',0),(7,'btn_settings','var d=BX(\'btn_settings\'); if (d) location.href = d.href;','HK_DB_BUT_OPT','HK_DB_BUT_OPT_C','btn_settings','',0),(8,'btn_list','var d=BX(\'btn_list\'); if (d) location.href = d.href;','HK_DB_BUT_LST','HK_DB_BUT_LST_C','btn_list','',0),(9,'Edit_Save_Button','var d=BX .findChild(document, {attribute: {\'name\': \'save\'}}, true );  if (d) d.click();','HK_DB_BUT_SAVE','HK_DB_BUT_SAVE_C','Edit_Save_Button','',0),(10,'btn_delete','var d=BX(\'btn_delete\'); if (d) location.href = d.href;','HK_DB_BUT_DEL','HK_DB_BUT_DEL_C','btn_delete','',0),(12,'CAdminFilter','var d=BX .findChild(document, {attribute: {\'name\': \'find\'}}, true ); if (d) d.focus();','HK_DB_FLT_FND','HK_DB_FLT_FND_C','find','',0),(13,'CAdminFilter','var d=BX .findChild(document, {attribute: {\'name\': \'set_filter\'}}, true );  if (d) d.click();','HK_DB_FLT_BUT_F','HK_DB_FLT_BUT_F_C','set_filter','',0),(14,'CAdminFilter','var d=BX .findChild(document, {attribute: {\'name\': \'del_filter\'}}, true );  if (d) d.click();','HK_DB_FLT_BUT_CNL','HK_DB_FLT_BUT_CNL_C','del_filter','',0),(15,'bx-panel-admin-button-help-icon-id','var d=BX(\'bx-panel-admin-button-help-icon-id\'); if (d) location.href = d.href;','HK_DB_BUT_HLP','HK_DB_BUT_HLP_C','bx-panel-admin-button-help-icon-id','',0),(17,'Global','BXHotKeys.ShowSettings();','HK_DB_SHW_L','HK_DB_SHW_L_C','bx-panel-hotkeys','',0),(19,'Edit_Apply_Button','var d=BX .findChild(document, {attribute: {\'name\': \'apply\'}}, true );  if (d) d.click();','HK_DB_BUT_APPL','HK_DB_BUT_APPL_C','Edit_Apply_Button','',0),(20,'Edit_Cancel_Button','var d=BX .findChild(document, {attribute: {\'name\': \'cancel\'}}, true );  if (d) d.click();','HK_DB_BUT_CANCEL','HK_DB_BUT_CANCEL_C','Edit_Cancel_Button','',0),(54,'top_panel_org_fav','','-=AUTONAME=-',NULL,'top_panel_org_fav',NULL,0),(55,'top_panel_module_settings','','-=AUTONAME=-',NULL,'top_panel_module_settings','',0),(56,'top_panel_interface_settings','','-=AUTONAME=-',NULL,'top_panel_interface_settings','',0),(57,'top_panel_help','','-=AUTONAME=-',NULL,'top_panel_help','',0),(58,'top_panel_bizproc_tasks','','-=AUTONAME=-',NULL,'top_panel_bizproc_tasks','',0),(59,'top_panel_add_fav','','-=AUTONAME=-',NULL,'top_panel_add_fav',NULL,0),(60,'top_panel_create_page','','-=AUTONAME=-',NULL,'top_panel_create_page','',0),(62,'top_panel_create_folder','','-=AUTONAME=-',NULL,'top_panel_create_folder','',0),(63,'top_panel_edit_page','','-=AUTONAME=-',NULL,'top_panel_edit_page','',0),(64,'top_panel_page_prop','','-=AUTONAME=-',NULL,'top_panel_page_prop','',0),(65,'top_panel_edit_page_html','','-=AUTONAME=-',NULL,'top_panel_edit_page_html','',0),(67,'top_panel_edit_page_php','','-=AUTONAME=-',NULL,'top_panel_edit_page_php','',0),(68,'top_panel_del_page','','-=AUTONAME=-',NULL,'top_panel_del_page','',0),(69,'top_panel_folder_prop','','-=AUTONAME=-',NULL,'top_panel_folder_prop','',0),(70,'top_panel_access_folder_new','','-=AUTONAME=-',NULL,'top_panel_access_folder_new','',0),(71,'main_top_panel_struct_panel','','-=AUTONAME=-',NULL,'main_top_panel_struct_panel','',0),(72,'top_panel_cache_page','','-=AUTONAME=-',NULL,'top_panel_cache_page','',0),(73,'top_panel_cache_comp','','-=AUTONAME=-',NULL,'top_panel_cache_comp','',0),(74,'top_panel_cache_not','','-=AUTONAME=-',NULL,'top_panel_cache_not','',0),(75,'top_panel_edit_mode','','-=AUTONAME=-',NULL,'top_panel_edit_mode','',0),(76,'top_panel_templ_site_css','','-=AUTONAME=-',NULL,'top_panel_templ_site_css','',0),(77,'top_panel_templ_templ_css','','-=AUTONAME=-',NULL,'top_panel_templ_templ_css','',0),(78,'top_panel_templ_site','','-=AUTONAME=-',NULL,'top_panel_templ_site','',0),(81,'top_panel_debug_time','','-=AUTONAME=-',NULL,'top_panel_debug_time','',0),(82,'top_panel_debug_incl','','-=AUTONAME=-',NULL,'top_panel_debug_incl','',0),(83,'top_panel_debug_sql','','-=AUTONAME=-',NULL,'top_panel_debug_sql',NULL,0),(84,'top_panel_debug_compr','','-=AUTONAME=-',NULL,'top_panel_debug_compr','',0),(85,'MTP_SHORT_URI1','','-=AUTONAME=-',NULL,'MTP_SHORT_URI1','',0),(86,'MTP_SHORT_URI_LIST','','-=AUTONAME=-',NULL,'MTP_SHORT_URI_LIST','',0),(87,'FMST_PANEL_STICKER_ADD','','-=AUTONAME=-',NULL,'FMST_PANEL_STICKER_ADD','',0),(88,'FMST_PANEL_STICKERS_SHOW','','-=AUTONAME=-',NULL,'FMST_PANEL_STICKERS_SHOW','',0),(89,'FMST_PANEL_CUR_STICKER_LIST','','-=AUTONAME=-',NULL,'FMST_PANEL_CUR_STICKER_LIST','',0),(90,'FMST_PANEL_ALL_STICKER_LIST','','-=AUTONAME=-',NULL,'FMST_PANEL_ALL_STICKER_LIST','',0),(91,'top_panel_menu','var d=BX(\"bx-panel-menu\"); if (d) d.click();','-=AUTONAME=-',NULL,'bx-panel-menu','',0),(92,'top_panel_admin','var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;','-=AUTONAME=-',NULL,'bx-panel-admin-tab','',0),(93,'admin_panel_site','var d=BX(\'bx-panel-view-tab\'); if (d) location.href = d.href;','-=AUTONAME=-',NULL,'bx-panel-view-tab','',0),(94,'admin_panel_admin','var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;','-=AUTONAME=-',NULL,'bx-panel-admin-tab','',0),(96,'top_panel_folder_prop_new','','-=AUTONAME=-',NULL,'top_panel_folder_prop_new','',0),(97,'main_top_panel_structure','','-=AUTONAME=-',NULL,'main_top_panel_structure','',0),(98,'top_panel_clear_cache','','-=AUTONAME=-',NULL,'top_panel_clear_cache','',0),(99,'top_panel_templ','','-=AUTONAME=-',NULL,'top_panel_templ','',0),(100,'top_panel_debug','','-=AUTONAME=-',NULL,'top_panel_debug','',0),(101,'MTP_SHORT_URI','','-=AUTONAME=-',NULL,'MTP_SHORT_URI','',0),(102,'FMST_PANEL_STICKERS','','-=AUTONAME=-',NULL,'FMST_PANEL_STICKERS','',0),(103,'top_panel_settings','','-=AUTONAME=-',NULL,'top_panel_settings','',0),(104,'top_panel_fav','','-=AUTONAME=-',NULL,'top_panel_fav','',0),(106,'Global','location.href=\'/bitrix/admin/hot_keys_list.php?lang=ru\';','HK_DB_SHW_HK','','','',0),(107,'top_panel_edit_new','','-=AUTONAME=-',NULL,'top_panel_edit_new','',0),(108,'FLOW_PANEL_CREATE_WITH_WF','','-=AUTONAME=-',NULL,'FLOW_PANEL_CREATE_WITH_WF','',0),(109,'FLOW_PANEL_EDIT_WITH_WF','','-=AUTONAME=-',NULL,'FLOW_PANEL_EDIT_WITH_WF','',0),(110,'FLOW_PANEL_HISTORY','','-=AUTONAME=-',NULL,'FLOW_PANEL_HISTORY','',0),(111,'top_panel_create_new','','-=AUTONAME=-',NULL,'top_panel_create_new','',0),(112,'top_panel_create_folder_new','','-=AUTONAME=-',NULL,'top_panel_create_folder_new','',0),(116,'bx-panel-toggle','','-=AUTONAME=-',NULL,'bx-panel-toggle','',0),(117,'bx-panel-small-toggle','','-=AUTONAME=-',NULL,'bx-panel-small-toggle','',0),(118,'bx-panel-expander','var d=BX(\'bx-panel-expander\'); if (d) BX.fireEvent(d, \'click\');','-=AUTONAME=-',NULL,'bx-panel-expander','',0),(119,'bx-panel-hider','var d=BX(\'bx-panel-hider\'); if (d) d.click();','-=AUTONAME=-',NULL,'bx-panel-hider','',0),(120,'search-textbox-input','var d=BX(\'search-textbox-input\'); if (d) { d.click(); d.focus();}','-=AUTONAME=-','','search','',0),(121,'bx-search-input','var d=BX(\'bx-search-input\'); if (d) { d.click(); d.focus(); }','-=AUTONAME=-','','bx-search-input','',0),(133,'bx-panel-logout','var d=BX(\'bx-panel-logout\'); if (d) location.href = d.href;','-=AUTONAME=-','','bx-panel-logout','',0),(135,'CDialog','var d=BX(\'cancel\'); if (d) d.click();','HK_DB_D_CANCEL','','cancel','',0),(136,'CDialog','var d=BX(\'close\'); if (d) d.click();','HK_DB_D_CLOSE','','close','',0),(137,'CDialog','var d=BX(\'savebtn\'); if (d) d.click();','HK_DB_D_SAVE','','savebtn','',0),(138,'CDialog','var d=BX(\'btn_popup_save\'); if (d) d.click();','HK_DB_D_EDIT_SAVE','','btn_popup_save','',0),(139,'Global','location.href=\'/bitrix/admin/user_admin.php?lang=\'+phpVars.LANGUAGE_ID;','HK_DB_SHW_U','','','',0);
/*!40000 ALTER TABLE `b_hot_keys_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock`
--

DROP TABLE IF EXISTS `b_iblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIST_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CANONICAL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `RSS_TTL` int(11) NOT NULL DEFAULT '24',
  `RSS_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int(11) DEFAULT NULL,
  `RSS_FILE_DAYS` int(11) DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_ELEMENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RIGHTS_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PROPERTY` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROPERTY_INDEX` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `LAST_CONV_ELEMENT` int(11) NOT NULL DEFAULT '0',
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock`
--

LOCK TABLES `b_iblock` WRITE;
/*!40000 ALTER TABLE `b_iblock` DISABLE KEYS */;
INSERT INTO `b_iblock` VALUES (1,'2017-09-08 11:58:02','news','s1','furniture_news_s1','Новости','Y',500,'#SITE_DIR#/news/','#SITE_DIR#/news/#ID#/',NULL,NULL,NULL,NULL,'text',24,'Y','N',NULL,NULL,'N','furniture_news_s1','675a0df0d73ae421cac644f09f42b739','Y','N','N','N','L',NULL,'S',NULL,NULL,1,0,NULL,NULL,NULL,'Разделы','Раздел','Новости','Новость'),(2,'2017-09-08 12:01:50','products','s1','furniture_products_s1','[s1] Продукция','Y',500,'#SITE_DIR#/products/','#SITE_DIR#/products/#SECTION_ID#/#ID#/','#SITE_DIR#/products/#ID#/',NULL,NULL,NULL,'text',24,'Y','N',NULL,NULL,'N','furniture_products_s1','eec1ca1cf27e85c892fc2d42054d6339','Y','Y','N','N','L',NULL,'S',NULL,NULL,1,0,NULL,NULL,NULL,'Разделы','Раздел','Товары','Элемент'),(3,'2017-09-08 12:02:29','products','s1','furniture_services_s1','[s1] Услуги','Y',500,'#SITE_DIR#/services/','#SITE_DIR#/services/#ID#/',NULL,NULL,NULL,NULL,'text',24,'Y','N',NULL,NULL,'N','furniture_services_s1','337ece3a0cb2ea683614a6afb39eab8d','Y','Y','N','N','L',NULL,'S',NULL,NULL,1,0,NULL,NULL,NULL,'Разделы','Раздел','Услуги','Услуга'),(4,'2017-09-08 12:03:17','vacancies','s1','furniture_vacancies_s1','Вакансии','Y',500,'#SITE_DIR#/company/vacancies.php','#SITE_DIR#/company/vacancies.php##ID#',NULL,NULL,NULL,NULL,'text',24,'Y','N',NULL,NULL,'N','furniture_vacancies_s1','c09f961db2a434d6f44281b4cbbde326','Y','N','N','N','L',NULL,'S',NULL,NULL,1,0,NULL,NULL,NULL,'Разделы','Раздел','Вакансии','Вакансия'),(5,'2017-09-13 12:09:29','reviews','s1','rew','Отзывы','Y',500,'#SITE_DIR#/rew/','#SITE_DIR#/rew/#ELEMENT_CODE#/','#SITE_DIR#/demo/list.php?SECTION_ID=#SECTION_ID#','',NULL,'','text',24,'Y','N',NULL,NULL,'N','5',NULL,'Y','Y','N','N','L','','S','N','N',1,0,NULL,'','','Разделы','Раздел','Элементы','Элемент');
/*!40000 ALTER TABLE `b_iblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_cache`
--

DROP TABLE IF EXISTS `b_iblock_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_cache` (
  `CACHE_KEY` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `CACHE` longtext COLLATE utf8_unicode_ci NOT NULL,
  `CACHE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CACHE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_cache`
--

LOCK TABLES `b_iblock_cache` WRITE;
/*!40000 ALTER TABLE `b_iblock_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element`
--

DROP TABLE IF EXISTS `b_iblock_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL DEFAULT '0',
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_PICTURE` int(18) DEFAULT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci,
  `PREVIEW_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `DETAIL_TEXT` longtext COLLATE utf8_unicode_ci,
  `DETAIL_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `WF_STATUS_ID` int(18) DEFAULT '1',
  `WF_PARENT_ELEMENT_ID` int(11) DEFAULT NULL,
  `WF_NEW` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LOCKED_BY` int(18) DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text COLLATE utf8_unicode_ci,
  `IN_SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int(11) DEFAULT NULL,
  `SHOW_COUNTER` int(18) DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element`
--

LOCK TABLES `b_iblock_element` WRITE;
/*!40000 ALTER TABLE `b_iblock_element` DISABLE KEYS */;
INSERT INTO `b_iblock_element` VALUES (1,'2017-09-08 14:57:55',1,'2017-09-08 14:57:50',1,1,NULL,'Y','2010-05-25 00:00:00',NULL,500,'Мебельный форум Беларуси',NULL,'С 20 по 23 апреля 2010 года состоится <strong>Мебельный Форум Беларуси</strong> &ndash; важнейшее мероприятии отрасли в текущем году.','html',NULL,'\r\n<p>С 20 по 23 апреля 2010 года состоится <strong>Мебельный Форум Беларуси</strong> &ndash; важнейшее мероприятии отрасли в текущем году. В экспозиции принимают участие свыше 160 компаний из <em>Беларуси, Австрии, Латвии, Литвы, России, Польши </em>и<em> Украины</em>. В составе форума состоится пять выставок:&quot;Минский мебельный салон&quot;, &quot;Мебельные технологии&quot;, &quot;ОфисКомфорт&quot;, &quot;Кухня&quot; и &quot;Домотех&quot;. Экспозиция будет строиться по принципу двух тематических секторов:<em> готовой мебели</em> и <em>материалов для ее производства</em>.\r\n \r\n \r\n \r\n  <br />\r\n\r\n \r\n \r\n </p>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n<p>В секторе готовой мебели будут представлены:</p>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n<ul>\r\n \r\n \r\n \r\n  <li>корпусная и мягкая мебель;</li>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n  <li>мебель для детей и молодежи;</li>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n  <li>предметы интерьера;</li>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n  <li>кухонная мебель;</li>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n  <li>мебель для офиса и административных зданий.</li>\r\n\r\n \r\n \r\n </ul>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n<p>В секторе материалов для производства мебели будут демонстрироваться новинки рынка мебельной фурнитуры, материалов, обивочных тканей, элементов и аксессуаров для производства мебели.\r\n \r\n \r\n  <br />\r\n\r\n \r\n \r\n </p>\r\n\r\n \r\n \r\n \r\n \r\n<p>Помимо расширенной экспозиции пяти тематических выставок &quot;Экспофорум&quot; подготовил разнообразную деловую программу Мебельного форума. В рамках выставки состоятся семинары и мастер-классы. И поистине масштабным в этом году обещает стать республиканский конкурс форума &quot;<strong>Народное признание</strong>&quot;. В этом году он выходит за рамки выставки и становится республиканским смотром образцов мебели.\r\n \r\n \r\n  <br />\r\n\r\n \r\n <strong>Мебельный Форум</strong> предоставляет специалистам возможность познакомиться с тенденциями мебельной моды, провести переговоры, получить практические предложения рынка, увидеть перспективы развития и новые конкурентные преимущества. Впервые для участников конкурса будет подготовлен маркетинговый отчет по результатам опроса посетителей выставок <strong>Мебельного Форума</strong>.\r\n \r\n \r\n  <br />\r\n\r\n \r\n </p>\r\n\r\n<p><em>Прием заявок на участие в конкурсе осуществляется до 12 апреля 2010 года.</em></p>\r\n\r\n \r\n \r\n \r\n \r\n<ul>\r\n </ul>\r\n\r\n \r\n \r\n \r\n ','html','МЕБЕЛЬНЫЙ ФОРУМ БЕЛАРУСИ\r\nС 20 ПО 23 АПРЕЛЯ 2010 ГОДА СОСТОИТСЯ МЕБЕЛЬНЫЙ \r\nФОРУМ БЕЛАРУСИ &NDASH; ВАЖНЕЙШЕЕ МЕРОПРИЯТИИ \r\nОТРАСЛИ В ТЕКУЩЕМ ГОДУ.\r\nС 20 ПО 23 АПРЕЛЯ 2010 ГОДА СОСТОИТСЯ МЕБЕЛЬНЫЙ \r\nФОРУМ БЕЛАРУСИ &NDASH; ВАЖНЕЙШЕЕ МЕРОПРИЯТИИ \r\nОТРАСЛИ В ТЕКУЩЕМ ГОДУ. В ЭКСПОЗИЦИИ ПРИНИМАЮТ \r\nУЧАСТИЕ СВЫШЕ 160 КОМПАНИЙ ИЗ БЕЛАРУСИ, АВСТРИИ, \r\nЛАТВИИ, ЛИТВЫ, РОССИИ, ПОЛЬШИ И УКРАИНЫ. \r\nВ СОСТАВЕ ФОРУМА СОСТОИТСЯ ПЯТЬ ВЫСТАВОК:\"МИНСКИЙ \r\nМЕБЕЛЬНЫЙ САЛОН\", \"МЕБЕЛЬНЫЕ ТЕХНОЛОГИИ\", \r\n\"ОФИСКОМФОРТ\", \"КУХНЯ\" И \"ДОМОТЕХ\". ЭКСПОЗИЦИЯ \r\nБУДЕТ СТРОИТЬСЯ ПО ПРИНЦИПУ ДВУХ ТЕМАТИЧЕСКИХ \r\nСЕКТОРОВ: ГОТОВОЙ МЕБЕЛИ И МАТЕРИАЛОВ ДЛЯ \r\nЕЕ ПРОИЗВОДСТВА. \r\n \r\n\r\nВ СЕКТОРЕ ГОТОВОЙ МЕБЕЛИ БУДУТ ПРЕДСТАВЛЕНЫ: \r\n\r\n- КОРПУСНАЯ И МЯГКАЯ МЕБЕЛЬ; \r\n- МЕБЕЛЬ ДЛЯ ДЕТЕЙ И МОЛОДЕЖИ; \r\n- ПРЕДМЕТЫ ИНТЕРЬЕРА; \r\n- КУХОННАЯ МЕБЕЛЬ; \r\n- МЕБЕЛЬ ДЛЯ ОФИСА И АДМИНИСТРАТИВНЫХ ЗДАНИЙ. \r\n\r\nВ СЕКТОРЕ МАТЕРИАЛОВ ДЛЯ ПРОИЗВОДСТВА \r\nМЕБЕЛИ БУДУТ ДЕМОНСТРИРОВАТЬСЯ НОВИНКИ \r\nРЫНКА МЕБЕЛЬНОЙ ФУРНИТУРЫ, МАТЕРИАЛОВ, \r\nОБИВОЧНЫХ ТКАНЕЙ, ЭЛЕМЕНТОВ И АКСЕССУАРОВ \r\nДЛЯ ПРОИЗВОДСТВА МЕБЕЛИ. \r\n \r\n\r\nПОМИМО РАСШИРЕННОЙ ЭКСПОЗИЦИИ ПЯТИ ТЕМАТИЧЕСКИХ \r\nВЫСТАВОК \"ЭКСПОФОРУМ\" ПОДГОТОВИЛ РАЗНООБРАЗНУЮ \r\nДЕЛОВУЮ ПРОГРАММУ МЕБЕЛЬНОГО ФОРУМА. В \r\nРАМКАХ ВЫСТАВКИ СОСТОЯТСЯ СЕМИНАРЫ И МАСТЕР-КЛАССЫ. \r\nИ ПОИСТИНЕ МАСШТАБНЫМ В ЭТОМ ГОДУ ОБЕЩАЕТ \r\nСТАТЬ РЕСПУБЛИКАНСКИЙ КОНКУРС ФОРУМА \"НАРОДНОЕ \r\nПРИЗНАНИЕ\". В ЭТОМ ГОДУ ОН ВЫХОДИТ ЗА РАМКИ \r\nВЫСТАВКИ И СТАНОВИТСЯ РЕСПУБЛИКАНСКИМ \r\nСМОТРОМ ОБРАЗЦОВ МЕБЕЛИ. \r\nМЕБЕЛЬНЫЙ ФОРУМ ПРЕДОСТАВЛЯЕТ СПЕЦИАЛИСТАМ \r\nВОЗМОЖНОСТЬ ПОЗНАКОМИТЬСЯ С ТЕНДЕНЦИЯМИ \r\nМЕБЕЛЬНОЙ МОДЫ, ПРОВЕСТИ ПЕРЕГОВОРЫ, ПОЛУЧИТЬ \r\nПРАКТИЧЕСКИЕ ПРЕДЛОЖЕНИЯ РЫНКА, УВИДЕТЬ \r\nПЕРСПЕКТИВЫ РАЗВИТИЯ И НОВЫЕ КОНКУРЕНТНЫЕ \r\nПРЕИМУЩЕСТВА. ВПЕРВЫЕ ДЛЯ УЧАСТНИКОВ КОНКУРСА \r\nБУДЕТ ПОДГОТОВЛЕН МАРКЕТИНГОВЫЙ ОТЧЕТ \r\nПО РЕЗУЛЬТАТАМ ОПРОСА ПОСЕТИТЕЛЕЙ ВЫСТАВОК \r\nМЕБЕЛЬНОГО ФОРУМА. \r\n \r\n\r\nПРИЕМ ЗАЯВОК НА УЧАСТИЕ В КОНКУРСЕ ОСУЩЕСТВЛЯЕТСЯ \r\nДО 12 АПРЕЛЯ 2010 ГОДА.',1,NULL,NULL,NULL,NULL,NULL,'N','1','','','-384246935',NULL,NULL,NULL),(2,'2017-09-08 14:57:57',1,'2017-09-08 14:57:55',1,1,NULL,'Y','2010-05-26 00:00:00',NULL,500,'Международная мебельная выставка SALON DEL MOBILE',NULL,'В 2010 году выставка Salon del Mobile обещает быть еще более расширенной и интересной. ','html',NULL,'В 2010 году выставка Salon del Mobile обещает быть еще более расширенной и интересной. На выставке Salon del Mobile будут представлены все типы мебели для офиса и дома от спален и гостиных до VIP-кабинетов, включая оборудование для сада и детской мебели. Заявки на участие подали более чем 1 500 компаний со всего мира. Предполагается, что за время проведения выставки ее посетят более 300 000 тысяч человек. Экспозиция выставки разместится на общей площади 149 871 кв.м. В 2010 году эта поистине грандиозная выставка будет проводиться уже в 10-й раз.','text','МЕЖДУНАРОДНАЯ МЕБЕЛЬНАЯ ВЫСТАВКА SALON DEL MOBILE\r\nВ 2010 ГОДУ ВЫСТАВКА SALON DEL MOBILE ОБЕЩАЕТ БЫТЬ \r\nЕЩЕ БОЛЕЕ РАСШИРЕННОЙ И ИНТЕРЕСНОЙ.\r\nВ 2010 ГОДУ ВЫСТАВКА SALON DEL MOBILE ОБЕЩАЕТ БЫТЬ ЕЩЕ БОЛЕЕ РАСШИРЕННОЙ И ИНТЕРЕСНОЙ. НА ВЫСТАВКЕ SALON DEL MOBILE БУДУТ ПРЕДСТАВЛЕНЫ ВСЕ ТИПЫ МЕБЕЛИ ДЛЯ ОФИСА И ДОМА ОТ СПАЛЕН И ГОСТИНЫХ ДО VIP-КАБИНЕТОВ, ВКЛЮЧАЯ ОБОРУДОВАНИЕ ДЛЯ САДА И ДЕТСКОЙ МЕБЕЛИ. ЗАЯВКИ НА УЧАСТИЕ ПОДАЛИ БОЛЕЕ ЧЕМ 1 500 КОМПАНИЙ СО ВСЕГО МИРА. ПРЕДПОЛАГАЕТСЯ, ЧТО ЗА ВРЕМЯ ПРОВЕДЕНИЯ ВЫСТАВКИ ЕЕ ПОСЕТЯТ БОЛЕЕ 300 000 ТЫСЯЧ ЧЕЛОВЕК. ЭКСПОЗИЦИЯ ВЫСТАВКИ РАЗМЕСТИТСЯ НА ОБЩЕЙ ПЛОЩАДИ 149 871 КВ.М. В 2010 ГОДУ ЭТА ПОИСТИНЕ ГРАНДИОЗНАЯ ВЫСТАВКА БУДЕТ ПРОВОДИТЬСЯ УЖЕ В 10-Й РАЗ.',1,NULL,NULL,NULL,NULL,NULL,'N','8','','','373546319',NULL,NULL,NULL),(3,'2017-09-08 14:58:02',1,'2017-09-08 14:57:57',1,1,NULL,'Y','2010-05-27 00:00:00',NULL,500,'Получено прочное водостойкое соединение',NULL,'Получено новое прочное водостойкое клеевое соединение.Изобретение относится к области получения и применения клеящих составов, используемых в деревообрабатывающей, мебельной и строительной промышленности. Данная клеевая композиция предназначена только для горячего прессования и имеет в своем составе многокомпонентный отвердитель. ','html',NULL,'<b>Авторы изобретения</b>: Разиньков Егор Михайлович  и Мещерякова Анна Анатольевна </br>\r\n              Патент Российской Федерации RU2277566</br>\r\n              <h3>Описание изобретения</h3>\r\n              <p>Изобретение относится к области получения и применения клеящих составов, используемых в деревообрабатывающей, мебельной и строительной промышленности.\r\n              Данная клеевая композиция предназначена только для горячего прессования и имеет в своем составе многокомпонентный отвердитель. Прототипом клеевой композиции является клей, состоящий из карбамидоформальдегидной смолы, сополимера акрилонитрила с N-винилкапролактамом и отвердитель. В качестве отвердителя применяют хлористый аммоний либо акриловую кислоту. </p>\r\n\r\n              <p>Изобретение решает задачу по получению прочного и водостойкого клеевого соединения.\r\n              Это достигается тем, что клеевая композиция, включающая синтетическую смолу и отвердитель, согласно изобретению, дополнительно содержит модификатор, причем в качестве синтетической смолы клеевая композиция включает карбамидомеламиноформальдегидную смолу с отвердителем 2542, в качестве модификатора - карбамидоформальдегидную смолу, а в качестве отвердителя - 10%-ный раствор щавелевой кислоты при следующем соотношении компонентов, мас.ч.:\r\n              </p>\r\n              <table cellspacing=\"10\">\r\n              <tr>\r\n              <td>Карбамидомеламиноформальдегидная смола</td><td>64,5-79,2</td>\r\n              </tr>	\r\n              <tr>\r\n              <td>10%-ный Раствор щавелевой кислоты</td><td>4,4-20,5</td>\r\n\r\n              </tr>\r\n              <tr>\r\n              <td> Отвердитель для карбамидомеламиноформальдегидной </td><td>0,6-2,0</td>\r\n              </tr>\r\n              <tr>\r\n              <td> смолы 2542</td><td>13,0-15,8</td>\r\n\r\n              </tr>	\r\n              </table>\r\n','html','ПОЛУЧЕНО ПРОЧНОЕ ВОДОСТОЙКОЕ СОЕДИНЕНИЕ\r\nПОЛУЧЕНО НОВОЕ ПРОЧНОЕ ВОДОСТОЙКОЕ КЛЕЕВОЕ \r\nСОЕДИНЕНИЕ.ИЗОБРЕТЕНИЕ ОТНОСИТСЯ К ОБЛАСТИ \r\nПОЛУЧЕНИЯ И ПРИМЕНЕНИЯ КЛЕЯЩИХ СОСТАВОВ, \r\nИСПОЛЬЗУЕМЫХ В ДЕРЕВООБРАБАТЫВАЮЩЕЙ, МЕБЕЛЬНОЙ \r\nИ СТРОИТЕЛЬНОЙ ПРОМЫШЛЕННОСТИ. ДАННАЯ КЛЕЕВАЯ \r\nКОМПОЗИЦИЯ ПРЕДНАЗНАЧЕНА ТОЛЬКО ДЛЯ ГОРЯЧЕГО \r\nПРЕССОВАНИЯ И ИМЕЕТ В СВОЕМ СОСТАВЕ МНОГОКОМПОНЕНТНЫЙ \r\nОТВЕРДИТЕЛЬ.\r\nАВТОРЫ ИЗОБРЕТЕНИЯ: РАЗИНЬКОВ ЕГОР МИХАЙЛОВИЧ \r\nИ МЕЩЕРЯКОВА АННА АНАТОЛЬЕВНА ПАТЕНТ РОССИЙСКОЙ \r\nФЕДЕРАЦИИ RU2277566 ОПИСАНИЕ ИЗОБРЕТЕНИЯ \r\n\r\nИЗОБРЕТЕНИЕ ОТНОСИТСЯ К ОБЛАСТИ ПОЛУЧЕНИЯ \r\nИ ПРИМЕНЕНИЯ КЛЕЯЩИХ СОСТАВОВ, ИСПОЛЬЗУЕМЫХ \r\nВ ДЕРЕВООБРАБАТЫВАЮЩЕЙ, МЕБЕЛЬНОЙ И СТРОИТЕЛЬНОЙ \r\nПРОМЫШЛЕННОСТИ. ДАННАЯ КЛЕЕВАЯ КОМПОЗИЦИЯ \r\nПРЕДНАЗНАЧЕНА ТОЛЬКО ДЛЯ ГОРЯЧЕГО ПРЕССОВАНИЯ \r\nИ ИМЕЕТ В СВОЕМ СОСТАВЕ МНОГОКОМПОНЕНТНЫЙ \r\nОТВЕРДИТЕЛЬ. ПРОТОТИПОМ КЛЕЕВОЙ КОМПОЗИЦИИ \r\nЯВЛЯЕТСЯ КЛЕЙ, СОСТОЯЩИЙ ИЗ КАРБАМИДОФОРМАЛЬДЕГИДНОЙ \r\nСМОЛЫ, СОПОЛИМЕРА АКРИЛОНИТРИЛА С N-ВИНИЛКАПРОЛАКТАМОМ \r\nИ ОТВЕРДИТЕЛЬ. В КАЧЕСТВЕ ОТВЕРДИТЕЛЯ ПРИМЕНЯЮТ \r\nХЛОРИСТЫЙ АММОНИЙ ЛИБО АКРИЛОВУЮ КИСЛОТУ. \r\n\r\nИЗОБРЕТЕНИЕ РЕШАЕТ ЗАДАЧУ ПО ПОЛУЧЕНИЮ \r\nПРОЧНОГО И ВОДОСТОЙКОГО КЛЕЕВОГО СОЕДИНЕНИЯ. \r\nЭТО ДОСТИГАЕТСЯ ТЕМ, ЧТО КЛЕЕВАЯ КОМПОЗИЦИЯ, \r\nВКЛЮЧАЮЩАЯ СИНТЕТИЧЕСКУЮ СМОЛУ И ОТВЕРДИТЕЛЬ, \r\nСОГЛАСНО ИЗОБРЕТЕНИЮ, ДОПОЛНИТЕЛЬНО СОДЕРЖИТ \r\nМОДИФИКАТОР, ПРИЧЕМ В КАЧЕСТВЕ СИНТЕТИЧЕСКОЙ \r\nСМОЛЫ КЛЕЕВАЯ КОМПОЗИЦИЯ ВКЛЮЧАЕТ КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНУЮ \r\nСМОЛУ С ОТВЕРДИТЕЛЕМ 2542, В КАЧЕСТВЕ МОДИФИКАТОРА \r\n- КАРБАМИДОФОРМАЛЬДЕГИДНУЮ СМОЛУ, А В КАЧЕСТВЕ \r\nОТВЕРДИТЕЛЯ - 10%-НЫЙ РАСТВОР ЩАВЕЛЕВОЙ КИСЛОТЫ \r\nПРИ СЛЕДУЮЩЕМ СООТНОШЕНИИ КОМПОНЕНТОВ, \r\nМАС.Ч.: \r\n КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНАЯ СМОЛА \r\n   64,5-79,2     \r\n 10%-НЫЙ РАСТВОР ЩАВЕЛЕВОЙ КИСЛОТЫ    4,4-20,5 \r\n    \r\n ОТВЕРДИТЕЛЬ ДЛЯ КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНОЙ \r\n    0,6-2,0     \r\n СМОЛЫ 2542    13,0-15,8',1,NULL,NULL,NULL,NULL,NULL,'N','9','','','868533081',NULL,1,'2017-09-13 15:04:50'),(4,'2017-09-08 15:00:47',1,'2017-09-08 15:00:46',1,2,1,'Y',NULL,NULL,500,'Герцог',5,'<p>Изящный каркас с элементами росписи, роскошные ткани для обивки, яркие цвета и богатый декор.</p>','html',6,'        <p>Изящный каркас с элементами росписи, роскошные ткани для обивки, яркие цвета и богатый декор.</p>','html','ГЕРЦОГ\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ, РОСКОШНЫЕ \r\nТКАНИ ДЛЯ ОБИВКИ, ЯРКИЕ ЦВЕТА И БОГАТЫЙ \r\nДЕКОР.\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ, РОСКОШНЫЕ \r\nТКАНИ ДЛЯ ОБИВКИ, ЯРКИЕ ЦВЕТА И БОГАТЫЙ \r\nДЕКОР.',1,NULL,NULL,NULL,NULL,NULL,'Y','10','','','-782370160',NULL,NULL,NULL),(5,'2017-09-08 15:00:48',1,'2017-09-08 15:00:47',1,2,1,'Y',NULL,NULL,500,'Монализа',7,'        <p>Богатство и изыск выражен в данной модели. Каркас дополнительно расписывается золотом.\r\n        По желанию клиента возможна простежка на спинке и подлокотниках.</p>\r\n      ','html',8,'        <p>Богатство и изыск выражен в данной модели. Каркас дополнительно расписывается золотом.\r\n        По желанию клиента возможна простежка на спинке и подлокотниках.</p>\r\n      ','html','МОНАЛИЗА\r\nБОГАТСТВО И ИЗЫСК ВЫРАЖЕН В ДАННОЙ МОДЕЛИ. \r\nКАРКАС ДОПОЛНИТЕЛЬНО РАСПИСЫВАЕТСЯ ЗОЛОТОМ. \r\nПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА \r\nСПИНКЕ И ПОДЛОКОТНИКАХ.\r\nБОГАТСТВО И ИЗЫСК ВЫРАЖЕН В ДАННОЙ МОДЕЛИ. \r\nКАРКАС ДОПОЛНИТЕЛЬНО РАСПИСЫВАЕТСЯ ЗОЛОТОМ. \r\nПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА \r\nСПИНКЕ И ПОДЛОКОТНИКАХ.',1,NULL,NULL,NULL,NULL,NULL,'Y','11','','','-48879568',NULL,NULL,NULL),(6,'2017-09-08 15:00:49',1,'2017-09-08 15:00:48',1,2,2,'Y',NULL,NULL,500,'Министр',9,'        <p>Кресло руководителя Министр, несмотря на низкую стоимость, впечатляюще выглядит. \r\n          С его помощью можно создать офисный интерьер высокого уровня. К тому же в нем можно работать с комфортом, не чувствуя усталости.</p>\r\n      ','html',10,'          <p>Кресло руководителя Министр, несмотря на низкую стоимость, впечатляюще выглядит. \r\n          С его помощью можно создать офисный интерьер высокого уровня. К тому же в нем можно работать с комфортом, не чувствуя усталости.</p>\r\n        ','html','МИНИСТР\r\nКРЕСЛО РУКОВОДИТЕЛЯ МИНИСТР, НЕСМОТРЯ \r\nНА НИЗКУЮ СТОИМОСТЬ, ВПЕЧАТЛЯЮЩЕ ВЫГЛЯДИТ. \r\nС ЕГО ПОМОЩЬЮ МОЖНО СОЗДАТЬ ОФИСНЫЙ ИНТЕРЬЕР \r\nВЫСОКОГО УРОВНЯ. К ТОМУ ЖЕ В НЕМ МОЖНО РАБОТАТЬ \r\nС КОМФОРТОМ, НЕ ЧУВСТВУЯ УСТАЛОСТИ.\r\nКРЕСЛО РУКОВОДИТЕЛЯ МИНИСТР, НЕСМОТРЯ \r\nНА НИЗКУЮ СТОИМОСТЬ, ВПЕЧАТЛЯЮЩЕ ВЫГЛЯДИТ. \r\nС ЕГО ПОМОЩЬЮ МОЖНО СОЗДАТЬ ОФИСНЫЙ ИНТЕРЬЕР \r\nВЫСОКОГО УРОВНЯ. К ТОМУ ЖЕ В НЕМ МОЖНО РАБОТАТЬ \r\nС КОМФОРТОМ, НЕ ЧУВСТВУЯ УСТАЛОСТИ.',1,NULL,NULL,NULL,NULL,NULL,'Y','12','','','-2121649046',NULL,NULL,NULL),(7,'2017-09-08 15:00:51',1,'2017-09-08 15:00:50',1,2,2,'Y',NULL,NULL,500,'Хром',11,'        \r\n          <p>Динамичная модель офисного кресла примечательна оригинальным внешним видом, который достигнут за \r\n          счет хромированной крестовины,необычных подлокотников и потрясающей эргономики. \r\n          Твердая спинка жестко поддерживает позвоночник.</p>\r\n      ','html',12,'          \r\n          <p>Динамичная модель офисного кресла примечательна оригинальным внешним видом, который достигнут за \r\n          счет хромированной крестовины,необычных подлокотников и потрясающей эргономики. \r\n          Твердая спинка жестко поддерживает позвоночник.</p>\r\n        ','html','ХРОМ\r\nДИНАМИЧНАЯ МОДЕЛЬ ОФИСНОГО КРЕСЛА ПРИМЕЧАТЕЛЬНА \r\nОРИГИНАЛЬНЫМ ВНЕШНИМ ВИДОМ, КОТОРЫЙ ДОСТИГНУТ \r\nЗА СЧЕТ ХРОМИРОВАННОЙ КРЕСТОВИНЫ,НЕОБЫЧНЫХ \r\nПОДЛОКОТНИКОВ И ПОТРЯСАЮЩЕЙ ЭРГОНОМИКИ. \r\nТВЕРДАЯ СПИНКА ЖЕСТКО ПОДДЕРЖИВАЕТ ПОЗВОНОЧНИК.\r\nДИНАМИЧНАЯ МОДЕЛЬ ОФИСНОГО КРЕСЛА ПРИМЕЧАТЕЛЬНА \r\nОРИГИНАЛЬНЫМ ВНЕШНИМ ВИДОМ, КОТОРЫЙ ДОСТИГНУТ \r\nЗА СЧЕТ ХРОМИРОВАННОЙ КРЕСТОВИНЫ,НЕОБЫЧНЫХ \r\nПОДЛОКОТНИКОВ И ПОТРЯСАЮЩЕЙ ЭРГОНОМИКИ. \r\nТВЕРДАЯ СПИНКА ЖЕСТКО ПОДДЕРЖИВАЕТ ПОЗВОНОЧНИК.',1,NULL,NULL,NULL,NULL,NULL,'Y','13','','','-256131656',NULL,NULL,NULL),(8,'2017-09-08 15:00:53',1,'2017-09-08 15:00:51',1,2,3,'Y',NULL,NULL,500,'Ливерпуль',13,'        <p>Деревянные стулья Ливерпуль, выполненные в классическом английском стиле, \r\n        создают особую атмосферу в кухне.</p>\r\n      ','html',14,'        \r\n        <p>Деревянные стулья Ливерпуль, выполненные в классическом английском стиле, \r\n        создают особую атмосферу в кухне.</p>\r\n        \r\n      ','html','ЛИВЕРПУЛЬ\r\nДЕРЕВЯННЫЕ СТУЛЬЯ ЛИВЕРПУЛЬ, ВЫПОЛНЕННЫЕ \r\nВ КЛАССИЧЕСКОМ АНГЛИЙСКОМ СТИЛЕ, СОЗДАЮТ \r\nОСОБУЮ АТМОСФЕРУ В КУХНЕ.\r\nДЕРЕВЯННЫЕ СТУЛЬЯ ЛИВЕРПУЛЬ, ВЫПОЛНЕННЫЕ \r\nВ КЛАССИЧЕСКОМ АНГЛИЙСКОМ СТИЛЕ, СОЗДАЮТ \r\nОСОБУЮ АТМОСФЕРУ В КУХНЕ.',1,NULL,NULL,NULL,NULL,NULL,'Y','14','','','1081715374',NULL,NULL,NULL),(9,'2017-09-08 15:00:54',1,'2017-09-08 15:00:53',1,2,1,'Y',NULL,NULL,500,'Изабелла',15,'        <p>Изящный каркас с элементами росписи золотом. Обивка может быть представлена в ткани или коже.</p>\r\n      ','html',16,'        <p>Изящный каркас с элементами росписи золотом. Обивка может быть представлена в ткани или коже.</p>\r\n      ','html','ИЗАБЕЛЛА\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ ЗОЛОТОМ. \r\nОБИВКА МОЖЕТ БЫТЬ ПРЕДСТАВЛЕНА В ТКАНИ \r\nИЛИ КОЖЕ.\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ ЗОЛОТОМ. \r\nОБИВКА МОЖЕТ БЫТЬ ПРЕДСТАВЛЕНА В ТКАНИ \r\nИЛИ КОЖЕ.',1,NULL,NULL,NULL,NULL,NULL,'Y','15','','','-1320392841',NULL,NULL,NULL),(10,'2017-09-08 15:00:56',1,'2017-09-08 15:00:54',1,2,1,'Y',NULL,NULL,500,'Аладдин',17,'        <p>Комфортная, массивная модель. Обивка - элитные ткани, ручная строчка, \r\n        придают изделию необыкновенный шарм и элегантную роскошь. \r\n        По желанию клиента можно установить механизм трансформации для ежедневного использования или «гостевую раскладушку»</p>\r\n      ','html',18,'        <p>Комфортная, массивная модель. Обивка - элитные ткани, ручная строчка, \r\n        придают изделию необыкновенный шарм и элегантную роскошь. \r\n        По желанию клиента можно установить механизм трансформации для ежедневного использования или «гостевую раскладушку»</p>\r\n      ','html','АЛАДДИН\r\nКОМФОРТНАЯ, МАССИВНАЯ МОДЕЛЬ. ОБИВКА - ЭЛИТНЫЕ \r\nТКАНИ, РУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ \r\nШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. ПО ЖЕЛАНИЮ КЛИЕНТА \r\nМОЖНО УСТАНОВИТЬ МЕХАНИЗМ ТРАНСФОРМАЦИИ \r\nДЛЯ ЕЖЕДНЕВНОГО ИСПОЛЬЗОВАНИЯ ИЛИ «ГОСТЕВУЮ \r\nРАСКЛАДУШКУ»\r\nКОМФОРТНАЯ, МАССИВНАЯ МОДЕЛЬ. ОБИВКА - ЭЛИТНЫЕ \r\nТКАНИ, РУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ \r\nШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. ПО ЖЕЛАНИЮ КЛИЕНТА \r\nМОЖНО УСТАНОВИТЬ МЕХАНИЗМ ТРАНСФОРМАЦИИ \r\nДЛЯ ЕЖЕДНЕВНОГО ИСПОЛЬЗОВАНИЯ ИЛИ «ГОСТЕВУЮ \r\nРАСКЛАДУШКУ»',1,NULL,NULL,NULL,NULL,NULL,'Y','16','','','1053250178',NULL,NULL,NULL),(11,'2017-09-08 15:00:58',1,'2017-09-08 15:00:57',1,2,1,'Y',NULL,NULL,500,'Джоконда',19,'          <p>Изящный каркас, элитные ткани для обивки, ручная строчка, придают изделию необыкновенный шарм и элегантную роскошь. \r\n          Обивка также может быть в коже, по желанию клиента возможна простежка на подлокотниках и спинке.</p>\r\n        ','html',20,'          <p>Изящный каркас, элитные ткани для обивки, ручная строчка, придают изделию необыкновенный шарм и элегантную роскошь. \r\n          Обивка также может быть в коже, по желанию клиента возможна простежка на подлокотниках и спинке.</p>\r\n        ','html','ДЖОКОНДА\r\nИЗЯЩНЫЙ КАРКАС, ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ, \r\nРУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ \r\nШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. ОБИВКА ТАКЖЕ \r\nМОЖЕТ БЫТЬ В КОЖЕ, ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА \r\nПРОСТЕЖКА НА ПОДЛОКОТНИКАХ И СПИНКЕ.\r\nИЗЯЩНЫЙ КАРКАС, ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ, \r\nРУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ \r\nШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. ОБИВКА ТАКЖЕ \r\nМОЖЕТ БЫТЬ В КОЖЕ, ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА \r\nПРОСТЕЖКА НА ПОДЛОКОТНИКАХ И СПИНКЕ.',1,NULL,NULL,NULL,NULL,NULL,'Y','17','','','-106709740',NULL,NULL,NULL),(12,'2017-09-08 15:01:00',1,'2017-09-08 15:00:58',1,2,1,'Y',NULL,NULL,500,'Флора',21,'        <p>Классическая модель создана для украшения роскошных интерьеров. \r\n        Элегантность и колоритность модели придают накладки из натурального дерева.</p>\r\n      ','html',22,'        <p>Классическая модель создана для украшения роскошных интерьеров. \r\n        Элегантность и колоритность модели придают накладки из натурального дерева.</p>\r\n      ','html','ФЛОРА\r\nКЛАССИЧЕСКАЯ МОДЕЛЬ СОЗДАНА ДЛЯ УКРАШЕНИЯ \r\nРОСКОШНЫХ ИНТЕРЬЕРОВ. ЭЛЕГАНТНОСТЬ И КОЛОРИТНОСТЬ \r\nМОДЕЛИ ПРИДАЮТ НАКЛАДКИ ИЗ НАТУРАЛЬНОГО \r\nДЕРЕВА.\r\nКЛАССИЧЕСКАЯ МОДЕЛЬ СОЗДАНА ДЛЯ УКРАШЕНИЯ \r\nРОСКОШНЫХ ИНТЕРЬЕРОВ. ЭЛЕГАНТНОСТЬ И КОЛОРИТНОСТЬ \r\nМОДЕЛИ ПРИДАЮТ НАКЛАДКИ ИЗ НАТУРАЛЬНОГО \r\nДЕРЕВА.',1,NULL,NULL,NULL,NULL,NULL,'Y','18','','','-1053944437',NULL,NULL,NULL),(13,'2017-09-08 15:01:02',1,'2017-09-08 15:01:00',1,2,1,'Y',NULL,NULL,500,'Престиж',23,'          <p>Тахта в классическом исполнении. Подлокотник находится слева – это стандарт. Обивка может быть как в ткани, так и в коже.</p>\r\n        ','html',24,'          <p>Тахта в классическом исполнении. Подлокотник находится слева – это стандарт. Обивка может быть как в ткани, так и в коже.</p>\r\n        ','html','ПРЕСТИЖ\r\nТАХТА В КЛАССИЧЕСКОМ ИСПОЛНЕНИИ. ПОДЛОКОТНИК \r\nНАХОДИТСЯ СЛЕВА – ЭТО СТАНДАРТ. ОБИВКА \r\nМОЖЕТ БЫТЬ КАК В ТКАНИ, ТАК И В КОЖЕ.\r\nТАХТА В КЛАССИЧЕСКОМ ИСПОЛНЕНИИ. ПОДЛОКОТНИК \r\nНАХОДИТСЯ СЛЕВА – ЭТО СТАНДАРТ. ОБИВКА \r\nМОЖЕТ БЫТЬ КАК В ТКАНИ, ТАК И В КОЖЕ.',1,NULL,NULL,NULL,NULL,NULL,'Y','19','','','273423738',NULL,NULL,NULL),(14,'2017-09-08 15:01:04',1,'2017-09-08 15:01:02',1,2,1,'Y',NULL,NULL,500,'Лаура',25,'        <p>Двухместная софа на основе конусных пружин или на основе комбинации плотных поролонов, по Вашему желанию. \r\n        Элитные ткани для обивки придают модели необыкновенный шарм и элегантную роскошь.</p>\r\n      ','html',26,'        <p>Двухместная софа на основе конусных пружин или на основе комбинации плотных поролонов, по Вашему желанию. \r\n        Элитные ткани для обивки придают модели необыкновенный шарм и элегантную роскошь.</p>\r\n      ','html','ЛАУРА\r\nДВУХМЕСТНАЯ СОФА НА ОСНОВЕ КОНУСНЫХ ПРУЖИН \r\nИЛИ НА ОСНОВЕ КОМБИНАЦИИ ПЛОТНЫХ ПОРОЛОНОВ, \r\nПО ВАШЕМУ ЖЕЛАНИЮ. ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ \r\nПРИДАЮТ МОДЕЛИ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ \r\nРОСКОШЬ.\r\nДВУХМЕСТНАЯ СОФА НА ОСНОВЕ КОНУСНЫХ ПРУЖИН \r\nИЛИ НА ОСНОВЕ КОМБИНАЦИИ ПЛОТНЫХ ПОРОЛОНОВ, \r\nПО ВАШЕМУ ЖЕЛАНИЮ. ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ \r\nПРИДАЮТ МОДЕЛИ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ \r\nРОСКОШЬ.',1,NULL,NULL,NULL,NULL,NULL,'Y','20','','','-281088768',NULL,NULL,NULL),(15,'2017-09-08 15:01:08',1,'2017-09-08 15:01:04',1,2,2,'Y',NULL,NULL,500,'Модерн',27,'         <p>Основными характеристиками данной серии является новизна дизайнерской мысли, \r\n          которая воплощена во внешнем облике этой мебели, и оригинальность исполнения классической компоновки, \r\n          которая сочетает в себе оптимальный набор всех необходимых элементов и свежие решения в их организации. \r\n          Что в сочетании с удачными цветовыми решениями создаст в вашем офисе атмосферу неповторимой индивидуальности. \r\n          Данная серия – наилучшее решение для бизнесменов, которые привыкли быть на шаг впереди не только своих конкурентов, \r\n          но и самого времени.</p>\r\n        ','html',28,'          <p>Основными характеристиками данной серии является новизна дизайнерской мысли, \r\n          которая воплощена во внешнем облике этой мебели, и оригинальность исполнения классической компоновки, \r\n          которая сочетает в себе оптимальный набор всех необходимых элементов и свежие решения в их организации. \r\n          Что в сочетании с удачными цветовыми решениями создаст в вашем офисе атмосферу неповторимой индивидуальности. \r\n          Данная серия – наилучшее решение для бизнесменов, которые привыкли быть на шаг впереди не только своих конкурентов, \r\n          но и самого времени.</p>\r\n        ','html','МОДЕРН\r\nОСНОВНЫМИ ХАРАКТЕРИСТИКАМИ ДАННОЙ СЕРИИ \r\nЯВЛЯЕТСЯ НОВИЗНА ДИЗАЙНЕРСКОЙ МЫСЛИ, КОТОРАЯ \r\nВОПЛОЩЕНА ВО ВНЕШНЕМ ОБЛИКЕ ЭТОЙ МЕБЕЛИ, \r\nИ ОРИГИНАЛЬНОСТЬ ИСПОЛНЕНИЯ КЛАССИЧЕСКОЙ \r\nКОМПОНОВКИ, КОТОРАЯ СОЧЕТАЕТ В СЕБЕ ОПТИМАЛЬНЫЙ \r\nНАБОР ВСЕХ НЕОБХОДИМЫХ ЭЛЕМЕНТОВ И СВЕЖИЕ \r\nРЕШЕНИЯ В ИХ ОРГАНИЗАЦИИ. ЧТО В СОЧЕТАНИИ \r\nС УДАЧНЫМИ ЦВЕТОВЫМИ РЕШЕНИЯМИ СОЗДАСТ \r\nВ ВАШЕМ ОФИСЕ АТМОСФЕРУ НЕПОВТОРИМОЙ ИНДИВИДУАЛЬНОСТИ. \r\nДАННАЯ СЕРИЯ – НАИЛУЧШЕЕ РЕШЕНИЕ ДЛЯ БИЗНЕСМЕНОВ, \r\nКОТОРЫЕ ПРИВЫКЛИ БЫТЬ НА ШАГ ВПЕРЕДИ НЕ \r\nТОЛЬКО СВОИХ КОНКУРЕНТОВ, НО И САМОГО ВРЕМЕНИ.\r\nОСНОВНЫМИ ХАРАКТЕРИСТИКАМИ ДАННОЙ СЕРИИ \r\nЯВЛЯЕТСЯ НОВИЗНА ДИЗАЙНЕРСКОЙ МЫСЛИ, КОТОРАЯ \r\nВОПЛОЩЕНА ВО ВНЕШНЕМ ОБЛИКЕ ЭТОЙ МЕБЕЛИ, \r\nИ ОРИГИНАЛЬНОСТЬ ИСПОЛНЕНИЯ КЛАССИЧЕСКОЙ \r\nКОМПОНОВКИ, КОТОРАЯ СОЧЕТАЕТ В СЕБЕ ОПТИМАЛЬНЫЙ \r\nНАБОР ВСЕХ НЕОБХОДИМЫХ ЭЛЕМЕНТОВ И СВЕЖИЕ \r\nРЕШЕНИЯ В ИХ ОРГАНИЗАЦИИ. ЧТО В СОЧЕТАНИИ \r\nС УДАЧНЫМИ ЦВЕТОВЫМИ РЕШЕНИЯМИ СОЗДАСТ \r\nВ ВАШЕМ ОФИСЕ АТМОСФЕРУ НЕПОВТОРИМОЙ ИНДИВИДУАЛЬНОСТИ. \r\nДАННАЯ СЕРИЯ – НАИЛУЧШЕЕ РЕШЕНИЕ ДЛЯ БИЗНЕСМЕНОВ, \r\nКОТОРЫЕ ПРИВЫКЛИ БЫТЬ НА ШАГ ВПЕРЕДИ НЕ \r\nТОЛЬКО СВОИХ КОНКУРЕНТОВ, НО И САМОГО ВРЕМЕНИ.',1,NULL,NULL,NULL,NULL,NULL,'Y','21','','','-1185689438',NULL,NULL,NULL),(16,'2017-09-08 15:01:12',1,'2017-09-08 15:01:08',1,2,2,'Y',NULL,NULL,500,'Оптима',29,'         <p>\r\n          Удачный выбор мебели для персонала во многом определяет успешность деятельности всей компании. \r\n          Правильно организовать рабочее пространство  - значит помочь коллегам выполнять свои функции быстрее и эффективнее.</p><p>\r\n          Серия <b>«Оптима»</b> позволит найти массу решений для обустройства рабочей зоны, приспособить интерьер к должностным \r\n          обязанностям всех категорий сотрудников. Эргономичные угловые столы, перегородки, шкафы и тумбы  помогут рационально использовать \r\n          пространство под уникальное рабочее место, приспособленное к потребностям каждого работника и всей фирмы в целом.</p><p>\r\n          Мебель <b>«Оптима»</b> - это полный набор интерьерных решений для обустройства пространства в офисе по современным стандартам.</p>\r\n        </p>\r\n      ','html',30,'            \r\n        <p>\r\n          Удачный выбор мебели для персонала во многом определяет успешность деятельности всей компании. Правильно организовать рабочее пространство  - значит помочь коллегам выполнять свои функции быстрее и эффективнее.</br>\r\n          Серия <b>«Оптима»</b> позволит найти массу решений для обустройства рабочей зоны, приспособить интерьер к должностным обязанностям всех категорий сотрудников. Эргономичные угловые столы, перегородки, шкафы и тумбы  помогут рационально использовать пространство под уникальное рабочее место, приспособленное к потребностям каждого работника и всей фирмы в целом.</br>\r\n          Мебель <b>«Оптима»</b> - это полный набор интерьерных решений для обустройства пространства в офисе по современным стандартам.\r\n        </p>\r\n      ','html','ОПТИМА\r\nУДАЧНЫЙ ВЫБОР МЕБЕЛИ ДЛЯ ПЕРСОНАЛА ВО МНОГОМ \r\nОПРЕДЕЛЯЕТ УСПЕШНОСТЬ ДЕЯТЕЛЬНОСТИ ВСЕЙ \r\nКОМПАНИИ. ПРАВИЛЬНО ОРГАНИЗОВАТЬ РАБОЧЕЕ \r\nПРОСТРАНСТВО - ЗНАЧИТ ПОМОЧЬ КОЛЛЕГАМ ВЫПОЛНЯТЬ \r\nСВОИ ФУНКЦИИ БЫСТРЕЕ И ЭФФЕКТИВНЕЕ.\r\n\r\nСЕРИЯ «ОПТИМА» ПОЗВОЛИТ НАЙТИ МАССУ РЕШЕНИЙ \r\nДЛЯ ОБУСТРОЙСТВА РАБОЧЕЙ ЗОНЫ, ПРИСПОСОБИТЬ \r\nИНТЕРЬЕР К ДОЛЖНОСТНЫМ ОБЯЗАННОСТЯМ ВСЕХ \r\nКАТЕГОРИЙ СОТРУДНИКОВ. ЭРГОНОМИЧНЫЕ УГЛОВЫЕ \r\nСТОЛЫ, ПЕРЕГОРОДКИ, ШКАФЫ И ТУМБЫ ПОМОГУТ \r\nРАЦИОНАЛЬНО ИСПОЛЬЗОВАТЬ ПРОСТРАНСТВО \r\nПОД УНИКАЛЬНОЕ РАБОЧЕЕ МЕСТО, ПРИСПОСОБЛЕННОЕ \r\nК ПОТРЕБНОСТЯМ КАЖДОГО РАБОТНИКА И ВСЕЙ \r\nФИРМЫ В ЦЕЛОМ.\r\n\r\nМЕБЕЛЬ «ОПТИМА» - ЭТО ПОЛНЫЙ НАБОР ИНТЕРЬЕРНЫХ \r\nРЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА ПРОСТРАНСТВА \r\nВ ОФИСЕ ПО СОВРЕМЕННЫМ СТАНДАРТАМ.\r\nУДАЧНЫЙ ВЫБОР МЕБЕЛИ ДЛЯ ПЕРСОНАЛА ВО МНОГОМ \r\nОПРЕДЕЛЯЕТ УСПЕШНОСТЬ ДЕЯТЕЛЬНОСТИ ВСЕЙ \r\nКОМПАНИИ. ПРАВИЛЬНО ОРГАНИЗОВАТЬ РАБОЧЕЕ \r\nПРОСТРАНСТВО - ЗНАЧИТ ПОМОЧЬ КОЛЛЕГАМ ВЫПОЛНЯТЬ \r\nСВОИ ФУНКЦИИ БЫСТРЕЕ И ЭФФЕКТИВНЕЕ. СЕРИЯ \r\n«ОПТИМА» ПОЗВОЛИТ НАЙТИ МАССУ РЕШЕНИЙ ДЛЯ \r\nОБУСТРОЙСТВА РАБОЧЕЙ ЗОНЫ, ПРИСПОСОБИТЬ \r\nИНТЕРЬЕР К ДОЛЖНОСТНЫМ ОБЯЗАННОСТЯМ ВСЕХ \r\nКАТЕГОРИЙ СОТРУДНИКОВ. ЭРГОНОМИЧНЫЕ УГЛОВЫЕ \r\nСТОЛЫ, ПЕРЕГОРОДКИ, ШКАФЫ И ТУМБЫ ПОМОГУТ \r\nРАЦИОНАЛЬНО ИСПОЛЬЗОВАТЬ ПРОСТРАНСТВО \r\nПОД УНИКАЛЬНОЕ РАБОЧЕЕ МЕСТО, ПРИСПОСОБЛЕННОЕ \r\nК ПОТРЕБНОСТЯМ КАЖДОГО РАБОТНИКА И ВСЕЙ \r\nФИРМЫ В ЦЕЛОМ. МЕБЕЛЬ «ОПТИМА» - ЭТО ПОЛНЫЙ \r\nНАБОР ИНТЕРЬЕРНЫХ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА \r\nПРОСТРАНСТВА В ОФИСЕ ПО СОВРЕМЕННЫМ СТАНДАРТАМ.',1,NULL,NULL,NULL,NULL,NULL,'Y','22','','','1945328005',NULL,NULL,NULL),(17,'2017-09-08 15:01:14',1,'2017-09-08 15:01:12',1,2,2,'Y',NULL,NULL,500,'Собрание',31,'        <p>\r\n          Заходя в помещение, где находятся столы для переговоров «Собрание», возникает стойкое ощущение, что находишься в кабинете если не президента страны, то премьер-министра как минимум. Вот-вот в комнату войдет высокопоставленный чиновник, и начнется обсуждение глобальных вопросов.\r\n          Удивительное сочетание изысканной роскоши стиля и красоты классических линий столов «Собрание» и привлекательной цены опровергает устоявшееся утверждение о качестве дешевой мебели. Уменьшение себестоимости происходит за счет использования более дешевых материалов – ДСП и ДВП, что позволяет офисной мебели сохранять великолепные эксплуатационные характеристики.\r\n        </p>\r\n      ','html',32,'        \r\n        <p>\r\n          Заходя в помещение, где находятся столы для переговоров «Собрание», возникает стойкое ощущение, что находишься в кабинете если не президента страны, то премьер-министра как минимум. Вот-вот в комнату войдет высокопоставленный чиновник, и начнется обсуждение глобальных вопросов.\r\n          Удивительное сочетание изысканной роскоши стиля и красоты классических линий столов «Собрание» и привлекательной цены опровергает устоявшееся утверждение о качестве дешевой мебели. Уменьшение себестоимости происходит за счет использования более дешевых материалов – ДСП и ДВП, что позволяет офисной мебели сохранять великолепные эксплуатационные характеристики.\r\n        </p>\r\n      ','html','СОБРАНИЕ\r\nЗАХОДЯ В ПОМЕЩЕНИЕ, ГДЕ НАХОДЯТСЯ СТОЛЫ \r\nДЛЯ ПЕРЕГОВОРОВ «СОБРАНИЕ», ВОЗНИКАЕТ СТОЙКОЕ \r\nОЩУЩЕНИЕ, ЧТО НАХОДИШЬСЯ В КАБИНЕТЕ ЕСЛИ \r\nНЕ ПРЕЗИДЕНТА СТРАНЫ, ТО ПРЕМЬЕР-МИНИСТРА \r\nКАК МИНИМУМ. ВОТ-ВОТ В КОМНАТУ ВОЙДЕТ ВЫСОКОПОСТАВЛЕННЫЙ \r\nЧИНОВНИК, И НАЧНЕТСЯ ОБСУЖДЕНИЕ ГЛОБАЛЬНЫХ \r\nВОПРОСОВ. УДИВИТЕЛЬНОЕ СОЧЕТАНИЕ ИЗЫСКАННОЙ \r\nРОСКОШИ СТИЛЯ И КРАСОТЫ КЛАССИЧЕСКИХ ЛИНИЙ \r\nСТОЛОВ «СОБРАНИЕ» И ПРИВЛЕКАТЕЛЬНОЙ ЦЕНЫ \r\nОПРОВЕРГАЕТ УСТОЯВШЕЕСЯ УТВЕРЖДЕНИЕ О \r\nКАЧЕСТВЕ ДЕШЕВОЙ МЕБЕЛИ. УМЕНЬШЕНИЕ СЕБЕСТОИМОСТИ \r\nПРОИСХОДИТ ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ БОЛЕЕ \r\nДЕШЕВЫХ МАТЕРИАЛОВ – ДСП И ДВП, ЧТО ПОЗВОЛЯЕТ \r\nОФИСНОЙ МЕБЕЛИ СОХРАНЯТЬ ВЕЛИКОЛЕПНЫЕ \r\nЭКСПЛУАТАЦИОННЫЕ ХАРАКТЕРИСТИКИ.\r\nЗАХОДЯ В ПОМЕЩЕНИЕ, ГДЕ НАХОДЯТСЯ СТОЛЫ \r\nДЛЯ ПЕРЕГОВОРОВ «СОБРАНИЕ», ВОЗНИКАЕТ СТОЙКОЕ \r\nОЩУЩЕНИЕ, ЧТО НАХОДИШЬСЯ В КАБИНЕТЕ ЕСЛИ \r\nНЕ ПРЕЗИДЕНТА СТРАНЫ, ТО ПРЕМЬЕР-МИНИСТРА \r\nКАК МИНИМУМ. ВОТ-ВОТ В КОМНАТУ ВОЙДЕТ ВЫСОКОПОСТАВЛЕННЫЙ \r\nЧИНОВНИК, И НАЧНЕТСЯ ОБСУЖДЕНИЕ ГЛОБАЛЬНЫХ \r\nВОПРОСОВ. УДИВИТЕЛЬНОЕ СОЧЕТАНИЕ ИЗЫСКАННОЙ \r\nРОСКОШИ СТИЛЯ И КРАСОТЫ КЛАССИЧЕСКИХ ЛИНИЙ \r\nСТОЛОВ «СОБРАНИЕ» И ПРИВЛЕКАТЕЛЬНОЙ ЦЕНЫ \r\nОПРОВЕРГАЕТ УСТОЯВШЕЕСЯ УТВЕРЖДЕНИЕ О \r\nКАЧЕСТВЕ ДЕШЕВОЙ МЕБЕЛИ. УМЕНЬШЕНИЕ СЕБЕСТОИМОСТИ \r\nПРОИСХОДИТ ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ БОЛЕЕ \r\nДЕШЕВЫХ МАТЕРИАЛОВ – ДСП И ДВП, ЧТО ПОЗВОЛЯЕТ \r\nОФИСНОЙ МЕБЕЛИ СОХРАНЯТЬ ВЕЛИКОЛЕПНЫЕ \r\nЭКСПЛУАТАЦИОННЫЕ ХАРАКТЕРИСТИКИ.',1,NULL,NULL,NULL,NULL,NULL,'Y','23','','','1523163777',NULL,NULL,NULL),(18,'2017-09-08 15:01:16',1,'2017-09-08 15:01:15',1,2,2,'Y',NULL,NULL,500,'Лидер',33,'        <p>Этот стильный стол абсолютно не симметричен, и это придает ему изящность и оригинальность. \r\n        Слева он опирается на ножку, освобождая полезное пространство для системного блока и ног. \r\n        Справа основанием служит удобная и вместительная тумба. Плавные линии, стильный дизайн и высокая эргономичность являются \r\n        основными достоинствами данной серии.</p>\r\n      ','html',34,'        \r\n        <p>Этот стильный стол абсолютно не симметричен, и это придает ему изящность и оригинальность. \r\n        Слева он опирается на ножку, освобождая полезное пространство для системного блока и ног. \r\n        Справа основанием служит удобная и вместительная тумба. Плавные линии, стильный дизайн и высокая эргономичность являются \r\n        основными достоинствами данной серии.</p>\r\n        \r\n      ','html','ЛИДЕР\r\nЭТОТ СТИЛЬНЫЙ СТОЛ АБСОЛЮТНО НЕ СИММЕТРИЧЕН, \r\nИ ЭТО ПРИДАЕТ ЕМУ ИЗЯЩНОСТЬ И ОРИГИНАЛЬНОСТЬ. \r\nСЛЕВА ОН ОПИРАЕТСЯ НА НОЖКУ, ОСВОБОЖДАЯ \r\nПОЛЕЗНОЕ ПРОСТРАНСТВО ДЛЯ СИСТЕМНОГО БЛОКА \r\nИ НОГ. СПРАВА ОСНОВАНИЕМ СЛУЖИТ УДОБНАЯ \r\nИ ВМЕСТИТЕЛЬНАЯ ТУМБА. ПЛАВНЫЕ ЛИНИИ, СТИЛЬНЫЙ \r\nДИЗАЙН И ВЫСОКАЯ ЭРГОНОМИЧНОСТЬ ЯВЛЯЮТСЯ \r\nОСНОВНЫМИ ДОСТОИНСТВАМИ ДАННОЙ СЕРИИ.\r\nЭТОТ СТИЛЬНЫЙ СТОЛ АБСОЛЮТНО НЕ СИММЕТРИЧЕН, \r\nИ ЭТО ПРИДАЕТ ЕМУ ИЗЯЩНОСТЬ И ОРИГИНАЛЬНОСТЬ. \r\nСЛЕВА ОН ОПИРАЕТСЯ НА НОЖКУ, ОСВОБОЖДАЯ \r\nПОЛЕЗНОЕ ПРОСТРАНСТВО ДЛЯ СИСТЕМНОГО БЛОКА \r\nИ НОГ. СПРАВА ОСНОВАНИЕМ СЛУЖИТ УДОБНАЯ \r\nИ ВМЕСТИТЕЛЬНАЯ ТУМБА. ПЛАВНЫЕ ЛИНИИ, СТИЛЬНЫЙ \r\nДИЗАЙН И ВЫСОКАЯ ЭРГОНОМИЧНОСТЬ ЯВЛЯЮТСЯ \r\nОСНОВНЫМИ ДОСТОИНСТВАМИ ДАННОЙ СЕРИИ.',1,NULL,NULL,NULL,NULL,NULL,'Y','24','','','-1927682590',NULL,NULL,NULL),(19,'2017-09-08 15:01:20',1,'2017-09-08 15:01:16',1,2,2,'Y',NULL,NULL,500,'Президент',35,'        <p><b>Кресло руководителя Президент</b> во главе большого круглого стола поможет создать в вашем кабинете\r\n        обстановку легендарной совещательной комнаты. Ведь это не просто мебель офисная – это настоящий трон, который \r\n        поможет управленцу решать любые вопросы, согласуясь с понятиями чести и совести.</p> \r\n      ','html',36,'        \r\n        <p><b>Кресло руководителя Президент</b> во главе большого круглого стола поможет создать в вашем кабинете\r\n        обстановку легендарной совещательной комнаты. Ведь это не просто мебель офисная – это настоящий трон, который \r\n        поможет управленцу решать любые вопросы, согласуясь с понятиями чести и совести. \r\n        Дизайн кресла выполнен в строгом классическом стиле. Окантовка и подлокотники кресла выточена вручную и потому уникальны. \r\n        Производится ограниченными партиями - не более 10 кресел в год.</p>\r\n        \r\n      ','html','ПРЕЗИДЕНТ\r\nКРЕСЛО РУКОВОДИТЕЛЯ ПРЕЗИДЕНТ ВО ГЛАВЕ \r\nБОЛЬШОГО КРУГЛОГО СТОЛА ПОМОЖЕТ СОЗДАТЬ \r\nВ ВАШЕМ КАБИНЕТЕ ОБСТАНОВКУ ЛЕГЕНДАРНОЙ \r\nСОВЕЩАТЕЛЬНОЙ КОМНАТЫ. ВЕДЬ ЭТО НЕ ПРОСТО \r\nМЕБЕЛЬ ОФИСНАЯ – ЭТО НАСТОЯЩИЙ ТРОН, КОТОРЫЙ \r\nПОМОЖЕТ УПРАВЛЕНЦУ РЕШАТЬ ЛЮБЫЕ ВОПРОСЫ, \r\nСОГЛАСУЯСЬ С ПОНЯТИЯМИ ЧЕСТИ И СОВЕСТИ.\r\nКРЕСЛО РУКОВОДИТЕЛЯ ПРЕЗИДЕНТ ВО ГЛАВЕ \r\nБОЛЬШОГО КРУГЛОГО СТОЛА ПОМОЖЕТ СОЗДАТЬ \r\nВ ВАШЕМ КАБИНЕТЕ ОБСТАНОВКУ ЛЕГЕНДАРНОЙ \r\nСОВЕЩАТЕЛЬНОЙ КОМНАТЫ. ВЕДЬ ЭТО НЕ ПРОСТО \r\nМЕБЕЛЬ ОФИСНАЯ – ЭТО НАСТОЯЩИЙ ТРОН, КОТОРЫЙ \r\nПОМОЖЕТ УПРАВЛЕНЦУ РЕШАТЬ ЛЮБЫЕ ВОПРОСЫ, \r\nСОГЛАСУЯСЬ С ПОНЯТИЯМИ ЧЕСТИ И СОВЕСТИ. \r\nДИЗАЙН КРЕСЛА ВЫПОЛНЕН В СТРОГОМ КЛАССИЧЕСКОМ \r\nСТИЛЕ. ОКАНТОВКА И ПОДЛОКОТНИКИ КРЕСЛА \r\nВЫТОЧЕНА ВРУЧНУЮ И ПОТОМУ УНИКАЛЬНЫ. ПРОИЗВОДИТСЯ \r\nОГРАНИЧЕННЫМИ ПАРТИЯМИ - НЕ БОЛЕЕ 10 КРЕСЕЛ \r\nВ ГОД.',1,NULL,NULL,NULL,NULL,NULL,'Y','25','','','-1836002422',NULL,NULL,NULL),(20,'2017-09-08 15:01:22',1,'2017-09-08 15:01:20',1,2,2,'Y',NULL,NULL,500,'Плутон',37,'        <p>Офисное кресло, подобранное с учетом ваших физиологических особенностей - важная составляющая работоспособности и здоровья. \r\n        Данная модель будет незаменима для тех, кто много работает за компьютером.</p>\r\n      ','html',38,'        \r\n        <p>Офисное кресло, подобранное с учетом ваших физиологических особенностей - важная составляющая работоспособности и здоровья. \r\n        Данная модель будет незаменима для тех, кто много работает за компьютером.</p>\r\n        \r\n      ','html','ПЛУТОН\r\nОФИСНОЕ КРЕСЛО, ПОДОБРАННОЕ С УЧЕТОМ ВАШИХ \r\nФИЗИОЛОГИЧЕСКИХ ОСОБЕННОСТЕЙ - ВАЖНАЯ СОСТАВЛЯЮЩАЯ \r\nРАБОТОСПОСОБНОСТИ И ЗДОРОВЬЯ. ДАННАЯ МОДЕЛЬ \r\nБУДЕТ НЕЗАМЕНИМА ДЛЯ ТЕХ, КТО МНОГО РАБОТАЕТ \r\nЗА КОМПЬЮТЕРОМ.\r\nОФИСНОЕ КРЕСЛО, ПОДОБРАННОЕ С УЧЕТОМ ВАШИХ \r\nФИЗИОЛОГИЧЕСКИХ ОСОБЕННОСТЕЙ - ВАЖНАЯ СОСТАВЛЯЮЩАЯ \r\nРАБОТОСПОСОБНОСТИ И ЗДОРОВЬЯ. ДАННАЯ МОДЕЛЬ \r\nБУДЕТ НЕЗАМЕНИМА ДЛЯ ТЕХ, КТО МНОГО РАБОТАЕТ \r\nЗА КОМПЬЮТЕРОМ.',1,NULL,NULL,NULL,NULL,NULL,'Y','26','','','1990779533',NULL,NULL,NULL),(21,'2017-09-08 15:01:26',1,'2017-09-08 15:01:22',1,2,3,'Y',NULL,NULL,500,'Парма',39,'        <p>Стулья Парма внесут в кухню уютное обаяние экологически чистого древесного материала. \r\n        Стул практически целиком сделан из массива бука, исключением стало лишь мягкое сиденье. \r\n        Тонировка деревянных деталей может быть выполнена в любой цветовой палитре.</p>\r\n      ','html',40,'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;p&gt;Стулья Парма внесут в кухню уютное обаяние экологически чистого древесного материала. <br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Стул практически целиком сделан из массива бука, исключением стало лишь мягкое сиденье. <br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Тонировка деревянных деталей может быть выполнена в любой цветовой палитре.&lt;/p&gt;<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;','html','ПАРМА\r\nСТУЛЬЯ ПАРМА ВНЕСУТ В КУХНЮ УЮТНОЕ ОБАЯНИЕ \r\nЭКОЛОГИЧЕСКИ ЧИСТОГО ДРЕВЕСНОГО МАТЕРИАЛА. \r\nСТУЛ ПРАКТИЧЕСКИ ЦЕЛИКОМ СДЕЛАН ИЗ МАССИВА \r\nБУКА, ИСКЛЮЧЕНИЕМ СТАЛО ЛИШЬ МЯГКОЕ СИДЕНЬЕ. \r\nТОНИРОВКА ДЕРЕВЯННЫХ ДЕТАЛЕЙ МОЖЕТ БЫТЬ \r\nВЫПОЛНЕНА В ЛЮБОЙ ЦВЕТОВОЙ ПАЛИТРЕ.\r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;\r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&LT;P&GT;СТУЛЬЯ ПАРМА \r\nВНЕСУТ В КУХНЮ УЮТНОЕ ОБАЯНИЕ ЭКОЛОГИЧЕСКИ \r\nЧИСТОГО ДРЕВЕСНОГО МАТЕРИАЛА. \r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;СТУЛ ПРАКТИЧЕСКИ \r\nЦЕЛИКОМ СДЕЛАН ИЗ МАССИВА БУКА, ИСКЛЮЧЕНИЕМ \r\nСТАЛО ЛИШЬ МЯГКОЕ СИДЕНЬЕ. \r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;ТОНИРОВКА ДЕРЕВЯННЫХ \r\nДЕТАЛЕЙ МОЖЕТ БЫТЬ ВЫПОЛНЕНА В ЛЮБОЙ ЦВЕТОВОЙ \r\nПАЛИТРЕ.&LT;/P&GT;\r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;\r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;',1,NULL,NULL,NULL,NULL,NULL,'Y','27','','','964589627',NULL,NULL,NULL),(22,'2017-09-08 15:01:28',1,'2017-09-08 15:01:26',1,2,3,'Y',NULL,NULL,500,'Палермо',41,'        <p>Универсальный дизайн стульев Палермо позволит с успехом использовать их и в офисных помещениях, \r\n        и в интерьере кафе, и в домашней обстановке. Стулья Палермо добавят уюта в каждое помещение и \r\n        органично сольются с его стилем.</p>\r\n      ','html',42,'        \r\n        <p>Универсальный дизайн стульев Палермо позволит с успехом использовать их и в офисных помещениях, \r\n        и в интерьере кафе, и в домашней обстановке. Стулья Палермо добавят уюта в каждое помещение и \r\n        органично сольются с его стилем.</p>\r\n        \r\n      ','html','ПАЛЕРМО\r\nУНИВЕРСАЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ПАЛЕРМО ПОЗВОЛИТ \r\nС УСПЕХОМ ИСПОЛЬЗОВАТЬ ИХ И В ОФИСНЫХ ПОМЕЩЕНИЯХ, \r\nИ В ИНТЕРЬЕРЕ КАФЕ, И В ДОМАШНЕЙ ОБСТАНОВКЕ. \r\nСТУЛЬЯ ПАЛЕРМО ДОБАВЯТ УЮТА В КАЖДОЕ ПОМЕЩЕНИЕ \r\nИ ОРГАНИЧНО СОЛЬЮТСЯ С ЕГО СТИЛЕМ.\r\nУНИВЕРСАЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ПАЛЕРМО ПОЗВОЛИТ \r\nС УСПЕХОМ ИСПОЛЬЗОВАТЬ ИХ И В ОФИСНЫХ ПОМЕЩЕНИЯХ, \r\nИ В ИНТЕРЬЕРЕ КАФЕ, И В ДОМАШНЕЙ ОБСТАНОВКЕ. \r\nСТУЛЬЯ ПАЛЕРМО ДОБАВЯТ УЮТА В КАЖДОЕ ПОМЕЩЕНИЕ \r\nИ ОРГАНИЧНО СОЛЬЮТСЯ С ЕГО СТИЛЕМ.',1,NULL,NULL,NULL,NULL,NULL,'Y','28','','','-1151185156',NULL,NULL,NULL),(23,'2017-09-08 15:01:32',1,'2017-09-08 15:01:29',1,2,3,'Y',NULL,NULL,500,'Валенсия',43,'        <p>Стильный дизайн стульев Валенсия сразу привлекает внимание, а эргономичная форма спинки и \r\n        мягкое сиденье делают их необычайно удобными. Эти стулья хорошо подойдут к любой офисной мебели для \r\n        персонала.</p>\r\n      ','html',44,'        \r\n        <p>Стильный дизайн стульев Валенсия сразу привлекает внимание, а эргономичная форма спинки и \r\n        мягкое сиденье делают их необычайно удобными. Эти стулья хорошо подойдут к любой офисной мебели для \r\n        персонала.</p>\r\n        \r\n      ','html','ВАЛЕНСИЯ\r\nСТИЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ВАЛЕНСИЯ СРАЗУ \r\nПРИВЛЕКАЕТ ВНИМАНИЕ, А ЭРГОНОМИЧНАЯ ФОРМА \r\nСПИНКИ И МЯГКОЕ СИДЕНЬЕ ДЕЛАЮТ ИХ НЕОБЫЧАЙНО \r\nУДОБНЫМИ. ЭТИ СТУЛЬЯ ХОРОШО ПОДОЙДУТ К ЛЮБОЙ \r\nОФИСНОЙ МЕБЕЛИ ДЛЯ ПЕРСОНАЛА.\r\nСТИЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ВАЛЕНСИЯ СРАЗУ \r\nПРИВЛЕКАЕТ ВНИМАНИЕ, А ЭРГОНОМИЧНАЯ ФОРМА \r\nСПИНКИ И МЯГКОЕ СИДЕНЬЕ ДЕЛАЮТ ИХ НЕОБЫЧАЙНО \r\nУДОБНЫМИ. ЭТИ СТУЛЬЯ ХОРОШО ПОДОЙДУТ К ЛЮБОЙ \r\nОФИСНОЙ МЕБЕЛИ ДЛЯ ПЕРСОНАЛА.',1,NULL,NULL,NULL,NULL,NULL,'Y','29','','','589017098',NULL,NULL,NULL),(24,'2017-09-08 15:01:37',1,'2017-09-08 15:01:33',1,2,4,'Y',NULL,NULL,500,'Фазенда',45,'        <p>Складной деревянный стул с сиденьем и спинкой из плотного хлопка, изготовленный из натуральных природных материалов. \r\n        Ткань и дерево считаются теплыми материалами - даже зимой сидеть на них комфортнее, чем на железе или пластике. Это прекрасное решение для дачи.</p>\r\n      ','html',46,'        \r\n        <p>Складной деревянный стул с сиденьем и спинкой из плотного хлопка, изготовленный из натуральных природных материалов. \r\n        Ткань и дерево считаются теплыми материалами - даже зимой сидеть на них комфортнее, чем на железе или пластике. Это прекрасное решение для дачи.</p>\r\n        \r\n      ','html','ФАЗЕНДА\r\nСКЛАДНОЙ ДЕРЕВЯННЫЙ СТУЛ С СИДЕНЬЕМ И СПИНКОЙ \r\nИЗ ПЛОТНОГО ХЛОПКА, ИЗГОТОВЛЕННЫЙ ИЗ НАТУРАЛЬНЫХ \r\nПРИРОДНЫХ МАТЕРИАЛОВ. ТКАНЬ И ДЕРЕВО СЧИТАЮТСЯ \r\nТЕПЛЫМИ МАТЕРИАЛАМИ - ДАЖЕ ЗИМОЙ СИДЕТЬ \r\nНА НИХ КОМФОРТНЕЕ, ЧЕМ НА ЖЕЛЕЗЕ ИЛИ ПЛАСТИКЕ. \r\nЭТО ПРЕКРАСНОЕ РЕШЕНИЕ ДЛЯ ДАЧИ.\r\nСКЛАДНОЙ ДЕРЕВЯННЫЙ СТУЛ С СИДЕНЬЕМ И СПИНКОЙ \r\nИЗ ПЛОТНОГО ХЛОПКА, ИЗГОТОВЛЕННЫЙ ИЗ НАТУРАЛЬНЫХ \r\nПРИРОДНЫХ МАТЕРИАЛОВ. ТКАНЬ И ДЕРЕВО СЧИТАЮТСЯ \r\nТЕПЛЫМИ МАТЕРИАЛАМИ - ДАЖЕ ЗИМОЙ СИДЕТЬ \r\nНА НИХ КОМФОРТНЕЕ, ЧЕМ НА ЖЕЛЕЗЕ ИЛИ ПЛАСТИКЕ. \r\nЭТО ПРЕКРАСНОЕ РЕШЕНИЕ ДЛЯ ДАЧИ.',1,NULL,NULL,NULL,NULL,NULL,'Y','30','','','-1288812514',NULL,NULL,NULL),(25,'2017-09-08 15:01:42',1,'2017-09-08 15:01:38',1,2,4,'Y',NULL,NULL,500,'Эра',47,'        <p>Стильный стул необычный формы с жесткими сиденьями на металлическом каркасе удобен тем, \r\n        что можно компактно сложить для хранения до 45 таких стульев. Легкая и прочная модель отлично подойдет \r\n        к компьютерной стойке, также ее можно использовать как мебель для кафе и баров.</p>\r\n      ','html',48,'        \r\n        <p>Стильный стул необычный формы с жесткими сиденьями на металлическом каркасе удобен тем, \r\n        что можно компактно сложить для хранения до 45 таких стульев. Легкая и прочная модель отлично подойдет \r\n        к компьютерной стойке, также ее можно использовать как мебель для кафе и баров.</p>\r\n        \r\n      ','html','ЭРА\r\nСТИЛЬНЫЙ СТУЛ НЕОБЫЧНЫЙ ФОРМЫ С ЖЕСТКИМИ \r\nСИДЕНЬЯМИ НА МЕТАЛЛИЧЕСКОМ КАРКАСЕ УДОБЕН \r\nТЕМ, ЧТО МОЖНО КОМПАКТНО СЛОЖИТЬ ДЛЯ ХРАНЕНИЯ \r\nДО 45 ТАКИХ СТУЛЬЕВ. ЛЕГКАЯ И ПРОЧНАЯ МОДЕЛЬ \r\nОТЛИЧНО ПОДОЙДЕТ К КОМПЬЮТЕРНОЙ СТОЙКЕ, \r\nТАКЖЕ ЕЕ МОЖНО ИСПОЛЬЗОВАТЬ КАК МЕБЕЛЬ \r\nДЛЯ КАФЕ И БАРОВ.\r\nСТИЛЬНЫЙ СТУЛ НЕОБЫЧНЫЙ ФОРМЫ С ЖЕСТКИМИ \r\nСИДЕНЬЯМИ НА МЕТАЛЛИЧЕСКОМ КАРКАСЕ УДОБЕН \r\nТЕМ, ЧТО МОЖНО КОМПАКТНО СЛОЖИТЬ ДЛЯ ХРАНЕНИЯ \r\nДО 45 ТАКИХ СТУЛЬЕВ. ЛЕГКАЯ И ПРОЧНАЯ МОДЕЛЬ \r\nОТЛИЧНО ПОДОЙДЕТ К КОМПЬЮТЕРНОЙ СТОЙКЕ, \r\nТАКЖЕ ЕЕ МОЖНО ИСПОЛЬЗОВАТЬ КАК МЕБЕЛЬ \r\nДЛЯ КАФЕ И БАРОВ.',1,NULL,NULL,NULL,NULL,NULL,'Y','31','','','858154825',NULL,NULL,NULL),(26,'2017-09-08 15:01:45',1,'2017-09-08 15:01:43',1,2,4,'Y',NULL,NULL,500,'Сити',49,'        <p>Стильный, легкий и удобный стул на хромированном основании сразу привлекает внимание \r\n        своей необычной формой. А разнообразные варианты обивки позволяют подобрать наилучшее сочетание с \r\n        любой компьютерной мебелью.</p>\r\n      ','html',50,'        \r\n        <p>Стильный, легкий и удобный стул на хромированном основании сразу привлекает внимание \r\n        своей необычной формой. А разнообразные варианты обивки позволяют подобрать наилучшее сочетание с \r\n        любой компьютерной мебелью.</p>\r\n        \r\n      ','html','СИТИ\r\nСТИЛЬНЫЙ, ЛЕГКИЙ И УДОБНЫЙ СТУЛ НА ХРОМИРОВАННОМ \r\nОСНОВАНИИ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ СВОЕЙ \r\nНЕОБЫЧНОЙ ФОРМОЙ. А РАЗНООБРАЗНЫЕ ВАРИАНТЫ \r\nОБИВКИ ПОЗВОЛЯЮТ ПОДОБРАТЬ НАИЛУЧШЕЕ СОЧЕТАНИЕ \r\nС ЛЮБОЙ КОМПЬЮТЕРНОЙ МЕБЕЛЬЮ.\r\nСТИЛЬНЫЙ, ЛЕГКИЙ И УДОБНЫЙ СТУЛ НА ХРОМИРОВАННОМ \r\nОСНОВАНИИ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ СВОЕЙ \r\nНЕОБЫЧНОЙ ФОРМОЙ. А РАЗНООБРАЗНЫЕ ВАРИАНТЫ \r\nОБИВКИ ПОЗВОЛЯЮТ ПОДОБРАТЬ НАИЛУЧШЕЕ СОЧЕТАНИЕ \r\nС ЛЮБОЙ КОМПЬЮТЕРНОЙ МЕБЕЛЬЮ.',1,NULL,NULL,NULL,NULL,NULL,'Y','32','','','-252178488',NULL,NULL,NULL),(27,'2017-09-08 15:01:49',1,'2017-09-08 15:01:45',1,2,4,'Y',NULL,NULL,500,'Изопласт Хром',51,'        <p>Популярная модель офисного стула на хромированном металлическом каркасе с пластиковыми спинкой и \r\n        сиденьем хорошо вписывается в любой интерьер. Прочные и долговечные, эти стулья удобны для использования \r\n        в качестве аудиторных конференц-кресел, кроме того, их легко хранить.</p>\r\n      ','html',52,'        \r\n        <p>Популярная модель офисного стула на хромированном металлическом каркасе с пластиковыми спинкой и \r\n        сиденьем хорошо вписывается в любой интерьер. Прочные и долговечные, эти стулья удобны для использования \r\n        в качестве аудиторных конференц-кресел, кроме того, их легко хранить.</p>\r\n        \r\n      ','html','ИЗОПЛАСТ ХРОМ\r\nПОПУЛЯРНАЯ МОДЕЛЬ ОФИСНОГО СТУЛА НА ХРОМИРОВАННОМ \r\nМЕТАЛЛИЧЕСКОМ КАРКАСЕ С ПЛАСТИКОВЫМИ СПИНКОЙ \r\nИ СИДЕНЬЕМ ХОРОШО ВПИСЫВАЕТСЯ В ЛЮБОЙ ИНТЕРЬЕР. \r\nПРОЧНЫЕ И ДОЛГОВЕЧНЫЕ, ЭТИ СТУЛЬЯ УДОБНЫ \r\nДЛЯ ИСПОЛЬЗОВАНИЯ В КАЧЕСТВЕ АУДИТОРНЫХ \r\nКОНФЕРЕНЦ-КРЕСЕЛ, КРОМЕ ТОГО, ИХ ЛЕГКО ХРАНИТЬ.\r\nПОПУЛЯРНАЯ МОДЕЛЬ ОФИСНОГО СТУЛА НА ХРОМИРОВАННОМ \r\nМЕТАЛЛИЧЕСКОМ КАРКАСЕ С ПЛАСТИКОВЫМИ СПИНКОЙ \r\nИ СИДЕНЬЕМ ХОРОШО ВПИСЫВАЕТСЯ В ЛЮБОЙ ИНТЕРЬЕР. \r\nПРОЧНЫЕ И ДОЛГОВЕЧНЫЕ, ЭТИ СТУЛЬЯ УДОБНЫ \r\nДЛЯ ИСПОЛЬЗОВАНИЯ В КАЧЕСТВЕ АУДИТОРНЫХ \r\nКОНФЕРЕНЦ-КРЕСЕЛ, КРОМЕ ТОГО, ИХ ЛЕГКО ХРАНИТЬ.',1,NULL,NULL,NULL,NULL,NULL,'Y','33','','','2001037389',NULL,NULL,NULL),(28,'2017-09-08 15:02:23',1,'2017-09-08 15:02:20',1,3,NULL,'Y',NULL,NULL,500,'Мебель на заказ',53,'Наша компания занимается разработкой мебели на заказ.','html',NULL,'        <p>Наша компания занимается разработкой мебели на заказ по индивидуальным проектам: встроенные и корпусные шкафы купе,\r\n        гардеробные комнаты, прихожие, библиотеки, платяные шкафы, комоды и другие сложные конструкции.</p>\r\n        <p>Мы создаем мебель идеально подходящую именно к вашему дому и офису, интерьеры, максимально отображающие вашу индивидуальность.\r\n        По Вашей заявке наш специалист приезжает со всеми образцами материалов, с которыми мы работаем, в любое удобное для Вас время и\r\n        произведет все необходимые замеры. Учитывая все Ваши пожелания и особенности помещения, составляется эскизный проект.</p>\r\n        <p>После заключения договора, в котором оговариваются сроки доставки и монтажа мебели, эскизный проект передается на производство,\r\n        где опытными специалистами производятся расчеты в программе трехмерного моделирования. После всех расчетов готовый проект поступает\r\n        непосредственно на производство, где производят раскрой деталей, их обработку, и сборку некоторых элементов. Накануне дня доставки\r\n        сотрудники отдела транспортных услуг свяжутся с Вами и более конкретно оговорят время доставки. После заключения договора вами\r\n        вносится предоплата в размере 30% от суммы заказанной Вами мебели. Остальная сумма оплачивается Вами по доставке.</p>\r\n        \r\n      ','html','МЕБЕЛЬ НА ЗАКАЗ\r\nНАША КОМПАНИЯ ЗАНИМАЕТСЯ РАЗРАБОТКОЙ МЕБЕЛИ \r\nНА ЗАКАЗ.\r\nНАША КОМПАНИЯ ЗАНИМАЕТСЯ РАЗРАБОТКОЙ МЕБЕЛИ \r\nНА ЗАКАЗ ПО ИНДИВИДУАЛЬНЫМ ПРОЕКТАМ: ВСТРОЕННЫЕ \r\nИ КОРПУСНЫЕ ШКАФЫ КУПЕ, ГАРДЕРОБНЫЕ КОМНАТЫ, \r\nПРИХОЖИЕ, БИБЛИОТЕКИ, ПЛАТЯНЫЕ ШКАФЫ, КОМОДЫ \r\nИ ДРУГИЕ СЛОЖНЫЕ КОНСТРУКЦИИ. \r\n\r\nМЫ СОЗДАЕМ МЕБЕЛЬ ИДЕАЛЬНО ПОДХОДЯЩУЮ \r\nИМЕННО К ВАШЕМУ ДОМУ И ОФИСУ, ИНТЕРЬЕРЫ, \r\nМАКСИМАЛЬНО ОТОБРАЖАЮЩИЕ ВАШУ ИНДИВИДУАЛЬНОСТЬ. \r\nПО ВАШЕЙ ЗАЯВКЕ НАШ СПЕЦИАЛИСТ ПРИЕЗЖАЕТ \r\nСО ВСЕМИ ОБРАЗЦАМИ МАТЕРИАЛОВ, С КОТОРЫМИ \r\nМЫ РАБОТАЕМ, В ЛЮБОЕ УДОБНОЕ ДЛЯ ВАС ВРЕМЯ \r\nИ ПРОИЗВЕДЕТ ВСЕ НЕОБХОДИМЫЕ ЗАМЕРЫ. УЧИТЫВАЯ \r\nВСЕ ВАШИ ПОЖЕЛАНИЯ И ОСОБЕННОСТИ ПОМЕЩЕНИЯ, \r\nСОСТАВЛЯЕТСЯ ЭСКИЗНЫЙ ПРОЕКТ. \r\n\r\nПОСЛЕ ЗАКЛЮЧЕНИЯ ДОГОВОРА, В КОТОРОМ ОГОВАРИВАЮТСЯ \r\nСРОКИ ДОСТАВКИ И МОНТАЖА МЕБЕЛИ, ЭСКИЗНЫЙ \r\nПРОЕКТ ПЕРЕДАЕТСЯ НА ПРОИЗВОДСТВО, ГДЕ \r\nОПЫТНЫМИ СПЕЦИАЛИСТАМИ ПРОИЗВОДЯТСЯ РАСЧЕТЫ \r\nВ ПРОГРАММЕ ТРЕХМЕРНОГО МОДЕЛИРОВАНИЯ. \r\nПОСЛЕ ВСЕХ РАСЧЕТОВ ГОТОВЫЙ ПРОЕКТ ПОСТУПАЕТ \r\nНЕПОСРЕДСТВЕННО НА ПРОИЗВОДСТВО, ГДЕ ПРОИЗВОДЯТ \r\nРАСКРОЙ ДЕТАЛЕЙ, ИХ ОБРАБОТКУ, И СБОРКУ \r\nНЕКОТОРЫХ ЭЛЕМЕНТОВ. НАКАНУНЕ ДНЯ ДОСТАВКИ \r\nСОТРУДНИКИ ОТДЕЛА ТРАНСПОРТНЫХ УСЛУГ СВЯЖУТСЯ \r\nС ВАМИ И БОЛЕЕ КОНКРЕТНО ОГОВОРЯТ ВРЕМЯ \r\nДОСТАВКИ. ПОСЛЕ ЗАКЛЮЧЕНИЯ ДОГОВОРА ВАМИ \r\nВНОСИТСЯ ПРЕДОПЛАТА В РАЗМЕРЕ 30% ОТ СУММЫ \r\nЗАКАЗАННОЙ ВАМИ МЕБЕЛИ. ОСТАЛЬНАЯ СУММА \r\nОПЛАЧИВАЕТСЯ ВАМИ ПО ДОСТАВКЕ.',1,NULL,NULL,NULL,NULL,NULL,'N','5','','','841280321',NULL,NULL,NULL),(29,'2017-09-08 15:02:28',1,'2017-09-08 15:02:23',1,3,NULL,'Y',NULL,NULL,500,'Услуги дизайнера',54,'Мы предлагаем широкий спектр услуг по дизайну мебели.','html',NULL,'        \r\n        <ul>\r\n          <li>Диагностика возможностей преобразования помещений – определение вариантов перепланировки, отделки, разработка новых решений колористки, освещения, перестановки мебели и декора, разработка специальных функциональных зон для переключения в различные режимы жизни.</li>\r\n          <li>Разработка Идеи-Образа, проведение предварительных расчётов и создание 3D-модели: изображение передает цвет и фактуру, предлагая клиенту экспериментировать и подбирать оптимальный вариант.</li>\r\n          <li>Разработка компьютерных цветных трехмерных моделей мебели. Натуралистичность изображений, их высокая схожесть с оригиналом позволяют представить, как будет выглядеть готовое изделие,  рассмотреть его в деталях.</li>\r\n          <li>Подбор и расстановка мебели.</li>\r\n          <li>Декорирование - подбор декора и аксессуаров интерьера в соответствии с образом и стилем помещения. Возможно создание по индивидуальному запросу эксклюзивных, авторских коллекций.</li>\r\n        </ul>\r\n        \r\n      ','html','УСЛУГИ ДИЗАЙНЕРА\r\nМЫ ПРЕДЛАГАЕМ ШИРОКИЙ СПЕКТР УСЛУГ ПО ДИЗАЙНУ \r\nМЕБЕЛИ.\r\n- ДИАГНОСТИКА ВОЗМОЖНОСТЕЙ ПРЕОБРАЗОВАНИЯ \r\nПОМЕЩЕНИЙ – ОПРЕДЕЛЕНИЕ ВАРИАНТОВ ПЕРЕПЛАНИРОВКИ, \r\nОТДЕЛКИ, РАЗРАБОТКА НОВЫХ РЕШЕНИЙ КОЛОРИСТКИ, \r\nОСВЕЩЕНИЯ, ПЕРЕСТАНОВКИ МЕБЕЛИ И ДЕКОРА, \r\nРАЗРАБОТКА СПЕЦИАЛЬНЫХ ФУНКЦИОНАЛЬНЫХ \r\nЗОН ДЛЯ ПЕРЕКЛЮЧЕНИЯ В РАЗЛИЧНЫЕ РЕЖИМЫ \r\nЖИЗНИ. \r\n- РАЗРАБОТКА ИДЕИ-ОБРАЗА, ПРОВЕДЕНИЕ ПРЕДВАРИТЕЛЬНЫХ \r\nРАСЧЁТОВ И СОЗДАНИЕ 3D-МОДЕЛИ: ИЗОБРАЖЕНИЕ \r\nПЕРЕДАЕТ ЦВЕТ И ФАКТУРУ, ПРЕДЛАГАЯ КЛИЕНТУ \r\nЭКСПЕРИМЕНТИРОВАТЬ И ПОДБИРАТЬ ОПТИМАЛЬНЫЙ \r\nВАРИАНТ. \r\n- РАЗРАБОТКА КОМПЬЮТЕРНЫХ ЦВЕТНЫХ ТРЕХМЕРНЫХ \r\nМОДЕЛЕЙ МЕБЕЛИ. НАТУРАЛИСТИЧНОСТЬ ИЗОБРАЖЕНИЙ, \r\nИХ ВЫСОКАЯ СХОЖЕСТЬ С ОРИГИНАЛОМ ПОЗВОЛЯЮТ \r\nПРЕДСТАВИТЬ, КАК БУДЕТ ВЫГЛЯДЕТЬ ГОТОВОЕ \r\nИЗДЕЛИЕ, РАССМОТРЕТЬ ЕГО В ДЕТАЛЯХ. \r\n- ПОДБОР И РАССТАНОВКА МЕБЕЛИ. \r\n- ДЕКОРИРОВАНИЕ - ПОДБОР ДЕКОРА И АКСЕССУАРОВ \r\nИНТЕРЬЕРА В СООТВЕТСТВИИ С ОБРАЗОМ И СТИЛЕМ \r\nПОМЕЩЕНИЯ. ВОЗМОЖНО СОЗДАНИЕ ПО ИНДИВИДУАЛЬНОМУ \r\nЗАПРОСУ ЭКСКЛЮЗИВНЫХ, АВТОРСКИХ КОЛЛЕКЦИЙ.',1,NULL,NULL,NULL,NULL,NULL,'N','6','','','-1080381355',NULL,NULL,NULL),(30,'2017-09-08 15:03:12',1,'2017-09-08 15:03:11',1,4,NULL,'Y','2010-05-01 00:00:00',NULL,200,'Продавец-дизайнер (кухни)',NULL,'','html',NULL,'<b>Требования</b> 						 						 \r\n<p>Уверенный пользователь ПК, навыки черчения от руки и в программах, опыт работы дизайнером/конструктором в мебельной сфере, этика делового общения</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Консультирование клиентов по кухонной мебели, оставление художественно-конструкторских проектов, прием и оформление заказов.</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>Зарплата: 13500 оклад + % от личных продаж + премии‚ совокупный доход от 20000 руб,полный соц. пакет‚ оформление согласно ТК РФ</p>\r\n ','html','ПРОДАВЕЦ-ДИЗАЙНЕР (КУХНИ)\r\n\r\nТРЕБОВАНИЯ \r\n\r\nУВЕРЕННЫЙ ПОЛЬЗОВАТЕЛЬ ПК, НАВЫКИ ЧЕРЧЕНИЯ \r\nОТ РУКИ И В ПРОГРАММАХ, ОПЫТ РАБОТЫ ДИЗАЙНЕРОМ/КОНСТРУКТОРОМ \r\nВ МЕБЕЛЬНОЙ СФЕРЕ, ЭТИКА ДЕЛОВОГО ОБЩЕНИЯ \r\nОБЯЗАННОСТИ \r\n\r\nКОНСУЛЬТИРОВАНИЕ КЛИЕНТОВ ПО КУХОННОЙ \r\nМЕБЕЛИ, ОСТАВЛЕНИЕ ХУДОЖЕСТВЕННО-КОНСТРУКТОРСКИХ \r\nПРОЕКТОВ, ПРИЕМ И ОФОРМЛЕНИЕ ЗАКАЗОВ. УСЛОВИЯ \r\n\r\nЗАРПЛАТА: 13500 ОКЛАД + % ОТ ЛИЧНЫХ ПРОДАЖ + \r\nПРЕМИИ‚ СОВОКУПНЫЙ ДОХОД ОТ 20000 РУБ,ПОЛНЫЙ \r\nСОЦ. ПАКЕТ‚ ОФОРМЛЕНИЕ СОГЛАСНО ТК РФ',1,NULL,NULL,NULL,NULL,NULL,'N','2','','','1704140047',NULL,NULL,NULL),(31,'2017-09-08 15:03:14',1,'2017-09-08 15:03:12',1,4,NULL,'Y','2010-05-01 00:00:00',NULL,300,'Директор магазина',NULL,'','html',NULL,'<b>Требования</b> 						 						 \r\n<p>Высшее образование‚ опыт руководящей работы в рознице от 3 лет‚ опытный пользователь ПК‚ этика делового общения‚ знание методов управления и заключения договоров‚ отличное знание торгового и трудового законодательств‚ ответственность‚ инициативность‚ активность.</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Руководство деятельностью магазина‚ организация эффективной работы персонала магазина‚ финансово-хозяйственная деятельность и отчетность‚ выполнение плана продаж‚ отчетность.</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>Трудоустройство по ТК РФ‚ полный соц. пакет‚ график работы 5 чере 2 (168 час/мес)‚ зарплата: оклад 28000 + % от оборота + премии‚ совокупный доход от 35000 руб</p>\r\n ','html','ДИРЕКТОР МАГАЗИНА\r\n\r\nТРЕБОВАНИЯ \r\n\r\nВЫСШЕЕ ОБРАЗОВАНИЕ‚ ОПЫТ РУКОВОДЯЩЕЙ \r\nРАБОТЫ В РОЗНИЦЕ ОТ 3 ЛЕТ‚ ОПЫТНЫЙ ПОЛЬЗОВАТЕЛЬ \r\nПК‚ ЭТИКА ДЕЛОВОГО ОБЩЕНИЯ‚ ЗНАНИЕ МЕТОДОВ \r\nУПРАВЛЕНИЯ И ЗАКЛЮЧЕНИЯ ДОГОВОРОВ‚ ОТЛИЧНОЕ \r\nЗНАНИЕ ТОРГОВОГО И ТРУДОВОГО ЗАКОНОДАТЕЛЬСТВ‚ \r\nОТВЕТСТВЕННОСТЬ‚ ИНИЦИАТИВНОСТЬ‚ АКТИВНОСТЬ. \r\nОБЯЗАННОСТИ \r\n\r\nРУКОВОДСТВО ДЕЯТЕЛЬНОСТЬЮ МАГАЗИНА‚ ОРГАНИЗАЦИЯ \r\nЭФФЕКТИВНОЙ РАБОТЫ ПЕРСОНАЛА МАГАЗИНА‚ \r\nФИНАНСОВО-ХОЗЯЙСТВЕННАЯ ДЕЯТЕЛЬНОСТЬ И \r\nОТЧЕТНОСТЬ‚ ВЫПОЛНЕНИЕ ПЛАНА ПРОДАЖ‚ \r\nОТЧЕТНОСТЬ. УСЛОВИЯ \r\n\r\nТРУДОУСТРОЙСТВО ПО ТК РФ‚ ПОЛНЫЙ СОЦ. ПАКЕТ‚ \r\nГРАФИК РАБОТЫ 5 ЧЕРЕ 2 (168 ЧАС/МЕС)‚ ЗАРПЛАТА: \r\nОКЛАД 28000 + % ОТ ОБОРОТА + ПРЕМИИ‚ СОВОКУПНЫЙ \r\nДОХОД ОТ 35000 РУБ',1,NULL,NULL,NULL,NULL,NULL,'N','3','','','192768702',NULL,NULL,NULL),(32,'2017-09-08 15:03:17',1,'2017-09-08 15:03:14',1,4,NULL,'Y','2010-05-01 00:00:00',NULL,400,'Бухгалтер отдела учета готовой продукции',NULL,'','html',NULL,'<b>Требования</b> 						 						 \r\n<p>Жен., 22-45, уверенный пользователь ПК, опыт работы бухгалтером приветсвуется, знание бухгалтерского учета (базовый уровень), самостоятельность, ответственность, коммуникабельность, быстрая обучаемость, желание работать.</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Работа с первичными документами по учету МПЗ Ведение журналов-ордеров по производственным счетам Формирование материальных отчетов подразделений Исполнение дополнительных функций по указанию руководителя</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>График работы 5 дней в неделю, адрес работы г. Шатура, Ботинский пр-д, 37. Зарплата: оклад 10 800 р. + премия 40% от оклада, полный соц. пакет.</p>\r\n ','html','БУХГАЛТЕР ОТДЕЛА УЧЕТА ГОТОВОЙ ПРОДУКЦИИ\r\n\r\nТРЕБОВАНИЯ \r\n\r\nЖЕН., 22-45, УВЕРЕННЫЙ ПОЛЬЗОВАТЕЛЬ ПК, ОПЫТ \r\nРАБОТЫ БУХГАЛТЕРОМ ПРИВЕТСВУЕТСЯ, ЗНАНИЕ \r\nБУХГАЛТЕРСКОГО УЧЕТА (БАЗОВЫЙ УРОВЕНЬ), \r\nСАМОСТОЯТЕЛЬНОСТЬ, ОТВЕТСТВЕННОСТЬ, КОММУНИКАБЕЛЬНОСТЬ, \r\nБЫСТРАЯ ОБУЧАЕМОСТЬ, ЖЕЛАНИЕ РАБОТАТЬ. \r\nОБЯЗАННОСТИ \r\n\r\nРАБОТА С ПЕРВИЧНЫМИ ДОКУМЕНТАМИ ПО УЧЕТУ \r\nМПЗ ВЕДЕНИЕ ЖУРНАЛОВ-ОРДЕРОВ ПО ПРОИЗВОДСТВЕННЫМ \r\nСЧЕТАМ ФОРМИРОВАНИЕ МАТЕРИАЛЬНЫХ ОТЧЕТОВ \r\nПОДРАЗДЕЛЕНИЙ ИСПОЛНЕНИЕ ДОПОЛНИТЕЛЬНЫХ \r\nФУНКЦИЙ ПО УКАЗАНИЮ РУКОВОДИТЕЛЯ УСЛОВИЯ \r\n\r\nГРАФИК РАБОТЫ 5 ДНЕЙ В НЕДЕЛЮ, АДРЕС РАБОТЫ \r\nГ. ШАТУРА, БОТИНСКИЙ ПР-Д, 37. ЗАРПЛАТА: ОКЛАД \r\n10 800 Р. + ПРЕМИЯ 40% ОТ ОКЛАДА, ПОЛНЫЙ СОЦ. ПАКЕТ.',1,NULL,NULL,NULL,NULL,NULL,'N','4','','','790068583',NULL,NULL,NULL),(33,'2017-09-13 11:34:12',1,'2017-09-12 13:57:51',1,5,NULL,'Y','2017-03-07 14:21:00',NULL,500,'Cергей Родионов',55,'Вы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.','text',56,'Вы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.\r\nВы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.\r\nВы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.','text','CЕРГЕЙ РОДИОНОВ\r\nВЫ СМОЖЕТЕ ОРГАНИЗОВАТЬ ВНУТРИ КОМПАНИИ КОЛЛЕКТИВНУЮ РАБОТУ НАД ПРОЕКТАМИ В РАБОЧИХ ГРУППАХ, ВЕСТИ УЧЕТ И ПЛАНИРОВАНИЕ ВРЕМЕНИ И СОБЫТИЙ, ОБМЕНИВАТЬСЯ СООБЩЕНИЯМИ И ПОЧТОЙ ЧЕРЕЗ ПОРТАЛ, ПРОВОДИТЬ ВНУТРИ КОМПАНИИ ВИДЕОКОНФЕРЕНЦИИ И ДЕЛАТЬ МНОГОЕ ДРУГОЕ.\r\nВЫ СМОЖЕТЕ ОРГАНИЗОВАТЬ ВНУТРИ КОМПАНИИ КОЛЛЕКТИВНУЮ РАБОТУ НАД ПРОЕКТАМИ В РАБОЧИХ ГРУППАХ, ВЕСТИ УЧЕТ И ПЛАНИРОВАНИЕ ВРЕМЕНИ И СОБЫТИЙ, ОБМЕНИВАТЬСЯ СООБЩЕНИЯМИ И ПОЧТОЙ ЧЕРЕЗ ПОРТАЛ, ПРОВОДИТЬ ВНУТРИ КОМПАНИИ ВИДЕОКОНФЕРЕНЦИИ И ДЕЛАТЬ МНОГОЕ ДРУГОЕ.\r\nВЫ СМОЖЕТЕ ОРГАНИЗОВАТЬ ВНУТРИ КОМПАНИИ КОЛЛЕКТИВНУЮ РАБОТУ НАД ПРОЕКТАМИ В РАБОЧИХ ГРУППАХ, ВЕСТИ УЧЕТ И ПЛАНИРОВАНИЕ ВРЕМЕНИ И СОБЫТИЙ, ОБМЕНИВАТЬСЯ СООБЩЕНИЯМИ И ПОЧТОЙ ЧЕРЕЗ ПОРТАЛ, ПРОВОДИТЬ ВНУТРИ КОМПАНИИ ВИДЕОКОНФЕРЕНЦИИ И ДЕЛАТЬ МНОГОЕ ДРУГОЕ.\r\nВЫ СМОЖЕТЕ ОРГАНИЗОВАТЬ ВНУТРИ КОМПАНИИ КОЛЛЕКТИВНУЮ РАБОТУ НАД ПРОЕКТАМИ В РАБОЧИХ ГРУППАХ, ВЕСТИ УЧЕТ И ПЛАНИРОВАНИЕ ВРЕМЕНИ И СОБЫТИЙ, ОБМЕНИВАТЬСЯ СООБЩЕНИЯМИ И ПОЧТОЙ ЧЕРЕЗ ПОРТАЛ, ПРОВОДИТЬ ВНУТРИ КОМПАНИИ ВИДЕОКОНФЕРЕНЦИИ И ДЕЛАТЬ МНОГОЕ ДРУГОЕ.',1,NULL,NULL,NULL,NULL,NULL,'N','33','cergey-rodionov','','0',NULL,1,'2017-09-13 11:09:44'),(34,'2017-09-12 13:57:52',1,'2017-09-12 13:57:52',1,5,NULL,'Y','2017-04-10 14:21:00',NULL,500,'Анна Андреева',57,'Вы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.','text',58,'Вы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.\r\nВы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.\r\nВы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.','text','АННА АНДРЕЕВА\r\nВЫ СМОЖЕТЕ ОРГАНИЗОВАТЬ ВНУТРИ КОМПАНИИ КОЛЛЕКТИВНУЮ РАБОТУ НАД ПРОЕКТАМИ В РАБОЧИХ ГРУППАХ, ВЕСТИ УЧЕТ И ПЛАНИРОВАНИЕ ВРЕМЕНИ И СОБЫТИЙ, ОБМЕНИВАТЬСЯ СООБЩЕНИЯМИ И ПОЧТОЙ ЧЕРЕЗ ПОРТАЛ, ПРОВОДИТЬ ВНУТРИ КОМПАНИИ ВИДЕОКОНФЕРЕНЦИИ И ДЕЛАТЬ МНОГОЕ ДРУГОЕ.\r\nВЫ СМОЖЕТЕ ОРГАНИЗОВАТЬ ВНУТРИ КОМПАНИИ КОЛЛЕКТИВНУЮ РАБОТУ НАД ПРОЕКТАМИ В РАБОЧИХ ГРУППАХ, ВЕСТИ УЧЕТ И ПЛАНИРОВАНИЕ ВРЕМЕНИ И СОБЫТИЙ, ОБМЕНИВАТЬСЯ СООБЩЕНИЯМИ И ПОЧТОЙ ЧЕРЕЗ ПОРТАЛ, ПРОВОДИТЬ ВНУТРИ КОМПАНИИ ВИДЕОКОНФЕРЕНЦИИ И ДЕЛАТЬ МНОГОЕ ДРУГОЕ.\r\nВЫ СМОЖЕТЕ ОРГАНИЗОВАТЬ ВНУТРИ КОМПАНИИ КОЛЛЕКТИВНУЮ РАБОТУ НАД ПРОЕКТАМИ В РАБОЧИХ ГРУППАХ, ВЕСТИ УЧЕТ И ПЛАНИРОВАНИЕ ВРЕМЕНИ И СОБЫТИЙ, ОБМЕНИВАТЬСЯ СООБЩЕНИЯМИ И ПОЧТОЙ ЧЕРЕЗ ПОРТАЛ, ПРОВОДИТЬ ВНУТРИ КОМПАНИИ ВИДЕОКОНФЕРЕНЦИИ И ДЕЛАТЬ МНОГОЕ ДРУГОЕ.\r\nВЫ СМОЖЕТЕ ОРГАНИЗОВАТЬ ВНУТРИ КОМПАНИИ КОЛЛЕКТИВНУЮ РАБОТУ НАД ПРОЕКТАМИ В РАБОЧИХ ГРУППАХ, ВЕСТИ УЧЕТ И ПЛАНИРОВАНИЕ ВРЕМЕНИ И СОБЫТИЙ, ОБМЕНИВАТЬСЯ СООБЩЕНИЯМИ И ПОЧТОЙ ЧЕРЕЗ ПОРТАЛ, ПРОВОДИТЬ ВНУТРИ КОМПАНИИ ВИДЕОКОНФЕРЕНЦИИ И ДЕЛАТЬ МНОГОЕ ДРУГОЕ.',1,NULL,NULL,NULL,NULL,NULL,'N','34','anna-andreeva','','632358743',NULL,NULL,NULL),(35,'2017-09-13 10:19:36',1,'2017-09-12 13:57:52',1,5,NULL,'Y','2017-04-24 14:21:00',NULL,500,'Дмитрия Пялов',59,'Можете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала','text',60,'Можете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала.\r\nМожете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала.\r\nМожете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала.\r\n','text','ДМИТРИЯ ПЯЛОВ\r\nМОЖЕТЕ СРАЗУ ПЕРЕЙТИ С «МЛАДШЕЙ», БАЗОВОЙ РЕДАКЦИИ НА «БИЗНЕС-ПРОЦЕССЫ». ПОСЛЕ ТАКОГО ПЕРЕХОДА ВАШ ПОРТАЛ МОЖНО БУДЕТ ИНТЕГРИРОВАТЬ С ВНЕШНИМ САЙТОМ, НА ПОРТАЛЕ ДОБАВЯТСЯ ВОЗМОЖНОСТИ ВИЗУАЛЬНОГО ПРОЕКТИРОВАНИЯ БИЗНЕС-ПРОЦЕССОВ И УПРАВЛЕНИЯ СПИСКАМИ, ВКЛЮЧАЯ СПИСКИ В РАБОЧИХ ГРУППАХ. КРОМЕ ТОГО, ВЫ СМОЖЕТЕ АНАЛИЗИРОВАТЬ ПОСЕЩАЕМОСТЬ СВОЕГО ПОРТАЛА\r\nМОЖЕТЕ СРАЗУ ПЕРЕЙТИ С «МЛАДШЕЙ», БАЗОВОЙ РЕДАКЦИИ НА «БИЗНЕС-ПРОЦЕССЫ». ПОСЛЕ ТАКОГО ПЕРЕХОДА ВАШ ПОРТАЛ МОЖНО БУДЕТ ИНТЕГРИРОВАТЬ С ВНЕШНИМ САЙТОМ, НА ПОРТАЛЕ ДОБАВЯТСЯ ВОЗМОЖНОСТИ ВИЗУАЛЬНОГО ПРОЕКТИРОВАНИЯ БИЗНЕС-ПРОЦЕССОВ И УПРАВЛЕНИЯ СПИСКАМИ, ВКЛЮЧАЯ СПИСКИ В РАБОЧИХ ГРУППАХ. КРОМЕ ТОГО, ВЫ СМОЖЕТЕ АНАЛИЗИРОВАТЬ ПОСЕЩАЕМОСТЬ СВОЕГО ПОРТАЛА.\r\nМОЖЕТЕ СРАЗУ ПЕРЕЙТИ С «МЛАДШЕЙ», БАЗОВОЙ РЕДАКЦИИ НА «БИЗНЕС-ПРОЦЕССЫ». ПОСЛЕ ТАКОГО ПЕРЕХОДА ВАШ ПОРТАЛ МОЖНО БУДЕТ ИНТЕГРИРОВАТЬ С ВНЕШНИМ САЙТОМ, НА ПОРТАЛЕ ДОБАВЯТСЯ ВОЗМОЖНОСТИ ВИЗУАЛЬНОГО ПРОЕКТИРОВАНИЯ БИЗНЕС-ПРОЦЕССОВ И УПРАВЛЕНИЯ СПИСКАМИ, ВКЛЮЧАЯ СПИСКИ В РАБОЧИХ ГРУППАХ. КРОМЕ ТОГО, ВЫ СМОЖЕТЕ АНАЛИЗИРОВАТЬ ПОСЕЩАЕМОСТЬ СВОЕГО ПОРТАЛА.\r\nМОЖЕТЕ СРАЗУ ПЕРЕЙТИ С «МЛАДШЕЙ», БАЗОВОЙ РЕДАКЦИИ НА «БИЗНЕС-ПРОЦЕССЫ». ПОСЛЕ ТАКОГО ПЕРЕХОДА ВАШ ПОРТАЛ МОЖНО БУДЕТ ИНТЕГРИРОВАТЬ С ВНЕШНИМ САЙТОМ, НА ПОРТАЛЕ ДОБАВЯТСЯ ВОЗМОЖНОСТИ ВИЗУАЛЬНОГО ПРОЕКТИРОВАНИЯ БИЗНЕС-ПРОЦЕССОВ И УПРАВЛЕНИЯ СПИСКАМИ, ВКЛЮЧАЯ СПИСКИ В РАБОЧИХ ГРУППАХ. КРОМЕ ТОГО, ВЫ СМОЖЕТЕ АНАЛИЗИРОВАТЬ ПОСЕЩАЕМОСТЬ СВОЕГО ПОРТАЛА.\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','35','dmitriya-pyalov','','0',NULL,4,'2017-09-12 15:11:53'),(36,'2017-09-13 13:27:51',1,'2017-09-13 11:08:58',1,5,NULL,'Y','2017-05-10 11:08:00',NULL,500,'Константин Эрнст',NULL,'Можете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала.\r\nМожете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После так','text',NULL,'Можете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала.\r\nМожете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала.\r\nМожете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала.\r\n','text','КОНСТАНТИН ЭРНСТ\r\nМОЖЕТЕ СРАЗУ ПЕРЕЙТИ С «МЛАДШЕЙ», БАЗОВОЙ РЕДАКЦИИ НА «БИЗНЕС-ПРОЦЕССЫ». ПОСЛЕ ТАКОГО ПЕРЕХОДА ВАШ ПОРТАЛ МОЖНО БУДЕТ ИНТЕГРИРОВАТЬ С ВНЕШНИМ САЙТОМ, НА ПОРТАЛЕ ДОБАВЯТСЯ ВОЗМОЖНОСТИ ВИЗУАЛЬНОГО ПРОЕКТИРОВАНИЯ БИЗНЕС-ПРОЦЕССОВ И УПРАВЛЕНИЯ СПИСКАМИ, ВКЛЮЧАЯ СПИСКИ В РАБОЧИХ ГРУППАХ. КРОМЕ ТОГО, ВЫ СМОЖЕТЕ АНАЛИЗИРОВАТЬ ПОСЕЩАЕМОСТЬ СВОЕГО ПОРТАЛА.\r\nМОЖЕТЕ СРАЗУ ПЕРЕЙТИ С «МЛАДШЕЙ», БАЗОВОЙ РЕДАКЦИИ НА «БИЗНЕС-ПРОЦЕССЫ». ПОСЛЕ ТАК\r\nМОЖЕТЕ СРАЗУ ПЕРЕЙТИ С «МЛАДШЕЙ», БАЗОВОЙ РЕДАКЦИИ НА «БИЗНЕС-ПРОЦЕССЫ». ПОСЛЕ ТАКОГО ПЕРЕХОДА ВАШ ПОРТАЛ МОЖНО БУДЕТ ИНТЕГРИРОВАТЬ С ВНЕШНИМ САЙТОМ, НА ПОРТАЛЕ ДОБАВЯТСЯ ВОЗМОЖНОСТИ ВИЗУАЛЬНОГО ПРОЕКТИРОВАНИЯ БИЗНЕС-ПРОЦЕССОВ И УПРАВЛЕНИЯ СПИСКАМИ, ВКЛЮЧАЯ СПИСКИ В РАБОЧИХ ГРУППАХ. КРОМЕ ТОГО, ВЫ СМОЖЕТЕ АНАЛИЗИРОВАТЬ ПОСЕЩАЕМОСТЬ СВОЕГО ПОРТАЛА.\r\nМОЖЕТЕ СРАЗУ ПЕРЕЙТИ С «МЛАДШЕЙ», БАЗОВОЙ РЕДАКЦИИ НА «БИЗНЕС-ПРОЦЕССЫ». ПОСЛЕ ТАКОГО ПЕРЕХОДА ВАШ ПОРТАЛ МОЖНО БУДЕТ ИНТЕГРИРОВАТЬ С ВНЕШНИМ САЙТОМ, НА ПОРТАЛЕ ДОБАВЯТСЯ ВОЗМОЖНОСТИ ВИЗУАЛЬНОГО ПРОЕКТИРОВАНИЯ БИЗНЕС-ПРОЦЕССОВ И УПРАВЛЕНИЯ СПИСКАМИ, ВКЛЮЧАЯ СПИСКИ В РАБОЧИХ ГРУППАХ. КРОМЕ ТОГО, ВЫ СМОЖЕТЕ АНАЛИЗИРОВАТЬ ПОСЕЩАЕМОСТЬ СВОЕГО ПОРТАЛА.\r\nМОЖЕТЕ СРАЗУ ПЕРЕЙТИ С «МЛАДШЕЙ», БАЗОВОЙ РЕДАКЦИИ НА «БИЗНЕС-ПРОЦЕССЫ». ПОСЛЕ ТАКОГО ПЕРЕХОДА ВАШ ПОРТАЛ МОЖНО БУДЕТ ИНТЕГРИРОВАТЬ С ВНЕШНИМ САЙТОМ, НА ПОРТАЛЕ ДОБАВЯТСЯ ВОЗМОЖНОСТИ ВИЗУАЛЬНОГО ПРОЕКТИРОВАНИЯ БИЗНЕС-ПРОЦЕССОВ И УПРАВЛЕНИЯ СПИСКАМИ, ВКЛЮЧАЯ СПИСКИ В РАБОЧИХ ГРУППАХ. КРОМЕ ТОГО, ВЫ СМОЖЕТЕ АНАЛИЗИРОВАТЬ ПОСЕЩАЕМОСТЬ СВОЕГО ПОРТАЛА.\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','36','konstantin-ernst','','0',NULL,3,'2017-09-13 11:34:29');
/*!40000 ALTER TABLE `b_iblock_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element_iprop`
--

DROP TABLE IF EXISTS `b_iblock_element_iprop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ELEMENT_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element_iprop`
--

LOCK TABLES `b_iblock_element_iprop` WRITE;
/*!40000 ALTER TABLE `b_iblock_element_iprop` DISABLE KEYS */;
INSERT INTO `b_iblock_element_iprop` VALUES (5,0,35,2,'Можете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала'),(5,0,35,3,'Дмитрия Пялов'),(5,0,35,4,'лучшие, отзывы, .NET-девелопмент'),(5,0,35,5,'Дмитрия Пялов - .NET-девелопмент'),(5,0,36,2,'Можете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала.\r\nМожете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После так'),(5,0,36,3,'Константин Эрнст'),(5,0,36,4,'лучшие, отзывы, Первый Канал'),(5,0,36,5,'Константин Эрнст - Первый Канал');
/*!40000 ALTER TABLE `b_iblock_element_iprop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element_lock`
--

DROP TABLE IF EXISTS `b_iblock_element_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element_lock`
--

LOCK TABLES `b_iblock_element_lock` WRITE;
/*!40000 ALTER TABLE `b_iblock_element_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element_property`
--

DROP TABLE IF EXISTS `b_iblock_element_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  `VALUE_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_num` (`VALUE_NUM`,`IBLOCK_PROPERTY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element_property`
--

LOCK TABLES `b_iblock_element_property` WRITE;
/*!40000 ALTER TABLE `b_iblock_element_property` DISABLE KEYS */;
INSERT INTO `b_iblock_element_property` VALUES (1,2,4,'10000','text',NULL,10000.0000,''),(2,3,4,'2','text',2,NULL,NULL),(3,4,4,'195x95x125','text',NULL,195.0000,''),(4,6,4,'40324А','text',NULL,40324.0000,''),(5,7,4,'Кожа, ткань','text',NULL,0.0000,''),(6,8,4,'Россия','text',NULL,0.0000,''),(7,2,5,'12000','text',NULL,12000.0000,''),(8,3,5,'2','text',2,NULL,NULL),(9,4,5,'175x95x115','text',NULL,175.0000,''),(10,6,5,'56830Е','text',NULL,56830.0000,''),(11,7,5,'Кожа, ткань','text',NULL,0.0000,''),(12,8,5,'Россия','text',NULL,0.0000,''),(13,1,6,'1','text',1,NULL,NULL),(14,2,6,'7899','text',NULL,7899.0000,''),(15,3,6,'2','text',2,NULL,NULL),(16,4,6,'54x49x120','text',NULL,54.0000,''),(17,6,6,'435245','text',NULL,435245.0000,''),(18,7,6,'Кожа, ткань','text',NULL,0.0000,''),(19,8,6,'Россия','text',NULL,0.0000,''),(20,2,7,'8999','text',NULL,8999.0000,''),(21,3,7,'2','text',2,NULL,NULL),(22,4,7,'66x60x36','text',NULL,66.0000,''),(23,6,7,'234523','text',NULL,234523.0000,''),(24,7,7,'Кожа, ткань','text',NULL,0.0000,''),(25,8,7,'Россия','text',NULL,0.0000,''),(26,2,8,'1500','text',NULL,1500.0000,''),(27,3,8,'2','text',2,NULL,NULL),(28,4,8,'51x43x85','text',NULL,51.0000,''),(29,6,8,'234011','text',NULL,234011.0000,''),(30,7,8,'Дерево, ткань','text',NULL,0.0000,''),(31,8,8,'Россия','text',NULL,0.0000,''),(32,1,9,'1','text',1,NULL,NULL),(33,2,9,'11899','text',NULL,11899.0000,''),(34,3,9,'2','text',2,NULL,NULL),(35,4,9,'155x90x95','text',NULL,155.0000,''),(36,6,9,'47539Р','text',NULL,47539.0000,''),(37,7,9,'Кожа, ткань','text',NULL,0.0000,''),(38,8,9,'Россия','text',NULL,0.0000,''),(39,2,10,'12500','text',NULL,12500.0000,''),(40,3,10,'2','text',2,NULL,NULL),(41,4,10,'165x90x115','text',NULL,165.0000,''),(42,6,10,'00549Е','text',NULL,549.0000,''),(43,7,10,'Кожа, ткань','text',NULL,0.0000,''),(44,8,10,'Россия','text',NULL,0.0000,''),(45,2,11,'8000','text',NULL,8000.0000,''),(46,3,11,'2','text',2,NULL,NULL),(47,4,11,'155x95x105','text',NULL,155.0000,''),(48,6,11,'98922К','text',NULL,98922.0000,''),(49,7,11,'Кожа, ткань','text',NULL,0.0000,''),(50,8,11,'Россия','text',NULL,0.0000,''),(51,1,12,'1','text',1,NULL,NULL),(52,2,12,'10999','text',NULL,10999.0000,''),(53,3,12,'2','text',2,NULL,NULL),(54,4,12,'165x90x115','text',NULL,165.0000,''),(55,6,12,'64512Т','text',NULL,64512.0000,''),(56,7,12,'Кожа, ткань','text',NULL,0.0000,''),(57,8,12,'Россия','text',NULL,0.0000,''),(58,2,13,'9999','text',NULL,9999.0000,''),(59,3,13,'2','text',2,NULL,NULL),(60,4,13,'210x105x135','text',NULL,210.0000,''),(61,6,13,'96395Т','text',NULL,96395.0000,''),(62,7,13,'Кожа, ткань','text',NULL,0.0000,''),(63,8,13,'Россия','text',NULL,0.0000,''),(64,2,14,'1499','text',NULL,1499.0000,''),(65,3,14,'2','text',2,NULL,NULL),(66,4,14,'175x110x115','text',NULL,175.0000,''),(67,5,14,'200x100','text',NULL,200.0000,''),(68,6,14,'38263Е','text',NULL,38263.0000,''),(69,7,14,'Кожа, ткань','text',NULL,0.0000,''),(70,8,14,'Россия','text',NULL,0.0000,''),(71,2,15,'9999','text',NULL,9999.0000,''),(72,3,15,'2','text',2,NULL,NULL),(73,6,15,'634645','text',NULL,634645.0000,''),(74,7,15,'Кожа, ткань','text',NULL,0.0000,''),(75,8,15,'Россия','text',NULL,0.0000,''),(76,2,16,'7799','text',NULL,7799.0000,''),(77,3,16,'2','text',2,NULL,NULL),(78,6,16,'634045','text',NULL,634045.0000,''),(79,7,16,'Кожа, ткань','text',NULL,0.0000,''),(80,8,16,'Россия','text',NULL,0.0000,''),(81,2,17,'6779','text',NULL,6779.0000,''),(82,3,17,'2','text',2,NULL,NULL),(83,4,17,'220x140x120','text',NULL,220.0000,''),(84,6,17,'634043','text',NULL,634043.0000,''),(85,7,17,'Кожа, ткань','text',NULL,0.0000,''),(86,8,17,'Россия','text',NULL,0.0000,''),(87,2,18,'4579','text',NULL,4579.0000,''),(88,3,18,'2','text',2,NULL,NULL),(89,4,18,'200x150x120','text',NULL,200.0000,''),(90,6,18,'634023','text',NULL,634023.0000,''),(91,7,18,'Кожа, ткань','text',NULL,0.0000,''),(92,8,18,'Россия','text',NULL,0.0000,''),(93,1,19,'1','text',1,NULL,NULL),(94,2,19,'14999','text',NULL,14999.0000,''),(95,3,19,'2','text',2,NULL,NULL),(96,4,19,'50x69x130','text',NULL,50.0000,''),(97,6,19,'634023','text',NULL,634023.0000,''),(98,7,19,'Кожа, ткань','text',NULL,0.0000,''),(99,8,19,'Россия','text',NULL,0.0000,''),(100,2,20,'12999','text',NULL,12999.0000,''),(101,3,20,'2','text',2,NULL,NULL),(102,4,20,'58x48x86','text',NULL,58.0000,''),(103,6,20,'634011','text',NULL,634011.0000,''),(104,7,20,'Кожа, металл, ткань','text',NULL,0.0000,''),(105,8,20,'Россия','text',NULL,0.0000,''),(106,2,21,'1700','text',NULL,1700.0000,''),(107,3,21,'2','text',2,NULL,NULL),(108,4,21,'52x42x88','text',NULL,52.0000,''),(109,6,21,'234012','text',NULL,234012.0000,''),(110,7,21,'Дерево, ткань','text',NULL,0.0000,''),(111,8,21,'Россия','text',NULL,0.0000,''),(112,2,22,'1000','text',NULL,1000.0000,''),(113,3,22,'2','text',2,NULL,NULL),(114,4,22,'52x42x88','text',NULL,52.0000,''),(115,6,22,'234014','text',NULL,234014.0000,''),(116,7,22,'Дерево, ткань','text',NULL,0.0000,''),(117,8,22,'Россия','text',NULL,0.0000,''),(118,2,23,'1399','text',NULL,1399.0000,''),(119,3,23,'2','text',2,NULL,NULL),(120,4,23,'55x39x90','text',NULL,55.0000,''),(121,6,23,'234017','text',NULL,234017.0000,''),(122,7,23,'Дерево, ткань','text',NULL,0.0000,''),(123,8,23,'Россия','text',NULL,0.0000,''),(124,2,24,'1000','text',NULL,1000.0000,''),(125,3,24,'2','text',2,NULL,NULL),(126,4,24,'56x48x80','text',NULL,56.0000,''),(127,6,24,'234013','text',NULL,234013.0000,''),(128,7,24,'Дерево, ткань','text',NULL,0.0000,''),(129,8,24,'Россия','text',NULL,0.0000,''),(130,2,25,'1300','text',NULL,1300.0000,''),(131,3,25,'2','text',2,NULL,NULL),(132,4,25,'52x42x88','text',NULL,52.0000,''),(133,6,25,'234015','text',NULL,234015.0000,''),(134,7,25,'Металл, пластик','text',NULL,0.0000,''),(135,8,25,'Россия','text',NULL,0.0000,''),(136,2,26,'1699','text',NULL,1699.0000,''),(137,3,26,'2','text',2,NULL,NULL),(138,4,26,'52x45x65','text',NULL,52.0000,''),(139,6,26,'234016','text',NULL,234016.0000,''),(140,7,26,'Металл, пластик, кожа','text',NULL,0.0000,''),(141,8,26,'Россия','text',NULL,0.0000,''),(142,2,27,'1679','text',NULL,1679.0000,''),(143,3,27,'2','text',2,NULL,NULL),(144,4,27,'54x43x82','text',NULL,54.0000,''),(145,6,27,'234017','text',NULL,234017.0000,''),(146,7,27,'Металл, пластик','text',NULL,0.0000,''),(147,8,27,'Россия','text',NULL,0.0000,''),(148,9,33,'Генеральный директор','text',NULL,0.0000,''),(149,10,33,'CTC-Медиа','text',NULL,0.0000,''),(150,9,34,'Маркетолог','text',NULL,0.0000,''),(151,10,34,'RK-Telecom','text',NULL,0.0000,''),(152,9,35,'Программист ','text',NULL,0.0000,''),(153,10,35,'.NET-девелопмент','text',NULL,0.0000,''),(154,11,35,'61','text',NULL,61.0000,''),(155,11,35,'62','text',NULL,62.0000,''),(156,11,35,'63','text',NULL,63.0000,''),(157,9,36,'Генеральный директор','text',NULL,0.0000,''),(158,10,36,'Первый Канал','text',NULL,0.0000,'');
/*!40000 ALTER TABLE `b_iblock_element_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element_right`
--

DROP TABLE IF EXISTS `b_iblock_element_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`ELEMENT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_element_right_1` (`ELEMENT_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_element_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element_right`
--

LOCK TABLES `b_iblock_element_right` WRITE;
/*!40000 ALTER TABLE `b_iblock_element_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_fields`
--

DROP TABLE IF EXISTS `b_iblock_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_fields` (
  `IBLOCK_ID` int(18) NOT NULL,
  `FIELD_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_fields`
--

LOCK TABLES `b_iblock_fields` WRITE;
/*!40000 ALTER TABLE `b_iblock_fields` DISABLE KEYS */;
INSERT INTO `b_iblock_fields` VALUES (1,'ACTIVE','Y','Y'),(1,'ACTIVE_FROM','N','=today'),(1,'ACTIVE_TO','N',''),(1,'CODE','N',''),(1,'DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(1,'DETAIL_TEXT','N',''),(1,'DETAIL_TEXT_TYPE','Y','text'),(1,'DETAIL_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(1,'IBLOCK_SECTION','N',''),(1,'LOG_ELEMENT_ADD','N',NULL),(1,'LOG_ELEMENT_DELETE','N',NULL),(1,'LOG_ELEMENT_EDIT','N',NULL),(1,'LOG_SECTION_ADD','N',NULL),(1,'LOG_SECTION_DELETE','N',NULL),(1,'LOG_SECTION_EDIT','N',NULL),(1,'NAME','Y',''),(1,'PREVIEW_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(1,'PREVIEW_TEXT','N',''),(1,'PREVIEW_TEXT_TYPE','Y','text'),(1,'PREVIEW_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(1,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(1,'SECTION_DESCRIPTION','N',NULL),(1,'SECTION_DESCRIPTION_TYPE','Y',NULL),(1,'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE','N','Y'),(1,'SECTION_DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(1,'SECTION_NAME','Y',NULL),(1,'SECTION_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(1,'SECTION_XML_ID','N',NULL),(1,'SORT','N','0'),(1,'TAGS','N',''),(1,'XML_ID','Y',''),(1,'XML_IMPORT_START_TIME','N','2017-09-08 14:57:49'),(2,'ACTIVE','Y','Y'),(2,'ACTIVE_FROM','N',''),(2,'ACTIVE_TO','N',''),(2,'CODE','N',''),(2,'DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(2,'DETAIL_TEXT','N',''),(2,'DETAIL_TEXT_TYPE','Y','text'),(2,'DETAIL_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(2,'IBLOCK_SECTION','N',''),(2,'LOG_ELEMENT_ADD','N',NULL),(2,'LOG_ELEMENT_DELETE','N',NULL),(2,'LOG_ELEMENT_EDIT','N',NULL),(2,'LOG_SECTION_ADD','N',NULL),(2,'LOG_SECTION_DELETE','N',NULL),(2,'LOG_SECTION_EDIT','N',NULL),(2,'NAME','Y',''),(2,'PREVIEW_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(2,'PREVIEW_TEXT','N',''),(2,'PREVIEW_TEXT_TYPE','Y','text'),(2,'PREVIEW_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(2,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(2,'SECTION_DESCRIPTION','N',NULL),(2,'SECTION_DESCRIPTION_TYPE','Y',NULL),(2,'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE','N','Y'),(2,'SECTION_DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(2,'SECTION_NAME','Y',NULL),(2,'SECTION_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(2,'SECTION_XML_ID','N',NULL),(2,'SORT','N','0'),(2,'TAGS','N',''),(2,'XML_ID','Y',''),(2,'XML_IMPORT_START_TIME','N','2017-09-08 15:00:39'),(3,'ACTIVE','Y','Y'),(3,'ACTIVE_FROM','N',''),(3,'ACTIVE_TO','N',''),(3,'CODE','N',''),(3,'DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(3,'DETAIL_TEXT','N',''),(3,'DETAIL_TEXT_TYPE','Y','text'),(3,'DETAIL_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(3,'IBLOCK_SECTION','N',''),(3,'LOG_ELEMENT_ADD','N',NULL),(3,'LOG_ELEMENT_DELETE','N',NULL),(3,'LOG_ELEMENT_EDIT','N',NULL),(3,'LOG_SECTION_ADD','N',NULL),(3,'LOG_SECTION_DELETE','N',NULL),(3,'LOG_SECTION_EDIT','N',NULL),(3,'NAME','Y',''),(3,'PREVIEW_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(3,'PREVIEW_TEXT','N',''),(3,'PREVIEW_TEXT_TYPE','Y','text'),(3,'PREVIEW_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(3,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(3,'SECTION_DESCRIPTION','N',NULL),(3,'SECTION_DESCRIPTION_TYPE','Y',NULL),(3,'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE','N','Y'),(3,'SECTION_DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(3,'SECTION_NAME','Y',NULL),(3,'SECTION_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(3,'SECTION_XML_ID','N',NULL),(3,'SORT','N','0'),(3,'TAGS','N',''),(3,'XML_ID','Y',''),(3,'XML_IMPORT_START_TIME','N','2017-09-08 15:02:18'),(4,'ACTIVE','Y','Y'),(4,'ACTIVE_FROM','N',''),(4,'ACTIVE_TO','N',''),(4,'CODE','N',''),(4,'DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(4,'DETAIL_TEXT','N',''),(4,'DETAIL_TEXT_TYPE','Y','text'),(4,'DETAIL_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(4,'IBLOCK_SECTION','N',''),(4,'LOG_ELEMENT_ADD','N',NULL),(4,'LOG_ELEMENT_DELETE','N',NULL),(4,'LOG_ELEMENT_EDIT','N',NULL),(4,'LOG_SECTION_ADD','N',NULL),(4,'LOG_SECTION_DELETE','N',NULL),(4,'LOG_SECTION_EDIT','N',NULL),(4,'NAME','Y',''),(4,'PREVIEW_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(4,'PREVIEW_TEXT','N',''),(4,'PREVIEW_TEXT_TYPE','Y','text'),(4,'PREVIEW_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(4,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(4,'SECTION_DESCRIPTION','N',NULL),(4,'SECTION_DESCRIPTION_TYPE','Y',NULL),(4,'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE','N','Y'),(4,'SECTION_DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(4,'SECTION_NAME','Y',NULL),(4,'SECTION_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),(4,'SECTION_XML_ID','N',NULL),(4,'SORT','N','0'),(4,'TAGS','N',''),(4,'XML_ID','Y',''),(4,'XML_IMPORT_START_TIME','N','2017-09-08 15:03:09'),(5,'ACTIVE','Y','Y'),(5,'ACTIVE_FROM','N',''),(5,'ACTIVE_TO','N',''),(5,'CODE','Y','a:8:{s:6:\"UNIQUE\";s:1:\"Y\";s:15:\"TRANSLITERATION\";s:1:\"Y\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(5,'DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(5,'DETAIL_TEXT','N',''),(5,'DETAIL_TEXT_TYPE','Y','text'),(5,'DETAIL_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(5,'IBLOCK_SECTION','N','a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),(5,'LOG_ELEMENT_ADD','Y',NULL),(5,'LOG_ELEMENT_DELETE','Y',NULL),(5,'LOG_ELEMENT_EDIT','Y',NULL),(5,'LOG_SECTION_ADD','Y',NULL),(5,'LOG_SECTION_DELETE','Y',NULL),(5,'LOG_SECTION_EDIT','Y',NULL),(5,'NAME','Y',''),(5,'PREVIEW_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(5,'PREVIEW_TEXT','N',''),(5,'PREVIEW_TEXT_TYPE','Y','text'),(5,'PREVIEW_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(5,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(5,'SECTION_DESCRIPTION','N',''),(5,'SECTION_DESCRIPTION_TYPE','Y','text'),(5,'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE','N','Y'),(5,'SECTION_DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(5,'SECTION_NAME','Y',''),(5,'SECTION_PICTURE','N','a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),(5,'SECTION_XML_ID','N',''),(5,'SORT','N','0'),(5,'TAGS','N',''),(5,'XML_ID','Y',''),(5,'XML_IMPORT_START_TIME','N','2017-09-12 13:57:49');
/*!40000 ALTER TABLE `b_iblock_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_group`
--

DROP TABLE IF EXISTS `b_iblock_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_group` (
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_group`
--

LOCK TABLES `b_iblock_group` WRITE;
/*!40000 ALTER TABLE `b_iblock_group` DISABLE KEYS */;
INSERT INTO `b_iblock_group` VALUES (1,1,'X'),(1,2,'R'),(1,5,'W'),(2,1,'X'),(2,2,'R'),(2,5,'W'),(3,1,'X'),(3,2,'R'),(3,5,'W'),(4,1,'X'),(4,2,'R'),(4,5,'W'),(5,1,'X'),(5,2,'R');
/*!40000 ALTER TABLE `b_iblock_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_iblock_iprop`
--

DROP TABLE IF EXISTS `b_iblock_iblock_iprop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_iblock_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_iblock_iprop_0` (`IPROP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_iblock_iprop`
--

LOCK TABLES `b_iblock_iblock_iprop` WRITE;
/*!40000 ALTER TABLE `b_iblock_iblock_iprop` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_iblock_iprop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_iproperty`
--

DROP TABLE IF EXISTS `b_iblock_iproperty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_iproperty` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `TEMPLATE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_iprop_0` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_iproperty`
--

LOCK TABLES `b_iblock_iproperty` WRITE;
/*!40000 ALTER TABLE `b_iblock_iproperty` DISABLE KEYS */;
INSERT INTO `b_iblock_iproperty` VALUES (2,5,'ELEMENT_META_DESCRIPTION','B',5,'{=this.PreviewText}'),(3,5,'ELEMENT_META_TITLE','B',5,'{=this.Name}'),(4,5,'ELEMENT_META_KEYWORDS','B',5,'лучшие, отзывы, {=this.property.COMPANY}'),(5,5,'ELEMENT_PAGE_TITLE','B',5,'{=this.Name} - {=this.property.COMPANY}');
/*!40000 ALTER TABLE `b_iblock_iproperty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_messages`
--

DROP TABLE IF EXISTS `b_iblock_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_messages` (
  `IBLOCK_ID` int(18) NOT NULL,
  `MESSAGE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_TEXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_messages`
--

LOCK TABLES `b_iblock_messages` WRITE;
/*!40000 ALTER TABLE `b_iblock_messages` DISABLE KEYS */;
INSERT INTO `b_iblock_messages` VALUES (1,'ELEMENT_ADD','Добавить новость'),(1,'ELEMENT_DELETE','Удалить новость'),(1,'ELEMENT_EDIT','Изменить новость'),(1,'ELEMENT_NAME','Новость'),(1,'ELEMENTS_NAME','Новости'),(1,'SECTION_ADD','Добавить раздел'),(1,'SECTION_DELETE','Удалить раздел'),(1,'SECTION_EDIT','Изменить раздел'),(1,'SECTION_NAME','Раздел'),(1,'SECTIONS_NAME','Разделы'),(2,'ELEMENT_ADD','Добавить товар'),(2,'ELEMENT_DELETE','Удалить товар'),(2,'ELEMENT_EDIT','Изменить товар'),(2,'ELEMENT_NAME','Элемент'),(2,'ELEMENTS_NAME','Товары'),(2,'SECTION_ADD','Добавить раздел'),(2,'SECTION_DELETE','Удалить раздел'),(2,'SECTION_EDIT','Изменить раздел'),(2,'SECTION_NAME','Раздел'),(2,'SECTIONS_NAME','Разделы'),(3,'ELEMENT_ADD','Добавить услугу'),(3,'ELEMENT_DELETE','Удалить услугу'),(3,'ELEMENT_EDIT','Изменить услугу'),(3,'ELEMENT_NAME','Услуга'),(3,'ELEMENTS_NAME','Услуги'),(3,'SECTION_ADD','Добавить раздел'),(3,'SECTION_DELETE','Удалить раздел'),(3,'SECTION_EDIT','Изменить раздел'),(3,'SECTION_NAME','Раздел'),(3,'SECTIONS_NAME','Разделы'),(4,'ELEMENT_ADD','Добавить вакансию'),(4,'ELEMENT_DELETE','Удалить вакансию'),(4,'ELEMENT_EDIT','Изменить вакансию'),(4,'ELEMENT_NAME','Вакансия'),(4,'ELEMENTS_NAME','Вакансии'),(4,'SECTION_ADD','Добавить раздел'),(4,'SECTION_DELETE','Удалить раздел'),(4,'SECTION_EDIT','Изменить раздел'),(4,'SECTION_NAME','Раздел'),(4,'SECTIONS_NAME','Разделы'),(5,'ELEMENT_ADD','Добавить элемент'),(5,'ELEMENT_DELETE','Удалить элемент'),(5,'ELEMENT_EDIT','Изменить элемент'),(5,'ELEMENT_NAME','Элемент'),(5,'ELEMENTS_NAME','Элементы'),(5,'SECTION_ADD','Добавить раздел'),(5,'SECTION_DELETE','Удалить раздел'),(5,'SECTION_EDIT','Изменить раздел'),(5,'SECTION_NAME','Раздел'),(5,'SECTIONS_NAME','Разделы');
/*!40000 ALTER TABLE `b_iblock_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_offers_tmp`
--

DROP TABLE IF EXISTS `b_iblock_offers_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_offers_tmp` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PRODUCT_IBLOCK_ID` int(11) unsigned NOT NULL,
  `OFFERS_IBLOCK_ID` int(11) unsigned NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_offers_tmp`
--

LOCK TABLES `b_iblock_offers_tmp` WRITE;
/*!40000 ALTER TABLE `b_iblock_offers_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_offers_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_property`
--

DROP TABLE IF EXISTS `b_iblock_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` text COLLATE utf8_unicode_ci,
  `PROPERTY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `ROW_COUNT` int(11) NOT NULL DEFAULT '1',
  `COL_COUNT` int(11) NOT NULL DEFAULT '30',
  `LIST_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_TYPE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MULTIPLE_CNT` int(11) DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_IBLOCK_ID` int(18) DEFAULT NULL,
  `WITH_DESCRIPTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `USER_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_SETTINGS` text COLLATE utf8_unicode_ci,
  `HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  KEY `ix_iblock_property_3` (`LINK_IBLOCK_ID`),
  KEY `ix_iblock_property_2` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_property`
--

LOCK TABLES `b_iblock_property` WRITE;
/*!40000 ALTER TABLE `b_iblock_property` DISABLE KEYS */;
INSERT INTO `b_iblock_property` VALUES (1,'2017-09-08 12:00:40',2,'Специальное предложение','Y',100,'SPECIALOFFER',NULL,'L',1,30,'C','N','5',NULL,5,NULL,NULL,'N','N','N','N',1,NULL,NULL,NULL),(2,'2017-09-08 12:00:40',2,'Цена','Y',200,'PRICE',NULL,'N',1,30,'L','N','6',NULL,5,NULL,NULL,'N','N','N','N',1,NULL,NULL,NULL),(3,'2017-09-08 12:00:40',2,'Валюта цены (подпись)','Y',300,'PRICECURRENCY',NULL,'L',1,30,'C','N','7',NULL,5,NULL,NULL,'N','N','N','N',1,NULL,NULL,NULL),(4,'2017-09-08 12:00:41',2,'Габариты (Д х Ш х В)','Y',400,'SIZE',NULL,'S',1,30,'L','N','8',NULL,5,NULL,NULL,'N','N','N','N',1,NULL,NULL,NULL),(5,'2017-09-08 12:00:41',2,'Размеры спального места','Y',500,'S_SIZE',NULL,'S',1,30,'L','N','9',NULL,5,NULL,NULL,'N','N','N','N',1,NULL,NULL,NULL),(6,'2017-09-08 12:00:41',2,'Артикул','Y',600,'ARTNUMBER',NULL,'S',1,30,'L','N','10',NULL,5,NULL,NULL,'N','N','N','N',1,NULL,NULL,NULL),(7,'2017-09-08 12:00:41',2,'Материал','Y',700,'MATERIAL',NULL,'S',1,30,'L','N','11',NULL,5,NULL,NULL,'N','N','N','N',1,NULL,NULL,NULL),(8,'2017-09-08 12:00:41',2,'Производитель','Y',800,'MANUFACTURER',NULL,'S',1,30,'L','N','12',NULL,5,NULL,NULL,'N','N','N','N',1,NULL,NULL,NULL),(9,'2017-09-12 11:09:48',5,'Должность','Y',500,'POSITION','','S',1,30,'L','N','9','',5,NULL,0,'N','Y','Y','N',1,NULL,NULL,''),(10,'2017-09-12 11:09:48',5,'Компания','Y',500,'COMPANY','','S',1,30,'L','N','10','',5,NULL,0,'N','Y','Y','N',1,NULL,NULL,''),(11,'2017-09-13 07:17:48',5,'Документы','Y',500,'DOCUMENTS','','F',1,30,'L','Y',NULL,'',5,NULL,0,'N','N','N','N',1,NULL,NULL,'');
/*!40000 ALTER TABLE `b_iblock_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_property_enum`
--

DROP TABLE IF EXISTS `b_iblock_property_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_property_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_property_enum`
--

LOCK TABLES `b_iblock_property_enum` WRITE;
/*!40000 ALTER TABLE `b_iblock_property_enum` DISABLE KEYS */;
INSERT INTO `b_iblock_property_enum` VALUES (1,1,'да','N',500,'Y',NULL),(2,3,'руб.','Y',10,'corp_cf_cur_1',NULL),(3,3,'$','N',20,'corp_cf_cur_3',NULL),(4,3,'€','N',30,'corp_cf_cur_2',NULL);
/*!40000 ALTER TABLE `b_iblock_property_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_right`
--

DROP TABLE IF EXISTS `b_iblock_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_right` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `DO_INHERIT` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `OP_SREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OP_EREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_right_iblock_id` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_iblock_right_group_code` (`GROUP_CODE`,`IBLOCK_ID`),
  KEY `ix_b_iblock_right_entity` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `ix_b_iblock_right_op_eread` (`ID`,`OP_EREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_op_sread` (`ID`,`OP_SREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_task_id` (`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_right`
--

LOCK TABLES `b_iblock_right` WRITE;
/*!40000 ALTER TABLE `b_iblock_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_rss`
--

DROP TABLE IF EXISTS `b_iblock_rss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_rss` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `NODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NODE_VALUE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_rss`
--

LOCK TABLES `b_iblock_rss` WRITE;
/*!40000 ALTER TABLE `b_iblock_rss` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_rss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_section`
--

DROP TABLE IF EXISTS `b_iblock_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `LEFT_MARGIN` int(18) DEFAULT NULL,
  `RIGHT_MARGIN` int(18) DEFAULT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  KEY `ix_iblock_section_left_margin` (`IBLOCK_ID`,`LEFT_MARGIN`,`RIGHT_MARGIN`),
  KEY `ix_iblock_section_right_margin` (`IBLOCK_ID`,`RIGHT_MARGIN`,`LEFT_MARGIN`),
  KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_section`
--

LOCK TABLES `b_iblock_section` WRITE;
/*!40000 ALTER TABLE `b_iblock_section` DISABLE KEYS */;
INSERT INTO `b_iblock_section` VALUES (1,'2017-09-08 12:00:41',1,'2017-09-08 15:00:41',1,2,NULL,'Y','Y',100,'Мягкая мебель',1,1,2,1,'Диваны, кресла и прочая мягкая мебель','html','МЯГКАЯ МЕБЕЛЬ\r\nДИВАНЫ, КРЕСЛА И ПРОЧАЯ МЯГКАЯ МЕБЕЛЬ',NULL,'2',NULL,NULL,NULL),(2,'2017-09-08 12:00:42',1,'2017-09-08 15:00:42',1,2,NULL,'Y','Y',200,'Офисная мебель',2,3,4,1,'Диваны, столы, стулья','html','ОФИСНАЯ МЕБЕЛЬ\r\nДИВАНЫ, СТОЛЫ, СТУЛЬЯ',NULL,'3',NULL,NULL,NULL),(3,'2017-09-08 12:00:43',1,'2017-09-08 15:00:43',1,2,NULL,'Y','Y',300,'Мебель для кухни',3,5,6,1,'Полки, ящики, столы и стулья','html','МЕБЕЛЬ ДЛЯ КУХНИ\r\nПОЛКИ, ЯЩИКИ, СТОЛЫ И СТУЛЬЯ',NULL,'4',NULL,NULL,NULL),(4,'2017-09-08 12:00:44',1,'2017-09-08 15:00:44',1,2,NULL,'Y','Y',400,'Детская мебель',4,7,8,1,'Кровати, стулья, мягкая детская мебель','html','ДЕТСКАЯ МЕБЕЛЬ\r\nКРОВАТИ, СТУЛЬЯ, МЯГКАЯ ДЕТСКАЯ МЕБЕЛЬ',NULL,'5',NULL,NULL,NULL);
/*!40000 ALTER TABLE `b_iblock_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_section_element`
--

DROP TABLE IF EXISTS `b_iblock_section_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int(18) DEFAULT NULL,
  UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_section_element`
--

LOCK TABLES `b_iblock_section_element` WRITE;
/*!40000 ALTER TABLE `b_iblock_section_element` DISABLE KEYS */;
INSERT INTO `b_iblock_section_element` VALUES (1,4,NULL),(1,5,NULL),(1,9,NULL),(1,10,NULL),(1,11,NULL),(1,12,NULL),(1,13,NULL),(1,14,NULL),(2,6,NULL),(2,7,NULL),(2,15,NULL),(2,16,NULL),(2,17,NULL),(2,18,NULL),(2,19,NULL),(2,20,NULL),(3,8,NULL),(3,21,NULL),(3,22,NULL),(3,23,NULL),(4,24,NULL),(4,25,NULL),(4,26,NULL),(4,27,NULL);
/*!40000 ALTER TABLE `b_iblock_section_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_section_iprop`
--

DROP TABLE IF EXISTS `b_iblock_section_iprop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_section_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SECTION_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_section_iprop`
--

LOCK TABLES `b_iblock_section_iprop` WRITE;
/*!40000 ALTER TABLE `b_iblock_section_iprop` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section_iprop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_section_property`
--

DROP TABLE IF EXISTS `b_iblock_section_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_section_property` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `PROPERTY_ID` int(11) NOT NULL,
  `SMART_FILTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_EXPANDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SECTION_ID`,`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_1` (`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_2` (`SECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_section_property`
--

LOCK TABLES `b_iblock_section_property` WRITE;
/*!40000 ALTER TABLE `b_iblock_section_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_section_right`
--

DROP TABLE IF EXISTS `b_iblock_section_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_section_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_section_right_1` (`SECTION_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_section_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_section_right`
--

LOCK TABLES `b_iblock_section_right` WRITE;
/*!40000 ALTER TABLE `b_iblock_section_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_sequence`
--

DROP TABLE IF EXISTS `b_iblock_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_sequence` (
  `IBLOCK_ID` int(18) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SEQ_VALUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_sequence`
--

LOCK TABLES `b_iblock_sequence` WRITE;
/*!40000 ALTER TABLE `b_iblock_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_site`
--

DROP TABLE IF EXISTS `b_iblock_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_site` (
  `IBLOCK_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_site`
--

LOCK TABLES `b_iblock_site` WRITE;
/*!40000 ALTER TABLE `b_iblock_site` DISABLE KEYS */;
INSERT INTO `b_iblock_site` VALUES (1,'s1'),(2,'s1'),(3,'s1'),(4,'s1'),(5,'s1');
/*!40000 ALTER TABLE `b_iblock_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_type`
--

DROP TABLE IF EXISTS `b_iblock_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_type` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(18) NOT NULL DEFAULT '500',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_type`
--

LOCK TABLES `b_iblock_type` WRITE;
/*!40000 ALTER TABLE `b_iblock_type` DISABLE KEYS */;
INSERT INTO `b_iblock_type` VALUES ('news','N',NULL,NULL,'Y',50),('products','Y',NULL,NULL,'N',100),('reviews','Y','','','N',500),('vacancies','Y',NULL,NULL,'N',150);
/*!40000 ALTER TABLE `b_iblock_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_type_lang`
--

DROP TABLE IF EXISTS `b_iblock_type_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_type_lang`
--

LOCK TABLES `b_iblock_type_lang` WRITE;
/*!40000 ALTER TABLE `b_iblock_type_lang` DISABLE KEYS */;
INSERT INTO `b_iblock_type_lang` VALUES ('news','en','News','','News'),('news','ru','Новости','','Новости'),('products','en','Products and services','Sections','Products and services'),('products','ru','Товары и услуги','Разделы','Товары и услуги'),('vacancies','en','Job','Categories','Vacancies'),('vacancies','ru','Вакансии','Разделы','Вакансии'),('reviews','ru','Отзывы','Разделы','Отзыв'),('reviews','en','Reviews','Sections','Review');
/*!40000 ALTER TABLE `b_iblock_type_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_lang`
--

DROP TABLE IF EXISTS `b_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_lang` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DIR` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOC_ROOT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_lang`
--

LOCK TABLES `b_lang` WRITE;
/*!40000 ALTER TABLE `b_lang` DISABLE KEYS */;
INSERT INTO `b_lang` VALUES ('s1',1,'Y','Y','Cайт производства (Сайт по умолчанию)','/',NULL,NULL,NULL,NULL,NULL,'ru','','N','','Cайт производства','',1);
/*!40000 ALTER TABLE `b_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_lang_domain`
--

DROP TABLE IF EXISTS `b_lang_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_lang_domain` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`LID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_lang_domain`
--

LOCK TABLES `b_lang_domain` WRITE;
/*!40000 ALTER TABLE `b_lang_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_lang_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_language`
--

DROP TABLE IF EXISTS `b_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_language` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_language`
--

LOCK TABLES `b_language` WRITE;
/*!40000 ALTER TABLE `b_language` DISABLE KEYS */;
INSERT INTO `b_language` VALUES ('en',2,'N','Y','English',NULL,NULL,NULL,NULL,NULL,NULL,2),('ru',1,'Y','Y','Russian',NULL,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `b_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_list_rubric`
--

DROP TABLE IF EXISTS `b_list_rubric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_list_rubric` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `AUTO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DAYS_OF_MONTH` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DAYS_OF_WEEK` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMES_OF_DAY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_EXECUTED` datetime DEFAULT NULL,
  `VISIBLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FROM_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_list_rubric`
--

LOCK TABLES `b_list_rubric` WRITE;
/*!40000 ALTER TABLE `b_list_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_list_rubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_medialib_collection`
--

DROP TABLE IF EXISTS `b_medialib_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_medialib_collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEMS_COUNT` int(11) DEFAULT NULL,
  `ML_TYPE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_medialib_collection`
--

LOCK TABLES `b_medialib_collection` WRITE;
/*!40000 ALTER TABLE `b_medialib_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_medialib_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_medialib_collection_item`
--

DROP TABLE IF EXISTS `b_medialib_collection_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_medialib_collection_item` (
  `COLLECTION_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_medialib_collection_item`
--

LOCK TABLES `b_medialib_collection_item` WRITE;
/*!40000 ALTER TABLE `b_medialib_collection_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_medialib_collection_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_medialib_item`
--

DROP TABLE IF EXISTS `b_medialib_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_medialib_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_TYPE` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int(11) NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_medialib_item`
--

LOCK TABLES `b_medialib_item` WRITE;
/*!40000 ALTER TABLE `b_medialib_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_medialib_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_medialib_type`
--

DROP TABLE IF EXISTS `b_medialib_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_medialib_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_medialib_type`
--

LOCK TABLES `b_medialib_type` WRITE;
/*!40000 ALTER TABLE `b_medialib_type` DISABLE KEYS */;
INSERT INTO `b_medialib_type` VALUES (1,'image_name','image','jpg,jpeg,gif,png','Y','image_desc'),(2,'video_name','video','flv,mp4,wmv','Y','video_desc'),(3,'sound_name','sound','mp3,wma,aac','Y','sound_desc');
/*!40000 ALTER TABLE `b_medialib_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_mobileapp_app`
--

DROP TABLE IF EXISTS `b_mobileapp_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_mobileapp_app` (
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SHORT_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci NOT NULL,
  `FILES` text COLLATE utf8_unicode_ci NOT NULL,
  `LAUNCH_ICONS` text COLLATE utf8_unicode_ci NOT NULL,
  `LAUNCH_SCREENS` text COLLATE utf8_unicode_ci NOT NULL,
  `FOLDER` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_mobileapp_app`
--

LOCK TABLES `b_mobileapp_app` WRITE;
/*!40000 ALTER TABLE `b_mobileapp_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_mobileapp_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_mobileapp_config`
--

DROP TABLE IF EXISTS `b_mobileapp_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_mobileapp_config` (
  `APP_CODE` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PLATFORM` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`APP_CODE`,`PLATFORM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_mobileapp_config`
--

LOCK TABLES `b_mobileapp_config` WRITE;
/*!40000 ALTER TABLE `b_mobileapp_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_mobileapp_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_module`
--

DROP TABLE IF EXISTS `b_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_module` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ACTIVE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_module`
--

LOCK TABLES `b_module` WRITE;
/*!40000 ALTER TABLE `b_module` DISABLE KEYS */;
INSERT INTO `b_module` VALUES ('bitrix.sitecorporate','2017-09-08 11:54:38'),('bitrix.siteinfoportal','2017-09-08 11:54:39'),('bitrix.sitepersonal','2017-09-08 11:54:39'),('bitrixcloud','2017-09-08 11:54:40'),('blog','2017-09-08 11:54:47'),('clouds','2017-09-08 11:54:50'),('compression','2017-09-08 11:54:51'),('fileman','2017-09-08 11:54:53'),('form','2017-09-08 11:54:58'),('forum','2017-09-08 11:55:05'),('highloadblock','2017-09-08 11:55:23'),('iblock','2017-09-08 11:55:30'),('main','2017-09-08 11:54:31'),('mobileapp','2017-09-08 11:55:33'),('perfmon','2017-09-08 11:55:39'),('photogallery','2017-09-08 11:55:39'),('scale','2017-09-08 11:55:39'),('search','2017-09-08 11:55:45'),('security','2017-09-08 11:55:52'),('seo','2017-09-08 11:56:04'),('socialservices','2017-09-08 11:56:10'),('subscribe','2017-09-08 11:56:16'),('translate','2017-09-08 11:56:17'),('vote','2017-09-08 11:56:23');
/*!40000 ALTER TABLE `b_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_module_group`
--

DROP TABLE IF EXISTS `b_module_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_module_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `G_ACCESS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`,`SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_module_group`
--

LOCK TABLES `b_module_group` WRITE;
/*!40000 ALTER TABLE `b_module_group` DISABLE KEYS */;
INSERT INTO `b_module_group` VALUES (1,'main',5,'Q',NULL),(2,'fileman',5,'F',NULL);
/*!40000 ALTER TABLE `b_module_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_module_to_module`
--

DROP TABLE IF EXISTS `b_module_to_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_module_to_module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `FROM_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TO_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_CLASS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_module_to_module` (`FROM_MODULE_ID`(20),`MESSAGE_ID`(20),`TO_MODULE_ID`(20),`TO_CLASS`(20),`TO_METHOD`(20))
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_module_to_module`
--

LOCK TABLES `b_module_to_module` WRITE;
/*!40000 ALTER TABLE `b_module_to_module` DISABLE KEYS */;
INSERT INTO `b_module_to_module` VALUES (1,'2017-09-08 11:54:31',100,'iblock','OnIBlockPropertyBuildList','main','/modules/main/tools/prop_userid.php','CIBlockPropertyUserID','GetUserTypeDescription','',1),(2,'2017-09-08 11:54:31',100,'main','OnUserDelete','main','/modules/main/classes/mysql/favorites.php','CFavorites','OnUserDelete','',1),(3,'2017-09-08 11:54:31',100,'main','OnLanguageDelete','main','/modules/main/classes/mysql/favorites.php','CFavorites','OnLanguageDelete','',1),(4,'2017-09-08 11:54:31',100,'main','OnUserDelete','main','','CUserOptions','OnUserDelete','',1),(5,'2017-09-08 11:54:31',100,'main','OnChangeFile','main','','CMain','OnChangeFileComponent','',1),(6,'2017-09-08 11:54:31',100,'main','OnUserTypeRightsCheck','main','','CUser','UserTypeRightsCheck','',1),(7,'2017-09-08 11:54:31',100,'main','OnUserLogin','main','','UpdateTools','CheckUpdates','',1),(8,'2017-09-08 11:54:32',100,'main','OnModuleUpdate','main','','UpdateTools','SetUpdateResult','',1),(9,'2017-09-08 11:54:32',100,'main','OnUpdateCheck','main','','UpdateTools','SetUpdateError','',1),(10,'2017-09-08 11:54:32',100,'main','OnPanelCreate','main','','CUndo','CheckNotifyMessage','',1),(11,'2017-09-08 11:54:32',100,'main','OnAfterAddRating','main','','CRatingsComponentsMain','OnAfterAddRating','',1),(12,'2017-09-08 11:54:32',100,'main','OnAfterUpdateRating','main','','CRatingsComponentsMain','OnAfterUpdateRating','',1),(13,'2017-09-08 11:54:32',100,'main','OnSetRatingsConfigs','main','','CRatingsComponentsMain','OnSetRatingConfigs','',1),(14,'2017-09-08 11:54:32',100,'main','OnGetRatingsConfigs','main','','CRatingsComponentsMain','OnGetRatingConfigs','',1),(15,'2017-09-08 11:54:32',100,'main','OnGetRatingsObjects','main','','CRatingsComponentsMain','OnGetRatingObject','',1),(16,'2017-09-08 11:54:32',100,'main','OnGetRatingContentOwner','main','','CRatingsComponentsMain','OnGetRatingContentOwner','',1),(17,'2017-09-08 11:54:32',100,'main','OnAfterAddRatingRule','main','','CRatingRulesMain','OnAfterAddRatingRule','',1),(18,'2017-09-08 11:54:32',100,'main','OnAfterUpdateRatingRule','main','','CRatingRulesMain','OnAfterUpdateRatingRule','',1),(19,'2017-09-08 11:54:32',100,'main','OnGetRatingRuleObjects','main','','CRatingRulesMain','OnGetRatingRuleObjects','',1),(20,'2017-09-08 11:54:32',100,'main','OnGetRatingRuleConfigs','main','','CRatingRulesMain','OnGetRatingRuleConfigs','',1),(21,'2017-09-08 11:54:32',100,'main','OnAfterUserAdd','main','','CRatings','OnAfterUserRegister','',1),(22,'2017-09-08 11:54:32',100,'main','OnUserDelete','main','','CRatings','OnUserDelete','',1),(23,'2017-09-08 11:54:32',100,'main','OnUserDelete','main','','CAccess','OnUserDelete','',1),(24,'2017-09-08 11:54:32',100,'main','OnAfterGroupAdd','main','','CGroupAuthProvider','OnAfterGroupAdd','',1),(25,'2017-09-08 11:54:32',100,'main','OnBeforeGroupUpdate','main','','CGroupAuthProvider','OnBeforeGroupUpdate','',1),(26,'2017-09-08 11:54:32',100,'main','OnBeforeGroupDelete','main','','CGroupAuthProvider','OnBeforeGroupDelete','',1),(27,'2017-09-08 11:54:32',100,'main','OnAfterSetUserGroup','main','','CGroupAuthProvider','OnAfterSetUserGroup','',1),(28,'2017-09-08 11:54:32',100,'main','OnUserLogin','main','','CGroupAuthProvider','OnUserLogin','',1),(29,'2017-09-08 11:54:32',100,'main','OnEventLogGetAuditTypes','main','','CEventMain','GetAuditTypes','',1),(30,'2017-09-08 11:54:32',100,'main','OnEventLogGetAuditHandlers','main','','CEventMain','MakeMainObject','',1),(31,'2017-09-08 11:54:32',100,'perfmon','OnGetTableSchema','main','','CTableSchema','OnGetTableSchema','',1),(32,'2017-09-08 11:54:32',100,'sender','OnConnectorList','main','','\\Bitrix\\Main\\SenderEventHandler','onConnectorListUser','',1),(33,'2017-09-08 11:54:32',110,'main','OnUserTypeBuildList','main','','CUserTypeString','GetUserTypeDescription','',1),(34,'2017-09-08 11:54:32',120,'main','OnUserTypeBuildList','main','','CUserTypeInteger','GetUserTypeDescription','',1),(35,'2017-09-08 11:54:32',130,'main','OnUserTypeBuildList','main','','CUserTypeDouble','GetUserTypeDescription','',1),(36,'2017-09-08 11:54:32',140,'main','OnUserTypeBuildList','main','','CUserTypeDateTime','GetUserTypeDescription','',1),(37,'2017-09-08 11:54:32',145,'main','OnUserTypeBuildList','main','','CUserTypeDate','GetUserTypeDescription','',1),(38,'2017-09-08 11:54:32',150,'main','OnUserTypeBuildList','main','','CUserTypeBoolean','GetUserTypeDescription','',1),(39,'2017-09-08 11:54:32',160,'main','OnUserTypeBuildList','main','','CUserTypeFile','GetUserTypeDescription','',1),(40,'2017-09-08 11:54:32',170,'main','OnUserTypeBuildList','main','','CUserTypeEnum','GetUserTypeDescription','',1),(41,'2017-09-08 11:54:32',180,'main','OnUserTypeBuildList','main','','CUserTypeIBlockSection','GetUserTypeDescription','',1),(42,'2017-09-08 11:54:32',190,'main','OnUserTypeBuildList','main','','CUserTypeIBlockElement','GetUserTypeDescription','',1),(43,'2017-09-08 11:54:32',200,'main','OnUserTypeBuildList','main','','CUserTypeStringFormatted','GetUserTypeDescription','',1),(44,'2017-09-08 11:54:32',210,'main','OnUserTypeBuildList','main','','\\Bitrix\\Main\\UrlPreview\\UrlPreviewUserType','getUserTypeDescription','',1),(45,'2017-09-08 11:54:32',100,'main','OnBeforeEndBufferContent','main','','\\Bitrix\\Main\\Analytics\\Counter','onBeforeEndBufferContent','',1),(46,'2017-09-08 11:54:32',100,'main','OnBeforeRestartBuffer','main','','\\Bitrix\\Main\\Analytics\\Counter','onBeforeRestartBuffer','',1),(47,'2017-09-08 11:54:32',100,'disk','onAfterAjaxActionCreateFolderWithSharing','main','','\\Bitrix\\Main\\FinderDestTable','onAfterDiskAjaxAction','',1),(48,'2017-09-08 11:54:33',100,'disk','onAfterAjaxActionAppendSharing','main','','\\Bitrix\\Main\\FinderDestTable','onAfterDiskAjaxAction','',1),(49,'2017-09-08 11:54:33',100,'disk','onAfterAjaxActionChangeSharingAndRights','main','','\\Bitrix\\Main\\FinderDestTable','onAfterDiskAjaxAction','',1),(50,'2017-09-08 11:54:33',100,'socialnetwork','OnSocNetLogDelete','main','','CUserCounter','OnSocNetLogDelete','',1),(51,'2017-09-08 11:54:33',100,'socialnetwork','OnSocNetLogCommentDelete','main','','CUserCounter','OnSocNetLogCommentDelete','',1),(52,'2017-09-08 11:54:33',100,'sale','OnSaleBasketItemSaved','main','','\\Bitrix\\Main\\Analytics\\Catalog','catchCatalogBasket','',2),(53,'2017-09-08 11:54:33',100,'sale','OnSaleOrderSaved','main','','\\Bitrix\\Main\\Analytics\\Catalog','catchCatalogOrder','',2),(54,'2017-09-08 11:54:33',100,'sale','OnSaleOrderPaid','main','','\\Bitrix\\Main\\Analytics\\Catalog','catchCatalogOrderPayment','',2),(55,'2017-09-08 11:54:37',100,'main','OnBuildGlobalMenu','b24connector','','\\Bitrix\\B24Connector\\Helper','onBuildGlobalMenu','',1),(56,'2017-09-08 11:54:37',100,'main','OnBeforeProlog','b24connector','','\\Bitrix\\B24Connector\\Helper','onBeforeProlog','',1),(57,'2017-09-08 11:54:38',100,'main','OnBeforeProlog','bitrix.sitecorporate','','CSiteCorporate','ShowPanel','',1),(58,'2017-09-08 11:54:39',100,'main','OnBeforeProlog','bitrix.siteinfoportal','','CSiteInfoportal','ShowPanel','',1),(59,'2017-09-08 11:54:39',100,'main','OnBeforeProlog','bitrix.sitepersonal','','CSitePersonal','ShowPanel','',1),(60,'2017-09-08 11:54:40',100,'main','OnAdminInformerInsertItems','bitrixcloud','','CBitrixCloudCDN','OnAdminInformerInsertItems','',1),(61,'2017-09-08 11:54:40',100,'main','OnAdminInformerInsertItems','bitrixcloud','','CBitrixCloudBackup','OnAdminInformerInsertItems','',1),(62,'2017-09-08 11:54:40',100,'mobileapp','OnBeforeAdminMobileMenuBuild','bitrixcloud','','CBitrixCloudMobile','OnBeforeAdminMobileMenuBuild','',1),(63,'2017-09-08 11:54:47',100,'search','OnReindex','blog','','CBlogSearch','OnSearchReindex','',1),(64,'2017-09-08 11:54:47',100,'main','OnUserDelete','blog','','CBlogUser','Delete','',1),(65,'2017-09-08 11:54:47',100,'main','OnSiteDelete','blog','','CBlogSitePath','DeleteBySiteID','',1),(66,'2017-09-08 11:54:47',100,'socialnetwork','OnSocNetGroupDelete','blog','','CBlogSoNetPost','OnGroupDelete','',1),(67,'2017-09-08 11:54:47',100,'socialnetwork','OnSocNetFeaturesAdd','blog','','CBlogSearch','SetSoNetFeatureIndexSearch','',1),(68,'2017-09-08 11:54:47',100,'socialnetwork','OnSocNetFeaturesUpdate','blog','','CBlogSearch','SetSoNetFeatureIndexSearch','',1),(69,'2017-09-08 11:54:47',100,'socialnetwork','OnSocNetFeaturesPermsAdd','blog','','CBlogSearch','SetSoNetFeaturePermIndexSearch','',1),(70,'2017-09-08 11:54:47',100,'socialnetwork','OnSocNetFeaturesPermsUpdate','blog','','CBlogSearch','SetSoNetFeaturePermIndexSearch','',1),(71,'2017-09-08 11:54:47',200,'main','OnAfterAddRating','blog','','CRatingsComponentsBlog','OnAfterAddRating','',1),(72,'2017-09-08 11:54:47',200,'main','OnAfterUpdateRating','blog','','CRatingsComponentsBlog','OnAfterUpdateRating','',1),(73,'2017-09-08 11:54:47',200,'main','OnSetRatingsConfigs','blog','','CRatingsComponentsBlog','OnSetRatingConfigs','',1),(74,'2017-09-08 11:54:47',200,'main','OnGetRatingsConfigs','blog','','CRatingsComponentsBlog','OnGetRatingConfigs','',1),(75,'2017-09-08 11:54:47',200,'main','OnGetRatingsObjects','blog','','CRatingsComponentsBlog','OnGetRatingObject','',1),(76,'2017-09-08 11:54:47',200,'main','OnGetRatingContentOwner','blog','','CRatingsComponentsBlog','OnGetRatingContentOwner','',1),(77,'2017-09-08 11:54:47',100,'im','OnGetNotifySchema','blog','','CBlogNotifySchema','OnGetNotifySchema','',1),(78,'2017-09-08 11:54:47',100,'im','OnAnswerNotify','blog','','CBlogNotifySchema','CBlogEventsIMCallback','',1),(79,'2017-09-08 11:54:47',100,'main','OnAfterRegisterModule','main','/modules/blog/install/index.php','blog','installUserFields','',1),(80,'2017-09-08 11:54:47',100,'conversion','OnGetCounterTypes','blog','','\\Bitrix\\Blog\\Internals\\ConversionHandlers','onGetCounterTypes','',1),(81,'2017-09-08 11:54:47',100,'conversion','OnGetRateTypes','blog','','\\Bitrix\\Blog\\Internals\\ConversionHandlers','onGetRateTypes','',1),(82,'2017-09-08 11:54:47',100,'blog','OnPostAdd','blog','','\\Bitrix\\Blog\\Internals\\ConversionHandlers','onPostAdd','',1),(83,'2017-09-08 11:54:47',100,'mail','onReplyReceivedBLOG_POST','blog','','\\Bitrix\\Blog\\Internals\\MailHandler','handleReplyReceivedBlogPost','',2),(84,'2017-09-08 11:54:47',100,'mail','onForwardReceivedBLOG_POST','blog','','\\Bitrix\\Blog\\Internals\\MailHandler','handleForwardReceivedBlogPost','',2),(85,'2017-09-08 11:54:47',100,'socialnetwork','onLogIndexGetContent','blog','','\\Bitrix\\Blog\\Integration\\Socialnetwork\\Log','onIndexGetContent','',2),(86,'2017-09-08 11:54:47',100,'socialnetwork','onLogCommentIndexGetContent','blog','','\\Bitrix\\Blog\\Integration\\Socialnetwork\\LogComment','onIndexGetContent','',2),(87,'2017-09-08 11:54:50',100,'main','OnEventLogGetAuditTypes','clouds','','CCloudStorage','GetAuditTypes','',1),(88,'2017-09-08 11:54:50',100,'main','OnBeforeProlog','clouds','','CCloudStorage','OnBeforeProlog','',1),(89,'2017-09-08 11:54:50',100,'main','OnAdminListDisplay','clouds','','CCloudStorage','OnAdminListDisplay','',1),(90,'2017-09-08 11:54:50',100,'main','OnBuildGlobalMenu','clouds','','CCloudStorage','OnBuildGlobalMenu','',1),(91,'2017-09-08 11:54:50',100,'main','OnFileSave','clouds','','CCloudStorage','OnFileSave','',1),(92,'2017-09-08 11:54:50',100,'main','OnGetFileSRC','clouds','','CCloudStorage','OnGetFileSRC','',1),(93,'2017-09-08 11:54:50',100,'main','OnFileCopy','clouds','','CCloudStorage','OnFileCopy','',1),(94,'2017-09-08 11:54:50',100,'main','OnFileDelete','clouds','','CCloudStorage','OnFileDelete','',1),(95,'2017-09-08 11:54:50',100,'main','OnMakeFileArray','clouds','','CCloudStorage','OnMakeFileArray','',1),(96,'2017-09-08 11:54:50',100,'main','OnBeforeResizeImage','clouds','','CCloudStorage','OnBeforeResizeImage','',1),(97,'2017-09-08 11:54:50',100,'main','OnAfterResizeImage','clouds','','CCloudStorage','OnAfterResizeImage','',1),(98,'2017-09-08 11:54:50',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_AmazonS3','GetObjectInstance','',1),(99,'2017-09-08 11:54:50',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_GoogleStorage','GetObjectInstance','',1),(100,'2017-09-08 11:54:50',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_OpenStackStorage','GetObjectInstance','',1),(101,'2017-09-08 11:54:51',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_RackSpaceCloudFiles','GetObjectInstance','',1),(102,'2017-09-08 11:54:51',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_ClodoRU','GetObjectInstance','',1),(103,'2017-09-08 11:54:51',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_Selectel','GetObjectInstance','',1),(104,'2017-09-08 11:54:51',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_HotBox','GetObjectInstance','',1),(105,'2017-09-08 11:54:51',1,'main','OnPageStart','compression','','CCompress','OnPageStart','',1),(106,'2017-09-08 11:54:51',10000,'main','OnAfterEpilog','compression','','CCompress','OnAfterEpilog','',1),(107,'2017-09-08 11:54:53',100,'main','OnGroupDelete','fileman','','CFileman','OnGroupDelete','',1),(108,'2017-09-08 11:54:53',100,'main','OnPanelCreate','fileman','','CFileman','OnPanelCreate','',1),(109,'2017-09-08 11:54:53',100,'main','OnModuleUpdate','fileman','','CFileman','OnModuleUpdate','',1),(110,'2017-09-08 11:54:53',100,'main','OnModuleInstalled','fileman','','CFileman','ClearComponentsListCache','',1),(111,'2017-09-08 11:54:53',100,'iblock','OnIBlockPropertyBuildList','fileman','','CIBlockPropertyMapGoogle','GetUserTypeDescription','',1),(112,'2017-09-08 11:54:53',100,'iblock','OnIBlockPropertyBuildList','fileman','','CIBlockPropertyMapYandex','GetUserTypeDescription','',1),(113,'2017-09-08 11:54:53',100,'iblock','OnIBlockPropertyBuildList','fileman','','CIBlockPropertyVideo','GetUserTypeDescription','',1),(114,'2017-09-08 11:54:53',100,'main','OnUserTypeBuildList','fileman','','CUserTypeVideo','GetUserTypeDescription','',1),(115,'2017-09-08 11:54:53',100,'main','OnEventLogGetAuditTypes','fileman','','CEventFileman','GetAuditTypes','',1),(116,'2017-09-08 11:54:53',100,'main','OnEventLogGetAuditHandlers','fileman','','CEventFileman','MakeFilemanObject','',1),(117,'2017-09-08 11:54:58',100,'sender','OnConnectorList','form','','\\Bitrix\\Form\\SenderEventHandler','onConnectorListForm','',1),(118,'2017-09-08 11:55:05',100,'main','OnAfterUserUpdate','forum','','CForumUser','OnAfterUserUpdate','',1),(119,'2017-09-08 11:55:05',100,'main','OnGroupDelete','forum','','CForumNew','OnGroupDelete','',1),(120,'2017-09-08 11:55:05',100,'main','OnBeforeLangDelete','forum','','CForumNew','OnBeforeLangDelete','',1),(121,'2017-09-08 11:55:05',100,'main','OnFileDelete','forum','','CForumFiles','OnFileDelete','',1),(122,'2017-09-08 11:55:05',100,'search','OnReindex','forum','','CForumNew','OnReindex','',1),(123,'2017-09-08 11:55:05',100,'main','OnUserDelete','forum','','CForumUser','OnUserDelete','',1),(124,'2017-09-08 11:55:05',100,'iblock','OnIBlockPropertyBuildList','main','/modules/forum/tools/prop_topicid.php','CIBlockPropertyTopicID','GetUserTypeDescription','',1),(125,'2017-09-08 11:55:05',100,'iblock','OnBeforeIBlockElementDelete','forum','','CForumTopic','OnBeforeIBlockElementDelete','',1),(126,'2017-09-08 11:55:05',100,'main','OnEventLogGetAuditTypes','forum','','CForumEventLog','GetAuditTypes','',1),(127,'2017-09-08 11:55:05',100,'main','OnEventLogGetAuditHandlers','forum','','CEventForum','MakeForumObject','',1),(128,'2017-09-08 11:55:05',100,'socialnetwork','OnSocNetGroupDelete','forum','','CForumUser','OnSocNetGroupDelete','',1),(129,'2017-09-08 11:55:05',100,'socialnetwork','OnSocNetLogFormatEvent','forum','','CForumMessage','OnSocNetLogFormatEvent','',1),(130,'2017-09-08 11:55:05',100,'mail','OnGetFilterList','forum','','CForumEMail','OnGetSocNetFilterList','',1),(131,'2017-09-08 11:55:05',100,'main','OnAfterAddRating','forum','','CRatingsComponentsForum','OnAfterAddRating','',1),(132,'2017-09-08 11:55:05',100,'main','OnAfterUpdateRating','forum','','CRatingsComponentsForum','OnAfterUpdateRating','',1),(133,'2017-09-08 11:55:05',100,'main','OnSetRatingsConfigs','forum','','CRatingsComponentsForum','OnSetRatingConfigs','',1),(134,'2017-09-08 11:55:05',100,'main','OnGetRatingsConfigs','forum','','CRatingsComponentsForum','OnGetRatingConfigs','',1),(135,'2017-09-08 11:55:05',100,'main','OnGetRatingsObjects','forum','','CRatingsComponentsForum','OnGetRatingObject','',1),(136,'2017-09-08 11:55:05',100,'main','OnGetRatingContentOwner','forum','','CRatingsComponentsForum','OnGetRatingContentOwner','',1),(137,'2017-09-08 11:55:05',100,'im','OnGetNotifySchema','forum','','CForumNotifySchema','OnGetNotifySchema','',1),(138,'2017-09-08 11:55:05',100,'main','OnAfterRegisterModule','main','/modules/forum/install/index.php','forum','InstallUserFields','',1),(139,'2017-09-08 11:55:06',100,'conversion','OnGetCounterTypes','forum','','\\Bitrix\\Forum\\Internals\\ConversionHandlers','onGetCounterTypes','',1),(140,'2017-09-08 11:55:06',100,'conversion','OnGetRateTypes','forum','','\\Bitrix\\Forum\\Internals\\ConversionHandlers','onGetRateTypes','',1),(141,'2017-09-08 11:55:06',100,'forum','onAfterTopicAdd','forum','','\\Bitrix\\Forum\\Internals\\ConversionHandlers','onTopicAdd','',1),(142,'2017-09-08 11:55:06',100,'forum','onAfterMessageAdd','forum','','\\Bitrix\\Forum\\Internals\\ConversionHandlers','onMessageAdd','',1),(143,'2017-09-08 11:55:06',100,'socialnetwork','onLogIndexGetContent','forum','','\\Bitrix\\Forum\\Integration\\Socialnetwork\\Log','onIndexGetContent','',2),(144,'2017-09-08 11:55:06',100,'socialnetwork','onLogCommentIndexGetContent','forum','','\\Bitrix\\Forum\\Integration\\Socialnetwork\\LogComment','onIndexGetContent','',2),(145,'2017-09-08 11:55:23',100,'main','OnBeforeUserTypeAdd','highloadblock','','\\Bitrix\\Highloadblock\\HighloadBlockTable','OnBeforeUserTypeAdd','',1),(146,'2017-09-08 11:55:23',100,'main','OnAfterUserTypeAdd','highloadblock','','\\Bitrix\\Highloadblock\\HighloadBlockTable','onAfterUserTypeAdd','',1),(147,'2017-09-08 11:55:23',100,'main','OnBeforeUserTypeDelete','highloadblock','','\\Bitrix\\Highloadblock\\HighloadBlockTable','OnBeforeUserTypeDelete','',1),(148,'2017-09-08 11:55:23',100,'main','OnUserTypeBuildList','highloadblock','','CUserTypeHlblock','GetUserTypeDescription','',1),(149,'2017-09-08 11:55:23',100,'iblock','OnIBlockPropertyBuildList','highloadblock','','CIBlockPropertyDirectory','GetUserTypeDescription','',1),(150,'2017-09-08 11:55:30',100,'main','OnGroupDelete','iblock','','CIBlock','OnGroupDelete','',1),(151,'2017-09-08 11:55:30',100,'main','OnBeforeLangDelete','iblock','','CIBlock','OnBeforeLangDelete','',1),(152,'2017-09-08 11:55:31',100,'main','OnLangDelete','iblock','','CIBlock','OnLangDelete','',1),(153,'2017-09-08 11:55:31',100,'main','OnUserTypeRightsCheck','iblock','','CIBlockSection','UserTypeRightsCheck','',1),(154,'2017-09-08 11:55:31',100,'search','OnReindex','iblock','','CIBlock','OnSearchReindex','',1),(155,'2017-09-08 11:55:31',100,'search','OnSearchGetURL','iblock','','CIBlock','OnSearchGetURL','',1),(156,'2017-09-08 11:55:31',100,'main','OnEventLogGetAuditTypes','iblock','','CIBlock','GetAuditTypes','',1),(157,'2017-09-08 11:55:31',100,'main','OnEventLogGetAuditHandlers','iblock','','CEventIBlock','MakeIBlockObject','',1),(158,'2017-09-08 11:55:31',200,'main','OnGetRatingContentOwner','iblock','','CRatingsComponentsIBlock','OnGetRatingContentOwner','',1),(159,'2017-09-08 11:55:31',100,'main','OnTaskOperationsChanged','iblock','','CIBlockRightsStorage','OnTaskOperationsChanged','',1),(160,'2017-09-08 11:55:31',100,'main','OnGroupDelete','iblock','','CIBlockRightsStorage','OnGroupDelete','',1),(161,'2017-09-08 11:55:31',100,'main','OnUserDelete','iblock','','CIBlockRightsStorage','OnUserDelete','',1),(162,'2017-09-08 11:55:31',100,'perfmon','OnGetTableSchema','iblock','','iblock','OnGetTableSchema','',1),(163,'2017-09-08 11:55:31',100,'sender','OnConnectorList','iblock','','\\Bitrix\\Iblock\\SenderEventHandler','onConnectorListIblock','',1),(164,'2017-09-08 11:55:31',10,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertyDate','GetUserTypeDescription','',1),(165,'2017-09-08 11:55:31',20,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertyDateTime','GetUserTypeDescription','',1),(166,'2017-09-08 11:55:31',30,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertyXmlID','GetUserTypeDescription','',1),(167,'2017-09-08 11:55:31',40,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertyFileMan','GetUserTypeDescription','',1),(168,'2017-09-08 11:55:31',50,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertyHTML','GetUserTypeDescription','',1),(169,'2017-09-08 11:55:31',60,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertyElementList','GetUserTypeDescription','',1),(170,'2017-09-08 11:55:31',70,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertySequence','GetUserTypeDescription','',1),(171,'2017-09-08 11:55:31',80,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertyElementAutoComplete','GetUserTypeDescription','',1),(172,'2017-09-08 11:55:31',90,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertySKU','GetUserTypeDescription','',1),(173,'2017-09-08 11:55:31',100,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertySectionAutoComplete','GetUserTypeDescription','',1),(174,'2017-09-08 11:55:33',100,'pull','OnGetDependentModule','mobileapp','','CMobileAppPullSchema','OnGetDependentModule','',1),(175,'2017-09-08 11:55:39',100,'perfmon','OnGetTableSchema','perfmon','','perfmon','OnGetTableSchema','',1),(176,'2017-09-08 11:55:39',100,'iblock','OnBeforeIBlockElementDelete','photogallery','','CPhotogalleryElement','OnBeforeIBlockElementDelete','',1),(177,'2017-09-08 11:55:39',100,'iblock','OnAfterIBlockElementAdd','photogallery','','CPhotogalleryElement','OnAfterIBlockElementAdd','',1),(178,'2017-09-08 11:55:39',100,'search','BeforeIndex','photogallery','','CRatingsComponentsPhotogallery','BeforeIndex','',1),(179,'2017-09-08 11:55:39',100,'im','OnGetNotifySchema','photogallery','','CPhotogalleryNotifySchema','OnGetNotifySchema','',1),(180,'2017-09-08 11:55:40',100,'main','OnEventLogGetAuditTypes','scale','','\\Bitrix\\Scale\\Logger','onEventLogGetAuditTypes','',1),(181,'2017-09-08 11:55:45',100,'main','OnChangePermissions','search','','CSearch','OnChangeFilePermissions','',1),(182,'2017-09-08 11:55:45',100,'main','OnChangeFile','search','','CSearch','OnChangeFile','',1),(183,'2017-09-08 11:55:45',100,'main','OnGroupDelete','search','','CSearch','OnGroupDelete','',1),(184,'2017-09-08 11:55:45',100,'main','OnLangDelete','search','','CSearch','OnLangDelete','',1),(185,'2017-09-08 11:55:45',100,'main','OnAfterUserUpdate','search','','CSearchUser','OnAfterUserUpdate','',1),(186,'2017-09-08 11:55:45',100,'main','OnUserDelete','search','','CSearchUser','DeleteByUserID','',1),(187,'2017-09-08 11:55:45',100,'cluster','OnGetTableList','search','','search','OnGetTableList','',1),(188,'2017-09-08 11:55:45',100,'perfmon','OnGetTableSchema','search','','search','OnGetTableSchema','',1),(189,'2017-09-08 11:55:45',90,'main','OnEpilog','search','','CSearchStatistic','OnEpilog','',1),(190,'2017-09-08 11:55:52',100,'main','OnUserDelete','security','','CSecurityUser','OnUserDelete','',1),(191,'2017-09-08 11:55:52',100,'main','OnEventLogGetAuditTypes','security','','CSecurityFilter','GetAuditTypes','',1),(192,'2017-09-08 11:55:52',100,'main','OnEventLogGetAuditTypes','security','','CSecurityAntiVirus','GetAuditTypes','',1),(193,'2017-09-08 11:55:52',100,'main','OnAdminInformerInsertItems','security','','CSecurityFilter','OnAdminInformerInsertItems','',1),(194,'2017-09-08 11:55:53',100,'main','OnAdminInformerInsertItems','security','','CSecuritySiteChecker','OnAdminInformerInsertItems','',1),(195,'2017-09-08 11:55:53',5,'main','OnBeforeProlog','security','','CSecurityFilter','OnBeforeProlog','',1),(196,'2017-09-08 11:55:53',9999,'main','OnEndBufferContent','security','','CSecurityXSSDetect','OnEndBufferContent','',1),(197,'2017-09-08 11:55:53',1,'main','OnBeforeLocalRedirect','security','','CSecurityRedirect','BeforeLocalRedirect','',1),(198,'2017-09-08 11:55:53',1,'main','OnEndBufferContent','security','','CSecurityRedirect','EndBufferContent','',1),(199,'2017-09-08 11:56:05',100,'main','OnPanelCreate','seo','','CSeoEventHandlers','SeoOnPanelCreate','',2),(200,'2017-09-08 11:56:05',100,'fileman','OnIncludeHTMLEditorScript','seo','','CSeoEventHandlers','OnIncludeHTMLEditorScript','',2),(201,'2017-09-08 11:56:05',100,'fileman','OnBeforeHTMLEditorScriptRuns','seo','','CSeoEventHandlers','OnBeforeHTMLEditorScriptRuns','',2),(202,'2017-09-08 11:56:05',100,'iblock','OnAfterIBlockSectionAdd','seo','','\\Bitrix\\Seo\\SitemapIblock','addSection','',2),(203,'2017-09-08 11:56:05',100,'iblock','OnAfterIBlockElementAdd','seo','','\\Bitrix\\Seo\\SitemapIblock','addElement','',2),(204,'2017-09-08 11:56:05',100,'iblock','OnBeforeIBlockSectionDelete','seo','','\\Bitrix\\Seo\\SitemapIblock','beforeDeleteSection','',2),(205,'2017-09-08 11:56:05',100,'iblock','OnBeforeIBlockElementDelete','seo','','\\Bitrix\\Seo\\SitemapIblock','beforeDeleteElement','',2),(206,'2017-09-08 11:56:05',100,'iblock','OnAfterIBlockSectionDelete','seo','','\\Bitrix\\Seo\\SitemapIblock','deleteSection','',2),(207,'2017-09-08 11:56:05',100,'iblock','OnAfterIBlockElementDelete','seo','','\\Bitrix\\Seo\\SitemapIblock','deleteElement','',2),(208,'2017-09-08 11:56:05',100,'iblock','OnBeforeIBlockSectionUpdate','seo','','\\Bitrix\\Seo\\SitemapIblock','beforeUpdateSection','',2),(209,'2017-09-08 11:56:05',100,'iblock','OnBeforeIBlockElementUpdate','seo','','\\Bitrix\\Seo\\SitemapIblock','beforeUpdateElement','',2),(210,'2017-09-08 11:56:05',100,'iblock','OnAfterIBlockSectionUpdate','seo','','\\Bitrix\\Seo\\SitemapIblock','updateSection','',2),(211,'2017-09-08 11:56:06',100,'iblock','OnAfterIBlockElementUpdate','seo','','\\Bitrix\\Seo\\SitemapIblock','updateElement','',2),(212,'2017-09-08 11:56:06',100,'forum','onAfterTopicAdd','seo','','\\Bitrix\\Seo\\SitemapForum','addTopic','',2),(213,'2017-09-08 11:56:06',100,'forum','onAfterTopicUpdate','seo','','\\Bitrix\\Seo\\SitemapForum','updateTopic','',2),(214,'2017-09-08 11:56:06',100,'forum','onAfterTopicDelete','seo','','\\Bitrix\\Seo\\SitemapForum','deleteTopic','',2),(215,'2017-09-08 11:56:06',100,'main','OnAdminIBlockElementEdit','seo','','\\Bitrix\\Seo\\AdvTabEngine','eventHandler','',2),(216,'2017-09-08 11:56:06',100,'main','OnBeforeProlog','seo','','\\Bitrix\\Seo\\AdvSession','checkSession','',2),(217,'2017-09-08 11:56:06',100,'sale','OnOrderSave','seo','','\\Bitrix\\Seo\\AdvSession','onOrderSave','',2),(218,'2017-09-08 11:56:06',100,'sale','OnBasketOrder','seo','','\\Bitrix\\Seo\\AdvSession','onBasketOrder','',2),(219,'2017-09-08 11:56:06',100,'sale','onSalePayOrder','seo','','\\Bitrix\\Seo\\AdvSession','onSalePayOrder','',2),(220,'2017-09-08 11:56:06',100,'sale','onSaleDeductOrder','seo','','\\Bitrix\\Seo\\AdvSession','onSaleDeductOrder','',2),(221,'2017-09-08 11:56:06',100,'sale','onSaleDeliveryOrder','seo','','\\Bitrix\\Seo\\AdvSession','onSaleDeliveryOrder','',2),(222,'2017-09-08 11:56:06',100,'sale','onSaleStatusOrder','seo','','\\Bitrix\\Seo\\AdvSession','onSaleStatusOrder','',2),(223,'2017-09-08 11:56:06',100,'conversion','OnSetDayContextAttributes','seo','','\\Bitrix\\Seo\\ConversionHandler','onSetDayContextAttributes','',2),(224,'2017-09-08 11:56:06',100,'conversion','OnGetAttributeTypes','seo','','\\Bitrix\\Seo\\ConversionHandler','onGetAttributeTypes','',2),(225,'2017-09-08 11:56:06',100,'catalog','OnProductUpdate','seo','','\\Bitrix\\Seo\\Adv\\Auto','checkQuantity','',2),(226,'2017-09-08 11:56:06',100,'catalog','OnProductSetAvailableUpdate','seo','','\\Bitrix\\Seo\\Adv\\Auto','checkQuantity','',2),(227,'2017-09-08 11:56:10',100,'main','OnUserDelete','socialservices','','CSocServAuthDB','OnUserDelete','',1),(228,'2017-09-08 11:56:11',100,'timeman','OnAfterTMReportDailyAdd','socialservices','','CSocServAuthDB','OnAfterTMReportDailyAdd','',1),(229,'2017-09-08 11:56:11',100,'timeman','OnAfterTMDayStart','socialservices','','CSocServAuthDB','OnAfterTMDayStart','',1),(230,'2017-09-08 11:56:11',100,'timeman','OnTimeManShow','socialservices','','CSocServEventHandlers','OnTimeManShow','',1),(231,'2017-09-08 11:56:11',100,'main','OnFindExternalUser','socialservices','','CSocServAuthDB','OnFindExternalUser','',1),(232,'2017-09-08 11:56:11',100,'socialservices','OnFindSocialservicesUser','socialservices','','CSocServAuthManager','checkOldUser','',1),(233,'2017-09-08 11:56:11',100,'socialservices','OnFindSocialservicesUser','socialservices','','CSocServAuthManager','checkAbandonedUser','',1),(234,'2017-09-08 11:56:16',100,'main','OnBeforeLangDelete','subscribe','','CRubric','OnBeforeLangDelete','',1),(235,'2017-09-08 11:56:16',100,'main','OnUserDelete','subscribe','','CSubscription','OnUserDelete','',1),(236,'2017-09-08 11:56:16',100,'main','OnUserLogout','subscribe','','CSubscription','OnUserLogout','',1),(237,'2017-09-08 11:56:16',100,'main','OnGroupDelete','subscribe','','CPosting','OnGroupDelete','',1),(238,'2017-09-08 11:56:16',100,'sender','OnConnectorList','subscribe','','Bitrix\\Subscribe\\SenderEventHandler','onConnectorListSubscriber','',1),(239,'2017-09-08 11:56:17',100,'main','OnPanelCreate','translate','','CTranslateEventHandlers','TranslatOnPanelCreate','',1),(240,'2017-09-08 11:56:23',100,'main','OnBeforeProlog','main','/modules/vote/keepvoting.php','','','',1),(241,'2017-09-08 11:56:23',200,'main','OnUserTypeBuildList','vote','','Bitrix\\Vote\\Uf\\VoteUserType','getUserTypeDescription','',1),(242,'2017-09-08 11:56:23',200,'main','OnUserLogin','vote','','CVoteUser','OnUserLogin','',1),(243,'2017-09-08 11:56:23',100,'im','OnGetNotifySchema','vote','','CVoteNotifySchema','OnGetNotifySchema','',1),(244,'2017-09-08 11:56:51',100,'main','OnBeforeProlog','main','/modules/main/install/wizard_sol/panel_button.php','CWizardSolPanel','ShowPanel','',1);
/*!40000 ALTER TABLE `b_module_to_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_operation`
--

DROP TABLE IF EXISTS `b_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_operation` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_operation`
--

LOCK TABLES `b_operation` WRITE;
/*!40000 ALTER TABLE `b_operation` DISABLE KEYS */;
INSERT INTO `b_operation` VALUES (1,'edit_php','main',NULL,'module'),(2,'view_own_profile','main',NULL,'module'),(3,'edit_own_profile','main',NULL,'module'),(4,'view_all_users','main',NULL,'module'),(5,'view_groups','main',NULL,'module'),(6,'view_tasks','main',NULL,'module'),(7,'view_other_settings','main',NULL,'module'),(8,'view_subordinate_users','main',NULL,'module'),(9,'edit_subordinate_users','main',NULL,'module'),(10,'edit_all_users','main',NULL,'module'),(11,'edit_groups','main',NULL,'module'),(12,'edit_tasks','main',NULL,'module'),(13,'edit_other_settings','main',NULL,'module'),(14,'cache_control','main',NULL,'module'),(15,'lpa_template_edit','main',NULL,'module'),(16,'view_event_log','main',NULL,'module'),(17,'edit_ratings','main',NULL,'module'),(18,'manage_short_uri','main',NULL,'module'),(19,'fm_view_permission','main',NULL,'file'),(20,'fm_view_file','main',NULL,'file'),(21,'fm_view_listing','main',NULL,'file'),(22,'fm_edit_existent_folder','main',NULL,'file'),(23,'fm_create_new_file','main',NULL,'file'),(24,'fm_edit_existent_file','main',NULL,'file'),(25,'fm_create_new_folder','main',NULL,'file'),(26,'fm_delete_file','main',NULL,'file'),(27,'fm_delete_folder','main',NULL,'file'),(28,'fm_edit_in_workflow','main',NULL,'file'),(29,'fm_rename_file','main',NULL,'file'),(30,'fm_rename_folder','main',NULL,'file'),(31,'fm_upload_file','main',NULL,'file'),(32,'fm_add_to_menu','main',NULL,'file'),(33,'fm_download_file','main',NULL,'file'),(34,'fm_lpa','main',NULL,'file'),(35,'fm_edit_permission','main',NULL,'file'),(36,'bitrixcloud_monitoring','bitrixcloud',NULL,'module'),(37,'bitrixcloud_backup','bitrixcloud',NULL,'module'),(38,'bitrixcloud_cdn','bitrixcloud',NULL,'module'),(39,'clouds_browse','clouds',NULL,'module'),(40,'clouds_upload','clouds',NULL,'module'),(41,'clouds_config','clouds',NULL,'module'),(42,'fileman_view_all_settings','fileman','','module'),(43,'fileman_edit_menu_types','fileman','','module'),(44,'fileman_add_element_to_menu','fileman','','module'),(45,'fileman_edit_menu_elements','fileman','','module'),(46,'fileman_edit_existent_files','fileman','','module'),(47,'fileman_edit_existent_folders','fileman','','module'),(48,'fileman_admin_files','fileman','','module'),(49,'fileman_admin_folders','fileman','','module'),(50,'fileman_view_permissions','fileman','','module'),(51,'fileman_edit_all_settings','fileman','','module'),(52,'fileman_upload_files','fileman','','module'),(53,'fileman_view_file_structure','fileman','','module'),(54,'fileman_install_control','fileman','','module'),(55,'medialib_view_collection','fileman','','medialib'),(56,'medialib_new_collection','fileman','','medialib'),(57,'medialib_edit_collection','fileman','','medialib'),(58,'medialib_del_collection','fileman','','medialib'),(59,'medialib_access','fileman','','medialib'),(60,'medialib_new_item','fileman','','medialib'),(61,'medialib_edit_item','fileman','','medialib'),(62,'medialib_del_item','fileman','','medialib'),(63,'sticker_view','fileman','','stickers'),(64,'sticker_edit','fileman','','stickers'),(65,'sticker_new','fileman','','stickers'),(66,'sticker_del','fileman','','stickers'),(67,'hl_element_read','highloadblock',NULL,'module'),(68,'hl_element_write','highloadblock',NULL,'module'),(69,'hl_element_delete','highloadblock',NULL,'module'),(70,'section_read','iblock',NULL,'iblock'),(71,'element_read','iblock',NULL,'iblock'),(72,'section_element_bind','iblock',NULL,'iblock'),(73,'iblock_admin_display','iblock',NULL,'iblock'),(74,'element_edit','iblock',NULL,'iblock'),(75,'element_edit_price','iblock',NULL,'iblock'),(76,'element_delete','iblock',NULL,'iblock'),(77,'element_bizproc_start','iblock',NULL,'iblock'),(78,'section_edit','iblock',NULL,'iblock'),(79,'section_delete','iblock',NULL,'iblock'),(80,'section_section_bind','iblock',NULL,'iblock'),(81,'element_edit_any_wf_status','iblock',NULL,'iblock'),(82,'iblock_edit','iblock',NULL,'iblock'),(83,'iblock_delete','iblock',NULL,'iblock'),(84,'iblock_rights_edit','iblock',NULL,'iblock'),(85,'iblock_export','iblock',NULL,'iblock'),(86,'section_rights_edit','iblock',NULL,'iblock'),(87,'element_rights_edit','iblock',NULL,'iblock'),(88,'security_filter_bypass','security',NULL,'module'),(89,'security_edit_user_otp','security',NULL,'module'),(90,'security_module_settings_read','security',NULL,'module'),(91,'security_panel_view','security',NULL,'module'),(92,'security_filter_settings_read','security',NULL,'module'),(93,'security_otp_settings_read','security',NULL,'module'),(94,'security_iprule_admin_settings_read','security',NULL,'module'),(95,'security_session_settings_read','security',NULL,'module'),(96,'security_redirect_settings_read','security',NULL,'module'),(97,'security_stat_activity_settings_read','security',NULL,'module'),(98,'security_iprule_settings_read','security',NULL,'module'),(99,'security_antivirus_settings_read','security',NULL,'module'),(100,'security_frame_settings_read','security',NULL,'module'),(101,'security_module_settings_write','security',NULL,'module'),(102,'security_filter_settings_write','security',NULL,'module'),(103,'security_otp_settings_write','security',NULL,'module'),(104,'security_iprule_admin_settings_write','security',NULL,'module'),(105,'security_session_settings_write','security',NULL,'module'),(106,'security_redirect_settings_write','security',NULL,'module'),(107,'security_stat_activity_settings_write','security',NULL,'module'),(108,'security_iprule_settings_write','security',NULL,'module'),(109,'security_file_verifier_sign','security',NULL,'module'),(110,'security_file_verifier_collect','security',NULL,'module'),(111,'security_file_verifier_verify','security',NULL,'module'),(112,'security_antivirus_settings_write','security',NULL,'module'),(113,'security_frame_settings_write','security',NULL,'module'),(114,'seo_settings','seo','','module'),(115,'seo_tools','seo','','module');
/*!40000 ALTER TABLE `b_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_option`
--

DROP TABLE IF EXISTS `b_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_option` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `ix_option` (`MODULE_ID`,`NAME`,`SITE_ID`),
  KEY `ix_option_name` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_option`
--

LOCK TABLES `b_option` WRITE;
/*!40000 ALTER TABLE `b_option` DISABLE KEYS */;
INSERT INTO `b_option` VALUES ('main','rating_authority_rating','2',NULL,NULL),('main','rating_assign_rating_group_add','1',NULL,NULL),('main','rating_assign_rating_group_delete','1',NULL,NULL),('main','rating_assign_rating_group','3',NULL,NULL),('main','rating_assign_authority_group_add','2',NULL,NULL),('main','rating_assign_authority_group_delete','2',NULL,NULL),('main','rating_assign_authority_group','4',NULL,NULL),('main','rating_community_size','1',NULL,NULL),('main','rating_community_authority','30',NULL,NULL),('main','rating_vote_weight','10',NULL,NULL),('main','rating_normalization_type','auto',NULL,NULL),('main','rating_normalization','10',NULL,NULL),('main','rating_count_vote','10',NULL,NULL),('main','rating_authority_weight_formula','Y',NULL,NULL),('main','rating_community_last_visit','90',NULL,NULL),('main','rating_text_like_y','Нравится',NULL,NULL),('main','rating_text_like_n','Не нравится',NULL,NULL),('main','rating_text_like_d','Это нравится',NULL,NULL),('main','rating_assign_type','auto',NULL,NULL),('main','rating_vote_type','like',NULL,NULL),('main','rating_self_vote','Y',NULL,NULL),('main','rating_vote_show','Y',NULL,NULL),('main','rating_vote_template','like',NULL,NULL),('main','rating_start_authority','3',NULL,NULL),('main','PARAM_MAX_SITES','2',NULL,NULL),('main','PARAM_MAX_USERS','0',NULL,NULL),('main','distributive6','Y',NULL,NULL),('main','~new_license11_sign','Y',NULL,NULL),('main','GROUP_DEFAULT_TASK','1',NULL,NULL),('main','vendor','1c_bitrix',NULL,NULL),('main','admin_lid','ru',NULL,NULL),('main','update_site','www.bitrixsoft.com',NULL,NULL),('main','update_site_ns','Y',NULL,NULL),('main','optimize_css_files','Y',NULL,NULL),('main','optimize_js_files','Y',NULL,NULL),('main','admin_passwordh','FVgQeGYUBwYtCUVcABcPCgsTAQ==',NULL,NULL),('main','server_uniq_id','b68b2923035cc4c40cf164032738297f',NULL,NULL),('blog','socNetNewPerms','Y',NULL,NULL),('fileman','use_editor_3','Y',NULL,NULL),('forum','FILTER_DICT_W','1',NULL,'ru'),('forum','FILTER_DICT_T','2',NULL,'ru'),('forum','FILTER_DICT_W','3',NULL,'en'),('forum','FILTER_DICT_T','4',NULL,'en'),('forum','FILTER','N',NULL,NULL),('search','version','v2.0',NULL,NULL),('search','dbnode_id','N',NULL,NULL),('search','dbnode_status','ok',NULL,NULL),('security','ipcheck_disable_file','/bitrix/modules/ipcheck_disable_e4ee82cd4052bcf5803f28c2106acf3b',NULL,NULL),('security','redirect_sid','uzfkb6d8lss7qoyhwwakev62rncf58p4',NULL,NULL),('vote','VOTE_DIR','',NULL,NULL),('vote','VOTE_COMPATIBLE_OLD_TEMPLATE','N',NULL,NULL),('main','email_from','admin@gmail.com',NULL,NULL),('fileman','different_set','Y',NULL,NULL),('fileman','menutypes','a:3:{s:4:\\\"left\\\";s:19:\\\"Левое меню\\\";s:3:\\\"top\\\";s:23:\\\"Верхнее меню\\\";s:6:\\\"bottom\\\";s:21:\\\"Нижнее меню\\\";}',NULL,'s1'),('main','wizard_template_id','furniture',NULL,'s1'),('main','wizard_site_logo','0',NULL,'s1'),('main','wizard_furniture_theme_id','pale-blue',NULL,'s1'),('socialnetwork','allow_tooltip','N',NULL,NULL),('fileman','propstypes','a:4:{s:11:\"description\";s:33:\"Описание страницы\";s:8:\"keywords\";s:27:\"Ключевые слова\";s:5:\"title\";s:44:\"Заголовок окна браузера\";s:14:\"keywords_inner\";s:35:\"Продвигаемые слова\";}',NULL,'s1'),('search','suggest_save_days','250',NULL,NULL),('search','use_tf_cache','Y',NULL,NULL),('search','use_word_distance','Y',NULL,NULL),('search','use_social_rating','Y',NULL,NULL),('iblock','use_htmledit','Y',NULL,NULL),('socialservices','auth_services','a:18:{s:11:\"Bitrix24Net\";s:1:\"N\";s:3:\"Box\";s:1:\"N\";s:7:\"Dropbox\";s:1:\"N\";s:11:\"GoogleOAuth\";s:1:\"N\";s:15:\"GooglePlusOAuth\";s:1:\"N\";s:11:\"LiveIDOAuth\";s:1:\"N\";s:13:\"Odnoklassniki\";s:1:\"N\";s:9:\"Office365\";s:1:\"N\";s:11:\"YandexOAuth\";s:1:\"N\";s:9:\"VKontakte\";s:1:\"Y\";s:8:\"MyMailRu\";s:1:\"N\";s:7:\"Twitter\";s:1:\"N\";s:8:\"Facebook\";s:1:\"Y\";s:11:\"Livejournal\";s:1:\"Y\";s:12:\"MailRuOpenID\";s:1:\"Y\";s:12:\"Liveinternet\";s:1:\"Y\";s:7:\"Blogger\";s:1:\"Y\";s:6:\"OpenID\";s:1:\"Y\";}',NULL,NULL),('main','wizard_firstcorp_furniture_s1','Y',NULL,NULL),('main','wizard_solution','corp_furniture',NULL,'s1'),('fileman','stickers_use_hotkeys','N',NULL,NULL),('main','signer_default_key','c294e4244bbf4db3fa351a50d22c9e1ff3fd9efbbd6cb980d12d8e14adc28b0ddb37f39c8b729ddad67fbb0511065dc3448b305ebc47220277f804d6f381742b',NULL,NULL),('search','max_execution_time','20',NULL,NULL),('search','full_reindex_required','N',NULL,NULL),('socialservices','use_on_sites','a:1:{s:2:\"s1\";s:1:\"N\";}',NULL,NULL),('socialservices','twitter_search_hash','#b24',NULL,NULL),('socialservices','bitrix24net_id','',NULL,NULL),('socialservices','bitrix24net_secret','',NULL,NULL),('socialservices','box_appid','',NULL,NULL),('socialservices','box_appsecret','',NULL,NULL),('socialservices','dropbox_appid','',NULL,NULL),('socialservices','dropbox_appsecret','',NULL,NULL),('socialservices','google_appid','',NULL,NULL),('socialservices','google_appsecret','',NULL,NULL),('socialservices','liveid_appid','',NULL,NULL),('socialservices','liveid_appsecret','',NULL,NULL),('socialservices','odnoklassniki_appid','',NULL,NULL),('socialservices','odnoklassniki_appkey','',NULL,NULL),('socialservices','odnoklassniki_appsecret','',NULL,NULL),('socialservices','office365_appid','',NULL,NULL),('socialservices','office365_appsecret','',NULL,NULL),('socialservices','office365_tenant','',NULL,NULL),('socialservices','yandex_appid','',NULL,NULL),('socialservices','yandex_appsecret','',NULL,NULL),('socialservices','vkontakte_appid','6184016',NULL,NULL),('socialservices','vkontakte_appsecret','98Wvrktl9wdY5SR7ml2h',NULL,NULL),('socialservices','mailru_id','',NULL,NULL),('socialservices','mailru_private_key','',NULL,NULL),('socialservices','mailru_secret_key','',NULL,NULL),('socialservices','twitter_key','',NULL,NULL),('socialservices','twitter_secret','',NULL,NULL),('socialservices','facebook_appid','',NULL,NULL),('socialservices','facebook_appsecret','',NULL,NULL),('socialservices','auth_services_bx_site_s1','a:18:{s:11:\"Bitrix24Net\";s:1:\"N\";s:3:\"Box\";s:1:\"N\";s:7:\"Dropbox\";s:1:\"N\";s:11:\"GoogleOAuth\";s:1:\"N\";s:15:\"GooglePlusOAuth\";s:1:\"N\";s:11:\"LiveIDOAuth\";s:1:\"N\";s:13:\"Odnoklassniki\";s:1:\"N\";s:9:\"Office365\";s:1:\"N\";s:11:\"YandexOAuth\";s:1:\"N\";s:9:\"VKontakte\";s:1:\"N\";s:8:\"MyMailRu\";s:1:\"N\";s:7:\"Twitter\";s:1:\"N\";s:8:\"Facebook\";s:1:\"N\";s:11:\"Livejournal\";s:1:\"Y\";s:12:\"MailRuOpenID\";s:1:\"Y\";s:12:\"Liveinternet\";s:1:\"Y\";s:7:\"Blogger\";s:1:\"Y\";s:6:\"OpenID\";s:1:\"Y\";}',NULL,NULL),('socialservices','twitter_search_hash_bx_site_s1','',NULL,NULL),('socialservices','bitrix24net_id_bx_site_s1','',NULL,NULL),('socialservices','bitrix24net_secret_bx_site_s1','',NULL,NULL),('socialservices','box_appid_bx_site_s1','',NULL,NULL),('socialservices','box_appsecret_bx_site_s1','',NULL,NULL),('socialservices','dropbox_appid_bx_site_s1','',NULL,NULL),('socialservices','dropbox_appsecret_bx_site_s1','',NULL,NULL),('socialservices','google_appid_bx_site_s1','',NULL,NULL),('socialservices','google_appsecret_bx_site_s1','',NULL,NULL),('socialservices','liveid_appid_bx_site_s1','',NULL,NULL),('socialservices','liveid_appsecret_bx_site_s1','',NULL,NULL),('socialservices','odnoklassniki_appid_bx_site_s1','',NULL,NULL),('socialservices','odnoklassniki_appkey_bx_site_s1','',NULL,NULL),('socialservices','odnoklassniki_appsecret_bx_site_s1','',NULL,NULL),('socialservices','office365_appid_bx_site_s1','',NULL,NULL),('socialservices','office365_appsecret_bx_site_s1','',NULL,NULL),('socialservices','office365_tenant_bx_site_s1','',NULL,NULL),('socialservices','yandex_appid_bx_site_s1','',NULL,NULL),('socialservices','yandex_appsecret_bx_site_s1','',NULL,NULL),('socialservices','vkontakte_appid_bx_site_s1','',NULL,NULL),('socialservices','vkontakte_appsecret_bx_site_s1','',NULL,NULL),('socialservices','mailru_id_bx_site_s1','',NULL,NULL),('socialservices','mailru_private_key_bx_site_s1','',NULL,NULL),('socialservices','mailru_secret_key_bx_site_s1','',NULL,NULL),('socialservices','twitter_key_bx_site_s1','',NULL,NULL),('socialservices','twitter_secret_bx_site_s1','',NULL,NULL),('socialservices','facebook_appid_bx_site_s1','',NULL,NULL),('socialservices','facebook_appsecret_bx_site_s1','',NULL,NULL),('socialservices','get_message_from_twitter','Y',NULL,NULL),('socialservices','allow_send_user_activity','N',NULL,NULL),('socialservices','group_deny_auth','',NULL,NULL),('socialservices','group_deny_split','',NULL,NULL),('socialservices','allow_registration','Y',NULL,NULL);
/*!40000 ALTER TABLE `b_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_cache`
--

DROP TABLE IF EXISTS `b_perf_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_cache` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_SIZE` float DEFAULT NULL,
  `OP_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `BASE_DIR` text COLLATE utf8_unicode_ci,
  `INIT_DIR` text COLLATE utf8_unicode_ci,
  `FILE_NAME` text COLLATE utf8_unicode_ci,
  `FILE_PATH` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_CACHE_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_CACHE_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_cache`
--

LOCK TABLES `b_perf_cache` WRITE;
/*!40000 ALTER TABLE `b_perf_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_cluster`
--

DROP TABLE IF EXISTS `b_perf_cluster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_cluster` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `THREADS` int(11) DEFAULT NULL,
  `HITS` int(11) DEFAULT NULL,
  `ERRORS` int(11) DEFAULT NULL,
  `PAGES_PER_SECOND` float DEFAULT NULL,
  `PAGE_EXEC_TIME` float DEFAULT NULL,
  `PAGE_RESP_TIME` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_cluster`
--

LOCK TABLES `b_perf_cluster` WRITE;
/*!40000 ALTER TABLE `b_perf_cluster` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_cluster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_component`
--

DROP TABLE IF EXISTS `b_perf_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_component` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `COMPONENT_TIME` float DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_COMPONENT_0` (`HIT_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_component`
--

LOCK TABLES `b_perf_component` WRITE;
/*!40000 ALTER TABLE `b_perf_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_error`
--

DROP TABLE IF EXISTS `b_perf_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_error` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `ERRNO` int(18) DEFAULT NULL,
  `ERRSTR` text COLLATE utf8_unicode_ci,
  `ERRFILE` text COLLATE utf8_unicode_ci,
  `ERRLINE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_ERROR_0` (`HIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_error`
--

LOCK TABLES `b_perf_error` WRITE;
/*!40000 ALTER TABLE `b_perf_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_history`
--

DROP TABLE IF EXISTS `b_perf_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_history` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TOTAL_MARK` float DEFAULT NULL,
  `ACCELERATOR_ENABLED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_history`
--

LOCK TABLES `b_perf_history` WRITE;
/*!40000 ALTER TABLE `b_perf_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_hit`
--

DROP TABLE IF EXISTS `b_perf_hit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_hit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_HIT` datetime DEFAULT NULL,
  `IS_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_PORT` int(11) DEFAULT NULL,
  `SCRIPT_NAME` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `INCLUDED_FILES` int(11) DEFAULT NULL,
  `MEMORY_PEAK_USAGE` int(11) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENTS` int(11) DEFAULT NULL,
  `COMPONENTS_TIME` float DEFAULT NULL,
  `SQL_LOG` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_TIME` float DEFAULT NULL,
  `PROLOG_TIME` float DEFAULT NULL,
  `PROLOG_BEFORE_TIME` float DEFAULT NULL,
  `AGENTS_TIME` float DEFAULT NULL,
  `PROLOG_AFTER_TIME` float DEFAULT NULL,
  `WORK_AREA_TIME` float DEFAULT NULL,
  `EPILOG_TIME` float DEFAULT NULL,
  `EPILOG_BEFORE_TIME` float DEFAULT NULL,
  `EVENTS_TIME` float DEFAULT NULL,
  `EPILOG_AFTER_TIME` float DEFAULT NULL,
  `MENU_RECALC` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_HIT_0` (`DATE_HIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_hit`
--

LOCK TABLES `b_perf_hit` WRITE;
/*!40000 ALTER TABLE `b_perf_hit` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_hit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_index_ban`
--

DROP TABLE IF EXISTS `b_perf_index_ban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_index_ban` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BAN_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_index_ban`
--

LOCK TABLES `b_perf_index_ban` WRITE;
/*!40000 ALTER TABLE `b_perf_index_ban` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_ban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_index_complete`
--

DROP TABLE IF EXISTS `b_perf_index_complete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_index_complete` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BANNED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_complete_0` (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_index_complete`
--

LOCK TABLES `b_perf_index_complete` WRITE;
/*!40000 ALTER TABLE `b_perf_index_complete` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_complete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_index_suggest`
--

DROP TABLE IF EXISTS `b_perf_index_suggest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_index_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SQL_MD5` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_COUNT` int(11) DEFAULT NULL,
  `SQL_TIME` float DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ALIAS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  `SQL_EXPLAIN` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_suggest_0` (`SQL_MD5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_index_suggest`
--

LOCK TABLES `b_perf_index_suggest` WRITE;
/*!40000 ALTER TABLE `b_perf_index_suggest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_suggest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_index_suggest_sql`
--

DROP TABLE IF EXISTS `b_perf_index_suggest_sql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_index_suggest_sql` (
  `SUGGEST_ID` int(11) NOT NULL,
  `SQL_ID` int(11) NOT NULL,
  PRIMARY KEY (`SUGGEST_ID`,`SQL_ID`),
  KEY `ix_b_perf_index_suggest_sql_0` (`SQL_ID`,`SUGGEST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_index_suggest_sql`
--

LOCK TABLES `b_perf_index_suggest_sql` WRITE;
/*!40000 ALTER TABLE `b_perf_index_suggest_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_suggest_sql` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_sql`
--

DROP TABLE IF EXISTS `b_perf_sql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_sql` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `QUERY_TIME` float DEFAULT NULL,
  `NODE_ID` int(18) DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_SQL_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_SQL_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_sql`
--

LOCK TABLES `b_perf_sql` WRITE;
/*!40000 ALTER TABLE `b_perf_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_sql` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_sql_backtrace`
--

DROP TABLE IF EXISTS `b_perf_sql_backtrace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_sql_backtrace` (
  `SQL_ID` int(18) NOT NULL,
  `NN` int(18) NOT NULL,
  `FILE_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINE_NO` int(18) DEFAULT NULL,
  `CLASS_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FUNCTION_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SQL_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_sql_backtrace`
--

LOCK TABLES `b_perf_sql_backtrace` WRITE;
/*!40000 ALTER TABLE `b_perf_sql_backtrace` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_sql_backtrace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_tab_column_stat`
--

DROP TABLE IF EXISTS `b_perf_tab_column_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_tab_column_stat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  `COLUMN_ROWS` float DEFAULT NULL,
  `VALUE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_tab_column_stat` (`TABLE_NAME`,`COLUMN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_tab_column_stat`
--

LOCK TABLES `b_perf_tab_column_stat` WRITE;
/*!40000 ALTER TABLE `b_perf_tab_column_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_tab_column_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_tab_stat`
--

DROP TABLE IF EXISTS `b_perf_tab_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_tab_stat` (
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_SIZE` float DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_tab_stat`
--

LOCK TABLES `b_perf_tab_stat` WRITE;
/*!40000 ALTER TABLE `b_perf_tab_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_tab_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_test`
--

DROP TABLE IF EXISTS `b_perf_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_test` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `REFERENCE_ID` int(18) DEFAULT NULL,
  `NAME` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_TEST_0` (`REFERENCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_test`
--

LOCK TABLES `b_perf_test` WRITE;
/*!40000 ALTER TABLE `b_perf_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_posting`
--

DROP TABLE IF EXISTS `b_posting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_posting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `VERSION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_SENT` datetime DEFAULT NULL,
  `SENT_BCC` mediumtext COLLATE utf8_unicode_ci,
  `FROM_FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BCC_FIELD` mediumtext COLLATE utf8_unicode_ci,
  `EMAIL_FILTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BODY` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `DIRECT_SEND` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CHARSET` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MSG_CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBSCR_FORMAT` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_EMAIL` mediumtext COLLATE utf8_unicode_ci,
  `AUTO_SEND_TIME` datetime DEFAULT NULL,
  `BCC_TO_SEND` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_posting`
--

LOCK TABLES `b_posting` WRITE;
/*!40000 ALTER TABLE `b_posting` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_posting_email`
--

DROP TABLE IF EXISTS `b_posting_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_posting_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POSTING_ID` int(11) NOT NULL,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SUBSCRIPTION_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_posting_email_status` (`POSTING_ID`,`STATUS`),
  KEY `ix_posting_email_email` (`POSTING_ID`,`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_posting_email`
--

LOCK TABLES `b_posting_email` WRITE;
/*!40000 ALTER TABLE `b_posting_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_posting_file`
--

DROP TABLE IF EXISTS `b_posting_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_posting_file` (
  `POSTING_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_FILE` (`POSTING_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_posting_file`
--

LOCK TABLES `b_posting_file` WRITE;
/*!40000 ALTER TABLE `b_posting_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_posting_group`
--

DROP TABLE IF EXISTS `b_posting_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_posting_group` (
  `POSTING_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_GROUP` (`POSTING_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_posting_group`
--

LOCK TABLES `b_posting_group` WRITE;
/*!40000 ALTER TABLE `b_posting_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_posting_rubric`
--

DROP TABLE IF EXISTS `b_posting_rubric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_posting_rubric` (
  `POSTING_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_RUBRIC` (`POSTING_ID`,`LIST_RUBRIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_posting_rubric`
--

LOCK TABLES `b_posting_rubric` WRITE;
/*!40000 ALTER TABLE `b_posting_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_rubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating`
--

DROP TABLE IF EXISTS `b_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALCULATION_METHOD` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `POSITION` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTHORITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `CALCULATED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONFIGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating`
--

LOCK TABLES `b_rating` WRITE;
/*!40000 ALTER TABLE `b_rating` DISABLE KEYS */;
INSERT INTO `b_rating` VALUES (1,'N','Рейтинг','USER','SUM','2017-09-08 14:54:30',NULL,NULL,'Y','N','N','a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:16:\"TODAY_TOPIC_COEF\";s:3:\"0.4\";s:15:\"WEEK_TOPIC_COEF\";s:3:\"0.2\";s:16:\"MONTH_TOPIC_COEF\";s:3:\"0.1\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.2\";s:14:\"WEEK_POST_COEF\";s:3:\"0.1\";s:15:\"MONTH_POST_COEF\";s:4:\"0.05\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}'),(2,'N','Авторитет','USER','SUM','2017-09-08 14:54:30',NULL,NULL,'Y','Y','N','a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:1:\"0\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:16:\"TODAY_TOPIC_COEF\";s:2:\"20\";s:15:\"WEEK_TOPIC_COEF\";s:2:\"10\";s:16:\"MONTH_TOPIC_COEF\";s:1:\"5\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}');
/*!40000 ALTER TABLE `b_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_component`
--

DROP TABLE IF EXISTS `b_rating_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_component` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CALC_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXCEPTION_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int(11) NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_component`
--

LOCK TABLES `b_rating_component` WRITE;
/*!40000 ALTER TABLE `b_rating_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_component_results`
--

DROP TABLE IF EXISTS `b_rating_component_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_component_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_component_results`
--

LOCK TABLES `b_rating_component_results` WRITE;
/*!40000 ALTER TABLE `b_rating_component_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_component_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_prepare`
--

DROP TABLE IF EXISTS `b_rating_prepare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_prepare` (
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_prepare`
--

LOCK TABLES `b_rating_prepare` WRITE;
/*!40000 ALTER TABLE `b_rating_prepare` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_prepare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_results`
--

DROP TABLE IF EXISTS `b_rating_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  `PREVIOUS_VALUE` decimal(18,4) DEFAULT NULL,
  `CURRENT_POSITION` int(11) DEFAULT '0',
  `PREVIOUS_POSITION` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_results`
--

LOCK TABLES `b_rating_results` WRITE;
/*!40000 ALTER TABLE `b_rating_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_rule`
--

DROP TABLE IF EXISTS `b_rating_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_rule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_MODULE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONDITION_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_APPLIED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_rule`
--

LOCK TABLES `b_rating_rule` WRITE;
/*!40000 ALTER TABLE `b_rating_rule` DISABLE KEYS */;
INSERT INTO `b_rating_rule` VALUES (1,'N','Добавление в группу пользователей, имеющих право голосовать за рейтинг','USER','AUTHORITY',NULL,'CRatingRulesMain','ratingCheck','a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:1;}}','ADD_TO_GROUP','a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}','N','CRatingRulesMain','addToGroup','N','CRatingRulesMain ','addToGroup','2017-09-08 14:54:30','2017-09-08 14:54:30',NULL),(2,'N','Удаление из группы пользователей, не имеющих права голосовать за рейтинг','USER','AUTHORITY',NULL,'CRatingRulesMain','ratingCheck','a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:1;}}','REMOVE_FROM_GROUP','a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}','N','CRatingRulesMain','removeFromGroup','N','CRatingRulesMain ','removeFromGroup','2017-09-08 14:54:30','2017-09-08 14:54:30',NULL),(3,'N','Добавление в группу пользователей, имеющих право голосовать за авторитет','USER','AUTHORITY',NULL,'CRatingRulesMain','ratingCheck','a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:2;}}','ADD_TO_GROUP','a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}','N','CRatingRulesMain','addToGroup','N','CRatingRulesMain ','addToGroup','2017-09-08 14:54:30','2017-09-08 14:54:30',NULL),(4,'N','Удаление из группы пользователей, не имеющих права голосовать за авторитет','USER','AUTHORITY',NULL,'CRatingRulesMain','ratingCheck','a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:2;}}','REMOVE_FROM_GROUP','a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}','N','CRatingRulesMain','removeFromGroup','N','CRatingRulesMain ','removeFromGroup','2017-09-08 14:54:30','2017-09-08 14:54:30',NULL),(5,'Y','Автоматическое голосование за авторитет пользователя','USER','VOTE',NULL,'CRatingRulesMain','voteCheck','a:1:{s:4:\"VOTE\";a:6:{s:10:\"VOTE_LIMIT\";i:90;s:11:\"VOTE_RESULT\";i:10;s:16:\"VOTE_FORUM_TOPIC\";d:0.5;s:15:\"VOTE_FORUM_POST\";d:0.10000000000000001;s:14:\"VOTE_BLOG_POST\";d:0.5;s:17:\"VOTE_BLOG_COMMENT\";d:0.10000000000000001;}}','empty','a:0:{}','N','empty','empty','N','empty ','empty','2017-09-08 14:54:31','2017-09-08 14:54:31',NULL);
/*!40000 ALTER TABLE `b_rating_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_rule_vetting`
--

DROP TABLE IF EXISTS `b_rating_rule_vetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_rule_vetting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `RULE_ID` (`RULE_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_rule_vetting`
--

LOCK TABLES `b_rating_rule_vetting` WRITE;
/*!40000 ALTER TABLE `b_rating_rule_vetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_rule_vetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_user`
--

DROP TABLE IF EXISTS `b_rating_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `BONUS` decimal(18,4) DEFAULT '0.0000',
  `VOTE_WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `VOTE_COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`RATING_ID`,`ENTITY_ID`),
  KEY `IX_B_RAT_USER_2` (`ENTITY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_user`
--

LOCK TABLES `b_rating_user` WRITE;
/*!40000 ALTER TABLE `b_rating_user` DISABLE KEYS */;
INSERT INTO `b_rating_user` VALUES (1,2,1,3.0000,30.0000,13);
/*!40000 ALTER TABLE `b_rating_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_vote`
--

DROP TABLE IF EXISTS `b_rating_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_vote` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_IP` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RAT_VOTE_ID` (`RATING_VOTING_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_3` (`OWNER_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_4` (`USER_ID`),
  KEY `IX_RAT_VOTE_ID_5` (`CREATED`,`VALUE`),
  KEY `IX_RAT_VOTE_ID_6` (`ACTIVE`),
  KEY `IX_RAT_VOTE_ID_7` (`RATING_VOTING_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_8` (`ENTITY_TYPE_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_9` (`CREATED`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_vote`
--

LOCK TABLES `b_rating_vote` WRITE;
/*!40000 ALTER TABLE `b_rating_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_vote_group`
--

DROP TABLE IF EXISTS `b_rating_vote_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_vote_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`GROUP_ID`,`TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_vote_group`
--

LOCK TABLES `b_rating_vote_group` WRITE;
/*!40000 ALTER TABLE `b_rating_vote_group` DISABLE KEYS */;
INSERT INTO `b_rating_vote_group` VALUES (5,1,'A'),(1,1,'R'),(3,1,'R'),(2,3,'R'),(4,3,'R'),(6,4,'A');
/*!40000 ALTER TABLE `b_rating_vote_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_voting`
--

DROP TABLE IF EXISTS `b_rating_voting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_voting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`),
  KEY `IX_ENTITY_TYPE_ID_4` (`TOTAL_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_voting`
--

LOCK TABLES `b_rating_voting` WRITE;
/*!40000 ALTER TABLE `b_rating_voting` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_voting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_voting_prepare`
--

DROP TABLE IF EXISTS `b_rating_voting_prepare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_voting_prepare` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_VOTING_ID` (`RATING_VOTING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_voting_prepare`
--

LOCK TABLES `b_rating_voting_prepare` WRITE;
/*!40000 ALTER TABLE `b_rating_voting_prepare` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_voting_prepare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_weight`
--

DROP TABLE IF EXISTS `b_rating_weight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_weight` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_FROM` decimal(18,4) NOT NULL,
  `RATING_TO` decimal(18,4) NOT NULL,
  `WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_weight`
--

LOCK TABLES `b_rating_weight` WRITE;
/*!40000 ALTER TABLE `b_rating_weight` DISABLE KEYS */;
INSERT INTO `b_rating_weight` VALUES (1,-1000000.0000,1000000.0000,1.0000,10);
/*!40000 ALTER TABLE `b_rating_weight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content`
--

DROP TABLE IF EXISTS `b_search_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CHANGE` datetime NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CUSTOM_RANK` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) DEFAULT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENTITY_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `TITLE` text COLLATE utf8_unicode_ci,
  `BODY` longtext COLLATE utf8_unicode_ci,
  `TAGS` text COLLATE utf8_unicode_ci,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `UPD` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_FROM` datetime DEFAULT NULL,
  `DATE_TO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_CONTENT` (`MODULE_ID`,`ITEM_ID`),
  KEY `IX_B_SEARCH_CONTENT_1` (`MODULE_ID`,`PARAM1`(50),`PARAM2`(50)),
  KEY `IX_B_SEARCH_CONTENT_2` (`ENTITY_ID`(50),`ENTITY_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content`
--

LOCK TABLES `b_search_content` WRITE;
/*!40000 ALTER TABLE `b_search_content` DISABLE KEYS */;
INSERT INTO `b_search_content` VALUES (1,'2017-09-08 15:02:32','main','s1|/services/index.php',0,NULL,NULL,NULL,'/services/index.php','Услуги','','','','',NULL,NULL,NULL),(2,'2017-09-08 15:01:53','main','s1|/products/index.php',0,NULL,NULL,NULL,'/products/index.php','Продукция','','','','',NULL,NULL,NULL),(3,'2017-09-11 10:48:11','main','s1|/timetable/archive.php',0,NULL,NULL,NULL,'/timetable/archive.php','Архив','Text here....','','','',NULL,NULL,NULL),(4,'2017-09-11 10:49:19','main','s1|/timetable/announce.php',0,NULL,NULL,NULL,'/timetable/announce.php','Анонсы','Text here....','','','',NULL,NULL,NULL),(5,'2017-09-11 10:48:11','main','s1|/timetable/index.php',0,NULL,NULL,NULL,'/timetable/index.php','Расписание мероприятий','','','','',NULL,NULL,NULL),(6,'2017-09-11 15:07:51','main','s1|/index.php',0,NULL,NULL,NULL,'/index.php','Мебельная компания','','','','',NULL,NULL,NULL),(7,'2017-09-08 14:58:05','main','s1|/news/index.php',0,NULL,NULL,NULL,'/news/index.php','Новости','','','','',NULL,NULL,NULL),(8,'2017-05-17 16:06:11','main','s1|/materials/Ex1DemoMaterials/html/reviews-detail.html',0,NULL,NULL,NULL,'/materials/Ex1DemoMaterials/html/reviews-detail.html','-','8 (495) 212-85-06\r9-00 18-00\r1\r1\r2\r2\r3\r4\r1\r1\r2\r2\r3\r4\r- - CTC-\r, , , .\n, , , .\n, , , .\n, 12 2020 ., , CTC-.\n:\r1\r2\r3\r&larr; \r!\r-.\r!\r560 \ra\r,\"+\"\r, , ...\r,\"+\"\r, , ...\r. , .12, 512\r8 (495) 212-85-06\r2000-2012 \" \"','','','',NULL,NULL,NULL),(9,'2017-05-17 16:06:11','main','s1|/materials/Ex1DemoMaterials/html/reviews-list.html',0,NULL,NULL,NULL,'/materials/Ex1DemoMaterials/html/reviews-list.html','-','8 (495) 212-85-06\r9-00 18-00\r1\r1\r2\r2\r3\r4\r1\r1\r2\r2\r3\r4\r12 2020 ., , CTC-\r, , , .\n12 2020 ., , RK-Telecom\r, , , .\n12 2020 ., , .NET-dev\r, -. , - , . , \n!\r-.\r!\r560 \ra\r,\"+\"\r, , ...\r,\"+\"\r, , ...\r. , .12, 512\r8 (495) 212-85-06\r2000-2012 \" \"','','','',NULL,NULL,NULL),(10,'2017-09-08 14:57:40','main','s1|/search/map.php',0,NULL,NULL,NULL,'/search/map.php','Карта сайта','','','','',NULL,NULL,NULL),(11,'2017-09-13 15:12:22','main','s1|/search/index.php',0,NULL,NULL,NULL,'/search/index.php','Поиск','','','','',NULL,NULL,NULL),(12,'2017-09-08 14:57:40','main','s1|/company/mission.php',0,NULL,NULL,NULL,'/company/mission.php','Миссия и стратегия','&laquo;Мебельная компания&raquo;\r- динамично развивающееся производственное 							предприятие, которое имеет перед собой \nясно выраженные цели и инструменты для 							их достижени.Мы предоставляем каждому лучшую возможность обустроить свое жизненное \nи рабочее пространство.Мы работаем на долгосрочную перспективу и предлагаем оптимальные 							решения. Компания \r&laquo;Мебельная компания&raquo;\r- \nнадежный, технологичный, гибкий поставщик 							с большими мощностями. 						\rЦели и задачи\rОправдывать ожидания заказчика: &ldquo;Клиент всегда прав&rdquo;. Только Потребитель формирует 									единую систему взглядов на качество \nвыпускаемой продукции и работ.\rДобиться от работников компании понимания их личной ответственности за качество 									работ.\rПутем повышения качества продукции и работ постоянно увеличивать объемы производства 									с целью последующего реинвестирования \nприбыли в развитие компании.\rОбеспечивать строгое соответствие производимой продукции требованиям потребителей, 									нормам и правилам \nбезопасности, требованиям защиты окружающей среды.\rПолитика компании\rПостоянное совершенствование системы качества. Своевременное и эффективное принятие 									корректирующих мер .\rЗабота о работниках компании. Создание условий труда и оснащение рабочих мест, соответствующих 									всем санитарным \nи гигиеническим нормам.\rПовышение благосостояния сотрудников. Обеспечение морального и материального удовлетворения 									работников компании.\rСистематическое обучение работников всех уровней с целью постоянного повышения их 									профессионального мастерства.\rВнедрение высокопроизводительного оборудования и новейших технологий для повышения 									производительности труда, \nоптимизации затрат и, как результат, снижения цен 									на выпускаемую продукцию.\rСоздание новых рабочих мест. Привлечение на работу специалистов высокой квалификации.\rВыход на международный рынок.\rМы развиваем доверительные взаимовыгодные отношения со своими партнерами в долгосрочных 							интересах нашего бизнеса. \n&laquo;Мебельная компания&raquo;\rответственно относится 							к выполнению взятых на себя обязательств и ждет такого же \nподхода к делу от 							своих партнеров по бизнесу. Эта требовательность &ndash; залог нашей долгосрочной прибыльности. 						\rСо дня своего основания \r&laquo;Мебельная компания&raquo;\rсодействует росту благосостояния 							регионов России. Мы понимаем важность \nсоциальной ответственности нашей Компании 							и останемся примером в вопросах социальной защищенности наших сотрудников.','','','',NULL,NULL,NULL),(13,'2017-09-08 14:57:40','main','s1|/company/history.php',0,NULL,NULL,NULL,'/company/history.php','История','1992г. 								\r&laquo;Мебельная компания&raquo;\rначиналась с изготовления мебели для школ и офисов. Первое 									производство мебели располагалось в арендуемой мастерской, площадью 400 м2 с одним 									деревообрабатывающим станком. В компании работало двадцать человек. Все заработанные 									средства вкладывались в развитие, что позволило молодой Компании расти быстрыми 									темпами. 								\r1993г. 								\rВведен в эксплуатацию новый цех площадью 700 м2, ставший первой собственностью 									\r&laquo;Мебельной компании&raquo;\r. Модернизация производственной базы предприятия стала хорошей 									традицией. Компания постепенно перешла к более совершенному оборудованию, что позволило 									повысить уровень качества выпускаемой продукции и значительно увеличить объемы производства. 								\r1998г. 								\rВ Воронеже открыт первый фирменный магазин-салон \r&laquo;Мебельная компания&raquo;\r. Шаг за шагом 									продукция предприятия завоевывала регионы Сибири и Урала, Москвы и Подмосковья, 									Юга и Северо-Запада России. Производственные площади компании увеличены до 5000 									м2. 								\r1999г. 								\r&laquo;Мебельная компания&raquo;\rстала дипломантом одной из самых престижных международных 									выставок \r&laquo;ЕвроЭкспоМебель-99&raquo;\r- первое официальное признание мебельной продукции 									&laquo;Мебельной компании&raquo;. В этом же году компания выходит на мировой рынок. Был заключен 									ряд контрактов на поставку мебели в страны СНГ и Ближнего Зарубежья. 								\r2000г. 								\rКоллектив компании насчитывает более 500 сотрудников. Заключаются новые контракт 									на поставку мебели в европейские страны. 								\r2002г. 								\r&laquo;Мебельная компания&raquo;\rвошла в десятку лучших производителей мебели по данным ведущих 									мебельных салонов России, а также в число лидеров организационного развития. 								\r2003г. 								\rПриступили к строительству склада материалов. В Москве открыт филиал компании. \nПроведена первая конференция партнеров, результатом которой стало укрепление взаимовыгодных 									отношений и заключение дилерских договоров. 								\r2004г. 								\rЗавершено строительство и оснащение нового производственного корпуса и склада материалов. \nРасширено представительство компании на российском рынке и за рубежом. \nОткрыто 									региональное представительство \r&laquo;Мебельной компании&raquo;\rв Екатеринбурге. 								\r2005г. 								\rКомпания приобретает новое производственное оборудование концерна - угловую линию 									раскроя материалов и линию загрузки выгрузки. \nНачинается выпуск продукции в 									натуральном шпоне. Формируется отдельный склад материалов и комплектующих. \nВ этом же году открывается Фабрика мягкой мебели \r&laquo;МебельПлюс&raquo;\r2006г. 								\rОткрыты региональные представительства \r&laquo;Мебельной компании&raquo;\rв Санкт-Петербурге 									и Нижнем Новгороде. \nРазвивается собственная розничная сеть фирменных магазинов-салонов 									на территории России. 								\r2007г. 								\rЗавершено строительство второй фабрики. Общая площадь производсвенно-складских корпусов 									Компании составляет уже более 30000 м2. \nПроведена вторая конференция партнеров 									компании \r\"Технология успешного бизнеса\"\r. 								\r2008г. 								\rОткрыто новое предприятие для производства мебели по индивидуальным проектам \r&laquo;Комфорт&raquo;\r. \n&laquo;Мебельная компания&raquo;\rпродолжает обновление оборудования. 								\r2008г. 								\rНовейшим оборудованием укомплектована вторая фабрика. Запущена вторая производственная 									линия. \nПроведена третья конференция \r&laquo;Партнерство - бизнес сегодня&raquo;\rПринято решение о строительстве третьей фабрики. Площадь производственно &mdash; складских 									корпусов составит более 70000м2. \nПо всей стране и зарубежом открыто 37 мебельных 									салонов. \nВ Компании работает более полутора тысяч сотрудников.','','','',NULL,NULL,NULL),(14,'2017-09-08 15:03:19','main','s1|/company/vacancies.php',0,NULL,NULL,NULL,'/company/vacancies.php','Вакансии','','','','',NULL,NULL,NULL),(15,'2017-09-08 14:57:40','main','s1|/company/index.php',0,NULL,NULL,NULL,'/company/index.php','О компании','Наша компания существует на Российском рынке с 1992 года. За это время \r&laquo;Мебельная компания&raquo;\rпрошла большой путь от маленькой торговой фирмы до одного из крупнейших производителей корпусной мебели в России. 						 \rГлавное правило - индивидуальный подход к каждому клиенту\rНа сегодняшний день нами разработано более пятисот моделей для офиса и дома. Вместе с тем мы стремимся обеспечить неповторимость своей продукции. Мы изготовим мебель для кухни, детской, гостиной, спальной или ванной комнаты, мебель для офиса особого дизайна и нестандартного размера. \rНаши дизайнеры произведут замеры помещения и вместе с вами разработают дизайн-проект мебели для вашего интерьера, подобрав с высокой точностью размеры, модели, цвета, помогут оптимально расположить мебель. \rВаш проект будет создан с учетом всех нюансов и прорисовкой мельчайших деталей. Результаты совместного творчества вы сможете посмотреть в объемном представлении. Вам наглядно продемонстрируют, как будут выглядеть в жизни выбранные элементы интерьера при разном освещении, в конкретном помещении, сделанные из определенных материалов. В ваше распоряжение будет предоставлено много различных вариантов, из которых Вы сможете выбрать наиболее подходящий именно Вам. 						 					\rЗаказ будет выполнен и доставлен точно в срок. Все работы по сборке и установке мебели осуществляют сотрудники нашей компании. Строгий контроль качества осуществляется на всех этапах работ: от момента оформления заказа до момента приема выполненных работ. \rПередовые технологии и бесценный опыт\rИспользование передовых компьютерных технологий, многолетний опыт наших специалистов позволяют произвести грамотные расчеты и снизить расход материалов и себестоимость продукции, избежать ошибок при проектировании и оптимизировать дизайн комплексных интерьеров. Гарантия на нашу продукцию составляет 18 месяцев, а на отдельную продукцию 36 месяцев. \rМы гордимся нашими сотрудниками прошедшими профессиональное обучение в лучших учебных заведениях России и зарубежья. У нас трудятся высококлассные специалисты разных возрастов. Мы ценим энтузиазм молодежи и бесценный опыт старшего поколения. Все мы разные, но нас объединяет преданность своему делу и вера в идеи нашей компании. \rВысочайшие стандарты качества - залог нашего успеха\r&laquo;Мебельная компания&raquo;\rосуществляет производство мебели на высококлассном оборудовании с применением минимальной доли ручного труда, что позволяет обеспечить высокое качество нашей продукции. Налажен производственный процесс как массового и индивидуального характера, что с одной стороны позволяет обеспечить постоянную номенклатуру изделий и индивидуальный подход &ndash; с другой. \rЕжегодно наша продукция проходит сертификационные испытания в специализированных лабораториях России и имеет сертификаты соответствия продукции нормам безопасности и качества. Кроме того, \r&laquo;Мебельная компания&raquo;\rодной из первых среди мебельных производителей России в 2003 году прошла аудит на соответствие требованиям системы менеджмента качества &laquo;ИСО 9000&raquo; и получила сертификат соответствия системы качества на предприятии нормам международного стандарта.','','','',NULL,NULL,NULL),(16,'2017-09-08 14:57:40','main','s1|/company/management.php',0,NULL,NULL,NULL,'/company/management.php','Руководство','Успешное развитие бизнеса &ndash; во многом результат квалифицированной работы руководства. 							\r&laquo;Мебельная компания&raquo;\rна мебельном рынке уже 18 лет. За это время Компания 							не только сохранила, но и упрочила лидирующие позиции среди ведущих игроков мебельного 							рынка. 						\r&laquo;Мебельная компания&raquo;\rиз года в год расширяет ассортимент выпускаемой продукции, 							наращивает темпы и объемы производства, увеличивает производственные и складские 							площади, развивает отношения с партнерами со всех регионов страны и налаживает связи 							с зарубежными партнерами. В большой степени это заслуга хорошо подготовленного руководящего 							состава и его грамотной политики. 						\rСобственник Компании &laquo;Мебельная компания&raquo;\rКолесников Виктор Федорович 								\rРодился 3 сентября 1964 года.\nОбразование: закончил авиационный факультет Воронежского 									государственного политехнического института. В 1994 году прошел обучение по программе 									&laquo;Подготовка малого и среднего бизнеса&raquo; в США.\nВ настоящее время Виктор Федорович 									возглавляет Управляющую компанию, которая координирует деятельность предприятий, 									входящих в Группу Компаний \r&laquo;Мебельная компания&raquo;\r. 								\rГенеральный директор &laquo;Мебельной компании&raquo;\rРатченко Александр Петрович 								\rРодился 5 июня 1962 года.\nОбразование: Воронежский политехнический институт 									по специальности инженер-технолог; программа &laquo;Эффективное развитие производства&raquo; 									(США).\nВ \r&laquo;Мебельной компании&raquo;\rСергей Фомич с 1994 года. За это время прошел 									путь от начальника цеха до генерального директора предприятия. 								\rЗаместитель генерального директора Управляющей компании\rРоговой Андрей Владимирович 								\rОбразование: факультет радиотехники Воронежского государственного технического университета.\nВ Компании с 1 июня 2000 года.','','','',NULL,NULL,NULL),(17,'2017-09-13 15:09:17','main','s1|/rew/index.php',0,NULL,NULL,NULL,'/rew/index.php','Отзывы','','','','',NULL,NULL,NULL),(18,'2017-09-12 11:39:34','main','s1|/partners/index.php',0,NULL,NULL,NULL,'/partners/index.php','Условия сотрудничества','','','','',NULL,NULL,NULL),(19,'2017-09-13 16:26:20','main','s1|/partners/become-partner.php',0,NULL,NULL,NULL,'/partners/become-partner.php','Как стать партнером','','','','',NULL,NULL,NULL),(20,'2017-09-13 16:13:42','main','s1|/login/index.php',0,NULL,NULL,NULL,'/login/index.php','Вход на сайт','Вы зарегистрированы и успешно авторизовались.\nВернуться на главную страницу','','','',NULL,NULL,NULL),(21,'2017-09-08 14:57:40','main','s1|/contacts/index.php',0,NULL,NULL,NULL,'/contacts/index.php','Контакты','Обратитесь к нашим специалистам и получите профессиональную консультацию по вопросам создания и покупки мебели (от дизайна, разработки технического задания до доставки мебели к Вам домой).\rВы можете обратиться к нам по телефону, по электронной почте или договориться о встрече в нашем офисе. Будем рады помочь вам и ответить на все ваши вопросы. \rТелефоны\rТелефон/факс:\n(495) 212-85-06\rТелефоны:\n(495) 212-85-07\r(495) 212-85-08\rEmail\rinfo@example.ru\r&mdash; общие вопросы\rsales@example.ru\r&mdash; приобретение продукции\rmarketing@example.ru\r&mdash; маркетинг/мероприятия/PR\rОфис в Москве','','','',NULL,NULL,NULL),(22,'2010-05-25 00:00:00','iblock','1',0,NULL,NULL,NULL,'=ID=1&EXTERNAL_ID=1&CODE=&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news_s1&IBLOCK_EXTERNAL_ID=furniture_news_s1','Мебельный форум Беларуси','С 20 по 23 апреля 2010 года состоится \rМебельный Форум Беларуси\r&ndash; важнейшее мероприятии отрасли в текущем году.\r\n\rС 20 по 23 апреля 2010 года состоится \rМебельный Форум Беларуси\r&ndash; важнейшее мероприятии отрасли в текущем году. В экспозиции принимают участие свыше 160 компаний из \rБеларуси, Австрии, Латвии, Литвы, России, Польши \rи\rУкраины\r. В составе форума состоится пять выставок:\"Минский мебельный салон\", \"Мебельные технологии\", \"ОфисКомфорт\", \"Кухня\" и \"Домотех\". Экспозиция будет строиться по принципу двух тематических секторов:\rготовой мебели\rи \rматериалов для ее производства\r.\rВ секторе готовой мебели будут представлены:\rкорпусная и мягкая мебель;\rмебель для детей и молодежи;\rпредметы интерьера;\rкухонная мебель;\rмебель для офиса и административных зданий.\rВ секторе материалов для производства мебели будут демонстрироваться новинки рынка мебельной фурнитуры, материалов, обивочных тканей, элементов и аксессуаров для производства мебели.\rПомимо расширенной экспозиции пяти тематических выставок \"Экспофорум\" подготовил разнообразную деловую программу Мебельного форума. В рамках выставки состоятся семинары и мастер-классы. И поистине масштабным в этом году обещает стать республиканский конкурс форума \"\rНародное признание\r\". В этом году он выходит за рамки выставки и становится республиканским смотром образцов мебели.\rМебельный Форум\rпредоставляет специалистам возможность познакомиться с тенденциями мебельной моды, провести переговоры, получить практические предложения рынка, увидеть перспективы развития и новые конкурентные преимущества. Впервые для участников конкурса будет подготовлен маркетинговый отчет по результатам опроса посетителей выставок \rМебельного Форума\r.\rПрием заявок на участие в конкурсе осуществляется до 12 апреля 2010 года.','','news','1',NULL,'2010-05-25 00:00:00',NULL),(23,'2010-05-26 00:00:00','iblock','2',0,NULL,NULL,NULL,'=ID=2&EXTERNAL_ID=8&CODE=&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news_s1&IBLOCK_EXTERNAL_ID=furniture_news_s1','Международная мебельная выставка SALON DEL MOBILE','В 2010 году выставка Salon del Mobile обещает быть еще более расширенной и интересной. \r\nВ 2010 году выставка Salon del Mobile обещает быть еще более расширенной и интересной. На выставке Salon del Mobile будут представлены все типы мебели для офиса и дома от спален и гостиных до VIP-кабинетов, включая оборудование для сада и детской мебели. Заявки на участие подали более чем 1 500 компаний со всего мира. Предполагается, что за время проведения выставки ее посетят более 300 000 тысяч человек. Экспозиция выставки разместится на общей площади 149 871 кв.м. В 2010 году эта поистине грандиозная выставка будет проводиться уже в 10-й раз.','','news','1',NULL,'2010-05-26 00:00:00',NULL),(24,'2010-05-27 00:00:00','iblock','3',0,NULL,NULL,NULL,'=ID=3&EXTERNAL_ID=9&CODE=&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news_s1&IBLOCK_EXTERNAL_ID=furniture_news_s1','Получено прочное водостойкое соединение','Получено новое прочное водостойкое клеевое соединение.Изобретение относится к области получения и применения клеящих составов, используемых в деревообрабатывающей, мебельной и строительной промышленности. Данная клеевая композиция предназначена только для горячего прессования и имеет в своем составе многокомпонентный отвердитель. \r\n\rАвторы изобретения\r: Разиньков Егор Михайлович и Мещерякова Анна Анатольевна \rПатент Российской Федерации RU2277566\rОписание изобретения\rИзобретение относится к области получения и применения клеящих составов, используемых в деревообрабатывающей, мебельной и строительной промышленности.\rДанная клеевая композиция предназначена только для горячего прессования и имеет в своем составе многокомпонентный отвердитель. Прототипом клеевой композиции является клей, состоящий из карбамидоформальдегидной смолы, сополимера акрилонитрила с N-винилкапролактамом и отвердитель. В качестве отвердителя применяют хлористый аммоний либо акриловую кислоту. \rИзобретение решает задачу по получению прочного и водостойкого клеевого соединения.\rЭто достигается тем, что клеевая композиция, включающая синтетическую смолу и отвердитель, согласно изобретению, дополнительно содержит модификатор, причем в качестве синтетической смолы клеевая композиция включает карбамидомеламиноформальдегидную смолу с отвердителем 2542, в качестве модификатора - карбамидоформальдегидную смолу, а в качестве отвердителя - 10%-ный раствор щавелевой кислоты при следующем соотношении компонентов, мас.ч.:\rКарбамидомеламиноформальдегидная смола\r64,5-79,2\r10%-ный Раствор щавелевой кислоты\r4,4-20,5\rОтвердитель для карбамидомеламиноформальдегидной \r0,6-2,0\rсмолы 2542\r13,0-15,8','','news','1',NULL,'2010-05-27 00:00:00',NULL),(25,'2017-09-08 15:00:47','iblock','4',0,NULL,NULL,NULL,'=ID=4&EXTERNAL_ID=10&CODE=&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Герцог','Изящный каркас с элементами росписи, роскошные ткани для обивки, яркие цвета и богатый декор.\r\r\n \rИзящный каркас с элементами росписи, роскошные ткани для обивки, яркие цвета и богатый декор.','','products','2',NULL,NULL,NULL),(26,'2017-09-08 15:00:48','iblock','5',0,NULL,NULL,NULL,'=ID=5&EXTERNAL_ID=11&CODE=&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Монализа','Богатство и изыск выражен в данной модели. Каркас дополнительно расписывается золотом.\rПо желанию клиента возможна простежка на спинке и подлокотниках.\r\r\n \rБогатство и изыск выражен в данной модели. Каркас дополнительно расписывается золотом.\rПо желанию клиента возможна простежка на спинке и подлокотниках.','','products','2',NULL,NULL,NULL),(27,'2017-09-08 15:00:49','iblock','6',0,NULL,NULL,NULL,'=ID=6&EXTERNAL_ID=12&CODE=&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Министр','Кресло руководителя Министр, несмотря на низкую стоимость, впечатляюще выглядит. \rС его помощью можно создать офисный интерьер высокого уровня. К тому же в нем можно работать с комфортом, не чувствуя усталости.\r\r\n \rКресло руководителя Министр, несмотря на низкую стоимость, впечатляюще выглядит. \rС его помощью можно создать офисный интерьер высокого уровня. К тому же в нем можно работать с комфортом, не чувствуя усталости.','','products','2',NULL,NULL,NULL),(28,'2017-09-08 15:00:51','iblock','7',0,NULL,NULL,NULL,'=ID=7&EXTERNAL_ID=13&CODE=&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Хром','Динамичная модель офисного кресла примечательна оригинальным внешним видом, который достигнут за \rсчет хромированной крестовины,необычных подлокотников и потрясающей эргономики. \rТвердая спинка жестко поддерживает позвоночник.\r\r\n \rДинамичная модель офисного кресла примечательна оригинальным внешним видом, который достигнут за \rсчет хромированной крестовины,необычных подлокотников и потрясающей эргономики. \rТвердая спинка жестко поддерживает позвоночник.','','products','2',NULL,NULL,NULL),(29,'2017-09-08 15:00:53','iblock','8',0,NULL,NULL,NULL,'=ID=8&EXTERNAL_ID=14&CODE=&IBLOCK_SECTION_ID=3&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Ливерпуль','Деревянные стулья Ливерпуль, выполненные в классическом английском стиле, \rсоздают особую атмосферу в кухне.\r\r\n \rДеревянные стулья Ливерпуль, выполненные в классическом английском стиле, \rсоздают особую атмосферу в кухне.','','products','2',NULL,NULL,NULL),(30,'2017-09-08 15:00:54','iblock','9',0,NULL,NULL,NULL,'=ID=9&EXTERNAL_ID=15&CODE=&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Изабелла','Изящный каркас с элементами росписи золотом. Обивка может быть представлена в ткани или коже.\r\r\n \rИзящный каркас с элементами росписи золотом. Обивка может быть представлена в ткани или коже.','','products','2',NULL,NULL,NULL),(31,'2017-09-08 15:00:56','iblock','10',0,NULL,NULL,NULL,'=ID=10&EXTERNAL_ID=16&CODE=&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Аладдин','Комфортная, массивная модель. Обивка - элитные ткани, ручная строчка, \rпридают изделию необыкновенный шарм и элегантную роскошь. \rПо желанию клиента можно установить механизм трансформации для ежедневного использования или «гостевую раскладушку»\r\r\n \rКомфортная, массивная модель. Обивка - элитные ткани, ручная строчка, \rпридают изделию необыкновенный шарм и элегантную роскошь. \rПо желанию клиента можно установить механизм трансформации для ежедневного использования или «гостевую раскладушку»','','products','2',NULL,NULL,NULL),(32,'2017-09-08 15:00:58','iblock','11',0,NULL,NULL,NULL,'=ID=11&EXTERNAL_ID=17&CODE=&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Джоконда','Изящный каркас, элитные ткани для обивки, ручная строчка, придают изделию необыкновенный шарм и элегантную роскошь. \rОбивка также может быть в коже, по желанию клиента возможна простежка на подлокотниках и спинке.\r\r\n \rИзящный каркас, элитные ткани для обивки, ручная строчка, придают изделию необыкновенный шарм и элегантную роскошь. \rОбивка также может быть в коже, по желанию клиента возможна простежка на подлокотниках и спинке.','','products','2',NULL,NULL,NULL),(33,'2017-09-08 15:01:00','iblock','12',0,NULL,NULL,NULL,'=ID=12&EXTERNAL_ID=18&CODE=&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Флора','Классическая модель создана для украшения роскошных интерьеров. \rЭлегантность и колоритность модели придают накладки из натурального дерева.\r\r\n \rКлассическая модель создана для украшения роскошных интерьеров. \rЭлегантность и колоритность модели придают накладки из натурального дерева.','','products','2',NULL,NULL,NULL),(34,'2017-09-08 15:01:02','iblock','13',0,NULL,NULL,NULL,'=ID=13&EXTERNAL_ID=19&CODE=&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Престиж','Тахта в классическом исполнении. Подлокотник находится слева – это стандарт. Обивка может быть как в ткани, так и в коже.\r\r\n \rТахта в классическом исполнении. Подлокотник находится слева – это стандарт. Обивка может быть как в ткани, так и в коже.','','products','2',NULL,NULL,NULL),(35,'2017-09-08 15:01:04','iblock','14',0,NULL,NULL,NULL,'=ID=14&EXTERNAL_ID=20&CODE=&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Лаура','Двухместная софа на основе конусных пружин или на основе комбинации плотных поролонов, по Вашему желанию. \rЭлитные ткани для обивки придают модели необыкновенный шарм и элегантную роскошь.\r\r\n \rДвухместная софа на основе конусных пружин или на основе комбинации плотных поролонов, по Вашему желанию. \rЭлитные ткани для обивки придают модели необыкновенный шарм и элегантную роскошь.','','products','2',NULL,NULL,NULL),(36,'2017-09-08 15:01:08','iblock','15',0,NULL,NULL,NULL,'=ID=15&EXTERNAL_ID=21&CODE=&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Модерн','Основными характеристиками данной серии является новизна дизайнерской мысли, \rкоторая воплощена во внешнем облике этой мебели, и оригинальность исполнения классической компоновки, \rкоторая сочетает в себе оптимальный набор всех необходимых элементов и свежие решения в их организации. \rЧто в сочетании с удачными цветовыми решениями создаст в вашем офисе атмосферу неповторимой индивидуальности. \rДанная серия – наилучшее решение для бизнесменов, которые привыкли быть на шаг впереди не только своих конкурентов, \rно и самого времени.\r\r\n \rОсновными характеристиками данной серии является новизна дизайнерской мысли, \rкоторая воплощена во внешнем облике этой мебели, и оригинальность исполнения классической компоновки, \rкоторая сочетает в себе оптимальный набор всех необходимых элементов и свежие решения в их организации. \rЧто в сочетании с удачными цветовыми решениями создаст в вашем офисе атмосферу неповторимой индивидуальности. \rДанная серия – наилучшее решение для бизнесменов, которые привыкли быть на шаг впереди не только своих конкурентов, \rно и самого времени.','','products','2',NULL,NULL,NULL),(37,'2017-09-08 15:01:12','iblock','16',0,NULL,NULL,NULL,'=ID=16&EXTERNAL_ID=22&CODE=&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Оптима','Удачный выбор мебели для персонала во многом определяет успешность деятельности всей компании. \rПравильно организовать рабочее пространство - значит помочь коллегам выполнять свои функции быстрее и эффективнее.\rСерия \r«Оптима»\rпозволит найти массу решений для обустройства рабочей зоны, приспособить интерьер к должностным \rобязанностям всех категорий сотрудников. Эргономичные угловые столы, перегородки, шкафы и тумбы помогут рационально использовать \rпространство под уникальное рабочее место, приспособленное к потребностям каждого работника и всей фирмы в целом.\rМебель \r«Оптима»\r- это полный набор интерьерных решений для обустройства пространства в офисе по современным стандартам.\r\r\n \rУдачный выбор мебели для персонала во многом определяет успешность деятельности всей компании. Правильно организовать рабочее пространство - значит помочь коллегам выполнять свои функции быстрее и эффективнее.\rСерия \r«Оптима»\rпозволит найти массу решений для обустройства рабочей зоны, приспособить интерьер к должностным обязанностям всех категорий сотрудников. Эргономичные угловые столы, перегородки, шкафы и тумбы помогут рационально использовать пространство под уникальное рабочее место, приспособленное к потребностям каждого работника и всей фирмы в целом.\rМебель \r«Оптима»\r- это полный набор интерьерных решений для обустройства пространства в офисе по современным стандартам.','','products','2',NULL,NULL,NULL),(38,'2017-09-08 15:01:14','iblock','17',0,NULL,NULL,NULL,'=ID=17&EXTERNAL_ID=23&CODE=&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Собрание','Заходя в помещение, где находятся столы для переговоров «Собрание», возникает стойкое ощущение, что находишься в кабинете если не президента страны, то премьер-министра как минимум. Вот-вот в комнату войдет высокопоставленный чиновник, и начнется обсуждение глобальных вопросов.\rУдивительное сочетание изысканной роскоши стиля и красоты классических линий столов «Собрание» и привлекательной цены опровергает устоявшееся утверждение о качестве дешевой мебели. Уменьшение себестоимости происходит за счет использования более дешевых материалов – ДСП и ДВП, что позволяет офисной мебели сохранять великолепные эксплуатационные характеристики.\r\r\n \rЗаходя в помещение, где находятся столы для переговоров «Собрание», возникает стойкое ощущение, что находишься в кабинете если не президента страны, то премьер-министра как минимум. Вот-вот в комнату войдет высокопоставленный чиновник, и начнется обсуждение глобальных вопросов.\rУдивительное сочетание изысканной роскоши стиля и красоты классических линий столов «Собрание» и привлекательной цены опровергает устоявшееся утверждение о качестве дешевой мебели. Уменьшение себестоимости происходит за счет использования более дешевых материалов – ДСП и ДВП, что позволяет офисной мебели сохранять великолепные эксплуатационные характеристики.','','products','2',NULL,NULL,NULL),(39,'2017-09-08 15:01:16','iblock','18',0,NULL,NULL,NULL,'=ID=18&EXTERNAL_ID=24&CODE=&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Лидер','Этот стильный стол абсолютно не симметричен, и это придает ему изящность и оригинальность. \rСлева он опирается на ножку, освобождая полезное пространство для системного блока и ног. \rСправа основанием служит удобная и вместительная тумба. Плавные линии, стильный дизайн и высокая эргономичность являются \rосновными достоинствами данной серии.\r\r\n \rЭтот стильный стол абсолютно не симметричен, и это придает ему изящность и оригинальность. \rСлева он опирается на ножку, освобождая полезное пространство для системного блока и ног. \rСправа основанием служит удобная и вместительная тумба. Плавные линии, стильный дизайн и высокая эргономичность являются \rосновными достоинствами данной серии.','','products','2',NULL,NULL,NULL),(40,'2017-09-08 15:01:20','iblock','19',0,NULL,NULL,NULL,'=ID=19&EXTERNAL_ID=25&CODE=&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Президент','Кресло руководителя Президент\rво главе большого круглого стола поможет создать в вашем кабинете\rобстановку легендарной совещательной комнаты. Ведь это не просто мебель офисная – это настоящий трон, который \rпоможет управленцу решать любые вопросы, согласуясь с понятиями чести и совести.\r\r\n \rКресло руководителя Президент\rво главе большого круглого стола поможет создать в вашем кабинете\rобстановку легендарной совещательной комнаты. Ведь это не просто мебель офисная – это настоящий трон, который \rпоможет управленцу решать любые вопросы, согласуясь с понятиями чести и совести. \rДизайн кресла выполнен в строгом классическом стиле. Окантовка и подлокотники кресла выточена вручную и потому уникальны. \rПроизводится ограниченными партиями - не более 10 кресел в год.','','products','2',NULL,NULL,NULL),(41,'2017-09-08 15:01:22','iblock','20',0,NULL,NULL,NULL,'=ID=20&EXTERNAL_ID=26&CODE=&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Плутон','Офисное кресло, подобранное с учетом ваших физиологических особенностей - важная составляющая работоспособности и здоровья. \rДанная модель будет незаменима для тех, кто много работает за компьютером.\r\r\n \rОфисное кресло, подобранное с учетом ваших физиологических особенностей - важная составляющая работоспособности и здоровья. \rДанная модель будет незаменима для тех, кто много работает за компьютером.','','products','2',NULL,NULL,NULL),(42,'2017-09-08 15:01:26','iblock','21',0,NULL,NULL,NULL,'=ID=21&EXTERNAL_ID=27&CODE=&IBLOCK_SECTION_ID=3&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Парма','Стулья Парма внесут в кухню уютное обаяние экологически чистого древесного материала. \rСтул практически целиком сделан из массива бука, исключением стало лишь мягкое сиденье. \rТонировка деревянных деталей может быть выполнена в любой цветовой палитре.\r\r\n \r <p>Стулья Парма внесут в кухню уютное обаяние экологически чистого древесного материала. \r Стул практически целиком сделан из массива бука, исключением стало лишь мягкое сиденье. \r Тонировка деревянных деталей может быть выполнена в любой цветовой палитре.</p>','','products','2',NULL,NULL,NULL),(43,'2017-09-08 15:01:28','iblock','22',0,NULL,NULL,NULL,'=ID=22&EXTERNAL_ID=28&CODE=&IBLOCK_SECTION_ID=3&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Палермо','Универсальный дизайн стульев Палермо позволит с успехом использовать их и в офисных помещениях, \rи в интерьере кафе, и в домашней обстановке. Стулья Палермо добавят уюта в каждое помещение и \rорганично сольются с его стилем.\r\r\n \rУниверсальный дизайн стульев Палермо позволит с успехом использовать их и в офисных помещениях, \rи в интерьере кафе, и в домашней обстановке. Стулья Палермо добавят уюта в каждое помещение и \rорганично сольются с его стилем.','','products','2',NULL,NULL,NULL),(44,'2017-09-08 15:01:32','iblock','23',0,NULL,NULL,NULL,'=ID=23&EXTERNAL_ID=29&CODE=&IBLOCK_SECTION_ID=3&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Валенсия','Стильный дизайн стульев Валенсия сразу привлекает внимание, а эргономичная форма спинки и \rмягкое сиденье делают их необычайно удобными. Эти стулья хорошо подойдут к любой офисной мебели для \rперсонала.\r\r\n \rСтильный дизайн стульев Валенсия сразу привлекает внимание, а эргономичная форма спинки и \rмягкое сиденье делают их необычайно удобными. Эти стулья хорошо подойдут к любой офисной мебели для \rперсонала.','','products','2',NULL,NULL,NULL),(45,'2017-09-08 15:01:37','iblock','24',0,NULL,NULL,NULL,'=ID=24&EXTERNAL_ID=30&CODE=&IBLOCK_SECTION_ID=4&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Фазенда','Складной деревянный стул с сиденьем и спинкой из плотного хлопка, изготовленный из натуральных природных материалов. \rТкань и дерево считаются теплыми материалами - даже зимой сидеть на них комфортнее, чем на железе или пластике. Это прекрасное решение для дачи.\r\r\n \rСкладной деревянный стул с сиденьем и спинкой из плотного хлопка, изготовленный из натуральных природных материалов. \rТкань и дерево считаются теплыми материалами - даже зимой сидеть на них комфортнее, чем на железе или пластике. Это прекрасное решение для дачи.','','products','2',NULL,NULL,NULL),(46,'2017-09-08 15:01:42','iblock','25',0,NULL,NULL,NULL,'=ID=25&EXTERNAL_ID=31&CODE=&IBLOCK_SECTION_ID=4&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Эра','Стильный стул необычный формы с жесткими сиденьями на металлическом каркасе удобен тем, \rчто можно компактно сложить для хранения до 45 таких стульев. Легкая и прочная модель отлично подойдет \rк компьютерной стойке, также ее можно использовать как мебель для кафе и баров.\r\r\n \rСтильный стул необычный формы с жесткими сиденьями на металлическом каркасе удобен тем, \rчто можно компактно сложить для хранения до 45 таких стульев. Легкая и прочная модель отлично подойдет \rк компьютерной стойке, также ее можно использовать как мебель для кафе и баров.','','products','2',NULL,NULL,NULL),(47,'2017-09-08 15:01:45','iblock','26',0,NULL,NULL,NULL,'=ID=26&EXTERNAL_ID=32&CODE=&IBLOCK_SECTION_ID=4&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Сити','Стильный, легкий и удобный стул на хромированном основании сразу привлекает внимание \rсвоей необычной формой. А разнообразные варианты обивки позволяют подобрать наилучшее сочетание с \rлюбой компьютерной мебелью.\r\r\n \rСтильный, легкий и удобный стул на хромированном основании сразу привлекает внимание \rсвоей необычной формой. А разнообразные варианты обивки позволяют подобрать наилучшее сочетание с \rлюбой компьютерной мебелью.','','products','2',NULL,NULL,NULL),(48,'2017-09-08 15:01:49','iblock','27',0,NULL,NULL,NULL,'=ID=27&EXTERNAL_ID=33&CODE=&IBLOCK_SECTION_ID=4&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Изопласт Хром','Популярная модель офисного стула на хромированном металлическом каркасе с пластиковыми спинкой и \rсиденьем хорошо вписывается в любой интерьер. Прочные и долговечные, эти стулья удобны для использования \rв качестве аудиторных конференц-кресел, кроме того, их легко хранить.\r\r\n \rПопулярная модель офисного стула на хромированном металлическом каркасе с пластиковыми спинкой и \rсиденьем хорошо вписывается в любой интерьер. Прочные и долговечные, эти стулья удобны для использования \rв качестве аудиторных конференц-кресел, кроме того, их легко хранить.','','products','2',NULL,NULL,NULL),(49,'2017-09-08 15:00:41','iblock','S1',0,NULL,NULL,NULL,'=ID=1&EXTERNAL_ID=2&CODE=&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Мягкая мебель','Диваны, кресла и прочая мягкая мебель',NULL,'products','2',NULL,NULL,NULL),(50,'2017-09-08 15:00:42','iblock','S2',0,NULL,NULL,NULL,'=ID=2&EXTERNAL_ID=3&CODE=&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Офисная мебель','Диваны, столы, стулья',NULL,'products','2',NULL,NULL,NULL),(51,'2017-09-08 15:00:43','iblock','S3',0,NULL,NULL,NULL,'=ID=3&EXTERNAL_ID=4&CODE=&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Мебель для кухни','Полки, ящики, столы и стулья',NULL,'products','2',NULL,NULL,NULL),(52,'2017-09-08 15:00:44','iblock','S4',0,NULL,NULL,NULL,'=ID=4&EXTERNAL_ID=5&CODE=&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1','Детская мебель','Кровати, стулья, мягкая детская мебель',NULL,'products','2',NULL,NULL,NULL),(53,'2017-09-08 15:02:23','iblock','28',0,NULL,NULL,NULL,'=ID=28&EXTERNAL_ID=5&CODE=&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=products&IBLOCK_ID=3&IBLOCK_CODE=furniture_services_s1&IBLOCK_EXTERNAL_ID=furniture_services_s1','Мебель на заказ','Наша компания занимается разработкой мебели на заказ.\r\n \rНаша компания занимается разработкой мебели на заказ по индивидуальным проектам: встроенные и корпусные шкафы купе,\rгардеробные комнаты, прихожие, библиотеки, платяные шкафы, комоды и другие сложные конструкции.\rМы создаем мебель идеально подходящую именно к вашему дому и офису, интерьеры, максимально отображающие вашу индивидуальность.\rПо Вашей заявке наш специалист приезжает со всеми образцами материалов, с которыми мы работаем, в любое удобное для Вас время и\rпроизведет все необходимые замеры. Учитывая все Ваши пожелания и особенности помещения, составляется эскизный проект.\rПосле заключения договора, в котором оговариваются сроки доставки и монтажа мебели, эскизный проект передается на производство,\rгде опытными специалистами производятся расчеты в программе трехмерного моделирования. После всех расчетов готовый проект поступает\rнепосредственно на производство, где производят раскрой деталей, их обработку, и сборку некоторых элементов. Накануне дня доставки\rсотрудники отдела транспортных услуг свяжутся с Вами и более конкретно оговорят время доставки. После заключения договора вами\rвносится предоплата в размере 30% от суммы заказанной Вами мебели. Остальная сумма оплачивается Вами по доставке.','','products','3',NULL,NULL,NULL),(54,'2017-09-08 15:02:28','iblock','29',0,NULL,NULL,NULL,'=ID=29&EXTERNAL_ID=6&CODE=&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=products&IBLOCK_ID=3&IBLOCK_CODE=furniture_services_s1&IBLOCK_EXTERNAL_ID=furniture_services_s1','Услуги дизайнера','Мы предлагаем широкий спектр услуг по дизайну мебели.\r\n \rДиагностика возможностей преобразования помещений – определение вариантов перепланировки, отделки, разработка новых решений колористки, освещения, перестановки мебели и декора, разработка специальных функциональных зон для переключения в различные режимы жизни.\rРазработка Идеи-Образа, проведение предварительных расчётов и создание 3D-модели: изображение передает цвет и фактуру, предлагая клиенту экспериментировать и подбирать оптимальный вариант.\rРазработка компьютерных цветных трехмерных моделей мебели. Натуралистичность изображений, их высокая схожесть с оригиналом позволяют представить, как будет выглядеть готовое изделие, рассмотреть его в деталях.\rПодбор и расстановка мебели.\rДекорирование - подбор декора и аксессуаров интерьера в соответствии с образом и стилем помещения. Возможно создание по индивидуальному запросу эксклюзивных, авторских коллекций.','','products','3',NULL,NULL,NULL),(55,'2010-05-01 00:00:00','iblock','30',0,NULL,NULL,NULL,'=ID=30&EXTERNAL_ID=2&CODE=&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vacancies&IBLOCK_ID=4&IBLOCK_CODE=furniture_vacancies_s1&IBLOCK_EXTERNAL_ID=furniture_vacancies_s1','Продавец-дизайнер (кухни)','Требования\rУверенный пользователь ПК, навыки черчения от руки и в программах, опыт работы дизайнером/конструктором в мебельной сфере, этика делового общения\rОбязанности\rКонсультирование клиентов по кухонной мебели, оставление художественно-конструкторских проектов, прием и оформление заказов.\rУсловия\rЗарплата: 13500 оклад + % от личных продаж + премии‚ совокупный доход от 20000 руб,полный соц. пакет‚ оформление согласно ТК РФ','','vacancies','4',NULL,'2010-05-01 00:00:00',NULL),(56,'2010-05-01 00:00:00','iblock','31',0,NULL,NULL,NULL,'=ID=31&EXTERNAL_ID=3&CODE=&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vacancies&IBLOCK_ID=4&IBLOCK_CODE=furniture_vacancies_s1&IBLOCK_EXTERNAL_ID=furniture_vacancies_s1','Директор магазина','Требования\rВысшее образование‚ опыт руководящей работы в рознице от 3 лет‚ опытный пользователь ПК‚ этика делового общения‚ знание методов управления и заключения договоров‚ отличное знание торгового и трудового законодательств‚ ответственность‚ инициативность‚ активность.\rОбязанности\rРуководство деятельностью магазина‚ организация эффективной работы персонала магазина‚ финансово-хозяйственная деятельность и отчетность‚ выполнение плана продаж‚ отчетность.\rУсловия\rТрудоустройство по ТК РФ‚ полный соц. пакет‚ график работы 5 чере 2 (168 час/мес)‚ зарплата: оклад 28000 + % от оборота + премии‚ совокупный доход от 35000 руб','','vacancies','4',NULL,'2010-05-01 00:00:00',NULL),(57,'2010-05-01 00:00:00','iblock','32',0,NULL,NULL,NULL,'=ID=32&EXTERNAL_ID=4&CODE=&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vacancies&IBLOCK_ID=4&IBLOCK_CODE=furniture_vacancies_s1&IBLOCK_EXTERNAL_ID=furniture_vacancies_s1','Бухгалтер отдела учета готовой продукции','Требования\rЖен., 22-45, уверенный пользователь ПК, опыт работы бухгалтером приветсвуется, знание бухгалтерского учета (базовый уровень), самостоятельность, ответственность, коммуникабельность, быстрая обучаемость, желание работать.\rОбязанности\rРабота с первичными документами по учету МПЗ Ведение журналов-ордеров по производственным счетам Формирование материальных отчетов подразделений Исполнение дополнительных функций по указанию руководителя\rУсловия\rГрафик работы 5 дней в неделю, адрес работы г. Шатура, Ботинский пр-д, 37. Зарплата: оклад 10 800 р. + премия 40% от оклада, полный соц. пакет.','','vacancies','4',NULL,'2010-05-01 00:00:00',NULL),(58,'2017-03-07 14:21:00','iblock','33',0,NULL,NULL,NULL,'=ID=33&EXTERNAL_ID=33&CODE=cergey-rodionov&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=reviews&IBLOCK_ID=5&IBLOCK_CODE=rew&IBLOCK_EXTERNAL_ID=5','Cергей Родионов','Вы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.\r\nВы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.\r\nВы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.\r\nВы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.\r\nГенеральный директор\r\nCTC-Медиа','','reviews','5',NULL,'2017-03-07 14:21:00',NULL),(59,'2017-04-10 14:21:00','iblock','34',0,NULL,NULL,NULL,'=ID=34&EXTERNAL_ID=34&CODE=anna-andreeva&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=reviews&IBLOCK_ID=5&IBLOCK_CODE=rew&IBLOCK_EXTERNAL_ID=5','Анна Андреева','Вы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.\r\nВы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.\r\nВы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.\r\nВы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.\r\nМаркетолог\r\nRK-Telecom','','reviews','5',NULL,'2017-04-10 14:21:00',NULL),(60,'2017-04-24 14:21:00','iblock','35',0,NULL,NULL,NULL,'=ID=35&EXTERNAL_ID=35&CODE=dmitriya-pyalov&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=reviews&IBLOCK_ID=5&IBLOCK_CODE=rew&IBLOCK_EXTERNAL_ID=5','Дмитрия Пялов','Можете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала\r\nМожете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала.\r\nМожете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала.\r\nМожете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала.\r\n\r\nПрограммист \r\n.NET-девелопмент','','reviews','5',NULL,'2017-04-24 14:21:00',NULL),(61,'2017-05-10 11:08:00','iblock','36',0,NULL,NULL,NULL,'=ID=36&EXTERNAL_ID=36&CODE=konstantin-ernst&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=reviews&IBLOCK_ID=5&IBLOCK_CODE=rew&IBLOCK_EXTERNAL_ID=5','Константин Эрнст','Можете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала.\r\nМожете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После так\r\nМожете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала.\r\nМожете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала.\r\nМожете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала.\r\n\r\nГенеральный директор\r\nПервый Канал','','reviews','5',NULL,'2017-05-10 11:08:00',NULL),(62,'2017-09-13 16:18:57','main','s1|/user/index.php',0,NULL,NULL,NULL,'/user/index.php','Авторизация','Вы успешно зарегестрировались.\nВернуться на главную страницу','','','',NULL,NULL,NULL),(63,'2017-09-13 15:33:10','main','s1|/user/registration.php',0,NULL,NULL,NULL,'/user/registration.php','Регистрация','','','','',NULL,NULL,NULL),(64,'2017-09-13 15:34:50','main','s1|/user/profiel.php',0,NULL,NULL,NULL,'/user/profiel.php','Профиль','Text here....','','','',NULL,NULL,NULL),(65,'2017-09-13 15:53:13','main','s1|/login/user.php',0,NULL,NULL,NULL,'/login/user.php','Пользователь','','','','',NULL,NULL,NULL),(66,'2017-09-13 16:37:16','main','s1|/login/register.php',0,NULL,NULL,NULL,'/login/register.php','Регистрация','','','','',NULL,NULL,NULL);
/*!40000 ALTER TABLE `b_search_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_freq`
--

DROP TABLE IF EXISTS `b_search_content_freq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_freq` (
  `STEM` int(11) NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FREQ` float DEFAULT NULL,
  `TF` float DEFAULT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_FREQ` (`STEM`,`LANGUAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_freq`
--

LOCK TABLES `b_search_content_freq` WRITE;
/*!40000 ALTER TABLE `b_search_content_freq` DISABLE KEYS */;
INSERT INTO `b_search_content_freq` VALUES (1315,'ru','s1',1,0),(595,'ru','s1',1,0),(1298,'ru','s1',1,0),(195,'ru','s1',3,0),(11,'ru','s1',1,0),(525,'ru','s1',4,0),(682,'ru','s1',2,0);
/*!40000 ALTER TABLE `b_search_content_freq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_param`
--

DROP TABLE IF EXISTS `b_search_content_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_param` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `PARAM_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM_VALUE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  KEY `IX_B_SEARCH_CONTENT_PARAM` (`SEARCH_CONTENT_ID`,`PARAM_NAME`),
  KEY `IX_B_SEARCH_CONTENT_PARAM_1` (`PARAM_NAME`,`PARAM_VALUE`(50),`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_param`
--

LOCK TABLES `b_search_content_param` WRITE;
/*!40000 ALTER TABLE `b_search_content_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_content_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_right`
--

DROP TABLE IF EXISTS `b_search_content_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_right` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_RIGHT` (`SEARCH_CONTENT_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_right`
--

LOCK TABLES `b_search_content_right` WRITE;
/*!40000 ALTER TABLE `b_search_content_right` DISABLE KEYS */;
INSERT INTO `b_search_content_right` VALUES (1,'G2'),(2,'G2'),(3,'G2'),(4,'G2'),(5,'G2'),(6,'G2'),(7,'G2'),(8,'G2'),(9,'G2'),(10,'G2'),(11,'G2'),(12,'G3'),(12,'G4'),(12,'G5'),(13,'G2'),(14,'G2'),(15,'G2'),(16,'G2'),(17,'G2'),(18,'G2'),(19,'G2'),(20,'G2'),(21,'G2'),(22,'G2'),(23,'G2'),(24,'G2'),(25,'G2'),(26,'G2'),(27,'G2'),(28,'G2'),(29,'G2'),(30,'G2'),(31,'G2'),(32,'G2'),(33,'G2'),(34,'G2'),(35,'G2'),(36,'G2'),(37,'G2'),(38,'G2'),(39,'G2'),(40,'G2'),(41,'G2'),(42,'G2'),(43,'G2'),(44,'G2'),(45,'G2'),(46,'G2'),(47,'G2'),(48,'G2'),(49,'G2'),(50,'G2'),(51,'G2'),(52,'G2'),(53,'G2'),(54,'G2'),(55,'G2'),(56,'G2'),(57,'G2'),(58,'G2'),(59,'G2'),(60,'G2'),(61,'G2'),(62,'G2'),(63,'G2'),(64,'G2'),(65,'G2'),(66,'G2');
/*!40000 ALTER TABLE `b_search_content_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_site`
--

DROP TABLE IF EXISTS `b_search_content_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_site` (
  `SEARCH_CONTENT_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_site`
--

LOCK TABLES `b_search_content_site` WRITE;
/*!40000 ALTER TABLE `b_search_content_site` DISABLE KEYS */;
INSERT INTO `b_search_content_site` VALUES (1,'s1',''),(2,'s1',''),(3,'s1',''),(4,'s1',''),(5,'s1',''),(6,'s1',''),(7,'s1',''),(8,'s1',''),(9,'s1',''),(10,'s1',''),(11,'s1',''),(12,'s1',''),(13,'s1',''),(14,'s1',''),(15,'s1',''),(16,'s1',''),(17,'s1',''),(18,'s1',''),(19,'s1',''),(20,'s1',''),(21,'s1',''),(22,'s1',''),(23,'s1',''),(24,'s1',''),(25,'s1',''),(26,'s1',''),(27,'s1',''),(28,'s1',''),(29,'s1',''),(30,'s1',''),(31,'s1',''),(32,'s1',''),(33,'s1',''),(34,'s1',''),(35,'s1',''),(36,'s1',''),(37,'s1',''),(38,'s1',''),(39,'s1',''),(40,'s1',''),(41,'s1',''),(42,'s1',''),(43,'s1',''),(44,'s1',''),(45,'s1',''),(46,'s1',''),(47,'s1',''),(48,'s1',''),(49,'s1',''),(50,'s1',''),(51,'s1',''),(52,'s1',''),(53,'s1',''),(54,'s1',''),(55,'s1',''),(56,'s1',''),(57,'s1',''),(58,'s1',''),(59,'s1',''),(60,'s1',''),(61,'s1',''),(62,'s1',''),(63,'s1',''),(64,'s1',''),(65,'s1',''),(66,'s1','');
/*!40000 ALTER TABLE `b_search_content_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_stem`
--

DROP TABLE IF EXISTS `b_search_content_stem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_stem` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `STEM` int(11) NOT NULL,
  `TF` float NOT NULL,
  `PS` float NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_STEM` (`STEM`,`LANGUAGE_ID`,`TF`,`PS`,`SEARCH_CONTENT_ID`),
  KEY `IND_B_SEARCH_CONTENT_STEM` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_stem`
--

LOCK TABLES `b_search_content_stem` WRITE;
/*!40000 ALTER TABLE `b_search_content_stem` DISABLE KEYS */;
INSERT INTO `b_search_content_stem` VALUES (1,'ru',1,0.2314,1),(2,'ru',2,0.2314,1),(3,'ru',3,0.2314,1),(3,'ru',4,0.2314,2),(3,'ru',5,0.2314,3),(4,'ru',4,0.2314,2),(4,'ru',5,0.2314,3),(4,'ru',6,0.2314,1),(5,'ru',7,0.2314,1),(5,'ru',8,0.2314,2),(6,'ru',9,0.2314,1),(6,'ru',10,0.2314,2),(7,'ru',11,0.2314,1),(8,'ru',12,0.3667,58.5),(8,'ru',13,0.3667,59.5),(8,'ru',14,0.2314,5),(8,'ru',15,0.2314,6),(8,'ru',16,0.3667,32.5),(8,'ru',17,0.3667,74),(8,'ru',18,0.2314,38),(8,'ru',19,0.2314,69),(8,'ru',20,0.2314,112),(8,'ru',21,0.2314,116),(9,'ru',12,0.3667,67),(9,'ru',13,0.3667,68),(9,'ru',14,0.2314,5),(9,'ru',15,0.2314,6),(9,'ru',16,0.2314,26),(9,'ru',17,0.5372,56),(9,'ru',18,0.4628,33),(9,'ru',19,0.2314,86),(9,'ru',20,0.2314,129),(9,'ru',21,0.2314,133),(9,'ru',22,0.2314,39),(9,'ru',23,0.2314,57),(10,'ru',24,0.2314,1),(10,'ru',25,0.2314,2),(11,'ru',26,0.2314,1),(12,'ru',2,0.2953,159.5),(12,'ru',9,0.2953,187.25),(12,'ru',10,0.4559,183.636),(12,'ru',27,0.1272,1),(12,'ru',28,0.1272,3),(12,'ru',29,0.1272,7),(12,'ru',30,0.2015,156.5),(12,'ru',31,0.1272,9),(12,'ru',32,0.1272,10),(12,'ru',33,0.1272,11),(12,'ru',34,0.1272,12),(12,'ru',35,0.1272,13),(12,'ru',36,0.1272,14),(12,'ru',37,0.1272,15),(12,'ru',38,0.1272,16),(12,'ru',39,0.2953,115.5),(12,'ru',40,0.1272,19),(12,'ru',41,0.1272,22),(12,'ru',42,0.1272,29),(12,'ru',43,0.1272,30),(12,'ru',44,0.1272,31),(12,'ru',45,0.1272,32),(12,'ru',46,0.1272,33),(12,'ru',47,0.1272,35),(12,'ru',48,0.2543,171.333),(12,'ru',49,0.1272,38),(12,'ru',50,0.1272,45),(12,'ru',51,0.2543,237.667),(12,'ru',52,0.1272,48),(12,'ru',53,0.1272,50),(12,'ru',54,0.1272,51),(12,'ru',55,0.1272,52),(12,'ru',56,0.1272,62),(12,'ru',57,0.1272,63),(12,'ru',58,0.1272,64),(12,'ru',59,0.1272,65),(12,'ru',60,0.1272,67),(12,'ru',61,0.1272,68),(12,'ru',62,0.1272,76),(12,'ru',63,0.1272,77),(12,'ru',64,0.1272,78),(12,'ru',65,0.1272,79),(12,'ru',66,0.1272,80),(12,'ru',67,0.1272,81),(12,'ru',68,0.1272,82),(12,'ru',69,0.2015,119.5),(12,'ru',70,0.1272,90),(12,'ru',71,0.1272,91),(12,'ru',72,0.1272,92),(12,'ru',73,0.1272,93),(12,'ru',74,0.2015,93),(12,'ru',75,0.2953,125.25),(12,'ru',76,0.2015,182),(12,'ru',77,0.2953,156.5),(12,'ru',78,0.1272,105),(12,'ru',79,0.2543,189.333),(12,'ru',80,0.3815,189.143),(12,'ru',81,0.1272,109),(12,'ru',82,0.1272,111),(12,'ru',83,0.2543,272),(12,'ru',84,0.1272,121),(12,'ru',85,0.2953,208.25),(12,'ru',86,0.2543,177.667),(12,'ru',87,0.1272,128),(12,'ru',88,0.1272,129),(12,'ru',89,0.1272,130),(12,'ru',90,0.1272,133),(12,'ru',91,0.1272,134),(12,'ru',92,0.1272,135),(12,'ru',93,0.1272,137),(12,'ru',94,0.1272,144),(12,'ru',95,0.1272,145),(12,'ru',96,0.2015,174),(12,'ru',97,0.1272,147),(12,'ru',98,0.2015,152),(12,'ru',99,0.2015,179),(12,'ru',100,0.1272,153),(12,'ru',101,0.1272,154),(12,'ru',102,0.1272,156),(12,'ru',103,0.1272,157),(12,'ru',104,0.1272,158),(12,'ru',105,0.1272,164),(12,'ru',106,0.1272,167),(12,'ru',107,0.1272,168),(12,'ru',108,0.1272,175),(12,'ru',109,0.1272,177),(12,'ru',110,0.1272,178),(12,'ru',111,0.1272,179),(12,'ru',112,0.1272,180),(12,'ru',113,0.1272,186),(12,'ru',114,0.2015,235),(12,'ru',115,0.1272,196),(12,'ru',116,0.2015,228),(12,'ru',117,0.1272,199),(12,'ru',118,0.2015,239.5),(12,'ru',119,0.1272,203),(12,'ru',120,0.1272,204),(12,'ru',121,0.1272,206),(12,'ru',122,0.2015,291),(12,'ru',123,0.2015,303),(12,'ru',124,0.2953,303),(12,'ru',125,0.1272,221),(12,'ru',126,0.1272,222),(12,'ru',127,0.1272,224),(12,'ru',128,0.1272,225),(12,'ru',129,0.1272,233),(12,'ru',130,0.1272,234),(12,'ru',131,0.1272,236),(12,'ru',132,0.1272,237),(12,'ru',133,0.1272,243),(12,'ru',134,0.1272,244),(12,'ru',135,0.1272,250),(12,'ru',136,0.1272,251),(12,'ru',137,0.1272,252),(12,'ru',138,0.2015,265),(12,'ru',139,0.1272,255),(12,'ru',140,0.1272,258),(12,'ru',141,0.1272,260),(12,'ru',142,0.1272,261),(12,'ru',143,0.1272,264),(12,'ru',144,0.1272,265),(12,'ru',145,0.1272,266),(12,'ru',146,0.1272,284),(12,'ru',147,0.1272,287),(12,'ru',148,0.2015,287),(12,'ru',149,0.1272,288),(12,'ru',150,0.1272,289),(12,'ru',151,0.1272,295),(12,'ru',152,0.1272,297),(12,'ru',153,0.1272,298),(12,'ru',154,0.1272,306),(12,'ru',155,0.1272,307),(12,'ru',156,0.1272,308),(12,'ru',157,0.2015,334.5),(12,'ru',158,0.2543,331),(12,'ru',159,0.1272,314),(12,'ru',160,0.2953,359.5),(12,'ru',161,0.2015,329.5),(12,'ru',162,0.1272,325),(12,'ru',163,0.1272,327),(12,'ru',164,0.1272,328),(12,'ru',165,0.1272,331),(12,'ru',166,0.1272,333),(12,'ru',167,0.1272,336),(12,'ru',168,0.1272,338),(12,'ru',169,0.1272,341),(12,'ru',170,0.1272,350),(12,'ru',171,0.1272,351),(12,'ru',172,0.1272,354),(12,'ru',173,0.1272,361),(12,'ru',174,0.1272,363),(12,'ru',175,0.1272,366),(12,'ru',176,0.1272,367),(12,'ru',177,0.1272,369),(12,'ru',178,0.2015,369),(12,'ru',179,0.1272,370),(12,'ru',180,0.1272,377),(12,'ru',181,0.1272,378),(12,'ru',182,0.2015,383.5),(12,'ru',183,0.1272,384),(12,'ru',184,0.1272,385),(12,'ru',185,0.1272,387),(12,'ru',186,0.1272,389),(13,'ru',2,0.2733,226),(13,'ru',9,0.4356,287.667),(13,'ru',10,0.5249,284.333),(13,'ru',30,0.1177,478),(13,'ru',31,0.3304,372.167),(13,'ru',32,0.2354,264.333),(13,'ru',33,0.1177,339),(13,'ru',44,0.1177,287),(13,'ru',50,0.1866,340.5),(13,'ru',55,0.1177,599),(13,'ru',70,0.1177,437),(13,'ru',75,0.1177,117),(13,'ru',76,0.1177,118),(13,'ru',88,0.1177,123),(13,'ru',89,0.2354,231),(13,'ru',93,0.1866,179.5),(13,'ru',110,0.1177,598),(13,'ru',117,0.1177,362),(13,'ru',123,0.1866,448.5),(13,'ru',124,0.2733,448.5),(13,'ru',137,0.2733,413.75),(13,'ru',138,0.3304,371.167),(13,'ru',139,0.1177,527),(13,'ru',143,0.1177,338),(13,'ru',151,0.1177,218),(13,'ru',152,0.1177,197),(13,'ru',153,0.1177,221),(13,'ru',155,0.1177,342),(13,'ru',156,0.1177,343),(13,'ru',158,0.2733,431),(13,'ru',161,0.1866,562.5),(13,'ru',169,0.1866,431),(13,'ru',178,0.1177,155),(13,'ru',179,0.2354,315.333),(13,'ru',187,0.1177,1),(13,'ru',188,0.1177,2),(13,'ru',189,0.1866,218),(13,'ru',190,0.1177,12),(13,'ru',191,0.3531,261.143),(13,'ru',192,0.1177,15),(13,'ru',193,0.1177,17),(13,'ru',194,0.1866,17),(13,'ru',195,0.3043,156.6),(13,'ru',196,0.1177,26),(13,'ru',197,0.1177,28),(13,'ru',198,0.1177,29),(13,'ru',199,0.3043,280),(13,'ru',200,0.1177,31),(13,'ru',201,0.2733,202),(13,'ru',202,0.1866,113.5),(13,'ru',203,0.1177,35),(13,'ru',204,0.1177,36),(13,'ru',205,0.1177,45),(13,'ru',206,0.1177,46),(13,'ru',207,0.1177,53),(13,'ru',208,0.1177,54),(13,'ru',209,0.1177,55),(13,'ru',210,0.1866,86.5),(13,'ru',211,0.1177,60),(13,'ru',212,0.1177,62),(13,'ru',213,0.1177,63),(13,'ru',214,0.1177,64),(13,'ru',215,0.1177,70),(13,'ru',216,0.1177,76),(13,'ru',217,0.1177,78),(13,'ru',218,0.1177,80),(13,'ru',219,0.1177,82),(13,'ru',220,0.1177,84),(13,'ru',221,0.1866,282.5),(13,'ru',222,0.1177,94),(13,'ru',223,0.1177,96),(13,'ru',224,0.2354,209.667),(13,'ru',225,0.1177,99),(13,'ru',226,0.1177,100),(13,'ru',227,0.1177,107),(13,'ru',228,0.1177,108),(13,'ru',229,0.3043,426),(13,'ru',230,0.1177,111),(13,'ru',231,0.1177,115),(13,'ru',232,0.1177,116),(13,'ru',233,0.1177,121),(13,'ru',234,0.1866,148),(13,'ru',235,0.1177,130),(13,'ru',236,0.1177,137),(13,'ru',237,0.1866,232),(13,'ru',238,0.1866,311),(13,'ru',239,0.1177,141),(13,'ru',240,0.1866,150),(13,'ru',241,0.1177,154),(13,'ru',242,0.1177,156),(13,'ru',243,0.1177,158),(13,'ru',244,0.1866,242),(13,'ru',245,0.1177,161),(13,'ru',246,0.1177,162),(13,'ru',247,0.1177,164),(13,'ru',248,0.1177,176),(13,'ru',249,0.1177,183),(13,'ru',250,0.1177,192),(13,'ru',251,0.1177,196),(13,'ru',252,0.1177,198),(13,'ru',253,0.1177,199),(13,'ru',254,0.1177,202),(13,'ru',255,0.1177,203),(13,'ru',256,0.1866,333.5),(13,'ru',257,0.1177,220),(13,'ru',258,0.1177,228),(13,'ru',259,0.1177,229),(13,'ru',260,0.1177,230),(13,'ru',261,0.2354,241.333),(13,'ru',262,0.1866,249),(13,'ru',263,0.2354,376),(13,'ru',264,0.1177,236),(13,'ru',265,0.1177,238),(13,'ru',266,0.1866,432),(13,'ru',267,0.1177,245),(13,'ru',268,0.1177,251),(13,'ru',269,0.1177,253),(13,'ru',270,0.1177,255),(13,'ru',271,0.1177,262),(13,'ru',272,0.1177,269),(13,'ru',273,0.1177,276),(13,'ru',274,0.1177,284),(13,'ru',275,0.1177,286),(13,'ru',276,0.1177,288),(13,'ru',277,0.1177,291),(13,'ru',278,0.1177,292),(13,'ru',279,0.1866,461.5),(13,'ru',280,0.2733,461.5),(13,'ru',281,0.1177,297),(13,'ru',282,0.1177,299),(13,'ru',283,0.1177,300),(13,'ru',284,0.1866,300),(13,'ru',285,0.1177,301),(13,'ru',286,0.1177,308),(13,'ru',287,0.1177,314),(13,'ru',288,0.2733,444),(13,'ru',289,0.2354,374.333),(13,'ru',290,0.2733,385.5),(13,'ru',291,0.2733,385.5),(13,'ru',292,0.2733,385.5),(13,'ru',293,0.1177,327),(13,'ru',294,0.2354,482.333),(13,'ru',295,0.2354,484.333),(13,'ru',296,0.1177,341),(13,'ru',297,0.1177,345),(13,'ru',298,0.1177,346),(13,'ru',299,0.1177,347),(13,'ru',300,0.1866,347),(13,'ru',301,0.1177,353),(13,'ru',302,0.1866,428.5),(13,'ru',303,0.3043,521.8),(13,'ru',304,0.1177,374),(13,'ru',305,0.2354,410),(13,'ru',306,0.1177,378),(13,'ru',307,0.1177,379),(13,'ru',308,0.1177,382),(13,'ru',309,0.2733,504.5),(13,'ru',310,0.1866,426.5),(13,'ru',311,0.1177,394),(13,'ru',312,0.1177,400),(13,'ru',313,0.1177,407),(13,'ru',314,0.1177,411),(13,'ru',315,0.1177,413),(13,'ru',316,0.2354,472.333),(13,'ru',317,0.1177,415),(13,'ru',318,0.1177,419),(13,'ru',319,0.1177,420),(13,'ru',320,0.1177,427),(13,'ru',321,0.1177,430),(13,'ru',322,0.1177,431),(13,'ru',323,0.1177,438),(13,'ru',324,0.1177,442),(13,'ru',325,0.1177,452),(13,'ru',326,0.2733,533.25),(13,'ru',327,0.1177,454),(13,'ru',328,0.1177,456),(13,'ru',329,0.1177,457),(13,'ru',330,0.1177,469),(13,'ru',331,0.1177,471),(13,'ru',332,0.1177,472),(13,'ru',333,0.1177,480),(13,'ru',334,0.1177,481),(13,'ru',335,0.1177,483),(13,'ru',336,0.1866,483),(13,'ru',337,0.1177,485),(13,'ru',338,0.1177,492),(13,'ru',339,0.2733,545.25),(13,'ru',340,0.1177,507),(13,'ru',341,0.1177,509),(13,'ru',342,0.1866,561),(13,'ru',343,0.1177,512),(13,'ru',344,0.1177,515),(13,'ru',345,0.1177,528),(13,'ru',346,0.1866,550.5),(13,'ru',347,0.1177,548),(13,'ru',348,0.1177,549),(13,'ru',349,0.1177,550),(13,'ru',350,0.1177,558),(13,'ru',351,0.1177,559),(13,'ru',352,0.1177,574),(13,'ru',353,0.1177,582),(13,'ru',354,0.1866,597),(13,'ru',355,0.1177,594),(13,'ru',356,0.1177,597),(13,'ru',357,0.1177,611),(13,'ru',358,0.1177,613),(13,'ru',359,0.1177,615),(13,'ru',360,0.1177,627),(13,'ru',361,0.1177,639),(13,'ru',362,0.1177,640),(14,'ru',363,0.2314,1),(15,'ru',2,0.3597,330.857),(15,'ru',9,0.2784,342.25),(15,'ru',10,0.3597,217),(15,'ru',31,0.1199,422),(15,'ru',32,0.1199,503),(15,'ru',33,0.1199,203),(15,'ru',34,0.1199,459),(15,'ru',43,0.1199,49),(15,'ru',44,0.1199,331),(15,'ru',54,0.1199,129),(15,'ru',60,0.1199,23),(15,'ru',66,0.1199,50),(15,'ru',68,0.1199,44),(15,'ru',75,0.3366,418.333),(15,'ru',77,0.2398,247.667),(15,'ru',84,0.1199,24),(15,'ru',86,0.1199,435),(15,'ru',89,0.1199,398),(15,'ru',95,0.1199,245),(15,'ru',96,0.2398,483),(15,'ru',98,0.1199,490),(15,'ru',99,0.19,483.5),(15,'ru',101,0.1199,464),(15,'ru',104,0.1199,479),(15,'ru',107,0.19,495.5),(15,'ru',116,0.19,376),(15,'ru',124,0.19,281.5),(15,'ru',130,0.1199,329),(15,'ru',131,0.19,196.5),(15,'ru',133,0.1199,328),(15,'ru',137,0.1199,402),(15,'ru',139,0.19,271.5),(15,'ru',143,0.1199,154),(15,'ru',145,0.1199,355),(15,'ru',147,0.1199,279),(15,'ru',148,0.2398,301.333),(15,'ru',149,0.19,267.5),(15,'ru',152,0.1199,505),(15,'ru',160,0.4148,289.4),(15,'ru',163,0.1199,260),(15,'ru',167,0.19,243.5),(15,'ru',168,0.1199,376),(15,'ru',171,0.1199,392),(15,'ru',179,0.2784,327.5),(15,'ru',191,0.3597,156.286),(15,'ru',194,0.19,77.5),(15,'ru',195,0.1199,478),(15,'ru',202,0.2398,312.333),(15,'ru',229,0.1199,56),(15,'ru',256,0.19,248),(15,'ru',266,0.1199,336),(15,'ru',276,0.19,257),(15,'ru',290,0.19,237.5),(15,'ru',291,0.19,237.5),(15,'ru',292,0.19,237.5),(15,'ru',306,0.1199,7),(15,'ru',307,0.1199,8),(15,'ru',323,0.1199,314),(15,'ru',343,0.1199,309),(15,'ru',347,0.2398,304),(15,'ru',348,0.1199,138),(15,'ru',364,0.1199,5),(15,'ru',365,0.1199,10),(15,'ru',366,0.1199,19),(15,'ru',367,0.19,254),(15,'ru',368,0.1199,26),(15,'ru',369,0.1199,27),(15,'ru',370,0.1199,28),(15,'ru',371,0.1199,32),(15,'ru',372,0.1199,34),(15,'ru',373,0.1199,43),(15,'ru',374,0.1199,52),(15,'ru',375,0.1199,53),(15,'ru',376,0.1199,54),(15,'ru',377,0.19,85),(15,'ru',378,0.1199,57),(15,'ru',379,0.19,92),(15,'ru',380,0.1199,62),(15,'ru',381,0.19,90),(15,'ru',382,0.1199,70),(15,'ru',383,0.1199,72),(15,'ru',384,0.2398,306),(15,'ru',385,0.1199,74),(15,'ru',386,0.1199,83),(15,'ru',387,0.1199,86),(15,'ru',388,0.1199,87),(15,'ru',389,0.1199,88),(15,'ru',390,0.1199,89),(15,'ru',391,0.1199,91),(15,'ru',392,0.1199,92),(15,'ru',393,0.1199,96),(15,'ru',394,0.19,197),(15,'ru',395,0.1199,99),(15,'ru',396,0.19,112.5),(15,'ru',397,0.1199,107),(15,'ru',398,0.1199,108),(15,'ru',399,0.1199,109),(15,'ru',400,0.19,147),(15,'ru',401,0.1199,116),(15,'ru',402,0.2784,224),(15,'ru',403,0.1199,121),(15,'ru',404,0.1199,124),(15,'ru',405,0.1199,127),(15,'ru',406,0.1199,128),(15,'ru',407,0.1199,130),(15,'ru',408,0.2398,184.333),(15,'ru',409,0.1199,140),(15,'ru',410,0.1199,142),(15,'ru',411,0.1199,144),(15,'ru',412,0.19,144),(15,'ru',413,0.1199,146),(15,'ru',414,0.1199,147),(15,'ru',415,0.1199,148),(15,'ru',416,0.1199,155),(15,'ru',417,0.1199,156),(15,'ru',418,0.19,181.5),(15,'ru',419,0.1199,159),(15,'ru',420,0.1199,161),(15,'ru',421,0.1199,162),(15,'ru',422,0.1199,169),(15,'ru',423,0.1199,170),(15,'ru',424,0.1199,172),(15,'ru',425,0.1199,173),(15,'ru',426,0.1199,175),(15,'ru',427,0.19,191),(15,'ru',428,0.1199,177),(15,'ru',429,0.2398,299),(15,'ru',430,0.1199,181),(15,'ru',431,0.1199,183),(15,'ru',432,0.1199,185),(15,'ru',433,0.1199,187),(15,'ru',434,0.1199,196),(15,'ru',435,0.1199,198),(15,'ru',436,0.1199,199),(15,'ru',437,0.1199,200),(15,'ru',438,0.1199,201),(15,'ru',439,0.19,201),(15,'ru',440,0.1199,207),(15,'ru',441,0.1199,208),(15,'ru',442,0.1199,209),(15,'ru',443,0.19,236),(15,'ru',444,0.1199,218),(15,'ru',445,0.1199,220),(15,'ru',446,0.1199,221),(15,'ru',447,0.1199,223),(15,'ru',448,0.1199,232),(15,'ru',449,0.1199,234),(15,'ru',450,0.2398,293.667),(15,'ru',451,0.1199,246),(15,'ru',452,0.1199,251),(15,'ru',453,0.19,256),(15,'ru',454,0.1199,255),(15,'ru',455,0.1199,259),(15,'ru',456,0.19,270),(15,'ru',457,0.19,314.5),(15,'ru',458,0.2398,302.667),(15,'ru',459,0.1199,272),(15,'ru',460,0.1199,274),(15,'ru',461,0.1199,276),(15,'ru',462,0.2398,374.333),(15,'ru',463,0.1199,281),(15,'ru',464,0.1199,282),(15,'ru',465,0.1199,283),(15,'ru',466,0.1199,285),(15,'ru',467,0.1199,286),(15,'ru',468,0.1199,289),(15,'ru',469,0.1199,291),(15,'ru',470,0.1199,292),(15,'ru',471,0.1199,294),(15,'ru',472,0.1199,296),(15,'ru',473,0.1199,298),(15,'ru',474,0.1199,299),(15,'ru',475,0.1199,305),(15,'ru',476,0.1199,310),(15,'ru',477,0.19,314),(15,'ru',478,0.2784,314),(15,'ru',479,0.1199,316),(15,'ru',480,0.1199,324),(15,'ru',481,0.1199,327),(15,'ru',482,0.1199,332),(15,'ru',483,0.1199,333),(15,'ru',484,0.19,357.5),(15,'ru',485,0.19,373),(15,'ru',486,0.1199,348),(15,'ru',487,0.19,348),(15,'ru',488,0.1199,356),(15,'ru',489,0.1199,357),(15,'ru',490,0.1199,361),(15,'ru',491,0.1199,362),(15,'ru',492,0.1199,373),(15,'ru',493,0.1199,374),(15,'ru',494,0.1199,378),(15,'ru',495,0.1199,380),(15,'ru',496,0.1199,388),(15,'ru',497,0.19,447.5),(15,'ru',498,0.1199,394),(15,'ru',499,0.1199,404),(15,'ru',500,0.1199,405),(15,'ru',501,0.1199,406),(15,'ru',502,0.1199,407),(15,'ru',503,0.1199,421),(15,'ru',504,0.1199,423),(15,'ru',505,0.1199,425),(15,'ru',506,0.1199,428),(15,'ru',507,0.1199,432),(15,'ru',508,0.1199,436),(15,'ru',509,0.1199,437),(15,'ru',510,0.1199,442),(15,'ru',511,0.1199,448),(15,'ru',512,0.1199,451),(15,'ru',513,0.1199,452),(15,'ru',514,0.1199,453),(15,'ru',515,0.1199,455),(15,'ru',516,0.1199,456),(15,'ru',517,0.19,479),(15,'ru',518,0.1199,472),(15,'ru',519,0.1199,473),(15,'ru',520,0.1199,484),(15,'ru',521,0.1199,487),(15,'ru',522,0.1199,492),(15,'ru',523,0.1199,494),(15,'ru',524,0.1199,495),(15,'ru',525,0.1199,497),(16,'ru',2,0.1353,60),(16,'ru',9,0.4288,101.25),(16,'ru',10,0.5006,145.25),(16,'ru',30,0.1353,71),(16,'ru',31,0.1353,67),(16,'ru',32,0.2144,203),(16,'ru',33,0.1353,165),(16,'ru',60,0.1353,91),(16,'ru',76,0.1353,59),(16,'ru',77,0.1353,9),(16,'ru',84,0.1353,231),(16,'ru',87,0.1353,66),(16,'ru',88,0.1353,64),(16,'ru',89,0.2144,136),(16,'ru',93,0.2144,104.5),(16,'ru',104,0.1353,41),(16,'ru',105,0.1353,102),(16,'ru',109,0.1353,205),(16,'ru',130,0.1353,142),(16,'ru',131,0.1353,76),(16,'ru',143,0.1353,7),(16,'ru',156,0.1353,72),(16,'ru',157,0.1353,75),(16,'ru',158,0.2144,79),(16,'ru',161,0.2144,76.5),(16,'ru',177,0.1353,77),(16,'ru',178,0.2144,77),(16,'ru',199,0.1353,70),(16,'ru',214,0.1353,62),(16,'ru',218,0.1353,234),(16,'ru',225,0.1353,95),(16,'ru',256,0.4058,150.143),(16,'ru',263,0.1353,78),(16,'ru',278,0.1353,42),(16,'ru',307,0.2144,32.5),(16,'ru',345,0.1353,2),(16,'ru',357,0.1353,69),(16,'ru',358,0.1353,98),(16,'ru',366,0.2706,139.667),(16,'ru',436,0.1353,6),(16,'ru',464,0.1353,101),(16,'ru',476,0.1353,22),(16,'ru',526,0.2144,5.5),(16,'ru',527,0.1353,8),(16,'ru',528,0.1353,23),(16,'ru',529,0.1353,35),(16,'ru',530,0.1353,38),(16,'ru',531,0.1353,39),(16,'ru',532,0.1353,40),(16,'ru',533,0.1353,43),(16,'ru',534,0.2144,43),(16,'ru',535,0.1353,57),(16,'ru',536,0.1353,58),(16,'ru',537,0.1353,61),(16,'ru',538,0.1353,80),(16,'ru',539,0.1353,81),(16,'ru',540,0.1353,83),(16,'ru',541,0.1353,92),(16,'ru',542,0.1353,94),(16,'ru',543,0.1353,96),(16,'ru',544,0.1353,97),(16,'ru',545,0.1353,108),(16,'ru',546,0.1353,112),(16,'ru',547,0.2144,112),(16,'ru',548,0.2144,136.5),(16,'ru',549,0.2144,137.5),(16,'ru',550,0.2144,151),(16,'ru',551,0.1353,117),(16,'ru',552,0.1353,118),(16,'ru',553,0.2706,191.333),(16,'ru',554,0.1353,126),(16,'ru',555,0.1353,127),(16,'ru',556,0.2144,190.5),(16,'ru',557,0.2706,194),(16,'ru',558,0.2144,193),(16,'ru',559,0.2144,165),(16,'ru',560,0.2144,166),(16,'ru',561,0.2144,179.5),(16,'ru',562,0.2144,185.5),(16,'ru',563,0.2144,174),(16,'ru',564,0.1353,145),(16,'ru',565,0.1353,146),(16,'ru',566,0.1353,148),(16,'ru',567,0.2144,179.5),(16,'ru',568,0.1353,158),(16,'ru',569,0.1353,162),(16,'ru',570,0.2144,205),(16,'ru',571,0.1353,166),(16,'ru',572,0.1353,167),(16,'ru',573,0.1353,169),(16,'ru',574,0.1353,171),(16,'ru',575,0.2706,220.333),(16,'ru',576,0.2706,221.333),(16,'ru',577,0.1353,184),(16,'ru',578,0.1353,185),(16,'ru',579,0.1353,186),(16,'ru',580,0.2144,228.5),(16,'ru',581,0.1353,190),(16,'ru',582,0.1353,202),(16,'ru',583,0.1353,203),(16,'ru',584,0.1353,217),(16,'ru',585,0.1353,218),(16,'ru',586,0.1353,233),(16,'ru',587,0.1353,244),(16,'ru',588,0.1353,249),(16,'ru',589,0.1353,250),(16,'ru',590,0.1353,251),(16,'ru',591,0.1353,254),(16,'ru',592,0.1353,257),(16,'ru',593,0.1353,258),(16,'ru',594,0.1353,269),(17,'ru',595,0.2314,1),(18,'ru',115,0.2314,1),(18,'ru',596,0.2314,2),(19,'ru',158,0.2314,3),(19,'ru',597,0.2314,2),(20,'ru',25,0.2314,3),(20,'ru',345,0.2314,7),(20,'ru',373,0.2314,16),(20,'ru',598,0.2314,1),(20,'ru',599,0.2314,5),(20,'ru',600,0.2314,8),(20,'ru',601,0.2314,14),(20,'ru',602,0.2314,17),(21,'ru',2,0.17,99),(21,'ru',8,0.17,109),(21,'ru',12,0.34,74.6667),(21,'ru',13,0.17,73),(21,'ru',114,0.17,12),(21,'ru',133,0.17,8),(21,'ru',148,0.17,5),(21,'ru',160,0.2694,25.5),(21,'ru',185,0.34,54.3333),(21,'ru',191,0.2694,19),(21,'ru',194,0.2694,79.5),(21,'ru',244,0.17,113),(21,'ru',300,0.17,43),(21,'ru',340,0.17,88),(21,'ru',376,0.17,36),(21,'ru',380,0.17,26),(21,'ru',394,0.17,17),(21,'ru',525,0.17,7),(21,'ru',592,0.17,19),(21,'ru',603,0.17,1),(21,'ru',604,0.2694,18),(21,'ru',605,0.17,9),(21,'ru',606,0.17,14),(21,'ru',607,0.17,18),(21,'ru',608,0.17,20),(21,'ru',609,0.17,22),(21,'ru',610,0.17,33),(21,'ru',611,0.3947,62.75),(21,'ru',612,0.17,40),(21,'ru',613,0.17,41),(21,'ru',614,0.17,45),(21,'ru',615,0.17,54),(21,'ru',616,0.17,55),(21,'ru',617,0.17,56),(21,'ru',618,0.17,59),(21,'ru',619,0.17,71),(21,'ru',620,0.17,76),(21,'ru',621,0.17,78),(21,'ru',622,0.17,79),(21,'ru',623,0.17,80),(21,'ru',624,0.34,91),(21,'ru',625,0.17,90),(21,'ru',626,0.17,98),(21,'ru',627,0.17,100),(21,'ru',628,0.17,108),(21,'ru',629,0.17,110),(22,'ru',8,0.2074,27),(22,'ru',9,0.4526,127.1),(22,'ru',10,0.1308,54),(22,'ru',17,0.1308,288),(22,'ru',42,0.1308,234),(22,'ru',45,0.1308,236),(22,'ru',52,0.1308,249),(22,'ru',89,0.2616,134.667),(22,'ru',93,0.1308,250),(22,'ru',138,0.1308,252),(22,'ru',139,0.1308,79),(22,'ru',143,0.1308,269),(22,'ru',148,0.1308,235),(22,'ru',151,0.1308,217),(22,'ru',179,0.1308,60),(22,'ru',191,0.4346,136.778),(22,'ru',194,0.1308,130),(22,'ru',252,0.2616,172),(22,'ru',255,0.1308,207),(22,'ru',256,0.3925,115.714),(22,'ru',280,0.1308,77),(22,'ru',290,0.2616,130.667),(22,'ru',291,0.2616,130.667),(22,'ru',292,0.2616,130.667),(22,'ru',307,0.2074,197.5),(22,'ru',327,0.1308,117),(22,'ru',358,0.1308,70),(22,'ru',372,0.1308,115),(22,'ru',387,0.1308,81),(22,'ru',402,0.1308,125),(22,'ru',408,0.2074,177),(22,'ru',424,0.2074,129),(22,'ru',428,0.2074,154),(22,'ru',450,0.1308,286),(22,'ru',455,0.1308,280),(22,'ru',489,0.1308,123),(22,'ru',525,0.1308,244),(22,'ru',563,0.1308,175),(22,'ru',597,0.1308,202),(22,'ru',630,0.4147,126.25),(22,'ru',631,0.3038,27.25),(22,'ru',632,0.2074,16),(22,'ru',633,0.2074,18),(22,'ru',634,0.2616,109),(22,'ru',635,0.2616,110),(22,'ru',636,0.3038,75.5),(22,'ru',637,0.2074,26),(22,'ru',638,0.2074,28),(22,'ru',639,0.2074,30),(22,'ru',640,0.2616,101.667),(22,'ru',641,0.1308,50),(22,'ru',642,0.2074,167),(22,'ru',643,0.1308,52),(22,'ru',644,0.1308,53),(22,'ru',645,0.1308,57),(22,'ru',646,0.1308,58),(22,'ru',647,0.1308,59),(22,'ru',648,0.1308,61),(22,'ru',649,0.1308,63),(22,'ru',650,0.2074,120.5),(22,'ru',651,0.1308,75),(22,'ru',652,0.1308,80),(22,'ru',653,0.1308,83),(22,'ru',654,0.1308,91),(22,'ru',655,0.1308,93),(22,'ru',656,0.1308,94),(22,'ru',657,0.2074,132),(22,'ru',658,0.1308,96),(22,'ru',659,0.3038,110.5),(22,'ru',660,0.2074,104),(22,'ru',661,0.1308,114),(22,'ru',662,0.1308,121),(22,'ru',663,0.1308,124),(22,'ru',664,0.1308,126),(22,'ru',665,0.1308,132),(22,'ru',666,0.1308,133),(22,'ru',667,0.1308,146),(22,'ru',668,0.1308,147),(22,'ru',669,0.1308,150),(22,'ru',670,0.1308,152),(22,'ru',671,0.1308,153),(22,'ru',672,0.1308,154),(22,'ru',673,0.1308,156),(22,'ru',674,0.2074,156),(22,'ru',675,0.1308,165),(22,'ru',676,0.1308,166),(22,'ru',677,0.1308,171),(22,'ru',678,0.1308,172),(22,'ru',679,0.1308,173),(22,'ru',680,0.1308,174),(22,'ru',681,0.2074,201.5),(22,'ru',682,0.2074,202.5),(22,'ru',683,0.1308,187),(22,'ru',684,0.1308,189),(22,'ru',685,0.1308,196),(22,'ru',686,0.1308,197),(22,'ru',687,0.1308,201),(22,'ru',688,0.2074,213),(22,'ru',689,0.2616,250.667),(22,'ru',690,0.1308,206),(22,'ru',691,0.1308,222),(22,'ru',692,0.1308,224),(22,'ru',693,0.1308,225),(22,'ru',694,0.2074,225),(22,'ru',695,0.1308,237),(22,'ru',696,0.1308,239),(22,'ru',697,0.1308,241),(22,'ru',698,0.1308,242),(22,'ru',699,0.1308,243),(22,'ru',700,0.1308,245),(22,'ru',701,0.1308,246),(22,'ru',702,0.1308,248),(22,'ru',703,0.1308,253),(22,'ru',704,0.1308,254),(22,'ru',705,0.1308,260),(22,'ru',706,0.1308,262),(22,'ru',707,0.2074,262),(22,'ru',708,0.1308,265),(22,'ru',709,0.1308,266),(22,'ru',710,0.1308,267),(22,'ru',711,0.1308,270),(22,'ru',712,0.1308,271),(22,'ru',713,0.1308,281),(23,'ru',9,0.1573,2),(23,'ru',10,0.1573,85),(23,'ru',137,0.1573,66),(23,'ru',152,0.1573,1),(23,'ru',157,0.1573,86),(23,'ru',191,0.2493,62.5),(23,'ru',194,0.1573,56),(23,'ru',199,0.1573,117),(23,'ru',206,0.1573,106),(23,'ru',229,0.3652,59),(23,'ru',256,0.3146,57),(23,'ru',270,0.1573,84),(23,'ru',340,0.1573,116),(23,'ru',362,0.1573,105),(23,'ru',366,0.1573,97),(23,'ru',380,0.1573,58),(23,'ru',388,0.1573,70),(23,'ru',389,0.1573,62),(23,'ru',408,0.1573,139),(23,'ru',424,0.1573,50),(23,'ru',635,0.3146,56),(23,'ru',640,0.1573,112),(23,'ru',642,0.1573,79),(23,'ru',661,0.1573,51),(23,'ru',676,0.2493,27.5),(23,'ru',682,0.4719,62.5714),(23,'ru',685,0.1573,136),(23,'ru',687,0.2493,23.5),(23,'ru',714,0.3652,23),(23,'ru',715,0.3652,24),(23,'ru',716,0.3652,25),(23,'ru',717,0.2493,29.5),(23,'ru',718,0.1573,53),(23,'ru',719,0.1573,60),(23,'ru',720,0.1573,64),(23,'ru',721,0.2493,64),(23,'ru',722,0.1573,65),(23,'ru',723,0.1573,68),(23,'ru',724,0.1573,77),(23,'ru',725,0.1573,80),(23,'ru',726,0.1573,87),(23,'ru',727,0.1573,88),(23,'ru',728,0.1573,94),(23,'ru',729,0.1573,98),(23,'ru',730,0.1573,101),(23,'ru',731,0.1573,103),(23,'ru',732,0.1573,104),(23,'ru',733,0.1573,114),(23,'ru',734,0.1573,118),(23,'ru',735,0.1573,119),(23,'ru',736,0.1573,120),(23,'ru',737,0.1573,137),(23,'ru',738,0.1573,140),(23,'ru',739,0.1573,143),(23,'ru',740,0.1573,144),(24,'ru',9,0.2165,56),(24,'ru',34,0.2165,74),(24,'ru',62,0.1366,149),(24,'ru',75,0.3171,176.25),(24,'ru',138,0.1366,6),(24,'ru',162,0.2165,45),(24,'ru',203,0.2165,55),(24,'ru',277,0.2165,65),(24,'ru',306,0.1366,67),(24,'ru',358,0.3171,64.5),(24,'ru',382,0.1366,164),(24,'ru',499,0.2165,50),(24,'ru',525,0.2165,3),(24,'ru',741,0.2732,53.6667),(24,'ru',742,0.2732,55),(24,'ru',743,0.2732,56.6667),(24,'ru',744,0.4097,108.429),(24,'ru',745,0.3834,89.6667),(24,'ru',746,0.2165,47),(24,'ru',747,0.2732,82.3333),(24,'ru',748,0.2165,51),(24,'ru',749,0.2165,52),(24,'ru',750,0.2165,52),(24,'ru',751,0.2165,53),(24,'ru',752,0.2165,58),(24,'ru',753,0.2165,59),(24,'ru',754,0.353,120),(24,'ru',755,0.2165,68),(24,'ru',756,0.2165,71),(24,'ru',757,0.2165,72),(24,'ru',758,0.2165,78),(24,'ru',759,0.4329,152.125),(24,'ru',760,0.1366,57),(24,'ru',761,0.1366,59),(24,'ru',762,0.2165,59),(24,'ru',763,0.1366,60),(24,'ru',764,0.1366,61),(24,'ru',765,0.1366,63),(24,'ru',766,0.1366,63),(24,'ru',767,0.1366,64),(24,'ru',768,0.1366,65),(24,'ru',769,0.1366,66),(24,'ru',770,0.1366,68),(24,'ru',771,0.1366,69),(24,'ru',772,0.1366,70),(24,'ru',773,0.1366,113),(24,'ru',774,0.1366,116),(24,'ru',775,0.1366,117),(24,'ru',776,0.1366,118),(24,'ru',777,0.2165,157.5),(24,'ru',778,0.4097,188.857),(24,'ru',779,0.1366,122),(24,'ru',780,0.1366,123),(24,'ru',781,0.1366,125),(24,'ru',782,0.1366,136),(24,'ru',783,0.1366,137),(24,'ru',784,0.1366,138),(24,'ru',785,0.1366,140),(24,'ru',786,0.2732,193),(24,'ru',787,0.1366,148),(24,'ru',788,0.1366,163),(24,'ru',789,0.2165,176.5),(24,'ru',790,0.2165,175),(24,'ru',791,0.1366,173),(24,'ru',792,0.1366,175),(24,'ru',793,0.1366,176),(24,'ru',794,0.2165,185),(24,'ru',795,0.1366,178),(24,'ru',796,0.2732,215.667),(24,'ru',797,0.2165,216.5),(24,'ru',798,0.2165,215),(24,'ru',799,0.2165,216),(24,'ru',800,0.2165,217),(24,'ru',801,0.2165,218),(24,'ru',802,0.1366,208),(24,'ru',803,0.1366,209),(24,'ru',804,0.1366,210),(24,'ru',805,0.2165,210),(24,'ru',806,0.1366,211),(24,'ru',807,0.1366,225),(24,'ru',808,0.1366,226),(24,'ru',809,0.1366,234),(24,'ru',810,0.1366,240),(24,'ru',811,0.1366,244),(24,'ru',812,0.1366,245),(25,'ru',405,0.3504,21.5),(25,'ru',428,0.3504,14.5),(25,'ru',671,0.3504,17.5),(25,'ru',813,0.2211,1),(25,'ru',814,0.3504,11.5),(25,'ru',815,0.3504,12.5),(25,'ru',816,0.3504,15.5),(25,'ru',817,0.3504,16.5),(25,'ru',818,0.3504,19.5),(25,'ru',819,0.3504,20.5),(25,'ru',820,0.3504,23.5),(25,'ru',821,0.3504,24.5),(26,'ru',45,0.3199,43.5),(26,'ru',66,0.3199,42.5),(26,'ru',277,0.3199,24.5),(26,'ru',379,0.3199,25.5),(26,'ru',792,0.3199,32.5),(26,'ru',815,0.3199,31.5),(26,'ru',822,0.2018,1),(26,'ru',823,0.3199,19.5),(26,'ru',824,0.3199,21.5),(26,'ru',825,0.3199,22.5),(26,'ru',826,0.3199,33.5),(26,'ru',827,0.3199,34.5),(26,'ru',828,0.3199,41.5),(26,'ru',829,0.3199,44.5),(26,'ru',830,0.3199,46.5),(26,'ru',831,0.3199,48.5),(27,'ru',50,0.2886,58.5),(27,'ru',132,0.2886,46.5),(27,'ru',149,0.2886,45.5),(27,'ru',349,0.2886,60.5),(27,'ru',402,0.2886,44.5),(27,'ru',409,0.2886,42.5),(27,'ru',832,0.3642,18),(27,'ru',833,0.2886,24.5),(27,'ru',834,0.2886,25.5),(27,'ru',835,0.2886,27.5),(27,'ru',836,0.2886,29.5),(27,'ru',837,0.2886,30.5),(27,'ru',838,0.2886,31.5),(27,'ru',839,0.2886,32.5),(27,'ru',840,0.2886,40.5),(27,'ru',841,0.4228,49.5),(27,'ru',842,0.2886,43.5),(27,'ru',843,0.2886,53.5),(27,'ru',844,0.2886,56.5),(27,'ru',845,0.2886,62.5),(27,'ru',846,0.2886,63.5),(28,'ru',29,0.2823,19),(28,'ru',33,0.2823,27),(28,'ru',379,0.2823,20),(28,'ru',830,0.2823,44),(28,'ru',831,0.4135,34),(28,'ru',833,0.2823,22),(28,'ru',842,0.2823,21),(28,'ru',847,0.1781,1),(28,'ru',848,0.2823,23),(28,'ru',849,0.2823,24),(28,'ru',850,0.2823,25),(28,'ru',851,0.2823,26),(28,'ru',852,0.2823,28),(28,'ru',853,0.2823,30),(28,'ru',854,0.2823,31),(28,'ru',855,0.2823,32),(28,'ru',856,0.2823,33),(28,'ru',857,0.2823,34),(28,'ru',858,0.2823,36),(28,'ru',859,0.2823,37),(28,'ru',860,0.2823,43),(28,'ru',861,0.2823,45),(28,'ru',862,0.2823,46),(28,'ru',863,0.2823,47),(29,'ru',163,0.3504,14),(29,'ru',387,0.3504,23),(29,'ru',393,0.3504,20),(29,'ru',409,0.3504,19),(29,'ru',864,0.4421,9),(29,'ru',865,0.3504,11),(29,'ru',866,0.3504,12),(29,'ru',867,0.3504,16),(29,'ru',868,0.3504,17),(29,'ru',869,0.3504,18),(29,'ru',870,0.3504,21),(30,'ru',428,0.3608,17),(30,'ru',610,0.3608,26),(30,'ru',661,0.3608,28),(30,'ru',671,0.3608,30),(30,'ru',814,0.3608,14),(30,'ru',815,0.3608,15),(30,'ru',816,0.3608,18),(30,'ru',818,0.3608,25),(30,'ru',827,0.3608,19),(30,'ru',871,0.2277,1),(30,'ru',872,0.3608,32),(31,'ru',66,0.2823,49.5),(31,'ru',379,0.2823,23.5),(31,'ru',459,0.2823,56.5),(31,'ru',502,0.2823,33.5),(31,'ru',509,0.2823,36.5),(31,'ru',671,0.2823,32.5),(31,'ru',818,0.2823,29.5),(31,'ru',828,0.2823,48.5),(31,'ru',841,0.2823,50.5),(31,'ru',873,0.1781,1),(31,'ru',874,0.2823,21.5),(31,'ru',875,0.2823,22.5),(31,'ru',876,0.2823,31.5),(31,'ru',877,0.2823,34.5),(31,'ru',878,0.2823,35.5),(31,'ru',879,0.2823,37.5),(31,'ru',880,0.2823,38.5),(31,'ru',881,0.2823,40.5),(31,'ru',882,0.2823,41.5),(31,'ru',883,0.2823,51.5),(31,'ru',884,0.2823,52.5),(31,'ru',885,0.2823,53.5),(31,'ru',886,0.2823,55.5),(31,'ru',887,0.2823,58.5),(31,'ru',888,0.2823,59.5),(32,'ru',45,0.2853,51),(32,'ru',66,0.2853,50),(32,'ru',281,0.2853,43),(32,'ru',502,0.2853,28),(32,'ru',509,0.2853,31),(32,'ru',610,0.2853,44),(32,'ru',671,0.2853,25),(32,'ru',814,0.2853,22),(32,'ru',815,0.2853,23),(32,'ru',818,0.418,34.5),(32,'ru',828,0.2853,49),(32,'ru',829,0.2853,52),(32,'ru',830,0.2853,56),(32,'ru',831,0.2853,54),(32,'ru',872,0.2853,47),(32,'ru',876,0.2853,24),(32,'ru',877,0.2853,29),(32,'ru',878,0.2853,30),(32,'ru',879,0.2853,32),(32,'ru',880,0.2853,33),(32,'ru',881,0.2853,35),(32,'ru',882,0.2853,36),(32,'ru',889,0.18,1),(33,'ru',321,0.3142,34),(33,'ru',379,0.4603,23),(33,'ru',402,0.4603,21),(33,'ru',409,0.3142,17),(33,'ru',474,0.3142,21),(33,'ru',817,0.3142,20),(33,'ru',867,0.3142,15),(33,'ru',878,0.3142,31),(33,'ru',881,0.3142,27),(33,'ru',890,0.1982,1),(33,'ru',891,0.3142,19),(33,'ru',892,0.3142,29),(33,'ru',893,0.3142,32),(33,'ru',894,0.3142,35),(33,'ru',895,0.3142,35),(34,'ru',497,0.3413,32),(34,'ru',610,0.3413,39),(34,'ru',671,0.3413,43),(34,'ru',818,0.3413,38),(34,'ru',831,0.3413,28),(34,'ru',867,0.3413,21),(34,'ru',872,0.3413,47),(34,'ru',896,0.2153,1),(34,'ru',897,0.3413,19),(34,'ru',898,0.3413,22),(34,'ru',899,0.3413,29),(34,'ru',900,0.5,30),(35,'ru',379,0.2853,45),(35,'ru',671,0.2853,41),(35,'ru',818,0.2853,43),(35,'ru',828,0.2853,34),(35,'ru',876,0.2853,40),(35,'ru',878,0.2853,44),(35,'ru',879,0.2853,46),(35,'ru',880,0.2853,47),(35,'ru',881,0.2853,49),(35,'ru',882,0.2853,50),(35,'ru',901,0.18,1),(35,'ru',902,0.2853,20),(35,'ru',903,0.2853,21),(35,'ru',904,0.418,25.5),(35,'ru',905,0.418,25.5),(35,'ru',906,0.2853,24),(35,'ru',907,0.2853,25),(35,'ru',908,0.2853,29),(35,'ru',909,0.2853,30),(35,'ru',910,0.2853,31),(35,'ru',911,0.418,31),(36,'ru',33,0.4164,75),(36,'ru',54,0.2351,68),(36,'ru',55,0.4164,90.3333),(36,'ru',131,0.2351,70),(36,'ru',191,0.2351,58),(36,'ru',194,0.2351,94),(36,'ru',240,0.2351,113),(36,'ru',277,0.3444,74.5),(36,'ru',347,0.2351,97),(36,'ru',385,0.2351,96),(36,'ru',428,0.3444,72),(36,'ru',672,0.2351,72),(36,'ru',774,0.2351,48),(36,'ru',849,0.2351,60),(36,'ru',850,0.2351,55),(36,'ru',867,0.2351,62),(36,'ru',870,0.2351,95),(36,'ru',898,0.2351,61),(36,'ru',912,0.1483,1),(36,'ru',913,0.2351,44),(36,'ru',914,0.2351,45),(36,'ru',915,0.3444,75.5),(36,'ru',916,0.2351,49),(36,'ru',917,0.2351,50),(36,'ru',918,0.2351,51),(36,'ru',919,0.2351,53),(36,'ru',920,0.2351,56),(36,'ru',921,0.2351,63),(36,'ru',922,0.2351,65),(36,'ru',923,0.2351,69),(36,'ru',924,0.2351,71),(36,'ru',925,0.2351,74),(36,'ru',926,0.2351,78),(36,'ru',927,0.2351,86),(36,'ru',928,0.2351,88),(36,'ru',929,0.2351,89),(36,'ru',930,0.2351,91),(36,'ru',931,0.2351,105),(36,'ru',932,0.2351,108),(36,'ru',933,0.2351,108),(36,'ru',934,0.2351,108),(36,'ru',935,0.2351,110),(36,'ru',936,0.2351,114),(36,'ru',937,0.2351,118),(36,'ru',938,0.3444,118),(36,'ru',939,0.2351,122),(37,'ru',10,0.2233,68),(37,'ru',39,0.2233,140),(37,'ru',43,0.2233,134),(37,'ru',48,0.3955,102),(37,'ru',49,0.3955,119.667),(37,'ru',55,0.3271,125.5),(37,'ru',80,0.2233,135),(37,'ru',109,0.2233,87),(37,'ru',118,0.2233,130),(37,'ru',123,0.2233,110),(37,'ru',124,0.3271,110),(37,'ru',131,0.2233,108),(37,'ru',191,0.3271,102.5),(37,'ru',194,0.2233,158),(37,'ru',210,0.2233,95),(37,'ru',213,0.2233,85),(37,'ru',315,0.2233,117),(37,'ru',345,0.2233,65),(37,'ru',370,0.2233,138),(37,'ru',402,0.2233,104),(37,'ru',406,0.2233,123),(37,'ru',436,0.2233,63),(37,'ru',497,0.2233,161),(37,'ru',572,0.2233,66),(37,'ru',617,0.2233,80),(37,'ru',915,0.2233,93),(37,'ru',923,0.2233,151),(37,'ru',928,0.2233,57),(37,'ru',940,0.3642,96.6),(37,'ru',941,0.2233,58),(37,'ru',942,0.2233,61),(37,'ru',943,0.2233,64),(37,'ru',944,0.2233,74),(37,'ru',945,0.2233,75),(37,'ru',946,0.2233,79),(37,'ru',947,0.2233,81),(37,'ru',948,0.2233,82),(37,'ru',949,0.2233,84),(37,'ru',950,0.2233,96),(37,'ru',951,0.2233,97),(37,'ru',952,0.3271,127.5),(37,'ru',953,0.2233,102),(37,'ru',954,0.2233,103),(37,'ru',955,0.2233,106),(37,'ru',956,0.2233,107),(37,'ru',957,0.2233,109),(37,'ru',958,0.2233,116),(37,'ru',959,0.2233,118),(37,'ru',960,0.2233,119),(37,'ru',961,0.2233,120),(37,'ru',962,0.2233,122),(37,'ru',963,0.2233,124),(37,'ru',964,0.2233,125),(37,'ru',965,0.2233,128),(37,'ru',966,0.2233,131),(37,'ru',967,0.2233,133),(37,'ru',968,0.2233,150),(37,'ru',969,0.2233,152),(37,'ru',970,0.2233,160),(38,'ru',75,0.224,113),(38,'ru',145,0.224,108),(38,'ru',185,0.3281,89),(38,'ru',191,0.3281,125.5),(38,'ru',229,0.224,127),(38,'ru',263,0.224,69),(38,'ru',290,0.224,129),(38,'ru',291,0.224,129),(38,'ru',292,0.224,129),(38,'ru',316,0.224,103),(38,'ru',392,0.224,81),(38,'ru',400,0.224,52),(38,'ru',459,0.224,126),(38,'ru',462,0.224,134),(38,'ru',468,0.224,122),(38,'ru',699,0.3281,57),(38,'ru',842,0.224,135),(38,'ru',853,0.224,125),(38,'ru',867,0.224,102),(38,'ru',869,0.224,99),(38,'ru',882,0.224,98),(38,'ru',899,0.3281,58.5),(38,'ru',914,0.224,140),(38,'ru',927,0.224,96),(38,'ru',959,0.3967,87.6667),(38,'ru',971,0.3653,65.4),(38,'ru',972,0.224,50),(38,'ru',973,0.224,57),(38,'ru',974,0.224,59),(38,'ru',975,0.224,60),(38,'ru',976,0.224,61),(38,'ru',977,0.224,65),(38,'ru',978,0.224,68),(38,'ru',979,0.224,71),(38,'ru',980,0.224,73),(38,'ru',981,0.224,79),(38,'ru',982,0.224,82),(38,'ru',983,0.224,83),(38,'ru',984,0.224,84),(38,'ru',985,0.224,86),(38,'ru',986,0.224,87),(38,'ru',987,0.224,88),(38,'ru',988,0.224,89),(38,'ru',989,0.224,95),(38,'ru',990,0.224,97),(38,'ru',991,0.224,101),(38,'ru',992,0.224,104),(38,'ru',993,0.224,107),(38,'ru',994,0.224,109),(38,'ru',995,0.224,110),(38,'ru',996,0.224,111),(38,'ru',997,0.3281,121),(38,'ru',998,0.224,121),(38,'ru',999,0.224,123),(38,'ru',1000,0.224,130),(38,'ru',1001,0.224,132),(38,'ru',1002,0.224,137),(38,'ru',1003,0.224,138),(38,'ru',1004,0.224,139),(39,'ru',49,0.2577,59.5),(39,'ru',149,0.2577,87.5),(39,'ru',174,0.2577,71.5),(39,'ru',277,0.2577,92.5),(39,'ru',284,0.1626,1),(39,'ru',316,0.2577,83.5),(39,'ru',394,0.2577,85.5),(39,'ru',774,0.2577,89.5),(39,'ru',814,0.2577,44.5),(39,'ru',849,0.2577,46.5),(39,'ru',878,0.2577,42.5),(39,'ru',900,0.3776,52.5),(39,'ru',913,0.2577,90.5),(39,'ru',915,0.2577,93.5),(39,'ru',958,0.2577,88.5),(39,'ru',959,0.2577,36.5),(39,'ru',962,0.2577,76.5),(39,'ru',1005,0.3776,60),(39,'ru',1006,0.2577,37.5),(39,'ru',1007,0.2577,39.5),(39,'ru',1008,0.2577,43.5),(39,'ru',1009,0.2577,54.5),(39,'ru',1010,0.2577,56.5),(39,'ru',1011,0.2577,57.5),(39,'ru',1012,0.2577,58.5),(39,'ru',1013,0.2577,61.5),(39,'ru',1014,0.2577,62.5),(39,'ru',1015,0.2577,64.5),(39,'ru',1016,0.2577,70.5),(39,'ru',1017,0.2577,72.5),(39,'ru',1018,0.2577,73.5),(39,'ru',1019,0.2577,75.5),(39,'ru',1020,0.2577,82.5),(39,'ru',1021,0.2577,91.5),(40,'ru',33,0.25,57),(40,'ru',60,0.25,31),(40,'ru',95,0.1577,102),(40,'ru',185,0.25,62),(40,'ru',191,0.25,52),(40,'ru',229,0.1577,129),(40,'ru',256,0.1577,133),(40,'ru',392,0.25,42),(40,'ru',394,0.1577,98),(40,'ru',409,0.25,35),(40,'ru',444,0.1577,100),(40,'ru',568,0.25,55),(40,'ru',787,0.25,60),(40,'ru',798,0.1577,130),(40,'ru',831,0.1577,112),(40,'ru',833,0.3662,66),(40,'ru',834,0.25,27),(40,'ru',842,0.25,53),(40,'ru',867,0.1577,103),(40,'ru',869,0.1577,104),(40,'ru',959,0.25,33),(40,'ru',965,0.1577,118),(40,'ru',977,0.25,38),(40,'ru',978,0.3155,19),(40,'ru',1022,0.25,30),(40,'ru',1023,0.25,32),(40,'ru',1024,0.3662,46),(40,'ru',1025,0.25,39),(40,'ru',1026,0.25,40),(40,'ru',1027,0.25,41),(40,'ru',1028,0.25,48),(40,'ru',1029,0.25,51),(40,'ru',1030,0.25,56),(40,'ru',1031,0.25,59),(40,'ru',1032,0.25,61),(40,'ru',1033,0.25,63),(40,'ru',1034,0.25,65),(40,'ru',1035,0.25,66),(40,'ru',1036,0.25,68),(40,'ru',1037,0.1577,110),(40,'ru',1038,0.1577,114),(40,'ru',1039,0.1577,115),(40,'ru',1040,0.1577,117),(40,'ru',1041,0.1577,124),(40,'ru',1042,0.1577,125),(40,'ru',1043,0.1577,126),(40,'ru',1044,0.1577,131),(41,'ru',50,0.3042,46.5),(41,'ru',277,0.3042,38.5),(41,'ru',343,0.3042,29.5),(41,'ru',379,0.3042,39.5),(41,'ru',403,0.3042,21.5),(41,'ru',408,0.3042,40.5),(41,'ru',410,0.3042,23.5),(41,'ru',436,0.3042,45.5),(41,'ru',637,0.3042,28.5),(41,'ru',833,0.3042,20.5),(41,'ru',842,0.3042,19.5),(41,'ru',1045,0.192,1),(41,'ru',1046,0.3042,25.5),(41,'ru',1047,0.3042,26.5),(41,'ru',1048,0.3042,30.5),(41,'ru',1049,0.3042,32.5),(41,'ru',1050,0.3042,41.5),(41,'ru',1051,0.3042,43.5),(41,'ru',1052,0.3042,48.5),(42,'ru',224,0.2694,50.5),(42,'ru',292,0.2694,36.5),(42,'ru',327,0.2694,52.5),(42,'ru',387,0.2694,30.5),(42,'ru',415,0.2694,61.5),(42,'ru',432,0.2694,45.5),(42,'ru',444,0.2694,64.5),(42,'ru',610,0.2694,62.5),(42,'ru',700,0.2694,43.5),(42,'ru',865,0.2694,60.5),(42,'ru',866,0.3947,34.5),(42,'ru',929,0.2694,67.5),(42,'ru',1032,0.2694,66.5),(42,'ru',1053,0.34,18.6667),(42,'ru',1054,0.2694,28.5),(42,'ru',1055,0.2694,31.5),(42,'ru',1056,0.2694,32.5),(42,'ru',1057,0.2694,33.5),(42,'ru',1058,0.2694,34.5),(42,'ru',1059,0.2694,35.5),(42,'ru',1060,0.2694,44.5),(42,'ru',1061,0.2694,47.5),(42,'ru',1062,0.2694,48.5),(42,'ru',1063,0.2694,49.5),(42,'ru',1064,0.2694,51.5),(42,'ru',1065,0.2694,53.5),(42,'ru',1066,0.2694,59.5),(42,'ru',1067,0.2694,68.5),(43,'ru',43,0.2823,55),(43,'ru',210,0.2823,28),(43,'ru',394,0.2823,25),(43,'ru',400,0.4135,46),(43,'ru',402,0.2823,39),(43,'ru',498,0.2823,30),(43,'ru',842,0.2823,35),(43,'ru',866,0.5,34),(43,'ru',869,0.2823,62),(43,'ru',964,0.2823,31),(43,'ru',1025,0.2823,44),(43,'ru',1068,0.4604,31.4),(43,'ru',1069,0.2823,24),(43,'ru',1070,0.2823,26),(43,'ru',1071,0.2823,40),(43,'ru',1072,0.2823,43),(43,'ru',1073,0.2823,52),(43,'ru',1074,0.2823,53),(43,'ru',1075,0.2823,58),(43,'ru',1076,0.2823,59),(44,'ru',191,0.2823,51),(44,'ru',225,0.2823,46),(44,'ru',327,0.2823,33),(44,'ru',394,0.2823,22),(44,'ru',830,0.2823,31),(44,'ru',842,0.2823,50),(44,'ru',866,0.5,30.3333),(44,'ru',942,0.2823,53),(44,'ru',958,0.2823,29),(44,'ru',1005,0.2823,21),(44,'ru',1018,0.2823,38),(44,'ru',1032,0.2823,49),(44,'ru',1065,0.2823,34),(44,'ru',1070,0.2823,23),(44,'ru',1077,0.3562,16.3333),(44,'ru',1078,0.2823,25),(44,'ru',1079,0.2823,26),(44,'ru',1080,0.2823,27),(44,'ru',1081,0.2823,30),(44,'ru',1082,0.2823,35),(44,'ru',1083,0.2823,37),(44,'ru',1084,0.2823,47),(45,'ru',55,0.2742,73.5),(45,'ru',190,0.2742,38.5),(45,'ru',290,0.2742,42.5),(45,'ru',291,0.4016,48),(45,'ru',292,0.2742,42.5),(45,'ru',321,0.2742,40.5),(45,'ru',671,0.2742,48.5),(45,'ru',830,0.2742,34.5),(45,'ru',865,0.2742,29.5),(45,'ru',866,0.2742,30.5),(45,'ru',874,0.2742,60.5),(45,'ru',894,0.2742,50.5),(45,'ru',909,0.2742,36.5),(45,'ru',1065,0.2742,32.5),(45,'ru',1085,0.173,1),(45,'ru',1086,0.2742,28.5),(45,'ru',1087,0.2742,37.5),(45,'ru',1088,0.2742,41.5),(45,'ru',1089,0.2742,51.5),(45,'ru',1090,0.2742,52.5),(45,'ru',1091,0.2742,56.5),(45,'ru',1092,0.2742,57.5),(45,'ru',1093,0.2742,59.5),(45,'ru',1094,0.2742,63.5),(45,'ru',1095,0.2742,65.5),(45,'ru',1096,0.2742,72.5),(45,'ru',1097,0.2742,75.5),(46,'ru',191,0.2613,68.5),(46,'ru',281,0.2613,63.5),(46,'ru',379,0.2613,57.5),(46,'ru',382,0.2613,38.5),(46,'ru',460,0.2613,61.5),(46,'ru',741,0.2613,56.5),(46,'ru',815,0.2613,36.5),(46,'ru',841,0.3828,53),(46,'ru',856,0.2613,29.5),(46,'ru',861,0.2613,32.5),(46,'ru',866,0.4628,41.8333),(46,'ru',964,0.2613,66.5),(46,'ru',975,0.2613,62.5),(46,'ru',1005,0.2613,27.5),(46,'ru',1065,0.2613,33.5),(46,'ru',1070,0.2613,48.5),(46,'ru',1071,0.2613,70.5),(46,'ru',1081,0.2613,30.5),(46,'ru',1098,0.1649,1),(46,'ru',1099,0.2613,35.5),(46,'ru',1100,0.2613,37.5),(46,'ru',1101,0.2613,41.5),(46,'ru',1102,0.2613,42.5),(46,'ru',1103,0.2613,44.5),(46,'ru',1104,0.2613,46.5),(46,'ru',1105,0.2613,54.5),(46,'ru',1106,0.2613,58.5),(46,'ru',1107,0.2613,59.5),(46,'ru',1108,0.2613,72.5),(46,'ru',1109,0.3828,72.5),(47,'ru',174,0.2921,27),(47,'ru',191,0.2921,50),(47,'ru',403,0.2921,44),(47,'ru',439,0.2921,41),(47,'ru',460,0.2921,49),(47,'ru',462,0.2921,43),(47,'ru',679,0.2921,40),(47,'ru',818,0.2921,42),(47,'ru',854,0.2921,26),(47,'ru',856,0.2921,32),(47,'ru',866,0.2921,24),(47,'ru',927,0.2921,46),(47,'ru',931,0.2921,45),(47,'ru',1005,0.2921,20),(47,'ru',1018,0.2921,23),(47,'ru',1032,0.2921,48),(47,'ru',1078,0.2921,28),(47,'ru',1079,0.2921,29),(47,'ru',1080,0.2921,30),(47,'ru',1081,0.2921,33),(47,'ru',1105,0.2921,21),(47,'ru',1110,0.1843,1),(48,'ru',75,0.2754,57.5),(48,'ru',225,0.2754,38.5),(48,'ru',379,0.2754,26.5),(48,'ru',402,0.2754,42.5),(48,'ru',459,0.2754,55.5),(48,'ru',518,0.2754,60.5),(48,'ru',519,0.2754,61.5),(48,'ru',741,0.2754,48.5),(48,'ru',815,0.2754,32.5),(48,'ru',830,0.2754,35.5),(48,'ru',842,0.2754,27.5),(48,'ru',847,0.1738,2),(48,'ru',854,0.2754,30.5),(48,'ru',866,0.4035,40.5),(48,'ru',1018,0.2754,53.5),(48,'ru',1032,0.2754,41.5),(48,'ru',1065,0.2754,37.5),(48,'ru',1099,0.2754,31.5),(48,'ru',1105,0.2754,63.5),(48,'ru',1111,0.1738,1),(48,'ru',1112,0.2754,25.5),(48,'ru',1113,0.2754,34.5),(48,'ru',1114,0.2754,39.5),(48,'ru',1115,0.2754,50.5),(48,'ru',1116,0.2754,58.5),(48,'ru',1117,0.2754,59.5),(48,'ru',1118,0.2754,64.5),(49,'ru',191,0.3667,5),(49,'ru',327,0.3667,4),(49,'ru',833,0.2314,4),(49,'ru',1119,0.2314,3),(49,'ru',1120,0.2314,6),(50,'ru',191,0.2314,2),(50,'ru',842,0.2314,1),(50,'ru',866,0.2314,5),(50,'ru',959,0.2314,4),(50,'ru',1119,0.2314,3),(51,'ru',191,0.2314,1),(51,'ru',387,0.2314,3),(51,'ru',866,0.2314,8),(51,'ru',959,0.2314,6),(51,'ru',1121,0.2314,4),(51,'ru',1122,0.2314,5),(52,'ru',191,0.3667,4.5),(52,'ru',327,0.2314,5),(52,'ru',388,0.3667,3.5),(52,'ru',866,0.2314,4),(52,'ru',1123,0.2314,3),(53,'ru',1,0.1417,173),(53,'ru',10,0.2246,11),(53,'ru',33,0.2246,98),(53,'ru',50,0.1417,81),(53,'ru',89,0.2246,139.5),(53,'ru',119,0.1417,75),(53,'ru',124,0.1417,170),(53,'ru',131,0.1417,144),(53,'ru',148,0.2246,101.5),(53,'ru',157,0.1417,74),(53,'ru',160,0.2835,30.3333),(53,'ru',173,0.1417,168),(53,'ru',191,0.3979,67),(53,'ru',194,0.1417,57),(53,'ru',229,0.1417,178),(53,'ru',290,0.1417,77),(53,'ru',291,0.1417,77),(53,'ru',292,0.1417,77),(53,'ru',297,0.2246,151.5),(53,'ru',300,0.2246,152.5),(53,'ru',343,0.1417,105),(53,'ru',347,0.2246,43),(53,'ru',348,0.3291,101),(53,'ru',366,0.2246,134),(53,'ru',372,0.1417,28),(53,'ru',380,0.1417,55),(53,'ru',392,0.1417,32),(53,'ru',396,0.1417,195),(53,'ru',399,0.1417,92),(53,'ru',400,0.1417,104),(53,'ru',402,0.1417,58),(53,'ru',409,0.1417,48),(53,'ru',415,0.1417,155),(53,'ru',428,0.2246,161),(53,'ru',431,0.1417,179),(53,'ru',441,0.1417,51),(53,'ru',442,0.1417,52),(53,'ru',443,0.2835,11.6667),(53,'ru',447,0.1417,119),(53,'ru',448,0.1417,159),(53,'ru',465,0.2835,141),(53,'ru',510,0.1417,39),(53,'ru',563,0.1417,135),(53,'ru',607,0.2246,13),(53,'ru',609,0.3291,170.75),(53,'ru',660,0.1417,146),(53,'ru',672,0.1417,161),(53,'ru',694,0.1417,76),(53,'ru',724,0.1417,70),(53,'ru',924,0.1417,91),(53,'ru',961,0.2246,32.5),(53,'ru',1018,0.1417,84),(53,'ru',1032,0.1417,83),(53,'ru',1041,0.2246,142.5),(53,'ru',1047,0.1417,103),(53,'ru',1124,0.2246,12),(53,'ru',1125,0.1417,26),(53,'ru',1126,0.1417,30),(53,'ru',1127,0.1417,31),(53,'ru',1128,0.1417,33),(53,'ru',1129,0.1417,34),(53,'ru',1130,0.1417,35),(53,'ru',1131,0.1417,37),(53,'ru',1132,0.1417,40),(53,'ru',1133,0.1417,41),(53,'ru',1134,0.1417,50),(53,'ru',1135,0.1417,59),(53,'ru',1136,0.1417,60),(53,'ru',1137,0.1417,73),(53,'ru',1138,0.1417,86),(53,'ru',1139,0.1417,89),(53,'ru',1140,0.1417,98),(53,'ru',1141,0.1417,101),(53,'ru',1142,0.2246,115),(53,'ru',1143,0.2835,148),(53,'ru',1144,0.1417,118),(53,'ru',1145,0.1417,122),(53,'ru',1146,0.1417,126),(53,'ru',1147,0.1417,130),(53,'ru',1148,0.1417,136),(53,'ru',1149,0.1417,137),(53,'ru',1150,0.1417,145),(53,'ru',1151,0.1417,148),(53,'ru',1152,0.1417,149),(53,'ru',1153,0.1417,154),(53,'ru',1154,0.1417,157),(53,'ru',1155,0.1417,160),(53,'ru',1156,0.1417,167),(53,'ru',1157,0.1417,171),(53,'ru',1158,0.1417,172),(53,'ru',1159,0.1417,174),(53,'ru',1160,0.1417,180),(53,'ru',1161,0.1417,192),(53,'ru',1162,0.1417,193),(53,'ru',1163,0.1417,196),(53,'ru',1164,0.2246,203),(53,'ru',1165,0.1417,199),(53,'ru',1166,0.1417,207),(53,'ru',1167,0.1417,209),(54,'ru',1,0.2424,4),(54,'ru',45,0.2424,76),(54,'ru',53,0.1529,4),(54,'ru',54,0.1529,66),(54,'ru',55,0.1529,26),(54,'ru',66,0.1529,62),(54,'ru',96,0.1529,124),(54,'ru',114,0.2424,95),(54,'ru',138,0.1529,25),(54,'ru',149,0.1529,87),(54,'ru',191,0.3551,57),(54,'ru',347,0.1529,138),(54,'ru',379,0.1529,77),(54,'ru',394,0.1529,9),(54,'ru',397,0.1529,2),(54,'ru',400,0.2424,74),(54,'ru',402,0.1529,122),(54,'ru',405,0.1529,58),(54,'ru',408,0.1529,94),(54,'ru',415,0.1529,101),(54,'ru',425,0.1529,95),(54,'ru',426,0.1529,42),(54,'ru',430,0.1529,28),(54,'ru',433,0.1529,20),(54,'ru',437,0.1529,40),(54,'ru',438,0.1529,21),(54,'ru',439,0.3058,36.3333),(54,'ru',460,0.1529,74),(54,'ru',462,0.1529,91),(54,'ru',465,0.2424,52),(54,'ru',509,0.1529,97),(54,'ru',582,0.1529,34),(54,'ru',607,0.3551,44.5),(54,'ru',660,0.1529,96),(54,'ru',673,0.1529,121),(54,'ru',674,0.2424,121),(54,'ru',729,0.1529,50),(54,'ru',821,0.2424,75.5),(54,'ru',869,0.1529,128),(54,'ru',953,0.1529,36),(54,'ru',1146,0.1529,57),(54,'ru',1148,0.1529,76),(54,'ru',1150,0.1529,52),(54,'ru',1168,0.1529,5),(54,'ru',1169,0.1529,6),(54,'ru',1170,0.1529,16),(54,'ru',1171,0.1529,18),(54,'ru',1172,0.1529,22),(54,'ru',1173,0.1529,23),(54,'ru',1174,0.1529,27),(54,'ru',1175,0.1529,29),(54,'ru',1176,0.1529,35),(54,'ru',1177,0.1529,38),(54,'ru',1178,0.1529,41),(54,'ru',1179,0.1529,49),(54,'ru',1180,0.1529,51),(54,'ru',1181,0.1529,55),(54,'ru',1182,0.2424,70.5),(54,'ru',1183,0.1529,60),(54,'ru',1184,0.1529,61),(54,'ru',1185,0.1529,63),(54,'ru',1186,0.1529,65),(54,'ru',1187,0.1529,75),(54,'ru',1188,0.1529,84),(54,'ru',1189,0.1529,88),(54,'ru',1190,0.1529,90),(54,'ru',1191,0.1529,92),(54,'ru',1192,0.1529,98),(54,'ru',1193,0.2424,112.5),(54,'ru',1194,0.1529,109),(54,'ru',1195,0.1529,116),(54,'ru',1196,0.1529,126),(54,'ru',1197,0.1529,139),(54,'ru',1198,0.1529,140),(54,'ru',1199,0.1529,141),(54,'ru',1200,0.1529,142),(55,'ru',9,0.1738,19),(55,'ru',66,0.2754,26),(55,'ru',77,0.1738,15),(55,'ru',82,0.1738,47),(55,'ru',98,0.1738,3),(55,'ru',115,0.1738,42),(55,'ru',191,0.1738,29),(55,'ru',348,0.2754,32),(55,'ru',387,0.1738,2),(55,'ru',397,0.1738,16),(55,'ru',443,0.2754,36),(55,'ru',454,0.2754,49),(55,'ru',455,0.1738,33),(55,'ru',458,0.1738,14),(55,'ru',563,0.1738,13),(55,'ru',664,0.1738,28),(55,'ru',680,0.1738,22),(55,'ru',791,0.1738,64),(55,'ru',956,0.1738,24),(55,'ru',968,0.1738,55),(55,'ru',1201,0.1738,1),(55,'ru',1202,0.1738,4),(55,'ru',1203,0.1738,5),(55,'ru',1204,0.1738,6),(55,'ru',1205,0.1738,7),(55,'ru',1206,0.1738,8),(55,'ru',1207,0.1738,10),(55,'ru',1208,0.1738,17),(55,'ru',1209,0.1738,20),(55,'ru',1210,0.1738,21),(55,'ru',1211,0.1738,23),(55,'ru',1212,0.1738,25),(55,'ru',1213,0.1738,26),(55,'ru',1214,0.1738,30),(55,'ru',1215,0.1738,31),(55,'ru',1216,0.1738,32),(55,'ru',1217,0.1738,36),(55,'ru',1218,0.1738,43),(55,'ru',1219,0.1738,44),(55,'ru',1220,0.1738,45),(55,'ru',1221,0.1738,48),(55,'ru',1222,0.1738,49),(55,'ru',1223,0.1738,50),(55,'ru',1224,0.1738,51),(55,'ru',1225,0.1738,53),(55,'ru',1226,0.1738,54),(55,'ru',1227,0.1738,56),(55,'ru',1228,0.1738,62),(55,'ru',1229,0.1738,65),(55,'ru',1230,0.1738,66),(56,'ru',77,0.3252,43.3333),(56,'ru',83,0.1626,32),(56,'ru',98,0.1626,3),(56,'ru',109,0.1626,45),(56,'ru',115,0.1626,62),(56,'ru',163,0.1626,53),(56,'ru',297,0.1626,24),(56,'ru',299,0.1626,25),(56,'ru',300,0.2577,25),(56,'ru',369,0.1626,28),(56,'ru',458,0.1626,6),(56,'ru',526,0.1626,41),(56,'ru',528,0.1626,13),(56,'ru',544,0.1626,7),(56,'ru',553,0.1626,5),(56,'ru',572,0.2577,46),(56,'ru',576,0.1626,1),(56,'ru',680,0.1626,18),(56,'ru',926,0.1626,44),(56,'ru',942,0.1626,47),(56,'ru',956,0.1626,40),(56,'ru',968,0.1626,67),(56,'ru',1106,0.1626,26),(56,'ru',1147,0.1626,14),(56,'ru',1203,0.1626,15),(56,'ru',1204,0.1626,16),(56,'ru',1210,0.1626,17),(56,'ru',1211,0.1626,19),(56,'ru',1218,0.1626,83),(56,'ru',1220,0.1626,84),(56,'ru',1221,0.1626,55),(56,'ru',1222,0.1626,88),(56,'ru',1223,0.1626,89),(56,'ru',1224,0.1626,90),(56,'ru',1226,0.1626,93),(56,'ru',1227,0.1626,68),(56,'ru',1228,0.1626,74),(56,'ru',1229,0.1626,65),(56,'ru',1230,0.1626,66),(56,'ru',1231,0.3252,31),(56,'ru',1232,0.1626,4),(56,'ru',1233,0.1626,10),(56,'ru',1234,0.2577,23.5),(56,'ru',1235,0.1626,21),(56,'ru',1236,0.2577,21),(56,'ru',1237,0.1626,22),(56,'ru',1238,0.1626,30),(56,'ru',1239,0.1626,31),(56,'ru',1240,0.1626,33),(56,'ru',1241,0.1626,34),(56,'ru',1242,0.1626,49),(56,'ru',1243,0.2577,54),(56,'ru',1244,0.1626,54),(56,'ru',1245,0.1626,63),(56,'ru',1246,0.1626,75),(56,'ru',1247,0.1626,78),(56,'ru',1248,0.1626,80),(56,'ru',1249,0.1626,81),(56,'ru',1250,0.1626,82),(56,'ru',1251,0.1626,85),(56,'ru',1252,0.1626,87),(56,'ru',1253,0.1626,92),(57,'ru',2,0.1626,5),(57,'ru',31,0.1626,49),(57,'ru',50,0.1626,32),(57,'ru',77,0.3776,47.25),(57,'ru',83,0.1626,27),(57,'ru',98,0.1626,6),(57,'ru',115,0.1626,61),(57,'ru',127,0.1626,52),(57,'ru',213,0.1626,29),(57,'ru',232,0.1626,25),(57,'ru',360,0.1626,79),(57,'ru',410,0.3252,23.3333),(57,'ru',458,0.1626,17),(57,'ru',660,0.1626,4),(57,'ru',710,0.2577,53),(57,'ru',792,0.1626,56),(57,'ru',798,0.1626,87),(57,'ru',828,0.1626,31),(57,'ru',834,0.1626,60),(57,'ru',853,0.1626,50),(57,'ru',898,0.1626,55),(57,'ru',949,0.1626,57),(57,'ru',956,0.1626,38),(57,'ru',968,0.1626,99),(57,'ru',1157,0.1626,2),(57,'ru',1202,0.1626,14),(57,'ru',1203,0.1626,15),(57,'ru',1204,0.1626,16),(57,'ru',1218,0.1626,85),(57,'ru',1220,0.2577,92),(57,'ru',1222,0.1626,95),(57,'ru',1227,0.1626,100),(57,'ru',1228,0.1626,106),(57,'ru',1234,0.1626,21),(57,'ru',1246,0.1626,62),(57,'ru',1254,0.2577,10),(57,'ru',1255,0.1626,7),(57,'ru',1256,0.1626,13),(57,'ru',1257,0.1626,20),(57,'ru',1258,0.1626,22),(57,'ru',1259,0.1626,24),(57,'ru',1260,0.1626,26),(57,'ru',1261,0.1626,28),(57,'ru',1262,0.1626,30),(57,'ru',1263,0.1626,41),(57,'ru',1264,0.1626,42),(57,'ru',1265,0.1626,45),(57,'ru',1266,0.1626,46),(57,'ru',1267,0.1626,47),(57,'ru',1268,0.2577,47),(57,'ru',1269,0.1626,51),(57,'ru',1270,0.1626,53),(57,'ru',1271,0.1626,54),(57,'ru',1272,0.1626,59),(57,'ru',1273,0.1626,65),(57,'ru',1274,0.1626,67),(57,'ru',1275,0.1626,68),(57,'ru',1276,0.1626,76),(57,'ru',1277,0.1626,77),(57,'ru',1278,0.1626,78),(57,'ru',1279,0.1626,88),(57,'ru',1280,0.1626,96),(58,'ru',10,0.4665,75.5),(58,'ru',48,0.3417,70),(58,'ru',77,0.3417,66),(58,'ru',348,0.3417,68),(58,'ru',410,0.3417,73),(58,'ru',418,0.3417,61),(58,'ru',436,0.3417,91),(58,'ru',510,0.3417,92),(58,'ru',574,0.3417,71),(58,'ru',575,0.1472,155),(58,'ru',576,0.1472,156),(58,'ru',613,0.3417,82),(58,'ru',738,0.3417,85),(58,'ru',939,0.3417,76),(58,'ru',945,0.3417,62),(58,'ru',1082,0.3417,90),(58,'ru',1281,0.1472,1),(58,'ru',1282,0.1472,2),(58,'ru',1283,0.2333,2),(58,'ru',1284,0.4665,74.5),(58,'ru',1285,0.3417,65),(58,'ru',1286,0.3417,72),(58,'ru',1287,0.3417,75),(58,'ru',1288,0.3417,78),(58,'ru',1289,0.3417,79),(58,'ru',1290,0.3417,80),(58,'ru',1291,0.3417,83),(58,'ru',1292,0.3417,84),(58,'ru',1293,0.3417,88),(58,'ru',1294,0.1472,157),(59,'ru',10,0.4684,75.5),(59,'ru',22,0.1478,156),(59,'ru',48,0.3431,70),(59,'ru',77,0.3431,66),(59,'ru',348,0.3431,68),(59,'ru',410,0.3431,73),(59,'ru',418,0.3431,61),(59,'ru',436,0.3431,91),(59,'ru',510,0.3431,92),(59,'ru',574,0.3431,71),(59,'ru',613,0.3431,82),(59,'ru',738,0.3431,85),(59,'ru',767,0.1478,1),(59,'ru',939,0.3431,76),(59,'ru',945,0.3431,62),(59,'ru',1082,0.3431,90),(59,'ru',1284,0.4684,74.5),(59,'ru',1285,0.3431,65),(59,'ru',1286,0.3431,72),(59,'ru',1287,0.3431,75),(59,'ru',1288,0.3431,78),(59,'ru',1289,0.3431,79),(59,'ru',1290,0.3431,80),(59,'ru',1291,0.3431,83),(59,'ru',1292,0.3431,84),(59,'ru',1293,0.3431,88),(59,'ru',1295,0.1478,2),(59,'ru',1296,0.1478,2),(59,'ru',1297,0.1478,155),(60,'ru',25,0.3229,110.25),(60,'ru',45,0.3229,114.25),(60,'ru',48,0.3229,124.25),(60,'ru',408,0.3229,106.25),(60,'ru',418,0.3229,134.25),(60,'ru',471,0.3229,116.25),(60,'ru',518,0.3229,131.25),(60,'ru',519,0.3229,132.25),(60,'ru',574,0.3229,125.25),(60,'ru',610,0.3229,86.25),(60,'ru',722,0.3229,121.25),(60,'ru',841,0.3229,105.25),(60,'ru',850,0.3229,109.25),(60,'ru',1073,0.3229,113.25),(60,'ru',1078,0.3229,87.25),(60,'ru',1143,0.3229,100.25),(60,'ru',1237,0.3229,119.25),(60,'ru',1259,0.3229,91.25),(60,'ru',1292,0.4409,121.25),(60,'ru',1298,0.1391,1),(60,'ru',1299,0.1391,2),(60,'ru',1300,0.2204,2),(60,'ru',1301,0.3229,88.25),(60,'ru',1302,0.3229,90.25),(60,'ru',1303,0.3229,92.25),(60,'ru',1304,0.5147,109.583),(60,'ru',1305,0.3229,102.25),(60,'ru',1306,0.3229,107.25),(60,'ru',1307,0.3229,112.25),(60,'ru',1308,0.3229,115.25),(60,'ru',1309,0.3229,117.25),(60,'ru',1310,0.4409,121.25),(60,'ru',1311,0.3229,135.25),(60,'ru',1312,0.3229,136.25),(60,'ru',1313,0.1391,230),(60,'ru',1314,0.1391,236),(61,'ru',25,0.3195,126),(61,'ru',45,0.3195,130),(61,'ru',48,0.3195,140),(61,'ru',195,0.1376,253),(61,'ru',408,0.3195,122),(61,'ru',418,0.3195,150),(61,'ru',471,0.3195,132),(61,'ru',518,0.3195,147),(61,'ru',519,0.3195,148),(61,'ru',574,0.3195,141),(61,'ru',575,0.1376,251),(61,'ru',576,0.1376,252),(61,'ru',610,0.3557,93.8),(61,'ru',722,0.3195,137),(61,'ru',841,0.3195,121),(61,'ru',850,0.3195,125),(61,'ru',1073,0.3195,129),(61,'ru',1078,0.3557,94.8),(61,'ru',1143,0.3557,107.8),(61,'ru',1237,0.3195,135),(61,'ru',1259,0.3557,98.8),(61,'ru',1292,0.4362,137),(61,'ru',1301,0.3557,95.8),(61,'ru',1302,0.3557,97.8),(61,'ru',1303,0.3557,99.8),(61,'ru',1304,0.5239,121),(61,'ru',1305,0.3195,118),(61,'ru',1306,0.3195,123),(61,'ru',1307,0.3195,128),(61,'ru',1308,0.3195,131),(61,'ru',1309,0.3195,133),(61,'ru',1310,0.4362,137),(61,'ru',1311,0.3195,151),(61,'ru',1312,0.3195,152),(61,'ru',1315,0.1376,1),(61,'ru',1316,0.1376,2),(61,'ru',1317,0.1376,254),(62,'ru',345,0.2314,3),(62,'ru',373,0.2314,12),(62,'ru',601,0.2314,10),(62,'ru',602,0.2314,13),(62,'ru',1320,0.2314,1),(62,'ru',1321,0.2314,4),(63,'ru',1318,0.2314,1),(64,'ru',4,0.2314,2),(64,'ru',5,0.2314,3),(64,'ru',1319,0.2314,1),(65,'ru',1203,0.2314,1),(66,'ru',1318,0.2314,1);
/*!40000 ALTER TABLE `b_search_content_stem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_text`
--

DROP TABLE IF EXISTS `b_search_content_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_text` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SEARCH_CONTENT_MD5` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `SEARCHABLE_CONTENT` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_text`
--

LOCK TABLES `b_search_content_text` WRITE;
/*!40000 ALTER TABLE `b_search_content_text` DISABLE KEYS */;
INSERT INTO `b_search_content_text` VALUES (1,'3140fa939e82d14de3829b731863cd80','УСЛУГИ\r\n\r\n'),(2,'43974ce3161b1536a23aab70dfdf083c','ПРОДУКЦИЯ\r\n\r\n'),(3,'0204ba1b914c4e49bb2549d6f83915c8','АРХИВ\r\nTEXT HERE....\r\n'),(4,'bc432db4993a16569c992496af655d10','АНОНСЫ\r\nTEXT HERE....\r\n'),(5,'bde10c5a5ff313832f71759e96417001','РАСПИСАНИЕ МЕРОПРИЯТИЙ\r\n\r\n'),(6,'01b241f580eb7d284dd883218ecccdaf','МЕБЕЛЬНАЯ КОМПАНИЯ\r\n\r\n'),(7,'626a5d1bd18fcc622fbe4e4e3619a88a','НОВОСТИ\r\n\r\n'),(8,'7fea2611f6380aa06712c840a50d11ca','-\r\n8 (495) 212-85-06\r9-00 18-00\r1\r1\r2\r2\r3\r4\r1\r1\r2\r2\r3\r4\r- - CTC-\r, , , .\n, , , .\n, , , .\n, 12 2020 ., , CTC-.\n:\r1\r2\r3\r \r!\r-.\r!\r560 \rA\r,\"+\"\r, , ...\r,\"+\"\r, , ...\r. , .12, 512\r8 (495) 212-85-06\r2000-2012 \" \"\r\n'),(9,'f689d34d5ebc0e796d166d06f274d4db','-\r\n8 (495) 212-85-06\r9-00 18-00\r1\r1\r2\r2\r3\r4\r1\r1\r2\r2\r3\r4\r12 2020 ., , CTC-\r, , , .\n12 2020 ., , RK-TELECOM\r, , , .\n12 2020 ., , .NET-DEV\r, -. , - , . , \n!\r-.\r!\r560 \rA\r,\"+\"\r, , ...\r,\"+\"\r, , ...\r. , .12, 512\r8 (495) 212-85-06\r2000-2012 \" \"\r\n'),(10,'be3fe2336ca014ea48484837a6379cf7','КАРТА САЙТА\r\n\r\n'),(11,'f58e028735b5d07233c4a161c9231405','ПОИСК\r\n\r\n'),(12,'17e08217818f62561b1d2f0f3a016a1f','МИССИЯ И СТРАТЕГИЯ\r\nМЕБЕЛЬНАЯ КОМПАНИЯ\r- ДИНАМИЧНО РАЗВИВАЮЩЕЕСЯ ПРОИЗВОДСТВЕННОЕ 							ПРЕДПРИЯТИЕ, КОТОРОЕ ИМЕЕТ ПЕРЕД СОБОЙ \nЯСНО ВЫРАЖЕННЫЕ ЦЕЛИ И ИНСТРУМЕНТЫ ДЛЯ 							ИХ ДОСТИЖЕНИ.МЫ ПРЕДОСТАВЛЯЕМ КАЖДОМУ ЛУЧШУЮ ВОЗМОЖНОСТЬ ОБУСТРОИТЬ СВОЕ ЖИЗНЕННОЕ \nИ РАБОЧЕЕ ПРОСТРАНСТВО.МЫ РАБОТАЕМ НА ДОЛГОСРОЧНУЮ ПЕРСПЕКТИВУ И ПРЕДЛАГАЕМ ОПТИМАЛЬНЫЕ 							РЕШЕНИЯ. КОМПАНИЯ \rМЕБЕЛЬНАЯ КОМПАНИЯ\r- \nНАДЕЖНЫЙ, ТЕХНОЛОГИЧНЫЙ, ГИБКИЙ ПОСТАВЩИК 							С БОЛЬШИМИ МОЩНОСТЯМИ. 						\rЦЕЛИ И ЗАДАЧИ\rОПРАВДЫВАТЬ ОЖИДАНИЯ ЗАКАЗЧИКА: КЛИЕНТ ВСЕГДА ПРАВ. ТОЛЬКО ПОТРЕБИТЕЛЬ ФОРМИРУЕТ 									ЕДИНУЮ СИСТЕМУ ВЗГЛЯДОВ НА КАЧЕСТВО \nВЫПУСКАЕМОЙ ПРОДУКЦИИ И РАБОТ.\rДОБИТЬСЯ ОТ РАБОТНИКОВ КОМПАНИИ ПОНИМАНИЯ ИХ ЛИЧНОЙ ОТВЕТСТВЕННОСТИ ЗА КАЧЕСТВО 									РАБОТ.\rПУТЕМ ПОВЫШЕНИЯ КАЧЕСТВА ПРОДУКЦИИ И РАБОТ ПОСТОЯННО УВЕЛИЧИВАТЬ ОБЪЕМЫ ПРОИЗВОДСТВА 									С ЦЕЛЬЮ ПОСЛЕДУЮЩЕГО РЕИНВЕСТИРОВАНИЯ \nПРИБЫЛИ В РАЗВИТИЕ КОМПАНИИ.\rОБЕСПЕЧИВАТЬ СТРОГОЕ СООТВЕТСТВИЕ ПРОИЗВОДИМОЙ ПРОДУКЦИИ ТРЕБОВАНИЯМ ПОТРЕБИТЕЛЕЙ, 									НОРМАМ И ПРАВИЛАМ \nБЕЗОПАСНОСТИ, ТРЕБОВАНИЯМ ЗАЩИТЫ ОКРУЖАЮЩЕЙ СРЕДЫ.\rПОЛИТИКА КОМПАНИИ\rПОСТОЯННОЕ СОВЕРШЕНСТВОВАНИЕ СИСТЕМЫ КАЧЕСТВА. СВОЕВРЕМЕННОЕ И ЭФФЕКТИВНОЕ ПРИНЯТИЕ 									КОРРЕКТИРУЮЩИХ МЕР .\rЗАБОТА О РАБОТНИКАХ КОМПАНИИ. СОЗДАНИЕ УСЛОВИЙ ТРУДА И ОСНАЩЕНИЕ РАБОЧИХ МЕСТ, СООТВЕТСТВУЮЩИХ 									ВСЕМ САНИТАРНЫМ \nИ ГИГИЕНИЧЕСКИМ НОРМАМ.\rПОВЫШЕНИЕ БЛАГОСОСТОЯНИЯ СОТРУДНИКОВ. ОБЕСПЕЧЕНИЕ МОРАЛЬНОГО И МАТЕРИАЛЬНОГО УДОВЛЕТВОРЕНИЯ 									РАБОТНИКОВ КОМПАНИИ.\rСИСТЕМАТИЧЕСКОЕ ОБУЧЕНИЕ РАБОТНИКОВ ВСЕХ УРОВНЕЙ С ЦЕЛЬЮ ПОСТОЯННОГО ПОВЫШЕНИЯ ИХ 									ПРОФЕССИОНАЛЬНОГО МАСТЕРСТВА.\rВНЕДРЕНИЕ ВЫСОКОПРОИЗВОДИТЕЛЬНОГО ОБОРУДОВАНИЯ И НОВЕЙШИХ ТЕХНОЛОГИЙ ДЛЯ ПОВЫШЕНИЯ 									ПРОИЗВОДИТЕЛЬНОСТИ ТРУДА, \nОПТИМИЗАЦИИ ЗАТРАТ И, КАК РЕЗУЛЬТАТ, СНИЖЕНИЯ ЦЕН 									НА ВЫПУСКАЕМУЮ ПРОДУКЦИЮ.\rСОЗДАНИЕ НОВЫХ РАБОЧИХ МЕСТ. ПРИВЛЕЧЕНИЕ НА РАБОТУ СПЕЦИАЛИСТОВ ВЫСОКОЙ КВАЛИФИКАЦИИ.\rВЫХОД НА МЕЖДУНАРОДНЫЙ РЫНОК.\rМЫ РАЗВИВАЕМ ДОВЕРИТЕЛЬНЫЕ ВЗАИМОВЫГОДНЫЕ ОТНОШЕНИЯ СО СВОИМИ ПАРТНЕРАМИ В ДОЛГОСРОЧНЫХ 							ИНТЕРЕСАХ НАШЕГО БИЗНЕСА. \nМЕБЕЛЬНАЯ КОМПАНИЯ\rОТВЕТСТВЕННО ОТНОСИТСЯ 							К ВЫПОЛНЕНИЮ ВЗЯТЫХ НА СЕБЯ ОБЯЗАТЕЛЬСТВ И ЖДЕТ ТАКОГО ЖЕ \nПОДХОДА К ДЕЛУ ОТ 							СВОИХ ПАРТНЕРОВ ПО БИЗНЕСУ. ЭТА ТРЕБОВАТЕЛЬНОСТЬ  ЗАЛОГ НАШЕЙ ДОЛГОСРОЧНОЙ ПРИБЫЛЬНОСТИ. 						\rСО ДНЯ СВОЕГО ОСНОВАНИЯ \rМЕБЕЛЬНАЯ КОМПАНИЯ\rСОДЕЙСТВУЕТ РОСТУ БЛАГОСОСТОЯНИЯ 							РЕГИОНОВ РОССИИ. МЫ ПОНИМАЕМ ВАЖНОСТЬ \nСОЦИАЛЬНОЙ ОТВЕТСТВЕННОСТИ НАШЕЙ КОМПАНИИ 							И ОСТАНЕМСЯ ПРИМЕРОМ В ВОПРОСАХ СОЦИАЛЬНОЙ ЗАЩИЩЕННОСТИ НАШИХ СОТРУДНИКОВ.\r\n'),(13,'55171aa121806afa21b564e0af9ed46f','ИСТОРИЯ\r\n1992Г. 								\rМЕБЕЛЬНАЯ КОМПАНИЯ\rНАЧИНАЛАСЬ С ИЗГОТОВЛЕНИЯ МЕБЕЛИ ДЛЯ ШКОЛ И ОФИСОВ. ПЕРВОЕ 									ПРОИЗВОДСТВО МЕБЕЛИ РАСПОЛАГАЛОСЬ В АРЕНДУЕМОЙ МАСТЕРСКОЙ, ПЛОЩАДЬЮ 400 М2 С ОДНИМ 									ДЕРЕВООБРАБАТЫВАЮЩИМ СТАНКОМ. В КОМПАНИИ РАБОТАЛО ДВАДЦАТЬ ЧЕЛОВЕК. ВСЕ ЗАРАБОТАННЫЕ 									СРЕДСТВА ВКЛАДЫВАЛИСЬ В РАЗВИТИЕ, ЧТО ПОЗВОЛИЛО МОЛОДОЙ КОМПАНИИ РАСТИ БЫСТРЫМИ 									ТЕМПАМИ. 								\r1993Г. 								\rВВЕДЕН В ЭКСПЛУАТАЦИЮ НОВЫЙ ЦЕХ ПЛОЩАДЬЮ 700 М2, СТАВШИЙ ПЕРВОЙ СОБСТВЕННОСТЬЮ 									\rМЕБЕЛЬНОЙ КОМПАНИИ\r. МОДЕРНИЗАЦИЯ ПРОИЗВОДСТВЕННОЙ БАЗЫ ПРЕДПРИЯТИЯ СТАЛА ХОРОШЕЙ 									ТРАДИЦИЕЙ. КОМПАНИЯ ПОСТЕПЕННО ПЕРЕШЛА К БОЛЕЕ СОВЕРШЕННОМУ ОБОРУДОВАНИЮ, ЧТО ПОЗВОЛИЛО 									ПОВЫСИТЬ УРОВЕНЬ КАЧЕСТВА ВЫПУСКАЕМОЙ ПРОДУКЦИИ И ЗНАЧИТЕЛЬНО УВЕЛИЧИТЬ ОБЪЕМЫ ПРОИЗВОДСТВА. 								\r1998Г. 								\rВ ВОРОНЕЖЕ ОТКРЫТ ПЕРВЫЙ ФИРМЕННЫЙ МАГАЗИН-САЛОН \rМЕБЕЛЬНАЯ КОМПАНИЯ\r. ШАГ ЗА ШАГОМ 									ПРОДУКЦИЯ ПРЕДПРИЯТИЯ ЗАВОЕВЫВАЛА РЕГИОНЫ СИБИРИ И УРАЛА, МОСКВЫ И ПОДМОСКОВЬЯ, 									ЮГА И СЕВЕРО-ЗАПАДА РОССИИ. ПРОИЗВОДСТВЕННЫЕ ПЛОЩАДИ КОМПАНИИ УВЕЛИЧЕНЫ ДО 5000 									М2. 								\r1999Г. 								\rМЕБЕЛЬНАЯ КОМПАНИЯ\rСТАЛА ДИПЛОМАНТОМ ОДНОЙ ИЗ САМЫХ ПРЕСТИЖНЫХ МЕЖДУНАРОДНЫХ 									ВЫСТАВОК \rЕВРОЭКСПОМЕБЕЛЬ-99\r- ПЕРВОЕ ОФИЦИАЛЬНОЕ ПРИЗНАНИЕ МЕБЕЛЬНОЙ ПРОДУКЦИИ 									МЕБЕЛЬНОЙ КОМПАНИИ. В ЭТОМ ЖЕ ГОДУ КОМПАНИЯ ВЫХОДИТ НА МИРОВОЙ РЫНОК. БЫЛ ЗАКЛЮЧЕН 									РЯД КОНТРАКТОВ НА ПОСТАВКУ МЕБЕЛИ В СТРАНЫ СНГ И БЛИЖНЕГО ЗАРУБЕЖЬЯ. 								\r2000Г. 								\rКОЛЛЕКТИВ КОМПАНИИ НАСЧИТЫВАЕТ БОЛЕЕ 500 СОТРУДНИКОВ. ЗАКЛЮЧАЮТСЯ НОВЫЕ КОНТРАКТ 									НА ПОСТАВКУ МЕБЕЛИ В ЕВРОПЕЙСКИЕ СТРАНЫ. 								\r2002Г. 								\rМЕБЕЛЬНАЯ КОМПАНИЯ\rВОШЛА В ДЕСЯТКУ ЛУЧШИХ ПРОИЗВОДИТЕЛЕЙ МЕБЕЛИ ПО ДАННЫМ ВЕДУЩИХ 									МЕБЕЛЬНЫХ САЛОНОВ РОССИИ, А ТАКЖЕ В ЧИСЛО ЛИДЕРОВ ОРГАНИЗАЦИОННОГО РАЗВИТИЯ. 								\r2003Г. 								\rПРИСТУПИЛИ К СТРОИТЕЛЬСТВУ СКЛАДА МАТЕРИАЛОВ. В МОСКВЕ ОТКРЫТ ФИЛИАЛ КОМПАНИИ. \nПРОВЕДЕНА ПЕРВАЯ КОНФЕРЕНЦИЯ ПАРТНЕРОВ, РЕЗУЛЬТАТОМ КОТОРОЙ СТАЛО УКРЕПЛЕНИЕ ВЗАИМОВЫГОДНЫХ 									ОТНОШЕНИЙ И ЗАКЛЮЧЕНИЕ ДИЛЕРСКИХ ДОГОВОРОВ. 								\r2004Г. 								\rЗАВЕРШЕНО СТРОИТЕЛЬСТВО И ОСНАЩЕНИЕ НОВОГО ПРОИЗВОДСТВЕННОГО КОРПУСА И СКЛАДА МАТЕРИАЛОВ. \nРАСШИРЕНО ПРЕДСТАВИТЕЛЬСТВО КОМПАНИИ НА РОССИЙСКОМ РЫНКЕ И ЗА РУБЕЖОМ. \nОТКРЫТО 									РЕГИОНАЛЬНОЕ ПРЕДСТАВИТЕЛЬСТВО \rМЕБЕЛЬНОЙ КОМПАНИИ\rВ ЕКАТЕРИНБУРГЕ. 								\r2005Г. 								\rКОМПАНИЯ ПРИОБРЕТАЕТ НОВОЕ ПРОИЗВОДСТВЕННОЕ ОБОРУДОВАНИЕ КОНЦЕРНА - УГЛОВУЮ ЛИНИЮ 									РАСКРОЯ МАТЕРИАЛОВ И ЛИНИЮ ЗАГРУЗКИ ВЫГРУЗКИ. \nНАЧИНАЕТСЯ ВЫПУСК ПРОДУКЦИИ В 									НАТУРАЛЬНОМ ШПОНЕ. ФОРМИРУЕТСЯ ОТДЕЛЬНЫЙ СКЛАД МАТЕРИАЛОВ И КОМПЛЕКТУЮЩИХ. \nВ ЭТОМ ЖЕ ГОДУ ОТКРЫВАЕТСЯ ФАБРИКА МЯГКОЙ МЕБЕЛИ \rМЕБЕЛЬПЛЮС\r2006Г. 								\rОТКРЫТЫ РЕГИОНАЛЬНЫЕ ПРЕДСТАВИТЕЛЬСТВА \rМЕБЕЛЬНОЙ КОМПАНИИ\rВ САНКТ-ПЕТЕРБУРГЕ 									И НИЖНЕМ НОВГОРОДЕ. \nРАЗВИВАЕТСЯ СОБСТВЕННАЯ РОЗНИЧНАЯ СЕТЬ ФИРМЕННЫХ МАГАЗИНОВ-САЛОНОВ 									НА ТЕРРИТОРИИ РОССИИ. 								\r2007Г. 								\rЗАВЕРШЕНО СТРОИТЕЛЬСТВО ВТОРОЙ ФАБРИКИ. ОБЩАЯ ПЛОЩАДЬ ПРОИЗВОДСВЕННО-СКЛАДСКИХ КОРПУСОВ 									КОМПАНИИ СОСТАВЛЯЕТ УЖЕ БОЛЕЕ 30000 М2. \nПРОВЕДЕНА ВТОРАЯ КОНФЕРЕНЦИЯ ПАРТНЕРОВ 									КОМПАНИИ \r\"ТЕХНОЛОГИЯ УСПЕШНОГО БИЗНЕСА\"\r. 								\r2008Г. 								\rОТКРЫТО НОВОЕ ПРЕДПРИЯТИЕ ДЛЯ ПРОИЗВОДСТВА МЕБЕЛИ ПО ИНДИВИДУАЛЬНЫМ ПРОЕКТАМ \rКОМФОРТ\r. \nМЕБЕЛЬНАЯ КОМПАНИЯ\rПРОДОЛЖАЕТ ОБНОВЛЕНИЕ ОБОРУДОВАНИЯ. 								\r2008Г. 								\rНОВЕЙШИМ ОБОРУДОВАНИЕМ УКОМПЛЕКТОВАНА ВТОРАЯ ФАБРИКА. ЗАПУЩЕНА ВТОРАЯ ПРОИЗВОДСТВЕННАЯ 									ЛИНИЯ. \nПРОВЕДЕНА ТРЕТЬЯ КОНФЕРЕНЦИЯ \rПАРТНЕРСТВО - БИЗНЕС СЕГОДНЯ\rПРИНЯТО РЕШЕНИЕ О СТРОИТЕЛЬСТВЕ ТРЕТЬЕЙ ФАБРИКИ. ПЛОЩАДЬ ПРОИЗВОДСТВЕННО  СКЛАДСКИХ 									КОРПУСОВ СОСТАВИТ БОЛЕЕ 70000М2. \nПО ВСЕЙ СТРАНЕ И ЗАРУБЕЖОМ ОТКРЫТО 37 МЕБЕЛЬНЫХ 									САЛОНОВ. \nВ КОМПАНИИ РАБОТАЕТ БОЛЕЕ ПОЛУТОРА ТЫСЯЧ СОТРУДНИКОВ.\r\n'),(14,'d6ae18283686e0f65091531174c8b418','ВАКАНСИИ\r\n\r\n'),(15,'b535d9cb75c64e695d6ebad33b22d99c','О КОМПАНИИ\r\nНАША КОМПАНИЯ СУЩЕСТВУЕТ НА РОССИЙСКОМ РЫНКЕ С 1992 ГОДА. ЗА ЭТО ВРЕМЯ \rМЕБЕЛЬНАЯ КОМПАНИЯ\rПРОШЛА БОЛЬШОЙ ПУТЬ ОТ МАЛЕНЬКОЙ ТОРГОВОЙ ФИРМЫ ДО ОДНОГО ИЗ КРУПНЕЙШИХ ПРОИЗВОДИТЕЛЕЙ КОРПУСНОЙ МЕБЕЛИ В РОССИИ. 						 \rГЛАВНОЕ ПРАВИЛО - ИНДИВИДУАЛЬНЫЙ ПОДХОД К КАЖДОМУ КЛИЕНТУ\rНА СЕГОДНЯШНИЙ ДЕНЬ НАМИ РАЗРАБОТАНО БОЛЕЕ ПЯТИСОТ МОДЕЛЕЙ ДЛЯ ОФИСА И ДОМА. ВМЕСТЕ С ТЕМ МЫ СТРЕМИМСЯ ОБЕСПЕЧИТЬ НЕПОВТОРИМОСТЬ СВОЕЙ ПРОДУКЦИИ. МЫ ИЗГОТОВИМ МЕБЕЛЬ ДЛЯ КУХНИ, ДЕТСКОЙ, ГОСТИНОЙ, СПАЛЬНОЙ ИЛИ ВАННОЙ КОМНАТЫ, МЕБЕЛЬ ДЛЯ ОФИСА ОСОБОГО ДИЗАЙНА И НЕСТАНДАРТНОГО РАЗМЕРА. \rНАШИ ДИЗАЙНЕРЫ ПРОИЗВЕДУТ ЗАМЕРЫ ПОМЕЩЕНИЯ И ВМЕСТЕ С ВАМИ РАЗРАБОТАЮТ ДИЗАЙН-ПРОЕКТ МЕБЕЛИ ДЛЯ ВАШЕГО ИНТЕРЬЕРА, ПОДОБРАВ С ВЫСОКОЙ ТОЧНОСТЬЮ РАЗМЕРЫ, МОДЕЛИ, ЦВЕТА, ПОМОГУТ ОПТИМАЛЬНО РАСПОЛОЖИТЬ МЕБЕЛЬ. \rВАШ ПРОЕКТ БУДЕТ СОЗДАН С УЧЕТОМ ВСЕХ НЮАНСОВ И ПРОРИСОВКОЙ МЕЛЬЧАЙШИХ ДЕТАЛЕЙ. РЕЗУЛЬТАТЫ СОВМЕСТНОГО ТВОРЧЕСТВА ВЫ СМОЖЕТЕ ПОСМОТРЕТЬ В ОБЪЕМНОМ ПРЕДСТАВЛЕНИИ. ВАМ НАГЛЯДНО ПРОДЕМОНСТРИРУЮТ, КАК БУДУТ ВЫГЛЯДЕТЬ В ЖИЗНИ ВЫБРАННЫЕ ЭЛЕМЕНТЫ ИНТЕРЬЕРА ПРИ РАЗНОМ ОСВЕЩЕНИИ, В КОНКРЕТНОМ ПОМЕЩЕНИИ, СДЕЛАННЫЕ ИЗ ОПРЕДЕЛЕННЫХ МАТЕРИАЛОВ. В ВАШЕ РАСПОРЯЖЕНИЕ БУДЕТ ПРЕДОСТАВЛЕНО МНОГО РАЗЛИЧНЫХ ВАРИАНТОВ, ИЗ КОТОРЫХ ВЫ СМОЖЕТЕ ВЫБРАТЬ НАИБОЛЕЕ ПОДХОДЯЩИЙ ИМЕННО ВАМ. 						 					\rЗАКАЗ БУДЕТ ВЫПОЛНЕН И ДОСТАВЛЕН ТОЧНО В СРОК. ВСЕ РАБОТЫ ПО СБОРКЕ И УСТАНОВКЕ МЕБЕЛИ ОСУЩЕСТВЛЯЮТ СОТРУДНИКИ НАШЕЙ КОМПАНИИ. СТРОГИЙ КОНТРОЛЬ КАЧЕСТВА ОСУЩЕСТВЛЯЕТСЯ НА ВСЕХ ЭТАПАХ РАБОТ: ОТ МОМЕНТА ОФОРМЛЕНИЯ ЗАКАЗА ДО МОМЕНТА ПРИЕМА ВЫПОЛНЕННЫХ РАБОТ. \rПЕРЕДОВЫЕ ТЕХНОЛОГИИ И БЕСЦЕННЫЙ ОПЫТ\rИСПОЛЬЗОВАНИЕ ПЕРЕДОВЫХ КОМПЬЮТЕРНЫХ ТЕХНОЛОГИЙ, МНОГОЛЕТНИЙ ОПЫТ НАШИХ СПЕЦИАЛИСТОВ ПОЗВОЛЯЮТ ПРОИЗВЕСТИ ГРАМОТНЫЕ РАСЧЕТЫ И СНИЗИТЬ РАСХОД МАТЕРИАЛОВ И СЕБЕСТОИМОСТЬ ПРОДУКЦИИ, ИЗБЕЖАТЬ ОШИБОК ПРИ ПРОЕКТИРОВАНИИ И ОПТИМИЗИРОВАТЬ ДИЗАЙН КОМПЛЕКСНЫХ ИНТЕРЬЕРОВ. ГАРАНТИЯ НА НАШУ ПРОДУКЦИЮ СОСТАВЛЯЕТ 18 МЕСЯЦЕВ, А НА ОТДЕЛЬНУЮ ПРОДУКЦИЮ 36 МЕСЯЦЕВ. \rМЫ ГОРДИМСЯ НАШИМИ СОТРУДНИКАМИ ПРОШЕДШИМИ ПРОФЕССИОНАЛЬНОЕ ОБУЧЕНИЕ В ЛУЧШИХ УЧЕБНЫХ ЗАВЕДЕНИЯХ РОССИИ И ЗАРУБЕЖЬЯ. У НАС ТРУДЯТСЯ ВЫСОКОКЛАССНЫЕ СПЕЦИАЛИСТЫ РАЗНЫХ ВОЗРАСТОВ. МЫ ЦЕНИМ ЭНТУЗИАЗМ МОЛОДЕЖИ И БЕСЦЕННЫЙ ОПЫТ СТАРШЕГО ПОКОЛЕНИЯ. ВСЕ МЫ РАЗНЫЕ, НО НАС ОБЪЕДИНЯЕТ ПРЕДАННОСТЬ СВОЕМУ ДЕЛУ И ВЕРА В ИДЕИ НАШЕЙ КОМПАНИИ. \rВЫСОЧАЙШИЕ СТАНДАРТЫ КАЧЕСТВА - ЗАЛОГ НАШЕГО УСПЕХА\rМЕБЕЛЬНАЯ КОМПАНИЯ\rОСУЩЕСТВЛЯЕТ ПРОИЗВОДСТВО МЕБЕЛИ НА ВЫСОКОКЛАССНОМ ОБОРУДОВАНИИ С ПРИМЕНЕНИЕМ МИНИМАЛЬНОЙ ДОЛИ РУЧНОГО ТРУДА, ЧТО ПОЗВОЛЯЕТ ОБЕСПЕЧИТЬ ВЫСОКОЕ КАЧЕСТВО НАШЕЙ ПРОДУКЦИИ. НАЛАЖЕН ПРОИЗВОДСТВЕННЫЙ ПРОЦЕСС КАК МАССОВОГО И ИНДИВИДУАЛЬНОГО ХАРАКТЕРА, ЧТО С ОДНОЙ СТОРОНЫ ПОЗВОЛЯЕТ ОБЕСПЕЧИТЬ ПОСТОЯННУЮ НОМЕНКЛАТУРУ ИЗДЕЛИЙ И ИНДИВИДУАЛЬНЫЙ ПОДХОД  С ДРУГОЙ. \rЕЖЕГОДНО НАША ПРОДУКЦИЯ ПРОХОДИТ СЕРТИФИКАЦИОННЫЕ ИСПЫТАНИЯ В СПЕЦИАЛИЗИРОВАННЫХ ЛАБОРАТОРИЯХ РОССИИ И ИМЕЕТ СЕРТИФИКАТЫ СООТВЕТСТВИЯ ПРОДУКЦИИ НОРМАМ БЕЗОПАСНОСТИ И КАЧЕСТВА. КРОМЕ ТОГО, \rМЕБЕЛЬНАЯ КОМПАНИЯ\rОДНОЙ ИЗ ПЕРВЫХ СРЕДИ МЕБЕЛЬНЫХ ПРОИЗВОДИТЕЛЕЙ РОССИИ В 2003 ГОДУ ПРОШЛА АУДИТ НА СООТВЕТСТВИЕ ТРЕБОВАНИЯМ СИСТЕМЫ МЕНЕДЖМЕНТА КАЧЕСТВА ИСО 9000 И ПОЛУЧИЛА СЕРТИФИКАТ СООТВЕТСТВИЯ СИСТЕМЫ КАЧЕСТВА НА ПРЕДПРИЯТИИ НОРМАМ МЕЖДУНАРОДНОГО СТАНДАРТА.\r\n'),(16,'c501a4fb29fd5bc92bc4babebf160ed9','РУКОВОДСТВО\r\nУСПЕШНОЕ РАЗВИТИЕ БИЗНЕСА  ВО МНОГОМ РЕЗУЛЬТАТ КВАЛИФИЦИРОВАННОЙ РАБОТЫ РУКОВОДСТВА. 							\rМЕБЕЛЬНАЯ КОМПАНИЯ\rНА МЕБЕЛЬНОМ РЫНКЕ УЖЕ 18 ЛЕТ. ЗА ЭТО ВРЕМЯ КОМПАНИЯ 							НЕ ТОЛЬКО СОХРАНИЛА, НО И УПРОЧИЛА ЛИДИРУЮЩИЕ ПОЗИЦИИ СРЕДИ ВЕДУЩИХ ИГРОКОВ МЕБЕЛЬНОГО 							РЫНКА. 						\rМЕБЕЛЬНАЯ КОМПАНИЯ\rИЗ ГОДА В ГОД РАСШИРЯЕТ АССОРТИМЕНТ ВЫПУСКАЕМОЙ ПРОДУКЦИИ, 							НАРАЩИВАЕТ ТЕМПЫ И ОБЪЕМЫ ПРОИЗВОДСТВА, УВЕЛИЧИВАЕТ ПРОИЗВОДСТВЕННЫЕ И СКЛАДСКИЕ 							ПЛОЩАДИ, РАЗВИВАЕТ ОТНОШЕНИЯ С ПАРТНЕРАМИ СО ВСЕХ РЕГИОНОВ СТРАНЫ И НАЛАЖИВАЕТ СВЯЗИ 							С ЗАРУБЕЖНЫМИ ПАРТНЕРАМИ. В БОЛЬШОЙ СТЕПЕНИ ЭТО ЗАСЛУГА ХОРОШО ПОДГОТОВЛЕННОГО РУКОВОДЯЩЕГО 							СОСТАВА И ЕГО ГРАМОТНОЙ ПОЛИТИКИ. 						\rСОБСТВЕННИК КОМПАНИИ МЕБЕЛЬНАЯ КОМПАНИЯ\rКОЛЕСНИКОВ ВИКТОР ФЕДОРОВИЧ 								\rРОДИЛСЯ 3 СЕНТЯБРЯ 1964 ГОДА.\nОБРАЗОВАНИЕ: ЗАКОНЧИЛ АВИАЦИОННЫЙ ФАКУЛЬТЕТ ВОРОНЕЖСКОГО 									ГОСУДАРСТВЕННОГО ПОЛИТЕХНИЧЕСКОГО ИНСТИТУТА. В 1994 ГОДУ ПРОШЕЛ ОБУЧЕНИЕ ПО ПРОГРАММЕ 									ПОДГОТОВКА МАЛОГО И СРЕДНЕГО БИЗНЕСА В США.\nВ НАСТОЯЩЕЕ ВРЕМЯ ВИКТОР ФЕДОРОВИЧ 									ВОЗГЛАВЛЯЕТ УПРАВЛЯЮЩУЮ КОМПАНИЮ, КОТОРАЯ КООРДИНИРУЕТ ДЕЯТЕЛЬНОСТЬ ПРЕДПРИЯТИЙ, 									ВХОДЯЩИХ В ГРУППУ КОМПАНИЙ \rМЕБЕЛЬНАЯ КОМПАНИЯ\r. 								\rГЕНЕРАЛЬНЫЙ ДИРЕКТОР МЕБЕЛЬНОЙ КОМПАНИИ\rРАТЧЕНКО АЛЕКСАНДР ПЕТРОВИЧ 								\rРОДИЛСЯ 5 ИЮНЯ 1962 ГОДА.\nОБРАЗОВАНИЕ: ВОРОНЕЖСКИЙ ПОЛИТЕХНИЧЕСКИЙ ИНСТИТУТ 									ПО СПЕЦИАЛЬНОСТИ ИНЖЕНЕР-ТЕХНОЛОГ; ПРОГРАММА ЭФФЕКТИВНОЕ РАЗВИТИЕ ПРОИЗВОДСТВА 									(США).\nВ \rМЕБЕЛЬНОЙ КОМПАНИИ\rСЕРГЕЙ ФОМИЧ С 1994 ГОДА. ЗА ЭТО ВРЕМЯ ПРОШЕЛ 									ПУТЬ ОТ НАЧАЛЬНИКА ЦЕХА ДО ГЕНЕРАЛЬНОГО ДИРЕКТОРА ПРЕДПРИЯТИЯ. 								\rЗАМЕСТИТЕЛЬ ГЕНЕРАЛЬНОГО ДИРЕКТОРА УПРАВЛЯЮЩЕЙ КОМПАНИИ\rРОГОВОЙ АНДРЕЙ ВЛАДИМИРОВИЧ 								\rОБРАЗОВАНИЕ: ФАКУЛЬТЕТ РАДИОТЕХНИКИ ВОРОНЕЖСКОГО ГОСУДАРСТВЕННОГО ТЕХНИЧЕСКОГО УНИВЕРСИТЕТА.\nВ КОМПАНИИ С 1 ИЮНЯ 2000 ГОДА.\r\n'),(17,'85c3cf0e7e15755e89b334085eb959c0','ОТЗЫВЫ\r\n\r\n'),(18,'dcb4e5bc8bbc3912cc75c1f232a1beea','УСЛОВИЯ СОТРУДНИЧЕСТВА\r\n\r\n'),(19,'d34084e0c50297781a591b02e7a96424','КАК СТАТЬ ПАРТНЕРОМ\r\n\r\n'),(20,'ccf66818e228144c63419fc98b3b9ae9','ВХОД НА САЙТ\r\nВЫ ЗАРЕГИСТРИРОВАНЫ И УСПЕШНО АВТОРИЗОВАЛИСЬ.\nВЕРНУТЬСЯ НА ГЛАВНУЮ СТРАНИЦУ\r\n'),(21,'d63c4b77cf485102f232c0d0d27f8bc3','КОНТАКТЫ\r\nОБРАТИТЕСЬ К НАШИМ СПЕЦИАЛИСТАМ И ПОЛУЧИТЕ ПРОФЕССИОНАЛЬНУЮ КОНСУЛЬТАЦИЮ ПО ВОПРОСАМ СОЗДАНИЯ И ПОКУПКИ МЕБЕЛИ (ОТ ДИЗАЙНА, РАЗРАБОТКИ ТЕХНИЧЕСКОГО ЗАДАНИЯ ДО ДОСТАВКИ МЕБЕЛИ К ВАМ ДОМОЙ).\rВЫ МОЖЕТЕ ОБРАТИТЬСЯ К НАМ ПО ТЕЛЕФОНУ, ПО ЭЛЕКТРОННОЙ ПОЧТЕ ИЛИ ДОГОВОРИТЬСЯ О ВСТРЕЧЕ В НАШЕМ ОФИСЕ. БУДЕМ РАДЫ ПОМОЧЬ ВАМ И ОТВЕТИТЬ НА ВСЕ ВАШИ ВОПРОСЫ. \rТЕЛЕФОНЫ\rТЕЛЕФОН/ФАКС:\n(495) 212-85-06\rТЕЛЕФОНЫ:\n(495) 212-85-07\r(495) 212-85-08\rEMAIL\rINFO@EXAMPLE.RU\r ОБЩИЕ ВОПРОСЫ\rSALES@EXAMPLE.RU\r ПРИОБРЕТЕНИЕ ПРОДУКЦИИ\rMARKETING@EXAMPLE.RU\r МАРКЕТИНГ/МЕРОПРИЯТИЯ/PR\rОФИС В МОСКВЕ\r\n'),(22,'92742420ff489208277435770b2dba28','МЕБЕЛЬНЫЙ ФОРУМ БЕЛАРУСИ\r\nС 20 ПО 23 АПРЕЛЯ 2010 ГОДА СОСТОИТСЯ \rМЕБЕЛЬНЫЙ ФОРУМ БЕЛАРУСИ\r ВАЖНЕЙШЕЕ МЕРОПРИЯТИИ ОТРАСЛИ В ТЕКУЩЕМ ГОДУ.\r\n\rС 20 ПО 23 АПРЕЛЯ 2010 ГОДА СОСТОИТСЯ \rМЕБЕЛЬНЫЙ ФОРУМ БЕЛАРУСИ\r ВАЖНЕЙШЕЕ МЕРОПРИЯТИИ ОТРАСЛИ В ТЕКУЩЕМ ГОДУ. В ЭКСПОЗИЦИИ ПРИНИМАЮТ УЧАСТИЕ СВЫШЕ 160 КОМПАНИЙ ИЗ \rБЕЛАРУСИ, АВСТРИИ, ЛАТВИИ, ЛИТВЫ, РОССИИ, ПОЛЬШИ \rИ\rУКРАИНЫ\r. В СОСТАВЕ ФОРУМА СОСТОИТСЯ ПЯТЬ ВЫСТАВОК:\"МИНСКИЙ МЕБЕЛЬНЫЙ САЛОН\", \"МЕБЕЛЬНЫЕ ТЕХНОЛОГИИ\", \"ОФИСКОМФОРТ\", \"КУХНЯ\" И \"ДОМОТЕХ\". ЭКСПОЗИЦИЯ БУДЕТ СТРОИТЬСЯ ПО ПРИНЦИПУ ДВУХ ТЕМАТИЧЕСКИХ СЕКТОРОВ:\rГОТОВОЙ МЕБЕЛИ\rИ \rМАТЕРИАЛОВ ДЛЯ ЕЕ ПРОИЗВОДСТВА\r.\rВ СЕКТОРЕ ГОТОВОЙ МЕБЕЛИ БУДУТ ПРЕДСТАВЛЕНЫ:\rКОРПУСНАЯ И МЯГКАЯ МЕБЕЛЬ;\rМЕБЕЛЬ ДЛЯ ДЕТЕЙ И МОЛОДЕЖИ;\rПРЕДМЕТЫ ИНТЕРЬЕРА;\rКУХОННАЯ МЕБЕЛЬ;\rМЕБЕЛЬ ДЛЯ ОФИСА И АДМИНИСТРАТИВНЫХ ЗДАНИЙ.\rВ СЕКТОРЕ МАТЕРИАЛОВ ДЛЯ ПРОИЗВОДСТВА МЕБЕЛИ БУДУТ ДЕМОНСТРИРОВАТЬСЯ НОВИНКИ РЫНКА МЕБЕЛЬНОЙ ФУРНИТУРЫ, МАТЕРИАЛОВ, ОБИВОЧНЫХ ТКАНЕЙ, ЭЛЕМЕНТОВ И АКСЕССУАРОВ ДЛЯ ПРОИЗВОДСТВА МЕБЕЛИ.\rПОМИМО РАСШИРЕННОЙ ЭКСПОЗИЦИИ ПЯТИ ТЕМАТИЧЕСКИХ ВЫСТАВОК \"ЭКСПОФОРУМ\" ПОДГОТОВИЛ РАЗНООБРАЗНУЮ ДЕЛОВУЮ ПРОГРАММУ МЕБЕЛЬНОГО ФОРУМА. В РАМКАХ ВЫСТАВКИ СОСТОЯТСЯ СЕМИНАРЫ И МАСТЕР-КЛАССЫ. И ПОИСТИНЕ МАСШТАБНЫМ В ЭТОМ ГОДУ ОБЕЩАЕТ СТАТЬ РЕСПУБЛИКАНСКИЙ КОНКУРС ФОРУМА \"\rНАРОДНОЕ ПРИЗНАНИЕ\r\". В ЭТОМ ГОДУ ОН ВЫХОДИТ ЗА РАМКИ ВЫСТАВКИ И СТАНОВИТСЯ РЕСПУБЛИКАНСКИМ СМОТРОМ ОБРАЗЦОВ МЕБЕЛИ.\rМЕБЕЛЬНЫЙ ФОРУМ\rПРЕДОСТАВЛЯЕТ СПЕЦИАЛИСТАМ ВОЗМОЖНОСТЬ ПОЗНАКОМИТЬСЯ С ТЕНДЕНЦИЯМИ МЕБЕЛЬНОЙ МОДЫ, ПРОВЕСТИ ПЕРЕГОВОРЫ, ПОЛУЧИТЬ ПРАКТИЧЕСКИЕ ПРЕДЛОЖЕНИЯ РЫНКА, УВИДЕТЬ ПЕРСПЕКТИВЫ РАЗВИТИЯ И НОВЫЕ КОНКУРЕНТНЫЕ ПРЕИМУЩЕСТВА. ВПЕРВЫЕ ДЛЯ УЧАСТНИКОВ КОНКУРСА БУДЕТ ПОДГОТОВЛЕН МАРКЕТИНГОВЫЙ ОТЧЕТ ПО РЕЗУЛЬТАТАМ ОПРОСА ПОСЕТИТЕЛЕЙ ВЫСТАВОК \rМЕБЕЛЬНОГО ФОРУМА\r.\rПРИЕМ ЗАЯВОК НА УЧАСТИЕ В КОНКУРСЕ ОСУЩЕСТВЛЯЕТСЯ ДО 12 АПРЕЛЯ 2010 ГОДА.\r\n'),(23,'d28b14fc723b19c85e2a5f17daa89898','МЕЖДУНАРОДНАЯ МЕБЕЛЬНАЯ ВЫСТАВКА SALON DEL MOBILE\r\nВ 2010 ГОДУ ВЫСТАВКА SALON DEL MOBILE ОБЕЩАЕТ БЫТЬ ЕЩЕ БОЛЕЕ РАСШИРЕННОЙ И ИНТЕРЕСНОЙ. \r\nВ 2010 ГОДУ ВЫСТАВКА SALON DEL MOBILE ОБЕЩАЕТ БЫТЬ ЕЩЕ БОЛЕЕ РАСШИРЕННОЙ И ИНТЕРЕСНОЙ. НА ВЫСТАВКЕ SALON DEL MOBILE БУДУТ ПРЕДСТАВЛЕНЫ ВСЕ ТИПЫ МЕБЕЛИ ДЛЯ ОФИСА И ДОМА ОТ СПАЛЕН И ГОСТИНЫХ ДО VIP-КАБИНЕТОВ, ВКЛЮЧАЯ ОБОРУДОВАНИЕ ДЛЯ САДА И ДЕТСКОЙ МЕБЕЛИ. ЗАЯВКИ НА УЧАСТИЕ ПОДАЛИ БОЛЕЕ ЧЕМ 1 500 КОМПАНИЙ СО ВСЕГО МИРА. ПРЕДПОЛАГАЕТСЯ, ЧТО ЗА ВРЕМЯ ПРОВЕДЕНИЯ ВЫСТАВКИ ЕЕ ПОСЕТЯТ БОЛЕЕ 300 000 ТЫСЯЧ ЧЕЛОВЕК. ЭКСПОЗИЦИЯ ВЫСТАВКИ РАЗМЕСТИТСЯ НА ОБЩЕЙ ПЛОЩАДИ 149 871 КВ.М. В 2010 ГОДУ ЭТА ПОИСТИНЕ ГРАНДИОЗНАЯ ВЫСТАВКА БУДЕТ ПРОВОДИТЬСЯ УЖЕ В 10-Й РАЗ.\r\n'),(24,'6e9c53b4377c8bda27a391c004332b06','ПОЛУЧЕНО ПРОЧНОЕ ВОДОСТОЙКОЕ СОЕДИНЕНИЕ\r\nПОЛУЧЕНО НОВОЕ ПРОЧНОЕ ВОДОСТОЙКОЕ КЛЕЕВОЕ СОЕДИНЕНИЕ.ИЗОБРЕТЕНИЕ ОТНОСИТСЯ К ОБЛАСТИ ПОЛУЧЕНИЯ И ПРИМЕНЕНИЯ КЛЕЯЩИХ СОСТАВОВ, ИСПОЛЬЗУЕМЫХ В ДЕРЕВООБРАБАТЫВАЮЩЕЙ, МЕБЕЛЬНОЙ И СТРОИТЕЛЬНОЙ ПРОМЫШЛЕННОСТИ. ДАННАЯ КЛЕЕВАЯ КОМПОЗИЦИЯ ПРЕДНАЗНАЧЕНА ТОЛЬКО ДЛЯ ГОРЯЧЕГО ПРЕССОВАНИЯ И ИМЕЕТ В СВОЕМ СОСТАВЕ МНОГОКОМПОНЕНТНЫЙ ОТВЕРДИТЕЛЬ. \r\n\rАВТОРЫ ИЗОБРЕТЕНИЯ\r: РАЗИНЬКОВ ЕГОР МИХАЙЛОВИЧ И МЕЩЕРЯКОВА АННА АНАТОЛЬЕВНА \rПАТЕНТ РОССИЙСКОЙ ФЕДЕРАЦИИ RU2277566\rОПИСАНИЕ ИЗОБРЕТЕНИЯ\rИЗОБРЕТЕНИЕ ОТНОСИТСЯ К ОБЛАСТИ ПОЛУЧЕНИЯ И ПРИМЕНЕНИЯ КЛЕЯЩИХ СОСТАВОВ, ИСПОЛЬЗУЕМЫХ В ДЕРЕВООБРАБАТЫВАЮЩЕЙ, МЕБЕЛЬНОЙ И СТРОИТЕЛЬНОЙ ПРОМЫШЛЕННОСТИ.\rДАННАЯ КЛЕЕВАЯ КОМПОЗИЦИЯ ПРЕДНАЗНАЧЕНА ТОЛЬКО ДЛЯ ГОРЯЧЕГО ПРЕССОВАНИЯ И ИМЕЕТ В СВОЕМ СОСТАВЕ МНОГОКОМПОНЕНТНЫЙ ОТВЕРДИТЕЛЬ. ПРОТОТИПОМ КЛЕЕВОЙ КОМПОЗИЦИИ ЯВЛЯЕТСЯ КЛЕЙ, СОСТОЯЩИЙ ИЗ КАРБАМИДОФОРМАЛЬДЕГИДНОЙ СМОЛЫ, СОПОЛИМЕРА АКРИЛОНИТРИЛА С N-ВИНИЛКАПРОЛАКТАМОМ И ОТВЕРДИТЕЛЬ. В КАЧЕСТВЕ ОТВЕРДИТЕЛЯ ПРИМЕНЯЮТ ХЛОРИСТЫЙ АММОНИЙ ЛИБО АКРИЛОВУЮ КИСЛОТУ. \rИЗОБРЕТЕНИЕ РЕШАЕТ ЗАДАЧУ ПО ПОЛУЧЕНИЮ ПРОЧНОГО И ВОДОСТОЙКОГО КЛЕЕВОГО СОЕДИНЕНИЯ.\rЭТО ДОСТИГАЕТСЯ ТЕМ, ЧТО КЛЕЕВАЯ КОМПОЗИЦИЯ, ВКЛЮЧАЮЩАЯ СИНТЕТИЧЕСКУЮ СМОЛУ И ОТВЕРДИТЕЛЬ, СОГЛАСНО ИЗОБРЕТЕНИЮ, ДОПОЛНИТЕЛЬНО СОДЕРЖИТ МОДИФИКАТОР, ПРИЧЕМ В КАЧЕСТВЕ СИНТЕТИЧЕСКОЙ СМОЛЫ КЛЕЕВАЯ КОМПОЗИЦИЯ ВКЛЮЧАЕТ КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНУЮ СМОЛУ С ОТВЕРДИТЕЛЕМ 2542, В КАЧЕСТВЕ МОДИФИКАТОРА - КАРБАМИДОФОРМАЛЬДЕГИДНУЮ СМОЛУ, А В КАЧЕСТВЕ ОТВЕРДИТЕЛЯ - 10%-НЫЙ РАСТВОР ЩАВЕЛЕВОЙ КИСЛОТЫ ПРИ СЛЕДУЮЩЕМ СООТНОШЕНИИ КОМПОНЕНТОВ, МАС.Ч.:\rКАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНАЯ СМОЛА\r64,5-79,2\r10%-НЫЙ РАСТВОР ЩАВЕЛЕВОЙ КИСЛОТЫ\r4,4-20,5\rОТВЕРДИТЕЛЬ ДЛЯ КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНОЙ \r0,6-2,0\rСМОЛЫ 2542\r13,0-15,8\r\n'),(25,'f86144adfc89dc75855e25d200a5e333','ГЕРЦОГ\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ, РОСКОШНЫЕ ТКАНИ ДЛЯ ОБИВКИ, ЯРКИЕ ЦВЕТА И БОГАТЫЙ ДЕКОР.\r\r\n \rИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ, РОСКОШНЫЕ ТКАНИ ДЛЯ ОБИВКИ, ЯРКИЕ ЦВЕТА И БОГАТЫЙ ДЕКОР.\r\n'),(26,'3a7ce138fe31e4cc12b2809a04e0db25','МОНАЛИЗА\r\nБОГАТСТВО И ИЗЫСК ВЫРАЖЕН В ДАННОЙ МОДЕЛИ. КАРКАС ДОПОЛНИТЕЛЬНО РАСПИСЫВАЕТСЯ ЗОЛОТОМ.\rПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА СПИНКЕ И ПОДЛОКОТНИКАХ.\r\r\n \rБОГАТСТВО И ИЗЫСК ВЫРАЖЕН В ДАННОЙ МОДЕЛИ. КАРКАС ДОПОЛНИТЕЛЬНО РАСПИСЫВАЕТСЯ ЗОЛОТОМ.\rПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА СПИНКЕ И ПОДЛОКОТНИКАХ.\r\n'),(27,'df6d1da3eabe6c40954a796579d554cb','МИНИСТР\r\nКРЕСЛО РУКОВОДИТЕЛЯ МИНИСТР, НЕСМОТРЯ НА НИЗКУЮ СТОИМОСТЬ, ВПЕЧАТЛЯЮЩЕ ВЫГЛЯДИТ. \rС ЕГО ПОМОЩЬЮ МОЖНО СОЗДАТЬ ОФИСНЫЙ ИНТЕРЬЕР ВЫСОКОГО УРОВНЯ. К ТОМУ ЖЕ В НЕМ МОЖНО РАБОТАТЬ С КОМФОРТОМ, НЕ ЧУВСТВУЯ УСТАЛОСТИ.\r\r\n \rКРЕСЛО РУКОВОДИТЕЛЯ МИНИСТР, НЕСМОТРЯ НА НИЗКУЮ СТОИМОСТЬ, ВПЕЧАТЛЯЮЩЕ ВЫГЛЯДИТ. \rС ЕГО ПОМОЩЬЮ МОЖНО СОЗДАТЬ ОФИСНЫЙ ИНТЕРЬЕР ВЫСОКОГО УРОВНЯ. К ТОМУ ЖЕ В НЕМ МОЖНО РАБОТАТЬ С КОМФОРТОМ, НЕ ЧУВСТВУЯ УСТАЛОСТИ.\r\n'),(28,'bc3cb6280475204c00312b331b7c2fa9','ХРОМ\r\nДИНАМИЧНАЯ МОДЕЛЬ ОФИСНОГО КРЕСЛА ПРИМЕЧАТЕЛЬНА ОРИГИНАЛЬНЫМ ВНЕШНИМ ВИДОМ, КОТОРЫЙ ДОСТИГНУТ ЗА \rСЧЕТ ХРОМИРОВАННОЙ КРЕСТОВИНЫ,НЕОБЫЧНЫХ ПОДЛОКОТНИКОВ И ПОТРЯСАЮЩЕЙ ЭРГОНОМИКИ. \rТВЕРДАЯ СПИНКА ЖЕСТКО ПОДДЕРЖИВАЕТ ПОЗВОНОЧНИК.\r\r\n \rДИНАМИЧНАЯ МОДЕЛЬ ОФИСНОГО КРЕСЛА ПРИМЕЧАТЕЛЬНА ОРИГИНАЛЬНЫМ ВНЕШНИМ ВИДОМ, КОТОРЫЙ ДОСТИГНУТ ЗА \rСЧЕТ ХРОМИРОВАННОЙ КРЕСТОВИНЫ,НЕОБЫЧНЫХ ПОДЛОКОТНИКОВ И ПОТРЯСАЮЩЕЙ ЭРГОНОМИКИ. \rТВЕРДАЯ СПИНКА ЖЕСТКО ПОДДЕРЖИВАЕТ ПОЗВОНОЧНИК.\r\n'),(29,'5c32b6f62c6126843cbd44b1a593d952','ЛИВЕРПУЛЬ\r\nДЕРЕВЯННЫЕ СТУЛЬЯ ЛИВЕРПУЛЬ, ВЫПОЛНЕННЫЕ В КЛАССИЧЕСКОМ АНГЛИЙСКОМ СТИЛЕ, \rСОЗДАЮТ ОСОБУЮ АТМОСФЕРУ В КУХНЕ.\r\r\n \rДЕРЕВЯННЫЕ СТУЛЬЯ ЛИВЕРПУЛЬ, ВЫПОЛНЕННЫЕ В КЛАССИЧЕСКОМ АНГЛИЙСКОМ СТИЛЕ, \rСОЗДАЮТ ОСОБУЮ АТМОСФЕРУ В КУХНЕ.\r\n'),(30,'7955bfe502463895d32a336f267421a8','ИЗАБЕЛЛА\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ ЗОЛОТОМ. ОБИВКА МОЖЕТ БЫТЬ ПРЕДСТАВЛЕНА В ТКАНИ ИЛИ КОЖЕ.\r\r\n \rИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ ЗОЛОТОМ. ОБИВКА МОЖЕТ БЫТЬ ПРЕДСТАВЛЕНА В ТКАНИ ИЛИ КОЖЕ.\r\n'),(31,'00e3040c167611cbe598003e6d5427ae','АЛАДДИН\r\nКОМФОРТНАЯ, МАССИВНАЯ МОДЕЛЬ. ОБИВКА - ЭЛИТНЫЕ ТКАНИ, РУЧНАЯ СТРОЧКА, \rПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. \rПО ЖЕЛАНИЮ КЛИЕНТА МОЖНО УСТАНОВИТЬ МЕХАНИЗМ ТРАНСФОРМАЦИИ ДЛЯ ЕЖЕДНЕВНОГО ИСПОЛЬЗОВАНИЯ ИЛИ «ГОСТЕВУЮ РАСКЛАДУШКУ»\r\r\n \rКОМФОРТНАЯ, МАССИВНАЯ МОДЕЛЬ. ОБИВКА - ЭЛИТНЫЕ ТКАНИ, РУЧНАЯ СТРОЧКА, \rПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. \rПО ЖЕЛАНИЮ КЛИЕНТА МОЖНО УСТАНОВИТЬ МЕХАНИЗМ ТРАНСФОРМАЦИИ ДЛЯ ЕЖЕДНЕВНОГО ИСПОЛЬЗОВАНИЯ ИЛИ «ГОСТЕВУЮ РАСКЛАДУШКУ»\r\n'),(32,'f5e7877d0bc889cce24427c1d1e8d96f','ДЖОКОНДА\r\nИЗЯЩНЫЙ КАРКАС, ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ, РУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. \rОБИВКА ТАКЖЕ МОЖЕТ БЫТЬ В КОЖЕ, ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА ПОДЛОКОТНИКАХ И СПИНКЕ.\r\r\n \rИЗЯЩНЫЙ КАРКАС, ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ, РУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. \rОБИВКА ТАКЖЕ МОЖЕТ БЫТЬ В КОЖЕ, ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА ПОДЛОКОТНИКАХ И СПИНКЕ.\r\n'),(33,'13ffbc270cbe931d486a5511fd6da896','ФЛОРА\r\nКЛАССИЧЕСКАЯ МОДЕЛЬ СОЗДАНА ДЛЯ УКРАШЕНИЯ РОСКОШНЫХ ИНТЕРЬЕРОВ. \rЭЛЕГАНТНОСТЬ И КОЛОРИТНОСТЬ МОДЕЛИ ПРИДАЮТ НАКЛАДКИ ИЗ НАТУРАЛЬНОГО ДЕРЕВА.\r\r\n \rКЛАССИЧЕСКАЯ МОДЕЛЬ СОЗДАНА ДЛЯ УКРАШЕНИЯ РОСКОШНЫХ ИНТЕРЬЕРОВ. \rЭЛЕГАНТНОСТЬ И КОЛОРИТНОСТЬ МОДЕЛИ ПРИДАЮТ НАКЛАДКИ ИЗ НАТУРАЛЬНОГО ДЕРЕВА.\r\n'),(34,'81fb3b3fcb9358b5de6446706e8e132c','ПРЕСТИЖ\r\nТАХТА В КЛАССИЧЕСКОМ ИСПОЛНЕНИИ. ПОДЛОКОТНИК НАХОДИТСЯ СЛЕВА – ЭТО СТАНДАРТ. ОБИВКА МОЖЕТ БЫТЬ КАК В ТКАНИ, ТАК И В КОЖЕ.\r\r\n \rТАХТА В КЛАССИЧЕСКОМ ИСПОЛНЕНИИ. ПОДЛОКОТНИК НАХОДИТСЯ СЛЕВА – ЭТО СТАНДАРТ. ОБИВКА МОЖЕТ БЫТЬ КАК В ТКАНИ, ТАК И В КОЖЕ.\r\n'),(35,'fee2bd8c63d03b8452efa69f751e6fb2','ЛАУРА\r\nДВУХМЕСТНАЯ СОФА НА ОСНОВЕ КОНУСНЫХ ПРУЖИН ИЛИ НА ОСНОВЕ КОМБИНАЦИИ ПЛОТНЫХ ПОРОЛОНОВ, ПО ВАШЕМУ ЖЕЛАНИЮ. \rЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ ПРИДАЮТ МОДЕЛИ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ.\r\r\n \rДВУХМЕСТНАЯ СОФА НА ОСНОВЕ КОНУСНЫХ ПРУЖИН ИЛИ НА ОСНОВЕ КОМБИНАЦИИ ПЛОТНЫХ ПОРОЛОНОВ, ПО ВАШЕМУ ЖЕЛАНИЮ. \rЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ ПРИДАЮТ МОДЕЛИ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ.\r\n'),(36,'e980bf84fb99998e698762a99222ea9a','МОДЕРН\r\nОСНОВНЫМИ ХАРАКТЕРИСТИКАМИ ДАННОЙ СЕРИИ ЯВЛЯЕТСЯ НОВИЗНА ДИЗАЙНЕРСКОЙ МЫСЛИ, \rКОТОРАЯ ВОПЛОЩЕНА ВО ВНЕШНЕМ ОБЛИКЕ ЭТОЙ МЕБЕЛИ, И ОРИГИНАЛЬНОСТЬ ИСПОЛНЕНИЯ КЛАССИЧЕСКОЙ КОМПОНОВКИ, \rКОТОРАЯ СОЧЕТАЕТ В СЕБЕ ОПТИМАЛЬНЫЙ НАБОР ВСЕХ НЕОБХОДИМЫХ ЭЛЕМЕНТОВ И СВЕЖИЕ РЕШЕНИЯ В ИХ ОРГАНИЗАЦИИ. \rЧТО В СОЧЕТАНИИ С УДАЧНЫМИ ЦВЕТОВЫМИ РЕШЕНИЯМИ СОЗДАСТ В ВАШЕМ ОФИСЕ АТМОСФЕРУ НЕПОВТОРИМОЙ ИНДИВИДУАЛЬНОСТИ. \rДАННАЯ СЕРИЯ – НАИЛУЧШЕЕ РЕШЕНИЕ ДЛЯ БИЗНЕСМЕНОВ, КОТОРЫЕ ПРИВЫКЛИ БЫТЬ НА ШАГ ВПЕРЕДИ НЕ ТОЛЬКО СВОИХ КОНКУРЕНТОВ, \rНО И САМОГО ВРЕМЕНИ.\r\r\n \rОСНОВНЫМИ ХАРАКТЕРИСТИКАМИ ДАННОЙ СЕРИИ ЯВЛЯЕТСЯ НОВИЗНА ДИЗАЙНЕРСКОЙ МЫСЛИ, \rКОТОРАЯ ВОПЛОЩЕНА ВО ВНЕШНЕМ ОБЛИКЕ ЭТОЙ МЕБЕЛИ, И ОРИГИНАЛЬНОСТЬ ИСПОЛНЕНИЯ КЛАССИЧЕСКОЙ КОМПОНОВКИ, \rКОТОРАЯ СОЧЕТАЕТ В СЕБЕ ОПТИМАЛЬНЫЙ НАБОР ВСЕХ НЕОБХОДИМЫХ ЭЛЕМЕНТОВ И СВЕЖИЕ РЕШЕНИЯ В ИХ ОРГАНИЗАЦИИ. \rЧТО В СОЧЕТАНИИ С УДАЧНЫМИ ЦВЕТОВЫМИ РЕШЕНИЯМИ СОЗДАСТ В ВАШЕМ ОФИСЕ АТМОСФЕРУ НЕПОВТОРИМОЙ ИНДИВИДУАЛЬНОСТИ. \rДАННАЯ СЕРИЯ – НАИЛУЧШЕЕ РЕШЕНИЕ ДЛЯ БИЗНЕСМЕНОВ, КОТОРЫЕ ПРИВЫКЛИ БЫТЬ НА ШАГ ВПЕРЕДИ НЕ ТОЛЬКО СВОИХ КОНКУРЕНТОВ, \rНО И САМОГО ВРЕМЕНИ.\r\n'),(37,'286e9f6fd660a7a29d1c58fd03b7cbfa','ОПТИМА\r\nУДАЧНЫЙ ВЫБОР МЕБЕЛИ ДЛЯ ПЕРСОНАЛА ВО МНОГОМ ОПРЕДЕЛЯЕТ УСПЕШНОСТЬ ДЕЯТЕЛЬНОСТИ ВСЕЙ КОМПАНИИ. \rПРАВИЛЬНО ОРГАНИЗОВАТЬ РАБОЧЕЕ ПРОСТРАНСТВО - ЗНАЧИТ ПОМОЧЬ КОЛЛЕГАМ ВЫПОЛНЯТЬ СВОИ ФУНКЦИИ БЫСТРЕЕ И ЭФФЕКТИВНЕЕ.\rСЕРИЯ \r«ОПТИМА»\rПОЗВОЛИТ НАЙТИ МАССУ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА РАБОЧЕЙ ЗОНЫ, ПРИСПОСОБИТЬ ИНТЕРЬЕР К ДОЛЖНОСТНЫМ \rОБЯЗАННОСТЯМ ВСЕХ КАТЕГОРИЙ СОТРУДНИКОВ. ЭРГОНОМИЧНЫЕ УГЛОВЫЕ СТОЛЫ, ПЕРЕГОРОДКИ, ШКАФЫ И ТУМБЫ ПОМОГУТ РАЦИОНАЛЬНО ИСПОЛЬЗОВАТЬ \rПРОСТРАНСТВО ПОД УНИКАЛЬНОЕ РАБОЧЕЕ МЕСТО, ПРИСПОСОБЛЕННОЕ К ПОТРЕБНОСТЯМ КАЖДОГО РАБОТНИКА И ВСЕЙ ФИРМЫ В ЦЕЛОМ.\rМЕБЕЛЬ \r«ОПТИМА»\r- ЭТО ПОЛНЫЙ НАБОР ИНТЕРЬЕРНЫХ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА ПРОСТРАНСТВА В ОФИСЕ ПО СОВРЕМЕННЫМ СТАНДАРТАМ.\r\r\n \rУДАЧНЫЙ ВЫБОР МЕБЕЛИ ДЛЯ ПЕРСОНАЛА ВО МНОГОМ ОПРЕДЕЛЯЕТ УСПЕШНОСТЬ ДЕЯТЕЛЬНОСТИ ВСЕЙ КОМПАНИИ. ПРАВИЛЬНО ОРГАНИЗОВАТЬ РАБОЧЕЕ ПРОСТРАНСТВО - ЗНАЧИТ ПОМОЧЬ КОЛЛЕГАМ ВЫПОЛНЯТЬ СВОИ ФУНКЦИИ БЫСТРЕЕ И ЭФФЕКТИВНЕЕ.\rСЕРИЯ \r«ОПТИМА»\rПОЗВОЛИТ НАЙТИ МАССУ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА РАБОЧЕЙ ЗОНЫ, ПРИСПОСОБИТЬ ИНТЕРЬЕР К ДОЛЖНОСТНЫМ ОБЯЗАННОСТЯМ ВСЕХ КАТЕГОРИЙ СОТРУДНИКОВ. ЭРГОНОМИЧНЫЕ УГЛОВЫЕ СТОЛЫ, ПЕРЕГОРОДКИ, ШКАФЫ И ТУМБЫ ПОМОГУТ РАЦИОНАЛЬНО ИСПОЛЬЗОВАТЬ ПРОСТРАНСТВО ПОД УНИКАЛЬНОЕ РАБОЧЕЕ МЕСТО, ПРИСПОСОБЛЕННОЕ К ПОТРЕБНОСТЯМ КАЖДОГО РАБОТНИКА И ВСЕЙ ФИРМЫ В ЦЕЛОМ.\rМЕБЕЛЬ \r«ОПТИМА»\r- ЭТО ПОЛНЫЙ НАБОР ИНТЕРЬЕРНЫХ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА ПРОСТРАНСТВА В ОФИСЕ ПО СОВРЕМЕННЫМ СТАНДАРТАМ.\r\n'),(38,'37c339b919a986e466960961039e1d6a','СОБРАНИЕ\r\nЗАХОДЯ В ПОМЕЩЕНИЕ, ГДЕ НАХОДЯТСЯ СТОЛЫ ДЛЯ ПЕРЕГОВОРОВ «СОБРАНИЕ», ВОЗНИКАЕТ СТОЙКОЕ ОЩУЩЕНИЕ, ЧТО НАХОДИШЬСЯ В КАБИНЕТЕ ЕСЛИ НЕ ПРЕЗИДЕНТА СТРАНЫ, ТО ПРЕМЬЕР-МИНИСТРА КАК МИНИМУМ. ВОТ-ВОТ В КОМНАТУ ВОЙДЕТ ВЫСОКОПОСТАВЛЕННЫЙ ЧИНОВНИК, И НАЧНЕТСЯ ОБСУЖДЕНИЕ ГЛОБАЛЬНЫХ ВОПРОСОВ.\rУДИВИТЕЛЬНОЕ СОЧЕТАНИЕ ИЗЫСКАННОЙ РОСКОШИ СТИЛЯ И КРАСОТЫ КЛАССИЧЕСКИХ ЛИНИЙ СТОЛОВ «СОБРАНИЕ» И ПРИВЛЕКАТЕЛЬНОЙ ЦЕНЫ ОПРОВЕРГАЕТ УСТОЯВШЕЕСЯ УТВЕРЖДЕНИЕ О КАЧЕСТВЕ ДЕШЕВОЙ МЕБЕЛИ. УМЕНЬШЕНИЕ СЕБЕСТОИМОСТИ ПРОИСХОДИТ ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ БОЛЕЕ ДЕШЕВЫХ МАТЕРИАЛОВ – ДСП И ДВП, ЧТО ПОЗВОЛЯЕТ ОФИСНОЙ МЕБЕЛИ СОХРАНЯТЬ ВЕЛИКОЛЕПНЫЕ ЭКСПЛУАТАЦИОННЫЕ ХАРАКТЕРИСТИКИ.\r\r\n \rЗАХОДЯ В ПОМЕЩЕНИЕ, ГДЕ НАХОДЯТСЯ СТОЛЫ ДЛЯ ПЕРЕГОВОРОВ «СОБРАНИЕ», ВОЗНИКАЕТ СТОЙКОЕ ОЩУЩЕНИЕ, ЧТО НАХОДИШЬСЯ В КАБИНЕТЕ ЕСЛИ НЕ ПРЕЗИДЕНТА СТРАНЫ, ТО ПРЕМЬЕР-МИНИСТРА КАК МИНИМУМ. ВОТ-ВОТ В КОМНАТУ ВОЙДЕТ ВЫСОКОПОСТАВЛЕННЫЙ ЧИНОВНИК, И НАЧНЕТСЯ ОБСУЖДЕНИЕ ГЛОБАЛЬНЫХ ВОПРОСОВ.\rУДИВИТЕЛЬНОЕ СОЧЕТАНИЕ ИЗЫСКАННОЙ РОСКОШИ СТИЛЯ И КРАСОТЫ КЛАССИЧЕСКИХ ЛИНИЙ СТОЛОВ «СОБРАНИЕ» И ПРИВЛЕКАТЕЛЬНОЙ ЦЕНЫ ОПРОВЕРГАЕТ УСТОЯВШЕЕСЯ УТВЕРЖДЕНИЕ О КАЧЕСТВЕ ДЕШЕВОЙ МЕБЕЛИ. УМЕНЬШЕНИЕ СЕБЕСТОИМОСТИ ПРОИСХОДИТ ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ БОЛЕЕ ДЕШЕВЫХ МАТЕРИАЛОВ – ДСП И ДВП, ЧТО ПОЗВОЛЯЕТ ОФИСНОЙ МЕБЕЛИ СОХРАНЯТЬ ВЕЛИКОЛЕПНЫЕ ЭКСПЛУАТАЦИОННЫЕ ХАРАКТЕРИСТИКИ.\r\n'),(39,'cae6ed5ad18b5af81c184a7d384f6dd3','ЛИДЕР\r\nЭТОТ СТИЛЬНЫЙ СТОЛ АБСОЛЮТНО НЕ СИММЕТРИЧЕН, И ЭТО ПРИДАЕТ ЕМУ ИЗЯЩНОСТЬ И ОРИГИНАЛЬНОСТЬ. \rСЛЕВА ОН ОПИРАЕТСЯ НА НОЖКУ, ОСВОБОЖДАЯ ПОЛЕЗНОЕ ПРОСТРАНСТВО ДЛЯ СИСТЕМНОГО БЛОКА И НОГ. \rСПРАВА ОСНОВАНИЕМ СЛУЖИТ УДОБНАЯ И ВМЕСТИТЕЛЬНАЯ ТУМБА. ПЛАВНЫЕ ЛИНИИ, СТИЛЬНЫЙ ДИЗАЙН И ВЫСОКАЯ ЭРГОНОМИЧНОСТЬ ЯВЛЯЮТСЯ \rОСНОВНЫМИ ДОСТОИНСТВАМИ ДАННОЙ СЕРИИ.\r\r\n \rЭТОТ СТИЛЬНЫЙ СТОЛ АБСОЛЮТНО НЕ СИММЕТРИЧЕН, И ЭТО ПРИДАЕТ ЕМУ ИЗЯЩНОСТЬ И ОРИГИНАЛЬНОСТЬ. \rСЛЕВА ОН ОПИРАЕТСЯ НА НОЖКУ, ОСВОБОЖДАЯ ПОЛЕЗНОЕ ПРОСТРАНСТВО ДЛЯ СИСТЕМНОГО БЛОКА И НОГ. \rСПРАВА ОСНОВАНИЕМ СЛУЖИТ УДОБНАЯ И ВМЕСТИТЕЛЬНАЯ ТУМБА. ПЛАВНЫЕ ЛИНИИ, СТИЛЬНЫЙ ДИЗАЙН И ВЫСОКАЯ ЭРГОНОМИЧНОСТЬ ЯВЛЯЮТСЯ \rОСНОВНЫМИ ДОСТОИНСТВАМИ ДАННОЙ СЕРИИ.\r\n'),(40,'07e40b7ee85f6e0586e6b7dca7071207','ПРЕЗИДЕНТ\r\nКРЕСЛО РУКОВОДИТЕЛЯ ПРЕЗИДЕНТ\rВО ГЛАВЕ БОЛЬШОГО КРУГЛОГО СТОЛА ПОМОЖЕТ СОЗДАТЬ В ВАШЕМ КАБИНЕТЕ\rОБСТАНОВКУ ЛЕГЕНДАРНОЙ СОВЕЩАТЕЛЬНОЙ КОМНАТЫ. ВЕДЬ ЭТО НЕ ПРОСТО МЕБЕЛЬ ОФИСНАЯ – ЭТО НАСТОЯЩИЙ ТРОН, КОТОРЫЙ \rПОМОЖЕТ УПРАВЛЕНЦУ РЕШАТЬ ЛЮБЫЕ ВОПРОСЫ, СОГЛАСУЯСЬ С ПОНЯТИЯМИ ЧЕСТИ И СОВЕСТИ.\r\r\n \rКРЕСЛО РУКОВОДИТЕЛЯ ПРЕЗИДЕНТ\rВО ГЛАВЕ БОЛЬШОГО КРУГЛОГО СТОЛА ПОМОЖЕТ СОЗДАТЬ В ВАШЕМ КАБИНЕТЕ\rОБСТАНОВКУ ЛЕГЕНДАРНОЙ СОВЕЩАТЕЛЬНОЙ КОМНАТЫ. ВЕДЬ ЭТО НЕ ПРОСТО МЕБЕЛЬ ОФИСНАЯ – ЭТО НАСТОЯЩИЙ ТРОН, КОТОРЫЙ \rПОМОЖЕТ УПРАВЛЕНЦУ РЕШАТЬ ЛЮБЫЕ ВОПРОСЫ, СОГЛАСУЯСЬ С ПОНЯТИЯМИ ЧЕСТИ И СОВЕСТИ. \rДИЗАЙН КРЕСЛА ВЫПОЛНЕН В СТРОГОМ КЛАССИЧЕСКОМ СТИЛЕ. ОКАНТОВКА И ПОДЛОКОТНИКИ КРЕСЛА ВЫТОЧЕНА ВРУЧНУЮ И ПОТОМУ УНИКАЛЬНЫ. \rПРОИЗВОДИТСЯ ОГРАНИЧЕННЫМИ ПАРТИЯМИ - НЕ БОЛЕЕ 10 КРЕСЕЛ В ГОД.\r\n'),(41,'eafc4c3a71f8b67e539a59cd7f90eeda','ПЛУТОН\r\nОФИСНОЕ КРЕСЛО, ПОДОБРАННОЕ С УЧЕТОМ ВАШИХ ФИЗИОЛОГИЧЕСКИХ ОСОБЕННОСТЕЙ - ВАЖНАЯ СОСТАВЛЯЮЩАЯ РАБОТОСПОСОБНОСТИ И ЗДОРОВЬЯ. \rДАННАЯ МОДЕЛЬ БУДЕТ НЕЗАМЕНИМА ДЛЯ ТЕХ, КТО МНОГО РАБОТАЕТ ЗА КОМПЬЮТЕРОМ.\r\r\n \rОФИСНОЕ КРЕСЛО, ПОДОБРАННОЕ С УЧЕТОМ ВАШИХ ФИЗИОЛОГИЧЕСКИХ ОСОБЕННОСТЕЙ - ВАЖНАЯ СОСТАВЛЯЮЩАЯ РАБОТОСПОСОБНОСТИ И ЗДОРОВЬЯ. \rДАННАЯ МОДЕЛЬ БУДЕТ НЕЗАМЕНИМА ДЛЯ ТЕХ, КТО МНОГО РАБОТАЕТ ЗА КОМПЬЮТЕРОМ.\r\n'),(42,'d9c1fcdf56ed763d069672a51edaf886','ПАРМА\r\nСТУЛЬЯ ПАРМА ВНЕСУТ В КУХНЮ УЮТНОЕ ОБАЯНИЕ ЭКОЛОГИЧЕСКИ ЧИСТОГО ДРЕВЕСНОГО МАТЕРИАЛА. \rСТУЛ ПРАКТИЧЕСКИ ЦЕЛИКОМ СДЕЛАН ИЗ МАССИВА БУКА, ИСКЛЮЧЕНИЕМ СТАЛО ЛИШЬ МЯГКОЕ СИДЕНЬЕ. \rТОНИРОВКА ДЕРЕВЯННЫХ ДЕТАЛЕЙ МОЖЕТ БЫТЬ ВЫПОЛНЕНА В ЛЮБОЙ ЦВЕТОВОЙ ПАЛИТРЕ.\r\r\n \r <P>СТУЛЬЯ ПАРМА ВНЕСУТ В КУХНЮ УЮТНОЕ ОБАЯНИЕ ЭКОЛОГИЧЕСКИ ЧИСТОГО ДРЕВЕСНОГО МАТЕРИАЛА. \r СТУЛ ПРАКТИЧЕСКИ ЦЕЛИКОМ СДЕЛАН ИЗ МАССИВА БУКА, ИСКЛЮЧЕНИЕМ СТАЛО ЛИШЬ МЯГКОЕ СИДЕНЬЕ. \r ТОНИРОВКА ДЕРЕВЯННЫХ ДЕТАЛЕЙ МОЖЕТ БЫТЬ ВЫПОЛНЕНА В ЛЮБОЙ ЦВЕТОВОЙ ПАЛИТРЕ.</P>\r\n'),(43,'6b34dc50a2008617635888607e22f36c','ПАЛЕРМО\r\nУНИВЕРСАЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ПАЛЕРМО ПОЗВОЛИТ С УСПЕХОМ ИСПОЛЬЗОВАТЬ ИХ И В ОФИСНЫХ ПОМЕЩЕНИЯХ, \rИ В ИНТЕРЬЕРЕ КАФЕ, И В ДОМАШНЕЙ ОБСТАНОВКЕ. СТУЛЬЯ ПАЛЕРМО ДОБАВЯТ УЮТА В КАЖДОЕ ПОМЕЩЕНИЕ И \rОРГАНИЧНО СОЛЬЮТСЯ С ЕГО СТИЛЕМ.\r\r\n \rУНИВЕРСАЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ПАЛЕРМО ПОЗВОЛИТ С УСПЕХОМ ИСПОЛЬЗОВАТЬ ИХ И В ОФИСНЫХ ПОМЕЩЕНИЯХ, \rИ В ИНТЕРЬЕРЕ КАФЕ, И В ДОМАШНЕЙ ОБСТАНОВКЕ. СТУЛЬЯ ПАЛЕРМО ДОБАВЯТ УЮТА В КАЖДОЕ ПОМЕЩЕНИЕ И \rОРГАНИЧНО СОЛЬЮТСЯ С ЕГО СТИЛЕМ.\r\n'),(44,'dde02b9a7017c12f3635df242d7fec2d','ВАЛЕНСИЯ\r\nСТИЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ВАЛЕНСИЯ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ, А ЭРГОНОМИЧНАЯ ФОРМА СПИНКИ И \rМЯГКОЕ СИДЕНЬЕ ДЕЛАЮТ ИХ НЕОБЫЧАЙНО УДОБНЫМИ. ЭТИ СТУЛЬЯ ХОРОШО ПОДОЙДУТ К ЛЮБОЙ ОФИСНОЙ МЕБЕЛИ ДЛЯ \rПЕРСОНАЛА.\r\r\n \rСТИЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ВАЛЕНСИЯ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ, А ЭРГОНОМИЧНАЯ ФОРМА СПИНКИ И \rМЯГКОЕ СИДЕНЬЕ ДЕЛАЮТ ИХ НЕОБЫЧАЙНО УДОБНЫМИ. ЭТИ СТУЛЬЯ ХОРОШО ПОДОЙДУТ К ЛЮБОЙ ОФИСНОЙ МЕБЕЛИ ДЛЯ \rПЕРСОНАЛА.\r\n'),(45,'e8afd744f2236f58877667738872c313','ФАЗЕНДА\r\nСКЛАДНОЙ ДЕРЕВЯННЫЙ СТУЛ С СИДЕНЬЕМ И СПИНКОЙ ИЗ ПЛОТНОГО ХЛОПКА, ИЗГОТОВЛЕННЫЙ ИЗ НАТУРАЛЬНЫХ ПРИРОДНЫХ МАТЕРИАЛОВ. \rТКАНЬ И ДЕРЕВО СЧИТАЮТСЯ ТЕПЛЫМИ МАТЕРИАЛАМИ - ДАЖЕ ЗИМОЙ СИДЕТЬ НА НИХ КОМФОРТНЕЕ, ЧЕМ НА ЖЕЛЕЗЕ ИЛИ ПЛАСТИКЕ. ЭТО ПРЕКРАСНОЕ РЕШЕНИЕ ДЛЯ ДАЧИ.\r\r\n \rСКЛАДНОЙ ДЕРЕВЯННЫЙ СТУЛ С СИДЕНЬЕМ И СПИНКОЙ ИЗ ПЛОТНОГО ХЛОПКА, ИЗГОТОВЛЕННЫЙ ИЗ НАТУРАЛЬНЫХ ПРИРОДНЫХ МАТЕРИАЛОВ. \rТКАНЬ И ДЕРЕВО СЧИТАЮТСЯ ТЕПЛЫМИ МАТЕРИАЛАМИ - ДАЖЕ ЗИМОЙ СИДЕТЬ НА НИХ КОМФОРТНЕЕ, ЧЕМ НА ЖЕЛЕЗЕ ИЛИ ПЛАСТИКЕ. ЭТО ПРЕКРАСНОЕ РЕШЕНИЕ ДЛЯ ДАЧИ.\r\n'),(46,'fc9d38eebe941fe855bc8731bfa026c1','ЭРА\r\nСТИЛЬНЫЙ СТУЛ НЕОБЫЧНЫЙ ФОРМЫ С ЖЕСТКИМИ СИДЕНЬЯМИ НА МЕТАЛЛИЧЕСКОМ КАРКАСЕ УДОБЕН ТЕМ, \rЧТО МОЖНО КОМПАКТНО СЛОЖИТЬ ДЛЯ ХРАНЕНИЯ ДО 45 ТАКИХ СТУЛЬЕВ. ЛЕГКАЯ И ПРОЧНАЯ МОДЕЛЬ ОТЛИЧНО ПОДОЙДЕТ \rК КОМПЬЮТЕРНОЙ СТОЙКЕ, ТАКЖЕ ЕЕ МОЖНО ИСПОЛЬЗОВАТЬ КАК МЕБЕЛЬ ДЛЯ КАФЕ И БАРОВ.\r\r\n \rСТИЛЬНЫЙ СТУЛ НЕОБЫЧНЫЙ ФОРМЫ С ЖЕСТКИМИ СИДЕНЬЯМИ НА МЕТАЛЛИЧЕСКОМ КАРКАСЕ УДОБЕН ТЕМ, \rЧТО МОЖНО КОМПАКТНО СЛОЖИТЬ ДЛЯ ХРАНЕНИЯ ДО 45 ТАКИХ СТУЛЬЕВ. ЛЕГКАЯ И ПРОЧНАЯ МОДЕЛЬ ОТЛИЧНО ПОДОЙДЕТ \rК КОМПЬЮТЕРНОЙ СТОЙКЕ, ТАКЖЕ ЕЕ МОЖНО ИСПОЛЬЗОВАТЬ КАК МЕБЕЛЬ ДЛЯ КАФЕ И БАРОВ.\r\n'),(47,'3485e5d80bb6fbae95a83915c4aca23f','СИТИ\r\nСТИЛЬНЫЙ, ЛЕГКИЙ И УДОБНЫЙ СТУЛ НА ХРОМИРОВАННОМ ОСНОВАНИИ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ \rСВОЕЙ НЕОБЫЧНОЙ ФОРМОЙ. А РАЗНООБРАЗНЫЕ ВАРИАНТЫ ОБИВКИ ПОЗВОЛЯЮТ ПОДОБРАТЬ НАИЛУЧШЕЕ СОЧЕТАНИЕ С \rЛЮБОЙ КОМПЬЮТЕРНОЙ МЕБЕЛЬЮ.\r\r\n \rСТИЛЬНЫЙ, ЛЕГКИЙ И УДОБНЫЙ СТУЛ НА ХРОМИРОВАННОМ ОСНОВАНИИ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ \rСВОЕЙ НЕОБЫЧНОЙ ФОРМОЙ. А РАЗНООБРАЗНЫЕ ВАРИАНТЫ ОБИВКИ ПОЗВОЛЯЮТ ПОДОБРАТЬ НАИЛУЧШЕЕ СОЧЕТАНИЕ С \rЛЮБОЙ КОМПЬЮТЕРНОЙ МЕБЕЛЬЮ.\r\n'),(48,'53dd08f5b5b2624b7521c7f382c7f9f6','ИЗОПЛАСТ ХРОМ\r\nПОПУЛЯРНАЯ МОДЕЛЬ ОФИСНОГО СТУЛА НА ХРОМИРОВАННОМ МЕТАЛЛИЧЕСКОМ КАРКАСЕ С ПЛАСТИКОВЫМИ СПИНКОЙ И \rСИДЕНЬЕМ ХОРОШО ВПИСЫВАЕТСЯ В ЛЮБОЙ ИНТЕРЬЕР. ПРОЧНЫЕ И ДОЛГОВЕЧНЫЕ, ЭТИ СТУЛЬЯ УДОБНЫ ДЛЯ ИСПОЛЬЗОВАНИЯ \rВ КАЧЕСТВЕ АУДИТОРНЫХ КОНФЕРЕНЦ-КРЕСЕЛ, КРОМЕ ТОГО, ИХ ЛЕГКО ХРАНИТЬ.\r\r\n \rПОПУЛЯРНАЯ МОДЕЛЬ ОФИСНОГО СТУЛА НА ХРОМИРОВАННОМ МЕТАЛЛИЧЕСКОМ КАРКАСЕ С ПЛАСТИКОВЫМИ СПИНКОЙ И \rСИДЕНЬЕМ ХОРОШО ВПИСЫВАЕТСЯ В ЛЮБОЙ ИНТЕРЬЕР. ПРОЧНЫЕ И ДОЛГОВЕЧНЫЕ, ЭТИ СТУЛЬЯ УДОБНЫ ДЛЯ ИСПОЛЬЗОВАНИЯ \rВ КАЧЕСТВЕ АУДИТОРНЫХ КОНФЕРЕНЦ-КРЕСЕЛ, КРОМЕ ТОГО, ИХ ЛЕГКО ХРАНИТЬ.\r\n'),(49,'2efa39d6fa529b12dd51fd7139adec0e','МЯГКАЯ МЕБЕЛЬ\r\nДИВАНЫ, КРЕСЛА И ПРОЧАЯ МЯГКАЯ МЕБЕЛЬ\r\n'),(50,'2c9244e9e768ea36f0bb298526f21402','ОФИСНАЯ МЕБЕЛЬ\r\nДИВАНЫ, СТОЛЫ, СТУЛЬЯ\r\n'),(51,'acd32268f26f878af2a96d753ccbc9c8','МЕБЕЛЬ ДЛЯ КУХНИ\r\nПОЛКИ, ЯЩИКИ, СТОЛЫ И СТУЛЬЯ\r\n'),(52,'e986498f11e924c98c57e35939cf927f','ДЕТСКАЯ МЕБЕЛЬ\r\nКРОВАТИ, СТУЛЬЯ, МЯГКАЯ ДЕТСКАЯ МЕБЕЛЬ\r\n'),(53,'da430218f51fdea19711a3806fb7a3c4','МЕБЕЛЬ НА ЗАКАЗ\r\nНАША КОМПАНИЯ ЗАНИМАЕТСЯ РАЗРАБОТКОЙ МЕБЕЛИ НА ЗАКАЗ.\r\n \rНАША КОМПАНИЯ ЗАНИМАЕТСЯ РАЗРАБОТКОЙ МЕБЕЛИ НА ЗАКАЗ ПО ИНДИВИДУАЛЬНЫМ ПРОЕКТАМ: ВСТРОЕННЫЕ И КОРПУСНЫЕ ШКАФЫ КУПЕ,\rГАРДЕРОБНЫЕ КОМНАТЫ, ПРИХОЖИЕ, БИБЛИОТЕКИ, ПЛАТЯНЫЕ ШКАФЫ, КОМОДЫ И ДРУГИЕ СЛОЖНЫЕ КОНСТРУКЦИИ.\rМЫ СОЗДАЕМ МЕБЕЛЬ ИДЕАЛЬНО ПОДХОДЯЩУЮ ИМЕННО К ВАШЕМУ ДОМУ И ОФИСУ, ИНТЕРЬЕРЫ, МАКСИМАЛЬНО ОТОБРАЖАЮЩИЕ ВАШУ ИНДИВИДУАЛЬНОСТЬ.\rПО ВАШЕЙ ЗАЯВКЕ НАШ СПЕЦИАЛИСТ ПРИЕЗЖАЕТ СО ВСЕМИ ОБРАЗЦАМИ МАТЕРИАЛОВ, С КОТОРЫМИ МЫ РАБОТАЕМ, В ЛЮБОЕ УДОБНОЕ ДЛЯ ВАС ВРЕМЯ И\rПРОИЗВЕДЕТ ВСЕ НЕОБХОДИМЫЕ ЗАМЕРЫ. УЧИТЫВАЯ ВСЕ ВАШИ ПОЖЕЛАНИЯ И ОСОБЕННОСТИ ПОМЕЩЕНИЯ, СОСТАВЛЯЕТСЯ ЭСКИЗНЫЙ ПРОЕКТ.\rПОСЛЕ ЗАКЛЮЧЕНИЯ ДОГОВОРА, В КОТОРОМ ОГОВАРИВАЮТСЯ СРОКИ ДОСТАВКИ И МОНТАЖА МЕБЕЛИ, ЭСКИЗНЫЙ ПРОЕКТ ПЕРЕДАЕТСЯ НА ПРОИЗВОДСТВО,\rГДЕ ОПЫТНЫМИ СПЕЦИАЛИСТАМИ ПРОИЗВОДЯТСЯ РАСЧЕТЫ В ПРОГРАММЕ ТРЕХМЕРНОГО МОДЕЛИРОВАНИЯ. ПОСЛЕ ВСЕХ РАСЧЕТОВ ГОТОВЫЙ ПРОЕКТ ПОСТУПАЕТ\rНЕПОСРЕДСТВЕННО НА ПРОИЗВОДСТВО, ГДЕ ПРОИЗВОДЯТ РАСКРОЙ ДЕТАЛЕЙ, ИХ ОБРАБОТКУ, И СБОРКУ НЕКОТОРЫХ ЭЛЕМЕНТОВ. НАКАНУНЕ ДНЯ ДОСТАВКИ\rСОТРУДНИКИ ОТДЕЛА ТРАНСПОРТНЫХ УСЛУГ СВЯЖУТСЯ С ВАМИ И БОЛЕЕ КОНКРЕТНО ОГОВОРЯТ ВРЕМЯ ДОСТАВКИ. ПОСЛЕ ЗАКЛЮЧЕНИЯ ДОГОВОРА ВАМИ\rВНОСИТСЯ ПРЕДОПЛАТА В РАЗМЕРЕ 30% ОТ СУММЫ ЗАКАЗАННОЙ ВАМИ МЕБЕЛИ. ОСТАЛЬНАЯ СУММА ОПЛАЧИВАЕТСЯ ВАМИ ПО ДОСТАВКЕ.\r\n'),(54,'6ae9d8e3d86f6edc36947e4e39db948b','УСЛУГИ ДИЗАЙНЕРА\r\nМЫ ПРЕДЛАГАЕМ ШИРОКИЙ СПЕКТР УСЛУГ ПО ДИЗАЙНУ МЕБЕЛИ.\r\n \rДИАГНОСТИКА ВОЗМОЖНОСТЕЙ ПРЕОБРАЗОВАНИЯ ПОМЕЩЕНИЙ – ОПРЕДЕЛЕНИЕ ВАРИАНТОВ ПЕРЕПЛАНИРОВКИ, ОТДЕЛКИ, РАЗРАБОТКА НОВЫХ РЕШЕНИЙ КОЛОРИСТКИ, ОСВЕЩЕНИЯ, ПЕРЕСТАНОВКИ МЕБЕЛИ И ДЕКОРА, РАЗРАБОТКА СПЕЦИАЛЬНЫХ ФУНКЦИОНАЛЬНЫХ ЗОН ДЛЯ ПЕРЕКЛЮЧЕНИЯ В РАЗЛИЧНЫЕ РЕЖИМЫ ЖИЗНИ.\rРАЗРАБОТКА ИДЕИ-ОБРАЗА, ПРОВЕДЕНИЕ ПРЕДВАРИТЕЛЬНЫХ РАСЧЁТОВ И СОЗДАНИЕ 3D-МОДЕЛИ: ИЗОБРАЖЕНИЕ ПЕРЕДАЕТ ЦВЕТ И ФАКТУРУ, ПРЕДЛАГАЯ КЛИЕНТУ ЭКСПЕРИМЕНТИРОВАТЬ И ПОДБИРАТЬ ОПТИМАЛЬНЫЙ ВАРИАНТ.\rРАЗРАБОТКА КОМПЬЮТЕРНЫХ ЦВЕТНЫХ ТРЕХМЕРНЫХ МОДЕЛЕЙ МЕБЕЛИ. НАТУРАЛИСТИЧНОСТЬ ИЗОБРАЖЕНИЙ, ИХ ВЫСОКАЯ СХОЖЕСТЬ С ОРИГИНАЛОМ ПОЗВОЛЯЮТ ПРЕДСТАВИТЬ, КАК БУДЕТ ВЫГЛЯДЕТЬ ГОТОВОЕ ИЗДЕЛИЕ, РАССМОТРЕТЬ ЕГО В ДЕТАЛЯХ.\rПОДБОР И РАССТАНОВКА МЕБЕЛИ.\rДЕКОРИРОВАНИЕ - ПОДБОР ДЕКОРА И АКСЕССУАРОВ ИНТЕРЬЕРА В СООТВЕТСТВИИ С ОБРАЗОМ И СТИЛЕМ ПОМЕЩЕНИЯ. ВОЗМОЖНО СОЗДАНИЕ ПО ИНДИВИДУАЛЬНОМУ ЗАПРОСУ ЭКСКЛЮЗИВНЫХ, АВТОРСКИХ КОЛЛЕКЦИЙ.\r\n'),(55,'73b0737b640ddf58dcbdd46d5175e414','ПРОДАВЕЦ-ДИЗАЙНЕР (КУХНИ)\r\nТРЕБОВАНИЯ\rУВЕРЕННЫЙ ПОЛЬЗОВАТЕЛЬ ПК, НАВЫКИ ЧЕРЧЕНИЯ ОТ РУКИ И В ПРОГРАММАХ, ОПЫТ РАБОТЫ ДИЗАЙНЕРОМ/КОНСТРУКТОРОМ В МЕБЕЛЬНОЙ СФЕРЕ, ЭТИКА ДЕЛОВОГО ОБЩЕНИЯ\rОБЯЗАННОСТИ\rКОНСУЛЬТИРОВАНИЕ КЛИЕНТОВ ПО КУХОННОЙ МЕБЕЛИ, ОСТАВЛЕНИЕ ХУДОЖЕСТВЕННО-КОНСТРУКТОРСКИХ ПРОЕКТОВ, ПРИЕМ И ОФОРМЛЕНИЕ ЗАКАЗОВ.\rУСЛОВИЯ\rЗАРПЛАТА: 13500 ОКЛАД + % ОТ ЛИЧНЫХ ПРОДАЖ + ПРЕМИИ‚ СОВОКУПНЫЙ ДОХОД ОТ 20000 РУБ,ПОЛНЫЙ СОЦ. ПАКЕТ‚ ОФОРМЛЕНИЕ СОГЛАСНО ТК РФ\r\n'),(56,'fa5c9c5ac99f37b001a1a0421af4b144','ДИРЕКТОР МАГАЗИНА\r\nТРЕБОВАНИЯ\rВЫСШЕЕ ОБРАЗОВАНИЕ‚ ОПЫТ РУКОВОДЯЩЕЙ РАБОТЫ В РОЗНИЦЕ ОТ 3 ЛЕТ‚ ОПЫТНЫЙ ПОЛЬЗОВАТЕЛЬ ПК‚ ЭТИКА ДЕЛОВОГО ОБЩЕНИЯ‚ ЗНАНИЕ МЕТОДОВ УПРАВЛЕНИЯ И ЗАКЛЮЧЕНИЯ ДОГОВОРОВ‚ ОТЛИЧНОЕ ЗНАНИЕ ТОРГОВОГО И ТРУДОВОГО ЗАКОНОДАТЕЛЬСТВ‚ ОТВЕТСТВЕННОСТЬ‚ ИНИЦИАТИВНОСТЬ‚ АКТИВНОСТЬ.\rОБЯЗАННОСТИ\rРУКОВОДСТВО ДЕЯТЕЛЬНОСТЬЮ МАГАЗИНА‚ ОРГАНИЗАЦИЯ ЭФФЕКТИВНОЙ РАБОТЫ ПЕРСОНАЛА МАГАЗИНА‚ ФИНАНСОВО-ХОЗЯЙСТВЕННАЯ ДЕЯТЕЛЬНОСТЬ И ОТЧЕТНОСТЬ‚ ВЫПОЛНЕНИЕ ПЛАНА ПРОДАЖ‚ ОТЧЕТНОСТЬ.\rУСЛОВИЯ\rТРУДОУСТРОЙСТВО ПО ТК РФ‚ ПОЛНЫЙ СОЦ. ПАКЕТ‚ ГРАФИК РАБОТЫ 5 ЧЕРЕ 2 (168 ЧАС/МЕС)‚ ЗАРПЛАТА: ОКЛАД 28000 + % ОТ ОБОРОТА + ПРЕМИИ‚ СОВОКУПНЫЙ ДОХОД ОТ 35000 РУБ\r\n'),(57,'3187d1b1ae8eb650d8851807a7ab248b','БУХГАЛТЕР ОТДЕЛА УЧЕТА ГОТОВОЙ ПРОДУКЦИИ\r\nТРЕБОВАНИЯ\rЖЕН., 22-45, УВЕРЕННЫЙ ПОЛЬЗОВАТЕЛЬ ПК, ОПЫТ РАБОТЫ БУХГАЛТЕРОМ ПРИВЕТСВУЕТСЯ, ЗНАНИЕ БУХГАЛТЕРСКОГО УЧЕТА (БАЗОВЫЙ УРОВЕНЬ), САМОСТОЯТЕЛЬНОСТЬ, ОТВЕТСТВЕННОСТЬ, КОММУНИКАБЕЛЬНОСТЬ, БЫСТРАЯ ОБУЧАЕМОСТЬ, ЖЕЛАНИЕ РАБОТАТЬ.\rОБЯЗАННОСТИ\rРАБОТА С ПЕРВИЧНЫМИ ДОКУМЕНТАМИ ПО УЧЕТУ МПЗ ВЕДЕНИЕ ЖУРНАЛОВ-ОРДЕРОВ ПО ПРОИЗВОДСТВЕННЫМ СЧЕТАМ ФОРМИРОВАНИЕ МАТЕРИАЛЬНЫХ ОТЧЕТОВ ПОДРАЗДЕЛЕНИЙ ИСПОЛНЕНИЕ ДОПОЛНИТЕЛЬНЫХ ФУНКЦИЙ ПО УКАЗАНИЮ РУКОВОДИТЕЛЯ\rУСЛОВИЯ\rГРАФИК РАБОТЫ 5 ДНЕЙ В НЕДЕЛЮ, АДРЕС РАБОТЫ Г. ШАТУРА, БОТИНСКИЙ ПР-Д, 37. ЗАРПЛАТА: ОКЛАД 10 800 Р. + ПРЕМИЯ 40% ОТ ОКЛАДА, ПОЛНЫЙ СОЦ. ПАКЕТ.\r\n'),(58,'7549c9b852ce0227509f36355ba48fea','CЕРГЕЙ РОДИОНОВ\r\nВЫ СМОЖЕТЕ ОРГАНИЗОВАТЬ ВНУТРИ КОМПАНИИ КОЛЛЕКТИВНУЮ РАБОТУ НАД ПРОЕКТАМИ В РАБОЧИХ ГРУППАХ, ВЕСТИ УЧЕТ И ПЛАНИРОВАНИЕ ВРЕМЕНИ И СОБЫТИЙ, ОБМЕНИВАТЬСЯ СООБЩЕНИЯМИ И ПОЧТОЙ ЧЕРЕЗ ПОРТАЛ, ПРОВОДИТЬ ВНУТРИ КОМПАНИИ ВИДЕОКОНФЕРЕНЦИИ И ДЕЛАТЬ МНОГОЕ ДРУГОЕ.\r\nВЫ СМОЖЕТЕ ОРГАНИЗОВАТЬ ВНУТРИ КОМПАНИИ КОЛЛЕКТИВНУЮ РАБОТУ НАД ПРОЕКТАМИ В РАБОЧИХ ГРУППАХ, ВЕСТИ УЧЕТ И ПЛАНИРОВАНИЕ ВРЕМЕНИ И СОБЫТИЙ, ОБМЕНИВАТЬСЯ СООБЩЕНИЯМИ И ПОЧТОЙ ЧЕРЕЗ ПОРТАЛ, ПРОВОДИТЬ ВНУТРИ КОМПАНИИ ВИДЕОКОНФЕРЕНЦИИ И ДЕЛАТЬ МНОГОЕ ДРУГОЕ.\r\nВЫ СМОЖЕТЕ ОРГАНИЗОВАТЬ ВНУТРИ КОМПАНИИ КОЛЛЕКТИВНУЮ РАБОТУ НАД ПРОЕКТАМИ В РАБОЧИХ ГРУППАХ, ВЕСТИ УЧЕТ И ПЛАНИРОВАНИЕ ВРЕМЕНИ И СОБЫТИЙ, ОБМЕНИВАТЬСЯ СООБЩЕНИЯМИ И ПОЧТОЙ ЧЕРЕЗ ПОРТАЛ, ПРОВОДИТЬ ВНУТРИ КОМПАНИИ ВИДЕОКОНФЕРЕНЦИИ И ДЕЛАТЬ МНОГОЕ ДРУГОЕ.\r\nВЫ СМОЖЕТЕ ОРГАНИЗОВАТЬ ВНУТРИ КОМПАНИИ КОЛЛЕКТИВНУЮ РАБОТУ НАД ПРОЕКТАМИ В РАБОЧИХ ГРУППАХ, ВЕСТИ УЧЕТ И ПЛАНИРОВАНИЕ ВРЕМЕНИ И СОБЫТИЙ, ОБМЕНИВАТЬСЯ СООБЩЕНИЯМИ И ПОЧТОЙ ЧЕРЕЗ ПОРТАЛ, ПРОВОДИТЬ ВНУТРИ КОМПАНИИ ВИДЕОКОНФЕРЕНЦИИ И ДЕЛАТЬ МНОГОЕ ДРУГОЕ.\r\nГЕНЕРАЛЬНЫЙ ДИРЕКТОР\r\nCTC-МЕДИА\r\n'),(59,'f2d2560279c1ff2f9662de0d348f3318','АННА АНДРЕЕВА\r\nВЫ СМОЖЕТЕ ОРГАНИЗОВАТЬ ВНУТРИ КОМПАНИИ КОЛЛЕКТИВНУЮ РАБОТУ НАД ПРОЕКТАМИ В РАБОЧИХ ГРУППАХ, ВЕСТИ УЧЕТ И ПЛАНИРОВАНИЕ ВРЕМЕНИ И СОБЫТИЙ, ОБМЕНИВАТЬСЯ СООБЩЕНИЯМИ И ПОЧТОЙ ЧЕРЕЗ ПОРТАЛ, ПРОВОДИТЬ ВНУТРИ КОМПАНИИ ВИДЕОКОНФЕРЕНЦИИ И ДЕЛАТЬ МНОГОЕ ДРУГОЕ.\r\nВЫ СМОЖЕТЕ ОРГАНИЗОВАТЬ ВНУТРИ КОМПАНИИ КОЛЛЕКТИВНУЮ РАБОТУ НАД ПРОЕКТАМИ В РАБОЧИХ ГРУППАХ, ВЕСТИ УЧЕТ И ПЛАНИРОВАНИЕ ВРЕМЕНИ И СОБЫТИЙ, ОБМЕНИВАТЬСЯ СООБЩЕНИЯМИ И ПОЧТОЙ ЧЕРЕЗ ПОРТАЛ, ПРОВОДИТЬ ВНУТРИ КОМПАНИИ ВИДЕОКОНФЕРЕНЦИИ И ДЕЛАТЬ МНОГОЕ ДРУГОЕ.\r\nВЫ СМОЖЕТЕ ОРГАНИЗОВАТЬ ВНУТРИ КОМПАНИИ КОЛЛЕКТИВНУЮ РАБОТУ НАД ПРОЕКТАМИ В РАБОЧИХ ГРУППАХ, ВЕСТИ УЧЕТ И ПЛАНИРОВАНИЕ ВРЕМЕНИ И СОБЫТИЙ, ОБМЕНИВАТЬСЯ СООБЩЕНИЯМИ И ПОЧТОЙ ЧЕРЕЗ ПОРТАЛ, ПРОВОДИТЬ ВНУТРИ КОМПАНИИ ВИДЕОКОНФЕРЕНЦИИ И ДЕЛАТЬ МНОГОЕ ДРУГОЕ.\r\nВЫ СМОЖЕТЕ ОРГАНИЗОВАТЬ ВНУТРИ КОМПАНИИ КОЛЛЕКТИВНУЮ РАБОТУ НАД ПРОЕКТАМИ В РАБОЧИХ ГРУППАХ, ВЕСТИ УЧЕТ И ПЛАНИРОВАНИЕ ВРЕМЕНИ И СОБЫТИЙ, ОБМЕНИВАТЬСЯ СООБЩЕНИЯМИ И ПОЧТОЙ ЧЕРЕЗ ПОРТАЛ, ПРОВОДИТЬ ВНУТРИ КОМПАНИИ ВИДЕОКОНФЕРЕНЦИИ И ДЕЛАТЬ МНОГОЕ ДРУГОЕ.\r\nМАРКЕТОЛОГ\r\nRK-TELECOM\r\n'),(60,'63f0152ec61c51e41eb8136c50576e04','ДМИТРИЯ ПЯЛОВ\r\nМОЖЕТЕ СРАЗУ ПЕРЕЙТИ С «МЛАДШЕЙ», БАЗОВОЙ РЕДАКЦИИ НА «БИЗНЕС-ПРОЦЕССЫ». ПОСЛЕ ТАКОГО ПЕРЕХОДА ВАШ ПОРТАЛ МОЖНО БУДЕТ ИНТЕГРИРОВАТЬ С ВНЕШНИМ САЙТОМ, НА ПОРТАЛЕ ДОБАВЯТСЯ ВОЗМОЖНОСТИ ВИЗУАЛЬНОГО ПРОЕКТИРОВАНИЯ БИЗНЕС-ПРОЦЕССОВ И УПРАВЛЕНИЯ СПИСКАМИ, ВКЛЮЧАЯ СПИСКИ В РАБОЧИХ ГРУППАХ. КРОМЕ ТОГО, ВЫ СМОЖЕТЕ АНАЛИЗИРОВАТЬ ПОСЕЩАЕМОСТЬ СВОЕГО ПОРТАЛА\r\nМОЖЕТЕ СРАЗУ ПЕРЕЙТИ С «МЛАДШЕЙ», БАЗОВОЙ РЕДАКЦИИ НА «БИЗНЕС-ПРОЦЕССЫ». ПОСЛЕ ТАКОГО ПЕРЕХОДА ВАШ ПОРТАЛ МОЖНО БУДЕТ ИНТЕГРИРОВАТЬ С ВНЕШНИМ САЙТОМ, НА ПОРТАЛЕ ДОБАВЯТСЯ ВОЗМОЖНОСТИ ВИЗУАЛЬНОГО ПРОЕКТИРОВАНИЯ БИЗНЕС-ПРОЦЕССОВ И УПРАВЛЕНИЯ СПИСКАМИ, ВКЛЮЧАЯ СПИСКИ В РАБОЧИХ ГРУППАХ. КРОМЕ ТОГО, ВЫ СМОЖЕТЕ АНАЛИЗИРОВАТЬ ПОСЕЩАЕМОСТЬ СВОЕГО ПОРТАЛА.\r\nМОЖЕТЕ СРАЗУ ПЕРЕЙТИ С «МЛАДШЕЙ», БАЗОВОЙ РЕДАКЦИИ НА «БИЗНЕС-ПРОЦЕССЫ». ПОСЛЕ ТАКОГО ПЕРЕХОДА ВАШ ПОРТАЛ МОЖНО БУДЕТ ИНТЕГРИРОВАТЬ С ВНЕШНИМ САЙТОМ, НА ПОРТАЛЕ ДОБАВЯТСЯ ВОЗМОЖНОСТИ ВИЗУАЛЬНОГО ПРОЕКТИРОВАНИЯ БИЗНЕС-ПРОЦЕССОВ И УПРАВЛЕНИЯ СПИСКАМИ, ВКЛЮЧАЯ СПИСКИ В РАБОЧИХ ГРУППАХ. КРОМЕ ТОГО, ВЫ СМОЖЕТЕ АНАЛИЗИРОВАТЬ ПОСЕЩАЕМОСТЬ СВОЕГО ПОРТАЛА.\r\nМОЖЕТЕ СРАЗУ ПЕРЕЙТИ С «МЛАДШЕЙ», БАЗОВОЙ РЕДАКЦИИ НА «БИЗНЕС-ПРОЦЕССЫ». ПОСЛЕ ТАКОГО ПЕРЕХОДА ВАШ ПОРТАЛ МОЖНО БУДЕТ ИНТЕГРИРОВАТЬ С ВНЕШНИМ САЙТОМ, НА ПОРТАЛЕ ДОБАВЯТСЯ ВОЗМОЖНОСТИ ВИЗУАЛЬНОГО ПРОЕКТИРОВАНИЯ БИЗНЕС-ПРОЦЕССОВ И УПРАВЛЕНИЯ СПИСКАМИ, ВКЛЮЧАЯ СПИСКИ В РАБОЧИХ ГРУППАХ. КРОМЕ ТОГО, ВЫ СМОЖЕТЕ АНАЛИЗИРОВАТЬ ПОСЕЩАЕМОСТЬ СВОЕГО ПОРТАЛА.\r\n\r\nПРОГРАММИСТ \r\n.NET-ДЕВЕЛОПМЕНТ\r\n'),(61,'de42d7ad677574b985939e01c426c976','КОНСТАНТИН ЭРНСТ\r\nМОЖЕТЕ СРАЗУ ПЕРЕЙТИ С «МЛАДШЕЙ», БАЗОВОЙ РЕДАКЦИИ НА «БИЗНЕС-ПРОЦЕССЫ». ПОСЛЕ ТАКОГО ПЕРЕХОДА ВАШ ПОРТАЛ МОЖНО БУДЕТ ИНТЕГРИРОВАТЬ С ВНЕШНИМ САЙТОМ, НА ПОРТАЛЕ ДОБАВЯТСЯ ВОЗМОЖНОСТИ ВИЗУАЛЬНОГО ПРОЕКТИРОВАНИЯ БИЗНЕС-ПРОЦЕССОВ И УПРАВЛЕНИЯ СПИСКАМИ, ВКЛЮЧАЯ СПИСКИ В РАБОЧИХ ГРУППАХ. КРОМЕ ТОГО, ВЫ СМОЖЕТЕ АНАЛИЗИРОВАТЬ ПОСЕЩАЕМОСТЬ СВОЕГО ПОРТАЛА.\r\nМОЖЕТЕ СРАЗУ ПЕРЕЙТИ С «МЛАДШЕЙ», БАЗОВОЙ РЕДАКЦИИ НА «БИЗНЕС-ПРОЦЕССЫ». ПОСЛЕ ТАК\r\nМОЖЕТЕ СРАЗУ ПЕРЕЙТИ С «МЛАДШЕЙ», БАЗОВОЙ РЕДАКЦИИ НА «БИЗНЕС-ПРОЦЕССЫ». ПОСЛЕ ТАКОГО ПЕРЕХОДА ВАШ ПОРТАЛ МОЖНО БУДЕТ ИНТЕГРИРОВАТЬ С ВНЕШНИМ САЙТОМ, НА ПОРТАЛЕ ДОБАВЯТСЯ ВОЗМОЖНОСТИ ВИЗУАЛЬНОГО ПРОЕКТИРОВАНИЯ БИЗНЕС-ПРОЦЕССОВ И УПРАВЛЕНИЯ СПИСКАМИ, ВКЛЮЧАЯ СПИСКИ В РАБОЧИХ ГРУППАХ. КРОМЕ ТОГО, ВЫ СМОЖЕТЕ АНАЛИЗИРОВАТЬ ПОСЕЩАЕМОСТЬ СВОЕГО ПОРТАЛА.\r\nМОЖЕТЕ СРАЗУ ПЕРЕЙТИ С «МЛАДШЕЙ», БАЗОВОЙ РЕДАКЦИИ НА «БИЗНЕС-ПРОЦЕССЫ». ПОСЛЕ ТАКОГО ПЕРЕХОДА ВАШ ПОРТАЛ МОЖНО БУДЕТ ИНТЕГРИРОВАТЬ С ВНЕШНИМ САЙТОМ, НА ПОРТАЛЕ ДОБАВЯТСЯ ВОЗМОЖНОСТИ ВИЗУАЛЬНОГО ПРОЕКТИРОВАНИЯ БИЗНЕС-ПРОЦЕССОВ И УПРАВЛЕНИЯ СПИСКАМИ, ВКЛЮЧАЯ СПИСКИ В РАБОЧИХ ГРУППАХ. КРОМЕ ТОГО, ВЫ СМОЖЕТЕ АНАЛИЗИРОВАТЬ ПОСЕЩАЕМОСТЬ СВОЕГО ПОРТАЛА.\r\nМОЖЕТЕ СРАЗУ ПЕРЕЙТИ С «МЛАДШЕЙ», БАЗОВОЙ РЕДАКЦИИ НА «БИЗНЕС-ПРОЦЕССЫ». ПОСЛЕ ТАКОГО ПЕРЕХОДА ВАШ ПОРТАЛ МОЖНО БУДЕТ ИНТЕГРИРОВАТЬ С ВНЕШНИМ САЙТОМ, НА ПОРТАЛЕ ДОБАВЯТСЯ ВОЗМОЖНОСТИ ВИЗУАЛЬНОГО ПРОЕКТИРОВАНИЯ БИЗНЕС-ПРОЦЕССОВ И УПРАВЛЕНИЯ СПИСКАМИ, ВКЛЮЧАЯ СПИСКИ В РАБОЧИХ ГРУППАХ. КРОМЕ ТОГО, ВЫ СМОЖЕТЕ АНАЛИЗИРОВАТЬ ПОСЕЩАЕМОСТЬ СВОЕГО ПОРТАЛА.\r\n\r\nГЕНЕРАЛЬНЫЙ ДИРЕКТОР\r\nПЕРВЫЙ КАНАЛ\r\n'),(62,'de2e2334b45ee825cf49f06143b04dca','АВТОРИЗАЦИЯ\r\nВЫ УСПЕШНО ЗАРЕГЕСТРИРОВАЛИСЬ.\nВЕРНУТЬСЯ НА ГЛАВНУЮ СТРАНИЦУ\r\n'),(63,'9645640e5e02face6ee27f5cf1dc553f','РЕГИСТРАЦИЯ\r\n\r\n'),(64,'3bdb9664dc9e583919892727d6dc7fb6','ПРОФИЛЬ\r\nTEXT HERE....\r\n'),(65,'6ce3f7ace93208c9b1d84b8a7e69578a','ПОЛЬЗОВАТЕЛЬ\r\n\r\n'),(66,'9645640e5e02face6ee27f5cf1dc553f','РЕГИСТРАЦИЯ\r\n\r\n');
/*!40000 ALTER TABLE `b_search_content_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_title`
--

DROP TABLE IF EXISTS `b_search_content_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_title` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `POS` int(11) NOT NULL,
  `WORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_TITLE` (`SITE_ID`,`WORD`,`SEARCH_CONTENT_ID`,`POS`),
  KEY `IND_B_SEARCH_CONTENT_TITLE` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_title`
--

LOCK TABLES `b_search_content_title` WRITE;
/*!40000 ALTER TABLE `b_search_content_title` DISABLE KEYS */;
INSERT INTO `b_search_content_title` VALUES (1,'s1',0,'УСЛУГИ'),(2,'s1',0,'ПРОДУКЦИЯ'),(3,'s1',0,'АРХИВ'),(4,'s1',0,'АНОНСЫ'),(5,'s1',11,'МЕРОПРИЯТИЙ'),(5,'s1',0,'РАСПИСАНИЕ'),(6,'s1',10,'КОМПАНИЯ'),(6,'s1',0,'МЕБЕЛЬНАЯ'),(7,'s1',0,'НОВОСТИ'),(8,'s1',0,'-'),(9,'s1',0,'-'),(10,'s1',0,'КАРТА'),(10,'s1',6,'САЙТА'),(11,'s1',0,'ПОИСК'),(12,'s1',1,'И'),(12,'s1',0,'МИССИЯ'),(12,'s1',9,'СТРАТЕГИЯ'),(13,'s1',0,'ИСТОРИЯ'),(14,'s1',0,'ВАКАНСИИ'),(15,'s1',2,'КОМПАНИИ'),(15,'s1',0,'О'),(16,'s1',0,'РУКОВОДСТВО'),(17,'s1',0,'ОТЗЫВЫ'),(18,'s1',8,'СОТРУДНИЧЕСТВА'),(18,'s1',0,'УСЛОВИЯ'),(19,'s1',0,'КАК'),(19,'s1',10,'ПАРТНЕРОМ'),(19,'s1',4,'СТАТЬ'),(20,'s1',0,'ВХОД'),(20,'s1',5,'НА'),(20,'s1',8,'САЙТ'),(21,'s1',0,'КОНТАКТЫ'),(22,'s1',16,'БЕЛАРУСИ'),(22,'s1',0,'МЕБЕЛЬНЫЙ'),(22,'s1',10,'ФОРУМ'),(23,'s1',39,'DEL'),(23,'s1',43,'MOBILE'),(23,'s1',33,'SALON'),(23,'s1',24,'ВЫСТАВКА'),(23,'s1',14,'МЕБЕЛЬНАЯ'),(23,'s1',0,'МЕЖДУНАРОДНАЯ'),(24,'s1',17,'ВОДОСТОЙКОЕ'),(24,'s1',0,'ПОЛУЧЕНО'),(24,'s1',9,'ПРОЧНОЕ'),(24,'s1',29,'СОЕДИНЕНИЕ'),(25,'s1',0,'ГЕРЦОГ'),(26,'s1',0,'МОНАЛИЗА'),(27,'s1',0,'МИНИСТР'),(28,'s1',0,'ХРОМ'),(29,'s1',0,'ЛИВЕРПУЛЬ'),(30,'s1',0,'ИЗАБЕЛЛА'),(31,'s1',0,'АЛАДДИН'),(32,'s1',0,'ДЖОКОНДА'),(33,'s1',0,'ФЛОРА'),(34,'s1',0,'ПРЕСТИЖ'),(35,'s1',0,'ЛАУРА'),(36,'s1',0,'МОДЕРН'),(37,'s1',0,'ОПТИМА'),(38,'s1',0,'СОБРАНИЕ'),(39,'s1',0,'ЛИДЕР'),(40,'s1',0,'ПРЕЗИДЕНТ'),(41,'s1',0,'ПЛУТОН'),(42,'s1',0,'ПАРМА'),(43,'s1',0,'ПАЛЕРМО'),(44,'s1',0,'ВАЛЕНСИЯ'),(45,'s1',0,'ФАЗЕНДА'),(46,'s1',0,'ЭРА'),(47,'s1',0,'СИТИ'),(48,'s1',0,'ИЗОПЛАСТ'),(48,'s1',9,'ХРОМ'),(49,'s1',7,'МЕБЕЛЬ'),(49,'s1',0,'МЯГКАЯ'),(50,'s1',8,'МЕБЕЛЬ'),(50,'s1',0,'ОФИСНАЯ'),(51,'s1',7,'ДЛЯ'),(51,'s1',11,'КУХНИ'),(51,'s1',0,'МЕБЕЛЬ'),(52,'s1',0,'ДЕТСКАЯ'),(52,'s1',8,'МЕБЕЛЬ'),(53,'s1',10,'ЗАКАЗ'),(53,'s1',0,'МЕБЕЛЬ'),(53,'s1',7,'НА'),(54,'s1',7,'ДИЗАЙНЕРА'),(54,'s1',0,'УСЛУГИ'),(55,'s1',19,'КУХНИ'),(55,'s1',0,'ПРОДАВЕЦ-ДИЗАЙНЕР'),(56,'s1',0,'ДИРЕКТОР'),(56,'s1',9,'МАГАЗИНА'),(57,'s1',0,'БУХГАЛТЕР'),(57,'s1',23,'ГОТОВОЙ'),(57,'s1',10,'ОТДЕЛА'),(57,'s1',31,'ПРОДУКЦИИ'),(57,'s1',17,'УЧЕТА'),(58,'s1',0,'CЕРГЕЙ'),(58,'s1',7,'РОДИОНОВ'),(59,'s1',5,'АНДРЕЕВА'),(59,'s1',0,'АННА'),(60,'s1',0,'ДМИТРИЯ'),(60,'s1',8,'ПЯЛОВ'),(61,'s1',0,'КОНСТАНТИН'),(61,'s1',11,'ЭРНСТ'),(62,'s1',0,'АВТОРИЗАЦИЯ'),(63,'s1',0,'РЕГИСТРАЦИЯ'),(64,'s1',0,'ПРОФИЛЬ'),(65,'s1',0,'ПОЛЬЗОВАТЕЛЬ'),(66,'s1',0,'РЕГИСТРАЦИЯ');
/*!40000 ALTER TABLE `b_search_content_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_custom_rank`
--

DROP TABLE IF EXISTS `b_search_custom_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_custom_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RANK` int(11) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_CUSTOM_RANK` (`SITE_ID`,`MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_custom_rank`
--

LOCK TABLES `b_search_custom_rank` WRITE;
/*!40000 ALTER TABLE `b_search_custom_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_custom_rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_phrase`
--

DROP TABLE IF EXISTS `b_search_phrase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_phrase` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  `PAGES` int(11) NOT NULL,
  `SESSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO` text COLLATE utf8_unicode_ci,
  `URL_TO_404` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_SESS_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_PH` (`SESSION_ID`,`PHRASE`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_TG` (`SESSION_ID`,`TAGS`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_phrase`
--

LOCK TABLES `b_search_phrase` WRITE;
/*!40000 ALTER TABLE `b_search_phrase` DISABLE KEYS */;
INSERT INTO `b_search_phrase` VALUES (1,'2017-09-13 14:05:01','s1',1,1,'a16420401a81fa6e3c50781440ce53e0','константин',NULL,'http://bitrix.exam1/demo/detail.php?ELEMENT_ID=36','Y','s1',NULL,NULL),(2,'2017-09-13 14:06:02','s1',2,1,'a16420401a81fa6e3c50781440ce53e0','можете сраз',NULL,NULL,NULL,NULL,NULL,NULL),(3,'2017-09-13 14:06:15','s1',0,0,'a16420401a81fa6e3c50781440ce53e0','стс',NULL,NULL,NULL,NULL,NULL,NULL),(4,'2017-09-13 14:06:20','s1',3,1,'a16420401a81fa6e3c50781440ce53e0','первый',NULL,'http://bitrix.exam1/demo/detail.php?ELEMENT_CODE=konstantin-ernst','Y','s1',NULL,NULL),(5,'2017-09-13 14:22:03','s1',0,0,'a16420401a81fa6e3c50781440ce53e0','конс',NULL,NULL,NULL,NULL,NULL,NULL),(6,'2017-09-13 15:00:18','s1',1,1,'a16420401a81fa6e3c50781440ce53e0','отзывы',NULL,'http://bitrix.exam1/rew/index.php','N','s1',NULL,NULL),(7,'2017-09-13 15:00:49','s1',1,1,'a16420401a81fa6e3c50781440ce53e0','дмитри',NULL,'http://bitrix.exam1/demo/detail.php?ELEMENT_ID=35','Y','s1',NULL,NULL),(8,'2017-09-13 15:04:39','s1',1,1,'a16420401a81fa6e3c50781440ce53e0','новости',NULL,'http://bitrix.exam1/news/index.php','N','s1',NULL,NULL),(9,'2017-09-13 15:04:47','s1',4,1,'a16420401a81fa6e3c50781440ce53e0','получено',NULL,'http://bitrix.exam1/news/3/','N','s1',NULL,NULL),(10,'2017-09-13 15:12:38','s1',0,0,'a16420401a81fa6e3c50781440ce53e0','выставка',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `b_search_phrase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_stem`
--

DROP TABLE IF EXISTS `b_search_stem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_stem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STEM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_STEM` (`STEM`)
) ENGINE=InnoDB AUTO_INCREMENT=1322 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_stem`
--

LOCK TABLES `b_search_stem` WRITE;
/*!40000 ALTER TABLE `b_search_stem` DISABLE KEYS */;
INSERT INTO `b_search_stem` VALUES (799,'-НЫ'),(812,'0-15'),(732,'000'),(798,'10'),(739,'10-Й'),(17,'12'),(811,'13'),(1219,'13500'),(734,'149'),(644,'160'),(1248,'168'),(476,'18'),(15,'18-00'),(581,'1962'),(552,'1964'),(365,'1992'),(188,'1992Г'),(215,'1993Г'),(561,'1994'),(235,'1998Г'),(249,'1999Г'),(632,'20'),(594,'2000'),(21,'2000-2012'),(1225,'20000'),(267,'2000Г'),(273,'2002Г'),(520,'2003'),(286,'2003Г'),(301,'2004Г'),(312,'2005Г'),(329,'2006Г'),(338,'2007Г'),(346,'2008Г'),(635,'2010'),(18,'2020'),(13,'212-85-06'),(620,'212-85-07'),(621,'212-85-08'),(1256,'22-45'),(633,'23'),(797,'2542'),(1251,'28000'),(1163,'30'),(731,'300'),(344,'30000'),(1253,'35000'),(479,'36'),(360,'37'),(1181,'3D-МОДЕЛ'),(809,'4-20'),(1280,'40'),(200,'400'),(1104,'45'),(12,'495'),(808,'5-79'),(270,'500'),(248,'5000'),(20,'512'),(19,'560'),(810,'6-2'),(807,'64'),(219,'700'),(359,'70000М2'),(1279,'800'),(735,'871'),(14,'9-00'),(524,'9000'),(16,'CTC-'),(1294,'CTC-МЕД'),(1281,'CЕРГ'),(715,'DEL'),(622,'EMAIL'),(624,'EXAMPLE'),(5,'HERE'),(623,'INFO'),(627,'MARKETING'),(716,'MOBILE'),(781,'N-ВИНИЛКАПРОЛАКТАМ'),(23,'NET-DEV'),(1314,'NET-ДЕВЕЛОПМЕНТ'),(629,'PR'),(22,'RK-TELECOM'),(771,'RU2277566'),(625,'SALES'),(714,'SALON'),(4,'TEXT'),(721,'VIP-КАБИНЕТ'),(720,'VIP-КАБИНЕТОВ'),(1006,'АБСОЛЮТН'),(555,'АВИАЦИОН'),(645,'АВСТР'),(760,'АВТОР'),(1320,'АВТОРИЗАЦ'),(600,'АВТОРИЗОВА'),(1199,'АВТОРСК'),(665,'АДМИНИСТРАТИВН'),(1275,'АДРЕС'),(785,'АКРИЛОВ'),(780,'АКРИЛОНИТР'),(674,'АКСЕССУАР'),(673,'АКСЕССУАРОВ'),(1241,'АКТИВН'),(873,'АЛАДДИН'),(578,'АЛЕКСАНДР'),(784,'АММОН'),(767,'АН'),(1311,'АНАЛИЗИРОВА'),(768,'АНАТОЛЬЕВН'),(868,'АНГЛИЙСК'),(589,'АНДР'),(1296,'АНДРЕ'),(1295,'АНДРЕЕВ'),(6,'АНОНС'),(634,'АПРЕЛ'),(197,'АРЕНДУЕМ'),(3,'АРХ'),(536,'АССОРТИМЕНТ'),(870,'АТМОСФЕР'),(521,'АУД'),(1116,'АУДИТОРН'),(223,'БАЗ'),(1259,'БАЗОВ'),(1109,'БАР'),(1108,'БАРОВ'),(101,'БЕЗОПАСН'),(631,'БЕЛАРУС'),(457,'БЕСЦЕН'),(1129,'БИБЛИОТЕК'),(161,'БИЗНЕС'),(1304,'БИЗНЕС-ПРОЦЕСС'),(1309,'БИЗНЕС-ПРОЦЕССОВ'),(934,'БИЗНЕСМ'),(933,'БИЗНЕСМЕН'),(932,'БИЗНЕСМЕНОВ'),(122,'БЛАГОСОСТОЯН'),(265,'БЛИЖН'),(1014,'БЛОК'),(820,'БОГАТ'),(823,'БОГАТСТВ'),(229,'БОЛ'),(60,'БОЛЬШ'),(1277,'БОТИНСК'),(615,'БУД'),(408,'БУДЕТ'),(424,'БУДУТ'),(1062,'БУК'),(1254,'БУХГАЛТЕР'),(1258,'БУХГАЛТЕРСК'),(213,'БЫСТР'),(637,'ВАЖН'),(181,'ВАЖНОСТ'),(363,'ВАКАНС'),(1077,'ВАЛЕНС'),(391,'ВАН'),(439,'ВАРИАНТ'),(438,'ВАРИАНТОВ'),(1138,'ВАС'),(216,'ВВЕД'),(1028,'ВЕД'),(1266,'ВЕДЕН'),(278,'ВЕДУЩ'),(1003,'ВЕЛИКОЛЕПН'),(494,'ВЕР'),(601,'ВЕРНУТ'),(1286,'ВЕСТ'),(155,'ВЗАИМОВЫГОДН'),(74,'ВЗГЛЯД'),(73,'ВЗГЛЯДОВ'),(164,'ВЗЯТ'),(851,'ВИД'),(1293,'ВИДЕОКОНФЕРЕНЦ'),(1308,'ВИЗУАЛЬН'),(548,'ВИКТОР'),(209,'ВКЛАДЫВА'),(722,'ВКЛЮЧ'),(789,'ВКЛЮЧА'),(590,'ВЛАДИМИРОВИЧ'),(381,'ВМЕСТ'),(1019,'ВМЕСТИТЕЛЬН'),(135,'ВНЕДРЕН'),(1054,'ВНЕСУТ'),(850,'ВНЕШН'),(1080,'ВНИМАН'),(1161,'ВНОС'),(1284,'ВНУТР'),(742,'ВОДОСТОЙК'),(569,'ВОЗГЛАВЛЯ'),(45,'ВОЗМОЖН'),(974,'ВОЗНИКА'),(487,'ВОЗРАСТ'),(486,'ВОЗРАСТОВ'),(982,'ВОЙДЕТ'),(919,'ВОПЛОЩ'),(185,'ВОПРОС'),(988,'ВОПРОСОВ'),(236,'ВОРОНЕЖ'),(557,'ВОРОНЕЖСК'),(981,'ВОТ-ВОТ'),(274,'ВОШЛ'),(705,'ВПЕРВ'),(936,'ВПЕРЕД'),(838,'ВПЕЧАТЛЯЮЩ'),(1114,'ВПИСЫВА'),(366,'ВРЕМ'),(939,'ВРЕМЕН'),(1039,'ВРУЧН'),(726,'ВСЕГ'),(67,'ВСЕГД'),(119,'ВСЕМ'),(131,'ВСЕХ'),(614,'ВСТРЕЧ'),(1125,'ВСТРОЕН'),(339,'ВТОР'),(598,'ВХОД'),(573,'ВХОДЯ'),(941,'ВЫБОР'),(427,'ВЫБРА'),(839,'ВЫГЛЯД'),(425,'ВЫГЛЯДЕТ'),(319,'ВЫГРУЗК'),(444,'ВЫПОЛН'),(163,'ВЫПОЛНЕН'),(948,'ВЫПОЛНЯ'),(320,'ВЫПУСК'),(76,'ВЫПУСКА'),(825,'ВЫРАЖ'),(38,'ВЫРАЖЕН'),(149,'ВЫСОК'),(485,'ВЫСОКОКЛАССН'),(983,'ВЫСОКОПОСТАВЛЕН'),(136,'ВЫСОКОПРОИЗВОДИТЕЛЬН'),(496,'ВЫСОЧАЙШ'),(682,'ВЫСТАВК'),(252,'ВЫСТАВОК'),(1232,'ВЫСШ'),(1038,'ВЫТОЧ'),(151,'ВЫХОД'),(475,'ГАРАНТ'),(1127,'ГАРДЕРОБН'),(575,'ГЕНЕРАЛЬН'),(813,'ГЕРЦОГ'),(58,'ГИБК'),(121,'ГИГИЕНИЧЕСК'),(1022,'ГЛАВ'),(373,'ГЛАВН'),(987,'ГЛОБАЛЬН'),(256,'ГОД'),(480,'ГОРД'),(756,'ГОРЯЧ'),(887,'ГОСТЕВ'),(389,'ГОСТИН'),(558,'ГОСУДАРСТВЕН'),(660,'ГОТОВ'),(464,'ГРАМОТН'),(737,'ГРАНДИОЗН'),(1246,'ГРАФИК'),(574,'ГРУПП'),(277,'ДАН'),(1097,'ДАЧ'),(205,'ДВАДЦА'),(1001,'ДВП'),(656,'ДВУХ'),(902,'ДВУХМЕСТН'),(821,'ДЕКОР'),(1195,'ДЕКОРИРОВАН'),(168,'ДЕЛ'),(1082,'ДЕЛА'),(680,'ДЕЛОВ'),(667,'ДЕМОНСТРИРОВА'),(375,'ДЕН'),(895,'ДЕР'),(894,'ДЕРЕВ'),(203,'ДЕРЕВООБРАБАТЫВА'),(865,'ДЕРЕВЯ'),(275,'ДЕСЯТК'),(662,'ДЕТ'),(415,'ДЕТАЛ'),(388,'ДЕТСК'),(997,'ДЕШЕВ'),(572,'ДЕЯТЕЛЬН'),(889,'ДЖОКОНД'),(1170,'ДИАГНОСТИК'),(1119,'ДИВА'),(394,'ДИЗАЙН'),(401,'ДИЗАЙН-ПРОЕКТ'),(397,'ДИЗАЙНЕР'),(917,'ДИЗАЙНЕРСК'),(298,'ДИЛЕРСК'),(29,'ДИНАМИЧН'),(250,'ДИПЛОМАНТ'),(576,'ДИРЕКТОР'),(1298,'ДМИТР'),(1273,'ДНЕ'),(173,'ДНЯ'),(78,'ДОБ'),(1073,'ДОБАВ'),(154,'ДОВЕРИТЕЛЬН'),(300,'ДОГОВОР'),(299,'ДОГОВОРОВ'),(1264,'ДОКУМЕНТ'),(501,'ДОЛ'),(1115,'ДОЛГОВЕЧН'),(51,'ДОЛГОСРОЧН'),(955,'ДОЛЖНОСТН'),(380,'ДОМ'),(1072,'ДОМАШН'),(653,'ДОМОТЕХ'),(792,'ДОПОЛНИТЕЛЬН'),(609,'ДОСТАВК'),(445,'ДОСТАВЛ'),(788,'ДОСТИГА'),(852,'ДОСТИГНУТ'),(41,'ДОСТИЖЕН'),(1021,'ДОСТОИНСТВ'),(1224,'ДОХОД'),(1059,'ДРЕВЕСН'),(510,'ДРУГ'),(1000,'ДСП'),(272,'ЕВРОПЕЙСК'),(253,'ЕВРОЭКСПОМЕБЕЛЬ-99'),(763,'ЕГОР'),(71,'ЕДИН'),(511,'ЕЖЕГОДН'),(886,'ЕЖЕДНЕВН'),(311,'ЕКАТЕРИНБУРГ'),(1008,'ЕМ'),(166,'ЖДЕТ'),(828,'ЖЕЛАН'),(1094,'ЖЕЛЕЗ'),(1255,'ЖЕН'),(861,'ЖЕСТК'),(426,'ЖИЗН'),(47,'ЖИЗНЕН'),(1268,'ЖУРНАЛОВ-ОРДЕР'),(1267,'ЖУРНАЛОВ-ОРДЕРОВ'),(113,'ЗАБОТ'),(483,'ЗАВЕДЕН'),(302,'ЗАВЕРШ'),(241,'ЗАВОЕВЫВА'),(318,'ЗАГРУЗК'),(608,'ЗАДАН'),(62,'ЗАДАЧ'),(443,'ЗАКАЗ'),(1165,'ЗАКАЗА'),(1217,'ЗАКАЗОВ'),(65,'ЗАКАЗЧИК'),(258,'ЗАКЛЮЧ'),(271,'ЗАКЛЮЧА'),(297,'ЗАКЛЮЧЕН'),(1239,'ЗАКОНОДАТЕЛЬСТВ'),(554,'ЗАКОНЧ'),(171,'ЗАЛОГ'),(399,'ЗАМЕР'),(587,'ЗАМЕСТИТЕЛ'),(1124,'ЗАНИМА'),(1197,'ЗАПРОС'),(353,'ЗАПУЩ'),(207,'ЗАРАБОТА'),(1321,'ЗАРЕГЕСТРИРОВА'),(599,'ЗАРЕГИСТРИРОВА'),(1218,'ЗАРПЛАТ'),(266,'ЗАРУБЕЖ'),(540,'ЗАРУБЕЖН'),(542,'ЗАСЛУГ'),(142,'ЗАТРАТ'),(972,'ЗАХОД'),(102,'ЗАЩИТ'),(186,'ЗАЩИЩЕН'),(724,'ЗАЯВК'),(713,'ЗАЯВОК'),(666,'ЗДАН'),(1049,'ЗДОРОВ'),(1091,'ЗИМ'),(1234,'ЗНАН'),(946,'ЗНАЧ'),(233,'ЗНАЧИТЕЛЬН'),(827,'ЗОЛОТ'),(953,'ЗОН'),(534,'ИГРОК'),(533,'ИГРОКОВ'),(495,'ИД'),(1134,'ИДЕАЛЬН'),(1179,'ИДЕИ-ОБРАЗ'),(871,'ИЗАБЕЛЛ'),(469,'ИЗБЕЖА'),(386,'ИЗГОТОВ'),(190,'ИЗГОТОВЛЕН'),(509,'ИЗДЕЛ'),(1182,'ИЗОБРАЖЕН'),(745,'ИЗОБРЕТЕН'),(1111,'ИЗОПЛАСТ'),(824,'ИЗЫСК'),(990,'ИЗЫСКА'),(814,'ИЗЯЩН'),(34,'ИМЕЕТ'),(442,'ИМЕН'),(347,'ИНДИВИДУАЛЬН'),(583,'ИНЖЕНЕР-ТЕХНОЛОГ'),(1240,'ИНИЦИАТИВН'),(560,'ИНСТИТУТ'),(40,'ИНСТРУМЕНТ'),(1306,'ИНТЕГРИРОВА'),(159,'ИНТЕРЕС'),(717,'ИНТЕРЕСН'),(402,'ИНТЕРЬЕР'),(969,'ИНТЕРЬЕРН'),(474,'ИНТЕРЬЕРОВ'),(523,'ИС'),(1063,'ИСКЛЮЧЕН'),(898,'ИСПОЛНЕН'),(964,'ИСПОЛЬЗОВА'),(459,'ИСПОЛЬЗОВАН'),(751,'ИСПОЛЬЗУЕМ'),(514,'ИСПЫТАН'),(187,'ИСТОР'),(580,'ИЮН'),(977,'КАБИНЕТ'),(43,'КАЖД'),(1317,'КАНА'),(796,'КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДН'),(777,'КАРБАМИДОФОРМАЛЬДЕГИДН'),(815,'КАРКАС'),(24,'КАРТ'),(957,'КАТЕГОР'),(1071,'КАФ'),(75,'КАЧЕСТВ'),(736,'КВ'),(150,'КВАЛИФИКАЦ'),(527,'КВАЛИФИЦИРОВА'),(786,'КИСЛОТ'),(867,'КЛАССИЧЕСК'),(775,'КЛЕ'),(744,'КЛЕЕВ'),(748,'КЛЕЯ'),(66,'КЛИЕНТ'),(1213,'КЛИЕНТОВ'),(872,'КОЖ'),(547,'КОЛЕСНИК'),(546,'КОЛЕСНИКОВ'),(947,'КОЛЛЕГ'),(268,'КОЛЛЕКТ'),(1285,'КОЛЛЕКТИВН'),(1200,'КОЛЛЕКЦ'),(1174,'КОЛОРИСТК'),(892,'КОЛОРИТН'),(908,'КОМБИНАЦ'),(1261,'КОММУНИКАБЕЛЬН'),(392,'КОМНАТ'),(1131,'КОМОД'),(1101,'КОМПАКТН'),(10,'КОМПАН'),(473,'КОМПЛЕКСН'),(324,'КОМПЛЕКТ'),(754,'КОМПОЗИЦ'),(805,'КОМПОНЕНТ'),(804,'КОМПОНЕНТОВ'),(921,'КОМПОНОВК'),(1052,'КОМПЬЮТЕР'),(460,'КОМПЬЮТЕРН'),(349,'КОМФОРТ'),(874,'КОМФОРТН'),(431,'КОНКРЕТН'),(938,'КОНКУРЕНТ'),(703,'КОНКУРЕНТН'),(937,'КОНКУРЕНТОВ'),(689,'КОНКУРС'),(1315,'КОНСТАНТИН'),(1208,'КОНСТРУКТОР'),(1133,'КОНСТРУКЦ'),(605,'КОНСУЛЬТАЦ'),(1212,'КОНСУЛЬТИРОВАН'),(603,'КОНТАКТ'),(261,'КОНТРАКТ'),(260,'КОНТРАКТОВ'),(451,'КОНТРОЛ'),(906,'КОНУСН'),(295,'КОНФЕРЕНЦ'),(1117,'КОНФЕРЕНЦ-КРЕСЕЛ'),(314,'КОНЦЕРН'),(571,'КООРДИНИР'),(303,'КОРПУС'),(372,'КОРПУСН'),(342,'КОРПУСОВ'),(111,'КОРРЕКТИР'),(33,'КОТОР'),(991,'КРАСОТ'),(1044,'КРЕСЕЛ'),(833,'КРЕСЛ'),(855,'КРЕСТОВИН'),(1123,'КРОВАТ'),(518,'КРОМ'),(1023,'КРУГЛ'),(371,'КРУПН'),(1126,'КУП'),(387,'КУХН'),(664,'КУХОН'),(516,'ЛАБОРАТОР'),(646,'ЛАТВ'),(901,'ЛАУР'),(1026,'ЛЕГЕНДАРН'),(1105,'ЛЕГК'),(528,'ЛЕТ'),(864,'ЛИВЕРПУЛ'),(284,'ЛИДЕР'),(283,'ЛИДЕРОВ'),(531,'ЛИДИР'),(316,'ЛИН'),(647,'ЛИТВ'),(82,'ЛИЧН'),(1064,'ЛИШ'),(44,'ЛУЧШ'),(1032,'ЛЮБ'),(201,'М2'),(1231,'МАГАЗИН'),(239,'МАГАЗИН-САЛОН'),(336,'МАГАЗИНОВ-САЛОН'),(335,'МАГАЗИНОВ-САЛОНОВ'),(1135,'МАКСИМАЛЬН'),(565,'МАЛ'),(368,'МАЛЕНЬК'),(628,'МАРКЕТИНГ'),(709,'МАРКЕТИНГОВ'),(1297,'МАРКЕТОЛОГ'),(806,'МАС'),(951,'МАСС'),(1061,'МАССИВ'),(875,'МАССИВН'),(505,'МАССОВ'),(684,'МАСТЕР-КЛАСС'),(198,'МАСТЕРСК'),(134,'МАСТЕРСТВ'),(686,'МАСШТАБН'),(292,'МАТЕРИА'),(291,'МАТЕРИАЛ'),(290,'МАТЕРИАЛОВ'),(127,'МАТЕРИАЛЬН'),(191,'МЕБЕЛ'),(9,'МЕБЕЛЬН'),(328,'МЕБЕЛЬПЛЮС'),(152,'МЕЖДУНАРОДН'),(414,'МЕЛЬЧАЙШ'),(522,'МЕНЕДЖМЕНТ'),(112,'МЕР'),(8,'МЕРОПРИЯТ'),(1250,'МЕС'),(118,'МЕСТ'),(478,'МЕСЯЦ'),(477,'МЕСЯЦЕВ'),(1099,'МЕТАЛЛИЧЕСК'),(1236,'МЕТОД'),(1235,'МЕТОДОВ'),(884,'МЕХАНИЗМ'),(766,'МЕЩЕРЯК'),(765,'МЕЩЕРЯКОВ'),(500,'МИНИМАЛЬН'),(980,'МИНИМУМ'),(832,'МИНИСТР'),(651,'МИНСК'),(727,'МИР'),(257,'МИРОВ'),(27,'МИСС'),(764,'МИХАЙЛОВИЧ'),(1302,'МЛАДШ'),(436,'МНОГ'),(758,'МНОГОКОМПОНЕНТН'),(461,'МНОГОЛЕТН'),(697,'МОД'),(379,'МОДЕЛ'),(1149,'МОДЕЛИРОВАН'),(912,'МОДЕРН'),(222,'МОДЕРНИЗАЦ'),(794,'МОДИФИКАТОР'),(610,'МОЖЕТ'),(841,'МОЖН'),(211,'МОЛОД'),(489,'МОЛОДЕЖ'),(453,'МОМЕНТ'),(822,'МОНАЛИЗ'),(1145,'МОНТАЖ'),(126,'МОРАЛЬН'),(244,'МОСКВ'),(61,'МОЩНОСТ'),(1265,'МПЗ'),(918,'МЫСЛ'),(327,'МЯГК'),(923,'НАБОР'),(1205,'НАВЫК'),(422,'НАГЛЯДН'),(56,'НАДЕЖН'),(440,'НАИБОЛ'),(931,'НАИЛУЧШ'),(950,'НАЙТ'),(1156,'НАКАНУН'),(893,'НАКЛАДК'),(503,'НАЛАЖ'),(538,'НАЛАЖИВА'),(376,'НАМ'),(537,'НАРАЩИВА'),(690,'НАРОДН'),(484,'НАС'),(568,'НАСТОЯ'),(269,'НАСЧИТЫВА'),(1188,'НАТУРАЛИСТИЧН'),(321,'НАТУРАЛЬН'),(899,'НАХОД'),(586,'НАЧАЛЬНИК'),(189,'НАЧИНА'),(985,'НАЧНЕТ'),(160,'НАШ'),(1274,'НЕДЕЛ'),(1050,'НЕЗАМЕНИМ'),(1155,'НЕКОТОР'),(844,'НЕМ'),(924,'НЕОБХОДИМ'),(879,'НЕОБЫКНОВЕН'),(1083,'НЕОБЫЧАЙН'),(856,'НЕОБЫЧН'),(385,'НЕПОВТОРИМ'),(1152,'НЕПОСРЕДСТВЕН'),(835,'НЕСМОТР'),(395,'НЕСТАНДАРТН'),(331,'НИЖН'),(836,'НИЗК'),(1093,'НИХ'),(138,'НОВ'),(332,'НОВГОРОД'),(916,'НОВИЗН'),(668,'НОВИНК'),(11,'НОВОСТ'),(1015,'НОГ'),(1010,'НОЖК'),(508,'НОМЕНКЛАТУР'),(99,'НОРМ'),(412,'НЮАНС'),(411,'НЮАНСОВ'),(1056,'ОБАЯН'),(384,'ОБЕСПЕЧ'),(125,'ОБЕСПЕЧЕН'),(94,'ОБЕСПЕЧИВА'),(687,'ОБЕЩА'),(818,'ОБИВК'),(670,'ОБИВОЧН'),(746,'ОБЛАСТ'),(920,'ОБЛИК'),(1289,'ОБМЕНИВА'),(351,'ОБНОВЛЕН'),(1252,'ОБОРОТ'),(137,'ОБОРУДОВАН'),(1154,'ОБРАБОТК'),(1196,'ОБРАЗ'),(553,'ОБРАЗОВАН'),(694,'ОБРАЗЦ'),(693,'ОБРАЗЦОВ'),(604,'ОБРАТ'),(1025,'ОБСТАНОВК'),(986,'ОБСУЖДЕН'),(46,'ОБУСТРО'),(952,'ОБУСТРОЙСТВ'),(1262,'ОБУЧАЕМ'),(130,'ОБУЧЕН'),(340,'ОБЩ'),(1211,'ОБЩЕН'),(492,'ОБЪЕДИНЯ'),(88,'ОБЪЕМ'),(420,'ОБЪЕМН'),(956,'ОБЯЗАН'),(165,'ОБЯЗАТЕЛЬСТВ'),(1144,'ОГОВАРИВА'),(1160,'ОГОВОР'),(1042,'ОГРАНИЧЕН'),(202,'ОДН'),(64,'ОЖИДАН'),(1037,'ОКАНТОВК'),(1220,'ОКЛАД'),(103,'ОКРУЖА'),(458,'ОП'),(1009,'ОПИРА'),(772,'ОПИСАН'),(1167,'ОПЛАЧИВА'),(63,'ОПРАВДЫВА'),(433,'ОПРЕДЕЛЕН'),(943,'ОПРЕДЕЛЯ'),(994,'ОПРОВЕРГА'),(711,'ОПРОС'),(940,'ОПТИМ'),(54,'ОПТИМАЛЬН'),(141,'ОПТИМИЗАЦ'),(472,'ОПТИМИЗИРОВА'),(1147,'ОПЫТН'),(926,'ОРГАНИЗАЦ'),(285,'ОРГАНИЗАЦИОН'),(945,'ОРГАНИЗОВА'),(1075,'ОРГАНИЧН'),(1190,'ОРИГИНАЛ'),(849,'ОРИГИНАЛЬН'),(430,'ОСВЕЩЕН'),(1011,'ОСВОБОЖД'),(905,'ОСН'),(117,'ОСНАЩЕН'),(904,'ОСНОВ'),(174,'ОСНОВАН'),(913,'ОСНОВН'),(393,'ОСОБ'),(1047,'ОСОБЕН'),(1214,'ОСТАВЛЕН'),(1166,'ОСТАЛЬН'),(183,'ОСТАН'),(450,'ОСУЩЕСТВЛЯ'),(759,'ОТВЕРДИТЕЛ'),(618,'ОТВЕТ'),(83,'ОТВЕТСТВЕН'),(1157,'ОТДЕЛ'),(1173,'ОТДЕЛК'),(323,'ОТДЕЛЬН'),(595,'ОТЗЫВ'),(237,'ОТКР'),(325,'ОТКРЫВА'),(309,'ОТКРЫТ'),(1106,'ОТЛИЧН'),(162,'ОТНОС'),(156,'ОТНОШЕН'),(1136,'ОТОБРАЖА'),(638,'ОТРАСЛ'),(710,'ОТЧЕТ'),(1243,'ОТЧЕТН'),(1270,'ОТЧЕТОВ'),(194,'ОФИС'),(652,'ОФИСКОМФОРТ'),(842,'ОФИСН'),(193,'ОФИСОВ'),(254,'ОФИЦИАЛЬН'),(454,'ОФОРМЛЕН'),(470,'ОШИБОК'),(976,'ОЩУЩЕН'),(1228,'ПАКЕТ'),(1068,'ПАЛЕРМ'),(1067,'ПАЛИТР'),(1053,'ПАРМ'),(1043,'ПАРТ'),(158,'ПАРТНЕР'),(169,'ПАРТНЕРОВ'),(355,'ПАРТНЕРСТВ'),(769,'ПАТЕНТ'),(195,'ПЕРВ'),(1263,'ПЕРВИЧН'),(699,'ПЕРЕГОВОР'),(973,'ПЕРЕГОВОРОВ'),(960,'ПЕРЕГОРОДК'),(35,'ПЕРЕД'),(1146,'ПЕРЕДА'),(456,'ПЕРЕДОВ'),(1301,'ПЕРЕЙТ'),(1177,'ПЕРЕКЛЮЧЕН'),(1172,'ПЕРЕПЛАНИРОВК'),(1175,'ПЕРЕСТАНОВК'),(1305,'ПЕРЕХОД'),(228,'ПЕРЕШЛ'),(942,'ПЕРСОНА'),(52,'ПЕРСПЕКТИВ'),(579,'ПЕТРОВИЧ'),(1204,'ПК'),(1020,'ПЛАВН'),(1244,'ПЛАН'),(1287,'ПЛАНИРОВАН'),(1095,'ПЛАСТИК'),(1113,'ПЛАСТИКОВ'),(1130,'ПЛАТЯН'),(909,'ПЛОТН'),(199,'ПЛОЩАД'),(1045,'ПЛУТОН'),(231,'ПОВЫС'),(85,'ПОВЫШЕН'),(725,'ПОДА'),(1186,'ПОДБИРА'),(1193,'ПОДБОР'),(678,'ПОДГОТОВ'),(564,'ПОДГОТОВК'),(708,'ПОДГОТОВЛ'),(543,'ПОДГОТОВЛЕН'),(862,'ПОДДЕРЖИВА'),(831,'ПОДЛОКОТНИК'),(857,'ПОДЛОКОТНИКОВ'),(245,'ПОДМОСКОВ'),(403,'ПОДОБРА'),(1107,'ПОДОЙДЕТ'),(1084,'ПОДОЙДУТ'),(1271,'ПОДРАЗДЕЛЕН'),(167,'ПОДХОД'),(441,'ПОДХОДЯ'),(1141,'ПОЖЕЛАН'),(210,'ПОЗВОЛ'),(462,'ПОЗВОЛЯ'),(863,'ПОЗВОНОЧНИК'),(532,'ПОЗИЦ'),(695,'ПОЗНАКОМ'),(26,'ПОИСК'),(685,'ПОИСТИН'),(491,'ПОКОЛЕН'),(606,'ПОКУПК'),(1012,'ПОЛЕЗН'),(559,'ПОЛИТЕХНИЧЕСК'),(105,'ПОЛИТИК'),(1121,'ПОЛК'),(968,'ПОЛН'),(361,'ПОЛУТОР'),(525,'ПОЛУЧ'),(747,'ПОЛУЧЕН'),(1203,'ПОЛЬЗОВАТЕЛ'),(648,'ПОЛЬШ'),(400,'ПОМЕЩЕН'),(675,'ПОМИМ'),(406,'ПОМОГУТ'),(1024,'ПОМОЖЕТ'),(617,'ПОМОЧ'),(840,'ПОМОЩ'),(180,'ПОНИМА'),(81,'ПОНИМАН'),(1034,'ПОНЯТ'),(1112,'ПОПУЛЯРН'),(911,'ПОРОЛОН'),(910,'ПОРОЛОНОВ'),(1292,'ПОРТА'),(1307,'ПОРТАЛ'),(730,'ПОСЕТ'),(712,'ПОСЕТИТЕЛ'),(1312,'ПОСЕЩАЕМ'),(1143,'ПОСЛ'),(90,'ПОСЛЕД'),(419,'ПОСМОТРЕТ'),(262,'ПОСТАВК'),(59,'ПОСТАВЩИК'),(227,'ПОСТЕПЕН'),(86,'ПОСТОЯ'),(1151,'ПОСТУПА'),(1040,'ПОТ'),(69,'ПОТРЕБИТЕЛ'),(967,'ПОТРЕБН'),(858,'ПОТРЯСА'),(613,'ПОЧТ'),(1278,'ПР-Д'),(68,'ПРАВ'),(100,'ПРАВИЛ'),(944,'ПРАВИЛЬН'),(700,'ПРАКТИЧЕСК'),(493,'ПРЕДАН'),(1180,'ПРЕДВАРИТЕЛЬН'),(1184,'ПРЕДЛАГ'),(53,'ПРЕДЛАГА'),(701,'ПРЕДЛОЖЕН'),(663,'ПРЕДМЕТ'),(755,'ПРЕДНАЗНАЧ'),(1162,'ПРЕДОПЛАТ'),(435,'ПРЕДОСТАВЛ'),(42,'ПРЕДОСТАВЛЯ'),(728,'ПРЕДПОЛАГА'),(32,'ПРЕДПРИЯТ'),(1191,'ПРЕДСТАВ'),(305,'ПРЕДСТАВИТЕЛЬСТВ'),(661,'ПРЕДСТАВЛ'),(421,'ПРЕДСТАВЛЕН'),(978,'ПРЕЗИДЕНТ'),(704,'ПРЕИМУЩЕСТВ'),(1096,'ПРЕКРАСН'),(1222,'ПРЕМ'),(979,'ПРЕМЬЕР-МИНИСТР'),(1171,'ПРЕОБРАЗОВАН'),(757,'ПРЕССОВАН'),(896,'ПРЕСТИЖ'),(251,'ПРЕСТИЖН'),(92,'ПРИБ'),(172,'ПРИБЫЛЬН'),(1257,'ПРИВЕТСВ'),(1079,'ПРИВЛЕКА'),(993,'ПРИВЛЕКАТЕЛЬН'),(146,'ПРИВЛЕЧЕН'),(935,'ПРИВЫКЛ'),(878,'ПРИДА'),(1137,'ПРИЕЗЖА'),(455,'ПРИЕМ'),(255,'ПРИЗНАН'),(499,'ПРИМЕНЕН'),(782,'ПРИМЕНЯ'),(184,'ПРИМЕР'),(848,'ПРИМЕЧАТЕЛЬН'),(641,'ПРИНИМА'),(655,'ПРИНЦИП'),(110,'ПРИНЯТ'),(313,'ПРИОБРЕТА'),(626,'ПРИОБРЕТЕН'),(1088,'ПРИРОДН'),(954,'ПРИСПОСОБ'),(966,'ПРИСПОСОБЛЕН'),(287,'ПРИСТУП'),(1128,'ПРИХОЖ'),(795,'ПРИЧ'),(294,'ПРОВЕД'),(729,'ПРОВЕДЕН'),(698,'ПРОВЕСТ'),(738,'ПРОВОД'),(563,'ПРОГРАММ'),(1313,'ПРОГРАММИСТ'),(1201,'ПРОДАВЕЦ-ДИЗАЙНЕР'),(1221,'ПРОДАЖ'),(423,'ПРОДЕМОНСТРИР'),(350,'ПРОДОЛЖА'),(2,'ПРОДУКЦ'),(348,'ПРОЕКТ'),(471,'ПРОЕКТИРОВАН'),(1216,'ПРОЕКТОВ'),(1139,'ПРОИЗВЕДЕТ'),(398,'ПРОИЗВЕДУТ'),(463,'ПРОИЗВЕСТ'),(1041,'ПРОИЗВОД'),(97,'ПРОИЗВОДИМ'),(276,'ПРОИЗВОДИТЕЛ'),(140,'ПРОИЗВОДИТЕЛЬН'),(341,'ПРОИЗВОДСВЕННО-СКЛАДСК'),(89,'ПРОИЗВОДСТВ'),(31,'ПРОИЗВОДСТВЕН'),(999,'ПРОИСХОД'),(753,'ПРОМЫШЛЕН'),(413,'ПРОРИСОВК'),(1029,'ПРОСТ'),(829,'ПРОСТЕЖК'),(49,'ПРОСТРАНСТВ'),(773,'ПРОТОТИП'),(133,'ПРОФЕССИОНАЛЬН'),(1319,'ПРОФИЛ'),(512,'ПРОХОД'),(504,'ПРОЦЕСС'),(1120,'ПРОЧ'),(741,'ПРОЧН'),(481,'ПРОШЕДШ'),(562,'ПРОШЕЛ'),(367,'ПРОШЛ'),(907,'ПРУЖИН'),(84,'ПУТ'),(1300,'ПЯЛ'),(1299,'ПЯЛОВ'),(650,'ПЯТ'),(378,'ПЯТИСОТ'),(77,'РАБОТ'),(50,'РАБОТА'),(80,'РАБОТНИК'),(79,'РАБОТНИКОВ'),(1048,'РАБОТОСПОСОБН'),(48,'РАБОЧ'),(616,'РАД'),(591,'РАДИОТЕХНИК'),(740,'РАЗ'),(30,'РАЗВИВА'),(93,'РАЗВИТ'),(762,'РАЗИНЬК'),(761,'РАЗИНЬКОВ'),(437,'РАЗЛИЧН'),(396,'РАЗМЕР'),(733,'РАЗМЕСТ'),(429,'РАЗН'),(679,'РАЗНООБРАЗН'),(377,'РАЗРАБОТА'),(607,'РАЗРАБОТК'),(681,'РАМК'),(888,'РАСКЛАДУШК'),(1153,'РАСКР'),(317,'РАСКРО'),(7,'РАСПИСАН'),(826,'РАСПИСЫВА'),(196,'РАСПОЛАГА'),(407,'РАСПОЛОЖ'),(434,'РАСПОРЯЖЕН'),(1192,'РАССМОТРЕТ'),(1194,'РАССТАНОВК'),(212,'РАСТ'),(800,'РАСТВОР'),(467,'РАСХОД'),(465,'РАСЧЕТ'),(1150,'РАСЧЕТОВ'),(304,'РАСШИР'),(676,'РАСШИРЕН'),(535,'РАСШИРЯ'),(577,'РАТЧЕНК'),(963,'РАЦИОНАЛЬН'),(178,'РЕГИОН'),(310,'РЕГИОНАЛЬН'),(177,'РЕГИОНОВ'),(1318,'РЕГИСТРАЦ'),(1303,'РЕДАКЦ'),(1178,'РЕЖИМ'),(143,'РЕЗУЛЬТАТ'),(91,'РЕИНВЕСТИРОВАН'),(688,'РЕСПУБЛИКАНСК'),(787,'РЕША'),(55,'РЕШЕН'),(588,'РОГОВ'),(550,'РОД'),(1283,'РОДИОН'),(1282,'РОДИОНОВ'),(1233,'РОЗНИЦ'),(333,'РОЗНИЧН'),(882,'РОСКОШ'),(817,'РОСКОШН'),(816,'РОСПИС'),(179,'РОСС'),(306,'РОССИЙСК'),(176,'РОСТ'),(1226,'РУБ'),(308,'РУБЕЖ'),(1207,'РУК'),(834,'РУКОВОДИТЕЛ'),(526,'РУКОВОДСТВ'),(544,'РУКОВОДЯ'),(502,'РУЧН'),(1230,'РФ'),(307,'РЫНК'),(153,'РЫНОК'),(259,'РЯД'),(723,'САД'),(25,'САЙТ'),(280,'САЛОН'),(279,'САЛОНОВ'),(1260,'САМОСТОЯТЕЛЬН'),(120,'САНИТАРН'),(330,'САНКТ-ПЕТЕРБУРГ'),(448,'СБОРК'),(925,'СВЕЖ'),(108,'СВОЕВРЕМЕН'),(643,'СВЫШ'),(1159,'СВЯЖУТ'),(539,'СВЯЗ'),(432,'СДЕЛА'),(468,'СЕБЕСТОИМ'),(247,'СЕВЕРО-ЗАПАД'),(356,'СЕГОДН'),(374,'СЕГОДНЯШН'),(659,'СЕКТОР'),(658,'СЕКТОРОВ'),(683,'СЕМИНАР'),(551,'СЕНТЯБР'),(915,'СЕР'),(584,'СЕРГ'),(517,'СЕРТИФИКАТ'),(513,'СЕРТИФИКАЦИОН'),(334,'СЕТ'),(242,'СИБИР'),(1065,'СИДЕН'),(1092,'СИДЕТ'),(1007,'СИММЕТРИЧ'),(790,'СИНТЕТИЧЕСК'),(72,'СИСТ'),(107,'СИСТЕМ'),(129,'СИСТЕМАТИЧЕСК'),(1013,'СИСТЕМН'),(1110,'СИТ'),(289,'СКЛАД'),(1086,'СКЛАДН'),(357,'СКЛАДСК'),(900,'СЛЕВ'),(802,'СЛЕД'),(1102,'СЛОЖ'),(1132,'СЛОЖН'),(1017,'СЛУЖ'),(418,'СМОЖЕТ'),(778,'СМОЛ'),(692,'СМОТР'),(264,'СНГ'),(144,'СНИЖЕН'),(466,'СНИЗ'),(157,'СО'),(36,'СОБ'),(971,'СОБРАН'),(221,'СОБСТВЕН'),(545,'СОБСТВЕННИК'),(1288,'СОБЫТ'),(230,'СОВЕРШЕН'),(106,'СОВЕРШЕНСТВОВАН'),(1036,'СОВЕСТ'),(1027,'СОВЕЩАТЕЛЬН'),(416,'СОВМЕСТН'),(1223,'СОВОКУПН'),(970,'СОВРЕМЕН'),(791,'СОГЛАСН'),(1033,'СОГЛАСУ'),(175,'СОДЕЙСТВ'),(793,'СОДЕРЖ'),(743,'СОЕДИНЕН'),(409,'СОЗДА'),(114,'СОЗДАН'),(930,'СОЗДАСТ'),(1076,'СОЛЬЮТ'),(1290,'СООБЩЕН'),(96,'СООТВЕТСТВ'),(803,'СООТНОШЕН'),(779,'СОПОЛИМЕР'),(750,'СОСТА'),(358,'СОСТАВ'),(343,'СОСТАВЛЯ'),(749,'СОСТАВОВ'),(636,'СОСТО'),(776,'СОСТОЯ'),(124,'СОТРУДНИК'),(123,'СОТРУДНИКОВ'),(596,'СОТРУДНИЧЕСТВ'),(903,'СОФ'),(529,'СОХРАН'),(1002,'СОХРАНЯ'),(1227,'СОЦ'),(182,'СОЦИАЛЬН'),(922,'СОЧЕТА'),(927,'СОЧЕТАН'),(719,'СПАЛ'),(390,'СПАЛЬН'),(1169,'СПЕКТР'),(515,'СПЕЦИАЛИЗИРОВА'),(148,'СПЕЦИАЛИСТ'),(147,'СПЕЦИАЛИСТОВ'),(582,'СПЕЦИАЛЬН'),(830,'СПИНК'),(1310,'СПИСК'),(1016,'СПРАВ'),(1078,'СРАЗ'),(104,'СРЕД'),(566,'СРЕДН'),(208,'СРЕДСТВ'),(447,'СРОК'),(220,'СТАВШ'),(224,'СТАЛ'),(497,'СТАНДАРТ'),(204,'СТАНК'),(691,'СТАНОВ'),(490,'СТАРШ'),(597,'СТАТ'),(541,'СТЕПЕН'),(869,'СТИЛ'),(1005,'СТИЛЬН'),(837,'СТОИМОСТ'),(975,'СТОЙК'),(959,'СТОЛ'),(992,'СТОЛОВ'),(507,'СТОРОН'),(263,'СТРАН'),(602,'СТРАНИЦ'),(28,'СТРАТЕГ'),(383,'СТРЕМ'),(654,'СТРО'),(95,'СТРОГ'),(752,'СТРОИТЕЛЬН'),(288,'СТРОИТЕЛЬСТВ'),(877,'СТРОЧК'),(866,'СТУЛ'),(1070,'СТУЛЬЕВ'),(1164,'СУММ'),(364,'СУЩЕСТВ'),(1209,'СФЕР'),(1189,'СХОЖЕСТ'),(853,'СЧЕТ'),(1089,'СЧИТА'),(567,'США'),(281,'ТАКЖ'),(897,'ТАХТ'),(860,'ТВЕРД'),(417,'ТВОРЧЕСТВ'),(639,'ТЕКУЩ'),(611,'ТЕЛЕФОН'),(382,'ТЕМ'),(657,'ТЕМАТИЧЕСК'),(214,'ТЕМП'),(696,'ТЕНДЕНЦ'),(1090,'ТЕПЛ'),(337,'ТЕРРИТОР'),(1051,'ТЕХ'),(592,'ТЕХНИЧЕСК'),(139,'ТЕХНОЛОГ'),(57,'ТЕХНОЛОГИЧН'),(718,'ТИП'),(1229,'ТК'),(671,'ТКАН'),(519,'ТОГ'),(843,'ТОМ'),(1066,'ТОНИРОВК'),(369,'ТОРГОВ'),(446,'ТОЧН'),(404,'ТОЧНОСТ'),(226,'ТРАДИЦ'),(1158,'ТРАНСПОРТН'),(885,'ТРАНСФОРМАЦ'),(98,'ТРЕБОВАН'),(170,'ТРЕБОВАТЕЛЬН'),(354,'ТРЕТ'),(1148,'ТРЕХМЕРН'),(1030,'ТРОН'),(116,'ТРУД'),(1238,'ТРУДОВ'),(1245,'ТРУДОУСТРОЙСТВ'),(962,'ТУМБ'),(362,'ТЫСЯЧ'),(234,'УВЕЛИЧ'),(87,'УВЕЛИЧИВА'),(1202,'УВЕРЕН'),(702,'УВИДЕТ'),(315,'УГЛОВ'),(928,'УДАЧН'),(989,'УДИВИТЕЛЬН'),(1100,'УДОБ'),(1018,'УДОБН'),(128,'УДОВЛЕТВОРЕН'),(1272,'УКАЗАН'),(352,'УКОМПЛЕКТОВА'),(649,'УКРАИН'),(891,'УКРАШЕН'),(296,'УКРЕПЛЕН'),(998,'УМЕНЬШЕН'),(1069,'УНИВЕРСАЛЬН'),(593,'УНИВЕРСИТЕТ'),(965,'УНИКАЛЬН'),(1237,'УПРАВЛЕН'),(1031,'УПРАВЛЕНЦ'),(570,'УПРАВЛЯ'),(530,'УПРОЧ'),(243,'УРА'),(232,'УРОВЕН'),(132,'УРОВН'),(115,'УСЛОВ'),(1,'УСЛУГ'),(498,'УСПЕХ'),(345,'УСПЕШН'),(846,'УСТАЛ'),(883,'УСТАНОВ'),(449,'УСТАНОВК'),(995,'УСТОЯ'),(996,'УТВЕРЖДЕН'),(642,'УЧАСТ'),(707,'УЧАСТНИК'),(706,'УЧАСТНИКОВ'),(482,'УЧЕБН'),(410,'УЧЕТ'),(1140,'УЧИТЫВ'),(1074,'УЮТ'),(1055,'УЮТН'),(326,'ФАБРИК'),(1085,'ФАЗЕНД'),(619,'ФАКС'),(1183,'ФАКТУР'),(556,'ФАКУЛЬТЕТ'),(770,'ФЕДЕРАЦ'),(549,'ФЕДОРОВИЧ'),(1046,'ФИЗИОЛОГИЧЕСК'),(293,'ФИЛИА'),(1242,'ФИНАНСОВО-ХОЗЯЙСТВЕН'),(370,'ФИРМ'),(238,'ФИРМЕН'),(890,'ФЛОР'),(585,'ФОМИЧ'),(1081,'ФОРМ'),(70,'ФОРМИР'),(1269,'ФОРМИРОВАН'),(630,'ФОРУМ'),(949,'ФУНКЦ'),(1176,'ФУНКЦИОНАЛЬН'),(669,'ФУРНИТУР'),(506,'ХАРАКТЕР'),(914,'ХАРАКТЕРИСТИК'),(1087,'ХЛОПК'),(783,'ХЛОРИСТ'),(225,'ХОРОШ'),(1118,'ХРАН'),(1103,'ХРАНЕН'),(847,'ХРОМ'),(854,'ХРОМИРОВА'),(1215,'ХУДОЖЕСТВЕННО-КОНСТРУКТОРСК'),(405,'ЦВЕТ'),(1187,'ЦВЕТН'),(929,'ЦВЕТОВ'),(39,'ЦЕЛ'),(1060,'ЦЕЛИК'),(145,'ЦЕН'),(218,'ЦЕХ'),(1249,'ЧАС'),(206,'ЧЕЛОВЕК'),(1247,'ЧЕР'),(1291,'ЧЕРЕЗ'),(1206,'ЧЕРЧЕН'),(1035,'ЧЕСТ'),(984,'ЧИНОВНИК'),(282,'ЧИСЛ'),(1058,'ЧИСТ'),(845,'ЧУВСТВУ'),(240,'ШАГ'),(880,'ШАРМ'),(1276,'ШАТУР'),(1168,'ШИРОК'),(961,'ШКАФ'),(192,'ШКОЛ'),(322,'ШПОН'),(801,'ЩАВЕЛЕВ'),(1057,'ЭКОЛОГИЧЕСК'),(1198,'ЭКСКЛЮЗИВН'),(1185,'ЭКСПЕРИМЕНТИРОВА'),(217,'ЭКСПЛУАТАЦ'),(1004,'ЭКСПЛУАТАЦИОН'),(640,'ЭКСПОЗИЦ'),(677,'ЭКСПОФОРУМ'),(881,'ЭЛЕГАНТН'),(612,'ЭЛЕКТРОН'),(428,'ЭЛЕМЕНТ'),(672,'ЭЛЕМЕНТОВ'),(876,'ЭЛИТН'),(488,'ЭНТУЗИАЗМ'),(1098,'ЭР'),(859,'ЭРГОНОМИК'),(958,'ЭРГОНОМИЧН'),(1316,'ЭРНСТ'),(1142,'ЭСКИЗН'),(452,'ЭТАП'),(1210,'ЭТИК'),(109,'ЭФФЕКТИВН'),(246,'ЮГ'),(774,'ЯВЛЯ'),(819,'ЯРК'),(37,'ЯСН'),(1122,'ЯЩИК');
/*!40000 ALTER TABLE `b_search_stem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_suggest`
--

DROP TABLE IF EXISTS `b_search_suggest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_MD5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `RATE` float NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_SUGGEST` (`FILTER_MD5`,`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_PHRASE` (`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_suggest`
--

LOCK TABLES `b_search_suggest` WRITE;
/*!40000 ALTER TABLE `b_search_suggest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_suggest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_tags`
--

DROP TABLE IF EXISTS `b_search_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_tags` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`,`NAME`),
  KEY `IX_B_SEARCH_TAGS_0` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_tags`
--

LOCK TABLES `b_search_tags` WRITE;
/*!40000 ALTER TABLE `b_search_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_user_right`
--

DROP TABLE IF EXISTS `b_search_user_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_user_right` (
  `USER_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_USER_RIGHT` (`USER_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_user_right`
--

LOCK TABLES `b_search_user_right` WRITE;
/*!40000 ALTER TABLE `b_search_user_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_user_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_filter_mask`
--

DROP TABLE IF EXISTS `b_sec_filter_mask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_filter_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '10',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_filter_mask`
--

LOCK TABLES `b_sec_filter_mask` WRITE;
/*!40000 ALTER TABLE `b_sec_filter_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_filter_mask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_frame_mask`
--

DROP TABLE IF EXISTS `b_sec_frame_mask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_frame_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '10',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FRAME_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_frame_mask`
--

LOCK TABLES `b_sec_frame_mask` WRITE;
/*!40000 ALTER TABLE `b_sec_frame_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_frame_mask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_iprule`
--

DROP TABLE IF EXISTS `b_sec_iprule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_iprule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ADMIN_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_FROM_TIMESTAMP` int(11) DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `ACTIVE_TO_TIMESTAMP` int(11) DEFAULT NULL,
  `NAME` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_iprule_active_to` (`ACTIVE_TO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_iprule`
--

LOCK TABLES `b_sec_iprule` WRITE;
/*!40000 ALTER TABLE `b_sec_iprule` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_iprule_excl_ip`
--

DROP TABLE IF EXISTS `b_sec_iprule_excl_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_iprule_excl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_iprule_excl_ip`
--

LOCK TABLES `b_sec_iprule_excl_ip` WRITE;
/*!40000 ALTER TABLE `b_sec_iprule_excl_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_excl_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_iprule_excl_mask`
--

DROP TABLE IF EXISTS `b_sec_iprule_excl_mask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_iprule_excl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_iprule_excl_mask`
--

LOCK TABLES `b_sec_iprule_excl_mask` WRITE;
/*!40000 ALTER TABLE `b_sec_iprule_excl_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_excl_mask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_iprule_incl_ip`
--

DROP TABLE IF EXISTS `b_sec_iprule_incl_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_iprule_incl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_iprule_incl_ip`
--

LOCK TABLES `b_sec_iprule_incl_ip` WRITE;
/*!40000 ALTER TABLE `b_sec_iprule_incl_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_incl_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_iprule_incl_mask`
--

DROP TABLE IF EXISTS `b_sec_iprule_incl_mask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_iprule_incl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_iprule_incl_mask`
--

LOCK TABLES `b_sec_iprule_incl_mask` WRITE;
/*!40000 ALTER TABLE `b_sec_iprule_incl_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_incl_mask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_recovery_codes`
--

DROP TABLE IF EXISTS `b_sec_recovery_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_recovery_codes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USED` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USING_DATE` datetime DEFAULT NULL,
  `USING_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_recovery_codes_user_id` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_recovery_codes`
--

LOCK TABLES `b_sec_recovery_codes` WRITE;
/*!40000 ALTER TABLE `b_sec_recovery_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_recovery_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_redirect_url`
--

DROP TABLE IF EXISTS `b_sec_redirect_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_redirect_url` (
  `IS_SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `URL` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETER_NAME` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_redirect_url`
--

LOCK TABLES `b_sec_redirect_url` WRITE;
/*!40000 ALTER TABLE `b_sec_redirect_url` DISABLE KEYS */;
INSERT INTO `b_sec_redirect_url` VALUES ('Y',10,'/bitrix/redirect.php','goto'),('Y',20,'/bitrix/rk.php','goto'),('Y',30,'/bitrix/click.php','goto');
/*!40000 ALTER TABLE `b_sec_redirect_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_session`
--

DROP TABLE IF EXISTS `b_sec_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_session` (
  `SESSION_ID` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SESSION_DATA` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SESSION_ID`),
  KEY `ix_b_sec_session_time` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_session`
--

LOCK TABLES `b_sec_session` WRITE;
/*!40000 ALTER TABLE `b_sec_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_user`
--

DROP TABLE IF EXISTS `b_sec_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_user` (
  `USER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECRET` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `ATTEMPTS` int(18) DEFAULT NULL,
  `INITIAL_DATE` datetime DEFAULT NULL,
  `SKIP_MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_UNTIL` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_user`
--

LOCK TABLES `b_sec_user` WRITE;
/*!40000 ALTER TABLE `b_sec_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_virus`
--

DROP TABLE IF EXISTS `b_sec_virus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_virus` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INFO` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_virus`
--

LOCK TABLES `b_sec_virus` WRITE;
/*!40000 ALTER TABLE `b_sec_virus` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_virus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_white_list`
--

DROP TABLE IF EXISTS `b_sec_white_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_white_list` (
  `ID` int(11) NOT NULL,
  `WHITE_SUBSTR` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_white_list`
--

LOCK TABLES `b_sec_white_list` WRITE;
/*!40000 ALTER TABLE `b_sec_white_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_white_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_security_sitecheck`
--

DROP TABLE IF EXISTS `b_security_sitecheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_security_sitecheck` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEST_DATE` datetime DEFAULT NULL,
  `RESULTS` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_security_sitecheck`
--

LOCK TABLES `b_security_sitecheck` WRITE;
/*!40000 ALTER TABLE `b_security_sitecheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_security_sitecheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_autolog`
--

DROP TABLE IF EXISTS `b_seo_adv_autolog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_autolog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `CAMPAIGN_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `BANNER_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CAUSE_CODE` int(11) DEFAULT '0',
  `SUCCESS` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_autolog1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_autolog2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_autolog`
--

LOCK TABLES `b_seo_adv_autolog` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_autolog` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_autolog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_banner`
--

DROP TABLE IF EXISTS `b_seo_adv_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_banner` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  `AUTO_QUANTITY_OFF` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTO_QUANTITY_ON` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_banner` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_banner1` (`CAMPAIGN_ID`),
  KEY `ix_b_seo_adv_banner2` (`AUTO_QUANTITY_OFF`,`AUTO_QUANTITY_ON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_banner`
--

LOCK TABLES `b_seo_adv_banner` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_campaign`
--

DROP TABLE IF EXISTS `b_seo_adv_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_campaign` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_campaign` (`ENGINE_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_campaign`
--

LOCK TABLES `b_seo_adv_campaign` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_group`
--

DROP TABLE IF EXISTS `b_seo_adv_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_group` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_group1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_group`
--

LOCK TABLES `b_seo_adv_group` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_link`
--

DROP TABLE IF EXISTS `b_seo_adv_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_link` (
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_ID` int(18) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  PRIMARY KEY (`LINK_TYPE`,`LINK_ID`,`BANNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_link`
--

LOCK TABLES `b_seo_adv_link` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_log`
--

DROP TABLE IF EXISTS `b_seo_adv_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `REQUEST_URI` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci,
  `RESPONSE_TIME` float NOT NULL,
  `RESPONSE_STATUS` int(5) DEFAULT NULL,
  `RESPONSE_DATA` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_log1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_log2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_log`
--

LOCK TABLES `b_seo_adv_log` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_order`
--

DROP TABLE IF EXISTS `b_seo_adv_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `SUM` float DEFAULT '0',
  `PROCESSED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_order` (`ENGINE_ID`,`CAMPAIGN_ID`,`BANNER_ID`,`ORDER_ID`),
  KEY `ix_b_seo_adv_order1` (`ORDER_ID`,`PROCESSED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_order`
--

LOCK TABLES `b_seo_adv_order` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_region`
--

DROP TABLE IF EXISTS `b_seo_adv_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_region` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `PARENT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_region` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_region1` (`PARENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_region`
--

LOCK TABLES `b_seo_adv_region` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_keywords`
--

DROP TABLE IF EXISTS `b_seo_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_keywords` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_keywords_url` (`URL`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_keywords`
--

LOCK TABLES `b_seo_keywords` WRITE;
/*!40000 ALTER TABLE `b_seo_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_search_engine`
--

DROP TABLE IF EXISTS `b_seo_search_engine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_search_engine` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(5) DEFAULT '100',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_search_engine_code` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_search_engine`
--

LOCK TABLES `b_seo_search_engine` WRITE;
/*!40000 ALTER TABLE `b_seo_search_engine` DISABLE KEYS */;
INSERT INTO `b_seo_search_engine` VALUES (1,'google','Y',200,'Google','868942902147-qrrd6ce1ajfkpse8ieq4gkpdeanvtnno.apps.googleusercontent.com','EItMlJpZLC2WRPKB6QsA5bV9','urn:ietf:wg:oauth:2.0:oob',NULL),(2,'yandex','Y',300,'Yandex','f848c7bfc1d34a94ba6d05439f81bbd7','da0e73b2d9cc4e809f3170e49cb9df01','https://oauth.yandex.ru/verification_code',NULL),(3,'yandex_direct','Y',400,'Yandex.Direct','','','https://oauth.yandex.ru/verification_code',NULL);
/*!40000 ALTER TABLE `b_seo_search_engine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_service_log`
--

DROP TABLE IF EXISTS `b_seo_service_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_service_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_service_log`
--

LOCK TABLES `b_seo_service_log` WRITE;
/*!40000 ALTER TABLE `b_seo_service_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_service_rtg_queue`
--

DROP TABLE IF EXISTS `b_seo_service_rtg_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_service_rtg_queue` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ACCOUNT_ID` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUDIENCE_ID` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `CONTACT_TYPE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_AUTO_REMOVE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_1` (`ACTION`,`DATE_AUTO_REMOVE`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_2` (`TYPE`,`ACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_service_rtg_queue`
--

LOCK TABLES `b_seo_service_rtg_queue` WRITE;
/*!40000 ALTER TABLE `b_seo_service_rtg_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_rtg_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_sitemap`
--

DROP TABLE IF EXISTS `b_seo_sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_sitemap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_RUN` datetime DEFAULT NULL,
  `SETTINGS` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_sitemap`
--

LOCK TABLES `b_seo_sitemap` WRITE;
/*!40000 ALTER TABLE `b_seo_sitemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_sitemap_entity`
--

DROP TABLE IF EXISTS `b_seo_sitemap_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_sitemap_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_entity_1` (`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_seo_sitemap_entity_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_sitemap_entity`
--

LOCK TABLES `b_seo_sitemap_entity` WRITE;
/*!40000 ALTER TABLE `b_seo_sitemap_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_sitemap_iblock`
--

DROP TABLE IF EXISTS `b_seo_sitemap_iblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_sitemap_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_iblock_1` (`IBLOCK_ID`),
  KEY `ix_b_seo_sitemap_iblock_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_sitemap_iblock`
--

LOCK TABLES `b_seo_sitemap_iblock` WRITE;
/*!40000 ALTER TABLE `b_seo_sitemap_iblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap_iblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_sitemap_runtime`
--

DROP TABLE IF EXISTS `b_seo_sitemap_runtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_sitemap_runtime` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) NOT NULL,
  `PROCESSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ITEM_PATH` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEM_ID` int(11) DEFAULT NULL,
  `ITEM_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `ACTIVE_ELEMENT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_seo_sitemap_runtime1` (`PID`,`PROCESSED`,`ITEM_TYPE`,`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_sitemap_runtime`
--

LOCK TABLES `b_seo_sitemap_runtime` WRITE;
/*!40000 ALTER TABLE `b_seo_sitemap_runtime` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap_runtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_yandex_direct_stat`
--

DROP TABLE IF EXISTS `b_seo_yandex_direct_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_yandex_direct_stat` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `DATE_DAY` date NOT NULL,
  `CURRENCY` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUM` float DEFAULT '0',
  `SUM_SEARCH` float DEFAULT '0',
  `SUM_CONTEXT` float DEFAULT '0',
  `CLICKS` int(7) DEFAULT '0',
  `CLICKS_SEARCH` int(7) DEFAULT '0',
  `CLICKS_CONTEXT` int(7) DEFAULT '0',
  `SHOWS` int(7) DEFAULT '0',
  `SHOWS_SEARCH` int(7) DEFAULT '0',
  `SHOWS_CONTEXT` int(7) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_seo_yandex_direct_stat` (`BANNER_ID`,`DATE_DAY`),
  KEY `ix_seo_yandex_direct_stat1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_yandex_direct_stat`
--

LOCK TABLES `b_seo_yandex_direct_stat` WRITE;
/*!40000 ALTER TABLE `b_seo_yandex_direct_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_yandex_direct_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_short_uri`
--

DROP TABLE IF EXISTS `b_short_uri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_short_uri` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `URI` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `URI_CRC` int(18) NOT NULL,
  `SHORT_URI` varbinary(250) NOT NULL,
  `SHORT_URI_CRC` int(18) NOT NULL,
  `STATUS` int(18) NOT NULL DEFAULT '301',
  `MODIFIED` datetime NOT NULL,
  `LAST_USED` datetime DEFAULT NULL,
  `NUMBER_USED` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ux_b_short_uri_1` (`SHORT_URI_CRC`),
  KEY `ux_b_short_uri_2` (`URI_CRC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_short_uri`
--

LOCK TABLES `b_short_uri` WRITE;
/*!40000 ALTER TABLE `b_short_uri` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_short_uri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_site_template`
--

DROP TABLE IF EXISTS `b_site_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_site_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_site_template_site` (`SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_site_template`
--

LOCK TABLES `b_site_template` WRITE;
/*!40000 ALTER TABLE `b_site_template` DISABLE KEYS */;
INSERT INTO `b_site_template` VALUES (8,'s1','',150,'exam1'),(9,'s1','CSite::InDir(\'/services/\')',151,'furniture_pale-blue');
/*!40000 ALTER TABLE `b_site_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_smile`
--

DROP TABLE IF EXISTS `b_smile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_smile` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SET_ID` int(18) NOT NULL DEFAULT '0',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `TYPING` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IMAGE_DEFINITION` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SD',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_smile`
--

LOCK TABLES `b_smile` WRITE;
/*!40000 ALTER TABLE `b_smile` DISABLE KEYS */;
INSERT INTO `b_smile` VALUES (1,'S',2,100,':) :-)','Y','N','bx_smile_smile.png','UHD',20,20),(2,'S',2,105,';) ;-)','Y','N','bx_smile_wink.png','UHD',20,20),(3,'S',2,110,':D :-D','Y','N','bx_smile_biggrin.png','UHD',20,20),(4,'S',2,115,'8) 8-)','Y','N','bx_smile_cool.png','UHD',20,20),(5,'S',2,120,':facepalm:','Y','N','bx_smile_facepalm.png','UHD',20,20),(6,'S',2,125,':{} :-{}','Y','N','bx_smile_kiss.png','UHD',20,20),(7,'S',2,130,':( :-(','Y','N','bx_smile_sad.png','UHD',20,20),(8,'S',2,135,':| :-|','Y','N','bx_smile_neutral.png','UHD',20,20),(9,'S',2,140,':oops:','Y','N','bx_smile_redface.png','UHD',20,20),(10,'S',2,145,':cry: :~(','Y','N','bx_smile_cry.png','UHD',20,20),(11,'S',2,150,':evil: >:-<','Y','N','bx_smile_evil.png','UHD',20,20),(12,'S',2,155,':o :-o :shock:','Y','N','bx_smile_eek.png','UHD',20,20),(13,'S',2,160,':/ :-/','Y','N','bx_smile_confuse.png','UHD',20,20),(14,'S',2,165,':idea:','Y','N','bx_smile_idea.png','UHD',20,20),(15,'S',2,170,':?:','Y','N','bx_smile_question.png','UHD',20,20),(16,'S',2,175,':!:','Y','N','bx_smile_exclaim.png','UHD',20,20),(17,'S',2,180,':like:','Y','N','bx_smile_like.png','UHD',20,20),(18,'I',2,175,'ICON_NOTE','Y','N','bx_icon_1.gif','SD',15,15),(19,'I',2,180,'ICON_DIRRECTION','Y','N','bx_icon_2.gif','SD',15,15),(20,'I',2,185,'ICON_IDEA','Y','N','bx_icon_3.gif','SD',15,15),(21,'I',2,190,'ICON_ATTANSION','Y','N','bx_icon_4.gif','SD',15,15),(22,'I',2,195,'ICON_QUESTION','Y','N','bx_icon_5.gif','SD',15,15),(23,'I',2,200,'ICON_BAD','Y','N','bx_icon_6.gif','SD',15,15),(24,'I',2,205,'ICON_GOOD','Y','N','bx_icon_7.gif','SD',15,15);
/*!40000 ALTER TABLE `b_smile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_smile_lang`
--

DROP TABLE IF EXISTS `b_smile_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_smile_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_SMILE_SL` (`TYPE`,`SID`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_smile_lang`
--

LOCK TABLES `b_smile_lang` WRITE;
/*!40000 ALTER TABLE `b_smile_lang` DISABLE KEYS */;
INSERT INTO `b_smile_lang` VALUES (1,'P',1,'ru','Стандартная галерея'),(2,'P',1,'en','Standard gallery'),(3,'G',2,'ru','Основной набор'),(4,'G',2,'en','Default pack'),(5,'S',1,'ru','С улыбкой'),(6,'S',1,'en','Smile'),(7,'S',2,'ru','Шутливо'),(8,'S',2,'en','Wink'),(9,'S',3,'ru','Широкая улыбка'),(10,'S',3,'en','Big grin'),(11,'S',4,'ru','Здорово'),(12,'S',4,'en','Cool'),(13,'S',5,'ru','Разочарование'),(14,'S',5,'en','Facepalm'),(15,'S',6,'ru','Поцелуй'),(16,'S',6,'en','Kiss'),(17,'S',7,'ru','Печально'),(18,'S',7,'en','Sad'),(19,'S',8,'ru','Скептически'),(20,'S',8,'en','Skeptic'),(21,'S',9,'ru','Смущенный'),(22,'S',9,'en','Embarrassed'),(23,'S',10,'ru','Очень грустно'),(24,'S',10,'en','Crying'),(25,'S',11,'ru','Со злостью'),(26,'S',11,'en','Angry'),(27,'S',12,'ru','Удивленно'),(28,'S',12,'en','Surprised'),(29,'S',13,'ru','Смущенно'),(30,'S',13,'en','Confused'),(31,'S',14,'ru','Идея'),(32,'S',14,'en','Idea'),(33,'S',15,'ru','Вопрос'),(34,'S',15,'en','Question'),(35,'S',16,'ru','Восклицание'),(36,'S',16,'en','Exclamation'),(37,'S',17,'ru','Нравится'),(38,'S',17,'en','Like');
/*!40000 ALTER TABLE `b_smile_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_smile_set`
--

DROP TABLE IF EXISTS `b_smile_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_smile_set` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'G',
  `PARENT_ID` int(18) NOT NULL DEFAULT '0',
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(10) NOT NULL DEFAULT '150',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_smile_set`
--

LOCK TABLES `b_smile_set` WRITE;
/*!40000 ALTER TABLE `b_smile_set` DISABLE KEYS */;
INSERT INTO `b_smile_set` VALUES (1,'P',0,'bitrix',150),(2,'G',1,'bitrix_main',150);
/*!40000 ALTER TABLE `b_smile_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_socialservices_ap`
--

DROP TABLE IF EXISTS `b_socialservices_ap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_socialservices_ap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int(11) NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENDPOINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `SETTINGS` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_socialservices_ap1` (`USER_ID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_socialservices_ap`
--

LOCK TABLES `b_socialservices_ap` WRITE;
/*!40000 ALTER TABLE `b_socialservices_ap` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_ap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_socialservices_contact`
--

DROP TABLE IF EXISTS `b_socialservices_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_socialservices_contact` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int(11) NOT NULL,
  `CONTACT_USER_ID` int(11) DEFAULT NULL,
  `CONTACT_XML_ID` int(11) DEFAULT NULL,
  `CONTACT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_PHOTO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `NOTIFY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact1` (`USER_ID`),
  KEY `ix_b_socialservices_contact2` (`CONTACT_USER_ID`),
  KEY `ix_b_socialservices_contact3` (`TIMESTAMP_X`),
  KEY `ix_b_socialservices_contact4` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_socialservices_contact`
--

LOCK TABLES `b_socialservices_contact` WRITE;
/*!40000 ALTER TABLE `b_socialservices_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_socialservices_contact_connect`
--

DROP TABLE IF EXISTS `b_socialservices_contact_connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_socialservices_contact_connect` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CONTACT_ID` int(11) DEFAULT NULL,
  `LINK_ID` int(11) DEFAULT NULL,
  `CONTACT_PROFILE_ID` int(11) NOT NULL,
  `CONTACT_PORTAL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONNECT_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT 'P',
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact_connect1` (`CONTACT_ID`),
  KEY `ix_b_socialservices_contact_connect2` (`LINK_ID`),
  KEY `ix_b_socialservices_contact_connect3` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_socialservices_contact_connect`
--

LOCK TABLES `b_socialservices_contact_connect` WRITE;
/*!40000 ALTER TABLE `b_socialservices_contact_connect` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_contact_connect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_socialservices_message`
--

DROP TABLE IF EXISTS `b_socialservices_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_socialservices_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `PROVIDER` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `SUCCES_SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_socialservices_message`
--

LOCK TABLES `b_socialservices_message` WRITE;
/*!40000 ALTER TABLE `b_socialservices_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_socialservices_user`
--

DROP TABLE IF EXISTS `b_socialservices_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_socialservices_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(11) DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CAN_DELETE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PERSONAL_WWW` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERMISSIONS` varchar(555) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN_EXPIRES` int(11) DEFAULT NULL,
  `OASECRET` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REFRESH_TOKEN` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEND_ACTIVITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SITE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIALIZED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_SOCIALSERVICES_USER` (`XML_ID`,`EXTERNAL_AUTH_ID`),
  KEY `IX_B_SOCIALSERVICES_US_1` (`USER_ID`),
  KEY `IX_B_SOCIALSERVICES_US_3` (`LOGIN`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_socialservices_user`
--

LOCK TABLES `b_socialservices_user` WRITE;
/*!40000 ALTER TABLE `b_socialservices_user` DISABLE KEYS */;
INSERT INTO `b_socialservices_user` VALUES (1,'VKuser126604085','Илья','Красницкий','kross_48@london.com',1,'VKontakte',1,'126604085','Y','http://vk.com/id126604085',NULL,'2a96dcce64b404ed8435d7f85096825a6e9164320e601849741273301ad97be88521ea23c81a44481b824',0,NULL,NULL,'Y','s1','N');
/*!40000 ALTER TABLE `b_socialservices_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_socialservices_user_link`
--

DROP TABLE IF EXISTS `b_socialservices_user_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_socialservices_user_link` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `LINK_USER_ID` int(11) DEFAULT NULL,
  `LINK_UID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_PICTURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_user_link_5` (`SOCSERV_USER_ID`),
  KEY `ix_b_socialservices_user_link_6` (`LINK_USER_ID`,`TIMESTAMP_X`),
  KEY `ix_b_socialservices_user_link_7` (`LINK_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_socialservices_user_link`
--

LOCK TABLES `b_socialservices_user_link` WRITE;
/*!40000 ALTER TABLE `b_socialservices_user_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_user_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sticker`
--

DROP TABLE IF EXISTS `b_sticker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sticker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PAGE_TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `MODIFIED_BY` int(18) NOT NULL,
  `CREATED_BY` int(18) NOT NULL,
  `PERSONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONTENT` text COLLATE utf8_unicode_ci,
  `POS_TOP` int(11) DEFAULT NULL,
  `POS_LEFT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `COLOR` int(11) DEFAULT NULL,
  `COLLAPSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMPLETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CLOSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MARKER_TOP` int(11) DEFAULT NULL,
  `MARKER_LEFT` int(11) DEFAULT NULL,
  `MARKER_WIDTH` int(11) DEFAULT NULL,
  `MARKER_HEIGHT` int(11) DEFAULT NULL,
  `MARKER_ADJUST` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sticker`
--

LOCK TABLES `b_sticker` WRITE;
/*!40000 ALTER TABLE `b_sticker` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sticker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sticker_group_task`
--

DROP TABLE IF EXISTS `b_sticker_group_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sticker_group_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sticker_group_task`
--

LOCK TABLES `b_sticker_group_task` WRITE;
/*!40000 ALTER TABLE `b_sticker_group_task` DISABLE KEYS */;
INSERT INTO `b_sticker_group_task` VALUES (5,29);
/*!40000 ALTER TABLE `b_sticker_group_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_subscription`
--

DROP TABLE IF EXISTS `b_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_subscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `DATE_UPDATE` datetime DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRMED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DATE_CONFIRM` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_SUBSCRIPTION_EMAIL` (`EMAIL`,`USER_ID`),
  KEY `IX_DATE_CONFIRM` (`CONFIRMED`,`DATE_CONFIRM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_subscription`
--

LOCK TABLES `b_subscription` WRITE;
/*!40000 ALTER TABLE `b_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_subscription_rubric`
--

DROP TABLE IF EXISTS `b_subscription_rubric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_subscription_rubric` (
  `SUBSCRIPTION_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_SUBSCRIPTION_RUBRIC` (`SUBSCRIPTION_ID`,`LIST_RUBRIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_subscription_rubric`
--

LOCK TABLES `b_subscription_rubric` WRITE;
/*!40000 ALTER TABLE `b_subscription_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_subscription_rubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_task`
--

DROP TABLE IF EXISTS `b_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_task` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LETTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`),
  KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_task`
--

LOCK TABLES `b_task` WRITE;
/*!40000 ALTER TABLE `b_task` DISABLE KEYS */;
INSERT INTO `b_task` VALUES (1,'main_denied','D','main','Y',NULL,'module'),(2,'main_change_profile','P','main','Y',NULL,'module'),(3,'main_view_all_settings','R','main','Y',NULL,'module'),(4,'main_view_all_settings_change_profile','T','main','Y',NULL,'module'),(5,'main_edit_subordinate_users','V','main','Y',NULL,'module'),(6,'main_full_access','W','main','Y',NULL,'module'),(7,'fm_folder_access_denied','D','main','Y',NULL,'file'),(8,'fm_folder_access_read','R','main','Y',NULL,'file'),(9,'fm_folder_access_write','W','main','Y',NULL,'file'),(10,'fm_folder_access_full','X','main','Y',NULL,'file'),(11,'fm_folder_access_workflow','U','main','Y',NULL,'file'),(12,'bitrixcloud_deny','D','bitrixcloud','Y',NULL,'module'),(13,'bitrixcloud_control','W','bitrixcloud','Y',NULL,'module'),(14,'clouds_denied','D','clouds','Y',NULL,'module'),(15,'clouds_browse','F','clouds','Y',NULL,'module'),(16,'clouds_upload','U','clouds','Y',NULL,'module'),(17,'clouds_full_access','W','clouds','Y',NULL,'module'),(18,'fileman_denied','D','fileman','Y','','module'),(19,'fileman_allowed_folders','F','fileman','Y','','module'),(20,'fileman_full_access','W','fileman','Y','','module'),(21,'medialib_denied','D','fileman','Y','','medialib'),(22,'medialib_view','F','fileman','Y','','medialib'),(23,'medialib_only_new','R','fileman','Y','','medialib'),(24,'medialib_edit_items','V','fileman','Y','','medialib'),(25,'medialib_editor','W','fileman','Y','','medialib'),(26,'medialib_full','X','fileman','Y','','medialib'),(27,'stickers_denied','D','fileman','Y','','stickers'),(28,'stickers_read','R','fileman','Y','','stickers'),(29,'stickers_edit','W','fileman','Y','','stickers'),(30,'hblock_denied','D','highloadblock','Y',NULL,'module'),(31,'hblock_read','R','highloadblock','Y',NULL,'module'),(32,'hblock_write','W','highloadblock','Y',NULL,'module'),(33,'iblock_deny','D','iblock','Y',NULL,'iblock'),(34,'iblock_read','R','iblock','Y',NULL,'iblock'),(35,'iblock_element_add','E','iblock','Y',NULL,'iblock'),(36,'iblock_admin_read','S','iblock','Y',NULL,'iblock'),(37,'iblock_admin_add','T','iblock','Y',NULL,'iblock'),(38,'iblock_limited_edit','U','iblock','Y',NULL,'iblock'),(39,'iblock_full_edit','W','iblock','Y',NULL,'iblock'),(40,'iblock_full','X','iblock','Y',NULL,'iblock'),(41,'security_denied','D','security','Y',NULL,'module'),(42,'security_filter','F','security','Y',NULL,'module'),(43,'security_otp','S','security','Y',NULL,'module'),(44,'security_view_all_settings','T','security','Y',NULL,'module'),(45,'security_full_access','W','security','Y',NULL,'module'),(46,'seo_denied','D','seo','Y','','module'),(47,'seo_edit','F','seo','Y','','module'),(48,'seo_full_access','W','seo','Y','','module'),(49,'Контент-редакторы','Q','main','N','Разрешено изменять информацию в своем профайле. Управление кешем','module');
/*!40000 ALTER TABLE `b_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_task_operation`
--

DROP TABLE IF EXISTS `b_task_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_task_operation` (
  `TASK_ID` int(18) NOT NULL,
  `OPERATION_ID` int(18) NOT NULL,
  PRIMARY KEY (`TASK_ID`,`OPERATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_task_operation`
--

LOCK TABLES `b_task_operation` WRITE;
/*!40000 ALTER TABLE `b_task_operation` DISABLE KEYS */;
INSERT INTO `b_task_operation` VALUES (2,2),(2,3),(3,2),(3,4),(3,5),(3,6),(3,7),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(5,2),(5,3),(5,5),(5,6),(5,7),(5,8),(5,9),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,10),(6,11),(6,12),(6,13),(6,14),(6,15),(6,16),(6,17),(6,18),(8,19),(8,20),(8,21),(9,19),(9,20),(9,21),(9,22),(9,23),(9,24),(9,25),(9,26),(9,27),(9,28),(9,29),(9,30),(9,31),(9,32),(9,33),(9,34),(10,19),(10,20),(10,21),(10,22),(10,23),(10,24),(10,25),(10,26),(10,27),(10,28),(10,29),(10,30),(10,31),(10,32),(10,33),(10,34),(10,35),(11,19),(11,20),(11,21),(11,24),(11,28),(13,36),(13,37),(13,38),(15,39),(16,39),(16,40),(17,39),(17,40),(17,41),(19,44),(19,45),(19,46),(19,47),(19,48),(19,49),(19,50),(19,52),(19,53),(20,42),(20,43),(20,44),(20,45),(20,46),(20,47),(20,48),(20,49),(20,50),(20,51),(20,52),(20,53),(20,54),(22,55),(23,55),(23,56),(23,60),(24,55),(24,60),(24,61),(24,62),(25,55),(25,56),(25,57),(25,58),(25,60),(25,61),(25,62),(26,55),(26,56),(26,57),(26,58),(26,59),(26,60),(26,61),(26,62),(28,63),(29,63),(29,64),(29,65),(29,66),(31,67),(32,68),(32,69),(34,70),(34,71),(35,72),(36,70),(36,71),(36,73),(37,70),(37,71),(37,72),(37,73),(38,70),(38,71),(38,72),(38,73),(38,74),(38,75),(38,76),(38,77),(39,70),(39,71),(39,72),(39,73),(39,74),(39,75),(39,76),(39,77),(39,78),(39,79),(39,80),(39,81),(40,70),(40,71),(40,72),(40,73),(40,74),(40,75),(40,76),(40,77),(40,78),(40,79),(40,80),(40,81),(40,82),(40,83),(40,84),(40,85),(40,86),(40,87),(42,88),(43,89),(44,90),(44,91),(44,92),(44,93),(44,94),(44,95),(44,96),(44,97),(44,98),(44,99),(44,100),(45,88),(45,89),(45,90),(45,91),(45,92),(45,93),(45,94),(45,95),(45,96),(45,97),(45,98),(45,99),(45,100),(45,101),(45,102),(45,103),(45,104),(45,105),(45,106),(45,107),(45,108),(45,109),(45,110),(45,111),(45,112),(45,113),(47,115),(48,114),(48,115),(49,2),(49,3),(49,14);
/*!40000 ALTER TABLE `b_task_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_undo`
--

DROP TABLE IF EXISTS `b_undo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_undo` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `USER_ID` int(11) DEFAULT NULL,
  `TIMESTAMP_X` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_undo`
--

LOCK TABLES `b_undo` WRITE;
/*!40000 ALTER TABLE `b_undo` DISABLE KEYS */;
INSERT INTO `b_undo` VALUES ('10673f8a829158360587880d9d46f21c1','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:55:\"/home/burrman/public_html/bitrix.exam1/search/index.php\";s:7:\"content\";s:989:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Поиск\");\n?>\n\n<?$APPLICATION->IncludeComponent(\"bitrix:search.page\", \"clear\", array(\n	\"RESTART\" => \"N\",\n	\"CHECK_DATES\" => \"N\",\n	\"USE_TITLE_RANK\" => \"N\",\n	\"DEFAULT_SORT\" => \"rank\",\n	\"arrFILTER\" => array(\n		0 => \"no\",\n	),\n	\"SHOW_WHERE\" => \"N\",\n	\"SHOW_WHEN\" => \"N\",\n	\"PAGE_RESULT_COUNT\" => \"5\",\n	\"AJAX_MODE\" => \"N\",\n	\"AJAX_OPTION_SHADOW\" => \"Y\",\n	\"AJAX_OPTION_JUMP\" => \"N\",\n	\"AJAX_OPTION_STYLE\" => \"Y\",\n	\"AJAX_OPTION_HISTORY\" => \"N\",\n	\"CACHE_TYPE\" => \"A\",\n	\"CACHE_TIME\" => \"36000000\",\n	\"DISPLAY_TOP_PAGER\" => \"N\",\n	\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n	\"PAGER_TITLE\" => \"Результаты поиска\",\n	\"PAGER_SHOW_ALWAYS\" => \"N\",\n	\"PAGER_TEMPLATE\" => \"arrows\",\n	\"USE_SUGGEST\" => \"N\",\n	\"SHOW_ITEM_TAGS\" => \"N\",\n	\"SHOW_ITEM_DATE_CHANGE\" => \"N\",\n	\"SHOW_ORDER_BY\" => \"N\",\n	\"SHOW_TAGS_CLOUD\" => \"N\",\n	\"AJAX_OPTION_ADDITIONAL\" => \"\"\n	),\n	false\n);?>\n\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505304741),('1077c51724e41db8d6cd47d5c7a670bfc','fileman','edit_file','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:66:\"/home/burrman/public_html/bitrix.exam1/partners/become-partner.php\";s:7:\"content\";s:540:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetPageProperty(\"title\", \"Как стать партнером\");\n$APPLICATION->SetTitle(\"Как стать партнером\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:system.auth.form\", \n	\"demo\", \n	array(\n		\"FORGOT_PASSWORD_URL\" => \"\",\n		\"PROFILE_URL\" => \"/user/profile.php\",\n		\"REGISTER_URL\" => \"/user/registration.php\",\n		\"SHOW_ERRORS\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \"demo\"\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505309179),('10de10c13369b32a0f09210330f7e3871','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:66:\"/home/burrman/public_html/bitrix.exam1/partners/become-partner.php\";s:7:\"content\";s:546:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetPageProperty(\"title\", \"Как стать партнером\");\n$APPLICATION->SetTitle(\"Как стать партнером\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:system.auth.form\", \n	\".default\", \n	array(\n		\"FORGOT_PASSWORD_URL\" => \"\",\n		\"PROFILE_URL\" => \"user/profile.php\",\n		\"REGISTER_URL\" => \"user/registration.php\",\n		\"SHOW_ERRORS\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\"\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505306897),('1208288cc2e26abb1c56a5ed54433b2d8','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2856:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\"reviews\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"[DOCUMENTS]\",\n			3 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"2\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"Y\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Отзывы\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"SEF_FOLDER\" => \"/rew/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"\",\n			\"detail\" => \"#ELEMENT_ID#/\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505299601),('1228c00fa83ef95724f4cc15463215e20','fileman','new_file','CFileman::UndoNewFile','a:4:{s:7:\"absPath\";s:60:\"/home/burrman/public_html/bitrix.exam1/user/registration.php\";s:4:\"path\";s:22:\"/user/registration.php\";s:4:\"site\";s:2:\"s1\";s:6:\"public\";s:1:\"Y\";}',1,1505305954),('1253fca9f2cc2c1849468dc85b76d3d95','fileman','edit_menu','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:58:\"/home/burrman/public_html/bitrix.exam1/user/.left.menu.php\";s:7:\"content\";s:115:\"<?\n$aMenuLinks = Array(\n	Array(\n		\"Профиль\", \n		\"/user/profiel.php\", \n		Array(), \n		Array(), \n		\"\" \n	)\n);\n?>\";}',1,1505306134),('12b399129888840a034c140c16c295035','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2827:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\"reviews\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"N\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"[DOCUMENTS]\",\n			3 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"2\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"N\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"VARIABLE_ALIASES\" => array(\n			\"SECTION_ID\" => \"SECTION_ID\",\n			\"ELEMENT_ID\" => \"ELEMENT_ID\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505290417),('1341bd10a49dfb4678eb824ff42c7025a','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:66:\"/home/burrman/public_html/bitrix.exam1/partners/become-partner.php\";s:7:\"content\";s:540:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetPageProperty(\"title\", \"Как стать партнером\");\n$APPLICATION->SetTitle(\"Как стать партнером\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:system.auth.form\", \n	\"demo\", \n	array(\n		\"FORGOT_PASSWORD_URL\" => \"\",\n		\"PROFILE_URL\" => \"/user/profile.php\",\n		\"REGISTER_URL\" => \"/user/registration.php\",\n		\"SHOW_ERRORS\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \"demo\"\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505307478),('138d37fe2a2283dc1b93f6344b4955ded','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2778:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\"reviews\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"N\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"N\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"N\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"VARIABLE_ALIASES\" => array(\n			\"SECTION_ID\" => \"SECTION_ID\",\n			\"ELEMENT_ID\" => \"ELEMENT_ID\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505287502),('149442e9e7ad038f06fbeab8d26d2d0b9','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2825:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\"reviews\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"[DOCUMENTS]\",\n			3 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"2\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"Y\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Отзывы\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"N\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"VARIABLE_ALIASES\" => array(\n			\"SECTION_ID\" => \"SECTION_ID\",\n			\"ELEMENT_ID\" => \"ELEMENT_ID\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505298700),('14a5c2eb3d500bb8fcb5d1ccd2f9ce326','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2852:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\"reviews\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"[DOCUMENTS]\",\n			3 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"2\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"Y\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Отзывы\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"N\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"SEF_FOLDER\" => \"/rew/\",\n		\"VARIABLE_ALIASES\" => array(\n			\"SECTION_ID\" => \"SECTION_ID\",\n			\"ELEMENT_ID\" => \"ELEMENT_ID\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505304472),('1520d8bbdbce4774e6a4b54d05e8860ba','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:66:\"/home/burrman/public_html/bitrix.exam1/partners/become-partner.php\";s:7:\"content\";s:482:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetPageProperty(\"title\", \"Как стать партнером\");\n$APPLICATION->SetTitle(\"Как стать партнером\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:system.auth.form\",\n	\"\",\n	Array(\n		\"FORGOT_PASSWORD_URL\" => \"\",\n		\"PROFILE_URL\" => \"user/profile\",\n		\"REGISTER_URL\" => \"user/registration\",\n		\"SHOW_ERRORS\" => \"N\"\n	)\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505306865),('1536e0854b63a67295e23f95d73ceed0b','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:66:\"/home/burrman/public_html/bitrix.exam1/partners/become-partner.php\";s:7:\"content\";s:548:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetPageProperty(\"title\", \"Как стать партнером\");\n$APPLICATION->SetTitle(\"Как стать партнером\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:system.auth.form\", \n	\".default\", \n	array(\n		\"FORGOT_PASSWORD_URL\" => \"\",\n		\"PROFILE_URL\" => \"/user/profile.php\",\n		\"REGISTER_URL\" => \"/user/registration.php\",\n		\"SHOW_ERRORS\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\"\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505307486),('15c58d0fe95f523fc3b40b74a7e34e46a','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:54:\"/home/burrman/public_html/bitrix.exam1/login/index.php\";s:7:\"content\";s:772:\"<?\ndefine(\"NEED_AUTH\", true);\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n\nif (is_string($_REQUEST[\"backurl\"]) && strpos($_REQUEST[\"backurl\"], \"/\") === 0)\n{\n	LocalRedirect($_REQUEST[\"backurl\"]);\n}\n\n$APPLICATION->SetTitle(\"Вход на сайт\");\n?><p>\n	<?$APPLICATION->IncludeComponent(\n	\"bitrix:system.auth.form\", \n	\"demo\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"demo\",\n		\"REGISTER_URL\" => \"/login/registration.php\",\n		\"FORGOT_PASSWORD_URL\" => \"\",\n		\"PROFILE_URL\" => \"\",\n		\"SHOW_ERRORS\" => \"N\"\n	),\n	false\n);?>Вы зарегистрированы и успешно авторизовались.\n</p>\n<p>\n	<a href=\"<?=SITE_DIR?>\">Вернуться на главную страницу</a>\n</p>\n <br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505308405),('15eea3f9400cf1004d088f593e9e7658a','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2825:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\"reviews\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"[DOCUMENTS]\",\n			3 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"2\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"Y\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Отзывы\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"N\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"VARIABLE_ALIASES\" => array(\n			\"SECTION_ID\" => \"SECTION_ID\",\n			\"ELEMENT_ID\" => \"ELEMENT_ID\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505291590),('16253d7f4f0e5d72427d3de6d044c6ffe','fileman','new_file','CFileman::UndoNewFile','a:5:{s:7:\"absPath\";s:55:\"/home/burrman/public_html/bitrix.exam1/user/profiel.php\";s:4:\"path\";s:17:\"/user/profiel.php\";s:4:\"site\";s:2:\"s1\";s:6:\"public\";s:1:\"Y\";s:4:\"menu\";a:3:{s:8:\"menuFile\";s:20:\"/user/.left.menu.php\";s:8:\"menuName\";s:14:\"Профиль\";s:8:\"menuPath\";s:17:\"/user/profiel.php\";}}',1,1505306089),('16b15b610c3af32cea6261ea56425f6e7','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2805:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\"reviews\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"N\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"N\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"N\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"VARIABLE_ALIASES\" => array(\n			\"SECTION_ID\" => \"SECTION_ID\",\n			\"ELEMENT_ID\" => \"ELEMENT_ID\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505287880),('16c91dc70de9dae4a0586b4706d76580f','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2827:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\".default\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"[DOCUMENTS]\",\n			3 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"2\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"Y\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Отзывы\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"N\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"VARIABLE_ALIASES\" => array(\n			\"SECTION_ID\" => \"SECTION_ID\",\n			\"ELEMENT_ID\" => \"ELEMENT_ID\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505290889),('16d1fe53643656b62cb78a24ff55e35cd','fileman','edit_file','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:53:\"/home/burrman/public_html/bitrix.exam1/user/index.php\";s:7:\"content\";s:456:\"<?\ndefine(\"NEED_AUTH\", true);\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n\nif (isset($_REQUEST[\"backurl\"]) && strlen($_REQUEST[\"backurl\"])>0) {\n	LocalRedirect($backurl);\n}\n\n$APPLICATION->SetTitle(\"Авторизация\");\n?>\n<p>Вы успешно зарегестрировались.</p>\n\n<p><a href=\"<?=SITE_DIR?>\">Вернуться на главную страницу</a></p>\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505308570),('17089b9ec9810ff5ee73c9d28d73084b2','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2825:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\"reviews\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"[DOCUMENTS]\",\n			3 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"2\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"Y\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Отзывы\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"N\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"VARIABLE_ALIASES\" => array(\n			\"SECTION_ID\" => \"SECTION_ID\",\n			\"ELEMENT_ID\" => \"ELEMENT_ID\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505290739),('172968792859a9142d8aeba1e32608476','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2827:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\".default\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"[DOCUMENTS]\",\n			3 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"2\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"Y\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Отзывы\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"N\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"VARIABLE_ALIASES\" => array(\n			\"SECTION_ID\" => \"SECTION_ID\",\n			\"ELEMENT_ID\" => \"ELEMENT_ID\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505291664),('18ba853dbba186d0aadd7989625ed9280','fileman','edit_file','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:53:\"/home/burrman/public_html/bitrix.exam1/user/index.php\";s:7:\"content\";s:697:\"<?\ndefine(\"NEED_AUTH\", true);\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n\nif (isset($_REQUEST[\"backurl\"]) && strlen($_REQUEST[\"backurl\"])>0) {\n	LocalRedirect($backurl);\n}\n\n$APPLICATION->SetTitle(\"Авторизация\");\n?><p>\n	 <?$APPLICATION->IncludeComponent(\n	\"bitrix:system.auth.form\", \n	\"demo\", \n	array(\n		\"FORGOT_PASSWORD_URL\" => \"\",\n		\"PROFILE_URL\" => \"\",\n		\"REGISTER_URL\" => \"\",\n		\"SHOW_ERRORS\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \"demo\"\n	),\n	false\n);?>Вы успешно зарегестрировались.\n</p>\n<p>\n <a href=\"<?=SITE_DIR?>\">Вернуться на главную страницу</a>\n</p>\n <br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505308737),('1900b6b7021212ea996b29f5bbd9a0d8b','fileman','edit_menu','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/.top.menu.php\";s:7:\"content\";s:562:\"<?\n$aMenuLinks = Array(\n	Array(\n		\"Компания\", \n		\"company/\", \n		Array(), \n		Array(\"PARENT_TEXT\"=>\"Текст для пункта Компания\"), \n		\"\" \n	),\n	Array(\n		\"Новости\", \n		\"news/\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"Продукция\", \n		\"products/\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"Услуги\", \n		\"services/\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"Партнерам\", \n		\"partners/\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"Отзывы\", \n		\"rew/\", \n		Array(), \n		Array(), \n		\"\" \n	)\n);\n?>\";}',1,1505304632),('19fd5d6bc5a3fe0d99048a1afd04f55f8','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:53:\"/home/burrman/public_html/bitrix.exam1/user/index.php\";s:7:\"content\";s:649:\"<?\ndefine(\"NEED_AUTH\", true);\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n\nif (isset($_REQUEST[\"backurl\"]) && strlen($_REQUEST[\"backurl\"])>0) {\n	LocalRedirect($backurl);\n}\n\n$APPLICATION->SetTitle(\"Авторизация\");\n?><p>\n	 <?$APPLICATION->IncludeComponent(\n	\"bitrix:system.auth.form\",\n	\"\",\n	Array(\n		\"FORGOT_PASSWORD_URL\" => \"\",\n		\"PROFILE_URL\" => \"\",\n		\"REGISTER_URL\" => \"\",\n		\"SHOW_ERRORS\" => \"N\"\n	)\n);?>Вы успешно зарегестрировались.\n</p>\n<p>\n <a href=\"<?=SITE_DIR?>\">Вернуться на главную страницу</a>\n</p>\n <br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505308586),('1b35e385f169b2db7012f5993913bc030','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2850:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\"reviews\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"[DOCUMENTS]\",\n			3 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"2\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"Y\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Отзывы\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"SEF_FOLDER\" => \"/rew/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"\",\n			\"detail\" => \"#CODE#/\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505298947),('1b3777680f5650cddb90dea96f15eb2d8','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:54:\"/home/burrman/public_html/bitrix.exam1/login/index.php\";s:7:\"content\";s:604:\"<?\ndefine(\"NEED_AUTH\", true);\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n\nif (is_string($_REQUEST[\"backurl\"]) && strpos($_REQUEST[\"backurl\"], \"/\") === 0)\n{\n	LocalRedirect($_REQUEST[\"backurl\"]);\n}\n\n$APPLICATION->SetTitle(\"Вход на сайт\");\n?><p>\n	<?$APPLICATION->IncludeComponent(\n	\"bitrix:system.auth.form\",\n	\"\",\nArray(),\nfalse\n);?>Вы зарегистрированы и успешно авторизовались.\n</p>\n<p>\n	<a href=\"<?=SITE_DIR?>\">Вернуться на главную страницу</a>\n</p>\n <br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505308379),('1b45eac2ecdf524fd5166fdf2aa29665e','fileman','edit_file','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:66:\"/home/burrman/public_html/bitrix.exam1/partners/become-partner.php\";s:7:\"content\";s:470:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetPageProperty(\"title\", \"Как стать партнером\");\n$APPLICATION->SetTitle(\"Как стать партнером\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.include\",\n	\"\",\n	Array(\n		\"AREA_FILE_SHOW\" => \"file\",\n		\"AREA_FILE_SUFFIX\" => \"inc\",\n		\"EDIT_TEMPLATE\" => \"\",\n		\"PATH\" => \"include/menu_text.php\"\n	)\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505306844),('1bda3a45472a4c16008649d6ec20043de','fileman','edit_menu','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/.top.menu.php\";s:7:\"content\";s:635:\"<?\n$aMenuLinks = Array(\n	Array(\n		\"Компания\", \n		\"company/\", \n		Array(), \n		Array(\"PARENT_TEXT\"=>\"Текст для пункта Компания\"), \n		\"\" \n	),\n	Array(\n		\"Новости\", \n		\"news/\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"Продукция\", \n		\"products/\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"Услуги\", \n		\"services/\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"Партнерам\", \n		\"partners/\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"Поиск\", \n		\"search/\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"Отзывы\", \n		\"rew/\", \n		Array(), \n		Array(), \n		\"\" \n	)\n);\n?>\";}',1,1505304668),('1c227737a514bbb128050dfcf352f2b52','fileman','new_file','CFileman::UndoNewFile','a:4:{s:7:\"absPath\";s:53:\"/home/burrman/public_html/bitrix.exam1/login/user.php\";s:4:\"path\";s:15:\"/login/user.php\";s:4:\"site\";s:2:\"s1\";s:6:\"public\";s:1:\"Y\";}',1,1505307177),('1c2804ffe303069d0160183ffc31396b8','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2825:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\"reviews\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"N\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"[DOCUMENTS]\",\n			3 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"2\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"Y\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Отзывы\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"N\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"VARIABLE_ALIASES\" => array(\n			\"SECTION_ID\" => \"SECTION_ID\",\n			\"ELEMENT_ID\" => \"ELEMENT_ID\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505290711),('1c7221b23edf2b5b74bb5f0c35b478c75','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2856:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\"reviews\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"[DOCUMENTS]\",\n			3 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"2\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"Y\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Отзывы\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"SEF_FOLDER\" => \"/rew/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"\",\n			\"detail\" => \"#ELEMENT_ID#/\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505304557),('1c95166e0df921c93799094634bc5c55c','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2858:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\"reviews\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"[DOCUMENTS]\",\n			3 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"2\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"Y\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Отзывы\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"SEF_FOLDER\" => \"/rew/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"\",\n			\"detail\" => \"#ELEMENT_CODE#/\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505303904),('1cc5ad69305d991b224226db4755b99ba','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:71:\"/home/burrman/public_html/bitrix.exam1/local/templates/exam1/header.php\";s:7:\"content\";s:15908:\"<?if(!defined(\"B_PROLOG_INCLUDED\") || B_PROLOG_INCLUDED!==true)die();?>\n<?\nIncludeTemplateLangFile(__FILE__);\n\n$dayStart = strtotime(\'today 09:00\');\n$dayEnd = strtotime(\'today 18:00\');\n\n$now = time();\n\n$workTime = $now > $dayStart && $now < $dayEnd;\n?>\n<!DOCTYPE html>\n<html lang=\"ru\">\n\n<head>\n    <?$APPLICATION->ShowHead();?>\n    <title><?$APPLICATION->ShowTitle()?></title>\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <meta charset=\"utf-8\" />\n    <meta name=\"keywords\" content=\"\">\n    <meta name=\"description\" content=\"\">\n    <meta name=\"author\" content=\"\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <link rel=\"stylesheet\" href=\"<?=SITE_TEMPLATE_PATH?>/css/reset.css\" />\n    <link rel=\"stylesheet\" href=\"<?=SITE_TEMPLATE_PATH?>/css/style.css\" />\n    <link rel=\"stylesheet\" href=\"<?=SITE_TEMPLATE_PATH?>/css/owl.carousel.css\" />\n    <script src=\"<?=SITE_TEMPLATE_PATH?>/js/jquery.min.js\"></script>\n    <script src=\"<?=SITE_TEMPLATE_PATH?>/js/owl.carousel.min.js\"></script>\n    <script src=\"<?=SITE_TEMPLATE_PATH?>/js/scripts.js\"></script>\n    <link rel=\"icon\" type=\"image/vnd.microsoft.icon\" href=\"favicon.ico\">\n    <link rel=\"shortcut icon\" href=\"favicon.ico\">\n</head>\n\n<body>\n<?$APPLICATION->ShowPanel();?>\n    <!-- wrap -->\n    <div class=\"wrap\">\n        <!-- header -->\n        <header class=\"header\">\n            <div class=\"inner-wrap\">\n                <div class=\"logo-block\"><a href=\"\" class=\"logo\">Мебельный магазин</a>\n                </div>\n                    <div class=\"main-phone-block\">\n                        <?if($workTime):?>\n                            <a href=\"tel:84952128506\" class=\"phone\">8 (495) 212-85-06</a>\n                        <?else:?>\n                            <a href=\"mailto:store@store.ru\" class=\"phone\">store@store.ru</a>\n                        <?endif?>\n                        <div class=\"shedule\">время работы с 9-00 до 18-00</div>\n                    </div>\n                <div class=\"actions-block\">\n                    <form action=\"/\" class=\"main-frm-search\">\n                        <input type=\"text\" placeholder=\"Поиск\">\n                        <button type=\"submit\"></button>\n                    </form>\n                    <nav class=\"menu-block\">\n                         <?$APPLICATION->IncludeComponent(\n                                \"bitrix:system.auth.form\",\n                                \"demo\",\n                                Array(\n                                    \"COMPONENT_TEMPLATE\" => \"demo\",\n                                    \"FORGOT_PASSWORD_URL\" => \"\",\n                                    \"PROFILE_URL\" => \"\",\n                                    \"REGISTER_URL\" => \"\",\n                                    \"SHOW_ERRORS\" => \"N\"\n                                )\n                            );?>\n                    </nav>\n                </div>\n            </div>\n        </header>\n        <!-- /header -->\n        <!-- nav -->\n        <?$APPLICATION->IncludeComponent(\n        	\"bitrix:menu\", \n        	\"top_menu\", \n        	array(\n        		\"ALLOW_MULTI_SELECT\" => \"N\",\n        		\"CHILD_MENU_TYPE\" => \"left\",\n        		\"COMPONENT_TEMPLATE\" => \"top_menu\",\n        		\"DELAY\" => \"N\",\n        		\"MAX_LEVEL\" => \"3\",\n        		\"MENU_CACHE_GET_VARS\" => array(\n        		),\n        		\"MENU_CACHE_TIME\" => \"3600\",\n        		\"MENU_CACHE_TYPE\" => \"N\",\n        		\"MENU_CACHE_USE_GROUPS\" => \"Y\",\n        		\"ROOT_MENU_TYPE\" => \"top\",\n        		\"USE_EXT\" => \"Y\"\n        	),\n        	false\n        );?>\n        <!-- /nav -->\n        <!-- breadcrumbs -->\n        <?if($APPLICATION->GetCurPage() != \"/\"):?>\n            <div class=\"breadcrumbs-box\">\n                <div class=\"inner-wrap\">\n                    <a href=\"\">Главная</a>\n                    <a href=\"\">Мебель</a>\n                    <span>Выставки и события</span>\n                </div>\n            </div>\n        <?endif?>\n        <!-- /breadcrumbs -->\n        <!-- page -->\n        <div class=\"page\">\n            <!-- content box -->\n            <div class=\"content-box\">\n                <!-- content -->\n                <div class=\"content\">\n                    <div class=\"cnt\">\n                        <?if($APPLICATION->GetCurPage() == \"/\"):?>\n                            <p>«Мебельная компания» осуществляет производство мебели на высококлассном оборудовании с применением минимальной доли ручного труда, что позволяет обеспечить высокое качество нашей продукции. Налажен производственный процесс как массового и индивидуального характера, что с одной стороны позволяет обеспечить постоянную номенклатуру изделий и индивидуальный подход – с другой.\n                            </p>\n                            <!-- index column -->\n                            <div class=\"cnt-section index-column\">\n                                <div class=\"col-wrap\">\n                                    <!-- main actions box -->\n                                    <div class=\"column main-actions-box\">\n                                        <div class=\"title-block\">\n                                            <h2>Новинки</h2>\n                                             <hr>\n                                        </div>\n                                          <div class=\"items-wrap\">\n                                            <div class=\"item-wrap\">\n                                                <div class=\"item\">\n                                                    <div class=\"title-block att\">\n                                                        Угловой диван!\n                                                    </div>\n                                                    <br>\n                                                    <div class=\"inner-block\">\n                                                        <a href=\"\" class=\"photo-block\">\n                                                            <img src=\"<?=SITE_TEMPLATE_PATH?>/img/new01.jpg\" alt=\"\">\n                                                        </a>\n                                                        <div class=\"text\"><a href=\"\">Угловой диван \"Титаник\",  с большим выбором расцветок и фактур.</a>\n                                                        <a href=\"\" class=\"btn-arr\"></a>\n                                                        </div>\n                                                    </div>\n                                                </div>\n                                            </div>\n                                            <div class=\"item-wrap\">\n                                                <div class=\"item\">\n                                                    <div class=\"title-block att\">\n                                                        Угловой диван!\n                                                    </div>\n                                                    <br>\n                                                    <div class=\"inner-block\">\n                                                        <a href=\"\" class=\"photo-block\">\n                                                            <img src=\"<?=SITE_TEMPLATE_PATH?>/img/new02.jpg\" alt=\"\">\n                                                        </a>\n                                                        <div class=\"text\"><a href=\"\">Угловой диван \"Титаник\",  с большим выбором расцветок и фактур.</a>\n                                                        <a href=\"\" class=\"btn-arr\"></a>\n                                                        </div>\n                                                    </div>\n                                                </div>\n                                            </div>\n                                            <div class=\"item-wrap\">\n                                                <div class=\"item\">\n                                                    <div class=\"title-block att\">\n                                                        Угловой диван!\n                                                    </div>\n                                                    <br>\n                                                    <div class=\"inner-block\">\n                                                        <a href=\"\" class=\"photo-block\">\n                                                            <img src=\"<?=SITE_TEMPLATE_PATH?>/img/new03.jpg\" alt=\"\">\n                                                        </a>\n                                                        <div class=\"text\"><a href=\"\">Угловой диван \"Титаник\",  с большим выбором расцветок и фактур.</a>\n                                                        <a href=\"\" class=\"btn-arr\"></a>\n                                                        </div>\n                                                    </div>\n                                                </div>\n                                            </div>\n                                        </div>\n                                        <a href=\"\" class=\"btn-next\">Все новинки</a>\n                                    </div>\n                                    <!-- /main actions box -->\n                                    <!-- main news box -->\n                                    <div class=\"column main-news-box\">\n                                        <div class=\"title-block\">\n                                            <h2>Новости</h2>\n                                        </div>\n                                        <hr>\n                                        <div class=\"items-wrap\">\n                                            <div class=\"item-wrap\">\n                                                <div class=\"item\">\n                                                    <div class=\"title\"><a href=\"\">29 августа 2012</a>\n                                                    </div>\n                                                    <div class=\"text\"><a href=\"\">Поступление лучших офисных кресел из Германии </a>\n                                                    </div>\n                                                </div>\n                                            </div>\n                                            <div class=\"item-wrap\">\n                                                <div class=\"item\">\n                                                    <div class=\"title\"><a href=\"\">29 августа 2012</a>\n                                                    </div>\n                                                    <div class=\"text\"><a href=\"\">Мастер-класс дизайнеров  из Италии для производителей мебели </a>\n                                                    </div>\n                                                </div>\n                                            </div>\n                                            <div class=\"item-wrap\">\n                                                <div class=\"item\">\n                                                    <div class=\"title\"><a href=\"\">29 августа 2012</a>\n                                                    </div>\n                                                    <div class=\"text\"><a href=\"\">Поступление лучших офисных кресел из Германии </a>\n                                                    </div>\n                                                </div>\n                                            </div>\n                                            <div class=\"item-wrap\">\n                                                <div class=\"item\">\n                                                    <div class=\"title\"><a href=\"\">29 августа 2012</a>\n                                                    </div>\n                                                    <div class=\"text\"><a href=\"\">Наша дилерская сеть расширилась теперь ассортимент наших товаров доступен в Казани </a>\n                                                    </div>\n                                                </div>\n                                            </div>\n                                        </div>\n                                        <a href=\"\" class=\"btn-next\">Все новости</a>\n                                    </div>\n                                    <!-- /main news box -->\n                                </div>\n                            </div>\n                            <!-- /index column -->\n                            <!-- afisha box -->\n                            <div class=\"cnt-section afisha-box\">\n                                <div class=\"section-title-block\">\n                                    <h2 class=\"second-ttile\">Ближайшие мероприятия</h2>\n                                    <a href=\"\" class=\"btn-next\">все мероприятия</a>\n                                </div>\n                                <hr>\n                                <div class=\"items-wrap\">\n                                    <div class=\"item-wrap\">\n                                        <div class=\"item\">\n                                            <div class=\"title\"><a href=\"\">29 августа 2012, Москва</a>\n                                            </div>\n                                            <div class=\"text\"><a href=\"\">Семинар производителей мебели России и СНГ, Обсуждение тенденций.</a>\n                                            </div>\n                                        </div>\n                                    </div>\n                                    <div class=\"item-wrap\">\n                                        <div class=\"item\">\n                                            <div class=\"title\"><a href=\"\">29 августа 2012, Москва</a>\n                                            </div>\n                                            <div class=\"text\"><a href=\"\">Открытие шоу-рума на Невском проспекте. Последние модели в большом ассортименте.</a>\n                                            </div>\n                                        </div>\n                                    </div>\n                                    <div class=\"item-wrap\">\n                                        <div class=\"item\">\n                                            <div class=\"title\"><a href=\"\">29 августа 2012, Москва</a>\n                                            </div>\n                                            <div class=\"text\"><a href=\"\">Открытие нового магазина в нашей  дилерской сети.</a>\n                                            </div>\n                                        </div>\n                                    </div>\n                                </div>\n                            </div>\n                        <?else:?>\n                            <header>\n                                <h1><?=$APPLICATION->ShowTitle()?></h1>\n                            </header>\n                            <hr>\n                        <?endif?>\";}',1,1505309508),('1cfa4fff74553ecc86c0aab03b22a33cd','fileman','edit_file','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:54:\"/home/burrman/public_html/bitrix.exam1/login/index.php\";s:7:\"content\";s:772:\"<?\ndefine(\"NEED_AUTH\", true);\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n\nif (is_string($_REQUEST[\"backurl\"]) && strpos($_REQUEST[\"backurl\"], \"/\") === 0)\n{\n	LocalRedirect($_REQUEST[\"backurl\"]);\n}\n\n$APPLICATION->SetTitle(\"Вход на сайт\");\n?><p>\n	<?$APPLICATION->IncludeComponent(\n	\"bitrix:system.auth.form\", \n	\"demo\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"demo\",\n		\"REGISTER_URL\" => \"/login/registration.php\",\n		\"FORGOT_PASSWORD_URL\" => \"\",\n		\"PROFILE_URL\" => \"\",\n		\"SHOW_ERRORS\" => \"N\"\n	),\n	false\n);?>Вы зарегистрированы и успешно авторизовались.\n</p>\n<p>\n	<a href=\"<?=SITE_DIR?>\">Вернуться на главную страницу</a>\n</p>\n <br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505308421),('1d2ab8681f9ecb9eb5b21702159d7af0c','fileman','edit_menu','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/.top.menu.php\";s:7:\"content\";s:635:\"<?\n$aMenuLinks = Array(\n	Array(\n		\"Компания\", \n		\"company/\", \n		Array(), \n		Array(\"PARENT_TEXT\"=>\"Текст для пункта Компания\"), \n		\"\" \n	),\n	Array(\n		\"Новости\", \n		\"news/\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"Продукция\", \n		\"products/\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"Услуги\", \n		\"services/\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"Партнерам\", \n		\"partners/\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"Отзывы\", \n		\"rew/\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"Поиск\", \n		\"search/\", \n		Array(), \n		Array(), \n		\"\" \n	)\n);\n?>\";}',1,1505304646),('1d4c049ef0c8dfff351d98504d1732a73','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2850:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\"reviews\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"[DOCUMENTS]\",\n			3 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"2\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"Y\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Отзывы\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"SEF_FOLDER\" => \"/rew/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"\",\n			\"detail\" => \"#CODE#/\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505299090),('1d5dbb54eef05b8a2c5b04c23552c15d6','fileman','edit_file','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:54:\"/home/burrman/public_html/bitrix.exam1/login/index.php\";s:7:\"content\";s:523:\"<?\r\ndefine(\"NEED_AUTH\", true);\r\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\r\n\r\nif (is_string($_REQUEST[\"backurl\"]) && strpos($_REQUEST[\"backurl\"], \"/\") === 0)\r\n{\r\n	LocalRedirect($_REQUEST[\"backurl\"]);\r\n}\r\n\r\n$APPLICATION->SetTitle(\"Вход на сайт\");\r\n?>\r\n<p>Вы зарегистрированы и успешно авторизовались.</p>\r\n\r\n<p><a href=\"<?=SITE_DIR?>\">Вернуться на главную страницу</a></p>\r\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505308349),('1dd567e3f9d80b2eb7664c5a8eecbfc15','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2850:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\"reviews\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"[DOCUMENTS]\",\n			3 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"2\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"Y\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Отзывы\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"SEF_FOLDER\" => \"/rew/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"\",\n			\"detail\" => \"#CODE#/\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505299219),('1e01ed99606b2bf8d29af1dd0ffdc3db1','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:66:\"/home/burrman/public_html/bitrix.exam1/partners/become-partner.php\";s:7:\"content\";s:548:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetPageProperty(\"title\", \"Как стать партнером\");\n$APPLICATION->SetTitle(\"Как стать партнером\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:system.auth.form\", \n	\".default\", \n	array(\n		\"FORGOT_PASSWORD_URL\" => \"\",\n		\"PROFILE_URL\" => \"/user/profile.php\",\n		\"REGISTER_URL\" => \"/user/registration.php\",\n		\"SHOW_ERRORS\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\"\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505306918),('1e1a25cfc67cc55ca55f3b2ed072e949f','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2856:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\"reviews\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"[DOCUMENTS]\",\n			3 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"2\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"Y\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Отзывы\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"SEF_FOLDER\" => \"/rew/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"\",\n			\"detail\" => \"#ELEMENT_ID#/\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505298858),('1e292a60b413a56731efbca17cb7e8ffe','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2856:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\"reviews\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"[DOCUMENTS]\",\n			3 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"2\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"Y\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Отзывы\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"SEF_FOLDER\" => \"/rew/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"\",\n			\"detail\" => \"#ELEMENT_ID#/\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505299162),('1e3d74cfdd3e1dcdb7328fa590b7a4c1a','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2828:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\"reviews\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"N\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n			3 => \"[DOCUMENTS]\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"N\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"N\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"VARIABLE_ALIASES\" => array(\n			\"SECTION_ID\" => \"SECTION_ID\",\n			\"ELEMENT_ID\" => \"ELEMENT_ID\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505290371),('1e5b3fb7784204763bcce63593693d0ba','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2827:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\"reviews\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"N\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"[DOCUMENTS]\",\n			3 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"N\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"2\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"N\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"VARIABLE_ALIASES\" => array(\n			\"SECTION_ID\" => \"SECTION_ID\",\n			\"ELEMENT_ID\" => \"ELEMENT_ID\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505290387),('1e6faa5de95fcf5e9708c65ac2d044607','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2827:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\".default\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"[DOCUMENTS]\",\n			3 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"2\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"Y\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Отзывы\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"N\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"VARIABLE_ALIASES\" => array(\n			\"SECTION_ID\" => \"SECTION_ID\",\n			\"ELEMENT_ID\" => \"ELEMENT_ID\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505291099),('1e96c76a7af35dc07a38398681a64c29a','fileman','new_section','CFileman::UndoNewSection','a:3:{s:7:\"absPath\";s:43:\"/home/burrman/public_html/bitrix.exam1/user\";s:4:\"path\";s:5:\"/user\";s:4:\"site\";s:2:\"s1\";}',1,1505305923),('1fa73a97ae9f05cfce950a5a67c739983','fileman','new_file','CFileman::UndoNewFile','a:4:{s:7:\"absPath\";s:57:\"/home/burrman/public_html/bitrix.exam1/login/register.php\";s:4:\"path\";s:19:\"/login/register.php\";s:4:\"site\";s:2:\"s1\";s:6:\"public\";s:1:\"Y\";}',1,1505309819),('1fd750ba8877166f523ce9c6b71aab7ec','fileman','edit_component_props','CFileman::UndoEditFile','a:2:{s:7:\"absPath\";s:52:\"/home/burrman/public_html/bitrix.exam1/rew/index.php\";s:7:\"content\";s:2825:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Отзывы\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\"reviews\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"j M Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"[DOCUMENTS]\",\n			3 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"reviews\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"j F Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"POSITION\",\n			1 => \"COMPANY\",\n			2 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"2\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"Y\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Отзывы\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"N\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"TAGS_CLOUD_ELEMENTS\" => \"150\",\n		\"PERIOD_NEW_TAGS\" => \"\",\n		\"DISPLAY_AS_RATING\" => \"rating\",\n		\"FONT_MAX\" => \"50\",\n		\"FONT_MIN\" => \"10\",\n		\"COLOR_NEW\" => \"3E74E6\",\n		\"COLOR_OLD\" => \"C0C0C0\",\n		\"TAGS_CLOUD_WIDTH\" => \"100%\",\n		\"TEMPLATE_THEME\" => \"blue\",\n		\"MEDIA_PROPERTY\" => \"\",\n		\"SLIDER_PROPERTY\" => \"\",\n		\"VARIABLE_ALIASES\" => array(\n			\"SECTION_ID\" => \"SECTION_ID\",\n			\"ELEMENT_ID\" => \"ELEMENT_ID\",\n		)\n	),\n	false\n);?>\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}',1,1505290993);
/*!40000 ALTER TABLE `b_undo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_urlpreview_metadata`
--

DROP TABLE IF EXISTS `b_urlpreview_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_urlpreview_metadata` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `DATE_INSERT` datetime NOT NULL,
  `DATE_EXPIRE` datetime DEFAULT NULL,
  `TITLE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IMAGE_ID` int(11) DEFAULT NULL,
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMBED` mediumtext COLLATE utf8_unicode_ci,
  `EXTRA` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_URLPREVIEW_METADATA_URL` (`URL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_urlpreview_metadata`
--

LOCK TABLES `b_urlpreview_metadata` WRITE;
/*!40000 ALTER TABLE `b_urlpreview_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_urlpreview_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_urlpreview_route`
--

DROP TABLE IF EXISTS `b_urlpreview_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_urlpreview_route` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROUTE` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETERS` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_URLPREVIEW_ROUTE_ROUTE` (`ROUTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_urlpreview_route`
--

LOCK TABLES `b_urlpreview_route` WRITE;
/*!40000 ALTER TABLE `b_urlpreview_route` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_urlpreview_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user`
--

DROP TABLE IF EXISTS `b_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CHECKWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_GENDER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(18) DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STREET` text COLLATE utf8_unicode_ci,
  `PERSONAL_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_NOTES` text COLLATE utf8_unicode_ci,
  `WORK_COMPANY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STREET` text COLLATE utf8_unicode_ci,
  `WORK_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PROFILE` text COLLATE utf8_unicode_ci,
  `WORK_LOGO` int(18) DEFAULT NULL,
  `WORK_NOTES` text COLLATE utf8_unicode_ci,
  `ADMIN_NOTES` text COLLATE utf8_unicode_ci,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN_ATTEMPTS` int(18) DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  `AUTO_TIME_ZONE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE_OFFSET` int(18) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BX_USER_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  KEY `ix_b_user_email` (`EMAIL`),
  KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  KEY `IX_B_USER_XML_ID` (`XML_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user`
--

LOCK TABLES `b_user` WRITE;
/*!40000 ALTER TABLE `b_user` DISABLE KEYS */;
INSERT INTO `b_user` VALUES (1,'2017-09-08 11:56:51','admin','adUgxPBYcde8d5a10398cfaa9770f2b6d88e0d16','2t2rQiLkdabf7b978dfeb9f4ed776af666822ef0','Y','','','admin@gmail.com','2017-09-14 10:03:55','2017-09-08 14:56:51',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-08 14:56:51',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `b_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_access`
--

DROP TABLE IF EXISTS `b_user_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_access` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_ua_user_provider` (`USER_ID`,`PROVIDER_ID`),
  KEY `ix_ua_user_access` (`USER_ID`,`ACCESS_CODE`),
  KEY `ix_ua_access` (`ACCESS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_access`
--

LOCK TABLES `b_user_access` WRITE;
/*!40000 ALTER TABLE `b_user_access` DISABLE KEYS */;
INSERT INTO `b_user_access` VALUES (0,'group','G2'),(1,'group','G1'),(1,'group','G3'),(1,'group','G4'),(1,'group','G2'),(1,'user','U1');
/*!40000 ALTER TABLE `b_user_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_access_check`
--

DROP TABLE IF EXISTS `b_user_access_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_access_check` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_uac_user_provider` (`USER_ID`,`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_access_check`
--

LOCK TABLES `b_user_access_check` WRITE;
/*!40000 ALTER TABLE `b_user_access_check` DISABLE KEYS */;
INSERT INTO `b_user_access_check` VALUES (1,'group'),(1,'user');
/*!40000 ALTER TABLE `b_user_access_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_counter`
--

DROP TABLE IF EXISTS `b_user_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_counter` (
  `USER_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '**',
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CNT` int(18) NOT NULL DEFAULT '0',
  `LAST_DATE` datetime DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '3000-01-01 00:00:00',
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `SENT` char(1) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`USER_ID`,`SITE_ID`,`CODE`),
  KEY `ix_buc_tag` (`TAG`),
  KEY `ix_buc_code` (`CODE`),
  KEY `ix_buc_ts` (`TIMESTAMP_X`),
  KEY `ix_buc_sent_userid` (`SENT`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_counter`
--

LOCK TABLES `b_user_counter` WRITE;
/*!40000 ALTER TABLE `b_user_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_digest`
--

DROP TABLE IF EXISTS `b_user_digest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_digest` (
  `USER_ID` int(11) NOT NULL,
  `DIGEST_HA1` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_digest`
--

LOCK TABLES `b_user_digest` WRITE;
/*!40000 ALTER TABLE `b_user_digest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_digest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_field`
--

DROP TABLE IF EXISTS `b_user_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_NAME` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_field`
--

LOCK TABLES `b_user_field` WRITE;
/*!40000 ALTER TABLE `b_user_field` DISABLE KEYS */;
INSERT INTO `b_user_field` VALUES (1,'BLOG_POST','UF_BLOG_POST_DOC','file','UF_BLOG_POST_DOC',100,'Y','N','N','N','Y','Y','a:0:{}'),(2,'BLOG_COMMENT','UF_BLOG_COMMENT_DOC','file','UF_BLOG_COMMENT_DOC',100,'Y','N','N','N','Y','Y','a:0:{}'),(3,'BLOG_POST','UF_BLOG_POST_URL_PRV','url_preview','UF_BLOG_POST_URL_PRV',100,'N','N','N','N','Y','Y','a:0:{}'),(4,'BLOG_COMMENT','UF_BLOG_COMM_URL_PRV','url_preview','UF_BLOG_COMM_URL_PRV',100,'N','N','N','N','Y','Y','a:0:{}'),(5,'BLOG_POST','UF_GRATITUDE','integer','UF_GRATITUDE',100,'N','N','N','N','Y','N','a:0:{}'),(6,'FORUM_MESSAGE','UF_FORUM_MES_URL_PRV','url_preview','UF_FORUM_MES_URL_PRV',100,'N','N','N','N','Y','N','a:0:{}');
/*!40000 ALTER TABLE `b_user_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_field_confirm`
--

DROP TABLE IF EXISTS `b_user_field_confirm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_field_confirm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_CHANGE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELD_VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIRM_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_user_field_confirm1` (`USER_ID`,`CONFIRM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_field_confirm`
--

LOCK TABLES `b_user_field_confirm` WRITE;
/*!40000 ALTER TABLE `b_user_field_confirm` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_field_confirm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_field_enum`
--

DROP TABLE IF EXISTS `b_user_field_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_field_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_FIELD_ID` int(11) DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_field_enum`
--

LOCK TABLES `b_user_field_enum` WRITE;
/*!40000 ALTER TABLE `b_user_field_enum` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_field_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_field_lang`
--

DROP TABLE IF EXISTS `b_user_field_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_field_lang` (
  `USER_FIELD_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EDIT_FORM_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_field_lang`
--

LOCK TABLES `b_user_field_lang` WRITE;
/*!40000 ALTER TABLE `b_user_field_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_field_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_group`
--

DROP TABLE IF EXISTS `b_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_group` (
  `USER_ID` int(18) NOT NULL,
  `GROUP_ID` int(18) NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL,
  UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  KEY `ix_user_group_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_group`
--

LOCK TABLES `b_user_group` WRITE;
/*!40000 ALTER TABLE `b_user_group` DISABLE KEYS */;
INSERT INTO `b_user_group` VALUES (1,1,NULL,NULL),(1,3,NULL,NULL),(1,4,NULL,NULL);
/*!40000 ALTER TABLE `b_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_hit_auth`
--

DROP TABLE IF EXISTS `b_user_hit_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_hit_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_hit_auth`
--

LOCK TABLES `b_user_hit_auth` WRITE;
/*!40000 ALTER TABLE `b_user_hit_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_hit_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_option`
--

DROP TABLE IF EXISTS `b_user_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CATEGORY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_category_name` (`USER_ID`,`CATEGORY`,`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_option`
--

LOCK TABLES `b_user_option` WRITE;
/*!40000 ALTER TABLE `b_user_option` DISABLE KEYS */;
INSERT INTO `b_user_option` VALUES (1,0,'intranet','~gadgets_admin_index','a:1:{i:0;a:1:{s:7:\"GADGETS\";a:8:{s:20:\"ADMIN_INFO@333333333\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:19:\"HTML_AREA@444444444\";a:5:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";a:1:{s:7:\"content\";s:797:\"<table class=\"bx-gadgets-info-site-table\" cellspacing=\"0\"><tr>	<td class=\"bx-gadget-gray\">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class=\"bx-gadgets-info-site-logo\" rowspan=\"5\"><img src=\"/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png\"></td></tr><tr>	<td class=\"bx-gadget-gray\">Адрес сайта:</td>	<td><a href=\"http://www.1c-bitrix.ru\">www.1c-bitrix.ru</a></td></tr><tr>	<td class=\"bx-gadget-gray\">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class=\"bx-gadget-gray\">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class=\"bx-gadget-gray\">E-mail:</td>	<td><a href=\"mailto:info@1c-bitrix.ru\">info@1c-bitrix.ru</a></td></tr></table>\";}s:8:\"SETTINGS\";a:1:{s:9:\"TITLE_STD\";s:34:\"Информация о сайте\";}}s:25:\"ADMIN_CHECKLIST@777888999\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:19:\"RSSREADER@777777777\";a:4:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";s:8:\"SETTINGS\";a:3:{s:9:\"TITLE_STD\";s:33:\"Новости 1С-Битрикс\";s:3:\"CNT\";i:10;s:7:\"RSS_URL\";s:45:\"https://www.1c-bitrix.ru/about/life/news/rss/\";}}s:24:\"ADMIN_SECURITY@555555555\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:25:\"ADMIN_SITESPEED@666666777\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_PERFMON@666666666\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_MARKETPALCE@22549\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";}}}}','Y'),(2,0,'main.interface','global','a:1:{s:5:\"theme\";s:9:\"pale-blue\";}','Y'),(3,1,'admin_panel','settings','a:1:{s:4:\"edit\";s:2:\"on\";}','N'),(4,1,'hot_keys','user_defined','b:1;','N'),(6,1,'bx.windowmanager.9.5','size_/bitrix/admin/component_props.php','a:2:{s:5:\"width\";s:3:\"951\";s:6:\"height\";s:3:\"557\";}','N'),(7,1,'main','helper_hero_admin','a:1:{s:4:\"time\";s:10:\"1505372380\";}','N'),(8,1,'fileman','last_pathes','s:205:\"a:10:{i:0;s:8:\"/company\";i:1;s:9:\"/partners\";i:2;s:5:\"/.git\";i:3;s:7:\"/bitrix\";i:4;s:9:\"/contacts\";i:5;s:8:\"/include\";i:6;s:6:\"/login\";i:7;s:5:\"/news\";i:8;s:19:\"/partners/timetable\";i:9;s:10:\"/timetable\";}\";','N'),(11,1,'fileman','file_dialog_config','s:26:\"s1;/services;list;type;asc\";','N'),(31,1,'admin_menu','pos','a:1:{s:8:\"sections\";s:120:\"menu_system,menu_site,menu_fileman,menu_iblock_/news,menu_iblock,menu_perfmon,menu_util,menu_search,menu_module_settings\";}','N'),(32,1,'favorite','favorite_menu','a:1:{s:5:\"stick\";s:1:\"N\";}','N'),(39,1,'fileman','code_editor','a:1:{s:5:\"theme\";s:5:\"light\";}','N'),(41,1,'html_editor','user_settings_','a:3:{s:4:\"view\";s:4:\"code\";s:13:\"taskbar_shown\";s:1:\"1\";s:14:\"split_vertical\";s:1:\"0\";}','N'),(60,1,'access_dialog_recent','group','a:1:{i:0;s:2:\"G1\";}','N'),(61,1,'access_dialog_recent','other','a:1:{i:0;s:2:\"G2\";}','N'),(77,1,'list','tbl_iblock_element_881cf6fa4474b7416b1203428b3ee67e','a:4:{s:7:\"columns\";s:54:\"ID,ACTIVE,DATE_ACTIVE_FROM,NAME,PROPERTY_9,PROPERTY_10\";s:2:\"by\";s:11:\"timestamp_x\";s:5:\"order\";s:4:\"desc\";s:9:\"page_size\";s:2:\"20\";}','N'),(78,1,'filter','tbl_iblock_element_881cf6fa4474b7416b1203428b3ee67e_filter','a:2:{s:4:\"rows\";s:20:\"miss-0,IBEL_A_PROP_9\";s:11:\"styleFolded\";s:1:\"N\";}','N'),(88,1,'edit','form_element_5_73da5711b1d311823f16c2780a3ea439','a:1:{s:6:\"expand\";s:3:\"off\";}','N'),(90,1,'form','form_element_5','a:1:{s:4:\"tabs\";s:1996:\"edit1--#--Элемент--,--ACTIVE--#--Активность--,--ACTIVE_FROM--#--Начало активности--,--NAME--#--*Название--,--CODE--#--*Символьный код--,--IBLOCK_ELEMENT_PROP_VALUE--#----Значения свойств--,--PROPERTY_9--#--Должность--,--PROPERTY_10--#--Компания--;--edit6--#--Подробно--,--ID--#--ID--,--DATE_CREATE--#--Создан--,--TIMESTAMP_X--#--Изменен--,--ACTIVE_TO--#--Окончание активности--,--SORT--#--Сортировка--,--PREVIEW_PICTURE--#--Картинка для анонса--,--DETAIL_PICTURE--#--Детальная картинка--,--PREVIEW_TEXT--#--Описание для анонса--,--DETAIL_TEXT--#--Детальное описание--,--PROPERTY_11--#--Документы--;--edit14--#--SEO--,--IPROPERTY_TEMPLATES_ELEMENT_META_TITLE--#--Шаблон META TITLE--,--IPROPERTY_TEMPLATES_ELEMENT_META_KEYWORDS--#--Шаблон META KEYWORDS--,--IPROPERTY_TEMPLATES_ELEMENT_META_DESCRIPTION--#--Шаблон META DESCRIPTION--,--IPROPERTY_TEMPLATES_ELEMENT_PAGE_TITLE--#--Заголовок элемента--,--IPROPERTY_TEMPLATES_ELEMENTS_PREVIEW_PICTURE--#----Настройки для картинок анонса элементов--,--IPROPERTY_TEMPLATES_ELEMENT_PREVIEW_PICTURE_FILE_ALT--#--Шаблон ALT--,--IPROPERTY_TEMPLATES_ELEMENT_PREVIEW_PICTURE_FILE_TITLE--#--Шаблон TITLE--,--IPROPERTY_TEMPLATES_ELEMENT_PREVIEW_PICTURE_FILE_NAME--#--Шаблон имени файла--,--IPROPERTY_TEMPLATES_ELEMENTS_DETAIL_PICTURE--#----Настройки для детальных картинок элементов--,--IPROPERTY_TEMPLATES_ELEMENT_DETAIL_PICTURE_FILE_ALT--#--Шаблон ALT--,--IPROPERTY_TEMPLATES_ELEMENT_DETAIL_PICTURE_FILE_TITLE--#--Шаблон TITLE--,--IPROPERTY_TEMPLATES_ELEMENT_DETAIL_PICTURE_FILE_NAME--#--Шаблон имени файла--,--SEO_ADDITIONAL--#----Дополнительно--,--TAGS--#--Теги--;--\";}','N'),(106,1,'main','fileinput','a:1:{s:4:\"mode\";s:9:\"mode-pict\";}','N');
/*!40000 ALTER TABLE `b_user_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_stored_auth`
--

DROP TABLE IF EXISTS `b_user_stored_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_stored_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TEMP_HASH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IP_ADDR` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ux_user_hash` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_stored_auth`
--

LOCK TABLES `b_user_stored_auth` WRITE;
/*!40000 ALTER TABLE `b_user_stored_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_stored_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_utm_blog_comment`
--

DROP TABLE IF EXISTS `b_utm_blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_utm_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_COMMENT_1` (`FIELD_ID`),
  KEY `ix_utm_BLOG_COMMENT_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_utm_blog_comment`
--

LOCK TABLES `b_utm_blog_comment` WRITE;
/*!40000 ALTER TABLE `b_utm_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_utm_blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_utm_blog_post`
--

DROP TABLE IF EXISTS `b_utm_blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_utm_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_POST_1` (`FIELD_ID`),
  KEY `ix_utm_BLOG_POST_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_utm_blog_post`
--

LOCK TABLES `b_utm_blog_post` WRITE;
/*!40000 ALTER TABLE `b_utm_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_utm_blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_utm_forum_message`
--

DROP TABLE IF EXISTS `b_utm_forum_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_utm_forum_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_FORUM_MESSAGE_1` (`FIELD_ID`),
  KEY `ix_utm_FORUM_MESSAGE_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_utm_forum_message`
--

LOCK TABLES `b_utm_forum_message` WRITE;
/*!40000 ALTER TABLE `b_utm_forum_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_utm_forum_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_uts_blog_comment`
--

DROP TABLE IF EXISTS `b_uts_blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_uts_blog_comment` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_COMMENT_DOC` text COLLATE utf8_unicode_ci,
  `UF_BLOG_COMM_URL_PRV` int(11) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_uts_blog_comment`
--

LOCK TABLES `b_uts_blog_comment` WRITE;
/*!40000 ALTER TABLE `b_uts_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_uts_blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_uts_blog_post`
--

DROP TABLE IF EXISTS `b_uts_blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_uts_blog_post` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_POST_DOC` text COLLATE utf8_unicode_ci,
  `UF_BLOG_POST_URL_PRV` int(11) DEFAULT NULL,
  `UF_GRATITUDE` int(18) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_uts_blog_post`
--

LOCK TABLES `b_uts_blog_post` WRITE;
/*!40000 ALTER TABLE `b_uts_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_uts_blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_uts_forum_message`
--

DROP TABLE IF EXISTS `b_uts_forum_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_uts_forum_message` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_FORUM_MES_URL_PRV` int(11) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_uts_forum_message`
--

LOCK TABLES `b_uts_forum_message` WRITE;
/*!40000 ALTER TABLE `b_uts_forum_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_uts_forum_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote`
--

DROP TABLE IF EXISTS `b_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT '0',
  `C_SORT` int(18) DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NOTIFY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `AUTHOR_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `DATE_START` datetime NOT NULL,
  `DATE_END` datetime NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COUNTER` int(11) NOT NULL DEFAULT '0',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `IMAGE_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNIQUE_TYPE` int(18) NOT NULL DEFAULT '2',
  `KEEP_IP_SEC` int(18) DEFAULT NULL,
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CHANNEL_ID` (`CHANNEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote`
--

LOCK TABLES `b_vote` WRITE;
/*!40000 ALTER TABLE `b_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_answer`
--

DROP TABLE IF EXISTS `b_vote_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL,
  `QUESTION_ID` int(18) NOT NULL DEFAULT '0',
  `C_SORT` int(18) DEFAULT '100',
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `MESSAGE_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `COUNTER` int(18) NOT NULL DEFAULT '0',
  `FIELD_TYPE` int(5) NOT NULL DEFAULT '0',
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLOR` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_QUESTION_ID` (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_answer`
--

LOCK TABLES `b_vote_answer` WRITE;
/*!40000 ALTER TABLE `b_vote_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_attached_object`
--

DROP TABLE IF EXISTS `b_vote_attached_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_attached_object` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OBJECT_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_AO_1` (`OBJECT_ID`),
  KEY `IX_VOTE_AO_2` (`MODULE_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_attached_object`
--

LOCK TABLES `b_vote_attached_object` WRITE;
/*!40000 ALTER TABLE `b_vote_attached_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_attached_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_channel`
--

DROP TABLE IF EXISTS `b_vote_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_channel` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SYMBOLIC_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_SORT` int(18) DEFAULT '100',
  `FIRST_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TIMESTAMP_X` datetime NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VOTE_SINGLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_channel`
--

LOCK TABLES `b_vote_channel` WRITE;
/*!40000 ALTER TABLE `b_vote_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_channel_2_group`
--

DROP TABLE IF EXISTS `b_vote_channel_2_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_channel_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT '0',
  `GROUP_ID` int(18) NOT NULL DEFAULT '0',
  `PERMISSION` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_CHANNEL_ID_GROUP_ID` (`CHANNEL_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_channel_2_group`
--

LOCK TABLES `b_vote_channel_2_group` WRITE;
/*!40000 ALTER TABLE `b_vote_channel_2_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_channel_2_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_channel_2_site`
--

DROP TABLE IF EXISTS `b_vote_channel_2_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_channel_2_site` (
  `CHANNEL_ID` int(18) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CHANNEL_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_channel_2_site`
--

LOCK TABLES `b_vote_channel_2_site` WRITE;
/*!40000 ALTER TABLE `b_vote_channel_2_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_channel_2_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_event`
--

DROP TABLE IF EXISTS `b_vote_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `VOTE_ID` int(18) NOT NULL DEFAULT '0',
  `VOTE_USER_ID` int(18) NOT NULL DEFAULT '0',
  `DATE_VOTE` datetime NOT NULL,
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALID` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `IX_USER_ID` (`VOTE_USER_ID`),
  KEY `IX_B_VOTE_EVENT_2` (`VOTE_ID`,`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_event`
--

LOCK TABLES `b_vote_event` WRITE;
/*!40000 ALTER TABLE `b_vote_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_event_answer`
--

DROP TABLE IF EXISTS `b_vote_event_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_event_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_QUESTION_ID` int(18) NOT NULL DEFAULT '0',
  `ANSWER_ID` int(18) NOT NULL DEFAULT '0',
  `MESSAGE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_QUESTION_ID` (`EVENT_QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_event_answer`
--

LOCK TABLES `b_vote_event_answer` WRITE;
/*!40000 ALTER TABLE `b_vote_event_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_event_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_event_question`
--

DROP TABLE IF EXISTS `b_vote_event_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_event_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_ID` int(18) NOT NULL DEFAULT '0',
  `QUESTION_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_ID` (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_event_question`
--

LOCK TABLES `b_vote_event_question` WRITE;
/*!40000 ALTER TABLE `b_vote_event_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_event_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_question`
--

DROP TABLE IF EXISTS `b_vote_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL,
  `VOTE_ID` int(18) NOT NULL DEFAULT '0',
  `C_SORT` int(18) DEFAULT '100',
  `COUNTER` int(11) NOT NULL DEFAULT '0',
  `QUESTION` text COLLATE utf8_unicode_ci NOT NULL,
  `QUESTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `IMAGE_ID` int(18) DEFAULT NULL,
  `DIAGRAM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `REQUIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DIAGRAM_TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'histogram',
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE_NEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_ID` (`VOTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_question`
--

LOCK TABLES `b_vote_question` WRITE;
/*!40000 ALTER TABLE `b_vote_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_user`
--

DROP TABLE IF EXISTS `b_vote_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  `AUTH_USER_ID` int(18) DEFAULT NULL,
  `COUNTER` int(18) NOT NULL DEFAULT '0',
  `DATE_FIRST` datetime NOT NULL,
  `DATE_LAST` datetime NOT NULL,
  `LAST_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_user`
--

LOCK TABLES `b_vote_user` WRITE;
/*!40000 ALTER TABLE `b_vote_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_xml_tree`
--

DROP TABLE IF EXISTS `b_xml_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_xml_tree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(11) DEFAULT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `DEPTH_LEVEL` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` longtext COLLATE utf8_unicode_ci,
  `ATTRIBUTES` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_xml_tree_parent` (`PARENT_ID`),
  KEY `ix_b_xml_tree_left` (`LEFT_MARGIN`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_xml_tree`
--

LOCK TABLES `b_xml_tree` WRITE;
/*!40000 ALTER TABLE `b_xml_tree` DISABLE KEYS */;
INSERT INTO `b_xml_tree` VALUES (1,0,1,544,0,'КоммерческаяИнформация',NULL,'a:2:{s:22:\"ВерсияСхемы\";s:5:\"2.021\";s:32:\"ДатаФормирования\";s:19:\"2017-04-25T15:19:28\";}'),(2,1,2,181,1,'Классификатор',NULL,NULL),(3,2,3,4,2,'Ид','5',NULL),(4,2,5,6,2,'Наименование','Отзывы',NULL),(5,2,7,152,2,'Свойства',NULL,NULL),(6,5,8,15,3,'Свойство',NULL,NULL),(7,6,9,10,4,'Ид','CML2_ACTIVE',NULL),(8,6,11,12,4,'Наименование','БитриксАктивность',NULL),(9,6,13,14,4,'Множественное','false',NULL),(10,5,16,23,3,'Свойство',NULL,NULL),(11,10,17,18,4,'Ид','CML2_CODE',NULL),(12,10,19,20,4,'Наименование','Символьный код',NULL),(13,10,21,22,4,'Множественное','false',NULL),(14,5,24,31,3,'Свойство',NULL,NULL),(15,14,25,26,4,'Ид','CML2_SORT',NULL),(16,14,27,28,4,'Наименование','Сортировка',NULL),(17,14,29,30,4,'Множественное','false',NULL),(18,5,32,39,3,'Свойство',NULL,NULL),(19,18,33,34,4,'Ид','CML2_ACTIVE_FROM',NULL),(20,18,35,36,4,'Наименование','Начало активности',NULL),(21,18,37,38,4,'Множественное','false',NULL),(22,5,40,47,3,'Свойство',NULL,NULL),(23,22,41,42,4,'Ид','CML2_ACTIVE_TO',NULL),(24,22,43,44,4,'Наименование','Окончание активности',NULL),(25,22,45,46,4,'Множественное','false',NULL),(26,5,48,55,3,'Свойство',NULL,NULL),(27,26,49,50,4,'Ид','CML2_PREVIEW_TEXT',NULL),(28,26,51,52,4,'Наименование','Анонс',NULL),(29,26,53,54,4,'Множественное','false',NULL),(30,5,56,63,3,'Свойство',NULL,NULL),(31,30,57,58,4,'Ид','CML2_DETAIL_TEXT',NULL),(32,30,59,60,4,'Наименование','Описание',NULL),(33,30,61,62,4,'Множественное','false',NULL),(34,5,64,71,3,'Свойство',NULL,NULL),(35,34,65,66,4,'Ид','CML2_PREVIEW_PICTURE',NULL),(36,34,67,68,4,'Наименование','Картинка анонса',NULL),(37,34,69,70,4,'Множественное','false',NULL),(38,5,72,111,3,'Свойство',NULL,NULL),(39,38,73,74,4,'Ид','9',NULL),(40,38,75,76,4,'Наименование','Должность',NULL),(41,38,77,78,4,'Множественное','false',NULL),(42,38,79,80,4,'БитриксСортировка','500',NULL),(43,38,81,82,4,'БитриксКод','POSITION',NULL),(44,38,83,84,4,'БитриксТипСвойства','S',NULL),(45,38,85,86,4,'БитриксСтрок','1',NULL),(46,38,87,88,4,'БитриксКолонок','30',NULL),(47,38,89,90,4,'БитриксТипСписка','L',NULL),(48,38,91,92,4,'БитриксТипыФайлов',NULL,NULL),(49,38,93,94,4,'БитриксКоличествоПолей','5',NULL),(50,38,95,96,4,'БитриксСвязанныйИнфоблок',NULL,NULL),(51,38,97,98,4,'БитриксОписаниеРазрешено','false',NULL),(52,38,99,100,4,'БитриксПоискРазрешен','false',NULL),(53,38,101,102,4,'БитриксФильтрРазрешен','false',NULL),(54,38,103,104,4,'БитриксРасширениеТипа',NULL,NULL),(55,38,105,106,4,'БитриксОбязательное','false',NULL),(56,38,107,108,4,'БитриксЗначениеПоУмолчанию','s:0:\"\";',NULL),(57,38,109,110,4,'Сериализовано','1',NULL),(58,5,112,151,3,'Свойство',NULL,NULL),(59,58,113,114,4,'Ид','10',NULL),(60,58,115,116,4,'Наименование','Компания',NULL),(61,58,117,118,4,'Множественное','false',NULL),(62,58,119,120,4,'БитриксСортировка','500',NULL),(63,58,121,122,4,'БитриксКод','COMPANY',NULL),(64,58,123,124,4,'БитриксТипСвойства','S',NULL),(65,58,125,126,4,'БитриксСтрок','1',NULL),(66,58,127,128,4,'БитриксКолонок','30',NULL),(67,58,129,130,4,'БитриксТипСписка','L',NULL),(68,58,131,132,4,'БитриксТипыФайлов',NULL,NULL),(69,58,133,134,4,'БитриксКоличествоПолей','5',NULL),(70,58,135,136,4,'БитриксСвязанныйИнфоблок',NULL,NULL),(71,58,137,138,4,'БитриксОписаниеРазрешено','false',NULL),(72,58,139,140,4,'БитриксПоискРазрешен','false',NULL),(73,58,141,142,4,'БитриксФильтрРазрешен','false',NULL),(74,58,143,144,4,'БитриксРасширениеТипа',NULL,NULL),(75,58,145,146,4,'БитриксОбязательное','false',NULL),(76,58,147,148,4,'БитриксЗначениеПоУмолчанию','s:0:\"\";',NULL),(77,58,149,150,4,'Сериализовано','1',NULL),(78,2,153,178,2,'СвойстваЭлементов',NULL,NULL),(79,78,154,165,3,'Свойство',NULL,NULL),(80,79,155,156,4,'Ид','9',NULL),(81,79,157,158,4,'УмныйФильтр','false',NULL),(82,79,159,160,4,'ТипОтображения','F',NULL),(83,79,161,162,4,'ПоказатьРазвёрнутым','false',NULL),(84,79,163,164,4,'Подсказка',NULL,NULL),(85,78,166,177,3,'Свойство',NULL,NULL),(86,85,167,168,4,'Ид','10',NULL),(87,85,169,170,4,'УмныйФильтр','false',NULL),(88,85,171,172,4,'ТипОтображения','F',NULL),(89,85,173,174,4,'ПоказатьРазвёрнутым','false',NULL),(90,85,175,176,4,'Подсказка',NULL,NULL),(91,2,179,180,2,'Группы',NULL,NULL),(92,1,182,543,1,'Каталог',NULL,NULL),(93,92,183,184,2,'Ид','5',NULL),(94,92,185,186,2,'ИдКлассификатора','5',NULL),(95,92,187,188,2,'Наименование','Отзывы',NULL),(96,92,189,190,2,'БитриксКод','rew',NULL),(97,92,191,192,2,'БитриксСортировка','500',NULL),(98,92,193,194,2,'БитриксURLСписок','#SITE_DIR#/demo/index.php?ID=#IBLOCK_ID#',NULL),(99,92,195,196,2,'БитриксURLДеталь','#SITE_DIR#/demo/detail.php?ID=#ELEMENT_ID#',NULL),(100,92,197,198,2,'БитриксURLРаздел','#SITE_DIR#/demo/list.php?SECTION_ID=#SECTION_ID#',NULL),(101,92,199,200,2,'БитриксURLКанонический',NULL,NULL),(102,92,201,202,2,'БитриксКартинка',NULL,NULL),(103,92,203,204,2,'БитриксИндексироватьЭлементы','true',NULL),(104,92,205,206,2,'БитриксИндексироватьРазделы','true',NULL),(105,92,207,208,2,'БитриксДокументооборот','false',NULL),(106,92,209,270,2,'БитриксПодписи',NULL,NULL),(107,106,210,215,3,'БитриксПодпись',NULL,NULL),(108,107,211,212,4,'Ид','ELEMENT_NAME',NULL),(109,107,213,214,4,'Значение','Элемент',NULL),(110,106,216,221,3,'БитриксПодпись',NULL,NULL),(111,110,217,218,4,'Ид','ELEMENTS_NAME',NULL),(112,110,219,220,4,'Значение','Элементы',NULL),(113,106,222,227,3,'БитриксПодпись',NULL,NULL),(114,113,223,224,4,'Ид','ELEMENT_ADD',NULL),(115,113,225,226,4,'Значение','Добавить элемент',NULL),(116,106,228,233,3,'БитриксПодпись',NULL,NULL),(117,116,229,230,4,'Ид','ELEMENT_EDIT',NULL),(118,116,231,232,4,'Значение','Изменить элемент',NULL),(119,106,234,239,3,'БитриксПодпись',NULL,NULL),(120,119,235,236,4,'Ид','ELEMENT_DELETE',NULL),(121,119,237,238,4,'Значение','Удалить элемент',NULL),(122,106,240,245,3,'БитриксПодпись',NULL,NULL),(123,122,241,242,4,'Ид','SECTION_NAME',NULL),(124,122,243,244,4,'Значение','Раздел',NULL),(125,106,246,251,3,'БитриксПодпись',NULL,NULL),(126,125,247,248,4,'Ид','SECTIONS_NAME',NULL),(127,125,249,250,4,'Значение','Разделы',NULL),(128,106,252,257,3,'БитриксПодпись',NULL,NULL),(129,128,253,254,4,'Ид','SECTION_ADD',NULL),(130,128,255,256,4,'Значение','Добавить раздел',NULL),(131,106,258,263,3,'БитриксПодпись',NULL,NULL),(132,131,259,260,4,'Ид','SECTION_EDIT',NULL),(133,131,261,262,4,'Значение','Изменить раздел',NULL),(134,106,264,269,3,'БитриксПодпись',NULL,NULL),(135,134,265,266,4,'Ид','SECTION_DELETE',NULL),(136,134,267,268,4,'Значение','Удалить раздел',NULL),(137,92,271,542,2,'Товары',NULL,NULL),(138,137,272,361,3,'Товар',NULL,NULL),(139,138,273,274,4,'Ид','33',NULL),(140,138,275,276,4,'Наименование','Cергей Родионов',NULL),(141,138,277,278,4,'БитриксТеги',NULL,NULL),(142,138,279,280,4,'Группы',NULL,NULL),(143,138,281,282,4,'Картинка','rew_files/iblock/ca0/ca077a2b25a7018337efd6b66bc08738.jpg',NULL),(144,138,283,360,4,'ЗначенияСвойств',NULL,NULL),(145,144,284,289,5,'ЗначенияСвойства',NULL,NULL),(146,145,285,286,6,'Ид','CML2_ACTIVE',NULL),(147,145,287,288,6,'Значение','true',NULL),(148,144,290,295,5,'ЗначенияСвойства',NULL,NULL),(149,148,291,292,6,'Ид','CML2_CODE',NULL),(150,148,293,294,6,'Значение','cergey-rodionov',NULL),(151,144,296,301,5,'ЗначенияСвойства',NULL,NULL),(152,151,297,298,6,'Ид','CML2_SORT',NULL),(153,151,299,300,6,'Значение','500',NULL),(154,144,302,307,5,'ЗначенияСвойства',NULL,NULL),(155,154,303,304,6,'Ид','CML2_ACTIVE_FROM',NULL),(156,154,305,306,6,'Значение','2017-04-17 14:21:00',NULL),(157,144,308,313,5,'ЗначенияСвойства',NULL,NULL),(158,157,309,310,6,'Ид','CML2_ACTIVE_TO',NULL),(159,157,311,312,6,'Значение',NULL,NULL),(160,144,314,321,5,'ЗначенияСвойства',NULL,NULL),(161,160,315,316,6,'Ид','CML2_PREVIEW_TEXT',NULL),(162,160,317,318,6,'Значение','Вы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.',NULL),(163,160,319,320,6,'Тип','text',NULL),(164,144,322,329,5,'ЗначенияСвойства',NULL,NULL),(165,164,323,324,6,'Ид','CML2_DETAIL_TEXT',NULL),(166,164,325,326,6,'Значение','Вы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.\r\nВы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.\r\nВы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.',NULL),(167,164,327,328,6,'Тип','text',NULL),(168,144,330,335,5,'ЗначенияСвойства',NULL,NULL),(169,168,331,332,6,'Ид','CML2_PREVIEW_PICTURE',NULL),(170,168,333,334,6,'Значение','rew_files/iblock/91d/91df8ed14b6a59b55ed4fcffc3785617.jpg',NULL),(171,144,336,347,5,'ЗначенияСвойства',NULL,NULL),(172,171,337,338,6,'Ид','9',NULL),(173,171,339,340,6,'Значение','Генеральный директор',NULL),(174,171,341,346,6,'ЗначениеСвойства',NULL,NULL),(175,174,342,343,7,'Значение','Генеральный директор',NULL),(176,174,344,345,7,'Описание',NULL,NULL),(177,144,348,359,5,'ЗначенияСвойства',NULL,NULL),(178,177,349,350,6,'Ид','10',NULL),(179,177,351,352,6,'Значение','CTC-Медиа',NULL),(180,177,353,358,6,'ЗначениеСвойства',NULL,NULL),(181,180,354,355,7,'Значение','CTC-Медиа',NULL),(182,180,356,357,7,'Описание',NULL,NULL),(183,137,362,451,3,'Товар',NULL,NULL),(184,183,363,364,4,'Ид','34',NULL),(185,183,365,366,4,'Наименование','Анна Андреева',NULL),(186,183,367,368,4,'БитриксТеги',NULL,NULL),(187,183,369,370,4,'Группы',NULL,NULL),(188,183,371,372,4,'Картинка','rew_files/iblock/238/238f151e99ef1afafb7d41fa08d1660b.jpg',NULL),(189,183,373,450,4,'ЗначенияСвойств',NULL,NULL),(190,189,374,379,5,'ЗначенияСвойства',NULL,NULL),(191,190,375,376,6,'Ид','CML2_ACTIVE',NULL),(192,190,377,378,6,'Значение','true',NULL),(193,189,380,385,5,'ЗначенияСвойства',NULL,NULL),(194,193,381,382,6,'Ид','CML2_CODE',NULL),(195,193,383,384,6,'Значение','anna-andreeva',NULL),(196,189,386,391,5,'ЗначенияСвойства',NULL,NULL),(197,196,387,388,6,'Ид','CML2_SORT',NULL),(198,196,389,390,6,'Значение','500',NULL),(199,189,392,397,5,'ЗначенияСвойства',NULL,NULL),(200,199,393,394,6,'Ид','CML2_ACTIVE_FROM',NULL),(201,199,395,396,6,'Значение','2017-04-10 14:21:00',NULL),(202,189,398,403,5,'ЗначенияСвойства',NULL,NULL),(203,202,399,400,6,'Ид','CML2_ACTIVE_TO',NULL),(204,202,401,402,6,'Значение',NULL,NULL),(205,189,404,411,5,'ЗначенияСвойства',NULL,NULL),(206,205,405,406,6,'Ид','CML2_PREVIEW_TEXT',NULL),(207,205,407,408,6,'Значение','Вы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.',NULL),(208,205,409,410,6,'Тип','text',NULL),(209,189,412,419,5,'ЗначенияСвойства',NULL,NULL),(210,209,413,414,6,'Ид','CML2_DETAIL_TEXT',NULL),(211,209,415,416,6,'Значение','Вы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.\r\nВы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.\r\nВы сможете организовать внутри компании коллективную работу над проектами в рабочих группах, вести учет и планирование времени и событий, обмениваться сообщениями и почтой через портал, проводить внутри компании видеоконференции и делать многое другое.',NULL),(212,209,417,418,6,'Тип','text',NULL),(213,189,420,425,5,'ЗначенияСвойства',NULL,NULL),(214,213,421,422,6,'Ид','CML2_PREVIEW_PICTURE',NULL),(215,213,423,424,6,'Значение','rew_files/iblock/a1b/a1ba9e841dfec3556477afc50b324cf8.jpg',NULL),(216,189,426,437,5,'ЗначенияСвойства',NULL,NULL),(217,216,427,428,6,'Ид','9',NULL),(218,216,429,430,6,'Значение','Маркетолог',NULL),(219,216,431,436,6,'ЗначениеСвойства',NULL,NULL),(220,219,432,433,7,'Значение','Маркетолог',NULL),(221,219,434,435,7,'Описание',NULL,NULL),(222,189,438,449,5,'ЗначенияСвойства',NULL,NULL),(223,222,439,440,6,'Ид','10',NULL),(224,222,441,442,6,'Значение','RK-Telecom',NULL),(225,222,443,448,6,'ЗначениеСвойства',NULL,NULL),(226,225,444,445,7,'Значение','RK-Telecom',NULL),(227,225,446,447,7,'Описание',NULL,NULL),(228,137,452,541,3,'Товар',NULL,NULL),(229,228,453,454,4,'Ид','35',NULL),(230,228,455,456,4,'Наименование','Дмитрия Пялов',NULL),(231,228,457,458,4,'БитриксТеги',NULL,NULL),(232,228,459,460,4,'Группы',NULL,NULL),(233,228,461,462,4,'Картинка','rew_files/iblock/6c9/6c964a9a002c13ab8da7b43d47db996e.jpg',NULL),(234,228,463,540,4,'ЗначенияСвойств',NULL,NULL),(235,234,464,469,5,'ЗначенияСвойства',NULL,NULL),(236,235,465,466,6,'Ид','CML2_ACTIVE',NULL),(237,235,467,468,6,'Значение','true',NULL),(238,234,470,475,5,'ЗначенияСвойства',NULL,NULL),(239,238,471,472,6,'Ид','CML2_CODE',NULL),(240,238,473,474,6,'Значение','dmitriya-pyalov',NULL),(241,234,476,481,5,'ЗначенияСвойства',NULL,NULL),(242,241,477,478,6,'Ид','CML2_SORT',NULL),(243,241,479,480,6,'Значение','500',NULL),(244,234,482,487,5,'ЗначенияСвойства',NULL,NULL),(245,244,483,484,6,'Ид','CML2_ACTIVE_FROM',NULL),(246,244,485,486,6,'Значение','2017-04-24 14:21:00',NULL),(247,234,488,493,5,'ЗначенияСвойства',NULL,NULL),(248,247,489,490,6,'Ид','CML2_ACTIVE_TO',NULL),(249,247,491,492,6,'Значение',NULL,NULL),(250,234,494,501,5,'ЗначенияСвойства',NULL,NULL),(251,250,495,496,6,'Ид','CML2_PREVIEW_TEXT',NULL),(252,250,497,498,6,'Значение','Можете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала',NULL),(253,250,499,500,6,'Тип','text',NULL),(254,234,502,509,5,'ЗначенияСвойства',NULL,NULL),(255,254,503,504,6,'Ид','CML2_DETAIL_TEXT',NULL),(256,254,505,506,6,'Значение','Можете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала.\r\nМожете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала.\r\nМожете сразу перейти с «младшей», базовой редакции на «Бизнес-процессы». После такого перехода ваш портал можно будет интегрировать с внешним сайтом, на портале добавятся возможности визуального проектирования бизнес-процессов и управления списками, включая списки в рабочих группах. Кроме того, вы сможете анализировать посещаемость своего портала.\r\n',NULL),(257,254,507,508,6,'Тип','text',NULL),(258,234,510,515,5,'ЗначенияСвойства',NULL,NULL),(259,258,511,512,6,'Ид','CML2_PREVIEW_PICTURE',NULL),(260,258,513,514,6,'Значение','rew_files/iblock/ddb/ddb10f62a8ef9260fef9242d792c0111.jpg',NULL),(261,234,516,527,5,'ЗначенияСвойства',NULL,NULL),(262,261,517,518,6,'Ид','9',NULL),(263,261,519,520,6,'Значение','программист ',NULL),(264,261,521,526,6,'ЗначениеСвойства',NULL,NULL),(265,264,522,523,7,'Значение','программист ',NULL),(266,264,524,525,7,'Описание',NULL,NULL),(267,234,528,539,5,'ЗначенияСвойства',NULL,NULL),(268,267,529,530,6,'Ид','10',NULL),(269,267,531,532,6,'Значение','.NET-девелопмент',NULL),(270,267,533,538,6,'ЗначениеСвойства',NULL,NULL),(271,270,534,535,7,'Значение','.NET-девелопмент',NULL),(272,270,536,537,7,'Описание',NULL,NULL),(273,0,33,0,0,'',NULL,NULL),(274,0,34,0,0,'',NULL,NULL),(275,0,35,0,0,'',NULL,NULL);
/*!40000 ALTER TABLE `b_xml_tree` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-14 10:09:56
