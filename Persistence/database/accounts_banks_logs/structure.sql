-- Account bank's logs table.
--
-- Logs from account's bank.
--
CREATE TABLE `accounts_banks_logs`
(
    `id`                int       NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `from_accounts_id`  int       NOT NULL,
    `to_accounts_id`    int       NOT NULL,
    `date`              timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `type`              tinyint   NOT NULL DEFAULT 0
        COMMENT 'Log type. 0 = withdraw, 1 = deposit, 2 = donation.',
    `amount`            int       NOT NULL DEFAULT 0
        COMMENT 'Amount of currency logged.',
    `currency`          tinyint   NOT NULL DEFAULT 0
        COMMENT 'Currency of the amount. 0 = credits, 1 = uridium.',
    `accounts_banks_id` int NULL DEFAULT NULL,

    CONSTRAINT `accounts_banks_logs_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Logs from account''s bank';

CREATE INDEX `accounts_banks_logs_from_accounts_id_idx`
    ON `accounts_banks_logs` (`from_accounts_id`);
CREATE INDEX `accounts_banks_logs_to_accounts_id_idx`
    ON `accounts_banks_logs` (`to_accounts_id`);
