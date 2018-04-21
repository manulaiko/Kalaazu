package com.manulaiko.kalaazu.persistence.database.entities;


import java.math.BigDecimal;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class GalaxygatesSpin {
    private int id;

    private String type;

    private BigDecimal probability;

    private int itemsId;

    private int amount;

    private Collection<GalaxygatesGgSpin> galaxygatesGgSpinsById;

    private Item itemsByItemsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public BigDecimal getProbability() {
        return probability;
    }

    public void setProbability(BigDecimal probability) {
        this.probability = probability;
    }

    public int getItemsId() {
        return itemsId;
    }

    public void setItemsId(int itemsId) {
        this.itemsId = itemsId;
    }

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

    public Collection<GalaxygatesGgSpin> getGalaxygatesGgSpinsById() {
        return galaxygatesGgSpinsById;
    }

    public void setGalaxygatesGgSpinsById(
            Collection<GalaxygatesGgSpin> galaxygatesGgSpinsById
    ) {
        this.galaxygatesGgSpinsById = galaxygatesGgSpinsById;
    }

    public Item getItemsByItemsId() {
        return itemsByItemsId;
    }

    public void setItemsByItemsId(Item itemsByItemsId) {
        this.itemsByItemsId = itemsByItemsId;
    }
}
