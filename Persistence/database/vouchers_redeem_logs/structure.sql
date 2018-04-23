-- Invitation codes redeem logs.
--
-- Contains the redeem logs for the invitation codes.
--
CREATE TABLE `vouchers_redeem_logs` (
    `id`          int        NOT NULL AUTO_INCREMENT            COMMENT 'Primary Key.',
    `vouchers_id` smallint   NOT NULL                           COMMENT 'Voucher code ID.',
    `accounts_id` int        NOT NULL                           COMMENT 'Account that redeemed the voucher.',
    `date`        timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date when the voucher was redeemed.',

    CONSTRAINT `vouchers_redeem_logs_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Contains the redeem logs for the voucher codes.';

CREATE INDEX `vouchers_redeem_logs_vouchers_id_idx` ON `vouchers_redeem_logs` (`vouchers_id`);
CREATE INDEX `vouchers_redeem_logs_accounts_id_idx` ON `vouchers_redeem_logs` (`accounts_id`);
