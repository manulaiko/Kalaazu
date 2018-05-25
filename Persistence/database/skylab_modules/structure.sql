-- Skylab modules table.
--
-- Different skylab modules.
--
CREATE TABLE `skylab_modules` (
  `id`                tinyint      NOT NULL AUTO_INCREMENT
  COMMENT 'Primary Key.',
  `name`              varchar(255) NOT NULL DEFAULT ''
  COMMENT 'Module name.',
  `production_factor` tinyint      NOT NULL DEFAULT 20
  COMMENT 'Production factor.',
  `production_base`   smallint     NOT NULL DEFAULT 1000
  COMMENT 'Production base.',
  `storage_factor`    smallint     NOT NULL DEFAULT 50
  COMMENT 'Storage factor.',
  `storage_base`      smallint     NOT NULL DEFAULT 20000
  COMMENT 'Storage base.',
  `upgrade_factor`    tinyint      NOT NULL DEFAULT 35
  COMMENT 'Upgrade costs factor.',
  `upgrade_base`      smallint     NOT NULL DEFAULT 5000
  COMMENT 'Upgrade costs base.',
  `energy_factor`     tinyint      NOT NULL DEFAULT 10
  COMMENT 'Energy consumption factor.',
  `energy_base`       tinyint      NOT NULL DEFAULT 10
  COMMENT 'Energy consumption base.',

  CONSTRAINT `skylab_modules` PRIMARY KEY (`id`)
)
  ENGINE InnoDB
  CHARACTER SET utf8
  COMMENT 'Different skylab modules.';

CREATE INDEX `skylab_modules_name_idx`
  ON `skylab_modules` (`name`);
