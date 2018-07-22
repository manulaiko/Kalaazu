package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.rewards_ships.generated.GeneratedRewardsShips;

/**
 * Rewards to ships table.
 * =======================
 *
 * Maps the rewards to their given ships.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface RewardsShips extends GeneratedRewardsShips, Entity<Byte> {
    /**
     * Returns the reward.
     *
     * @return The reward.
     */
    Rewards reward();

    /**
     * Returns the ship.
     *
     * @return The ship.
     */
    Ships ship();
}