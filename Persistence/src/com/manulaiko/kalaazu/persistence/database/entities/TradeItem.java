package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "trade_items", schema = "kalaazu")
public class TradeItem {
    private int id;

    private int itemsId;

    private Integer accountsId;

    private int price;

    private int category;

    private Item itemsByItemsId;

    private Account accountsByAccountsId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "items_id")
    public int getItemsId() {
        return itemsId;
    }

    public void setItemsId(int itemsId) {
        this.itemsId = itemsId;
    }

    @Basic
    @Column(name = "accounts_id")
    public Integer getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(Integer accountsId) {
        this.accountsId = accountsId;
    }

    @Basic
    @Column(name = "price")
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Basic
    @Column(name = "category")
    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        TradeItem tradeItem = (TradeItem) o;
        return id == tradeItem.id &&
               itemsId == tradeItem.itemsId &&
               price == tradeItem.price &&
               category == tradeItem.category &&
               Objects.equals(accountsId, tradeItem.accountsId);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, itemsId, accountsId, price, category);
    }

    @ManyToOne
    @JoinColumn(name = "items_id", referencedColumnName = "id", nullable = false)
    public Item getItemsByItemsId() {
        return itemsByItemsId;
    }

    public void setItemsByItemsId(Item itemsByItemsId) {
        this.itemsByItemsId = itemsByItemsId;
    }

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id")
    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }
}
