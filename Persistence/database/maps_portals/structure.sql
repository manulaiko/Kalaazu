-- Map's portals table.
--
-- Portals on map.
--
CREATE TABLE `maps_portals` (
    `id`              tinyint     NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `levels_id`       tinyint     NOT NULL DEFAULT 1,
    `maps_id`         tinyint     NOT NULL,
    `position`        varchar(15) NOT NULL DEFAULT '0,0'  COMMENT 'Position on map.',
    `target_maps_id`  tinyint     NOT NULL,
    `target_position` varchar(15) NOT NULL DEFAULT '0,0'  COMMENT 'Position where the account will be spawned after using the portal.',
    `is_visible`      boolean     NOT NULL DEFAULT 1,
    `is_working`      boolean     NOT NULL DEFAULT 1,
    `gfx`             tinyint     NOT NULL DEFAULT 1,

    CONSTRAINT `maps_portals_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Portals on map.';

CREATE INDEX `maps_portals_levels_id_idx` ON `maps_portals` (`levels_id`);
CREATE INDEX `maps_portals_maps_id_idx` ON `maps_portals` (`maps_id`);
CREATE INDEX `maps_portals_target_maps_id_idx` ON `maps_portals` (`target_maps_id`);
