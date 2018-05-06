package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_ships.generated.GeneratedAccountsShips;

/**
 * Accounts' ships table.
 * ======================
 *
 * Contains the ships owned by an account.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsShips extends GeneratedAccountsShips, Entity<Integer> {
    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts getAccount();

    /**
     * Returns the ship.
     *
     * @return The ship.
     */
    Ships getShip();

    /**
     * Returns the map where the ship is located.
     *
     * @return The map.
     */
    Maps getMap();
}