-- Relations for the `ships` table.
--
-- A ship is an item

ALTER TABLE `ships` ADD CONSTRAINT `ships_items` FOREIGN KEY `ships_items` (`items_id`)
    REFERENCES `items` (`id`);
