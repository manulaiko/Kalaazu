-- Ships table.
--
-- Ships table.
--
CREATE TABLE `ships`
(
    `id`         tinyint  NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `items_id`   smallint NOT NULL,
    `health`     int      NOT NULL DEFAULT 0
        COMMENT 'Health points',
    `speed`      smallint NOT NULL DEFAULT 0
        COMMENT 'Base speed.',
    `cargo`      smallint NOT NULL DEFAULT 100
        COMMENT 'Cargo space.',
    `batteries`  smallint NOT NULL DEFAULT 1000
        COMMENT 'Batteries space.',
    `rockets`    smallint NOT NULL DEFAULT 100
        COMMENT 'Rockets space.',
    `lasers`     tinyint  NOT NULL DEFAULT 1
        COMMENT 'Laser slots.',
    `hellstorms` tinyint  NOT NULL DEFAULT 1
        COMMENT 'Laser slots.',
    `generators` tinyint  NOT NULL DEFAULT 1
        COMMENT 'Generator slots.',
    `extras`     tinyint  NOT NULL DEFAULT 1
        COMMENT 'Extras slots.',
    `gfx`        tinyint  NOT NULL DEFAULT 0,

    CONSTRAINT `ships_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
  CHARACTER SET utf8
    COMMENT 'Ships table.';

CREATE INDEX `ships_items_id_idx`
    ON `ships` (`items_id`);
CREATE INDEX `ships_gfx_idx`
    ON `ships` (`gfx`);
