package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class RewardsCollectable {
    private int id;

    private int collectablesId;

    private int rewardsId;

    private Collectable collectablesByCollectablesId;

    private Reward rewardsByRewardsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCollectablesId() {
        return collectablesId;
    }

    public void setCollectablesId(int collectablesId) {
        this.collectablesId = collectablesId;
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
        RewardsCollectable that = (RewardsCollectable) o;
        return id == that.id &&
               collectablesId == that.collectablesId &&
               rewardsId == that.rewardsId;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, collectablesId, rewardsId);
    }

    public Collectable getCollectablesByCollectablesId() {
        return collectablesByCollectablesId;
    }

    public void setCollectablesByCollectablesId(
            Collectable collectablesByCollectablesId
    ) {
        this.collectablesByCollectablesId = collectablesByCollectablesId;
    }

    public Reward getRewardsByRewardsId() {
        return rewardsByRewardsId;
    }

    public void setRewardsByRewardsId(Reward rewardsByRewardsId) {
        this.rewardsByRewardsId = rewardsByRewardsId;
    }
}
