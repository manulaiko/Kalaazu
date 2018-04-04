-- Clan's banks logs table.
--
-- Logs from clan's bank.
--
CREATE TABLE `clans_banks_logs` (
    `id`               int       NOT NULL AUTO_INCREMENT             COMMENT 'Primary Key.',
    `clans_banks_id`   int       NULL     DEFAULT NULL,
    `from_accounts_id` int       NULL     DEFAULT NULL               COMMENT 'Account that made the log.',
    `to_accounts_id`   int       NULL     DEFAULT NULL,
    `date`             timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `type`             int       NOT NULL DEFAULT 1                  COMMENT 'Log type. 1 = withdraw, 2 = deposit, 3 = donation.',
    `amount`           int       NOT NULL DEFAULT 0                  COMMENT 'Amount of currency logged.',
    `currency`         int       NOT NULL DEFAULT 1                  COMMENT 'Currency of the amount. 1 = credits, 2 = uridium.',

    CONSTRAINT `clans_banks_logs_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Logs from clan\'s bank.';

CREATE INDEX `clans_banks_logs_clans_banks_id_idx` ON `clans_banks_logs` (`clans_banks_id`);
CREATE INDEX `clans_banks_logs_from_accounts_id_idx` ON `clans_banks_logs` (`from_accounts_id`);
CREATE INDEX `clans_banks_logs_to_accounts_id_idx` ON `clans_banks_logs` (`to_accounts_id`);
