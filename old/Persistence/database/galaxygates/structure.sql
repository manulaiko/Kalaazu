-- GalaxyGates table.
--
-- Galaxy gates from the server.
--
CREATE TABLE `galaxygates` (
  `id`                   tinyint      NOT NULL AUTO_INCREMENT
  COMMENT 'Primary Key.',
  `name`                 varchar(255) NOT NULL DEFAULT 'GG-A',
  `galaxygates_waves_id` tinyint      NULL     DEFAULT NULL
  COMMENT 'Starting wave.',
  `parts`                tinyint      NOT NULL DEFAULT 0
  COMMENT 'Necessary parts to build the gate.',

  CONSTRAINT `galaxygates_pk` PRIMARY KEY (`id`)
)
  ENGINE InnoDB
  CHARACTER SET utf8
  COMMENT 'Galaxy gates from the server.';
