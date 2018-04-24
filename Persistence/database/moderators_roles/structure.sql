-- Moderator's roles table.
--
-- Moderator's permissions roles.
--
CREATE TABLE `moderators_roles` (
    `id`                  tinyint      NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `name`                varchar(255) NOT NULL,
    `moderators_roles_id` tinyint      NULL     DEFAULT NULL   COMMENT 'Parent role.',
    `priority`            tinyint      NOT NULL DEFAULT 1,

    CONSTRAINT `clans_roles_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Moderator''s roles.';

CREATE INDEX `moderators_roles_name_idx` ON `moderators_roles` (`name`);
