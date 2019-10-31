package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "galaxygates_probabilities", schema = "kalaazu", catalog = "")
public class GalaxygatesProbabilitiesEntity {
    private byte              id;
    private byte              type;
    private double            probability;
    private GalaxygatesEntity galaxygatesByGalaxygatesId;

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

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        GalaxygatesProbabilitiesEntity that = (GalaxygatesProbabilitiesEntity) o;
        return id == that.id &&
               type == that.type &&
               Double.compare(that.probability, probability) == 0;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, type, probability);
    }

    @ManyToOne
    @JoinColumn(name = "galaxygates_id", referencedColumnName = "id", nullable = false)
    public GalaxygatesEntity getGalaxygatesByGalaxygatesId() {
        return galaxygatesByGalaxygatesId;
    }

    public void setGalaxygatesByGalaxygatesId(GalaxygatesEntity galaxygatesByGalaxygatesId) {
        this.galaxygatesByGalaxygatesId = galaxygatesByGalaxygatesId;
    }
}
