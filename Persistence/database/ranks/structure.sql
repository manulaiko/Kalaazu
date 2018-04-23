-- Ranks table.
--
-- Contains the rank system.
--
CREATE TABLE `ranks` (
    `id`         tinyint      NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `name`       varchar(255) NOT NULL DEFAULT '',
    `percentaje` float        NOT NULL DEFAULT 0.0,
    `is_public`  boolean      NOT NULL DEFAULT 1,

    CONSTRAINT `ranks_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Contains the rank system.';
