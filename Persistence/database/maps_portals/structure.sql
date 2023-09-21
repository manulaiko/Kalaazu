-- Map's portals table.
--
-- Portals on map.
--
CREATE TABLE `maps_portals`
(
    `id`              tinyint  NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `levels_id`       tinyint  NOT NULL DEFAULT 1,
    `maps_id`         smallint NOT NULL,
    `position`        bigint   NOT NULL DEFAULT 0
        COMMENT 'Position on map.',
    `target_maps_id`  smallint NOT NULL,
    `target_position` bigint   NOT NULL DEFAULT 0
        COMMENT 'Target position.',
    `is_visible`      boolean  NOT NULL DEFAULT true,
    `is_working`      boolean  NOT NULL DEFAULT true,
    `gfx`             tinyint  NOT NULL DEFAULT 1,

    CONSTRAINT `maps_portals_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
  CHARACTER SET utf8
    COMMENT 'Portals on map.';

CREATE INDEX `maps_portals_levels_id_idx`
    ON `maps_portals` (`levels_id`);
CREATE INDEX `maps_portals_maps_id_idx`
    ON `maps_portals` (`maps_id`);
CREATE INDEX `maps_portals_target_maps_id_idx`
    ON `maps_portals` (`target_maps_id`);
