-- NPCs table.
--
-- Server NPCs.
--
CREATE TABLE `npcs` (
    `id`                tinyint      NOT NULL AUTO_INCREMENT            COMMENT 'Primary Key.',
    `name`              varchar(255) NOT NULL DEFAULT '-=[Streuner]=-',
    `health`            int          NOT NULL DEFAULT 0,
    `shield`            int          NOT NULL DEFAULT 0,
    `shield_absorption` tinyint      NOT NULL DEFAULT 0.0,
    `damage`            int          NOT NULL DEFAULT 0,
    `speed`             smallint     NOT NULL DEFAULT 0,
    `gfx`               tinyint      NOT NULL DEFAULT 0,
    `ai`                tinyint      NOT NULL DEFAULT 1,

    CONSTRAINT `npcs_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Server NPCS.';

CREATE INDEX `npcs_name` ON `npcs` (`name`);
CREATE INDEX `npcs_gfx` ON `npcs` (`gfx`);
