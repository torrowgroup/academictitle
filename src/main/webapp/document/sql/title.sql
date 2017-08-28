/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : title

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-08-28 10:49:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_discuss
-- ----------------------------
DROP TABLE IF EXISTS `t_discuss`;
CREATE TABLE `t_discuss` (
  `di_id` int(11) NOT NULL AUTO_INCREMENT,
  `di_averageA` double DEFAULT NULL,
  `di_averageB` double DEFAULT NULL,
  `di_averageC` double DEFAULT NULL,
  `di_rank` int(11) DEFAULT NULL,
  `di_spare` varchar(255) DEFAULT NULL,
  `pa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`di_id`),
  KEY `FK_o43dpyj04txv7o88gjmbc8t2m` (`pa_id`),
  CONSTRAINT `FK_o43dpyj04txv7o88gjmbc8t2m` FOREIGN KEY (`pa_id`) REFERENCES `t_participator` (`pa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_discuss
-- ----------------------------
INSERT INTO `t_discuss` VALUES ('1', '54', '0', '0', '1', null, '1');
INSERT INTO `t_discuss` VALUES ('2', '54', '0', '0', '1', null, '2');
INSERT INTO `t_discuss` VALUES ('3', '0', '18', '0', '6', null, '3');
INSERT INTO `t_discuss` VALUES ('4', '42', '0', '0', '1', null, '4');
INSERT INTO `t_discuss` VALUES ('5', '36', '0', '0', '3', null, '5');
INSERT INTO `t_discuss` VALUES ('6', '36', '0', '0', '4', null, '6');
INSERT INTO `t_discuss` VALUES ('7', '42', '0', '0', '2', null, '7');
INSERT INTO `t_discuss` VALUES ('8', '30', '0', '0', '5', null, '8');
INSERT INTO `t_discuss` VALUES ('9', '0', '21', '0', '7', null, '9');

-- ----------------------------
-- Table structure for t_expert
-- ----------------------------
DROP TABLE IF EXISTS `t_expert`;
CREATE TABLE `t_expert` (
  `ex_id` int(11) NOT NULL AUTO_INCREMENT,
  `ex_education` varchar(20) DEFAULT NULL,
  `ex_name` varchar(11) DEFAULT NULL,
  `ex_password` varchar(11) DEFAULT NULL,
  `ex_spare` varchar(255) DEFAULT NULL,
  `ex_userName` varchar(20) DEFAULT NULL,
  `maj_id` int(11) DEFAULT NULL,
  `ti_id` int(11) DEFAULT NULL,
  `un_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ex_id`),
  KEY `FK_1w4r5owpwmwmr371nbwjs1vl` (`maj_id`),
  KEY `FK_gkwam6i5rscke5ayf5vdnh402` (`ti_id`),
  KEY `FK_4c0b2f22tknlum9j0bvoq7ewj` (`un_id`),
  CONSTRAINT `FK_1w4r5owpwmwmr371nbwjs1vl` FOREIGN KEY (`maj_id`) REFERENCES `t_majors` (`maj_id`),
  CONSTRAINT `FK_4c0b2f22tknlum9j0bvoq7ewj` FOREIGN KEY (`un_id`) REFERENCES `t_unit` (`un_id`),
  CONSTRAINT `FK_gkwam6i5rscke5ayf5vdnh402` FOREIGN KEY (`ti_id`) REFERENCES `t_title` (`ti_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_expert
-- ----------------------------
INSERT INTO `t_expert` VALUES ('1', '本科', '1', '3', null, '3@3', '1', '1', null);
INSERT INTO `t_expert` VALUES ('2', '研究生', '4', '4', null, '4@4', '3', '3', null);
INSERT INTO `t_expert` VALUES ('3', '本科', 'jingoa', null, null, '1763608200@qq.com', '1', '5', '14');

-- ----------------------------
-- Table structure for t_majors
-- ----------------------------
DROP TABLE IF EXISTS `t_majors`;
CREATE TABLE `t_majors` (
  `maj_id` int(11) NOT NULL AUTO_INCREMENT,
  `maj_majorName` varchar(20) DEFAULT NULL,
  `maj_spare` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`maj_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_majors
-- ----------------------------
INSERT INTO `t_majors` VALUES ('1', '计算机科学与技术', null);
INSERT INTO `t_majors` VALUES ('2', '物联网', null);
INSERT INTO `t_majors` VALUES ('3', '国际贸易', null);
INSERT INTO `t_majors` VALUES ('4', '教育', null);
INSERT INTO `t_majors` VALUES ('5', '种子科学', null);
INSERT INTO `t_majors` VALUES ('6', '机械设计制造及其自动化', null);
INSERT INTO `t_majors` VALUES ('7', '化学化工', null);

-- ----------------------------
-- Table structure for t_manager
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager` (
  `ma_id` int(11) NOT NULL AUTO_INCREMENT,
  `ma_name` varchar(11) DEFAULT NULL,
  `ma_password` varchar(11) DEFAULT NULL,
  `ma_spare` varchar(255) DEFAULT NULL,
  `ma_userName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ma_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manager
-- ----------------------------
INSERT INTO `t_manager` VALUES ('1', '马黎明', '1', null, '1@1');
INSERT INTO `t_manager` VALUES ('2', '王青杰', '2', null, '2@21');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `no_id` int(11) NOT NULL AUTO_INCREMENT,
  `no_content` varchar(255) DEFAULT NULL,
  `no_head` varchar(20) DEFAULT NULL,
  `no_issueData` datetime DEFAULT NULL,
  `no_managerName` varchar(20) DEFAULT NULL,
  `no_spare` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`no_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '8-26~9-26', '评审时间', '2017-08-26 17:12:31', '王青杰', null);
INSERT INTO `t_notice` VALUES ('2', '', '掌机的撒事u该毒死安华赛减少对哦啊的哦啊', '2017-08-26 17:14:09', '王青杰', null);
INSERT INTO `t_notice` VALUES ('3', '时间8/23～9/23，参评人数为20人', '开始评议', '2017-08-27 14:32:44', '马黎明', null);

-- ----------------------------
-- Table structure for t_participator
-- ----------------------------
DROP TABLE IF EXISTS `t_participator`;
CREATE TABLE `t_participator` (
  `pa_id` int(11) NOT NULL AUTO_INCREMENT,
  `pa_email` varchar(30) DEFAULT NULL,
  `pa_imageUrl` varchar(255) DEFAULT NULL,
  `pa_introduce` longtext,
  `pa_name` varchar(11) DEFAULT NULL,
  `pa_spare` varchar(255) DEFAULT NULL,
  `maj_id` int(11) DEFAULT NULL,
  `ti_id` int(11) DEFAULT NULL,
  `un_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pa_id`),
  KEY `FK_g4is57rxjh0kwvtjp27vak8vc` (`maj_id`),
  KEY `FK_kxbqnbhjcf3oc196cgave7yo9` (`ti_id`),
  KEY `FK_d7qgwuftf6iayfalha4wipcsp` (`un_id`),
  CONSTRAINT `FK_d7qgwuftf6iayfalha4wipcsp` FOREIGN KEY (`un_id`) REFERENCES `t_unit` (`un_id`),
  CONSTRAINT `FK_g4is57rxjh0kwvtjp27vak8vc` FOREIGN KEY (`maj_id`) REFERENCES `t_majors` (`maj_id`),
  CONSTRAINT `FK_kxbqnbhjcf3oc196cgave7yo9` FOREIGN KEY (`ti_id`) REFERENCES `t_title` (`ti_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_participator
-- ----------------------------
INSERT INTO `t_participator` VALUES ('1', '1763608200@qq.com', 'b0dd6632e55cd7fc146d85a115d17621.jpg', '<p>大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法<br></p><p><br></p>', '张三', null, '3', '5', '16');
INSERT INTO `t_participator` VALUES ('2', '1329148394@qq.com', '38e892c658ad36a7c86379e43bd41141.jpg', '<p>大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法<br></p><p><br></p>', '刘军辉', null, '3', '4', '16');
INSERT INTO `t_participator` VALUES ('3', '2181550591@qq.com', 'a2296097dcef45bf9e96e99aa57bce0d.jpg', '<p>大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法<br></p><p><br></p>', '孙记风', null, '1', '1', '14');
INSERT INTO `t_participator` VALUES ('4', '12245441@163.com', '353afaa21bdecbd6f83803b946ce3721.jpg', '<p>大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法<br></p><p><br></p>', '王二', null, '1', '1', '14');
INSERT INTO `t_participator` VALUES ('5', '12312311@163.com', '297e9eb707406f5d90dec00fc1703300.jpg', '<p>大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法<br></p><p><br></p>', '李四', null, '1', '1', '14');
INSERT INTO `t_participator` VALUES ('6', '1231313@163.com', '19e4f513028f16305438854f9861fe03.jpg', '<p>大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法<br></p><p><br></p>', '麻子', null, '1', '1', '14');
INSERT INTO `t_participator` VALUES ('7', '156131@163.com', '353afaa21bdecbd6f83803b946ce3721.jpg', '<p>大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法<br></p><p><br></p>', '王德军', null, '1', '1', '14');
INSERT INTO `t_participator` VALUES ('8', '11313@163.com', '38e892c658ad36a7c86379e43bd41141.jpg', '<p>大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，<br></p><p><br></p>', '李阳', null, '1', '1', '14');
INSERT INTO `t_participator` VALUES ('9', '12313@163.com', '297e9eb707406f5d90dec00fc1703300.jpg', '<p>大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，<br></p><p><br></p>', '章宇', null, '1', '1', '14');
INSERT INTO `t_participator` VALUES ('10', '1231313@163.com', '297e9eb707406f5d90dec00fc1703300.jpg', '<p>大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，先后组建法学院义工志愿者协会、法大学四年，一直担任学院、学校学生会、青年志愿者协会干部，在四年的学生工作中，养成了良好的团队协作能力，<br></p><p><br></p>', '伍德', null, '4', '3', '15');

-- ----------------------------
-- Table structure for t_record
-- ----------------------------
DROP TABLE IF EXISTS `t_record`;
CREATE TABLE `t_record` (
  `re_id` int(11) NOT NULL AUTO_INCREMENT,
  `re_educate` int(11) DEFAULT NULL,
  `re_morality` int(11) DEFAULT NULL,
  `re_scientific` int(11) DEFAULT NULL,
  `re_score` int(11) DEFAULT NULL,
  `re_spare` varchar(255) DEFAULT NULL,
  `re_unfm` varchar(5) DEFAULT NULL,
  `di_id` int(11) DEFAULT NULL,
  `ex_id` int(11) DEFAULT NULL,
  `pa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`re_id`),
  KEY `FK_pu5h32pu2oyqbliwdt76ujmfv` (`di_id`),
  KEY `FK_98dxcu9bc45li1imf5jjtnv48` (`ex_id`),
  KEY `FK_8xqmio30bo2q6vntil5i3bo42` (`pa_id`),
  CONSTRAINT `FK_8xqmio30bo2q6vntil5i3bo42` FOREIGN KEY (`pa_id`) REFERENCES `t_participator` (`pa_id`),
  CONSTRAINT `FK_98dxcu9bc45li1imf5jjtnv48` FOREIGN KEY (`ex_id`) REFERENCES `t_expert` (`ex_id`),
  CONSTRAINT `FK_pu5h32pu2oyqbliwdt76ujmfv` FOREIGN KEY (`di_id`) REFERENCES `t_discuss` (`di_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_record
-- ----------------------------
INSERT INTO `t_record` VALUES ('1', '30', '30', '30', '54', null, 'A', '1', '1', '1');
INSERT INTO `t_record` VALUES ('2', '30', '30', '30', '54', null, 'A', '2', '1', '2');
INSERT INTO `t_record` VALUES ('3', '20', '20', '20', '18', null, 'B', '3', '1', '3');
INSERT INTO `t_record` VALUES ('4', '30', '20', '20', '42', null, 'A', '4', '1', '4');
INSERT INTO `t_record` VALUES ('5', '30', '10', '20', '36', null, 'A', '5', '1', '5');
INSERT INTO `t_record` VALUES ('6', '20', '20', '20', '36', null, 'A', '6', '1', '6');
INSERT INTO `t_record` VALUES ('7', '20', '30', '20', '42', null, 'A', '7', '1', '7');
INSERT INTO `t_record` VALUES ('8', '30', '0', '20', '30', null, 'A', '8', '1', '8');
INSERT INTO `t_record` VALUES ('9', '10', '30', '30', '21', null, 'B', '9', '1', '9');

-- ----------------------------
-- Table structure for t_require
-- ----------------------------
DROP TABLE IF EXISTS `t_require`;
CREATE TABLE `t_require` (
  `re_id` int(11) NOT NULL AUTO_INCREMENT,
  `re_educate` varchar(255) DEFAULT NULL,
  `re_morality` varchar(255) DEFAULT NULL,
  `re_scientific` varchar(255) DEFAULT NULL,
  `re_spare` varchar(255) DEFAULT NULL,
  `ti_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`re_id`),
  KEY `FK_md58jsptfpgf6fte8u1cxwxch` (`ti_id`),
  CONSTRAINT `FK_md58jsptfpgf6fte8u1cxwxch` FOREIGN KEY (`ti_id`) REFERENCES `t_title` (`ti_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_require
-- ----------------------------
INSERT INTO `t_require` VALUES ('1', '其在培养工程科技人才方面做出的成就和贡献，执导过进步青年', '是否教育学生及青年以人为本', '重大工程设计、研制、建造、运行、管理及工程技术应用中，创造性地解决关键科学技术问题有重大贡献；或为某重要工程科技领域的奠基者和开拓者。以上各项中都包括其在培养工程科技人才方面做出的成就和贡献', null, '1');
INSERT INTO `t_require` VALUES ('2', '近五年来系统担任过2门课程全部教学工作，完成学校规定教学工作量。教学水平高，教学效果好，在全省本专业领域内有一定的影响，近5年学校年度教学质量考核均在“合格”以上，其中至少2次为“优秀”。', '系统指导过青年教师，成绩突出。本地区小学、幼儿园领域具有较高的影响力', '积极参与教学改革，教学业绩突出，获得校级以上教学名师、市级以上学科带头人、省“青蓝工程”优秀青年骨干教师等称号；或获得校级优秀教学成果一等奖1项以上（前2名）；或担任省级教学团队、品牌专业、特色专业、精品课程、双语教学示范课程项目主要负责人2年以上（前3名），应有正式的立项报告或聘任决定。', null, '4');
INSERT INTO `t_require` VALUES ('3', '指导，进步青年，优秀学生2年以上', '学风正派，院士应具备的职业道德、科学态度和献身精神', '被提名人在上述领域具体组织、参加工程项目的实践，并在实践中以先进的管理理论为指导，创造性地发挥管理科学的作用，促使工程项目优质、高效实施，取得众所公认的成就，或在工程管理理论上有重大建树，并通过实践取得具体业绩。', null, '5');
INSERT INTO `t_require` VALUES ('4', '热爱本职工作，具有积极心态；具备较强的语言表达能力，善于沟通； 具备丰富、扎实的专业知识；', '对教学工作有浓厚的兴趣；具有一定的实践经验和相关阅历； ', '需要本专业或相近专业论文三篇，公开发表，省级刊物', null, '3');

-- ----------------------------
-- Table structure for t_title
-- ----------------------------
DROP TABLE IF EXISTS `t_title`;
CREATE TABLE `t_title` (
  `ti_id` int(11) NOT NULL AUTO_INCREMENT,
  `ti_spare` varchar(255) DEFAULT NULL,
  `ti_titleName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ti_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_title
-- ----------------------------
INSERT INTO `t_title` VALUES ('1', null, '教授');
INSERT INTO `t_title` VALUES ('3', null, '讲师');
INSERT INTO `t_title` VALUES ('4', null, '副教授');
INSERT INTO `t_title` VALUES ('5', null, '院士');

-- ----------------------------
-- Table structure for t_unit
-- ----------------------------
DROP TABLE IF EXISTS `t_unit`;
CREATE TABLE `t_unit` (
  `un_id` int(11) NOT NULL AUTO_INCREMENT,
  `un_spare` varchar(255) DEFAULT NULL,
  `un_unitName` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`un_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_unit
-- ----------------------------
INSERT INTO `t_unit` VALUES ('14', null, '化学化工学院');
INSERT INTO `t_unit` VALUES ('15', null, '艺术学院');
INSERT INTO `t_unit` VALUES ('16', null, '外语学院');
INSERT INTO `t_unit` VALUES ('17', null, '信息工程学院');
