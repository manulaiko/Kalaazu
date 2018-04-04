-- Relations for the `galaxygates_gg_waves` table.

ALTER TABLE `galaxygates_gg_waves` ADD CONSTRAINT `galaxygates_gg_waves_galaxygates` FOREIGN KEY `galaxygates_gg_waves_galaxygates` (`galaxygates_id`)
    REFERENCES `galaxygates` (`id`);

ALTER TABLE `galaxygates_gg_waves` ADD CONSTRAINT `galaxygates_gg_waves_galaxygates_waves` FOREIGN KEY `galaxygates_gg_waves_galaxygates_waves` (`galaxygates_waves_id`)
    REFERENCES `galaxygates_waves` (`id`);
