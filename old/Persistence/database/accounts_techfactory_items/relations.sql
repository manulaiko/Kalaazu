-- Relations for the `accounts_techfactory_items` table.
--
-- An item belongs to an account.
-- An item is a techfactory item.

ALTER TABLE `accounts_techfactory_items`
  ADD CONSTRAINT `accounts_techfactory_items_accounts` FOREIGN KEY `accounts_techfactory_items_accounts` (`accounts_id`)
REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_techfactory_items`
  ADD CONSTRAINT `accounts_techfactory_items_techfactory_items` FOREIGN KEY `accounts_techfactory_items_techfactory_items` (`techfactory_items_id`)
REFERENCES `techfactory_items` (`id`);
