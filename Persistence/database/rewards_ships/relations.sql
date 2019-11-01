-- Relations for the `rewards_ships` table.
--
-- A reward is for a Ship.
-- A reward is a reward.

ALTER TABLE `rewards_ships`
    ADD CONSTRAINT `rewards_ships_rewards` FOREIGN KEY `rewards_ships_rewards` (`rewards_id`)
        REFERENCES `rewards` (`id`);

ALTER TABLE `rewards_ships`
    ADD CONSTRAINT `rewards_ships_ships` FOREIGN KEY `rewards_ships_ships` (`ships_id`)
        REFERENCES `ships` (`id`);
