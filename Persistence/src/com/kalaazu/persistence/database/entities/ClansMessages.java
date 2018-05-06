package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.clans_messages.generated.GeneratedClansMessages;

import java.util.Optional;

/**
 * Clans' messages table.
 * ======================
 *
 * Contains the messages of each clan.
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