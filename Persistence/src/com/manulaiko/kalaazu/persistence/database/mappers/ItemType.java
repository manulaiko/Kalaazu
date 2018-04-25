package com.manulaiko.kalaazu.persistence.database.mappers;

/**
 * Item type.
 * ==========
 *
 * Maps `items`.`type` fields to an enum.
 *
 * 0 = undefined
 * 1 = currency
 * 2 = voucher
 * 3 = aegis_design
 * 4 = citadel_design
 * 5 = spearhead_design
 * 6 = goliath_design
 * 7 = vengeance_design
 * 8 = firework
 * 9 = laser
 * 10 = mine
 * 11 = rocketlauncher
 * 12 = rocket
 * 13 = specialammo
 * 14 = generator_shield
 * 15 = generator_speed
 * 16 = weapon_laser
 * 17 = weapon_rocketlauncher
 * 18 = extra
 * 19 = extra_cpu
 * 20 = extra_repbot
 * 21 = petgear
 * 22 = aiprotocol
 * 23 = designs
 * 24 = formation
 * 25 = blueprint
 * 26 = ore
 * 27 = wordpuzzle_letter
 * 28 = collectable
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public enum ItemType {
    UNDEFINED,
    CURRENCY,
    VOUCHER,
    AEGIS_DESIGN,
    CITADEL_DESIGN,
    SPEARHEAD_DESIGN,
    GOLIATH_DESIGN,
    VENGEANCE_DESIGN,
    FIREWORK,
    LASER,
    MINE,
    ROCKETLAUNCHER,
    ROCKET,
    SPECIALAMMO,
    GENERATOR_SHIELD,
    GENERATOR_SPEED,
    WEAPON_LASER,
    WEAPON_ROCKETLAUNCHER,
    EXTRA,
    EXTRA_CPU,
    EXTRA_REPBOT,
    PETGEAR,
    AIPROTOCOL,
    DESIGNS,
    FORMATION,
    BLUEPRINT,
    ORE,
    WORDPUZZLE_LETTER,
    COLLECTABLE
}
