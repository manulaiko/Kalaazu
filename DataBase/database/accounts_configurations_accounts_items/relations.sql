-- Relations for the `accounts_configurations_accounts_items` table.
--
-- A configuration item belongs to a configuration.
-- A configuration item is an item.

ALTER TABLE `accounts_configurations_accounts_items` ADD CONSTRAINT `accounts_configurations_accounts_items_accounts_configurations` FOREIGN KEY `accounts_configurations_accounts_items_accounts_configurations` (`accounts_configurations_id`)
    REFERENCES `accounts_configurations` (`id`);

ALTER TABLE `accounts_configurations_accounts_items` ADD CONSTRAINT `accounts_configurations_accounts_items_accounts_items` FOREIGN KEY `accounts_configurations_accounts_items_accounts_items` (`accounts_items_id`)
    REFERENCES `accounts_items` (`id`);
