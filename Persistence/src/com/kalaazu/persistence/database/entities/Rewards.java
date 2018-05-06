package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.rewards.generated.GeneratedRewards;

/**
 * Rewards table.
 * ==============
 *
 * Contains all possible rewards that can be
 * awarded to someone, all of them.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Rewards extends GeneratedRewards, Entity<Short> {
    /**
     * Returns the item.
     *
     * @return The item
     */
    Items getItem();
}