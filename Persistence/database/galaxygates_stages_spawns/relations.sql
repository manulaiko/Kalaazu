-- Relations for the `galaxygates_stages_spawns` table.

ALTER TABLE `galaxygates_stages_spawns`
    ADD CONSTRAINT `galaxygates_stages_spawns_galaxygates_stages` FOREIGN KEY `galaxygates_stages_spawns_galaxygates_stages` (`galaxygates_stages_id`)
    REFERENCES `galaxygates_stages` (`id`);

ALTER TABLE `galaxygates_stages_spawns`
    ADD CONSTRAINT `galaxygates_stages_spawns_galaxygates_spawns` FOREIGN KEY `galaxygates_stages_spawns_galaxygates_spawns` (`galaxygates_spawns_id`)
    REFERENCES `galaxygates_spawns` (`id`);
