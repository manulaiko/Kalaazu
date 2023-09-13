package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Accounts configurations accounts items entity.
 * ==============================================
 * <p>
 * Entity for the `accounts_configurations_accounts_items` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_configurations_accounts_items", schema = "kalaazu")
@Data
public class AccountsConfigurationsAccountsItemsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accounts_configurations_id", referencedColumnName = "id", nullable = false)
    private AccountsConfigurationsEntity accountsConfigurationsByAccountsConfigurationsId;

    @Basic
    @Column(name= "accounts_configurations_id", nullable = false, insertable = false, updatable = false)
    private int accountsConfigurationsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accounts_items_id", referencedColumnName = "id")
    private AccountsItemsEntity accountsItemsByAccountsItemsId;

    @Basic
    @Column(name= "accounts_items_id", insertable = false, updatable = false)
    private Integer accountsItemsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accounts_drones_id", referencedColumnName = "id")
    private AccountsDronesEntity accountsDronesByAccountsDronesId;

    @Basic
    @Column(name= "accounts_drones_id", insertable = false, updatable = false)
    private Integer accountsDronesId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accounts_pets_id", referencedColumnName = "id")
    private AccountsPetsEntity accountsPetsByAccountsPetsId;

    @Basic
    @Column(name= "accounts_pets_id", insertable = false, updatable = false)
    private Integer accountsPetsId = 0;
}
