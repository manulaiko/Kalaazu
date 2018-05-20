package com.kalaazu.persistence.database.entities.accounts_destroys;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.AccountsDestroys;
import com.kalaazu.persistence.database.entities.Ships;
import com.kalaazu.persistence.database.entities.accounts_destroys.generated.GeneratedAccountsDestroysImpl;

/**
 * The default implementation of the {@link
 * AccountsDestroys}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class AccountsDestroysImpl
        extends GeneratedAccountsDestroysImpl
        implements AccountsDestroys {
    /**
     * The account.
     */
    private Accounts account;

    /**
     * The ship.
     */
    private Ships ship;

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

    @Override
    public Ships getShip() {
        if (this.ship != null) {
            return this.ship;
        }

        this.ship = Database.getInstance()
                            .find(super.getShipsId(), Ships.class)
                            .orElse(null);

        return this.ship;
    }
}