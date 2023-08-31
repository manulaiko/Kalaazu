-- Relations for the `clans_diplomacies` table.
--
-- A diplomacy belongs to a clan.
-- A diplomacy is aimed to a clan.

ALTER TABLE `clans_diplomacies`
    ADD CONSTRAINT `clans_diplomacies_from_clans` FOREIGN KEY `clans_diplomacies_from_clans` (`from_clans_id`)
    REFERENCES `clans` (`id`);

ALTER TABLE `clans_diplomacies`
    ADD CONSTRAINT `clans_diplomacies_to_clans` FOREIGN KEY `clans_diplomacies_to_clans` (`to_clans_id`)
    REFERENCES `clans` (`id`);
