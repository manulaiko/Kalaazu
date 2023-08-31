-- GalaxyGate's spins table.
--
-- Spins from the galaxy gate.
--
CREATE TABLE `galaxygates_spins`
(
    `id`          tinyint  NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `type`        tinyint  NOT NULL DEFAULT 1
        COMMENT 'Type from `galaxygates_probabilities`',
    `probability` float    NOT NULL DEFAULT '0.0',
    `items_id`    smallint NOT NULL,
    `amount`      smallint NOT NULL DEFAULT 1,

    CONSTRAINT `galaxygates_spins_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Spins from the galaxy gate.';

CREATE INDEX `galaxygates_spins_items_id_idx`
    ON `galaxygates_spins` (`items_id`);
