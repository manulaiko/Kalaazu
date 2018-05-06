package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_techfactories.generated.GeneratedAccountsTechfactories;

/**
 * The main interface for entities of the {@code accounts_techfactories}-table
 * in the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
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