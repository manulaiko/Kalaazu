package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class AccountsTechfactoryItem {
    private int id;

    private int accountsId;

    private int techfactoryItemsId;

    private int amount;

    private Date date;

    private Account accountsByAccountsId;

    private TechfactoryItem techfactoryItemsByTechfactoryItemsId;

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

    public int getTechfactoryItemsId() {
        return techfactoryItemsId;
    }

    public void setTechfactoryItemsId(int techfactoryItemsId) {
        this.techfactoryItemsId = techfactoryItemsId;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
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
        AccountsTechfactoryItem that = (AccountsTechfactoryItem) o;
        return id == that.id &&
               accountsId == that.accountsId &&
               techfactoryItemsId == that.techfactoryItemsId &&
               amount == that.amount &&
               Objects.equals(date, that.date);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, accountsId, techfactoryItemsId, amount, date);
    }

    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }

    public TechfactoryItem getTechfactoryItemsByTechfactoryItemsId() {
        return techfactoryItemsByTechfactoryItemsId;
    }

    public void setTechfactoryItemsByTechfactoryItemsId(
            TechfactoryItem techfactoryItemsByTechfactoryItemsId
    ) {
        this.techfactoryItemsByTechfactoryItemsId = techfactoryItemsByTechfactoryItemsId;
    }
}
