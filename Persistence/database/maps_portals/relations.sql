-- Relations for the `maps_portals` table.
--
-- A portal belongs to a map.
-- A portal targets a map

ALTER TABLE `maps_portals`
    ADD CONSTRAINT `maps_portals_maps` FOREIGN KEY `maps_portals_maps` (`maps_id`)
    REFERENCES `maps` (`id`);

ALTER TABLE `maps_portals`
    ADD CONSTRAINT `maps_portals_target_maps` FOREIGN KEY `maps_portals_to_maps` (`target_maps_id`)
    REFERENCES `maps` (`id`);
