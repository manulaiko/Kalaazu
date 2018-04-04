-- Account's galaxy gates table.
--
-- Account's build galaxygates.
--
CREATE TABLE `accounts_galaxygates` (
    `id`             int    NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `galaxygates_id` int    NOT NULL,
    `accounts_id`    int    NOT NULL,
    `parts`          int    NOT NULL DEFAULT 0      COMMENT 'Collected parts.',
    `lifes`          int    NOT NULL DEFAULT -1     COMMENT 'Available lives (-1 not build yet)',
    `wave`           int    NOT NULL DEFAULT -1     COMMENT 'Current wave.',
    `times`          int    NOT NULL DEFAULT 0      COMMENT 'Times this gate was completed.',
    `is_completed`   bit(1) NOT NULL DEFAULT 0,

    CONSTRAINT `accounts_galaxygates_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Account''s build galaxygates.';

CREATE INDEX `accounts_galaxygates_galaxygates_id_idx` ON `accounts_galaxygates` (`galaxygates_id`);
CREATE INDEX `accounts_galaxygates_accounts_id_idx` ON `accounts_galaxygates` (`accounts_id`);
