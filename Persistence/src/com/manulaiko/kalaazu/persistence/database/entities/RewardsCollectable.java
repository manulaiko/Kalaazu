package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "rewards_collectables", schema = "kalaazu")
public class RewardsCollectable {
    private int id;

    private int collectablesId;

    private int rewardsId;

    private Collectable collectablesByCollectablesId;

    private Reward rewardsByRewardsId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "collectables_id")
    public int getCollectablesId() {
        return collectablesId;
    }

    public void setCollectablesId(int collectablesId) {
        this.collectablesId = collectablesId;
    }

    @Basic
    @Column(name = "rewards_id")
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

    @ManyToOne
    @JoinColumn(name = "collectables_id", referencedColumnName = "id", nullable = false)
    public Collectable getCollectablesByCollectablesId() {
        return collectablesByCollectablesId;
    }

    public void setCollectablesByCollectablesId(
            Collectable collectablesByCollectablesId
    ) {
        this.collectablesByCollectablesId = collectablesByCollectablesId;
    }

    @ManyToOne
    @JoinColumn(name = "rewards_id", referencedColumnName = "id", nullable = false)
    public Reward getRewardsByRewardsId() {
        return rewardsByRewardsId;
    }

    public void setRewardsByRewardsId(Reward rewardsByRewardsId) {
        this.rewardsByRewardsId = rewardsByRewardsId;
    }
}
