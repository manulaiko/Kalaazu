-- GalaxyGates to Waves table.
--
-- Many to many relations for galaxygates and galaxygates_waves.
--
CREATE TABLE `galaxygates_gg_waves`
(
    `id`                   smallint NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `galaxygates_id`       tinyint  NOT NULL,
    `galaxygates_waves_id` tinyint  NOT NULL,

    CONSTRAINT `galaxygates_gg_waves_pk` PRIMARY KEY (`id`)
)
    ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Many to many relations for galaxygates and galaxygates_waves.';

CREATE INDEX `galaxygates_gg_waves_galaxygates_id_idx`
    ON `galaxygates_gg_waves` (`galaxygates_id`);
CREATE INDEX `galaxygates_gg_waves_galaxygates_waves_id_idx`
    ON `galaxygates_gg_waves` (`galaxygates_waves_id`);
