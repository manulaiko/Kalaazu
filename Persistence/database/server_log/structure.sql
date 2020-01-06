-- Server logs table.
--
-- Server fired events.
--
CREATE TABLE `server_logs`
(
    `id`    int          NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `date`  timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `level` tinyint      NOT NULL DEFAULT 0
        COMMENT 'Log level (0 = emergency, 1 = alert, 2 = critical, 3 = error, 4 = warning, 5 = notice, 6 = info, 7 = debug)',
    `text`  text         NOT NULL,

    CONSTRAINT `server_logs_pk` PRIMARY KEY (`id`)
)
    ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Server fired events.';

CREATE INDEX `server_logs_level_idx`
    ON `server_logs` (`level`);
