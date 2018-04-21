package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class GalaxygatesStagesSpawn {
    private int id;

    private int galaxygatesStagesId;

    private int galaxygatesSpawnsId;

    private GalaxygatesStage galaxygatesStagesByGalaxygatesStagesId;

    private GalaxygatesSpawn galaxygatesSpawnsByGalaxygatesSpawnsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGalaxygatesStagesId() {
        return galaxygatesStagesId;
    }

    public void setGalaxygatesStagesId(int galaxygatesStagesId) {
        this.galaxygatesStagesId = galaxygatesStagesId;
    }

    public int getGalaxygatesSpawnsId() {
        return galaxygatesSpawnsId;
    }

    public void setGalaxygatesSpawnsId(int galaxygatesSpawnsId) {
        this.galaxygatesSpawnsId = galaxygatesSpawnsId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        GalaxygatesStagesSpawn that = (GalaxygatesStagesSpawn) o;
        return id == that.id &&
               galaxygatesStagesId == that.galaxygatesStagesId &&
               galaxygatesSpawnsId == that.galaxygatesSpawnsId;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, galaxygatesStagesId, galaxygatesSpawnsId);
    }

    public GalaxygatesStage getGalaxygatesStagesByGalaxygatesStagesId() {
        return galaxygatesStagesByGalaxygatesStagesId;
    }

    public void setGalaxygatesStagesByGalaxygatesStagesId(
            GalaxygatesStage galaxygatesStagesByGalaxygatesStagesId
    ) {
        this.galaxygatesStagesByGalaxygatesStagesId = galaxygatesStagesByGalaxygatesStagesId;
    }

    public GalaxygatesSpawn getGalaxygatesSpawnsByGalaxygatesSpawnsId() {
        return galaxygatesSpawnsByGalaxygatesSpawnsId;
    }

    public void setGalaxygatesSpawnsByGalaxygatesSpawnsId(
            GalaxygatesSpawn galaxygatesSpawnsByGalaxygatesSpawnsId
    ) {
        this.galaxygatesSpawnsByGalaxygatesSpawnsId = galaxygatesSpawnsByGalaxygatesSpawnsId;
    }
}
