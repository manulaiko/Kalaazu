package com.manulaiko.kalaazu.persistence.database.entities;

import com.manulaiko.kalaazu.math.Vector2;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "maps_stations", schema = "kalaazu")
public class MapsStation {
    private int id;

    private Integer mapsId;

    private Vector2 position;

    private Integer factionsId;

    private Map mapsByMapsId;

    private Faction factionsByFactionsId;

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
    public Integer getMapsId() {
        return mapsId;
    }

    public void setMapsId(Integer mapsId) {
        this.mapsId = mapsId;
    }

    @Type(type = "point")
    @Column(name = "position")
    public Vector2 getPosition() {
        return position;
    }

    public void setPosition(Vector2 position) {
        this.position = position;
    }

    @Basic
    @Column(name = "factions_id")
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

    @ManyToOne
    @JoinColumn(name = "maps_id", referencedColumnName = "id")
    public Map getMapsByMapsId() {
        return mapsByMapsId;
    }

    public void setMapsByMapsId(Map mapsByMapsId) {
        this.mapsByMapsId = mapsByMapsId;
    }

    @ManyToOne
    @JoinColumn(name = "factions_id", referencedColumnName = "id")
    public Faction getFactionsByFactionsId() {
        return factionsByFactionsId;
    }

    public void setFactionsByFactionsId(Faction factionsByFactionsId) {
        this.factionsByFactionsId = factionsByFactionsId;
    }
}
