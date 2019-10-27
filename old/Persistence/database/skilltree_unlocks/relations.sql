-- Relations for the `skilltree_unlocks` table.
--
-- A unlock is for a skill level.
-- A unlock requires another skill level.

ALTER TABLE `skilltree_unlocks`
  ADD CONSTRAINT `skilltree_unlocks_upgrade_skilltree_levels` FOREIGN KEY `skilltree_unlocks_upgrade_skilltree_levels` (`upgrade_skilltree_levels_id`)
REFERENCES `skilltree_levels` (`id`);

ALTER TABLE `skilltree_unlocks`
  ADD CONSTRAINT `skilltree_unlocks_required_skilltree_levels` FOREIGN KEY `skilltree_unlocks_required_skilltree_levels` (`required_skilltree_levels_id`)
REFERENCES `skilltree_levels` (`id`);
