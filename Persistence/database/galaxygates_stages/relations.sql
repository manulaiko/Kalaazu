-- Relations for the `galaxygates_stages` table.
--
-- A stage belongs to a wave.

ALTER TABLE `galaxygates_stages`
  ADD CONSTRAINT `galaxygates_stages_galaxygates_waves` FOREIGN KEY `galaxygates_stages_galaxygates_waves` (`galaxygates_waves_id`)
REFERENCES `galaxygates_waves` (`id`);
