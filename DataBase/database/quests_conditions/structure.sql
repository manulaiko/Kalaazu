-- Quest conditions table.
--
-- Quest's conditions.
--
CREATE TABLE `quests_conditions` (
    `id`                   int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `quests_conditions_id` int          NULL     DEFAULT NULL   COMMENT 'Condition needed to unlock this condition.',
    `quests_id`            int          NULL     DEFAULT NULL,
    `type`                 int          NOT NULL DEFAULT 1      COMMENT '1 = collect, 2 = destroy, 3 = travel, 4 = one of, 5 = in order, 6 = accomplish before, 7 = on map',
    `value`                varchar(255) NOT NULL DEFAULT '',

    CONSTRAINT `quests_conditions_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Quest''s conditions.';

CREATE INDEX `quests_conditions_quests_conditions_id_idx` ON `quests_conditions` (`quests_conditions_id`);
CREATE INDEX `quests_conditions_quests_id_idx` ON `quests_conditions` (`quests_id`);
