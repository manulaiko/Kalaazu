-- Nanotech Factory costs table.
--
-- Item production costs.
--
CREATE TABLE `techfactory_costs`
(
    `id`                   tinyint  NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `techfactory_items_id` tinyint  NOT NULL
        COMMENT 'Techfactory Item ID.',
    `items_id`             smallint NOT NULL
        COMMENT 'Cost item ID.',
    `amount`               int      NOT NULL
        COMMENT 'Amount of items to build the techfactory item.',

    CONSTRAINT `techfactory_costs_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Item production costs.';
