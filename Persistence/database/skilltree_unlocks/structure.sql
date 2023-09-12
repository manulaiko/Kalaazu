-- Skilltree unlocks table
--
-- Requisites needed to unlock a skill upgrade.
--
CREATE TABLE `skilltree_unlocks`
(
    `id`                           smallint NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `upgrade_skilltree_levels_id`  smallint NOT NULL
        COMMENT 'Skill to upgrade.',
    `required_skilltree_levels_id` smallint NOT NULL
        COMMENT 'Required skill level to upgrade.',

    CONSTRAINT `skilltree_unlocks_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
  CHARACTER SET utf8
    COMMENT 'Requisites needed to unlock a skill upgrade.';

CREATE INDEX `skilltree_unlocks_upgrade_skilltree_levels_id_idx`
    ON `skilltree_unlocks` (`upgrade_skilltree_levels_id`);
CREATE INDEX `skilltree_unlocks_required_skilltree_levels_id_idx`
    ON `skilltree_unlocks` (`required_skilltree_levels_id`);
