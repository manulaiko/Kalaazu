-- Relations for the `accounts_hangars` table.
--
-- An hangar belongs to an account.
-- An hangar has a ship.

ALTER TABLE `accounts_hangars`
  ADD CONSTRAINT `accounts_hangars_accounts` FOREIGN KEY `accounts_hangars_accounts` (`accounts_id`)
REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_hangars`
  ADD CONSTRAINT `accounts_hangars_accounts_ships` FOREIGN KEY `accounts_hangars_accounts_ships` (`accounts_ships_id`)
REFERENCES `accounts_ships` (`id`);
