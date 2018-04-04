-- Levels table.
--
-- Contains server's levels.
--
CREATE TABLE `levels` (
    `id`      int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `account` bigint       NOT NULL DEFAULT 0      COMMENT 'Experience needed for an account to reach this level.',
    `drone`   int          NOT NULL DEFAULT -1     COMMENT 'Experience needed for a drone to reach this level',
    `pet`     int          NOT NULL DEFAULT -1     COMMENT 'Experience needed for a PET to reach this level.',
    `damage`  decimal(5,2) NOT NULL DEFAULT 0.0    COMMENT 'Damage bonus applied for an item at this level.',
    `shield`  decimal(5,2) NOT NULL DEFAULT 0.0    COMMENT 'Shield bonus applied to an item at this level.',

    CONSTRAINT `levels_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Contains server\'s levels.';

CREATE  UNIQUE INDEX `levels_account_idx` ON `levels` (`account`);
