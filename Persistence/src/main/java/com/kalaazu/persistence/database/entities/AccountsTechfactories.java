package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_techfactories.generated.GeneratedAccountsTechfactories;

/**
 * Accounts techfactories table.
 * =============================
 *
 * Contains the techfactories of an account.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsTechfactories extends GeneratedAccountsTechfactories, Entity<Integer> {
    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts getAccount();
}