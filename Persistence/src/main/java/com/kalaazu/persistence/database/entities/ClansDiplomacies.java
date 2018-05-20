package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.clans_diplomacies.generated.GeneratedClansDiplomacies;

/**
 * Clans' diplomacies table.
 * =========================
 *
 * Contains the diplomacy between clans.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ClansDiplomacies extends GeneratedClansDiplomacies, Entity<Integer> {
    /**
     * Returns the author clan.
     *
     * @return Author clan.
     */
    Clans getAuthor();

    /**
     * Returns the destination clan.
     *
     * @return Destination clan.
     */
    Clans getDestination();
}