-- Relations for the `accounts_skylabs` table.
--
-- A skylab is a skylab module.
-- A skylab has a level.
-- A skylab belongs to an account.

ALTER TABLE `accounts_skylabs` ADD CONSTRAINT `accounts_skylabs_accounts` FOREIGN KEY `accounts_skylabs_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_skylabs` ADD CONSTRAINT `accounts_skylabs_skylab_modules` FOREIGN KEY `accounts_skylabs_skylab_modules` (`skylab_modules_id`)
    REFERENCES `skylab_modules` (`id`);

ALTER TABLE `accounts_skylabs` ADD CONSTRAINT `accounts_skylabs_levels` FOREIGN KEY `accounts_skylabs_levels` (`levels_id`)
    REFERENCES `levels` (`id`);
