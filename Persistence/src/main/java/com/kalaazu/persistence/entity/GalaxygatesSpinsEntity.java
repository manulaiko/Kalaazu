package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "galaxygates_spins", schema = "kalaazu", catalog = "")
public class GalaxygatesSpinsEntity {
    private byte   id;
    private byte   type;
    private double probability;
    private short  amount;

    @Id
    @Column(name = "id", nullable = false)
    public byte getId() {
        return id;
    }

    public void setId(byte id) {
        this.id = id;
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
    @Column(name = "probability", nullable = false, precision = 0)
    public double getProbability() {
        return probability;
    }

    public void setProbability(double probability) {
        this.probability = probability;
    }

    @Basic
    @Column(name = "amount", nullable = false)
    public short getAmount() {
        return amount;
    }

    public void setAmount(short amount) {
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
        GalaxygatesSpinsEntity that = (GalaxygatesSpinsEntity) o;
        return id == that.id &&
               type == that.type &&
               Double.compare(that.probability, probability) == 0 &&
               amount == that.amount;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, type, probability, amount);
    }
}
