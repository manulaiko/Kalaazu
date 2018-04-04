-- Ranks table.
--
-- Contains the rank system.
--
CREATE TABLE `ranks` (
    `id`         int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `name`       varchar(255) NOT NULL DEFAULT '',
    `percentaje` decimal(5,2) NOT NULL DEFAULT 0.0,
    `is_public`  bit(1)       NOT NULL DEFAULT 1,

    CONSTRAINT `ranks_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Contains the rank system.';
