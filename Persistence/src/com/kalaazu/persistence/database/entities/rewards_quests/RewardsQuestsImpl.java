package com.kalaazu.persistence.database.entities.rewards_quests;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Quests;
import com.kalaazu.persistence.database.entities.Rewards;
import com.kalaazu.persistence.database.entities.RewardsQuests;
import com.kalaazu.persistence.database.entities.rewards_quests.generated.GeneratedRewardsQuestsImpl;

/**
 * The default implementation of the {@link
 * RewardsQuests}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class RewardsQuestsImpl
        extends GeneratedRewardsQuestsImpl
        implements RewardsQuests {
    /**
     * The reward.
     */
    private Rewards reward;

    /**
     * The quest.
     */
    private Quests quest;

    @Override
    public Rewards getReward() {
        if (this.reward != null) {
            return this.reward;
        }

        this.reward = super.findRewardsId(
                Database.getInstance()
                        .getDb()
                        .manager(Rewards.class)
        );

        return this.reward;
    }

    @Override
    public Quests getQuest() {
        if (this.quest != null) {
            return this.quest;
        }

        this.quest = super.findQuestsId(
                Database.getInstance()
                        .getDb()
                        .manager(Quests.class)
        );

        return this.quest;
    }
}