-- Relations for the `maps_stations` table.
--
-- A station belongs to a map.
-- A station belongs to a faction.

ALTER TABLE `maps_stations` ADD CONSTRAINT `maps_stations_maps` FOREIGN KEY `maps_stations_maps` (`maps_id`)
    REFERENCES `maps` (`id`);

ALTER TABLE `maps_stations` ADD CONSTRAINT `maps_stations_factions` FOREIGN KEY `maps_stations_factions` (`factions_id`)
    REFERENCES `factions` (`id`);
