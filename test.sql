/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50173
 File Encoding         : 65001

 Date: 13/06/2020 17:08:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for vote_main
-- ----------------------------
DROP TABLE IF EXISTS `vote_main`;
CREATE TABLE `vote_main`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投票表id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '投票标题',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人员',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人员',
  `start_time` datetime DEFAULT NULL COMMENT '投票开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '投票结束时间',
  `is_valid` int(2) DEFAULT NULL COMMENT '是否有效，1：有效，2：无效',
  `need_count` int(1) DEFAULT NULL COMMENT '用户提交后是否需要展示统计汇总页面，0：不需要，1：需要',
  `weixin_share_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信分享的标题',
  `weixin_share_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信分享的描述',
  `weixin_share_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信分享的logo',
  `type` int(10) DEFAULT NULL COMMENT '类型，1：投票，2：问答',
  `vote_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '投票id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投票主体表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vote_main
-- ----------------------------
INSERT INTO `vote_main` VALUES (1, 'qeqewd', '2020-06-10 17:00:01', '2020-06-10 17:00:01', 'admin', 'admin', '2020-06-10 00:00:00', '2020-06-11 00:00:00', 1, 1, NULL, NULL, NULL, 1, NULL);
INSERT INTO `vote_main` VALUES (2, 'qwertyy', '2020-06-10 17:29:48', '2020-06-10 17:29:48', 'admin', 'admin', '2020-06-10 00:00:00', '2020-06-12 00:00:00', 1, 1, NULL, NULL, NULL, 1, 'aa5e89c0-25aa-4c00-8d7f-498722914428');
INSERT INTO `vote_main` VALUES (3, 'dwefw', '2020-06-10 17:38:01', '2020-06-10 17:38:01', 'admin', 'admin', '2020-06-10 00:00:00', '2020-06-12 00:00:00', 1, 1, NULL, NULL, NULL, 1, 'bc48826f-c9bf-42cd-b417-1e8f2de20525');
INSERT INTO `vote_main` VALUES (14, '投票01', '2020-06-11 10:56:00', '2020-06-11 10:56:00', 'anonymousUser', 'anonymousUser', '2020-06-11 00:00:00', '2020-06-18 00:00:00', 1, 1, NULL, NULL, NULL, 1, '35cec0ad-118f-446e-8172-1cd89616a36f');
INSERT INTO `vote_main` VALUES (15, '季度投票', '2020-06-11 10:59:22', '2020-06-11 10:59:22', 'admin', 'admin', '2020-06-12 00:00:00', '2020-06-15 00:00:00', 1, 1, NULL, NULL, NULL, 1, 'eeb3f8e6-baf0-4d03-bb9c-9606d37f2b14');
INSERT INTO `vote_main` VALUES (16, '季度投票', '2020-06-11 11:00:22', '2020-06-11 11:00:22', 'admin', 'admin', '2020-06-12 00:00:00', '2020-06-15 00:00:00', 1, 1, NULL, NULL, NULL, 1, '004b3af6-9cfd-41c1-b733-d9e26f2f0122');
INSERT INTO `vote_main` VALUES (19, '季度投票', '2020-06-11 11:12:46', '2020-06-11 11:12:46', 'admin', 'admin', '2020-06-11 00:00:00', '2020-06-25 00:00:00', 1, 1, NULL, NULL, NULL, 1, '624d6d81-af45-4f39-aba7-3527e1a80f2d');
INSERT INTO `vote_main` VALUES (20, '2020年度投票', '2020-06-11 16:14:28', '2020-06-11 16:14:28', 'admin', 'admin', '2020-06-11 00:00:00', '2020-06-16 00:00:00', 1, 1, NULL, NULL, NULL, 1, 'e5cd5cb1-7d75-4f85-806a-ebf1e0f41811');
INSERT INTO `vote_main` VALUES (21, '2020年度投票', '2020-06-11 16:15:46', '2020-06-11 16:15:46', 'admin', 'admin', '2020-06-11 00:00:00', '2020-06-16 00:00:00', 1, 1, NULL, NULL, NULL, 1, '4205694e-bac8-42f7-81ac-201480b41bd8');
INSERT INTO `vote_main` VALUES (22, '投票333', '2020-06-11 16:21:36', '2020-06-11 16:21:36', 'admin', 'admin', '2020-06-11 00:00:00', '2020-06-19 00:00:00', 1, 1, NULL, NULL, NULL, 1, 'e645b0c5-1d07-418f-b68b-9c5adadd2c8e');
INSERT INTO `vote_main` VALUES (23, '水电费繁荣的个人', '2020-06-11 16:32:46', '2020-06-11 16:32:46', 'admin', 'admin', '2020-06-11 00:00:00', '2020-06-13 00:00:00', 1, 1, NULL, NULL, NULL, 1, 'eccf758d-d07f-4ef6-a935-19967dcede35');
INSERT INTO `vote_main` VALUES (24, '出生地三', '2020-06-11 16:35:31', '2020-06-11 16:35:31', 'admin', 'admin', '2020-06-11 00:00:00', '2020-06-12 00:00:00', 1, 1, NULL, NULL, NULL, 1, 'e90dfd9b-d098-4779-9a40-d32fb62ad775');
INSERT INTO `vote_main` VALUES (25, '是否发生', '2020-06-11 16:38:36', '2020-06-11 16:38:36', 'admin', 'admin', '2020-06-11 00:00:00', '2020-06-11 00:00:00', 1, 1, NULL, NULL, NULL, 1, '247b1036-ffc9-416e-bbda-e2a6069ab38a');
INSERT INTO `vote_main` VALUES (26, 'csv上传投票', '2020-06-12 13:55:03', '2020-06-12 13:55:03', 'admin', 'admin', '2020-06-12 00:00:00', '2020-06-15 00:00:00', 1, 1, NULL, NULL, NULL, 1, '919f9e8a-375d-4cac-aff1-5fe5c212f1a3');
INSERT INTO `vote_main` VALUES (27, '投票225', '2020-06-12 13:58:51', '2020-06-12 13:58:51', 'admin', 'admin', '2020-06-12 00:00:00', '2020-06-13 00:00:00', 1, 1, NULL, NULL, NULL, 1, 'a3c0a691-5002-4c1f-8d36-0a472b10f289');
INSERT INTO `vote_main` VALUES (28, '投票669', '2020-06-12 14:24:40', '2020-06-12 14:24:40', 'admin', 'admin', '2020-06-12 00:00:00', '2020-06-18 00:00:00', 1, 1, NULL, NULL, NULL, 1, 'e4a2b1d1-ce26-4b49-b029-75e16f552f44');
INSERT INTO `vote_main` VALUES (29, '投票665', '2020-06-12 14:26:51', '2020-06-12 14:26:51', 'admin', 'admin', '2020-06-12 00:00:00', '2020-06-13 00:00:00', 1, 1, NULL, NULL, NULL, 1, '1854dc71-e38b-4fdc-9e9f-697c43168613');
INSERT INTO `vote_main` VALUES (30, '投票987', '2020-06-12 14:28:17', '2020-06-12 14:28:17', 'admin', 'admin', '2020-06-12 00:00:00', '2020-06-13 00:00:00', 1, 1, NULL, NULL, NULL, 1, '9c9a076e-42a9-4145-ad7b-821e19ff17d8');

-- ----------------------------
-- Table structure for vote_options
-- ----------------------------
DROP TABLE IF EXISTS `vote_options`;
CREATE TABLE `vote_options`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投票选项id',
  `options_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '投票选项名称',
  `question_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '投票选项所属问题id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人员',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人员',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片url路径',
  `select_count` int(10) DEFAULT NULL COMMENT '投票选项被选择数量',
  `option_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '投票选项id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投票选项表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vote_options
-- ----------------------------
INSERT INTO `vote_options` VALUES (6, NULL, '3dfacfee-a2d4-4a8b-8ffd-edbea560980b', '2020-06-11 10:56:02', '2020-06-11 10:56:02', 'anonymousUser', 'anonymousUser', NULL, 0, 'c182385b-bb96-49b1-bf6a-08b3dc05775e');
INSERT INTO `vote_options` VALUES (7, NULL, '3dfacfee-a2d4-4a8b-8ffd-edbea560980b', '2020-06-11 10:56:02', '2020-06-11 10:56:02', 'anonymousUser', 'anonymousUser', NULL, 0, '558106cc-52ba-4000-8c6e-4d3098830a91');
INSERT INTO `vote_options` VALUES (8, NULL, '3dfacfee-a2d4-4a8b-8ffd-edbea560980b', '2020-06-11 10:56:02', '2020-06-11 10:56:02', 'anonymousUser', 'anonymousUser', NULL, 0, 'e55161cd-9ecc-4b84-82ef-525c2fe59a78');
INSERT INTO `vote_options` VALUES (9, NULL, '43d70a9f-13d8-4623-a7ae-b735dccaf303', '2020-06-11 10:56:02', '2020-06-11 10:56:02', 'anonymousUser', 'anonymousUser', NULL, 0, '3a65f725-7dfe-4f11-9f7f-52f77c1e1e39');
INSERT INTO `vote_options` VALUES (10, NULL, '43d70a9f-13d8-4623-a7ae-b735dccaf303', '2020-06-11 10:56:02', '2020-06-11 10:56:02', 'anonymousUser', 'anonymousUser', NULL, 0, '04fd6eae-7fd0-4141-b54a-1c4d57208ec6');
INSERT INTO `vote_options` VALUES (11, NULL, 'dcccd85e-1bba-4cd0-8992-5db40d0d8093', '2020-06-11 11:00:11', '2020-06-11 11:00:11', 'admin', 'admin', NULL, 0, '492a76cb-4073-42b2-9454-c5f4d50198c5');
INSERT INTO `vote_options` VALUES (12, NULL, 'dcccd85e-1bba-4cd0-8992-5db40d0d8093', '2020-06-11 11:00:11', '2020-06-11 11:00:11', 'admin', 'admin', NULL, 0, '1c1647ca-f0e3-4c4a-af69-d5ea186f7ebe');
INSERT INTO `vote_options` VALUES (13, NULL, 'dcccd85e-1bba-4cd0-8992-5db40d0d8093', '2020-06-11 11:00:11', '2020-06-11 11:00:11', 'admin', 'admin', NULL, 0, 'de2154c4-16e5-4b0c-af59-43948ce31faf');
INSERT INTO `vote_options` VALUES (14, NULL, 'cd3ad851-b173-44c6-b611-fb8ebbff9ced', '2020-06-11 11:00:11', '2020-06-11 11:00:11', 'admin', 'admin', NULL, 0, 'f0487583-6687-46ca-832a-b2b5f2b8a078');
INSERT INTO `vote_options` VALUES (15, NULL, 'cd3ad851-b173-44c6-b611-fb8ebbff9ced', '2020-06-11 11:00:11', '2020-06-11 11:00:11', 'admin', 'admin', NULL, 0, '1b4b2c87-1a65-4334-ad95-62705413c30f');
INSERT INTO `vote_options` VALUES (16, NULL, 'dcccd85e-1bba-4cd0-8992-5db40d0d8093', '2020-06-11 11:01:26', '2020-06-11 11:01:26', 'admin', 'admin', NULL, 0, '492a76cb-4073-42b2-9454-c5f4d50198c5');
INSERT INTO `vote_options` VALUES (17, NULL, 'dcccd85e-1bba-4cd0-8992-5db40d0d8093', '2020-06-11 11:01:26', '2020-06-11 11:01:26', 'admin', 'admin', NULL, 0, '1c1647ca-f0e3-4c4a-af69-d5ea186f7ebe');
INSERT INTO `vote_options` VALUES (18, NULL, 'dcccd85e-1bba-4cd0-8992-5db40d0d8093', '2020-06-11 11:01:26', '2020-06-11 11:01:26', 'admin', 'admin', NULL, 0, 'de2154c4-16e5-4b0c-af59-43948ce31faf');
INSERT INTO `vote_options` VALUES (19, NULL, 'cd3ad851-b173-44c6-b611-fb8ebbff9ced', '2020-06-11 11:01:26', '2020-06-11 11:01:26', 'admin', 'admin', NULL, 0, 'f0487583-6687-46ca-832a-b2b5f2b8a078');
INSERT INTO `vote_options` VALUES (20, NULL, 'cd3ad851-b173-44c6-b611-fb8ebbff9ced', '2020-06-11 11:01:26', '2020-06-11 11:01:26', 'admin', 'admin', NULL, 0, '1b4b2c87-1a65-4334-ad95-62705413c30f');
INSERT INTO `vote_options` VALUES (21, '啥事', '9f9c0dc3-9811-4231-99df-85bce676a29e', '2020-06-11 11:12:47', '2020-06-11 11:12:47', 'admin', 'admin', 'D:\\Program Files\\apache-tomcat-7.0.96\\bin/voteimg/9f9c0dc3-9811-4231-99df-85bce676a29evote_options_1.jpg', 0, '25cf682f-5a33-4d92-bf36-12981e85d06b');
INSERT INTO `vote_options` VALUES (22, '22323', '9f9c0dc3-9811-4231-99df-85bce676a29e', '2020-06-11 11:12:47', '2020-06-11 11:12:47', 'admin', 'admin', 'D:\\Program Files\\apache-tomcat-7.0.96\\bin/voteimg/9f9c0dc3-9811-4231-99df-85bce676a29evote_options_2.jpg', 0, '2ca88788-b172-4e19-a188-5c2fdf37e7ec');
INSERT INTO `vote_options` VALUES (23, '所产生的', '88a74fe1-bb29-4904-aeb1-cdf328c84b30', '2020-06-11 11:12:47', '2020-06-11 11:12:47', 'admin', 'admin', 'D:\\Program Files\\apache-tomcat-7.0.96\\bin/voteimg/88a74fe1-bb29-4904-aeb1-cdf328c84b30vote_options_1.jpg', 0, 'c0798e02-2d0a-4fcc-bbd5-ee56d584f550');
INSERT INTO `vote_options` VALUES (24, '葵葵', '88a74fe1-bb29-4904-aeb1-cdf328c84b30', '2020-06-11 11:12:47', '2020-06-11 11:12:47', 'admin', 'admin', NULL, 0, '7c1585f5-44b5-4472-acf4-d7e0516f77e6');
INSERT INTO `vote_options` VALUES (25, '俺的份', 'c5dd4020-7bf6-4329-b76a-fa5500d817b9', '2020-06-11 16:14:31', '2020-06-11 16:14:31', 'admin', 'admin', 'D:\\Program Files\\apache-tomcat-7.0.96\\bin/voteimg/c5dd4020-7bf6-4329-b76a-fa5500d817b9vote_options_1.jpg', 0, '64bb9ece-098e-49ae-b527-2d33d9896692');
INSERT INTO `vote_options` VALUES (26, '定位费', 'c5dd4020-7bf6-4329-b76a-fa5500d817b9', '2020-06-11 16:14:31', '2020-06-11 16:14:31', 'admin', 'admin', NULL, 0, '17260733-e400-420e-8da3-947f5f279868');
INSERT INTO `vote_options` VALUES (27, '访问F', 'c5dd4020-7bf6-4329-b76a-fa5500d817b9', '2020-06-11 16:14:31', '2020-06-11 16:14:31', 'admin', 'admin', NULL, 0, '374f5141-58f9-43ea-9abf-01fca3855f64');
INSERT INTO `vote_options` VALUES (28, '问问', 'c32c57eb-de39-461c-9f64-d50c0bd75c4f', '2020-06-11 16:14:31', '2020-06-11 16:14:31', 'admin', 'admin', NULL, 0, '94b8fbe8-2ef4-4570-8a00-6bdc8eedee44');
INSERT INTO `vote_options` VALUES (29, '分阿尔法', 'c32c57eb-de39-461c-9f64-d50c0bd75c4f', '2020-06-11 16:14:31', '2020-06-11 16:14:31', 'admin', 'admin', NULL, 0, 'b74a5bef-3ed8-44f7-8a63-385beb4d6f20');
INSERT INTO `vote_options` VALUES (30, '天天', 'c32c57eb-de39-461c-9f64-d50c0bd75c4f', '2020-06-11 16:14:31', '2020-06-11 16:14:31', 'admin', 'admin', 'D:\\Program Files\\apache-tomcat-7.0.96\\bin/voteimg/c32c57eb-de39-461c-9f64-d50c0bd75c4fvote_options_3.jpg', 0, '42666ab1-8795-4537-877a-c919ec011483');
INSERT INTO `vote_options` VALUES (31, '俺的份', 'c5dd4020-7bf6-4329-b76a-fa5500d817b9', '2020-06-11 16:15:47', '2020-06-11 16:15:47', 'admin', 'admin', 'D:\\Program Files\\apache-tomcat-7.0.96\\bin/voteimg/c5dd4020-7bf6-4329-b76a-fa5500d817b9vote_options_1.jpg', 0, '64bb9ece-098e-49ae-b527-2d33d9896692');
INSERT INTO `vote_options` VALUES (32, '定位费', 'c5dd4020-7bf6-4329-b76a-fa5500d817b9', '2020-06-11 16:15:47', '2020-06-11 16:15:47', 'admin', 'admin', NULL, 0, '17260733-e400-420e-8da3-947f5f279868');
INSERT INTO `vote_options` VALUES (33, '访问F', 'c5dd4020-7bf6-4329-b76a-fa5500d817b9', '2020-06-11 16:15:47', '2020-06-11 16:15:47', 'admin', 'admin', NULL, 0, '374f5141-58f9-43ea-9abf-01fca3855f64');
INSERT INTO `vote_options` VALUES (34, '问问', 'c32c57eb-de39-461c-9f64-d50c0bd75c4f', '2020-06-11 16:15:47', '2020-06-11 16:15:47', 'admin', 'admin', NULL, 0, '94b8fbe8-2ef4-4570-8a00-6bdc8eedee44');
INSERT INTO `vote_options` VALUES (35, '分阿尔法', 'c32c57eb-de39-461c-9f64-d50c0bd75c4f', '2020-06-11 16:15:47', '2020-06-11 16:15:47', 'admin', 'admin', NULL, 0, 'b74a5bef-3ed8-44f7-8a63-385beb4d6f20');
INSERT INTO `vote_options` VALUES (36, '天天', 'c32c57eb-de39-461c-9f64-d50c0bd75c4f', '2020-06-11 16:15:47', '2020-06-11 16:15:47', 'admin', 'admin', 'D:\\Program Files\\apache-tomcat-7.0.96\\bin/voteimg/c32c57eb-de39-461c-9f64-d50c0bd75c4fvote_options_3.jpg', 0, '42666ab1-8795-4537-877a-c919ec011483');
INSERT INTO `vote_options` VALUES (37, '而非WEF', '9b79785b-f1cd-4981-b489-04024a2d462e', '2020-06-11 16:21:37', '2020-06-11 16:21:37', 'admin', 'admin', NULL, 0, '1e10bc07-bff3-4523-a975-c802b740570a');
INSERT INTO `vote_options` VALUES (38, '我访问', '9b79785b-f1cd-4981-b489-04024a2d462e', '2020-06-11 16:21:37', '2020-06-11 16:21:37', 'admin', 'admin', NULL, 0, 'd47c1c50-6d93-4894-8ed0-e1ca99c567fb');
INSERT INTO `vote_options` VALUES (39, '而非WEF', '9b79785b-f1cd-4981-b489-04024a2d462e', '2020-06-11 16:21:37', '2020-06-11 16:21:37', 'admin', 'admin', NULL, 0, 'f0f127a7-90f6-49fc-b168-59c632b8fbeb');
INSERT INTO `vote_options` VALUES (40, '违法挖而非', 'b6884042-9e8b-43e1-996b-20a042c08f44', '2020-06-11 16:21:37', '2020-06-11 16:21:37', 'admin', 'admin', NULL, 0, 'd4a014aa-603a-436e-a77d-bbdfb625406b');
INSERT INTO `vote_options` VALUES (41, '发文', 'b6884042-9e8b-43e1-996b-20a042c08f44', '2020-06-11 16:21:37', '2020-06-11 16:21:37', 'admin', 'admin', NULL, 0, '5fe7abad-434a-4d5b-80ec-3fed56855372');
INSERT INTO `vote_options` VALUES (42, 'wfwe', '79f6ad1a-e054-4a65-a8fa-1ca5684bb3e2', '2020-06-11 16:32:49', '2020-06-11 16:32:49', 'admin', 'admin', NULL, 0, 'b1b63132-58b7-4f4c-875f-adea3f66ec25');
INSERT INTO `vote_options` VALUES (43, 'wefew', '79f6ad1a-e054-4a65-a8fa-1ca5684bb3e2', '2020-06-11 16:32:49', '2020-06-11 16:32:49', 'admin', 'admin', NULL, 0, 'e4fc9046-87c0-4557-9de9-768070d930e1');
INSERT INTO `vote_options` VALUES (44, 'ff', '7757e82d-b889-4461-b994-e2a31962ea5f', '2020-06-11 16:32:49', '2020-06-11 16:32:49', 'admin', 'admin', NULL, 0, '0aac74d6-3e61-428d-bb95-d3a44dd74c49');
INSERT INTO `vote_options` VALUES (45, '纷纷', '8bc56ba8-7eaf-4aa8-a345-eb26205c70b3', '2020-06-11 16:35:33', '2020-06-11 16:35:33', 'admin', 'admin', NULL, 0, '661bdf8c-9f6f-455e-b0f4-74021b0d7eeb');
INSERT INTO `vote_options` VALUES (46, '个人股', 'dec12cad-bbd9-4acb-8fc1-90060e8ada95', '2020-06-11 16:35:33', '2020-06-11 16:35:33', 'admin', 'admin', NULL, 0, '14f3a807-9f55-4032-b2d2-e099d6027db7');
INSERT INTO `vote_options` VALUES (47, '个个人', 'dec12cad-bbd9-4acb-8fc1-90060e8ada95', '2020-06-11 16:35:33', '2020-06-11 16:35:33', 'admin', 'admin', NULL, 0, '1af58046-9e6c-487d-8c1a-c37d033574ad');
INSERT INTO `vote_options` VALUES (48, '分', '41ca75d2-197f-4478-a8b0-bbf8cb7b77b7', '2020-06-11 16:38:38', '2020-06-11 16:38:38', 'admin', 'admin', NULL, 0, '9dd6edcd-e20b-4e7e-9f7a-8928410f004e');
INSERT INTO `vote_options` VALUES (49, 'A.1111', 'ac4201a7-b7c1-4031-bcf8-f6394c142231', '2020-06-12 13:55:09', '2020-06-12 13:55:09', 'admin', 'admin', NULL, 0, '837f1631-a44c-469a-bcbe-6962fa3b6ac3');
INSERT INTO `vote_options` VALUES (50, 'B.2222', 'ac4201a7-b7c1-4031-bcf8-f6394c142231', '2020-06-12 13:55:09', '2020-06-12 13:55:09', 'admin', 'admin', NULL, 0, '68de086d-639b-4f8e-98cf-42010945bc4d');
INSERT INTO `vote_options` VALUES (51, 'C.3333', 'ac4201a7-b7c1-4031-bcf8-f6394c142231', '2020-06-12 13:55:09', '2020-06-12 13:55:09', 'admin', 'admin', NULL, 0, '0a1f538e-c7b3-4171-90e7-25de9be17365');
INSERT INTO `vote_options` VALUES (52, 'D.4444', 'ac4201a7-b7c1-4031-bcf8-f6394c142231', '2020-06-12 13:55:09', '2020-06-12 13:55:09', 'admin', 'admin', NULL, 0, '09484cf0-779f-4090-b07b-3ddb35b09df0');
INSERT INTO `vote_options` VALUES (53, 'A.5555', '326793e0-b66c-4e2b-9912-60328f151364', '2020-06-12 13:55:09', '2020-06-12 13:55:09', 'admin', 'admin', NULL, 0, 'b30791e6-7736-4196-843b-b2f357d848ba');
INSERT INTO `vote_options` VALUES (54, 'B.6666', '326793e0-b66c-4e2b-9912-60328f151364', '2020-06-12 13:55:09', '2020-06-12 13:55:09', 'admin', 'admin', NULL, 0, 'ce577a99-e319-4249-a978-352641c3b25f');
INSERT INTO `vote_options` VALUES (55, 'C.7777', '326793e0-b66c-4e2b-9912-60328f151364', '2020-06-12 13:55:09', '2020-06-12 13:55:09', 'admin', 'admin', NULL, 0, '27b98a9a-2930-4a1c-94cb-9f2449e84d8e');
INSERT INTO `vote_options` VALUES (56, 'D.8888', '326793e0-b66c-4e2b-9912-60328f151364', '2020-06-12 13:55:09', '2020-06-12 13:55:09', 'admin', 'admin', NULL, 0, '04fa452a-ae71-4680-a103-d47bfca197f5');
INSERT INTO `vote_options` VALUES (57, 'A.1111', '899244aa-9fcd-490b-8544-da76e7b8fe78', '2020-06-12 14:00:28', '2020-06-12 14:00:28', 'admin', 'admin', NULL, 0, 'd3f2ba9d-b976-400e-a1ab-c5953ed2cf4b');
INSERT INTO `vote_options` VALUES (58, 'B.2222', '899244aa-9fcd-490b-8544-da76e7b8fe78', '2020-06-12 14:00:28', '2020-06-12 14:00:28', 'admin', 'admin', NULL, 0, '4f5262c2-ad76-4500-8328-a79ca35f520b');
INSERT INTO `vote_options` VALUES (59, 'C.3333', '899244aa-9fcd-490b-8544-da76e7b8fe78', '2020-06-12 14:00:28', '2020-06-12 14:00:28', 'admin', 'admin', NULL, 0, '35527473-731a-4f25-a1a3-4949cd81843b');
INSERT INTO `vote_options` VALUES (60, 'D.4444', '899244aa-9fcd-490b-8544-da76e7b8fe78', '2020-06-12 14:00:28', '2020-06-12 14:00:28', 'admin', 'admin', NULL, 0, '8634ffb5-3a70-4dc7-803a-bc46cf6f78fc');
INSERT INTO `vote_options` VALUES (61, 'A.5555', '1cad3539-f57c-4a23-ac85-19a6272220c6', '2020-06-12 14:00:28', '2020-06-12 14:00:28', 'admin', 'admin', NULL, 0, 'dc92ce56-3c2c-4bfc-86bf-c750f89467b7');
INSERT INTO `vote_options` VALUES (62, 'B.6666', '1cad3539-f57c-4a23-ac85-19a6272220c6', '2020-06-12 14:00:28', '2020-06-12 14:00:28', 'admin', 'admin', NULL, 0, '1b85fa1e-70df-411f-bdbd-4b4080be6d64');
INSERT INTO `vote_options` VALUES (63, 'C.7777', '1cad3539-f57c-4a23-ac85-19a6272220c6', '2020-06-12 14:00:28', '2020-06-12 14:00:28', 'admin', 'admin', NULL, 0, '3a308ba5-7f3e-4dcb-874d-eb433c37f0dd');
INSERT INTO `vote_options` VALUES (64, 'D.8888', '1cad3539-f57c-4a23-ac85-19a6272220c6', '2020-06-12 14:00:28', '2020-06-12 14:00:28', 'admin', 'admin', NULL, 0, '8b077e8b-f393-42c6-8163-adab73bbaa6e');
INSERT INTO `vote_options` VALUES (65, 'A.5555', '29d49222-a336-451e-8080-db4110e0b844', '2020-06-12 14:24:42', '2020-06-12 14:24:42', 'admin', 'admin', NULL, 0, '72084314-5458-447f-9de8-2c8f8f5b6644');
INSERT INTO `vote_options` VALUES (66, 'B.6666', '29d49222-a336-451e-8080-db4110e0b844', '2020-06-12 14:24:42', '2020-06-12 14:24:42', 'admin', 'admin', NULL, 0, '9103f01f-228c-4623-8ad3-5a8e3935a076');
INSERT INTO `vote_options` VALUES (67, 'C.7777', '29d49222-a336-451e-8080-db4110e0b844', '2020-06-12 14:24:42', '2020-06-12 14:24:42', 'admin', 'admin', NULL, 0, '74f91239-f9af-40d0-a4b0-78b92fdbbc97');
INSERT INTO `vote_options` VALUES (68, 'D.8888', '29d49222-a336-451e-8080-db4110e0b844', '2020-06-12 14:24:42', '2020-06-12 14:24:42', 'admin', 'admin', NULL, 0, 'f8ce6ada-e16c-4061-9c35-e5350e58df41');
INSERT INTO `vote_options` VALUES (69, 'A.1111', 'e30dd46b-e888-41f2-af10-fb744bacc6be', '2020-06-12 14:24:42', '2020-06-12 14:24:42', 'admin', 'admin', NULL, 0, 'f7773fa9-6e1e-4bea-854a-16bf0df29e52');
INSERT INTO `vote_options` VALUES (70, 'B.2222', 'e30dd46b-e888-41f2-af10-fb744bacc6be', '2020-06-12 14:24:42', '2020-06-12 14:24:42', 'admin', 'admin', NULL, 0, '647f223f-9784-4e2a-839f-a6c1b784aa81');
INSERT INTO `vote_options` VALUES (71, 'C.3333', 'e30dd46b-e888-41f2-af10-fb744bacc6be', '2020-06-12 14:24:42', '2020-06-12 14:24:42', 'admin', 'admin', NULL, 0, 'f1cbf9ce-a5cf-4efe-92dd-d04e2ca0dcc6');
INSERT INTO `vote_options` VALUES (72, 'D.4444', 'e30dd46b-e888-41f2-af10-fb744bacc6be', '2020-06-12 14:24:42', '2020-06-12 14:24:42', 'admin', 'admin', NULL, 0, '9866c059-0634-4616-9303-9934cbebf4f0');
INSERT INTO `vote_options` VALUES (73, 'A.1111', '1164fde3-b4d7-44a5-80a7-610621c6d34c', '2020-06-12 14:26:56', '2020-06-12 14:26:56', 'admin', 'admin', NULL, 0, 'f56b6fdf-8cea-43bc-aa2c-e1f14685c29e');
INSERT INTO `vote_options` VALUES (74, 'B.2222', '1164fde3-b4d7-44a5-80a7-610621c6d34c', '2020-06-12 14:26:56', '2020-06-12 14:26:56', 'admin', 'admin', NULL, 0, '6732e39c-3b4c-430a-843a-d33e9ee45e74');
INSERT INTO `vote_options` VALUES (75, 'C.3333', '1164fde3-b4d7-44a5-80a7-610621c6d34c', '2020-06-12 14:26:56', '2020-06-12 14:26:56', 'admin', 'admin', NULL, 0, '63f429c6-f955-4f45-9d47-e68dfaeea58f');
INSERT INTO `vote_options` VALUES (76, 'D.4444', '1164fde3-b4d7-44a5-80a7-610621c6d34c', '2020-06-12 14:26:56', '2020-06-12 14:26:56', 'admin', 'admin', NULL, 0, '2ccd7d0b-a1b7-420e-a9b2-065c8d7b421c');
INSERT INTO `vote_options` VALUES (77, 'A.5555', 'b33ed01e-5611-47d4-a3a2-bc5d63528b79', '2020-06-12 14:26:56', '2020-06-12 14:26:56', 'admin', 'admin', NULL, 0, 'e8538967-0dec-49c7-a1a3-fb819b9f4f30');
INSERT INTO `vote_options` VALUES (78, 'B.6666', 'b33ed01e-5611-47d4-a3a2-bc5d63528b79', '2020-06-12 14:26:56', '2020-06-12 14:26:56', 'admin', 'admin', NULL, 0, '5eec3249-569c-4666-8fea-6d014a8aa3f2');
INSERT INTO `vote_options` VALUES (79, 'C.7777', 'b33ed01e-5611-47d4-a3a2-bc5d63528b79', '2020-06-12 14:26:56', '2020-06-12 14:26:56', 'admin', 'admin', NULL, 0, 'bb96cbfb-b72a-4999-8889-dcaf9f55d7c8');
INSERT INTO `vote_options` VALUES (80, 'D.8888', 'b33ed01e-5611-47d4-a3a2-bc5d63528b79', '2020-06-12 14:26:56', '2020-06-12 14:26:56', 'admin', 'admin', NULL, 0, '02f2cc3c-03b7-4bd2-a53c-46388111fd6f');
INSERT INTO `vote_options` VALUES (81, 'A.1111', '0b065a0d-a737-4fac-a0fd-d9f2ba35d3b4', '2020-06-12 14:28:20', '2020-06-12 14:28:20', 'admin', 'admin', NULL, 0, '317ef814-4c2c-40cd-bb3b-1081d3c29213');
INSERT INTO `vote_options` VALUES (82, 'B.2222', '0b065a0d-a737-4fac-a0fd-d9f2ba35d3b4', '2020-06-12 14:28:20', '2020-06-12 14:28:20', 'admin', 'admin', NULL, 0, 'ba21ff3f-4128-46ee-b440-e5bf1cb9ff7c');
INSERT INTO `vote_options` VALUES (83, 'C.3333', '0b065a0d-a737-4fac-a0fd-d9f2ba35d3b4', '2020-06-12 14:28:20', '2020-06-12 14:28:20', 'admin', 'admin', NULL, 0, 'b0c48888-bcc4-4240-8280-b8e511c268ee');
INSERT INTO `vote_options` VALUES (84, 'D.4444', '0b065a0d-a737-4fac-a0fd-d9f2ba35d3b4', '2020-06-12 14:28:20', '2020-06-12 14:28:20', 'admin', 'admin', NULL, 0, 'acf189c2-f2d3-4937-8caa-d22ba1f105bb');
INSERT INTO `vote_options` VALUES (85, 'A.5555', 'ae3e8309-fd58-4a74-b885-35e88f6d710a', '2020-06-12 14:28:20', '2020-06-12 14:28:20', 'admin', 'admin', NULL, 0, '9a06b709-c7cf-4a70-8f22-9df4c97d3581');
INSERT INTO `vote_options` VALUES (86, 'B.6666', 'ae3e8309-fd58-4a74-b885-35e88f6d710a', '2020-06-12 14:28:20', '2020-06-12 14:28:20', 'admin', 'admin', NULL, 0, '2b54a58d-63fe-4909-820e-8310b933106e');
INSERT INTO `vote_options` VALUES (87, 'C.7777', 'ae3e8309-fd58-4a74-b885-35e88f6d710a', '2020-06-12 14:28:20', '2020-06-12 14:28:20', 'admin', 'admin', NULL, 0, '6dce88e1-9c80-4863-b635-b7bf459afdd0');
INSERT INTO `vote_options` VALUES (88, 'D.8888', 'ae3e8309-fd58-4a74-b885-35e88f6d710a', '2020-06-12 14:28:20', '2020-06-12 14:28:20', 'admin', 'admin', NULL, 0, '6c1482d6-3e2d-4f08-a772-4a708a104aba');

-- ----------------------------
-- Table structure for vote_permission
-- ----------------------------
DROP TABLE IF EXISTS `vote_permission`;
CREATE TABLE `vote_permission`  (
  `id` int(11) NOT NULL COMMENT '用户权限表id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户权限名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '创建人员',
  `update_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '更新人员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vote_question
-- ----------------------------
DROP TABLE IF EXISTS `vote_question`;
CREATE TABLE `vote_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投票问题id',
  `question_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '投票问题名称',
  `vote_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '投票问题所属投票主体',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人员',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人员',
  `question_type` int(2) DEFAULT NULL COMMENT '投票选项类型，1：单选，2：多选，3：输入',
  `question_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '投票问题id',
  `frequency_limit` int(10) DEFAULT NULL COMMENT '每天投票次数限制',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_vote_id`(`vote_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投票问题表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vote_question
-- ----------------------------
INSERT INTO `vote_question` VALUES (1, '问题1', '35cec0ad-118f-446e-8172-1cd89616a36f', '2020-06-11 10:56:02', '2020-06-11 10:56:02', 'anonymousUser', 'anonymousUser', 1, '3dfacfee-a2d4-4a8b-8ffd-edbea560980b', 0);
INSERT INTO `vote_question` VALUES (2, '问题2', '35cec0ad-118f-446e-8172-1cd89616a36f', '2020-06-11 10:56:02', '2020-06-11 10:56:02', 'anonymousUser', 'anonymousUser', 2, '43d70a9f-13d8-4623-a7ae-b735dccaf303', 0);
INSERT INTO `vote_question` VALUES (3, '问题3', '35cec0ad-118f-446e-8172-1cd89616a36f', '2020-06-11 10:56:02', '2020-06-11 10:56:02', 'anonymousUser', 'anonymousUser', 3, 'c8ddf046-99cd-4227-a829-e526818b14a8', 0);
INSERT INTO `vote_question` VALUES (4, '问题1', 'eeb3f8e6-baf0-4d03-bb9c-9606d37f2b14', '2020-06-11 11:00:11', '2020-06-11 11:00:11', 'admin', 'admin', 1, 'dcccd85e-1bba-4cd0-8992-5db40d0d8093', 0);
INSERT INTO `vote_question` VALUES (5, '问题2', 'eeb3f8e6-baf0-4d03-bb9c-9606d37f2b14', '2020-06-11 11:00:11', '2020-06-11 11:00:11', 'admin', 'admin', 2, 'cd3ad851-b173-44c6-b611-fb8ebbff9ced', 0);
INSERT INTO `vote_question` VALUES (6, '问题3', 'eeb3f8e6-baf0-4d03-bb9c-9606d37f2b14', '2020-06-11 11:00:11', '2020-06-11 11:00:11', 'admin', 'admin', 3, '788ac5fd-1108-4867-9917-e643381c4154', 0);
INSERT INTO `vote_question` VALUES (7, '问题1', '004b3af6-9cfd-41c1-b733-d9e26f2f0122', '2020-06-11 11:01:26', '2020-06-11 11:01:26', 'admin', 'admin', 1, 'dcccd85e-1bba-4cd0-8992-5db40d0d8093', 0);
INSERT INTO `vote_question` VALUES (8, '问题2', '004b3af6-9cfd-41c1-b733-d9e26f2f0122', '2020-06-11 11:01:26', '2020-06-11 11:01:26', 'admin', 'admin', 2, 'cd3ad851-b173-44c6-b611-fb8ebbff9ced', 0);
INSERT INTO `vote_question` VALUES (9, '问题3', '004b3af6-9cfd-41c1-b733-d9e26f2f0122', '2020-06-11 11:01:26', '2020-06-11 11:01:26', 'admin', 'admin', 3, '788ac5fd-1108-4867-9917-e643381c4154', 0);
INSERT INTO `vote_question` VALUES (10, '投票问题1', '624d6d81-af45-4f39-aba7-3527e1a80f2d', '2020-06-11 11:12:47', '2020-06-11 11:12:47', 'admin', 'admin', 1, '9f9c0dc3-9811-4231-99df-85bce676a29e', 0);
INSERT INTO `vote_question` VALUES (11, '投票问题2', '624d6d81-af45-4f39-aba7-3527e1a80f2d', '2020-06-11 11:12:47', '2020-06-11 11:12:47', 'admin', 'admin', 1, '88a74fe1-bb29-4904-aeb1-cdf328c84b30', 0);
INSERT INTO `vote_question` VALUES (12, '投票问题3', '624d6d81-af45-4f39-aba7-3527e1a80f2d', '2020-06-11 11:12:47', '2020-06-11 11:12:47', 'admin', 'admin', 3, '483fefcc-20a9-49d1-a1c9-d07bbe96e6a9', 0);
INSERT INTO `vote_question` VALUES (13, '问题1', 'e5cd5cb1-7d75-4f85-806a-ebf1e0f41811', '2020-06-11 16:14:31', '2020-06-11 16:14:31', 'admin', 'admin', 1, 'c5dd4020-7bf6-4329-b76a-fa5500d817b9', 0);
INSERT INTO `vote_question` VALUES (14, '问题2', 'e5cd5cb1-7d75-4f85-806a-ebf1e0f41811', '2020-06-11 16:14:31', '2020-06-11 16:14:31', 'admin', 'admin', 2, 'c32c57eb-de39-461c-9f64-d50c0bd75c4f', 0);
INSERT INTO `vote_question` VALUES (15, '填空', 'e5cd5cb1-7d75-4f85-806a-ebf1e0f41811', '2020-06-11 16:14:31', '2020-06-11 16:14:31', 'admin', 'admin', 3, '356b5e16-3ced-4f81-ba64-267f7bc38cf7', 0);
INSERT INTO `vote_question` VALUES (16, '问题1', '4205694e-bac8-42f7-81ac-201480b41bd8', '2020-06-11 16:15:47', '2020-06-11 16:15:47', 'admin', 'admin', 1, 'c5dd4020-7bf6-4329-b76a-fa5500d817b9', 0);
INSERT INTO `vote_question` VALUES (17, '问题2', '4205694e-bac8-42f7-81ac-201480b41bd8', '2020-06-11 16:15:47', '2020-06-11 16:15:47', 'admin', 'admin', 2, 'c32c57eb-de39-461c-9f64-d50c0bd75c4f', 0);
INSERT INTO `vote_question` VALUES (18, '填空', '4205694e-bac8-42f7-81ac-201480b41bd8', '2020-06-11 16:15:47', '2020-06-11 16:15:47', 'admin', 'admin', 3, '356b5e16-3ced-4f81-ba64-267f7bc38cf7', 0);
INSERT INTO `vote_question` VALUES (19, 'F微分', 'e645b0c5-1d07-418f-b68b-9c5adadd2c8e', '2020-06-11 16:21:37', '2020-06-11 16:21:37', 'admin', 'admin', 1, '9b79785b-f1cd-4981-b489-04024a2d462e', 0);
INSERT INTO `vote_question` VALUES (20, '问问', 'e645b0c5-1d07-418f-b68b-9c5adadd2c8e', '2020-06-11 16:21:37', '2020-06-11 16:21:37', 'admin', 'admin', 2, 'b6884042-9e8b-43e1-996b-20a042c08f44', 0);
INSERT INTO `vote_question` VALUES (21, 'we分安抚', 'e645b0c5-1d07-418f-b68b-9c5adadd2c8e', '2020-06-11 16:21:37', '2020-06-11 16:21:37', 'admin', 'admin', 3, 'd8ae141f-eb5a-4699-b825-c5c7b8fc7edf', 0);
INSERT INTO `vote_question` VALUES (22, 'fwef', 'eccf758d-d07f-4ef6-a935-19967dcede35', '2020-06-11 16:32:49', '2020-06-11 16:32:49', 'admin', 'admin', 1, '79f6ad1a-e054-4a65-a8fa-1ca5684bb3e2', 0);
INSERT INTO `vote_question` VALUES (23, '违法慰安妇', 'eccf758d-d07f-4ef6-a935-19967dcede35', '2020-06-11 16:32:49', '2020-06-11 16:32:49', 'admin', 'admin', 2, '7757e82d-b889-4461-b994-e2a31962ea5f', 0);
INSERT INTO `vote_question` VALUES (24, '纷纷', 'e90dfd9b-d098-4779-9a40-d32fb62ad775', '2020-06-11 16:35:33', '2020-06-11 16:35:33', 'admin', 'admin', 1, '8bc56ba8-7eaf-4aa8-a345-eb26205c70b3', 0);
INSERT INTO `vote_question` VALUES (25, '发个个人', 'e90dfd9b-d098-4779-9a40-d32fb62ad775', '2020-06-11 16:35:33', '2020-06-11 16:35:33', 'admin', 'admin', 2, 'dec12cad-bbd9-4acb-8fc1-90060e8ada95', 0);
INSERT INTO `vote_question` VALUES (26, '纷纷', '247b1036-ffc9-416e-bbda-e2a6069ab38a', '2020-06-11 16:38:38', '2020-06-11 16:38:38', 'admin', 'admin', 1, '41ca75d2-197f-4478-a8b0-bbf8cb7b77b7', 0);
INSERT INTO `vote_question` VALUES (27, '问题1', '919f9e8a-375d-4cac-aff1-5fe5c212f1a3', '2020-06-12 13:55:09', '2020-06-12 13:55:09', 'admin', 'admin', 1, 'ac4201a7-b7c1-4031-bcf8-f6394c142231', 0);
INSERT INTO `vote_question` VALUES (28, '问题2', '919f9e8a-375d-4cac-aff1-5fe5c212f1a3', '2020-06-12 13:55:09', '2020-06-12 13:55:09', 'admin', 'admin', 2, '326793e0-b66c-4e2b-9912-60328f151364', 0);
INSERT INTO `vote_question` VALUES (29, '问题1', 'a3c0a691-5002-4c1f-8d36-0a472b10f289', '2020-06-12 14:00:28', '2020-06-12 14:00:28', 'admin', 'admin', 1, '899244aa-9fcd-490b-8544-da76e7b8fe78', 0);
INSERT INTO `vote_question` VALUES (30, '问题2', 'a3c0a691-5002-4c1f-8d36-0a472b10f289', '2020-06-12 14:00:28', '2020-06-12 14:00:28', 'admin', 'admin', 2, '1cad3539-f57c-4a23-ac85-19a6272220c6', 0);
INSERT INTO `vote_question` VALUES (31, '问题2', 'e4a2b1d1-ce26-4b49-b029-75e16f552f44', '2020-06-12 14:24:42', '2020-06-12 14:24:42', 'admin', 'admin', 2, '29d49222-a336-451e-8080-db4110e0b844', 0);
INSERT INTO `vote_question` VALUES (32, '问题1', 'e4a2b1d1-ce26-4b49-b029-75e16f552f44', '2020-06-12 14:24:42', '2020-06-12 14:24:42', 'admin', 'admin', 1, 'e30dd46b-e888-41f2-af10-fb744bacc6be', 0);
INSERT INTO `vote_question` VALUES (33, '问题1', '1854dc71-e38b-4fdc-9e9f-697c43168613', '2020-06-12 14:26:56', '2020-06-12 14:26:56', 'admin', 'admin', 1, '1164fde3-b4d7-44a5-80a7-610621c6d34c', 0);
INSERT INTO `vote_question` VALUES (34, '问题2', '1854dc71-e38b-4fdc-9e9f-697c43168613', '2020-06-12 14:26:56', '2020-06-12 14:26:56', 'admin', 'admin', 2, 'b33ed01e-5611-47d4-a3a2-bc5d63528b79', 0);
INSERT INTO `vote_question` VALUES (35, '问题1', '9c9a076e-42a9-4145-ad7b-821e19ff17d8', '2020-06-12 14:28:20', '2020-06-12 14:28:20', 'admin', 'admin', 1, '0b065a0d-a737-4fac-a0fd-d9f2ba35d3b4', 0);
INSERT INTO `vote_question` VALUES (36, '问题2', '9c9a076e-42a9-4145-ad7b-821e19ff17d8', '2020-06-12 14:28:20', '2020-06-12 14:28:20', 'admin', 'admin', 2, 'ae3e8309-fd58-4a74-b885-35e88f6d710a', 0);

-- ----------------------------
-- Table structure for vote_question_solution
-- ----------------------------
DROP TABLE IF EXISTS `vote_question_solution`;
CREATE TABLE `vote_question_solution`  (
  `id` int(11) NOT NULL COMMENT '投票问题对应答案id',
  `question_id` int(10) DEFAULT NULL COMMENT '投票问题id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '创建人员',
  `update_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '更新人员',
  `solution` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '投票问题答案',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投票问题表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vote_role
-- ----------------------------
DROP TABLE IF EXISTS `vote_role`;
CREATE TABLE `vote_role`  (
  `id` int(11) NOT NULL COMMENT '角色表id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '创建人员',
  `update_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vote_role
-- ----------------------------
INSERT INTO `vote_role` VALUES (1, 'admin', '2020-06-02 13:56:19', '2020-06-02 13:56:22', 'admin', 'admin');
INSERT INTO `vote_role` VALUES (2, 'user', '2020-06-02 13:56:19', '2020-06-02 13:56:22', 'admin', 'admin');

-- ----------------------------
-- Table structure for vote_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `vote_role_permission`;
CREATE TABLE `vote_role_permission`  (
  `id` int(11) NOT NULL COMMENT '用户对应角色表id',
  `permission_id` int(11) DEFAULT NULL COMMENT '权限id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '创建人员',
  `update_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '更新人员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户对应角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vote_user
-- ----------------------------
DROP TABLE IF EXISTS `vote_user`;
CREATE TABLE `vote_user`  (
  `id` int(11) NOT NULL COMMENT '用户表id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户通过验证后的标识id',
  `user_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户类型，1：手机验证用户，2：微信验证用户，3：通行证验证用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '创建人员',
  `update_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '更新人员',
  `phone_number` int(11) DEFAULT NULL COMMENT '手机号码',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户姓名',
  `pass_word` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vote_user
-- ----------------------------
INSERT INTO `vote_user` VALUES (1, 123, '1', '2020-06-02 11:08:22', '2020-06-02 11:08:25', 'admin', 'admin', 1953694956, 'admin', '$2a$10$oiBlc18luvHSJnltEE0KVelnG6gOuB5UCiFBzit2JXpn7IgHn9B0.');
INSERT INTO `vote_user` VALUES (3, 152, '1', '2020-06-02 11:08:22', '2020-06-02 11:08:25', 'admin', 'admin', 1953694956, 'cnstock', '$2a$10$oiBlc18luvHSJnltEE0KVelnG6gOuB5UCiFBzit2JXpn7IgHn9B0.');

-- ----------------------------
-- Table structure for vote_user_main
-- ----------------------------
DROP TABLE IF EXISTS `vote_user_main`;
CREATE TABLE `vote_user_main`  (
  `id` int(11) NOT NULL COMMENT '用户和投票对应关系表id',
  `vote_main_id` int(11) DEFAULT NULL COMMENT '投票表id',
  `vote_user_id` int(11) DEFAULT NULL COMMENT '用户表id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '创建人员',
  `update_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '更新人员',
  `vote_group_id` int(11) DEFAULT NULL COMMENT '投票问答分组id',
  `vote_options_id` int(11) DEFAULT NULL COMMENT '用户选择答案选项id',
  `vote_user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户投票提交的联系姓名',
  `vote_user_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户投票提交的联系邮箱',
  `vote_user_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户投票提交的联系电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户投票问卷回答明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vote_user_role
-- ----------------------------
DROP TABLE IF EXISTS `vote_user_role`;
CREATE TABLE `vote_user_role`  (
  `id` int(11) NOT NULL COMMENT '用户对应角色表id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '创建人员',
  `update_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '更新人员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色对应权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vote_user_role
-- ----------------------------
INSERT INTO `vote_user_role` VALUES (1, 123, 1, '2020-06-02 13:55:11', '2020-06-02 13:55:13', 'admin', 'admin');
INSERT INTO `vote_user_role` VALUES (2, 152, 2, '2020-06-02 13:55:11', '2020-06-02 13:55:13', 'admin', 'admin');

-- ----------------------------
-- Table structure for vote_user_score
-- ----------------------------
DROP TABLE IF EXISTS `vote_user_score`;
CREATE TABLE `vote_user_score`  (
  `id` int(11) NOT NULL COMMENT '用户和投票对应关系表id',
  `vote_main_id` int(11) DEFAULT NULL COMMENT '投票表id',
  `vote_user_id` int(11) DEFAULT NULL COMMENT '用户表id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '创建人员',
  `update_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '更新人员',
  `vote_score` int(11) DEFAULT NULL COMMENT '投票得分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户投票问卷得分表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
