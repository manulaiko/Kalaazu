package com.kalaazu.persistence.database.entities.clans_applications;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.Clans;
import com.kalaazu.persistence.database.entities.ClansApplications;
import com.kalaazu.persistence.database.entities.clans_applications.generated.GeneratedClansApplicationsImpl;

/**
 * The default implementation of the {@link
 * ClansApplications}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class ClansApplicationsImpl
        extends GeneratedClansApplicationsImpl
        implements ClansApplications {
    /**
     * The clan.
     */
    private Clans clan;

    /**
     * The account.
     */
    private Accounts account;

    @Override
    public Clans clan() {
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