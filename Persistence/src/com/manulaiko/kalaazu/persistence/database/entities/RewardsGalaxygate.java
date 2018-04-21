package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class RewardsGalaxygate {
    private int id;

    private int galaxygatesId;

    private int rewardsId;

    private Galaxygate galaxygatesByGalaxygatesId;

    private Reward rewardsByRewardsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGalaxygatesId() {
        return galaxygatesId;
    }

    public void setGalaxygatesId(int galaxygatesId) {
        this.galaxygatesId = galaxygatesId;
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
        RewardsGalaxygate that = (RewardsGalaxygate) o;
        return id == that.id &&
               galaxygatesId == that.galaxygatesId &&
               rewardsId == that.rewardsId;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, galaxygatesId, rewardsId);
    }

    public Galaxygate getGalaxygatesByGalaxygatesId() {
        return galaxygatesByGalaxygatesId;
    }

    public void setGalaxygatesByGalaxygatesId(
            Galaxygate galaxygatesByGalaxygatesId
    ) {
        this.galaxygatesByGalaxygatesId = galaxygatesByGalaxygatesId;
    }

    public Reward getRewardsByRewardsId() {
        return rewardsByRewardsId;
    }

    public void setRewardsByRewardsId(Reward rewardsByRewardsId) {
        this.rewardsByRewardsId = rewardsByRewardsId;
    }
}
