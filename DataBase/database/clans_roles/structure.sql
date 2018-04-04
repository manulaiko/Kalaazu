-- Clan's roles table.
--
-- Clan's permissions roles.
--
CREATE TABLE `clans_roles` (
    `id`       int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `name`     varchar(255) NOT NULL DEFAULT '',
    `clans_id` int          NULL,
    `priority` int          NOT NULL DEFAULT 1,
    `right_1`  bit(1)       NOT NULL DEFAULT 0,
    `right_2`  bit(1)       NOT NULL DEFAULT 0,
    `right_3`  bit(1)       NOT NULL DEFAULT 0,
    `right_4`  bit(1)       NOT NULL DEFAULT 0,
    `right_5`  bit(1)       NOT NULL DEFAULT 0,
    `right_6`  bit(1)       NOT NULL DEFAULT 0,
    `right_7`  bit(1)       NOT NULL DEFAULT 0,
    `right_8`  bit(1)       NOT NULL DEFAULT 0,
    `right_9`  bit(1)       NOT NULL DEFAULT 0,
    `right_10` bit(1)       NOT NULL DEFAULT 0,
    `right_11` bit(1)       NOT NULL DEFAULT 0,
    `right_12` bit(1)       NOT NULL DEFAULT 0,
    `right_13` bit(1)       NOT NULL DEFAULT 0,

    CONSTRAINT `clans_rights_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Clan''s permissions clans_roles.';

CREATE INDEX `clans_roles_clans_id_idx` ON `clans_roles` (`clans_id`);
CREATE INDEX `clans_roles_name_idx` ON `clans_roles` (`name`);
