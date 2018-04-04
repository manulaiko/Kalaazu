-- Account's items table.
--
-- Items bough by an account.
--
CREATE TABLE `accounts_items` (
    `id`          int       NOT NULL AUTO_INCREMENT             COMMENT 'Primary Key.',
    `items_id`    int       NULL     DEFAULT NULL,
    `accounts_id` int       NULL     DEFAULT NULL,
    `levels_id`   int       NULL     DEFAULT NULL,
    `date`        timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `amount`      int       NOT NULL DEFAULT 1                  COMMENT 'Amount of items bough (for stackable items).',

    CONSTRAINT `accounts_items_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Items bough by an account.';

CREATE INDEX `accounts_items_items_id_idx` ON `accounts_items` (`items_id`);
CREATE INDEX `accounts_items_accounts_id_idx` ON `accounts_items` (`accounts_id`);
CREATE INDEX `accounts_items_levels_id_idx` ON `accounts_items` (`levels_id`);
