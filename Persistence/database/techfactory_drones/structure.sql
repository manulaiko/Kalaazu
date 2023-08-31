-- Nanotech Factory drones table.
--
-- Drones that can be build in the tech factory.
--
CREATE TABLE `techfactory_drones`
(
    `id`          tinyint      NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `name`        varchar(255) NOT NULL
        COMMENT 'Drone name.',
    `description` text         NOT NULL
        COMMENT 'Drone description.',
    `time`        tinyint      NOT NULL DEFAULT 0
        COMMENT 'Seconds it takes to produce the drone.',
    `parts`       tinyint      NOT NULL DEFAULT 45
        COMMENT 'Necessary parts to build the drone.',
    `price`       int          NOT NULL
        COMMENT 'Price for producing the drone.',
    `factor`      tinyint      NOT NULL DEFAULT 5.00
        COMMENT 'Factor the price reduces with each new part.',

    CONSTRAINT `techfactory_drones_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
    CHARACTER SET utf8
    COMMENT 'Drones that can be build in the tech factory.';

CREATE INDEX `techfactory_drones_name_idx`
    ON `techfactory_drones` (`name`);
