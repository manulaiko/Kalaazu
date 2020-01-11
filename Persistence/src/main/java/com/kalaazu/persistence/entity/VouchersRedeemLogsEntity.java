package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Vouchers redeem logs entity.
 * ============================
 *
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
    private Timestamp date;

    @ManyToOne
    @JoinColumn(name = "vouchers_id", referencedColumnName = "id", nullable = false)
    private VouchersEntity vouchersByVouchersId;

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;
}
