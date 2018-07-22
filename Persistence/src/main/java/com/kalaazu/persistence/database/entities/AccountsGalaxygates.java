package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_galaxygates.generated.GeneratedAccountsGalaxygates;

/**
 * Accounts' galaxygates table.
 * ============================
 *
 * Contains the galaxygates of the accounts.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsGalaxygates extends GeneratedAccountsGalaxygates, Entity<Integer> {
    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts account();

    /**
     * Returns the galaxygate.
     *
     * @return The galaxygate.
     */
    Galaxygates galaxygate();
}