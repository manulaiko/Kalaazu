-- Relations for the `techfactory_costs` table.
--
-- A cost is for a Techfactory item.
-- A cost requires an item.

ALTER TABLE `techfactory_costs`
    ADD CONSTRAINT `techfactory_costs_techfactory_items` FOREIGN KEY `techfactory_costs_techfactory_items` (`techfactory_items_id`)
    REFERENCES `techfactory_items` (`id`);

ALTER TABLE `techfactory_costs`
    ADD CONSTRAINT `techfactory_costs_items` FOREIGN KEY `techfactory_costs_items` (`items_id`)
    REFERENCES `items` (`id`);
