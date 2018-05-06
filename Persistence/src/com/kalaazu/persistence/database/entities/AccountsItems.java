package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_items.generated.GeneratedAccountsItems;

/**
 * The main interface for entities of the {@code accounts_items}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsItems extends GeneratedAccountsItems, Entity<Integer> {
    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts getAccount();

    /**
     * Returns the item.
     *
     * @return The item.
     */
    Items getItem();

    /**
     * Returns the level.
     *
     * @return The level.
     */
    Levels getLevel();
}