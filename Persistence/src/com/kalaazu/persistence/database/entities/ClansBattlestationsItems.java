package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.clans_battlestations_items.generated.GeneratedClansBattlestationsItems;

/**
 * The main interface for entities of the {@code
 * clans_battlestations_items}-table in the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ClansBattlestationsItems extends GeneratedClansBattlestationsItems, Entity<Integer> {
    /**
     * Returns the battlestation.
     *
     * @return The battlestation.
     */
    ClansBattlestations getBattlestation();

    /**
     * Returns the item.
     *
     * @return Equipped item.
     */
    AccountsItems getItem();
}