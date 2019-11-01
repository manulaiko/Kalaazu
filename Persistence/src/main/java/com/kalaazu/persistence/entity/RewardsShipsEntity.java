package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Rewards ships entity.
 * =====================
 *
 * Entity for the `rewards_ships` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "rewards_ships", schema = "kalaazu")
@Data
public class RewardsShipsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private byte id;

    @ManyToOne
    @JoinColumn(name = "rewards_id", referencedColumnName = "id", nullable = false)
    private RewardsEntity rewardsByRewardsId;

    @ManyToOne
    @JoinColumn(name = "ships_id", referencedColumnName = "id", nullable = false)
    private ShipsEntity shipsByShipsId;
}
