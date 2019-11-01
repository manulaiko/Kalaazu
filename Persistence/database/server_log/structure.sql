-- Server logs table.
--
-- Server fired events.
--
CREATE TABLE `server_logs`
(
    `id`      int          NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `date`    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `level`   varchar(255) NOT NULL DEFAULT 'debug'
        COMMENT 'Log level (emergency, alert, critical, error, warning, notice, info, debug)',
    `type`    varchar(255) NOT NULL DEFAULT '',
    `context` text         NOT NULL,

    CONSTRAINT `server_logs_pk` PRIMARY KEY (`id`)
)
    ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Server fired events.';

CREATE INDEX `server_logs_level_idx`
    ON `server_logs` (`level`);
