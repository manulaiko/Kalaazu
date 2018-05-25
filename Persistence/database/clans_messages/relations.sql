-- Relations for the `clans_messages` table.
--
-- A message belongs to a clan.
-- A message is made by an account.
-- A message may be directed to an account.

ALTER TABLE `clans_messages`
  ADD CONSTRAINT `clans_messages_clans` FOREIGN KEY `clans_messages_clans` (`clans_id`)
REFERENCES `clans` (`id`);

ALTER TABLE `clans_messages`
  ADD CONSTRAINT `clans_messages_to_accounts` FOREIGN KEY `clans_messages_to_accounts` (`to_accounts_id`)
REFERENCES `accounts` (`id`);

ALTER TABLE `clans_messages`
  ADD CONSTRAINT `clans_messages_from_accounts` FOREIGN KEY `clans_messages_from_accounts` (`from_accounts_id`)
REFERENCES `accounts` (`id`);
