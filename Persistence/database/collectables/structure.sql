-- Collectables table.
--
-- Map collectables.
--
CREATE TABLE `collectables`
(
    `id`   tinyint      NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `gfx`  tinyint      NOT NULL DEFAULT 0,
    `type` tinyint      NOT NULL DEFAULT 0
        COMMENT '0 = box, 1 = ore, 2 = beacon, 3 = firework',
    `name` varchar(255) NOT NULL DEFAULT '',

    CONSTRAINT `collectables_pk` PRIMARY KEY (`id`)
)
    ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Map collectables.';
