package com.kalaazu.persistence.database.entities.accounts_banks;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.AccountsBanks;
import com.kalaazu.persistence.database.entities.AccountsBanksLogs;
import com.kalaazu.persistence.database.entities.accounts_banks.generated.GeneratedAccountsBanksImpl;

import java.util.List;
import java.util.stream.Collectors;

/**
 * The default implementation of the {@link
 * AccountsBanks}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class AccountsBanksImpl
        extends GeneratedAccountsBanksImpl
        implements AccountsBanks {
    /**
     * The account.
     */
    private Accounts account;

    /**
     * The transaction logs.
     */
    private List<AccountsBanksLogs> logs;

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

    @Override
    public List<AccountsBanksLogs> logs() {
        if (this.logs != null) {
            return this.logs;
        }

        this.logs = Database.getInstance()
                            .all(AccountsBanksLogs.class)
                            .filter(AccountsBanksLogs.ACCOUNTS_BANKS_ID.equal(super.getId()))
                            .collect(Collectors.toList());

        return this.logs;
    }
}