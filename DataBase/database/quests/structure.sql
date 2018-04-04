-- Quest table.
--
-- In game quests.
--
CREATE TABLE `quests` (
    `id`          int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `levels_id`   int          NOT NULL DEFAULT 1      COMMENT 'Level required to unlock this quest.',
    `quests_id`   int          NULL     DEFAULT NULL   COMMENT 'Quest required to complete in order to unlock this quest.',
    `factions_id` int          NULL     DEFAULT NULL   COMMENT 'Faction required to unlock this quest.',
    `name`        varchar(255) NOT NULL DEFAULT '',

    CONSTRAINT `quests_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'In game quests.';

CREATE INDEX `quests_name` ON `quests` (`name`);
CREATE INDEX `quests_levels_id` ON `quests` (`levels_id`);
CREATE INDEX `quests_quests_id` ON `quests` (`quests_id`);
