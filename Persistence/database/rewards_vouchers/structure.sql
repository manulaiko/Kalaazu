-- Ship rewards table.
--
-- Many to many relations table.
--
CREATE TABLE `rewards_vouchers`
(
    `id`          smallint NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `vouchers_id` smallint NOT NULL
        COMMENT 'Voucher ID.',
    `rewards_id`  smallint NOT NULL
        COMMENT 'Reward to award.',

    CONSTRAINT `rewards_vouchers_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Many to many relations.';

CREATE INDEX `rewards_vouchers_vouchers_id_idx`
    ON `rewards_vouchers` (`vouchers_id`);
CREATE INDEX `rewards_vouchers_rewards_id_idx`
    ON `rewards_vouchers` (`rewards_id`);
