-- Clan applications table.
--
-- Account applications to a clan.
--
CREATE TABLE `clans_applications`
(
    `id`          int       NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `clans_id`    int       NOT NULL
        COMMENT 'Clan ID.',
    `accounts_id` int       NOT NULL
        COMMENT 'Account ID.',
    `date`        timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `text`        text      NOT NULL,

    CONSTRAINT `clans_applications_pk` PRIMARY KEY (`id`)
)
    ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Account applications to a clan.';

CREATE INDEX `clans_applications_clans_id_idx`
    ON `clans_applications` (`clans_id`);
CREATE INDEX `clans_applications_accounts_id_idx`
    ON `clans_applications` (`accounts_id`);
