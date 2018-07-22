package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_history.generated.GeneratedAccountsHistory;

/**
 * Accounts' history table.
 * ========================
 *
 * Contains the history logs of an account.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsHistory extends GeneratedAccountsHistory, Entity<Integer> {
    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts account();
}