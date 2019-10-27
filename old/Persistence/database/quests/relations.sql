-- Relations for the `quests` table.
--
-- A quest requires a level to be unlocked.
-- A quest requires another quest to be unlocked.
-- A quest can belong to a faction

ALTER TABLE `quests`
  ADD CONSTRAINT `quests_levels` FOREIGN KEY `quests_levels` (`levels_id`)
REFERENCES `levels` (`id`);

ALTER TABLE `quests`
  ADD CONSTRAINT `quests_quests` FOREIGN KEY `quests_quests` (`quests_id`)
REFERENCES `quests` (`id`);

ALTER TABLE `quests`
  ADD CONSTRAINT `quests_factions` FOREIGN KEY `quests_factions` (`factions_id`)
REFERENCES `factions` (`id`);
