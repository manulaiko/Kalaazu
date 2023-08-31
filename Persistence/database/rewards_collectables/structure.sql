-- Collectable rewards table.
--
-- Many to many relations table.
--
CREATE TABLE `rewards_collectables`
(
    `id`              smallint NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `collectables_id` tinyint  NOT NULL
        COMMENT 'Collectable ID.',
    `rewards_id`      smallint NOT NULL
        COMMENT 'Reward to award.',

    CONSTRAINT `rewards_collectables_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Many to many relations.';

CREATE INDEX `rewards_collectables_npcs_id_idx`
    ON `rewards_collectables` (`collectables_id`);
CREATE INDEX `rewards_collectables_rewards_id_idx`
    ON `rewards_collectables` (`rewards_id`);
