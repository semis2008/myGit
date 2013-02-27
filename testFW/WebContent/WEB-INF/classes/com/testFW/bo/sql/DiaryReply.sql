CREATE TABLE `diary_reply` (
  `id` bigint(20) NOT NULL auto_increment,
  `diary_id` bigint(20) NOT NULL,
  `user_id` bigint(20) default NULL,
  `user_name` varchar(50) NOT NULL,
  `reply` varchar(500) NOT NULL,
  `email` varchar(200) NOT NULL,
  `website` varchar(200) default NULL,
  `reply_time` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  `parent_id` bigint(20) NOT NULL default '0',
  `type` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8