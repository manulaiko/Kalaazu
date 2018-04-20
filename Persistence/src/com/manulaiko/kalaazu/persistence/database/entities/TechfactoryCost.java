package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "techfactory_costs", schema = "kalaazu")
public class TechfactoryCost {
    private int id;

    private int techfactoryItemsId;

    private int itemsId;

    private int amount;

    private TechfactoryItem techfactoryItemsByTechfactoryItemsId;

    private Item itemsByItemsId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    @Column(name = "items_id")
    public int getItemsId() {
        return itemsId;
    }

    public void setItemsId(int itemsId) {
        this.itemsId = itemsId;
    }

    @Basic
    @Column(name = "amount")
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
        TechfactoryCost that = (TechfactoryCost) o;
        return id == that.id &&
               techfactoryItemsId == that.techfactoryItemsId &&
               itemsId == that.itemsId &&
               amount == that.amount;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, techfactoryItemsId, itemsId, amount);
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

    @ManyToOne
    @JoinColumn(name = "items_id", referencedColumnName = "id", nullable = false)
    public Item getItemsByItemsId() {
        return itemsByItemsId;
    }

    public void setItemsByItemsId(Item itemsByItemsId) {
        this.itemsByItemsId = itemsByItemsId;
    }
}
