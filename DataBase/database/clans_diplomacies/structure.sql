-- Clan's diplomacies table.
--
-- Diplomacy table for clans.
--
CREATE TABLE `clans_diplomacies` (
    `id`            int       NOT NULL AUTO_INCREMENT            COMMENT 'Primary Key.',
    `from_clans_id` int       NOT NULL                           COMMENT 'Clan that made the request.',
    `to_clans_id`   int       NOT NULL                           COMMENT 'Clan that receives the request.',
    `date`          timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Diplomacy creation date.',
    `expires`       timestamp NULL     DEFAULT NULL              COMMENT 'Date when the diplomacy expires.',
    `status`        int       NOT NULL DEFAULT 0                 COMMENT 'Status of the diplomacy. 0 = not accepted, 1 = accepted, 2 = rejected, 3 = over.',
    `type`          int       NOT NULL DEFAULT 1                 COMMENT 'Diplomacy type. 1 = War, 2 = NAP, 3 = Alliance.',

    CONSTRAINT `clans_diplomacies_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Diplomacy table for clans.';

CREATE INDEX `clans_diplomacies_from_clans_id_idx` ON `clans_diplomacies` (`from_clans_id`);
CREATE INDEX `clans_diplomacies_to_clans_id_idx` ON `clans_diplomacies` (`to_clans_id`);
