-- Relations for the `maps_collectables` table.
--
-- A collectable belongs to a map.
-- A collectable is a collectable.

ALTER TABLE `maps_collectables`
    ADD CONSTRAINT `maps_collectables_maps` FOREIGN KEY `maps_collectables_maps` (`maps_id`)
        REFERENCES `maps` (`id`);

ALTER TABLE `maps_collectables`
    ADD CONSTRAINT `maps_collectables_collectables` FOREIGN KEY `maps_collectables_collectables` (`collectables_id`)
        REFERENCES `collectables` (`id`);
