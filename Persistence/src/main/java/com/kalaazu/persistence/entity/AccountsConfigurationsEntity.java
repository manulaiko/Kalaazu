package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Accounts configurations entity.
 * ===============================
 *
 * Entity for the `accounts_configurations` table.
 */
@Entity
@Table(name = "accounts_configurations", schema = "kalaazu")
@Data
public class AccountsConfigurationsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "configuration_id", nullable = false)
    private byte   configurationId;
    @Basic
    @Column(name = "name", nullable = false)
    private String name;

    @Basic
    @Column(name = "shield", nullable = false)
    private int shield;

    @Basic
    @Column(name = "speed", nullable = false)
    private short speed;

    @Basic
    @Column(name = "damage", nullable = false)
    private int damage;

    @ManyToOne
    @JoinColumn(name = "accounts_hangars_id", referencedColumnName = "id", nullable = false)
    private AccountsHangarsEntity accountsHangarsByAccountsHangarsId;
}
