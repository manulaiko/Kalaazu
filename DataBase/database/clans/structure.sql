-- Clan's table.
--
-- Server clans.
--
CREATE TABLE `clans` (
    `id`                 int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `accounts_id`        int          NULL     DEFAULT NULL,
    `tag`                varchar(4)   NOT NULL DEFAULT ''     COMMENT 'Name abbreviation.',
    `name`               varchar(255) NOT NULL DEFAULT '',
    `description`        text         NOT NULL,
    `rank_points`        int          NOT NULL DEFAULT 0      COMMENT 'Current rank points.',
    `rank_position`      int          NOT NULL DEFAULT 0      COMMENT 'Current position in ranking.',
    `rank_best_points`   int          NOT NULL DEFAULT 0      COMMENT 'Highest amount of rank points ever achieved.',
    `rank_best_position` int          NOT NULL DEFAULT 0      COMMENT 'Highest position on ranking ever achieved.',

    CONSTRAINT `clans_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Server clans.';

CREATE UNIQUE INDEX `clans_name_idx` ON `clans` (`name`);
CREATE UNIQUE INDEX `clans_tag_idx` ON `clans` (`tag`);
CREATE INDEX `clans_accounts_id_idx` ON `clans` (`accounts_id`);
