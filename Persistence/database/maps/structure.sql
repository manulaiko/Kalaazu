-- Maps table.
--
-- In game maps.
--
CREATE TABLE `maps`
(
    `id`          tinyint      NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `name`        varchar(255) NOT NULL DEFAULT ''
        COMMENT 'Map name.',
    `factions_id` tinyint      NULL     DEFAULT NULL,
    `is_pvp`      boolean      NOT NULL DEFAULT false,
    `is_starter`  boolean      NOT NULL DEFAULT false,
    `limits`      bigint       NOT NULL DEFAULT 89335319769600,

    CONSTRAINT `maps_pk` PRIMARY KEY (`id`)
)
    ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'In game maps.';

CREATE UNIQUE INDEX `maps_name_idx`
    ON `maps` (`name`);
