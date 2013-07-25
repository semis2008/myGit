CREATE TABLE `picture` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(50) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `info` varchar(200) DEFAULT NULL,
  `src` varchar(200) NOT NULL,
  `praise_num` bigint(50) DEFAULT NULL,
  `down_num` bigint(50) DEFAULT NULL,
  `status` bigint(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8