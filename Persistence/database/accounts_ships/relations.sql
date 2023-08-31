-- Relations for the `accounts_ships` table.
--
-- A ship belongs to an account.
-- A ship is a ship.
-- A ship is located in a map.

ALTER TABLE `accounts_ships`
    ADD CONSTRAINT `accounts_ships_accounts` FOREIGN KEY `accounts_ships_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_ships`
    ADD CONSTRAINT `accounts_ships_ships` FOREIGN KEY `accounts_ships_ships` (`ships_id`)
    REFERENCES `ships` (`id`);

ALTER TABLE `accounts_ships`
    ADD CONSTRAINT `accounts_ships_maps` FOREIGN KEY `accounts_ships_maps` (`maps_id`)
    REFERENCES `maps` (`id`);
