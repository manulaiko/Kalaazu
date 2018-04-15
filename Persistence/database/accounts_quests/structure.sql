-- Account's quests table.
--
-- Quest status of the account.
--
CREATE TABLE `accounts_quests` (
    `id`          int       NOT NULL AUTO_INCREMENT             COMMENT 'Primary Key.',
    `quests_id`   int       NOT NULL,
    `accounts_id` int       NOT NULL,
    `completed`   bit(1)    NOT NULL DEFAULT 0                  COMMENT 'Whether the quest has been completed or not.',
    `date`        timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP  COMMENT 'Date when the quest was accepted/completed.',

    CONSTRAINT `accounts_quests_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Quest status of the account.';

CREATE INDEX `accounts_quests_quests_id_idx` ON `accounts_quests` (`quests_id`);
CREATE INDEX `accounts_quests_accounts_id_idx` ON `accounts_quests` (`accounts_id`);
