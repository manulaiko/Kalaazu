-- Relations for `users` table.
--
-- An user has an active account.
-- An user can be registered with an invitation code.

ALTER TABLE `users` ADD CONSTRAINT `users_accounts` FOREIGN KEY `users_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `users` ADD CONSTRAINT `users_invitation_codes` FOREIGN KEY `users_invitation_codes` (`invitation_codes_id`)
    REFERENCES `invitation_codes` (`id`);
