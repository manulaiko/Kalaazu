package com.manulaiko.kalaazu.persistence.database.entities.maps.generated;

import com.manulaiko.kalaazu.persistence.database.entities.factions.Factions;
import com.manulaiko.kalaazu.persistence.database.entities.maps.Maps;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.core.manager.Manager;
import com.speedment.runtime.core.util.OptionalUtil;
import java.util.Objects;
import java.util.Optional;
import java.util.OptionalInt;
import java.util.StringJoiner;

/**
 * The generated base implementation of the {@link
 * com.manulaiko.kalaazu.persistence.database.entities.maps.Maps}-interface.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedMapsImpl implements Maps {
    
    private int id;
    private String name;
    private Integer factionsId;
    private boolean isPvp;
    private boolean isStarter;
    private String limits;
    
    protected GeneratedMapsImpl() {
        
    }
    
    @Override
    public int getId() {
        return id;
    }
    
    @Override
    public String getName() {
        return name;
    }
    
    @Override
    public OptionalInt getFactionsId() {
        return OptionalUtil.ofNullable(factionsId);
    }
    
    @Override
    public boolean getIsPvp() {
        return isPvp;
    }
    
    @Override
    public boolean getIsStarter() {
        return isStarter;
    }
    
    @Override
    public String getLimits() {
        return limits;
    }
    
    @Override
    public Maps setId(int id) {
        this.id = id;
        return this;
    }
    
    @Override
    public Maps setName(String name) {
        this.name = name;
        return this;
    }
    
    @Override
    public Maps setFactionsId(Integer factionsId) {
        this.factionsId = factionsId;
        return this;
    }
    
    @Override
    public Maps setIsPvp(boolean isPvp) {
        this.isPvp = isPvp;
        return this;
    }
    
    @Override
    public Maps setIsStarter(boolean isStarter) {
        this.isStarter = isStarter;
        return this;
    }
    
    @Override
    public Maps setLimits(String limits) {
        this.limits = limits;
        return this;
    }
    
    @Override
    public Optional<Factions> findFactionsId(Manager<Factions> foreignManager) {
        if (getFactionsId().isPresent()) {
            return foreignManager.stream().filter(Factions.ID.equal(getFactionsId().getAsInt())).findAny();
        } else {
            return Optional.empty();
        }
    }
    
    @Override
    public String toString() {
        final StringJoiner sj = new StringJoiner(", ", "{ ", " }");
        sj.add("id = "         + Objects.toString(getId()));
        sj.add("name = "       + Objects.toString(getName()));
        sj.add("factionsId = " + Objects.toString(OptionalUtil.unwrap(getFactionsId())));
        sj.add("isPvp = "      + Objects.toString(getIsPvp()));
        sj.add("isStarter = "  + Objects.toString(getIsStarter()));
        sj.add("limits = "     + Objects.toString(getLimits()));
        return "MapsImpl " + sj.toString();
    }
    
    @Override
    public boolean equals(Object that) {
        if (this == that) { return true; }
        if (!(that instanceof Maps)) { return false; }
        final Maps thatMaps = (Maps)that;
        if (this.getId() != thatMaps.getId()) {return false; }
        if (!Objects.equals(this.getName(), thatMaps.getName())) {return false; }
        if (!Objects.equals(this.getFactionsId(), thatMaps.getFactionsId())) {return false; }
        if (this.getIsPvp() != thatMaps.getIsPvp()) {return false; }
        if (this.getIsStarter() != thatMaps.getIsStarter()) {return false; }
        if (!Objects.equals(this.getLimits(), thatMaps.getLimits())) {return false; }
        return true;
    }
    
    @Override
    public int hashCode() {
        int hash = 7;
        hash = 31 * hash + Integer.hashCode(getId());
        hash = 31 * hash + Objects.hashCode(getName());
        hash = 31 * hash + Objects.hashCode(getFactionsId());
        hash = 31 * hash + Boolean.hashCode(getIsPvp());
        hash = 31 * hash + Boolean.hashCode(getIsStarter());
        hash = 31 * hash + Objects.hashCode(getLimits());
        return hash;
    }
}