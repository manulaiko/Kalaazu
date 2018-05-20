package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_techfactory_items.generated.GeneratedAccountsTechfactoryItems;

/**
 * Accounts' techfactory items table.
 * ==================================
 *
 * Contains the techfactory items owned by an account.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsTechfactoryItems extends GeneratedAccountsTechfactoryItems, Entity<Integer> {
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
    TechfactoryItems getItem();
}