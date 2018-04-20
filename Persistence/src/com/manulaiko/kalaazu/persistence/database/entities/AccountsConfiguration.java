package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_configurations", schema = "kalaazu")
public class AccountsConfiguration {
    private int id;

    private int accountsHangarsId;

    private int configurationId;

    private String name;

    private AccountsHangar accountsHangarsByAccountsHangarsId;

    private Collection<AccountsConfigurationsAccountsItem> accountsConfigurationsAccountsItemsById;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "accounts_hangars_id")
    public int getAccountsHangarsId() {
        return accountsHangarsId;
    }

    public void setAccountsHangarsId(int accountsHangarsId) {
        this.accountsHangarsId = accountsHangarsId;
    }

    @Basic
    @Column(name = "configuration_id")
    public int getConfigurationId() {
        return configurationId;
    }

    public void setConfigurationId(int configurationId) {
        this.configurationId = configurationId;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AccountsConfiguration that = (AccountsConfiguration) o;
        return id == that.id &&
               accountsHangarsId == that.accountsHangarsId &&
               configurationId == that.configurationId &&
               Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, accountsHangarsId, configurationId, name);
    }

    @ManyToOne
    @JoinColumn(name = "accounts_hangars_id", referencedColumnName = "id", nullable = false)
    public AccountsHangar getAccountsHangarsByAccountsHangarsId() {
        return accountsHangarsByAccountsHangarsId;
    }

    public void setAccountsHangarsByAccountsHangarsId(
            AccountsHangar accountsHangarsByAccountsHangarsId
    ) {
        this.accountsHangarsByAccountsHangarsId = accountsHangarsByAccountsHangarsId;
    }

    @OneToMany(mappedBy = "accountsConfigurationsByAccountsConfigurationsId")
    public Collection<AccountsConfigurationsAccountsItem> getAccountsConfigurationsAccountsItemsById() {
        return accountsConfigurationsAccountsItemsById;
    }

    public void setAccountsConfigurationsAccountsItemsById(
            Collection<AccountsConfigurationsAccountsItem> accountsConfigurationsAccountsItemsById
    ) {
        this.accountsConfigurationsAccountsItemsById = accountsConfigurationsAccountsItemsById;
    }
}
