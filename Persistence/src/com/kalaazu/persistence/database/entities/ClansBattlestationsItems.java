package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.clans_battlestations_items.generated.GeneratedClansBattlestationsItems;

/**
 * Clans' battlestation items table.
 * =================================
 *
 * Contains the items equipped in the battlestations.
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