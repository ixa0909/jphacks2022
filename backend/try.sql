-- MySQL dump 10.13  Distrib 8.0.30, for macos12.6 (arm64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `come_history`
--

DROP TABLE IF EXISTS `come_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `come_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `store_id` bigint NOT NULL,
  `come_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `come_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `come_history_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `come_history`
--

LOCK TABLES `come_history` WRITE;
/*!40000 ALTER TABLE `come_history` DISABLE KEYS */;
INSERT INTO `come_history` VALUES (2,1,1,'2022-10-19 20:49:39'),(3,1,1,'2022-10-19 20:49:59'),(4,1,1,'2022-10-19 20:51:29'),(5,1,1,'2022-10-20 04:09:24'),(6,3,1,'2022-10-20 21:34:51'),(7,3,1,'2022-10-20 21:36:11'),(8,7,1,'2022-10-20 21:43:08'),(9,7,1,'2022-10-20 21:44:04'),(10,7,1,'2022-10-20 21:44:38');
/*!40000 ALTER TABLE `come_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menues`
--

DROP TABLE IF EXISTS `menues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menues` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `recommend` tinyint(1) NOT NULL DEFAULT '0',
  `store_id` bigint NOT NULL,
  `price` int NOT NULL DEFAULT '0',
  `image_url` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id_index` (`store_id`),
  CONSTRAINT `menues_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menues`
--

LOCK TABLES `menues` WRITE;
/*!40000 ALTER TABLE `menues` DISABLE KEYS */;
INSERT INTO `menues` VALUES (1,'【作りたて】大切り　極み熟成　まぐろ',1,1,165,'https://www.kurasushi.co.jp/menu/upload/6821feec7cc136706ba7a7e233cf88e03c5de3ed.jpg'),(2,'【作りたて】サーモンアボカド',1,1,165,'https://www.kurasushi.co.jp/menu/upload/d65a0c136791c9b3d6651ae04ba90daf750360cb.jpg'),(3,'【作りたて】えびアボカド',0,1,165,'https://www.kurasushi.co.jp/menu/upload/45731bae3907e8b258fbb0604a499c09f99b02d9.jpg'),(4,'【作りたて】大切り　極み熟成　漬けまぐろ',0,1,165,'https://www.kurasushi.co.jp/menu/upload/02f6ed02ad7dd4eee36f7baa8c16b4da29bd2d97.jpg'),(5,'【作りたて】大切り　はまち',0,1,165,'https://www.kurasushi.co.jp/menu/upload/20c08868c077428554162f2658dd3b85482612b6.jpg'),(6,'【炙りたて】Wチーズ豚カルビ',0,1,165,'https://www.kurasushi.co.jp/menu/upload/1abd26563e44d3b3f4b5053dd307d6e625dc06e0.jpg'),(7,'【炙りたて】Wチーズえび',0,1,165,'https://www.kurasushi.co.jp/menu/upload/c3fd0773d51b8effdd4cb34d9a6c8fc0aee1aa43.jpg'),(8,'【炙りたて】Wチーズサーモン',0,1,165,'https://www.kurasushi.co.jp/menu/upload/0d1bd3722a83f7092d11586915a60aaf093c0d51.jpg'),(9,'【炙りたて】Wチーズえびマヨ',0,1,165,'https://www.kurasushi.co.jp/menu/upload/8e2889ee662fa45c6dbf0028baefb3df62e8989f.jpg'),(10,'【揚げたて】いか天にぎり',0,1,165,'https://www.kurasushi.co.jp/menu/upload/06ffc49115f2cd76b90059b338ebbcb396003b4d.jpg'),(11,'あぶりえびチーズ',0,1,115,'https://www.kurasushi.co.jp/menu/upload/000f7dfdc37e9be7214b180d0c267cc7953145ad.jpg'),(12,'あぶりチーズサーモン',0,1,115,'https://www.kurasushi.co.jp/menu/upload/7e8442d9f4f3c733dba501685b9557c95ae3222a.jpg'),(13,'あぶりチーズ豚カルビ',0,1,115,'https://www.kurasushi.co.jp/menu/upload/033866871c0e0bc0999eeb7701a3bb6e914b629a.jpg'),(14,'あぶりえびマヨグラタン風',0,1,115,'https://www.kurasushi.co.jp/menu/upload/270ee8fdd5863e9f6bd1e180259e8ac309cc14e2.jpg'),(15,'極み熟成　まぐろ',0,1,115,'https://www.kurasushi.co.jp/menu/upload/be5c491c0634c68f619f6c2d92c92ad3fdaa4f8d.jpg'),(16,'極み熟成 漬けまぐろ',0,1,115,'https://www.kurasushi.co.jp/menu/upload/06b69383d445689f7f0734cd4cdaac878f6bf9bc.jpg'),(17,'極み熟成　漬けはまち',0,1,115,'https://www.kurasushi.co.jp/menu/upload/eaf3df4752c12665e2aa77a2802515ee7b5ab50a.jpg'),(18,'極み漬けびんちょう',0,1,115,'https://www.kurasushi.co.jp/menu/upload/7fd4f6c8f1a4d599881477f4338684bf543f58f7.jpg'),(19,'ゆず塩かつおたたき',0,1,115,'https://www.kurasushi.co.jp/menu/upload/0ae2708b1e9f57891f28874d3c38f2473a9e0113.jpg'),(20,'ねぎ塩貝柱にぎり',0,1,115,'https://www.kurasushi.co.jp/menu/upload/3e890f66ad51a0633ab45e9e5051d891e4c0ed75.jpg'),(21,'ほたるいか沖漬け',0,1,115,'https://www.kurasushi.co.jp/menu/upload/552188b06b8f159b0e4ccba1b7a21b46a256030e.jpg'),(22,'はまち',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/2a4456d90cf117ebfcdc70fc7ba0853dc6184cd2.jpg'),(23,'サーモン',0,1,115,'https://www.kurasushi.co.jp/menu/upload/013ee641353b8a345f32add85d0b9a9acbc3401f.jpg'),(24,'とろサーモン',0,1,115,'https://www.kurasushi.co.jp/menu/upload/298c2e5fdeb5a079bad58fa33572db0fbb17745a.jpg'),(25,'焼きはらす',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/13ea6ad618c999c10673445f331d6bbb29424ffd.jpg'),(26,'えび',0,1,115,'https://www.kurasushi.co.jp/menu/upload/5ed95df428dfd467cde4f210e133c197c0284665.jpg'),(27,'生えび',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/b551952b3e4656b52b66f6e6a4bef47795947938.jpg'),(28,'甘えび',0,1,115,'https://www.kurasushi.co.jp/menu/upload/b37bf2a71a782fdd57d5c3e1e6d86aad8d0cbf39.jpg'),(29,'肉厚とろ〆さば',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/2a42f5f95e2003dd9352b754f0753ba7b59e9a56.jpg'),(30,'真いわし',0,1,115,'https://www.kurasushi.co.jp/menu/upload/7c9bafd9a602faa8bd2478e6971e9effffa9ba42.jpg'),(31,'大葉真いか',0,1,115,'https://www.kurasushi.co.jp/menu/upload/ab86e2a29d0248ed7803cd897d248a0576eb3090.jpg'),(32,'やりいか',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/8d7748f8ef2e98f791e514bf8f17a9e4b3fff0bc.jpg'),(33,'あなご',0,1,115,'https://www.kurasushi.co.jp/menu/upload/260ab98708f2d299fcacd3c6300671c05cd00129.jpg'),(34,'つぶ貝',0,1,115,'https://www.kurasushi.co.jp/menu/upload/5d09ab46b64be881d1bd4425566addcd12b47651.jpg'),(35,'赤貝',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/019d920896f4adce50a0e7a0b3cb4198d793df77.jpg'),(36,'かれい昆布締め　えんがわ添え',0,1,115,'https://www.kurasushi.co.jp/menu/upload/c9777973ec638e03f3c5b9d45493edbc30109f25.jpg'),(37,'たまご焼き',0,1,115,'https://www.kurasushi.co.jp/menu/upload/a4e15fc82d6e90ef81fb37c7a468dc22389bb9a0.jpg'),(38,'旨だれ牛カルビ',0,1,115,'https://www.kurasushi.co.jp/menu/upload/890dfb6d0987ceb3d22c70e5260b9b5b0747d578.jpg'),(39,'ハンバーグ',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/72db4fd916ea1bf4fb7de1d349f1287edc9127b2.jpg'),(40,'あわびにぎり',0,1,250,'https://www.kurasushi.co.jp/menu/upload/b3b4146b700009973b90dabc26a391e8eeecb904.jpg'),(41,'国産　絶品真ハタ　塩レモン',0,1,250,'https://www.kurasushi.co.jp/menu/upload/f4ca66d769e8422922f26af347373aa93cbed985.jpg'),(42,'大切り　あぶりとろサーモン　ガーリックチーズ',0,1,165,'https://www.kurasushi.co.jp/menu/upload/30e693e7c63469515fcfc515ddb9fa565692c514.jpg'),(43,'Wチーズベーコン',0,1,165,'https://www.kurasushi.co.jp/menu/upload/56f436d260d90b1602842e493f09d94681634df4.jpg'),(44,'あぶり　天然　ぶり照りマヨ',0,1,165,'https://www.kurasushi.co.jp/menu/upload/7a19f8c1a4d1e775c20b0e8b7129794cf8d4f6a9.jpg'),(45,'えび　すだちクリーム',0,1,165,'https://www.kurasushi.co.jp/menu/upload/a0303542e0b92ebc027a329eca1fed18d5e42d08.jpg'),(46,'サーモン　すだちクリーム',0,1,165,'https://www.kurasushi.co.jp/menu/upload/ca7fcb9547fb55b8b46ef59ce016de5d26c8a8c6.jpg'),(47,'ローストビーフ　たっぷり野菜　',0,1,165,'https://www.kurasushi.co.jp/menu/upload/e02d65d2d8aeebf4e832b86b6dca1eb8adaf3619.jpg'),(48,'真いか　たっぷり野菜',0,1,165,'https://www.kurasushi.co.jp/menu/upload/931c43bffb1ab0f1e06ae042f0d4823b8e5ac077.jpg'),(49,'ビントロ',0,1,165,'https://www.kurasushi.co.jp/menu/upload/e93cad164f8a936e1196d963394fb0386417ff68.jpg'),(50,'オニオンサーモン',0,1,165,'https://www.kurasushi.co.jp/menu/upload/7de2915e6c4503239aed7237bc2ef667010cc39f.jpg'),(51,'真たこ',0,1,165,'https://www.kurasushi.co.jp/menu/upload/95083a1a44f89948c9c601c674fc437bc3b175ee.jpg'),(52,'生たこ',0,1,165,'https://www.kurasushi.co.jp/menu/upload/7d7970fde6d7ec2389ed6e5f08ff84a14e07be14.jpg'),(53,'大葉生たこ',0,1,165,'https://www.kurasushi.co.jp/menu/upload/72311555a650033d31ed41bb5b98a5fa5279aa1e.jpg'),(54,'えんがわ（かれい）',0,1,165,'https://www.kurasushi.co.jp/menu/images_menu/affd1a68b7b7cb937652de6e4ffaa220314b6e26.jpg'),(55,'えび天にぎり',0,1,165,'https://www.kurasushi.co.jp/menu/upload/070a4a42eb045e2e06b8ae574ddcc67d60aaa67c.jpg'),(56,'極み熟成　真鯛',0,1,250,'https://www.kurasushi.co.jp/menu/upload/17fe127f857c618953b7ba11279056fa979ce128.jpg'),(57,'極み熟成ふぐ　ジュレポン酢',0,1,250,'https://www.kurasushi.co.jp/menu/upload/cc86ee8b822062fc8d8a9d215e02d650d7cb02ef.jpg'),(58,'ほたてにぎり',0,1,250,'https://www.kurasushi.co.jp/menu/upload/49115c2327c720b614244a868d472a7e6c6dd8ee.jpg'),(59,'赤えび（一貫）',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/016be384920e9ddb33476d330a6d40d7194a533a.jpg'),(60,'大切り漬けサーモン（一貫）',0,1,115,'https://www.kurasushi.co.jp/menu/upload/98aa00b6c6845b08faa8efa74c57c6c663165c61.jpg'),(61,'とろける上穴子天にぎり（一貫）',0,1,165,'https://www.kurasushi.co.jp/menu/upload/fd782626cd4955e20d6d3eaa6e0965a6440206fb.jpg'),(62,'絆　真鯛　塩〆炙り（一貫）',0,1,165,'https://www.kurasushi.co.jp/menu/upload/a9d46c7234847af556c29f7f36dbf825f7d29429.jpg'),(63,'大切り　生サーモン（一貫）',0,1,165,'https://www.kurasushi.co.jp/menu/upload/b37e5c62fe036ef3db55434c5218d3c8eb87e27a.jpg'),(64,'大切り　漬け生サーモン（一貫）',0,1,165,'https://www.kurasushi.co.jp/menu/upload/780b606cebd0cdfd3db10cc3c3236c0f37ec0742.jpg'),(65,'明太だし巻きにぎり',0,1,165,'https://www.kurasushi.co.jp/menu/upload/30d2aca53db4309e7a6dac44cfef84e4085b6b12.jpg'),(66,'とろける上穴子（一貫）',0,1,165,'https://www.kurasushi.co.jp/menu/upload/a3c5a0495d03d1c321b2ce8b0d8bc524c89a83c2.jpg'),(67,'極み熟成 中とろ（一貫）',0,1,250,'https://www.kurasushi.co.jp/menu/upload/ba507ce18edac6a7079b0f99c9431f7324fe25e8.jpg'),(68,'極み熟成　あぶり中とろ（一貫）',0,1,250,'https://www.kurasushi.co.jp/menu/upload/2808535bc9c2041db96deee7c6d56907c110f783.jpg'),(69,'特大切り　うな丼にぎり(一貫)',0,1,345,'https://www.kurasushi.co.jp/menu/upload/0243d9e4d44f87da1d7475403a376b010933846b.jpg'),(70,'あぶり大とろ一貫',0,1,345,'https://www.kurasushi.co.jp/menu/upload/b881a55fb50a295e8617270e4b13015339f8c67e.jpg'),(71,'【巻きたて】海鮮うに手巻き（一貫）',0,1,165,'https://www.kurasushi.co.jp/menu/upload/f1292ae4f47f6afe607a975c340d42e85799bc89.jpg'),(72,'【巻きたて】ねぎまぐろ手巻き（一貫）',0,1,165,'https://www.kurasushi.co.jp/menu/upload/ffa33c8628ca481088f155990eea45c933590cc8.jpg'),(73,'【巻きたて】たっぷりいくら軍艦',0,1,165,'https://www.kurasushi.co.jp/menu/upload/bb09d5e2ae678f52e7053d829e485c5985face94.jpg'),(74,'【巻きたて】ゆず漬けまぐろ手巻き（一貫）',0,1,165,'https://www.kurasushi.co.jp/menu/upload/ba604c3dcc2757682925c92b507ad80545e24e11.jpg'),(75,'【巻きたて】海鮮盛り手巻き（一貫）',0,1,165,'https://www.kurasushi.co.jp/menu/upload/97e4f0255c4dde6b42f9cf42b1400adca37eff5c.jpg'),(76,'明太まぐろ手巻き（一貫）',0,1,165,'https://www.kurasushi.co.jp/menu/upload/564c0cebf3cc676f619759b1be7eb2bab77c15b9.jpg'),(77,'【巻きたて】えび天手巻き（一貫）',0,1,165,'https://www.kurasushi.co.jp/menu/upload/9fbed44ce28d568d979f650815affa16904895da.jpg'),(78,'【巻きたて】えびいか天手巻き（一貫）',0,1,165,'https://www.kurasushi.co.jp/menu/upload/df990d8c52f07b06abdc53ddd011bb57f41ed058.jpg'),(79,'いかおくら',0,1,115,'https://www.kurasushi.co.jp/menu/upload/1169f4a827fddb425520a65592a67453b38cbad2.jpg'),(80,'大盛　げそ軍艦',0,1,115,'https://www.kurasushi.co.jp/menu/upload/22febdfc21ec4dcc1bb5398ce7c21741a8f14d9c.jpg'),(81,'とろけるはまち軍艦',0,1,115,'https://www.kurasushi.co.jp/menu/upload/ae250dccfa6bcc586854a6b4cf5337037ad4aac2.jpg'),(82,'かにみそ',0,1,115,'https://www.kurasushi.co.jp/menu/upload/6b8f82de8ee5dbce08495c883ecc4b9efe6ada10.jpg'),(83,'たらマヨ軍艦',0,1,115,'https://www.kurasushi.co.jp/menu/upload/0d7b0d067a6a7a51626dcaf42600a78d87976c3d.jpg'),(84,'牛すき焼き風軍艦',0,1,115,'https://www.kurasushi.co.jp/menu/upload/8aa06a7d7d88f65cc9f4a75584d09d3d1af5e60a.jpg'),(85,'ねぎまぐろ',0,1,115,'https://www.kurasushi.co.jp/menu/upload/b3404c9d9abbfa254b856921c025527fc94e5b33.jpg'),(86,'コーン',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/2150d0c02801e7edf8a2a18adf8c939535d90291.jpg'),(87,'まぐろユッケ',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/3da1965851dc096cc082c77dcb819a4501a9adcd.jpg'),(88,'納豆',0,1,115,'https://www.kurasushi.co.jp/menu/upload/265fe1d0f43cb2c122e34f1f285b0a68fd5e0a15.jpg'),(89,'えびマヨ',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/6c2aeab8229d2b18bea4368c7aae0c3908bbc54c.jpg'),(90,'サラダ',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/ae67b1e46c4fb028025bc04b28315e6f2e4dec3e.jpg'),(91,'ツナサラダ',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/77cbb3efc447e10ada50fb7cab2fad1843f93e1c.jpg'),(92,'シーフードサラダ',0,1,115,'https://www.kurasushi.co.jp/menu/upload/11c6415c154edb6d34916c1bf3e15cbe1cec345a.jpg'),(93,'味玉',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/07cbb9cd717a75912503a73837c33121b8dac667.jpg'),(94,'納豆巻',0,1,115,'https://www.kurasushi.co.jp/menu/upload/35a8de88b474c2ff98ad180a925c127424412f43.jpg'),(95,'きゅうり巻',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/88235b45b74169fb87103aad45a526ab20c5cc44.jpg'),(96,'かんぴょう巻',0,1,115,'https://www.kurasushi.co.jp/menu/upload/03f7f34199bd8d495bffa8eb9680d544dc5f6650.jpg'),(97,'いなり',0,1,115,'https://www.kurasushi.co.jp/menu/upload/6e320d6abbcc08308c799d2f78efde84a26d37f7.jpg'),(98,'たら白子ジュレポン酢軍艦',0,1,165,'https://www.kurasushi.co.jp/menu/upload/ac6e3ee39594442c9ad12e3146edfe3ee993fdb3.jpg'),(99,'いかフライ手巻き（一貫）',0,1,165,'https://www.kurasushi.co.jp/menu/upload/f4ff27fdbada08184855c011353b83de512afa02.jpg'),(100,'鉄火巻',0,1,165,'https://www.kurasushi.co.jp/menu/images_menu/3c697dcdab9863d4620d8f06ae2e2c85fe48f95c.jpg'),(101,'特盛　まぐろ軍艦',0,1,250,'https://www.kurasushi.co.jp/menu/upload/f37772066d101650a2f6a6ef449915743db9389b.jpg'),(102,'ビッくらポン！人気にぎりセット',0,1,680,'https://www.kurasushi.co.jp/menu/upload/0d5f5a997c959d9e22a39fb0f1a5bdb2e12d8f28.jpg'),(103,'ビッくらポン！人気軍艦セット',0,1,680,'https://www.kurasushi.co.jp/menu/upload/474cbbcf80324f0a7705dd4180f3ae9d4c7107cd.jpg'),(104,'旬の海鮮丼　平日限定17時まで',0,1,500,'https://www.kurasushi.co.jp/menu/upload/798d5eda5f6d4edc20abfe9e592d4220dcfe2027.jpg'),(105,'えび天と季節の天丼　平日限定17時まで',0,1,500,'https://www.kurasushi.co.jp/menu/upload/4c26bcf7556490cbb70d46892b30e81475d33621.jpg'),(106,'特上うな丼　平日限定17時まで',0,1,1000,'https://www.kurasushi.co.jp/menu/upload/9a6962db5188bdc12a6b6f27abf48877bd120796.jpg'),(107,'イベリコ豚うどん',0,1,450,'https://www.kurasushi.co.jp/menu/upload/d28418232c9778001bd6334aaf6e9865d0f9da5d.jpg'),(108,'北海道名産　濃厚味噌バターコーンらーめん',0,1,450,'https://www.kurasushi.co.jp/menu/upload/7f6600646a6ced75ac1818a53612c5e0d475544b.jpg'),(109,'北海道名産　濃厚味噌バターコーンらーめん',0,1,450,'https://www.kurasushi.co.jp/menu/upload/4fb229818a227e4d160a824d60049e92bef44a09.jpg'),(110,'7種の魚介 追いかつお醤油らーめん（関西）',0,1,450,'https://www.kurasushi.co.jp/menu/images_menu/0c9d01528c8b5f6bf63d20dc194b24c1226aafa0.jpg'),(111,'7種の魚介 追いかつお醤油らーめん（関東）',0,1,450,'https://www.kurasushi.co.jp/menu/images_menu/b96ced3d390762650d1d9d402026ca5ef8eee374.jpg'),(112,'7種の魚介 濃厚味噌らーめん（関西）',0,1,450,'https://www.kurasushi.co.jp/menu/images_menu/1a1fe32ac871cf4380139b2257c4f8ea420309e4.jpg'),(113,'7種の魚介 濃厚味噌らーめん（関東）',0,1,450,'https://www.kurasushi.co.jp/menu/images_menu/6396fd2c353f9ac83889cba0aa98107059a886e0.jpg'),(114,'胡麻香る担々麺',0,1,450,'https://www.kurasushi.co.jp/menu/images_menu/8d4662c500a7e95931c2624663074f04e7033ff7.jpg'),(115,'かけうどん（平日限定）',0,1,165,'https://www.kurasushi.co.jp/menu/upload/a198e88d5da75ecc4cfb625115fbff42ecc61716.jpg'),(116,'きつねうどん',0,1,360,'https://www.kurasushi.co.jp/menu/images_menu/c89857f84ad13fe07ab5366fc3559ebe3338f61c.jpg'),(117,'えび天うどん',0,1,360,'https://www.kurasushi.co.jp/menu/images_menu/db0bc1aff9f3ff491d6339c2e67893689380dc2b.jpg'),(118,'あさり入り 味噌汁',0,1,230,'https://www.kurasushi.co.jp/menu/images_menu/b6a2e31fdb98e33555bd241757dafcc09f46582b.jpg'),(119,'あさり入り 赤だし',0,1,230,'https://www.kurasushi.co.jp/menu/images_menu/5d743579b6302b31eede92cb4d61c5cf0f5390fd.jpg'),(120,'あおさ入り 味噌汁',0,1,200,'https://www.kurasushi.co.jp/menu/images_menu/445844d7a5b8cfce7fd17c52ee42be470a983b83.jpg'),(121,'あおさ入り 赤だし',0,1,200,'https://www.kurasushi.co.jp/menu/images_menu/73d42161a5b74ae97a3fb82948cdbba1d058f3e6.jpg'),(122,'特製茶碗蒸し',0,1,200,'https://www.kurasushi.co.jp/menu/images_menu/85df2cc4b6d91ab9eebd7736206baa0ee99fcdcf.jpg'),(123,'くら出汁',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/a7401bd39dbb9878db423accc29782d4a5ab92cb.jpg'),(124,'えびブロッコリーサラダ',0,1,165,'https://www.kurasushi.co.jp/menu/images_menu/b419592eec93debdfc2dd88ac81f50ba5701847a.jpg'),(125,'くらポテト',0,1,190,'https://www.kurasushi.co.jp/menu/upload/67e2f12f7f2511e0d21694df5119fcf37dbbbdc9.jpg'),(126,'伝説の鶏唐揚げ',0,1,360,'https://www.kurasushi.co.jp/menu/upload/31d8decdfe6c828ac9094c3482b57e8d9482a0f7.jpg'),(127,'オニオンリング',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/ac654141a5bbfa2206c8e7268eec7b59e8842296.jpg'),(128,'とうもろこしのかき揚げ',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/09a11614f7400286684b6a2413e6324228d9a8dc.jpg'),(129,'ミニころチキン',0,1,115,'https://www.kurasushi.co.jp/menu/upload/588a14758f2baccb82e606eb98e90236b63d5530.jpg'),(130,'オリオンドラフト＜生ビール＞',0,1,500,'https://www.kurasushi.co.jp/menu/images_menu/3d5468b80578d1f1b466463650fa64be14c65089.jpg'),(131,'生ビール',0,1,550,'https://www.kurasushi.co.jp/menu/upload/ce5e6ba3d9d3f7e93842cd54a78025d368e238c3.jpg'),(132,'瓶ビール',0,1,610,'https://www.kurasushi.co.jp/menu/upload/b43177a46877f8acc470e3cc0992d1dace3ed7b7.jpg'),(133,'ドライゼロα（ノンアルコールビ ール）',0,1,390,'https://www.kurasushi.co.jp/menu/images_menu/007_003.jpg'),(134,'冷酒無添蔵',0,1,610,'https://www.kurasushi.co.jp/menu/images_menu/1b081c5c259c885bbd64f1b7268bfabe93fa149f.jpg'),(135,'ハイボール',0,1,420,'https://www.kurasushi.co.jp/menu/images_menu/0eba16d672dc03496c4f55532001201db14b0af7.jpg'),(136,'ペールエール（クラフトビール）',0,1,660,'https://www.kurasushi.co.jp/menu/upload/d8e6a5fb7412585b6e04430165b1eda2ff56e5fa.jpg'),(137,'BT21　　和菓子　KOYA（コヤ）　こし餡',0,1,300,'https://www.kurasushi.co.jp/menu/upload/47f0ebaa5414fbeb8901068e0b52fef2ba86c239.jpg'),(138,'BT21　　和菓子　RJ（アールジェイ)　こし餡',0,1,300,'https://www.kurasushi.co.jp/menu/upload/d211dcec1768b410828de25603aec7014f2ecc60.jpg'),(139,'BT21　　和菓子　SHOOKY（シュッキー）　チョコレート餡',0,1,300,'https://www.kurasushi.co.jp/menu/upload/f386546dade7b73d95b2468d2b40222807467734.jpg'),(140,'BT21　和菓子　MANG（マン）　チョコレート餡',0,1,300,'https://www.kurasushi.co.jp/menu/upload/16cef9cd5f6ea1c5f5c7c445e9a93a89d1a52953.jpg'),(141,'BT21　　和菓子　CHIMMY（チミー）　チョコレート餡',0,1,300,'https://www.kurasushi.co.jp/menu/upload/dc83adcad17c186c6979155dd403bbb18abac40a.jpg'),(142,'BT21　　和菓子　TATA（タタ）　いちご餡',0,1,300,'https://www.kurasushi.co.jp/menu/upload/71145d641726a01d6567646b6c4b2ef8910f3656.jpg'),(143,'BT21　　和菓子COOKY（クッキー）　いちご餡',0,1,300,'https://www.kurasushi.co.jp/menu/upload/32381ad5f17ae298285ca7db081946e65d666ed9.jpg'),(144,'キャラメルモンブランパフェ',0,1,640,'https://www.kurasushi.co.jp/menu/upload/a0ec9db1db9e16f39b1e56ea892c54cede585061.jpg'),(145,'揚げたい焼き',0,1,115,'https://www.kurasushi.co.jp/menu/upload/b2091f409cfe97e1dccd6a874c09a1d63bd49e10.jpg'),(146,'イタリアンティラミス',0,1,250,'https://www.kurasushi.co.jp/menu/upload/df2e83d25372bbad728dd7311a5e6ecb2ce5f20f.jpg'),(147,'ヴィクトリアケーキ',0,1,250,'https://www.kurasushi.co.jp/menu/upload/3f09787bd6f1a3297293b55ba417090eac42a335.jpg'),(148,'いちごのホワイトアイスケーキ',0,1,250,'https://www.kurasushi.co.jp/menu/upload/501c19d6dbf61030e47f9b16767ee0ed442ac913.jpg'),(149,'揚げたて豆乳ドーナツ',0,1,360,'https://www.kurasushi.co.jp/menu/upload/3cbc163b9efcd64f4ef90ce4d9ed4471467773d2.jpg'),(150,'塩豆大福',0,1,115,'https://www.kurasushi.co.jp/menu/upload/34a6f2c68dbfda77aa001fdb321313fa59a7fa98.jpg'),(151,'カットパイン',0,1,115,'https://www.kurasushi.co.jp/menu/upload/59459f2e05f7f53228ba251a716edd09a200b87e.jpg'),(152,'北海道みるくのプリンタルト',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/f196218b16a2c0c764f8bec99acc02beff56602d.jpg'),(153,'北海道みるくシューアイス',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/ad0ba7cf06de2dffd5492fceb039dfbee2e8b9e8.jpg'),(154,'チョコケーキ',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/e4dd79fd4f8eac0481a71f0a19c26dfe22785052.jpg'),(155,'チーズケーキ',0,1,115,'https://www.kurasushi.co.jp/menu/images_menu/12c934aad277693a8bdb322b75d165634bd44725.jpg'),(156,'ミルクレープ',0,1,250,'https://www.kurasushi.co.jp/menu/images_menu/f9714588451ad563d5204ff9e8eef3373528748d.jpg'),(157,'大学芋スティック',0,1,115,'https://www.kurasushi.co.jp/menu/upload/c92b28425c5d624cd143076f4fce3d40569e2082.jpg'),(158,'京わらびもち',0,1,115,'https://www.kurasushi.co.jp/menu/upload/c63f047971debb810094287f58bc5fa7306aa611.jpg'),(159,'バニラアイス',0,1,115,'https://www.kurasushi.co.jp/menu/upload/4ecb8f7afa2f3bd038dcee3822ef98b77cb51446.jpg'),(160,'チョコアイス',0,1,115,'https://www.kurasushi.co.jp/menu/upload/682e90438f8d83f140066dcc6492b89f52fad862.jpg'),(161,'豆乳アイス',0,1,115,'https://www.kurasushi.co.jp/menu/upload/cf43d7c1f677cdbae4188c35861d7c029606c35e.jpg'),(162,'巨峰シャーベット',0,1,115,'https://www.kurasushi.co.jp/menu/upload/0361a97125c993a3a217b159059f9d332df17046.jpg'),(163,'完熟マンゴー',0,1,360,'https://www.kurasushi.co.jp/menu/upload/c16096c24634606d2fd63e6fccc83b9ead649557.jpg'),(164,'乳酸菌ウォーター',0,1,115,'https://www.kurasushi.co.jp/menu/upload/deebc42626ec89f9b54b2a2fc57738b5d7d49682.jpg'),(165,'オレンジ・みかんジュース',0,1,200,'https://www.kurasushi.co.jp/menu/upload/2dc19129cabddbf9c6205fb82f591ee44944080b.jpg'),(166,'りんごジュース',0,1,200,'https://www.kurasushi.co.jp/menu/upload/189055183a309d456a64a12db604d9ae715e94f3.jpg'),(167,'宇治抹茶入り緑茶',0,1,115,'https://www.kurasushi.co.jp/menu/upload/f4ea4e64163f9603c7241005e596b786708529f7.jpg'),(168,'プレミアホット珈琲',0,1,150,'https://www.kurasushi.co.jp/menu/images_menu/e96a78116808e0761be7a3e02d52d48999e0a535.jpg'),(169,'プレミアアイス珈琲',0,1,150,'https://www.kurasushi.co.jp/menu/upload/66abf74b5c0fd2d52b4cdc1df81954165ab88743.jpg'),(170,'プレミアホットラテ',0,1,180,'https://www.kurasushi.co.jp/menu/images_menu/e51c3882a9c9a2dec839d39624023cd247258c1d.jpg'),(171,'プレミアアイスラテ',0,1,180,'https://www.kurasushi.co.jp/menu/upload/b0211648cad290b95ffda9c6d3afae75767639b6.jpg');
/*!40000 ALTER TABLE `menues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_history`
--

DROP TABLE IF EXISTS `order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL,
  `store_id` bigint NOT NULL,
  `order_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `menu_id` (`menu_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `order_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `order_history_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menues` (`id`),
  CONSTRAINT `order_history_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_history`
--

LOCK TABLES `order_history` WRITE;
/*!40000 ALTER TABLE `order_history` DISABLE KEYS */;
INSERT INTO `order_history` VALUES (1,1,1,1,'2022-10-20 21:50:06'),(2,1,2,1,'2022-10-20 21:50:06'),(3,1,3,1,'2022-10-20 21:50:06'),(4,1,4,1,'2022-10-20 21:50:06'),(5,1,5,1,'2022-10-20 21:50:06'),(6,1,6,1,'2022-10-20 21:50:06'),(7,1,7,1,'2022-10-20 21:50:06'),(8,1,8,1,'2022-10-20 21:50:06'),(9,1,9,1,'2022-10-20 21:50:06'),(10,1,10,1,'2022-10-20 21:50:06'),(11,1,11,1,'2022-10-20 21:50:06'),(12,1,12,1,'2022-10-20 21:50:06'),(13,1,13,1,'2022-10-20 21:50:06'),(14,1,14,1,'2022-10-20 21:50:06'),(15,1,15,1,'2022-10-20 21:50:06'),(16,1,16,1,'2022-10-20 21:50:06'),(17,1,17,1,'2022-10-20 21:50:06'),(18,1,18,1,'2022-10-20 21:50:06'),(19,1,19,1,'2022-10-20 21:50:06'),(20,1,20,1,'2022-10-20 21:50:06'),(21,1,21,1,'2022-10-20 21:50:06'),(22,1,22,1,'2022-10-20 21:50:06'),(23,1,23,1,'2022-10-20 21:50:06'),(24,1,24,1,'2022-10-20 21:50:06'),(25,1,25,1,'2022-10-20 21:50:06'),(26,1,26,1,'2022-10-20 21:50:06'),(27,1,27,1,'2022-10-20 21:50:06'),(28,1,28,1,'2022-10-20 21:50:06'),(29,1,29,1,'2022-10-20 21:50:06'),(30,1,30,1,'2022-10-20 21:50:06'),(31,1,31,1,'2022-10-20 21:50:06'),(32,1,32,1,'2022-10-20 21:50:06'),(33,1,33,1,'2022-10-20 21:50:06'),(34,1,34,1,'2022-10-20 21:50:06'),(35,1,35,1,'2022-10-20 21:50:06'),(36,1,36,1,'2022-10-20 21:50:06'),(37,1,37,1,'2022-10-20 21:50:06'),(38,1,38,1,'2022-10-20 21:50:06'),(39,1,39,1,'2022-10-20 21:50:06'),(40,1,40,1,'2022-10-20 21:50:06'),(41,1,41,1,'2022-10-20 21:50:06'),(42,1,42,1,'2022-10-20 21:50:06'),(43,1,43,1,'2022-10-20 21:50:06'),(44,1,44,1,'2022-10-20 21:50:06'),(45,1,45,1,'2022-10-20 21:50:06'),(46,1,46,1,'2022-10-20 21:50:06'),(47,1,47,1,'2022-10-20 21:50:06'),(48,1,48,1,'2022-10-20 21:50:06'),(49,1,49,1,'2022-10-20 21:50:06'),(50,1,1,1,'2022-10-20 21:51:38'),(51,1,2,1,'2022-10-20 21:51:38'),(52,1,3,1,'2022-10-20 21:51:38'),(53,1,4,1,'2022-10-20 21:51:38'),(54,1,5,1,'2022-10-20 21:51:38'),(55,1,6,1,'2022-10-20 21:51:38'),(56,1,7,1,'2022-10-20 21:51:38'),(57,1,8,1,'2022-10-20 21:51:38'),(58,1,9,1,'2022-10-20 21:51:38'),(59,1,10,1,'2022-10-20 21:51:38'),(60,1,11,1,'2022-10-20 21:51:38'),(61,1,12,1,'2022-10-20 21:51:38'),(62,1,13,1,'2022-10-20 21:51:38'),(63,1,14,1,'2022-10-20 21:51:38'),(64,1,15,1,'2022-10-20 21:51:38'),(65,1,16,1,'2022-10-20 21:51:38'),(66,1,17,1,'2022-10-20 21:51:38'),(67,1,18,1,'2022-10-20 21:51:38'),(68,1,19,1,'2022-10-20 21:51:38'),(69,1,20,1,'2022-10-20 21:51:38'),(70,1,21,1,'2022-10-20 21:51:38'),(71,1,22,1,'2022-10-20 21:51:38'),(72,1,23,1,'2022-10-20 21:51:38'),(73,1,24,1,'2022-10-20 21:51:38'),(74,1,25,1,'2022-10-20 21:51:38'),(75,1,26,1,'2022-10-20 21:51:38'),(76,1,27,1,'2022-10-20 21:51:38'),(77,1,28,1,'2022-10-20 21:51:38'),(78,1,29,1,'2022-10-20 21:51:38'),(79,1,30,1,'2022-10-20 21:51:38'),(80,1,31,1,'2022-10-20 21:51:38'),(81,1,32,1,'2022-10-20 21:51:38'),(82,1,33,1,'2022-10-20 21:51:38'),(83,1,34,1,'2022-10-20 21:51:38'),(84,1,35,1,'2022-10-20 21:51:38'),(85,1,36,1,'2022-10-20 21:51:38'),(86,1,37,1,'2022-10-20 21:51:38'),(87,1,38,1,'2022-10-20 21:51:38'),(88,1,39,1,'2022-10-20 21:51:38'),(89,1,40,1,'2022-10-20 21:51:38'),(90,1,41,1,'2022-10-20 21:51:38'),(91,1,42,1,'2022-10-20 21:51:38'),(92,1,43,1,'2022-10-20 21:51:38'),(93,1,44,1,'2022-10-20 21:51:38'),(94,1,45,1,'2022-10-20 21:51:38'),(95,1,46,1,'2022-10-20 21:51:38'),(96,1,47,1,'2022-10-20 21:51:38'),(97,1,48,1,'2022-10-20 21:51:38'),(98,1,49,1,'2022-10-20 21:51:38'),(99,1,1,1,'2022-10-20 21:51:41'),(100,1,2,1,'2022-10-20 21:51:41'),(101,1,3,1,'2022-10-20 21:51:41'),(102,1,4,1,'2022-10-20 21:51:41'),(103,1,5,1,'2022-10-20 21:51:41'),(104,1,6,1,'2022-10-20 21:51:41'),(105,1,7,1,'2022-10-20 21:51:41'),(106,1,8,1,'2022-10-20 21:51:41'),(107,1,9,1,'2022-10-20 21:51:41'),(108,1,10,1,'2022-10-20 21:51:41'),(109,1,11,1,'2022-10-20 21:51:41'),(110,1,12,1,'2022-10-20 21:51:41'),(111,1,13,1,'2022-10-20 21:51:41'),(112,1,14,1,'2022-10-20 21:51:41'),(113,1,15,1,'2022-10-20 21:51:41'),(114,1,16,1,'2022-10-20 21:51:41'),(115,1,17,1,'2022-10-20 21:51:41'),(116,1,18,1,'2022-10-20 21:51:41'),(117,1,19,1,'2022-10-20 21:51:41'),(118,1,20,1,'2022-10-20 21:51:41'),(119,1,21,1,'2022-10-20 21:51:41'),(120,1,22,1,'2022-10-20 21:51:41'),(121,1,23,1,'2022-10-20 21:51:41'),(122,1,24,1,'2022-10-20 21:51:41'),(123,1,25,1,'2022-10-20 21:51:41'),(124,1,26,1,'2022-10-20 21:51:41'),(125,1,27,1,'2022-10-20 21:51:41'),(126,1,28,1,'2022-10-20 21:51:41'),(127,1,29,1,'2022-10-20 21:51:41'),(128,1,30,1,'2022-10-20 21:51:41'),(129,1,31,1,'2022-10-20 21:51:41'),(130,1,32,1,'2022-10-20 21:51:41'),(131,1,33,1,'2022-10-20 21:51:41'),(132,1,34,1,'2022-10-20 21:51:41'),(133,1,35,1,'2022-10-20 21:51:41'),(134,1,36,1,'2022-10-20 21:51:41'),(135,1,37,1,'2022-10-20 21:51:41'),(136,1,38,1,'2022-10-20 21:51:41'),(137,1,39,1,'2022-10-20 21:51:41'),(138,1,40,1,'2022-10-20 21:51:41'),(139,1,41,1,'2022-10-20 21:51:41'),(140,1,42,1,'2022-10-20 21:51:41'),(141,1,43,1,'2022-10-20 21:51:41'),(142,1,44,1,'2022-10-20 21:51:41'),(143,1,45,1,'2022-10-20 21:51:41'),(144,1,46,1,'2022-10-20 21:51:41'),(145,1,47,1,'2022-10-20 21:51:41'),(146,1,48,1,'2022-10-20 21:51:41'),(147,1,49,1,'2022-10-20 21:51:41');
/*!40000 ALTER TABLE `order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `image_url` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'くら寿司','avbaaba'),(2,'ワンカルビ','bnakbna'),(3,'じゅうじゅうカルビ','bnakbna'),(4,'いろり庵きらく','bnakbna'),(5,'やっぱりステーキ','bnakbna'),(6,'つばめグリル','bnakbna'),(7,'牛繁','bnakbna'),(8,'吉野家','bnakbna'),(9,'一風堂','bnakbna'),(10,'お好み焼ゆかり','bnakbna'),(11,'餃子の王将','bnakbna'),(12,'かっぱ寿司','bnakbna'),(13,'や台やグループ','bnakbna'),(14,'とんかつ新宿さぼてん','bnakbna'),(15,'そじ坊','bnakbna'),(16,'まいどおおきに食堂','bnakbna'),(17,'いきなり！ステーキ','bnakbna'),(18,'たこ八','bnakbna'),(19,'フライングガーデン','bnakbna'),(20,'とんかつ和幸','bnakbna'),(21,'三田屋本店','bnakbna'),(22,'ほっかほっか亭','bnakbna');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1),(2),(3),(7);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-20 23:18:41
