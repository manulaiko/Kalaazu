package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;

/**
 * Vouchers redeem logs entity.
 * ============================
 * <p>
 * Entity for the `vouchers_redeem_logs` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "vouchers_redeem_logs", schema = "kalaazu")
@Data
public class VouchersRedeemLogsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "date", nullable = false)
    @CreationTimestamp
    private Timestamp date;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "vouchers_id", referencedColumnName = "id", nullable = false)
    private VouchersEntity vouchersByVouchersId;

    @Basic
    @Column(name = "vouchers_id", nullable = false, insertable = false, updatable = false)
    private short vouchersId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @Basic
    @Column(name = "accounts_id", nullable = false, insertable = false, updatable = false)
    private int accountsId = 0;
}
