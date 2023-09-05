-- Relations for the `accounts_settings` table.
--
-- Settings belong to an account

ALTER TABLE `accounts_settings`
    ADD CONSTRAINT `accounts_settings_accounts` FOREIGN KEY `accounts_settings_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);
