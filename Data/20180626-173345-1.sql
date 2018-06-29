
-- -----------------------------
-- Table structure for `lk_ad`
-- -----------------------------
DROP TABLE IF EXISTS `lk_ad`;
CREATE TABLE `lk_ad` (
  `cid` int(11) NOT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `picurl` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `lk_ad`
-- -----------------------------
INSERT INTO `lk_ad` VALUES ('2', '2', '按时', '/uploads/20180607/3de6fc06696b889c580803f85a6a0594.jpg', '/uploads/thumb/3de6fc06696b889c580803f85a6a0594.jpg');
INSERT INTO `lk_ad` VALUES ('2', '3', '1', '/uploads/20180607/05b7f9c2b877e7b3139056278076143a.jpg', '/uploads/thumb/05b7f9c2b877e7b3139056278076143a.jpg');
INSERT INTO `lk_ad` VALUES ('2', '4', '2', '/uploads/20180607/d8d69faa4c9cda686f76bba00d6f6ab9.jpg', '/uploads/thumb/d8d69faa4c9cda686f76bba00d6f6ab9.jpg');

-- -----------------------------
-- Table structure for `lk_admin`
-- -----------------------------
DROP TABLE IF EXISTS `lk_admin`;
CREATE TABLE `lk_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `logintime` varchar(30) NOT NULL,
  `loginip` varchar(30) NOT NULL,
  `regtime` varchar(30) NOT NULL,
  `groupid` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `status` enum('true','false') NOT NULL DEFAULT 'true',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `lk_admin`
-- -----------------------------
INSERT INTO `lk_admin` VALUES ('1', '575074803@qq.com', '大脸猫', 'http://catlkk.oss-cn-beijing.aliyuncs.com/public/logo.jpg', '2086ff4ed10be2479a784ffc3d016e52', '', '1529984830', '127.0.0.1', '1529983824', '1', '1', 'true');
INSERT INTO `lk_admin` VALUES ('2', 'cat_lkk@163.com', 'cat_lkk@163.com', 'http://catlkk.oss-cn-beijing.aliyuncs.com/public/logo.jpg', '2086ff4ed10be2479a784ffc3d016e52', '', '1529995515', '127.0.0.1', '1529995515', '1', '1', 'true');

-- -----------------------------
-- Table structure for `lk_adtype`
-- -----------------------------
DROP TABLE IF EXISTS `lk_adtype`;
CREATE TABLE `lk_adtype` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `picurl` varchar(255) NOT NULL,
  `open` enum('true','false') NOT NULL DEFAULT 'true',
  `thumb` varchar(255) NOT NULL,
  `orderid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `lk_article`
-- -----------------------------
DROP TABLE IF EXISTS `lk_article`;
CREATE TABLE `lk_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `classid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `picurl` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `linkurl` varchar(255) DEFAULT NULL,
  `content` longtext,
  `keywords` varchar(255) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `hits` varchar(255) NOT NULL,
  `addtime` varchar(30) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `open` enum('true','false') NOT NULL DEFAULT 'true',
  `zan` varchar(255) NOT NULL,
  `cai` varchar(255) NOT NULL,
  `orderid` int(11) NOT NULL,
  `is_del` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'true=删除  false=没有删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `lk_auth_rule`
-- -----------------------------
DROP TABLE IF EXISTS `lk_auth_rule`;
CREATE TABLE `lk_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `href` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `icon` varchar(20) DEFAULT NULL COMMENT '样式',
  `pid` int(5) NOT NULL DEFAULT '0' COMMENT '父栏目ID',
  `pidstr` varchar(255) NOT NULL COMMENT '父id 集合',
  `orderid` int(11) DEFAULT '0' COMMENT '排序',
  `open` enum('true','false') DEFAULT 'true',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- -----------------------------
-- Records of `lk_auth_rule`
-- -----------------------------
INSERT INTO `lk_auth_rule` VALUES ('1', 'system/website', '设置', 'set', '0', '0', '1', 'true');

-- -----------------------------
-- Table structure for `lk_brand`
-- -----------------------------
DROP TABLE IF EXISTS `lk_brand`;
CREATE TABLE `lk_brand` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `brandname` varchar(255) NOT NULL,
  `brandid` int(11) NOT NULL,
  `href` varchar(255) NOT NULL,
  `open` enum('true','false') NOT NULL DEFAULT 'true',
  `orderid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `lk_category`
-- -----------------------------
DROP TABLE IF EXISTS `lk_category`;
CREATE TABLE `lk_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catename` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL,
  `linkurl` varchar(255) NOT NULL,
  `status` enum('true','false') NOT NULL DEFAULT 'true',
  `orderid` int(11) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `picurl` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `lk_category`
-- -----------------------------
INSERT INTO `lk_category` VALUES ('1', '首页', '0', 'index/index', 'true', '1', '首页', '首页2', '');

-- -----------------------------
-- Table structure for `lk_chatlog`
-- -----------------------------
DROP TABLE IF EXISTS `lk_chatlog`;
CREATE TABLE `lk_chatlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fromid` int(11) NOT NULL COMMENT '会话来源id',
  `fromname` varchar(155) NOT NULL DEFAULT '' COMMENT '消息来源用户名',
  `fromavatar` varchar(155) NOT NULL DEFAULT '' COMMENT '来源的用户头像',
  `toid` int(11) NOT NULL COMMENT '会话发送的id',
  `content` text NOT NULL COMMENT '发送的内容',
  `timeline` int(10) NOT NULL COMMENT '记录时间',
  `type` varchar(55) NOT NULL COMMENT '聊天类型',
  `needsend` tinyint(1) DEFAULT '0' COMMENT '0 不需要推送 1 需要推送',
  PRIMARY KEY (`id`),
  KEY `fromid` (`fromid`) USING BTREE,
  KEY `toid` (`toid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `lk_chatlog`
-- -----------------------------
INSERT INTO `lk_chatlog` VALUES ('13', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[微笑] 常常在想，尽管对这个国家有这样那样的抱怨，但我们的确生在了最好的时代 \r\n铭记、感恩 \r\n所有为中华民族浴血奋战的英雄将士 ', '1528941255', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('14', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[疑问] ', '1528941265', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('15', '2', '临时1528941362', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '你好', '1528941375', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('16', '2', '临时1528941362', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '我', '1528941428', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('17', '2', '临时1528941362', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '我在这里等你回来', '1528941443', 'group', '1');
INSERT INTO `lk_chatlog` VALUES ('18', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[囧] ', '1528941632', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('19', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[亲亲] ', '1528941641', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('20', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[嘻嘻] ', '1528941717', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('21', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[哈哈] ', '1528941742', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('22', '4', '临时1528941831', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'sd ', '1528941846', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('23', '4', '临时1528941831', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[互粉] ', '1528941861', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('24', '4', '临时1528941831', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'meyiou ', '1528941882', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('25', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[熊猫] ', '1528942032', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('26', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[给力] ', '1528942368', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('27', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[哼] ', '1528943260', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('28', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[围观] ', '1528943449', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('29', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[围观] ', '1528943463', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('30', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[礼物] ', '1528943486', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('31', '2', '临时1528941362', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '你好', '1528943520', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('32', '2', '临时1528941362', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '你', '1528943536', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('33', '2', '临时1528941362', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '我', '1528943622', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('34', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[耶] ', '1528943631', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('35', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[拜拜] ', '1528943643', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('36', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'pemh', '1528943723', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('37', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'peng', '1528943728', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('38', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'peng', '1528943749', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('39', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[耶] ', '1528943823', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('40', '6', '临时1528943820', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[睡] ', '1528943837', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('41', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[熊猫] ', '1528944134', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('42', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[兔子] ', '1528944390', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('43', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[浮云] ', '1528944402', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('44', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[互粉] ', '1528944415', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('45', '2', '临时1528941362', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '我', '1528944442', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('46', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[给力] ', '1528944522', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('47', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[抱抱] ', '1528944680', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('48', '2', '临时1528941362', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '受不了了', '1528944704', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('49', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[good] ', '1528944951', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('50', '2', '临时1528941362', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '倒霉孩子', '1528945397', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('51', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'daomei', '1528945481', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('52', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[鼓掌] ', '1528945493', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('53', '2', '临时1528941362', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'shenm', '1528945516', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('54', '7', '临时1528945600', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[可爱] ', '1528945697', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('55', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[兔子] ', '1528945745', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('56', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[兔子] ', '1528945778', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('57', '2', '临时1528941362', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '我', '1528945807', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('58', '8', '临时1528945878', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '12112', '1528945888', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('59', '8', '临时1528945878', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '121212', '1528945894', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('60', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[good] ', '1528945979', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('61', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[兔子] ', '1528945992', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('62', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[失望] ', '1528946004', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('63', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[兔子] ', '1528946162', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('64', '8', '临时1528945878', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[微笑] ', '1528946172', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('65', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'ren ', '1528946181', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('66', '8', '临时1528945878', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '211212', '1528946185', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('67', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'renchong', '1528946185', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('68', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'nice', '1528946192', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('69', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'chijie', '1528946194', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('70', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'chiji', '1528946197', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('71', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[熊猫] ', '1528946280', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('72', '10', '临时1528946365', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '哈喽', '1528946388', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('73', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[ok] ', '1528946446', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('74', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[疑问] ', '1528946458', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('75', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '2', 'face[哼] ', '1528946517', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('76', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[耶] ', '1528946596', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('77', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '3', 'face[疑问] ', '1528946873', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('78', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '3', 'img[/uploads/20180614/838ea9780bfe18f4886c3779fe575373.jpg]', '1528946887', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('79', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '3', 'img[/uploads/20180614/4b5865e76b4f0ebcb9b7f3fe4e592323.jpg]', '1528946910', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('80', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '3', 'file(/uploads/20180614/26d5f87fd6e5095858163c45ab97ea18.doc)[下载文件]', '1528946914', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('81', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '3', 'wuyu', '1528947019', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('82', '2', '临时1528941362', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '你是傻子吗？', '1528947138', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('83', '2', '临时1528941362', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '呆子', '1528947164', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('84', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '2', 'face[熊猫] ', '1528947171', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('85', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '2', 'niciashi', '1528947178', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('86', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '2', '我都懒得理你', '1528947197', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('87', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '2', 'face[黑线] ', '1528947532', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('88', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[ok] ', '1528947942', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('89', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'nishidos', '1528947965', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('90', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '3', '你才是', '1528947979', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('91', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '2', '猪', '1528948000', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('92', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '11', 'face[亲亲] ', '1528950483', 'friend', '1');
INSERT INTO `lk_chatlog` VALUES ('93', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[怒] ', '1528952612', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('94', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[兔子] ', '1528952634', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('95', '1', '临时1528940037', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', 'face[失望] ', '1528953368', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('96', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '15', '呆子', '1528955312', 'friend', '1');
INSERT INTO `lk_chatlog` VALUES ('97', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '15', 'face[礼物] ', '1528955559', 'friend', '1');
INSERT INTO `lk_chatlog` VALUES ('98', '16', '临时1528955740', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '？？？', '1528955752', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('99', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '16', 'face[晕] ', '1528955771', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('100', '16', '临时1528955740', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '3', '就这个？', '1528955781', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('101', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '群里呢', '1528955802', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('102', '16', '临时1528955740', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '你是傻逼啊', '1528955810', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('103', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '16', '群里能看到吗', '1528955811', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('104', '16', '临时1528955740', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '3', '看的到', '1528955821', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('105', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '你大爷', '1528955822', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('106', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '16', '艹  让你测试一下 那么慢', '1528955838', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('107', '16', '临时1528955740', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '这个有移动端么', '1528955845', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('108', '16', '临时1528955740', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '3', '是你自己不完善', '1528955861', 'friend', '0');
INSERT INTO `lk_chatlog` VALUES ('109', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '1', '移动端 还没有搞好呢', '1528955862', 'group', '0');
INSERT INTO `lk_chatlog` VALUES ('110', '3', '临时1528941736', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '16', '这么高难度的  能搞成这样 我都不知道 花了多久时间', '1528955894', 'friend', '0');

-- -----------------------------
-- Table structure for `lk_memu`
-- -----------------------------
DROP TABLE IF EXISTS `lk_memu`;
CREATE TABLE `lk_memu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `memu_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL,
  `linkurl` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `orderid` int(11) NOT NULL,
  `status` enum('true','false') NOT NULL DEFAULT 'true',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `lk_memu`
-- -----------------------------
INSERT INTO `lk_memu` VALUES ('1', '后台首页', '0', '', 'layui-icon-home', '1', 'true');
INSERT INTO `lk_memu` VALUES ('2', '数据库管理', '0', '', 'layui-icon-template-1', '2', 'true');
INSERT INTO `lk_memu` VALUES ('3', '设置', '0', '', 'layui-icon-set', '3', 'true');
INSERT INTO `lk_memu` VALUES ('4', '栏目分类', '0', '', 'layui-icon-template', '4', 'true');
INSERT INTO `lk_memu` VALUES ('5', '用户', '0', '', 'layui-icon-user', '5', 'true');
INSERT INTO `lk_memu` VALUES ('6', '控制台', '1', 'index/index2', '', '6', 'true');
INSERT INTO `lk_memu` VALUES ('7', '数据库列表', '2', 'database/index', '', '7', 'true');
INSERT INTO `lk_memu` VALUES ('8', '数据库还原', '2', 'database/importlist', '', '8', 'false');
INSERT INTO `lk_memu` VALUES ('9', '网站设置', '3', 'system/website', '', '9', 'true');
INSERT INTO `lk_memu` VALUES ('10', '菜单设置', '3', 'memu/index', '', '10', 'true');
INSERT INTO `lk_memu` VALUES ('11', '分类列表', '4', 'category/index', '', '11', 'true');
INSERT INTO `lk_memu` VALUES ('12', '文章列表', '4', 'article/index', '', '12', 'true');
INSERT INTO `lk_memu` VALUES ('13', '管理员列表', '5', 'admin/index', '', '13', 'true');
INSERT INTO `lk_memu` VALUES ('15', '角色列表', '5', 'admin/role', '', '14', 'true');

-- -----------------------------
-- Table structure for `lk_mgroup`
-- -----------------------------
DROP TABLE IF EXISTS `lk_mgroup`;
CREATE TABLE `lk_mgroup` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `groupname` varchar(255) NOT NULL,
  `mid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `lk_mgroup`
-- -----------------------------
INSERT INTO `lk_mgroup` VALUES ('1', '1', '好友列表', '2,3');
INSERT INTO `lk_mgroup` VALUES ('2', '2', '好友列表', '1,3');
INSERT INTO `lk_mgroup` VALUES ('3', '0', '客服', '1,2,3,4');

-- -----------------------------
-- Table structure for `lk_qun`
-- -----------------------------
DROP TABLE IF EXISTS `lk_qun`;
CREATE TABLE `lk_qun` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `uids` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `lk_qun`
-- -----------------------------
INSERT INTO `lk_qun` VALUES ('1', '客服群', '/uploads/20180612/751a7c6c4b558478c91dc1db39d332b7.png', '1', '1,2,3,5850,7826,4097,7369,0239,8977,1196,2911');

-- -----------------------------
-- Table structure for `lk_role`
-- -----------------------------
DROP TABLE IF EXISTS `lk_role`;
CREATE TABLE `lk_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(255) NOT NULL,
  `open` enum('true','false') NOT NULL DEFAULT 'true',
  `ruleid` text,
  `desc` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `lk_role`
-- -----------------------------
INSERT INTO `lk_role` VALUES ('1', '超级管理员', 'true', '', '拥有一切的权利');
INSERT INTO `lk_role` VALUES ('2', '管理员', 'true', '1,2,3,4,5,6,7,8,9,10,11,12,13,15', '编辑管理');
INSERT INTO `lk_role` VALUES ('3', '文章管理员', 'true', '1,4,12', '只可以编辑文章');

-- -----------------------------
-- Table structure for `lk_tags`
-- -----------------------------
DROP TABLE IF EXISTS `lk_tags`;
CREATE TABLE `lk_tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tagstitle` varchar(255) NOT NULL,
  `linkurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `lk_tags`
-- -----------------------------
INSERT INTO `lk_tags` VALUES ('1', '全栈工程师', '');
INSERT INTO `lk_tags` VALUES ('2', 'php', '');
INSERT INTO `lk_tags` VALUES ('3', '数据库', '');
INSERT INTO `lk_tags` VALUES ('4', 'redis', '');
INSERT INTO `lk_tags` VALUES ('5', '日记', '');
INSERT INTO `lk_tags` VALUES ('6', '闲言碎语', '');
INSERT INTO `lk_tags` VALUES ('7', '干货', '');
INSERT INTO `lk_tags` VALUES ('8', '青春', '');
INSERT INTO `lk_tags` VALUES ('9', '怀念', '');
INSERT INTO `lk_tags` VALUES ('10', '魔都', '');
INSERT INTO `lk_tags` VALUES ('13', 'js', '');
INSERT INTO `lk_tags` VALUES ('14', 'mysql', '');

-- -----------------------------
-- Table structure for `lk_user`
-- -----------------------------
DROP TABLE IF EXISTS `lk_user`;
CREATE TABLE `lk_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `regtime` varchar(30) NOT NULL,
  `logtime` varchar(30) NOT NULL,
  `logip` varchar(30) NOT NULL,
  `open` enum('true','false') NOT NULL DEFAULT 'true',
  `groupid` int(11) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `sign` varchar(255) DEFAULT '',
  `status` enum('online','offline') DEFAULT 'online',
  `type` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `lk_user`
-- -----------------------------
INSERT INTO `lk_user` VALUES ('1', '大脸猫', '575074803@qq.com', '2086ff4ed10be2479a784ffc3d016e52', '1527748031', '1529657093', '127.0.0.1', 'true', '1', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', '1', 'online', '1');
INSERT INTO `lk_user` VALUES ('2', '凯神', 'cat_lkk@163.com', '2086ff4ed10be2479a784ffc3d016e52', '1527748031', '1529459926', '127.0.0.1', 'true', '2', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', '1', 'online', '1');
INSERT INTO `lk_user` VALUES ('3', 'hello world1', '123456@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1528335795', '1528335795', '127.0.0.1', 'true', '1', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', '1', 'online', '1');
INSERT INTO `lk_user` VALUES ('4', '大神', '2080765320@qq.com', '2086ff4ed10be2479a784ffc3d016e52', '1529030950', '1529030950', '127.0.0.1', 'true', '1', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', '1', 'online', '1');

-- -----------------------------
-- Table structure for `lk_user_qun`
-- -----------------------------
DROP TABLE IF EXISTS `lk_user_qun`;
CREATE TABLE `lk_user_qun` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `lk_user_qun`
-- -----------------------------
INSERT INTO `lk_user_qun` VALUES ('1', '1', '1');
INSERT INTO `lk_user_qun` VALUES ('2', '2', '1');
INSERT INTO `lk_user_qun` VALUES ('53', '5850', '1');
INSERT INTO `lk_user_qun` VALUES ('54', '7826', '1');
INSERT INTO `lk_user_qun` VALUES ('55', '4097', '1');
INSERT INTO `lk_user_qun` VALUES ('56', '7369', '1');
INSERT INTO `lk_user_qun` VALUES ('57', '239', '1');
INSERT INTO `lk_user_qun` VALUES ('58', '8977', '1');
INSERT INTO `lk_user_qun` VALUES ('59', '1196', '1');
INSERT INTO `lk_user_qun` VALUES ('60', '2911', '1');

-- -----------------------------
-- Table structure for `lk_webconfig`
-- -----------------------------
DROP TABLE IF EXISTS `lk_webconfig`;
CREATE TABLE `lk_webconfig` (
  `varname` varchar(50) NOT NULL COMMENT '变量名称',
  `varinfo` varchar(80) NOT NULL COMMENT '参数说明',
  `vartype` char(10) NOT NULL COMMENT '变量类型',
  `varvalue` text NOT NULL COMMENT '变量值',
  `vargroup` varchar(255) NOT NULL,
  `varzs` varchar(255) NOT NULL,
  `orderid` varchar(30) NOT NULL,
  PRIMARY KEY (`varname`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- -----------------------------
-- Records of `lk_webconfig`
-- -----------------------------
INSERT INTO `lk_webconfig` VALUES ('webname', '网站名称', 'string', 'luguo', '1', '网站名称', '1');
INSERT INTO `lk_webconfig` VALUES ('weblinkurl', '网址', 'string', 'http://www.ahimu.com/', '1', '网址', '2');
INSERT INTO `lk_webconfig` VALUES ('webkeyword', '关键词', 'string', 'http://www.ahimu.com/', '1', '关键词', '3');
INSERT INTO `lk_webconfig` VALUES ('webdesc', '网站描述', 'text', 'luguo1,个人博客', '1', '', '4');
INSERT INTO `lk_webconfig` VALUES ('emailesc', 'SMTP服务器', 'string', 'cat_lkk@163.com', '3', 'SMTP服务器', '5');
INSERT INTO `lk_webconfig` VALUES ('emailport', 'SMTP 端口', 'string', '465', '3', 'SMTP 端口', '6');
INSERT INTO `lk_webconfig` VALUES ('emailroot', '邮箱帐号', 'string', 'cat_lkk@163.com', '3', '邮箱帐号', '7');
INSERT INTO `lk_webconfig` VALUES ('emailpass', '邮箱密码', 'string', 'linshizhucema1', '3', '邮箱密码', '8');
INSERT INTO `lk_webconfig` VALUES ('eamilshou', '收件邮箱地址', 'string', '575074803@qq.com', '3', '收件邮箱地址', '9');
INSERT INTO `lk_webconfig` VALUES ('ips', '允许访问后台的IP列表', 'text', '127.0.0.1', '2', '', '10');
INSERT INTO `lk_webconfig` VALUES ('login_false_num', '后台登录失败最大次数', 'string', '101', '2', '后台登录失败最大次数', '11');
INSERT INTO `lk_webconfig` VALUES ('webqq', '客服QQ', 'string', '575074803', '1', '客服QQ', '50');

-- -----------------------------
-- Table structure for `lkk_qun`
-- -----------------------------
DROP TABLE IF EXISTS `lkk_qun`;
CREATE TABLE `lkk_qun` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `uids` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `lkk_qun`
-- -----------------------------
INSERT INTO `lkk_qun` VALUES ('1', '前端群', '/uploads/20180530/ce1c5c88605ac18b838869978df9b48c.jpg', '1', '3,4');
INSERT INTO `lkk_qun` VALUES ('2', '前端群2', '/uploads/20180530/ce1c5c88605ac18b838869978df9b48c.jpg', '1', '2,3,4');
INSERT INTO `lkk_qun` VALUES ('3', '前端群3', '/uploads/20180530/ce1c5c88605ac18b838869978df9b48c.jpg', '1', '3,4');
INSERT INTO `lkk_qun` VALUES ('4', '闲聊1', '/uploads/20180530/ce1c5c88605ac18b838869978df9b48c.jpg', '1', '3,4');
INSERT INTO `lkk_qun` VALUES ('5', '闲聊2', '/uploads/20180530/ce1c5c88605ac18b838869978df9b48c.jpg', '1', '3,4');
INSERT INTO `lkk_qun` VALUES ('6', '闲聊3', '/uploads/20180530/ce1c5c88605ac18b838869978df9b48c.jpg', '1', '2,3,4');
INSERT INTO `lkk_qun` VALUES ('7', '爱的', '/uploads/20180530/ce1c5c88605ac18b838869978df9b48c.jpg', '1', '1,3');
INSERT INTO `lkk_qun` VALUES ('8', 'kailian', '/uploads/20180530/ce1c5c88605ac18b838869978df9b48c.jpg', '3', '');
INSERT INTO `lkk_qun` VALUES ('9', '测试', '/uploads/20180530/6047ca24a1fc2a1ff855dc2983dd809d.jpg', '1', '1');

-- -----------------------------
-- Table structure for `lkk_user_qun`
-- -----------------------------
DROP TABLE IF EXISTS `lkk_user_qun`;
CREATE TABLE `lkk_user_qun` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `lkk_user_qun`
-- -----------------------------
INSERT INTO `lkk_user_qun` VALUES ('1', '1', '9');
INSERT INTO `lkk_user_qun` VALUES ('2', '3', '9');
