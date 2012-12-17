CREATE TABLE `kalor`.`user_relation` (
	`id` BIGINT NOT NULL,
	`userid` BIGINT NOT NULL,
	`followid` BIGINT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE INDEX `userid` ON `kalor`.`user_relation` (`userid` ASC);

CREATE INDEX `followid` ON `kalor`.`user_relation` (`followid` ASC);

