-- Moderators' logs table.
--
-- Logged events made by moderators.
--
CREATE TABLE `moderators_logs`
(
    `id`            int          NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `moderators_id` tinyint      NOT NULL,
    `date`          timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `type`          varchar(255) NOT NULL DEFAULT '',
    `text`          text         NOT NULL,

    CONSTRAINT `moderators_logs_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
  CHARACTER SET utf8
    COMMENT 'Logged events made by moderators.';

CREATE INDEX `moderators_logs_moderators_id_idx`
    ON `moderators_logs` (`moderators_id`);
CREATE INDEX `moderators_logs_type_idx`
    ON `moderators_logs` (`type`);
