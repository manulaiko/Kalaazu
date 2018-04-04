-- Initial dump for the `skylab_modules` table.

INSERT INTO `skylab_modules`(`id`, `name`, `production_factor`, `production_base`, `storage_factor`, `storage_base`, `upgrade_factor`, `upgrade_base`, `energy_factor`, `energy_base`) VALUES
(1,  'Prometium Collector', 20.00, 1000, 50.00, 10000, 35.00, 5000,  10.00, 10),
(2,  'Endurium Collector',  20.00, 1000, 50.00, 10000, 35.00, 5000,  10.00, 10),
(3,  'Terbium Collector',   20.00, 1000, 50.00, 10000, 35.00, 5000,  10.00, 10),
(4,  'Basic Module',        0,     0,    0,     0,     30.00, 10000, 5.00,  20),
(5,  'Solar Module',        20.00, 150,  20.00, 150,   20.00, 6000,  10.00, 10),
(6,  'Storage Module',      0,     0,    0,     0,     27.50, 10000, 10.00, 10),
(7,  'Prometid Refinery',   10.00, 100,  50.00, 1000,  40.00, 10000, 10.00, 15),
(8,  'Duranium Refinery',   10.00, 100,  50.00, 1000,  40.00, 10000, 10.00, 15),
(9,  'Xenomit Refinery',    10.00, 100,  50.00, 1000,  40.00, 10000, 10.00, 15),
(10, 'Promerium Refinery',  7.50,  100,  25.00, 1000,  35.00, 5000,  10.00, 10),
(11, 'Seprom Refinery',     20.00, 10,   50.00, 100,   35.00, 5000,  10.00, 10);
