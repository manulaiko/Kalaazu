-- Relations for the `accounts_destroys` table.
--
-- A destroy history belongs to an account.

ALTER TABLE `accounts_destroys`
    ADD CONSTRAINT `accounts_destroys_accounts` FOREIGN KEY `accounts_destroys_accounts` (`accounts_id`)
        REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_destroys`
    ADD CONSTRAINT `accounts_destroys_ships` FOREIGN KEY `accounts_destroys_ships` (`ships_id`)
        REFERENCES `ships` (`id`);
