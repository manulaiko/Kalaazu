-- Relations for the `moderators` table.
--
-- A moderator has an account.

ALTER TABLE `moderators` ADD CONSTRAINT `moderators_accounts` FOREIGN KEY `moderators_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);
