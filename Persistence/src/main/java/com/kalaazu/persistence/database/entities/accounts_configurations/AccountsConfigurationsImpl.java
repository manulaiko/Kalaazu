package com.kalaazu.persistence.database.entities.accounts_configurations;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.AccountsConfigurations;
import com.kalaazu.persistence.database.entities.AccountsConfigurationsAccountsItems;
import com.kalaazu.persistence.database.entities.AccountsHangars;
import com.kalaazu.persistence.database.entities.AccountsItems;
import com.kalaazu.persistence.database.entities.accounts_configurations.generated.GeneratedAccountsConfigurationsImpl;
import com.kalaazu.persistence.database.mappers.ItemType;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * The default implementation of the {@link
 * AccountsConfigurations}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class AccountsConfigurationsImpl
        extends GeneratedAccountsConfigurationsImpl
        implements AccountsConfigurations {
    /**
     * The hangar.
     */
    private AccountsHangars hangar;

    /**
     * Equipped items.
     */
    private List<AccountsConfigurationsAccountsItems> items;

    /**
     * Equipped lasers.
     */
    private List<AccountsItems> lasers;

    /**
     * Equipped hellstorms.
     */
    private List<AccountsItems> hellstorms;

    /**
     * Equipped generators.
     */
    private List<AccountsItems> generators;

    /**
     * Equipped extras.
     */
    private List<AccountsItems> extras;

    @Override
    public AccountsHangars hangar() {
        if (this.hangar != null) {
            return this.hangar;
        }

        this.hangar = super.findAccountsHangarsId(
                Database.getInstance()
                        .db()
                        .manager(AccountsHangars.class)
        );

        return this.hangar;
    }

    @Override
    public List<AccountsConfigurationsAccountsItems> items() {
        if (this.items != null) {
            return this.items;
        }

        this.items = Database.getInstance()
                             .all(AccountsConfigurationsAccountsItems.class)
                             .filter(AccountsConfigurationsAccountsItems.ACCOUNTS_CONFIGURATIONS_ID.equal(
                                     super.id()))
                             .collect(Collectors.toList());

        return items;
    }

    @Override
    public List<AccountsItems> lasers() {
        if (this.lasers != null) {
            return this.lasers;
        }

        this.lasers = this.find(ItemType.LASER);

        return this.lasers;
    }

    @Override
    public List<AccountsItems> hellstorms() {
        if (this.hellstorms != null) {
            return this.hellstorms;
        }

        this.hellstorms = this.find(ItemType.ROCKETLAUNCHER);

        return this.hellstorms;
    }

    @Override
    public List<AccountsItems> generators() {
        if (this.generators != null) {
            return this.generators;
        }

        this.generators = this.find(ItemType.GENERATOR_SHIELD, ItemType.GENERATOR_SPEED);

        return this.generators;
    }

    @Override
    public List<AccountsItems> extras() {
        if (this.extras != null) {
            return this.extras;
        }

        this.extras = this.find(ItemType.EXTRA_REPBOT, ItemType.EXTRA_CPU);

        return this.extras;
    }

    /**
     * Finds and returns items of multiple types.
     *
     * @param types Item types.
     *
     * @return Items of given types.
     */
    private List<AccountsItems> find(ItemType... types) {
        var items = new ArrayList<AccountsItems>();

        for (ItemType t : types) {
            items.addAll(this.find(t));
        }

        return items;
    }

    /**
     * Finds and returns the items of given type in this configuration.
     *
     * @param type Item type.
     *
     * @return Items of given type.
     */
    private List<AccountsItems> find(ItemType type) {
        var items = this.items();

        return items.stream()
                    .map(AccountsConfigurationsAccountsItems::item)
                    .filter(
                            i -> i.item()
                                  .getType() == type
                    )
                    .collect(Collectors.toList());
    }
}