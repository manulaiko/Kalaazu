-- Initial dump for the `items` table.
--

INSERT INTO `items` (`id`, `name`, `category`, `description`, `price`, `type`, `is_elite`, `is_event`, `is_buyable`,
                     `bonus`)
VALUES (1, 'Credits', 0, 'Credits item.', 0, 1, 1, 0, 0, 0),
       (2, 'Uridium', 0, 'Uridium item.', 0, 1, 1, 0, 0, 0),
       (3, 'Jackpot', 0, 'Jackpot item.', 0, 1, 1, 0, 0, 0),
       (4, 'Experience', 0, 'Experience item.', 0, 1, 1, 0, 0, 0),
       (5, 'Honor', 0, 'Honor item.', 0, 1, 1, 0, 0, 0),
       (6, 'Jump Voucher', 0, 'Jump voucher item.', 0, 2, 0, 0, 0, 0),
       (7, 'Repair Voucher', 0, 'Repair voucher item.', 0, 2, 0, 0, 0, 0),
       (8, 'GalaxyGate Voucher', 0, 'GalaxyGate voucher item.', 0, 2, 0, 0, 0, 0),
       (9, 'Phoenix', 1,
        'Phoenix\n\nAll your ships sold off or in hock? Don\'t worry - your Company won\'t leave you in the lurch!\nThis free beater will let you rise like a phoenix from the ashes of your gambling problem and/or lack of foresight, and will ferry you around until you can afford something better.',
        0, 30, 0, 0, 1, 0),
       (10, 'Yamato', 1,
        'Yamato\n\nAvailable from special events! Updated, tweaked, and fully upgraded, the classic Yamato is back in business. You can strut your stuff in her, too - you\'ll find a [travel mode capacity] under her hood,
        which will give you a temporary speed boost.',
        0, 30, 0, 0, 1, 0),
       (11, 'Defcom', 1,
        'Defcom\n\nAvailable from special events! An old-timer spaceship with real vintage style!\nThe Defcom is currently enjoying an impressive revival, and
        its newest iteration features a cloaking device hidden behind those gorgeous hot - rod lines.No classic ship
        collection is complete without her ! ',
        0, 30, 0, 0, 1, 0),
       (12, ' Liberator ', 1,
        ' Liberator\n\nYou never forget your first...! No matter whose logo you display, the Liberator is the proven workhorse that shuttled you safely through your first dogfights. This nostalgic little trip down Memory Lane rounds out any collection.',
        40000, 30, 0, 0, 1, 0),
       (13, 'Leonov', 1,
        ' Leonov\n\nThe Leonov is worth every scrap of Uridium asked for her. Versatile, agile, and with an unbeatable
        home advantage : more cargo space and more speed when you\'re in your Company\' s sectors ! Your Company has
        your back - and now, you can return the favor!',
        15000, 30, 1, 0, 1, 0),
       (14, 'Piranha', 1,
        'Piranha\n\nThis ship is a fitting reward for the insanely tough training that Elite pilots survive. Like her namesake,
        she\'s a fast, agile hunter with sharp teeth - only pilots who have proven their worth in the heat of battle can control her!',
        100000, 30, 0, 0, 1, 0),
       (15, 'Nostromo', 1,
        'Nostromo\n\nThe Nostromo is one of the best ships that Credits can buy. You can even arm her with successively more powerful modifying designs thanks to Lunar Industries\' innovative \"Invite-a-Friend\" bonus program! Easy as pie.',
        195000, 30, 0, 0, 1, 0),
       (16, 'Vengeance', 1, 'Vengeance\n\nThe best Star Hunter: you\'ll have (almost) nothing to fear in this ship!',
        30000, 30, 1, 0, 1, 0),
       (17, 'BigBoy', 1,
        'BigBoy\n\nNo fleet worth its salt would dream of trying to do without this ship! It may not be the fastest thing in orbit,
        but it boasts the most cargo space of any ship available for Credits. That\'s true utility!',
        285000, 30, 1, 0, 1, 0),
       (18, 'Goliath', 1, 'Goliath\n\nThe ultimate battlecruiser: hot-shot pilots accept no substitutes!', 80000, 30, 1,
        0, 1, 0),
       (19, 'Sepearhead', 1,
        'Spearhead\n\nAn agile reconnaissance ship, ideal for the ruthless, cold-blooded lone wolf. Spearheads can penetrate unseen deep into enemy territory as scouts, disable enemy ships\' skills, or
        even mark them for her allies.',
        45000, 30, 1, 0, 1, 0),
       (20, ' Aegis ', 1,
        ' Aegis\n\nThe Aegis tips the scales one way or the other in every battle she\'s flown in. This versatile engineering ship\'
        s support and repair abilities have often made the difference between defeat and victory - so make sure she\'s on your side!',
        250000, 30, 1, 0, 1, 0),
       (21, 'Citadel', 1,
        'Citadel\n\nA Citadel is often affectionately called a \"Clank Tank\" - or just The Tank - by her crew. She\'s a hulking Heavy Cruiser with two rocket main slots and various abilities that make her a mobile shield for her allies. Now this bulwark among spaceships can be yours!',
        300000, 30, 1, 0, 1, 0),
       (22, 'Aegis Superelite', 1,
        'Aegis Elite\n\nLoyal, trustworthy,
        tough - no pilot could wish for a better support system ! This ship has the following abilities: 5% extra damage,
        50% longer-lasting repairbots, 20% faster shield repair, and 10 % faster HP repair.',
        300000, 3, 1, 0, 1, 0),
       (23, ' Aegis Elite ', 1,
        ' Aegis Veteran\n\nBe the shield your allies deserve : the A - Veteran is a beautifully designed support ship,
        ready to prove her worth in any battle! This ship has the following abilities: 5% bonus to experience and honor points.',
        300000, 3, 1, 0, 1, 0),
       (24, 'Citadel Superelite', 1,
        'Citadel Elite\n\nThis flying fortress will teach your enemies the true meaning of fear! This ship has the following abilities: 5% extra damage,
        50% increased durations of the Protection and Draw Fire abilities, 25% shorter Fortify ability, and 15 % shorter
        Travel ability.',
        300000, 4, 1, 0, 1, 0),
       (25, ' Citadel Elite ', 1,
        ' Citadel Veteran\n\nThe uncompromising battlecruiser in which to gain the respect of your allies and sow
        discord among your enemies ! This ship has the following abilities : 5 % bonus to experience and honor points.',
        300000, 4, 1, 0, 1, 0),
       (26, ' Sepearhead Superelite ', 1,
        ' Spearhead Elite\n\nDo you want a Recon Ship that will meet your exacting standards ? The Spearhead Elite is as
        menacing as it is effective.This ship has the following abilities : 5 % extra damage,
        50% increased durations of the Ultimate Cloak and Recon abilities, 25% shorter Target Marker ability, and 15 %
        longer cooldown of the JAMX ability.',
        45000, 5, 1, 0, 1, 0),
       (27, ' Sepearhead Elite ', 1,
        ' Spearhead Veteran\n\nA sophisticated Recon Ship for refined pilots.Your enemies won\'t see you until it\' s
        too late ! This ship has the following abilities : 5 % bonus to experience and honor points.',
        45000, 5, 1, 0, 1, 0),
       (28, ' Bastion ', 1,
        ' Goliath Bastion\n\nThis battlecruiser makes itself indispensable in any battle, big or
                                                                                          small.Even the fiercest alien threats won\'t find you to be easy game when you go up against them in your Bastion. This ship has the following abilities: 10% extra shield power.',
        80000, 6, 1, 0, 1, 0),
       (29, 'Enforcer', 1,
        'Goliath Enforcer\n\nNo clan can afford not to have this massive ship within its fleet! The brute force of the G-Enforcer sets a new bar for deep-space warfare, and will be the backbone of any raiding party. This ship has the following abilities: 5% extra damage.',
        80000, 6, 1, 0, 1, 0),
       (30, 'Centaur', 1, 'No description available.', 80000, 6, 1, 0, 1, 0),
       (31, 'Saturn', 1, 'No description available.', 80000, 6, 1, 0, 1, 0),
       (32, 'Veteran', 1,
        'Goliath Veteran\n\nSleek, glossy, and with every detail crafted to the highest standard, this combat vessel is as luxurious and precious as ivory! This ship has the following abilities: 10% bonus to experience.',
        80000, 6, 1, 0, 1, 0),
       (33, 'Exalted', 1,
        'Goliath Exalted\n\nRed as heart\'s blood,
        this battlecruiser may well have been assembled by the devil\'s own shipwright. This is no vessel for a shy pilot! This ship has the following abilities: 10% bonus to honor points.',
        80000, 6, 1, 0, 1, 0),
       (34, 'Solace', 1,
        ' Solace\n\nIn space, no-one can hear you scream... but you can come to the rescue! In the Solace, you\'re an oasis and beacon for your allies in a dark,
        hostile desert. This ship has the following abilities: 10% extra shield power, and the Nano - Cluster Repairer
        ability, which immediately repairs the hulls of your ship and your group members\' ships!',
        80000, 6, 1, 0, 1, 0),
       (35, 'Venom', 1,
        'Venom\n\nA leviathan amongst battlecruisers! Sting your foes with its deadly poison and then step back and let the venom do the rest! This ship has the following abilities: 5% extra damage, and the Singularity ability, which will paralyze enemy ships and cause them substantial damage over time!',
        80000, 6, 1, 0, 1, 0),
       (36, 'Spectrum', 1,
        'Spectrum\n\nThe Spectrum is a kaleidoscope of color to blind your foes. Laser beams roll off of this polished battlecruiser\'s hull like water off a duck\'s back! This ship has the following abilities: 10% extra shield power, and the Prismatic Shielding ability, which will render enemy laser attacks almost useless, though it also temporarily weakens your own lasers.',
        80000, 6, 1, 0, 1, 0),
       (37, 'Sentinel', 1,
        'Sentinel\n\nThe Sentinel awes with its futuristic design and robust shields. Fly wing-to-wing with other Sentinels to create an impenetrable shield wall! This ship has the following abilities: 10% extra shield power, and the Fortress ability, which massively increases your shielding for a brief time.',
        80000, 6, 1, 0, 1, 0),
       (38, 'Diminisher', 1,
        'Diminisher\n\nThe battlecruiser of choice for cunning pilots: first, weaken enemy shields, then let loose with a vicious salvo. This ship has the following abilities: 5% extra damage, and the Weaken Shields ability.',
        80000, 6, 1, 0, 1, 0),
       (39, 'Kick', 1,
        'Kick\n\nKick design for the Goliath with a 10% shield bonus. Soccer crazy? Then act now and show off your passion for the beautiful game! In comparison to the Bastion, Sentinel, Solace, and Spectrum, the Kick is only comparable to the Bastion since all other designs are skill designs.',
        80000, 6, 1, 0, 1, 0),
       (40, 'Goal', 1,
        'Goal\n\nGoal design for the Goliath with 10% XP bonus. Soccer crazy? Then act now and bring soccer to space. In comparison to the Veteran, the Goal is its equal, but much harder to get.',
        80000, 6, 1, 0, 1, 0),
       (41, 'Referee', 1,
        'Referee\n\nReferee design for the Goliath. Exude authority with this design and increase your damage by 5%. In comparison to the Enforcer, Venom, and Diminisher, the Referee is only comparable to the Enforcer since all the other designs are Skill Designs.',
        80000, 6, 1, 0, 1, 0),
       (42, 'Soverign', 1, 'No description available.', 80000, 6, 1, 0, 1, 0),
       (43, 'Peacemaker', 1, 'No description available.', 80000, 6, 1, 0, 1, 0),
       (44, 'Vanquisher', 1,
        'Vanquisher\n\nA special, limited edition Goliath, the Vanquisher design is only available to pilots who are truly loyal to MMO. It will not only provide a 5% bonus to all Influence earned for MMO, but will also grant a 7% damage bonus against rival human pilots.',
        80000, 6, 1, 0, 1, 0),
       (45, 'Ignite', 1, 'No description available.', 80000, 6, 1, 0, 1, 0),
       (46, 'Surgeon', 1, 'No description available.', 80000, 6, 1, 0, 1, 0),
       (47, 'Adept', 1,
        'Vengeance Adept\n\nClothes make the man - and the same holds true for the ship and the pilot! A valuable vessel that\'s just the ticket for any pilot worth their salt,
        this ship has the following abilities: 10% bonus to experience.',
        80000, 7, 1, 0, 1, 0),
       (48, 'Lightning', 1,
        'Vengeance Lightning\n\nStrike out of a clear blue sky - or the deep black cold of space - and give your enemies an electrifying reception in the Lightning! This ship has the following abilities: 5% extra damage, and
        the Afterburner ability, which will boost your ship\'s speed by 30% for 5 seconds!',
        80000, 7, 1, 0, 1, 0),
       (49, 'Corsair', 1,
        ' Vengeance Corsair\n\nHonor to whom honor is due: the cool V-Corsair is the starfighter of choice for intergalactic exploits of all kinds! This ship has the following abilities: 10% bonus to honor points.',
        80000, 7, 1, 0, 1, 0),
       (50, 'Pusat', 1,
        'Pusat\n\nDeveloped by the brilliant minds on Yeni\'turkiye Station,
        the Pusat Vengeance design features a rich arsenal of lasers and generators for delicious,
        hard - hitting firepower, at the expense of armour.Strike hard and fast when you\'re at its helm.',
        80000, 7, 1, 0, 1, 0),
       (51, 'Revenge', 1,
        'Vengeance Revenge\n\nThe V-Revenge is best used to deliver the coup de grace that ends a fierce battle, with K.O. power ideal for dealing with dangerous aliens and enemy Clans alike. This ship has the following abilities: 5% extra damage.',
        80000, 7, 1, 0, 1, 0),
       (52, 'Avenger', 1,
        'Vengeance Avenger\n\nThe Avenger is a starfighter that\'s the complete package, making you a tough nut to crack for enemy pilots and fearsome aliens alike! This ship has the following abilities: 10% extra shield power.',
        80000, 7, 1, 0, 1, 0),
       (53, 'Police', 1, 'No description available.', 0, 30, 0, 0, 1, 0),
       (54, 'FWX-L', 2, 'No description available.', 25, 8, 1, 0, 1, 0),
       (55, 'FWX-M', 2, 'No description available.', 10, 8, 1, 0, 1, 0),
       (56, 'FWX-S', 2, 'No description available.', 250, 8, 0, 0, 1, 0),
       (57, 'CBO-100', 2,
        'CBO-100\n\nCombo 100 is a rare ammunition that inflicts the damage of the MCB-50 ammo along with half of the SAB-50 ammo\'s Shield Leech effect.',
        5, 9, 1, 1, 1, 0),
       (58, 'JOB-100', 2,
        'JOB-100\n\nDie Jack-O-Battery is a rare Halloween Ammo that causes 3.5 times the damage to NPCs and twice the damage to other players.',
        10, 9, 1, 1, 1, 0),
       (59, 'LCB-10', 2, 'LCB-10\n\nLow efficiency for a low price.', 10, 9, 0, 0, 1, 1),
       (60, 'MCB-25', 2, 'MCB-25\n\nMore bang for your buck: x2 laser damage per round.', 0, 9, 1, 0, 1, 2),
       (61, 'MCB-50', 2, 'MCB-50\n\nThe best standard laser ammo: x3 laser damage per round.', 1, 9, 1, 0, 1, 3),
       (62, 'RSB-75', 2,
        'RSB-75\n\nOne type of ammo you just can\'t do without: Rain death on your enemies when you fire off a rapid laser salvo.',
        5, 9, 1, 0, 1, 6),
       (63, 'SAB-50', 2,
        'SAB-50\n\nSpecial ammunition that reinforces your Shield, strengthening it by tapping into enemy shields (Shield Leech).',
        1, 9, 1, 0, 1, 2),
       (64, 'UCB-100', 2, 'No description available.', 3, 9, 1, 0, 1, 4),
       (65, 'ACM-01', 2, 'ACM-1\n\nProximity mine: 20% damage upon detonation.', 100, 10, 1, 0, 1, 20),
       (66, 'DDM-01', 2,
        'Direct-damage mine\n\nProximity mine:\n20% direct damage calculated from ship\'s base HP and pilot-bio upgrades - powerful enough to destroy enemy ships entirely!',
        250, 10, 1, 1, 1, 20),
       (67, 'EMPM-01', 2, 'Anti-cloaking mine\n\nProximity mine: 100% uncloaking upon detonation', 250, 10, 1, 1, 1, 0),
       (68, 'SABM-01', 2,
        'Anti-shield mine\n\nProximity mine:\n50% shield damage upon detonation; combinable with other mine types.',
        250, 10, 1, 1, 1, 50),
       (69, 'RB-02', 2, 'No description available.', 1500, 10, 0, 0, 1, 0),
       (70, 'RB-E01', 2, 'No description available.', 300, 10, 1, 0, 1, 0),
       (71, 'RB-E02', 2, 'No description available.', 2000, 10, 0, 0, 1, 0),
       (72, 'SL-01', 2,
        'Slowdown Mine\n\nSlows your opponent for 5 seconds by 50%. Furthermore, it takes effect in just 1 second.',
        250, 10, 1, 1, 1, 50),
       (73, 'SLM-01', 2,
        'Slowdown Mine\n\nSlows your opponent for 5 seconds by 50%. Furthermore, it takes effect in just 1 second.',
        250, 10, 1, 1, 1, 50),
       (74, 'BDR-1212', 2, 'No description available.', 100, 11, 1, 1, 1, 0),
       (75, 'CBR-100', 2,
        'CBR Rocket\n\nThe combo rocket will help you make a name for yourself. A combination of high damage infliction and Shield Leech is a one-two punch your enemies won\'t soon forget.',
        30, 11, 1, 1, 1, 0),
       (76, 'ECO-10', 2,
        'ECO-10 rocket\n\nThe multi-angle damage rocket for smart spenders. Your toughest enemies won\'t stand a chance against the many broadsides of the ECO Hellstorm.',
        1500, 11, 0, 0, 1, 2000),
       (77, 'HSTRM-01', 2,
        'Hellstorm\n\nDouble the rockets, double the trouble!\nUpon being fired from the rocket main, these rockets will rapidly descend upon your enemy and scorch their target with a near apocalyptic explosion. Fired off in a broadside, they will cause even more damage, hitting an enemy ship from multiple sides to weaken its hull structure..',
        25, 11, 1, 1, 1, 3000),
       (78, 'SAR-01', 2,
        'SAR-01 rocket\n\nThe Hellstorm SAR-01, a Shield Leeching rocket, is fired from a rocket main. An especially good quick-strike weapon!',
        2000, 11, 0, 0, 1, 1000),
       (79, 'SAR-02', 2,
        'SAR-02 rocket\n\nThe Hellstorm SAR-02, a Shield Leeching rocket, is fired from a rocket main. An especially good quick-strike weapon!',
        10, 11, 1, 1, 1, 2000),
       (80, 'SHG-01', 2, 'No description available.', 2000, 11, 0, 0, 1, 0),
       (81, 'SHG-02', 2, 'No description available.', 25, 11, 1, 1, 1, 0),
       (82, 'UBR-100', 2,
        'Uber\n\nYour rocket main will fire salvos of UBR-100 rockets. Their optimized warheads are at least 80% more effective against aliens, and they also utilize the multi-angle damage feature of conventional Hellstorm rockets.',
        30, 11, 1, 1, 1, 5000),
       (83, 'BDR-1211', 2,
        'Birthday Rocket\n\nCause extensive damage to aliens of max. 7,500 per shot! On other pilot\'s ships,
        they only cause a max. 4, 000 damage per hit.',
        10, 12, 1, 1, 1, 6000),
       (84, 'PLT-2021', 2, 'PLT-2021\n\nLong-range rocket: causes up to 4, 000 points per rocket fired.', 5, 12, 1, 0, 1,
        4000),
       (85, 'PLT-2026', 2, 'PLT-2026\n\nMid-range rocket: causes up to 2, 000 damage points per rocket fired.', 500, 12,
        0, 0, 1, 2000),
       (86, 'PLT-3030', 2,
        'PLT-3030\n\nEach rocket inflicts a max. of 6, 000 HP of damage,
        but has a lower accuracy rate due to its impressive firepower.\nAn exceptional weapon when used in combination with the Tech Center\'s precision targeter.',
        7, 12, 1, 0, 1, 6000),
       (87, 'R-310', 2, 'R310\n\nShort-range rocket: causes up to 1,000 damage points per rocket fired.', 100, 12, 0, 0,
        1, 1000),
       (88, 'DCR-250', 2,
        'Deceleration rockets\n\nHit your opponent with a deceleration rocket to slow them down by 30% for 5 seconds.',
        250, 13, 1, 1, 1, 30),
       (89, 'EMP-01', 2,
        'EMP burst\n\nThe EMP burst will release an electromagnetic impulse wave to temporarily short-circuit your enemies\' onboard instruments and disable their targeting devices. If you\'re really lucky, the burst will also uncloak them, allowing you to shoot them out of the sky like birds.',
        500, 13, 1, 1, 1, 0),
       (90, 'PLD-8', 2, 'PLD-8\n\nThis plasma charger causes a 40% reduction of your target\'s accuracy for 5 seconds.',
        100, 13, 1, 1, 1, 40),
       (91, 'WIZ-X', 2, 'No description available.', 100, 13, 1, 1, 1, 0),
       (92, 'CD-B01', 3,
        'Cooldown Booster\n\n20% quicker cooldown times for all ship skills. Booster is active for 10 hours of game time after purchase.',
        10000, 0, 1, 1, 1, 20),
       (93, 'CD-B02', 3,
        'Cooldown Booster\n\n30% quicker cooldown times for all ship skills. Booster is active for 10 hours of game time after purchase.\n\nBooster is active for 10 hours from the time of purchase. It has a 50% maximum boost level.',
        10000, 0, 1, 0, 1, 30),
       (94, 'DMG-B01', 3,
        'Damage booster\n\n+10% damage for all damage inflicted. Booster is active for 10 hours from the time of purchase.',
        10000, 0, 1, 0, 1, 10),
       (95, 'DMG-B02', 3,
        'Shared damage booster\n\n\n\n+10% damage for damage inflicted. 5% of bonus damage can be shared with friendly ships nearby\n\nBooster is active for 10 hours from the time of purchase. It has a 50% maximum boost level.',
        10000, 0, 1, 1, 1, 10),
       (96, 'EP-B01', 3,
        'Experience booster\n\nGives you a 10% EP bonus. Booster is active for 10 hours from the time of purchase.',
        10000, 0, 1, 0, 1, 10),
       (97, 'EP-B02', 3,
        'Shared EP Booster\n\n+10% EP;
5% of this EP bonus can be shared with friendly ships nearby
\n
\nBooster is active for 10 hours from the time of purchase. It has a 50% maximum boost level.',
        10000, 0, 1, 1, 1, 10),
       (98, 'HON-B01', 3, 'Honor booster
\n
\n+10% honor; This
booster is active for 10 hours from the time of purchase.',
        10000, 0, 1, 0, 1, 10),
       (99, 'HON-B02', 3,
        'Shared honor booster
\n
\nGrants a +10% bonus to earning Honor Points, and 5% of that bonus is applied to friendly ships nearby.
\n
\nBooster is active for 10 hours from the time of purchase. It has a 50% maximum boost level.',
        10000, 0, 1, 1, 1, 10),
       (100, 'HP-B01', 3,
        'Hit point booster
\n
\n+10% ship HP; This
booster is active for 10 hours from the time of purchase.', 10000, 0,
        1, 0, 1, 10),
       (101, 'HP-B02', 3,
        'Shared hit points booster
\n
\nIncreases ship
\'s maximum HP by 10% and allows you to share 5% of this bonus with friendly ships nearby\n\nBooster is active for 10 hours from the time of purchase. It has a 50% maximum boost level.',
        10000, 0, 1, 1, 1, 10),
       (102, 'REP-B01', 3,
        'Repair booster\n\n+10% faster ship repairs; This booster is active for 10 hours from the time of purchase.',
        10000, 0, 1, 0, 1, 10),
       (103, 'REP-B02', 3,
        'Shared repair booster\n\n+10% repair speed; 5% of this bonus can be shared with friendly ships nearby\n\nBooster is active for 10 hours from the time of purchase. It has a 50% maximum boost level.',
        10000, 0, 1, 1, 1, 10),
       (104, 'RES-B01', 3,
        'Resource booster\n\nThe resource booster increases the number of resources from collected NPC cargo boxes by 25%. Booster is active for 10 hours from the time of purchase.',
        10000, 0, 1, 0, 1, 25),
       (105, 'RES-B02', 3,
        'Shared resource booster\n\nThe resource booster increases the number of resources from collected NPC cargo boxes by 25% and provides a 10 % of this bonus for friendly ships in the vicinity.\n\nBooster is active for 10 hours from the time of purchase. It has a 100% maximum boost level.',
        10000, 0, 1, 1, 1, 25),
       (106, 'SHD-B01', 3,
        'Shield booster\n\n+25% shield power; This booster is active for 10 hours from the time of purchase.', 10000, 0,
        1, 0, 1, 25),
       (107, 'SHD-B02', 3,
        'Shared shield power booster\n\nIncreases ship\'s maximum shield power by 25% and allows you to share 10% of this bonus with friendly ships nearby.
\n
\nBooster is active for 10 hours from the time of purchase. It has a 100% maximum boost level.',
        10000, 0, 1, 1, 1, 25),
       (108, 'SREG-B01', 3,
        'Shield recharger booster
\n
\n+25% shield regeneration speed; This booster is active for 10 hours from the time of purchase.',
        10000, 0, 1, 0, 1, 25),
       (109, 'SG3N-A01', 4, 'SG3N-A01 shield
\n
\n1,000 shield strength / 40% less damage.', 8000, 14, 0, 0, 1, 1000),
       (110, 'SG3N-A02', 4, 'SG3N-A02 shield
\n
\n2,000 shield strength / 50% less damage.', 16000, 14, 0, 0, 1, 2000),
       (111, 'SG3N-A03', 4, 'SG3N-A03 shield
\n
\n5,000 shield strength / 60% less damage.', 256000, 14, 0, 0, 1, 5000),
       (112, 'SG3N-B01', 4, 'SG3N-B01 shield
\n
\n4,000 shield strength / 70% less damage.', 2500, 14, 1, 0, 1, 4000),
       (113, 'SG3N-B02', 4, 'SG3N-B02 shield
\n
\n10,000 shield strength / 80% less damage.', 10000, 14, 1, 0, 1, 10000),
       (114, 'G3N-1010
', 4, 'G3N-1010 speed generator
\n
\nIncreases ship speed by 2.
', 2000, 15, 0, 0, 1, 2),
       (115, 'G3N-2010
', 4, 'G3N-2010 speed generator
\n
\nIncreases ship speed by 3.
', 4000, 15, 0, 0, 1, 3),
       (116, 'G3N-3210
', 4, 'G3N-3210 speed generator
\n
\nIncreases ship speed by 4.
', 8000, 15, 0, 0, 1, 4),
       (117, 'G3N-3310
', 4, 'G3N-3310 speed generator
\n
\nIncreases ship speed by 5.
', 16000, 15, 0, 0, 1, 5),
       (118, 'G3N-6900
', 4, 'G3N-6900 speed generator
\n
\nIncreases ship speed by 7.
', 1000, 15, 1, 0, 1, 7),
       (119, 'G3N-7900
', 4, 'G3N-7900 speed generator
\n
\nIncreases ship speed by 10.
', 2000, 15, 1, 0, 1, 10),
       (120, 'MP-1
', 4, 'MP-1
\n
\nAverage laser: causes up to 60 damage points per round.', 0, 16, 0, 0, 1, 60),
       (121, 'LF-1
', 4, 'LF-1
\n
\nSmall laser: causes up to 40 damage points per round.', 0, 16, 0, 0, 1, 40),
       (122, 'LF-2
', 4, 'LF-2
\n
\nStrong laser: causes up to 100 damage points per round.', 0, 16, 0, 0, 1, 100),
       (123, 'LF-3
', 4, 'LF-3
\n
\nMuch stronger laser: Causes up to 150 damage points per round.', 0, 16, 0, 0, 1, 150),
       (124, 'LF-4
', 4, 'LF-4
\n
\nMuch much stronger laser: Causes up to 200 damage points per round.', 0, 16, 0, 0, 1,
        200),
       (125, 'HST-1
', 4,
        'Hellstorm main 1
\n
\nThe rapid reloader!
\nThis rocket main makes it possible to win a battle before it
‘s even begun. One little rocket makes a world of difference on the battlefield - firing up to 3 rockets, this rocket main unleashes a broadside of destruction, giving a whole new meaning to the word firepower. This highly sophisticated piece of weaponry can only be equipped with specially designed rockets.',
        0, 17, 0, 0, 1, 0),
       (126, 'HST-2
', 4,
        'Hellstorm main 2
\n
\nThe rapid reloader!
\nThis upgraded version of the Hellstorm main 1 makes it possible to win the battle before it
‘s even begun. One little rocket makes a world of difference on the battlefield - firing up to 5 rockets, this rocket main unleashes a broadside of destruction, giving a whole new meaning to the word firepower. This highly sophisticated piece of weaponry can only be equipped with specially designed rockets.',
        0, 17, 0, 0, 1, 0),
       (127, 'HMD-07
', 4,
        'HM7 trade drone
\n
\nWith the HM7 trade drone, you can sell your ore no matter what orbit you
\'re in. Why waste time going back to the space station?\nValid for 100 transactions.\n\nYou already have an active trade drone. If you buy this trade drone now, you\'ll receive 100 more transactions.
\n
\nOnly one of these items is allowed per configuration.',
        10000, 18, 1, 0, 1, 0),
       (128, 'AIM-01
', 4,
        'Targeting Guidance CPU 1
\n
\n25% less chance that lasers will miss their target; 10 Xenomit used per volley
\n
\nClick on the CPUs button in the shortcut bar to activate targeting guidance. Only one targeting guidance CPU is allowed per configuration.
\n
\nOnly one of these items is allowed per configuration.',
        20000000, 19, 0, 0, 1, 25),
       (129, 'AIM-02
', 4,
        'Targeting Guidance CPU 2
\n
\n50% less chance that lasers will miss their target; 10 Xenomit used per volley
\n
\nClick on the CPUs button in the shortcut bar to activate targeting guidance. Only one targeting guidance CPU allowed per configuration.
\n
\nOnly one of these items is allowed per configuration.',
        200000, 19, 1, 0, 1, 50),
       (130, 'AJP-01
', 4,
        'Advanced Jump CPU 1
\n
\nAllows you to jump to any of the valid target maps. May not be used during battle.
\n
\nOnly one of these items is allowed per configuration.',
        75000, 19, 1, 0, 1, 0),
       (131, 'ALB-X', 4,
        'Ammunition CPU
\n
\nAutomatically buys 10,000 laser rounds if less than 1,000 rounds on board. Settings can be adjusted in Hanger/Manage.
\n
\nOnly one of these items is allowed per configuration.',
        15000, 19, 1, 0, 1, 0),
       (132, 'ANTI-Z1', 4,
        'Serum CPU
\n
\nThose who fight deadly diseases must be prepared! The Serum CPU will automatically cure you of any infections or parasites.
\n
\nOnly one of these items is allowed per configuration.',
        108, 19, 1, 0, 1, 0),
       (133, 'ANTI-Z1 XL', 4,
        'Serum CPU XL
\n
\nWith 10 doses, the Serum CPU XL is your strongest ally against parasites and infections. Cure yourself and other players - before it
\'s too late!\n\nOnly one of these items is allowed per configuration.',
        972, 19, 1, 0, 1, 0),
       (134, 'AROL-X', 4,
        'Auto Rocket CPU\n\nAutomatic rocket rapid-fire in laser attacks you start\n\nAfter installation is completed, the AROL-X CPU must be activated on the space map in \"CPUs\".\n\nOnly one of these items is allowed per configuration.',
        25000, 19, 1, 0, 1, 0),
       (135, 'CL04K-M', 4,
        'Cloaking CPU\n\n10 ship cloakings (active until your first attack)\n\nWARNING: Enemies can still see cloaked ships on the mini map.\n\nOnly one of these items is allowed per configuration.',
        5000, 19, 1, 0, 1, 10),
       (136, 'CL04K-XL', 4,
        'Cloaking CPU XL\n\nCloak your ship 50 times and stay invisible until you launch an attack yourself.\n\nWARNING: Enemies can still see cloaked ships on the mini map.\n\nOnly one of these items is allowed per configuration.',
        22500, 19, 1, 0, 1, 50),
       (137, 'CL04K-XS', 4,
        'Cloaking Device Type A\n\nShip stays cloaked until your first attack\n\nWARNING: Enemies can still see cloaked ships on the mini map.\n\nOnly one of these items is allowed per configuration.',
        500, 19, 1, 0, 1, 0),
       (138, 'DR-01', 4,
        'Drone Repair CPU 1\n\nThis CPU automatically repairs your drones when they sustain more than 70% damage upon ship destruction, as long as you have enough Uridium or Credits (depends on the drone type). Good for 8 repairs.\n\nOnly one of these items is allowed per configuration.',
        150000, 19, 0, 0, 1, 8),
       (139, 'DR-02', 4,
        'Drone Repair CPU 2\n\nThis CPU automatically repairs your drones when they have received the maximum damage upon ship destruction, as long as you have enough Uridium or Credits (depends on the drone type). Good for 32 repairs.\n\nOnly one of these items is allowed per configuration.',
        15000, 19, 1, 0, 1, 32),
       (140, 'FB-X', 4,
        'Automatic CPU Fuel Assistant\n\nAutomatically buys 10,000 units of P.E.T. fuel when your fuel reserves fall below 1000 units.\n\nOnly one of these items is allowed per configuration.',
        5000, 19, 1, 0, 1, 10000),
       (141, 'G3X-AMRY-L', 4, 'No description available.', 0, 19, 0, 0, 0, 0),
       (142, 'G3X-AMRY-M', 4, 'No description available.', 0, 19, 0, 0, 0, 0),
       (143, 'G3X-AMRY-S', 4, 'No description available.', 0, 19, 0, 0, 0, 0),
       (144, 'G3X-CARGO-X', 4,
        'Cargo bay expansion\n\nx2 cargo space thanks to molecular compression\n\nOnly one of these items is allowed per configuration.',
        10000, 19, 1, 0, 1, 2),
       (145, 'ISH-01', 4,
        'Insta-shield CPU\n\n3-second protection against enemies; 10 mines and 100 Xenomit used every time\n\nIt has the same cool-down time as mines.\n\nOnly one of these items is allowed per configuration.',
        50000, 19, 1, 0, 1, 0),
       (146, 'JP-01', 4,
        'Jump CPU 1\n\n10 jumps to X-1 home map. You may not jump from farther out than map X-4 and NOT from PvP maps (4-X). May not be used during battle.\n\nOnly one of these items is allowed per configuration.',
        150000, 19, 0, 0, 1, 10),
       (147, 'JP-02', 4,
        'Jump CPU 2\n\nJump to X-1 home map, works everywhere except the pirate sector. 20 total jumps. May not be used during battle.\n\nOnly one of these items is allowed per configuration.',
        15000, 19, 1, 0, 1, 20),
       (148, 'MIN-T01', 4,
        'Turbo Mine CPU 1\n\n25% less cool-down time for mines and items made from mines\n\nOnly one of these items is allowed per configuration.',
        5000000, 19, 0, 0, 1, 25),
       (149, 'MIN-T02', 4,
        'Turbo Mine CPU 2\n\n50% less cool-down time for mines and items made from mines\n\nOnly one of these items is allowed per configuration.',
        25000, 19, 1, 0, 1, 50),
       (150, 'NC-AGB-X', 4,
        'Generator Boost CPU\n\nAutomatically gives your generators a boost using the best resources available\n\nOnly one of these items is allowed per configuration.',
        15000, 19, 1, 0, 1, 0),
       (151, 'NC-AWB-X', 4,
        'Lab CPU\n\nBoosts rockets and lasers with raw materials currently in lab use\n\nOnly one of these items is allowed per configuration.',
        10000, 19, 1, 0, 1, 0),
       (152, 'NC-AWL-X', 4,
        'Lab CPU 3\n\nBoosts lasers with raw materials currently in lab use\n\nOnly one of these items is allowed per configuration.',
        150000, 19, 0, 0, 1, 0),
       (153, 'NC-AWR-X', 4,
        'Lab CPU 2\n\nBoosts rockets with raw materials currently in lab use\n\nOnly one of these items is allowed per configuration.',
        150000, 19, 0, 0, 1, 0),
       (154, 'NC-RRB-X', 4,
        'Repair-bot Auto CPU\n\nAuto-activates a repair robot available\n\nOnly one of these items is allowed per configuration.',
        10000, 19, 1, 0, 1, 0),
       (155, 'RB-X', 4,
        'Rocket CPU\n\nAutomatically buys 500 rockets of the selected rocket type when you have less than 100 left on board. To set the rocket type, click on Hangar/Manage.\n\nOnly one of these items is allowed per configuration.',
        15000, 19, 1, 0, 1, 500),
       (156, 'RD-X', 4,
        'Radar CPU\n\nDisplays diplomacy status on mini map\n\nOnly one of these items is allowed per configuration.',
        15000, 19, 1, 0, 1, 0),
       (157, 'RLLB-X', 4,
        'Rocket-main CPU\n\nThe rocket-main CPU automatically reloads your rocket main with a specified rocket type to rain fire on your enemies when you launch a laser attack.\n\nAfter installation is completed, the RL-LB1 CPU must be activated on the space map in \"CPUs\".\n\nOnly one of these items is allowed per configuration.',
        25000, 19, 1, 0, 1, 0),
       (158, 'ROK-T01', 4,
        'Rocket Turbo\n\nDoubles rocket firing speed\n\nOnly one of these items is allowed per configuration.', 10000,
        19, 1, 0, 1, 2),
       (159, 'SLE-01', 4,
        'Slot CPU 1\n\n+2 new slots for extras.\n\nOnly one of these items is allowed per configuration.', 600000, 19,
        1, 0, 1, 2),
       (160, 'SLE-02', 4,
        'Slot CPU 2\n\n+4 new slots for extras.\n\nOnly one of these items is allowed per configuration.', 75000, 19, 1,
        0, 1, 4),
       (161, 'SLE-03', 4,
        'Slot CPU 3\n\n+6 new slots for extras.\n\nOnly one of these items is allowed per configuration.', 150000, 19,
        1, 0, 1, 6),
       (162, 'SLE-04', 4,
        'Slot CPU 4\n\n+10 new slots for extras.\n\nOnly one of these items is allowed per configuration.', 250000, 19,
        1, 0, 1, 10),
       (163, 'SMB-01', 4,
        'Smart Bomb CPU\n\nInstant bomb made from 10 mines and 100 Xenomit; doesn\'t cause any damage to your ship.
\n
\nIt has the same cool-down time as mines.
\n
\nOnly one of these items is allowed per configuration.',
        50000, 19, 1, 0, 1, 0),
       (164, 'REP-1
', 4,
        'Repair Robot 1
\n
\nThis repair bot recovers your ship
\'s hull in 165 seconds.\n\nOnly one of these items is allowed per configuration.',
        10000, 20, 0, 0, 1, 165),
       (165, 'REP-2', 4,
        'Repair Robot 2\n\nThis repair bot recovers your ship\'s hull in 120 seconds.
\n
\nOnly one of these items is allowed per configuration.',
        64000, 20, 0, 0, 1, 120),
       (166, 'REP-3
', 4,
        'Repair Robot 3
\n
\nThis repair bot recovers your ship
\'s hull in 105 seconds.\n\nOnly one of these items is allowed per configuration.',
        5000, 20, 1, 0, 1, 105),
       (167, 'REP-4', 4,
        'Repair robot 4\n\nThis repair bot recovers your ship\'s hull in 90 seconds.
\n
\nOnly one of these items is allowed per configuration.',
        20000, 20, 1, 0, 1, 90),
       (168, 'BOOTY-KEY', 5, 'No description available.', 10000, 0, 1, 1, 1, 0),
       (169, 'BOOTY-KEY-BLUE', 5, 'No description available.', 10000, 0, 1, 1, 1, 0),
       (170, 'BOOTY-KEY-RED', 5, 'No description available.', 0, 0, 1, 1, 1, 0),
       (171, 'EXTRA-ENERGY', 5, 'No description available.', 10000, 0, 1, 1, 1, 0),
       (172, 'JUMP-VOUCHERS', 5, 'No description available.', 10000, 0, 1, 1, 1, 0),
       (173, 'LOGFILE', 5, 'No description available.', 10000, 0, 1, 1, 1, 0),
       (174, 'PET', 5, 'No description available.', 10000, 0, 1, 1, 1, 0),
       (175, 'PET-10
', 6, 'No description available.', 50000, 0, 1, 0, 1, 0),
       (176, 'G-HP1', 6, 'P.E.T. hull upgrade
\n
\nReinforces your P.E.T.
\'s hull and increases its HP', 5000, 0, 1, 0, 1,
        0),
       (177, 'Fuel 100', 6, 'P.E.T. fuel\n\nYour P.E.T. only runs when it\'s got fuel.', 1, 0, 1, 0, 1, 0),
       (178, 'CSR-02
', 6,
        'Combo Repair Gear (Level: 1)
\n
\nEffect: Repairs 10000 HP per second.
\nDuration: 5 seconds
\nDeflection chance: 65%
\nConsumption: 200 Fuel
\n
\nRepairs your ship during flight. Uses extra fuel for each repair.
\n
\nProtects your pet from attacks.',
        20000, 21, 1, 0, 1, 0),
       (179, 'CGM-02
', 6,
        'Combo Guard Mode Gear (Level: 1)
\n
\nDeflection chance: 65%
\nAdditional consumption: 35% Extra-Fuel
\n
\nConnects the Guard Mode to the new Insta Shield. Uses 35% more fuel when it
\'s been activated.\n\nGuard mode with an extra shield for the P.E.T.\n',
        20000, 21, 0, 0, 1, 0),
       (180, 'G-AL1', 6,
        'Auto-looter (Level: 1)\n\nRange: 700\n\nOnce you activate this P.E.T gear, it will automatically collect bonus boxes and cargo boxes within close range.\n\nYour P.E.T can only be attacked by other players while it is collecting loot. Aliens cannot attack it.',
        7500, 21, 1, 0, 1, 0),
       (181, 'G-AR1', 6,
        'Auto-resource collector (Level: 1)\n\nRange: 700\n\nOnce you activate this P.E.T. gear, your P.E.T will automatically collect resources within close range.\n\nYour P.E.T can only be attacked by other players while collecting loot. Aliens cannot attack it.\n',
        2500, 21, 1, 0, 1, 0),
       (182, 'G-EL1', 6,
        'Enemy locator (Level: 1)\n\nRange: 2000\n\nOutfit your P.E.T with this gear and it\'ll automatically pinpoint every alien in the current star system.',
        6000, 21, 1, 0, 1, 0),
       (183, 'G-RL1', 6,
        'Resource locator (Level: 1)
\n
\nRange: 2000
\n
\nWith this gear on board your P.E.T., it will be able to track down nearby resources in the current star system.',
        2500, 21, 1, 0, 1, 0),
       (184, 'G-TRA1', 6,
        'Cargo trader (Level: 1)
\n
\nTrade bonus: +5%
\n
\nThe cargo trader makes it possible for your P.E.T. to trade cargo from anywhere in the galaxy at anytime.',
        6000, 21, 1, 0, 1, 0),
       (185, 'G-REP1', 6,
        'P.E.T. repairer (Level: 1)
\n
\nEffect: Repairs 2000 HP per second.
\nDuration: 120 seconds
\n
\nThe P.E.T. repairer will fix your P.E.T.
\n
\nNot made for use in combat.
\n',
        2500, 21, 1, 0, 1, 0),
       (186, 'G-KK1', 6,
        'Kamikaze Detonator (Level: 1)
\n
\nEffect: Causes 25000 splash damage upon exploding.
\nRadius: 250
\n
\nWhen your P.E.T. or ship is close to being destroyed, the Kamikaze Detonator will start the self-destruct sequence and explode, thereby taking out all enemies in the immediate vicinity.
\n
\nAfter the detonator has gone off, your P.E.T. will be massively damaged and have to be repaired.',
        7500, 21, 1, 0, 1, 0),
       (187, 'AI-CR1', 6,
        'Cargo protocol (Level: 1)
\n
\nEffect: Increases the cargo space by 3%
\n
\nThe cargo protocol expands your cargo bay.',
        3000, 22, 1, 0, 1, 0),
       (188, 'AI-R1', 6,
        'Radar protocol (Level: 1)
\n
\nEffect: Increases your P.E.T. radar
\'s range by 2%\n\nThe radar protocol extends your P.E.T. radar\'s range. It will also increase the effectiveness of your P.E.T. collector and enemy locator gear.',
        3000, 22, 1, 0, 1, 0),
       (189, 'AI-S1', 6,
        'Salvage protocol (Level: 1)
\n
\nEffect: Increases the reward from boxes by 1%
\n
\nThe salvage protocol increases rewards for bonus and cargo boxes collected by your P.E.T.',
        5000, 22, 1, 0, 1, 0),
       (190, 'AI-SM1', 6,
        'Shield protocol (Level: 1)
\n
\nEffect: Increases the shield strength by 1%
\n
\nThe shield protocol boosts your P.E.T.
\'s shield power.',
        5000, 22, 1, 0, 1, 0),
       (191, 'AI-LM1', 6,
        'Laser Gun Protocol (Level: 1)\n\nEffect: Increases laser damage by 1%\n\nThe Laser Gun Protocol lets your P.E.T. cause more laser damage.',
        5000, 22, 1, 0, 1, 0),
       (192, 'AI-AIM1', 6,
        'Targeting protocol (Level: 1)\n\nEffect: Increases laser precision by 1%\n\nThe targeting protocol improves the accuracy of your P.E.T\'s lasers.',
        3000, 22, 1, 0, 1, 0),
       (193, 'AI-E1', 6,
        'Evasion protocol (Level: 1)
\n
\nEffect: Decreases enemy hit chances by 1%
\n
\nThe evasion protocol makes it harder for your enemies to destroy your P.E.T. Their chances of scoring a hit will be lower.',
        5000, 22, 1, 0, 1, 0),
       (194, 'AI-HP1', 6,
        'HP protocol (Level: 1)
\n
\nEffect: Increases the hit points by 1%
\n
\nThe HP protocol gives your P.E.T more HP.',
        5000, 22, 1, 0, 1, 0),
       (195, 'AI-AL1', 6,
        'Alien protocol (Level: 1)
\n
\nEffect: Increases damage to aliens by 1%
\n
\nThe alien protocol enables your P.E.T. to inflict more damage to aliens.',
        3000, 22, 1, 0, 1, 0),
       (196, 'AI-ECO1', 6,
        'Fuel protocol (Level: 1)
\n
\nEffect: Decreases fuel consumption by 1%
\n
\nWith the fuel protocol, your P.E.T. will use less fuel.',
        5000, 22, 1, 0, 1, 0),
       (197, 'Havoc', 7, 'No description available.', 50000, 23, 1, 1, 1, 0),
       (198, 'Hercules', 7, 'No description available.', 75000, 23, 1, 1, 1, 0),
       (199, 'Flax', 7, 'Flax
\n
\nStarter drone with one slot.', 100000, 0, 0, 0, 1, 0),
       (200, 'Iris', 7, 'Iris
\n
\nPower drone with two slots.', 15000, 0, 1, 0, 1, 0),
       (201, 'Apis', 7, 'Apis
\n
\nApis drone with two slots.', 1100000, 0, 1, 0, 1, 0),
       (202, 'Zeus', 7, 'Zeus
\n
\nZeus drone with two slots.', 1500000, 0, 1, 0, 1, 0),
       (203, 'F-01-TU', 7, '', 1000000, 24, 0, 0, 1, 0),
       (204, 'F-02-AR', 7, '', 1000000, 24, 0, 0, 1, 0),
       (205, 'F-03-LA', 7, 'No description available.', 100000, 24, 1, 0, 0, 0),
       (206, 'F-04-ST', 7,
        'Star Formation
\n
\nAugment your drone control unit with the Star Formation.
\n
\nIncreases rocket damage by 25%, but rocket main reload time increases by 33%, as well.
\n
\nAs long as you have 4 or more drones, you can use this formation any time after you
‘ve purchased it.',
        75000, 24, 1, 0, 1, 0),
       (207, 'F-05-PI', 7,
        'Pincer Formation
\n
\nAugment your drone control unit with the Pincer Formation.
\n
\nIncreases laser damage by 3% against other players and provides an additional 5% honor point bonus. However, it reduces shield penetration by 10%.
\n
\nAs long as you have 4 or more drones, you can use this formation any time after you
‘ve purchased it.',
        100000, 24, 1, 0, 1, 0),
       (208, 'F-06-DA', 7,
        'Double Arrow Formation
\n
\nAugment your drone control unit with the Double Arrow Formation.
\n
\nIncreases shield penetration by 10%, but reduces shield power by 20%.
\n
\nAs long as you have 4 or more drones, you can use this formation any time after you
‘ve purchased it.',
        75000, 24, 1, 0, 1, 0),
       (209, 'F-07-DI', 7,
        'Diamond Formation
\n
\nAugment your drone control unit with the Diamond Formation.
\n
\nYour shield regenerates 1% of your max shield power per second, up to a maximum of 5,000 per second. But hit points are reduced by 30%.
\n
\nAs long as you have 4 or more drones, you can use this formation any time after you
‘ve purchased it.',
        100000, 24, 1, 0, 1, 0),
       (210, 'F-08-CH', 7,
        'Chevron Formation
\n
\nAugment your drone control unit with the Chevron Formation.
\n
\nIncreases rocket damage by 50%, but reduces ship hit points by 20%.
\n
\nAs long as you have 4 or more drones, you can use this formation any time after you
‘ve purchased it.',
        75000, 24, 1, 0, 1, 0),
       (211, 'F-09-MO', 7,
        'Moth Formation
\n
\nAugment your drone control unit with the Moth Formation.
\n
\nIncreases shield penetration by 20%. Hit points are also increased by 20%. But it weakens your shield strength at a rate of 1% per second.
\n
\nAs long as you have 4 or more drones, you can use this formation any time after you
‘ve purchased it.',
        100000, 24, 1, 0, 1, 0),
       (212, 'F-10-CR', 7,
        'Crab Formation
\n
\nAugment your drone control unit with the Crab Formation.
\n
\nIncreases shield absorption by 20%, but reduces speed by 20%.
\n
\nAs long as you have 4 or more drones, you can use this formation any time after you
‘ve purchased it.',
        100000, 24, 1, 0, 1, 0),
       (213, 'F-11-HE', 7,
        'Heart Formation
\n
\nAugment your drone control unit with the Heart Formation.
\n
\nIncreases your shield power by 10% and your hit points by 20%. Laser damage is, however, reduced by 5%.
\n
\nAs long as you have 4 or more drones, you can use this formation any time after you
‘ve purchased it.',
        100000, 24, 1, 0, 1, 0),
       (214, 'F-12-BA', 7,
        'Barrage Formation
\n
\nAugment your drone control unit with the Barrage Formation.
\n
\nIncreases laser damage to NPCs by 5% and provides an additional 5% XP from NPC kills. Shield Leech will, however, be reduced by 15%.
\n
\nAs long as you have 4 or more drones, you can use this formation any time after you
‘ve purchased it.',
        100000, 24, 1, 0, 1, 0),
       (215, 'F-13-BT', 7,
        'Bat Formation
\n
\nAugment your drone control unit with the Bat Formation.
\n
\nIncrease damage to NPCs by 8% and earn 8% more XP; however, your speed will be reduced by 15%.
\n
\nAs long as you have 6 or more drones, you can use this formation any time after you
‘ve purchased it. This formation is not available all the time, so grab it while you can!',
        150000, 24, 1, 1, 1, 0),
       (216, 'F-14-RG', 7,
        'Ring Formation
\n
\nThis formation has a special look in the 3D client.
\n
\nAugment your drone control unit with the Ring Formation.
\n
\nShield points are increased by 120%; however, speed is reduced by 5%, laser damage is reduced by 25%, and cooldown times for rockets and rocket launchers are increased by 25%.
\n
\nAs long as you have 4 or more drones, you can use this formation any time after you
‘ve purchased it.',
        1500000, 24, 1, 0, 1, 0),
       (217, 'F-15-DL', 7,
        'Drill Formation
\n
\nThis formation has a special look in the 3D client.
\n
\nAugment your drone control unit with the Drill Formation.
\n
\nLaser damage is increased by 20%; however, shield points are reduced by 25%, shield spread by 5%, and speed by 5%.
\n
\nAs long as you have 4 or more drones, you can use this formation any time after you
‘ve purchased it.',
        150000, 24, 1, 0, 1, 0),
       (218, 'F-16-VT', 7,
        'Veteran Formation
\n
\nThis formation has a special look in the 3D client.
\n
\nAugment your drone control unit with the Veteran Formation.
\n
\nHonor is increased by 20%; however, laser damage, hit points, and shield points are all decreased by 20%.
\n
\nAs long as you have 4 or more drones, you can use this formation any time after you
‘ve purchased it.',
        150000, 24, 1, 0, 1, 0),
       (219, 'F-17-DM', 7,
        'Dome Formation
\n
\nThis formation has a special look in the 3D client.
\n
\nAugment your drone control unit with the Dome Formation.
\n
\nShield points are increased by 30% and regenerate by 0.5% per second. Cooldown times for rockets and rocket launchers are reduced by 25%; however, laser damage and speed are both reduced by 50%.
\n
\nAs long as you have 4 or more drones, you can use this formation any time after you
‘ve purchased it.',
        150000, 24, 1, 0, 1, 0),
       (220, 'F-18-DW', 7,
        'Wheel Formation
\n
\nThis formation has a special look in the 3D client.
\n
\nAugment your drone control unit with the Wheel Formation.
\n
\nSpeed is increased by 5%; however, laser damage is reduced by 20%, and this formation drains shields by 5% per second.
\n
\nAs long as you have 4 or more drones, you can use this formation any time after you
‘ve purchased it.',
        150000, 24, 1, 0, 1, 0),
       (221, 'F-19-X', 7,
        'X Formation
\n
\nThis formation has a special look in the 3D client.
\n
\nAugment your drone control unit with the X Formation.
\n
\n-100% honor rewarded
\n
\nYour lasers cause no damage to enemy players
\n
\n+5% Laser Damage against aliens
\n
\n+5% XP from aliens
\n
\n+8% HP
\n
\nAs long as you have 4 or more drones, you can use this formation any time after you
‘ve purchased it.',
        300000, 24, 0, 0, 1, 0),
       (222, 'F-20-WV', 7,
        'Wave Formation
\n
\nThis formation has a special look in the 3D client.
\n
\nJazz up your drones with the Wave Formation!
\n
\nDrones will make waves, but otherwise this formation grants neither benefits nor penalties.
\n
\nAs long as you have 4 or more drones, you can use this formation any time after you
‘ve purchased it.',
        4950000, 24, 0, 0, 1, 0),
       (223, 'Prismatic Socket', 8,
        'Prismatic Socket
\n
\nWith this prismatic socket, slack joints and jamming are a thing of the past! It
\'s also used to produce high-tech items in the Assembly.',
        20000, 29, 1, 0, 1, 0),
       (224, 'High-Frequency Cable', 8,
        'High-Frequency Cable\n\nThis nano-based high-frequency cable is essential for signaling and measurement, and is used to produce high-tech items in the Assembly.',
        5000, 29, 1, 0, 1, 0),
       (225, 'Hybrid Processor', 8,
        'Hybrid Processor\n\nEven the Kristallon have taken note of this small gadget\'s unique processing power. It
\'s used to produce high-tech items in the Assembly.',
        40000, 29, 1, 0, 1, 0),
       (226, 'Micro-transistors', 8,
        'Micro-transistors\n\nNo micro-transistors, no modern microelectronics! These small units are everywhere, and are used to produce high-tech items in the Assembly.',
        40000, 29, 1, 0, 1, 0),
       (227, 'Nano Condenser', 8,
        'Nano Condenser\n\nWith its unmatched memory capacities, the nano condenser is a must for every space ship. It\'s used to produce high-tech items in the Assembly.',
        20000, 29, 1, 0, 1, 0),
       (228, 'Nano Case', 8,
        'Nano Case
\n
\nIt may not look like much, but this nano case will protect your sensitive electronics, no matter what. It
\'s also used to produce high-tech items in the Assembly.',
        5000, 29, 1, 0, 1, 0),
       (229, 'LGF', 8, 'Log-disks\n\nLog-disks can be exchanged for pilot points.', 300, 0, 1, 0, 1, 0),
       (230, 'BK-100', 8,
        'Green Booty Key\n\nUsed to open pirate booty and collect the valuable treasure contained within.', 1500, 0, 1,
        0, 1, 0),
       (231, 'BK-101', 8, 'No description available.', 0, 0, 1, 0, 0, 0),
       (232, 'BK-102', 8, 'No description available.', 0, 0, 1, 0, 0, 0),
       (233, 'Lottery Euro', 8, 'No description available.', 0, 0, 1, 0, 0, 0),
       (234, 'Apis Part', 8, 'No description available.', 0, 25, 1, 0, 0, 0),
       (235, 'Zeus Part', 8, 'No description available.', 0, 25, 1, 0, 0, 0),
       (236, 'Prometium', 8, 'No description available.', 0, 26, 0, 0, 0, 0),
       (237, 'Endurium', 8, 'No description available.', 0, 26, 0, 0, 0, 0),
       (238, 'Terbium', 8, 'No description available.', 0, 26, 0, 0, 0, 0),
       (239, 'Prometid', 8, 'No description available.', 0, 26, 0, 0, 0, 0),
       (240, 'Duranium', 8, 'No description available.', 0, 26, 0, 0, 0, 0),
       (241, 'Xenomit', 8, 'No description available.', 0, 26, 0, 0, 0, 0),
       (242, 'Promerium', 8, 'No description available.', 0, 26, 0, 0, 0, 0),
       (243, 'Seprom', 8, 'No description available.', 0, 26, 0, 0, 0, 0),
       (244, 'Palladium', 8, 'No description available.', 0, 26, 0, 0, 0, 0),
       (245, 'A', 8, 'No description available.', 0, 27, 0, 0, 0, 0),
       (246, 'B', 8, 'No description available.', 0, 27, 0, 0, 0, 0),
       (247, 'C', 8, 'No description available.', 0, 27, 0, 0, 0, 0),
       (248, 'D', 8, 'No description available.', 0, 27, 0, 0, 0, 0),
       (249, 'E', 8, 'No description available.', 0, 27, 0, 0, 0, 0),
       (250, 'F', 8, 'No description available.', 0, 27, 0, 0, 0, 0),
       (251, 'G', 8, 'No description available.', 0, 27, 0, 0, 0, 0),
       (252, 'H', 8, 'No description available.', 0, 27, 0, 0, 0, 0),
       (253, 'I', 8, 'No description available.', 0, 27, 0, 0, 0, 0),
       (254, 'K', 8, 'No description available.', 0, 27, 0, 0, 0, 0),
       (255, 'L', 8, 'No description available.', 0, 27, 0, 0, 0, 0),
       (256, 'N', 8, 'No description available.', 0, 27, 0, 0, 0, 0),
       (257, 'O', 8, 'No description available.', 0, 27, 0, 0, 0, 0),
       (258, 'P', 8, 'No description available.', 0, 27, 0, 0, 0, 0),
       (259, 'R', 8, 'No description available.', 0, 27, 0, 0, 0, 0),
       (260, 'S', 8, 'No description available.', 0, 27, 0, 0, 0, 0),
       (261, 'T', 8, 'No description available.', 0, 27, 0, 0, 0, 0),
       (262, 'W', 8, 'No description available.', 0, 27, 0, 0, 0, 0),
       (263, 'Blank', 8, 'No description available.', 0, 27, 0, 0, 0, 0),
       (264, 'Prismatium', 8, 'No description available.', 0, 28, 0, 0, 0, 0),
       (265, 'Proxium', 8, 'No description available.', 0, 28, 0, 0, 0, 0),
       (266, 'Quadrothrin', 8, 'No description available.', 0, 28, 0, 0, 0, 0),
       (267, 'Schism', 8, 'No description available.', 0, 28, 0, 0, 0, 0),
       (268, 'Scrapium', 8, 'No description available.', 0, 28, 0, 0, 0, 0),
       (269, 'Tetrathrin', 8, 'No description available.', 0, 28, 0, 0, 0, 0),
       (270, 'Trittothrin', 8, 'No description available.', 0, 28, 0, 0, 0, 0),
       (271, 'Recipe Default', 8, 'No description available.', 0, 29, 0, 0, 0, 0),
       (272, 'REPM-1', 9, 'Repairs Battle Stations over time.', 0, 0, 0, 0, 0, 0),
       (273, 'XPM-1', 9,
        'This valuable module increases the experience gained by your clan members. The best of both worlds!', 0, 0, 0,
        0, 0, 0),
       (274, 'DEFM-1', 9,
        'This crucial module is required for building a Battle Station and provides an invulnerable deflector, whilst active. Get it now!',
        0, 0, 0, 0, 0, 0),
       (275, 'DMGM-1', 9, 'Increases damage from weapon modules', 0, 0, 0, 0, 0, 0),
       (276, 'HULM-1', 9,
        'This essential module is required for building a Battle Station, provides its hull strength, and can be used to upgrade the HP as well.',
        0, 0, 0, 0, 0, 0),
       (277, 'HONM-1', 9, 'All Clan members receive more honor points', 0, 0, 0, 0, 0, 0),
       (278, 'LTM-LR', 9, 'Laser Module with limited range.', 0, 0, 0, 0, 0, 0),
       (279, 'LTM-MR', 9, 'Laser Module with average range.', 0, 0, 0, 0, 0, 0),
       (280, 'RAM-LA', 9, 'Rocket Module with limited precision.', 0, 0, 0, 0, 0, 0),
       (281, 'RAM-MA', 9, 'Rocket Module with average precision.', 0, 0, 0, 0, 0, 0),
       (282, 'Alpha Part', 10, 'Alpha gate part.', 0, 0, 0, 0, 0, 0),
       (283, 'Beta Part', 10, 'Beta gate part', 0, 0, 0, 0, 0, 0),
       (284, 'Gamma Part', 10, 'Gamma gate part.', 0, 0, 0, 0, 0, 0),
       (285, 'Delta Part', 10, 'Delta gate part.', 0, 0, 0, 0, 0, 0);
INSERT INTO `items` (`id`, `name`, `category`, `description`, `price`, `type`, `is_elite`, `is_event`, `is_buyable`,
                     `bonus`)
VALUES (286, 'Epsilon Part', 10, 'Epsilon gate part.', 0, 0, 0, 0, 0, 0),
       (287, 'Zeta Part', 10, 'Zeta gate part.', 0, 0, 0, 0, 0, 0),
       (288, 'Kappa Part', 10, 'Kappa gate part.', 0, 0, 0, 0, 0, 0),
       (289, 'Lambda Part', 10, 'Lambda gate part.', 0, 0, 0, 0, 0, 0),
       (290, 'Hades Part', 10, 'Hades gate part.', 0, 0, 0, 0, 0, 0),
       (291, 'Kuiper Part', 10, 'Kuiper gate part.', 0, 0, 0, 0, 0, 0);
