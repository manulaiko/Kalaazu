-- Kalaazu database v3.0.0
-- 
-- @author Manulaiko <manulaiko@gmail.com>

DROP DATABASE IF EXISTS `kalaazu`;
CREATE DATABASE `kalaazu`;
USE `kalaazu`;

-- Accounts table.
--
-- In-game accounts.
--
CREATE TABLE `accounts` (
    `id`                   int          NOT NULL AUTO_INCREMENT             COMMENT 'Primary Key.',
    `users_id`             int          NOT NULL                            COMMENT 'Account''s owner.',
    `session_id`           varchar(32)  NOT NULL                            COMMENT 'Session ID.',
    `levels_id`            tinyint      NOT NULL DEFAULT 1                  COMMENT 'Current level.',
    `factions_id`          tinyint      NULL     DEFAULT NULL               COMMENT 'Faction that the account belongs to.',
    `accounts_hangars_id`  int          NULL     DEFAULT NULL               COMMENT 'Active hangar.',
    `clans_id`             int          NULL     DEFAULT NULL,
    `ranks_id`             tinyint      NOT NULL DEFAULT 1,
    `name`                 varchar(255) NOT NULL DEFAULT ''                 COMMENT 'In game name.',
    `ban_date`             timestamp    NULL     DEFAULT NULL               COMMENT 'Ban expiration date.',
    `premium_date`         timestamp    NULL     DEFAULT NULL               COMMENT 'Premium expiration date.',
    `date`                 timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `last_login`           timestamp    NULL     DEFAULT NULL               COMMENT 'Last login date.',
    `skill_points_total`   smallint     NOT NULL DEFAULT 0                  COMMENT 'Total skill points available.',
    `skill_points_free`    smallint     NOT NULL DEFAULT 0                  COMMENT 'Free skill points available.',

    CONSTRAINT `accounts_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'In game accounts.';

CREATE UNIQUE INDEX `accounts_session_id_idx` ON `accounts` (`session_id`);
CREATE INDEX `accounts_name_idx` ON `accounts` (`name`);
CREATE INDEX `accounts_ranks_id_idx` ON `accounts` (`ranks_id`);
CREATE INDEX `accounts_clans_id_idx` ON `accounts` (`clans_id`);

-- Initial dump for the `accounts` table.

-- Account banks table.
--
-- Account's internal bank.
--
CREATE TABLE `accounts_banks` (
    `id`          int     NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `accounts_id` int     NOT NULL,
    `credits`     bigint  NOT NULL DEFAULT 0      COMMENT 'Credits available in the bank.',
    `uridium`     bigint  NOT NULL DEFAULT 0      COMMENT 'Uridium available in the bank.',
    `tax_credits` tinyint NOT NULL DEFAULT 5      COMMENT 'Tax rate for credits.',
    `tax_uridium` tinyint NOT NULL DEFAULT 0      COMMENT 'Tax rate for uridium.',

    CONSTRAINT `accounts_banks_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Account''s internal bank.';

CREATE UNIQUE INDEX `accounts_banks_accounts_id_idx` ON `accounts_banks` (`accounts_id`);

-- Initial dump for the `accounts_banks` table.

-- Account bank's logs table.
--
-- Logs from account's bank.
--
CREATE TABLE `accounts_banks_logs` (
    `id`                int       NOT NULL AUTO_INCREMENT             COMMENT 'Primary Key.',
    `from_accounts_id`  int       NOT NULL,
    `to_accounts_id`    int       NOT NULL,
    `date`              timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `type`              tinyint   NOT NULL DEFAULT 1                  COMMENT 'Log type. 1 = withdraw, 2 = deposit, 3 = donation.',
    `amount`            int       NOT NULL DEFAULT 0                  COMMENT 'Amount of currency logged.',
    `currency`          tinyint   NOT NULL DEFAULT 1                  COMMENT 'Currency of the amount. 1 = credits, 2 = uridium.',
    `accounts_banks_id` int       NULL     DEFAULT NULL,

    CONSTRAINT `accounts_banks_logs_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Logs from account''s bank';

CREATE INDEX `accounts_banks_logs_from_accounts_id_idx` ON `accounts_banks_logs` (`from_accounts_id`);
CREATE INDEX `accounts_banks_logs_to_accounts_id_idx` ON `accounts_banks_logs` (`to_accounts_id`);

-- Initial dump for the `accounts_banks_logs` table.

-- Accounts to clan roles table.
--
-- Many to many relation table.
--
CREATE TABLE `accounts_clans_roles` (
    `id`             int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `accounts_id`    int NOT NULL                COMMENT 'Account ID.',
    `clans_roles_id` int NOT NULL                COMMENT 'Role ID.',

    CONSTRAINT `accounts_clans_roles_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Many to many relation table.';

CREATE INDEX `accounts_clans_roles_accounts_id_idx` ON `accounts_clans_roles` (`accounts_id`);
CREATE INDEX `accounts_clans_roles_clans_roles_id_idx` ON `accounts_clans_roles` (`clans_roles_id`);

-- Initial dump for the `accounts_clans_roles` table.

-- Account's configurations table.
--
-- Configurations of the accounts.
--
CREATE TABLE `accounts_configurations` (
    `id`                  int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `accounts_hangars_id` int          NOT NULL,
    `configuration_id`    tinyint      NOT NULL DEFAULT 1      COMMENT 'Configuration ID (1 or 2 (or 3)).',
    `name`                varchar(255) NOT NULL DEFAULT '',
    `shield`              int          NOT NULL DEFAULT 0      COMMENT 'Shield available in the configuration.',
    `speed`               smallint     NOT NULL DEFAULT 0      COMMENT 'Speed available in the configuration.',
    `damage`              int          NOT NULL DEFAULT 0      COMMENT 'Damage available in the configuration.',

    CONSTRAINT `accounts_configurations_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Configurations of the accounts.';

CREATE INDEX `accounts_configurations_accounts_hangars_id_idx` ON `accounts_configurations` (`accounts_hangars_id`);

-- Initial dump for the `accounts_configurations` table.

-- Account's configuration items table.
--
-- Items of the configuration.
--
CREATE TABLE `accounts_configurations_accounts_items` (
    `id`                         int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `accounts_configurations_id` int NOT NULL,
    `accounts_items_id`          int NOT NULL,
    `accounts_drones_id`         int NULL     DEFAULT NULL,
    `accounts_pets_id`           int NULL     DEFAULT NULL,

    CONSTRAINT `accounts_configurations_accounts_items_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Items of the configuration.';

-- Initial dump for the `accounts_configurations_accounts_items` table.

-- Account destroys table.
--
-- Account's destroy history.
--
CREATE TABLE `accounts_destroys` (
    `id`          int      NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `accounts_id` int      NOT NULL,
    `ships_id`    tinyint  NOT NULL,
    `points`      smallint NOT NULL DEFAULT 0      COMMENT 'Rank points received for destroying this ship.',
    `amount`      smallint NOT NULL DEFAULT 0      COMMENT 'Times this ship has been destroyed',

    CONSTRAINT `accounts_destroys_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Account''s destroy history.';

CREATE UNIQUE INDEX `accounts_destroys_accounts_id_idx` ON `accounts_destroys` (`accounts_id`);

-- Initial dump for the `accounts_destroys` table.

-- Account's drones table.
--
-- Account's drones.
--
CREATE TABLE `accounts_drones` (
    `id`          int       NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `accounts_id` int       NOT NULL,
    `levels_id`   tinyint   NOT NULL DEFAULT 1,
    `experience`  smallint  NOT NULL DEFAULT 0,
    `date`        timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT `accounts_drones_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Account''s drones.';

CREATE  UNIQUE INDEX `accounts_drones_accounts_id_idx` ON `accounts_drones` (`accounts_id`);

-- Initial dump for the `accounts_drones` table.

-- Account's galaxy gates table.
--
-- Account's build galaxygates.
--
CREATE TABLE `accounts_galaxygates` (
    `id`             int      NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `galaxygates_id` tinyint  NOT NULL,
    `accounts_id`    int      NOT NULL,
    `parts`          tinyint  NOT NULL DEFAULT 0      COMMENT 'Collected parts.',
    `lifes`          tinyint  NOT NULL DEFAULT -1     COMMENT 'Available lives (-1 not build yet)',
    `wave`           tinyint  NOT NULL DEFAULT -1     COMMENT 'Current wave.',
    `times`          smallint NOT NULL DEFAULT 0      COMMENT 'Times this gate was completed.',

    CONSTRAINT `accounts_galaxygates_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Account''s build galaxygates.';

CREATE INDEX `accounts_galaxygates_galaxygates_id_idx` ON `accounts_galaxygates` (`galaxygates_id`);
CREATE INDEX `accounts_galaxygates_accounts_id_idx` ON `accounts_galaxygates` (`accounts_id`);

-- Initial dump for the `accounts_galaxygates` table.

-- Account's hangars table.
--
-- Hangars bough by an account.
--
CREATE TABLE `accounts_hangars` (
    `id`                         int          NOT NULL AUTO_INCREMENT            COMMENT 'Primary Key.',
    `accounts_id`                int          NOT NULL,
    `accounts_ships_id`          int          NULL     DEFAULT NULL              COMMENT 'Ship available in the hangar.',
    `accounts_configurations_id` int          NULL     DEFAULT NULL              COMMENT 'Equipped configuration.',
    `name`                       varchar(255) NOT NULL DEFAULT 'HANGAR',
    `priority`                   tinyint      NULL     DEFAULT -1                COMMENT 'Order priority, null = not ordered.',
    `date`                       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT `accounts_hangars_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Hangars bough by an account.';

CREATE INDEX `accounts_hangars_accounts_accounts_id_idx` ON `accounts_hangars` (`accounts_id`);
CREATE INDEX `accounts_hangars_accounts_ships_id_idx` ON `accounts_hangars` (`accounts_ships_id`);

-- Initial dump for the `accounts_hangars` table.

-- Account history table.
--
-- Account's history events.
--
CREATE TABLE `accounts_history` (
    `id`          int       NOT NULL AUTO_INCREMENT            COMMENT 'Primary Key.',
    `accounts_id` int       NOT NULL,
    `type`        tinyint   NOT NULL DEFAULT 0                 COMMENT 'Event type.',
    `message`     text      NOT NULL                           COMMENT 'Event message.',
    `amount`      int       NOT NULL DEFAULT 0                 COMMENT 'For currency related events, the amount of currency.',
    `date`        timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date when the event occurred.',

    CONSTRAINT `accounts_history_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Account''s history events.';

CREATE UNIQUE INDEX `accounts_history_accounts_id_idx` ON `accounts_history` (`accounts_id`);

-- Initial dump for the `accounts_history` table.

-- Account's items table.
--
-- Items bough by an account.
--
CREATE TABLE `accounts_items` (
    `id`          int       NOT NULL AUTO_INCREMENT             COMMENT 'Primary Key.',
    `items_id`    smallint  NOT NULL,
    `accounts_id` int       NOT NULL,
    `levels_id`   tinyint   NOT NULL DEFAULT 1,
    `date`        timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `amount`      bigint    NOT NULL DEFAULT 1                  COMMENT 'Amount of items bough (for stackable items).',

    CONSTRAINT `accounts_items_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Items bough by an account.';

CREATE INDEX `accounts_items_items_id_idx` ON `accounts_items` (`items_id`);
CREATE INDEX `accounts_items_accounts_id_idx` ON `accounts_items` (`accounts_id`);
CREATE INDEX `accounts_items_levels_id_idx` ON `accounts_items` (`levels_id`);

-- Initial dump for the `accounts_items` table.

-- Account's messages table.
--
-- Messaging system.
--
CREATE TABLE `accounts_messages` (
    `id`               int          NOT NULL AUTO_INCREMENT             COMMENT 'Primary Key.',
    `from_accounts_id` int          NOT NULL,
    `from_status`      tinyint      NOT NULL DEFAULT 1                  COMMENT '0 = unread, 1 = read, 2 = deleted.',
    `to_accounts_id`   int          NOT NULL,
    `to_status`        tinyint      NOT NULL DEFAULT 0                  COMMENT '0 = unread, 1 = read, 2 = unread.',
    `date`             timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `title`            varchar(255) NOT NULL,
    `text`             text         NOT NULL,

    CONSTRAINT `accounts_messages_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Messaging system.';

CREATE INDEX `accounts_messages_from_accounts_id_idx` ON `accounts_messages` (`from_accounts_id`);
CREATE INDEX `accounts_messages_to_accounts_id_idx` ON `accounts_messages` (`to_accounts_id`);

-- Initial dump for the `accounts_messages` table.

-- Account's PET table.
--
-- Account's PETs.
--
CREATE TABLE `accounts_pets` (
    `id`                         int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `accounts_id`                int          NOT NULL,
    `levels_id`                  tinyint      NOT NULL DEFAULT 1,
    `name`                       varchar(255) NOT NULL DEFAULT '',
    `experience`                 int          NOT NULL DEFAULT 0,
    `fuel`                       int          NOT NULL DEFAULT 0,
    `health`                     int          NOT NULL DEFAULT 0,
    `slots_lasers_total`         tinyint      NOT NULL,
    `slots_lasers_available`     tinyint      NOT NULL,
    `slots_generators_total`     tinyint      NOT NULL,
    `slots_generators_available` tinyint      NOT NULL,
    `slots_protocols_total`      tinyint      NOT NULL,
    `slots_protocols_available`  tinyint      NOT NULL,
    `slots_gears_total`          tinyint      NOT NULL,
    `slots_gears_available`      tinyint      NOT NULL,

    CONSTRAINT `accounts_pets_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Account''s PETs.';

CREATE  UNIQUE INDEX `accounts_pets_accounts_id_idx` ON `accounts_pets` (`accounts_id`);

-- Initial dump for the `accounts_pets` table.

-- Account's quests table.
--
-- Quest status of the account.
--
CREATE TABLE `accounts_quests` (
    `id`          int       NOT NULL AUTO_INCREMENT             COMMENT 'Primary Key.',
    `quests_id`   smallint  NOT NULL,
    `accounts_id` int       NOT NULL,
    `completed`   boolean   NOT NULL DEFAULT 0                  COMMENT 'Whether the quest has been completed or not.',
    `date`        timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP  COMMENT 'Date when the quest was accepted/completed.',

    CONSTRAINT `accounts_quests_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Quest status of the account.';

CREATE INDEX `accounts_quests_quests_id_idx` ON `accounts_quests` (`quests_id`);
CREATE INDEX `accounts_quests_accounts_id_idx` ON `accounts_quests` (`accounts_id`);

-- Initial dump for the `accounts_quests` table.

-- Account's ranking table.
--
-- Account ranking.
--
CREATE TABLE `accounts_rankings` (
    `id`                  int      NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `accounts_id`         int      NOT NULL                COMMENT 'Account ID.',
    `points`              int      NOT NULL DEFAULT 0      COMMENT 'Points in the ranking.',
    `best_points`         int      NOT NULL DEFAULT 0      COMMENT 'Biggest amount of rank points ever achieved.',
    `destroyed_allies`    smallint NOT NULL DEFAULT 0      COMMENT 'Destroyed allies.',
    `destroyed_phoenix`   smallint NOT NULL DEFAULT 0      COMMENT 'Destroyed phoenix.',
    `destroyed_times`     smallint NOT NULL DEFAULT 0      COMMENT 'Amount of times the account has been destroyed.',
    `destroyed_radiation` smallint NOT NULL DEFAULT 0      COMMENT 'Amount of times the account has been destroyed by the radiation zone.',

    CONSTRAINT `accounts_rankings_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Account ranking.';

CREATE UNIQUE INDEX `accounts_ranking_accounts_id_idx` ON `accounts_rankings` (`accounts_id`);

-- Initial dump for the `accounts_rankings` table.

-- Account's ships table.
--
-- Ships bough by an account.
--
CREATE TABLE `accounts_ships` (
    `id`          int         NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `accounts_id` int         NOT NULL,
    `ships_id`    tinyint     NOT NULL,
    `maps_id`     tinyint     NOT NULL,
    `position`    varchar(15) NOT NULL DEFAULT '0,0'  COMMENT 'Position on map.',
    `health`      int         NOT NULL DEFAULT 0      COMMENT 'Health points.',
    `nanohull`    int         NOT NULL DEFAULT 0      COMMENT 'Nanohull points.',
    `gfx`         tinyint     NOT NULL DEFAULT 0      COMMENT 'Ship graphic (for WIZ-X).',

    CONSTRAINT `accounts_ships_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Ships bough by an account.';

CREATE INDEX `accounts_ships_accounts_id_idx` ON `accounts_ships` (`accounts_id`);
CREATE INDEX `accounts_ships_ships_id_idx` ON `accounts_ships` (`ships_id`);
CREATE INDEX `accounts_ships_maps_id_idx` ON `accounts_ships` (`maps_id`);

-- Initial dump for the `accounts_ships` table.

-- Account's skills table.
--
-- Skilltree for the account.
--
CREATE TABLE `accounts_skills` (
    `id`                  int      NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `accounts_id`         int      NOT NULL                COMMENT 'Account ID.',
    `skilltree_skills_id` tinyint  NOT NULL                COMMENT 'Skill ID.',
    `skilltree_levels_id` smallint NOT NULL                COMMENT 'Skill level.',

    CONSTRAINT `accounts_skills_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Skilltree for the account.';

CREATE INDEX `accounts_skills_accounts_id_idx` ON `accounts_skills` (`accounts_id`);

-- Initial dump for the `accounts_skills` table.

-- Account's skylab table.
--
-- Skylab for the account.
--
CREATE TABLE `accounts_skylabs` (
    `id`                int       NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `accounts_id`       int       NOT NULL                COMMENT 'Account ID.',
    `skylab_modules_id` tinyint   NOT NULL                COMMENT 'Module ID.',
    `levels_id`         tinyint   NOT NULL DEFAULT 1      COMMENT 'Module level.',
    `space`             int       NOT NULL DEFAULT 0      COMMENT 'Used space.',
    `upgrade`           timestamp NULL     DEFAULT NULL   COMMENT 'Date when this module started upgrading.',

    CONSTRAINT `accounts_skylabs_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Skylab for the accounts.';

CREATE INDEX `accounts_skylabs_accounts_id_idx` ON `accounts_skylabs` (`accounts_id`);
CREATE INDEX `accounts_skylabs_skylab_modules_id_idx` ON `accounts_skylabs` (`skylab_modules_id`);

-- Initial dump for the `accounts_skylabs` table.

-- Account's techfactory table.
--
-- Nanotech factory items.
--
CREATE TABLE `accounts_techfactories` (
    `id`                 int     NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `accounts_id`        int     NOT NULL                COMMENT 'Account ID.',
    `slot_unlock_price`  int     NOT NULL DEFAULT 50000  COMMENT 'Price for unlocking a slot.',
    `slot_unlock_factor` tinyint NOT NULL DEFAULT 2      COMMENT 'Factor for unlocking a slot.',
    `slots`              tinyint NOT NULL DEFAULT 1      COMMENT 'Unlocked slots.',

    CONSTRAINT `accounts_techfactory_items_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Nanotech factory items.';

-- Initial dump for the `accounts_techfactories` table

-- Account's techfactory items.
--
-- Techfactory items from account.
--
CREATE TABLE `accounts_techfactory_items` (
    `id`                   int       NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `accounts_id`          int       NOT NULL                COMMENT 'Account ID.',
    `techfactory_items_id` tinyint   NOT NULL                COMMENT 'Item ID.',
    `amount`               smallint  NOT NULL DEFAULT 1      COMMENT 'Amount of build items.',
    `date`                 timestamp NULL     DEFAULT NULL   COMMENT 'Date when the item started building.',

    CONSTRAINT `accounts_techfactory_items_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Techfactory items from account.';

CREATE INDEX `accounts_techfactory_items_accounts_id_idx` ON `accounts_techfactory_items` (`accounts_id`);
CREATE INDEX `accounts_techfactory_items_techfactory_items_id_idx` ON `accounts_techfactory_items` (`techfactory_items_id`);

-- Initial dump for the `accounts_techfactory_items` table.

-- Clan's table.
--
-- Server clans.
--
CREATE TABLE `clans` (
    `id`                 int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `accounts_id`        int          NOT NULL                COMMENT 'Owner ID',
    `factions_id`        tinyint      NULL     DEFAULT NULL   COMMENT 'Clan affiliation faction.',
    `tag`                varchar(4)   NOT NULL DEFAULT ''     COMMENT 'Name abbreviation.',
    `name`               varchar(255) NOT NULL DEFAULT '',
    `description`        text         NOT NULL,
    `logo`               varchar(255) NOT NULL DEFAULT '',
    `status`             tinyint      NOT NULL DEFAULT 0      COMMENT '0 = closed, 1 = recruiting, 2 = lvl10+, 3 = lvl16+, 4 = FE.',

    CONSTRAINT `clans_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Server clans.';

CREATE UNIQUE INDEX `clans_name_idx` ON `clans` (`name`);
CREATE UNIQUE INDEX `clans_tag_idx` ON `clans` (`tag`);
CREATE INDEX `clans_accounts_id_idx` ON `clans` (`accounts_id`);

-- Initial dump for the `clans` table.

-- Clan applications table.
--
-- Account applications to a clan.
--
CREATE TABLE `clans_applications` (
    `id`          int       NOT NULL AUTO_INCREMENT             COMMENT 'Primary Key.',
    `clans_id`    int       NOT NULL                            COMMENT 'Clan ID.',
    `accounts_id` int       NOT NULL                            COMMENT 'Account ID.',
    `date`        timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `text`        text      NOT NULL,

    CONSTRAINT `clans_applications_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Account applications to a clan.';

CREATE INDEX `clans_applications_clans_id_idx` ON `clans_applications` (`clans_id`);
CREATE INDEX `clans_applications_accounts_id_idx` ON `clans_applications` (`accounts_id`);

-- Initial dump for the `clans_applications` table.

-- Clan's banks table.
--
-- Clan's internal bank.
--
CREATE TABLE `clans_banks` (
    `id`          int     NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `clans_id`    int     NOT NULL,
    `credits`     bigint  NOT NULL DEFAULT 0      COMMENT 'Credits available in the bank.',
    `uridium`     bigint  NOT NULL DEFAULT 0      COMMENT 'Uridium available in the bank.',
    `tax_credits` tinyint NOT NULL DEFAULT 5.0    COMMENT 'Tax rate for credits.',
    `tax_uridium` tinyint NOT NULL DEFAULT 0.0    COMMENT 'Tax rate for uridium.',

    CONSTRAINT `clans_banks_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Clan''s internal bank.';

CREATE UNIQUE INDEX `clans_bank_clans_id_idx` ON `clans_banks` (`clans_id`);

-- Initial dump for the `clans_banks` table.

-- Clan's banks logs table.
--
-- Logs from clan's bank.
--
CREATE TABLE `clans_banks_logs` (
    `id`               int       NOT NULL AUTO_INCREMENT             COMMENT 'Primary Key.',
    `clans_banks_id`   int       NOT NULL,
    `from_accounts_id` int       NOT NULL                            COMMENT 'Account that made the log.',
    `to_accounts_id`   int       NOT NULL,
    `date`             timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `type`             tinyint   NOT NULL DEFAULT 1                  COMMENT 'Log type. 1 = withdraw, 2 = deposit, 3 = donation.',
    `amount`           int       NOT NULL DEFAULT 0                  COMMENT 'Amount of currency logged.',
    `currency`         tinyint   NOT NULL DEFAULT 1                  COMMENT 'Currency of the amount. 1 = credits, 2 = uridium.',

    CONSTRAINT `clans_banks_logs_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Logs from clan''s bank.';

CREATE INDEX `clans_banks_logs_clans_banks_id_idx` ON `clans_banks_logs` (`clans_banks_id`);
CREATE INDEX `clans_banks_logs_from_accounts_id_idx` ON `clans_banks_logs` (`from_accounts_id`);
CREATE INDEX `clans_banks_logs_to_accounts_id_idx` ON `clans_banks_logs` (`to_accounts_id`);

-- Initial dump for the `clans_banks_logs` table.

-- Clan battle stations table.
--
-- Clan CBS.
--
CREATE TABLE `clans_battlestations` (
    `id`       tinyint      NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `clans_id` int          NULL     DEFAULT NULL   COMMENT 'Owner of the CBS.',
    `maps_id`  tinyint      NOT NULL                COMMENT 'Map of the CBS.',
    `name`     varchar(255) NOT NULL DEFAULT '',
    `position` varchar(15)  NOT NULL DEFAULT '0,0'  COMMENT 'Position on map.',
    `date`     timestamp    NULL     DEFAULT NULL   COMMENT 'Date when the CBS was build.',

    CONSTRAINT `clans_battlestations_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Clan CBS.';

CREATE INDEX `clans_battlestations_clans_id_idx` ON `clans_battlestations` (`clans_id`);
CREATE INDEX `clans_battlestations_maps_id_idx` ON `clans_battlestations` (`maps_id`);

-- Initial dump for the `clans_battlestations` table.

INSERT INTO `clans_battlestations`(`id`, `name`, `maps_id`, `position`) VALUES
(1,  'Aries',   3,  point(10500, 2500)),
(2,  'Balzar',  4,  point(4400, 9000)),
(3,  'Fornax',  7,  point(10500, 2500)),
(4,  'Gemini',  8,  point(16200, 8500)),
(5,  'Keppler', 11, point(10500, 2500)),
(6,  'Lynx',    12, point(4400, 9000)),
(7,  'Volan',   13, point(10000, 5500)),
(8,  'Wican',   14, point(11500, 6000)),
(9,  'Xenitor', 15, point(8750, 6000)),
(10, 'Yukian',  16, point(9000, 6000)),
(11, 'Cetus',   17, point(17200, 2500)),
(12, 'Equlus',  18, point(10000, 7200)),
(13, 'Draco',   19, point(10000, 6200)),
(14, 'Hydra',   21, point(10500, 9000)),
(15, 'Indus',   22, point(8800, 6400)),
(16, 'Julius',  23, point(10500, 5800)),
(17, 'Mensa',   25, point(10700, 9000)),
(18, 'Nashira', 26, point(9800, 8200)),
(19, 'Orion',   27, point(10500, 4600)),
(20, 'Zerpan',  29, point(12000, 5600));

-- Clan battlestations' items table.
--
-- Items equipped in the CBS.
--
CREATE TABLE `clans_battlestations_items` (
    `id`                      int       NOT NULL AUTO_INCREMENT            COMMENT 'Primary Key.',
    `clans_battlestations_id` tinyint   NOT NULL                           COMMENT 'CBS where item is equipped.',
    `accounts_items_id`       int       NOT NULL                           COMMENT 'Equipped item.',
    `slot`                    tinyint   NOT NULL DEFAULT 1                 COMMENT 'Position where the item is equipped (A = 9, B = 10).',
    `date`                    timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date when the item was equipped.',

    CONSTRAINT `clans_battlestations_items_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Items equipped in the CBS.';

CREATE INDEX `clans_battlestations_items_clans_battlestations_id_idx` ON `clans_battlestations_items` (`clans_battlestations_id`);
CREATE INDEX `clans_battlestations_items_accounts_items_id_idx` ON `clans_battlestations_items` (`accounts_items_id`);

-- Initial dump for the `clans_battlestations_items` table.

-- Clan's battlestations logs table.
--
-- Logs from clan's battlestations.
--
CREATE TABLE `clans_battlestations_logs` (
    `id`                      int       NOT NULL AUTO_INCREMENT             COMMENT 'Primary Key.',
    `clans_id`                int       NOT NULL,
    `clans_battlestations_id` tinyint   NOT NULL,
    `message`                 text      NOT NULL,
    `date`                    timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT `clans_battlestations_logs_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Logs from clan''s battlestations.';

CREATE INDEX `clans_battlestations_logs_clans_battlestations_id_idx` ON `clans_battlestations_logs` (`clans_battlestations_id`);
CREATE INDEX `clans_battlestations_logs_clans_id_idx` ON `clans_battlestations_logs` (`clans_id`);

-- Initial dump for the `clans_battlestations_logs` table.

-- Clan's diplomacies table.
--
-- Diplomacy table for clans.
--
CREATE TABLE `clans_diplomacies` (
    `id`            int       NOT NULL AUTO_INCREMENT            COMMENT 'Primary Key.',
    `from_clans_id` int       NOT NULL                           COMMENT 'Clan that made the request.',
    `to_clans_id`   int       NOT NULL                           COMMENT 'Clan that receives the request.',
    `date`          timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Diplomacy creation date.',
    `expires`       timestamp NULL     DEFAULT NULL              COMMENT 'Date when the diplomacy expires.',
    `status`        tinyint   NOT NULL DEFAULT 0                 COMMENT 'Status of the diplomacy. 0 = not accepted, 1 = accepted, 2 = rejected, 3 = over.',
    `type`          tinyint   NOT NULL DEFAULT 1                 COMMENT 'Diplomacy type. 1 = War, 2 = NAP, 3 = Alliance.',

    CONSTRAINT `clans_diplomacies_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Diplomacy table for clans.';

CREATE INDEX `clans_diplomacies_from_clans_id_idx` ON `clans_diplomacies` (`from_clans_id`);
CREATE INDEX `clans_diplomacies_to_clans_id_idx` ON `clans_diplomacies` (`to_clans_id`);

-- Initial dump for the `clans_diplomacies` table.trad

-- Clan messages table.
--
-- Messages in the clan.
--
CREATE TABLE `clans_messages` (
    `id`               int          NOT NULL AUTO_INCREMENT             COMMENT 'Primary Key.',
    `clans_id`         int          NOT NULL                            COMMENT 'Clan where the message was created',
    `from_accounts_id` int          NOT NULL                            COMMENT 'Author of the message.',
    `to_accounts_id`   int          NULL     DEFAULT NULL               COMMENT 'Destination of the message, if null, everyone',
    `subject`          varchar(255) NOT NULL DEFAULT '',
    `text`             text         NOT NULL,
    `date`             timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT `clans_messages` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Messages in the clan.';

CREATE INDEX `clans_messages_clans_id_idx` ON `clans_messages` (`clans_id`);
CREATE INDEX `clans_messages_from_accounts_id_idx` ON `clans_messages` (`from_accounts_id`);
CREATE INDEX `clans_messages_to_accounts_id_idx` ON `clans_messages` (`to_accounts_id`);

-- Initial dump for the `clans_messages` table

-- Clan's news table.
--
-- News of the clan.
--
CREATE TABLE `clans_news` (
    `id`          int       NOT NULL AUTO_INCREMENT            COMMENT 'Primary Key.',
    `accounts_id` int       NOT NULL                           COMMENT 'Author.',
    `clans_id`    int       NOT NULL,
    `date`        timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation date.',
    `text`        text      NOT NULL                           COMMENT 'News content.',

    CONSTRAINT `clans_news_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'News of the clan.';

CREATE INDEX `clans_news_accounts_id_idx` ON `clans_news` (`accounts_id`);
CREATE INDEX `clans_news_clans_id_idx` ON `clans_news` (`clans_id`);

-- Initial dump for the `clans_news` table.

-- Clan's ranking table.
--
-- Clan ranking.
--
CREATE TABLE `clans_ranking` (
    `id`          int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `clans_id`    int NOT NULL                COMMENT 'Clan ID.',
    `points`      int NOT NULL DEFAULT 0      COMMENT 'Points in the ranking.',
    `best_points` int NOT NULL DEFAULT 0      COMMENT 'Biggest amount of rank points ever achieved.',

    CONSTRAINT `clans_ranking_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Clan ranking.';

CREATE UNIQUE INDEX `clans_ranking_accounts_id_idx` ON `clans_ranking` (`clans_id`);

-- Initial dump for the `clans_ranking` table.

-- Clan's roles table.
--
-- Clan's permissions roles.
--
CREATE TABLE `clans_roles` (
    `id`             int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `name`           varchar(255) NOT NULL,
    `clans_id`       int          NOT NULL,
    `clans_roles_id` int          NULL     DEFAULT NULL   COMMENT 'Parent role.',
    `priority`       tinyint      NOT NULL DEFAULT 1,

    CONSTRAINT `clans_roles_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Clan''s roles.';

CREATE INDEX `clans_roles_clans_id_idx` ON `clans_roles` (`clans_id`);
CREATE INDEX `clans_roles_name_idx` ON `clans_roles` (`name`);

-- Initial dump for the `clans_roles` table.

-- Clan roles' permissions.
--
-- Clan roles' permissions
--
CREATE TABLE `clans_roles_permissions` (
    `id`             int     NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `clans_roles_id` int     NOT NULL,
    `permissions_id` tinyint NOT NULL,
    `enabled`        boolean NULL     DEFAULT NULL   COMMENT 'Enabled value, null = inherited',

    CONSTRAINT `clans_roles_permissions` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Clan roles'' permissions';

CREATE INDEX `clans_roles_permissions_clans_roles_id_idx` ON `clans_roles_permissions` (`clans_roles_id`);
CREATE INDEX `clans_roles_permissions_permissions_id_idx` ON `clans_roles_permissions` (`permissions_id`);

-- Initial dump for the `clans_roles_permissions` table.

-- Collectables table.
--
-- Map collectables.
--
CREATE TABLE `collectables` (
    `id`      tinyint      NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `gfx`     tinyint      NOT NULL DEFAULT 0,
    `type`    tinyint      NOT NULL DEFAULT 0      COMMENT '0 = box, 1 = ore, 2 = beacon, 3 = firework',
    `name`    varchar(255) NOT NULL DEFAULT '',

    CONSTRAINT `collectables_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Map collectables.';

-- Initial dump for the `collectables` table.

INSERT INTO `collectables` (`id`, `gfx`, `type`, `name`) VALUES
(1,   0,   0, 'box0'),
(2,   1,   0, 'box1'),
(3,   2,   0, 'box2'),
(4,   3,   0, 'easterEgg'),
(5,   5,   0, 'bigPumpkin'),
(6,   6,   0, 'orangePumpkin'),
(7,   7,   0, 'turkey'),
(8,   8,   0, 'bigXmasStar'),
(9,   9,   0, 'stdXmasStar'),
(10,  10,  0, 'flower_mothersday'),
(11,  11,  0, 'theItalianBox'),
(12,  14,  0, 'crestAndStar'),
(13,  15,  0, 'polishBonusBox'),
(14,  16,  0, 'winterGiftBox'),
(15,  17,  0, 'carnival_box'),
(16,  19,  0, 'bonusBoxSun'),
(17,  20,  0, 'petWeekBox'),
(18,  21,  0, 'pirateBootyBox'),
(19,  22,  0, 'pirateBootyGoldBox'),
(20,  23,  0, 'hungarianRevolutionBox'),
(21,  24,  0, 'stpatricksDayBox'),
(22,  25,  0, 'titanicBonusBox'),
(23,  26,  0, 'brazilBonusBox'),
(24,  27,  0, 'victoryFrBonusBox'),
(25,  28,  0, 'victoryRuBonusBox'),
(26,  29,  0, 'victoryCzBonusBox'),
(27,  30,  0, 'boxStar'),
(28,  31,  0, 'pirateBootyRedBox'),
(29,  32,  0, 'pirateBootyBlueBox'),
(30,  33,  0, 'victoryFrBonusBox'),
(31,  34,  0, 'mexicanBonusBox'),
(32,  35,  0, 'boxAntec'),
(33,  36,  0, 'germanUnificationDayBox'),
(34,  37,  0, 'hispanicDayBox'),
(35,  38,  0, 'candyBox'),
(36,  39,  0, 'birthdayBox'),
(37,  40,  0, 'treasureChest'),
(38,  41,  0, 'fathersDayBox'),
(39,  42,  0, 'summerEventBox'),
(40,  43,  0, 'silverBootyBox'),
(41,  44,  0, 'britishBox'),
(42,  45,  0, 'football_box'),
(43,  46,  0, 'demanerTransporterBootyBox'),
(44,  47,  0, 'icyBox'),
(45,  0,   1, 'oreRed'),
(46,  1,   1, 'oreBlue'),
(47,  2,   1, 'oreYellow'),
(48,  8,   1, 'ore_palladium'),
(49,  112, 2, 'beacon_1_2'),
(50,  113, 2, 'beacon_1_3'),
(51,  121, 2, 'beacon_2_1'),
(52,  123, 2, 'beacon_2_3'),
(53,  131, 2, 'beacon_3_1'),
(54,  132, 2, 'beacon_3_2'),
(55,  212, 2, 'beacon_1_2'),
(56,  213, 2, 'beacon_1_3'),
(57,  221, 2, 'beacon_2_1'),
(58,  223, 2, 'beacon_2_3'),
(59,  231, 2, 'beacon_3_1'),
(60,  232, 2, 'beacon_3_2'),
(61,  31,  3, 'fireworks_box'),
(62,  32,  3, 'fireworks_box'),
(63,  33,  3, 'fireworks_box'),
(64,  34,  3, 'fireworks_box'),
(65,  35,  3, 'fireworks_box'),
(66,  36,  3, 'fireworks_box'),
(67,  121, 3, 'fireworks_box'),
(68,  122, 3, 'fireworks_box'),
(69,  123, 3, 'fireworks_box'),
(70,  131, 3, 'fireworks_box'),
(71,  132, 3, 'fireworks_box'),
(72,  133, 3, 'fireworks_box'),
(73,  211, 3, 'fireworks_box'),
(74,  212, 3, 'fireworks_box'),
(75,  213, 3, 'fireworks_box'),
(76,  221, 3, 'fireworks_box'),
(77,  222, 3, 'fireworks_box'),
(78,  223, 3, 'fireworks_box'),
(79,  231, 3, 'fireworks_box'),
(80,  232, 3, 'fireworks_box'),
(81,  233, 3, 'fireworks_box'),
(82,  311, 3, 'fireworks_box'),
(83,  312, 3, 'fireworks_box'),
(84,  313, 3, 'fireworks_box'),
(85,  321, 3, 'fireworks_box'),
(86,  322, 3, 'fireworks_box'),
(87,  323, 3, 'fireworks_box'),
(88,  331, 3, 'fireworks_box'),
(89,  332, 3, 'fireworks_box'),
(90,  333, 3, 'fireworks_box'),
(91,  411, 3, 'fireworks_box'),
(92,  412, 3, 'fireworks_box'),
(93,  413, 3, 'fireworks_box'),
(94,  421, 3, 'fireworks_box'),
(95,  422, 3, 'fireworks_box'),
(96,  423, 3, 'fireworks_box'),
(97,  431, 3, 'fireworks_box'),
(98,  432, 3, 'fireworks_box'),
(99,  433, 3, 'fireworks_box'),
(100, 511, 3, 'fireworks_box'),
(101, 512, 3, 'fireworks_box'),
(102, 513, 3, 'fireworks_box'),
(103, 521, 3, 'fireworks_box'),
(104, 522, 3, 'fireworks_box'),
(105, 523, 3, 'fireworks_box'),
(106, 531, 3, 'fireworks_box'),
(107, 532, 3, 'fireworks_box'),
(108, 533, 3, 'fireworks_box'),
(109, 601, 3, 'fireworks_box'),
(110, 602, 3, 'fireworks_box'),
(111, 603, 3, 'fireworks_box');

-- Events table.
--
-- Contains server's events.
--
CREATE TABLE `events` (
    `id`                 int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `name`               varchar(255) NOT NULL DEFAULT '',
    `description`        text         NOT NULL,
    `start_date`         timestamp    NULL     DEFAULT NULL   COMMENT 'Event start date.',
    `end_date`           timestamp    NULL     DEFAULT NULL   COMMENT 'Event end date.',

    CONSTRAINT `events_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Contains server''s events.';

-- Initial dump for the `events` table.
--

-- Factions table.
--
-- Contains server's factions.
--
CREATE TABLE `factions` (
    `id`                 tinyint      NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `name`               varchar(255) NOT NULL DEFAULT '',
    `tag`                varchar(3)   NOT NULL DEFAULT ''     COMMENT 'Name abbreviation.',
    `description`        text         NOT NULL,
    `is_public`          boolean      NOT NULL DEFAULT 1,
    `low_maps_id`        tinyint      NOT NULL,
    `low_maps_position`  varchar(15)  NOT NULL DEFAULT '0,0'  COMMENT 'Starting position on map.',
    `high_maps_id`       tinyint      NOT NULL,
    `high_maps_position` varchar(15)  NOT NULL DEFAULT '0,0'  COMMENT 'Starting position on map.',

    CONSTRAINT `factions_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Contains server''s factions.';

CREATE UNIQUE INDEX `factions_name_idx` ON `factions` (`name`);
CREATE UNIQUE INDEX `factions_tag_idx` ON `factions` (`tag`);

-- Initial dump for the `factions` table.
--
INSERT INTO `factions` (`id`, `name`, `tag`, `is_public`, `description`, `low_maps_id`, `low_maps_position`, `high_maps_id`, `high_maps_position`) VALUES
(1, 'Mars Mining Operations',        'mmo', 1, 'I''m not going to blow smoke up your tush, so I''ll just get straight to the point. We at Mars Mining Operations want you for two reasons: to mine ore and to eradicate all alien scum infecting our galactic sector. Do this successfully and you''ll soon be popping rival pilots for thrills and honor!',                                            1,  '1000,1000',  20, '1000,6000'),
(2, 'Earth Industries Corporations', 'eic', 1, 'Pilot, these are trying times during which only those made of the purest inner steel can prevail! How tough is your mettle? We reward loyalty and impeccable manners with the best lasers Uridium can buy. Join us in the fight to cleanse our sector of all those cretins that stand in our way. For glory and privilege!',                            5,  '19000,1000', 24, '10700,1000'),
(3, 'Venus Resources Unlimited',     'vru', 1, 'We pride ourselves in our ability to push the envelope of technological advancement, while retaining a communal atmosphere. Some call us a cult desiring galactic domination, but they simply misunderstand our brilliant recruitment methods. We are always looking for talented pilots to help us destroy our enemies and shape humanity''s future!', 9,  '19000,1300', 28, '19000,6000'),
(4, 'Admins and Mods',               'aam', 0, 'Secret faction for Admins and Mods >:)',                                                                                                                                                                                                                                                                                                                92, '1000,1000',  92, '1000,1000');

-- GalaxyGates table.
--
-- Galaxy gates from the server.
--
CREATE TABLE `galaxygates` (
    `id`                   tinyint      NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `name`                 varchar(255) NOT NULL DEFAULT 'GG-A',
    `galaxygates_waves_id` tinyint      NULL     DEFAULT NULL   COMMENT 'Starting wave.',
    `parts`                tinyint      NOT NULL DEFAULT 0      COMMENT 'Necessary parts to build the gate.',

    CONSTRAINT `galaxygates_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Galaxy gates from the server.';

-- Initial dump for the `galaxygates` table.

INSERT INTO `galaxygates` (`id`, `name`, `galaxygates_waves_id`, `parts`) VALUES
(1,  'Alpha',   NULL, 34),
(2,  'Beta',    NULL, 48),
(3,  'Gamma',   NULL, 82),
(4,  'Delta',   NULL, 128),
(5,  'Epsilon', NULL, 99),
(6,  'Zeta',    NULL, 111),
(7,  'Kappa',   NULL, 120),
(8,  'Lambda',  NULL, 45),
(13, 'Hades',   NULL, 45),
(19, 'Kuiper',  NULL, 100);

-- GalaxyGates to GGSpins table.
--
-- Many to many relations for galaxygates and galaxygates_spins.
--
CREATE TABLE `galaxygates_gg_spins` (
    `id`                   smallint NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `galaxygates_id`       tinyint  NOT NULL,
    `galaxygates_spins_id` tinyint  NOT NULL,

    CONSTRAINT `galaxygates_gg_spins_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Many to many relations for galaxygates and galaxygates_spins.';

CREATE INDEX `galaxygates_gg_spins_galaxygates_id_idx` ON `galaxygates_gg_spins` (`galaxygates_id`);
CREATE INDEX `galaxygates_gg_spins_galaxygates_spins_id_idx` ON `galaxygates_gg_spins` (`galaxygates_spins_id`);

-- Initial dump for the `galaxygates_gg_spins` table.

INSERT INTO `galaxygates_gg_spins` (`id`, `galaxygates_id`, `galaxygates_spins_id`) VALUES
(1,   1,  1),
(2,   1,  2),
(3,   1,  3),
(4,   1,  4),
(5,   1,  5),
(6,   1,  6),
(7,   1,  7),
(8,   1,  8),
(9,   1,  9),
(10,  1,  10),
(11,  1,  11),
(12,  1,  12),
(13,  1,  13),
(14,  1,  14),
(15,  1,  15),
(16,  2,  1),
(17,  2,  2),
(18,  2,  3),
(19,  2,  4),
(20,  2,  5),
(21,  2,  6),
(22,  2,  7),
(23,  2,  8),
(24,  2,  9),
(25,  2,  10),
(26,  2,  11),
(27,  2,  12),
(28,  2,  13),
(29,  2,  14),
(30,  2,  15),
(31,  3,  1),
(32,  3,  2),
(33,  3,  3),
(34,  3,  4),
(35,  3,  5),
(36,  3,  6),
(37,  3,  7),
(38,  3,  8),
(39,  3,  9),
(40,  3,  10),
(41,  3,  11),
(42,  3,  12),
(43,  3,  13),
(44,  3,  14),
(45,  3,  15),
(46,  4,  1),
(47,  4,  2),
(48,  4,  3),
(49,  4,  4),
(50,  4,  5),
(51,  4,  6),
(52,  4,  7),
(53,  4,  8),
(54,  4,  9),
(55,  4,  10),
(56,  4,  11),
(57,  4,  12),
(58,  4,  13),
(59,  4,  14),
(60,  4,  15),
(61,  5,  1),
(62,  5,  2),
(63,  5,  3),
(64,  5,  4),
(65,  5,  6),
(66,  5,  7),
(67,  5,  8),
(68,  5,  9),
(69,  5,  10),
(70,  5,  11),
(71,  5,  12),
(72,  5,  13),
(73,  5,  14),
(74,  5,  15),
(75,  6,  1),
(76,  6,  2),
(77,  6,  3),
(78,  6,  4),
(79,  6,  5),
(80,  6,  6),
(81,  6,  7),
(82,  6,  8),
(83,  6,  9),
(84,  6,  10),
(85,  6,  11),
(86,  6,  12),
(87,  6,  13),
(88,  6,  14),
(89,  6,  15),
(90,  7,  1),
(91,  7,  2),
(92,  7,  3),
(93,  7,  4),
(94,  7,  5),
(95,  7,  6),
(96,  7,  7),
(97,  7,  8),
(98,  7,  9),
(99,  7,  10),
(100, 7,  11),
(101, 7,  12),
(102, 7,  13),
(103, 7,  14),
(104, 7,  15),
(105, 8,  1),
(106, 8,  2),
(107, 8,  3),
(108, 8,  4),
(109, 8,  5),
(110, 8,  6),
(111, 8,  7),
(112, 8,  8),
(113, 8,  9),
(114, 8,  10),
(115, 8,  11),
(116, 8,  12),
(117, 8,  13),
(118, 8,  14),
(119, 8,  15),
(120, 13, 1),
(121, 13, 2),
(122, 13, 3),
(123, 13, 4),
(124, 13, 5),
(125, 13, 6),
(126, 13, 7),
(127, 13, 8),
(128, 13, 9),
(129, 13, 10),
(130, 13, 11),
(131, 13, 12),
(132, 13, 13),
(133, 13, 14),
(134, 13, 15),
(135, 19, 1),
(136, 19, 2),
(137, 19, 3),
(138, 19, 4),
(139, 19, 5),
(140, 19, 6),
(141, 19, 7),
(142, 19, 8),
(143, 19, 9),
(144, 19, 10),
(145, 19, 11),
(146, 19, 12),
(147, 19, 13),
(148, 1,  16),
(149, 1,  17),
(150, 1,  18),
(151, 1,  19),
(152, 1,  20),
(153, 1,  21),
(154, 1,  22),
(155, 1,  23),
(156, 2,  16),
(157, 2,  17),
(158, 2,  18),
(159, 2,  19),
(160, 2,  20),
(161, 2,  21),
(162, 2,  22),
(163, 2,  23),
(164, 3,  16),
(165, 3,  17),
(166, 3,  18),
(167, 3,  19),
(168, 3,  20),
(169, 3,  21),
(170, 3,  22),
(171, 3,  23),
(172, 4,  16),
(173, 4,  17),
(174, 4,  18),
(175, 4,  19),
(176, 4,  20),
(177, 4,  21),
(178, 4,  22),
(179, 4,  23),
(180, 5,  16),
(181, 5,  17),
(182, 5,  18),
(183, 5,  19),
(184, 5,  20),
(185, 5,  21),
(186, 6,  22),
(187, 5,  23),
(188, 6,  16),
(189, 6,  17),
(190, 6,  18),
(191, 6,  19),
(192, 6,  20),
(193, 6,  21),
(194, 6,  22),
(195, 6,  23),
(196, 7,  16),
(197, 7,  17),
(198, 7,  18),
(199, 7,  19),
(200, 7,  20),
(201, 7,  21),
(202, 7,  22),
(203, 7,  23),
(204, 8,  16),
(205, 8,  17),
(206, 8,  18),
(207, 8,  19),
(208, 8,  20),
(209, 8,  21),
(210, 8,  22),
(211, 8,  23),
(212, 13, 16),
(213, 13, 17),
(214, 13, 18),
(215, 13, 19),
(216, 13, 20),
(217, 13, 21),
(218, 13, 22),
(219, 13, 23),
(220, 19, 16),
(221, 19, 17),
(222, 19, 18),
(223, 19, 19),
(224, 19, 20),
(225, 19, 21),
(226, 19, 22),
(227, 19, 23),
(228, 1,  24),
(229, 1,  25),
(230, 1,  26),
(231, 2,  24),
(232, 2,  25),
(233, 2,  26),
(234, 3,  24),
(235, 3,  25),
(236, 3,  26),
(237, 4,  27),
(238, 5,  28),
(239, 6,  29),
(240, 7,  30),
(241, 8,  31),
(242, 13, 32),
(243, 19, 33);

-- GalaxyGates to Waves table.
--
-- Many to many relations for galaxygates and galaxygates_waves.
--
CREATE TABLE `galaxygates_gg_waves` (
    `id`                   smallint NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `galaxygates_id`       tinyint  NOT NULL,
    `galaxygates_waves_id` tinyint  NOT NULL,

    CONSTRAINT `galaxygates_gg_waves_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Many to many relations for galaxygates and galaxygates_waves.';

CREATE INDEX `galaxygates_gg_waves_galaxygates_id_idx` ON `galaxygates_gg_waves` (`galaxygates_id`);
CREATE INDEX `galaxygates_gg_waves_galaxygates_waves_id_idx` ON `galaxygates_gg_waves` (`galaxygates_waves_id`);

-- Initial dump for the `galaxygates_gg_waves` table.

-- GalaxyGates probabilities table.
--
-- Spin probabilities for the galaxy gates.
--
CREATE TABLE `galaxygates_probabilities` (
    `id`             tinyint NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `galaxygates_id` tinyint NOT NULL                COMMENT 'The galaxy gate.',
    `type`           tinyint NOT NULL DEFAULT 0      COMMENT '1 = ammo, 2 = resource, 3 = voucher, 4 = logfile, 5 = part, 6 = special.',
    `probability`    float   NOT NULL DEFAULT 100.00 COMMENT 'Probability of awarding one spin of this type.',

    CONSTRAINT `galaxygates_probabilities_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Spin probabilities for the galaxy gates.';

-- Initial dump for the `galaxygates_probabilities` table.

INSERT INTO `galaxygates_probabilities` (`id`, `galaxygates_id`, `type`, `probability`) VALUES
(1,  1,  1, 67.00),
(2,  1,  2, 12.00),
(3,  1,  3, 3.00),
(4,  1,  4, 1.00),
(5,  1,  5, 13.00),
(6,  1,  6, 4.00),
(7,  2,  1, 67.00),
(8,  2,  2, 12.00),
(9,  2,  3, 3.00),
(10, 2,  4, 1.00),
(11, 2,  5, 13.00),
(12, 2,  6, 4.00),
(13, 3,  1, 67.00),
(14, 3,  2, 12.00),
(15, 3,  3, 3.00),
(16, 3,  4, 1.00),
(17, 3,  5, 13.00),
(18, 3,  6, 4.00),
(19, 4,  1, 67.00),
(20, 4,  2, 12.00),
(21, 4,  3, 3.00),
(22, 4,  4, 1.00),
(23, 4,  5, 13.00),
(24, 4,  6, 4.00),
(25, 5,  1, 67.00),
(26, 5,  2, 12.00),
(27, 5,  3, 3.00),
(28, 5,  4, 1.00),
(29, 5,  5, 13.00),
(30, 5,  6, 4.00),
(31, 6,  1, 67.00),
(32, 6,  2, 12.00),
(33, 6,  3, 3.00),
(34, 6,  4, 1.00),
(35, 6,  5, 13.00),
(36, 6,  6, 4.00),
(37, 7,  1, 67.00),
(38, 7,  2, 12.00),
(39, 7,  3, 3.00),
(40, 7,  4, 1.00),
(41, 7,  5, 13.00),
(42, 7,  6, 4.00),
(43, 8,  1, 67.00),
(44, 8,  2, 12.00),
(45, 8,  3, 3.00),
(46, 8,  4, 1.00),
(47, 8,  5, 13.00),
(48, 8,  6, 4.00),
(49, 13, 1, 67.00),
(50, 13, 2, 12.00),
(51, 13, 3, 3.00),
(52, 13, 4, 1.00),
(53, 13, 5, 13.00),
(54, 13, 6, 4.00),
(55, 19, 1, 67.00),
(56, 19, 2, 12.00),
(57, 19, 3, 3.00),
(58, 19, 4, 1.00),
(59, 19, 5, 13.00),
(60, 19, 6, 4.00);
-- GalaxyGate's wave spawn table.
--
-- Stage spawn for each stage.
--
CREATE TABLE `galaxygates_spawns` (
    `id`      int     NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `npcs_id` tinyint NOT NULL                COMMENT 'NPC to spawn.',
    `amount`  tinyint NOT NULL DEFAULT 20     COMMENT 'Amount of NPCs to spawn.',

    CONSTRAINT `galaxygates_spawns_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Stage spawn for each stage.';

CREATE INDEX `galaxygates_spawns_npcs_id_idx` ON `galaxygates_spawns` (`npcs_id`);

-- Initial dump for the `galaxygates_spawns` table.

-- GalaxyGate's spins table.
--
-- Spins from the galaxy gate.
--
CREATE TABLE `galaxygates_spins` (
    `id`          tinyint  NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `type`        tinyint  NOT NULL DEFAULT 1      COMMENT 'Type from `galaxygates_probabilities`',
    `probability` float    NOT NULL DEFAULT '0.0',
    `items_id`    smallint NOT NULL,
    `amount`      smallint NOT NULL DEFAULT 1,

    CONSTRAINT `galaxygates_spins_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Spins from the galaxy gate.';

CREATE INDEX `galaxygates_spins_items_id_idx` ON `galaxygates_spins` (`items_id`);

-- Initial dump for the `galaxygates_spins` table.

INSERT INTO `galaxygates_spins` (`id`, `type`, `probability`, `items_id`, `amount`) VALUES
(1,  1, 6.66,   60,  200),
(2,  1, 6.66,   60,  240),
(3,  1, 6.66,   60,  280),
(4,  1, 6.66,   61,  180),
(5,  1, 6.66,   61,  200),
(6,  1, 6.66,   61,  240),
(7,  1, 6.66,   63,  200),
(8,  1, 6.66,   63,  220),
(9,  1, 6.66,   63,  240),
(10, 1, 6.66,   64,  80),
(11, 1, 6.66,   64,  100),
(12, 1, 6.66,   64,  120),
(13, 1, 6.66,   84,  100),
(14, 1, 6.66,   84,  120),
(15, 1, 6.66,   65,  100),
(16, 2, 33.33,  241, 60),
(17, 2, 33.33,  241, 80),
(18, 2, 33.33,  241, 100),
(19, 3, 50.00,  7,   1),
(20, 3, 50.00,  7,   2),
(21, 4, 99.99,  229, 1),
(22, 4, 0.01,   229, 100),
(23, 6, 100.00, 1,   30000),
(24, 5, 33.33,  282, 1),
(25, 5, 33.33,  283, 1),
(26, 5, 33.33,  284, 1),
(27, 5, 100.00, 285, 1),
(28, 5, 100.00, 286, 1),
(29, 5, 100.00, 287, 1),
(30, 5, 100.00, 288, 1),
(31, 5, 100.00, 289, 1),
(32, 5, 100.00, 290, 1),
(33, 5, 100.00, 291, 1);

-- GalaxyGate's wave stage table.
--
-- Spawn stage for each wave.
--
CREATE TABLE `galaxygates_stages` (
    `id`                   int     NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `galaxygates_waves_id` tinyint NOT NULL                COMMENT 'Wave this stage belongs to',
    `comment`              text    NULL DEFAULT NULL       COMMENT 'Just so this isn''t that empty',

    CONSTRAINT `galaxygates_stages_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Spawn stage for each wave.';

CREATE INDEX `galaxygates_stages_galaxygates_waves_id_idx` ON `galaxygates_stages` (`galaxygates_waves_id`);

-- Initial dump for the `galaxygates_stages` table.

-- Stages to Spawns table.
--
-- Many to many relations for galaxygates_stages and galaxygates_spawns.
--
CREATE TABLE `galaxygates_stages_spawns` (
    `id`                    int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `galaxygates_stages_id` int NOT NULL,
    `galaxygates_spawns_id` int NOT NULL,

    CONSTRAINT `galaxygates_stages_spawns_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Many to many relations for galaxygates_stages and galaxygates_spawns.';

CREATE INDEX `galaxygates_stages_spawns_galaxygates_stages_id_idx` ON `galaxygates_stages_spawns` (`galaxygates_stages_id`);
CREATE INDEX `galaxygates_stages_spawns_galaxygates_spawns_id_idx` ON `galaxygates_stages_spawns` (`galaxygates_spawns_id`);

-- Initial dump for the `galaxygates_stages_spawns` table.

-- GalaxyGate's waves table.
--
-- Waves of the galaxy gate.
--
CREATE TABLE `galaxygates_waves` (
    `id`      tinyint NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `maps_id` tinyint NOT NULL                COMMENT 'Map',
    `seconds` tinyint NOT NULL DEFAULT 120    COMMENT 'Seconds to wait between stages',
    `npcs`    tinyint NOT NULL DEFAULT 5      COMMENT 'NPCS that the user must destroy to spawn next stage',

    CONSTRAINT `galaxygates_waves_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Waves of the galaxy gate.';

CREATE INDEX `galaxygates_waves_maps_id_idx` ON `galaxygates_waves` (`maps_id`);

-- Initial dump for the `galaxygates_waves` table.

-- Invitation codes table.
--
-- Contains the invitation codes that can be used for registering.
--
CREATE TABLE `invitation_codes` (
    `id`    smallint      NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `code`  varchar(255)  NOT NULL DEFAULT ''     COMMENT 'The invitation code.',
    `limit` tinyint       NOT NULL DEFAULT 1      COMMENT 'Amount of times the code can be used.',

    CONSTRAINT `invitation_codes_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Contains the invitation codes that can be used for registering.';

CREATE UNIQUE INDEX `invitation_codes_id_idx` ON `invitation_codes` (`id`);
CREATE UNIQUE INDEX `invitation_codes_code_idx` ON `invitation_codes` (`code`);

-- Initial dump for the `invitation_codes` table.

INSERT INTO `invitation_codes` (`id`, `code`, `limit`) VALUES
(1, '17089696161f8472c048f7f4a487d0a2', 0),
(2, 'f72aa5fc72637779fd8ba6eb743d4c13', 0),
(3, '48d14197e7e4187d2fc48a882d317150', 0),
(4, 'f584c93cc6229b727edd06799678bd81', 0),
(5, '18ce906ebe5fc8ede7feebe246100a22', 0),
(6, 'a077db443c615db3d42c5c9fd9d4b43e', 0),
(7, 'c78a93e4d3b4c77ef7bd88baee56668b', 0),
(8, 'e176699a757cf615f54920ff105434d6', 0),
(9, '1f25bdf935850e92a731cff2cf98e8a0', 0),
(10, '2cb45d6c1ac652e186849f0f2ef671c1', 0),
(11, 'a1b190fba785c84caad053700d9013f6', 0),
(12, 'a5301b862bc19bcf0214a3fe17ec7733', 0),
(13, '4bc6c7a0fe7737a55e3d1f42de9d9397', 0),
(14, '51634dbc5db11f7a578947b6eafec886', 0),
(15, 'b9a8ae84016cbb6c269b88a837b5c065', 0),
(16, '2b302a7020192c17e9dc0825f1ed1dbc', 0),
(17, 'c338f1b932bdaacb9312439c89b7be2b', 0),
(18, 'a89a7d6e7842bba764b6a52c0f98be24', 0),
(19, '7b1b6ee1b926216b062933a087ca59e7', 0),
(20, '1cef159b37d7debc39ad16fde999d795', 0),
(21, '4b86fd13006488ee3bae46e39f137e84', 0),
(22, '3a05ceec80147a5b572ec2d22d011ea9', 0),
(23, '4e2096cd6885a56fcd0d0849e0aadae7', 0),
(24, 'a24b6b89cbf38c4b7fe63fd661d18b10', 0),
(25, 'db9117e2ddf79c53c46f2fd37db0d3b9', 0),
(26, 'c4dfbe8d4cb956a5c6b3641f94acc6c6', 0),
(27, 'e270bb8505a9d6811e658dbff1253708', 0),
(28, '4b484345f3891172113f4af442e36d7b', 0),
(29, '5c982c1b167f0c8a5945ea1ab7190223', 0),
(30, '54924da147bac375114589fdb117906f', 0),
(31, '038b74c4d4b6ea6ad64bed5a63c9031e', 0),
(32, 'f614e160b1d124cb643a555e0c8ae7b9', 0),
(33, '6c584382de19a92805fcefa6a1180a11', 0),
(34, 'bbf08a2bff6e3cc0187c0e4413d3c404', 0),
(35, 'e65c8a669de54e30813fb9a40cc5e9e0', 0),
(36, '55bfa6621443b87719b90465867170a1', 0),
(37, '88b43885b14b3fa7bc3bce8026195139', 0),
(38, '2e1154e31620e9e778cc354758a2f70d', 0),
(39, '6caa4b9bb42b49a109a7683f1cdb6411', 0),
(40, '102c2f206569d09a30445635010ce9da', 0),
(41, 'a7383d89f199467ea24dc3cc30a1b887', 0),
(42, '65c0dd2c72dd8815fb16d5a1bdc0813b', 0),
(43, 'e552647c9f79d5a3f3053575145c9b4d', 0),
(44, 'b206758b4c597c9c578c8f4115493057', 0),
(45, 'be00dbe7fc87b4035b71d1519681c653', 0),
(46, 'be4836e68f00b6ef392f49a4f3b74620', 0),
(47, 'faeb7b3255491c8d05bd75c45bc1b5e5', 0),
(48, 'eaf67361db53ba9eaa8f4e5c44866b95', 0),
(49, '3cc62619e8918920b653c9ea9caa7142', 0),
(50, 'fb6c55483db2d6aa5cc4bfae9a434d8c', 0),
(51, 'd2d4a3d570f9ebb3c5e69138ee4de3ce', 0),
(52, 'bdd87d51e62acc0f346eda6b9ca5c195', 0),
(53, '51bfe834440c4789564e65ed75d214f3', 0),
(54, '24eb9f0c43709c9eaa8f404ef5037bbc', 0),
(55, '43008d388a06cdc607648dab91c49aaa', 0),
(56, 'b55b1bfe2c579c82226157bd41c0c38a', 0),
(57, 'f93ac5471cdd2750a9b0cf6e60daac07', 0),
(58, '254611cd5f0fd4ae3aeb052b8a061907', 0),
(59, '2f4866e4c2d0741010d7634fadab7a68', 0),
(60, '133d904b3dec7d2cbf8cae68943fd2d6', 0),
(61, 'ed4539f6b3bcd915e2b02906ed40ba24', 0),
(62, '3392d6b10683e986d6c9740502d79f44', 0),
(63, 'e97e4919e6a87f2ca40177fe4413167c', 0),
(64, 'bfe80333d53c9be56711e99a236ba806', 0),
(65, '17932d692abb66b5915366c3aa66c1bb', 0),
(66, 'd94c22ab421d926807f2638a79155bd0', 0),
(67, 'c13360645d6fb7081b8d45d02d674e81', 0),
(68, '97db46eb231dfbec28a7496e06d3358d', 0),
(69, '8f5180557e9679516b1fe3f2e7144cea', 0),
(70, '099119c07908a6f8966036fc6ed9e781', 0),
(71, '97fad1119fc162adac01d67fab571682', 0),
(72, 'a1bd420ab5acbd1cb2ee8e90b0e101e4', 0),
(73, 'ed77f1ba883c5a6f54fd1f2f73ee1884', 0),
(74, '9ea19aa95556753840c0f497084729ab', 0),
(75, '4de1457417e071919283d88db6e36256', 0),
(76, '2c013c7aaae5195377b4c094a4de4762', 0),
(77, '2cf096e06cf257252385e22b1d991ae0', 0),
(78, '1a40d31d7d5ba3866594b31f6f8692b7', 0),
(79, 'e2cd72589a7353be3a2da9b6313e58fe', 0),
(80, 'c0ae808fe241f430bcd7fa643f8710ed', 0),
(81, '236f54748f159a0424bbf9a1476efbe5', 0),
(82, '1ae1de10309be087a71c5bbdb4a12f61', 0),
(83, 'b9c9307b3e50927f5324cfd808603f44', 0),
(84, 'dccd76594fe25d02f72ece91bfc06912', 0),
(85, '7d301be2cf12b229a468ad7dd5cfbc97', 0),
(86, '529447acf6c47dc47c29245b0cbfeb74', 0),
(87, '86a1a6b7810d7a9201899d93439ff4f2', 0),
(88, '3bc49f6db4f3526fd6090206be7a8c27', 0),
(89, 'c86feaf58e7a6c92f42b2938bc6d9583', 0),
(90, 'd2ef24ef23dfdad71d017ad3f2459ba8', 0),
(91, 'af3d3ee5e9c5cf1dfc60e17352ce2370', 0),
(92, 'e1768cc2793d87b868d796ff3578c6a2', 0),
(93, 'f37ada2029851df28b02e53856d9553b', 0),
(94, '049241c9c5686a76c9917aa67bec47be', 0),
(95, '3cb111d4a04e5b12c274babd42a811d6', 0),
(96, 'be5bc3a0176ee48d515bdbddbe924687', 0),
(97, '1f5ba5cecd55a69a44996fa9beed3263', 0),
(98, '1be813f7055d3ed2d3c8a63e10643f1c', 0),
(99, '38770fe7d9fba0b5e23aed3e7b9d0180', 0),
(100, 'cc412de89c782aa00c01500980395e09', 0),
(101, 'e15761e9a7c113467fc4c21e84dd7ecd', 0),
(102, 'e90137e0faf89b21f3f4a218444a38e8', 0),
(103, 'b3cdd533f152b71ad5a7c56382af51a1', 0),
(104, '80a38ae4da4cba2fb893a62b96ae8090', 0),
(105, '93d3374f6621fe1823bf5fa86e2cffe8', 0),
(106, '3a81358037a1862c399cb8b1432c6f18', 0),
(107, 'ffdd2999aca3a2276846b519a72da09d', 0),
(108, 'fdee8cc399ca2132ac69acab0876d898', 0),
(109, '52ab9907d79a6a882ce785f605a40b18', 0),
(110, '05972a888902d90a6b339581815c29dc', 0),
(111, 'b5e30e3516d70b98bff9e18a680126d6', 0),
(112, 'b3f211058378eee445a3b4ca012bed8f', 0),
(113, '103791ff8b3c6a6d4dc95cc24705fc66', 0),
(114, '709443b5ae8d4f80e41bfcab9cd7330b', 0),
(115, '21aeb3aa266716e1850f1d14925c4e38', 0),
(116, '2caa25777bc6fc43650be09240140392', 0),
(117, '145cf1fca3ccdd6b63fbf93b4a4c9aac', 0),
(118, '0faab373a2c0b9a828ba24e57c58c2af', 0),
(119, '26c724cd7d94f0fb4ea9fd7e5e828e84', 0),
(120, 'd4df6240a9907a2b4a0bc5bfa27a4d15', 0),
(121, 'ad7345633325d170efbf9b61d9db36e1', 0),
(122, 'd2850c44ecf96ad3a3f1fdc8c3ee0524', 0),
(123, '6b23a9d186c6515c44ae125d86e92e90', 0),
(124, '415ee5dedb868204e86e184eea4a27a3', 0),
(125, 'cedc31a7736e91404d67f187567600c4', 0),
(126, 'b99f16c0765abb621b9d0c2cdf0db5f0', 0),
(127, 'b17bcae819f38ab8db414365b0006302', 0),
(128, '5ce88692476f951c0b6776177cdaffcb', 0),
(129, 'b05564458d8fc980e1cb12c91b4fcf4b', 0),
(130, '62d27c91175ff7039beccd73c9a7f4a4', 0),
(131, 'ee7fbb5af7258b5a702383234522c66c', 0),
(132, '499df1dc2bbc60e45979f9fcb360af5b', 0),
(133, 'b78bf7a01e8393a6caa9d71d3a26ada0', 0),
(134, '8a9e3f6c4762e610bcb7d536c6bdc0b6', 0),
(135, '4e87f0459e9c2c84f9899cf9cdad2db8', 0),
(136, '1fbd2208adc155afb442b4573b4272ac', 0),
(137, 'dd525e204b4f3a82cdf2a42a2c6f9918', 0),
(138, '019e83c4be2e7c16df0def633996c18e', 0),
(139, '88df2ba7eba293b8a76085d0ff24e3d6', 0),
(140, '5479f63cdc7578cd447acb90a75f907f', 0),
(141, '2226cafad96747ddfe56104e840548f9', 0),
(142, '13bb65de45a83d2a3e7f30f7be61cb43', 0),
(143, 'db03a04e7493d25885716d8ef68502e7', 0),
(144, 'be11ea405066d0d59ff19a403e81b48d', 0),
(145, 'f29514e1562ee9a3888cba6f60e097cb', 0),
(146, '80145388182c6e2cf17238fc845c9fc7', 0),
(147, '6e7a3080ff7e8acf590810047d9d68ab', 0),
(148, 'c5afc2b1fa7254b7c536b0caae22d6fc', 0),
(149, 'f1ab384154600b4215e998d294bc3580', 0),
(150, 'a8ddd86be2494f8a8af48c478477aa74', 0),
(151, '3188615dd14ca630d795a6fca12be3fb', 0),
(152, '73ef5f67451a4532c2d954ab6952d2c4', 0),
(153, '4e2f17298d754f95c89eca7e83c88c47', 0),
(154, '9f093f6ef471d55b969e10d138885637', 0),
(155, '51629505eb9325a2eb444338d2f87a0b', 0),
(156, '1476dce67ad2f3375fc35f00eb5733f4', 0),
(157, 'd023e6ccd11164417215651297ec0cad', 0),
(158, 'aa9b22d27f6e91fa620d3f1657f24c6e', 0),
(159, '5304957b5f9b5e9b826dc5e62539603e', 0),
(160, '5522c0ebaa9cb76f611968b975177963', 0),
(161, '5c8944ca96113271c19dfb0958834fdc', 0),
(162, 'ef6a7c6b9969fb05b3c3224089c66195', 0),
(163, 'c7c2078bcfe11e2f626e4e27ff4365dc', 0),
(164, 'c9b3ae711239fa3dfac01654a18a32bd', 0),
(165, '6e17621dccf60f157e74147c69370382', 0),
(166, '0cb996f18cdb3776200c9b36c57bdb90', 0),
(167, '2be33a8d8ba0dbf982ead664dc91d715', 0),
(168, 'd5eb69aa0cbc53b98ad04ee7711e632b', 0),
(169, 'd33e1cb72bb17a09539b35ac0a0c85cf', 0),
(170, 'ff9a8f77d6861e725bb59b1684f0be7b', 0),
(171, '87bfc9bdc62fe3ddd56339bdfb68bc35', 0),
(172, 'c3074cce5fc336b9102efacf5eec4295', 0),
(173, 'c11c21ae43d4d1f896b73cd0b612b504', 0),
(174, '3c7f12df9a143af8e72bfd81c0317c13', 0),
(175, 'cf374959931bac0f1e4a7f46132b2f0e', 0),
(176, '214f44022f3855524938cdc95e6ddc59', 0),
(177, 'cb336dd8cd773e53df1b32e0e7a915ef', 0),
(178, '2d55e1f041900b16d5271b7c41ccdc76', 0),
(179, 'f749df8d350835e21ee561d2aed21404', 0),
(180, 'e36e0a619d377644a144b5e66dbe9d2e', 0),
(181, '02e8c026adacc8126196fc92d6f83af5', 0),
(182, 'ef320c84498741be741c6cf5b7e7403b', 0),
(183, '2e42085135ca6ad3e805b4f13c4a0168', 0),
(184, '419659b44ae2fa53a509d93e75f44cfa', 0),
(185, '86608715122775de433e9b07a93c8910', 0),
(186, 'c7bf5b06c8bfc38bb42f7619bf31e0e3', 0),
(187, 'f17812439bf23c5adb7714ae36cd8998', 0),
(188, '4d81b78603a4a4b7f1eeb90387c240f2', 0),
(189, '129ca305d46bea9b8ac08c38e544f0dc', 0),
(190, '3019948f2a4debb4583a1b363de8a2a3', 0),
(191, '5e18f7c6f4296c9fdb0e46668a55f1ba', 0),
(192, 'ba3c5dfdb78858979348746cf28d8c96', 0),
(193, 'a44476996748c8ad4db5aa413df07aa3', 0),
(194, '1b15989fe3357a34d1d34041863f9132', 0),
(195, 'f04fe08cbf6431be8b60873a5e211bc6', 0),
(196, '28b6639494cf6d26f93f006070fd24fe', 0),
(197, '767856342c37849ad41a8ccec868efc8', 0),
(198, 'c209654e0e004369d1bdd62c65f2e992', 0),
(199, '61ffe2d712d5238f5e33513961ebef67', 0),
(200, '8b84e36c47fea9ae24a5f2a47799d675', 0),
(201, '141669634fe33f2d08a08a97899f7408', 0),
(202, '454b8615dfb3b4fe2f6c329558c82a73', 0),
(203, '0eada72f75a16363aec915ed3b7a20f4', 0),
(204, 'e0eb67b71eb8d611f6eb48b81bc5e417', 0),
(205, '990c3c2a496f0d211653e6a0279889e0', 0),
(206, '8fd9d39c93727debe340c4b5a39a7699', 0),
(207, '72bfd25366f6a052f21da0a82cd6c90e', 0),
(208, 'be318c121af33f3f25e1c1906b87ae9d', 0),
(209, 'e1e04d92e1c5c04f3dcd260f292b1210', 0),
(210, '526d12a63203287fc751a545ae0786eb', 0),
(211, '9aa93c55f8eeb48738803a1eae0f23fe', 0),
(212, '148faf152c487757a9eee7b766bf1777', 0),
(213, 'aa02c1f46c5fd246407ddb9f480a99f3', 0),
(214, 'c92fba4fbbf526eb2a4b8884dacae680', 0),
(215, 'b4a3ea1586052bcac131999536121c0d', 0),
(216, 'badb956e785b30839e967204898bbd8f', 0),
(217, '84535f77ad3bc66d45592a389054a1dd', 0),
(218, '2cff6d454b32e1932f3c280dec29087d', 0),
(219, 'b113468f6f0a1bd271535b51c3cbe433', 0),
(220, '54aa40ad258e831366b9f9ab8ed6164e', 0),
(221, '7066683b34adc9eb6833c59f6ffb7387', 0),
(222, '5b92a1794685f8a80cde0e831121b2bd', 0),
(223, '45a89987abd87cdb019eff6dced8e008', 0),
(224, 'a1314b510cf8ecc9374dc3fa9095466d', 0),
(225, 'b2e85d27a5476766272024efb706b0ae', 0),
(226, 'a0ada968cfa03832ffe8eaf44e55b311', 0),
(227, 'e5e761955a2843c92f96ed4c5f633797', 0),
(228, '88f0a2845b349fbbda103293ab54f6f1', 0),
(229, 'e4418bf3aee9821088a889174f68e3fc', 0),
(230, '5377ba69420c1403a7a3dc7f0ed59dfb', 0),
(231, '4bdb8bf1c1b5b6bd715e113246743a83', 0),
(232, '5f229729e39d8316e04daedaa78ecf15', 0),
(233, '60bb81f8137a6d92568f6f8aa1d57e05', 0),
(234, '87cc294a1cf3ac7c0e4f5ed2e8e13d7e', 0),
(235, '450bab8462f20a8af08e8eb4733258af', 0),
(236, 'b6d2c288ab9bd824116efb5042e3d11b', 0),
(237, '57178cf946ec02b7f3b530038b741f56', 0),
(238, '6a04ae7b9120a87fc01a860a99705443', 0),
(239, '161db58c642f48ea0c07fcbff18cad1d', 0),
(240, '3ca37199501e62326907303287f9eb23', 0),
(241, 'eebfc943092d2f9cf6400b8bc3855cf0', 0),
(242, '6ac742ba37060d68545f68abd941906e', 0),
(243, '763de6c07b1be50f9f35be6bfb4d8537', 0),
(244, '0c0ec692023dd08fef235472b562776d', 0),
(245, '206eb586e2ae598cf16a20709434a894', 0),
(246, '7131c14471248afd0740a71ef962b246', 0),
(247, 'd1702a2af4393dee3778193338dd6960', 0),
(248, '6dbcadf1f94fd5f97dacc2b9af62dda1', 0),
(249, 'ab7f3f846b0697b9dadcd621ae729c70', 0),
(250, 'e4848a6c70d86c284c86622fc6c5897f', 0),
(251, '8b48d9f364395aec5c751175ff5b54ec', 0),
(252, 'b81b466e037ce1396a91053eb61f819e', 0),
(253, '5828775cfc3ccc6ef1ad06fe7a62b44b', 0),
(254, 'ec1201aae3362b12a1c8b758e7719acd', 0),
(255, 'ddc959805f44acaa8fbd5e98555c9c01', 0),
(256, 'a19cddb2a70517bfd378ad83120d1767', 0),
(257, '9249801734c27d95303ca06337855104', 0),
(258, '7d3e9b870aec1df53c10247daffc790c', 0),
(259, '392edd3e93baa4517aee63d330d37eb0', 0),
(260, '4e1f22a622e39a2e0f047bb6fe7b8edb', 0),
(261, 'b0551cc636a19c1969bec6831c19d5e9', 0),
(262, '8b50f58b1533f6029d1fe89b7e09ee1e', 0),
(263, '671eda3f4a1e5a3f202c7c6e9514d093', 0),
(264, '626271eeba1470ea3f6687e88afb49e9', 0),
(265, 'cc33f57c586c0c5008b7d7566ad2ce4b', 0),
(266, '6c7a2ef854b9b842ffafdd11ee723396', 0),
(267, 'b86effa75be224861ed241e7dadad10a', 0),
(268, '63bacef8add72f74fe88aa904977a616', 0),
(269, 'fe54e5ccd4725e58d480a056f80b0793', 0),
(270, '849fcef557b20181852b957ff819c7f7', 0),
(271, 'e517727729c654b37c6772ca678a8cc4', 0),
(272, 'a6a3d816925445a5318c265e2414951d', 0),
(273, '91182a359cb64a93bf75bdb9ba1a0925', 0),
(274, 'f9130f5eb24d126a6ef20c4212d02d6d', 0),
(275, 'b0eef10b260edd112d757fd185269202', 0),
(276, 'b229a6fc9cf24d8faa426e72bb4625b7', 0),
(277, '6d8128cf86ff93d405603a017afacd56', 0),
(278, '7236256ee8183a05e6cce6d151494c8f', 0),
(279, 'a5d03266e2d808be117afd7cf037d44c', 0),
(280, '3fa83d0c36b9fb1276ae8e81023969d1', 0),
(281, 'a26a49f6bf11a34d7ffa5346b16818f0', 0),
(282, '6a6f2afec2a779f2a4fcb37797de6085', 0),
(283, '7a6f871dea1fe67052b0c432845b0a45', 0),
(284, '4765e902d68934400d1a1785475ee12c', 0),
(285, '3dc838ba6ac01237936144a3cf9ee3d7', 0),
(286, '4bab804c28963c55cb29fc34a693ae29', 0),
(287, '10f488f74d3f3dca297d34d9b4bf7bd2', 0),
(288, '780e9822befbc50586adb3799dc77365', 0),
(289, 'd350fb5652937f03d25c9a832153032b', 0),
(290, 'b60aa0c0c83e17750baf58d48f3f8b22', 0),
(291, 'd27ed927861c0cce496c1e77648ea7c6', 0),
(292, '13e3dda22c3abdd593fdcfc24e85b5f9', 0),
(293, '56ff3b41dc9aca167dce058e9191d1a1', 0),
(294, '7bf6cc2184fa5a070374d57074b909c1', 0),
(295, '9871d9e7c42338e505f1fcfddd1bfe14', 0),
(296, '5b76e01b99f22318f726f574ff22d2d6', 0),
(297, '82e84a1c11c378b3212d15f232ecd264', 0),
(298, 'e1d79f5392acbcaa3e3fd2e916c5bc3b', 0),
(299, '05c1f4a813d43ef07f094d518da24c48', 0),
(300, '59b43e0efb59f4a73f9d23f3fce325c6', 0),
(301, '814e7066f64cb20aa9c6df65989254fa', 0),
(302, 'c43ba0088dffd23537476733a902d4bb', 0),
(303, 'a8d9eccd634e971f84d4775da66d9bc2', 0),
(304, '8b95fa19979465e95ad5d4fb0a7ae2dd', 0),
(305, '0aa5efe4890b48d1418148de227350d9', 0),
(306, 'c1344c0795de2840e81f6cc33181b688', 0),
(307, 'ff05a676e42cf28524d6369b624bb3b4', 0),
(308, '8274fd8e9e86bf8f46c3ca74ea00bc93', 0),
(309, '40392fe200df0b8502c46c521e13b6ed', 0),
(310, '60322ddba1f98b769ae5932e853a83a6', 0),
(311, 'a52ebec0f89559abad0f82438eff2bb2', 0),
(312, '765347a0dfcbe6bd0f42d19225d65fb3', 0),
(313, '4521e3aa2f28d825a7397650980066c8', 0),
(314, '3bc508c1bdf8af2c26d7b1ffaf50d0d2', 0),
(315, 'e1c5529e7671efb78d09e62441ab38e7', 0),
(316, '167da053382656af92fa9f8190a88a46', 0),
(317, 'e94375eaf0470d0cdbf5dcdf1a88a73e', 0),
(318, 'f3a13eb09e0e2834257a16f9b9b3829c', 0),
(319, '4cd58a26e4adc40fd2f49973c74142b9', 0),
(320, '079d57e3b85e23cc7ec1c7635af7445e', 0),
(321, '2a6bcd205ec813015856a3695fc9d1b0', 0),
(322, 'd1955b3c7f51a530131cf393444a03c6', 0),
(323, 'eba540718f63729c7d7769f7c3c60ef0', 0),
(324, 'b583f476ace98a8883f35519c0c8c808', 0),
(325, '576c9a3beae237013bd06bba815a3389', 0),
(326, '851e282ae43d15298a7b973244746c0f', 0),
(327, 'd5d3b8d3671abf03e044728683fa4687', 0),
(328, 'e4759745e128842230d5b374398a0b51', 0),
(329, '1d389755670d434de3c8a4e88c9e7e8c', 0),
(330, '46dbcac5f7b6d2743bc6a307827abcf1', 0),
(331, '3f326adae04d0bb4cdcbb5301c5caf84', 0),
(332, '50370bf9c50792d9cae685ec5aed6629', 0),
(333, '8bb3ab1faf1922e571b2ac25faf62d20', 0),
(334, '56f0f7a65f11a8c14557d7ab8af9c3cb', 0),
(335, '11911a79553e5883edf5a25d4cfb2608', 0),
(336, '6d0f228a69127291789ba05206f34e0d', 0),
(337, 'a045e83ec0bc8127aacd10b7689aec4b', 0),
(338, 'fe611f6fca062ff83cefb66ce014e9c2', 0),
(339, 'e1e36fb6944cc0983772f129ea9fd5e9', 0),
(340, 'da867ce70e5e5ada916e31492cb7fb12', 0),
(341, '1c64dd785f3f8e08131f9bb6a79b723f', 0),
(342, '507e54eec014b207581432eb5c467737', 0),
(343, '89fb7da614792f9c4a4f39b12a4b90f3', 0),
(344, '6f940016a61750cfb452e794cb700432', 0),
(345, 'b1d3a7b1854b79545a236b4a9677da79', 0),
(346, '493c04c11457d9f8d3af7424c06c5e8a', 0),
(347, '755a9e6bef98ca4037bc5a1d67a085cc', 0),
(348, '7e3af501ca0924f3b27a2d635036247c', 0),
(349, '650a3eb567f244986d534d45ab8da9a9', 0),
(350, 'c1bc60dae46b1e97be33408fc02213f3', 0),
(351, 'd24c0bcbfbd91a9fd59f95e18b48fe5b', 0),
(352, '9361289e31f2a4592210001dd828a66c', 0),
(353, '7eda5bf7eac265f16047de21dd56e893', 0),
(354, '9aaa6555b9226cb74d52d65b4bb1217d', 0),
(355, 'c2e33f74302b248a1dabf2742830d55c', 0),
(356, '7567d9414ae8c9174e72c82e1dee58ea', 0),
(357, '976ef2cdf22a54041f1f4e1ce802af18', 0),
(358, '21a3157cb9f730a0fc2e622958cbbbf7', 0),
(359, '997419d4c29d7001c1d0ffb3ae587ae0', 0),
(360, '2af75d4506bdee8e19dd82147efedae6', 0),
(361, '4f160a1be5de4fbfd80440b74cb599b5', 0),
(362, '009e500be6259870c983ea6b86532bce', 0),
(363, '8f132ad42ed9a2e2080620f76bbf127b', 0),
(364, '400ea04b7c45a837da4f164da642a264', 0),
(365, 'a97616316a8bd866d2ce66eccf15eeff', 0),
(366, '9d19b9243e6857d04dc6c460ece210c8', 0),
(367, '72d258eb3681f2b66009eec7d72ad8bc', 0),
(368, '04cc11a266268f92df9b52ee568b7678', 0),
(369, 'ed0c0c29a6ecb3aa3be6a9123a808efc', 0),
(370, 'bbf4e3969d346fb7d6df6f5e7cccb754', 0),
(371, 'a55aecc28b7b28ad0e651e3fcb5bdd6f', 0),
(372, '808c38c916e297f0ae20f1079d7725e6', 0),
(373, '5766ae2e95312f0a561f92a5cfd33787', 0),
(374, '7b93684d4f388c94a8c7bce2c1d16f33', 0),
(375, '301aa499649fce89ae9896315b828a86', 0),
(376, 'cb8703b8d5481680751b5337ee74ff89', 0),
(377, '6bd5558000ceeb40b1d68255244c0dd4', 0),
(378, 'ab42516e1c94170a21244799d196a537', 0),
(379, 'eff2d5bd34a03facf4462b006dc3cdf5', 0),
(380, '0afae56fbf0aff1c29bbca926eb5bd94', 0),
(381, '11a2b51ad84593fa6f9a5abec64ff5a3', 0),
(382, 'a9bacc602c9e82cde7655c3f8ea69d7f', 0),
(383, '8980f697594f3cb5ad2bd6be637ddf70', 0),
(384, 'a3e75ffe4af0fd253809aac50707f93d', 0),
(385, 'eb715b73fe17a39a1f5d447cfcca9a08', 0),
(386, 'cf54ebae75c234dfca60061d64489811', 0),
(387, '397d189a7ee0759b92c6bc53e198ee89', 0),
(388, '990d4288e57fb4b16b08b9c7b5b5fad7', 0),
(389, '3fda5f47d7f9c55e19ec4ddfc26cdb3c', 0),
(390, '5ad21660d17de8fc529ea1d03cb4ed2c', 0),
(391, '31eba02aa87b539ae097caa25a4fa558', 0),
(392, '6fcb3f39d41cc036432fb5c6796b5854', 0),
(393, '1e8603354e2b8614bc720a2f9e469c94', 0),
(394, 'd54e06e7355e9ff5c1b4855bbb8685be', 0),
(395, '6f1b5e6299a65ddf53d83a3d720532de', 0),
(396, '59e66cb8b59f2b64eb976d30785f770d', 0),
(397, 'cddc877dc1ca5f3e55cc54242f122694', 0),
(398, '3b032f2dac8803402507907024139c65', 0),
(399, '15634467a25734b73f4e4d086e558449', 0),
(400, 'aafaccbf109af639abe5e7836f917e4f', 0),
(401, 'bf5f932cb6a4bfa48acddf237ca84ab4', 0),
(402, 'aa9e57bd8f4b421386801d3f360124bb', 0),
(403, '802222b82f162b59a44102c2b6e91e69', 0),
(404, '8883995b371d33c4944b5b278dd082ca', 0),
(405, 'acc63fe4562f229e4ce6c10c373f7c23', 0),
(406, '3f638ed4ba49d63e37d02c812073e39f', 0),
(407, 'd8b39b6e5c78aee2cf9db363d131c437', 0),
(408, '8badeb46c478286b74dfdc9dba63ec1b', 0),
(409, 'e8ff1ec0f32cda941a647df50d05ec01', 0),
(410, 'bb16672afee5ac0aa9367a241e98b286', 0),
(411, '5d04d213c36b1bf4b689b647dcd11e04', 0),
(412, '8c5c83a54e455f2ff55dbec8e3e653d9', 0),
(413, '72f2626b62da27651d0c1c682481ed0c', 0),
(414, 'e0d920cf8adb3d3607121f9a3bf74477', 0),
(415, '7af89cc15ec18a110e7bfefce7cd6834', 0),
(416, 'e6df50f41786e91ebe5e62cfef75a472', 0),
(417, '125bb88db5af62d77d0b61f0110bbd58', 0),
(418, 'a5e5fe09c58739c2fb7acd02a309fe92', 0),
(419, '16ee50a073b44a27a90ccd2e6209f32c', 0),
(420, 'ca563ae38c0e79fec19a3ae2ca5ec819', 0),
(421, '8cd9115a908871a53dfa386091cc00d5', 0),
(422, '110cde614844dd0cfc5e0137e0693f55', 0),
(423, 'b2d17a2f1ec5609ef7db7f94e6fe124d', 0),
(424, '2ad3ab6155d3cc4872af952d0924f4be', 0),
(425, 'd1d4560e730f63a770d62869ceb5d7b3', 0),
(426, 'd3aff7bdc1f5dc5e7e1e874def5e5931', 0),
(427, '8e0464b326d7aa1333c7e3eb9d9e91b2', 0),
(428, '0c23354a6aa411f7800547f18b68b7a0', 0),
(429, '2c5226b7b7204931d790309c3395e861', 0),
(430, '0b92b97e8156f71604ddc3ea1d183cca', 0),
(431, '836eb2d4970201b6ab3b31a4190b4f8c', 0),
(432, '8eee5b835e4e43b49bff8f04d8c86ce5', 0),
(433, '27cb3bb4cc8d9ab15088bf60429a778b', 0),
(434, '90303e5b5334a7b862f8ccd7b76eca86', 0),
(435, 'eaa677e74d9423a45abb9610ff0b143c', 0),
(436, '202f2dd731ff1e6fff4505577097ddaa', 0),
(437, '294083ff2ec411e9acb889e82197eef7', 0),
(438, '5ef1dcc1c350b467e875d029fee8d1c3', 0),
(439, 'e7220f0d86c88c27ba33bb3bac471c04', 0),
(440, 'ca88ccc214c90c311b658afbcf50eb9c', 0),
(441, '351c394ef22f423d196314e221aa886c', 0),
(442, '27cdf2dc47710f234a4de3f0f55ec899', 0),
(443, '2efea62d23ad8e60778d9d7cb3cacc81', 0),
(444, '0705348ff43cfb946c384a053ccd7c67', 0),
(445, '5ef81f2bb99e448f0640dda3826f07a7', 0),
(446, '13619c467abd199608c0a0611244efb4', 0),
(447, 'c24244b268649ba4fcb704e0ef4b40d6', 0),
(448, '4d3f07f40055b624d3f61da1b8b7bd13', 0),
(449, '969573739e8a58e9043805c525532b4f', 0),
(450, 'a1e33280102badec9846b7943f427e71', 0),
(451, '8311f2b97dac7bb916a49fd272d73e4e', 0),
(452, 'e568e2509355cc759f4e73cc612fff7f', 0),
(453, '3edabcdf89e693dfc3303361296e8f79', 0),
(454, 'c9f728525346a5c88d159442895a1f7c', 0),
(455, '0234b48c4ed21642a315dcf015e6624f', 0),
(456, '33853573bce3eb06b2a5dd2041b06f5c', 0),
(457, 'f68cecf6cfe978e7684612cc6f6f3d3e', 0),
(458, '29855fb7d81669486f69650e125a8de9', 0),
(459, 'e02b000b0ae46c8b655a6c304dfc2462', 0),
(460, '012af13fc997e81ac01fb421de247a5d', 0),
(461, '10845125502eca98a884f74779284c0c', 0),
(462, '38cb28280bdfc0b65742162492903823', 0),
(463, 'de02aa20f85b70475db8426264019347', 0),
(464, '443d3ad5286635e67f41b1caacc8dce3', 0),
(465, '7d3e96a0da39eea3dc9e8b550a30a1b1', 0),
(466, '86f2bd29124a6fa4c24faa34f6d335cb', 0),
(467, 'be452815d3cacaad93acc696d0a38d73', 0),
(468, 'd709b4cc0cec7e0a9cf7d8696ea2d4e6', 0),
(469, 'f0e3bfd829efcb756020918ec6f68db8', 0),
(470, 'bd84fd674ef9bdc8ffde5f7100315c6d', 0),
(471, '1616bfe3ec78771fe17301a122cbc520', 0),
(472, 'e212b953a8df4cc502869cebc3453ff4', 0),
(473, '6f6c413ce9d8674e946d8018b4675683', 0),
(474, 'b0ced061e9e62da7f4a3896b19195ba4', 0),
(475, 'ea8087e01a8e0d60947b934234e36e77', 0),
(476, 'e43da3db9074e3f926654e7a19b4df00', 0),
(477, 'c123bc1772d290120d311e042f330bec', 0),
(478, 'fe0774b9d9c158d6c90a6ecbd3fc4624', 0),
(479, 'f45dc6f83e512766a07850d27c8b931c', 0),
(480, '2b107276c023c6ac0d3db05700482269', 0),
(481, '60be2fa72d07914184cf032a143011ad', 0),
(482, '60055fae1f8b53b09a7f8774a5754925', 0),
(483, 'ff08fbfc2d2437011d49c1610c97201a', 0),
(484, '1c9baa1da44a522534611f0b15c410ba', 0),
(485, '197c17ce43c59df888daa7c7441fe88f', 0),
(486, 'f9ad301698616979ccc08f698f2830c0', 0),
(487, '8b56e04fc64b071d1800f3afb0cf4934', 0),
(488, 'a939c4367e5467064ecd6e0d97d97ec7', 0),
(489, '4f81e2ee9d8b979a0d21a6c947409536', 0),
(490, '4bfcd1b2dedfd3a748c099afaa7c17be', 0),
(491, 'cbb418f080a68b47d58e3f8f6427436b', 0),
(492, '32960df823ae3dfcb27329a5b49df848', 0),
(493, '5685a82404a5fccf0e02ab5bb5dbbd4f', 0),
(494, '32db5292788151adad9189e6f79e3c10', 0),
(495, 'f8d266992d1b1b252fd15c7c0f5deed0', 0),
(496, 'd1920afddf58d18660b925240dcc6b25', 0),
(497, '59cbb90524aa289f4e8efa01719ba8d8', 0),
(498, 'd940303709ede12c12e30bc7f28457a0', 0),
(499, 'fea2151815c6dfc43762e21ae6e98a0d', 0),
(500, '5f3a531bd37cba475f4ef182444fbc03', 0),
(501, 'a9f33d3a6aa6310fc60bf486c0ad9ec2', 0),
(502, 'a6c8916c64b35b2ce6aa7d8251b1974d', 0),
(503, '5133e0818ed4a3e416dc4831bd032533', 0),
(504, 'a3755d848642b4801c81a43ccd9e6163', 0),
(505, 'eb5424eed68cb02dc67f33b83eaeef5a', 0),
(506, '9ef65747f904040a3e259827725d1832', 0),
(507, '89ce1c86a76c11b59ee1d4cca5a6ce07', 0),
(508, 'b010acce26f6573cfe24828e5128586a', 0),
(509, '0af97b59b9da071e09fda2725f800847', 0),
(510, '869b5f0089277c33aacf17e431968bda', 0),
(511, 'e55f0075c8254ad2984d4180e00671ac', 0),
(512, 'da0ed44559f9cf1f0472b7e0b9c454e2', 0),
(513, 'bb9c54df69cd5ca7c21f959e4f72f2a6', 0),
(514, 'e06a43e3a2b9f43201266084a4760f88', 0),
(515, '0c19ccf458f7102119bc344f5f034e22', 0),
(516, 'b38e4a719c28373f37b0cf548408d123', 0),
(517, '46973098a1ba117f2b2700cc3091f2d4', 0),
(518, '7e2b7807c2f8659dc5ae3d389ec88bc5', 0),
(519, 'cc9cd48d78e119ab8cab2d80e2a1e154', 0),
(520, 'becf63c95481cf43a9b76b13859d6cc0', 0),
(521, 'dfcae7d0bdbcbac72bf5d3619e5d5a41', 0),
(522, '034133908ba3bccf11a513341ebc85bb', 0),
(523, '9c74b76f87fc5fabb973058eed483d9e', 0),
(524, 'dc55d85b3e65f51fe7011f74a4d3c1f8', 0),
(525, 'c06d017451bc5b78b3dcd163fdc0da66', 0),
(526, 'a03e91457ce0afd8eb4c6f0db05ae864', 0),
(527, '5a94a6a3d064934b21d89012e04a30b2', 0),
(528, '214dbe2b13e06effb877d8005c041dca', 0),
(529, '8be9ed2b652839de3c47c5787a2e9fa5', 0),
(530, '1ac84595a8f088a64485a7f63ed95494', 0),
(531, 'dec5210e9cd668bf326e7e71135a42fc', 0),
(532, 'c1e264bd137b90088e8bb30b81fccbc9', 0),
(533, 'ee07cc176650c9893f4befacde108873', 0),
(534, '867cdaaca2839dc459ab599a4f013c88', 0),
(535, 'c9c1dbbde24b99c323d08a8b2abc0807', 0),
(536, 'e1f254053a2f75cd89b678ffec0b3b47', 0),
(537, '4e8be51d2ac4d584fdbdce456a222fc8', 0),
(538, '3a24dee1b2f0e82391c6810a4ab30aff', 0),
(539, 'f7fff47d38d7c65669a3bc32d0ee0d92', 0),
(540, '5a4f72affddedd74e31650fb2c0939be', 0),
(541, 'be51f426ac7096e455d7901cbc3b4f78', 0),
(542, '004b0a57c0041e2d0331824a632a1d3a', 0),
(543, '7fb0234f33925787852b98ead1d97ea2', 0),
(544, '37bad251ee349c4bc376a2bed93ce850', 0),
(545, '0718ecd68ea61cf6139b25f82c0073c2', 0),
(546, '44326e14da1abc7b5fbc9c1c414179b8', 0),
(547, 'a0ddfd8d48e9ba52a72e1007de598f2a', 0),
(548, '7511ae337a6cda297f0184c5b10f2a02', 0),
(549, '127355ddbae007d9d0fa5fce6e2be88a', 0),
(550, '76f285a100902a05d6126a8d88773b10', 0),
(551, '99b08cac3ac3660c894cf2f41bad76fc', 0),
(552, 'f738737c7a16b7bab8853c150c30978a', 0),
(553, 'd0af71e514a54dbba396f19aa4ebe909', 0),
(554, '5b267d74ca4908fdf69cf4645d845540', 0),
(555, '11367b56c0396840768ecf2731afd1e1', 0),
(556, '639a2661e48a3849ef0d510b6948c608', 0),
(557, '92b595e65790a79692f7122e7a8ea7a5', 0),
(558, '79c85510d0e2243c39373daa776e4217', 0),
(559, 'af731d17c0b6dafbc65140d640699079', 0),
(560, 'b370603f9bfe8a61f4cf0a3632332836', 0),
(561, '1312a1ae392e56fd70f00a2f3d71b033', 0),
(562, '0f5dc0fbc37a02fe3c1a77ba5e7cb546', 0),
(563, 'f5d99467f19fea48e34434096a955fb7', 0),
(564, '5696721aa0181f459624b2b3ab6ebd36', 0),
(565, 'bccb3db3c8c9ec498245d7fe0517197f', 0),
(566, '2f94f044b982870239f551fb5dfd1a76', 0),
(567, 'f30b4b8e9e73146f5373d3638ba63b7b', 0),
(568, 'd46cb0d743a6d64eb3cc017bcf60ae67', 0),
(569, '85edda876d4bb531dcbc087839bd3758', 0),
(570, '02ad0f27cff26010fbcc282ff048650c', 0),
(571, 'b8816e7543b53c6e0eb5bd41929d8cd2', 0),
(572, 'b77f6b19918d2f084b0217b1e84cc44a', 0),
(573, '9248d111ee90a10c90852431226c5472', 0),
(574, '176db62d17e25a6add97e6d0c6a6950f', 0),
(575, 'ef1db4cf21add2577d365b46fa07406f', 0),
(576, '2219370fd8557a307d31626999c895aa', 0),
(577, '097f0809e9bda96ed51b642083139e9d', 0),
(578, '0422257a1e690cda4b9a9987c422a1f8', 0),
(579, 'f611559b3a4e2f2ec8c8be7550ca101a', 0),
(580, '3f5a134094b8bc9c1979879cc12e6818', 0),
(581, '2c5e2c66cb74ab0df01d998e831608e4', 0),
(582, '26c95fb595f46ec7a3e5098ea090cfdd', 0),
(583, '07c03467574a5c44ec692362fd4388dd', 0),
(584, '2fd9a6e4e3f736dc73929dfd2d26af3a', 0),
(585, 'd0afb8bcfab7e0f5da0d67ce09850779', 0),
(586, '73610ddaca9ae2ed857c92ed67626c2f', 0),
(587, '2e17d82993d579e2d667bf89b3ef05cc', 0),
(588, '7cca104762215076c0d001cc04a4ee78', 0),
(589, '482c9fb5fbfee733dd9a5d9facb12bc1', 0),
(590, 'ba604d12cf835e4df34bbf52497a9275', 0),
(591, 'b89ee2df00ab17b99615258f998b6828', 0),
(592, '19d1ace161a5f3be074c121dbc010803', 0),
(593, '7847b64ec15bd9de17011cb3037fa5c0', 0),
(594, 'b037e5e36388710353bbadff2e4f08ba', 0),
(595, '214df9c855a7d2ccbf203e3f469d7fe8', 0),
(596, '700b5fa351994e6964f3e84a889d6199', 0),
(597, '573ec6889ca189a79a9381c2cbae20da', 0),
(598, '67987eb86e4a9f9fcdf3f88a417542c6', 0),
(599, '78a110319f63157df7b0b51005f6e1e2', 0),
(600, 'd88ba723955b8e1555adae3a1be60d9b', 0),
(601, 'bdbb9d6d7923a46548063d4def9a7c89', 0),
(602, '18d9db04f2a757106e9164f5373caea0', 0),
(603, '4f537f75a12db86aea63bb9a2ff7b4b1', 0),
(604, '4fd7110cb2a85ba5adf378f1463bd3bf', 0),
(605, 'b43f21d5165ddf517dc1de87c051f2ad', 0),
(606, '6999a5263d7e3fe3f7bc817cd87afc17', 0),
(607, 'd8674c9426bfa479a7fac4ec8904f486', 0),
(608, 'e164f1d7e233bd43a4ff0edc97ff8a28', 0),
(609, 'a8321abb20460e60b689668461388109', 0),
(610, 'cad4304f187268fea09a3873b8abd7de', 0),
(611, '7be50474c1618d568454eddcc0ec5f2f', 0),
(612, '02b3edd8a212a5858765635d4f001e36', 0),
(613, '6af95b6d63f94d1606b936d28921f38c', 0),
(614, '459904270821390ee3f15f623fd8eb2b', 0),
(615, '51fe50bc7cff7deababed292414bfcbc', 0),
(616, '530db3ea533a86212a576ec65f4c8b7e', 0),
(617, '9eabb809cba2483a47b6138c940acad4', 0),
(618, 'e11d664e2ed7d792746198afa13ac111', 0),
(619, '2a8bc46f5a7997c1caf95e16540e03be', 0),
(620, '1390d1700a7f0ff3954652aad6d1938c', 0),
(621, '6db4b34ac68941ebea33b3fb5358e292', 0),
(622, 'd36f5294a9322f87cae5f39d4880741f', 0),
(623, 'a7a8413d081eb54e8b31fa597e9934f6', 0),
(624, '1a2df28af36cb0aef9dad714f7a86a1c', 0),
(625, '249a303f44c56085730871039c282fef', 0),
(626, '7bc0f17ac4d90c2815e58a28da644d08', 0),
(627, '50d4d118ec4c0f7c7c1dcec7529cb44d', 0),
(628, '012d10487fa3b3f4dcf5620746c5fa77', 0),
(629, '36c3d230042c9183a3f1f8ad8b1513a2', 0),
(630, '87e3229f094d70368c32083136fd0847', 0),
(631, '447740690447d017c315c3ef32e492c4', 0),
(632, '9d8ca26345f64b6a3d77d009caeae011', 0),
(633, '4a68fe148caf16796ea99ce5d23b873f', 0),
(634, '639476d652d0bec74ef3930cf6f59f43', 0),
(635, '7659e0b56d9c032e7e2ad051dc859f5e', 0),
(636, '8f93718c8319811bc4466b331a6251d4', 0),
(637, '51aa299f5f491ac013bb91d50bab3565', 0),
(638, '0acb715a24b962d3b36e23897d5d31b3', 0),
(639, 'efd2e99f3c25ca29930651a9c17ab9e0', 0),
(640, 'ec0864840dd619edf21de316a56f164b', 0),
(641, '1026cb9149067ac6aa4434952622ae38', 0),
(642, '7664ac25b868c8aeccdb8df6bd92ad45', 0),
(643, 'a2906ab2e10066fb53927f506e9ae3e9', 0),
(644, '53b7e35f71b4bf274e75d8afd972d082', 0),
(645, 'e34b0f1065249174f35eb3f48c2d722f', 0),
(646, '8e7ff551147ad866b287b7d5f233769c', 0),
(647, '37afc5be4bafbe9c473b46a343aecbd2', 0),
(648, 'e5a2d69c632908824d86b3102d8e5412', 0),
(649, '10aaf2c4575e9c82a920e6a66f7c5dae', 0),
(650, '6c876cd06f717822b9cdb40e8411f151', 0),
(651, '6f178af4b4440d13736646841f073778', 0),
(652, '75fbd9d072011734db2ffdbe470f53bb', 0),
(653, 'e493e335446a543e5092c9cf78967a38', 0),
(654, '8945ec3df2928dca91742c5919d989b7', 0),
(655, 'd447e893433c7498a606f072f3fef74b', 0),
(656, 'e2816657b40f267a228936fa69694180', 0),
(657, 'f5515b9a4981ea4b19e41242db005055', 0),
(658, 'd1a8a1e466114dc5534ae6cab65489ce', 0),
(659, 'd8555f742cadb41d38ac57aa62fc5419', 0),
(660, '014d1d007af40dca346a82423585afa9', 0),
(661, '21d22ede67b27acd30734a6d26f14863', 0),
(662, '0d7511c3e89ef9381574ba2f5a0e071e', 0),
(663, '989562d83391ec8cb013f770ef3de6fa', 0),
(664, '06cd7e46b0754eaa90ac7efc26fc035a', 0),
(665, 'c49c1f34d74997148bd8e8c2d0333581', 0),
(666, '5dbe56224691d7df27f5144c784a16b3', 0),
(667, '8acd5e92d984f97faedd6aad73151c4e', 0),
(668, '5855aeff2b0b49a0c29e19209fa25fb0', 0),
(669, '1f813d71d7f051bdadc455596c3e5f79', 0),
(670, '400506e421d86abca8c09197cc07d729', 0),
(671, '2ec7bce6afd19525f16cc45e4866f378', 0),
(672, 'f0b514376d9c69fc726f9e99d809ded3', 0),
(673, 'd134f6b76ec58168f9df582838d5aaa4', 0),
(674, '4a14ca001ea04a12f291d225e8e1ca3a', 0),
(675, '91cb0e14b50b6e57d3958aabbcd0b21d', 0),
(676, 'cc5a0f60111c49e7569ad9bf7295b779', 0),
(677, '055b7821ebf09eabda810f610f41bdfc', 0),
(678, '11ede7cff686dca27d1bfcb6d8dcccd8', 0),
(679, '5bbc7fe5db7f4b471e341ab8519c529c', 0),
(680, '3cb95f4921839e1eb15214807520781c', 0),
(681, 'aff73a4683e52829fe202531d7114e81', 0),
(682, 'f0611a97a72fcb1881323762fc536c3d', 0),
(683, 'cec578e793595b8f692196be4e59622f', 0),
(684, 'f40d0c40a2a4c10e25c0ae44239ff0a1', 0),
(685, '02252b7b67eab0222ebb09c754e1c704', 0),
(686, 'a6c43bcca16bf22781ced1c546ffd565', 0),
(687, 'fca68cdabf6b35f74807699d3029b5f6', 0),
(688, 'cf40021c895cb38332bf71b5a8c7d4b5', 0),
(689, '0c38922aaf3b7fced4bcfee7e6ad722d', 0),
(690, 'b6c2c9a61e37d39412cf9bad76a9568b', 0),
(691, '312c9c5dc25c1a8a3274b311a87dda92', 0),
(692, 'abecd43705cb3ce2f7cafeb9d8623b1c', 0),
(693, '19379d959fff9eabf75c1b10aee86dc1', 0),
(694, '8b417153bc465df768ef40f430540b84', 0),
(695, 'd956f2a9e2f4f57ce9a18ea50fafbe64', 0),
(696, '4bf30cef8527dca5c4d17256a31065fa', 0),
(697, '342335bc02dd441651f708bee79cc7c9', 0),
(698, '938b29bf5d435a7305bcabdf2c2975f1', 0),
(699, 'ac39eaef98d9dab89483fa3dd396ae07', 0),
(700, 'bcd00df138d06b8af99202b8120051b3', 0),
(701, 'a4c23b21226d27bebb835553ee04e6fe', 0),
(702, '96cb63359f6453336e49045822b56333', 0),
(703, 'd2e42ad4d0b89b40c6341241ead989af', 0),
(704, '1e70cd037906eb8046ecf2de6b24acc6', 0),
(705, '90a8cb29f192f978edd284256f9c90f7', 0),
(706, 'af79fde8a3d33c98d872b57c80f5591f', 0),
(707, '5342c99c88a990f4e7c4799b6101d9a3', 0),
(708, '3a906114e7ebd57dcdeeadbb6ec1e1b7', 0),
(709, '508839693fca60a3044831bba6e71429', 0),
(710, '42a99431c4fde9c7a943f319f7323ce8', 0),
(711, 'e315aadb65b362120e200c551085008b', 0),
(712, '3088c188cd1a0f3561e21dfd5ac89ad1', 0),
(713, 'b82d7a0fa8c57e9f8cdd68a87e75419b', 0),
(714, 'dd93cdfcf5ecd9026a7a68a80c9f156a', 0),
(715, '19a4328b4d3f51e156c362d363a7891d', 0),
(716, '583c4210ca5c577d988277ee784a815d', 0),
(717, '2138d63343a88adf84c771f8751501ba', 0),
(718, '64e33053d4e6ec05f6ecdd58fb91a176', 0),
(719, 'dd0333ed5f5021d01b0fef61b2fdead9', 0),
(720, '540150bd7c88379beaf50d8da1b9af31', 0),
(721, 'b01ec8af577376cfcff8577d39dc20a5', 0),
(722, '04547f8be597dfb6abaccbd004554053', 0),
(723, '37981146ec23dbffedaefd9d50f3f284', 0),
(724, '7ea3356a355c64a7e5cc8e2f18838f0f', 0),
(725, '30f064ef68b3ebb6f337000a7a1792b3', 0),
(726, '06afded178c1f20dabdc4c38ae2e1736', 0),
(727, 'bf5ae108fe680c9ec0e7e8a9d6515c65', 0),
(728, 'b9f69355a7618f4e86f029a4136e4aeb', 0),
(729, 'ba6e0cacf76b40a1c9d206841b827197', 0),
(730, 'f983dc975852e2e3ebd35103a4b22342', 0),
(731, '825fd88054b3ec487c5565c02d5fdda6', 0),
(732, '162e3872773de578e27cd72c43c60f6e', 0),
(733, '3beb1f5705d2f27e2fc33178838ab219', 0),
(734, 'c9a5ed1f5a1b5e4f2593d8d22cc8e1bf', 0),
(735, '7e27fc05751394a14cf886d9b4386718', 0),
(736, '6b629da1dfe902ced1be27defa288b6f', 0),
(737, '44e5ac7a93cece7758779cfbc9c38d04', 0),
(738, '3e4c0029ffdf45d17a2bf5ab0140aa6d', 0),
(739, '5517b981ee341881b4bb0a517ab3b8d7', 0),
(740, 'dfd29b7e8c184bc9f2bad037099f0f11', 0),
(741, 'b7931c00e10567661cbfa0e87bac186e', 0),
(742, 'b98d589d32ff2a0f2d1cff47c6f689fd', 0),
(743, '1afad99f77f6c39219cc20556641dab4', 0),
(744, 'e0792240ed15b76f98e4ae934311addd', 0),
(745, '2c00ccb2309272a8db854d8a2a755deb', 0),
(746, '780506bcfed63fd119c0e2bff8a605ce', 0),
(747, 'a916ce882eb1f85a2939324540b8b7b0', 0),
(748, '8a43e6cf3a6f89ae3e10ca7f8bf95f03', 0),
(749, 'fdcea5e85059eab1c74332878ef1a316', 0),
(750, '15eca137e9444cef700a2da94cb38879', 0),
(751, 'ade2580d7ad8c21cf82a6c291a62013a', 0),
(752, '7780f246dd19c67a533792e1a33b4f02', 0),
(753, '7b06f22ea65d9d632d36f3d362cc295e', 0),
(754, '29aa2d60f6b0694c993f06a460794860', 0),
(755, 'ea6b9149af2dc7ce214656e214c6c19b', 0),
(756, '3d9c566c363f1e99008e70d70204ac28', 0),
(757, '1b42ed972413529e40d214c407bfeb63', 0),
(758, 'c72b05c548ce655366d89702be919006', 0),
(759, '287552a5972a651c1834abd5efaa1574', 0),
(760, '2fe1bb142c2b44cfa43815c360344b7a', 0),
(761, '99b04368c338013bdb46539506560ddf', 0),
(762, '8352942b6dcfbeb41df8527bf98af83f', 0),
(763, 'e533b1cf3980e6e0f6f1c45ae7d66448', 0),
(764, 'e0992d85fd0af959587b70d4087f56a6', 0),
(765, '05630f226ca4ce2be0b3cc90ce31c149', 0),
(766, 'ee613c6b56ecde3f0f8dad61afc65ede', 0),
(767, 'b798006c868fcdb30046adb4fa4dcc7b', 0),
(768, '6009c7cb9e4f534f0d54689a47b3ec2c', 0),
(769, '1add22314d1f300e1bddd61b854ce40c', 0),
(770, '0889fd73f1b74ba3e5c98a942b982ffc', 0),
(771, '4aaf415cec797a33a3391f2123be032a', 0),
(772, 'ffcf2412bceca41a8cbf12ea11fcb5db', 0),
(773, '45612c36c6775765e445f9118b839078', 0),
(774, '11d5844b0dbdcaf813b56bfae30f9c98', 0),
(775, '80d1d434e40735559427cca670caba20', 0),
(776, '7d7a60802bce15a4fa07ebe2cb28cdff', 0),
(777, 'e0b6b377dd412b5d97d6e698f615db08', 0),
(778, 'a826aba8298f7fce857492dc78919864', 0),
(779, 'f7b12798d3ad892f04a1c0dafec676e8', 0),
(780, 'b90f790498492c34857b1200c1ddfa2b', 0),
(781, '69fd6e1a3d225d7991ffc2f095e83c55', 0),
(782, '6e5ef8f2654729b513c8f5a6bc9c3d22', 0),
(783, 'a21a6badcd11c797ffa900f36bd30e72', 0),
(784, '45ebdc333caca85ae5773d9102acc738', 0),
(785, '3b665afe25ffb6f294668b5d63d0a201', 0),
(786, '94746289f3471bdfaf39d5bd1a7e841c', 0),
(787, '8e8f0d6082aa03abfbef51e5d8329a0b', 0),
(788, 'e1e87e447540f69c8f43051df586fb1f', 0),
(789, '76d4d78f3a853952824d86183353e15f', 0),
(790, '2d941c199632a31b47b75c82af561f16', 0),
(791, '53cf9037119a9823a92acfdb0726a66c', 0),
(792, '522401f970312bb152fa0cb4c64212e7', 0),
(793, '87c01baccadc415e0685813551db4687', 0),
(794, 'ccf9d9ccc48ff3be461d2e2c4539b477', 0),
(795, '021c41f977c0b688e91b7544acda8153', 0),
(796, '1cb3fe82f2742d436c30269a9ade7584', 0),
(797, '95119fc4a68b99f849a4fed937ee556b', 0),
(798, '395e0b55c80faa6391395a94b3a83e17', 0),
(799, 'b7cd970f41be4704a42218f351e62df4', 0),
(800, 'da04d064cb86d9e1a592627369e755de', 0),
(801, '805c4776183ec1366098b0384a0e896a', 0),
(802, '2e93f7abdcfe5c279e91db7003f6bffa', 0),
(803, '0864f4ed7b4a693f5352cfb7f212a241', 0),
(804, '35263788b8c540c853c065d188fb0e41', 0),
(805, '651db8bde41918348eaefcd54792b767', 0),
(806, 'b9f3bec933dd6b54aba2f4e34da6bf60', 0),
(807, '07739330a007f3690b758a8a9d4efb4b', 0),
(808, '9e7d08a792c2cbe42b4e4b8fb021573a', 0),
(809, '4c69f278930de6e9d27477084dab2caa', 0),
(810, '6a97b6f5a080ae50fa2b7b883bd86dcd', 0),
(811, 'a37febdc6f6794e88072fc4cc9308acb', 0),
(812, '67a4aee8eed857d62eb83aee16473360', 0),
(813, '8a3139ccb85e950deecfb911d531bfd8', 0),
(814, '47db64823fa7dd78d7dcdc6e05c7a299', 0),
(815, '98a44f95148e04a374201094cfb0f440', 0),
(816, '2a841728603f4aaa2f290092858f5e15', 0),
(817, '01da7dbda1e5051bedad1f316481d2b5', 0),
(818, '3ca3127a8e52932ae08034c5a9006b2a', 0),
(819, 'ac2cbf1e602cd4728a2dc8f49f17da2b', 0),
(820, 'b4292c4bb7aefea6ed6fe48d85ac16f0', 0),
(821, '4f4123fb43a62a286eced81701bc4f2b', 0),
(822, 'f81e28eb1435c0a83f9cba29042852b1', 0),
(823, 'b7a264c5237c3066c1ae808d1fc6fc2b', 0),
(824, '976398d823e58ab708ed08bed76bdf09', 0),
(825, '717ccb429103eff8ee15964d0edc5f1b', 0),
(826, '42ab46632c0a47ed5387891206dcc72a', 0),
(827, '1b769af0c3687b695cc8080b6a5b888d', 0),
(828, 'ae40011400dd39ac5172584c3606c168', 0),
(829, 'b2218cc13464c67bda2d2393bcc90265', 0),
(830, '27b19c6c39fba08f973f251cc28c1703', 0),
(831, '9b43064726b4c8782cb2eeaba54350f3', 0),
(832, 'b859a3fdfd2ea295fa4eea22a9c8ad5d', 0),
(833, '4cbd2c6986584920b16eea8ecf3038c9', 0),
(834, '0aeea2c9e720d8c9393955b8c0a855ab', 0),
(835, 'b942ae2508eddf23b57b74de9c20b144', 0),
(836, '9d2ec3ccb575b19a84f5015ba4f23722', 0),
(837, 'b804454ca829d5b952b2bfb48633da82', 0),
(838, 'b59eefc6271ab238798aad361a3b3271', 0),
(839, 'b5cf654f084d5ad45b3d1b96713f2ec7', 0),
(840, '0cb78e4c7416e2a034127b6146a10de5', 0),
(841, 'cfa67235ba3544ddc0998815a4b112cf', 0),
(842, 'dd20752c94d1c608d8bc039f50ec598c', 0),
(843, 'c16eaeb7d974f981465209cb4299c673', 0),
(844, '3ba77da83a00859f117e42b9790010c2', 0),
(845, 'ea577426088da584ef0c07eddbb73426', 0),
(846, 'dd7bd7d8749ff48f295e9b7826e3311a', 0),
(847, '5fd00bc174a8bfc51e6833b1b3db4fb5', 0),
(848, '9be33e1973d59a0ef4c68f2df9cd7f53', 0),
(849, '44412d293cdfc48f2655102ba0e966bb', 0),
(850, '195f52e0c23ef42ca56c50fa070f9c9c', 0),
(851, '00c301f6197de76e7119a77dd3484d94', 0),
(852, '56064f01e1ae5a24f9cbf5298b6fec0d', 0),
(853, 'c9a9f7744e56d29bdfe0b114dad507ce', 0),
(854, '20dfe590a73332a174d276bd93278b74', 0),
(855, 'fabf90cdbbc86eaabfda30158c7e3a15', 0),
(856, '3d8784e817c9ebc351e9587c46b9b6c8', 0),
(857, '7412ee6e02ef3e3b68a1af974fa3ac19', 0),
(858, 'e8d1db0b55cd66a156b36cbad095a96e', 0),
(859, 'c423f198d571ab02ac42457e429ee0b2', 0),
(860, 'ee58f01af9f83c13c05c981d9e5112d1', 0),
(861, '78d5c504ef820c816539da726d21828d', 0),
(862, 'a5332253697e1eac1ef86d025cc1e3a0', 0),
(863, 'f60d27c3dbcc1826e2625944e4ba32ec', 0),
(864, '32303ec0c1fd2fbe80d4177095d0f301', 0),
(865, '5562145c38cfc35ebd5b472911624d09', 0),
(866, '6453a639db3a540bb36ceb1efe4f6085', 0),
(867, 'cc4b8d6a36bbfbace032dda90d8e916e', 0),
(868, '19207bf06be2ce7070c882dbc08bc040', 0),
(869, '02e6bb1e812a0ef1eeaca9a41f248c7f', 0),
(870, 'debe24576081b6de736a9a49a16ee9f9', 0),
(871, 'c607cc409762ec2c782c907404541879', 0),
(872, 'c5b2db3757ae936f84de4ba5c164b4ab', 0),
(873, '286f7f809e8a28fd0a8fd87dfe16a4a8', 0),
(874, '97ea99dc78a274e6f235d4f12cae7377', 0),
(875, '880246bfcb7f911a452e7ee82cd885bd', 0),
(876, '1f9233b6fc3656bc774b80362ef1fc73', 0),
(877, '2632cf858562c86afa13cc9a4b594747', 0),
(878, '7087374b726d5276996b335c5f134624', 0),
(879, 'fa3ffb80348954a5b87f5585e64c8bf8', 0),
(880, '8fe2d311c4178f7b6a4b83bf9d6fc9dd', 0),
(881, '6ebd5f570bb1b162af1af31b06e90d83', 0),
(882, '69f49dd7ea4a74286a3a9d8c41ad167c', 0),
(883, 'ba07b3f000b80cc289d14d23010c0634', 0),
(884, '6a8cfd574ee763b5a6654607040981c9', 0),
(885, '694fcea68ba96448118f2b96370e5d71', 0),
(886, 'dc8512dc78eda5036ee747286689fe5e', 0),
(887, '0bca589fe7ab66fa571b94debab7d691', 0),
(888, 'e2aa7fb57378492e3c2d8d9a0da84f31', 0),
(889, 'f5e862524d94927d9026fa759d93c566', 0),
(890, 'b347abf255997070957c1296d9e6e3cb', 0),
(891, 'e717ed1cbb67de156b295292bc1c9421', 0),
(892, '7937b8a9cf904877841c0d94b63c34b5', 0),
(893, '26c19d7aa1482625e2c7d75f9d86f25f', 0),
(894, '97a156f3387869e84884b1af45feb110', 0),
(895, '7c4dc6535872358834efe68b71f401b7', 0),
(896, 'de17e5c9270d18b7e081527efede955a', 0),
(897, 'd730d62416296f7869ad20a962551a6f', 0),
(898, '2defffac974dd7d3394a82735c725391', 0),
(899, 'e2c4d038f9625def5c64db7d84f50512', 0),
(900, '2fb9e6a797569189ccca9728b98350d1', 0),
(901, '7baa177063e1465b20dc57df2137a3fc', 0),
(902, 'ce61fec5b866c6c4947056aacf37ab6b', 0),
(903, 'd7af6f640126900eb64151335097d289', 0),
(904, '2b5d1894d4056f197b73fecaef77964b', 0),
(905, '6d9b7b5100c57b414be867f247cd1cba', 0),
(906, '5e43c7e4f3753a224f14bce24a3637ca', 0),
(907, '42dffea1c478c6d8b007082a8f17222a', 0),
(908, '41857ee7dbd69eb0cd2e9b9dbc4a65fd', 0),
(909, '2f280096db346842c7c48ea3394a663a', 0),
(910, 'd66ead74ffb50d2a2bb3f506168fb19b', 0),
(911, 'd29a9e480e30915071a476304e5e9b63', 0),
(912, '0f90e99dc4907f1fcbaada19c4c75da4', 0),
(913, '5c965dafb8c1bd0df0cea43237f4eb04', 0),
(914, 'dc30617176697d9602ada302ca33f055', 0),
(915, '0fe0ca498e1d5562bdf7200f2aa14a20', 0),
(916, 'e7d96f355d25f40d4b7f588f5efc6d0e', 0),
(917, 'fbab368250071641999c566aeaccb994', 0),
(918, '9bffb28cf425f7fecbcc59b6cb042555', 0),
(919, '1afbe5202c9490a263f59477751c8c99', 0),
(920, '9b3c06eca31ca754bc0b5c4b58d946e5', 0),
(921, '99c43adaa3cac759d3c65b4ab46ea828', 0),
(922, '1eec3ecd8682b730c9a6fcbe0e9bb210', 0),
(923, '81893c08c3cbf0896c2d8fb050a1933e', 0),
(924, '2f7e5c37bae102fd8d54a16b9888580f', 0),
(925, '5fcd7974c86f329dab49214805de848b', 0),
(926, '523bf398fd4049c2cbf5f772b40b03c9', 0),
(927, '284d242feb878f2de23d4753f2fe5270', 0),
(928, '5aae1cf652ba577c27391c9eeab12a08', 0),
(929, '421e4fac4c4edf89dcc7e1e556fd4633', 0),
(930, '78d4f0e53dbe5e4a2e06921ff06a06cf', 0),
(931, 'f357204d3be5ac13982684f39483c503', 0),
(932, '77bb1e6b693f6a5d41dd334f622d1e41', 0),
(933, '615897f76659978b2e15aac34d923a2a', 0),
(934, 'c449f28e2f5d63bb3c218e3745c0b38e', 0),
(935, 'cd7268246cbb9f6aa1d0d724c546a865', 0),
(936, 'a47885a617aaf8beefd4fd556c0d01b8', 0),
(937, 'd78308f2f34eba0574668b9aec2bdaaf', 0),
(938, '1fcd2a9b00f21c260defddea75fd16d5', 0),
(939, 'e0d125acc5a125840e60848bb7b66ff0', 0),
(940, '3382e335b1cf7442a64d401bde6d2d0a', 0),
(941, '2b85405feb1d483f2404d7d6e2f29461', 0),
(942, 'd6f3b820a26f6daff7ea58b813c18768', 0),
(943, 'a2fbd6bea2215928ad9c1975028093c2', 0),
(944, '7c418941694ed746b766d3204767543c', 0),
(945, '3286b3ae1f7cfcfee09521d98cb04729', 0),
(946, '28f692464c84df317fa88c53478ca2e8', 0),
(947, '66976d227c3f2b184e2f074b430695bc', 0),
(948, '2a814115c099f032428da0602f0a0ac8', 0),
(949, '7d883f6d881c80da1a6ec39e04d7e7e9', 0),
(950, '1f1f0ccdeb264bb48b66ebdc3645eed2', 0),
(951, '9cac02790249e7463d5c5dc6de6e2a0d', 0),
(952, '6fd24b8135c76a155a49d1d6c93fca79', 0),
(953, '3c74dcb1cb2ebbddd4f888df93ff559b', 0),
(954, 'c60530228401b3eebf87ef2afc7e295e', 0),
(955, '1305fffe94723197c9567c652d3e5080', 0),
(956, '04d24151556b24ee4feb1381b259f23b', 0),
(957, 'cce53779c7c5a37e405423bb8120de15', 0),
(958, '613529a0214ec9f032a2665f04176064', 0),
(959, '48dac98fe4f18ce8027383fe21caec87', 0),
(960, 'a7eab0adac76180f84d45677b3af7913', 0),
(961, '4b5c7c11494ebb9f929139d6a695eb30', 0),
(962, 'ccb60b0c242949cc3a46886d01456260', 0),
(963, '27bf75aa8a58d0c3a6ce54e9d5ab0e59', 0),
(964, 'd03b2227374eda832b19bf8f01be192d', 0),
(965, '637fdf77b6bf0b493e2eb71108a0bf4c', 0),
(966, '06dc0950f80140caee1424065786814c', 0),
(967, '9d6de51a014627732761f3bd18c42abe', 0),
(968, '2a7bd710328046bfea69d36e7cbdb65a', 0),
(969, '02d531d4b15453b9fb319ccf8ebdc083', 0),
(970, '1b4f0f49e012359fba9c8ec6de54f35b', 0),
(971, '44147d13079152ea0af3472a36573269', 0),
(972, '9d1e8adedae4548d070f905193f25a8a', 0),
(973, '8315ebd6dbcc6c4a621a9327c32bfa70', 0),
(974, 'ad2d2b81c774014c590b28c6567af105', 0),
(975, '4aa0bcf022e3d470e301c719a0a7ee1a', 0),
(976, '779b2f01ae5687b51ef9d53e0137371c', 0),
(977, '336d25231290c8169fe8ca9a5e0bbf3f', 0),
(978, '666e761033057a071b55488e8259e819', 0),
(979, 'bc7d175eccd509f2de52f077c5fea484', 0),
(980, 'a04b64658f758aa16c5a396c3e3d5757', 0),
(981, '01f5f19effb8615f908e3988ee5ac748', 0),
(982, '5c5e9bf31359081ee430923d7d7d6a62', 0),
(983, '396e9fd786b12d9b176950000cc2e220', 0),
(984, 'ca5453cb1e1c2a44b1c058b313d31fd7', 0),
(985, '0c46b21a7ed08ffa7a75bc006f71425d', 0),
(986, '7ef9904c11825fdb8bb9c13b56d0cfc9', 0),
(987, '135d5af4d595f8c0cffdef5f55194223', 0),
(988, '617a31d57194bbf623dbe517b3e8c9dc', 0),
(989, '879bb34176ab0f9274d55e3f33cbb754', 0),
(990, '84683ed0824f0a7abb455d3cb681b1d0', 0),
(991, '5dd43b23190a14f0bd1ad2d71efd9b60', 0),
(992, '0af4dd36f027b0946caa29e4e61390d4', 0),
(993, 'f859e3e6af781f4e4a161db85f9b2547', 0),
(994, 'c34eea6f06894efc46d7360d1b94e72c', 0),
(995, 'de10cda7683527bf8bc8f97160c23f22', 0),
(996, '69b2963b886ab81bcce9956b00c1f178', 0),
(997, '6790b91d029622c0ee54d5c05b1d950d', 0),
(998, '3a225053c991782a81645d7c5d3cc8f5', 0),
(999, 'aaded3bcdacba4a3989e801066217ccb', 0),
(1000, '914441c8a5ab4d3147977810e550e578', 0);

-- Invitation codes redeem logs.
--
-- Contains the redeem logs for the invitation codes.
--
CREATE TABLE `invitation_codes_redeem_logs` (
    `id`                  int           NOT NULL AUTO_INCREMENT            COMMENT 'Primary Key.',
    `invitation_codes_id` smallint      NOT NULL                           COMMENT 'Invitation code ID.',
    `ip`                  varbinary(16) NOT NULL                           COMMENT 'IP that redeemed the code.',
    `date`                timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date when the code was redeemed.',

    CONSTRAINT `invitation_codes_redeem_logs_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Contains the redeem logs for the invitation codes.';

-- Initial dump for the `invitation_codes_redeem_logs` table.

-- Items table.
--
-- Contains server's items.
--
CREATE TABLE `items` (
    `id`          smallint     NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `name`        varchar(255) NOT NULL DEFAULT '',
    `category`    varchar(255) NOT NULL DEFAULT '',
    `description` text         NOT NULL                COMMENT 'Shop description.',
    `price`       int          NOT NULL DEFAULT 0,
    `type`        varchar(255) NOT NULL DEFAULT '',
    `is_elite`    boolean      NOT NULL DEFAULT 0,
    `is_event`    boolean      NOT NULL DEFAULT 0      COMMENT 'Event item.',
    `is_buyable`  boolean      NOT NULL DEFAULT 1      COMMENT 'Buyable in shop',

    CONSTRAINT `items_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Contains server''s items.';

-- Initial dump for the `items` table.
--
INSERT INTO `items` (`id`, `name`, `category`, `description`, `price`, `type`, `is_elite`, `is_buyable`, `is_event`) VALUES
(1, 'Credits', 'currency', 'Credits item.', 0, 'currency', 1, 0, 0),
(2, 'Uridium', 'currency', 'Uridium item.', 0, 'currency', 1, 0, 0),
(3, 'Jackpot', 'currency', 'Jackpot item.', 0, 'currency', 1, 0, 0),
(4, 'Experience', 'currency', 'Experience item.', 0, 'currency', 1, 0, 0),
(5, 'Honor', 'currency', 'Honor item.', 0, 'currency', 1, 0, 0),
(6, 'Jump Voucher', 'currency', 'Jump voucher item.', 0, 'voucher', 0, 0, 0),
(7, 'Repair Voucher', 'currency', 'Repair voucher item.', 0, 'voucher', 0, 0, 0),
(8, 'GalaxyGate Voucher', 'currency', 'GalaxyGate voucher item.', 0, 'voucher', 0, 0, 0),
(9, 'Phoenix', 'ship', 'Phoenix\n\nAll your ships sold off or in hock? Don''t worry - your Company won''t leave you in the lurch!\nThis free beater will let you rise like a phoenix from the ashes of your gambling problem and/or lack of foresight, and will ferry you around until you can afford something better.', 0, '', 0, 1, 0),
(10, 'Yamato', 'ship', 'Yamato\n\nAvailable from special events! Updated, tweaked, and fully upgraded, the classic Yamato is back in business. You can strut your stuff in her, too - you''ll find a [travel mode capacity] under her hood, which will give you a temporary speed boost.', 0, '', 0, 1, 0),
(11, 'Defcom', 'ship', 'Defcom\n\nAvailable from special events! An old-timer spaceship with real vintage style!\nThe Defcom is currently enjoying an impressive revival, and its newest iteration features a cloaking device hidden behind those gorgeous hot-rod lines. No classic ship collection is complete without her!', 0, '', 0, 1, 0),
(12, 'Liberator', 'ship', ' Liberator\n\nYou never forget your first...! No matter whose logo you display, the Liberator is the proven workhorse that shuttled you safely through your first dogfights. This nostalgic little trip down Memory Lane rounds out any collection.', 40000, '', 0, 1, 0),
(13, 'Leonov', 'ship', ' Leonov\n\nThe Leonov is worth every scrap of Uridium asked for her. Versatile, agile, and with an unbeatable home advantage: more cargo space and more speed when you''re in your Company''s sectors! Your Company has your back - and now, you can return the favor!', 15000, '', 1, 1, 0),
(14, 'Piranha', 'ship', 'Piranha\n\nThis ship is a fitting reward for the insanely tough training that Elite pilots survive. Like her namesake, she''s a fast, agile hunter with sharp teeth - only pilots who have proven their worth in the heat of battle can control her!', 100000, '', 0, 1, 0),
(15, 'Nostromo', 'ship', 'Nostromo\n\nThe Nostromo is one of the best ships that Credits can buy. You can even arm her with successively more powerful modifying designs thanks to Lunar Industries'' innovative \"Invite-a-Friend\" bonus program! Easy as pie.', 195000, '', 0, 1, 0),
(16, 'Vengeance', 'ship', 'Vengeance\n\nThe best Star Hunter: you''ll have (almost) nothing to fear in this ship!', 30000, '', 1, 1, 0),
(17, 'BigBoy', 'ship', 'BigBoy\n\nNo fleet worth its salt would dream of trying to do without this ship! It may not be the fastest thing in orbit, but it boasts the most cargo space of any ship available for Credits. That''s true utility!', 285000, '', 1, 1, 0),
(18, 'Goliath', 'ship', 'Goliath\n\nThe ultimate battlecruiser: hot-shot pilots accept no substitutes!', 80000, '', 1, 1, 0),
(19, 'Sepearhead', 'ship', 'Spearhead\n\nAn agile reconnaissance ship, ideal for the ruthless, cold-blooded lone wolf. Spearheads can penetrate unseen deep into enemy territory as scouts, disable enemy ships'' skills, or even mark them for her allies.', 45000, '', 1, 1, 0),
(20, 'Aegis', 'ship', 'Aegis\n\nThe Aegis tips the scales one way or the other in every battle she''s flown in. This versatile engineering ship''s support and repair abilities have often made the difference between defeat and victory - so make sure she''s on your side!', 250000, '', 1, 1, 0),
(21, 'Citadel', 'ship', 'Citadel\n\nA Citadel is often affectionately called a \"Clank Tank\" - or just The Tank - by her crew. She''s a hulking Heavy Cruiser with two rocket launcher slots and various abilities that make her a mobile shield for her allies. Now this bulwark among spaceships can be yours!', 300000, '', 1, 1, 0),
(22, 'Aegis Superelite', 'ship', 'Aegis Elite\n\nLoyal, trustworthy, tough - no pilot could wish for a better support system! This ship has the following abilities: 5% extra damage, 50% longer-lasting repairbots, 20% faster shield repair, and 10% faster HP repair.', 300000, 'aegis_design', 1, 1, 0),
(23, 'Aegis Elite', 'ship', 'Aegis Veteran\n\nBe the shield your allies deserve: the A-Veteran is a beautifully designed support ship, ready to prove her worth in any battle! This ship has the following abilities: 5% bonus to experience and honor points.', 300000, 'aegis_design', 1, 1, 0),
(24, 'Citadel Superelite', 'ship', 'Citadel Elite\n\nThis flying fortress will teach your enemies the true meaning of fear! This ship has the following abilities: 5% extra damage, 50% increased durations of the Protection and Draw Fire abilities, 25% shorter Fortify ability, and 15% shorter Travel ability.', 300000, 'citadel_design', 1, 1, 0),
(25, 'Citadel Elite', 'ship', 'Citadel Veteran\n\nThe uncompromising battlecruiser in which to gain the respect of your allies and sow discord among your enemies! This ship has the following abilities: 5% bonus to experience and honor points.', 300000, 'citadel_design', 1, 1, 0),
(26, 'Sepearhead Superelite', 'ship', 'Spearhead Elite\n\nDo you want a Recon Ship that will meet your exacting standards? The Spearhead Elite is as menacing as it is effective. This ship has the following abilities: 5% extra damage, 50% increased durations of the Ultimate Cloak and Recon abilities, 25% shorter Target Marker ability, and 15% longer cooldown of the JAMX ability.', 45000, 'spearhead_design', 1, 1, 0),
(27, 'Sepearhead Elite', 'ship', 'Spearhead Veteran\n\nA sophisticated Recon Ship for refined pilots. Your enemies won''t see you until it''s too late! This ship has the following abilities: 5% bonus to experience and honor points.', 45000, 'spearhead_design', 1, 1, 0),
(28, 'Bastion', 'ship', 'Goliath Bastion\n\nThis battlecruiser makes itself indispensable in any battle, big or small. Even the fiercest alien threats won''t find you to be easy game when you go up against them in your Bastion. This ship has the following abilities: 10% extra shield power.', 80000, 'goliath_design', 1, 1, 0),
(29, 'Enforcer', 'ship', 'Goliath Enforcer\n\nNo clan can afford not to have this massive ship within its fleet! The brute force of the G-Enforcer sets a new bar for deep-space warfare, and will be the backbone of any raiding party. This ship has the following abilities: 5% extra damage.', 80000, 'goliath_design', 1, 1, 0),
(30, 'Centaur', 'ship', 'No description available.', 80000, 'goliath_design', 1, 1, 0),
(31, 'Saturn', 'ship', 'No description available.', 80000, 'goliath_design', 1, 1, 0),
(32, 'Veteran', 'ship', 'Goliath Veteran\n\nSleek, glossy, and with every detail crafted to the highest standard, this combat vessel is as luxurious and precious as ivory! This ship has the following abilities: 10% bonus to experience.', 80000, 'goliath_design', 1, 1, 0),
(33, 'Exalted', 'ship', 'Goliath Exalted\n\nRed as heart''s blood, this battlecruiser may well have been assembled by the devil''s own shipwright. This is no vessel for a shy pilot! This ship has the following abilities: 10% bonus to honor points.', 80000, 'goliath_design', 1, 1, 0),
(34, 'Solace', 'ship', ' Solace\n\nIn space, no-one can hear you scream... but you can come to the rescue! In the Solace, you''re an oasis and beacon for your allies in a dark, hostile desert. This ship has the following abilities: 10% extra shield power, and the Nano-Cluster Repairer ability, which immediately repairs the hulls of your ship and your group members'' ships!', 80000, 'goliath_design', 1, 1, 0),
(35, 'Venom', 'ship', 'Venom\n\nA leviathan amongst battlecruisers! Sting your foes with its deadly poison and then step back and let the venom do the rest! This ship has the following abilities: 5% extra damage, and the Singularity ability, which will paralyze enemy ships and cause them substantial damage over time!', 80000, 'goliath_design', 1, 1, 0),
(36, 'Spectrum', 'ship', 'Spectrum\n\nThe Spectrum is a kaleidoscope of color to blind your foes. Laser beams roll off of this polished battlecruiser''s hull like water off a duck''s back! This ship has the following abilities: 10% extra shield power, and the Prismatic Shielding ability, which will render enemy laser attacks almost useless, though it also temporarily weakens your own lasers.', 80000, 'goliath_design', 1, 1, 0),
(37, 'Sentinel', 'ship', 'Sentinel\n\nThe Sentinel awes with its futuristic design and robust shields. Fly wing-to-wing with other Sentinels to create an impenetrable shield wall! This ship has the following abilities: 10% extra shield power, and the Fortress ability, which massively increases your shielding for a brief time.', 80000, 'goliath_design', 1, 1, 0),
(38, 'Diminisher', 'ship', 'Diminisher\n\nThe battlecruiser of choice for cunning pilots: first, weaken enemy shields, then let loose with a vicious salvo. This ship has the following abilities: 5% extra damage, and the Weaken Shields ability.', 80000, 'goliath_design', 1, 1, 0),
(39, 'Kick', 'ship', 'Kick\n\nKick design for the Goliath with a 10% shield bonus. Soccer crazy? Then act now and show off your passion for the beautiful game! In comparison to the Bastion, Sentinel, Solace, and Spectrum, the Kick is only comparable to the Bastion since all other designs are skill designs.', 80000, 'goliath_design', 1, 1, 0),
(40, 'Goal', 'ship', 'Goal\n\nGoal design for the Goliath with 10% XP bonus. Soccer crazy? Then act now and bring soccer to space. In comparison to the Veteran, the Goal is its equal, but much harder to get.', 80000, 'goliath_design', 1, 1, 0),
(41, 'Referee', 'ship', 'Referee\n\nReferee design for the Goliath. Exude authority with this design and increase your damage by 5%. In comparison to the Enforcer, Venom, and Diminisher, the Referee is only comparable to the Enforcer since all the other designs are Skill Designs.', 80000, 'goliath_design', 1, 1, 0),
(42, 'Soverign', 'ship', 'No description available.', 80000, 'goliath_design', 1, 1, 0),
(43, 'Peacemaker', 'ship', 'No description available.', 80000, 'goliath_design', 1, 1, 0),
(44, 'Vanquisher', 'ship', 'Vanquisher\n\nA special, limited edition Goliath, the Vanquisher design is only available to pilots who are truly loyal to MMO. It will not only provide a 5% bonus to all Influence earned for MMO, but will also grant a 7% damage bonus against rival human pilots.', 80000, 'goliath_design', 1, 1, 0),
(45, 'Ignite', 'ship', 'No description available.', 80000, 'goliath_design', 1, 1, 0),
(46, 'Surgeon', 'ship', 'No description available.', 80000, 'goliath_design', 1, 1, 0),
(47, 'Adept', 'ship', 'Vengeance Adept\n\nClothes make the man - and the same holds true for the ship and the pilot! A valuable vessel that''s just the ticket for any pilot worth their salt, this ship has the following abilities: 10% bonus to experience.', 80000, 'vengeance_design', 1, 1, 0),
(48, 'Lightning', 'ship', 'Vengeance Lightning\n\nStrike out of a clear blue sky - or the deep black cold of space - and give your enemies an electrifying reception in the Lightning! This ship has the following abilities: 5% extra damage, and the Afterburner ability, which will boost your ship''s speed by 30% for 5 seconds!', 80000, 'vengeance_design', 1, 1, 0),
(49, 'Corsair', 'ship', ' Vengeance Corsair\n\nHonor to whom honor is due: the cool V-Corsair is the starfighter of choice for intergalactic exploits of all kinds! This ship has the following abilities: 10% bonus to honor points.', 80000, 'vengeance_design', 1, 1, 0),
(50, 'Pusat', 'ship', 'Pusat\n\nDeveloped by the brilliant minds on Yeni''turkiye Station, the Pusat Vengeance design features a rich arsenal of lasers and generators for delicious, hard-hitting firepower, at the expense of armour. Strike hard and fast when you''re at its helm.', 80000, '', 1, 1, 0),
(51, 'Revenge', 'ship', 'Vengeance Revenge\n\nThe V-Revenge is best used to deliver the coup de grace that ends a fierce battle, with K.O. power ideal for dealing with dangerous aliens and enemy Clans alike. This ship has the following abilities: 5% extra damage.', 80000, 'vengeance_design', 1, 1, 0),
(52, 'Avenger', 'ship', 'Vengeance Avenger\n\nThe Avenger is a starfighter that''s the complete package, making you a tough nut to crack for enemy pilots and fearsome aliens alike! This ship has the following abilities: 10% extra shield power.', 80000, 'vengeance_design', 1, 1, 0),
(53, 'Police', 'ship', 'No description available.', 0, '', 0, 1, 0),
(54, 'FWX-L', 'ammunition', 'No description available.', 25, 'firework', 1, 1, 0),
(55, 'FWX-M', 'ammunition', 'No description available.', 10, 'firework', 1, 1, 0),
(56, 'FWX-S', 'ammunition', 'No description available.', 250, 'firework', 0, 1, 0),
(57, 'CBO-100', 'ammunition', 'CBO-100\n\nCombo 100 is a rare ammunition that inflicts the damage of the MCB-50 ammo along with half of the SAB-50 ammo''s Shield Leech effect.', 5, 'laser', 1, 1, 1),
(58, 'JOB-100', 'ammunition', 'JOB-100\n\nDie Jack-O-Battery is a rare Halloween Ammo that causes 3.5 times the damage to NPCs and twice the damage to other players.', 10, 'laser', 1, 1, 1),
(59, 'LCB-10', 'ammunition', 'LCB-10\n\nLow efficiency for a low price.', 10, 'laser', 0, 1, 0),
(60, 'MCB-25', 'ammunition', 'MCB-25\n\nMore bang for your buck: x2 laser damage per round.', 0, 'laser', 1, 1, 0),
(61, 'MCB-50', 'ammunition', 'MCB-50\n\nThe best standard laser ammo: x3 laser damage per round.', 1, 'laser', 1, 1, 0),
(62, 'RSB-75', 'ammunition', 'RSB-75\n\nOne type of ammo you just can''t do without: Rain death on your enemies when you fire off a rapid laser salvo.', 5, 'laser', 1, 1, 0),
(63, 'SAB-50', 'ammunition', 'SAB-50\n\nSpecial ammunition that reinforces your Shield, strengthening it by tapping into enemy shields (Shield Leech).', 1, 'laser', 1, 1, 0),
(64, 'UCB-100', 'ammunition', 'No description available.', 3, 'laser', 1, 1, 0),
(65, 'ACM-01', 'ammunition', 'ACM-1\n\nProximity mine: 20% damage upon detonation.', 100, 'mine', 1, 1, 0),
(66, 'DDM-01', 'ammunition', 'Direct-damage mine\n\nProximity mine:\n20% direct damage calculated from ship''s base HP and pilot-bio upgrades - powerful enough to destroy enemy ships entirely!', 250, 'mine', 1, 1, 1),
(67, 'EMPM-01', 'ammunition', 'Anti-cloaking mine\n\nProximity mine: 100% uncloaking upon detonation', 250, 'mine', 1, 1, 1),
(68, 'SABM-01', 'ammunition', 'Anti-shield mine\n\nProximity mine:\n50% shield damage upon detonation; combinable with other mine types.', 250, 'mine', 1, 1, 1),
(69, 'RB-02', 'ammunition', 'No description available.', 1500, 'mine', 0, 1, 0),
(70, 'RB-E01', 'ammunition', 'No description available.', 300, 'mine', 1, 1, 0),
(71, 'RB-E02', 'ammunition', 'No description available.', 2000, 'mine', 0, 1, 0),
(72, 'SL-01', 'ammunition', 'Slowdown Mine\n\nSlows your opponent for 5 seconds by 50%. Furthermore, it takes effect in just 1 second.', 250, 'mine', 1, 1, 1),
(73, 'SLM-01', 'ammunition', 'Slowdown Mine\n\nSlows your opponent for 5 seconds by 50%. Furthermore, it takes effect in just 1 second.', 250, 'mine', 1, 1, 1),
(74, 'BDR-1212', 'ammunition', 'No description available.', 100, 'rocketlauncher', 1, 1, 1),
(75, 'CBR-100', 'ammunition', 'CBR Rocket\n\nThe combo rocket will help you make a name for yourself. A combination of high damage infliction and Shield Leech is a one-two punch your enemies won''t soon forget.', 30, 'rocketlauncher', 1, 1, 1),
(76, 'ECO-10', 'ammunition', 'ECO-10 rocket\n\nThe multi-angle damage rocket for smart spenders. Your toughest enemies won''t stand a chance against the many broadsides of the ECO Hellstorm.', 1500, 'rocketlauncher', 0, 1, 0),
(77, 'HSTRM-01', 'ammunition', 'Hellstorm\n\nDouble the rockets, double the trouble!\nUpon being fired from the rocket launcher, these rockets will rapidly descend upon your enemy and scorch their target with a near apocalyptic explosion. Fired off in a broadside, they will cause even more damage, hitting an enemy ship from multiple sides to weaken its hull structure..', 25, 'rocketlauncher', 1, 1, 1),
(78, 'SAR-01', 'ammunition', 'SAR-01 rocket\n\nThe Hellstorm SAR-01, a Shield Leeching rocket, is fired from a rocket launcher. An especially good quick-strike weapon!', 2000, 'rocketlauncher', 0, 1, 0),
(79, 'SAR-02', 'ammunition', 'SAR-02 rocket\n\nThe Hellstorm SAR-02, a Shield Leeching rocket, is fired from a rocket launcher. An especially good quick-strike weapon!', 10, 'rocketlauncher', 1, 1, 1),
(80, 'SHG-01', 'ammunition', 'No description available.', 2000, 'rocketlauncher', 0, 1, 0),
(81, 'SHG-02', 'ammunition', 'No description available.', 25, 'rocketlauncher', 1, 1, 1),
(82, 'UBR-100', 'ammunition', 'Uber\n\nYour rocket launcher will fire salvos of UBR-100 rockets. Their optimized warheads are at least 80% more effective against aliens, and they also utilize the multi-angle damage feature of conventional Hellstorm rockets.', 30, 'rocketlauncher', 1, 1, 1),
(83, 'BDR-1211', 'ammunition', 'Birthday Rocket\n\nCause extensive damage to aliens of max. 7,500 per shot! On other pilot''s ships, they only cause a max. 4,000 damage per hit.', 10, 'rocket', 1, 1, 1),
(84, 'PLT-2021', 'ammunition', 'PLT-2021\n\nLong-range rocket: causes up to 4,000 points per rocket fired.', 5, 'rocket', 1, 1, 0),
(85, 'PLT-2026', 'ammunition', 'PLT-2026\n\nMid-range rocket: causes up to 2,000 damage points per rocket fired.', 500, 'rocket', 0, 1, 0),
(86, 'PLT-3030', 'ammunition', 'PLT-3030\n\nEach rocket inflicts a max. of 6,000 HP of damage, but has a lower accuracy rate due to its impressive firepower.\nAn exceptional weapon when used in combination with the Tech Center''s precision targeter.', 7, 'rocket', 1, 1, 0),
(87, 'R-310', 'ammunition', 'R310\n\nShort-range rocket: causes up to 1,000 damage points per rocket fired.', 100, 'rocket', 0, 1, 0),
(88, 'DCR-250', 'ammunition', 'Deceleration rockets\n\nHit your opponent with a deceleration rocket to slow them down by 30% for 5 seconds.', 250, 'specialammo', 1, 1, 1),
(89, 'EMP-01', 'ammunition', 'EMP burst\n\nThe EMP burst will release an electromagnetic impulse wave to temporarily short-circuit your enemies'' onboard instruments and disable their targeting devices. If you''re really lucky, the burst will also uncloak them, allowing you to shoot them out of the sky like birds.', 500, 'specialammo', 1, 1, 1),
(90, 'PLD-8', 'ammunition', 'PLD-8\n\nThis plasma charger causes a 40% reduction of your target''s accuracy for 5 seconds.', 100, 'specialammo', 1, 1, 1),
(91, 'WIZ-X', 'ammunition', 'No description available.', 100, 'specialammo', 1, 1, 1),
(92, 'CD-B01', 'booster', 'Cooldown Booster\n\n20% quicker cooldown times for all ship skills. Booster is active for 10 hours of game time after purchase.', 10000, '', 1, 1, 1),
(93, 'CD-B02', 'booster', 'Cooldown Booster\n\n30% quicker cooldown times for all ship skills. Booster is active for 10 hours of game time after purchase.\n\nBooster is active for 10 hours from the time of purchase. It has a 50% maximum boost level.', 10000, '', 1, 1, 0),
(94, 'DMG-B01', 'booster', 'Damage booster\n\n+10% damage for all damage inflicted. Booster is active for 10 hours from the time of purchase.', 10000, '', 1, 1, 0),
(95, 'DMG-B02', 'booster', 'Shared damage booster\n\n\n\n+10% damage for damage inflicted. 5% of bonus damage can be shared with friendly ships nearby\n\nBooster is active for 10 hours from the time of purchase. It has a 50% maximum boost level.', 10000, '', 1, 1, 1),
(96, 'EP-B01', 'booster', 'Experience booster\n\nGives you a 10% EP bonus. Booster is active for 10 hours from the time of purchase.', 10000, '', 1, 1, 0),
(97, 'EP-B02', 'booster', 'Shared EP Booster\n\n+10% EP; 5% of this EP bonus can be shared with friendly ships nearby\n\nBooster is active for 10 hours from the time of purchase. It has a 50% maximum boost level.', 10000, '', 1, 1, 1),
(98, 'HON-B01', 'booster', 'Honor booster\n\n+10% honor; This booster is active for 10 hours from the time of purchase.', 10000, '', 1, 1, 0),
(99, 'HON-B02', 'booster', 'Shared honor booster\n\nGrants a +10% bonus to earning Honor Points, and 5% of that bonus is applied to friendly ships nearby.\n\nBooster is active for 10 hours from the time of purchase. It has a 50% maximum boost level.', 10000, '', 1, 1, 1),
(100, 'HP-B01', 'booster', 'Hit point booster\n\n+10% ship HP; This booster is active for 10 hours from the time of purchase.', 10000, '', 1, 1, 0),
(101, 'HP-B02', 'booster', 'Shared hit points booster\n\nIncreases ship''s maximum HP by 10% and allows you to share 5% of this bonus with friendly ships nearby\n\nBooster is active for 10 hours from the time of purchase. It has a 50% maximum boost level.', 10000, '', 1, 1, 1),
(102, 'REP-B01', 'booster', 'Repair booster\n\n+10% faster ship repairs; This booster is active for 10 hours from the time of purchase.', 10000, '', 1, 1, 0),
(103, 'REP-B02', 'booster', 'Shared repair booster\n\n+10% repair speed; 5% of this bonus can be shared with friendly ships nearby\n\nBooster is active for 10 hours from the time of purchase. It has a 50% maximum boost level.', 10000, '', 1, 1, 1),
(104, 'RES-B01', 'booster', 'Resource booster\n\nThe resource booster increases the number of resources from collected NPC cargo boxes by 25%. Booster is active for 10 hours from the time of purchase.', 10000, '', 1, 1, 0),
(105, 'RES-B02', 'booster', 'Shared resource booster\n\nThe resource booster increases the number of resources from collected NPC cargo boxes by 25% and provides a 10 % of this bonus for friendly ships in the vicinity.\n\nBooster is active for 10 hours from the time of purchase. It has a 100% maximum boost level.', 10000, '', 1, 1, 1),
(106, 'SHD-B01', 'booster', 'Shield booster\n\n+25% shield power; This booster is active for 10 hours from the time of purchase.', 10000, '', 1, 1, 0),
(107, 'SHD-B02', 'booster', 'Shared shield power booster\n\nIncreases ship''s maximum shield power by 25% and allows you to share 10% of this bonus with friendly ships nearby.\n\nBooster is active for 10 hours from the time of purchase. It has a 100% maximum boost level.', 10000, '', 1, 1, 1),
(108, 'SREG-B01', 'booster', 'Shield recharger booster\n\n+25% shield regeneration speed; This booster is active for 10 hours from the time of purchase.', 10000, '', 1, 1, 0),
(109, 'SG3N-A01', 'equipment', 'SG3N-A01 shield\n\n1,000 shield strength / 40% less damage.', 8000, 'generator_shield', 0, 1, 0),
(110, 'SG3N-A02', 'equipment', 'SG3N-A02 shield\n\n2,000 shield strength / 50% less damage.', 16000, 'generator_shield', 0, 1, 0),
(111, 'SG3N-A03', 'equipment', 'SG3N-A03 shield\n\n5,000 shield strength / 60% less damage.', 256000, 'generator_shield', 0, 1, 0),
(112, 'SG3N-B01', 'equipment', 'SG3N-B01 shield\n\n4,000 shield strength / 70% less damage.', 2500, 'generator_shield', 1, 1, 0),
(113, 'SG3N-B02', 'equipment', 'SG3N-B02 shield\n\n10,000 shield strength / 80% less damage.', 10000, 'generator_shield', 1, 1, 0),
(114, 'G3N-1010', 'equipment', 'G3N-1010 speed generator\n\nIncreases ship speed by 2.', 2000, 'generator_speed', 0, 1, 0),
(115, 'G3N-2010', 'equipment', 'G3N-2010 speed generator\n\nIncreases ship speed by 3.', 4000, 'generator_speed', 0, 1, 0),
(116, 'G3N-3210', 'equipment', 'G3N-3210 speed generator\n\nIncreases ship speed by 4.', 8000, 'generator_speed', 0, 1, 0),
(117, 'G3N-3310', 'equipment', 'G3N-3310 speed generator\n\nIncreases ship speed by 5.', 16000, 'generator_speed', 0, 1, 0),
(118, 'G3N-6900', 'equipment', 'G3N-6900 speed generator\n\nIncreases ship speed by 7.', 1000, 'generator_speed', 1, 1, 0),
(119, 'G3N-7900', 'equipment', 'G3N-7900 speed generator\n\nIncreases ship speed by 10.', 2000, 'generator_speed', 1, 1, 0),
(120, 'MP-1', 'equipment', 'MP-1\n\nAverage laser: causes up to 60 damage points per round.', 0, 'weapon_laser', 0, 1, 0),
(121, 'LF-1', 'equipment', 'LF-1\n\nSmall laser: causes up to 40 damage points per round.', 0, 'weapon_laser', 0, 1, 0),
(122, 'LF-2', 'equipment', 'LF-2\n\nStrong laser: causes up to 100 damage points per round.', 0, 'weapon_laser', 0, 1, 0),
(123, 'LF-3', 'equipment', 'LF-3\n\nMuch stronger laser: Causes up to 150 damage points per round.', 0, 'weapon_laser', 0, 1, 0),
(124, 'LF-4', 'equipment', 'LF-4\n\nMuch much stronger laser: Causes up to 200 damage points per round.', 0, 'weapon_laser', 0, 1, 0),
(125, 'HST-1', 'equipment', 'Hellstorm launcher 1\n\nThe rapid reloader!\nThis rocket launcher makes it possible to win a battle before it‘s even begun. One little rocket makes a world of difference on the battlefield - firing up to 3 rockets, this rocket launcher unleashes a broadside of destruction, giving a whole new meaning to the word firepower. This highly sophisticated piece of weaponry can only be equipped with specially designed rockets.', 0, 'weapon_rocketlauncher', 0, 1, 0),
(126, 'HST-2', 'equipment', 'Hellstorm launcher 2\n\nThe rapid reloader!\nThis upgraded version of the Hellstorm launcher 1 makes it possible to win the battle before it‘s even begun. One little rocket makes a world of difference on the battlefield - firing up to 5 rockets, this rocket launcher unleashes a broadside of destruction, giving a whole new meaning to the word firepower. This highly sophisticated piece of weaponry can only be equipped with specially designed rockets.', 0, 'weapon_rocketlauncher', 0, 1, 0),
(127, 'HMD-07', 'equipment', 'HM7 trade drone\n\nWith the HM7 trade drone, you can sell your ore no matter what orbit you''re in. Why waste time going back to the space station?\nValid for 100 transactions.\n\nYou already have an active trade drone. If you buy this trade drone now, you''ll receive 100 more transactions.\n\nOnly one of these items is allowed per configuration.', 10000, 'extra', 1, 1, 0),
(128, 'AIM-01', 'equipment', 'Targeting Guidance CPU 1\n\n25% less chance that lasers will miss their target; 10 Xenomit used per volley\n\nClick on the CPUs button in the shortcut bar to activate targeting guidance. Only one targeting guidance CPU is allowed per configuration.\n\nOnly one of these items is allowed per configuration.', 20000000, 'extra_cpu', 0, 1, 0),
(129, 'AIM-02', 'equipment', 'Targeting Guidance CPU 2\n\n50% less chance that lasers will miss their target; 10 Xenomit used per volley\n\nClick on the CPUs button in the shortcut bar to activate targeting guidance. Only one targeting guidance CPU allowed per configuration.\n\nOnly one of these items is allowed per configuration.', 200000, 'extra_cpu', 1, 1, 0),
(130, 'AJP-01', 'equipment', 'Advanced Jump CPU 1\n\nAllows you to jump to any of the valid target maps. May not be used during battle.\n\nOnly one of these items is allowed per configuration.', 75000, 'extra_cpu', 1, 1, 0),
(131, 'ALB-X', 'equipment', 'Ammunition CPU\n\nAutomatically buys 10,000 laser rounds if less than 1,000 rounds on board. Settings can be adjusted in Hanger/Manage.\n\nOnly one of these items is allowed per configuration.', 15000, 'extra_cpu', 1, 1, 0),
(132, 'ANTI-Z1', 'equipment', 'Serum CPU\n\nThose who fight deadly diseases must be prepared! The Serum CPU will automatically cure you of any infections or parasites.\n\nOnly one of these items is allowed per configuration.', 108, 'extra_cpu', 1, 1, 0),
(133, 'ANTI-Z1 XL', 'equipment', 'Serum CPU XL\n\nWith 10 doses, the Serum CPU XL is your strongest ally against parasites and infections. Cure yourself and other players - before it''s too late!\n\nOnly one of these items is allowed per configuration.', 972, 'extra_cpu', 1, 1, 0),
(134, 'AROL-X', 'equipment', 'Auto Rocket CPU\n\nAutomatic rocket rapid-fire in laser attacks you start\n\nAfter installation is completed, the AROL-X CPU must be activated on the space map in \"CPUs\".\n\nOnly one of these items is allowed per configuration.', 25000, 'extra_cpu', 1, 1, 0),
(135, 'CL04K-M', 'equipment', 'Cloaking CPU\n\n10 ship cloakings (active until your first attack)\n\nWARNING: Enemies can still see cloaked ships on the mini map.\n\nOnly one of these items is allowed per configuration.', 5000, 'extra_cpu', 1, 1, 0),
(136, 'CL04K-XL', 'equipment', 'Cloaking CPU XL\n\nCloak your ship 50 times and stay invisible until you launch an attack yourself.\n\nWARNING: Enemies can still see cloaked ships on the mini map.\n\nOnly one of these items is allowed per configuration.', 22500, 'extra_cpu', 1, 1, 0),
(137, 'CL04K-XS', 'equipment', 'Cloaking Device Type A\n\nShip stays cloaked until your first attack\n\nWARNING: Enemies can still see cloaked ships on the mini map.\n\nOnly one of these items is allowed per configuration.', 500, 'extra_cpu', 1, 1, 0),
(138, 'DR-01', 'equipment', 'Drone Repair CPU 1\n\nThis CPU automatically repairs your drones when they sustain more than 70% damage upon ship destruction, as long as you have enough Uridium or Credits (depends on the drone type). Good for 8 repairs.\n\nOnly one of these items is allowed per configuration.', 150000, 'extra_cpu', 0, 1, 0),
(139, 'DR-02', 'equipment', 'Drone Repair CPU 2\n\nThis CPU automatically repairs your drones when they have received the maximum damage upon ship destruction, as long as you have enough Uridium or Credits (depends on the drone type). Good for 32 repairs.\n\nOnly one of these items is allowed per configuration.', 15000, 'extra_cpu', 1, 1, 0),
(140, 'FB-X', 'equipment', 'Automatic CPU Fuel Assistant\n\nAutomatically buys 10,000 units of P.E.T. fuel when your fuel reserves fall below 1000 units.\n\nOnly one of these items is allowed per configuration.', 5000, 'extra_cpu', 1, 1, 0),
(141, 'G3X-AMRY-L', 'equipment', 'No description available.', 0, 'extra_cpu', 0, 0, 0),
(142, 'G3X-AMRY-M', 'equipment', 'No description available.', 0, 'extra_cpu', 0, 0, 0),
(143, 'G3X-AMRY-S', 'equipment', 'No description available.', 0, 'extra_cpu', 0, 0, 0),
(144, 'G3X-CARGO-X', 'equipment', 'Cargo bay expansion\n\nx2 cargo space thanks to molecular compression\n\nOnly one of these items is allowed per configuration.', 10000, 'extra_cpu', 1, 1, 0),
(145, 'ISH-01', 'equipment', 'Insta-shield CPU\n\n3-second protection against enemies; 10 mines and 100 Xenomit used every time\n\nIt has the same cool-down time as mines.\n\nOnly one of these items is allowed per configuration.', 50000, 'extra_cpu', 1, 1, 0),
(146, 'JP-01', 'equipment', 'Jump CPU 1\n\n10 jumps to X-1 home map. You may not jump from farther out than map X-4 and NOT from PvP maps (4-X). May not be used during battle.\n\nOnly one of these items is allowed per configuration.', 150000, 'extra_cpu', 0, 1, 0),
(147, 'JP-02', 'equipment', 'Jump CPU 2\n\nJump to X-1 home map, works everywhere except the pirate sector. 20 total jumps. May not be used during battle.\n\nOnly one of these items is allowed per configuration.', 15000, 'extra_cpu', 1, 1, 0),
(148, 'MIN-T01', 'equipment', 'Turbo Mine CPU 1\n\n25% less cool-down time for mines and items made from mines\n\nOnly one of these items is allowed per configuration.', 5000000, 'extra_cpu', 0, 1, 0),
(149, 'MIN-T02', 'equipment', 'Turbo Mine CPU 2\n\n50% less cool-down time for mines and items made from mines\n\nOnly one of these items is allowed per configuration.', 25000, 'extra_cpu', 1, 1, 0),
(150, 'NC-AGB-X', 'equipment', 'Generator Boost CPU\n\nAutomatically gives your generators a boost using the best resources available\n\nOnly one of these items is allowed per configuration.', 15000, 'extra_cpu', 1, 1, 0),
(151, 'NC-AWB-X', 'equipment', 'Lab CPU\n\nBoosts rockets and lasers with raw materials currently in lab use\n\nOnly one of these items is allowed per configuration.', 10000, 'extra_cpu', 1, 1, 0),
(152, 'NC-AWL-X', 'equipment', 'Lab CPU 3\n\nBoosts lasers with raw materials currently in lab use\n\nOnly one of these items is allowed per configuration.', 150000, 'extra_cpu', 0, 1, 0),
(153, 'NC-AWR-X', 'equipment', 'Lab CPU 2\n\nBoosts rockets with raw materials currently in lab use\n\nOnly one of these items is allowed per configuration.', 150000, 'extra_cpu', 0, 1, 0),
(154, 'NC-RRB-X', 'equipment', 'Repair-bot Auto CPU\n\nAuto-activates a repair robot available\n\nOnly one of these items is allowed per configuration.', 10000, 'extra_cpu', 1, 1, 0),
(155, 'RB-X', 'equipment', 'Rocket CPU\n\nAutomatically buys 500 rockets of the selected rocket type when you have less than 100 left on board. To set the rocket type, click on Hangar/Manage.\n\nOnly one of these items is allowed per configuration.', 15000, 'extra_cpu', 1, 1, 0),
(156, 'RD-X', 'equipment', 'Radar CPU\n\nDisplays diplomacy status on mini map\n\nOnly one of these items is allowed per configuration.', 15000, 'extra_cpu', 1, 1, 0),
(157, 'RLLB-X', 'equipment', 'Rocket-launcher CPU\n\nThe rocket-launcher CPU automatically reloads your rocket launcher with a specified rocket type to rain fire on your enemies when you launch a laser attack.\n\nAfter installation is completed, the RL-LB1 CPU must be activated on the space map in \"CPUs\".\n\nOnly one of these items is allowed per configuration.', 25000, 'extra_cpu', 1, 1, 0),
(158, 'ROK-T01', 'equipment', 'Rocket Turbo\n\nDoubles rocket firing speed\n\nOnly one of these items is allowed per configuration.', 10000, 'extra_cpu', 1, 1, 0),
(159, 'SLE-01', 'equipment', 'Slot CPU 1\n\n+2 new slots for extras.\n\nOnly one of these items is allowed per configuration.', 600000, 'extra_cpu', 1, 1, 0),
(160, 'SLE-02', 'equipment', 'Slot CPU 2\n\n+4 new slots for extras.\n\nOnly one of these items is allowed per configuration.', 75000, 'extra_cpu', 1, 1, 0),
(161, 'SLE-03', 'equipment', 'Slot CPU 3\n\n+6 new slots for extras.\n\nOnly one of these items is allowed per configuration.', 150000, 'extra_cpu', 1, 1, 0),
(162, 'SLE-04', 'equipment', 'Slot CPU 4\n\n+10 new slots for extras.\n\nOnly one of these items is allowed per configuration.', 250000, 'extra_cpu', 1, 1, 0),
(163, 'SMB-01', 'equipment', 'Smart Bomb CPU\n\nInstant bomb made from 10 mines and 100 Xenomit; doesn''t cause any damage to your ship.\n\nIt has the same cool-down time as mines.\n\nOnly one of these items is allowed per configuration.', 50000, 'extra_cpu', 1, 1, 0),
(164, 'REP-1', 'equipment', 'Repair Robot 1\n\nThis repair bot recovers your ship''s hull in 165 seconds.\n\nOnly one of these items is allowed per configuration.', 10000, 'extra_repbot', 0, 1, 0),
(165, 'REP-2', 'equipment', 'Repair Robot 2\n\nThis repair bot recovers your ship''s hull in 120 seconds.\n\nOnly one of these items is allowed per configuration.', 64000, 'extra_repbot', 0, 1, 0),
(166, 'REP-3', 'equipment', 'Repair Robot 3\n\nThis repair bot recovers your ship''s hull in 105 seconds.\n\nOnly one of these items is allowed per configuration.', 5000, 'extra_cpu', 1, 1, 0),
(167, 'REP-4', 'equipment', 'Repair robot 4\n\nThis repair bot recovers your ship''s hull in 90 seconds.\n\nOnly one of these items is allowed per configuration.', 20000, 'extra_repbot', 1, 1, 0),
(168, 'BOOTY-KEY', 'deal', 'No description available.', 10000, '', 1, 1, 1),
(169, 'BOOTY-KEY-BLUE', 'deal', 'No description available.', 10000, '', 1, 1, 1),
(170, 'BOOTY-KEY-RED', 'deal', 'No description available.', 0, '', 1, 1, 1),
(171, 'EXTRA-ENERGY', 'deal', 'No description available.', 10000, '', 1, 1, 1),
(172, 'JUMP-VOUCHERS', 'deal', 'No description available.', 10000, '', 1, 1, 1),
(173, 'LOGFILE', 'deal', 'No description available.', 10000, '', 1, 1, 1),
(174, 'PET', 'deal', 'No description available.', 10000, '', 1, 1, 1),
(175, 'PET-10', 'pet', 'No description available.', 50000, '', 1, 1, 0),
(176, 'G-HP1', 'pet', 'P.E.T. hull upgrade\n\nReinforces your P.E.T.''s hull and increases its HP', 5000, '', 1, 1, 0),
(177, 'Fuel 100', 'pet', 'P.E.T. fuel\n\nYour P.E.T. only runs when it''s got fuel.', 1, '', 1, 1, 0),
(178, 'CSR-02', 'pet', 'Combo Repair Gear (Level: 1)\n\nEffect: Repairs 10000 HP per second.\nDuration: 5 seconds\nDeflection chance: 65%\nConsumption: 200 Fuel\n\nRepairs your ship during flight. Uses extra fuel for each repair.\n\nProtects your pet from attacks.', 20000, 'petgear', 1, 1, 0),
(179, 'CGM-02', 'pet', 'Combo Guard Mode Gear (Level: 1)\n\nDeflection chance: 65%\nAdditional consumption: 35% Extra-Fuel\n\nConnects the Guard Mode to the new Insta Shield. Uses 35% more fuel when it''s been activated.\n\nGuard mode with an extra shield for the P.E.T.\n', 20000, 'petgear', 0, 1, 0),
(180, 'G-AL1', 'pet', 'Auto-looter (Level: 1)\n\nRange: 700\n\nOnce you activate this P.E.T gear, it will automatically collect bonus boxes and cargo boxes within close range.\n\nYour P.E.T can only be attacked by other players while it is collecting loot. Aliens cannot attack it.', 7500, 'petgear', 1, 1, 0),
(181, 'G-AR1', 'pet', 'Auto-resource collector (Level: 1)\n\nRange: 700\n\nOnce you activate this P.E.T. gear, your P.E.T will automatically collect resources within close range.\n\nYour P.E.T can only be attacked by other players while collecting loot. Aliens cannot attack it.\n', 2500, 'petgear', 1, 1, 0),
(182, 'G-EL1', 'pet', 'Enemy locator (Level: 1)\n\nRange: 2000\n\nOutfit your P.E.T with this gear and it''ll automatically pinpoint every alien in the current star system.', 6000, 'petgear', 1, 1, 0),
(183, 'G-RL1', 'pet', 'Resource locator (Level: 1)\n\nRange: 2000\n\nWith this gear on board your P.E.T., it will be able to track down nearby resources in the current star system.', 2500, 'petgear', 1, 1, 0),
(184, 'G-TRA1', 'pet', 'Cargo trader (Level: 1)\n\nTrade bonus: +5%\n\nThe cargo trader makes it possible for your P.E.T. to trade cargo from anywhere in the galaxy at anytime.', 6000, 'petgear', 1, 1, 0),
(185, 'G-REP1', 'pet', 'P.E.T. repairer (Level: 1)\n\nEffect: Repairs 2000 HP per second.\nDuration: 120 seconds\n\nThe P.E.T. repairer will fix your P.E.T.\n\nNot made for use in combat.\n', 2500, 'petgear', 1, 1, 0),
(186, 'G-KK1', 'pet', 'Kamikaze Detonator (Level: 1)\n\nEffect: Causes 25000 splash damage upon exploding.\nRadius: 250\n\nWhen your P.E.T. or ship is close to being destroyed, the Kamikaze Detonator will start the self-destruct sequence and explode, thereby taking out all enemies in the immediate vicinity.\n\nAfter the detonator has gone off, your P.E.T. will be massively damaged and have to be repaired.', 7500, 'petgear', 1, 1, 0),
(187, 'AI-CR1', 'pet', 'Cargo protocol (Level: 1)\n\nEffect: Increases the cargo space by 3%\n\nThe cargo protocol expands your cargo bay.', 3000, 'aiprotocol', 1, 1, 0),
(188, 'AI-R1', 'pet', 'Radar protocol (Level: 1)\n\nEffect: Increases your P.E.T. radar''s range by 2%\n\nThe radar protocol extends your P.E.T. radar''s range. It will also increase the effectiveness of your P.E.T. collector and enemy locator gear.', 3000, 'aiprotocol', 1, 1, 0),
(189, 'AI-S1', 'pet', 'Salvage protocol (Level: 1)\n\nEffect: Increases the reward from boxes by 1%\n\nThe salvage protocol increases rewards for bonus and cargo boxes collected by your P.E.T.', 5000, 'aiprotocol', 1, 1, 0),
(190, 'AI-SM1', 'pet', 'Shield protocol (Level: 1)\n\nEffect: Increases the shield strength by 1%\n\nThe shield protocol boosts your P.E.T.''s shield power.', 5000, 'aiprotocol', 1, 1, 0),
(191, 'AI-LM1', 'pet', 'Laser Gun Protocol (Level: 1)\n\nEffect: Increases laser damage by 1%\n\nThe Laser Gun Protocol lets your P.E.T. cause more laser damage.', 5000, 'aiprotocol', 1, 1, 0),
(192, 'AI-AIM1', 'pet', 'Targeting protocol (Level: 1)\n\nEffect: Increases laser precision by 1%\n\nThe targeting protocol improves the accuracy of your P.E.T''s lasers.', 3000, 'aiprotocol', 1, 1, 0),
(193, 'AI-E1', 'pet', 'Evasion protocol (Level: 1)\n\nEffect: Decreases enemy hit chances by 1%\n\nThe evasion protocol makes it harder for your enemies to destroy your P.E.T. Their chances of scoring a hit will be lower.', 5000, 'aiprotocol', 1, 1, 0),
(194, 'AI-HP1', 'pet', 'HP protocol (Level: 1)\n\nEffect: Increases the hit points by 1%\n\nThe HP protocol gives your P.E.T more HP.', 5000, 'aiprotocol', 1, 1, 0),
(195, 'AI-AL1', 'pet', 'Alien protocol (Level: 1)\n\nEffect: Increases damage to aliens by 1%\n\nThe alien protocol enables your P.E.T. to inflict more damage to aliens.', 3000, 'aiprotocol', 1, 1, 0),
(196, 'AI-ECO1', 'pet', 'Fuel protocol (Level: 1)\n\nEffect: Decreases fuel consumption by 1%\n\nWith the fuel protocol, your P.E.T. will use less fuel.', 5000, 'aiprotocol', 1, 1, 0),
(197, 'Havoc', 'drone', 'No description available.', 50000, 'designs', 1, 1, 1),
(198, 'Hercules', 'drone', 'No description available.', 75000, 'designs', 1, 1, 1),
(199, 'Flax', 'drone', 'Flax\n\nStarter drone with one slot.', 100000, '', 0, 1, 0),
(200, 'Iris', 'drone', 'Iris\n\nPower drone with two slots.', 15000, '', 1, 1, 0),
(201, 'Apis', 'drone', 'Apis\n\nApis drone with two slots.', 1100000, '', 1, 1, 0),
(202, 'Zeus', 'drone', 'Zeus\n\nZeus drone with two slots.', 1500000, '', 1, 1, 0),
(203, 'F-01-TU', 'drone', '', 1000000, 'formation', 0, 1, 0),
(204, 'F-02-AR', 'drone', '', 1000000, 'formation', 0, 1, 0),
(205, 'F-03-LA', 'drone', 'No description available.', 100000, 'formation', 1, 0, 0),
(206, 'F-04-ST', 'drone', 'Star Formation\n\nAugment your drone control unit with the Star Formation.\n\nIncreases rocket damage by 25%, but rocket launcher reload time increases by 33%, as well.\n\nAs long as you have 4 or more drones, you can use this formation any time after you‘ve purchased it.', 75000, 'formation', 1, 1, 0),
(207, 'F-05-PI', 'drone', 'Pincer Formation\n\nAugment your drone control unit with the Pincer Formation.\n\nIncreases laser damage by 3% against other players and provides an additional 5% honor point bonus. However, it reduces shield penetration by 10%.\n\nAs long as you have 4 or more drones, you can use this formation any time after you‘ve purchased it.', 100000, 'formation', 1, 1, 0),
(208, 'F-06-DA', 'drone', 'Double Arrow Formation\n\nAugment your drone control unit with the Double Arrow Formation.\n\nIncreases shield penetration by 10%, but reduces shield power by 20%.\n\nAs long as you have 4 or more drones, you can use this formation any time after you‘ve purchased it.', 75000, 'formation', 1, 1, 0),
(209, 'F-07-DI', 'drone', 'Diamond Formation\n\nAugment your drone control unit with the Diamond Formation.\n\nYour shield regenerates 1% of your max shield power per second, up to a maximum of 5,000 per second. But hit points are reduced by 30%.\n\nAs long as you have 4 or more drones, you can use this formation any time after you‘ve purchased it.', 100000, 'formation', 1, 1, 0),
(210, 'F-08-CH', 'drone', 'Chevron Formation\n\nAugment your drone control unit with the Chevron Formation.\n\nIncreases rocket damage by 50%, but reduces ship hit points by 20%.\n\nAs long as you have 4 or more drones, you can use this formation any time after you‘ve purchased it.', 75000, 'formation', 1, 1, 0),
(211, 'F-09-MO', 'drone', 'Moth Formation\n\nAugment your drone control unit with the Moth Formation.\n\nIncreases shield penetration by 20%. Hit points are also increased by 20%. But it weakens your shield strength at a rate of 1% per second.\n\nAs long as you have 4 or more drones, you can use this formation any time after you‘ve purchased it.', 100000, 'formation', 1, 1, 0),
(212, 'F-10-CR', 'drone', 'Crab Formation\n\nAugment your drone control unit with the Crab Formation.\n\nIncreases shield absorption by 20%, but reduces speed by 20%.\n\nAs long as you have 4 or more drones, you can use this formation any time after you‘ve purchased it.', 100000, 'formation', 1, 1, 0),
(213, 'F-11-HE', 'drone', 'Heart Formation\n\nAugment your drone control unit with the Heart Formation.\n\nIncreases your shield power by 10% and your hit points by 20%. Laser damage is, however, reduced by 5%.\n\nAs long as you have 4 or more drones, you can use this formation any time after you‘ve purchased it.', 100000, 'formation', 1, 1, 0),
(214, 'F-12-BA', 'drone', 'Barrage Formation\n\nAugment your drone control unit with the Barrage Formation.\n\nIncreases laser damage to NPCs by 5% and provides an additional 5% XP from NPC kills. Shield Leech will, however, be reduced by 15%.\n\nAs long as you have 4 or more drones, you can use this formation any time after you‘ve purchased it.', 100000, 'formation', 1, 1, 0),
(215, 'F-13-BT', 'drone', 'Bat Formation\n\nAugment your drone control unit with the Bat Formation.\n\nIncrease damage to NPCs by 8% and earn 8% more XP; however, your speed will be reduced by 15%.\n\nAs long as you have 6 or more drones, you can use this formation any time after you‘ve purchased it. This formation is not available all the time, so grab it while you can!', 150000, 'formation', 1, 1, 1),
(216, 'F-14-RG', 'drone', 'Ring Formation\n\nThis formation has a special look in the 3D client.\n\nAugment your drone control unit with the Ring Formation.\n\nShield points are increased by 120%; however, speed is reduced by 5%, laser damage is reduced by 25%, and cooldown times for rockets and rocket launchers are increased by 25%.\n\nAs long as you have 4 or more drones, you can use this formation any time after you‘ve purchased it.', 1500000, 'formation', 1, 1, 0),
(217, 'F-15-DL', 'drone', 'Drill Formation\n\nThis formation has a special look in the 3D client.\n\nAugment your drone control unit with the Drill Formation.\n\nLaser damage is increased by 20%; however, shield points are reduced by 25%, shield spread by 5%, and speed by 5%.\n\nAs long as you have 4 or more drones, you can use this formation any time after you‘ve purchased it.', 150000, 'formation', 1, 1, 0),
(218, 'F-16-VT', 'drone', 'Veteran Formation\n\nThis formation has a special look in the 3D client.\n\nAugment your drone control unit with the Veteran Formation.\n\nHonor is increased by 20%; however, laser damage, hit points, and shield points are all decreased by 20%.\n\nAs long as you have 4 or more drones, you can use this formation any time after you‘ve purchased it.', 150000, 'formation', 1, 1, 0),
(219, 'F-17-DM', 'drone', 'Dome Formation\n\nThis formation has a special look in the 3D client.\n\nAugment your drone control unit with the Dome Formation.\n\nShield points are increased by 30% and regenerate by 0.5% per second. Cooldown times for rockets and rocket launchers are reduced by 25%; however, laser damage and speed are both reduced by 50%.\n\nAs long as you have 4 or more drones, you can use this formation any time after you‘ve purchased it.', 150000, 'formation', 1, 1, 0),
(220, 'F-18-DW', 'drone', 'Wheel Formation\n\nThis formation has a special look in the 3D client.\n\nAugment your drone control unit with the Wheel Formation.\n\nSpeed is increased by 5%; however, laser damage is reduced by 20%, and this formation drains shields by 5% per second.\n\nAs long as you have 4 or more drones, you can use this formation any time after you‘ve purchased it.', 150000, 'formation', 1, 1, 0),
(221, 'F-19-X', 'drone', 'X Formation\n\nThis formation has a special look in the 3D client.\n\nAugment your drone control unit with the X Formation.\n\n-100% honor rewarded\n\nYour lasers cause no damage to enemy players\n\n+5% Laser Damage against aliens\n\n+5% XP from aliens\n\n+8% HP\n\nAs long as you have 4 or more drones, you can use this formation any time after you‘ve purchased it.', 300000, 'formation', 0, 1, 0),
(222, 'F-20-WV', 'drone', 'Wave Formation\n\nThis formation has a special look in the 3D client.\n\nJazz up your drones with the Wave Formation!\n\nDrones will make waves, but otherwise this formation grants neither benefits nor penalties.\n\nAs long as you have 4 or more drones, you can use this formation any time after you‘ve purchased it.', 4950000, 'formation', 0, 1, 0),
(223, 'Prismatic Socket', 'resource', 'Prismatic Socket\n\nWith this prismatic socket, slack joints and jamming are a thing of the past! It''s also used to produce high-tech items in the Assembly.', 20000, '', 1, 1, 0),
(224, 'High-Frequency Cable', 'resource', 'High-Frequency Cable\n\nThis nano-based high-frequency cable is essential for signaling and measurement, and is used to produce high-tech items in the Assembly.', 5000, '', 1, 1, 0),
(225, 'Hybrid Processor', 'resource', 'Hybrid Processor\n\nEven the Kristallon have taken note of this small gadget''s unique processing power. It''s used to produce high-tech items in the Assembly.', 40000, '', 1, 1, 0),
(226, 'Micro-transistors', 'resource', 'Micro-transistors\n\nNo micro-transistors, no modern microelectronics! These small units are everywhere, and are used to produce high-tech items in the Assembly.', 40000, '', 1, 1, 0),
(227, 'Nano Condenser', 'resource', 'Nano Condenser\n\nWith its unmatched memory capacities, the nano condenser is a must for every space ship. It''s used to produce high-tech items in the Assembly.', 20000, '', 1, 1, 0),
(228, 'Nano Case', 'resource', 'Nano Case\n\nIt may not look like much, but this nano case will protect your sensitive electronics, no matter what. It''s also used to produce high-tech items in the Assembly.', 5000, '', 1, 1, 0),
(229, 'LGF', 'resource', 'Log-disks\n\nLog-disks can be exchanged for pilot points.', 300, '', 1, 1, 0),
(230, 'BK-100', 'resource', 'Green Booty Key\n\nUsed to open pirate booty and collect the valuable treasure contained within.', 1500, '', 1, 1, 0),
(231, 'BK-101', 'resource', 'No description available.', 0, '', 1, 0, 0),
(232, 'BK-102', 'resource', 'No description available.', 0, '', 1, 0, 0),
(233, 'Lottery Euro', 'resource', 'No description available.', 0, '', 1, 0, 0),
(234, 'Apis Part', 'resource', 'No description available.', 0, 'blueprint', 1, 0, 0),
(235, 'Zeus Part', 'resource', 'No description available.', 0, 'blueprint', 1, 0, 0),
(236, 'Prometium', 'resource', 'No description available.', 0, 'ore', 0, 0, 0),
(237, 'Endurium', 'resource', 'No description available.', 0, 'ore', 0, 0, 0),
(238, 'Terbium', 'resource', 'No description available.', 0, 'ore', 0, 0, 0),
(239, 'Prometid', 'resources', 'No description available.', 0, 'ore', 0, 0, 0),
(240, 'Duranium', 'resources', 'No description available.', 0, 'ore', 0, 0, 0),
(241, 'Xenomit', 'resource', 'No description available.', 0, 'ore', 0, 0, 0);
INSERT INTO `items` (`id`, `name`, `category`, `description`, `price`, `type`, `is_elite`, `is_buyable`, `is_event`) VALUES
(242, 'Promerium', 'resource', 'No description available.', 0, 'ore', 0, 0, 0),
(243, 'Seprom', 'resource', 'No description available.', 0, 'ore', 0, 0, 0),
(244, 'Palladium', 'resource', 'No description available.', 0, 'ore', 0, 0, 0),
(245, 'A', 'resource', 'No description available.', 0, 'wordpuzzle-letter', 0, 0, 0),
(246, 'B', 'resource', 'No description available.', 0, 'wordpuzzle-letter', 0, 0, 0),
(247, 'C', 'resource', 'No description available.', 0, 'wordpuzzle-letter', 0, 0, 0),
(248, 'D', 'resource', 'No description available.', 0, 'wordpuzzle-letter', 0, 0, 0),
(249, 'E', 'resource', 'No description available.', 0, 'wordpuzzle-letter', 0, 0, 0),
(250, 'F', 'resource', 'No description available.', 0, 'wordpuzzle-letter', 0, 0, 0),
(251, 'G', 'resource', 'No description available.', 0, 'wordpuzzle-letter', 0, 0, 0),
(252, 'H', 'resource', 'No description available.', 0, 'wordpuzzle-letter', 0, 0, 0),
(253, 'I', 'resource', 'No description available.', 0, 'wordpuzzle-letter', 0, 0, 0),
(254, 'K', 'resource', 'No description available.', 0, 'wordpuzzle-letter', 0, 0, 0),
(255, 'L', 'resource', 'No description available.', 0, 'wordpuzzle-letter', 0, 0, 0),
(256, 'N', 'resource', 'No description available.', 0, 'wordpuzzle-letter', 0, 0, 0),
(257, 'O', 'resource', 'No description available.', 0, 'wordpuzzle-letter', 0, 0, 0),
(258, 'P', 'resource', 'No description available.', 0, 'wordpuzzle-letter', 0, 0, 0),
(259, 'R', 'resource', 'No description available.', 0, 'wordpuzzle-letter', 0, 0, 0),
(260, 'S', 'resource', 'No description available.', 0, 'wordpuzzle-letter', 0, 0, 0),
(261, 'T', 'resource', 'No description available.', 0, 'wordpuzzle-letter', 0, 0, 0),
(262, 'W', 'resource', 'No description available.', 0, 'wordpuzzle-letter', 0, 0, 0),
(263, 'Blank', 'resource', 'No description available.', 0, 'wordpuzzle-letter', 0, 0, 0),
(264, 'Prismatium', 'resource', 'No description available.', 0, 'collectable', 0, 0, 0),
(265, 'Proxium', 'resource', 'No description available.', 0, 'collectable', 0, 0, 0),
(266, 'Quadrothrin', 'resource', 'No description available.', 0, 'collectable', 0, 0, 0),
(267, 'Schism', 'resource', 'No description available.', 0, 'collectable', 0, 0, 0),
(268, 'Scrapium', 'resource', 'No description available.', 0, 'collectable', 0, 0, 0),
(269, 'Tetrathrin', 'resource', 'No description available.', 0, 'collectable', 0, 0, 0),
(270, 'Trittothrin', 'resource', 'No description available.', 0, 'collectable', 0, 0, 0),
(271, 'Recipe Default', 'recipes', 'No description available.', 0, '', 0, 0, 0),
(272, 'REPM-1', 'module', 'Repairs Battle Stations over time.', 0, '', 0, 0, 0),
(273, 'XPM-1', 'module', 'This valuable module increases the experience gained by your clan members. The best of both worlds!', 0, '', 0, 0, 0),
(274, 'DEFM-1', 'module', 'This crucial module is required for building a Battle Station and provides an invulnerable deflector, whilst active. Get it now!', 0, '', 0, 0, 0),
(275, 'DMGM-1', 'module', 'Increases damage from weapon modules', 0, '', 0, 0, 0),
(276, 'HULM-1', 'module', 'This essential module is required for building a Battle Station, provides its hull strength, and can be used to upgrade the HP as well.', 0, '', 0, 0, 0),
(277, 'HONM-1', 'module', 'All Clan members receive more honor points', 0, '', 0, 0, 0),
(278, 'LTM-LR', 'module', 'Laser Module with limited range.', 0, '', 0, 0, 0),
(279, 'LTM-MR', 'module', 'Laser Module with average range.', 0, '', 0, 0, 0),
(280, 'RAM-LA', 'module', 'Rocket Module with limited precision.', 0, '', 0, 0, 0),
(281, 'RAM-MA', 'module', 'Rocket Module with average precision.', 0, '', 0, 0, 0),
(282, 'Alpha Part', 'galaxygate', 'Alpha gate part.', 0, '', 0, 0, 0),
(283, 'Beta Part', 'galaxygate', 'Beta gate part', 0, '', 0, 0, 0),
(284, 'Gamma Part', 'galaxygate', 'Gamma gate part.', 0, '', 0, 0, 0),
(285, 'Delta Part', 'galaxygate', 'Delta gate part.', 0, '', 0, 0, 0),
(286, 'Epsilon Part', 'galaxygate', 'Epsilon gate part.', 0, '', 0, 0, 0),
(287, 'Zeta Part', 'galaxygate', 'Zeta gate part.', 0, '', 0, 0, 0),
(288, 'Kappa Part', 'galaxygate', 'Kappa gate part.', 0, '', 0, 0, 0),
(289, 'Lambda Part', 'galaxygate', 'Lambda gate part.', 0, '', 0, 0, 0),
(290, 'Hades Part', 'galaxygate', 'Hades gate part.', 0, '', 0, 0, 0),
(291, 'Kuiper Part', 'galaxygate', 'Kuiper gate part.', 0, '', 0, 0, 0);

-- Key-Value table.
--
-- Contains simple Key -> Value entries.
--
CREATE TABLE `key_value` (
    `key`   varchar(255) NOT NULL DEFAULT '',
    `value` varchar(255) NOT NULL DEFAULT '',

    CONSTRAINT `key_value_pk` PRIMARY KEY (`key`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Contains simple Key -> Value entries.';

-- Initial dump for the `key_value` table.

-- Levels table.
--
-- Contains server's levels.
--
CREATE TABLE `levels` (
    `id`      tinyint  NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `account` bigint   NOT NULL DEFAULT 0      COMMENT 'Experience needed for an account to reach this level.',
    `drone`   smallint NOT NULL DEFAULT -1     COMMENT 'Experience needed for a drone to reach this level',
    `pet`     int      NOT NULL DEFAULT -1     COMMENT 'Experience needed for a PET to reach this level.',
    `damage`  float    NOT NULL DEFAULT 0.0    COMMENT 'Damage bonus applied for an item at this level.',
    `shield`  float    NOT NULL DEFAULT 0.0    COMMENT 'Shield bonus applied to an item at this level.',

    CONSTRAINT `levels_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Contains server''s levels.';

CREATE  UNIQUE INDEX `levels_account_idx` ON `levels` (`account`);

-- Initial dump for the `levels` table.
--
INSERT INTO `levels` (`id`, `account`, `drone`, `pet`, `damage`, `shield`) VALUES
(1,  0,                0,    8000,     0.00, 0.00),
(2,  10000,            100,  64000,    0.00, 0.00),
(3,  20000,            200,  216000,   0.00, 0.00),
(4,  40000,            400,  512000,   0.00, 0.00),
(5,  80000,            800,  1000000,  0.00, 0.00),
(6,  160000,           1600, 1728000,  0.00, 0.00),
(7,  320000,           -1,   2744000,  0.00, 0.00),
(8,  640000,           -1,   4096000,  0.00, 0.00),
(9,  1280000,          -1,   5832000,  0.00, 0.00),
(10, 2560000,          -1,   8000000,  0.00, 0.00),
(11, 5120000,          -1,   10648000, 0.00, 0.00),
(12, 10240000,         -1,   13824000, 0.00, 0.00),
(13, 20480000,         -1,   17576000, 0.00, 0.00),
(14, 40960000,         -1,   21952000, 0.00, 0.00),
(15, 81920000,         -1,   27000000, 0.00, 0.00),
(16, 163840000,        -1,   -1,       0.00, 0.00),
(17, 327680000,        -1,   -1,       0.00, 0.00),
(18, 655360000,        -1,   -1,       0.00, 0.00),
(19, 1310720000,       -1,   -1,       0.00, 0.00),
(20, 2621440000,       -1,   -1,       0.00, 0.00),
(21, 5242880000,       -1,   -1,       0.00, 0.00),
(22, 10485760000,      -1,   -1,       0.00, 0.00),
(23, 20971520000,      -1,   -1,       0.00, 0.00),
(24, 41943040000,      -1,   -1,       0.00, 0.00),
(25, 83886080000,      -1,   -1,       0.00, 0.00),
(26, 167772160000,     -1,   -1,       0.00, 0.00),
(27, 335544320000,     -1,   -1,       0.00, 0.00),
(28, 671088640000,     -1,   -1,       0.00, 0.00),
(29, 1342177280000,    -1,   -1,       0.00, 0.00),
(30, 2684354560000,    -1,   -1,       0.00, 0.00),
(31, 5368709120000,    -1,   -1,       0.00, 0.00),
(32, 10737418240000,   -1,   -1,       0.00, 0.00),
(33, 21474836480000,   -1,   -1,       0.00, 0.00),
(34, 42949672960000,   -1,   -1,       0.00, 0.00),
(35, 85899345920000,   -1,   -1,       0.00, 0.00),
(36, 171798691840000,  -1,   -1,       0.00, 0.00),
(37, 343597383680000,  -1,   -1,       0.00, 0.00),
(38, 687194767360000,  -1,   -1,       0.00, 0.00),
(39, 1374389534720000, -1,   -1,       0.00, 0.00),
(40, 2748779069440000, -1,   -1,       0.00, 0.00);

-- Level upgrades table.
--
-- Contains the upgrade costs for each level.
--
CREATE TABLE `levels_upgrades` (
    `id`          int      NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `levels_id`   tinyint  NOT NULL                COMMENT 'The upgrade level.',
    `probability` tinyint  NOT NULL DEFAULT 5      COMMENT 'Probability level.',
    `credits`     int      NOT NULL DEFAULT 0      COMMENT 'Credits needed to upgrade to this level with given probability.',
    `uridium`     smallint NOT NULL DEFAULT 0      COMMENT 'Uridium needed to upgrade to this level with given probability.',

    CONSTRAINT `levels_upgrades` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Contains the upgrade costs for each level.';

-- Initial dump for the `levels_upgrades` table.
--
INSERT INTO `levels_upgrades`(`id`, `levels_id`, `probability`, `credits`, `uridium`) VALUES
(1, 2, 5, 125000, 200),
(2, 2, 10, 225000, 260),
(3, 2, 15, 325000, 335),
(4, 2, 20, 425000, 425),
(5, 2, 25, 525000, 530),
(6, 2, 30, 625000, 650),
(7, 2, 35, 725000, 785),
(8, 2, 40, 825000, 935),
(9, 2, 45, 925000, 1100),
(10, 2, 50, 1025000, 1280),
(11, 2, 55, 1125000, 1475),
(12, 2, 60, 1225000, 1685),
(13, 2, 65, 1325000, 1910),
(14, 2, 70, 1425000, 2150),
(15, 2, 75, 1525000, 2405),
(16, 2, 80, 1625000, 2675),
(17, 2, 85, 1725000, 2960),
(18, 2, 90, 1825000, 3260),
(19, 2, 95, 1925000, 3575),
(20, 2, 100, 2025000, 3905),
(21, 3, 5, 150000, 350),
(22, 3, 10, 300000, 425),
(23, 3, 15, 475000, 515),
(24, 3, 20, 675000, 620),
(25, 3, 25, 900000, 740),
(26, 3, 30, 1150000, 845),
(27, 3, 35, 1425000, 1025),
(28, 3, 40, 1725000, 1190),
(29, 3, 45, 2050000, 1370),
(30, 3, 50, 2400000, 1565),
(31, 3, 55, 2755000, 1775),
(32, 3, 60, 3175000, 2000),
(33, 3, 65, 3600000, 2240),
(34, 3, 70, 4050000, 2495),
(35, 3, 75, 4525000, 2765),
(36, 3, 80, 5025000, 3050),
(37, 3, 85, 5500000, 3320),
(38, 3, 90, 6100000, 3665),
(39, 3, 95, 6675000, 3995),
(40, 3, 100, 7275000, 4340),
(41, 4, 5, 175000, 500),
(42, 4, 10, 375000, 590),
(43, 4, 15, 625000, 695),
(44, 4, 20, 925000, 815),
(45, 4, 25, 1275000, 950),
(46, 4, 30, 1675000, 1100),
(47, 4, 35, 2125000, 1265),
(48, 4, 40, 2625000, 1445),
(49, 4, 45, 3175000, 1640),
(50, 4, 50, 3775000, 1850),
(51, 4, 55, 4425000, 2075),
(52, 4, 60, 5125000, 2315),
(53, 4, 65, 5875000, 2570),
(54, 4, 70, 6675000, 2840),
(55, 4, 75, 7525000, 3125),
(56, 4, 80, 8425000, 3425),
(57, 4, 85, 9375000, 3740),
(58, 4, 90, 10375000, 4070),
(59, 4, 95, 11425000, 4415),
(60, 4, 100, 12525000, 4775),
(61, 5, 5, 200000, 650),
(62, 5, 10, 450000, 755),
(63, 5, 15, 775000, 875),
(64, 5, 20, 1175000, 1010),
(65, 5, 25, 1650000, 1160),
(66, 5, 30, 2200000, 1325),
(67, 5, 35, 2825000, 1505),
(68, 5, 40, 3525000, 1700),
(69, 5, 45, 4300000, 1910),
(70, 5, 50, 5150000, 2135),
(71, 5, 55, 6075000, 2375),
(72, 5, 60, 7075000, 2630),
(73, 5, 65, 8150000, 2900),
(74, 5, 70, 9300000, 3185),
(75, 5, 75, 10525000, 3485),
(76, 5, 80, 11825000, 3800),
(77, 5, 85, 13200000, 4130),
(78, 5, 90, 14650000, 4475),
(79, 5, 95, 16175000, 4835),
(80, 5, 100, 17775000, 5210),
(81, 6, 5, 225000, 800),
(82, 6, 10, 525000, 920),
(83, 6, 15, 925000, 1055),
(84, 6, 20, 1425000, 1205),
(85, 6, 25, 2025000, 1370),
(86, 6, 30, 2725000, 1550),
(87, 6, 35, 3525000, 1745),
(88, 6, 40, 4425000, 1955),
(89, 6, 45, 5425000, 2180),
(90, 6, 50, 6525000, 2420),
(91, 6, 55, 7725000, 2675),
(92, 6, 60, 9025000, 2945),
(93, 6, 65, 10425000, 3230),
(94, 6, 70, 11925000, 3530),
(95, 6, 75, 13525000, 3845),
(96, 6, 80, 15225000, 4175),
(97, 6, 85, 17025000, 4520),
(98, 6, 90, 18925000, 4880),
(99, 6, 95, 20925000, 5255),
(100, 6, 100, 23025000, 5645),
(101, 7, 5, 250000, 950),
(102, 7, 10, 600000, 1085),
(103, 7, 15, 1075000, 1235),
(104, 7, 20, 1675000, 1400),
(105, 7, 25, 2400000, 1580),
(106, 7, 30, 3250000, 1775),
(107, 7, 35, 4225000, 1985),
(108, 7, 40, 5325000, 2210),
(109, 7, 45, 6550000, 2420),
(110, 7, 50, 7900000, 2705),
(111, 7, 55, 9375000, 2975),
(112, 7, 60, 10975000, 3260),
(113, 7, 65, 12700000, 3530),
(114, 7, 70, 14550000, 3875),
(115, 7, 75, 16525000, 4205),
(116, 7, 80, 18625000, 4550),
(117, 7, 85, 20850000, 4910),
(118, 7, 90, 23200000, 5285),
(119, 7, 95, 25675000, 5675),
(120, 7, 100, 28275000, 6080),
(121, 8, 5, 250000, 1100),
(122, 8, 10, 675000, 1250),
(123, 8, 15, 1225000, 1415),
(124, 8, 20, 1925000, 1595),
(125, 8, 25, 2775000, 1790),
(126, 8, 30, 3775000, 2000),
(127, 8, 35, 4925000, 2225),
(128, 8, 40, 6225000, 2465),
(129, 8, 45, 7675000, 2720),
(130, 8, 50, 9275000, 2990),
(131, 8, 55, 11025000, 3275),
(132, 8, 60, 12925000, 3575),
(133, 8, 65, 14975000, 3890),
(134, 8, 70, 17175000, 4220),
(135, 8, 75, 19525000, 4565),
(136, 8, 80, 22025000, 4925),
(137, 8, 85, 24675000, 5300),
(138, 8, 90, 27475000, 5690),
(139, 8, 95, 30425000, 6095),
(140, 8, 100, 33525000, 6515),
(141, 9, 5, 300000, 1250),
(142, 9, 10, 750000, 1415),
(143, 9, 15, 1375000, 1595),
(144, 9, 20, 2175000, 1790),
(145, 9, 25, 3150000, 2000),
(146, 9, 30, 4300000, 2225),
(147, 9, 35, 5625000, 2465),
(148, 9, 40, 7125000, 2720),
(149, 9, 45, 8800000, 2990),
(150, 9, 50, 10650000, 3275),
(151, 9, 55, 12675000, 3575),
(152, 9, 60, 14875000, 3890),
(153, 9, 65, 17250000, 4220),
(154, 9, 70, 19800000, 4565),
(155, 9, 75, 22525000, 4925),
(156, 9, 80, 25425000, 5300),
(157, 9, 85, 28500000, 5690),
(158, 9, 90, 31750000, 6095),
(159, 9, 95, 35175000, 6515),
(160, 9, 100, 38775000, 9650),
(161, 10, 5, 325000, 1400),
(162, 10, 10, 825000, 1580),
(163, 10, 15, 1525000, 1775),
(164, 10, 20, 2425000, 1985),
(165, 10, 25, 3525000, 2210),
(166, 10, 30, 4825000, 2450),
(167, 10, 35, 6325000, 2705),
(168, 10, 40, 8025000, 2975),
(169, 10, 45, 9925000, 3260),
(170, 10, 50, 12025000, 3560),
(171, 10, 55, 14325000, 3875),
(172, 10, 60, 16825000, 4205),
(173, 10, 65, 19525000, 4550),
(174, 10, 70, 22425000, 4910),
(175, 10, 75, 25525000, 5285),
(176, 10, 80, 28825000, 5675),
(177, 10, 85, 32325000, 6080),
(178, 10, 90, 36025000, 6500),
(179, 10, 95, 39925000, 6935),
(180, 10, 100, 44025000, 7385),
(181, 11, 5, 350000, 1550),
(182, 11, 10, 900000, 1745),
(183, 11, 15, 1675000, 1955),
(184, 11, 20, 2675000, 2180),
(185, 11, 25, 3900000, 2420),
(186, 11, 30, 5350000, 2675),
(187, 11, 35, 7025000, 2945),
(188, 11, 40, 8925000, 3230),
(189, 11, 45, 11025000, 3530),
(190, 11, 50, 13400000, 3845),
(191, 11, 55, 15975000, 4175),
(192, 11, 60, 18775000, 4520),
(193, 11, 65, 21800000, 4880),
(194, 11, 70, 25050000, 5255),
(195, 11, 75, 28525000, 5645),
(196, 11, 80, 32225000, 6050),
(197, 11, 85, 36150000, 6470),
(198, 11, 90, 40300000, 6905),
(199, 11, 95, 44675000, 7355),
(200, 11, 100, 49275000, 7820),
(201, 12, 5, 375000, 1700),
(202, 12, 10, 975000, 1910),
(203, 12, 15, 1825000, 2135),
(204, 12, 20, 2925000, 2375),
(205, 12, 25, 4275000, 2630),
(206, 12, 30, 5875000, 2900),
(207, 12, 35, 7725000, 3185),
(208, 12, 40, 9825000, 3485),
(209, 12, 45, 12175000, 3800),
(210, 12, 50, 14775000, 4130),
(211, 12, 55, 17625000, 4475),
(212, 12, 60, 20725000, 4835),
(213, 12, 65, 24075000, 5210),
(214, 12, 70, 27675000, 5600),
(215, 12, 75, 31525000, 6005),
(216, 12, 80, 35625000, 6425),
(217, 12, 85, 39975000, 6860),
(218, 12, 90, 44575000, 7310),
(219, 12, 95, 49425000, 7755),
(220, 12, 100, 54525000, 8255),
(221, 13, 5, 400000, 1850),
(222, 13, 10, 1050000, 2075),
(223, 13, 15, 1975000, 2315),
(224, 13, 20, 3175000, 2570),
(225, 13, 25, 4650000, 2840),
(226, 13, 30, 6400000, 3125),
(227, 13, 35, 8425000, 3425),
(228, 13, 40, 10725000, 3740),
(229, 13, 45, 13300000, 4070),
(230, 13, 50, 16150000, 4415),
(231, 13, 55, 19275000, 4775),
(232, 13, 60, 22675000, 5150),
(233, 13, 65, 26350000, 5540),
(234, 13, 70, 30300000, 5945),
(235, 13, 75, 34525000, 6365),
(236, 13, 80, 39025000, 6800),
(237, 13, 85, 43800000, 7250),
(238, 13, 90, 48850000, 7715),
(239, 13, 95, 54175000, 8195),
(240, 13, 100, 59775000, 8690),
(241, 14, 5, 425000, 2000),
(242, 14, 10, 1125000, 2240),
(243, 14, 15, 2125000, 2495),
(244, 14, 20, 3425000, 2756),
(245, 14, 25, 5025000, 3050),
(246, 14, 30, 6925000, 3665),
(247, 14, 35, 9125000, 3995),
(248, 14, 40, 11625000, 4530),
(249, 14, 45, 14425000, 4700),
(250, 14, 50, 17525000, 5075),
(251, 14, 55, 20925000, 5465),
(252, 14, 60, 24625000, 5870),
(253, 14, 65, 28625000, 6290),
(254, 14, 70, 32925000, 6725),
(255, 14, 75, 37525000, 7175),
(256, 14, 80, 42425000, 7640),
(257, 14, 85, 47625000, 8120),
(258, 14, 90, 53125000, 8615),
(259, 14, 95, 58925000, 9125),
(260, 14, 100, 65025000, 9775),
(261, 15, 5, 450000, 2150),
(262, 15, 10, 1200000, 2405),
(263, 15, 15, 2275000, 2675),
(264, 15, 20, 3675000, 2960),
(265, 15, 25, 5400000, 3260),
(266, 15, 30, 7450000, 3575),
(267, 15, 35, 9825000, 3905),
(268, 15, 40, 12525000, 4250),
(269, 15, 45, 15550000, 4610),
(270, 15, 50, 18900000, 4985),
(271, 15, 55, 22575000, 5375),
(272, 15, 60, 26575000, 5780),
(273, 15, 65, 30900000, 6200),
(274, 15, 70, 35550000, 6635),
(275, 15, 75, 40252000, 7085),
(276, 15, 80, 45825000, 7550),
(277, 15, 85, 51450000, 8030),
(278, 15, 90, 57400000, 8525),
(279, 15, 95, 63675000, 9035),
(280, 15, 100, 70275000, 9560),
(281, 16, 5, 475000, 2300),
(282, 16, 10, 1275000, 2570),
(283, 16, 15, 2425000, 2855),
(284, 16, 20, 3925000, 3155),
(285, 16, 25, 5775000, 3470),
(286, 16, 30, 7975000, 3800),
(287, 16, 35, 10525000, 4145),
(288, 16, 40, 13425000, 4505),
(289, 16, 45, 16675000, 4880),
(290, 16, 50, 20275000, 5270),
(291, 16, 55, 24225000, 5675),
(292, 16, 60, 28525000, 6095),
(293, 16, 65, 33175000, 6530),
(294, 16, 70, 38175000, 6980),
(295, 16, 75, 43525000, 7445),
(296, 16, 80, 49225000, 7925),
(297, 16, 85, 55275000, 8420),
(298, 16, 90, 61675000, 8930),
(299, 16, 95, 68425000, 9455),
(300, 16, 100, 15525000, 9995);

-- Maps table.
--
-- In game maps.
--
CREATE TABLE `maps` (
    `id`           tinyint      NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `name`         varchar(255) NOT NULL DEFAULT ''     COMMENT 'Map name.',
    `factions_id`  tinyint      NULL     DEFAULT NULL,
    `is_pvp`       boolean      NOT NULL DEFAULT 0,
    `is_starter`   boolean      NOT NULL DEFAULT 0,
    `limits`       varchar(15)  NOT NULL DEFAULT '20800,12800',

    CONSTRAINT `maps_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'In game maps.';

CREATE  UNIQUE INDEX `maps_name_idx` ON `maps` (`name`);

-- Initial dump for the `maps` table.

INSERT INTO `maps` (`id`, `name`, `factions_id`, `is_pvp`, `is_starter`) VALUES
('1',  '1-1', '1',  false, true),
('2',  '1-2', '1',  false, true),
('3',  '1-3', '1',  false, false),
('4',  '1-4', '1',  false, false),
('5',  '2-1', '2',  false, true),
('6',  '2-2', '2',  false, true),
('7',  '2-3', '2',  false, false),
('8',  '2-4', '2',  false, false),
('9',  '3-1', '3',  false, true),
('10', '3-2', '3',  false, true),
('11', '3-3', '3',  false, false),
('12', '3-4', '3',  false, false),
('13', '4-1', '1',  true,  false),
('14', '4-2', '2',  true,  false),
('15', '4-3', '3',  true,  false),
('16', '4-4', NULL, true,  false),
('17', '1-5', '1',  false, false),
('18', '1-6', '1',  false, false),
('19', '1-7', '1',  false, false),
('20', '1-8', '1',  false, false),
('21', '2-5', '2',  false, false),
('22', '2-6', '2',  false, false),
('23', '2-7', '2',  false, false),
('24', '2-8', '2',  false, false),
('25', '3-5', '3',  false, false),
('26', '3-6', '3',  false, false),
('27', '3-7', '3',  false, false),
('28', '3-8', '3',  false, false),
('29', '4-5', NULL, true,  false),
('52', '???', NULL, false, false),
('91', '5-1', NULL, false, false),
('92', '5-2', NULL, false, false),
('93', '5-3', NULL, false, false);

-- Map's NPCs table.
--
-- Many to many relation table.
--
CREATE TABLE `maps_npcs` (
    `id`      tinyint NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `maps_id` tinyint NOT NULL                COMMENT 'Map ID.',
    `npcs_id` tinyint NOT NULL                COMMENT 'NPC ID.',
    `amount`  tinyint NOT NULL DEFAULT 0      COMMENT 'Amount of NPCs on map',

    CONSTRAINT `maps_npcs_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Many to many relation table.';

CREATE INDEX `maps_npcs_maps_id_idx` ON `maps_npcs` (`maps_id`);
CREATE INDEX `maps_npcs_npcs_id_idx` ON `maps_npcs` (`npcs_id`);

-- Initial dump for the `maps_npcs` table.

INSERT INTO `maps_npcs`(`id`, `maps_id`, `npcs_id`, `amount`) VALUES
(1, 1, 1, 50),
(2, 2, 1, 50),
(3, 2, 2, 25),
(4, 3, 2, 25),
(5, 3, 5, 10),
(6, 4, 2, 25),
(7, 4, 6, 10),
(8, 4, 4, 20),
(9, 4, 3, 18),
(10, 5, 1, 50),
(11, 6, 1, 50),
(12, 6, 2, 25),
(13, 7, 2, 25),
(14, 7, 5, 10),
(15, 7, 4, 20),
(16, 7, 3, 18),
(17, 8, 2, 25),
(18, 8, 6, 10),
(19, 8, 4, 20),
(20, 8, 3, 18),
(21, 9, 1, 50),
(22, 10, 1, 50),
(23, 10, 2, 25),
(24, 11, 2, 25),
(25, 11, 5, 10),
(26, 11, 4, 20),
(27, 11, 3, 18),
(28, 12, 2, 25),
(29, 12, 6, 10),
(30, 12, 4, 20),
(31, 12, 3, 18),
(32, 17, 2, 25),
(33, 17, 7, 35),
(34, 17, 8, 10),
(35, 18, 9, 40),
(36, 18, 10, 12),
(37, 18, 12, 4),
(38, 19, 9, 40),
(39, 19, 10, 20),
(40, 20, 13, 70),
(41, 21, 2, 25),
(42, 21, 7, 35),
(43, 21, 8, 10),
(44, 22, 9, 40),
(45, 22, 10, 12),
(46, 22, 12, 4),
(47, 23, 9, 45),
(48, 23, 10, 15),
(49, 24, 13, 70),
(50, 25, 2, 25),
(51, 25, 7, 35),
(52, 25, 8, 10),
(53, 26, 9, 40),
(54, 26, 10, 12),
(55, 26, 12, 4),
(56, 27, 9, 45),
(57, 27, 10, 15),
(58, 28, 13, 70),
(59, 29, 13, 15),
(60, 29, 2, 15),
(61, 29, 5, 15),
(62, 29, 4, 15),
(63, 29, 6, 15),
(64, 29, 3, 15),
(65, 29, 7, 15),
(66, 29, 8, 15),
(67, 29, 9, 15),
(68, 29, 10, 15),
(69, 29, 13, 15),
(70, 52, 12, 100),
(71, 91, 37, 20),
(72, 91, 38, 15),
(73, 91, 39, 15),
(74, 91, 40, 10),
(75, 92, 37, 20),
(76, 92, 38, 15),
(77, 92, 39, 15),
(78, 92, 40, 10),
(79, 93, 37, 20),
(80, 93, 38, 15),
(81, 93, 39, 15),
(82, 93, 40, 10);

-- Map's portals table.
--
-- Portals on map.
--
CREATE TABLE `maps_portals` (
    `id`              tinyint     NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `levels_id`       tinyint     NOT NULL DEFAULT 1,
    `maps_id`         tinyint     NOT NULL,
    `position`        varchar(15) NOT NULL DEFAULT '0,0'  COMMENT 'Position on map.',
    `target_maps_id`  tinyint     NOT NULL,
    `target_position` varchar(15) NOT NULL DEFAULT '0,0'  COMMENT 'Position where the account will be spawned after using the portal.',
    `is_visible`      boolean     NOT NULL DEFAULT 1,
    `is_working`      boolean     NOT NULL DEFAULT 1,
    `gfx`             tinyint     NOT NULL DEFAULT 1,

    CONSTRAINT `maps_portals_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Portals on map.';

CREATE INDEX `maps_portals_levels_id_idx` ON `maps_portals` (`levels_id`);
CREATE INDEX `maps_portals_maps_id_idx` ON `maps_portals` (`maps_id`);
CREATE INDEX `maps_portals_target_maps_id_idx` ON `maps_portals` (`target_maps_id`);

-- Initial dump for the `maps_portals` table.

INSERT INTO `maps_portals` (`maps_id`, `position`, `target_position`, `target_maps_id`, `levels_id`) VALUES
(1,  '18500,11500', '2000,2000',   2,  1),
(2,  '2000,2000',   '18500,11500', 1,  1),
(2,  '18500,11500', '2000,2000',   4,  1),
(2,  '18500,2000',  '2000,11500',  3,  1),
(3,  '2000,11500',  '18500,2000',  2,  1),
(3,  '18500,11500', '18500,2000',  4,  1),
(3,  '18500,2000',  '2000,11500',  7,  1),
(4,  '2000,2000',   '18500,11500', 2,  1),
(4,  '18500,2000',  '18500,11500', 3,  1),
(4,  '18500,11500', '2000,2000',   12, 1),
(4,  '19500,7000',  '2000,7000',   13, 1),
(5,  '2000,11500',  '18500,2000',  6,  1),
(6,  '18500,11500', '2000,2000',   8,  1),
(6,  '18500,2000',  '2000,11500',  5,  1),
(6,  '2000,11500',  '18500,2000',  7,  1),
(7,  '18500,2000',  '2000,11500',  6,  1),
(7,  '2000,11500',  '18500,2000',  3,  1),
(7,  '18500,11500', '18500,2000',  8,  1),
(8,  '2000,2000',   '18500,11500', 6,  1),
(8,  '2000,11500',  '2000,2000',   11, 1),
(8,  '10000,12000', '10700,1200',  14, 1),
(8,  '18500,2000',  '18500,11500', 7,  1),
(9,  '2000,2000',   '18500,11500', 10, 1),
(10, '18500,11500', '2000,2000',   9,  1),
(10, '18500,2000',  '18500,11500', 11, 1),
(10, '2000,2000',   '18500,11500', 12, 1),
(11, '18500,11500', '18500,2000',  10, 1),
(11, '2000,2000',   '2000,11500',  8,  1),
(11, '2000,11500',  '18500,2000',  12, 1),
(12, '10000,1200',  '19500,7000',  15, 1),
(12, '18500,2000',  '2000,11500',  11, 1),
(12, '2000,2000',   '18500,11500', 4,  1),
(12, '18500,11500', '2000,7000',   10, 1),
(13, '2000,7000',   '19500,7000',  4,  1),
(13, '10700,7000',  '9500,7500',   16, 1),
(13, '18500,2000',  '2000,11500',  14, 1),
(13, '18500,11500', '2000,11500',  15, 1),
(14, '2000,11500',  '18500,2000',  13, 1),
(14, '18500,11500', '2000,2000',   15, 1),
(14, '10700,7000',  '10700,5500',  16, 1),
(14, '10700,1200',  '10000,12000', 8,  1),
(15, '10700,7000',  '11900,7500',  16, 1),
(15, '19500,7000',  '10000,1200',  15, 1),
(15, '2000,11500',  '18500,11500', 13, 1),
(15, '2000,2000',   '18500,11500', 14, 1),
(16, '9500,7500',   '10700,7000',  13, 1),
(16, '11900,7500',  '10700,7000',  15, 1),
(16, '10700,5500',  '10700,7000',  14, 1),
(16, '2500,7500',   '18500,6000',  17, 1),
(16, '16000,12000', '2000,2000',   25, 1),
(16, '16000,1200',  '2000,11500',  21, 1),
(17, '2000,11500',  '18500,2000',  19, 1),
(17, '18500,6000',  '2500,7500',   16, 1),
(17, '2000,2000',   '18500,11500', 18, 1),
(17, '10500,12000', '5500,13500',  29, 1),
(18, '2000,11500',  '18500,2000',  20, 1),
(18, '18500,11500', '2000,2000',   17, 1),
(19, '2000,2000',   '18500,2000',  20, 1),
(19, '18500,2000',  '2000,11500',  17, 1),
(20, '18500,2000',  '2000,11500',  18, 1),
(20, '18500,11500', '2000,2000',   19, 1),
(21, '2000,2000',   '2000,11500',  22, 1),
(21, '18500,2000',  '2000,11500',  23, 1),
(21, '2000,11500',  '16000,1200',  16, 1),
(21, '18500,11500', '25000,2000',  29, 1),
(22, '18500,2000',  '2000,11500',  24, 1),
(22, '2000,11500',  '2000,2000',   21, 1),
(23, '18500,2000',  '18500,11500', 24, 1),
(23, '2000,11500',  '18500,2000',  21, 1),
(24, '18500,11500', '18500,2000',  23, 1),
(24, '2000,11500',  '18500,2000',  22, 1),
(25, '2000,11500',  '2000,2000',   26, 1),
(25, '18500,11500', '2000,11500',  27, 1),
(25, '2000,2000',   '16000,1200',  16, 1),
(25, '18500,2000',  '25000,25000', 29, 1),
(26, '2000,2000',   '2000,11500',  25, 1),
(26, '18500,11500', '2000,11500',  28, 1),
(27, '2000,11500',  '18500,11500', 25, 1),
(27, '18500,11500', '2000,2000',   28, 1),
(28, '2000,11500',  '18500,11500', 26, 1),
(28, '2000,2000',   '18500,11500', 27, 1),
(29, '5500,13500',  '10500,12000', 17, 1),
(29, '27000,2000',  '18500,11500', 21, 1),
(29, '27000,25000', '18500,2000',  25, 1),
(29, '24400,20800', '35000,20000', 91, 1),
(29, '24400,6400',  '38000,13000', 91, 1),
(29, '11500,13400', '35000,7500',  91, 1),
(52, '2000,2000',   '18500,11500', 1,  1),
(91, '35000,20000', '24400,20800', 29, 1),
(91, '4600,6800',   '18000,10000', 92, 1),
(91, '38000,13000', '24400,6400',  29, 1),
(91, '35000,7500',  '5000,5000',   29, 1),
(91, '2200,13500',  '18500,6400',  92, 1),
(91, '4600,20700',  '18000,2600',  92, 1),
(92, '18000,10000', '4600,6800',   91, 1),
(92, '18500,6400',  '2200,13500',  91, 1),
(92, '18000,2800',  '4600,20700',  91, 1),
(92, '2200,11000',  '37500,9000',  93, 1),
(92, '2200,3600',   '37500,13000', 93, 1),
(92, '700,6800',    '37500,11000', 93, 1),
(93, '5000,7000',   '1000,6400',   20, 1),
(93, '5000,11000',  '10000,1000',  24, 1),
(93, '5000,16000',  '18500,6400',  28, 1),
(93, '37500,9000',  '2200,11000',  92, 1),
(93, '37500,11000', '2200,3600',   92, 1),
(93, '37500,13000', '700,6700',    92, 1);

-- Map's stations table.
--
-- Stations on map.
--
CREATE TABLE `maps_stations` (
    `id`          tinyint     NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `position`    varchar(15) NOT NULL DEFAULT '0,0'  COMMENT 'Position on map.',
    `maps_id`     tinyint     NULL     DEFAULT NULL,
    `factions_id` tinyint     NULL     DEFAULT NULL,

    CONSTRAINT `maps_stations_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Stations on map.';

CREATE INDEX `maps_portals_factions_id_idx` ON `maps_stations` (`factions_id`);
CREATE INDEX `maps_portals_maps_id_idx` ON `maps_stations` (`maps_id`);

-- Initial dump for the `stations` table.

INSERT INTO `maps_stations` (`id`, `position`, `maps_id`, `factions_id`) VALUES
(1, '1000,1000',   1,  1),
(2, '19000,1000',  5,  2),
(3, '19000,12000', 9,  3),
(4, '1000,6000',   20, 1),
(5, '10000,1000',  24, 2),
(6, '19000,6000',  28, 3);

-- Moderators table.
--
-- Server moderators.
--
CREATE TABLE `moderators` (
    `id`          tinyint   NOT NULL AUTO_INCREMENT            COMMENT 'Primary Key.',
    `accounts_id` int       NOT NULL,
    `type`        tinyint   NOT NULL DEFAULT 1                 COMMENT '1 = Chat moderator, 2 = Game moderator, 3 = Chat administrator, 4 = Game administrator, 5 = Global moderator, 6 = Global administrator.',
    `date`        timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date when the account become a moderator.',

    CONSTRAINT `moderators_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Server moderators.';

CREATE INDEX `moderators_accounts_id_idx` ON `moderators` (`accounts_id`);

-- Initial dump for the `moderators` table.

-- Moderators' logs table.
--
-- Logged events made by moderators.
--
CREATE TABLE `moderators_logs` (
    `id`            int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `moderators_id` tinyint      NOT NULL,
    `date`          timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `type`          varchar(255) NOT NULL DEFAULT '',
    `text`          text         NOT NULL,

    CONSTRAINT `moderators_logs_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Logged events made by moderators.';

CREATE INDEX `moderators_logs_moderators_id_idx` ON `moderators_logs` (`moderators_id`);
CREATE INDEX `moderators_logs_type_idx` ON `moderators_logs` (`type`);

-- Initial dump for the `moderators_logs` table.

-- News table.
--
-- Server news.
--
CREATE TABLE `news` (
    `id`     smallint     NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `date`   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `image`  varchar(255) NOT NULL DEFAULT '',
    `title`  varchar(255) NOT NULL DEFAULT '',
    `teaser` varchar(255) NOT NULL DEFAULT '',
    `text`   text         NOT NULL,

    CONSTRAINT `news_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Server news.';

CREATE INDEX `news_title` ON `news` (`title`);
CREATE INDEX `news_date` ON `news` (`date`);

-- Initial dump for the `news` table.

-- NPCs table.
--
-- Server NPCs.
--
CREATE TABLE `npcs` (
    `id`                tinyint      NOT NULL AUTO_INCREMENT            COMMENT 'Primary Key.',
    `name`              varchar(255) NOT NULL DEFAULT '-=[Streuner]=-',
    `health`            int          NOT NULL DEFAULT 0,
    `shield`            int          NOT NULL DEFAULT 0,
    `shield_absorption` tinyint      NOT NULL DEFAULT 0.0,
    `damage`            int          NOT NULL DEFAULT 0,
    `speed`             smallint     NOT NULL DEFAULT 0,
    `gfx`               tinyint      NOT NULL DEFAULT 0,
    `ai`                tinyint      NOT NULL DEFAULT 1,

    CONSTRAINT `npcs_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Server NPCS.';

CREATE INDEX `npcs_name` ON `npcs` (`name`);
CREATE INDEX `npcs_gfx` ON `npcs` (`gfx`);

-- Initial dump for the `npcs` table.


INSERT INTO `npcs` (`id`, `name`, `health`, `shield`, `shield_absorption`, `damage`, `speed`, `gfx`, `ai`) VALUES
(1,  '-=[Streuner]=-',            800,      400,      80, 15,     0, 84,  1),
(2,  '-=[Lordakia]=-',            2000,     2000,     80, 90,     0, 71,  2),
(3,  '-=[Saimon]=-',              6000,     3000,     80, 175,    0, 75,  2),
(4,  '-=[Mordon]=-',              20000,    10000,    80, 350,    0, 73,  2),
(5,  '-=[Devolarium]=-',          100000,   100000,   80, 1050,   0, 72,  2),
(6,  '-=[Sibelon]=-',             200000,   200000,   80, 2625,   0, 74,  2),
(7,  '-=[Sibelonit]=-',           40000,    40000,    80, 875,    0, 76,  2),
(8,  '-=[Lordakium]=-',           300000,   200000,   80, 3375,   0, 77,  2),
(9,  '-=[Kristallin]=-',          50000,    40000,    80, 1050,   0, 78,  2),
(10, '-=[Kristallon]=-',          400000,   300000,   80, 4375,   0, 79,  1),
(11, '-=[Protegit]=-',            50000,    40000,    80, 1312,   0, 81,  2),
(12, '-=[Cubikon]=-',             1600000,  1200000,  80, 0,      0, 80,  1),
(13, '-=[StreuneR]=-',            20000,    10000,    80, 425,    0, 85,  1),
(14, '-=[demaNer]=-',             400000,   300000,   80, 3750,   0, 11,  2),
(15, '..::{Boss Streuner}::..',   3200,     1600,     80, 110,    0, 23,  1),
(16, '..::{Boss Lordakia}::..',   8000,     8000,     80, 322,    0, 24,  2),
(17, '..::{Boss Saimon}::..',     24000,    12000,    80, 660,    0, 25,  2),
(18, '..::{Boss Mordon}::..',     80000,    40000,    80, 1400,   0, 31,  2),
(19, '..::{Boss Devolarium}::..', 400000,   400000,   80, 4375,   0, 26,  2),
(20, '..::{Boss Sibelon}::..',    800000,   800000,   80, 10725,  0, 46,  2),
(21, '..::{Boss Sibelonit}::..',  160000,   160000,   80, 3762,   0, 27,  2),
(22, '..::{Boss Lordakium}::..',  1200000,  800000,   80, 13000,  0, 28,  1),
(23, '..::{Boss Kristallin}::..', 200000,   160000,   80, 4150,   0, 29,  2),
(24, '..::{Boss Kristallon}::..', 1600000,  1200000,  80, 17500,  0, 35,  1),
(25, '..::{Boss StreuneR}::..',   80000,    40000,    80, 1750,   0, 34,  1),
(26, '<-o(Uber Streuner)o->',     6400,     3200,     80, 220,    0, 23,  1),
(27, '<-o(Uber Lordakia)o->',     16000,    16000,    80, 644,    0, 24,  2),
(28, '<-o(Uber Saimon)o->',       48000,    24000,    80, 1320,   0, 25,  2),
(29, '<-o(Uber Mordon)o->',       160000,   80000,    80, 2800,   0, 31,  2),
(30, '<-o(Uber Devolarium)o->',   800000,   800000,   80, 8750,   0, 26,  2),
(31, '<-o(Uber Sibelon)o->',      1600000,  1600000,  80, 21550,  0, 46,  2),
(32, '<-o(Uber Sibelonit)o->',    320000,   320000,   80, 7524,   0, 27,  2),
(33, '<-o(Uber Lordakium)o->',    2400000,  1600000,  80, 26000,  0, 28,  1),
(34, '<-o(Uber Kristallin)o->',   400000,   320000,   80, 8300,   0, 42,  2),
(35, '<-o(Uber Kristallon)o->',   3200000,  2400000,  80, 37500,  0, 45,  1),
(36, '<-o(Uber StreuneR)o->',     160000,   80000,    80, 3500,   0, 34,  1),
(37, '-=[Interceptor]=-',         60000,    40000,    80, 425,    0, 111, 2),
(38, '-=[Barracuda]=-',           180000,   100000,   80, 5250,   0, 112, 2),
(39, '-=[Saboteur]=-',            200000,   150000,   80, 3500,   0, 113, 2),
(40, '-=[Annihilator]=-',         300000,   200000,   80, 13000,  0, 114, 2),
(41, '-=[Battleray]=-',           500000,   400000,   80, 8500,   0, 115, 2),
(42, '-=[Corsair]=-',             200000,   120000,   80, 7000,   0, 91,  2),
(43, '-=[Outcast]=-',             150000,   80000,    80, 4400,   0, 92,  2),
(44, '-=[Marauder]=-',            100000,   60000,    80, 4000,   0, 93,  2),
(45, '-=[Vagrant]=-',             40000,    40000,    80, 2200,   0, 94,  2),
(46, '-=[Convict]=-',             400000,   200000,   80, 10750,  0, 95,  2),
(47, '-=[Hooligan]=-',            250000,   200000,   80, 8000,   0, 96,  2),
(48, '-=[Ravager]=-',             300000,   200000,   80, 9500,   0, 97,  2),
(49, '-=[Century Falcon]=-',      4000000,  3000000,  80, 22000,  0, 90,  2),
(50, '-=[Infernal]=-',            60000,    50000,    80, 475,    0, 100, 2),
(51, '-=[Scorcher]=-',            200000,   200000,   80, 1250,   0, 99,  2),
(52, '-=[Melter]=-',              1000,     0,        80, 10,     0, 102, 1),
(53, '-=[Devourer]=-',            1000,     0,        80, 10,     0, 105, 1),
(54, '-=[Emperor Kristallon]=-',  1000,     0,        80, 10,     0, 122, 1),
(55, '-=[Emperor Lordakium]=-',   1000,     0,        80, 10,     0, 123, 1),
(56, '-=[Emperor Sibelon]=-',     1000,     0,        80, 10,     0, 124, 1),
(57, '<=<Icy>=>',                 100000,   80000,    80, 750,    0, 103, 2),
(58, '-=[Ice Meteoroid]=-',       1600000,  1200000,  80, 0,      0, 101, 2),
(59, '-=[Super Ice Metroid]=-',   3200000,  2400000,  80, 0,      0, 33,  1),
(60, '<==<Kucurbium>==>',         5000000,  5000000,  80, 22500,  0, 82,  2),
(61, '<==<Boss Kucurbium>==>',    20000000, 20000000, 80, 55000,  0, 83,  2),
(62, '-=[Minion]=-',              1000,     0,        80, 10,     0, 117, 1),
(63, '-=[Hitac 2.0]=-',           1000,     0,        80, 10,     0, 116, 1),
(64, '-=[Binarybot]=-',           800000,   1200000,  80, 10000,  0, 104, 2),
(65, '-=[Santabot]=-',            1000,     0,        80, 10,     0, 32,  1),
(66, '-=[Carnivalbot]=-',         1000,     0,        80, 20,     0, 48,  1),
(67, '-=[Refreebot]=-',           1000,     0,        80, 20,     0, 89,  1),
(68, '-=[Lordakia]=-',            2000,     2000,     80, 40,     0, 106, 2),
(69, '-=[Solarburst]=-',          1000,     0,        80, 10,     0, 107, 1),
(70, '-=[Twist]=-',               1000,     0,        80, 10,     0, 119, 1),
(71, '..::{Boss Twist}::..',      1000,     0,        80, 10,     0, 118, 1),
(72, '-=[Turkey]=-',              1000,     0,        80, 10,     0, 120, 1),
(73, '-=[Snowman]=-',             1000,     0,        80, 10,     0, 121, 1),
(74, '-=[Mine Car]=-',            1000,     0,        80, 10,     0, 125, 1),
(75, '-=[Havok]=-',               50000,    50000,    80, 700,    0, 108, 2),
(76, 'UFO',                       3200000,  2400000,  80, 122500, 0, 20,  2),
(77, 'mini UFO',                  400000,   300000,   80, 4500,   0, 21,  2),
(78, '-=[Spaceball]=-',           0,        0,        80, 0,      0, 442, 1),
(79, '-=[Spaceball]=-',           0,        0,        80, 0,      0, 443, 1),
(80, '-=[Spaceball]=-',           0,        0,        80, 0,      0, 444, 1);

-- Permission's table.
--
-- Server permissions.
--
CREATE TABLE `permissions` (
    `id`       tinyint      NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `name`     varchar(255) NOT NULL,
    `category` varchar(255) NOT NULL,

    CONSTRAINT `permissions_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Server permissions.';

CREATE INDEX `permissions_name_idx` ON `permissions` (`name`);
CREATE INDEX `permissions_category_idx` ON `permissions` (`category`);

-- Initial dump for the `permissions` table.

INSERT INTO `permissions` (`id`, `name`, `category`) VALUES
(1,  'create_newsletter',   'clan'),
(2,  'manage_applications', 'clan'),
(3,  'dismiss_members',     'clan'),
(4,  'edit_ranks',          'clan'),
(5,  'diplomacy_start',     'clan'),
(6,  'diplomacy_end',       'clan'),
(7,  'diplomacy_war',       'clan'),
(8,  'administrate_bank',   'clan'),
(9,  'change_tax',          'clan'),
(10, 'create_news',         'clan'),
(11, 'manage_modules',      'clan'),
(12, 'manage_deflector',    'clan'),
(13, 'build_station',       'clan');

-- Quest table.
--
-- In game quests.
--
CREATE TABLE `quests` (
    `id`          smallint     NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `levels_id`   tinyint      NOT NULL DEFAULT 1      COMMENT 'Level required to unlock this quest.',
    `quests_id`   smallint     NULL     DEFAULT NULL   COMMENT 'Quest required to complete in order to unlock this quest.',
    `factions_id` tinyint      NULL     DEFAULT NULL   COMMENT 'Faction required to unlock this quest.',
    `name`        varchar(255) NOT NULL DEFAULT '',

    CONSTRAINT `quests_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'In game quests.';

CREATE INDEX `quests_name` ON `quests` (`name`);
CREATE INDEX `quests_levels_id` ON `quests` (`levels_id`);
CREATE INDEX `quests_quests_id` ON `quests` (`quests_id`);

-- Initial dump for the `quests` table.

-- Quest conditions table.
--
-- Quest's conditions.
--
CREATE TABLE `quests_conditions` (
    `id`                   int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `quests_conditions_id` int          NULL     DEFAULT NULL   COMMENT 'Condition needed to unlock this condition.',
    `quests_id`            smallint     NOT NULL,
    `type`                 tinyint      NOT NULL DEFAULT 1      COMMENT '1 = collect, 2 = destroy, 3 = travel, 4 = one of, 5 = in order, 6 = accomplish before, 7 = on map',
    `value`                varchar(255) NOT NULL DEFAULT '',

    CONSTRAINT `quests_conditions_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Quest''s conditions.';

CREATE INDEX `quests_conditions_quests_conditions_id_idx` ON `quests_conditions` (`quests_conditions_id`);
CREATE INDEX `quests_conditions_quests_id_idx` ON `quests_conditions` (`quests_id`);

-- Initial dump for the `quests_conditions` table.

-- Ranks table.
--
-- Contains the rank system.
--
CREATE TABLE `ranks` (
    `id`         tinyint      NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `name`       varchar(255) NOT NULL DEFAULT '',
    `percentaje` float        NOT NULL DEFAULT 0.0,
    `is_public`  boolean      NOT NULL DEFAULT 1,

    CONSTRAINT `ranks_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Contains the rank system.';

-- Initial dump for the `ranks` table.
--
INSERT INTO `ranks` (`id`, `name`, `percentaje`, `is_public`) VALUES
(1,  'Basic Space Pilot', 20.00, 1),
(2,  'Space Pilot',       12.39, 1),
(3,  'Chief Space Pilot', 10.00, 1),
(4,  'Basic Sergeant',    9.00,  1),
(5,  'Sergeant',          8.00,  1),
(6,  'Chief Sergeant',    7.00,  1),
(7,  'Basic Lieutenant',  6.00,  1),
(8,  'Lieutenant',        5.00,  1),
(9,  'Chief Lieutenant',  4.50,  1),
(10, 'Basic Captain',     4.00,  1),
(11, 'Captain',           3.50,  1),
(12, 'Chief Captain',     3.00,  1),
(13, 'Basic Major',       2.50,  1),
(14, 'Major',             2.00,  1),
(15, 'Chief Major',       1.50,  1),
(16, 'Basic Colonel',     1.00,  1),
(17, 'Colonel',           0.50,  1),
(18, 'Chief Colonel',     0.10,  1),
(19, 'Basic General',     0.01,  1),
(20, 'General',           0.00,  0),
(21, 'Administrator',     0.00,  0),
(22, 'Wanted',            0.00,  0);

-- Rewards table.
--
-- All rewards available so there's no need of JSON.
--
CREATE TABLE `rewards` (
    `id`          smallint      NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `items_id`    smallint      NOT NULL                COMMENT 'Item to award.',
    `amount`      int           NOT NULL                COMMENT 'Amount of items to award.',
    `probability` float         NOT NULL DEFAULT 100.00 COMMENT 'Probability of awarding this item',
    `comment`     varchar(255)  NULL     DEFAULT NULL   COMMENT 'Comment of the reward.',

    CONSTRAINT `rewards_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'All rewards available so there''s no need of JSON.';

CREATE INDEX `rewards_items_id` ON `rewards` (`items_id`);

-- Initial dump for the `rewards` table.

INSERT INTO `rewards`(`id`, `items_id`, `amount`, `probability`, `comment`) VALUES
(1,    1,   400,      100,   '-=[Streuner]=- npc'),
(2,    2,   1,        100,   '-=[Streuner]=- npc'),
(3,    4,   400,      100,   '-=[Streuner]=- npc'),
(4,    5,   2,        100,   '-=[Streuner]=- npc'),
(5,    1,   800,      100,   '-=[Lordakia]=- npc'),
(6,    2,   2,        100,   '-=[Lordakia]=- npc'),
(7,    4,   800,      100,   '-=[Lordakia]=- npc'),
(8,    5,   4,        100,   '-=[Lordakia]=- npc'),
(9,    1,   1600,     100,   '-=[Saimon]=- npc'),
(10,   2,   4,        100,   '-=[Saimon]=- npc'),
(11,   4,   1600,     100,   '-=[Saimon]=- npc'),
(12,   5,   8,        100,   '-=[Saimon]=- npc'),
(13,   1,   6400,     100,   '-=[Mordon]=- npc'),
(14,   2,   8,        100,   '-=[Mordon]=- npc'),
(15,   4,   3200,     100,   '-=[Mordon]=- npc'),
(16,   5,   16,       100,   '-=[Mordon]=- npc'),
(17,   1,   51200,    100,   '-=[Devolarium]=- npc'),
(18,   2,   16,       100,   '-=[Devolarium]=- npc'),
(19,   4,   6400,     100,   '-=[Devolarium]=- npc'),
(20,   5,   32,       100,   '-=[Devolarium]=- npc'),
(21,   1,   102400,   100,   '-=[Sibelon]=- npc'),
(22,   2,   32,       100,   '-=[Sibelon]=- npc'),
(23,   4,   12800,    100,   '-=[Sibelon]=- npc'),
(24,   5,   64,       100,   '-=[Sibelon]=- npc'),
(25,   1,   12800,    100,   '-=[Sibelonit]=- npc'),
(26,   2,   12,       100,   '-=[Sibelonit]=- npc'),
(27,   4,   3200,     100,   '-=[Sibelonit]=- npc'),
(28,   5,   16,       100,   '-=[Sibelonit]=- npc'),
(29,   1,   204800,   100,   '-=[Lordakium]=- npc'),
(30,   2,   64,       100,   '-=[Lordakium]=- npc'),
(31,   4,   25600,    100,   '-=[Lordakium]=- npc'),
(32,   5,   128,      100,   '-=[Lordakium]=- npc'),
(33,   1,   12800,    100,   '-=[Kristallin]=- npc'),
(34,   2,   16,       100,   '-=[Kristallin]=- npc'),
(35,   4,   6400,     100,   '-=[Kristallin]=- npc'),
(36,   5,   32,       100,   '-=[Kristallin]=- npc'),
(37,   1,   409600,   100,   '-=[Kristallon]=- npc'),
(38,   2,   128,      100,   '-=[Kristallon]=- npc'),
(39,   4,   51200,    100,   '-=[Kristallon]=- npc'),
(40,   5,   256,      100,   '-=[Kristallon]=- npc'),
(41,   1,   12800,    100,   '-=[Protegit]=- npc'),
(42,   2,   16,       100,   '-=[Protegit]=- npc'),
(43,   4,   6400,     100,   '-=[Protegit]=- npc'),
(44,   5,   32,       100,   '-=[Protegit]=- npc'),
(45,   1,   1638400,  100,   '-=[Cubikon]=- npc'),
(46,   2,   1024,     100,   '-=[Cubikon]=- npc'),
(47,   4,   512000,   100,   '-=[Cubikon]=- npc'),
(48,   5,   4096,     100,   '-=[Cubikon]=- npc'),
(49,   1,   6400,     100,   '-=[StreuneR]=- npc'),
(50,   2,   8,        100,   '-=[StreuneR]=- npc'),
(51,   4,   3200,     100,   '-=[StreuneR]=- npc'),
(52,   5,   16,       100,   '-=[StreuneR]=- npc'),
(53,   1,   1600,     100,   '..::{Boss Streuner}::.. npc'),
(54,   2,   4,        100,   '..::{Boss Streuner}::.. npc'),
(55,   4,   1600,     100,   '..::{Boss Streuner}::.. npc'),
(56,   5,   8,        100,   '..::{Boss Streuner}::.. npc'),
(57,   1,   3200,     100,   '..::{Boss Lordakia}::.. npc'),
(58,   2,   8,        100,   '..::{Boss Lordakia}::.. npc'),
(59,   4,   3200,     100,   '..::{Boss Lordakia}::.. npc'),
(60,   5,   16,       100,   '..::{Boss Lordakia}::.. npc'),
(61,   1,   6400,     100,   '..::{Boss Saimon}::.. npc'),
(62,   2,   16,       100,   '..::{Boss Saimon}::.. npc'),
(63,   4,   6400,     100,   '..::{Boss Saimon}::.. npc'),
(64,   5,   32,       100,   '..::{Boss Saimon}::.. npc'),
(65,   1,   51200,    100,   '..::{Boss Mordon}::.. npc'),
(66,   2,   32,       100,   '..::{Boss Mordon}::.. npc'),
(67,   4,   12800,    100,   '..::{Boss Mordon}::.. npc'),
(68,   5,   64,       100,   '..::{Boss Mordon}::.. npc'),
(69,   1,   204800,   100,   '..::{Boss Devolarium}::.. npc'),
(70,   2,   64,       100,   '..::{Boss Devolarium}::.. npc'),
(71,   4,   25600,    100,   '..::{Boss Devolarium}::.. npc'),
(72,   5,   128,      100,   '..::{Boss Devolarium}::.. npc'),
(73,   1,   408600,   100,   '..::{Boss Sibelon}::.. npc'),
(74,   2,   128,      100,   '..::{Boss Sibelon}::.. npc'),
(75,   4,   51200,    100,   '..::{Boss Sibelon}::.. npc'),
(76,   5,   256,      100,   '..::{Boss Sibelon}::.. npc'),
(77,   1,   51200,    100,   '..::{Boss Sibelonit}::.. npc'),
(78,   2,   64,       100,   '..::{Boss Sibelonit}::.. npc'),
(79,   4,   12800,    100,   '..::{Boss Sibelonit}::.. npc'),
(80,   5,   128,      100,   '..::{Boss Sibelonit}::.. npc'),
(81,   1,   819200,   100,   '..::{Boss Lordakium}::.. npc'),
(82,   2,   256,      100,   '..::{Boss Lordakium}::.. npc'),
(83,   4,   102400,   100,   '..::{Boss Lordakium}::.. npc'),
(84,   5,   512,      100,   '..::{Boss Lordakium}::.. npc'),
(85,   1,   51200,    100,   '..::{Boss Kristallin}::.. npc'),
(86,   2,   64,       100,   '..::{Boss Kristallin}::.. npc'),
(87,   4,   25600,    100,   '..::{Boss Kristallin}::.. npc'),
(88,   5,   128,      100,   '..::{Boss Kristallin}::.. npc'),
(89,   1,   1634400,  100,   '..::{Boss Kristallon}::.. npc'),
(90,   2,   512,      100,   '..::{Boss Kristallon}::.. npc'),
(91,   4,   204800,   100,   '..::{Boss Kristallon}::.. npc'),
(92,   5,   1024,     100,   '..::{Boss Kristallon}::.. npc'),
(93,   1,   51200,    100,   '..::{Boss StreuneR}::.. npc'),
(94,   2,   32,       100,   '..::{Boss StreuneR}::.. npc'),
(95,   4,   12800,    100,   '..::{Boss StreuneR}::.. npc'),
(96,   5,   64,       100,   '..::{Boss StreuneR}::.. npc'),
(97,   1,   3200,     100,   '<-o(Uber Streuner)o-> npc'),
(98,   2,   8,        100,   '<-o(Uber Streuner)o-> npc'),
(99,   4,   3200,     100,   '<-o(Uber Streuner)o-> npc'),
(100,  5,   16,       100,   '<-o(Uber Streuner)o-> npc'),
(101,  1,   6400,     100,   '<-o(Uber Lordakia)o-> npc'),
(102,  2,   16,       100,   '<-o(Uber Lordakia)o-> npc'),
(103,  4,   6400,     100,   '<-o(Uber Lordakia)o-> npc'),
(104,  5,   32,       100,   '<-o(Uber Lordakia)o-> npc'),
(105,  1,   12800,    100,   '<-o(Uber Saimon)o-> npc'),
(106,  2,   32,       100,   '<-o(Uber Saimon)o-> npc'),
(107,  4,   12800,    100,   '<-o(Uber Saimon)o-> npc'),
(108,  5,   64,       100,   '<-o(Uber Saimon)o-> npc'),
(109,  1,   102400,   100,   '<-o(Uber Mordon)o-> npc'),
(110,  2,   64,       100,   '<-o(Uber Mordon)o-> npc'),
(111,  4,   25600,    100,   '<-o(Uber Mordon)o-> npc'),
(112,  5,   128,      100,   '<-o(Uber Mordon)o-> npc'),
(113,  1,   408600,   100,   '<-o(Uber Devolarium)o-> npc'),
(114,  2,   128,      100,   '<-o(Uber Devolarium)o-> npc'),
(115,  4,   51200,    100,   '<-o(Uber Devolarium)o-> npc'),
(116,  5,   256,      100,   '<-o(Uber Devolarium)o-> npc'),
(117,  1,   819200,   100,   '<-o(Uber Sibelon)o-> npc'),
(118,  2,   256,      100,   '<-o(Uber Sibelon)o-> npc'),
(119,  4,   102400,   100,   '<-o(Uber Sibelon)o-> npc'),
(120,  5,   512,      100,   '<-o(Uber Sibelon)o-> npc'),
(121,  1,   102400,   100,   '<-o(Uber Sibelonit)o-> npc'),
(122,  2,   128,      100,   '<-o(Uber Sibelonit)o-> npc'),
(123,  4,   25600,    100,   '<-o(Uber Sibelonit)o-> npc'),
(124,  5,   256,      100,   '<-o(Uber Sibelonit)o-> npc'),
(125,  1,   1638400,  100,   '<-o(Uber Lordakium)o-> npc'),
(126,  2,   512,      100,   '<-o(Uber Lordakium)o-> npc'),
(127,  4,   204800,   100,   '<-o(Uber Lordakium)o-> npc'),
(128,  5,   1025,     100,   '<-o(Uber Lordakium)o-> npc'),
(129,  1,   102400,   100,   '<-o(Uber Kristallin)o-> npc'),
(130,  2,   128,      100,   '<-o(Uber Kristallin)o-> npc'),
(131,  4,   51200,    100,   '<-o(Uber Kristallin)o-> npc'),
(132,  5,   256,      100,   '<-o(Uber Kristallin)o-> npc'),
(133,  1,   3268800,  100,   '<-o(Uber Kristallon)o-> npc'),
(134,  2,   1024,     100,   '<-o(Uber Kristallon)o-> npc'),
(135,  4,   409600,   100,   '<-o(Uber Kristallon)o-> npc'),
(136,  5,   2048,     100,   '<-o(Uber Kristallon)o-> npc'),
(137,  1,   103400,   100,   '<-o(Uber StreuneR)o-> npc'),
(138,  2,   64,       100,   '<-o(Uber StreuneR)o-> npc'),
(139,  4,   25600,    100,   '<-o(Uber StreuneR)o-> npc'),
(140,  5,   128,      100,   '<-o(Uber StreuneR)o-> npc'),
(141,  1,   25000,    100,   '-=[Interceptor]=- npc'),
(142,  2,   20,       100,   '-=[Interceptor]=- npc'),
(143,  4,   7500,     100,   '-=[Interceptor]=- npc'),
(144,  5,   24,       100,   '-=[Interceptor]=- npc'),
(145,  1,   90000,    100,   '-=[Barracuda]=- npc'),
(146,  2,   25,       100,   '-=[Barracuda]=- npc'),
(147,  4,   15000,    100,   '-=[Barracuda]=- npc'),
(148,  5,   56,       100,   '-=[Barracuda]=- npc'),
(149,  1,   125000,   100,   '-=[Saboteur]=- npc'),
(150,  2,   45,       100,   '-=[Saboteur]=- npc'),
(151,  4,   22500,    100,   '-=[Saboteur]=- npc'),
(152,  5,   72,       100,   '-=[Saboteur]=- npc'),
(153,  1,   250000,   100,   '-=[Annihilator]=- npc'),
(154,  2,   65,       100,   '-=[Annihilator]=- npc'),
(155,  4,   75000,    100,   '-=[Annihilator]=- npc'),
(156,  5,   128,      100,   '-=[Annihilator]=- npc'),
(157,  1,   1750000,  100,   '-=[Battleray]=- npc'),
(158,  2,   175,      100,   '-=[Battleray]=- npc'),
(159,  4,   125000,   100,   '-=[Battleray]=- npc'),
(160,  5,   192,      100,   '-=[Battleray]=- npc'),
(161,  1,   12000,    100,   '-=[Corsair]=- npc'),
(162,  2,   64,       100,   '-=[Corsair]=- npc'),
(163,  4,   10000,    100,   '-=[Corsair]=- npc'),
(164,  5,   32,       100,   '-=[Corsair]=- npc'),
(165,  1,   7500,     100,   '-=[Outcast]=- npc'),
(166,  2,   24,       100,   '-=[Outcast]=- npc'),
(167,  4,   7500,     100,   '-=[Outcast]=- npc'),
(168,  5,   12,       100,   '-=[Outcast]=- npc'),
(169,  1,   4500,     100,   '-=[Marauder]=- npc'),
(170,  2,   16,       100,   '-=[Marauder]=- npc'),
(171,  4,   4500,     100,   '-=[Marauder]=- npc'),
(172,  5,   8,        100,   '-=[Marauder]=- npc'),
(173,  1,   2000,     100,   '-=[Vagrant]=- npc'),
(174,  2,   8,        100,   '-=[Vagrant]=- npc'),
(175,  4,   2000,     100,   '-=[Vagrant]=- npc'),
(176,  5,   4,        100,   '-=[Vagrant]=- npc'),
(177,  1,   25000,    100,   '-=[Convict]=- npc'),
(178,  2,   128,      100,   '-=[Convict]=- npc'),
(179,  4,   18000,    100,   '-=[Convict]=- npc'),
(180,  5,   64,       100,   '-=[Convict]=- npc'),
(181,  1,   15000,    100,   '-=[Hooligan]=- npc'),
(182,  2,   32,       100,   '-=[Hooligan]=- npc'),
(183,  4,   12000,    100,   '-=[Hooligan]=- npc'),
(184,  5,   16,       100,   '-=[Hooligan]=- npc'),
(185,  1,   20000,    100,   '-=[Ravager]=- npc'),
(186,  2,   128,      100,   '-=[Ravager]=- npc'),
(187,  4,   15000,    100,   '-=[Ravager]=- npc'),
(188,  5,   64,       100,   '-=[Ravager]=- npc'),
(189,  1,   1000000,  100,   '-=[Century Falcon]=- npc'),
(190,  2,   5000,     100,   '-=[Century Falcon]=- npc'),
(191,  4,   1000000,  100,   '-=[Century Falcon]=- npc'),
(192,  5,   5000,     100,   '-=[Century Falcon]=- npc'),
(193,  1,   800,      100,   '-=[Lordakia]=- npc'),
(194,  2,   2,        100,   '-=[Lordakia]=- npc'),
(195,  4,   800,      100,   '-=[Lordakia]=- npc'),
(196,  5,   4,        100,   '-=[Lordakia]=- npc'),
(197,  1,   12800,    100,   '-=[Havok]=- npc'),
(198,  2,   32,       100,   '-=[Havok]=- npc'),
(199,  4,   12800,    100,   '-=[Havok]=- npc'),
(200,  5,   64,       100,   '-=[Havok]=- npc'),
(201,  1,   200,      5.26,  'box0 collectable'),
(202,  1,   500,      5.26,  'box0 collectable'),
(203,  1,   1000,     5.26,  'box0 collectable'),
(204,  2,   20,       5.26,  'box0 collectable'),
(205,  2,   50,       5.26,  'box0 collectable'),
(206,  2,   100,      5.26,  'box0 collectable'),
(207,  3,   0.25,     5.26,  'box0 collectable'),
(208,  3,   0.5,      5.26,  'box0 collectable'),
(209,  3,   1,        5.26,  'box0 collectable'),
(210,  8,   1,        5.26,  'box0 collectable'),
(211,  59,  20,       5.26,  'box0 collectable'),
(212,  59,  50,       5.26,  'box0 collectable'),
(213,  59,  10,       5.26,  'box0 collectable'),
(214,  60,  20,       5.26,  'box0 collectable'),
(215,  60,  50,       5.26,  'box0 collectable'),
(216,  60,  10,       5.26,  'box0 collectable'),
(217,  61,  20,       5.26,  'box0 collectable'),
(218,  61,  50,       5.26,  'box0 collectable'),
(219,  61,  10,       5.26,  'box0 collectable'),
(220,  2,   50000,    0.06,  'box0 collectable'),
(221,  1,   400,      5.26,  'easterEgg collectable'),
(222,  1,   1000,     5.26,  'easterEgg collectable'),
(223,  1,   2000,     5.26,  'easterEgg collectable'),
(224,  2,   40,       5.26,  'easterEgg collectable'),
(225,  2,   100,      5.26,  'easterEgg collectable'),
(226,  2,   200,      5.26,  'easterEgg collectable'),
(227,  3,   0.5,      5.26,  'easterEgg collectable'),
(228,  3,   1,        5.26,  'easterEgg collectable'),
(229,  3,   2,        5.26,  'easterEgg collectable'),
(230,  8,   2,        5.26,  'easterEgg collectable'),
(231,  59,  40,       5.26,  'easterEgg collectable'),
(232,  59,  100,      5.26,  'easterEgg collectable'),
(233,  59,  20,       5.26,  'easterEgg collectable'),
(234,  60,  40,       5.26,  'easterEgg collectable'),
(235,  60,  100,      5.26,  'easterEgg collectable'),
(236,  60,  20,       5.26,  'easterEgg collectable'),
(237,  61,  40,       5.26,  'easterEgg collectable'),
(238,  61,  100,      5.26,  'easterEgg collectable'),
(239,  61,  20,       5.26,  'easterEgg collectable'),
(240,  2,   100000,   0.06,  'easterEgg collectable'),
(241,  1,   400,      5.26,  'bigPumpkin collectable'),
(242,  1,   1000,     5.26,  'bigPumpkin collectable'),
(243,  1,   2000,     5.26,  'bigPumpkin collectable'),
(244,  2,   40,       5.26,  'bigPumpkin collectable'),
(245,  2,   100,      5.26,  'bigPumpkin collectable'),
(246,  2,   200,      5.26,  'bigPumpkin collectable'),
(247,  3,   0.5,      5.26,  'bigPumpkin collectable'),
(248,  3,   1,        5.26,  'bigPumpkin collectable'),
(249,  3,   2,        5.26,  'bigPumpkin collectable'),
(250,  8,   2,        5.26,  'bigPumpkin collectable'),
(251,  59,  40,       5.26,  'bigPumpkin collectable'),
(252,  59,  100,      5.26,  'bigPumpkin collectable'),
(253,  59,  20,       5.26,  'bigPumpkin collectable'),
(254,  60,  40,       5.26,  'bigPumpkin collectable'),
(255,  60,  100,      5.26,  'bigPumpkin collectable'),
(256,  60,  20,       5.26,  'bigPumpkin collectable'),
(257,  61,  40,       5.26,  'bigPumpkin collectable'),
(258,  61,  100,      5.26,  'bigPumpkin collectable'),
(259,  61,  20,       5.26,  'bigPumpkin collectable'),
(260,  2,   100000,   0.06,  'bigPumpkin collectable'),
(261,  1,   400,      5.26,  'orangePumpkin collectable'),
(262,  1,   1000,     5.26,  'orangePumpkin collectable'),
(263,  1,   2000,     5.26,  'orangePumpkin collectable'),
(264,  2,   40,       5.26,  'orangePumpkin collectable'),
(265,  2,   100,      5.26,  'orangePumpkin collectable'),
(266,  2,   200,      5.26,  'orangePumpkin collectable'),
(267,  3,   0.5,      5.26,  'orangePumpkin collectable'),
(268,  3,   1,        5.26,  'orangePumpkin collectable'),
(269,  3,   2,        5.26,  'orangePumpkin collectable'),
(270,  8,   2,        5.26,  'orangePumpkin collectable'),
(271,  59,  40,       5.26,  'orangePumpkin collectable'),
(272,  59,  100,      5.26,  'orangePumpkin collectable'),
(273,  59,  20,       5.26,  'orangePumpkin collectable'),
(274,  60,  40,       5.26,  'orangePumpkin collectable'),
(275,  60,  100,      5.26,  'orangePumpkin collectable'),
(276,  60,  20,       5.26,  'orangePumpkin collectable'),
(277,  61,  40,       5.26,  'orangePumpkin collectable'),
(278,  61,  100,      5.26,  'orangePumpkin collectable'),
(279,  61,  20,       5.26,  'orangePumpkin collectable'),
(280,  2,   100000,   0.06,  'orangePumpkin collectable'),
(281,  1,   400,      5.26,  'turkey collectable'),
(282,  1,   1000,     5.26,  'turkey collectable'),
(283,  1,   2000,     5.26,  'turkey collectable'),
(284,  2,   40,       5.26,  'turkey collectable'),
(285,  2,   100,      5.26,  'turkey collectable'),
(286,  2,   200,      5.26,  'turkey collectable'),
(287,  3,   0.5,      5.26,  'turkey collectable'),
(288,  3,   1,        5.26,  'turkey collectable'),
(289,  3,   2,        5.26,  'turkey collectable'),
(290,  8,   2,        5.26,  'turkey collectable'),
(291,  59,  40,       5.26,  'turkey collectable'),
(292,  59,  100,      5.26,  'turkey collectable'),
(293,  59,  20,       5.26,  'turkey collectable'),
(294,  60,  40,       5.26,  'turkey collectable'),
(295,  60,  100,      5.26,  'turkey collectable'),
(296,  60,  20,       5.26,  'turkey collectable'),
(297,  61,  40,       5.26,  'turkey collectable'),
(298,  61,  100,      5.26,  'turkey collectable'),
(299,  61,  20,       5.26,  'turkey collectable'),
(300,  2,   100000,   0.06,  'turkey collectable'),
(301,  1,   400,      5.26,  'bigXmasStar collectable'),
(302,  1,   1000,     5.26,  'bigXmasStar collectable'),
(303,  1,   2000,     5.26,  'bigXmasStar collectable'),
(304,  2,   40,       5.26,  'bigXmasStar collectable'),
(305,  2,   100,      5.26,  'bigXmasStar collectable'),
(306,  2,   200,      5.26,  'bigXmasStar collectable'),
(307,  3,   0.5,      5.26,  'bigXmasStar collectable'),
(308,  3,   1,        5.26,  'bigXmasStar collectable'),
(309,  3,   2,        5.26,  'bigXmasStar collectable'),
(310,  8,   2,        5.26,  'bigXmasStar collectable'),
(311,  59,  40,       5.26,  'bigXmasStar collectable'),
(312,  59,  100,      5.26,  'bigXmasStar collectable'),
(313,  59,  20,       5.26,  'bigXmasStar collectable'),
(314,  60,  40,       5.26,  'bigXmasStar collectable'),
(315,  60,  100,      5.26,  'bigXmasStar collectable'),
(316,  60,  20,       5.26,  'bigXmasStar collectable'),
(317,  61,  40,       5.26,  'bigXmasStar collectable'),
(318,  61,  100,      5.26,  'bigXmasStar collectable'),
(319,  61,  20,       5.26,  'bigXmasStar collectable'),
(320,  2,   100000,   0.06,  'bigXmasStar collectable'),
(321,  1,   400,      5.26,  'stdXmasStar collectable'),
(322,  1,   1000,     5.26,  'stdXmasStar collectable'),
(323,  1,   2000,     5.26,  'stdXmasStar collectable'),
(324,  2,   40,       5.26,  'stdXmasStar collectable'),
(325,  2,   100,      5.26,  'stdXmasStar collectable'),
(326,  2,   200,      5.26,  'stdXmasStar collectable'),
(327,  3,   0.5,      5.26,  'stdXmasStar collectable'),
(328,  3,   1,        5.26,  'stdXmasStar collectable'),
(329,  3,   2,        5.26,  'stdXmasStar collectable'),
(330,  8,   2,        5.26,  'stdXmasStar collectable'),
(331,  59,  40,       5.26,  'stdXmasStar collectable'),
(332,  59,  100,      5.26,  'stdXmasStar collectable'),
(333,  59,  20,       5.26,  'stdXmasStar collectable'),
(334,  60,  40,       5.26,  'stdXmasStar collectable'),
(335,  60,  100,      5.26,  'stdXmasStar collectable'),
(336,  60,  20,       5.26,  'stdXmasStar collectable'),
(337,  61,  40,       5.26,  'stdXmasStar collectable'),
(338,  61,  100,      5.26,  'stdXmasStar collectable'),
(339,  61,  20,       5.26,  'stdXmasStar collectable'),
(340,  2,   100000,   0.06,  'stdXmasStar collectable'),
(341,  1,   400,      5.26,  'flower_mothersday collectable'),
(342,  1,   1000,     5.26,  'flower_mothersday collectable'),
(343,  1,   2000,     5.26,  'flower_mothersday collectable'),
(344,  2,   40,       5.26,  'flower_mothersday collectable'),
(345,  2,   100,      5.26,  'flower_mothersday collectable'),
(346,  2,   200,      5.26,  'flower_mothersday collectable'),
(347,  3,   0.5,      5.26,  'flower_mothersday collectable'),
(348,  3,   1,        5.26,  'flower_mothersday collectable'),
(349,  3,   2,        5.26,  'flower_mothersday collectable'),
(350,  8,   2,        5.26,  'flower_mothersday collectable'),
(351,  59,  40,       5.26,  'flower_mothersday collectable'),
(352,  59,  100,      5.26,  'flower_mothersday collectable'),
(353,  59,  20,       5.26,  'flower_mothersday collectable'),
(354,  60,  40,       5.26,  'flower_mothersday collectable'),
(355,  60,  100,      5.26,  'flower_mothersday collectable'),
(356,  60,  20,       5.26,  'flower_mothersday collectable'),
(357,  61,  40,       5.26,  'flower_mothersday collectable'),
(358,  61,  100,      5.26,  'flower_mothersday collectable'),
(359,  61,  20,       5.26,  'flower_mothersday collectable'),
(360,  2,   100000,   0.06,  'flower_mothersday collectable'),
(361,  1,   400,      5.26,  'theItalianBox collectable'),
(362,  1,   1000,     5.26,  'theItalianBox collectable'),
(363,  1,   2000,     5.26,  'theItalianBox collectable'),
(364,  2,   40,       5.26,  'theItalianBox collectable'),
(365,  2,   100,      5.26,  'theItalianBox collectable'),
(366,  2,   200,      5.26,  'theItalianBox collectable'),
(367,  3,   0.5,      5.26,  'theItalianBox collectable'),
(368,  3,   1,        5.26,  'theItalianBox collectable'),
(369,  3,   2,        5.26,  'theItalianBox collectable'),
(370,  8,   2,        5.26,  'theItalianBox collectable'),
(371,  59,  40,       5.26,  'theItalianBox collectable'),
(372,  59,  100,      5.26,  'theItalianBox collectable'),
(373,  59,  20,       5.26,  'theItalianBox collectable'),
(374,  60,  40,       5.26,  'theItalianBox collectable'),
(375,  60,  100,      5.26,  'theItalianBox collectable'),
(376,  60,  20,       5.26,  'theItalianBox collectable'),
(377,  61,  40,       5.26,  'theItalianBox collectable'),
(378,  61,  100,      5.26,  'theItalianBox collectable'),
(379,  61,  20,       5.26,  'theItalianBox collectable'),
(380,  2,   100000,   0.06,  'theItalianBox collectable'),
(381,  1,   400,      5.26,  'crestAndStar collectable'),
(382,  1,   1000,     5.26,  'crestAndStar collectable'),
(383,  1,   2000,     5.26,  'crestAndStar collectable'),
(384,  2,   40,       5.26,  'crestAndStar collectable'),
(385,  2,   100,      5.26,  'crestAndStar collectable'),
(386,  2,   200,      5.26,  'crestAndStar collectable'),
(387,  3,   0.5,      5.26,  'crestAndStar collectable'),
(388,  3,   1,        5.26,  'crestAndStar collectable'),
(389,  3,   2,        5.26,  'crestAndStar collectable'),
(390,  8,   2,        5.26,  'crestAndStar collectable'),
(391,  59,  40,       5.26,  'crestAndStar collectable'),
(392,  59,  100,      5.26,  'crestAndStar collectable'),
(393,  59,  20,       5.26,  'crestAndStar collectable'),
(394,  60,  40,       5.26,  'crestAndStar collectable'),
(395,  60,  100,      5.26,  'crestAndStar collectable'),
(396,  60,  20,       5.26,  'crestAndStar collectable'),
(397,  61,  40,       5.26,  'crestAndStar collectable'),
(398,  61,  100,      5.26,  'crestAndStar collectable'),
(399,  61,  20,       5.26,  'crestAndStar collectable'),
(400,  2,   100000,   0.06,  'crestAndStar collectable'),
(401,  1,   400,      5.26,  'polishBonusBox collectable'),
(402,  1,   1000,     5.26,  'polishBonusBox collectable'),
(403,  1,   2000,     5.26,  'polishBonusBox collectable'),
(404,  2,   40,       5.26,  'polishBonusBox collectable'),
(405,  2,   100,      5.26,  'polishBonusBox collectable'),
(406,  2,   200,      5.26,  'polishBonusBox collectable'),
(407,  3,   0.5,      5.26,  'polishBonusBox collectable'),
(408,  3,   1,        5.26,  'polishBonusBox collectable'),
(409,  3,   2,        5.26,  'polishBonusBox collectable'),
(410,  8,   2,        5.26,  'polishBonusBox collectable'),
(411,  59,  40,       5.26,  'polishBonusBox collectable'),
(412,  59,  100,      5.26,  'polishBonusBox collectable'),
(413,  59,  20,       5.26,  'polishBonusBox collectable'),
(414,  60,  40,       5.26,  'polishBonusBox collectable'),
(415,  60,  100,      5.26,  'polishBonusBox collectable'),
(416,  60,  20,       5.26,  'polishBonusBox collectable'),
(417,  61,  40,       5.26,  'polishBonusBox collectable'),
(418,  61,  100,      5.26,  'polishBonusBox collectable'),
(419,  61,  20,       5.26,  'polishBonusBox collectable'),
(420,  2,   100000,   0.06,  'polishBonusBox collectable'),
(421,  1,   400,      5.26,  'winterGiftBox collectable'),
(422,  1,   1000,     5.26,  'winterGiftBox collectable'),
(423,  1,   2000,     5.26,  'winterGiftBox collectable'),
(424,  2,   40,       5.26,  'winterGiftBox collectable'),
(425,  2,   100,      5.26,  'winterGiftBox collectable'),
(426,  2,   200,      5.26,  'winterGiftBox collectable'),
(427,  3,   0.5,      5.26,  'winterGiftBox collectable'),
(428,  3,   1,        5.26,  'winterGiftBox collectable'),
(429,  3,   2,        5.26,  'winterGiftBox collectable'),
(430,  8,   2,        5.26,  'winterGiftBox collectable'),
(431,  59,  40,       5.26,  'winterGiftBox collectable'),
(432,  59,  100,      5.26,  'winterGiftBox collectable'),
(433,  59,  20,       5.26,  'winterGiftBox collectable'),
(434,  60,  40,       5.26,  'winterGiftBox collectable'),
(435,  60,  100,      5.26,  'winterGiftBox collectable'),
(436,  60,  20,       5.26,  'winterGiftBox collectable'),
(437,  61,  40,       5.26,  'winterGiftBox collectable'),
(438,  61,  100,      5.26,  'winterGiftBox collectable'),
(439,  61,  20,       5.26,  'winterGiftBox collectable'),
(440,  2,   100000,   0.06,  'winterGiftBox collectable'),
(441,  1,   400,      5.26,  'carnival_box collectable'),
(442,  1,   1000,     5.26,  'carnival_box collectable'),
(443,  1,   2000,     5.26,  'carnival_box collectable'),
(444,  2,   40,       5.26,  'carnival_box collectable'),
(445,  2,   100,      5.26,  'carnival_box collectable'),
(446,  2,   200,      5.26,  'carnival_box collectable'),
(447,  3,   0.5,      5.26,  'carnival_box collectable'),
(448,  3,   1,        5.26,  'carnival_box collectable'),
(449,  3,   2,        5.26,  'carnival_box collectable'),
(450,  8,   2,        5.26,  'carnival_box collectable'),
(451,  59,  40,       5.26,  'carnival_box collectable'),
(452,  59,  100,      5.26,  'carnival_box collectable'),
(453,  59,  20,       5.26,  'carnival_box collectable'),
(454,  60,  40,       5.26,  'carnival_box collectable'),
(455,  60,  100,      5.26,  'carnival_box collectable'),
(456,  60,  20,       5.26,  'carnival_box collectable'),
(457,  61,  40,       5.26,  'carnival_box collectable'),
(458,  61,  100,      5.26,  'carnival_box collectable'),
(459,  61,  20,       5.26,  'carnival_box collectable'),
(460,  2,   100000,   0.06,  'carnival_box collectable'),
(461,  1,   400,      5.26,  'bonusBoxSun collectable'),
(462,  1,   1000,     5.26,  'bonusBoxSun collectable'),
(463,  1,   2000,     5.26,  'bonusBoxSun collectable'),
(464,  2,   40,       5.26,  'bonusBoxSun collectable'),
(465,  2,   100,      5.26,  'bonusBoxSun collectable'),
(466,  2,   200,      5.26,  'bonusBoxSun collectable'),
(467,  3,   0.5,      5.26,  'bonusBoxSun collectable'),
(468,  3,   1,        5.26,  'bonusBoxSun collectable'),
(469,  3,   2,        5.26,  'bonusBoxSun collectable'),
(470,  8,   2,        5.26,  'bonusBoxSun collectable'),
(471,  59,  40,       5.26,  'bonusBoxSun collectable'),
(472,  59,  100,      5.26,  'bonusBoxSun collectable'),
(473,  59,  20,       5.26,  'bonusBoxSun collectable'),
(474,  60,  40,       5.26,  'bonusBoxSun collectable'),
(475,  60,  100,      5.26,  'bonusBoxSun collectable'),
(476,  60,  20,       5.26,  'bonusBoxSun collectable'),
(477,  61,  40,       5.26,  'bonusBoxSun collectable'),
(478,  61,  100,      5.26,  'bonusBoxSun collectable'),
(479,  61,  20,       5.26,  'bonusBoxSun collectable'),
(480,  2,   100000,   0.06,  'bonusBoxSun collectable'),
(481,  1,   400,      5.26,  'petWeekBox collectable'),
(482,  1,   1000,     5.26,  'petWeekBox collectable'),
(483,  1,   2000,     5.26,  'petWeekBox collectable'),
(484,  2,   40,       5.26,  'petWeekBox collectable'),
(485,  2,   100,      5.26,  'petWeekBox collectable'),
(486,  2,   200,      5.26,  'petWeekBox collectable'),
(487,  3,   0.5,      5.26,  'petWeekBox collectable'),
(488,  3,   1,        5.26,  'petWeekBox collectable'),
(489,  3,   2,        5.26,  'petWeekBox collectable'),
(490,  8,   2,        5.26,  'petWeekBox collectable'),
(491,  59,  40,       5.26,  'petWeekBox collectable'),
(492,  59,  100,      5.26,  'petWeekBox collectable'),
(493,  59,  20,       5.26,  'petWeekBox collectable'),
(494,  60,  40,       5.26,  'petWeekBox collectable'),
(495,  60,  100,      5.26,  'petWeekBox collectable'),
(496,  60,  20,       5.26,  'petWeekBox collectable'),
(497,  61,  40,       5.26,  'petWeekBox collectable'),
(498,  61,  100,      5.26,  'petWeekBox collectable'),
(499,  61,  20,       5.26,  'petWeekBox collectable'),
(500,  2,   100000,   0.06,  'petWeekBox collectable'),
(501,  1,   400,      5.26,  'pirateBootyBox collectable'),
(502,  1,   1000,     5.26,  'pirateBootyBox collectable'),
(503,  1,   2000,     5.26,  'pirateBootyBox collectable'),
(504,  2,   40,       5.26,  'pirateBootyBox collectable'),
(505,  2,   100,      5.26,  'pirateBootyBox collectable'),
(506,  2,   200,      5.26,  'pirateBootyBox collectable'),
(507,  3,   0.5,      5.26,  'pirateBootyBox collectable'),
(508,  3,   1,        5.26,  'pirateBootyBox collectable'),
(509,  3,   2,        5.26,  'pirateBootyBox collectable'),
(510,  8,   2,        5.26,  'pirateBootyBox collectable'),
(511,  59,  40,       5.26,  'pirateBootyBox collectable'),
(512,  59,  100,      5.26,  'pirateBootyBox collectable'),
(513,  59,  20,       5.26,  'pirateBootyBox collectable'),
(514,  60,  40,       5.26,  'pirateBootyBox collectable'),
(515,  60,  100,      5.26,  'pirateBootyBox collectable'),
(516,  60,  20,       5.26,  'pirateBootyBox collectable'),
(517,  61,  40,       5.26,  'pirateBootyBox collectable'),
(518,  61,  100,      5.26,  'pirateBootyBox collectable'),
(519,  61,  20,       5.26,  'pirateBootyBox collectable'),
(520,  2,   100000,   0.06,  'pirateBootyBox collectable'),
(521,  1,   400,      5.26,  'pirateBootyGoldBox collectable'),
(522,  1,   1000,     5.26,  'pirateBootyGoldBox collectable'),
(523,  1,   2000,     5.26,  'pirateBootyGoldBox collectable'),
(524,  2,   40,       5.26,  'pirateBootyGoldBox collectable'),
(525,  2,   100,      5.26,  'pirateBootyGoldBox collectable'),
(526,  2,   200,      5.26,  'pirateBootyGoldBox collectable'),
(527,  3,   0.5,      5.26,  'pirateBootyGoldBox collectable'),
(528,  3,   1,        5.26,  'pirateBootyGoldBox collectable'),
(529,  3,   2,        5.26,  'pirateBootyGoldBox collectable'),
(530,  8,   2,        5.26,  'pirateBootyGoldBox collectable'),
(531,  59,  40,       5.26,  'pirateBootyGoldBox collectable'),
(532,  59,  100,      5.26,  'pirateBootyGoldBox collectable'),
(533,  59,  20,       5.26,  'pirateBootyGoldBox collectable'),
(534,  60,  40,       5.26,  'pirateBootyGoldBox collectable'),
(535,  60,  100,      5.26,  'pirateBootyGoldBox collectable'),
(536,  60,  20,       5.26,  'pirateBootyGoldBox collectable'),
(537,  61,  40,       5.26,  'pirateBootyGoldBox collectable'),
(538,  61,  100,      5.26,  'pirateBootyGoldBox collectable'),
(539,  61,  20,       5.26,  'pirateBootyGoldBox collectable'),
(540,  2,   100000,   0.06,  'pirateBootyGoldBox collectable'),
(541,  1,   400,      5.26,  'hungarianRevolutionBox collectable'),
(542,  1,   1000,     5.26,  'hungarianRevolutionBox collectable'),
(543,  1,   2000,     5.26,  'hungarianRevolutionBox collectable'),
(544,  2,   40,       5.26,  'hungarianRevolutionBox collectable'),
(545,  2,   100,      5.26,  'hungarianRevolutionBox collectable'),
(546,  2,   200,      5.26,  'hungarianRevolutionBox collectable'),
(547,  3,   0.5,      5.26,  'hungarianRevolutionBox collectable'),
(548,  3,   1,        5.26,  'hungarianRevolutionBox collectable'),
(549,  3,   2,        5.26,  'hungarianRevolutionBox collectable'),
(550,  8,   2,        5.26,  'hungarianRevolutionBox collectable'),
(551,  59,  40,       5.26,  'hungarianRevolutionBox collectable'),
(552,  59,  100,      5.26,  'hungarianRevolutionBox collectable'),
(553,  59,  20,       5.26,  'hungarianRevolutionBox collectable'),
(554,  60,  40,       5.26,  'hungarianRevolutionBox collectable'),
(555,  60,  100,      5.26,  'hungarianRevolutionBox collectable'),
(556,  60,  20,       5.26,  'hungarianRevolutionBox collectable'),
(557,  61,  40,       5.26,  'hungarianRevolutionBox collectable'),
(558,  61,  100,      5.26,  'hungarianRevolutionBox collectable'),
(559,  61,  20,       5.26,  'hungarianRevolutionBox collectable'),
(560,  2,   100000,   0.06,  'hungarianRevolutionBox collectable'),
(561,  1,   400,      5.26,  'stpatricksDayBox collectable'),
(562,  1,   1000,     5.26,  'stpatricksDayBox collectable'),
(563,  1,   2000,     5.26,  'stpatricksDayBox collectable'),
(564,  2,   40,       5.26,  'stpatricksDayBox collectable'),
(565,  2,   100,      5.26,  'stpatricksDayBox collectable'),
(566,  2,   200,      5.26,  'stpatricksDayBox collectable'),
(567,  3,   0.5,      5.26,  'stpatricksDayBox collectable'),
(568,  3,   1,        5.26,  'stpatricksDayBox collectable'),
(569,  3,   2,        5.26,  'stpatricksDayBox collectable'),
(570,  8,   2,        5.26,  'stpatricksDayBox collectable'),
(571,  59,  40,       5.26,  'stpatricksDayBox collectable'),
(572,  59,  100,      5.26,  'stpatricksDayBox collectable'),
(573,  59,  20,       5.26,  'stpatricksDayBox collectable'),
(574,  60,  40,       5.26,  'stpatricksDayBox collectable'),
(575,  60,  100,      5.26,  'stpatricksDayBox collectable'),
(576,  60,  20,       5.26,  'stpatricksDayBox collectable'),
(577,  61,  40,       5.26,  'stpatricksDayBox collectable'),
(578,  61,  100,      5.26,  'stpatricksDayBox collectable'),
(579,  61,  20,       5.26,  'stpatricksDayBox collectable'),
(580,  2,   100000,   0.06,  'stpatricksDayBox collectable'),
(581,  1,   400,      5.26,  'titanicBonusBox collectable'),
(582,  1,   1000,     5.26,  'titanicBonusBox collectable'),
(583,  1,   2000,     5.26,  'titanicBonusBox collectable'),
(584,  2,   40,       5.26,  'titanicBonusBox collectable'),
(585,  2,   100,      5.26,  'titanicBonusBox collectable'),
(586,  2,   200,      5.26,  'titanicBonusBox collectable'),
(587,  3,   0.5,      5.26,  'titanicBonusBox collectable'),
(588,  3,   1,        5.26,  'titanicBonusBox collectable'),
(589,  3,   2,        5.26,  'titanicBonusBox collectable'),
(590,  8,   2,        5.26,  'titanicBonusBox collectable'),
(591,  59,  40,       5.26,  'titanicBonusBox collectable'),
(592,  59,  100,      5.26,  'titanicBonusBox collectable'),
(593,  59,  20,       5.26,  'titanicBonusBox collectable'),
(594,  60,  40,       5.26,  'titanicBonusBox collectable'),
(595,  60,  100,      5.26,  'titanicBonusBox collectable'),
(596,  60,  20,       5.26,  'titanicBonusBox collectable'),
(597,  61,  40,       5.26,  'titanicBonusBox collectable'),
(598,  61,  100,      5.26,  'titanicBonusBox collectable'),
(599,  61,  20,       5.26,  'titanicBonusBox collectable'),
(600,  2,   100000,   0.06,  'titanicBonusBox collectable'),
(601,  1,   400,      5.26,  'brazilBonusBox collectable'),
(602,  1,   1000,     5.26,  'brazilBonusBox collectable'),
(603,  1,   2000,     5.26,  'brazilBonusBox collectable'),
(604,  2,   40,       5.26,  'brazilBonusBox collectable'),
(605,  2,   100,      5.26,  'brazilBonusBox collectable'),
(606,  2,   200,      5.26,  'brazilBonusBox collectable'),
(607,  3,   0.5,      5.26,  'brazilBonusBox collectable'),
(608,  3,   1,        5.26,  'brazilBonusBox collectable'),
(609,  3,   2,        5.26,  'brazilBonusBox collectable'),
(610,  8,   2,        5.26,  'brazilBonusBox collectable'),
(611,  59,  40,       5.26,  'brazilBonusBox collectable'),
(612,  59,  100,      5.26,  'brazilBonusBox collectable'),
(613,  59,  20,       5.26,  'brazilBonusBox collectable'),
(614,  60,  40,       5.26,  'brazilBonusBox collectable'),
(615,  60,  100,      5.26,  'brazilBonusBox collectable'),
(616,  60,  20,       5.26,  'brazilBonusBox collectable'),
(617,  61,  40,       5.26,  'brazilBonusBox collectable'),
(618,  61,  100,      5.26,  'brazilBonusBox collectable'),
(619,  61,  20,       5.26,  'brazilBonusBox collectable'),
(620,  2,   100000,   0.06,  'brazilBonusBox collectable'),
(621,  1,   400,      5.26,  'victoryFrBonusBox collectable'),
(622,  1,   1000,     5.26,  'victoryFrBonusBox collectable'),
(623,  1,   2000,     5.26,  'victoryFrBonusBox collectable'),
(624,  2,   40,       5.26,  'victoryFrBonusBox collectable'),
(625,  2,   100,      5.26,  'victoryFrBonusBox collectable'),
(626,  2,   200,      5.26,  'victoryFrBonusBox collectable'),
(627,  3,   0.5,      5.26,  'victoryFrBonusBox collectable'),
(628,  3,   1,        5.26,  'victoryFrBonusBox collectable'),
(629,  3,   2,        5.26,  'victoryFrBonusBox collectable'),
(630,  8,   2,        5.26,  'victoryFrBonusBox collectable'),
(631,  59,  40,       5.26,  'victoryFrBonusBox collectable'),
(632,  59,  100,      5.26,  'victoryFrBonusBox collectable'),
(633,  59,  20,       5.26,  'victoryFrBonusBox collectable'),
(634,  60,  40,       5.26,  'victoryFrBonusBox collectable'),
(635,  60,  100,      5.26,  'victoryFrBonusBox collectable'),
(636,  60,  20,       5.26,  'victoryFrBonusBox collectable'),
(637,  61,  40,       5.26,  'victoryFrBonusBox collectable'),
(638,  61,  100,      5.26,  'victoryFrBonusBox collectable'),
(639,  61,  20,       5.26,  'victoryFrBonusBox collectable'),
(640,  2,   100000,   0.06,  'victoryFrBonusBox collectable'),
(641,  1,   400,      5.26,  'victoryRuBonusBox collectable'),
(642,  1,   1000,     5.26,  'victoryRuBonusBox collectable'),
(643,  1,   2000,     5.26,  'victoryRuBonusBox collectable'),
(644,  2,   40,       5.26,  'victoryRuBonusBox collectable'),
(645,  2,   100,      5.26,  'victoryRuBonusBox collectable'),
(646,  2,   200,      5.26,  'victoryRuBonusBox collectable'),
(647,  3,   0.5,      5.26,  'victoryRuBonusBox collectable'),
(648,  3,   1,        5.26,  'victoryRuBonusBox collectable'),
(649,  3,   2,        5.26,  'victoryRuBonusBox collectable'),
(650,  8,   2,        5.26,  'victoryRuBonusBox collectable'),
(651,  59,  40,       5.26,  'victoryRuBonusBox collectable'),
(652,  59,  100,      5.26,  'victoryRuBonusBox collectable'),
(653,  59,  20,       5.26,  'victoryRuBonusBox collectable'),
(654,  60,  40,       5.26,  'victoryRuBonusBox collectable'),
(655,  60,  100,      5.26,  'victoryRuBonusBox collectable'),
(656,  60,  20,       5.26,  'victoryRuBonusBox collectable'),
(657,  61,  40,       5.26,  'victoryRuBonusBox collectable'),
(658,  61,  100,      5.26,  'victoryRuBonusBox collectable'),
(659,  61,  20,       5.26,  'victoryRuBonusBox collectable'),
(660,  2,   100000,   0.06,  'victoryRuBonusBox collectable'),
(661,  1,   400,      5.26,  'victoryCzBonusBox collectable'),
(662,  1,   1000,     5.26,  'victoryCzBonusBox collectable'),
(663,  1,   2000,     5.26,  'victoryCzBonusBox collectable'),
(664,  2,   40,       5.26,  'victoryCzBonusBox collectable'),
(665,  2,   100,      5.26,  'victoryCzBonusBox collectable'),
(666,  2,   200,      5.26,  'victoryCzBonusBox collectable'),
(667,  3,   0.5,      5.26,  'victoryCzBonusBox collectable'),
(668,  3,   1,        5.26,  'victoryCzBonusBox collectable'),
(669,  3,   2,        5.26,  'victoryCzBonusBox collectable'),
(670,  8,   2,        5.26,  'victoryCzBonusBox collectable'),
(671,  59,  40,       5.26,  'victoryCzBonusBox collectable'),
(672,  59,  100,      5.26,  'victoryCzBonusBox collectable'),
(673,  59,  20,       5.26,  'victoryCzBonusBox collectable'),
(674,  60,  40,       5.26,  'victoryCzBonusBox collectable'),
(675,  60,  100,      5.26,  'victoryCzBonusBox collectable'),
(676,  60,  20,       5.26,  'victoryCzBonusBox collectable'),
(677,  61,  40,       5.26,  'victoryCzBonusBox collectable'),
(678,  61,  100,      5.26,  'victoryCzBonusBox collectable'),
(679,  61,  20,       5.26,  'victoryCzBonusBox collectable'),
(680,  2,   100000,   0.06,  'victoryCzBonusBox collectable'),
(681,  1,   400,      5.26,  'boxStar collectable'),
(682,  1,   1000,     5.26,  'boxStar collectable'),
(683,  1,   2000,     5.26,  'boxStar collectable'),
(684,  2,   40,       5.26,  'boxStar collectable'),
(685,  2,   100,      5.26,  'boxStar collectable'),
(686,  2,   200,      5.26,  'boxStar collectable'),
(687,  3,   0.5,      5.26,  'boxStar collectable'),
(688,  3,   1,        5.26,  'boxStar collectable'),
(689,  3,   2,        5.26,  'boxStar collectable'),
(690,  8,   2,        5.26,  'boxStar collectable'),
(691,  59,  40,       5.26,  'boxStar collectable'),
(692,  59,  100,      5.26,  'boxStar collectable'),
(693,  59,  20,       5.26,  'boxStar collectable'),
(694,  60,  40,       5.26,  'boxStar collectable'),
(695,  60,  100,      5.26,  'boxStar collectable'),
(696,  60,  20,       5.26,  'boxStar collectable'),
(697,  61,  40,       5.26,  'boxStar collectable'),
(698,  61,  100,      5.26,  'boxStar collectable'),
(699,  61,  20,       5.26,  'boxStar collectable'),
(700,  2,   100000,   0.06,  'boxStar collectable'),
(701,  1,   400,      5.26,  'pirateBootyRedBox collectable'),
(702,  1,   1000,     5.26,  'pirateBootyRedBox collectable'),
(703,  1,   2000,     5.26,  'pirateBootyRedBox collectable'),
(704,  2,   40,       5.26,  'pirateBootyRedBox collectable'),
(705,  2,   100,      5.26,  'pirateBootyRedBox collectable'),
(706,  2,   200,      5.26,  'pirateBootyRedBox collectable'),
(707,  3,   0.5,      5.26,  'pirateBootyRedBox collectable'),
(708,  3,   1,        5.26,  'pirateBootyRedBox collectable'),
(709,  3,   2,        5.26,  'pirateBootyRedBox collectable'),
(710,  8,   2,        5.26,  'pirateBootyRedBox collectable'),
(711,  59,  40,       5.26,  'pirateBootyRedBox collectable'),
(712,  59,  100,      5.26,  'pirateBootyRedBox collectable'),
(713,  59,  20,       5.26,  'pirateBootyRedBox collectable'),
(714,  60,  40,       5.26,  'pirateBootyRedBox collectable'),
(715,  60,  100,      5.26,  'pirateBootyRedBox collectable'),
(716,  60,  20,       5.26,  'pirateBootyRedBox collectable'),
(717,  61,  40,       5.26,  'pirateBootyRedBox collectable'),
(718,  61,  100,      5.26,  'pirateBootyRedBox collectable'),
(719,  61,  20,       5.26,  'pirateBootyRedBox collectable'),
(720,  2,   100000,   0.06,  'pirateBootyRedBox collectable'),
(721,  1,   400,      5.26,  'pirateBootyBlueBox collectable'),
(722,  1,   1000,     5.26,  'pirateBootyBlueBox collectable'),
(723,  1,   2000,     5.26,  'pirateBootyBlueBox collectable'),
(724,  2,   40,       5.26,  'pirateBootyBlueBox collectable'),
(725,  2,   100,      5.26,  'pirateBootyBlueBox collectable'),
(726,  2,   200,      5.26,  'pirateBootyBlueBox collectable'),
(727,  3,   0.5,      5.26,  'pirateBootyBlueBox collectable'),
(728,  3,   1,        5.26,  'pirateBootyBlueBox collectable'),
(729,  3,   2,        5.26,  'pirateBootyBlueBox collectable'),
(730,  8,   2,        5.26,  'pirateBootyBlueBox collectable'),
(731,  59,  40,       5.26,  'pirateBootyBlueBox collectable'),
(732,  59,  100,      5.26,  'pirateBootyBlueBox collectable'),
(733,  59,  20,       5.26,  'pirateBootyBlueBox collectable'),
(734,  60,  40,       5.26,  'pirateBootyBlueBox collectable'),
(735,  60,  100,      5.26,  'pirateBootyBlueBox collectable'),
(736,  60,  20,       5.26,  'pirateBootyBlueBox collectable'),
(737,  61,  40,       5.26,  'pirateBootyBlueBox collectable'),
(738,  61,  100,      5.26,  'pirateBootyBlueBox collectable'),
(739,  61,  20,       5.26,  'pirateBootyBlueBox collectable'),
(740,  2,   100000,   0.06,  'pirateBootyBlueBox collectable'),
(741,  1,   400,      5.26,  'victoryFrBonusBox collectable'),
(742,  1,   1000,     5.26,  'victoryFrBonusBox collectable'),
(743,  1,   2000,     5.26,  'victoryFrBonusBox collectable'),
(744,  2,   40,       5.26,  'victoryFrBonusBox collectable'),
(745,  2,   100,      5.26,  'victoryFrBonusBox collectable'),
(746,  2,   200,      5.26,  'victoryFrBonusBox collectable'),
(747,  3,   0.5,      5.26,  'victoryFrBonusBox collectable'),
(748,  3,   1,        5.26,  'victoryFrBonusBox collectable'),
(749,  3,   2,        5.26,  'victoryFrBonusBox collectable'),
(750,  8,   2,        5.26,  'victoryFrBonusBox collectable'),
(751,  59,  40,       5.26,  'victoryFrBonusBox collectable'),
(752,  59,  100,      5.26,  'victoryFrBonusBox collectable'),
(753,  59,  20,       5.26,  'victoryFrBonusBox collectable'),
(754,  60,  40,       5.26,  'victoryFrBonusBox collectable'),
(755,  60,  100,      5.26,  'victoryFrBonusBox collectable'),
(756,  60,  20,       5.26,  'victoryFrBonusBox collectable'),
(757,  61,  40,       5.26,  'victoryFrBonusBox collectable'),
(758,  61,  100,      5.26,  'victoryFrBonusBox collectable'),
(759,  61,  20,       5.26,  'victoryFrBonusBox collectable'),
(760,  2,   100000,   0.06,  'victoryFrBonusBox collectable'),
(761,  1,   400,      5.26,  'mexicanBonusBox collectable'),
(762,  1,   1000,     5.26,  'mexicanBonusBox collectable'),
(763,  1,   2000,     5.26,  'mexicanBonusBox collectable'),
(764,  2,   40,       5.26,  'mexicanBonusBox collectable'),
(765,  2,   100,      5.26,  'mexicanBonusBox collectable'),
(766,  2,   200,      5.26,  'mexicanBonusBox collectable'),
(767,  3,   0.5,      5.26,  'mexicanBonusBox collectable'),
(768,  3,   1,        5.26,  'mexicanBonusBox collectable'),
(769,  3,   2,        5.26,  'mexicanBonusBox collectable'),
(770,  8,   2,        5.26,  'mexicanBonusBox collectable'),
(771,  59,  40,       5.26,  'mexicanBonusBox collectable'),
(772,  59,  100,      5.26,  'mexicanBonusBox collectable'),
(773,  59,  20,       5.26,  'mexicanBonusBox collectable'),
(774,  60,  40,       5.26,  'mexicanBonusBox collectable'),
(775,  60,  100,      5.26,  'mexicanBonusBox collectable'),
(776,  60,  20,       5.26,  'mexicanBonusBox collectable'),
(777,  61,  40,       5.26,  'mexicanBonusBox collectable'),
(778,  61,  100,      5.26,  'mexicanBonusBox collectable'),
(779,  61,  20,       5.26,  'mexicanBonusBox collectable'),
(780,  2,   100000,   0.06,  'mexicanBonusBox collectable'),
(781,  1,   400,      5.26,  'boxAntec collectable'),
(782,  1,   1000,     5.26,  'boxAntec collectable'),
(783,  1,   2000,     5.26,  'boxAntec collectable'),
(784,  2,   40,       5.26,  'boxAntec collectable'),
(785,  2,   100,      5.26,  'boxAntec collectable'),
(786,  2,   200,      5.26,  'boxAntec collectable'),
(787,  3,   0.5,      5.26,  'boxAntec collectable'),
(788,  3,   1,        5.26,  'boxAntec collectable'),
(789,  3,   2,        5.26,  'boxAntec collectable'),
(790,  8,   2,        5.26,  'boxAntec collectable'),
(791,  59,  40,       5.26,  'boxAntec collectable'),
(792,  59,  100,      5.26,  'boxAntec collectable'),
(793,  59,  20,       5.26,  'boxAntec collectable'),
(794,  60,  40,       5.26,  'boxAntec collectable'),
(795,  60,  100,      5.26,  'boxAntec collectable'),
(796,  60,  20,       5.26,  'boxAntec collectable'),
(797,  61,  40,       5.26,  'boxAntec collectable'),
(798,  61,  100,      5.26,  'boxAntec collectable'),
(799,  61,  20,       5.26,  'boxAntec collectable'),
(800,  2,   100000,   0.06,  'boxAntec collectable'),
(801,  1,   400,      5.26,  'germanUnificationDayBox collectable'),
(802,  1,   1000,     5.26,  'germanUnificationDayBox collectable'),
(803,  1,   2000,     5.26,  'germanUnificationDayBox collectable'),
(804,  2,   40,       5.26,  'germanUnificationDayBox collectable'),
(805,  2,   100,      5.26,  'germanUnificationDayBox collectable'),
(806,  2,   200,      5.26,  'germanUnificationDayBox collectable'),
(807,  3,   0.5,      5.26,  'germanUnificationDayBox collectable'),
(808,  3,   1,        5.26,  'germanUnificationDayBox collectable'),
(809,  3,   2,        5.26,  'germanUnificationDayBox collectable'),
(810,  8,   2,        5.26,  'germanUnificationDayBox collectable'),
(811,  59,  40,       5.26,  'germanUnificationDayBox collectable'),
(812,  59,  100,      5.26,  'germanUnificationDayBox collectable'),
(813,  59,  20,       5.26,  'germanUnificationDayBox collectable'),
(814,  60,  40,       5.26,  'germanUnificationDayBox collectable'),
(815,  60,  100,      5.26,  'germanUnificationDayBox collectable'),
(816,  60,  20,       5.26,  'germanUnificationDayBox collectable'),
(817,  61,  40,       5.26,  'germanUnificationDayBox collectable'),
(818,  61,  100,      5.26,  'germanUnificationDayBox collectable'),
(819,  61,  20,       5.26,  'germanUnificationDayBox collectable'),
(820,  2,   100000,   0.06,  'germanUnificationDayBox collectable'),
(821,  1,   400,      5.26,  'hispanicDayBox collectable'),
(822,  1,   1000,     5.26,  'hispanicDayBox collectable'),
(823,  1,   2000,     5.26,  'hispanicDayBox collectable'),
(824,  2,   40,       5.26,  'hispanicDayBox collectable'),
(825,  2,   100,      5.26,  'hispanicDayBox collectable'),
(826,  2,   200,      5.26,  'hispanicDayBox collectable'),
(827,  3,   0.5,      5.26,  'hispanicDayBox collectable'),
(828,  3,   1,        5.26,  'hispanicDayBox collectable'),
(829,  3,   2,        5.26,  'hispanicDayBox collectable'),
(830,  8,   2,        5.26,  'hispanicDayBox collectable'),
(831,  59,  40,       5.26,  'hispanicDayBox collectable'),
(832,  59,  100,      5.26,  'hispanicDayBox collectable'),
(833,  59,  20,       5.26,  'hispanicDayBox collectable'),
(834,  60,  40,       5.26,  'hispanicDayBox collectable'),
(835,  60,  100,      5.26,  'hispanicDayBox collectable'),
(836,  60,  20,       5.26,  'hispanicDayBox collectable'),
(837,  61,  40,       5.26,  'hispanicDayBox collectable'),
(838,  61,  100,      5.26,  'hispanicDayBox collectable'),
(839,  61,  20,       5.26,  'hispanicDayBox collectable'),
(840,  2,   100000,   0.06,  'hispanicDayBox collectable'),
(841,  1,   400,      5.26,  'candyBox collectable'),
(842,  1,   1000,     5.26,  'candyBox collectable'),
(843,  1,   2000,     5.26,  'candyBox collectable'),
(844,  2,   40,       5.26,  'candyBox collectable'),
(845,  2,   100,      5.26,  'candyBox collectable'),
(846,  2,   200,      5.26,  'candyBox collectable'),
(847,  3,   0.5,      5.26,  'candyBox collectable'),
(848,  3,   1,        5.26,  'candyBox collectable'),
(849,  3,   2,        5.26,  'candyBox collectable'),
(850,  8,   2,        5.26,  'candyBox collectable'),
(851,  59,  40,       5.26,  'candyBox collectable'),
(852,  59,  100,      5.26,  'candyBox collectable'),
(853,  59,  20,       5.26,  'candyBox collectable'),
(854,  60,  40,       5.26,  'candyBox collectable'),
(855,  60,  100,      5.26,  'candyBox collectable'),
(856,  60,  20,       5.26,  'candyBox collectable'),
(857,  61,  40,       5.26,  'candyBox collectable'),
(858,  61,  100,      5.26,  'candyBox collectable'),
(859,  61,  20,       5.26,  'candyBox collectable'),
(860,  2,   100000,   0.06,  'candyBox collectable'),
(861,  1,   400,      5.26,  'birthdayBox collectable'),
(862,  1,   1000,     5.26,  'birthdayBox collectable'),
(863,  1,   2000,     5.26,  'birthdayBox collectable'),
(864,  2,   40,       5.26,  'birthdayBox collectable'),
(865,  2,   100,      5.26,  'birthdayBox collectable'),
(866,  2,   200,      5.26,  'birthdayBox collectable'),
(867,  3,   0.5,      5.26,  'birthdayBox collectable'),
(868,  3,   1,        5.26,  'birthdayBox collectable'),
(869,  3,   2,        5.26,  'birthdayBox collectable'),
(870,  8,   2,        5.26,  'birthdayBox collectable'),
(871,  59,  40,       5.26,  'birthdayBox collectable'),
(872,  59,  100,      5.26,  'birthdayBox collectable'),
(873,  59,  20,       5.26,  'birthdayBox collectable'),
(874,  60,  40,       5.26,  'birthdayBox collectable'),
(875,  60,  100,      5.26,  'birthdayBox collectable'),
(876,  60,  20,       5.26,  'birthdayBox collectable'),
(877,  61,  40,       5.26,  'birthdayBox collectable'),
(878,  61,  100,      5.26,  'birthdayBox collectable'),
(879,  61,  20,       5.26,  'birthdayBox collectable'),
(880,  2,   100000,   0.06,  'birthdayBox collectable'),
(881,  1,   400,      5.26,  'treasureChest collectable'),
(882,  1,   1000,     5.26,  'treasureChest collectable'),
(883,  1,   2000,     5.26,  'treasureChest collectable'),
(884,  2,   40,       5.26,  'treasureChest collectable'),
(885,  2,   100,      5.26,  'treasureChest collectable'),
(886,  2,   200,      5.26,  'treasureChest collectable'),
(887,  3,   0.5,      5.26,  'treasureChest collectable'),
(888,  3,   1,        5.26,  'treasureChest collectable'),
(889,  3,   2,        5.26,  'treasureChest collectable'),
(890,  8,   2,        5.26,  'treasureChest collectable'),
(891,  59,  40,       5.26,  'treasureChest collectable'),
(892,  59,  100,      5.26,  'treasureChest collectable'),
(893,  59,  20,       5.26,  'treasureChest collectable'),
(894,  60,  40,       5.26,  'treasureChest collectable'),
(895,  60,  100,      5.26,  'treasureChest collectable'),
(896,  60,  20,       5.26,  'treasureChest collectable'),
(897,  61,  40,       5.26,  'treasureChest collectable'),
(898,  61,  100,      5.26,  'treasureChest collectable'),
(899,  61,  20,       5.26,  'treasureChest collectable'),
(900,  2,   100000,   0.06,  'treasureChest collectable'),
(901,  1,   400,      5.26,  'fathersDayBox collectable'),
(902,  1,   1000,     5.26,  'fathersDayBox collectable'),
(903,  1,   2000,     5.26,  'fathersDayBox collectable'),
(904,  2,   40,       5.26,  'fathersDayBox collectable'),
(905,  2,   100,      5.26,  'fathersDayBox collectable'),
(906,  2,   200,      5.26,  'fathersDayBox collectable'),
(907,  3,   0.5,      5.26,  'fathersDayBox collectable'),
(908,  3,   1,        5.26,  'fathersDayBox collectable'),
(909,  3,   2,        5.26,  'fathersDayBox collectable'),
(910,  8,   2,        5.26,  'fathersDayBox collectable'),
(911,  59,  40,       5.26,  'fathersDayBox collectable'),
(912,  59,  100,      5.26,  'fathersDayBox collectable'),
(913,  59,  20,       5.26,  'fathersDayBox collectable'),
(914,  60,  40,       5.26,  'fathersDayBox collectable'),
(915,  60,  100,      5.26,  'fathersDayBox collectable'),
(916,  60,  20,       5.26,  'fathersDayBox collectable'),
(917,  61,  40,       5.26,  'fathersDayBox collectable'),
(918,  61,  100,      5.26,  'fathersDayBox collectable'),
(919,  61,  20,       5.26,  'fathersDayBox collectable'),
(920,  2,   100000,   0.06,  'fathersDayBox collectable'),
(921,  1,   400,      5.26,  'summerEventBox collectable'),
(922,  1,   1000,     5.26,  'summerEventBox collectable'),
(923,  1,   2000,     5.26,  'summerEventBox collectable'),
(924,  2,   40,       5.26,  'summerEventBox collectable'),
(925,  2,   100,      5.26,  'summerEventBox collectable'),
(926,  2,   200,      5.26,  'summerEventBox collectable'),
(927,  3,   0.5,      5.26,  'summerEventBox collectable'),
(928,  3,   1,        5.26,  'summerEventBox collectable'),
(929,  3,   2,        5.26,  'summerEventBox collectable'),
(930,  8,   2,        5.26,  'summerEventBox collectable'),
(931,  59,  40,       5.26,  'summerEventBox collectable'),
(932,  59,  100,      5.26,  'summerEventBox collectable'),
(933,  59,  20,       5.26,  'summerEventBox collectable'),
(934,  60,  40,       5.26,  'summerEventBox collectable'),
(935,  60,  100,      5.26,  'summerEventBox collectable'),
(936,  60,  20,       5.26,  'summerEventBox collectable'),
(937,  61,  40,       5.26,  'summerEventBox collectable'),
(938,  61,  100,      5.26,  'summerEventBox collectable'),
(939,  61,  20,       5.26,  'summerEventBox collectable'),
(940,  2,   100000,   0.06,  'summerEventBox collectable'),
(941,  1,   400,      5.26,  'silverBootyBox collectable'),
(942,  1,   1000,     5.26,  'silverBootyBox collectable'),
(943,  1,   2000,     5.26,  'silverBootyBox collectable'),
(944,  2,   40,       5.26,  'silverBootyBox collectable'),
(945,  2,   100,      5.26,  'silverBootyBox collectable'),
(946,  2,   200,      5.26,  'silverBootyBox collectable'),
(947,  3,   0.5,      5.26,  'silverBootyBox collectable'),
(948,  3,   1,        5.26,  'silverBootyBox collectable'),
(949,  3,   2,        5.26,  'silverBootyBox collectable'),
(950,  8,   2,        5.26,  'silverBootyBox collectable'),
(951,  59,  40,       5.26,  'silverBootyBox collectable'),
(952,  59,  100,      5.26,  'silverBootyBox collectable'),
(953,  59,  20,       5.26,  'silverBootyBox collectable'),
(954,  60,  40,       5.26,  'silverBootyBox collectable'),
(955,  60,  100,      5.26,  'silverBootyBox collectable'),
(956,  60,  20,       5.26,  'silverBootyBox collectable'),
(957,  61,  40,       5.26,  'silverBootyBox collectable'),
(958,  61,  100,      5.26,  'silverBootyBox collectable'),
(959,  61,  20,       5.26,  'silverBootyBox collectable'),
(960,  2,   100000,   0.06,  'silverBootyBox collectable'),
(961,  1,   400,      5.26,  'britishBox collectable'),
(962,  1,   1000,     5.26,  'britishBox collectable'),
(963,  1,   2000,     5.26,  'britishBox collectable'),
(964,  2,   40,       5.26,  'britishBox collectable'),
(965,  2,   100,      5.26,  'britishBox collectable'),
(966,  2,   200,      5.26,  'britishBox collectable'),
(967,  3,   0.5,      5.26,  'britishBox collectable'),
(968,  3,   1,        5.26,  'britishBox collectable'),
(969,  3,   2,        5.26,  'britishBox collectable'),
(970,  8,   2,        5.26,  'britishBox collectable'),
(971,  59,  40,       5.26,  'britishBox collectable'),
(972,  59,  100,      5.26,  'britishBox collectable'),
(973,  59,  20,       5.26,  'britishBox collectable'),
(974,  60,  40,       5.26,  'britishBox collectable'),
(975,  60,  100,      5.26,  'britishBox collectable'),
(976,  60,  20,       5.26,  'britishBox collectable'),
(977,  61,  40,       5.26,  'britishBox collectable'),
(978,  61,  100,      5.26,  'britishBox collectable'),
(979,  61,  20,       5.26,  'britishBox collectable'),
(980,  2,   100000,   0.06,  'britishBox collectable'),
(981,  1,   400,      5.26,  'football_box collectable'),
(982,  1,   1000,     5.26,  'football_box collectable'),
(983,  1,   2000,     5.26,  'football_box collectable'),
(984,  2,   40,       5.26,  'football_box collectable'),
(985,  2,   100,      5.26,  'football_box collectable'),
(986,  2,   200,      5.26,  'football_box collectable'),
(987,  3,   0.5,      5.26,  'football_box collectable'),
(988,  3,   1,        5.26,  'football_box collectable'),
(989,  3,   2,        5.26,  'football_box collectable'),
(990,  8,   2,        5.26,  'football_box collectable'),
(991,  59,  40,       5.26,  'football_box collectable'),
(992,  59,  100,      5.26,  'football_box collectable'),
(993,  59,  20,       5.26,  'football_box collectable'),
(994,  60,  40,       5.26,  'football_box collectable'),
(995,  60,  100,      5.26,  'football_box collectable'),
(996,  60,  20,       5.26,  'football_box collectable'),
(997,  61,  40,       5.26,  'football_box collectable'),
(998,  61,  100,      5.26,  'football_box collectable'),
(999,  61,  20,       5.26,  'football_box collectable'),
(1000, 2,   100000,   0.06,  'football_box collectable'),
(1001, 1,   400,      5.26,  'demanerTransporterBootyBox collectable'),
(1002, 1,   1000,     5.26,  'demanerTransporterBootyBox collectable'),
(1003, 1,   2000,     5.26,  'demanerTransporterBootyBox collectable'),
(1004, 2,   40,       5.26,  'demanerTransporterBootyBox collectable'),
(1005, 2,   100,      5.26,  'demanerTransporterBootyBox collectable'),
(1006, 2,   200,      5.26,  'demanerTransporterBootyBox collectable'),
(1007, 3,   0.5,      5.26,  'demanerTransporterBootyBox collectable'),
(1008, 3,   1,        5.26,  'demanerTransporterBootyBox collectable'),
(1009, 3,   2,        5.26,  'demanerTransporterBootyBox collectable'),
(1010, 8,   2,        5.26,  'demanerTransporterBootyBox collectable'),
(1011, 59,  40,       5.26,  'demanerTransporterBootyBox collectable'),
(1012, 59,  100,      5.26,  'demanerTransporterBootyBox collectable'),
(1013, 59,  20,       5.26,  'demanerTransporterBootyBox collectable'),
(1014, 60,  40,       5.26,  'demanerTransporterBootyBox collectable'),
(1015, 60,  100,      5.26,  'demanerTransporterBootyBox collectable'),
(1016, 60,  20,       5.26,  'demanerTransporterBootyBox collectable'),
(1017, 61,  40,       5.26,  'demanerTransporterBootyBox collectable'),
(1018, 61,  100,      5.26,  'demanerTransporterBootyBox collectable'),
(1019, 61,  20,       5.26,  'demanerTransporterBootyBox collectable'),
(1020, 2,   100000,   0.06,  'demanerTransporterBootyBox collectable'),
(1021, 1,   400,      5.26,  'icyBox collectable'),
(1022, 1,   1000,     5.26,  'icyBox collectable'),
(1023, 1,   2000,     5.26,  'icyBox collectable'),
(1024, 2,   40,       5.26,  'icyBox collectable'),
(1025, 2,   100,      5.26,  'icyBox collectable'),
(1026, 2,   200,      5.26,  'icyBox collectable'),
(1027, 3,   0.5,      5.26,  'icyBox collectable'),
(1028, 3,   1,        5.26,  'icyBox collectable'),
(1029, 3,   2,        5.26,  'icyBox collectable'),
(1030, 8,   2,        5.26,  'icyBox collectable'),
(1031, 59,  40,       5.26,  'icyBox collectable'),
(1032, 59,  100,      5.26,  'icyBox collectable'),
(1033, 59,  20,       5.26,  'icyBox collectable'),
(1034, 60,  40,       5.26,  'icyBox collectable'),
(1035, 60,  100,      5.26,  'icyBox collectable'),
(1036, 60,  20,       5.26,  'icyBox collectable'),
(1037, 61,  40,       5.26,  'icyBox collectable'),
(1038, 61,  100,      5.26,  'icyBox collectable'),
(1039, 61,  20,       5.26,  'icyBox collectable'),
(1040, 2,   100000,   0.06,  'icyBox collectable'),
(1041, 236, 1,        100,   'oreRed collectable'),
(1042, 237, 1,        100,   'oreBlue collectable'),
(1043, 238, 1,        100,   'oreYellow collectable'),
(1044, 244, 1,        100,   'ore_palladium collectable'),
(1045, 2,   20000,    100,   'galaxygate 1#'),
(1046, 4,   4000000,  100,   'galaxygate 1#'),
(1047, 5,   100000,   100,   'galaxygate 1#'),
(1048, 7,   2,        100,   'galaxygate 1#'),
(1049, 64,  20000,    100,   'galaxygate 1#'),
(1050, 229, 2,        100,   'galaxygate 1#'),
(1051, 2,   40000,    100,   'galaxygate 2#'),
(1052, 4,   8000000,  100,   'galaxygate 2#'),
(1053, 5,   200000,   100,   'galaxygate 2#'),
(1054, 7,   4,        100,   'galaxygate 2#'),
(1055, 64,  40000,    100,   'galaxygate 2#'),
(1056, 229, 4,        100,   'galaxygate 2#'),
(1057, 2,   60000,    100,   'galaxygate 3#'),
(1058, 4,   12000000, 100,   'galaxygate 3#'),
(1059, 5,   300000,   100,   'galaxygate 3#'),
(1060, 7,   6,        100,   'galaxygate 3#'),
(1061, 64,  60000,    100,   'galaxygate 3#'),
(1062, 229, 10,       100,   'galaxygate 3#'),
(1063, 2,   45000,    100,   'galaxygate 4#'),
(1064, 4,   9000000,  100,   'galaxygate 4#'),
(1065, 5,   225000,   100,   'galaxygate 4#'),
(1066, 7,   5,        100,   'galaxygate 4#'),
(1067, 64,  45000,    100,   'galaxygate 4#'),
(1068, 229, 8,        100,   'galaxygate 4#'),
(1069, 2,   25000,    100,   'galaxygate 5#'),
(1070, 4,   5000000,  100,   'galaxygate 5#'),
(1071, 5,   150000,   100,   'galaxygate 5#'),
(1072, 64,  20000,    100,   'galaxygate 5#'),
(1073, 229, 10,       100,   'galaxygate 5#'),
(1074, 230, 5,        100,   'galaxygate 5#'),
(1075, 124, 1,        33.33, 'galaxygate 5#'),
(1076, 2,   35000,    100,   'galaxygate 6#'),
(1077, 4,   6000000,  100,   'galaxygate 6#'),
(1078, 5,   200000,   100,   'galaxygate 6#'),
(1079, 64,  25000,    100,   'galaxygate 6#'),
(1080, 229, 25,       100,   'galaxygate 6#'),
(1081, 230, 50,       100,   'galaxygate 6#'),
(1082, 197, 1,        33.33, 'galaxygate 6#'),
(1083, 2,   15000,    100,   'galaxygate 7#'),
(1084, 4,   9000000,  100,   'galaxygate 7#'),
(1085, 5,   150000,   100,   'galaxygate 7#'),
(1086, 64,  30000,    100,   'galaxygate 7#'),
(1087, 229, 10,       100,   'galaxygate 7#'),
(1088, 230, 5,        100,   'galaxygate 7#'),
(1089, 198, 1,        33.33, 'galaxygate 7#'),
(1090, 2,   15000,    100,   'galaxygate 8#'),
(1091, 4,   2750000,  100,   'galaxygate 8#'),
(1092, 5,   100000,   100,   'galaxygate 8#'),
(1093, 64,  10000,    100,   'galaxygate 8#'),
(1094, 229, 3,        100,   'galaxygate 8#'),
(1095, 230, 5,        100,   'galaxygate 8#'),
(1096, 2,   20000,    100,   'galaxygate 13#'),
(1097, 4,   4000000,  100,   'galaxygate 13#'),
(1098, 5,   200000,   100,   'galaxygate 13#'),
(1099, 64,  15000,    100,   'galaxygate 13#'),
(1100, 229, 8,        100,   'galaxygate 13#'),
(1101, 230, 4,        100,   'galaxygate 13#'),
(1102, 124, 1,        33.33, 'galaxygate 13#'),
(1103, 2,   15000,    100,   'galaxygate 19#'),
(1104, 4,   2000000,  100,   'galaxygate 19#'),
(1105, 5,   150000,   100,   'galaxygate 19#'),
(1106, 230, 5,        100,   'galaxygate 19#'),
(1107, 22,  1,        6.66,  'galaxygate 19#'),
(1108, 24,  1,        6.66,  'galaxygate 19#'),
(1109, 26,  1,        6.66,  'galaxygate 19#'),
(1110, 35,  1,        6.66,  'galaxygate 19#'),
(1111, 50,  1,        6.66,  'galaxygate 19#'),
(1112, 4,   100,      100,   'ship 1#'),
(1113, 5,   1,        100,   'ship 1#'),
(1114, 4,   200,      100,   'ship 2#'),
(1115, 5,   2,        100,   'ship 2#'),
(1116, 4,   400,      100,   'ship 3#'),
(1117, 5,   4,        100,   'ship 3#'),
(1118, 4,   1600,     100,   'ship 4#'),
(1119, 5,   16,       100,   'ship 4#'),
(1120, 4,   400,      100,   'ship 5#'),
(1121, 5,   4,        100,   'ship 5#'),
(1122, 4,   6400,     100,   'ship 6#'),
(1123, 5,   64,       100,   'ship 6#'),
(1124, 4,   6400,     100,   'ship 7#'),
(1125, 5,   64,       100,   'ship 7#'),
(1126, 4,   12800,    100,   'ship 8#'),
(1127, 5,   128,      100,   'ship 8#'),
(1128, 4,   25600,    100,   'ship 9#'),
(1129, 5,   256,      100,   'ship 9#'),
(1130, 4,   51200,    100,   'ship 10#'),
(1131, 5,   512,      100,   'ship 10#'),
(1132, 4,   100,      100,   'ship 11#'),
(1133, 5,   1,        100,   'ship 11#'),
(1134, 4,   100,      100,   'ship 12#'),
(1135, 5,   1,        100,   'ship 12#'),
(1136, 4,   100,      100,   'ship 13#'),
(1137, 5,   1,        100,   'ship 13#');

-- Collectable rewards table.
--
-- Many to many relations table.
--
CREATE TABLE `rewards_collectables` (
    `id`              smallint NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `collectables_id` tinyint  NOT NULL                COMMENT 'Collectable ID.',
    `rewards_id`      smallint NOT NULL                COMMENT 'Reward to award.',

    CONSTRAINT `rewards_collectables_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Many to many relations.';

CREATE INDEX `rewards_collectables_npcs_id_idx` ON `rewards_collectables` (`collectables_id`);
CREATE INDEX `rewards_collectables_rewards_id_idx` ON `rewards_collectables` (`rewards_id`);

-- Initial dump for the `rewards_collectables` table.

INSERT INTO `rewards_collectables`(`id`, `collectables_id`, `rewards_id`) VALUES
(1,   1,  201),
(2,   1,  202),
(3,   1,  203),
(4,   1,  204),
(5,   1,  205),
(6,   1,  206),
(7,   1,  207),
(8,   1,  208),
(9,   1,  209),
(10,  1,  210),
(11,  1,  211),
(12,  1,  212),
(13,  1,  213),
(14,  1,  214),
(15,  1,  215),
(16,  1,  216),
(17,  1,  217),
(18,  1,  218),
(19,  1,  219),
(20,  1,  220),
(21,  4,  221),
(22,  4,  222),
(23,  4,  223),
(24,  4,  224),
(25,  4,  225),
(26,  4,  226),
(27,  4,  227),
(28,  4,  228),
(29,  4,  229),
(30,  4,  230),
(31,  4,  231),
(32,  4,  232),
(33,  4,  233),
(34,  4,  234),
(35,  4,  235),
(36,  4,  236),
(37,  4,  237),
(38,  4,  238),
(39,  4,  239),
(40,  4,  240),
(41,  5,  241),
(42,  5,  242),
(43,  5,  243),
(44,  5,  244),
(45,  5,  245),
(46,  5,  246),
(47,  5,  247),
(48,  5,  248),
(49,  5,  249),
(50,  5,  250),
(51,  5,  251),
(52,  5,  252),
(53,  5,  253),
(54,  5,  254),
(55,  5,  255),
(56,  5,  256),
(57,  5,  257),
(58,  5,  258),
(59,  5,  259),
(60,  5,  260),
(61,  6,  261),
(62,  6,  262),
(63,  6,  263),
(64,  6,  264),
(65,  6,  265),
(66,  6,  266),
(67,  6,  267),
(68,  6,  268),
(69,  6,  269),
(70,  6,  270),
(71,  6,  271),
(72,  6,  272),
(73,  6,  273),
(74,  6,  274),
(75,  6,  275),
(76,  6,  276),
(77,  6,  277),
(78,  6,  278),
(79,  6,  279),
(80,  6,  280),
(81,  7,  281),
(82,  7,  282),
(83,  7,  283),
(84,  7,  284),
(85,  7,  285),
(86,  7,  286),
(87,  7,  287),
(88,  7,  288),
(89,  7,  289),
(90,  7,  290),
(91,  7,  291),
(92,  7,  292),
(93,  7,  293),
(94,  7,  294),
(95,  7,  295),
(96,  7,  296),
(97,  7,  297),
(98,  7,  298),
(99,  7,  299),
(100, 7,  300),
(101, 8,  301),
(102, 8,  302),
(103, 8,  303),
(104, 8,  304),
(105, 8,  305),
(106, 8,  306),
(107, 8,  307),
(108, 8,  308),
(109, 8,  309),
(110, 8,  310),
(111, 8,  311),
(112, 8,  312),
(113, 8,  313),
(114, 8,  314),
(115, 8,  315),
(116, 8,  316),
(117, 8,  317),
(118, 8,  318),
(119, 8,  319),
(120, 8,  320),
(121, 9,  321),
(122, 9,  322),
(123, 9,  323),
(124, 9,  324),
(125, 9,  325),
(126, 9,  326),
(127, 9,  327),
(128, 9,  328),
(129, 9,  329),
(130, 9,  330),
(131, 9,  331),
(132, 9,  332),
(133, 9,  333),
(134, 9,  334),
(135, 9,  335),
(136, 9,  336),
(137, 9,  337),
(138, 9,  338),
(139, 9,  339),
(140, 9,  340),
(141, 10, 341),
(142, 10, 342),
(143, 10, 343),
(144, 10, 344),
(145, 10, 345),
(146, 10, 346),
(147, 10, 347),
(148, 10, 348),
(149, 10, 349),
(150, 10, 350),
(151, 10, 351),
(152, 10, 352),
(153, 10, 353),
(154, 10, 354),
(155, 10, 355),
(156, 10, 356),
(157, 10, 357),
(158, 10, 358),
(159, 10, 359),
(160, 10, 360),
(161, 11, 361),
(162, 11, 362),
(163, 11, 363),
(164, 11, 364),
(165, 11, 365),
(166, 11, 366),
(167, 11, 367),
(168, 11, 368),
(169, 11, 369),
(170, 11, 370),
(171, 11, 371),
(172, 11, 372),
(173, 11, 373),
(174, 11, 374),
(175, 11, 375),
(176, 11, 376),
(177, 11, 377),
(178, 11, 378),
(179, 11, 379),
(180, 11, 380),
(181, 12, 381),
(182, 12, 382),
(183, 12, 383),
(184, 12, 384),
(185, 12, 385),
(186, 12, 386),
(187, 12, 387),
(188, 12, 388),
(189, 12, 389),
(190, 12, 390),
(191, 12, 391),
(192, 12, 392),
(193, 12, 393),
(194, 12, 394),
(195, 12, 395),
(196, 12, 396),
(197, 12, 397),
(198, 12, 398),
(199, 12, 399),
(200, 12, 400),
(201, 13, 401),
(202, 13, 402),
(203, 13, 403),
(204, 13, 404),
(205, 13, 405),
(206, 13, 406),
(207, 13, 407),
(208, 13, 408),
(209, 13, 409),
(210, 13, 410),
(211, 13, 411),
(212, 13, 412),
(213, 13, 413),
(214, 13, 414),
(215, 13, 415),
(216, 13, 416),
(217, 13, 417),
(218, 13, 418),
(219, 13, 419),
(220, 13, 420),
(221, 14, 421),
(222, 14, 422),
(223, 14, 423),
(224, 14, 424),
(225, 14, 425),
(226, 14, 426),
(227, 14, 427),
(228, 14, 428),
(229, 14, 429),
(230, 14, 430),
(231, 14, 431),
(232, 14, 432),
(233, 14, 433),
(234, 14, 434),
(235, 14, 435),
(236, 14, 436),
(237, 14, 437),
(238, 14, 438),
(239, 14, 439),
(240, 14, 440),
(241, 15, 441),
(242, 15, 442),
(243, 15, 443),
(244, 15, 444),
(245, 15, 445),
(246, 15, 446),
(247, 15, 447),
(248, 15, 448),
(249, 15, 449),
(250, 15, 450),
(251, 15, 451),
(252, 15, 452),
(253, 15, 453),
(254, 15, 454),
(255, 15, 455),
(256, 15, 456),
(257, 15, 457),
(258, 15, 458),
(259, 15, 459),
(260, 15, 460),
(261, 16, 461),
(262, 16, 462),
(263, 16, 463),
(264, 16, 464),
(265, 16, 465),
(266, 16, 466),
(267, 16, 467),
(268, 16, 468),
(269, 16, 469),
(270, 16, 470),
(271, 16, 471),
(272, 16, 472),
(273, 16, 473),
(274, 16, 474),
(275, 16, 475),
(276, 16, 476),
(277, 16, 477),
(278, 16, 478),
(279, 16, 479),
(280, 16, 480),
(281, 17, 481),
(282, 17, 482),
(283, 17, 483),
(284, 17, 484),
(285, 17, 485),
(286, 17, 486),
(287, 17, 487),
(288, 17, 488),
(289, 17, 489),
(290, 17, 490),
(291, 17, 491),
(292, 17, 492),
(293, 17, 493),
(294, 17, 494),
(295, 17, 495),
(296, 17, 496),
(297, 17, 497),
(298, 17, 498),
(299, 17, 499),
(300, 17, 500),
(301, 18, 501),
(302, 18, 502),
(303, 18, 503),
(304, 18, 504),
(305, 18, 505),
(306, 18, 506),
(307, 18, 507),
(308, 18, 508),
(309, 18, 509),
(310, 18, 510),
(311, 18, 511),
(312, 18, 512),
(313, 18, 513),
(314, 18, 514),
(315, 18, 515),
(316, 18, 516),
(317, 18, 517),
(318, 18, 518),
(319, 18, 519),
(320, 18, 520),
(321, 19, 521),
(322, 19, 522),
(323, 19, 523),
(324, 19, 524),
(325, 19, 525),
(326, 19, 526),
(327, 19, 527),
(328, 19, 528),
(329, 19, 529),
(330, 19, 530),
(331, 19, 531),
(332, 19, 532),
(333, 19, 533),
(334, 19, 534),
(335, 19, 535),
(336, 19, 536),
(337, 19, 537),
(338, 19, 538),
(339, 19, 539),
(340, 19, 540),
(341, 20, 541),
(342, 20, 542),
(343, 20, 543),
(344, 20, 544),
(345, 20, 545),
(346, 20, 546),
(347, 20, 547),
(348, 20, 548),
(349, 20, 549),
(350, 20, 550),
(351, 20, 551),
(352, 20, 552),
(353, 20, 553),
(354, 20, 554),
(355, 20, 555),
(356, 20, 556),
(357, 20, 557),
(358, 20, 558),
(359, 20, 559),
(360, 20, 560),
(361, 21, 561),
(362, 21, 562),
(363, 21, 563),
(364, 21, 564),
(365, 21, 565),
(366, 21, 566),
(367, 21, 567),
(368, 21, 568),
(369, 21, 569),
(370, 21, 570),
(371, 21, 571),
(372, 21, 572),
(373, 21, 573),
(374, 21, 574),
(375, 21, 575),
(376, 21, 576),
(377, 21, 577),
(378, 21, 578),
(379, 21, 579),
(380, 21, 580),
(381, 22, 581),
(382, 22, 582),
(383, 22, 583),
(384, 22, 584),
(385, 22, 585),
(386, 22, 586),
(387, 22, 587),
(388, 22, 588),
(389, 22, 589),
(390, 22, 590),
(391, 22, 591),
(392, 22, 592),
(393, 22, 593),
(394, 22, 594),
(395, 22, 595),
(396, 22, 596),
(397, 22, 597),
(398, 22, 598),
(399, 22, 599),
(400, 22, 600),
(401, 23, 601),
(402, 23, 602),
(403, 23, 603),
(404, 23, 604),
(405, 23, 605),
(406, 23, 606),
(407, 23, 607),
(408, 23, 608),
(409, 23, 609),
(410, 23, 610),
(411, 23, 611),
(412, 23, 612),
(413, 23, 613),
(414, 23, 614),
(415, 23, 615),
(416, 23, 616),
(417, 23, 617),
(418, 23, 618),
(419, 23, 619),
(420, 23, 620),
(421, 24, 621),
(422, 24, 622),
(423, 24, 623),
(424, 24, 624),
(425, 24, 625),
(426, 24, 626),
(427, 24, 627),
(428, 24, 628),
(429, 24, 629),
(430, 24, 630),
(431, 24, 631),
(432, 24, 632),
(433, 24, 633),
(434, 24, 634),
(435, 24, 635),
(436, 24, 636),
(437, 24, 637),
(438, 24, 638),
(439, 24, 639),
(440, 24, 640),
(441, 25, 641),
(442, 25, 642),
(443, 25, 643),
(444, 25, 644),
(445, 25, 645),
(446, 25, 646),
(447, 25, 647),
(448, 25, 648),
(449, 25, 649),
(450, 25, 650),
(451, 25, 651),
(452, 25, 652),
(453, 25, 653),
(454, 25, 654),
(455, 25, 655),
(456, 25, 656),
(457, 25, 657),
(458, 25, 658),
(459, 25, 659),
(460, 25, 660),
(461, 26, 661),
(462, 26, 662),
(463, 26, 663),
(464, 26, 664),
(465, 26, 665),
(466, 26, 666),
(467, 26, 667),
(468, 26, 668),
(469, 26, 669),
(470, 26, 670),
(471, 26, 671),
(472, 26, 672),
(473, 26, 673),
(474, 26, 674),
(475, 26, 675),
(476, 26, 676),
(477, 26, 677),
(478, 26, 678),
(479, 26, 679),
(480, 26, 680),
(481, 27, 681),
(482, 27, 682),
(483, 27, 683),
(484, 27, 684),
(485, 27, 685),
(486, 27, 686),
(487, 27, 687),
(488, 27, 688),
(489, 27, 689),
(490, 27, 690),
(491, 27, 691),
(492, 27, 692),
(493, 27, 693),
(494, 27, 694),
(495, 27, 695),
(496, 27, 696),
(497, 27, 697),
(498, 27, 698),
(499, 27, 699),
(500, 27, 700),
(501, 28, 701),
(502, 28, 702),
(503, 28, 703),
(504, 28, 704),
(505, 28, 705),
(506, 28, 706),
(507, 28, 707),
(508, 28, 708),
(509, 28, 709),
(510, 28, 710),
(511, 28, 711),
(512, 28, 712),
(513, 28, 713),
(514, 28, 714),
(515, 28, 715),
(516, 28, 716),
(517, 28, 717),
(518, 28, 718),
(519, 28, 719),
(520, 28, 720),
(521, 29, 721),
(522, 29, 722),
(523, 29, 723),
(524, 29, 724),
(525, 29, 725),
(526, 29, 726),
(527, 29, 727),
(528, 29, 728),
(529, 29, 729),
(530, 29, 730),
(531, 29, 731),
(532, 29, 732),
(533, 29, 733),
(534, 29, 734),
(535, 29, 735),
(536, 29, 736),
(537, 29, 737),
(538, 29, 738),
(539, 29, 739),
(540, 29, 740),
(541, 30, 741),
(542, 30, 742),
(543, 30, 743),
(544, 30, 744),
(545, 30, 745),
(546, 30, 746),
(547, 30, 747),
(548, 30, 748),
(549, 30, 749),
(550, 30, 750),
(551, 30, 751),
(552, 30, 752),
(553, 30, 753),
(554, 30, 754),
(555, 30, 755),
(556, 30, 756),
(557, 30, 757),
(558, 30, 758),
(559, 30, 759),
(560, 30, 760),
(561, 31, 761),
(562, 31, 762),
(563, 31, 763),
(564, 31, 764),
(565, 31, 765),
(566, 31, 766),
(567, 31, 767),
(568, 31, 768),
(569, 31, 769),
(570, 31, 770),
(571, 31, 771),
(572, 31, 772),
(573, 31, 773),
(574, 31, 774),
(575, 31, 775),
(576, 31, 776),
(577, 31, 777),
(578, 31, 778),
(579, 31, 779),
(580, 31, 780),
(581, 32, 781),
(582, 32, 782),
(583, 32, 783),
(584, 32, 784),
(585, 32, 785),
(586, 32, 786),
(587, 32, 787),
(588, 32, 788),
(589, 32, 789),
(590, 32, 790),
(591, 32, 791),
(592, 32, 792),
(593, 32, 793),
(594, 32, 794),
(595, 32, 795),
(596, 32, 796),
(597, 32, 797),
(598, 32, 798),
(599, 32, 799),
(600, 32, 800),
(601, 33, 801),
(602, 33, 802),
(603, 33, 803),
(604, 33, 804),
(605, 33, 805),
(606, 33, 806),
(607, 33, 807),
(608, 33, 808),
(609, 33, 809),
(610, 33, 810),
(611, 33, 811),
(612, 33, 812),
(613, 33, 813),
(614, 33, 814),
(615, 33, 815),
(616, 33, 816),
(617, 33, 817),
(618, 33, 818),
(619, 33, 819),
(620, 33, 820),
(621, 34, 821),
(622, 34, 822),
(623, 34, 823),
(624, 34, 824),
(625, 34, 825),
(626, 34, 826),
(627, 34, 827),
(628, 34, 828),
(629, 34, 829),
(630, 34, 830),
(631, 34, 831),
(632, 34, 832),
(633, 34, 833),
(634, 34, 834),
(635, 34, 835),
(636, 34, 836),
(637, 34, 837),
(638, 34, 838),
(639, 34, 839),
(640, 34, 840),
(641, 35, 841),
(642, 35, 842),
(643, 35, 843),
(644, 35, 844),
(645, 35, 845),
(646, 35, 846),
(647, 35, 847),
(648, 35, 848),
(649, 35, 849),
(650, 35, 850),
(651, 35, 851),
(652, 35, 852),
(653, 35, 853),
(654, 35, 854),
(655, 35, 855),
(656, 35, 856),
(657, 35, 857),
(658, 35, 858),
(659, 35, 859),
(660, 35, 860),
(661, 36, 861),
(662, 36, 862),
(663, 36, 863),
(664, 36, 864),
(665, 36, 865),
(666, 36, 866),
(667, 36, 867),
(668, 36, 868),
(669, 36, 869),
(670, 36, 870),
(671, 36, 871),
(672, 36, 872),
(673, 36, 873),
(674, 36, 874),
(675, 36, 875),
(676, 36, 876),
(677, 36, 877),
(678, 36, 878),
(679, 36, 879),
(680, 36, 880),
(681, 37, 881),
(682, 37, 882),
(683, 37, 883),
(684, 37, 884),
(685, 37, 885),
(686, 37, 886),
(687, 37, 887),
(688, 37, 888),
(689, 37, 889),
(690, 37, 890),
(691, 37, 891),
(692, 37, 892),
(693, 37, 893),
(694, 37, 894),
(695, 37, 895),
(696, 37, 896),
(697, 37, 897),
(698, 37, 898),
(699, 37, 899),
(700, 37, 900),
(701, 38, 901),
(702, 38, 902),
(703, 38, 903),
(704, 38, 904),
(705, 38, 905),
(706, 38, 906),
(707, 38, 907),
(708, 38, 908),
(709, 38, 909),
(710, 38, 910),
(711, 38, 911),
(712, 38, 912),
(713, 38, 913),
(714, 38, 914),
(715, 38, 915),
(716, 38, 916),
(717, 38, 917),
(718, 38, 918),
(719, 38, 919),
(720, 38, 920),
(721, 39, 921),
(722, 39, 922),
(723, 39, 923),
(724, 39, 924),
(725, 39, 925),
(726, 39, 926),
(727, 39, 927),
(728, 39, 928),
(729, 39, 929),
(730, 39, 930),
(731, 39, 931),
(732, 39, 932),
(733, 39, 933),
(734, 39, 934),
(735, 39, 935),
(736, 39, 936),
(737, 39, 937),
(738, 39, 938),
(739, 39, 939),
(740, 39, 940),
(741, 40, 941),
(742, 40, 942),
(743, 40, 943),
(744, 40, 944),
(745, 40, 945),
(746, 40, 946),
(747, 40, 947),
(748, 40, 948),
(749, 40, 949),
(750, 40, 950),
(751, 40, 951),
(752, 40, 952),
(753, 40, 953),
(754, 40, 954),
(755, 40, 955),
(756, 40, 956),
(757, 40, 957),
(758, 40, 958),
(759, 40, 959),
(760, 40, 960),
(761, 41, 961),
(762, 41, 962),
(763, 41, 963),
(764, 41, 964),
(765, 41, 965),
(766, 41, 966),
(767, 41, 967),
(768, 41, 968),
(769, 41, 969),
(770, 41, 970),
(771, 41, 971),
(772, 41, 972),
(773, 41, 973),
(774, 41, 974),
(775, 41, 975),
(776, 41, 976),
(777, 41, 977),
(778, 41, 978),
(779, 41, 979),
(780, 41, 980),
(781, 42, 981),
(782, 42, 982),
(783, 42, 983),
(784, 42, 984),
(785, 42, 985),
(786, 42, 986),
(787, 42, 987),
(788, 42, 988),
(789, 42, 989),
(790, 42, 990),
(791, 42, 991),
(792, 42, 992),
(793, 42, 993),
(794, 42, 994),
(795, 42, 995),
(796, 42, 996),
(797, 42, 997),
(798, 42, 998),
(799, 42, 999),
(800, 42, 1000),
(801, 43, 1001),
(802, 43, 1002),
(803, 43, 1003),
(804, 43, 1004),
(805, 43, 1005),
(806, 43, 1006),
(807, 43, 1007),
(808, 43, 1008),
(809, 43, 1009),
(810, 43, 1010),
(811, 43, 1011),
(812, 43, 1012),
(813, 43, 1013),
(814, 43, 1014),
(815, 43, 1015),
(816, 43, 1016),
(817, 43, 1017),
(818, 43, 1018),
(819, 43, 1019),
(820, 43, 1020),
(821, 44, 1021),
(822, 44, 1022),
(823, 44, 1023),
(824, 44, 1024),
(825, 44, 1025),
(826, 44, 1026),
(827, 44, 1027),
(828, 44, 1028),
(829, 44, 1029),
(830, 44, 1030),
(831, 44, 1031),
(832, 44, 1032),
(833, 44, 1033),
(834, 44, 1034),
(835, 44, 1035),
(836, 44, 1036),
(837, 44, 1037),
(838, 44, 1038),
(839, 44, 1039),
(840, 44, 1040),
(841, 45, 1041),
(842, 46, 1042),
(843, 47, 1043),
(844, 48, 1044);

-- GalaxyGate rewards table.
--
-- Many to many relations table.
--
CREATE TABLE `rewards_galaxygates` (
    `id`             tinyint  NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `galaxygates_id` tinyint  NOT NULL                COMMENT 'GalaxyGate ID.',
    `rewards_id`     smallint NOT NULL                COMMENT 'Reward to award.',

    CONSTRAINT `rewards_galaxygates_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Many to many relations.';

CREATE INDEX `rewards_galaxygates_galaxygates_id_idx` ON `rewards_galaxygates` (`galaxygates_id`);
CREATE INDEX `rewards_galaxygates_rewards_id_idx` ON `rewards_galaxygates` (`rewards_id`);

-- Initial dump for the `rewards_galaxygates` table.

INSERT INTO `rewards_galaxygates`(`id`, `galaxygates_id`, `rewards_id`) VALUES
(1,  1,  1045),
(2,  1,  1046),
(3,  1,  1047),
(4,  1,  1048),
(5,  1,  1049),
(6,  1,  1050),
(7,  2,  1051),
(8,  2,  1052),
(9,  2,  1053),
(10, 2,  1054),
(11, 2,  1055),
(12, 2,  1056),
(13, 3,  1057),
(14, 3,  1058),
(15, 3,  1059),
(16, 3,  1060),
(17, 3,  1061),
(18, 3,  1062),
(19, 4,  1063),
(20, 4,  1064),
(21, 4,  1065),
(22, 4,  1066),
(23, 4,  1067),
(24, 4,  1068),
(25, 5,  1069),
(26, 5,  1070),
(27, 5,  1071),
(28, 5,  1072),
(29, 5,  1073),
(30, 5,  1074),
(31, 5,  1075),
(32, 6,  1076),
(33, 6,  1077),
(34, 6,  1078),
(35, 6,  1079),
(36, 6,  1080),
(37, 6,  1081),
(38, 6,  1082),
(39, 7,  1083),
(40, 7,  1084),
(41, 7,  1085),
(42, 7,  1086),
(43, 7,  1087),
(44, 7,  1088),
(45, 7,  1089),
(46, 8,  1090),
(47, 8,  1091),
(48, 8,  1092),
(49, 8,  1093),
(50, 8,  1094),
(51, 8,  1095),
(52, 13, 1096),
(53, 13, 1097),
(54, 13, 1098),
(55, 13, 1099),
(56, 13, 1100),
(57, 13, 1101),
(58, 13, 1102),
(59, 19, 1103),
(60, 19, 1104),
(61, 19, 1105),
(62, 19, 1106),
(63, 19, 1107),
(64, 19, 1108),
(65, 19, 1109),
(66, 19, 1110),
(67, 19, 1111);

-- NPC rewards table.
--
-- Many to many relations table.
--
CREATE TABLE `rewards_npcs` (
    `id`         smallint NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `npcs_id`    tinyint  NOT NULL                COMMENT 'NPC ID.',
    `rewards_id` smallint NOT NULL                COMMENT 'Reward to award.',

    CONSTRAINT `rewards_npcs_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Many to many relations.';

CREATE INDEX `rewards_npcs_npcs_id_idx` ON `rewards_npcs` (`npcs_id`);
CREATE INDEX `rewards_npcs_rewards_id_idx` ON `rewards_npcs` (`rewards_id`);

INSERT INTO `rewards_npcs`(`id`, `npcs_id`, `rewards_id`) VALUES
(1,   1,  1),
(2,   1,  2),
(3,   1,  3),
(4,   1,  4),
(5,   2,  5),
(6,   2,  6),
(7,   2,  7),
(8,   2,  8),
(9,   3,  9),
(10,  3,  10),
(11,  3,  11),
(12,  3,  12),
(13,  4,  13),
(14,  4,  14),
(15,  4,  15),
(16,  4,  16),
(17,  5,  17),
(18,  5,  18),
(19,  5,  19),
(20,  5,  20),
(21,  6,  21),
(22,  6,  22),
(23,  6,  23),
(24,  6,  24),
(25,  7,  25),
(26,  7,  26),
(27,  7,  27),
(28,  7,  28),
(29,  8,  29),
(30,  8,  30),
(31,  8,  31),
(32,  8,  32),
(33,  9,  33),
(34,  9,  34),
(35,  9,  35),
(36,  9,  36),
(37,  10, 37),
(38,  10, 38),
(39,  10, 39),
(40,  10, 40),
(41,  11, 41),
(42,  11, 42),
(43,  11, 43),
(44,  11, 44),
(45,  12, 45),
(46,  12, 46),
(47,  12, 47),
(48,  12, 48),
(49,  13, 49),
(50,  13, 50),
(51,  13, 51),
(52,  13, 52),
(53,  15, 53),
(54,  15, 54),
(55,  15, 55),
(56,  15, 56),
(57,  16, 57),
(58,  16, 58),
(59,  16, 59),
(60,  16, 60),
(61,  17, 61),
(62,  17, 62),
(63,  17, 63),
(64,  17, 64),
(65,  18, 65),
(66,  18, 66),
(67,  18, 67),
(68,  18, 68),
(69,  19, 69),
(70,  19, 70),
(71,  19, 71),
(72,  19, 72),
(73,  20, 73),
(74,  20, 74),
(75,  20, 75),
(76,  20, 76),
(77,  21, 77),
(78,  21, 78),
(79,  21, 79),
(80,  21, 80),
(81,  22, 81),
(82,  22, 82),
(83,  22, 83),
(84,  22, 84),
(85,  23, 85),
(86,  23, 86),
(87,  23, 87),
(88,  23, 88),
(89,  24, 89),
(90,  24, 90),
(91,  24, 91),
(92,  24, 92),
(93,  25, 93),
(94,  25, 94),
(95,  25, 95),
(96,  25, 96),
(97,  26, 97),
(98,  26, 98),
(99,  26, 99),
(100, 26, 100),
(101, 27, 101),
(102, 27, 102),
(103, 27, 103),
(104, 27, 104),
(105, 28, 105),
(106, 28, 106),
(107, 28, 107),
(108, 28, 108),
(109, 29, 109),
(110, 29, 110),
(111, 29, 111),
(112, 29, 112),
(113, 30, 113),
(114, 30, 114),
(115, 30, 115),
(116, 30, 116),
(117, 31, 117),
(118, 31, 118),
(119, 31, 119),
(120, 31, 120),
(121, 32, 121),
(122, 32, 122),
(123, 32, 123),
(124, 32, 124),
(125, 33, 125),
(126, 33, 126),
(127, 33, 127),
(128, 33, 128),
(129, 34, 129),
(130, 34, 130),
(131, 34, 131),
(132, 34, 132),
(133, 35, 133),
(134, 35, 134),
(135, 35, 135),
(136, 35, 136),
(137, 36, 137),
(138, 36, 138),
(139, 36, 139),
(140, 36, 140),
(141, 37, 141),
(142, 37, 142),
(143, 37, 143),
(144, 37, 144),
(145, 38, 145),
(146, 38, 146),
(147, 38, 147),
(148, 38, 148),
(149, 39, 149),
(150, 39, 150),
(151, 39, 151),
(152, 39, 152),
(153, 40, 153),
(154, 40, 154),
(155, 40, 155),
(156, 40, 156),
(157, 41, 157),
(158, 41, 158),
(159, 41, 159),
(160, 41, 160),
(161, 42, 161),
(162, 42, 162),
(163, 42, 163),
(164, 42, 164),
(165, 43, 165),
(166, 43, 166),
(167, 43, 167),
(168, 43, 168),
(169, 44, 169),
(170, 44, 170),
(171, 44, 171),
(172, 44, 172),
(173, 45, 173),
(174, 45, 174),
(175, 45, 175),
(176, 45, 176),
(177, 46, 177),
(178, 46, 178),
(179, 46, 179),
(180, 46, 180),
(181, 47, 181),
(182, 47, 182),
(183, 47, 183),
(184, 47, 184),
(185, 48, 185),
(186, 48, 186),
(187, 48, 187),
(188, 48, 188),
(189, 49, 189),
(190, 49, 190),
(191, 49, 191),
(192, 49, 192),
(193, 68, 193),
(194, 68, 194),
(195, 68, 195),
(196, 68, 196),
(197, 75, 197),
(198, 75, 198),
(199, 75, 199),
(200, 75, 200);

-- Ship rewards table.
--
-- Many to many relations table.
--
CREATE TABLE `rewards_quests` (
    `id`         smallint NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `quests_id`  smallint NOT NULL                COMMENT 'Quest ID.',
    `rewards_id` smallint NOT NULL                COMMENT 'Reward to award.',

    CONSTRAINT `rewards_quests_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Many to many relations.';

CREATE INDEX `rewards_quests_quests_id_idx` ON `rewards_quests` (`quests_id`);
CREATE INDEX `rewards_quests_rewards_id_idx` ON `rewards_quests` (`rewards_id`);

-- Initial dump for the `rewards_quests` table.

-- Ship rewards table.
--
-- Many to many relations table.
--
CREATE TABLE `rewards_ships` (
    `id`         tinyint  NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `ships_id`   tinyint  NOT NULL                COMMENT 'Ship ID.',
    `rewards_id` smallint NOT NULL                COMMENT 'Reward to award.',

    CONSTRAINT `rewards_ships_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Many to many relations.';

CREATE INDEX `rewards_ships_ships_id_idx` ON `rewards_ships` (`ships_id`);
CREATE INDEX `rewards_ships_rewards_id_idx` ON `rewards_ships` (`rewards_id`);

-- Initial dump for the `rewards_ships` table.

INSERT INTO `rewards_ships`(`id`, `ships_id`, `rewards_id`) VALUES
(1,  1,  1112),
(2,  1,  1113),
(3,  2,  1114),
(4,  2,  1115),
(5,  3,  1116),
(6,  3,  1117),
(7,  4,  1118),
(8,  4,  1119),
(9,  5,  1120),
(10, 5,  1121),
(11, 6,  1122),
(12, 6,  1123),
(13, 7,  1124),
(14, 7,  1125),
(15, 8,  1126),
(16, 8,  1127),
(17, 9,  1128),
(18, 9,  1129),
(19, 10, 1130),
(20, 10, 1131),
(21, 11, 1132),
(22, 11, 1133),
(23, 12, 1134),
(24, 12, 1135),
(25, 13, 1136),
(26, 13, 1137);

-- Ship rewards table.
--
-- Many to many relations table.
--
CREATE TABLE `rewards_vouchers` (
    `id`          smallint NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `vouchers_id` smallint NOT NULL                COMMENT 'Voucher ID.',
    `rewards_id`  smallint NOT NULL                COMMENT 'Reward to award.',

    CONSTRAINT `rewards_vouchers_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Many to many relations.';

CREATE INDEX `rewards_vouchers_vouchers_id_idx` ON `rewards_vouchers` (`vouchers_id`);
CREATE INDEX `rewards_vouchers_rewards_id_idx` ON `rewards_vouchers` (`rewards_id`);

-- Initial dump for the `rewards_vouchers` table.

-- Server logs table.
--
-- Server fired events.
--
CREATE TABLE `server_logs` (
    `id`      int          NOT NULL AUTO_INCREMENT             COMMENT 'Primary Key.',
    `date`    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `level`   varchar(255) NOT NULL DEFAULT 'debug'            COMMENT 'Log level (emergency, alert, critical, error, warning, notice, info, debug)',
    `type`    varchar(255) NOT NULL DEFAULT '',
    `context` text         NOT NULL,

    CONSTRAINT `server_logs_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Server fired events.';

CREATE INDEX `server_logs_level_idx` ON `server_logs` (`level`);

-- Initial dump for the `server_logs` table.

-- Ships table.
--
-- Ships table.
--
CREATE TABLE `ships` (
    `id`         tinyint  NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `items_id`   smallint NOT NULL,
    `health`     int      NOT NULL DEFAULT 0      COMMENT 'Health points',
    `speed`      smallint NOT NULL DEFAULT 0      COMMENT 'Base speed.',
    `cargo`      smallint NOT NULL DEFAULT 100    COMMENT 'Cargo space.',
    `batteries`  smallint NOT NULL DEFAULT 1000   COMMENT 'Batteries space.',
    `rockets`    smallint NOT NULL DEFAULT 100    COMMENT 'Rockets space.',
    `lasers`     tinyint  NOT NULL DEFAULT 1      COMMENT 'Laser slots.',
    `hellstorms` tinyint  NOT NULL DEFAULT 1      COMMENT 'Laser slots.',
    `generators` tinyint  NOT NULL DEFAULT 1      COMMENT 'Generator slots.',
    `extras`     tinyint  NOT NULL DEFAULT 1      COMMENT 'Extras slots.',
    `gfx`        tinyint  NOT NULL DEFAULT 0,

    CONSTRAINT `ships_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Ships table.';

CREATE INDEX `ships_items_id_idx` ON `ships` (`items_id`);
CREATE INDEX `ships_gfx_idx` ON `ships` (`gfx`);

-- Initial dump for the `ships` table.

INSERT INTO `ships` (`id`, `items_id`, `health`, `speed`, `cargo`, `batteries`, `rockets`, `lasers`, `hellstorms`, `generators`, `extras`, `gfx`) VALUES
(1,  9,  4000,   320, 100,  1000,  100,  1,  1, 1,  1, 1),
(2,  10, 8000,   340, 200,  2000,  200,  2,  1, 2,  1, 2),
(3,  11, 12000,  280, 300,  4000,  400,  3,  1, 5,  2, 3),
(4,  12, 16000,  330, 400,  6000,  600,  4,  1, 6,  2, 4),
(5,  13, 64000,  360, 500,  10000, 100,  6,  1, 6,  2, 5),
(6,  14, 64000,  360, 600,  8000,  800,  6,  1, 8,  2, 6),
(7,  15, 120000, 340, 700,  16000, 800,  7,  1, 10, 3, 7),
(8,  16, 180000, 380, 1000, 21000, 1000, 10, 1, 10, 2, 0),
(9,  17, 128000, 280, 800,  18000, 800,  7,  1, 15, 3, 9),
(10, 18, 256000, 300, 1000, 32000, 3000, 15, 1, 15, 3, 10),
(11, 20, 275000, 300, 2000, 15000, 3000, 10, 1, 15, 3, 49),
(12, 21, 550000, 240, 3000, 20000, 2000, 7,  2, 20, 5, 69),
(13, 19, 100000, 370, 500,  5000,  500,  5,  1, 12, 2, 70);

-- Skilltree levels table.
--
-- Levels a skill can reach.
--
CREATE TABLE `skilltree_levels` (
    `id`                  smallint NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `skilltree_skills_id` tinyint  NOT NULL                COMMENT 'The skill.',
    `levels_id`           tinyint  NOT NULL                COMMENT 'Level to upgrade the skill.',
    `credits`             int      NOT NULL DEFAULT 10000  COMMENT 'Credits needed to upgrade this skill.',
    `seprom`              smallint NOT NULL DEFAULT 0      COMMENT 'Seprom needed to upgrade this skill.',
    `points`              tinyint  NOT NULL DEFAULT 1      COMMENT 'Research points needed to upgrade this skill.',

    CONSTRAINT `skilltree_levels_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Levels a skill can reach.';

-- Initial dump for the `skilltree_levels` table.

-- Skilltree skills table.
--
-- The available skills.
--
CREATE TABLE `skilltree_skills` (
    `id`           tinyint      NOT NULL AUTO_INCREMENT   COMMENT 'Primary Key.',
    `name`         varchar(255) NOT NULL DEFAULT ''       COMMENT 'Skill name.',
    `description`  text         NOT NULL                  COMMENT 'Skill description.',
    `category`     tinyint      NOT NULL DEFAULT 1        COMMENT '1 = blue, 2 = purple, 3 = red.',
    `is_advanced`  boolean      NOT NULL DEFAULT 0        COMMENT 'Whether it''s an advanced skill or not.',
    `bonus_type`   varchar(255) NOT NULL DEFAULT 'health' COMMENT 'Type of bonus the skill awards.',
    `bonus_amount` int          NOT NULL DEFAULT 0        COMMENT 'Amount of bonus the skill awards.',
    `bonus_factor` tinyint      NOT NULL DEFAULT 2        COMMENT 'Factor the bonus increases with each upgrade.',

    CONSTRAINT `skilltree_skills_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'The available skills.';

CREATE INDEX `skilltree_skills_name_idx` ON `skilltree_skills` (`name`);
CREATE INDEX `skilltree_skills_category_idx` ON `skilltree_skills` (`category`);
CREATE INDEX `skilltree_skills_is_advanced_idx` ON `skilltree_skills` (`is_advanced`);
CREATE INDEX `skilltree_skills_bonus_type_idx` ON `skilltree_skills` (`bonus_type`);

-- Initial dump for the `skilltree_skills` table.

-- Skilltree unlocks table
--
-- Requisites needed to unlock a skill upgrade.
--
CREATE TABLE `skilltree_unlocks` (
    `id`                           smallint NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `upgrade_skilltree_levels_id`  smallint NOT NULL                COMMENT 'Skill to upgrade.',
    `required_skilltree_levels_id` smallint NOT NULL                COMMENT 'Required skill level to upgrade.',

    CONSTRAINT `skilltree_unlocks_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Requisites needed to unlock a skill upgrade.';

CREATE INDEX `skilltree_unlocks_upgrade_skilltree_levels_id_idx` ON `skilltree_unlocks` (`upgrade_skilltree_levels_id`);
CREATE INDEX `skilltree_unlocks_required_skilltree_levels_id_idx` ON `skilltree_unlocks` (`required_skilltree_levels_id`);

-- Initial dump for the `skilltree_unlocks` table.

-- Skylab modules table.
--
-- Different skylab modules.
--
CREATE TABLE `skylab_modules` (
    `id`                tinyint      NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `name`              varchar(255) NOT NULL DEFAULT ''     COMMENT 'Module name.',
    `production_factor` tinyint      NOT NULL DEFAULT 20     COMMENT 'Production factor.',
    `production_base`   smallint     NOT NULL DEFAULT 1000   COMMENT 'Production base.',
    `storage_factor`    smallint     NOT NULL DEFAULT 50     COMMENT 'Storage factor.',
    `storage_base`      smallint     NOT NULL DEFAULT 20000  COMMENT 'Storage base.',
    `upgrade_factor`    tinyint      NOT NULL DEFAULT 35     COMMENT 'Upgrade costs factor.',
    `upgrade_base`      smallint     NOT NULL DEFAULT 5000   COMMENT 'Upgrade costs base.',
    `energy_factor`     tinyint      NOT NULL DEFAULT 10     COMMENT 'Energy consumption factor.',
    `energy_base`       tinyint      NOT NULL DEFAULT 10     COMMENT 'Energy consumption base.',

    CONSTRAINT `skylab_modules` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Different skylab modules.';

CREATE INDEX `skylab_modules_name_idx` ON `skylab_modules` (`name`);

-- Initial dump for the `skylab_modules` table.

INSERT INTO `skylab_modules`(`id`, `name`, `production_factor`, `production_base`, `storage_factor`, `storage_base`, `upgrade_factor`, `upgrade_base`, `energy_factor`, `energy_base`) VALUES
(1,  'Prometium Collector', 20, 1000, 50, 10000, 35, 5000,  10, 10),
(2,  'Endurium Collector',  20, 1000, 50, 10000, 35, 5000,  10, 10),
(3,  'Terbium Collector',   20, 1000, 50, 10000, 35, 5000,  10, 10),
(4,  'Basic Module',        0,  0,    0,  0,     30, 10000, 5,  20),
(5,  'Solar Module',        20, 150,  20, 150,   20, 6000,  10, 10),
(6,  'Storage Module',      0,  0,    0,  0,     27, 10000, 10, 10),
(7,  'Prometid Refinery',   10, 100,  50, 1000,  40, 10000, 10, 15),
(8,  'Duranium Refinery',   10, 100,  50, 1000,  40, 10000, 10, 15),
(9,  'Xenomit Refinery',    10, 100,  50, 1000,  40, 10000, 10, 15),
(10, 'Promerium Refinery',  7,  100,  25, 1000,  35, 5000,  10, 10),
(11, 'Seprom Refinery',     20, 10,   50, 100,   35, 5000,  10, 10);

-- Nanotech Factory costs table.
--
-- Item production costs.
--
CREATE TABLE `techfactory_costs` (
    `id`                   tinyint  NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `techfactory_items_id` tinyint  NOT NULL                COMMENT 'Techfactory Item ID.',
    `items_id`             smallint NOT NULL                COMMENT 'Cost item ID.',
    `amount`               int      NOT NULL                COMMENT 'Amount of items to build the techfactory item.',

    CONSTRAINT `techfactory_costs_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Item production costs.';

-- Initial dump for the `techfactory_costs` table.

INSERT INTO `techfactory_costs`(`id`, `techfactory_items_id`, `items_id`, `amount`) VALUES
(1,  1, 1,   1000000),
(2,  1, 243, 500),
(3,  1, 229, 5),
(4,  2, 1,   500000),
(5,  2, 243, 200),
(6,  2, 229, 1),
(7,  3, 1,   20000),
(8,  4, 1,   500000),
(9,  4, 243, 250),
(10, 4, 229, 2),
(11, 5, 1,   500000),
(12, 5, 243, 250),
(13, 5, 229, 2);

-- Nanotech Factory drones table.
--
-- Drones that can be build in the tech factory.
--
CREATE TABLE `techfactory_drones` (
    `id`          tinyint      NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `name`        varchar(255) NOT NULL                COMMENT 'Drone name.',
    `description` text         NOT NULL                COMMENT 'Drone description.',
    `time`        tinyint      NOT NULL DEFAULT 0      COMMENT 'Seconds it takes to produce the drone.',
    `parts`       tinyint      NOT NULL DEFAULT 45     COMMENT 'Necessary parts to build the drone.',
    `price`       int          NOT NULL                COMMENT 'Price for producing the drone.',
    `factor`      tinyint      NOT NULL DEFAULT 5.00   COMMENT 'Factor the price reduces with each new part.',

    CONSTRAINT `techfactory_drones_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Drones that can be build in the tech factory.';

CREATE INDEX `techfactory_drones_name_idx` ON `techfactory_drones` (`name`);

-- Initial dump for the `techfactory_drones` table.

INSERT INTO `techfactory_drones`(`id`, `name`, `description`, `time`, `parts`, `price`, `factor`) VALUES
(1, 'Apis', 'Every now and then you can find sections of the Apis drone blueprints in pirate booty. Once you have all the sections, you can build the drone. You can also build the drone instantly but this requires Uridium. Each part of the blueprints you find reduces the price of instantly building the drone.',     0, 45, 1100000, 5),
(2, 'Zeus', 'Occasionally you can find sections of the Zeus drone blueprints in the pirate booty. Once you have all the sections, you can build the drone. You can also build the drone instantly but this requires Uridium. Each piece of the blueprints that you find reduces the price of instantly building the drone.', 0, 45, 1500000, 5);

-- Nanotech Factory items table.
--
-- Items that can be build in the tech factory.
--
CREATE TABLE `techfactory_items` (
    `id`                 tinyint      NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `name`               varchar(255) NOT NULL                COMMENT 'Item name.',
    `description`        text         NOT NULL                COMMENT 'Item description.',
    `effect`             text         NOT NULL                COMMENT 'Effect description.',
    `duration`           smallint     NOT NULL DEFAULT 900    COMMENT 'Seconds the effect is active.',
    `cooldown`           smallint     NOT NULL DEFAULT 900    COMMENT 'Seconds the effect takes to cooldown.',
    `time`               int          NOT NULL                COMMENT 'Seconds it takes to produce the item.',
    `free_production`    smallint     NOT NULL                COMMENT 'Free production costs.',
    `instant_production` smallint     NOT NULL                COMMENT 'Instant production costs.',

    CONSTRAINT `techfactory_items_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Items that can be build in the tech factory.';

CREATE INDEX `techfactory_items_name_idx` ON `techfactory_items` (`name`);

-- Initial dump for the `techfactory_items` table.

INSERT INTO `techfactory_items`(`id`, `name`, `description`, `effect`, `duration`, `cooldown`, `time`, `instant_production`, `free_production`) VALUES
(1, 'Energy leech',       'The energy leech transforms 10% of the laser damage you cause into HP and transfers it back to your ship.',                                                     'Transforms 10% of laser damage into HP and transfers it back to your ship', 900, 900, 43200, 3125, 6500),
(2, 'Chain impulse',      'An energy pulse which locks onto one target and then onto up to seven other enemies, thereby causing a chain reaction of shield damage to each and every one.', 'Can inflict up to 10,000 damage on a maximum of 7 targets',                 0,   60,  21600, 900,  1800),
(3, 'Precision targeter', 'The precision targeter is a highly accurate targeting system that increases the hit ratio of normal rockets by 100% for a certain time.',                       '100% hit ratio',                                                            900, 300, 7200,  250,  500),
(4, 'Backup shields',     'The backup shields will bring your ship''s shields back up immediately.',                                                                                       '75,000 shield strength',                                                    0,   120, 43200, 1400, 2800),
(5, 'Battle repair bot',  'When the battle repair bot is activated, it repairs 10,000 HP per second. It can be used even in the toughest battle situations.',                              '10,000 HP',                                                                 10,  120, 43200, 1400, 2800);

-- Trade items table.
--
-- Trade items.
--
CREATE TABLE `trade_items` (
    `id`          smallint NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `items_id`    smallint NOT NULL,
    `accounts_id` int      NULL     DEFAULT NULL,
    `price`       int      NOT NULL DEFAULT 0,
    `category`    tinyint  NOT NULL DEFAULT 0,

    CONSTRAINT `trade_items_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Trade items.';

CREATE INDEX `trade_items_items_id_idx` ON `trade_items` (`items_id`);
CREATE INDEX `trade_items_accounts_id_idx` ON `trade_items` (`accounts_id`);
CREATE INDEX `trade_items_category_idx` ON `trade_items` (`category`);

-- Initial dump for the `trade_items` table.

-- Users table.
--
-- Contains the registered users.
--
CREATE TABLE `users` (
    `id`                      int           NOT NULL AUTO_INCREMENT            COMMENT 'Primary Key.',
    `date`                    timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date when the user registered.',
    `invitation_codes_id`     smallint      NULL     DEFAULT NULL              COMMENT 'Invitation code used to register',
    `name`                    varchar(255)  NOT NULL DEFAULT ''                COMMENT 'User name.',
    `password`                varchar(40)   NOT NULL DEFAULT ''                COMMENT 'Password hash (sha1).',
    `email`                   varchar(255)  NOT NULL DEFAULT ''                COMMENT 'User email.',
    `email_verification_code` varchar(32)   NOT NULL DEFAULT ''                COMMENT 'Email verification code.',
    `email_verification_date` timestamp     NULL     DEFAULT NULL              COMMENT 'Date when the user verified its email.',
    `ip`                      varbinary(16) NOT NULL DEFAULT ''                COMMENT 'Registration IP.',

    CONSTRAINT `users_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Contains the login information of the registered users.';

CREATE UNIQUE INDEX `users_id_idx` ON `users` (`id`);
CREATE UNIQUE INDEX `users_name_idx` ON `users` (`name`);
CREATE UNIQUE INDEX `users_email_verification_code_idx` ON `users` (`email_verification_code`);

-- Initial dump for `users` table.

-- Vouchers table.
--
-- Voucher codes.
--
CREATE TABLE `vouchers` (
    `id`      smallint    NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `code`    varchar(32) NOT NULL DEFAULT '',
    `limit`   tinyint     NOT NULL DEFAULT 1,

    CONSTRAINT `vouchers_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Voucher codes.';

CREATE UNIQUE INDEX `vouchers_code_idx` ON `vouchers` (`code`);

-- Initial dump for the `vouchers` table.

-- Invitation codes redeem logs.
--
-- Contains the redeem logs for the invitation codes.
--
CREATE TABLE `vouchers_redeem_logs` (
    `id`          int        NOT NULL AUTO_INCREMENT            COMMENT 'Primary Key.',
    `vouchers_id` smallint   NOT NULL                           COMMENT 'Voucher code ID.',
    `accounts_id` int        NOT NULL                           COMMENT 'Account that redeemed the voucher.',
    `date`        timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date when the voucher was redeemed.',

    CONSTRAINT `vouchers_redeem_logs_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Contains the redeem logs for the voucher codes.';

CREATE INDEX `vouchers_redeem_logs_vouchers_id_idx` ON `vouchers_redeem_logs` (`vouchers_id`);
CREATE INDEX `vouchers_redeem_logs_accounts_id_idx` ON `vouchers_redeem_logs` (`accounts_id`);

-- Initial dump for the `vouchers_redeem_logs` table.


-- Relations for the `accounts` table.
--
-- An account can belong to a clan.
-- An account belongs to a faction.
-- An account has a rank.
-- An account has a level.
-- An account has an active hangar.
-- An account belongs to an user.

ALTER TABLE `accounts` ADD CONSTRAINT `accounts_clans` FOREIGN KEY `accounts_clans` (`clans_id`)
    REFERENCES `clans` (`id`);

ALTER TABLE `accounts` ADD CONSTRAINT `accounts_factions` FOREIGN KEY `accounts_factions` (`factions_id`)
    REFERENCES `factions` (`id`);

ALTER TABLE `accounts` ADD CONSTRAINT `accounts_accounts_hangars` FOREIGN KEY `accounts_accounts_hangars` (`accounts_hangars_id`)
    REFERENCES `accounts_hangars` (`id`);

ALTER TABLE `accounts` ADD CONSTRAINT `accounts_levels` FOREIGN KEY `accounts_levels` (`levels_id`)
    REFERENCES `levels` (`id`);

ALTER TABLE `accounts` ADD CONSTRAINT `accounts_ranks` FOREIGN KEY `accounts_ranks` (`ranks_id`)
    REFERENCES `ranks` (`id`);

ALTER TABLE `accounts` ADD CONSTRAINT `accounts_users` FOREIGN KEY `accounts_users` (`users_id`)
    REFERENCES `users` (`id`);

-- Relations for the `accounts_banks` table.
--
-- A bank belongs to an account.

ALTER TABLE `accounts_banks` ADD CONSTRAINT `accounts_banks_accounts` FOREIGN KEY `accounts_banks_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

-- Relations for the `accounts_banks_logs` table.
--
-- A log entry is created by an account.
-- A log entry is destined to an account.
-- A log entry belongs to a bank.

ALTER TABLE `accounts_banks_logs` ADD CONSTRAINT `accounts_banks_logs_accounts` FOREIGN KEY `accounts_banks_logs_accounts` (`from_accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_banks_logs` ADD CONSTRAINT `accounts_banks_logs_to_accounts` FOREIGN KEY `accounts_banks_logs_to_accounts` (`to_accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_banks_logs` ADD CONSTRAINT `accounts_banks_logs_accounts_banks` FOREIGN KEY `accounts_banks_logs_accounts_banks` (`accounts_banks_id`)
    REFERENCES `accounts_banks` (`id`);

-- Relations for the `accounts_clans_roles` table.
--
-- An account.
-- A role.

ALTER TABLE `accounts_clans_roles` ADD CONSTRAINT `accounts_clans_roles_accounts` FOREIGN KEY `accounts_clans_roles_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_clans_roles` ADD CONSTRAINT `accounts_clans_roles_clans_roles` FOREIGN KEY `accounts_clans_roles_clans_roles` (`clans_roles_id`)
    REFERENCES `clans_roles` (`id`);

-- Relations for the `accounts_configurations` table.
--
-- A configuration belongs to an hangar.

ALTER TABLE `accounts_configurations` ADD CONSTRAINT `accounts_configurations_accounts_hangars` FOREIGN KEY `accounts_configurations_accounts_hangars` (`accounts_hangars_id`)
    REFERENCES `accounts_hangars` (`id`);

-- Relations for the `accounts_configurations_accounts_items` table.
--
-- A configuration item belongs to a configuration.
-- A configuration item is an item.
-- A configuration item can be equipped on a drone.
-- A configuration item can be equipped on a pet.

ALTER TABLE `accounts_configurations_accounts_items` ADD CONSTRAINT `accounts_configurations_accounts_items_accounts_configurations` FOREIGN KEY `accounts_configurations_accounts_items_accounts_configurations` (`accounts_configurations_id`)
    REFERENCES `accounts_configurations` (`id`);

ALTER TABLE `accounts_configurations_accounts_items` ADD CONSTRAINT `accounts_configurations_accounts_items_accounts_items` FOREIGN KEY `accounts_configurations_accounts_items_accounts_items` (`accounts_items_id`)
    REFERENCES `accounts_items` (`id`);

ALTER TABLE `accounts_configurations_accounts_items` ADD CONSTRAINT `accounts_configurations_accounts_items_accounts_drones` FOREIGN KEY `accounts_configurations_accounts_items_accounts_drones` (`accounts_drones_id`)
    REFERENCES `accounts_drones` (`id`);

ALTER TABLE `accounts_configurations_accounts_items` ADD CONSTRAINT `accounts_configurations_accounts_items_accounts_pets` FOREIGN KEY `accounts_configurations_accounts_items_accounts_pets` (`accounts_pets_id`)
    REFERENCES `accounts_pets` (`id`);

-- Relations for the `accounts_destroys` table.
--
-- A destroy history belongs to an account.

ALTER TABLE `accounts_destroys` ADD CONSTRAINT `accounts_destroys_accounts` FOREIGN KEY `accounts_destroys_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

-- Relations for the `accounts_drones` table.
--
-- A drone has a level.
-- A drone belongs to an account.

ALTER TABLE `accounts_drones` ADD CONSTRAINT `accounts_drones_accounts` FOREIGN KEY `accounts_drones_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_drones` ADD CONSTRAINT `accounts_drones_levels` FOREIGN KEY `accounts_drones_levels` (`levels_id`)
    REFERENCES `levels` (`id`);

-- Relations for the `accounts_galaxygates` table.
--
-- A gate is a galaxy gate.
-- A gate belongs to an account.

ALTER TABLE `accounts_galaxygates` ADD CONSTRAINT `accounts_galaxygates_galaxygates` FOREIGN KEY `accounts_galaxygates_galaxygates` (`galaxygates_id`)
    REFERENCES `galaxygates` (`id`);

ALTER TABLE `accounts_galaxygates` ADD CONSTRAINT `accounts_galaxygates_accounts` FOREIGN KEY `accounts_galaxygates_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

-- Relations for the `accounts_hangars` table.
--
-- An hangar belongs to an account.
-- An hangar has a ship.

ALTER TABLE `accounts_hangars` ADD CONSTRAINT `accounts_hangars_accounts` FOREIGN KEY `accounts_hangars_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_hangars` ADD CONSTRAINT `accounts_hangars_accounts_ships` FOREIGN KEY `accounts_hangars_accounts_ships` (`accounts_ships_id`)
    REFERENCES `accounts_ships` (`id`);

-- Relations for the `accounts_history` table.
--
-- A history belongs to an account.

ALTER TABLE `accounts_history` ADD CONSTRAINT `accounts_history_accounts` FOREIGN KEY `accounts_history_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

-- Relations for the `accounts_items` table.
--
-- An item belongs to an account.
-- An item is an item.
-- An item has a level.

ALTER TABLE `accounts_items` ADD CONSTRAINT `accounts_items_accounts` FOREIGN KEY `accounts_items_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_items` ADD CONSTRAINT `accounts_items_items` FOREIGN KEY `accounts_items_items` (`items_id`)
    REFERENCES `items` (`id`);

ALTER TABLE `accounts_items` ADD CONSTRAINT `accounts_items_levels` FOREIGN KEY `accounts_items_levels` (`levels_id`)
    REFERENCES `levels` (`id`);

-- Relations for the `accounts_messages` table.
--
-- A message comes from an account.
-- A message goes to an account.

ALTER TABLE `accounts_messages` ADD CONSTRAINT `accounts_messages_to_accounts` FOREIGN KEY `accounts_messages_to_accounts` (`to_accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_messages` ADD CONSTRAINT `accounts_messages_from_accounts` FOREIGN KEY `accounts_messages_from_accounts` (`from_accounts_id`)
    REFERENCES `accounts` (`id`);

-- Relations for the `accounts_pets` table.
--
-- A pet has a level.
-- A pet belongs to an account.

ALTER TABLE `accounts_pets` ADD CONSTRAINT `accounts_pets_accounts` FOREIGN KEY `accounts_pets_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_pets` ADD CONSTRAINT `accounts_pets_levels` FOREIGN KEY `accounts_pets_levels` (`levels_id`)
    REFERENCES `levels` (`id`);

-- Relations for the `accounts_quests` table.
--
-- A quest belongs to an account.
-- A quest is a quest.

ALTER TABLE `accounts_quests` ADD CONSTRAINT `accounts_quests_accounts` FOREIGN KEY `accounts_quests_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_quests` ADD CONSTRAINT `accounts_quests_quests` FOREIGN KEY `accounts_quests_quests` (`quests_id`)
    REFERENCES `quests` (`id`);

-- Relations for the `accounts_rankings` table.
--
-- A rank belongs to an account.

ALTER TABLE `accounts_rankings` ADD CONSTRAINT `accounts_rankings_accounts` FOREIGN KEY `accounts_rankings_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

-- Relations for the `accounts_ships` table.
--
-- A ship belongs to an account.
-- A ship is a ship.
-- A ship is located in a map.

ALTER TABLE `accounts_ships` ADD CONSTRAINT `accounts_ships_accounts` FOREIGN KEY `accounts_ships_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_ships` ADD CONSTRAINT `accounts_ships_ships` FOREIGN KEY `accounts_ships_ships` (`ships_id`)
    REFERENCES `ships` (`id`);

ALTER TABLE `accounts_ships` ADD CONSTRAINT `accounts_ships_maps` FOREIGN KEY `accounts_ships_maps` (`maps_id`)
    REFERENCES `maps` (`id`);

-- Relations for the `accounts_skills` table.
--
-- A skill belongs to an account.
-- A skill is a skill.
-- A skill has a level.

ALTER TABLE `accounts_skills` ADD CONSTRAINT `accounts_skills_accounts` FOREIGN KEY `accounts_skills_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_skills` ADD CONSTRAINT `accounts_skills_skilltree_skills` FOREIGN KEY `accounts_skills_skilltree_skills` (`skilltree_skills_id`)
    REFERENCES `skilltree_skills` (`id`);

ALTER TABLE `accounts_skills` ADD CONSTRAINT `accounts_skills_skilltree_levels` FOREIGN KEY `accounts_skills_skilltree_levels` (`skilltree_levels_id`)
    REFERENCES `skilltree_levels` (`id`);

-- Relations for the `accounts_skylabs` table.
--
-- A skylab is a skylab module.
-- A skylab has a level.
-- A skylab belongs to an account.

ALTER TABLE `accounts_skylabs` ADD CONSTRAINT `accounts_skylabs_accounts` FOREIGN KEY `accounts_skylabs_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_skylabs` ADD CONSTRAINT `accounts_skylabs_skylab_modules` FOREIGN KEY `accounts_skylabs_skylab_modules` (`skylab_modules_id`)
    REFERENCES `skylab_modules` (`id`);

ALTER TABLE `accounts_skylabs` ADD CONSTRAINT `accounts_skylabs_levels` FOREIGN KEY `accounts_skylabs_levels` (`levels_id`)
    REFERENCES `levels` (`id`);

-- Relations for the `accounts_techfactories` table.
--
-- A techfactory belongs to an account.

ALTER TABLE `accounts_techfactories` ADD CONSTRAINT `accounts_techfactories_accounts` FOREIGN KEY `accounts_techfactories_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

-- Relations for the `accounts_techfactory_items` table.
--
-- An item belongs to an account.
-- An item is a techfactory item.

ALTER TABLE `accounts_techfactory_items` ADD CONSTRAINT `accounts_techfactory_items_accounts` FOREIGN KEY `accounts_techfactory_items_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `accounts_techfactory_items` ADD CONSTRAINT `accounts_techfactory_items_techfactory_items` FOREIGN KEY `accounts_techfactory_items_techfactory_items` (`techfactory_items_id`)
    REFERENCES `techfactory_items` (`id`);

-- Relations for the table `clans`.
--
-- A clan belongs to an account.

ALTER TABLE `clans` ADD CONSTRAINT `clans_accounts` FOREIGN KEY `clans_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

-- Relations for the `clans_applications` table.
--
-- An application is designated to a clan.
-- An application belongs to an account.

ALTER TABLE `clans_applications` ADD CONSTRAINT `clans_applications_clans` FOREIGN KEY `clans_applications_clans` (`clans_id`)
    REFERENCES `clans` (`id`);

ALTER TABLE `clans_applications` ADD CONSTRAINT `clans_applications_accounts` FOREIGN KEY `clans_applications_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

-- Relations for the `clans_banks` table.
--
-- A bank belongs to a clan.

ALTER TABLE `clans_banks` ADD CONSTRAINT `clans_banks_clans` FOREIGN KEY `clans_banks_clans` (`clans_id`)
    REFERENCES `clans` (`id`);

-- Relations for the `clans_banks_logs` table.
--
-- A log entry belongs to a clan bank.
-- A log entry is made by an account.
-- A log entry is made to an account.

ALTER TABLE `clans_banks_logs` ADD CONSTRAINT `clans_banks_logs_clans_banks` FOREIGN KEY `clans_banks_logs_clans_banks` (`clans_banks_id`)
    REFERENCES `clans_banks` (`id`);

ALTER TABLE `clans_banks_logs` ADD CONSTRAINT `clans_banks_logs_from_accounts` FOREIGN KEY `clans_banks_logs_from_accounts` (`from_accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `clans_banks_logs` ADD CONSTRAINT `clans_banks_logs_to_accounts` FOREIGN KEY `clans_banks_logs_to_accounts` (`to_accounts_id`)
    REFERENCES `accounts` (`id`);

-- Relations for the `clans_battlestations` table.
--
-- A CBS may belong to a clan.
-- A CBS is located in a map.

ALTER TABLE `clans_battlestations` ADD CONSTRAINT `clans_battlestations_clans` FOREIGN KEY `clans_battlestations_clans` (`clans_id`)
    REFERENCES `clans` (`id`);

ALTER TABLE `clans_battlestations` ADD CONSTRAINT `clans_battlestations_maps` FOREIGN KEY `clans_battlestations_maps` (`maps_id`)
    REFERENCES `maps` (`id`);

-- Relations for the `clans_battlestations_items` table.
--
-- An item belongs to a CBS.
-- An item is an account's item.

ALTER TABLE `clans_battlestations_items` ADD CONSTRAINT `clans_battlestations_items_clans_battlestations` FOREIGN KEY `clans_battlestations_items_clans_battlestations` (`clans_battlestations_id`)
    REFERENCES `clans_battlestations` (`id`);

ALTER TABLE `clans_battlestations_items` ADD CONSTRAINT `clans_battlestations_items_accounts_items` FOREIGN KEY `clans_battlestations_items_accounts_items` (`accounts_items_id`)
    REFERENCES `accounts_items` (`id`);

-- Relations for the `clans_battlestations_logs` table.
--
-- A log entry belongs to a clan battle station.
-- A log entry belongs to a clan.

ALTER TABLE `clans_battlestations_logs` ADD CONSTRAINT `clans_battlestations_logs_clans_battlestations` FOREIGN KEY `clans_battlestations_logs_clans_battlestations` (`clans_battlestations_id`)
    REFERENCES `clans_battlestations` (`id`);

ALTER TABLE `clans_battlestations_logs` ADD CONSTRAINT `clans_battlestations_logs_clans` FOREIGN KEY `clans_battlestations_logs_clans` (`clans_id`)
    REFERENCES `clans` (`id`);

-- Relations for the `clans_diplomacies` table.
--
-- A diplomacy belongs to a clan.
-- A diplomacy is aimed to a clan.

ALTER TABLE `clans_diplomacies` ADD CONSTRAINT `clans_diplomacies_from_clans` FOREIGN KEY `clans_diplomacies_from_clans` (`from_clans_id`)
    REFERENCES `clans` (`id`);

ALTER TABLE `clans_diplomacies` ADD CONSTRAINT `clans_diplomacies_to_clans` FOREIGN KEY `clans_diplomacies_to_clans` (`to_clans_id`)
    REFERENCES `clans` (`id`);

-- Relations for the `clans_messages` table.
--
-- A message belongs to a clan.
-- A message is made by an account.
-- A message may be directed to an account.

ALTER TABLE `clans_messages` ADD CONSTRAINT `clans_messages_clans` FOREIGN KEY `clans_messages_clans` (`clans_id`)
    REFERENCES `clans` (`id`);

ALTER TABLE `clans_messages` ADD CONSTRAINT `clans_messages_to_accounts` FOREIGN KEY `clans_messages_to_accounts` (`to_accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `clans_messages` ADD CONSTRAINT `clans_messages_from_accounts` FOREIGN KEY `clans_messages_from_accounts` (`from_accounts_id`)
    REFERENCES `accounts` (`id`);

-- Relations for the `clans_news` table.
--
-- A new is made by an account.
-- A new belongs to a clan.

ALTER TABLE `clans_news` ADD CONSTRAINT `clans_news_accounts` FOREIGN KEY `clans_news_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `clans_news` ADD CONSTRAINT `clans_news_clans` FOREIGN KEY `clans_news_clans` (`clans_id`)
    REFERENCES `clans` (`id`);

-- Relations for the `clans_ranking` table.
--
-- A rank belongs to a clan.

ALTER TABLE `clans_ranking` ADD CONSTRAINT `clans_ranking_clans` FOREIGN KEY `clans_ranking_clans` (`clans_id`)
    REFERENCES `clans` (`id`);

-- Relations for the `clans_roles` table.
--
-- A role belongs to a clan.

ALTER TABLE `clans_roles` ADD CONSTRAINT `clans_roles_clans` FOREIGN KEY `clans_roles_clans` (`clans_id`)
    REFERENCES `clans` (`id`);

-- Relations for the `clans_roles_permissions` table.
--
-- A role permission belongs to a clan.
-- A role permission is a permission

ALTER TABLE `clans_roles_permissions` ADD CONSTRAINT `clans_roles_permissions_clans_roles` FOREIGN KEY `clans_roles_permissions_clans_roles` (`clans_roles_id`)
    REFERENCES `clans_roles` (`id`);

ALTER TABLE `clans_roles_permissions` ADD CONSTRAINT `clans_roles_permissions_permissions` FOREIGN KEY `clans_roles_permissions_permissions` (`permissions_id`)
    REFERENCES `permissions` (`id`);

-- Relations for the `collectables` table.

-- Relations for the `events` table.
--

-- Relations for the `factions` table.
--
-- A faction has a low starter map.
-- A faction has a high starter map.

ALTER TABLE `factions` ADD CONSTRAINT `factions_high_maps` FOREIGN KEY `factions_high_maps` (`high_maps_id`)
    REFERENCES `maps` (`id`);

ALTER TABLE `factions` ADD CONSTRAINT `factions_low_maps` FOREIGN KEY `factions_low_maps` (`low_maps_id`)
    REFERENCES `maps` (`id`);

-- Relations for the `galaxygates` table.
--
-- A galaxygate starts in a wave.

ALTER TABLE `galaxygates` ADD CONSTRAINT `galaxygates_galaxygates_waves` FOREIGN KEY `galaxygates_galaxygates_waves` (`galaxygates_waves_id`)
    REFERENCES `galaxygates_waves` (`id`);

-- Relations for the `galaxygates_gg_spins` table.

ALTER TABLE `galaxygates_gg_spins` ADD CONSTRAINT `galaxygates_gg_spins_galaxygates` FOREIGN KEY `galaxygates_gg_spins_galaxygates` (`galaxygates_id`)
    REFERENCES `galaxygates` (`id`);

ALTER TABLE `galaxygates_gg_spins` ADD CONSTRAINT `galaxygates_gg_spins_galaxygates_spins` FOREIGN KEY `galaxygates_gg_spins_galaxygates_spins` (`galaxygates_spins_id`)
    REFERENCES `galaxygates_spins` (`id`);

-- Relations for the `galaxygates_gg_waves` table.

ALTER TABLE `galaxygates_gg_waves` ADD CONSTRAINT `galaxygates_gg_waves_galaxygates` FOREIGN KEY `galaxygates_gg_waves_galaxygates` (`galaxygates_id`)
    REFERENCES `galaxygates` (`id`);

ALTER TABLE `galaxygates_gg_waves` ADD CONSTRAINT `galaxygates_gg_waves_galaxygates_waves` FOREIGN KEY `galaxygates_gg_waves_galaxygates_waves` (`galaxygates_waves_id`)
    REFERENCES `galaxygates_waves` (`id`);

-- Relations for the `galaxygates_probabilities` table.
--
-- A probability belongs to a gate.

ALTER TABLE `galaxygates_probabilities` ADD CONSTRAINT `galaxygates_probabilities_galaxygates` FOREIGN KEY `galaxygates_probabilities_galaxygates` (`galaxygates_id`)
    REFERENCES `galaxygates` (`id`);

-- Relations for the `galaxygates_spawns` table.
--
-- A spawn spawns an NPC.

ALTER TABLE `galaxygates_spawns` ADD CONSTRAINT `galaxygates_spawns_npcs` FOREIGN KEY `galaxygates_spawns_npcs` (`npcs_id`)
    REFERENCES `npcs` (`id`);

-- Relations for the `galaxygates_spins` table.
--
-- A spin awards an item.

ALTER TABLE `galaxygates_spins` ADD CONSTRAINT `galaxygates_spins_items` FOREIGN KEY `galaxygates_spins_items` (`items_id`)
    REFERENCES `items` (`id`);

-- Relations for the `galaxygates_stages` table.
--
-- A stage belongs to a wave.

ALTER TABLE `galaxygates_stages` ADD CONSTRAINT `galaxygates_stages_galaxygates_waves` FOREIGN KEY `galaxygates_stages_galaxygates_waves` (`galaxygates_waves_id`)
    REFERENCES `galaxygates_waves` (`id`);

-- Relations for the `galaxygates_stages_spawns` table.

ALTER TABLE `galaxygates_stages_spawns` ADD CONSTRAINT `galaxygates_stages_spawns_galaxygates_stages` FOREIGN KEY `galaxygates_stages_spawns_galaxygates_stages` (`galaxygates_stages_id`)
    REFERENCES `galaxygates_stages` (`id`);

ALTER TABLE `galaxygates_stages_spawns` ADD CONSTRAINT `galaxygates_stages_spawns_galaxygates_spawns` FOREIGN KEY `galaxygates_stages_spawns_galaxygates_spawns` (`galaxygates_spawns_id`)
    REFERENCES `galaxygates_spawns` (`id`);

-- Relations for the `galaxygates_waves` table.
--
-- A wave occurs in a map

ALTER TABLE `galaxygates_waves` ADD CONSTRAINT `galaxygates_waves_maps` FOREIGN KEY `galaxygates_spins_maps` (`maps_id`)
    REFERENCES `maps` (`id`);

-- Relations for the `invitation_codes` table.

-- Relations for the `invitation_codes_redeem_logs` table.
--
-- A log entry belongs to an invitation code.
--

ALTER TABLE `invitation_codes_redeem_logs` ADD CONSTRAINT `invitation_codes_redeem_logs_invitation_codes` FOREIGN KEY `invitation_codes_redeem_logs_invitation_codes` (`invitation_codes_id`)
    REFERENCES `invitation_codes` (`id`);

-- Relations for the `items` table.

-- Relations for the `key_value` table.

-- Relations for the `levels` table.

-- Relations for the `levels_upgrades` table.
--
ALTER TABLE `levels_upgrades` ADD CONSTRAINT `levels_upgrades_levels` FOREIGN KEY `levels_upgrades_levels` (`levels_id`)
    REFERENCES `levels` (`id`);

-- Relations for the `maps` table.
--
-- A map may belong to a faction.

ALTER TABLE `maps` ADD CONSTRAINT `maps_factions` FOREIGN KEY `maps_factions` (`factions_id`)
    REFERENCES `factions` (`id`);

-- Relations for the `maps_npcs` table.
--
-- A npc belongs to a map.
-- A npc is a npc.

ALTER TABLE `maps_npcs` ADD CONSTRAINT `maps_npcs_maps` FOREIGN KEY `maps_npcs_maps` (`maps_id`)
    REFERENCES `maps` (`id`);

ALTER TABLE `maps_npcs` ADD CONSTRAINT `maps_npcs_npcs` FOREIGN KEY `maps_npcs_npcs` (`npcs_id`)
    REFERENCES `npcs` (`id`);

-- Relations for the `maps_portals` table.
--
-- A portal belongs to a map.
-- A portal targets a map

ALTER TABLE `maps_portals` ADD CONSTRAINT `maps_portals_maps` FOREIGN KEY `maps_portals_maps` (`maps_id`)
    REFERENCES `maps` (`id`);

ALTER TABLE `maps_portals` ADD CONSTRAINT `maps_portals_target_maps` FOREIGN KEY `maps_portals_to_maps` (`target_maps_id`)
    REFERENCES `maps` (`id`);

-- Relations for the `maps_stations` table.
--
-- A station belongs to a map.
-- A station belongs to a faction.

ALTER TABLE `maps_stations` ADD CONSTRAINT `maps_stations_maps` FOREIGN KEY `maps_stations_maps` (`maps_id`)
    REFERENCES `maps` (`id`);

ALTER TABLE `maps_stations` ADD CONSTRAINT `maps_stations_factions` FOREIGN KEY `maps_stations_factions` (`factions_id`)
    REFERENCES `factions` (`id`);

-- Relations for the `moderators` table.
--
-- A moderator has an account.

ALTER TABLE `moderators` ADD CONSTRAINT `moderators_accounts` FOREIGN KEY `moderators_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

-- Relations for the `moderators_logs` table.
--
-- A log entry is made by a moderator.

ALTER TABLE `moderators_logs` ADD CONSTRAINT `moderators_logs_moderators` FOREIGN KEY `moderators_logs_moderators` (`moderators_id`)
    REFERENCES `moderators` (`id`);

-- Relations for the `news` table.

-- Relations for the `npcs` table.

-- Relations for the table `permissions`.

-- Relations for the `quests` table.
--
-- A quest requires a level to be unlocked.
-- A quest requires another quest to be unlocked.
-- A quest can belong to a faction

ALTER TABLE `quests` ADD CONSTRAINT `quests_levels` FOREIGN KEY `quests_levels` (`levels_id`)
    REFERENCES `levels` (`id`);

ALTER TABLE `quests` ADD CONSTRAINT `quests_quests` FOREIGN KEY `quests_quests` (`quests_id`)
    REFERENCES `quests` (`id`);

ALTER TABLE `quests` ADD CONSTRAINT `quests_factions` FOREIGN KEY `quests_factions` (`factions_id`)
    REFERENCES `factions` (`id`);

-- Relations for the `quests_conditions` table.
--
-- A condition belongs to a quest.
-- A condition may have a parent condition.

ALTER TABLE `quests_conditions` ADD CONSTRAINT `quests_conditions_quests` FOREIGN KEY `quests_conditions_quests` (`quests_id`)
    REFERENCES `quests` (`id`);

ALTER TABLE `quests_conditions` ADD CONSTRAINT `quests_conditions_quests_conditions` FOREIGN KEY `quests_conditions_quests_conditions` (`quests_conditions_id`)
    REFERENCES `quests_conditions` (`id`);

-- Relations for the `ranks` table.

-- Relations for the `rewards` table.
--
-- A reward is an item.

ALTER TABLE `rewards` ADD CONSTRAINT `rewards_items` FOREIGN KEY `rewards_items` (`items_id`)
    REFERENCES `items` (`id`);

-- Relations for the `rewards_collectables` table.
--
-- A reward is for a Collectable.
-- A reward is a reward.

ALTER TABLE `rewards_collectables` ADD CONSTRAINT `rewards_collectables_rewards` FOREIGN KEY `rewards_collectables_rewards` (`rewards_id`)
    REFERENCES `rewards` (`id`);

ALTER TABLE `rewards_collectables` ADD CONSTRAINT `rewards_collectables_collectables` FOREIGN KEY `rewards_collectables_collectables` (`collectables_id`)
    REFERENCES `collectables` (`id`);

-- Relations for the `rewards_galaxygates` table.
--
-- A reward is for a GalaxyGate.
-- A reward is a reward.

ALTER TABLE `rewards_galaxygates` ADD CONSTRAINT `rewards_galaxygates_rewards` FOREIGN KEY `rewards_galaxygates_rewards` (`rewards_id`)
    REFERENCES `rewards` (`id`);

ALTER TABLE `rewards_galaxygates` ADD CONSTRAINT `rewards_galaxygates_galaxygates` FOREIGN KEY `rewards_galaxygates_galaxygates` (`galaxygates_id`)
    REFERENCES `galaxygates` (`id`);

-- Relations for the `rewards_npcs` table.
--
-- A reward is for a NPC.
-- A reward is a reward.

ALTER TABLE `rewards_npcs` ADD CONSTRAINT `rewards_npcs_rewards` FOREIGN KEY `rewards_npcs_rewards` (`rewards_id`)
    REFERENCES `rewards` (`id`);

ALTER TABLE `rewards_npcs` ADD CONSTRAINT `rewards_npcs_npcs` FOREIGN KEY `rewards_npcs_npcs` (`npcs_id`)
    REFERENCES `npcs` (`id`);

-- Relations for the `rewards_quests` table.
--
-- A reward is for a Quest.
-- A reward is a reward.

ALTER TABLE `rewards_quests` ADD CONSTRAINT `rewards_quests_rewards` FOREIGN KEY `rewards_quests_rewards` (`rewards_id`)
    REFERENCES `rewards` (`id`);

ALTER TABLE `rewards_quests` ADD CONSTRAINT `rewards_quests_quests` FOREIGN KEY `rewards_quests_quests` (`quests_id`)
    REFERENCES `quests` (`id`);

-- Relations for the `rewards_ships` table.
--
-- A reward is for a Ship.
-- A reward is a reward.

ALTER TABLE `rewards_ships` ADD CONSTRAINT `rewards_ships_rewards` FOREIGN KEY `rewards_ships_rewards` (`rewards_id`)
    REFERENCES `rewards` (`id`);

ALTER TABLE `rewards_ships` ADD CONSTRAINT `rewards_ships_ships` FOREIGN KEY `rewards_ships_ships` (`ships_id`)
    REFERENCES `ships` (`id`);

-- Relations for the `rewards_vouchers` table.
--
-- A reward is for a Voucher.
-- A reward is a reward.

ALTER TABLE `rewards_vouchers` ADD CONSTRAINT `rewards_vouchers_rewards` FOREIGN KEY `rewards_vouchers_rewards` (`rewards_id`)
    REFERENCES `rewards` (`id`);

ALTER TABLE `rewards_vouchers` ADD CONSTRAINT `rewards_vouchers_vouchers` FOREIGN KEY `rewards_vouchers_vouchers` (`vouchers_id`)
    REFERENCES `vouchers` (`id`);

-- Relations for the `server_logs` table.

-- Relations for the `ships` table.
--
-- A ship is an item

ALTER TABLE `ships` ADD CONSTRAINT `ships_items` FOREIGN KEY `ships_items` (`items_id`)
    REFERENCES `items` (`id`);

-- Relations for the `skilltree_levels` table.
--
-- A level is a level.
-- A level is for a skill.

ALTER TABLE `skilltree_levels` ADD CONSTRAINT `skilltree_levels_levels` FOREIGN KEY `skilltree_levels_levels` (`levels_id`)
    REFERENCES `levels` (`id`);

ALTER TABLE `skilltree_levels` ADD CONSTRAINT `skilltree_levels_skills` FOREIGN KEY `skilltree_levels_skills` (`skilltree_skills_id`)
    REFERENCES `skilltree_skills` (`id`);

-- Relations for the `skilltree_skills` table.

-- Relations for the `skilltree_unlocks` table.
--
-- A unlock is for a skill level.
-- A unlock requires another skill level.

ALTER TABLE `skilltree_unlocks` ADD CONSTRAINT `skilltree_unlocks_upgrade_skilltree_levels` FOREIGN KEY `skilltree_unlocks_upgrade_skilltree_levels` (`upgrade_skilltree_levels_id`)
    REFERENCES `skilltree_levels` (`id`);

ALTER TABLE `skilltree_unlocks` ADD CONSTRAINT `skilltree_unlocks_required_skilltree_levels` FOREIGN KEY `skilltree_unlocks_required_skilltree_levels` (`required_skilltree_levels_id`)
    REFERENCES `skilltree_levels` (`id`);

-- Relations for the `skylab_modules` levels.

-- Relations for the `techfactory_costs` table.
--
-- A cost is for a Techfactory item.
-- A cost requires an item.

ALTER TABLE `techfactory_costs` ADD CONSTRAINT `techfactory_costs_techfactory_items` FOREIGN KEY `techfactory_costs_techfactory_items` (`techfactory_items_id`)
    REFERENCES `techfactory_items` (`id`);

ALTER TABLE `techfactory_costs` ADD CONSTRAINT `techfactory_costs_items` FOREIGN KEY `techfactory_costs_items` (`items_id`)
    REFERENCES `items` (`id`);

-- Relations for the `techfactory_drones` table.

-- Relations for the `techfactory_items` table.

-- Relations for the `trade_items` table.
--
-- A bid is made to an item.
-- A bid is made by an account.

ALTER TABLE `trade_items` ADD CONSTRAINT `trade_items_items` FOREIGN KEY `trade_items_items` (`items_id`)
    REFERENCES `items` (`id`);

ALTER TABLE `trade_items` ADD CONSTRAINT `trade_items_accounts` FOREIGN KEY `trade_items_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

-- Relations for `users` table.
--
-- An user can be registered with an invitation code.

ALTER TABLE `users` ADD CONSTRAINT `users_invitation_codes` FOREIGN KEY `users_invitation_codes` (`invitation_codes_id`)
    REFERENCES `invitation_codes` (`id`);

-- Relations for the `vouchers` table.

-- Relations for the `vouchers_redeem_logs` table.
--
-- A log entry belongs to an voucher code.
-- A log entry is redeemed by an account.

ALTER TABLE `vouchers_redeem_logs` ADD CONSTRAINT `vouchers_redeem_logs_vouchers` FOREIGN KEY `vouchers_redeem_logs_vouchers` (`vouchers_id`)
    REFERENCES `vouchers` (`id`);

ALTER TABLE `vouchers_redeem_logs` ADD CONSTRAINT `vouchers_redeem_logs_accounts` FOREIGN KEY `vouchers_redeem_logs_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

