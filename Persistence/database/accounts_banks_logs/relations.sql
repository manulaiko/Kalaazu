-- Relations for the `accounts_banks_logs` table.
--
-- A log entry is created by an account.
-- A log entry is destined to an account.
-- A log entry belongs to a bank.

ALTER TABLE `accounts_banks_logs`
  ADD CONSTRAINT `accounts_banks_logs_accounts` FOREIGN KEY `accounts_banks_logs_accounts` (`from_accounts_id`)
REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_banks_logs`
  ADD CONSTRAINT `accounts_banks_logs_to_accounts` FOREIGN KEY `accounts_banks_logs_to_accounts` (`to_accounts_id`)
REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_banks_logs`
  ADD CONSTRAINT `accounts_banks_logs_accounts_banks` FOREIGN KEY `accounts_banks_logs_accounts_banks` (`accounts_banks_id`)
REFERENCES `accounts_banks` (`id`);
