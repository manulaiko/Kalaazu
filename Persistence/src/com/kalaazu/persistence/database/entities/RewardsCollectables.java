package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.rewards_collectables.generated.GeneratedRewardsCollectables;

/**
 * The main interface for entities of the {@code rewards_collectables}-table in
 * the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface RewardsCollectables extends GeneratedRewardsCollectables, Entity<Short> {
    /**
     * Returns the reward.
     *
     * @return The reward.
     */
    Rewards getReward();

    /**
     * Returns the collectable.
     *
     * @return The collectable.
     */
    Collectables getCollectable();
}