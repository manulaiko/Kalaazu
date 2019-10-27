-- Account's ships table.
--
-- Ships bough by an account.
--
CREATE TABLE `accounts_ships` (
  `id`          int     NOT NULL AUTO_INCREMENT
  COMMENT 'Primary Key.',
  `accounts_id` int     NOT NULL,
  `ships_id`    tinyint NOT NULL,
  `maps_id`     tinyint NOT NULL,
  `position`    bigint  NOT NULL DEFAULT 0
  COMMENT 'Position on map.',
  `health`      int     NOT NULL DEFAULT 0
  COMMENT 'Health points.',
  `nanohull`    int     NOT NULL DEFAULT 0
  COMMENT 'Nanohull points.',
  `gfx`         tinyint NOT NULL DEFAULT 0
  COMMENT 'Ship graphic (for WIZ-X).',

  CONSTRAINT `accounts_ships_pk` PRIMARY KEY (`id`)
)
  ENGINE InnoDB
  CHARACTER SET utf8
  COMMENT 'Ships bough by an account.';

CREATE INDEX `accounts_ships_accounts_id_idx`
  ON `accounts_ships` (`accounts_id`);
CREATE INDEX `accounts_ships_ships_id_idx`
  ON `accounts_ships` (`ships_id`);
CREATE INDEX `accounts_ships_maps_id_idx`
  ON `accounts_ships` (`maps_id`);
