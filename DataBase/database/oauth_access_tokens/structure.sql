-- OAuth access tokens table.
--
-- Access tokens.
--
CREATE TABLE `oauth_access_tokens` (
  `id`         varchar(100) NOT NULL PRIMARY KEY,
  `user_id`    int          NULL,
  `client_id`  INT          NOT NULL,
  `name`       varchar(255) NULL,
  `scopes`     text         NULL,
  `revoked`    tinyint(1)   NOT NULL,
  `created_at` timestamp    NULL,
  `updated_at` timestamp    NULL,
  `expires_at` datetime     NULL
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Access tokens.';

CREATE INDEX `oauth_access_tokens_user_id_index` ON `oauth_access_tokens` (`user_id`);