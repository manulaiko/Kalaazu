-- Moderators table.
--
-- Server moderators.
--
CREATE TABLE `moderators`
(
    `id`                  tinyint   NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `accounts_id`         int       NOT NULL,
    `moderators_roles_id` tinyint   NOT NULL DEFAULT 1
        COMMENT 'Moderator role.',
    `date`                timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
        COMMENT 'Date when the account become a moderator.',

    CONSTRAINT `moderators_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
  CHARACTER SET utf8
    COMMENT 'Server moderators.';

CREATE INDEX `moderators_accounts_id_idx`
    ON `moderators` (`accounts_id`);
CREATE INDEX `moderators_moderators_roles_id_idx`
    ON `moderators` (`moderators_roles_id`);
