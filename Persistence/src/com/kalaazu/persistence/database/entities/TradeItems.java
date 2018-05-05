package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.trade_items.generated.GeneratedTradeItems;

import java.util.Optional;

/**
 * The main interface for entities of the {@code trade_items}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
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