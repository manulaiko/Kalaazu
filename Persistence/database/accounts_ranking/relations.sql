-- Relations for the `accounts_rankings` table.
--
-- A rank belongs to an account.

ALTER TABLE `accounts_rankings`
    ADD CONSTRAINT `accounts_rankings_accounts` FOREIGN KEY `accounts_rankings_accounts` (`accounts_id`)
        REFERENCES `accounts` (`id`);
