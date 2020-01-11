package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Accounts destroys entity.
 * =========================
 *
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

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @ManyToOne
    @JoinColumn(name = "ships_id", referencedColumnName = "id", nullable = false)
    private ShipsEntity shipsByShipsId;
}
