-- Relations for the `accounts_clans_roles` table.
--
-- An account.
-- A role.

ALTER TABLE `accounts_clans_roles`
    ADD CONSTRAINT `accounts_clans_roles_accounts` FOREIGN KEY `accounts_clans_roles_accounts` (`accounts_id`)
        REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_clans_roles`
    ADD CONSTRAINT `accounts_clans_roles_clans_roles` FOREIGN KEY `accounts_clans_roles_clans_roles` (`clans_roles_id`)
        REFERENCES `clans_roles` (`id`);
