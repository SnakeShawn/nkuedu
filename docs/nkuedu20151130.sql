CREATE DATABASE  IF NOT EXISTS `nkuedu` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `nkuedu`;
-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: nkuedu
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `ID` varchar(32) NOT NULL,
  `login_name` varchar(45) DEFAULT NULL,
  `passwd` varchar(45) DEFAULT NULL,
  `system_open` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('23491fa2793d4762b5bedb014b24c2cc','admin','admin',1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `ID` varchar(32) NOT NULL,
  `selection_id` varchar(32) NOT NULL,
  `comment` text,
  `score1` int(1) NOT NULL,
  `score2` int(1) NOT NULL,
  `score3` int(1) NOT NULL,
  `score4` int(1) NOT NULL,
  `score5` int(1) NOT NULL,
  `score6` int(1) NOT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `selection_id_UNIQUE` (`selection_id`),
  KEY `fk_comment_1_idx` (`selection_id`),
  CONSTRAINT `fk_comment_1` FOREIGN KEY (`selection_id`) REFERENCES `selection` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES ('16d9a245cb0c499f97bd648aff65957d','ea0f9488528f43b9ab9991ff16410d2f','11月28日媒体报道，宁夏调研党风廉政建设工作座谈会11月6日在银川召开，自治区政府副主席白雪山参会，临近下午6时，曾休会10分钟，在此期间，白雪山被中央纪委带走。晚上10时20分，中纪委就发布消息，白雪山被调查。\n\n　　法制晚报记者(微信公众号：观海内参guanhaineican)梳理发现，白雪山从被带走到中纪委宣布调查通报，前后大约只有4个小时。从今年落马的30位省部级“老虎”来看，从被中纪委带走到被宣布调查，时间最短的是云南省委原副书记仇和，他经历的时间只有2个多小时。\n\n　　3名“老虎”下午被带走 晚上被中纪委通报\n\n　　法制晚报记者(微信公众号：观海内参guanhaineican)梳理发现，在今年落马的30位省部级“老虎”中，至少有8位“老虎”被中纪委“秒杀”，他们从被中纪委带走到通报被调查都不到24小时。\n\n　　在这8位“老虎”中，有三位官员被带走的时间和通报时间“高度吻合”，都是下午被中纪委带走，晚上被宣布调查。\n　　据《财经》报道，宁夏自治区政府原副主席白雪山11月6日参加调研党风廉政建设工作座谈会，临近下午6时休会的时候，白雪山被中央纪委带走。晚上10时20分，中纪委就发布消息，白雪山被调查。',5,5,4,5,5,5,97),('3d036fa6b7a74179b170b1984bda08c4','b373d2898f444bdbaee07c56e9b9ec5f','老师讲的不是很好，但是也还凑合吧。。。。。。。。',1,2,3,4,5,1,50),('4086d80311e94fe68dafb6e83d999af7','fc83174c2c33469387d22ef05004a34a','老师讲的非常好。',5,4,3,2,1,3,60);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `ID` varchar(32) NOT NULL,
  `select_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(45) NOT NULL,
  `max_student` int(11) NOT NULL,
  `professor` varchar(45) NOT NULL,
  `classroom` varchar(12) NOT NULL,
  `request` varchar(100) DEFAULT NULL,
  `introduction` varchar(3000) DEFAULT NULL,
  `type` varchar(2) NOT NULL,
  `credit` float(2,1) NOT NULL DEFAULT '2.0',
  `is_open` int(1) NOT NULL DEFAULT '1',
  `is_delete` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `select_id_UNIQUE` (`select_id`),
  UNIQUE KEY `course_num_UNIQUE` (`course_num`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('0b806b7ebe4d434e91af2b616d6c041b',1,'1','java编程思想',10,'李帅成','B205','男生','做一个图书管理系统，需要将图书目录存在服务器的数据库中，然后再安卓客户端中调用数据并显示，一开始直接将大文本存成Varchar格式，发现这个格式存的文本似乎都没有格式，换行符都没有作用。后来查资料发现应该存成text格式。但是存成text格式以后换行符依然无效，组后通过sql指令发现换行符被默认存成\\r，但是读取的时候，去被显示成立回车。@@有查阅资料发现，mysql中，换行符应该是<br>。如果想让存在mysql中的文本有格式，必须将原来文本的\\r转换成<br>@@具体方法是：@@1.现将格式化好的文本存入数据库中@@2.利用指令update book SET book_press = REPLACE(book_press, \'\\r\', \'<br>\');将文本中的\\r换成<br>。@@用了该方法以后，发现在浏览器中调用换行符有效了，但是在手机客户端上调用显示的时候却直接显示<br>符号，而且也不能换行。但是值得注意的是这条指令同样可以替换数据库文本中的其他指令，是一条非常有用的指令。@@我又开始怀疑是不是安卓端的文本显示框的问题，经过一系列恶心的测试终于找到了问题，安卓端的换行符实际是是\\n。servlet端取到数据库中的数据里面的回车符是没有问题的，但是传送到安卓客户端中的数据就没有了回车符，不知道是在哪一步回车符不见了，但是还是找到了解决方法。@@就是在servlet端把\\n转化为@，然后再在客户端显示前把它改回来。@@具体方法如下：@@1.servlet端取到数据库中的数据里面的字符串以后加一个指令@@result = result1.replace(\'\\n\',\'@\');（result1 是原字符串）@@2.在安卓端，把字符串传给文本显示框之前加条指令@@result1= result.replace(\'\\n\',\'@\');（result 是原字符串）','e',2.5,1,0),('1',2,'1902015560','中华国学',10,'郑子平','b301','','************************************************************************************************************************************\n去掉textArea和input的边框\n\n \n\n去掉textArea的边框：\nstyle=\"overflow:auto;background-attachment:fixed;background-repeat:no-repeat;border-style:solid;border-color:Black; width: 294px; height: 175px;\"\n\n\n去掉input的边框：\nstyle=\'border-left:0px;border-top:0px;border-right:0px;border-bottom:1px \'\n\n去掉input的边框，带下划线：\nstyle=\'border-left:0px;border-top:0px;border-right:0px;border-bottom:1px; border-bottom-color:Black\'\n************************************************************************************************************************************\n\n版权声明：本文为博主原创文章，未经博主允许不得转载','e',2.0,1,0),('1459b9a95fcb40cf8dcf34f412dc71ec',12,'1111321','海报设计',10,'杜森','A12k','黄','@<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">@<html>@<head>@<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">@<title>南开大学夏季学期高中生选课系统</title>@</head>@<frameset rows=\"*\" cols=\"130,*\" border=\"0\" style=\"frameborder:NO; border:0; framespacing:0; noresize; marginheight:0; marginwidth:0\">@  <frame src=\"/nkuedu/admin/left\" name=\"leftFrame\" scrolling=\"NO\" noresize marginheight=\"0\" marginwidth=\"0\">@  <frameset rows=\"81,*\" cols=\"*\" border=\"0\" style=\"fraeborder:NO; border:0; framespacing:0; noresize; marginheight:0; marginwidth:0\">@    <frame src=\"/nkuedu/admin/top\" name=\"topFrame\" scrolling=\"NO\" noresize marginheight=\"0\" marginwidth=\"0\">@    <frameset rows=\"26,*\" border=\"0\" style=\"frameborder:NO; border:0; framespacing:0; noresize; marginheight:0; marginwidth:0\">@      <frame src=\"\" name=\"topMenu\" scrolling=\"NO\" noresize marginwidth=\"0\" marginheight=\"0\">@      <frame src=\"\" name=\"mainFrame\" scrolling=\"YES\" marginwidth=\"0\" marginheight=\"0\">@    </frameset>@  </frameset>@</frameset>@@<noframes>@<body>@</body>@</noframes>@@</html>','e',2.0,1,0),('1e1f1867317048f69893dce0ba62cb09',9,'101112910','版式设计',10,'吴力行','B205','艺设同学','添加课程后，您需要在“课程管理”中点击“查看/修改时间”添加课程的上课时间信息@被删除课程不会在列表中，如需找回请联系数据库管理员 ','e',3.0,1,0),('360d8e52cbd049d7a3522c7a352fdd4d',3,'0003','计算机网络',11,'李兴娟','警员','','原帖由 \"HonestQiao\" 发表：@<RE>;加在前面@加在后面</PRE>;','e',1.2,1,0),('56ce5da9eb6c47a6853778cf412cdaf0',15,'4','4',4,'4','4','4','4','4',3.0,1,0),('59b3e5d12f6b4f0d968064015025a775',8,'51284789',' 古典诗词格律欣赏与创作',10,'敖坤','b501','','1','e',2.0,1,0),('63ca76616d2546a1989b34747ae720c0',14,'3','3',3,'3','3','3','3','3',3.0,1,0),('909219807d344831b28a7422c214ece9',4,'12','java编程思想',10,'李帅成','B205','男生','我通过form表单的text框把一大段文字，使用php写道了mysql的数据库中。@    这段文字是分段的，一个一个自然断，每个自然段首行缩进两个空格。可是当我用php再从mysql库中毒出来显示在web页面上时候，整个成了一段话，什么换行符合空格都没了。@    请问如何保证度出来也是一个一个自然段呢？@    谢谢。','e',2.5,1,0),('983d7587e8ec4e4a9254863b4a6e861b',5,'11','java编程思想',10,'李帅成','B205','男生','ｊａｖａ　web','e',2.5,1,0),('b6cf166e09934570866b1ccf15696cab',6,'2','c+编程',9,'陈佳星','A105','女性不能选','Thinking in c++','e',2.0,1,0),('ccd5b29d81fc4c95b9cf6d0cf04bd033',16,'29383784','西方浪漫主义音乐',5,'岳英放','学活地下1','无','浪漫主义音乐是古典主义音乐（维也纳古典乐派）的延续和发展，是西方音乐史上的一种音乐风格或者一个时代。@@浪漫主义主要用于描述1830年—1850年间的文学创作，以及1830年—1900年间的音乐创作。','e',2.0,1,0),('e4f8c11d19644647bd45e5b26e538bbb',7,'1111','自增',12,'行书送','h','ea','sss','e',2.0,1,0);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_time`
--

DROP TABLE IF EXISTS `course_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_time` (
  `ID` varchar(32) NOT NULL,
  `course_id` varchar(32) NOT NULL,
  `course_day` int(1) NOT NULL,
  `start_time` int(1) NOT NULL,
  `end_time` int(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_course_time_1_idx` (`course_id`),
  CONSTRAINT `fk_course_time_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_time`
--

LOCK TABLES `course_time` WRITE;
/*!40000 ALTER TABLE `course_time` DISABLE KEYS */;
INSERT INTO `course_time` VALUES ('162186fe279e491189150cfd2c17c0ed','56ce5da9eb6c47a6853778cf412cdaf0',2,5,6),('2193df16bc5440e794e2cb2f6e46729b','b6cf166e09934570866b1ccf15696cab',1,6,8),('2fd7ccf8f85e4bb7a1ef0d8804a0d0e3','1459b9a95fcb40cf8dcf34f412dc71ec',1,2,3),('3ea31bff087b4f2b8343eb3582b21440','909219807d344831b28a7422c214ece9',3,2,3),('5104c2e45d5c49f5921441b4099e0492','0b806b7ebe4d434e91af2b616d6c041b',5,2,4),('6c3ec19f4c2a418a842c974418332a81','59b3e5d12f6b4f0d968064015025a775',7,6,9),('79fa8a60bffa4bfc8b6fa9592b4cd9a3','0b806b7ebe4d434e91af2b616d6c041b',1,3,4),('7f1c93b84c0842d1be420d2d6d8efa60','1',1,2,3),('95d2c84adba541d5b1c3cf68cc11a137','1',2,2,5),('a4dd3df04197490ab2d7605013328674','1459b9a95fcb40cf8dcf34f412dc71ec',7,9,10),('a521fd2d1f2f4182a367232aa6d2fd44','1e1f1867317048f69893dce0ba62cb09',4,7,8),('aaeaa236770c4ad3b064d16ca1d61192','ccd5b29d81fc4c95b9cf6d0cf04bd033',3,5,6),('b22302ec7efa407a9e93cbe9b3c562e4','0b806b7ebe4d434e91af2b616d6c041b',2,2,3),('b77684c1b9a8444fac14fd42e62d3e1b','0b806b7ebe4d434e91af2b616d6c041b',1,1,2),('ced5b14cfee44df183155de9ec7a876b','e4f8c11d19644647bd45e5b26e538bbb',1,2,3),('d056f082713544b7a3b8f50b44014eae','983d7587e8ec4e4a9254863b4a6e861b',6,5,6),('d651daa82f9945cbac82025ef256d8f9','360d8e52cbd049d7a3522c7a352fdd4d',5,1,2),('fed44a9de4b54d05a01309f97b89c793','1e1f1867317048f69893dce0ba62cb09',5,5,6);
/*!40000 ALTER TABLE `course_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selection`
--

DROP TABLE IF EXISTS `selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selection` (
  `ID` varchar(32) NOT NULL,
  `student_id` varchar(32) NOT NULL,
  `course_id` varchar(32) NOT NULL,
  `score` float(6,2) DEFAULT NULL,
  `is_over` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_selection_1_idx` (`student_id`),
  KEY `fk_selection_2_idx` (`course_id`),
  CONSTRAINT `fk_selection_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_selection_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selection`
--

LOCK TABLES `selection` WRITE;
/*!40000 ALTER TABLE `selection` DISABLE KEYS */;
INSERT INTO `selection` VALUES ('00fca573121445b2bc4d5df5ad7b23e6','880e451acae94e6595ef6e834fa6bb14','1e1f1867317048f69893dce0ba62cb09',NULL,'1'),('0fbdc15db06341eebd3c6b5efbbe3b95','8fa1fd781f5041718165b0f69878977a','983d7587e8ec4e4a9254863b4a6e861b',NULL,'0'),('4aad0eee341c41a59ff5ac7d0386987a','7c97713e168f4cc7ab1b36a91fda13b2','983d7587e8ec4e4a9254863b4a6e861b',NULL,'1'),('4cc937a95af642e6b1c39be0be5afd5b','1d218dd260e440438cf63d35190d0f50','983d7587e8ec4e4a9254863b4a6e861b',NULL,'0'),('4d5136184aed4d74b2078db1f22d88cc','7545718838fe4221ba9a96bfc8767428','1e1f1867317048f69893dce0ba62cb09',NULL,'1'),('525f3654e4e44845a5a15fdbf3426453','c93fd6bae9eb42e397fefefe593e557e','909219807d344831b28a7422c214ece9',NULL,'0'),('5f2d3866e6aa42e89dc4570ad762640e','be34aaa149834bbfaa836f4243b6b49e','360d8e52cbd049d7a3522c7a352fdd4d',NULL,'0'),('697f9b17babd4041953c6a25f98d4564','5ba1b127913345c8a2fd9cfe211320e4','1e1f1867317048f69893dce0ba62cb09',98.00,'1'),('6c38ca270f1d422d800a6445c0faea8d','658ba9c2b4914bdba5039f18916d6baa','59b3e5d12f6b4f0d968064015025a775',NULL,'0'),('7ccb35ceb20944a0be556377ce1d9f03','8fa1fd781f5041718165b0f69878977a','b6cf166e09934570866b1ccf15696cab',NULL,'0'),('8c6d22fd03a54ecd83118e4ad62d8f42','1d218dd260e440438cf63d35190d0f50','59b3e5d12f6b4f0d968064015025a775',11.00,'0'),('a835467325634593b81f8316c8c73a31','7545718838fe4221ba9a96bfc8767428','1459b9a95fcb40cf8dcf34f412dc71ec',NULL,'0'),('b373d2898f444bdbaee07c56e9b9ec5f','9cc87d1f99c6405692f4733165e3b404','1',55.00,'1'),('d7bdf490d3d44020b97ca4a3896eb519','5b44463319d54579a42fbdf8d06e5693','ccd5b29d81fc4c95b9cf6d0cf04bd033',NULL,'0'),('df4ca50580184b15a7718bfa9fe1f225','c93fd6bae9eb42e397fefefe593e557e','360d8e52cbd049d7a3522c7a352fdd4d',NULL,'0'),('e48e652d4ccf4906be04933e47c8c86e','5b44463319d54579a42fbdf8d06e5693','0b806b7ebe4d434e91af2b616d6c041b',2.10,'0'),('ea0f9488528f43b9ab9991ff16410d2f','658ba9c2b4914bdba5039f18916d6baa','1',NULL,'1'),('ece648c6aa9c457ca46ddb54d045c380','9cc87d1f99c6405692f4733165e3b404','1e1f1867317048f69893dce0ba62cb09',NULL,'0'),('ee4584a23db3433dac297b89611c0b42','7c97713e168f4cc7ab1b36a91fda13b2','1e1f1867317048f69893dce0ba62cb09',NULL,'1'),('fc83174c2c33469387d22ef05004a34a','be34aaa149834bbfaa836f4243b6b49e','1',99.99,'1');
/*!40000 ALTER TABLE `selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `ID` varchar(32) NOT NULL DEFAULT '0',
  `name` varchar(45) DEFAULT NULL,
  `school` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `passwd` varchar(45) DEFAULT NULL,
  `student_num` int(8) DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `student_num_UNIQUE` (`student_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('1','张旭','南开大学','13516191737','917128985@qq.com','123456',1112647,0),('1a4f242fff1944bb94f4e690b41ba198','赵薇','传媒中学','20145632','weizhao@or.com','123456',20150015,0),('1d218dd260e440438cf63d35190d0f50','李恩鹏','山东一中','15623547896','epli@shandong.com','123456',20150012,0),('20aff73dd1c44fe99e7971c297333eae','张玮','天津第四十二中学','15600231589','zhangwei@nankai.edu.cn','123456',20150008,0),('23491fa2793d4762b5bedb014b24c2cd','闫继军','莲子营小学','13569875643','zhangxu199341@foxmail.c','123456',20150004,0),('31f4c50754394765865dfd4075a785b2','高迎春','黑龙江一中','13952366548','ycgao@heilj.edu','123456',20150011,0),('4da129f1e2ae4219ae0f235f036f4f31','袁莉岸','杨村一中','14536987564','lianyuan@yangcun.org','123456',20150013,0),('5b44463319d54579a42fbdf8d06e5693','刘德华','香港中学','12345645','987564863@qq.com','123456',20150016,0),('5ba1b127913345c8a2fd9cfe211320e4','黄子涵','南开大学','13546869542','9171289815@qq.com','123456',20150002,0),('5bc6626203d044768bd6e21c0a5313c8','迎水道','迎水道二中','123456789','yingshuidao@erzhong.com','123456',20150014,0),('658ba9c2b4914bdba5039f18916d6baa','王立群','十三中学','17600853112','xuzhang7@iflytek.com','123456',20150007,0),('7545718838fe4221ba9a96bfc8767428','黄子涵','张旭大学','15620582772','904323606@qq.com','123456',0,0),('7c97713e168f4cc7ab1b36a91fda13b2','倪守国','宝坻一中','13546869542','zhangxu199341@foxmail.co','123456',20150003,0),('880e451acae94e6595ef6e834fa6bb14','李旭东','南开大学','13698654214','lixudong@nankai.edu.cn','123456',20150005,0),('8fa1fd781f5041718165b0f69878977a','张旭','南开大学','13516191737','zhangxu199341@foxail.com','123456',1,0),('9cc87d1f99c6405692f4733165e3b404','张晓林','南开大学','17655236987','zhangxiaolin@nankai.edu.cn','123456',20150010,0),('be34aaa149834bbfaa836f4243b6b49e','张旭','南开大学','13516191737','zhangxu199341@foxmail.com','123456',20150001,0),('c06ea101f3ed46c2b021bb25ddd53315','张曼莉','台湾五中','12345678','taiwan@com.tai','123456',20150017,0),('c3d1bbc2a8d14aaaa553944b089e8b12','张尚','南阳一中','13956845621','zhangshang@nku.edu.cn','123456',20150009,0),('c93fd6bae9eb42e397fefefe593e557e','王朴','天津小学','13546869542','zhangxu199341@foxm.com','123456',20150006,0),('eb2a583227ec44899c5fcdc15262b49f','张艺谋','剩余大学','456789152','shengyu@com.edu','123456',20150018,0);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-30  0:42:36
