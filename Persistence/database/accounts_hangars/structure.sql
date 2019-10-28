-- Account's hangars table.
--
-- Hangars bough by an account.
--
CREATE TABLE `accounts_hangars` (
  `id`                         int          NOT NULL AUTO_INCREMENT
  COMMENT 'Primary Key.',
  `accounts_id`                int          NOT NULL,
  `accounts_ships_id`          int          NULL     DEFAULT NULL
  COMMENT 'Ship available in the hangar.',
  `accounts_configurations_id` int          NULL     DEFAULT NULL
  COMMENT 'Equipped configuration.',
  `name`                       varchar(255) NOT NULL DEFAULT 'HANGAR',
  `priority`                   tinyint      NULL     DEFAULT -1
  COMMENT 'Order priority, null = not ordered.',
  `date`                       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,

  CONSTRAINT `accounts_hangars_pk` PRIMARY KEY (`id`)
)
  ENGINE InnoDB
  CHARACTER SET utf8
  COMMENT 'Hangars bough by an account.';

CREATE INDEX `accounts_hangars_accounts_accounts_id_idx`
  ON `accounts_hangars` (`accounts_id`);
CREATE INDEX `accounts_hangars_accounts_ships_id_idx`
  ON `accounts_hangars` (`accounts_ships_id`);
