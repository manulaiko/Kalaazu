package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.trade_items.generated.GeneratedTradeItems;

import java.util.Optional;

/**
 * Trade items table.
 * ==================
 *
 * Contains the items available in the auction.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface TradeItems extends GeneratedTradeItems, Entity<Short> {
    /**
     * Returns the item.
     *
     * @return The item.
     */
    Items getItem();

    /**
     * Returns the max bidder.
     *
     * @return Max bidder.
     */
    Optional<Accounts> getAccount();
}