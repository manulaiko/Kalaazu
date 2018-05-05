package com.manulaiko.kalaazu.persistence.database.entities.trade_items;

import com.manulaiko.kalaazu.persistence.database.Database;
import com.manulaiko.kalaazu.persistence.database.entities.Accounts;
import com.manulaiko.kalaazu.persistence.database.entities.Items;
import com.manulaiko.kalaazu.persistence.database.entities.TradeItems;
import com.manulaiko.kalaazu.persistence.database.entities.trade_items.generated.GeneratedTradeItemsImpl;

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

        this.item = Database.getInstance()
                            .find(super.getItemsId(), Items.class)
                            .orElse(null);

        return this.item;
    }

    @Override
    public Optional<Accounts> getAccount() {
        if (this.account != null) {
            return this.account;
        }

        this.account = Optional.empty();

        super.getAccountsId()
             .ifPresent(
                     i -> this.account = Database.getInstance()
                                                 .find(i, Accounts.class)
             );

        return this.account;
    }
}