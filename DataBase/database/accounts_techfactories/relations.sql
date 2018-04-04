-- Relations for the `accounts_techfactories` table.
--
-- A techfactory belogns to an account.

ALTER TABLE `accounts_techfactories` ADD CONSTRAINT `accounts_techfactories_accounts` FOREIGN KEY `accounts_techfactories_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);
