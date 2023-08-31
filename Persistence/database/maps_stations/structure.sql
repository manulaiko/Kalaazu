-- Map's stations table.
--
-- Stations on map.
--
CREATE TABLE `maps_stations`
(
    `id`          tinyint NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `position`    bigint  NOT NULL DEFAULT 0
        COMMENT 'Position on map.',
    `maps_id`     tinyint NULL DEFAULT NULL,
    `factions_id` tinyint NULL DEFAULT NULL,

    CONSTRAINT `maps_stations_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Stations on map.';

CREATE INDEX `maps_stations_factions_id_idx`
    ON `maps_stations` (`factions_id`);
CREATE INDEX `maps_stations_maps_id_idx`
    ON `maps_stations` (`maps_id`);
