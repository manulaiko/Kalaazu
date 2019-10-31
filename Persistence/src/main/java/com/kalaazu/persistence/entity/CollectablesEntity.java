package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "collectables", schema = "kalaazu", catalog = "")
public class CollectablesEntity {
    private byte   id;
    private byte   gfx;
    private byte   type;
    private String name;

    @Id
    @Column(name = "id", nullable = false)
    public byte getId() {
        return id;
    }

    public void setId(byte id) {
        this.id = id;
    }

    @Basic
    @Column(name = "gfx", nullable = false)
    public byte getGfx() {
        return gfx;
    }

    public void setGfx(byte gfx) {
        this.gfx = gfx;
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
    @Column(name = "name", nullable = false, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        CollectablesEntity that = (CollectablesEntity) o;
        return id == that.id &&
               gfx == that.gfx &&
               type == that.type &&
               Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, gfx, type, name);
    }
}
