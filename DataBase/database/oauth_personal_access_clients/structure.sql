-- OAuth personal access clients table.
--
-- Personal access clients.
--
CREATE TABLE `oauth_personal_access_clients` (
  `id`         int(10)   UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `client_id`  int       NOT NULL,
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Personal access clients.';

CREATE INDEX `oauth_personal_access_clients_client_id_index` ON `oauth_personal_access_clients` (`client_id`);