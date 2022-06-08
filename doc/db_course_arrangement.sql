/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : db_course_arrangement

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 04/06/2022 12:13:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `admin_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员编号',
  `username` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `realname` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `user_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '用户类型',
  `jobtitle` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称',
  `license` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件照地址',
  `teach` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教授科目',
  `telephone` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `age` int(0) NULL DEFAULT NULL COMMENT '年龄',
  `avatar` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '管理员类型',
  `piority` int(0) NULL DEFAULT NULL COMMENT '优先级',
  `power` tinyint(1) NULL DEFAULT NULL COMMENT '1为管理员，0为超级管理员',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '账号状态',
  `deleted` tinyint(1) NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES (1, '10011', 'admin', '123456', '梁主任', 1, '教务处主任', NULL, NULL, NULL, 'admin@guet.com', NULL, NULL, NULL, '认真对待工作', '务实', NULL, NULL, NULL, 0, 0, '2020-03-06 23:31:17', '2020-03-06 23:31:17');
INSERT INTO `tb_admin` VALUES (2, '10012', '123', '123456', '张三丰', 1, '教务处副主任', NULL, NULL, NULL, 'admin@guet.com', NULL, NULL, NULL, '光线强的地方，影子也比较黑暗。', '零下1摄氏度', NULL, NULL, NULL, 0, 0, '2020-03-04 21:24:57', NULL);
INSERT INTO `tb_admin` VALUES (3, '10013', 'admin1', '123456', '王五', 1, '教务处副主任', NULL, NULL, NULL, 'admin@guet.com', NULL, NULL, NULL, '加油每一天', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);

-- ----------------------------
-- Table structure for tb_class_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_class_info`;
CREATE TABLE `tb_class_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id,班级表',
  `class_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级编号',
  `class_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名称',
  `num` int(0) NOT NULL DEFAULT 0 COMMENT '班级人数',
  `teacher` int(0) NULL DEFAULT NULL COMMENT '班主任id',
  `remark` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '直接用来做为年级编号的划分了',
  `deleted` tinyint(1) NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_class_info
-- ----------------------------
INSERT INTO `tb_class_info` VALUES (1, '20180401', '18级信息1班', 30, 10, '04', 0, NULL, '2020-05-20 16:23:22');
INSERT INTO `tb_class_info` VALUES (2, '20180301', '18级旅游1班', 30, 9, '04', 0, NULL, '2020-05-20 16:23:22');
INSERT INTO `tb_class_info` VALUES (6, '20190401', '19级信息1班', 30, 8, '03', 0, NULL, '2020-05-20 16:23:22');
INSERT INTO `tb_class_info` VALUES (7, '20190301', '19级旅游1班', 30, 7, '03', 0, NULL, '2020-05-20 16:23:22');
INSERT INTO `tb_class_info` VALUES (10, '20200401', '20级信息1班', 30, 6, '02', 0, NULL, '2020-05-20 16:23:22');
INSERT INTO `tb_class_info` VALUES (11, '20200301', '20级旅游1班', 30, 5, '02', 0, NULL, '2020-05-20 16:23:22');
INSERT INTO `tb_class_info` VALUES (34, '20210401', '21级信息1班', 30, 3, '01', 0, '2022-05-27 14:08:04', '2022-05-27 14:08:09');
INSERT INTO `tb_class_info` VALUES (35, '20210301', '21级旅游1班', 30, 1, '01', 0, '2022-05-27 14:11:26', '2022-05-27 14:12:53');
INSERT INTO `tb_class_info` VALUES (36, '20210202', '000', 37, 11, '01', 1, '2022-05-28 11:09:01', '2022-05-28 11:09:06');
INSERT INTO `tb_class_info` VALUES (37, '18', '11', 30, 1, '01', 1, '2022-05-28 11:09:44', '2022-05-28 11:09:48');
INSERT INTO `tb_class_info` VALUES (38, '20202121', '28', 12, 5, '01', 1, '2022-05-28 11:19:04', '2022-05-28 11:19:09');
INSERT INTO `tb_class_info` VALUES (39, '20202222', '00', 36, 18, '01', 1, '2022-05-28 14:07:27', '2022-05-28 14:07:33');
INSERT INTO `tb_class_info` VALUES (40, '202122022', '0', 20, 16, '01', 1, '2022-05-28 14:50:13', '2022-05-28 14:50:19');

-- ----------------------------
-- Table structure for tb_class_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_class_task`;
CREATE TABLE `tb_class_task`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id，即将要上课的，需要进行排课的',
  `semester` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学期',
  `grade_no` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '年级编号',
  `class_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级编号',
  `class_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级名称',
  `course_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程编号',
  `course_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名',
  `teacher_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师编号',
  `realname` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师姓名',
  `courseAttr` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程属性',
  `studentNum` int(0) NOT NULL COMMENT '学生人数',
  `weeks_sum` int(0) NOT NULL COMMENT '周数',
  `weeks_number` int(0) NOT NULL COMMENT '周学时',
  `isFix` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否固定上课时间。1-不固定，2-固定',
  `class_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定时间的话,2位为一个时间位置',
  `deleted` tinyint(1) NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_class_task
-- ----------------------------
INSERT INTO `tb_class_task` VALUES (101, '2021-2022-1', '01', '20210401', '21级信息1班', '100001', '	英语（综合）1', '10010', '梁晓明', '01', 30, 12, 4, '1', NULL, 0, '2022-05-27 16:33:31', NULL);
INSERT INTO `tb_class_task` VALUES (102, '2021-2022-1', '01', '20210401', '21级信息1班', '100033', '	高等数学Ⅱ', '10012', '李雪雪', '01', 30, 12, 4, '1', NULL, 0, '2022-05-27 16:42:58', NULL);
INSERT INTO `tb_class_task` VALUES (103, '2021-2022-1', '01', '20210401', '21级信息1班', '100005', '英语（视听说）1', '10013', '王小芳', '02', 30, 12, 4, '1', NULL, 1, '2022-05-27 16:43:35', NULL);
INSERT INTO `tb_class_task` VALUES (104, '2021-2022-1', '01', '20210401', '21级信息1班', '100040 ', '	线性代数2', '10014', '孙晓明', '01', 30, 12, 4, '1', NULL, 1, '2022-05-27 16:44:43', '2022-05-27 16:45:46');
INSERT INTO `tb_class_task` VALUES (105, '2021-2022-1', '01', '20210401', '21级信息1班', '100004', '	生命科学与人类文明', '10013', '王小芳', '02', 30, 12, 2, '1', NULL, 0, '2022-05-27 16:46:57', '2022-05-27 16:52:12');
INSERT INTO `tb_class_task` VALUES (106, '2021-2022-1', '01', '20210401', '21级信息1班', '100005', '英语（视听说）1', '10014', '孙晓明', '02', 30, 12, 2, '1', NULL, 0, '2022-05-27 16:48:18', '2022-05-27 16:48:33');
INSERT INTO `tb_class_task` VALUES (107, '2021-2022-1', '01', '20210401', '21级信息1班', '100040 ', '	线性代数2', '10015', '孙振东', '01', 30, 10, 4, '1', NULL, 1, '2022-05-27 16:50:45', '2022-05-27 16:51:19');
INSERT INTO `tb_class_task` VALUES (108, '2021-2022-1', '01', '20210401', '21级信息1班', '100051', '体育课', '10016', '谭老师', '04', 30, 10, 2, '1', NULL, 0, '2022-05-27 16:53:10', NULL);
INSERT INTO `tb_class_task` VALUES (109, '2021-2022-1', '01', '20210401', '21级信息1班', '100058', '数据结构', '10017', '梁老师', '01', 30, 10, 4, '1', NULL, 0, '2022-05-27 16:54:47', NULL);
INSERT INTO `tb_class_task` VALUES (110, '2021-2022-1', '01', '20210401', '21级信息1班', '100071', '信息技术基础2（上机）', '10018', '梁忠诚', '03', 30, 14, 2, '1', NULL, 0, '2022-05-27 16:55:43', NULL);
INSERT INTO `tb_class_task` VALUES (111, '2021-2022-1', '01', '20210401', '21级信息1班', '100070', '信息技术基础2', '10019', '汪莉莉', '01', 30, 10, 4, '1', NULL, 0, '2022-05-27 16:56:52', NULL);
INSERT INTO `tb_class_task` VALUES (112, '2021-2022-1', '01', '20210401', '21级信息1班', '100061', '	计算机语言（C）', '10020', '胡冬梅', '01', 30, 12, 4, '1', NULL, 0, '2022-05-27 17:00:13', NULL);
INSERT INTO `tb_class_task` VALUES (113, '2021-2022-1', '01', '20210401', '21级信息1班', '100029', '海洋与人类文明', '10021', '林俊杰', '02', 30, 10, 2, '1', NULL, 0, '2022-05-27 17:01:33', NULL);
INSERT INTO `tb_class_task` VALUES (114, '2021-2022-1', '01', '20210301', '21级旅游1班', '100001', '	英语（综合）1', '10010', '梁晓明', '01', 30, 14, 4, '1', NULL, 0, '2022-05-27 17:10:07', NULL);
INSERT INTO `tb_class_task` VALUES (115, '2021-2022-1', '01', '20210301', '21级旅游1班', '100056', '运筹学', '10048', '黄桐', '01', 30, 14, 4, '1', NULL, 0, '2022-05-28 00:15:17', NULL);
INSERT INTO `tb_class_task` VALUES (116, '2021-2022-1', '01', '20210301', '21级旅游1班', '100005', '英语（视听说）1', '10043', '王杰', '01', 30, 12, 2, '1', NULL, 0, '2022-05-28 00:16:35', NULL);
INSERT INTO `tb_class_task` VALUES (119, '2021-2022-1', '01', '20210301', '21级旅游1班', '100022', '走进故宫', '10035', '张三封', '02', 30, 13, 4, '1', NULL, 1, '2022-05-28 11:12:21', NULL);
INSERT INTO `tb_class_task` VALUES (120, '2021-2022-1', '01', '20210301', '21级旅游1班', '100022', '走进故宫', '10024', '侯德南', '02', 31, 12, 4, '1', NULL, 1, '2022-05-28 14:10:08', '2022-05-28 14:10:15');
INSERT INTO `tb_class_task` VALUES (121, '2021-2022-1', '01', '20210401', '21级信息1班', '100016', '化学与社会', '10033', '韩云', '02', 30, 14, 4, '1', NULL, 0, '2022-05-28 14:51:16', NULL);

-- ----------------------------
-- Table structure for tb_classroom
-- ----------------------------
DROP TABLE IF EXISTS `tb_classroom`;
CREATE TABLE `tb_classroom`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '教室id',
  `classroom_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教室编号',
  `classroom_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教室名称',
  `teachbuild_no` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所在教学楼编号',
  `capacity` int(0) NOT NULL COMMENT '教室人数容量',
  `attr` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教室属性',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除（默认0显示，1删除）',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 155 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_classroom
-- ----------------------------
INSERT INTO `tb_classroom` VALUES (1, '01-101', '01-101', '01', 50, '01', '备注', 0, NULL, '2020-04-11 14:21:48');
INSERT INTO `tb_classroom` VALUES (2, '01-102', '01-102', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (3, '01-103', '01-103', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (4, '01-104', '01-104', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (5, '01-105', '01-105', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (6, '01-201', '01-201', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (7, '01-202', '01-202', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (8, '01-203', '01-203', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (9, '01-204', '01-204', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (10, '01-205', '01-205', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (11, '01-301', '01-301', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (12, '01-302', '01-302', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (13, '01-303', '01-303', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (14, '01-304', '01-304', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (15, '01-305', '01-305', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (16, '01-401', '01-401', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (17, '01-402', '01-402', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (18, '01-403', '01-403', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (19, '01-404', '01-404', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (20, '01-405', '01-405', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (21, '01-501', '01-501', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (22, '01-502', '01-502', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (23, '01-503', '01-503', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (24, '01-504', '01-504', '01', 50, '01', NULL, 0, '2020-03-19 12:32:18', '2020-03-12 12:32:21');
INSERT INTO `tb_classroom` VALUES (25, '01-505', '01-505', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (26, '02-101', '02-101', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (27, '02-102', '02-102', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (28, '02-103', '02-103', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (29, '02-104', '02-104', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (30, '02-105', '02-105', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (31, '02-201', '02-202', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (32, '02-202', '02-202', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (33, '02-203', '02-203', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (34, '02-204', '02-204', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (35, '02-205', '02-205', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (36, '02-301', '02-301', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (37, '02-302', '02-302', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (38, '02-303', '02-303', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (39, '02-304', '02-304', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (40, '02-305', '02-305', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (41, '02-401', '02-401', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (42, '02-402', '02-402', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (43, '02-403', '02-403', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (44, '02-404', '02-404', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (45, '02-405', '02-405', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (46, '03-101', '03-101', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (47, '03-102', '03-102', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (48, '03-103', '03-103', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (49, '03-104', '03-104', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (50, '03-105', '03-105', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (51, '03-201', '03-201', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (52, '03-202', '03-202', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (53, '03-203', '03-203', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (54, '03-204', '03-204', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (55, '03-205', '03-205', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (56, '03-301', '03-301', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (57, '03-302', '03-302', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (58, '03-303', '03-303', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (59, '03-304', '03-304', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (60, '03-305', '03-305', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (61, '03-401', '03-401', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (62, '03-402', '03-402', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (63, '03-403', '03-403', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (64, '03-404', '03-404', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (65, '03-405', '03-405', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (66, '03-501', '03-501', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (67, '03-502', '03-502', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (68, '03-503', '03-503', '03', 50, '01', '', 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (69, '03-504', '03-504', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (70, '03-505', '03-505', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (71, '04-101', '04-101', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (72, '04-102', '04-102', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (73, '04-103', '04-103', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (74, '04-104', '04-104', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (75, '04-105', '04-105', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (76, '04-201', '04-201', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (77, '04-202', '04-202', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (78, '04-203', '04-203', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (79, '04-204', '04-204', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (80, '04-205', '04-205', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (81, '04-301', '04-301', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (82, '04-302', '04-302', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (83, '04-303', '04-303', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (84, '04-304', '04-304', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (85, '04-305', '04-305', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (86, '04-401', '04-401', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (87, '04-402', '04-402', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (88, '04-403', '04-403', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (99, '04-404', '04-404', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (100, '04-405', '04-405', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (101, '04-501', '04-501', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (102, '04-502', '04-502', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (103, '04-503', '04-503', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (104, '04-504', '04-504', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (105, '04-505', '04-505', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (106, '05-101', '05-101', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (107, '05-102', '05-102', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (108, '05-103', '05-103', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (109, '05-104', '05-104', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (110, '05-105', '05-105', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (111, '05-201', '05-201', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (112, '05-202', '05-202', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (113, '05-203', '05-203', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (114, '05-204', '05-204', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (115, '05-205', '05-205', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (116, '05-301', '05-301', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (117, '05-302', '05-302', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (118, '05-303', '05-303', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (119, '05-304', '05-304', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (120, '05-305', '05-305', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (121, '05-401', '05-401', '05', 50, '01', '', 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (122, '05-402', '05-402', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (123, '05-403', '05-403', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (124, '05-404', '05-404', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (125, '05-405', '05-405', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (126, '05-501', '05-501', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (127, '05-502', '05-502', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (128, '05-503', '05-503', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (129, '05-504', '05-504', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (130, '05-505', '05-505', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (133, '12-101', '12-101', '12', 120, '04', '体育楼', 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (134, '12-102', '12-102', '12', 120, '04', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (135, '12-103', '12-103', '12', 120, '04', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (136, '12-104', '12-104', '12', 120, '04', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (137, '12-201', '12-201', '12', 120, '04', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (138, '12-202', '12-202', '12', 120, '04', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (139, '12-203', '12-203', '12', 120, '04', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (140, '12-204', '12-204', '12', 120, '04', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (141, '08-101', '08-101', '08', 50, '03', '实验楼', 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (142, '08-102', '08-102', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (143, '08-103', '08-103', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (144, '08-104', '08-104', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (145, '08-105', '08-105', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (146, '08-201', '08-201', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (147, '08-202', '08-202', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (148, '08-203', '08-203', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (149, '08-204', '08-204', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (150, '08-205', '08-205', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (151, '08-301', '08-301', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (152, '08-302', '08-302', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (153, '08-303', '08-303', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (154, '08-304', '08-304', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (155, '08-305', '08-305', '08', 50, '03', NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for tb_course_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_course_info`;
CREATE TABLE `tb_course_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `course_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程编号',
  `course_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名',
  `course_attr` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程属性。01-必修，02-选修，03-实践，04体育，05-艺术',
  `publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '课程状态',
  `piority` int(0) NULL DEFAULT NULL COMMENT '优先级',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_course_info
-- ----------------------------
INSERT INTO `tb_course_info` VALUES (1, '100001', '	英语（综合）1', '01', '桂电出版社', NULL, NULL, '测试添加', 0, NULL, '2020-05-02 20:59:58');
INSERT INTO `tb_course_info` VALUES (2, '100002', '	英语（综合）2', '01', '清华大学出版社', NULL, NULL, '衡水中学使用教材', 0, NULL, '2020-05-02 21:01:07');
INSERT INTO `tb_course_info` VALUES (3, '100003', '	英语（综合）3', '01', '北京大学出版社', NULL, NULL, '谭老师授课', 0, NULL, '2020-05-02 21:03:13');
INSERT INTO `tb_course_info` VALUES (4, '100004', '	生命科学与人类文明', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (5, '100005', '英语（视听说）1', '01', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (6, '100006', '英语（视听说）2', '01', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (7, '100007', '中国民族音乐作品鉴赏', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (8, '100008', '	艺术与审美', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (9, '100009', '孟子导读', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (10, '100010', '乡村音乐鼓圈', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (11, '100011', '食品安全与日常饮食', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (12, '100012', '大学生安全文化', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (13, '100013', '	中国古典诗词中的品格与修养', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (14, '100014', '	教师口语艺术', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (15, '100015', '健康生活，预防癌症', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (16, '100016', '化学与社会', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (17, '100017', '	信息资源检索与利用', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (18, '100018', '音乐鉴赏', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (19, '100019', '大脑的奥秘：神经科学导论', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (20, '100020', '航空概论', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (21, '100021', '太阳系中的有趣科学', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (22, '100022', '走进故宫', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (23, '100023', '走近科技-大学生创新实践', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (24, '100024', '古典诗词鉴赏', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (25, '100025', '戏曲鉴赏', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (26, '100026', '实用签名设计艺术', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (27, '100027', '生命智能', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (28, '100028', '	毒品危害与防范', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (29, '100029', '海洋与人类文明', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (30, '100030', '	身边的基因科学', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (31, '100031', '现代自然地理学', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (32, '100032', '心理学的智慧', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (33, '100033', '	高等数学Ⅱ', '01', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (34, '100034', '英语（综合）4', '01', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (35, '100035', '英语（视听说）3', '01', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (36, '100036', '英语（视听说）4', '01', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (37, '100037', '幸福心理学', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (38, '100038', '红色旅游与文化传承', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (39, '100039', '朗读艺术入门', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (40, '100040 ', '	线性代数2', '01', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (41, '100041', '景观地学基础', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (42, '100042', '公共关系礼仪实务', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (43, '100043', '用经济学智慧解读中国', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (44, '100044', '前进中的物理学与人类文明', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (45, '100045', '星海求知：天文学的奥秘', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (46, '100046', '创新、发明与专利实务', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (47, '100047', '	中国古代礼仪文明', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (48, '100048', '	中外美术导赏', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (49, '100049', '艺术美学巡礼', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (50, '100050', '建筑钢笔手绘', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (51, '100051', '体育课', '04', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (52, '100052 ', '中国传统玉文化与美玉鉴赏', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (53, '100053', '音乐课1', '05', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (54, '100054', '文物精品与中华文明', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (55, '100055', '舞蹈课1', '05', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (56, '100056', '运筹学', '01', '高一出版社', NULL, NULL, NULL, 0, NULL, '2020-05-02 22:46:51');
INSERT INTO `tb_course_info` VALUES (57, '100057', '概率论', '01', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (58, '100058', '数据结构', '01', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (59, '100059', '信息管理学概论', '01', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (60, '100060', '	军事理论', '01', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (61, '100061', '	计算机语言（C）', '01', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (62, '100062', '滴定操作', '03', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (63, '100063', '解剖学', '03', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (64, '100064', '化学反应速率与化学能', '03', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (65, '100065', '舞蹈课2', '05', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (66, '100066', '溶液的配置', '03', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (67, '100067', '配合物', '03', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (68, '100069', '不负卿春-大学生职业生涯规划', '02', '测试测试', NULL, NULL, '测试添加', 0, '2020-06-03 21:51:14', NULL);
INSERT INTO `tb_course_info` VALUES (69, '100070', '信息技术基础2', '01', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (70, '100071', '信息技术基础2（上机）', '01', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (71, '100072', '	统计学', '01', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (72, '100073', '解码国家安全', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (73, '100074', '	3D打印技术与应用', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (74, '100075', '汽车行走的艺术', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (75, '100076', '	大学生劳动就业法律问题解读', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for tb_course_plan
-- ----------------------------
DROP TABLE IF EXISTS `tb_course_plan`;
CREATE TABLE `tb_course_plan`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `grade_no` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '年级编号',
  `class_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级编号',
  `course_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程编号',
  `teacher_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '讲师编号',
  `classroom_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教室编号',
  `class_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上课时间',
  `weeks_sum` int(0) NULL DEFAULT NULL COMMENT '周数',
  `semester` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学期',
  `deleted` tinyint(1) NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_course_plan
-- ----------------------------
INSERT INTO `tb_course_plan` VALUES (1, '01', '20210301', '100001', '10010', '01-401', '13', NULL, '2021-2022-1', 0, NULL, NULL);
INSERT INTO `tb_course_plan` VALUES (2, '01', '20210301', '100001', '10010', '01-201', '22', NULL, '2021-2022-1', 0, NULL, NULL);
INSERT INTO `tb_course_plan` VALUES (3, '01', '20210301', '100056', '10048', '01-204', '21', NULL, '2021-2022-1', 0, NULL, NULL);
INSERT INTO `tb_course_plan` VALUES (4, '01', '20210301', '100056', '10048', '01-105', '06', NULL, '2021-2022-1', 0, NULL, NULL);
INSERT INTO `tb_course_plan` VALUES (5, '01', '20210301', '100005', '10043', '02-401', '20', NULL, '2021-2022-1', 0, NULL, NULL);
INSERT INTO `tb_course_plan` VALUES (6, '01', '20210401', '100001', '10010', '01-305', '03', NULL, '2021-2022-1', 0, NULL, NULL);
INSERT INTO `tb_course_plan` VALUES (7, '01', '20210401', '100001', '10010', '02-302', '02', NULL, '2021-2022-1', 0, NULL, NULL);
INSERT INTO `tb_course_plan` VALUES (8, '01', '20210401', '100033', '10012', '02-101', '07', NULL, '2021-2022-1', 0, NULL, NULL);
INSERT INTO `tb_course_plan` VALUES (9, '01', '20210401', '100033', '10012', '01-503', '21', NULL, '2021-2022-1', 0, NULL, NULL);
INSERT INTO `tb_course_plan` VALUES (10, '01', '20210401', '100004', '10013', '02-202', '12', NULL, '2021-2022-1', 0, NULL, NULL);
INSERT INTO `tb_course_plan` VALUES (11, '01', '20210401', '100005', '10014', '01-401', '22', NULL, '2021-2022-1', 0, NULL, NULL);
INSERT INTO `tb_course_plan` VALUES (12, '01', '20210401', '100051', '10016', '12-104', '08', NULL, '2021-2022-1', 0, NULL, NULL);
INSERT INTO `tb_course_plan` VALUES (13, '01', '20210401', '100058', '10017', '02-104', '09', NULL, '2021-2022-1', 0, NULL, NULL);
INSERT INTO `tb_course_plan` VALUES (14, '01', '20210401', '100058', '10017', '01-304', '16', NULL, '2021-2022-1', 0, NULL, NULL);
INSERT INTO `tb_course_plan` VALUES (15, '01', '20210401', '100071', '10018', '08-104', '18', NULL, '2021-2022-1', 0, NULL, NULL);
INSERT INTO `tb_course_plan` VALUES (16, '01', '20210401', '100070', '10019', '01-402', '20', NULL, '2021-2022-1', 0, NULL, NULL);
INSERT INTO `tb_course_plan` VALUES (17, '01', '20210401', '100070', '10019', '02-304', '25', NULL, '2021-2022-1', 0, NULL, NULL);
INSERT INTO `tb_course_plan` VALUES (18, '01', '20210401', '100061', '10020', '01-101', '17', NULL, '2021-2022-1', 0, NULL, NULL);
INSERT INTO `tb_course_plan` VALUES (19, '01', '20210401', '100061', '10020', '01-404', '04', NULL, '2021-2022-1', 0, NULL, NULL);
INSERT INTO `tb_course_plan` VALUES (20, '01', '20210401', '100029', '10021', '02-102', '10', NULL, '2021-2022-1', 0, NULL, NULL);
INSERT INTO `tb_course_plan` VALUES (21, '01', '20210401', '100016', '10033', '02-301', '19', NULL, '2021-2022-1', 0, NULL, NULL);
INSERT INTO `tb_course_plan` VALUES (22, '01', '20210401', '100016', '10033', '02-203', '11', NULL, '2021-2022-1', 0, NULL, NULL);

-- ----------------------------
-- Table structure for tb_grade_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_grade_info`;
CREATE TABLE `tb_grade_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id,年级表',
  `grade_no` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年级编号',
  `grade_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年级名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_grade_info
-- ----------------------------
INSERT INTO `tb_grade_info` VALUES (1, '01', '大一');
INSERT INTO `tb_grade_info` VALUES (2, '02', '大二');
INSERT INTO `tb_grade_info` VALUES (3, '03', '大三');
INSERT INTO `tb_grade_info` VALUES (4, '04', '大四');

-- ----------------------------
-- Table structure for tb_location_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_location_info`;
CREATE TABLE `tb_location_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id,位置信息，高一在哪栋楼，高二在哪',
  `teachbuild_no` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教学楼编号,放教学楼表中编号',
  `grade_no` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年级编号,放年级表中的id',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_location_info
-- ----------------------------
INSERT INTO `tb_location_info` VALUES (1, '01', '01', 0, NULL, NULL);
INSERT INTO `tb_location_info` VALUES (2, '02', '02', 0, NULL, NULL);
INSERT INTO `tb_location_info` VALUES (15, '03', '03', 1, '2020-06-01 23:31:44', NULL);
INSERT INTO `tb_location_info` VALUES (16, '03', '03', 1, '2020-06-01 23:38:11', NULL);
INSERT INTO `tb_location_info` VALUES (17, '03', '03', 0, '2020-06-01 23:39:52', NULL);
INSERT INTO `tb_location_info` VALUES (18, '04', '04', 0, '2022-04-24 14:15:12', NULL);
INSERT INTO `tb_location_info` VALUES (19, '05', '03', 1, '2022-04-24 14:15:16', NULL);
INSERT INTO `tb_location_info` VALUES (20, '05', '05', 1, '2022-04-24 14:15:48', NULL);
INSERT INTO `tb_location_info` VALUES (21, '02', '01', 0, '2022-05-01 18:30:01', NULL);

-- ----------------------------
-- Table structure for tb_student
-- ----------------------------
DROP TABLE IF EXISTS `tb_student`;
CREATE TABLE `tb_student`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '学生id',
  `student_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号，可以用于登录',
  `username` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称，可以用于登录',
  `password` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `realname` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `user_type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '标记用户类型3',
  `grade` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年级',
  `class_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在班级',
  `age` int(0) NULL DEFAULT NULL COMMENT '年龄',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前住址',
  `telephone` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '账号状态,0为正常，1为封禁',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_student
-- ----------------------------
INSERT INTO `tb_student` VALUES (1, '2020011234', 'lequal', '123456', '梁同学', 4, '大一', '20210401', 18, '广西桂林市桂林电子科技大学附属中学', '13677731236', 'course@guet.com', NULL, '按时上课', 0, 0, '2020-02-24 10:24:58', '2020-03-06 10:25:04');
INSERT INTO `tb_student` VALUES (2, '2019021541', 'litongxue', '123456', '李同学', 4, '大一', '20210401', 22, '广西桂林市', '15177989514', 'course@guet.com', NULL, '好好学习', 0, 0, '2020-03-10 20:51:26', '2020-04-06 14:32:22');
INSERT INTO `tb_student` VALUES (3, '2020031235', 'gantongxue', '123456', '甘同学', 4, '大一', '20210401', 19, '湖北省武汉市', '17007891233', 'course@guet.com', NULL, '天天向上', 0, 1, '2020-03-07 20:52:17', NULL);
INSERT INTO `tb_student` VALUES (4, '2020012589', 'xitongxue', '123456', '喜同学', 4, '大一', '20210401', 21, '广东省珠海市', '13677731456', 'course@guet.com', NULL, '找工作中', 0, 0, NULL, NULL);
INSERT INTO `tb_student` VALUES (5, '2020017895', 'huangtongxue', '123456', '黄同学', 4, '大一', '20210401', 20, '广西钦州市', '17689541452', 'course@guet.com', NULL, '技术强才是真的强', 0, 1, NULL, NULL);
INSERT INTO `tb_student` VALUES (6, '2020017836', 'caitongxue', '123456', '蔡同学', 4, '大一', '20210401', 18, '广西玉林', '18574562587', 'course@guet.com', NULL, '是时候好好学习了', 0, 0, NULL, NULL);
INSERT INTO `tb_student` VALUES (7, '2020021936', 'suntongxue', '123456', '孙同学', 4, '大一', '20210401', 17, '湖南长沙', '18648983826', 'course@guet.com', NULL, '加油咯', 0, 0, NULL, NULL);
INSERT INTO `tb_student` VALUES (8, '2020031245', 'hutongxue', '123456', '胡同学', 4, '大一', '20210401', 19, '湖北十堰', '17505127841', 'course@guet.com', NULL, '嘿嘿', 0, 0, NULL, NULL);
INSERT INTO `tb_student` VALUES (9, '2020031278', 'litongxue2', '123456', '黎同学', 4, '大一', '20210401', 17, '安徽省', '13412596654', 'course@guet.com', NULL, '做喜欢做的事', 0, 0, NULL, NULL);
INSERT INTO `tb_student` VALUES (10, '2020014596', 'shitongxue', '123456', '史同学', 4, '大一', '20210401', 18, '广西贵港', '13644527789', 'course@guet.com', NULL, '高一的同学', 0, 0, NULL, NULL);
INSERT INTO `tb_student` VALUES (11, '2020024567', 'xiaotongxue', '123456', '萧同学', 4, '大一', '20210401', 17, '广东珠海', '13677735445', 'course@guet.com', NULL, '高二同学', 0, 0, NULL, NULL);
INSERT INTO `tb_student` VALUES (12, '2020021456', 'student', '123456', '谭同学', 4, '大一', '20210401', 19, '广东汕头', '13677735559', 'course@guet.com', NULL, '高二8班', 0, 0, NULL, NULL);
INSERT INTO `tb_student` VALUES (13, '2020034123', 'studens', '123456', '王同学', 4, '大一', '20210401', 22, '广东深圳', '17007895623', 'course@guet.com', NULL, NULL, 0, 0, NULL, '2020-05-02 21:44:02');
INSERT INTO `tb_student` VALUES (14, '2020035468', 'liangyike', '123456', '梁同学', 4, '大一', '20210401', 20, '广西桂林市', '13677731235', 'course@guet.com', NULL, NULL, 0, 0, '2020-03-26 22:57:04', '2020-04-06 14:52:37');
INSERT INTO `tb_student` VALUES (15, '2020016788', 'xiewutong', '123456', '谢童鞋', 4, '大一', '20210401', 16, '湖南省衡阳市', '15177959816', 'course@guet.com', NULL, NULL, 0, 0, '2020-03-26 23:15:06', NULL);
INSERT INTO `tb_student` VALUES (16, '2020024182', 'qintongxue', '123456', '覃同学', 4, '大一', '20210401', 17, '广西桂平市', '18565412563', 'course@guet.com', NULL, NULL, 0, 0, '2020-03-26 23:18:02', NULL);
INSERT INTO `tb_student` VALUES (17, '2020028242', 'lian', '123456', '梁先生', 4, '大一', '20210401', 17, '广东中山', '17585968745', 'course@guet.com', NULL, NULL, 0, 0, '2020-03-26 23:20:29', '2020-05-02 21:44:19');
INSERT INTO `tb_student` VALUES (18, '2020038300', 'jiangtongxue', '123456', '蒋同学', 4, '大一', '20210401', 18, '广东省佛山市', '13596857412', 'jiang@guet.com', NULL, NULL, 0, 0, '2020-03-26 23:25:11', '2020-04-06 14:49:22');
INSERT INTO `tb_student` VALUES (19, '2020027623', 'ganxiansheng', '123456', '甘先生', 4, '大一', '20210401', 17, '广西百色', '17015789654', 'course@guet.com', NULL, NULL, 0, 0, '2020-03-26 23:26:20', NULL);
INSERT INTO `tb_student` VALUES (20, '2020027807', '2020027623', '123456', '王', 4, '大一', '20210401', 17, '上海市', '15678415241', 'course@guet.com', NULL, NULL, 0, 0, '2020-03-26 23:27:40', '2020-06-01 10:20:42');
INSERT INTO `tb_student` VALUES (21, '2020022351', '小幸运', '123456', '陈奕迅', 4, '大一', '20210401', 18, '广东省珠海市金湾区', '15177959814', NULL, NULL, NULL, 0, 0, '2020-05-20 17:11:25', NULL);
INSERT INTO `tb_student` VALUES (22, '2020035084', '马同学', '123456', '马东良', 4, '大一', '20210401', 19, '广西贵港市', '15177959814', 'ma.dl@qq.com', NULL, NULL, 0, 0, '2020-06-01 10:40:30', '2020-06-01 12:25:22');
INSERT INTO `tb_student` VALUES (23, '2020011062', '黄华斌', 'aizai2015', '黄华', 4, '大一', '20210401', 14, '广西贵港市', '15678675545', NULL, NULL, NULL, 0, 0, '2020-06-01 10:54:42', NULL);
INSERT INTO `tb_student` VALUES (24, '2020021158', '梁丙光', 'aizai2015', '梁丙光', 4, '大一', '20210401', 14, '广西', '15177959814', '1576070851@qq.com', NULL, NULL, 0, 0, '2020-06-01 10:57:45', NULL);
INSERT INTO `tb_student` VALUES (25, '2020014949', 'registerTest', '123456', '我是测试用户', 4, '大一', '20210401', 14, '桂电', '13677731234', 'test@qq.com', NULL, NULL, 0, 0, '2020-06-06 18:16:27', NULL);
INSERT INTO `tb_student` VALUES (26, '2022013155', 'chen', 'Chq.5247L247', '陈小神', 4, '大一', '20210401', 22, 'xxx', '22233322212', '223333@qq.com', NULL, NULL, 0, 0, '2022-03-09 16:05:48', '2022-03-09 16:07:01');
INSERT INTO `tb_student` VALUES (27, '2022025802', '111', '123456', '1', 3, '大二', NULL, NULL, '1', '1', '1', NULL, NULL, 1, 0, '2022-05-28 09:32:02', NULL);
INSERT INTO `tb_student` VALUES (28, '2022012836', 's11', '123456', '111', 3, '大一', NULL, NULL, '', '', '', NULL, NULL, 1, 0, '2022-05-28 09:34:36', NULL);
INSERT INTO `tb_student` VALUES (29, '2022013390', '11222', '123456', '11', 3, '大一', NULL, NULL, '', '', '', NULL, NULL, 1, 0, '2022-05-28 09:35:08', NULL);
INSERT INTO `tb_student` VALUES (30, '2022017754', '1111', '123456', '111', 3, '大一', NULL, NULL, '', '', '', NULL, NULL, 1, 0, '2022-05-28 11:10:22', NULL);
INSERT INTO `tb_student` VALUES (31, '2022018731', '11888', '123456', '8', 3, '大一', NULL, NULL, '', '', '', NULL, NULL, 1, 0, '2022-05-28 11:11:14', NULL);

-- ----------------------------
-- Table structure for tb_study_logs
-- ----------------------------
DROP TABLE IF EXISTS `tb_study_logs`;
CREATE TABLE `tb_study_logs`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '学生学习记录表',
  `student_id` int(0) NULL DEFAULT NULL COMMENT '学生id',
  `online_course_id` int(0) NULL DEFAULT NULL COMMENT '网课id',
  `online_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网课名称',
  `video_id` int(0) NULL DEFAULT NULL COMMENT '看到哪个视频了',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_study_logs
-- ----------------------------

-- ----------------------------
-- Table structure for tb_teach_build_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_teach_build_info`;
CREATE TABLE `tb_teach_build_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id,教学楼信息表',
  `teach_build_no` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教学楼编号',
  `teach_build_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教学楼名称',
  `teach_build_location` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教学楼位置',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_teach_build_info
-- ----------------------------
INSERT INTO `tb_teach_build_info` VALUES (1, '01', '1号教学楼0', '1校区', 0, NULL, '2020-04-10 21:51:09');
INSERT INTO `tb_teach_build_info` VALUES (2, '02', '2号教学楼', '1校区', 0, NULL, NULL);
INSERT INTO `tb_teach_build_info` VALUES (3, '03', '3号教学楼', '1校区', 0, NULL, '2022-05-27 17:13:28');
INSERT INTO `tb_teach_build_info` VALUES (4, '04', '4号教学楼', '2校区', 0, NULL, '2022-05-27 17:13:38');
INSERT INTO `tb_teach_build_info` VALUES (5, '05', '5号教学楼', '2校区', 0, NULL, '2022-05-27 17:14:11');
INSERT INTO `tb_teach_build_info` VALUES (6, '06', '音乐楼', '1校区', 1, NULL, NULL);
INSERT INTO `tb_teach_build_info` VALUES (7, '07', '美术楼', '1校区', 1, NULL, NULL);
INSERT INTO `tb_teach_build_info` VALUES (8, '08', '实验楼1', '1校区', 0, NULL, NULL);
INSERT INTO `tb_teach_build_info` VALUES (9, '09', '实验楼2', '2校区', 0, NULL, '2022-05-27 17:14:21');
INSERT INTO `tb_teach_build_info` VALUES (10, '10', '逸夫楼1', '1校区', 0, NULL, NULL);
INSERT INTO `tb_teach_build_info` VALUES (11, '11', '逸夫楼2', '2校区', 0, NULL, '2022-05-27 17:14:33');
INSERT INTO `tb_teach_build_info` VALUES (12, '12', '体育楼', '1校区', 0, NULL, NULL);
INSERT INTO `tb_teach_build_info` VALUES (13, '13', '化生楼', '1校区', 0, NULL, NULL);
INSERT INTO `tb_teach_build_info` VALUES (14, '14', '14号教学楼', '2校区', 1, '2020-03-23 00:05:03', NULL);
INSERT INTO `tb_teach_build_info` VALUES (15, '20', '测试楼', '花江校区', 1, '2020-06-02 11:58:16', NULL);
INSERT INTO `tb_teach_build_info` VALUES (16, '55', '55', '55', 1, '2022-05-26 14:19:54', NULL);
INSERT INTO `tb_teach_build_info` VALUES (17, '11', 'xsxss', 'xsxs', 1, '2022-05-26 14:21:47', '2022-05-26 14:21:54');
INSERT INTO `tb_teach_build_info` VALUES (18, '33', 'ww', 'ww44', 1, '2022-05-26 14:24:39', '2022-05-26 14:24:45');

-- ----------------------------
-- Table structure for tb_teacher
-- ----------------------------
DROP TABLE IF EXISTS `tb_teacher`;
CREATE TABLE `tb_teacher`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id，讲师表',
  `teacher_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师编号',
  `username` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称（用户名）',
  `password` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `realname` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `user_type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '用户类型',
  `jobtitle` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称',
  `grade_no` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属年级',
  `license` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件照(地址)',
  `teach` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教授科目',
  `age` int(0) NULL DEFAULT NULL COMMENT '年龄',
  `telephone` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `avatar` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述（签名）',
  `power` tinyint(1) NULL DEFAULT 1 COMMENT '操作权限',
  `piority` int(0) NULL DEFAULT NULL COMMENT '优先级',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '账号状态',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_teacher
-- ----------------------------
INSERT INTO `tb_teacher` VALUES (1, '10010', 'lequal(梁老师)', 'aizai2015', '梁晓明', 2, '教务处副主任', '01', NULL, '100001', 33, '13677731235', 'teacher@guet.com', '广西', NULL, '以身作则，教育好学生。', 1, 1, 0, 0, '2020-03-04 15:30:03', '2020-03-06 15:30:30');
INSERT INTO `tb_teacher` VALUES (3, '10012', 'msLi', 'lixuexue', '李雪雪', 2, '高级讲师', '01', NULL, '100002', 29, '13677731235', 'teacher@guet.com', '广西桂林市桂林电子科技大学', NULL, '做人民的好教师', 1, 2, 0, 0, '2020-03-06 23:39:39', '2020-03-06 23:39:39');
INSERT INTO `tb_teacher` VALUES (5, '10013', 'mswang', '123456', '王小芳', 2, '初级讲师', '01', NULL, '100003', 25, '13677731235', 'teacher@guet.com', '湖南省', NULL, '过好每一天', 1, 3, 0, 0, '2020-03-04 19:45:44', '2020-03-08 19:45:51');
INSERT INTO `tb_teacher` VALUES (6, '10014', 'mssun', '123456', '孙晓明', 2, '中级讲师', '01', NULL, '100033', 28, '13677731235', 'teacher@guet.com', '湖北省', NULL, '加油', 1, 2, 0, 0, '2020-03-06 19:47:11', '2020-03-30 19:47:14');
INSERT INTO `tb_teacher` VALUES (7, '10015', 'msming', '123456', '孙振东', 2, '实习生', '01', NULL, '100004', 22, '13677731235', 'teacher@guet.com', '江苏省', NULL, 'welcome', 1, 4, 0, 0, '2020-03-05 19:48:40', '2020-03-06 19:48:45');
INSERT INTO `tb_teacher` VALUES (8, '10016', 'mstan', '123456', '谭老师', 2, '初级讲师', '01', NULL, '100005', 23, '13677731235', 'teacher@guet.com', '广西', NULL, 'come on', 1, 3, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (9, '10017', 'msliang', '123456', '梁老师', 2, '高级讲师', '01', NULL, '100006', 32, '13677731235', 'teacher@guet.com', '河北', NULL, '做更好的自己', 1, 1, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (10, '10018', 'mrliang', '123456', '梁忠诚', 2, '高级讲师', '01', NULL, '100007', 35, '13677731235', 'teacher@guet.com', '湖北', NULL, '数学好', 1, 1, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (11, '10019', 'mrwang', '123456', '汪莉莉', 2, '中级讲师', '01', NULL, '100056', 33, '13677731235', 'teacher@guet.com', '河北', NULL, '地理好', 1, 2, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (12, '10020', 'mshu', '123456', '胡冬梅', 2, '中级讲师', '01', NULL, '100008', 46, '13677731235', 'teacher@guet.com', '搜索', NULL, '是', 1, 2, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (13, '10021', 'mrlin', '123456', '林俊杰', 2, '初级讲师', '01', NULL, '100009', 41, '13677731235', 'teacher@guet.com', '试试', NULL, '就', 1, 3, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (14, '10022', 'mrzhou', '123456', '周杰伦', 2, '高级讲师', '01', NULL, '100010', 39, '13677731235', 'teacher@guet.com', '看看', NULL, '看', 1, 1, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (15, '10023', 'mrwang', '123456', '张靓颖', 2, '初级讲师', '01', NULL, '100011', 33, '13677731235', 'teacher@guet.com', '55', NULL, '555', 1, 3, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (16, '10024', 'mrhou', '123456', '侯德南', 2, '高级讲师', '01', NULL, '100012', 37, '13677731235', 'teacher@guet.com', '54546', NULL, '8878878', 1, 1, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (17, '10025', 'mrzhang', '123456', '张德良', 2, '高级讲师', '01', NULL, '100013', 34, '13677731235', 'teacher@guet.com', '78788', '', '878755', 1, 1, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (18, '10026', 'mrzhang', '123456', '张勇', 2, '中级讲师', '02', NULL, '100014', 45, '13677731235', 'teacher@guet.com', '湖南', NULL, '565675', 1, 2, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (19, '10027', '马老师', '123456', '马晓东', 2, '初级讲师', '02', NULL, '100015', 28, '13677731235', 'teacher@guet.com', '海南', NULL, '78688787', 1, 3, 0, 0, NULL, '2020-04-11 14:33:58');
INSERT INTO `tb_teacher` VALUES (20, '10028', '马老师', '123456', '马芸', 2, '中级讲师', '02', NULL, '100016', 29, '13677731235', 'teacher@guet.com', '河北省邢台市', NULL, '5654', 1, 2, 0, 0, NULL, '2020-04-05 21:10:11');
INSERT INTO `tb_teacher` VALUES (21, '10029', '郑老师', '123456', '郑小红', 2, '高级讲师', '02', NULL, '100017', 32, '13677731235', 'teacher@guet.com', '河南', NULL, '768567', 1, 1, 0, 0, NULL, '2020-04-11 14:33:47');
INSERT INTO `tb_teacher` VALUES (22, '10030', '韦老师', '123456', '韦小龙', 2, '中级讲师', '02', NULL, '100018', 33, '13677731235', 'teacher@guet.com', '江苏', NULL, '6875675', 1, 2, 0, 0, NULL, '2020-04-11 14:30:24');
INSERT INTO `tb_teacher` VALUES (23, '10031', '张老师', '123456', '张小龙', 2, '高级讲师', '02', NULL, '100019', 35, '13677731235', 'teacher@guet.com', '福建', NULL, '6785675', 1, 1, 0, 0, NULL, '2020-04-11 14:29:48');
INSERT INTO `tb_teacher` VALUES (24, '10032', '谭老师', '123456', '谭晓江', 2, '高级讲师', '02', NULL, '100020', 33, '13677731235', 'teacher@guet.com', '贵州', NULL, '78678', 1, 1, 0, 0, NULL, '2020-04-11 14:29:29');
INSERT INTO `tb_teacher` VALUES (25, '10033', '韩老师', '123456', '韩云', 2, '高级讲师', '02', NULL, '100021', 32, '13677731235', 'teacher@guet.com', '新疆', NULL, '67767', 1, 1, 0, 0, NULL, '2020-04-11 14:29:20');
INSERT INTO `tb_teacher` VALUES (26, '10034', '韦老师', '123456', '韦雪琪', 2, '中级讲师', '02', NULL, '100022', 28, '13677731235', 'teacher@guet.com', '贵州省贵阳市', NULL, NULL, 1, NULL, 0, 0, NULL, '2020-04-05 21:00:36');
INSERT INTO `tb_teacher` VALUES (27, '10046', '黄老师', '123456', '黄继光', 2, '高级讲师', '02', 'https://arrange.oss-cn-shenzhen.aliyuncs.com/timg.jfif', '100023', 31, '13677731235', 'huang@guet.com', '西藏', NULL, '6756', 1, 1, 0, 0, NULL, '2020-04-11 14:29:00');
INSERT INTO `tb_teacher` VALUES (28, '10035', '张老师', '123456', '张三封', 2, '高级讲师', '03', NULL, '100024', 33, '13677731235', 'teacher@guet.com', '甘肃', NULL, '7567', 1, 1, 0, 0, NULL, '2020-04-11 14:28:44');
INSERT INTO `tb_teacher` VALUES (29, '10036', '胡老师', '123456', '胡小小', 2, '高级讲师', '03', NULL, '100025', 33, '13677731235', 'teacher@guet.com', '广西', NULL, '5675467', 1, 1, 0, 0, NULL, '2020-04-11 14:28:16');
INSERT INTO `tb_teacher` VALUES (30, '10037', '莫老师', '123456', '莫小新', 2, '高级讲师', '03', NULL, '100026', 33, '13677731235', 'teacher@guet.com', '河北石家庄市', NULL, '7867', 1, 1, 0, 0, NULL, '2020-04-11 14:26:18');
INSERT INTO `tb_teacher` VALUES (31, '10038', '甘老师', '123456', '甘楠', 2, '高级讲师', '03', NULL, '100027', 33, '13677731235', 'teacher@guet.com', '北京', NULL, '5644', 1, 1, 0, 0, NULL, '2020-04-05 20:59:08');
INSERT INTO `tb_teacher` VALUES (32, '10039', '江老师', '123456', '江晓东', 2, '高级讲师', '03', NULL, '100028', 40, '13677731235', 'teacher@guet.com', '广东省中山市', NULL, '22222', 1, 1, 0, 0, NULL, '2020-04-05 20:26:13');
INSERT INTO `tb_teacher` VALUES (33, '10040', '夏老师', '123456', '夏紫若', 2, '高级讲师', '03', NULL, '100029', 33, '13677731235', 'teacher@guet.com', '广东省深圳市', NULL, '6758', 1, 1, 0, 0, NULL, '2020-04-05 20:22:34');
INSERT INTO `tb_teacher` VALUES (34, '10041', '张老师', '123456', '张杰', 2, '高级讲师', '03', NULL, '100030', 31, '13677731235', 'teacher@guet.com', '上海', NULL, '999999', 1, 1, 0, 0, NULL, '2020-04-05 18:16:19');
INSERT INTO `tb_teacher` VALUES (35, '10042', '谭老师', '123456', '谭咏麟', 2, '高级讲师', '03', NULL, '100031', 32, '13677731235', 'teacher@guet.com', '天津', NULL, '5353', 1, 1, 0, 0, NULL, '2020-04-05 18:04:37');
INSERT INTO `tb_teacher` VALUES (36, '10043', '王老师', '123456', '王杰', 2, '高级讲师', '03', NULL, '100032', 33, '13677731235', 'teacher@guet.com', '湖北省武汉市', NULL, '543453', 1, 1, 0, 0, NULL, '2020-04-05 18:04:09');
INSERT INTO `tb_teacher` VALUES (38, '10044', '吴老师', '123456', '吴天盛', 2, '高级讲师', '03', NULL, '100033', 32, '13677731235', 'teacher@guet.com', '福建省福州市', NULL, NULL, 1, NULL, 0, 0, '2020-05-18 21:56:41', NULL);
INSERT INTO `tb_teacher` VALUES (39, '10045', '江老师', '123456', '江小陆', 2, '中级讲师', '03', 'https://arrange.oss-cn-shenzhen.aliyuncs.com/timg.gif', '100034', 37, '13677731235', 'teacher@guet.com', '甘肃省兰州市', NULL, NULL, 1, NULL, 0, 0, '2020-05-18 22:02:25', '2020-05-19 09:19:05');
INSERT INTO `tb_teacher` VALUES (40, '10047', '马东锡', '123456', '马东锡', 2, '高级讲师', NULL, 'https://arrange.oss-cn-shenzhen.aliyuncs.com/timg.gif', '100035', 35, '13677731234', 'madx@guet.com', '广西河池市', NULL, NULL, 1, NULL, 0, 0, '2020-06-01 10:35:18', '2020-06-01 10:39:05');
INSERT INTO `tb_teacher` VALUES (41, '10048', '黄讲师', '123456', '黄桐', 2, '初级讲师', NULL, 'https://arrange.oss-cn-shenzhen.aliyuncs.com/timg (2).jfif', '100036', 32, '13677731235', 'tong@qq.com', '广西贵港市', NULL, NULL, 1, NULL, 0, 0, '2020-06-01 14:38:57', '2020-06-01 14:49:25');
INSERT INTO `tb_teacher` VALUES (42, '10049', '王刚', '123456', '王刚', 2, '高级讲师', NULL, 'https://arrange.oss-cn-shenzhen.aliyuncs.com/timg (1).jfif', '100037', 36, '18890786676', 'gang.w@qq.com', '广西壮族自治区贺州市', NULL, NULL, 1, NULL, 0, 0, '2020-06-01 14:53:56', '2020-06-05 15:30:43');
INSERT INTO `tb_teacher` VALUES (43, '10050', '黄三毛', '123456', '黄三毛', 2, '高级讲师', NULL, NULL, '100038', 34, '15876765634', 'huang@guet.com', '广东省汕头市', NULL, NULL, 1, NULL, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (44, '10051', '燕双赢', '123456', '燕双鹰', 2, '中级讲师', NULL, NULL, '100039', 29, '13454349878', 'yan@guet.com', '山东省青岛市', NULL, NULL, 1, NULL, 0, 1, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (45, '10052', '陈大神', '123456', '陈大神', 2, '高级讲师', NULL, NULL, '100040', 25, '12365478951', '123546851@qq.com', '水水水水水水水', NULL, NULL, 1, NULL, 0, 0, '2022-03-09 14:33:59', NULL);

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expire` bigint(0) NULL DEFAULT NULL,
  `create_time` bigint(0) NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES (1, 'wddgsdfgsd02380r0rj0934uf239048uf204', 'asm', NULL, 1622185876036, 2);
INSERT INTO `token` VALUES (2, '7226d7b6636900bc46592cc4ad58a616', '1', NULL, 1626424280404, 1);
INSERT INTO `token` VALUES (3, 'ec5e009c067ebc05ee45d034e3547e16', '2', NULL, 1629336480668, 1);
INSERT INTO `token` VALUES (4, '36b84fab1b33f0060e1c6747303a968a', '1', NULL, 1629336497414, 1);
INSERT INTO `token` VALUES (5, '41cfdfe9390f707522d4d0e4ef0f56a3', '2', NULL, 1629336502172, 1);
INSERT INTO `token` VALUES (13, 'c8a05677a3e18b983cd92468debb279f', '123', NULL, 1629336511315, 1);
INSERT INTO `token` VALUES (17, '97fb9b26c35b856f996d5d1bdfe4f847', '123', NULL, 1629447724227, 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', 'admin', NULL, '18888888888');
INSERT INTO `user` VALUES (2, '1', '123456', '1', '2021-07-16 10:58:48', '1');
INSERT INTO `user` VALUES (3, 'test', '123456', 'test', '2021-08-17 11:41:37', '18273648593');

SET FOREIGN_KEY_CHECKS = 1;
