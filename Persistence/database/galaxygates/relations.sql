-- Relations for the `galaxygates` table.
--
-- A galaxygate starts in a wave.

ALTER TABLE `galaxygates`
    ADD CONSTRAINT `galaxygates_galaxygates_waves` FOREIGN KEY `galaxygates_galaxygates_waves` (`galaxygates_waves_id`)
    REFERENCES `galaxygates_waves` (`id`);
