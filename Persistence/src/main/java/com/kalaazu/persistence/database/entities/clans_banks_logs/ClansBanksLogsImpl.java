package com.kalaazu.persistence.database.entities.clans_banks_logs;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.ClansBanks;
import com.kalaazu.persistence.database.entities.ClansBanksLogs;
import com.kalaazu.persistence.database.entities.clans_banks_logs.generated.GeneratedClansBanksLogsImpl;

/**
 * The default implementation of the {@link
 * ClansBanksLogs}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class ClansBanksLogsImpl
        extends GeneratedClansBanksLogsImpl
        implements ClansBanksLogs {
    /**
     * The bank.
     */
    private ClansBanks bank;

    /**
     * The author.
     */
    private Accounts author;

    /**
     * The destination.
     */
    private Accounts destination;

    @Override
    public ClansBanks bank() {
        if (this.bank != null) {
            return this.bank;
        }

        this.bank = super.findClansBanksId(
                Database.getInstance()
                        .db()
                        .manager(ClansBanksLogs.class)
        );

        return this.bank;
    }

    @Override
    public Accounts from() {
        if (this.author != null) {
            return this.author;
        }

        this.author = super.findFromAccountsId(
                Database.getInstance()
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
                Database.getInstance()
                        .db()
                        .manager(Accounts.class)
        );

        return this.destination;
    }
}