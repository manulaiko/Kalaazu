package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "rewards_ships", schema = "kalaazu", catalog = "")
public class RewardsShipsEntity {
    private byte          id;
    private RewardsEntity rewardsByRewardsId;

    @Id
    @Column(name = "id", nullable = false)
    public byte getId() {
        return id;
    }

    public void setId(byte id) {
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
        RewardsShipsEntity that = (RewardsShipsEntity) o;
        return id == that.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
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
