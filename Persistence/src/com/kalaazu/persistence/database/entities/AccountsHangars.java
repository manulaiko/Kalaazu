package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_hangars.generated.GeneratedAccountsHangars;

import java.util.Optional;

/**
 * The main interface for entities of the {@code accounts_hangars}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsHangars extends GeneratedAccountsHangars, Entity<Integer> {
    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts getAccount();

    /**
     * Returns the active ship.
     *
     * @return Active ship.
     */
    Optional<AccountsShips> getShip();

    /**
     * Returns the active configuration.
     *
     * @return Active configuration.
     */
    Optional<AccountsConfigurations> getConfiguration();
}