package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "galaxygates_stages_spawns", schema = "kalaazu", catalog = "")
public class GalaxygatesStagesSpawnsEntity {
    private int                     id;
    private GalaxygatesStagesEntity galaxygatesStagesByGalaxygatesStagesId;
    private GalaxygatesSpawnsEntity galaxygatesSpawnsByGalaxygatesSpawnsId;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        GalaxygatesStagesSpawnsEntity that = (GalaxygatesStagesSpawnsEntity) o;
        return id == that.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @ManyToOne
    @JoinColumn(name = "galaxygates_stages_id", referencedColumnName = "id", nullable = false)
    public GalaxygatesStagesEntity getGalaxygatesStagesByGalaxygatesStagesId() {
        return galaxygatesStagesByGalaxygatesStagesId;
    }

    public void setGalaxygatesStagesByGalaxygatesStagesId(
            GalaxygatesStagesEntity galaxygatesStagesByGalaxygatesStagesId
    ) {
        this.galaxygatesStagesByGalaxygatesStagesId = galaxygatesStagesByGalaxygatesStagesId;
    }

    @ManyToOne
    @JoinColumn(name = "galaxygates_spawns_id", referencedColumnName = "id", nullable = false)
    public GalaxygatesSpawnsEntity getGalaxygatesSpawnsByGalaxygatesSpawnsId() {
        return galaxygatesSpawnsByGalaxygatesSpawnsId;
    }

    public void setGalaxygatesSpawnsByGalaxygatesSpawnsId(
            GalaxygatesSpawnsEntity galaxygatesSpawnsByGalaxygatesSpawnsId
    ) {
        this.galaxygatesSpawnsByGalaxygatesSpawnsId = galaxygatesSpawnsByGalaxygatesSpawnsId;
    }
}
