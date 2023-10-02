-- Clan battle stations table.
--
-- Clan CBS.
--
CREATE TABLE `clans_battlestations`
(
    `id`       tinyint      NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `clans_id` int          NULL     DEFAULT NULL
        COMMENT 'Owner of the CBS.',
    `maps_id`  smallint     NOT NULL
        COMMENT 'Map of the CBS.',
    `name`     varchar(255) NOT NULL DEFAULT '',
    `position` varchar(255) NOT NULL DEFAULT '0,0'
        COMMENT 'Position on map.',
    `date`     timestamp    NULL     DEFAULT NULL
        COMMENT 'Date when the CBS was build.',

    CONSTRAINT `clans_battlestations_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
  CHARACTER SET utf8
    COMMENT 'Clan CBS.';

CREATE INDEX `clans_battlestations_clans_id_idx`
    ON `clans_battlestations` (`clans_id`);
CREATE INDEX `clans_battlestations_maps_id_idx`
    ON `clans_battlestations` (`maps_id`);
