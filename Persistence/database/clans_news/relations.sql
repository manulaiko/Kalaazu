-- Relations for the `clans_news` table.
--
-- A new is made by an account.
-- A new belongs to a clan.

ALTER TABLE `clans_news`
  ADD CONSTRAINT `clans_news_accounts` FOREIGN KEY `clans_news_accounts` (`accounts_id`)
REFERENCES `accounts` (`id`);

ALTER TABLE `clans_news`
  ADD CONSTRAINT `clans_news_clans` FOREIGN KEY `clans_news_clans` (`clans_id`)
REFERENCES `clans` (`id`);
