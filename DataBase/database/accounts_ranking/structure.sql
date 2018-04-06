-- Account's ranking table.
--
-- Account ranking.
--
CREATE TABLE `accounts_rankings` (
    `id`                  int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `accounts_id`         int NOT NULL                COMMENT 'Account ID.',
    `points`              int NOT NULL DEFAULT 0      COMMENT 'Points in the ranking.',
    `best_points`         int NOT NULL DEFAULT 0      COMMENT 'Biggest amount of rank points ever achieved.',
    `destroyed_allies`    int NOT NULL DEFAULT 0      COMMENT 'Destroyed allies.',
    `destroyed_phoenix`   int NOT NULL DEFAULT 0      COMMENT 'Destroyed phoenix.',
    `destroyed_times`     int NOT NULL DEFAULT 0      COMMENT 'Amount of times the account has been destroyed.',
    `destroyed_radiation` int NOT NULL DEFAULT 0      COMMENT 'Amount of times the account has been destroyed by the radiation zone.',

    CONSTRAINT `accounts_rankings_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Account ranking.';

CREATE UNIQUE INDEX `accounts_ranking_accounts_id_idx` ON `accounts_rankings` (`accounts_id`);
