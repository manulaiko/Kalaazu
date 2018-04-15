-- Relations for the `accounts_quests` table.
--
-- A quest belongs to an account.
-- A quest is a quest.

ALTER TABLE `accounts_quests` ADD CONSTRAINT `accounts_quests_accounts` FOREIGN KEY `accounts_quests_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_quests` ADD CONSTRAINT `accounts_quests_quests` FOREIGN KEY `accounts_quests_quests` (`quests_id`)
    REFERENCES `quests` (`id`);
