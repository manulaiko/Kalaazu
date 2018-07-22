package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_pets.generated.GeneratedAccountsPets;

/**
 * Accounts' pets table.
 * =====================
 *
 * Contains the pets owned by an account.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsPets extends GeneratedAccountsPets, Entity<Integer> {
    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts account();

    /**
     * Returns the level.
     *
     * @return The level.
     */
    Levels level();
}