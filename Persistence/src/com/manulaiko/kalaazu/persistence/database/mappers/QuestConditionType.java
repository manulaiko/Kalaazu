package com.manulaiko.kalaazu.persistence.database.mappers;

/**
 * Quest condition type.
 * =====================
 *
 * Maps `quests_conditions`.`type` fields to an enum.
 *
 * 0 = collect
 * 1 = destroy
 * 2 = travel
 * 3 = one of
 * 4 = in order
 * 5 = accomplish before
 * 6 = on map
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public enum QuestConditionType {
    COLLECT,
    DESTROY,
    TRAVEL,
    ONE_OF,
    IN_ORDER,
    ACCOMPLISH_BEFORE,
    ON_MAP
}
