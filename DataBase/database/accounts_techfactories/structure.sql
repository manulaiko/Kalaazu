-- Account's techfactory table.
--
-- Nanotech factory items.
--
CREATE TABLE `accounts_techfactories` (
    `id`                 int        NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `accounts_id`        int        NOT NULL                COMMENT 'Account ID.',
    `slot_unlock_price`  int        NOT NULL                COMMENT 'Price for unlocking a slot.',
    `slot_unlock_factor` int        NOT NULL                COMMENT 'Factor for unlocking a slot.',
    `slots`              tinyint(1) NOT NULL DEFAULT 1      COMMENT 'Unlocked slots.',

    CONSTRAINT `accounts_techfactory_items_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Nanotech factory items.';
