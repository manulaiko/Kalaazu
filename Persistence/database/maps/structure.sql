-- Maps table.
--
-- In game maps.
--
CREATE TABLE `maps`
(
    `id`         smallint     NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `name`       varchar(255) NOT NULL DEFAULT ''
        COMMENT 'Map name.',
    `is_pvp`     boolean      NOT NULL DEFAULT false,
    `is_starter` boolean      NOT NULL DEFAULT false,
    `limits`     varchar(255) NOT NULL DEFAULT '0,0|20800,12800',

    CONSTRAINT `maps_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
  CHARACTER SET utf8
    COMMENT 'In game maps.';

CREATE UNIQUE INDEX `maps_name_idx`
    ON `maps` (`name`);
