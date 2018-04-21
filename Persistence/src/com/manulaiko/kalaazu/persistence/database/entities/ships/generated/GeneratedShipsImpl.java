package com.manulaiko.kalaazu.persistence.database.entities.ships.generated;

import com.manulaiko.kalaazu.persistence.database.entities.items.Items;
import com.manulaiko.kalaazu.persistence.database.entities.ships.Ships;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.core.manager.Manager;
import java.util.Objects;
import java.util.StringJoiner;

/**
 * The generated base implementation of the {@link
 * com.manulaiko.kalaazu.persistence.database.entities.ships.Ships}-interface.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedShipsImpl implements Ships {
    
    private int id;
    private int itemsId;
    private int health;
    private int speed;
    private int cargo;
    private int batteries;
    private int rockets;
    private int lasers;
    private int hellstorms;
    private int generators;
    private int extras;
    private int gfx;
    
    protected GeneratedShipsImpl() {
        
    }
    
    @Override
    public int getId() {
        return id;
    }
    
    @Override
    public int getItemsId() {
        return itemsId;
    }
    
    @Override
    public int getHealth() {
        return health;
    }
    
    @Override
    public int getSpeed() {
        return speed;
    }
    
    @Override
    public int getCargo() {
        return cargo;
    }
    
    @Override
    public int getBatteries() {
        return batteries;
    }
    
    @Override
    public int getRockets() {
        return rockets;
    }
    
    @Override
    public int getLasers() {
        return lasers;
    }
    
    @Override
    public int getHellstorms() {
        return hellstorms;
    }
    
    @Override
    public int getGenerators() {
        return generators;
    }
    
    @Override
    public int getExtras() {
        return extras;
    }
    
    @Override
    public int getGfx() {
        return gfx;
    }
    
    @Override
    public Ships setId(int id) {
        this.id = id;
        return this;
    }
    
    @Override
    public Ships setItemsId(int itemsId) {
        this.itemsId = itemsId;
        return this;
    }
    
    @Override
    public Ships setHealth(int health) {
        this.health = health;
        return this;
    }
    
    @Override
    public Ships setSpeed(int speed) {
        this.speed = speed;
        return this;
    }
    
    @Override
    public Ships setCargo(int cargo) {
        this.cargo = cargo;
        return this;
    }
    
    @Override
    public Ships setBatteries(int batteries) {
        this.batteries = batteries;
        return this;
    }
    
    @Override
    public Ships setRockets(int rockets) {
        this.rockets = rockets;
        return this;
    }
    
    @Override
    public Ships setLasers(int lasers) {
        this.lasers = lasers;
        return this;
    }
    
    @Override
    public Ships setHellstorms(int hellstorms) {
        this.hellstorms = hellstorms;
        return this;
    }
    
    @Override
    public Ships setGenerators(int generators) {
        this.generators = generators;
        return this;
    }
    
    @Override
    public Ships setExtras(int extras) {
        this.extras = extras;
        return this;
    }
    
    @Override
    public Ships setGfx(int gfx) {
        this.gfx = gfx;
        return this;
    }
    
    @Override
    public Items findItemsId(Manager<Items> foreignManager) {
        return foreignManager.stream().filter(Items.ID.equal(getItemsId())).findAny().orElse(null);
    }
    
    @Override
    public String toString() {
        final StringJoiner sj = new StringJoiner(", ", "{ ", " }");
        sj.add("id = "         + Objects.toString(getId()));
        sj.add("itemsId = "    + Objects.toString(getItemsId()));
        sj.add("health = "     + Objects.toString(getHealth()));
        sj.add("speed = "      + Objects.toString(getSpeed()));
        sj.add("cargo = "      + Objects.toString(getCargo()));
        sj.add("batteries = "  + Objects.toString(getBatteries()));
        sj.add("rockets = "    + Objects.toString(getRockets()));
        sj.add("lasers = "     + Objects.toString(getLasers()));
        sj.add("hellstorms = " + Objects.toString(getHellstorms()));
        sj.add("generators = " + Objects.toString(getGenerators()));
        sj.add("extras = "     + Objects.toString(getExtras()));
        sj.add("gfx = "        + Objects.toString(getGfx()));
        return "ShipsImpl " + sj.toString();
    }
    
    @Override
    public boolean equals(Object that) {
        if (this == that) { return true; }
        if (!(that instanceof Ships)) { return false; }
        final Ships thatShips = (Ships)that;
        if (this.getId() != thatShips.getId()) {return false; }
        if (this.getItemsId() != thatShips.getItemsId()) {return false; }
        if (this.getHealth() != thatShips.getHealth()) {return false; }
        if (this.getSpeed() != thatShips.getSpeed()) {return false; }
        if (this.getCargo() != thatShips.getCargo()) {return false; }
        if (this.getBatteries() != thatShips.getBatteries()) {return false; }
        if (this.getRockets() != thatShips.getRockets()) {return false; }
        if (this.getLasers() != thatShips.getLasers()) {return false; }
        if (this.getHellstorms() != thatShips.getHellstorms()) {return false; }
        if (this.getGenerators() != thatShips.getGenerators()) {return false; }
        if (this.getExtras() != thatShips.getExtras()) {return false; }
        if (this.getGfx() != thatShips.getGfx()) {return false; }
        return true;
    }
    
    @Override
    public int hashCode() {
        int hash = 7;
        hash = 31 * hash + Integer.hashCode(getId());
        hash = 31 * hash + Integer.hashCode(getItemsId());
        hash = 31 * hash + Integer.hashCode(getHealth());
        hash = 31 * hash + Integer.hashCode(getSpeed());
        hash = 31 * hash + Integer.hashCode(getCargo());
        hash = 31 * hash + Integer.hashCode(getBatteries());
        hash = 31 * hash + Integer.hashCode(getRockets());
        hash = 31 * hash + Integer.hashCode(getLasers());
        hash = 31 * hash + Integer.hashCode(getHellstorms());
        hash = 31 * hash + Integer.hashCode(getGenerators());
        hash = 31 * hash + Integer.hashCode(getExtras());
        hash = 31 * hash + Integer.hashCode(getGfx());
        return hash;
    }
}