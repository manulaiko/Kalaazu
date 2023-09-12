-- Relations for the `rewards_galaxygates` table.
--
-- A reward is for a GalaxyGate.
-- A reward is a reward.

ALTER TABLE `rewards_galaxygates`
    ADD CONSTRAINT `rewards_galaxygates_rewards` FOREIGN KEY `rewards_galaxygates_rewards` (`rewards_id`)
        REFERENCES `rewards` (`id`);

ALTER TABLE `rewards_galaxygates`
    ADD CONSTRAINT `rewards_galaxygates_galaxygates` FOREIGN KEY `rewards_galaxygates_galaxygates` (`galaxygates_id`)
        REFERENCES `galaxygates` (`id`);
