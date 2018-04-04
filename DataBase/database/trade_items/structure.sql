-- Trade items table.
--
-- Trade items.
--
CREATE TABLE `trade_items` (
    `id`          int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `items_id`    int NOT NULL,
    `accounts_id` int NULL     DEFAULT NULL,
    `price`       int NOT NULL DEFAULT 0,
    `category`    int NOT NULL DEFAULT 0,

    CONSTRAINT `trade_items_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Trade items.';

CREATE INDEX `trade_items_items_id_idx` ON `trade_items` (`items_id`);
CREATE INDEX `trade_items_accounts_id_idx` ON `trade_items` (`accounts_id`);
CREATE INDEX `trade_items_category_idx` ON `trade_items` (`category`);
