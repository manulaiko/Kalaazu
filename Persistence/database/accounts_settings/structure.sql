-- Account's settings table.
--
-- In game settings.
--
CREATE TABLE `accounts_settings`
(
    `id`          int       NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `accounts_id` int       NOT NULL,
    `type`        tinyint   NOT NULL DEFAULT 1
        COMMENT 'Settings type (1 = window settings, 2 = game settings...)',
    `name`        varchar(255) NOT NULL
        COMMENT 'Setting name (SET, MINIMAP_SCALE...)',
    `value`       varchar(255) NOT NULL,

    CONSTRAINT `accounts_settings_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'In-game account settings.';

CREATE INDEX `accounts_settings_accounts_id_idx`
    ON `accounts_settings` (`accounts_id`);
