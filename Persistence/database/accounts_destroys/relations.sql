-- Relations for the `accounts_destroys` table.
--
-- A destroy history belongs to an account.

ALTER TABLE `accounts_destroys`
  ADD CONSTRAINT `accounts_destroys_accounts` FOREIGN KEY `accounts_destroys_accounts` (`accounts_id`)
REFERENCES `accounts` (`id`);
