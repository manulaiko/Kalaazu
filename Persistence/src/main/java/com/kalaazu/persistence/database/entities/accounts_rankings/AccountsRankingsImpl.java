package com.kalaazu.persistence.database.entities.accounts_rankings;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.AccountsRankings;
import com.kalaazu.persistence.database.entities.accounts_rankings.generated.GeneratedAccountsRankingsImpl;

/**
 * The default implementation of the {@link
 * AccountsRankings}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class AccountsRankingsImpl
        extends GeneratedAccountsRankingsImpl
        implements AccountsRankings {
    /**
     * The account.
     */
    private Accounts account;

    @Override
    public Accounts account() {
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