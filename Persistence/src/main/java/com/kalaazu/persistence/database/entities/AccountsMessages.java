package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_messages.generated.GeneratedAccountsMessages;

/**
 * Accounts' messages table.
 * =========================
 *
 * Contains the messages of an account.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsMessages extends GeneratedAccountsMessages, Entity<Integer> {
    /**
     * Returns the author.
     *
     * @return The author.
     */
    Accounts from();

    /**
     * Returns the destination.
     *
     * @return The destination.
     */
    Accounts to();
}