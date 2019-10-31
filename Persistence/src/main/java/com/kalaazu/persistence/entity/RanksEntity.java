package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "ranks", schema = "kalaazu", catalog = "")
public class RanksEntity {
    private byte   id;
    private String name;
    private double percentaje;
    private byte   isPublic;

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
    @Column(name = "percentaje", nullable = false, precision = 0)
    public double getPercentaje() {
        return percentaje;
    }

    public void setPercentaje(double percentaje) {
        this.percentaje = percentaje;
    }

    @Basic
    @Column(name = "is_public", nullable = false)
    public byte getIsPublic() {
        return isPublic;
    }

    public void setIsPublic(byte isPublic) {
        this.isPublic = isPublic;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        RanksEntity that = (RanksEntity) o;
        return id == that.id &&
               Double.compare(that.percentaje, percentaje) == 0 &&
               isPublic == that.isPublic &&
               Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, percentaje, isPublic);
    }
}
