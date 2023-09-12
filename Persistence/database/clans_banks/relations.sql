-- Relations for the `clans_banks` table.
--
-- A bank belongs to a clan.

ALTER TABLE `clans_banks`
    ADD CONSTRAINT `clans_banks_clans` FOREIGN KEY `clans_banks_clans` (`clans_id`)
        REFERENCES `clans` (`id`);
