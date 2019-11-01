-- Skilltree levels table.
--
-- Levels a skill can reach.
--
CREATE TABLE `skilltree_levels`
(
    `id`                  smallint NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `skilltree_skills_id` tinyint  NOT NULL
        COMMENT 'The skill.',
    `levels_id`           tinyint  NOT NULL
        COMMENT 'Level to upgrade the skill.',
    `credits`             int      NOT NULL DEFAULT 10000
        COMMENT 'Credits needed to upgrade this skill.',
    `seprom`              smallint NOT NULL DEFAULT 0
        COMMENT 'Seprom needed to upgrade this skill.',
    `points`              tinyint  NOT NULL DEFAULT 1
        COMMENT 'Research points needed to upgrade this skill.',

    CONSTRAINT `skilltree_levels_pk` PRIMARY KEY (`id`)
)
    ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Levels a skill can reach.';
