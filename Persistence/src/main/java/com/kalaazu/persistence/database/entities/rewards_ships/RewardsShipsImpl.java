package com.kalaazu.persistence.database.entities.rewards_ships;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Rewards;
import com.kalaazu.persistence.database.entities.RewardsShips;
import com.kalaazu.persistence.database.entities.Ships;
import com.kalaazu.persistence.database.entities.rewards_ships.generated.GeneratedRewardsShipsImpl;

/**
 * The default implementation of the {@link
 * RewardsShips}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class RewardsShipsImpl
        extends GeneratedRewardsShipsImpl
        implements RewardsShips {
    /**
     * The reward.
     */
    private Rewards rewards;

    /**
     * The ship.
     */
    private Ships ship;

    @Override
    public Rewards getReward() {
        if (this.rewards != null) {
            return this.rewards;
        }

        this.rewards = super.findRewardsId(
                Database.getInstance()
                        .db()
                        .manager(Rewards.class)
        );

        return this.rewards;
    }

    @Override
    public Ships getShip() {
        if (this.ship != null) {
            return this.ship;
        }

        this.ship = super.findShipsId(
                Database.getInstance()
                        .db()
                        .manager(Ships.class)
        );

        return this.ship;
    }
}