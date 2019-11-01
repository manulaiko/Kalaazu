package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Accounts configurations accounts items entity.
 * ==============================================
 *
 * Entity for the `accounts_configurations_accounts_items` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_configurations_accounts_items", schema = "kalaazu")
@Data
public class AccountsConfigurationsAccountsItemsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @ManyToOne
    @JoinColumn(name = "accounts_configurations_id", referencedColumnName = "id", nullable = false)
    private AccountsConfigurationsEntity accountsConfigurationsByAccountsConfigurationsId;

    @ManyToOne
    @JoinColumn(name = "accounts_items_id", referencedColumnName = "id")
    private AccountsItemsEntity accountsItemsByAccountsItemsId;

    @ManyToOne
    @JoinColumn(name = "accounts_drones_id", referencedColumnName = "id")
    private AccountsDronesEntity accountsDronesByAccountsDronesId;

    @ManyToOne
    @JoinColumn(name = "accounts_pets_id", referencedColumnName = "id")
    private AccountsPetsEntity accountsPetsByAccountsPetsId;
}
