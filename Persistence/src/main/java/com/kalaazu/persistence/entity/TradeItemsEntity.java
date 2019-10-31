package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "trade_items", schema = "kalaazu", catalog = "")
public class TradeItemsEntity {
    private short          id;
    private int            price;
    private byte           type;
    private ItemsEntity    itemsByItemsId;
    private AccountsEntity accountsByAccountsId;

    @Id
    @Column(name = "id", nullable = false)
    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    @Basic
    @Column(name = "price", nullable = false)
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Basic
    @Column(name = "type", nullable = false)
    public byte getType() {
        return type;
    }

    public void setType(byte type) {
        this.type = type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        TradeItemsEntity that = (TradeItemsEntity) o;
        return id == that.id &&
               price == that.price &&
               type == that.type;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, price, type);
    }

    @ManyToOne
    @JoinColumn(name = "items_id", referencedColumnName = "id", nullable = false)
    public ItemsEntity getItemsByItemsId() {
        return itemsByItemsId;
    }

    public void setItemsByItemsId(ItemsEntity itemsByItemsId) {
        this.itemsByItemsId = itemsByItemsId;
    }

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id")
    public AccountsEntity getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(AccountsEntity accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }
}
