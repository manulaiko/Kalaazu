-- Account's configuration items table.
--
-- Items of the configuration.
--
CREATE TABLE `accounts_configurations_accounts_items` (
    `id`                         int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `accounts_configurations_id` int NULL,
    `accounts_items_id`          int NOT NULL,

    CONSTRAINT `accounts_configurations_accounts_items_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Items of the configuration.';
