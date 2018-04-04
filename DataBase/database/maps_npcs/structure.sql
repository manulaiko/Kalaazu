-- Map's NPCs table.
--
-- Many to many relation table.
--
CREATE TABLE `maps_npcs` (
    `id`      int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `maps_id` int NOT NULL                COMMENT 'Map ID.',
    `npcs_id` int NOT NULL                COMMENT 'NPC ID.',
    `amount`  int NOT NULL DEFAULT 0      COMMENT 'Amount of NPCs on map',

    CONSTRAINT `maps_npcs_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Many to many relation table.';

CREATE INDEX `maps_npcs_maps_id_idx` ON `maps_npcs` (`maps_id`);
CREATE INDEX `maps_npcs_npcs_id_idx` ON `maps_npcs` (`npcs_id`);
