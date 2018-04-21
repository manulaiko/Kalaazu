package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class AccountsConfigurationsAccountsItem {
    private int id;
    private int accountsConfigurationsId;
    private int accountsItemsId;
    private int accountsDronesId;
    private int accountsPetsId;

    private AccountsConfiguration accountsConfigurationsByAccountsConfigurationsId;
    private AccountsItem accountsItemsByAccountsItemsId;
    private AccountsDrone accountsDronesByAccountsDronesId;
    private AccountsPet accountsPetsByAccountsPetsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountsConfigurationsId() {
        return accountsConfigurationsId;
    }

    public void setAccountsConfigurationsId(int accountsConfigurationsId) {
        this.accountsConfigurationsId = accountsConfigurationsId;
    }

    public int getAccountsItemsId() {
        return accountsItemsId;
    }

    public void setAccountsItemsId(int accountsItemsId) {
        this.accountsItemsId = accountsItemsId;
    }

    public Integer getAccountsDronesId() {
        return accountsDronesId;
    }

    public void setAccountsDronesId(Integer accountsDronesId) {
        this.accountsDronesId = accountsDronesId;
    }

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

    public AccountsConfiguration getAccountsConfigurationsByAccountsConfigurationsId() {
        return accountsConfigurationsByAccountsConfigurationsId;
    }

    public void setAccountsConfigurationsByAccountsConfigurationsId(
            AccountsConfiguration accountsConfigurationsByAccountsConfigurationsId
    ) {
        this.accountsConfigurationsByAccountsConfigurationsId = accountsConfigurationsByAccountsConfigurationsId;
    }

    public AccountsItem getAccountsItemsByAccountsItemsId() {
        return accountsItemsByAccountsItemsId;
    }

    public void setAccountsItemsByAccountsItemsId(
            AccountsItem accountsItemsByAccountsItemsId
    ) {
        this.accountsItemsByAccountsItemsId = accountsItemsByAccountsItemsId;
    }

    public AccountsDrone getAccountsDronesByAccountsDronesId() {
        return accountsDronesByAccountsDronesId;
    }

    public void setAccountsDronesByAccountsDronesId(
            AccountsDrone accountsDronesByAccountsDronesId
    ) {
        this.accountsDronesByAccountsDronesId = accountsDronesByAccountsDronesId;
    }

    public AccountsPet getAccountsPetsByAccountsPetsId() {
        return accountsPetsByAccountsPetsId;
    }

    public void setAccountsPetsByAccountsPetsId(
            AccountsPet accountsPetsByAccountsPetsId
    ) {
        this.accountsPetsByAccountsPetsId = accountsPetsByAccountsPetsId;
    }
}
