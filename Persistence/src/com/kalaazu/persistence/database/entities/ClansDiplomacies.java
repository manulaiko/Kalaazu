package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.clans_diplomacies.generated.GeneratedClansDiplomacies;

/**
 * The main interface for entities of the {@code clans_diplomacies}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
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