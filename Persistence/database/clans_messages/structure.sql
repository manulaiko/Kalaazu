-- Clan messages table.
--
-- Messages in the clan.
--
CREATE TABLE `clans_messages` (
    `id`               int          NOT NULL AUTO_INCREMENT             COMMENT 'Primary Key.',
    `clans_id`         int          NOT NULL                            COMMENT 'Clan where the message was created',
    `from_accounts_id` int          NOT NULL,
    `from_status`      tinyint      NOT NULL DEFAULT 1                  COMMENT '0 = unread, 1 = read, 2 = deleted.',
    `to_accounts_id`   int          NULL     DEFAULT NULL,
    `to_status`        tinyint      NOT NULL DEFAULT 0                  COMMENT '0 = unread, 1 = read, 2 = unread.',
    `title`            varchar(255) NOT NULL DEFAULT '',
    `text`             text         NOT NULL,
    `date`             timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT `clans_messages` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Messages in the clan.';

CREATE INDEX `clans_messages_clans_id_idx` ON `clans_messages` (`clans_id`);
CREATE INDEX `clans_messages_from_accounts_id_idx` ON `clans_messages` (`from_accounts_id`);
CREATE INDEX `clans_messages_to_accounts_id_idx` ON `clans_messages` (`to_accounts_id`);
