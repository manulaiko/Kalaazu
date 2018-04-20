package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "galaxygates_gg_waves", schema = "kalaazu")
public class GalaxygatesGgWaves {
    private int id;

    private int galaxygatesId;

    private int galaxygatesWavesId;

    private Galaxygate galaxygatesByGalaxygatesId;

    private GalaxygatesWave galaxygatesWavesByGalaxygatesWavesId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "galaxygates_id")
    public int getGalaxygatesId() {
        return galaxygatesId;
    }

    public void setGalaxygatesId(int galaxygatesId) {
        this.galaxygatesId = galaxygatesId;
    }

    @Basic
    @Column(name = "galaxygates_waves_id")
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

    @ManyToOne
    @JoinColumn(name = "galaxygates_id", referencedColumnName = "id", nullable = false)
    public Galaxygate getGalaxygatesByGalaxygatesId() {
        return galaxygatesByGalaxygatesId;
    }

    public void setGalaxygatesByGalaxygatesId(
            Galaxygate galaxygatesByGalaxygatesId
    ) {
        this.galaxygatesByGalaxygatesId = galaxygatesByGalaxygatesId;
    }

    @ManyToOne
    @JoinColumn(name = "galaxygates_waves_id", referencedColumnName = "id", nullable = false)
    public GalaxygatesWave getGalaxygatesWavesByGalaxygatesWavesId() {
        return galaxygatesWavesByGalaxygatesWavesId;
    }

    public void setGalaxygatesWavesByGalaxygatesWavesId(
            GalaxygatesWave galaxygatesWavesByGalaxygatesWavesId
    ) {
        this.galaxygatesWavesByGalaxygatesWavesId = galaxygatesWavesByGalaxygatesWavesId;
    }
}
