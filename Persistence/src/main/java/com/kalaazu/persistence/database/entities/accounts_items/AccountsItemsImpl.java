package com.kalaazu.persistence.database.entities.accounts_items;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.AccountsItems;
import com.kalaazu.persistence.database.entities.Items;
import com.kalaazu.persistence.database.entities.Levels;
import com.kalaazu.persistence.database.entities.accounts_items.generated.GeneratedAccountsItemsImpl;

/**
 * The default implementation of the {@link
 * AccountsItems}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class AccountsItemsImpl
        extends GeneratedAccountsItemsImpl
        implements AccountsItems {
    /**
     * The account.
     */
    private Accounts account;

    /**
     * The item.
     */
    private Items item;

    /**
     * The level.
     */
    private Levels level;

    @Override
    public Accounts account() {
        if (this.account != null) {
            return this.account;
        }

        this.account = super.findAccountsId(
                Database.getInstance()
                        .db()
                        .manager(Accounts.class)
        );

        return this.account;
    }

    @Override
    public Items item() {
        if (this.item != null) {
            return this.item;
        }

        this.item = super.findItemsId(
                Database.getInstance()
                        .db()
                        .manager(Items.class)
        );

        return this.item;
    }

    @Override
    public Levels level() {
        if (this.level != null) {
            return this.level;
        }

        this.level = super.findLevelsId(
                Database.getInstance()
                        .db()
                        .manager(Levels.class)
        );

        return this.level;
    }
}