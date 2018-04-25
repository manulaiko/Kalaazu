package com.manulaiko.kalaazu.persistence.database.mappers;

/**
 * Item category.
 * ==============
 *
 * Maps `items`.`category` fields to an enum.
 *
 * 0 = currency
 * 1 = ship
 * 2 = ammunition
 * 3 = booster
 * 4 = equipment
 * 5 = deal
 * 6 = pet
 * 7 = drone
 * 8 = resource
 * 9 = module
 * 10 = galaxygate
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public enum ItemCategory {
    CURRENCY,
    SHIP,
    AMMUNITION,
    BOOSTER,
    EQUIPMENT,
    DEAL,
    PET,
    DRONE,
    RESOURCE,
    MODULE,
    GALAXYGATE
}
