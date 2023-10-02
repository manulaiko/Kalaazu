-- Initial dump for the `factions` table.
--
INSERT INTO `factions` (`id`, `name`, `tag`, `is_public`, `description`, `low_maps_id`, `low_maps_position`,
                        `high_maps_id`, `high_maps_position`)
VALUES (1, 'Mars Mining Operations', 'mmo', 1,
        'I''m not going to blow smoke up your tush, so I''ll just get straight to the point. We at Mars Mining Operations want you for two reasons: to mine ore and to eradicate all alien scum infecting our galactic sector. Do this successfully and you''ll soon be popping rival pilots for thrills and honor!',
        1, '1000,1000', 20, '1000,6000'),
       (2, 'Earth Industries Corporations', 'eic', 1,
        'Pilot, these are trying times during which only those made of the purest inner steel can prevail! How tough is your mettle? We reward loyalty and impeccable manners with the best lasers Uridium can buy. Join us in the fight to cleanse our sector of all those cretins that stand in our way. For glory and privilege!',
        5, '19000,1000', 24, '10700,1000'),
       (3, 'Venus Resources Unlimited', 'vru', 1,
        'We pride ourselves in our ability to push the envelope of technological advancement, while retaining a communal atmosphere. Some call us a cult desiring galactic domination, but they simply misunderstand our brilliant recruitment methods. We are always looking for talented pilots to help us destroy our enemies and shape humanity''s future!',
        9, '19000,1300', 28, '19000,6000'),
       (4, 'Admins and Mods', 'aam', 0, 'Secret faction for Admins and Mods >:)', 92, '10700,6000', 92, '10700,6000');
