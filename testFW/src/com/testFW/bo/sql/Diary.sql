CREATE TABLE `diary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` varchar(500) NOT NULL,
  `author_id` bigint(20) NOT NULL COMMENT '作者id',
  `publish_time` datetime NOT NULL COMMENT '发表时间',
  `tags` varchar(50) DEFAULT NULL COMMENT '标签。最多3个，标签之间用‘_’连接',
  `status` varchar(20) DEFAULT NULL COMMENT '日志状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8