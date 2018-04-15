-- Relations for the `rewards_npcs` table.
--
-- A reward is for a NPC.
-- A reward is a reward.

ALTER TABLE `rewards_npcs` ADD CONSTRAINT `rewards_npcs_rewards` FOREIGN KEY `rewards_npcs_rewards` (`rewards_id`)
    REFERENCES `rewards` (`id`);

ALTER TABLE `rewards_npcs` ADD CONSTRAINT `rewards_npcs_npcs` FOREIGN KEY `rewards_npcs_npcs` (`npcs_id`)
    REFERENCES `npcs` (`id`);
