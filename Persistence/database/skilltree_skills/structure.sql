-- Skilltree skills table.
--
-- The available skills.
--
CREATE TABLE `skilltree_skills` (
    `id`           tinyint      NOT NULL AUTO_INCREMENT   COMMENT 'Primary Key.',
    `name`         varchar(255) NOT NULL DEFAULT ''       COMMENT 'Skill name.',
    `description`  text         NOT NULL                  COMMENT 'Skill description.',
    `category`     tinyint      NOT NULL DEFAULT 1        COMMENT '1 = blue, 2 = purple, 3 = red.',
    `is_advanced`  boolean      NOT NULL DEFAULT 0        COMMENT 'Whether it''s an advanced skill or not.',
    `bonus_type`   varchar(255) NOT NULL DEFAULT 'health' COMMENT 'Type of bonus the skill awards.',
    `bonus_amount` int          NOT NULL DEFAULT 0        COMMENT 'Amount of bonus the skill awards.',
    `bonus_factor` tinyint      NOT NULL DEFAULT 2        COMMENT 'Factor the bonus increases with each upgrade.',

    CONSTRAINT `skilltree_skills_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'The available skills.';

CREATE INDEX `skilltree_skills_name_idx` ON `skilltree_skills` (`name`);
CREATE INDEX `skilltree_skills_category_idx` ON `skilltree_skills` (`category`);
CREATE INDEX `skilltree_skills_is_advanced_idx` ON `skilltree_skills` (`is_advanced`);
CREATE INDEX `skilltree_skills_bonus_type_idx` ON `skilltree_skills` (`bonus_type`);
