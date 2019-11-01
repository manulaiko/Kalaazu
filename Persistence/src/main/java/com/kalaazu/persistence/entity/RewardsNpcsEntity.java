package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Rewards npcs entity.
 * ====================
 *
 * Entity for the `rewards_npcs` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "rewards_npcs", schema = "kalaazu")
@Data
public class RewardsNpcsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private short id;

    @ManyToOne
    @JoinColumn(name = "npcs_id", referencedColumnName = "id", nullable = false)
    private NpcsEntity npcsByNpcsId;

    @ManyToOne
    @JoinColumn(name = "rewards_id", referencedColumnName = "id", nullable = false)
    private RewardsEntity rewardsByRewardsId;
}
