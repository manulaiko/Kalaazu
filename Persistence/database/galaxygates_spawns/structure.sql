-- GalaxyGate's wave spawn table.
--
-- Stage spawn for each stage.
--
CREATE TABLE `galaxygates_spawns` (
    `id`      int  NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `npcs_id` int  NOT NULL                COMMENT 'NPC to spawn.',
    `amount`  int  NOT NULL DEFAULT 20     COMMENT 'Amount of NPCs to spawn.',

    CONSTRAINT `galaxygates_spawns_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Stage spawn for each stage.';

CREATE INDEX `galaxygates_spawns_npcs_id_idx` ON `galaxygates_spawns` (`npcs_id`);
