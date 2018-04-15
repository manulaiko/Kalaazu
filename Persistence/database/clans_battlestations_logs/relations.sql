-- Relations for the `clans_battlestations_logs` table.
--
-- A log entry belongs to a clan battle station.
-- A log entry belongs to a clan.

ALTER TABLE `clans_battlestations_logs` ADD CONSTRAINT `clans_battlestations_logs_clans_battlestations` FOREIGN KEY `clans_battlestations_logs_clans_battlestations` (`clans_battlestations_id`)
    REFERENCES `clans_battlestations` (`id`);

ALTER TABLE `clans_battlestations_logs` ADD CONSTRAINT `clans_battlestations_logs_clans` FOREIGN KEY `clans_battlestations_logs_clans` (`clans_id`)
    REFERENCES `clans` (`id`);
