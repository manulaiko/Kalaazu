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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "accounts_configurations_id", referencedColumnName = "id", nullable = false)
    private AccountsConfigurationsEntity accountsConfigurationsByAccountsConfigurationsId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "accounts_items_id", referencedColumnName = "id")
    private AccountsItemsEntity accountsItemsByAccountsItemsId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "accounts_drones_id", referencedColumnName = "id")
    private AccountsDronesEntity accountsDronesByAccountsDronesId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "accounts_pets_id", referencedColumnName = "id")
    private AccountsPetsEntity accountsPetsByAccountsPetsId;
}
