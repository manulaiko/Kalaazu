-- Relations for the `galaxygates_spawns` table.
--
-- A spawn spawns an NPC.

ALTER TABLE `galaxygates_spawns`
  ADD CONSTRAINT `galaxygates_spawns_npcs` FOREIGN KEY `galaxygates_spawns_npcs` (`npcs_id`)
REFERENCES `npcs` (`id`);
