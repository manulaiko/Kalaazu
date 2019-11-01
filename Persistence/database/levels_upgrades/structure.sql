-- Level upgrades table.
--
-- Contains the upgrade costs for each level.
--
CREATE TABLE `levels_upgrades`
(
    `id`          int      NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `levels_id`   tinyint  NOT NULL
        COMMENT 'The upgrade level.',
    `probability` tinyint  NOT NULL DEFAULT 5
        COMMENT 'Probability level.',
    `credits`     int      NOT NULL DEFAULT 0
        COMMENT 'Credits needed to upgrade to this level with given probability.',
    `uridium`     smallint NOT NULL DEFAULT 0
        COMMENT 'Uridium needed to upgrade to this level with given probability.',

    CONSTRAINT `levels_upgrades` PRIMARY KEY (`id`)
)
    ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Contains the upgrade costs for each level.';
