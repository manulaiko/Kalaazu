-- Clan roles' permissions.
--
-- Clan roles' permissions
--
CREATE TABLE `clans_roles_permissions` (
    `id`             int    NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `clans_roles_id` int    NOT NULL,
    `permissions_id` int    NOT NULL,
    `enabled`        bit(1) NULL     DEFAULT NULL   COMMENT 'Enabled value, null = inherited'

    CONSTRAINT `clans_roles_permissions` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Clan roles'' permissions';

CREATE INDEX `clans_roles_permissions_clans_roles_id_idx` ON `clans_roles_permissions` (`clans_roles_id`);
CREATE INDEX `clans_roles_permissions_permissions_id_idx` ON `clans_roles_permissions` (`permissions_id`);
