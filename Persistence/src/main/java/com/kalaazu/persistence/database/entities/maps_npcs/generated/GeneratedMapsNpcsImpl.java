package com.kalaazu.persistence.database.entities.maps_npcs.generated;

import com.kalaazu.persistence.database.entities.Manager;
import com.kalaazu.persistence.database.entities.Maps;
import com.kalaazu.persistence.database.entities.MapsNpcs;
import com.kalaazu.persistence.database.entities.Npcs;
import com.speedment.common.annotation.GeneratedCode;

import java.util.Objects;
import java.util.StringJoiner;

/**
 * The generated base implementation of the {@link
 * MapsNpcs}-interface.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedMapsNpcsImpl implements MapsNpcs {

    private byte id;

    private byte mapsId;

    private byte npcsId;

    private byte amount;

    protected GeneratedMapsNpcsImpl() {

    }

    @Override
    public Byte getId() {
        return id;
    }

    @Override
    public byte getMapsId() {
        return mapsId;
    }

    @Override
    public byte getNpcsId() {
        return npcsId;
    }

    @Override
    public byte getAmount() {
        return amount;
    }

    @Override
    public MapsNpcs setId(byte id) {
        this.id = id;
        return this;
    }

    @Override
    public MapsNpcs setMapsId(byte mapsId) {
        this.mapsId = mapsId;
        return this;
    }

    @Override
    public MapsNpcs setNpcsId(byte npcsId) {
        this.npcsId = npcsId;
        return this;
    }

    @Override
    public MapsNpcs setAmount(byte amount) {
        this.amount = amount;
        return this;
    }

    @Override
    public Maps findMapsId(Manager<Maps> foreignManager) {
        return foreignManager.stream()
                             .filter(Maps.ID.equal(getMapsId()))
                             .findAny()
                             .orElse(null);
    }

    @Override
    public Npcs findNpcsId(Manager<Npcs> foreignManager) {
        return foreignManager.stream()
                             .filter(Npcs.ID.equal(getNpcsId()))
                             .findAny()
                             .orElse(null);
    }

    @Override
    public String toString() {
        final StringJoiner sj = new StringJoiner(", ", "{ ", " }");
        sj.add("id = " + Objects.toString(getId()));
        sj.add("mapsId = " + Objects.toString(getMapsId()));
        sj.add("npcsId = " + Objects.toString(getNpcsId()));
        sj.add("amount = " + Objects.toString(getAmount()));
        return "MapsNpcsImpl " + sj.toString();
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (!(that instanceof MapsNpcs)) {
            return false;
        }
        final MapsNpcs thatMapsNpcs = (MapsNpcs) that;
        if (this.getId() != thatMapsNpcs.getId()) {
            return false;
        }
        if (this.getMapsId() != thatMapsNpcs.getMapsId()) {
            return false;
        }
        if (this.getNpcsId() != thatMapsNpcs.getNpcsId()) {
            return false;
        }
        if (this.getAmount() != thatMapsNpcs.getAmount()) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 31 * hash + Byte.hashCode(getId());
        hash = 31 * hash + Byte.hashCode(getMapsId());
        hash = 31 * hash + Byte.hashCode(getNpcsId());
        hash = 31 * hash + Byte.hashCode(getAmount());
        return hash;
    }
}