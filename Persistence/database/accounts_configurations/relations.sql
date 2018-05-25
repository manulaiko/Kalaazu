-- Relations for the `accounts_configurations` table.
--
-- A configuration belongs to an hangar.

ALTER TABLE `accounts_configurations`
  ADD CONSTRAINT `accounts_configurations_accounts_hangars` FOREIGN KEY `accounts_configurations_accounts_hangars` (`accounts_hangars_id`)
REFERENCES `accounts_hangars` (`id`);
