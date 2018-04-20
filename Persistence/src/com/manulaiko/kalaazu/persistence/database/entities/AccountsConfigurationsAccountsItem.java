package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_configurations_accounts_items", schema = "kalaazu")
public class AccountsConfigurationsAccountsItem {
    private int id;

    private int accountsConfigurationsId;

    private int accountsItemsId;

    private Integer accountsDronesId;

    private Integer accountsPetsId;

    private AccountsConfiguration accountsConfigurationsByAccountsConfigurationsId;

    private AccountsItem accountsItemsByAccountsItemsId;

    private AccountsDrone accountsDronesByAccountsDronesId;

    private AccountsPet accountsPetsByAccountsPetsId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "accounts_configurations_id")
    public int getAccountsConfigurationsId() {
        return accountsConfigurationsId;
    }

    public void setAccountsConfigurationsId(int accountsConfigurationsId) {
        this.accountsConfigurationsId = accountsConfigurationsId;
    }

    @Basic
    @Column(name = "accounts_items_id")
    public int getAccountsItemsId() {
        return accountsItemsId;
    }

    public void setAccountsItemsId(int accountsItemsId) {
        this.accountsItemsId = accountsItemsId;
    }

    @Basic
    @Column(name = "accounts_drones_id")
    public Integer getAccountsDronesId() {
        return accountsDronesId;
    }

    public void setAccountsDronesId(Integer accountsDronesId) {
        this.accountsDronesId = accountsDronesId;
    }

    @Basic
    @Column(name = "accounts_pets_id")
    public Integer getAccountsPetsId() {
        return accountsPetsId;
    }

    public void setAccountsPetsId(Integer accountsPetsId) {
        this.accountsPetsId = accountsPetsId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AccountsConfigurationsAccountsItem that = (AccountsConfigurationsAccountsItem) o;
        return id == that.id &&
               accountsConfigurationsId == that.accountsConfigurationsId &&
               accountsItemsId == that.accountsItemsId &&
               Objects.equals(accountsDronesId, that.accountsDronesId) &&
               Objects.equals(accountsPetsId, that.accountsPetsId);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, accountsConfigurationsId, accountsItemsId, accountsDronesId, accountsPetsId);
    }

    @ManyToOne
    @JoinColumn(name = "accounts_configurations_id", referencedColumnName = "id", nullable = false)
    public AccountsConfiguration getAccountsConfigurationsByAccountsConfigurationsId() {
        return accountsConfigurationsByAccountsConfigurationsId;
    }

    public void setAccountsConfigurationsByAccountsConfigurationsId(
            AccountsConfiguration accountsConfigurationsByAccountsConfigurationsId
    ) {
        this.accountsConfigurationsByAccountsConfigurationsId = accountsConfigurationsByAccountsConfigurationsId;
    }

    @ManyToOne
    @JoinColumn(name = "accounts_items_id", referencedColumnName = "id", nullable = false)
    public AccountsItem getAccountsItemsByAccountsItemsId() {
        return accountsItemsByAccountsItemsId;
    }

    public void setAccountsItemsByAccountsItemsId(
            AccountsItem accountsItemsByAccountsItemsId
    ) {
        this.accountsItemsByAccountsItemsId = accountsItemsByAccountsItemsId;
    }

    @ManyToOne
    @JoinColumn(name = "accounts_drones_id", referencedColumnName = "id")
    public AccountsDrone getAccountsDronesByAccountsDronesId() {
        return accountsDronesByAccountsDronesId;
    }

    public void setAccountsDronesByAccountsDronesId(
            AccountsDrone accountsDronesByAccountsDronesId
    ) {
        this.accountsDronesByAccountsDronesId = accountsDronesByAccountsDronesId;
    }

    @ManyToOne
    @JoinColumn(name = "accounts_pets_id", referencedColumnName = "id")
    public AccountsPet getAccountsPetsByAccountsPetsId() {
        return accountsPetsByAccountsPetsId;
    }

    public void setAccountsPetsByAccountsPetsId(
            AccountsPet accountsPetsByAccountsPetsId
    ) {
        this.accountsPetsByAccountsPetsId = accountsPetsByAccountsPetsId;
    }
}
