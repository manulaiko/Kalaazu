-- Items table.
--
-- Contains server's items.
--
CREATE TABLE `items`
(
    `id`            smallint     NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `name`          varchar(255) NOT NULL DEFAULT '',
    `loot_id`       varchar(255) NOT NULL DEFAULT '',
    `category`      tinyint      NOT NULL DEFAULT 0,
    `description`   text         NOT NULL
        COMMENT 'Shop description.',
    `price`         int          NOT NULL DEFAULT 0,
    `type`          tinyint      NOT NULL DEFAULT 0,
    `cooldown`      smallint     NOT NULL DEFAULT 1000,
    `cooldown_type` tinyint      NOT NULL DEFAULT 0,
    `slotbar_order` tinyint      NOT NULL DEFAULT -1,
    `is_elite`      boolean      NOT NULL DEFAULT false,
    `is_event`      boolean      NOT NULL DEFAULT false
        COMMENT 'Event item.',
    `is_buyable`    boolean      NOT NULL DEFAULT true
        COMMENT 'Buyable in shop',
    `bonus`         tinyint      NOT NULL DEFAULT 0
        COMMENT 'Item bonus',

    CONSTRAINT `items_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Contains server''s items.';

CREATE INDEX `items_loot_id_idx`
    ON `items` (`loot_id`);
CREATE INDEX `items_category_idx`
    ON `items` (`category`);
CREATE INDEX `items_type_idx`
    ON `items` (`type`);
