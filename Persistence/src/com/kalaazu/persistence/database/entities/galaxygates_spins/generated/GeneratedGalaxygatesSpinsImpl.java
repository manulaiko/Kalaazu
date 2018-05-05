package com.kalaazu.persistence.database.entities.galaxygates_spins.generated;

import com.kalaazu.persistence.database.entities.GalaxygatesSpins;
import com.kalaazu.persistence.database.entities.Items;
import com.kalaazu.persistence.database.mappers.GalaxyGateProbabilityType;
import com.speedment.common.annotation.GeneratedCode;
import com.kalaazu.persistence.database.entities.Manager;

import java.util.Objects;
import java.util.StringJoiner;

/**
 * The generated base implementation of the {@link
 * GalaxygatesSpins}-interface.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedGalaxygatesSpinsImpl implements GalaxygatesSpins {

    private byte                      id;

    private GalaxyGateProbabilityType type;

    private double                    probability;

    private short                     itemsId;

    private short                     amount;

    protected GeneratedGalaxygatesSpinsImpl() {

    }

    @Override
    public Byte getId() {
        return id;
    }

    @Override
    public GalaxyGateProbabilityType getType() {
        return type;
    }

    @Override
    public double getProbability() {
        return probability;
    }

    @Override
    public short getItemsId() {
        return itemsId;
    }

    @Override
    public short getAmount() {
        return amount;
    }

    @Override
    public GalaxygatesSpins setId(byte id) {
        this.id = id;
        return this;
    }

    @Override
    public GalaxygatesSpins setType(GalaxyGateProbabilityType type) {
        this.type = type;
        return this;
    }

    @Override
    public GalaxygatesSpins setProbability(double probability) {
        this.probability = probability;
        return this;
    }

    @Override
    public GalaxygatesSpins setItemsId(short itemsId) {
        this.itemsId = itemsId;
        return this;
    }

    @Override
    public GalaxygatesSpins setAmount(short amount) {
        this.amount = amount;
        return this;
    }

    @Override
    public Items findItemsId(Manager<Items> foreignManager) {
        return foreignManager.stream()
                             .filter(Items.ID.equal(getItemsId()))
                             .findAny()
                             .orElse(null);
    }

    @Override
    public String toString() {
        final StringJoiner sj = new StringJoiner(", ", "{ ", " }");
        sj.add("id = " + Objects.toString(getId()));
        sj.add("type = " + Objects.toString(getType()));
        sj.add("probability = " + Objects.toString(getProbability()));
        sj.add("itemsId = " + Objects.toString(getItemsId()));
        sj.add("amount = " + Objects.toString(getAmount()));
        return "GalaxygatesSpinsImpl " + sj.toString();
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (!(that instanceof GalaxygatesSpins)) {
            return false;
        }
        final GalaxygatesSpins thatGalaxygatesSpins = (GalaxygatesSpins) that;
        if (this.getId() != thatGalaxygatesSpins.getId()) {
            return false;
        }
        if (!Objects.equals(this.getType(), thatGalaxygatesSpins.getType())) {
            return false;
        }
        if (this.getProbability() != thatGalaxygatesSpins.getProbability()) {
            return false;
        }
        if (this.getItemsId() != thatGalaxygatesSpins.getItemsId()) {
            return false;
        }
        if (this.getAmount() != thatGalaxygatesSpins.getAmount()) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 31 * hash + Byte.hashCode(getId());
        hash = 31 * hash + Objects.hashCode(getType());
        hash = 31 * hash + Double.hashCode(getProbability());
        hash = 31 * hash + Short.hashCode(getItemsId());
        hash = 31 * hash + Short.hashCode(getAmount());
        return hash;
    }
}