package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "galaxygates", schema = "kalaazu", catalog = "")
public class GalaxygatesEntity {
    private byte   id;
    private String name;
    private byte   parts;

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
    @Column(name = "parts", nullable = false)
    public byte getParts() {
        return parts;
    }

    public void setParts(byte parts) {
        this.parts = parts;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        GalaxygatesEntity that = (GalaxygatesEntity) o;
        return id == that.id &&
               parts == that.parts &&
               Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, parts);
    }
}
