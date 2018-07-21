package com.kalaazu.persistence.database.entities.rewards_galaxygates;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Galaxygates;
import com.kalaazu.persistence.database.entities.Rewards;
import com.kalaazu.persistence.database.entities.RewardsGalaxygates;
import com.kalaazu.persistence.database.entities.rewards_galaxygates.generated.GeneratedRewardsGalaxygatesImpl;

/**
 * The default implementation of the {@link
 * RewardsGalaxygates}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class RewardsGalaxygatesImpl
        extends GeneratedRewardsGalaxygatesImpl
        implements RewardsGalaxygates {
    /**
     * The reward.
     */
    private Rewards reward;

    /**
     * The galaxyGate.
     */
    private Galaxygates galaxyGate;

    @Override
    public Rewards getReward() {
        if (this.reward != null) {
            return this.reward;
        }

        this.reward = super.findRewardsId(
                Database.getInstance()
                        .db()
                        .manager(Rewards.class)
        );

        return this.reward;
    }

    @Override
    public Galaxygates getGalaxyGate() {
        if (this.galaxyGate != null) {
            return this.galaxyGate;
        }

        this.galaxyGate = super.findGalaxygatesId(
                Database.getInstance()
                        .db()
                        .manager(Galaxygates.class)
        );

        return this.galaxyGate;
    }
}