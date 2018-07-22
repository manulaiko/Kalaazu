package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_configurations_accounts_items.generated.GeneratedAccountsConfigurationsAccountsItems;

import java.util.Optional;

/**
 * Accounts' items to accounts' configurations table.
 * ==================================================
 *
 * Maps the items to the configuration their equipped in.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsConfigurationsAccountsItems extends GeneratedAccountsConfigurationsAccountsItems, Entity<Integer> {
    /**
     * Returns the configuration.
     *
     * @return The configuration.
     */
    AccountsConfigurations configuration();

    /**
     * Returns the item.
     *
     * @return The item.
     */
    AccountsItems item();

    /**
     * Returns the pet.
     *
     * @return The pet.
     */
    Optional<AccountsPets> pet();

    /**
     * Returns the drone.
     *
     * @return The drone.
     */
    Optional<AccountsDrones> drone();
}