/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : guns

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 09/11/2019 15:52:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for code_dbinfo
-- ----------------------------
DROP TABLE IF EXISTS `code_dbinfo`;
CREATE TABLE `code_dbinfo`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '别名',
  `db_driver` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库驱动',
  `db_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库地址',
  `db_user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库账户',
  `db_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '连接密码',
  `db_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库类型',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据库链接信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kuai_book
-- ----------------------------
DROP TABLE IF EXISTS `kuai_book`;
CREATE TABLE `kuai_book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kuai_book
-- ----------------------------
INSERT INTO `kuai_book` VALUES (1, '111');
INSERT INTO `kuai_book` VALUES (2, '22');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父部门id',
  `pids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级ids',
  `simplename` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简称',
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全称',
  `tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提示',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本（乐观锁保留字段）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (24, 1, 0, '[0],', '总公司', '总公司', '', NULL);
INSERT INTO `sys_dept` VALUES (25, 2, 24, '[0],[24],', '开发部', '开发部', '', NULL);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级字典',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提示',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (50, 0, 0, '性别', NULL, 'sys_sex');
INSERT INTO `sys_dict` VALUES (51, 1, 50, '男', NULL, '1');
INSERT INTO `sys_dict` VALUES (52, 2, 50, '女', NULL, '2');
INSERT INTO `sys_dict` VALUES (53, 0, 0, '状态', NULL, 'sys_state');
INSERT INTO `sys_dict` VALUES (54, 1, 53, '启用', NULL, '1');
INSERT INTO `sys_dict` VALUES (55, 2, 53, '禁用', NULL, '2');
INSERT INTO `sys_dict` VALUES (56, 0, 0, '账号状态', NULL, 'account_state');
INSERT INTO `sys_dict` VALUES (57, 1, 56, '启用', NULL, '1');
INSERT INTO `sys_dict` VALUES (58, 2, 56, '冻结', NULL, '2');
INSERT INTO `sys_dict` VALUES (59, 3, 56, '已删除', NULL, '3');

-- ----------------------------
-- Table structure for sys_expense
-- ----------------------------
DROP TABLE IF EXISTS `sys_expense`;
CREATE TABLE `sys_expense`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` decimal(20, 2) NULL DEFAULT NULL COMMENT '报销金额',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '描述',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `state` int(11) NULL DEFAULT NULL COMMENT '状态: 1.待提交  2:待审核   3.审核通过 4:驳回',
  `userid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `processId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程定义id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报销表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) NULL DEFAULT NULL COMMENT '管理员id',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否执行成功',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '具体消息',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 217 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (217, '登录日志', 1, '2019-11-09 12:03:06', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (218, '登录日志', 1, '2019-11-09 12:09:46', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (219, '登录日志', 1, '2019-11-09 14:01:33', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (220, '登录日志', 1, '2019-11-09 14:39:47', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (221, '登录日志', 1, '2019-11-09 15:18:35', '成功', NULL, '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单编号',
  `pcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单父编号',
  `pcodes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前菜单的所有父菜单编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url地址',
  `num` int(65) NULL DEFAULT NULL COMMENT '菜单排序号',
  `levels` int(65) NULL DEFAULT NULL COMMENT '菜单层级',
  `ismenu` int(11) NULL DEFAULT NULL COMMENT '是否是菜单（1：是  0：不是）',
  `tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` int(65) NULL DEFAULT NULL COMMENT '菜单状态 :  1:启用   0:不启用',
  `isopen` int(11) NULL DEFAULT NULL COMMENT '是否打开:    1:打开   0:不打开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 171 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (105, 'system', '0', '[0],', '系统管理', 'fa-user', '#', 2, 1, 1, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (106, 'mgr', 'system', '[0],[system],', '用户管理', '', '/mgr', 4, 2, 1, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (107, 'mgr_add', 'mgr', '[0],[system],[mgr],', '添加用户', NULL, '/mgr/add', 1, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (108, 'mgr_edit', 'mgr', '[0],[system],[mgr],', '修改用户', NULL, '/mgr/edit', 2, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (109, 'mgr_delete', 'mgr', '[0],[system],[mgr],', '删除用户', NULL, '/mgr/delete', 3, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (110, 'mgr_reset', 'mgr', '[0],[system],[mgr],', '重置密码', NULL, '/mgr/reset', 4, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (111, 'mgr_freeze', 'mgr', '[0],[system],[mgr],', '冻结用户', NULL, '/mgr/freeze', 5, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (112, 'mgr_unfreeze', 'mgr', '[0],[system],[mgr],', '解除冻结用户', NULL, '/mgr/unfreeze', 6, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (113, 'mgr_setRole', 'mgr', '[0],[system],[mgr],', '分配角色', NULL, '/mgr/setRole', 7, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (114, 'role', 'system', '[0],[system],', '角色管理', NULL, '/role', 2, 2, 1, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (115, 'role_add', 'role', '[0],[system],[role],', '添加角色', NULL, '/role/add', 1, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (116, 'role_edit', 'role', '[0],[system],[role],', '修改角色', NULL, '/role/edit', 2, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (117, 'role_remove', 'role', '[0],[system],[role],', '删除角色', NULL, '/role/remove', 3, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (118, 'role_setAuthority', 'role', '[0],[system],[role],', '配置权限', NULL, '/role/setAuthority', 4, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (119, 'menu', 'system', '[0],[system],', '菜单管理', '', '/menu', 1, 2, 1, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (120, 'menu_add', 'menu', '[0],[system],[menu],', '添加菜单', NULL, '/menu/add', 1, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (121, 'menu_edit', 'menu', '[0],[system],[menu],', '修改菜单', NULL, '/menu/edit', 2, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (122, 'menu_remove', 'menu', '[0],[system],[menu],', '删除菜单', NULL, '/menu/remove', 3, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (128, 'log', 'system', '[0],[system],', '业务日志', '', '/log', 7, 2, 1, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (130, 'druid', 'system', '[0],[system],', '监控管理', '', '/druid', 10, 2, 1, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (131, 'dept', 'system', '[0],[system],', '部门管理', '', '/dept', 3, 2, 1, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (132, 'dict', 'system', '[0],[system],', '字典管理', '', '/dict', 5, 2, 1, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (133, 'loginLog', 'system', '[0],[system],', '登录日志', NULL, '/loginLog', 6, 2, 1, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (134, 'log_clean', 'log', '[0],[system],[log],', '清空日志', NULL, '/log/delLog', 3, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (135, 'dept_add', 'dept', '[0],[system],[dept],', '添加部门', NULL, '/dept/add', 1, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (136, 'dept_update', 'dept', '[0],[system],[dept],', '修改部门', NULL, '/dept/update', 1, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (137, 'dept_delete', 'dept', '[0],[system],[dept],', '删除部门', NULL, '/dept/delete', 1, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (138, 'dict_add', 'dict', '[0],[system],[dict],', '添加字典', NULL, '/dict/add', 1, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (139, 'dict_update', 'dict', '[0],[system],[dict],', '修改字典', NULL, '/dict/update', 1, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (140, 'dict_delete', 'dict', '[0],[system],[dict],', '删除字典', NULL, '/dict/delete', 1, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (141, 'notice', 'system', '[0],[system],', '通知管理', NULL, '/notice', 9, 2, 1, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (142, 'notice_add', 'notice', '[0],[system],[notice],', '添加通知', NULL, '/notice/add', 1, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (143, 'notice_update', 'notice', '[0],[system],[notice],', '修改通知', NULL, '/notice/update', 2, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (144, 'notice_delete', 'notice', '[0],[system],[notice],', '删除通知', NULL, '/notice/delete', 3, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (145, 'hello', '0', '[0],', '通知', 'fa-rocket', '/notice/hello', 1, 1, 1, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (148, 'code', '0', '[0],', '代码生成', 'fa-code', '/code', 3, 1, 1, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (149, 'api_mgr', '0', '[0],', '接口文档', 'fa-leaf', '/swagger-ui.html', 4, 1, 1, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (150, 'to_menu_edit', 'menu', '[0],[system],[menu],', '菜单编辑跳转', '', '/menu/menu_edit', 4, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (151, 'menu_list', 'menu', '[0],[system],[menu],', '菜单列表', '', '/menu/list', 5, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (152, 'to_dept_update', 'dept', '[0],[system],[dept],', '修改部门跳转', '', '/dept/dept_update', 4, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (153, 'dept_list', 'dept', '[0],[system],[dept],', '部门列表', '', '/dept/list', 5, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (154, 'dept_detail', 'dept', '[0],[system],[dept],', '部门详情', '', '/dept/detail', 6, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (155, 'to_dict_edit', 'dict', '[0],[system],[dict],', '修改菜单跳转', '', '/dict/dict_edit', 4, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (156, 'dict_list', 'dict', '[0],[system],[dict],', '字典列表', '', '/dict/list', 5, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (157, 'dict_detail', 'dict', '[0],[system],[dict],', '字典详情', '', '/dict/detail', 6, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (158, 'log_list', 'log', '[0],[system],[log],', '日志列表', '', '/log/list', 2, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (159, 'log_detail', 'log', '[0],[system],[log],', '日志详情', '', '/log/detail', 3, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (160, 'del_login_log', 'loginLog', '[0],[system],[loginLog],', '清空登录日志', '', '/loginLog/delLoginLog', 1, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (161, 'login_log_list', 'loginLog', '[0],[system],[loginLog],', '登录日志列表', '', '/loginLog/list', 2, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (162, 'to_role_edit', 'role', '[0],[system],[role],', '修改角色跳转', '', '/role/role_edit', 5, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (163, 'to_role_assign', 'role', '[0],[system],[role],', '角色分配跳转', '', '/role/role_assign', 6, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (164, 'role_list', 'role', '[0],[system],[role],', '角色列表', '', '/role/list', 7, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (165, 'to_assign_role', 'mgr', '[0],[system],[mgr],', '分配角色跳转', '', '/mgr/role_assign', 8, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (166, 'to_user_edit', 'mgr', '[0],[system],[mgr],', '编辑用户跳转', '', '/mgr/user_edit', 9, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (167, 'mgr_list', 'mgr', '[0],[system],[mgr],', '用户列表', '', '/mgr/list', 10, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1193064057927852034, 'book', '0', '[0],', '快看', 'book', '/book', 99, 1, 1, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1193064057927852035, 'book_list', 'book', '[0],[system],[book],', '列表', '', '/book/list', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1193064057927852036, 'book_add', 'book', '[0],[system],[book],', '添加', '', '/book/add', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1193064057927852037, 'book_update', 'book', '[0],[system],[book],', '更新', '', '/book/update', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1193064057927852038, 'book_delete', 'book', '[0],[system],[book],', '删除', '', '/book/delete', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1193064057927852039, 'book_detail', 'book', '[0],[system],[book],', '详情', '', '/book/detail', 99, 3, 0, NULL, 1, 0);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creater` int(11) NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (6, '世界', 10, '欢迎使用Guns管理系统', '2017-01-11 08:53:20', 1);
INSERT INTO `sys_notice` VALUES (8, '你好', NULL, '你好', '2017-05-10 19:28:57', 1);

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log`  (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logtype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志类型',
  `logname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) NULL DEFAULT NULL COMMENT '用户id',
  `classname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类名称',
  `method` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '方法名称',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否成功',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 554 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO `sys_operation_log` VALUES (554, '异常日志', '', 1, NULL, NULL, '2019-11-09 12:10:06', '失败', 'org.springframework.web.method.annotation.MethodArgumentTypeMismatchException: Failed to convert value of type \'java.lang.String\' to required type \'java.lang.Integer\'; nested exception is java.lang.NumberFormatException: For input string: \"undefined\"\r\n	at org.springframework.web.method.annotation.AbstractNamedValueMethodArgumentResolver.resolveArgument(AbstractNamedValueMethodArgumentResolver.java:131)\r\n	at org.springframework.web.method.support.HandlerMethodArgumentResolverComposite.resolveArgument(HandlerMethodArgumentResolverComposite.java:124)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.getMethodArgumentValues(InvocableHandlerMethod.java:161)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:131)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:866)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: java.lang.NumberFormatException: For input string: \"undefined\"\r\n	at java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)\r\n	at java.lang.Integer.parseInt(Integer.java:580)\r\n	at java.lang.Integer.valueOf(Integer.java:766)\r\n	at org.springframework.util.NumberUtils.parseNumber(NumberUtils.java:210)\r\n	at org.springframework.beans.propertyeditors.CustomNumberEditor.setAsText(CustomNumberEditor.java:115)\r\n	at org.springframework.beans.TypeConverterDelegate.doConvertTextValue(TypeConverterDelegate.java:466)\r\n	at org.springframework.beans.TypeConverterDelegate.doConvertValue(TypeConverterDelegate.java:439)\r\n	at org.springframework.beans.TypeConverterDelegate.convertIfNecessary(TypeConverterDelegate.java:192)\r\n	at org.springframework.beans.TypeConverterDelegate.convertIfNecessary(TypeConverterDelegate.java:99)\r\n	at org.springframework.beans.TypeConverterSupport.doConvert(TypeConverterSupport.java:73)\r\n	at org.springframework.beans.TypeConverterSupport.convertIfNecessary(TypeConverterSupport.java:52)\r\n	at org.springframework.validation.DataBinder.convertIfNecessary(DataBinder.java:692)\r\n	at org.springframework.web.method.annotation.AbstractNamedValueMethodArgumentResolver.resolveArgument(AbstractNamedValueMethodArgumentResolver.java:123)\r\n	... 71 more\r\n');
INSERT INTO `sys_operation_log` VALUES (555, '业务日志', '配置权限', 1, 'com.wpc.guns.modular.system.controller.RoleController', 'setAuthority', '2019-11-09 14:51:37', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档');
INSERT INTO `sys_operation_log` VALUES (556, '业务日志', '删除菜单', 1, 'com.wpc.guns.modular.system.controller.MenuController', 'remove', '2019-11-09 14:51:52', '成功', '菜单id=1193016692604866562');
INSERT INTO `sys_operation_log` VALUES (557, '业务日志', '修改菜单', 1, 'com.wpc.guns.modular.system.controller.MenuController', 'edit', '2019-11-09 14:58:16', '成功', '菜单名称=接口文档;;;字段名称:菜单排序号,旧值:2,新值:3');
INSERT INTO `sys_operation_log` VALUES (558, '业务日志', '修改菜单', 1, 'com.wpc.guns.modular.system.controller.MenuController', 'edit', '2019-11-09 15:11:28', '成功', '菜单名称=系统管理;;;字段名称:菜单排序号,旧值:4,新值:2');
INSERT INTO `sys_operation_log` VALUES (559, '业务日志', '修改菜单', 1, 'com.wpc.guns.modular.system.controller.MenuController', 'edit', '2019-11-09 15:11:41', '成功', '菜单名称=接口文档;;;字段名称:菜单排序号,旧值:3,新值:4');
INSERT INTO `sys_operation_log` VALUES (560, '业务日志', '修改菜单', 1, 'com.wpc.guns.modular.system.controller.MenuController', 'edit', '2019-11-09 15:20:27', '成功', '菜单名称=快看;;;字段名称:菜单名称,旧值:,新值:快看');
INSERT INTO `sys_operation_log` VALUES (561, '业务日志', '修改菜单', 1, 'com.wpc.guns.modular.system.controller.MenuController', 'edit', '2019-11-09 15:20:44', '成功', '菜单名称=快看;;;字段名称:菜单父编号,旧值:105,新值:0');
INSERT INTO `sys_operation_log` VALUES (562, '业务日志', '修改菜单', 1, 'com.wpc.guns.modular.system.controller.MenuController', 'edit', '2019-11-09 15:21:23', '成功', '菜单名称=快看;;;字段名称:菜单图标,旧值:,新值:book');
INSERT INTO `sys_operation_log` VALUES (563, '业务日志', '修改管理员', 1, 'com.wpc.guns.modular.system.controller.UserMgrController', 'edit', '2019-11-09 15:25:24', '成功', '账号=admin;;;字段名称:头像,旧值:girl.gif,新值:94dcf9a2-e4e8-468e-8c89-81c67035c3e7.jpg;;;字段名称:null,旧值:ecfadcde9305f8891bcfe5a1e28c253e,新值:');
INSERT INTO `sys_operation_log` VALUES (564, '业务日志', '修改菜单', 1, 'com.wpc.guns.modular.system.controller.MenuController', 'edit', '2019-11-09 15:28:50', '成功', '菜单名称=菜单管理;;;字段名称:菜单排序号,旧值:4,新值:1');
INSERT INTO `sys_operation_log` VALUES (565, '业务日志', '修改菜单', 1, 'com.wpc.guns.modular.system.controller.MenuController', 'edit', '2019-11-09 15:29:08', '成功', '菜单名称=部门管理;;;字段名称:菜单排序号,旧值:3,新值:2');
INSERT INTO `sys_operation_log` VALUES (566, '业务日志', '修改菜单', 1, 'com.wpc.guns.modular.system.controller.MenuController', 'edit', '2019-11-09 15:30:21', '成功', '菜单名称=部门管理;;;字段名称:菜单排序号,旧值:2,新值:3');
INSERT INTO `sys_operation_log` VALUES (567, '业务日志', '修改菜单', 1, 'com.wpc.guns.modular.system.controller.MenuController', 'edit', '2019-11-09 15:30:38', '成功', '菜单名称=用户管理;;;字段名称:菜单排序号,旧值:1,新值:4');
INSERT INTO `sys_operation_log` VALUES (568, '业务日志', '修改菜单', 1, 'com.wpc.guns.modular.system.controller.MenuController', 'edit', '2019-11-09 15:31:34', '成功', '菜单名称=字典管理;;;字段名称:菜单排序号,旧值:4,新值:5');
INSERT INTO `sys_operation_log` VALUES (569, '业务日志', '修改菜单', 1, 'com.wpc.guns.modular.system.controller.MenuController', 'edit', '2019-11-09 15:32:35', '成功', '菜单名称=业务日志;;;字段名称:菜单排序号,旧值:6,新值:7');
INSERT INTO `sys_operation_log` VALUES (570, '业务日志', '修改菜单', 1, 'com.wpc.guns.modular.system.controller.MenuController', 'edit', '2019-11-09 15:33:14', '成功', '菜单名称=监控管理;;;字段名称:菜单排序号,旧值:7,新值:10');
INSERT INTO `sys_operation_log` VALUES (571, '业务日志', '删除部门', 1, 'com.wpc.guns.modular.system.controller.DeptController', 'delete', '2019-11-09 15:34:05', '成功', '部门名称=战略部');
INSERT INTO `sys_operation_log` VALUES (572, '业务日志', '删除部门', 1, 'com.wpc.guns.modular.system.controller.DeptController', 'delete', '2019-11-09 15:34:08', '成功', '部门名称=运营部');
INSERT INTO `sys_operation_log` VALUES (573, '业务日志', '修改管理员', 1, 'com.wpc.guns.modular.system.controller.UserMgrController', 'edit', '2019-11-09 15:35:31', '成功', '账号=admin;;;字段名称:头像,旧值:94dcf9a2-e4e8-468e-8c89-81c67035c3e7.jpg,新值:;;;字段名称:null,旧值:ecfadcde9305f8891bcfe5a1e28c253e,新值:;;;字段名称:名字,旧值:张三,新值:W鹏程;;;字段名称:性别,旧值:女,新值:男;;;字段名称:电子邮件,旧值:sn93@qq.com,新值:123@qq.com;;;字段名称:电话,旧值:18200000000,新值:18800000000;;;字段名称:部门名称,旧值:战略部,新值:');
INSERT INTO `sys_operation_log` VALUES (574, '业务日志', '修改角色', 1, 'com.wpc.guns.modular.system.controller.RoleController', 'edit', '2019-11-09 15:36:41', '成功', '角色名称=超级管理员;;;字段名称:部门名称,旧值:总公司,新值:');
INSERT INTO `sys_operation_log` VALUES (575, '业务日志', '修改角色', 1, 'com.wpc.guns.modular.system.controller.RoleController', 'edit', '2019-11-09 15:37:17', '成功', '角色名称=管理员;;;字段名称:角色名称,旧值:临时,新值:管理员;;;字段名称:部门名称,旧值:,新值:;;;字段名称:备注,旧值:temp,新值:manger');
INSERT INTO `sys_operation_log` VALUES (576, '业务日志', '分配角色', 1, 'com.wpc.guns.modular.system.controller.UserMgrController', 'setRole', '2019-11-09 15:37:48', '成功', '账号=boss,角色名称集合=管理员');
INSERT INTO `sys_operation_log` VALUES (577, '业务日志', '分配角色', 1, 'com.wpc.guns.modular.system.controller.UserMgrController', 'setRole', '2019-11-09 15:37:52', '成功', '账号=manager,角色名称集合=管理员');

-- ----------------------------
-- Table structure for sys_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_relation`;
CREATE TABLE `sys_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menuid` bigint(11) NULL DEFAULT NULL COMMENT '菜单id',
  `roleid` int(11) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3792 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_relation
-- ----------------------------
INSERT INTO `sys_relation` VALUES (3377, 105, 5);
INSERT INTO `sys_relation` VALUES (3378, 106, 5);
INSERT INTO `sys_relation` VALUES (3379, 107, 5);
INSERT INTO `sys_relation` VALUES (3380, 108, 5);
INSERT INTO `sys_relation` VALUES (3381, 109, 5);
INSERT INTO `sys_relation` VALUES (3382, 110, 5);
INSERT INTO `sys_relation` VALUES (3383, 111, 5);
INSERT INTO `sys_relation` VALUES (3384, 112, 5);
INSERT INTO `sys_relation` VALUES (3385, 113, 5);
INSERT INTO `sys_relation` VALUES (3386, 114, 5);
INSERT INTO `sys_relation` VALUES (3387, 115, 5);
INSERT INTO `sys_relation` VALUES (3388, 116, 5);
INSERT INTO `sys_relation` VALUES (3389, 117, 5);
INSERT INTO `sys_relation` VALUES (3390, 118, 5);
INSERT INTO `sys_relation` VALUES (3391, 119, 5);
INSERT INTO `sys_relation` VALUES (3392, 120, 5);
INSERT INTO `sys_relation` VALUES (3393, 121, 5);
INSERT INTO `sys_relation` VALUES (3394, 122, 5);
INSERT INTO `sys_relation` VALUES (3395, 150, 5);
INSERT INTO `sys_relation` VALUES (3396, 151, 5);
INSERT INTO `sys_relation` VALUES (3908, 105, 1);
INSERT INTO `sys_relation` VALUES (3909, 106, 1);
INSERT INTO `sys_relation` VALUES (3910, 107, 1);
INSERT INTO `sys_relation` VALUES (3911, 108, 1);
INSERT INTO `sys_relation` VALUES (3912, 109, 1);
INSERT INTO `sys_relation` VALUES (3913, 110, 1);
INSERT INTO `sys_relation` VALUES (3914, 111, 1);
INSERT INTO `sys_relation` VALUES (3915, 112, 1);
INSERT INTO `sys_relation` VALUES (3916, 113, 1);
INSERT INTO `sys_relation` VALUES (3917, 165, 1);
INSERT INTO `sys_relation` VALUES (3918, 166, 1);
INSERT INTO `sys_relation` VALUES (3919, 167, 1);
INSERT INTO `sys_relation` VALUES (3920, 114, 1);
INSERT INTO `sys_relation` VALUES (3921, 115, 1);
INSERT INTO `sys_relation` VALUES (3922, 116, 1);
INSERT INTO `sys_relation` VALUES (3923, 117, 1);
INSERT INTO `sys_relation` VALUES (3924, 118, 1);
INSERT INTO `sys_relation` VALUES (3925, 162, 1);
INSERT INTO `sys_relation` VALUES (3926, 163, 1);
INSERT INTO `sys_relation` VALUES (3927, 164, 1);
INSERT INTO `sys_relation` VALUES (3928, 119, 1);
INSERT INTO `sys_relation` VALUES (3929, 120, 1);
INSERT INTO `sys_relation` VALUES (3930, 121, 1);
INSERT INTO `sys_relation` VALUES (3931, 122, 1);
INSERT INTO `sys_relation` VALUES (3932, 150, 1);
INSERT INTO `sys_relation` VALUES (3933, 151, 1);
INSERT INTO `sys_relation` VALUES (3934, 128, 1);
INSERT INTO `sys_relation` VALUES (3935, 134, 1);
INSERT INTO `sys_relation` VALUES (3936, 158, 1);
INSERT INTO `sys_relation` VALUES (3937, 159, 1);
INSERT INTO `sys_relation` VALUES (3938, 130, 1);
INSERT INTO `sys_relation` VALUES (3939, 131, 1);
INSERT INTO `sys_relation` VALUES (3940, 135, 1);
INSERT INTO `sys_relation` VALUES (3941, 136, 1);
INSERT INTO `sys_relation` VALUES (3942, 137, 1);
INSERT INTO `sys_relation` VALUES (3943, 152, 1);
INSERT INTO `sys_relation` VALUES (3944, 153, 1);
INSERT INTO `sys_relation` VALUES (3945, 154, 1);
INSERT INTO `sys_relation` VALUES (3946, 132, 1);
INSERT INTO `sys_relation` VALUES (3947, 138, 1);
INSERT INTO `sys_relation` VALUES (3948, 139, 1);
INSERT INTO `sys_relation` VALUES (3949, 140, 1);
INSERT INTO `sys_relation` VALUES (3950, 155, 1);
INSERT INTO `sys_relation` VALUES (3951, 156, 1);
INSERT INTO `sys_relation` VALUES (3952, 157, 1);
INSERT INTO `sys_relation` VALUES (3953, 133, 1);
INSERT INTO `sys_relation` VALUES (3954, 160, 1);
INSERT INTO `sys_relation` VALUES (3955, 161, 1);
INSERT INTO `sys_relation` VALUES (3956, 141, 1);
INSERT INTO `sys_relation` VALUES (3957, 142, 1);
INSERT INTO `sys_relation` VALUES (3958, 143, 1);
INSERT INTO `sys_relation` VALUES (3959, 144, 1);
INSERT INTO `sys_relation` VALUES (3960, 145, 1);
INSERT INTO `sys_relation` VALUES (3961, 148, 1);
INSERT INTO `sys_relation` VALUES (3962, 149, 1);
INSERT INTO `sys_relation` VALUES (3963, 1193064057927852034, 1);
INSERT INTO `sys_relation` VALUES (3964, 1193064057927852035, 1);
INSERT INTO `sys_relation` VALUES (3965, 1193064057927852036, 1);
INSERT INTO `sys_relation` VALUES (3966, 1193064057927852037, 1);
INSERT INTO `sys_relation` VALUES (3967, 1193064057927852038, 1);
INSERT INTO `sys_relation` VALUES (3968, 1193064057927852039, 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) NULL DEFAULT NULL COMMENT '序号',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父角色id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `deptid` int(11) NULL DEFAULT NULL COMMENT '部门名称',
  `tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提示',
  `version` int(11) NULL DEFAULT NULL COMMENT '保留字段(暂时没用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 1, 0, '超级管理员', 0, 'administrator', 1);
INSERT INTO `sys_role` VALUES (5, 2, 1, '管理员', 0, 'manger', NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `account` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'md5密码盐',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `sex` int(11) NULL DEFAULT NULL COMMENT '性别（1：男 2：女）',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `roleid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `deptid` int(11) NULL DEFAULT NULL COMMENT '部门id',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态(1：启用  2：冻结  3：删除）',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `version` int(11) NULL DEFAULT NULL COMMENT '保留字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '94dcf9a2-e4e8-468e-8c89-81c67035c3e7.jpg', 'admin', 'ecfadcde9305f8891bcfe5a1e28c253e', '8pgby', 'W鹏程', '2017-05-05 00:00:00', 1, '123@qq.com', '18800000000', '1', 0, 1, '2016-01-29 08:49:53', 25);
INSERT INTO `sys_user` VALUES (44, NULL, 'test', '45abb7879f6a8268f1ef600e6038ac73', 'ssts3', 'test', '2017-05-01 00:00:00', 1, 'abc@123.com', '', '5', 26, 3, '2017-05-16 20:33:37', NULL);
INSERT INTO `sys_user` VALUES (45, NULL, 'boss', '71887a5ad666a18f709e1d4e693d5a35', '1f7bf', '老板', '2017-12-04 00:00:00', 1, '', '', '5', 24, 1, '2017-12-04 22:24:02', NULL);
INSERT INTO `sys_user` VALUES (46, NULL, 'manager', 'b53cac62e7175637d4beb3b16b2f7915', 'j3cs9', '经理', '2017-12-04 00:00:00', 1, '', '', '5', 24, 1, '2017-12-04 22:24:24', NULL);

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `aaa` int(11) NOT NULL AUTO_INCREMENT,
  `bbb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`aaa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES (12, '2');

SET FOREIGN_KEY_CHECKS = 1;
