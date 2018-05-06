package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_configurations.generated.GeneratedAccountsConfigurations;

import java.util.List;

/**
 * Accounts' configurations table.
 * ===============================
 *
 * Contains the equipment configurations of the accounts.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsConfigurations extends GeneratedAccountsConfigurations, Entity<Integer> {
    /**
     * Returns the hangar.
     *
     * @return The hangar.
     */
    AccountsHangars getHangar();

    /**
     * Returns the equipped items.
     *
     * @return Equipped items.
     */
    List<AccountsConfigurationsAccountsItems> getItems();

    /**
     * Returns the equipped lasers.
     *
     * @return Equipped lasers.
     */
    List<AccountsItems> getLasers();

    /**
     * Returns the equipped hellstorms.
     *
     * @return Equipped hellstorms.
     */
    List<AccountsItems> getHellstorms();

    /**
     * Returns the equipped generators.
     *
     * @return Equipped generators.
     */
    List<AccountsItems> getGenerators();

    /**
     * Returns the equipped extras.
     *
     * @return The equipped extras.
     */
    List<AccountsItems> getExtras();
}