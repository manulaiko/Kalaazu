-- Relations for the `rewards_collectables` table.
--
-- A reward is for a Collectable.
-- A reward is a reward.

ALTER TABLE `rewards_collectables`
  ADD CONSTRAINT `rewards_collectables_rewards` FOREIGN KEY `rewards_collectables_rewards` (`rewards_id`)
REFERENCES `rewards` (`id`);

ALTER TABLE `rewards_collectables`
  ADD CONSTRAINT `rewards_collectables_collectables` FOREIGN KEY `rewards_collectables_collectables` (`collectables_id`)
REFERENCES `collectables` (`id`);
