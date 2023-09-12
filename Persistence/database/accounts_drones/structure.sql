-- Account's drones table.
--
-- Account's drones.
--
CREATE TABLE `accounts_drones`
(
    `id`          int       NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `accounts_id` int       NOT NULL,
    `levels_id`   tinyint   NOT NULL DEFAULT 1,
    `experience`  smallint  NOT NULL DEFAULT 0,
    `date`        timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT `accounts_drones_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
  CHARACTER SET utf8
    COMMENT 'Account''s drones.';

CREATE UNIQUE INDEX `accounts_drones_accounts_id_idx`
    ON `accounts_drones` (`accounts_id`);
