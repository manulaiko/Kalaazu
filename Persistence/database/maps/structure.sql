-- Maps table.
--
-- In game maps.
--
CREATE TABLE `maps` (
    `id`           tinyint      NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `name`         varchar(255) NOT NULL DEFAULT ''     COMMENT 'Map name.',
    `factions_id`  tinyint      NULL     DEFAULT NULL,
    `is_pvp`       boolean      NOT NULL DEFAULT 0,
    `is_starter`   boolean      NOT NULL DEFAULT 0,
    `limits`       varchar(15)  NOT NULL DEFAULT '20800,12800',

    CONSTRAINT `maps_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'In game maps.';

CREATE  UNIQUE INDEX `maps_name_idx` ON `maps` (`name`);
