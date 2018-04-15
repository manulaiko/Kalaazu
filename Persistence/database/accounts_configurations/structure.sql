-- Account's configurations table.
--
-- Configurations of the accounts.
--
CREATE TABLE `accounts_configurations` (
    `id`                  int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `accounts_hangars_id` int          NOT NULL,
    `configuration_id`    int          NOT NULL DEFAULT 1      COMMENT 'Configuration ID (1 or 2 (or 3)).',
    `name`                varchar(255) NOT NULL DEFAULT '',

    CONSTRAINT `accounts_configurations_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Configurations of the accounts.';

CREATE INDEX `accounts_configurations_accounts_hangars_id_idx` ON `accounts_configurations` (`accounts_hangars_id`);
