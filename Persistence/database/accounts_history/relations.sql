-- Relations for the `accounts_history` table.
--
-- A history belongs to an account.

ALTER TABLE `accounts_history`
    ADD CONSTRAINT `accounts_history_accounts` FOREIGN KEY `accounts_history_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);
