-- Relations for the `rewards_vouchers` table.
--
-- A reward is for a Voucher.
-- A reward is a reward.

ALTER TABLE `rewards_vouchers`
    ADD CONSTRAINT `rewards_vouchers_rewards` FOREIGN KEY `rewards_vouchers_rewards` (`rewards_id`)
        REFERENCES `rewards` (`id`);

ALTER TABLE `rewards_vouchers`
    ADD CONSTRAINT `rewards_vouchers_vouchers` FOREIGN KEY `rewards_vouchers_vouchers` (`vouchers_id`)
        REFERENCES `vouchers` (`id`);
