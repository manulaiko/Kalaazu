-- Stages to Spawns table.
--
-- Many to many relations for galaxygates_stages and galaxygates_spawns.
--
CREATE TABLE `galaxygates_stages_spawns`
(
    `id`                    int NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `galaxygates_stages_id` int NOT NULL,
    `galaxygates_spawns_id` int NOT NULL,

    CONSTRAINT `galaxygates_stages_spawns_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
  CHARACTER SET utf8
    COMMENT 'Many to many relations for galaxygates_stages and galaxygates_spawns.';

CREATE INDEX `galaxygates_stages_spawns_galaxygates_stages_id_idx`
    ON `galaxygates_stages_spawns` (`galaxygates_stages_id`);
CREATE INDEX `galaxygates_stages_spawns_galaxygates_spawns_id_idx`
    ON `galaxygates_stages_spawns` (`galaxygates_spawns_id`);
