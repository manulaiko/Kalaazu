package com.kalaazu.persistence.database.entities.accounts_hangars;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.AccountsConfigurations;
import com.kalaazu.persistence.database.entities.AccountsHangars;
import com.kalaazu.persistence.database.entities.AccountsShips;
import com.kalaazu.persistence.database.entities.accounts_hangars.generated.GeneratedAccountsHangarsImpl;

import java.util.Optional;

/**
 * The default implementation of the {@link
 * AccountsHangars}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class AccountsHangarsImpl
        extends GeneratedAccountsHangarsImpl
        implements AccountsHangars {
    /**
     * The account.
     */
    private Accounts account;

    /**
     * The ship.
     */
    private Optional<AccountsShips> ship;

    /**
     * The configuration.
     */
    private Optional<AccountsConfigurations> configuration;

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
    public Optional<AccountsShips> ship() {
        if (this.ship != null) {
            return this.ship;
        }

        this.ship = super.findAccountsShipsId(
                Database.getInstance()
                        .db()
                        .manager(AccountsShips.class)
        );

        return this.ship;
    }

    @Override
    public Optional<AccountsConfigurations> configuration() {
        if (this.configuration != null) {
            return this.configuration;
        }

        this.configuration = Database.getInstance()
                                     .find(super.getAccountsConfigurationsId()
                                                .orElse(0), AccountsConfigurations.class);

        return this.configuration;
    }
}