-- Moderator roles' permissions.
--
-- Moderator roles' permissions
--
CREATE TABLE `moderators_roles_permissions` (
  `id`                  tinyint NOT NULL AUTO_INCREMENT
  COMMENT 'Primary Key.',
  `moderators_roles_id` tinyint NOT NULL,
  `permissions_id`      tinyint NOT NULL,
  `is_enabled`          boolean NULL     DEFAULT NULL
  COMMENT 'Enabled value, null = inherited',

  CONSTRAINT `clans_roles_permissions` PRIMARY KEY (`id`)
)
  ENGINE InnoDB
  CHARACTER SET utf8
  COMMENT 'Moderator roles'' permissions';

CREATE INDEX `moderators_roles_permissions_moderators_roles_id_idx`
  ON `moderators_roles_permissions` (`moderators_roles_id`);
CREATE INDEX `moderators_roles_permissions_permissions_id_idx`
  ON `moderators_roles_permissions` (`permissions_id`);
