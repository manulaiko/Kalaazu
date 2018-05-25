-- Accounts to clan roles table.
--
-- Many to many relation table.
--
CREATE TABLE `accounts_clans_roles` (
  `id`             int NOT NULL AUTO_INCREMENT
  COMMENT 'Primary Key.',
  `accounts_id`    int NOT NULL
  COMMENT 'Account ID.',
  `clans_roles_id` int NOT NULL
  COMMENT 'Role ID.',

  CONSTRAINT `accounts_clans_roles_pk` PRIMARY KEY (`id`)
)
  ENGINE InnoDB
  CHARACTER SET utf8
  COMMENT 'Many to many relation table.';

CREATE INDEX `accounts_clans_roles_accounts_id_idx`
  ON `accounts_clans_roles` (`accounts_id`);
CREATE INDEX `accounts_clans_roles_clans_roles_id_idx`
  ON `accounts_clans_roles` (`clans_roles_id`);
