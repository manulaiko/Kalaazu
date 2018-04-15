-- Relations for the `skilltree_levels` table.
--
-- A level is a level.
-- A level is for a skill.

ALTER TABLE `skilltree_levels` ADD CONSTRAINT `skilltree_levels_levels` FOREIGN KEY `skilltree_levels_levels` (`levels_id`)
    REFERENCES `levels` (`id`);

ALTER TABLE `skilltree_levels` ADD CONSTRAINT `skilltree_levels_skills` FOREIGN KEY `skilltree_levels_skills` (`skilltree_skills_id`)
    REFERENCES `skilltree_skills` (`id`);
