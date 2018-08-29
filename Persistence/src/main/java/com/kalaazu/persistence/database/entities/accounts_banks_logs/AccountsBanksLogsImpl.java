package com.kalaazu.persistence.database.entities.accounts_banks_logs;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.AccountsBanks;
import com.kalaazu.persistence.database.entities.AccountsBanksLogs;
import com.kalaazu.persistence.database.entities.accounts_banks_logs.generated.GeneratedAccountsBanksLogsImpl;

import java.util.Optional;

/**
 * The default implementation of the {@link
 * AccountsBanksLogs}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class AccountsBanksLogsImpl
        extends GeneratedAccountsBanksLogsImpl
        implements AccountsBanksLogs {
    /**
     * The author.
     */
    private Accounts author;

    /**
     * The destination.
     */
    private Accounts destination;

    /**
     * The bank.
     */
    private Optional<AccountsBanks> bank;

    @Override
    public Accounts from() {
        if (this.author != null) {
            return this.author;
        }

        this.author = super.findFromAccountsId(
                Database.instance()
                        .db()
                        .manager(Accounts.class)
        );

        return this.author;
    }

    @Override
    public Accounts to() {
        if (this.destination != null) {
            return this.destination;
        }

        this.destination = super.findToAccountsId(
                Database.instance()
                        .db()
                        .manager(Accounts.class)
        );

        return this.destination;
    }

    @Override
    public Optional<AccountsBanks> bank() {
        if (this.bank != null) {
            return this.bank;
        }

        this.bank = super.findAccountsBanksId(
                Database.instance()
                        .db()
                        .manager(AccountsBanks.class)
        );

        return this.bank;
    }
}