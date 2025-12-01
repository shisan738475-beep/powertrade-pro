/*
 Navicat Premium Data Transfer

 Source Server         : A4源码资源网
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : rm-j6xxxxxx.mysql.rds.aliyuncs.com:3306
 Source Schema         : ohltkohltk

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 20/04/2020 15:02:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qk_account_currency
-- ----------------------------
DROP TABLE IF EXISTS `qk_account_currency`;
CREATE TABLE `qk_account_currency`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(255) NOT NULL COMMENT '用户ID',
  `currency_id` int(20) NOT NULL COMMENT '币种ID',
  `account` decimal(18, 4) UNSIGNED NOT NULL DEFAULT 0.0000 COMMENT '币种账户金额',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7303 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_account_currency
-- ----------------------------
INSERT INTO `qk_account_currency` VALUES (1, 1, 1, 0.0000, NULL, NULL);
INSERT INTO `qk_account_currency` VALUES (2, 1, 2, 28604.0000, '2020-04-01 23:11:09', '2020-04-01 23:11:09');
INSERT INTO `qk_account_currency` VALUES (3, 1, 3, 0.0000, '2020-04-01 11:08:36', '2020-04-01 11:08:36');
INSERT INTO `qk_account_currency` VALUES (4, 1, 4, 10.0000, '2020-04-01 11:08:37', '2020-04-01 11:08:37');
INSERT INTO `qk_account_currency` VALUES (7293, 3875, 2, 24142.0000, '2020-04-20 14:21:32', '2020-04-20 14:21:32');
INSERT INTO `qk_account_currency` VALUES (7294, 3875, 1, 94000.0000, '2020-04-01 16:07:19', '2020-04-01 16:07:19');
INSERT INTO `qk_account_currency` VALUES (7295, 3876, 1, 80000.0000, '2020-04-01 16:46:21', '2020-04-01 16:46:21');
INSERT INTO `qk_account_currency` VALUES (7296, 3877, 1, 0.0000, '2020-04-01 16:44:13', '2020-04-01 16:44:13');
INSERT INTO `qk_account_currency` VALUES (7297, 3877, 2, 1.0000, NULL, '2020-04-01 16:40:53');
INSERT INTO `qk_account_currency` VALUES (7298, 3878, 1, 90000.0000, '2020-04-01 23:11:09', '2020-04-01 23:11:09');
INSERT INTO `qk_account_currency` VALUES (7299, 3879, 1, 87000.0000, '2020-04-01 23:17:36', '2020-04-01 23:17:36');
INSERT INTO `qk_account_currency` VALUES (7300, 3880, 1, 80000.0000, '2020-04-01 23:20:18', '2020-04-01 23:20:18');
INSERT INTO `qk_account_currency` VALUES (7301, 3881, 1, 95200.0000, '2020-04-01 23:22:39', '2020-04-01 23:22:39');
INSERT INTO `qk_account_currency` VALUES (7302, 3882, 1, 94000.0000, '2020-04-01 23:24:15', '2020-04-01 23:24:15');

-- ----------------------------
-- Table structure for qk_admin
-- ----------------------------
DROP TABLE IF EXISTS `qk_admin`;
CREATE TABLE `qk_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '姓名',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '账号',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `is_del` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态:0=未删除,1=已删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `role_id` tinyint(4) NOT NULL DEFAULT 1 COMMENT '所属角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_admin
-- ----------------------------
INSERT INTO `qk_admin` VALUES (1, 'superadmin', 'superadmin', '50293581553191a6ae3dadf3b0c32c97', '8790', '', '', 0, '0000-00-00 00:00:00', 1);
INSERT INTO `qk_admin` VALUES (2, 'admin', 'admin', '50293581553191a6ae3dadf3b0c32c97', '8864', 'www.an4.net', '13800000000', 0, '0000-00-00 00:00:00', 1);

-- ----------------------------
-- Table structure for qk_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `qk_auth_rule`;
CREATE TABLE `qk_auth_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '规则名称',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `order` int(10) NOT NULL DEFAULT 10 COMMENT '权重',
  `is_menu` tinyint(255) NULL DEFAULT 1 COMMENT '是否为菜单:0=不是:1=是',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态:0=禁用,1=启用',
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '静态页面名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_auth_rule
-- ----------------------------
INSERT INTO `qk_auth_rule` VALUES (1, 0, '', '首页', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (2, 2, '', '会员中心', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (3, 2, '', '会员列表', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (4, 2, '', '会员级别', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (5, 2, '', '团队图谱', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (6, 2, '', '充值审核', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (7, 2, '', '提现审核', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (8, 2, '', '会员注册', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (9, 0, '', '系统管理', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (10, 9, '', '角色管理', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (11, 9, '', '管理员管理', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (12, 9, '', '轮播图管理', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (13, 9, '', '新闻管理', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (14, 0, '', '投资管理', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (15, 14, '', '会员投资记录', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (16, 14, '', '套餐列表', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (17, 14, '', '创投展示', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (18, 14, '', '币种列表', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (19, 0, '', '财务参数配置', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (20, 19, '', '财务参数配置', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (21, 19, '', '奖金设置', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (22, 19, '', '分红奖', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (23, 19, '', '二级分销', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (24, 19, '', '团队奖', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (25, 19, '', '管理奖', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (26, 19, '', '辅导奖', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (27, 0, '', '邮件公告', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (28, 27, '', '系统公告', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (29, 27, '', '发件箱', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (30, 27, '', '收件箱', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (31, 0, '', '财务管理', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (32, 31, '', '后台充值记录', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (33, 31, '', '后台扣费记录', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (34, 31, '', '转账记录', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (35, 31, '', '奖金明细', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (36, 31, '', '账单流水', '', 10, 1, 1, '');
INSERT INTO `qk_auth_rule` VALUES (37, 31, '', '礼包领取记录', '', 10, 1, 1, '');

-- ----------------------------
-- Table structure for qk_auth_rule_user
-- ----------------------------
DROP TABLE IF EXISTS `qk_auth_rule_user`;
CREATE TABLE `qk_auth_rule_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级菜单ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '权限名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作路径',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `is_menu` bigint(3) NOT NULL DEFAULT 1 COMMENT '是否为菜单:0=不是,1=是',
  `status` bigint(3) NOT NULL DEFAULT 1 COMMENT '状态0=不显示，1=显示',
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '前台路径名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qk_award
-- ----------------------------
DROP TABLE IF EXISTS `qk_award`;
CREATE TABLE `qk_award`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '奖项名称',
  `status` tinyint(6) NOT NULL DEFAULT 1 COMMENT '是否启用该奖项1 开启  0 未启用',
  `currency_id` int(11) NULL DEFAULT 0 COMMENT '奖项发奖币种ID',
  `is_del` tinyint(6) NOT NULL DEFAULT 0 COMMENT '0=否 1= 是',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '奖项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_award
-- ----------------------------
INSERT INTO `qk_award` VALUES (1, '静态分红', 1, 2, 0, '浮动分红');
INSERT INTO `qk_award` VALUES (2, '二级分销(销售奖）', 1, 2, 0, '拿投资额进行结算');
INSERT INTO `qk_award` VALUES (3, '分红奖(团队奖)', 1, 2, 0, '分红奖根据伞下每日分红做奖金结算');
INSERT INTO `qk_award` VALUES (4, '管理奖', 1, 2, 0, '管理奖根据伞下每日新增投资额作结算,极差制发奖');
INSERT INTO `qk_award` VALUES (5, '辅导奖', 1, 2, 0, '辅导奖根据伞下每日分红作结算,极差制发奖');

-- ----------------------------
-- Table structure for qk_award_record
-- ----------------------------
DROP TABLE IF EXISTS `qk_award_record`;
CREATE TABLE `qk_award_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `member` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '会员账号',
  `currency_id` int(11) NULL DEFAULT NULL COMMENT '币种ID',
  `currency_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '币种名称',
  `money` decimal(18, 4) NULL DEFAULT NULL COMMENT '实际到账金额',
  `from_uid` int(11) NULL DEFAULT NULL COMMENT '触发奖项人ID',
  `from_member` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '触发会员账号',
  `award_id` int(11) NULL DEFAULT NULL COMMENT '奖项ID',
  `award_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '奖项名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '奖励记录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 447895 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '奖金记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_award_record
-- ----------------------------
INSERT INTO `qk_award_record` VALUES (447872, 1, 'CAGI000001', 2, 'JYB', 900.0000, 3875, 'CAGI330446', 2, '二级分销(销售奖）', '会员CAGI330446创投,获得分销奖励', '2020-04-01 16:06:59');
INSERT INTO `qk_award_record` VALUES (447873, 1, 'CAGI000001', 2, 'JYB', 1500.0000, 3875, 'CAGI330446', 4, '管理奖', '会员CAGI330446创投,获得分红奖励', '2020-04-01 16:06:59');
INSERT INTO `qk_award_record` VALUES (447874, 1, 'CAGI000001', 2, 'JYB', 900.0000, 3875, 'CAGI330446', 2, '二级分销(销售奖）', '会员CAGI330446创投,获得分销奖励', '2020-04-01 16:07:19');
INSERT INTO `qk_award_record` VALUES (447875, 1, 'CAGI000001', 2, 'JYB', 1500.0000, 3875, 'CAGI330446', 4, '管理奖', '会员CAGI330446创投,获得分红奖励', '2020-04-01 16:07:19');
INSERT INTO `qk_award_record` VALUES (447876, 3875, 'CAGI330446', 2, 'JYB', 2000.0000, 3877, 'CAGI476212', 2, '二级分销(销售奖）', '会员CAGI476212创投,获得分销奖励', '2020-04-01 16:44:13');
INSERT INTO `qk_award_record` VALUES (447877, 1, 'CAGI000001', 2, 'JYB', 5000.0000, 3877, 'CAGI476212', 4, '管理奖', '会员CAGI476212创投,获得分红奖励', '2020-04-01 16:44:13');
INSERT INTO `qk_award_record` VALUES (447878, 3875, 'CAGI330446', 2, 'JYB', 3000.0000, 3876, 'CAGI891362', 2, '二级分销(销售奖）', '会员CAGI891362创投,获得分销奖励', '2020-04-01 16:46:20');
INSERT INTO `qk_award_record` VALUES (447879, 1, 'CAGI000001', 2, 'JYB', 2000.0000, 3876, 'CAGI891362', 2, '二级分销(销售奖）', '会员CAGI891362创投,获得分销奖励', '2020-04-01 16:46:20');
INSERT INTO `qk_award_record` VALUES (447880, 1, 'CAGI000001', 2, 'JYB', 5000.0000, 3876, 'CAGI891362', 4, '管理奖', '会员CAGI891362创投,获得分红奖励', '2020-04-01 16:46:21');
INSERT INTO `qk_award_record` VALUES (447881, 3875, 'CAGI330446', 2, 'JYB', 3000.0000, 3876, 'CAGI891362', 2, '二级分销(销售奖）', '会员CAGI891362创投,获得分销奖励', '2020-04-01 16:46:21');
INSERT INTO `qk_award_record` VALUES (447882, 1, 'CAGI000001', 2, 'JYB', 2000.0000, 3876, 'CAGI891362', 2, '二级分销(销售奖）', '会员CAGI891362创投,获得分销奖励', '2020-04-01 16:46:21');
INSERT INTO `qk_award_record` VALUES (447883, 1, 'CAGI000001', 2, 'JYB', 5000.0000, 3876, 'CAGI891362', 4, '管理奖', '会员CAGI891362创投,获得分红奖励', '2020-04-01 16:46:22');
INSERT INTO `qk_award_record` VALUES (447884, 3875, 'CAGI330446', 2, 'JYB', 3000.0000, 3878, 'CAGI307464', 2, '二级分销(销售奖）', '会员CAGI307464创投,获得分销奖励', '2020-04-01 23:11:09');
INSERT INTO `qk_award_record` VALUES (447885, 1, 'CAGI000001', 2, 'JYB', 633.9125, 3878, 'CAGI307464', 2, '二级分销(销售奖）', '会员CAGI307464创投,获得分销奖励', '2020-04-01 23:11:09');
INSERT INTO `qk_award_record` VALUES (447886, 3875, 'CAGI330446', 2, 'JYB', 3000.0000, 3879, 'CAGI827031', 2, '二级分销(销售奖）', '会员CAGI827031创投,获得分销奖励', '2020-04-01 23:17:17');
INSERT INTO `qk_award_record` VALUES (447887, 3875, 'CAGI330446', 2, 'JYB', 900.0000, 3879, 'CAGI827031', 2, '二级分销(销售奖）', '会员CAGI827031创投,获得分销奖励', '2020-04-01 23:17:36');
INSERT INTO `qk_award_record` VALUES (447888, 3875, 'CAGI330446', 2, 'JYB', 3000.0000, 3880, 'CAGI676690', 2, '二级分销(销售奖）', '会员CAGI676690创投,获得分销奖励', '2020-04-01 23:20:09');
INSERT INTO `qk_award_record` VALUES (447889, 3875, 'CAGI330446', 2, 'JYB', 3000.0000, 3880, 'CAGI676690', 2, '二级分销(销售奖）', '会员CAGI676690创投,获得分销奖励', '2020-04-01 23:20:18');
INSERT INTO `qk_award_record` VALUES (447890, 3875, 'CAGI330446', 2, 'JYB', 90.0000, 3881, 'CAGI955906', 2, '二级分销(销售奖）', '会员CAGI955906创投,获得分销奖励', '2020-04-01 23:22:18');
INSERT INTO `qk_award_record` VALUES (447891, 3875, 'CAGI330446', 2, 'JYB', 450.0000, 3881, 'CAGI955906', 2, '二级分销(销售奖）', '会员CAGI955906创投,获得分销奖励', '2020-04-01 23:22:29');
INSERT INTO `qk_award_record` VALUES (447892, 3875, 'CAGI330446', 2, 'JYB', 900.0000, 3881, 'CAGI955906', 2, '二级分销(销售奖）', '会员CAGI955906创投,获得分销奖励', '2020-04-01 23:22:39');
INSERT INTO `qk_award_record` VALUES (447893, 3875, 'CAGI330446', 2, 'JYB', 900.0000, 3882, 'CAGI636729', 2, '二级分销(销售奖）', '会员CAGI636729创投,获得分销奖励', '2020-04-01 23:24:03');
INSERT INTO `qk_award_record` VALUES (447894, 3875, 'CAGI330446', 2, 'JYB', 900.0000, 3882, 'CAGI636729', 2, '二级分销(销售奖）', '会员CAGI636729创投,获得分销奖励', '2020-04-01 23:24:15');

-- ----------------------------
-- Table structure for qk_bank
-- ----------------------------
DROP TABLE IF EXISTS `qk_bank`;
CREATE TABLE `qk_bank`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '银行名称',
  `number` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '银行卡号',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '预留银行手机号',
  `bank_open` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '开户支行',
  `bank_open_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '开户名称',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_del` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除状态:0=未删除,1=已删除',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型:1=汇款银行,2=提现银行',
  `is_draw` int(11) NULL DEFAULT 1 COMMENT '是否支持提现:0=不支持,1=支持',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '银行信息配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qk_banner
-- ----------------------------
DROP TABLE IF EXISTS `qk_banner`;
CREATE TABLE `qk_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '图片地址',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '跳转链接',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '100' COMMENT '排序值：值越小,越靠前',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `type` tinyint(3) NULL DEFAULT 1 COMMENT '类型:1=首页,2=商城',
  `is_del` tinyint(3) NULL DEFAULT 0 COMMENT '删除状态:0=未删除,1=已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_banner
-- ----------------------------
INSERT INTO `qk_banner` VALUES (1, '/imgs/base/15849709755538743.jpg', '', '100', NULL, 1, 1);
INSERT INTO `qk_banner` VALUES (2, '', '', '100', NULL, 2, 1);
INSERT INTO `qk_banner` VALUES (3, '/imgs/base/15851319224357146.jpg', '', '1', '2020-03-25 18:25:27', 1, 1);
INSERT INTO `qk_banner` VALUES (4, '/imgs/base/15851319852119178.jpg', '', '1', '2020-03-25 18:26:29', 2, 1);
INSERT INTO `qk_banner` VALUES (5, '/imgs/base/15851851163369586.jpg', '', '1', '2020-03-26 09:11:58', 1, 1);
INSERT INTO `qk_banner` VALUES (6, '/imgs/base/15851851461125450.jpg', '', '1', '2020-03-26 09:12:31', 1, 0);
INSERT INTO `qk_banner` VALUES (7, '/imgs/base/15852054998320993.jpg', '', '2', '2020-03-26 14:51:43', 1, 0);
INSERT INTO `qk_banner` VALUES (8, '/imgs/base/15855474627730300.jpg', '', '1', '2020-03-27 10:56:19', 2, 0);

-- ----------------------------
-- Table structure for qk_bill
-- ----------------------------
DROP TABLE IF EXISTS `qk_bill`;
CREATE TABLE `qk_bill`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员账号',
  `bill_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '奖项类型',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `currency_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '币种ID',
  `currency_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '币种名称',
  `account` decimal(18, 4) NULL DEFAULT NULL COMMENT '金额',
  `after_account` decimal(18, 4) NULL DEFAULT NULL COMMENT '变更后金额',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `type` tinyint(3) NULL DEFAULT 2 COMMENT '类型:1=收入,2=支出',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 602930 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_bill
-- ----------------------------
INSERT INTO `qk_bill` VALUES (602879, 'CAGI000001', '点击宝箱', 1, '2', 'JYB', 1.0000, 4170.0875, '会员点击宝箱,获取奖励', '2020-04-01 13:18:21', 1);
INSERT INTO `qk_bill` VALUES (602880, 'CAGI000001', '后台充值', 1, '2', 'JYB', 15000.0000, 19170.0875, '后台管理员充值', '2020-04-01 14:24:26', 1);
INSERT INTO `qk_bill` VALUES (602881, 'CAGI000001', '投资套餐', 1, '2', 'JYB', 15000.0000, 4170.0875, '会员投资套餐,账户扣款', '2020-04-01 14:24:36', 2);
INSERT INTO `qk_bill` VALUES (602882, 'CAGI330446', '点击宝箱', 3875, '2', 'JYB', 1.0000, 1.0000, '会员点击宝箱,获取奖励', '2020-04-01 16:05:40', 1);
INSERT INTO `qk_bill` VALUES (602883, 'CAGI330446', '后台充值', 3875, '1', 'USDT', 100000.0000, 100000.0000, '后台管理员充值', '2020-04-01 16:06:38', 1);
INSERT INTO `qk_bill` VALUES (602884, 'CAGI330446', '投资套餐', 3875, '1', 'USDT', 3000.0000, 97000.0000, '会员投资套餐,账户扣款', '2020-04-01 16:06:59', 2);
INSERT INTO `qk_bill` VALUES (602885, 'CAGI000001', '二级分销(销售奖）', 1, '2', 'JYB', 900.0000, 5070.0875, '会员CAGI330446创投,获得分销奖励', '2020-04-01 16:06:59', 1);
INSERT INTO `qk_bill` VALUES (602886, 'CAGI000001', '管理奖', 1, '2', 'JYB', 1500.0000, 6570.0875, '会员CAGI330446创投,获得分红奖励', '2020-04-01 16:06:59', 1);
INSERT INTO `qk_bill` VALUES (602887, 'CAGI330446', '投资套餐', 3875, '1', 'USDT', 3000.0000, 94000.0000, '会员投资套餐,账户扣款', '2020-04-01 16:07:19', 2);
INSERT INTO `qk_bill` VALUES (602888, 'CAGI000001', '二级分销(销售奖）', 1, '2', 'JYB', 900.0000, 7470.0875, '会员CAGI330446创投,获得分销奖励', '2020-04-01 16:07:19', 1);
INSERT INTO `qk_bill` VALUES (602889, 'CAGI000001', '管理奖', 1, '2', 'JYB', 1500.0000, 8970.0875, '会员CAGI330446创投,获得分红奖励', '2020-04-01 16:07:19', 1);
INSERT INTO `qk_bill` VALUES (602890, 'CAGI891362', '后台充值', 3876, '1', 'USDT', 100000.0000, 100000.0000, '后台管理员充值', '2020-04-01 16:20:32', 1);
INSERT INTO `qk_bill` VALUES (602891, 'CAGI476212', '后台充值', 3877, '1', 'USDT', 10000.0000, 10000.0000, '后台管理员充值', '2020-04-01 16:39:15', 1);
INSERT INTO `qk_bill` VALUES (602892, 'CAGI476212', '点击宝箱', 3877, '2', 'JYB', 1.0000, 1.0000, '会员点击宝箱,获取奖励', '2020-04-01 16:40:53', 1);
INSERT INTO `qk_bill` VALUES (602893, 'CAGI476212', '投资套餐', 3877, '1', 'USDT', 10000.0000, 0.0000, '会员投资套餐,账户扣款', '2020-04-01 16:44:13', 2);
INSERT INTO `qk_bill` VALUES (602894, 'CAGI330446', '二级分销(销售奖）', 3875, '2', 'JYB', 2000.0000, 2001.0000, '会员CAGI476212创投,获得分销奖励', '2020-04-01 16:44:13', 1);
INSERT INTO `qk_bill` VALUES (602895, 'CAGI000001', '管理奖', 1, '2', 'JYB', 5000.0000, 13970.0875, '会员CAGI476212创投,获得分红奖励', '2020-04-01 16:44:13', 1);
INSERT INTO `qk_bill` VALUES (602896, 'CAGI891362', '投资套餐', 3876, '1', 'USDT', 10000.0000, 90000.0000, '会员投资套餐,账户扣款', '2020-04-01 16:46:20', 2);
INSERT INTO `qk_bill` VALUES (602897, 'CAGI330446', '二级分销(销售奖）', 3875, '2', 'JYB', 3000.0000, 5001.0000, '会员CAGI891362创投,获得分销奖励', '2020-04-01 16:46:20', 1);
INSERT INTO `qk_bill` VALUES (602898, 'CAGI000001', '二级分销(销售奖）', 1, '2', 'JYB', 2000.0000, 15970.0875, '会员CAGI891362创投,获得分销奖励', '2020-04-01 16:46:21', 1);
INSERT INTO `qk_bill` VALUES (602899, 'CAGI000001', '管理奖', 1, '2', 'JYB', 5000.0000, 20970.0875, '会员CAGI891362创投,获得分红奖励', '2020-04-01 16:46:21', 1);
INSERT INTO `qk_bill` VALUES (602900, 'CAGI891362', '投资套餐', 3876, '1', 'USDT', 10000.0000, 80000.0000, '会员投资套餐,账户扣款', '2020-04-01 16:46:21', 2);
INSERT INTO `qk_bill` VALUES (602901, 'CAGI330446', '二级分销(销售奖）', 3875, '2', 'JYB', 3000.0000, 8001.0000, '会员CAGI891362创投,获得分销奖励', '2020-04-01 16:46:21', 1);
INSERT INTO `qk_bill` VALUES (602902, 'CAGI000001', '二级分销(销售奖）', 1, '2', 'JYB', 2000.0000, 22970.0875, '会员CAGI891362创投,获得分销奖励', '2020-04-01 16:46:21', 1);
INSERT INTO `qk_bill` VALUES (602903, 'CAGI000001', '管理奖', 1, '2', 'JYB', 5000.0000, 27970.0875, '会员CAGI891362创投,获得分红奖励', '2020-04-01 16:46:22', 1);
INSERT INTO `qk_bill` VALUES (602904, 'CAGI307464', '后台充值', 3878, '1', 'USDT', 100000.0000, 100000.0000, '后台管理员充值', '2020-04-01 23:03:33', 1);
INSERT INTO `qk_bill` VALUES (602905, 'CAGI827031', '后台充值', 3879, '1', 'USDT', 100000.0000, 100000.0000, '后台管理员充值', '2020-04-01 23:06:05', 1);
INSERT INTO `qk_bill` VALUES (602906, 'CAGI676690', '后台充值', 3880, '1', 'USDT', 100000.0000, 100000.0000, '后台管理员充值', '2020-04-01 23:09:52', 1);
INSERT INTO `qk_bill` VALUES (602907, 'CAGI955906', '后台充值', 3881, '1', 'USDT', 100000.0000, 100000.0000, '后台管理员充值', '2020-04-01 23:10:03', 1);
INSERT INTO `qk_bill` VALUES (602908, 'CAGI636729', '后台充值', 3882, '1', 'USDT', 100000.0000, 100000.0000, '后台管理员充值', '2020-04-01 23:10:12', 1);
INSERT INTO `qk_bill` VALUES (602909, 'CAGI307464', '投资套餐', 3878, '1', 'USDT', 10000.0000, 90000.0000, '会员投资套餐,账户扣款', '2020-04-01 23:11:09', 2);
INSERT INTO `qk_bill` VALUES (602910, 'CAGI330446', '二级分销(销售奖）', 3875, '2', 'JYB', 3000.0000, 11001.0000, '会员CAGI307464创投,获得分销奖励', '2020-04-01 23:11:09', 1);
INSERT INTO `qk_bill` VALUES (602911, 'CAGI000001', '二级分销(销售奖）', 1, '2', 'JYB', 633.9125, 28604.0000, '会员CAGI307464创投,获得分销奖励', '2020-04-01 23:11:09', 1);
INSERT INTO `qk_bill` VALUES (602912, 'CAGI827031', '投资套餐', 3879, '1', 'USDT', 10000.0000, 90000.0000, '会员投资套餐,账户扣款', '2020-04-01 23:17:17', 2);
INSERT INTO `qk_bill` VALUES (602913, 'CAGI330446', '二级分销(销售奖）', 3875, '2', 'JYB', 3000.0000, 14001.0000, '会员CAGI827031创投,获得分销奖励', '2020-04-01 23:17:17', 1);
INSERT INTO `qk_bill` VALUES (602914, 'CAGI827031', '投资套餐', 3879, '1', 'USDT', 3000.0000, 87000.0000, '会员投资套餐,账户扣款', '2020-04-01 23:17:36', 2);
INSERT INTO `qk_bill` VALUES (602915, 'CAGI330446', '二级分销(销售奖）', 3875, '2', 'JYB', 900.0000, 14901.0000, '会员CAGI827031创投,获得分销奖励', '2020-04-01 23:17:36', 1);
INSERT INTO `qk_bill` VALUES (602916, 'CAGI676690', '投资套餐', 3880, '1', 'USDT', 10000.0000, 90000.0000, '会员投资套餐,账户扣款', '2020-04-01 23:20:08', 2);
INSERT INTO `qk_bill` VALUES (602917, 'CAGI330446', '二级分销(销售奖）', 3875, '2', 'JYB', 3000.0000, 17901.0000, '会员CAGI676690创投,获得分销奖励', '2020-04-01 23:20:09', 1);
INSERT INTO `qk_bill` VALUES (602918, 'CAGI676690', '投资套餐', 3880, '1', 'USDT', 10000.0000, 80000.0000, '会员投资套餐,账户扣款', '2020-04-01 23:20:18', 2);
INSERT INTO `qk_bill` VALUES (602919, 'CAGI330446', '二级分销(销售奖）', 3875, '2', 'JYB', 3000.0000, 20901.0000, '会员CAGI676690创投,获得分销奖励', '2020-04-01 23:20:18', 1);
INSERT INTO `qk_bill` VALUES (602920, 'CAGI955906', '投资套餐', 3881, '1', 'USDT', 300.0000, 99700.0000, '会员投资套餐,账户扣款', '2020-04-01 23:22:18', 2);
INSERT INTO `qk_bill` VALUES (602921, 'CAGI330446', '二级分销(销售奖）', 3875, '2', 'JYB', 90.0000, 20991.0000, '会员CAGI955906创投,获得分销奖励', '2020-04-01 23:22:18', 1);
INSERT INTO `qk_bill` VALUES (602922, 'CAGI955906', '投资套餐', 3881, '1', 'USDT', 1500.0000, 98200.0000, '会员投资套餐,账户扣款', '2020-04-01 23:22:29', 2);
INSERT INTO `qk_bill` VALUES (602923, 'CAGI330446', '二级分销(销售奖）', 3875, '2', 'JYB', 450.0000, 21441.0000, '会员CAGI955906创投,获得分销奖励', '2020-04-01 23:22:29', 1);
INSERT INTO `qk_bill` VALUES (602924, 'CAGI955906', '投资套餐', 3881, '1', 'USDT', 3000.0000, 95200.0000, '会员投资套餐,账户扣款', '2020-04-01 23:22:39', 2);
INSERT INTO `qk_bill` VALUES (602925, 'CAGI330446', '二级分销(销售奖）', 3875, '2', 'JYB', 900.0000, 22341.0000, '会员CAGI955906创投,获得分销奖励', '2020-04-01 23:22:39', 1);
INSERT INTO `qk_bill` VALUES (602926, 'CAGI636729', '投资套餐', 3882, '1', 'USDT', 3000.0000, 97000.0000, '会员投资套餐,账户扣款', '2020-04-01 23:24:03', 2);
INSERT INTO `qk_bill` VALUES (602927, 'CAGI330446', '二级分销(销售奖）', 3875, '2', 'JYB', 900.0000, 23241.0000, '会员CAGI636729创投,获得分销奖励', '2020-04-01 23:24:03', 1);
INSERT INTO `qk_bill` VALUES (602928, 'CAGI636729', '投资套餐', 3882, '1', 'USDT', 3000.0000, 94000.0000, '会员投资套餐,账户扣款', '2020-04-01 23:24:15', 2);
INSERT INTO `qk_bill` VALUES (602929, 'CAGI330446', '二级分销(销售奖）', 3875, '2', 'JYB', 900.0000, 24141.0000, '会员CAGI636729创投,获得分销奖励', '2020-04-01 23:24:15', 1);
INSERT INTO `qk_bill` VALUES (602930, 'CAGI330446', '点击宝箱', 3875, '2', 'JYB', 1.0000, 24142.0000, '会员点击宝箱,获取奖励', '2020-04-20 14:21:32', 1);

-- ----------------------------
-- Table structure for qk_config_bonus
-- ----------------------------
DROP TABLE IF EXISTS `qk_config_bonus`;
CREATE TABLE `qk_config_bonus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rate` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '静态分红比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '分红奖' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_config_bonus
-- ----------------------------
INSERT INTO `qk_config_bonus` VALUES (1, 0.10);

-- ----------------------------
-- Table structure for qk_config_convert
-- ----------------------------
DROP TABLE IF EXISTS `qk_config_convert`;
CREATE TABLE `qk_config_convert`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `currency_id` int(11) NULL DEFAULT 1 COMMENT '币种信ID',
  `target_currency_id` int(11) NULL DEFAULT 1 COMMENT '目标币种ID',
  `cardinal_number` int(11) NULL DEFAULT 100 COMMENT '兑换基数',
  `min` int(11) NULL DEFAULT 0 COMMENT '兑换最小面额',
  `max` int(11) NULL DEFAULT 0 COMMENT '兑换最大面额',
  `rate` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '兑换汇率 ',
  `is_show` tinyint(3) NULL DEFAULT 1 COMMENT '币种是否显示1：是0:否',
  `is_del` tinyint(3) NULL DEFAULT 0 COMMENT '删除状态:0=未删除,1=已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '兑换设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_config_convert
-- ----------------------------
INSERT INTO `qk_config_convert` VALUES (1, 3, 1, 1, 1, 10000, 1.00, 1, 0);
INSERT INTO `qk_config_convert` VALUES (2, 2, 1, 1, 1, 10000, 1.00, 1, 1);
INSERT INTO `qk_config_convert` VALUES (3, 2, 1, 10, 100, 1000, 1.00, 1, 1);
INSERT INTO `qk_config_convert` VALUES (4, 4, 1, 1, 1, 10000, 1.00, 1, 0);
INSERT INTO `qk_config_convert` VALUES (5, 2, 3, 1, 1, 10000, 0.00, 1, 0);
INSERT INTO `qk_config_convert` VALUES (6, 2, 4, 1, 1, 10000, 0.00, 1, 0);
INSERT INTO `qk_config_convert` VALUES (7, 3, 4, 1, 1, 10000, 1.00, 1, 0);
INSERT INTO `qk_config_convert` VALUES (8, 4, 3, 1, 1, 10000, 1.00, 1, 0);

-- ----------------------------
-- Table structure for qk_config_draw
-- ----------------------------
DROP TABLE IF EXISTS `qk_config_draw`;
CREATE TABLE `qk_config_draw`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `currency_id` int(11) NOT NULL COMMENT '币种信息 (关联币种表ID)',
  `cardinal_number` int(11) NOT NULL COMMENT '提现基数',
  `min` int(11) NOT NULL COMMENT '提现最小面额',
  `max` int(11) NOT NULL DEFAULT 0 COMMENT '提现最大面额',
  `fee_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '手续费',
  `is_show` tinyint(3) NOT NULL DEFAULT 1 COMMENT '币种是否显示1：是0:否',
  `is_del` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态 0:未删除,1=已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '提现设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_config_draw
-- ----------------------------
INSERT INTO `qk_config_draw` VALUES (1, 1, 1, 1, 10000, 1.00, 1, 0);

-- ----------------------------
-- Table structure for qk_config_fee
-- ----------------------------
DROP TABLE IF EXISTS `qk_config_fee`;
CREATE TABLE `qk_config_fee`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `currency_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '可以选择的币种ID ,分隔',
  `type` tinyint(11) NOT NULL DEFAULT 1 COMMENT '类型;1 后台充值币种列表 2：后台扣费币种设置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '后台：充值，扣费设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_config_fee
-- ----------------------------
INSERT INTO `qk_config_fee` VALUES (1, '1', 1);
INSERT INTO `qk_config_fee` VALUES (2, '1', 2);

-- ----------------------------
-- Table structure for qk_config_gathering
-- ----------------------------
DROP TABLE IF EXISTS `qk_config_gathering`;
CREATE TABLE `qk_config_gathering`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) NULL DEFAULT 1 COMMENT '类型:1=银行卡,2=支付宝,3=微信',
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '开户行',
  `bank_open` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '卡户支行',
  `bank_open_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '开户人姓名',
  `bank_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '银行卡号',
  `ali_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '支付宝账号',
  `ali_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '支付宝名称',
  `ali_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '支付宝收款码',
  `wx_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '微信账号',
  `wx_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '微信名称',
  `wx_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '微信收款码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `is_del` tinyint(3) NULL DEFAULT 0 COMMENT '删除状态:0=未删除,1=已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收款管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qk_config_gift
-- ----------------------------
DROP TABLE IF EXISTS `qk_config_gift`;
CREATE TABLE `qk_config_gift`  (
  `id` int(11) NOT NULL,
  `currency_id` int(11) NULL DEFAULT NULL COMMENT '奖励币种ID',
  `money` int(11) NULL DEFAULT NULL COMMENT '奖励数量',
  `draw_time` time(0) NULL DEFAULT NULL COMMENT '领取时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_config_gift
-- ----------------------------
INSERT INTO `qk_config_gift` VALUES (1, 2, 1, '13:00:00');

-- ----------------------------
-- Table structure for qk_config_manage
-- ----------------------------
DROP TABLE IF EXISTS `qk_config_manage`;
CREATE TABLE `qk_config_manage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_id` int(2) NULL DEFAULT NULL COMMENT '会员级别',
  `rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '拿奖比例',
  `is_del` tinyint(3) NULL DEFAULT 0 COMMENT '是否已删除:0=未删除,1=已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_config_manage
-- ----------------------------
INSERT INTO `qk_config_manage` VALUES (1, 1, 0.00, 0);
INSERT INTO `qk_config_manage` VALUES (2, 2, 2.00, 0);
INSERT INTO `qk_config_manage` VALUES (3, 3, 4.00, 0);
INSERT INTO `qk_config_manage` VALUES (4, 4, 5.00, 0);
INSERT INTO `qk_config_manage` VALUES (5, 5, 6.00, 0);
INSERT INTO `qk_config_manage` VALUES (6, 6, 10.00, 0);
INSERT INTO `qk_config_manage` VALUES (7, 7, 15.00, 0);

-- ----------------------------
-- Table structure for qk_config_remittance
-- ----------------------------
DROP TABLE IF EXISTS `qk_config_remittance`;
CREATE TABLE `qk_config_remittance`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `currency_id` int(11) NOT NULL COMMENT '币种信息 (关联币种表ID)',
  `target_currency_id` int(11) NULL DEFAULT NULL COMMENT '到账币种ID',
  `cardinal_number` int(11) NOT NULL DEFAULT 0 COMMENT '汇款基数',
  `min` int(11) NOT NULL DEFAULT 0 COMMENT '汇款最小面额',
  `max` int(11) NOT NULL DEFAULT 0 COMMENT '汇款最大面额',
  `is_show` tinyint(3) NOT NULL DEFAULT 1 COMMENT '币种是否显示1：是0:否',
  `is_del` tinyint(3) NULL DEFAULT 0 COMMENT '删除状态:0=未删除,1=已删除',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收款地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '汇款设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_config_remittance
-- ----------------------------
INSERT INTO `qk_config_remittance` VALUES (1, 1, 2, 1, 1, 10000, 1, 0, '0xa75e7211d3c61d262cd3f249f74a7b1c39543fc6');

-- ----------------------------
-- Table structure for qk_config_sales
-- ----------------------------
DROP TABLE IF EXISTS `qk_config_sales`;
CREATE TABLE `qk_config_sales`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `floor` tinyint(3) NULL DEFAULT NULL,
  `rate` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '新增业绩的拿奖比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '二级分销（销售奖）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_config_sales
-- ----------------------------
INSERT INTO `qk_config_sales` VALUES (1, 1, 3.00);
INSERT INTO `qk_config_sales` VALUES (2, 2, 2.00);

-- ----------------------------
-- Table structure for qk_config_team
-- ----------------------------
DROP TABLE IF EXISTS `qk_config_team`;
CREATE TABLE `qk_config_team`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NULL DEFAULT NULL COMMENT '推荐人数',
  `floor` int(11) NULL DEFAULT NULL COMMENT '拿奖代数',
  `rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '拿奖比例',
  `is_del` tinyint(3) NULL DEFAULT 0 COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_config_team
-- ----------------------------
INSERT INTO `qk_config_team` VALUES (1, 1, 1, 20.00, 0);
INSERT INTO `qk_config_team` VALUES (2, 2, 2, 5.00, 0);
INSERT INTO `qk_config_team` VALUES (3, 3, 3, 5.00, 0);
INSERT INTO `qk_config_team` VALUES (4, 4, 4, 5.00, 0);
INSERT INTO `qk_config_team` VALUES (5, 5, 5, 5.00, 0);
INSERT INTO `qk_config_team` VALUES (6, 6, 6, 2.00, 0);
INSERT INTO `qk_config_team` VALUES (7, 7, 7, 2.00, 0);
INSERT INTO `qk_config_team` VALUES (8, 8, 8, 2.00, 0);
INSERT INTO `qk_config_team` VALUES (9, 9, 9, 2.00, 0);

-- ----------------------------
-- Table structure for qk_config_transfer
-- ----------------------------
DROP TABLE IF EXISTS `qk_config_transfer`;
CREATE TABLE `qk_config_transfer`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `currency_id` int(11) NOT NULL COMMENT '币种信息 (关联币种表ID)',
  `cardinal_number` int(11) NOT NULL COMMENT '提现基数',
  `min` int(11) NOT NULL COMMENT '提现最小面额',
  `max` int(11) NOT NULL DEFAULT 0 COMMENT '提现最大面额',
  `rate` decimal(10, 2) NOT NULL DEFAULT 1.00 COMMENT '转账比率',
  `is_show` tinyint(3) NOT NULL DEFAULT 1 COMMENT '币种是否显示1：是0:否',
  `is_del` tinyint(3) NULL DEFAULT 0 COMMENT '删除状态:0=未删除,1=已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '转账设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_config_transfer
-- ----------------------------
INSERT INTO `qk_config_transfer` VALUES (1, 1, 1, 1, 10000, 1.00, 1, 0);
INSERT INTO `qk_config_transfer` VALUES (2, 2, 1, 1, 10000, 1.00, 1, 0);
INSERT INTO `qk_config_transfer` VALUES (3, 3, 1, 1, 10000, 1.00, 1, 0);
INSERT INTO `qk_config_transfer` VALUES (4, 4, 1, 1, 10000, 1.00, 1, 0);

-- ----------------------------
-- Table structure for qk_config_tutor
-- ----------------------------
DROP TABLE IF EXISTS `qk_config_tutor`;
CREATE TABLE `qk_config_tutor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_id` int(2) NULL DEFAULT NULL COMMENT '会员级别',
  `rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '拿奖比例',
  `is_del` tinyint(3) NULL DEFAULT 0 COMMENT '是否已删除:0=未删除,1=已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_config_tutor
-- ----------------------------
INSERT INTO `qk_config_tutor` VALUES (1, 1, 0.00, 0);
INSERT INTO `qk_config_tutor` VALUES (2, 2, 4.00, 0);
INSERT INTO `qk_config_tutor` VALUES (3, 3, 8.00, 0);
INSERT INTO `qk_config_tutor` VALUES (4, 4, 12.00, 0);
INSERT INTO `qk_config_tutor` VALUES (5, 5, 16.00, 0);
INSERT INTO `qk_config_tutor` VALUES (6, 6, 20.00, 0);
INSERT INTO `qk_config_tutor` VALUES (7, 7, 30.00, 0);

-- ----------------------------
-- Table structure for qk_convert_record
-- ----------------------------
DROP TABLE IF EXISTS `qk_convert_record`;
CREATE TABLE `qk_convert_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '会员ID',
  `member` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员账号',
  `currency_id` int(11) NULL DEFAULT NULL COMMENT '源币种ID',
  `currency_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '源币种名称',
  `target_currency_id` int(11) NULL DEFAULT NULL COMMENT '目标币种ID',
  `target_currency_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '目标币种名称',
  `money` decimal(10, 2) NULL DEFAULT NULL COMMENT '消耗原币种金额',
  `reality_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '目标币种到账金额',
  `fee_money` decimal(10, 4) NULL DEFAULT 0.0000 COMMENT '手续费',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `rate` decimal(20, 6) NULL DEFAULT 0.000000 COMMENT '汇率',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qk_currency
-- ----------------------------
DROP TABLE IF EXISTS `qk_currency`;
CREATE TABLE `qk_currency`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '币种名称',
  `rate` int(10) NULL DEFAULT 0 COMMENT '充值：汇率 百分比',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '币种图片',
  `is_del` tinyint(6) NOT NULL DEFAULT 0 COMMENT '是否删除 0 否1 是 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '总币种表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_currency
-- ----------------------------
INSERT INTO `qk_currency` VALUES (1, 'USDT', 100, '', 0);
INSERT INTO `qk_currency` VALUES (2, 'JYB', 10, '', 0);
INSERT INTO `qk_currency` VALUES (3, 'TBAU', 100, '', 0);
INSERT INTO `qk_currency` VALUES (4, 'PSBAU', 100, '', 0);

-- ----------------------------
-- Table structure for qk_deduction_record
-- ----------------------------
DROP TABLE IF EXISTS `qk_deduction_record`;
CREATE TABLE `qk_deduction_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '会员账号',
  `uid` int(11) NOT NULL DEFAULT 1 COMMENT '会员ID',
  `currency_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '币种名称',
  `currency_id` int(11) NULL DEFAULT 1 COMMENT '币种ID',
  `money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '金额',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `is_del` int(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0不删除 1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '后台扣费 记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qk_draw_record
-- ----------------------------
DROP TABLE IF EXISTS `qk_draw_record`;
CREATE TABLE `qk_draw_record`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '会员ID',
  `member` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '会员账号',
  `currency_id` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '币种ID',
  `currency_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '币种名称',
  `money` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '提现金额',
  `fee_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '手续费金额',
  `reality_money` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '实际金额',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收款地址',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '钱包二维码',
  `status` tinyint(3) NULL DEFAULT 0 COMMENT '0=待审核,1通过,2=拒绝',
  `refuse` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '拒绝的理由',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_del` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0=不删除,1=删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '提现记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qk_gift_record
-- ----------------------------
DROP TABLE IF EXISTS `qk_gift_record`;
CREATE TABLE `qk_gift_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '会员ID',
  `member` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员编号',
  `currency_id` int(11) NULL DEFAULT NULL COMMENT '奖励币种ID',
  `currency_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '奖励币种名称',
  `money` decimal(10, 2) NULL DEFAULT NULL COMMENT '奖励金额',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '奖励时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_gift_record
-- ----------------------------
INSERT INTO `qk_gift_record` VALUES (39, 1, 'CAGI000001', 2, 'JYB', 1.00, '2020-04-01 13:18:21');
INSERT INTO `qk_gift_record` VALUES (40, 3875, 'CAGI330446', 2, 'JYB', 1.00, '2020-04-01 16:05:40');
INSERT INTO `qk_gift_record` VALUES (41, 3877, 'CAGI476212', 2, 'JYB', 1.00, '2020-04-01 16:40:53');
INSERT INTO `qk_gift_record` VALUES (42, 3875, 'CAGI330446', 2, 'JYB', 1.00, '2020-04-20 14:21:31');

-- ----------------------------
-- Table structure for qk_invest_record
-- ----------------------------
DROP TABLE IF EXISTS `qk_invest_record`;
CREATE TABLE `qk_invest_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `member` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员账号',
  `currency_id` int(11) NULL DEFAULT 1 COMMENT '币种ID',
  `money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '金额',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `is_del` int(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0不删除 1删除',
  `currency_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '币种名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7445 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '后台充值记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_invest_record
-- ----------------------------
INSERT INTO `qk_invest_record` VALUES (7436, 1, 'CAGI000001', 2, '15000', '2020-04-01 14:24:26', 0, 'JYB');
INSERT INTO `qk_invest_record` VALUES (7437, 3875, 'CAGI330446', 1, '100000', '2020-04-01 16:06:38', 0, 'USDT');
INSERT INTO `qk_invest_record` VALUES (7438, 3876, 'CAGI891362', 1, '100000', '2020-04-01 16:20:32', 0, 'USDT');
INSERT INTO `qk_invest_record` VALUES (7439, 3877, 'CAGI476212', 1, '10000', '2020-04-01 16:39:16', 0, 'USDT');
INSERT INTO `qk_invest_record` VALUES (7440, 3878, 'CAGI307464', 1, '100000', '2020-04-01 23:03:33', 0, 'USDT');
INSERT INTO `qk_invest_record` VALUES (7441, 3879, 'CAGI827031', 1, '100000', '2020-04-01 23:06:05', 0, 'USDT');
INSERT INTO `qk_invest_record` VALUES (7442, 3880, 'CAGI676690', 1, '100000', '2020-04-01 23:09:52', 0, 'USDT');
INSERT INTO `qk_invest_record` VALUES (7443, 3881, 'CAGI955906', 1, '100000', '2020-04-01 23:10:03', 0, 'USDT');
INSERT INTO `qk_invest_record` VALUES (7444, 3882, 'CAGI636729', 1, '100000', '2020-04-01 23:10:12', 0, 'USDT');

-- ----------------------------
-- Table structure for qk_investment
-- ----------------------------
DROP TABLE IF EXISTS `qk_investment`;
CREATE TABLE `qk_investment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '套餐名称',
  `base_price` decimal(18, 2) NULL DEFAULT 0.00 COMMENT '投资JYB金额',
  `price` decimal(18, 2) NOT NULL DEFAULT 0.00 COMMENT '投资USDT金额',
  `rate` decimal(10, 2) NOT NULL DEFAULT 1.00 COMMENT '封顶收益倍数',
  `is_show` tinyint(3) NOT NULL DEFAULT 1 COMMENT '前台投资是否展示：0=不展示,1=展示',
  `is_del` tinyint(3) NOT NULL DEFAULT 0 COMMENT '是否删除:0=未删除,1=已删除',
  `rank_id` int(11) NULL DEFAULT 1 COMMENT '限制会员级别',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_investment
-- ----------------------------
INSERT INTO `qk_investment` VALUES (1, '套餐A', 3000.00, 300.00, 130.00, 1, 0, 1);
INSERT INTO `qk_investment` VALUES (2, '套餐B', 15000.00, 1500.00, 150.00, 1, 0, 1);
INSERT INTO `qk_investment` VALUES (3, '套餐C', 30000.00, 3000.00, 200.00, 1, 0, 1);
INSERT INTO `qk_investment` VALUES (4, '套餐D', 100000.00, 10000.00, 250.00, 1, 0, 1);
INSERT INTO `qk_investment` VALUES (5, '套餐E', 300000.00, 30000.00, 300.00, 1, 0, 5);

-- ----------------------------
-- Table structure for qk_investment_record
-- ----------------------------
DROP TABLE IF EXISTS `qk_investment_record`;
CREATE TABLE `qk_investment_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '会员ID',
  `member` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '会员账号',
  `investment_id` int(11) NULL DEFAULT NULL COMMENT '投资记录ID',
  `investment_money` decimal(18, 4) NULL DEFAULT 0.0000 COMMENT '投资金额',
  `investment_base_money` decimal(18, 4) NULL DEFAULT 0.0000 COMMENT '折算JYB金额',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '投资时间',
  `is_over` tinyint(3) NULL DEFAULT 0 COMMENT '分红是否结束:0=未结束,1=已结束',
  `is_del` tinyint(3) NULL DEFAULT 0 COMMENT '投资删除状态:0=未删除,1=已删除',
  `currency_id` int(11) NULL DEFAULT NULL COMMENT '投资币种ID',
  `currency_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '投资名字',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_investment_record
-- ----------------------------
INSERT INTO `qk_investment_record` VALUES (84, 1, 'CAGI000001', 2, 1500.0000, 15000.0000, '2020-04-01 14:24:36', 1, 0, 2, 'JYB');
INSERT INTO `qk_investment_record` VALUES (85, 3875, 'CAGI330446', 3, 3000.0000, 30000.0000, '2020-04-01 16:06:59', 0, 0, 1, 'USDT');
INSERT INTO `qk_investment_record` VALUES (86, 3875, 'CAGI330446', 3, 3000.0000, 30000.0000, '2020-04-01 16:07:19', 0, 0, 1, 'USDT');
INSERT INTO `qk_investment_record` VALUES (87, 3877, 'CAGI476212', 4, 10000.0000, 100000.0000, '2020-04-01 16:44:13', 0, 0, 1, 'USDT');
INSERT INTO `qk_investment_record` VALUES (88, 3876, 'CAGI891362', 4, 10000.0000, 100000.0000, '2020-04-01 16:46:20', 0, 0, 1, 'USDT');
INSERT INTO `qk_investment_record` VALUES (89, 3876, 'CAGI891362', 4, 10000.0000, 100000.0000, '2020-04-01 16:46:21', 0, 0, 1, 'USDT');
INSERT INTO `qk_investment_record` VALUES (90, 3878, 'CAGI307464', 4, 10000.0000, 100000.0000, '2020-04-01 23:11:09', 0, 0, 1, 'USDT');
INSERT INTO `qk_investment_record` VALUES (91, 3879, 'CAGI827031', 4, 10000.0000, 100000.0000, '2020-04-01 23:17:17', 0, 0, 1, 'USDT');
INSERT INTO `qk_investment_record` VALUES (92, 3879, 'CAGI827031', 3, 3000.0000, 30000.0000, '2020-04-01 23:17:36', 0, 0, 1, 'USDT');
INSERT INTO `qk_investment_record` VALUES (93, 3880, 'CAGI676690', 4, 10000.0000, 100000.0000, '2020-04-01 23:20:09', 0, 0, 1, 'USDT');
INSERT INTO `qk_investment_record` VALUES (94, 3880, 'CAGI676690', 4, 10000.0000, 100000.0000, '2020-04-01 23:20:18', 0, 0, 1, 'USDT');
INSERT INTO `qk_investment_record` VALUES (95, 3881, 'CAGI955906', 1, 300.0000, 3000.0000, '2020-04-01 23:22:18', 0, 0, 1, 'USDT');
INSERT INTO `qk_investment_record` VALUES (96, 3881, 'CAGI955906', 2, 1500.0000, 15000.0000, '2020-04-01 23:22:29', 0, 0, 1, 'USDT');
INSERT INTO `qk_investment_record` VALUES (97, 3881, 'CAGI955906', 3, 3000.0000, 30000.0000, '2020-04-01 23:22:39', 0, 0, 1, 'USDT');
INSERT INTO `qk_investment_record` VALUES (98, 3882, 'CAGI636729', 3, 3000.0000, 30000.0000, '2020-04-01 23:24:03', 0, 0, 1, 'USDT');
INSERT INTO `qk_investment_record` VALUES (99, 3882, 'CAGI636729', 3, 3000.0000, 30000.0000, '2020-04-01 23:24:15', 0, 0, 1, 'USDT');

-- ----------------------------
-- Table structure for qk_mail_receive
-- ----------------------------
DROP TABLE IF EXISTS `qk_mail_receive`;
CREATE TABLE `qk_mail_receive`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '会员ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `member` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '会员账号',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '凭证',
  `is_del` tinyint(3) NULL DEFAULT 0 COMMENT '删除状态:0=未删除,1=已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '平台收件箱' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_mail_receive
-- ----------------------------
INSERT INTO `qk_mail_receive` VALUES (6, 1, '1', '111', '2020-03-30 15:00:00', 'CAGI000001', '/imgs/file/20200330/30d9cda15615b9206814fd2f6bb46eb2.jpg', 0);

-- ----------------------------
-- Table structure for qk_mail_send
-- ----------------------------
DROP TABLE IF EXISTS `qk_mail_send`;
CREATE TABLE `qk_mail_send`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `is_del` tinyint(3) NULL DEFAULT 0 COMMENT '删除状态:0=未删除,1=已删除',
  `member` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '会员账号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '平台发件箱' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qk_news
-- ----------------------------
DROP TABLE IF EXISTS `qk_news`;
CREATE TABLE `qk_news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '新闻标题',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '新闻图片',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '新闻内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '新闻简介',
  `order` int(11) NULL DEFAULT 100 COMMENT '排序值:值越小,越靠前',
  `is_del` tinyint(3) NULL DEFAULT 0 COMMENT '删除状态:0=未删除,1=已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_news
-- ----------------------------
INSERT INTO `qk_news` VALUES (1, '新闻标题', '/imgs/base/15852069124343835.jpg', '<p>新闻内容内容</p>\n<p>&nbsp;</p>', '2020-03-10 15:26:13', '新闻简介', 1, 0);
INSERT INTO `qk_news` VALUES (2, '新闻测试', '/imgs/base/15852069251840149.jpg', '<p>这里是新闻内容</p>\n<p><img class=\"wscnph\" src=\"/imgs/file/20200326/1c3eee346e4a293d0d59cf54350cfa1e.jpg\" /></p>', '2020-03-26 14:59:07', '1', 2, 0);

-- ----------------------------
-- Table structure for qk_notice
-- ----------------------------
DROP TABLE IF EXISTS `qk_notice`;
CREATE TABLE `qk_notice`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `content` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `order` int(11) NULL DEFAULT 100 COMMENT '排序值',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `is_del` int(11) NULL DEFAULT 0 COMMENT '删除状态:0=未删除,1=已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_notice
-- ----------------------------
INSERT INTO `qk_notice` VALUES (1, '系统内测公告', 'cagi系统正在内测中，敬请期待！', 1, '2020-03-10 15:23:06', 0);

-- ----------------------------
-- Table structure for qk_rank
-- ----------------------------
DROP TABLE IF EXISTS `qk_rank`;
CREATE TABLE `qk_rank`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `invest_money` decimal(18, 2) NULL DEFAULT 0.00 COMMENT '伞下团队销售金额',
  `team_rank_id` int(11) NULL DEFAULT NULL COMMENT '升级所需伞下会员级别',
  `team_rank_number` int(11) NULL DEFAULT NULL COMMENT '升级伞下会员数量',
  `sales_number` int(11) NULL DEFAULT NULL COMMENT '直接销售单量',
  `is_del` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除 0 否  1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '会员等级' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_rank
-- ----------------------------
INSERT INTO `qk_rank` VALUES (1, 'J0', '注册成功', 0.00, 0, 0, 0, 0);
INSERT INTO `qk_rank` VALUES (2, 'J1', '1：直接销售9单；\r\n2：伞下总销售额达25万USDT', 250000.00, 0, 0, 9, 0);
INSERT INTO `qk_rank` VALUES (3, 'J2', '1：伞下出现两个J1等级会员\r\n2伞下总销售额达50万USDT', 500000.00, 2, 2, 0, 0);
INSERT INTO `qk_rank` VALUES (4, 'J3', '1：伞下出现两个J2等级会员\r\n2伞下总销售额达100万USDT', 1000000.00, 3, 2, 0, 0);
INSERT INTO `qk_rank` VALUES (5, 'J4', '1：伞下出现三个J3等级会员\r\n2伞下总销售额达300万USDT', 3000000.00, 4, 3, 0, 0);
INSERT INTO `qk_rank` VALUES (6, 'J5', '1：伞下出现三个J4等级会员\r\n2伞下总销售额达900万USDT', 9000000.00, 5, 3, 0, 0);
INSERT INTO `qk_rank` VALUES (7, 'J6', '1：伞下出现三个J5等级会员\r\n2伞下总销售额达2700万USDT', 27000000.00, 6, 3, 0, 0);

-- ----------------------------
-- Table structure for qk_remittance_record
-- ----------------------------
DROP TABLE IF EXISTS `qk_remittance_record`;
CREATE TABLE `qk_remittance_record`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `member` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员账号',
  `currency_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '币种名称',
  `currency_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '币种ID',
  `target_currency_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '自动到账币种名称',
  `rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '比重汇率',
  `target_currency_id` int(11) NULL DEFAULT NULL COMMENT '自动到账币种',
  `money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '汇款金额',
  `reality_money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '到账金额',
  `pay_voucher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '汇款凭证',
  `refuse` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '拒绝的理由',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '充值地址',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0=待审核,1通过,2=拒绝',
  `is_del` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0=不删除,1=删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '汇款记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_remittance_record
-- ----------------------------
INSERT INTO `qk_remittance_record` VALUES (5, 3867, 'CAGI612050', 'USDT', 1, 'JYB', 10.00, 2, 10000.00, 100000.00, '/imgs/file/20200331/6f0716c18a6feb7a24627ebf670f0a42.jpg', '', '2020-03-31 16:41:44', NULL, '0xa75e7211d3c61d262cd3f249f74a7b1c39543fc6', 1, 0);

-- ----------------------------
-- Table structure for qk_role_admin
-- ----------------------------
DROP TABLE IF EXISTS `qk_role_admin`;
CREATE TABLE `qk_role_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '组名',
  `rules` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '规则ID',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `is_del` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态:0=未删除,1=已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_role_admin
-- ----------------------------
INSERT INTO `qk_role_admin` VALUES (1, '管理员', '1,4', '', 0);

-- ----------------------------
-- Table structure for qk_role_user
-- ----------------------------
DROP TABLE IF EXISTS `qk_role_user`;
CREATE TABLE `qk_role_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '角色名称',
  `order` int(11) NOT NULL DEFAULT 1 COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '备注',
  `debar_reward` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '排除奖项,奖项id用逗号分隔',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=禁用,1=启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '会员所属角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_role_user
-- ----------------------------
INSERT INTO `qk_role_user` VALUES (1, '普通用户', 1, '', '', 1);
INSERT INTO `qk_role_user` VALUES (2, '推广员VIP', 1, '', '', 1);

-- ----------------------------
-- Table structure for qk_service
-- ----------------------------
DROP TABLE IF EXISTS `qk_service`;
CREATE TABLE `qk_service`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '客服名称',
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qq',
  `wechat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '微信号',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电话',
  `is_del` int(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0不删除 1删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qk_transfer_record
-- ----------------------------
DROP TABLE IF EXISTS `qk_transfer_record`;
CREATE TABLE `qk_transfer_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '会员ID',
  `member` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员账号',
  `currency_id` int(11) NULL DEFAULT NULL COMMENT '币种ID',
  `currency_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '币种名称',
  `money` decimal(18, 2) NULL DEFAULT NULL COMMENT '转账金额',
  `target_uid` int(11) NULL DEFAULT NULL COMMENT '转入会员ID',
  `target_member` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '转入会员账号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `fee_money` decimal(18, 2) NULL DEFAULT NULL COMMENT '手续费',
  `reality_money` decimal(18, 2) NULL DEFAULT NULL COMMENT '实际到账金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3392 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '转账' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qk_user
-- ----------------------------
DROP TABLE IF EXISTS `qk_user`;
CREATE TABLE `qk_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '会员邮箱',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '昵称',
  `member` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '账号',
  `pay_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '二级密码',
  `original_pay_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '未加密二级密码',
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '邀请码',
  `gesture_password` int(11) NOT NULL COMMENT '手势密码',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '账户密码',
  `original_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '未加密登录密码',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '密码盐',
  `rank_id` int(11) NOT NULL DEFAULT 1 COMMENT '用户星级ID',
  `role_id` int(11) NOT NULL DEFAULT 1 COMMENT '用户角色ID',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '用户手机号',
  `pid` int(11) NOT NULL COMMENT '推荐人id',
  `upid` int(11) NOT NULL COMMENT '节点上级id',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '节点层级数',
  `position` int(11) NOT NULL DEFAULT 0 COMMENT '节点的位置',
  `total_valid_direct` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '直推有效总人数',
  `total_direct` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '直推总人数',
  `group_valid_person_count` int(11) NULL DEFAULT 0 COMMENT '团队有效总人数',
  `group_person_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '团队总人数',
  `group_achievement_money` decimal(18, 4) UNSIGNED NOT NULL DEFAULT 0.0000 COMMENT '团队总业绩',
  `achievement_money` decimal(18, 4) UNSIGNED NOT NULL DEFAULT 0.0000 COMMENT '个人总业绩',
  `status` tinyint(3) NOT NULL DEFAULT 1 COMMENT '用户状态:0=禁用,1=启用',
  `active_time` datetime(0) NULL DEFAULT NULL COMMENT '用户激活时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `is_del` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0不删除 1 删除',
  `parent_member` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '推荐人账户',
  `head_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `lever_account` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '杠杆账户余额',
  `is_investment` tinyint(3) NULL DEFAULT 0 COMMENT '是否以投资:0=未投资,1=已投资',
  `is_invest` tinyint(3) NULL DEFAULT 0 COMMENT '是否投资中:0=投资已过期.1=投资中(投资中会员算有效会员)',
  `recommend_relation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '推荐关系',
  `investment_money` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '创投总金额',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_upid`(`upid`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3883 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_user
-- ----------------------------
INSERT INTO `qk_user` VALUES (1, '', 'CAGI', 'CAGI000001', 'e10adc3949ba59abbe56e057f20f883e', '123456', '00000001', 123456, 'e43dda5f8a1614919418d7682ed94a2f', '123456', '6136', 4, 1, '8618888888888', 0, 0, 0, 0, 1, 1, 8, 8, 89800.0000, 1500.0000, 1, NULL, '2020-03-07 15:38:04', 0, 'root', '/imgs/file/20200327/9467311ea1af43f4a5bbfa1b39ab8f2a.png', 0.0000, 1, 0, '', 28800.0000);
INSERT INTO `qk_user` VALUES (3875, '', '123456', 'CAGI330446', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'RPLG2TFG', 14789, '31a80b010867cba79134dad58fdfb034', '123456', '6009', 1, 1, '12345678910', 1, 1, 0, 0, 6, 6, 7, 7, 83800.0000, 6000.0000, 1, NULL, '2020-04-01 15:06:17', 0, 'CAGI000001', '', 95860.0000, 1, 1, ',1', 120000.0000);
INSERT INTO `qk_user` VALUES (3876, '', 'Test03', 'CAGI891362', 'c33367701511b4f6020ec61ded352059', '654321', 'HH93EPJB', 147852369, '6fafb353afbf343e67a8e2baea5cfd28', '654321', '1466', 1, 1, '60177170388', 3875, 3875, 0, 0, 1, 1, 1, 1, 10000.0000, 20000.0000, 1, NULL, '2020-04-01 16:19:13', 0, 'CAGI330446', '', 500000.0000, 1, 1, ',1,3875', 500000.0000);
INSERT INTO `qk_user` VALUES (3877, '', 'Test04', 'CAGI476212', 'c33367701511b4f6020ec61ded352059', '654321', 'U353LBRS', 147852369, '21e0b203cd4c8c633dce8131de35747b', '654321', '5242', 1, 1, '60177170389', 3876, 3876, 0, 0, 0, 0, 0, 0, 0.0000, 10000.0000, 1, NULL, '2020-04-01 16:27:29', 0, 'CAGI891362', '', 250000.0000, 1, 1, ',1,3875,3876', 250000.0000);
INSERT INTO `qk_user` VALUES (3878, '', 'ben01', 'CAGI307464', 'e10adc3949ba59abbe56e057f20f883e', '123456', '551MLLSV', 12369874, 'aa365ef559f1111636e7f133911736cb', '123456', '3815', 1, 1, '6581832501', 3875, 3875, 0, 0, 0, 0, 0, 0, 0.0000, 10000.0000, 1, NULL, '2020-04-01 18:20:49', 0, 'CAGI330446', '', 250000.0000, 1, 1, ',1,3875', 250000.0000);
INSERT INTO `qk_user` VALUES (3879, '', 'ben02', 'CAGI827031', 'e10adc3949ba59abbe56e057f20f883e', '123456', '753BSOCL', 14789, '51e4f895aa941435efc78b62ae89eff1', '123456', '9091', 1, 1, '6512345678', 3875, 3875, 0, 0, 0, 0, 0, 0, 0.0000, 13000.0000, 1, NULL, '2020-04-01 18:31:10', 0, 'CAGI330446', '', 310000.0000, 1, 1, ',1,3875', 310000.0000);
INSERT INTO `qk_user` VALUES (3880, '', 'ben03', 'CAGI676690', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'M8Q703AM', 14789, '5707c4ef39dbef31be6d8ef0901d0d61', '123456', '7866', 1, 1, '6522345678', 3875, 3875, 0, 0, 0, 0, 0, 0, 0.0000, 20000.0000, 1, NULL, '2020-04-01 18:31:39', 0, 'CAGI330446', '', 500000.0000, 1, 1, ',1,3875', 500000.0000);
INSERT INTO `qk_user` VALUES (3881, '', 'ben04', 'CAGI955906', 'e10adc3949ba59abbe56e057f20f883e', '123456', '7UV09FCN', 14789, 'b4978c7bde7817aea38e29e6f586f6e5', '123456', '1142', 1, 1, '6533345678', 3875, 3875, 0, 0, 0, 0, 0, 0, 0.0000, 4800.0000, 1, NULL, '2020-04-01 18:32:08', 0, 'CAGI330446', '', 86400.0000, 1, 1, ',1,3875', 86400.0000);
INSERT INTO `qk_user` VALUES (3882, '', 'ben05', 'CAGI636729', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'JLOAJIR3', 14789, 'd89ad37acaa89196963dec214c24f930', '123456', '5100', 1, 1, '6544445678', 3875, 3875, 0, 0, 0, 0, 0, 0, 0.0000, 6000.0000, 1, NULL, '2020-04-01 18:32:31', 0, 'CAGI330446', '', 120000.0000, 1, 1, ',1,3875', 120000.0000);

-- ----------------------------
-- Table structure for qk_venture_record
-- ----------------------------
DROP TABLE IF EXISTS `qk_venture_record`;
CREATE TABLE `qk_venture_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '展示内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `is_del` tinyint(3) NULL DEFAULT 0 COMMENT '删除状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qk_venture_record
-- ----------------------------
INSERT INTO `qk_venture_record` VALUES (1, '会员创投2000USDT', '2020-03-15 15:57:28', 1);
INSERT INTO `qk_venture_record` VALUES (2, '会员创投100USDT', NULL, 1);
INSERT INTO `qk_venture_record` VALUES (3, '会员小明成功参与创投获得1500分红金', '2020-03-26 14:54:25', 0);
INSERT INTO `qk_venture_record` VALUES (4, '会员 帅哥 成功参与创投获得1500分红金', '2020-03-26 14:54:44', 0);
INSERT INTO `qk_venture_record` VALUES (5, '会员 少侠 成功参与创投获得1500分红金', '2020-03-26 14:55:01', 0);
INSERT INTO `qk_venture_record` VALUES (6, '会员******成功参与创投获得10000分红金', '2020-03-29 16:14:07', 0);
INSERT INTO `qk_venture_record` VALUES (7, '会员******成功参与创投获得15000分红金', '2020-03-29 16:14:21', 0);
INSERT INTO `qk_venture_record` VALUES (8, '会员******成功参与创投获得3000分红金', '2020-03-29 16:14:30', 0);
INSERT INTO `qk_venture_record` VALUES (9, '会员sdf*****成功参与创投获得6000分红金', '2020-03-29 16:14:42', 0);

-- ----------------------------
-- View structure for qk_view_active_user
-- ----------------------------
DROP VIEW IF EXISTS `qk_view_active_user`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `qk_view_active_user` AS select `qk_user`.`id` AS `id`,`qk_user`.`pid` AS `pid`,`qk_user`.`member` AS `member`,`qk_user`.`phone` AS `phone`,`qk_user`.`headimg` AS `headimg`,`qk_user`.`order_num` AS `order_num`,`qk_user`.`nick_name` AS `nick_name`,`qk_user`.`role_id` AS `role_id`,`qk_user`.`total_direct` AS `total_direct`,`qk_user`.`group_person_count` AS `group_person_count` from `qk_user` where (`qk_user`.`role_id` > 1);

SET FOREIGN_KEY_CHECKS = 1;
