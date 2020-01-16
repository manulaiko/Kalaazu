package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

/**
 * Accounts hangars entity.
 * ========================
 *
 * Entity for the `accounts_hangars` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_hangars", schema = "kalaazu")
@Data
public class AccountsHangarsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name = "HANGAR";

    @Basic
    @Column(name = "priority")
    private byte priority = -1;

    @Basic
    @Column(name = "date", nullable = false)
    private Timestamp date;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accounts_ships_id", referencedColumnName = "id", nullable = false)
    private AccountsShipsEntity accountsShipsByAccountsShipsId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accounts_configurations_id", referencedColumnName = "id", nullable = false)
    private AccountsConfigurationsEntity accountsConfigurationsByAccountsConfigurationsId;

    @OneToMany(mappedBy = "accountsHangarsByAccountsHangarsId", fetch = FetchType.LAZY)
    private Collection<AccountsConfigurationsEntity> accountsConfigurations;
}
