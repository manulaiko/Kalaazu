-- Relations for the `moderators_logs` table.
--
-- A log entry is made by a moderator.

ALTER TABLE `moderators_logs` ADD CONSTRAINT `moderators_logs_moderators` FOREIGN KEY `moderators_logs_moderators` (`moderators_id`)
    REFERENCES `moderators` (`id`);
