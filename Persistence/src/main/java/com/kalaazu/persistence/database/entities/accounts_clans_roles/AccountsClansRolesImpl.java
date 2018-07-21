package com.kalaazu.persistence.database.entities.accounts_clans_roles;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.AccountsClansRoles;
import com.kalaazu.persistence.database.entities.ClansRoles;
import com.kalaazu.persistence.database.entities.accounts_clans_roles.generated.GeneratedAccountsClansRolesImpl;

/**
 * The default implementation of the {@link
 * AccountsClansRoles}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class AccountsClansRolesImpl
        extends GeneratedAccountsClansRolesImpl
        implements AccountsClansRoles {
    /**
     * The account.
     */
    private Accounts account;

    /**
     * The role.
     */
    private ClansRoles role;

    @Override
    public Accounts getAccount() {
        if (this.account != null) {
            return this.account;
        }

        this.account = super.findAccountsId(
                Database.getInstance()
                        .db()
                        .manager(Accounts.class)
        );

        return this.account;
    }

    @Override
    public ClansRoles getRole() {
        if (this.role != null) {
            return this.role;
        }

        this.role = super.findClansRolesId(
                Database.getInstance()
                        .db()
                        .manager(ClansRoles.class)
        );

        return this.role;
    }
}