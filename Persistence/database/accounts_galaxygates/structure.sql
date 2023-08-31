-- Account's galaxy gates table.
--
-- Account's build galaxygates.
--
CREATE TABLE `accounts_galaxygates`
(
    `id`             int      NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `galaxygates_id` tinyint  NOT NULL,
    `accounts_id`    int      NOT NULL,
    `parts`          tinyint  NOT NULL DEFAULT 0
        COMMENT 'Collected parts.',
    `lifes`          tinyint  NOT NULL DEFAULT -1
        COMMENT 'Available lives (-1 not build yet)',
    `wave`           tinyint  NOT NULL DEFAULT -1
        COMMENT 'Current wave.',
    `times`          smallint NOT NULL DEFAULT 0
        COMMENT 'Times this gate was completed.',

    CONSTRAINT `accounts_galaxygates_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Account''s build galaxygates.';

CREATE INDEX `accounts_galaxygates_galaxygates_id_idx`
    ON `accounts_galaxygates` (`galaxygates_id`);
CREATE INDEX `accounts_galaxygates_accounts_id_idx`
    ON `accounts_galaxygates` (`accounts_id`);
