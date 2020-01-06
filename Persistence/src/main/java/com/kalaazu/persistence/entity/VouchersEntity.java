package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Collection;

/**
 * Vouchers entity.
 * ================
 *
 * Entity for the `vouchers` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "vouchers", schema = "kalaazu")
@Data
public class VouchersEntity {
    @Id
    @Column(name = "id", nullable = false)
    private short id;

    @Basic
    @Column(name = "code", nullable = false, length = 32)
    private String code;

    @Basic
    @Column(name = "max", nullable = false)
    private byte max = 1;

    @ManyToMany
    @JoinTable(
            name = "rewards_vouchers",
            joinColumns = @JoinColumn(name = "vouchers_id"),
            inverseJoinColumns = @JoinColumn(name = "rewards_id")
    )
    private Collection<RewardsEntity> rewards;

    @OneToMany(mappedBy = "vouchersByVouchersId")
    private Collection<VouchersRedeemLogsEntity> vouchersRedeemLogs;
}
