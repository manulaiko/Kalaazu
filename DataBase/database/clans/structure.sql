-- Clan's table.
--
-- Server clans.
--
CREATE TABLE `clans` (
    `id`                 int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `accounts_id`        int          NOT NULL                COMMENT 'Owner ID',
    `factions_id`        int          NULL     DEFAULT NULL   COMMENT 'Clan affiliation faction.',
    `tag`                varchar(4)   NOT NULL DEFAULT ''     COMMENT 'Name abbreviation.',
    `name`               varchar(255) NOT NULL DEFAULT '',
    `description`        text         NOT NULL,
    `logo`               varchar(255) NOT NULL DEFAULT '',
    `status`             int          NOT NULL DEFAULT 0      COMMENT '0 = closed, 1 = recruiting, 2 = lvl10+, 3 = lvl16+, 4 = FE.',

    CONSTRAINT `clans_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Server clans.';

CREATE UNIQUE INDEX `clans_name_idx` ON `clans` (`name`);
CREATE UNIQUE INDEX `clans_tag_idx` ON `clans` (`tag`);
CREATE INDEX `clans_accounts_id_idx` ON `clans` (`accounts_id`);
