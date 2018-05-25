-- Initial dump for the `permissions` table.

INSERT INTO `permissions` (`id`, `name`, `category`)
VALUES (1, 'create_newsletter', 'clan'),
       (2, 'manage_applications', 'clan'),
       (3, 'dismiss_members', 'clan'),
       (4, 'edit_ranks', 'clan'),
       (5, 'diplomacy_start', 'clan'),
       (6, 'diplomacy_end', 'clan'),
       (7, 'diplomacy_war', 'clan'),
       (8, 'administrate_bank', 'clan'),
       (9, 'change_tax', 'clan'),
       (10, 'create_news', 'clan'),
       (11, 'manage_modules', 'clan'),
       (12, 'manage_deflector', 'clan'),
       (13, 'build_station', 'clan'),
       (14, 'chat_kick', 'moderator'),
       (15, 'chat_ban', 'moderator'),
       (16, 'game_kick', 'moderator'),
       (17, 'game_ban', 'moderator'),
       (18, 'read_database', 'moderator'),
       (19, 'write_database', 'moderator');
