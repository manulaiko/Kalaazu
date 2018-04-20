package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "maps_portals", schema = "kalaazu")
public class MapsPortal {
    private int id;

    private int levelsId;

    private int mapsId;

    private int targetMapsId;

    private boolean isVisible;

    private boolean isWorking;

    private int gfx;

    private Map mapsByMapsId;

    private Map mapsByTargetMapsId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "levels_id")
    public int getLevelsId() {
        return levelsId;
    }

    public void setLevelsId(int levelsId) {
        this.levelsId = levelsId;
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
    @Column(name = "target_maps_id")
    public int getTargetMapsId() {
        return targetMapsId;
    }

    public void setTargetMapsId(int targetMapsId) {
        this.targetMapsId = targetMapsId;
    }

    @Basic
    @Column(name = "is_visible")
    public boolean isVisible() {
        return isVisible;
    }

    public void setVisible(boolean visible) {
        isVisible = visible;
    }

    @Basic
    @Column(name = "is_working")
    public boolean isWorking() {
        return isWorking;
    }

    public void setWorking(boolean working) {
        isWorking = working;
    }

    @Basic
    @Column(name = "gfx")
    public int getGfx() {
        return gfx;
    }

    public void setGfx(int gfx) {
        this.gfx = gfx;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        MapsPortal that = (MapsPortal) o;
        return id == that.id &&
               levelsId == that.levelsId &&
               mapsId == that.mapsId &&
               targetMapsId == that.targetMapsId &&
               isVisible == that.isVisible &&
               isWorking == that.isWorking &&
               gfx == that.gfx;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, levelsId, mapsId, targetMapsId, isVisible, isWorking, gfx);
    }

    @ManyToOne
    @JoinColumn(name = "maps_id", referencedColumnName = "id", nullable = false)
    public Map getMapsByMapsId() {
        return mapsByMapsId;
    }

    public void setMapsByMapsId(Map mapsByMapsId) {
        this.mapsByMapsId = mapsByMapsId;
    }

    @ManyToOne
    @JoinColumn(name = "target_maps_id", referencedColumnName = "id", nullable = false)
    public Map getMapsByTargetMapsId() {
        return mapsByTargetMapsId;
    }

    public void setMapsByTargetMapsId(Map mapsByTargetMapsId) {
        this.mapsByTargetMapsId = mapsByTargetMapsId;
    }
}
