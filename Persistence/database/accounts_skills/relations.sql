-- Relations for the `accounts_skills` table.
--
-- A skill belongs to an account.
-- A skill is a skill.
-- A skill has a level.

ALTER TABLE `accounts_skills`
    ADD CONSTRAINT `accounts_skills_accounts` FOREIGN KEY `accounts_skills_accounts` (`accounts_id`)
        REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_skills`
    ADD CONSTRAINT `accounts_skills_skilltree_skills` FOREIGN KEY `accounts_skills_skilltree_skills` (`skilltree_skills_id`)
        REFERENCES `skilltree_skills` (`id`);

ALTER TABLE `accounts_skills`
    ADD CONSTRAINT `accounts_skills_skilltree_levels` FOREIGN KEY `accounts_skills_skilltree_levels` (`skilltree_levels_id`)
        REFERENCES `skilltree_levels` (`id`);
