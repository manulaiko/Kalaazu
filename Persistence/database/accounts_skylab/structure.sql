-- Account's skylab table.
--
-- Skylab for the account.
--
CREATE TABLE `accounts_skylabs`
(
    `id`                int     NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `accounts_id`       int     NOT NULL
        COMMENT 'Account ID.',
    `skylab_modules_id` tinyint NOT NULL
        COMMENT 'Module ID.',
    `levels_id`         tinyint NOT NULL DEFAULT 1
        COMMENT 'Module level.',
    `space`             int     NOT NULL DEFAULT 0
        COMMENT 'Used space.',
    `upgrade`           timestamp NULL DEFAULT NULL
        COMMENT 'Date when this module started upgrading.',

    CONSTRAINT `accounts_skylabs_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Skylab for the accounts.';

CREATE INDEX `accounts_skylabs_accounts_id_idx`
    ON `accounts_skylabs` (`accounts_id`);
CREATE INDEX `accounts_skylabs_skylab_modules_id_idx`
    ON `accounts_skylabs` (`skylab_modules_id`);
