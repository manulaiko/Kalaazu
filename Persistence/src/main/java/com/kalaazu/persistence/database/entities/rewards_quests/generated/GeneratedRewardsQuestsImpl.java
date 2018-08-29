package com.kalaazu.persistence.database.entities.rewards_quests.generated;

import com.kalaazu.persistence.database.entities.Manager;
import com.kalaazu.persistence.database.entities.Quests;
import com.kalaazu.persistence.database.entities.Rewards;
import com.kalaazu.persistence.database.entities.RewardsQuests;
import com.speedment.common.annotation.GeneratedCode;
import lombok.Data;

import java.util.Objects;
import java.util.StringJoiner;

/**
 * The generated base implementation of the {@link
 * RewardsQuests}-interface.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
@Data
public abstract class GeneratedRewardsQuestsImpl implements RewardsQuests {

    private Short id;

    private short questsId;

    private short rewardsId;

    protected GeneratedRewardsQuestsImpl() {

    }

    @Override
    public Quests findQuestsId(Manager<Quests> foreignManager) {
        return foreignManager.stream()
                             .filter(Quests.ID.equal(questsId()))
                             .findAny()
                             .orElse(null);
    }

    @Override
    public Rewards findRewardsId(Manager<Rewards> foreignManager) {
        return foreignManager.stream()
                             .filter(Rewards.ID.equal(rewardsId()))
                             .findAny()
                             .orElse(null);
    }
}