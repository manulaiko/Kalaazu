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
    public Accounts getAuthor() {
        if (this.author != null) {
            return this.author;
        }

        this.author = super.findFromAccountsId(
                Database.getInstance()
                        .getDb()
                        .manager(Accounts.class)
        );

        return this.author;
    }

    @Override
    public Accounts getDestination() {
        if (this.destination != null) {
            return this.destination;
        }

        this.destination = super.findToAccountsId(
                Database.getInstance()
                        .getDb()
                        .manager(Accounts.class)
        );

        return this.destination;
    }

    @Override
    public Optional<AccountsBanks> getBank() {
        if (this.bank != null) {
            return this.bank;
        }

        this.bank = super.findAccountsBanksId(
                Database.getInstance()
                        .getDb()
                        .manager(AccountsBanks.class)
        );

        return this.bank;
    }
}