-- Relations for the `trade_items` table.
--
-- A bid is made to an item.
-- A bid is made by an account.

ALTER TABLE `trade_items`
    ADD CONSTRAINT `trade_items_items` FOREIGN KEY `trade_items_items` (`items_id`)
        REFERENCES `items` (`id`);

ALTER TABLE `trade_items`
    ADD CONSTRAINT `trade_items_accounts` FOREIGN KEY `trade_items_accounts` (`accounts_id`)
        REFERENCES `accounts` (`id`);
