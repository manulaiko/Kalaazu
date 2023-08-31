-- Relations for the `levels_upgrades` table.
--
ALTER TABLE `levels_upgrades`
    ADD CONSTRAINT `levels_upgrades_levels` FOREIGN KEY `levels_upgrades_levels` (`levels_id`)
    REFERENCES `levels` (`id`);
