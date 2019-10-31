package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "rewards_vouchers", schema = "kalaazu", catalog = "")
public class RewardsVouchersEntity {
    private short         id;
    private RewardsEntity rewardsByRewardsId;

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
        RewardsVouchersEntity that = (RewardsVouchersEntity) o;
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
