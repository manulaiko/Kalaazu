-- GalaxyGate rewards table.
--
-- Many to many relations table.
--
CREATE TABLE `rewards_galaxygates` (
    `id`             int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `galaxygates_id` int NOT NULL                COMMENT 'GalaxyGate ID.',
    `rewards_id`     int NOT NULL                COMMENT 'Reward to award.',

    CONSTRAINT `rewards_galaxygates_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Many to many relations.';

CREATE INDEX `rewards_galaxygates_galaxygates_id_idx` ON `rewards_galaxygates` (`galaxygates_id`);
CREATE INDEX `rewards_galaxygates_rewards_id_idx` ON `rewards_galaxygates` (`rewards_id`);
