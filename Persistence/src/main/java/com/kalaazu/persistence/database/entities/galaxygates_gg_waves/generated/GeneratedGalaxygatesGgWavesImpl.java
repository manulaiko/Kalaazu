package com.kalaazu.persistence.database.entities.galaxygates_gg_waves.generated;

import com.kalaazu.persistence.database.entities.Galaxygates;
import com.kalaazu.persistence.database.entities.GalaxygatesGgWaves;
import com.kalaazu.persistence.database.entities.GalaxygatesWaves;
import com.kalaazu.persistence.database.entities.Manager;
import com.speedment.common.annotation.GeneratedCode;

import java.util.Objects;
import java.util.StringJoiner;

/**
 * The generated base implementation of the {@link
 * GalaxygatesGgWaves}-interface.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedGalaxygatesGgWavesImpl implements GalaxygatesGgWaves {

    private short id;

    private byte galaxygatesId;

    private byte galaxygatesWavesId;

    protected GeneratedGalaxygatesGgWavesImpl() {

    }

    @Override
    public Short getId() {
        return id;
    }

    @Override
    public byte getGalaxygatesId() {
        return galaxygatesId;
    }

    @Override
    public byte getGalaxygatesWavesId() {
        return galaxygatesWavesId;
    }

    @Override
    public GalaxygatesGgWaves setId(short id) {
        this.id = id;
        return this;
    }

    @Override
    public GalaxygatesGgWaves setGalaxygatesId(byte galaxygatesId) {
        this.galaxygatesId = galaxygatesId;
        return this;
    }

    @Override
    public GalaxygatesGgWaves setGalaxygatesWavesId(byte galaxygatesWavesId) {
        this.galaxygatesWavesId = galaxygatesWavesId;
        return this;
    }

    @Override
    public Galaxygates findGalaxygatesId(Manager<Galaxygates> foreignManager) {
        return foreignManager.stream()
                             .filter(Galaxygates.ID.equal(getGalaxygatesId()))
                             .findAny()
                             .orElse(null);
    }

    @Override
    public GalaxygatesWaves findGalaxygatesWavesId(Manager<GalaxygatesWaves> foreignManager) {
        return foreignManager.stream()
                             .filter(GalaxygatesWaves.ID.equal(getGalaxygatesWavesId()))
                             .findAny()
                             .orElse(null);
    }

    @Override
    public String toString() {
        final StringJoiner sj = new StringJoiner(", ", "{ ", " }");
        sj.add("id = " + Objects.toString(getId()));
        sj.add("galaxygatesId = " + Objects.toString(getGalaxygatesId()));
        sj.add("galaxygatesWavesId = " + Objects.toString(getGalaxygatesWavesId()));
        return "GalaxygatesGgWavesImpl " + sj.toString();
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (!(that instanceof GalaxygatesGgWaves)) {
            return false;
        }
        final GalaxygatesGgWaves thatGalaxygatesGgWaves = (GalaxygatesGgWaves) that;
        if (this.getId() != thatGalaxygatesGgWaves.getId()) {
            return false;
        }
        if (this.getGalaxygatesId() != thatGalaxygatesGgWaves.getGalaxygatesId()) {
            return false;
        }
        if (this.getGalaxygatesWavesId() != thatGalaxygatesGgWaves.getGalaxygatesWavesId()) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 31 * hash + Short.hashCode(getId());
        hash = 31 * hash + Byte.hashCode(getGalaxygatesId());
        hash = 31 * hash + Byte.hashCode(getGalaxygatesWavesId());
        return hash;
    }
}