package com.kalaazu.persistence.database.entities.collectables;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Collectables;
import com.kalaazu.persistence.database.entities.Rewards;
import com.kalaazu.persistence.database.entities.RewardsCollectables;
import com.kalaazu.persistence.database.entities.collectables.generated.GeneratedCollectablesImpl;

import java.util.List;
import java.util.stream.Collectors;

/**
 * The default implementation of the {@link
 * Collectables}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class CollectablesImpl
        extends GeneratedCollectablesImpl
        implements Collectables {
    /**
     * The rewards.
     */
    private List<Rewards> rewards;

    @Override
    public List<Rewards> getRewards() {
        if (this.rewards != null) {
            return this.rewards;
        }

        this.rewards = Database.getInstance()
                               .all(RewardsCollectables.class)
                               .filter(RewardsCollectables.COLLECTABLES_ID.equal(super.getId()))
                               .map(RewardsCollectables::getReward)
                               .collect(Collectors.toList());

        return this.rewards;
    }
}