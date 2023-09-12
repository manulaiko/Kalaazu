-- Map's collectables table.
--
-- Many to many relation table.
--
CREATE TABLE `maps_collectables`
(
    `id`              tinyint NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `maps_id`         tinyint NOT NULL
        COMMENT 'Map ID.',
    `collectables_id` tinyint NOT NULL
        COMMENT 'collectable ID.',
    `amount`          tinyint NOT NULL DEFAULT 0
        COMMENT 'Amount of collectables on map',
    `from`            bigint  NOT NULL DEFAULT 0
        COMMENT 'Starting position where the collectable will be spawned',
    `to`              bigint  NULL     DEFAULT NULL
        COMMENT 'Ending position where the collectable will be spawned, null = map limit',

    CONSTRAINT `maps_collectables_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
  CHARACTER SET utf8
    COMMENT 'Many to many relation table.';

CREATE INDEX `maps_collectables_maps_id_idx`
    ON `maps_collectables` (`maps_id`);
CREATE INDEX `maps_collectables_collectables_id_idx`
    ON `maps_collectables` (`collectables_id`);
