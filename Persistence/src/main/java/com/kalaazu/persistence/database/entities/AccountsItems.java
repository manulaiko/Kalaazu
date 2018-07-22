package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_items.generated.GeneratedAccountsItems;

/**
 * Accounts' items table.
 * ======================
 *
 * Contains the items owned by an account.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsItems extends GeneratedAccountsItems, Entity<Integer> {
    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts account();

    /**
     * Returns the item.
     *
     * @return The item.
     */
    Items item();

    /**
     * Returns the level.
     *
     * @return The level.
     */
    Levels level();
}