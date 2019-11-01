-- Vouchers table.
--
-- Voucher codes.
--
CREATE TABLE `vouchers` (
                            `id`   smallint    NOT NULL AUTO_INCREMENT
  COMMENT 'Primary Key.',
                            `code` varchar(32) NOT NULL DEFAULT '',
                            `max`  tinyint     NOT NULL DEFAULT 1,

                            CONSTRAINT `vouchers_pk` PRIMARY KEY (`id`)
)
  ENGINE InnoDB
  CHARACTER SET utf8
  COMMENT 'Voucher codes.';

CREATE UNIQUE INDEX `vouchers_code_idx`
  ON `vouchers` (`code`);
