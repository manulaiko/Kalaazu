-- Initial dump for the `techfactory_items` table.

INSERT INTO `techfactory_items` (`id`, `name`, `description`, `effect`, `duration`, `cooldown`, `time`,
                                 `instant_production`, `free_production`)
VALUES (1, 'Energy leech',
        'The energy leech transforms 10% of the laser damage you cause into HP and transfers it back to your ship.',
        'Transforms 10% of laser damage into HP and transfers it back to your ship', 900, 900, 43200, 3125, 6500),
       (2, 'Chain impulse',
        'An energy pulse which locks onto one target and then onto up to seven other enemies, thereby causing a chain reaction of shield damage to each and every one.',
        'Can inflict up to 10,000 damage on a maximum of 7 targets', 0, 60, 21600, 900, 1800),
       (3, 'Precision targeter',
        'The precision targeter is a highly accurate targeting system that increases the hit ratio of normal rockets by 100% for a certain time.',
        '100% hit ratio', 900, 300, 7200, 250, 500),
       (4, 'Backup shields', 'The backup shields will bring your ship''s shields back up immediately.',
        '75,000 shield strength', 0, 120, 43200, 1400, 2800),
       (5, 'Battle repair bot',
        'When the battle repair bot is activated, it repairs 10,000 HP per second. It can be used even in the toughest battle situations.',
        '10,000 HP', 10, 120, 43200, 1400, 2800);
