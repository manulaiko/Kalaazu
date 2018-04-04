-- Items table.
--
-- Contains server's items.
--
CREATE TABLE `items` (
    `id`          int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `name`        varchar(255) NOT NULL DEFAULT '',
    `category`    varchar(255) NOT NULL DEFAULT '',
    `description` text         NOT NULL                COMMENT 'Shop description.',
    `price`       int          NOT NULL DEFAULT 0,
    `type`        varchar(255) NOT NULL DEFAULT '',
    `is_elite`    bit(1)       NOT NULL DEFAULT 0,
    `is_event`    bit(1)       NOT NULL DEFAULT 0      COMMENT 'Event item.',
    `is_buyable`  bit(1)       NOT NULL DEFAULT 1      COMMENT 'Buyable in shop',

    CONSTRAINT `items_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Contains server''s items.';
