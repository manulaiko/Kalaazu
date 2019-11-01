package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Rewards collectables entity.
 * ============================
 *
 * Entity for the `rewards_collectables` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "rewards_collectables", schema = "kalaazu")
@Data
public class RewardsCollectablesEntity {
    @Id
    @Column(name = "id", nullable = false)
    private short id;

    @ManyToOne
    @JoinColumn(name = "collectables_id", referencedColumnName = "id", nullable = false)
    private CollectablesEntity collectablesByCollectablesId;

    @ManyToOne
    @JoinColumn(name = "rewards_id", referencedColumnName = "id", nullable = false)
    private RewardsEntity rewardsByRewardsId;
}
