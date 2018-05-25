package com.kalaazu.persistence.database.entities.accounts_history;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.AccountsHistory;
import com.kalaazu.persistence.database.entities.accounts_history.generated.GeneratedAccountsHistoryImpl;

/**
 * The default implementation of the {@link
 * AccountsHistory}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class AccountsHistoryImpl
        extends GeneratedAccountsHistoryImpl
        implements AccountsHistory {
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
                        .getDb()
                        .manager(Accounts.class)
        );

        return this.account;
    }
}