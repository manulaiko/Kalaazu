-- Relations for the `maps` table.
--
-- A map may belong to a faction.

ALTER TABLE `maps`
    ADD CONSTRAINT `maps_factions` FOREIGN KEY `maps_factions` (`factions_id`)
    REFERENCES `factions` (`id`);
