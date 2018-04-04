-- OAuth refresh tokens table.
--
-- Refresh tokens.
--
CREATE TABLE `oauth_refresh_tokens` (
  `id`              varchar(100) NOT NULL PRIMARY KEY,
  `access_token_id` varchar(100) NOT NULL,
  `revoked`         tinyint(1)   NOT NULL,
  `expires_at`      datetime     NULL
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Refresh tokens.';

CREATE INDEX `oauth_refresh_tokens_access_token_id_index` ON `oauth_refresh_tokens` (`access_token_id`);
