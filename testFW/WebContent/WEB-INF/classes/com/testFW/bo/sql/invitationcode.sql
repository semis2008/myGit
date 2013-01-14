CREATE TABLE `invitationcode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '邀请码',
  `state` int(10) NOT NULL DEFAULT '0' COMMENT '0：有效的，1：已使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8