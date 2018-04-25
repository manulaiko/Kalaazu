package com.manulaiko.kalaazu.persistence.database.mappers;

/**
 * Clan status.
 * ============
 *
 * Maps `clans`.`status` fields to an enum.
 *
 * 0 = closed
 * 1 = recruiting
 * 2 = lvl10+
 * 3 = lvl16+
 * 4 = FE
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public enum ClanStatus {
    CLOSED,
    RECRUITING,
    LVL10,
    LVL16,
    FE
}
