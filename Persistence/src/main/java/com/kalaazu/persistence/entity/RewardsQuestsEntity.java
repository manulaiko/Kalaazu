package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Rewards quests entity.
 * ======================
 *
 * Entity for the `rewards_quests` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "rewards_quests", schema = "kalaazu")
@Data
public class RewardsQuestsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private short id;

    @ManyToOne
    @JoinColumn(name = "quests_id", referencedColumnName = "id", nullable = false)
    private QuestsEntity questsByQuestsId;

    @ManyToOne
    @JoinColumn(name = "rewards_id", referencedColumnName = "id", nullable = false)
    private RewardsEntity rewardsByRewardsId;
}
