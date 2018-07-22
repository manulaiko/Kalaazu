package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_rankings.generated.GeneratedAccountsRankings;

/**
 * Accounts' ranking table.
 * ========================
 *
 * Contains the ranking system of an account.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsRankings extends GeneratedAccountsRankings, Entity<Integer> {
    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts account();
}