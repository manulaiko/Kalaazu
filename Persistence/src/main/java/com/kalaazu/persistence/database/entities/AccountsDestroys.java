package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_destroys.generated.GeneratedAccountsDestroys;

/**
 * Accounts' destroys table.
 * =========================
 *
 * Contains the ship destroy logs of an account
 * in order to calculate the rank points.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsDestroys extends GeneratedAccountsDestroys, Entity<Integer> {
    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts account();

    /**
     * Returns the ship.
     *
     * @return The ship.
     */
    Ships ship();
}