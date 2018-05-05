package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.rewards_ships.generated.GeneratedRewardsShips;

/**
 * The main interface for entities of the {@code rewards_ships}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface RewardsShips extends GeneratedRewardsShips, Entity<Byte> {
    /**
     * Returns the reward.
     *
     * @return The reward.
     */
    Rewards getReward();

    /**
     * Returns the ship.
     *
     * @return The ship.
     */
    Ships getShip();
}