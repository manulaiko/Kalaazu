package com.kalaazu.persistence.database.entities.accounts_ships;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.AccountsShips;
import com.kalaazu.persistence.database.entities.Maps;
import com.kalaazu.persistence.database.entities.Ships;
import com.kalaazu.persistence.database.entities.accounts_ships.generated.GeneratedAccountsShipsImpl;

/**
 * The default implementation of the {@link
 * AccountsShips}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class AccountsShipsImpl
        extends GeneratedAccountsShipsImpl
        implements AccountsShips {
    /**
     * The account.
     */
    private Accounts account;

    /**
     * The ship.
     */
    private Ships ship;

    /**
     * The map.
     */
    private Maps map;

    @Override
    public Accounts getAccount() {
        if (this.account != null) {
            return this.account;
        }

        this.account = super.findAccountsId(
                Database.getInstance()
                        .getDb()
                        .manager(Accounts.class
                        )
        );

        return this.account;
    }

    @Override
    public Ships getShip() {
        if (this.ship != null) {
            return this.ship;
        }

        this.ship = super.findShipsId(
                Database.getInstance()
                        .getDb()
                        .manager(Ships.class)
        );

        return this.ship;
    }

    @Override
    public Maps getMap() {
        if (this.map != null) {
            return this.map;
        }

        this.map = super.findMapsId(
                Database.getInstance()
                        .getDb()
                        .manager(Maps.class)
        );

        return this.map;
    }
}