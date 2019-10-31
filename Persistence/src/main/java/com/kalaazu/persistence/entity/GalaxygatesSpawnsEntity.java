package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "galaxygates_spawns", schema = "kalaazu", catalog = "")
public class GalaxygatesSpawnsEntity {
    private int  id;
    private byte amount;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "amount", nullable = false)
    public byte getAmount() {
        return amount;
    }

    public void setAmount(byte amount) {
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
        GalaxygatesSpawnsEntity that = (GalaxygatesSpawnsEntity) o;
        return id == that.id &&
               amount == that.amount;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, amount);
    }
}
