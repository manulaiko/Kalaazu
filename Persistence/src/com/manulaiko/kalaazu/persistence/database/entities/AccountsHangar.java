package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Date;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class AccountsHangar {
    private int id;

    private int accountsId;

    private Integer accountsShipsId;

    private Integer accountsConfigurationsId;

    private String name;

    private Integer priority;

    private Date date;

    private Collection<Account> accountsById;

    private Collection<AccountsConfiguration> accountsConfigurationsById;

    private Account accountsByAccountsId;

    private AccountsShip accountsShipsByAccountsShipsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(int accountsId) {
        this.accountsId = accountsId;
    }

    public Integer getAccountsShipsId() {
        return accountsShipsId;
    }

    public void setAccountsShipsId(Integer accountsShipsId) {
        this.accountsShipsId = accountsShipsId;
    }

    public Integer getAccountsConfigurationsId() {
        return accountsConfigurationsId;
    }

    public void setAccountsConfigurationsId(Integer accountsConfigurationsId) {
        this.accountsConfigurationsId = accountsConfigurationsId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AccountsHangar that = (AccountsHangar) o;
        return id == that.id &&
               accountsId == that.accountsId &&
               Objects.equals(accountsShipsId, that.accountsShipsId) &&
               Objects.equals(accountsConfigurationsId, that.accountsConfigurationsId) &&
               Objects.equals(name, that.name) &&
               Objects.equals(priority, that.priority) &&
               Objects.equals(date, that.date);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, accountsId, accountsShipsId, accountsConfigurationsId, name, priority, date);
    }

    public Collection<Account> getAccountsById() {
        return accountsById;
    }

    public void setAccountsById(Collection<Account> accountsById) {
        this.accountsById = accountsById;
    }

    public Collection<AccountsConfiguration> getAccountsConfigurationsById() {
        return accountsConfigurationsById;
    }

    public void setAccountsConfigurationsById(
            Collection<AccountsConfiguration> accountsConfigurationsById
    ) {
        this.accountsConfigurationsById = accountsConfigurationsById;
    }

    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }

    public AccountsShip getAccountsShipsByAccountsShipsId() {
        return accountsShipsByAccountsShipsId;
    }

    public void setAccountsShipsByAccountsShipsId(
            AccountsShip accountsShipsByAccountsShipsId
    ) {
        this.accountsShipsByAccountsShipsId = accountsShipsByAccountsShipsId;
    }
}
