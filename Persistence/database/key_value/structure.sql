-- Key-Value table.
--
-- Contains simple Key -> Value entries.
--
CREATE TABLE `key_value`
(
    `id`    int          NOT NULL AUTO_INCREMENT,
    `name`  varchar(255) NOT NULL DEFAULT '',
    `value` varchar(255) NOT NULL DEFAULT '',

    CONSTRAINT `key_value_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
  CHARACTER SET utf8
    COMMENT 'Contains simple Key -> Value entries.';
