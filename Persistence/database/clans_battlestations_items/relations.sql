-- Relations for the `clans_battlestations_items` table.
--
-- An item belongs to a CBS.
-- An item is an account's item.

ALTER TABLE `clans_battlestations_items`
    ADD CONSTRAINT `clans_battlestations_items_clans_battlestations` FOREIGN KEY `clans_battlestations_items_clans_battlestations` (`clans_battlestations_id`)
    REFERENCES `clans_battlestations` (`id`);

ALTER TABLE `clans_battlestations_items`
    ADD CONSTRAINT `clans_battlestations_items_accounts_items` FOREIGN KEY `clans_battlestations_items_accounts_items` (`accounts_items_id`)
    REFERENCES `accounts_items` (`id`);
