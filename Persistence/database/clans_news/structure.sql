-- Clan's news table.
--
-- News of the clan.
--
CREATE TABLE `clans_news` (
  `id`          int       NOT NULL AUTO_INCREMENT
  COMMENT 'Primary Key.',
  `accounts_id` int       NOT NULL
  COMMENT 'Author.',
  `clans_id`    int       NOT NULL,
  `date`        timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
  COMMENT 'Creation date.',
  `text`        text      NOT NULL
  COMMENT 'News content.',

  CONSTRAINT `clans_news_pk` PRIMARY KEY (`id`)
)
  ENGINE InnoDB
  CHARACTER SET utf8
  COMMENT 'News of the clan.';

CREATE INDEX `clans_news_accounts_id_idx`
  ON `clans_news` (`accounts_id`);
CREATE INDEX `clans_news_clans_id_idx`
  ON `clans_news` (`clans_id`);
