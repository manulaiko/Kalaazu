package com.kalaazu.persistence.database.entities.accounts_techfactory_items;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.AccountsTechfactoryItems;
import com.kalaazu.persistence.database.entities.TechfactoryItems;
import com.kalaazu.persistence.database.entities.accounts_techfactory_items.generated.GeneratedAccountsTechfactoryItemsImpl;

/**
 * The default implementation of the {@link
 * AccountsTechfactoryItems}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class AccountsTechfactoryItemsImpl
        extends GeneratedAccountsTechfactoryItemsImpl
        implements AccountsTechfactoryItems {
    /**
     * The account.
     */
    private Accounts account;

    /**
     * The item.
     */
    private TechfactoryItems item;

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
    public TechfactoryItems getItem() {
        if (this.item != null) {
            return this.item;
        }

        this.item = super.findTechfactoryItemsId(
                Database.getInstance()
                        .getDb()
                        .manager(TechfactoryItems.class)
        );

        return this.item;
    }
}