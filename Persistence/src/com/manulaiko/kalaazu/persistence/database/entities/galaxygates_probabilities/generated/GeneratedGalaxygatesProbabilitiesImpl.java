package com.manulaiko.kalaazu.persistence.database.entities.galaxygates_probabilities.generated;

import com.manulaiko.kalaazu.persistence.database.entities.galaxygates.Galaxygates;
import com.manulaiko.kalaazu.persistence.database.entities.galaxygates_probabilities.GalaxygatesProbabilities;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.core.manager.Manager;
import java.math.BigDecimal;
import java.util.Objects;
import java.util.StringJoiner;

/**
 * The generated base implementation of the {@link
 * com.manulaiko.kalaazu.persistence.database.entities.galaxygates_probabilities.GalaxygatesProbabilities}-interface.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedGalaxygatesProbabilitiesImpl implements GalaxygatesProbabilities {
    
    private int id;
    private int galaxygatesId;
    private int type;
    private BigDecimal probability;
    
    protected GeneratedGalaxygatesProbabilitiesImpl() {
        
    }
    
    @Override
    public int getId() {
        return id;
    }
    
    @Override
    public int getGalaxygatesId() {
        return galaxygatesId;
    }
    
    @Override
    public int getType() {
        return type;
    }
    
    @Override
    public BigDecimal getProbability() {
        return probability;
    }
    
    @Override
    public GalaxygatesProbabilities setId(int id) {
        this.id = id;
        return this;
    }
    
    @Override
    public GalaxygatesProbabilities setGalaxygatesId(int galaxygatesId) {
        this.galaxygatesId = galaxygatesId;
        return this;
    }
    
    @Override
    public GalaxygatesProbabilities setType(int type) {
        this.type = type;
        return this;
    }
    
    @Override
    public GalaxygatesProbabilities setProbability(BigDecimal probability) {
        this.probability = probability;
        return this;
    }
    
    @Override
    public Galaxygates findGalaxygatesId(Manager<Galaxygates> foreignManager) {
        return foreignManager.stream().filter(Galaxygates.ID.equal(getGalaxygatesId())).findAny().orElse(null);
    }
    
    @Override
    public String toString() {
        final StringJoiner sj = new StringJoiner(", ", "{ ", " }");
        sj.add("id = "            + Objects.toString(getId()));
        sj.add("galaxygatesId = " + Objects.toString(getGalaxygatesId()));
        sj.add("type = "          + Objects.toString(getType()));
        sj.add("probability = "   + Objects.toString(getProbability()));
        return "GalaxygatesProbabilitiesImpl " + sj.toString();
    }
    
    @Override
    public boolean equals(Object that) {
        if (this == that) { return true; }
        if (!(that instanceof GalaxygatesProbabilities)) { return false; }
        final GalaxygatesProbabilities thatGalaxygatesProbabilities = (GalaxygatesProbabilities)that;
        if (this.getId() != thatGalaxygatesProbabilities.getId()) {return false; }
        if (this.getGalaxygatesId() != thatGalaxygatesProbabilities.getGalaxygatesId()) {return false; }
        if (this.getType() != thatGalaxygatesProbabilities.getType()) {return false; }
        if (!Objects.equals(this.getProbability(), thatGalaxygatesProbabilities.getProbability())) {return false; }
        return true;
    }
    
    @Override
    public int hashCode() {
        int hash = 7;
        hash = 31 * hash + Integer.hashCode(getId());
        hash = 31 * hash + Integer.hashCode(getGalaxygatesId());
        hash = 31 * hash + Integer.hashCode(getType());
        hash = 31 * hash + Objects.hashCode(getProbability());
        return hash;
    }
}