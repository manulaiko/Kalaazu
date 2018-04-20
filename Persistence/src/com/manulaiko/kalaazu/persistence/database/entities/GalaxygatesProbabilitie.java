package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "galaxygates_probabilities", schema = "kalaazu")
public class GalaxygatesProbabilitie {
    private int id;

    private int galaxygatesId;

    private int type;

    private BigDecimal probability;

    private Galaxygate galaxygatesByGalaxygatesId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "galaxygates_id")
    public int getGalaxygatesId() {
        return galaxygatesId;
    }

    public void setGalaxygatesId(int galaxygatesId) {
        this.galaxygatesId = galaxygatesId;
    }

    @Basic
    @Column(name = "type")
    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    @Basic
    @Column(name = "probability")
    public BigDecimal getProbability() {
        return probability;
    }

    public void setProbability(BigDecimal probability) {
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
        GalaxygatesProbabilitie that = (GalaxygatesProbabilitie) o;
        return id == that.id &&
               galaxygatesId == that.galaxygatesId &&
               type == that.type &&
               Objects.equals(probability, that.probability);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, galaxygatesId, type, probability);
    }

    @ManyToOne
    @JoinColumn(name = "galaxygates_id", referencedColumnName = "id", nullable = false)
    public Galaxygate getGalaxygatesByGalaxygatesId() {
        return galaxygatesByGalaxygatesId;
    }

    public void setGalaxygatesByGalaxygatesId(
            Galaxygate galaxygatesByGalaxygatesId
    ) {
        this.galaxygatesByGalaxygatesId = galaxygatesByGalaxygatesId;
    }
}
