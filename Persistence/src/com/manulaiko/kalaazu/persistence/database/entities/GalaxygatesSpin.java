package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "galaxygates_spins", schema = "kalaazu")
public class GalaxygatesSpin {
    private int id;

    private String type;

    private BigDecimal probability;

    private int itemsId;

    private int amount;

    private Collection<GalaxygatesGgSpin> galaxygatesGgSpinsById;

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
    @Column(name = "type")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "probability")
    public BigDecimal getProbability() {
        return probability;
    }

    public void setProbability(BigDecimal probability) {
        this.probability = probability;
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
        GalaxygatesSpin that = (GalaxygatesSpin) o;
        return id == that.id &&
               itemsId == that.itemsId &&
               amount == that.amount &&
               Objects.equals(type, that.type) &&
               Objects.equals(probability, that.probability);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, type, probability, itemsId, amount);
    }

    @OneToMany(mappedBy = "galaxygatesSpinsByGalaxygatesSpinsId")
    public Collection<GalaxygatesGgSpin> getGalaxygatesGgSpinsById() {
        return galaxygatesGgSpinsById;
    }

    public void setGalaxygatesGgSpinsById(
            Collection<GalaxygatesGgSpin> galaxygatesGgSpinsById
    ) {
        this.galaxygatesGgSpinsById = galaxygatesGgSpinsById;
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
