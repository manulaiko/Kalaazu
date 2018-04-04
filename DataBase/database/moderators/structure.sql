-- Moderators table.
--
-- Server moderators.
--
CREATE TABLE `moderators` (
    `id`          int       NOT NULL AUTO_INCREMENT            COMMENT 'Primary Key.',
    `accounts_id` int       NOT NULL,
    `type`        int       NOT NULL DEFAULT 1                 COMMENT '1 = Chat moderator, 2 = Game moderator, 3 = Chat administrator, 4 = Game administrator, 5 = Global moderator, 6 = Global administrator.',
    `date`        timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date when the account become a moderator.',

    CONSTRAINT `moderators_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Server moderators.';

CREATE INDEX `moderators_accounts_id_idx` ON `moderators` (`accounts_id`);
