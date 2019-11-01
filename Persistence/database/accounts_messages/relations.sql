-- Relations for the `accounts_messages` table.
--
-- A message comes from an account.
-- A message goes to an account.

ALTER TABLE `accounts_messages`
    ADD CONSTRAINT `accounts_messages_to_accounts` FOREIGN KEY `accounts_messages_to_accounts` (`to_accounts_id`)
        REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_messages`
    ADD CONSTRAINT `accounts_messages_from_accounts` FOREIGN KEY `accounts_messages_from_accounts` (`from_accounts_id`)
        REFERENCES `accounts` (`id`);
