package com.kalaazu.persistence.database.entities.accounts_galaxygates;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.AccountsGalaxygates;
import com.kalaazu.persistence.database.entities.Galaxygates;
import com.kalaazu.persistence.database.entities.accounts_galaxygates.generated.GeneratedAccountsGalaxygatesImpl;

/**
 * The default implementation of the {@link
 * AccountsGalaxygates}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class AccountsGalaxygatesImpl
        extends GeneratedAccountsGalaxygatesImpl
        implements AccountsGalaxygates {
    /**
     * The account.
     */
    private Accounts account;

    /**
     * The galaxygate.
     */
    private Galaxygates galaxygate;

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
    public Galaxygates getGalaxygate() {
        if (this.galaxygate != null) {
            return this.galaxygate;
        }

        this.galaxygate = super.findGalaxygatesId(
                Database.getInstance()
                        .db()
                        .manager(Galaxygates.class)
        );

        return this.galaxygate;
    }
}