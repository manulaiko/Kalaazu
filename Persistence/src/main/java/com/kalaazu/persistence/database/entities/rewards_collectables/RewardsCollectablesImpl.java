package com.kalaazu.persistence.database.entities.rewards_collectables;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Collectables;
import com.kalaazu.persistence.database.entities.Quests;
import com.kalaazu.persistence.database.entities.Rewards;
import com.kalaazu.persistence.database.entities.RewardsCollectables;
import com.kalaazu.persistence.database.entities.rewards_collectables.generated.GeneratedRewardsCollectablesImpl;

/**
 * The default implementation of the {@link
 * RewardsCollectables}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class RewardsCollectablesImpl
        extends GeneratedRewardsCollectablesImpl
        implements RewardsCollectables {
    /**
     * The reward.
     */
    private Rewards reward;

    /**
     * The collectable.
     */
    private Collectables collectable;

    @Override
    public Rewards reward() {
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
    public Collectables collectable() {
        if (this.collectable != null) {
            return this.collectable;
        }

        this.collectable = super.findCollectablesId(
                Database.getInstance()
                        .db()
                        .manager(Quests.class)
        );

        return this.collectable;
    }
}