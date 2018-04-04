-- Relations for the `accounts_galaxygates` table.
--
-- A gate is a galaxy gate.
-- A gate belongs to an account.
ALTER TABLE `accounts_galaxygates` ADD CONSTRAINT `accounts_galaxygates_galaxygates` FOREIGN KEY `accounts_galaxygates_galaxygates` (`galaxygates_id`)
    REFERENCES `galaxygates` (`id`);

ALTER TABLE `accounts_galaxygates` ADD CONSTRAINT `accounts_galaxygates_accounts` FOREIGN KEY `accounts_galaxygates_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);
