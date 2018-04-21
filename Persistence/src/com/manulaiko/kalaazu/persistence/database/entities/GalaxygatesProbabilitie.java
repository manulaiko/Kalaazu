package com.manulaiko.kalaazu.persistence.database.entities;


import java.math.BigDecimal;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class GalaxygatesProbabilitie {
    private int id;

    private int galaxygatesId;

    private int type;

    private BigDecimal probability;

    private Galaxygate galaxygatesByGalaxygatesId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGalaxygatesId() {
        return galaxygatesId;
    }

    public void setGalaxygatesId(int galaxygatesId) {
        this.galaxygatesId = galaxygatesId;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

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

    public Galaxygate getGalaxygatesByGalaxygatesId() {
        return galaxygatesByGalaxygatesId;
    }

    public void setGalaxygatesByGalaxygatesId(
            Galaxygate galaxygatesByGalaxygatesId
    ) {
        this.galaxygatesByGalaxygatesId = galaxygatesByGalaxygatesId;
    }
}
