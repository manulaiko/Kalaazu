package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "maps_npcs", schema = "kalaazu", catalog = "")
public class MapsNpcsEntity {
    private byte       id;
    private byte       amount;
    private MapsEntity mapsByMapsId;

    @Id
    @Column(name = "id", nullable = false)
    public byte getId() {
        return id;
    }

    public void setId(byte id) {
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
        MapsNpcsEntity that = (MapsNpcsEntity) o;
        return id == that.id &&
               amount == that.amount;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, amount);
    }

    @ManyToOne
    @JoinColumn(name = "maps_id", referencedColumnName = "id", nullable = false)
    public MapsEntity getMapsByMapsId() {
        return mapsByMapsId;
    }

    public void setMapsByMapsId(MapsEntity mapsByMapsId) {
        this.mapsByMapsId = mapsByMapsId;
    }
}
