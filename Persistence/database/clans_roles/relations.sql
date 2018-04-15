-- Relations for the `clans_roles` table.
--
-- A role belongs to a clan.

ALTER TABLE `clans_roles` ADD CONSTRAINT `clans_roles_clans` FOREIGN KEY `clans_roles_clans` (`clans_id`)
    REFERENCES `clans` (`id`);
