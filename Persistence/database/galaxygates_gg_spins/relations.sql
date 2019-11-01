-- Relations for the `galaxygates_gg_spins` table.

ALTER TABLE `galaxygates_gg_spins`
    ADD CONSTRAINT `galaxygates_gg_spins_galaxygates` FOREIGN KEY `galaxygates_gg_spins_galaxygates` (`galaxygates_id`)
        REFERENCES `galaxygates` (`id`);

ALTER TABLE `galaxygates_gg_spins`
    ADD CONSTRAINT `galaxygates_gg_spins_galaxygates_spins` FOREIGN KEY `galaxygates_gg_spins_galaxygates_spins` (`galaxygates_spins_id`)
        REFERENCES `galaxygates_spins` (`id`);
