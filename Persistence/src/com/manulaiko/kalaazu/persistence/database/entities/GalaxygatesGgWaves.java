package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class GalaxygatesGgWaves {
    private int id;

    private int galaxygatesId;

    private int galaxygatesWavesId;

    private Galaxygate galaxygatesByGalaxygatesId;

    private GalaxygatesWave galaxygatesWavesByGalaxygatesWavesId;

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

    public int getGalaxygatesWavesId() {
        return galaxygatesWavesId;
    }

    public void setGalaxygatesWavesId(int galaxygatesWavesId) {
        this.galaxygatesWavesId = galaxygatesWavesId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        GalaxygatesGgWaves that = (GalaxygatesGgWaves) o;
        return id == that.id &&
               galaxygatesId == that.galaxygatesId &&
               galaxygatesWavesId == that.galaxygatesWavesId;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, galaxygatesId, galaxygatesWavesId);
    }

    public Galaxygate getGalaxygatesByGalaxygatesId() {
        return galaxygatesByGalaxygatesId;
    }

    public void setGalaxygatesByGalaxygatesId(
            Galaxygate galaxygatesByGalaxygatesId
    ) {
        this.galaxygatesByGalaxygatesId = galaxygatesByGalaxygatesId;
    }

    public GalaxygatesWave getGalaxygatesWavesByGalaxygatesWavesId() {
        return galaxygatesWavesByGalaxygatesWavesId;
    }

    public void setGalaxygatesWavesByGalaxygatesWavesId(
            GalaxygatesWave galaxygatesWavesByGalaxygatesWavesId
    ) {
        this.galaxygatesWavesByGalaxygatesWavesId = galaxygatesWavesByGalaxygatesWavesId;
    }
}
