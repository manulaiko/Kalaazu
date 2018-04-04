-- Relations for the `clans_battlestations` table.
--
-- A CBS may belong to a clan.
-- A CBS is located in a map.

ALTER TABLE `clans_battlestations` ADD CONSTRAINT `clans_battlestations_clans` FOREIGN KEY `clans_battlestations_clans` (`clans_id`)
    REFERENCES `clans` (`id`);

ALTER TABLE `clans_battlestations` ADD CONSTRAINT `clans_battlestations_maps` FOREIGN KEY `clans_battlestations_maps` (`maps_id`)
    REFERENCES `maps` (`id`);
