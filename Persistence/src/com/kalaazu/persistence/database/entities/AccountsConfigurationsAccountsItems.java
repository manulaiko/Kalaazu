package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_configurations_accounts_items.generated.GeneratedAccountsConfigurationsAccountsItems;

import java.util.Optional;

/**
 * The main interface for entities of the {@code
 * accounts_configurations_accounts_items}-table in the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsConfigurationsAccountsItems extends GeneratedAccountsConfigurationsAccountsItems, Entity<Integer> {
    /**
     * Returns the configuration.
     *
     * @return The configuration.
     */
    AccountsConfigurations getConfiguration();

    /**
     * Returns the item.
     *
     * @return The item.
     */
    AccountsItems getItem();

    /**
     * Returns the pet.
     *
     * @return The pet.
     */
    Optional<AccountsPets> getPet();

    /**
     * Returns the drone.
     *
     * @return The drone.
     */
    Optional<AccountsDrones> getDrone();
}