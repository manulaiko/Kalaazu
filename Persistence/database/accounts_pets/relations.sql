-- Relations for the `accounts_pets` table.
--
-- A pet has a level.
-- A pet belongs to an account.

ALTER TABLE `accounts_pets`
    ADD CONSTRAINT `accounts_pets_accounts` FOREIGN KEY `accounts_pets_accounts` (`accounts_id`)
        REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_pets`
    ADD CONSTRAINT `accounts_pets_levels` FOREIGN KEY `accounts_pets_levels` (`levels_id`)
        REFERENCES `levels` (`id`);
