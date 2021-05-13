/*
Navicat MySQL Data Transfer

Source Server         : app
Source Server Version : 50552
Source Host           : localhost:3306
Source Database       : education

Target Server Type    : MYSQL
Target Server Version : 50552
File Encoding         : 65001

Date: 2017-08-03 16:14:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for edu_course
-- ----------------------------
DROP TABLE IF EXISTS `edu_course`;
CREATE TABLE `edu_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) NOT NULL,
  `course_type_code` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `student_num` int(11) NOT NULL,
  `begin_date` date DEFAULT NULL,
  `plan_end_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of edu_course
-- ----------------------------
INSERT INTO `edu_course` VALUES ('1', 'H5第4期', 'H5', '开课中', '32', '2017-07-29', '2017-07-29', '2017-07-29');
INSERT INTO `edu_course` VALUES ('2', 'H5第8期', 'H5', '开课中', '24', '2017-07-29', '2017-07-29', '2017-07-29');
INSERT INTO `edu_course` VALUES ('3', 'H5第10期', 'H5', '开课中', '18', '2017-07-29', '2017-07-29', '2017-07-29');
INSERT INTO `edu_course` VALUES ('4', 'H5第11期', 'H5', '开课中', '29', '2017-07-29', '2017-07-29', '2017-07-29');
INSERT INTO `edu_course` VALUES ('5', 'H5第12期', 'H5', '开课中', '32', '2017-07-29', '2017-07-29', '2017-07-29');
INSERT INTO `edu_course` VALUES ('6', 'H5第13期', 'H5', '开课中', '3', '2017-07-29', '2017-07-29', '2017-07-29');
INSERT INTO `edu_course` VALUES ('7', 'Java第1期', 'Java', '开课中', '7', '2017-07-29', '2017-07-29', '2017-07-29');
INSERT INTO `edu_course` VALUES ('8', 'Java第2期', 'Java', '开课中', '28', '2017-07-29', '2017-07-29', '2017-07-29');
INSERT INTO `edu_course` VALUES ('9', 'UI第一期', 'UI', '开课中', '11', '2017-07-29', '2017-07-29', '2017-07-29');

-- ----------------------------
-- Table structure for edu_course_report
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_report`;
CREATE TABLE `edu_course_report` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `course_date` date NOT NULL,
  `date_am` varchar(255) DEFAULT NULL,
  `date_pm` varchar(255) DEFAULT NULL,
  `date_ws` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of edu_course_report
-- ----------------------------

-- ----------------------------
-- Table structure for edu_teacher_report_day
-- ----------------------------
DROP TABLE IF EXISTS `edu_teacher_report_day`;
CREATE TABLE `edu_teacher_report_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `student_num` int(11) DEFAULT NULL,
  `course_stage` varchar(255) DEFAULT NULL,
  `report_content` text NOT NULL,
  `student_situation` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `report_date` date NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of edu_teacher_report_day
-- ----------------------------
INSERT INTO `edu_teacher_report_day` VALUES ('24', '2', '7', '8', '第一阶段', '1.吃饭\r\n2.睡觉\r\n3.打豆豆', '良好', '良好', '2017-07-31', '2017-07-31 19:08:44');
INSERT INTO `edu_teacher_report_day` VALUES ('25', '3', '2', '24', '第一阶段', '孙悟空告诉师父： 不要骑马，最近在刮台风，这时马容易出轨', '开心', '快乐', '2017-07-31', '2017-07-31 19:10:28');
INSERT INTO `edu_teacher_report_day` VALUES ('26', '10', '5', '26', '第一阶段', '1.bootstrap', '无', '无', '2017-07-31', '2017-07-31 19:10:28');
INSERT INTO `edu_teacher_report_day` VALUES ('27', '12', '7', '0', '第一阶段', '学习Java初级第25到27天的内容，明日计划：学习Java初级第26天', '', '', '2017-07-31', '2017-07-31 19:10:28');
INSERT INTO `edu_teacher_report_day` VALUES ('28', '5', '5', '20', '第一阶段', '弹性布局', '第一天交接，情况正常！！！', '哈哈', '2017-07-31', '2017-07-31 19:10:28');
INSERT INTO `edu_teacher_report_day` VALUES ('29', '8', '7', '27', '第一阶段', '线程thread', '', '', '2017-07-31', '2017-07-31 19:12:16');
INSERT INTO `edu_teacher_report_day` VALUES ('30', '13', '1', '33', '第四阶段', 'vue内容', 'aa', '', '2017-07-31', '2017-07-31 19:12:39');
INSERT INTO `edu_teacher_report_day` VALUES ('31', '5', '5', '0', '第一阶段', '周末打乒乓球、羽毛球', '学员身体素质太差了~ 打不动', '', '2017-07-30', '2017-07-31 19:12:45');
INSERT INTO `edu_teacher_report_day` VALUES ('32', '12', '1', '2', '第四阶段', '随便写随便写随便写', '都很正常啊', '', '2017-07-30', '2017-07-31 19:13:04');
INSERT INTO `edu_teacher_report_day` VALUES ('33', '3', '2', '24', '第三阶段', '吹台风', '好', '喝', '2017-07-30', '2017-07-31 19:13:59');

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `resource_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(100) NOT NULL,
  `resource_type_code` varchar(50) NOT NULL,
  `resource_url` varchar(200) DEFAULT NULL,
  `parent_id` bigint(20) NOT NULL,
  `parent_ids` varchar(100) NOT NULL,
  `resource_permission` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`resource_id`),
  KEY `sys_resource_nk1` (`parent_id`) USING BTREE,
  KEY `sys_resource_nk2` (`parent_ids`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('1', '用户管理', 'MENU', '/system/user', '0', '0/', 'user:*');
INSERT INTO `sys_resource` VALUES ('2', '用户新增', 'BUTTON', '', '1', '0/1/', 'user:create');
INSERT INTO `sys_resource` VALUES ('3', '用户修改', 'BUTTON', '', '1', '0/1/', 'user:edit');
INSERT INTO `sys_resource` VALUES ('4', '用户删除', 'BUTTON', '', '1', '0/1/', 'user:delete');
INSERT INTO `sys_resource` VALUES ('5', '用户查看', 'BUTTON', '', '1', '0/1/', 'user:view');
INSERT INTO `sys_resource` VALUES ('6', '资源管理', 'MENU', '/system/resource', '0', '0/', 'menu:resource');
INSERT INTO `sys_resource` VALUES ('7', '资源新增', 'BUTTON', '', '6', '0/6/', 'resource:create');
INSERT INTO `sys_resource` VALUES ('8', '资源修改', 'BUTTON', '', '6', '0/6/', 'resource:edit');
INSERT INTO `sys_resource` VALUES ('9', '资源删除', 'BUTTON', '', '6', '0/6/', 'resource:delete');
INSERT INTO `sys_resource` VALUES ('10', '资源查看', 'BUTTON', '', '6', '0/6/', 'resource:view');
INSERT INTO `sys_resource` VALUES ('11', '角色管理', 'MENU', '/system/role', '0', '0/', 'role:*');
INSERT INTO `sys_resource` VALUES ('12', '角色新增', 'BUTTON', '', '11', '0/11/', 'role:create');
INSERT INTO `sys_resource` VALUES ('13', '角色修改', 'BUTTON', '', '11', '0/11/', 'role:edit');
INSERT INTO `sys_resource` VALUES ('14', '角色删除', 'BUTTON', '', '11', '0/11/', 'role:delete');
INSERT INTO `sys_resource` VALUES ('15', '角色查看', 'BUTTON', '', '11', '0/11/', 'role:view');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL,
  `role_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `sys_role_uk` (`role_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理员', '系统管理员');
INSERT INTO `sys_role` VALUES ('2', '普通用户', '普通用户');

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `resource_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_role_resource_uk1` (`role_id`,`resource_id`),
  KEY `sys_role_resource_nk1` (`role_id`) USING BTREE,
  KEY `sys_role_resource_nk2` (`resource_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------
INSERT INTO `sys_role_resource` VALUES ('1', '2', '1');
INSERT INTO `sys_role_resource` VALUES ('2', '2', '2');
INSERT INTO `sys_role_resource` VALUES ('3', '2', '3');
INSERT INTO `sys_role_resource` VALUES ('4', '2', '4');
INSERT INTO `sys_role_resource` VALUES ('5', '2', '5');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(100) NOT NULL,
  `account_type_code` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `salt` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `sys_user_uk1` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'administrator', '系统管理员', '691cc147ec1e00c3295e1f30bfb142a3', 'ak47');
INSERT INTO `sys_user` VALUES ('2', 'lijike', 'teacher', '李纪科', '691cc147ec1e00c3295e1f30bfb142a3', 'ak47');
INSERT INTO `sys_user` VALUES ('3', 'wutianxiang', 'teacher', '吴天祥', '691cc147ec1e00c3295e1f30bfb142a3', 'ak47');
INSERT INTO `sys_user` VALUES ('4', 'huangliumei', 'teacher', '黄六梅', '691cc147ec1e00c3295e1f30bfb142a3', 'ak47');
INSERT INTO `sys_user` VALUES ('5', 'yilimin', 'teacher', '易丽敏', '691cc147ec1e00c3295e1f30bfb142a3', 'ak47');
INSERT INTO `sys_user` VALUES ('6', 'zhuangwenlong', 'teacher', '庄文龙', '691cc147ec1e00c3295e1f30bfb142a3', 'ak47');
INSERT INTO `sys_user` VALUES ('7', 'wumenglong', 'teacher', '吴梦龙', '691cc147ec1e00c3295e1f30bfb142a3', 'ak47');
INSERT INTO `sys_user` VALUES ('8', 'zhouxin', 'teacher', '周鑫', '691cc147ec1e00c3295e1f30bfb142a3', 'ak47');
INSERT INTO `sys_user` VALUES ('9', 'linxiaoting', 'teacher', '林小婷', '691cc147ec1e00c3295e1f30bfb142a3', 'ak47');
INSERT INTO `sys_user` VALUES ('10', 'linshuyuan', 'teacher', '林淑媛', '691cc147ec1e00c3295e1f30bfb142a3', 'ak47');
INSERT INTO `sys_user` VALUES ('11', 'xieying', 'teacher', '谢莺', '691cc147ec1e00c3295e1f30bfb142a3', 'ak47');
INSERT INTO `sys_user` VALUES ('12', 'youqiaozhu', 'teacher', '尤巧珠', '691cc147ec1e00c3295e1f30bfb142a3', 'ak47');
INSERT INTO `sys_user` VALUES ('13', 'yinxuejiang', 'teacher', '尹学江', '691cc147ec1e00c3295e1f30bfb142a3', 'ak47');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_user_role_uk` (`user_id`,`role_id`) USING BTREE,
  KEY `sys_user_role_nk1` (`user_id`) USING BTREE,
  KEY `sys_user_role_nk2` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2', '2');
