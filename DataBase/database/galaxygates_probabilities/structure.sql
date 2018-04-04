-- GalaxyGates probabilities table.
--
-- Spin probabilities for the galaxy gates.
--
CREATE TABLE `galaxygates_probabilities` (
    `id`             int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `galaxygates_id` int          NULL     DEFAULT NULL   COMMENT 'The galaxy gate.',
    `type`           int          NOT NULL DEFAULT 0      COMMENT '1 = ammo, 2 = resource, 3 = voucher, 4 = logfile, 5 = part, 6 = special.',
    `probability`    decimal(5,2) NOT NULL DEFAULT 100.00 COMMENT 'Probability of awarding one spin of this type.',

    CONSTRAINT `galaxygates_probabilities_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Spin probabilities for the galaxy gates.';
