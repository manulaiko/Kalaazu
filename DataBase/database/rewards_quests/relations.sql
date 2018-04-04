-- Relations for the `rewards_quests` table.
--
-- A reward is for a Quest.
-- A reward is a reward.

ALTER TABLE `rewards_quests` ADD CONSTRAINT `rewards_quests_rewards` FOREIGN KEY `rewards_quests_rewards` (`rewards_id`)
    REFERENCES `rewards` (`id`);

ALTER TABLE `rewards_quests` ADD CONSTRAINT `rewards_quests_quests` FOREIGN KEY `rewards_quests_quests` (`quests_id`)
    REFERENCES `quests` (`id`);
