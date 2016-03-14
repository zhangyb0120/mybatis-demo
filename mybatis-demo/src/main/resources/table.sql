CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(100) NOT NULL DEFAULT '' COMMENT '用户名',
  `realname` varchar(100) NOT NULL COMMENT '真实姓名',
  `password` varchar(100) NOT NULL DEFAULT '' COMMENT '密码',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '锁定状态；0：未锁定；1：已锁定',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `mobile_number` varchar(15) NOT NULL DEFAULT '' COMMENT '手机号',
  `sms_code` char(6) NOT NULL DEFAULT '' COMMENT '短信验证码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='管理员账户表';
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `locked`, `create_time`, `mobile_number`, `sms_code`) VALUES ('1001', 'qulin', '屈林', '183854667E2081A9', '0', '2015-06-17 14:38:56', '18664573291', '8606');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `locked`, `create_time`, `mobile_number`, `sms_code`) VALUES ('1002', 'hanxx', '韩晓茜', '0F4EB9CF6789205D', '0', '2015-06-17 14:38:56', '', '');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `locked`, `create_time`, `mobile_number`, `sms_code`) VALUES ('1003', 'zhangyb', '张益波', '95A69D92D58A85D1', '0', '2015-06-17 14:38:56', '13738043226', '6882');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `locked`, `create_time`, `mobile_number`, `sms_code`) VALUES ('1004', 'huanglh', '黄丽慧', '34A8C21DC411749D', '0', '2015-06-17 14:38:56', '18668429527', '6308');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `locked`, `create_time`, `mobile_number`, `sms_code`) VALUES ('1005', 'hejl', '何嘉琳', 'DCA6C9E61DFCE315', '0', '2015-06-17 14:38:56', '18667175794', '5075');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `locked`, `create_time`, `mobile_number`, `sms_code`) VALUES ('1006', 'zyw', '老尼', '187BF2AD62F21FB4', '0', '2015-06-17 14:38:56', '13764425713', '8477');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `locked`, `create_time`, `mobile_number`, `sms_code`) VALUES ('1007', 'mohh', '老莫', 'C760B9769539B633', '0', '2015-06-17 14:38:56', '18657179261', '1725');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `locked`, `create_time`, `mobile_number`, `sms_code`) VALUES ('1008', 'huj', '胡静', 'C7BF0AB2B6DC0B19', '0', '2015-06-17 14:38:56', '18668116321', '9856');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `locked`, `create_time`, `mobile_number`, `sms_code`) VALUES ('1009', 'shenghj', '盛华静', 'A26E183FEE727C2A', '0', '2015-06-17 14:38:56', '15068747616', '2284');
INSERT INTO `user` (`id`, `username`, `realname`, `password`, `locked`, `create_time`, `mobile_number`, `sms_code`) VALUES ('1010', 'xiamq', '夏梦倩', '637470D9F7DD668E', '0', '2015-06-17 14:38:56', '', '');

CREATE TABLE `realm_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role` varchar(100) DEFAULT '' COMMENT '角色标识 程序中判断使用,如"管理员"',
  `description` varchar(100) DEFAULT '' COMMENT '角色描述,UI界面显示使用',
  `is_available` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否可用；0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='角色表';

CREATE TABLE `realm_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `permission` varchar(100) DEFAULT '' COMMENT '权限',
  `category` varchar(100) DEFAULT '' COMMENT '权限组别',
  `description` varchar(100) DEFAULT '' COMMENT '权限描述',
  `is_available` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否可用；0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='权限表V2';

CREATE TABLE `relation_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `realm_role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_role` (`realm_role_id`,`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='管理员角色关联表V2';

CREATE TABLE `relation_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `realm_role_id` int(11) NOT NULL COMMENT '角色ID',
  `realm_permission_id` int(11) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_role_permission` (`realm_role_id`,`realm_permission_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='角色权限关联表V2';

CREATE TABLE `relation_user_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `realm_permission_id` int(11) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_permission` (`user_id`,`realm_permission_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='用户权限表V2';