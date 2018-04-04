-- Relations for the `galaxygates_spins` table.
--
-- A spin awards an item.

ALTER TABLE `galaxygates_spins` ADD CONSTRAINT `galaxygates_spins_items` FOREIGN KEY `galaxygates_spins_items` (`items_id`)
    REFERENCES `items` (`id`);
