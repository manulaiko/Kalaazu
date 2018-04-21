package com.manulaiko.kalaazu.persistence.database.entities;

import com.manulaiko.kalaazu.math.Vector2;

import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class MapsStation {
    private int id;

    private Integer mapsId;

    private Vector2 position;

    private Integer factionsId;

    private Map mapsByMapsId;

    private Faction factionsByFactionsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getMapsId() {
        return mapsId;
    }

    public void setMapsId(Integer mapsId) {
        this.mapsId = mapsId;
    }

    public Vector2 getPosition() {
        return position;
    }

    public void setPosition(Vector2 position) {
        this.position = position;
    }

    public Integer getFactionsId() {
        return factionsId;
    }

    public void setFactionsId(Integer factionsId) {
        this.factionsId = factionsId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        MapsStation that = (MapsStation) o;
        return id == that.id &&
               Objects.equals(mapsId, that.mapsId) &&
               Objects.equals(factionsId, that.factionsId);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, mapsId, factionsId);
    }

    public Map getMapsByMapsId() {
        return mapsByMapsId;
    }

    public void setMapsByMapsId(Map mapsByMapsId) {
        this.mapsByMapsId = mapsByMapsId;
    }

    public Faction getFactionsByFactionsId() {
        return factionsByFactionsId;
    }

    public void setFactionsByFactionsId(Faction factionsByFactionsId) {
        this.factionsByFactionsId = factionsByFactionsId;
    }
}
