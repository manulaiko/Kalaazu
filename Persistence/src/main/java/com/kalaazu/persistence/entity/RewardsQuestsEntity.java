package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "rewards_quests", schema = "kalaazu", catalog = "")
public class RewardsQuestsEntity {
    private short         id;
    private QuestsEntity  questsByQuestsId;
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
        RewardsQuestsEntity that = (RewardsQuestsEntity) o;
        return id == that.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @ManyToOne
    @JoinColumn(name = "quests_id", referencedColumnName = "id", nullable = false)
    public QuestsEntity getQuestsByQuestsId() {
        return questsByQuestsId;
    }

    public void setQuestsByQuestsId(QuestsEntity questsByQuestsId) {
        this.questsByQuestsId = questsByQuestsId;
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
