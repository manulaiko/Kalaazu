package com.manulaiko.kalaazu.persistence.database.entities;


import java.math.BigDecimal;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class TechfactoryDrone {
    private int id;

    private String name;

    private String description;

    private int time;

    private byte parts;

    private int price;

    private BigDecimal factor;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public byte getParts() {
        return parts;
    }

    public void setParts(byte parts) {
        this.parts = parts;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

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
