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
  `About` varchar(10000) NOT NULL,
  `Price` int(11) NOT NULL,
  PRIMARY KEY (`AppID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (570,'Dota 2','Valve','Valve','2013-07-09','2021-08-28',0.8351,1305309,249082,314934,'15GB','images/gameimage/dota1.jpg','images/gameimage/dota2.jpg','每一天全球有数百万玩家化为一百余名Dota英雄展开大战。不论是游戏时间刚满10小时还是1000小时，比赛中总能找到新鲜感。定期的更新则保证游戏性、功能和英雄都能持续发展，Dota 2已真正地焕发了生命。','每一天，全球有数百万玩家化为一百余名Dota英雄展开大战。不论是游戏时间刚满10小时还是1000小时，比赛中总能找到新鲜感。定期的更新则保证游戏性、功能和英雄都能持续发展，Dota 2已真正地焕发了生命。<br><br>一个战场无限可能<br>在英雄、技能和物品的多样性方面，Dota可谓是无与伦比——绝不可能存在两场相同的比赛。每个英雄都有多种定位打法，丰富的物品可以满足每场比赛的具体需求。Dota从不限制打法，只为让您展现自己的风采。<br><br>所有英雄无需付费<br>公平竞技是Dota的基石，为确保所有人的游戏基础相同，游戏的核心内容——如庞大的英雄数量——对所有玩家开放。粉丝们可以收集英雄饰品，和有趣的附加内容，但是进行游戏所需的一切在开始第一场比赛前就已经赋予。<br><br>与好友携手一同游玩<br>Dota内涵深邃，并且不断进化，但不论何时加入都不算太晚。<br>合作对抗机器人可以模拟实战。英雄试玩模式可以磨练技艺。而比赛的匹配系统，兼顾玩家的游戏行为和水平，确保每场比赛都能将合适的玩家匹配到一起。',0),(730,'Counter-Strike: Global Offensive','Valve','Valve','2012-08-21','2021-08-24',0.8774,5137357,694879,429590,'15GB','images/gameimage/csgo1.jpg','images/gameimage/csgo2.jpg','《反恐精英：全球攻势》（CS: GO）延续了 1999 年原作在团队竞技类游戏上取得的成就。 CS: GO 的特色包含全新的地图、人物、武器、全新的游戏模式，并提供翻新后的 CS 经典内容（de_dust2 等）。','《反恐精英：全球攻势》（CS: GO）延续了 1999 年原作在团队竞技类游戏上取得的傲人成就。<br><br>CS: GO 的特色包含全新的地图、人物、武器、全新的游戏模式，并提供翻新后的 CS 经典内容（de_dust2 等）。<br><br>“《反恐精英》这个模组于 1999 年 8月推出时，立刻成了世界上玩家数量最多的线上 PC 动作游戏，使得游戏业为之一惊。”Valve 的 Doug Lombardi 如是说道。“在过去的 12 年中，它一直是世界上拥有玩家数量最多的游戏之一，引领着竞技游戏赛事，并且在全球创下了超过 2500 万套的游戏销量。CS: GO 承诺将增强屡获殊荣的 CS 系列之游戏体验，并把它带给 PC 平台、次世代主机平台和 Mac 平台的玩家。”',22),(236390,'War Thunder','Gaijin Entertainment ','Gaijin Distribution KFT','2013-08-15','2021-09-01',0.7881,193479,49832,17294,'39GB','images/gameimage/war thunder1.jpg','images/gameimage/war thunder2.jpg','War Thunder 是最全面的免费、跨平台、MMO 军事游戏，致力于从 20 世纪初到最先进的现代作战单位的航空、装甲车和舰艇。立即加入，参加陆地、空中和海上的重大战斗。','War Thunder是Windows、Linux、Mac、PlayStation®4、PlayStation®5、Xbox One及Xbox Series S|X平台上最全面的免费、跨平台大型和Xbox One平台上最全面的免费、跨平台大型多人在线军事类游戏，专注于二战和冷战时期的航空、装甲车辆和海军舰艇。现在就加入进来参与在地面、天空和海洋进行的主要战事，并和来自全球各地的几百万玩家们在不断变化的环境中战斗。<br><br>在War Thunder中，飞机、武装直升机、地面部队和海军舰艇将会在历史性的战场上协同作战，有超过1900种载具可供选择，其中有不少是独家载具，您可以操纵轰炸机的自卫炮塔内击毁追击您的敌机，驾驶高射炮保护您的队友免遭空袭，使用多种火箭发射器击落敌机，或用驾驶快艇用鱼雷击沉敌人的战舰。<br><br>游戏特色：<br>超过2000款细节丰富的飞机、直升机、坦克、军舰和其他载具，均通过历史文献和幸存资料来源精心制作。<br>100多张表现历史上发生的主要战事的地图。<br>玩家之间的高强度对抗，在全面的战斗任务中可以设置不同难度以体现多种多样的游戏风格和水平。<br>丰富的人机对抗内容，其中包括动态的历史战役和个人任务。<br>定期更新内容，包括新载具、地图、任务和国家。<br>惊人的画质，真实的音效和优美的背景音乐创造了一个能够让您沉浸其中的世界。<br>无缝衔接的跨平台游戏体验，Windows，Linux，Max，PlayStation®4, PlayStation®5, Xbox One 和 Xbox Series X|S，所有玩家都能在一个服务器上畅玩。<br>为War Thunder定制优异的内容并在 War Thunder Live上面分享，并有机会获得现金作为奖励！',0),(271590,'Grand Theft Auto V','Rockstar North','Rockstar Games','2015-04-13','2021-08-31',0.8293,992870,197244,77824,'72GB','images/gameimage/gtaV1.jpg','images/gameimage/gtaV2.jpg','Grand Theft Auto V 为玩家提供了探索屡获殊荣的洛圣都和布莱恩县世界的选项，分辨率高达 4k 及更高，并有机会体验以每秒 60 帧的速度运行的游戏。','一个初涉江湖的街头新丁、一个洗手多年的银行劫匪和一个丧心病狂的杀人狂魔，误打误撞中深陷犯罪集团、美国政府和娱乐产业之间盘根错杂的恐怖困境。他们必须齐心协力，接连完成九死一生的惊天劫案，才能在这个冷血无情的城市中苟延残喘。不要相信任何人，尤其是你的同伙！<br><br>PC 版Grand Theft Auto V 能够以超越 4K 的最高分辨率和 60 帧每秒的帧率，为您呈现屡获殊荣、令人痴迷的游戏世界——洛桑托斯市和布雷恩郡。<br><br>游戏为 PC 玩家提供了巨细无遗的独享自定义选项，包括纹理质量、着色器、曲面细分、反锯齿等超过 25 种不同设定，还有支持键鼠操控的广泛自定义功能。其他选项包括可控制车辆和行人流量的人口密度滑杆，以及对双屏、三屏、3D 和即插即用手柄的支持。<br><br>Grand Theft Auto V 同时包含 Grand Theft Auto 在线模式，这个活力四射、瞬息万变的联网世界支持多达 30 位玩家同时进行游戏，并且囊括了自发布以来的所有游戏升级以及内容更新。您可以凭借非法贸易发家致富，以 CEO 的身份一手打造自己的犯罪帝国；创立摩托车会以称霸街头；携手好友上演逆天抢劫任务；体验命悬一线的特技竞速；在独特的竞争模式中一展身手；更可以信马由缰，亲手为游戏创作新内容，并与全世界的 GTA 玩家共享。<br><br>PC 版 Grand Theft Auto V 和 GTA 在线模式同时提供第一视角模式，让玩家能够以全新方式探索游戏中洛桑托斯市和布雷恩郡细腻逼真、令人惊艳的种种细节。<br><br>随着 PC 版 Grand Theft Auto V 的推出，Rockstar 编辑器也一并登场。作为一套功能强大的创作工具，它能让玩家快速轻松地录制、编辑和分享在 Grand Theft Auto V 及 GTA 在线模式中的游戏影像。Rockstar 编辑器的导演模式能让玩家使用故事模式中的主要角色、路人，甚至是动物进行搭台布景，任由玩家天马行空，随心创作。除了高级镜头控制和剪辑特效 （包括快动作和慢动作） 以及多种镜头滤镜以外，玩家还可以将游戏中的电台曲目作为配乐，或者对游戏配乐的强度进行动态控制。影片制作完成后，可以直接从 Rockstar 编辑器上传至社交网络和 Rockstar Games Social Club，与其他玩家轻松分享您的游戏激情。<br><br>游戏原声音乐的创作者 The Alchemist 和 Oh No 同时回归游戏，作为 The Lab FM 电台的主持人。这个电台主打二者以游戏原声音乐为灵感创作的全新独家曲目，合作艺人包括 Earl Sweatshirt、Freddie Gibbs、Little Dragon、Killer Mike、Future Islands 的 Sam Herring 等等。此外，玩家也可以在洛桑托斯市和布雷恩郡寻幽探胜之际，通过由个人电台创建的自定义歌单，聆听属于自己的音乐。<br><br>† 获得独享内容需要 Rockstar Games Social Club 账户。请前往 rockstargames.com/v/bonuscontent 了解详细信息。',59),(578080,'PUBG: BATTLEGROUNDS','KRAFTON, Inc.','KRAFTON, Inc.','2017-12-21','2021-09-01',0.5472,991944,818833,204905,'40GB','images/gameimage/pubg1.jpg','images/gameimage/pubg2.jpg','绝地求生(PLAYERUNKNOWN’S BATTLEGROUNDS)是战术竞技类型的游戏，每一局游戏将有100名玩家参与，他们将被投放在绝地岛(battlegrounds)的上空，游戏开始跳伞时所有人都一无所有。','绝地求生(PLAYERUNKNOWN’S BATTLEGROUNDS)是战术竞技类游戏，每一局游戏将有100名玩家参与，他们将被投放在绝地岛(battlegrounds)的上空，游戏开始跳伞时所有人都一无所有。<br>游戏展开的方式是：玩家赤手空拳地分布在岛屿的各个角落，利用岛上多样的武器与道具。<br>随着时间的流逝，岛上的安全地带越来越少，特定地区也会发生爆炸的情况，最终只有一人存活获得胜利。<br>游戏的每一局比赛都会随机转换安全区，这样玩家的很新鲜与紧张感会更加强烈。<br><br>PLAYERUNKNOWN (Brendan Greene – 目前为PUBG Creative Director )是绝地求生类游戏的开拓者。他在ARMA2初次展现类似游戏模式，他的游戏模式也成为了ARMA系列与H1Z1:King of the Kill的基础。现在， 他为了打造真正的求生战场而在PUBG Corp.开发绝地求生(PLAYERUNKNOWN’S BATTLEGROUNDS)。',98),(1085660,'Destiny 2','Bungie','Bungie','2019-10-01','2021-08-31',0.8406,335140,60170,81869,'105GB','images/gameimage/destiny1.jpg','images/gameimage/destiny2.jpg','命运2是发生在一个独立进化的世界中的一款免费的大型多人线上动作游戏。你可以在任何时间与任何地点和你的朋友们进行游戏。','进入命运2的免费游戏世界来探索我们太阳系的隐秘并体验第一人称射击战斗。解锁强大的元素技能并收集独特的装备来个性化你的外观和游戏风格。独自或与其他朋友一起体验命运2的影片故事，进行合作任务，或与其他守护者在PvP模式中进行竞争。今天免费下载，在星空中书写你的传奇。<br><br>引人入胜的故事<br>你是一名守护者，在太阳系中守护人类圣城不被邪恶敌人侵害的保护者。守望星空与暗影正面相抗。你的传说现在开始。<br><br>守护者职业<br>从重装的泰坦、神秘的术士和灵动的猎人中选择。<br><br>泰坦<br>训练有素，傲然群立，泰坦既能激进攻击，又可坚守阵地。点燃你巨锤上的火焰，若闪电划过天空，正面冲击你的敌人。你的队伍将在你的坚强屏障后傲然挺立。<br><br>术士<br>术士将宇宙奥秘化作自己的武器，保护自己，毁灭敌人。让战场上降下毁灭之雨，眨眼间清除成群敌人。你的同伴将会知道光能真正的力量。<br><br>猎人<br>灵活且勇猛，猎人行动敏捷，枪法如神。舞动你的金枪，在敌人中如旋风闪过，或是在阴影中给予敌人致命一击。找到敌人，瞄准，然后在战斗开始之前就结束一切。<br>合作或竞技类多人游戏<br>在多样的PvE和PvP游戏模式中和你的朋友与其他守护者一起合作或竞争<br><br>合作类多人游戏<br>充满稀有强力奖励的合作探险。利用任务、分支任务和巡逻来体验故事情节。纠集一只小的火力战队，并在打击的最后获取宝箱中的奖励。或是在数小时的突袭推进中检验你的火力战队的技术——这对于任何火力战队都是终极的考验。你决定你的传奇从哪里开始。<br><br>竞技类多人游戏<br>在无限制交战、团队竞技场和PvE/PvP混合竞赛中与其他玩家正面相抗。在你的日历上标注出特殊的比赛，比如铁旗。并在活动结束前领取限时奖励。然后，在你准备好之后，进入奥斯里斯试炼，在那里，你与荣耀之间唯一的阻碍，就是那些最棒的玩家。<br>异域武器和护甲<br>上千种武器，百万种选择。发掘全新的装备搭配并决定你自己的个人风格。完美军械库的狩猎现在开始。',0),(1172470,'Apex Legends','Respawn Entertainment','Electronic Arts','2020-11-05','2021-09-01',0.897,261911,33121,136793,'56GB','images/gameimage/Apex1.jpg','images/gameimage/Apex2.jpg','Apex Legends 是 Respawn Entertainment 屡获殊荣的免费英雄射击游戏。掌握不断增长的具有强大能力的传奇人物名单，并在英雄射击和大逃杀的下一次演变中体验战略小队游戏和创新游戏玩法。','在《Apex Legends》这款免费*英雄射击游戏中脱颖而出，掌控角色，征服群雄，集结技艺超群的强大传奇角色，组队在边境之地为名利而战。<br><br>掌控丰富传奇角色、深度战术小队玩法以及大胆革新元素，获得前所未有的新一代大逃杀竞技射击游戏体验——在崎岖世界，一切皆有可能。欢迎来到新一代英雄射击游戏。<br><br>主要特色：<br>一系列传奇角色- 掌控一系列日益丰富的强大传奇角色，每位英雄都有其独特个性、力量和特殊技能，易于上手但要精通也绝非易事。<br>组建你的战队 -选择你的传奇角色，与其他玩家强强联手，合理搭配特殊技能，打造终极战队。<br>战术小队玩法-无论你是想在大逃杀模式中在一座巨大的浮空之城中征战厮杀，还是准备在竞技场模式近战比拼，一决高下，你都需要思维敏捷，快速反应。精通传奇英雄独特专属技能，与队友配合参战，探索新式战术和强大组合技。<br><br>革新性战斗<br>- 精通不断扩充的各种强大武器及装备。你要动作迅速，并学习掌握每种武器的节奏，以充分利用你的武器库。此外，你还可在限时模式中更换武器，每个赛季也有新增内容等你发现。<br><br>不断扩展的宇宙<br>- 《Apex Legends》将为你打造一个身临其境的宇宙。在这里，故事内容将不断更新，每一赛季变更地图，新传奇英雄也将不断加入战斗。快快穿上各式奇装异服，在Apex Games中开启冒险竞技，留下精彩瞬间吧！',0),(1203220,'NARAKA: BLADEPOINT','24 Entertainment ','NetEase Games Montréal','2021-08-12','2021-09-01',0.7814,23020,5943,69422,'20GB','images/gameimage/NB1.jpg','images/gameimage/NB2.jpg','挥舞利刃，斩杀！端起火枪，爆头！享受远近结合的华丽战斗！ 在房顶跑酷，在树林中飞索穿梭，广大的地图任君高速前行！ 活用英雄能力，用风沙、隐身，甚至化身金刚大佛碾碎敌人！ 独一无二的60人生存竞技，成为最后的赢家！','无拘战斗革命<br><br>不只是近战！<br>当冷兵器加入生存竞技，所有逻辑都将发生变化！<br>战场层次、角色设计、飞索的加入、复活方式、局内成长……<br>享受刀刀入肉的冷兵器挥砍与百步穿杨的远距离战斗吧！<br><br>自由，自由，还是自由！<br>从大佛掌心，到崇山之巅<br>从铁索悬棺，到矿道纵横<br>全开放的地图交互，使地图上所有角落均可自由到达<br><br>充满无穷可能的飞索<br>每位角色都拥有全自由的飞索系统，所有场景元素、所有对手都可成为目标<br>狭路相逢？飞跃重重障碍，快速加入战场<br>情况不妙？空中连续开锁，一击脱离<br>埋伏起来？瞄准对手，瞬身偷袭<br><br>尚武美学觉醒<br>雄武的侠客、异域的刺客、神秘的盲剑士……<br>远道而来的英雄们，都透着历战的杀意<br>巨兽的残骸、破败的城镇、深邃的古寺……<br>打造宏大、独特的竞技舞台<br>凝结传统美术精华，留白+写意，<br>我们倾情演绎<br>',98),(1225330,'NBA 2K21','Visual Concepts','2K','2020-09-04','2021-08-31',0.409,14801,21743,4392,'110GB','images/gameimage/2k21 1.jpg','images/gameimage/2k21 2.jpg','《NBA 2K21》是享誉全球的畅销大作NBA 2K系列的最新作品，在呈现了业界领先的体育游戏体验。','《NBA 2K21》是享誉全球的畅销大作NBA 2K系列的最新作品。本作的玩法、竞争性以及社区在线功能，在前作的优质基础上精益求精，作出一系列激动人心的改进，再加上更加丰富多样的游戏模式，《NBA 2K21》将带给您NBA篮球与文化世界的沉浸式体验——随心所欲。<br>无论你是新玩家、老玩家还是回归的玩家，你都能在《NBA 2K21》中找到你喜欢的刺激游戏模式，体验多种多样的篮球乐趣：<br><br>更加真实的体验<br>通过视觉呈现、球员AI、游戏模式等多个方面的进化，《NBA 2K21》不断突破极限，带给你最真实的篮球游戏体验。你将能感受到观众的热情与NBA的激烈竞争，以及当今游戏领域最让人沉浸的体育大作为你带来的无穷乐趣。<br><br>精英级游戏玩法<br>先进的专家摇杆让你享受持球时无与伦比的顺滑操控手感。跳投和上篮将展现前所未有精准和巧妙，还可解锁全新招牌运球动作，控球效率更高。<br><br>你专属的史上最佳球队<br>利用梦幻球队收集最新的NBA明星和传奇球员，与全世界的顶级收藏家们一较高下。《2K21》新增限时赛季概念，随着在梦幻球队的新老模式中完成比赛，你将获得独一无二的奖励。<br><br>新的辉煌生涯<br>全新的大片级辉煌生涯体验，带领你从高中球队开始，一路进入十支官方授权的大学球队之一，最后闯入大联盟。在场内场外都成为最亮眼的明星，让你的自创球员走上顶峰，在这段激动人心的传奇旅程中成为一代巨星。<br><br>新的街区场景<br>在阳光下享受1对1、3对3和5对5的比赛吧。《NBA 2K21》 的新街区新加入海滩球场，更有全新的视觉呈现和画面布局。你可以在街球公园展示你的风格技巧，组队出征职业业余混合赛，还可以在动态更新的2K竞技活动中赢取奖励。<br><br>最新的服饰和音乐<br>穿上全新的服饰和球鞋，用你最喜欢的衣服、配饰和球鞋品牌从头到脚打扮自己，让你成为最潮最炫的球员。你还可以在《NBA 2K21》 的动感音乐中享受篮球，除了来自全世界的著名艺术家，更有亟待被发现的新兴音乐家为游戏增添色彩。<br><br>美国篮球史<br>回顾美国篮球历史上的冠军传奇。跟随经典球队走上赛场，在梦幻球队中收集来自过去的明星球员卡片，用自创球员装备展示你的骄傲。',199),(1238810,'Battlefield™ V','DICE','Electronic Arts','2020-04-11','2021-08-31',0.6689,37478,18009,41698,'50GB','images/gameimage/Battlefield V1.jpg','images/gameimage/Battlefield V2.jpg','这就是终极《战地风云 5》体验。用完整的武器、载具和配备武器库以及第 1 年和第 2 年最棒的自定义内容体验人类历史上规模最大的冲突。','这就是终极《战地风云 5》体验。用已解锁的全部游戏内容从海陆空体验人类历史上规模最大的冲突。从完整的武器、载具和配备武器库中做出选择，沉浸于激烈的第二次世界大战。用完整的精英阵容以及第 1 年和第 2 年最棒的自定义内容在战场上脱颖而出。<br><br>《战地风云 5》决定版包含《战地风云 5》主游戏和最齐全的内容收录：<br>自发行以来、第 1 年和第 2 年的所有游戏内容（武器、载具和配备）<br>所有精英<br>84 款极具带入感的英军和德军服装，提升二战沙盒游戏体验<br>8 款第 2 年中的士兵服装<br>2 款第 2 年中的武器皮肤，分别适用于 10 款 和 4 款武器<br>3 款载具装饰<br>33 件第 1 年中的章节奖励物品。',220);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Balance` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'nene','nene',2000),(2,'zhangsan','123456',15515515),(3,'lisi','123456',0),(4,'kareninasss','654321',1000),(5,'markdoge','x',2000),(6,'xyx','2243',2000),(7,'g','g',500),(8,'b','b',0);
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
INSERT INTO `userlib` VALUES (1,271590,13.5,'2020-12-31',0,0),(1,1085660,5.5,'2021-09-01',1,0),(1,1172470,68,'2021-09-01',1,1),(2,570,34,'2021-08-31',1,1),(2,730,28,'2021-08-01',1,0),(3,730,56,'2021-09-01',1,1),(3,578080,26.5,'2021-06-01',1,0),(3,1203220,31,'2021-08-01',0,0),(3,1225330,48.5,'2021-09-01',1,0),(4,236390,21,'2020-12-31',0,0),(4,271590,86.5,'2021-06-03',1,1),(4,578080,43,'2020-11-06',0,0),(5,570,34,'2020-02-13',0,0),(5,236390,78,'2021-09-01',1,1),(5,1238810,65.5,'2020-09-23',0,0),(6,570,28,'2021-03-01',1,0),(6,271590,13,'2020-05-24',0,0),(6,578080,0,'2021-09-06',0,0),(6,1085660,24,'2021-09-01',1,0),(6,1225330,1,'2021-09-07',0,1);
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

-- Dump completed on 2021-09-07 10:05:20
