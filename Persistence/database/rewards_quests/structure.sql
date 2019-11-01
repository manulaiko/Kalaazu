-- Ship rewards table.
--
-- Many to many relations table.
--
CREATE TABLE `rewards_quests`
(
    `id`         smallint NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `quests_id`  smallint NOT NULL
        COMMENT 'Quest ID.',
    `rewards_id` smallint NOT NULL
        COMMENT 'Reward to award.',

    CONSTRAINT `rewards_quests_pk` PRIMARY KEY (`id`)
)
    ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Many to many relations.';

CREATE INDEX `rewards_quests_quests_id_idx`
    ON `rewards_quests` (`quests_id`);
CREATE INDEX `rewards_quests_rewards_id_idx`
    ON `rewards_quests` (`rewards_id`);
