-- Account destroys table.
--
-- Account's destroy history.
--
CREATE TABLE `accounts_destroys`
(
    `id`          int      NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `accounts_id` int      NOT NULL,
    `ships_id`    tinyint  NOT NULL,
    `points`      smallint NOT NULL DEFAULT 0
        COMMENT 'Rank points received for destroying this ship.',
    `amount`      smallint NOT NULL DEFAULT 0
        COMMENT 'Times this ship has been destroyed',

    CONSTRAINT `accounts_destroys_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
  CHARACTER SET utf8
    COMMENT 'Account''s destroy history.';

CREATE UNIQUE INDEX `accounts_destroys_accounts_id_idx`
    ON `accounts_destroys` (`accounts_id`);
