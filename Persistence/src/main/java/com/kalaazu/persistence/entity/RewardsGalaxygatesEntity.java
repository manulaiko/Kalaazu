package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "rewards_galaxygates", schema = "kalaazu", catalog = "")
public class RewardsGalaxygatesEntity {
    private byte              id;
    private GalaxygatesEntity galaxygatesByGalaxygatesId;
    private RewardsEntity     rewardsByRewardsId;

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
        RewardsGalaxygatesEntity that = (RewardsGalaxygatesEntity) o;
        return id == that.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @ManyToOne
    @JoinColumn(name = "galaxygates_id", referencedColumnName = "id", nullable = false)
    public GalaxygatesEntity getGalaxygatesByGalaxygatesId() {
        return galaxygatesByGalaxygatesId;
    }

    public void setGalaxygatesByGalaxygatesId(GalaxygatesEntity galaxygatesByGalaxygatesId) {
        this.galaxygatesByGalaxygatesId = galaxygatesByGalaxygatesId;
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
