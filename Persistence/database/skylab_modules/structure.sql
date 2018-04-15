-- Skylab modules table.
--
-- Different skylab modules.
--
CREATE TABLE `skylab_modules` (
    `id`                int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `name`              varchar(255) NOT NULL DEFAULT ''     COMMENT 'Module name.',
    `production_factor` decimal(5,2) NOT NULL DEFAULT 20.00  COMMENT 'Production factor.',
    `production_base`   int          NOT NULL DEFAULT 1000   COMMENT 'Production base.',
    `storage_factor`    decimal(5,2) NOT NULL DEFAULT 50.00  COMMENT 'Storage factor.',
    `storage_base`      int          NOT NULL DEFAULT 20000  COMMENT 'Storage base.',
    `upgrade_factor`    decimal(5,2) NOT NULL DEFAULT 35.00  COMMENT 'Upgrade costs factor.',
    `upgrade_base`      int          NOT NULL DEFAULT 5000   COMMENT 'Upgrade costs base.',
    `energy_factor`     decimal(5,2) NOT NULL DEFAULT 10.00  COMMENT 'Energy consumption factor.',
    `energy_base`       int          NOT NULL DEFAULT 10     COMMENT 'Energy consumption base.',

    CONSTRAINT `skylab_modules` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Different skylab modules.';

CREATE INDEX `skylab_modules_name_idx` ON `skylab_modules` (`name`);
