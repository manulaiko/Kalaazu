-- GalaxyGates to GGSpins table.
--
-- Many to many relations for galaxygates and galaxygates_spins.
--
CREATE TABLE `galaxygates_gg_spins`
(
    `id`                   smallint NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `galaxygates_id`       tinyint  NOT NULL,
    `galaxygates_spins_id` tinyint  NOT NULL,

    CONSTRAINT `galaxygates_gg_spins_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
  CHARACTER SET utf8
    COMMENT 'Many to many relations for galaxygates and galaxygates_spins.';

CREATE INDEX `galaxygates_gg_spins_galaxygates_id_idx`
    ON `galaxygates_gg_spins` (`galaxygates_id`);
CREATE INDEX `galaxygates_gg_spins_galaxygates_spins_id_idx`
    ON `galaxygates_gg_spins` (`galaxygates_spins_id`);
