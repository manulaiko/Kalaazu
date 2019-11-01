-- Account's PET table.
--
-- Account's PETs.
--
CREATE TABLE `accounts_pets`
(
    `id`                         int          NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `accounts_id`                int          NOT NULL,
    `levels_id`                  tinyint      NOT NULL DEFAULT 1,
    `name`                       varchar(255) NOT NULL DEFAULT '',
    `experience`                 int          NOT NULL DEFAULT 0,
    `fuel`                       int          NOT NULL DEFAULT 0,
    `health`                     int          NOT NULL DEFAULT 0,
    `slots_lasers_total`         tinyint      NOT NULL,
    `slots_lasers_available`     tinyint      NOT NULL,
    `slots_generators_total`     tinyint      NOT NULL,
    `slots_generators_available` tinyint      NOT NULL,
    `slots_protocols_total`      tinyint      NOT NULL,
    `slots_protocols_available`  tinyint      NOT NULL,
    `slots_gears_total`          tinyint      NOT NULL,
    `slots_gears_available`      tinyint      NOT NULL,

    CONSTRAINT `accounts_pets_pk` PRIMARY KEY (`id`)
)
    ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Account''s PETs.';

CREATE UNIQUE INDEX `accounts_pets_accounts_id_idx`
    ON `accounts_pets` (`accounts_id`);
