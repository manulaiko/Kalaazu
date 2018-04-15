-- Relations for the `quests_conditions` table.
--
-- A condition belongs to a quest.
-- A condition may have a parent condition.

ALTER TABLE `quests_conditions` ADD CONSTRAINT `quests_conditions_quests` FOREIGN KEY `quests_conditions_quests` (`quests_id`)
    REFERENCES `quests` (`id`);

ALTER TABLE `quests_conditions` ADD CONSTRAINT `quests_conditions_quests_conditions` FOREIGN KEY `quests_conditions_quests_conditions` (`quests_conditions_id`)
    REFERENCES `quests_conditions` (`id`);
