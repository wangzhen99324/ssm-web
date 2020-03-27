CREATE TABLE `dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `dept_name` varchar(64) NOT NULL DEFAULT '' COMMENT '部门名称',
  `dept_desc` varchar(64) NOT NULL DEFAULT '' COMMENT '部门简介',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT='部门表';

CREATE TABLE `jiaqi_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT='假期类别表';

CREATE TABLE `jiaqishenqing` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `staff_name` varchar(255) NOT NULL COMMENT '申请人',
  `kaishishijian` varchar(255) DEFAULT NULL COMMENT '开始时间',
  `jieshushijian` varchar(255) DEFAULT NULL COMMENT '结束时间',
  `shichang` varchar(255) DEFAULT NULL COMMENT '时长',
  `jiaqileixing` varchar(255) DEFAULT NULL COMMENT '假期类型',
  `yuanyin` varchar(255) DEFAULT NULL COMMENT '请假理由',
  `auditor` varchar(255) DEFAULT '' COMMENT '审核人员',
  `audit_status` int(1) NOT NULL DEFAULT '0' COMMENT '审核状态 (0 审核中 1 : 批准 2 : 拒绝)',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '拒绝理由',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT='假期申请表';

CREATE TABLE `kaoqinjilu` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `kaoqinshijian` varchar(255) DEFAULT NULL COMMENT '考勤时间',
  `leibie` varchar(255) DEFAULT NULL COMMENT '类别',
  `staff_name` varchar(255) DEFAULT NULL COMMENT '职工姓名',
  `kaoqinshiduan` varchar(255) DEFAULT NULL COMMENT '考勤时段',
  `shuoming` varchar(255) DEFAULT NULL COMMENT '说明',
  `jiluren` varchar(255) DEFAULT NULL COMMENT '记录人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT='考勤记录';

CREATE TABLE `ssm_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) DEFAULT NULL COMMENT '登录账号',
  `password` varchar(100) DEFAULT NULL COMMENT '密码( MD5 加密 )',
  `role_name` varchar(20) DEFAULT '',
  `role_code` varchar(20) DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '姓名',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8;

INSERT INTO `ssm_user` VALUES (2, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员', 'admin', '', '2020-03-24 22:38:18');
INSERT INTO `ssm_user` VALUES (3, 'hr', 'e10adc3949ba59abbe56e057f20f883e', '人事管理员', 'hr', '人事', '2020-03-24 22:38:18');
INSERT INTO `ssm_user` VALUES (4, 'school', 'e10adc3949ba59abbe56e057f20f883e', '校领导', 'leader', '某主任', '2020-03-24 22:38:18');