-- Relations for the `accounts_banks` table.
--
-- A bank belongs to an account.

ALTER TABLE `accounts_banks`
    ADD CONSTRAINT `accounts_banks_accounts` FOREIGN KEY `accounts_banks_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);
