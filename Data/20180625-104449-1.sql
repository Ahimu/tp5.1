
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
-- Records of `lk_adtype`
-- -----------------------------
INSERT INTO `lk_adtype` VALUES ('2', '首页banner', '/uploads/20180607/efa7fcba7ed9f922be1ce0a4808afbbf.jpg', 'true', '/uploads/thumb/efa7fcba7ed9f922be1ce0a4808afbbf.jpg', '1');

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
-- Records of `lk_article`
-- -----------------------------
INSERT INTO `lk_article` VALUES ('1', '0', '测试', '/uploads/20180615/af90e62e42ccc869461da909fd19ece0.jpg', '/uploads/thumb/af90e62e42ccc869461da909fd19ece0.jpg', '', '<p>测试</p>', '测试1', '测试2', 'cat li', '原创', '0', '1529044152', '', '0', '1', 'true', '0', '0', '1', 'false');
INSERT INTO `lk_article` VALUES ('2', '4', '测试2', '/uploads/20180615/8d6f3e9102911147d5d068bfe2c604e7.jpg', '/uploads/thumb/8d6f3e9102911147d5d068bfe2c604e7.jpg', '', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">据古书记载，京都自古以来自杀者即相当多。无论是哪一个时代，京城人的生存竞争总是比乡村人激烈。一旦遭逢无法再生活下去的不幸时，选择一死了之的人很多。例如，城内城外均遭到严重的饥馑，父母兄弟个个撒手尘寰，或丧失了至爱的妻子儿女时，人们会因厌世而自杀。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">其他因官职落榜一时想不开的，被情义所逼的，因失恋而看破一切的……令人想自杀的原因真是数不胜数。更何况德川时代时还有所谓情死的，一次死两个人。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">当人们想自杀时，最简便的方法似乎是投河。这个不需去查看统计学者的自杀调查表，只要对自杀这档事，稍为认真思索过的人即能察觉才对。遗憾的是，京都没有适当的投河场所。鸭川当然死不了，因为最深的地方也不及一公尺。因此，阿俊与传兵卫（译注：木偶净琉璃剧的一出情死戏，主角井筒传兵卫杀死情敌武士后，与娼妓阿俊双双在鸟边山寻死的故事）才会情死在鸟边山（译注：平安时代的火葬场）。其他大多选择上吊自杀。那个时代，当然没有不幸遭车祸死亡的。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">另外，非选择投身自杀不可的人，可从清水舞台（译注：清水寺，建立于西元七九八年，平安时代以后被瞻仰为观世音菩萨的灵地，上演传统剧的舞台被建立在陡峭的断崖上）跳下去。俗说：“抱着从清水舞台投身的心情”（译注：意谓“下了豁出性命的决心”），这其实是有根据的比喻。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">不过，若真目睹过舞台下那山涧岩石上的碎烂尸体，或曾听人描述过惨状的人，即使再喜爱跟潮流，也会犹豫不前。因此，一些非选择投河自杀不可的人，只能学阿半与长右卫门（译注：木偶净琉璃剧的一出情死戏，年轻女孩阿半与半老男人长右卫门的悲恋剧情），迢迢走至桂川，不然就得越过逢阪山至琵琶湖，或到嵯峨的广泽池去如愿。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">对一些想在死前尽情享乐一阵子的情死者来说，这段路程或许不算什么，但那些一刻也不想再待在这世上的人，实在没有闲情走这段十多公里远的路。所以，这些人大多选择上吊自杀。也因此，一些常在圣护院之森或纠森（译注：下鸭神社内的树林）捡拾米槠籽的孩童，常会冷不防撞见一具吊在半空中的尸体而魂不附体。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">话虽如此，自古以来京都人还是有很多人选择了自杀。即使是所有自由都被剥夺了的人，也至少残存有自杀的自由。被捕入狱的人，也能选择最后一条路。就连双手双足都被绑住无法动弹的人，只要持有极度的克己心，也能强迫自己不呼吸而自尽身亡。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">总而言之，京都没有适当的投河场所，这是事实。不过，从古至今，想自杀的人们还是绞尽脑汁如愿了。虽然没有适当的投河场所，但自杀者的比例，并不逊于江户（译注：东京）或大阪。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">时代跨入明治以后，京都府桢村首长大兴水渠土木工程，自琵琶湖引水进京。此工程，不但带给京都市民水运方便，也让京都市民享有自来水的恩泽，同时更提供了适当的投河场所给京都市民。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">水渠大约有二十公尺宽，是个相当不错的投河自杀场所。若在深海海底浮游着，任各种鱼类叼啄着自己的尸体，恐怕无论是任何人，光想像也会感到呕心。所以大凡一般投河自杀的人，都希望即使死了，也最好在适当的时机被人发现尸体，再打捞上来吊丧。针对这点来讲的话，水渠实在是个最佳场所。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">水渠从蹴上经过二条，再顺着鸭川河边流至伏见。不论是何处，水深大约都有三公尺左右，清澈见底。而且两岸种植有杨柳，夜晚时瓦斯灯青光朦胧。鸭川对面还能传来先斗町（译注：京都鸭川西岸的闹区）一带的琴声弦歌。背后是静默横躺着的东山（译注：京都东方以大文字山为主峰的山峦，山脚下有多数的神社与寺庙）。雨后的夜晚，两岸边的霓虹灯光，更会红红绿绿地映照在水面上。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">如此美丽的水渠夜景，往往会使自杀者萌生一种罗曼蒂克的气氛，让自杀者消却对死亡的恐惧，而恍恍惚惚地纵身投入水中。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">只是，无论自杀者寻死之意再如何坚毅，当其带着全身重量落到水面那一瞬间，也均会发出悲鸣。这是人贪生怕死的本能呻吟。不过，既然人都跳下去了，又有何办法？跳下去后，一般大多会溅起一阵飞沫沉入水中，再浮出水面，此时，投河者心中只有想得救的本能存在。因此他会胡乱伸手抓掴河水、拍打水面、拼命挣扎、痛苦呻吟、拳打脚踢。然后四肢渐渐失去力量，再坠入神智不清的状况而丧生，不过，若此时有人丢绳子入水，投河者大多会不假思索地伸手抓住绳子。当投河者抓住绳子时，他心中不会浮出投河前的觉悟与被抢救后的后悔。只有想得救的强烈本能存在着。因此，我们绝对不能嗤笑自杀者临死前求救，或抓住绳子的这种矛盾心理。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">总之，自从京都出现适当的投河场所后，想自杀的人大多会投身于水渠。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">从水渠被捞出的横死者尸体年数量，有时甚至会高达百多人。水渠流域中，寻死的最佳场所是武德殿（译注：一八九九年落成的武艺馆）附近一座凄寂的木桥。水渠中沿着倾斜面缆车旁一路往下奔流的水势，即使流至冈崎公园仍会馀势犹存地绕着公园转。木桥正座落于水流与公园分道扬镳之处。右手方可见瓦斯灯寂寥地映照出雾霭灿然的平安神宫院内的树林，左手方是几户门窗紧闭的空寂人家。所以平日悄无人声。因此越过这座桥栏杆投河自杀的人很多。看来，从桥上投河比从岸边入河，较能满足自杀者心中潜在的演戏愿望吧。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">只是，木桥下流八、九公尺左右的水渠岸边，有一间茅屋。每逢有人从桥上投河自杀时，自茅屋内即会冲出一个身材极为矮小的老媪。投河自杀的时间若在夜晚十二点之前，老媪的抢救方法大致都一成不变。亦即手中一定握着一支长竹竿，再将竹竿伸往河中发出呻吟声之处。通常会有反应。若没反应，只要追赶着水声与呻吟声，连连探出竹竿即行。当然偶尔也会有毫无反应任水势漂流下去的例子，但十之八九竹竿彼端通常都会有反应。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">待老媪将投河者救至岸边时，看热闹的人群中，也一定夹杂着某个好心跑到三百公尺远的派出所去通报事件的男人。若季节正逢冬天，那就必须生火取暖，但若是夏天，则只要让投河者吐出河水，再帮他擦擦身子，投河者多半即能恢复精神自己跟随警员行至派出所。而通常也都是警员向投河者教诲两三句话，投河者则支支吾吾地陪罪道歉后即了事。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">像这种抢救人命的例子，一个月后，政府会颁发一张表扬状与一圆五十分钱左右的奖金给抢救者。老媪每次领取了奖金后，总会先供奉在神龛前，再击两三次掌，然后拿到邮局存款。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">第四回内国博览会（译注：明治政府为振兴国内产业所开办的产物博览会，始于一八七七年东京上野公园，终于一九零三年第五回大阪博览会）在冈崎公园被举办时，老媪在茅屋原处开了家小茶馆。虽只是卖些糖果点心或水果之类的小茶馆，但收入相当不错，因此博览会的建筑物渐渐被拆毁后，老媪仍持续着她的茶馆生意。这也可说是第四回博览会闭幕后存留下来的唯一纪念物。老媪的丈夫已死，她一直跟女儿相依为命。零钱逐渐积多后，先前的小茅屋也变成目前这栋整洁清爽的住屋了。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">老媪最初发现有人自桥上投河时，惊慌得手足无措。想大声呼人，附近又没有人影。即使运气好凑巧有人经过，那时投河者也早已被卷入激烈的水势中而行踪不明了。此时，老媪只能凝视着黑暗的水面，口中喃喃念佛。但是，老媪如此耳闻目睹的自杀者，不仅是一两人。通常是两个月一次，有时甚至是一个月两次，老媪会听到自杀者的悲鸣。那声音听起来像是地狱里未能超度的亡魂之呻吟，令懦怯的老媪难以忍受。于是，老媪才下定决心抢救这些投河者。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">老媪第一次鼓足勇气并绞尽脑汁用竹竿抢救成功的，是一个二十三岁的男人。那是个因盗用了主人家的五十圆公款，想以死来陪罪的懦弱男人。警员谴责他轻举妄动后，那男人即表示愿意悔改并继续努力工作。一个月后，老媪收到京都府政府寄来的传唤通知，领回了奖金。当时的一圆五十分钱对老媪来说，是一笔巨款。她再三考虑过后，才决定把钱存进当时才刚稍稍盛行起来的邮政储蓄。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">那以后，老媪就拼命救人。而且抢救技术也逐渐高明起来。只要一听到水声与悲鸣，老媪即会翻身而起冲出后门。然后抓起搁立在后门边的竹竿，像个渔夫拿着尖矛准备扎鲤鱼般地摆出架式，凝视着水面，再巧妙地探出竹竿至自杀者面前。几乎所有的投河者都会伸手揪住被探至眼前的竹竿。然后老媪再使尽气力打捞上来。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">若有凑巧路过的男人想帮老媪时，老媪会很不高兴。因为她觉得那人好像侵害到自己的特权似的。如此，老媪自四十三岁那年到五十八岁的今日，总共抢救了五十多条性命。因此授奖的手续也非常简化，只需一周即能领取奖金。府政府的公务员总是笑道：“阿婆您又来了。”再把奖金颁给老媪。老媪也失去当初欣喜若狂的感激情怀，就像自茶馆客人手中接过豆沙糕钱一样，只回一句：“谢谢。”即了事。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">当世间一般景气旺盛，接连两三个月都没有投河者时，老媪总会觉得有点心痒难挠。女儿向她要钱想买布料时，老媪也会回女儿说，等下回领奖金时再买。那时是六月末，照往例来说，应该是投河者最多的旺季，却不知为何竟没人投河。老媪每晚和女儿铺棉被排枕头时，总会倾耳细听河面的动静。到了十二点仍无动静时，才喃喃道了一句：“今晚又不行了。”这才死心地闭上眼。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">老媪认为拯救投河者是一件非常有意义的事。她在跟茶馆客人聊家常时，时常这么说：“像我这样的人，也救了不少条性命，死后一定可以上天堂了。”当然没有人跟她唱反调。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">不过老媪心中仅有一点不满。那就是被抢救的人，罕得有人向老媪道谢。他们在警员面前虽会行礼道谢，却没人会向老媪说谢词。更没人于事后专程再度来致谢的。老媪心中暗忖：“真是枉费我救了他们一条命，这些人也实在太无情了。”</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">某夜，老媪救了一个十八岁的女孩。那女孩恢复神智发现自己被救过来后，不顾一切地哭天抢地起来。警员好不容易才说服她一道走往派出所时，途经那座木桥，不料那女孩又趁警员不注意时，再度跃身跳进河里。只是，那女孩竟出奇地又被老媪探出的竹竿救上来了。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">老媪望着二度被警员带走的女孩的背影，喃喃叹道：“不管跳几次，人毕竟总是想求生的。”</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">老媪年近六十时，依旧只要耳闻水声与悲鸣声，即马上往河中探出竹竿。也依旧没有任何一个自杀者会拒绝揪住眼前的竹竿。老媪一直认为那些人是衷心想得救，所以才会揪住被探出的竹竿。老媪一直也认为，既然抢救的都是一些衷心想得救的人，那么她做的也一定是无以伦比的好事。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">今年春天，老媪十数多年来的平静生活，首遭危机。问题出在她那个二十一岁的女儿身上。女儿长相虽有点粗俗，但皮肤白晳，表情妩媚动人。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">老媪本来计划等某个远房亲戚的次男服完兵役后，将招他入赘，再拿出三百多圆的存款做为本钱，合力把茶馆扩大。这是老媪的愿望与期盼。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">可是，女儿却彻底破坏了老媪的期盼。她跟一个自今年二月起，在熊野通二条下那间熊野座小剧场上演戏剧，名叫岚扇太郎的巡回演出艺人，陷入老生常谈的男女关系。扇太郎花言巧语地教唆女儿偷出母亲的存摺，自邮局提取所有的存款后，双双远走高飞了。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">老媪除了惊愕与绝望以外，一无所有。只剩下茶馆里不满五圆的商品，以及一些衣物。不过老媪若依旧把茶馆开下去，理应不会流落街头的。只是老媪已万念俱灰。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">她等了两个月，盼望女儿会捎来讯息，却以徒劳告终。她失去继续活下去的精力。于是，想到死。她考虑了好几个晚上，终于下定投河自杀的决心。如此，不但可以解脱难以忍受的绝望，也可儆戒女儿。她选择了已住习惯的住家附近那座木桥，做为投河场所。老媪认为，自那桥上投河自杀的话，一定没人会干扰她的。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">某天夜晚，老媪终于伫立在那座桥上。她脑中不断浮出迄今为止自己抢救过来的自杀者的脸孔，但那些脸孔，却彷佛都挂着一副奇异的、嘲讽的笑容。不过，也多亏她看过无数的自杀者，所以已将自杀这种行为视为家常便饭，心里不怎么恐惧。于是，老媪神志恍惚地自栏杆滑落般地跳入河中。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">当老媪不期然地回过神来时，只见四周围着警员与一大堆看热闹的人。这些人都是她平日率领的集团，只是她的位置稍稍调换了一下而已。看热闹的人群中，甚至有人想不通警员的身边怎么不见往常一定在的老媪。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">老媪以一种无以名状的似羞耻，又似气愤的不愉快感情，环视着四周。她意外地发现警员身边那个往常自己应站立的位置，竟然站立个肤色黝黑的四十左右的男人。当她察觉正是那个男人抢救了自己时，愤恨得真想上前去揪打那个男人。老媪宛如刚舒舒服服地睡着了，竟又被狠狠地叫醒来般，怒火中烧。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">那男人似乎丝毫未察觉老媪的心情，一昧地向警员说道：“若再晚了一步，恐怕就来不及了。”这是老媪往常经年累月向警员说的句子。口气中，明显地流露出救助了人命的自豪。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">老媪发现自己衰老的肉体暴露在众目睽睽之中，赶紧拉拢胸口与下摆，心中却熊熊燃烧着一把羞耻与愤恨的怒火。熟识的警员说道：“应该救人的你怎么变成让别人来救你？不行啊。”老媪充耳不闻地匆匆逃回自己的家。警员随后进来，教诲了老媪几句，这也是老媪早就听过无数遍，听都听腻了的句子。此时，老媪又发现敞开着的门外，以那个四十男人为首，聚集了一群看热闹的人。老媪疯狂地冲过去，猛烈地关上门。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">那以后，老媪灰心沮丧地过着孤寂的日子。她甚至失去了自杀的意念。女儿好似也没有归家的征兆。沉重如灰泥般的日子，就这样一天一天过去。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); letter-spacing: 0.544px; widows: 1; text-indent: 2em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 2px; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\">那根长竹竿，依旧搁立在老媪家的后门。不过，自此以后，就没人再听闻到从桥上投河自杀的人被抢救过来的消息了。</span></p><p><br/></p>', '那根长竹竿，依旧搁立在老媪家的后门。不过，自此以后，就没人再听闻到从桥上投河自杀的人被抢救过来的消息了。', '那根长竹竿，依旧搁立在老媪家的后门。不过，自此以后，就没人再听闻到从桥上投河自杀的人被抢救过来的消息了。', 'cat li', '原创', '0', '1529044336', '1,2', '0', '1', 'true', '0', '0', '2', 'false');
INSERT INTO `lk_article` VALUES ('3', '1', '上海', '/uploads/20180615/e4d6908d0c8cb41d6238eb356315ebbc.jpg', '/uploads/thumb/e4d6908d0c8cb41d6238eb356315ebbc.jpg', '', '<p><span style=\"font-family: \">那根长竹竿，依旧搁立在老媪家的后门。不过，自此以后，就没人再听闻到从桥上投河自杀的人被抢救过来的消息了。</span></p>', '那根长竹竿，依旧搁立在老媪家的后门。不过，自此以后，就没人再听闻到从桥上投河自杀的人被抢救过来的消息了。', '那根长竹竿，依旧搁立在老媪家的后门。不过，自此以后，就没人再听闻到从桥上投河自杀的人被抢救过来的消息了。', 'cat li', '原创', '0', '1528819200', '5,6,8,9,10', '0', '1', 'true', '0', '0', '0', 'false');

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
  `classid` int(11) NOT NULL,
  `href` varchar(255) NOT NULL,
  `open` enum('true','false') NOT NULL DEFAULT 'true',
  `orderid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `lk_category`
-- -----------------------------
INSERT INTO `lk_category` VALUES ('1', '首页', '0', 'index/index', 'true', '1');
INSERT INTO `lk_category` VALUES ('4', '关于我们', '0', 'about', 'true', '2');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `lk_role`
-- -----------------------------
INSERT INTO `lk_role` VALUES ('1', '超级管理员', 'true', '', '拥有一切的权利');
INSERT INTO `lk_role` VALUES ('2', '管理员', 'true', '', '编辑管理');

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
