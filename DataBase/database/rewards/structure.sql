-- Rewards table.
--
-- All rewards available so there's no need of JSON.
--
CREATE TABLE `rewards` (
    `id`          int           NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `items_id`    int           NOT NULL                COMMENT 'Item to award.',
    `amount`      int           NOT NULL                COMMENT 'Amount of items to award.',
    `reward`      decimal(4, 3) NOT NULL DEFAULT 1.000  COMMENT 'Percentage of the amount to award (for decimal rewards).',
    `probability` decimal(5, 2) NOT NULL DEFAULT 100.00 COMMENT 'Probability of awarding this item',
    `comment`     varchar(255)  NULL     DEFAULT NULL   COMMENT 'Comment of the reward.',

    CONSTRAINT `rewards_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'All rewards available so there''s no need of JSON.';

CREATE INDEX `rewards_items_id` ON `rewards` (`items_id`);
