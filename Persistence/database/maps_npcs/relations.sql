-- Relations for the `maps_npcs` table.
--
-- A npc belongs to a map.
-- A npc is a npc.

ALTER TABLE `maps_npcs`
    ADD CONSTRAINT `maps_npcs_maps` FOREIGN KEY `maps_npcs_maps` (`maps_id`)
        REFERENCES `maps` (`id`);

ALTER TABLE `maps_npcs`
    ADD CONSTRAINT `maps_npcs_npcs` FOREIGN KEY `maps_npcs_npcs` (`npcs_id`)
        REFERENCES `npcs` (`id`);
