package com.kalaazu.persistence.database.types;

/**
 * Diplomacy status type.
 * ======================
 *
 * Represents the status of a diplomacy request.
 *
 * 0 = Not accepted.
 * 1 = Accepted.
 * 2 = Rejected.
 * 3 = Over.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public enum DiplomacyStatus {
    NOT_ACCEPTED,
    ACCEPTED,
    REJECTED,
    OVER
}
