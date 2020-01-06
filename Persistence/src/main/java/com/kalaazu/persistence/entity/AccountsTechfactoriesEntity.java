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
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "slot_unlock_price", nullable = false)
    private int slotUnlockPrice;

    @Basic
    @Column(name = "slot_unlock_factor", nullable = false)
    private byte slotUnlockFactor;

    @Basic
    @Column(name = "slots", nullable = false)
    private byte slots;

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;
}
