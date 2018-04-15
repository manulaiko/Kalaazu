-- Maps table.
--
-- In game maps.
--
CREATE TABLE `maps` (
    `id`           int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `name`         varchar(255) NOT NULL DEFAULT ''     COMMENT 'Map name.',
    `factions_id`  int          NULL     DEFAULT NULL,
    `is_pvp`       bit(1)       NOT NULL DEFAULT 0,
    `is_starter`   bit(1)       NOT NULL DEFAULT 0,
    `limits`       point        NOT NULL,

    CONSTRAINT `maps_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'In game maps.';

CREATE  UNIQUE INDEX `maps_name_idx` ON `maps` (`name`);
