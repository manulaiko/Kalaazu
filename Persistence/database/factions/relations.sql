-- Relations for the `factions` table.
--
-- A faction has a low starter map.
-- A faction has a high starter map.

ALTER TABLE `factions`
  ADD CONSTRAINT `factions_high_maps` FOREIGN KEY `factions_high_maps` (`high_maps_id`)
REFERENCES `maps` (`id`);

ALTER TABLE `factions`
  ADD CONSTRAINT `factions_low_maps` FOREIGN KEY `factions_low_maps` (`low_maps_id`)
REFERENCES `maps` (`id`);
