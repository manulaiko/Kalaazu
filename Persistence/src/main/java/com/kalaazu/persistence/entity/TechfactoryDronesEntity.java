package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "techfactory_drones", schema = "kalaazu", catalog = "")
public class TechfactoryDronesEntity {
    private byte   id;
    private String name;
    private String description;
    private byte   time;
    private byte   parts;
    private int    price;
    private byte   factor;

    @Id
    @Column(name = "id", nullable = false)
    public byte getId() {
        return id;
    }

    public void setId(byte id) {
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
    @Column(name = "description", nullable = false, length = -1)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "time", nullable = false)
    public byte getTime() {
        return time;
    }

    public void setTime(byte time) {
        this.time = time;
    }

    @Basic
    @Column(name = "parts", nullable = false)
    public byte getParts() {
        return parts;
    }

    public void setParts(byte parts) {
        this.parts = parts;
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
    @Column(name = "factor", nullable = false)
    public byte getFactor() {
        return factor;
    }

    public void setFactor(byte factor) {
        this.factor = factor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        TechfactoryDronesEntity that = (TechfactoryDronesEntity) o;
        return id == that.id &&
               time == that.time &&
               parts == that.parts &&
               price == that.price &&
               factor == that.factor &&
               Objects.equals(name, that.name) &&
               Objects.equals(description, that.description);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, description, time, parts, price, factor);
    }
}
