-- OAuth clients table.
--
-- Clients.
--
CREATE TABLE `oauth_clients` (
  `id`                     int(10)      UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `user_id`                int          NULL,
  `name`                   varchar(255) NOT NULL,
  `secret`                 varchar(100) NOT NULL,
  `redirect`               text         NOT NULL,
  `personal_access_client` tinyint(1)   NOT NULL,
  `password_client`        tinyint(1)   NOT NULL,
  `revoked`                tinyint(1)   NOT NULL,
  `created_at`             timestamp    NULL,
  `updated_at`             timestamp    NULL
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Clients.';

CREATE INDEX `oauth_clients_user_id_index` ON `oauth_clients` (`user_id`);