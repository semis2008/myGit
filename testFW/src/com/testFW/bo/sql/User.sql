CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(64) NOT NULL,
  `gender` int(4) DEFAULT NULL,
  `reg_time` datetime DEFAULT NULL,
  `logon_time` datetime DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8