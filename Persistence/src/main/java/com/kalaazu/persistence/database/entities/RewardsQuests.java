package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.rewards_quests.generated.GeneratedRewardsQuests;

/**
 * Rewards to quests table.
 * ========================
 *
 * Maps the rewards to their given quests.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface RewardsQuests extends GeneratedRewardsQuests, Entity<Short> {
    /**
     * Returns the reward.
     *
     * @return The reward.
     */
    Rewards reward();

    /**
     * Returns the quest.
     *
     * @return The quest.
     */
    Quests quest();
}