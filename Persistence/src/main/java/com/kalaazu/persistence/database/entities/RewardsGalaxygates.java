package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.rewards_galaxygates.generated.GeneratedRewardsGalaxygates;

/**
 * Rewards to GalaxyGates table.
 * =============================
 *
 * Maps the rewards to their given gg.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface RewardsGalaxygates extends GeneratedRewardsGalaxygates, Entity<Byte> {
    /**
     * Returns the reward.
     *
     * @return The reward.
     */
    Rewards reward();

    /**
     * Returns the galaxy gate.
     *
     * @return The galaxy gate.
     */
    Galaxygates galaxygate();
}