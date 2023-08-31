-- Relations for the `clans_applications` table.
--
-- An application is designated to a clan.
-- An application belongs to an account.

ALTER TABLE `clans_applications`
    ADD CONSTRAINT `clans_applications_clans` FOREIGN KEY `clans_applications_clans` (`clans_id`)
    REFERENCES `clans` (`id`);

ALTER TABLE `clans_applications`
    ADD CONSTRAINT `clans_applications_accounts` FOREIGN KEY `clans_applications_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);
