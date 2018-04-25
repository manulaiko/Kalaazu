package com.manulaiko.kalaazu.persistence.database.mappers;

/**
 * Diplomacy status.
 * =================
 *
 * Maps `clans_diplomacies`.`status` fields to an enum.
 *
 * 0 = not accepted
 * 1 = accepted
 * 2 = rejected
 * 3 = over
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public enum DiplomacyStatus {
    NOT_ACCEPTED,
    ACCEPTED,
    REJECTED,
    OVER
}
