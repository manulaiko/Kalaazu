package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_drones.generated.GeneratedAccountsDrones;

/**
 * Accounts drones.
 * ================
 *
 * Contains the drones of an account.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsDrones extends GeneratedAccountsDrones, Entity<Integer> {
    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts getAccount();

    /**
     * Returns the level.
     *
     * @return The level.
     */
    Levels getLevel();
}