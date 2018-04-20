package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_techfactory_items", schema = "kalaazu")
public class AccountsTechfactoryItem {
    private int id;

    private int accountsId;

    private int techfactoryItemsId;

    private int amount;

    private Date date;

    private Account accountsByAccountsId;

    private TechfactoryItem techfactoryItemsByTechfactoryItemsId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "accounts_id")
    public int getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(int accountsId) {
        this.accountsId = accountsId;
    }

    @Basic
    @Column(name = "techfactory_items_id")
    public int getTechfactoryItemsId() {
        return techfactoryItemsId;
    }

    public void setTechfactoryItemsId(int techfactoryItemsId) {
        this.techfactoryItemsId = techfactoryItemsId;
    }

    @Basic
    @Column(name = "amount")
    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Basic
    @Column(name = "date")
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

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }

    @ManyToOne
    @JoinColumn(name = "techfactory_items_id", referencedColumnName = "id", nullable = false)
    public TechfactoryItem getTechfactoryItemsByTechfactoryItemsId() {
        return techfactoryItemsByTechfactoryItemsId;
    }

    public void setTechfactoryItemsByTechfactoryItemsId(
            TechfactoryItem techfactoryItemsByTechfactoryItemsId
    ) {
        this.techfactoryItemsByTechfactoryItemsId = techfactoryItemsByTechfactoryItemsId;
    }
}
