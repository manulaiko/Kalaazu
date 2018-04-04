-- Clan battlestation's items table.
--
-- Items equiped in the CBS.
--
CREATE TABLE `clans_battlestations_items` (
    `id`                      int        NOT NULL AUTO_INCREMENT            COMMENT 'Primary Key.',
    `clans_battlestations_id` int        NOT NULL                           COMMENT 'CBS where item is equiped.',
    `accounts_items_id`       int        NOT NULL                           COMMENT 'Equiped item.',
    `slot`                    tinyint(1) NOT NULL DEFAULT 1                 COMMENT 'Position where the item is equiped (A = 9, B = 10).',
    `date`                    timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date when the item was equiped.',

    CONSTRAINT `clans_battlestations_items_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Items equiped in the CBS.';

CREATE INDEX `clans_battlestations_items_clans_battlestations_id_idx` ON `clans_battlestations_items` (`clans_battlestations_id`);
CREATE INDEX `clans_battlestations_items_accounts_items_id_idx` ON `clans_battlestations_items` (`accounts_items_id`);
