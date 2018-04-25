package com.manulaiko.kalaazu.persistence.database.mappers;

/**
 * Bank log type.
 * ==============
 *
 * Maps `accounts_banks_logs`.`type` fields to an enum.
 *
 * 0 = box
 * 1 = ore
 * 2 = beacon
 * 3 = firework
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public enum CollectableType {
    BOX,
    ORE,
    BEACON,
    FIREWORK
}
