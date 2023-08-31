-- Account's skills table.
--
-- Skilltree for the account.
--
CREATE TABLE `accounts_skills`
(
    `id`                  int      NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `accounts_id`         int      NOT NULL
        COMMENT 'Account ID.',
    `skilltree_skills_id` tinyint  NOT NULL
        COMMENT 'Skill ID.',
    `skilltree_levels_id` smallint NOT NULL
        COMMENT 'Skill level.',

    CONSTRAINT `accounts_skills_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Skilltree for the account.';

CREATE INDEX `accounts_skills_accounts_id_idx`
    ON `accounts_skills` (`accounts_id`);
