package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_hangars.generated.GeneratedAccountsHangars;

import java.util.Optional;

/**
 * Accounts' hangars table.
 * ========================
 *
 * Contains the hangars of an account.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsHangars extends GeneratedAccountsHangars, Entity<Integer> {
    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts account();

    /**
     * Returns the active ship.
     *
     * @return Active ship.
     */
    Optional<AccountsShips> ship();

    /**
     * Returns the active configuration.
     *
     * @return Active configuration.
     */
    Optional<AccountsConfigurations> configuration();
}