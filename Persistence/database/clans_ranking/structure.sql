-- Clan's ranking table.
--
-- Clan ranking.
--
CREATE TABLE `clans_ranking`
(
    `id`          int NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `clans_id`    int NOT NULL
        COMMENT 'Clan ID.',
    `points`      int NOT NULL DEFAULT 0
        COMMENT 'Points in the ranking.',
    `best_points` int NOT NULL DEFAULT 0
        COMMENT 'Biggest amount of rank points ever achieved.',

    CONSTRAINT `clans_ranking_pk` PRIMARY KEY (`id`)
)
    ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Clan ranking.';

CREATE UNIQUE INDEX `clans_ranking_accounts_id_idx`
    ON `clans_ranking` (`clans_id`);
