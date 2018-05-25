package com.kalaazu.persistence.database.entities.trade_items;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.Items;
import com.kalaazu.persistence.database.entities.TradeItems;
import com.kalaazu.persistence.database.entities.trade_items.generated.GeneratedTradeItemsImpl;

import java.util.Optional;

/**
 * The default implementation of the {@link
 * TradeItems}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class TradeItemsImpl
        extends GeneratedTradeItemsImpl
        implements TradeItems {
    /**
     * The item.
     */
    private Items item;

    /**
     * Max bidder.
     */
    private Optional<Accounts> account;

    @Override
    public Items getItem() {
        if (this.item != null) {
            return item;
        }

        this.item = super.findItemsId(
                Database.getInstance()
                        .getDb()
                        .manager(Items.class)
        );
        return this.item;
    }

    @Override
    public Optional<Accounts> getAccount() {
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
}