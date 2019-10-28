-- Invitation codes table.
--
-- Contains the invitation codes that can be used for registering.
--
CREATE TABLE `invitation_codes` (
  `id`    smallint     NOT NULL AUTO_INCREMENT
  COMMENT 'Primary Key.',
  `code`  varchar(255) NOT NULL DEFAULT ''
  COMMENT 'The invitation code.',
  `limit` tinyint      NOT NULL DEFAULT 1
  COMMENT 'Amount of times the code can be used.',

  CONSTRAINT `invitation_codes_pk` PRIMARY KEY (`id`)
)
  ENGINE InnoDB
  CHARACTER SET utf8
  COMMENT 'Contains the invitation codes that can be used for registering.';

CREATE UNIQUE INDEX `invitation_codes_id_idx`
  ON `invitation_codes` (`id`);
CREATE UNIQUE INDEX `invitation_codes_code_idx`
  ON `invitation_codes` (`code`);
