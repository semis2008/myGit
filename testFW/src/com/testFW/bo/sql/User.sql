CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(64) NOT NULL,
  `birthday` datetime DEFAULT NULL,
  `gender` int(4) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `reg_time` datetime DEFAULT NULL,
  `logon_time` datetime DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `msn` varchar(20) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `integral` bigint(20) NOT NULL DEFAULT '0' COMMENT '积分',
  `authority` bigint(20) NOT NULL DEFAULT '0' COMMENT '权限',
  `state` varchar(20) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8