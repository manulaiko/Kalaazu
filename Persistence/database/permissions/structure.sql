-- Permission's table.
--
-- Server permissions.
--
CREATE TABLE `permissions` (
  `id`       tinyint      NOT NULL AUTO_INCREMENT
  COMMENT 'Primary Key.',
  `name`     varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,

  CONSTRAINT `permissions_pk` PRIMARY KEY (`id`)
)
  ENGINE InnoDB
  CHARACTER SET utf8
  COMMENT 'Server permissions.';

CREATE INDEX `permissions_name_idx`
  ON `permissions` (`name`);
CREATE INDEX `permissions_category_idx`
  ON `permissions` (`category`);
