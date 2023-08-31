-- Relations for the `accounts_configurations_accounts_items` table.
--
-- A configuration item belongs to a configuration.
-- A configuration item is an item.
-- A configuration item can be equipped on a drone.
-- A configuration item can be equipped on a pet.

ALTER TABLE `accounts_configurations_accounts_items`
    ADD CONSTRAINT `accounts_configurations_accounts_items_accounts_configurations` FOREIGN KEY `accounts_configurations_accounts_items_accounts_configurations` (`accounts_configurations_id`)
    REFERENCES `accounts_configurations` (`id`);

ALTER TABLE `accounts_configurations_accounts_items`
    ADD CONSTRAINT `accounts_configurations_accounts_items_accounts_items` FOREIGN KEY `accounts_configurations_accounts_items_accounts_items` (`accounts_items_id`)
    REFERENCES `accounts_items` (`id`);

ALTER TABLE `accounts_configurations_accounts_items`
    ADD CONSTRAINT `accounts_configurations_accounts_items_accounts_drones` FOREIGN KEY `accounts_configurations_accounts_items_accounts_drones` (`accounts_drones_id`)
    REFERENCES `accounts_drones` (`id`);

ALTER TABLE `accounts_configurations_accounts_items`
    ADD CONSTRAINT `accounts_configurations_accounts_items_accounts_pets` FOREIGN KEY `accounts_configurations_accounts_items_accounts_pets` (`accounts_pets_id`)
    REFERENCES `accounts_pets` (`id`);
