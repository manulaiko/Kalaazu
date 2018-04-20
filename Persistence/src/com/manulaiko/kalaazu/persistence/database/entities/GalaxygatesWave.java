package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "galaxygates_waves", schema = "kalaazu")
public class GalaxygatesWave {
    private int id;

    private int mapsId;

    private int seconds;

    private int npcs;

    private Collection<Galaxygate> galaxygatesById;

    private Collection<GalaxygatesGgWaves> galaxygatesGgWavesById;

    private Collection<GalaxygatesStage> galaxygatesStagesById;

    private Map mapsByMapsId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "maps_id")
    public int getMapsId() {
        return mapsId;
    }

    public void setMapsId(int mapsId) {
        this.mapsId = mapsId;
    }

    @Basic
    @Column(name = "seconds")
    public int getSeconds() {
        return seconds;
    }

    public void setSeconds(int seconds) {
        this.seconds = seconds;
    }

    @Basic
    @Column(name = "npcs")
    public int getNpcs() {
        return npcs;
    }

    public void setNpcs(int npcs) {
        this.npcs = npcs;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        GalaxygatesWave that = (GalaxygatesWave) o;
        return id == that.id &&
               mapsId == that.mapsId &&
               seconds == that.seconds &&
               npcs == that.npcs;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, mapsId, seconds, npcs);
    }

    @OneToMany(mappedBy = "galaxygatesWavesByGalaxygatesWavesId")
    public Collection<Galaxygate> getGalaxygatesById() {
        return galaxygatesById;
    }

    public void setGalaxygatesById(
            Collection<Galaxygate> galaxygatesById
    ) {
        this.galaxygatesById = galaxygatesById;
    }

    @OneToMany(mappedBy = "galaxygatesWavesByGalaxygatesWavesId")
    public Collection<GalaxygatesGgWaves> getGalaxygatesGgWavesById() {
        return galaxygatesGgWavesById;
    }

    public void setGalaxygatesGgWavesById(
            Collection<GalaxygatesGgWaves> galaxygatesGgWavesById
    ) {
        this.galaxygatesGgWavesById = galaxygatesGgWavesById;
    }

    @OneToMany(mappedBy = "galaxygatesWavesByGalaxygatesWavesId")
    public Collection<GalaxygatesStage> getGalaxygatesStagesById() {
        return galaxygatesStagesById;
    }

    public void setGalaxygatesStagesById(
            Collection<GalaxygatesStage> galaxygatesStagesById
    ) {
        this.galaxygatesStagesById = galaxygatesStagesById;
    }

    @ManyToOne
    @JoinColumn(name = "maps_id", referencedColumnName = "id", nullable = false)
    public Map getMapsByMapsId() {
        return mapsByMapsId;
    }

    public void setMapsByMapsId(Map mapsByMapsId) {
        this.mapsByMapsId = mapsByMapsId;
    }
}
