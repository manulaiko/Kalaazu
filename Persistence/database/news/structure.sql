-- News table.
--
-- Server news.
--
CREATE TABLE `news` (
    `id`     int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `date`   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `image`  varchar(255) NOT NULL DEFAULT '',
    `title`  varchar(255) NOT NULL DEFAULT '',
    `teaser` varchar(255) NOT NULL DEFAULT '',
    `text`   text         NOT NULL,

    CONSTRAINT `news_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Server news.';

CREATE INDEX `news_title` ON `news` (`title`);
CREATE INDEX `news_date` ON `news` (`date`);
