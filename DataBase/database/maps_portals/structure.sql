-- Map's portals table.
--
-- Portals on map.
--
CREATE TABLE `maps_portals` (
    `id`              int    NOT NULL AUTO_INCREMENT COMMENT 'Primery Key.',
    `levels_id`       int    NULL     DEFAULT NULL,
    `maps_id`         int    NULL     DEFAULT NULL,
    `position`        point  NOT NULL                COMMENT 'Position on map.',
    `target_maps_id`  int    NULL     DEFAULT NULL,
    `target_position` point  NOT NULL                COMMENT 'Position where the account will be spawned after using the portal.',
    `is_visible`      bit(1) NOT NULL DEFAULT 1,
    `is_working`      bit(1) NOT NULL DEFAULT 1,
    `gfx`             int    NOT NULL DEFAULT 1,

    CONSTRAINT `maps_portals_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Portals on map.';

CREATE INDEX `maps_portals_levels_id_idx` ON `maps_portals` (`levels_id`);
CREATE INDEX `maps_portals_maps_id_idx` ON `maps_portals` (`maps_id`);
CREATE INDEX `maps_portals_target_maps_id_idx` ON `maps_portals` (`target_maps_id`);
