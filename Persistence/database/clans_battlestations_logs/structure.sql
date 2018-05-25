-- Clan's battlestations logs table.
--
-- Logs from clan's battlestations.
--
CREATE TABLE `clans_battlestations_logs` (
  `id`                      int       NOT NULL AUTO_INCREMENT
  COMMENT 'Primary Key.',
  `clans_id`                int       NOT NULL,
  `clans_battlestations_id` tinyint   NOT NULL,
  `message`                 text      NOT NULL,
  `date`                    timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

  CONSTRAINT `clans_battlestations_logs_pk` PRIMARY KEY (`id`)
)
  ENGINE InnoDB
  CHARACTER SET utf8
  COMMENT 'Logs from clan''s battlestations.';

CREATE INDEX `clans_battlestations_logs_clans_battlestations_id_idx`
  ON `clans_battlestations_logs` (`clans_battlestations_id`);
CREATE INDEX `clans_battlestations_logs_clans_id_idx`
  ON `clans_battlestations_logs` (`clans_id`);
