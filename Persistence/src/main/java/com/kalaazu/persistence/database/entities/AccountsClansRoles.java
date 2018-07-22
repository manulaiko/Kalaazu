package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_clans_roles.generated.GeneratedAccountsClansRoles;

/**
 * Accounts to clan roles table.
 * =============================
 *
 * Maps the clan roles to an account.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsClansRoles extends GeneratedAccountsClansRoles, Entity<Integer> {
    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts account();

    /**
     * Returns the role.
     *
     * @return The role.
     */
    ClansRoles role();
}