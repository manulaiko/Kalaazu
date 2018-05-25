-- Relations for the table `clans`.
--
-- A clan belongs to an account.

ALTER TABLE `clans`
  ADD CONSTRAINT `clans_accounts` FOREIGN KEY `clans_accounts` (`accounts_id`)
REFERENCES `accounts` (`id`);
