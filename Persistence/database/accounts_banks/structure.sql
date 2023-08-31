-- Account banks table.
--
-- Account's internal bank.
--
CREATE TABLE `accounts_banks`
(
    `id`          int     NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `accounts_id` int     NOT NULL,
    `credits`     bigint  NOT NULL DEFAULT 0
        COMMENT 'Credits available in the bank.',
    `uridium`     bigint  NOT NULL DEFAULT 0
        COMMENT 'Uridium available in the bank.',
    `tax_credits` tinyint NOT NULL DEFAULT 5
        COMMENT 'Tax rate for credits.',
    `tax_uridium` tinyint NOT NULL DEFAULT 0
        COMMENT 'Tax rate for uridium.',

    CONSTRAINT `accounts_banks_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Account''s internal bank.';

CREATE UNIQUE INDEX `accounts_banks_accounts_id_idx`
    ON `accounts_banks` (`accounts_id`);
