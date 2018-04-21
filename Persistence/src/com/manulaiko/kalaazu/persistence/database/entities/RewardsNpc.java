package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class RewardsNpc {
    private int id;

    private int npcsId;

    private int rewardsId;

    private Npc npcsByNpcsId;

    private Reward rewardsByRewardsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNpcsId() {
        return npcsId;
    }

    public void setNpcsId(int npcsId) {
        this.npcsId = npcsId;
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
        RewardsNpc that = (RewardsNpc) o;
        return id == that.id &&
               npcsId == that.npcsId &&
               rewardsId == that.rewardsId;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, npcsId, rewardsId);
    }

    public Npc getNpcsByNpcsId() {
        return npcsByNpcsId;
    }

    public void setNpcsByNpcsId(Npc npcsByNpcsId) {
        this.npcsByNpcsId = npcsByNpcsId;
    }

    public Reward getRewardsByRewardsId() {
        return rewardsByRewardsId;
    }

    public void setRewardsByRewardsId(Reward rewardsByRewardsId) {
        this.rewardsByRewardsId = rewardsByRewardsId;
    }
}
