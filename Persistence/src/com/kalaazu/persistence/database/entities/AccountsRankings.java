package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_rankings.generated.GeneratedAccountsRankings;

/**
 * The main interface for entities of the {@code accounts_rankings}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsRankings extends GeneratedAccountsRankings, Entity<Integer> {
    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts getAccount();
}