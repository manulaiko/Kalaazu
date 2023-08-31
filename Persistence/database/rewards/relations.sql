-- Relations for the `rewards` table.
--
-- A reward is an item.

ALTER TABLE `rewards`
    ADD CONSTRAINT `rewards_items` FOREIGN KEY `rewards_items` (`items_id`)
    REFERENCES `items` (`id`);
