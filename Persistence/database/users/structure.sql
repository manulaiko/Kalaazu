-- Users table.
--
-- Contains the registered users.
--
CREATE TABLE `users`
(
    `id`                      int          NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `date`                    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP
        COMMENT 'Date when the user registered.',
    `invitation_codes_id`     smallint     NULL     DEFAULT NULL
        COMMENT 'Invitation code used to register',
    `name`                    varchar(255) NOT NULL DEFAULT ''
        COMMENT 'User name.',
    `password`                varchar(255) NOT NULL DEFAULT ''
        COMMENT 'Password hash (argon).',
    `email`                   varchar(255) NOT NULL DEFAULT ''
        COMMENT 'User email.',
    `email_verification_code` varchar(32)  NOT NULL DEFAULT ''
        COMMENT 'Email verification code.',
    `email_verification_date` timestamp    NULL     DEFAULT NULL
        COMMENT 'Date when the user verified its email.',
    `ip`                      varchar(45)  NOT NULL DEFAULT '0.0.0.0'
        COMMENT 'Registration IP.',

    CONSTRAINT `users_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
  CHARACTER SET utf8
    COMMENT 'Contains the login information of the registered users.';

CREATE UNIQUE INDEX `users_id_idx`
    ON `users` (`id`);
CREATE UNIQUE INDEX `users_name_idx`
    ON `users` (`name`);
CREATE UNIQUE INDEX `users_email_verification_code_idx`
    ON `users` (`email_verification_code`);
