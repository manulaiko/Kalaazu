-- Events table.
--
-- Contains server's events.
--
CREATE TABLE `events`
(
    `id`          int          NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `name`        varchar(255) NOT NULL DEFAULT '',
    `description` text         NOT NULL,
    `start_date`  timestamp    NULL     DEFAULT NULL
        COMMENT 'Event start date.',
    `end_date`    timestamp    NULL     DEFAULT NULL
        COMMENT 'Event end date.',

    CONSTRAINT `events_pk` PRIMARY KEY (`id`)
)
    ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Contains server''s events.';
