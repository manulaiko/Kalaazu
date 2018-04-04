-- GalaxyGate's waves table.
--
-- Waves of the galaxy gate.
--
CREATE TABLE `galaxygates_waves` (
    `id`      int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `maps_id` int NOT NULL                COMMENT 'Map',
    `seconds` int NOT NULL DEFAULT 120    COMMENT 'Seconds to wait between stages',
    `npcs`    int NOT NULL DEFAULT 5      COMMENT 'NPCS that the user must destroy to spawn next stage',

    CONSTRAINT `galaxygates_waves_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Waves of the galaxy gate.';

CREATE INDEX `galaxygates_waves_maps_id_idx` ON `galaxygates_waves` (`maps_id`);
