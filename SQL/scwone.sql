/*
 Navicat Premium Data Transfer

 Source Server         : Ben
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : scwone

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 02/02/2021 21:56:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_account_type_cert
-- ----------------------------
DROP TABLE IF EXISTS `t_account_type_cert`;
CREATE TABLE `t_account_type_cert`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accttype` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `certid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_account_type_cert
-- ----------------------------

-- ----------------------------
-- Table structure for t_advertisement
-- ----------------------------
DROP TABLE IF EXISTS `t_advertisement`;
CREATE TABLE `t_advertisement`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iconpath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_advertisement
-- ----------------------------

-- ----------------------------
-- Table structure for t_cert
-- ----------------------------
DROP TABLE IF EXISTS `t_cert`;
CREATE TABLE `t_cert`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cert
-- ----------------------------

-- ----------------------------
-- Table structure for t_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `t_dictionary`;
CREATE TABLE `t_dictionary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `val` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dictionary
-- ----------------------------

-- ----------------------------
-- Table structure for t_member
-- ----------------------------
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginacct` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userpswd` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `authstatus` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `usertype` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cardnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `accttype` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_member
-- ----------------------------

-- ----------------------------
-- Table structure for t_member_address
-- ----------------------------
DROP TABLE IF EXISTS `t_member_address`;
CREATE TABLE `t_member_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_member_address
-- ----------------------------

-- ----------------------------
-- Table structure for t_member_cert
-- ----------------------------
DROP TABLE IF EXISTS `t_member_cert`;
CREATE TABLE `t_member_cert`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NULL DEFAULT NULL,
  `certid` int(11) NULL DEFAULT NULL,
  `iconpath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_member_cert
-- ----------------------------

-- ----------------------------
-- Table structure for t_member_project_follow
-- ----------------------------
DROP TABLE IF EXISTS `t_member_project_follow`;
CREATE TABLE `t_member_project_follow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NULL DEFAULT NULL,
  `memberid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_member_project_follow
-- ----------------------------

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `senddate` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_message
-- ----------------------------

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NULL DEFAULT NULL,
  `projectid` int(11) NULL DEFAULT NULL,
  `returnid` int(11) NULL DEFAULT NULL,
  `ordernum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdate` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` int(11) NULL DEFAULT NULL,
  `rtncount` int(11) NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invoice` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invoictitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_param
-- ----------------------------
DROP TABLE IF EXISTS `t_param`;
CREATE TABLE `t_param`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `val` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_param
-- ----------------------------

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES (1, 0, '权限管理', 'glyphicon glyphicon-tasks', NULL);
INSERT INTO `t_permission` VALUES (2, 0, '业务审核', 'glyphicon glyphicon-align-justify', NULL);
INSERT INTO `t_permission` VALUES (3, 0, '业务管理', 'glyphicon glyphicon-list-alt', NULL);
INSERT INTO `t_permission` VALUES (4, 0, '系统维护', 'glyphicon glyphicon-hdd', NULL);
INSERT INTO `t_permission` VALUES (5, 1, '用户维护', 'glyphicon glyphicon-user', 'permission/user/toUserMain');
INSERT INTO `t_permission` VALUES (6, 1, '角色维护', 'glyphicon glyphicon-king', 'permission/role/toRoleMain');
INSERT INTO `t_permission` VALUES (7, 1, '许可维护', 'glyphicon glyphicon-lock', NULL);
INSERT INTO `t_permission` VALUES (8, 2, '实名审核', 'glyphicon glyphicon-check', NULL);
INSERT INTO `t_permission` VALUES (9, 2, '广告审核', 'glyphicon glyphicon-check', NULL);
INSERT INTO `t_permission` VALUES (10, 2, '项目审核', 'glyphicon glyphicon-check', NULL);
INSERT INTO `t_permission` VALUES (11, 3, '资质维护', 'glyphicon glyphicon-picture', NULL);
INSERT INTO `t_permission` VALUES (12, 3, '分类管理', 'glyphicon glyphicon-equalizer', NULL);
INSERT INTO `t_permission` VALUES (13, 3, '流程管理', 'glyphicon glyphicon-random', NULL);
INSERT INTO `t_permission` VALUES (14, 3, '广告管理', 'glyphicon glyphicon-hdd', NULL);
INSERT INTO `t_permission` VALUES (15, 3, '消息模板', 'glyphicon glyphicon-comment', NULL);
INSERT INTO `t_permission` VALUES (16, 3, '项目分类', 'glyphicon glyphicon-list', NULL);
INSERT INTO `t_permission` VALUES (17, 3, '项目标签', 'glyphicon glyphicon-tags', NULL);
INSERT INTO `t_permission` VALUES (18, 4, '参数管理', 'glyphicon glyphicon-list-alt', NULL);

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` bigint(11) NULL DEFAULT NULL,
  `day` int(11) NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deploydate` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supportmoney` bigint(11) NULL DEFAULT NULL,
  `supporter` int(11) NULL DEFAULT NULL,
  `completion` int(3) NULL DEFAULT NULL,
  `memberid` int(11) NULL DEFAULT NULL,
  `createdate` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `follower` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_project
-- ----------------------------

-- ----------------------------
-- Table structure for t_project_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_project_tag`;
CREATE TABLE `t_project_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NULL DEFAULT NULL,
  `tagid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_7`(`projectid`) USING BTREE,
  INDEX `FK_Reference_8`(`tagid`) USING BTREE,
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`projectid`) REFERENCES `t_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`tagid`) REFERENCES `t_tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_project_tag
-- ----------------------------

-- ----------------------------
-- Table structure for t_project_type
-- ----------------------------
DROP TABLE IF EXISTS `t_project_type`;
CREATE TABLE `t_project_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NULL DEFAULT NULL,
  `typeid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_5`(`projectid`) USING BTREE,
  INDEX `FK_Reference_6`(`typeid`) USING BTREE,
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`projectid`) REFERENCES `t_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`typeid`) REFERENCES `t_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_project_type
-- ----------------------------

-- ----------------------------
-- Table structure for t_return
-- ----------------------------
DROP TABLE IF EXISTS `t_return`;
CREATE TABLE `t_return`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NULL DEFAULT NULL,
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supportmoney` int(11) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `signalpurchase` int(11) NULL DEFAULT NULL,
  `purchase` int(11) NULL DEFAULT NULL,
  `freight` int(11) NULL DEFAULT NULL,
  `invoice` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rtndate` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_return
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '管理员');
INSERT INTO `t_role` VALUES (2, '产品经理');
INSERT INTO `t_role` VALUES (3, '项目经理');
INSERT INTO `t_role` VALUES (4, '审核员');
INSERT INTO `t_role` VALUES (5, '程序员');
INSERT INTO `t_role` VALUES (6, '服务员');
INSERT INTO `t_role` VALUES (7, '讲解员');
INSERT INTO `t_role` VALUES (8, '售后');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NULL DEFAULT NULL,
  `permissionid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_3`(`roleid`) USING BTREE,
  INDEX `FK_Reference_4`(`permissionid`) USING BTREE,
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`roleid`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`permissionid`) REFERENCES `t_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tag
-- ----------------------------

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_type
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginacct` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userpswd` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `t_user_loginacct_uindex`(`loginacct`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1006 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (2, 'Ben01', '123456', 'Ben01', 'Alex@qq.com', '2021-01-27');
INSERT INTO `t_user` VALUES (5, 'Ben02', '456789', 'Ben02', 'FF@qq.com', '2021-01-27');
INSERT INTO `t_user` VALUES (17, 'Ben11', '11', 'Ben11', 'Ben11@qq.com', NULL);
INSERT INTO `t_user` VALUES (18, 'Ben12', '12', 'Ben12', 'Ben12@qq.com', NULL);
INSERT INTO `t_user` VALUES (19, 'Ben13', '13', 'Ben13', 'Ben13@qq.com', NULL);
INSERT INTO `t_user` VALUES (20, 'Ben14', '14', 'Ben14', 'Ben14@qq.com', NULL);
INSERT INTO `t_user` VALUES (21, 'Ben15', '15', 'Ben15', 'Ben15@qq.com', NULL);
INSERT INTO `t_user` VALUES (22, 'Ben16', '16', 'Ben16', 'Ben16@qq.com', NULL);
INSERT INTO `t_user` VALUES (23, 'Ben17', '17', 'Ben17', 'Ben17@qq.com', NULL);
INSERT INTO `t_user` VALUES (24, 'Ben18', '18', 'Ben18', 'Ben18@qq.com', NULL);
INSERT INTO `t_user` VALUES (25, 'Ben19', '19', 'Ben19', 'Ben19@qq.com', NULL);
INSERT INTO `t_user` VALUES (26, 'Ben20', '20', 'Ben20', 'Ben20@qq.com', NULL);
INSERT INTO `t_user` VALUES (27, 'Ben21', '21', 'Ben21', 'Ben21@qq.com', NULL);
INSERT INTO `t_user` VALUES (28, 'Ben22', '22', 'Ben22', 'Ben22@qq.com', NULL);
INSERT INTO `t_user` VALUES (29, 'Ben23', '23', 'Ben23', 'Ben23@qq.com', NULL);
INSERT INTO `t_user` VALUES (30, 'Ben24', '24', 'Ben24', 'Ben24@qq.com', NULL);
INSERT INTO `t_user` VALUES (31, 'Ben25', '25', 'Ben25', 'Ben25@qq.com', NULL);
INSERT INTO `t_user` VALUES (32, 'Ben26', '26', 'Ben26', 'Ben26@qq.com', NULL);
INSERT INTO `t_user` VALUES (33, 'Ben27', '27', 'Ben27', 'Ben27@qq.com', NULL);
INSERT INTO `t_user` VALUES (34, 'Ben28', '28', 'Ben28', 'Ben28@qq.com', NULL);
INSERT INTO `t_user` VALUES (35, 'Ben29', '29', 'Ben29', 'Ben29@qq.com', NULL);
INSERT INTO `t_user` VALUES (36, 'Ben30', '30', 'Ben30', 'Ben30@qq.com', NULL);
INSERT INTO `t_user` VALUES (37, 'Ben31', '31', 'Ben31', 'Ben31@qq.com', NULL);
INSERT INTO `t_user` VALUES (38, 'Ben32', '32', 'Ben32', 'Ben32@qq.com', NULL);
INSERT INTO `t_user` VALUES (39, 'Ben33', '33', 'Ben33', 'Ben33@qq.com', NULL);
INSERT INTO `t_user` VALUES (40, 'Ben34', '34', 'Ben34', 'Ben34@qq.com', NULL);
INSERT INTO `t_user` VALUES (41, 'Ben35', '35', 'Ben35', 'Ben35@qq.com', NULL);
INSERT INTO `t_user` VALUES (42, 'Ben36', '36', 'Ben36', 'Ben36@qq.com', NULL);
INSERT INTO `t_user` VALUES (43, 'Ben37', '37', 'Ben37', 'Ben37@qq.com', NULL);
INSERT INTO `t_user` VALUES (44, 'Ben38', '38', 'Ben38', 'Ben38@qq.com', NULL);
INSERT INTO `t_user` VALUES (45, 'Ben39', '39', 'Ben39', 'Ben39@qq.com', NULL);
INSERT INTO `t_user` VALUES (46, 'Ben40', '40', 'Ben40', 'Ben40@qq.com', NULL);
INSERT INTO `t_user` VALUES (47, 'Ben41', '41', 'Ben41', 'Ben41@qq.com', NULL);
INSERT INTO `t_user` VALUES (48, 'Ben42', '42', 'Ben42', 'Ben42@qq.com', NULL);
INSERT INTO `t_user` VALUES (49, 'Ben43', '43', 'Ben43', 'Ben43@qq.com', NULL);
INSERT INTO `t_user` VALUES (50, 'Ben44', '44', 'Ben44', 'Ben44@qq.com', NULL);
INSERT INTO `t_user` VALUES (51, 'Ben45', '45', 'Ben45', 'Ben45@qq.com', NULL);
INSERT INTO `t_user` VALUES (52, 'Ben46', '46', 'Ben46', 'Ben46@qq.com', NULL);
INSERT INTO `t_user` VALUES (53, 'Ben47', '47', 'Ben47', 'Ben47@qq.com', NULL);
INSERT INTO `t_user` VALUES (54, 'Ben48', '48', 'Ben48', 'Ben48@qq.com', NULL);
INSERT INTO `t_user` VALUES (55, 'Ben49', '49', 'Ben49', 'Ben49@qq.com', NULL);
INSERT INTO `t_user` VALUES (56, 'Ben50', '50', 'Ben50', 'Ben50@qq.com', NULL);
INSERT INTO `t_user` VALUES (57, 'Ben51', '51', 'Ben51', 'Ben51@qq.com', NULL);
INSERT INTO `t_user` VALUES (58, 'Ben52', '52', 'Ben52', 'Ben52@qq.com', NULL);
INSERT INTO `t_user` VALUES (59, 'Ben53', '53', 'Ben53', 'Ben53@qq.com', NULL);
INSERT INTO `t_user` VALUES (60, 'Ben54', '54', 'Ben54', 'Ben54@qq.com', NULL);
INSERT INTO `t_user` VALUES (61, 'Ben55', '55', 'Ben55', 'Ben55@qq.com', NULL);
INSERT INTO `t_user` VALUES (62, 'Ben56', '56', 'Ben56', 'Ben56@qq.com', NULL);
INSERT INTO `t_user` VALUES (63, 'Ben57', '57', 'Ben57', 'Ben57@qq.com', NULL);
INSERT INTO `t_user` VALUES (64, 'Ben58', '58', 'Ben58', 'Ben58@qq.com', NULL);
INSERT INTO `t_user` VALUES (65, 'Ben59', '59', 'Ben59', 'Ben59@qq.com', NULL);
INSERT INTO `t_user` VALUES (66, 'Ben60', '60', 'Ben60', 'Ben60@qq.com', NULL);
INSERT INTO `t_user` VALUES (67, 'Ben61', '61', 'Ben61', 'Ben61@qq.com', NULL);
INSERT INTO `t_user` VALUES (68, 'Ben62', '62', 'Ben62', 'Ben62@qq.com', NULL);
INSERT INTO `t_user` VALUES (69, 'Ben63', '63', 'Ben63', 'Ben63@qq.com', NULL);
INSERT INTO `t_user` VALUES (70, 'Ben64', '64', 'Ben64', 'Ben64@qq.com', NULL);
INSERT INTO `t_user` VALUES (71, 'Ben65', '65', 'Ben65', 'Ben65@qq.com', NULL);
INSERT INTO `t_user` VALUES (72, 'Ben66', '66', 'Ben66', 'Ben66@qq.com', NULL);
INSERT INTO `t_user` VALUES (73, 'Ben67', '67', 'Ben67', 'Ben67@qq.com', NULL);
INSERT INTO `t_user` VALUES (74, 'Ben68', '68', 'Ben68', 'Ben68@qq.com', NULL);
INSERT INTO `t_user` VALUES (75, 'Ben69', '69', 'Ben69', 'Ben69@qq.com', NULL);
INSERT INTO `t_user` VALUES (76, 'Ben70', '70', 'Ben70', 'Ben70@qq.com', NULL);
INSERT INTO `t_user` VALUES (77, 'Ben71', '71', 'Ben71', 'Ben71@qq.com', NULL);
INSERT INTO `t_user` VALUES (78, 'Ben72', '72', 'Ben72', 'Ben72@qq.com', NULL);
INSERT INTO `t_user` VALUES (79, 'Ben73', '73', 'Ben73', 'Ben73@qq.com', NULL);
INSERT INTO `t_user` VALUES (80, 'Ben74', '74', 'Ben74', 'Ben74@qq.com', NULL);
INSERT INTO `t_user` VALUES (81, 'Ben75', '75', 'Ben75', 'Ben75@qq.com', NULL);
INSERT INTO `t_user` VALUES (82, 'Ben76', '76', 'Ben76', 'Ben76@qq.com', NULL);
INSERT INTO `t_user` VALUES (83, 'Ben77', '77', 'Ben77', 'Ben77@qq.com', NULL);
INSERT INTO `t_user` VALUES (84, 'Ben78', '78', 'Ben78', 'Ben78@qq.com', NULL);
INSERT INTO `t_user` VALUES (85, 'Ben79', '79', 'Ben79', 'Ben79@qq.com', NULL);
INSERT INTO `t_user` VALUES (86, 'Ben80', '80', 'Ben80', 'Ben80@qq.com', NULL);
INSERT INTO `t_user` VALUES (87, 'Ben81', '81', 'Ben81', 'Ben81@qq.com', NULL);
INSERT INTO `t_user` VALUES (88, 'Ben82', '82', 'Ben82', 'Ben82@qq.com', NULL);
INSERT INTO `t_user` VALUES (89, 'Ben83', '83', 'Ben83', 'Ben83@qq.com', NULL);
INSERT INTO `t_user` VALUES (90, 'Ben84', '84', 'Ben84', 'Ben84@qq.com', NULL);
INSERT INTO `t_user` VALUES (91, 'Ben85', '85', 'Ben85', 'Ben85@qq.com', NULL);
INSERT INTO `t_user` VALUES (92, 'Ben86', '86', 'Ben86', 'Ben86@qq.com', NULL);
INSERT INTO `t_user` VALUES (93, 'Ben87', '87', 'Ben87', 'Ben87@qq.com', NULL);
INSERT INTO `t_user` VALUES (94, 'Ben88', '88', 'Ben88', 'Ben88@qq.com', NULL);
INSERT INTO `t_user` VALUES (95, 'Ben89', '89', 'Ben89', 'Ben89@qq.com', NULL);
INSERT INTO `t_user` VALUES (96, 'Ben90', '90', 'Ben90', 'Ben90@qq.com', NULL);
INSERT INTO `t_user` VALUES (97, 'Ben91', '91', 'Ben91', 'Ben91@qq.com', NULL);
INSERT INTO `t_user` VALUES (98, 'Ben92', '92', 'Ben92', 'Ben92@qq.com', NULL);
INSERT INTO `t_user` VALUES (99, 'Ben93', '93', 'Ben93', 'Ben93@qq.com', NULL);
INSERT INTO `t_user` VALUES (100, 'Ben94', '94', 'Ben94', 'Ben94@qq.com', NULL);
INSERT INTO `t_user` VALUES (101, 'Ben95', '95', 'Ben95', 'Ben95@qq.com', NULL);
INSERT INTO `t_user` VALUES (102, 'Ben96', '96', 'Ben96', 'Ben96@qq.com', NULL);
INSERT INTO `t_user` VALUES (103, 'Ben97', '97', 'Ben97', 'Ben97@qq.com', NULL);
INSERT INTO `t_user` VALUES (104, 'Ben98', '98', 'Ben98', 'Ben98@qq.com', NULL);
INSERT INTO `t_user` VALUES (105, 'Ben99', '99', 'Ben99', 'Ben99@qq.com', NULL);
INSERT INTO `t_user` VALUES (106, 'Ben100', '100', 'Ben100', 'Ben100@qq.com', NULL);
INSERT INTO `t_user` VALUES (107, 'Ben101', '101', 'Ben101', 'Ben101@qq.com', NULL);
INSERT INTO `t_user` VALUES (108, 'Ben102', '102', 'Ben102', 'Ben102@qq.com', NULL);
INSERT INTO `t_user` VALUES (109, 'Ben103', '103', 'Ben103', 'Ben103@qq.com', NULL);
INSERT INTO `t_user` VALUES (110, 'Ben104', '104', 'Ben104', 'Ben104@qq.com', NULL);
INSERT INTO `t_user` VALUES (111, 'Ben105', '105', 'Ben105', 'Ben105@qq.com', NULL);
INSERT INTO `t_user` VALUES (112, 'Ben106', '106', 'Ben106', 'Ben106@qq.com', NULL);
INSERT INTO `t_user` VALUES (113, 'Ben107', '107', 'Ben107', 'Ben107@qq.com', NULL);
INSERT INTO `t_user` VALUES (114, 'Ben108', '108', 'Ben108', 'Ben108@qq.com', NULL);
INSERT INTO `t_user` VALUES (115, 'Ben109', '109', 'Ben109', 'Ben109@qq.com', NULL);
INSERT INTO `t_user` VALUES (116, 'Ben110', '110', 'Ben110', 'Ben110@qq.com', NULL);
INSERT INTO `t_user` VALUES (117, 'Ben111', '111', 'Ben111', 'Ben111@qq.com', NULL);
INSERT INTO `t_user` VALUES (118, 'Ben112', '112', 'Ben112', 'Ben112@qq.com', NULL);
INSERT INTO `t_user` VALUES (119, 'Ben113', '113', 'Ben113', 'Ben113@qq.com', NULL);
INSERT INTO `t_user` VALUES (120, 'Ben114', '114', 'Ben114', 'Ben114@qq.com', NULL);
INSERT INTO `t_user` VALUES (121, 'Ben115', '115', 'Ben115', 'Ben115@qq.com', NULL);
INSERT INTO `t_user` VALUES (122, 'Ben116', '116', 'Ben116', 'Ben116@qq.com', NULL);
INSERT INTO `t_user` VALUES (123, 'Ben117', '117', 'Ben117', 'Ben117@qq.com', NULL);
INSERT INTO `t_user` VALUES (124, 'Ben118', '118', 'Ben118', 'Ben118@qq.com', NULL);
INSERT INTO `t_user` VALUES (125, 'Ben119', '119', 'Ben119', 'Ben119@qq.com', NULL);
INSERT INTO `t_user` VALUES (126, 'Ben120', '120', 'Ben120', 'Ben120@qq.com', NULL);
INSERT INTO `t_user` VALUES (127, 'Ben121', '121', 'Ben121', 'Ben121@qq.com', NULL);
INSERT INTO `t_user` VALUES (128, 'Ben122', '122', 'Ben122', 'Ben122@qq.com', NULL);
INSERT INTO `t_user` VALUES (129, 'Ben123', '123', 'Ben123', 'Ben123@qq.com', NULL);
INSERT INTO `t_user` VALUES (130, 'Ben124', '124', 'Ben124', 'Ben124@qq.com', NULL);
INSERT INTO `t_user` VALUES (131, 'Ben125', '125', 'Ben125', 'Ben125@qq.com', NULL);
INSERT INTO `t_user` VALUES (132, 'Ben126', '126', 'Ben126', 'Ben126@qq.com', NULL);
INSERT INTO `t_user` VALUES (133, 'Ben127', '127', 'Ben127', 'Ben127@qq.com', NULL);
INSERT INTO `t_user` VALUES (134, 'Ben128', '128', 'Ben128', 'Ben128@qq.com', NULL);
INSERT INTO `t_user` VALUES (135, 'Ben129', '129', 'Ben129', 'Ben129@qq.com', NULL);
INSERT INTO `t_user` VALUES (136, 'Ben130', '130', 'Ben130', 'Ben130@qq.com', NULL);
INSERT INTO `t_user` VALUES (137, 'Ben131', '131', 'Ben131', 'Ben131@qq.com', NULL);
INSERT INTO `t_user` VALUES (138, 'Ben132', '132', 'Ben132', 'Ben132@qq.com', NULL);
INSERT INTO `t_user` VALUES (139, 'Ben133', '133', 'Ben133', 'Ben133@qq.com', NULL);
INSERT INTO `t_user` VALUES (140, 'Ben134', '134', 'Ben134', 'Ben134@qq.com', NULL);
INSERT INTO `t_user` VALUES (141, 'Ben135', '135', 'Ben135', 'Ben135@qq.com', NULL);
INSERT INTO `t_user` VALUES (142, 'Ben136', '136', 'Ben136', 'Ben136@qq.com', NULL);
INSERT INTO `t_user` VALUES (143, 'Ben137', '137', 'Ben137', 'Ben137@qq.com', NULL);
INSERT INTO `t_user` VALUES (144, 'Ben138', '138', 'Ben138', 'Ben138@qq.com', NULL);
INSERT INTO `t_user` VALUES (145, 'Ben139', '139', 'Ben139', 'Ben139@qq.com', NULL);
INSERT INTO `t_user` VALUES (146, 'Ben140', '140', 'Ben140', 'Ben140@qq.com', NULL);
INSERT INTO `t_user` VALUES (147, 'Ben141', '141', 'Ben141', 'Ben141@qq.com', NULL);
INSERT INTO `t_user` VALUES (148, 'Ben142', '142', 'Ben142', 'Ben142@qq.com', NULL);
INSERT INTO `t_user` VALUES (149, 'Ben143', '143', 'Ben143', 'Ben143@qq.com', NULL);
INSERT INTO `t_user` VALUES (150, 'Ben144', '144', 'Ben144', 'Ben144@qq.com', NULL);
INSERT INTO `t_user` VALUES (151, 'Ben145', '145', 'Ben145', 'Ben145@qq.com', NULL);
INSERT INTO `t_user` VALUES (152, 'Ben146', '146', 'Ben146', 'Ben146@qq.com', NULL);
INSERT INTO `t_user` VALUES (153, 'Ben147', '147', 'Ben147', 'Ben147@qq.com', NULL);
INSERT INTO `t_user` VALUES (154, 'Ben148', '148', 'Ben148', 'Ben148@qq.com', NULL);
INSERT INTO `t_user` VALUES (155, 'Ben149', '149', 'Ben149', 'Ben149@qq.com', NULL);
INSERT INTO `t_user` VALUES (156, 'Ben150', '150', 'Ben150', 'Ben150@qq.com', NULL);
INSERT INTO `t_user` VALUES (157, 'Ben151', '151', 'Ben151', 'Ben151@qq.com', NULL);
INSERT INTO `t_user` VALUES (158, 'Ben152', '152', 'Ben152', 'Ben152@qq.com', NULL);
INSERT INTO `t_user` VALUES (159, 'Ben153', '153', 'Ben153', 'Ben153@qq.com', NULL);
INSERT INTO `t_user` VALUES (160, 'Ben154', '154', 'Ben154', 'Ben154@qq.com', NULL);
INSERT INTO `t_user` VALUES (161, 'Ben155', '155', 'Ben155', 'Ben155@qq.com', NULL);
INSERT INTO `t_user` VALUES (162, 'Ben156', '156', 'Ben156', 'Ben156@qq.com', NULL);
INSERT INTO `t_user` VALUES (163, 'Ben157', '157', 'Ben157', 'Ben157@qq.com', NULL);
INSERT INTO `t_user` VALUES (164, 'Ben158', '158', 'Ben158', 'Ben158@qq.com', NULL);
INSERT INTO `t_user` VALUES (165, 'Ben159', '159', 'Ben159', 'Ben159@qq.com', NULL);
INSERT INTO `t_user` VALUES (166, 'Ben160', '160', 'Ben160', 'Ben160@qq.com', NULL);
INSERT INTO `t_user` VALUES (167, 'Ben161', '161', 'Ben161', 'Ben161@qq.com', NULL);
INSERT INTO `t_user` VALUES (168, 'Ben162', '162', 'Ben162', 'Ben162@qq.com', NULL);
INSERT INTO `t_user` VALUES (169, 'Ben163', '163', 'Ben163', 'Ben163@qq.com', NULL);
INSERT INTO `t_user` VALUES (170, 'Ben164', '164', 'Ben164', 'Ben164@qq.com', NULL);
INSERT INTO `t_user` VALUES (171, 'Ben165', '165', 'Ben165', 'Ben165@qq.com', NULL);
INSERT INTO `t_user` VALUES (172, 'Ben166', '166', 'Ben166', 'Ben166@qq.com', NULL);
INSERT INTO `t_user` VALUES (173, 'Ben167', '167', 'Ben167', 'Ben167@qq.com', NULL);
INSERT INTO `t_user` VALUES (174, 'Ben168', '168', 'Ben168', 'Ben168@qq.com', NULL);
INSERT INTO `t_user` VALUES (175, 'Ben169', '169', 'Ben169', 'Ben169@qq.com', NULL);
INSERT INTO `t_user` VALUES (176, 'Ben170', '170', 'Ben170', 'Ben170@qq.com', NULL);
INSERT INTO `t_user` VALUES (177, 'Ben171', '171', 'Ben171', 'Ben171@qq.com', NULL);
INSERT INTO `t_user` VALUES (178, 'Ben172', '172', 'Ben172', 'Ben172@qq.com', NULL);
INSERT INTO `t_user` VALUES (179, 'Ben173', '173', 'Ben173', 'Ben173@qq.com', NULL);
INSERT INTO `t_user` VALUES (180, 'Ben174', '174', 'Ben174', 'Ben174@qq.com', NULL);
INSERT INTO `t_user` VALUES (181, 'Ben175', '175', 'Ben175', 'Ben175@qq.com', NULL);
INSERT INTO `t_user` VALUES (182, 'Ben176', '176', 'Ben176', 'Ben176@qq.com', NULL);
INSERT INTO `t_user` VALUES (183, 'Ben177', '177', 'Ben177', 'Ben177@qq.com', NULL);
INSERT INTO `t_user` VALUES (184, 'Ben178', '178', 'Ben178', 'Ben178@qq.com', NULL);
INSERT INTO `t_user` VALUES (185, 'Ben179', '179', 'Ben179', 'Ben179@qq.com', NULL);
INSERT INTO `t_user` VALUES (186, 'Ben180', '180', 'Ben180', 'Ben180@qq.com', NULL);
INSERT INTO `t_user` VALUES (187, 'Ben181', '181', 'Ben181', 'Ben181@qq.com', NULL);
INSERT INTO `t_user` VALUES (188, 'Ben182', '182', 'Ben182', 'Ben182@qq.com', NULL);
INSERT INTO `t_user` VALUES (189, 'Ben183', '183', 'Ben183', 'Ben183@qq.com', NULL);
INSERT INTO `t_user` VALUES (190, 'Ben184', '184', 'Ben184', 'Ben184@qq.com', NULL);
INSERT INTO `t_user` VALUES (191, 'Ben185', '185', 'Ben185', 'Ben185@qq.com', NULL);
INSERT INTO `t_user` VALUES (192, 'Ben186', '186', 'Ben186', 'Ben186@qq.com', NULL);
INSERT INTO `t_user` VALUES (193, 'Ben187', '187', 'Ben187', 'Ben187@qq.com', NULL);
INSERT INTO `t_user` VALUES (194, 'Ben188', '188', 'Ben188', 'Ben188@qq.com', NULL);
INSERT INTO `t_user` VALUES (195, 'Ben189', '189', 'Ben189', 'Ben189@qq.com', NULL);
INSERT INTO `t_user` VALUES (196, 'Ben190', '190', 'Ben190', 'Ben190@qq.com', NULL);
INSERT INTO `t_user` VALUES (197, 'Ben191', '191', 'Ben191', 'Ben191@qq.com', NULL);
INSERT INTO `t_user` VALUES (198, 'Ben192', '192', 'Ben192', 'Ben192@qq.com', NULL);
INSERT INTO `t_user` VALUES (199, 'Ben193', '193', 'Ben193', 'Ben193@qq.com', NULL);
INSERT INTO `t_user` VALUES (200, 'Ben194', '194', 'Ben194', 'Ben194@qq.com', NULL);
INSERT INTO `t_user` VALUES (201, 'Ben195', '195', 'Ben195', 'Ben195@qq.com', NULL);
INSERT INTO `t_user` VALUES (202, 'Ben196', '196', 'Ben196', 'Ben196@qq.com', NULL);
INSERT INTO `t_user` VALUES (203, 'Ben197', '197', 'Ben197', 'Ben197@qq.com', NULL);
INSERT INTO `t_user` VALUES (204, 'Ben198', '198', 'Ben198', 'Ben198@qq.com', NULL);
INSERT INTO `t_user` VALUES (205, 'Ben199', '199', 'Ben199', 'Ben199@qq.com', NULL);
INSERT INTO `t_user` VALUES (206, 'Ben200', '200', 'Ben200', 'Ben200@qq.com', NULL);
INSERT INTO `t_user` VALUES (207, 'Ben201', '201', 'Ben201', 'Ben201@qq.com', NULL);
INSERT INTO `t_user` VALUES (208, 'Ben202', '202', 'Ben202', 'Ben202@qq.com', NULL);
INSERT INTO `t_user` VALUES (209, 'Ben203', '203', 'Ben203', 'Ben203@qq.com', NULL);
INSERT INTO `t_user` VALUES (210, 'Ben204', '204', 'Ben204', 'Ben204@qq.com', NULL);
INSERT INTO `t_user` VALUES (211, 'Ben205', '205', 'Ben205', 'Ben205@qq.com', NULL);
INSERT INTO `t_user` VALUES (212, 'Ben206', '206', 'Ben206', 'Ben206@qq.com', NULL);
INSERT INTO `t_user` VALUES (213, 'Ben207', '207', 'Ben207', 'Ben207@qq.com', NULL);
INSERT INTO `t_user` VALUES (214, 'Ben208', '208', 'Ben208', 'Ben208@qq.com', NULL);
INSERT INTO `t_user` VALUES (215, 'Ben209', '209', 'Ben209', 'Ben209@qq.com', NULL);
INSERT INTO `t_user` VALUES (216, 'Ben210', '210', 'Ben210', 'Ben210@qq.com', NULL);
INSERT INTO `t_user` VALUES (217, 'Ben211', '211', 'Ben211', 'Ben211@qq.com', NULL);
INSERT INTO `t_user` VALUES (218, 'Ben212', '212', 'Ben212', 'Ben212@qq.com', NULL);
INSERT INTO `t_user` VALUES (219, 'Ben213', '213', 'Ben213', 'Ben213@qq.com', NULL);
INSERT INTO `t_user` VALUES (220, 'Ben214', '214', 'Ben214', 'Ben214@qq.com', NULL);
INSERT INTO `t_user` VALUES (221, 'Ben215', '215', 'Ben215', 'Ben215@qq.com', NULL);
INSERT INTO `t_user` VALUES (222, 'Ben216', '216', 'Ben216', 'Ben216@qq.com', NULL);
INSERT INTO `t_user` VALUES (223, 'Ben217', '217', 'Ben217', 'Ben217@qq.com', NULL);
INSERT INTO `t_user` VALUES (224, 'Ben218', '218', 'Ben218', 'Ben218@qq.com', NULL);
INSERT INTO `t_user` VALUES (225, 'Ben219', '219', 'Ben219', 'Ben219@qq.com', NULL);
INSERT INTO `t_user` VALUES (226, 'Ben220', '220', 'Ben220', 'Ben220@qq.com', NULL);
INSERT INTO `t_user` VALUES (227, 'Ben221', '221', 'Ben221', 'Ben221@qq.com', NULL);
INSERT INTO `t_user` VALUES (228, 'Ben222', '222', 'Ben222', 'Ben222@qq.com', NULL);
INSERT INTO `t_user` VALUES (229, 'Ben223', '223', 'Ben223', 'Ben223@qq.com', NULL);
INSERT INTO `t_user` VALUES (230, 'Ben224', '224', 'Ben224', 'Ben224@qq.com', NULL);
INSERT INTO `t_user` VALUES (231, 'Ben225', '225', 'Ben225', 'Ben225@qq.com', NULL);
INSERT INTO `t_user` VALUES (232, 'Ben226', '226', 'Ben226', 'Ben226@qq.com', NULL);
INSERT INTO `t_user` VALUES (233, 'Ben227', '227', 'Ben227', 'Ben227@qq.com', NULL);
INSERT INTO `t_user` VALUES (234, 'Ben228', '228', 'Ben228', 'Ben228@qq.com', NULL);
INSERT INTO `t_user` VALUES (235, 'Ben229', '229', 'Ben229', 'Ben229@qq.com', NULL);
INSERT INTO `t_user` VALUES (236, 'Ben230', '230', 'Ben230', 'Ben230@qq.com', NULL);
INSERT INTO `t_user` VALUES (237, 'Ben231', '231', 'Ben231', 'Ben231@qq.com', NULL);
INSERT INTO `t_user` VALUES (238, 'Ben232', '232', 'Ben232', 'Ben232@qq.com', NULL);
INSERT INTO `t_user` VALUES (239, 'Ben233', '233', 'Ben233', 'Ben233@qq.com', NULL);
INSERT INTO `t_user` VALUES (240, 'Ben234', '234', 'Ben234', 'Ben234@qq.com', NULL);
INSERT INTO `t_user` VALUES (241, 'Ben235', '235', 'Ben235', 'Ben235@qq.com', NULL);
INSERT INTO `t_user` VALUES (242, 'Ben236', '236', 'Ben236', 'Ben236@qq.com', NULL);
INSERT INTO `t_user` VALUES (243, 'Ben237', '237', 'Ben237', 'Ben237@qq.com', NULL);
INSERT INTO `t_user` VALUES (244, 'Ben238', '238', 'Ben238', 'Ben238@qq.com', NULL);
INSERT INTO `t_user` VALUES (245, 'Ben239', '239', 'Ben239', 'Ben239@qq.com', NULL);
INSERT INTO `t_user` VALUES (246, 'Ben240', '240', 'Ben240', 'Ben240@qq.com', NULL);
INSERT INTO `t_user` VALUES (247, 'Ben241', '241', 'Ben241', 'Ben241@qq.com', NULL);
INSERT INTO `t_user` VALUES (248, 'Ben242', '242', 'Ben242', 'Ben242@qq.com', NULL);
INSERT INTO `t_user` VALUES (249, 'Ben243', '243', 'Ben243', 'Ben243@qq.com', NULL);
INSERT INTO `t_user` VALUES (250, 'Ben244', '244', 'Ben244', 'Ben244@qq.com', NULL);
INSERT INTO `t_user` VALUES (251, 'Ben245', '245', 'Ben245', 'Ben245@qq.com', NULL);
INSERT INTO `t_user` VALUES (252, 'Ben246', '246', 'Ben246', 'Ben246@qq.com', NULL);
INSERT INTO `t_user` VALUES (253, 'Ben247', '247', 'Ben247', 'Ben247@qq.com', NULL);
INSERT INTO `t_user` VALUES (254, 'Ben248', '248', 'Ben248', 'Ben248@qq.com', NULL);
INSERT INTO `t_user` VALUES (255, 'Ben249', '249', 'Ben249', 'Ben249@qq.com', NULL);
INSERT INTO `t_user` VALUES (256, 'Ben250', '250', 'Ben250', 'Ben250@qq.com', NULL);
INSERT INTO `t_user` VALUES (257, 'Ben251', '251', 'Ben251', 'Ben251@qq.com', NULL);
INSERT INTO `t_user` VALUES (258, 'Ben252', '252', 'Ben252', 'Ben252@qq.com', NULL);
INSERT INTO `t_user` VALUES (259, 'Ben253', '253', 'Ben253', 'Ben253@qq.com', NULL);
INSERT INTO `t_user` VALUES (260, 'Ben254', '254', 'Ben254', 'Ben254@qq.com', NULL);
INSERT INTO `t_user` VALUES (261, 'Ben255', '255', 'Ben255', 'Ben255@qq.com', NULL);
INSERT INTO `t_user` VALUES (262, 'Ben256', '256', 'Ben256', 'Ben256@qq.com', NULL);
INSERT INTO `t_user` VALUES (263, 'Ben257', '257', 'Ben257', 'Ben257@qq.com', NULL);
INSERT INTO `t_user` VALUES (264, 'Ben258', '258', 'Ben258', 'Ben258@qq.com', NULL);
INSERT INTO `t_user` VALUES (265, 'Ben259', '259', 'Ben259', 'Ben259@qq.com', NULL);
INSERT INTO `t_user` VALUES (266, 'Ben260', '260', 'Ben260', 'Ben260@qq.com', NULL);
INSERT INTO `t_user` VALUES (267, 'Ben261', '261', 'Ben261', 'Ben261@qq.com', NULL);
INSERT INTO `t_user` VALUES (268, 'Ben262', '262', 'Ben262', 'Ben262@qq.com', NULL);
INSERT INTO `t_user` VALUES (269, 'Ben263', '263', 'Ben263', 'Ben263@qq.com', NULL);
INSERT INTO `t_user` VALUES (270, 'Ben264', '264', 'Ben264', 'Ben264@qq.com', NULL);
INSERT INTO `t_user` VALUES (271, 'Ben265', '265', 'Ben265', 'Ben265@qq.com', NULL);
INSERT INTO `t_user` VALUES (272, 'Ben266', '266', 'Ben266', 'Ben266@qq.com', NULL);
INSERT INTO `t_user` VALUES (273, 'Ben267', '267', 'Ben267', 'Ben267@qq.com', NULL);
INSERT INTO `t_user` VALUES (274, 'Ben268', '268', 'Ben268', 'Ben268@qq.com', NULL);
INSERT INTO `t_user` VALUES (275, 'Ben269', '269', 'Ben269', 'Ben269@qq.com', NULL);
INSERT INTO `t_user` VALUES (276, 'Ben270', '270', 'Ben270', 'Ben270@qq.com', NULL);
INSERT INTO `t_user` VALUES (277, 'Ben271', '271', 'Ben271', 'Ben271@qq.com', NULL);
INSERT INTO `t_user` VALUES (278, 'Ben272', '272', 'Ben272', 'Ben272@qq.com', NULL);
INSERT INTO `t_user` VALUES (279, 'Ben273', '273', 'Ben273', 'Ben273@qq.com', NULL);
INSERT INTO `t_user` VALUES (280, 'Ben274', '274', 'Ben274', 'Ben274@qq.com', NULL);
INSERT INTO `t_user` VALUES (281, 'Ben275', '275', 'Ben275', 'Ben275@qq.com', NULL);
INSERT INTO `t_user` VALUES (282, 'Ben276', '276', 'Ben276', 'Ben276@qq.com', NULL);
INSERT INTO `t_user` VALUES (283, 'Ben277', '277', 'Ben277', 'Ben277@qq.com', NULL);
INSERT INTO `t_user` VALUES (284, 'Ben278', '278', 'Ben278', 'Ben278@qq.com', NULL);
INSERT INTO `t_user` VALUES (285, 'Ben279', '279', 'Ben279', 'Ben279@qq.com', NULL);
INSERT INTO `t_user` VALUES (286, 'Ben280', '280', 'Ben280', 'Ben280@qq.com', NULL);
INSERT INTO `t_user` VALUES (287, 'Ben281', '281', 'Ben281', 'Ben281@qq.com', NULL);
INSERT INTO `t_user` VALUES (288, 'Ben282', '282', 'Ben282', 'Ben282@qq.com', NULL);
INSERT INTO `t_user` VALUES (289, 'Ben283', '283', 'Ben283', 'Ben283@qq.com', NULL);
INSERT INTO `t_user` VALUES (290, 'Ben284', '284', 'Ben284', 'Ben284@qq.com', NULL);
INSERT INTO `t_user` VALUES (291, 'Ben285', '285', 'Ben285', 'Ben285@qq.com', NULL);
INSERT INTO `t_user` VALUES (292, 'Ben286', '286', 'Ben286', 'Ben286@qq.com', NULL);
INSERT INTO `t_user` VALUES (293, 'Ben287', '287', 'Ben287', 'Ben287@qq.com', NULL);
INSERT INTO `t_user` VALUES (294, 'Ben288', '288', 'Ben288', 'Ben288@qq.com', NULL);
INSERT INTO `t_user` VALUES (295, 'Ben289', '289', 'Ben289', 'Ben289@qq.com', NULL);
INSERT INTO `t_user` VALUES (296, 'Ben290', '290', 'Ben290', 'Ben290@qq.com', NULL);
INSERT INTO `t_user` VALUES (297, 'Ben291', '291', 'Ben291', 'Ben291@qq.com', NULL);
INSERT INTO `t_user` VALUES (298, 'Ben292', '292', 'Ben292', 'Ben292@qq.com', NULL);
INSERT INTO `t_user` VALUES (299, 'Ben293', '293', 'Ben293', 'Ben293@qq.com', NULL);
INSERT INTO `t_user` VALUES (300, 'Ben294', '294', 'Ben294', 'Ben294@qq.com', NULL);
INSERT INTO `t_user` VALUES (301, 'Ben295', '295', 'Ben295', 'Ben295@qq.com', NULL);
INSERT INTO `t_user` VALUES (302, 'Ben296', '296', 'Ben296', 'Ben296@qq.com', NULL);
INSERT INTO `t_user` VALUES (303, 'Ben297', '297', 'Ben297', 'Ben297@qq.com', NULL);
INSERT INTO `t_user` VALUES (304, 'Ben298', '298', 'Ben298', 'Ben298@qq.com', NULL);
INSERT INTO `t_user` VALUES (305, 'Ben299', '299', 'Ben299', 'Ben299@qq.com', NULL);
INSERT INTO `t_user` VALUES (306, 'Ben300', '300', 'Ben300', 'Ben300@qq.com', NULL);
INSERT INTO `t_user` VALUES (307, 'Ben301', '301', 'Ben301', 'Ben301@qq.com', NULL);
INSERT INTO `t_user` VALUES (308, 'Ben302', '302', 'Ben302', 'Ben302@qq.com', NULL);
INSERT INTO `t_user` VALUES (309, 'Ben303', '303', 'Ben303', 'Ben303@qq.com', NULL);
INSERT INTO `t_user` VALUES (310, 'Ben304', '304', 'Ben304', 'Ben304@qq.com', NULL);
INSERT INTO `t_user` VALUES (311, 'Ben305', '305', 'Ben305', 'Ben305@qq.com', NULL);
INSERT INTO `t_user` VALUES (312, 'Ben306', '306', 'Ben306', 'Ben306@qq.com', NULL);
INSERT INTO `t_user` VALUES (313, 'Ben307', '307', 'Ben307', 'Ben307@qq.com', NULL);
INSERT INTO `t_user` VALUES (314, 'Ben308', '308', 'Ben308', 'Ben308@qq.com', NULL);
INSERT INTO `t_user` VALUES (315, 'Ben309', '309', 'Ben309', 'Ben309@qq.com', NULL);
INSERT INTO `t_user` VALUES (316, 'Ben310', '310', 'Ben310', 'Ben310@qq.com', NULL);
INSERT INTO `t_user` VALUES (317, 'Ben311', '311', 'Ben311', 'Ben311@qq.com', NULL);
INSERT INTO `t_user` VALUES (318, 'Ben312', '312', 'Ben312', 'Ben312@qq.com', NULL);
INSERT INTO `t_user` VALUES (319, 'Ben313', '313', 'Ben313', 'Ben313@qq.com', NULL);
INSERT INTO `t_user` VALUES (320, 'Ben314', '314', 'Ben314', 'Ben314@qq.com', NULL);
INSERT INTO `t_user` VALUES (321, 'Ben315', '315', 'Ben315', 'Ben315@qq.com', NULL);
INSERT INTO `t_user` VALUES (322, 'Ben316', '316', 'Ben316', 'Ben316@qq.com', NULL);
INSERT INTO `t_user` VALUES (323, 'Ben317', '317', 'Ben317', 'Ben317@qq.com', NULL);
INSERT INTO `t_user` VALUES (324, 'Ben318', '318', 'Ben318', 'Ben318@qq.com', NULL);
INSERT INTO `t_user` VALUES (325, 'Ben319', '319', 'Ben319', 'Ben319@qq.com', NULL);
INSERT INTO `t_user` VALUES (326, 'Ben320', '320', 'Ben320', 'Ben320@qq.com', NULL);
INSERT INTO `t_user` VALUES (327, 'Ben321', '321', 'Ben321', 'Ben321@qq.com', NULL);
INSERT INTO `t_user` VALUES (328, 'Ben322', '322', 'Ben322', 'Ben322@qq.com', NULL);
INSERT INTO `t_user` VALUES (329, 'Ben323', '323', 'Ben323', 'Ben323@qq.com', NULL);
INSERT INTO `t_user` VALUES (330, 'Ben324', '324', 'Ben324', 'Ben324@qq.com', NULL);
INSERT INTO `t_user` VALUES (331, 'Ben325', '325', 'Ben325', 'Ben325@qq.com', NULL);
INSERT INTO `t_user` VALUES (332, 'Ben326', '326', 'Ben326', 'Ben326@qq.com', NULL);
INSERT INTO `t_user` VALUES (333, 'Ben327', '327', 'Ben327', 'Ben327@qq.com', NULL);
INSERT INTO `t_user` VALUES (334, 'Ben328', '328', 'Ben328', 'Ben328@qq.com', NULL);
INSERT INTO `t_user` VALUES (335, 'Ben329', '329', 'Ben329', 'Ben329@qq.com', NULL);
INSERT INTO `t_user` VALUES (336, 'Ben330', '330', 'Ben330', 'Ben330@qq.com', NULL);
INSERT INTO `t_user` VALUES (337, 'Ben331', '331', 'Ben331', 'Ben331@qq.com', NULL);
INSERT INTO `t_user` VALUES (338, 'Ben332', '332', 'Ben332', 'Ben332@qq.com', NULL);
INSERT INTO `t_user` VALUES (339, 'Ben333', '333', 'Ben333', 'Ben333@qq.com', NULL);
INSERT INTO `t_user` VALUES (340, 'Ben334', '334', 'Ben334', 'Ben334@qq.com', NULL);
INSERT INTO `t_user` VALUES (341, 'Ben335', '335', 'Ben335', 'Ben335@qq.com', NULL);
INSERT INTO `t_user` VALUES (342, 'Ben336', '336', 'Ben336', 'Ben336@qq.com', NULL);
INSERT INTO `t_user` VALUES (343, 'Ben337', '337', 'Ben337', 'Ben337@qq.com', NULL);
INSERT INTO `t_user` VALUES (344, 'Ben338', '338', 'Ben338', 'Ben338@qq.com', NULL);
INSERT INTO `t_user` VALUES (345, 'Ben339', '339', 'Ben339', 'Ben339@qq.com', NULL);
INSERT INTO `t_user` VALUES (346, 'Ben340', '340', 'Ben340', 'Ben340@qq.com', NULL);
INSERT INTO `t_user` VALUES (347, 'Ben341', '341', 'Ben341', 'Ben341@qq.com', NULL);
INSERT INTO `t_user` VALUES (348, 'Ben342', '342', 'Ben342', 'Ben342@qq.com', NULL);
INSERT INTO `t_user` VALUES (349, 'Ben343', '343', 'Ben343', 'Ben343@qq.com', NULL);
INSERT INTO `t_user` VALUES (350, 'Ben344', '344', 'Ben344', 'Ben344@qq.com', NULL);
INSERT INTO `t_user` VALUES (351, 'Ben345', '345', 'Ben345', 'Ben345@qq.com', NULL);
INSERT INTO `t_user` VALUES (352, 'Ben346', '346', 'Ben346', 'Ben346@qq.com', NULL);
INSERT INTO `t_user` VALUES (353, 'Ben347', '347', 'Ben347', 'Ben347@qq.com', NULL);
INSERT INTO `t_user` VALUES (354, 'Ben348', '348', 'Ben348', 'Ben348@qq.com', NULL);
INSERT INTO `t_user` VALUES (355, 'Ben349', '349', 'Ben349', 'Ben349@qq.com', NULL);
INSERT INTO `t_user` VALUES (356, 'Ben350', '350', 'Ben350', 'Ben350@qq.com', NULL);
INSERT INTO `t_user` VALUES (357, 'Ben351', '351', 'Ben351', 'Ben351@qq.com', NULL);
INSERT INTO `t_user` VALUES (358, 'Ben352', '352', 'Ben352', 'Ben352@qq.com', NULL);
INSERT INTO `t_user` VALUES (359, 'Ben353', '353', 'Ben353', 'Ben353@qq.com', NULL);
INSERT INTO `t_user` VALUES (360, 'Ben354', '354', 'Ben354', 'Ben354@qq.com', NULL);
INSERT INTO `t_user` VALUES (361, 'Ben355', '355', 'Ben355', 'Ben355@qq.com', NULL);
INSERT INTO `t_user` VALUES (362, 'Ben356', '356', 'Ben356', 'Ben356@qq.com', NULL);
INSERT INTO `t_user` VALUES (363, 'Ben357', '357', 'Ben357', 'Ben357@qq.com', NULL);
INSERT INTO `t_user` VALUES (364, 'Ben358', '358', 'Ben358', 'Ben358@qq.com', NULL);
INSERT INTO `t_user` VALUES (365, 'Ben359', '359', 'Ben359', 'Ben359@qq.com', NULL);
INSERT INTO `t_user` VALUES (366, 'Ben360', '360', 'Ben360', 'Ben360@qq.com', NULL);
INSERT INTO `t_user` VALUES (367, 'Ben361', '361', 'Ben361', 'Ben361@qq.com', NULL);
INSERT INTO `t_user` VALUES (368, 'Ben362', '362', 'Ben362', 'Ben362@qq.com', NULL);
INSERT INTO `t_user` VALUES (369, 'Ben363', '363', 'Ben363', 'Ben363@qq.com', NULL);
INSERT INTO `t_user` VALUES (370, 'Ben364', '364', 'Ben364', 'Ben364@qq.com', NULL);
INSERT INTO `t_user` VALUES (371, 'Ben365', '365', 'Ben365', 'Ben365@qq.com', NULL);
INSERT INTO `t_user` VALUES (372, 'Ben366', '366', 'Ben366', 'Ben366@qq.com', NULL);
INSERT INTO `t_user` VALUES (373, 'Ben367', '367', 'Ben367', 'Ben367@qq.com', NULL);
INSERT INTO `t_user` VALUES (374, 'Ben368', '368', 'Ben368', 'Ben368@qq.com', NULL);
INSERT INTO `t_user` VALUES (375, 'Ben369', '369', 'Ben369', 'Ben369@qq.com', NULL);
INSERT INTO `t_user` VALUES (376, 'Ben370', '370', 'Ben370', 'Ben370@qq.com', NULL);
INSERT INTO `t_user` VALUES (377, 'Ben371', '371', 'Ben371', 'Ben371@qq.com', NULL);
INSERT INTO `t_user` VALUES (378, 'Ben372', '372', 'Ben372', 'Ben372@qq.com', NULL);
INSERT INTO `t_user` VALUES (379, 'Ben373', '373', 'Ben373', 'Ben373@qq.com', NULL);
INSERT INTO `t_user` VALUES (380, 'Ben374', '374', 'Ben374', 'Ben374@qq.com', NULL);
INSERT INTO `t_user` VALUES (381, 'Ben375', '375', 'Ben375', 'Ben375@qq.com', NULL);
INSERT INTO `t_user` VALUES (382, 'Ben376', '376', 'Ben376', 'Ben376@qq.com', NULL);
INSERT INTO `t_user` VALUES (383, 'Ben377', '377', 'Ben377', 'Ben377@qq.com', NULL);
INSERT INTO `t_user` VALUES (384, 'Ben378', '378', 'Ben378', 'Ben378@qq.com', NULL);
INSERT INTO `t_user` VALUES (385, 'Ben379', '379', 'Ben379', 'Ben379@qq.com', NULL);
INSERT INTO `t_user` VALUES (386, 'Ben380', '380', 'Ben380', 'Ben380@qq.com', NULL);
INSERT INTO `t_user` VALUES (387, 'Ben381', '381', 'Ben381', 'Ben381@qq.com', NULL);
INSERT INTO `t_user` VALUES (388, 'Ben382', '382', 'Ben382', 'Ben382@qq.com', NULL);
INSERT INTO `t_user` VALUES (389, 'Ben383', '383', 'Ben383', 'Ben383@qq.com', NULL);
INSERT INTO `t_user` VALUES (390, 'Ben384', '384', 'Ben384', 'Ben384@qq.com', NULL);
INSERT INTO `t_user` VALUES (391, 'Ben385', '385', 'Ben385', 'Ben385@qq.com', NULL);
INSERT INTO `t_user` VALUES (392, 'Ben386', '386', 'Ben386', 'Ben386@qq.com', NULL);
INSERT INTO `t_user` VALUES (393, 'Ben387', '387', 'Ben387', 'Ben387@qq.com', NULL);
INSERT INTO `t_user` VALUES (394, 'Ben388', '388', 'Ben388', 'Ben388@qq.com', NULL);
INSERT INTO `t_user` VALUES (395, 'Ben389', '389', 'Ben389', 'Ben389@qq.com', NULL);
INSERT INTO `t_user` VALUES (396, 'Ben390', '390', 'Ben390', 'Ben390@qq.com', NULL);
INSERT INTO `t_user` VALUES (397, 'Ben391', '391', 'Ben391', 'Ben391@qq.com', NULL);
INSERT INTO `t_user` VALUES (398, 'Ben392', '392', 'Ben392', 'Ben392@qq.com', NULL);
INSERT INTO `t_user` VALUES (399, 'Ben393', '393', 'Ben393', 'Ben393@qq.com', NULL);
INSERT INTO `t_user` VALUES (400, 'Ben394', '394', 'Ben394', 'Ben394@qq.com', NULL);
INSERT INTO `t_user` VALUES (401, 'Ben395', '395', 'Ben395', 'Ben395@qq.com', NULL);
INSERT INTO `t_user` VALUES (402, 'Ben396', '396', 'Ben396', 'Ben396@qq.com', NULL);
INSERT INTO `t_user` VALUES (403, 'Ben397', '397', 'Ben397', 'Ben397@qq.com', NULL);
INSERT INTO `t_user` VALUES (404, 'Ben398', '398', 'Ben398', 'Ben398@qq.com', NULL);
INSERT INTO `t_user` VALUES (405, 'Ben399', '399', 'Ben399', 'Ben399@qq.com', NULL);
INSERT INTO `t_user` VALUES (406, 'Ben400', '400', 'Ben400', 'Ben400@qq.com', NULL);
INSERT INTO `t_user` VALUES (407, 'Ben401', '401', 'Ben401', 'Ben401@qq.com', NULL);
INSERT INTO `t_user` VALUES (408, 'Ben402', '402', 'Ben402', 'Ben402@qq.com', NULL);
INSERT INTO `t_user` VALUES (409, 'Ben403', '403', 'Ben403', 'Ben403@qq.com', NULL);
INSERT INTO `t_user` VALUES (410, 'Ben404', '404', 'Ben404', 'Ben404@qq.com', NULL);
INSERT INTO `t_user` VALUES (411, 'Ben405', '405', 'Ben405', 'Ben405@qq.com', NULL);
INSERT INTO `t_user` VALUES (412, 'Ben406', '406', 'Ben406', 'Ben406@qq.com', NULL);
INSERT INTO `t_user` VALUES (413, 'Ben407', '407', 'Ben407', 'Ben407@qq.com', NULL);
INSERT INTO `t_user` VALUES (414, 'Ben408', '408', 'Ben408', 'Ben408@qq.com', NULL);
INSERT INTO `t_user` VALUES (415, 'Ben409', '409', 'Ben409', 'Ben409@qq.com', NULL);
INSERT INTO `t_user` VALUES (416, 'Ben410', '410', 'Ben410', 'Ben410@qq.com', NULL);
INSERT INTO `t_user` VALUES (417, 'Ben411', '411', 'Ben411', 'Ben411@qq.com', NULL);
INSERT INTO `t_user` VALUES (418, 'Ben412', '412', 'Ben412', 'Ben412@qq.com', NULL);
INSERT INTO `t_user` VALUES (419, 'Ben413', '413', 'Ben413', 'Ben413@qq.com', NULL);
INSERT INTO `t_user` VALUES (420, 'Ben414', '414', 'Ben414', 'Ben414@qq.com', NULL);
INSERT INTO `t_user` VALUES (421, 'Ben415', '415', 'Ben415', 'Ben415@qq.com', NULL);
INSERT INTO `t_user` VALUES (422, 'Ben416', '416', 'Ben416', 'Ben416@qq.com', NULL);
INSERT INTO `t_user` VALUES (423, 'Ben417', '417', 'Ben417', 'Ben417@qq.com', NULL);
INSERT INTO `t_user` VALUES (424, 'Ben418', '418', 'Ben418', 'Ben418@qq.com', NULL);
INSERT INTO `t_user` VALUES (425, 'Ben419', '419', 'Ben419', 'Ben419@qq.com', NULL);
INSERT INTO `t_user` VALUES (426, 'Ben420', '420', 'Ben420', 'Ben420@qq.com', NULL);
INSERT INTO `t_user` VALUES (427, 'Ben421', '421', 'Ben421', 'Ben421@qq.com', NULL);
INSERT INTO `t_user` VALUES (428, 'Ben422', '422', 'Ben422', 'Ben422@qq.com', NULL);
INSERT INTO `t_user` VALUES (429, 'Ben423', '423', 'Ben423', 'Ben423@qq.com', NULL);
INSERT INTO `t_user` VALUES (430, 'Ben424', '424', 'Ben424', 'Ben424@qq.com', NULL);
INSERT INTO `t_user` VALUES (431, 'Ben425', '425', 'Ben425', 'Ben425@qq.com', NULL);
INSERT INTO `t_user` VALUES (432, 'Ben426', '426', 'Ben426', 'Ben426@qq.com', NULL);
INSERT INTO `t_user` VALUES (433, 'Ben427', '427', 'Ben427', 'Ben427@qq.com', NULL);
INSERT INTO `t_user` VALUES (434, 'Ben428', '428', 'Ben428', 'Ben428@qq.com', NULL);
INSERT INTO `t_user` VALUES (435, 'Ben429', '429', 'Ben429', 'Ben429@qq.com', NULL);
INSERT INTO `t_user` VALUES (436, 'Ben430', '430', 'Ben430', 'Ben430@qq.com', NULL);
INSERT INTO `t_user` VALUES (437, 'Ben431', '431', 'Ben431', 'Ben431@qq.com', NULL);
INSERT INTO `t_user` VALUES (438, 'Ben432', '432', 'Ben432', 'Ben432@qq.com', NULL);
INSERT INTO `t_user` VALUES (439, 'Ben433', '433', 'Ben433', 'Ben433@qq.com', NULL);
INSERT INTO `t_user` VALUES (440, 'Ben434', '434', 'Ben434', 'Ben434@qq.com', NULL);
INSERT INTO `t_user` VALUES (441, 'Ben435', '435', 'Ben435', 'Ben435@qq.com', NULL);
INSERT INTO `t_user` VALUES (442, 'Ben436', '436', 'Ben436', 'Ben436@qq.com', NULL);
INSERT INTO `t_user` VALUES (443, 'Ben437', '437', 'Ben437', 'Ben437@qq.com', NULL);
INSERT INTO `t_user` VALUES (444, 'Ben438', '438', 'Ben438', 'Ben438@qq.com', NULL);
INSERT INTO `t_user` VALUES (445, 'Ben439', '439', 'Ben439', 'Ben439@qq.com', NULL);
INSERT INTO `t_user` VALUES (446, 'Ben440', '440', 'Ben440', 'Ben440@qq.com', NULL);
INSERT INTO `t_user` VALUES (447, 'Ben441', '441', 'Ben441', 'Ben441@qq.com', NULL);
INSERT INTO `t_user` VALUES (448, 'Ben442', '442', 'Ben442', 'Ben442@qq.com', NULL);
INSERT INTO `t_user` VALUES (449, 'Ben443', '443', 'Ben443', 'Ben443@qq.com', NULL);
INSERT INTO `t_user` VALUES (450, 'Ben444', '444', 'Ben444', 'Ben444@qq.com', NULL);
INSERT INTO `t_user` VALUES (451, 'Ben445', '445', 'Ben445', 'Ben445@qq.com', NULL);
INSERT INTO `t_user` VALUES (452, 'Ben446', '446', 'Ben446', 'Ben446@qq.com', NULL);
INSERT INTO `t_user` VALUES (453, 'Ben447', '447', 'Ben447', 'Ben447@qq.com', NULL);
INSERT INTO `t_user` VALUES (454, 'Ben448', '448', 'Ben448', 'Ben448@qq.com', NULL);
INSERT INTO `t_user` VALUES (455, 'Ben449', '449', 'Ben449', 'Ben449@qq.com', NULL);
INSERT INTO `t_user` VALUES (456, 'Ben450', '450', 'Ben450', 'Ben450@qq.com', NULL);
INSERT INTO `t_user` VALUES (457, 'Ben451', '451', 'Ben451', 'Ben451@qq.com', NULL);
INSERT INTO `t_user` VALUES (458, 'Ben452', '452', 'Ben452', 'Ben452@qq.com', NULL);
INSERT INTO `t_user` VALUES (459, 'Ben453', '453', 'Ben453', 'Ben453@qq.com', NULL);
INSERT INTO `t_user` VALUES (460, 'Ben454', '454', 'Ben454', 'Ben454@qq.com', NULL);
INSERT INTO `t_user` VALUES (461, 'Ben455', '455', 'Ben455', 'Ben455@qq.com', NULL);
INSERT INTO `t_user` VALUES (462, 'Ben456', '456', 'Ben456', 'Ben456@qq.com', NULL);
INSERT INTO `t_user` VALUES (463, 'Ben457', '457', 'Ben457', 'Ben457@qq.com', NULL);
INSERT INTO `t_user` VALUES (464, 'Ben458', '458', 'Ben458', 'Ben458@qq.com', NULL);
INSERT INTO `t_user` VALUES (465, 'Ben459', '459', 'Ben459', 'Ben459@qq.com', NULL);
INSERT INTO `t_user` VALUES (466, 'Ben460', '460', 'Ben460', 'Ben460@qq.com', NULL);
INSERT INTO `t_user` VALUES (467, 'Ben461', '461', 'Ben461', 'Ben461@qq.com', NULL);
INSERT INTO `t_user` VALUES (468, 'Ben462', '462', 'Ben462', 'Ben462@qq.com', NULL);
INSERT INTO `t_user` VALUES (469, 'Ben463', '463', 'Ben463', 'Ben463@qq.com', NULL);
INSERT INTO `t_user` VALUES (470, 'Ben464', '464', 'Ben464', 'Ben464@qq.com', NULL);
INSERT INTO `t_user` VALUES (471, 'Ben465', '465', 'Ben465', 'Ben465@qq.com', NULL);
INSERT INTO `t_user` VALUES (472, 'Ben466', '466', 'Ben466', 'Ben466@qq.com', NULL);
INSERT INTO `t_user` VALUES (473, 'Ben467', '467', 'Ben467', 'Ben467@qq.com', NULL);
INSERT INTO `t_user` VALUES (474, 'Ben468', '468', 'Ben468', 'Ben468@qq.com', NULL);
INSERT INTO `t_user` VALUES (475, 'Ben469', '469', 'Ben469', 'Ben469@qq.com', NULL);
INSERT INTO `t_user` VALUES (476, 'Ben470', '470', 'Ben470', 'Ben470@qq.com', NULL);
INSERT INTO `t_user` VALUES (477, 'Ben471', '471', 'Ben471', 'Ben471@qq.com', NULL);
INSERT INTO `t_user` VALUES (478, 'Ben472', '472', 'Ben472', 'Ben472@qq.com', NULL);
INSERT INTO `t_user` VALUES (479, 'Ben473', '473', 'Ben473', 'Ben473@qq.com', NULL);
INSERT INTO `t_user` VALUES (480, 'Ben474', '474', 'Ben474', 'Ben474@qq.com', NULL);
INSERT INTO `t_user` VALUES (481, 'Ben475', '475', 'Ben475', 'Ben475@qq.com', NULL);
INSERT INTO `t_user` VALUES (482, 'Ben476', '476', 'Ben476', 'Ben476@qq.com', NULL);
INSERT INTO `t_user` VALUES (483, 'Ben477', '477', 'Ben477', 'Ben477@qq.com', NULL);
INSERT INTO `t_user` VALUES (484, 'Ben478', '478', 'Ben478', 'Ben478@qq.com', NULL);
INSERT INTO `t_user` VALUES (485, 'Ben479', '479', 'Ben479', 'Ben479@qq.com', NULL);
INSERT INTO `t_user` VALUES (486, 'Ben480', '480', 'Ben480', 'Ben480@qq.com', NULL);
INSERT INTO `t_user` VALUES (487, 'Ben481', '481', 'Ben481', 'Ben481@qq.com', NULL);
INSERT INTO `t_user` VALUES (488, 'Ben482', '482', 'Ben482', 'Ben482@qq.com', NULL);
INSERT INTO `t_user` VALUES (489, 'Ben483', '483', 'Ben483', 'Ben483@qq.com', NULL);
INSERT INTO `t_user` VALUES (490, 'Ben484', '484', 'Ben484', 'Ben484@qq.com', NULL);
INSERT INTO `t_user` VALUES (491, 'Ben485', '485', 'Ben485', 'Ben485@qq.com', NULL);
INSERT INTO `t_user` VALUES (492, 'Ben486', '486', 'Ben486', 'Ben486@qq.com', NULL);
INSERT INTO `t_user` VALUES (493, 'Ben487', '487', 'Ben487', 'Ben487@qq.com', NULL);
INSERT INTO `t_user` VALUES (494, 'Ben488', '488', 'Ben488', 'Ben488@qq.com', NULL);
INSERT INTO `t_user` VALUES (495, 'Ben489', '489', 'Ben489', 'Ben489@qq.com', NULL);
INSERT INTO `t_user` VALUES (496, 'Ben490', '490', 'Ben490', 'Ben490@qq.com', NULL);
INSERT INTO `t_user` VALUES (497, 'Ben491', '491', 'Ben491', 'Ben491@qq.com', NULL);
INSERT INTO `t_user` VALUES (498, 'Ben492', '492', 'Ben492', 'Ben492@qq.com', NULL);
INSERT INTO `t_user` VALUES (499, 'Ben493', '493', 'Ben493', 'Ben493@qq.com', NULL);
INSERT INTO `t_user` VALUES (500, 'Ben494', '494', 'Ben494', 'Ben494@qq.com', NULL);
INSERT INTO `t_user` VALUES (501, 'Ben495', '495', 'Ben495', 'Ben495@qq.com', NULL);
INSERT INTO `t_user` VALUES (502, 'Ben496', '496', 'Ben496', 'Ben496@qq.com', NULL);
INSERT INTO `t_user` VALUES (503, 'Ben497', '497', 'Ben497', 'Ben497@qq.com', NULL);
INSERT INTO `t_user` VALUES (504, 'Ben498', '498', 'Ben498', 'Ben498@qq.com', NULL);
INSERT INTO `t_user` VALUES (505, 'Ben499', '499', 'Ben499', 'Ben499@qq.com', NULL);
INSERT INTO `t_user` VALUES (506, 'Ben500', '500', 'Ben500', 'Ben500@qq.com', NULL);
INSERT INTO `t_user` VALUES (507, 'Ben501', '501', 'Ben501', 'Ben501@qq.com', NULL);
INSERT INTO `t_user` VALUES (508, 'Ben502', '502', 'Ben502', 'Ben502@qq.com', NULL);
INSERT INTO `t_user` VALUES (509, 'Ben503', '503', 'Ben503', 'Ben503@qq.com', NULL);
INSERT INTO `t_user` VALUES (510, 'Ben504', '504', 'Ben504', 'Ben504@qq.com', NULL);
INSERT INTO `t_user` VALUES (511, 'Ben505', '505', 'Ben505', 'Ben505@qq.com', NULL);
INSERT INTO `t_user` VALUES (512, 'Ben506', '506', 'Ben506', 'Ben506@qq.com', NULL);
INSERT INTO `t_user` VALUES (513, 'Ben507', '507', 'Ben507', 'Ben507@qq.com', NULL);
INSERT INTO `t_user` VALUES (514, 'Ben508', '508', 'Ben508', 'Ben508@qq.com', NULL);
INSERT INTO `t_user` VALUES (515, 'Ben509', '509', 'Ben509', 'Ben509@qq.com', NULL);
INSERT INTO `t_user` VALUES (516, 'Ben510', '510', 'Ben510', 'Ben510@qq.com', NULL);
INSERT INTO `t_user` VALUES (517, 'Ben511', '511', 'Ben511', 'Ben511@qq.com', NULL);
INSERT INTO `t_user` VALUES (518, 'Ben512', '512', 'Ben512', 'Ben512@qq.com', NULL);
INSERT INTO `t_user` VALUES (519, 'Ben513', '513', 'Ben513', 'Ben513@qq.com', NULL);
INSERT INTO `t_user` VALUES (520, 'Ben514', '514', 'Ben514', 'Ben514@qq.com', NULL);
INSERT INTO `t_user` VALUES (521, 'Ben515', '515', 'Ben515', 'Ben515@qq.com', NULL);
INSERT INTO `t_user` VALUES (522, 'Ben516', '516', 'Ben516', 'Ben516@qq.com', NULL);
INSERT INTO `t_user` VALUES (523, 'Ben517', '517', 'Ben517', 'Ben517@qq.com', NULL);
INSERT INTO `t_user` VALUES (524, 'Ben518', '518', 'Ben518', 'Ben518@qq.com', NULL);
INSERT INTO `t_user` VALUES (525, 'Ben519', '519', 'Ben519', 'Ben519@qq.com', NULL);
INSERT INTO `t_user` VALUES (526, 'Ben520', '520', 'Ben520', 'Ben520@qq.com', NULL);
INSERT INTO `t_user` VALUES (527, 'Ben521', '521', 'Ben521', 'Ben521@qq.com', NULL);
INSERT INTO `t_user` VALUES (528, 'Ben522', '522', 'Ben522', 'Ben522@qq.com', NULL);
INSERT INTO `t_user` VALUES (529, 'Ben523', '523', 'Ben523', 'Ben523@qq.com', NULL);
INSERT INTO `t_user` VALUES (530, 'Ben524', '524', 'Ben524', 'Ben524@qq.com', NULL);
INSERT INTO `t_user` VALUES (531, 'Ben525', '525', 'Ben525', 'Ben525@qq.com', NULL);
INSERT INTO `t_user` VALUES (532, 'Ben526', '526', 'Ben526', 'Ben526@qq.com', NULL);
INSERT INTO `t_user` VALUES (533, 'Ben527', '527', 'Ben527', 'Ben527@qq.com', NULL);
INSERT INTO `t_user` VALUES (534, 'Ben528', '528', 'Ben528', 'Ben528@qq.com', NULL);
INSERT INTO `t_user` VALUES (535, 'Ben529', '529', 'Ben529', 'Ben529@qq.com', NULL);
INSERT INTO `t_user` VALUES (536, 'Ben530', '530', 'Ben530', 'Ben530@qq.com', NULL);
INSERT INTO `t_user` VALUES (537, 'Ben531', '531', 'Ben531', 'Ben531@qq.com', NULL);
INSERT INTO `t_user` VALUES (538, 'Ben532', '532', 'Ben532', 'Ben532@qq.com', NULL);
INSERT INTO `t_user` VALUES (539, 'Ben533', '533', 'Ben533', 'Ben533@qq.com', NULL);
INSERT INTO `t_user` VALUES (540, 'Ben534', '534', 'Ben534', 'Ben534@qq.com', NULL);
INSERT INTO `t_user` VALUES (541, 'Ben535', '535', 'Ben535', 'Ben535@qq.com', NULL);
INSERT INTO `t_user` VALUES (542, 'Ben536', '536', 'Ben536', 'Ben536@qq.com', NULL);
INSERT INTO `t_user` VALUES (543, 'Ben537', '537', 'Ben537', 'Ben537@qq.com', NULL);
INSERT INTO `t_user` VALUES (544, 'Ben538', '538', 'Ben538', 'Ben538@qq.com', NULL);
INSERT INTO `t_user` VALUES (545, 'Ben539', '539', 'Ben539', 'Ben539@qq.com', NULL);
INSERT INTO `t_user` VALUES (546, 'Ben540', '540', 'Ben540', 'Ben540@qq.com', NULL);
INSERT INTO `t_user` VALUES (547, 'Ben541', '541', 'Ben541', 'Ben541@qq.com', NULL);
INSERT INTO `t_user` VALUES (548, 'Ben542', '542', 'Ben542', 'Ben542@qq.com', NULL);
INSERT INTO `t_user` VALUES (549, 'Ben543', '543', 'Ben543', 'Ben543@qq.com', NULL);
INSERT INTO `t_user` VALUES (550, 'Ben544', '544', 'Ben544', 'Ben544@qq.com', NULL);
INSERT INTO `t_user` VALUES (551, 'Ben545', '545', 'Ben545', 'Ben545@qq.com', NULL);
INSERT INTO `t_user` VALUES (552, 'Ben546', '546', 'Ben546', 'Ben546@qq.com', NULL);
INSERT INTO `t_user` VALUES (553, 'Ben547', '547', 'Ben547', 'Ben547@qq.com', NULL);
INSERT INTO `t_user` VALUES (554, 'Ben548', '548', 'Ben548', 'Ben548@qq.com', NULL);
INSERT INTO `t_user` VALUES (555, 'Ben549', '549', 'Ben549', 'Ben549@qq.com', NULL);
INSERT INTO `t_user` VALUES (556, 'Ben550', '550', 'Ben550', 'Ben550@qq.com', NULL);
INSERT INTO `t_user` VALUES (557, 'Ben551', '551', 'Ben551', 'Ben551@qq.com', NULL);
INSERT INTO `t_user` VALUES (558, 'Ben552', '552', 'Ben552', 'Ben552@qq.com', NULL);
INSERT INTO `t_user` VALUES (559, 'Ben553', '553', 'Ben553', 'Ben553@qq.com', NULL);
INSERT INTO `t_user` VALUES (560, 'Ben554', '554', 'Ben554', 'Ben554@qq.com', NULL);
INSERT INTO `t_user` VALUES (561, 'Ben555', '555', 'Ben555', 'Ben555@qq.com', NULL);
INSERT INTO `t_user` VALUES (562, 'Ben556', '556', 'Ben556', 'Ben556@qq.com', NULL);
INSERT INTO `t_user` VALUES (563, 'Ben557', '557', 'Ben557', 'Ben557@qq.com', NULL);
INSERT INTO `t_user` VALUES (564, 'Ben558', '558', 'Ben558', 'Ben558@qq.com', NULL);
INSERT INTO `t_user` VALUES (565, 'Ben559', '559', 'Ben559', 'Ben559@qq.com', NULL);
INSERT INTO `t_user` VALUES (566, 'Ben560', '560', 'Ben560', 'Ben560@qq.com', NULL);
INSERT INTO `t_user` VALUES (567, 'Ben561', '561', 'Ben561', 'Ben561@qq.com', NULL);
INSERT INTO `t_user` VALUES (568, 'Ben562', '562', 'Ben562', 'Ben562@qq.com', NULL);
INSERT INTO `t_user` VALUES (569, 'Ben563', '563', 'Ben563', 'Ben563@qq.com', NULL);
INSERT INTO `t_user` VALUES (570, 'Ben564', '564', 'Ben564', 'Ben564@qq.com', NULL);
INSERT INTO `t_user` VALUES (571, 'Ben565', '565', 'Ben565', 'Ben565@qq.com', NULL);
INSERT INTO `t_user` VALUES (572, 'Ben566', '566', 'Ben566', 'Ben566@qq.com', NULL);
INSERT INTO `t_user` VALUES (573, 'Ben567', '567', 'Ben567', 'Ben567@qq.com', NULL);
INSERT INTO `t_user` VALUES (574, 'Ben568', '568', 'Ben568', 'Ben568@qq.com', NULL);
INSERT INTO `t_user` VALUES (575, 'Ben569', '569', 'Ben569', 'Ben569@qq.com', NULL);
INSERT INTO `t_user` VALUES (576, 'Ben570', '570', 'Ben570', 'Ben570@qq.com', NULL);
INSERT INTO `t_user` VALUES (577, 'Ben571', '571', 'Ben571', 'Ben571@qq.com', NULL);
INSERT INTO `t_user` VALUES (578, 'Ben572', '572', 'Ben572', 'Ben572@qq.com', NULL);
INSERT INTO `t_user` VALUES (579, 'Ben573', '573', 'Ben573', 'Ben573@qq.com', NULL);
INSERT INTO `t_user` VALUES (580, 'Ben574', '574', 'Ben574', 'Ben574@qq.com', NULL);
INSERT INTO `t_user` VALUES (581, 'Ben575', '575', 'Ben575', 'Ben575@qq.com', NULL);
INSERT INTO `t_user` VALUES (582, 'Ben576', '576', 'Ben576', 'Ben576@qq.com', NULL);
INSERT INTO `t_user` VALUES (583, 'Ben577', '577', 'Ben577', 'Ben577@qq.com', NULL);
INSERT INTO `t_user` VALUES (584, 'Ben578', '578', 'Ben578', 'Ben578@qq.com', NULL);
INSERT INTO `t_user` VALUES (585, 'Ben579', '579', 'Ben579', 'Ben579@qq.com', NULL);
INSERT INTO `t_user` VALUES (586, 'Ben580', '580', 'Ben580', 'Ben580@qq.com', NULL);
INSERT INTO `t_user` VALUES (587, 'Ben581', '581', 'Ben581', 'Ben581@qq.com', NULL);
INSERT INTO `t_user` VALUES (588, 'Ben582', '582', 'Ben582', 'Ben582@qq.com', NULL);
INSERT INTO `t_user` VALUES (589, 'Ben583', '583', 'Ben583', 'Ben583@qq.com', NULL);
INSERT INTO `t_user` VALUES (590, 'Ben584', '584', 'Ben584', 'Ben584@qq.com', NULL);
INSERT INTO `t_user` VALUES (591, 'Ben585', '585', 'Ben585', 'Ben585@qq.com', NULL);
INSERT INTO `t_user` VALUES (592, 'Ben586', '586', 'Ben586', 'Ben586@qq.com', NULL);
INSERT INTO `t_user` VALUES (593, 'Ben587', '587', 'Ben587', 'Ben587@qq.com', NULL);
INSERT INTO `t_user` VALUES (594, 'Ben588', '588', 'Ben588', 'Ben588@qq.com', NULL);
INSERT INTO `t_user` VALUES (595, 'Ben589', '589', 'Ben589', 'Ben589@qq.com', NULL);
INSERT INTO `t_user` VALUES (596, 'Ben590', '590', 'Ben590', 'Ben590@qq.com', NULL);
INSERT INTO `t_user` VALUES (597, 'Ben591', '591', 'Ben591', 'Ben591@qq.com', NULL);
INSERT INTO `t_user` VALUES (598, 'Ben592', '592', 'Ben592', 'Ben592@qq.com', NULL);
INSERT INTO `t_user` VALUES (599, 'Ben593', '593', 'Ben593', 'Ben593@qq.com', NULL);
INSERT INTO `t_user` VALUES (600, 'Ben594', '594', 'Ben594', 'Ben594@qq.com', NULL);
INSERT INTO `t_user` VALUES (601, 'Ben595', '595', 'Ben595', 'Ben595@qq.com', NULL);
INSERT INTO `t_user` VALUES (602, 'Ben596', '596', 'Ben596', 'Ben596@qq.com', NULL);
INSERT INTO `t_user` VALUES (603, 'Ben597', '597', 'Ben597', 'Ben597@qq.com', NULL);
INSERT INTO `t_user` VALUES (604, 'Ben598', '598', 'Ben598', 'Ben598@qq.com', NULL);
INSERT INTO `t_user` VALUES (605, 'Ben599', '599', 'Ben599', 'Ben599@qq.com', NULL);
INSERT INTO `t_user` VALUES (606, 'Ben600', '600', 'Ben600', 'Ben600@qq.com', NULL);
INSERT INTO `t_user` VALUES (607, 'Ben601', '601', 'Ben601', 'Ben601@qq.com', NULL);
INSERT INTO `t_user` VALUES (608, 'Ben602', '602', 'Ben602', 'Ben602@qq.com', NULL);
INSERT INTO `t_user` VALUES (609, 'Ben603', '603', 'Ben603', 'Ben603@qq.com', NULL);
INSERT INTO `t_user` VALUES (610, 'Ben604', '604', 'Ben604', 'Ben604@qq.com', NULL);
INSERT INTO `t_user` VALUES (611, 'Ben605', '605', 'Ben605', 'Ben605@qq.com', NULL);
INSERT INTO `t_user` VALUES (612, 'Ben606', '606', 'Ben606', 'Ben606@qq.com', NULL);
INSERT INTO `t_user` VALUES (613, 'Ben607', '607', 'Ben607', 'Ben607@qq.com', NULL);
INSERT INTO `t_user` VALUES (614, 'Ben608', '608', 'Ben608', 'Ben608@qq.com', NULL);
INSERT INTO `t_user` VALUES (615, 'Ben609', '609', 'Ben609', 'Ben609@qq.com', NULL);
INSERT INTO `t_user` VALUES (616, 'Ben610', '610', 'Ben610', 'Ben610@qq.com', NULL);
INSERT INTO `t_user` VALUES (617, 'Ben611', '611', 'Ben611', 'Ben611@qq.com', NULL);
INSERT INTO `t_user` VALUES (618, 'Ben612', '612', 'Ben612', 'Ben612@qq.com', NULL);
INSERT INTO `t_user` VALUES (619, 'Ben613', '613', 'Ben613', 'Ben613@qq.com', NULL);
INSERT INTO `t_user` VALUES (620, 'Ben614', '614', 'Ben614', 'Ben614@qq.com', NULL);
INSERT INTO `t_user` VALUES (621, 'Ben615', '615', 'Ben615', 'Ben615@qq.com', NULL);
INSERT INTO `t_user` VALUES (622, 'Ben616', '616', 'Ben616', 'Ben616@qq.com', NULL);
INSERT INTO `t_user` VALUES (623, 'Ben617', '617', 'Ben617', 'Ben617@qq.com', NULL);
INSERT INTO `t_user` VALUES (624, 'Ben618', '618', 'Ben618', 'Ben618@qq.com', NULL);
INSERT INTO `t_user` VALUES (625, 'Ben619', '619', 'Ben619', 'Ben619@qq.com', NULL);
INSERT INTO `t_user` VALUES (626, 'Ben620', '620', 'Ben620', 'Ben620@qq.com', NULL);
INSERT INTO `t_user` VALUES (627, 'Ben621', '621', 'Ben621', 'Ben621@qq.com', NULL);
INSERT INTO `t_user` VALUES (628, 'Ben622', '622', 'Ben622', 'Ben622@qq.com', NULL);
INSERT INTO `t_user` VALUES (629, 'Ben623', '623', 'Ben623', 'Ben623@qq.com', NULL);
INSERT INTO `t_user` VALUES (630, 'Ben624', '624', 'Ben624', 'Ben624@qq.com', NULL);
INSERT INTO `t_user` VALUES (631, 'Ben625', '625', 'Ben625', 'Ben625@qq.com', NULL);
INSERT INTO `t_user` VALUES (632, 'Ben626', '626', 'Ben626', 'Ben626@qq.com', NULL);
INSERT INTO `t_user` VALUES (633, 'Ben627', '627', 'Ben627', 'Ben627@qq.com', NULL);
INSERT INTO `t_user` VALUES (634, 'Ben628', '628', 'Ben628', 'Ben628@qq.com', NULL);
INSERT INTO `t_user` VALUES (635, 'Ben629', '629', 'Ben629', 'Ben629@qq.com', NULL);
INSERT INTO `t_user` VALUES (636, 'Ben630', '630', 'Ben630', 'Ben630@qq.com', NULL);
INSERT INTO `t_user` VALUES (637, 'Ben631', '631', 'Ben631', 'Ben631@qq.com', NULL);
INSERT INTO `t_user` VALUES (638, 'Ben632', '632', 'Ben632', 'Ben632@qq.com', NULL);
INSERT INTO `t_user` VALUES (639, 'Ben633', '633', 'Ben633', 'Ben633@qq.com', NULL);
INSERT INTO `t_user` VALUES (640, 'Ben634', '634', 'Ben634', 'Ben634@qq.com', NULL);
INSERT INTO `t_user` VALUES (641, 'Ben635', '635', 'Ben635', 'Ben635@qq.com', NULL);
INSERT INTO `t_user` VALUES (642, 'Ben636', '636', 'Ben636', 'Ben636@qq.com', NULL);
INSERT INTO `t_user` VALUES (643, 'Ben637', '637', 'Ben637', 'Ben637@qq.com', NULL);
INSERT INTO `t_user` VALUES (644, 'Ben638', '638', 'Ben638', 'Ben638@qq.com', NULL);
INSERT INTO `t_user` VALUES (645, 'Ben639', '639', 'Ben639', 'Ben639@qq.com', NULL);
INSERT INTO `t_user` VALUES (646, 'Ben640', '640', 'Ben640', 'Ben640@qq.com', NULL);
INSERT INTO `t_user` VALUES (647, 'Ben641', '641', 'Ben641', 'Ben641@qq.com', NULL);
INSERT INTO `t_user` VALUES (648, 'Ben642', '642', 'Ben642', 'Ben642@qq.com', NULL);
INSERT INTO `t_user` VALUES (649, 'Ben643', '643', 'Ben643', 'Ben643@qq.com', NULL);
INSERT INTO `t_user` VALUES (650, 'Ben644', '644', 'Ben644', 'Ben644@qq.com', NULL);
INSERT INTO `t_user` VALUES (651, 'Ben645', '645', 'Ben645', 'Ben645@qq.com', NULL);
INSERT INTO `t_user` VALUES (652, 'Ben646', '646', 'Ben646', 'Ben646@qq.com', NULL);
INSERT INTO `t_user` VALUES (653, 'Ben647', '647', 'Ben647', 'Ben647@qq.com', NULL);
INSERT INTO `t_user` VALUES (654, 'Ben648', '648', 'Ben648', 'Ben648@qq.com', NULL);
INSERT INTO `t_user` VALUES (655, 'Ben649', '649', 'Ben649', 'Ben649@qq.com', NULL);
INSERT INTO `t_user` VALUES (656, 'Ben650', '650', 'Ben650', 'Ben650@qq.com', NULL);
INSERT INTO `t_user` VALUES (657, 'Ben651', '651', 'Ben651', 'Ben651@qq.com', NULL);
INSERT INTO `t_user` VALUES (658, 'Ben652', '652', 'Ben652', 'Ben652@qq.com', NULL);
INSERT INTO `t_user` VALUES (659, 'Ben653', '653', 'Ben653', 'Ben653@qq.com', NULL);
INSERT INTO `t_user` VALUES (660, 'Ben654', '654', 'Ben654', 'Ben654@qq.com', NULL);
INSERT INTO `t_user` VALUES (661, 'Ben655', '655', 'Ben655', 'Ben655@qq.com', NULL);
INSERT INTO `t_user` VALUES (662, 'Ben656', '656', 'Ben656', 'Ben656@qq.com', NULL);
INSERT INTO `t_user` VALUES (663, 'Ben657', '657', 'Ben657', 'Ben657@qq.com', NULL);
INSERT INTO `t_user` VALUES (664, 'Ben658', '658', 'Ben658', 'Ben658@qq.com', NULL);
INSERT INTO `t_user` VALUES (665, 'Ben659', '659', 'Ben659', 'Ben659@qq.com', NULL);
INSERT INTO `t_user` VALUES (666, 'Ben660', '660', 'Ben660', 'Ben660@qq.com', NULL);
INSERT INTO `t_user` VALUES (667, 'Ben661', '661', 'Ben661', 'Ben661@qq.com', NULL);
INSERT INTO `t_user` VALUES (668, 'Ben662', '662', 'Ben662', 'Ben662@qq.com', NULL);
INSERT INTO `t_user` VALUES (669, 'Ben663', '663', 'Ben663', 'Ben663@qq.com', NULL);
INSERT INTO `t_user` VALUES (670, 'Ben664', '664', 'Ben664', 'Ben664@qq.com', NULL);
INSERT INTO `t_user` VALUES (671, 'Ben665', '665', 'Ben665', 'Ben665@qq.com', NULL);
INSERT INTO `t_user` VALUES (672, 'Ben666', '666', 'Ben666', 'Ben666@qq.com', NULL);
INSERT INTO `t_user` VALUES (673, 'Ben667', '667', 'Ben667', 'Ben667@qq.com', NULL);
INSERT INTO `t_user` VALUES (674, 'Ben668', '668', 'Ben668', 'Ben668@qq.com', NULL);
INSERT INTO `t_user` VALUES (675, 'Ben669', '669', 'Ben669', 'Ben669@qq.com', NULL);
INSERT INTO `t_user` VALUES (676, 'Ben670', '670', 'Ben670', 'Ben670@qq.com', NULL);
INSERT INTO `t_user` VALUES (677, 'Ben671', '671', 'Ben671', 'Ben671@qq.com', NULL);
INSERT INTO `t_user` VALUES (678, 'Ben672', '672', 'Ben672', 'Ben672@qq.com', NULL);
INSERT INTO `t_user` VALUES (679, 'Ben673', '673', 'Ben673', 'Ben673@qq.com', NULL);
INSERT INTO `t_user` VALUES (680, 'Ben674', '674', 'Ben674', 'Ben674@qq.com', NULL);
INSERT INTO `t_user` VALUES (681, 'Ben675', '675', 'Ben675', 'Ben675@qq.com', NULL);
INSERT INTO `t_user` VALUES (682, 'Ben676', '676', 'Ben676', 'Ben676@qq.com', NULL);
INSERT INTO `t_user` VALUES (683, 'Ben677', '677', 'Ben677', 'Ben677@qq.com', NULL);
INSERT INTO `t_user` VALUES (684, 'Ben678', '678', 'Ben678', 'Ben678@qq.com', NULL);
INSERT INTO `t_user` VALUES (685, 'Ben679', '679', 'Ben679', 'Ben679@qq.com', NULL);
INSERT INTO `t_user` VALUES (686, 'Ben680', '680', 'Ben680', 'Ben680@qq.com', NULL);
INSERT INTO `t_user` VALUES (687, 'Ben681', '681', 'Ben681', 'Ben681@qq.com', NULL);
INSERT INTO `t_user` VALUES (688, 'Ben682', '682', 'Ben682', 'Ben682@qq.com', NULL);
INSERT INTO `t_user` VALUES (689, 'Ben683', '683', 'Ben683', 'Ben683@qq.com', NULL);
INSERT INTO `t_user` VALUES (690, 'Ben684', '684', 'Ben684', 'Ben684@qq.com', NULL);
INSERT INTO `t_user` VALUES (691, 'Ben685', '685', 'Ben685', 'Ben685@qq.com', NULL);
INSERT INTO `t_user` VALUES (692, 'Ben686', '686', 'Ben686', 'Ben686@qq.com', NULL);
INSERT INTO `t_user` VALUES (693, 'Ben687', '687', 'Ben687', 'Ben687@qq.com', NULL);
INSERT INTO `t_user` VALUES (694, 'Ben688', '688', 'Ben688', 'Ben688@qq.com', NULL);
INSERT INTO `t_user` VALUES (695, 'Ben689', '689', 'Ben689', 'Ben689@qq.com', NULL);
INSERT INTO `t_user` VALUES (696, 'Ben690', '690', 'Ben690', 'Ben690@qq.com', NULL);
INSERT INTO `t_user` VALUES (697, 'Ben691', '691', 'Ben691', 'Ben691@qq.com', NULL);
INSERT INTO `t_user` VALUES (698, 'Ben692', '692', 'Ben692', 'Ben692@qq.com', NULL);
INSERT INTO `t_user` VALUES (699, 'Ben693', '693', 'Ben693', 'Ben693@qq.com', NULL);
INSERT INTO `t_user` VALUES (700, 'Ben694', '694', 'Ben694', 'Ben694@qq.com', NULL);
INSERT INTO `t_user` VALUES (701, 'Ben695', '695', 'Ben695', 'Ben695@qq.com', NULL);
INSERT INTO `t_user` VALUES (702, 'Ben696', '696', 'Ben696', 'Ben696@qq.com', NULL);
INSERT INTO `t_user` VALUES (703, 'Ben697', '697', 'Ben697', 'Ben697@qq.com', NULL);
INSERT INTO `t_user` VALUES (704, 'Ben698', '698', 'Ben698', 'Ben698@qq.com', NULL);
INSERT INTO `t_user` VALUES (705, 'Ben699', '699', 'Ben699', 'Ben699@qq.com', NULL);
INSERT INTO `t_user` VALUES (706, 'Ben700', '700', 'Ben700', 'Ben700@qq.com', NULL);
INSERT INTO `t_user` VALUES (707, 'Ben701', '701', 'Ben701', 'Ben701@qq.com', NULL);
INSERT INTO `t_user` VALUES (708, 'Ben702', '702', 'Ben702', 'Ben702@qq.com', NULL);
INSERT INTO `t_user` VALUES (709, 'Ben703', '703', 'Ben703', 'Ben703@qq.com', NULL);
INSERT INTO `t_user` VALUES (710, 'Ben704', '704', 'Ben704', 'Ben704@qq.com', NULL);
INSERT INTO `t_user` VALUES (711, 'Ben705', '705', 'Ben705', 'Ben705@qq.com', NULL);
INSERT INTO `t_user` VALUES (712, 'Ben706', '706', 'Ben706', 'Ben706@qq.com', NULL);
INSERT INTO `t_user` VALUES (713, 'Ben707', '707', 'Ben707', 'Ben707@qq.com', NULL);
INSERT INTO `t_user` VALUES (714, 'Ben708', '708', 'Ben708', 'Ben708@qq.com', NULL);
INSERT INTO `t_user` VALUES (715, 'Ben709', '709', 'Ben709', 'Ben709@qq.com', NULL);
INSERT INTO `t_user` VALUES (716, 'Ben710', '710', 'Ben710', 'Ben710@qq.com', NULL);
INSERT INTO `t_user` VALUES (717, 'Ben711', '711', 'Ben711', 'Ben711@qq.com', NULL);
INSERT INTO `t_user` VALUES (718, 'Ben712', '712', 'Ben712', 'Ben712@qq.com', NULL);
INSERT INTO `t_user` VALUES (719, 'Ben713', '713', 'Ben713', 'Ben713@qq.com', NULL);
INSERT INTO `t_user` VALUES (720, 'Ben714', '714', 'Ben714', 'Ben714@qq.com', NULL);
INSERT INTO `t_user` VALUES (721, 'Ben715', '715', 'Ben715', 'Ben715@qq.com', NULL);
INSERT INTO `t_user` VALUES (722, 'Ben716', '716', 'Ben716', 'Ben716@qq.com', NULL);
INSERT INTO `t_user` VALUES (723, 'Ben717', '717', 'Ben717', 'Ben717@qq.com', NULL);
INSERT INTO `t_user` VALUES (724, 'Ben718', '718', 'Ben718', 'Ben718@qq.com', NULL);
INSERT INTO `t_user` VALUES (725, 'Ben719', '719', 'Ben719', 'Ben719@qq.com', NULL);
INSERT INTO `t_user` VALUES (726, 'Ben720', '720', 'Ben720', 'Ben720@qq.com', NULL);
INSERT INTO `t_user` VALUES (727, 'Ben721', '721', 'Ben721', 'Ben721@qq.com', NULL);
INSERT INTO `t_user` VALUES (728, 'Ben722', '722', 'Ben722', 'Ben722@qq.com', NULL);
INSERT INTO `t_user` VALUES (729, 'Ben723', '723', 'Ben723', 'Ben723@qq.com', NULL);
INSERT INTO `t_user` VALUES (730, 'Ben724', '724', 'Ben724', 'Ben724@qq.com', NULL);
INSERT INTO `t_user` VALUES (731, 'Ben725', '725', 'Ben725', 'Ben725@qq.com', NULL);
INSERT INTO `t_user` VALUES (732, 'Ben726', '726', 'Ben726', 'Ben726@qq.com', NULL);
INSERT INTO `t_user` VALUES (733, 'Ben727', '727', 'Ben727', 'Ben727@qq.com', NULL);
INSERT INTO `t_user` VALUES (734, 'Ben728', '728', 'Ben728', 'Ben728@qq.com', NULL);
INSERT INTO `t_user` VALUES (735, 'Ben729', '729', 'Ben729', 'Ben729@qq.com', NULL);
INSERT INTO `t_user` VALUES (736, 'Ben730', '730', 'Ben730', 'Ben730@qq.com', NULL);
INSERT INTO `t_user` VALUES (737, 'Ben731', '731', 'Ben731', 'Ben731@qq.com', NULL);
INSERT INTO `t_user` VALUES (738, 'Ben732', '732', 'Ben732', 'Ben732@qq.com', NULL);
INSERT INTO `t_user` VALUES (739, 'Ben733', '733', 'Ben733', 'Ben733@qq.com', NULL);
INSERT INTO `t_user` VALUES (740, 'Ben734', '734', 'Ben734', 'Ben734@qq.com', NULL);
INSERT INTO `t_user` VALUES (741, 'Ben735', '735', 'Ben735', 'Ben735@qq.com', NULL);
INSERT INTO `t_user` VALUES (742, 'Ben736', '736', 'Ben736', 'Ben736@qq.com', NULL);
INSERT INTO `t_user` VALUES (743, 'Ben737', '737', 'Ben737', 'Ben737@qq.com', NULL);
INSERT INTO `t_user` VALUES (744, 'Ben738', '738', 'Ben738', 'Ben738@qq.com', NULL);
INSERT INTO `t_user` VALUES (745, 'Ben739', '739', 'Ben739', 'Ben739@qq.com', NULL);
INSERT INTO `t_user` VALUES (746, 'Ben740', '740', 'Ben740', 'Ben740@qq.com', NULL);
INSERT INTO `t_user` VALUES (747, 'Ben741', '741', 'Ben741', 'Ben741@qq.com', NULL);
INSERT INTO `t_user` VALUES (748, 'Ben742', '742', 'Ben742', 'Ben742@qq.com', NULL);
INSERT INTO `t_user` VALUES (749, 'Ben743', '743', 'Ben743', 'Ben743@qq.com', NULL);
INSERT INTO `t_user` VALUES (750, 'Ben744', '744', 'Ben744', 'Ben744@qq.com', NULL);
INSERT INTO `t_user` VALUES (751, 'Ben745', '745', 'Ben745', 'Ben745@qq.com', NULL);
INSERT INTO `t_user` VALUES (752, 'Ben746', '746', 'Ben746', 'Ben746@qq.com', NULL);
INSERT INTO `t_user` VALUES (753, 'Ben747', '747', 'Ben747', 'Ben747@qq.com', NULL);
INSERT INTO `t_user` VALUES (754, 'Ben748', '748', 'Ben748', 'Ben748@qq.com', NULL);
INSERT INTO `t_user` VALUES (755, 'Ben749', '749', 'Ben749', 'Ben749@qq.com', NULL);
INSERT INTO `t_user` VALUES (756, 'Ben750', '750', 'Ben750', 'Ben750@qq.com', NULL);
INSERT INTO `t_user` VALUES (757, 'Ben751', '751', 'Ben751', 'Ben751@qq.com', NULL);
INSERT INTO `t_user` VALUES (758, 'Ben752', '752', 'Ben752', 'Ben752@qq.com', NULL);
INSERT INTO `t_user` VALUES (759, 'Ben753', '753', 'Ben753', 'Ben753@qq.com', NULL);
INSERT INTO `t_user` VALUES (760, 'Ben754', '754', 'Ben754', 'Ben754@qq.com', NULL);
INSERT INTO `t_user` VALUES (761, 'Ben755', '755', 'Ben755', 'Ben755@qq.com', NULL);
INSERT INTO `t_user` VALUES (762, 'Ben756', '756', 'Ben756', 'Ben756@qq.com', NULL);
INSERT INTO `t_user` VALUES (763, 'Ben757', '757', 'Ben757', 'Ben757@qq.com', NULL);
INSERT INTO `t_user` VALUES (764, 'Ben758', '758', 'Ben758', 'Ben758@qq.com', NULL);
INSERT INTO `t_user` VALUES (765, 'Ben759', '759', 'Ben759', 'Ben759@qq.com', NULL);
INSERT INTO `t_user` VALUES (766, 'Ben760', '760', 'Ben760', 'Ben760@qq.com', NULL);
INSERT INTO `t_user` VALUES (767, 'Ben761', '761', 'Ben761', 'Ben761@qq.com', NULL);
INSERT INTO `t_user` VALUES (768, 'Ben762', '762', 'Ben762', 'Ben762@qq.com', NULL);
INSERT INTO `t_user` VALUES (769, 'Ben763', '763', 'Ben763', 'Ben763@qq.com', NULL);
INSERT INTO `t_user` VALUES (770, 'Ben764', '764', 'Ben764', 'Ben764@qq.com', NULL);
INSERT INTO `t_user` VALUES (771, 'Ben765', '765', 'Ben765', 'Ben765@qq.com', NULL);
INSERT INTO `t_user` VALUES (772, 'Ben766', '766', 'Ben766', 'Ben766@qq.com', NULL);
INSERT INTO `t_user` VALUES (773, 'Ben767', '767', 'Ben767', 'Ben767@qq.com', NULL);
INSERT INTO `t_user` VALUES (774, 'Ben768', '768', 'Ben768', 'Ben768@qq.com', NULL);
INSERT INTO `t_user` VALUES (775, 'Ben769', '769', 'Ben769', 'Ben769@qq.com', NULL);
INSERT INTO `t_user` VALUES (776, 'Ben770', '770', 'Ben770', 'Ben770@qq.com', NULL);
INSERT INTO `t_user` VALUES (777, 'Ben771', '771', 'Ben771', 'Ben771@qq.com', NULL);
INSERT INTO `t_user` VALUES (778, 'Ben772', '772', 'Ben772', 'Ben772@qq.com', NULL);
INSERT INTO `t_user` VALUES (779, 'Ben773', '773', 'Ben773', 'Ben773@qq.com', NULL);
INSERT INTO `t_user` VALUES (780, 'Ben774', '774', 'Ben774', 'Ben774@qq.com', NULL);
INSERT INTO `t_user` VALUES (781, 'Ben775', '775', 'Ben775', 'Ben775@qq.com', NULL);
INSERT INTO `t_user` VALUES (782, 'Ben776', '776', 'Ben776', 'Ben776@qq.com', NULL);
INSERT INTO `t_user` VALUES (783, 'Ben777', '777', 'Ben777', 'Ben777@qq.com', NULL);
INSERT INTO `t_user` VALUES (784, 'Ben778', '778', 'Ben778', 'Ben778@qq.com', NULL);
INSERT INTO `t_user` VALUES (785, 'Ben779', '779', 'Ben779', 'Ben779@qq.com', NULL);
INSERT INTO `t_user` VALUES (786, 'Ben780', '780', 'Ben780', 'Ben780@qq.com', NULL);
INSERT INTO `t_user` VALUES (787, 'Ben781', '781', 'Ben781', 'Ben781@qq.com', NULL);
INSERT INTO `t_user` VALUES (788, 'Ben782', '782', 'Ben782', 'Ben782@qq.com', NULL);
INSERT INTO `t_user` VALUES (789, 'Ben783', '783', 'Ben783', 'Ben783@qq.com', NULL);
INSERT INTO `t_user` VALUES (790, 'Ben784', '784', 'Ben784', 'Ben784@qq.com', NULL);
INSERT INTO `t_user` VALUES (791, 'Ben785', '785', 'Ben785', 'Ben785@qq.com', NULL);
INSERT INTO `t_user` VALUES (792, 'Ben786', '786', 'Ben786', 'Ben786@qq.com', NULL);
INSERT INTO `t_user` VALUES (793, 'Ben787', '787', 'Ben787', 'Ben787@qq.com', NULL);
INSERT INTO `t_user` VALUES (794, 'Ben788', '788', 'Ben788', 'Ben788@qq.com', NULL);
INSERT INTO `t_user` VALUES (795, 'Ben789', '789', 'Ben789', 'Ben789@qq.com', NULL);
INSERT INTO `t_user` VALUES (796, 'Ben790', '790', 'Ben790', 'Ben790@qq.com', NULL);
INSERT INTO `t_user` VALUES (797, 'Ben791', '791', 'Ben791', 'Ben791@qq.com', NULL);
INSERT INTO `t_user` VALUES (798, 'Ben792', '792', 'Ben792', 'Ben792@qq.com', NULL);
INSERT INTO `t_user` VALUES (799, 'Ben793', '793', 'Ben793', 'Ben793@qq.com', NULL);
INSERT INTO `t_user` VALUES (800, 'Ben794', '794', 'Ben794', 'Ben794@qq.com', NULL);
INSERT INTO `t_user` VALUES (801, 'Ben795', '795', 'Ben795', 'Ben795@qq.com', NULL);
INSERT INTO `t_user` VALUES (802, 'Ben796', '796', 'Ben796', 'Ben796@qq.com', NULL);
INSERT INTO `t_user` VALUES (803, 'Ben797', '797', 'Ben797', 'Ben797@qq.com', NULL);
INSERT INTO `t_user` VALUES (804, 'Ben798', '798', 'Ben798', 'Ben798@qq.com', NULL);
INSERT INTO `t_user` VALUES (805, 'Ben799', '799', 'Ben799', 'Ben799@qq.com', NULL);
INSERT INTO `t_user` VALUES (806, 'Ben800', '800', 'Ben800', 'Ben800@qq.com', NULL);
INSERT INTO `t_user` VALUES (807, 'Ben801', '801', 'Ben801', 'Ben801@qq.com', NULL);
INSERT INTO `t_user` VALUES (808, 'Ben802', '802', 'Ben802', 'Ben802@qq.com', NULL);
INSERT INTO `t_user` VALUES (809, 'Ben803', '803', 'Ben803', 'Ben803@qq.com', NULL);
INSERT INTO `t_user` VALUES (810, 'Ben804', '804', 'Ben804', 'Ben804@qq.com', NULL);
INSERT INTO `t_user` VALUES (811, 'Ben805', '805', 'Ben805', 'Ben805@qq.com', NULL);
INSERT INTO `t_user` VALUES (812, 'Ben806', '806', 'Ben806', 'Ben806@qq.com', NULL);
INSERT INTO `t_user` VALUES (813, 'Ben807', '807', 'Ben807', 'Ben807@qq.com', NULL);
INSERT INTO `t_user` VALUES (814, 'Ben808', '808', 'Ben808', 'Ben808@qq.com', NULL);
INSERT INTO `t_user` VALUES (815, 'Ben809', '809', 'Ben809', 'Ben809@qq.com', NULL);
INSERT INTO `t_user` VALUES (816, 'Ben810', '810', 'Ben810', 'Ben810@qq.com', NULL);
INSERT INTO `t_user` VALUES (817, 'Ben811', '811', 'Ben811', 'Ben811@qq.com', NULL);
INSERT INTO `t_user` VALUES (818, 'Ben812', '812', 'Ben812', 'Ben812@qq.com', NULL);
INSERT INTO `t_user` VALUES (819, 'Ben813', '813', 'Ben813', 'Ben813@qq.com', NULL);
INSERT INTO `t_user` VALUES (820, 'Ben814', '814', 'Ben814', 'Ben814@qq.com', NULL);
INSERT INTO `t_user` VALUES (821, 'Ben815', '815', 'Ben815', 'Ben815@qq.com', NULL);
INSERT INTO `t_user` VALUES (822, 'Ben816', '816', 'Ben816', 'Ben816@qq.com', NULL);
INSERT INTO `t_user` VALUES (823, 'Ben817', '817', 'Ben817', 'Ben817@qq.com', NULL);
INSERT INTO `t_user` VALUES (824, 'Ben818', '818', 'Ben818', 'Ben818@qq.com', NULL);
INSERT INTO `t_user` VALUES (825, 'Ben819', '819', 'Ben819', 'Ben819@qq.com', NULL);
INSERT INTO `t_user` VALUES (826, 'Ben820', '820', 'Ben820', 'Ben820@qq.com', NULL);
INSERT INTO `t_user` VALUES (827, 'Ben821', '821', 'Ben821', 'Ben821@qq.com', NULL);
INSERT INTO `t_user` VALUES (828, 'Ben822', '822', 'Ben822', 'Ben822@qq.com', NULL);
INSERT INTO `t_user` VALUES (829, 'Ben823', '823', 'Ben823', 'Ben823@qq.com', NULL);
INSERT INTO `t_user` VALUES (830, 'Ben824', '824', 'Ben824', 'Ben824@qq.com', NULL);
INSERT INTO `t_user` VALUES (831, 'Ben825', '825', 'Ben825', 'Ben825@qq.com', NULL);
INSERT INTO `t_user` VALUES (832, 'Ben826', '826', 'Ben826', 'Ben826@qq.com', NULL);
INSERT INTO `t_user` VALUES (833, 'Ben827', '827', 'Ben827', 'Ben827@qq.com', NULL);
INSERT INTO `t_user` VALUES (834, 'Ben828', '828', 'Ben828', 'Ben828@qq.com', NULL);
INSERT INTO `t_user` VALUES (835, 'Ben829', '829', 'Ben829', 'Ben829@qq.com', NULL);
INSERT INTO `t_user` VALUES (836, 'Ben830', '830', 'Ben830', 'Ben830@qq.com', NULL);
INSERT INTO `t_user` VALUES (837, 'Ben831', '831', 'Ben831', 'Ben831@qq.com', NULL);
INSERT INTO `t_user` VALUES (838, 'Ben832', '832', 'Ben832', 'Ben832@qq.com', NULL);
INSERT INTO `t_user` VALUES (839, 'Ben833', '833', 'Ben833', 'Ben833@qq.com', NULL);
INSERT INTO `t_user` VALUES (840, 'Ben834', '834', 'Ben834', 'Ben834@qq.com', NULL);
INSERT INTO `t_user` VALUES (841, 'Ben835', '835', 'Ben835', 'Ben835@qq.com', NULL);
INSERT INTO `t_user` VALUES (842, 'Ben836', '836', 'Ben836', 'Ben836@qq.com', NULL);
INSERT INTO `t_user` VALUES (843, 'Ben837', '837', 'Ben837', 'Ben837@qq.com', NULL);
INSERT INTO `t_user` VALUES (844, 'Ben838', '838', 'Ben838', 'Ben838@qq.com', NULL);
INSERT INTO `t_user` VALUES (845, 'Ben839', '839', 'Ben839', 'Ben839@qq.com', NULL);
INSERT INTO `t_user` VALUES (846, 'Ben840', '840', 'Ben840', 'Ben840@qq.com', NULL);
INSERT INTO `t_user` VALUES (847, 'Ben841', '841', 'Ben841', 'Ben841@qq.com', NULL);
INSERT INTO `t_user` VALUES (848, 'Ben842', '842', 'Ben842', 'Ben842@qq.com', NULL);
INSERT INTO `t_user` VALUES (849, 'Ben843', '843', 'Ben843', 'Ben843@qq.com', NULL);
INSERT INTO `t_user` VALUES (850, 'Ben844', '844', 'Ben844', 'Ben844@qq.com', NULL);
INSERT INTO `t_user` VALUES (851, 'Ben845', '845', 'Ben845', 'Ben845@qq.com', NULL);
INSERT INTO `t_user` VALUES (852, 'Ben846', '846', 'Ben846', 'Ben846@qq.com', NULL);
INSERT INTO `t_user` VALUES (853, 'Ben847', '847', 'Ben847', 'Ben847@qq.com', NULL);
INSERT INTO `t_user` VALUES (854, 'Ben848', '848', 'Ben848', 'Ben848@qq.com', NULL);
INSERT INTO `t_user` VALUES (855, 'Ben849', '849', 'Ben849', 'Ben849@qq.com', NULL);
INSERT INTO `t_user` VALUES (856, 'Ben850', '850', 'Ben850', 'Ben850@qq.com', NULL);
INSERT INTO `t_user` VALUES (857, 'Ben851', '851', 'Ben851', 'Ben851@qq.com', NULL);
INSERT INTO `t_user` VALUES (858, 'Ben852', '852', 'Ben852', 'Ben852@qq.com', NULL);
INSERT INTO `t_user` VALUES (859, 'Ben853', '853', 'Ben853', 'Ben853@qq.com', NULL);
INSERT INTO `t_user` VALUES (860, 'Ben854', '854', 'Ben854', 'Ben854@qq.com', NULL);
INSERT INTO `t_user` VALUES (861, 'Ben855', '855', 'Ben855', 'Ben855@qq.com', NULL);
INSERT INTO `t_user` VALUES (862, 'Ben856', '856', 'Ben856', 'Ben856@qq.com', NULL);
INSERT INTO `t_user` VALUES (863, 'Ben857', '857', 'Ben857', 'Ben857@qq.com', NULL);
INSERT INTO `t_user` VALUES (864, 'Ben858', '858', 'Ben858', 'Ben858@qq.com', NULL);
INSERT INTO `t_user` VALUES (865, 'Ben859', '859', 'Ben859', 'Ben859@qq.com', NULL);
INSERT INTO `t_user` VALUES (866, 'Ben860', '860', 'Ben860', 'Ben860@qq.com', NULL);
INSERT INTO `t_user` VALUES (867, 'Ben861', '861', 'Ben861', 'Ben861@qq.com', NULL);
INSERT INTO `t_user` VALUES (868, 'Ben862', '862', 'Ben862', 'Ben862@qq.com', NULL);
INSERT INTO `t_user` VALUES (869, 'Ben863', '863', 'Ben863', 'Ben863@qq.com', NULL);
INSERT INTO `t_user` VALUES (870, 'Ben864', '864', 'Ben864', 'Ben864@qq.com', NULL);
INSERT INTO `t_user` VALUES (871, 'Ben865', '865', 'Ben865', 'Ben865@qq.com', NULL);
INSERT INTO `t_user` VALUES (872, 'Ben866', '866', 'Ben866', 'Ben866@qq.com', NULL);
INSERT INTO `t_user` VALUES (873, 'Ben867', '867', 'Ben867', 'Ben867@qq.com', NULL);
INSERT INTO `t_user` VALUES (874, 'Ben868', '868', 'Ben868', 'Ben868@qq.com', NULL);
INSERT INTO `t_user` VALUES (875, 'Ben869', '869', 'Ben869', 'Ben869@qq.com', NULL);
INSERT INTO `t_user` VALUES (876, 'Ben870', '870', 'Ben870', 'Ben870@qq.com', NULL);
INSERT INTO `t_user` VALUES (877, 'Ben871', '871', 'Ben871', 'Ben871@qq.com', NULL);
INSERT INTO `t_user` VALUES (878, 'Ben872', '872', 'Ben872', 'Ben872@qq.com', NULL);
INSERT INTO `t_user` VALUES (879, 'Ben873', '873', 'Ben873', 'Ben873@qq.com', NULL);
INSERT INTO `t_user` VALUES (880, 'Ben874', '874', 'Ben874', 'Ben874@qq.com', NULL);
INSERT INTO `t_user` VALUES (881, 'Ben875', '875', 'Ben875', 'Ben875@qq.com', NULL);
INSERT INTO `t_user` VALUES (882, 'Ben876', '876', 'Ben876', 'Ben876@qq.com', NULL);
INSERT INTO `t_user` VALUES (883, 'Ben877', '877', 'Ben877', 'Ben877@qq.com', NULL);
INSERT INTO `t_user` VALUES (884, 'Ben878', '878', 'Ben878', 'Ben878@qq.com', NULL);
INSERT INTO `t_user` VALUES (885, 'Ben879', '879', 'Ben879', 'Ben879@qq.com', NULL);
INSERT INTO `t_user` VALUES (886, 'Ben880', '880', 'Ben880', 'Ben880@qq.com', NULL);
INSERT INTO `t_user` VALUES (887, 'Ben881', '881', 'Ben881', 'Ben881@qq.com', NULL);
INSERT INTO `t_user` VALUES (888, 'Ben882', '882', 'Ben882', 'Ben882@qq.com', NULL);
INSERT INTO `t_user` VALUES (889, 'Ben883', '883', 'Ben883', 'Ben883@qq.com', NULL);
INSERT INTO `t_user` VALUES (890, 'Ben884', '884', 'Ben884', 'Ben884@qq.com', NULL);
INSERT INTO `t_user` VALUES (891, 'Ben885', '885', 'Ben885', 'Ben885@qq.com', NULL);
INSERT INTO `t_user` VALUES (892, 'Ben886', '886', 'Ben886', 'Ben886@qq.com', NULL);
INSERT INTO `t_user` VALUES (893, 'Ben887', '887', 'Ben887', 'Ben887@qq.com', NULL);
INSERT INTO `t_user` VALUES (894, 'Ben888', '888', 'Ben888', 'Ben888@qq.com', NULL);
INSERT INTO `t_user` VALUES (895, 'Ben889', '889', 'Ben889', 'Ben889@qq.com', NULL);
INSERT INTO `t_user` VALUES (896, 'Ben890', '890', 'Ben890', 'Ben890@qq.com', NULL);
INSERT INTO `t_user` VALUES (897, 'Ben891', '891', 'Ben891', 'Ben891@qq.com', NULL);
INSERT INTO `t_user` VALUES (898, 'Ben892', '892', 'Ben892', 'Ben892@qq.com', NULL);
INSERT INTO `t_user` VALUES (899, 'Ben893', '893', 'Ben893', 'Ben893@qq.com', NULL);
INSERT INTO `t_user` VALUES (900, 'Ben894', '894', 'Ben894', 'Ben894@qq.com', NULL);
INSERT INTO `t_user` VALUES (901, 'Ben895', '895', 'Ben895', 'Ben895@qq.com', NULL);
INSERT INTO `t_user` VALUES (902, 'Ben896', '896', 'Ben896', 'Ben896@qq.com', NULL);
INSERT INTO `t_user` VALUES (903, 'Ben897', '897', 'Ben897', 'Ben897@qq.com', NULL);
INSERT INTO `t_user` VALUES (904, 'Ben898', '898', 'Ben898', 'Ben898@qq.com', NULL);
INSERT INTO `t_user` VALUES (905, 'Ben899', '899', 'Ben899', 'Ben899@qq.com', NULL);
INSERT INTO `t_user` VALUES (906, 'Ben900', '900', 'Ben900', 'Ben900@qq.com', NULL);
INSERT INTO `t_user` VALUES (907, 'Ben901', '901', 'Ben901', 'Ben901@qq.com', NULL);
INSERT INTO `t_user` VALUES (908, 'Ben902', '902', 'Ben902', 'Ben902@qq.com', NULL);
INSERT INTO `t_user` VALUES (909, 'Ben903', '903', 'Ben903', 'Ben903@qq.com', NULL);
INSERT INTO `t_user` VALUES (910, 'Ben904', '904', 'Ben904', 'Ben904@qq.com', NULL);
INSERT INTO `t_user` VALUES (911, 'Ben905', '905', 'Ben905', 'Ben905@qq.com', NULL);
INSERT INTO `t_user` VALUES (912, 'Ben906', '906', 'Ben906', 'Ben906@qq.com', NULL);
INSERT INTO `t_user` VALUES (913, 'Ben907', '907', 'Ben907', 'Ben907@qq.com', NULL);
INSERT INTO `t_user` VALUES (914, 'Ben908', '908', 'Ben908', 'Ben908@qq.com', NULL);
INSERT INTO `t_user` VALUES (915, 'Ben909', '909', 'Ben909', 'Ben909@qq.com', NULL);
INSERT INTO `t_user` VALUES (916, 'Ben910', '910', 'Ben910', 'Ben910@qq.com', NULL);
INSERT INTO `t_user` VALUES (917, 'Ben911', '911', 'Ben911', 'Ben911@qq.com', NULL);
INSERT INTO `t_user` VALUES (918, 'Ben912', '912', 'Ben912', 'Ben912@qq.com', NULL);
INSERT INTO `t_user` VALUES (919, 'Ben913', '913', 'Ben913', 'Ben913@qq.com', NULL);
INSERT INTO `t_user` VALUES (920, 'Ben914', '914', 'Ben914', 'Ben914@qq.com', NULL);
INSERT INTO `t_user` VALUES (921, 'Ben915', '915', 'Ben915', 'Ben915@qq.com', NULL);
INSERT INTO `t_user` VALUES (922, 'Ben916', '916', 'Ben916', 'Ben916@qq.com', NULL);
INSERT INTO `t_user` VALUES (923, 'Ben917', '917', 'Ben917', 'Ben917@qq.com', NULL);
INSERT INTO `t_user` VALUES (924, 'Ben918', '918', 'Ben918', 'Ben918@qq.com', NULL);
INSERT INTO `t_user` VALUES (925, 'Ben919', '919', 'Ben919', 'Ben919@qq.com', NULL);
INSERT INTO `t_user` VALUES (926, 'Ben920', '920', 'Ben920', 'Ben920@qq.com', NULL);
INSERT INTO `t_user` VALUES (927, 'Ben921', '921', 'Ben921', 'Ben921@qq.com', NULL);
INSERT INTO `t_user` VALUES (928, 'Ben922', '922', 'Ben922', 'Ben922@qq.com', NULL);
INSERT INTO `t_user` VALUES (929, 'Ben923', '923', 'Ben923', 'Ben923@qq.com', NULL);
INSERT INTO `t_user` VALUES (930, 'Ben924', '924', 'Ben924', 'Ben924@qq.com', NULL);
INSERT INTO `t_user` VALUES (931, 'Ben925', '925', 'Ben925', 'Ben925@qq.com', NULL);
INSERT INTO `t_user` VALUES (932, 'Ben926', '926', 'Ben926', 'Ben926@qq.com', NULL);
INSERT INTO `t_user` VALUES (933, 'Ben927', '927', 'Ben927', 'Ben927@qq.com', NULL);
INSERT INTO `t_user` VALUES (934, 'Ben928', '928', 'Ben928', 'Ben928@qq.com', NULL);
INSERT INTO `t_user` VALUES (935, 'Ben929', '929', 'Ben929', 'Ben929@qq.com', NULL);
INSERT INTO `t_user` VALUES (936, 'Ben930', '930', 'Ben930', 'Ben930@qq.com', NULL);
INSERT INTO `t_user` VALUES (937, 'Ben931', '931', 'Ben931', 'Ben931@qq.com', NULL);
INSERT INTO `t_user` VALUES (938, 'Ben932', '932', 'Ben932', 'Ben932@qq.com', NULL);
INSERT INTO `t_user` VALUES (939, 'Ben933', '933', 'Ben933', 'Ben933@qq.com', NULL);
INSERT INTO `t_user` VALUES (940, 'Ben934', '934', 'Ben934', 'Ben934@qq.com', NULL);
INSERT INTO `t_user` VALUES (941, 'Ben935', '935', 'Ben935', 'Ben935@qq.com', NULL);
INSERT INTO `t_user` VALUES (942, 'Ben936', '936', 'Ben936', 'Ben936@qq.com', NULL);
INSERT INTO `t_user` VALUES (943, 'Ben937', '937', 'Ben937', 'Ben937@qq.com', NULL);
INSERT INTO `t_user` VALUES (944, 'Ben938', '938', 'Ben938', 'Ben938@qq.com', NULL);
INSERT INTO `t_user` VALUES (945, 'Ben939', '939', 'Ben939', 'Ben939@qq.com', NULL);
INSERT INTO `t_user` VALUES (946, 'Ben940', '940', 'Ben940', 'Ben940@qq.com', NULL);
INSERT INTO `t_user` VALUES (947, 'Ben941', '941', 'Ben941', 'Ben941@qq.com', NULL);
INSERT INTO `t_user` VALUES (948, 'Ben942', '942', 'Ben942', 'Ben942@qq.com', NULL);
INSERT INTO `t_user` VALUES (949, 'Ben943', '943', 'Ben943', 'Ben943@qq.com', NULL);
INSERT INTO `t_user` VALUES (950, 'Ben944', '944', 'Ben944', 'Ben944@qq.com', NULL);
INSERT INTO `t_user` VALUES (951, 'Ben945', '945', 'Ben945', 'Ben945@qq.com', NULL);
INSERT INTO `t_user` VALUES (952, 'Ben946', '946', 'Ben946', 'Ben946@qq.com', NULL);
INSERT INTO `t_user` VALUES (953, 'Ben947', '947', 'Ben947', 'Ben947@qq.com', NULL);
INSERT INTO `t_user` VALUES (954, 'Ben948', '948', 'Ben948', 'Ben948@qq.com', NULL);
INSERT INTO `t_user` VALUES (955, 'Ben949', '949', 'Ben949', 'Ben949@qq.com', NULL);
INSERT INTO `t_user` VALUES (956, 'Ben950', '950', 'Ben950', 'Ben950@qq.com', NULL);
INSERT INTO `t_user` VALUES (957, 'Ben951', '951', 'Ben951', 'Ben951@qq.com', NULL);
INSERT INTO `t_user` VALUES (958, 'Ben952', '952', 'Ben952', 'Ben952@qq.com', NULL);
INSERT INTO `t_user` VALUES (959, 'Ben953', '953', 'Ben953', 'Ben953@qq.com', NULL);
INSERT INTO `t_user` VALUES (960, 'Ben954', '954', 'Ben954', 'Ben954@qq.com', NULL);
INSERT INTO `t_user` VALUES (961, 'Ben955', '955', 'Ben955', 'Ben955@qq.com', NULL);
INSERT INTO `t_user` VALUES (962, 'Ben956', '956', 'Ben956', 'Ben956@qq.com', NULL);
INSERT INTO `t_user` VALUES (963, 'Ben957', '957', 'Ben957', 'Ben957@qq.com', NULL);
INSERT INTO `t_user` VALUES (964, 'Ben958', '958', 'Ben958', 'Ben958@qq.com', NULL);
INSERT INTO `t_user` VALUES (965, 'Ben959', '959', 'Ben959', 'Ben959@qq.com', NULL);
INSERT INTO `t_user` VALUES (966, 'Ben960', '960', 'Ben960', 'Ben960@qq.com', NULL);
INSERT INTO `t_user` VALUES (967, 'Ben961', '961', 'Ben961', 'Ben961@qq.com', NULL);
INSERT INTO `t_user` VALUES (968, 'Ben962', '962', 'Ben962', 'Ben962@qq.com', NULL);
INSERT INTO `t_user` VALUES (969, 'Ben963', '963', 'Ben963', 'Ben963@qq.com', NULL);
INSERT INTO `t_user` VALUES (970, 'Ben964', '964', 'Ben964', 'Ben964@qq.com', NULL);
INSERT INTO `t_user` VALUES (971, 'Ben965', '965', 'Ben965', 'Ben965@qq.com', NULL);
INSERT INTO `t_user` VALUES (972, 'Ben966', '966', 'Ben966', 'Ben966@qq.com', NULL);
INSERT INTO `t_user` VALUES (973, 'Ben967', '967', 'Ben967', 'Ben967@qq.com', NULL);
INSERT INTO `t_user` VALUES (974, 'Ben968', '968', 'Ben968', 'Ben968@qq.com', NULL);
INSERT INTO `t_user` VALUES (975, 'Ben969', '969', 'Ben969', 'Ben969@qq.com', NULL);
INSERT INTO `t_user` VALUES (976, 'Ben970', '970', 'Ben970', 'Ben970@qq.com', NULL);
INSERT INTO `t_user` VALUES (977, 'Ben971', '971', 'Ben971', 'Ben971@qq.com', NULL);
INSERT INTO `t_user` VALUES (978, 'Ben972', '972', 'Ben972', 'Ben972@qq.com', NULL);
INSERT INTO `t_user` VALUES (979, 'Ben973', '973', 'Ben973', 'Ben973@qq.com', NULL);
INSERT INTO `t_user` VALUES (980, 'Ben974', '974', 'Ben974', 'Ben974@qq.com', NULL);
INSERT INTO `t_user` VALUES (981, 'Ben975', '975', 'Ben975', 'Ben975@qq.com', NULL);
INSERT INTO `t_user` VALUES (982, 'Ben976', '976', 'Ben976', 'Ben976@qq.com', NULL);
INSERT INTO `t_user` VALUES (983, 'Ben977', '977', 'Ben977', 'Ben977@qq.com', NULL);
INSERT INTO `t_user` VALUES (984, 'Ben978', '978', 'Ben978', 'Ben978@qq.com', NULL);
INSERT INTO `t_user` VALUES (985, 'Ben979', '979', 'Ben979', 'Ben979@qq.com', NULL);
INSERT INTO `t_user` VALUES (986, 'Ben980', '980', 'Ben980', 'Ben980@qq.com', NULL);
INSERT INTO `t_user` VALUES (987, 'Ben981', '981', 'Ben981', 'Ben981@qq.com', NULL);
INSERT INTO `t_user` VALUES (988, 'Ben982', '982', 'Ben982', 'Ben982@qq.com', NULL);
INSERT INTO `t_user` VALUES (989, 'Ben983', '983', 'Ben983', 'Ben983@qq.com', NULL);
INSERT INTO `t_user` VALUES (990, 'Ben984', '984', 'Ben984', 'Ben984@qq.com', NULL);
INSERT INTO `t_user` VALUES (991, 'Ben985', '985', 'Ben985', 'Ben985@qq.com', NULL);
INSERT INTO `t_user` VALUES (992, 'Ben986', '986', 'Ben986', 'Ben986@qq.com', NULL);
INSERT INTO `t_user` VALUES (993, 'Ben987', '987', 'Ben987', 'Ben987@qq.com', NULL);
INSERT INTO `t_user` VALUES (994, 'Ben988', '988', 'Ben988', 'Ben988@qq.com', NULL);
INSERT INTO `t_user` VALUES (995, 'Ben989', '989', 'Ben989', 'Ben989@qq.com', NULL);
INSERT INTO `t_user` VALUES (996, 'Ben990', '990', 'Ben990', 'Ben990@qq.com', NULL);
INSERT INTO `t_user` VALUES (997, 'Ben991', '991', 'Ben991', 'Ben991@qq.com', NULL);
INSERT INTO `t_user` VALUES (998, 'Ben992', '992', 'Ben992', 'Ben992@qq.com', NULL);
INSERT INTO `t_user` VALUES (999, 'Ben993', '993', 'Ben993', 'Ben993@qq.com', NULL);
INSERT INTO `t_user` VALUES (1000, 'Ben994', '994', 'Ben994', 'Ben994@qq.com', NULL);
INSERT INTO `t_user` VALUES (1001, 'Ben995', '995', 'Ben995', 'Ben995@qq.com', NULL);
INSERT INTO `t_user` VALUES (1002, 'Ben996', '996', 'Ben996', 'Ben996@qq.com', NULL);
INSERT INTO `t_user` VALUES (1003, 'Ben997', '997', 'Ben997', 'Ben997@qq.com', NULL);
INSERT INTO `t_user` VALUES (1004, 'Ben998', '998', 'Ben998', 'Ben998@qq.com', NULL);
INSERT INTO `t_user` VALUES (1005, 'Ben999', '999', 'Ben999', 'Ben999@qq.com', NULL);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NULL DEFAULT NULL,
  `roleid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_1`(`userid`) USING BTREE,
  INDEX `FK_Reference_2`(`roleid`) USING BTREE,
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`roleid`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (5, 5, 1);
INSERT INTO `t_user_role` VALUES (7, 5, 2);
INSERT INTO `t_user_role` VALUES (8, 5, 3);

-- ----------------------------
-- Procedure structure for InsertUsers
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertUsers`;
delimiter ;;
CREATE PROCEDURE `InsertUsers`()
BEGIN
	#Routine body goes here...
	declare i int default 0;
	set i=0;
	while i<1000 DO
		INSERT INTO t_user(loginacct,userpswd,username,email)
		VALUES(concat('Ben',i),i,concat('Ben',i),concat('Ben',i,'@qq.com'));
		set i=i+1;
	end while;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
