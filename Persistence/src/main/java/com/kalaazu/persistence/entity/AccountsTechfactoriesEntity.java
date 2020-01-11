package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Accounts techfactories entity.
 * ==============================
 *
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

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;
}
