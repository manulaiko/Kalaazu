package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "galaxygates_stages_spawns", schema = "kalaazu")
public class GalaxygatesStagesSpawn {
    private int id;

    private int galaxygatesStagesId;

    private int galaxygatesSpawnsId;

    private GalaxygatesStage galaxygatesStagesByGalaxygatesStagesId;

    private GalaxygatesSpawn galaxygatesSpawnsByGalaxygatesSpawnsId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "galaxygates_stages_id")
    public int getGalaxygatesStagesId() {
        return galaxygatesStagesId;
    }

    public void setGalaxygatesStagesId(int galaxygatesStagesId) {
        this.galaxygatesStagesId = galaxygatesStagesId;
    }

    @Basic
    @Column(name = "galaxygates_spawns_id")
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

    @ManyToOne
    @JoinColumn(name = "galaxygates_stages_id", referencedColumnName = "id", nullable = false)
    public GalaxygatesStage getGalaxygatesStagesByGalaxygatesStagesId() {
        return galaxygatesStagesByGalaxygatesStagesId;
    }

    public void setGalaxygatesStagesByGalaxygatesStagesId(
            GalaxygatesStage galaxygatesStagesByGalaxygatesStagesId
    ) {
        this.galaxygatesStagesByGalaxygatesStagesId = galaxygatesStagesByGalaxygatesStagesId;
    }

    @ManyToOne
    @JoinColumn(name = "galaxygates_spawns_id", referencedColumnName = "id", nullable = false)
    public GalaxygatesSpawn getGalaxygatesSpawnsByGalaxygatesSpawnsId() {
        return galaxygatesSpawnsByGalaxygatesSpawnsId;
    }

    public void setGalaxygatesSpawnsByGalaxygatesSpawnsId(
            GalaxygatesSpawn galaxygatesSpawnsByGalaxygatesSpawnsId
    ) {
        this.galaxygatesSpawnsByGalaxygatesSpawnsId = galaxygatesSpawnsByGalaxygatesSpawnsId;
    }
}
