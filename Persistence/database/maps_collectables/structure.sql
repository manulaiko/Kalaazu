-- Map's collectables table.
--
-- Many to many relation table.
--
CREATE TABLE `maps_collectables`
(
    `id`              smallint     NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `maps_id`         smallint     NOT NULL
        COMMENT 'Map ID.',
    `collectables_id` tinyint      NOT NULL
        COMMENT 'collectable ID.',
    `amount`          smallint     NOT NULL DEFAULT 0
        COMMENT 'Amount of collectables on map',
    `region`          varchar(255) NOT NULL DEFAULT '0,0|20800,12800'
        COMMENT 'Region where the collectable will be spawned',

    CONSTRAINT `maps_collectables_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
  CHARACTER SET utf8
    COMMENT 'Many to many relation table.';

CREATE INDEX `maps_collectables_maps_id_idx`
    ON `maps_collectables` (`maps_id`);
CREATE INDEX `maps_collectables_collectables_id_idx`
    ON `maps_collectables` (`collectables_id`);
