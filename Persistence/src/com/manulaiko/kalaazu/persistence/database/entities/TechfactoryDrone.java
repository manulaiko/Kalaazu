package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "techfactory_drones", schema = "kalaazu")
public class TechfactoryDrone {
    private int id;

    private String name;

    private String description;

    private int time;

    private byte parts;

    private int price;

    private BigDecimal factor;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "time")
    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    @Basic
    @Column(name = "parts")
    public byte getParts() {
        return parts;
    }

    public void setParts(byte parts) {
        this.parts = parts;
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
    @Column(name = "factor")
    public BigDecimal getFactor() {
        return factor;
    }

    public void setFactor(BigDecimal factor) {
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
        TechfactoryDrone that = (TechfactoryDrone) o;
        return id == that.id &&
               time == that.time &&
               parts == that.parts &&
               price == that.price &&
               Objects.equals(name, that.name) &&
               Objects.equals(description, that.description) &&
               Objects.equals(factor, that.factor);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, description, time, parts, price, factor);
    }
}
