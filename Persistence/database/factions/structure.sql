-- Factions table.
--
-- Contains server's factions.
--
CREATE TABLE `factions`
(
    `id`                 tinyint      NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `name`               varchar(255) NOT NULL DEFAULT '',
    `tag`                varchar(3)   NOT NULL DEFAULT ''
        COMMENT 'Name abbreviation.',
    `description`        text         NOT NULL,
    `is_public`          boolean      NOT NULL DEFAULT true,
    `low_maps_id`        tinyint      NOT NULL,
    `low_maps_position`  bigint       NOT NULL DEFAULT 0
        COMMENT 'Starting position on map.',
    `high_maps_id`       tinyint      NOT NULL,
    `high_maps_position` bigint       NOT NULL DEFAULT 0
        COMMENT 'Starting position on map.',

    CONSTRAINT `factions_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Contains server''s factions.';

CREATE UNIQUE INDEX `factions_name_idx`
    ON `factions` (`name`);
CREATE UNIQUE INDEX `factions_tag_idx`
    ON `factions` (`tag`);
