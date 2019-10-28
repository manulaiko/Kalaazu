-- Relations for the `clans_roles_permissions` table.
--
-- A role permission belongs to a clan.
-- A role permission is a permission

ALTER TABLE `clans_roles_permissions`
  ADD CONSTRAINT `clans_roles_permissions_clans_roles` FOREIGN KEY `clans_roles_permissions_clans_roles` (`clans_roles_id`)
REFERENCES `clans_roles` (`id`);

ALTER TABLE `clans_roles_permissions`
  ADD CONSTRAINT `clans_roles_permissions_permissions` FOREIGN KEY `clans_roles_permissions_permissions` (`permissions_id`)
REFERENCES `permissions` (`id`);
