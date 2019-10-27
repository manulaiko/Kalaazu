-- Initial dump for the `moderators_roles_permissions` table.

INSERT INTO `moderators_roles_permissions` (`id`, `moderators_roles_id`, `permissions_id`, `is_enabled`)
VALUES (1, 1, 14, true),
       (2, 2, 14, null),
       (3, 2, 15, true),
       (4, 3, 16, true),
       (5, 4, 16, null),
       (6, 4, 17, true),
       (7, 5, 14, true),
       (8, 5, 16, true),
       (9, 5, 18, true),
       (10, 6, 14, null),
       (11, 6, 16, null),
       (12, 6, 18, null),
       (13, 6, 14, true),
       (14, 6, 16, true),
       (15, 6, 18, true);
