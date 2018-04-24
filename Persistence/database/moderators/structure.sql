-- Moderators table.
--
-- Server moderators.
--
CREATE TABLE `moderators` (
    `id`          tinyint   NOT NULL AUTO_INCREMENT            COMMENT 'Primary Key.',
    `accounts_id` int       NOT NULL,
    `type`        tinyint   NOT NULL DEFAULT 0                 COMMENT '0 = Chat moderator, 1 = Game moderator, 2 = Chat administrator, 3 = Game administrator, 4 = Global moderator, 5 = Global administrator.',
    `date`        timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date when the account become a moderator.',

    CONSTRAINT `moderators_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Server moderators.';

CREATE INDEX `moderators_accounts_id_idx` ON `moderators` (`accounts_id`);
