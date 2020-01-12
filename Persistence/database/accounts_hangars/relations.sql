-- Relations for the `accounts_hangars` table.
--
-- An hangar belongs to an account.
-- An hangar has a ship.
-- An hangar has an active configuration.

ALTER TABLE `accounts_hangars`
    ADD CONSTRAINT `accounts_hangars_accounts` FOREIGN KEY `accounts_hangars_accounts` (`accounts_id`)
        REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_hangars`
    ADD CONSTRAINT `accounts_hangars_accounts_ships` FOREIGN KEY `accounts_hangars_accounts_ships` (`accounts_ships_id`)
        REFERENCES `accounts_ships` (`id`);

ALTER TABLE `accounts_hangars`
    ADD CONSTRAINT `accounts_hangars_accounts_configurations` FOREIGN KEY `accounts_hangars_accounts_configurations` (`accounts_configurations_id`)
        REFERENCES `accounts_configurations` (`id`);
