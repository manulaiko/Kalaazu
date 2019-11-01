-- NPC rewards table.
--
-- Many to many relations table.
--
CREATE TABLE `rewards_npcs`
(
    `id`         smallint NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `npcs_id`    tinyint  NOT NULL
        COMMENT 'NPC ID.',
    `rewards_id` smallint NOT NULL
        COMMENT 'Reward to award.',

    CONSTRAINT `rewards_npcs_pk` PRIMARY KEY (`id`)
)
    ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Many to many relations.';

CREATE INDEX `rewards_npcs_npcs_id_idx`
    ON `rewards_npcs` (`npcs_id`);
CREATE INDEX `rewards_npcs_rewards_id_idx`
    ON `rewards_npcs` (`rewards_id`);
