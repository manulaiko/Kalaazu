-- Clan's banks table.
--
-- Clan's internal bank.
--
CREATE TABLE `clans_banks` (
    `id`          int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `clans_id`    int          NULL     DEFAULT NULL,
    `credits`     bigint       NOT NULL DEFAULT 0      COMMENT 'Credits available in the bank.',
    `uridium`     bigint       NOT NULL DEFAULT 0      COMMENT 'Uridium available in the bank.',
    `tax_credits` decimal(5,2) NOT NULL DEFAULT '5.0'  COMMENT 'Tax rate for credits.',
    `tax_uridium` decimal(5,2) NOT NULL DEFAULT '0.0'  COMMENT 'Tax rate for uridium.',

    CONSTRAINT `clans_banks_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Clan''s internal bank.';

CREATE UNIQUE INDEX `clans_bank_clans_id_idx` ON `clans_banks` (`clans_id`);
