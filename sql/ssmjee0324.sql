/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ssmjee

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2017-03-24 22:57:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_account
-- ----------------------------
DROP TABLE IF EXISTS `t_account`;
CREATE TABLE `t_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `type` int(2) DEFAULT '1' COMMENT '用户类型，1普通用户，2，管理员',
  `status` int(2) DEFAULT '1' COMMENT '用户状态1正常，0被封',
  `info_id` bigint(20) DEFAULT NULL COMMENT '详细信息id',
  `qq_id` varchar(100) DEFAULT NULL,
  `sina_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `info_id` (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7741658025049278521 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_account
-- ----------------------------
INSERT INTO `t_account` VALUES ('888888', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1', '1', '888887', null, null);
INSERT INTO `t_account` VALUES ('4278291043801448841', 'test02', 'e10adc3949ba59abbe56e057f20f883e', '1', '1', '950703264106233923', null, null);
INSERT INTO `t_account` VALUES ('7741658025049278520', 'test01', 'e10adc3949ba59abbe56e057f20f883e', '1', '1', '9145457015092889711', null, null);

-- ----------------------------
-- Table structure for t_account_role
-- ----------------------------
DROP TABLE IF EXISTS `t_account_role`;
CREATE TABLE `t_account_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `a_r_a` (`account_id`) USING BTREE,
  KEY `a_r_r` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4340631560512291284 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_account_role
-- ----------------------------
INSERT INTO `t_account_role` VALUES ('2', '888888', '888888');
INSERT INTO `t_account_role` VALUES ('3', '888888', '888889');
INSERT INTO `t_account_role` VALUES ('710878071881708170', '3254780209503356167', '5151440462543630679');
INSERT INTO `t_account_role` VALUES ('4340631560512291283', '3254780209503356167', '2995895662424734647');

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` varchar(32) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `sex` int(2) DEFAULT NULL,
  `id_card` varchar(20) DEFAULT NULL,
  `set_time` timestamp NULL DEFAULT NULL,
  `head` varchar(300) DEFAULT NULL COMMENT 'user head image',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('888887', 'Manager', '244556979@qq.com', '123456', '山东省 济南市 天桥区', '1', '37888820880808588X', '2015-04-24 14:59:12', '/images/headImage/1463825019924_head.jpg');
INSERT INTO `t_admin` VALUES ('9145457015092889711', 'test01', '2', '2', '2', '1', '2', '2016-11-05 16:29:33', '/images/account/default_head.jpg');
INSERT INTO `t_admin` VALUES ('950703264106233923', 'test02', null, null, null, null, null, '2017-01-22 11:48:54', '/images/account/default_head.jpg');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `id` varchar(32) NOT NULL,
  `content` text,
  `type` int(4) DEFAULT NULL,
  `set_time` timestamp NULL DEFAULT NULL,
  `account_id` varchar(32) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `method` varchar(500) DEFAULT NULL,
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('1121725249505637930', '修改权限', '1', '2017-03-20 08:00:34', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.power.PowerController.update()', '[{\"icon\":\"fa  fa-trash-o icon-state-danger\",\"id\":\"8501344847075980730\",\"intro\":\"\",\"name\":\"测试删除\",\"paramUrl\":\"role:delete\",\"parentId\":\"8981313088726911580\",\"powerCount\":0,\"sort\":0,\"type\":1,\"url\":\"role/delete\"}]');
INSERT INTO `t_log` VALUES ('134073602395096103', '添加角色', '1', '2016-11-05 11:19:43', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.power.RoleController.save()', '[com.elangzhi.ssm.model.Role@654e1610]');
INSERT INTO `t_log` VALUES ('1406624738854324042', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:test]', '0', '2016-11-04 10:39:06', '888888', '0', '127.0.0.1', '/role/delete', null);
INSERT INTO `t_log` VALUES ('1427145500578693599', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [admin:list]', '0', '2017-03-23 03:54:55', '888888', '0', '127.0.0.1', '/admin/list', 't=1490241295109&page=1&size=10');
INSERT INTO `t_log` VALUES ('1441018348036771803', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:test]', '0', '2016-11-04 13:37:28', '888888', '0', '127.0.0.1', '/role/delete', null);
INSERT INTO `t_log` VALUES ('1466530604515872704', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:list]', '0', '2017-03-23 03:36:57', '888888', '0', '127.0.0.1', '/role/list', 't=1490240216940&page=1&size=10');
INSERT INTO `t_log` VALUES ('1589851700886418521', '修改管理员', '1', '2017-03-24 13:14:59', '888888', '1', '0:0:0:0:0:0:0:1', 'com.jee.ssm.modules.ssm.controller.AdminController.update()', '[{\"address\":\"山东省 济南市 天桥区\",\"email\":\"244556979@qq.com\",\"head\":\"/images/headImage/1463825019924_head.jpg\",\"id\":\"888887\",\"idCard\":\"37888820880808588X\",\"name\":\"Manager\",\"phone\":\"123456\",\"sex\":0}]');
INSERT INTO `t_log` VALUES ('1611020573148528732', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:list]', '0', '2016-11-05 16:29:52', '7741658025049278520', '0', '127.0.0.1', '/role/list', null);
INSERT INTO `t_log` VALUES ('1626808271626259536', '修改权限', '1', '2017-03-20 08:04:57', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.power.PowerController.update()', '[{\"icon\":\"fa  fa-trash-o icon-state-danger\",\"id\":\"8501344847075980730\",\"intro\":\"111\",\"name\":\"测试删除\",\"paramUrl\":\"role:delete\",\"parentId\":\"8981313088726911580\",\"powerCount\":0,\"sort\":0,\"type\":1,\"url\":\"role/delete\"}]');
INSERT INTO `t_log` VALUES ('1674914833986272694', '修改权限', '1', '2017-03-24 14:21:24', '888888', '1', '0:0:0:0:0:0:0:1', 'com.jee.ssm.modules.ssm.controller.PowerController.update()', '[{\"icon\":\"fa fa-list-ul icon-state-success\",\"id\":\"3887638318819724580\",\"intro\":\"我们用的是1.12\",\"name\":\"JQuery在线文档\",\"param\":\"\",\"paramUrl\":\"http:::jquery.cuishifeng.cn:index.html\",\"parentId\":\"2592161802147378479\",\"powerCount\":0,\"shiro\":\"\",\"sort\":0,\"type\":0,\"url\":\"http://jquery.cuishifeng.cn/index.html\"}]');
INSERT INTO `t_log` VALUES ('1756158522977240259', 'org.apache.shiro.authc.AuthenticationException: Authentication failed for token submission [org.apache.shiro.authc.UsernamePasswordToken - admin, rememberMe=false].  Possible unexpected error? (Typical or expected login exceptions should extend from AuthenticationException).', '0', '2016-11-07 09:40:19', '0', '0', '127.0.0.1', '/login/admin', null);
INSERT INTO `t_log` VALUES ('179520720946745105', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [admin:list]', '0', '2017-03-23 04:05:38', '888888', '0', '127.0.0.1', '/admin/list', 't=1490241937822&page=1&size=10');
INSERT INTO `t_log` VALUES ('1885313686382726299', 'java.lang.IllegalArgumentException: No converter found for return value of type: class com.elangzhi.ssm.controller.json.Tip', '0', '2016-11-07 10:07:54', '0', '0', '127.0.0.1', '/login/admin', null);
INSERT INTO `t_log` VALUES ('1961776906309513895', 'java.lang.IllegalArgumentException: No converter found for return value of type: class com.elangzhi.ssm.controller.json.Tip', '0', '2016-11-07 10:00:05', '888888', '0', '127.0.0.1', '/login/admin', null);
INSERT INTO `t_log` VALUES ('2039900052577863830', 'org.apache.shiro.authc.AuthenticationException: Authentication failed for token submission [org.apache.shiro.authc.UsernamePasswordToken - admin, rememberMe=true].  Possible unexpected error? (Typical or expected login exceptions should extend from AuthenticationException).', '0', '2016-10-31 13:20:01', '0', '0', '127.0.0.1', '/login/admin', null);
INSERT INTO `t_log` VALUES ('2140713673943201871', '批量删除日志', '1', '2016-11-05 16:17:43', '888888', '1', '127.0.0.1', 'com.elangzhi.modules.log.controller.LogController.deleteByIds()', '[[3150502884808900244, 7145595674868927878]]');
INSERT INTO `t_log` VALUES ('2202522462175023', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:test]', '0', '2016-11-04 10:25:01', '888888', '0', '127.0.0.1', '/role/delete', null);
INSERT INTO `t_log` VALUES ('2242086394359794269', '添加角色', '1', '2016-11-16 11:52:34', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.power.RoleController.save()', '[com.elangzhi.ssm.model.Role@7f97f68a]');
INSERT INTO `t_log` VALUES ('2245898704555063083', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:test]', '0', '2016-11-04 10:15:54', '888888', '0', '127.0.0.1', '/role/delete', null);
INSERT INTO `t_log` VALUES ('2256493943813813287', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:test]', '0', '2016-11-04 10:48:01', '888888', '0', '192.168.1.145', '/role/delete', null);
INSERT INTO `t_log` VALUES ('2394299980917619319', 'java.lang.IllegalArgumentException: No converter found for return value of type: class com.elangzhi.ssm.controller.json.Tip', '0', '2016-11-07 10:00:12', '888888', '0', '127.0.0.1', '/login/admin', null);
INSERT INTO `t_log` VALUES ('2486584110773547413', 'java.lang.IllegalArgumentException: Wildcard string cannot be null or empty. Make sure permission strings are properly formatted.', '0', '2016-11-01 11:56:48', '888888', '0', '127.0.0.1', '/role/list', null);
INSERT INTO `t_log` VALUES ('2500676169406564597', '修改权限', '1', '2017-03-20 08:12:19', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.power.PowerController.update()', '[{\"icon\":\"fa  fa-trash-o icon-state-danger\",\"id\":\"8501344847075980730\",\"intro\":\"11123\",\"name\":\"测试删除\",\"paramUrl\":\"role:delete\",\"parentId\":\"8981313088726911580\",\"powerCount\":0,\"sort\":0,\"type\":1,\"url\":\"role/delete\"}]');
INSERT INTO `t_log` VALUES ('2562664508948237581', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:test]', '0', '2016-11-05 13:56:09', '888888', '0', '127.0.0.1', '/role/delete', null);
INSERT INTO `t_log` VALUES ('2597340775048757666', 'org.apache.catalina.connector.ClientAbortException: java.io.IOException: APR error: -730053', '0', '2017-03-24 02:27:00', '888888', '0', '127.0.0.1', '/static/plugins/layer/skin/default/icon.png', null);
INSERT INTO `t_log` VALUES ('2627061843765642228', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:list]', '0', '2017-03-23 03:50:20', '888888', '0', '127.0.0.1', '/role/list', 't=1490241020099&page=1&size=10');
INSERT INTO `t_log` VALUES ('2725153131861658374', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:list]', '0', '2017-03-23 03:38:35', '888888', '0', '127.0.0.1', '/role/list', 't=1490240314419&page=1&size=10');
INSERT INTO `t_log` VALUES ('2737597550567312033', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:test]', '0', '2016-11-04 13:35:39', '888888', '0', '127.0.0.1', '/role/delete', null);
INSERT INTO `t_log` VALUES ('312685134652195161', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have role [888888]', '0', '2017-03-23 04:20:24', '888888', '0', '127.0.0.1', '/power/list', 't=1490242824154&page=1&size=10');
INSERT INTO `t_log` VALUES ('3312131978720230721', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [admin:list]', '0', '2017-03-23 03:45:58', '888888', '0', '127.0.0.1', '/admin/list', 't=1490240757324&page=1&size=10');
INSERT INTO `t_log` VALUES ('3388159455954255799', 'java.lang.NullPointerException', '0', '2017-03-20 03:19:56', '888888', '0', '0:0:0:0:0:0:0:1', '/role/list', 't=1489979995808');
INSERT INTO `t_log` VALUES ('3492881106691274448', '修改权限', '1', '2017-03-24 14:39:20', '888888', '1', '0:0:0:0:0:0:0:1', 'com.jee.ssm.modules.ssm.controller.PowerController.update()', '[{\"icon\":\"fa fa-list-ul icon-state-success\",\"id\":\"8576340433741395271\",\"intro\":\"支持很多格式的格式化\",\"name\":\"BeJson 在线格式化\",\"param\":\"\",\"paramUrl\":\"http:::www.bejson.com:jsoneditoronline:\",\"parentId\":\"2592161802147378479\",\"powerCount\":0,\"shiro\":\"\",\"sort\":6,\"type\":0,\"url\":\"http://www.bejson.com/jsoneditoronline/\"}]');
INSERT INTO `t_log` VALUES ('3610310186731354628', 'java.lang.NullPointerException', '0', '2017-03-20 03:20:25', '888888', '0', '0:0:0:0:0:0:0:1', '/role/list', 't=1489980025463');
INSERT INTO `t_log` VALUES ('3662878178434961105', 'java.lang.NullPointerException', '0', '2017-03-20 07:26:54', '888888', '0', '0:0:0:0:0:0:0:1', '/role/list', 't=1489994814193');
INSERT INTO `t_log` VALUES ('3721235871377738242', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have role [888888]', '0', '2017-03-23 04:20:59', '888888', '0', '127.0.0.1', '/power/list', 't=1490242858487&page=1&size=10');
INSERT INTO `t_log` VALUES ('3764717645796951739', 'java.lang.IllegalArgumentException: No converter found for return value of type: class com.elangzhi.ssm.controller.json.Tip', '0', '2016-11-07 09:59:58', '888888', '0', '127.0.0.1', '/login/admin', null);
INSERT INTO `t_log` VALUES ('3813787035047250830', '批量删除日志', '1', '2017-01-18 08:26:44', '888888', '1', '127.0.0.1', 'com.elangzhi.modules.log.controller.LogController.deleteByIds()', '[[3161501243696827323, 1187949128125989211, 3855054977281183312, 5571359881790928918, 4726472100602164652]]');
INSERT INTO `t_log` VALUES ('3911374654963432559', '修改权限', '1', '2017-03-20 08:11:22', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.power.PowerController.update()', '[{\"icon\":\"fa  fa-trash-o icon-state-danger\",\"id\":\"8501344847075980730\",\"intro\":\"1112\",\"name\":\"测试删除\",\"paramUrl\":\"role:delete\",\"parentId\":\"8981313088726911580\",\"powerCount\":0,\"sort\":0,\"type\":1,\"url\":\"role/delete\"}]');
INSERT INTO `t_log` VALUES ('4007967934871154751', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:list]', '0', '2017-03-23 03:50:25', '888888', '0', '127.0.0.1', '/role/list', 't=1490241020099&page=1&size=10');
INSERT INTO `t_log` VALUES ('4046089592412616852', '批量删除权限', '1', '2017-03-17 01:43:32', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.power.PowerController.deleteByIds()', '[[\"13764\",\"13765\",\"13762\",\"13763\"]]');
INSERT INTO `t_log` VALUES ('407162501827022748', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'shiro\' in \'field list\'\r\n### The error may involve PowerMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_power (id,name,intro,parent_id,type,url,sort,icon,shiro,param)         values (?,?,?,?,?,?,?,?,?,?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'shiro\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'shiro\' in \'field list\'', '0', '2017-03-23 01:53:34', '888888', '0', '127.0.0.1', '/power/save', null);
INSERT INTO `t_log` VALUES ('4072528692395790172', 'java.lang.IllegalStateException: The remote endpoint was in state [TEXT_PARTIAL_WRITING] which is an invalid state for called method', '0', '2016-11-07 16:13:09', '7741658025049278520', '0', '192.168.1.145', '/socket/sta', 'message');
INSERT INTO `t_log` VALUES ('4085806725261116462', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [admin:list]', '0', '2017-03-23 03:50:17', '888888', '0', '127.0.0.1', '/admin/list', 't=1490241017371&page=1&size=10');
INSERT INTO `t_log` VALUES ('4116817307464741372', '修改管理员', '1', '2017-03-24 13:15:06', '888888', '1', '0:0:0:0:0:0:0:1', 'com.jee.ssm.modules.ssm.controller.AdminController.update()', '[{\"address\":\"山东省 济南市 天桥区\",\"email\":\"244556979@qq.com\",\"head\":\"/images/headImage/1463825019924_head.jpg\",\"id\":\"888887\",\"idCard\":\"37888820880808588X\",\"name\":\"Manager\",\"phone\":\"123456\",\"sex\":1}]');
INSERT INTO `t_log` VALUES ('4139688746730864650', '删除日志', '1', '2017-01-16 10:04:06', '888888', '1', '127.0.0.1', 'com.elangzhi.modules.log.controller.LogController.delete()', '[4004211499996198420]');
INSERT INTO `t_log` VALUES ('416821931776586887', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [log:list]', '0', '2017-03-24 07:11:22', '888888', '0', '127.0.0.1', '/log/list', 't=1490339481573&page=1&size=10');
INSERT INTO `t_log` VALUES ('4228634698949348672', 'java.lang.IllegalArgumentException: No converter found for return value of type: class com.elangzhi.ssm.controller.json.Tip', '0', '2016-11-07 09:59:42', '0', '0', '127.0.0.1', '/login/admin', null);
INSERT INTO `t_log` VALUES ('438670903613932566', '批量删除管理员', '1', '2016-11-05 16:20:57', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.admin.AdminController.deleteByIds()', '[[1226129137234234481]]');
INSERT INTO `t_log` VALUES ('4388504901983714901', 'java.lang.NullPointerException', '0', '2017-03-22 10:49:03', '888888', '0', '127.0.0.1', '/role/list', null);
INSERT INTO `t_log` VALUES ('4398560475972743617', '修改管理员', '1', '2017-03-21 01:22:00', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.admin.AdminController.update()', '[{\"address\":\"11\",\"email\":\"11\",\"head\":\"/images/account/default_head.jpg\",\"id\":\"6960765532414627195\",\"idCard\":\"11\",\"name\":\"test03\",\"phone\":\"1111\",\"sex\":1}]');
INSERT INTO `t_log` VALUES ('4452118649713309479', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:list]', '0', '2017-03-23 03:50:27', '888888', '0', '127.0.0.1', '/role/list', 't=1490241020099&page=1&size=10');
INSERT INTO `t_log` VALUES ('4554030457698891986', '修改权限', '1', '2017-03-24 14:17:49', '888888', '1', '0:0:0:0:0:0:0:1', 'com.jee.ssm.modules.ssm.controller.PowerController.update()', '[{\"icon\":\"fa fa-list-ul icon-state-success\",\"id\":\"8239127794614056577\",\"intro\":\"\",\"name\":\"百度翻译\",\"param\":\"\",\"paramUrl\":\"http:::fanyi.baidu.com:\",\"parentId\":\"2592161802147378479\",\"powerCount\":0,\"shiro\":\"\",\"sort\":0,\"type\":0,\"url\":\"http://fanyi.baidu.com/\"}]');
INSERT INTO `t_log` VALUES ('4618020204916196417', '修改权限', '1', '2017-03-23 03:36:29', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.power.PowerController.update()', '[{\"icon\":\"fa fa-list-ul icon-state-success\",\"id\":\"13741\",\"intro\":\"管理角色信息。\",\"name\":\"角色列表\",\"param\":\"&page=1&size=10\",\"paramUrl\":\":role:list\",\"parentId\":\"13740\",\"powerCount\":0,\"shiro\":\"role:list1\",\"sort\":1,\"type\":0,\"url\":\"/role/list\"}]');
INSERT INTO `t_log` VALUES ('4641448642413246418', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:list]', '0', '2017-03-23 03:50:29', '888888', '0', '127.0.0.1', '/role/list', 't=1490241020099&page=1&size=10');
INSERT INTO `t_log` VALUES ('4737662119061114816', '修改权限', '1', '2017-03-20 07:56:25', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.power.PowerController.update()', '[{\"icon\":\"fa  fa-trash-o icon-state-danger\",\"id\":\"8501344847075980730\",\"intro\":\"\",\"name\":\"测试删除\",\"paramUrl\":\"role:delete\",\"parentId\":\"8981313088726911580\",\"powerCount\":0,\"sort\":0,\"type\":1,\"url\":\"role/delete\"}]');
INSERT INTO `t_log` VALUES ('496898534388316298', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have role [888888]', '0', '2017-03-23 04:20:39', '888888', '0', '127.0.0.1', '/power/list', 't=1490242838634&page=1&size=10');
INSERT INTO `t_log` VALUES ('5021633314736028087', '批量删除角色', '1', '2016-11-05 16:38:23', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.power.RoleController.deleteByIds()', '[[3441774805199925578, 3654918555884210707, 3711322096899213759, 566106939142850269, 6660214783877530467, 6905406042793491527]]');
INSERT INTO `t_log` VALUES ('5148968513008846146', 'java.lang.IllegalArgumentException: Unknown return value type: java.lang.Integer', '0', '2017-03-20 09:55:08', '888888', '0', '0:0:0:0:0:0:0:1', '/user/insert', 'name=q&sex=2&age=23&email=2&address=2');
INSERT INTO `t_log` VALUES ('5489046629832934444', '修改权限', '1', '2017-03-24 14:28:35', '888888', '1', '0:0:0:0:0:0:0:1', 'com.jee.ssm.modules.ssm.controller.PowerController.update()', '[{\"icon\":\"fa fa-list-ul icon-state-success\",\"id\":\"4161125712330340299\",\"intro\":\"纯API文档\",\"name\":\"Ueditor API 文档\",\"param\":\"\",\"paramUrl\":\"http:::ueditor.baidu.com:doc:\",\"parentId\":\"2592161802147378479\",\"powerCount\":0,\"shiro\":\"\",\"sort\":3,\"type\":0,\"url\":\"http://ueditor.baidu.com/doc/\"}]');
INSERT INTO `t_log` VALUES ('5498241249053329723', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:test]', '0', '2016-11-05 14:53:15', '888888', '0', '127.0.0.1', '/role/delete', null);
INSERT INTO `t_log` VALUES ('5595941127654886783', '删除角色', '1', '2016-10-31 15:45:24', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.power.RoleController.delete()', '[3068835563429739529]');
INSERT INTO `t_log` VALUES ('5618970856848735531', '批量删除权限', '1', '2017-03-17 01:43:45', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.power.PowerController.deleteByIds()', '[[\"13761\"]]');
INSERT INTO `t_log` VALUES ('5638916831008111225', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:test]', '0', '2016-11-05 11:35:03', '888888', '0', '127.0.0.1', '/role/delete', null);
INSERT INTO `t_log` VALUES ('5648063006224595286', '修改权限', '1', '2017-03-24 14:28:26', '888888', '1', '0:0:0:0:0:0:0:1', 'com.jee.ssm.modules.ssm.controller.PowerController.update()', '[{\"icon\":\"fa fa-list-ul icon-state-success\",\"id\":\"818851178852598316\",\"intro\":\"配置文档，不包含api\",\"name\":\"Ueditor 配置文档\",\"param\":\"\",\"paramUrl\":\"http:::fex.baidu.com:ueditor:#start-start\",\"parentId\":\"2592161802147378479\",\"powerCount\":0,\"shiro\":\"\",\"sort\":2,\"type\":0,\"url\":\"http://fex.baidu.com/ueditor/#start-start\"}]');
INSERT INTO `t_log` VALUES ('5735579940400549435', 'java.lang.IllegalArgumentException', '0', '2016-11-07 16:12:03', '7741658025049278520', '0', '192.168.1.145', '/socket/stall', 'message');
INSERT INTO `t_log` VALUES ('5794219200037798387', '修改管理员', '1', '2017-01-22 12:24:25', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.admin.AdminController.update()', '[com.elangzhi.ssm.model.Admin@76c0b502]');
INSERT INTO `t_log` VALUES ('5818063844990668344', '批量删除日志', '1', '2017-01-15 18:03:35', '888888', '1', '127.0.0.1', 'com.elangzhi.modules.log.controller.LogController.deleteByIds()', '[[5027335403391044858, 4373525782768040657]]');
INSERT INTO `t_log` VALUES ('6060991256059166428', '删除管理员', '1', '2017-03-21 01:22:59', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.admin.AdminController.delete()', '[\"6960765532414627195\"]');
INSERT INTO `t_log` VALUES ('6239733369230505086', '修改角色', '1', '2017-03-20 09:05:48', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.power.RoleController.update()', '[{\"id\":\"5151440462543630679\",\"intro\":\"444\",\"name\":\"444\"}]');
INSERT INTO `t_log` VALUES ('628048649273428907', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [admin:list]', '0', '2017-03-23 03:46:08', '888888', '0', '127.0.0.1', '/admin/list', 't=1490240767884&page=1&size=10');
INSERT INTO `t_log` VALUES ('6376344171683691475', '添加角色', '1', '2017-03-20 09:05:36', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.power.RoleController.save()', '[{\"id\":\"5151440462543630679\",\"intro\":\"44\",\"name\":\"44\"}]');
INSERT INTO `t_log` VALUES ('6415041741084996949', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [admin:list]', '0', '2017-03-24 02:05:42', '888888', '0', '127.0.0.1', '/admin/list', 't=1490321141534&page=1&size=10');
INSERT INTO `t_log` VALUES ('6487923780885986690', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:test]', '0', '2016-11-04 09:58:34', '888888', '0', '127.0.0.1', '/role/delete', null);
INSERT INTO `t_log` VALUES ('6545858114439564056', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:test]', '0', '2016-11-04 10:25:45', '888888', '0', '127.0.0.1', '/role/delete', null);
INSERT INTO `t_log` VALUES ('6582878847678396471', '修改管理员', '1', '2017-03-21 01:22:07', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.admin.AdminController.update()', '[{\"address\":\"11\",\"email\":\"11\",\"head\":\"/images/account/default_head.jpg\",\"id\":\"6960765532414627195\",\"idCard\":\"11\",\"name\":\"test03\",\"phone\":\"1111\",\"sex\":0}]');
INSERT INTO `t_log` VALUES ('6764875090855377380', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [admin:list]', '0', '2017-03-23 09:50:36', '888888', '0', '127.0.0.1', '/admin/list', 't=1490262636149&page=1&size=10');
INSERT INTO `t_log` VALUES ('6787217436584920958', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [admin:list]', '0', '2017-03-23 03:42:32', '888888', '0', '127.0.0.1', '/admin/list', 't=1490240552475&page=1&size=10');
INSERT INTO `t_log` VALUES ('6956961053594532910', 'java.lang.NullPointerException', '0', '2017-03-20 10:05:52', '888888', '0', '0:0:0:0:0:0:0:1', '/role/list', 't=1490004351810');
INSERT INTO `t_log` VALUES ('6978246841058900231', 'org.apache.shiro.authc.AuthenticationException: Authentication failed for token submission [org.apache.shiro.authc.UsernamePasswordToken - admin, rememberMe=true].  Possible unexpected error? (Typical or expected login exceptions should extend from AuthenticationException).', '0', '2016-10-31 13:10:51', '0', '0', '127.0.0.1', '/login/admin', null);
INSERT INTO `t_log` VALUES ('7223109280436340353', 'java.lang.IllegalArgumentException: No converter found for return value of type: class com.elangzhi.ssm.controller.json.Tip', '0', '2016-11-07 09:59:48', '888888', '0', '127.0.0.1', '/login/admin', null);
INSERT INTO `t_log` VALUES ('7274094146291544710', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:list]', '0', '2017-03-23 03:42:37', '888888', '0', '127.0.0.1', '/role/list', 't=1490240557083&page=1&size=10');
INSERT INTO `t_log` VALUES ('7277210679610357873', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have role [888888]', '0', '2017-03-23 04:10:52', '888888', '0', '127.0.0.1', '/power/list', 't=1490242165256&page=1&size=10');
INSERT INTO `t_log` VALUES ('7317539780533109592', '批量删除日志', '1', '2016-10-31 15:47:48', '888888', '1', '127.0.0.1', 'com.elangzhi.modules.log.controller.LogController.deleteByIds()', '[[3596883204412980887, 8292538748352612781]]');
INSERT INTO `t_log` VALUES ('7351244749132480953', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [admin:list]', '0', '2017-03-23 04:33:55', '888888', '0', '127.0.0.1', '/admin/list', 't=1490243635313&page=1&size=10');
INSERT INTO `t_log` VALUES ('7358435360427625252', 'java.lang.IllegalArgumentException', '0', '2016-11-07 17:16:14', '888888', '0', '127.0.0.1', '/socket/sta', null);
INSERT INTO `t_log` VALUES ('7424466720356349171', 'org.apache.catalina.connector.ClientAbortException: java.io.IOException: APR error: -730053', '0', '2017-03-24 02:26:23', '888888', '0', '127.0.0.1', '/static/plugins/layer/skin/default/icon.png', null);
INSERT INTO `t_log` VALUES ('7434747324817390074', 'java.lang.NullPointerException', '0', '2017-03-22 10:48:57', '888888', '0', '127.0.0.1', '/role/list', null);
INSERT INTO `t_log` VALUES ('748352753368151689', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:test]', '0', '2016-11-05 11:19:24', '888888', '0', '127.0.0.1', '/role/delete', null);
INSERT INTO `t_log` VALUES ('7553749014734222041', 'java.lang.NullPointerException', '0', '2017-03-20 09:25:28', '888888', '0', '127.0.0.1', '/role/list', null);
INSERT INTO `t_log` VALUES ('7570695061840838445', '修改权限', '1', '2017-03-24 14:28:21', '888888', '1', '0:0:0:0:0:0:0:1', 'com.jee.ssm.modules.ssm.controller.PowerController.update()', '[{\"icon\":\"fa fa-list-ul icon-state-success\",\"id\":\"3887638318819724580\",\"intro\":\"我们用的是1.12\",\"name\":\"JQuery在线文档\",\"param\":\"\",\"paramUrl\":\"http:::jquery.cuishifeng.cn:index.html\",\"parentId\":\"2592161802147378479\",\"powerCount\":0,\"shiro\":\"\",\"sort\":1,\"type\":0,\"url\":\"http://jquery.cuishifeng.cn/index.html\"}]');
INSERT INTO `t_log` VALUES ('7647224989648962469', '修改权限', '1', '2017-03-24 14:26:01', '888888', '1', '0:0:0:0:0:0:0:1', 'com.jee.ssm.modules.ssm.controller.PowerController.update()', '[{\"icon\":\"fa fa-list-ul icon-state-success\",\"id\":\"818851178852598316\",\"intro\":\"配置文档，不包含api\",\"name\":\"Ueditor 配置文档\",\"param\":\"\",\"paramUrl\":\"http:::fex.baidu.com:ueditor:#start-start\",\"parentId\":\"2592161802147378479\",\"powerCount\":0,\"shiro\":\"\",\"sort\":0,\"type\":0,\"url\":\"http://fex.baidu.com/ueditor/#start-start\"}]');
INSERT INTO `t_log` VALUES ('7650638293375169627', 'org.apache.catalina.connector.ClientAbortException: java.io.IOException: APR error: -730053', '0', '2017-03-24 02:26:45', '888888', '0', '127.0.0.1', '/static/plugins/layer/skin/default/icon.png', null);
INSERT INTO `t_log` VALUES ('7678401100391691922', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:list]', '0', '2017-03-23 03:41:18', '888888', '0', '127.0.0.1', '/role/list', 't=1490240477436&page=1&size=10');
INSERT INTO `t_log` VALUES ('7705060640452331549', 'java.lang.NullPointerException', '0', '2017-03-20 10:05:57', '888888', '0', '0:0:0:0:0:0:0:1', '/role/list', 't=1490004357018');
INSERT INTO `t_log` VALUES ('7735958050142076382', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [admin:list]', '0', '2017-03-23 04:29:15', '888888', '0', '127.0.0.1', '/admin/list', 't=1490243354569&page=1&size=10');
INSERT INTO `t_log` VALUES ('7837777957540937781', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:test]', '0', '2016-11-05 11:33:37', '888888', '0', '127.0.0.1', '/role/delete', null);
INSERT INTO `t_log` VALUES ('7871675431348385713', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:test]', '0', '2016-11-05 11:35:57', '888888', '0', '127.0.0.1', '/role/delete', null);
INSERT INTO `t_log` VALUES ('7878016622652931742', '修改权限', '1', '2017-03-24 14:25:52', '888888', '1', '0:0:0:0:0:0:0:1', 'com.jee.ssm.modules.ssm.controller.PowerController.update()', '[{\"icon\":\"fa fa-list-ul icon-state-success\",\"id\":\"4161125712330340299\",\"intro\":\"纯API文档\",\"name\":\"Ueditor API 文档\",\"param\":\"\",\"paramUrl\":\"http:::ueditor.baidu.com:doc:\",\"parentId\":\"2592161802147378479\",\"powerCount\":0,\"shiro\":\"\",\"sort\":0,\"type\":0,\"url\":\"http://ueditor.baidu.com/doc/\"}]');
INSERT INTO `t_log` VALUES ('7895867509405141982', 'java.lang.IllegalArgumentException: Wildcard string cannot be null or empty. Make sure permission strings are properly formatted.', '0', '2016-11-01 11:58:28', '888888', '0', '127.0.0.1', '/role/list', null);
INSERT INTO `t_log` VALUES ('791964876313939431', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [log:list]', '0', '2017-03-24 03:32:01', '888888', '0', '127.0.0.1', '/log/list', 't=1490326320807&page=1&size=10');
INSERT INTO `t_log` VALUES ('7968502798220608422', '添加角色', '1', '2016-11-07 09:21:35', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.power.RoleController.save()', '[com.elangzhi.ssm.model.Role@211c397d]');
INSERT INTO `t_log` VALUES ('7992623592115584973', '删除日志', '1', '2017-01-15 18:10:56', '888888', '1', '127.0.0.1', 'com.elangzhi.modules.log.controller.LogController.delete()', '[255648911041150195]');
INSERT INTO `t_log` VALUES ('8077172670547053252', '批量删除日志', '1', '2016-11-05 16:10:07', '888888', '1', '127.0.0.1', 'com.elangzhi.modules.log.controller.LogController.deleteByIds()', '[[4847805809758876659]]');
INSERT INTO `t_log` VALUES ('812587538840371613', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:test]', '0', '2016-11-04 10:17:04', '888888', '0', '127.0.0.1', '/role/delete', null);
INSERT INTO `t_log` VALUES ('8148374232772096137', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssmjee.t_city\' doesn\'t exist\r\n### The error may exist in file [D:\\IdeaProjects\\ssmjee\\target\\artifacts\\ssmjee_war_exploded\\WEB-INF\\classes\\mapper\\ssm\\CityMapper.xml]\r\n### The error may involve CityMapper.list-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(0) FROM t_city WHERE 1 = 1\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssmjee.t_city\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssmjee.t_city\' doesn\'t exist', '0', '2017-01-18 17:18:41', '888888', '0', '127.0.0.1', '/city/list', null);
INSERT INTO `t_log` VALUES ('8298236178299572191', 'java.lang.IllegalArgumentException: No converter found for return value of type: class com.elangzhi.ssm.controller.json.Tip', '0', '2016-11-07 10:01:25', '888888', '0', '127.0.0.1', '/login/admin', null);
INSERT INTO `t_log` VALUES ('8333554864862572977', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have role [888888]', '0', '2017-03-23 04:05:27', '888888', '0', '127.0.0.1', '/power/list', 't=1490241926686&page=1&size=10');
INSERT INTO `t_log` VALUES ('8449940260314893652', '删除权限', '1', '2017-01-23 10:59:37', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.power.PowerController.delete()', '[1798109320822567628]');
INSERT INTO `t_log` VALUES ('8544487491132503381', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [roleTest:list]', '0', '2016-11-01 11:31:57', '888888', '0', '127.0.0.1', '/role/list', null);
INSERT INTO `t_log` VALUES ('8565873716207597905', 'org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\r\n### The error may involve AccountMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_account (id,user_name,password,type,status,info_id,qq_id,sina_id)         values (?,?,?,?,?,?,?,?)\r\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n; SQL []; Data truncation: Out of range value for column \'id\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1', '0', '2016-11-05 16:24:24', '888888', '0', '127.0.0.1', '/admin/save', null);
INSERT INTO `t_log` VALUES ('8590347811925871668', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:list]', '0', '2017-03-23 03:38:55', '888888', '0', '127.0.0.1', '/role/list', 't=1490240335162&page=1&size=10');
INSERT INTO `t_log` VALUES ('8676536566377040154', 'java.lang.IllegalArgumentException: No converter found for return value of type: class com.elangzhi.ssm.controller.json.Tip', '0', '2016-11-07 10:06:09', '0', '0', '127.0.0.1', '/login/admin', null);
INSERT INTO `t_log` VALUES ('8896627273490515741', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [admin:list]', '0', '2017-03-23 04:08:21', '888888', '0', '127.0.0.1', '/admin/list', 't=1490242101149&page=1&size=10');
INSERT INTO `t_log` VALUES ('8992765513880978053', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [admin:list]', '0', '2017-03-23 04:20:46', '888888', '0', '127.0.0.1', '/admin/list', 't=1490242845542&page=1&size=10');
INSERT INTO `t_log` VALUES ('9073106666916496006', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:test]', '0', '2016-11-04 10:24:37', '888888', '0', '127.0.0.1', '/role/delete', null);
INSERT INTO `t_log` VALUES ('9099058578059576449', '修改权限', '1', '2017-03-24 14:39:11', '888888', '1', '0:0:0:0:0:0:0:1', 'com.jee.ssm.modules.ssm.controller.PowerController.update()', '[{\"icon\":\"fa fa-list-ul icon-state-success\",\"id\":\"1375778792459647661\",\"intro\":\"在线处理图片\",\"name\":\"在线 PhotoShop\",\"param\":\"\",\"paramUrl\":\"http:::www.bejson.com:ui:photoshop:\",\"parentId\":\"2592161802147378479\",\"powerCount\":0,\"shiro\":\"\",\"sort\":5,\"type\":0,\"url\":\"http://www.bejson.com/ui/photoshop/\"}]');
INSERT INTO `t_log` VALUES ('918864276641631763', '批量删除日志', '1', '2017-01-15 18:11:43', '888888', '1', '127.0.0.1', 'com.elangzhi.modules.log.controller.LogController.deleteByIds()', '[[1388584947464257346]]');
INSERT INTO `t_log` VALUES ('9192326432951677990', '删除角色', '1', '2016-11-16 11:11:19', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.power.RoleController.delete()', '[8513553615322041978]');
INSERT INTO `t_log` VALUES ('9195215448101928571', 'java.lang.NullPointerException', '0', '2017-03-20 02:15:31', '888888', '0', '0:0:0:0:0:0:0:1', '/role/list', 't=1489976131284');
INSERT INTO `t_log` VALUES ('921963706129232367', '删除角色', '1', '2016-11-05 15:43:40', '888888', '1', '127.0.0.1', 'com.elangzhi.ssm.controller.power.RoleController.delete()', '[274290025488102510]');
INSERT INTO `t_log` VALUES ('923480477159504883', 'java.lang.NullPointerException', '0', '2017-03-20 05:43:08', '888888', '0', '0:0:0:0:0:0:0:1', '/role/list', 't=1489988588380');
INSERT INTO `t_log` VALUES ('966920471235412626', 'java.lang.IllegalArgumentException: Wildcard string cannot be null or empty. Make sure permission strings are properly formatted.', '0', '2016-11-01 12:00:49', '888888', '0', '127.0.0.1', '/role/list', null);
INSERT INTO `t_log` VALUES ('99017869260573170', 'org.apache.shiro.authz.UnauthorizedException: Subject does not have permission [role:list]', '0', '2017-03-23 03:50:23', '888888', '0', '127.0.0.1', '/role/list', 't=1490241020099&page=1&size=10');

-- ----------------------------
-- Table structure for t_power
-- ----------------------------
DROP TABLE IF EXISTS `t_power`;
CREATE TABLE `t_power` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '权限名称',
  `intro` varchar(200) DEFAULT NULL COMMENT '简介',
  `parent_id` varchar(350) DEFAULT NULL COMMENT '父级权限',
  `type` int(2) DEFAULT NULL COMMENT '权限类型',
  `url` varchar(200) DEFAULT NULL COMMENT '权限跳转url',
  `sort` int(3) DEFAULT NULL COMMENT '权限排序',
  `icon` varchar(200) DEFAULT NULL COMMENT '权限图标',
  `shiro` varchar(255) DEFAULT NULL COMMENT '权限标识，一般根据url转换',
  `param` varchar(500) DEFAULT NULL COMMENT '参数 示例：&page=1&size=10',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of t_power
-- ----------------------------
INSERT INTO `t_power` VALUES ('1074620113840157779', '日志列表', '', '8459272568920914939', '0', '/log/list', '0', 'fa fa-list-ul icon-state-success', 'log:list1', '&page=1&size=10');
INSERT INTO `t_power` VALUES ('13735', '管理员管理', '管理管理员信息', '0', '0', '', '1', 'fa fa-user icon-state-info icon-lg ', null, null);
INSERT INTO `t_power` VALUES ('13736', '管理员列表', '管理员增删改查', '13735', '0', '/admin/list', '1', 'fa fa-user icon-state-success', 'admin:list', '&page=1&size=10');
INSERT INTO `t_power` VALUES ('13737', '管理员添加', '管理员添加', '13735', '1', '/admin/save', '2', 'fa  fa-plus icon-state-info', 'admin:save', null);
INSERT INTO `t_power` VALUES ('13738', '管理员编辑', '管理员编辑', '13735', '1', '/admin/edit', '3', 'fa  fa-edit icon-state-warning', 'admin:edit', null);
INSERT INTO `t_power` VALUES ('13739', '管理员删除', '管理员删除', '13735', '1', '/admin/delete', '4', 'fa  fa-trash-o icon-state-danger', 'admin:delete', null);
INSERT INTO `t_power` VALUES ('13740', '角色管理', '管理角色信息', '0', '0', '', '2', 'fa fa-male icon-state-info icon-lg ', null, null);
INSERT INTO `t_power` VALUES ('13741', '角色列表', '管理角色信息。', '13740', '0', '/role/list', '1', 'fa fa-list-ul icon-state-success', 'role:list', '&page=1&size=10');
INSERT INTO `t_power` VALUES ('13742', '角色添加', '添加角色', '13740', '1', '/role/save', '2', 'fa  fa-plus icon-state-info', 'role:save', null);
INSERT INTO `t_power` VALUES ('13743', '角色编辑', '编辑角色信息', '13740', '1', '/role/edit', '3', 'fa  fa-edit icon-state-warning', 'role:edit', null);
INSERT INTO `t_power` VALUES ('13744', '角色删除', '删除角色信息', '13740', '1', '/role/delete', '4', 'fa  fa-trash-o icon-state-danger', 'role:delete', null);
INSERT INTO `t_power` VALUES ('1375778792459647661', '在线 PhotoShop', '在线处理图片', '2592161802147378479', '0', 'http://www.bejson.com/ui/photoshop/', '5', 'fa fa-list-ul icon-state-success', '', '');
INSERT INTO `t_power` VALUES ('2435383736353274225', '权限列表', '权限列表', '0', '0', '/power/list', '6', 'fa fa-list-ul icon-state-success', 'power:list', '&page=1&size=10&parentId=0');
INSERT INTO `t_power` VALUES ('2592161802147378479', '开发工具合集', '一些常用的web工具', '0', '0', '', '7', 'fa fa-list-ul icon-state-success', '', '');
INSERT INTO `t_power` VALUES ('3887638318819724580', 'JQuery在线文档', '我们用的是1.12', '2592161802147378479', '0', 'http://jquery.cuishifeng.cn/index.html', '1', 'fa fa-list-ul icon-state-success', '', '');
INSERT INTO `t_power` VALUES ('4161125712330340299', 'Ueditor API 文档', '纯API文档', '2592161802147378479', '0', 'http://ueditor.baidu.com/doc/', '3', 'fa fa-list-ul icon-state-success', '', '');
INSERT INTO `t_power` VALUES ('6941672177974331848', 'Socket示例', '', '8713026388995390381', '0', '/socket/test', '2', 'fa fa-file icon-state-info icon-lg', 'socket:test', null);
INSERT INTO `t_power` VALUES ('7859511193076937503', '测试列表', '', '8981313088726911580', '0', '#', '3', 'fa fa-list-ul icon-state-success', null, null);
INSERT INTO `t_power` VALUES ('818851178852598316', 'Ueditor 配置文档', '配置文档，不包含api', '2592161802147378479', '0', 'http://fex.baidu.com/ueditor/#start-start', '2', 'fa fa-list-ul icon-state-success', '', '');
INSERT INTO `t_power` VALUES ('8239127794614056577', '百度翻译', '', '2592161802147378479', '0', 'http://fanyi.baidu.com/', '0', 'fa fa-list-ul icon-state-success', '', '');
INSERT INTO `t_power` VALUES ('8447425150886038759', 'SQL监控', 'druid监控信息展示', '8713026388995390381', '0', '/druid', '0', 'fa fa-file icon-state-info icon-lg', 'druid', null);
INSERT INTO `t_power` VALUES ('8459272568920914939', '日志管理', '', '0', '0', '', '6', 'fa fa-file icon-state-info icon-lg', null, null);
INSERT INTO `t_power` VALUES ('8501344847075980730', '测试删除', '11123', '8981313088726911580', '1', '/test/delete', '0', 'fa  fa-trash-o icon-state-danger', 'test:delete', null);
INSERT INTO `t_power` VALUES ('8576340433741395271', 'BeJson 在线格式化', '支持很多格式的格式化', '2592161802147378479', '0', 'http://www.bejson.com/jsoneditoronline/', '6', 'fa fa-list-ul icon-state-success', '', '');
INSERT INTO `t_power` VALUES ('8713026388995390381', '系统管理', '', '0', '0', '', '5', 'fa fa-file icon-state-info icon-lg', null, null);
INSERT INTO `t_power` VALUES ('8981313088726911580', '测试', 'test', '0', '0', '', '5', 'fa fa-file icon-state-info icon-lg', null, null);
INSERT INTO `t_power` VALUES ('8996267916842585978', '测试添加', '', '8981313088726911580', '1', '/test/save', '0', 'fa  fa-plus icon-state-info', 'test:save', null);
INSERT INTO `t_power` VALUES ('972271042474917724', 'OSC 在线工具合集', '开源中国的一些在线工具', '2592161802147378479', '0', 'http://tool.oschina.net/', '7', 'fa fa-list-ul icon-state-success', '', '');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '权限名称',
  `intro` varchar(200) DEFAULT NULL COMMENT '简介',
  `set_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `account_id` varchar(32) DEFAULT NULL COMMENT '添加人',
  `shiro` varchar(255) DEFAULT NULL COMMENT '权限标识 ： admin',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('2995895662424734647', 'test08', '12345608', '2016-11-16 11:52:34', null, null);
INSERT INTO `t_role` VALUES ('5151440462543630679', '444', '444', '2017-03-20 09:05:36', null, null);
INSERT INTO `t_role` VALUES ('888888', '超级管理员', '超级管理员权限 一般用于Admin。', null, '888888', 'admin');
INSERT INTO `t_role` VALUES ('888889', '管理员', '普通管理员  一般也就少个权限管理列表 因为权限参数不可更改；只有开发人员懂得什么意思；', null, '888888', 'manager');
INSERT INTO `t_role` VALUES ('888890', '角色管理员', '管理角色 ', null, '888888', 'role:manager');

-- ----------------------------
-- Table structure for t_role_power
-- ----------------------------
DROP TABLE IF EXISTS `t_role_power`;
CREATE TABLE `t_role_power` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) DEFAULT NULL,
  `power_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_power` (`power_id`) USING BTREE,
  KEY `role` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_power
-- ----------------------------
INSERT INTO `t_role_power` VALUES ('1134201457004163535', '5151440462543630679', '8459272568920914939');
INSERT INTO `t_role_power` VALUES ('1172549998784524765', '888888', '13736');
INSERT INTO `t_role_power` VALUES ('1209444888437146941', '888888', '2592161802147378479');
INSERT INTO `t_role_power` VALUES ('1611769695388873823', '888888', '8459272568920914939');
INSERT INTO `t_role_power` VALUES ('1707703670371299796', '888888', '13735');
INSERT INTO `t_role_power` VALUES ('1796512085376154082', '2995895662424734647', '1074620113840157779');
INSERT INTO `t_role_power` VALUES ('1819024642788313319', 'admin', '8239127794614056577');
INSERT INTO `t_role_power` VALUES ('1900548313126553500', '888888', '8713026388995390381');
INSERT INTO `t_role_power` VALUES ('2151996505803606674', '2995895662424734647', '8459272568920914939');
INSERT INTO `t_role_power` VALUES ('2561448714087282394', 'admin', '1375778792459647661');
INSERT INTO `t_role_power` VALUES ('2627995594116646961', '888888', '1074620113840157779');
INSERT INTO `t_role_power` VALUES ('27', '888890', '13740');
INSERT INTO `t_role_power` VALUES ('273696191871075355', '888888', '6941672177974331848');
INSERT INTO `t_role_power` VALUES ('2793472882462275222', '888888', '4161125712330340299');
INSERT INTO `t_role_power` VALUES ('28', '888890', '13741');
INSERT INTO `t_role_power` VALUES ('29', '888890', '13742');
INSERT INTO `t_role_power` VALUES ('298342212638847625', '888888', '13740');
INSERT INTO `t_role_power` VALUES ('30', '888890', '13743');
INSERT INTO `t_role_power` VALUES ('31', '888890', '13744');
INSERT INTO `t_role_power` VALUES ('3136802006103247336', '888888', '818851178852598316');
INSERT INTO `t_role_power` VALUES ('32', '888889', '13735');
INSERT INTO `t_role_power` VALUES ('33', '888889', '13736');
INSERT INTO `t_role_power` VALUES ('3365923404512540881', '888888', '972271042474917724');
INSERT INTO `t_role_power` VALUES ('34', '888889', '13737');
INSERT INTO `t_role_power` VALUES ('34031183703326949', '888888', '8576340433741395271');
INSERT INTO `t_role_power` VALUES ('3469063184864592401', '888888', '13737');
INSERT INTO `t_role_power` VALUES ('35', '888889', '13738');
INSERT INTO `t_role_power` VALUES ('3590296215988714899', '888888', '2435383736353274225');
INSERT INTO `t_role_power` VALUES ('36', '888889', '13739');
INSERT INTO `t_role_power` VALUES ('3682536586661216292', '888888', '3887638318819724580');
INSERT INTO `t_role_power` VALUES ('374667256143524849', '5151440462543630679', '8996267916842585978');
INSERT INTO `t_role_power` VALUES ('4191366344041582376', '888888', '13744');
INSERT INTO `t_role_power` VALUES ('4382467690960172862', '888888', '1375778792459647661');
INSERT INTO `t_role_power` VALUES ('4529654642366696215', '888888', '7859511193076937503');
INSERT INTO `t_role_power` VALUES ('4902254254556232289', '888888', '13741');
INSERT INTO `t_role_power` VALUES ('4911474864713319652', '888888', '0');
INSERT INTO `t_role_power` VALUES ('5108335446838496265', '5151440462543630679', '0');
INSERT INTO `t_role_power` VALUES ('5218239817310486973', '888888', '13743');
INSERT INTO `t_role_power` VALUES ('5323607554365998000', '888888', '8501344847075980730');
INSERT INTO `t_role_power` VALUES ('5467851280649965347', '2995895662424734647', '8981313088726911580');
INSERT INTO `t_role_power` VALUES ('5524525368800490383', '5151440462543630679', '8501344847075980730');
INSERT INTO `t_role_power` VALUES ('5529500047558554143', '888888', '13739');
INSERT INTO `t_role_power` VALUES ('5661797970489291915', 'admin', '818851178852598316');
INSERT INTO `t_role_power` VALUES ('5794873141130999714', 'admin', '4161125712330340299');
INSERT INTO `t_role_power` VALUES ('5809606598001577310', '5151440462543630679', '8981313088726911580');
INSERT INTO `t_role_power` VALUES ('581184419205956511', 'admin', '2592161802147378479');
INSERT INTO `t_role_power` VALUES ('6091819136558480325', '888888', '13738');
INSERT INTO `t_role_power` VALUES ('6539243669518991142', 'admin', '3887638318819724580');
INSERT INTO `t_role_power` VALUES ('6629776801280969304', '888888', '13742');
INSERT INTO `t_role_power` VALUES ('6783452831818924213', '888888', '8239127794614056577');
INSERT INTO `t_role_power` VALUES ('6968420819223755854', '888888', '8447425150886038759');
INSERT INTO `t_role_power` VALUES ('6989703464913451603', '888888', '8996267916842585978');
INSERT INTO `t_role_power` VALUES ('7157297447723253687', '2995895662424734647', '8501344847075980730');
INSERT INTO `t_role_power` VALUES ('7414329328860969068', 'admin', '972271042474917724');
INSERT INTO `t_role_power` VALUES ('8327234561355923069', '888888', '8981313088726911580');
INSERT INTO `t_role_power` VALUES ('8909508820325479789', '5151440462543630679', '1074620113840157779');
INSERT INTO `t_role_power` VALUES ('8960508991206408428', 'admin', '8576340433741395271');
INSERT INTO `t_role_power` VALUES ('9095168442266007881', '2995895662424734647', '0');

-- ----------------------------
-- Table structure for t_settings
-- ----------------------------
DROP TABLE IF EXISTS `t_settings`;
CREATE TABLE `t_settings` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `account_id` varchar(32) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT 'settings type',
  PRIMARY KEY (`id`),
  KEY `s_a` (`account_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_settings
-- ----------------------------
