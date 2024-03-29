package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Accounts destroys entity.
 * =========================
 * <p>
 * Entity for the `accounts_destroys` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_destroys", schema = "kalaazu")
@Data
public class AccountsDestroysEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "points", nullable = false)
    private short points = 0;

    @Basic
    @Column(name = "amount", nullable = false)
    private short amount = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @Basic
    @Column(name= "accounts_id", nullable = false, insertable = false, updatable = false)
    private int accountsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ships_id", referencedColumnName = "id", nullable = false)
    private ShipsEntity shipsByShipsId;

    @Basic
    @Column(name= "ships_id", nullable = false, insertable = false, updatable = false)
    private byte shipsId = 0;
}
