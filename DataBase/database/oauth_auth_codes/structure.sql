-- OAuth auth codes table.
--
-- Authentication codes.
--
CREATE TABLE `oauth_auth_codes` (
  `id`         varchar(100) NOT NULL PRIMARY KEY,
  `user_id`    int          NOT NULL,
  `client_id`  int          NOT NULL,
  `scopes`     text         NULL,
  `revoked`    tinyint(1)   NOT NULL,
  `expires_at` datetime     NULL
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Authentication codes.';
