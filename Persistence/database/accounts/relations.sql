-- Relations for the `accounts` table.
--
-- An account can belong to a clan.
-- An account belongs to a faction.
-- An account has a rank.
-- An account has a level.
-- An account has an active hangar.
-- An account belongs to an user.

ALTER TABLE `accounts` ADD CONSTRAINT `accounts_clans` FOREIGN KEY `accounts_clans` (`clans_id`)
    REFERENCES `clans` (`id`);

ALTER TABLE `accounts` ADD CONSTRAINT `accounts_factions` FOREIGN KEY `accounts_factions` (`factions_id`)
    REFERENCES `factions` (`id`);

ALTER TABLE `accounts` ADD CONSTRAINT `accounts_accounts_hangars` FOREIGN KEY `accounts_accounts_hangars` (`accounts_hangars_id`)
    REFERENCES `accounts_hangars` (`id`);

ALTER TABLE `accounts` ADD CONSTRAINT `accounts_levels` FOREIGN KEY `accounts_levels` (`levels_id`)
    REFERENCES `levels` (`id`);

ALTER TABLE `accounts` ADD CONSTRAINT `accounts_ranks` FOREIGN KEY `accounts_ranks` (`ranks_id`)
    REFERENCES `ranks` (`id`);

ALTER TABLE `accounts` ADD CONSTRAINT `accounts_users` FOREIGN KEY `accounts_users` (`users_id`)
    REFERENCES `users` (`id`);
