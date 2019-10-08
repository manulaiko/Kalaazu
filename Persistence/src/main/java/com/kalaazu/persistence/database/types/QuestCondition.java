package com.kalaazu.persistence.database.types;

/**
 * Quest condition type.
 * =====================
 *
 * Represents the type of a quest condition.
 *
 * 0 = Collect.
 * 1 = Destroy,
 * 2 = Travel.
 * 3 = One of.
 * 4 = In order.
 * 5 = Accomplish before.
 * 6 = On map.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public enum QuestCondition {
    COLLECT,
    DESTROY,
    TRAVEL,
    ONE_OF,
    IN_ORDER,
    ACCOMPLISH_BEFORE,
    ON_MAP
}
