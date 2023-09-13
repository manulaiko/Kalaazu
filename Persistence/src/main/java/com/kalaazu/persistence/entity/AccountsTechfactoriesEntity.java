package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Accounts techfactories entity.
 * ==============================
 * <p>
 * Entity for the `accounts_techfactories` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_techfactories", schema = "kalaazu")
@Data
public class AccountsTechfactoriesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "slot_unlock_price", nullable = false)
    private int slotUnlockPrice = 50000;

    @Basic
    @Column(name = "slot_unlock_factor", nullable = false)
    private byte slotUnlockFactor = 2;

    @Basic
    @Column(name = "slots", nullable = false)
    private byte slots = 1;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @Basic
    @Column(name= "accounts_id", nullable = false, insertable = false, updatable = false)
    private int accountsId = 0;
}
