package com.kalaazu.persistence.database.entities.accounts_configurations_accounts_items;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.*;
import com.kalaazu.persistence.database.entities.accounts_configurations_accounts_items.generated.GeneratedAccountsConfigurationsAccountsItemsImpl;

import java.util.Optional;

/**
 * The default implementation of the {@link
 * AccountsConfigurationsAccountsItems}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class AccountsConfigurationsAccountsItemsImpl
        extends GeneratedAccountsConfigurationsAccountsItemsImpl
        implements AccountsConfigurationsAccountsItems {
    /**
     * The configuration.
     */
    private AccountsConfigurations configuration;

    /**
     * The item.
     */
    private AccountsItems item;

    /**
     * The pet.
     */
    private Optional<AccountsPets> pet;

    /**
     * The drone.
     */
    private Optional<AccountsDrones> drone;

    @Override
    public AccountsConfigurations getConfiguration() {
        if (this.configuration != null) {
            return this.configuration;
        }

        this.configuration = super.findAccountsConfigurationsId(
                Database.getInstance()
                        .getDb()
                        .manager(AccountsConfigurations.class)
        );

        return this.configuration;
    }

    @Override
    public AccountsItems getItem() {
        if (this.item != null) {
            return this.item;
        }

        this.item = super.findAccountsItemsId(
                Database.getInstance()
                        .getDb()
                        .manager(AccountsItems.class)
        );

        return this.item;
    }

    @Override
    public Optional<AccountsPets> getPet() {
        if (this.pet != null) {
            return this.pet;
        }

        this.pet = super.findAccountsPetsId(
                Database.getInstance()
                        .getDb()
                        .manager(AccountsPets.class)
        );

        return this.pet;
    }

    @Override
    public Optional<AccountsDrones> getDrone() {
        if (this.drone != null) {
            return this.drone;
        }

        this.drone = super.findAccountsDronesId(
                Database.getInstance()
                        .getDb()
                        .manager(AccountsDrones.class)
        );

        return this.drone;
    }
}