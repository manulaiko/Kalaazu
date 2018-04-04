-- Map's stations table.
--
-- Stations on map.
--
CREATE TABLE `maps_stations` (
    `id`          int   NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `position`    point NOT NULL                COMMENT 'Position on map.',
    `maps_id`     int   NULL     DEFAULT NULL,
    `factions_id` int   NULL     DEFAULT NULL,

    CONSTRAINT `maps_stations_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Stations on map.';

CREATE INDEX `maps_portals_factions_id_idx` ON `maps_stations` (`factions_id`);
CREATE INDEX `maps_portals_maps_id_idx` ON `maps_stations` (`maps_id`);
