package com.manulaiko.kalaazu.persistence.database.entities;

import com.manulaiko.kalaazu.math.Vector2;

import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class MapsPortal {
    private int id;

    private int levelsId;

    private int mapsId;

    private Vector2 position;

    private int targetMapsId;

    private Vector2 targetPosition;

    private boolean isVisible;

    private boolean isWorking;

    private int gfx;

    private Map mapsByMapsId;

    private Map mapsByTargetMapsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLevelsId() {
        return levelsId;
    }

    public void setLevelsId(int levelsId) {
        this.levelsId = levelsId;
    }

    public int getMapsId() {
        return mapsId;
    }

    public void setMapsId(int mapsId) {
        this.mapsId = mapsId;
    }

    public Vector2 getPosition() {
        return position;
    }

    public void setPosition(Vector2 position) {
        this.position = position;
    }

    public int getTargetMapsId() {
        return targetMapsId;
    }

    public void setTargetMapsId(int targetMapsId) {
        this.targetMapsId = targetMapsId;
    }

    public Vector2 getTargetPosition() {
        return targetPosition;
    }

    public void setTargetPosition(Vector2 targetPosition) {
        this.targetPosition = targetPosition;
    }

    public boolean isVisible() {
        return isVisible;
    }

    public void setVisible(boolean visible) {
        isVisible = visible;
    }

    public boolean isWorking() {
        return isWorking;
    }

    public void setWorking(boolean working) {
        isWorking = working;
    }

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

    public Map getMapsByMapsId() {
        return mapsByMapsId;
    }

    public void setMapsByMapsId(Map mapsByMapsId) {
        this.mapsByMapsId = mapsByMapsId;
    }

    public Map getMapsByTargetMapsId() {
        return mapsByTargetMapsId;
    }

    public void setMapsByTargetMapsId(Map mapsByTargetMapsId) {
        this.mapsByTargetMapsId = mapsByTargetMapsId;
    }
}
