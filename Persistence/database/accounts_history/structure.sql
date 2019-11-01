-- Account history table.
--
-- Account's history events.
--
CREATE TABLE `accounts_history`
(
    `id`          int       NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `accounts_id` int       NOT NULL,
    `type`        tinyint   NOT NULL DEFAULT 0
        COMMENT 'Event type.',
    `message`     text      NOT NULL
        COMMENT 'Event message.',
    `amount`      int       NOT NULL DEFAULT 0
        COMMENT 'For currency related events, the amount of currency.',
    `date`        timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
        COMMENT 'Date when the event occurred.',

    CONSTRAINT `accounts_history_pk` PRIMARY KEY (`id`)
)
    ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Account''s history events.';

CREATE UNIQUE INDEX `accounts_history_accounts_id_idx`
    ON `accounts_history` (`accounts_id`);
