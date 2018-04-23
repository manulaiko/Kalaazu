-- Ship rewards table.
--
-- Many to many relations table.
--
CREATE TABLE `rewards_ships` (
    `id`         tinyint  NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `ships_id`   tinyint  NOT NULL                COMMENT 'Ship ID.',
    `rewards_id` smallint NOT NULL                COMMENT 'Reward to award.',

    CONSTRAINT `rewards_ships_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Many to many relations.';

CREATE INDEX `rewards_ships_ships_id_idx` ON `rewards_ships` (`ships_id`);
CREATE INDEX `rewards_ships_rewards_id_idx` ON `rewards_ships` (`rewards_id`);
