package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class RewardsQuest {
    private int id;

    private int questsId;

    private int rewardsId;

    private Quest questsByQuestsId;

    private Reward rewardsByRewardsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuestsId() {
        return questsId;
    }

    public void setQuestsId(int questsId) {
        this.questsId = questsId;
    }

    public int getRewardsId() {
        return rewardsId;
    }

    public void setRewardsId(int rewardsId) {
        this.rewardsId = rewardsId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        RewardsQuest that = (RewardsQuest) o;
        return id == that.id &&
               questsId == that.questsId &&
               rewardsId == that.rewardsId;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, questsId, rewardsId);
    }

    public Quest getQuestsByQuestsId() {
        return questsByQuestsId;
    }

    public void setQuestsByQuestsId(Quest questsByQuestsId) {
        this.questsByQuestsId = questsByQuestsId;
    }

    public Reward getRewardsByRewardsId() {
        return rewardsByRewardsId;
    }

    public void setRewardsByRewardsId(Reward rewardsByRewardsId) {
        this.rewardsByRewardsId = rewardsByRewardsId;
    }
}
