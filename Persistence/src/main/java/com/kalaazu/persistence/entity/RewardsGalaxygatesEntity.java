package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Rewards galaxygates entity.
 * ===========================
 *
 * Entity for the `rewards_galaxygates` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "rewards_galaxygates", schema = "kalaazu")
@Data
public class RewardsGalaxygatesEntity {
    @Id
    @Column(name = "id", nullable = false)
    private byte id;

    @ManyToOne
    @JoinColumn(name = "galaxygates_id", referencedColumnName = "id", nullable = false)
    private GalaxygatesEntity galaxygatesByGalaxygatesId;

    @ManyToOne
    @JoinColumn(name = "rewards_id", referencedColumnName = "id", nullable = false)
    private RewardsEntity rewardsByRewardsId;
}
