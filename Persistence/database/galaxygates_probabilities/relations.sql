-- Relations for the `galaxygates_probabilities` table.
--
-- A probability belongs to a gate.

ALTER TABLE `galaxygates_probabilities` ADD CONSTRAINT `galaxygates_probabilities_galaxygates` FOREIGN KEY `galaxygates_probabilities_galaxygates` (`galaxygates_id`)
    REFERENCES `galaxygates` (`id`);
