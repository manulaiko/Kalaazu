-- Relations for the `moderators` table.
--
-- A moderator has an account.
-- A moderator has a role.

ALTER TABLE `moderators` ADD CONSTRAINT `moderators_accounts` FOREIGN KEY `moderators_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);
    
ALTER TABLE `moderators` ADD CONSTRAINT `moderators_moderators_roles` FOREIGN KEY `moderators_moderators_roles` (`moderators_roles_id`)
    REFERENCES `moderators_roles` (`id`);
