-- Relations for the `accounts_drones` table.
--
-- A drone has a level.
-- A drone belongs to an account.

ALTER TABLE `accounts_drones`
    ADD CONSTRAINT `accounts_drones_accounts` FOREIGN KEY `accounts_drones_accounts` (`accounts_id`)
        REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_drones`
    ADD CONSTRAINT `accounts_drones_levels` FOREIGN KEY `accounts_drones_levels` (`levels_id`)
        REFERENCES `levels` (`id`);
