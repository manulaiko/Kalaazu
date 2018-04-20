package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "galaxygates_gg_spins", schema = "kalaazu")
public class GalaxygatesGgSpin {
    private int id;

    private int galaxygatesId;

    private int galaxygatesSpinsId;

    private Galaxygate galaxygatesByGalaxygatesId;

    private GalaxygatesSpin galaxygatesSpinsByGalaxygatesSpinsId;

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
    @Column(name = "galaxygates_spins_id")
    public int getGalaxygatesSpinsId() {
        return galaxygatesSpinsId;
    }

    public void setGalaxygatesSpinsId(int galaxygatesSpinsId) {
        this.galaxygatesSpinsId = galaxygatesSpinsId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        GalaxygatesGgSpin that = (GalaxygatesGgSpin) o;
        return id == that.id &&
               galaxygatesId == that.galaxygatesId &&
               galaxygatesSpinsId == that.galaxygatesSpinsId;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, galaxygatesId, galaxygatesSpinsId);
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
    @JoinColumn(name = "galaxygates_spins_id", referencedColumnName = "id", nullable = false)
    public GalaxygatesSpin getGalaxygatesSpinsByGalaxygatesSpinsId() {
        return galaxygatesSpinsByGalaxygatesSpinsId;
    }

    public void setGalaxygatesSpinsByGalaxygatesSpinsId(
            GalaxygatesSpin galaxygatesSpinsByGalaxygatesSpinsId
    ) {
        this.galaxygatesSpinsByGalaxygatesSpinsId = galaxygatesSpinsByGalaxygatesSpinsId;
    }
}
