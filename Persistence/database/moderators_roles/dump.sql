-- Initial dump for the `moderators_roles` table.

INSERT INTO `moderators_roles`(`id`, `name`, `moderators_roles_id`, `priority`) VALUES
(1, 'Chat moderator',       NULL, 0),
(2, 'Chat administrator',   1,    1),
(3, 'Game moderator',       NULL, 2),
(4, 'Game administrator',   3,    3),
(5, 'Global moderator',     NULL, 4),
(6, 'Global administrator', 5,    5);