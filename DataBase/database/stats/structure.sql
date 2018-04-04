-- Stats table.
--
-- Server statistics.
--
CREATE TABLE `stats` (
    `key`   varchar(255) NOT NULL DEFAULT '',
    `value` varchar(255) NOT NULL DEFAULT '',

    CONSTRAINT `stats_pk` PRIMARY KEY (`key`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Server statistics.';
