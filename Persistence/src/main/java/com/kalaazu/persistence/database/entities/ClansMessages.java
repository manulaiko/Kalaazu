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
    Clans clan();

    /**
     * Returns the author.
     *
     * @return The author.
     */
    Accounts from();

    /**
     * Returns the destination account.
     *
     * If empty, it's a circular message.
     *
     * @return Destination account.
     */
    Optional<Accounts> to();
}