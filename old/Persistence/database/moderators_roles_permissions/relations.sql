-- Relations for the `moderators_roles_permissions` table.
--
-- A role permission belongs to a moderator.
-- A role permission is a permission

ALTER TABLE `moderators_roles_permissions`
  ADD CONSTRAINT `moderators_roles_permissions_moderators_roles` FOREIGN KEY `moderators_roles_permissions_moderators_roles` (`moderators_roles_id`)
REFERENCES `moderators_roles` (`id`);

ALTER TABLE `moderators_roles_permissions`
  ADD CONSTRAINT `moderators_roles_permissions_permissions` FOREIGN KEY `moderators_roles_permissions_permissions` (`permissions_id`)
REFERENCES `permissions` (`id`);
