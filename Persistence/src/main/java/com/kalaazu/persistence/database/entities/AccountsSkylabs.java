package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_skylabs.generated.GeneratedAccountsSkylabs;

/**
 * Accounts' skylabs table.
 * ========================
 *
 * Contains the skylab modules of an account.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsSkylabs extends GeneratedAccountsSkylabs, Entity<Integer> {
    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts getAccount();

    /**
     * Returns the module.
     *
     * @return The module.
     */
    SkylabModules getModule();

    /**
     * Returns the module level.
     *
     * @return Module level.
     */
    Levels getLevel();
}