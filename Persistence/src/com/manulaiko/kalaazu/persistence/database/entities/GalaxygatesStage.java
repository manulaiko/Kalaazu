package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class GalaxygatesStage {
    private int id;

    private int galaxygatesWavesId;

    private String comment;

    private GalaxygatesWave galaxygatesWavesByGalaxygatesWavesId;

    private Collection<GalaxygatesStagesSpawn> galaxygatesStagesSpawnsById;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGalaxygatesWavesId() {
        return galaxygatesWavesId;
    }

    public void setGalaxygatesWavesId(int galaxygatesWavesId) {
        this.galaxygatesWavesId = galaxygatesWavesId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        GalaxygatesStage that = (GalaxygatesStage) o;
        return id == that.id &&
               galaxygatesWavesId == that.galaxygatesWavesId &&
               Objects.equals(comment, that.comment);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, galaxygatesWavesId, comment);
    }

    public GalaxygatesWave getGalaxygatesWavesByGalaxygatesWavesId() {
        return galaxygatesWavesByGalaxygatesWavesId;
    }

    public void setGalaxygatesWavesByGalaxygatesWavesId(
            GalaxygatesWave galaxygatesWavesByGalaxygatesWavesId
    ) {
        this.galaxygatesWavesByGalaxygatesWavesId = galaxygatesWavesByGalaxygatesWavesId;
    }

    public Collection<GalaxygatesStagesSpawn> getGalaxygatesStagesSpawnsById() {
        return galaxygatesStagesSpawnsById;
    }

    public void setGalaxygatesStagesSpawnsById(
            Collection<GalaxygatesStagesSpawn> galaxygatesStagesSpawnsById
    ) {
        this.galaxygatesStagesSpawnsById = galaxygatesStagesSpawnsById;
    }
}
