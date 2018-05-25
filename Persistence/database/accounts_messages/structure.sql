-- Account's messages table.
--
-- Messaging system.
--
CREATE TABLE `accounts_messages` (
  `id`               int          NOT NULL AUTO_INCREMENT
  COMMENT 'Primary Key.',
  `from_accounts_id` int          NOT NULL,
  `from_status`      tinyint      NOT NULL DEFAULT 1
  COMMENT '0 = unread, 1 = read, 2 = deleted.',
  `to_accounts_id`   int          NOT NULL,
  `to_status`        tinyint      NOT NULL DEFAULT 0
  COMMENT '0 = unread, 1 = read, 2 = unread.',
  `date`             timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title`            varchar(255) NOT NULL,
  `text`             text         NOT NULL,

  CONSTRAINT `accounts_messages_pk` PRIMARY KEY (`id`)
)
  ENGINE InnoDB
  CHARACTER SET utf8
  COMMENT 'Messaging system.';

CREATE INDEX `accounts_messages_from_accounts_id_idx`
  ON `accounts_messages` (`from_accounts_id`);
CREATE INDEX `accounts_messages_to_accounts_id_idx`
  ON `accounts_messages` (`to_accounts_id`);
