-- Relations for the `galaxygates_waves` table.
--
-- A wave occurs in a map

ALTER TABLE `galaxygates_waves`
  ADD CONSTRAINT `galaxygates_waves_maps` FOREIGN KEY `galaxygates_spins_maps` (`maps_id`)
REFERENCES `maps` (`id`);
