package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "rewards_collectables", schema = "kalaazu", catalog = "")
public class RewardsCollectablesEntity {
    private short              id;
    private CollectablesEntity collectablesByCollectablesId;
    private RewardsEntity      rewardsByRewardsId;

    @Id
    @Column(name = "id", nullable = false)
    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        RewardsCollectablesEntity that = (RewardsCollectablesEntity) o;
        return id == that.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @ManyToOne
    @JoinColumn(name = "collectables_id", referencedColumnName = "id", nullable = false)
    public CollectablesEntity getCollectablesByCollectablesId() {
        return collectablesByCollectablesId;
    }

    public void setCollectablesByCollectablesId(CollectablesEntity collectablesByCollectablesId) {
        this.collectablesByCollectablesId = collectablesByCollectablesId;
    }

    @ManyToOne
    @JoinColumn(name = "rewards_id", referencedColumnName = "id", nullable = false)
    public RewardsEntity getRewardsByRewardsId() {
        return rewardsByRewardsId;
    }

    public void setRewardsByRewardsId(RewardsEntity rewardsByRewardsId) {
        this.rewardsByRewardsId = rewardsByRewardsId;
    }
}
