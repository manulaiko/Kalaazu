package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_messages.generated.GeneratedAccountsMessages;

/**
 * The main interface for entities of the {@code accounts_messages}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsMessages extends GeneratedAccountsMessages, Entity<Integer> {
    /**
     * Returns the author.
     *
     * @return The author.
     */
    Accounts getAuthor();

    /**
     * Returns the destination.
     *
     * @return The destination.
     */
    Accounts getDestination();
}