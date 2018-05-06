package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_history.generated.GeneratedAccountsHistory;

/**
 * The main interface for entities of the {@code accounts_history}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsHistory extends GeneratedAccountsHistory, Entity<Integer> {
    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts getAccount();
}