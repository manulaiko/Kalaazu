package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.clans_messages.generated.GeneratedClansMessages;

import java.util.Optional;

/**
 * The main interface for entities of the {@code clans_messages}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ClansMessages extends GeneratedClansMessages, Entity<Integer> {
    /**
     * Returns the clan.
     *
     * @return The clan.
     */
    Clans getClan();

    /**
     * Returns the author.
     *
     * @return The author.
     */
    Accounts getAuthor();

    /**
     * Returns the destination account.
     *
     * @return Destination account.
     */
    Optional<Accounts> getDestination();
}