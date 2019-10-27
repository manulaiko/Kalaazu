-- Relations for the `clans_ranking` table.
--
-- A rank belongs to a clan.

ALTER TABLE `clans_ranking`
  ADD CONSTRAINT `clans_ranking_clans` FOREIGN KEY `clans_ranking_clans` (`clans_id`)
REFERENCES `clans` (`id`);
