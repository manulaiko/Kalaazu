package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "techfactory_costs", schema = "kalaazu", catalog = "")
public class TechfactoryCostsEntity {
    private byte        id;
    private int         amount;
    private ItemsEntity itemsByItemsId;

    @Id
    @Column(name = "id", nullable = false)
    public byte getId() {
        return id;
    }

    public void setId(byte id) {
        this.id = id;
    }

    @Basic
    @Column(name = "amount", nullable = false)
    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        TechfactoryCostsEntity that = (TechfactoryCostsEntity) o;
        return id == that.id &&
               amount == that.amount;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, amount);
    }

    @ManyToOne
    @JoinColumn(name = "items_id", referencedColumnName = "id", nullable = false)
    public ItemsEntity getItemsByItemsId() {
        return itemsByItemsId;
    }

    public void setItemsByItemsId(ItemsEntity itemsByItemsId) {
        this.itemsByItemsId = itemsByItemsId;
    }
}
