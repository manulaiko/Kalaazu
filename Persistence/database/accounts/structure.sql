-- Accounts table.
--
-- In-game accounts.
--
CREATE TABLE `accounts`
(
    `id`                  int          NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `users_id`            int          NOT NULL
        COMMENT 'Account''s owner.',
    `session_id`          varchar(32)  NOT NULL
        COMMENT 'Session ID.',
    `levels_id`           tinyint      NOT NULL DEFAULT 1
        COMMENT 'Current level.',
    `factions_id`         tinyint      NULL     DEFAULT NULL
        COMMENT 'Faction that the account belongs to.',
    `accounts_hangars_id` int          NULL     DEFAULT NULL
        COMMENT 'Active hangar.',
    `clans_id`            int          NULL     DEFAULT NULL,
    `ranks_id`            tinyint      NOT NULL DEFAULT 1,
    `name`                varchar(255) NOT NULL
        COMMENT 'In game name.',
    `ban_date`            timestamp    NULL     DEFAULT NULL
        COMMENT 'Ban expiration date.',
    `premium_date`        timestamp    NULL     DEFAULT NULL
        COMMENT 'Premium expiration date.',
    `date`                timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `last_login`          timestamp    NULL     DEFAULT NULL
        COMMENT 'Last login date.',
    `skill_points_total`  smallint     NOT NULL DEFAULT 0
        COMMENT 'Total skill points available.',
    `skill_points_free`   smallint     NOT NULL DEFAULT 0
        COMMENT 'Free skill points available.',

    CONSTRAINT `accounts_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
  CHARACTER SET utf8
    COMMENT 'In game accounts.';

CREATE UNIQUE INDEX `accounts_session_id_idx`
    ON `accounts` (`session_id`);
CREATE UNIQUE INDEX `accounts_name_idx`
    ON `accounts` (`name`);
CREATE INDEX `accounts_ranks_id_idx`
    ON `accounts` (`ranks_id`);
CREATE INDEX `accounts_clans_id_idx`
    ON `accounts` (`clans_id`);
