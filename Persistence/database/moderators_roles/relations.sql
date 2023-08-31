-- Relations for the `moderators_roles` table.
--
-- A role can have a parent role

ALTER TABLE `moderators_roles`
    ADD CONSTRAINT `moderators_roles_moderators_roles` FOREIGN KEY `moderators_roles_moderators_roles` (`moderators_roles_id`)
    REFERENCES `moderators_roles` (`id`);
