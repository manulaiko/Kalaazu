package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.rewards_collectables.generated.GeneratedRewardsCollectables;

/**
 * Rewards to collectables table.
 * ==============================
 *
 * Maps the rewards with their given collectable.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface RewardsCollectables extends GeneratedRewardsCollectables, Entity<Short> {
    /**
     * Returns the reward.
     *
     * @return The reward.
     */
    Rewards reward();

    /**
     * Returns the collectable.
     *
     * @return The collectable.
     */
    Collectables collectable();
}