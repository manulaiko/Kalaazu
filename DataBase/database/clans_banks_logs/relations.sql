-- Relations for the `clans_banks_logs` table.
--
-- A log entry belongs to a clan bank.
-- A log entry is made by an account.
-- A log entry is made to an account.

ALTER TABLE `clans_banks_logs` ADD CONSTRAINT `clans_banks_logs_clans_banks` FOREIGN KEY `clans_banks_logs_clans_banks` (`clans_banks_id`)
    REFERENCES `clans_banks` (`id`);

ALTER TABLE `clans_banks_logs` ADD CONSTRAINT `clans_banks_logs_from_accounts` FOREIGN KEY `clans_banks_logs_from_accounts` (`from_accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `clans_banks_logs` ADD CONSTRAINT `clans_banks_logs_to_accounts` FOREIGN KEY `clans_banks_logs_to_accounts` (`to_accounts_id`)
    REFERENCES `accounts` (`id`);
