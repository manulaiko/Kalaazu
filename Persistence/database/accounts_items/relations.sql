-- Relations for the `accounts_items` table.
--
-- An item belongs to an account.
-- An item is an item.
-- An item has a level.

ALTER TABLE `accounts_items`
    ADD CONSTRAINT `accounts_items_accounts` FOREIGN KEY `accounts_items_accounts` (`accounts_id`)
        REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_items`
    ADD CONSTRAINT `accounts_items_items` FOREIGN KEY `accounts_items_items` (`items_id`)
        REFERENCES `items` (`id`);

ALTER TABLE `accounts_items`
    ADD CONSTRAINT `accounts_items_levels` FOREIGN KEY `accounts_items_levels` (`levels_id`)
        REFERENCES `levels` (`id`);
