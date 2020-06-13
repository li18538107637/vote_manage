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

 Date: 12/06/2020 19:02:15
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
