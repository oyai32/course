/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80021
Source Host           : localhost:3306
Source Database       : course

Target Server Type    : MYSQL
Target Server Version : 80021
File Encoding         : 65001

Date: 2021-01-09 14:42:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `u_id` int DEFAULT NULL,
  `test_id` varchar(100) DEFAULT NULL,
  `myanswer` varchar(100) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('23', '1', 'aa02274a-27e9-4534-86b3-d5548e5772da', 'A,A,A,A,A,A,A,A,A,A,', '2021-01-09 12:26:21');

-- ----------------------------
-- Table structure for bbs
-- ----------------------------
DROP TABLE IF EXISTS `bbs`;
CREATE TABLE `bbs` (
  `bbs_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `subject` varchar(30) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `u_id` int DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bbs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs
-- ----------------------------
INSERT INTO `bbs` VALUES ('1', '计算机按其处理能力', '计算机科学与导论', '计算机按其处理能力可分为什么？', '1', '2015-04-13');
INSERT INTO `bbs` VALUES ('2', '将一张软盘设置写保护', 'Java', '将一张软盘设置写保护后，则对该软盘来说能读出盘上的信息，但不能将信息写入这张盘', '4', '2015-04-14');
INSERT INTO `bbs` VALUES ('3', '请问下有哪几种编译器 各有什么优缺点 我是个新手该用哪个好点啊', 'C语言', 'VC++ 6.0\r\n  Windows平台。目前主流的C/C++语言编译器,对于TC等的作品也具有向下兼容的特点.缺点是比较大  还有其他的编译器，例如Win tc、gcc、lcc、BC 3.1等等,事实上，编译器的选择不是最重要的，他们都可以完成基本的C语言编译。\r\n对于从未学习过计算机程序设计的读者来说，学习C语言时，建议开始选择Tc2.0,虽然不能使用鼠标，但几个快捷键的熟练运用基本上可以解决操作的问题，当然有时间的时候了解使用TC3.0就更好了；对于学习过TC2.0的读者来说，平时完全可以在TC3.0或VC 6.0下调试程序，但考试的时候如果要求必须在TC2.0下，那最好上机练习时在TC2.0下。\r\n  当然，使用如记事本等文本编辑器编辑程序，然后用TC来调试也不失为一种好方法。', '1', '2015-04-14');
INSERT INTO `bbs` VALUES ('4', '二进制转换成八进制数的方法', '计算机科学与导论', '二进制转换成八进制数的方法是什么？', '10', '2015-04-21');
INSERT INTO `bbs` VALUES ('5', '我想自学java', 'Java', '本人想自学java，不知道有没有好的视频或基础书籍推荐', '6', '2015-04-29');
INSERT INTO `bbs` VALUES ('6', '你们都是用的那个版本的jdk', 'java', '我在官网不晓得下那个版本的好，公司会要统一jdk吗', '14', '2015-04-29');
INSERT INTO `bbs` VALUES ('24', '听说最近有什么C语言讲座', 'C语言', '在哪个教室，想去看看', '1', '2015-05-02');
INSERT INTO `bbs` VALUES ('25', 'C语言跟C++哪个容易', 'C语言', '最近想学下。挑个简单的学', '1', '2015-05-02');
INSERT INTO `bbs` VALUES ('26', 'android谁会？', 'java', '求教！想做一个app', '16', '2015-05-03');

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework` (
  `h_id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(30) DEFAULT NULL,
  `give_time` varchar(20) DEFAULT NULL,
  `submit_time` varchar(20) DEFAULT NULL,
  `u_id` int DEFAULT NULL,
  `consignee` varchar(20) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`h_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of homework
-- ----------------------------
INSERT INTO `homework` VALUES ('1', 'C语言', '2015-04-17', '2015-04-19', '1', '李明', 'Doc1.doc');
INSERT INTO `homework` VALUES ('2', 'Java', '2015-04-17', '2015-04-19', '1', '李明', 'Java-2015-04-17-欧阳.doc');
INSERT INTO `homework` VALUES ('3', '高等数学', '2015-04-15', '2015-04-19', '1', '彭宇', '【高等数学】欧阳(2015-04-15).doc');
INSERT INTO `homework` VALUES ('4', 'Java', '2015-04-17', '2015-04-19', '4', '李明', 'Java-2015-04-17-何晓默.doc');
INSERT INTO `homework` VALUES ('5', 'C语言', '2015-04-20', '2015-04-21', '1', '李明', '【C语言】欧阳(2015-04-20).doc');
INSERT INTO `homework` VALUES ('11', 'C语言', '2015-05-01', '2015-05-02', '11', '李明', '【C语言】莫小贝(2015-05-01).doc');
INSERT INTO `homework` VALUES ('12', 'Java', '2015-05-02', '2015-05-03', '16', '李明', '【Java】李策(2015-05-02).doc');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `create_time` varchar(20) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('9', '2015届春季“双选会”', '2015届春季“双选会”', '2015-03-31 23:41:06');
INSERT INTO `post` VALUES ('11', '“三八”国际妇女节趣味活动', '“三八”国际妇女节趣味活动', '2015-03-31 23:41:06');
INSERT INTO `post` VALUES ('12', '教职工院歌合唱比赛', '教职工院歌合唱比赛', '2015-03-31 23:41:06');
INSERT INTO `post` VALUES ('13', '顺利开展寝室挂牌制度', '顺利开展寝室挂牌制度', '2015-03-31 23:41:06');
INSERT INTO `post` VALUES ('14', '放假安排及作息时间调整的通知', '放假安排及作息时间调整的通知', '2015-03-31 23:41:06');
INSERT INTO `post` VALUES ('17', '2015年“清明”“五一”值班安排', '2015年“清明”“五一”值班安排', '2015-04-01 23:02:02');
INSERT INTO `post` VALUES ('24', '2015年全国大学生英语竞赛初赛', '    4月12日上午， 2015年全国大学生英语竞赛(NECCS)南昌航空大学科技学院初赛在九大楼正式举行。本次竞赛共有309名学生报名参加，涉及B、C、D三个类别。文学与艺术学部于考前进行了有条不紊的备考工作，同时也得到了我院其他部门的通力配合。\r\n    竞赛期间，考场秩序良好。科技学院副院长谢友宝、文学与艺术学部主任陈利卿、文学与艺术学部党总支书记何宇以及教学与科研办公室副主任周辉迎等巡视了考场。竞赛结束后，外语系按照全国大学生英语竞赛组委会阅卷的相关要求，组织英语教师及时对试卷进行了评阅，最终评选出6名同学代表我院参加2015年全国大学生英语竞赛江西省决赛。 \r\n    据悉，全国大学生英语竞赛(NECCS)是全国唯一的大学生英语综合能力竞赛活动，是我国高校英语教学的一项重要的评价手段和激励机制，对提高高校英语学科地位和英语教学水平有较大的促进作用。在此，预祝我院选拔出的6名同学在5月10日的江西省决赛中再创佳绩，为我院增光添彩！', '2015-05-02 22:24:09');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `reply_id` int NOT NULL AUTO_INCREMENT,
  `bbs_id` int DEFAULT NULL,
  `u_id` int DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('1', '2', '1', '想想', '2015-04-14 20:43:38');
INSERT INTO `reply` VALUES ('2', '2', '1', '大幅度释放的是', '2015-04-14 21:00:29');
INSERT INTO `reply` VALUES ('5', '3', '10', 'VC++ 6.0', '2015-04-21 22:48:23');
INSERT INTO `reply` VALUES ('6', '1', '10', '巨型机、大型机、小型机和微型机', '2015-04-21 22:54:50');
INSERT INTO `reply` VALUES ('7', '2', '2', '能读出盘上的信息，但不能将信息写入这张盘 ', '2015-04-22 21:17:13');
INSERT INTO `reply` VALUES ('15', '1', '2', '正确', '2015-04-22 21:29:40');
INSERT INTO `reply` VALUES ('16', '5', '1', '低低的', '2015-05-02 12:17:36');
INSERT INTO `reply` VALUES ('17', '5', '1', 'hello', '2015-05-02 12:18:34');
INSERT INTO `reply` VALUES ('18', '5', '1', '你好', '2015-05-02 12:18:40');
INSERT INTO `reply` VALUES ('19', '4', '1', '啊', '2015-05-02 12:19:27');
INSERT INTO `reply` VALUES ('20', '25', '1', '打分', '2015-05-02 12:19:46');
INSERT INTO `reply` VALUES ('21', '6', '1', '打酱油', '2015-05-02 12:21:51');
INSERT INTO `reply` VALUES ('22', '24', '1', '啦啦啦', '2015-05-02 14:36:54');
INSERT INTO `reply` VALUES ('23', '24', '1', '大傻蛋', '2015-05-02 14:40:48');
INSERT INTO `reply` VALUES ('24', '24', '1', '时候多少', '2015-05-02 14:40:50');
INSERT INTO `reply` VALUES ('25', '24', '1', '苏打粉', '2015-05-02 14:40:54');
INSERT INTO `reply` VALUES ('26', '24', '1', '斯蒂芬', '2015-05-02 14:40:57');
INSERT INTO `reply` VALUES ('27', '26', '16', '有木有人？', '2015-05-03 21:26:45');
INSERT INTO `reply` VALUES ('28', '24', '2', 'ddd', '2021-01-09 11:37:54');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `test_id` varchar(100) NOT NULL,
  `alltopic` varchar(100) DEFAULT NULL,
  `allanswer` varchar(100) DEFAULT NULL,
  `u_id` int DEFAULT NULL,
  `subject` varchar(30) DEFAULT NULL,
  `difficulty` varchar(10) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('15ff763f-ba1e-4848-af73-50274a6d8e4e', '25,5,29,19,27,31,37,18,20,16,', 'C,C,B,C,D,B,A,B,D,C,', '1', 'c', '简单', '2021-01-09 12:22:11');
INSERT INTO `test` VALUES ('2de36977-0936-4a18-9e5d-7d61294d36a6', '26,14,31,15,35,17,25,18,19,27,', 'A,D,B,D,A,A,C,B,C,D,', '1', 'C', '简单', '2021-01-09 12:27:42');
INSERT INTO `test` VALUES ('7be4a2d6-80c1-443f-ad01-a88099a87493', '18,29,12,17,16,27,7,28,36,31,', 'B,B,B,A,C,D,C,B,D,B,', '1', 'C', '简单', '2021-01-09 12:25:04');
INSERT INTO `test` VALUES ('9e1cab0c-dde8-484e-a6e3-90f2a4d241f2', '26,16,36,31,37,12,25,19,27,7,', 'A,C,D,B,A,B,C,C,D,C,', '1', 'c', '简单', '2021-01-09 12:22:22');
INSERT INTO `test` VALUES ('aa02274a-27e9-4534-86b3-d5548e5772da', '37,28,18,20,26,16,34,17,12,5,', 'A,B,B,D,A,C,A,A,B,C,', '1', 'C', '简单', '2021-01-09 12:25:26');
INSERT INTO `test` VALUES ('f6af3cb4-fe78-4171-bd3d-4f1c195fc138', '5,30,26,17,20,27,12,7,29,18,', 'C,A,A,A,D,D,B,C,B,B,', '1', 'c', '简单', '2021-01-09 12:22:32');

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `t_id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(30) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `optiona` varchar(200) DEFAULT NULL,
  `optionb` varchar(200) DEFAULT NULL,
  `optionc` varchar(200) DEFAULT NULL,
  `optiond` varchar(200) DEFAULT NULL,
  `answer` varchar(10) DEFAULT NULL,
  `difficulty` varchar(10) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  `u_id` int DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('5', 'C', '十进制数68转换成二进制是（  ）。 ', '1010000', '1000101', '1000100', '1000001', 'C', '简单', '2015-04-08', '1');
INSERT INTO `topic` VALUES ('7', 'C', '计算机按其处理能力可分为（  ）', '通用机和专用机', '电子模拟计算机和电子数字计算机', '巨型机、大型机、小型机和微型机', '386、486、586', 'C', '简单', '2015-04-09', '1');
INSERT INTO `topic` VALUES ('12', 'C', '将一张软盘设置写保护后，则对该软盘来说，下列说法正确的是（  ）。 ', '不能读出盘上的信息，也不能将信息写入这张盘', '能读出盘上的信息，但不能将信息写入这张盘 ', '能读出盘上的信息，也能将信息写入这张盘', '不能读出盘上的信息，但能将信息写入这张盘 ', 'B', '简单', '2015-04-09', '1');
INSERT INTO `topic` VALUES ('14', 'C', '计算机系统中,“字节(Byte)”的描述性定义是（  ） ', '把计算机中的每一个汉字或英文单词分成几个部分,其中的每一部分就叫一个字节', '计算机系统中，在存储、传送或操作时，作为一个单元的一组字符或一组二进制位 ', '度量信息的最小单位,是一位二进制位所包含的信息量 ', '通常用8位二进制位组成,可代表一个数字、一个字母或一个特殊符号。也常用来量度计算机存储容量的大小', 'D', '简单', '2015-04-09', '1');
INSERT INTO `topic` VALUES ('15', 'C', '下列设备中，属于计算机外部设备的是（  ）。 ', '控制器', '运算器 ', '主存储器', 'CD—ROM ', 'D', '简单', '2015-04-09', '1');
INSERT INTO `topic` VALUES ('16', 'C', '（  ）的通用性好、软件丰富、价格低廉，主要在办公室和家庭中使用，是目前发展最快、应用最广泛的一种计算机。', '工作站', '微型机', '巨型机', '大型机', 'C', '简单', '2015-04-11', '1');
INSERT INTO `topic` VALUES ('17', 'C', '十进制数59.125转换成八进制数是（  ）。 ', '73.1', '75.1 ', '79.125', '73.12 ', 'A', '简单', '2015-04-08', '1');
INSERT INTO `topic` VALUES ('18', 'C', '“一线联五洲”、“地球村”是计算机在（  ）方面的应用。 ', '人工智能', '网络与通信 ', '信息管理', '科学计算', 'B', '简单', '2015-04-09', '1');
INSERT INTO `topic` VALUES ('19', 'C', '在计算机主存中，能用于存取信息的部件是（  ）存储器', '软盘 ', '硬盘 ', 'RAM', 'ROM', 'C', '简单', '2015-04-09', '1');
INSERT INTO `topic` VALUES ('20', 'C', '在计算机领域中，通常用英文单词“BYTE”来表示（  ）。 ', '字', '字长', '二进制位', '字节 ', 'D', '简单', '2015-04-09', '1');
INSERT INTO `topic` VALUES ('25', 'C', '扫描仪是属于（  ）。 ', 'CPU ', '存储器 ', '输入设备', '输出设备 ', 'C', '简单', '2015-04-14', '1');
INSERT INTO `topic` VALUES ('26', 'C', 'CPU的中文含义是（  ）。', '中央处理器', '外存储器 ', '微机系统', '微处理器 ', 'A', '简单', '2015-04-14', '1');
INSERT INTO `topic` VALUES ('27', 'C', '系统软件中最重要的是（  ）。', '数据库管理系统', '语言处理程序', '工具软件', '操作系统', 'D', '简单', '2015-04-14', '1');
INSERT INTO `topic` VALUES ('28', 'C', '关于微机硬盘与软盘的比较，正确的说法是（  ） ', '软盘属外存而硬盘属内存', '软盘容量较小而硬盘容量较大 ', '软盘读写速度较快而硬盘较慢', '软盘有驱动器而硬盘没有 ', 'B', '简单', '2015-04-14', '1');
INSERT INTO `topic` VALUES ('29', 'C', '为方便记忆、阅读和编程，把机器语言进行符号化，相应的语言称为（  ）。', '高级语言', '汇编语言', 'C语言', 'VB语言 ', 'B', '简单', '2015-04-14', '1');
INSERT INTO `topic` VALUES ('30', 'C', '为了避免混乱，十六进制数在书写时常在后面加上字母（  ）。 ', 'H', 'B ', 'D', 'A ', 'A', '简单', '2015-04-14', '1');
INSERT INTO `topic` VALUES ('31', 'C', '在计算机中设有某进制数2＋7＝10，根据这个运算规则，那么4＋8=（  ）', '14', '13', '12', '11', 'B', '简单', '2015-04-14', '1');
INSERT INTO `topic` VALUES ('34', 'C', '十进制数转化为八进制数，小数部分的转化采用（  ）。 ', '除8取余法', '乘8取整法 ', '乘8取余法', '除8取整法 ', 'A', '简单', '2021-01-09', '2');
INSERT INTO `topic` VALUES ('35', 'C', '与十六进制数AD等值的二进数是（  ）', '10101010', '10101110', '10101111', '10101101 ', 'A', '简单', '2021-01-09', '2');
INSERT INTO `topic` VALUES ('36', 'C', '微型计算机中使用的学生档案管理系统，属下列计算机应用中的（  ）', '人工智能', '过程控制', '科学计算', '信息管理', 'D', '简单', '2021-01-09', '2');
INSERT INTO `topic` VALUES ('37', 'C', 'CPU的中文含义是（  ）', '中央处理器', '外存储器', '微机系统', '微处理器', 'A', '简单', '2021-01-09', '2');
INSERT INTO `topic` VALUES ('38', 'C', '用户从键盘上输入的汉字编码被称为（  ） ', '输入码', '国标码', '区位码', '字形码', 'A', '简单', '2021-01-09', '2');

-- ----------------------------
-- Table structure for upload
-- ----------------------------
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int NOT NULL AUTO_INCREMENT COMMENT '上传表',
  `u_id` int NOT NULL COMMENT '上传人id',
  `subject` varchar(30) DEFAULT NULL COMMENT '科目',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `size` varchar(10) DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL COMMENT '路径',
  `upload_time` varchar(20) DEFAULT NULL COMMENT '上传时间',
  `ext` varchar(5) DEFAULT NULL COMMENT '后缀',
  `del` int DEFAULT '1' COMMENT '删除标记  正常：1   删除：0',
  PRIMARY KEY (`upload_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upload
-- ----------------------------
INSERT INTO `upload` VALUES ('8', '1', 'c语言', '01第一章定义变量', '2.6 MB', '/course/upload/01第一章定义变量.ppt', '2015-04-17', 'ppt', '1');
INSERT INTO `upload` VALUES ('9', '4', 'c语言', '02第二章编写可执行的语句', '174 KB', '/course/upload/02第二章编写可执行的语句.ppt', '2015-04-17', 'ppt', '1');
INSERT INTO `upload` VALUES ('10', '2', 'c语言', 'datebase', '97.5 KB', '/course/upload/datebase.pdf', '2015-04-17', 'pdf', '1');
INSERT INTO `upload` VALUES ('11', '2', 'c语言', '实验5.第六章', '111 KB', '/course/upload/实验5.第六章.doc', '2015-04-17', 'doc', '1');
INSERT INTO `upload` VALUES ('12', '5', 'c语言', '实验3.第四章', '196 KB', '/course/upload/实验3.第四章.doc', '2015-04-17', 'doc', '1');
INSERT INTO `upload` VALUES ('13', '2', 'c语言', '05第五章复合数据类型', '113 KB', '/course/upload/05第五章复合数据类型.ppt', '2015-04-17', 'ppt', '1');
INSERT INTO `upload` VALUES ('16', '2', 'c语言', 'C程序彩票游戏设计', '33.5 KB', '/course/upload/C程序彩票游戏设计.doc', '2015-04-19', 'doc', '1');
INSERT INTO `upload` VALUES ('17', '2', 'c语言', '课程设计报告模板', '1.6 MB', '/course/upload/课程设计报告模板.doc', '2015-04-19', 'doc', '1');
INSERT INTO `upload` VALUES ('19', '2', 'c++', '05第五章复合数据类型', '113 KB', '/course/upload/05第五章复合数据类型.ppt', '2015-04-21', 'ppt', '1');
INSERT INTO `upload` VALUES ('20', '2', 'java', '英文翻译', '429 KB', '/course/upload/英文翻译.pdf', '2015-04-22', 'pdf', '1');
INSERT INTO `upload` VALUES ('21', '2', 'c语言', 'news', '27.5 KB', '/course/upload/news.doc', '2015-05-02', 'doc', '1');
INSERT INTO `upload` VALUES ('22', '2', 'c语言', '英文翻译2', '429 KB', '/course/upload/英文翻译2.pdf', '2015-05-03', 'pdf', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `subject` varchar(30) DEFAULT NULL,
  `school` varchar(30) DEFAULT NULL,
  `role` int DEFAULT NULL COMMENT '1、管理员 2、教师  3、学生',
  `del` int DEFAULT '1' COMMENT '冻结 0  正常1',
  `create_time` varchar(20) DEFAULT NULL COMMENT '注册日期',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'student', '123456', '欧阳', null, '南昌航空大学科技学院', '3', '1', '2015-03-30 23:36:04');
INSERT INTO `user` VALUES ('2', 'teacher', '123456', '李明', 'C语言,Java', '南昌航空大学科技学院', '2', '1', '2015-03-30 23:37:42');
INSERT INTO `user` VALUES ('3', 'admin', 'admin', 'admin', null, '', '1', '1', '2015-03-31 19:57:31');
INSERT INTO `user` VALUES ('4', 'hexiaomo', 'hexiaomo', '何晓默', null, '南昌航空大学科技学院', '3', '1', '2015-04-10 23:37:42');
INSERT INTO `user` VALUES ('5', 'zhouqintian', 'zhouqintian', '周秦天', null, '南昌航空大学科技学院', '3', '1', '2015-04-10 23:37:42');
INSERT INTO `user` VALUES ('6', 'zhoumoli', 'zhoumoli', '周默丽', null, '南昌航空大学科技学院', '3', '1', '2015-04-21 20:21:39');
INSERT INTO `user` VALUES ('10', 'lipingyi', '000000', '李平易', null, '南昌航空大学科技学院', '3', '0', '2015-04-21 20:28:38');
INSERT INTO `user` VALUES ('11', 'moxiaobei', 'moxiaobei', '莫小贝', null, '南昌航空大学科技学院', '3', '1', '2015-04-21 20:41:29');
INSERT INTO `user` VALUES ('12', 'pengyu', '111111', '彭宇', '高等数学,', '南昌航空大学科技学院', '2', '1', '2015-04-25 21:18:41');
INSERT INTO `user` VALUES ('14', 'heyiheyi', '123456', '何毅', null, '南昌航空大学科技学院', '3', '1', '2015-04-29 22:00:13');
INSERT INTO `user` VALUES ('16', 'licelice', '123456', '李策', null, '南昌航空大学科技学院', '3', '1', '2015-05-03 21:17:12');
INSERT INTO `user` VALUES ('17', 'xiangping', '000000', '肖平', 'Java,C语言,', '南昌航空大学科技学院', '2', '1', '2015-05-03 22:00:53');
