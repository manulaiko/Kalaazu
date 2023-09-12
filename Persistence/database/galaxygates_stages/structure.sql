-- GalaxyGate's wave stage table.
--
-- Spawn stage for each wave.
--
CREATE TABLE `galaxygates_stages`
(
    `id`                   int     NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `galaxygates_waves_id` tinyint NOT NULL
        COMMENT 'Wave this stage belongs to',
    `comment`              text    NULL DEFAULT NULL
        COMMENT 'Just so this isn''t that empty',

    CONSTRAINT `galaxygates_stages_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
  CHARACTER SET utf8
    COMMENT 'Spawn stage for each wave.';

CREATE INDEX `galaxygates_stages_galaxygates_waves_id_idx`
    ON `galaxygates_stages` (`galaxygates_waves_id`);
