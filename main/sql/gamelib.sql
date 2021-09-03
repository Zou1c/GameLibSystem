-- MySQL dump 10.13  Distrib 5.7.25, for Win64 (x86_64)
--
-- Host: localhost    Database: gamelib
-- ------------------------------------------------------
-- Server version	5.7.25-log

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
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game` (
  `AppID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Developer` varchar(45) NOT NULL,
  `Publisher` varchar(45) NOT NULL,
  `ReleaseDate` date NOT NULL,
  `LastUpdate` date NOT NULL,
  `Rate` double NOT NULL,
  `PositiveReviews` int(11) NOT NULL,
  `NegativeReviews` int(11) NOT NULL,
  `In-Game` int(11) NOT NULL,
  `Size` varchar(45) NOT NULL,
  `Icon` longtext NOT NULL,
  `Header` longtext NOT NULL,
  `Description` longtext NOT NULL,
  `About` longtext NOT NULL,
  `Price` int(11) NOT NULL,
  PRIMARY KEY (`AppID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (570,'Dota 2','Valve','Valve','2013-07-09','2021-08-28',0.8351,1305309,249082,314934,'15GB','https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/apps/570/0bbb630d63262dd66d2fdd0f7d37e8661a410075.jpg','https://cdn.cloudflare.steamstatic.com/steam/apps/570/header.jpg?t=1630167470','每一天全球有数百万玩家化为一百余名Dota英雄展开大战。不论是游戏时间刚满10小时还是1000小时，比赛中总能找到新鲜感。定期的更新则保证游戏性、功能和英雄都能持续发展，Dota 2已真正地焕发了生命。','每一天，全球有数百万玩家化为一百余名Dota英雄展开大战。不论是游戏时间刚满10小时还是1000小时，比赛中总能找到新鲜感。定期的更新则保证游戏性、功能和英雄都能持续发展，Dota 2已真正地焕发了生命。',0),(730,'Counter-Strike: Global Offensive','Valve','Valve','2012-08-21','2021-08-24',0.8774,5137357,694879,429590,'15GB','https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/apps/730/69f7ebe2735c366c65c0b33dae00e12dc40edbe4.jpg','https://cdn.cloudflare.steamstatic.com/steam/apps/730/header.jpg?t=1629838591','《反恐精英：全球攻势》（CS: GO）延续了 1999 年原作在团队竞技类游戏上取得的成就。 CS: GO 的特色包含全新的地图、人物、武器、全新的游戏模式，并提供翻新后的 CS 经典内容（de_dust2 等）。','《反恐精英：全球攻势》（CS: GO）延续了 1999 年原作在团队竞技类游戏上取得的傲人成就。',22),(236390,'War Thunder','Gaijin Entertainment ','Gaijin Distribution KFT','2013-08-15','2021-09-01',0.7881,193479,49832,17294,'39GB','https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/apps/236390/88259dcb7014dcdb109d9ece0cfc70c100bc2f9c.jpg','https://cdn.cloudflare.steamstatic.com/steam/apps/236390/header.jpg?t=1630481397','War Thunder 是最全面的免费、跨平台、MMO 军事游戏，致力于从 20 世纪初到最先进的现代作战单位的航空、装甲车和舰艇。立即加入，参加陆地、空中和海上的重大战斗。','War Thunder是Windows、Linux、Mac、PlayStation®4、PlayStation®5、Xbox One及Xbox Series S|X平台上最全面的免费、跨平台大型和Xbox One平台上最全面的免费、跨平台大型多人在线军事类游戏，专注于二战和冷战时期的航空、装甲车辆和海军舰艇。现在就加入进来参与在地面、天空和海洋进行的主要战事，并和来自全球各地的几百万玩家们在不断变化的环境中战斗。',0),(271590,'Grand Theft Auto V','Rockstar North','Rockstar Games','2015-04-13','2021-08-31',0.8293,992870,197244,77824,'72GB','https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/apps/271590/1e72f87eb927fa1485e68aefaff23c7fd7178251.jpg','https://cdn.cloudflare.steamstatic.com/steam/apps/271590/header.jpg?t=1630434046','Grand Theft Auto V 为玩家提供了探索屡获殊荣的洛圣都和布莱恩县世界的选项，分辨率高达 4k 及更高，并有机会体验以每秒 60 帧的速度运行的游戏。','一个初涉江湖的街头新丁、一个洗手多年的银行劫匪和一个丧心病狂的杀人狂魔，误打误撞中深陷犯罪集团、美国政府和娱乐产业之间盘根错杂的恐怖困境。他们必须齐心协力，接连完成九死一生的惊天劫案，才能在这个冷血无情的城市中苟延残喘。不要相信任何人，尤其是你的同伙！',59),(578080,'PUBG: BATTLEGROUNDS','KRAFTON, Inc.','KRAFTON, Inc.','2017-12-21','2021-09-01',0.5472,991944,818833,204905,'40GB','https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/apps/578080/609f27278aa70697c13bf99f32c5a0248c381f9d.jpg','https://cdn.cloudflare.steamstatic.com/steam/apps/578080/header.jpg?t=1630461601','绝地求生(PLAYERUNKNOWN’S BATTLEGROUNDS)是战术竞技类型的游戏，每一局游戏将有100名玩家参与，他们将被投放在绝地岛(battlegrounds)的上空，游戏开始跳伞时所有人都一无所有。','绝地求生(PLAYERUNKNOWN’S BATTLEGROUNDS)是战术竞技类游戏，每一局游戏将有100名玩家参与，他们将被投放在绝地岛(battlegrounds)的上空，游戏开始跳伞时所有人都一无所有。',98),(1085660,'Destiny 2','Bungie','Bungie','2019-10-01','2021-08-31',0.8406,335140,60170,81869,'105GB','https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/apps/1085660/fce050d63f0a2f8eb51b603c7f30bfca2a301549.jpg','https://cdn.cloudflare.steamstatic.com/steam/apps/1085660/header.jpg?t=1630428185','命运2是发生在一个独立进化的世界中的一款免费的大型多人线上动作游戏。你可以在任何时间与任何地点和你的朋友们进行游戏。','进入命运2的免费游戏世界来探索我们太阳系的隐秘并体验第一人称射击战斗。解锁强大的元素技能并收集独特的装备来个性化你的外观和游戏风格。独自或与其他朋友一起体验命运2的影片故事，进行合作任务，或与其他守护者在PvP模式中进行竞争。今天免费下载，在星空中书写你的传奇。',0),(1172470,'Apex Legends','Respawn Entertainment','Electronic Arts','2020-11-05','2021-09-01',0.897,261911,33121,136793,'56GB','https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/apps/1172470/070902d2389878ac4bf29efb5b92832c60bdf24e.jpg','https://cdn.cloudflare.steamstatic.com/steam/apps/1172470/header.jpg?t=1630459249','Apex Legends 是 Respawn Entertainment 屡获殊荣的免费英雄射击游戏。掌握不断增长的具有强大能力的传奇人物名单，并在英雄射击和大逃杀的下一次演变中体验战略小队游戏和创新游戏玩法。','在《Apex Legends》这款免费*英雄射击游戏中脱颖而出，掌控角色，征服群雄，集结技艺超群的强大传奇角色，组队在边境之地为名利而战。',0),(1203220,'NARAKA: BLADEPOINT','24 Entertainment ','NetEase Games Montréal','2021-08-12','2021-09-01',0.7814,23020,5943,69422,'20GB','https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/apps/1203220/8055e7baa81ce2084d7daa42233983967956abb0.jpg','https://cdn.cloudflare.steamstatic.com/steam/apps/1203220/header.jpg?t=1630470644','挥舞利刃，斩杀！端起火枪，爆头！享受远近结合的华丽战斗！ 在房顶跑酷，在树林中飞索穿梭，广大的地图任君高速前行！ 活用英雄能力，用风沙、隐身，甚至化身金刚大佛碾碎敌人！ 独一无二的60人生存竞技，成为最后的赢家！','当冷兵器加入生存竞技，所有逻辑都将发生变化！从大佛掌心，到崇山之巅每位角色都拥有全自由的飞索系统，所有场景元素、所有对手都可成为目标雄武的侠客、异域的刺客、神秘的盲剑士……',98),(1225330,'NBA 2K21','Visual Concepts','2K','2020-09-04','2021-08-31',0.409,14801,21743,4392,'110GB','https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/apps/1225330/a084459f502e2e5730c5f848b5c655e52b02837f.jpg','https://cdn.cloudflare.steamstatic.com/steam/apps/1225330/header.jpg?t=1627633967','《NBA 2K21》是享誉全球的畅销大作NBA 2K系列的最新作品，在呈现了业界领先的体育游戏体验。','《NBA 2K21》是享誉全球的畅销大作NBA 2K系列的最新作品。本作的玩法、竞争性以及社区在线功能，在前作的优质基础上精益求精，作出一系列激动人心的改进，再加上更加丰富多样的游戏模式，《NBA 2K21》将带给您NBA篮球与文化世界的沉浸式体验——随心所欲。',199),(1238810,'Battlefield™ V','DICE','Electronic Arts','2020-04-11','2021-08-31',0.6689,37478,18009,41698,'50GB','https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/apps/1238810/23ded6a957b5ec7525679c2e7bdac90c0653dbc8.jpg','https://cdn.cloudflare.steamstatic.com/steam/apps/1238810/header.jpg?t=1630440313','这就是终极《战地风云 5》体验。用完整的武器、载具和配备武器库以及第 1 年和第 2 年最棒的自定义内容体验人类历史上规模最大的冲突。','这就是终极《战地风云 5》体验。用已解锁的全部游戏内容从海陆空体验人类历史上规模最大的冲突。从完整的武器、载具和配备武器库中做出选择，沉浸于激烈的第二次世界大战。用完整的精英阵容以及第 1 年和第 2 年最棒的自定义内容在战场上脱颖而出。',220);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Balance` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0,'nene','nene',2000),(1,'zhangsan','123456',15515515),(2,'lisi','123456',0),(3,'kareninasss','654321',1000),(4,'markdoge','Z1355060521z',2000),(5,'xyx','2243',2000);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlib`
--

DROP TABLE IF EXISTS `userlib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userlib` (
  `UserID` int(11) NOT NULL,
  `AppID` int(11) NOT NULL,
  `Record` double NOT NULL,
  `LastPlayed` date DEFAULT NULL,
  `IsLocal` tinyint(4) NOT NULL,
  `IsFavorite` tinyint(4) NOT NULL,
  PRIMARY KEY (`UserID`,`AppID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlib`
--

LOCK TABLES `userlib` WRITE;
/*!40000 ALTER TABLE `userlib` DISABLE KEYS */;
INSERT INTO `userlib` VALUES (0,271590,13.5,'2020-12-31',0,0),(0,1085660,5.5,'2021-09-01',1,0),(0,1172470,68,'2021-09-01',1,1),(1,570,34,'2021-08-31',1,1),(1,730,28,'2021-08-01',1,0),(2,730,56,'2021-09-01',1,1),(2,578080,26.5,'2021-06-01',1,0),(2,1203220,31,'2021-08-01',0,0),(2,1225330,48.5,'2021-09-01',1,0),(3,236390,21,'2020-12-31',0,0),(3,271590,86.5,'2021-06-03',1,1),(3,578080,43,'2020-11-06',0,0),(4,570,34,'2020-02-13',0,0),(4,236390,78,'2021-09-01',1,1),(4,1238810,65.5,'2020-09-23',0,0),(5,570,28,'2021-03-01',1,0),(5,271590,13,'2020-05-24',0,0),(5,1085660,24,'2021-09-01',1,0);
/*!40000 ALTER TABLE `userlib` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-03 13:34:23
