package com.kalaazu.persistence.database.entities.accounts_techfactories;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.AccountsTechfactories;
import com.kalaazu.persistence.database.entities.accounts_techfactories.generated.GeneratedAccountsTechfactoriesImpl;

/**
 * The default implementation of the {@link
 * AccountsTechfactories}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class AccountsTechfactoriesImpl
        extends GeneratedAccountsTechfactoriesImpl
        implements AccountsTechfactories {
    /**
     * The account.
     */
    private Accounts account;

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
}