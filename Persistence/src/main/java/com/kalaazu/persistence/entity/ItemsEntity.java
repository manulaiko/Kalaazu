package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "items", schema = "kalaazu", catalog = "")
public class ItemsEntity {
    private short  id;
    private String name;
    private byte   category;
    private String description;
    private int    price;
    private byte   type;
    private byte   isElite;
    private byte   isEvent;
    private byte   isBuyable;

    @Id
    @Column(name = "id", nullable = false)
    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "category", nullable = false)
    public byte getCategory() {
        return category;
    }

    public void setCategory(byte category) {
        this.category = category;
    }

    @Basic
    @Column(name = "description", nullable = false, length = -1)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    @Basic
    @Column(name = "is_elite", nullable = false)
    public byte getIsElite() {
        return isElite;
    }

    public void setIsElite(byte isElite) {
        this.isElite = isElite;
    }

    @Basic
    @Column(name = "is_event", nullable = false)
    public byte getIsEvent() {
        return isEvent;
    }

    public void setIsEvent(byte isEvent) {
        this.isEvent = isEvent;
    }

    @Basic
    @Column(name = "is_buyable", nullable = false)
    public byte getIsBuyable() {
        return isBuyable;
    }

    public void setIsBuyable(byte isBuyable) {
        this.isBuyable = isBuyable;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ItemsEntity that = (ItemsEntity) o;
        return id == that.id &&
               category == that.category &&
               price == that.price &&
               type == that.type &&
               isElite == that.isElite &&
               isEvent == that.isEvent &&
               isBuyable == that.isBuyable &&
               Objects.equals(name, that.name) &&
               Objects.equals(description, that.description);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, category, description, price, type, isElite, isEvent, isBuyable);
    }
}
