-- Account's techfactory items.
--
-- Techfactory items from account.
--
CREATE TABLE `accounts_techfactory_items`
(
    `id`                   int       NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `accounts_id`          int       NOT NULL
        COMMENT 'Account ID.',
    `techfactory_items_id` tinyint   NOT NULL
        COMMENT 'Item ID.',
    `amount`               smallint  NOT NULL DEFAULT 1
        COMMENT 'Amount of build items.',
    `date`                 timestamp NULL     DEFAULT NULL
        COMMENT 'Date when the item started building.',

    CONSTRAINT `accounts_techfactory_items_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
  CHARACTER SET utf8
    COMMENT 'Techfactory items from account.';

CREATE INDEX `accounts_techfactory_items_accounts_id_idx`
    ON `accounts_techfactory_items` (`accounts_id`);
CREATE INDEX `accounts_techfactory_items_techfactory_items_id_idx`
    ON `accounts_techfactory_items` (`techfactory_items_id`);
