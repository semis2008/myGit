CREATE TABLE `album` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `author_id` bigint(50) NOT NULL,
  `author_name` varchar(200) NOT NULL,
  `creat_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(200) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `equipment` varchar(200) DEFAULT NULL,
  `front_cover` varchar(200) DEFAULT NULL,
  `praise_num` bigint(50) NOT NULL DEFAULT '0',
  `status` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8