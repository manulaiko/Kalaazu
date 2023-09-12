-- Nanotech Factory items table.
--
-- Items that can be build in the tech factory.
--
CREATE TABLE `techfactory_items`
(
    `id`                 tinyint      NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `name`               varchar(255) NOT NULL
        COMMENT 'Item name.',
    `description`        text         NOT NULL
        COMMENT 'Item description.',
    `effect`             text         NOT NULL
        COMMENT 'Effect description.',
    `duration`           smallint     NOT NULL DEFAULT 900
        COMMENT 'Seconds the effect is active.',
    `cooldown`           smallint     NOT NULL DEFAULT 900
        COMMENT 'Seconds the effect takes to cooldown.',
    `time`               int          NOT NULL
        COMMENT 'Seconds it takes to produce the item.',
    `free_production`    smallint     NOT NULL
        COMMENT 'Free production costs.',
    `instant_production` smallint     NOT NULL
        COMMENT 'Instant production costs.',

    CONSTRAINT `techfactory_items_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
  CHARACTER SET utf8
    COMMENT 'Items that can be build in the tech factory.';

CREATE INDEX `techfactory_items_name_idx`
    ON `techfactory_items` (`name`);
