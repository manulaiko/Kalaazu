-- Ships table.
--
-- Ships table.
--
CREATE TABLE `ships` (
    `id`         int  NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `items_id`   int  NOT NULL,
    `health`     int  NOT NULL DEFAULT 0      COMMENT 'Health points',
    `speed`      int  NOT NULL DEFAULT 0      COMMENT 'Base speed.',
    `cargo`      int  NOT NULL DEFAULT 100    COMMENT 'Cargo space.',
    `batteries`  int  NOT NULL DEFAULT 1000   COMMENT 'Batteries space.',
    `rockets`    int  NOT NULL DEFAULT 100    COMMENT 'Rockets space.',
    `lasers`     int  NOT NULL DEFAULT 1      COMMENT 'Laser slots.',
    `hellstorms` int  NOT NULL DEFAULT 1      COMMENT 'Laser slots.',
    `generators` int  NOT NULL DEFAULT 1      COMMENT 'Generator slots.',
    `extras`     int  NOT NULL DEFAULT 1      COMMENT 'Extras slots.',
    `gfx`        int  NOT NULL DEFAULT 0,

    CONSTRAINT `ships_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Ships table.';

CREATE INDEX `ships_items_id_idx` ON `ships` (`items_id`);
CREATE INDEX `ships_gfx_idx` ON `ships` (`gfx`);
