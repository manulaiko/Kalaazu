package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.rewards_galaxygates.generated.GeneratedRewardsGalaxygates;

/**
 * The main interface for entities of the {@code rewards_galaxygates}-table in
 * the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface RewardsGalaxygates extends GeneratedRewardsGalaxygates, Entity<Byte> {
    /**
     * Returns the reward.
     *
     * @return The reward.
     */
    Rewards getReward();

    /**
     * Returns the galaxy gate.
     *
     * @return The galaxy gate.
     */
    Galaxygates getGalaxyGate();
}