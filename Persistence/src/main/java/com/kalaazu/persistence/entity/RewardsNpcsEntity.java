package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "rewards_npcs", schema = "kalaazu", catalog = "")
public class RewardsNpcsEntity {
    private short         id;
    private NpcsEntity    npcsByNpcsId;
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
        RewardsNpcsEntity that = (RewardsNpcsEntity) o;
        return id == that.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @ManyToOne
    @JoinColumn(name = "npcs_id", referencedColumnName = "id", nullable = false)
    public NpcsEntity getNpcsByNpcsId() {
        return npcsByNpcsId;
    }

    public void setNpcsByNpcsId(NpcsEntity npcsByNpcsId) {
        this.npcsByNpcsId = npcsByNpcsId;
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
