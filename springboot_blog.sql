/*
 Navicat MySQL Data Transfer

 Source Server         : zouyuxiao
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : springboot_blog

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 11/11/2018 14:22:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '分类名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '编程');
INSERT INTO `category` VALUES (2, '生活');
INSERT INTO `category` VALUES (3, '医学');
INSERT INTO `category` VALUES (4, '艺术');
INSERT INTO `category` VALUES (6, '教育');
INSERT INTO `category` VALUES (8, '科技');
INSERT INTO `category` VALUES (10, '军事');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '评论内容',
  `time` datetime(0) NULL DEFAULT NULL COMMENT '评论时间',
  `u_id` bigint(20) NULL DEFAULT NULL COMMENT '用户，外键指向用户表',
  `content_id` bigint(20) NULL DEFAULT NULL COMMENT '博客，外键指向博客表content',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_uid`(`u_id`) USING BTREE,
  INDEX `content_comment`(`content_id`) USING BTREE,
  CONSTRAINT `comment_uid` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `content_comment` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '测试', '2018-11-05 10:29:29', 1, 1);
INSERT INTO `comment` VALUES (2, '测试2', '2018-11-05 10:32:01', 1, 1);

-- ----------------------------
-- Table structure for contents
-- ----------------------------
DROP TABLE IF EXISTS `contents`;
CREATE TABLE `contents`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '内容',
  `u_id` bigint(20) NULL DEFAULT NULL COMMENT '作者，外键指向user用户表',
  `time` date NULL DEFAULT NULL COMMENT '创建时间',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '状态，1草稿，2已发布',
  `c_id` bigint(20) NULL DEFAULT NULL COMMENT '类别，外键指向category类别表',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `c_uid`(`u_id`) USING BTREE,
  INDEX `c_cid`(`c_id`) USING BTREE,
  CONSTRAINT `c_cid` FOREIGN KEY (`c_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `c_uid` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contents
-- ----------------------------
INSERT INTO `contents` VALUES (1, '测试2', '## 潇洒走一回 ##\r\n\r\n【经典语录】 柳梢的嫩芽含苞，枝头的鸟儿叽喳，窗边的水滴成雾，床边的炉火正烧，这一切的一切，我却感到寒意些许，苍梧结实何许，花落不知春，元道是，我心已凉。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 将我推入黑暗的人，让我的心封闭一切，感受不到温暖与爱。将我拉出黑暗的人，给了我热情，像阳光一样照进我的心底，心底的冰川一点点融化，最后成为一汪清泉。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 曾经以为没有你，我就没有了全世界，可现在你走了，我的世界还在。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 我爱你，却不敢靠近你，我爱你，默默呵护着你，我们是不同的人，因而有着别样的青春，命运的河流不会保存，梦蝶终醒，只道是，游戏一梦。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 一人潇洒自天涯，世间情怀，一笑而过。今望佳人，倾心不已，但吾深感吾不配，但吾愿佳人与如心中之人白头偕老。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 前路迷雾，眼望迷路，回首相顾，已是无路，迷雾迷路，谁知前路，一步一止，欲退无路，不知前路，不识前途，足步踏路，一踏一无，一步一遇，相见默首，默而不闻，各行其路。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 枫叶遍地，独在小路行走，想了想，这也许就是孤独吧 突然我觉得这并不孤独，因为有孤独陪着我，这样还孤独吗？？？\r\n顶 0 收藏 0\r\n\r\n【经典语录】 连休了两天，那个糟糕的自己依然独自承受着自己发生的一切。这种挣扎太累人了。突然想到活在当下，当下该做什么？吃中饭了，我吃饭了！\r\n顶 0 收藏 0\r\n\r\n【经典语录】 面对目标，信心百倍，人生能有几次搏？面对成绩，心胸豁达，条条大陆通罗马。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 塞外江南，别样风光，满地金黄，道不尽人间是沧桑。大漠孤烟，无尽悲凉，天高海阔，诉不休离愁亦难忘。\r\n顶 1 收藏 0\r\n\r\n【经典语录】 晚秋已矣，渐入寒冬。叶落归根，倦鸟归巢。因心怀远方，故四海为家。不求功名利禄，只愿光耀门楣。幸得佳人追随，一路披荆斩棘。终会踏平坎坷，迎来笑语欢歌。\r\n顶 1 收藏 0\r\n\r\n【经典语录】 慢慢走，太急了，可能一不注意，会被路上的小坑绊倒，一不留意，可能会丢失某些重要的文件。慢点虽然到达目的地可能需要花费更多的时间，但是我们会走得比较稳当，想得会更多一点，准备得更加充分，更加有底气。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 秋风送落叶，落叶知我心。我心随寒意，寒意伴我行。\r\n顶 1 收藏 0\r\n\r\n【经典语录】 酒这东西要么别喝，要么就喝醉，因为半醉不醉的感觉太清醒，不是让人想起旧情，就是让人想起旧爱。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 委屈什么，世上又不止你一个人爱而不得，几乎每个人都会遇到一个，不能结婚却深爱过的人。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 梦幻，是行走在沙漠里的海市蜃楼，美而不真实，所有梦里的场景，都是蜃楼里的海洋，遥远而又虚幻，把梦撒向海里，满天的星辰，便是你的家乡，没有适合做梦的年纪，只有---不愿做梦的人。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 请让我遇见你，在最美的花季，我会轻轻向你耳语，诉说青春的神秘，在那个有黄昏的雨季，满天放飞的梦想，都充满着奇迹，这个世界很拥挤，只装的下---你我的回忆。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 寂静的夜空，寒风徐来。草木皆黄，鸟飞窝空。冰凉的路面，唯有车轮不休。仰望高空，唯有星辰作伴。回想过去点点滴滴，酸甜苦辣心中留。时光流逝，春去冬来又一年。不知道未来在何处。思前想后，人生苦短。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 空想的那方世界，至少梦里是属于我的，思绪铸以它超脱维度的灵魂，你会发现，现实中的事物，不过是以另一种方式存在的假象而已。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 学会沟通真的是一件很奇妙的事情，本来难以解决的事情，通过双方的交流，最后皆大欢喜。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 思念像雨绵绵，坎坷你不曾见，淋着细雨的无眠，问离人忘几年。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 帮你明白了什么是对什么是错，在别人的话中，你才能听出什么是善，什么是恶，也可以分辨出哪些人领你走向光明，哪些人将你推入深渊。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 天山雪，远观洁，近刺骨，大煞眸景；冬将至，叶凋零，憾非寒，何处栖身？墨笔头，帝师卑，木镇尺，尽书奈何；天涯尽，应思量，何来故，调头远方！\r\n顶 0 收藏 0\r\n\r\n【经典语录】 花开花落，花仍在，只与叶分离。人是人非，人无还，只入落针海。越爱越深，越沉醉，梦断魂劳，不过相思曲。清歌唱绝天涯路，伴酒画下画中画，悲柳黄如花。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 再黑的夜晚有亮的时候，再大的暴雨有晴的时候，再大的暴风有停的时候。加油，回报给对你好的，加油，证明出给TA们看。相信自己，认真去做一件事，总会有好的时候。', 1, '2018-10-31', '2', 1);
INSERT INTO `contents` VALUES (2, '测试3', '## 潇洒走一回 ##\r\n\r\n【经典语录】 柳梢的嫩芽含苞，枝头的鸟儿叽喳，窗边的水滴成雾，床边的炉火正烧，这一切的一切，我却感到寒意些许，苍梧结实何许，花落不知春，元道是，我心已凉。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 将我推入黑暗的人，让我的心封闭一切，感受不到温暖与爱。将我拉出黑暗的人，给了我热情，像阳光一样照进我的心底，心底的冰川一点点融化，最后成为一汪清泉。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 曾经以为没有你，我就没有了全世界，可现在你走了，我的世界还在。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 我爱你，却不敢靠近你，我爱你，默默呵护着你，我们是不同的人，因而有着别样的青春，命运的河流不会保存，梦蝶终醒，只道是，游戏一梦。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 一人潇洒自天涯，世间情怀，一笑而过。今望佳人，倾心不已，但吾深感吾不配，但吾愿佳人与如心中之人白头偕老。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 前路迷雾，眼望迷路，回首相顾，已是无路，迷雾迷路，谁知前路，一步一止，欲退无路，不知前路，不识前途，足步踏路，一踏一无，一步一遇，相见默首，默而不闻，各行其路。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 枫叶遍地，独在小路行走，想了想，这也许就是孤独吧 突然我觉得这并不孤独，因为有孤独陪着我，这样还孤独吗？？？\r\n顶 0 收藏 0\r\n\r\n【经典语录】 连休了两天，那个糟糕的自己依然独自承受着自己发生的一切。这种挣扎太累人了。突然想到活在当下，当下该做什么？吃中饭了，我吃饭了！\r\n顶 0 收藏 0\r\n\r\n【经典语录】 面对目标，信心百倍，人生能有几次搏？面对成绩，心胸豁达，条条大陆通罗马。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 塞外江南，别样风光，满地金黄，道不尽人间是沧桑。大漠孤烟，无尽悲凉，天高海阔，诉不休离愁亦难忘。\r\n顶 1 收藏 0\r\n\r\n【经典语录】 晚秋已矣，渐入寒冬。叶落归根，倦鸟归巢。因心怀远方，故四海为家。不求功名利禄，只愿光耀门楣。幸得佳人追随，一路披荆斩棘。终会踏平坎坷，迎来笑语欢歌。\r\n顶 1 收藏 0\r\n\r\n【经典语录】 慢慢走，太急了，可能一不注意，会被路上的小坑绊倒，一不留意，可能会丢失某些重要的文件。慢点虽然到达目的地可能需要花费更多的时间，但是我们会走得比较稳当，想得会更多一点，准备得更加充分，更加有底气。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 秋风送落叶，落叶知我心。我心随寒意，寒意伴我行。\r\n顶 1 收藏 0\r\n\r\n【经典语录】 酒这东西要么别喝，要么就喝醉，因为半醉不醉的感觉太清醒，不是让人想起旧情，就是让人想起旧爱。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 委屈什么，世上又不止你一个人爱而不得，几乎每个人都会遇到一个，不能结婚却深爱过的人。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 梦幻，是行走在沙漠里的海市蜃楼，美而不真实，所有梦里的场景，都是蜃楼里的海洋，遥远而又虚幻，把梦撒向海里，满天的星辰，便是你的家乡，没有适合做梦的年纪，只有---不愿做梦的人。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 请让我遇见你，在最美的花季，我会轻轻向你耳语，诉说青春的神秘，在那个有黄昏的雨季，满天放飞的梦想，都充满着奇迹，这个世界很拥挤，只装的下---你我的回忆。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 寂静的夜空，寒风徐来。草木皆黄，鸟飞窝空。冰凉的路面，唯有车轮不休。仰望高空，唯有星辰作伴。回想过去点点滴滴，酸甜苦辣心中留。时光流逝，春去冬来又一年。不知道未来在何处。思前想后，人生苦短。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 空想的那方世界，至少梦里是属于我的，思绪铸以它超脱维度的灵魂，你会发现，现实中的事物，不过是以另一种方式存在的假象而已。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 学会沟通真的是一件很奇妙的事情，本来难以解决的事情，通过双方的交流，最后皆大欢喜。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 思念像雨绵绵，坎坷你不曾见，淋着细雨的无眠，问离人忘几年。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 帮你明白了什么是对什么是错，在别人的话中，你才能听出什么是善，什么是恶，也可以分辨出哪些人领你走向光明，哪些人将你推入深渊。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 天山雪，远观洁，近刺骨，大煞眸景；冬将至，叶凋零，憾非寒，何处栖身？墨笔头，帝师卑，木镇尺，尽书奈何；天涯尽，应思量，何来故，调头远方！\r\n顶 0 收藏 0\r\n\r\n【经典语录】 花开花落，花仍在，只与叶分离。人是人非，人无还，只入落针海。越爱越深，越沉醉，梦断魂劳，不过相思曲。清歌唱绝天涯路，伴酒画下画中画，悲柳黄如花。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 再黑的夜晚有亮的时候，再大的暴雨有晴的时候，再大的暴风有停的时候。加油，回报给对你好的，加油，证明出给TA们看。相信自己，认真去做一件事，总会有好的时候。', 1, '2018-10-31', '2', 1);
INSERT INTO `contents` VALUES (3, '撒大声地', '## 潇洒走一回 ##\r\n\r\n【经典语录】 柳梢的嫩芽含苞，枝头的鸟儿叽喳，窗边的水滴成雾，床边的炉火正烧，这一切的一切，我却感到寒意些许，苍梧结实何许，花落不知春，元道是，我心已凉。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 将我推入黑暗的人，让我的心封闭一切，感受不到温暖与爱。将我拉出黑暗的人，给了我热情，像阳光一样照进我的心底，心底的冰川一点点融化，最后成为一汪清泉。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 曾经以为没有你，我就没有了全世界，可现在你走了，我的世界还在。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 我爱你，却不敢靠近你，我爱你，默默呵护着你，我们是不同的人，因而有着别样的青春，命运的河流不会保存，梦蝶终醒，只道是，游戏一梦。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 一人潇洒自天涯，世间情怀，一笑而过。今望佳人，倾心不已，但吾深感吾不配，但吾愿佳人与如心中之人白头偕老。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 前路迷雾，眼望迷路，回首相顾，已是无路，迷雾迷路，谁知前路，一步一止，欲退无路，不知前路，不识前途，足步踏路，一踏一无，一步一遇，相见默首，默而不闻，各行其路。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 枫叶遍地，独在小路行走，想了想，这也许就是孤独吧 突然我觉得这并不孤独，因为有孤独陪着我，这样还孤独吗？？？\r\n顶 0 收藏 0\r\n\r\n【经典语录】 连休了两天，那个糟糕的自己依然独自承受着自己发生的一切。这种挣扎太累人了。突然想到活在当下，当下该做什么？吃中饭了，我吃饭了！\r\n顶 0 收藏 0\r\n\r\n【经典语录】 面对目标，信心百倍，人生能有几次搏？面对成绩，心胸豁达，条条大陆通罗马。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 塞外江南，别样风光，满地金黄，道不尽人间是沧桑。大漠孤烟，无尽悲凉，天高海阔，诉不休离愁亦难忘。\r\n顶 1 收藏 0\r\n\r\n【经典语录】 晚秋已矣，渐入寒冬。叶落归根，倦鸟归巢。因心怀远方，故四海为家。不求功名利禄，只愿光耀门楣。幸得佳人追随，一路披荆斩棘。终会踏平坎坷，迎来笑语欢歌。\r\n顶 1 收藏 0\r\n\r\n【经典语录】 慢慢走，太急了，可能一不注意，会被路上的小坑绊倒，一不留意，可能会丢失某些重要的文件。慢点虽然到达目的地可能需要花费更多的时间，但是我们会走得比较稳当，想得会更多一点，准备得更加充分，更加有底气。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 秋风送落叶，落叶知我心。我心随寒意，寒意伴我行。\r\n顶 1 收藏 0\r\n\r\n【经典语录】 酒这东西要么别喝，要么就喝醉，因为半醉不醉的感觉太清醒，不是让人想起旧情，就是让人想起旧爱。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 委屈什么，世上又不止你一个人爱而不得，几乎每个人都会遇到一个，不能结婚却深爱过的人。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 梦幻，是行走在沙漠里的海市蜃楼，美而不真实，所有梦里的场景，都是蜃楼里的海洋，遥远而又虚幻，把梦撒向海里，满天的星辰，便是你的家乡，没有适合做梦的年纪，只有---不愿做梦的人。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 请让我遇见你，在最美的花季，我会轻轻向你耳语，诉说青春的神秘，在那个有黄昏的雨季，满天放飞的梦想，都充满着奇迹，这个世界很拥挤，只装的下---你我的回忆。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 寂静的夜空，寒风徐来。草木皆黄，鸟飞窝空。冰凉的路面，唯有车轮不休。仰望高空，唯有星辰作伴。回想过去点点滴滴，酸甜苦辣心中留。时光流逝，春去冬来又一年。不知道未来在何处。思前想后，人生苦短。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 空想的那方世界，至少梦里是属于我的，思绪铸以它超脱维度的灵魂，你会发现，现实中的事物，不过是以另一种方式存在的假象而已。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 学会沟通真的是一件很奇妙的事情，本来难以解决的事情，通过双方的交流，最后皆大欢喜。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 思念像雨绵绵，坎坷你不曾见，淋着细雨的无眠，问离人忘几年。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 帮你明白了什么是对什么是错，在别人的话中，你才能听出什么是善，什么是恶，也可以分辨出哪些人领你走向光明，哪些人将你推入深渊。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 天山雪，远观洁，近刺骨，大煞眸景；冬将至，叶凋零，憾非寒，何处栖身？墨笔头，帝师卑，木镇尺，尽书奈何；天涯尽，应思量，何来故，调头远方！\r\n顶 0 收藏 0\r\n\r\n【经典语录】 花开花落，花仍在，只与叶分离。人是人非，人无还，只入落针海。越爱越深，越沉醉，梦断魂劳，不过相思曲。清歌唱绝天涯路，伴酒画下画中画，悲柳黄如花。\r\n顶 0 收藏 0\r\n\r\n【经典语录】 再黑的夜晚有亮的时候，再大的暴雨有晴的时候，再大的暴风有停的时候。加油，回报给对你好的，加油，证明出给TA们看。相信自己，认真去做一件事，总会有好的时候。', 2, '2018-11-07', '1', 2);
INSERT INTO `contents` VALUES (4, '将大幅度', '点击发电机房DKF绝大部分的买房没地方都没法点击放大开发的开发的防静电服，', 1, '2018-11-09', '2', 1);
INSERT INTO `contents` VALUES (5, '将大幅度', '点击发电机房DKF绝大部分的买房没地方都没法点击放大开发的开发的防静电服，', 1, '2018-11-09', '2', 1);
INSERT INTO `contents` VALUES (6, '将大幅度', '点击发电机房DKF绝大部分的买房没地方都没法点击放大开发的开发的防静电服，', 1, '2018-11-09', '2', 2);
INSERT INTO `contents` VALUES (7, '将大幅度', '点击发电机房DKF绝大部分的买房没地方都没法点击放大开发的开发的防静电服，', 1, '2018-11-09', '2', 2);
INSERT INTO `contents` VALUES (8, '潇洒走一回', '　《骆驼祥子》读书笔记摘抄好词好句\r\n\r\n　　文/风华居\r\n\r\n　　骆驼祥子》写的是旧中国北平一个外号骆驼，名叫祥子的人力车夫的悲剧，以下是小编为大家搜集整理的《骆驼祥子》读书笔记摘抄好词好句，欢迎参考！\r\n\r\n　　一、好词摘抄\r\n\r\n　　千载难逢、与众不同、一声不响、轻描淡写、任劳任怨、小心谨慎、一来二去、自讨无趣、无法无天、南腔北调、爱钱如铭、礼尚往来、莫名其妙、低声下气、垂头丧气、千言万语、甘居人后、随机应变、与世无争、自有专长、省吃俭用、无中生有、立竿见影、兵荒马乱、淡而不厌、干净利落、无缘无故、引经据典、卖好讨俏、无话可说、改邪归正、另眼相待、一清二白、一刀两断、如何是好、忘恩负义\r\n\r\n　　二、好句摘抄\r\n\r\n　　1、最伟大的牺牲是忍辱，最伟大的忍辱是反抗。\r\n\r\n　　2、他们自己可是不会跑，因为腿脚被钱赘的太沉重。\r\n\r\n　　3、那时候，他满心都是希望；现在，一肚子都是忧虑。\r\n\r\n　　4、为金钱而工作的，怕遇到更多的金钱，忠诚不立在金钱上。\r\n\r\n　　5、爱与不爱，穷人得在金钱上决定、情种只生在大富之家。\r\n\r\n　　6、夜深了，多日的疲乏，与逃走的惊惧，使他身心全不舒服。\r\n\r\n　　7、夜还很黑，空中有些湿冷的雾气，心中更觉得渺茫。\r\n\r\n　　8、难堪渐渐变为羞恼，他的火也上来了；他们瞪他，他也瞪他们。\r\n\r\n　　9、经验是生活的肥料，有什么样的经验便变成什么样的人，在沙漠里养不出牡丹来。\r\n\r\n　　10、那辆车是他的一切挣扎与困苦的总结果与报酬，像身经百战的武士的一颗徽章。\r\n\r\n　　11、钱会把人引进恶劣的社会中去，把高尚的理想撇开，而甘心走入地狱中去。\r\n\r\n　　12、希望使他快活，恐惧使他惊惶，他想睡，但睡不着，四肢像散了似的在一些干草上放着。什么响动也没有，只有天上的星伴着自己的心跳\r\n\r\n　　13、好几次，祥子很想抽冷子闸住车，摔后头这小子一跤，但是他不敢，拉车的得到处忍气。\r\n\r\n　　14、他不愿再走，不愿再看，更不愿再陪着她；他真想一下子跳下去，头朝下，砸破了冰，沉下去，像个死鱼似的冻在冰里《骆驼祥子》读书笔记摘抄好词好句《骆驼祥子》读书笔记摘抄好词好句。\r\n\r\n　　15、她咽了口吐沫，把复杂的神气与情感似乎镇压下去，拿出点由刘四爷得来的外场劲儿，半恼半笑，假装不在乎的样子打了句哈哈。\r\n\r\n　　16、弓子软得颤悠颤悠的，连车把都微微的动弹；车箱是那么亮，垫子是那么白，喇叭是那么响。\r\n\r\n　　17、雨下给富人，也下给穷人；下给义人，也下给不义的人。其实雨并不公道，因为落在一个没有公道的世界上。\r\n\r\n　　18、可是有一天方大小姐叫他去给放进十块钱，他细细看了看那个小折子，上面有字，有小红印；通共，哼，也就有一小打手纸那么沉吧。\r\n\r\n　　19、太阳西斜了，河上的老柳歪歪着，梢头挂着点金光。河水没有多少水，可是长着不少的绿藻，像一条油腻的长绿的带子，窄长，深绿，发出微腥的潮味。\r\n\r\n　　三、好段摘抄\r\n\r\n　　1、走吧，就是一时卖不出骆驼去，似乎也没大关系了；先到城里再说，他渴望再看见城市，虽然那里没有父母亲戚，没有任何财产，可是那到底是他的家，全个的城都是他的家，一到那里他就有办法。\r\n\r\n　　2、体面的，要强的，好梦想的，利己的，个人的，健壮的，伟大的，祥子，不知陪着人家送了多少回殡；不知道何时何地会埋起他自己来，埋起这堕落的，自私的，不幸的，社会病胎里的产儿，个人主义的末路鬼！\r\n\r\n　　3、不知道是往前走呢，还是已经站住了，心中只觉得一浪一浪的波动，似一片波动的黑海，黑暗与心接成一气，都渺茫，都起落，都恍惚。祥子像被一口风哽住，往下连咽了好几口气。\r\n\r\n　　4、风吹弯了路旁的树木，撕碎了店户的布幌，揭净了墙上的报单，遮昏了太阳，唱着，叫着，吼着，回荡着；忽然直弛，像惊狂了的大精灵，扯天扯地的疾走；忽然慌乱，四面八方地乱卷，像不知怎样好而决定乱撞的恶魔；忽然横扫，乘其不备的袭击着地上的一切，扭折了树枝，吹掀了屋瓦，撞断了电线；可是，祥子在那里看着；他刚从风里出来，风并没能把他怎样了！\r\n\r\n　　5、外面的黑暗渐渐习惯了，心中似乎停止了活动，他的眼不由地闭上了。不知道是往前走呢，还是已经站住了，心中只觉得一浪一浪的波动，似一片波动的黑海，黑暗与心接成一气，都渺茫，都起落，都恍惚。忽然心中一动，像想起一些什么，又似乎是听见了一些声响，说不清；可是又睁开了眼。他确是还往前走呢，忘了刚才是想起什么来，四外也并没有什么动静。心跳了一阵，渐渐又平静下来。他嘱咐自己不要再闭上眼，也不要再乱想；快快的到城里是第一件要紧的事。可是心中不想事，眼睛就很容易再闭上，他必须想念着点儿什么，必须醒着。他知道一旦倒下，他可以一气睡三天。想什么呢？他的头有些发晕，身上潮渌渌的难过，头发里发痒，两脚发酸，口中又干又涩。他想不起别的，只想可怜自己。可是，连自己的事也不大能详细的想了，他的头是那么虚空昏胀，仿佛刚想起自己，就又把自己忘记了，像将要灭的蜡烛，连自己也不能照明白了似的。再加上四围的黑暗，使他觉得像在一团黑气里浮荡，虽然知道自己还存在着，还往前迈步，可是没有别的东西来证明他准是在哪里走，就像独自在荒海里浮着那样不敢相信自己《骆驼祥子》读书笔记摘抄好词好句心得体会。他永远没尝受过这种惊疑不定的难过，与绝对的寂闷\r\n\r\n　　平日，他虽不大喜欢交朋友，可是一个人在日光下，有太阳照着他的四肢，有各样东西呈现在目前，他不至于害怕。现在，他还不害怕，只是不能确定一切，使他受不了。设若骆驼们要是象骡马那样不老实，也许倒能教他打起精神去注意它们，而骆驼偏偏是这么驯顺，驯顺得使他不耐烦；在心神最恍惚的时候，他忽然怀疑骆驼是否还在他的背后，叫他吓一跳；他似乎很相信这几个大牲口会轻轻的钻入黑暗的岔路中去，而他一点也不晓得，象拉着块冰那样能渐渐的化尽。\r\n越王勾践世家读书笔记 读《父与子》读书笔记 西游记读书笔记摘抄\r\n\r\n　　《财务自由之路》 读书笔记\r\n\r\n　　文/广口瓶\r\n\r\n　　你真正想要的是什么？\r\n\r\n　　在做过了上两篇文章的财务测评后，我们对自己的财务状况有了一定的了解，从结果看来，多数的人的财务状况并不能令自己满意，不过这并不是什么问题，因为我们总可以改变，这就是生活的意义，我们需要不断成长。\r\n\r\n　　这也是我写这个公众号的意义，因为我深刻的认识到，我身边的不同年龄段的人，他们多数都缺少财富知识，我总希望能够影响一些人，帮助一些人，我想这正是我期望的价值实现，将我的收获与大家分享，一起成长。\r\n\r\n　　如果你的财务状况不好，那么如何改变呢？我在做完侧平时这个问题一直萦绕在脑中。那么让我们进一步翻开这本书，看看作者博多舍费尔的观点。开启《财务自由之路》。\r\n\r\n　　作者在本书的开始就提醒大家仅仅闭门读书不会让你变得富有，使书本的知识成为你知识体系的一部分，你才能变得富有。那是你的潜能才会显现出来。学以致用，从中吸取营养，不断实践贯穿在行动中才是读书的目的。\r\n\r\n　　如果你正捧着这本书，那么你一定是一个非常特别的人，你还没有屈服于周围环境给你的压力。你是一个想要创造自己未来的人。你想要设计自己的未来，你想要过上不平凡的生活。这本书我是在工作之余读的电子版书籍，在读书过程中我经常会看看别人的想法，这种感觉很好，因为你会感觉很多人在与你并肩前行，他们的言语经常会感动到你，我们都不平凡。\r\n\r\n　　乐观主义让你看到事物的积极面，而自信给你一种战胜事物黑暗面的信心。乐观主义和自信是我们处理事务时的很必要精神支柱，尤其是自信，书中作者多次强调了自信的重要性，也是对我触动最大的一方面，我们应该从本质上自信，因为我们真的很优秀，只是缺乏自我发现。\r\n\r\n　　自信指的是，一个人在自身经历的基础上，知道他遇事可以依靠自己。作者对自信的定义很深刻，我们遇到并经历过那么多纷纷扰扰的事，你是否有我可以依靠自己的信念。作者的这句话让我想起当年考研时的那段时光，每天朝九晚五，独自一人，但我一直相信我可以，现在我还能回想起那时夜晚明亮的星。就是那种感觉。\r\n\r\n　　本书的主题：管理你的财务状况，使他服务于你，而非给你带来麻烦。金钱可以使你生活艰难，也可以使你生活轻松。不管你手里有多少财富，即使是一枚硬币，它也可能会变成你日后财富机器的一个部件，让你的金钱为你所用。\r\n\r\n　　想要改变就必须要有所行动，改变自己的方式，首先需要改变的就是思维方式。你的思维方式铸就了你今天的样子。这样的思维方式却并不能让你变成你想成为的样子。如果你现在的财务状况不好，那么你现在的思维就是与之匹配的思维方式，思维方式的改变会引导你改变行为，进而影响的世界观。\r\n\r\n　　生活的五个领域：健康、财务、关系、情感、和人生意义。这五个领域相互影响，错综复杂的缠绕在一起，他们中哪一领域的缺失，都会对其他领域造成强大的影响，我们要让这五个领域都正常运行，他们的协同作用会让你获得广泛的受益。\r\n\r\n　　永远不要为了金钱去做一些无趣的事情。这是我最近感触很深的一句话，身边的同事和同学，他们为了钱在做很多无趣的事情，甚至是他们厌烦的事情。同事厌烦现在的工作，为了赚钱，他的解决方法是去考他并不感兴趣的证书，准备挂靠。难道做不喜欢的工作和考不感兴趣的证书不是同样的事么？为什么要将错误再次重复？为什么不去寻找自己喜欢的事呢，做好感兴趣的事，然后让兴趣为你赚钱呢？\r\n\r\n　　想拥有一台赚钱机器，而非穷其一生当一台赚钱机器。去创造你的赚钱机器，而不是当赚钱机器。我想我们应该把这句话作为我们的财富座右铭。\r\n\r\n　　大多是人不去做自己真正感兴趣的事情的原因是：他们缺钱。这是一个恶性循环。解决方法是：将你的视野建立在你最大的爱好之上。那么开始认识你自己，弄清你真正感兴趣的是什么。之后再想一想你应该如何用你的爱好来赚钱。最好每天都问自己一遍这几个问题，一步步找出最满意的答案。作者的话能让我们重新审视我们现在的状况，你该如何去做呢？\r\n\r\n　　不是你自己规划你的生活。就是别人来规划你的生活。将自己的梦想、目标、价值观、和策略联系在一起。我们应该像个君王一样，来开始规划自己的生活，站在自己思想殿堂的最高处。\r\n\r\n　　梦想：如果你有足够的时间和金钱，你想要做些什么事情。\r\n\r\n　　目标：你想要成为什么样的人，你想要做什么，你想要拥有什么。\r\n\r\n　　价值观：我真正想要的是什么？对我来说真正重要的东西是什么？价值观是一种可能性的选择。只有你确定了知道自己的价值观，才能掌控自己的生活。\r\n\r\n　　策略：需要相关的知识和能力来执行你的计划。\r\n\r\n　　成功意味着得到你想要的东西，而幸福意味着热爱你所拥有的一切。成功并不等同于幸福，之前只是知道这两者不同，却不明白也表述不清其中的差别，作者一语点醒了我，成功意味着得到你想要的东西，幸福意味着热爱你所拥有的一切，请允许我再次重复这句话，我们要成功并且幸福。\r\n\r\n　　一切的开端都起源于我们掌控生活的态度。以前我们经常习惯说生活的态度，现在我觉得作者的这个词更有力量掌控生活的态度。更强调了我们的能动性。\r\n\r\n　　不知道大家读完这些作者的观点是否充满了力量，改变自己的力量，掌控生活的力量。', 1, '2018-11-09', '2', 4);
INSERT INTO `contents` VALUES (9, '潇洒走一回', '　《骆驼祥子》读书笔记摘抄好词好句\r\n\r\n　　文/风华居\r\n\r\n　　骆驼祥子》写的是旧中国北平一个外号骆驼，名叫祥子的人力车夫的悲剧，以下是小编为大家搜集整理的《骆驼祥子》读书笔记摘抄好词好句，欢迎参考！\r\n\r\n　　一、好词摘抄\r\n\r\n　　千载难逢、与众不同、一声不响、轻描淡写、任劳任怨、小心谨慎、一来二去、自讨无趣、无法无天、南腔北调、爱钱如铭、礼尚往来、莫名其妙、低声下气、垂头丧气、千言万语、甘居人后、随机应变、与世无争、自有专长、省吃俭用、无中生有、立竿见影、兵荒马乱、淡而不厌、干净利落、无缘无故、引经据典、卖好讨俏、无话可说、改邪归正、另眼相待、一清二白、一刀两断、如何是好、忘恩负义\r\n\r\n　　二、好句摘抄\r\n\r\n　　1、最伟大的牺牲是忍辱，最伟大的忍辱是反抗。\r\n\r\n　　2、他们自己可是不会跑，因为腿脚被钱赘的太沉重。\r\n\r\n　　3、那时候，他满心都是希望；现在，一肚子都是忧虑。\r\n\r\n　　4、为金钱而工作的，怕遇到更多的金钱，忠诚不立在金钱上。\r\n\r\n　　5、爱与不爱，穷人得在金钱上决定、情种只生在大富之家。\r\n\r\n　　6、夜深了，多日的疲乏，与逃走的惊惧，使他身心全不舒服。\r\n\r\n　　7、夜还很黑，空中有些湿冷的雾气，心中更觉得渺茫。\r\n\r\n　　8、难堪渐渐变为羞恼，他的火也上来了；他们瞪他，他也瞪他们。\r\n\r\n　　9、经验是生活的肥料，有什么样的经验便变成什么样的人，在沙漠里养不出牡丹来。\r\n\r\n　　10、那辆车是他的一切挣扎与困苦的总结果与报酬，像身经百战的武士的一颗徽章。\r\n\r\n　　11、钱会把人引进恶劣的社会中去，把高尚的理想撇开，而甘心走入地狱中去。\r\n\r\n　　12、希望使他快活，恐惧使他惊惶，他想睡，但睡不着，四肢像散了似的在一些干草上放着。什么响动也没有，只有天上的星伴着自己的心跳\r\n\r\n　　13、好几次，祥子很想抽冷子闸住车，摔后头这小子一跤，但是他不敢，拉车的得到处忍气。\r\n\r\n　　14、他不愿再走，不愿再看，更不愿再陪着她；他真想一下子跳下去，头朝下，砸破了冰，沉下去，像个死鱼似的冻在冰里《骆驼祥子》读书笔记摘抄好词好句《骆驼祥子》读书笔记摘抄好词好句。\r\n\r\n　　15、她咽了口吐沫，把复杂的神气与情感似乎镇压下去，拿出点由刘四爷得来的外场劲儿，半恼半笑，假装不在乎的样子打了句哈哈。\r\n\r\n　　16、弓子软得颤悠颤悠的，连车把都微微的动弹；车箱是那么亮，垫子是那么白，喇叭是那么响。\r\n\r\n　　17、雨下给富人，也下给穷人；下给义人，也下给不义的人。其实雨并不公道，因为落在一个没有公道的世界上。\r\n\r\n　　18、可是有一天方大小姐叫他去给放进十块钱，他细细看了看那个小折子，上面有字，有小红印；通共，哼，也就有一小打手纸那么沉吧。\r\n\r\n　　19、太阳西斜了，河上的老柳歪歪着，梢头挂着点金光。河水没有多少水，可是长着不少的绿藻，像一条油腻的长绿的带子，窄长，深绿，发出微腥的潮味。\r\n\r\n　　三、好段摘抄\r\n\r\n　　1、走吧，就是一时卖不出骆驼去，似乎也没大关系了；先到城里再说，他渴望再看见城市，虽然那里没有父母亲戚，没有任何财产，可是那到底是他的家，全个的城都是他的家，一到那里他就有办法。\r\n\r\n　　2、体面的，要强的，好梦想的，利己的，个人的，健壮的，伟大的，祥子，不知陪着人家送了多少回殡；不知道何时何地会埋起他自己来，埋起这堕落的，自私的，不幸的，社会病胎里的产儿，个人主义的末路鬼！\r\n\r\n　　3、不知道是往前走呢，还是已经站住了，心中只觉得一浪一浪的波动，似一片波动的黑海，黑暗与心接成一气，都渺茫，都起落，都恍惚。祥子像被一口风哽住，往下连咽了好几口气。\r\n\r\n　　4、风吹弯了路旁的树木，撕碎了店户的布幌，揭净了墙上的报单，遮昏了太阳，唱着，叫着，吼着，回荡着；忽然直弛，像惊狂了的大精灵，扯天扯地的疾走；忽然慌乱，四面八方地乱卷，像不知怎样好而决定乱撞的恶魔；忽然横扫，乘其不备的袭击着地上的一切，扭折了树枝，吹掀了屋瓦，撞断了电线；可是，祥子在那里看着；他刚从风里出来，风并没能把他怎样了！\r\n\r\n　　5、外面的黑暗渐渐习惯了，心中似乎停止了活动，他的眼不由地闭上了。不知道是往前走呢，还是已经站住了，心中只觉得一浪一浪的波动，似一片波动的黑海，黑暗与心接成一气，都渺茫，都起落，都恍惚。忽然心中一动，像想起一些什么，又似乎是听见了一些声响，说不清；可是又睁开了眼。他确是还往前走呢，忘了刚才是想起什么来，四外也并没有什么动静。心跳了一阵，渐渐又平静下来。他嘱咐自己不要再闭上眼，也不要再乱想；快快的到城里是第一件要紧的事。可是心中不想事，眼睛就很容易再闭上，他必须想念着点儿什么，必须醒着。他知道一旦倒下，他可以一气睡三天。想什么呢？他的头有些发晕，身上潮渌渌的难过，头发里发痒，两脚发酸，口中又干又涩。他想不起别的，只想可怜自己。可是，连自己的事也不大能详细的想了，他的头是那么虚空昏胀，仿佛刚想起自己，就又把自己忘记了，像将要灭的蜡烛，连自己也不能照明白了似的。再加上四围的黑暗，使他觉得像在一团黑气里浮荡，虽然知道自己还存在着，还往前迈步，可是没有别的东西来证明他准是在哪里走，就像独自在荒海里浮着那样不敢相信自己《骆驼祥子》读书笔记摘抄好词好句心得体会。他永远没尝受过这种惊疑不定的难过，与绝对的寂闷\r\n\r\n　　平日，他虽不大喜欢交朋友，可是一个人在日光下，有太阳照着他的四肢，有各样东西呈现在目前，他不至于害怕。现在，他还不害怕，只是不能确定一切，使他受不了。设若骆驼们要是象骡马那样不老实，也许倒能教他打起精神去注意它们，而骆驼偏偏是这么驯顺，驯顺得使他不耐烦；在心神最恍惚的时候，他忽然怀疑骆驼是否还在他的背后，叫他吓一跳；他似乎很相信这几个大牲口会轻轻的钻入黑暗的岔路中去，而他一点也不晓得，象拉着块冰那样能渐渐的化尽。\r\n越王勾践世家读书笔记 读《父与子》读书笔记 西游记读书笔记摘抄\r\n\r\n　　《财务自由之路》 读书笔记\r\n\r\n　　文/广口瓶\r\n\r\n　　你真正想要的是什么？\r\n\r\n　　在做过了上两篇文章的财务测评后，我们对自己的财务状况有了一定的了解，从结果看来，多数的人的财务状况并不能令自己满意，不过这并不是什么问题，因为我们总可以改变，这就是生活的意义，我们需要不断成长。\r\n\r\n　　这也是我写这个公众号的意义，因为我深刻的认识到，我身边的不同年龄段的人，他们多数都缺少财富知识，我总希望能够影响一些人，帮助一些人，我想这正是我期望的价值实现，将我的收获与大家分享，一起成长。\r\n\r\n　　如果你的财务状况不好，那么如何改变呢？我在做完侧平时这个问题一直萦绕在脑中。那么让我们进一步翻开这本书，看看作者博多舍费尔的观点。开启《财务自由之路》。\r\n\r\n　　作者在本书的开始就提醒大家仅仅闭门读书不会让你变得富有，使书本的知识成为你知识体系的一部分，你才能变得富有。那是你的潜能才会显现出来。学以致用，从中吸取营养，不断实践贯穿在行动中才是读书的目的。\r\n\r\n　　如果你正捧着这本书，那么你一定是一个非常特别的人，你还没有屈服于周围环境给你的压力。你是一个想要创造自己未来的人。你想要设计自己的未来，你想要过上不平凡的生活。这本书我是在工作之余读的电子版书籍，在读书过程中我经常会看看别人的想法，这种感觉很好，因为你会感觉很多人在与你并肩前行，他们的言语经常会感动到你，我们都不平凡。\r\n\r\n　　乐观主义让你看到事物的积极面，而自信给你一种战胜事物黑暗面的信心。乐观主义和自信是我们处理事务时的很必要精神支柱，尤其是自信，书中作者多次强调了自信的重要性，也是对我触动最大的一方面，我们应该从本质上自信，因为我们真的很优秀，只是缺乏自我发现。\r\n\r\n　　自信指的是，一个人在自身经历的基础上，知道他遇事可以依靠自己。作者对自信的定义很深刻，我们遇到并经历过那么多纷纷扰扰的事，你是否有我可以依靠自己的信念。作者的这句话让我想起当年考研时的那段时光，每天朝九晚五，独自一人，但我一直相信我可以，现在我还能回想起那时夜晚明亮的星。就是那种感觉。\r\n\r\n　　本书的主题：管理你的财务状况，使他服务于你，而非给你带来麻烦。金钱可以使你生活艰难，也可以使你生活轻松。不管你手里有多少财富，即使是一枚硬币，它也可能会变成你日后财富机器的一个部件，让你的金钱为你所用。\r\n\r\n　　想要改变就必须要有所行动，改变自己的方式，首先需要改变的就是思维方式。你的思维方式铸就了你今天的样子。这样的思维方式却并不能让你变成你想成为的样子。如果你现在的财务状况不好，那么你现在的思维就是与之匹配的思维方式，思维方式的改变会引导你改变行为，进而影响的世界观。\r\n\r\n　　生活的五个领域：健康、财务、关系、情感、和人生意义。这五个领域相互影响，错综复杂的缠绕在一起，他们中哪一领域的缺失，都会对其他领域造成强大的影响，我们要让这五个领域都正常运行，他们的协同作用会让你获得广泛的受益。\r\n\r\n　　永远不要为了金钱去做一些无趣的事情。这是我最近感触很深的一句话，身边的同事和同学，他们为了钱在做很多无趣的事情，甚至是他们厌烦的事情。同事厌烦现在的工作，为了赚钱，他的解决方法是去考他并不感兴趣的证书，准备挂靠。难道做不喜欢的工作和考不感兴趣的证书不是同样的事么？为什么要将错误再次重复？为什么不去寻找自己喜欢的事呢，做好感兴趣的事，然后让兴趣为你赚钱呢？\r\n\r\n　　想拥有一台赚钱机器，而非穷其一生当一台赚钱机器。去创造你的赚钱机器，而不是当赚钱机器。我想我们应该把这句话作为我们的财富座右铭。\r\n\r\n　　大多是人不去做自己真正感兴趣的事情的原因是：他们缺钱。这是一个恶性循环。解决方法是：将你的视野建立在你最大的爱好之上。那么开始认识你自己，弄清你真正感兴趣的是什么。之后再想一想你应该如何用你的爱好来赚钱。最好每天都问自己一遍这几个问题，一步步找出最满意的答案。作者的话能让我们重新审视我们现在的状况，你该如何去做呢？\r\n\r\n　　不是你自己规划你的生活。就是别人来规划你的生活。将自己的梦想、目标、价值观、和策略联系在一起。我们应该像个君王一样，来开始规划自己的生活，站在自己思想殿堂的最高处。\r\n\r\n　　梦想：如果你有足够的时间和金钱，你想要做些什么事情。\r\n\r\n　　目标：你想要成为什么样的人，你想要做什么，你想要拥有什么。\r\n\r\n　　价值观：我真正想要的是什么？对我来说真正重要的东西是什么？价值观是一种可能性的选择。只有你确定了知道自己的价值观，才能掌控自己的生活。\r\n\r\n　　策略：需要相关的知识和能力来执行你的计划。\r\n\r\n　　成功意味着得到你想要的东西，而幸福意味着热爱你所拥有的一切。成功并不等同于幸福，之前只是知道这两者不同，却不明白也表述不清其中的差别，作者一语点醒了我，成功意味着得到你想要的东西，幸福意味着热爱你所拥有的一切，请允许我再次重复这句话，我们要成功并且幸福。\r\n\r\n　　一切的开端都起源于我们掌控生活的态度。以前我们经常习惯说生活的态度，现在我觉得作者的这个词更有力量掌控生活的态度。更强调了我们的能动性。\r\n\r\n　　不知道大家读完这些作者的观点是否充满了力量，改变自己的力量，掌控生活的力量。', 1, '2018-11-09', '2', 4);
INSERT INTO `contents` VALUES (10, 'java', '## Blog\r\n\r\n[Blog](https://github.com/zhisheng17/blog)  fork from [My Blog](https://github.com/ZHENFENG13/My-Blog) , 该作者是在 [Tale](https://github.com/otale/tale) 博客系统基础上进行修改的。\r\n\r\n`Tale` 使用了轻量级 mvc 框架 `Blade` 开发，默认主题使用了漂亮的 `pinghsu` 。\r\n\r\n`My-Blog` 使用的是 Docker + SpringBoot + Mybatis + thymeleaf 打造的一个个人博客模板。\r\n\r\n***\r\n\r\n[Blog](https://github.com/zhisheng17/blog)  在  [My Blog](https://github.com/ZHENFENG13/My-Blog)  的基础上去除了 Docker，采用的是 SpringBoot + Mybatis + thymeleaf  + MySQL 搭建的一个博客，其中在原来作者的基础上优化了。\r\n\r\n## 开源协议\r\n\r\n[MIT](./LICENSE)\r\n\r\n## 感谢\r\n\r\n[ZHENFENG13](https://github.com/ZHENFENG13)\r\n\r\n[otale](https://github.com/otale)\r\n', 1, '2018-11-09', '1', 1);
INSERT INTO `contents` VALUES (11, 'java', '## Blog\r\n\r\n[Blog](https://github.com/zhisheng17/blog)  fork from [My Blog](https://github.com/ZHENFENG13/My-Blog) , 该作者是在 [Tale](https://github.com/otale/tale) 博客系统基础上进行修改的。\r\n\r\n`Tale` 使用了轻量级 mvc 框架 `Blade` 开发，默认主题使用了漂亮的 `pinghsu` 。\r\n\r\n`My-Blog` 使用的是 Docker + SpringBoot + Mybatis + thymeleaf 打造的一个个人博客模板。\r\n\r\n***\r\n\r\n[Blog](https://github.com/zhisheng17/blog)  在  [My Blog](https://github.com/ZHENFENG13/My-Blog)  的基础上去除了 Docker，采用的是 SpringBoot + Mybatis + thymeleaf  + MySQL 搭建的一个博客，其中在原来作者的基础上优化了。\r\n\r\n## 开源协议\r\n\r\n[MIT](./LICENSE)\r\n\r\n## 感谢\r\n\r\n[ZHENFENG13](https://github.com/ZHENFENG13)\r\n\r\n[otale](https://github.com/otale)\r\n', 1, '2018-11-09', '2', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `u_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密码',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机号码',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '状态：1普通用户，2管理员',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'bb83fd9717702d0a250cfc01bf9191c1', '男', '1987196944@qq.com', '18218681371', '2', '\\images\\user\\01.jpg');
INSERT INTO `user` VALUES (2, '易建联', 'bb83fd9717702d0a250cfc01bf9191c1', '男', '123@qq.com', '18218681372', '1', '\\images\\user\\01.jpg');
INSERT INTO `user` VALUES (3, '赵睿', '9f1e4864f6c90dc1f7d22aa9c0235abb', '女', '12345@qq.com', '13415816309', '1', '\\images\\user\\01.jpg');
INSERT INTO `user` VALUES (4, '胡明轩', '90317d672281f2f3b7bf9f7c594aee30', '男', '123465@qq.com', '18475163062', '1', '\\images\\user\\01.jpg');
INSERT INTO `user` VALUES (5, '亚不都', 'bb83fd9717702d0a250cfc01bf9191c1', '男', '123345@qq.com', '13415816308', '1', '\\images\\user\\01.jpg ');
INSERT INTO `user` VALUES (6, '3', '87fbe006914e0b55056d68dd62d8f203', '女', '12365@qq.com', '13415816302', '1', '\\images\\user\\01.jpg ');
INSERT INTO `user` VALUES (7, '朱婷', 'bb83fd9717702d0a250cfc01bf9191c1', '女', '1233435@qq.com', '13415816301', '1', '\\images\\user\\01.jpg ');

SET FOREIGN_KEY_CHECKS = 1;
