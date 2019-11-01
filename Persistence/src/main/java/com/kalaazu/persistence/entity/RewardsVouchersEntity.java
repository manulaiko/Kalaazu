package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Rewards vouchers entity.
 * ========================
 *
 * Entity for the `rewards_vouchers` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "rewards_vouchers", schema = "kalaazu")
@Data
public class RewardsVouchersEntity {
    @Id
    @Column(name = "id", nullable = false)
    private short id;

    @ManyToOne
    @JoinColumn(name = "rewards_id", referencedColumnName = "id", nullable = false)
    private RewardsEntity rewardsByRewardsId;

    @ManyToOne
    @JoinColumn(name = "vouchers_id", referencedColumnName = "id", nullable = false)
    private VouchersEntity vouchersByVouchersId;
}
