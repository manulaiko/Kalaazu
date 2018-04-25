-- Items table.
--
-- Contains server's items.
--
CREATE TABLE `items` (
    `id`          smallint     NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `name`        varchar(255) NOT NULL DEFAULT '',
    `category`    varchar(255) NOT NULL DEFAULT '',
    `description` text         NOT NULL                COMMENT 'Shop description.',
    `price`       int          NOT NULL DEFAULT 0,
    `type`        varchar(255) NOT NULL DEFAULT '',
    `is_elite`    boolean      NOT NULL DEFAULT false,
    `is_event`    boolean      NOT NULL DEFAULT false  COMMENT 'Event item.',
    `is_buyable`  boolean      NOT NULL DEFAULT true   COMMENT 'Buyable in shop',

    CONSTRAINT `items_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Contains server''s items.';
