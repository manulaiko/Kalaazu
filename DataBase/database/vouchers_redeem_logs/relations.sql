-- Relations for the `vouchers_redeem_logs` table.
--
-- A log entry belongs to an voucher code.
-- A log entry is redeemed by an account.

ALTER TABLE `vouchers_redeem_logs` ADD CONSTRAINT `vouchers_redeem_logs_vouchers` FOREIGN KEY `vouchers_redeem_logs_vouchers` (`vouchers_id`)
    REFERENCES `vouchers` (`id`);

ALTER TABLE `vouchers_redeem_logs` ADD CONSTRAINT `vouchers_redeem_logs_accounts` FOREIGN KEY `vouchers_redeem_logs_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);
