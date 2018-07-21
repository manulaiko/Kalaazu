package com.kalaazu.persistence.database.entities.clans_news;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.Clans;
import com.kalaazu.persistence.database.entities.ClansNews;
import com.kalaazu.persistence.database.entities.clans_news.generated.GeneratedClansNewsImpl;

/**
 * The default implementation of the {@link
 * ClansNews}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class ClansNewsImpl
        extends GeneratedClansNewsImpl
        implements ClansNews {
    /**
     * The clan.
     */
    private Clans clan;

    /**
     * The account.
     */
    private Accounts account;

    @Override
    public Clans getClan() {
        if (this.clan != null) {
            return this.clan;
        }

        this.clan = super.findClansId(
                Database.getInstance()
                        .db()
                        .manager(Clans.class)
        );

        return this.clan;
    }

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