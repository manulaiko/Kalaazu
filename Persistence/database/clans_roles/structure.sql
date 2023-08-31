-- Clan's roles table.
--
-- Clan's permissions roles.
--
CREATE TABLE `clans_roles`
(
    `id`             int          NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `name`           varchar(255) NOT NULL,
    `clans_id`       int          NOT NULL,
    `clans_roles_id` int NULL DEFAULT NULL
        COMMENT 'Parent role.',
    `priority`       tinyint      NOT NULL DEFAULT 1,

    CONSTRAINT `clans_roles_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Clan''s roles.';

CREATE INDEX `clans_roles_clans_id_idx`
    ON `clans_roles` (`clans_id`);
CREATE INDEX `clans_roles_name_idx`
    ON `clans_roles` (`name`);
